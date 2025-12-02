Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39341469D
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764678989; cv=none; b=E8JQZ74g+bdws2BxVUDEOIQ7m2OFtY3y9T+/vXdHK2mr3iFyApJPySe2ML0uqGDQ3zhVPFyEc2MPiZbmmmViz7q+25nx5TzQ6EZl2DtUDbnVNCQ0AX56kr8ljNwpqVKA1P0llsipoqeYF3h0M8lzXota76Nudyze5frXLwJTu3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764678989; c=relaxed/simple;
	bh=iGabLxvOaTsEc6gnsmnrQOoV0IQ9e8QdMHOGN5pZZ0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o9JmaPqzkfHPxoSwOJdmkQNwbjlMIE2zraCdkQ+GaUW04+PSbMhQFgKQmyrm9iw7WIbB5EVN/ruO1aV1gMrfz8/PPb2WocZd24TlSASltoWt2CoKWDRPKQXF1vIthaQnT3f3Q7cEHApeBDHyva4AgUYAeyFh32YVhNkk6BUX31s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Cls5BWlf; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Cls5BWlf"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-644fcafdce9so8969350a12.1
        for <linux-sound@vger.kernel.org>; Tue, 02 Dec 2025 04:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764678984; x=1765283784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVeq5q/h+KxkZiuUmv2BK7fV/ImMZAXB8Bty5RnpInU=;
        b=Cls5BWlf/zLGDE21JEN4cLWr0cRf9yMZb4yBzprBtdpp6hMx7/Ti84FygBm5RXspuj
         JKdpxv46BcIejtpUWZrpW0QVxEdy9mTGUmLVvsE1c4qDT5mVbF1LjyPxhUGmwce7qcnJ
         BE1lWtnNSxXtngtTjEdrgoM+wW6VrgH+tzJaa0GzzjbrjhsJvVkPpvFbDAImibI/bCUw
         RJ4JwHioGYny2rYUU9nWv1d4Lbb/nN4cvbs2Tj+NqscxfknftOolCcv1bAagjtqIWQ43
         je44/CG7YOgiaBV61gyRHv9qS4ZxwiFbxcuK5UNoNjCzxMDMj0uAttoFVbgWu8H8G5Ks
         Mf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764678984; x=1765283784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pVeq5q/h+KxkZiuUmv2BK7fV/ImMZAXB8Bty5RnpInU=;
        b=fxSGfo+ilFmitasCaeEsGAj58FUqokbFvYzyQ5wmPt5jZC/Hix6lX+xJSaV7by8NuD
         pWcWtZMESehwGtI2o2dw5lWbN82oGIKSOBJKHAboBC3AME8PpeDKZab9MiDSvNIDKClI
         GQ1kcgQ3Z8eeSpTehOlbjqyCD5vn180vV05B12zlMt3IqthTpQQAKVHO5ZUKP52Z4lsQ
         QFDeI7bSHW4J21Lk+YMQyNRJoAVq34AGvwfi3jDGkqBu00Gq+SLIwxw1JTRFsLWtCShA
         +yfQgj6D0AZABeufL2IXIr/aHqTlKFMAEPYNC22Eesf3rbxMtaKGBGdewHTjTZ3px8P0
         Tf0w==
X-Forwarded-Encrypted: i=1; AJvYcCXYR/io41OpOGbphTDgaMolWP7qGxZSHPhshC9zdOCDN/Ds2ZbfqJHhcJLVbDQvuAqGRDJkZ3dDDpCB3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGcH8jQmK4Gyb1dV6LMNZLVqJDE8OcOUKvxw+03vl1hcM7f/DT
	YmInpkhrSyvNdnACWhmOtBYmshUf8RZ3eola7wWJWwdgfWdg+I8LIwMQL7GMx+SKjJI=
X-Gm-Gg: ASbGncvH2teGfpk2BYhReUa2BlLO+aHhMgfgf9IfI4bin05ZXRAKRuZeZFGCfrpUAKB
	+AlXHnvH000teJLrDPantM4Gatp9fmG6CMrHNw5ggZAXsBUtEQih33jmL5x4pQa9IXfFFXsGPp+
	Bazsidl+2ffpfUbWmPxTTwtHhKy1E/JGw3L1ZmVsZbszSOf44phFWX5nzJ6ZFUiUfKV75Y/oCDP
	E+F4cnMFPVqW2XvZ0G8OchR1T07tHR13eQ6F0nyAvztH673mT52/Q4EOcenC1Ws6wGtJCh/45jO
	6gb4klhsDjnPRQ6Oues4jIdhEDCE+cKytd6YKKRFAgd0q9ezdPVMsJHev4vAdqUlWbTzetzWKXB
	M8akXKA/j9WhU1P0MVvzf4x59NrleTdqppRjzMBfC8bv+7vtt5YCJufHYkyAEBH8HVGLYCJoP/z
	r7v8WhSQItI8LFiW3U9rizexgRv0nxLW+UFuQfRIS4lUe+2Se6dioNZ6jWnLpn0PgiUuTxZQQYD
	vQ=
X-Google-Smtp-Source: AGHT+IEIoz5x67zy+jPqp4oM/mV/u/JP5TyGRAo+qsuhR52rTd3DKbd1Jqxgu4txMGqGvlUslABGoQ==
X-Received: by 2002:a17:907:9117:b0:b76:ece3:510a with SMTP id a640c23a62f3a-b76ece351cfmr1740802266b.21.1764678984091;
        Tue, 02 Dec 2025 04:36:24 -0800 (PST)
