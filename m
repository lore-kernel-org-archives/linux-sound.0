Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565CB32E152
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 12:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283976; cv=none; b=uMng9dNThE2kd2toQzVukODmDHuuMDkd+cgk9U+J9XPU9Qi1r67o+4DIKDR766hK7l+OTO7sCadhdzBD07CiXTAwxAO6eb+Y6FwWKrI/xxVTPAcOe6yMC+UuWfzbndE0gxxxQvXBgzY67cRb3vA/LCqDT+cOWCC0zEElaJkOpAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283976; c=relaxed/simple;
	bh=ffAEuiuf1UxWG4uUYhtG2hNekaaXN2auIC0MRJ9J3H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ROmfys/ct0GVuzHzOcfXvRGknn/3bdRXtyZuxzkYmqpBQ8/DRlEEgYnSNPA+bLHH2Pstv4mJue+sVyzJ/tyyxfyB9QhqHsni3YJM0zBU/UueFzh8IfE10BSoqPHh0XpFFmeQdHHfag4rr3tNQe+JomCEFQlB1yykA/wg8FFopdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Gv499MTh; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Gv499MTh"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7697e8b01aso756809966b.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 04:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765283973; x=1765888773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wj6+aXGTEOqwCmlEojXQBihsJ3wJcUUTuAFKIbEx2ZE=;
        b=Gv499MThFFhbiiHSgkBXaQ6soAmQdi23daPicQzq4S4CoqqU8tKAs9hB2jSjvTiCSs
         +8wpom4l7/UGtlFAkYXCAhquP1cr6IBEwyP0ilUZtHqBpC4dRsb5jt+GJWAcW0F/dD0S
         ZZHnyDG2Wm8HhohlSe+gHkBcok9i+jawzCm8WtvpOoCfBwFJ9duaC82zqb9p9kV/O/KZ
         dkgHV9hSDx85MAMksCmok6wxsl2nYnn+CcJO80FXFWo3wqUeCvim0VlANlYNZwBbM3e0
         hcAyJMbCVUjAa3N82KhnUGyeii/6rbU44+9fpb65iI+WVezKKA+SGfHknucvEsTougyh
         /TJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765283973; x=1765888773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wj6+aXGTEOqwCmlEojXQBihsJ3wJcUUTuAFKIbEx2ZE=;
        b=NJ4EKz0gFhOOnFxEe3EQ4Q+Mjtu/gZQaR1ty7BcLDb8KBiDJ6DsYPiHSn27SPHtp36
         xM8myns47jQlcF4zJ8bdN7ZJ3r95tXCsAkjKxKW7/3zKzlpVzRvvegMl0OdGtJ0dr9K7
         qi/sZamWwAv7pyHFvOhmzec0yyYXYy2DSzgFXySPie2T85XL3CyR/nwCh0aD1FkfNVbn
         4pV3z8GShq1R5cukdurXn3k6fYEuCmp7zokOF0K67EW708pOvKuTE/6uGZGNA1vZpufu
         eyw+BUryqSAFhVJ9ycEFOVlN+j5vNvrWeCcHwadwrywWxrmGfh8Fbub0sHmUh3mmX0S4
         zBcg==
X-Forwarded-Encrypted: i=1; AJvYcCUOyxRwqIYohqAVX70iSsey46TEYdW0mf4vYBD5dvhkP0elEsc2Wwd0GzgAnnpw8M8OLNsXQmFZ2iAokg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfKbwgK15alaVE3l5wQ+qUHU9rZYg4tt3RIKZUJ2eWaYwnmCto
	LYAUXQMajladVE1pKWY6nkufp0fhR16U/LWmOSl8waw00E8+1H8T0dv2LaSka9yq7MtYP+TJlPt
	E1T+k
X-Gm-Gg: ASbGncssjWcQJrHZnYi3kkIHqQJIJotpN+1aPOLcjinKagJXArX5i41/0rbT3ne/q8X
	/JKf/I9L8A3TesGPSpntE/oX9ncprMdpdCk6EyqMBjwDFgqTPyT6cKpYgq+jvMKNSozpiLnWY8q
	GAMAMVz0k9n+dbSoYQ8iQBjNbUOkfUtOT+8cxHL3tdhm/zgCfu0E2pTDa8oEvw6XQfQnWkAmYFA
	QHL7tOSZ35b5xaCR7shqbdRGSMK7H17w9MAJgza3T91BLgeoikQgjINr31wz8DEYtZFLDyaZOOk
	8cS3OtbVOn0bU3bpy4v5mjhRD6d28uyN8q3wnD0DyYl/9odNNTSq0uCYz8NXJkZif+aDjw03zAN
	UcgOX7elK+pxV4RBRij5oZDFp6wClrJSmzrRVKeXVRHNz2b0ao/OFg4By/crg1OFheRGlr27thA
	FkYyLr42yFub/w2uD8xkrVZCtGcU88IR2KHdeWunsFBhM7KbE7xvXC+/meFKIUWztyHrn0lknvP
	28=
