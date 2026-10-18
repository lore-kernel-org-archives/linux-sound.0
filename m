Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1E732FA18
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 10:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318722; cv=none; b=fBFWDU0/l9KnN5kj7i19DYQKVBzgnjoMo/WQJgjoc+eYn/mqwn3HbqtmvOWso/MM/eIUkpmU7kUtEvffF7fZEFQJwExdyfgNo/2vWFqEMkDUpwWrcHGdPuCbO+ov5MwFlR9x6KCQ8jaf1EtQtZDwklbfbfHR9iNmMu9kER4w5dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318722; c=relaxed/simple;
	bh=b2LrlLkZJEXop3ZA4rJS2x0ZvQcjdTqgRnxGJins/e0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mfN+CIeD29717ArpwdENoUpRNGQ/4yV5JH/gqk2pgArGw0dfJJHAyxDLEjd8/vOIfGTHvf/t3lmzhiDEZOCwng8VjaMWzFjE5UVuC8ep0lNqEqaVLp643Rc2WBck+IDhSmgCbbiOmvQzhQ4Jo4clM2CPhxaiQZh+iwlL2wMbLVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SS3HdWo9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SS3HdWo9"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so829994f8f.0
        for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 03:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318718; x=1792923518; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c8IHe+CUIm/KPhpOQ7ziP0T0YfArguySEnc0dVC2++w=;
        b=SS3HdWo9s/1drXLJ32SHDRnbp+cO39gw/M90ypVVhWGIhlRF9iFvpr0tACoEAKqys/
         6vibIaAjUtOuvn8KFiyv7QbcSHVOgnAmx+3GbqMAEryhaY5xSGE7pJlLaCaSyTIFvHFb
         64dQXFB/KlNdLu9liU3hOMthR9WfAbFCOmJ7ETo2aWbBC4sKaB1lhO04zb+VB1fcy/9h
         OiNqYXkmkET7f9tawVsWbLyzZOsZIc4naiyzbTxO/v2jXLAnGs4Uo1ayPCBh7ZKpBR4N
         CfNadBci5qUGBXaiL9KMCnV7LOMEz+9Ozz1m7tpZeSPtuyaFtxlERttb+FA9I1jvMuzD
         Zryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318718; x=1792923518;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c8IHe+CUIm/KPhpOQ7ziP0T0YfArguySEnc0dVC2++w=;
        b=RrJl19RIy2WmWb6nK93oI9KGeP0oBpnY78sUtfOUSnxH8wWz+MlfOf/bdvdvSK8RRJ
         4y784yIoUVUrtO2VmNfinQwp0vU7tPrwmFcnMMlE8FrAyVCA+S2+CFm22dXTqAUWoy2I
         XIGk2c1IP2AuOi5Fuj2WpvTPeJMF6caGLExIEHZoqfpH6Mv92PcdszJuDYG6BiE2gGPl
         dxcCxEXveKuuGCKun6I3IPVvzpGro21kxLZlpDCKbzxUvmNKCyMji7YEznCYxMv4IWGs
         oyIr39nuFE5aUojTnGZvBM473BfkhuZ8222QtjN7AC6E0AZjDwTxmyevvSCrLyAADePo
         p5uA==
X-Gm-Message-State: AFq9FYJ2hVUtwG4qz4Iweh9OMgtHqNwjYj6EPygUEVedC7xIFqA+CX5X
	AA5uTagjQE2ngxBoxtBcupkpNwj5V8W825sXT/eCftj7lMqxJjzatyowbVEIZDOZ6lc=
X-Gm-Gg: AYBFou0kkAqg6j1wa1KHsxo+o2i6yCqMvb4doGyH0VCLhHz3/JxyCBXgEJV05KG72u8
	Mq92rYo/K2fB70hsi3SJMzB3yWQ9+1zAIrw3fTg313md7YxaDihYveNlLTyyuJupczPXWJtJ4n2
	Y0wSN8v8gGu5CQNYZtPn4pm4DYVhw586Gg/rs0xI8z6uL5kO7wyCDyWdKmYbSQr4eJfNbrECYez
	sgq6zE5EF/kqyV0VqgH0r7yPZQQsevO96O1g49YelnQpKT6ez44+aJoEK3E/64Wvq4m5NiCDLaf
	E4cZkDPDgWFAqnXFc5fqu2jV+W2WL7ebyvBso+HIX/opgegfXB6exura1I4cEC7gMAqEjN7J91n
	rhzBJCpr0p1eyqXw0gM2s85tf6H5VFkb7+aKbA5mv8QmOkpL9JhjqCKvY/fMBgL4qLCUUEhbupv
	QBDi9AR6TvjnA9v22b2E1bSIkCj4u4plauZrAVcHH9i37co9df8YW8dHgM6wQU+vJlItJx
