Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769246;
	b=s8i2zv7xZJ72CdF9iBJkXixUEK+jriCHYNwCaaxttbkJEETG72ScsKNRYfjbwSc6iWIu
	 dKC/Bqq4RSxLxPKXb8jM+J6I2UI3SdMnJrmlyMwFZrWmRtUx5ln56U7CJ8xQbs5H/BbWq
	 RL7QApcTWEg1+bAffpRUDwg/xywniBdprVw3p1ZbuA+/P1qKmxXhX+K3k20XH5M6lr3hq
	 OL+q74cP/UjvWGRdqv0uv9YriL9VEdxOse9dMohzM57KlVhet4dvLif1yg8FNk5s99ELp
	 9XqiZZPVweEjbdmXHT7V5O/pvdd1Myk/eFxFMn7jDdxg5yzo26XEUGNJ7t+Opi3CS+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YqiLlX+JxDcPlk5VtslQG4KZvY+b9l7cdczQp9cpdP4=;
	b=ni6RzZ9e5NbQrw6G40rIGqnLzjYUnqGnux+AaeYmFPIEgm7sDSmm51YJ0z58A5k0w+eK
	 gskkDY6nW9Dl0yjFkAsN8Ynp4jdLGxl4V9uUR+wczeoE3pb81a9WsxSNuh14l8ogFF5Bg
	 JABdvg2Vt5WeYo/5K+pRDqw3N+5We4x6gJXq1HDp9QEGnKHDsMzhPSJvyQvFm1Gtt9F2L
	 o/Z33Tuf3LmSkWuL3ibCg29tAuweaMx5stqRrd2lcXpNvKJj75LSN+91zGrrs5pp92/rF
	 17rOYRO8Yzu8cyMg9Q2OSeVHZcLczkg6rVeATUMlOXAULS0AQaGuuQscyFYOYAXEnMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=0TiJFk7I;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AB9606A31A
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 15:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9AB9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=0TiJFk7I
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so6051575e9.1
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792769244; x=1793374044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqiLlX+JxDcPlk5VtslQG4KZvY+b9l7cdczQp9cpdP4=;
        b=0TiJFk7IbN92tYLPaCmlhdXa2D0uBf9G/P9NL2nmna+l3uSPILxIohKt2D5m8lXFuu
         0z22gc/RGo+iAeSysZbIjxRy1cAKlYbFzQYYOWunKqwss9xz3jPy0XwMMH4ug6s/wqLj
         8mINh/IxeXLmGuvajASLTLZ65Kz3aldqNOkrdsbldeboZRZU5oe7XM0R4Ql6AuRpH0Iy
         MiKvfYltPmg1H/7eMDY0LE2kWqA3A+0LT8UbcS48zasXk0fElzbi3ozYQ2oOVqnOyE2c
         w79msBt5QCcjCDf5opCyTl3OxW+vuzfTq1jxtVWIuRJ++FSt3f9L7ah53HBlECgwiGH6
         TArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769244; x=1793374044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqiLlX+JxDcPlk5VtslQG4KZvY+b9l7cdczQp9cpdP4=;
        b=dc1C/wu49YL0Ky6opf9GzckP4fFWMkQp+yGR4eKIjWJWLOzZV4wfY4Gz4/AGUWSJwV
         i7bugkLNQrl36Wn5WxVCruQoqjKtlHwtLqwHlXCTPX/HdoKJQIT+H9xd5edUS0mxMOwi
         00qbV1zlARtsNJQEt+Zu5WzGwan8f6Sk6Cono1PbSus1b6LmpZnDs5UY6CoA69uMvPlI
         RXbfXXUqFKzLEFi+uQbc7Z3STubOOzIcOL7PpVYD8K/TRKF4GVwE9CYjN8ZFZ+2f4FXu
         4eP47xrCE+I7x5qTtQfktIhmDVYj8Pn2hao10JDQxpygaI01EzhyyDeRh+0Ox5tnVdao
         oW1Q==
X-Forwarded-Encrypted: i=1; AKwUvBziOEMzg/LjjnePN7Fp82ay6nnP/mTsrEbwvHR33w8/gt06jO0L3kT6a/ScazNy1XO4DkhRjoljZm/aFg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIjeC0d0CeYzBSUPq666ZxKpZNqagcy1YtoCq68zjHp+9/lBUt2
	gufiY/JOF98nJ6j9itaVCz5f3T92n43UEf7/2it9USi18aReGJCyRM2PK2l5kp9Yat8=
