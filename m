Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364113;
	b=244G6dKto1tZJAtBahTuzBQPb9ChqjQHYj3mDRJ4dcbNOiteINIrf6aD1rL8K4JVOMPS
	 RdE43M0GVamNhhzPHuL12F1KdzqnE79YMo+59SGSoklIwSizdXRiIALdu3W0frrpfzwX4
	 OJme0TveEEy7ALKI4nYrIRKUTeTFWntzqkDiUyqwSahaYijLpm8oTSFA9zJFVI4IB31fK
	 L64KmJXtDjGV7d7vo/6tED9h9QGW6vSPfEgVxYlEqGNgxwsYWl6WKuIXa6D2Vcn8UAS60
	 IOi33MRoRN3a+Qb4op9znaUVD2p7J3RCkbcghkgAXL2ZaaFgxJSbsMo+Q+vz8PdWcAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RjnOMEA3v51kaSR8Z91KF0TI4KPRyGyGQgxSggzifdo=;
	b=1xRg/+2FRSx2UIXfTmb4Mnoh3syExk2GIEyTz/ns9fMvP2ZGh9IQ5HANe4RqtphFfJFQ
	 pnBz4qpL7PKdhgs0pEYT+ULkPsiIpHj+/2u+6bsOsO/4vzlJ5SViylMVfi6FTrL+MtV4F
	 ra4Td+wPa04Lg+J3VOy4ym1inji5S0kd+HKjj/ADVUV6nMO6vLwMpWl62aG6udyypG7pW
	 EiaD6GYwwAHrQm6WT67q5czxwQKmugRZk+05j/fiTLLLKcb/DsVRRVp68hPHcuqpYv8M8
	 6ZQ/kYw5Sc/AxlyPrenYCEXWbdTZU3RG2ETtU7YRZAJ6KIevl49puUpLswDwMcxJhqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezFdZw2R;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AB1606A338
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3AB1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezFdZw2R
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso5515942eec.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 18:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364112; x=1794968912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjnOMEA3v51kaSR8Z91KF0TI4KPRyGyGQgxSggzifdo=;
        b=ezFdZw2RSPAmzmPNeR1F9zIDZXtLt4tHEcVpLczDHaVpCtI8dxw3cmRJMZLFBMJuAE
         GEr8XaFWUGOpA6sXUghJ8GrjJIC2E7A60yyfhO4QVqjk8q5oUTyjAYW28sbMMNClSMLE
         9qnhF4ntkUW4a8Ua8aik3vrqZoh7hniIuzVWryp9V54S2FWJdWJYKe/AbKidQxcqfjFr
         TobAKGczCE2vusYV8ZcE04uW+pPNRncJJr5PAKD1hKheXknJ+3jWSuzRcILhdNy5EsqW
         aUMVvUjCLEFH7bFETYzcwZjQYGcZCk37xZoyFZRKv8zUumGJg8Cw1lqK1b8dSLrk593B
         2oDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364112; x=1794968912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjnOMEA3v51kaSR8Z91KF0TI4KPRyGyGQgxSggzifdo=;
        b=K4jJL1lJnWi//8PN0Kimzlz3ckJU5cORLEdP9B5kTcdqiN2hBKoIognlpIi+g0e670
         JSzTfmkAvVYfo39SQSYaHqZibVg0meVNsDYiVvAQNU/hj7rxv3PjDV2Y5uJZKQ38c3T9
         tcUqDpJ6K7JqGw4tXF54uyxVATs627dmGXTWaCNOcGRypJplktAU+DyImyoj78LJ72Nt
         YREDldRq7G5nxn0A0s+kFvFmUmHBRNeYtIbe991R0ve0UWfaEm0Rxm+Qts6QQBmHR7/0
         416u63Udgk1oUKsRd8LJpTmei5aBkDF2HfgFUEQmdnJs2OSrN4t/WLg0bgc7HhAr9mzB
         XcYQ==
X-Forwarded-Encrypted: i=1; AL+hErFvxM6Jc8c63LQW9/RkOeNux+uGr5Ku0MTW4EeuOgdG8HnnSYE3bhZm5iHI1NcHsjIQnsveeFFDf0MVnw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8dJNWiYAD7osPL08JxknZO2d8d78BI8NWwrY4ZOK5qotVZ/JsY
	opDSfBjHYLHwmQsQDyXj/uk1gZrJNnOeLYsDHmaryZreeU/Ej36P3fdH
