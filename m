Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F30346A5FE
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805051; cv=none; b=YtOct0tQpCrrRl8qHsKhbUc8GcXJk/dWddbO38yMkdTd6/VVa13yN5nEBNJoMz6V4l2t/m6+6f9eYKg5ZGwXEsd+6Zbrjxe0/WJZigpAm0q8dCPBpUsVQkLRbXgaYtq08idaqosFe4e9dynjo8OtDwoE1RuFR30grk+TfDWFTc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805051; c=relaxed/simple;
	bh=iy8ONyPJCb1ZN/9cQHu3wQNYtIFHjmssqrm535DhWUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IxdxAhwHcaZNO7VqxDf9j0eKmRjxMU7bv1jI8ETDIK+WR0T5p8J7Z+z4SBlLya1/I/J7ZWj18f/wef/9s+8NJv9sYz6rUiu8vpMwLrpThZHYCRM0wuo4VRvvEQNd30eQVWblisjClE23gpAB56xDCRDDYG1vYtJFYQPQu4V0Gys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdBCjsW1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdBCjsW1"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ccf2360620so4669615ad.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784805050; x=1785409850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E7CMqpvoxTMssk1F2A6UdWgSY8o4WqonJW2ONWNcRiw=;
        b=hdBCjsW1HuPh4KqYTIlG21Knq8vJjo4a4tdtpjhzJcIyJZhjkjwo5R+jWkOo6UYd5k
         KvLUYMa8i8zEcm4phw+RBvbIsJuBUegXm5itCeKxJRcFApLPeykVtEx1mqAvkAwLF8oa
         jUK1KT4LnMhjRgU5+WLybFf8SzpC37p3sGneO3TdlhV4RybaBFUH1avAyWDPuYJBcn06
         awUYkiicBHSC+H/W0SsichCYQg0E8PAK/KTBGpz7P7LfrZYXYwRW/YC3xMSsDlxL/+BZ
         a7qkdSJ3aIiBFYdF9IRaqFwfSjEpG8Dc/9ECuWUc5hYAWSblhOwBoUyrowug3WrL2w+C
         tfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784805050; x=1785409850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E7CMqpvoxTMssk1F2A6UdWgSY8o4WqonJW2ONWNcRiw=;
        b=bR3sIA3QkQrety4ez5rPMoeOpwxkVdjX+6s7QtLB8AiYHO9bTkqltVjg2zkYmEoTMk
         NzRoIQ5IrvcPcbTRnsZ/XpK8RTKSbGW/6vKiv+82CmmRT9c+F1S81wLf6d0ArKlCK05I
         fPur1BDRWkIfDL86ceiPLlH/Qqt4he09OBf9rLnL65RmElCqS3W6tuyl7sTCBQZ7OVzY
         W0czyIKCEGoLYer6lqj6r5C3RRn6eg8t5POz+WFDwACPKR4Hrgt23HKeD8fbKftm4Z5r
         Kcc5Bjr24hQAqPoIfITnw5oJswA1F6vNlVrUk+C9LhpmxGtlbEV7atFIzOHOp3qzK90V
         5gAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWMMjTNSoBc1PUTXLPWNV8yGwlhRZEYP9eLiNLoxyCMKBLqdVEiBjcD24SkRVWfaO+3k82vS2gsb8cxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh9lPi3JjNfbd9xMJjUirOg1lg9sLIB9myfl2fcHejikdtQsi8
	OtPMsEmn1w6F2S4gxWjrJ7Wi8BOJxMpyQuCvEjVotOKggPh0Zsbc8zfN
X-Gm-Gg: AR+sD10k2hZ1yT4m30TLBUGQdu9K3k/sgb32mWsCbVhVUfYv5hsUwo0UhNiJJE1D90Q
	+zR/+rHiRWmsu1UFWWRXX+ou4K6UAByOqRC//V9DMXG8gnsYJsUME3ENHcSSMtE6B0Iiy8xCcuk
	178BwUKj7ruQrlLx4GskJPCe3D/RxICwcQlk++NeNppzxdixtnA2q2mcji1Jlmd8KQNRYGGKEqX
	ko+4LV5Pzujt7nSTWURSvxVNmf+xd8aRf4cIaTkh//hoV5XlFmXllbIgS8j2l8KArDlOErJxsyY
	yO90AMvHB1q1ikRt99+KMEYjESUO+9ARHB28cw1e+c41grziBTxuIJDkOI4sACQTzuyGLR2JZNo
	50IkL1dk2XyNraXBQrA1jh7tFmSN27jnzyHt/lRG/lx/moeRkyLs6uhLC8G9W/6kS+I8R7Gu8rn
	CxCpmAdKv4zfJ/28h0ZUx3eqqyaCnrAK87PQ9k
X-Received: by 2002:a17:903:1aeb:b0:2ca:660:b1d with SMTP id d9443c01a7336-2cfa6b73ba7mr31684055ad.11.1784805049694;
        Thu, 23 Jul 2026 04:10:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f38a893sm31500805ad.77.2026.07.23.04.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:10:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Walker Chen <walker.chen@starfivetech.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/4] ASoC: starfive: jh7110-pwmdac: Drop redundant error messages
Date: Thu, 23 Jul 2026 18:10:12 +0700
Message-ID: <20260723111014.54071-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723111014.54071-1-phucduc.bui@gmail.com>
References: <20260723111014.54071-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The called functions already log failures where appropriate. Return the
original error directly and avoid duplicate error messages.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/starfive/jh7110_pwmdac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/starfive/jh7110_pwmdac.c b/sound/soc/starfive/jh7110_pwmdac.c
index 562936981cf0..5953c3a4e373 100644
--- a/sound/soc/starfive/jh7110_pwmdac.c
+++ b/sound/soc/starfive/jh7110_pwmdac.c
@@ -477,11 +477,11 @@ static int jh7110_pwmdac_probe(struct platform_device *pdev)
 					      &jh7110_pwmdac_component,
 					      &jh7110_pwmdac_dai, 1);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "failed to register dai\n");
+		return ret;
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "failed to register pcm\n");
+		return ret;
 
 	pm_runtime_enable(dev->dev);
 	if (!pm_runtime_enabled(&pdev->dev)) {
-- 
2.43.0

