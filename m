Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCBF469D
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 12:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764678991; cv=none; b=KIyOCBdQvj/Hvopsx0mC2mFY94uXeEsxy4ADr335+5gzJqPnpZ1O/VgkMwsZ4it/Ybnq4BreI2b8IIf19k0G0KhKkXMeh9/wukHL8NTNLNkIvpSDbwOgf13m3rHXctHLGxnSNrHZL3KoTn4RvuYkKzCAYwxfwtP2oAgcTzuNrxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764678991; c=relaxed/simple;
	bh=QkraC+X2lkgEkNGEqCKAQHtwicRn26DOvJpsHqN/dxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FG/CQXrReqH2c0YQoOExhbApVe/rM0+D+58f1M/aQ/Fb/U4Id1AquQyKDyrFpJyc33zW3Na8NXoHMo6GJ/3wjayJehT03Dhf+lsyQR+TZpcj6dl7DyjZZsupQG/I9tzA855Q7ay63YF/yatLwq9HsOBs4Hs+53oXWmvnQHjP8bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=e6K9rYr1; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="e6K9rYr1"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b75c7cb722aso784605066b.1
        for <linux-sound@vger.kernel.org>; Tue, 02 Dec 2025 04:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764678988; x=1765283788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byvv0Fx7WfAhzg766746uSMspl1k3/KkZki0PXNoFsI=;
        b=e6K9rYr12bWLH3dUdCGpOFcw5IQRBhSyqbfKROl2pYFW4htGplMGBB5KcX/WTGr6zS
         COFN7JA3ACvWLrTM3wclXiRnlcDebisavQpbDFA0EGcLUHAHPpYllULLnnbAPO4MJ15h
         SvW6VhD1atR65mWnLXwM98jqkjxJy7prj0q7Qs+Fim1CeeQ/g6J1HX1HD+vezxI6ivNs
         KkECX488aa1te4BCIGKkKND/tAmZaU9ESLbeS0aa92fAOlItHu+njJk2JionwWK0C3bO
         PAmxF4k/RpNiZSieoT+Y7IJDpXOYHN+Hazz01HCyaSkY5jk2sgGutTpFxBQ0B1oa7CsC
         yq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764678988; x=1765283788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=byvv0Fx7WfAhzg766746uSMspl1k3/KkZki0PXNoFsI=;
        b=IGQX83Sz/MN3pSYYEj2k9Pv1uALTQxaCIzYNK3TvkHAyUtfFpMLifaHvAskLw5EGgT
         4fzTkII68sYILVtxRRUkHXxxk0tX4Q205bUmu1lQM+cKwe9HUhYBlllQpsOL5C7h9JnA
         7YP6Uaf9Sm83PoVBdhStdFLmilbhnXEaGFIltOW4b1cqnOCG50oVjc8VwxQI/DyziFdn
         MChLEfk1duFLk2lEHS/Jbfrjf9Hv+N71X7vicLemddHZoFWPeF51uKb9uYQQEmtlt8KJ
         gaHj4ZckUsh8BwY1tTqxLzRW0uHbs2wCG/B9EeO1UyHlG7DXvlwdHvi4fc5QVmHLEWZ5
         hnPg==
X-Forwarded-Encrypted: i=1; AJvYcCVzEm7JLDNvZVWPp6yE04WSHIIcdxwfcwkriHpxs3hb/ZuQzJa1wxSHMofJMoeizKnp4637oZjVakvFGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylnlJ+Xr8rkPJPlUl1KnE9TBoCPm3iLQuO35DcyuCJt9XxeoJH
	Sp6gZobIFGiYNOTBDqkyowbs1OrxmgcBRr2Y2tpCnrCist8U2Gre+MaqjNz6SRBBc3E=
X-Gm-Gg: ASbGncvlqkx6hicnd8P4XY4IkPwPaaH1VfvUeUi4xmBBQXK+ww1+5m+z0aUS2pmOaQs
	L7wIAABmw4n3+nwjKl3ZzXORFrEiCiSKusiXWx/gQTlTzoy02PYsA6k/dSk5p2MxzuaGDnvkxNU
	DxjVecQY6UcBj9Z1ttYn0YSHVJRb1z8cDwqPevxQkzQP7x/RQHH8OfTdIm0TmTjplIwW3N+IPda
	qFXdHb8W84MZ1dh6FQ8sWWd97/nPZagrD+QZzFEhFnXbPkAyNRD2qNIC9KCYWxsq0SiUy2XH047
	WpBH2tUei6cz/GKMYy1UB3zdu5VhVKMzivpAjJuEXI+MCkOZW5VuQf08wcsI11vscDUvrp0yWAh
	OiJh7OvvSpuNr0M1Cp9+k+HVodUbftXX5ACwPWGZ1YGmdhyK84qhNniHJUGJDj3IPvpCjw3ptOG
	o0+pDkhuYwq6nHwNxdx/K+pJu4P5b6M8OgPchBepAZjwKGezlsfWQr05E0enwsnAqe0cHBEQFy+
	TA=
