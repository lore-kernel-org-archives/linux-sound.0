Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238902;
	b=0BurANPKatEAV3JFXuJTTLtWNWelDGhRnGszcP1bIxoNcw/qU5wxX5mFHwaOeRzPq2NY
	 Zj28L8sGLKkoCexY0Gj8wcQzUMSatFPBTzi+VUmI8u4zWJOgiGUTaoUPHSepYdR6H4YJA
	 N4m6sbbrDHPIyPWqhPh+J3Ixt0JELmOIBmIN3UcNfoQOW7Fp98DSZOn6hpIHA8TppwOEZ
	 vvbNjogzkuEtJTXqlpOg4DzQcxAv431E2wq4xnyk3t+bgTtnkk8l/T0dXrPOAcy1dRYkX
	 rRRrOGrSvY4C+vtRUvbm5rqng8POAPMsvFXCr9RfKEKewa6MT5JD+YRRJy79nnXMdJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=585xw9jBGIafN94+2hL8PTvVRoZk2mBN5Pq+TZee7eI=;
	b=KzSGy3i5hyLbcpXeros5C3bmi3gqlCsx7TgTbO1XhuRIBZ5NkkYi6k9Ef5AIfBtmqJSx
	 tW45GdT1HyepXWaQpbX6wVakbJTfrWdZ/FPZE9RyjFfaK8oTVJeQGQJYMnQ9FX4TuonY8
	 yXfQcbJoJ/ebEkWzpVP/+kzabJp9eqnhLzpHe+0OIqMGD+6yqcJTfPntfW7wHBXryBqgT
	 O3F7fj2VM26I/qg6oWvD95XqfdsrEpbVyvmaRzWOIxzFpvfsneJBt+lunjOoPfHWhOTg4
	 b2TX8zKUTVL83PWBY0Gg594aQVnI+6H/wEHVYoLWFBwOIv3TlA5/wlpeSHZEDDwlwBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZqfXKPnH;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D237606A338
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 15:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D237606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZqfXKPnH
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214af2076so7452045e9.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 07:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238901; x=1794843701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=585xw9jBGIafN94+2hL8PTvVRoZk2mBN5Pq+TZee7eI=;
        b=ZqfXKPnHKxubWeZmDq5uGQCPUXWAz4pz9eD7KK2RrGmiaerhH/4u6/jHe//xdFrf4F
         3B79tpi+logTiRZuzmhLaqWQxrPHo0r40sc5bFZUjPpqPhInf9CHv+vOwowIQuhwrabh
         U7eCZ5cbc2DKkazmHWslXL/OtZ41v0cQBo1pLEtJ3pw6HRlNDWawkAKih16KY+Wu2RT0
         O/sJlD2tE+PUW3YHd5tXdvYQVGfWhMRWHETBzZIonmo5Ozjwm0dbly+GJ8R2TCUjlZf9
         DXwy1CUss0x6/0CJw4noQMKh3a2tFEVH2pUi2/gnZvKqWiGTZyhb/65dv0RxM0zbvdXR
         inNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238901; x=1794843701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=585xw9jBGIafN94+2hL8PTvVRoZk2mBN5Pq+TZee7eI=;
        b=PZoDKzIyeDijJfY1D2NbTWnLmbS4GOzkgz8V6SLLTU7FGw39+R2cE0k4Cr4jba5Or5
         EVy/1zD2lrQyQzMwytw86orEAiEtnKImzlALuqTN4FexnMH/COy6x753cD33qaL0bcVn
         oF7d3FRDOcnNhVGx3c3mPzklQ2WEyuTauV8K5122JbeaaS7j93MLoit0Wv8MBefgOS/J
         gc4Bu7bf6ui9nn/dWTO/tIjxjNSj03I31GoEoDTmo3xJkDiy7jd8RDWq61jHi9G3N6G2
         pU8d7U19R6TjiedqHkWUHTBD2o65Uws89c587Lmph9B8HfnfdzatrHPuu8J6LtIN/Wx2
         8mWg==
X-Forwarded-Encrypted: i=1; AL+hErELNKKwYTjyHZP2ixM5vGK2v2vVJlbIqVy/BwO6sv7SW3MhfPxmYm8AethIRAaOFVxdeMw3LO/Q+4wzzA==@vger.kernel.org
X-Gm-Message-State: APuU4Z84ywM/K07pdAWwCw+cKNVjcQrxNjKchu2YZPN2U1TgoeY55Nrq
	xNmIVx8QO8bj0Wcb4DysE90BrH2Ctii3spxOwMMsDqLsZmrejn5UWDwq
X-Gm-Gg: AYBFou0OnTLsfnR2y46VOMIGILKDzXzmjExHANyJZn8m/ArX+QyoFlBJVGqozh08dmm
	hlKrnmldz0l8VOhpBy0ooXwP5UGI7Gz8XxeqoIwtSF5Sh4hHQ4Ze2jVm9ugP4nHB2go3pyWwS+Z
	aF4n+C17UorCeiHBqA0TH5j4cUFNB8/4nbPabWrXHstcsYnNUTcNLPoWE3B0yfMbS33hnFf7uOi
	SaEYBNgYaTtVrR1Me/TwPlLgptqGJxP5OvfZ3P93alVpVkKT/+pD1JLjYfmOEt4JaIOp2iAvTtF
	z3CfjfjQAThs4fketV6ZYNgLDU+NOV+CfwQhsubIam3zHVjJyod5R4gNUbnhPampqIEbM8eHJkF
	IvWfWKN/szmroU/EAIMajpjq6LUJG5kISnwwF1oYwUc3J08a++ppi5PFs8aaEmHwzqa2Y4oyGc+
	hT+7ajcai70zqtLnhSqJIaZ9LmxOOgoxSDpao1VR6nBbkQevRZjcjbCqUWifcFZ+xUxVALwcBIs
	ZFa6AnVlF4qKotuEfFuzRylk0XPKIl82AomEwmY6JpSWVxMTFTP/Kz0V9M9uHIz1AJIr2w1Oyp/
	JcOyL18ty7YrfwKnZeHDe85tTDl0HPNyajT+/0gLJ2HC0CulXKD8XcT/gmEfJQvPfuibgA3nZqB
	Pzg==
X-Received: by 2002:a05:600c:4e92:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4b94d76c213mr90091485e9.3.1794238900743;
        Mon, 09 Nov 2026 07:41:40 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:40 -0800 (PST)
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
	Jude Gyimah <jude.gyimah87@gmail.com>,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v2 2/4] ASoC: meson: axg-pdm: select REGMAP_MMIO
Date: Mon,  9 Nov 2026 16:41:18 +0100
Message-ID: <20261109154120.592392-3-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154120.592392-1-jude.gyimah87@gmail.com>
References: <20261109154120.592392-1-jude.gyimah87@gmail.com>
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

Several stanzas in the same file already select REGMAP_MMIO,
SND_MESON_G12A_TOACODEC among them.  However, SND_MESON_AXG_PDM does not.

axg-pdm calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-pdm.c:(.text+0xc4): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_PDM unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_PDM=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 2cfc123eea74 ("ASoC: meson: add axg pdm input")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d0f60f8af2b5..4b06a9e7c72a 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -92,6 +92,7 @@ config SND_MESON_AXG_SPDIFIN
 
 config SND_MESON_AXG_PDM
 	tristate "Amlogic AXG PDM Input Support"
+	select REGMAP_MMIO
 	imply SND_SOC_DMIC
 	imply COMMON_CLK_AXG_AUDIO
 	help
-- 
2.43.0

