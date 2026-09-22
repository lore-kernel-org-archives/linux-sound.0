Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFF455D87C
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 16:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092896; cv=none; b=Ea39xpQSkUKc56CnHK1R/XtJsILLEiqKvPtliN3ASGZoFQgoSRPgAAUeZC+yULQv292IvehQGUY2x3nbG1UIkee9CEwM2CTanfTTN15+rU1U7n1nI0lpthOK9HLbJVLtY+N6k1WqDEln9ZzF20ZmYtXjOG87uKKnpXbNAlEwoB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092896; c=relaxed/simple;
	bh=XzmF4J3qkuosZ/gMZETPgqXgKdShUdzjl28XPraIrmU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZIsZyr/38d803tiu6rl7zs5SRGgUyIHJi/Jla5QjeyTr4uMBYvz3uE2qVCApk92fEYfXO/yjMc6bEf7OYBAMyQM2jUNXlkBH2axzEeywYuSFnnJXSJF1dEh3Tx2PBRg8zeRlmqblT6MnjLYcp7mG4FQ9aHBBgBqElXSpyHdLnyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=iHDR6K3c; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="iHDR6K3c"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso31529865e9.0
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790092892; x=1790697692; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t+p/SUcWdkdCr+nTJjwTsUWB3w3VIv0PTBSmR+PYPBA=;
        b=iHDR6K3cjfwxpkfRE7RvsFHVe/C+mB++IO+n6nQMxK316jH+ytEaB7OW0ouTx4on1/
         l0LSEV46HwtWldV4j85Qs+iGcyioAqgmAR9BIIu5QbvnvZ1wIWjtqYaE+eOEYWR4UkrZ
         hH8+WWzN8ADgLvkMUcXPL2RlVYpAzlh6Dx6lus8lY+sbZv/TCrFAtov5cVQYYTNu6JO6
         K6NV+QevM3WT+4Ss3TPvMgwDLydpX29zHn76Ot0UcwFgEHZ0w+GOsvIYdR2tXn56Rdv0
         eUaZsHMFuI1ZqOCvIYQ7YkQxBi+qSgWllg5X3y6bqhdbhvIXlfFxXw3qCAkU0c8WgfMB
         fPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092892; x=1790697692;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t+p/SUcWdkdCr+nTJjwTsUWB3w3VIv0PTBSmR+PYPBA=;
        b=LMQhyj8Ti32+PFi4qpn61uTMqgy2kq76O+ZVvdeAw/YbntvxLoZ2j6K9ZdojhnvpvY
         ejL5+2WrD48d9aUrOmqloIh+97wnK1qU+T4aNQJfnoK6jA3+ivM+gGcHGWqeajyXUn0K
         qp9KXKRmwhwT5jgPBjxynekSpVNW0vgGvell1Zit0zVONft21EI9OgcP+eFtv5DfrJwp
         FPVRyEdwzSeeEkOGDv5nDciNeajKWFshgNlBsUYvrNfB3Mr6glmaI0YAImEkIInBF4Hb
         ICLhiLz7xB6U3VdMYLcAPLOmnFpJreQznR05wCHxwv6UFOtlDkj+5RoWjMzf1lY6iaxd
         FigA==
X-Gm-Message-State: AFuF++m4ppG4PJ4XeXEhnvpBxuuODg2448yYKqGSz4chc1bEYN0WlfnL
	WW72YYbsbtpOJZ7r2mQ8akorn8vNNG0G/n34/anQ6C8N34VT9hRQbOyvQ45DnlOfwdE=
X-Gm-Gg: AYBFou3gz9N8mwlUst0QOEsep+3vLk+19COw8Rz1ipmHJpzx2tYxrvR66iD9Ls/Ctkp
	Yb1fPc0Nh5+5araCo2naf4oNkY4xymGhGSk7HLsY3q2HTEWYIrAdduIIExWVtJtxFFs/q5sFM6w
	D/c69CnJeEEJgPiALZQDltVsLThO9+/l6fVdBzsoclDO2rjnX4r8RfsBvAMBuBvl3jjfUgrGZKB
	lgD8Nlb6shr3N6cji1R08ocVn0SHoFI3eMiOLtU5f8pKNz8BiF7XtgNGNNAN79vZ61AfM3zIL9h
	PcTPpm0yc/pbeK/Qy+PPfV+RlrfmR61/2kysR/GsurTptHXA6Bv71rDUwRjHZA7lZTI5IBPmMjn
	71cfKwwB5biWBpyOA+epog/cwV9SSSP29LZ9BgdcPaYKS854AOjyEkj5iq7z8e7NXIfp20pCBrU
	8gMvx25kv3di5wp2rBsUCDU9hz/2WTgKRoQDznsoPFFnqjVLAwmCfQabcZh968xaQuGg==
