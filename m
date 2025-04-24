Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A62022258B
	for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 10:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490322; cv=none; b=PhoeIJS8g3sRhDzKUwBgIRbcF88uBO9NSBGY3wbj06KIs3xd2jCYJHoidtjz2qdFUcC73VfeJzupkHL0CfsXKE4SmDswKurtVsY4OLmXolCiWKYoAze04u+itq4egWtYpowhbD5CZx3Zp+OtCSNhaFXapC1CXxujoFCvEwn+FbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490322; c=relaxed/simple;
	bh=OndgYCrBRll0cH9zLhYKhtX8QcB/fXo+DhpoiOm3mns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NFob0ZvFU0xaKLlIXr8XA1UHrluwFcUCswa5aAmaWIihcr3Agb2SrE75Q+YAi1nIqmQEsYI+Q1rKLy70UQltIf8rCHY904fy/7TTPCVm2Tp/XE3ck2nQ0prVTO7ZQIE8dRH+ezUOUnsHN7ZKMO3n4SB9mAEDoIEjzS0JMaY4txc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nfEWNrtt; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nfEWNrtt"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-227c7e57da2so6609135ad.0
        for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 03:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490320; x=1746095120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiphZyoVbuU2HXJVLii+SRj3OxrxBVUtbZVtTcIK3L0=;
        b=nfEWNrttkhGm3Bj6k7Srtfh7wAZivCo/ufmssdFDrs7TmsFcEa4bpLCvfQsDzw0OAJ
         9v9oc+QxYJzhssfDUbKAVE8idxRl2RX4+vJres1pzVdpejPn5hTkzmMAbQ81o6pTJOIE
         AmXPyTKl1DreeqfXgDVvTyPsx1tVdwEjgGf7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490320; x=1746095120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZiphZyoVbuU2HXJVLii+SRj3OxrxBVUtbZVtTcIK3L0=;
        b=oYN1j3gqdlxLgRdMvTxwGAWHJadAegu5J5lpaNLO2O1tP+2K59Z+1kpR/K0Pp9WqL0
         NbsHQLHKBtAybElw548wKGHz1vCBROyirbnV09RI/u6lzTxO5uDYFxJt7M5m7hk3l2cg
         q2iX2ziYbuDWt4++BhLbxEPPq1PFQyRdcWPW9xGAG+3hoFKXSZ65rtLfim4gQADS58jK
         Kv6MOCVztxsmKNaXPi0TRKONjuIiNw58x/1dVbO2wC8Y8pAdA81q0hy9/cpCjp3o2mVc
         BOvWwNX620W+QHs6vNVORWvRhvK+y3FRs2RLv/AeZW0KESZghG+ONr1tKtw3aPHV7IdU
         1GKA==
X-Forwarded-Encrypted: i=1; AJvYcCUZfLLowbJxGooujV8ll53ArEcsO8Twpu0dl5pq6JJOCKXyTR9mWEIfjrTYpm2L2nPHvfwxXzWuoGO4Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu6/krSY9L3CnRiXgZqUZo4A18vRx7CjdibnnTt6aYoZP/QYfY
	LFQQBwIWY327l6E9oHTkjfkUmBEmiwbEZ3nx/Bgia41vTdYHpIlVg5Z18V8O4w==
X-Gm-Gg: ASbGnctZKNawmolNjmA99R6hJj1taaN+LOu7OHvRumBfb8zvdZiODm5zMHYMTWornSK
	6Brvpg74maa6BclVXTEb3/3+lGM1VpY50dhgKez5R/yGRgwNLy5jh3ioHZE8HyMLkYUIYSO5fCB
	Jjdp22KhoKIyt6cSC0dbnKn4JKCiEc3ljr6KhPDNx1CPRPyXlRyHnsln6stHbO84l6ezQKzaAwl
	ULv3XsJmba9Mh9OoT6rWQHzjHYJBPgSxxi9FnuxKJ6umUjIrGugyhLgtSAWQUfBAf5DuX+F0Nyv
	jstB3i7ErqnxQSuF/h4XWNPJIyTVD+ZNJ0LXRqNe+9tgzwRZYMKixkGPBg==
