Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAED238DD8
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756303299; cv=none; b=UUgA9PhAuuo0N40G4fgCvphxXWCjKEdk5XuLM34VduSWM5N/K26VOgczcfonqjCs7h7myYCczAbkKEmCIVyu+q7+Cs6PZSJh+FTpXG1MiPzHG5/RX/wgHCAvHjnDITaggJ2ncb+lw4VmZreNuT7lCaRI1FVli0VArmNFasCuNwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756303299; c=relaxed/simple;
	bh=kQv8fck2PQVonDCQ2/GavPYCmRq18WTIgMhOeWNpizA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jkIFbdykSq/tfYTL4exqVRdt1xRIeF6kkSlRderWXMJb9Df7J2/cl5rVNEJvkHb3fK5cgNY7GN/r1c8Yb+BK/g9yYkxcMUkRWZeq73hsk87lBeae0wMyOkKW/kDMEz580zaYzyuG6Es5buB7y8fJy1skFZQntTsXIlz+DyDg8LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mb17Vcgn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mb17Vcgn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756303297; x=1787839297;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kQv8fck2PQVonDCQ2/GavPYCmRq18WTIgMhOeWNpizA=;
  b=Mb17VcgnEpM5WRuuYLSEx6uh5P+/EnoKPq8CmTBs7Q58Ek8zR9tJBm67
   VJtEYOvlXNc4noYVzgScCAc51sZ+xmgFJQ3TXn0uYVUVGbCiatL0bklL3
   zaqqNkTHBEiXyU/sK0BvvJNKQ8iJJXgTKjP7BPkRZ8RZ1+qIl7safVwtq
   Dq/XQvv2L54XpXiCiREGLdi3xT5X9ai9+wqkkjP1bf9LbtCRwt2tP8A1Q
   St7W17jDaLq6p/QBjYkpSBFKAj7lkcCe1M94sMQKQYtK1CQFtf28TMy2z
   DSCbHy96XUfJk/VD9e795hTBs4Bi8UjCee4xLZKJVD/e4Gvo6Wt/4NWgE
   Q==;
X-CSE-ConnectionGUID: TPX22kfaR8aEsJBf8Lq68Q==
X-CSE-MsgGUID: UwKceKJuR1iTXa1VoiJCjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58473754"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58473754"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 07:01:37 -0700
X-CSE-ConnectionGUID: ZTHKmfC2Q2GpSkGDqYW91w==
X-CSE-MsgGUID: rv2/s9s/QFK0vVg0qlyJsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="170016770"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa008.jf.intel.com with ESMTP; 27 Aug 2025 07:01:36 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/5] ASoC: Intel: avs: New board registration routines
Date: Wed, 27 Aug 2025 16:22:25 +0200
Message-Id: <20250827142229.869139-2-cezary.rojewski@intel.com>
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

To support multiple instances of the same card utilize
PLATFORM_DEVID_AUTO when registering new platform devices. This
adaptation is also an opportunity to streamline the devices
registration - avs_register_board().

All the new functions are equivalents of the existing ones apart from
adjusting platform_device_register_data() call with PLATFORM_DEVID_AUTO
and code size reduction given the presence of unified register function.
Follow up changes will complete the transition and cleanup the duplicate
members.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/board_selection.c | 145 ++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index e1d6fa344aa1..0195e5201a05 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -399,6 +399,90 @@ static const struct avs_acpi_boards *avs_get_i2s_boards(struct avs_dev *adev)
 	return NULL;
 }
 
