Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A3E3E3DBD
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 07:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916554; cv=none; b=q7kA90XQvmJNbh7gEX3aksuckypBss1h/Q8JR0FZUXlTQfBm7b6I6djXQi908dKjWY8IV9v2PofmvJavHrb12Azf+JvT/AaIjEzYbkkgO/FImnVI/HGaJsh4/Vcbl4LfJAAUBKSWMsl+1gW/l07BCpBZm4/0EJ+a+rAJNb5xv6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916554; c=relaxed/simple;
	bh=m1v76Ag+Fp0S33OQgA4ftyBRk7je3Dir+slUcySG738=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sxORuXhawWm+Sn2X2OClYIFgg1/FyhNtXdvmbvtFTaJYczbX40HY8Q2+FcJGUV/UZXAjyFf65AnkDhBgYbIi90bnd0VwT2ufmVD+xgCnHlrBHiXbWRySBnJ5EMsLK7WymjZsxcgvrFAaR2fIPqFCKz9kD0d7AFPMn/s55DuX2Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMkMhijZ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMkMhijZ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d004f135b1so8985615ad.3
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 00:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785916550; x=1786521350; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=buENsts9eXYr+cMpEnOHpWKy852zqVxsMr2A9kbxY60=;
        b=RMkMhijZEiFlDLAN78e4cR9+YpzmBXjFa5AOnUXvYf3EcqBBGzvYMbNtHSpx15V3dB
         kFbKL6+2bCHSabewtkS8Plj9CrZtZaCxPlc70gGNdalI2hcJDOIP8QeckL7yNYOOVwg5
         qLzQqqJgeU1FMEnXVVIQOOwb39pclo83WJNKhzPd9sdmX2rvWPyXYrR1n9oFIN+qLAEE
         F/PX6OOaEVKnZRHhAWI4LGdQX3x3e3G6G29tfPaJTsx9rGsiQKO3eIXgsX5I4Zh1kqzn
         omfSogxvEx70jd2hvPQ09L/1L8qPt147oWnogaqGpNj5pBAw5IAW97IDgK2TKjMAaaNY
         RgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785916550; x=1786521350;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=buENsts9eXYr+cMpEnOHpWKy852zqVxsMr2A9kbxY60=;
        b=JL5rzy5UzQjj1oziXinPRaflm7ZDeiESBNs3EHGCyLYsi++/6+ze+vEe9A9u+wetmW
         HHqDDf6r/8kpCDGdkSA2mU9FctbkVHpOnYMtUZ/xr1qM29ZmsZb7tLwteOGDgafrgVnl
         NMZYk6rqHZBvqufNiD7Ll8bxpPvcEmReLbVyzqSUOjQPjyRhBgiKaOKNMwwZL5+7Lw48
         eDlxWSDK9EB4hJ8WK4Rj13ohQk3ZRRrb/uiEZz7sj1tl5lDSmpJ4zxxG7r2g42EpzpVT
         e45njHU9ug9qpzYorFjP1Ci9KxtAoALBE+NjZlwea1O/UHszkRj5lWu1VI52LLBVmCIk
         Lhyw==
X-Forwarded-Encrypted: i=1; AHgh+RoAg3oZmF3apeWhCKHt5+CeIMxcS/asp1pIA3G8p2paI3b6d0W2mJ5wZfh1FurTV5uwf3T74yweJD8tXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ3t3icegoTZsPB8lRuSz64A8MIWGzVWatGRtmTn6nhzOxAnmo
	JZP+uSRY0vKJPnWG0Xcis3rpuRPDfAJ0nD4Gil2S7WK5Tn5RkXIFbQKA
