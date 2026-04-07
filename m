Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FCE3783C9
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 13:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568930; cv=none; b=SWkis6hpCML9RwpQaE9bptAuRVOCPelrTyVDM1UUKuPIk817MvPXVeYqssFJZDCMme3Phn5fIuIMh8AHF22pHk6mLQZvyVl4fa5mg/pyBVyzT2t+AYMvYmTvzopBLfGWmJScttXfUq2AKNMk6AtZe1D7ZxIUnv2luV0r91DwuEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568930; c=relaxed/simple;
	bh=o2x27ie2cRLK3/IPEfnk02K85UTWqTL0Mqeurw5+xuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nZPVKCnBsqaVqDbIISRFgEYf36dNtUqfqngU5iG5co/vQFHpmE5VdeMK0lIviZ8+JNnGcDPQShkadqDBaMl494FTWETvEwlNVmcNNeQoN7EPq6b7jdbBeXenUhvpyBW9B+zUPFoXJ+RvOi3BXyDFFWdkbf1uuJtMTfruj6idSvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HWOcSSbu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HWOcSSbu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso28283485e9.2
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 06:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568927; x=1776173727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3LJdsgaB5y8vkydWsyskwB8EOPuNOYx+V9eGhmYtIWE=;
        b=HWOcSSbuHU50E8X5N0fRdRYw2ke82F9562zLH/FqwSKBDBmiOoOUfS1CqypkIxZpWT
         9ObXM7ptdG+ioAb7GqDek/zNK0aBP8pH533qOkW49HrRebxGARMjeVya7msSuwP+d0kZ
         TNLK0q6N/8ART6WB40GxogAneM9Ts80JVFakMyCM0+4H5+t5yN3PNHgzKtxYtRYLnFLb
         ZcSN1//kL8f6yZVeSLJIoBNHq58BhpSJYQNk8IuiSGRIGIUjYlopUBWSwwmypOOZAYpU
         SJ7pTQw+PKveEkn8xDvz/gRHj0c1AzdiWGga1nI+ie/Vr6PjRcMP+cJYxs5Hc/Aiublx
         MPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568927; x=1776173727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LJdsgaB5y8vkydWsyskwB8EOPuNOYx+V9eGhmYtIWE=;
        b=DFmE7HlgzOGu7i4h0UxmU37l/I1wY1ZOMj/5VmmEhbOKYTYjhrmbH7csFZoXaygt2p
         hKcbhjjsFSCa5d3e4KoRvscLsA8UV7d5VtNatM9/HyPy+loXViGiZzMG6QnCe+ReNPQt
         PcnEl6L/Xf4PAiEJt/6F9YqeA8b6pu7C4xFifUq02SLb0H8WXDOoPbYY+q6NJxXVjmyv
         qK1xBU2gNTkZK2KyBF1uI/WCtVLIwBEjNyrp+ialii+3lOvJgGDlIxIoFyaHqzfMZI2P
         KWG+GuS6mJZ9pbQ4cS3ylro7u/u6IkMeCuLb1CHapG6bgT2nELhOq+STQWeBioLruAew
         RUyg==
X-Forwarded-Encrypted: i=1; AJvYcCVicaMBbxCUJEE9QaV0qZklyg+fFwyRktzZnEErcPZt5qESW1XAgYd/HPJg43raP8N4D/mVzYSwqr/n7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdkt3pLU+YJhi72Ijl/qcKF+Nk/tXAAgjSr8qlBbCo1LPstoR5
	kwpu/+mBcOx/0vEg8xJEMN7Yr++7D7drF01g94no3mfYNZUSK+1zku8jPEGLL/wGZYs=
X-Gm-Gg: AeBDiev4P7zYtexQpFgJWQBrxRxEL1uLwM3J6m5oKO2D8zCRtcQcEp5OYeArTC3MT/4
	vXL2QgY6coSJJmMh5PsYBTlj1V0xqCBZwLQnOV5OsgVEFQQZ1r0YHWr9Bo+yEdfe/Ce1kTkCf0t
	bbpscPewaT1S420jjDLtd49+5PrXt7oJv1G2fLHGbij/hQbZjsz3ctGYs/BT9BdZGTxADPn9g9w
	nISrhaLFN//djgXmN1yCZcgBI4G2xgEid7UclQby2b/OoUpzjZWQyna9o0D+WpR34SHX1x4j9GT
	5j3Qp4QKsUTMdvITGf8EFZCq1Gpizj8KKMkwPyAvAGI3+hq4CeFHJcJgDsX2CEOQd1bbnVI2LCE
	qddEhHAH7w2a2WUwQ9WWLGUiOk1xJ4HTUvhtinJgQk88dMglhTmnXdqjkkSKa40mwTepea9pL9H
	kKGG2M2XiM57kVn5v+bsKLPGEoibq4DDeaSVDJx4wzxI04gF27vsPV
X-Received: by 2002:a05:600c:1e24:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-488c078f73fmr30084395e9.26.1775568926571;
        Tue, 07 Apr 2026 06:35:26 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:26 -0700 (PDT)
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
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 00/15] Renesas: dmaengine and ASoC fixes
Date: Tue,  7 Apr 2026 16:34:52 +0300
Message-ID: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v3:
- addressed review comments got from sashiko.dev. For this:
- added patches 1-9
- added patch "ASoC: renesas: rz-ssi: Add pause support"
- dropped patches:
-- dmaengine: sh: rz-dmac: Add enable status bit
-- dmaengine: sh: rz-dmac: Add pause status bit

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


Claudiu Beznea (15):
  dmaengine: sh: rz-dmac: Use list_first_entry_or_null()
  dmaengine: sh: rz-dmac: Use rz_dmac_disable_hw()
  dmaengine: sh: rz-dmac: Do not disable the channel on error
  dmaengine: sh: rz-dmac: Add helper to compute the lmdesc address
  dmaengine: sh: rz-dmac: Save the start LM descriptor
  dmaengine: sh: rz-dmac: Add helper to check if the channel is enabled
  dmaengine: sh: rz-dmac: Add helper to check if the channel is paused
  dmaengine: sh: rz-dmac: Use virt-dma APIs for channel descriptor
    processing
  dmaengine: sh: rz-dmac: Refactor pause/resume code
  dmaengine: sh: rz-dmac: Drop the update of channel->chctrl with
    CHCTRL_SETEN
  dmaengine: sh: rz-dmac: Add cyclic DMA support
  dmaengine: sh: rz-dmac: Add suspend to RAM support
  ASoC: renesas: rz-ssi: Add pause support
  ASoC: renesas: rz-ssi: Use generic PCM dmaengine APIs
  dmaengine: sh: rz-dmac: Set the Link End (LE) bit on the last
    descriptor

 drivers/dma/sh/rz-dmac.c   | 673 ++++++++++++++++++++++++++-----------
 sound/soc/renesas/Kconfig  |   1 +
 sound/soc/renesas/rz-ssi.c | 375 +++++++--------------
 3 files changed, 599 insertions(+), 450 deletions(-)

-- 
2.43.0

