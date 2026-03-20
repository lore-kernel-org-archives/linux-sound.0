Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7963806CA
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 11:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774006125; cv=none; b=VKPp8NLWG0aiVDxWGEll4pAdBg14nvu/mUyxVlf8PNhmgwX2fjSDmv3ddAgkXoNOA3G5v21V376Ji1CHYqFKN0gDiGXG5ozKZMS56wz+cm3Xm8/7BPAvMyP8xTiYtZo3W+XpxXWW5SK3z6PXrXE7dCix5ZjgNaFTyyVDvRRT77k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774006125; c=relaxed/simple;
	bh=vSI4IwqxGu0eFjumdTZBx6cxeXmalzUJA2e4nqdV7cY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=neaNUISvHRU9z50DJsqKcsWoa3VSKjLJXNtzWicZu8ZX8bn1Dj5u1UXlJPGI+RBPKe64rAvvlyLfUnGFVbgcQgeN1etSUn3RCdfWn6jf32Da2rDOJJDtOiDKCEOyIAYIVMV9s5zqqDPEfT6bLppT2q+FHFs8NFlQ4iTNfn2I4+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IehB20ga; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IehB20ga"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so4881655e9.3
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 04:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1774006122; x=1774610922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJs+yjFGc4wxJBOuT7ndvWzC4803vs8mZQN493sbHhM=;
        b=IehB20gaJ9sQr8Ezs9Ubb0LuV6QKdNvKllTIWULzRTJRM0cgqA3IDErWp8/6aJMkzY
         yjy/nVfOotxAAw2JUSbr3TZlWB+nwQF+JvwltkthM4qeAoylrKjNGbf/zdZ7eZhhckK/
         WXQY1uBoEnGDDpXCGzHsfAkTQL7LHJ/uMaHHlzreJhHyANi3MFTiCdDd+PheCesQvZi7
         hMBYfGiyDD24mUAxJmVmwbTAoJTg4F67afO1heI+XCcqOo0THKADZ1Aad1vRuirL1GLA
         ed2PA1cIgTuLRpNrtokLG8tEb57bgv5oTbJvik+p3qxWkWGu1p7kq1kFUR27/XCO1Tsd
         IVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774006122; x=1774610922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJs+yjFGc4wxJBOuT7ndvWzC4803vs8mZQN493sbHhM=;
        b=nGl8KwZQ1X4GVGMyyXrCYN/++i+SuhqAcpPlYUk7Ai1h3xIXyOnsh3xM1xhSES0GCM
         VsYGE6l0ee1DB6trnuc/uKl7Up3QyY5MufOS9FNC6vO/jt4PiLaFJw6inJA5uFTGWmBo
         1ZX9lsKNO3wFFenkeMw9tfJ3CpBRaahEZs7t3UixqBBmZw5q9B7ZR+Q+DvlzKCZZ38EF
         aHWgUemv5fazr7ZJ06TsIgvSbdHD657tp9Iu7bxZlcNQ7PoJpw5oPWjrxEjazPkEfMlP
         I7KaHuRfPq7jD+WmUDyF06+g6qB/Rkl5vrM3XrfTLfFnmSazTwDluAxy7kQkJY9TudY9
         m2Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWJGM2vJnqY3LgR5ykhKn/j+6QM+Zzag8gzFVZlFWWfmp5U3Gan3ukQHW3W2GVE8WD7vjF+LelMdIIHSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP3yjJQEDwbKimqcsSFfsxmdhcK80tdPINspLqc0USQkHk2ARP
	XAqY4U2YdTz7UD6WzEjp/FtPE3ose6HNeG6rdNk0AnCd6Z4O3rb7aguVa7UTaQsrp/o=
X-Gm-Gg: ATEYQzyk8PBe4g4G0VVcAprdvt/2n3cOxaCoHotBiYM/j8UeHBKhwTXiOZuChH/t5Sn
	GDfUN45X1doS/D5+jj32fPArP58k8qlVCk3lxH4yaVX66pq0kXW5TfmG+HUQmdy9YCSMXrvk7AR
	7zQRoHiel5U3hG8oKQQtUmS0QAdd4If616NN6J6kQOVrgXWCKdfvdVsR8P/lmJgkdJZzw2qmbJy
	5XCl48VBwPqnE3hAOSlOR0zbM5hUuHsYaeGis2hn1nkHM1sYmxDeIwiUtG6E40S2MDbLWEhkbXn
	vTMlcEQ5ji3EL+khMNzrCCSnzjLQWX0hOlQEWuYalGcHEmGUQXnWDQLmIJsj88CA1IwKWJ848Gm
	I0dGVYUquBC/xFPCdVAqKAPCUD8FhvBvUyQakuYJuhKAYSeUmzGMd+1oDH6pGrReg8dgAxl4unR
	DtKOBUIimlWwlrLVt447sOAv/Om4YvMztDmSGi7KkUFcr6Z9sl1ybx
X-Received: by 2002:a05:600c:3b8c:b0:486:d76c:fa51 with SMTP id 5b1f17b1804b1-486ff03ffa5mr34883115e9.27.1774006121958;
        Fri, 20 Mar 2026 04:28:41 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe836784sm49869935e9.13.2026.03.20.04.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:28:41 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com,
	john.madieu.xa@bp.renesas.com,
	kuninori.morimoto.gx@renesas.com,
	tommaso.merciai.xr@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/7] Renesas: dmaengine and ASoC fixes
Date: Fri, 20 Mar 2026 13:28:31 +0200
Message-ID: <20260320112838.2200198-1-claudiu.beznea.uj@bp.renesas.com>
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

In case this series will be merged this release cycle, best would
be to go though the DMA tree as the DMA changes are based on the series
at [1] which was merged on March 17th. Otherwise, any of the ASoC or DMA
tree should be good.

Thank you,
Claudiu

Changes in v2:
- fixed typos in patch descriptions and patch titles
- updated "ASoC: renesas: rz-ssi: Use generic PCM dmaengine APIs"
  to fix the PIO mode
- in patch "dmaengine: sh: rz-dmac: Add suspend to RAM support"
  clear the RZ_DMAC_CHAN_STATUS_SYS_SUSPENDED status bit for
  channel w/o RZ_DMAC_CHAN_STATUS_PAUSED_INTERNAL
- per-patch updates can be found in individual patches changelog 
- rebased on top of next-20260319
- updated the cover letter

[1] https://lore.kernel.org/all/20260316133252.240348-1-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (7):
  dmaengine: sh: rz-dmac: Add enable status bit
  dmaengine: sh: rz-dmac: Add pause status bit
  dmaengine: sh: rz-dmac: Drop the update of channel->chctrl with
    CHCTRL_SETEN
  dmaengine: sh: rz-dmac: Add cyclic DMA support
  dmaengine: sh: rz-dmac: Add suspend to RAM support
  ASoC: renesas: rz-ssi: Use generic PCM dmaengine APIs
  dmaengine: sh: rz-dmac: Set the Link End (LE) bit on the last
    descriptor

 drivers/dma/sh/rz-dmac.c   | 403 ++++++++++++++++++++++++++++++++++---
 sound/soc/renesas/Kconfig  |   1 +
 sound/soc/renesas/rz-ssi.c | 348 +++++++++-----------------------
 3 files changed, 470 insertions(+), 282 deletions(-)

-- 
2.43.0

