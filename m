Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D8B1D47AD
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 08:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756418; cv=none; b=Ioh8PmaJc/NHgXswXAmufhZRmgyHyxw6hXeGNTFgfNyk0m2KxzhCLOujFiYwXzpCrd9ye9dO4EcnEXbJdRjI9hOBWCP8QhUzZ56a2TzemxhhZVRKWUYvEwt3/45BidrXSJnT4O1ilVNScITQF56jAY40oIaXLWUL4/Pmm++upCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756418; c=relaxed/simple;
	bh=LoAaiWwW6ncYtSYrnNbitXF+PS1/owY0LVFLaaBhkHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qgt5s2IyVGkXXqAK2dViLMcuhouJYepSurZWBvubRf37NZSkQe+b3zd6jCISveeYr3rTJrdz3uRrKWBLLEmBYvJPi+2Z/OaPEtVhct+1uHi0qp+o15I5kuIP9CQD5WzqDn8BnqVGsFIM5jG+1bxxFsf3ylrnFjEwmwvSWsKBgbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jiNc/PU0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jiNc/PU0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743756416; x=1775292416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LoAaiWwW6ncYtSYrnNbitXF+PS1/owY0LVFLaaBhkHs=;
  b=jiNc/PU09f7K7nupzfC36z3vLdIFAlfVhsku59bp0G39Qypc9UYNZzuf
   VSJkcmP5+TEohVU3fvt+usL1M1RT60AWmGHQaq8GLpdpC/+yEpZgBhPtj
   hl8y0COlKPVoXh4pHIk0rBBKfU7XbrHrTwAMwaTu+Hx6jeaHna4RyEdWd
   LZT+On4yankG3CXkHULUV/0dX9Mw8lGtxUIJZADRis5wNmdFWQIDm9VMg
   edG1rKn1npTKD6ClkTh+5EB3tdodjIEHlF0JwnfY2SW4Ha1C2X4LjiuUL
   iV7MJ38sluAwAEJwxY1IKFLfNuyUKrGIuk6/r0pIGmXaOcW20MJ/oFN6Z
   w==;
X-CSE-ConnectionGUID: Vbp+izQ+RO2vYwQqXicUeg==
X-CSE-MsgGUID: /gh7PHzUTYWG5Nt1Iu2ieg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55854594"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="55854594"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 01:46:55 -0700
X-CSE-ConnectionGUID: 2pbDLjKWTX+hOB5/04ORrA==
X-CSE-MsgGUID: Jj/2wqcSQbKC81VImVQIwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="164464251"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 04 Apr 2025 01:46:53 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 5/8] ASoC: Intel: avs: Allow to specify custom configurations with i2s_test
Date: Fri,  4 Apr 2025 11:03:34 +0200
Message-Id: <20250404090337.3564117-6-cezary.rojewski@intel.com>
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

Change 'i2s_test' module option from enable-flag to string allowing to
specify which SSP port and in what TDM configuration should be enabled.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/board_selection.c | 134 +++++++++++++-------------
 1 file changed, 68 insertions(+), 66 deletions(-)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 2d706edcbf92..30444b67dd91 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -17,10 +17,11 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-component.h>
 #include "avs.h"
+#include "utils.h"
 
