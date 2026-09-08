Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B96E4F55AC
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 09:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858299; cv=none; b=jUHFtpFoGoDasJFHResh32b2YCZS5Hkv78C7lldafG5C867w2JUy+tVAcyQsU4l5JHhOHCADuTVKXKMfg2XDzGpDsRMWM79767lHpSuFthlo85Wc6WoAxbLJlc//AZ+oAEnpsPP4ZxjHozaXzyOUsvFC1feI0XokgY11DZEYirE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858299; c=relaxed/simple;
	bh=YhduCODJr21RV/qnoWSb4NuDoadYla4kv0KPFaGd77U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=kANrgQPclNSjiCa81XzNGD9SideHqkvyPKM/too8xJ1WAo+TlTNIUFqUYAPGxjVPXUKA1s+v76kjcoS1xO5Xq4uVSEOaRxQ+tR+kZtkO82mxs3f9W0fT430iEMIL4LQ5h99lLFkGmPT3La2XquaJf3LHJdu1Wg80f4hLsmgTMk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBIp8wXl; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBIp8wXl"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so4998930f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 02:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858296; x=1789463096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIZ+kUaFwJKaLRLpyngmxMQG27w+758uZsHUvhX4A7o=;
        b=mBIp8wXl563j46M+dFAPSnYa+XJA0zpsHpagMwwGsOLN3+2kXcZfVSaKyp4/KldzUT
         aoe/abkDH51pIsoFMGR1hKSzoKNtyCalx7WUqusOzmMv6A86APuLKbxXJh91gxy7iCdY
         v5VqG98HEUd5bKGQrPoTNfxTAPI+vvXLt9+3YDONpL1u8zft7/IFiEQfZYPZZlzWfE2a
         JxRk39mVNsd+Rul5AUby6n5/LYyAiVxjPesWNKUEXt+qiSU3JQWf2MwJpHrQcR2FPtus
         qTTgSwtAkJUOJDHZUkOvUe+XoxHjEUyBirx84eRFBwVAm+Sj5gGLQbt7kKCFvuKsBGtR
         F+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858296; x=1789463096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eIZ+kUaFwJKaLRLpyngmxMQG27w+758uZsHUvhX4A7o=;
        b=sXc8mANnoxukDpCk19dAtex0mzAT9V4vNqy4jo9GSGp9UbyiN5p9w8SE3HcQBbUTH8
         JUwWthMqGcJAJsUElICncbmV6x1HV9v/2jDrjRuX7hpbr9El6ZMRNOfwza7zfxucngTM
         FYBdsCO42muM5SS5orDfeD9vKdfwfUTurunPUmzqwdoQSSJn0t7JTDdkc7k6VvwHQKWr
         JoknUuY9KqlpyvaCL1jlIOT4LtuShhNEBLP2D76WciRJDNbWUPcww5LBa815GIIgjafn
         7CocB5MCov5i1BQJHBFjErabHit+PVritgh2xaVLo+aOh0ulpMGgdMnJuww4X0j5FkUm
         vc3A==
X-Forwarded-Encrypted: i=1; AKwUvBzfShzFJlDnYbxd3iqoOl0U6RU+i2UXZ0p2xCyjxngCeWsnoVOX6z215TXNTmUY/CL8DR3urcYSY+6x4w==@vger.kernel.org
X-Gm-Message-State: AFuF++k0lyUlWeXYD1MYGE+PVivJPCMiotvd3DOzwrHtCxYyLa4wbKra
	OT2F2xEtu3Aj7yzaWalJJ/204S5zriqdM/4Eswn2i/wxi+m0aF+jCz+FSS4kAQ==
X-Gm-Gg: AYBFou2VX9GOzqcJORT2F6ViJb9mgQiea2sKXf3ZIU95JhOWilOFdiXLTtSNmDn/Tyg
	E42laj34rbWDekhZZd1b7E0f6SytDBh51CxMRGAS/G59QQkV76oX7y4szC/L3w2Bh2tSsbJ41qU
	pIVkdUYfYg0hqrEiaN7KIStzOhhXFCcfAha1BLoS7wzFabBUn1YGDvWZlyD8ahvupP3f403rxpD
	jxSrdGzr9oFwM8Omlf59euPPGJfG1GoSk0GT4N8KuUBHrdF8OdC38Q/swXS2nFVTCzAi7yqQNFM
	hXGZbVc3hMJNjziYrcDaSyppYbsWIlL1pWIYjN7xC5RIeNIdOueinFfeUo0WhBY+Y9EsvBtrDyL
	Uo15l0QwdbQ4sKVzvi7wYTQYXu9Og04qlyaHJIUGPWn7hOi+m5mTttjpmUYxYybqa/WwCRF+0rU
	XhrM4NcuVskHn9xLSpFPuTv3He8uWZsKw/TKGQkq7FdyqM75403pSSpqaInV16PlyBhnS+s/z1Z
	FGw7VszlXYJlGZOkEgAipQsMvbWAieii1mqx0lUymxXR+2No+rh
X-Received: by 2002:a05:6000:2602:b0:485:8c16:a33b with SMTP id ffacd0b85a97d-4858c16a5b3mr26273747f8f.48.1788858295822;
        Tue, 08 Sep 2026 02:04:55 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:04:55 -0700 (PDT)
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
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 0/5] ASoC: Add support for Airoha AN7581
Date: Tue,  8 Sep 2026 11:04:42 +0200
Message-ID: <20260908090448.3332-1-ansuelsmth@gmail.com>
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

Changes v6:
- Fix PCM probe allocation logic
- Split driver patch to dedicated PCM/ETDM patch and machine driver
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

Christian Marangi (5):
  ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
  ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
  ASoC: mediatek: common: permit to provide dedicated regmap for irq
  ASoC: airoha: Add AFE driver for Airoha AN7581
  ASoC: airoha: Add machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  71 +++
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  27 +-
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  49 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 515 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 433 +++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        | 114 ++++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 161 ++++++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  14 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   2 +
 13 files changed, 1439 insertions(+), 6 deletions(-)
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

