Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E683D331D
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 22:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164920; cv=none; b=NDNaV5CuHi7CgW7v6zd5NAFxv8d76skfpMP+FRGkGDrewulgwm63zpEzXejBCQataJtEfhgxBG+5EiaDmgXhJWZX3diUajAi0IlenKvBiRsFb3u1KHMa9yXE4BTwNXETC4iBLtcBv78Cyz3uAJgxaE2uHTYr3vYm5zSRMf0vRCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164920; c=relaxed/simple;
	bh=Uvy6WjK33Ql5QDc+7YeTX2qUEcUUi+n12SinkXVNwt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SG23M0dIFOIDDZiJWNIoCveq+Zpegb7Ce40HAL4nvn/+eST3Ia5G0Lw4JQo9rzPr2rPz8Zlhl95kw95H4eQJoqDFN7j2uakaPnCx6W41bx8qWo7Co2ASGtQxeTOvNh3DIE2eVVJVpr6WNw+aayrZN3UUEADP4byukHWAxTo0D+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=f8qvnWnb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="f8qvnWnb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49e6b280cadso4218605e9.1
        for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 15:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164915; x=1789769715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=f8qvnWnbGPu+ZO/N5/3Sys3Mm1bkdPxoXCKxBvkfdVMF1+zIgl2esq+fpygVA145Ji
         zsJGlIeIMkLgc8KmoW/c7QPEbpB/L1rpOHLjlAGCDBcsc/u8oIZLa9ZgBS/8cXD2IHxj
         EBJJXZ+FK3lGp35yWNZKe+fYXbjxjjKdNLGrv5wxbcItH0be11Ow5E7FemiLtSpZYMkQ
         qsLPbbWU77JrRwzH6pBC2SqTfSGI9qIEZ6ndPcF0GO3S9iOa/c3fsxdtuW+eJwq4wGiZ
         /CWYD/LBxJPLanUDFnpb1/h1FbDAQmud2/JtN1YH2Ov08Zge6nOuAV0LYGZz2ayxBBMR
         r7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164915; x=1789769715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=sNnriHmiJlUDDhkZDKDBuSQMHWcINw7GMatBK1EkUiTVkxP8Ju1iDiCYIXe25nVKNV
         RM9Bu+tgJimJG7XNynSwZpl1HFxNjhFQjdcx1DTitlCJ/PMYg9faXwehz0JHc/LQNDsx
         Zj/DAiaFg3od7PYSxaUaCqzFbxN6M5nyQPpIQNj9b/nlmekZb0bs5AmqsXokzfNewqBk
         SHe1rwcIgOqm48+vNo6CDXF8B0iDzm2dhX5bPkcBMI/5BAkaEJaxXhgytuTbcZU6Uo+s
         h7Le+/BHuVnK4hSJF1PxoaSSmIk4YGOXZm5/QJPQPkLy5YHG9Ys5J/0aVqOE6I8qwnpp
         vVVQ==
X-Gm-Message-State: AFuF++lIA52s61Vdv3YqjSbYgdWUBGIspAsRda+rzx5lUM+xYvh7phDy
	5GXhpZOTF0rPffGT4lK6mcw3mumuhSrYjOoKZSqztzSmAlIZnOuQYkR6abkQqZ3kgfw=
X-Gm-Gg: AYBFou37lMDppxlLc8zQouj4At+R7Tspx77EODxUqL4G0jWRXCDuJVzH3nhLsFz5pYE
	23TB2GviawlOtoRyLxGS9VdyXtV5IMoKS+qB0KPGw08iWRzwukEmWXMur9WpVtxt4yfEWF6By9x
	J2ZDWc/+egI9EfuxJ+Vxn/EXEqvOfGl8jvqQH252ZgKfxPhA66GvVgjGAt0UtH6ujVUKjvqyb/C
	8EmQq0RzywsqL6j6QZLyZ9smvMzAYwx1AutnaZUbBPAKN13fwYwmZ81p7yY3UMSJFxi8gy0D6eF
	YqPBkBeJ3+rlKNAZLtgSuHIyXL0NiXGM1QFNxYemNti7+Puc8Uo020flqTlmPIC1N4zGWs+W0Vo
	SLfWEqU3GWpero9JJkQysRvMcwMz2hUGJDtoJMvuUBepstf9zEO+/E1YtBNnIDaaPgKLZFsmzUh
	AEutC/ys/5Ih/DGJHTNMYkorzrsR8kuTtm9wncCyZ44T/m8Iq06Q4jAYpy8jgdOaRklQ==
X-Received: by 2002:a05:600c:3484:b0:49d:433:c3b6 with SMTP id 5b1f17b1804b1-49e619d1eb8mr73755815e9.27.1789164915060;
        Fri, 11 Sep 2026 15:15:15 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:14 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 12 Sep 2026 00:14:34 +0200
Subject: [PATCH 4/6] ASoC: meson: aiu: add I2S Capture DAI
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-audin-v1-4-7fbefe928711@baylibre.com>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
In-Reply-To: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
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
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanPN62R2qhj3RZtv5n7/dkGxo+2X1bUTYtJ8z4T+/
 b708KljHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZiIpQ/D/3iO1Y+uhQl6r8y0
 vMEWZraRteTfueBJYvK/nk9Ky7q69zwjw5V01nCFvvMVs85emf4ja2+hp4tZqPejMzzTP2ifKA2
 MZwUA
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

