Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514C13D6478
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 10:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318728; cv=none; b=fkyD1R3Bq9tZIAN/eGV+n8vhjSevjUmSQkRVGM5izZacS4FmXAT5T3jvRN9hw3moX3CJ8zBN2s7FQD9idwsbWKYu7K025XVywizeEk6q0xsSBeY/2tXCN/HlYtMqjR0nrx7va7XDmAqUzuaIvdNCxgBUxWW+lQAn6uwM0VzTpjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318728; c=relaxed/simple;
	bh=fGNM8hiWzIiQkrVUGPIW+8kpmbrfO/8gvWaDINH0zhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A0m0KDj46gDVGDFGZgBl6HyHu/yCHc+1ha31eqliP23sSmtH0Q7WNlmAZHyDaz2pDxZvbRVe9cQpFbPEyAtbPwr+knALyktLMzlLY+BKVwBA3lM+D3Bds0Mkfiy5MBuBnKV1Gqq4wuMrdBxYhqAKpFhjbMtDNSllaOkNxjEus9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=B+BjgB2g; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="B+BjgB2g"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so708080f8f.1
        for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 03:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318725; x=1792923525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qXj6XPnyc7d5Q45eCB1efExYQfwF5P5O6QZsG7oZeg=;
        b=B+BjgB2giW7/1swOjhiawrvqe+p+lIHyo5BROxvQFvMK2Zjculb+0seiWsZsCQrBqC
         sVNxytRB8GVlGw3GG2kg0N5fWC4R2nGNB++RbrpJ2MLO3Sk2xAWDQwKScYQ/8xdltXnF
         XFb64RWhFLHu1QFtDQ5vljn1J3LJruEP+ki3LM/xLZkuyVKctlodx2ylw7eylJaAb7+l
         cSBtcgK0mzuW9+tJe5WChPEIiID9JubTkgaB2EO2BEPnc/9zR3Ab94ZF4A3Wsk3Alljf
         xlG3XpCZh3nhBNEXnFl/3MSuTmnmAjP+foK3mUuTC/a4vWE+IMjsOd6woKO9x9NmgcqA
         tZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318725; x=1792923525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qXj6XPnyc7d5Q45eCB1efExYQfwF5P5O6QZsG7oZeg=;
        b=cQwH2oTCiVoUzmFrt8lTYaZDKDF8VAsNck2vg4jbVeNBZsIk44Vi230UikYltC3+OX
         6OqJx5w6JSpVG9eO4yBpuFkqUEaMorPhAwLwU3kyrFLQzMNmRqo6ATtYUN9/5sJuECk0
         v1e1K/AbQL1xeHvXAt2MSagJyZjW8Jq2JCJ8B9y6MMlQRL+n743ye+oOdqfGN4hbIUS8
         izPv+g4/cWKAJvemh3Mr1ROP6JK1EPv6JGpq9aFNLQZIQSFqBNdQiiWrhfyEZbmbvEMl
         3gb6ZZApztBSA5FhGGthPHyqlBAxJvVaUxQctJtB9xxocKl25AlzmxdJFeYNeDE/HTgk
         bo2Q==
X-Gm-Message-State: AFq9FYKoU7/pAjL8shER1lCrciKiuAGM4LmNzJSffBDo5BgVd4shuUCq
	w/Qx/Omr2eoTRr0N9ixvZKv9ilygAGPlA8iyMABm8z+/2JTWb0ZC1vDP91Xk9/9jO14=
X-Gm-Gg: AYBFou3mosILzV4PPHHO/AiG6OOG/O4nnH15iSr2weH3tQjjs7KZH+/2Y05cuDV1GmA
	MT9c68ZGLM2f4TWhz9qZp8KQnuT3NU8D3j2JWXOoFmflVzprgY9JhlUT7C5Bti0GgDNMbq5w7PQ
	fW29D02ym65ooE3qB9Wa7KgWLIwfJ76C2zKifvtm7Hp3sfBSJvHaCxCVxk84YyQ/wG1o8vZYTzJ
	O4BgSdATeTKk/XmYjEvK88qmqoytjkQSPpxgXipopLv+nNGgcpSp+IlGuFQkrjZlpVijmT8kIR5
	Ff7oBHfvvBM1G4YJOX+9nrsFx5tFbjzC9JsRaWaffZ7/Kb0//jL7KnJAUcDFQqhYRt2KHP569fr
	yWmBIqt4fRVBIpDyHfdbnUtcfC14hr3AlRX4G3ERYZCqNjEPvlR/1R5GrnA2qxj4EbMFIqujpiF
	Jw1LzGldykfYraVeho1gBRNqbmDcOTQfxqZPo0CCTICaj1BskD+ABJa65zBt/uBuodmn0D
X-Received: by 2002:adf:f8cb:0:b0:48a:eeef:b4a7 with SMTP id ffacd0b85a97d-48e07fa40camr6081304f8f.48.1792318725277;
        Sun, 18 Oct 2026 03:18:45 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:44 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:18:02 +0200
Subject: [PATCH v5 5/7] ASoC: meson: aiu: add I2S Capture DAI
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-audin-v5-5-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=fGNM8hiWzIiQkrVUGPIW+8kpmbrfO/8gvWaDINH0zhU=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vyW17Gfsjqy4bPUv23K+y0TruzSyPMN/cPRHPJpH
 he3cuP3jlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEzkdzDD/3RrjuULFd6EWv53
 Tlg6c2rKc/ew30zM51b+Xq6xncnhIRsjw7nwrhuaopp80cpyRxwWhjfulVuze+urLyzTddOzDAz
 auAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Add capture stream to CPU_I2S_ENCODER making it able to handle both
playback and capture streams. Captured data is formatted from
"audin-formatter-i2s" widget, buffered from "audin-fifo" into an internal
FIFO and then bulk transmitted into RAM when the FIFO is full.

As for the naming of the stream "I2S Encoder" is kept as base following
the same pattern used for the playback stream and with the goal to minimize
changes.

Supported format for capture is currently limited to S16_LE because it's
the only one that has been tested. According to the manual also S24_LE
should be supported, but this is kept as follow-up.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 535fbf7c1639..14d0e20a4bd6 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -153,6 +153,13 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = AIU_FORMATS,
 		},
+		.capture = {
+			.stream_name = "I2S Encoder Capture",
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
 		.ops = &aiu_encoder_i2s_dai_ops,
 		.symmetric_rate = 1,
 	},

-- 
2.47.3

