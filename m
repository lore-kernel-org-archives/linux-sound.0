Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4B946AEC5
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 19:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768935974; cv=none; b=bJ1hkCKwMCgMG+yA2O5QBcWfeToyKwAWPwdjMmjbj1KV8UHt/LP4GkuPo2K88Uy8oWDpX7Gwx+0lRqU5x5ZVU4+ModL4AYlOh9htBg+sDT59TQtq908M5Z60vsCIkyKjwdyIofdvk8anLNWkR6ACagPN+9sNV/ZEwNQT50O8kZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768935974; c=relaxed/simple;
	bh=/i53vqMAIdZNSQKjWuPjGV+34T+Veokykl4U0XdsoqE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sX0nrGDBDAHtMmtQe2K8HQ/LyIE4j69fRA/AJwVNHHgFZyEGys4c+myVM7Rlt+ET8Au+IX4n0ekvDUVRLkicQDZ+bWhTFVVA48ydsHcpPf4ZY1ChhpYYRqwznrz1w12cMmjs05yS9v76Uvuqxb0yMZiLGTcltMqx3fIrf7tAlMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agjJnO6A; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agjJnO6A"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee2715254so27220505e9.3
        for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 11:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768935970; x=1769540770; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ef5XZssjPJck2vo2ZHF3UBv8KXbka0JYdX8WDR+tf8=;
        b=agjJnO6AiQ283QSuwOgwsqkfSEkjCdIkMLE9frJn8XS2iCoKTjJcRUMguXba/XQ11V
         bLj1O+3S0z6uhiCyZ+IC+xG3MoNXGGAJrq+KJY5vPi4ppdUurF6BFiK8kQC5KXZ5FWgV
         q01B3Z8BeCoEH1BqmCdo+gGM2M0u5Cl1N/0fLMZ137tJvrOdMn5MISbe7q6xv2QzLoVo
         y2crGoDskg6E4Do50SxMQUy2X31alSHDBkooD+UwO60dlBPvGGm5zMWotEihmvED7qTH
         DKVTImZe49tBEi7SCWz+7CoA5sy3yfNLXd4wn/qq47LtCUNDb/XT9WT328p4ZkVEFwMQ
         +g7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768935970; x=1769540770;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ef5XZssjPJck2vo2ZHF3UBv8KXbka0JYdX8WDR+tf8=;
        b=i1V8lRV6PmajzJ46x/0bfty098VeYV4Am6JVnICrGxEFvhol6XdY+hk9BXYOPBQeAp
         baLYIVxlJc07bFhZxsikla/JryN0FELJLdeQgx69tg+UH1ojfgBwDA8KwxAfqikco8lS
         yJl46p848/7+vpARKXUsH7t8E8gD+3ANKgxaicpv+HLnoUDF0jhkdmLHOWNEqMPL5mwl
         oca6hNALugeVPW0f/A5IQPo6sj4FripxnW8qaR072AAfBS6zsimmjKXByFsW9sgu5cIJ
         EP/VLQWe78HDBB7CuU9dpj3dsrJGir3QedkK1Io0Br32Tn9+DYAOPtHbHPCHS0vQNgYY
         9Z7g==
X-Gm-Message-State: AOJu0Yw3LZ8TngXkNTVcT5sOxIvQbVKSraqJsQ+usElMwe6vegJf2voT
	gtwxRHJ85f0OXW16ntW42wyDC4mxBux48vEaLkDgJ+nUCq/RmllbhePK
X-Gm-Gg: AY/fxX5H6+UGadcCgGR7Y9hNdfe7CTEY/k0qBL7E8jCt7Khpd+r30rwLYnFcdEeVLSF
	JzG7gmevcVoxvtMIMZxLHGkI+t/qTHiyFvMX1V3EFBICjj7/2wyFX6SehcO2s65NmAKfIVGmCAB
	xcFfC42BL15PcXVNlI32uTpjkJkKVd+WXJ/rqQQ6/0ulRiCVzBtv6gjPm9ElHafPEsQwTgwKQS5
	P5N3ASQk9+nc2UcLm5RBpOTEGy5j1r2xPGgE8h7n3sMZFEXvsudplvF9rARgFdZs25ocu9r7jxT
	1notAExPUAFr6Zzeo4tkPMor+DdPX/lr0z01dN1QiukVT0iqsh0BpajCrSka2FoUElG7mNSzxRN
	IX7Pc/qF6zpZln7TWAtYalPHAy/vW1kZKgaaMo13FOk9QwEHGoMIPhiym3OA1GPKZLdkUjPOhpn
	JzkXkUAZEIsVpReYX2ZONuQYUfnqOXOSQcpm3K8O1YO5QN
X-Received: by 2002:a05:600c:3b90:b0:477:7991:5d1e with SMTP id 5b1f17b1804b1-4803e7f184amr42521595e9.25.1768935969900;
        Tue, 20 Jan 2026 11:06:09 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804244c6cesm2005735e9.0.2026.01.20.11.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:06:09 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH v4 0/6] ASoC: sophgo: add CV1800 I2S controllers support
