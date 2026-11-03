Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691628;
	b=RCjxUJmw2lx5VWg3mChRxl+PmnL6TU/YqkIDb420YeBX8QHE+rwCw7Gnf3Z6wigp0vOL
	 Lezzuk9NgUq4qTI0XWzJA2H/KI1PDHNf+6oxU39zH7RjgZ+RX6PTH31g2DzohqSTBUrB5
	 BNxMwCmEqtG6LG4Ry5j8c/tXlDSsJ7KM/ICoUcKujj1fY1TFt/4Tin8bd9hZ6vUfQkc2r
	 JbfTcFSntreSAJqvWYjdIQx1s+G/gnBw0V6lscuXLUusgPorzqloYqxeyiSiy0CLXEHwh
	 b6WUUmI6jdFNwyCbkuJRv05xCw+OX7CGLDQkXBbCUFLuViBx7vmzOea1rKxjxB0r9XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=;
	b=fE1yte4YuQu0BaXCmjOguvmtYSCJykVRO6Pi1PG5Z1QMPpFBrS0aAEDqFiyyV4K+zw2C
	 hAUSDDMZbnRy9NpAcl1p15RN9P2hX3LcZJc8J3xcN02shGlakOp9kvPOf7g5kC+xHZXqK
	 aTNfUkAcdo9MbwitJtxWChKZIceE7ERB2gTzLQkC8oO+fEuqK3qoNm00zPpAY6gutA7Cr
	 vzuGZIkCZrivO+tzvXwzrafpUO2bJ3xoQ0kt3v/4zO7X7HqsR2odRofsjqr+xppmqYLRU
	 VJe35krQ6T3Rd61EYbj8wyqR3nKKVXPklRmz0t0+cGSghI8+da/hI9FsS+3M6n/xuAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XeOkfA/f";
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC8F606A329
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BC8F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XeOkfA/f
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso1381204a12.3
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691627; x=1794296427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=;
        b=XeOkfA/fAqBzSShYzfpOx39UkrurJiIO01aK5E0axVU09Uw0vtTuHat0FCX5ROsS6q
         fC61WHrFE8JCGkUpvA4ha+nId/wpUuoWt5M33bt+2cIqx8MrR8jjnBIuuDjgg25wjmTU
         aKJY6MBupUMNKWywpotET5/x7QQJgMddPY0iXL4+2paricA5YZLpnpi1PjLBkSmO/UlD
         hOqrhbaR7uxCSrTZw83e7TZ3Vyp1vfBR+6RBRGx1f90++1z5g4xe7GxG9PhDttohWgyn
         XtjYWmWscF2Cdz+NZXpGe/v0MkgLri9UVnD9/hXoxh0mkTN7kuygZnB/4FuVILfsfdPO
         MR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691627; x=1794296427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=;
        b=ZmcNWCe4Se09g2BRtHpdn8A7plEjaxluO9Cefn0JP/nGQ9o+FpvMzuxhzFW6S1s9uF
         FJlYzAg0u8OF+hpx1kuS99S3czyTupTqnHN8vSK3ewwyOcsrMoPY3SsJ5wrrvVnaTBlU
         yfVU50gM+KVAsuir52bVYy8AoVoIz7EOF4xxES5S3qKPWbfcaaOzIjcBCLaTCSw0bFfa
         /0L/zX57fScR4rCfw5ka/pbcKiiL5dHDfyxYqhDWtcFlAnp/DfsI8fRyRzi0RXUp+ct+
         cl5jYddPh39Mz0/KLNKua5oRNbMuOGWo1a2YW8YZ0vqCtZSnjEgqv7MnHD2kZISPQbWO
         MXBw==
X-Forwarded-Encrypted: i=1; AKwUvByIaG8CwhIeZXn8ysARjglf+NGWk7HhcUhsJl6CnbgTytCBXBXv/HrivlYIdWPT5KeEyne5zgk2QY1/gw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9DyYsSoCMsSROv93wQPKbitLAgS1souS2S0ITtBWwKTfrknPRo
	SdadqVJ4D61VIhUlHvbT3oIJwDQPpsuD9pwOzixvJmTooUYmLl92SpCq
X-Gm-Gg: AYBFou1zRZWTjGGGgxuR5A89zDxaI4nBVFg7V8SXb3cO0JWjI9rRE6VO8k/KlZNqxGH
	chf6ZIQnowuyqzv+4YknI7qtucKxEdjYvJlkZHzhoXtiId5/JU1zBFihKR2VMsyTRwBzoxIVf2a
	uV0TsVdFnmFrmYf+RUrndcj4LQ1q5b/YaIBOF/7HlSKWE1NrSFfEtgewicSjgBTE617Tbb4G+GE
	iESCXOhZQqspJNwlIXpl8DwJL9ItJlTpDmWB9ScOnzdh/yZD/ayxAhMoWPpNEddulZWfQO1e/ZN
	enyu4HUodemjAkgQeAG6iDNlc/JVGqpz99jDn/ZVlzd45HW1olO/Gxi98S2Ow/OqpSTq5xQNjzV
	xo6+aqrx9166FeuFWCCg+Yzp9zdaAy0CNlEJ6jw3txjhRZL5mpT+NhNMJ825vHD9IVjhrDug9xo
	+Mtx4C3SC9JrR4UFbPBptem+s64Dq9x/tTZFCF1EnXrqIiPFMOmbt0AwWuD1mNKJv7qEWnEXvFl
	P0+9EEKac5mQk9tA0G0R8t707ZsloNtsiGVy01KzmfWXbVbplfA7S+WIIYvNwVgGIu/AdiwnuUj
	pjPv9m1X4Dv3qqAq85T+FWH7yHT1M6YU3wDsermERlh3Mo9PBJxVTCOUHLDFoEODVQQRBZr228e
	G2S0pGlODwc3tc91LOZNPrnAtmcdig84EuJtG8rHKvMhJI5ZdU4FWptRZT/BVxvhHZBIWR8MSgx
	sSqC4=
X-Received: by 2002:a17:90b:35c6:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3ae89536bdbmr10927084a91.4.1793691627024;
        Mon, 02 Nov 2026 23:40:27 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:50 +1000
Subject: [PATCH v4 02/22] ASoC: dt-bindings: cs42l42: Allow referenced
 dai-common properties
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-2-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1199;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ryTg7qu92xHmjo1HEk78arPtD12ewJvnTCmnNMpKI2c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+GpzjrzeRvYWVum1gj5HNzyuvK1hVdiudFLu8N0
 n3S1ebdMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOoLSxgZrl/hNrrKf2TVhzo7z237FA8e3jH3Nf/qtR/St39hfNBQ0sHwV3TNTE5
 f7x852/mjXWfWXk/xiHl+5AhnQ2rTYwn9Iv0OLgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

We may need to define both #sound-dai-cells and sound-name-prefix on some
machines where this codec is part of a simple DAI. Allow this by refrencing
dai-common.yaml and allowing its properties to be used.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index ab4c7d22dc0e..4ac0af34c464 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 description:
   The CS42L42 is a low-power audio codec designed for portable applications.
   It provides a high-dynamic range, stereo DAC for audio playback and a mono
@@ -193,7 +196,7 @@ required:
   - VL-supply
   - VA-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.56.0

