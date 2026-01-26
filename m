Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8E330DED5
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 10:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423524; cv=none; b=fm7djsVVl0p16jwwaseYK+i540KU4+8mX+GZtBlDQcIu8c8g0blhD0sCdZIGXTwqO2O9JBEF1gNEFXyzTXpeiKRnWR6Ems4h/gvk63jk4i75Hc5nYN2Y3I2BT3waTHLJtvFnN3kJmQXZa5LkkWxIwN4P8fOmOT0R9t1SMMiujVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423524; c=relaxed/simple;
	bh=U16rA/1jUGQZ9fG7f5p7d5exmM7/IuDWsKhivrvoaec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UYA85Wsh6JLH2G5GfjE9GDLeKjAri/x8EqZybZ5dl3j5Ex9JLCoQREVBYi09sGwPtEn3M7sxxsFdfyGelkjwXpvV5kzs1YhR7m/m6W3fjn1BN6zcWmYMdsbUPG4LM0zjlpa3zw4TRv6w0bIa5e10iJaa2biut/g4dsL7Si7ub38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OCnvDTZC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OCnvDTZC"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fb2314f52so2466341f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 02:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769423520; x=1770028320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jfU49Y0gQlXueUVYkkOnL1L3MuBtn24WLoDFxEGHGr8=;
        b=OCnvDTZCCVRQuCICxf5TYdTMaCaPrPY41dMDiS8r1KJXW3Slq2weSPrXKyP6oZKx0G
         BTAWZ7P/ZpQ57LnzvKeg/OSoB9Kl98gWWpcxv6DrGwExaAvNzyHOSbQSnOOVx5RPwz7Q
         EZNrzynRekHSpFdptlHDrPUnJgbT/UfJ3xiKDSRxJItnbDqFJ49okecZLvOmxaOon/oz
         8XPWQJDW3RIGuHSQutUUO7rr9oSXZmR2mkVXfoO17SGVQGV4uHRifOfQFR8R5KRvW/uP
         cwJ28VW5Sb95VhvJkKlAa3u69ieLmd32K6IRDFHhBjbTljtm1v0EFiu5alSiXSFqlpNA
         mUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423520; x=1770028320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfU49Y0gQlXueUVYkkOnL1L3MuBtn24WLoDFxEGHGr8=;
        b=szLnFMatetwrHDz4BJMRcHXBv/tuqnRzliABEAtbx4txKt1diWAtZlKfemHIhCN4Pb
         nOESZ5dPA0nwafgN2VYocHvDv9JeC1fjI0CRo8P62jgSv8ObZbfZWz6PH2fB4tjH/yni
         RspYK+9OTgWM7vl03OqbRo5WnTzv7RcWQaT13VLoyoJcO7TrUODK/e+aUV6nEsDUyHjF
         NVhu/2UlVsJa3pQsadvT6WZvmTkVDKznoK20dYaKwrOiCILELChX+EVxC5CaJ8Bs/0uI
         twrBPaOK/vFt9BSMkb8KpuNVeBafuCnvL10b/roQaa4woY3zEBkwQ+CBCIDjs4/xWr+o
         T1xg==
X-Forwarded-Encrypted: i=1; AJvYcCW1BMwOndtqwX63MfTc1+uWEqS+E2c3HkvqeSP2Lmo46hJ/sA1bG2GAnggtewxUKW6XSfUKI7pTgLdJjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YziWKyFXhx2BwgdKL2hUQjCCacyINEwOQcVxTe/HoZDcyYpR5X9
	nDBfnhW15OW5Hs5pfS6wfxyUTn8oZY7BmwMn5crtBbDDgpMAN8a5eDl/Tqu/rt47suM=
