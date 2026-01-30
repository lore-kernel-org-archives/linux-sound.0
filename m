Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E492E6CD3
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 13:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769780087; cv=none; b=T1syDyR8kHNkhXahl7l+LtMFeEZVsvTk1dEXm6cFpEs2csTtKvnzOxRVCiNgoXO7IE3DBjWcmuSgROpqh7qsKo4LVuroNXiMufTn1CFtqhEhl3f1816Bcq3VI3YY3xylflH3bW+K1sXnfwoRG4BLqH77mUriiUwWlegPbIlde60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769780087; c=relaxed/simple;
	bh=PszrTvwUFgAHB3Pe1B87ctHo6r4Aoe2ej2tGVNg4EMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HzfbA/8k/89qRX3JTgnGe3BUmJLFC+ibcuRDLtevZ3Ve8TwFRmSYh5qqXzBUf/exjwVuimxVHiSjIXY/IBXJoyXea3GUjSeAVllA7tdAkcrF/C30MTCaEOWg/tqBtCM12TSE2j3u/kpYifo9LBge10uwMMCXl3lv1DaQuWpGTl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCqAJpzL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCqAJpzL"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fbc305882so1409544f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 05:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769780085; x=1770384885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kvNmHZTLWASawbmDuih3QJ/Sdk0W5SUborAMkDuuQ7s=;
        b=NCqAJpzLudUuuPz5x4NMjcedLQw4MzWdIBGxdl1gMZyTzmeBhd1JF3/4vp3WFUJgtz
         UqDRTxINI4k64ZwrqYzgJEwFESAf3BtA5dz+Z62PUQ0rp8uSwc+IIw90S20o5WXlWzJ2
         SYJo6SKLzpjEiEiEfk7Cjrr1mIuYuULmfyuPvn7B4EWg07LohQx/sGsLw5ktADfa//k1
         LPWCScWAjjILkyff6dDN7eXzuwuG8Z553afQo2O0x9OiO/2OlvozrwiRBmHMqSuyUgCK
         DKyrFVthGmrqdSlyNqlXTRW4Pvg12wuUELVHl4TjoSIkTz1eMs/3qP7wx1tWfSpSTfDg
         KkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769780085; x=1770384885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvNmHZTLWASawbmDuih3QJ/Sdk0W5SUborAMkDuuQ7s=;
        b=r1TgUfqHuyC7HK2ok+PvIBz+ZPCzUgLZwrtP2Cfw0pHay4fUPIZUcbmJT8XfI+gQg5
         WphELKfMFj3oA3EBXeM6kF6uhSD+vZmRrUeG1+u0/OKf63o0nuJtXXZ+J7pRMBjVHDDO
         5b4h0TkdQXzMdsmwxsFQdvIpuBj2Ei7MD8qwDvonOWgNY98kinEvIc3m7V8Buq6Q5gvx
         RfrGcwhlveHOodfNOq6bWLit4ZbysMEa60rzmJK/fdqzYvzQBRyTqeV2kpdVKaYZqXUv
         NXLMhXSYklcxykvRgbggwXmKxvx3RHddNXjT2x+hG5WEuYfrgCa2Q2/aiKFcOqIPy0UZ
         HBDw==
X-Gm-Message-State: AOJu0YzgR2Y/yulALBbRFcOCWjrsSivNDCw7XAiWPsepM/RkkGr4V9i9
	/dXYWF4YG4659nl4Ig2pP03pJ3G7NSSsjRoin/8UjStaPcJE0AKXM1Xn
X-Gm-Gg: AZuq6aLuYFnrocMmJgPcnOGQLV518byxgbAABlqyV1HQvqZLS6rtbh6lwpKOCNUNdTd
	ugJ4pam6rEH4zym9LZGmhFmXFQT515Io0vJqbPUOyFPc/EIwQvsvVEzGuqDTOnwxQoMF3lIyS7x
	CXuz6kfQvhRMMpq8lGG72eBAkkE6VI/Plu9g/ZkK+vZ0LLB0+2DfdOwWsPZ9D8RAfqECR2BfazQ
	pEDqocBZI4TnY2yntbVxoDCHnlC5ji1nxQ5gqx6poQlK/pkms0K3bJM/d5M8KQ50wWSmvCoDG7h
	o1pE7yLbl5rOj2KT1lfK1qW8wlQJpEso+t1ZsntdKQfs3CKVdjsGw9gXn0TyGnLu7krvG6aTGR6
	DH9zSXo8ftbYw+YEEaUaB5o4Of5rEr++BnWs2nIOnNxtCiDpq7D33I02J7g117MeZGfthrD8GZi
	rN
X-Received: by 2002:a05:6000:2401:b0:432:a9db:f99b with SMTP id ffacd0b85a97d-435f3a0ccafmr3862527f8f.0.1769780084484;
        Fri, 30 Jan 2026 05:34:44 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce93sm21536837f8f.24.2026.01.30.05.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 05:34:44 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] ASoC: tegra: Add support for WM8962 and CPCAP codecs
Date: Fri, 30 Jan 2026 15:34:30 +0200
Message-ID: <20260130133434.353353-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for WM8962 and CPCAP codecs found in various Tegra devices.

Jonas Schwöbel (1):
  ASoC: tegra: Support WM8962 by machine driver

Svyatoslav Ryhel (3):
  ASoC: dt-bindings: nvidia,tegra-audio: document CPCAP CODEC
  ASoC: tegra: Support CPCAP by machine driver
  ASoC: dt-bindings: nvidia,tegra-audio: document WM8962 CODEC

 .../sound/nvidia,tegra-audio-cpcap.yaml       |  85 +++++++++
 .../sound/nvidia,tegra-audio-wm8962.yaml      |  88 ++++++++++
 sound/soc/tegra/Kconfig                       |  19 ++
 sound/soc/tegra/Makefile                      |   2 +
 sound/soc/tegra/tegra_asoc_machine.c          |  52 ++++++
 sound/soc/tegra/tegra_wm8962.c                | 165 ++++++++++++++++++
 6 files changed, 411 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml
 create mode 100644 sound/soc/tegra/tegra_wm8962.c

-- 
2.51.0