X-Gm-Gg: AR+sD10JAMZCiG6pohvFSNsiS1z/8Tg6AfqvSp3vtcaPsGaTX6Srh7voCLJR93eQ+U3
	p3iysbuNXnOvugr5pe68xV3F3McdjPD0J6HaKiCD6X+heQika2+T2P5RYVR0L32VwqME9pvslxF
	t0He8kr1W0q8oNULU3guL91cBKg2bdP5fMVXTbyPYau8kOFQg5sRKgY+7C+D8w44wAruPylvTy7
	P4v8EpbGw5wfqbP+pDe/JzsASAzJipNN0YnZsvJ2DLakjNA/22g+o4ypYLHQa2df/LM1b3kZ3bh
	1f9YQUe2QO73W9AtmGkfA956BjXwMR+ZeSRpu0KcYHKz1veGmFbfOhKUnsnEt+YJVWkajh8E8Au
	G/IdOq/3g8UNRP914O52SKmSyru3Gwidgmh2gMeecjvLRg0yzs3ZhCeH29bGoeCFhZBJzMRe1yN
	4GEkQRtIIx992eZGkIHAoncI4q6bSArQi38ohHyYbEwzEokmaP6VDXtIYRIlb/VvIz0Aerd6xht
	xIjgCl3c8Pa0GezvbtGMw/YQwJE0MCMWM6y0f59oMFwY1VY
X-Received: by 2002:a17:903:2d1:b0:2cc:90aa:8787 with SMTP id d9443c01a7336-2d0ca7b54e0mr60337695ad.6.1785916549922;
        Wed, 05 Aug 2026 00:55:49 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f8fc8csm15721095ad.15.2026.08.05.00.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 00:55:49 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Wed, 05 Aug 2026 15:55:43 +0800
Subject: [PATCH] ASoC: fsl-asoc-card: defer probe when the CPU DAI device
 is not ready
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-fsl-asoc-defer-cpu-dai-v1-1-43f7f538e384@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH7scmoC/x3MSQqAMAxA0atI1gbqUKeriIvaphoQlQZFkN7d4
 vIt/n9BKDAJDNkLgW4WPvaEIs/ArmZfCNklQ6nKRnVKo5cNjRwWHXkKaM8LnWHsZ11T13rtVAU
 pPgN5fv7xOMX4AcLdSt1oAAAA
X-Change-ID: 20260805-fsl-asoc-defer-cpu-dai-9b54e87f5d03
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Mark Brown <broonie@linaro.org>, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Wig Cheng <onlywig@gmail.com>, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785916546; l=1593;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=m1v76Ag+Fp0S33OQgA4ftyBRk7je3Dir+slUcySG738=;
 b=MsFHsJDqkEdPoHI6b3SB9AdaBRM1iziM7cEjo6ZAz/pZg6LSeBVgxuR9qdTF4W1PUTZX61fIg
 nLAnfBL/cC9B8OweVgjJiqWzLAO9HbmVJbj2KAUV1m8dM98x8K5/g64
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

fsl_asoc_card_probe() hard-fails with -EINVAL when the CPU DAI (SAI)
platform device is not found. Like the codec, the CPU DAI may just be
probed later than the machine driver; the order is not guaranteed and
varies across kernel versions, so a permanent -EINVAL leaves the card
unregistered with no analog playback or capture.

Defer probe instead, mirroring commit e396dec46c56 ("ASoC:
fsl-asoc-card: Defer probe when fail to find codec device").

Tested on i.MX8MP with an ALC5672 on SAI3: the card that failed to
register on v6.18 now comes up during boot.

Fixes: 708b4351f08c ("ASoC: fsl: Add Freescale Generic ASoC Sound Card with ASRC support")
Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 709543308fe9e9dc508a791b7125e5f467182cee..eff46666c8add604d0edbf9537ee2d275813c1b7 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -728,8 +728,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 
 	cpu_pdev = of_find_device_by_node(cpu_np);
 	if (!cpu_pdev) {
-		dev_err(&pdev->dev, "failed to find CPU DAI device\n");
-		ret = -EINVAL;
+		ret = dev_err_probe(&pdev->dev, -EPROBE_DEFER,
+				    "failed to find CPU DAI device\n");
 		goto fail;
 	}
 

---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260805-fsl-asoc-defer-cpu-dai-9b54e87f5d03

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