Received: from localhost (p200300f65f006608c90d1d7fe637464b.dip0.t-ipconnect.de. [2003:f6:5f00:6608:c90d:1d7f:e637:464b])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f59e8612sm1463982866b.52.2025.12.02.04.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 04:36:23 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/9] ALSA: seq: Use bus specific probe and remove
Date: Tue,  2 Dec 2025 13:35:50 +0100
Message-ID:  <2258e1f0ebd5209a79b5dd7cd6be8c5ec542e8bd.1764677854.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3397; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=iGabLxvOaTsEc6gnsmnrQOoV0IQ9e8QdMHOGN5pZZ0E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpLt0pZ31WOgB0VMFnne+S65AVlHe3xj+WyfFEX PatlNh5b/CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaS7dKQAKCRCPgPtYfRL+ TknmB/41qeRHdMkgrzpoGJQ+MkNqy5KiuCyrIlsbWnaO5PqlMcT451Kbh41408+aWoM0UTGO+gc ojjz4p7AXDx+BC53aa607EykIjOX4Ug1l/28qMYpZljSQoL3jLpq6Eb9u0g+5yR/VZMpHObu7Py wDAhaVj4N5xt0O1iEB9HMwhu43hzIJEOCYzrpII79kg3XelDokG5U9q9PgT/oznWYZeo7DTjv8n I/K+ZoHM6RxgkDV7LDnnrnkbIQPgnBmrEhD01lTbxcJoh9SG+JdwVUmFNB/8Kjl1In4yHY4tbeu e8Jj+fo/KTC3Vrvrxybc2GW9LGYJ/vaFQERSdQRbx9+HTi0n
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Introduce a bus specific probe and remove function. For now this only
allows to get rid of a cast of the generic device to an snd_seq device
in the drivers and changes the remove prototype to return void---a
non-zero return value is ignored anyhow.

The objective is to get rid of users of struct device callbacks
.probe(), .remove() and .shutdown() to eventually remove these. Until
all snd_seq drivers are converted this results in a runtime warning
about the drivers needing an update because there is a bus probe
function and a driver probe function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 include/sound/seq_device.h |  2 ++
 sound/core/seq_device.c    | 47 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/include/sound/seq_device.h b/include/sound/seq_device.h
index dead74b022f4..a72380c202e9 100644
--- a/include/sound/seq_device.h
+++ b/include/sound/seq_device.h
@@ -43,6 +43,8 @@ struct snd_seq_device {
  *	Typically, call snd_device_free(dev->card, dev->driver_data)
  */
 struct snd_seq_driver {
+	int (*probe)(struct snd_seq_device *dev);
+	void (*remove)(struct snd_seq_device *dev);
 	struct device_driver driver;
 	char *id;
 	int argsize;
diff --git a/sound/core/seq_device.c b/sound/core/seq_device.c
index bac9f8603734..d746c8d0c58b 100644
--- a/sound/core/seq_device.c
+++ b/sound/core/seq_device.c
@@ -49,9 +49,31 @@ static int snd_seq_bus_match(struct device *dev, const struct device_driver *drv
 		sdrv->argsize == sdev->argsize;
 }
 
+static int snd_seq_bus_probe(struct device *dev)
+{
+	struct snd_seq_device *sdev = to_seq_dev(dev);
+	const struct snd_seq_driver *sdrv = to_seq_drv(dev->driver);
+
+	if (sdrv->probe)
+		return sdrv->probe(sdev);
+	else
+		return 0;
+}
+
+static void snd_seq_bus_remove(struct device *dev)
+{
+	struct snd_seq_device *sdev = to_seq_dev(dev);
+	const struct snd_seq_driver *sdrv = to_seq_drv(dev->driver);
+
+	if (sdrv->remove)
+		sdrv->remove(sdev);
+}
+
 static const struct bus_type snd_seq_bus_type = {
 	.name = "snd_seq",
 	.match = snd_seq_bus_match,
+	.probe = snd_seq_bus_probe,
+	.remove = snd_seq_bus_remove,
 };
 
 /*
@@ -242,6 +264,25 @@ int snd_seq_device_new(struct snd_card *card, int device, const char *id,
 }
 EXPORT_SYMBOL(snd_seq_device_new);
 
+static int snd_seq_driver_legacy_probe(struct snd_seq_device *sdev)
+{
+	struct device *dev = &sdev->dev;
+	struct device_driver *driver = dev->driver;
+
+	return driver->probe(dev);
+}
+
+static void snd_seq_driver_legacy_remove(struct snd_seq_device *sdev)
+{
+	struct device *dev = &sdev->dev;
+	struct device_driver *driver = dev->driver;
+	int ret;
+
+	ret = driver->remove(dev);
+	if (unlikely(ret))
+		dev_warn(dev, "Ignoring return value of remove callback (%pe)\n", ERR_PTR(ret));
+}
+
 /*
  * driver registration
  */
@@ -251,6 +292,12 @@ int __snd_seq_driver_register(struct snd_seq_driver *drv, struct module *mod)
 		return -EINVAL;
 	drv->driver.bus = &snd_seq_bus_type;
 	drv->driver.owner = mod;
+
+	if (!drv->probe && drv->driver.probe)
+		drv->probe = snd_seq_driver_legacy_probe;
+	if (!drv->remove && drv->driver.remove)
+		drv->remove = snd_seq_driver_legacy_remove;
+
 	return driver_register(&drv->driver);
 }
 EXPORT_SYMBOL_GPL(__snd_seq_driver_register);
-- 
2.47.3

