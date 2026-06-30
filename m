Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCEE3E63A6
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801310; cv=none; b=S671d4Nk6fl91bO/rfiv2lI9WAsKQWzjeO5CTfH9vk54Es8UtSuFcdra6AWxrYe48J5g2DQN/ucu5SO+zkfE7N6PutpFj7X+deCYngkbmJ5I80w+HKPjQRSFAzMHzgIVBamlmramMKmRAGnBylsygtRLDeAD4Zj1IaOYkTOKpNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801310; c=relaxed/simple;
	bh=jq36afZkFRxy4toa7BFIIUku4sKPif97JtHBPvHPWg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ERYphkpukAuhYxMYQbDgbw/cye1OvqEZxxnpuV4OM4MxuxKw0EbTu7Y1zh7iZF9Pu3rZUltHeTo+GHB7HEP2BBU0nXTVeh8S8vnxzmUNHoKBBlMXgdobi4XvITcc8/gVYjtMGUyrgPnotwM/vPOdAmPV5zcSRPbCn5uFE/bZTQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVckGCh0; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVckGCh0"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84783bce476so1650955b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801306; x=1783406106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=syBpKBFGjGejGwg1BjAhn4n5QdMB5B8yOZv838BwUKA=;
        b=dVckGCh03U0GckHpCByvkP0J8p9lJ1pLYawntPT7vic6dUzRWIHu6/1Xq+ciTsJlI7
         s2NFIMR6u8xpFLKnCjakUgO1h+TuSzg07BvYgiHX2VNId19rBFi9ri/43Hn8HjBEeGO2
         Bslz/PnDxPw1jqJjSGBciGowDqAat1jJWsjxfxJ9QeqHcf4Q33g2J9bPCXfI2oix+jw5
         9Mo0owedhyuvPh/rD/x3HPuAChMrwHNLWYa7YbmVlFCk855xPG1pU7I5T8x9o+Fj0NCp
         7SDiCJQ3Vv1BTqlDYLv116PiwBCbuqj94lo5WOEVYzfWkV1sMhM8iPIc9Is/P32bNN/5
         Lvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801306; x=1783406106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syBpKBFGjGejGwg1BjAhn4n5QdMB5B8yOZv838BwUKA=;
        b=KC0MOnq2uppplcrA4bV1d21UKiC5ashBShyo/iRcfE4k99IVTGtF5J2OTlTMPdx0AU
         8FfHCQMtVPW+4W+MPjyzfd9AoXtQBAxjh+jRYanYTSREr3oCgX+cp2BYFynKvNBx6rRC
         PYcXhKss2DWL40zN53xOmdL5DCCCq0WtfHmTW0xheiLaMvm/8YbaIUurrbEkdziirABc
         gFPGZjoP/OgXsGTRD3YHorR95rkkqb2ZOjG98Tl7VPhnFa1nqJQuu/SqpS1PC8JEYaIb
         LB3xUJ14OfMIjMfwv91ReLysXD9+StybiOmTiAGWcyx32ccJfZmd7IS5xQRQtrgYEbOr
         U9/A==
X-Forwarded-Encrypted: i=1; AHgh+Rr9XeCsG8gWpRVMRroKBb6SH91Ism/3kHb9QHvvyj+aMrxbJ3I1B42wcOPx76N7CUJXJPKM1isbuknFyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuUam1r+P5sOL4VMZvjFeJWxNnSo0MqpYX0FJzDlahP1aonjWq
	2YQTWPYCCC5QHWdOFsu8fZ4X5+Jsrnex5MNyhsvGRbufTLpAYWoe1FN9
