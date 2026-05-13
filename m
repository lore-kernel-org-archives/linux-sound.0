Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201B9389DF0
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 17:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693006; cv=none; b=Di9gLRiMqbulTjNqA6ynisrUy9AZWir5zUp+hLSF/pfDZbNlCpeNi91q2qXbJLg6oUt7tCs50OAVQM04yTPeeygbOmn6/Fc3pxiMv8huE2MZk5KN4+tiWr8p7TUCzIjHWTcx9CVruL/cweRLcjfD+9+PvzK9tr5evz/f5qGsadg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693006; c=relaxed/simple;
	bh=3whdUSXsR7bOtEa5+tfHBQ0vuV6PGw0ny/dcbsiEnLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fY68SzITYcO8Br66ZxQ5Nstwqegn0LWgY1IH+EYqvOzHwWsN5JedSEsOcxIkiXohmww/CvwELpu5xjy/OuMrHMVIgTi7A5GNkgLWLyAfTmq6uikeknkUzyoh1wqw+A+RD96GkUutQAwhulkiWADdfqjfKLXekOZxAHxYROPaJcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=ACl2osXd; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="ACl2osXd"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ad135063so57105845e9.0
        for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 10:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778692999; x=1779297799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZD8nO7pNlMZEHnU1E6t1waIWO4n2rvrSSUaxBRmJYA=;
        b=ACl2osXdhfo+usZuScTIL9vk65tLDduuz9FfBCJAsEVs6ZQpdYOPqQtjU4xjhmVUC5
         reibqx66OBMQ7DvXSQOoqs/Wne1ZN8htG3cCD22+ix+Zm/bUE38k/LrBpma318ho73lA
         EuMrDvWVbCrK8XdFlqgnjvG1YFOzWLOkR0yTic5RMjX8ebBXgKGlzYwGYvLL7a54oUeh
         OHoNf2mnWbQKmAPtKznLpsTwOb6LpmxyXFd2NTAeHsPPHqcIvi++komCmQzcGBPqNwrs
         +hOoyHx+20s/STh2TvjPdFW/d3+70N8ZPEl7I8uLwqz98h3JpqBo3rLPnPbqmdxOZCL6
         rOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692999; x=1779297799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nZD8nO7pNlMZEHnU1E6t1waIWO4n2rvrSSUaxBRmJYA=;
        b=dtuhfTQ9urwqLbo5IPZlxasrOyNUE+z12Ijh3f3yJACBQU3cUFCdcB6cBi3K3pO1wI
         iupUZzLGP/Bp8hglE7ou+yJiq7s6B6hdd+TxH+eySGJwBVq6ayTm/37Z3oK3jtdHpxQQ
         JddphGoWU6/OtZvbb9ZVSdseTpqGQCMiV0GVmRqX3tGPGs41AE+6ScbdtvW6N0eD5Ut6
         VkP+9GZ95+t61JV8y7t60sUmtGTLsu7GcWKR3nV+rFDIFzduXrTUgXY2mxAlTjpwUllB
         MbXTOMLw1oO5hXkZpk+Awk+40SR3PO5Ddj+bT5uHvAZ4fE3ZnBet3TdT8wLqp8bverCf
         D5vg==
X-Forwarded-Encrypted: i=1; AFNElJ/4tNZ1LgUAdvYTU2pdRJtK5Oj1NhxTdPGtzTmUoLaCvlFiGbSGdQs3nYTPeecevskqUvrS8cjPZz5Rfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOSzYTaSWDuY7ET672Whj8oMo7EzTyelPmmY9Tvt3f9pNgdmgM
	cSBvohtBrjCj1LjsDMbxZsms8IYFkcGKyo5GS1cXlaxM3uQLSxQssYZQIjLQ1yFWzzw=
X-Gm-Gg: Acq92OG6F9b9Vd44y9yeXs2CDuBbtd02p1qyQnwjrgqhaVBd5I9Pb2smH/5E8T+9JaJ
	2RGOjkZVWwE6GJ8cjhfKL6Vk1FUAWyJxcly1z852+U1YrAxYFG82jcSElG4jFth/mCpZ7A2re5J
	MnW5HHCpjrlpYdPKUmLEugzArn1oQmRvbVIdxIlEPcEgzCtW8VkSY9pcCRqH5U74uTY4/oGbiy+
	3XAT2dhnYp4EgFNF1N+mr3ms+GmNz7vpmQpTiYqRPSELP+8QvcdHsZNtRXCkLy99JkW47IXLoEz
	EToFxwg+v11v5iaM8lloPS3S9a4oueoZDTc7U8lGjwTa5BbsDTY5hKTYqkFqesV3kA+zQWaGfAi
	REhb8tbABOX5s3S6LGAZyVBFjGAolOEMnsRvDbTLg73yjygK2MgLuhM6n2d4Sif9HiQ31kUN8/l
	+3MBUPOREL7HHA8BvHzqauT1YXiX5J4aniUfi6tSPWY7KFRYCsO0B1nTl/v7uQJrczl2HOhwPqG
	Y5jyQM9ZldhKHo=
