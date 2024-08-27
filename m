Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210571BCA1A
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 12:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761971; cv=none; b=CQNsACYdTHX3i4naq7afvwd9YuzcycRP3dsFDziojaYDv4xCa+lr2RmlrICbToPGTjvmm6IqX5ZxC+jx4vqvKEP6VcSJKduyFOER26kdandk6OyLC+rLFeeZx9ITqBRNRrvC3eATKiQ80xbr/Y5iXwA5wNK4MoAFb2OXXZNvlIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761971; c=relaxed/simple;
	bh=hrgIBF/kjLvhxqduTdBGm06GdC1+j5ttVo4QAvRMuDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H7TP5awdFb2sO4YAQRccM8XdTPhtegHoiXdc5JbA3XBJ+af/Gax4CuJ4LozHAo2Hr91xmdDLIBDK4uhKwhjL+dtHEFAKDsUUEadF2GdTDTS8Dv2uZ1YuGTM/a1zhVp00jftUQkhNERrO8WYT19J3uRx3An9pNUsx2K7JFaasXHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RMDEfYZ6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RMDEfYZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724761970; x=1756297970;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hrgIBF/kjLvhxqduTdBGm06GdC1+j5ttVo4QAvRMuDU=;
  b=RMDEfYZ6/Vz/kW2dCqqRMo9CnkdjEDLBJxnsSw5LHbouUfbEzZdF0ilA
   95NV8he806+RtY4nUGmudAtBK21RMjz4+V9R3rtEPLqgX2Iso6nqxYXQ6
   2Tps8ixAdWSsfgsBwppiDBkk8RxTDGW/8px1DAdUVYroj5YMq6DznTfgN
   RjCJs/RKp2edtNYKIz+QPxtZAzWrUDgMzx6DsxAJqwn/vIUjf2XPcRtfI
   jYRKTxi4iZy+zIdBQAEYIpEtowfyvWrFIw/xRxz0wIL1pZgb3ulljw3Fv
   kbQx1JBg/30q2kHO7c699p2UoORsGkp8xHlEdOUXxk8mT6yqVp92RLpy/
   g==;
X-CSE-ConnectionGUID: ptRw9K0TQ2uNwlRD6FVxYw==
X-CSE-MsgGUID: AYU/k0mlS5KdmxlJXogSeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13235510"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="13235510"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:50 -0700
X-CSE-ConnectionGUID: V2xfCT2HQ8yTu99QTiXuSQ==
X-CSE-MsgGUID: zzFtQVeQSUW2cSlDruUJmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62676795"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:47 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 08/17] ASoC: SOF: Intel: hda: support BT link mask in mach_params
Date: Tue, 27 Aug 2024 20:32:06 +0800
Message-ID: <20240827123215.258859-9-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
References: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add an new variable bt_link_mask to snd_soc_acpi_mach_params structure.
SSP port mask of BT offload found in NHLT table will be sent to
machine driver to setup BE dai link with correct SSP port number.

This patch only detects and enables the BT dailink. The functionality
will only be unlocked with a topology file that makes a reference to
that BT dailink. For backwards-compatibility reasons, this topology
will not be used by default. Chromebooks and Linux users willing to
experiment shall use the tplg_name kernel parameter to force the use
of an enhanced topology.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/soc-acpi.h  |  2 ++
 sound/soc/sof/intel/hda.c | 37 ++++++++++++++++++++++++++++++++-----
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index b6d301946244..c1552bc6e31c 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -73,6 +73,7 @@ static inline struct snd_soc_acpi_mach *snd_soc_acpi_codec_list(void *arg)
  * @subsystem_rev: optional PCI SSID revision value
  * @subsystem_id_set: true if a value has been written to
  *		      subsystem_vendor and subsystem_device.
