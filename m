Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297558;
	b=u1hrjSpjKEPWxwpxXpOeoezcG98IT9Wc8129CdyTRiOLMZDQNviN4FGFM7g4Q2iW9I/T
	 iHaX3qNtl5R/xmdcdA+MTpWNiSmdLz7tYS8a2PGWqARktD59MG51is1B/odQTZb60ENeK
	 4Sjyvp8XhYtxpEP3o1s5PPJBByiIoybMi+jzFXjPTXM7xOmuVzZzYwRtQqoGZJe3pMMCd
	 GFWmo/aqb89o0hQIHXlDeZ0j398yd3X8vYFr8+4bzb6CAI6quQy6hSYsR3VH9Sp/dZFCI
	 2aGnxhZQJ3ooPTWGx7nbRDmuxtfSj5yOiUEoUShHoZ684weR4IURuNV5vR8ZlEC9Hzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y6PKiZVhgPoQCx9LcIllCoQr4zQzHDju681FGCOxyQE=;
	b=hDPhuv+ZLQZYMX027P5pCip3J+6dvI6MPGbvsl359NuAYg4bQs5KIutT27O3XK3VJ+Sk
	 RsqdCvJcqFsFndzKD48J2c0LlUJnEoMO7CnWxWF3DQXJYUzOCrXhqEJzr58KY+yoP8krU
	 iJFiLjWOmf4GTwgjGXsFhlhOicuEo9qi/sv9rvV4SzsuktTaIq/y2DPJW62Asr3wEMrZa
	 21q8QLQwSM5v7Z2MM6IixrLZl33OfStwDDSCs0M7M4SMn8AXBA8mBvbnfhWgqWLHjkJEO
	 gvMqK1RDdFH65AAfYRn+TA0qrm3qkl1uOlXthuHx1WyEDjuP7WG7w1zMOgnTAbcTpOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOGLjoi2;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7402606A334
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 07:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7402606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOGLjoi2
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so2486830eec.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 23:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297557; x=1794902357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y6PKiZVhgPoQCx9LcIllCoQr4zQzHDju681FGCOxyQE=;
        b=gOGLjoi264Qwt/Fd1OOS4F7omoeqGzN5a8utT68YdUrK+b3Mj31b1nGnXmLgF4h1Kh
         LSuZ4mbvQNssPs9S+FJQcvMnCMZUhFrcmqP23rJ55hwtDxcJ/NEnaJhLhmLFoq8boNnD
         sZjiTfRjzoZhfhd5/Ln7hnkGn84Vsy/E4YnG8j7m0OL8oI8m2IN0uMaR+ZTf7f9IF7AR
         KyI4cqtfVPG0uRKuPRG3lTxR81RZy/mNH8LzOefJFm+IQ8CfSeRj5IDrrDT9dlMT3XRL
         HiNSgEN2zv5tQ+vYG5+hSrowe5IcZw50KHmlPlVFsiCOk7NLwV5IQdZ+Htnbcul1D2qq
         fPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297557; x=1794902357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y6PKiZVhgPoQCx9LcIllCoQr4zQzHDju681FGCOxyQE=;
        b=xDEaAEKZbDS86Xja25B+P6Q18497CE2I0J/N8/mlUExaYhdsSvbGWnFMUHKuRSVoYn
         dTs6ugczgvuKKSl8upxC90w1VqLaL+vKmAksIYLRT7K7QMPo7UsYb5+62ER3wGLHFIgn
         ZS/jjFTz+a51kvKDhw6fv2H/ZkmLV/SY6nDhM5nYls871nmsdTSkRkfDJji0dNAmawOO
         y7wJ1+d05kvUk2w4AN9siUis4m035tt6wOyInFxYePYZ0O3nnMP65AzfgjYMBphqKvkM
         7wXvpveex5gCocvCEEjjy66zoACENMrbviHwH5/pnYMqfuIyNI8pPwziC37se0g4Wrpf
         vSSA==
