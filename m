Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202B346AA80
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 06:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959607; cv=none; b=bZaOVf/Dr9q8ailEKykcu5hNaPHZkRdMz7gRkcgP5ORyoV9ow/B6TfIxAenel2zuFFVhfLwry887h2M7uUYlQer5MtSFuli7L/+aCZpSpZ1d9K2BlHvbqusXQ9JMKSstz/azpdqBZBlJZyM8Hd6CdJ8bX1kr5LX+NMZz361LW48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959607; c=relaxed/simple;
	bh=Adm0s5nDt1pgd1rSxmR99mnhZEVycyLvr7i5Aw20QU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e/R+vsmg2EG6QBcRzwqnhm4cWiNM9Zjg+wa5f80LzhkvZp1tbldI+eOFwRizgx6gOKbJt8KVO1AqGnfaLDSY+D7Wu2SCmwbFlXVysrELxpfjaoVjSKX2KX0GieNFBJjlUDcB9s3bEE2LCA518xZ2eb7duSsi0O9ZX30FaGezv/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdKt5/ta; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdKt5/ta"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398b3c37877so1854831a91.0
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 23:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959599; x=1792564399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e0+SQK7DMGgCc5FMxNNvIgVyMRIaCk2AvbyN6VRUGko=;
        b=YdKt5/taHU6b1ame4i1YsptI0O9CW6V4KH3LKRnN3Mw0z40GoVQVWiCJBRuWMLITPs
         +teXPf8MH5b8Z6XJ2HoTFwHFFUkvNF/tusE9cPwNC1fTE26DQlOI0m2a5HpLpAzteec2
         7bMN5e+Is+iwg7d6ylNLM2DBq5cjBIXgTAEsg0D1DO6zvAaJE9nL6db0CdI/DIdISnGp
         CxOztx/P7pznqhxA3fRD17UKvR8SMJZn4KlwwYlbYhiCNB/dtlOXGk0g5bynrpte5dGT
         lzdO7CM86C4oTj1bUI7CBXM9u3XHZwTmQU8VCvqM8n46yd9TOuGG+mm37AaPZN6C7Mtz
         a4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959599; x=1792564399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e0+SQK7DMGgCc5FMxNNvIgVyMRIaCk2AvbyN6VRUGko=;
        b=jd3z5w20FzhURKQoUej2A0D4DpojxGImIJHJhHmKiiQa6+iltsc19u86SLTtJ0K6Tp
         K3lW/N2C+CpexGv7wqu3HhgHq9g0OWqAd03QPAPl9QYw3oJna6gcsKSlOpMbkRQ3VFMh
         IzWKO3ybt4i77Zdrmp2e2fTR4H8ELxWtG2no3oiIRsLhuZgX2UzqrRPoYFrsiiwJa/g7
         cs7hnEp5R3oOPM96pAbY5xXdhduXu+94oV05JbL1GAWeYOLbUvq9eITL1YjrWsrqrZlL
         jSX9qyAq4cu3eVuDzC9D1wSV2fuXEc8dQSdIYqXNtl413sFESJ7qMuGBYHewQwMb6ROR
         TrPg==
X-Forwarded-Encrypted: i=1; AKwUvBzBVftKC61OvrHTnjLzEWtkrWAMmxG86vhjsA9wqBI7twm1q2yiJVb0K/ejlYVwhxL0zGZPbY2W74IbeA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+B7nVfpkn93fdckj1ky2L3drAaJsGTt5aupGxAQDdlv+GscQd
	G4d2zjeOzKZNe4YJ0CM/px5ymuCf9jItQg/G1FNaAMpHbxZYRgCgbmxN
X-Gm-Gg: AYBFou35sjkBmERtVM8chXAH6FANsGRK0u7RiH5/zg1qotyrTFIJMMvYPkuZEpIfEOc
	I4jtlEZ7St0alJRGCfmWDeFTietkn6Aw+AIW/e3y6rOO3bZmevk6aqzYni97lC4K35Js71jH4sv
	7oLXL+dEpPR/+eXwpXUyTaNKz0JS2l0KFsEPk0iEK7IfffU2CqwucRNAuwEdBiy1RsP5TGkYRdu
	KV8P5P6r6atPe9RbaoyHh/SScNrAbPeqfAdKEBGJblBFG+V2g/ub+bHBtMv8YXyVxoPhNuvsB22
	LgWc7UgbD1bFB7uRlNli/XOCK6t9w6/1XrOqan/+VBg9lIA/+QExa3W58F8p4EtCeqW11hAt9e/
	ALxPBAuaUYT256R9Pb1fvFIpIauPGGieJdxT7KNIEO7W+j3KqftXPfsSoHxm9PGsAsudlVe9FoG
	TRugEvgqOyKioQcgFBdfcwRSqU6h1PRYe3LthWhaBHvUFezCGXfzjc6IH+WeyDDDLYfgxNDLcHu
	1lnYsb0j0KjPdhUD1KUubj76YQv51JpDL5bgH7bUNXBnV7jdjhemrRRQjfljzBeu2YQKASZNJg=
X-Received: by 2002:a17:90b:5444:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3ab3ad26901mr10669810a91.36.1791959599383;
        Tue, 13 Oct 2026 23:33:19 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:33:18 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/13] ASoC: codecs: wm8510: Fix definition of ADC Inversion Switch control
Date: Wed, 14 Oct 2026 15:32:40 +0900
Message-ID: <6ada61df8c8fc97ffb1623e74f6742ca498032fa.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ADC polarity is bit 0 of WM8510_ADC, not bit 0 of WM8510_COMP, which
is the loopback enable. wm8974, which has the same register layout,
already uses WM8974_ADC for this control.

Fixes: 5d421516670e ("[ALSA] ASoC: Add WM8510 driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8510.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8510.c b/sound/soc/codecs/wm8510.c
index 137dcd3d7487..c611eaf0ef5d 100644
--- a/sound/soc/codecs/wm8510.c
+++ b/sound/soc/codecs/wm8510.c
@@ -134,7 +134,7 @@ SOC_SINGLE("Master Playback Volume", WM8510_DACVOL, 0, 127, 0),
 
 SOC_SINGLE("High Pass Filter Switch", WM8510_ADC, 8, 1, 0),
 SOC_SINGLE("High Pass Cut Off", WM8510_ADC, 4, 7, 0),
-SOC_SINGLE("ADC Inversion Switch", WM8510_COMP, 0, 1, 0),
+SOC_SINGLE("ADC Inversion Switch", WM8510_ADC, 0, 1, 0),
 
 SOC_SINGLE("Capture Volume", WM8510_ADCVOL,  0, 127, 0),
 
-- 
2.43.0

