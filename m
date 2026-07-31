Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CBE33F59C
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467389; cv=none; b=EbS4EthweY+TWu0uUEeAbrXfCADEoSjef9f93S1NHygvTaIwnX//UfAyuS8Bch4eUwjTUyBtPVctPXRN4eqaW+10SkfoZDvtD+HgN7aGlJ3iGTDc1LP+QG2wdKqv51dVTTfyLunDanpKWzUu3KGh5WsgTD7jaDkEUMRD5F2Crvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467389; c=relaxed/simple;
	bh=vpN2A9O4qvdLlonbqA/XuQfb1LuR+j9NwgCpSS8HwG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lp8NnrVz5bxCTQJhNQFKvjJ6H2ye4+VwDFPjjocUUXdWzKabUTRzSXXAgk4WUC7cMYfJPhFoIy1KHc+zXJgmeTW8IO5JsCDCitcrQ+IIkVVZ4y/FTMYddK2gN1JOuV7YENdeg6bUsOJcM+BtNZhKrxlM2rU/D+DJSi8nFiQIZM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWjErBa0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWjErBa0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cacb8416a1so4997325ad.1
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467387; x=1786072187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VhQaA520jqTXeiP2LZVSUznr51jV47iUF83rucdWFWI=;
        b=hWjErBa0cN0hNYrMwQCy9hSOiJrf3aeplVAehNb3EJxyJrHF+imX7U3IdxgwOh0rbb
         XrqH4HLRxH6hQZweIRjAw6hTrtBHPVAQdAkDTR2ESc3yXU6b/FjQG/nuRPMp4wmi8NxU
         LqsUxNwDEmVDp/316JR6ha+5s46s616SQfQvMG1qSBViHZPvDh3/npbim7b2qyrZa3cs
         6JPpiVzCE4MAbas1v4o1xmijpnS5CLN8m4zAsdbQNZ8hvb8ASNVTUzwUR1WPWEubgR8c
         s/KYklSMtj8lRwlozC2TjfkJPeVS+8263bPseNvrUnJn7ajfg+RLNrioAIirZOQBeRJ1
         U2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467387; x=1786072187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhQaA520jqTXeiP2LZVSUznr51jV47iUF83rucdWFWI=;
        b=P8wHKxVJNgyZTdjJytz8Ey/xTK6g4VofGiK6icFgzF0B4vrEIDNznIzFwM1IrLjQ0e
         s4ab7gLQmsLHIr3eWxEewKJxnkb0+sWbwK0jWr+5EZd+IOjg1JbbIkv9bKe7/4T65LGA
         7x/h7tuq2+glv1F8/eLDqHUE4DUqKk647kcZk7IFnOcQa/VQefwft2TnivUZJd5zDTDY
         lvaM4F/P5SiPlhcoHbPvOT9Qk6cMdrYUrbMHGF3z4QXthNUtGwKowcUdcMnEL2nqlVz3
         /1fAm2D/W6Xcav9c6GRN0Cs2gGB5omXWDdPCSAWTIIg9+4zLbHqZgmZ/hB1rwUI32Nq4
         MJKg==
X-Forwarded-Encrypted: i=1; AHgh+RqpXTj/ViyWn1C7WOLdijqE04pIpS1kKgJYoFd3L/7DPrNyG2mWo+5fs411nrGnVdCV5r+7f7QDUYPM/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVUnsKdGLZEVzRIpHKf4UNYi4Kbf8Ll5Jtmnp9BgNLkRFF3z6S
	g96hnIsfTE5DIlUddvLxYUcNv3Nu3I8x+kcIZ2/R3MG/OvBUJIJhKW30mudlXA==
