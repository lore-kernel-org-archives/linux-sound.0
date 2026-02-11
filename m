Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788331EEA54
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 00:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770769399; cv=none; b=pIw4OrBfopKYB8ZlDPWk+KRcFvaTDuojVmYuAuga0F3wAedSvN85j+HOUBn+2sYR/Ndxp5XLdb1USlhULMbhUwESgxUt5QUb49sGjU3oLbAGLb/FsRu2PbdjKP22wYi8w1DZGjwImqumsGq8OQmHjT2tQ/I4CvWoB3LNn0hH9DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770769399; c=relaxed/simple;
	bh=/PiGGYi3VoWN0wm/kSUrbuix26vAEKDWUgw5qB4VA0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/lIgz1fft5ONnZkSqE+MzzWYa/BA/+HlkYShLnLys1MC2nrHB/SdFrTbxDOijpJtSPpMLFF2GMzzJGiXlCZjdHWNStiquC4JfWH8/DtPum906+mJiYrNwJEh+Ni154Ypj++2mneHNyi7ljitLT+qcXaMMt+teILy1Fh5qLDtxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaHaUR4C; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaHaUR4C"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8715a4d9fdso552816366b.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 16:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770769397; x=1771374197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Grw65Z1Dxw5fR0Dpyjr5n2PUmcOAcQ7D93lwHXHPooU=;
        b=aaHaUR4ClO/qTysYt8uu/SPICpd+9DapdQK8ywM5Ju3qJVUtHU29psxeNBqicPKEhW
         66fDkT2TqiOM6Yi9k6iZlKhr/IXKtLXbf+ZA0eI5tYPgwfpAeb/3Ij2f+MkBD2a2tBGI
         608UsFZdflrZ4r2I0/KH9ZVdP4pDDTMBfUWT6GJJvbC7L1LtvqE32QiwdwuVtUSolWHJ
         CzWNFxHcRRGXXRT2vkBSuzGDB3YY+Uz93fmHp+WNMQMKylkTHvJNd3Fh3DuZkQOaBGx5
         18JzJT+10mEJnYsRRNy+8mK5VOd62jIC+8psVN5bQ55+x4SIhqmbxqF5QSxYpAFkxzmz
         qW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770769397; x=1771374197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Grw65Z1Dxw5fR0Dpyjr5n2PUmcOAcQ7D93lwHXHPooU=;
        b=gz4Jyq/6o5tOBUDiOfQuPcBtRPyQKbT3uQKtmQiaMSRZYAJJ5QuGTWn09q/nGkh4R+
         qxpf7xTzMeCiZezDR7d5eX5Iw7e7T7bN4oMw/DbUkQS6X9Lg3tYHZQJ5+hxtcOfDstq5
         ArWkvW2tIcukraBJemh9rqOASofU93sYZGrwSAosK7TBbzXvB09hSssCIGjHt5PAZJBI
         DjBwv0K+VgVIb/O1ScDVt5QRC4/IoyfS+TMsKMdzMvSSTdmWH8/w+KbCSjn0I28GkQRY
         90KxRobxXOCMAIDZl5KgS55kmcaqIqfQ5mv4n44g0if3F58931K92V9iKsCK86fgZvXY
         49Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWFjOVoZc3/pETClWsheo8tPIDJz/bF+MwtSguY+DuyIiAPSlWNXGnJBS9gpkLf9LoGc7zcjbkufsfVXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQuX1CAwKJi7PvcES5zVJRKwTPG87L8i3G0bV0UzlylQvhNkuE
	o5H8wWcEnZodA7hUGURiPCn1WhnQEfNQNEUb3KeRxTqFlK5Bh6BIDXp9
X-Gm-Gg: AZuq6aJ0Po6pJfErQ0D+o/NscRTyRAVNK5h/cHYAQW9/HZ4jgx1DZSi1Aa3+gRoqpjW
	B68L1o6JwzRTovD1R6HxhVP8i6NS8PJm6dukfDT1+OpZX/yo8oMSXSzcR1INQkmO/uzPKIzCs0p
	Pq2fotha+xlQK1NCj8FgCrcWKLYllvZJlwFGnAtX9OlADqqXvqLr276JGHL+R1tbgRgcwbj2yh6
	kfcPPRxO+Hzi13UviihW4rmUvq32CWPyRvEaNUflH7jrGMFvR8ErTBCgrNLZsbk3IU8eU0pkKFo
	p5Fl6uCW57GS09cVYFZxjnL7JMwdfJ8iLVupjS8ZdWFnP+YTn4SkNXFEV6I8da2LNH6SHLNrkYV
	MmCYMt66MawyCRkjIlZFKyIXkaDRWIQO5Jl0R5c/mjYjL+G9uYUyZBf72Vfa5l5dlsm1GQEgldI
	9b9T36+yUKWP5c/A==
X-Received: by 2002:a17:907:9343:b0:b8f:ad6:db92 with SMTP id a640c23a62f3a-b8f6a92cf4amr48742166b.3.1770769396766;
        Tue, 10 Feb 2026 16:23:16 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec1db0bsm9992866b.46.2026.02.10.16.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 16:23:16 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH 4/7] ASoC: rt5677: Report error if the ID register cannot be read
Date: Wed, 11 Feb 2026 02:18:36 +0200
Message-ID: <20260211002255.4090440-5-jekhor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260211002255.4090440-1-jekhor@gmail.com>
References: <20260211002255.4090440-1-jekhor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To make error messages clearer, report if the ID register failed to be
read via I2C during probing.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 sound/soc/codecs/rt5677.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 6628c7ca5a8a..845385c1fb88 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5602,7 +5602,13 @@ static int rt5677_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
-	regmap_read(rt5677->regmap, RT5677_VENDOR_ID2, &val);
+	ret = regmap_read(rt5677->regmap, RT5677_VENDOR_ID2, &val);
+	if (ret) {
+		dev_err(&i2c->dev,
+			"Failed to read ID register: %d\n", ret);
+		return -ENODEV;
+	}
+
 	if (val != RT5677_DEVICE_ID) {
 		dev_err(&i2c->dev,
 			"Device with ID register %#x is not rt5677\n", val);
-- 
2.51.0

