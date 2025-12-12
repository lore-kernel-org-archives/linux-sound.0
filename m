Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFD07262D
	for <linux-sound@vger.kernel.org>; Fri, 12 Dec 2025 07:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765524970; cv=none; b=cok+HbvIvBhTKKqtTHPXgbAo7IeaffTCOYpDgZUbApy98MtkD5WojKZa2qSm3ppYc+cKZIhZT15/DXYa5w5/IweXYejSJmiuidSwOzU9LFMkaI6LGgx2hpavdKdLitdpMUyAMXESzrMbNa6Pei6kMTrkflxDPkYQ/3FMD2mYbpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765524970; c=relaxed/simple;
	bh=KMq886DE5fO0CzP6jMulKOytQTv1OWcwNjgKkLDUfTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZGSe8dpdac4P6MxzbRIsPfqSdHG1kWGLcl2pqqKagTmazbuyPMnSc+Er+6FvW1VZ/S9n3q9SBBzhagO/ilPT+Ympy0lexOpJ5CscUTfWrAb3FRW0YYYX3easercs/PJ+gHnZFOy9hgpMYARZKYOTy38op1scn6VSZokM6bBbe88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rTTNgXIN; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rTTNgXIN"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-641977dc00fso1405065a12.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Dec 2025 23:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765524964; x=1766129764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jSgHvTJWDYIM5Bba49bOYxlwQNoUGX2HjI9BjzevOvI=;
        b=rTTNgXINPzJeo+aYytUCZLSzVNzey8KfnyjzzMYo7DEbnCndHeM4iFvn/0PSNcFtgI
         KWiShviuwY4k5u+G5Hvu9+jFmgXRswGnJ1m+Ao4l5O7fvnDpKUciIV+u0HuE9CaxyqX+
         RR1670r7iO6PTJ90SJ2k+4zKOegJYlU8UZMIOABF+i6/eXmu4EVoPwzhkz8LOLMsUFcM
         0nvoHg10nuzz/pxJdJ3+t4/QSy4wPpVQ+zutQvqmETGLmAhIc9DO+sZ+XAbmhxa3Nzso
         3AszrP8fcGb7RCjtkN7QKVgJUJTGNb/vxFO0uK7qbntW66fvfPvQcIc+paAoUgx6DZQo
         KRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765524964; x=1766129764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSgHvTJWDYIM5Bba49bOYxlwQNoUGX2HjI9BjzevOvI=;
        b=OWmVk1zt6gqaFuhV9WMMKgXhlUkFmSJ0NlPF8bKBjiK89J+41RYh7VMO/J98KwqLqO
         HBCWRENKRsql7LDO5r6vmyx6q+L9tfh6Lruxlr4Y3OYlrqcGOVbwiz/BGKM5hcBZnYpy
         lGBeyVwM0i9AD+Qucffun0DxUmf+RSixadIGmyWOBndnR3Xzmgbd8rMsW8nOxvcMUIR5
         AzlWmZ1I9zqqSJQoTqtdDE7vZ60MVLOGDTX4d1HKy27z6C5YtYV+6F3fbol7+2QtIbBl
         WVAn/dnyfQmIZiqUx56PEjQkJq3aU2LxsY+XVbCa6EAQxNn3z4faJX8xsetEpMdor5Fh
         wVtw==
X-Gm-Message-State: AOJu0Yw6giqHAnVrY8pXLyEJFPR3Epfl6HG0efn025eILpqQaxntf3ZM
	ouxlIcVxIxUgPp2m4xtXt25j6WmoheIM2FG4Ph1TDauEOVvtQNywNMaPFSyuyicLxrA=
