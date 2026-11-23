Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477262;
	b=EBaeCW+TCx5S99iZ/LUJ9Ak2TnmztV8wg96OUWP/4+yjnrRJgUiMd/rv+Cg8zz7Q7Z2a
	 nvmQTlZPehkKypNlpvMsAB//6KSStDPZiX7X4d/NW9jxh9azNwGJIeJ2/Q8/KRKRrpWZA
	 FOmwVgdzdyzwu8uEdRSE06uj/x4eFqVPehfXP1qUC/h5KKr7H1l+Oyvh11j49e58YF+aT
	 uEcI6SbXCVUnBjBVfRwLA7S+8iY7cQe9Ip8dwM3o4bswXGnfGRxkdb9MNWY15bDcMJCne
	 mkV/larMMGpn9fjbDuR55pi08SSV45KXjBd6/8g9x5y5/LWYET5PLa+PUjDLTiTE25Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6Jona4pqFJCvkAlDQiwA0g0kWVm7ypHuKu5UjsDxy74=;
	b=OOakAS0YUDLDCJT6WsI4pfC63YFw3wnhoHJefhvr35Llke2eAFkh7pG2vJ/pjOGzM0ec
	 omiOhB6frsMmxv9gUkDuQpWSvNXMnOseW71Ar6lCgee/V3G7HqnymQZc5FkPJuKBJNYHo
	 6kvJjbngp9NIDzBxTd/0cYmXCp0grtWkM4wtzVfEyNm1pleP/flJt1Q0kPWB5wjlzwaOu
	 wEEkAN4Xw7XcnsM/ajQe03/qZCcq+WzNCwN4Hhc7Lh3dLbx9d1mwJ4MrxhtqN/sOfpcUr
	 vKWI/afJkr0ZxOpOY5XLKESEKvMikeFTZBxT8yiNdvBgNSgvV05zypZioUMR9FAx7eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BjL5nyIr;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2330606A326
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 23:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2330606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BjL5nyIr
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so40988585e9.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 15:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477260; x=1796082060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Jona4pqFJCvkAlDQiwA0g0kWVm7ypHuKu5UjsDxy74=;
        b=BjL5nyIrKNh+QDVjf8eaQALxMPjdbelbz5KCEraemj4Zj/ingQwfseuZS/YGQakrba
         ckzOv0cdddsuNSTHBdjHm1t2s9FTpkQjGA0lxx/C00IN6K8mqfmTBloLhubbPehKPmMz
         LfMjiuMiI1oDQiiaxBqmqTJc5qrD+V/AtCzj/up2MKr2A1tJLjGQ8igIwcAMIqX9/hNX
         L3f77wnTbGIgzpQzePV43x7HSWaZmIdGlpnPP3iPf9oW4rqhFuTdfroqt5h2fHs+U4lw
         20ywHLQC+7OtzvpfqF3IgWLJ7DXF7gLaVej5WT+dWs+tiIt9HbN6cS++FOxBIcwsdu/W
         VJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477260; x=1796082060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Jona4pqFJCvkAlDQiwA0g0kWVm7ypHuKu5UjsDxy74=;
        b=oGZPLh1kwfR+gt+/XaxcB6uulsyDmXtWlSE9Z9vadKentKOBxqrEzJzOhq2Kj/wTWw
         UrcUd022GvhUj1HRslykcoRISF0t7jmLW8J6DKD+Q2cXStyWSlTfSzgh9EbVIDyMXQB0
         cOd7D4UssaLVJl98su0UjWuHL9O6u/oySs2k9/x3ErBw/AtLL+wyxXUJ1exEhj97GhyF
         Z0dUM0/qFkg88brZEYGUwrL8torFW1X4xx4UbkrkBMZGDZ7WPhIidrcu4irfDCQJffqd
         MUDk0pfmSbgiova3ZgOR5HWXpx8Pakr/+FsZV6a4dgpDdKADieN+xrBEnWdv6LfpshMP
         oPZA==
X-Forwarded-Encrypted: i=1; AL+hErHOPpQvkS7aHQLYOgBC9O6pkqI1DkqiWDHbu6Zgcw9686d1RoBVjHze5RFSoHMuis1gIx5nwlLVgh7igA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vj44Tnqg4YztSRyo+c/9ybtos0ljA+2PMOrt4qHTpPcJKH11o
	s5qOp5giSQYM+wfcp0jig6or45GShuerza2r27rkpMtS8rk0DjMz5RU=
