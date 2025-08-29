Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183BF265CA7
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 10:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756464750; cv=none; b=SK4Cp1yj5DDK6dik917XtXTBY0LjJzKVf3m4qDblgud19GDTAw/aP83w4vMRf2goh4WRAAYfn/L++3EDaL3Jf15yA1zHjAjzlyyPTqwdn8NPFiahJIGmrqwiEmRiLiSE+NFf+JvKLwdO9IbeiML4NzIaMcAn6YIDdf2UrzHlsf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756464750; c=relaxed/simple;
	bh=L7lpIhFdgjXG//4XrVGPd0tQMSNzfgrvq6YTPFMYgVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Va5+VBHOw1MlVP4Tvk1g6+3HTFSau9XvzZGRWAb9n+MKfhyEidU0yHXb2objuX9r3iNl6vVRmmj/6QLoH+xtk1UxuC9TGYzfAu96oMiaLmyjNCQ5iquG8jgsZQFiFzCUzP55s5er43MGVuTfCs07Lx45rjK0l8vsUgF/65R1jds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUSwMkLF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUSwMkLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756464749; x=1788000749;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L7lpIhFdgjXG//4XrVGPd0tQMSNzfgrvq6YTPFMYgVM=;
  b=IUSwMkLFOY5H0JEReJPTdNfUX7DtRwUCCHtFaYtE1/w/wuceUVmffMU1
   0li/OBwN9ruDcmK3Dk3QHnm9+ESvQi6q0gbehgdGlQbE2O3XWKynG8M+P
   JZdbr6dAE1eFzLIJkm0r9xxryN3CsPhfGMjHz8gP3LLnNnE1n3TZ4/Rtp
   9aOZyF1scRjVx9PjooUUt5EHC/QKA412w34LpF/Rv1Zfp0oEYIPVhfLOi
   bn6RZxzoXSmzh2d7XyAil1P8kisI5ldApn3ZlbQqQUrC9UuQv7QU/g2zR
   qYtLknCHfrMJAW3F4HzZcxkdwWlifSesNQx5JivDXcroxTVsiHpPECtzY
   g==;
X-CSE-ConnectionGUID: ABGC5wIjQ1uNELR9ckL7CQ==
X-CSE-MsgGUID: TvRXLRi6SDujSOZL09FQTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="61383244"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="61383244"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 03:52:29 -0700
X-CSE-ConnectionGUID: TOdZ6TXWSiSb6SMOhcOdtQ==
X-CSE-MsgGUID: VWc32rfwSf2nt89YbL49Aw==
X-ExtLoop1: 1
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.56])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 03:52:26 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com,
	liam.r.girdwood@intel.com
Subject: [PATCH 1/3] ASoC: SOF: ipc4-pcm: Add fixup for channels
Date: Fri, 29 Aug 2025 13:53:03 +0300
Message-ID: <20250829105305.31818-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829105305.31818-1-peter.ujfalusi@linux.intel.com>
References: <20250829105305.31818-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can have modules in path which can change the number of channels and in
this case the BE params needs to be adjusted to configure the DAI according
to the copier configuration.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 56 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 374dc10d10fd..cb9a06792a47 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -727,6 +727,58 @@ static int sof_ipc4_pcm_dai_link_fixup_rate(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+static int sof_ipc4_pcm_dai_link_fixup_channels(struct snd_sof_dev *sdev,
+						struct snd_pcm_hw_params *params,
+						struct sof_ipc4_copier *ipc4_copier)
+{
+	struct sof_ipc4_pin_format *pin_fmts = ipc4_copier->available_fmt.input_pin_fmts;
+	struct snd_interval *channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	int num_input_formats = ipc4_copier->available_fmt.num_input_formats;
+	unsigned int fe_channels = params_channels(params);
+	bool fe_be_match = false;
+	bool single_be_channels = true;
+	unsigned int be_channels, val;
+	int i;
+
+	if (WARN_ON_ONCE(!num_input_formats))
+		return -EINVAL;
+
+	/*
+	 * Copier does not change channels, so we
+	 * need to only consider the input pin information.
+	 */
+	be_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(pin_fmts[0].audio_fmt.fmt_cfg);
+	for (i = 0; i < num_input_formats; i++) {
+		val = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(pin_fmts[i].audio_fmt.fmt_cfg);
+
+		if (val != be_channels)
+			single_be_channels = false;
+
+		if (val == fe_channels) {
+			fe_be_match = true;
+			break;
+		}
+	}
+
+	/*
+	 * If channels is different than FE channels, topology must contain a
+	 * module which can change the number of channels. But we do require
+	 * topology to define a single channels in the DAI copier config in
+	 * this case (FE channels may be variable).
+	 */
+	if (!fe_be_match) {
+		if (!single_be_channels) {
+			dev_err(sdev->dev, "Unable to select channels for DAI link\n");
+			return -EINVAL;
+		}
+
+		channels->min = be_channels;
+		channels->max = be_channels;
+	}
+
+	return 0;
+}
+
 static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 				       struct snd_pcm_hw_params *params)
 {
@@ -790,6 +842,10 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 	if (ret)
 		return ret;
 
+	ret = sof_ipc4_pcm_dai_link_fixup_channels(sdev, params, ipc4_copier);
+	if (ret)
+		return ret;
+
 	if (single_bitdepth) {
 		snd_mask_none(fmt);
 		valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(ipc4_fmt->fmt_cfg);
-- 
2.50.1

