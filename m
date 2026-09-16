Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826EA4EA39D
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560244; cv=none; b=i0fNgsMwMAyzcDoJw0QMvA6mGX6ctApthpV+uW7ozbIpWPp4+GzWCAcfod7CCn90NhIjM8LEqzXw6IC4gt23E4FlSAKiluePwjXBfBu2DVdNATfkzQgdREEdMOZq7GHpoPX0sS1Dt7LJK5DbfJHFZSeS2JRyZguHXr57gsr8oYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560244; c=relaxed/simple;
	bh=hakHFEiBnMn6B3AmWrYWjV78TSDtafMAaCvas/4P/QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dzj0t24hmisSkeRHVyBa1qlU/uZP6H91deNwOVI55U+C2Ncqc/y3aVqiIlvc4If30/WIXDvKu/kk2MRhZ69hZvGv6NGIaeDOjNHmbNE64rXitSUKIYYd2pblSXE/+Sd01RTw/bjzrgZsd7ZvqexTprqJb0Nz9/9aK2nbk83CxLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tm9LDCjc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tm9LDCjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560235; x=1821096235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hakHFEiBnMn6B3AmWrYWjV78TSDtafMAaCvas/4P/QQ=;
  b=Tm9LDCjcZw5UIl2Tyjib/cTXxkm82KMSXLadMtLRkBnD59cXRiXrf/QA
   SWkN6olTXyDwOhSKaO3gbqv51q44Yv4kL6iElTFAEicmHBBVbvQ8c9A8K
   FFxnAWyP5N7XofKSJOL04NjqSr979nEf0V4Z0iTtRmQTFIk20STy2VwRZ
   u+4jNHww2tn2l1HyBMVI4yVdXjHI+ya70nuun6xDsVBpwQ/6aB+Kkcexl
   +6gSsYT6R4WVVZZjrBlmk1uNOLv2+rvXTMBU45PqzIC7fmo7u5Ug9HA83
   XTd9nvm5FkN6LaNAbwXEqC++Gw1rA8sBS4r7lvES52FGaVkNnRZNdskDw
   w==;
X-CSE-ConnectionGUID: pqg/Ro32SFq+r7rQ9HfN4Q==
X-CSE-MsgGUID: SB4P7QuaSRiJnU+9aQqFXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496381"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496381"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:48 -0700
X-CSE-ConnectionGUID: accXbmnnS8KgA4bApctlYw==
X-CSE-MsgGUID: u6SK+SU0QkWuxtI3l8oaDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293452"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:45 -0700
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
Subject: [PATCH v4 12/26] ASoC: SOF: sof-audio: Expose a couple of functions
Date: Wed, 16 Sep 2026 15:03:06 +0300
Message-ID: <20260916120320.18318-13-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
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

