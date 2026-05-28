Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4729A2D94AB
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 17:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779990533; cv=none; b=iNwvDdruQywIIfJWky6Y1ihToc0VvVZp4yBCg09mZ97sps1PvuaaWP5LluayhXRruZsA1kwEG7HjQ3FYrc3mxKJ1yQtbSqCBKH+PFtaF4QHPFyShdc96BbuFTgLLCdb3oAFj7T44+q6sSJUxMhMGu2Pn8lEeaiyLMYQ0BF3SXnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779990533; c=relaxed/simple;
	bh=oQ7Hpkxdi7o1OAw57CCpb+Au53scJEAlsV5FWRttpUI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=KyQxVld/3Ph+p53+N71MNFyMMlpNcsuYYZ4gAC0MyVPdGiQ0BH0oFc/rL3Jux4Do1UxIplRGAaqFJo9ahBEMth0FOdykiE5mYHakuY+hFBAc97z6pc81KuQD06C6JyKRH5d/iEPeDfXTT562O26JhcOD1v4gQfPyktnTmxPZF+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHI5NGrV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHI5NGrV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso74346075e9.0
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 10:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779990531; x=1780595331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIzWyKMXWGotWIEyO41ggWsKGrt3q5HiBatwgBfE//8=;
        b=tHI5NGrVuwVKO61IQOv0ntvMaN50Ji42MBtQsXOKuxrnP/CPvSXc8bwITuj2A8Iklo
         mjMmSzyqbJe17ppFHzokISC55eNegE0NR48LgKjQKJgQ4Tij/q3WvAhvk1lluAj84L8+
         DddChQy61YlNTW0VtouxCo3ioXDrdhtyrQCtHw4ZaPoBRg8SKZMxRJW+qeqU5zU6/me3
         qtuQ8WtgyerTGlYX0DeqB+MUf4OvJCLkbUF0KGYQPc+Utpx5FfQDkYpXAXbwsDK2EkHq
         0JX/m4t1fazB42dOWmtnzvzf+bSEuQEPEidLtKP8c+trwtfgwS+nb9p0+0Ve5wuKMjz2
         IAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779990531; x=1780595331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIzWyKMXWGotWIEyO41ggWsKGrt3q5HiBatwgBfE//8=;
        b=NjgQvHO5W+jTolnbRRSDay6lirzZTCYW2MAplD02bnoHoHPdCqh8V/uLNphxWB+qNB
         ZZUz2u6B5nglOemHkk8h8qYii/jMhgMs51GldnHFg7cB6dBzQ2wPWd/70E6ubygeQSsd
         HqDhErqor729ZC+khMPzj0VuwwTOtd7FLsgBL4vn2npKHa4shEl44PNEdzGl0mxbPQ8Z
         Hq+5NTSbb0eZmBHDFW6n+QxQX81t/brTeClUDUMQigMWUmE+BXkkFFFOJTQuDdWAu1Py
         rH9z6mWBJHalSMjzjgPUZyCKdsRoR47hL2f3HblpWQnvBdGxkqZFic8sRtzOnxGAnYOJ
         HyVg==
X-Forwarded-Encrypted: i=1; AFNElJ/jM04rtO1zJA2pmbY4eljxOfeMWne8s6b/i5f93ROWnFSpMxVSa/iRqWvm/ndlQFaUD7+i9N0UBWnzXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpxazdbanmcNI9oWhA+z+xBWGGEQ1rmUm0sYLnALUYQ1qKHp4k
	9cKIM9wX6vO2lKCVRd5IYood30dQsO7aLoqBLocJEG3oRNfF78e5IyJs
X-Gm-Gg: Acq92OFTi0Gr/ds53Bf6MnC+oysdthinCPVIvQ4JVbLH+T8MbwDMBNaMAYk8oDZYquR
	3CaTgRXBAXHz3wJs/guMM4geOqVG2cEPc1q8k8e0cc2EnI2QKnCou0QCS1aOdfqE3UKaQMNsn1r
	t5feZmsA0G9Fj+7xlR9ub6kOdjH2g6EzitjIMPYNa6GpWQXL+lXufnSOYBiaHOR+2NqrV0g/Zn1
	KOMnkQeo72Bt0/eGeIbdLhVKgyM/8C43G5ifhRfQUC4Nk8soEaNaLFY8w5qGMZsbbUeg+nHFbBh
	9VQkEjC06huY5uvBzI8PoSwaLU/eUscdYMT/3q9sEtg39vGDQXFpYZ719OJ3BLxl3mlpuGiFrgt
	lxZD4xgXTYe1tCWDXzyCwbMknf271AEMsxCcJo0Jf6aMBE58nHhvsZTP324kRZG8F3fAwZzjP8g
	oKD+qUFzwVjClZNgoAic/BCYVDijekdWFGgs0qzPYhiQxiWafd79Whm4ulfAOZK6hzkw1afr96A
	twB0Pb+dVv4F9D6Aw==
X-Received: by 2002:a05:600c:1f8b:b0:490:6869:9601 with SMTP id 5b1f17b1804b1-490686997b7mr266156675e9.6.1779990530436;
        Thu, 28 May 2026 10:48:50 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909235d4e5sm75342625e9.2.2026.05.28.10.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:48:50 -0700 (PDT)
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
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/4] ASoC: Add support for Airoha AN7581
Date: Thu, 28 May 2026 19:48:28 +0200
Message-ID: <20260528174840.28644-1-ansuelsmth@gmail.com>
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

Changes v3:
- Major fix to the ETDM code
- Add duplex support
- Improve Kconfig setup
- Rework and improve YAML schema
Changes v2:
- Fix wrong edit in MAINTAINERS file

Christian Marangi (4):
  ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card.
  ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
  ASoC: mediatek: common: permit to provide dedicated regmap for irq
  ASoC: airoha: Add AFE and machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  71 +++
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  27 +-
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  48 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 529 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 453 +++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        | 114 ++++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 156 ++++++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  14 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   2 +
 13 files changed, 1467 insertions(+), 6 deletions(-)
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

