Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C83B3EFD28
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088357; cv=none; b=bhBlRaLUFaa/XABDDQJeJv3tRf/rMl9ruQmCEHGpx8/glJqF5vNuMqWSP5+4RWqXyEyG/XCgkLwTJLo6d3n5iXpZBpvuRH5YI4HKBI6YTfeE2miO/lv6pwY/RVz1Hrtac9FL66rszJg4aKt4KWDdXPLuuoL18iLPWFCZnfW0qis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088357; c=relaxed/simple;
	bh=Nv47+CX1jQYGhYX5sV/qjkmyHOGmK1FwWY2cXraj0nk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JEIHQldsCDcg7ANEmpYKwPMz+ge2KMCtQh+XyVeRx7CdLP/lCYT4E+FndIVhj1LV2KtEcwRqTayJxlXUqP0klJ9CJqDbQdXJ9XXr+1hlCuRlcV2CXa2sxObrhpIqryegAeLR3auqn/G2N06m25azZPLsvr3E24GTPPBFo/jtUbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adu6vh7g; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adu6vh7g"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84234c83142so2754084b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 03:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781088354; x=1781693154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=38Tu9cOa0gPnUh8oz2MtASPd2KIAhQk9YKbgqJBgizs=;
        b=adu6vh7gcxd3XD78Md31v5bhK2GABIL6hnM77ZgVV8GXexfonIwmpdMzuTKdCgGoQk
         2K9QLTIUNN8zDOoCrcy2E7Bg70u295AUmmy9SDOcpEfVxen0A94ABKwRdvGQ3la88BaI
         rBT4SGFSUuJWpcxM17EXBVBqElrh9nbiRdZYdJe34EhcSgadn03r8+z4RilvOeAfXkf2
         bZEGjakxaEhayqHktHwdNEdCsIHUTR4zuV8Lg8i8w6Nox3jobdmT7xdCD+rUihVTImmz
         W3M8G7Iop4za5jYnccOY/145pRBlAehHSvYmxulRHnVlq7Zy7gaeSUm0MoBPDiTWdqkz
         zXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781088354; x=1781693154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38Tu9cOa0gPnUh8oz2MtASPd2KIAhQk9YKbgqJBgizs=;
        b=XHA4sStv1yc4hr1CHu2GX1X17A0RMTJTbXPcdlTfNC+99WF28NOnE4nTtMbLb0C0WL
         Aoas+tPw/Yj/Txti29gH1hI5UFVVG4PjTk/yEFTLk8zx7khofjgPe2lnEHps7P8ml0/d
         y9jDtQR9l8vzX3YKgPrwRtYRWJGf717XTE4D/TW1QiGtCbrVzY25SOOuI7YBkNtU353C
         RkNzfu/xCw3CGG86el6PavpkZQSgqjEY17f+3WS2v8IAZmuhitZOU0PJqfl7reSA1dPJ
         uGGlcCuh5VUKdUW8urHN6vQpic76SOK1PINuF1FaF6L0wIy6gJwU/ByWCLrr0XmefUZC
         QqEw==
X-Forwarded-Encrypted: i=1; AFNElJ8B1Kuv1TzIi7co59VC5twhN2UgGCwts34+jHKVgKlc8mB84LN3e7UTfF7v7djjsvRNX3NUWh20BJJonw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya+kr8vYWgGdQA9+NGqwI7I2figuCq3KrWVaVJRr4I+W74a4bK
	i9XM/iaeeFCQRJecUyuWbQ9TSCn8bTHYxrt4Jzjsov8l8Qz7Q2t7Uben
X-Gm-Gg: Acq92OH/sn0a+NieSmGm444XG0dfH8BNCADer0HfAnt/tFUOvbCA6EA2obbuICcTuPB
	/KSUiK229ktTqFYlIdX2fECswdn7IC7xejOe5Gtj7CbN6G8+6BdPhLo+lDv8yjHydY9blUyQ7Oh
	01H1E5skEmeiyDCO3CVNSTAU3ZL1JvZ4qXKoRdQq/7ROyF+gAgezNMrRUqbOcOFkvOpdxvAzF+4
	FDtqkvwYic1GxlZGv4aVyqrGrQetIwZL2/w2xKdyb119JBHS4gPArtlJvGI9Oh+wR/pYc204N7V
	EQUG1siiiCg75bQwIB5J22b6M8nirgOqaYdKBKu0piWAr5mUiSwG15nEUT08jSaq9urS77NByI/
	eqzlJYixWimazvAcSrNM37WyvMdfQuns5X5/WkPXYqr5B4jZPlewDqcWza2zw81B2vit0zRxSoe
	4fvU/k8xzp17YpMzFQzwiFVm6B2MptN8vlo4qzMfp+xZTdq83vOJrFS7Ke895IkCq1eISj
X-Received: by 2002:a05:6a00:1c94:b0:842:6d5d:58dc with SMTP id d2e1a72fcca58-842b0feef0fmr26174630b3a.43.1781088354603;
        Wed, 10 Jun 2026 03:45:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282916b10sm24455965b3a.58.2026.06.10.03.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:45:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: img: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:45:22 +0700
Message-ID: <20260610104524.87166-1-phucduc.bui@gmail.com>
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

This series converts spinlock handling in several IMG ASoC drivers
to use guard() helpers.
All patches are straightforward cleanups with no functional change
intended.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: img: img-spdif-in: Use guard() for spin locks
  ASoC: img: img-spdif-out: Use guard() for spin locks

 sound/soc/img/img-spdif-in.c  | 70 +++++++++--------------------------
 sound/soc/img/img-spdif-out.c | 16 ++------
 2 files changed, 21 insertions(+), 65 deletions(-)

-- 
2.43.0

