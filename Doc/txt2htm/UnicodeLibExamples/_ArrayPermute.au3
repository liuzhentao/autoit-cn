﻿; *****************************************************************************
; 返回一个数组中所有元素的排列方式
; 示例 1 声明一个一维数组,返回一个数组排列
; *****************************************************************************

#include <Array.au3>

Local $aArray[4] = [1, 2, 3, 4]
Local $aNewArray = _ArrayPermute($aArray, ",") ;使用默认参数
_ArrayDisplay($aNewArray, "Array Permuted")