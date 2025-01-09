Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B4F216E3E
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424495; cv=none; b=aQaYvm0wv4LlF4QrBnt8TZlKeIujkqNXwXumElLIjZWBAOMtuo4WLt8MqKa2ZIw7htOoiRv8/5pDGlOf5BtY/R9qd0sVEEdBn9c1aanZe7rDhsOWF1rcPjJ6OjMC5eRDL+tBZvXTlRaPFT67RkpcXFoIX2UnS4bDrGCTECzXM+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424495; c=relaxed/simple;
	bh=nj5BKZOSU/j2hFYzWQfRSHW43/gnCeYMukwnbrezu14=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cYj+iStaRcShTysdaxBpRLQhrEJ04cpoqZ6VglW4zEhTPXhUcEhxj+O2CxBL/4rkCaeyfNRy4PUqzQxHnaLQjhsIyzRpdc0kUOBCrAd08pXVvfb1uz96u/6BdZlc8jds4MzG+L2OP96QMtUE4HlQhEMZ2LbsmYkO+USI6aAO59Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxOyQATL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxOyQATL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736424494; x=1767960494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nj5BKZOSU/j2hFYzWQfRSHW43/gnCeYMukwnbrezu14=;
  b=fxOyQATLkVkJN0sIQaDgrdyFyIrDueP3vIYJwQbiIvKP0zrNBjpLcZRQ
   90OS6cKzxq5+cVFAKF5ZUK8uur+WgAyiB6MYnT3EHbzHNKNQ902vZxm8K
   J8eADNhn9icD/IN2ukV7Ad+/wU6ReM2uuBnb/GsM6iGW8d/Kz0k1+9oRA
   6o/VTdZ3ERq8fyWAJs3kFHef1rS6LucqAwnnYdi3+dS0gnTIC0IRNGcOc
   Tuqq0vD/RkEvXeJYrFrKb6JQlOi8143AVQ5Ph+4RmDJcd1ATLEeW6Op5L
   HELnQ3zo1jaCz9u1RqeaqOAXIWKM+/OUB8428+4T4yUNUZdoCv8upLYQp
   g==;
X-CSE-ConnectionGUID: 42OmZLEPT4KlKk30iTuhNQ==
X-CSE-MsgGUID: ja/qh04pSoy0s/LXrRbhzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47179560"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="47179560"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:08:14 -0800
X-CSE-ConnectionGUID: gimiaQFqS+mxqsXDH9VPXQ==
X-CSE-MsgGUID: wzSKHWsYRVO3YlUtVInc2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140710281"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 04:08:11 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 02/13] ASoC: Intel: avs: Fix the minimum firmware version numbers
Date: Thu,  9 Jan 2025 13:22:05 +0100
Message-Id: <20250109122216.3667847-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109122216.3667847-1-cezary.rojewski@intel.com>
References: <20250109122216.3667847-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For few TGL-based platforms the minor version number for AudioDSP
firmware is incorrect forcing users to utilize ignore_fw_version module
parameter.

Fixes: 5acb19ecd198 ("ASoC: Intel: avs: TGL-based platforms support")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 73d4bde9b2f7..82839d0994ee 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -829,10 +829,10 @@ static const struct avs_spec jsl_desc = {
 	.hipc = &cnl_hipc_spec,
 };
 
-#define AVS_TGL_BASED_SPEC(sname)		\
+#define AVS_TGL_BASED_SPEC(sname, min)		\
 static const struct avs_spec sname##_desc = {	\
 	.name = #sname,				\
-	.min_fw_version = { 10,	29, 0, 5646 },	\
+	.min_fw_version = { 10,	min, 0, 5646 },	\
 	.dsp_ops = &avs_tgl_dsp_ops,		\
 	.core_init_mask = 1,			\
 	.attributes = AVS_PLATATTR_IMR,		\
@@ -840,11 +840,11 @@ static const struct avs_spec sname##_desc = {	\
 	.hipc = &cnl_hipc_spec,			\
 }
 
-AVS_TGL_BASED_SPEC(lkf);
-AVS_TGL_BASED_SPEC(tgl);
-AVS_TGL_BASED_SPEC(ehl);
-AVS_TGL_BASED_SPEC(adl);
-AVS_TGL_BASED_SPEC(adl_n);
+AVS_TGL_BASED_SPEC(lkf, 28);
+AVS_TGL_BASED_SPEC(tgl, 29);
+AVS_TGL_BASED_SPEC(ehl, 30);
+AVS_TGL_BASED_SPEC(adl, 35);
+AVS_TGL_BASED_SPEC(adl_n, 35);
 
 static const struct pci_device_id avs_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_SKL_LP, &skl_desc) },
-- 
2.25.1

