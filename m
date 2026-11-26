Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687678;
	b=d9bkRZoVhONDmGM+fLaX2/ylpwkqpHyKTLhjrhkzIRpN1wrOAPp6+z3bckxWtkyKz9AR
	 neoLLZisDxmFrmktDwcXmLl8iALPzX+smF0ip4ziIz4smTFqCx2J/Eb4QrAA8rSuWNtaf
	 a+B5J2zcZ54Cw7BbdjpEU31NhZagobt3KEFdAHci9Y1efcSMeHdim4pLr7Si9Bm9NfD+R
	 qDGmiSWxk4eS6MAXYuG+nynhGOqMBIKP7qyuwwOj+6kuY8szqiU/5R1ffs2EkkqVwnbJN
	 guytfsEDaRhx+Uoee8lfx/74u2gXdWsSDPeADcb+/OevrtZW+fB2WycSsN3f+qIb47w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ArMJaHbGKbGUeWN7hQdiXN3NlwJTftX/zR/PjftffQQ=;
	b=3uzJWxC9BsKCs5BeFt7beZbGxIliOZyGXaSEgxanXfCXdXSyhHsozNracCSqCl+OYTKb
	 iG8gG9qpcKZwVXgVLXpXUBRZkFOwmxuZJLly3gzcU/Ojq700Dq5u8Yt1CPQHyCvpntu9g
	 I3mZQQPZppWg4oOuX1rR10SGqvJrdbSnM9ceH+H52tRuILMD2jqvOtw2CqgByS4okSHji
	 jdygHWccD5NevL0XzbkwYKAHNX+2kPeetpb2CGxtdUr/VrAgW0thRGhM2YMtI+gG/r7PV
	 d20ibPm8e9pPWO0XcbHWfqqXBhGiXogB+3TKg1Fh/7kuoK4P/b87tilaDaXLe7osCFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w46mzF5J;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9872D606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9872D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w46mzF5J
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so4769104a12.0
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 02:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795687677; x=1796292477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ArMJaHbGKbGUeWN7hQdiXN3NlwJTftX/zR/PjftffQQ=;
        b=w46mzF5J+Zb3vlWvyPSfXQBrGfJNedr2fndhCnZ5+RIxtlJODp1cYYmGnYRtQ/6NKN
         n6PTJJcC7yI6+wa/NUD8DqgA0c1qGLfqsZ9aHyMlEcTBv8qCQWJIpWxrzBo7bm3JUYOt
         KfJW7S3RbgJW65qqhzlvAwEVLMcDLUen/90e7csP4Q2yfLV+M+BxwvC5BYUWFCr70VZ1
         2qIRW7ZnW5IiQqwhhtcFVFFB00vB2ch8yp9X/7TfEoLgzhS+Uc57T87BAdc/tHE88R1O
         koApybaHMm4CEEVl23oaFCkp8wS++kfkkgj0QtucMMuK38ixWPGLDMYj7FQAjYzFSQ0h
         gSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687677; x=1796292477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArMJaHbGKbGUeWN7hQdiXN3NlwJTftX/zR/PjftffQQ=;
        b=GZyOABN6Rl9yuClELfdQ2ndHCIWBqgj2ZXBKF7ZPQMjUq0qob05no/dLZFV4lyEd3A
         kIls8PqIaNG8cQ8nAEAVFMaIMc4yfTX0tqzXCFnZdI3Qvszb13UY65Tv3q1ganKPtifR
         4JbU6MSVwUWoJ0bn2LyMbcvRbH2ubTs2jez9rd0JZDFfECMADLUGCVTMM7Z2eqdMZgwn
         aZq+WqeWqT8Td8tV8EI4w2i9XrpWbYCAVhphdGY+CmdfLS4RR+mV9wyHgh01XWn3BlS2
         zLOsTCYkx+LJVDY673xkC9pqIzwsZ5E1MiqewxCIBp4lp2OktcDBiIlz/Zoz8I56WvqC
         edDg==
