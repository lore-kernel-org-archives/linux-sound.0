Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD22438DD8
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 14:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756303301; cv=none; b=B2tV8jrleOSDkmWtEvQ8G2xwRuwNG2Q4z4tX/aw9NRIlMnKpncLbH/0QJ45ZNVPOQCW4FJsMjGlNN9COtpC9k6WwcZJFOAMDm2nFMjEs7LMDx+AgbdDmEP8vODukPW/L0986RTifMW1mCNNLuooNmjPjsy2YpZJbx+pAmfTQUP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756303301; c=relaxed/simple;
	bh=4aeWeD0OatFSFNGbTdEv5vpMIOJwdnhuIS1lriIGzoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MvliYmnlkBKQBDT0jyTHE5Sz19r+GFWA1EDMi6V3LQkdgdPEJ33AY21xGic/CQDR5nbbU0GoIUSrFh6bzZX3YvGGvThlVhADKlptXO25fXCb8EXxPIugvSvmG+YDxlWfI3XG1aKxYMyx6jG9+0T+kptpMJ8/AGGkopltRWte1eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJ61/hIh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJ61/hIh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756303299; x=1787839299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4aeWeD0OatFSFNGbTdEv5vpMIOJwdnhuIS1lriIGzoQ=;
  b=RJ61/hIhBQE58TzCCUBYoT0spG3kY1iH6QKY7gv9cSrqp+FYLWO53j8l
   KGp5ySDC7X+HceuscNev8i5LxHZu70n30FmpJZRadDpm2nJQcDAeRkxBe
   9b2lYgHa3frZqseWsobPKTPvYR1GAA/+p9h/B4UA6w/1L8vw4mY3nDtqO
   SeuroeIYBI1ftWxvGsaFgh1AbwkdjplcCWa/VdFCWp1RmBzWsIzUsbwhj
   L/F1KFbS7xueAAykAG1GDT8/N3b2WVzsgTSobSXK7lKCKSjoRTREb6hSM
   neY07h24EXOckGUc2FypivWVIxq6vOL0DS5mOwInGdm/iOLo4Jyabhx1X
   A==;
X-CSE-ConnectionGUID: EHhyPoDoQfSz39TeLht/Ww==
X-CSE-MsgGUID: VW6d+djhSFGW2zxqV3SVvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58473765"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58473765"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 07:01:39 -0700
X-CSE-ConnectionGUID: rpGb38EoS8+L1q03ZQfilw==
X-CSE-MsgGUID: VWw/QVHNTi62Py/Ae0/shw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="170016778"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa008.jf.intel.com with ESMTP; 27 Aug 2025 07:01:38 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/5] ASoC: Intel: avs: Cleanup duplicate members
Date: Wed, 27 Aug 2025 16:22:26 +0200
Message-Id: <20250827142229.869139-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250827142229.869139-1-cezary.rojewski@intel.com>
References: <20250827142229.869139-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch to the new board registration functions and remove the
then-unused code.

The SSP-number-check is still important and cannot be just dropped. Move
it from avs_register_i2s_board(), which is being removed with this
patch, to avs_register_i2s_boards() to maintain sanity when registering
a board.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h             |   1 -
 sound/soc/intel/avs/board_selection.c | 234 ++------------------------
 2 files changed, 10 insertions(+), 225 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 95f9ac2683c0..0f8ddd0e9e5f 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -22,7 +22,6 @@
 struct avs_dev;
 struct avs_tplg;
 struct avs_tplg_library;
-struct avs_soc_component;
 struct avs_ipc_msg;
 
 #ifdef CONFIG_ACPI
diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 0195e5201a05..edf20d7816ea 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -442,7 +442,7 @@ static struct platform_device *avs_register_board_pdata(struct avs_dev *adev, co
 	return avs_register_board(adev, name, mach, sizeof(*mach));
 }
 
-static int __maybe_unused avs_register_probe_board2(struct avs_dev *adev)
+static int __maybe_unused avs_register_probe_board(struct avs_dev *adev)
 {
 	struct platform_device *pdev;
 
@@ -453,8 +453,7 @@ static int __maybe_unused avs_register_probe_board2(struct avs_dev *adev)
 	return avs_register_probe_component(adev, dev_name(&pdev->dev));
 }
 