X-Google-Smtp-Source: AGHT+IHKZn/4E+ABRHWYqcKrwGD2nSNg3ytsgaiTlsNEp51ItpCCjFOn8apfWFbXf/8tif5QwDiKig==
X-Received: by 2002:a17:902:d50e:b0:215:b473:1dc9 with SMTP id d9443c01a7336-22db3daee3emr27358095ad.46.1745490319801;
        Thu, 24 Apr 2025 03:25:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/13] ASoC: mediatek: use reserved memory or enable buffer pre-allocation
Date: Thu, 24 Apr 2025 18:24:54 +0800
Message-ID: <20250424102509.1083185-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v2 of what was just a single patch "ASoC: mediatek: re-enable
buffer pre-allocation on some platforms". Link to v1:

    https://lore.kernel.org/all/20250401085659.1222008-1-wenst@chromium.org/

Angelo requested that these platforms use reserved memory regions if
possible, and fall back to pre-allocated buffers only if that fails,
to align with other MediaTek SoCs / platforms that already use reserved
memory. The series covers MediaTek's MT8173, MT8183, MT8186, and MT8192
SoCs.

There are three parts to the series:

- Part one (patches 1 through 5) update the DT bindings to allow having
  a memory region. The text binding for the MT8173 was converted to YAML
  and also aligned with current usage by addition of a power domain.

  Note that the MT8183 text binding was _not_ converted. It is
  drastically different from what was landed in the device trees. Some
  time is needed to work out the differences. I might try to recombine
  the audio clocks (which are actually part of the same hardware block)
  as well.

- Part two (patches 6 through 9) update the audio frontend drivers for
  the various platforms covered in this series.

  - Patch 6 is the evolution of version 1, now defaulting to reserved
    memory if possible.

  - Patch 7 adds support for >32 bit DMA addresses to the MT8183 driver.
    This was missing, and prevents the memory regions, which are
    allocated from the top end of main memory by default, from working.

  - Patch 8 and 9 are just some minor cleanups to reduce the number of
    "&pdev->dev" style dereferences. They are placed after the other
    changes to make it easier for the fixes to be backported.

- Part three (patches 10 through 13) add a reserved memory region for
  the audio frontend on the various platforms.

  For the MT8173, the change covers the whole platform. In practice
  there are only ChromeOS devices.

  For the other platforms, only the ChromeOS devices are covered. These
  are what I have available for testing.


Please have a look. I assume the DT binding and driver changes will go
through the ASoC tree, while the device tree changes will go through the
MediaTek tree.


Thanks
ChenYu


Chen-Yu Tsai (13):
  ASoC: dt-bindings: Convert MT8173 AFE binding to dt-schema
  ASoC: dt-bindings: mt8173-afe-pcm: Add power domain
  ASoC: dt-bindings: mt8173-afe-pcm: Allow specifying reserved memory
    region
  ASoC: dt-bindings: mt8186-afe-pcm: Allow specifying reserved memory
    region
  ASoC: dt-bindings: mt8192-afe-pcm: Allow specifying reserved memory
    region
  ASoC: mediatek: use reserved memory or enable buffer pre-allocation
  ASoC: mediatek: mt8183-afe-pcm: Support >32 bit DMA addresses
  ASoC: mediatek: mt8173-afe-pcm: use local `dev` pointer in driver
    callbacks
  ASoC: mediatek: mt8183-afe-pcm: use local `dev` pointer in driver
    callbacks
  arm64: dts: mediatek: mt8173: Reserve memory for audio frontend
  arm64: dts: mediatek: mt8183-kukui: Reserve memory for audio frontend
  arm64: dts: mediatek: mt8186-corsola: Reserve memory for audio
    frontend
  arm64: dts: mediatek: mt8192-asurada: Reserve memory for audio
    frontend

 .../sound/mediatek,mt8173-afe-pcm.yaml        | 98 +++++++++++++++++++
 .../bindings/sound/mt8186-afe-pcm.yaml        |  5 +
 .../bindings/sound/mt8192-afe-pcm.yaml        |  5 +
 .../devicetree/bindings/sound/mtk-afe-pcm.txt | 45 ---------
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  9 ++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 11 +++
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |  8 ++
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 11 +++
 .../mediatek/common/mtk-afe-platform-driver.c |  4 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |  1 +
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c    | 66 +++++++------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c    | 83 ++++++++++++----
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    |  7 ++
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    |  7 ++
 14 files changed, 266 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-afe-pcm.txt

-- 
2.49.0.805.g082f7c87e0-goog

