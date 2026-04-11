Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155E532E72F
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 11:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775907792; cv=none; b=qmS/QaJq4Y6nepr2zK0OuG22EbtvteHNzSW+QNUBep2RRYmbKUr513xuTem8fg+Yn/dgqcSJi1cBdqScjkDKuC6tnG2xlgoQkh2nRl244nvBIZSJDNcvgWVhopGCHxqwWYS44ASM0iJbKBqkX+EhyyUbRwbOvZ3pxnNXJ72CPns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775907792; c=relaxed/simple;
	bh=cKFhAtkhgAfTA+QAOjsxsnhy2l5B7v8pbAd2rbghqwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjHcdNseQOVt91lyTu6IqbdnVXkUplM+4LspLrbi73NgxWXXPrgzFeJkrluOOwVMj1PgfOWuuDbuRBxzD56hBI9lZhNfgPlyJLxfPgJSho30qkGePaStmi16QnupI25Hpe5iIxgkfiEJplCaAH1lAgxy0KjumDzte1Y6AedO4qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JWWGFkez; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JWWGFkez"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d03db7f87so1843219f8f.3
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 04:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775907788; x=1776512588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q1eTBRD7MumKinxlgMqLdQk94b4xlHoIm/BiwJmzTkc=;
        b=JWWGFkezFo1yDEDecIrZLJjGK42Vf6H9fJniOzTftW34XHdA/KSdoKkGZvuElKv+MK
         Z19IEKV0IhAz2eXIQgf6cGCKVsS0oOiXeiP6g0N4f0cFTvzm9Hkjv4ZPhV+fRLwJJRKR
         zB4ZQKF0KB3npU+CZIH4inalpg6wwo2QjR9N1ooDJQAGhbOnqBIt/VTKPQhxfuszUrK5
         rhnXJrhiXOfxtQ6bo1DJ+BRJPid72SP49oiZJYa2T+bHKmkx7sVULLPjCYrIOD7W1/GO
         /oG1IhGQ6c2yX5bW3YUCJ6XvhVFkUkMjO9yuWxAo/ic37ZB/++rRM0J7kTwlejMxpJxn
         hPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775907788; x=1776512588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1eTBRD7MumKinxlgMqLdQk94b4xlHoIm/BiwJmzTkc=;
        b=JQy0oyg5JjAHQKv/I5TqRqiImRZLAKEmMa0TFzUP6ZitI4/wCBC5EIUt/GrbUHshU+
         Bo4RGfX1CYSWRJwS7VfUkCoi13+ePkaR9r6qFGrlfyECZJdHc8ZfbRKZpCN/Jp+OSi3e
         bnFeA+d25TEWOAk5zJNrWV+WzvFyQy2RavTueRQ4rze5NN3LWBaxHPnRj+K4tlR8R++X
         fDizfqnYaXoZ1SNB8qxMILDBqF8SwWEwwTz+umJiFVg0QgeiINsEMczNuYSwl7C19M1L
         ZsbJfvAlJPSDCXONZ68Svq67feBGdq2S2IpXK46FEy4h4gbg4X6D86a+A0SnGZxKtVGC
         Ge5A==
X-Forwarded-Encrypted: i=1; AJvYcCVGDNIv/nVdHYmrxflNEz/rQPG/aZ4LTDwHTgdYKtK4zHay77bjuaN/pL2IZNnA8m04Goz3cTinqF2YOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdJyRAMoeiozKIHPlSN6UCqegCiSdZmpByTeMrHLMyOhn45c7+
	nAYSVHSZLhdR+5tR2tK83XEv/I8X9OCvncwhKbWp2C0ckHgtPjr+cyT7RrcxLsmpT08=
X-Gm-Gg: AeBDietOz+Rn+2WLDTZvhr1qiUnjjNZtHZyhMAUPXfCRoaCWbrg2C0XZZjWAOOrcGoz
	cuMH6OOyqZG2RsHJUvlP2KyUjMEYr/TIzNtaWKa17mojb9qdw+hjDTvbx+ZkhGED2LdZITc4G0l
	5chqPTeZzo1dv1p40tjR/LXuizo5Z1maKNpdB4sAby0I3rHZIMGRqXZGk8VYbZYnTBEQXJy9gBH
	aX/dkSKEDC+CY15gzo2HZZe7IaTjq1PbLS3pT3BPGdgO56jxkjZ+fXUFchSHlKvOx2bLZgi6z8s
	ikSHtQaaccdXUI62b29IWr+vcxLued2CI06NUZ1h8j6QRG+ALJVbP6MfwABA6RtLujYw0ntpH7Y
	7yEBf/0Yae6/j9cpl8oxfABI6UW8AnxkXC4wyU3FGMT943JYq2LKstE2BruVj3tEVXHWC1nhdLv
	qTBI7e93uyo5+biJ1Jfy7dDoGwfGMemBDZmF4WiUmp00Qyw6+R0LHk
X-Received: by 2002:a05:6000:3107:b0:43b:3e34:7fe with SMTP id ffacd0b85a97d-43d64289402mr9860136f8f.21.1775907788294;
        Sat, 11 Apr 2026 04:43:08 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm15776447f8f.33.2026.04.11.04.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 04:43:07 -0700 (PDT)
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
	long.luu.ur@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 00/17] Renesas: dmaengine and ASoC fixes
Date: Sat, 11 Apr 2026 14:42:46 +0300
Message-ID: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v4:
- collected tags
- addressed review comments got from sashiko.dev. For this:
- added patches:
-- dmaengine: sh: rz-dmac: Move interrupt request after everything is set up
-- dmaengine: sh: rz-dmac: Fix incorrect NULL check on list_first_entry()

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


Claudiu Beznea (17):
  dmaengine: sh: rz-dmac: Move interrupt request after everything is set
    up
  dmaengine: sh: rz-dmac: Fix incorrect NULL check on list_first_entry()
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

 drivers/dma/sh/rz-dmac.c   | 762 +++++++++++++++++++++++++------------
 sound/soc/renesas/Kconfig  |   1 +
 sound/soc/renesas/rz-ssi.c | 388 +++++++------------
 3 files changed, 652 insertions(+), 499 deletions(-)

-- 
2.43.0

