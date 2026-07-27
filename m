Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D54A3EFFC4
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145276; cv=none; b=gi9Yto2wOrPTFCxXzgHtn/DR68OujFaWwWsSpSmsoWGae3YtEjyV624UTBplXnVLbst66Z/+AlBUyGNy+Bw7eGETmWDGLFVuTN2l+gk89yvqb37XFD7YoukGN6/pPPi9pktD79TjPbr1BlHvJf+GbpP6lMS+boPAIZQ4z/wlQ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145276; c=relaxed/simple;
	bh=P82t4hqH9bxCjztX8C/u6zRR4k6YPsmf6rKxZvU5M/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JhWqOiXo7TkZ6jdckOuVdSl7bJGSGhwSXWxDVcg+XtC56LX4YjDBrMOVaImsbiUEQevBps0kRtYeb8kftDfqo1BrD3KJRT6jt3Uv1aKfnJzt1qG/eAeLGFEbDGRRg+Q9jbsVgnMzWpWPPgscJ0gKNYWwNFjABpGC7YH7kGlSmmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYitDvK3; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYitDvK3"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca2fad0ae38so1742736a12.3
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145275; x=1785750075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=usBMdmKc7yvdA1I7rGndYQ8td9V+pDiaypFkdoj2mWY=;
        b=YYitDvK35HbJzvJz3IHsxcCwEsR8h+3XtvFilExc8D4ir91wyyPPosPSmC8gaGeMnx
         actlywdvmH4XtVa2x/OVpfPiTXosRgtdECj9YUtpyUSrVIWOPD1tKr/bqErRfZuHxZtT
         BUitIVEJNjsmOmuwSeJ9TIqIf4SDvJ7Lr4saNxo9NbUgSJXhKOFbDb0wzRaflcxVVLhq
         JGkdyj4uUE6YoUcGhDg+wbJ2c5OVWplVTQq+VQj3f5RX7WD9b+VM19EvcZW3OeczxqMw
         utEFrfBtHWts1lzOmvty9c0a9rBGw6dXTaWgeiP8L5Gn9OWUoKj4H+kz9qaOHHPkKqEw
         TusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145275; x=1785750075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usBMdmKc7yvdA1I7rGndYQ8td9V+pDiaypFkdoj2mWY=;
        b=sGglMEQaWu4W5KyAbrIrbUODozI0CxOuYnIj+5SHUDTHtP74CvxTrdTbVpbHKvYZh/
         R4dfDgypp+geiAfEj8rVZhpPAAgnFZI3nKC4rfxpkWK4BNDKZ4E0B6k4Ca+sSlmtTXWO
         qOaZvJjgixpIWJvnjUldsXCYIgt8YHR63XZ+WUiYJD7SslwWAP3QjoXzvCqQS1LOqJba
         BYQUjmU/o52ZLkcIHuDuC0J4Irp1zC0xb2lh+2CnS/Kp54dSqf+Jh20RSzxsmMG2KCMk
         Mminfe6Y2WFmM1HUQ2bxe4J1QGGXCAsq4zeuu64N/u/ySua+cv69C4UMdCT2KmKhiDsN
         Qu3A==
X-Forwarded-Encrypted: i=1; AHgh+RrvNVy6VB692z0a4u0eO/cxuqzhni7MZGPQhxGShzMGN+ehaG0s2OdKlKU1aalAdOeuJA4Ug5j87h8hTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7k3O8QhO0f80ZCvqTNUaRROow9+jC+GcOvghLcYL5BfXIZxKH
	mMVD/wMTQUmFg+uXZznCJruQA4iIyNOaXyR3sqIrqBysDlEaat1Pq9gS
X-Gm-Gg: AR+sD13iuzw+7YBZaUXffq4/Lui7UcfAar9Fgd4xCw4fahHm8cIXzZ6ulKNYQy3Ek/T
	xLP+gWaJY/wIRxfrHNzY9MOtIt/AP+K8pf7GuZXuOpypCdgUIyaiaGcHIzs4mLVf7+Rccq6IhDW
	0OUwZ3P6LDImunRWpCkuOutduauIj79VGl7GoUl6JHzsLCLEIcM7b3JCarxK53vPRuIy1MY9rAS
	SVFwf2pRdw4o1rO7qsNh5CbdSKpIuFyn0ay6p4yrtThBLTZrpVJsAsaDne9jaF7nL+p5efygymo
	Rk5Xe6NsaT6W3dU1teoPjyhODBVRUiwNG34hwcIyISsyyps/i3lcg43/HZdJQqNptyGkbx4Isbs
	lNYzONYZ54cR6zOjqQMpu1eleuxGU8gh9aVacjDstg4oXVNwQcaqrJ8HCo/5/+9ht0YwoIfFdPy
	cl6LN79NkgJ9jXQ25GxyQ8OpGB6vDPnZ5kdeiDULunD1inTobH4pEDcTavZFlFoLEhsR8qL+S1H
	PPSeGU/+ohW1V0oORGU7w==
X-Received: by 2002:a05:6a21:a49:b0:3bf:9c93:ac44 with SMTP id adf61e73a8af0-3c67dc48cd8mr6935875637.19.1785145274582;
        Mon, 27 Jul 2026 02:41:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:41:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>
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
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 00/26] ASoC: codecs: Use guard() for mutex & spin locks - part 3
Date: Mon, 27 Jul 2026 16:40:20 +0700
Message-ID: <20260727094046.23001-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tas2781-i2c.c        |  32 +++---
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
 29 files changed, 369 insertions(+), 574 deletions(-)

-- 
2.43.0

