Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E21148FED
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714144902; cv=none; b=soSMEVeorYGwibujv22QO6pOGfT8knX2+ubHX5ZDZf+52qCA9NdV4SnBFS5TJdJTlRhIDld2gUL3mjisV/pMCMQkzAXVW2OVCU3sBfbKQGkT2GhpmgLcF9zKJsrIyduRr8Q+CLreuQ7BoG6bIlQFHevVFhZ//WPHCNorqK35/30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714144902; c=relaxed/simple;
	bh=HubybkhRbfo/I4Z9f4ZL9Jl07Vz/hlhXaq7GSFqYs28=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cOk3nDHyGf5CnssfzSP3+HeX6s1ypGIukXv+Pm34Ll6ro2o9Lx6Hwh4RMHQ5Rc3qzbLrvEyV36tmpffXzC2ZKbb1DJJMKDGUbTwCyf/eKDjy7lF5hLHbeuqTWTgNKdLzX+aIuZQuvojg+b36NH3Sgj4xwhoR2qMI2NI5TNpGq5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5nCJ/Vk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5nCJ/Vk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144901; x=1745680901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HubybkhRbfo/I4Z9f4ZL9Jl07Vz/hlhXaq7GSFqYs28=;
  b=g5nCJ/VkU+0pxiVnPC7JatKU//R5zF587v8nkYAtfzaH8NbUbpxKLyEa
   1VrJv9tKJfcGj9tSpkO50Sc4+r75rpl9CeRR9Gw3mNExqIoY1EE6PMagr
   X4YTQoNHCAOBz5cLARxtMcLA4k6uEdPa5P8R75HTIpttdPNdsmDdVCk4X
   IOx5gwjgw0dujFeZ+gNccgGf1biSdQU6yQKasEBZH/IFBq+7GIRp84UTu
   6Mx4zOqvS9v3AktP8qAnPKv59Kuxohnn58LC/ovWRnTvAkTa1cljaqkcZ
   bO1FlHJeY2gyO2vATEtN3L3HqU730Wp8LfNZ6Sbx0liaBtQbiZ9j15qAq
   g==;
X-CSE-ConnectionGUID: 4HnHHlYEQMyn1iI1i+ck2Q==
X-CSE-MsgGUID: TL59GKGvSGm9UxROHsES8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290589"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21290589"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:39 -0700
X-CSE-ConnectionGUID: DLM2Grf3Rz68RvkKcQjYCw==
X-CSE-MsgGUID: lp2Fd53FSIKI76PkW97tPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259023"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 01/12] ASoC: Intel: skl_hda_dsp_generic: Allocate snd_soc_card dynamically
Date: Fri, 26 Apr 2024 10:21:12 -0500
Message-Id: <20240426152123.36284-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The static hda_soc_card might be modified during runtime which might cause
issues on next time when the card is created.
For example if the dmic_num was set with module parameter then removed for
the next module loading then the card's components will still going to
point to the previous boot's cfg-dmics:X string.

There might be other places where devm allocated memory have been freed but
the hda_soc_card still pointing to the now unallocated memory (the memory
is freed when the platform device is removed).

Fix this issue by moving the snd_soc_card into skl_hda_private and use it
for the card registration to ensure that it is correctly initialized every
time.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_common.h  |  1 +
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 42 ++++++++++----------
 2 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.h b/sound/soc/intel/boards/skl_hda_dsp_common.h
index 4b0b3959182e..19b814dee4ad 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.h
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.h
@@ -28,6 +28,7 @@ struct skl_hda_hdmi_pcm {
 };
 
 struct skl_hda_private {
+	struct snd_soc_card card;
 	struct list_head hdmi_pcm_list;
 	int pcm_count;
 	int dai_index;
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 4aa7fd2a05e4..208395872d8b 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -92,17 +92,6 @@ skl_hda_add_dai_link(struct snd_soc_card *card, struct snd_soc_dai_link *link)
 	return ret;
 }
 
-static struct snd_soc_card hda_soc_card = {
-	.name = "hda-dsp",
-	.owner = THIS_MODULE,
-	.dai_link = skl_hda_be_dai_links,
-	.dapm_widgets = skl_hda_widgets,
-	.dapm_routes = skl_hda_map,
-	.add_dai_link = skl_hda_add_dai_link,
-	.fully_routed = true,
-	.late_probe = skl_hda_card_late_probe,
-};
-
 static char hda_soc_components[30];
 
 #define IDISP_DAI_COUNT		3
@@ -115,9 +104,9 @@ static char hda_soc_components[30];
 
 #define HDA_CODEC_AUTOSUSPEND_DELAY_MS 1000
 
-static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params *mach_params)
+static int skl_hda_fill_card_info(struct snd_soc_card *card,
+				  struct snd_soc_acpi_mach_params *mach_params)
 {
-	struct snd_soc_card *card = &hda_soc_card;
 	struct skl_hda_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link *dai_link;
 	u32 codec_count, codec_mask;
@@ -199,6 +188,7 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach;
 	struct skl_hda_private *ctx;
+	struct snd_soc_card *card;
 	int ret;
 
 	dev_dbg(&pdev->dev, "entry\n");
@@ -213,32 +203,42 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 	if (!mach)
 		return -EINVAL;
 
-	snd_soc_card_set_drvdata(&hda_soc_card, ctx);
+	card = &ctx->card;
+	card->name = "hda-dsp",
+	card->owner = THIS_MODULE,
+	card->dai_link = skl_hda_be_dai_links,
+	card->dapm_widgets = skl_hda_widgets,
+	card->dapm_routes = skl_hda_map,
+	card->add_dai_link = skl_hda_add_dai_link,
+	card->fully_routed = true,
+	card->late_probe = skl_hda_card_late_probe,
 
-	ret = skl_hda_fill_card_info(&mach->mach_params);
+	snd_soc_card_set_drvdata(card, ctx);
+
+	ret = skl_hda_fill_card_info(card, &mach->mach_params);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Unsupported HDAudio/iDisp configuration found\n");
 		return ret;
 	}
 
-	ctx->pcm_count = hda_soc_card.num_links;
+	ctx->pcm_count = card->num_links;
 	ctx->dai_index = 1; /* hdmi codec dai name starts from index 1 */
 	ctx->platform_name = mach->mach_params.platform;
 	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
 
-	hda_soc_card.dev = &pdev->dev;
+	card->dev = &pdev->dev;
 	if (!snd_soc_acpi_sof_parent(&pdev->dev))
-		hda_soc_card.disable_route_checks = true;
+		card->disable_route_checks = true;
 
 	if (mach->mach_params.dmic_num > 0) {
 		snprintf(hda_soc_components, sizeof(hda_soc_components),
 				"cfg-dmics:%d", mach->mach_params.dmic_num);
-		hda_soc_card.components = hda_soc_components;
+		card->components = hda_soc_components;
 	}
 
-	ret = devm_snd_soc_register_card(&pdev->dev, &hda_soc_card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (!ret)
-		skl_set_hda_codec_autosuspend_delay(&hda_soc_card);
+		skl_set_hda_codec_autosuspend_delay(card);
 
 	return ret;
 }
-- 
2.40.1

