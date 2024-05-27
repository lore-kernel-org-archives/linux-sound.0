Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E111607AF
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838574; cv=none; b=Q6udsJhfufhgOytAW18ns4lmRkdrodN+5DmF5BFbi6K/UCAFKqOneSszGtqD2s8aEv+K5j3cyWrZkfVq2meWnWjVk/Mej+4vX2UvBHn8hUOenXF6AIB/o6bUhJIlbnGF5olY8HKJmJoKId0vRPRwM8bjRy0JGNzvBoAhwmDbEw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838574; c=relaxed/simple;
	bh=jYtuJBvgWMuKyE6cWQ6d12Q1gxREjdJIFUCWcLL4Sls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SJscaeL/X351glyt2j/Q8QfXP66K+KEsvGWYeVD3NhfmY5HRgBm2iE6ODw47alQ4NmS/jA16PnBVb5YV0b/3arvmQJkR5qeMB0ZRaI/gvO9u7+hdtWazDNZnN8g+gD+j6edhiTIi3ZTuIUkMlLsX/1BjnsUS8gI21MLELfWtc4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnrjzTVA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnrjzTVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838573; x=1748374573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jYtuJBvgWMuKyE6cWQ6d12Q1gxREjdJIFUCWcLL4Sls=;
  b=QnrjzTVAMOIgdT39WAnlHd/oYXIQyjWWDoAswYFz/VA6Rf8neYSoHrWh
   fXNiOMMSCtiNXLNO1ORnzyvBpPQs9q9Uq58bxrVWxV31jkzzXNICfej9P
   86alOsRZ+Iea/hY1yZhOEgpAWvQc+wAN0BRSo4V8GNHgCfruqLr2B83mp
   dAQ++3zML6quCkUa/3vLZeNpWKboMW71GV5X3deddMDD2uHMcQc2UdfS0
   0eyxu+Ox9MGH+wMeoOCLxgFGYymSHQjbplCXw7nBX+bhT28+ckxMPUw84
   sCsKE50iqaGz1Ma2buNxKdKqr4cHwnvZ3DiNrus17xhQTnTOALXTMg1s8
   Q==;
X-CSE-ConnectionGUID: C9dyEPuoTb20Toq4itm4UQ==
X-CSE-MsgGUID: Orsh/AzCSkCkSyx7CFGwUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339329"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339329"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:12 -0700
X-CSE-ConnectionGUID: nkHSFpeTQsuuJNL15641LQ==
X-CSE-MsgGUID: gs6GNEr5TZ6AIDTvAowelw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029760"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 04/18] ASoC: Intel: sof_sdw_rt700: use dai parameter
Date: Mon, 27 May 2024 14:35:38 -0500
Message-ID: <20240527193552.165567-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The dai is passed from the parameter. We don't need to find the dai
by name.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt700.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
index f9575db9d99c..0db730071be2 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -33,24 +33,15 @@ static struct snd_soc_jack_pin rt700_jack_pins[] = {
 	},
 };
 
-static const char * const jack_codecs[] = {
-	"rt700"
-};
-
 int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *codec_dai;
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
 
-	codec_dai = get_codec_dai_by_name(rtd, jack_codecs, ARRAY_SIZE(jack_codecs));
-	if (!codec_dai)
-		return -EINVAL;
-
-	component = codec_dai->component;
+	component = dai->component;
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
 					  "%s hs:rt700",
 					  card->components);
-- 
2.43.0

