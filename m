Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7392B320CD3
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 07:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779436616; cv=none; b=OE7nWLAn2Tt1vsLAqHueC4r287gIesBk86Z86I/1jkmp0a6VAKrwrNSi4UFdJRwF+Zs/BRq7PUvTjDwDuc2WHZjS4j7zricjcXIzHL2/fyqbz/hNW2ylle9/Uzh18pyNt3fk74IaZK5d3qiYhBHa2oPkowZFe/rLFdNRJRgaFSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779436616; c=relaxed/simple;
	bh=gyaKG3AWNtxZAQAKpMJSTBBNXIRLWlFbZAjNTfqCi1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=blhI8VOzEt9qx5FtKQYJBBoMghgVCIG4EpOx9QpchMpGxC6lqE5J3f1YQ6uKA7DN1KRKcgD9Ani6tmaR3lEzAftGW1BVwCdDDCRg+T5Cilv+rBkwFC9gLySoZPrA7J2LPJQySSQ5pbjhsrFVKPbHgT5kw5zJZW83lQEjBhANwpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLBzVMRN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLBzVMRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779436614; x=1810972614;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gyaKG3AWNtxZAQAKpMJSTBBNXIRLWlFbZAjNTfqCi1w=;
  b=XLBzVMRNXKiMa6BxP2mI7k6SF4dor8xyGeaUHFV4Q9BTehcLZeW7AMJ1
   DqXyabgeRKerAtkbliCy440GfKxjteoH4PU/jIC7aBBrrjq4hby0cdQ9z
   fRKpXcxl4+jcPPWsT/ro4uuE9arzxK76YYUDsv1ssm/CSoPx1Keeiifl1
   bL6m1de/z/H+W7N0Z6Vvg7dxZb1OiL/i8HmVKUtc3lrrJKA2GSvFMf7pf
   ic07y9ppkKw5fAjaEWom0R6yNPgfw1sNvUYXSo9z0HMRsQHq5pwlUhJ76
   DV71jXX/A2ALCz+4aOfKxTifxs6KmmNLedSej4ENoFmLv6eo8CGnt/pYU
   w==;
X-CSE-ConnectionGUID: 4WDr37tzREuvKW/mfqvMbw==
X-CSE-MsgGUID: iPfGvbJHQOm8i63T9BISZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="79514253"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="79514253"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 00:56:54 -0700
X-CSE-ConnectionGUID: 5HGfTyatQw+dLmuXTcJSVA==
X-CSE-MsgGUID: d/+OMh6iQ8OqgWh8WNkjzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="240011939"
Received: from slindbla-desk.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.207])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 00:56:51 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH v3] ASoC: SOF: ipc4-topology: Enable deep buffer capture
Date: Fri, 22 May 2026 10:56:59 +0300
Message-ID: <20260522075659.2645-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>

This patch lets a capture PCM to operate with deep buffer
by taking dsp_max_burst_size_in_ms from topology if it is
defined. Earlier the value from topology was omitted for
capture.

If not defined, the maximum burst size for capture is set
similarly as before to one millisecond.

The dma_buffer_size is set similarly as for playback from
largest of deep_buffer_dma_ms or SOF_IPC4_MIN_DMA_BUFFER_SIZE
times OBS.

Signed-off-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Changes since v2:
- fixed my SoB tag from SB...

Changes since v1:
- added my SoB tag, sorry

Peter

 sound/soc/sof/ipc4-topology.c | 39 +++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 76812d8fb567..65756fe3a64f 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -624,6 +624,7 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 	struct sof_ipc4_available_audio_format *available_fmt;
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct sof_ipc4_copier *ipc4_copier;
+	struct snd_sof_pcm_stream *sps;
 	struct snd_sof_pcm *spcm;
 	int node_type = 0;
 	int ret, dir;
@@ -668,24 +669,23 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 	if (ret)
 		goto free_available_fmt;
 
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
-		struct snd_sof_pcm_stream *sps = &spcm->stream[dir];
+	sps = &spcm->stream[dir];
+	sof_update_ipc_object(scomp, &sps->dsp_max_burst_size_in_ms,
+			      SOF_COPIER_DEEP_BUFFER_TOKENS,
+			      swidget->tuples,
+			      swidget->num_tuples, sizeof(u32), 1);
 
-		sof_update_ipc_object(scomp, &sps->dsp_max_burst_size_in_ms,
-				      SOF_COPIER_DEEP_BUFFER_TOKENS,
-				      swidget->tuples,
-				      swidget->num_tuples, sizeof(u32), 1);
-		/* Set default DMA buffer size if it is not specified in topology */
-		if (!sps->dsp_max_burst_size_in_ms) {
-			struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
-			struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
+	/* Set default DMA buffer size if it is not specified in topology */
+	if (!sps->dsp_max_burst_size_in_ms) {
+		struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
+		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
 
+		if (dir == SNDRV_PCM_STREAM_PLAYBACK)
 			sps->dsp_max_burst_size_in_ms = pipeline->use_chain_dma ?
 				SOF_IPC4_CHAIN_DMA_BUFFER_SIZE : SOF_IPC4_MIN_DMA_BUFFER_SIZE;
-		}
-	} else {
-		/* Capture data is copied from DSP to host in 1ms bursts */
-		spcm->stream[dir].dsp_max_burst_size_in_ms = 1;
+		else
+			/* Capture data is copied from DSP to host in 1ms bursts */
+			sps->dsp_max_burst_size_in_ms = 1;
 	}
 
 skip_gtw_cfg:
@@ -2430,10 +2430,19 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			copier_data->gtw_cfg.dma_buffer_size);
 		break;
 	case snd_soc_dapm_dai_out:
-	case snd_soc_dapm_aif_out:
 		copier_data->gtw_cfg.dma_buffer_size =
 			SOF_IPC4_MIN_DMA_BUFFER_SIZE * copier_data->base_config.obs;
 		break;
+	case snd_soc_dapm_aif_out:
+		copier_data->gtw_cfg.dma_buffer_size =
+			max((u32)SOF_IPC4_MIN_DMA_BUFFER_SIZE, deep_buffer_dma_ms) *
+				copier_data->base_config.obs;
+		dev_dbg(sdev->dev, "copier %s, dma buffer%s: %u ms (%u bytes)",
+			swidget->widget->name,
+			deep_buffer_dma_ms ? " (using Deep Buffer)" : "",
+			max((u32)SOF_IPC4_MIN_DMA_BUFFER_SIZE, deep_buffer_dma_ms),
+			copier_data->gtw_cfg.dma_buffer_size);
+		break;
 	default:
 		break;
 	}
-- 
2.54.0

