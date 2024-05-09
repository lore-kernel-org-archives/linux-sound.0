Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3039A4C96
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272475; cv=none; b=Y8+6kMPwjjTbRPuVf2C31i3MmnHIBMeQaI13b6n9gBx1ucGn3P6DmYQlm+4b8Do2YtOkhwDojMCYWw3OKURPupWsVkRiAXUP0j8+khk7C/1dHsJ/Z9c5k1WVP0TmP9L7RWMB5pcRoG3f+Ukv1GLeoUzo8LA/ROrvLGdW+R9472g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272475; c=relaxed/simple;
	bh=jrB8Du6KzynA1SE9fINLjjbN0MfJwOUYOIk3RscTY1A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LFCC5qi9odtBJKi1meMO3idxJCKsw/QEF0fijhPIlq2bb26cx+AFrHVFaDtqRYD+TJ5nN/wcWnjk1Xeo+xG4PQM+eAig7e31XHFtwm6xp4FobMfQLcBJ6hRhNEjmtiZvGjOfRwed0RsBt6TPLHZGq57eYBZnNpRj/oWN9Y3mtt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALah+21v; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALah+21v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272474; x=1746808474;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jrB8Du6KzynA1SE9fINLjjbN0MfJwOUYOIk3RscTY1A=;
  b=ALah+21vfGXpvRtaHdFk1NLHlVujf9gGlI6XAWQzIxuiYvP9V4zfy/gB
   BjxsOO1QstqHeOGoD3UlTqp35DS0Wy858YjFNPOCN7In0Y8oUJp7G+6BF
   dmxALnO9IQv/2PCiTa2n85FBzLy947r2qsnji83Be9Hj/QQJeHLf+ACro
   b978r4ggo1G7GgfA+Bt4mh+yrlVaY1cq7rIoHuFs8GvVwcl23PsCI4diV
   BTOajbgIvT3gQ2garXE4DWjaQByrs0qMSMS+tqyOhiK1A2eNGqCJdeMS5
   z2tCk6ETABdr5PPN/Sd2SEd+dUKcsNn6BJ7cM1AV/vsERl2wp8KH9d3FE
   w==;
X-CSE-ConnectionGUID: ZWYoJ3EcSri5tWymWkgSig==
X-CSE-MsgGUID: ZqFoUWphQ5uJsAE3zAN4WQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017596"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017596"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:32 -0700
X-CSE-ConnectionGUID: LExlptZ8QZKVKNeuvcXeyw==
X-CSE-MsgGUID: 2lty1cfgQwCXsMwEUTycvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33761038"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 13/18] ASoC: Intel: sof_sdw_cs_amp: rename Speakers to Speaker
Date: Thu,  9 May 2024 11:34:13 -0500
Message-Id: <20240509163418.67746-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

To be consistent to other amps that used in the machine driver.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_cs_amp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_cs_amp.c b/sound/soc/intel/boards/sof_sdw_cs_amp.c
index e29a586ce7c0..3538d3c752b7 100644
--- a/sound/soc/intel/boards/sof_sdw_cs_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_cs_amp.c
@@ -15,7 +15,7 @@
 #define CODEC_NAME_SIZE	8
 
 static const struct snd_soc_dapm_widget sof_widgets[] = {
-	SND_SOC_DAPM_SPK("Speakers", NULL),
+	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
 int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
@@ -24,7 +24,7 @@ int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card = rtd->card;
 	char codec_name[CODEC_NAME_SIZE];
 	char widget_name[16];
-	struct snd_soc_dapm_route route = { "Speakers", NULL, widget_name };
+	struct snd_soc_dapm_route route = { "Speaker", NULL, widget_name };
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
-- 
2.40.1

