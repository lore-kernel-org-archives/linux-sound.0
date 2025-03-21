Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D311C5D76
	for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 14:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742567732; cv=none; b=BV6/kdq5xkBl9AUyXheYHP6a34wtTmxE36NJPfz06hAiWVa/GNndo1x+jjCKouVHVh1vZEet9Ivcs+483C3PWfs011wndOWTalaw5zIsvbnQ0iVVq+8j1w4LfY4u+yZJ4jiF9XG8qDsfyIr8bW2+x5E84iRi8r/JbXn3Yw8PADs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742567732; c=relaxed/simple;
	bh=Isvn7ydRNc9Mk0jmBqV2imH7i9rYp5Er5f4uLrHFcZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kvmN4aI0KaZQ6DKcenbybscgp3j6QtabfLlGf/jx6+g9hsEgUX2lD5FAEuradEesa+zHha+glB2ruMjJhddo3wsNWY9MMrrS2QiuSvlC1pzIHsGIGVU3WYEMuAm0zJWWb0z2VHW8teBjwLnxPuuzMZiELLcjmXMojofH13/Q5cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FEVOUwqP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FEVOUwqP"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3913d129c1aso1506930f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 07:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567728; x=1743172528; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FpObnI5CWZY4zn2RHNz53FQ4gJRPrxvKsQP+9BpYcsQ=;
        b=FEVOUwqPcx5H5bPXY5GK3e53txtdgZJDHDfqNfZsb6pit+Q6K4VZw4bv0JjnorW+f3
         a6TN9f3SBPDvREJTXvsrLBlwofrdXBu0LiIxKpUB/XQ1POXM8JfanwK1XQGcoisiWAC2
         bkEIBLXL7aReP2iTJZzkSXN370uZC/cMOB0m/W0tzPNTanvJplm38o+8il261qHQTJJJ
         dG5029aDf/xdUFRfDTf7OcSFJH8t4vDkqJYKB5rOyFU/MJE+G1dtHNa0p8Hp0AdEzlaP
         SXT/Qm6oT0SOtfF8AGKnArF4Zwx6Gry2/q9TTh+nUue5eujBHfWEMo5P3bJON3/YMPGR
         BObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567728; x=1743172528;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FpObnI5CWZY4zn2RHNz53FQ4gJRPrxvKsQP+9BpYcsQ=;
        b=pe/t4UKIh0+R+uipd9ZxlgqTS6SVCS1kIkoRguG95vZdM8kIWZ4Wa7ZEsQ/P27iiRR
         wRMVZmCLQhhOT5U0OP+rkcp80ghL26azfAJw77HSAFWaYBE4uRC4lNE2faEtGoecEBLd
         dLIGM4ZrLseF4Ow+zcXdMP4Xjkzty9yjC3udxm6X6WEZ4W5NNjQrZ4UzvB4XY3HADp76
         piyqo1T/w74x4EFy/fHl6xRW1aUNDpfrug4U+VV8MgDkJv61zGcD2fTzAVWK4/fkB42j
         rFYRuUivKBJRIhblLqUDIv78Gr7nIUp0bbOEMGzrcZ6T7N6nGM3aR6sGdG6LloNT2bfL
         RvDA==
X-Forwarded-Encrypted: i=1; AJvYcCVN7Ydm7QGlKY86FT0gWCRmLTM+kqGsjeHbY3rPuqiwxYErdQoF8Wkzv5QKL309frPFKJlLA5pt4M3p8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkk8MOsGWRho2TI16vfU7GVHciulHorlTT8re3NIZD3ZdBAk6U
	zFpbfE+IU3rxq1RAOg8OCO7H0Ka63bTYWkayU1mRqrib6hapxe4hRGjrPgzMXF/WLokr0RhigXY
	r
