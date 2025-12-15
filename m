Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA1D30FC04
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 17:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765820989; cv=none; b=OKLrkt9KmOZsJE4kP0YqStRfXQ5KrkuX2wusY+i/a2N0bj40gkTuPREYE8n3pcJQL5ztIvoKTM5JJyIHfuu1FDFCQIz0EzFJEyIMKUzQjM7PAE/OLmSeegvcPwwdsRBPvsSLjqREg/ukuCDJqe83cQtg18qpcQClTRrtEGd2T7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765820989; c=relaxed/simple;
	bh=PAmBLmRiIkXe9rNa5lLBLU+a1+l9BlQA+ShgbVK4cFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oHTaLLrpo3X8MWZvjVGzA1bIrAkeq/C9qWjcQaQnY17CiEa/J4eENlW57VYNEDuA4NztzSUeOfNCAisr/eHxp88NqdHG66CCVYawA7oQUbKVTBCbJHviOTsQJKR5pjtwLoAxo2aencoK13H7MFo0oszOKsoDibxbyUCzteHTQMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=I41IEgQd; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="I41IEgQd"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b735487129fso639907566b.0
        for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 09:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765820986; x=1766425786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZumfcNGGgSER51rDR4phT/MXB2LlgC2V8greSsX2nk=;
        b=I41IEgQdME0VzHEXM+9GzGREfnNEE34Kb5G1IlQHVSkRe3r1XH4w/FLwvwIG3vDNUV
         QE1htvHA3WmEU79hM3YcFLU801N3YmtCBym/RV6EaoYBl0AYPO1baCR1qp37XZtVkf0k
         5uuROdS631ADv+jiqehGtfdxC7cIDQf9ijiCY2bTM+O58NHxHrlAkSnCX7SH/+UOByOl
         EPG0o6UaGhUs9FBY5apYdqmA7XGwuWOMVrlsc99a3kjPEo3g2GwmPRa2VxiKC9WG5Khx
         VDq3jNrEpynSeqYi1GigCvmsy2/kUNssizqOO/xaFAKP+Sxe8tjzn6VTZmI8DAi+JXyX
         FRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765820986; x=1766425786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rZumfcNGGgSER51rDR4phT/MXB2LlgC2V8greSsX2nk=;
        b=Fxe+v1qtDTeGOwPM+SBdwnv0Ox2k00i5rc7bdqjGvTDoJLj4LQpcCamGzMH/nHd8qc
         n1dt+tLJXaiZyozm/J+OiOO6wlhpYaPwMIrp5yt0WJJy/RR/+FdNtx3XcpEeDU35NoFE
         UOo9kGOawv/c4Qn8UEiPobaKhFqFnk0epseEJ3sdcNT4BViBeqCmdy3eviz3U8rm+MyN
         wJIW6INNAx3AS1VOd2tSfME/m0igcLPMk36y+HC778KoogeFb25udNTVEL3uA8URNwbm
         Q6g/UyZs8GLZZSkvfrewsQApwaEXvA8ri0GSLfY4WGMAdHpAoP4sU51qJSS0s5fPySL0
         UT0A==
X-Forwarded-Encrypted: i=1; AJvYcCV2mR5S3iy1klRNoOXvPFFMmonwMd5x3vS2Rdlg9zt+zOTWlAeLuyjNuYuu+7MdTC06ETNY8V2CAD29Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlrxnDvwZ2CstEUtuvdPTHKidlD5QEFxYPu34D7rudSElgZFef
	pJ2NeO3mAA45hi8G3IW47wAY/BgZUMiOPwYaToOanYXH7fUVEmYmBCO41zqobZBOX/U=
X-Gm-Gg: AY/fxX6VWPZXyJI5D2TmaGoc1AlTHoiX+DwFMveQZR3l3SbXxjqc5MCgX/3lZWx7vfD
	AGvWDwDQob2SFefQFDQQdtwRrDkubwutJVKtdpu2yEqcwPoUEVBcUjWlozOPesfxbeBWxB17pod
	0yepaiDnyUE6wNtwHtSDPwdTjxDFW05iOcWBO1eQDeCSfZBBPVSfc2b9B1USLzLNZlkXduru7M0
	tgL83QjTWbg4SjiwhUcM/7kU6BnlQa6OP0pmmfUsu/xROrIDZpffJmjp6U84NXUnfq41hB3k1PJ
	G1w4dJuMTBSEOeFEKohrlsGu5tf0fkSiLZR6WvKMf7wFVkesIw+OplgAllGdvAAWhSDNQmN2ByU
	aZzW4At0/hAywhleqtMK0mbQnR/JwFsOyKUcsz1a3MQD0x6nLZc6N6JfBFCy64jySqJRh7DonUU
	RkVAfCGiFKf6JRgmLRom/pUfT/3ifJYAFwb9Mpd16YX/KzhCgwMZcJ/bRWy0yWM4QyQHKmXju72
	drQeEEyrOuJNw==
