<?php

namespace App\Policies;

use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class OrderPolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function view(User $user)
    {
        //

        return $user->checkPermissionAccess('order_list');
    }
    public function delete(User $user)
    {
        //
        return $user->checkPermissionAccess('order_delete');
    }
}