X-Gm-Gg: AYBFou0QawPL+vG+eWt/KPhqv2LiDyHLezyMd86Fq1El0HEYB8u5BbxarxOk3Lmx66I
	JUoJm5ONnkqyWoyrzko5m4oI7Q7WGe8Zh8EhoDqiNx3Kqdxa3yCEVHdDqgKMUiJZ+inLeDAHLz2
	D9/dzDF+MGB8JAtTQLD9XbcZjDhhW9pXENFW9cjNAFHiMQ4sWKG8qTMhMZ//stwSsOG2C4oHgN7
	/3JdKO7Xw3Kn1/kx3LDYZyE3LEg1GbnwcS8yENrnchmSICOMVWLMu1hfrSK7oPu/IeC1kx/JRcI
	0U8jFAoFagp2aBBR3AM5rZdXv+hzq9//L+SaH8Slf4MnjOEVC8wmpViaiEkP8QR7elDS/35xkY0
	89PPMw5crftaD+EG7jptiAC5mUlamzMUMtennvzJyW4L5cmPo6NDywZ85Gk9v1wi8vcj3yuTTbq
	6jgM/P8s/oF+BCjZgPMk0hNJP34BhLzPqJLTUrqv0YG9g+eBOOSGkgYIdaUiNMU/0QRP4N/9A2+
	oMOYYGaD0HHLZJkNh7j+jIbhUqPLliSHbD9mKjmogXDXsCdDvCV0drYqXnebbhzhjjXTMEmIKeR
	xtLawBI7zSI=
X-Received: by 2002:a05:600d:8652:10b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4a2526bd7e6mr11642285e9.0.1792769244157;
        Fri, 23 Oct 2026 08:27:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2a92a42adsm11731145e9.3.2026.10.23.08.27.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 08:27:23 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 2/2] ASoC: cs43130: Mute the PCM path from hw_free() to prepare()
Date: Fri, 23 Oct 2026 17:27:22 +0200
Message-ID: <20261023152722.15912-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023152722.15912-1-olivier@mgcrea.io>
References: <20261023152722.15912-1-olivier@mgcrea.io>
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

The PCM path is unmuted when DAPM powers it up and muted again only when
DAPM powers it down, pmdown_time after the stream closes. Meanwhile the
DAC plays whatever its serial port carries: on a HiBy R1 (CS43131 on an
Ingenic X1600 I2S controller), loud white noise while a stream is open
but stopped, as when paused, and until DAPM powers down after it closes.

Add a mute_stream() op, so that ASoC mutes the path at hw_free() and
unmutes it at prepare(). The op is not run at trigger time, since the
codec sits on I2C.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Tested on v7.3 on a HiBy R1 (CS43131), by ear: no hiss while paused or
after the stream stops. Build-tested with W=1 on 734bef548a96.

 sound/soc/codecs/cs43130.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 325f9f0fccaa..5fca2822dd3e 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -1624,12 +1624,28 @@ static int cs43130_set_sysclk(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
+/*
+ * Mutes the PCM path from hw_free() to the next prepare(). Otherwise it stays
+ * unmuted until DAPM powers it down, pmdown_time after the stream closes, and
+ * plays what the serial port carries meanwhile: white noise on the HiBy R1.
+ */
+static int cs43130_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct snd_soc_component *component = dai->component;
+	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
+
+	return regmap_update_bits(cs43130->regmap, CS43130_PCM_PATH_CTL_1,
+				  CS43130_MUTE_MASK, mute ? CS43130_MUTE_EN : 0);
+}
+
 static const struct snd_soc_dai_ops cs43130_pcm_ops = {
 	.startup	= cs43130_pcm_startup,
 	.hw_params	= cs43130_hw_params,
 	.hw_free	= cs43130_hw_free,
 	.set_sysclk	= cs43130_set_sysclk,
 	.set_fmt	= cs43130_pcm_set_fmt,
+	.mute_stream	= cs43130_mute_stream,
+	.no_capture_mute = 1,
 };
 
 static const struct snd_soc_dai_ops cs43130_dop_ops = {
-- 
2.39.5

