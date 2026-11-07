Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070549;
	b=DVcK1mh9Ew2wO30oCqQy3zL0VQLhbr42oiJ8rTIzLLRr+nJFhRfhh/emRCskrduE7bFs
	 RQVwjMXALCpebNKalwcIJt/fzgjtTR4pOEjnj9cJmSSnCnqsmbZkoRRwhiSkDEp7UorXv
	 BCgnVMPrTj3AAoKRc3T+Xpma9PKMumquqw+wgxrYYUIjsZQaqOpGJgJpefkpP34gDSc4e
	 GHIKLpR/2+4reo9zBDVftVPe+ZTRu0+0BXzGrsC0SMvkcKySvQkTWp/46w8gSenjT/e3m
	 pklJMvlCzeBkk3V69yQsvybRbkIv3xTjw+eg4VMeIl3+tFPRsP2kWzf8BkBH57kZk3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pu+Rl+gMqP9If0Ub7sYkKuMz0VatAGisa2iKuQxjj6U=;
	b=iMS18FMEwIdefHtcsu0bzuoDD5aHE2F+RZhXUiFMaXL1TMOVF0EILiDADjD1k73sb3j2
	 Ga6EXBrmU/sXkoWAAD35aCKtTzjp91cWxgRxMN3YpeQOhCcrOUy44rGVDxl01InVsDAsA
	 3S7FfTH/6d/vT7PBuiSVCyYar46xw3n3RIZ7zCYdifx+vuA3tgDA6etHLESblpLYdgJ9e
	 x5b8JlfxCipurwdu3XdJc0d2PUAKNkt2ZDtlCr56OEidUtrqXnz0B3vPz8RmWah+8xEpK
	 Z+loDRpfEfqdkGN2JaD00DyqDLuFanbfvrhuheuMS5oyZzBYv5vkcBhTEuWiTrcGJOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="c/uEp2hQ";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A2D606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16A2D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c/uEp2hQ
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e47347279so931463f8f.1
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 08:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070547; x=1794675347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pu+Rl+gMqP9If0Ub7sYkKuMz0VatAGisa2iKuQxjj6U=;
        b=c/uEp2hQ5+h1kDjotfTazZWstUhzS7e6HSsa+UHnqcoOOLBTbrl/vru19/bg9xVXqD
         XIMfqUvA9vMstBgEKbq1bx20WSF4nYSAQFtnOFlyHMTPzinUhwNIuOEoxNL2lw5NNwmF
         FDVUf1tH7enMnOdnsJWaQQC0wm0Nx1xUq6ZGbCs8SiafigHagHLQ4iQrPbifC8jtvCm9
         QRzOb2thrB5Dm5yKDL99TwEvweldMkiENsrlFfIOdct6PugKqiEJ6gP5h++m6Hv1TFBA
         x5SrX1+eKYiICgonozlQUmFyJ4fr4P2A2SeokQKGBQkVU6LvLDXfqz/K8WRL20+SwWcn
         Hs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070547; x=1794675347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pu+Rl+gMqP9If0Ub7sYkKuMz0VatAGisa2iKuQxjj6U=;
        b=WjJb6lawUq3X2jqXOwyR1We0k+fta1cmYCVmcMPKycpB13TuymbzWtyALPmg9Zw37Q
         X8N3Ol3+y1pPQdRm+IuHblh6kEiBP2jz7OWk1gOJ2OIDJY0ovRPH7OT6vBDKvZKjapre
         p3KxUpwuXrFqqgL8gN5Yaq+N57dJO4g2rlV+Kfly4jihjWXtqGdHhud5oyLH7E69K0VJ
         z2TZUpaBjJjyY6yZ6BdWtzlwMO4H2OIpSRVEeZ8w8GPieIcO0dxpXr5hSggNbQ4mBKAK
         0Dm6CMjKBEfZOTuJDTq1g1yGHooRPj0ZD87Q3noOmfILAI/GacVfcCchlzwM+vJcWASp
         cNuQ==
X-Forwarded-Encrypted: i=1; AL+hErF0e5mk6GI0y4/VhUVIUJZWS+A9+DxMymfPqlUs8ANaWwPz31GKdpL0AOeJa8OPTB9rpXL7tLl/e0S7+g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/BS6OwdctXZaQuzh+HheCCk/WBuYaSCTBufTbErSQF5vT1D+xg
	zw1vPzyGD3m+LRbBXXUyYLTD8+JeDycEpZW5F5mWUQiaBxTYph6KJgVp
X-Gm-Gg: AYBFou0Cq4pDmQFQwEPnvKMQRcuEx+wcjgPIMQSC91yX1l1cN66eYMdDL1cEb+iBm5w
	y1RAlCphh7Qc/wnvlKfLTvLa3bbw1Y6uNwaT0ca0p1eK37dcTFsXv8oZ1K/90uNIFN1C+i68dqQ
	vKki5hGA1YfEn5eXygdO+6NTfcBFIRMFpU7OKF9WXkydCTVfejHSYFw1oisZO4M3gUYnyZMyw4e
	jZAr/8e8tR5WYxekv9UqQHxznlFKvdYuKMNiOJt6SJi0Yp/8R3JIZwpAMeGoZMOC+h4+ruM/fan
	EfFTwkNW4Em0H2wOIpcKKA7jcAagO+isBPKtzjTYES6w9oawVuTyBClrgk/Tay6yPTgmH/TR8wP
	GRXGpvreL0ddmNj7t2CliaK3gtiUrq45KHn00QyDfnSj/BSWu/zv104jZo7blwa/kchw7cq2RRF
	Qycd7v/unMKPTPGqTehRbAzk1p6vo1yODVz+Ie0RPtx0M3Om2HYzap6VYNAf9gveAO2YAtdQOe/
	Ur6EeizA9oOqUpdARt9SNOZPb9VmPXitZGVVgOABYS+1fItHE5m7Iuiak6W6bQz6rOx9juJpfD2
	WkaX0Uzh8/V8/fDDEqYVLb8S3vPidcl9aw==
X-Received: by 2002:a05:6000:40de:b0:490:a481:7ac8 with SMTP id ffacd0b85a97d-4927ec0bb02mr11650221f8f.29.1794070547458;
        Sat, 07 Nov 2026 08:55:47 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:47 -0800 (PST)
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
Subject: [PATCH 2/4] ASoC: meson: axg-pdm: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 17:55:25 +0100
Message-ID: <20261107165527.576383-3-jude.gyimah87@gmail.com>
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

Several stanzas in the same file already select REGMAP_MMIO,
SND_MESON_G12A_TOACODEC among them.  These three do not.

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

