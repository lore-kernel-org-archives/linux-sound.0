Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FB132E135
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 12:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283966; cv=none; b=uKR10flwFGqsvR5FX1tryIteh11BhZtQdAzj4Vzaj1VkynyFd2uXyuKGyDwBTWEXjjAjcDa5row3WPTImMD/ZhLQxFyiL4b/JnrWtCreCjMNKpm4176mbvdc5qE8XoGSBkbCnFERvjgVfb2S5hxT4F5tVGzL/0OvkdwJ2vZnTyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283966; c=relaxed/simple;
	bh=Uckx15FI0HMetU9IoMXNKPZsM1EkWPmUJKZxz0rM1JA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=msUjCyXp8PQq/JZa6+i7HWbACF+dzdfNKbbVOLHtc6PKCEk6LDtGQvqdYhIAR1+OzDMoJh6Pa2faUy3FOpV0OFgTYu3UmMzRSjwpynfq60BhJQuPMwqdUQMWrONoNKxQ7+aceh7k0rP1pcpdpnicwh3JaQz+5vg8QgMQBQT8394=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Hw6S5FOx; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Hw6S5FOx"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b736d883ac4so968850066b.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 04:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765283962; x=1765888762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0jzW1sYVCo65E+h93H90mb9AU9N5WRH18OjTzwFOp0=;
        b=Hw6S5FOxXtntzKXQR4Bvwd583EdwcK/elKQO3Jgp5mvBcG7QYQoO/KAlnh87KuNKJQ
         UCrRNhNiT6Nbx77KzZhvYIH9lN/zTNiCvVQks2Gh8EMhAvmI+aFpdSNhhJEcS2WExa/t
         Su/SL3NhjSaS979N4PtT3hnNDW8GKuxN8ER2y22yxsP7SGBfnfJvd2FnioSNGKDCnltg
         Z04xd6JowG/VCpu6cYFr96MKnFQWLq7IpVce/UZpNfHjBJvfVh0UjC8P6ltkkpAPq2f5
         NgITurrDXi3ysNowctc/d5VSwa8G/osJh1uVIRMKrZ/zIL0K8X7NokEc/FrGjVBHH055
         6dEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765283962; x=1765888762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/0jzW1sYVCo65E+h93H90mb9AU9N5WRH18OjTzwFOp0=;
        b=W0hRHJ6g1aXXNiuNQ9KXnYqMB3SwN/0WeUJVpRNjS2FNa66IvBOQFbuYcNo9ctOJaP
         92PdJGVmYMzS5n6+xqw/64RTIGE+MIKz2t46tTxS3ZwrSwnLtC9/fQt8jygoWj3JhcII
         DC4gkj1Lq15rQvv3cPshdjPoliOycDsztPBWJKzzJPCcVhWVFjevpBFxhdSATnRxadY1
         z7E3lGeVFJFO7o4EWngiiNC+FT1CQOI8zTd3VH6cUP/R5oo51+L2N+C5V6dyOtYycD9M
         sVksavSNHHMoKXjLeHC64VQrt1b9iNEbVSvhp9S4BemD/lhuTLh2SNFSGOt/djgyF1kb
         0zZg==
X-Forwarded-Encrypted: i=1; AJvYcCVqTkllNnHE+5bIyqrkOrw/7xpH3azVeC9hcxGBmQ41cWcW5i7lD1GakMmloYjzdzMzyNxqOWQXEHFxog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSGWMvVEvFLJPJdapCxKalXWdMEzBc5BaHMKZ1qFC5Bj4UHjdn
	c12xCeKZ4dVWvX1vhVeKBgCxbDPi6lz55Md4nwsxLhLWprp3Ocx59sQhu53SHy2xh7E=
X-Gm-Gg: ASbGncsdE2XFShMy5zuNufxigTPqvZHJawQGp3wCsvn1TOTo8YufUdB6EuyKcujEiK4
	OekWNQnOB4blv/J6EvgzsDv7+dU18Oz5+IPppxPmZ4CG8HFTfxT9K3maUDvXmi6Bk02JQMDI4bJ
	M/c1Ev/hl375G3UfQmv/kUvXV6F3FEcAAKpjruBGs64WtwRIqUmbaKDsEuXPEjfO/Xov1Rcf7Fx
	2Lbe7+Zj2l7RP0X1UAzwz4m1R3EmpldbMTf6Q7/VcLBTwMRFPoGo/V/9ZBjvQY6X1zgtR3JqGs1
	JbQsSsSdOre/tQVYPS56aMkZWcxNEzHmZh38tFPTy/+9aJssk+swR4e5Igf9mq+KMnrlkBHktyI
	0dwbFNFRIeB+P8Pr/61yoy+Ss7QNczR6sU+FKt5icUD9OMro6cENC8Sd+OiexKFIpNXpg88x2+g
	5+ZyUvrpxU8H7AMRDzMSZ0gZpnyasTovXBnu4kA4ATbG2LWXKOQkfyrk9ZsEI68si5mVZDY622V
	ehdF3GQMYAyoA==
X-Google-Smtp-Source: AGHT+IFi/v2B2tVV5jA55DRYVE/xwDzAEPAg9Dnvp27NS0Wvr9Ye+OTSgmRMvlermzuVBnRaaJU7Xg==
X-Received: by 2002:a17:906:3b4b:b0:b7a:2ba7:18be with SMTP id a640c23a62f3a-b7a2ba71921mr710293766b.62.1765283962141;
        Tue, 09 Dec 2025 04:39:22 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b79f4a2f19dsm1398755666b.64.2025.12.09.04.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 04:39:21 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 1/9] ALSA: seq: Use bus specific probe and remove
Date: Tue,  9 Dec 2025 13:38:43 +0100
Message-ID:  <f36b01b297fc5cbb6d0ed4959143add0c13eec99.1765283601.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3397; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Uckx15FI0HMetU9IoMXNKPZsM1EkWPmUJKZxz0rM1JA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOBhYR10udElhyCv98zddvy210KYFAqRRjXeir /nZWD0UC7CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTgYWAAKCRCPgPtYfRL+ TvPgB/9IEB8RiP3OjrqEqD/bPATqfskiU99GtParYxOZb+E1ELQ67dFsJpslC1oqP9ffOeQ4RX7 OP6hINgKQevedJ7GbrLVGnFnf3kbdZeaJVvs50nFMzuuuOee2iDoWKeFhLOV2CuKlnO/onQdTi1 uQz9gZoMczg7NcAKAyaya1b8JmeorGgkOQ4lzGq/zFECEEgH2DVgADvqzAU4nVgREPJTCQiY3Ay C8sIZyFdN7WkbiEDygWwPPaQgczgEM7XPrl8mW1DZfAyHV+K8RXmf2SPYN5dZbH73h1L2gqeYTX YWLa17rtBMHntd7BSzf2e1eYITRO2fE8vwLjE/Z/GiBsZ+9Y
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
index bac9f8603734..01def5b739a6 100644
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