X-Forwarded-Encrypted: i=1; AL+hErFCz18MruDiqUTGX89IzjpOCkRMRO6prPVqlJRN6C1GhwvKFgjzKrlI31wtI8uHvl2rULVHtgngXpjDQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+14ChI4bPj8Lc8KV2gLX4oCj1NFu6ZLMsKQnUcCPulJ1n2JRR8
	JT3IcQ3EX9cWP/MCUkxx9QGNk46sy1Z7QUqnIuo4Fb4xZRPUpSlQXvVKxgoSDA==
X-Gm-Gg: AZFdTZe925e6p9qFGzEyjJd4cTHmvgRPcem3GvQo5tZ588Ffqe7Xp2wf0MBciKztTeP
	vuMma1NC7oSeSLH5ISJkb59MbOkiiCutaxLoCdaga7Jh0hLqxiethKynXqrKYFu112Ixn+Q9jwE
	k0zJeGxSI3TKGSLZZht/N2ADp39B1eWBYIvl67H9iniRQmAExzGYakjV8phrMtIi6VHiFEKflzL
	9FM9V60tc4e7AWj3W2dnsOOJJm0ia2VYs2WHn+bBKcaSiSIWc2Jb5OFD3WU/Ctor6mw7A5IKoGQ
	YuCFAgltlcW+4jnxLPiZU/lzuf69PTBGR4alfhBFyr/xosRmLfki3Wym4JbflxCsTLU/K/mW8Aa
	R1LODbA6OE4MOskoVeberFsSPLEaudRvzFR1WK89qyR3phR+jTxrMEn13RbLnSkI6ViGGC8tkiv
	NWZxInCux2pOEOA41RA3zbZDg+v9Q3eAMPcOK/6tHJcp32ihPEU9ozeK0mQRE6L3AoUfm94v76y
	WYAVLpH5Sw4vCohq0q9n7Jk4GsgAGoFYjIx6GQ3keGvdwz9VBw4V4W6jDG7b5YiXYZZaEW4rIqI
	wLLcg38aWr9MPsFIU9AU2WhkoyvO7rP6bNZ2/kqXLWA4/TrtC+Wlu/K33n0/xMRLJPwyTd75kFu
	48OsJITPt+NIsVmXlwMf2tdERj/1JHnRpry2rKbCQ1auY
X-Received: by 2002:a17:90b:5109:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3b41c953f98mr21178436a91.49.1795687676930;
        Thu, 26 Nov 2026 02:07:56 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm15034992a91.3.2026.11.26.02.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:07:56 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: stm: stm32_adfsdm: Use devm helpers and drop remove callback
Date: Thu, 26 Nov 2026 17:07:30 +0700
Message-ID: <20261126100730.10594-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The components are registered with devm helpers, but the remove
callback unregisters them explicitly. Use devm_pm_runtime_enable()
and drop the remove callback.

Also get the IIO channels first and register the PCM component
before the DAI component.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Note: Compile-tested only.

 sound/soc/stm/stm32_adfsdm.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 083dc4c26274..cd54fd071b2b 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -336,12 +336,6 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, priv);
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &stm32_adfsdm_dai_component,
-					      &priv->dai_drv, 1);
-	if (ret < 0)
-		return ret;
-
 	/* Associate iio channel */
 	priv->iio_ch  = devm_iio_channel_get_all(&pdev->dev);
 	if (IS_ERR(priv->iio_ch))
@@ -357,19 +351,17 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = snd_soc_register_component(&pdev->dev, &stm32_adfsdm_soc_platform, NULL, 0);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &stm32_adfsdm_soc_platform, NULL, 0);
 	if (ret < 0)
 		return ret;
 
-	pm_runtime_enable(&pdev->dev);
-
-	return ret;
-}
-
-static void stm32_adfsdm_remove(struct platform_device *pdev)
-{
-	snd_soc_unregister_component(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
+	return devm_snd_soc_register_component(&pdev->dev,
+					       &stm32_adfsdm_dai_component,
+					       &priv->dai_drv, 1);
 }
 
 static struct platform_driver stm32_adfsdm_driver = {
@@ -378,7 +370,6 @@ static struct platform_driver stm32_adfsdm_driver = {
 		   .of_match_table = stm32_adfsdm_of_match,
 		   },
 	.probe = stm32_adfsdm_probe,
-	.remove = stm32_adfsdm_remove,
 };
 
 module_platform_driver(stm32_adfsdm_driver);
-- 
2.43.0