X-Gm-Gg: AfdE7clxn0ur4CX/U7pQq0gSEn2CckyUV87pjuTcPG7sTlraiHiTS+hXSezoEQsopw7
	aj9wEqjPD2p0OV3Hc77mIYTObbH3B8mI4omRPXMIAYj7kHprc9YyQ+TsE/p9R67iqA4eG+AkEeL
	P2/javDCgXqOdhHuZJqiVopbt8ks/5WWG4s9b4vP0mtDs+x4CVntpIYGfvtRJpiu483leWEA5/e
	+t/90Nn3DNNQzMvNIsiye8JOBEn4cTIRWh3FQG29DC0+oXXDvluibRicp1sqi/RL/GHU2l2+GXp
	SKsWTyxeu2RSqfy81wEKd7LDrLhbX2cSlGPJ6hRnpKj7hggVQIGpCPmJ0xkEwPdJLBvKTL2e0A4
	vB0TMlJKCrUq8XOgmOv167j9tKFF9DmbrV3aAzJy4mjaGcZXMr+/JUtskph2oV2UTt1hKC06QDY
	8fMp/mzeVJbWRPgGhhXj6eREG21YP9bUO+Ph1LVRwdbn5UOo54jkotSXg43A==
X-Received: by 2002:a05:6a00:b481:b0:845:e44c:2e5 with SMTP id d2e1a72fcca58-8479f109b70mr1989863b3a.22.1782801306377;
        Mon, 29 Jun 2026 23:35:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/27] ASoC: codecs: Use guard() for mutex & spin locks
Date: Tue, 30 Jun 2026 13:34:22 +0700
Message-ID: <20260630063449.503996-1-phucduc.bui@gmail.com>
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

This series converts mutex and spinlock handling in ASoC codec drivers
to use the guard() and scoped_guard() helpers.

This is part 2 of a larger 78-patch conversion series. Part 1 (24
patches) has already been posted, while this series contains the next
27 patches to keep the review manageable.

https://lore.kernel.org/all/20260617103235.449609-1-phucduc.bui@gmail.com/

The changes are purely refactoring and have no functional impact.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (27):
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

 sound/soc/codecs/da7213.c             |  37 ++----
 sound/soc/codecs/da7219.c             |  55 +++------
 sound/soc/codecs/es8316.c             |  31 +++--
 sound/soc/codecs/es8326.c             |  30 +++--
 sound/soc/codecs/es9356.c             |  29 ++---
 sound/soc/codecs/fs210x.c             |  87 +++++---------
 sound/soc/codecs/hdac_hdmi.c          | 117 +++++++++----------
 sound/soc/codecs/hdmi-codec.c         |  15 +--
 sound/soc/codecs/idt821034.c          | 121 ++++++++-----------
 sound/soc/codecs/lpass-macro-common.c |  12 +-
 sound/soc/codecs/madera.c             |  32 ++----
 sound/soc/codecs/max98095.c           |  35 +++---
 sound/soc/codecs/mt6359-accdet.c      |  13 +--
 sound/soc/codecs/pcm512x.c            |  19 +--
 sound/soc/codecs/pcm6240.c            |  25 ++--
 sound/soc/codecs/peb2466.c            |  16 +--
 sound/soc/codecs/rt5514-spi.c         |  21 ++--
 sound/soc/codecs/rt5645.c             | 160 +++++++++++++-------------
 sound/soc/codecs/rt5665.c             |  15 ++-
 sound/soc/codecs/rt5668.c             |  10 +-
 sound/soc/codecs/rt5677-spi.c         |  36 +++---
 sound/soc/codecs/rt5677.c             |  75 ++++++------
 sound/soc/codecs/rt5682-sdw.c         |  24 ++--
 sound/soc/codecs/rt5682.c             |   5 +-
 sound/soc/codecs/rt5682s.c            |  17 +--
 sound/soc/codecs/rt700-sdw.c          |  14 +--
 sound/soc/codecs/rt711-sdca-sdw.c     |  30 ++---
 sound/soc/codecs/rt711-sdca.c         |   8 +-
 sound/soc/codecs/rt711-sdw.c          |  24 ++--
 sound/soc/codecs/rt711.c              |  46 ++++----
 sound/soc/codecs/rt712-sdca-sdw.c     |  30 ++---
 sound/soc/codecs/rt712-sdca.c         |   8 +-
 sound/soc/codecs/rt721-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt721-sdca.c         |   5 +-
 sound/soc/codecs/rt722-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt722-sdca.c         |   4 +-
 36 files changed, 557 insertions(+), 707 deletions(-)

-- 
2.43.0

