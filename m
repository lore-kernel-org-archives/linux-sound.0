Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C59466B68
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 11:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487411; cv=none; b=Bqn/mGZ1/rcOhqX5es3IHaDaA0AaOH6+bFa5onNm0FPiYL8JFUXCz0wC4YbNCw+OZ9lhRNMdGdit09Vd+54T9kcr74c1OPFfxbJgjovEO2YhK2Qayw5K2Y4Cu+ElfPqfehNxPYBypaCMLR+hS77T9ZAVvrg7AZsScnrXndC2ixw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487411; c=relaxed/simple;
	bh=8V62zHp0854T6kOPYi3qN2Z3/U8/1EVVhnVNlAFTfV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BEj0yXKc74L6lo/ZFBXTrlO/o2fva316byhKc1HvaebKQjUnHnnPM/bDdOr4jK4EMrOrvGLkU0LepNXjL59lg+K2yYWctp8ATCuvidCmRpJWcBoIoQ+SgPEPVpg17aik4H8M4UNLK3buZdVUfQ4gh2parVS9lM9DJ6sHF90QfmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9POPP12; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9POPP12"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c132ac5ec2so14656055ad.1
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 04:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487409; x=1781092209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLpX7pXcoYewnIuzKIYAV54Q2yRbmRAcp638a4WMytU=;
        b=G9POPP12/zIze1OJwM5EBERPv+Ua/N/VHeBNJfTRncw4uahcn+b8hUvoen+HyhYtfM
         wJBAOW6NUpkPQQzAZ2xoV/lr7ubZPk7dGF142u7ZsFvyk9020IBJA6Fe1jlGlD3hATiA
         veG9PNU5c3dUZEX3cYPhZYRZjINGK6/zJRhmdh7nUNbkYYzGVEC6+lKZbkQDnTpLEaoy
         XrM7CMOsBm+tx//3rs1uLcRejS41k5Fjz46ztlnEnZmtu2c6wKtMh9E5PAzNMmLuc/Sq
         1CaifxTpfqp5/nA++zecYdQobdg/GjURIlqm8NoL2JYvBpdXoLTnTUvtE8ortPQXaxIp
         xYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487409; x=1781092209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLpX7pXcoYewnIuzKIYAV54Q2yRbmRAcp638a4WMytU=;
        b=VWupawzCkK83cY7wOJ7tw0e8ORdRAOaZLKeG4Z4oLk62fvpF4GuA3YXin25/7z9iGN
         RSDKMVQXmCB0+s2h4NAwQ8e0N2zSyzA7lHHsA4YnW6TZdVNbsZ8TM4/D37HwSwAuRIjN
         Fd/OpVSYwxm2gSLg97KZTlf3Vd9MhogQOW1Ka/k8YhpBz1Bgn+N9QtHdSI85IgPL9uCP
         UEfOpGBa1GV8VEAJlkNVSA90YL00jVSqr2YiT1Q0vYfNBxe+gmVYRx1q7jwuizIjy3n/
         kNm8ajXhZer9p60V216aLtloOpuCcVIbaLkkIbdLf1/QVK7zSPidpM7GEb0KOncmBth8
         Gxjw==
X-Forwarded-Encrypted: i=1; AFNElJ+l0Zxor0WivTZ867lxTBsi2Fds1OwK+pA+l/fPxCvt9MO5J4ZyAMTVi1r4guFJGb98cZuR3x7cie3Uaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXhzQr+cAh+eS/+Z5Olo6rHSCQd0oeBkmCcAhfcdgC/IXugKMM
	emrjaK9IgD2CEMLKIf3ATnUTEe8ORbGDU88bQCXN8eJPf/aJB3DSesW/
X-Gm-Gg: Acq92OG0ZcecZmakRIu/lZ/imcXGUMKzQtO6elzXVDXy61ur7EVLpmveqGthwt8a7U+
	DFhR6O+Io9BeSLkpyHsnuokZ8xDIBFcv6lifBvEhx23ji97nRghxQQJ/3iaHXI8g68BsHAJvjrx
	6fDXIwBsams5lDPFWDtq9KyofEAyRGRwIA346j2eg6fiM6YbFI5ofCYC5zYvbtxufWIkg1ojTwz
	5UIf+x1qkimAVJtPEu7GyRGd31XqypdYGcmI62gZEPvEdXYye4aTOWFu3+aeDnAIACXvY45flPm
	815sKuu+go/70cTNozU/jRlSLxvaiyPzB8/cWMZ3dAURxomrRWwaXPqoL5Js+3AHM/LJBc5jCMM
	D8HwOkRMtnl30ZOwsbXV0uhG2m464PUYyeFP/xULKKOllR9OisHjzUWTgDu+YnkPVjoQn4OAAVE
	L3hvXBbZfUv4gkLgEH9MNIPFpfuqc7E66IPNXusiDqdgJBPZUj5nIbQPDFpzxhaQjj3W5kKAxrr
	R4C4cM=
X-Received: by 2002:a17:902:f60e:b0:2c0:ccdb:e01d with SMTP id d9443c01a7336-2c163a17aa8mr30913825ad.8.1780487409445;
        Wed, 03 Jun 2026 04:50:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:08 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/9] ASoC: qcom: Use guard() for mutex & spin locks
Date: Wed,  3 Jun 2026 18:49:40 +0700
Message-ID: <20260603114949.149595-1-phucduc.bui@gmail.com>
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

This series converts spinlock and mutex handling in the QCOM sound 
drivers to use guard() helpers.
The changes are code cleanup only and should have no functional impact.
Compile tested only.

Best regards,
Phuc

bui duc phuc (9):
  ASoC: qcom: audioreach: Use guard() for mutex locks
  ASoc: qcom: q6adm: Use guard() for mutex & spin locks
  ASoc: qcom: q6afe: Use guard() for mutex locks
  ASoC: qcom: q6apm: Use guard() for mutex locks
  ASoC: qcom: q6asm: Use guard() for mutex & spin locks
  ASoC: qdsp6: q6core: Use guard() for mutex locks
  ASoC: qdsp6: q6routing: Use guard() for mutex locks
  ASoC: qdsp6: q6usb: Use guard() for mutex locks
  ASoC: qcom: topology: Use guard() for mutex locks

 sound/soc/qcom/qdsp6/audioreach.c |   9 +-
 sound/soc/qcom/qdsp6/q6adm.c      |  52 ++++------
 sound/soc/qcom/qdsp6/q6afe.c      |   8 +-
 sound/soc/qcom/qdsp6/q6apm.c      | 107 +++++++++----------
 sound/soc/qcom/qdsp6/q6asm.c      | 164 +++++++++++++-----------------
 sound/soc/qcom/qdsp6/q6core.c     |   7 +-
 sound/soc/qcom/qdsp6/q6routing.c  |  10 +-
 sound/soc/qcom/qdsp6/q6usb.c      |  28 ++---
 sound/soc/qcom/qdsp6/topology.c   |  71 ++++++-------
 9 files changed, 190 insertions(+), 266 deletions(-)

-- 
2.43.0

