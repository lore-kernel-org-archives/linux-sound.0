Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F18E1A01CC
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 09:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743760768; cv=none; b=cIC4GrZQJDh3LeX2wocRsTOb/MWUq9BCSrJTUjRfByzXad7nrqVnL//qN465jX8yaOYJBlpG0VFun7LXT72jHIV/FrjFzZpBL/f52ZNcMFTvpflRK1F1NQuEeJeSxEJFCME3cubtrMXiLMhv4Cbg3oT+if9zaRYpUvE9GDYA7o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743760768; c=relaxed/simple;
	bh=VfkBr/ugkba6c3CJ32sLEc3nsgHIj3kwappS9spYHBY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=idkLF8GYQkPHnvlkq5bJ23gG0vSW6qoMWTZVHk61yHW3F2DaSFH4jrXcfZEM8w6D939gT7pT1AcrRfR1TEffMFkngL2gBaKrqYc1Arfj1aQnABvwBNAL362Tq7oA1eO0eh65J3s+BESD4rjNKwLuLKPbTD0+1KCbuua336dcXdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awapjK63; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awapjK63"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743760764; x=1775296764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VfkBr/ugkba6c3CJ32sLEc3nsgHIj3kwappS9spYHBY=;
  b=awapjK63kIM1i9Z6UOFj97tM+StVsChXBYHpVUiVLP2pBdaGJLjYydfl
   FDfXwXyKANNBtnfU4j7jhgk1Esr1t4fONuP1BnApehQRswXKNVYDv+qjc
   +mRSy8iwA3EzgaEB7shrhuikfmAtflK3tGtZ5aARo3r36WttlqsixxPMf
   Hd7de6pWge+1w1nJg9W0W0csW9ZnK6gSkzWb5nq2ob2+vF6YZkim7syuO
   SeKZGgjqjyQHoFJDhquJ0Fnf4UTWazGL8wheyRRF6Fn5e2BaI1Nd9xEH8
   yVTtupH84QPb/L59BzkavHvI7m83Dj6t2iW+lpGW9lbd94QJ/7opZPSVO
   Q==;