X-Gm-Gg: AZFdTZeio4kl/jcOOLpwjll/xUkq6mxuVuHFMhDRZYdkzyy8Tnehxs4RBf2yfqt3Gjn
	LtAoUa0t/JExSQ8s6fnbepWWzyiddm57YB9zudfH5a8gVHx4qiRKhLt4T5hGeUn4SulVdUh7ezY
	IV8lieIaXhqsThn+V+hRSQtOIbGnQQhb1yTkDDT89XUHaf1kIsx4eXTpTjTmY8k6e3hJ/e3EkUi
	C+F5n3aAZHq5vMOeHAnxITSDDXTjGxVqQR8VLw559eUxPZIvhut/QdsJ9PgfdNmCWhhml8+EbaL
	Bo3PAfp+MsuspvjOZ9MJII1bVtYBvt8Mn4NUdlp0E5ZvWcyeqJwtFykZMSh+MD7iP/yWIRRut50
	WVrS/iAtQoSswBiXgTPaIfN/U00Ldgi2/XfOXFXWAjp+qB2j3ntcCRAnPZPpuJ6DsZFmGnceU3d
	2/zNRvw+nR0scFSREJbzUaGr5BoJ9M7zQgIYlLEEBD3PUI2ctIZGmHLJl7vvwfO1yQB3nut/NMs
	ZcP1VgzqQFNcPdjrfKVawv+kAr0YVU9wi3SwvgikgE0oZWFeAl8xvjxZb3dSK04wMRIKf2HnNMn
	u9EXuV07Zr0TctvKDOy5Ba+DplS7KyWs2iTwK7Mftg7n1AZTyRGY0g==
X-Received: by 2002:a05:600c:6749:b0:4bb:8508:7fb3 with SMTP id 5b1f17b1804b1-4bb8881c3b3mr247978235e9.11.1795477259871;
        Mon, 23 Nov 2026 15:40:59 -0800 (PST)
Received: from localhost.localdomain ([193.207.76.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm568321645e9.13.2026.11.23.15.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:40:59 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 0/4] ASoC: tlv320aic32x4: Complete analog routing, Mixer Amp bypass, and volume controls
Date: Tue, 24 Nov 2026 00:40:46 +0100
Message-Id: <20261123234050.150364-1-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
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

The TLV320AIC32x4 driver currently exposes only a subset of the codec's
analog input/output routing switches and omits support for its Left and
Right Mixer Amplifiers (MAL/MAR) and analog bypass volume attenuators.

This series completes the analog DAPM topology and mixer controls per
the TI TLV320AIC3204 Application Reference Guide (SLAA557):

1. Add the missing cross-channel DAC negative terminal switches (L_DAC
   to HPR, R_DAC to LOL) and output driver bridging switches (HPL to
   HPR, LOR to LOL) used for mono differential headphone and line-out
   configurations.
2. Model the Left and Right MicPGAs and Left/Right Mixer Amplifiers
   (MAL/MAR, Page 1, Register 9 bits 1:0) in DAPM and wire their routing
   switches into the HPL, HPR, LOL, and LOR output mixers for amplified
   analog ADC/DAC bypass.
3. Add the non-linear analog bypass attenuation volume controls for
   IN1L/IN1R-to-HPL/HPR (Page 1, Registers 22-23) and MAL/MAR (Page 1,
   Registers 24-25) using piecewise DECLARE_TLV_DB_RANGE tables.
4. Expose the CM2_L and CM2_R common-mode resistor selections in bits
   1:0 of AIC32X4_LMICPGANIN and AIC32X4_RMICPGANIN (Page 1, Registers
   54 and 57).

Tested on two TI TLV320AIC3204 boards (one wiring IN1 with LOL/LOR, the
other wiring IN3 with HPL/HPR) across headphone, line-out, capture,
driver bridging, and MicPGA-to-MAL/MAR analog bypass configurations.
Since neither board wires both IN1 and HPL/HPR on the same codec, the
direct IN1-to-HP bypass volume control ('IN1 Bypass Playback Volume')
was verified via alsa-lib TLV dB conversion and live I2C register
readback (Page 1, Registers 22-23) rather than end-to-end analog audio.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>

Gianfranco Mariotti (4):
  ASoC: tlv320aic32x4: Add missing DAC and driver output mixer routes
  ASoC: tlv320aic32x4: Add Left and Right Mixer Amplifier DAPM support
  ASoC: tlv320aic32x4: Add IN1 and Mixer Amp analog bypass volume
    controls
  ASoC: tlv320aic32x4: Add CM2_L and CM2_R negative MicPGA input routing

 sound/soc/codecs/tlv320aic32x4.c | 117 ++++++++++++++++++++++++++-----
 sound/soc/codecs/tlv320aic32x4.h |   4 ++
 2 files changed, 107 insertions(+), 14 deletions(-)

-- 
2.25.1