Date: Tue, 20 Jan 2026 23:06:02 +0400
Message-Id: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABvSb2kC/33OwQ6CMAyA4VchOzvTDjamJ9/DeGBsgyYiZjOLh
 vDuDk7EEI9/k37txKIL5CI7FxMLLlGk8ZGjOhSs7ZtH5zjZ3EyAUIAoeZtQAxhOInIbKLnAK4+
 1LpV1rVQsLz6D8/Re0estd0/xNYbPeiPhMv3LJeTAnTZCGC1r3ZhLNzR0P7bjwBYuiS2hdwmRC
 YsAUnqVX9O/RLklTrtEmQmoAJSvENHWW2Ke5y/oNJfUOgEAAA==
X-Change-ID: 20260115-cv1800b-i2s-driver-4f17836dec56
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768935966; l=3943;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=/i53vqMAIdZNSQKjWuPjGV+34T+Veokykl4U0XdsoqE=;
 b=ujF7DVpfDFcIqiJ+hFjkIaX7+EUYOaYF0ozWAVYPkNGd1jyRyVhNuGdrz0jshI7mm1Kg9d0Qb
 sJKZFL2jBg6DCRGo2djEfdHrar5RiLYCQUyiZ/fUOmy3va0Uf+jz6cn
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

This patch series adds basic audio support for Sophgo CV1800B,
as used on boards such as the Milk-V Duo.
The series introduces the I2S controller driver,
the DAC and ADC codec drivers, corresponding DT bindings,
and DTS updates to wire the components together.

The implementation is based on vendor documentation
and testing on real hardware.  This series relies on
recent fixes in the DesignWare AXI DMA support;
in particular, correct operation depends on
the DMA changes discussed at:
https://lore.kernel.org/all/20251214224601.598358-1-inochiama@gmail.com/
The current driver implementation supports a fixed audio configuration
of 48 kHz sample rate and only I2S protocol which is used in codecs.
The series has been tested on the Milk-V Duo 256M board using
the Sophgo SG2002 SoC. The implementation is expected to also work on
Milk-V Duo and Milk-V Module boards based on the SG2000 SoC,
as the audio and DMA blocks are closely related.

Known hardware limitation:
On CV1800B / SG2002, the I2S2 output pins cannot be enabled via 
pinctrl alone.  Due to SoC design constraints, the output path becomes 
functional only after additional vendor-specific register programming.
This series makes the limitation explicit and does not attempt 
to work around it implicitly via pinctrl or undocumented behavior.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
Changes in v4:
- fix issues with i2s bindings
- rename commit for codecs bindings
- make single bindings file for both adc and dac 
- Link to v3: https://lore.kernel.org/r/20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com

Changes in v3:
- Kconfig: add SPDX.
- sound/soc/sophgo/cv1800b-tdm.c: add const to cv1800b_i2s_dai_template
- sound/soc/sophgo/cv1800b-tdm.c: drop unneeded debug message 
- sophgo,cv1800b-i2s.yaml: removed address-cells
- sophgo,cv1800b-i2s.yaml: reword for commit message and header
- sophgo,cv1800b-i2s.yaml: fixed dma-names node
- sophgo,cv1800b-i2s.yaml: clocks min-items fixed 
- codecs bindings: squash
- codecs bindings: unevaluatedProperties: false, dropped redundant
  description 
- fixed build error revealed by test_bot 
- cv180x.dtsi: removed address-cells in i2s nodes
- Link to v2: https://lore.kernel.org/r/20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com

Changes in v2:
- Updated cover letter.
- codec nodes moved to cv1800x.dtsi with status=disabled
- the commit with dts example for 256M board was removed
- added details in commit messages

- Link to v1: https://lore.kernel.org/r/20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com

---
Anton D. Stavinskii (6):
      ASoC: dt-bindings: sophgo,cv1800b: add I2S/TDM controller
      ASoC: sophgo: add CV1800B I2S/TDM controller driver
      ASoC: dt-bindings: sophgo,cv1800b: add ADC/DAC codec
      ASoC: sophgo: add CV1800B internal ADC codec driver
      ASoC: sophgo: add CV1800B internal DAC codec driver
      riscv: dts: sophgo: dts nodes for i2s tdm modules

 .../bindings/sound/sophgo,cv1800b-codecs.yaml      |  46 ++
 .../bindings/sound/sophgo,cv1800b-i2s.yaml         |  67 ++
 arch/riscv/boot/dts/sophgo/cv180x-dmamux.h         |  57 ++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  55 ++
 sound/soc/Kconfig                                  |   1 +
 sound/soc/Makefile                                 |   1 +
 sound/soc/sophgo/Kconfig                           |  46 ++
 sound/soc/sophgo/Makefile                          |   5 +
 sound/soc/sophgo/cv1800b-sound-adc.c               | 322 +++++++++
 sound/soc/sophgo/cv1800b-sound-dac.c               | 204 ++++++
 sound/soc/sophgo/cv1800b-tdm.c                     | 716 +++++++++++++++++++++
 11 files changed, 1520 insertions(+)
---
base-commit: 7a52965b6976c936f413eebeee3f78c6faf09012
change-id: 20260115-cv1800b-i2s-driver-4f17836dec56

Best regards,
-- 
Anton D. Stavinskii <stavinsky@gmail.com>

