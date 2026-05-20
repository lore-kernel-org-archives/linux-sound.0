Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C713EE1CE
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289304; cv=none; b=FOUdKhy48aiKQskxc1lSWkC9E9dF/U4abGGaoKF9svLs57dYLZD67Qcze23NMHjuW4fUc8pILagnYn3YWTQHQaGzm3z8EPNaY0vW5hCJUFqnRqG0k0jo/TwPLt7F7VLPgf2fglAmp6Z2FQu/Rr9x1snd+b/p04Oi7G71exulXK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289304; c=relaxed/simple;
	bh=1g+cwvjd95JO5pvonrwqqS0iCEM9erYDCKADH5PAdjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kVuJ9WIWlfD7ckz+hNQzlJ/jctrH4jJ9m17cHNxoUJFCMg60j0Islhq19CXFTUTuzJJ4t4dDm/fcHhff5uItZ6pTerFVK+f0C8rENMDlW4t/1vpx6qa8MxCXd5OCRZ1q0frVQ1McMyUMP93RZqWux5d2xoEjDii1BGqYfpLCycQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mK6G1rPW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mK6G1rPW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779289302; x=1810825302;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1g+cwvjd95JO5pvonrwqqS0iCEM9erYDCKADH5PAdjY=;
  b=mK6G1rPWIJ1lMRCAngpxisoKQEnQ5AskSKdReZ/v8zszAVarX82w0aqT
   v7BTMqHOiyGNNd7M2OsSW0bVggGFly3nu7uq1oLBuKXJ+clwN0HrJiNzf
   AdEUZIFd2mCrN2uT8CF5o9Cpt0tibioH+Ji4lcnLfIhFIg8zp/QvA3Yza
   rkuZUanBoEOa0a2o+3WW3LqY1ZZV/NgfrSLa+8NP2lJ9FD7VSiKjl4ww5
   8B+D8dq3kT+J61WP8mQMeChD/3C8CJw/bM0WUxqw1SKAaG7X3OXTAXpHv
   NudA7Qqh9OcWhTaHiEB/Yk++pp9nCuS7tFaTjzrZ358xE/PHy3skOEkON
   w==;
X-CSE-ConnectionGUID: 9ggtymXQTIe83AqmGp7nKw==
X-CSE-MsgGUID: Xm+RoQvYRiafCJ23WfDSww==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80223786"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="80223786"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 08:01:41 -0700
X-CSE-ConnectionGUID: Ss1RZWIkQxiXShj0/hHMzQ==
X-CSE-MsgGUID: IUHYspUgQJWKj4VasRPDFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="244206637"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.85])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 08:01:39 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4-topology: Allow the use of multiple formats for src output
Date: Wed, 20 May 2026 18:01:49 +0300
Message-ID: <20260520150149.18250-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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
index 984323f28106..b39e54b0c675 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2611,16 +2611,6 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
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
@@ -2630,12 +2620,36 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
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

