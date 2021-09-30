<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SliderAddRequest extends FormRequest
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
            'name' => 'required|unique:slides|max:255',
            'description' => 'required',
            'image_path' => 'required',
        ];
    }

    public function messages()
    {
        return [
            //
            'name.required' => 'Tên là bắt buộc',
            'name.unique' => 'Tên đã bị trùng',
            'name.max' => 'Tên tối đa là 255 ký tự',
            'description.required' => 'Mô tả là bắt buộc',
            'image_path.required' => 'Hình ảnh là bắt buộc',
        ];
    }
}