X-Received: by 2002:a05:600c:46c5:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49fc566e635mr200087305e9.7.1790092892009;
        Tue, 22 Sep 2026 09:01:32 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786dc2sm6118020f8f.25.2026.09.22.09.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:01:31 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v3 0/7] ASoC: meson: gx: add base support for I2S audio
 input
Date: Tue, 22 Sep 2026 18:00:45 +0200
Message-Id: <20260922-audin-v3-0-a760312c076c@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC2msmoC/12Nyw6CMBQFf8V0bU1fCrjyP4yLPi5yjYJpoZEQ/
 t0WNDEuJzkzZyIBPEIgx81EPEQM2LUJ5HZDbKPbK1B0iYlg4sBKyakeHLa0stoYtWfWVoqk7dN
 Dja+lc76sHAZzA9tnOS8aDH3nx+Uo8rxbmxUXn2bklNGiNlBDJcqC85PR4x2Nh53tHiRno/gVi
 68okihLB8pY7kCqP3Ge5zfgu7el6AAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5272; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=XzmF4J3qkuosZ/gMZETPgqXgKdShUdzjl28XPraIrmU=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmbloWGXumYF6Siv0A8etvdfGeZbf524n3M16WkV9Q7J
 6gm3fzWUcrCIMbFICumyMIy/d7vglK1h8YJJwtg5rAygQxh4OIUgIm8PcXIMG334pDvBeoXWp6l
 f7mgf3/e1a2vWE14e9/fSe3qqGSdIc7wV9ZHhZ0/zdDOd1Fdas+WS592HXPnm+68SiJqVt0u6XP
 dfAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

This series is the 2nd part of the initial RFC [1] proposed to add audio
input support to the Meson GX SoCs. After the AIU reshaping series [2] that
has recently been merged, this one adds the audio input path itself.

Apart from some glue commits for gx-formatter Kconfig split, a fix for i2s
clock divider disabling in aiu-encoder-i2s, DT, bindings and integration
with gx-card, the core commit is the 4th one, which adds the AUDIN driver.
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
Changes in v3:
- Fixed i2s clock divider disabling in 'aiu-encoder-i2s' 'hw_free'.
  [Sashiko]
- Specified const value of "#sound-dai-cells" property in dt-binding.
  [Sashiko]
- Advance 'last_pos' by whole periods in the FIFO polling timer to avoid
  drifting period notifications. [Sashiko]
- Link to v2: https://patch.msgid.link/20260917-audin-v2-0-38de4bc1de34@baylibre.com

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
Valerio Setti (7):
      ASoC: dt-bindings: amlogic,gx-audin: add schema
      ASoC: meson: build gx-formatter as a separate module
      ASoC: meson: aiu-encoder-i2s: ensure clk divider gets disabled in hw_free
      ASoC: meson: add AUDIN driver
      ASoC: meson: aiu: add I2S Capture DAI
      ASoC: meson: gx-card: add support for audin FIFO
      arm64: dts: amlogic: gx: add AUDIN node

 .../bindings/sound/amlogic,gx-audin.yaml           |  69 ++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |   9 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   6 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   6 +
 sound/soc/meson/Kconfig                            |  14 +
 sound/soc/meson/Makefile                           |   7 +-
 sound/soc/meson/aiu-encoder-i2s.c                  |  12 +-
 sound/soc/meson/aiu.c                              |   7 +
 sound/soc/meson/audin-fifo.c                       | 371 +++++++++++++++++++++
 sound/soc/meson/audin-formatter-i2s.c              | 174 ++++++++++
 sound/soc/meson/audin.c                            | 188 +++++++++++
 sound/soc/meson/audin.h                            |  30 ++
 sound/soc/meson/gx-card.c                          |  16 +-
 13 files changed, 894 insertions(+), 15 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-audin-9cabb450cc94

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>

