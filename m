Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57462E7BC3
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 10:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761561640; cv=none; b=eRligkM/T7j5edrc9tYMlxm2I6iIEJ8bx8MUkBuoIUM5C4ZcDG1n6IXvUdxxzaC7UEDlBji9wWbyAVYBkPWQ+qhRNQ98iyZrNINtHZVaSxPclFR9urwIFUGfojdRZ0AZWbxY6ZyActvz+gqWJyup22qF/zY2/hMavx98aqSYtFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761561640; c=relaxed/simple;
	bh=tt+lLFBxLClx6KY6g8iMBfEafIrDamYbt17ZLec2uVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VyY4Cjg6iGA+uh/TZ9E9FXlgJ5Vfyqn+19ScKt8hKxt+wR3jil4AcY75/Ih3SevAZ+P2PFzvsH/OH+FCMFZjxp/uAuXbcISX0G5p80nbVkGov3FV+CNdNMnRATGEo08kTk3V0bVM5RJUVXOpFa1qYRMePgPjITBKVzmC2AVPixs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxFya7oW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxFya7oW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761561639; x=1793097639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tt+lLFBxLClx6KY6g8iMBfEafIrDamYbt17ZLec2uVs=;
  b=mxFya7oWaLxY/qy2QRNzhzKP9+K2gUIUMTWSAbLNyjbjYhLhms3tUQvB
   EB4xFZadwqi34xzntTRu0h6gZZ+qntsNftjMqBXKNiY4c2qWHdq6uBS4i
   su5hKNyix2shIOo5ZYQOMe5/DU1Sh55JWLALuTpFgJNLtH/lYKqS7vMz6
   qPsSfj90tscUVYmNL7S0HprtAFFfg9HbnGzPXg9Gqgb21iHltnQBbUNyY
   dUlOGURMNyUVtjJA4f7Z1LVxokRfSeWvhScMbZbzRsYkNb6uw6K8ttVzJ
   qdDFRpI/8uLHMGR+jaBTQHidTaxx1Yi5XpLXmWvVAA2ttfpP/omb/MOsP
   Q==;
X-CSE-ConnectionGUID: rfuFXI0iTKefW8K/+gkkYA==
X-CSE-MsgGUID: cwDvhDQNQbunX9tTge92+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63672088"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63672088"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 03:40:38 -0700
X-CSE-ConnectionGUID: Ij4dqx0TTqqCO+UUfDaZdA==
X-CSE-MsgGUID: VB9KeDEVTwCmwa2eYjnbCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="189051612"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 27 Oct 2025 03:40:37 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeusz.slawinski@gmail.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 3/3] ASoC: Intel: avs: Use snd_codec format when initializing probe
Date: Mon, 27 Oct 2025 12:01:06 +0100
Message-Id: <20251027110106.3157415-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251027110106.3157415-1-cezary.rojewski@intel.com>
References: <20251027110106.3157415-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The data probing is a debug feature. Currently parameters channels and
rate specified by the application are read while the format is ignored.
More robust approach is to read all of them.

Audio format, while not used by the Probe module for PCM streaming,
takes part in the gateway initialization on the DSP side. With full
parametrization we gain better coverage with the data probing feature.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/probes.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index c7b70006354a..7bb5dec257b4 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -14,8 +14,8 @@
 #include "debug.h"
 #include "messages.h"
 
-static int avs_dsp_init_probe(struct avs_dev *adev, union avs_connector_node_id node_id,
-			      size_t buffer_size)
+static int avs_dsp_init_probe(struct avs_dev *adev, struct snd_compr_params *params, int bps,
+			      union avs_connector_node_id node_id, size_t buffer_size)
 {
 	struct avs_probe_cfg cfg = {{0}};
 	struct avs_module_entry mentry;
@@ -27,12 +27,16 @@ static int avs_dsp_init_probe(struct avs_dev *adev, union avs_connector_node_id
 		return ret;
 
 	/*
-	 * Probe module uses no cycles, audio data format and input and output
-	 * frame sizes are unused. It is also not owned by any pipeline.
+	 * Probe module uses no cycles, input and output frame sizes are unused.
+	 * It is also not owned by any pipeline.
 	 */
 	cfg.base.ibs = 1;
 	/* BSS module descriptor is always segment of index=2. */
 	cfg.base.is_pages = mentry.segments[2].flags.length;
+	cfg.base.audio_fmt.sampling_freq = params->codec.sample_rate;
+	cfg.base.audio_fmt.bit_depth = bps;
+	cfg.base.audio_fmt.num_channels = params->codec.ch_out;
+	cfg.base.audio_fmt.valid_bit_depth = bps;
 	cfg.gtw_cfg.node_id = node_id;
 	cfg.gtw_cfg.dma_buffer_size = buffer_size;
 
@@ -128,8 +132,6 @@ static int avs_probe_compr_set_params(struct snd_compr_stream *cstream,
 	struct hdac_ext_stream *host_stream = avs_compr_get_host_stream(cstream);
 	struct snd_compr_runtime *rtd = cstream->runtime;
 	struct avs_dev *adev = to_avs_dev(dai->dev);
-	/* compr params do not store bit depth, default to S32_LE. */
-	snd_pcm_format_t format = SNDRV_PCM_FORMAT_S32_LE;
 	unsigned int format_val;
 	int bps, ret;
 
@@ -142,7 +144,7 @@ static int avs_probe_compr_set_params(struct snd_compr_stream *cstream,
 	ret = snd_compr_malloc_pages(cstream, rtd->buffer_size);
 	if (ret < 0)
 		return ret;
-	bps = snd_pcm_format_physical_width(format);
+	bps = snd_pcm_format_physical_width((__force snd_pcm_format_t)params->codec.format);
 	if (bps < 0)
 		return bps;
 	format_val = snd_hdac_stream_format(params->codec.ch_out, bps, params->codec.sample_rate);
@@ -166,7 +168,7 @@ static int avs_probe_compr_set_params(struct snd_compr_stream *cstream,
 		node_id.vindex = hdac_stream(host_stream)->stream_tag - 1;
 		node_id.dma_type = AVS_DMA_HDA_HOST_INPUT;
 
-		ret = avs_dsp_init_probe(adev, node_id, rtd->dma_bytes);
+		ret = avs_dsp_init_probe(adev, params, bps, node_id, rtd->dma_bytes);
 		if (ret < 0) {
 			dev_err(dai->dev, "probe init failed: %d\n", ret);
 			avs_dsp_enable_d0ix(adev);
-- 
2.25.1

