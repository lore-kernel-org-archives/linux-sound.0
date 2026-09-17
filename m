Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7BD49505E;
	Thu, 17 Sep 2026 22:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685469; cv=none; b=TN3/jNhoHZq6WeWGpN80I82szYfssSNWfqc+Z2d/aUobnq0GnDkUtbIQ4OQK2kHlIF+Z1jWlwVlEslYFFv0qtv3ju+HQsHdo96VMEqaxDK8mfSDdVOeRcrhBNLswp8FLRDJTD+KGkKjjohVisLKH7GNmBAq/2bpDXvT8RZay1ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685469; c=relaxed/simple;
	bh=7i01UYm+SKffohRu1J2ywe9XF1gj1a3Dd6BO4ulKdF8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ly12zC3sxiqbJL9kOvVAVSuMwOW2vDvqnv26VHH8u0kJZ7Jbc9ooayhk22NLYBLx7QXN0guzJcBmZkFgvhWOztkPT/Jc7KG2fNbE6sBbSjcZEZ60ngkrpi7STu2iPf7Z1FVAGnnaO2bN7hPSnsmy8e83qd3Go0GQcqKQi7k6vIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B0E2iWt+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0E2iWt+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582381F000FF;
	Thu, 17 Sep 2026 22:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685467;
	bh=polrahPXrGaDJCpkbyBjwWQhcyyfprcdb/a+QUCF9lQ=;
	h=From:Subject:Date:To:Cc;
	b=B0E2iWt++m5KrQLCE0PcKkJ73EVoRvL3tuarBnTAnDWYjq5XCKcBuP71FlVmrBGox
	 elaBeDYGhpBPGGMPMdIZbywElJC40tlhfCJbnrLPR49E8ApH0m0stw689DrfYEnBH7
	 ctcRf+cCw7mLM8j/AaIDiyb+wERM8oyp19VyMC8m8l0t86NEdMGgZoCfzlHAcEK0jO
	 89Lgf2U5wD05X7cp+diWXxaVKcEmkQVSdrTaLL8UBA3J3gMFBYeVuC+vDTnTJtnDsc
	 KsxmzLuTgEDCwBIAlfMiETbgFaWjmaMM+PzbmtZEdHKnXp28KX5LNcVCLNcFZ1SZlg
	 P8j3FXC53Lggw==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 0/9] ASoC: ux500: Migrate HREF and Samsung audio to
 audio-graph-card2
Date: Fri, 18 Sep 2026 00:50:58 +0200
Message-Id: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7ZhpBYquvIdhQegIE7ElrRAM4
 e5W4tLle8l/f4XIQTjCJVsh8CxRvEugDxm0feM6RrGJQZMu6UwnnJaCCKM8x4Ex+slZtGSMLfK
 qbIyGNBwD32XZo7c6cS/x5cN7/5jV1/5ySv3LzQoJS2NU0xqVc6WvDw6Oh6MPHdTbtn0A58++j
 rUAAAA=
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
nodes proper sound DAI providers with audio graph ports. Document the
sparse TDM slot masks already parsed from audio graph endpoints.

Describe the fixed DSP_A or DSP_B format, codec clock-provider role,
TDM frame and active slots through endpoint graphs. Add two-link
audio-graph-card2 cards for HREF500, HREF520 and the seven supported
Samsung U8500 phones.

Keep the codec-provided bit and frame clocks running continuously on the
HREF and Samsung links. This matches the legacy machine driver for HREF
and the product kernels for Samsung, and was verified on Skomer.

Remove the MOP500 machine driver after moving its fixed clock and link
policy into the device trees.

This intentionally breaks the device tree ABI with older Ux500 HREF
device trees. The old binding and driver have been broken for years and
need a clean restart.

The series has been tested on HREF500, HREF520 and Samsung phones.

MERGING STRATEGY:

- Get DT bindings ACKed
- Lee merges the MFD binding patch
- Mark merges the ASoC bits including the MOP500 binding removal
- I merge the top commits with DTS changes and defconfig

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- Keep the HREF and Samsung codec clocks running continuously.
- Rework the HREF and Samsung cards around audio-graph-card2.
- Describe the DAI links through provider endpoint graphs.
- Document sparse TDM slot masks on audio graph endpoints.
- Link to v1: https://lore.kernel.org/r/20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org

---
Linus Walleij (9):
      ASoC: dt-bindings: sound: Prepare Ux500 audio graph links
      mfd: dt-bindings: ab8500: Describe codec graph and microphone wiring
      ASoC: dt-bindings: ux500: Remove MOP500 sound card binding
      ASoC: ab8500: Skip digital microphone support on AB8505
      ASoC: ux500: Remove the MOP500 machine driver
      ARM: dts: ux500: Add sound DAI provider cells
      ARM: dts: ux500: Convert HREF audio to audio-graph-card2
      ARM: dts: ux500: Add Samsung phone audio graphs
      ARM: config: u8500: Enable audio graph card2

 .../devicetree/bindings/mfd/stericsson,ab8500.yaml |  28 ++
 .../bindings/sound/audio-graph-port.yaml           |  10 +-
 .../bindings/sound/stericsson,ux500-msp-i2s.yaml   |  96 +++++
 .../devicetree/bindings/sound/ux500-mop500.txt     |  39 --
 .../devicetree/bindings/sound/ux500-msp.txt        |  42 --
 arch/arm/boot/dts/st/ste-ab8500.dtsi               |   7 +-
 arch/arm/boot/dts/st/ste-ab8505.dtsi               |   7 +-
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi               |   9 +-
 arch/arm/boot/dts/st/ste-href-ab8500.dtsi          | 104 +++++
 arch/arm/boot/dts/st/ste-href-ab8505.dtsi          | 118 ++++--
 .../boot/dts/st/ste-ux500-samsung-codina-tmo.dts   |   1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts  |  21 +
 arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts  |   5 +
 arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts  |   1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts  |   1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts    |   1 +
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts  |   1 +
 arch/arm/boot/dts/st/ste-ux500-samsung.dtsi        |  77 ++++
 arch/arm/configs/u8500_defconfig                   |   2 +-
 sound/soc/codecs/ab8500-codec.c                    | 144 ++++---
 sound/soc/ux500/Kconfig                            |  23 +-
 sound/soc/ux500/Makefile                           |   3 -
 sound/soc/ux500/mop500.c                           | 167 --------
 sound/soc/ux500/mop500_ab8500.c                    | 437 ---------------------
 sound/soc/ux500/mop500_ab8500.h                    |  17 -
 25 files changed, 528 insertions(+), 833 deletions(-)
---
base-commit: f41d0fbffacda2322a25d2918191a462fe79667e
change-id: 20260903-ux500-simple-sound-d077d5486a72

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

