Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C5F3F65F6
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692381; cv=none; b=The0icgeMGR5qTZ/awBXIVI0wxBVYcgasH7TgDjWkFNCHrdAKye4rR8zWEyoYqCJbk0DU96wzIuOsblhUDK8s8fYYgXT54htJUZ0Qh6OblZPWs0xCOhxajrqeUzdIaVsSz43X5uXJ6IwYoFrsb9P6cxTnxxWIaDJ+Ug0LeBXRy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692381; c=relaxed/simple;
	bh=UB/a7mDSvTJHdOqH8tC7wDihHMb6zdr57dJos5YfbBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DvrD29keGMzsxs0kET7yHV8WVriIEEClQFkOc4urrM0nh47hjpgBJSzrTWPYZI2oIZSpDDaAR//82R8H0A4ql4Fy++qgopqoKywLA0yoh9001UFRYopwRfyPsqjnFOAd71Ub/IW/ZgIvVYyD1p36z/QsQKmgSqfKic7TmIhsIug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxpu4Eac; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxpu4Eac"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30bdb3eb5f0so149380eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692379; x=1782297179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9wU4tKY2KGJdHyXYk6dnV63C3KexEicox33mI2r9NjI=;
        b=bxpu4Eac4EvLKNNVmQKyLrNJr+Yek8DVfERBoHYcUMRqIucp6ByJ63LzuY1eDE+1N8
         UhbPvCAyaaRShW4o/oMJzU1TwP5VpCNMoFLd+YFR0xuVyo4r/cgvuGT4W0BmJw+4V5hS
         07IxzvDcuSZS+qAPF/kHl2Wl3XqiYWkKlIE1DdvFwtE1u+s/EezhixpkvMQo3b9ZES8v
         743nhXAlzymZtxiomTPY3CTE/RM+CszdH10ugDxCGVwvtfTzKV/K9702DLm2ZI2SrFBK
         JHY7DSw4+aOZBqMnQ5USga12fC9iwGIh336AE+MAXGSF0N2sZ025zUWMYb9ybAIVI7Jc
         YkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692379; x=1782297179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wU4tKY2KGJdHyXYk6dnV63C3KexEicox33mI2r9NjI=;
        b=Pec8DvWxyYT9jfIC6Jy+7440apooeHM7txyJDWVO7p1svL9Rduo9F0zOt0c/+rOQd4
         ZdN+FI4WKM8p7+8lMnk6P1xmXO9qzJGpmQdGENUipvcF13Vq1PPjCFkcIxSf+If/PA5L
         1IHW/cHBJN8pgqup3c6tf3jtpYJLPgmxJkq5PVwSYKLgvrGXYxWhIjxkzxqvipLGSU4C
         KbEaWgV2wZA5gLFp4yZFmvREwR5i60IAZKwU7Ql/r4cEaAK+ns6CWZywkKMn8Wb5sqL2
         O2PajkreaznlAJftlEqyChJm3dgIjvSYgMIUDdy9h4KI3mPwC/I1v5zeHCyfLIGMbhAH
         Qg6A==
X-Forwarded-Encrypted: i=1; AFNElJ9dAtRwp6F0V1UhCtxVpt3SKQQELVFZqI1ghcbyArfpe8JXDphKpOcPdFF60Ev/cOqZn44hXubX3tTruA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLbeh7wodoaM9U26yautApmrF7Uli08YWT4OjddCLPGV9Ss5au
	P/NREpHeew7dgVYuxb9NVQgl9cIFjYEscsYPKZ/Jt8KoN/9UFBr/gWHz
X-Gm-Gg: AfdE7cmIPRqGYte+2hJyKQZsZiD3/U63Q2rAYLQ7bRzUPifalmVDveux5Fga1HPAec3
	MK+9hg5ia8TvmSKXrzUgFDFvid5UkxMTMUSwGo/oMxqx0ELeOW5yCLGJ2Az5wBakWSYThXFnwF2
	m7EdRHAFQ9XCBxPOZ7a+WoPbyeHnC8Gc+xmyft3jTm6Sxq878hKQGx6iokqVYGf+aG4p18/5hRm
	1U9gS3GZi37ZXmpp9Vgpa084qqtNx6YtelDAfEgIQoXasFfJS0CSKIK9XtkOhrEeNsjB68P7byY
	NEIXvnHR+3jEA52FXQONrE3PxrE2MrFo3O4394xc/NS6p6xMD/D9zmFTnlDBX8jX014Bs3lSkfV
	V7MXq/JqUyhXk6QALUqyaK7+EBj0Tuj7XhVb0OCQR6+CZxM1MLlPkM1MIJvfHuLbjAY/h0JL5Hx
	w83pyZuNF1+n6cOwyARV6pfyQ3mYyo94G9Lrf+jo88+sK7eKY=
