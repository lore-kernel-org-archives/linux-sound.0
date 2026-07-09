Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D717A373C1E
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 04:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783573184; cv=none; b=Ed5EKeZOn/q7smtYZl2WKB8/PMWY9w6yQMvQag78Fa1HysginmUbX+ZfQCe6stoIInO+gE/5Xk2sS2WUJo1JWv0OiXaV0RKdlN2fkqsZEpnJtQ5tRwLPlWCqFNt2ZYUDwAWNGGk1BpIk2jbzWJ1ft1ZuqVxPOS6wcs4qcdYNLg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783573184; c=relaxed/simple;
	bh=bm4pLjR5uVYsBmyvPE4korFQr943J4oSyR7yMM28Cjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tm0CZVW9mcgLzmwl6NrIX/klCTDZgkr1YUb4sdK4UlnKrWzyVRhu9YTKKmT9Mrk0bIX1x22t2EV1rPfVNvbigZfm4dnpf6SJCT6pSy+JqF5FuHaQDAxSxc/vFJ5wmBqb1mvthfeeRoLOuxvGZyBxK4mFr+/SXY9iU454fyoisvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDxCS5le; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDxCS5le"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3811074a8c5so1245962a91.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 21:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783573181; x=1784177981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ad0P2VMz9bf8HA6F8SGWlOPHl2k6oftAxCYlJLG1Vz4=;
        b=ZDxCS5le/OO1swa32wt6dDM9g/zMdm5hHwV7L0ij19N27DlkWYVgwk1phPWixxvZxN
         CxVSIutAuJcmvhgi3a5Ih+rEJ8HVshZlVD3qCPrS7VS6bPt8/YxYJmstgXxDcUJ8rbwM
         oEkMpVPh2KcpPcDjF9UHaadlT8DGP3EQvA2Hil1evMGqoAUYgm27TQ16g6EPhAGKfcXk
         VqIx0HUDog0uWTHx4jiIkz08yip087mrXTu0FVB+VYMhsG3clYnMHJWYr2cUciXZU7V6
         Qjfa47K3f5coQGaId4f7EYrgC11ynDjj3gvB+ijFdk/rI0laL7W/W3kzoMclmd0zoX8i
         haBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783573181; x=1784177981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ad0P2VMz9bf8HA6F8SGWlOPHl2k6oftAxCYlJLG1Vz4=;
        b=DTlshQSUIBBUQVvd+bHX7f+uA2/5DySZnShQHaZitfXpq387aJ2T3jmM6E+zHu777B
         pH85LtJ2Sdai/iawvy8mwglWNeAgTZhAc1v4Q89Y0zb1mJ+of+ksl/viLct9BVBZZpwS
         NzvGlGpdu7G3Q+2lFZv+Pfiu3m6B9Ta8LUWRzobeqhNAKrJkJUu3g7f2zsROuV9oR+H7
         TBVVb9lDiQdIi8Nvymx85E7YnST0tuVS85q7mxpIyQdWLXH6GINf6F06Ti6yXYT0n+c0
         V4eB399KEcOWfRmo+dp+ycDiGRaP8Yw8ILlyg+WNB7NR5WbM8oXKqAloWSuIuZaxG+3U
         E84Q==
X-Forwarded-Encrypted: i=1; AHgh+RrJVDHxNJt/l7u1uzN1Ll/shtwUHVUlHWsbTmRr9qEUyJ771AtALtmCIQg//VN9uRYaWwi/T90G2kz4kA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj2SlSgRLKC+cD10PS/nu7EriqRt5ZMnMKh4+iWY9ZjPySJ+Vn
	GrbfYWKsq80wYwzONhO21w/vJOeKmRaLK9G7JdIi5jFfVPjRGv+MZjlA
X-Gm-Gg: AfdE7cllPSkYatFPvqoxxZO6bEa4UtmuSjqYrGR7gJCD1djQPcjuXT/jZ3oryh+xaB/
	/Uf5GXtttwb0udbXDWUpTlH4vELpum4VPzTzbkO6/rHM5OziFQjdFFuDcZlcIhqYxtXuVrU+enc
	6TloMObkV40KgNneDWCqVZKhgtQtnwARwuTm7b7rJO9afEpzwoxHsn8IT287R8Cw/s5pTxb8xRs
	Xj6XSjOiz6QksT75o9LsuMNHVWFVlm+cKearCyNI8FM/cnSnQlKTQUlRrkRw9gavYPIPzR/douj
	+TdkE8URMpRdk/BGDFjOQj/oiIesKbEVpRPJ490EwrNg7kNoIZkOrHZW3ogy0yLUBWyz1FISGV+
	RE3G4/ZzVhmzfDVFYWZUSbxAkvWDzknz012EN61rKmqZLnbR5gXGs4MCQeaqtK3QwXEBMGBUyMt
	IdUbSYZRHWfnBLZNvDPEnjpJl64MeSe9o//k/0rnYlN3PjR0AWC6WryQcnYw==
X-Received: by 2002:a17:90b:258f:b0:380:15fa:c5b2 with SMTP id 98e67ed59e1d1-3894043e537mr5070234a91.18.1783573180995;
        Wed, 08 Jul 2026 21:59:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b47esm490481a91.3.2026.07.08.21.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:59:40 -0700 (PDT)
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
Subject: [PATCH v3 00/27] ASoC: codecs: Use guard() for mutex & spin locks - part 2
Date: Thu,  9 Jul 2026 11:58:35 +0700
Message-ID: <20260709045902.498848-1-phucduc.bui@gmail.com>
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

Changes in v3:
 - Rebased onto the latest broonie/for-next.

Changes in v2: 
 - Add Reviewed-by tags from Charles and Herve.
 - Address Herve's review comments.

Link v2: 
https://lore.kernel.org/all/20260708141734.578926-1-phucduc.bui@gmail.com/
Link v1 : 
https://lore.kernel.org/all/20260630063449.503996-1-phucduc.bui@gmail.com/


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
 sound/soc/codecs/da7219.c             |  62 +++-------
 sound/soc/codecs/es8316.c             |  31 +++--
 sound/soc/codecs/es8326.c             |  30 +++--
 sound/soc/codecs/es9356.c             |  29 ++---
 sound/soc/codecs/fs210x.c             |  89 +++++---------
 sound/soc/codecs/hdac_hdmi.c          | 117 +++++++++----------
 sound/soc/codecs/hdmi-codec.c         |  15 +--
 sound/soc/codecs/idt821034.c          | 144 +++++++++--------------
 sound/soc/codecs/lpass-macro-common.c |  12 +-
 sound/soc/codecs/madera.c             |  39 +++----
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
 sound/soc/codecs/rt711-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt711-sdca.c         |   5 +-
 sound/soc/codecs/rt711-sdw.c          |  24 ++--
 sound/soc/codecs/rt711.c              |  50 ++++----
 sound/soc/codecs/rt712-sdca-sdw.c     |  30 ++---
 sound/soc/codecs/rt712-sdca.c         |   5 +-
 sound/soc/codecs/rt721-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt721-sdca.c         |   5 +-
 sound/soc/codecs/rt722-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt722-sdca.c         |   4 +-
 36 files changed, 569 insertions(+), 731 deletions(-)

-- 
2.43.0

