Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E838B312801
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764678997; cv=none; b=KPjU+oWiHAjd0EwDkfEt+s2IGTkbrTZTzXEw3FJ43toEiJYes0ODfvn6hCxkH7OeYhMoRqzUCk/zSh8jm/UOePUJYgECNlrTe7QI0JyNiwHZpgbp5bU4estvCLm9iWSY3Cj1e21fSRq0LS1IBT6hEafisaWXSHP6Z9KyYiUtr94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764678997; c=relaxed/simple;
	bh=005gVy7wCsrU+4AMkW/IcaeytVy43pwbUJvd5a2oGjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n0pGIbRDzudzC5ksYlp/HgJqT/eiA3hmrg7DanHADdxwG9Ko76f6/f4anw3Y+ICUHY8sSoQN9jzppWHx0BwaQKwvB4svO8lxqV3In/PRh1u3WIBxeYa+NXREdA203fzskS28rqINIeVa8TuyBZdSZSTO92rRC9yRtNdZzrB6wGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kPyagpwy; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kPyagpwy"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b735b7326e5so1045186866b.0
        for <linux-sound@vger.kernel.org>; Tue, 02 Dec 2025 04:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764678994; x=1765283794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnNM7qYoEGtv4aajSCnVXD/Zg1HRajSpdsR58Ula/XQ=;
        b=kPyagpwyFN2B19p0lr0MX3KxnRONo70WzBAOUIDg1Ung6SDNnAUD7W3YCxdvdWR2V9
         dHE3kADg/Fd8JPAhmFRpn+b3KP2D3s60/ObdA5x7iw5to01bjR87N34/OM4TpfvQyEB6
         UmGCbdzeFCVAGeidkU8ORs5Q/hFqsjeovBnP4WRDfbOKdqlWc2FX3k4P/gnzEJbzGBt1
         my5Vd8ewTO5y31dLOOdSLJC794tKnRrLuU1KhPIuoLg0BWUr4WkQtH+Pqi6u1nedTYxs
         Lea+Xa33pMUi6gLGYyLZ1EXiWE/SBnIByGQ731vzpan5eYUiBJ+5lDsTjEisUsJFhXpQ
         wmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764678994; x=1765283794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nnNM7qYoEGtv4aajSCnVXD/Zg1HRajSpdsR58Ula/XQ=;
        b=aYebAg4f+V+PU7qXbf+OK6G2z9PVQNR7kPzFyEaTkJEIMATMXZLxciJ5mURtJPegNM
         kn0iiyUX7iWlwvtC6EmrzEVwVa6CNPBqat8AYralhM+y02tcrEVTrFmCQ9Tm4xJj3w+H
         OqUFvdBg1Y+scR2Y5yLLxtpTVAxtb8ctxRFgeVVfQ0ILSdZNJ/zzegtzH5QTQWVzV+Oe
         LVoxJfw4Fm9OKocL7YOZ+FYY9YvLxly2JM0SHjUNvG+ViAnYgWDbnXy7FJscGYljff4/
         cNQgXI7/foY8f+H/FViUSiLsW6l6OHvJkC4CTVjYGdhVDJWSw6SkOG7Fef+cnX9DGCtv
         J9eQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0EBokupT/oo3ZRMjuuVmCkrRWzc8pgnDFe2r4xcs4KOLhhqJXjwKA6HtN6hUdEh+ZdQNqWstt0A/IiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKhEoEr3sX8omAyc6OlOMq6FMh7edHSO8BIhhik6r1cfGkDxTB
	x77SkG8wE8S9jiiAPoLQSxZW4lQHyqYRn5iY3qfr7+4xk1cekZXFmZGfY4hR5urEMeE=
X-Gm-Gg: ASbGncsE3WFJgrjZl/8e72XDKmjoOnR0Q5nlTm2s3VlG+lvGvbU7JRzdyaJuJLtpEL8
	YQxnBejw6vGX2mx6H0klLzhlYjFlkNY9JS8cvEEXrXhvVSpRKipsUU+31vGsjgshH3V1yUrM6tB
	u8j41WuUfLUwSCr/P3oS/tFm6x6igHGcgUs+IWXteX51hDcPjXVC2OpUMrohOBtHHPQf/N5saF9
	HX+m0WK2MrPPO9RYitjE/ciUdwh+oZCQIhp9rTgNgh7MLXigF0OV0TSa8GEEuBWDIiigk3gV9Ic
	yjdh2Ocg5L+vJGRGRGC27cwURueiTmIqwmu+WY0C3pjNRb6iIKfLV9w972iW/Cl/PLzRYOTsjWE
	1KDPMfozGZq078H0E/ZbphqUjtlvZNMYnuHGJRL0kG5/To1rQDO/USRoZtrbr09kAPZ52H/O+H0
	6DYFEoAqDXo3CcOCBt1aaSdGjjfm1QeknTxb38Hdbd4QBpwfFkeKdfYcKYBACJJakSh6ySEBPx2
	GQ=
X-Google-Smtp-Source: AGHT+IH/lLXMV0bqiHiVTz3LVD8wnpUUAzGXRh2ODAB3FJGbiYd9+F9TFAAl+qBLcgTEmhvuCNzM0w==
X-Received: by 2002:a17:907:6e8b:b0:b72:6224:7e95 with SMTP id a640c23a62f3a-b79c2220109mr264762666b.1.1764678994166;
        Tue, 02 Dec 2025 04:36:34 -0800 (PST)
Received: from localhost (p200300f65f006608c90d1d7fe637464b.dip0.t-ipconnect.de. [2003:f6:5f00:6608:c90d:1d7f:e637:464b])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f5162088sm1527522966b.1.2025.12.02.04.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 04:36:33 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH 9/9] ALSA: seq: Refuse to probe seq drivers with non-bus probe or remove
Date: Tue,  2 Dec 2025 13:35:58 +0100
Message-ID:  <318199e0fff9bebdee432f01232cca205e443dd2.1764677854.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=005gVy7wCsrU+4AMkW/IcaeytVy43pwbUJvd5a2oGjA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpLt0+buEKJh2zugks8S8rLKIL+/A7KED62qc06 VbUXPOKFOqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaS7dPgAKCRCPgPtYfRL+ ThshB/4sfbjCBO3Tf16RWk2fbOKWTVCvNLiajOlVBzZTVltPJcGsOux6dXnkMeULtWRPsTGTwnG Ex0n9bCISANcURd19LDDaCK2TVVWXUVhTX45g/noO2s3cLGWG5ycFkAV6uAKxl3nve3sW3rLM77 WAxEXiUkx2/95BRqLnaf0elvLCYRVxcADAneiMU16I9JL2NNlGjsc8gr4izV68J2RftHAc1zYLo Sblwp55n/O5ym+8IMJFMcxzma4hJU7b3VCxurDRZR5qlRpgpPAstBwpncsYL/2g5oS7Ws6f51ji 3eU0svr2p1rCr4+xz6rErqtV5/uGA4lo8xgZo4AYMeSzzjLL
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Now that all in-tree seq drivers are converted to bus methods, let
old-style drivers fails to probe until driver methods are removed.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/core/seq_device.c | 27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/sound/core/seq_device.c b/sound/core/seq_device.c
index d746c8d0c58b..1b062d6b17ea 100644
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

