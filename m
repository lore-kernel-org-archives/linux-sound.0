Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7453036BCE8
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 08:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402622; cv=none; b=r3pKoQwHIfJvGcqq0R5TbEqegqGKV/Sht2ujyNdVSyL0TGPHbVpDVW1KPc2wfaoYBhW/gVif7tcsoXgmbgwhdoQqjjlPivx+Z0wCAktEVh2Kkxxz6etKg5DAHjI+C0h24ltWrX3ZYCR+8HF+ctEGlUpCHsTSTtWADIHiBvey/Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402622; c=relaxed/simple;
	bh=QT5v84YT0gPkdJLU3al2+Bl4V5DWyS5LuIxcIGWNNNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n4Lnw7whCaw/4VEaI2u69iCLqkj2GUjA1JtmE0x2m2k1mG+gGrVH97CYz3e61/YYDyp23JJnOTfRw9XSCZIpuFr7R3qt7tqHDCUEEKEFpCvXNRYUXiNoHRFZARCs5QsbPFPaVuZudPOeVYRyc+jgkBtzAZ/NAfVQdnYr9J+vWlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dyhBAe5o; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyhBAe5o"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ba928852a5so22005125ad.1
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 01:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402619; x=1779007419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ditQC+yU7Iehjh68zsCFLD1izvDINyIjYsF2jxcFgoo=;
        b=dyhBAe5oNqZVMF/7N/3hgieTnNl4WdQzW8VNmeJSu5JcINRlPRSY7ZdOOuJb3J8gL1
         oE9jfX8FLEl69vC8xB6ED3bNUlZjsvvVwaZEtNRigSiQLo6Pd6I3nGcPudGu9QaIA7aI
         RlVHFRAz+MdFtziW1h4xgkTazp7PPyCJLa1/hTaXzaYGBiLZcWbg3LWQfPKbps7lThlt
         dNOLdf2WekH0/izItuorRd4fpBS9KWCJRkv6U/JQqqVX8na1TxqrE5lVo+fMac7JsFD0
         /7ftBIB4R2WaTq/7VgIUbAv266/W5WbEXOMN55LOz6ylJatR0Pqzc4JawVMML6AQDaJv
         8FKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402619; x=1779007419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ditQC+yU7Iehjh68zsCFLD1izvDINyIjYsF2jxcFgoo=;
        b=UE9EECtiENnEF+2Lr/SLn1qVD4Bk16PD6wpoC6huOnm5o/+qrpLtrbQ3hAXhSf9GDN
         HzNksu2S72Jc2jYI/KwARqAwS3byTJsTZevvS69EidF0KyN4AsdQeg4OkGi3UT7/SJ1y
         U+R4IWfBHfjJhkpVJy6rjVT9YpaHmhL+PQCAm98rJynWYMibpMZwfi4oEqO50bbEsHl7
         ithtfW/1LwimOz5orRODBhYi0/xm/uUTc5YF4lLgJPiKsMygCG0Y08j2aoCuu1svtb6j
         rZDUuNW9U8zgx0FimvArhABs+LYXncJcZWH448Ana9K9VVPF7eNtv9kn7SRjfjOt3hi4
         EhJg==
X-Forwarded-Encrypted: i=1; AFNElJ8GoYhBcvdV6GBiFQ0U8e2/z413ewRvc7jNwW1RiuaMNPOFfOXUA5BrJKtlJnJJnwvP4vA+wkph6HEnog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRIQrH8QMDpnIIrXdjqBzOCQjcRn0U18Uup3eoSasAMjKgFAX0
	1QZHJ+nQgQxeHW+jnV6nHWTxOoZVTRulnCFudg95RfRlTo6nagUA2TJq
X-Gm-Gg: Acq92OG7TD9EIzbXMiZ+ndV1VOqYyOgI69oWT9jGxbdhCAEZTMfX9RPsOT3x9//6LBL
	YwgqIB5azRUapuWgtiMivJN0rpRubaPoDRuVdbyONdop90uJ0NK4imDOgQGFnSgizpv2AOBs+Gy
	n2LGeE/poVSDvN7o+GZX43HY8aRvpnW57N/n8D6ApUsZVI81wlQ9SiEn+E8OQgmKU4AhLJsvZD+
	jG72RHRka3hejRH/WGCrDQ74RbdycNZJA76nfsq2q35BD/5I1ova6pZWHe+J+JV5iTvtHqRf3tL
	bXOsz0XD11flagt2bhEGF5D3i17MCJL0hXrRap7INDprOaBILhFuHqgBSUjItEJOf5ndifRCwlV
	/eEJ96yYdm1ro9tu68hDMEs2R7g9yhITNZngQNT98/qBbYy2YOoHBr3ekQPibK3OD16+aa9HPay
	w/1ThmGg5AaAyeZk6XCi1dhc/M80Ab1pZSIM7QQ0ahmabyNhlTPKw9e7Jb4w==
X-Received: by 2002:a17:902:c950:b0:2b2:b117:1e1b with SMTP id d9443c01a7336-2bc7a9d07bdmr54491825ad.17.1778402619187;
        Sun, 10 May 2026 01:43:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:43:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 00/10] ASoC: renesas: fsi: Fix system hang by adding SPU clock
Date: Sun, 10 May 2026 15:42:53 +0700
Message-ID: <20260510084303.122426-1-phucduc.bui@gmail.com>
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


v2 links: 
   https://lore.kernel.org/all/20260413100700.30995-1-phucduc.bui@gmail.com/
v1 links : 
   https://lore.kernel.org/all/20260403112655.167593-1-phucduc.bui@gmail.com/

Testing:
  - Verified on r8a7740 (Armadillo-800EVA): FSI slave / Codec master mode.
    The system no longer hangs. aplay works correctly, while arecord has 
    some noise in the recorded file (this likely needs further tuning, but
    it is not part of this patch series). 
    The test video link is provided below.
  - FSI master mode is currently compile-tested only. Full verification
    requires a dedicated HDMI driver (FSIB) or hardware modifications 
    (resoldering board resistors) (FSIA).
  - Kernel config gist link : 
    https://gist.github.com/BuiDucPhuc/fc9e5c3ab7a14766eecb4ce568f1cf17
  - Youtube video link of the test process
    https://youtu.be/w3H4v5djr7M

Best regards,
Phuc

bui duc phuc (10):
  ASoC: dt-bindings: renesas,fsi: add support multiple clocks
  arm: dts: renesas: r8a7740: Add clocks for FSI
  ASoC: renesas: fsi: Fix trigger stop ordering
  ASoC: renesas: fsi: Fix register access from in-flight IRQ after
    shutdown
  ASoC: renesas: fsi: Move fsi_clk_init()
  ASoC: renesas: fsi: Add shared SPU clock support
  ASoC: renesas: fsi: refactor clock initialization
  ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
  ASoC: renesas: fsi: Use clock prepare handling in startup/shutdown
  ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown

 .../bindings/sound/renesas,fsi.yaml           |  27 +-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        |  12 +-
 sound/soc/renesas/fsi.c                       | 268 +++++++++++++-----
 3 files changed, 235 insertions(+), 72 deletions(-)

-- 
2.43.0