X-Gm-Gg: AYBFou2Ln9RDxqGuakKI+cBorbdOlSK0HSgAf23f558HuVHyM5mxJgiNDKW4J+RTEip
	o0noUQMv7UyZZ55wWgLXRuHGF+0VisBy2EsW/zd71uN+TQeSCPyZCiCa2u2+b5MclpJqEl3E0K6
	ppqiZFicZYUgkwGy3n8ejPtS/G8hRXXiu2maDate41NCirAIrguG3lSsykQtpCNz68ABxM6Ebqc
	dSLlI61WSHEA6mQwWfRW3E1aPDuvpvc0G1v2UW0mI/brtBXp5KvRBnOAKXcWMQFyVw/2pYyJenb
	RcRLkcY1/C07TBpa4SEXLdkEW5fNXw5LTsO2oQvxiDTU6YSKzWgzT/GgV24+ZNTomWxPoCC803y
	/9JLYPSVq+eZxpIPjVUur23E4lY1x2PJdMTQEVklRGYt7HNwZrWC8QGNxzDSkJpOGk0O8dxMMo2
	yhUd5c2Nt1pwsuk2KGHwelSXzvpgxXE1sNm7LzS+GqYT8ie1VlNZZ5FrEo9Q33gzTkKrlZ4BE7p
	W9YjzkaagJ33CgRr42YgxMIdLT2a59U7Kmt1BHpTp2fgZaGRdmTEgFnabuuoqeqC5bsOVBX172z
	bzTFJ8PugmxL7VUYzBvVfZqLLoD7y3a9ohoHWxkeD17vSZRW9c22R/vHQqbEbHIEJbgzJmekhsg
	arj3vu64FdhUIsUZ5QzAPO/udqhxu7cb5v80a72B6kEfy
X-Received: by 2002:a05:701b:4301:b0:1a9:cad6:5b58 with SMTP id a92af1059eb24-1b3c0362b3cmr1033702c88.39.1794364111707;
        Tue, 10 Nov 2026 18:28:31 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm10054285c88.14.2026.11.10.18.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:31 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 2/6] ASoC: dwc: Fix error handling in dw_i2s_set_fmt()
Date: Wed, 11 Nov 2026 09:27:27 +0700
Message-ID: <20261111022731.8243-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111022731.8243-1-phucduc.bui@gmail.com>
References: <20261111022731.8243-1-phucduc.bui@gmail.com>
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

Return early when an unsupported clock provider format is
encountered, preventing the function from updating frame_offset
before returning an error.

Fixes: 221acc16aee1 ("ASoC: dwc: Add TDM mode support")
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Move the typo fixes into a separate commit.
 - Add Maxim Kochetkov's Reviewed-by tag.

 sound/soc/dwc/dwc-i2s.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 1f4d06a82333..6a25d2a69ea7 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -390,29 +390,19 @@ static int dw_i2s_trigger(struct snd_pcm_substream *substream,
 static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 {
 	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(cpu_dai);
-	int ret = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_BC_FC:
-		if (dev->capability & DW_I2S_SLAVE)
-			ret = 0;
-		else
-			ret = -EINVAL;
+		if (!(dev->capability & DW_I2S_SLAVE))
+			return -EINVAL;
 		break;
 	case SND_SOC_DAIFMT_BP_FP:
-		if (dev->capability & DW_I2S_MASTER)
-			ret = 0;
-		else
-			ret = -EINVAL;
-		break;
-	case SND_SOC_DAIFMT_BC_FP:
-	case SND_SOC_DAIFMT_BP_FC:
-		ret = -EINVAL;
+		if (!(dev->capability & DW_I2S_MASTER))
+			return -EINVAL;
 		break;
 	default:
 		dev_dbg(dev->dev, "dwc : Invalid clock provider format\n");
-		ret = -EINVAL;
-		break;
+		return -EINVAL;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -431,7 +421,7 @@ static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int dw_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,	unsigned int tx_mask,
-- 
2.43.0

