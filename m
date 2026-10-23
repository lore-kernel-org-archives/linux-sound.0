Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768816;
	b=AIOgNfP4Z46Ka/JicXyvT+yV0ArhCgMoEs6Xfmg/cBMft169Z3i7mrHgH7x+45p5WjAd
	 vqtynvFU+fc2yOl9QAyGhZOuKq984U5tvICKnOYSh/qn2IciXis8peRvj7+qPyX6XAOYQ
	 BQ60Qe6EAllKYhGfNTQJNowLRxSPD6O5KCuvQvDQpHcvUq66QXZV6inRyfnRV47G27wVV
	 r955fyhyLe4alU+g+4Bdc6hNpuMG+94xaGaM0BBgA5bJ8it/vQWhO0ldHP+4Z80FHXRvR
	 wply+ddcxBdCpf3gRLPv30qsON97J93DTd3ribxrgKf8vwfjYQP1xbbT76+kElicBsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=47E23RRn1IGlLUPJGucX0ruY7TugyQuZlKKLhnfTxX4=;
	b=kLdPXtRANQs0m7AMdKV5IQffrGBvjYcbzW7naAKhKkh8sCVM8lGWoOi3Km6IFHlr8Amd
	 wKJ2fujYr6g1ywu7J/wrGD9a2X2KONuY6YAQuetjemZBuZMZg8Yt9uzF8WFZj2bzN5WTW
	 tNFa+tGyAWM0ll/jtOuKgVx+YZ6mzPYoRDIGYaWmaekbxt0rk3KFg7n/KHkI9OcpZ/xzy
	 JrUzchBitF0dca9T81AtBzq3pv0nUB/uqJH1O6TkthSN4kjOo10YWJ6wOjN5l+2m5xG2E
	 ASHppjD/Ho517DHjtd2u1Y1ZA3xsTbtDecYXSfUG4QXouLSoHZSHzHrDA73kCmYJEnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=r6+ihWkU;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4323D606A320
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 15:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4323D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=r6+ihWkU
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso654880f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 08:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792768815; x=1793373615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47E23RRn1IGlLUPJGucX0ruY7TugyQuZlKKLhnfTxX4=;
        b=r6+ihWkU1itlUw7klTH+2cDv5mn98ZkucpqKSssZ8bTaixwa6b1yCQ4WNTasA6JE+J
         flYWgXLvdGJLAW7EsN0XImhSFD6v/cdjpUlKkv7ocWh5//6zcSvUQQwwqNW1tLoP3xUU
         HwKmKY+Kp6dMocMBKH3n0a64r0ijiTUCGGCazkifLq0gD0oUEDMApxFwZTZnoRcAdy++
         QoX0Jj7fjfhewdk/s22z+XIXdJiJPy1ndmifxv9owvf9pwre1Ba068sQgILOFSroRsai
         JXc3F+TPgOOhMvUNHBtnFFf5kf0KRGxX4oggL36/BFH+z16WgJBvWS+gBZbLidtvYh92
         3MaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768815; x=1793373615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=47E23RRn1IGlLUPJGucX0ruY7TugyQuZlKKLhnfTxX4=;
        b=FgdIh1GkQXH9wsZgTKFJNcqTWF3xm7TlJg89/3O14RD6x5tL0tx0o9FWSnilE7siK1
         B4zUHMS5ws+hP6rXMXiavjKAuCZm1lzyoNGLPElKqm8i8B+Tm3g3nGZ6H528A16+au6T
         uXPd1nN3GcvpnVvHCimgYhJn0N8C8gfGXZEr0rakhAImxTRRKeyK1BSVsrfpNncvGrxs
         3UUqMA/YvL19qvk6PWMI1h4eyLDm/PvHc9xvshFXNZQeBZmyBtNwxNVWo1/uM512bo5S
         UG8ijeLtv6kEsQkcYQjpHMUlny3+0DPkBL5EqqBhaGU8IZqh9KaCnJRS17Kp/gptsr2T
         CKAw==
X-Forwarded-Encrypted: i=1; AKwUvBzJU6fKFbONIX5H+/YSZiRya+akDO5EzS0062QcjVo0Mi00C+UjH+O/3p7CShcmzzffkvjReImtpBpIlA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLgxR046dBAD6LyEoGTJb5TTB8Fg7v5DLrP7sjTKB92nrFJJrt/
	AEukEwF+5ex+qbKs83nnHIah5s9gvp91SUXElIPmFKwXFpvb0eUsKRzH1uGIpNe3oiU=
