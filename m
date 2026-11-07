Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070548;
	b=B3GODwcbdpFmfe3vQDe+ZzNzFCi6C1FCd7jqCCKZseBhx/6aK6CRpnJ38Xl8TK7L04yq
	 qDtIxJioXMAU05MVzJX5VRDM9sGjETWU0RQXZAKkuCoVEnO85GSsI/8aS6StXpie9xpDj
	 AgPLxz5CrjxcVv28fYQaNJ4F8ReWPCrmRGCqhpKoVCUVUpP/8FYHuWieNrvNYapL892UA
	 BeVEh2OJdXyNglYz8Yge2E1iwL0Ainwtwc7syEvc3gYDIJtwIxNFgTLaa8ki5pnQrLoIB
	 oaHcTe5Ktd00xyQ2Es/V2qYO6HuwAr+QbKcZmxfJN3SJuZvoWIgWDEAXA0tGPYWzG4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OG4qIIBetQYpr4S2IC2PulaSdrMca/uGch1jgN/saD8=;
	b=HxR+DLAGdG9UXJrHCwAdPdJOrlwRIUqdu9IL1XgBa5XIeoMzsWer29oPak3Di75oJdzc
	 HdrZsjv/aJIaKM9uMikC85dNXfxi8THArDtKrvddA+qe52KhP3jkqZMQfNRF9kmGunVq+
	 n8vRJUSeqdqYeqFuBSSN76WubBxYME2cPXxEFhfl1nxJrsJsZXy7h607ym5tMM19EQ8AZ
	 TPgrNYWSoo0DQGiNrFRpiKNMth40o+FqN8hfw0u4hbUeFrFgMmvftoiUJMSqpi+XWAdY/
	 kL1ivkHj6hkvOi4Cw1QnBBBnBl+486C4FaTv89e6EgOVGbV6HNN3jsTymxXa6gez6Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rE3DXTmh;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB4C606A331
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EB4C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rE3DXTmh
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4922523d1afso913351f8f.0
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 08:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070546; x=1794675346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OG4qIIBetQYpr4S2IC2PulaSdrMca/uGch1jgN/saD8=;
        b=rE3DXTmhPTPw/gfysJn7Cj09+/1mpvHzrqpCoJ5aqonIRSad0yAn3WGBRv+UyLfi/1
         1KPAKRBpHHvqVHReNO334wfvPpJ4lkgY9UtBWcXJPozSovHBdLTGqR2T4f2ICqIncbp4
         KaYxaF0Z++e1H2NyM052bsRS3S6J4P96SXZwRsE168qmDkw+v3zDJ6nepAlkil7CPP48
         z8bQLMpeaMC452zqecUJm8zK+hpWwiDEKeZIsHxqb+hYzf4WNP6L+SScWvSGw+AhPoEI
         tOctqxBdm9W/ZYe7JwaRQ+BrkEWoZPqVcOe/Ld1Cl9TEVAcfEZpKadLC4EXdI9HUlss1
         MN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070546; x=1794675346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OG4qIIBetQYpr4S2IC2PulaSdrMca/uGch1jgN/saD8=;
        b=pNvd6qNwL4Yj0MrJTCZYUbYaHfeonA+lzh7Y6yfBbqCcuIXQM51EDGR3s3mTrCdZ+k
         FRkOpODG9gzoRPea9wOYa/DQZFymuq2qTnCoONwWEOzuEFCHb+iNF4hjxpkGYVtD9OKP
         yd7Z5VqYd3Z2kmiakXgYqN0Mwyg5/AWAYZeyaWQmkxQV7mAf1CMBuEFGIKX+F3FYuV8p
         bC4rSF/5ZFHX9ixId58sMB3dRACw7aMfX4JmubV2T9+zOQqqfmiRDlMOew8h6FigOC3P
         3iDWGmw6UFdCisfASzEN/Qurz10YCjBrS2V8uZVAmx/2iqJKx5Dm7PzT18CVVf+6Lxsk
         Pzgw==
X-Forwarded-Encrypted: i=1; AL+hErHSXrXWtwAQ07pRot8yyw8nFGTotoe3outcaI07YPYbweE8EZpaCB/DLoOtz9Q6QBa4XhLLEDSGCyn9hw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9MeqjH8D3BnBi4EF8bPDQnqiBzqqdvH44x1EylZWvpefeCUZme
	FpiBIruA48Dc1AIeJ++EiSI3mdZVgvVpPVlGcR11rPQPdzdIJu0zZZyi
X-Gm-Gg: AYBFou2nKUI74mrV3p+Vpwm4oxDzPdM93IiC+atWZndXTiyYOn2fXpaXGy0vQ5b8bAt
	lYW/qYTIMkr1jP9FexOw4m5iZlgqar6kLI6mo/ZAPWLI7WJvMsBhz1rqmZyDBi8n6MaGvGHDa7C
	b09U9ZdZWFvZhY5aFJINecWHJkGAdsI1p44V4jocIt4si2rAt7t15SqphgwrZzFuSrhV4+Es1bM
	rPm5yHOzLFrNWYQ7nIn29vcLp8cQfomzsCman2ZmPwk+1xXouAHDFqXkqZk2F4mHACEA5uDw+pd
	vONpwIgX7c1Ve3lc215DNOEdGpUzIPa1lNJphMCCJ/94bBUtFIdaKhWfY63COHin/lizCBiY4d4
	7xjTR8TBQ1YipzCvHVU/faq9q83h7axw71IhJCWy3ag6Zsa9q/ZGooZrUu0134yB0CurVWO+D7J
	d0aOL7tv30xkWqxOOMbboQ4w30Km2kCNQHeiGXA/ye5++Gl5LpbH/PQR07xm0tAiLfC9BXjnUrv
	6+KBN24C2193LEt6FEkXWgcfojG+VqhW3kFY/EgdWZ/zG6RPh10XXpbSV35ap8xNbgouIsqQe3e
	vPohFrjqBgRUB6Pg29JCH66ZnXUuFa/gkQ==
X-Received: by 2002:a05:6000:470e:b0:488:8ab9:f74c with SMTP id ffacd0b85a97d-492733d1ca2mr11716934f8f.3.1794070546480;
        Sat, 07 Nov 2026 08:55:46 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:45 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: jbrunet@baylibre.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 1/4] ASoC: meson: aiu: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 17:55:24 +0100
Message-ID: <20261107165527.576383-2-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gx-formatter.o is part of snd-soc-meson-aiu:

  sound/soc/meson/Makefile:7: snd-soc-meson-aiu-y += gx-formatter.o

so SND_MESON_AIU is the option that decides where its call lands,
and the error below names gx-formatter.c rather than aiu.c.

aiu calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  gx-formatter.c:(.text+0x74): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave SND_MESON_AIU
unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AIU=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d9a730994a2a..d0f60f8af2b5 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -4,6 +4,7 @@ menu "Amlogic"
 
 config SND_MESON_AIU
 	tristate "Amlogic AIU"
+	select REGMAP_MMIO
 	select SND_MESON_CODEC_GLUE
 	select SND_PCM_IEC958
 	imply SND_SOC_MESON_T9015
-- 
2.43.0

