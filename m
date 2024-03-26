Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC3613CAAB
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469140; cv=none; b=lkQ6Jn3ya6+amRJIJJNydfJv4rIJuiyinFJZuvu9XhhgsjDOlGNSp91q82PHNH8DpYmVnwOx6cqrAi5cTtParKYEfW+9+riOIi/WOYwTKC6sVbBUeTTrXqS8sRPMHBD1pxO7fTQr7t4hrJHyxL82l4370T/uoMwq9MGtwPyTQyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469140; c=relaxed/simple;
	bh=e9MH3/bUSAe+g9D9Eu1D9KvCn3LzTW9RQuszNLP1B1c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u3lHhg0FGZGHG7QYlAucO6jQI1Re0noav63GLX61U4IxwvXqAf5KKNE9Va6aKeWetgwefaXLYEadpF6qhxUPHTmASvJFacHFcB/Ub05bM8v+V3ztmNkBJR47aQYlxJLE9YOtNXnjNT2KhSIx/uzR52VkCxK+Ex7EiyjRQjR0q0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TpcobZ+P; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TpcobZ+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469139; x=1743005139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e9MH3/bUSAe+g9D9Eu1D9KvCn3LzTW9RQuszNLP1B1c=;
  b=TpcobZ+PkrMH9a3DukkXNO8YUGMH7hA7kBhDSp4EdMQxFU4JsiPLuJYO
   x8TsEwmtOSLGFk+jwC3dSHXF3+Mhw1xeqVUR1KrjXr9hyPwVkp+bpGSGr
   Dx3Bz6xSn5HUPwqk4fZpW4btnzteO7wzE2EtndGfEC76tJxq718cnawd0
   /5pygJtcDutkTDNQP401V+J+JkOTMHWYdf8uXTV5NtzGaXgAKgJpAsgrN
   H2pJa/IYWfWItMppFEVUiqONa06A1m6f7K5Sghu+lOkQm3rvPicsrEOhI
   3GAeS/tlYVkCxd1AdeefgWNhlUX11UaZ7WccTYwrN3NJRRvx/YagYivqb
   A==;
X-CSE-ConnectionGUID: equZTM2xQhCFJ8h7eT14eA==
X-CSE-MsgGUID: THVuzUeNTcui220HIuqwpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260509"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260509"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482410"
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
Subject: [PATCH 26/34] ASoC: Intel: sof_sdw_rt722_sdca: set rtd_init in codec_info_list[]
Date: Tue, 26 Mar 2024 11:04:21 -0500
Message-Id: <20240326160429.13560-27-pierre-louis.bossart@linux.intel.com>
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

Add rt722 into rt_sdca_jack_rtd_init() supported list, and set
rtd_init callback directly in codec_info_list[]. No need to use a
init callback to set the rtd_init callback.
Besides, sof_sdw_rt_sdca_jack_init() doesn't set .rtd_init anymore.

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c              |  5 ++--
 sound/soc/intel/boards/sof_sdw_common.h       | 14 ++--------
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c   | 26 ++-----------------
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  2 +-
 4 files changed, 8 insertions(+), 39 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0e376cb0ce0b..bb8429a83467 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -902,6 +902,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_rt_sdca_jack_init,
 				.exit = sof_sdw_rt_sdca_jack_exit,
+				.rtd_init = rt_sdca_jack_rtd_init,
 			},
 			{
 				.direction = {true, false},
@@ -909,14 +910,14 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
 				/* No feedback capability is provided by rt722-sdca codec driver*/
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
-				.init = sof_sdw_rt722_spk_init,
+				.rtd_init = rt722_spk_rtd_init,
 			},
 			{
 				.direction = {false, true},
 				.dai_name = "rt722-sdca-aif3",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.init = sof_sdw_rt722_sdca_dmic_init,
+				.rtd_init = rt722_sdca_dmic_rtd_init,
 			},
 		},
 		.dai_num = 3,
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 84715d9ca942..315b2a298195 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -157,18 +157,6 @@ int sof_sdw_rt_amp_init(struct snd_soc_card *card,
 			bool playback);
 int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
-/* RT722-SDCA support */
-int sof_sdw_rt722_spk_init(struct snd_soc_card *card,
-			   const struct snd_soc_acpi_link_adr *link,
-			   struct snd_soc_dai_link *dai_links,
-			   struct sof_sdw_codec_info *info,
-			   bool playback);
-int sof_sdw_rt722_sdca_dmic_init(struct snd_soc_card *card,
-				 const struct snd_soc_acpi_link_adr *link,
-				 struct snd_soc_dai_link *dai_links,
-				 struct sof_sdw_codec_info *info,
-				 bool playback);
-
 /* MAXIM codec support */
 int sof_sdw_maxim_init(struct snd_soc_card *card,
 		       const struct snd_soc_acpi_link_adr *link,
@@ -194,6 +182,8 @@ int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int rt722_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
index fe3a2bff95bc..4947d16c70db 100644
--- a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
@@ -27,7 +27,7 @@ static const struct snd_kcontrol_new rt722_spk_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 };
 
-static int rt722_spk_init(struct snd_soc_pcm_runtime *rtd)
+int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
@@ -59,18 +59,7 @@ static int rt722_spk_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-int sof_sdw_rt722_spk_init(struct snd_soc_card *card,
-			   const struct snd_soc_acpi_link_adr *link,
-			   struct snd_soc_dai_link *dai_links,
-			   struct sof_sdw_codec_info *info,
-			   bool playback)
-{
-	dai_links->init = rt722_spk_init;
-
-	return 0;
-}
-
-static int rt722_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt722_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
@@ -84,14 +73,3 @@ static int rt722_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
 
 	return 0;
 }
-
-int sof_sdw_rt722_sdca_dmic_init(struct snd_soc_card *card,
-				 const struct snd_soc_acpi_link_adr *link,
-				 struct snd_soc_dai_link *dai_links,
-				 struct sof_sdw_codec_info *info,
-				 bool playback)
-{
-	dai_links->init = rt722_sdca_dmic_rtd_init;
-
-	return 0;
-}
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index fe59a144efef..006771485486 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -85,7 +85,7 @@ static struct snd_soc_jack_pin rt_sdca_jack_pins[] = {
 };
 
 static const char * const jack_codecs[] = {
-	"rt711", "rt712", "rt713"
+	"rt711", "rt712", "rt713", "rt722"
 };
 
 int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
-- 
2.40.1

