Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1B632ED40
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 06:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792306075; cv=none; b=mXQ31wTJ3Ttm2yOziOFDBrpnJBDcQDev1rMo52QLU1BNgM1QMu58gN6Z6JppD+my7fIgmUAUk9lGoTPBkHKnQokS7kYAR87+0p60Qm8KC30YYbX4X4OrrTHTjbyd/3+x1QeQEKRXgFuS8GHvCadM5LeLGgoSZLNVuya8AtNF9ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792306075; c=relaxed/simple;
	bh=l1O247UECd9MgFF/yX1QTmm2/D2UiVNrnHCAcxwFq1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F0M2K6Mde2q0OGwvzdlfC69NXX0gRCu35OxbHisLf10//i0F3uFOoutLO1qjOEGaYNHFwYxGPgkhji1/5KvDMtXw2W4kAlR288yRbPrE4oAuebbKSK/OXSVzWNP0cc+jxmh5e6GhavYVUCDf+4f7l8NCsiMHly+RqCFSdGMujhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2TXp2Wt; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2TXp2Wt"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9d1114320so2727675ad.3
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 23:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792306074; x=1792910874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7HNx6CyE/4Kbnua7x5pglUwrO1yHT5e3xN4f5XT3au4=;
        b=s2TXp2Wtgo9DkAiGjc+cQReUYTF4+/7mCC8sZaJyJZOb7c2E2bap/Z9HbyIGPLdB5S
         wJ48vifxPM0YfgAYygGd4OkLS5Z0ZvfDuqbrGPLR6SHxd/sMzNwXxYV55vyLZ5C07nzt
         o4SEH4UyK4XxKybigUESDi3i0wWRggkPEEiYorz3iHBBkSlD8VBnpctsrOTlgPXNgWG7
         faZVoiGmRKHbx7E19ktStTJJq1FI7NSfJiI9Y20+CDNXN6k36ChNlBWxL+g0XKtMyl08
         zeA6Ek62J39VZH65sJsAp13d/iQFEnae6LRGQCOgZm9XOCMaD3x4UhxkMd1hsWqi5Csg
         FVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792306074; x=1792910874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7HNx6CyE/4Kbnua7x5pglUwrO1yHT5e3xN4f5XT3au4=;
        b=wtFuXTNHLU3Gjl2Qj4Mxv8BSVT9AA8zSXR57HYgCaECcHmRmZL1HlmchVBB+XFRePA
         QA3sKoJtcr47kAztZHQ39plvUhpxk1qxgUbw39udpq9NmG6sV+z4TiVOA9VPnRNk8Noi
         ZC0J2hhUCmC+VYGanWbi3UbCttdKWa1rHRq+xHcncpx6RyM4f/n/TzFuJfpkL+ghqitw
         LnOf6RKG/KU68TQLWkZNbf12t/jjzq0Y4Oy1xpHLEOGFL18YieHYpFf4lNwcNtEkq/N5
         B/m516FhCh0waaeVDHCQjamW00XoA2chQwCp8uNZBa1FeAGviExqBweEX1OFriJ2LPFj
         qtQA==
X-Forwarded-Encrypted: i=1; AKwUvBzrI7/I8gsZgn3HmjVzH4cSMM86dZLG2fCcj6nmQ28Yq1qILKlSRb+gyBMPewXhig5AvD17WyRtSc6/Mw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJbEPjVTKSOK6Rsbh6FS45rraI9CRinGBwljxG9KtViQgv0dfq/
	f1Ym8YTBjmp61PSSBhd4Mog1q+zueYOUUNOssRx3Sk2a3DBPNztgIhsF
X-Gm-Gg: AYBFou24R6hZjBcyH4qYx+Nqa2q9VF70jVzcWoUMOdXMwxGwBjTHfpSBHZPyJpQWuCk
	kPIF18Gg3wW2ImLzmeL6KXVqk0eTUzOV4VLPmN3V8mjNGI8w6msHC/Q5b4tOhH9wO0bPBvv0tj5
	Lo81Vlj3S9zMIDwKEji3XjfP0PFVH91P387IjvQlTOK+HepLnB08FqftxDVCTql0yWR8KEicbVJ
	Nbz5fkThXJvZg9BXakzodCUGooEfMcmrSjirLT5CJwEpLXb/GiSEgJdAfTaUkIDq7E1xA0CJ/D8
	KBtjowD5pYiEmczuc/1/p0jFLTwuZ7BGW9ZZWclU8gMQIOOFgtSUSfMF2JQOnRrARmNfxgiZWmq
	pXXsD/W9Gn/X/6zOx5EApmRaEPWjyztxGWmEoUClExRKVIlYrmvKUqr1Tkv1u5ljNJaTk7aMu42
	t+kVbzBAjEvgxtx7KSCU9e5NXBv1DerRDz7vzq3njjD1qdzKiETmobt5IPDT/YJZDuHyNppjvwM
	+L7dTYm/lt+GwkchS2sVan1IMLdx0uaTD2r1i6S0h9Y2lWds/Acn0eo7sYgmiNeMbAcGIXs8OuY
	TQ0bRlNSwCJw
X-Received: by 2002:a17:902:ce81:b0:2e9:6f2c:71b9 with SMTP id d9443c01a7336-2e9a6834239mr39718335ad.1.1792306074114;
        Sat, 17 Oct 2026 23:47:54 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b98a9sm27280335ad.74.2026.10.17.23.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:47:51 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	marex@denx.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ASoC: codecs: Fix more control definitions that write another control's bits
Date: Sun, 18 Oct 2026 15:47:43 +0900
Message-ID: <cover.1792135145.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are the last fixes found by the overlap scan from the first
series [1]. In sta32x and sta350 a 4-bit field has a maximum of 16, so
the control also writes the bit above it. In tlv320aic32x4 a TAS2505
control uses the wrong register.

[1] https://lore.kernel.org/all/20261008130953.2446692-1-sammiee5311@gmail.com/

HyeongJun An (3):
  ASoC: codecs: sta32x: Fix definition of limiter threshold controls
  ASoC: codecs: sta350: Fix definition of limiter threshold controls
  ASoC: tlv320aic32x4: Fix definition of TAS2505 HP Driver Gain Volume
    control

 sound/soc/codecs/sta32x.c        | 16 ++++++++--------
 sound/soc/codecs/sta350.c        | 16 ++++++++--------
 sound/soc/codecs/tlv320aic32x4.c |  2 +-
 sound/soc/codecs/tlv320aic32x4.h |  1 +
 4 files changed, 18 insertions(+), 17 deletions(-)

-- 
2.43.0

