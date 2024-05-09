Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DB64C8E
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272478; cv=none; b=FT9B43/aK0jP3QZ3uC5eQxkN8XWLQo2G5UtCA7Op/SVso1uR/Mq03tK3q/nsFlJnBu21B94mUTcZ07rfKcOd5KZg505TqJThY4RTcShFzcbmy1XJrCFt/fvFROjCyMZSrvzmI+eQqyvOqtqhLiKMaypfQQQfEgIWfw7kbMRPKjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272478; c=relaxed/simple;
	bh=xA3IIT0DKbU7wHLGDknT1Vogy+5Y/12tE8e6UKY6e5o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BXjw07NtiyBakCCu9pxu0jvsVdm00XIucb6pFurZPk9+ZoKyRlUD1f++Q4p5TMypKkDuD0/kK6hm3NtDwimxLhiYY4sZ3mir+J7EI7KgwXmKU6DNlGLAcWHQEffoQvebdt1ce+akqcFLd/yAhkAkcv8tMXTwOoiBBFgCBJ3bOxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sj3pvHT+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sj3pvHT+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272477; x=1746808477;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xA3IIT0DKbU7wHLGDknT1Vogy+5Y/12tE8e6UKY6e5o=;
  b=Sj3pvHT+ytfprYIP3+6KPPHZ4bctKvJKRBNmJ0AUd4UuD/kJo1esBlC/
   d5ynAwySgCrBqIrHMcYR38UQrHv4QG1aX28MJHG7sRep3rfCrpdEjqDo/
   supfR7voMQ3o7AOJIuSkUes8y2H084Bs7By/8a0XmrfRQN6Wio1eKToQ5
   hEVauOdNFZ+2iCO0oQ5FxyVE3h2Hpc3kcFG6S5quS3ntyb8iuvQLR9/lv
   da5CO8KLaWdRK3qnuOkWEPnfaVuUaqhoxuV6HMukftfnCgEhcisetxvug
   6DhoJszMpJJePKWVqdlT8iL44eE83rSILK05nc98HMQUKFSR2VmuiN6Mb
   A==;
X-CSE-ConnectionGUID: EUVI6utuTqOj7pT43+O0AQ==
X-CSE-MsgGUID: lsHaO5yhTKW5PAuwTKSW1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017623"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017623"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:34 -0700
X-CSE-ConnectionGUID: wSvCgW4lQOyhUO1tzBnH2A==
X-CSE-MsgGUID: Hz1Ow3G5RwyndLhP/Tr8Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33761048"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 17/18] ASoC: Intel: sof_sdw: add dai parameter to rtd_init callback
Date: Thu,  9 May 2024 11:34:17 -0500
Message-Id: <20240509163418.67746-18-pierre-louis.bossart@linux.intel.com>
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

