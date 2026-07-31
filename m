Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68D53563D4
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480223; cv=none; b=H+llsjmo1CYfHXDQbowOBO75NT6Gwj0keZH1hk0ooKW1qF0DJH8xIT/K4adAoLy0cOz9tHHpyoqstVNl580jJr+wpWl7deLlK9RfZ/AA0bAQXKz7xMKPJvMgnf5ewrLpxcGihuRy1P3wWIjg3TZ7A7YFwqtO/FIKHsBYKadk+cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480223; c=relaxed/simple;
	bh=wZOA0IgwJWHpsMo28k9D0svhMc/Vu63KzPVgQDVllOc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=lJNRhIlSj2VjzHvz80vJuEQfGY2uy1/ss7wPcZq15sUbqqwhsG4Lpv3UOVGPfSnUIjfNfINo8TSG2SPupSxzgxkGpygiKpc/G4GhJ1ato+E9PhOt0IdURY0judV1HB6+6ent0gkStH1WxfolyL6a8z+r6LJ/Cb7p+xnE/KUC6ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJG5VbIP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJG5VbIP"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-472326ca506so407057f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 23:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480220; x=1786085020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+Ji5J8LTGbxypsqRCu69yH+HVZ9BprDmcay4dgGIBI=;
        b=IJG5VbIPCCkZHbmMYQTQzO4EHU8pzps9jXr5aX3FcOIiYI0DaX7Fr/Fb/fmk98tuMY
         P0B5YeonNficNZZmqf3LMEgKPTBWbaBlm8hSWxqYbukXynHW7S7cN4fUrrfMadjihOWc
         zJlWg6Aa79DfG2VB1yxLeYf0L5ftnLiFlJmulrvdCN2alYQIH0IcRv3kGYcKuu4twhj3
         thKjBQryqc4beRFIrSG8cRCto/kxKYi3gAwKzd5IwHSeb++2qheFxJP++bj9STh46s1e
         N6h7Ne6zGehrJYusDaC/XvOwvJ0FGadlutek1R5ZciLAZX7r1c+aZZ5nmnYVznZ+LXTk
         pE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480220; x=1786085020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q+Ji5J8LTGbxypsqRCu69yH+HVZ9BprDmcay4dgGIBI=;
        b=HwNMhE0uSCBEs/VAZrGeLm8QGoG96/QMbxR4ExnjtfUWQmKNPbV2is01VLKGEOWDl5
         oMMWTGTeHmFd7q6ItSJRu5FZfMTUuwa9j3njH0eEa2iD9QxtiNaGJhRi/JdBucAPsJX2
         o7HpjM9xCRtM+wFv2JUCw4h5Ei7vH96mQ8IvIUflJTgQhRXSEuJQyyjNgLwAZtFSikay
         otcOyXKcQvK+atVUHBFSLdXpKLL+qWE2i8MrCq0LR4J8S2Dwo3SLDoED9/hCMBk2w6G6
         4lYoiekceGpr1ZD8Eplk3tD5Vs2Rl3mDkmjJYTxxv2R6TpYv92nYlu6gvDlP+VxfpgQr
         QkWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpf3PFkzMvu7DwSh/eDlbJF5yB84Jtz/KmXaCEw7/0Yq8XEzRKixik4Iy0eW/xZV6qhWTcDbwE2ALFAIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4YesWKezE9O8hhLd+ZT5mSuqDvZX75MQ2T+YL1sJlwEIG3M1H
	86rIQA3fjDcMmV0yCrWrHfv2e/SataYatX+9Vsd72saYlpuJ4oOtZ8wF
X-Gm-Gg: AR+sD13T+J4vpRKE/vuxTyETTO3Vrns/jyVGck5LtivNp2N8SK9hndzAKslQSuByaoV
	MYNxFgnj5hvXRoCAV2PHuBOKVFvWvPa/iaPntw4e5vkvWlZZpj731vhvodHQXIuln+CYytP2khG
	EmMaeRvWYO6kQeA5sYG3+qn4EK8w4tUQERTRJzxoRuQEHB+Lu0vzrBxNlc9JE/7ANPUqADJ/ZZc
	ed9CGSpgT5ijty4MkweHkltVaKeYYMR62XZWp8LxerKp6oOgT5PLbY27IhM+VPPfuS8MzL/IHci
	wgNVeInoO6lR7RNLsC81DQdmtIx+IrbOVoaWii0BsIXF62LPt+XbAnTXKm+E3XBm+crd65q2BlB
	lfgcXUSArPvzzvOMJVVeyWQzJNyy2TamOIqHr05Ws+eJQRxgdntE7p8AS3JV0zSdsa93qmNn0PJ
	wzQItQvstJlOB/xPrs96mbbIL6YESuvIRsyBnGXGwAxgim3IMjT29EiCPth77bXlsUelGLiEYS1
	i5/wvNWpunY767rszeSqXzc2MOoVQZgjkUIxMyqa+237lml7IbVmg==
X-Received: by 2002:a05:6000:2309:b0:47f:9404:5185 with SMTP id ffacd0b85a97d-47fd2ac976cmr2008837f8f.24.1785480219703;
        Thu, 30 Jul 2026 23:43:39 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm1372488f8f.8.2026.07.30.23.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:43:38 -0700 (PDT)
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
Subject: [PATCH v4 0/4] ASoC: Add support for Airoha AN7581
Date: Fri, 31 Jul 2026 08:43:20 +0200
Message-ID: <20260731064326.2284228-1-ansuelsmth@gmail.com>
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
 sound/soc/mediatek/an7581/an7581-afe-common.h |  50 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 529 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 458 +++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        | 114 ++++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 161 ++++++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  14 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   2 +
 13 files changed, 1479 insertions(+), 6 deletions(-)
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

