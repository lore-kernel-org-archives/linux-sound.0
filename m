Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464274;
	b=4MT4OQPcppAe+1aHXuRYLcZKF89qoNb0cNRPmAif14felO3UZJOtmEqE0e6oEFrAwuPq
	 CDm2VjDidWfO6Ht80vOiiyDckQruO+SBR1cGSg1hxRQatTg9nzJfmRX+tqVaiwltK3MAu
	 4PLZuCuV4OZXDyfpgzhPwnZe1q0yLqrKROBfxPDunMbDrKDVGUNF1YBncJrF/J1dkjmP/
	 R76s8s/tS9Ll3YZTy9FGz0eNKSZ1GZgKwwnBghQylDyanRwpsV8vlY5JiK0esURcLswYz
	 vkbKmqI4ZDn90uLA9B0DzuF5bPBsdnPf9Y9LwlR3ipCgugjZSfw8uAx7ScKKnLaOblQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hdMQOaidcysmkd0hNo7kkHB1KCKjR78WhA/YmNa8gos=;
	b=JmargWCoveWZiifmsopdfZ2u61lv/RmsgmQovudYdHgXUYdTWra41rNApjKsJm6QibWx
	 Nn+F8NghNva47IbT9joeD6rSu0jLTpF4jAJ4MzGhKwkACNnLgoBLyJQyh61CA3eiGvAzq
	 MChtu/paEChFkjhD4nxTPjFYI1H3hl/iWIHk0LWNLkRQiyitRUITqVudOwXb9LYtl7JXN
	 mKu5+roT4GEz7kRwP/VQ6UYPy174bXnhifkH4mMs/vtZ9yhfTwFos41hoGT7GDK/yNVmK
	 QXJ0T/R+MM3QZmsDxBzEV3fqVX9Nv9R8Eszwh28mSkLkkj7C4/IhIXk3Zht8Gq5I4OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VFdVVovd;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44230606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44230606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VFdVVovd
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f3c89594cso301484985a.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464273; x=1795069073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdMQOaidcysmkd0hNo7kkHB1KCKjR78WhA/YmNa8gos=;
        b=VFdVVovd26XR8Hw7PPlmCXnU3GapQuadR3pxFhYsSDVJZUM6Ls0lNvxrLi4QuVzmcS
         xE/2hTKFLm8mmW4bXWacpVR8wC0oyQr6xsXCZTR/YPWsxEfJ9xZub4+EoMjEYY8CA4qW
         N3n71cUlDYiWrxav4xa34MoFoyjlrDLinlYNQGo8TrLDWyeU2nmxGzl3N/9B82P+WwvJ
         omF+imwo7SWeb/3Xd94sUrjWS+CC7ER5meuxOy+WkqW5JwjfKexSN0ZphLsKmkcEWa6U
         pNpUuM2CFrkai7ra+3CI+XH17Xa8ilMbr9GcMuHm3KDDNkjR6Cup6X54JPquoclnjsEz
         r+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464273; x=1795069073;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hdMQOaidcysmkd0hNo7kkHB1KCKjR78WhA/YmNa8gos=;
        b=IgmDCt6FoH4ZL/EC/ATBJBbSPLosMHtuExDK+F9UoZYNv5wOTBup3eCs9dh+dJhz/S
         kbQLli8WvKzG5GstU1noH3rVo4B7/BclfCq/G7zLeysotqOx56h9kpTBxoXZQj1ROzhv
         jNE4vXAi0kRA9RmmrUsLotCqdeldrRv5ZXmVIKl5V2mV0gc8/cGB6NWKSkQxnC8nNMm1
         wN/GRojOifD1nZ21H8sIHDgd9xNjpM+jMCdKRg05N1DW53UySbEtHsjEOtZkRxH+d113
         syTvshwhsmsD7fWu/v/oqjsYGU/bzTJeg2AgczUo80RAx9/IvtnhsCck7Z5FifNF2SP0
         bGDA==
X-Forwarded-Encrypted: i=1; AL+hErFVH+ntXKxS4wQu3iIw9eiElOTbgtn+nDplWmOkRFaiTUDfAza3LrkNTY9EJiHhexKS4E3M9tO1JFSQhg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/IXEmT2Ur4z/Md+s0GZoDQZ0jOnXDXyUGWGW7AB6rxG7ugegeS
	jUz34dknZcUJqYR+CW0k/1Ru+l6Gsre0JIawA0hj9eCmcdNmI0ojiAg=
