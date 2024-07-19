Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E49C1482FC
	for <linux-sound@vger.kernel.org>; Fri, 19 Jul 2024 23:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721433234; cv=none; b=O9YQPolLntNupjmR7uG/9LghZfi+0ZVgN1HweWO85P0vuc5FN9dV5njYPclISV4uvz92K3Majt09Pg8SkBMUlTQXIZjPJb9HGji0LIT8L2dReL9s0en2HxuszR4iKcDmW1fdqvfMNSvAcH8A3aQWffYg/ixso+finNR1YwEKqvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721433234; c=relaxed/simple;
	bh=RDZn9nceSKHWHAEJxopugD/XqHyZGSXq4lGQoM/TFAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G7oJAKohbyeThzeL15wX0+F+7G/WiB0ZkuzkbRTmBg0jN4Ym83LblG3GvGcCnQCF4WZHhva3kkfD4vmjWeYcAby4yqth454LT4Mb/6Yr0F/hCq0eNOG2ZqNS3RxkwBSI0zjfLgV1TUStOnUXLW8n7Svsv5PO4uP3NsX2HLLGSj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qo4TpDYt; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qo4TpDYt"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3d9dd7e5f6eso1261834b6e.2
        for <linux-sound@vger.kernel.org>; Fri, 19 Jul 2024 16:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721433231; x=1722038031; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldzFiam0mujMuq28ca76nisFGKp3WDY0EGEFzIWMbRk=;
        b=Qo4TpDYtQTyxkrWD/tUAJOOSD2PB9SsoODeWPGlDrPseEVxF3Y2EZV/kzdRSqtVVQL
         ByfZgAQG3bMfJjpmAmgCLM8NlLGOpIL3ndErJdWunWOkYjQZXi8sxEbprKxHmaOtMMdR
         lWimbmIb0/cGMPeFXxodRT6WlS8GnDtcfn713pchHIBg2AifrqvR39PIb0F6GOozy0Rc
         yxn7O1y5Po3h7T/+pg2zphJTUwyDsTqBaiJ53thcM2r3wE0JhQwXoxx9fRtIXDZ+JEr9
         xWEE8PC93F81SxruE9aCFy3PWOC79MuXh+qMV1IY2cIZCd31O4qTG2KwwOe1iDVQNwkQ
         F5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721433231; x=1722038031;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldzFiam0mujMuq28ca76nisFGKp3WDY0EGEFzIWMbRk=;
        b=tXL7jmWUVcckjF+NLEAfyY3z1lu/NmSNGaDswFpbZstSj2udqFxD8CJdCiQuJ9cVTG
         IxHN1qeuCbK52AKUGOYqF6LigbRfkjpvsyDYpfKpH6Qc4QTB0o5isLxrW6MmW3hsre7J
         bSQMU0ll/4fdAQoeHebh8Hz65TtIsOiqnpI+E9qNmPPmxFDR8g89Q1iR3RATTEXM3U/+
         V0YDJ+lpk1THXTw1vT+9bFXdtPYd1vSuo/rfLqEjdBMMaJ2pgh8IHUxrFdBInJBjKJhC
         8ZXFjTPKOkq4OZOW7g+7CGSSfy3cw8rNTyY69HW9uUQru4xykxBS+kLYzz2M6kIAtjMd
         cEEw==
X-Forwarded-Encrypted: i=1; AJvYcCW+SG8tfcV0hpWoJMBTPXJEkq+uCXAH6NrLKkelRN/nqMi6oEA+KVo2xwQGZg6bKOJvyVzYUuEj7g6Yz1DFWzurLEwPF6tSeKw/q8M=
X-Gm-Message-State: AOJu0YxnSOZ9/u5cnvkBsxQLHGxxDn8KbNiGLp+j8218WWhgcBfDshoX
	NR28Cz8w9Rczz5uYlGo4R0FldxgT9RQ6p4EBUoznIWrnWLldkyU7PRxdfKvKGY0=
X-Google-Smtp-Source: AGHT+IHqte/qz54f4SL0d75xLOAyVvOPIAw+LbKlNbbM1Lp827319iwrSa6rBuKjQZrpHBI/U5i0og==
X-Received: by 2002:a05:6808:159b:b0:3d6:40fe:d537 with SMTP id 5614622812f47-3dae97c592emr95855b6e.13.1721433231314;
        Fri, 19 Jul 2024 16:53:51 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:739a:b665:7f57:d340])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3dae09ce8d7sm487021b6e.46.2024.07.19.16.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 16:53:50 -0700 (PDT)
Date: Fri, 19 Jul 2024 18:53:48 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoc: TAS2781: Fix tasdev_load_calibrated_data()
Message-ID: <18a29b68-cc85-4139-b7c7-2514e8409a42@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This function has a reversed if statement so it's either a no-op or it
leads to a NULL dereference.

Fixes: b195acf5266d ("ASoC: tas2781: Fix wrong loading calibrated data sequence")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/tas2781-fmwlib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 63626b982d04..8f9a3ae7153e 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2162,7 +2162,7 @@ static void tasdev_load_calibrated_data(struct tasdevice_priv *priv, int i)
 		return;
 
 	cal = cal_fmw->calibrations;
-	if (cal)
+	if (!cal)
 		return;
 
 	load_calib_data(priv, &cal->dev_data);
-- 
2.43.0

