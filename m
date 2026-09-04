Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C954F387590
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507118; cv=none; b=ZgHH5X8E54K9pGOfyhIj/4aoP08cI3sNWrNkfGPszmgATY++s4JLocq69z1bEUD0gv2fO+ZGS904AWowxjQzteax1A29r6NNLC5LT3Gd4omq2pEsFGur/k19KhBPIf2UQp8F9D0Vra4ALgjydsaob/tWXLuQsJ9QSRNnuRf40CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507118; c=relaxed/simple;
	bh=hakHFEiBnMn6B3AmWrYWjV78TSDtafMAaCvas/4P/QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mscbyg82cQWkKijAOp/RYe65Frfaci35Nlmeyaxl+xGVc6k/fE8kfweMTc2XnTfVlEX4CNJDCFOihFYkhR97J/fM1mmQySCv3nu6PncpW/NOOI0oK6QH2jcpj5/XLvyOrxIZWK382DXsARD6J54dSEOjfpUPHIVSMB5dudedTXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7OG2obl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7OG2obl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788507117; x=1820043117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hakHFEiBnMn6B3AmWrYWjV78TSDtafMAaCvas/4P/QQ=;
  b=g7OG2oblXdw6Ymc+15jPxi4oQG7tTtNtfoxyOsTq3B43hDXlJDyQi5mn
   p10J8wq3k9PwS2N3qTgffwWIBUcOZfAY3fSo7E8D+aUJ1+hgcMYnwWbHg
   P8uquo4aupg+VUB63Wvo3cBzLYAyXvb9F9kuEOlk7cetLl2UXyjBvwhob
   F+QVC2z8FddfGF99cN9vhTAjLvbIM9GTK8sHfv97Gon0RAHwR5zayK+Z1
   dAL1kkiNdrlwLvzu+vJAJRyflUOuHbNygCL0QUU/X4ZlshCEh+mFWoe6r
   Pzi0yKNqWvUI3C2APMDHEyiZUfbXz9izKnC35iLf2QgjoHu8miBwLDPrI
   w==;
X-CSE-ConnectionGUID: YAz5Zuy0Sz6V8y4s7rrPwg==
X-CSE-MsgGUID: 7bvhdAOcTb2R8plWIfNASw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="111777879"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="111777879"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:31:56 -0700
X-CSE-ConnectionGUID: i6+W0EjrRM6fFuCo50pg7A==
X-CSE-MsgGUID: /dlBqnlXSliISV70sBvzoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293480592"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.213])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:31:53 -0700
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
	daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: [PATCH 09/23] ASoC: SOF: sof-audio: Expose a couple of functions
Date: Fri,  4 Sep 2026 10:31:20 +0300
Message-ID: <20260904073134.29648-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
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
2.55.0

