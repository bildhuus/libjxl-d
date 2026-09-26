// Copyright (c) the JPEG XL Project Authors. All rights reserved.
//
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
module jxl.cms;

public import jxl.cms_interface;

extern (C):

// ICC profiles and color space conversions.

const(JxlCmsInterface)* JxlGetDefaultCms ();

// JXL_CMS_H_
