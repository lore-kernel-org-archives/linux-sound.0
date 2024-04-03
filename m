Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38C5139585
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 10:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712141556; cv=none; b=nmkDtutu0LaUAE2wFGZjRp5hTG06pezQQ3/J7rzB1qiHTF9rNRZRDik+Z7cbEL08aq4DKMmQxH5JiMPoI3LxSO+Fr23mFTMFbAVNaoJDzAGULavXzD6XEJ5ybFoSQWfaheY6IxC2MyHBorHyxDjuqYfNYjoJJDHe3/LbkQepTeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712141556; c=relaxed/simple;
	bh=6OAmLxRPyz+/JOQG8xst8PhMV9OGmHODpf3KZq+9quY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GM73H4dh0YQRRC0HfnTgg8VvgvevlukxZIy3RyAy4DkbRcEgQjd8DL+W5NrahLHpSc0tfpHgTtMqf7NTW8L00jMlFx0L+V3rZSLYrAaCKB1Wb7Mi7YYWV4SJ278q9ahfS80gCPmYPyTlKkQem9cyo0UyhNuzsq36KRSvBTdZ8H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOhK0HSY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOhK0HSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712141555; x=1743677555;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6OAmLxRPyz+/JOQG8xst8PhMV9OGmHODpf3KZq+9quY=;
  b=fOhK0HSYGQECgR+tvwQv9a6fv4O+bEHCLpOGORzsfOxJbtI4gF0nntJU
   XjzcYGFWXw2OlBVS2BvHxKXxnV1NpUWwuYtP72U5qd0DKkR2MaALzyzfo
   F7F8WvJ+YMXZ2lKZt3UleqDO5b6BFpDebUd1CTbVi4CbwIVaOv/goPFdP
   R6ejr2Fs4OfMPtgJg1yQpgaiKFToNhgGPFy4htfQFsvUbYK+77O4eFBz3
   tDxOQ6gKIAcfW5ttXnSU45cNBJ55P3lUyhJA7jy4Xv7c5m+ueohf0Ooeh
   IvcgkFmMltdEUrmMKlO5pU4sspCvHKI2jkmIufAhP9mmcU+fGoBuAbapW
   w==;
X-CSE-ConnectionGUID: M5yzdRtXRWS1nJ51XlHhng==
X-CSE-MsgGUID: 6NA6A0NxRQK2fuEWzoJpDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7212264"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7212264"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 03:52:01 -0700
X-CSE-ConnectionGUID: hOLGBBCLQxi1NeJDOHiPjQ==
X-CSE-MsgGUID: 1aOf3eb4QMWNnYPYuRBySg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="49374825"
Received: from aelgham-mobl2.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.35.133])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 03:51:58 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	rander.wang@intel.com,
	liam.r.girdwood@intel.com
Subject: [PATCH 7/7] ASoC: SOF: Intel: mtl: Correct the mtl_dsp_dump output
Date: Wed,  3 Apr 2024 13:52:10 +0300
Message-ID: <20240403105210.17949-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403105210.17949-1-peter.ujfalusi@linux.intel.com>
References: <20240403105210.17949-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ROM/firmware state handling has changed between CAVS and ACE
architecture:
CAVS: ROM and firmware uses the SRAM window for the state and status/error
code reporting

ACE: ROM code is using two registers to report the state and error while
the firmware is using the SRAM window to report states and status/error
codes.

Use the generic hda_dsp_get_state() to decode ROM state and error codes and
print out the firmware state and status/error code only if the SRAM
window is accessible - the firmware is booted and the Status readout is
not 0xffffffff.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/mtl.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 5c9d14e5925d..dc203505536c 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -310,22 +310,16 @@ int mtl_dsp_post_fw_run(struct snd_sof_dev *sdev)
 void mtl_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 {
 	char *level = (flags & SOF_DBG_DUMP_OPTIONAL) ? KERN_DEBUG : KERN_ERR;
-	u32 romdbgsts;
-	u32 romdbgerr;
 	u32 fwsts;
 	u32 fwlec;
 
+	hda_dsp_get_state(sdev, level);
 	fwsts = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_ROM_STS);
 	fwlec = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_ROM_ERROR);
-	romdbgsts = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HFFLGPXQWY);
-	romdbgerr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HFFLGPXQWY_ERROR);
-
-	dev_err(sdev->dev, "ROM status: %#x, ROM error: %#x\n", fwsts, fwlec);
-	dev_err(sdev->dev, "ROM debug status: %#x, ROM debug error: %#x\n", romdbgsts,
-		romdbgerr);
-	romdbgsts = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_DSP_REG_HFFLGPXQWY + 0x8 * 3);
-	dev_printk(level, sdev->dev, "ROM feature bit%s enabled\n",
-		   romdbgsts & BIT(24) ? "" : " not");
+
+	if (fwsts != 0xffffffff)
+		dev_err(sdev->dev, "Firmware state: %#x, status/error code: %#x\n",
+			fwsts, fwlec);
 
 	sof_ipc4_intel_dump_telemetry_state(sdev, flags);
 }
-- 
2.44.0

