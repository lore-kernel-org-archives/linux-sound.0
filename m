Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E6C14A605
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 09:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034921; cv=none; b=tveOMruHs3UHCsVUx2H6QG5w3S3e+M2lICyh0oj5sy7BbzefH00BlMWeLTMQNNJRasQSCaoYVa7/8HZJycOYG5WhIILMp/MSEceowYACwR7q/NcwNlEeyO1vm8repbbjAKy8y8fsJHwFnpgYol1c2antp5ag8Gyw6QJTV2aSVks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034921; c=relaxed/simple;
	bh=EyVTiU6dGLO2W4xouoXjfNEnMG0I+hdkHweqcsxPhsY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CSGpHEckCmiJJhS6WYne/ha/iqaEmgYDoi57CcGumMHsAf6bQM5PUJMjib37q8kJH3S6PsIQqL6IAVDOCOKUIEC17DisYoRw9QnBBu8vgctuqNfP5uWIQDWDFuTZ/uYp04wy4kzKJ0YTyjHSovFUUI/SZptRRhmWKXmZOeIY71Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atCLTdwM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atCLTdwM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034920; x=1759570920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EyVTiU6dGLO2W4xouoXjfNEnMG0I+hdkHweqcsxPhsY=;
  b=atCLTdwMJ1FaqhbEPUvJ9dZ/qnTtNPFuv+7MXNguPB6etKbDhZwlK/Sx
   g6dB2zUZA+WnNAyUYLBJ9oZ0ygo9KnW5pNJvJPngFAAYZMU4BlwQ2kVcv
   FGQeVcbSkTT/gl554KrPGeb5F7keRTKbNEilf1aHNqLhmUlIVNCxUPVW5
   CaU5mZYiN01ieTawpVL6OMjPGbUZTWbD+GXNVFQBIl676CCZiunqA9l16
   yHIVrLYshsPLiF4WwixhjBRmVPtCmKK3YHM9ijoDQnNsRbrXYfPhEb+ws
   uIImr8Po6XpcL3wYKjcv4t5WOOdgbOcJahNMddIXNh07Gdegx7dwv2yl4
   A==;
X-CSE-ConnectionGUID: NsvYxy3rT9WAF4O3NsPcaQ==
X-CSE-MsgGUID: 2+1gKWPDRomSmmM6TeV63A==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27136242"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27136242"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:42:00 -0700
X-CSE-ConnectionGUID: By2r88ssRc+Fn9QjRASmhg==
X-CSE-MsgGUID: e/tNjEwzTAqDX4o5PfRNVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="105492136"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:58 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B41A811F7E7;
	Fri,  4 Oct 2024 12:41:55 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweot-000TiB-2I;
	Fri, 04 Oct 2024 12:41:55 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 50/51] ALSA: intel_hdmi: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:55 +0300
Message-Id: <20241004094155.114201-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 sound/x86/intel_hdmi_audio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index d41ea09ffbe5..1ae2949a0a6e 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1102,7 +1102,7 @@ static int had_pcm_open(struct snd_pcm_substream *substream)
 	return retval;
  error:
 	pm_runtime_mark_last_busy(intelhaddata->dev);
-	pm_runtime_put_autosuspend(intelhaddata->dev);
+	__pm_runtime_put_autosuspend(intelhaddata->dev);
 	return retval;
 }
 
@@ -1127,7 +1127,7 @@ static int had_pcm_close(struct snd_pcm_substream *substream)
 	spin_unlock_irq(&intelhaddata->had_spinlock);
 
 	pm_runtime_mark_last_busy(intelhaddata->dev);
-	pm_runtime_put_autosuspend(intelhaddata->dev);
+	__pm_runtime_put_autosuspend(intelhaddata->dev);
 	return 0;
 }
 
@@ -1589,7 +1589,7 @@ static void had_audio_wq(struct work_struct *work)
 
 	mutex_unlock(&ctx->mutex);
 	pm_runtime_mark_last_busy(ctx->dev);
-	pm_runtime_put_autosuspend(ctx->dev);
+	__pm_runtime_put_autosuspend(ctx->dev);
 }
 
 /*
-- 
2.39.5

