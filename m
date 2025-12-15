Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2192BDC17
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804079; cv=none; b=PkcyGZbPUFnAnV33VzY8SE/5xzNIfebr3px4Rd0ckQoa+lUcAPtH+QJ3v0NgYZ0RFCdK8evpz5kgbOBI41IwMi4gbc5gDykuh4GpZrY7QpiTRe+1/y1Y9uqMPbduYB0MXrY6Pdf25O4P4g7RRqpPd6ed6k/ETigraXLZfWgqkNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804079; c=relaxed/simple;
	bh=LiXgtQ4ZXhA+SH+G2IK/bAsKxQzLtv2p9+5cz8a8XR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bZuHSS6HiHIQCXFf4ZNJOZ0GOFNhAl28Yc34sEvtgVa4D4pyGtLTawncEf3MJ4Uc56yfGkfhMhGA/Gnq6xuQTKGlk0zoLflizIZj6vhPVeYpsWpe+zEuIPe1fuhoBOtxc6JaVKdf9blkHEa704aCV416we60GQb4jovhlBwwDUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4buOUZa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4buOUZa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765804078; x=1797340078;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LiXgtQ4ZXhA+SH+G2IK/bAsKxQzLtv2p9+5cz8a8XR0=;
  b=H4buOUZau8EPq0QkBsHr9oegZK4RMycJSl15+kTTi6ED+iLOGovBlnAp
   fKvDVGIM9UK6kSZ88IGJIMyd6T5/21fmk4WDrCgfBR4WBpVDGdf/EKakh
   qXKmGfwkIEaCzusLSPdKdlIIsztmFDIs5sw1EWqdr+czsV6JC+RKMVcAp
   dxIc5g9Js62/MKkowxqBK6lzRMhJKPbTQXf1IijGF7cZOYbWYRn3RZYbM
   NFPgrhboUy0xKzlZ5yP5o7XanfJA2Xh7D80hXOqrCbRAo/CCOxVX4//zS
   sYsME+BZo7oefHTJ17stCn3l7A8OGQfg3YVZo45tVCk3YokLf545bTTlP
   g==;
X-CSE-ConnectionGUID: g7vi8Om1QoKxpI1Efax1TQ==
X-CSE-MsgGUID: chyq7OIXRomNUU0ASk6yxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85115239"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="85115239"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:07:57 -0800
X-CSE-ConnectionGUID: KuIF5PTpR7+LFiVk3NM/Sw==
X-CSE-MsgGUID: I8KUNlQPTHyr5oFLXGVntA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="202630441"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:07:55 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH] ASoC: SOF: Intel: hda: Only check SSP MCLK mask in case of IPC3
Date: Mon, 15 Dec 2025 15:08:19 +0200
Message-ID: <20251215130819.31218-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IPC4 is using the NHLT blob itself and sends the SSP blob from it directly
to the firmware, there is no need for the MCLK quirk based on the SSP blob
since the SSP blob is in use.

At the same time reword the error, info and debug messages for clarity.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Balamurugan C <balamurugan.c@intel.com>
---
 sound/soc/sof/intel/hda.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index c1518dbee1b7..72c98154c027 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1611,7 +1611,6 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		    mach->mach_params.i2s_link_mask) {
 			const struct sof_intel_dsp_desc *chip = get_chip_info(sdev->pdata);
 			int ssp_num;
-			int mclk_mask;
 
 			if (hweight_long(mach->mach_params.i2s_link_mask) > 1 &&
 			    !(mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_SSP_MSB))
@@ -1636,19 +1635,28 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 
 			sof_pdata->tplg_filename = tplg_filename;
 
-			mclk_mask = check_nhlt_ssp_mclk_mask(sdev, ssp_num);
-
-			if (mclk_mask < 0) {
-				dev_err(sdev->dev, "Invalid MCLK configuration\n");
-				return NULL;
-			}
-
-			dev_dbg(sdev->dev, "MCLK mask %#x found in NHLT\n", mclk_mask);
-
-			if (mclk_mask) {
-				dev_info(sdev->dev, "Overriding topology with MCLK mask %#x from NHLT\n", mclk_mask);
-				sdev->mclk_id_override = true;
-				sdev->mclk_id_quirk = (mclk_mask & BIT(0)) ? 0 : 1;
+			if (sof_pdata->ipc_type == SOF_IPC_TYPE_3) {
+				int mclk_mask = check_nhlt_ssp_mclk_mask(sdev,
+									 ssp_num);
+
+				if (mclk_mask < 0) {
+					dev_err(sdev->dev,
+						"Invalid MCLK configuration for SSP%d\n",
+						ssp_num);
+					return NULL;
+				}
+
+				if (mclk_mask) {
+					sdev->mclk_id_override = true;
+					sdev->mclk_id_quirk = (mclk_mask & BIT(0)) ? 0 : 1;
+					dev_info(sdev->dev,
+						 "SSP%d to use MCLK id %d (mask: %#x)\n",
+						 ssp_num, sdev->mclk_id_quirk, mclk_mask);
+				} else {
+					dev_dbg(sdev->dev,
+						"MCLK mask is empty for SSP%d in NHLT\n",
+						ssp_num);
+				}
 			}
 		}
 
-- 
2.52.0

