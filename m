Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235CE3D9DA4
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289317; cv=none; b=ShDcDa3bZFGR6oF4nd3SnSSyJ//0T+guIk4BsoaB3RL5YNZTK+hYD/0W3ImaylrjmbcUdXwspBldFmj2xfWiA8F9GTbnggY2E75iXWtxvaZlOYmcYCoRe5b7Okyj/2ec1C48XaY3yWsTGJpqfYwF8DXojHo7eVhckR3w4wMwjOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289317; c=relaxed/simple;
	bh=MKthFsO2nVjAItcz/jIH2UhLhprLrCjrjZd/OduaNVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nmW9pXWsxI71IF3suLjvvL7dcvkqIX62TmPZAHgDJC05+vIt0Y8laN13pRi6jA+XuIrilBHyoiE0ukDI2iz6iEv6WVixxAkxsA/AaE7hTf6MgVCCt9ppqpax6wk3LtHRIGbu/TLGAaVEhD9lYHOY64dXmb5cbqQTcInHvFMtFe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRAToCln; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRAToCln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779289316; x=1810825316;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MKthFsO2nVjAItcz/jIH2UhLhprLrCjrjZd/OduaNVI=;
  b=SRAToClnXW0Wc3P1WuPvWcf1pk9zT+fKLBLWlwe2JcE/ej2YxI7Pfsst
   YMBzO246wvW7AKOJ1uzLgWw8CG01Qo4noJMXx/HjIVOLkPAve4+f0TStM
   pvj3l47pNAiePDZMN8Db5BOEFTDLMtUNQwmFcXBJOkjiOUJA9PZAl7iGs
   bNjmBCvPQPCPd1ls81Y7uPo9djM4Q6FEbq/C7xneux+YJvRqhC+KvMUV1
   wMn2IEcvdVPUUQSD3H+n+5tmhXNPM3/fZyf1o1Pf96RZYw8orNnQDpLyl
   ZQ9X9GAnCaVFlZfO14URF8akJaBOiwPGRL0gaTYnSuHk/o+GpD1RJ0rMK
   g==;
X-CSE-ConnectionGUID: wMKFyWhERgqgUrLqnzcRaw==
X-CSE-MsgGUID: YrS4rrZkTsuALfO6InhyrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79919090"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="79919090"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 08:01:55 -0700
X-CSE-ConnectionGUID: 7Qpt66iYSxCaYmKOzhHW6w==
X-CSE-MsgGUID: wLSwHr4IQtGXCy/KXL4+qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="233855724"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.85])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 08:01:54 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH] ASoC: SOF: ipc4-topology: Print for format type in dbg_audio_format
Date: Wed, 20 May 2026 18:02:04 +0300
Message-ID: <20260520150204.18303-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

8 and 32 bit formats can have different types, print them in debug
information to have complete view of the supported formats.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 37 ++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 76812d8fb567..984323f28106 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -238,6 +238,23 @@ struct snd_sof_widget *sof_ipc4_find_swidget_by_ids(struct snd_sof_dev *sdev,
 	return NULL;
 }
 
+static u32 sof_ipc4_fmt_cfg_to_type(u32 fmt_cfg)
+{
+	/* Fetch the sample type from the fmt for 8 and 32 bit formats */
+	u32 __bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt_cfg);
+
+	if (__bits == 8 || __bits == 32)
+		return SOF_IPC4_AUDIO_FORMAT_CFG_SAMPLE_TYPE(fmt_cfg);
+
+	/*
+	 * Return LSB integer type for 16, 20 and 24 formats as the firmware is
+	 * handling the LSB/MSB alignment internally, for the kernel this
+	 * should not be taken into account, we treat them as LSB to match with
+	 * the format we support on the PCM side.
+	 */
+	return SOF_IPC4_TYPE_LSB_INTEGER;
+}
+
 static void sof_ipc4_dbg_audio_format(struct device *dev, struct sof_ipc4_pin_format *pin_fmt,
 				      int num_formats)
 {
@@ -246,8 +263,9 @@ static void sof_ipc4_dbg_audio_format(struct device *dev, struct sof_ipc4_pin_fo
 	for (i = 0; i < num_formats; i++) {
 		struct sof_ipc4_audio_format *fmt = &pin_fmt[i].audio_fmt;
 		dev_dbg(dev,
-			"Pin #%d: %uHz, %ubit, %luch (ch_map %#x ch_cfg %u interleaving_style %u fmt_cfg %#x) buffer size %d\n",
+			"Pin #%d: %uHz, %ubit (type: %u), %luch (ch_map %#x ch_cfg %u interleaving_style %u fmt_cfg %#x) buffer size %d\n",
 			pin_fmt[i].pin_index, fmt->sampling_frequency, fmt->bit_depth,
+			sof_ipc4_fmt_cfg_to_type(fmt->fmt_cfg),
 			SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg),
 			fmt->ch_map, fmt->ch_cfg, fmt->interleaving_style, fmt->fmt_cfg,
 			pin_fmt[i].buffer_size);
@@ -1353,23 +1371,6 @@ static int sof_ipc4_widget_assign_instance_id(struct snd_sof_dev *sdev,
 	return 0;
 }
 
-static u32 sof_ipc4_fmt_cfg_to_type(u32 fmt_cfg)
-{
-	/* Fetch  the sample type from the fmt for 8 and 32 bit formats */
-	u32 __bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt_cfg);
-
-	if (__bits == 8 || __bits == 32)
-		return SOF_IPC4_AUDIO_FORMAT_CFG_SAMPLE_TYPE(fmt_cfg);
-
-	/*
-	 * Return LSB integer type for 20 and 24 formats as the firmware is
-	 * handling the LSB/MSB alignment internally, for the kernel this
-	 * should not be taken into account, we treat them as LSB to match with
-	 * the format we support on the PCM side.
-	 */
-	return SOF_IPC4_TYPE_LSB_INTEGER;
-}
-
 /* update hw_params based on the audio stream format */
 static int sof_ipc4_update_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_hw_params *params,
 				     struct sof_ipc4_audio_format *fmt, u32 param_to_update)
-- 
2.54.0

