Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86F3224AF2
	for <linux-sound@vger.kernel.org>; Sun,  1 Mar 2026 08:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352370; cv=none; b=WqT+TWSIsqbt0o564MUW4W/iYC0YC0crENi+kiuk7J1WwKRsOlGszZPQk0yh0KzPNdGHnDGkKsVu33eU1QAEI1OkKdpsjXBuMA2k/IN59iW/vFlp5bgrQVDdX/rwvqzvS5wFtguZikIC5eGnjnxpYP9I081Fc2q4XoUCL3mkLoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352370; c=relaxed/simple;
	bh=URUffd83HAMRz7HWjO4F6ZoezvrN+kfv+dGBuqFAmzY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iGrPjKmDsk5dgyuQjvi7XBV8RY8i68KF6kXNZqgiiSUZ0xTSrjAJv0qgfsB456Ke44Wh0DPjiI4qUPzcx/xRuU4yPGLgRAeni0tdd6q6xP5Y76I0zSiaUBWq85+Smw8sFRo5K4rZM05bgXH1Oe5b5Yd8flGGZZ/c4ireXz42o0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4CZMD28; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4CZMD28"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c6e5998f90dso1283452a12.1
        for <linux-sound@vger.kernel.org>; Sun, 01 Mar 2026 00:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352368; x=1772957168; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=enGdRrsaB6ZR8xDsA9BNubZAoRwYGJLgTDSI2U7J/do=;
        b=D4CZMD28wTEtL/hk1VvEa3UpeE/BwFb9DqyNAa0HMER3u1X7OM49aQjyP1mJmD48gL
         z1I8Aot7VdCW1wPD0LLDlmkVlFfo7DjBOtfjII8K+5Lnzz/YVDPUUbppYrNbMDVheL56
         KzUR+/ommhy1XgCDQTpL4fAYtL0lG8ES03Qu3UAlyoG7tDplQzxUPtbXYQonW8G+TbZi
         3HEz+RLW4K5zrlNyaQkFuuJU7mBVY5fWBdt4u6cZmyDs2HVU6LRbvBd+Y9NKTmvaVhgg
         CunnpmO2w2TvRxNCXb8CVXUjaXMJsd1PqZ+GRtXLLU/SezVkgndjsCjhOWssrQtNzoTR
         uz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352368; x=1772957168;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enGdRrsaB6ZR8xDsA9BNubZAoRwYGJLgTDSI2U7J/do=;
        b=FpHD4qYa7ne4CZcfhRwnCBoysWrv+uYpZ6Wht8nA8jxlojrJZFm6tyWfXwVqJsw9mT
         Ye2F9JRS0i8vOMbh/c3CzC4aKiorHJiUSr22fD8L+jGnM4qagciShOoczFMbauvjP5w4
         Q5pucU0O5oePplw0zOy3KYWAnj6ekfZiQJWlWIKyhe7XYAbEqQHhEHqdtNolCWWH8hEZ
         kqvdL5a1/DlY9vZTaSoYrzzPxy7cTHqpjoxvE+LUX1EEvRCKV+4ahq0ctm9t2Bsjpbfk
         s3QsJcSzo+xhqf1QgjcRDeVPOA8sd8jRBpK3V7idaDBbD+17vCfiSrhyGRjbFLkeWqWY
         x3Iw==
X-Gm-Message-State: AOJu0YwQltejloN/5flSCNsCqroeHwbt3+BxjHP8ZQhd0ieKdzkdvDoN
	NNZeCYQ5eqpIyPjlg5XTpHx1SQWz4KYPEtub4B1HnC4nMlW6Lh+Cz/NE
X-Gm-Gg: ATEYQzxK5iyuEvo6w8k2A3gV7cKcUNqaMfXXcfUVibpl64339A3XJZOrhyoyIbdgVqP
	zHPnONn9aadsKkwNgIRhDMv1MlTtEfNXSo9qqYSLg3unGqUBDC/YMfbJLhINpcT/fjcO1MQ1Pyg
	F7ojMcIYajRUykBkJsL54I7pkNFWrL54Z1DTOgG7uSeLLZkV2JFqJZkVvPNwVNA2GiuLOfWz8Sj
	VWowQqyq5dlnXeGmwwsC7zf/GmMC+yDrH5XnlAJMwIThBR985oycTXL23YzZ/pOaNxB3LCuMLx6
	jzcHJR/1SgEzcijIvuuR10d0uHcg6OWH0VXg7/zZ7FO6rosbeakhra3/s/EgmCONC00R0tcB8Ex
	EDKIBdh3IfGKtQL8BaaBQLiUX1yT6ElqU8aoPJ0PjjfMLCIrrwKqNY3dIcunBybjAP6zlwIFAGk
	jvGvr8Zy1MTYlRYiHkC/dp3LM5R52jlsZm5dWhxzZhIqRqpUsUf3534MixvbigdaKqgNZsDi5gg
	2Pgt2P8PTlfYnWLotBbVlMyFGd/VajiUCEiOhQT92bFiof4b2lSq5R/KYoGPMHLFcx3TmuS0c3f
X-Received: by 2002:a17:90b:3dc8:b0:359:8727:6448 with SMTP id 98e67ed59e1d1-3598727677amr1667062a91.17.1772352367924;
        Sun, 01 Mar 2026 00:06:07 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:07 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v3 0/7] ASoC: basic support for configuring bus keepers
