Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7988732E145
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 12:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283968; cv=none; b=FoIxlrGwAWz6xRYJsco+eBZqhZ9QwnjP43EuzG3jrx7DWhFw85eBhidHzzIBPxx1+8SIUMIOAprXx0I4v6+1By6wxy08orMh5Na0BNg6qxhlG63ugJTDfsyzhkcpD9gZH2wgXW2uQLxg9dgLdU/JAFlQ9rtDGbFr5AhNzhY3Uv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283968; c=relaxed/simple;
	bh=4CI/SLTFPw6D91iPsWX3ePqDb5+ZBhGl0uuATHVpZ3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C2GZoob4wZnsTqPu0/Y8CFoc4XG797IKUftpYqLRagSamf6IBZE0dAprCyDvF4fe7UWlOP4xsrfoNLL0gVs82nJRmn22bu7uPbr8mLV6SRB3bP8RHr28cFaBVzo1whjhq0ySuiObpAd7hYUEW6benHAII+hwrti+hHU5BJlX2a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=K2Mz9BHB; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="K2Mz9BHB"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7355f6ef12so775259366b.3
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 04:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765283965; x=1765888765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ijvivmm8XH0D/4aEMW9p08arkgLks1CMdNd/IC4SJ7A=;
        b=K2Mz9BHBnjpC1FMFL29v56TePUBfbpK0FAZHap2Ht3gpZxd01sSbirIlEwi7xhHCqg
         adlwDwOsEZI0wnJXSkrx6VhI+xR35wwHENQW69SUdVA3p5O146rG9QxNKEMXP236pKWX
         Uw4Y8vqGjnTJkjMo4fNfqi+bJDLzUcyqaYPwavfaql+gbxJa+mvHh9Bp5XG1/RS7zs6/
         EvHlKVXus3ZtuwVqY/aOea+5mvTwbstOLnU8zM8qdk8nuFp0qew61BLkrsm2Oq+zEtCZ
         TFJbss0DYKq/Xui7sagk2nEWGyZej0TnpAmhZuy+V12sqpQMgx2ZTEBN1HWRsyyEg4dn
         0wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765283965; x=1765888765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ijvivmm8XH0D/4aEMW9p08arkgLks1CMdNd/IC4SJ7A=;
        b=umpKV3jt/I7OD4xaYGe/iNG40ObwNyHVO+8V4vK4KlCu81aLv9zKmr8kDUJXKpaG6O
         ZbFsFZCZANmCE+FydJR2R5Wqf4WfxZA062ZS6OWtQW8TqdTWxPDqjjSFsHK6TMs2GxHQ
         xpWGwO28XFFmyI/qkXcAYuBrR06Ho17or6qktEUau8l1w6vMVMc7Nv+vwJ8nm8pehmsn
         8Sc09OVHPMUaqHNTRrC5x82GyIRXWsWpRWJlRE2FuEFN2sl9s+Jk6nLp+WkiHXBjyY9I
         59m4uf53k4SYTbK57u9PY17DBKGv3tYldZgX+PxBc0MLVbcgMnz46tUiB/w22ZuViybQ
         ObpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlja1/oKQ1iAe0u6zpbHUPA6LJLDXmGLMATI9FaHV64xh5KxJ8Xahcvykvz8X62atXvjPFpzEQaYPRRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlzqc9og0K58jxTjwJ01YZE9CyV0HJOPmGLPDBZE+MevVVc3OA
	OxPBfCRwYXd12RcDEGzxLK2z4sZjgyCcZg6GZVUQDqsvGvKW9w1ufusKCQw0XLGB6Zc=
