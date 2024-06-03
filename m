Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AF163D5
	for <linux-sound@vger.kernel.org>; Mon,  3 Jun 2024 07:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717399926; cv=none; b=I73k3RJlcZXLUJm7MjiqUeTKLMVOynOpqt1UytKl/KOCWWpl3SZt4PbVQVY7Mk3zzVre3VpndEyLZB9OMLzfQqr8ez5vBaizpYH64jwhSfhdCKdjhTTb2NM4NGuzP51l9Vmuj1wmpCkUt7g9OAYYcFaQaYd8D1Y6+JMfy5TL5ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717399926; c=relaxed/simple;
	bh=XXubIkQLtdRNBYhgvXWmLkyP3tvHZm/HtCdRJED/3Qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VsW8vu7Kerqi/kuz+P4dEC/L+nBMdkvIzbGmMFqwL8WOK96mkEI97Dz4ddYyk/sVlnAVh3g1nA8VQP5L0cGFAL7zbSLfBELSqkC1NzRQyHp4UvlPQl/YblhcgyM1PiZO/VR9MQeg6TLI/HhUMTiZos/r42L0HYHiIebyS4dOEjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUU7Sfbp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUU7Sfbp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717399925; x=1748935925;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XXubIkQLtdRNBYhgvXWmLkyP3tvHZm/HtCdRJED/3Qw=;
  b=RUU7SfbpQellcgTW1/GkrlUSdrdqHe38+WkZMr6VUT3facgVJlSS+zBC
   w+fIULbXZfXPJ8FS5OhzXAwTa2ZiZ/7dBN4UNtVLJysQ9f0xFrq8WAA17
   3bST0uyIcsPmSCt5ZzltLyjaLR1qD9jxepesRMexJmmPcGMAIWll+ZbMr
   i0L236kyUj/P2tf/jIDszuz6/uS5E/YS/IZ/KFpIUpD0f7PxedZDSsMDm
   z8jmtb1NugqSQehH+2Cmh3omqMsNf4nxsJ9pUL0pGgwuDikBq0QNGACCm
   J8f4yejjo8Njbu5PaT3eMEeHWeZ/vREvVb07qbhiKvIHBG+cUHF05ggeU
   g==;
X-CSE-ConnectionGUID: XJcbNnTyTkK7NazRCiA6xw==
X-CSE-MsgGUID: ZDfXxAlOTNGFMH1qye7hYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13729083"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="13729083"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 00:32:04 -0700
X-CSE-ConnectionGUID: AwDxvhYTQkms6p7XzUR+vg==
X-CSE-MsgGUID: z0M79cOQSla98znLMyO/6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="36787945"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.158])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 00:32:02 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 2/2] ASoC: SOF: Intel: hda-dai: remove skip_tlv label
Date: Mon,  3 Jun 2024 10:32:24 +0300
Message-ID: <20240603073224.14726-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240603073224.14726-1-peter.ujfalusi@linux.intel.com>
References: <20240603073224.14726-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We just return 0 after the skip_tlv label. No need to use a label.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index a2b6dbcfa918..c61d298ea6b3 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -379,7 +379,7 @@ static int non_hda_dai_hw_params_data(struct snd_pcm_substream *substream,
 
 	sdev = widget_to_sdev(w);
 	if (sdev->dspless_mode_selected)
-		goto skip_tlv;
+		return 0;
 
 	/* get stream_id */
 	hext_stream = ops->get_hext_stream(sdev, cpu_dai, substream);
@@ -423,7 +423,6 @@ static int non_hda_dai_hw_params_data(struct snd_pcm_substream *substream,
 	dma_config->dma_stream_channel_map.device_count = 1;
 	dma_config->dma_priv_config_size = 0;
 
-skip_tlv:
 	return 0;
 }
 
-- 
2.45.1