X-Gm-Gg: AYBFou1I2FsqulsTNQ3MDTPgKGfPUGFb43QAd4opACBI2N8XpqHwmZsB3RKtufCrx6q
	gaZoBZ2yoiFei62/3tI6a5mihPbtnOOdhPR6qakHQwY7+NdV7oRA2IOwrs25hEEcF6E/d3PMrrO
	MEfrMFM2lgcYyspPpWtvX3tCG8310xZBFV0zO61RaGCumD4GuSiFDu4qKvQ8YFsAeEMF+GQGy9x
	dTy5fbaftVIdel7BHwi3AB7nsU3jkMW/QRDqagxj3KqfMn9rSjQxgD2M6gLvhxj9hkg8DwnDRf3
	weVgsuy2/UMJqPgncUlSjRKSIn4yEQZKQBVNC1hPTkurgvOUd2Q+7yufXeTR8JbcPKE6iWkzJC1
	EKJ/e1IKWr4urBR4ELm3f7erykzNX24TQBiLTCSB+W9XVLWEiDP1l/YZMg/9Jd0WSC3Z/jB10FJ
	4vbB6mCpRMnyRWZkyszfGPMUHugVvhm1FdRWjxUi6d0LwHe3j/uf0qwa7ywYiZ1YvPoMAFwb9h9
	clkfQmIQ+ow+uOR9wWAT6JAJ1SHTvFvrJjoO8iLcD8cuFgKEs5qbnaKlmXYUoRjgMOZuJzcQur/
	QuiFUv7FDQk=
X-Received: by 2002:a05:600c:512:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4a211edef31mr30819615e9.6.1792768814071;
        Fri, 23 Oct 2026 08:20:14 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2a9062d50sm11683025e9.2.2026.10.23.08.20.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 08:20:13 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 2/2] ASoC: jz4740-i2s: Add support for the X1600
Date: Fri, 23 Oct 2026 17:20:11 +0200
Message-ID: <20261023152011.85407-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023152011.85407-1-olivier@mgcrea.io>
References: <20261023152011.85407-1-olivier@mgcrea.io>
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

The X1600's AIC is the X1000's, with two differences.

Its I2SDIV register holds the bit clock divider itself, not the divider
minus one, and drops the lowest bit of what is written. The driver writes
div - 1 and, from a 22.5792 MHz clock, asks for 44.1 kHz with 7: the
register keeps 6, and the stream plays at 58.8 kHz (measured on a HiBy R1
from the PCM hardware pointer: 44,100 expected, 58,700 observed).

Its AICCR has a channel count in bits 27:24 that the driver never wrote.
It held 1 (two channels) in every stream I saw, and with it a mono
stream is taken two samples per frame, as left and right, so it plays an
octave high and ends in half the time even with MONO_TO_STEREO set.
Write the number of channels minus one, as for stereo, and mono plays at
the right speed (a 6 s mono stream took 3 s before, and 8 s took 7 s
once the field was cleared after one second).

Add an X1600 entry that picks even dividers, writes them as they are and
sets the channel field.

Tested on a HiBy R1 (Ingenic X1600) with a CS43131 DAC, on v7.3: 44.1
and 48 kHz run at the right rate.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Changes in v2:
 - Also write the number of channels, minus one, into AICCR bits 27:24
   (X1600 only). I found after v1 that the driver never wrote that field:
   it held 1 in every stream I saw, and with it a mono stream is taken two
   samples per frame, so it plays an octave high and finishes in half the
   time. Measured on the R1 with silence: 6 s of mono took 3 s before and
   6 s with this, at 44.1 and 48 kHz; mono and stereo now have the same
   pitch by ear. That the field is a channel count is my inference from
   this, there is no datasheet here: if one of you knows the register,
   please say so.

 sound/soc/jz4740/jz4740-i2s.c | 44 +++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index d36bbc820618..5153fedc5978 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -38,6 +38,7 @@
 #define JZ_AIC_CONF_SYNC_CLK_MASTER	BIT(1)
 #define JZ_AIC_CONF_ENABLE		BIT(0)
 
+#define JZ_AIC_CTRL_CHANNEL		GENMASK(27, 24)
 #define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE	GENMASK(21, 19)
 #define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE	GENMASK(18, 16)
 #define JZ_AIC_CTRL_ENABLE_RX_DMA	BIT(15)