X-Gm-Gg: ASbGncv9ASCH+THxCrfg7v8+Rl1OS7ssaI6pH1MICxr/rteff3ZqvCfV9bgDN7P/vVq
	EHZ8MHsOxI8lkO1dHlA1T1cmLWyghQ26Bth8Dsbhwtn8RsGeNSG0x/+sMsRSQEt/fPb3ebA8oOQ
	c5wF6PB8fGSmMGhvJoEZ04oDJvivwiY/O7M1AlrWhfReK7nCRklynOOWDe1nVdfV0z+zQxhxrWv
	Hxm1VW/4Zdi1uRp7TTZDQC1KN/z365Khi73vdCW5NYQweAtp2EztprYvwubf/DLnh7XIwJ3pOKJ
	vayGfNjxT18l4NNi7kv3REoy5M3w8H5PkbuM7qYdQxaB4P7ZUp1FKe/NvffEYnZvckvFL6/tT6X
	IgThhEjO9y48YUyhrFHGeC7+q+GHoGDLL8LUh6h8HE2cnno8wT56LlHzzyhsr+OGbmlsr+01lMc
	M7ikT+VyHZGWQ912uTLFg6PhZs1Tfoap+AxpUl/Is62ES8BMULwUOiUQLz9ZIKJEO3hLgycai85
	Xc=
X-Google-Smtp-Source: AGHT+IFR0RFVhad112KsXv8U0OtsTUQtHUYUqfJ04GADK8twYsCZSYZLSTH/b531mMiAKPqIYg4MEA==
X-Received: by 2002:a17:906:c10c:b0:b73:3e15:a370 with SMTP id a640c23a62f3a-b7a248164b9mr1306081066b.57.1765283964794;
        Tue, 09 Dec 2025 04:39:24 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b79f445936dsm1400255466b.9.2025.12.09.04.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 04:39:24 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 3/9] ALSA: seq: ump: Convert to snd_seq bus probe mechanism
Date: Tue,  9 Dec 2025 13:38:45 +0100
Message-ID:  <054f1a0536228ccfe5f539ce854804f789f2ee64.1765283601.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765283601.git.u.kleine-koenig@baylibre.com>
References: <cover.1765283601.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=4CI/SLTFPw6D91iPsWX3ePqDb5+ZBhGl0uuATHVpZ3s=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGk4GF3IygDxOA0d7x7BBx2uPnwedRzNmfc9AoptcjIRDV0zA okBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJpOBhdAAoJEI+A+1h9Ev5OCxoH/1cw p72XHTcnPPEV8AVLGDWs92vhcO2w7V6hb7HvYCHOUVsru6BiA364fgod0iKm0maIYYZEzhW5yHa XbSvo9/zfz2qDTp8JnijV3vasj85JvVcemSAgzH1bIgXMwdchUPMVhkSKiafb24aEnIBnw/Ru3L dJ5VgId4sDqJdVtTmUhi7e4oCbU4tGGeN0S4C5albwy2aF88Sj1aoqAy233Po32xLQeYD4vcnJ7 DoqTHw2xy0J4Eg6w8IO00RPqDGLnPgxi8gnh+ay0zRi/M1RlpGPgiiT734g90h4xuNsAfs8UNgb 7AOimnP8wBfY43PgsMsgTQCEBQV/mF6KUAWJb9M=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The snd_seq bus got a dedicated probe function. Make use of that. This
fixes a runtime warning about the driver needing to be converted to the
bus probe method.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/core/seq/seq_ump_client.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index 27247babb16d..a96d21981cbe 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -452,9 +452,8 @@ static const struct snd_seq_ump_ops seq_ump_ops = {
 };
 
 /* create a sequencer client and ports for the given UMP endpoint */
-static int snd_seq_ump_probe(struct device *_dev)
+static int snd_seq_ump_probe(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_ump_endpoint *ump = dev->private_data;
 	struct snd_card *card = dev->card;
 	struct seq_ump_client *client;
@@ -513,21 +512,19 @@ static int snd_seq_ump_probe(struct device *_dev)
 }
 
 /* remove a sequencer client */
-static int snd_seq_ump_remove(struct device *_dev)
+static void snd_seq_ump_remove(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_ump_endpoint *ump = dev->private_data;
 
 	if (ump->seq_client)
 		seq_ump_client_free(ump->seq_client);
-	return 0;
 }
 
 static struct snd_seq_driver seq_ump_driver = {
+	.probe = snd_seq_ump_probe,
+	.remove = snd_seq_ump_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.probe = snd_seq_ump_probe,
-		.remove = snd_seq_ump_remove,
 	},
 	.id = SNDRV_SEQ_DEV_ID_UMP,
 	.argsize = 0,
-- 
2.47.3

