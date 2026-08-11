Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7B542049B
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 09:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439189; cv=none; b=d50f+0+JnrC4iHQkEvqWuyksrV1VWhbfvtJ9mwmdFg4HwBiBjOBSiyHcXfwSE+GG0sgbuMk8cx94iBGXsyV0OW4vC9ZEDJja2P7EFDfJ+zuwu/XX+A3205e+eKYfkj+XChjRueVdnAdcbXWHtqKVkm1NPt51ImMnbKwl2PUwvNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439189; c=relaxed/simple;
	bh=NUN9c84wMofpIprFRnCda8aqoz5pVig6Wq+bDcU9FTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lD35UVXt4YXThQsJozLWDP3bxBVy7H/5JfzAGTRu6H3CzK56NVssuU4wZpJT1HHx7MOmKLCS8kRMkMNDOdEntyypOOrifP74OEN33cY9Ka4ERqnG9TS8vgnUIr2XFweaBtczG9qvFgI4TNj9BLBlIFcZ5k+XG3Mx3GVKOkW1zbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UiSNmAy0; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiSNmAy0"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cacb8416a1so28808625ad.1
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 02:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786439187; x=1787043987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqlDkb8lVI89Ppp6MgURkz1R9mD8bz5ox4eMgoIY4X8=;
        b=UiSNmAy0RCPqqAHJ2lcllS2sqAIOSvImo5XNk6Vqfn8XBV0BWfU8K/4oHR9r4u6RpZ
         w8SJgKfhqK7dQJaxVe6GvTbCBbLPDmTAREIxJbOMDg5ers4nORmW74UWz1cWbS44sHKw
         sn2mlthaMXGr42eA8OKMkR+bU2Hk0gkGjfz6rCdSWxz3NlKKnxmkz28lbRpYnmTBpMJS
         4rP0ROmcp+luErfDWK/pmMRKWPySY/i6Biynsb9Xbmy8Mr/qOZvZVKs5ja6eKX376brz
         CH8uBjFSUWBlRiJNdKiTtjr1CASz/z4FKE3QrSaZ61CV8qlrpDVa28nCHf9beiASqfCf
         sY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439187; x=1787043987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZqlDkb8lVI89Ppp6MgURkz1R9mD8bz5ox4eMgoIY4X8=;
        b=ac245e0VeUBDsoY++48R5KsC6Kka6zwp5oFu+AOWs36yKf3qbMKBzdgFP7hgHx/DZS
         +N5TB96yObbYLi1vHxcqqJ76j+bgX8wftEeaMLhBrcRlIH+/6qfhaiATf7hcarD/4sXx
         o23GsE54ovv2p/jPa7XlHhR7hNwhYRitoOEl+M3F8fMvpnq5rICAO5OmzaLnqgK73v1K
         bdJ7FCtFQ6xjhNi6w6yEMJxBYALUZwZAzEyaz9maSmq2/ACx5SWVYGR8ufB27fEEI4pJ
         3poX4f32Zq/SAHUdTzfHAbVCWvCaS1LjmN23tNAQsISRhFlEW4i8S1C7hYU/ybTzmZEh
         eAaw==
X-Gm-Message-State: AOJu0YyZ+FEArr4Ef+/CLqEXI4ZcQS5gRA0lGM2is+MS393sAKGJ18vA
	A+SqA72eOYR8gz1PL1XIdYeg59Z4cFPe4L7sy0Q7dePdsK/vdX+4N/BH
X-Gm-Gg: AR+sD13mcCnO/GYP0Qt2H4KTKNjRhJqgttzEv3hBIPQow2kKE4TEQOG9gu4rdIfJnxG
	KM1aJOnvg+chprYC7+opIX2VAulqTiJ7jFzyaSGlWj0i+Iq2Y5/n7yI+zaTxRNZAQYLoqgetlcC
	e6MlkANNmeIisZR/9nbQKXJ0y7bD2mQaObamgGW4amXUsRhA48PntoHZJdAM3UZ+bynEjU42QXK
	9ohl70U64ZWAui0cwr0EH3VWVo1vTMpuHaHE7BuKJTpHnpeAjDdr8Qf21GrrLXpMfnMv/XSHu4+
	79bboMJ0dF0IBcB1yc80llu4q5dFXPPiqlgjTH269JR6NKgHSW4c4vWIkgm1gZyujv6lXA/y8W+
	Z25CnYiTfO1enLlku2gAmhlJvLsHsol6Dv9EcMSIEMHd3XoHK7qokja40bIUcF4BLtF9NcED4Fh
	7Hk6WFUtAX1sRhH68UKf3KSO2jbAAk4xE+nxaWV5UXj17SCJYt0pEcQuZBIZEz8liVi5K5paSCm
	z2It0y/+NO4LuiTJd823gX0saFFiLkKDjwM6aHwRbbObVsf9AJGzPzXVQst6qeCr9F6eortNDmA
	SWrNCcS66UrF42S2
X-Received: by 2002:a17:90b:28c3:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-392ec357ddcmr1780816a91.5.1786439187322;
        Tue, 11 Aug 2026 02:06:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392ee41936asm1128999a91.14.2026.08.11.02.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:06:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 5/6] ASoC: samsung: spdif: Drop redundant probe error messages
Date: Tue, 11 Aug 2026 16:05:49 +0700
Message-ID: <20260811090550.38930-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811090550.38930-1-phucduc.bui@gmail.com>
References: <20260811090550.38930-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Remove the probe error messages to avoid duplicate error reporting,
since the error is already reported by the called functions.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/samsung/spdif.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 53eaabaf8956..719083e8e89d 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -415,19 +415,15 @@ static int spdif_probe(struct platform_device *pdev)
 
 	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
 						 NULL, NULL, NULL);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register DMA: %d\n", ret);
+	if (ret)
 		goto err2;
-	}
 
 	dev_set_drvdata(&pdev->dev, spdif);
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 			&samsung_spdif_component, &samsung_spdif_dai, 1);
-	if (ret != 0) {
-		dev_err(&pdev->dev, "fail to register dai\n");
+	if (ret != 0)
 		goto err2;
-	}
 
 	return 0;
 err2:
-- 
2.43.0

