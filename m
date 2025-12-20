Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDA92D97BF
	for <linux-sound@vger.kernel.org>; Sat, 20 Dec 2025 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766220347; cv=none; b=p7X0jd1M4N72ejSIdvkDVx3jIShBjKp+jov/kw9gGMcrOX1nIFql+OW4iDrTWuP5CiXZCiATb3Fa7ukwbCHyQM/IQK3NikMvz1MOvKa5LZM1MlCMQFm70rKzEzAfvc17E7fgaIMNNJFjh5W/w7Karw6whcoGHfxBXU4Qu1oATKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766220347; c=relaxed/simple;
	bh=+S85M7vZcdB2shypININVpHOd4FTUrPIPOTRXmCXQiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nxwy36O+UdIR8lvn9KiRfFv41e+XCdzaYcg2hSwA12hZjf00MvG7FyVm1EHkzrR9DSi27BHMm+ZT+07b3U8X9WV22ymr5IwCKs+F/01oEsqFnQNk4Qaw/3dckPofotCT+Yzl7o5FLbfTe3eh+zb7X9uoER9Bgb1qCamHq8ycA3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=utvggR5z; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="utvggR5z"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42e2e77f519so1729937f8f.2
        for <linux-sound@vger.kernel.org>; Sat, 20 Dec 2025 00:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766220344; x=1766825144; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6BUTU7KENszCvbPNcK9L3kbL2a9wKFYRCwPwVT9719s=;
        b=utvggR5zzuTIhNmN3WxghVSwaB4UHsm3dD6u0NQal46cN6AzPOnfts2gAHcYOrGxHf
         ACwnXzWtghQmt1+wupf1LC9pMOMxZr0sUb5aMZDWvkeynaOlHEe6yQl56E56eXq9wKtw
         7XmxHSJPiuJbEqU2hXAM6l2OeppY7WaQHIw/xCZs5gjIefIfHe6ZY8q35tpSibCg/Q4p
         ZpgSULygILRZsVcD/LP1TOumaHbv7vUv8aYErmgpzERUNcNrAHNIW0LuNpMzcXSfMLFz
         79Fk1Omx84nkWbfoJJZA8lNRoAgSgmgyZMC+m36JHkh1lEW8pCfmPbYaJEHghpDwkEkT
         ukIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766220344; x=1766825144;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BUTU7KENszCvbPNcK9L3kbL2a9wKFYRCwPwVT9719s=;
        b=v4EeFC4asLcbkVkW9XHKGa7OZzGfPc+mJZN5LIpaKkcl7hpLCKWR8j7/93yxOmfN/i
         eQ8/pTGwPvKuVB8QJggfj5R/zNnjZcOHpfXVD/Lt+6kwfPQMn2dZFBuIeac4uQ9kXgvg
         yrkiO7uZeNXRGeKnylH04G4Xr2nGIttoxXefYVcuq+aKe4IxabcbzDHySViyCLFjcnT+
         3yJA8Yjz2RH3oDLiir0uUGWewN48gZmvHR8focJ2vtJpwQYAIKd7gPkuUm++08dQAc9Z
         09rIOaFevEDSwJv+anBxD5wUVSQzJBnM6orfC/QupxwB6HAC3z+sbc3lhaXvy/frD71M
         128w==
X-Forwarded-Encrypted: i=1; AJvYcCXlcco4aTC4jdNyCDnIuJC5gHmlrWesg5rWCtGlOHFcStSe6TH1RAyez5CTqBARiikf4OSY87+STYIH8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTmFhcqjPfgl2FYo5YeaI6vHcmhtmBfWf0Ov1a5GLZmHFRegIn
	yW2ck7hruIcD3DlBjbRGM3et0sVoHKMUHC5W6UnrcNXKFcMC9E6QxNhsLMjlRpmPZOs=
X-Gm-Gg: AY/fxX5V8lH1DDK0Zftlevm0x+ted4nIvRDLtPKSwy0N9Sm6YEsPm0DMOte6FfpD22M
	M4EimRqK0wIearVZuZ+AhHmqBjwN0ypOW3VEg99dWkJq6o5hO6YWuQhJe7Ucnx4Jp3XXjxZmv+C
	ytYWhC9tJUkNbb5YQHT9D4k/g5IxQUcyHRoGNhpq/VkTSbsjVme3to+QXYtxIjTwqwiNqEOKmSn
	1RdXo3yMSj3DHZAE62E7q7IzuqpZYHXog2ntIx/H0IdVgZuu1mrFNfx9XZGzRMaON1Aojs73P3g
	DxzKW4q/hCZSehkZoMUY6UOfyRnoRusu9QvfN4sYr+x4G43y0WY/iQh2l9RdjCO+nyFrmcXdUAl
	sGqvIzBoiMJZ7yNJ5LL3VIJalrE/98nGu37rRaTK0C2av88qf59kWBPkCf+7izkQoMWfSI3nsDe
	KGW3suwpUuQP8UjoUw
X-Google-Smtp-Source: AGHT+IH2hmS7gnHrym6BlZDJPvms24FqDpXh/5usVOeYZs9oX/On+LAvByornqMlQyiobOiJjnzxJA==
X-Received: by 2002:a05:6000:400f:b0:430:f742:fbb8 with SMTP id ffacd0b85a97d-4324e4cc56amr5628044f8f.21.1766220343511;
        Sat, 20 Dec 2025 00:45:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab33f5sm9530459f8f.41.2025.12.20.00.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 00:45:43 -0800 (PST)
Date: Sat, 20 Dec 2025 11:45:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shuming Fan <shumingf@realtek.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] ASoC: rt1320: Fix retry checking in rt1320_rae_load()
Message-ID: <aUZiNJ7pzuahXFYE@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This loop iterates 200 times and then gives up.  The problem is that
currently the loop exits with "retry" set to -1 on the failure path but
the check for failure expects it to be 0.  Change from a post-op to a
pre-op so that it exits with "retry" set to 0.

Fixes: 22937af75abb ("ASoC: rt1320: support RAE parameters loading")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Technically now the loop only tries 199 times after my change, however
I am okay with that.

 sound/soc/codecs/rt1320-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 9447e742c672..c0acb6ac462d 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1480,7 +1480,7 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 		/* RAE stop & CRC disable */
 		regmap_update_bits(rt1320->regmap, 0xe803, 0xbc, 0x00);
 
-		while (retry--) {
+		while (--retry) {
 			regmap_read(rt1320->regmap, 0xe83f, &value);
 			if (value & 0x40)
 				break;
-- 
2.51.0

