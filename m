Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D8B231C91
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 20:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786133389; cv=none; b=qXaN3x3LyR5mi3uTx+i8aOV/twUEgED0FgnmVWvy1z5oY6pmuf9pdnh2SFXNvmWlItdEIL1GMi2Ncq4yEgmriObiMu0jQjVgY2hSE+Idae5i9e3GP7oJHTHehh9BYxMknXBrLTBPTlhdHBLFeLJzBukFmQlSfyqhccgHU6l1DEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786133389; c=relaxed/simple;
	bh=9dIk58uS5ckvPTahHh2YJlbcL1xicsLTV4wPLHzPmIc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=kwBQo82FLrcurSAsyohowNa6RL9UD6GWXghOSW0ToFzeTNQWnHnl36QvRtwc0mCCfj6RU4ZPUByuCLr6NIzeQYhVbeWD5/Lhr9zabs7LaLYdync6Btp3uld4Uhz9d4PSSKZcsDQAWSSkxgNbSZzSa6guoOQGuopi7U8MiAx6SyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITC59Cjy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITC59Cjy"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so30852495e9.1
        for <linux-sound@vger.kernel.org>; Fri, 07 Aug 2026 13:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786133384; x=1786738184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UwiprwcAyxMLPiS+Zlnnnd/A5JsVvfq/t6i9xPF3mio=;
        b=ITC59Cjy8CfWaXooqMT+vNon313N3WzJqMvYoVAhOBk/18jbs70SS6wrmsBCELe+YL
         O/gwy8rXx4TK9ilyFAsU/PabWOKDjl+eR/+b4Hirj9snAVA1uU1nBYpFbUyxUl6fUMMg
         CLd4k5F/ur4CT4P15SGHq22Rx74BLZwxOBJ98pfD3pfSVMp4HhiPC/88eXL4vRynE+ZA
         zkDupS+DRwZLEzf+yYNNqATDpyLrg8uEMjYbZnC/uKzfl9hBqAiNVflyIBwWXDn2Khb+
         67qmqcxv3zNatUm5murq2H+v2gjF3AwHjoo8JsJbIcG7bf8H8R63XMVvvrJyOqzkMQjF
         YU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786133384; x=1786738184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UwiprwcAyxMLPiS+Zlnnnd/A5JsVvfq/t6i9xPF3mio=;
        b=qJagh6/yvG9i3OupNVNpew7UWgdPA/9kivtT/xtf5Yvuf+odp2q+LotnfX09qpI7oj
         XGLXqQcuMCRN09rRC3bItn1cObzuZYSk3fhXKO8R9frO/xvsQ86f2BDTgBQITS8M7LQ/
         Q0uD25kccyW9puoykkDMvxAair5SYiSJsPNxOxAiOO3CY5Cgg0xjexBaLslpfIs0Mey0
         NIcnq6GWRl9rgI63Ga3Je+RxMmhMYaX6YZH2MTFh+qE5NgAv1sEDxp5uZyiayjxJKQzo
         hBD1BiGGazU95p6wFq8ZiqtJp/uRfor3YPB9sW7o7j1qKA2ePtgxVdjI/oL/DUkk+ocB
         D6NA==
X-Forwarded-Encrypted: i=1; AHgh+RodKTgLc670EShlzhZU7iXSCKJBunRpHL+DwJYtcAv04VGWexFcp58/96FSzNNfRNkon1Iygjw2MgxSnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWjyNZeV6KxC+Nk2GVZtBEGe0uKU5+OdYtxcsQDHrra5gmzjPk
	TPvw5cpRqRZ0nbsQYPAetiXcBf+cbr7Xoj3W0gJx7yqrveUAycupUM0K
X-Gm-Gg: AR+sD119QS0VWvWfTu2lr592Uy660rKw/xbTfImc/Mc+42r8oBBqN8cmWrmdex1oQ6M
	RoHBJZih0wbXLEIDdOwU1/8yNR0wgLu8LWuZwbftv3YFX9nO/mZLd6GTVQMe0umyzeyk+ca1RFf
	9v2PfINXHrSHDRmcfQAf6vUGBlZwxAjulrnDPs1S3Ft6yG6MsGRV0smfYRB+vaMHU0c/7utAfhm
	5uVmxv3f5ot73J6n24meMvWXnpwZotdu/ZXsfnqlGcyCk/XYSvas5ePnjNF/98bCltLEXYYNAbV
	PDopxZs/ET6X2LbRwCbBTbmU8G7myHoi5Cj/ccVf5ASYwAlR58RUgydNpIMkK3d1DyZdh3k40jX
	tztiqXehbkVqF/DX+tw1Z8kCeEPwFAkzwyZaumJOY++5CpM32B4XXjv56o+Dtzd9tAX8bquG7M4
	1tHrYY9EMCDjp3F8T3eQ/Q6jc6HZ2dlaN8/F8fQAQ9pI0XRTFQRN73NXL5T9NyL+0ZC3/CUG/hv
	AUzgBT7Ll2NLqq8faLVdBu/ORnNiBXBnddld1Vy9r6LSipmPEQrAA==
X-Received: by 2002:a05:600c:b95:b0:495:5858:8101 with SMTP id 5b1f17b1804b1-4996199186fmr27697705e9.15.1786133384176;
        Fri, 07 Aug 2026 13:09:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm124815635e9.6.2026.08.07.13.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:09:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 0/4] ASoC: Add support for Airoha AN7581
Date: Fri,  7 Aug 2026 22:09:30 +0200
Message-ID: <20260807200936.201827-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all the patch and documentation to support Airoha AN7581
sound driver.

The card follows similar implementation with Mediatek with
the codec present on i2c but with a simplified implementation
register wise and additional frequency supported.

Changes v5:
- Address comments from bot
- Better handle concurrent irq status bit
- Protect enable etdm
- Add Review tag for documentation patch
- Address formal comments from Cezary
Changes v4:
- Improve Documentation YAML
- Move IRQ regmap to mtk_base_afe_irq
- Use mutex for user tracking in ETDM
- Register IRQ after memif allocation
- Address suggestion from bot
Changes v3:
- Major fix to the ETDM code
- Add duplex support
- Improve Kconfig setup
- Rework and improve YAML schema
Changes v2:
- Fix wrong edit in MAINTAINERS file

Christian Marangi (4):
  ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
  ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
  ASoC: mediatek: common: permit to provide dedicated regmap for irq
  ASoC: airoha: Add AFE and machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  71 +++
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  27 +-
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  49 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 517 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 433 +++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        | 114 ++++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 161 ++++++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  14 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   2 +
 13 files changed, 1441 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
 create mode 100644 sound/soc/mediatek/an7581/Makefile
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-common.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-pcm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-dai-etdm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-reg.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-wm8960.c

-- 
2.53.0

