Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFE14A2D
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272470; cv=none; b=LmnXabGuWwjpC7yivwTTsK9dZ6ESFoE6kIijYWW+ugVEW9vvvAESQ7fJx6J8Xi8Oxa3a/DpiNFSerITHQgnyGlTksBDnA7d1g4ue8nai3ib4T5b5EfSa9zBsLeoBVbsZANBw2KRIydnH1bWlGab/8Aur3HCLHpe5A5P0nYwDxuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272470; c=relaxed/simple;
	bh=GqULhJRi1unMt5mH+4JgxuoIxqMP1UxS9DsIZ2rk91M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pk0gfjU9GubdikuEWUir3Ab2ag+AnAmvSe9tDu/t1fRP5kpZtPGxJm6SPxL9LaTTVt8rt1Nkkx0ExQVcmqg1yxcxE1xe2he7RvSkGepySBoBJ4XPFECux+gbgbtUkjTEQPdIfrX4IwESCeWkQKSG9UhYLerZrR4v72Yoxe1qEwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hrRhy+F5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hrRhy+F5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272469; x=1746808469;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GqULhJRi1unMt5mH+4JgxuoIxqMP1UxS9DsIZ2rk91M=;
  b=hrRhy+F5iAy/7BPCWti2POdf4EDbQwO+yqpqxkADXktkMv9tZIEVKqR+
   jXuNwnY6IxLz6SnuL7Eq2DbJsvo/AA+80OZu5KXaIGMfQjLnCgeHw1TgZ
   3YKMmMJ9la3kM914HbBjdwV+9IeTCPiG9s5dR05qUh1OW2iQudbLC5sWh
   o3wS65p0PheRKUJRzwZge1ik8lvPVRccosTRRyTdMfg15fNAxIy9BUcyl
   RoRYWvZQUM1HBpQiCrnCHIcsYaQ5Ak+4E5FtUXVUS8aUVQHLe6p9I6Sji
   xM43uW679r79W6rPsBtR72DUHIGuCQKVmgkEii3lqLght69YW7hJ8i+cR
   Q==;
X-CSE-ConnectionGUID: PDhMwn9tQ0eKyPdH3zVMEg==
X-CSE-MsgGUID: WfYOnD36S5eDc75ZJdsdeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017533"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017533"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:27 -0700
X-CSE-ConnectionGUID: 5s2dpUBkQ/egIWSiOrwKyA==
X-CSE-MsgGUID: ScSCAIlPQRG6yiuiIKRPTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33760990"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 04/18] ASoC: Intel: realtek-common: remove 2-spk rt1015p config
Date: Thu,  9 May 2024 11:34:04 -0500
Message-Id: <20240509163418.67746-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

The original code for rt1015p could support 1 or 2 rt1015p device
instances in ACPI. However, all designs implement only 1 instance in
ACPI table so we remove the code segment which is for 2 instances.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_realtek_common.c | 57 ++-------------------
 sound/soc/intel/boards/sof_realtek_common.h |  1 -
 2 files changed, 5 insertions(+), 53 deletions(-)

diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index 6915ff8b8716..dda346e0f737 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -314,59 +314,21 @@ EXPORT_SYMBOL_NS(sof_rt1011_codec_conf, SND_SOC_INTEL_SOF_REALTEK_COMMON);
  *
  * For stereo output, there are always two amplifiers on the board.
  * However, the ACPI implements only one device instance (UID=0) if they
- * are sharing the same enable pin. The code will detect the number of
- * device instance and use corresponding DAPM structures for
- * initialization.
+ * are sharing the same enable pin. This is the case of rt1015p.
  */