X-Gm-Gg: AYBFou1CY/51F6NCGttwz4BiNacPvkB0r5D4lezD8n1Af2PNvRCt0gFhcwbyfQAp02Z
	qYOACOT3yneRIRq5Z20KxAmMlbUdaVFDVqmumytUzQsSfewXguijt4EumzbDtCfSrLcTnNkmM5w
	ZwkTtSyz6W8uY0wV/3yDDniUY/RC1dvbdBoXoCnC1JK3feB4ZbF0o1PoGb+OIfg929vl0eHEdr4
	lykxkUs5k8lAGMGoW3SLCE+oBB/7H3nMXXjomhLyj0a/zVh0zvVgbk6xxnV1Jy8x4RJLQz6kXsU
	9gJu4rb3OQCbSaAcYu0irPdOC6cdwAiCsJglTCTDzcpmwJx+q9+kBwcgLQ3t/TGSOXGgjCDL9Aa
	Kz8O8/+bNGNJ8heBgTD/QbauzqHi2X/8T397FIhNztW1z/QBThSa9iZUgtiaW8nxXO4dR/YG21a
	Noq9Vw3te/OacPJj+zfFVFdNtDwIsVYAE8VRWPRByiVS7PgKIOBgL4tdNMexjmQoVSvp3B9XERb
	qZR1JnFGeTJ3WKeXc88v0CnP3dg1yQStLfcwWusZzkSpICi4a9MAWpq0U0sJJM3jfVDGlLjD9sh
	AnNrEV/L97ju4Y96abunrSjjF3lduetKgc7fZIZoFksE97XdpwMwNBeFp1H6+1M9abrHl7WHIDp
	KLt3cAUFAILPd6a7Eucj0mGnR9T6xcL8qUm8XvftU0p2/B4/ERrlnsRyDysvLaS6EG8USpZqGNV
	sl5kz8y0d3OxiqYn4m/U7zEv/kCahSbKbP
X-Received: by 2002:a05:620a:688b:b0:947:a247:6afb with SMTP id af79cd13be357-947afd68101mr819573185a.13.1794464273217;
        Wed, 11 Nov 2026 22:17:53 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.17.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:17:52 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Subject: [PATCH v2 0/5] ASoC: mediatek: fix AFE IRQ registration and removal ordering
Date: Thu, 12 Nov 2026 01:17:44 -0500
Message-ID: <20261112011708-afe-v2-0-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes IRQ lifetime ordering in the MT8186, MT8188, MT8189,
MT8195 and MT8196 AFE drivers.

Request each IRQ after regmap initialization so it is freed before
the regmap. Where remove() shuts down the AFE, free the IRQ first.
Also balance MT8186's IRQ wake setting.

Found by a static analysis tool under development.
Not tested on hardware.

Changes in v2:
- Rebased onto broonie/sound for-next (cde5523c75f1).
- 1-3: removed redundant IRQ request error logs and clarified changelogs.
- 4-5: added MT8195 and MT8188.

Link to v1: https://lore.kernel.org/r/20261011222234.2098904-1-mhun512@gmail.com

Myeonghun Pak (5):
  ASoC: mediatek: mt8186: Keep the AFE IRQ within its resource lifetime
  ASoC: mediatek: mt8189: Keep the AFE IRQ within its resource lifetime
  ASoC: mediatek: mt8196: Keep the AFE IRQ within its resource lifetime
  ASoC: mediatek: mt8195: Keep the AFE IRQ within its resource lifetime
  ASoC: mediatek: mt8188: Keep the AFE IRQ within its resource lifetime

 sound/soc/mediatek/mt8186/mt8186-afe-common.h |  1 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 42 +++++++++++++------
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    | 10 ++---
 sound/soc/mediatek/mt8189/mt8189-afe-common.h |  1 +
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c    | 16 ++++---
 sound/soc/mediatek/mt8195/mt8195-afe-common.h |  1 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 16 ++++---
 sound/soc/mediatek/mt8196/mt8196-afe-common.h |  1 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    | 16 ++++---
 9 files changed, 70 insertions(+), 34 deletions(-)


base-commit: cde5523c75f1320a55ac1d55a717ccbb566557f0
-- 
2.43.0

