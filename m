Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62B63876D2
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 12:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949023; cv=none; b=OAxzER4CBz7/aQBXLoFTmuIAIP1oGgoZuBxW696BVrs+1p8VaoCChHdSosJbJo2Di2bW46YCIRRQxLMq/JVAO26gOcbqk1xT0VF9+AYllBJYJ/dTTkCLpg/pS3K/dEcCNiGS2ljXa1dlTFPgnZCFfznt36DG8Qb9gTOGCY7zttY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949023; c=relaxed/simple;
	bh=EAh/kgpS2dXQLkjrw6aFA7ZAJ+HC4p1Mb4Hses+rQl0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tEImo7TCvIDAk+HORjnvNzpvprKBEOT62fzygE1q577bqgscmTJd457E6ivXRtRV1vYuEuwRYx0nllFhA+Ev3ApAo8A+ZmTrWChMRM8ASLh7dggPLHlXuYKHU27Do8Ej614n97t7/0lGeATi6l6RKA9MEHxbKE7hhMOBT6kFxzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WU9EcZxI; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WU9EcZxI"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b2503753efso66677305ad.0
        for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776949022; x=1777553822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AXsTpd+KaPddike9Luv0ILdaVqD6907iy2CiTUyzt78=;
        b=WU9EcZxIi5Q0jxKWQVIcXehVGtNjfjyXXjdseikSexAKsHwqTVO3V27y9qIE2/fJmw
         /nblRh5CCqptPo/O4/4hsgbS4zf7mK8M4eKUDPmp6IRa2h2T/Fr48rB2pzW8795yX/aa
         ouudniMi+vRuKgOksvub8bdq5m0AjEoetl3V8DvUec8RHB3l8eGC/Dpd3Lbi4VGWc1+Y
         LmwzAU86G2V+x3+W10wPuBizp67UDVrR4y60gDGTEMRfR1yr/mOw7V4OC26TwoJU6u+Z
         JKtWSuTtcMmzA6HiCWYzzY1vLYalUxVMTC55USbQtJPkJ6ngVFR29AzEplH+eHpKDBza
         7NBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949022; x=1777553822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXsTpd+KaPddike9Luv0ILdaVqD6907iy2CiTUyzt78=;
        b=r26miTzmdFNJrugQvaUT2SLuD8N17XilnbBPYYW1btcSR3qZMOUGkFCWFDMozyf8Fg
         /7woPwKGboqsBIoT9IDpow0qF+9dYZEvKvJrUh7+TbkWlhRKVingxBt81QExpdTrLd+s
         4Pgyjf8NSRu3qQwiTfkz0THeaLqBil00qSavcmu/1pWh0ECfM7z24XZAZN0IuXpdNBSl
         UdDmlcvcYUcMTG2UgIBst5J8xBJKGHQDEADrAQfyyN+uv1iw/ifl6tevG3GLMXsMQSEw
         6U20A0h0C+L9jnggdymZv8g2i0Cl0eVNlCZkZvaLh0Yo2d63TluL+D1vPaqq0i3r2tZN
         3UBg==
X-Forwarded-Encrypted: i=1; AFNElJ+uWdUjBznYS+2xhfOQZXeIOxI4qRk9/f7M2RdySfJ7v7E2M7sExg3r/NegD39P8DV9Gz+x3mWth4ELzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQBvRHpMHLp5PiiuBAsJD2s7/bdV5BwmJcdX6Moifk6Az+3C/w
	eNHfQUnCv3eA/popUp40NO9Id7YUpICyK35o8H7MhAofVgm3lUnU+Msa
X-Gm-Gg: AeBDieuuRm/R6LrYvPoaZOyAYUuR/NdZgZixZF37X8JQqKlzn0q3Eq54w6CtjNCLAN7
	6JjIQNnHx3kQn025quY6WM268NgKpbbd6hoqqwUn8w5mLdTEwncrZao9r1JJa1b9XOqlpIvRO35
	U6GhYwi2LrdpHEOIVFM5FXCSO5/ExhQBojBTRed+XNqshPfQPVhO6xx1t8rML6bkJlq48a+1TX8
	mlrIZkIHp5k9+8zLfWMtNNSmUH08SvuqhK0X7b3dr9bDX5BtpjgOV8esb9R2Y4YoamEuC2oMIlU
	4XyaZGRe/LXY4hg8FDMMoZ9fIZcW5SU8bMcL7RIFiTvsJ+ITbKaA5gyKVZ+HBOFg+3h9WRdi26i
	9NAp8UZQ5pCci09V7EJDWU7m4OyEEoQPevY9BS4hwaDmS0lduM/+0QTezHT6MebRApkaWoEvDut
	lztZhQdA8dQIBEzmHLcdVhHuk133bOS0730j6FK15U216iiYwRHLE/HhnTkWRuvEkQpMDE
X-Received: by 2002:a17:903:3d49:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2b5f9e9a067mr213394595ad.9.1776949022207;
        Thu, 23 Apr 2026 05:57:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff390sm192106545ad.9.2026.04.23.05.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:57:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/5] ASoC: samsung: Use guard() for spin locks
Date: Thu, 23 Apr 2026 19:56:41 +0700
Message-ID: <20260423125646.156599-1-phucduc.bui@gmail.com>
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

This series simplifies spinlock management across several Samsung ASoC
drivers by adopting the guard() macro.
All patches are strictly code refactoring with no functional changes
intended.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: samsung: i2s: Use guard() for spin locks
  ASoC: samsung: idma: Use guard() for spin locks
  ASoC: samsung: odroid: Use guard() for spin locks
  ASoC: samsung: pcm: Use guard() for spin locks
  ASoC: samsung: spdif: Use guard() for spin locks

 sound/soc/samsung/i2s.c    | 118 ++++++++++++++++---------------------
 sound/soc/samsung/idma.c   |  26 +++-----
 sound/soc/samsung/odroid.c |  21 ++-----
 sound/soc/samsung/pcm.c    |  99 +++++++++++++------------------
 sound/soc/samsung/spdif.c  |  25 +++-----
 5 files changed, 113 insertions(+), 176 deletions(-)

-- 
2.43.0

