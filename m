Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ADE225A4E
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 09:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834085; cv=none; b=FCPui1T63QzzoI/WDYPLPnh5XBZtZJlxRnfZTG0/XUcgRAkKPwgHrmKmlZBd11rBF/QP/UmcFcj+M5szviTBDw4Tzwtp2uzJZ5as9jlvVxwVXfda1QRr10VdFeX1FYfAvZG0foF3ICHclUg3wHavGNnkgZrrAdlH6zweDTPz4GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834085; c=relaxed/simple;
	bh=kWPYaOM+tNUP2nUoGSezs/YlpoOq1MfS0jnZRjomiks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QyOMw9StMxdhpJAKsuBxx+AxzaDlzPfLl5xlNsL4K25qk1kfZsJiBseyU9gX/ZjwlX1nH+aH4K9Wq3cxrG281tCjxlsccNyjoZCUfHAYzY4TvMoQfj71U/IHYuLvHJ9EkMA+YEJqz0RHklnTpkayjmxjMKJeTwrEC+XfMckx0LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSQY2a64; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSQY2a64"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738834084; x=1770370084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kWPYaOM+tNUP2nUoGSezs/YlpoOq1MfS0jnZRjomiks=;
  b=kSQY2a64EEVpjH/pgACQLLwkWyMDFvGdfeK1X3GQ0SoQBOxL+FivTBBG
   TzgHJLSAyANIhCp32SgRQanAVlEnmmCTYwd6bCl6kzYKvsUQfq4lKDzd0
   f08q6uFMHX9dN9RdG+ktQ2FxwfZyERXXZ2a3kp+EbFaoxn2cGAJc8lBxA
   spFSylRgULGkVNH+MrTGQXMd9+6tcIwxhjPd0WsU29ixeT88eK+HHvcis
   3PIyL8kETCxNyLInjxYkuHn03CIWl5bTugrepJQ06YGgz3lPPjULmHvHQ
   4nmWCcZ0gRUPUzlo2ghJuZhRgmJI/BDWj0r0qSK2ShPBY7DdvtMBNSm91
   g==;
X-CSE-ConnectionGUID: boNxvH2bQFa0PX1zGnvHZQ==
X-CSE-MsgGUID: vV8JEIBoT3KuXZks3XERsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43090030"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="43090030"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:28:04 -0800
X-CSE-ConnectionGUID: eUYyGLruQCSD84gIOkoR1Q==
X-CSE-MsgGUID: 1ULd2Sn6TEekqP++dleDNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148362036"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:28:01 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 4/4] ASoC: SOF: ipc4-topology: Improve the information in prepare_copier prints
Date: Thu,  6 Feb 2025 11:28:28 +0200
Message-ID: <20250206092828.7569-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206092828.7569-1-peter.ujfalusi@linux.intel.com>
References: <20250206092828.7569-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is useful to know the explicit type and if the copier (host/dai) is
configured to use ChainDMA or not and also the stream_tag for the host
copier.

Change the prints to carry more information for debugging purposes.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 21e29bfd4b22..a23f55ed5696 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1815,15 +1815,19 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	bool single_output_bitdepth;
 	int i;
 
-	dev_dbg(sdev->dev, "copier %s, type %d", swidget->widget->name, swidget->id);
-
 	switch (swidget->id) {
 	case snd_soc_dapm_aif_in:
 	case snd_soc_dapm_aif_out:
 	{
+		struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
+		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
 		struct sof_ipc4_gtw_attributes *gtw_attr;
-		struct snd_sof_widget *pipe_widget;
-		struct sof_ipc4_pipeline *pipeline;
+
+		dev_dbg(sdev->dev,
+			"Host copier %s, type %d, ChainDMA: %s, stream_tag: %d\n",
+			swidget->widget->name, swidget->id,
+			str_yes_no(pipeline->use_chain_dma),
+			platform_params->stream_tag);
 
 		/* parse the deep buffer dma size */
 		ret = sof_update_ipc_object(scomp, &deep_buffer_dma_ms,
@@ -1840,9 +1844,6 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		copier_data = &ipc4_copier->data;
 		available_fmt = &ipc4_copier->available_fmt;
 
-		pipe_widget = swidget->spipe->pipe_widget;
-		pipeline = pipe_widget->private;
-
 		if (pipeline->use_chain_dma) {
 			u32 host_dma_id;
 			u32 fifo_size;
@@ -1896,6 +1897,10 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
 		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
 
+		dev_dbg(sdev->dev, "Dai copier %s, type %d, ChainDMA: %s\n",
+			swidget->widget->name, swidget->id,
+			str_yes_no(pipeline->use_chain_dma));
+
 		if (pipeline->use_chain_dma)
 			return 0;
 
@@ -1929,6 +1934,9 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	}
 	case snd_soc_dapm_buffer:
 	{
+		dev_dbg(sdev->dev, "Module copier %s, type %d\n",
+			swidget->widget->name, swidget->id);
+
 		ipc4_copier = (struct sof_ipc4_copier *)swidget->private;
 		copier_data = &ipc4_copier->data;
 		available_fmt = &ipc4_copier->available_fmt;
-- 
2.48.1

