Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A620222D787
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029656; cv=none; b=tAS0moeJoTX+9hH2C3M9ZkqNuq6h7h957PrZ8nd+ORTibtTnbb7lznrQJ6jlZcu5eDOXceLUfC/+blWU8bjwdEUTXU4RVFuPxPAs59+H/SDLcu46qXsvPn4EqHlbZnQ4wLF3MmEo6HIo+wENP7oi13FbhW5lmArWefPVpn4sq1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029656; c=relaxed/simple;
	bh=YeiOeVtWOX7ZBZr8nPXTaMi8nYgsaItdBxO+AJk/8ps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mK2tDDUZfQHgv03UqUUo/5qakEy3OtXGMLcZKQGoFx7eqM8eEk6Jj1szfGAEKQGXSkUiuIg7B5m4NtK0FPt2eOgIyw3Mp02ObagJ83+fp3FyWvaObR97eH3UJWP5QDBWm399EaSzBdJBfm8zIA1gW04uNcl3kpMrZ952kCcTYdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zq1pTax5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zq1pTax5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029655; x=1775565655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YeiOeVtWOX7ZBZr8nPXTaMi8nYgsaItdBxO+AJk/8ps=;
  b=Zq1pTax5MKl8kFpgpxNE9X4/Mke/r7/mSDa47L4KQZP93eC8n++PUro4
   QbBmLOOEBoweOBScSaPPOwwPfEv0dQCtl+xnOiNzfPRW+41bI0whg8m4N
   4ic7MfmJp6j9JjrT/IXkXUifeTj6uxy4qQXrX4qKJBE4BbrFuw3nKiKI/
   PIpej3DOUIVshjOS0/2dAQXxLQDQUbsA+KlkKf5mMO/xXIDGDvNjg/EUW
   eYoCBMtrJGNxL08ezzXMi9L5l6z6TdUvtxK4N7kYkCl7XmRA7jgr6Z0Tw
   lEOXBt/KAFcfiXW1P5ZkY+9NrZQnxMRaFG6ZccLeyhzsNLvpOnhMq9FDL
   w==;
X-CSE-ConnectionGUID: YZw9kPZhSJ+pL0s09EG3lg==
X-CSE-MsgGUID: QQLPxXsSTRWRBe07Dcu1KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56778994"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56778994"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:40:53 -0700
X-CSE-ConnectionGUID: vjXrIsQ6RlC2eOckfEgLTA==
X-CSE-MsgGUID: dTzung3vRZ6Q9d9R/BYF9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134087"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:40:51 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 06/20] ASoC: Intel: avs: boards: Change hdaudio card name
Date: Mon,  7 Apr 2025 14:41:40 +0200
Message-Id: <20250407124154.1713039-7-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
References: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename FE from "hdaudioB0D0"/"hdaudioB0D2" to "AVS HD-Audio"/"AVS HDMI".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/hdaudio.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index cb6d54db71892..4b8a2dc4b4a38 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -13,6 +13,7 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include "../../../codecs/hda.h"
+#include "../utils.h"
 
 static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int pcm_count,
 				const char *platform_name, struct snd_soc_dai_link **links)
@@ -95,7 +96,8 @@ avs_card_hdmi_pcm_at(struct snd_soc_card *card, int hdmi_idx)
 static int avs_card_late_probe(struct snd_soc_card *card)
 {
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
-	struct hda_codec *codec = mach->pdata;
+	struct avs_mach_pdata *pdata = mach->pdata;
+	struct hda_codec *codec = pdata->codec;
 	struct hda_pcm *hpcm;
 	/* Topology pcm indexing is 1-based */
 	int i = 1;
@@ -124,6 +126,7 @@ static int avs_card_late_probe(struct snd_soc_card *card)
 static int avs_probing_link_init(struct snd_soc_pcm_runtime *rtm)
 {
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct snd_soc_dai_link *links = NULL;
 	struct snd_soc_card *card = rtm->card;
 	struct hda_codec *codec;
@@ -131,7 +134,8 @@ static int avs_probing_link_init(struct snd_soc_pcm_runtime *rtm)
 	int ret, pcm_count = 0;
 
 	mach = dev_get_platdata(card->dev);
-	codec = mach->pdata;
+	pdata = mach->pdata;
+	codec = pdata->codec;
 
 	if (list_empty(&codec->pcm_list_head))
 		return -EINVAL;
@@ -167,12 +171,14 @@ static int avs_hdaudio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link *binder;
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
 	struct device *dev = &pdev->dev;
 	struct hda_codec *codec;
 
 	mach = dev_get_platdata(dev);
-	codec = mach->pdata;
+	pdata = mach->pdata;
+	codec = pdata->codec;
 
 	/* codec may be unloaded before card's probe() fires */
 	if (!device_is_registered(&codec->core.dev))
@@ -200,7 +206,16 @@ static int avs_hdaudio_probe(struct platform_device *pdev)
 	if (!card)
 		return -ENOMEM;
 
-	card->name = binder->codecs->name;
+	if (pdata->obsolete_card_names) {
+		card->name = binder->codecs->name;
+	} else {
+		card->driver_name = "avs_hdaudio";
+		if (hda_codec_is_display(codec))
+			card->long_name = card->name = "AVS HDMI";
+		else
+			card->long_name = card->name = "AVS HD-Audio";
+	}
+
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->dai_link = binder;
-- 
2.34.1