@@ -71,6 +72,16 @@ struct i2s_soc_info {
 	struct reg_field field_i2sdiv_playback;
 
 	bool shared_fifo_flush;
+	/*
+	 * I2SDIV holds the bit clock divider itself rather than the divider
+	 * minus one, and only keeps even values (X1600).
+	 */
+	bool i2sdiv_even;
+	/*
+	 * AICCR has the number of channels, minus one, in bits 27:24, which
+	 * the AIC uses to size a frame in the FIFO (X1600).
+	 */
+	bool channel_field;
 };
 
 struct jz4740_i2s {
@@ -218,16 +229,17 @@ static int jz4740_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 }
 
 static int jz4740_i2s_get_i2sdiv(unsigned long mclk, unsigned long rate,
-				 unsigned long i2sdiv_max)
+				 unsigned long i2sdiv_max, unsigned int step)
 {
 	unsigned long div, rate1, rate2, err1, err2;
 
 	div = mclk / (64 * rate);
+	div -= div % step;
 	if (div == 0)
-		div = 1;
+		div = step;
 
 	rate1 = mclk / (64 * div);
-	rate2 = mclk / (64 * (div + 1));
+	rate2 = mclk / (64 * (div + step));
 
 	err1 = abs(rate1 - rate);
 	err2 = abs(rate2 - rate);
@@ -241,8 +253,8 @@ static int jz4740_i2s_get_i2sdiv(unsigned long mclk, unsigned long rate,
 	 */
 	if (div <= i2sdiv_max && err1 <= err2 && err1 < rate/20)
 		return div;
-	if (div < i2sdiv_max && err2 < rate/20)
-		return div + 1;
+	if (div + step <= i2sdiv_max && err2 < rate / 20)
+		return div + step;
 
 	return -EINVAL;
 }
@@ -281,6 +293,12 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 		ctrl &= ~JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE;
 		ctrl |= FIELD_PREP(JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE, sample_size);
 
+		if (i2s->soc_info->channel_field) {
+			ctrl &= ~JZ_AIC_CTRL_CHANNEL;
+			ctrl |= FIELD_PREP(JZ_AIC_CTRL_CHANNEL,
+					   params_channels(params) - 1);
+		}
+
 		if (params_channels(params) == 1)
 			ctrl |= JZ_AIC_CTRL_MONO_TO_STEREO;
 		else
@@ -305,13 +323,14 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 	 */
 	if (conf & (JZ_AIC_CONF_BIT_CLK_MASTER | JZ_AIC_CONF_SYNC_CLK_MASTER)) {
 		div = jz4740_i2s_get_i2sdiv(clk_get_rate(i2s->clk_i2s),
-					    params_rate(params), i2sdiv_max);
+					    params_rate(params), i2sdiv_max,
+					    i2s->soc_info->i2sdiv_even ? 2 : 1);
 		if (div < 0)
 			return div;
 	}
 
 	regmap_write(i2s->regmap, JZ_REG_AIC_CTRL, ctrl);
-	regmap_field_write(div_field, div - 1);
+	regmap_field_write(div_field, i2s->soc_info->i2sdiv_even ? div : div - 1);
 
 	return 0;
 }
@@ -382,6 +401,16 @@ static const struct i2s_soc_info x1000_i2s_soc_info = {
 	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
 };
 
+static const struct i2s_soc_info x1600_i2s_soc_info = {
+	.dai = &jz4740_i2s_dai,
+	.field_rx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
+	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
+	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
+	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
+	.i2sdiv_even = true,
+	.channel_field = true,
+};
+
 static struct snd_soc_dai_driver jz4770_i2s_dai = {
 	.playback = {
 		.channels_min = 1,
@@ -493,6 +522,7 @@ static const struct of_device_id jz4740_of_matches[] = {
 	{ .compatible = "ingenic,jz4770-i2s", .data = &jz4770_i2s_soc_info },
 	{ .compatible = "ingenic,jz4780-i2s", .data = &jz4780_i2s_soc_info },
 	{ .compatible = "ingenic,x1000-i2s", .data = &x1000_i2s_soc_info },
+	{ .compatible = "ingenic,x1600-i2s", .data = &x1600_i2s_soc_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jz4740_of_matches);
-- 
2.39.5

