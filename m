Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3235D41A57D
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 16:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870806; cv=none; b=CGTtLk2hulOX/sdlxSAhe8ZnJdLnGs7Z7RwDoLoN/0+HMdUfdVBeAaiYbf9sGd//LHP0lGe2hve5gBs6Jc+7rQ300EqjypR4jgwTZZEDa5/NCMwGQeeElJ9iXpnZlRApgin5gKg7r+lN9yT2wagGPMNBLccpgMSLfec2ioAPoMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870806; c=relaxed/simple;
	bh=Uvy6WjK33Ql5QDc+7YeTX2qUEcUUi+n12SinkXVNwt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEIdPG7v/JEkLP6DT+cWFhyVMWwLZVkl/eZnj7AUdli8Ag6HDBFKeVOFu+7bMAB4bhWd+DZt/phOVZjGjnzsxDB56sWfl4U+lo0ytwLppzMVBsb6WisNhgtC/yHnU5jIg2vXP6FKJRnP3zwzTi/1m3piiIxv8HAik+rhGCxuORY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pBO7Bsh9; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pBO7Bsh9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso41509305e9.0
        for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 09:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870802; x=1791475602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=pBO7Bsh9IFzkkBlKILArCt/rvzt86m6I/e+X7Ke77Z+YRJx/V6ye3h+zK48c5wZibF
         7AKkXlVNVskhz6S/NMqf/hQilX1fsaAKeQXpzeYKpJyICEdXqmgR3bdsUufxgNF+WaBR
         TbmMBtYBNZqHRUGIy8t5e+FsOFCV5BWrT7hzMqvOlHMqLjuSQ/4uEb0Om2UxVPw3l8Lv
         nBB9NPryXI/2mqYa9YfYk44mLD9XnTeWOxK352tbPFrIlnKouwc2qlnvlq/vcK//kmjF
         ESZIBxj/D0mmW5zis2x5/EidaW+QOrns70iUHtzyM/aoA5g1B/Db9ijtiaR+9oRSPazg
         w8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870802; x=1791475602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=GGE4xJeuyI0C/1s6UqAzj2GvOcJRJF9CxRs9MK2vL8sr8IHJUOtmAZTyOtlr6R4bDd
         RU7TJndOe17W7gnFH/fKgBQGptLMdd/Nebu3OYhpZ09paYoDJQKCFVf+cL9J1pNsrqxa
         O5uWvZgxqF3VccdWlmKxI8lQbsvtdIrSum7iMXBJ5D+MPU5cX3WvhUxh2Ubeyi8Xgcmt
         GjF24s0ewors0cukYAcU6csiH2CRVNU6dVhzz7xbOolfs4zk88gFQDfZ5zqLZd9TgGVj
         zeBXcGgWaJpWaFyZeWdnKI0mJXIGeO9iPVp7KJ2axriTsCr7I81I06QdpNkbimN6o2zy
         5GbA==
X-Gm-Message-State: AFuF++kTiOYLnd/C8iSQtD9YChfn9VdcYRu7iW3HL/HuzJphbo22XIWt
	j5Q8/Oeehf8mFjSV4ww8XsIlcsFcIf4BDTVVxZJo6zHLxvSg32xe7uC1FBJCH8TJ1cY=
X-Gm-Gg: AYBFou0wzrFjQmJZuQlAFEghglVwTox5TNoBa5iDDhc78Pv+n1rkMmDV5QBnC2BLnG1
	ELgmRp6MlLLQwjnTqA3/5AzI8SgTQRDB8j2zjaxWHOLKe0bcUxoiHt9Vn/Oys0iG62U6N95GXk9
	6jsOY6ViIaeVq96cCgZ5bJDViIpeQn/qEU81lj2uDOcC5QRGKr/W/9OE0XVOuwWZADjEuz/+i+c
	0D3QRWSJAy92PUN8GxkM/2EnrdKS5q+FbUejKbg7HTBzL9EDbKAuP1cjWuQHdLme3BblQo5BmzZ
	CxN8yNWh0U430XHDadiDH5YjrLs0zuCYmJnNkQW3WmEEacOVw5vuq7yexV0xN+LKQZrMF3w+uWV
	rBfGgryO1Nx1dfRX4MkWbV3Lo2kq/bKB2Yb3j86KBCqtswJvmD3S82WjLczsHP92zaU+RW8eilo
	P1GQxe9h5dqSYuSPjQ+lTOf2+9P/1ErkUUoMWzc6VxcmfMbk5zCf72Q2rnoME34wcm
X-Received: by 2002:a05:600c:4f88:b0:4a0:f4:1c76 with SMTP id 5b1f17b1804b1-4a0274f9c06mr2153635e9.4.1790870802378;
        Thu, 01 Oct 2026 09:06:42 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:42 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:30 +0200
Subject: [PATCH v4 5/7] ASoC: meson: aiu: add I2S Capture DAI
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-audin-v4-5-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=Uvy6WjK33Ql5QDc+7YeTX2qUEcUUi+n12SinkXVNwt4=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7Wrm1f9gaFjtvOB16V+bf14s6N/wc0k7OqqtkijLI2
 LtgmQZvRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZy9h8jw2ahV0o2Gz4cvM/J
 v39B8Rpf3e9rvk+crWh+ovLufvW84BiGf/axdec3K0zd/V9/XmbNptbWxrTC+MPrdvuuXRT61rR
 pMTMA
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

This capture support also takes advantage of the following commits that
has recently been merged:

commit df3c987ab3d7 ("ASoC: meson: aiu-encoder-i2s: reflect bs quirk in hw constraints")
commit e82159384a50 ("ASoC: meson: aiu-encoder-i2s: use the core symmetric_rate handling")

They ensure bs_quirk and rate symmetry across playback and capture streams.

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

