Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6AF3E639C
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 11:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005139; cv=none; b=nMzauJ+gcPrlR+kDqtpS2Dr41/DGvhaEFGj8eLdF3mTno5Xo7GmxS38CPsjgwTeOGL69etDfS2HsMQONJBssCJ/e3s4X5ftqhJg/GRLJSYXosOO52hHHUDsRwAXlWwvHbYKD1lSAdk5rLCYIujj9/NwNp2YmWKtP2mAqDeZjp/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005139; c=relaxed/simple;
	bh=mVw0y+bHtOArz6HJGNlsSNM7DFC9Jx00bD8nGe8taNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VRkxzsyeZlNHdM5gpw/nPCPdgjd1HKw3sGi0bAZPLyQ84MwwPcbsvzTO1vGMmnIzeuCMBsuUeJQRP/z5L3eDkeACz4ho6l3gpU/1md5e4ZcmhU3mfzylvudNBft5HXoBWB1+6nHPgrnlJ5TGXBQsYISvOvei9FO/4Tdp6skIlkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rp7hQDul; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rp7hQDul"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c3315c5dso57230885ad.3
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 04:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005136; x=1781609936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tv9NcVNNm5k10R2xclc5mA3XBryiKRvqVdDaYxEN+cs=;
        b=rp7hQDulYDFIYKZz90W5fbukaYy4kpE1mYZzytsiC3SgTxnfd2l4YgWFjSqds7z0Br
         QwkI8XGwNSEbE7S8A095ekWqk6H/Vd4BNMEr99IfKr1AUX9UXOnnjehkAGGiDevcI/kB
         RvFj0t0JzI1bycHera3QSAIOnDye0FfozdHl8r/rLT6FTgzfhaOMC4mgkhWTHc/AWmvo
         itXQ+61EHUt3ipEV4LY6hebZTxAxyV7yv83SXPl1Deavn1EYEJRJ6Cu8/sDUo0fFnMAU
         nIL0TnkpL/l6xl6Y+ravunmk7WFX5G/Ha6+TfDIbH3dGO1kYLc92vPpTcjG6noi5mFcp
         s6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005136; x=1781609936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tv9NcVNNm5k10R2xclc5mA3XBryiKRvqVdDaYxEN+cs=;
        b=gl/SRd7WldfsvAs64Wmaj0E2e5GBhfhIhdhk9/UfsQhdBFsEFMqtyFZB1ROM4UcOdI
         +kakRBfQ94YKIgxyGbsWDr2rLIqUgA6QBl6NjNnkFCunrZrc1G5LdSSuVVz0uUuaEB3R
         JDxH3LSDFHaVlczbfbg5rVz6heNbkZiSJ4yHDx3icllFcAVWcyQW+HX6PKhPhEYjtT3G
         wm1GR5/9ePTeXmhHW8vlPHvuALygSYp/ms6kTGeWiSyxml6b7/orxsAtJeBljmrDulKS
         4ugK9N87jF3MwOMhnz8PwsKW7F8NtN2VMncfI2Mg1+jHjgq7nzFE4A6HIAqL3p9HyJHS
         Kbeg==
X-Forwarded-Encrypted: i=1; AFNElJ+i4NG4dRUkbRNcHkfATVrOPIDb+d00Kot9Szmq8Dl6XfjiKFXA9F862MZ5EAvVQZhIHt9gzoalPgzaXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMLxL2o8ORgoT3JE28qWSNkABkVdFtrWDwUE5ZKovwwAS7pMuK
	aBv1w0OQZIzlqKm3f+dAAMBvVKJSkXuddSp8o+G61Q43BYkXnOfvztgM
X-Gm-Gg: Acq92OFQYV7/0xevrxJ/ohO+w4DleUsoiNr2qMKxXYPQGc13X5/6zUIjG48bg6rkY9g
	gBH3FXBmfr56Lv3GiHXnjSxgtPiBLY1kBF/tBxZKXk5v9ugDAT4iPYtahJFG1fCaWaVQa2m089x
	Rg8J3zN9znujZm+YMXBkH/OG05WSqUJPy3v+uZFIRCLqyfyYR4VYU8rHgNeqCpqwfBxRA/sijeQ
	P4FZ6x3WetZ3TWv/pvQQKDsR5mRC3B8OGlW5N3CnW0CsfCrUPvE+av8MChrm5DLUr8CgOF1p72w
	vew2gm179P2IrlXAJndiKo0D/8Gs8eOTpDdVseAyHQHvsoNtEgw5hUr18NFRild+8G8pLnHICIn
	VnQVi5/ir+fbLYvKfXHWmZuS+s+dNEBVny9WCjp27o69ghrxD7yeTXAqlkkzF2YZKZfDCVO27db
	d9GEklIvqO9G1GXWSAZ8XrOGV64sk3wkSAxHgqH7srok7BUykS4xnRFxThmaxGoagyO5p+
X-Received: by 2002:a17:902:fc50:b0:2c0:e5ee:f554 with SMTP id d9443c01a7336-2c1e80d29b7mr222699735ad.8.1781005136393;
        Tue, 09 Jun 2026 04:38:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:38:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v6 00/11] ASoC: renesas: fsi: Fix system hang by adding SPU clock
