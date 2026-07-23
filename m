Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4210338F656
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782439; cv=none; b=Uxy9dxhwWNJco1fvUdFCgr1QGPnbsTQXDjeJyP1f+wkugdn7mk1yFzVQMDxrjG5JIN4HhwsIEwi9T9L4qlV+DJOXAVVlyQUuKsJMO4sixsKVz9F5hu4dmr/toVISBqsw2tlewBdvcQv6gSZ9ESVYRKdsZgAnNYVBsknp0fptS4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782439; c=relaxed/simple;
	bh=1m7GJ8YWaP7wefU+zhqO4O/9UTZF7BSXndpbKxTVTpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JKhB7AGEXPKgJ2hWV+XxqyxXZvZE19o+bLwm6c6noGDObTMAs3Sg15TNDDATKQs89fdilid8iQnH+rjtmHlZdjA/FhItRa4ln8/G9+xWcbIr1y+To6hzAykhjvExM+zQlDZ+3nM6eTxb4XTciE7/whTuuh52pf/DCpCmZcpZhF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mppCFj+f; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mppCFj+f"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ccf2360620so2107295ad.3
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782424; x=1785387224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HPmSshlx0VhFlDIeKTOyyoSslyu9w/lmyi2JYXnbRm0=;
        b=mppCFj+f5LZwWHlPXluwcDuWJfE8mLfCIQzIOqq6lh+UHHqHs7PE6CqLON1JGb4c57
         fxbXr/r+yNWjjJhlYbX1T2jInSK3Bj3gC2E4ztfGMdN0DDH9PqP3/afm5DyGR+vfXA0d
         hIvhl2lLO5GcdYJTrKmNBQS4ZDv1pHxgn84pq/D8oJgG4e/Uoej7e21fPQ2F8fVd4BD2
         cgvIDWXcfcayu4kLwnW5Rqu24P1IitsLTN2MaIDnT4K3776h9vGh8UkLnL4dsPT75CBF
         oBRMhcRG+wUZM/QRB6Zx0PHRko9Np8BTRJTEOWHiON9Pxtw6Pgjt/xEWkBlfDAaZHEnJ
         OKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782424; x=1785387224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HPmSshlx0VhFlDIeKTOyyoSslyu9w/lmyi2JYXnbRm0=;
        b=OR/74/iQhyNlFMN5XfxK8N+LHOy8mnymRMWPf/CK3ddXqT8D2Um9NBCZjEscylbroO
         DgDefbp78X0ZY7O6yXZrw9J8QAmDzH49pYlQ9EFRy1P8wOQmfogInf4SsiSaI0Vd9h9B
         6afnulmrHr140Sr8G3uGw+cWDfpecaWBaaqNihtO9GVUkHxS2r89PubJwByy/oBjgOcG
         uU14WiPn2G2m66Kzh5WkiMyO1tBMbztnA8f2l2zQ309MRHd+B2LW5jYh1/jgEPeDN/+n
         ANx7qQq978xm9+RM4I/NJ22TE8iFbd9yednBk1x/E0BCfThon2paojiNhGBiXRww4Osn
         Z6hA==
X-Forwarded-Encrypted: i=1; AHgh+RqBmmvQeSjXHc5VxrIqWN+lyAzwPWFgXQt6sRcve7XhEdiszyODjhyeyifaED8qAag/4xaLsjdJevGSvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEz1oy/tonDRSWkh5hTjBs1x/bgLiTaOqj/p8kcc1iz4WiO7V9
	HBmHb1ugdm8PYscMg6emvx67dCMYQt1+tIZWwHC7PTXIte0cfVHocBZQ
X-Gm-Gg: AR+sD12LNvYkktAnOdxMv9H0qeOPzJ9vOaNuRw0t86g7M19h84BVGcXtvTE+Ikvc51R
	nShKxFFSHfstxvPpGIksFfCQpJ1A8ZsFrdnVrA9ui6R00k8Xym0pyOBqv39Np/Qo/5Ub2q/CRnI
	Kr4GxaUrn9OZa73vEUuiu4d24ujGexyJX7eFHWHWzCPCms6POQ57FRUOZv5BqudzZur68RTx9Kd
	itDBZZ+ZtzuXaEAQHN5WmolBuTw5zEC1oUx6TBJTod+MrhhPM/iNI6NTzrRih40lyX20M48DYdL
	RkZMZaMhE5u4Vyq3F18V0Q9/Gz3irYmYDtmp4WCzAs8Bx40mbOLdn6addnIBqGH+BzukclBCQJt
	h0s1Jco3+g/zv4TYH18I7vPIqfazk7P3UMkA8ItyOfK8Zuc+rG0OIRg6X2h6sFtVVwNcHhwmZkW
	bDLjehsvzXTWgEjIIp70SDczFQs8Rm8bdMbklf9Hjx/I645as=
X-Received: by 2002:a17:903:1246:b0:2ca:4cfd:a6df with SMTP id d9443c01a7336-2cfa6f821aamr20406655ad.43.1784782423932;
        Wed, 22 Jul 2026 21:53:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:53:43 -0700 (PDT)
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
Subject: [PATCH 00/26] ASoC: codecs: Use guard() for mutex & spin locks - part 3
Date: Thu, 23 Jul 2026 11:53:01 +0700
Message-ID: <20260723045327.28260-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm_adsp.c            |  77 ++++----------
 sound/soc/codecs/wsa883x.c            |  11 +-
 sound/soc/codecs/wsa884x.c            |  10 +-
 29 files changed, 368 insertions(+), 575 deletions(-)

-- 
2.43.0