X-Received: by 2002:a05:6000:2c0d:b0:48e:d40:a87c with SMTP id ffacd0b85a97d-48e0d40aa21mr6538051f8f.16.1792318717509;
        Sun, 18 Oct 2026 03:18:37 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:37 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v5 0/7] ASoC: meson: gx: add base support for I2S audio
 input
Date: Sun, 18 Oct 2026 12:17:57 +0200
Message-Id: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANac1GoC/23PQW7CMBAF0Ksgr+vKM3bshBX3qLqwJ5NiRBNkg
 1WEcvc6UBCqWH7pvz+ai8icImexXl1E4hJznMYamreVoK0fv1jGvmaBCq1qNUh/6uMoO/IhmEY
 RdUbU7iHxEH+uOx+ft5xPYcd0XPDS2MZ8nNL5eqjA0rttdoB/mwWkkm4IPHCHrQPYBH/ex5D4n
 aZvscwWfIbuDrFC3fZsAkHP2ryA+gni46Ku0DurNCApZ+kFNA8ISt3fL6ZCNM5aYwHa0PyD8zz
 /AoLBkC1aAQAA
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
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6232; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=b2LrlLkZJEXop3ZA4rJS2x0ZvQcjdTqgRnxGJins/e0=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vxSkio3mFTiavE/8c/aMrmL3DMnf3thHGFmHOKk7
 zDhmLtNRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACaS5MTIsO3//9BLYjrWwlNP
 yKgtOfpCmfPtha9qH7q36HovYnjScZfhf/2WbV8StuizPj9rKqB/4JBL/ZOfbBG5Z2ZIF07v2s+
 oxwkA
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
Changes in v5:
- Take the PCM stream lock in the FIFO polling timer callback and skip
  re-arming it if a trigger already did so, fixing a race on quick
  PAUSE_PUSH -> PAUSE_RELEASE transitions. [Sashiko]
- Cancel the FIFO polling timer in the DAI 'shutdown' callback, so the
  timer is guaranteed to be stopped before the DAI data is freed on
  driver unbind. [Sashiko]
- Fixed commit message for commit 'ASoC: meson: aiu: add I2S Capture DAI'
  as requested by Jerome. Since the code is unchanged I kept the
  'Reviewed-by' tag.
- Link to v4: https://patch.msgid.link/20261001-audin-v4-0-2476646118b5@baylibre.com

Changes in v4:
- Dropped the family compatible 'amlogic,gx-audin'. 'amlogic,gxbb-audin'
  and 'amlogic,gxl-audin' are now the compatibles for GXBB and GXL SoCs,
  respectively, with the former also used as fallback for the latter.
  [Krzysztof]
- Link to v3: https://patch.msgid.link/20260922-audin-v3-0-a760312c076c@baylibre.com

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
      ASoC: dt-bindings: add amlogic,gxbb-audin
      ASoC: meson: build gx-formatter as a separate module
      ASoC: meson: aiu-encoder-i2s: ensure clk divider gets disabled in hw_free
      ASoC: meson: add AUDIN driver
      ASoC: meson: aiu: add I2S Capture DAI
      ASoC: meson: gx-card: add support for audin FIFO
      arm64: dts: amlogic: gx: add AUDIN node

 .../bindings/sound/amlogic,gxbb-audin.yaml         |  69 ++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |   9 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   6 +
 sound/soc/meson/Kconfig                            |  14 +
 sound/soc/meson/Makefile                           |   7 +-
 sound/soc/meson/aiu-encoder-i2s.c                  |  12 +-
 sound/soc/meson/aiu.c                              |   7 +
 sound/soc/meson/audin-fifo.c                       | 392 +++++++++++++++++++++
 sound/soc/meson/audin-formatter-i2s.c              | 174 +++++++++
 sound/soc/meson/audin.c                            | 188 ++++++++++
 sound/soc/meson/audin.h                            |  30 ++
 sound/soc/meson/gx-card.c                          |  16 +-
 13 files changed, 914 insertions(+), 15 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-audin-9cabb450cc94

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>

