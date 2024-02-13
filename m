Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F21E22F0A
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819170; cv=none; b=d37nf3VWfZhgI+crGnh9pFNQ8KEqb3b7iYMnBB/FsnEiO9hhYNk0Jf9x+iaxbhMtzWRlAa6kIj3TGBZdiIGN+IuRiuMjw6DyJB5T4EJzYPSaOTX325gpOvCDqwLX9GNJ1oKkUZiKDalt7ecVY6jAN06HF4Q4A42UN9IA1XRU8Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819170; c=relaxed/simple;
	bh=sfqgN8MdDQLESgNYvD+ncOhJBU6ZVSR571zpHo1kuUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPG6eZI4A8HS+8CxL3epCdzT1sqC4geGuxQ5BClIaASSpl9rcRIYJ0+A5sYYTxcnv9XAW6YxeJU1F8hkFcjOhrcZ0rk/ojiJZmAbjf3ZmVXLHZnnHAalIIuJRBPqhs5SE10ZXDZJZGRdZfCJV9x+Gnco0u+b76AqyuW9/v5i4Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heqJ8K80; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heqJ8K80"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707819169; x=1739355169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sfqgN8MdDQLESgNYvD+ncOhJBU6ZVSR571zpHo1kuUI=;
  b=heqJ8K80n+JRyjr5xkTVTM74tM76aoQpLPJr8C8FSZCWCNOBZzRKeoL9
   UBArUWejlZ4+11sVcEzWeZ9+pINXsQmurFSYFLqpjt5yK1spCOjTVi1M2
   66jVuTqOTfJ4zDX0jlwW4azElUe3jaAAdLjRAKfosc70v2cXvW+xdF5e5
   CwmhKz0XOx6625gPWGxGaE5NZg4xTwJbxQ9D0KMcVWHLLC3BjSbJ4cHvN
   qSRNK0dv3qsVvgBU4muxYH3JmLFfyjHyC0/DGRtRIMxAgK9IO5Sa2dMpt
   bOQCc6dZYTTYReSoCVCKvFMlOT43z29zlqZKj7TyIHnB3x2XcCPU8NNPg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27260162"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="27260162"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7498028"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:47 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 04/15] ASoC: SOF: Intel: hda-dai-ops: enable chain_dma for ALH
Date: Tue, 13 Feb 2024 12:12:36 +0200
Message-ID: <20240213101247.28887-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
References: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Use the existing callbacks and mix/match of HDaudio and SoundWire
support.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 55ce75db23e5..f58539d2f937 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -522,6 +522,17 @@ static const struct hda_dai_widget_dma_ops hda_ipc4_chain_dma_ops = {
 	.get_hlink = hda_get_hlink,
 };
 
+static const struct hda_dai_widget_dma_ops sdw_ipc4_chain_dma_ops = {
+	.get_hext_stream = hda_get_hext_stream,
+	.assign_hext_stream = hda_assign_hext_stream,
+	.release_hext_stream = hda_release_hext_stream,
+	.setup_hext_stream = hda_setup_hext_stream,
+	.reset_hext_stream = hda_reset_hext_stream,
+	.trigger = hda_trigger,
+	.calc_stream_format = generic_calc_stream_format,
+	.get_hlink = sdw_get_hlink,
+};
+
 static int hda_ipc3_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
 				 struct snd_pcm_substream *substream, int cmd)
 {
@@ -620,6 +631,8 @@ hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidg
 	}
 	case SOF_IPC_TYPE_4:
 	{
+		struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
+		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
 		struct sof_ipc4_copier *ipc4_copier = sdai->private;
 		const struct sof_intel_dsp_desc *chip;
 
@@ -627,15 +640,10 @@ hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidg
 
 		switch (ipc4_copier->dai_type) {
 		case SOF_DAI_INTEL_HDA:
-		{
-			struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
-			struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
-
 			if (pipeline->use_chain_dma)
 				return &hda_ipc4_chain_dma_ops;
 
 			return &hda_ipc4_dma_ops;
-		}
 		case SOF_DAI_INTEL_SSP:
 			if (chip->hw_ip_version < SOF_INTEL_ACE_2_0)
 				return NULL;
@@ -647,6 +655,8 @@ hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidg
 		case SOF_DAI_INTEL_ALH:
 			if (chip->hw_ip_version < SOF_INTEL_ACE_2_0)
 				return NULL;
+			if (pipeline->use_chain_dma)
+				return &sdw_ipc4_chain_dma_ops;
 			return &sdw_ipc4_dma_ops;
 
 		default:
-- 
2.43.0

