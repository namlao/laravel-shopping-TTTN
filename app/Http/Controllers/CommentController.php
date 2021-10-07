<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Traits\DeleteModelTrait;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    //
    use DeleteModelTrait;
    private $comment;
    public function __construct(Comment $comment)
    {
        $this->comment = $comment;
    }

    public function index(){
        $comments = $this->comment->paginate(12);
        return view('backend.admin.comment.index',compact('comments'));
    }
    public function delete($id){
        return $this->deleteModelTrait($id,$this->comment);
    }



}