+ * @bt_link_mask: BT offload link enabled on the board
  */
 struct snd_soc_acpi_mach_params {
 	u32 acpi_ipc_irq_index;
@@ -89,6 +90,7 @@ struct snd_soc_acpi_mach_params {
 	unsigned short subsystem_device;
 	unsigned short subsystem_rev;
 	bool subsystem_id_set;
+	u32 bt_link_mask;
 };
 
 /**
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 2f24b5abc91b..d0a41e8e6334 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -444,6 +444,10 @@ static int mclk_id_override = -1;
 module_param_named(mclk_id, mclk_id_override, int, 0444);
 MODULE_PARM_DESC(mclk_id, "SOF SSP mclk_id");
 
+static int bt_link_mask_override;
+module_param_named(bt_link_mask, bt_link_mask_override, int, 0444);
+MODULE_PARM_DESC(bt_link_mask, "SOF BT offload link mask");
+
 static int hda_init(struct snd_sof_dev *sdev)
 {
 	struct hda_bus *hbus;
@@ -529,7 +533,7 @@ static int check_dmic_num(struct snd_sof_dev *sdev)
 	return dmic_num;
 }
 
-static int check_nhlt_ssp_mask(struct snd_sof_dev *sdev)
+static int check_nhlt_ssp_mask(struct snd_sof_dev *sdev, u8 device_type)
 {
 	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 	struct nhlt_acpi_table *nhlt;
@@ -540,9 +544,11 @@ static int check_nhlt_ssp_mask(struct snd_sof_dev *sdev)
 		return ssp_mask;
 
 	if (intel_nhlt_has_endpoint_type(nhlt, NHLT_LINK_SSP)) {
-		ssp_mask = intel_nhlt_ssp_endpoint_mask(nhlt, NHLT_DEVICE_I2S);
+		ssp_mask = intel_nhlt_ssp_endpoint_mask(nhlt, device_type);
 		if (ssp_mask)
-			dev_info(sdev->dev, "NHLT_DEVICE_I2S detected, ssp_mask %#x\n", ssp_mask);
+			dev_info(sdev->dev, "NHLT device %s(%d) detected, ssp_mask %#x\n",
+				 device_type == NHLT_DEVICE_BT ? "BT" : "I2S",
+				 device_type, ssp_mask);
 	}
 
 	return ssp_mask;
@@ -1235,8 +1241,29 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 	 * Otherwise, set certain mach params.
 	 */
 	hda_generic_machine_select(sdev, &mach);
-	if (!mach)
+	if (!mach) {
 		dev_warn(sdev->dev, "warning: No matching ASoC machine driver found\n");
+		return NULL;
+	}
+
+	/* report BT offload link mask to machine driver */
+	mach->mach_params.bt_link_mask = check_nhlt_ssp_mask(sdev, NHLT_DEVICE_BT);
+
+	dev_info(sdev->dev, "BT link detected in NHLT tables: %#x\n",
+		 mach->mach_params.bt_link_mask);
+
+	/* allow for module parameter override */
+	if (bt_link_mask_override) {
+		dev_dbg(sdev->dev, "overriding BT link detected in NHLT tables %#x by kernel param %#x\n",
+			mach->mach_params.bt_link_mask, bt_link_mask_override);
+		mach->mach_params.bt_link_mask = bt_link_mask_override;
+	}
+
+	if (hweight_long(mach->mach_params.bt_link_mask) > 1) {
+		dev_warn(sdev->dev, "invalid BT link mask %#x found, reset the mask\n",
+			mach->mach_params.bt_link_mask);
+		mach->mach_params.bt_link_mask = 0;
+	}
 
 	/*
 	 * Fixup tplg file name by appending dmic num, ssp num, codec/amplifier
@@ -1312,7 +1339,7 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		}
 
 		/* report SSP link mask to machine driver */
-		mach->mach_params.i2s_link_mask = check_nhlt_ssp_mask(sdev);
+		mach->mach_params.i2s_link_mask = check_nhlt_ssp_mask(sdev, NHLT_DEVICE_I2S);
 
 		if (tplg_fixup &&
 		    mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER &&
-- 
2.43.0