X-Gm-Gg: ASbGnctntnrgXi9JHEyy2e2ZHDTGihrgoJnATOFq3kQymtJuvC46RX5g33dcxuz1q7b
	nP0j5wGSx5p3hqftlO2t6mXTgsEmQBB/m5+PkrwABLaH+Q6AzeOQxmuA1nRO/LGLnVIYf1YGPR8
	PNk3QGntoGvBCkI/ky2OXx8tvLwPmDUtgTj7CmqfBYQmK4DbMSws2zVfGlnw90KTh0FoBxR90pB
	wj6jRuGhjjOlFuc6iCS97ftEkUiRG5n0niWyC8sgZyKb9ri0N/hQqjWxeOI5XHBWnmw/WbOTEW1
	vNkhYgwO6Le4BlbkZonNVtyaR8a2NTQDxO3OT9oT4r7t259AIwWcqm7sDwho
X-Google-Smtp-Source: AGHT+IGFDNIHBWCzsRoL4N2P5NIU7s1oc9Lf7MrF47BI5GNVMNU0v7aRuRhv89k5EDIHXs8yNuMIBg==
X-Received: by 2002:a05:6000:1548:b0:390:e9e0:5cc6 with SMTP id ffacd0b85a97d-39979556803mr7439315f8f.1.1742567727661;
        Fri, 21 Mar 2025 07:35:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d3ae040f9sm83159355e9.0.2025.03.21.07.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:35:27 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:35:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: Kiseok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] ASoC: sma1307: Fix error handling in
 sma1307_setting_loaded()
Message-ID: <8d32dd96-1404-4373-9b6c-c612a9c18c4c@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There are a couple bugs in this code:

1) The cleanup code calls kfree(sma1307->set.header) and
   kfree(sma1307->set.def) but those functions were allocated using
   devm_kzalloc().  It results in a double free.  Delete all these
   kfree() calls.

2) A missing call to kfree(data) if the checksum was wrong on this error
   path:
	if ((sma1307->set.checksum >> 8) != SMA1307_SETTING_CHECKSUM) {
   Since the "data" pointer is supposed to be freed on every return, I
   changed that to use the __free(kfree) cleanup attribute.

Fixes: 0ec6bd16705f ("ASoC: sma1307: Add NULL check in sma1307_setting_loaded()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/sma1307.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index f5c303d4bb62..498189ab691c 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -1705,7 +1705,7 @@ static void sma1307_check_fault_worker(struct work_struct *work)
 static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *file)
 {
 	const struct firmware *fw;
-	int *data, size, offset, num_mode;
+	int size, offset, num_mode;
 	int ret;
 
 	ret = request_firmware(&fw, file, sma1307->dev);
@@ -1722,7 +1722,7 @@ static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *fil
 		return;
 	}
 
-	data = kzalloc(fw->size, GFP_KERNEL);
+	int *data __free(kfree) = kzalloc(fw->size, GFP_KERNEL);
 	if (!data) {
 		release_firmware(fw);
 		sma1307->set.status = false;
@@ -1742,7 +1742,6 @@ static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *fil
 					   sma1307->set.header_size,
 					   GFP_KERNEL);
 	if (!sma1307->set.header) {
-		kfree(data);
 		sma1307->set.status = false;
 		return;
 	}
@@ -1763,8 +1762,6 @@ static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *fil
 	    = devm_kzalloc(sma1307->dev,
 			   sma1307->set.def_size * sizeof(int), GFP_KERNEL);
 	if (!sma1307->set.def) {
-		kfree(data);
-		kfree(sma1307->set.header);
 		sma1307->set.status = false;
 		return;
 	}
@@ -1782,9 +1779,6 @@ static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *fil
 				   sma1307->set.mode_size * 2 * sizeof(int),
 				   GFP_KERNEL);
 		if (!sma1307->set.mode_set[i]) {
-			kfree(data);
-			kfree(sma1307->set.header);
-			kfree(sma1307->set.def);
 			for (int j = 0; j < i; j++)
 				kfree(sma1307->set.mode_set[j]);
 			sma1307->set.status = false;
@@ -1799,7 +1793,6 @@ static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *fil
 		}
 	}
 
-	kfree(data);
 	sma1307->set.status = true;
 
 }
-- 
2.47.2

