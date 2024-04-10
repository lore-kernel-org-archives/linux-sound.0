Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9699715EFC7
	for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712758963; cv=none; b=Qz15zT2rJ8DE3HbEjUlD3diYoMsfwFoSllxtpFE3yecj32VWsWwjoe95MLmS0ZUJl0pPvGm/t4h851FI2tTwS/EINboicBwd3uYbezNl4w0fqEVQV//Z1tqN3tt/S8pwS1+/pYmFJ2uilUSw9Cgvt/1sEuMvPLQfvzAs2pVx4WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712758963; c=relaxed/simple;
	bh=yaSKqEJum2ck2PZxdBaoUcQHyswu/eekvDph0rJnJ3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TcxGcJaL1gOA7DXjihzezNF2ZsYwlC7yzPQgbn29LLCtcCL7C4r7R2j9uwhSjOd0DNxpaFAyf2pBmQSzJAKjm/8T6y/redxghHAQDorpkpWvofPXrIC5LAu2tAOwgJzo/lD6vQGGCQCr9daxqZ6ipS9PHKWRb3AdsKm63Zuoo0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mdlAwCf0; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mdlAwCf0"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56fc155b646so869726a12.3
        for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712758959; x=1713363759; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J9TniiRgXZpUH84DKODlQtqenNtFYZDXqebQBO7ZDCw=;
        b=mdlAwCf0+1A/tEOJM6L2xyodHkh8NxF9qUtSHN70/QFE5M9NEHDgqC+n3US1kmtX81
         cM1I38sY9dWemYpwyqf2477rBfjRfppDLmRCPmVKu7baFTvSqO54m74UragWpqEMDrYO
         Om2AJgdm1bTCHlDLP/0qrYmYwuGpUU+WwRaCm6DjdxGg3yOLw6mvDC13LGtCc13vbpqr
         h6StmdufMFMtyzRDThxXkl0F44XK3OnqAggg26gOTPBEhWMWL4yqB2ScSMEuX/nELwnr
         770UQGoqqq/ugQttE4jMfXBgU/wN+NVHqD6MULuGFYU1jObXgXKJWl7FnJpGrfliF1Nj
         gYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712758959; x=1713363759;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J9TniiRgXZpUH84DKODlQtqenNtFYZDXqebQBO7ZDCw=;
        b=rGp8caW+efdoDLaCHGSkAibYlNnlUH6qtoSofnUn1pKJLKeXXEw984K0A2ZMPrf8iR
         0VZfOLG9JQRF9kiBiszN9hns5s2l2Uuy2AEMlveGewsnpXJZe1YnbHlRjSvtNJmybL2/
         Zvvlu0PKvrPQQgMnAn+9oQ6LXUTBGIIbgqwXbKSer02WVyLOkjGhgFfSIfTL0K3YsBaK
         qe44nJUOZKCxde+C9D6ePPix3PQNk6vXELiACSh7N2+H5MFZkbt14+jYa8oxqujBulgn
         znEwrsxQzcb7HKMMACOv/Ez1961jx/t9dGoklq5myZJDRet9Iengy4LY2WTht/ytjoI8
         6tXg==
X-Forwarded-Encrypted: i=1; AJvYcCVvtBgsuVq4b9kkeXh6NLlzNlHqIxSK3Skq7kjwo/fOJ8DT1ZUeCtoRKwha+3m59BOSSThzfn2rVkIVtxKSxXXjKnseFvYcMb7XFK8=
X-Gm-Message-State: AOJu0YwESGP+2KMayjCPL96DS5AqY5bmxaf4E3JMTLFlwc+MePxU9/fS
	F49IB4BRrzVLtXv4aaEDtNBN7FokVjWNY8JBNBiOon0WdkF/yQo67cFEWNb2I5I=
X-Google-Smtp-Source: AGHT+IEyFlSMTciTLKgZ0LwqpaVCq5r0Cqpl/6AriXAmz2R/iaZjTELdZrW5xapwul9CBN0LkBtUvA==
X-Received: by 2002:a17:906:a410:b0:a46:f69b:49b1 with SMTP id l16-20020a170906a41000b00a46f69b49b1mr1637529ejz.46.1712758958594;
        Wed, 10 Apr 2024 07:22:38 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id e9-20020a17090618e900b00a4655513f0bsm7000506ejf.88.2024.04.10.07.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 07:22:36 -0700 (PDT)
Date: Wed, 10 Apr 2024 17:22:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] ASoC: soc-card: soc-card-test: Fix some error handling in
 probe()
Message-ID: <2db68591-64e2-4f43-a5e1-cb8849f0a296@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Fix this reversed if statement and call put_device() before returning
the error code.

Fixes: ef7784e41db7 ("ASoC: soc-card: Add KUnit test case for snd_soc_card_get_kcontrol")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: call put_device()

 sound/soc/soc-card-test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-card-test.c b/sound/soc/soc-card-test.c
index 075c52fe82e5..faf9a3d46884 100644
--- a/sound/soc/soc-card-test.c
+++ b/sound/soc/soc-card-test.c
@@ -148,8 +148,10 @@ static int soc_card_test_case_init(struct kunit *test)
 	priv->card->owner = THIS_MODULE;
 
 	ret = snd_soc_register_card(priv->card);
-	if (!ret)
+	if (ret) {
+		put_device(priv->card_dev);
 		return ret;
+	}
 
 	return 0;
 }
-- 
2.43.0

