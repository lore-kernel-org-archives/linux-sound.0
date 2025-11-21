Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DB9341AC5
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 11:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724201; cv=none; b=ZlwZ+soif9GUTmOXWC7rTpK31mMRb+8gnH++0Wiqd91cl9I5F1l63QwnsDKkRw/7Lu/6JmsX36InjL/YCdRWtIzeYq224JkoVq6lBSl9l/hQaCtyFqcLwo5JW5/VAL/cTq3h8Yb5usS6Nu3mbgUOdxvtU9g6qe8e3fAWFIhlRKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724201; c=relaxed/simple;
	bh=Lvv5j9ShxdrvyGJFnX8YQ7QrCe6sYUPEZFDR28PgTJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lfS1R7DiRUBRQTWlpgdUh4YEqStpavHgl4cLj92wfUFlMLPQKGZNmK8DWV1oSeuRZeaorNNhAmihkp6ZQTT5PqHDMLN9nIsTbZpg05eNot8ftLNpzzlyhVWsn9cU7L2If7mTBmQsemg94XaRtjLsypJB7KLbi7LrxJ2IyEMU6/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9TBdf22; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9TBdf22"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763724199; x=1795260199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lvv5j9ShxdrvyGJFnX8YQ7QrCe6sYUPEZFDR28PgTJQ=;
  b=A9TBdf22q1ZbatX3Gt9Win7IZ0zP+p+LW64ZonRDcrejOm1+zjyVsAsJ
   pCoICsJESsl2beVoDqKocIcYK9Al8CJR4jq8HrOkVHIirVIODKUDXbB+r
   V+GX1RZDeIDInBSkkkER6EOg/LeqX+YaeAPPSUKBZXXFiEZNHPAtbpa3w
   0VUzaKisj3jnd+iOu/7+DZgyo361qTHaY6cNasAnG5uPLFmgfzS/dF8Nt
   Mam4REv492oleYC3Z0SVQ3MADjUkWJzm5/Mgx5rcOeT1wdXe14p3ITbsp
   7bSX7sciA85ycbh7nhYQi/m6e6BXPj826yJwaP64tv9eaIO6yO8OVZ3nK
   w==;
X-CSE-ConnectionGUID: S7K+BgefQEONgbd2puI6TA==
X-CSE-MsgGUID: aU+F8w0bQgO90IZN57donQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65845929"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65845929"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 03:23:18 -0800
X-CSE-ConnectionGUID: 2fJ8onDGRSKStlH8Dy1Mgw==
X-CSE-MsgGUID: INpYAZPGTZaLZGbPPAmmXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191462844"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2025 03:23:16 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/6] ASoC: Intel: catpt: Do not ignore errors on runtime resume
Date: Fri, 21 Nov 2025 12:43:29 +0100
Message-Id: <20251121114331.3841335-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121114331.3841335-1-cezary.rojewski@intel.com>
References: <20251121114331.3841335-1-cezary.rojewski@intel.com>
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

