Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A3241611C
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 13:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430398; cv=none; b=Q6zEFQuzIfdglszsMCveH+ZtisN6dlmDan8U5fSu3IJCYvSoeUCuNWLeOudiedyJIs5q1cDOj601ZvwnmOrW7eTX/DYLPMucDwIY5OfLkTxcO7KIMIyaziYzkIRKBo3j55+Ve5K1zG7iUAtshualvkPP+Agcp7gqHh+U1ph5NTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430398; c=relaxed/simple;
	bh=RmY6O8LakE6Kn8mJFB1ZnR1h4ZP6H/A1TWBOAct3Eo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B8Ged0Xxa+o+uPmDOlcxb55X6yipwoXeKiloiepThu1dBPqp5EIOLLKtUGUBhtVLR+jlJ3c6O+HnOJ3iSkhQJH+vFW/sgRsja4WVKalJ5Bzyl4pGyjTdv9jDh6YjDlzry6QkDQB0rM7Ya23QDbRAO/cWrwLTABC/mTNNs/KQW5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMwjf/4k; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMwjf/4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783430397; x=1814966397;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RmY6O8LakE6Kn8mJFB1ZnR1h4ZP6H/A1TWBOAct3Eo8=;
  b=XMwjf/4kLQyWfQ8QeZfLNFJlKpW+zyHnUK4WJrjGDP4r7TPlmQreHeaP
   AfTOIbWk6RmerCFNvu6IFw5vUCnmGA9XItVelZOsq4l3dOFpkWGSQZ6wk
   lzA/mrujpvp4a/+uX+ekePvtCGNQmzvVblIg7VMuoyxgLGX2lKYC90vNN
   M91h2CqvmCZfEmGpUQqLlV5Jh4maq04ynwYBSTvuQfMf2tVmDaV4+/iHJ
   W3ActiVNqWClputTymnZ5olWQ44eArVrpI0RFLr0iTjLs/TPsZYbgAYdI
   aKCkKUeAI4GmbXXBXIwl2684iy8ogANnJHjGY+xZe1vZ/h/UzxthCNrEC
   A==;
X-CSE-ConnectionGUID: 6jhm28GsRuazpK4TAd/SYA==
X-CSE-MsgGUID: lUMdDIL3TtqtggSvwlxCwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="87992103"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="87992103"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 06:19:57 -0700
X-CSE-ConnectionGUID: kBAZqLGrQgWiRleTqNH9RQ==
X-CSE-MsgGUID: h2pw09A0TTiukMhfbq3o6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="277214610"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 06:19:56 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/2] ASoC: SOF: Intel: Disable SPIB in both direction
Date: Tue,  7 Jul 2026 21:19:45 +0800
Message-ID: <20260707131945.3641663-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707131945.3641663-1-yung-chuan.liao@linux.intel.com>
References: <20260707131945.3641663-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SPIB was enabled in hda_data_stream_prepare() if is_iccmax = false.
We should disable it in hda_data_stream_cleanup().

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 4a46e35c3eac..6c4447f52c68 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -1333,11 +1333,11 @@ int hda_data_stream_cleanup(struct device *dev, struct snd_dma_buffer *dmab,
 	struct snd_sof_dev *sdev =  dev_get_drvdata(dev);
 	struct hdac_stream *hstream = hdac_stream(hext_stream);
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
-	int ret = 0;
+	int ret;
 
-	if (hstream->direction == SNDRV_PCM_STREAM_PLAYBACK)
-		ret = hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_DISABLE, 0);
-	else
+	ret = hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_DISABLE, 0);
+
+	if (hstream->direction == SNDRV_PCM_STREAM_CAPTURE)
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset,
 					SOF_HDA_SD_CTL_DMA_START, 0);
 
-- 
2.43.0

