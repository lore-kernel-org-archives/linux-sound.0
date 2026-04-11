Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B0F38AC79
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775919495; cv=none; b=A7+JG+CqKokxTZiDBI/+ZRG8rhmJG7kQ/TkiEmLBlsnBHQc4au7GuDxCw7XSNTnho6Enj/RDDHzYTweMc95GP21Cj+UTyqTKixXiFc4QtSkbtXc2khQxKdqqelQDmJ4bj4ffkFN6E4pkvC/a9LPtC2Teoyc4a9AQ00dc/UFykqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775919495; c=relaxed/simple;
	bh=6j3v3mDrlDrlzFC6qKMxljaBySrCYlr4KNLaCiaa91M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JN3D6ynjSOuX4tatW6KK8LBJ5Gkpf92W6wJy8DXo/QUd+wO0xXpjjN64SPc9//u6fQwkTCd+Y7sE/x+zRIAyows2EoJXOoSeVTm/nhQfSncTAzgtwMITF23XqKouFo+mLtTzuupWFCUQkH7WW0vckh8VRo2I2fFfuBt6K4zs2Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=ijnzcQbz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="ijnzcQbz"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b8efed61so27352035e9.1
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919489; x=1776524289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZFZpdr1MV/6QAPj7KJDoF0hCAuAn+fdtvXvgF3G4yk=;
        b=ijnzcQbzkHH0BUik5HZG9o80TaEwEVkrzuk7GBqOK/gFX3b+moc826oqjB6kayWCNh
         QVbZADmbmy9D6KGpGEjnsNtOKU8U/uq46M7yIuZ+WbeohyRx0/yd1Dg0WLSOd3xDxjm7
         LFXOlqBcIgff1kJ5QqPrAxkrHlFOxBFwS8HYmJ3I6Pc0en5PNcncybsN5iiIUTZl0OnV
         XLVFkRrOg18Bu8ApMP3fatO8piqckzumYmdW9zn7ikchb7zdW0414vNBzh01jYazxqwc
         N5bq1tAkGfT6xX+qg9f88m2Ad4WoXh9SkPVk8LcclONiUwc8tcQDbs/Saso0Nrdd7IR/
         BNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919489; x=1776524289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZZFZpdr1MV/6QAPj7KJDoF0hCAuAn+fdtvXvgF3G4yk=;
        b=YlUsF9MA0d9FfSNXeXICB/v4wAl83+JGQr9RptShuhLFhfz2MxXm2AYvdq70YhYm8M
         Le6He/rtikJw/4F3gzmUIg9b+dVZWYx0C+j1GMXyuN5ovhClwgNuF1X+AX0vnYkRuXjt
         ME7dJx/qV2bsUIHi8hpotMNUnSI40AWptLGsNcIuwVZ40+KJi1xw5SFhofpSLkFc40cW
         HWTUAIqltD8wjSUjxcNt67qRZXaBHVzEfI25oBelgGibu1GYYxLzngdr84aqY2EOGKj2
         WB006a0fB9zFdSVPSsnSpvi0jZIhh7/cLXJShEqMxqOROKxPsPlC9HRElb//ITiDYwJq
         RFtw==
X-Forwarded-Encrypted: i=1; AJvYcCXI/Ql0mKYtMu9hR0Y9GnHw5GBfb5knuApWX+r/CpPlndnrLxMjDmyn5KifFsLeV2DMCquh5EaxDZGGeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLvW+IkNpIIaP2Dh9wVykuJHP53sW3rxaM5ITFNKd56q7mqs35
	B7J47Yf0AQWTXNzb8JTio7civ1/msNtLb7EPnrIx3jteFmOjbEcT/AFiuuRiZri9x2Y=
X-Gm-Gg: AeBDievxus0yr7nC0BN/5WhwjDFIbsa9NGT0Vd8bdkeuWp36ADLFrRyu2/ujIePxUP8
	MR/KAnRuNIHQr/TKmkg2l7p8EXq218A6Su6S0NvNoW9K73NqadFaDfCI0HevnonoiUKZrir2VfI
	YJtu9LUtabcFK6/5CO9CxQgJqUO7Nuw11gRYjE//YN2/wDdclNs1FMSGODa1pdJQuB56w0bzxBE
	IWIHNp8/OGrCtSgrxR1PNMqOrch92KsUL9MabrITmHY3oTTZctI3cYLhbv31v80c7zfI4AJfzKA
	Lh57BO4Q4bIE9pKEFlviKZD2sbrfX6jOsODfXt18d3O/Cd84+mIktrXp29WrlrkV/PDn5uICjz2
	gKnBPehNvk0gzjpcjKwIcuSGTMZPTU650LdLvT+qllaXdQtq+VeiFgN63Pk/c3CFS1+KYkUnmps
	6iGDFqKiUenjEWG5qY1pjL
X-Received: by 2002:a05:600c:3ba4:b0:488:c6e9:1e0c with SMTP id 5b1f17b1804b1-488d6847de9mr87734405e9.5.1775919488826;
        Sat, 11 Apr 2026 07:58:08 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:08 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:33 +0200
Subject: [PATCH RFC v2 08/11] ASoC: meson: aiu: add I2S Capture DAI
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-8-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=6j3v3mDrlDrlzFC6qKMxljaBySrCYlr4KNLaCiaa91M=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3Ekt27DBdU6rFqj7t7+P5ibppX97/M9BYJ++QMKe1t
 cS5WHp1RykLgxgHg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACYy5SQjw6zSF59O/F7VUOUe
 +/OU/g9BQ5HD823mHpnc7d+7Ol74Kh/D/+xT3U9uKKUnLRd+JfJ163SuSvHNMh6CjbmK5ltFft5
 p5wEA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Add capture stream to CPU_I2S_ENCODER. This is the final step to add
support for I2S capture following the recent addition of
"audin-decoder-i2s" and "audin-fifo".

As for the naming of the stream "I2S Encoder" is kept as base following
the same pattern used for the playback stream and with the goal to minimize
changes.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index bb3e0364190766ab4ce9ea3ebd313eecf220a244..2b6b94957b051976191d9b1e0dbdb4ca01ba2a94 100644
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
 	},
 	[CPU_SPDIF_ENCODER] = {

-- 
2.39.5