+/* Platform devices spawned by AVS driver are removed with this hook. */
+static void avs_unregister_board(void *pdev)
+{
+	platform_device_unregister(pdev);
+}
+
+static struct platform_device *avs_register_board(struct avs_dev *adev, const char *name,
+						  const void *data, size_t size)
+{
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_register_data(NULL, name, PLATFORM_DEVID_AUTO, data, size);
+	if (IS_ERR(pdev))
+		return pdev;
+
+	ret = devm_add_action_or_reset(adev->dev, avs_unregister_board, pdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return pdev;
+}
+
+static struct platform_device *avs_register_board_pdata(struct avs_dev *adev, const char *name,
+							struct snd_soc_acpi_mach *mach,
+							struct hda_codec *codec,
+							unsigned long *tdms, char *codec_name)
+{
+	struct avs_mach_pdata *pdata;
+
+	pdata = devm_kzalloc(adev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	pdata->codec = codec;
+	pdata->tdms = tdms;
+	pdata->codec_name = codec_name;
+	pdata->obsolete_card_names = obsolete_card_names;
+	mach->pdata = pdata;
+
+	return avs_register_board(adev, name, mach, sizeof(*mach));
+}
+
+static int __maybe_unused avs_register_probe_board2(struct avs_dev *adev)
+{
+	struct platform_device *pdev;
+
+	pdev = avs_register_board(adev, "avs_probe_mb", NULL, 0);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	return avs_register_probe_component(adev, dev_name(&pdev->dev));
+}
+
+__maybe_unused
+static int avs_register_dmic_board2(struct avs_dev *adev)
+{
+	static struct snd_soc_acpi_mach mach = {
+		.tplg_filename = "dmic-tplg.bin",
+	};
+	struct platform_device *pdev;
+	char *codec_name;
+
+	if (!acpi_nhlt_find_endpoint(ACPI_NHLT_LINKTYPE_PDM, -1, -1, -1)) {
+		dev_dbg(adev->dev, "no DMIC endpoints present\n");
+		return 0;
+	}
+
+	/* DMIC present in Intel PCH is enumerated statically. */
+	pdev = avs_register_board(adev, "dmic-codec", NULL, 0);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	codec_name = devm_kstrdup(adev->dev, dev_name(&pdev->dev), GFP_KERNEL);
+	if (!codec_name)
+		return -ENOMEM;
+
+	pdev = avs_register_board_pdata(adev, "avs_dmic", &mach, NULL, NULL, codec_name);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	return avs_register_dmic_component(adev, dev_name(&pdev->dev));
+}
+
 /* platform devices owned by AVS audio are removed with this hook */
 static void board_pdev_unregister(void *data)
 {
@@ -569,6 +653,31 @@ static int avs_register_i2s_test_board(struct avs_dev *adev, int ssp_port, int t
 	return 0;
 }
 
+__maybe_unused
+static int avs_register_i2s_test_board2(struct avs_dev *adev, int ssp_port, int tdm_slot)
+{
+	struct snd_soc_acpi_mach mach = {{0}};
+	struct platform_device *pdev;
+	unsigned long *tdms;
+
+	tdms = devm_kcalloc(adev->dev, ssp_port + 1, sizeof(*tdms), GFP_KERNEL);
+	mach.tplg_filename = devm_kasprintf(adev->dev, GFP_KERNEL,
+					    AVS_STRING_FMT("i2s", "-test-tplg.bin",
+							   ssp_port, tdm_slot));
+	if (!tdms || !mach.tplg_filename)
+		return -ENOMEM;
+
+	tdms[ssp_port] = BIT(tdm_slot);
+	mach.drv_name = "avs_i2s_test";
+	mach.mach_params.i2s_link_mask = AVS_SSP(ssp_port);
+
+	pdev = avs_register_board_pdata(adev, mach.drv_name, &mach, NULL, tdms, NULL);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	return avs_register_i2s_component(adev, dev_name(&pdev->dev), AVS_SSP(ssp_port), tdms);
+}
+
 static int avs_register_i2s_test_boards(struct avs_dev *adev)
 {
 	int max_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
@@ -601,6 +710,23 @@ static int avs_register_i2s_test_boards(struct avs_dev *adev)
 	return 0;
 }
 
+__maybe_unused
+static int avs_register_i2s_board2(struct avs_dev *adev, struct snd_soc_acpi_mach *mach)
+{
+	u32 i2s_mask = mach->mach_params.i2s_link_mask;
+	struct platform_device *pdev;
+	unsigned long *tdms = NULL;
+
+	if (mach->pdata)
+		tdms = ((struct avs_mach_pdata *)mach->pdata)->tdms;
+
+	pdev = avs_register_board_pdata(adev, mach->drv_name, mach, NULL, tdms, NULL);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	return avs_register_i2s_component(adev, dev_name(&pdev->dev), i2s_mask, tdms);
+}
+
 static int avs_register_i2s_boards(struct avs_dev *adev)
 {
 	const struct avs_acpi_boards *boards;
@@ -684,6 +810,25 @@ static int avs_register_hda_board(struct avs_dev *adev, struct hda_codec *codec)
 	return 0;
 }
 
+__maybe_unused
+static int avs_register_hda_board2(struct avs_dev *adev, struct hda_codec *codec)
+{
+	struct hdac_device *hdev = &codec->core;
+	struct snd_soc_acpi_mach mach = {{0}};
+	struct platform_device *pdev;
+
+	mach.tplg_filename = devm_kasprintf(adev->dev, GFP_KERNEL, "hda-%08x-tplg.bin",
+					    hdev->vendor_id);
+	if (!mach.tplg_filename)
+		return -ENOMEM;
+
+	pdev = avs_register_board_pdata(adev, "avs_hdaudio", &mach, codec, NULL, NULL);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	return avs_register_hda_component(adev, dev_name(&pdev->dev));
+}
+
 static int avs_register_hda_boards(struct avs_dev *adev)
 {
 	struct hdac_bus *bus = &adev->base.core;
-- 
2.25.1