X-Forwarded-Encrypted: i=1; AL+hErHBicJIncvkCa1efazasx7g9uB6b/5k00qdMAfbUpPoZ4pDfaBjmt2fuiD2/ABw++laRsOC8AhSxy8NjQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9QcN6GMJ+jH+YrQ/Y92sBn1jSszi/fU7P65lAK45UE2hpStETQ
	DrXoCuRwsjrAsGwW2wcIb6Pxm7msUEl9PJbnImEbxekVOBksEbTlJfUwYG2OVw==
X-Gm-Gg: AYBFou2i/xvi6GUUsK2q8UeiL/f7RSAydxTErd9wJAcfuIJi06OoSGIKn7trTvYqD8v
	L/yoK+yZArOohLuiLOWrCLskb80d/Q///J3MW8GHfHh5f3IsBzr7pT3Azut/CgH8HYvVwTBQyjT
	HH3AgfqMbZWAsDJEa2uZ5a4nXi98qQpCEUs4E4gaBsm91aKWpLEuJbykVKMpf2IJo7KtGzQSjfM
	R0bxQTB0D50ROWimAeSUgcxOQE7rrvhE9yzTLuUtyX3wz1gyrTirGqu3wMbmM70WHkzbLahvwM5
	2h1LBqoXFodQOWs36aUtjMWrLZ5KZ/txKTc2TKkHlNNGEzrFF4XW8/wuJvu2aIIQORX/BJocnjR
	0cQutJFZT1r5gn45xcdQCHYMhG7S7o64uHw0rmdx38VqSpnYxuaxda5BdYcwFe1yMhf3Se+dpqj
	hahdvkrhoK5UGP8027HZvgB0BEH4MJWaaau8ugRIthR1XT26Zh3MD9+slO1z1G0b/kS6kYisE3+
	WrNWo2YdDWrUfmrka3oalEEPJSngPmBZDUoPkQ9CAQN1JUCH1gGKtSMT+bajjuNgxekG/rQsJyc
	YnIMSCVsJm0rJgJDU8GgjFLJfQVNM/ctvPI4pArQF6i+0V5JIsMLuNXcDYbGl9G7WDI3OMfapM7
	i7DSl2Sl57lttST3W7VTs4jwdx/ArDtkOvH78YYxWjQcW
X-Received: by 2002:a05:7300:80cb:b0:36a:1d6a:596b with SMTP id 5a478bee46e88-3751f56137emr3803806eec.29.1794297556929;
        Mon, 09 Nov 2026 23:59:16 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm4498321eec.3.2026.11.09.23.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:59:16 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: fsl_sai: Make fsl_sai_reset_hw() return void
Date: Tue, 10 Nov 2026 14:58:40 +0700
Message-ID: <20261110075841.12104-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110075841.12104-1-phucduc.bui@gmail.com>
References: <20261110075841.12104-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

fsl_sai_reset_hw() has a single caller, which does not need to
handle its return value. The function already reports register
write failures through dev_err().

Change the return type to void and continue clearing RCSR even
if clearing TCSR fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 430e896d064e..59c9b8c28133 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1410,7 +1410,7 @@ static int fsl_sai_check_version(struct device *dev)
 	return 0;
 }
 
-static int fsl_sai_reset_hw(struct device *dev)
+static void fsl_sai_reset_hw(struct device *dev)
 {
 	struct fsl_sai *sai = dev_get_drvdata(dev);
 	unsigned char ofs = sai->soc_data->reg_offset;
@@ -1421,18 +1421,12 @@ static int fsl_sai_reset_hw(struct device *dev)
 	 * Bootloader may leave SAI running causing interrupt storm.
 	 */
 	ret = regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
-	if (ret) {
+	if (ret)
 		dev_err(dev, "Failed to clear TCSR: %d\n", ret);
-		return ret;
-	}
 
 	ret = regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
-	if (ret) {
+	if (ret)
 		dev_err(dev, "Failed to clear RCSR: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
 }
 
 /*
-- 
2.43.0