X-Google-Smtp-Source: AGHT+IHWyyhhKkSnnIYk/JI+X+aGNqoqOP7jcX6lruyPyPF9jJm+mBr8PcRrF8Cy4T2VT4pwKJdS0g==
X-Received: by 2002:a17:907:7f16:b0:b79:ff62:e994 with SMTP id a640c23a62f3a-b7a24307692mr1159125366b.22.1765283972651;
        Tue, 09 Dec 2025 04:39:32 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7a01a3335dsm1215535466b.61.2025.12.09.04.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 04:39:32 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 9/9] ALSA: seq: Refuse to probe seq drivers with non-bus probe or remove
Date: Tue,  9 Dec 2025 13:38:51 +0100
Message-ID:  <10adbd12b75984f6fd45e281438d475735cf5fdb.1765283601.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ffAEuiuf1UxWG4uUYhtG2hNekaaXN2auIC0MRJ9J3H8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOBhslX0Mu3jioXqXooR6lLGlb6wdVkaOVHO0k Yhpsr1sHiuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTgYbAAKCRCPgPtYfRL+ TtRhB/9VrqLV5JQfJoRwVo6nSzkrLoJSq86cEKQ6+L2YqMkFBfoEitFH/RMzgiI9XaBNd8YFiEj yaoBKSrAqAMeNOIvv1Xq2QXiRimT1U2XkDkHO4jvfxCdIa+87TE9XUvJ+qM+dC16nQr9+7IUuXs iSju8vX6l8b86WeqPrQwkqHOZ73p/lEZ0flqXL0qBzkdsOoel+LABQz4SRj6BFxoEsPT++8s7oj BXFxxIJ2U/XehX5ZFMGth5kzf54imL6lzvm3AkMnmPs5uVODQu70EaMQobTGPyl/PX9k00U1IrG 8Lb/H5M695xhEeIv1seQTdETo+OeEjxUjN8Ybr19TN2TXmFJ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Now that all in-tree seq drivers are converted to bus methods, let
old-style drivers fails to probe until driver methods are removed.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/core/seq_device.c | 27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/sound/core/seq_device.c b/sound/core/seq_device.c
index 01def5b739a6..1b062d6b17ea 100644
--- a/sound/core/seq_device.c
+++ b/sound/core/seq_device.c
@@ -264,40 +264,17 @@ int snd_seq_device_new(struct snd_card *card, int device, const char *id,
 }
 EXPORT_SYMBOL(snd_seq_device_new);
 
-static int snd_seq_driver_legacy_probe(struct snd_seq_device *sdev)
-{
-	struct device *dev = &sdev->dev;
-	struct device_driver *driver = dev->driver;
-
-	return driver->probe(dev);
-}
-
-static void snd_seq_driver_legacy_remove(struct snd_seq_device *sdev)
-{
-	struct device *dev = &sdev->dev;
-	struct device_driver *driver = dev->driver;
-	int ret;
-
-	ret = driver->remove(dev);
-	if (unlikely(ret))
-		dev_warn(dev, "Ignoring return value of remove callback (%pe)\n", ERR_PTR(ret));
-}
-
 /*
  * driver registration
  */
 int __snd_seq_driver_register(struct snd_seq_driver *drv, struct module *mod)
 {
-	if (WARN_ON(!drv->driver.name || !drv->id))
+	if (WARN_ON(!drv->driver.name || !drv->id || drv->driver.probe || drv->driver.remove))
 		return -EINVAL;
+
 	drv->driver.bus = &snd_seq_bus_type;
 	drv->driver.owner = mod;
 
-	if (!drv->probe && drv->driver.probe)
-		drv->probe = snd_seq_driver_legacy_probe;
-	if (!drv->remove && drv->driver.remove)
-		drv->remove = snd_seq_driver_legacy_remove;
-
 	return driver_register(&drv->driver);
 }
 EXPORT_SYMBOL_GPL(__snd_seq_driver_register);
-- 
2.47.3

