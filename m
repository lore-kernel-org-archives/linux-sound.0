Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B41942C4EA
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 12:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785414509; cv=none; b=CH+RlHRTut/Xz0q+VjxWYHSmz97tyN1+8RiRKHfBjAkrEBUANUaf4lRdp5rc2vch1kQNNiwQ0WW4IJwbXaNpL2UlybDLwCJC/8UBAvP+FdjKy8ApzkSxvyxL3WbxRNBgjdYd3Ho/n30CQKcWzvjMqa38pH0NxbvxIQ0e7l1Qoo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785414509; c=relaxed/simple;
	bh=0z96NXq/v+6YiCCujsOyR8pY96qctLweeWlsToroWTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9erj9B+EKva0XZ29slPU730YTnmuHAekosVN8+83LdQi688ikSO62ziVTq03NIh3MQ2iZ7bJ7/mUt6qRNJ0SaWnrRG+K3IZbiLFiSzjjgFLeLYfNvZMeAWW6d7juuf71HEdjwaqWbKgfyn4evoTXts1X7Z1VUwHxZ/m/h/LwrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGvIv8x0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGvIv8x0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785414507; x=1816950507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0z96NXq/v+6YiCCujsOyR8pY96qctLweeWlsToroWTk=;
  b=cGvIv8x0wQOebvrokUC88UJIu6xXIXiszHDYi6GtfxC+oHSO8ZzL+bOP
   5W4qUIAAoNAkR829URTA9IqczhKTrd9iZWCswV8OWMtRtJdbh9WGRBntC
   Kdgjp1+Ex+Ui6aFm6HkxlIeioZi5beH8IzkoJUT+8nuDGuBcsFjx5uiVQ
   74pFUgb12claCkjPqU6YyWKnIU4+B5TidRnuKxVlbQmZu7Y86DSQW9+Qz
   vaVhWTAy0htpc0X927zpFN3RiQADKxGnQKmcsRAqSV4GTL7tN9FOPYgxE
   qEoBhBT3croV9D7yy0sx8QFGFUcCDQEDXzkMUEIDs5Fx716MclxT1tJ7d
   g==;
X-CSE-ConnectionGUID: IOv2b0KwQaaKVPr8laVjkQ==
X-CSE-MsgGUID: kZOpm1PVTwODjtFuBweiww==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85158402"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="85158402"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:28:27 -0700
X-CSE-ConnectionGUID: Ho5c6E8mTJmpcGVSPQ/NtQ==
X-CSE-MsgGUID: 46+BB+C8TgG9RxtmmcozQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="265340644"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:28:25 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 2/2] ASoC: SOF: Intel: mtl: Power down DSP if it is left enabled in pre_fw_run()
Date: Thu, 30 Jul 2026 15:28:57 +0300
Message-ID: <20260730122857.5294-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730122857.5294-1-peter.ujfalusi@linux.intel.com>
References: <20260730122857.5294-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is expected that the DSP is in power down state when the firmware boot
is attempted.
If the DSP for any reason was left powered up then the DSP boot will
fail since the ROM boot sequence might not be able to run.

Make sure that the DSP is off before proceeding to boot it up.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/mtl.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 9503d00e6002..3d67d6777f1b 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -236,6 +236,17 @@ int mtl_enable_interrupts(struct snd_sof_dev *sdev, bool enable)
 }
 EXPORT_SYMBOL_NS(mtl_enable_interrupts, "SND_SOC_SOF_INTEL_MTL");
 
+static bool mtl_dsp_is_enabled(struct snd_sof_dev *sdev)
+{
+	int val;
+
+	val = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_HFDSSCS);
+	if (val & MTL_HFDSSCS_CPA_MASK)
+		return true;
+
+	return false;
+}
+
 /* pre fw run operations */
 static int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 {
@@ -249,6 +260,18 @@ static int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 	u32 dsppwrsts;
 	const struct sof_intel_dsp_desc *chip;
 
+	/* Power down the DSP if it is left enabled to ensure clean boot state */
+	if (mtl_dsp_is_enabled(sdev)) {
+		dev_dbg(sdev->dev, "powering down DSP first\n");
+
+		ret = mtl_power_down_dsp(sdev);
+		if (ret < 0) {
+			dev_warn(sdev->dev,
+				 "%s: failed to power down already-enabled DSP\n", __func__);
+			/* Continue anyway to attempt recovery */
+		}
+	}
+
 	chip = get_chip_info(sdev->pdata);
 	if (chip->hw_ip_version > SOF_INTEL_ACE_2_0) {
 		dsppwrctl = PTL_HFPWRCTL2;
-- 
2.55.0

