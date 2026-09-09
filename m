Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4A3491589
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945011; cv=none; b=M1s68xeg9sJULs+7tKz52gmUJMLcf9c/K6OpjSdZbArccgWgc75y2C7Dvu6tF7fiw04wgpGirZILR1WdR0PS6T55oOgd5ZJZS3WaaM1NJfYE+NYcvqUHOqp6OF5N8zp5sQ5RK2AHslB6wP7Kb6D8HENlW5j0t28pnJlAux8TPog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945011; c=relaxed/simple;
	bh=hakHFEiBnMn6B3AmWrYWjV78TSDtafMAaCvas/4P/QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=guGMS+kQZh/2QA4F0m7XBkVDFPv44JtTro2uCPZ1t97dH1WcRQ0tJVPnRjGzPq0r52d0uL39A6/DGdRxrq/hzgx7ebVsLwMKb7YSDSyG7xFIuczMeEl0u/6Cy2uXtXiviorNdSKwTWsk5tRNHlgzoJK4OB8EcUVU4xZILepeZrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsZnyxmD; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsZnyxmD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945011; x=1820481011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hakHFEiBnMn6B3AmWrYWjV78TSDtafMAaCvas/4P/QQ=;
  b=JsZnyxmDCB52t3spWRoB5JIYkVUEG2zTWNkx48h7Q/v2EvcAnDmGCQTZ
   Bzn+XFkpq+q633HlHDbF+hEzbef4Xq5y1qcktqfxukE6B1hEzbyPR50kZ
   MzDl8JK7VCVvrMUfQCKg+RBLOLjtKi9xhLVdXYJEnvvU+JsqpEiZPpRIC
   zzLdXTEN8biD4DNnyqY6Kq+bfJkeBzKIKpjQlZdQv7ptEJcFez9WOMOsC
   E3iIaNaINLrfJpgEwMDIlztXycXZ6NDmhHBMfRmFavCiZX4DFyrrRdPNv
   ch5Rrgvw8uzNALhUuOooGbftsSniDovUATmx8QRYqroRNX3ytecVRSdB4
   g==;
X-CSE-ConnectionGUID: bcBZg+4zSr23wuey6ZLYjQ==
X-CSE-MsgGUID: wBxoQWoUQwmJVhCpBFOB7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200695"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200695"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:11 -0700
X-CSE-ConnectionGUID: wGgU9UO8RxuWoUhKjySxUw==
X-CSE-MsgGUID: Ey0Hod25REuFgldMx2NETg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266972979"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:07 -0700
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
Subject: [PATCH v2 10/24] ASoC: SOF: sof-audio: Expose a couple of functions
Date: Wed,  9 Sep 2026 12:09:35 +0300
Message-ID: <20260909090949.7503-11-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
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

