Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EC327EFF1
	for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 09:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766309789; cv=none; b=Cnj4eWjRbDFHvzyF4ZWytb0wROM5WFDUdRQ0PBoCWYI6FMvcUTHO2Sx5SViPf937UiF37enSky7DE5Kh/Guwnr74eQTIhfqxeSNrerd7rWGkqDul9617tyUy8fDlF4VbCuyn7KADF+W+Zu325S+CKEVHCJYnYTOyHs4y9SUAqnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766309789; c=relaxed/simple;
	bh=eyUwGI0ieunvRa2JS4DDwPNE6CUzg0WKFA2me2XXi8Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WifQYtaK7BMZZaH2/wiwYoAdmRhR1sP6rgRXTyQN3hCUPphP/AY3SKx9eAAkuCdIm9GGPE99RL8TYfBtRXKdgG4RFhGEQROy+3V6mI163Xf4wqIGCegwA7pLfoTpZUgROkEDMFL7eGyFrEY6DVs8UF/+4K6cCPAVfoZs1NIbtSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fC4E1Fbl; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fC4E1Fbl"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a1022dda33so25292935ad.2
        for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 01:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309787; x=1766914587; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F5nB8fHKMaIzWNuSxdIiCgEFq4ZfOznDuDPNBRfGesY=;
        b=fC4E1FblWOO0sGx58SDJmA1s1ydKzM11roHQLWWHe6fi/c6PayNkbhorVMJ6I4pkqM
         Oj+NIs5EQ4NMWueB/gm14xWxDMbRC9egDFbHB/RFLfMsn6cd9E9enX8T/r+h9wmpTT2F
         2/u3nUvBm5VEEZawsrrtVAfjjiF4v+cxopSIo8Wyf6Cipif/S0sRRD/foxvv2h9n35cF
         bl828BtuqEajdmpWtnPra/8OuJBwxDRzRkniPh8MBzpWDBXeP5Il153tLiKzuXY1h+Xq
         lvaEPWNmHovkFqTQ8guUVBEmcaLgmIf3Vxa1esxJMHoUmuM4NdE0ViOZwK2gbQ08F67X
         IW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309787; x=1766914587;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5nB8fHKMaIzWNuSxdIiCgEFq4ZfOznDuDPNBRfGesY=;
        b=okZAgRnb2YQ59LPtL6ZgblSLx+4cshSHBMzzhJdsgqZTrVmD+SSYxxaIlbi3oN5R5l
         OVZxLfe85GiZDkz/gtd8U+bVid0rNPIgulHbD72AvnaQKSpseZ7mVRf4HYIcC7J/eL17
         7ICYfF4WDUHyqPDI2jjpD/AUXcJXNKDljlfK/82UBg1BlmFx8nQ0xF5Ltvjre4+FXM0A
         0/kU5fty4BcRYZ085ERkS7kEa29lWkc4TmlOLgMoRCF4goWq87+azuvJkNd5PJVgOhqC
         r8m3NZUC7CAmPcXlGJL7EKSbSxtXCrstVbLwuwr0z/B5ihZYHtm1r0ok4dNJd1eqhSVh
         mgBQ==
X-Gm-Message-State: AOJu0YyjWtQJLF3sCSPWDLeS448zhRSRHvAxxjKeeA7bQyIDphuwo4jT
	7Om+9fQvj73aecId+pbLnFjUTL/eFyUp2mHhSZ/FlhJ3ZBw9dvNITawi
