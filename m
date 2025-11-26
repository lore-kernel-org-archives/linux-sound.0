Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CB72E7F32
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149722; cv=none; b=NMmd/fwKVGryUsm9+tnT16ouLEQ1/QgzGeOqDkGHmp/dKxXczTSSH/v/4PEEtjgStJsQbfSBtJ+XQXGWBGKfN5oNgO1WMFy9GjCmpx1qVWFsl9IdrPG2dodbeDN1lXT7j/e/xvkZ3Wl7HkbEfwoZDrDynkzSCpy5m5pjcuoklLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149722; c=relaxed/simple;
	bh=Lvv5j9ShxdrvyGJFnX8YQ7QrCe6sYUPEZFDR28PgTJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UqELBv6eid3la0Ej/4vajRUg37aXVTH4ccRpjcrllWWRodx7mur6OLnCKahflb1Ydz8SpMbud8b5R6TAdBa37DHNT9yvnBrQ6MIUFiLu2dH9VBCG2/p9DyPBeRLxhE5gJx02XhtBk5bewkt589lB5s0Ijk6hTvElkH2uY1bwiIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pi4KK37D; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pi4KK37D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764149721; x=1795685721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lvv5j9ShxdrvyGJFnX8YQ7QrCe6sYUPEZFDR28PgTJQ=;
  b=Pi4KK37Dm6iBe+6XxjTignUrW8mN/FUNehi78QoAHwP+l93G2NOZVMFJ
   f/7dv2ztRsOXUNPN2r/Per8Ig7eawhb3Mu/Z+YJ30IvnLbCy+2RzEN9B/
   ptqyxdyCPl+5kRmuS5q2RYczCR+NQWWZAw7f6q/Vlq5WIiFsfKqm147dY
   QAp+dOcTJL0XZqwoLgrURk1ZIIgdFbc/s4KzNeM4XG1lwkFQG3GGb9Joo
   zlEEmxbSwBUBqF70GgUil/OdnIaBkOLIwWbXk2hJff2CmICQvYs2dfboS
   xgZD849gyDzk9/AVSPOr1i0Xrup+RzGoAdYd/KuKTDXxEIRJpjos31PZN
   Q==;
X-CSE-ConnectionGUID: kPOey8RwTTib2O1Tw19QFA==
X-CSE-MsgGUID: 27pQc9Z2SF6HR52q3ck8gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="68769310"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="68769310"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 01:35:21 -0800
X-CSE-ConnectionGUID: CzkwN28UTu69rVQIs95wTQ==
X-CSE-MsgGUID: 2Sy9REpRQ5aLqUFw2U5o8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="216251727"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2025 01:35:19 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 5/6] ASoC: Intel: catpt: Do not ignore errors on runtime resume
Date: Wed, 26 Nov 2025 10:55:22 +0100
Message-Id: <20251126095523.3925364-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251126095523.3925364-1-cezary.rojewski@intel.com>
References: <20251126095523.3925364-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If pm_runtime_resume_and_get() fails, follow up pm_runtime_xxx()
operate on device in erroneous state.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c   | 12 ++++++------
 sound/soc/intel/catpt/sysfs.c |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 9baaad13a273..abd1cb07c60c 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -671,7 +671,7 @@ static int catpt_dai_pcm_new(struct snd_soc_pcm_runtime *rtm,
 		return 0;
 
 	ret = pm_runtime_resume_and_get(cdev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret)
 		return ret;
 
 	ret = catpt_ipc_set_device_format(cdev, &devfmt);
@@ -874,7 +874,7 @@ static int catpt_mixer_volume_get(struct snd_kcontrol *kcontrol,
 	int i;
 
 	ret = pm_runtime_resume_and_get(cdev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret)
 		return ret;
 
 	for (i = 0; i < CATPT_CHANNELS_MAX; i++) {
@@ -895,7 +895,7 @@ static int catpt_mixer_volume_put(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	ret = pm_runtime_resume_and_get(cdev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret)
 		return ret;
 
 	ret = catpt_set_dspvol(cdev, cdev->mixer.mixer_hw_id,
@@ -926,7 +926,7 @@ static int catpt_stream_volume_get(struct snd_kcontrol *kcontrol,
 	}
 
 	ret = pm_runtime_resume_and_get(cdev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret)
 		return ret;
 
 	for (i = 0; i < CATPT_CHANNELS_MAX; i++) {
@@ -957,7 +957,7 @@ static int catpt_stream_volume_put(struct snd_kcontrol *kcontrol,
 	}
 
 	ret = pm_runtime_resume_and_get(cdev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret)
 		return ret;
 
 	ret = catpt_set_dspvol(cdev, stream->info.stream_hw_id,
@@ -1033,7 +1033,7 @@ static int catpt_loopback_switch_put(struct snd_kcontrol *kcontrol,
 	}
 
 	ret = pm_runtime_resume_and_get(cdev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret)
 		return ret;
 
 	ret = catpt_ipc_mute_loopback(cdev, stream->info.stream_hw_id, mute);
diff --git a/sound/soc/intel/catpt/sysfs.c b/sound/soc/intel/catpt/sysfs.c
index 048253002ec8..e961e172f9b7 100644
--- a/sound/soc/intel/catpt/sysfs.c
+++ b/sound/soc/intel/catpt/sysfs.c
@@ -16,7 +16,7 @@ static ssize_t fw_version_show(struct device *dev,
 	int ret;
 
 	ret = pm_runtime_resume_and_get(cdev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret)
 		return ret;
 
 	ret = catpt_ipc_get_fw_version(cdev, &version);
-- 
2.25.1

