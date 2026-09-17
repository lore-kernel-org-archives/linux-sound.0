Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D684915A0
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 21:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678964; cv=none; b=bwPpLSE+O4hSW/EEW/axMaPYZJ7xjln9LKKIpcrFeICcIW5OaIljD6pL/P/mjAjCgDk3KGtYhnKjE/BgY6FUsUTSzZ+qLPaYcUsfBIBZowB8fCAKWhXkC0kpJ8Y+QIIjngiZMRYzCtbC0MJTrMprRh8vAHuSGXzSh6n7btcQ1/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678964; c=relaxed/simple;
	bh=yo+5pijNTMwmqWFlMlY2nS+EN4AqIMiUf/48r8SNlyU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bOQlCFDAC2Gcz2GLyXolZmokjicEy+BkYWr//7Nn5DEiheue50kroTq/OnCnfVuqKWKFwA19rgkJ5ifVyxJWIuNUdrz0FUK4ZtdnYC+e1p1RIimYm8U5ZY3N4827dNmAhJ6jYIBuaY3jNXx7wVkUhhCQTnQSod3MeKIeDYOzlMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fGwCXvk/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fGwCXvk/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso418385e9.0
        for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 14:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789678959; x=1790283759; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=097ql+3Z1IlDXg0ya0fn2DItRG2p3HsUzNgnRrCaa70=;
        b=fGwCXvk/jzjQgOHAP0IIA+My1qnnA164xMEFZxwpPeVbW4Su1Tv1hRqTL7k/Cl/Jp0
         w0UX3o0YbYMOPQDFjzF3//05kzm32VXwnjzDcPWJqfhO7acKkf1OkBRguxecmIp62Dmu
         XflQxpxlSUpiAgws3PNvOE7gltll0IYbO/y+WX6iVNdqBK3QG1w1h/f/PdInORor30NE
         +zKbUgy50QVCDDwDaUY5N4QZ2rGzJQYcetgQ+GCGsBthlNhhUd3OKrAwIqdntkT9MEoy
         ohFklTfYsH4fQQInikPgJ84NjrvxW2/thl0iiy94O2Ql8yixD335ErZDos2HPajptvzu
         iq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678959; x=1790283759;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=097ql+3Z1IlDXg0ya0fn2DItRG2p3HsUzNgnRrCaa70=;
        b=rtqFXOYDJIVUIhiIyAP3mR7pQ9rD+ReesNMzMmyPVbskpVZw1pmpGuX4fREHS1y+n2
         UV3g2vXWLzE9LACx97WfOzHqPEoU6gabdkHcQ8njc4thuX3SkzRDYL0TMjRTrddusThf
         r15pm2jnmcDb0LtFmJ20xr86JNGOKUSuPQbyUdhVzVrvnSousMIoqyYnjT9n7DcKH/y5
         AkjS6np80R6z3Jaes9lj7LkeUob3mv6+14Nc1sQ1hOMTE3AXFmUZqzh8NDKqK3vSAk/S
         tuNpiKkT81GVBOXaE1qeiP5XNgaWP30aRgUBX0zDgDgCj/6ZvE/znqtKkaE+X3fhLfQR
         Q/xg==
X-Gm-Message-State: AFuF++l0XxzN4lMx/py1krPOVxKQpagAjnn1vmjxNPG0CEa9QZeYgnsm
	fBKLS96E4nvoy9/vPobGXoQS5Rr9RA7bArUOGCf+uT7wpGMOHBDobax75+xaeXxTcJU=
X-Gm-Gg: AYBFou1eWVqOCfJItr57R6jCNaiYi7GQZ8M1tfERyRAqYnlnUJVYdj69eWO71jBb2IS
	tI/QOv6N15D8gVxyrRnw2SleCMe1HO5cOQrAf1X9jIO6VCFWB8w3Resen6kcJvc9tSL3ULErZUt
	joXd28X3FBQuFyF9DjNjc5wmYayqTyvAlL47DOtP+6XI3H61R3rR/G2pwZQxWSVew1TzXE/K+Ip
	w4/5X4zm+VCkYK0VpS0LusrCGlCwqf8UesIV5mXoa6Vnh3YBgJLqbcBtKQHxgyk6/UoRXgMzoQy
	QfbUvyVRhCEmW2jcGzO1EOs8TPHoXeBPHxw0bHWcIakHN/RBFEKiSdjKmP4vzGvmK/QPyJAh57K
	+f4Id3lBiuj1pHpOQK/qagcfqBKqePfF84SBMULHOZj0oA8ooo/7ZKS4rBVr4aqNEtgBEi7cEt4
	sZIbqBtOQVOmCKijodz6FsGmaFy1TzQh8aCPfPYKxvvbhtWqXyBLEnH/7MjOnixoDjWrCPlBVzu
	R0c
X-Received: by 2002:a05:600c:1993:b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49fc56dbc54mr1780725e9.3.1789678959379;
        Thu, 17 Sep 2026 14:02:39 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm3106095e9.3.2026.09.17.14.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:02:39 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v2 0/6] ASoC: meson: gx: add base support for I2S audio
 input
