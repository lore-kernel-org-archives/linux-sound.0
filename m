Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238902;
	b=19VkynAcMwWCOgAJ8aGSUhEsNe6ZzqcZRbBDtw+aN3JLK+nkE55M52WaRCAr6zFuQpt+
	 Z0esST5ljy4HuMhOzRPu4HKr2+Ao7FK+EP4RlWuOF7N08kkb8DrcsniWUpRi6PrzigI/p
	 kCrVEskifzQ5HYdgSi1ddR6X4dbq4ay9QcEzWH+Q3PeQttfp8LpO5hWgrHJ2snlC0oTgh
	 VCrrcu7gWwGtrK+22kfJbaoq7OwmwHcxgFCey9/d1TkPvLZJfaw26/ygOpLuJmApMOgRF
	 mSjc/ZTxjYW7zcJQAKtObeYEf+3t73gohqmeXPljqhgBbhHWvRlglkAF7UptJLXqCAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gmgl4U92sUaeq/fSzBRONwmIvK9ejAxa0Sr1yFZjy/8=;
	b=djffmWdmjE13Nn5m252LtK3tY8fEEO5C9P1Amv86DS8RH8mgzYXk9CwxuSvl5fO9UumD
	 p8EfLxHENyEs30P9681iEHaiU94M8CTPdGu43clPAmv8peTtjMUjhrKjZQdllGLQfdlhG
	 nB8vqoQpP3XIMoWb8GKekXPRe7EmoLZ4RZ0jaB75TZPVpPU08jllplydyIzMmPcgo1zMo
	 PXanFVVePDe5NEcBPqMn4gmWVHvzNnmDyMQi+XwJTWMEBvBSJUhlLe+c5PlKPRbPAJvJn
	 D5YNYreUXTmLrn4fSktAocFHL89HQBQEDW8kJV9w83S+fWaSvqFMmt+F6pX2bDNQsVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJzKxBt2;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAF1606A334
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 15:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFAF1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJzKxBt2
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a210470b49so7639545e9.2
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 07:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238900; x=1794843700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gmgl4U92sUaeq/fSzBRONwmIvK9ejAxa0Sr1yFZjy/8=;
        b=dJzKxBt2EpLvZoLXHahlVk4GK3hLlY73ohpXBwbX8Q6uDBOFpsYwtmXUz09yPtqkDq
         dF5toolMezqGdq3JSaBnBEVPbD8R5gwxMgFczOTzKiRupwEFwd66kKbvwvUwKkuoC0PG
         gNIrlDJpPGqr9/9X/RpNnS9eyo585Vao1l8CmNHk1H5CbBaSYlnwvNhZg2DknaBPHVx2
         MTcxtVH8IgYiK1MBXbdAsgbTo5DLwWqUX1DfFWxgOUb8T1wLSARFrGUZvhaodQjfuptp
         M4Pr1yJEgo966psLFJwyKrfSOqBQyqDNeqcUVp9xdo6BLmTi+2peR2zD8RM2Omd+zPeZ
         BuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238900; x=1794843700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gmgl4U92sUaeq/fSzBRONwmIvK9ejAxa0Sr1yFZjy/8=;
        b=osJMp4xIkZRKuAiwv7cxexF/dwJ1lokNLP1g4DNZgwz1VztipIg4tqaogxp20xn3rI
         IbLe3YLIXk+KUPwRr6n+rgKkuOS4gYii2PD7M9xzx6nuKKb1hBiyZWOIQahhAbOEgIki
         9oCxRjLJ9zAdghj6xsBst2RKQRXFhHDaxol5yDjMsYCWUuCGgas42R6C4cextefKOl/m
         qdfcG7NheO7Q2Ongi2OjNjBYpbmi8PG1wa4pViOjBXyiqITLnmkGHaZsj3/t1VB+/FK+
         pR6lsGAbiNiA1nP24E+6LEyhyTEErhW/o3hH7SS4DUuYis4FuQUz6ScwOpZi1oehSO6A
         +FyQ==
X-Forwarded-Encrypted: i=1; AL+hErGqdayTnOYfOcnPa1pZ5/fpXKlk0F0pW6ECL+cCTEBeTh1CwLSdz6ifdnzIIhEHxa3vIMXhZOjZqrOYlw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+HuSbfqzHfzQzugPZgTTLIv98XVG2bwYg8w3D0ZBGmWV+Q3cL/
	QFIaWjL0CaNtIMI3/N6h6ltV1b4OIduVHFCr+Ry423kv04jRAIBAiQ+c
X-Gm-Gg: AYBFou2JiaCa0yABEFne1AcRfs6zHqfLgumnXsZe/PgPeZorAZyjE+6pGOlc5IGLC/Z
	bOp6tGt9CxcxOWzIwlFuzdBvNUaMhas0v/WUa+Xy/o4/eVY7rEO1wdnhhafg/EzYAmQh9KNW8Fc
	Osmkr5j4QqVRR0Tpr1Mwwz/q/M9uGhitw1CXjnNBUhBkNCZxO2R2RJ34CTyvinnQrRX/YdIFN5M
	Gru3mGuBWCGK3bFkAa58qL9ayloT237hafFr3exR2t+Kp4x/Q1hz3ilhs4Li6oQ320oDnQz2rz7
	AnK+2/2r4oKgmAP1ZwXs/Or63ph+cXhFlYffu1A9cJJI6M8o5987qerlrJK3OdKdPhdx2+bU6wa
	L9TgLmLCKmouC36KYOWaL5Si3C4ph2VTM4sQc53P6V+5qEBZkKNpbLd1lVcsqRga15/w3q+wkLM
	Laep6HGEDZBJY0Ck3nnMk7ourmvtmwDemomcXdRJgjim7oPNY5eeyPS9UcmOYtY+KY1cpz38UIf
	TEaPoMiW+I/54Yo7GXqfTCjq+sJY8gS4agdE3RidAYVECnz1TvmCYyNEZrYFyF/Bj5CrMm0VuXF
	UxFefucgauD6xqzvzJ97ptrzDHw7wDhsnGAkRyifY7ZXD5vDuL9xwtteALyrghA=
X-Received: by 2002:a05:600c:3b87:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4b963c6d630mr91396875e9.20.1794238899925;
        Mon, 09 Nov 2026 07:41:39 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:39 -0800 (PST)
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
Subject: [PATCH v2 1/4] ASoC: meson: aiu: select REGMAP_MMIO
Date: Mon,  9 Nov 2026 16:41:17 +0100
Message-ID: <20261109154120.592392-2-jude.gyimah87@gmail.com>
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
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Valerio Setti <vsetti@baylibre.com>
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

