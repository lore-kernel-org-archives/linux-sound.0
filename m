Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F643B95F8
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 16:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768840250; cv=none; b=anDXZXSG/8IFjMLq5YUbXg/Nir2JYZgc41vYKo+0KJz0deNL04cSBlDRxfgBWgZZJDrTo7yLf3Hp+a1/EYYgf0plmwFv7WB7vUZnVgyg0ZUkcdJa15MngwLk4BFCyuryg79KgaMMvgyj82AZTfWe2Ae5G3CvPM56DApsHsHyQyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768840250; c=relaxed/simple;
	bh=tBbE5TYMjz9mJOg2pvzbDmpHsdxVsvsn/pV6RG/8C5s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AVLNIRp/iDLj13Vv6mJNc9WBcY8UEL7N1I6S2nTgms6w1zjr2Ov/p2oi5dUSE0mmX3DlnazPX1xleknlkKHd6rbko1Mx+d/WoNPoR3nnhnUFSn4/4qkCRj4pPH+V028Q4mlmhkbHtdPpWRmZ4NOoaNPgPFUXkC/88ynrfFYRD1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTA7fAyn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTA7fAyn"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso41223105e9.0
        for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 08:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768840247; x=1769445047; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GtSyZi+GX56dSilIrbysoC6diIgasA8yuyqA3He/cbI=;
        b=TTA7fAynleVFGtKQ8PgPlqwb5h7YAurDw/lN6xxJcLOSRro8nOC0vmHfQ/rQt2bFT1
         3OsH86rX8s0wDIB9+r3r3qsSlwhSSHrXDKxEuM8MAiabXDTvaAOu6hY0tSneuNI4IUuv
         4JyerXaoa4Z5I3HnBmssT36cBV4w3PFot40gOyNNU6ArdQjs2b+FQ6bljDUJNpTMPGVs
         CCKl/RGsIjLfhPhF3fDQ7QvwhGXr7Y4Y1ZTQV1hZnOWf7c2L7PORGu0Lh9Vws25HjK8k
         ForlxGevvIqZkX/HKbcvEdyXh/lRVoSgndBycfk864tVH4zynbjuK7fTlbFTDu0FlXnf
         lDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840247; x=1769445047;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtSyZi+GX56dSilIrbysoC6diIgasA8yuyqA3He/cbI=;
        b=SvwSYlg7T6Tx6yAhJjomxD0ki8QXYHQU5DT93H2g+LX01zFpmZX+rE9O9MIQDA46sC
         sD/st/3949GIsTUGbCpHbMe5YREi8Buq+HlenuVVnTirKVKxogMX1/E1Wkm89kbQa1Hj
         XlormNYS07dDNn7xwF4q13LFnRa4utB9PZEbGRPft1b/c4Ku+m31rANgSmRmoQJW+rza
         zUAa1DMvwawpcl0GzbjLCkRx4VJkN2IJE1QSLVpMePgiE08G0IsPGQ74W+ukpUb3uVvH
         hFKVbUtvZyEGwjF1aCkXoTkXD8dgjhMpdpm+eFzNb/72xv6lzKtFKCiXmVMtuwJwdcU7
         mx8g==
X-Gm-Message-State: AOJu0YwLB5+x+Wpzugxmdyzwk5IHnw7pUbWUAdqPPJJWq8Q3FNnRMO6Z
	M7zo8m2xY1sN7tlgjilo9YMMHp99MQF9XjWU9SHaEtujSklehwP4DPJy
X-Gm-Gg: AY/fxX5E4TZ/T2narm5kgfZGEvi4jFWQw/cziXbJvmqMXOIJ8SlhFiYtbApr7mG5AGJ
	o74th/aL55UkR18UNCNaDXmx3yKlLEVhZOJ8KHXNvBn5CUEvxi9Hx3RDkrkpVZEBjyDmkq2Mekp
	6DHxUCXYqVo8UjTnQgoGpYfvbfDLOMCeX9HJ4q47pi9j6Kpa/XngUxibDcNnJFsElqv8qjbYebg
	uitUbbnT5Py/ellPCd00P6OGa9N9WXDRWUwIPpS8Nn51gSHaaYIKkXr55pcDdHHeEzGeAb3p3Nn
	MZ7cleJkZWpggqOl7T+n/Ijfo2uTZUdoVMzbQ2Po4h+zaBV77Lsdnxr1lRdhWdcQraM56g2ABiB
	9592a+qNaWIoZ9FGll+RfqqAKohVgrSaG4Rd7eCNiO37qjXu1otiJYlduaNmxZE06liL87lW3Im
	8GA0Pdbk1CI6afZU17IHqMShaOlR0SUvBE8PEJDKBT+Hkm
X-Received: by 2002:a05:600c:45d1:b0:480:1d16:2538 with SMTP id 5b1f17b1804b1-4801eb03358mr124106305e9.23.1768840246435;
        Mon, 19 Jan 2026 08:30:46 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879537sm201666795e9.5.2026.01.19.08.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:30:46 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH v3 0/6] ASoC: sophgo: add CV1800 I2S controllers support
Date: Mon, 19 Jan 2026 20:30:41 +0400
Message-Id: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADFcbmkC/33OwQ6CMAyA4VchPVuzDTcWT76H8cC2Ak1EzGYWD
 eHdHZw4GI9/k37tDIkiU4JzNUOkzImnR4n6UIEf2kdPyKE0KKGMkFKjz9IK4ZBVwhA5U8RTJxt
 bm0BeGyiLz0gdvzf0eis9cHpN8bPdyHKd/uWyRIFknVLO6sa27tKPLd+Pfhph5bLaE/YnoQoRp
 BBad6a8ZvfEsixfTkjD0/cAAAA=
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768840243; l=3774;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=tBbE5TYMjz9mJOg2pvzbDmpHsdxVsvsn/pV6RG/8C5s=;
 b=c7AvbXcGS/K0MvQfsJ0WarJIF9MHxYCqS987eHude15MFk9VyB7dvqMcJ62U/gdDyr2v5fdPj
 9cMqyVReILEAWoLVhniDDo5ozEq/st1lncODwK4F0UyH6XhPKHsV2km
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
      dt-bindings: codecs: sophgo,cv1800b: codecs: add ADC/DAC
      ASoC: sophgo: add CV1800B internal ADC codec driver
      ASoC: sophgo: add CV1800B internal DAC codec driver
      riscv: dts: sophgo: dts nodes for i2s tdm modules

 .../bindings/sound/sophgo,cv1800b-i2s.yaml         |  67 ++
 .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   |  43 ++
 .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   |  43 ++
 arch/riscv/boot/dts/sophgo/cv180x-dmamux.h         |  57 ++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  55 ++
 sound/soc/Kconfig                                  |   1 +
 sound/soc/Makefile                                 |   1 +
 sound/soc/sophgo/Kconfig                           |  46 ++
 sound/soc/sophgo/Makefile                          |   5 +
 sound/soc/sophgo/cv1800b-sound-adc.c               | 322 +++++++++
 sound/soc/sophgo/cv1800b-sound-dac.c               | 204 ++++++
 sound/soc/sophgo/cv1800b-tdm.c                     | 716 +++++++++++++++++++++
 12 files changed, 1560 insertions(+)
---
base-commit: 7a52965b6976c936f413eebeee3f78c6faf09012
change-id: 20260115-cv1800b-i2s-driver-4f17836dec56

Best regards,
-- 
Anton D. Stavinskii <stavinsky@gmail.com>

