Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D8130147D
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 09:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764321244; cv=none; b=TKO6LAQj1FQZTNt/+dhmWvMHXvBR2SZ/gsTt9Rwgjq+64e8/8+ljfEd/8Y+iVhhYuNosP1VSbetFSgJUE4SdOvMCgsmInJr7NZA6zO/0IneimfVbEWDxrxJW8zlvrq5cPxPO2EG0hd05y/FVbGcnTNp+PmElwrkxg27wmIehihs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764321244; c=relaxed/simple;
	bh=Lvv5j9ShxdrvyGJFnX8YQ7QrCe6sYUPEZFDR28PgTJQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z69I83ReLJDyn6GoNzXOkzhbzl3xeFZUyv5LkeMD0lW/9X+9JC0zDOSBlqkJnTz73xOge6+MjN2X9sg38gm273m4pArr3Vf4IKy0rx5GgM49LF7odnUYraKbZpek6M5F9fYIi2+VPe/b2F8UCwYd3fG9ISise2kbIYTCStdMi30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlGijkUF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlGijkUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764321242; x=1795857242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lvv5j9ShxdrvyGJFnX8YQ7QrCe6sYUPEZFDR28PgTJQ=;
  b=NlGijkUF7z3lgBE/MHY/INyEsPNdQ2YGz/GRCA6KVIHSW4WkgnZtv7as
   fgHH+PIaJn4JCXG2TU3hT/11921a64tIWgtSLOOnr8sXajOMkqeLFoEuL
   uYkLTl3/IvvCHdZGriVckmjtVNBcdhqGYdwTk6xXmSczwfqs3PDVh/ReL
   ZmPhbwLMq6z/bF65Wrjsea2q6v3LMZcxlu7vE6DVDYublsLfzVxoz5Ga2
   KEpanZeXvuaky/GDdyHhRs8WGhU30k5KtK86yfq4akge0ik1oLV0fD/z9
   zUluDsp6bWKrZL6VAKreyksJG+FUAD+8wdrDUOHOb/n/OimjXL1I2uy0T
   Q==;
X-CSE-ConnectionGUID: qViBT/5tQNaCzIyiVlJZ2A==
X-CSE-MsgGUID: DQ7ZdetzSw6SH6NNXE0EUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66428521"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66428521"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 01:14:00 -0800
X-CSE-ConnectionGUID: Z+2RqlHFSiOVyOVMMpP7+w==
X-CSE-MsgGUID: bZg2+EQMSNKk10R4ZjKM5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="192680998"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 28 Nov 2025 01:13:57 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 5/6] ASoC: Intel: catpt: Do not ignore errors on runtime resume
Date: Fri, 28 Nov 2025 10:34:11 +0100
Message-Id: <20251128093412.3949374-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251128093412.3949374-1-cezary.rojewski@intel.com>
References: <20251128093412.3949374-1-cezary.rojewski@intel.com>
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