Date: Tue,  9 Jun 2026 18:38:25 +0700
Message-ID: <20260609113836.45079-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

The FSI on r8a7740 requires the SPU clock to be enabled before accessing
its internal registers. Without it, register accesses may hang the system
even when the FSI functional clock is enabled.

Previously, the SPU clock remained enabled because it was left running by
the bootloader. After adding the SPU clock to the device tree, it is
automatically disabled once system initialization completes.

This series adds the missing clocks and aligns their names with those used
by the driver.

Following feedback from Morimoto-san, the driver is also refactored to
improve stability. Clock initialization is moved from the runtime path to
the probe function to simplify the flow and avoid redundant setup.
Additionally, the shutdown sequence is reordered to ensure the stream is
stopped before the hardware is shut down.

The driver currently uses clk_enable()/clk_disable() without matching
clk_prepare()/clk_unprepare() handling. This series adds the missing
prepare/unprepare operations and moves them into startup/shutdown paths,
since clk_prepare() may sleep and therefore must not be called from 
atomic contexts.

The series also fixes a race where in-flight IRQ handlers may continue
accessing registers after the SPU clock has been disabled during shutdown.


Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.
 - DT binding updates (drop uniqueItems, commit message).
 - Improve probe and clock error handling.
 - Small improvements in clock handling paths.

Changes in v5:
 - Drop spu_count and rely on the clk core for clock reference counting.
 - Reorder the patch series as suggested by Morimoto-san.
 - Update the probe error handling path to ensure proper cleanup on
   failure.

Changes in v4:
 - use fsi_stream_is_working() for Fixed a race where in-flight IRQ 
   handlers following Morimoto-san's suggestions
 - Handle the return value of fsi_clk_init() to properly support deferred 
   probe, as suggested by Mark.
 - Split the clock refactoring into a devm cleanup patch and a refactor 
   patch, as suggested by Morimoto-san.
 - Update dt-bindings based on feedback from Krzysztof, Rob, and Geert.

Changes in v3:
 - Reordered the patches following Morimoto-san's suggestions
 - Updated the DT bindings based on Geert's feedback and renamed the
   "own" clock to "fck"
 - Added fsi_clk_prepare()/fsi_clk_unprepare() and moved them into
   dai_startup()/dai_shutdown()
 - Fixed a race where in-flight IRQ handlers could continue accessing
   registers after the SPU clock had been disabled

Changes in v2:
 - DT Bindings:
   Define "own" clock and add "spu", "icka/b", "diva/b", "xcka/b" to the 
   clock tree.
   Use YAML anchors and "if" rules to enforce clock-names and r8a7740 
   requirements.
   Relocate allOf block and update example with full 8-clock configuration.

 - DTS:
   Rename "fsi" clock to "own" to match driver implementation.
   Add missing clock names: "icka", "ickb", "diva", "divb", "xcka", "xckb".
 
 - In the driver:
   Refactor clock initialization.
   Reorder shutdown: stop stream before hardware shutdown.
   Move SPU clock enable/disable handling to fsi_hw_startup/shutdown.

v5 links:
   https://lore.kernel.org/all/20260609013107.5995-1-phucduc.bui@gmail.com/
v4 links:
   https://lore.kernel.org/all/20260605121955.105661-1-phucduc.bui@gmail.com/
v3 links:
   https://lore.kernel.org/all/20260510084303.122426-1-phucduc.bui@gmail.com/
v2 links: 
   https://lore.kernel.org/all/20260413100700.30995-1-phucduc.bui@gmail.com/
v1 links : 
   https://lore.kernel.org/all/20260403112655.167593-1-phucduc.bui@gmail.com/

Testing:
  - Verified on r8a7740 (Armadillo-800EVA): FSI slave / Codec master mode.
    The system no longer hangs. aplay works correctly, while arecord has 
    some noise in the recorded file (this likely needs further tuning, but
    it is not part of this patch series). 
  - FSI master mode is currently compile-tested only. Full verification
    requires a dedicated HDMI driver (FSIB) or hardware modifications 
    (resoldering board resistors) (FSIA).
  - Youtube video link of the test process (from v3 verification):
    https://youtu.be/w3H4v5djr7M

Best regards,
Phuc


bui duc phuc (11):
  ASoC: dt-bindings: renesas,fsi: add support multiple clocks
  ARM: dts: renesas: r8a7740: Add clocks for FSI
  ASoC: renesas: fsi: Fix trigger stop ordering
  ASoC: renesas: fsi: Move fsi_stream_is_working()
  ASoC: renesas: fsi: Fix register access from in-flight IRQ after
    shutdown
  ASoC: renesas: fsi: Move fsi_clk_init()
  ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
  ASoC: renesas: fsi: refactor clock initialization
  ASoC: renesas: fsi: Add SPU clock support
  ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
  ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown

 .../bindings/sound/renesas,fsi.yaml           |  60 +++-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        |  12 +-
 sound/soc/renesas/fsi.c                       | 267 ++++++++++++------
 3 files changed, 244 insertions(+), 95 deletions(-)

-- 
2.43.0