X-Gm-Gg: AY/fxX7Rw244UzrwsNyJXeYD9xGC5zWju5Kxs268lO3unqiiyF+7RrCNP6Gq/g0PcVJ
	dUT8Hjl2E/HuMiSDdFs8gmnJj1roW/5HEirn6ydiX2+MtjrnZPLMQvajzoPUbkPeeMvGwH4bsXd
	K1SWu/eUWCjYarrEDNr0xwREI7oQtS3woEJ3+jr/9NFV7FNGDyXTb0WqetavQBnys520C4/EnbQ
	k+qnOYBEqOoGRO9/Q0Gj7uLGBBdOBS0KMtBMrYVqmT+OUh9fO57JMXIg8kBcsRkDNLxBDtgVfq6
	HB751W6gB4gNqyTAuzyK9cqrBOzpKM6zrmfBLSMVbBt507uAAiG1byv4Kq5ICy5rtgCLwksqzrd
	qkfgHM1N2ngconaQrcOG9xCGdR2Laj1OnhsHQldgLKezxdjoCPaWl0xFKCdhLjFeZRmVknjZtEa
	xdpAbndcEIZrvAlhQR1uLNWSsmt8LV88ZG+iDLOiOff0kwqZXWhdenUDYZGUuUDBwWoJNysQyrS
	5MwQ8p3ik/tLkOBvsjNIMqm6UeKbPjtP/FGjPkkxp+0qary8yVjhQnDQMqmjHqAsxdQgYvWwCoQ
	Pjd0cEFrhjSIKppSySN10448cUkO5pVpJhPUzUh+SRwJ7tDpiOM=
X-Google-Smtp-Source: AGHT+IE26hfD24ZsQ6mXHiG/tj55lbvStfyPTDRxrA921e8bn7nv2J67tWRAQHGaVgY7xl65mVGtVg==
X-Received: by 2002:a17:903:110d:b0:2a0:9402:2175 with SMTP id d9443c01a7336-2a2f2427be6mr68478635ad.27.1766309787305;
        Sun, 21 Dec 2025 01:36:27 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:36:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v2 0/7] ASoC: basic support for configuring bus keepers
Date: Sun, 21 Dec 2025 19:35:56 +1000
Message-Id: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHy/R2kC/12MywrCMBBFf6XM2kgStVhX/od0kce0HUgaSUJQS
 v7dWHDj8pzLPRskjIQJbt0GEQslCmsDeejALGqdkZFtDJLLi5BcsGx9Uw5ZciEnJrhWQ5t6q87
 QTs+IE7324GNsvFDKIb73fhFf+0sN/6kiGGenq1V66rXhAu+zV+SOJngYa60fkP3BKKwAAAA=
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
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4113;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=eyUwGI0ieunvRa2JS4DDwPNE6CUzg0WKFA2me2XXi8Y=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+/tkzmRK8Wo3Rfg3fvMzOrKLlWlqg2sPv59u01mrb
 k6t2xc7JrIwiHExWIopsmxoEvKYbcR2s1+kci/MHFYmkCHSIg0MQMDCwJebmFdqpGOkZ6ptqGdo
 qGOsY8TAxSkAU71zA8M/rZsTLl+4MlUl0P1s7sXn/XGciRdPLTS6MTdS36NSfNFnVYb/3lySG2q
 faJuIzKzd+/CE5y6/VY4XYtUvBegf10n8cE+KFQA=
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

 .../bindings/sound/imx-audio-card.yaml   | 14 ++--
 .../bindings/sound/simple-card.yaml      | 14 +---
 .../bindings/sound/tdm-slot.txt          | 29 --------
 .../bindings/sound/tdm-slot.yaml         | 82 +++++++++++++++++++++
 include/sound/soc-dai.h                  | 22 ++++++
 sound/soc/codecs/tas2764.c               | 95 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h               | 11 +++
 sound/soc/codecs/tas2770.c               | 75 +++++++++++++++++++
 sound/soc/codecs/tas2770.h               | 12 ++++
 sound/soc/soc-dai.c                      | 40 +++++++++++
 10 files changed, 345 insertions(+), 49 deletions(-)
---
base-commit: c8d8605fc53e8072848aadc7a5aa00c2f5143cac
change-id: 20251201-tdm-idle-slots-10ba92516da4

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

