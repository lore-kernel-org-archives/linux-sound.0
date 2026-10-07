Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D483D4135
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363018; cv=none; b=tHG4+waQ1ZtruD3xQMpHxEVhO28td3Q4660DU9zSlbvvGhuEbXk9bZq2xeuWJUEADJEaDDNnYSfJPRDFE+7ibHBq4byp4Rf13UVASoI/pQeTkGWU73z8wY/6QHpbloIWoBFBIbCP20Ottz+kn91qK7p6Cm0whTpwpOCH/LE/n4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363018; c=relaxed/simple;
	bh=+YXLKfOQX+e9PUfmIHNhXEQxKXPUW49E1q4Qu6WVFj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mwvJ6w7GTDnzRr3wGAMatlrB4Ea1B1M10jKCypeP72JPB+2VQh622u5KqhaLetU9Pe/Df8tVI+k1GG2OlvNhicoNpTQ3FZHfRkQsg1IPfoLOdyOhM2XD0bLSNr0UFVIO8Y17QPMqu1EB0oLIWZRRjQD2LZwX6BgS3yEa9ZFG5B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7UuREqS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7UuREqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791363018; x=1822899018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+YXLKfOQX+e9PUfmIHNhXEQxKXPUW49E1q4Qu6WVFj0=;
  b=U7UuREqSEziZ0HLF3kktyyDPiayY1idcTmR4XzCzNdHeuOsyD83eSXq/
   AUL/WCiK5/ntBJu/aeWlqMPVY7PXCaOf40HdHJoqfyTlx24B0de9yJVen
   OzyviRAW9ldmgGH+/Zg8TXZMD0mJYvcKb7SudrYKiNsSgzUAalNHNvM1o
   4FWJ5Oh3Encg1tqL2lgTLj7N4Hbaq4Pa+6p9o/VyO4an6OsVdUi0uI+Pi
   /0221gJ7PxD4IR6xqtPoq3kDXrgWm4ETViF7y2VQwLM58ZRki7lem7p0v
   qajvZwVaHPJXEcvl9uf6iMq1ZcJP+08nWJahmdVrD+g1tR4VIDyhdywQ3
   g==;
X-CSE-ConnectionGUID: 188SN9q8QIGcXzIZKTt96w==
X-CSE-MsgGUID: uPsVubGvRNGy8ashmfGYQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="113955"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="113955"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:17 -0700
X-CSE-ConnectionGUID: p1FW+DKgTT6Ujkip7bKUcw==
X-CSE-MsgGUID: qWhi+cBsTeCoEA3SbyiixA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670678"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:14 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v5 13/28] ASoC: SOF: sof-audio: Expose a couple of functions
Date: Wed,  7 Oct 2026 11:49:40 +0300
Message-ID: <20261007084955.1256-14-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

These are common functions that will also be needed for the IPC4
compressed support.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/pcm.c       | 6 +++---
 sound/soc/sof/sof-audio.h | 7 ++++++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 941baa48b275..8f59c200b8ec 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -66,7 +66,7 @@ void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream)
 }
 EXPORT_SYMBOL(snd_sof_pcm_period_elapsed);
 
-static int
+int
 sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_runtime *rtd,
 				struct snd_sof_pcm *spcm, struct snd_pcm_hw_params *params,
 				struct snd_sof_platform_stream_params *platform_params, int dir)
@@ -100,8 +100,8 @@ sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_run
 	return 0;
 }
 
-static struct snd_sof_widget *snd_sof_find_swidget_by_comp_id(struct snd_sof_dev *sdev,
-							      int comp_id)
+struct snd_sof_widget *snd_sof_find_swidget_by_comp_id(struct snd_sof_dev *sdev,
+						       int comp_id)
 {
 	struct snd_sof_widget *swidget;
 
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index bd5bbaf9ae44..1b3e66037584 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -636,7 +636,12 @@ struct snd_sof_pcm *snd_sof_find_spcm_comp(struct snd_soc_component *scomp,
 					   int *direction);
 void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream);
 void snd_sof_pcm_init_elapsed_work(struct work_struct *work);
-
+int sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_runtime *rtd,
+				    struct snd_sof_pcm *spcm, struct snd_pcm_hw_params *params,
+				    struct snd_sof_platform_stream_params *platform_params,
+				    int dir);
+struct snd_sof_widget *snd_sof_find_swidget_by_comp_id(struct snd_sof_dev *sdev,
+						       int comp_id);
 /*
  * snd_sof_pcm specific wrappers for dev_dbg() and dev_err() to provide
  * consistent and useful prints.
-- 
2.56.0

