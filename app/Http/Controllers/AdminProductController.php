<?php

namespace App\Http\Controllers;

use App\Category;
use App\Components\Recusive;
use App\Http\Requests\ProductAddRequest;
use App\Product;
use App\ProductImage;
use App\ProductTag;
use App\Tag;
use App\Traits\DeleteModelTrait;
use App\Traits\StorageImageTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use DB;
class AdminProductController extends Controller
{
    //
    use StorageImageTrait, DeleteModelTrait;
    private $category;
    private $product;
    private $productImg;
    private $tag;
    private $prodTag;

    public function __construct(Category $category, Product $product, ProductImage $productImg, Tag $tag, ProductTag $prodTag)
    {
        $this->category = $category;
        $this->product = $product;
        $this->productImg = $productImg;
        $this->tag = $tag;
        $this->prodTag = $prodTag;
    }

    public function index()
    {
        $products = $this->product->latest()->paginate(5);
        return view('backend.admin.product.index',compact('products'));
    }

    public function create()
    {
        $htmlOption = $this->getCategory($parent_id = '');
        return view('backend.admin.product.add', compact('htmlOption'));
    }



    public function store(ProductAddRequest $request)
    {
        try {
            DB::beginTransaction();
            $dataProductCreate = [
                'name' => $request->name,
                'price' => $request->price,
                'content' => $request->contents,
                'user_id' => auth()->id(),
                'category_id' => $request->category_id,


            ];
            $dataUploadFeatureImage = $this->storageTraitUpload($request, 'feature_image_path', 'product');
            if (!empty($dataUploadFeatureImage)) {
                $dataProductCreate['feature_image_name'] = $dataUploadFeatureImage['file_name'];
                $dataProductCreate['feature_image_path'] = $dataUploadFeatureImage['file_path'];
            }
            $product = $this->product->create($dataProductCreate);
            //Insert data  to product_images
            if ($request->hasFile('image_path')) {
                foreach ($request->image_path as $fileItem) {
                    $dataProductImageDetail = $this->storageTraitUploadMultiple($fileItem, 'product');
                    $product->images()->create([
                        'image_path' => $dataProductImageDetail['file_path'],
                        'image_name' => $dataProductImageDetail['file_name'],
                    ]);
                }
            }

            //insert tags for product
            if (!empty($request->tags)){
                foreach ($request->tags as $tagItem) {
                    // insert to tags
                    $tagIntance = $this->tag->firstOrCreate(['name' => $tagItem]);
                    $tagIds[] = $tagIntance->id;
                }
            }else{
                $tagIds = null;
            }
            $product->tags()->attach($tagIds);
            DB::commit();
            return redirect()->route('product.index');
        } catch (\Exception $exception) {
            DB::rollback();
            Log::error('message' . $exception->getMessage() . ' Line: ' . $exception->getLine());
        }

    }
    public function edit($id){
        $product = $this->product->find($id);
        $htmlOption = $this->getCategory($product->category_id);
        return view('backend.admin.product.edit',compact('htmlOption','product'));
    }

    public function update(Request $request,$id){
        try {
            DB::beginTransaction();
            $dataProductUpdate = [
                'name' => $request->name,
                'price' => $request->price,
                'content' => $request->contents,
                'user_id' => auth()->id(),
                'category_id' => $request->category_id,


            ];
            $dataUploadFeatureImage = $this->storageTraitUpload($request, 'feature_image_path', 'product');
            if (!empty($dataUploadFeatureImage)) {
                $dataProductUpdate['feature_image_name'] = $dataUploadFeatureImage['file_name'];
                $dataProductUpdate['feature_image_path'] = $dataUploadFeatureImage['file_path'];
            }
            $product = $this->product->find($id)->update($dataProductUpdate);
            $product = $this->product->find($id);

            //Inseart data  to product_images
            if ($request->hasFile('image_path')) {
                $this->productImg->where('product_id',$id)->delete();
                foreach ($request->image_path as $fileItem) {
                    $dataProductImageDetail = $this->storageTraitUploadMultiple($fileItem, 'product');
                    $product->images()->create([
                        'image_path' => $dataProductImageDetail['file_path'],
                        'image_name' => $dataProductImageDetail['file_name'],
                    ]);
                }
            }

            //insert tags for product
            if (!empty($request->tags)){
                foreach ($request->tags as $tagItem) {
                    // insert to tags
                    $tagIntance = $this->tag->firstOrCreate(['name' => $tagItem]);
                    $tagIds[] = $tagIntance->id;
                }
            }else{
                $tagIds = null;
            }
            $product->tags()->sync($tagIds);
            DB::commit();
            return redirect()->route('product.index');
        } catch (\Exception $exception) {
            DB::rollback();
            Log::error('message' . $exception->getMessage() . 'Line: ' . $exception->getLine());
        }
    }
    public function delete($id){
        return $this->deleteModelTrait($id,$this->product);
    }

    public function getCategory($parent_id)
    {
        $data = $this->category->all();
        $recusive = new Recusive($data);
        $htmlOption = $recusive->categoryRecusive($parent_id);
        return $htmlOption;
    }

}
