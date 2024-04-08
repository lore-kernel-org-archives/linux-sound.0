Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E26353387
	for <linux-sound@vger.kernel.org>; Mon,  8 Apr 2024 08:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712563831; cv=none; b=TH9adHqA/NLGXenUc4pPhac/eJ2zMNXerim+v5SVMClPhD14kWap75w9n9UtLppYB+hbQIA6gBzC3px7OlriNy5WqmuThU7sgRzgU3a+blNXy9rBki+Rf6gQAOUSoRUrYJjzjOMHQKbg/+TZNH9w30Slc+5K6tP3XQ7QVfP33V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712563831; c=relaxed/simple;
	bh=virOewUX4t0oSLmoki5IIgzfGSQ60/H3437FkDr3qko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pHviAc2de6PlAJKmiGBvOalsGaa71thsf4KjwJF/ZIr5soEOM/p0cGT6JpbPfwKOuG6AKt8x8XfaeKknzgCPrjVZTxj75SHHJ1bEF0vf37iidx1/7FTH7AJarooxTs9dtkGx6szkJv+DunVNq9u/3bDLx8Dck4AMQae6IUW1DOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JtK9dDMH; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JtK9dDMH"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a51daa8242cso53949266b.2
        for <linux-sound@vger.kernel.org>; Mon, 08 Apr 2024 01:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712563828; x=1713168628; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SO3oSKHhB+QUpEgYOl7F+vhVd4MWO5gWULhDTn9lHJk=;
        b=JtK9dDMHhI40zGAm112hD9FH+/Um82S5KZTsm3vXdSoVMMsXwePpUt/H4ASWhyXgH8
         anE5e4xDNptqeEcyFZLOftnk9m+qbNFZ2Sy/4fgI+ErCudRGXKyn1G8p6nONzJK5nmZ1
         M9FxZpGGc6F14bAjkhEGD/1eoc6rwsg/lT8nGs+lODyaUGT62X5xxiZh2V6FU0o0EPRb
         SWqwE+ZfP7Ftu1uWPbAzbziLNF+TNsdBRLktzTNzPhfnDrVTQ/xvB9V/aOCOLHSvZeZT
         2WlwsVdfBrm50l5LYBzDATMNhfcaQkTCsc0oPUYS+pSBBpbt97kxBjrP/dmxA+dXnEfQ
         5lmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563828; x=1713168628;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SO3oSKHhB+QUpEgYOl7F+vhVd4MWO5gWULhDTn9lHJk=;
        b=CVEx2oUzW2dZhY4CPuJf5Gz/T2ke+JPCJFZ3plhqCWoBv4Qu+lV76MFaGq/c1OOQnS
         5FFp2UFDpfuZKy+Hvl+SiQNPjM/TwDhWLG3KELYo/IdM4TxkKDvLOKmDoODwp0y6AI2J
         9ge6SVZiDv1iqLnDlPqDZmlA6jE1OYjza0s8ha0L+4Dw4b+g3O/3jlURqa/MT50LQxmb
         KeN0/zyRiU9U5jDlwRmBaZWZnybWWHoYNerAZ1OVvCj7xMlOcXRH7sAX7957MLtgW2CP
         tFqN1AQHFL1QBmC8tqn4ZM2Yhw5khd1QZgoIIfwCt3j+8VmafdlR9QMPnZpsQarr6K/H
         PPSA==
X-Forwarded-Encrypted: i=1; AJvYcCVdMM2QH6cKab7P6e0uznNwo4FiAuWSemUqUxsSm0Zmin4KRe8LhGrbqqES/JgoJ4C3jkYmFkCGBsrgr5yqS/5aMbAIq/CLzBpFQCM=
X-Gm-Message-State: AOJu0Yw2rvJfDysRFlwlLB89k6p4P0hfvD0KXKAowFdfPtXe/lxGFe3j
	D+4BMJIUhtb8SOCjFFJEmfdrjjpCJOQtwCDdFtSDXOXYx6jLEefRr5eYkXBXk5g=
X-Google-Smtp-Source: AGHT+IGBP2Eb1evno6OQER1fBynnrKOVTRDH6lrULwXK4u5X7YCnyIyHK40Fs4HT+0CKsXZ9E+hNfQ==
X-Received: by 2002:a17:906:ae4f:b0:a47:4bd6:9857 with SMTP id lf15-20020a170906ae4f00b00a474bd69857mr4337354ejb.64.1712563827422;
        Mon, 08 Apr 2024 01:10:27 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id r11-20020a1709067fcb00b00a4e9359fbe8sm4091818ejs.44.2024.04.08.01.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 01:10:27 -0700 (PDT)
Date: Mon, 8 Apr 2024 10:38:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: soc-card: Fix a reversed if condition
Message-ID: <155bb76e-dc57-4a5c-b0eb-acee5ebde9f4@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This if condition is reversed.  But fortunately, it has very little
impact on runtime behavior.

Fixes: ef7784e41db7 ("ASoC: soc-card: Add KUnit test case for snd_soc_card_get_kcontrol")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/soc-card-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-card-test.c b/sound/soc/soc-card-test.c
index 075c52fe82e5..a9fe7d243807 100644
--- a/sound/soc/soc-card-test.c
+++ b/sound/soc/soc-card-test.c
@@ -148,7 +148,7 @@ static int soc_card_test_case_init(struct kunit *test)
 	priv->card->owner = THIS_MODULE;
 
 	ret = snd_soc_register_card(priv->card);
-	if (!ret)
+	if (ret)
 		return ret;
 
 	return 0;
-- 
2.43.0