X-Google-Smtp-Source: AGHT+IEiCENk1bTWfuSnQKJZHmNKalgZBG6mVpETyT8DaCVtRHvOBysDlXYje8rRFbhUujvBJqAidw==
X-Received: by 2002:a17:907:7f8a:b0:b73:7158:d9cd with SMTP id a640c23a62f3a-b76718c2fdfmr4525966866b.52.1764678987953;
        Tue, 02 Dec 2025 04:36:27 -0800 (PST)
Received: from localhost (p200300f65f006608c90d1d7fe637464b.dip0.t-ipconnect.de. [2003:f6:5f00:6608:c90d:1d7f:e637:464b])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b79c7c49d35sm101168566b.49.2025.12.02.04.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 04:36:27 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH 4/9] ALSA: opl3: Convert to snd_seq bus probe mechanism
Date: Tue,  2 Dec 2025 13:35:53 +0100
Message-ID:  <e80de5e54a2d60da8596bc02799a8802d3e9e857.1764677854.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764677854.git.u.kleine-koenig@baylibre.com>
References: <cover.1764677854.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2091; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=QkraC+X2lkgEkNGEqCKAQHtwicRn26DOvJpsHqN/dxE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpLt0wJy70Hlk1OKsqds2qymbWe2GUVunu1WGUK tUkIYLCUF2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaS7dMAAKCRCPgPtYfRL+ Tix+B/4l57Cw0jY6v54g+N3CJmXV80v4eFz3Vq8PtN5UiTFAu8L+LalFO7F8G4oj47CqeTUb5ZE DtvgWR8zI2zlekEQaK22OqVpPDMr/V3utTD1HDf1hz8HgrALB83qIuJM79Zv5w7dD47p+/ZSwR1 wn2rm0YMQpMWaaPj+eMFCQYyZ37t9mnp9wJKbjNbXqh9A0w5rnqPB4mtoMBoQmd51kPMoqx3tiH /5Sbe78V95uo41r5nPPoU2ryTsX7VtbPTQAZ1oYD245uSoxT8U8Rs20usOLBIcYB1yScb48Gxul nuGVskWU0nwByK8jaawGDMNJZAfoA2oz1n5DZ7zpx8jLIAf6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The snd_seq bus got a dedicated probe function. Make use of that. This
fixes a runtime warning about the driver needing to be converted to the
bus probe method.

Note that the remove callback returns void now. The actual return value
was ignored before (see device_remove() in drivers/base/dd.c), so there
is no problem introduced by converting `return -EINVAL` to `return`.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/drivers/opl3/opl3_seq.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
index d3278428d360..b77d8e8f12fb 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -201,9 +201,8 @@ static int snd_opl3_synth_create_port(struct snd_opl3 * opl3)
 
 /* ------------------------------ */
 
-static int snd_opl3_seq_probe(struct device *_dev)
+static int snd_opl3_seq_probe(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_opl3 *opl3;
 	int client, err;
 	char name[32];
@@ -244,14 +243,13 @@ static int snd_opl3_seq_probe(struct device *_dev)
 	return 0;
 }
 
-static int snd_opl3_seq_remove(struct device *_dev)
+static void snd_opl3_seq_remove(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_opl3 *opl3;
 
 	opl3 = *(struct snd_opl3 **)SNDRV_SEQ_DEVICE_ARGPTR(dev);
 	if (opl3 == NULL)
-		return -EINVAL;
+		return;
 
 #if IS_ENABLED(CONFIG_SND_SEQUENCER_OSS)
 	snd_opl3_free_seq_oss(opl3);
@@ -260,14 +258,13 @@ static int snd_opl3_seq_remove(struct device *_dev)
 		snd_seq_delete_kernel_client(opl3->seq_client);
 		opl3->seq_client = -1;
 	}
-	return 0;
 }
 
 static struct snd_seq_driver opl3_seq_driver = {
+	.probe = snd_opl3_seq_probe,
+	.remove = snd_opl3_seq_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.probe = snd_opl3_seq_probe,
-		.remove = snd_opl3_seq_remove,
 	},
 	.id = SNDRV_SEQ_DEV_ID_OPL3,
 	.argsize = sizeof(struct snd_opl3 *),
-- 
2.47.3