X-Received: by 2002:a05:600c:5d2:b0:48f:d612:3c74 with SMTP id 5b1f17b1804b1-48fd612403emr6514065e9.27.1778692998746;
        Wed, 13 May 2026 10:23:18 -0700 (PDT)
Received: from localhost (p200300f65f47db04379dbd4376e53036.dip0.t-ipconnect.de. [2003:f6:5f47:db04:379d:bd43:76e5:3036])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48e8f447166sm45608735e9.30.2026.05.13.10.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:23:18 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v1 1/2] ASoC: Drop empty i2c remove callbacks
Date: Wed, 13 May 2026 19:23:03 +0200
Message-ID:  <3afd8230634dd68ac7c1885ee2b01da377349f89.1778692164.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778692164.git.u.kleine-koenig@baylibre.com>
References: <cover.1778692164.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5652; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=3whdUSXsR7bOtEa5+tfHBQ0vuV6PGw0ny/dcbsiEnLc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqBLN4O8OL0Zly+4uNNccl6qIAZPHLyUDrmVhI3 DpweV62KweJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagSzeAAKCRCPgPtYfRL+ ThjZCACMdmoD5OYnF2KT/NF6hbJyLG/u9GjIemd7rvGOXL7OLGbHddkr6ZW28463g1Vvx67Bs8/ AGFNixOOLZcejcG5CRzhb0Ro7ZcGl2vfSGdj9B/gl3U2SYBPs+H8BO7VZXcc34l+bqICXnJ5n6o EkHcJwpJ1CiubaeHi511xqZ6JPIOBhG/jTyi46zD8BZXSBL9juh4xLMzk7b2Da28q5urZbLVINX RMqKVFdpS4TIpo2N/rYN1pgj6JtRwzRwWPfrZX/3uI/GwppCvRqU7zcxmTRFaz99CvoOYEN6JLc +At9aNzSCYjhTuseGa/Iv7R8NZzCtQRrPzURleYr3LAFxJNM
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A remove callback that does nothing has the same semantic (apart from a
debug output) as no such callback at all as i2c_device_remove() just does:

        if (driver->remove) {
                dev_dbg(dev, "remove\n");

                driver->remove(client);
        }

Remove these useless callbacks.

While touching the driver structs, unify indention.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/codecs/nau8825.c |  4 ----
 sound/soc/codecs/rt5616.c  |  4 ----
 sound/soc/codecs/rt5631.c  |  6 +-----
 sound/soc/codecs/sta350.c  |  6 +-----
 sound/soc/codecs/tas5086.c | 10 +++-------
 sound/soc/codecs/wm8900.c  |  6 +-----
 sound/soc/codecs/wm9081.c  |  6 +-----
 7 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index dd3528537ae4..c6df21b91e36 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -2930,9 +2930,6 @@ static int nau8825_i2c_probe(struct i2c_client *i2c)
 		&nau8825_dai, 1);
 }
 
-static void nau8825_i2c_remove(struct i2c_client *client)
-{}
-
 static const struct i2c_device_id nau8825_i2c_ids[] = {
 	{ "nau8825" },
 	{ }
@@ -2962,7 +2959,6 @@ static struct i2c_driver nau8825_driver = {
 		.acpi_match_table = ACPI_PTR(nau8825_acpi_match),
 	},
 	.probe = nau8825_i2c_probe,
-	.remove = nau8825_i2c_remove,
 	.id_table = nau8825_i2c_ids,
 };
 module_i2c_driver(nau8825_driver);
diff --git a/sound/soc/codecs/rt5616.c b/sound/soc/codecs/rt5616.c
index fb9cf127e3ff..005a2ffe90ae 100644
--- a/sound/soc/codecs/rt5616.c
+++ b/sound/soc/codecs/rt5616.c
@@ -1386,9 +1386,6 @@ static int rt5616_i2c_probe(struct i2c_client *i2c)
 				      rt5616_dai, ARRAY_SIZE(rt5616_dai));
 }
 
