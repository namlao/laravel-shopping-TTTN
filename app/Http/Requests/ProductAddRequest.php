<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductAddRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            //
            'name' => 'required|unique:products|max:255|min:10',
            'price' =>'required',
            'category_id' => 'required',
            'contents' => 'required'
        ];
    }
    public function messages()
    {
        return [
            'name.required' => 'Tên bắt buộc',
            'name.unique' => 'Tên trùng',
            'name.max' => 'Tên không được phép quá 255 ký tự',
            'name.min' => 'Tên không được phép dưới 10 ký tự',
            'price.required'  => 'Giá bắt buộc',
            'category_id.required'  => 'Danh mục bắt buộc',
            'contents.required'  => 'Nội dung bắt buộc',
        ];
    }

}