X-Gm-Gg: AY/fxX7aqmxCdwNQjYBnag2yzDwp+7GhiJ21bwXhU2o6c0A56gUEB6l7pSyYO+FyGKT
	F3xNGcDiL2ZeLCO8bmWADuOIYKmCJ9YLFwMynFcWrwC/S2gfe7CP5uPmG1BZIBzp3xWxpBvaryo
	cGtmJY5QR8RxOJAB7K0iPwmjYb8gePFc+JNXEw+7XAFlnMLcVCak4GL3uApTvgUTaRP8YKP++M1
	eQ8+kCDQC4WEn6CyR03vBKun/vO+WlgTIejDZ02mH7AZreTMt5Ki8pcjwuOm98fufsp23xJ7UWG
	+w44bMS0gPu/u6g1imnqt7HSNDPkIS+teabCH2gWqO7MvhmxqhCAALX2tvrQz/Z+T31JWzPn5ZD
	GkWqxHEqCBv5VvdR7tUorhrFGLUvMvRbTFhyYD0copNdOaHm2bz7wdUVOlVgEUCpr+qTz2TKjB5
	0hFOShLB9tioYty5HnKwTS0MJpJhO3htNRyydXVTK4SDdonmuPFrwALLvQbq8L3O3mkssZUvPK6
	Ww=
X-Google-Smtp-Source: AGHT+IGGHCdSH44++c71LQeZ4Sf5eZqc6F0kD8RqK+JxkJzOsR+QQ5uqUHm/xh0Quqkupz6DxbD/gQ==
X-Received: by 2002:a17:907:3e12:b0:b79:cef7:6574 with SMTP id a640c23a62f3a-b7d235c7f0dmr100850666b.4.1765524963909;
        Thu, 11 Dec 2025 23:36:03 -0800 (PST)
Received: from localhost (p200300f65f0066082ad4229ee042f7ed.dip0.t-ipconnect.de. [2003:f6:5f00:6608:2ad4:229e:e042:f7ed])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7cfa2ebafcsm498220866b.28.2025.12.11.23.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 23:36:03 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: sdw-mockup: Drop dummy remove function
Date: Fri, 12 Dec 2025 08:35:53 +0100
Message-ID: <20251212073555.1065284-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=KMq886DE5fO0CzP6jMulKOytQTv1OWcwNjgKkLDUfTw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpO8XbdK4sLDUu09fDgIML2Jmz567GNdSC2S/Ha JGWvjGlSzOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTvF2wAKCRCPgPtYfRL+ Tj13B/0SnJ2qxwpkmhOFXC8wZwwqn0on5bt1UJyC6C+ZUZ0hLvlZADdndGG3Co+tVytlNn5XJVJ NpoE/IdrGPhnEV8yu6aAv8UKeZYr0jU/rCeLQtJzMsdfsnw4uny4AZtgmtRTBX7WmjPLWNiXma9 GhCaBTzjzbEuf2fwIjIJPeSxoOn4gXGqyEz0qd2royzuzsLK2vKOqes/1JLcUiGMlxT9lyhfGW8 PyU8xG9aWyrhce1Je1URqNr+Dqz09/hqbgEvTbszhitbNPJA1+cn6Sf374ezGKIsuxCavOl5oSQ fuCZvhLH4wzyNwzvdS4ECBiJkO78R/l/eqOeh7qT3GkIXMag
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A remove callback is optional and having no such function has the same
semantic as one returning zero (and other return values are effectively
ignored).

This allows to remove the remove function without replacement.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/soc/codecs/sdw-mockup.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/sdw-mockup.c b/sound/soc/codecs/sdw-mockup.c
index 574c08b14f0c..b7e6546f1b5a 100644
--- a/sound/soc/codecs/sdw-mockup.c
+++ b/sound/soc/codecs/sdw-mockup.c
@@ -237,11 +237,6 @@ static int sdw_mockup_sdw_probe(struct sdw_slave *slave,
 	return ret;
 }
 
-static int sdw_mockup_sdw_remove(struct sdw_slave *slave)
-{
-	return 0;
-}
-
 /*
  * Intel reserved parts ID with the following mapping expected:
  * 0xAAAA: generic full-duplex codec
@@ -264,7 +259,6 @@ static struct sdw_driver sdw_mockup_sdw_driver = {
 		.name = "sdw-mockup",
 	},
 	.probe = sdw_mockup_sdw_probe,
-	.remove = sdw_mockup_sdw_remove,
 	.ops = &sdw_mockup_slave_ops,
 	.id_table = sdw_mockup_id,
 };

base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.47.3

