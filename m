Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792940038;
	b=Suj4nBhDvPDpxpgzmMhhN/qCr+BjlKVQ/z5YGx20wBqNqUWtA1xnvzC2DJj1AIVF6mCU
	 n0rNVzO4NzSnX6UgZg8qP/2dIVVTD3bpUJP1UHLo03SypfVyj4nvFC1FJPG/H8qlWKoTD
	 9wIa+lKkNIAXXhgT6byPzxFyXRzmYw+jC6O0eazBQP0uYppRaiAdGcJbNlwYtllplFCNn
	 1oW6v6fTwSyixgqEJrhLhli1M9934qtpxEKHWi0xaQ/vbwtbsu3eca0VHMGhBfTVJk1KS
	 DGuXIkcupYCUk2dC/ZhhiDkv5h7EWrLl6mJ+/CwmxPEoq/pMjl9qf9Z3x/erILAnsRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792940038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m4kAH8DCfpe22OkmCb4iXEvhigID4lmHLEwsjbr3sm0=;
	b=LNhTRFEYYe+vF8q2kJDRKZbpDnQbU8nvCdib7HHmsm8vX7QbJ8LiDWoedlPXMCaUBE5h
	 pflVbDGBizJ9Rh/8Djn6bkbmCBHBlbgdbCMLU2T32reG56Is2N/dauYt5jtS7oja3IC1X
	 H99ZzeNqWGnJIHD5H6JO/yjz6bvQemEii58JuD/n/mNLnWEvEWgBucCLQDaH4oewE5hoy
	 XGaxF3QJp3PEVC+8v54LmyEKK9ZmETDCb31JHNTvZsi9kaggf/e3kGfs/jjM576vkCmWk
	 sgE7WsHmCKGZ+jJIMM8k4PuSreELqixF7IOwS2+CZ8URVaiLFXrPnUuV2G7F0Lp1u1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WIHJ5XAH;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370A9606A31D
	for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 14:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 370A9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WIHJ5XAH
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1104980f8f.3
        for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 07:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792940036; x=1793544836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m4kAH8DCfpe22OkmCb4iXEvhigID4lmHLEwsjbr3sm0=;
        b=WIHJ5XAH8wgyHoq1C/naLVLPt+y80xFDDGNa+UkjOww70HePVeg3yChQ7FXqcZSOvI
         MUa8cdxJtMxKYuOkdaJGnVl0ec4XE70euxMXCkjxAECFZOlUt3r/r/yOOb7vMk4aWiFx
         Qbv/7+aZkOPppaH8z0TlLvnVk1FrXWDt57Kn2WEmxgB485igiHHwkdVmO9eM8vXa3jzH
         e0Zug3sVA7L5miKMQubaV9fO3o+FzxWNlypujkbEf0DE5rHP9j0BXOKSYghd5TF4+rVn
         rgwugEYuZbsuGnS7BSWxA1Vvtoze1MzwlOIUYmelqoG2M5EnB3A1tqKUwCe1cRSInDMM
         G3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940036; x=1793544836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m4kAH8DCfpe22OkmCb4iXEvhigID4lmHLEwsjbr3sm0=;
        b=ePXas+7kEuTFE6F11aHVCrpGaloSQ2+Ua0dXbOLpJKEkRPoo11njulZDwzgeL3dT14
         nXZRsYNyU1L8ccJgtuvNO6EigQhX+QcVuqjvutJyi6lS1HQeGIqDQIn+LbIwVtj6rhKD
         DeFJK4uY8og1kc3SXAaKtJYkL+jkWkP3Q++FUvAbHQNpuiERHVO+1nkjkblTf6jz/X9p
         3syBU5SLPYNtdRxAE1Dm0MprIFgsS92wyMNAmiJeFoWF5UxrH5fR7dDWiMYMS1YXZiM2
         GnjUSJgnwRpLdRtZLrk6PaIy14FymrMKoj5JUYEyDRwDLWfHnlDEnJq1aVi8E/Wf3pAN
         LbSA==
X-Forwarded-Encrypted: i=1; AKwUvBzmwug2+s6F+VeD9bLa8/JBmBR+2ztTY5wnmAX0S9zagQl0wMDkCWYtRkA2mckb67m9Pj22jmkywWfyIQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI216m3KtXHSz/TxNcc7SoCxLRtV2uYO3FDX602MPEJ+6smVFu9
	ocx6UAqclJXuxZbBqbYZHrBO5dRCm0DOgJZgSXSeYQpsxXPeTCBL+5Kj