X-Received: by 2002:a05:7301:6402:b0:30b:d209:dc18 with SMTP id 5a478bee46e88-30bd209ff68mr687132eec.10.1781692378517;
        Wed, 17 Jun 2026 03:32:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:32:58 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/78] ASoC: codecs: Use guard() for mutex & spin locks
Date: Wed, 17 Jun 2026 17:31:17 +0700
Message-ID: <20260617103235.449609-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts mutex and spinlock handling in the ASoC codec
drivers to use guard() and scoped_guard() helpers.
The changes are purely refactoring and should have no functional
impact.

Compile tested only.

Best regards,
Phuc

bui duc phuc (78):
  ASoC: codecs: ab8500: Use guard() for mutex locks
  ASoC: codecs: ak4613: Use guard() for mutex locks
  ASoC: codecs: arizona-jack: Use guard() for mutex locks
  ASoC: codecs: arizona: Use guard() for mutex locks
  ASoC: codecs: aw87390: Use guard() for mutex locks
  ASoC: codecs: aw88081: Use guard() for mutex locks
  ASoC: codecs: aw88166: Use guard() for mutex locks
  ASoC: codecs: aw88261: Use guard() for mutex locks
  ASoC: codecs: aw88395: Use guard() for mutex locks
  ASoC: codecs: aw88399: Use guard() for mutex locks
  ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
  ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
  ASoC: codecs: cs35l56: Use guard() for mutex locks
  ASoC: codecs: cs42l42: Use guard() for mutex locks
  ASoC: codecs: cs42l43: Use guard() for mutex locks
  ASoC: codecs: cs42l84: Use guard() for mutex locks
  ASoC: codecs: cs43130: Use guard() for mutex locks
  ASoC: codecs: cs47l15: Use guard() for mutex locks
  ASoC: codecs: cs47l35: Use guard() for mutex locks
  ASoC: codecs: cs47l85: Use guard() for mutex locks
  ASoC: codecs: cs47l90: Use guard() for mutex locks
  ASoC: codecs: cs47l92: Use guard() for mutex locks
  ASoC: codecs: cs48l32: Use guard() for mutex locks
  ASoC: codecs: cs2072x: Use guard() for mutex locks
  ASoC: codecs: da7213: Use guard() for mutex locks
  ASoC: codecs: da7219: Use guard() for mutex locks
  ASoC: codecs: es8316: Use guard() for mutex locks
  ASoC: codecs: es8326: Use guard() for mutex locks
  ASoC: codecs: es9356: Use guard() for mutex locks
  ASoC: codecs: fs210x: Use guard() for mutex locks
  ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
  ASoC: codecs: hdmi-codec: Use guard() for mutex locks
  ASoC: codecs: idt821034: Use guard() for mutex locks
  ASoC: codecs: lpass-macro: Use guard() for mutex locks
  ASoC: codecs: madera: Use guard() for mutex locks
  ASoC: codecs: max98095: Use guard() for mutex locks
  ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
  ASoC: codecs: pcm512x: Use guard() for mutex locks
  ASoC: codecs: pcm6240: Use guard() for mutex locks
  ASoC: codecs: peb2466: Use guard() for mutex locks
  ASoC: codecs: rt5514-spi: Use guard() for mutex locks
  ASoC: codecs: rt5645: Use guard() for mutex locks
  ASoC: codecs: rt5665: Use guard() for mutex locks
  ASoC: codecs: rt5668: Use guard() for mutex locks
  ASoC: codecs: rt5677: Use guard() for mutex locks
  ASoC: codecs: rt5682: Use guard() for mutex locks
  ASoC: codecs: rt700: Use guard() for mutex locks
  ASoC: codecs: rt711: Use guard() for mutex locks
  ASoC: codecs: rt712: Use guard() for mutex locks
  ASoC: codecs: rt721: Use guard() for mutex locks
  ASoC: codecs: rt722: Use guard() for mutex locks
  ASoC: codecs: sigmadsp: Use guard() for mutex locks
  ASoC: codecs: sta350: Use guard() for mutex locks
  ASoC: codecs: sta32x: Use guard() for mutex locks
  ASoC: codecs: tas2781: Use guard() for mutex locks
  ASoC: codecs: tas2783: Use guard() for mutex locks
  ASoC: codecs: tas5805m: Use guard() for mutex locks
  ASoC: codecs: tas675x: Use guard() for mutex locks
  ASoC: codecs: tlv320dac33: Use guard() for mutex & spin locks
  ASoC: codecs: tscs42xx: Use guard() for mutex locks
  ASoC: codecs: tscs454: Use guard() for mutex locks
  ASoC: codecs: twl6040: Use guard() for mutex locks
  ASoC: codecs: wcd-mbhc: Use guard() for mutex locks
  ASoC: codecs: wcd934x: Use guard() for mutex locks
  ASoC: codecs: wcd937x: Use guard() for mutex locks
  ASoC: codecs: wcd938x: Use guard() for mutex locks
  ASoC: codecs: wcd939x: Use guard() for mutex locks
  ASoC: codecs: wm0010: Use guard() for mutex & spin locks
  ASoC: codecs: wm2000: Use guard() for mutex locks
  ASoC: codecs: wm5102: Use guard() for mutex locks
  ASoC: codecs: wm8731: Use guard() for mutex locks
  ASoC: codecs: wm8903: Use guard() for mutex locks
  ASoC: codecs: wm8958: Use guard() for mutex locks
  ASoC: codecs: wm8962: Use guard() for mutex locks
  ASoC: codecs: wm8994: Use guard() for mutex locks
  ASoC: codecs: wm971x: Use guard() for mutex locks
  ASoC: codecs: wm_adsp: Use guard() for mutex locks
  ASoC: codecs: wsa88xx: Use guard() for mutex locks

 sound/soc/codecs/ab8500-codec.c           |  11 +-
 sound/soc/codecs/ak4613.c                 |  72 ++++---
 sound/soc/codecs/arizona-jack.c           | 194 +++++++++----------
 sound/soc/codecs/arizona.c                |  25 +--
 sound/soc/codecs/aw87390.c                |   9 +-
 sound/soc/codecs/aw88081.c                |  17 +-
 sound/soc/codecs/aw88166.c                |  23 +--
 sound/soc/codecs/aw88261.c                |  20 +-
 sound/soc/codecs/aw88395/aw88395.c        |  23 +--
 sound/soc/codecs/aw88395/aw88395_device.c |  39 ++--
 sound/soc/codecs/aw88399.c                |  14 +-
 sound/soc/codecs/cros_ec_codec.c          |  17 +-
 sound/soc/codecs/cs-amp-lib.c             |  10 +-
 sound/soc/codecs/cs35l56-shared.c         |   6 +-
 sound/soc/codecs/cs35l56.c                |  56 +++---
 sound/soc/codecs/cs42l42.c                | 222 +++++++++++-----------
 sound/soc/codecs/cs42l43-jack.c           |  57 +++---
 sound/soc/codecs/cs42l43.c                |  16 +-
 sound/soc/codecs/cs42l84.c                |   9 +-
 sound/soc/codecs/cs43130.c                |  96 +++++-----
 sound/soc/codecs/cs47l15.c                |  10 +-
 sound/soc/codecs/cs47l35.c                |  10 +-
 sound/soc/codecs/cs47l85.c                |  10 +-
 sound/soc/codecs/cs47l90.c                |  10 +-
 sound/soc/codecs/cs47l92.c                |  10 +-
 sound/soc/codecs/cs48l32.c                |  28 ++-
 sound/soc/codecs/cx2072x.c                |   4 +-
 sound/soc/codecs/da7213.c                 |  36 ++--
 sound/soc/codecs/da7219.c                 |  59 ++----
 sound/soc/codecs/es8316.c                 |  30 ++-
 sound/soc/codecs/es8326.c                 |  29 ++-
 sound/soc/codecs/es9356.c                 |  29 ++-
 sound/soc/codecs/fs210x.c                 |  86 +++------
 sound/soc/codecs/hdac_hdmi.c              | 116 ++++++-----
 sound/soc/codecs/hdmi-codec.c             |  16 +-
 sound/soc/codecs/idt821034.c              | 120 +++++-------
 sound/soc/codecs/lpass-macro-common.c     |  11 +-
 sound/soc/codecs/madera.c                 |  31 +--
 sound/soc/codecs/max98095.c               |  34 ++--
 sound/soc/codecs/mt6359-accdet.c          |  12 +-
 sound/soc/codecs/pcm512x.c                |  17 +-
 sound/soc/codecs/pcm6240.c                |  27 ++-
 sound/soc/codecs/peb2466.c                |  15 +-
 sound/soc/codecs/rt5514-spi.c             |  20 +-
 sound/soc/codecs/rt5645.c                 | 161 ++++++++--------
 sound/soc/codecs/rt5665.c                 |   7 +-
 sound/soc/codecs/rt5668.c                 |   9 +-
 sound/soc/codecs/rt5677-spi.c             |  35 ++--
 sound/soc/codecs/rt5677.c                 |  77 ++++----
 sound/soc/codecs/rt5682-sdw.c             |  23 ++-
 sound/soc/codecs/rt5682.c                 |   4 +-
 sound/soc/codecs/rt5682s.c                |  16 +-
 sound/soc/codecs/rt700-sdw.c              |  13 +-
 sound/soc/codecs/rt711-sdca-sdw.c         |  33 ++--
 sound/soc/codecs/rt711-sdca.c             |   7 +-
 sound/soc/codecs/rt711-sdw.c              |  23 ++-
 sound/soc/codecs/rt711.c                  |  19 +-
 sound/soc/codecs/rt712-sdca-sdw.c         |  34 ++--
 sound/soc/codecs/rt712-sdca.c             |   7 +-
 sound/soc/codecs/rt721-sdca-sdw.c         |  33 ++--
 sound/soc/codecs/rt721-sdca.c             |   3 +-
 sound/soc/codecs/rt722-sdca-sdw.c         |  33 ++--
 sound/soc/codecs/rt722-sdca.c             |   3 +-
 sound/soc/codecs/sigmadsp.c               |  16 +-
 sound/soc/codecs/sta32x.c                 |  12 +-
 sound/soc/codecs/sta350.c                 |  12 +-
 sound/soc/codecs/tas2781-comlib-i2c.c     |   4 +-
 sound/soc/codecs/tas2781-i2c.c            |  20 +-
 sound/soc/codecs/tas2783-sdw.c            |  89 +++++----
 sound/soc/codecs/tas5805m.c               |  15 +-
 sound/soc/codecs/tas675x.c                |   6 +-
 sound/soc/codecs/tlv320dac33.c            |  77 +++-----
 sound/soc/codecs/tscs42xx.c               |  44 ++---
 sound/soc/codecs/tscs454.c                | 106 ++++-------
 sound/soc/codecs/twl6040.c                |   4 +-
 sound/soc/codecs/wcd-mbhc-v2.c            | 142 +++++++-------
 sound/soc/codecs/wcd934x.c                |  46 ++---
 sound/soc/codecs/wcd937x.c                |  24 +--
 sound/soc/codecs/wcd938x.c                |  21 +-
 sound/soc/codecs/wcd939x.c                |  19 +-
 sound/soc/codecs/wm0010.c                 |  63 +++---
 sound/soc/codecs/wm2000.c                 |  27 +--
 sound/soc/codecs/wm5102.c                 |  12 +-
 sound/soc/codecs/wm8731.c                 |   3 +-
 sound/soc/codecs/wm8903.c                 |   3 +-
 sound/soc/codecs/wm8958-dsp2.c            |   9 +-
 sound/soc/codecs/wm8962.c                 |   7 +-
 sound/soc/codecs/wm8994.c                 |  51 ++---
 sound/soc/codecs/wm9712.c                 |   4 +-
 sound/soc/codecs/wm9713.c                 |   4 +-
 sound/soc/codecs/wm_adsp.c                |  87 +++------
 sound/soc/codecs/wsa883x.c                |  10 +-
 sound/soc/codecs/wsa884x.c                |  10 +-
 93 files changed, 1330 insertions(+), 1863 deletions(-)

-- 
2.43.0

