Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FADC198A0D
	for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 12:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718629065; cv=none; b=ShwbkyM7VJ9SH6xI4w4fFeEa30qXa3tfc3fNeUDcsv6pk15MVQuC3qlPobhvjtULCVFt96NT1cMrByeYSXv0QXsVzrLhAbxS7yiPAETaMo5cMaTrGV31QW4jO8qlf92sWPQwOI/M1FzkogCQqOO0tpw3YLKBh5TFgVlxojpSzxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718629065; c=relaxed/simple;
	bh=Unpy0fcgAVV1amIXBoFEhjYt8fI7Z2Vt34a/d1IuTRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TVS4oa1ZRI90AMVlTC3cy7rTfa5E/e11Lck5nzSYxX3hW3UfS3lBQcSVMjvbOZfD2bCaUKvpas7lrnoIUL8vfxZpVQUrKcfdjAM6dHTrQyFJBmFsCbuXRjQNKw/UGDl6XoDi3LUXVIDekx+kmKHsDvSH5nMNp8LCTt2ZnnjIeZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z40PyfSa; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z40PyfSa"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57c83100c5fso4737037a12.3
        for <linux-sound@vger.kernel.org>; Mon, 17 Jun 2024 05:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718629060; x=1719233860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQpH5thE80wSRqo8VNuFTjz9gxUBUOzFe51cHAyNWJQ=;
        b=Z40PyfSazakNhtYd9E8zuSJ2krof6H2qHApU1d9qnhRWfdQ5SNqWpkuGkDLS13qkoQ
         RkATk5rq7uaw4gQKvl5wdiDf+vlMTQBcjotzgaFFjfBtMSlVucY6eLJ4dOKfCEehAMXi
         xfYeUJ4iAuqoUwe2T58sCxYf7/AQQkg1XRUj0vK+4brLgGyccndA/q2Szwf7wyzzcfSy
         R+CxZYiYp1Fy6G9VaBMhDOceJNb7gl5e1RfGyBRMvrenDxday/Frua52rcSdVjpG4dfW
         G5FzKm2yOlrbVn+V7uT5XaaTAna7jVILHaSPVNT8uhl9gmgXbyx6T/sHWrFruHtKJhFD
         woCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629060; x=1719233860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQpH5thE80wSRqo8VNuFTjz9gxUBUOzFe51cHAyNWJQ=;
        b=EcQzJtZL2xcBu5hkeXp+nAZCTaUQ3Y18fYJFQ0hi3XQXAULEItL27buotg9ygiRkFv
         zX0j8PqALsU1+6WoIWGWeLKV/e6UZKv8w+u4h1YSajrSC7SWZFryNGjnGLqUtrRXHIkL
         BFx9se82E5hUNqlcNrwvKFOWdaNRkZbaYqSKII4iZnhtsTyPa4Rkwfvlo24+LdL1K2G7
         mGfA7JFZxHLv4jKVPNQaDDME48lMjJNxy3hIxu69vnaJgHbVcoD3rvEYDW+9PzxA6wMJ
         dDuTxKEX4bLrNEZ+ZkZuOh6ZyCtxxqc/Krw9GmIoNFHIky+/xSPwqs5gl0rjlrMPRryr
         s6ww==
X-Forwarded-Encrypted: i=1; AJvYcCU0AYrlLbGQRNBixcfGz7Bts2kQhqkbiZ1NZDp69uQKYbtQBbTwoZ3cYwnjwHEZAdKjFgfpr/AuR2j+ToA8UvhiacqVyESkMPGrM4A=
X-Gm-Message-State: AOJu0YzFr3vOHLBE1OmDrglYeklzD1ZMF2naxDfa0EpyGe6n+j8DFyeb
	7hsvliknVCRRMafpAMY59oI6RrgDDh6Hhw348HWIMWuAv5er2Uh3JEyfFdfUe3c=
X-Google-Smtp-Source: AGHT+IFIpkGDjeitChcxtvy5960jSacHi9eMQgBmL6cQ9MHVVM+dDQzXFL20jMKx9ZwVFpmrLy7w6A==
X-Received: by 2002:a50:d541:0:b0:57c:563b:cc40 with SMTP id 4fb4d7f45d1cf-57cbd69017cmr5698477a12.25.1718629060139;
        Mon, 17 Jun 2024 05:57:40 -0700 (PDT)
