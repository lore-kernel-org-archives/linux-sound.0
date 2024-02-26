Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950CD60860
	for <linux-sound@vger.kernel.org>; Mon, 26 Feb 2024 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708951392; cv=none; b=twMLu3WB58EEuLO6zt7Zq2BOSp10p+oNUs7b9brAkOvm7rPpYHr1+ey2bcW4p3KylW3/yH/+LzitY0wyWsaZe5pOT24BCg2iJns20wtkOnmtSFRqj/Qyatex4KbB+2lBHYm+a+2BOefCTFGeq4UzTxGq2J0QZWTI+mCUHv1RYFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708951392; c=relaxed/simple;
	bh=HNPW3gZaSH6fjCMtquzM1dI/vEaBhFuoLxGDia1XD9A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pLw2W5MkP/QYmdSRw0+PyS2VjDoueLBS44qi+44/rYfpT2hSnS5rOqikDrs5wnPnX9T8mQulx5dGvfoRLgyeqV+XffdPN4n2fuouUCGAR4xg/1m+AdHxbyPLU7EpG2eJY36NrAaeSgsuWfMoV2ZuWwbLN/9UKQchZZsg21y7f9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRC9Akz1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRC9Akz1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708951391; x=1740487391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HNPW3gZaSH6fjCMtquzM1dI/vEaBhFuoLxGDia1XD9A=;
  b=BRC9Akz1jGmLw5hp/G0P4A7y6k7qu16OQGP5Vb7ifxplDZrF0fLWzh5B
   d2WuPdO9ka5ggKnAsFCRsBsylgAGuS9fL3+aJwXYZ0+k1Aqpv+gdW0ZW+
   5epb10JR81TsSyD7egmbmfD24He8+C/lpxNikopwIz1A+aM/HHOO7lu0b
   LFTr/gN0sEzYVUQ/y/icYD6gQjSL8esWmxkaGoJqtWDnefBhiq7KGKpGa
   lV6zmQES4gdtu+j8MBms8+pok1O4pHqgQfBpcUv7gDEqUTHhCHepq8S+g
   2Nv+S3y1qf5819sFpKTMxqWvWmsJ0NYsudfiV79sPFkxr3AfIt94KvEjY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="28658264"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="28658264"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 04:43:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6688619"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 26 Feb 2024 04:43:07 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 4/5] ASoC: codecs: hda: Cleanup error messages
Date: Mon, 26 Feb 2024 13:44:31 +0100
Message-Id: <20240226124432.1203798-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240226124432.1203798-1-cezary.rojewski@intel.com>
References: <20240226124432.1203798-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Be cohesive and use same pattern in each error message.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/hda.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index 7c6bedeceaa2..5a58723dc0e9 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -198,19 +198,19 @@ static int hda_codec_probe(struct snd_soc_component *component)
 	ret = snd_hda_codec_device_new(codec->bus, component->card->snd_card, hdev->addr, codec,
 				       false);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "create hda codec failed: %d\n", ret);
+		dev_err(&hdev->dev, "codec create failed: %d\n", ret);
 		goto device_new_err;
 	}
 
 	ret = snd_hda_codec_set_name(codec, codec->preset->name);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "name failed %s\n", codec->preset->name);
+		dev_err(&hdev->dev, "set name: %s failed: %d\n", codec->preset->name, ret);
 		goto err;
 	}
 
 	ret = snd_hdac_regmap_init(&codec->core);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "regmap init failed\n");
+		dev_err(&hdev->dev, "regmap init failed: %d\n", ret);
 		goto err;
 	}
 
@@ -223,13 +223,13 @@ static int hda_codec_probe(struct snd_soc_component *component)
 
 	ret = patch(codec);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "patch failed %d\n", ret);
+		dev_err(&hdev->dev, "codec init failed: %d\n", ret);
 		goto err;
 	}
 
 	ret = snd_hda_codec_parse_pcms(codec);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "unable to map pcms to dai %d\n", ret);
+		dev_err(&hdev->dev, "unable to map pcms to dai: %d\n", ret);
 		goto parse_pcms_err;
 	}
 
-- 
2.25.1