X-Gm-Gg: AZuq6aJ6BWnmm3LxVinhrD+R3R18zA0Fuuh8x2D3DEOUPVeuxFs/oQIcI94Vled3Tj+
	fMWnodXR6kaBjVudw7geO0ZBfw6ys9YwuLa8RmdT9IT74J+PNG1W7GuOa62zHuii9pHBVeKJww9
	KtnSE+lxJp+a+upUOUyovsUHhDl3fTBHFRPJtPgfhMf7bH/P3KVkmJurHZ5phSljYKbdCUCcsge
	d0+LipQHZqhq6OkOp5r/w0rFOXtEo32HHg4YbBQMkOxvXxG668NQ6tuGAhP8s1SuSAEAr5nyurU
	Wu/EC9HbfkBS7xaJTidl7GSqd0Dhv6g0GCyaRIJ6R8qylwCW/JoH90tXe0b2dR9X7QVKUfslDiX
	6K2YAbq/Ak+Rf6UeIOKoRygmc3aHIu6iqHr1x2S7ePvZRGfzDbnf+ZLPJ9dV8GQMKPRoyjFwScs
	yy61WlQcl9Qa1KiKFhySIuJ+T7pYi4UJoxseesG1o=
X-Received: by 2002:a05:6000:2304:b0:435:97f6:4f43 with SMTP id ffacd0b85a97d-435ca124882mr5928172f8f.8.1769423520092;
        Mon, 26 Jan 2026 02:32:00 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm29715049f8f.10.2026.01.26.02.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:31:59 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/7] Renesas: dmaengine and ASoC fixes
Date: Mon, 26 Jan 2026 12:31:48 +0200
Message-ID: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series addresses issues identified in the DMA engine and RZ SSI
drivers.

As described in the patch "dmaengine: sh: rz-dmac: Set the Link End (LE)
bit on the last descriptor", stress testing on the Renesas RZ/G2L SoC
showed that starting all available DMA channels could cause the system
to stall after several hours of operation. This issue was resolved by
setting the Link End bit on the last descriptor of a DMA transfer.

However, after applying that fix, the SSI audio driver began to suffer
from frequent overruns and underruns. This was caused by the way the SSI
driver emulated cyclic DMA transfers: at the start of playback/capture
it initially enqueued 4 DMA descriptors as single SG transfers, and upon
completion of each descriptor, a new one was enqueued. Since there was
no indication to the DMA hardware where the descriptor list ended
(though the LE bit), the DMA engine continued transferring until the
audio stream was stopped. From time to time, audio signal spikes were
observed in the recorded file with this approach.

To address these issue, cyclic DMA support was added to the DMA engine
driver, and the SSI audio driver was reworked to use this support via
the generic PCM dmaengine APIs.

Due to the behavior described above, no Fixes tags were added to the
patches in this series, and all patches should be merged through the
same tree.

Please note that the dmaengine patches were based on top of the
following series:
- Add DMA support for RZ/T2H and RZ/N2H (https://lore.kernel.org/all/20260105114445.878262-1-cosmin-gabriel.tanislav.xa@renesas.com/)
- Add tx_status and pause/resume support (https://lore.kernel.org/all/20260120133330.3738850-1-claudiu.beznea.uj@bp.renesas.com/)

Please note that the ASoC patch is based on series:
- ASoC: renesas: rz-ssi: Cleanups (https://lore.kernel.org/all/20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com/)

Thank you,
Claudiu

Claudiu Beznea (7):
  dmaengine: sh: rz-dmac: Add enable status bit
  dmaengine: sh: rz-dmac: Add pause status bit
  dmaengine: sh: rz-dmac: Drop the update of CHCTRL_SETEN in
    channel->chctrl APIs
  dmaengine: sh: rz-dmac: Add cyclic DMA support
  dmaengine: sh: rz-dmac: Add suspend to RAM support
  ASoC: renesas: rz-ssi: Use generic PCM dmaengine APIs
  dmaengine: sh: rz-dmac: Set the Link End (LE) bit on the last
    descriptor

 drivers/dma/sh/rz-dmac.c   | 401 ++++++++++++++++++++++++++++++++++---
 sound/soc/renesas/rz-ssi.c | 355 +++++++-------------------------
 2 files changed, 452 insertions(+), 304 deletions(-)

-- 
2.43.0