A generic .rtd_init() callback could be used by different dais. It is
useful to pass dai parameter to the callback. The dai parameter will be
used in the follow up commit. No functional change here.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c              |  2 +-
 sound/soc/intel/boards/sof_sdw_common.h       | 30 +++++++++----------
 sound/soc/intel/boards/sof_sdw_cs42l42.c      |  2 +-
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |  6 ++--
 sound/soc/intel/boards/sof_sdw_cs_amp.c       |  2 +-
 sound/soc/intel/boards/sof_sdw_maxim.c        |  2 +-
 sound/soc/intel/boards/sof_sdw_rt5682.c       |  2 +-
 sound/soc/intel/boards/sof_sdw_rt700.c        |  2 +-
 sound/soc/intel/boards/sof_sdw_rt711.c        |  2 +-
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c   |  2 +-
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c   |  2 +-
 sound/soc/intel/boards/sof_sdw_rt_amp.c       | 10 +++----
 sound/soc/intel/boards/sof_sdw_rt_dmic.c      |  2 +-
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  2 +-
 14 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 8c1497bab2ef..e41b0d95e0ff 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1411,7 +1411,7 @@ static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 
 skip_add_controls_widgets:
 		if (codec_info->dais[dai_index].rtd_init) {
-			ret = codec_info->dais[dai_index].rtd_init(rtd);
+			ret = codec_info->dais[dai_index].rtd_init(rtd, dai);
 			if (ret)
 				return ret;
 		}
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index a8ba39bd5fd8..3dfba6f6b95d 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -95,7 +95,7 @@ struct sof_sdw_dai_info {
 		     struct sof_sdw_codec_info *info,
 		     bool playback);
 	int (*exit)(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
-	int (*rtd_init)(struct snd_soc_pcm_runtime *rtd);
+	int (*rtd_init)(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 	bool rtd_init_done; /* Indicate that the rtd_init callback is done */
 	unsigned long quirk;
 };
@@ -208,19 +208,19 @@ int sof_sdw_cs_amp_init(struct snd_soc_card *card,
 
 /* dai_link init callbacks */
 
-int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
 #endif
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
index 9783d5fb2d91..fdb75fc71c26 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -40,7 +40,7 @@ static const char * const jack_codecs[] = {
 	"cs42l42"
 };
 
-int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
index 2dd0f085fe60..b7e2750c1074 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -48,7 +48,7 @@ static struct snd_soc_jack_pin sof_jack_pins[] = {
 	},
 };
 
-int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
@@ -99,7 +99,7 @@ int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
@@ -135,7 +135,7 @@ int sof_sdw_cs42l43_spk_init(struct snd_soc_card *card,
 	return bridge_cs35l56_spk_init(card, dai_links, info, playback);
 }
 
-int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_cs_amp.c b/sound/soc/intel/boards/sof_sdw_cs_amp.c
index 663c0e1d2c56..10e08207619a 100644
--- a/sound/soc/intel/boards/sof_sdw_cs_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_cs_amp.c
@@ -14,7 +14,7 @@
 
 #define CODEC_NAME_SIZE	8
 
-int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	const char *dai_name = rtd->dai_link->codecs->dai_name;
 	struct snd_soc_card *card = rtd->card;
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index a7a8db624818..b7f73177867f 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -21,7 +21,7 @@ static const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
 	{ "Right Spk", NULL, "Right BE_OUT" },
 };
 
-int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
index 1741226fe052..96f193798540 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -39,7 +39,7 @@ static const char * const jack_codecs[] = {
 	"rt5682"
 };
 
-int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
index 58677a8968ab..f9575db9d99c 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -37,7 +37,7 @@ static const char * const jack_codecs[] = {
 	"rt700"
 };
 
-int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 4cff48a37e3c..d49e5aa786c3 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -63,7 +63,7 @@ static const char * const jack_codecs[] = {
 	"rt711"
 };
 
-int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
index ee2c57a50f0d..788796461885 100644
--- a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
@@ -26,7 +26,7 @@ static const struct snd_soc_dapm_route rt712_spk_map[] = {
 	{ "Speaker", NULL, "rt712 SPOR" },
 };
 
-int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
index 02ee8e33a99a..083d281bd052 100644
--- a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
@@ -19,7 +19,7 @@ static const struct snd_soc_dapm_route rt722_spk_map[] = {
 	{ "Speaker", NULL, "rt722 SPK" },
 };
 
-int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index 218f6c4efe38..df03441ab364 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -177,12 +177,12 @@ static const struct snd_soc_dapm_route *get_codec_name_and_route(struct snd_soc_
 		return rt1318_map;
 }
 
-int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	const struct snd_soc_dapm_route *rt_amp_map;
 	char codec_name[CODEC_NAME_SIZE];
-	struct snd_soc_dai *dai;
+	struct snd_soc_dai *codec_dai;
 	int ret;
 	int i;
 
@@ -194,10 +194,10 @@ int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	for_each_rtd_codec_dais(rtd, i, dai) {
-		if (strstr(dai->component->name_prefix, "-1"))
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (strstr(codec_dai->component->name_prefix, "-1"))
 			ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map, 2);
-		else if (strstr(dai->component->name_prefix, "-2"))
+		else if (strstr(codec_dai->component->name_prefix, "-2"))
 			ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map + 2, 2);
 	}
 
diff --git a/sound/soc/intel/boards/sof_sdw_rt_dmic.c b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
index 2f7ed9b31e79..b8b493d5c6ec 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_dmic.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
@@ -19,7 +19,7 @@ static const char * const dmics[] = {
 	"rt722-sdca",
 };
 
-int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_component *component;
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index c24a5707fb6c..701b0372f59e 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -87,7 +87,7 @@ static const char * const need_sdca_suffix[] = {
 	"rt711", "rt713"
 };
 
-int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-- 
2.40.1

