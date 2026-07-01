Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF455376A11
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 04:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782879219; cv=none; b=Zy8H8J/IZPzFOusgklZwSAbwts+bYi/gF0/LYsbaHuuZhlNqhh9NMDYwzpzbUuJShS8HBsX81Z193GbZtNEkN/78Pw4pnksnTgq66ipwH/HEzGwZyfvhYGEJMc0uZavztHEVQz1BoIXovZsaFzIeE6VrAN7Mn75ZDAISJkC6L6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782879219; c=relaxed/simple;
	bh=mIP+Yyb2QKE/vHSXauQQFSjnoDFdsnSWaqX8ZrlK7iM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G7Rzijj25gImMPuEf9MeadHxY/se/URlCnwQUvHeZCgUR+eBBQxvmYeUh8UXXtddsgvQ0ZLOcJmN1uOafhVPPe/TMI4CQgVM90oR4r/LwKsz7Si6uXmv98rdKS7oQ+2cqLIux1ItBEbqnHifyk76v7rkMJNdZ18NThHSJ10WNXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLtbvoTa; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLtbvoTa"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-37fdee9276fso193457a91.3
        for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 21:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782879213; x=1783484013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YhiglAKWEMHFc7lKOMiqzyD+MOB/Txierg5D8N9tqgg=;
        b=lLtbvoTaKiELhbWnTGL2kbV6iRnLQVAC/DPAQ+mHoTamzdRIZ/c8WD5ASMH6vG1upp
         EEwxsM+9HoDpkoCNOMhCXZLBmqIbnG3xLrhA/YCLgeJAFiujnyaZjKBZx3EC4tTywM4P
         fsdqXUZb8nQLyZfUQjCBTRv6+OY6Za/uJLXHKhFyc0634GWIZwWXIoNnPueJtjeo50zF
         ukb7DUeuI1EvsWBI0MXNwSjYQhst2PyuqC6vwhz7Ll3g1AhyPEnpMebdnBMqixUN/GBq
         QK6s+PD8Pl2hxl79e0hHkCqcKT+NpThandel9UCgNf3Go5RKXgR+aBnVtwpNg6T5pBhe
         XxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782879213; x=1783484013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhiglAKWEMHFc7lKOMiqzyD+MOB/Txierg5D8N9tqgg=;
        b=YgHgZa2eOq2fAc5Y6g64i9TLf2w95EzdRAwPmDp62NTzRgmx11CSFun8zwtDqe9W7D
         W7rQFkYAyg1tJHk6Iy7qoqs2mf7bZP+tl1u2OVnA49q63ygWfYN9cT4fYQUZMZvOkpgu
         zbzjysJNCujN97UEkR7j0ybHTwBFTYFMAq1CIm/6W6JcgRd4jaNKhNX8RkdoYaEIjwK8
         iyLseI5y+d0dayzfAu763XSiczdh7LCoGAzEGi7pYeURQAm117Nrc2dUo+BV9Rh363iC
         gDurEDPCHUd4CV7rH2VvvV5xxnK0IyG46DfvmcHdqOBPgues7H7Zz7BPDF2U9z5+htj/
         pzYQ==
X-Forwarded-Encrypted: i=1; AHgh+RqyXzyW3q/nitnKUPlbFtbJxt4Z2oM1Gdda04amZU6lIooNQLFD/azRnCXccGj79CQKlzjoyeI71qS/DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwQNEgslOG5t5Nd20VKNdI1VKW8szhrg8BdDOcZTg4c3loh/4m
	V3v5kH5NL33PZ+qSEuVaABkbXeu7VIpKk5LorBFCkFTjRxiRH56WgCqL
X-Gm-Gg: AfdE7ckp/KtvTXGD+MmipFT/WdZaYR27aV0QxR1MV0g4J8C/uTo+rUZeBO7ghANffio
	ABfJ/pMCgjsVImDzVC2QSyGVl8tzr+WTmsh470p+2HDldoDDrW/mzjAuimgXjW8smkzytLhTJIV
	EGMgA9fi5Rxb08pDE+VztxAWvdES2lD4G6aWANEyJtoMhStI8fHio3blfoXtv8MukqII+gxv7DR
	9nhpaY1hpxyrnx/+2wV8q2jMVdCVNkryW/YpL7jxyc504gOtdTDxez/V3UGF/i+Hs/2kwZTKZGH
	a4pC3dEXkVG+qTBahTTM9Idt5ZRhf8QtRLDlZuDc1TMyDPPWnpUSHHDPjasdBoQveGchO+bb4Ex
	XwE/qDFFzU47+7gwgl2JXo2AmJuOTdpowGAfZrKnY8QfgQVOANtx5duRrkj+V5+Ag/IhYcBZ0d3
	LoTtx0kZquRDDlobD8g+gE4aPG8QzCYLtQ8Tp/mgdWKcjXZh0=
X-Received: by 2002:a17:90b:35cc:b0:380:7763:3b26 with SMTP id 98e67ed59e1d1-380aa15b525mr99144a91.18.1782879213357;
        Tue, 30 Jun 2026 21:13:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095e830ddsm963128a91.13.2026.06.30.21.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 21:13:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sen Wang <sen@ti.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: Fix mixed goto and guard() usage
Date: Wed,  1 Jul 2026 11:13:08 +0700
Message-ID: <20260701041310.230725-1-phucduc.bui@gmail.com>
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

These two patches fix the remaining cases of mixed goto-based error
handling and cleanup helpers introduced by the recent guard() conversion
patches that have already been merged for the 7.2 development cycle.

The cleanup.h guidelines explicitly recommend not mixing goto with
cleanup helpers in the same function. Only two functions were left in
this state:

 - sound/soc/samsung/i2s.c: remove the goto-based error path and rely
   on guard(pm_runtime) for automatic cleanup.
 - sound/soc/ti/j721e-evm.c: restore mutex_lock()/mutex_unlock() to
   preserve the existing goto-based error handling.

Although these cases do not trigger any build warnings or errors with
Clang (W=1), they still violate the cleanup.h guidelines. These
patches address those remaining cases and add the appropriate Fixes:
tags for the commits that introduced them.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: samsung: i2s: Avoid mixing goto with guard()
  ASoC: ti: j721e-evm: Avoid mixing goto with guard()

 sound/soc/samsung/i2s.c  | 25 +++++++++----------------
 sound/soc/ti/j721e-evm.c |  4 +++-
 2 files changed, 12 insertions(+), 17 deletions(-)

-- 
2.43.0

