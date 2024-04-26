Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDFC149C4B
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145956; cv=none; b=ljkjPVALdn72IR7b4voKx+GeCaM7gtnQnvAKi7eyu2q1oFgVaBVa/TXyvtBaChBW7pSNSiu3WOBXQvlL1iWROsJ1WtEK5Uk5JeKVFyakDiQzo87GAK3JJXC++Sb0bj9SqAujEobg3NI6iOFirbrYP8aJ1NShhTJTb9pOnFt8IgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145956; c=relaxed/simple;
	bh=wI9fs7bgOEAA0afP8UWfMGEmXEEIps2sXvmF8aVgK6g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZPrPiutCKZKdOX99nYTAinHii3Yrnfm4AaqPqNFw9vPQCJTAqSU/Vtd4G9BAtla+hPTS6Zik7oBVT2eBYCiWBwxIQ6GEW+Fq1Jw711GMsc6OqRPqlfqKQpYE9jhCFY8xvz4SFWOAtMTZH3UOwfmkAQS16Yet6uqjP3gmifUiZf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tjv8GJ/4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tjv8GJ/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145955; x=1745681955;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wI9fs7bgOEAA0afP8UWfMGEmXEEIps2sXvmF8aVgK6g=;
  b=Tjv8GJ/4IRcvYkYSa9aDPe/lVDsYr2/XLWvNY9p1UdYq6LIRnsZil9sY
   wgi7gkW5/xqxN3XCPXBq4jnjwB2lf8je/cagJ13byvNuV7ABtdPNOoKEt
   1QM8ldlX54fvU0/8Uie5NWTd+pglrxDBwGA42O/vGgZtOjkIVJnTi64Z6
   +Letz8qr7cDYYlYmPiZEvFPdiF8tPn3ulDBaQEmR8k/gN7nIpEoDWO7iQ
   cJePsqLtOb/3J+f9p6qJWl1yyhdf/lwIzVcKQfheqtDp1MbuUzl5dg1/E
   6MT+JrFjde1PA3knilLC8xE0g6zC6QgYq89L4DMsUlqys+wHf2nhbMqQh
   Q==;
X-CSE-ConnectionGUID: TBURry68SQeFGdbWT50Zbg==
X-CSE-MsgGUID: YFvy0MhjRZigfd/PUvkqxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9718450"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="9718450"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:39:12 -0700
X-CSE-ConnectionGUID: fX3s3AjXS8KoheNEiPO6EQ==
X-CSE-MsgGUID: hdG1BTC5TUCJVMdKkP2OEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="56623543"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:39:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 5/5] ASoC: SOF: ipc4-topology: Advertise passthrough capable PCMs (using ChainDMA)
Date: Fri, 26 Apr 2024 10:39:02 -0500
Message-Id: <20240426153902.39560-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
References: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

If a PCM is set to use ChainDMA then add it to the card->components string
after a marker of iec61937-pcm:, for example on current HDA platforms where
HDMI is set to use ChainDMA:
iec61937-pcm:5,4,3 (the order of the PCM ids can differ)

UCM is expected to parse and use this property to allow applications to
use bytestream passthrough in a standard way.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 50 +++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index c29c1de4e925..a972b2b5122a 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -407,6 +407,52 @@ static void sof_ipc4_widget_update_kcontrol_module_id(struct snd_sof_widget *swi
 	}
 }
 
+static int
+sof_ipc4_update_card_components_string(struct snd_sof_widget *swidget,
+				       struct snd_sof_pcm *spcm, int dir)
+{
+	struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
+	struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
+	struct snd_soc_component *scomp = spcm->scomp;
+	struct snd_soc_card *card = scomp->card;
+	const char *pt_marker = "iec61937-pcm";
+
+	/*
+	 * Update the card's components list with iec61937-pcm and a list of PCM
+	 * ids where ChainDMA is enabled.
+	 * These PCMs can be used for bytestream passthrough.
+	 */
+	if (!pipeline->use_chain_dma)
+		return 0;
+
+	if (card->components) {
+		const char *tmp = card->components;
+
+		if (strstr(card->components, pt_marker))
+			card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+							  "%s,%d",
+							  card->components,
+							  spcm->pcm.pcm_id);
+		else
+			card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+							  "%s %s:%d",
+							  card->components,
+							  pt_marker,
+							  spcm->pcm.pcm_id);
+
+		devm_kfree(card->dev, tmp);
+	} else {
+		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+						  "%s:%d", pt_marker,
+						  spcm->pcm.pcm_id);
+	}
+
+	if (!card->components)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 {
 	struct sof_ipc4_available_audio_format *available_fmt;
@@ -452,6 +498,10 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 	if (!spcm)
 		goto skip_gtw_cfg;
 
+	ret = sof_ipc4_update_card_components_string(swidget, spcm, dir);
+	if (ret)
+		goto free_available_fmt;
+
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
 		struct snd_sof_pcm_stream *sps = &spcm->stream[dir];
 
-- 
2.40.1

