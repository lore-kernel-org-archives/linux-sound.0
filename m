Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A862B13C91A
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469141; cv=none; b=Ri7wjEzEtWjGkJirVdRt3xgpdzk3doHcvVsS679cGRLKCfyHZxEsik62JgehvzLT6bZqa9csk9/ik1E9GQ4gt7HTqHNnDq2F8NUGZYKrhsiX8WenYF45TRnVJ8I5FvBJ+UeSarmLmEn8BMWi6a3gLK89DksXvuVj0iAkIAmSU5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469141; c=relaxed/simple;
	bh=7er5XS8XPkq/Yfz89dHj6ZJt2ktjzUrDT8kk64LCDYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QMrwIyX72IG5vPA41ehmJeCVc4TqsqVC1/TqOizYQKDfwtOdXlwSqVRCk9fZox5COnbw1gSCj1V8srbGQo4UYeLdnF+sS3EQgUeA0z1X6PSC1YxPy7h/ylAEI3C3753YhKEtqQPGSddHQVY+wXhkUixAod8jZt1tQNV7AzLopuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBsBHuZ7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBsBHuZ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469140; x=1743005140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7er5XS8XPkq/Yfz89dHj6ZJt2ktjzUrDT8kk64LCDYc=;
  b=oBsBHuZ7I1Zi691w3p+pW2epBKdL7JNahgUfoQ4DbOqMyn3EzNJdQoPv
   5TmDJ7kESP2z1cNv/fqRwUIHWIQTMmXhxI+Jo8hhhYpq4RmAw/4DA/DtT
   2HyesVadQ5k1NnXzR/OVWAobERdYxF5BYjw4Eq2vwjJgHXv+quEkMvBp4
   o+jjlzLbaEmlgYL8xnf39t8KXwD2+1Z57c/3+cPnw+WfeH3Ryg9wtLdi0
   IC5OhBqUVYXmcZVKMZ0iW7wl+lMIlv5Ia103B8sHmseGHx0mEF1iixFff
   1LqK7YyEditnjvBoZPLuDjcrSFeeRr8eBI05EZ8udzHw3rLmFc3Nn4R+W
   A==;
X-CSE-ConnectionGUID: RDTrtmjnTf25FPaqYeK6Nw==
X-CSE-MsgGUID: wKp5lE/1RImwiJwahQMbRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260516"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260516"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482425"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 27/34] ASoC: Intel: sof_sdw_rt722_sdca: use rt_dmic_rtd_init
Date: Tue, 26 Mar 2024 11:04:22 -0500
Message-Id: <20240326160429.13560-28-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

rt_dmic_rtd_init() can be used for rt722 dmic, too.

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c            |  2 +-
 sound/soc/intel/boards/sof_sdw_common.h     |  1 -
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c | 14 --------------
 sound/soc/intel/boards/sof_sdw_rt_dmic.c    |  1 +
 4 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index bb8429a83467..3874da8d7fe4 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -917,7 +917,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt722-sdca-aif3",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.rtd_init = rt722_sdca_dmic_rtd_init,
+				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 3,
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 315b2a298195..2132d3fc42f8 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -183,7 +183,6 @@ int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt722_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
index 4947d16c70db..e5c2a36e400b 100644
--- a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
@@ -59,17 +59,3 @@ int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-int rt722_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_component *component = codec_dai->component;
-
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s mic:%s",
-					  card->components, component->name_prefix);
-	if (!card->components)
-		return -ENOMEM;
-
-	return 0;
-}
diff --git a/sound/soc/intel/boards/sof_sdw_rt_dmic.c b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
index 9091f5b5c648..5aec8422656c 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_dmic.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
@@ -15,6 +15,7 @@
 static const char * const dmics[] = {
 	"rt715",
 	"rt712-sdca-dmic",
+	"rt722-sdca",
 };
 
 int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
-- 
2.40.1