Date: Sun, 01 Mar 2026 18:05:19 +1000
Message-Id: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD/zo2kC/2WOQQqDMBBFryJZNyUTrdSueo/SRUxGHVAjiYQW8
 e4dhYK0y/eH95hFRAyEUdyyRQRMFMmPDPkpE7YzY4uSHLPQSl9AK5CzG3jqUcbez1GCqk3Fp9K
 ZQrA0BWzotQcfT+aO4uzDe+8n2NZvqvpNJZBK5ldn6qasrQK8t4Oh/mz9ILZU0gdd/32SNOvoC
 leVBeQG7VFf1/UDGPBWnOsAAAA=
X-Change-ID: 20251201-tdm-idle-slots-10ba92516da4
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4466;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=URUffd83HAMRz7HWjO4F6ZoezvrN+kfv+dGBuqFAmzY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLPyd/fhnxamfW29rG17umLWie13V2beT0qq2a6eqtE
 QcdY+zUOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFNtdoSRYV9L4Ay5BVaLZm0u6XvVO/Hwo2MZma/kv+7bmvqBd+vrkNOMDO9jLdO
 Plvya5iNc9fXvLK+ggHPZ6htE1QM9TIIXXm6R4gcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi all,

This series introduces some infrastructure to allow platform drivers
to specify what a DAI should be doing when it is not active on the
bus. The primary use case for this is configuring bus keepers which
may be integrated into various codecs. The instigating use case for
this functionality is an interesting bus topology on Apple Silicon
laptops with multiple codecs.

Most Apple Silicon laptops have six codecs split into groups of
three, driving a pair of dual opposed woofers and a tweeter for
L/R stereo sound. These codecs report the voltage and current across
their connected voice coils back to the SoC via the SDOUT pin,
represented as PCM data sent via configurable TDM slots. This data is
used in conjunction with the connected speaker's Thiele/Small Parameters
to ensure that the speaker is not being driven to levels that would
permanently damage them. This is integrated into CoreAudio on macOS.
speakersafetyd[1] handles this for Linux.

All of the codec SDOUT pins are attached to a single receiver port
on the SoC's I2S peripheral, however are split across two physical
data lines (one each for the left and right codec groups). The receiver
has an OR gate in front of it, which is used to sum the two lines.

If at any point a codec is trying to transmit data, and the "opposite"
line ends up floating high, the transmitting codec's data will be
corrupted. We need to guarantee that the idle line stays idle.

In the downstream Asahi Linux kernel[2], we set up one codec in each
group to zero-fill or pull down its line while a codec on the opposite
line is actively transmitting. This is done entirely in the codec
driver, however this approach is over-fit for this one use case. This
sort of functionality may also be of use for other hardware, so following
previous mailing list discussions[3], I have tried to expose the
functionality in a more configurable and generic way.

I have integrated this approach into our downstream platform driver
and select Devicetrees as an example of how this mechanism is intended
to be used[4].

Regards,
James

[1] https://github.com/AsahiLinux/speakersafetyd
[2] https://github.com/AsahiLinux/linux/tree/bits/070-audio
[3] https://lore.kernel.org/asahi/20250227-apple-codec-changes-v3-17-cbb130030acf@gmail.com/
[4] https://github.com/chadmed/tree/tdm-revised2

---
Changes in v3:
- Rebased patch set
- Elided unnecessary $defs in tdm-slot.yaml
- Referenced entire tdm-slot.yaml instead of per-property definitions in imx-audio-card.yaml
- Changed repetitive TDM slot property definitions to patternProperties in tdm-slot.yaml
- Link to v2: https://lore.kernel.org/r/20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com

Changes in v2:
- Reworked tdm-slot.yaml schema to silence dtschema warnings
- Properly referenced new tdm-slot.yaml schema in affected bindings,
  again silencing dtschema warnings
- Add PULLUP and DRIVE_HIGH as possible bus keeper modes
- Reworded commit messages and cover letter to more clearly explain
  what the goal is here
- Link to v1: https://lore.kernel.org/r/20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com

---
James Calligeros (7):
      ASoC: dt-bindings: convert tdm-slot to YAML
      ASoC: dt-bindings: update tdm-slot.txt references to tdm-slot.yaml
      ASoC: dt-bindings: add TDM slot idle mode properties
      ASoC: soc-dai: define possible idle TDM slot modes
      ASoC: soc-dai: add common operation to set TDM idle mode
      ASoC: tas2764: expose SDOUT bus keeper via set_tdm_idle operation
      ASoC: tas2770: expose SDOUT bus keeper via set_tdm_idle

 .../bindings/sound/imx-audio-card.yaml   |  9 +--
 .../bindings/sound/simple-card.yaml      | 14 +---
 .../bindings/sound/tdm-slot.txt          | 29 --------
 .../bindings/sound/tdm-slot.yaml         | 52 ++++++++++++++
 include/sound/soc-dai.h                  | 22 ++++++
 sound/soc/codecs/tas2764.c               | 95 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h               | 11 +++
 sound/soc/codecs/tas2770.c               | 75 +++++++++++++++++++
 sound/soc/codecs/tas2770.h               | 12 ++++
 sound/soc/soc-dai.c                      | 40 +++++++++++
 10 files changed, 312 insertions(+), 47 deletions(-)
---
base-commit: d898041bfb8667f4bad10abba5dedd7edd88c751
change-id: 20251201-tdm-idle-slots-10ba92516da4

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

