Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5690B5616D3
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 16:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092900; cv=none; b=iwH5cRFAS/rdLpGTb8XDmIAXzie8i+5UrYRH2BQ2TmMekHOAgBc/WJDPcrQpZwV55QAxP0RJi1YaV9TikQNoh7PkAYd6/dKgKBb17WAWZrnJmetLTqK1+81WiF9JlzXzO7ai4pg3GsQcRK0PL2Rbwnv3p4gRUSZqq6/VKC087wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092900; c=relaxed/simple;
	bh=Uvy6WjK33Ql5QDc+7YeTX2qUEcUUi+n12SinkXVNwt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RkUR1MFNUj2lLbQaU5b1xMgSqsM1ZBALKE+Zt6nSV39deUPEo0CJhzvpHvXexMkAXKIAr7vXaqXE7eoDLfoBm52YiaFBcUTP5jjD06vMcvxn4e7k6vEWWrIdArLV7jCC9oiBTqUY8F9c9dASK0lXiLKB/B4GfLzja8RyOjq04w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LZfDtRGD; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LZfDtRGD"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so72232f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092896; x=1790697696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=LZfDtRGDSMrwexcOSCtj1QggG3vEOiN3TYALWyKQeONa2O+x2wdZk2R1E5lpOpgkxn
         ZBhDYKJHNmogNg0r4H5pelejJgLqW4wg0jC98MqG0yphUq+OZJ3x6wkrUC9vAPMdBKIe
         t8HSJr+3H9tZ9ov7+YlfZiPw/rQlaIxJMO3f0v1E6UMC5XvWS3BgzqS5833BaNhxHK/d
         A74X8oebk7fJtBQKszMkhor+0Y9kpTnvX5VFflTWsAW8IDFb+PmZ/QKX+xoClWIdh1T5
         9QQqBSs8hZRK2w2aGo6GFRh2N0fa0HA2tQCIoDN+aX0nLyx+16xKCmmm6dcXbP5ePHG5
         oJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092896; x=1790697696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=ESwPOFjGk3iVeIuOjrTnX7KyupbO9UtCDnQbeV8BkEydvHqWCpNvLLD29CuQi+2B3c
         0Ha998dMv8Nlvu/YKPk4hzVSvZ7D01KpJjbFGV7T2WIEi0qNpXR5MM/ttyq6NJEM03jx
         FFkUSQxejrSwlwohx84XXKrTEom27SzqzV6q0mxBbWaDGge9CFqwsxxXi4OMBW7yFRzS
         DiRaMNhAu0BeYUPRkQ+GT7WsuCWg3cZywPPa2blXhvfJwcgktAFYfQNNqKr7kcK6k8pB
         qdKxi+XDvTl7aS8F7O/J4NLpmcOq6S5PSEQ6MqwRrNHCchnxAXrR93tSjA+ElMqZrMT0
         bEeA==
X-Gm-Message-State: AFuF++kC7eMzoDf0NKfxaibSHICO7O4CjC0S2ogYFBWQm1aCfkXaROXx
	PRLciWWNd2zZuEjSvhFTowG9d+Sva8KDBLBFnlYjJWNPB6taVC/Bvp+1owhWaxZOOoo=
X-Gm-Gg: AYBFou2s/+ax77C3b8G7ywQ57RvSo12UYFXa0ZUXn7OKe/wpfLdF9xINxCgZrG1wnex
	TMrpa+qGCzzpOgsl5cGiLtS135ffqLunIJiL74LRlARlwDK5OmLV6V8H6Ul2mLFUSnhfPweGM4I
	XFkiQismJIqL/86l7ALeeyA3I2W66NgJL1jU4mwWaNrar5x3zBJd/PRvN+t5L2pYdNkTXg7OMlv
	gyGiAPK3ShONUvH1gpVJpWMMOKvEf1KaPcwGuZt5hk5aznoWoeIw5nQBHeDuY428FWTIWhIEbvT
	yvoq6ekMvjGLJ2A4JzEVVodFfEXvAUPyrKkztPFMi64ktnkfj1ekcTqFLy8gGI41gFBLvEDdqJG
	X4/ar+7hlps3EXIzU2wjO/ny+qEVmS32ZU7vEBVPwwDjkAEFSm4umVQMYsYotkiRsnY0uTOFhG1
	6JG8GWmYpOszD58tA3ymztbZjt7PZV6AoEVIJcFqusXmJ8DVwN8pUd20fLpPfDxCp3gkE=
X-Received: by 2002:a05:6000:491e:b0:487:27f6:a4ce with SMTP id ffacd0b85a97d-4886708a7c7mr50365f8f.30.1790092896498;
        Tue, 22 Sep 2026 09:01:36 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:36 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Tue, 22 Sep 2026 18:00:50 +0200
Subject: [PATCH v3 5/7] ASoC: meson: aiu: add I2S Capture DAI
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-audin-v3-5-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
In-Reply-To: <20260922-audin-v3-0-a760312c076c@baylibre.com>
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
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmblkVtm8ch7b+rdEeF24O1qxX7Q+9OCG6Yalu1deMbg
 cIFkROWdJSyMIhxMciKKbKwTL/3u6BU7aFxwskCmDmsTCBDGLg4BWAiURwM/10Pswef6OL78Of5
 qanpLsULSnRd7qvUHAub22fQI8gbZ8PIsG7x0a85R2YGzDt56vFKLyubu5IFe0KFeTfUH4mPtrj
 QzAEA
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