X-CSE-ConnectionGUID: dlX0d71TRCmHSd/wvkN4GQ==
X-CSE-MsgGUID: anu2W5cfRX2sti91oEubtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="47909198"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="47909198"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 02:59:22 -0700
X-CSE-ConnectionGUID: Asu93Ru5TZ2tEfM73pnGzQ==
X-CSE-MsgGUID: f2vpK81NTIKkRP9RqdqfHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="127163707"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 04 Apr 2025 02:59:20 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/2] ASoC: Intel: avs: Permit deferred card registration
Date: Fri,  4 Apr 2025 12:16:22 +0200
Message-Id: <20250404101622.3673850-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404101622.3673850-1-cezary.rojewski@intel.com>
References: <20250404101622.3673850-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Utilize card->deferrable flag to support delayed card enumeration -
scenario where snd_soc_register_card() occurs before all the required
card components are registered into the framework.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/da7219.c    | 2 +-
 sound/soc/intel/avs/boards/dmic.c      | 2 +-
 sound/soc/intel/avs/boards/es8336.c    | 2 +-
 sound/soc/intel/avs/boards/hdaudio.c   | 2 +-
 sound/soc/intel/avs/boards/i2s_test.c  | 2 +-
 sound/soc/intel/avs/boards/max98357a.c | 2 +-
 sound/soc/intel/avs/boards/max98373.c  | 2 +-
 sound/soc/intel/avs/boards/max98927.c  | 2 +-
 sound/soc/intel/avs/boards/nau8825.c   | 2 +-
 sound/soc/intel/avs/boards/pcm3168a.c  | 2 +-
 sound/soc/intel/avs/boards/probe.c     | 2 +-
 sound/soc/intel/avs/boards/rt274.c     | 2 +-
 sound/soc/intel/avs/boards/rt286.c     | 2 +-
 sound/soc/intel/avs/boards/rt298.c     | 2 +-
 sound/soc/intel/avs/boards/rt5514.c    | 2 +-
 sound/soc/intel/avs/boards/rt5663.c    | 2 +-
 sound/soc/intel/avs/boards/rt5682.c    | 2 +-
 sound/soc/intel/avs/boards/ssm4567.c   | 2 +-
 18 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 7217ae51e89c..a248221a666d 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -256,7 +256,7 @@ static int avs_da7219_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_da7219_driver_ids[] = {
diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index 4dd9591ee98b..237f6845935d 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -74,7 +74,7 @@ static int avs_dmic_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_dmic_driver_ids[] = {
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 6f3c4f6c9302..1caaf9a49e40 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -303,7 +303,7 @@ static int avs_es8336_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_es8336_driver_ids[] = {
diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index cb6d54db7189..c4e65c8dc045 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -209,7 +209,7 @@ static int avs_hdaudio_probe(struct platform_device *pdev)
 	if (hda_codec_is_display(codec))
 		card->late_probe = avs_card_late_probe;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_hdaudio_driver_ids[] = {
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 4556f105c793..ffad3718c3b0 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -101,7 +101,7 @@ static int avs_i2s_test_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_i2s_test_driver_ids[] = {
diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index c55c1d60b777..88938a985df5 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -132,7 +132,7 @@ static int avs_max98357a_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_max98357a_driver_ids[] = {
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index 970f82bf4ce8..468815a846b3 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -187,7 +187,7 @@ static int avs_max98373_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_max98373_driver_ids[] = {
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index e4ce553bf1d6..8ed1f3d7ff06 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -184,7 +184,7 @@ static int avs_max98927_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_max98927_driver_ids[] = {
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index e203ceb83b87..3b0f1a2f2068 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -290,7 +290,7 @@ static int avs_nau8825_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_nau8825_driver_ids[] = {
diff --git a/sound/soc/intel/avs/boards/pcm3168a.c b/sound/soc/intel/avs/boards/pcm3168a.c
index 5d0e7a5bdc74..04c980662adf 100644
--- a/sound/soc/intel/avs/boards/pcm3168a.c
+++ b/sound/soc/intel/avs/boards/pcm3168a.c
@@ -116,7 +116,7 @@ static int avs_pcm3168a_probe(struct platform_device *pdev)
 	card->num_dapm_routes = ARRAY_SIZE(card_routes);
 	card->fully_routed = true;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_pcm3168a_driver_ids[] = {
diff --git a/sound/soc/intel/avs/boards/probe.c b/sound/soc/intel/avs/boards/probe.c
index 1cdc285ab810..f2924b150c93 100644
--- a/sound/soc/intel/avs/boards/probe.c
+++ b/sound/soc/intel/avs/boards/probe.c
@@ -47,7 +47,7 @@ static int avs_probe_mb_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_probe_mb_driver_ids[] = {
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index 29977aee2153..696d052e1248 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -254,7 +254,7 @@ static int avs_rt274_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_rt274_driver_ids[] = {
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 6a27c6a9f394..de579b8053a4 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -224,7 +224,7 @@ static int avs_rt286_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_rt286_driver_ids[] = {
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index a7a463d6f852..de4be63b3c10 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -243,7 +243,7 @@ static int avs_rt298_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_rt298_driver_ids[] = {
diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index d1c3e29a28ff..2bca30f6387f 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -170,7 +170,7 @@ static int avs_rt5514_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_rt5514_driver_ids[] = {
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index e3310b3268ba..d230c598debd 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -242,7 +242,7 @@ static int avs_rt5663_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_rt5663_driver_ids[] = {
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 339df0b944c1..63e4b6c0d76e 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -318,7 +318,7 @@ static int avs_rt5682_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_rt5682_driver_ids[] = {
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 7667790d5273..c6e62bdda2a8 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -173,7 +173,7 @@ static int avs_ssm4567_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(dev, card);
+	return devm_snd_soc_register_deferrable_card(dev, card);
 }
 
 static const struct platform_device_id avs_ssm4567_driver_ids[] = {
-- 
2.25.1