-__maybe_unused
-static int avs_register_dmic_board2(struct avs_dev *adev)
+static int avs_register_dmic_board(struct avs_dev *adev)
 {
 	static struct snd_soc_acpi_mach mach = {
 		.tplg_filename = "dmic-tplg.bin",
@@ -483,178 +482,7 @@ static int avs_register_dmic_board2(struct avs_dev *adev)
 	return avs_register_dmic_component(adev, dev_name(&pdev->dev));
 }
 
-/* platform devices owned by AVS audio are removed with this hook */
-static void board_pdev_unregister(void *data)
-{
-	platform_device_unregister(data);
-}
-
-static int __maybe_unused avs_register_probe_board(struct avs_dev *adev)
-{
-	struct platform_device *board;
-	struct snd_soc_acpi_mach mach = {{0}};
-	int ret;
-
-	ret = avs_register_probe_component(adev, "probe-platform");
-	if (ret < 0)
-		return ret;
-
-	mach.mach_params.platform = "probe-platform";
-
-	board = platform_device_register_data(NULL, "avs_probe_mb", PLATFORM_DEVID_NONE,
-					      (const void *)&mach, sizeof(mach));
-	if (IS_ERR(board)) {
-		dev_err(adev->dev, "probe board register failed\n");
-		return PTR_ERR(board);
-	}
-
-	ret = devm_add_action(adev->dev, board_pdev_unregister, board);
-	if (ret < 0) {
-		platform_device_unregister(board);
-		return ret;
-	}
-	return 0;
-}
-
-static int avs_register_dmic_board(struct avs_dev *adev)
-{
-	struct platform_device *codec, *board;
-	struct snd_soc_acpi_mach mach = {{0}};
-	struct avs_mach_pdata *pdata;
-	int ret;
-
-	if (!acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_PDM, -1, -1, -1)) {
-		dev_dbg(adev->dev, "no DMIC endpoints present\n");
-		return 0;
-	}
-
-	codec = platform_device_register_simple("dmic-codec", PLATFORM_DEVID_NONE, NULL, 0);
-	if (IS_ERR(codec)) {
-		dev_err(adev->dev, "dmic codec register failed\n");
-		return PTR_ERR(codec);
-	}
-
-	ret = devm_add_action(adev->dev, board_pdev_unregister, codec);
-	if (ret < 0) {
-		platform_device_unregister(codec);
-		return ret;
-	}
-
-	ret = avs_register_dmic_component(adev, "dmic-platform");
-	if (ret < 0)
-		return ret;
-
-	pdata = devm_kzalloc(adev->dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return -ENOMEM;
-	pdata->obsolete_card_names = obsolete_card_names;
-	mach.pdata = pdata;
-	mach.tplg_filename = "dmic-tplg.bin";
-	mach.mach_params.platform = "dmic-platform";
-
-	board = platform_device_register_data(NULL, "avs_dmic", PLATFORM_DEVID_NONE,
-					(const void *)&mach, sizeof(mach));
-	if (IS_ERR(board)) {
-		dev_err(adev->dev, "dmic board register failed\n");
-		return PTR_ERR(board);
-	}
-
-	ret = devm_add_action(adev->dev, board_pdev_unregister, board);
-	if (ret < 0) {
-		platform_device_unregister(board);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach *mach)
-{
-	struct platform_device *board;
-	struct avs_mach_pdata *pdata;
-	int num_ssps;
-	char *name;
-	int ret;
-	int uid;
-
-	num_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
-	if (fls(mach->mach_params.i2s_link_mask) > num_ssps) {
-		dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%ld\n",
-			num_ssps, mach->drv_name,
-			(unsigned long)__fls(mach->mach_params.i2s_link_mask));
-		return -ENODEV;
-	}
-
-	pdata = mach->pdata;
-	if (!pdata)
-		pdata = devm_kzalloc(adev->dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return -ENOMEM;
-	pdata->obsolete_card_names = obsolete_card_names;
-	mach->pdata = pdata;
-
-	uid = mach->mach_params.i2s_link_mask;
-	if (avs_mach_singular_ssp(mach))
-		uid = (uid << AVS_CHANNELS_MAX) + avs_mach_ssp_tdm(mach, avs_mach_ssp_port(mach));
-
-	name = devm_kasprintf(adev->dev, GFP_KERNEL, "%s.%d-platform", mach->drv_name, uid);
-	if (!name)
-		return -ENOMEM;
-
-	ret = avs_register_i2s_component(adev, name, mach->mach_params.i2s_link_mask, pdata->tdms);
-	if (ret < 0)
-		return ret;
-
-	mach->mach_params.platform = name;
-
-	board = platform_device_register_data(NULL, mach->drv_name, uid,
-					      (const void *)mach, sizeof(*mach));
-	if (IS_ERR(board)) {
-		dev_err(adev->dev, "ssp board register failed\n");
-		return PTR_ERR(board);
-	}
-
-	ret = devm_add_action(adev->dev, board_pdev_unregister, board);
-	if (ret < 0) {
-		platform_device_unregister(board);
-		return ret;
-	}
-
-	return 0;
-}
-
 static int avs_register_i2s_test_board(struct avs_dev *adev, int ssp_port, int tdm_slot)
-{
-	struct snd_soc_acpi_mach *mach;
-	int tdm_mask = BIT(tdm_slot);
-	unsigned long *tdm_cfg;
-	char *tplg_name;
-	int ret;
-
-	mach = devm_kzalloc(adev->dev, sizeof(*mach), GFP_KERNEL);
-	tdm_cfg = devm_kcalloc(adev->dev, ssp_port + 1, sizeof(unsigned long), GFP_KERNEL);
-	tplg_name = devm_kasprintf(adev->dev, GFP_KERNEL, AVS_STRING_FMT("i2s", "-test-tplg.bin",
-				   ssp_port, tdm_slot));
-	if (!mach || !tdm_cfg || !tplg_name)
-		return -ENOMEM;
-
-	mach->drv_name = "avs_i2s_test";
-	mach->mach_params.i2s_link_mask = AVS_SSP(ssp_port);
-	tdm_cfg[ssp_port] = tdm_mask;
-	mach->pdata = tdm_cfg;
-	mach->tplg_filename = tplg_name;
-
-	ret = avs_register_i2s_board(adev, mach);
-	if (ret < 0) {
-		dev_warn(adev->dev, "register i2s %s failed: %d\n", mach->drv_name, ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-__maybe_unused
-static int avs_register_i2s_test_board2(struct avs_dev *adev, int ssp_port, int tdm_slot)
 {
 	struct snd_soc_acpi_mach mach = {{0}};
 	struct platform_device *pdev;
@@ -710,8 +538,7 @@ static int avs_register_i2s_test_boards(struct avs_dev *adev)
 	return 0;
 }
 
-__maybe_unused
-static int avs_register_i2s_board2(struct avs_dev *adev, struct snd_soc_acpi_mach *mach)
+static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach *mach)
 {
 	u32 i2s_mask = mach->mach_params.i2s_link_mask;
 	struct platform_device *pdev;
@@ -729,6 +556,7 @@ static int avs_register_i2s_board2(struct avs_dev *adev, struct snd_soc_acpi_mac
 
 static int avs_register_i2s_boards(struct avs_dev *adev)
 {
+	int num_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
 	const struct avs_acpi_boards *boards;
 	struct snd_soc_acpi_mach *mach;
 	int ret;
@@ -751,6 +579,12 @@ static int avs_register_i2s_boards(struct avs_dev *adev)
 		if (!acpi_dev_present(mach->id, mach->uid, -1))
 			continue;
 
+		if (fls(mach->mach_params.i2s_link_mask) > num_ssps) {
+			dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%ld\n",
+				num_ssps, mach->drv_name,
+				(unsigned long)__fls(mach->mach_params.i2s_link_mask));
+			continue;
+		}
 		if (mach->machine_quirk)
 			if (!mach->machine_quirk(mach))
 				continue;
@@ -764,54 +598,6 @@ static int avs_register_i2s_boards(struct avs_dev *adev)
 }
 
 static int avs_register_hda_board(struct avs_dev *adev, struct hda_codec *codec)
-{
-	struct snd_soc_acpi_mach mach = {{0}};
-	struct platform_device *board;
-	struct avs_mach_pdata *pdata;
-	struct hdac_device *hdev = &codec->core;
-	char *pname;
-	int ret, id;
-
-	pname = devm_kasprintf(adev->dev, GFP_KERNEL, "%s-platform", dev_name(&hdev->dev));
-	if (!pname)
-		return -ENOMEM;
-
-	pdata = devm_kzalloc(adev->dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return -ENOMEM;
-	pdata->obsolete_card_names = obsolete_card_names;
-	pdata->codec = codec;
-
-	ret = avs_register_hda_component(adev, pname);
-	if (ret < 0)
-		return ret;
-
-	mach.pdata = pdata;
-	mach.mach_params.platform = pname;
-	mach.tplg_filename = devm_kasprintf(adev->dev, GFP_KERNEL, "hda-%08x-tplg.bin",
-					    hdev->vendor_id);
-	if (!mach.tplg_filename)
-		return -ENOMEM;
-
-	id = adev->base.core.idx * HDA_MAX_CODECS + hdev->addr;
-	board = platform_device_register_data(NULL, "avs_hdaudio", id, (const void *)&mach,
-					      sizeof(mach));
-	if (IS_ERR(board)) {
-		dev_err(adev->dev, "hda board register failed\n");
-		return PTR_ERR(board);
-	}
-
-	ret = devm_add_action(adev->dev, board_pdev_unregister, board);
-	if (ret < 0) {
-		platform_device_unregister(board);
-		return ret;
-	}
-
-	return 0;
-}
-
-__maybe_unused
-static int avs_register_hda_board2(struct avs_dev *adev, struct hda_codec *codec)
 {
 	struct hdac_device *hdev = &codec->core;
 	struct snd_soc_acpi_mach mach = {{0}};
-- 
2.25.1

