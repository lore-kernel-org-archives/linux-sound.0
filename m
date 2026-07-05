Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD3D2D8399
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 03:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222743; cv=none; b=FlDC6zFdY+6u4zBR5F3VrnsTAd/DpkMQ3XFbZYSeQJgtVqMjPU+CAjCIJyNWG69XoX2nkdooPSXOt7ZkgxxvDu+4UWjy0jYyz65QTzuRJPCiAO0rXsgs16h0ccmZ4hjRimT6axd3BUsozbDjSrH6wnHP9HSTWVAv5X6h5jfgwDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222743; c=relaxed/simple;
	bh=5F6Wpn2wEPSmmQLDtQuHy5iGCnuqtiFIo0tJtr1nPuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Px81gY6bRIio5gzOmgFePZb6fWuR02stqZV5WlfXkiX/z4muAUu9h3JXaMc1HYcb29LdFz4vi8i9E0KT88kzlwE9QNCcUJ7fLmgXXJMo9g/G0fwLU2jdS0nRT0hr+m/DmQkJ55Xtfvc2oFdfUVpI5byphZDvz5pmMpYuZKNI4gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4Z0T+EK; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4Z0T+EK"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso1086169a12.0
        for <linux-sound@vger.kernel.org>; Sat, 04 Jul 2026 20:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783222741; x=1783827541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmMcSTCtgId6XKkksH0TURh3OjzppyxEGWxNMVEqaKU=;
        b=A4Z0T+EKjWFPYRrZ+j0tSZC3wQSl6LJhHK8gEP2ZnpsRp7yxtc1EmIBDQ/1/Bc0bNd
         h5P8HeAjt539Lj3jsNh0vpKVZ7UFMIQ+7BNmTj3xOFwThOPJiU9NitifZHo2+RbNE2KP
         Q6j4BLHMCqn5UYcRynwiGw0JaZqXtRY/dW1Ihh8F9sYpzsoJiXgTN4xbVYDHMKsJo/UN
         BfeUImZKsqZTK/jXdoiH2CeKBsKMteAMTq+GlrmcCUKs/e1S4Nal4CVFz8YVjpgimGTQ
         XrryBo/jzth6OjEeJZllRuWkRA3cBz4Bvlg94qzXQ96nBiLaxNc1v8QVfUtSLiIzlxpf
         QXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783222741; x=1783827541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BmMcSTCtgId6XKkksH0TURh3OjzppyxEGWxNMVEqaKU=;
        b=nZ6JLTM44l5BJEFqOF79Wda8/vICRzectAT4pTBw1U9VKzkYnO+1dsAaXBm2LQjO7R
         p8kA3k8qOTzruT0oPMYAhKUGuqyZ8GyHFQLvEl/gfsMODbVM6Vf1EMt0FxonKgQ2ph1D
         k+80EsC8BXDM1+M+vjF9IBEyiYhPGVIThKaYqTCg3oyMKXT8ywPKvqOIwZgt4Fd1TJ1f
         dyGaIWFYjeUlgB1x2OZIgteRSavvOLswBg3R4lzQXXqibW+PhusfevknnXUBYQ2ojl6K
         pwE7KdQSSsGCXeZX+VHxefnw2sAv68w40okS5nPI/GDUrNrdjlVmhTHqYvDflUpg/jgX
         cHNw==
X-Forwarded-Encrypted: i=1; AFNElJ+658kze0Ol3F9oeUahPkzZavD5ub0Koozi0GoJOOVIBIDZk0RxW0QIbLA6MN9xc8LHkYhOuP2h+gI5xA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTOKu/1DVlC4UITK9ASj5cfnSMC2C2E/anfsNpeJCC8YYF3ELF
	7WIgMD1YvEqd4LrEPYbYIH2QmAge2+lVY/TxbRnhwkgHQYsgujVKd1iY
X-Gm-Gg: AfdE7clABOvvVI2noB+uU3dSNZzJCtIEqJD/nE38mkbZldbBoxQszQxFB90GWEc07iy
	fKtqyDJJHJi5ja7diF0CbSjgXN+JUx6TN+XcewplyuXrqg6NBu9XyxsOhSBy8TWXL9HBysUdTVR
	VonE9yYvxhK0VynhhxW3CPS4RfJsm9p3nOQONozvdRE5kntUXj6RDPpryPFHxRwfftPkF8t6TXF
	S4BwesSDCwSoFJfwj2geujm8oWsb5Vjh6HsBX8RqGXdoK5/5KZr92dd8QhMDkObIX7Bku31Mfd8
	EefU+XG99d4b/JSKZLeD/4o3MvSoi/WflWzpqnUNvPU5v7Uwu5JJRUGc7B15SgEFUF2Vul3g9H2
	4JtH3g+PLW4w4a2D7eBuFBagxamYtpAKA9HZWD0eEQOE9qdqsndHH0AawYboz1XekGE016r4OCL
	8BUF6T4zomWW4mAHVbeF/cxBtjmkka/6izdlFWGrIe9c85lEtmBH0qVVwg1YjJOkLubBrz97fIg
	kCh7ZSWMLQ+aM7/mpE9H5W3n7OduHtrPX480MuZYX4LWwiT+cBTh1W7+kW1r4UfwR8B//RuGMM=
X-Received: by 2002:a05:6a21:3a85:b0:3b4:7459:85a0 with SMTP id adf61e73a8af0-3c01caacc85mr10346447637.18.1783222741265;
        Sat, 04 Jul 2026 20:39:01 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm35463845c88.14.2026.07.04.20.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:39:01 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 05 Jul 2026 13:37:56 +1000
Subject: [PATCH v3 7/7] ASoC: apple: mca: Add delay after configuring clock
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-apple-audio-redux-v3-7-ff7a7afe2b6b@gmail.com>
References: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
In-Reply-To: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1040;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=YuGvJxGd7rMKWAmYwBfPtKfCWVffFa0TGyJifMJaBa0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmeF7cmsAi+1Be+4rOvcFP8HNFbIS/PrGHW+d5/13634
 qn57w7Wd0xkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZar4ORYSebRTdrhZFLRvykXzYH//otf7lwwf0Mv4NXD9gsSPorE8zwVz5X9/J
 dMwb/1/2mlfZ+O/1Pv7S+9vP7t9I3lSc7878lcAIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Right after the early FE setup, ADMAC gets told to start the DMA. This
can end up in a weird "slip" state with the channels transposed. Waiting
a bit fixes this; presumably this allows the clock to stabilize.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 322dd8771111..afb3754a8883 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -225,6 +225,12 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 			   FIELD_PREP(SERDES_CONF_SYNC_SEL, 0));
 		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,
 			   FIELD_PREP(SERDES_CONF_SYNC_SEL, cl->no + 1));
+		/*
+		 * ADMAC gets started right after this. This delay seems
+		 * to be needed for that to be reliable, e.g. ensure the
+		 * clock is stable?
+		 */
+		udelay(100);
 		break;
 	default:
 		break;

-- 
2.55.0