X-Google-Smtp-Source: AGHT+IFl3Bpyn7X8AAKzXIGPAZPZ/c5ujpcKxh9IlvWoZx4DfJ3Rw+CgIUqSciBohfCMoI3C9mU+Lg==
X-Received: by 2002:a17:907:7e97:b0:b73:8e7d:4f91 with SMTP id a640c23a62f3a-b7d238baa3dmr1152490766b.41.1765820985967;
        Mon, 15 Dec 2025 09:49:45 -0800 (PST)
Received: from localhost (p200300f65f006608e858c1c813bae2c0.dip0.t-ipconnect.de. [2003:f6:5f00:6608:e858:c1c8:13ba:e2c0])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7cfa517585sm1477115466b.41.2025.12.15.09.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 09:49:45 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org
Subject: [PATCH v1 2/2] soundwire: Use bus methods for .probe(), .remove() and .shutdown()
Date: Mon, 15 Dec 2025 18:49:26 +0100
Message-ID: <20251215174925.1327021-6-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215174925.1327021-4-u.kleine-koenig@baylibre.com>
References: <20251215174925.1327021-4-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2617; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=PAmBLmRiIkXe9rNa5lLBLU+a1+l9BlQA+ShgbVK4cFU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpQEouPMZH+yO4nYB2FjSPyoSVldocQPtF07LGP iIiz63AbdGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUBKLgAKCRCPgPtYfRL+ TtTJB/kBPhkLg2oQsrNaWNNPQissHmhwQBvrq7DT/l1kwtfPqo246gTzjGnFBkG3ydyYP1n+Ckf gVyef7KpkMORtyzVuPP/5255b4TEh2reQ9w7139uf/E9yG+PUkS2MqrVNSUgjAKk1Xx4Kc/Ic2W Q2oL/cqHwypUPc9L33TAZSh2+zTcW14r0P9miwZh4Tvif/u6K8vKokUkM003K3911Qgir+bjzAv y73RociY0aJZW1//LnCsGrAE6M/IcClZGLZLxh/JJ66wU9WH5biuJpDhJxs1ZUTt3NeLs265HLo EkDc5+FZWXZ78KqV53Vtc1kP8YOwf/BjJy4BTxtK57z9qy8D
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These are nearly identical to the respective driver callbacks. The only
differences are that .remove() returns void instead of int and .shutdown()
has to cope for unbound devices.

The objective is to get rid of users of struct device_driver callbacks
.probe(), .remove() and .shutdown() to eventually remove these.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/soundwire/bus_type.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index c40de98f1485..80ed3468e860 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -72,13 +72,7 @@ int sdw_slave_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	return 0;
 }
 
-const struct bus_type sdw_bus_type = {
-	.name = "soundwire",
-	.match = sdw_bus_match,
-};
-EXPORT_SYMBOL_GPL(sdw_bus_type);
-
-static int sdw_drv_probe(struct device *dev)
+static int sdw_bus_probe(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
@@ -164,7 +158,7 @@ static int sdw_drv_probe(struct device *dev)
 	return 0;
 }
 
-static int sdw_drv_remove(struct device *dev)
+static void sdw_bus_remove(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
@@ -179,19 +173,26 @@ static int sdw_drv_remove(struct device *dev)
 		drv->remove(slave);
 
 	ida_free(&slave->bus->slave_ida, slave->index);
-
-	return 0;
 }
 
-static void sdw_drv_shutdown(struct device *dev)
+static void sdw_bus_shutdown(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
 
-	if (drv->shutdown)
+	if (dev->driver && drv->shutdown)
 		drv->shutdown(slave);
 }
 
+const struct bus_type sdw_bus_type = {
+	.name = "soundwire",
+	.match = sdw_bus_match,
+	.probe = sdw_bus_probe,
+	.remove = sdw_bus_remove,
+	.shutdown = sdw_bus_shutdown,
+};
+EXPORT_SYMBOL_GPL(sdw_bus_type);
+
 /**
  * __sdw_register_driver() - register a SoundWire Slave driver
  * @drv: driver to register
@@ -210,9 +211,6 @@ int __sdw_register_driver(struct sdw_driver *drv, struct module *owner)
 	}
 
 	drv->driver.owner = owner;
-	drv->driver.probe = sdw_drv_probe;
-	drv->driver.remove = sdw_drv_remove;
-	drv->driver.shutdown = sdw_drv_shutdown;
 	drv->driver.dev_groups = sdw_attr_groups;
 
 	return driver_register(&drv->driver);
-- 
2.47.3

