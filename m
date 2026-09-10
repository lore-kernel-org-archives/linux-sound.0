Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F0549E150;
	Thu, 10 Sep 2026 23:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789081435; cv=none; b=bKfwy2xriOxG6csZXP+dPztS557EXKTPZIuai6FWyYyX2SmbaYpgxDix1GYeTVwW1gVC11MvZsF3yDWQWp8QnlIRph4wIutgmGgjBJeIHFX19sC9+seR/4b8mpCi6IHWzR7EbjFlveckQFFGjSFTohaGz5EGWncbHk2vApukD74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789081435; c=relaxed/simple;
	bh=JvayKAUHtl0/7ceCWE+bDyGL5KmqDm+5rPOEn6Z9CmU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l9mCSuqBG3tsXJHje8nOrRsNonK9x4l5KIFUXBt8QlBNnKIiDT7MUzlAiWj/8YETcFWBQxAFQC6uC/V4CXJAorVriVTLjUVEq3/7jFPSdqP1nIrKzVUPVvrscipR6Qf3zy36eOLoDYPyNbpa6D0KpFdbZKUKRzSPIXOw81KZ7KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOy3+fyj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOy3+fyj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E577B1F000FF;
	Thu, 10 Sep 2026 23:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789081431;
	bh=mTYWzymPCoGSzNKhHOkyH2nkN511QefDzowWQJLcNDE=;
	h=From:Subject:Date:To:Cc;
	b=SOy3+fyj89sv89DeHpC2BO4vejP3AfdrY3YXIKrFcR0CEFAoPK6qyx8jUI0m0rLNV
	 Uc8igJaMQ9eMtIv7n99x+sokBogwXpLvjk2io7o83dfblag9/FWt9DxOGtYhQMFZ1l
	 6mLPBp4vdDTta6sbfwKb1ORUrJNLk16Nh+vKIMVUnA8znxnYiiD+B3eVM5D7sWqat5
	 tzwapXdcgTW6f73rGER4yQUZ7BpgDr4dENCYToDT5Hgx03JKh6xf32AWQz4mRqS/Ar
	 dM7USEc02x2qqX5B7mvsCsjWC8D73/VsofPCK+bDH3dap1k4uB0ThgZOKjWUMtTYCM
	 IwnXPGj5ayiew==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/9] ASoC: ux500: Migrate HREF and Samsung audio to
 simple-card
Date: Fri, 11 Sep 2026 01:03:43 +0200
Message-Id: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3M3QpAQBBA4VfRXJsa62fxKnIhO5hiaSdS8u42l
 9/FOQ8oB2GFNnkg8CUqu4/I0gTGZfAzo7hoMGQqaijH8y6JUGU7VkbdT+/QkbWuLOpqsAZieAS
 e5P6nXf++H0b4bllkAAAA
X-Change-ID: 20260903-ux500-simple-sound-d077d5486a72
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The Ux500 HREF500 and HREF520 audio support still relies on a
MOP500-specific machine driver and ad-hoc text bindings.

Convert the MSP binding to DT schema and make the MSP and AB8500 codec
nodes proper sound DAI providers.

Move the fixed DSP_A and TDM policy into those links.

Add a common two-link simple audio card named Samsung in
ste-ux500-samsung.dtsi and include it from the seven supported Samsung
U8500 phones.

This intentionally breaks the device tree ABI with older Ux500 HREF
device trees. The old binding and driver have been broken for years and
need a clean restart.

The series has been tested on HREF500, HREF520 and Samsung phones.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (9):
      ASoC: dt-bindings: ux500: Convert MSP binding to DT schema
      mfd: dt-bindings: ab8500: Describe codec DAI and microphone wiring
      ASoC: dt-bindings: ux500: Remove MOP500 sound card binding
      ASoC: ab8500: Skip digital microphone support on AB8505
      ARM: dts: ux500: Add sound DAI provider cells
      ARM: dts: ux500: Convert HREF audio card to simple-card
      ARM: dts: ux500: Add Samsung phone sound cards
      ASoC: ux500: Remove the MOP500 machine driver
      ARM: config: u8500: Enable the simple audio card

 .../devicetree/bindings/mfd/stericsson,ab8500.yaml |  25 ++
 .../bindings/sound/stericsson,ux500-msp-i2s.yaml   |  92 +++++
 .../devicetree/bindings/sound/ux500-mop500.txt     |  39 --
 .../devicetree/bindings/sound/ux500-msp.txt        |  42 --
 arch/arm/boot/dts/st/ste-ab8500.dtsi               |   7 +-
 arch/arm/boot/dts/st/ste-ab8505.dtsi               |   7 +-
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi               |   9 +-
 arch/arm/boot/dts/st/ste-href-ab8500.dtsi          |  96 +++++
 arch/arm/boot/dts/st/ste-href-ab8505.dtsi          | 108 +++--
 .../boot/dts/st/ste-ux500-samsung-codina-tmo.dts   |   1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts  |  27 ++
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts  |   5 +
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts  |   1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts  |   1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts    |   1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts  |   1 +
 arch/arm/boot/dts/st/ste-ux500-samsung.dtsi        |  67 ++++
 arch/arm/configs/u8500_defconfig                   |   2 +-
 sound/soc/codecs/ab8500-codec.c                    | 144 ++++---
 sound/soc/ux500/Kconfig                            |  23 +-
 sound/soc/ux500/Makefile                           |   3 -
 sound/soc/ux500/mop500.c                           | 167 --------
 sound/soc/ux500/mop500_ab8500.c                    | 437 ---------------------
 sound/soc/ux500/mop500_ab8500.h                    |  17 -
 24 files changed, 495 insertions(+), 827 deletions(-)
---
base-commit: 93edb750120a2a73d6732da4662fcdf663a3efe4
change-id: 20260903-ux500-simple-sound-d077d5486a72

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