-static bool i2s_test;
-module_param(i2s_test, bool, 0444);
-MODULE_PARM_DESC(i2s_test, "Probe I2S test-board and skip all other I2S boards");
+static char *i2s_test;
+module_param(i2s_test, charp, 0444);
+MODULE_PARM_DESC(i2s_test, "Use I2S test-board instead of ACPI, i2s_test=ssp0tdm,ssp1tdm,... 0 to ignore port");
 
 static const struct dmi_system_id kbl_dmi_table[] = {
 	{
@@ -324,52 +325,6 @@ static struct snd_soc_acpi_mach avs_mbl_i2s_machines[] = {
 	{}
 };
 
-static struct snd_soc_acpi_mach avs_test_i2s_machines[] = {
-	{
-		.drv_name = "avs_i2s_test",
-		.mach_params = {
-			.i2s_link_mask = AVS_SSP(0),
-		},
-		.tplg_filename = "i2s-test-tplg.bin",
-	},
-	{
-		.drv_name = "avs_i2s_test",
-		.mach_params = {
-			.i2s_link_mask = AVS_SSP(1),
-		},
-		.tplg_filename = "i2s-test-tplg.bin",
-	},
-	{
-		.drv_name = "avs_i2s_test",
-		.mach_params = {
-			.i2s_link_mask = AVS_SSP(2),
-		},
-		.tplg_filename = "i2s-test-tplg.bin",
-	},
-	{
-		.drv_name = "avs_i2s_test",
-		.mach_params = {
-			.i2s_link_mask = AVS_SSP(3),
-		},
-		.tplg_filename = "i2s-test-tplg.bin",
-	},
-	{
-		.drv_name = "avs_i2s_test",
-		.mach_params = {
-			.i2s_link_mask = AVS_SSP(4),
-		},
-		.tplg_filename = "i2s-test-tplg.bin",
-	},
-	{
-		.drv_name = "avs_i2s_test",
-		.mach_params = {
-			.i2s_link_mask = AVS_SSP(5),
-		},
-		.tplg_filename = "i2s-test-tplg.bin",
-	},
-	/* no NULL terminator, as we depend on ARRAY SIZE due to .id == NULL */
-};
-
 struct avs_acpi_boards {
 	int id;
 	struct snd_soc_acpi_mach *machs;
@@ -529,6 +484,68 @@ static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach
 	return 0;
 }
 
+static int avs_register_i2s_test_board(struct avs_dev *adev, int ssp_port, int tdm_slot)
+{
+	struct snd_soc_acpi_mach *mach;
+	int tdm_mask = BIT(tdm_slot);
+	unsigned long *tdm_cfg;
+	char *tplg_name;
+	int ret;
+
+	mach = devm_kzalloc(adev->dev, sizeof(*mach), GFP_KERNEL);
+	tdm_cfg = devm_kcalloc(adev->dev, ssp_port + 1, sizeof(unsigned long), GFP_KERNEL);
+	tplg_name = devm_kasprintf(adev->dev, GFP_KERNEL, AVS_STRING_FMT("i2s", "-test-tplg.bin",
+				   ssp_port, tdm_slot));
+	if (!mach || !tdm_cfg || !tplg_name)
+		return -ENOMEM;
+
+	mach->drv_name = "avs_i2s_test";
+	mach->mach_params.i2s_link_mask = AVS_SSP(ssp_port);
+	tdm_cfg[ssp_port] = tdm_mask;
+	mach->pdata = tdm_cfg;
+	mach->tplg_filename = tplg_name;
+
+	ret = avs_register_i2s_board(adev, mach);
+	if (ret < 0) {
+		dev_warn(adev->dev, "register i2s %s failed: %d\n", mach->drv_name, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int avs_register_i2s_test_boards(struct avs_dev *adev)
+{
+	int max_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
+	int ssp_port, tdm_slot, ret;
+	unsigned long tdm_slots;
+	u32 *array, num_elems;
+
+	ret = parse_int_array(i2s_test, strlen(i2s_test), (int **)&array);
+	if (ret < 0) {
+		dev_err(adev->dev, "failed to parse i2s_test parameter\n");
+		return ret;
+	}
+
+	num_elems = *array;
+	if (num_elems > max_ssps) {
+		dev_err(adev->dev, "board supports only %d SSP, %d specified\n",
+			max_ssps, num_elems);
+		return -EINVAL;
+	}
+
+	for (ssp_port = 0; ssp_port < num_elems; ssp_port++) {
+		tdm_slots = array[1 + ssp_port];
+		for_each_set_bit(tdm_slot, &tdm_slots, 16) {
+			ret = avs_register_i2s_test_board(adev, ssp_port, tdm_slot);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int avs_register_i2s_boards(struct avs_dev *adev)
 {
 	const struct avs_acpi_boards *boards;
@@ -540,23 +557,8 @@ static int avs_register_i2s_boards(struct avs_dev *adev)
 		return 0;
 	}
 
-	if (i2s_test) {
-		int i, num_ssps;
-
-		num_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
-		/* constrain just in case FW says there can be more SSPs than possible */
-		num_ssps = min_t(int, ARRAY_SIZE(avs_test_i2s_machines), num_ssps);
-
-		mach = avs_test_i2s_machines;
-
-		for (i = 0; i < num_ssps; i++) {
-			ret = avs_register_i2s_board(adev, &mach[i]);
-			if (ret < 0)
-				dev_warn(adev->dev, "register i2s %s failed: %d\n", mach->drv_name,
-					 ret);
-		}
-		return 0;
-	}
+	if (i2s_test)
+		return avs_register_i2s_test_boards(adev);
 
 	boards = avs_get_i2s_boards(adev);
 	if (!boards) {
-- 
2.25.1

