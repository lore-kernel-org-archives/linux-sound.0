Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F03D241F9
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819178; cv=none; b=KnFUa4HyvfGY1kMYdvztkaK7qYtVfnyWUTc8QSjqjE1VGOnagJizRGNGlTVgbemg686+L1D177rJeQoPKvLrtr4aSKmuswZEP1PkosGPTvvZEdzcv1C51hBksQTSMIMAJY6TAOt5SyuiGvSwZPgxNXw5mT0YCMhtrBULxSwaWEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819178; c=relaxed/simple;
	bh=eWpoH4swcdLp7U8NzyeXkUdehXm3/4KxEfHXawP+Tnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1JCbBVQtSrfWs4gTQh/9y/+FZ2ydGkCy6yqIH3J1OHDkazhopcnGz7hE1OMtypWw5yRGGavi3dYO/QDft+2jWAPQba+8cU9uXV5TTTAkAegMb4SX2VZ6l41cPpL7Gm6CNpXa9RJw8XUAtsjqGgKOThnpQdxRpgGlZdoz6697ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mu4GYjBE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mu4GYjBE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707819176; x=1739355176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eWpoH4swcdLp7U8NzyeXkUdehXm3/4KxEfHXawP+Tnc=;
  b=Mu4GYjBEB3Ke7DwAoVtRqVtp+HQfszlXTbdDGTZGGzMs6zKScMtgcubF
   iv5yJVYyDUMa5WRPiUDERSGpQgQtJJO6Caf6jwxReRKlIi9yNICiaaEvB
   irn6w6ShUPaRkCFd4tvz5VTPLkzmC3pPj0c1t77I1DKmzkTLNgI6F/7xb
   pqF4sV4hmOlVrwAUq93mNSm4qxLFgNBO3yQ1Jx+Fylsgqmh5KJmRLcJTa
   evLwurgweYZe72S5bug9lx70Wa9MbwLdBdKA4GBDrRitlSWOT+DdLjTHd
   0bg7n1SgjSocvCy/FFKB8y5ZKrPpWN+NzCsAfGK3/femQzFNPYjLeGTv7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27260173"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="27260173"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7498048"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:54 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 07/15] ASoC: SOF: ipc4-topology: allow chain_dma for all supported DAIs
Date: Tue, 13 Feb 2024 12:12:39 +0200
Message-ID: <20240213101247.28887-8-peter.ujfalusi@linux.intel.com>
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

Now that we have a 'is_chain_dma_supported' callback we can use it to
double-check possible disconnects between a topology file enabling
chain-dma for a DAI and the hardware/firmware capabilities.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 8ac35e6df75f..98e2f83b1c09 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -509,6 +509,7 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 {
 	struct sof_ipc4_available_audio_format *available_fmt;
 	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_sof_dai *dai = swidget->private;
 	struct sof_ipc4_copier *ipc4_copier;
 	struct snd_sof_widget *pipe_widget;
@@ -552,10 +553,11 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 
 	pipe_widget = swidget->spipe->pipe_widget;
 	pipeline = pipe_widget->private;
-	if (pipeline->use_chain_dma && ipc4_copier->dai_type != SOF_DAI_INTEL_HDA) {
-		dev_err(scomp->dev,
-			"Bad DAI type '%d', Chained DMA is only supported by HDA DAIs (%d).\n",
-			ipc4_copier->dai_type, SOF_DAI_INTEL_HDA);
+
+	if (pipeline->use_chain_dma &&
+	    !snd_sof_is_chain_dma_supported(sdev, ipc4_copier->dai_type)) {
+		dev_err(scomp->dev, "Bad DAI type '%d', Chain DMA is not supported\n",
+			ipc4_copier->dai_type);
 		ret = -ENODEV;
 		goto free_available_fmt;
 	}
-- 
2.43.0