Date: Thu, 17 Sep 2026 23:02:30 +0200
Message-Id: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGZVrGoC/y2NwQ6CMBAFf4Xs2Zq2olBP/ofh0JZF1mgxLRAJ6
 b/bgsdJ5s1bIaAnDHAtVvA4U6DBJZCHAmyv3QMZtYlBcnnh9UkwPbXkmLLamPLMrVUlJPfjsaP
 v1rk3O4fJPNGOeZyNnsI4+GU7mkX29qYS8t+cBeOs6gx2qGRdCXEzenmR8Xi0wxuaGOMP4jULB
 K8AAAA=
X-Change-ID: 20260831-audin-9cabb450cc94
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4682; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=yo+5pijNTMwmqWFlMlY2nS+EN4AqIMiUf/48r8SNlyU=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlrQnO93i26K/tHIHTLnPNu+qUWR+Py14V5n1Jn7zgvX
 HCY/eSLjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEzk1gGG/95XDHp/tlSdjlm6
 sIgl3la1lON2543739bvSNN8WGqm94Lhf6icUaf6z3uvcphl5todU+qw6XPJCrtx6wpf0F2/Dbv
 k2QE=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

This series is the 2nd part of the initial RFC [1] proposed to add audio
input support to the Meson GX SoCs. After the AIU reshaping series [2] that
has recently been merged, this one adds the audio input path itself.

Apart from some glue commits for gx-formatter Kconfig split, DT, bindings
and integration with gx-card, the core commit is the 3rd one, which adds
the AUDIN driver.
This is the counterpart of AIU for capture: it gets the entire register
range, it handles peripheral clock and reset, it instantiates the I2S data
formatter as widget and FIFOs as DAIs.

Resulting capture topology is:
  pads --> AIU I2S Encoder -> AUDIN I2S Formatter -> AUDIN FIFO -> RAM

This series includes all the changes related to this work (dt-bindings,
drivers and device-tree) in order to give the full picture in one single
place.

Unfortunately, since no Meson GXBB/GXL board available in the tree features
an I2S capture capable codec, this work cannot be directly tested out of
the box. To test it an external codec must be connected to the SoC.
When working on this series, a custom hat board with an NXP SGTL5000 codec
has been plugged on top of an Odroid-C2 (GXBB). The last commit of this
series fully details all the device-tree changes which are required to
finalize the support for this scenario.
With this hardware configuration it has been possible to successfully
validate the implementation with:
- alsa tools (arecord)
- pcm-tests

[1]: https://lore.kernel.org/linux-sound/20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com/
[2]: https://lore.kernel.org/linux-sound/20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Changes in v2:
- Dropped FIFO child nodes from AUDIN in device-tree. Now AUDIN is the
  only sound component and FIFOs are its DAIs. This is the same design
  used in AIU. [Krzysztof]
- Renamed driver compatible, using 'amlogic,gx-audin' as fallback and
  'amlogic,gx[bb|l]-audin' as SoC specific. Fixed also other reported
  comments on the binding. [Krzysztof]
- Adjusted headers inclusion in 'audin.c' and spacing in the empty entry
  of 'meson_gx_audin_of_match'. [Uwe]
- Replaced 'snd_soc_component_read' with 'regmap_read' in 'audin_fifo_pos'
  in order to prevent sleeping in atomic context. Also changed the hrtimer
  from hard-irq to a soft-irq one. [Sashiko]
- Added 'sync_stop' callback in 'audin_component' to ensure the hrtimer is
  fully stopped before attempting to restart the stream in a
  "start->stop->prepare->start" scenario.
- Link to v1: https://patch.msgid.link/20260912-audin-v1-0-7fbefe928711@baylibre.com

To: Jerome Brunet <jbrunet@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org

---
Valerio Setti (6):
      ASoC: dt-bindings: amlogic,gx-audin: add schema
      ASoC: meson: build gx-formatter as a separate module
      ASoC: meson: add AUDIN driver
      ASoC: meson: aiu: add I2S Capture DAI
      ASoC: meson: gx-card: add support for audin FIFO
      arm64: dts: amlogic: gx: add AUDIN node

 .../bindings/sound/amlogic,gx-audin.yaml           |  66 ++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |   9 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   6 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   6 +
 sound/soc/meson/Kconfig                            |  14 +
 sound/soc/meson/Makefile                           |   7 +-
 sound/soc/meson/aiu.c                              |   7 +
 sound/soc/meson/audin-fifo.c                       | 367 +++++++++++++++++++++
 sound/soc/meson/audin-formatter-i2s.c              | 174 ++++++++++
 sound/soc/meson/audin.c                            | 186 +++++++++++
 sound/soc/meson/audin.h                            |  30 ++
 sound/soc/meson/gx-card.c                          |  16 +-
 12 files changed, 880 insertions(+), 8 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-audin-9cabb450cc94

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>

