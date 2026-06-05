Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AA318C332
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662017; cv=none; b=Jurn9arrW0UdzaB+pIu0M2pgZ3zcDvw8kzbVE/HEtv/TL8bZNYLqMK6HKBASgrVyooq+/Xr39AAKgQhLcOuPhaH4bVN6vqz268vBgSmgjzRTZFRMCuDJDKwbMpj12l/ULD8W4sMUQe+8rDnn66bFywE/NZeCKlcPtemo7mf/LbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662017; c=relaxed/simple;
	bh=4fqm41jFg92gyqFNJrCUrFZlM+usXbmuU/UIVhRwMzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AA0oNr8ddcPAaDxlx2sYqEzUV7oTpIg8YjCcAQ7vnsHArITa6wNax+Ya3aFVkWO/+UiBVWg0b8RKwsjJkRgd8rhTiihgUW1gdIZYUa0paEjPlrR7IHUpJq9G+QfyLLfFBjsArn6AOzrHTkdAe0ao5cBGzUBXUl6ScDR0esIvROM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQwYiDBA; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQwYiDBA"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8424b6792efso656284b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 05:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662014; x=1781266814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hEMew3UN10dz8c+0NrezgyqXaJn7p0nQbi3hUDkdphs=;
        b=rQwYiDBA2v1cp7ijR7UaPzj+O+UiK1Jr4EWeNEt4EE+2swB8DTID5yxNDsa05CcXvC
         tcaihovzlOML0L20FXote2nlqRrePx5EEf7QX59ijlFbKjmm+GBPffApDGL3AZplwMWh
         HlMONwFkxzFrOQMoomrrFYaHzk70LE+3QnUE7D4pmcsOzykvG0rWkNUFqy0xNVeqDR/l
         pfTYfzjqiykQ+IYEXaZ1JzYhkkfAv76c+c0NyL90zGqZLl9xDqCHRR5bf4Gvf2wmX9KB
         YgvbStlZsxaSPnMeA1idd8+l6W21eRH+gWN8a3vfb50oEiwWK+ND2fyuPMxyFi1VkkOu
         4OWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662014; x=1781266814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEMew3UN10dz8c+0NrezgyqXaJn7p0nQbi3hUDkdphs=;
        b=O7kK2MGcczaXE1c6sKtYxk0ektFY0E0KCIDNM8DXe4JMHIQ05QF0Q67Lx7IjgptEVv
         rMArHYiezZBBjz79MUOslnPPPVkw6/6N8kOzRqHK4avn+UqWOVJ7EJKt3mHJJS9rTCXP
         RNUAKBr+z9o77vkRqadUu16BAYhjlo02dfP5/A7O3URblayjW/7nG9HxXv/n3JJSylmM
         Z2EdmMiPYpqLkiA0TCHg07hxSw/pVgP30HaY0bFR4ZVUZ+iafngcXTfGPl4trZHHVsQO
         TDJh8KahC+D0CfNqKfAisWRl12E7QNfN8i+6mU7xnnGtVZ5g+d1l4mF99IfhntTwm3uq
         jeLg==
X-Forwarded-Encrypted: i=1; AFNElJ9LwV0LjioB1SX5qAWRFSClc1v+zZQtdyRp7VEYdMvh3rLanU07nNyhtVwnGEk3fru/tLDim1zjObeh8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjbjJp5o9296pFikcrKk3KZlXgc/zEKjCoheKjKfzYkDiPeErE
	+IIuyebcGIzgx7M14vxLAT0dMHyfF08R08vmL8w1R/2X/s6gi+3SOKeK
X-Gm-Gg: Acq92OFY4UDDS1UZ+eWF6gH8CzgQh7eKGRyjI3cc56ILe4Oc+3Yhd4hL23orxoisAqQ
	AQYLQOWztsBPN/DQF6S/d2RfUaunFcGOEAA0uIqURR71Mxogi5mdxeC0/0zXnLtSB7WYQiGJppU
	tXvFERnauWjG0haNzdmtRiRm6gTnORyEjy4JfrzwQtDg8qK/WTcUrEfFFweNE0BiqcooBLS1UdF
	S0gQLo1guEzJY4qNen3umYe7Kg9i52ivJrxTq3ndYG9AzvFhDWDirZT7EovuhjGoz/Td+3U+NKQ
	q7A6952Gj4TtfltVMfJdAT7MJkmWDbVE3y5uoSmbBZ6+QGwuPu24+YkTfm1v5KiEZ7sHwdPIn7E
	ZKQJ4WXFCQVrsDB6+EyUt5LAfKqyqlmzVvHLAUYf/M/3PagV375SRLRou6kVEK/S8BtGtETSapm
	MztZfgB+PV2D5Xavf3GrZlL2v8cKH+oYkGba8mhzYOE2ZnnLuCyYM6bPWwt+qyn/DIVBQu
X-Received: by 2002:aa7:88c1:0:b0:842:68d3:e29f with SMTP id d2e1a72fcca58-842b0e14e3bmr3304903b3a.3.1780662013791;
        Fri, 05 Jun 2026 05:20:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:13 -0700 (PDT)
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
Subject: [PATCH v4 00/10] ASoC: renesas: fsi: Fix system hang by adding SPU clock
Date: Fri,  5 Jun 2026 19:19:44 +0700
Message-ID: <20260605121955.105661-1-phucduc.bui@gmail.com>
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

bui duc phuc (10):
  ASoC: dt-bindings: renesas,fsi: add support multiple clocks
  ARM: dts: renesas: r8a7740: Add clocks for FSI
  ASoC: renesas: fsi: Fix trigger stop ordering
  ASoC: renesas: fsi: Move fsi_stream_is_working()
  ASoC: renesas: fsi: Fix register access from in-flight IRQ after
    shutdown
  ASoC: renesas: fsi: Move fsi_clk_init()
  ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
  ASoC: renesas: fsi: refactor clock initialization
  ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
  ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown

 .../bindings/sound/renesas,fsi.yaml           |  61 +++-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        |  12 +-
 sound/soc/renesas/fsi.c                       | 272 +++++++++++++-----
 3 files changed, 260 insertions(+), 85 deletions(-)

-- 
2.43.0

