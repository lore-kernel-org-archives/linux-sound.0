Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA133BED61
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 10:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444217; cv=none; b=E30Ls/jvSUuPctbX3g27SXfZ8GKUQj0A1y3nDVvJ/J4gRqoXXb1FlDbcPgEz92sfMwvjfFksG7L2ayRZMS9DX567Gg6n7I2Zvy5UWFrTiN3svip6vSIvt1LPESbgBEi6588QVUgI8ELsvVUfAZwKwt/sFl+iNweD1a+FkfWCZfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444217; c=relaxed/simple;
	bh=XcEC9ecrdej77lQLA5Zn9CN66MJ4E6gOFshYSEz1t2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jW+nhqyXim/JD6PvnoJd/peixY6HvvFHRRQnF/KRvqikAueBaM0L+y7EIE+6w7s3SxQb7HeNeLIRxuRljgMTew3twwDSlqhgRSWzRcqBt8rp9otDykVeg7VzRT+1Dp+QAWHv/utsHE5niHvuURl275i7rjfLf7bk8lrLTbZqSgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdVZf8/m; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdVZf8/m"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bc85eda6b6so35556325ad.1
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 03:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444215; x=1780049015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eiBRTRZTJBLsm6cC7zO439AbTyaUXaT32zIuFaYd3eo=;
        b=EdVZf8/mSqovV0tpDvJF6D2d2iMpTJvbv6tEl6BwwqNPM77hmR9QoZMMJXiWcYziWQ
         4fFHKoprt+3OMclShS2lWPxGAy+KZSfos/vs+H9Xuf7J1HSDzTnbGRDjszm+85msf3A9
         Yx1VjhmWwLQKWxWVoZ1ARkdBqrHzAGjyX6lutvt+BZUJvCSBMRQ7K3vXexjEiYedj39O
         TI9XrMMf/ii/lJPQ3iGSXsGj3Tl7i+XsrMo1owkxFjDX//yoX/u5qo0itGPcp1mT2v45
         6WdmxSMPpiY4zyDVwQ2PH50QD9OxAXXxVruD+ALbVtPQOA/oYLMYOQQ6juGn3sUb2lxG
         d9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444215; x=1780049015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiBRTRZTJBLsm6cC7zO439AbTyaUXaT32zIuFaYd3eo=;
        b=l2+iP2/cBUMfJn7XlONVbpFi+ovVpz1G1wpdLOxAtWlyLUeTzit6viJbwRnlrtzyHw
         31KtPwAcklGHYprF8skLkgD10ZRPnYf3OIbgjOZQ1DBEzG6CS0OVM4FA6wYupObpGK8p
         rok1K6FP7wzz3Dacv+Q+O2zGVVLVWLMje9BqhcrFG8V+ElP36krH8e4bAzUkAhWPy26H
         FToDSRcK3Nbhhi0looTGwHffg4rlp/irSQg3ht1eFdSGpJIL8ia4wpiiaYMz8uoB/3YU
         fXFhmmqSrRTT5A6Ki8HCI1mTVN4tnevCLX3WUSFvQwjBpXqr16knZVfQVw/geQzYFpE4
         V9rA==
X-Forwarded-Encrypted: i=1; AFNElJ/wx6++8PwuEFDwbv1CwyNxc4Gw638cZ+aAZ30B8vsyyrnbaHOriekUEFbepg4rR4uF6QO++EnOMqG9kA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFCIihZ9LKIjJaCiM6OHxhLBDtOeFe6G2im/bDMrR1hBgqny3W
	XoItVtmtAJBdATJWKxHIdaAbH3wlc+ccY4Z1FxmrucjJMrSNTVred2pt
X-Gm-Gg: Acq92OFeG5NnJXK9u2eFb766KG7FR1Zr3TjjxMshHYqOboSEjUpyXjlq1z0zFKVLRpQ
	7LtcvOZ1gRUmU+BuCpJGarwyn/jg+Uil8OrEhL0PVM/QDDw+5QY0tSu6XoF5eRRXywEajW7d4bw
	qyA5QD0X2OJzFJzVXJxRnNPz29iKHJsuLPAGoG7pLrD5bCv635S0oDw89D+jYw4Q05d33EqAQkM
	nRk4RmbJ3tUoYu5xIvzxRGQk6IzmjeC3iSQVxWrZzrzdguq0hZErjcaJZgIWvphsYDq2XDyZVge
	+m/WRKsk4d30HWnYM7WpEpDvRIV7ymkY+RkWXE73EkSH1+Izthk8OiNEhJ1pLdK/Wo1ae/emrcu
	pmutyDGVfciRpASzXZliA6fCXr4ExaZL4IfxnpYpCKjCXpHzdprEeL/gh1u1KIuujV1ftN+RI/9
	4nEN2I8qnveTABHZ3JN4angnO1ZVm/B5oYXjHjzGlfXUDTCcWeRjbpd3CVsw==
X-Received: by 2002:a17:902:fc48:b0:2b0:c45a:bc2 with SMTP id d9443c01a7336-2beb059cebcmr32443895ad.16.1779444214757;
        Fri, 22 May 2026 03:03:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm18683455ad.36.2026.05.22.03.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:03:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] ASoC: rockchip: Reorder clock enable sequence
Date: Fri, 22 May 2026 17:03:15 +0700
Message-ID: <20260522100318.73474-1-phucduc.bui@gmail.com>
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

This series reorders the runtime resume clock enable
sequence in the Rockchip SPDIF and PDM drivers to enable
the bus clock before the functional controller clock.

It also updates the SPDIF DT binding clock descriptions to
match the actual clock usage in the driver.

Best Regards,
Phuc

bui duc phuc (3):
  ASoC: dt-bindings: rockchip-spdif: Correct SPDIF clock descriptions
  ASoC: rockchip: spdif: Reorder clock enable sequence
  ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence

 .../devicetree/bindings/sound/rockchip-spdif.yaml      |  2 +-
 sound/soc/rockchip/rockchip_pdm.c                      | 10 +++++-----
 sound/soc/rockchip/rockchip_spdif.c                    | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.43.0