Received: from krzk-bin.. ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb7439070sm6428860a12.85.2024.06.17.05.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:57:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] ASoC: Constify DAI ops auto_selectable_formats
Date: Mon, 17 Jun 2024 14:57:35 +0200
Message-ID: <20240617125735.582963-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617125735.582963-1-krzysztof.kozlowski@linaro.org>
References: <20240617125735.582963-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The static arrays passed as 'auto_selectable_formats' are not modified
by the drivers nor by the core code, so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add missing change to sound/soc/codecs/framer-codec.c (Herve)
---
 sound/soc/codecs/ak4613.c          | 2 +-
 sound/soc/codecs/da7213.c          | 2 +-
 sound/soc/codecs/framer-codec.c    | 2 +-
 sound/soc/codecs/hdmi-codec.c      | 2 +-
 sound/soc/codecs/idt821034.c       | 2 +-
 sound/soc/codecs/pcm3168a.c        | 2 +-
 sound/soc/codecs/peb2466.c         | 2 +-
 sound/soc/generic/test-component.c | 2 +-
 sound/soc/sh/fsi.c                 | 2 +-
 sound/soc/sh/rcar/core.c           | 2 +-
 sound/soc/soc-utils.c              | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 73fb35560e51..551738abd1a5 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -753,7 +753,7 @@ static int ak4613_dai_trigger(struct snd_pcm_substream *substream, int cmd,
  *	SND_SOC_DAIFMT_CBC_CFC
  *	SND_SOC_DAIFMT_CBP_CFP
  */
-static u64 ak4613_dai_formats =
+static const u64 ak4613_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
 
diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index a2b328f3b39f..f3ef6fb55304 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -1720,7 +1720,7 @@ static int da7213_set_component_pll(struct snd_soc_component *component,
  *	SND_SOC_DAIFMT_CBC_CFC
  *	SND_SOC_DAIFMT_CBP_CFP
  */
-static u64 da7213_dai_formats =
+static const u64 da7213_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
diff --git a/sound/soc/codecs/framer-codec.c b/sound/soc/codecs/framer-codec.c
index e5fcde9ee308..6f57a3aeecc8 100644
--- a/sound/soc/codecs/framer-codec.c
+++ b/sound/soc/codecs/framer-codec.c
@@ -238,7 +238,7 @@ static int framer_dai_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static u64 framer_dai_formats[] = {
+static const u64 framer_dai_formats[] = {
 	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
 };
 
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index d3abb7ce2153..74caae52e127 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -715,7 +715,7 @@ static int hdmi_codec_mute(struct snd_soc_dai *dai, int mute, int direction)
  * For example,
  *	${LINUX}/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
  */
-static u64 hdmi_codec_formats =
+static const u64 hdmi_codec_formats =
 	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
 	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
 	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
index 2cc7b9166e69..cb7a68c799f8 100644
--- a/sound/soc/codecs/idt821034.c
+++ b/sound/soc/codecs/idt821034.c
@@ -860,7 +860,7 @@ static int idt821034_dai_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static u64 idt821034_dai_formats[] = {
+static const u64 idt821034_dai_formats[] = {
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
 };
diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 3c0e0fdbfc5c..fac0617ab95b 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -562,7 +562,7 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static u64 pcm3168a_dai_formats[] = {
+static const u64 pcm3168a_dai_formats[] = {
 	/*
 	 * Select below from Sound Card, not here
 	 *	SND_SOC_DAIFMT_CBC_CFC
diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 5dec69be0acb..76ee7e3f4d9b 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -814,7 +814,7 @@ static int peb2466_dai_startup(struct snd_pcm_substream *substream,
 					  &peb2466_sample_bits_constr);
 }
 
-static u64 peb2466_dai_formats[] = {
+static const u64 peb2466_dai_formats[] = {
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
 };
diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index e4967540a2e1..e9e5e235a8a6 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -189,7 +189,7 @@ static int test_dai_bespoke_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static u64 test_dai_formats =
+static const u64 test_dai_formats =
 	/*
 	 * Select below from Sound Card, not auto
 	 *	SND_SOC_POSSIBLE_DAIFMT_BP_FP
diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index 84601ba43b7d..087e379aa3bc 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -1713,7 +1713,7 @@ static int fsi_dai_hw_params(struct snd_pcm_substream *substream,
  *	SND_SOC_DAIFMT_CBC_CFC
  *	SND_SOC_DAIFMT_CBP_CFP
  */
-static u64 fsi_dai_formats =
+static const u64 fsi_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 6bc7027ed4db..63b3c8bf0fde 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1061,7 +1061,7 @@ static int rsnd_soc_dai_prepare(struct snd_pcm_substream *substream,
 	return rsnd_dai_call(prepare, io, priv);
 }
 
-static u64 rsnd_soc_dai_formats[] = {
+static const u64 rsnd_soc_dai_formats[] = {
 	/*
 	 * 1st Priority
 	 *
diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index d05e712c9518..20135a8359bf 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -163,7 +163,7 @@ static const struct snd_soc_component_driver dummy_codec = {
  *	SND_SOC_POSSIBLE_DAIFMT_CBC_CFP
  *	SND_SOC_POSSIBLE_DAIFMT_CBC_CFC
  */
-static u64 dummy_dai_formats =
+static const u64 dummy_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
-- 
2.43.0

