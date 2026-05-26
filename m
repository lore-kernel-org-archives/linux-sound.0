Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAFC3D9DAB
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 10:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779793065; cv=none; b=NjTsW5fAwoM5SIIpyy40HD/ztPt2y62y6fw91M4928XvvmE6yv+uIWSjDBXsAnStRqR+xR5gkdXt5es9/08Pop0w9APy02nQs60mt9CjjYIdGIq8N9wwESwu/sGOJKUqhvb0R3c3xZIG8I++8UtBESjDaHhhWmZXRLBM/WlXVIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779793065; c=relaxed/simple;
	bh=YVtLqCTpqoMpogS8BpVTBChrhIymVzXuW49dFhEhJWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hTtGHqkrMhpIqVVHS/Wh2JDxCEfN3JxTgt9DOz30+p4pHaJC6LKxhp5FWAqLDQMy69iaukAr13GwS1KV2WfYlTunZeMS2H/3yDWLmQ6Bx1PdmHF12eEiUwv+2JCLJktbAeuF6Th6+pOEGKuz4bOMVmQIcmhkCbqjjZi5yAbMWM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E58Om75F; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E58Om75F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779793064; x=1811329064;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YVtLqCTpqoMpogS8BpVTBChrhIymVzXuW49dFhEhJWQ=;
  b=E58Om75Ftw38rluJjqum6xEafahcKdGlFiDC0LlGDGn/8In3oOQCESsR
   dPYJWpFFVRTI167YruReLJyj5NbnqSAhWIOfdaY9YWUpiFHVnn7L+mDz6
   tFdzhB9w6B2utyXTHr//OwlRGT19r+QcHdGKtQ7PA8YTQicPd5xCbPaXL
   btBhZlfUyTEZLyuu0mf8xb8FvSuIB6ekB7tEFnB9BCr3Xojsl3Nju77kh
   FcN2Wu+28qeSEsEK+m4M3ksnnptGE+vFPI1QG0YsejUBmi6RhL++1idos
   medpO7aSUpF+HAO+jPqTOeKlO7ZIdqjyi/zT25x8ES7ypN6y7vsZ97IaL
   g==;
X-CSE-ConnectionGUID: 5plkj0H2RrGW7i689xLN3Q==
X-CSE-MsgGUID: cd54JmYaS8+WIMvHRQE4nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91709709"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="91709709"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 03:57:44 -0700
X-CSE-ConnectionGUID: raX9A4YvQVSUNvdS+HO7+w==
X-CSE-MsgGUID: 0Jaed5nQQjG6c1tqVnsJTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="238869053"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.49])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 03:57:42 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH v2 2/2] ASoC: SOF: ipc4-topology: Allow the use of multiple formats for src output
Date: Tue, 26 May 2026 13:57:48 +0300
Message-ID: <20260526105748.26149-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526105748.26149-1-peter.ujfalusi@linux.intel.com>
References: <20260526105748.26149-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SRC module can only change the rate, it keeps the format and channels
intact, but this does not mean the num_output_formats must be 0:
The SRC module can support different formats/channels, we just need to
check if the output format lists the correct combination of out rate and
the input format/channels.

Change the logic to prioritize the sink_rate of the module as target rate,
then the rate of the FE in case of capture or in case of playback check the
single rate specified in the output formats.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 46 +++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index cefb7fdcfb5b..95ad5266b0c6 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2649,16 +2649,6 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	if (input_fmt_index < 0)
 		return input_fmt_index;
 
-	/*
-	 * For playback, the SRC sink rate will be configured based on the requested output
-	 * format, which is restricted to only deal with DAI's with a single format for now.
-	 */
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK && available_fmt->num_output_formats > 1) {
-		dev_err(sdev->dev, "Invalid number of output formats: %d for SRC %s\n",
-			available_fmt->num_output_formats, swidget->widget->name);
-		return -EINVAL;
-	}
-
 	/*
 	 * SRC does not perform format conversion, so the output channels and valid bit depth must
 	 * be the same as that of the input.
@@ -2668,12 +2658,36 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_audio_fmt->fmt_cfg);
 	out_ref_type = sof_ipc4_fmt_cfg_to_type(in_audio_fmt->fmt_cfg);
 
-	/*
-	 * For capture, the SRC module should convert the rate to match the rate requested by the
-	 * PCM hw_params. Set the reference params based on the fe_params unconditionally as it
-	 * will be ignored for playback anyway.
-	 */
-	out_ref_rate = params_rate(fe_params);
+	if (src->data.sink_rate) {
+		/* Use the sink rate as reference */
+		out_ref_rate = src->data.sink_rate;
+	} else if (dir == SNDRV_PCM_STREAM_CAPTURE) {
+		/*
+		 * Use the fe rate as reference for capture if the sink rate is
+		 * not set since we need to convert to the rate the PCM device
+		 * is openned with
+		 */
+		out_ref_rate = params_rate(fe_params);
+	} else {
+		/*
+		 * Otherwise try to guess what the rate should be:
+		 * The output formats must have single rate specified if the
+		 * sink rate is not set for an SRC in playback path.
+		 */
+		int i;
+
+		out_audio_fmt = &available_fmt->output_pin_fmts[0].audio_fmt;
+		out_ref_rate = out_audio_fmt->sampling_frequency;
+		for (i = 1; i < available_fmt->num_output_formats; i++) {
+			out_audio_fmt = &available_fmt->output_pin_fmts[i].audio_fmt;
+			if (out_ref_rate != out_audio_fmt->sampling_frequency) {
+				dev_err(sdev->dev,
+					"Cannot determine the output rate for SRC: %s\n",
+					swidget->widget->name);
+				return -EINVAL;
+			}
+		}
+	}
 
 	output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, swidget,
 							  &src->data.base_config,
-- 
2.54.0

