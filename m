Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BFF1D63C6
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 08:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756419; cv=none; b=MNhwAOnBp+cxZnbRQ0UiZrvLLUzYn40uOngGN25U0ShQ7ZbiZMBjcYCGlP7bdKbdzuyNYK9+x9OJLg9qvp6dxcnKDHyN59Q3mj9deTd9hH9s9tMG+QMNaVyTMZ/nZ0yLKJ+cJqNuBy0f3ft1iDJtR6zcGnjZlT66pfBD/V16ggk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756419; c=relaxed/simple;
	bh=s6AyaU5EBLASfM9cSYfDutyg0zd30BNi3R50hPDOjEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JAt6hvumMH8x8dcS/eHsnaTENDjtjnAzTtPkoHQJjuWSYYTxUYIqYMFPOW6UghOqto98an0SenNBK44HoWi3wbRLlJytAf2WbrDy5RnJ5lAm37QjlW4UJjGeK7eeqN49j+WfMhNmUiy7B8846ldh1UEHQcUQnBzdqK01aTHtYb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=feORCarG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="feORCarG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743756417; x=1775292417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s6AyaU5EBLASfM9cSYfDutyg0zd30BNi3R50hPDOjEc=;
  b=feORCarGVKvEQn1shvUfTysJdm0y4538ALXt9v5XSap0tBx4yu6h47/B
   nLpiigzUjZPqlXpmeixaNGRo7MofAsqNV7+NRe1C9R0QpSqNvTWemioh/
   UYYX7aZbXvFJFizXCQ2b2bhapcvgzzM1OJiVm2Cq7266OYNruqz79HRGx
   ho7DsdER8MZFfMVBStkIxtYQ3ZNIVd6uNj0X4NbNHLA+MFgyrxpdl2cgA
   4KLr5hEuszCtp0qF/tPIq/WM/mS/KCSzvQMZTAoTxnKvRGd0BfNeqX5r0
   6d97Y5u+dDgYN3HYrFDdTohMigdgdRWyGxqAUgsvoMVqBsKI2AKTABHLV
   g==;
X-CSE-ConnectionGUID: a9FCuzHQT7qGnkqROifwyA==
X-CSE-MsgGUID: SK1ud3XeRh+9yhWRDx8Kqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55854600"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="55854600"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 01:46:57 -0700
X-CSE-ConnectionGUID: wAJKmppJTR2WuWMv7ubnCg==
X-CSE-MsgGUID: PkJy3CiPSZytx3txN32Hyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="164464259"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 04 Apr 2025 01:46:55 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 6/8] ASoC: Intel: avs: Assign unique ID to platform devices
Date: Fri,  4 Apr 2025 11:03:35 +0200
Message-Id: <20250404090337.3564117-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404090337.3564117-1-cezary.rojewski@intel.com>
References: <20250404090337.3564117-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

When creating machine boards there are two types, per endpoint or
compound board. For compound board we can just use I2S mask as its ID,
however, per endpoint can also be separated per TDM, which causes
problem because two boards would have same I2S mask. Shift it and add
the value of TDM to generate a unique ID.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/board_selection.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 30444b67dd91..286d94df5f46 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -448,6 +448,7 @@ static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach
 	int num_ssps;
 	char *name;
 	int ret;
+	int uid;
 
 	num_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
 	if (fls(mach->mach_params.i2s_link_mask) > num_ssps) {
@@ -457,8 +458,11 @@ static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach
 		return -ENODEV;
 	}
 
-	name = devm_kasprintf(adev->dev, GFP_KERNEL, "%s.%d-platform", mach->drv_name,
-			      mach->mach_params.i2s_link_mask);
+	uid = mach->mach_params.i2s_link_mask;
+	if (avs_mach_singular_ssp(mach))
+		uid = (uid << AVS_CHANNELS_MAX) + avs_mach_ssp_tdm(mach, avs_mach_ssp_port(mach));
+
+	name = devm_kasprintf(adev->dev, GFP_KERNEL, "%s.%d-platform", mach->drv_name, uid);
 	if (!name)
 		return -ENOMEM;
 
@@ -468,7 +472,7 @@ static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach
 
 	mach->mach_params.platform = name;
 
-	board = platform_device_register_data(NULL, mach->drv_name, mach->mach_params.i2s_link_mask,
+	board = platform_device_register_data(NULL, mach->drv_name, uid,
 					      (const void *)mach, sizeof(*mach));
 	if (IS_ERR(board)) {
 		dev_err(adev->dev, "ssp board register failed\n");
-- 
2.25.1

