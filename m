Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B91B2F60CC
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 23:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778196112; cv=none; b=PfMAI0zU47PaP/Qm0Qv0y3Ev2rGn0pYv0GUXMx2XFqxExGFLbBKJEK979jvYAKgch9zLqdtsSMHRvHyaLYrqXt1P+FN4u6fNmV0eo1MA9esN2rNaTGbzMx6zOXa1vBgt/hq4H/g2ZKTBkdeCZ2LwONWIMGk3uGqPJ2Goh/Bkl0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778196112; c=relaxed/simple;
	bh=/7jMOqiqfS5E2Aa8V7nTqrJGxlbfE7BVeWQEGpFRgbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gX7tg7IXVjG1Ln3NpbRYXctmXg4kFBcWspNCkEHDnje+GCD6YckkPJOxvoMe1sCZNFLGTzpT5t8ILnmeKX9XQ72oig0dxM/dXiZzYP8XvgszMCCuspm1VD4151BlGzCIhQ2AUS3z9O3So+ojPUROGh/fid+ZRAjcaZ5mmDNR1ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrnPzTG5; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrnPzTG5"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b458ca2296so9130355ad.0
        for <linux-sound@vger.kernel.org>; Thu, 07 May 2026 16:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778196110; x=1778800910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gqk0bhbr2l3f7IDwzLFxsnylMpESKM7ghHU7R8b35rk=;
        b=SrnPzTG5VFnRWN4mRIqwVcHhGsjR0ckwWyua02g53JMbIUvuRNY/u2uwb3AKINzyau
         l6Cq6KmZxjpvBPc0lCOByPxy9RaTSWXkQ7MNCF+wube/k/w/j6ntAHZM89guh/jPcblg
         UhmYfOtp/jBl+l4NW9n5f4j9mcZyI151SrwiGcZE/VneODIC1VR+jQAaVppdADM2gD6K
         dnQdRM3z6osmyKRmvZoEk4I4AMs6u0SLME3lyX8l9uQgl0jQbAi8a2Ba2Dk9OeqxMLmo
         PJu7dWlITAQQxMoc1PoZmlbsA8EBLUiJeAwav+rZHRix1/Xq+Xl/5nwAJzLegZby2Xo0
         CwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778196110; x=1778800910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqk0bhbr2l3f7IDwzLFxsnylMpESKM7ghHU7R8b35rk=;
        b=hYi9d+TeE/cWiPYkVD0iWLsy7FtiolNWBt3ucVY8WY+xZym9igEjwvfzkmmjpOv/vX
         UusEwTF+Nu918L4lNpNTJ96IRvRE37y93LZwQeb0rZZgjt7UAXnURzjCRHj/Z3EpNyVR
         2l1lP1HFUpyi6S0C1W6vF1fuwGB1UzIhlqTSKTY4MsvyIC869P4Lx4msZqaFdYfliRN1
         bQHgq0W+JvyPBiUu/Fl6z281C9IoIPFbtPuq/fOcJopfEmnB+kIT+0EMxZfOIUtRWR5o
         87Q9TJQ/gOCG3lzIK5EQj15Ic08SnkyvZ28URvjKWsYSYTbRm0mxywpSKPr0OU9T+Dq9
         or+g==
X-Gm-Message-State: AOJu0Yz4SdYta9tJskrUuzMBqisvPT60/ZYuzlXbOdrZWh8x6tLlZTe3
	3GBwYi9opaQwjoJ2Q8rH5tYZwfYWDcZ3cOsdEWybihabuP8pc4bu4UVmZ+YZQ3Aw
X-Gm-Gg: Acq92OHoOV57htSs9PL1WjFJhDYgJgisXOU1P5fZrMuNgoqOCBaGs/Pyil6vcNvtcZm
	uehnShtFs7aIHyUU4i7V5WNoVdUndokP7haDS89YzEThcnVoq/VPT+3bKSx8qu8TY2R7jMzjAJD
	2iNEV4g3tsbatFfG7L/qSSSIYkvxGp8nz5EOUeUUC0+9slvhh8BC+fXaU1kgYVnHw+dWkkPvZfO
	IpnfH24WckbAvWJ4VhVUGGTdfNkkf8co3rdQonstxqz9wNaYmuNtjehR8W7s2sHHfIiBTc/Qy+a
	bHgpe+VhX80w7RYMA25CThdLTBHYyqXjnpcwWHaSypjtTvHK71ig18VcBLkPgxzt0JkC9aLS7ZQ
	qY53vS/yYPz4P32H43ShYpOP46qObfks9AonLUP8KusUFJKr4BJjqwjB2kLBxaMAAFu/mbC+rsi
	+gjTyyXkISABQdHIdUwzrhmDSzEscrj5VVHSYfIrkmv7jYhXTiVVPuRYJbPJMKYmSp6a67nuY4K
	8YTeZxzD+oQMo+CsH4h+LKGm21siQbnyVA=
X-Received: by 2002:a17:903:28c:b0:2b2:45b7:306e with SMTP id d9443c01a7336-2baf0cf2c98mr2125795ad.3.1778196110299;
        Thu, 07 May 2026 16:21:50 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae752f766sm9064475ad.2.2026.05.07.16.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 16:21:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] ASoC: tegra: tegra210-mixer: Use div_u64() for 64-bit division
Date: Thu,  7 May 2026 16:21:31 -0700
Message-ID: <20260507232131.438589-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A MIPS allmodconfig build with LLVM fails during modpost:

  ERROR: modpost: "__udivdi3"
  [sound/soc/tegra/snd-soc-tegra210-mixer.ko] undefined!

tegra210_mixer_configure_gain() divides a 64-bit BIT_ULL() value by the
fade duration. On 32-bit MIPS, clang emits a call to __udivdi3 for that
plain C division, but that compiler helper is not exported to modules.

Use div_u64() for the inverse duration calculation so the driver uses the
kernel's 64-bit division helper instead of emitting a compiler runtime
call.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/tegra/tegra210_mixer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index f05617b5f433..bfdd457f740c 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/math64.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -157,8 +158,8 @@ static int tegra210_mixer_configure_gain(struct snd_soc_component *cmpnt,
 			if (i == DURATION_N3_ID)
 				val = mixer->duration[id];
 			else if (i == DURATION_INV_N3_ID)
-				val = (u32)(BIT_ULL(31 + TEGRA210_MIXER_PRESCALAR) /
-					    mixer->duration[id]);
+				val = div_u64(BIT_ULL(31 + TEGRA210_MIXER_PRESCALAR),
+					      mixer->duration[id]);
 			else
 				val = gain_params.duration[i];
 		}
-- 
2.54.0