X-Gm-Gg: AYBFou2HcEcTAxJFdmNXupOnGfyvxqb/SDFisc1fHEqHuPZTNb2SlpYsqT7b569M/io
	XWDYQD4UsYCPuwENCsKIZw49cUTkPdhuTioOItXdyyBE9GznR8IYgPoH3ESUEKewgRc4llOIfi2
	BqSneFQAtgbvB5DkVVTlntBPG9bNMMcrieBC0hCGzj7adpE0uH+mYss5s0yued0aQMIA6+NJs9o
	52tSfgfD7dXqQs9nLRgjeQlojFpo0xKUC1EHyRizb0Y5h5T6gReeTMynXqX4DdgdLuOpH383l+Q
	ITK6orIeZADwN34XBoTRK57EQT3tOjxeyQLkNDkji8vU5gGzxLdJsy67p+HcWX7smCdw1Dm3n70
	37KHQ43/FOz68EhP1ARmPkzMIFoMlob1NKDGADGEfStQe9K/DLdVzPq9pJD0ImgVzIwqlRGsxv4
	tI+U27UpWBdxS5Uml0rVW7Gh1izrJHDYxi/mhoW4+QRwnYxeuZpPDjKuSrt26ciwvHOcMV36l5l
	quiZx5bh3EtuV1vgDs5d43tou3pCxDyPGpsRS2z3UaxFa+8cN6QHv7BeTKrNXmEhDipNjhAP40t
	ViSIv4rPjJXjvluK0pAdZbAPI9oSQaS9Eq/H8fngRDwnh8sQ1Oq+PIjk6EiCicVMk/qgRACRel3
	cQKCBqagvZ/Ixb4al
X-Received: by 2002:a05:6000:260c:b0:48b:116d:56fb with SMTP id ffacd0b85a97d-48e3eb2b643mr8140142f8f.1.1792940035370;
        Sun, 25 Oct 2026 07:53:55 -0700 (PDT)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:4c3:3a00:d533:9d50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm10986471f8f.27.2026.10.25.07.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:53:55 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: rt5631: Support an MCLK clock from the SoC
Date: Sun, 25 Oct 2026 15:53:52 +0100
Message-ID: <20261025145354.3476371-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The RT5631 driver doesn't take a master clock, so when MCLK comes from a
SoC clock output, that clock is turned off at boot as unused. This
series adds an optional "mclk" clock to the binding and enables it in
the driver while the codec is active, as rt5616 does.

The board that needs it is the GPD XD (RK3288), whose device tree is not
upstream yet. Its MCLK is i2s0_clkout: handed to simple-audio-card, the
mux picked the 12 MHz oscillator for 12.288 MHz (wrong pitch); held by
the codec, it follows the I2S clock, as on the RK3288 boards with ES8388
and MAX98090 codecs.

Testing: dt_binding_check for realtek,rt5631.yaml; W=1 builds for arm
(multi_v7) and arm64 (defconfig) with SND_SOC_RT5631=y and =m, no
warnings. Tested live on the GPD XD (RT5631 on simple-audio-card, mclk-fs
256) on 6.18.54 with this change backported (the bias level read uses
snd_soc_component_get_bias_level() there): i2s0_clkout stays on the I2S
clock at 11.2896 MHz for 44.1 kHz and 12.288 MHz for 48 kHz, and both
play at the right pitch. Boards without an "mclk" clock are not affected
(clk_prepare_enable() on a NULL clock does nothing); not tested on other
boards.

Tool disclosure: this series was prepared with Claude Opus 5.5
(Anthropic) as a coding assistant, in an interactive session where I
asked it to fix the pitch problem without the RK3288 clock change that
was refused in 2014. It traced the clock ordering in simple-audio-card,
proposed taking the clock in the codec driver following rt5616, and
drafted the patches and the messages. I reviewed and understand them,
and tested them on the GPD XD as described above.


Romain TISSERAND (2):
  ASoC: dt-bindings: realtek,rt5631: Add the optional MCLK
  ASoC: codecs: rt5631: Enable the optional MCLK

 .../bindings/sound/realtek,rt5631.yaml          |  8 ++++++++
 sound/soc/codecs/rt5631.c                       | 17 ++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)


base-commit: cc3fc99f1bce93c3ae3771ef98cb91a566da857e
-- 
2.43.0