-static const struct snd_soc_dapm_route rt1015p_1dev_dapm_routes[] = {
+static const struct snd_soc_dapm_route rt1015p_dapm_routes[] = {
 	/* speaker */
 	{ "Left Spk", NULL, "Speaker" },
 	{ "Right Spk", NULL, "Speaker" },
 };
 
-static const struct snd_soc_dapm_route rt1015p_2dev_dapm_routes[] = {
-	/* speaker */
-	{ "Left Spk", NULL, "Left Speaker" },
-	{ "Right Spk", NULL, "Right Speaker" },
-};
-
-static struct snd_soc_codec_conf rt1015p_codec_confs[] = {
-	{
-		.dlc = COMP_CODEC_CONF(RT1015P_DEV0_NAME),
-		.name_prefix = "Left",
-	},
-	{
-		.dlc = COMP_CODEC_CONF(RT1015P_DEV1_NAME),
-		.name_prefix = "Right",
-	},
-};
-
 static struct snd_soc_dai_link_component rt1015p_dai_link_components[] = {
 	{
 		.name = RT1015P_DEV0_NAME,
 		.dai_name = RT1015P_CODEC_DAI,
 	},
-	{
-		.name = RT1015P_DEV1_NAME,
-		.dai_name = RT1015P_CODEC_DAI,
-	},
 };
 
-static int rt1015p_get_num_codecs(void)
-{
-	static int dev_num;
-
-	if (dev_num)
-		return dev_num;
-
-	if (!acpi_dev_present("RTL1015", "1", -1))
-		dev_num = 1;
-	else
-		dev_num = 2;
-
-	return dev_num;
-}
-
 static int rt1015p_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
@@ -398,12 +360,8 @@ static int rt1015p_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	if (rt1015p_get_num_codecs() == 1)
-		ret = snd_soc_dapm_add_routes(&card->dapm, rt1015p_1dev_dapm_routes,
-					      ARRAY_SIZE(rt1015p_1dev_dapm_routes));
-	else
-		ret = snd_soc_dapm_add_routes(&card->dapm, rt1015p_2dev_dapm_routes,
-					      ARRAY_SIZE(rt1015p_2dev_dapm_routes));
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt1015p_dapm_routes,
+				      ARRAY_SIZE(rt1015p_dapm_routes));
 	if (ret)
 		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
 	return ret;
@@ -412,7 +370,7 @@ static int rt1015p_init(struct snd_soc_pcm_runtime *rtd)
 void sof_rt1015p_dai_link(struct snd_soc_dai_link *link)
 {
 	link->codecs = rt1015p_dai_link_components;
-	link->num_codecs = rt1015p_get_num_codecs();
+	link->num_codecs = ARRAY_SIZE(rt1015p_dai_link_components);
 	link->init = rt1015p_init;
 	link->ops = &rt1015p_ops;
 }
@@ -420,11 +378,6 @@ EXPORT_SYMBOL_NS(sof_rt1015p_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
 void sof_rt1015p_codec_conf(struct snd_soc_card *card)
 {
-	if (rt1015p_get_num_codecs() == 1)
-		return;
-
-	card->codec_conf = rt1015p_codec_confs;
-	card->num_configs = ARRAY_SIZE(rt1015p_codec_confs);
 }
 EXPORT_SYMBOL_NS(sof_rt1015p_codec_conf, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
diff --git a/sound/soc/intel/boards/sof_realtek_common.h b/sound/soc/intel/boards/sof_realtek_common.h
index d0e331530b39..876290555c22 100644
--- a/sound/soc/intel/boards/sof_realtek_common.h
+++ b/sound/soc/intel/boards/sof_realtek_common.h
@@ -31,7 +31,6 @@ void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card *card);
  */
 #define RT1015P_CODEC_DAI	"HiFi"
 #define RT1015P_DEV0_NAME	RT1015P_ACPI_HID ":00"
-#define RT1015P_DEV1_NAME	RT1015P_ACPI_HID ":01"
 
 void sof_rt1015p_dai_link(struct snd_soc_dai_link *link);
 void sof_rt1015p_codec_conf(struct snd_soc_card *card);
-- 
2.40.1

