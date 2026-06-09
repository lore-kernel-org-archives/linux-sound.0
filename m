Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A3632BF41
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 01:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968693; cv=none; b=noiBuw/AUGM1qgslm0NsnEcvrxmMq0c9Tw8RNArjN7WByIunAlEbtoJ5Fko2mhlmnfd+G53ykuTWesM5+9tLZbFCnh1rxjENHH7hR0xH3m/3S/XmJUF5AuVC9+f5ykqakTGyU/xvJ45NNBwqVXTmu3Xxs6TN8/n90SSqEMNMu1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968693; c=relaxed/simple;
	bh=UBq/TfHyDSOxgJXlZFUCdop4eaB/vfrndG7P4URnSsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5BGzBtzigi96UwaEZqeB1Uf0jwtCEr1AjPoN++TocSfkT59+XKJ/Vkdr7Pi1Nfu8M/+Jcu60QtL59iUB/+7i14NNwn5Gh8EN5aT7h464sm/tKLbhR+xcCBS9C4Olvtj712Iw47alcDt356QK5K4PxCyHZXa4hKV6IPHNoJRuCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mw88FGxM; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mw88FGxM"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf0ddaf50fso33699275ad.1
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 18:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968685; x=1781573485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=02FJ6YGr3OixEk6iz8PM1UvhvRNKfCs847PeFoWoGHg=;
        b=mw88FGxM0D8YwrO27t8wG+B9Eu9iRdP1FvfTkU2RIr4ek9BFUi0dan1dPgeqJtj2KR
         UuJXrU6BQK7k3RyIOgKQBU92xLArKaQp95BrmuwUnrbtRDd8j88a80V21c5DJ7SCYxIa
         r02v0ZXtqGM1PhBlEKW+AtLUJTOyTLcoaLDUF3aO+Gqa3TnU8MllEDHzNOddiXjeaFm+
         nvT454C72cQpPfkguGW1PDc9/poa2SHcdtbSwwQUA/1MxbqudTUbRFLnRUppqNh05GkQ
         6xXoIrmycT+zur+0Zukl5RIpnGpsix7gyddtN4CmAxV9jA9CRuMxQSydaUX9ObuoJxkj
         Vi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968685; x=1781573485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02FJ6YGr3OixEk6iz8PM1UvhvRNKfCs847PeFoWoGHg=;
        b=nNHBOb9LAFyzvGbSQgKBK5So6K6ThXpo1aN5WX5Si+IqJvWtBmS5p7nCDLL2emSNRG
         9dLWwW5rPryrdggNdmdPltJb9ovC79yUFNMmsFvj1XgvvUJm/L0DXkjtphGlzRDeLHzn
         x+kYk6RRC6AbpkHJlRq5cAttNr+KTalRk1gghiz23JqkoUYohYpJqCwoUTqGcccRc9Kg
         TEDCk7/sWJGtdM1tlvFNGwiT5l89/0zNI7PkOjxcdlc8l+P6Muyg2286Thi/6ylUEYw7
         nNoTml8EONi4mTtNkIgnZiISkEuqHLXYJljPIo75w+577a1Ic2eyYYoYEgLzcaVoqY/S
         PtyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OYGt/PoQrocJvKw/GHx7PV99pGcDaYVZES/vR1kYGyxkTVIclAC7ZSL1l/wS/L1OL1OZqBEM23tn3Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFBfpiGnENTYPoeNgl7IOROhXMP7wTRna55R6N++qhMEdOB2Zs
	hmMxy0ou2j2QnpdXE1DAFh+7OvkuvJec8TMeKn7NpBWICFeemB4iP50s
X-Gm-Gg: Acq92OGpgUeX+9PKom4N0dYWQFSJVgDIVKzr8lIVQQX4URkIEnCVj22y4MmTuC0WNM+
	9jKLASzYDJ/+B4bL+0IzVBgFkXmxDcA5IQJLo6FEF+le67sIVHhcxPNRGXBq1CPApULOLGTpa6f
	EEoOWVG1SIcKxdFmIPv2zQLGFmGLxO/+ZWds34AUZOZ0cV5tmw/Pc4bcbxJNyOFjeOMsbajN8c8
	HgbzXdudG+YOvAUENV8zN1jvvQ8brxXSbiSZElWflHZInMVjF3uxX7iQ7B35I0RtFtqMGfZd2ij
	FGARMSkZ3IZiqLyoxCiQUrO59Lma4tGiZs8qEmTAbOZadnDQ22idPLiCEYdO9+R3SfaeMg9cYuq
	p6KLa0DDFdGVscpQ4hSvGW8q0WEIY7czzJXqtonbJ9D0TgFjXQydR4v+lcOkts2DzCY1D16dn33
	VtBam9/evf2vdknyHMzqLxZPhbdkBiFkfRriTlTHLFx/pOsUpO4xw9EGBzZlY9DJaEdoRO
X-Received: by 2002:a17:903:46c3:b0:2c1:13b5:6c24 with SMTP id d9443c01a7336-2c1e7f922a9mr188591745ad.20.1780968684858;
        Mon, 08 Jun 2026 18:31:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:24 -0700 (PDT)
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
Subject: [PATCH v5 00/11] ASoC: renesas: fsi: Fix system hang by adding SPU clock
Date: Tue,  9 Jun 2026 08:30:56 +0700
Message-ID: <20260609013107.5995-1-phucduc.bui@gmail.com>
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

 .../bindings/sound/renesas,fsi.yaml           |  61 ++++-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        |  12 +-
 sound/soc/renesas/fsi.c                       | 246 ++++++++++++------
 3 files changed, 228 insertions(+), 91 deletions(-)

-- 
2.43.0

