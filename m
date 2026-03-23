Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A228C3BED3B
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 16:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282594; cv=none; b=QxD76FC55i0tkS+JjLlRqp8pQAZu+e2BkXjyyPbgi9CLNSeqPOz/c3oHo8z68qclICs++sbVdbNnHoC/OImuHVpZw6Br0GQlQZzeEVf1pnOabctBwom8nqffcJr0U5JupPY/7KrgUFWfSpQUOXnY5G8EqrEdSFByCRjiviVnwXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282594; c=relaxed/simple;
	bh=9ZoDEUNK1UMn71bdmlD7rF6vYQmryeC4ixDQvdpmolI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nbmLhRFXK91sW1hiXXVLA0GMclk4CnqMMEKvBwmTqhrq7FWN/PPBSMapQsxGt51d4eXjpczjFxx+nSIO5RHn3v2Uz5AfW8rv2qCrgCMx6lqu5Dc15sVl/mfBp/6bkf1EjsYxdER8pR7JeJWVeoT4qoKKBeth2hHl5UVWzl2UYpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P72cE4aS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P72cE4aS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so37042745e9.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 09:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774282589; x=1774887389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CMcT6iTJXR0JLgXJbiUjGGM3dMly/KE9uQn9rqHqjyY=;
        b=P72cE4aSWHGIBwlgITo3Jv4QS2TDCZ+uM8LLDTYCLlCvsnmETOKnkpjkFOzOPqZFeJ
         lirhg+zk0pfvmVndDsK1wowIqato946eOzv/C/nCXL2L8i2XcwqG42PmKrAhu2ozy5Du
         p2mkmfld2Pe3WbbXanfb3qQVCxebV0T7ZpZahO6yA175FmYYYy6vghStfbV69LYnK0oi
         KWWCY/oo+y0DOYPmLRJAlXt6S6mOQF2y/G90Hg0lUQvs4LzpGX7cxcrcGB3q3pscF3Bk
         BJAqFDQ8Gez+w0qex0T7oyVjkvQChkEh3bGbNW5G62TDTWa7eH3AXuiCnoCVChn7tpuK
         5gGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774282589; x=1774887389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMcT6iTJXR0JLgXJbiUjGGM3dMly/KE9uQn9rqHqjyY=;
        b=hMga8U6A1zD3t9Q6dNX4Ve6jaWdd/DafvfqPGzPnWWzyT62cl+nvMPth9jQqzJ5HRU
         C/TiHDmmdmH2hexbLstijnBRFMbQ2klvxJ2HPAU5X/5L8BMX6PyJLFD/FnbR65FNCrq6
         4LKPV4YH+DIhrq6zIEdDSzv889BxH8giazgs4OGVHK+//u5kaKKv5DNsAY5sk4RpKjtJ
         +uqhW+52Q+0pciNBYCaudngjUcIvlKa/+qPoMWUWa7mS/ivxWwSAt3ot+0JYs6Xdbkvj
         lEaUtukp1ZJjQrHr/AMvcMBX3aG39XLRJ7K7O/wh9yACxQFZWTDaeybIP93Q/7wi1kfw
         4LBw==
X-Forwarded-Encrypted: i=1; AJvYcCWZYJT6K12gRLBDKbYXRX/AXYaBl8Uqh384/AgapAXiYbIWwyhK+QpSG1tgfTuI5FP5U5H0rVufz4oOlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ9aVfCpuI3GISy/DG7IVla22NMj2P8Bnmc4voxumpDxQ5rdyl
	5Mh/SihUN5HRNXSLwjEu0/lfN/mzTT/7mU460c/gjdqzVR/sxyq3iWs=
X-Gm-Gg: ATEYQzxdvAY3gTrHfrlDLPub+2rlj792fhep1WHPRBX49e/U6g3ApoBWn11t3Swn+HR
	lGb5L/gtFdzThK2StTyDYh7sWwNX3kpOFdTWzPmUNY1iOxnMMLeMe63MgeqJZT21Bp4n/y8Fd6d
	AAmQI8panElDSj9wraq4nxvF2aBele/Z74fvu7iMGgbtrVwayaSIxr2KnDLg+51E3x91nVZtdtv
	GUMx3fly5LE1SBpMCKJ83yu+2yt9nKZJtHr/MWzWOaXc40tRXd6OXS/SYUwMU7HtBE5Kgh1PjDT
	+ps5RflkhR+7bAvot7HO7XcLGHvdgdqkOpOEGH12tFiHMxXZULN4+g9xy14PPsBjPBdigzrlCHT
	TdPVTeAcc0eGUNVyLKDfAQdRdNjapHI4ojD/CxvgufJUSLNGKOKO4aRC4Qyr8yUuU982N6SgJRy
	SzvyB6LqEw+coYhD+M3dJsYNAi3ocOsVyoQdgRFo4Q5w==
X-Received: by 2002:a05:600c:4349:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-4870f1fc613mr1615995e9.7.1774282588752;
        Mon, 23 Mar 2026 09:16:28 -0700 (PDT)
Received: from localhost.localdomain ([78.240.51.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8aacc73sm331863395e9.0.2026.03.23.09.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:16:26 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: paul@crapouillou.net,
	linux-mips@vger.kernel.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH 0/3] ASoC: jz47xx: Convert to devm_clk_get_enabled()
Date: Mon, 23 Mar 2026 17:15:48 +0100
Message-ID: <20260323161551.47181-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The jz4725b, jz4760 and jz4770 Ingenic codec drivers all share the same
clock management pattern: the clock is obtained with devm_clk_get() in
the platform probe, then manually enabled in the component probe and
disabled in the component remove. The clk_prepare_enable() call in the
component probe is unchecked, meaning clock enable failures are silently
ignored and can lead to register access on unpowered hardware.

This series converts all three drivers to devm_clk_get_enabled(), which
combines the get, prepare and enable steps and ties the clock lifetime to
the device via devres. The now-redundant component remove callbacks and
the struct clk pointers in the private structs are removed.

Jihed Chaibi (3):
  ASoC: jz4725b: Convert to devm_clk_get_enabled()
  ASoC: jz4760: Convert to devm_clk_get_enabled()
  ASoC: jz4770: Convert to devm_clk_get_enabled()

 sound/soc/codecs/jz4725b.c | 18 ++++--------------
 sound/soc/codecs/jz4760.c  | 20 ++++----------------
 sound/soc/codecs/jz4770.c  | 20 ++++----------------
 3 files changed, 12 insertions(+), 46 deletions(-)

-- 
2.47.3

