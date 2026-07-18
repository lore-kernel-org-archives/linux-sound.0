Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77012248BE
	for <linux-sound@vger.kernel.org>; Sat, 18 Jul 2026 04:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784348942; cv=none; b=HiDDbcI5comgZQ36pKnIaTb+MfluaTeLUGjOIvfDDIOm1ASN+/7qBksT8te4cRQEPx4m2yU33saJEeHCRr7hPiu1XoqABzjr0skeIMibjqvTIutgaeBZqByiITCfi+Urab/FTfzEE+zEMJaVTOzXTCAsoni1nwPPrU0sXgW5QaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784348942; c=relaxed/simple;
	bh=iC0jX4ga18TdSbpsM8nHjqWuwCVg1+/WjJu2prwlw/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qWKrg5RwBRiONoPcoEPpA3SY2Ha6QLLv6TnikIG56xgocvcvglWehKaEuvmos1ql/I7hekAwHr8Bvx7IjGetqqZMCcPI7WTzrPeJw7koWJqefz2X0AUlAeOsPhKdkBlMVmy3BOYDSHxQlRSDSB8PUGJY3YaWbMvg+dpUXiK1oBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lysmh4wD; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lysmh4wD"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so6074150a12.1
        for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 21:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784348940; x=1784953740; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3v9gOBt4G5DQaZdSmoAndNb96FLBWZl7i/bOB0duLk=;
        b=Lysmh4wDvLWSb5Ortwo8KXOYsThhvxTpLh6h6G8XbBZxis5IyZ1/gx2e7zZFeuv+n4
         rF70k1Xbg/90HzLCx1pzYVca5fIvKQS1yzYBqldMl6CgqDy4U1+gz86NgMaaWdk4WEG3
         PM774Dr4JEhl9+eE0LhInqTgTDj6ElNCMMEvKpFZBvJCP7hmQO/dmlV3h3K1rVWNe+bS
         ylI2KEkQ2To714TTL8tSPbYbhsW7vyKzC1o3++1kGopRkyxJwtHG/8q1v0uoqQgDkcQI
         SA5RnYgksYsTy52W0RMV3A8GFrQtvif/mYyoVIh0Vmv5Jeq5KlHjQPVGOJVjsUGhrEOq
         /2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784348940; x=1784953740;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3v9gOBt4G5DQaZdSmoAndNb96FLBWZl7i/bOB0duLk=;
        b=pphd5Kr4VvvR44PE9sx9i0wU9xG1OuzdlpcDu/TCIRY0jlCyP2nQxp48yfpocaFdP8
         n0Mq7zlqKcx0rjslJ7+NfZjtpGrlyj+zsnqpsfLWAku7tWiElQUEkWX4V4yq+RoYSSsi
         T5KTGfs9x5bARLAuuKZPFinsT90QGfbHyeIAoitm4oc7Q1OW3pdWghPYIk2VsARqaDhI
         ECkSwpOPCYBtjy0AUhAAnsZMkvZSR9cQY4owdVgYZsmFdknHLrQDsBat4BNLvergEItw
         ekwopivsSoxromhcXzIlQikXUlFm0EG9aBD2CmknxJ20K9RM0Hl5DsE5gELGtWpN5soT
         099g==
X-Forwarded-Encrypted: i=1; AHgh+Ro9DfIOVpQprb7PnXe6KsAfQ3/7A38QQEeNz3CBSW5EABCIb31qeoUtLiR6zjNq5PdIL40O9+vW5BxgNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuCGGzzCdW1LE0DRatrs6iCmMyxtHzm1zWYtt06q48pPtgEftY
	5+FtU+EVfnfNjenClDtQGti7khw21dBYxkvHrPo1ZbgcjJ2ADINtAQqW
X-Gm-Gg: AfdE7clIA3Xpqgt6dIRQ1QLfZlEm9cAvNlPp/I0T5CWNRzBAYV9D/Ap/95vjpjfUQos
	vTIGHFeesRviTKRvWTubh0qtBYspyoSqatx1b+a9ObRMijwXG8RjUb71bOGSwX4uG4ipdJLsGim
	s1557NTX9hE6cnMWu114QPt4o0kyhDf+9o/VZYgMGrjsISTzA2ENvGQr6gSH8+FMP6mRrQcK/nW
	EJbgLXYO15ZeN33DCiueiRDNqf75SYMeFCiu8L5GL45eaiPZqn0/zIZRUJ5CiprvoOv6bkKZ9eD
	i4K271TG+TlhSqgnWekppJwut6mnTQHBT31RYreZthsoYR5m1JGkAg8Q5Ov6rC+GSIoWWbGQMgJ
	jAiNHiRx70pT8KfeLrxu951XjMOQeAijpwuQfZeg34hCn8CKbAZ1RLnYdYBr9CNkmLuVsMkK0hl
	NXbSBUeOsAm5ctp4slNEZ1iA04ieNaEOj1l48jfDZYGJU=
X-Received: by 2002:a05:6a21:3983:b0:3c3:68b0:e273 with SMTP id adf61e73a8af0-3c3ad6042c6mr6085187637.15.1784348940199;
        Fri, 17 Jul 2026 21:29:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7638:3cbc:f1c5:2eeb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bcd9sm13036597eec.3.2026.07.17.21.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 21:28:58 -0700 (PDT)
Date: Fri, 17 Jul 2026 21:28:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: wcd9335: switch to using sleeping variants of gpiod API
Message-ID: <alsAsTcQrpnnR46d@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The driver does not use gpiod API calls in an atomic context. Switch
to gpiod_set_value_cansleep() calls to allow using the driver with GPIO
controllers that might need process context to operate.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/wcd9335.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index e3ca5ca6de3d..40de279a9750 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -5010,9 +5010,9 @@ static int wcd9335_power_on_reset(struct wcd9335_codec *wcd)
 	 */
 	usleep_range(600, 650);
 
-	gpiod_set_value(wcd->reset_gpio, 1);
+	gpiod_set_value_cansleep(wcd->reset_gpio, 1);
 	msleep(20);
-	gpiod_set_value(wcd->reset_gpio, 0);
+	gpiod_set_value_cansleep(wcd->reset_gpio, 0);
 	msleep(20);
 
 	return 0;
-- 
2.55.0.229.g6434b31f56-goog


-- 
Dmitry