X-Gm-Gg: AR+sD1173sL5S6WWhqrPiR8Q1VTqcrDHZ5UcmDJqU8J89ywq4gh37nFvSFza/aRpbZh
	TpEhT5j513zu4xoksH1rgDWwCTK7Q0FidZ9SVibD712SYunSrhpNTe/GFsrnm+gLCj4gRkT8DRQ
	yhzQrMmGKX9lSvRq0hbDEDzGIDsbwJl/EDPfmlR46OHly/Cecd9Sf/Xra4xBsktTgZCC8P+VU6i
	WaQlMDfTOrJqES2NC4z7Qebw5f4wVKvgQ1A/O63ZTau1Vx2t5AyHBBqxNOc3qIHVe7g+cCZvKv1
	xF85jBDFLUUod3tmj0ivcauGB46A01/q5J0m6YxdITPRk79nLtlERr4aa7kKnyEoi1ytIquoDXM
	ToUhmHfD8aGnpX6wN52A4ZdBtOeIS2CZfnTbH+8CXLlyrIg1kUAKmzZPkFwiXSb9G1MDKaUcS/i
	Qq0LC7jw1/zrgA51YlSe0rtenAvmePH8Hwuh6Mb5zov3AoF+BZsuLjB2QdHoExCJlPeS5+dthBf
	vEYpjF3P69AukwPgsPi5uRnLyDDPKSukkJU22+AVchb76xzBZalz93GPTXJ1+CNfbeBKP2NCalr
	ap8o
X-Received: by 2002:a17:903:1a43:b0:2ce:e747:c5d4 with SMTP id d9443c01a7336-2d046edfb62mr4291015ad.46.1785467387450;
        Thu, 30 Jul 2026 20:09:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:09:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 00/26] ASoC: codecs: Use guard() for mutex & spin locks - part 3
Date: Fri, 31 Jul 2026 10:06:22 +0700
Message-ID: <20260731030648.8706-1-phucduc.bui@gmail.com>
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

This series is the final part of the cleanup to convert ASoC codec
drivers to use the guard() and scoped_guard() helpers for mutex and
spinlock handling.

Compile-tested only.

Changes in v3:
 - Remove redundant comments per Cezary Rojewski's review.
 - Add Reviewed-by tag from Richard Fitzgerald.
Changes in v2:
 - Add Reviewed-by tag from Richard Fitzgerald.
 - Add the missing `guard(mutex)` that was inadvertently omitted.

Best regards,
Phuc

bui duc phuc (26):
  ASoC: codecs: sigmadsp: Use guard() for mutex locks
  ASoC: codecs: sta350: Use guard() for mutex locks
  ASoC: codecs: sta32x: Use guard() for mutex locks
  ASoC: codecs: tas2781: Use guard() for mutex locks
  ASoC: codecs: tas2783: Use guard() for mutex locks
  ASoC: codecs: tas5805m: Use guard() for mutex locks
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

 sound/soc/codecs/sigmadsp.c           |  17 ++--
 sound/soc/codecs/sta32x.c             |  21 ++--
 sound/soc/codecs/sta350.c             |  20 ++--
 sound/soc/codecs/tas2781-comlib-i2c.c |   5 +-
 sound/soc/codecs/tas2781-i2c.c        |  33 +++---
 sound/soc/codecs/tas2783-sdw.c        |  60 ++++++-----
 sound/soc/codecs/tas5805m.c           |  21 ++--
 sound/soc/codecs/tlv320dac33.c        |  87 +++++++---------
 sound/soc/codecs/tscs42xx.c           |  61 ++++-------
 sound/soc/codecs/tscs454.c            | 107 ++++++++------------
 sound/soc/codecs/twl6040.c            |   5 +-
 sound/soc/codecs/wcd-mbhc-v2.c        | 140 ++++++++++++--------------
 sound/soc/codecs/wcd934x.c            |  42 +++-----
 sound/soc/codecs/wcd937x.c            |  25 ++---
 sound/soc/codecs/wcd938x.c            |  22 ++--
 sound/soc/codecs/wcd939x.c            |  20 ++--
 sound/soc/codecs/wm0010.c             |  28 ++----
 sound/soc/codecs/wm2000.c             |  28 ++----
 sound/soc/codecs/wm5102.c             |  23 ++---
 sound/soc/codecs/wm8731.c             |   9 +-
 sound/soc/codecs/wm8903.c             |   9 +-
 sound/soc/codecs/wm8958-dsp2.c        |  10 +-
 sound/soc/codecs/wm8962.c             |  13 +--
 sound/soc/codecs/wm8994.c             |  30 ++----
 sound/soc/codecs/wm9712.c             |   5 +-
 sound/soc/codecs/wm9713.c             |   5 +-
 sound/soc/codecs/wm_adsp.c            |  77 +++++---------
 sound/soc/codecs/wsa883x.c            |  11 +-
 sound/soc/codecs/wsa884x.c            |  10 +-
 29 files changed, 369 insertions(+), 575 deletions(-)

-- 
2.43.0