-static void rt5616_i2c_remove(struct i2c_client *i2c)
-{}
-
 static void rt5616_i2c_shutdown(struct i2c_client *client)
 {
 	struct rt5616_priv *rt5616 = i2c_get_clientdata(client);
@@ -1403,7 +1400,6 @@ static struct i2c_driver rt5616_i2c_driver = {
 		.of_match_table = of_match_ptr(rt5616_of_match),
 	},
 	.probe = rt5616_i2c_probe,
-	.remove = rt5616_i2c_remove,
 	.shutdown = rt5616_i2c_shutdown,
 	.id_table = rt5616_i2c_id,
 };
diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index 19c6d8f760d9..2c404a50b120 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -1722,16 +1722,12 @@ static int rt5631_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
-static void rt5631_i2c_remove(struct i2c_client *client)
-{}
-
 static struct i2c_driver rt5631_i2c_driver = {
 	.driver = {
 		.name = "rt5631",
 		.of_match_table = of_match_ptr(rt5631_i2c_dt_ids),
 	},
-	.probe    = rt5631_i2c_probe,
-	.remove   = rt5631_i2c_remove,
+	.probe = rt5631_i2c_probe,
 	.id_table = rt5631_i2c_id,
 };
 
diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 71af82b099c0..0d36cb06dced 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -1236,9 +1236,6 @@ static int sta350_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
-static void sta350_i2c_remove(struct i2c_client *client)
-{}
-
 static const struct i2c_device_id sta350_i2c_id[] = {
 	{ "sta350" },
 	{ }
@@ -1250,8 +1247,7 @@ static struct i2c_driver sta350_i2c_driver = {
 		.name = "sta350",
 		.of_match_table = of_match_ptr(st350_dt_ids),
 	},
-	.probe =    sta350_i2c_probe,
-	.remove =   sta350_i2c_remove,
+	.probe = sta350_i2c_probe,
 	.id_table = sta350_i2c_id,
 };
 
diff --git a/sound/soc/codecs/tas5086.c b/sound/soc/codecs/tas5086.c
index 12bf6a89dbd8..36596b00ca69 100644
--- a/sound/soc/codecs/tas5086.c
+++ b/sound/soc/codecs/tas5086.c
@@ -975,17 +975,13 @@ static int tas5086_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
-static void tas5086_i2c_remove(struct i2c_client *i2c)
-{}
-
 static struct i2c_driver tas5086_i2c_driver = {
 	.driver = {
-		.name	= "tas5086",
+		.name = "tas5086",
 		.of_match_table = of_match_ptr(tas5086_dt_ids),
 	},
-	.id_table	= tas5086_i2c_id,
-	.probe		= tas5086_i2c_probe,
-	.remove		= tas5086_i2c_remove,
+	.id_table = tas5086_i2c_id,
+	.probe = tas5086_i2c_probe,
 };
 
 module_i2c_driver(tas5086_i2c_driver);
diff --git a/sound/soc/codecs/wm8900.c b/sound/soc/codecs/wm8900.c
index fea629541acd..5312eb70dd29 100644
--- a/sound/soc/codecs/wm8900.c
+++ b/sound/soc/codecs/wm8900.c
@@ -1286,9 +1286,6 @@ static int wm8900_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
-static void wm8900_i2c_remove(struct i2c_client *client)
-{}
-
 static const struct i2c_device_id wm8900_i2c_id[] = {
 	{ "wm8900" },
 	{ }
@@ -1299,8 +1296,7 @@ static struct i2c_driver wm8900_i2c_driver = {
 	.driver = {
 		.name = "wm8900",
 	},
-	.probe =    wm8900_i2c_probe,
-	.remove =   wm8900_i2c_remove,
+	.probe = wm8900_i2c_probe,
 	.id_table = wm8900_i2c_id,
 };
 #endif
diff --git a/sound/soc/codecs/wm9081.c b/sound/soc/codecs/wm9081.c
index 5bfe43c6c1f4..521c55280f07 100644
--- a/sound/soc/codecs/wm9081.c
+++ b/sound/soc/codecs/wm9081.c
@@ -1357,9 +1357,6 @@ static int wm9081_i2c_probe(struct i2c_client *i2c)
 	return 0;
 }
 
-static void wm9081_i2c_remove(struct i2c_client *client)
-{}
-
 static const struct i2c_device_id wm9081_i2c_id[] = {
 	{ "wm9081" },
 	{ }
@@ -1370,8 +1367,7 @@ static struct i2c_driver wm9081_i2c_driver = {
 	.driver = {
 		.name = "wm9081",
 	},
-	.probe =    wm9081_i2c_probe,
-	.remove =   wm9081_i2c_remove,
+	.probe = wm9081_i2c_probe,
 	.id_table = wm9081_i2c_id,
 };
 
-- 
2.47.3

