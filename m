Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ED13F58E6
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 16:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023584; cv=none; b=P8K+yJxThV06gUc60IcNYa54yflaFeykEdpU/s09T+9QUWgCpN0ItMrw+f1efaJH/cCOs1E7nBz0s0izzW5fphwI77h2we+rPmpybMijW7Lg41BIGuHFDt/ORV4Lg+FrSyW9JM/SU91VsKeWTKkMg9dcwx9CpMXBP04084TDQfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023584; c=relaxed/simple;
	bh=c8vvjhG+dr8W1mdNKWooDjYWNckJZ0p5uwC9Wt2SYX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VQt2JdH4HaGvzDPdFln8iwymYp5DCycyPMtyKo5EhKbzYplI9YuTMFKBcETLpFiilxPVRx5ZGoAViwu6u3KHSfu4tf2YcDuutS0wwxxjhRB2ONf8whr1P3Szde/SNLy4F1lVXhAjoZ3+O7Q5mPFbkIRNBfYAgX1GAUza2SFOc8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Hhe8yjYe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Hhe8yjYe"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso48456285e9.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 09:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781023580; x=1781628380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ThiPpQUSTmrxREHZFPyuvAL4n1eFtMpBAHkdEMNjJ+I=;
        b=Hhe8yjYeeNi0Ga+87mMeGc97tbpeEi7ZZ+3EuRAj0ok6T4qve4A84HchmcAmlMC89G
         SfeQZHg1DsYuMwHQabhIBLnwhH1zVjDSwaABX7GOEJ7E5Lk/WO7E9km6Fo8droumGJGn
         1pbK1/9FOII+L0SOZycUX/rVAc4LvIUhdDqEs+BFS/Fd5kXvTJoFeCJUwfBl4Y5Pps2N
         EDWdIpwBxC1D42zx5LZbhPWcJTnbhjW3cIByVyvk5DFJ9dzCByIJO70nXhn+0pNRJWiE
         1TQRcdCTxltZjoShC1m8atGNaNY0xhfW+pWzE91F9pWRJOdrM1uB7rOwr8sASSfLBIcI
         X/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023580; x=1781628380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThiPpQUSTmrxREHZFPyuvAL4n1eFtMpBAHkdEMNjJ+I=;
        b=pX1y4Iw6tAo8Y+lFfYXm6igSX/HpbOITfZVL+FpddFA0zYnBnwaH1w/0P6SdBh4IsD
         wAJH8OwXMBYolslLt+mEoGz4zhisEhhu6PJoGgq4onzGhaODdWtksOJRZe66UtNbMpOn
         +9jViQQXX2B+Os+1sPWKb3i8an3U9yb+XlpaNpz2MXiTWY8vZaKYiP7EwcCbdoQ1CdDF
         j+MyEiQ460H9kmG02RKm7IR4Pj/KKzJmgJ/6RctfC5aNKK2CjLCtLaQgzlrgIkKHjaY3
         WPvRVucm+meA2ApU1p3zTB6VTVoxS/wBrOMyFVrQrXW8jiubZ0qWfOPhnErzAy6eoto5
         1e7Q==
X-Gm-Message-State: AOJu0YwmU1OysQ9N8lBdvsp4tkI0+PNs6bjBS6aD5Z1HJOqGXR/cR127
	OgyQN9/kLFh6o8lK0PdWuUTJYhOCuGFGL/4/2f7ytl0ZHPIbGOu29/lnWCDjKpYrmw4=
X-Gm-Gg: Acq92OGN5KUDJIzN8p51nwQbp9Prs+JqQdeTs2z2s4YczWIrXwLDQn17p/mUmsiL3hx
	WNVmv26XpIgDO+VWJIz+dGhUA05wlFthILe/mnq6eesic5OsM7rEjYP4bRdoRjOMmte0n4Clm1/
	8a5TZGZQSU7LzpCtSAJB18nECDPtmQGS4nGh/zFMcCEnHGHAHotOLcfWAXGuGclyoWW8NqyP0v1
	SiickTXxX1Jrgtd2D/PsbWhOex5Rfra66UmngwPub7leySPIitZv018PHhd6Myt/0yTAdrTIEZB
	3OuUp92bXkOOHTlMkLSEqRNCgaGRpNDoNsXuILeAjoqZlVKTBFpNVw64N/xya6pKHsLItoywrB+
	gwTx2QsTFmIgShg5oAD3Gz1JpWeX3ta7fb7zTAnrOcAcOAmiJ0xgoUjYEW8IJlA2PNLE6Z4vaeD
	/w+hV0GG42lcCYKA0YhowY5KV/Z9fXDsYF9PNyjMbl7OAqo86ypDznBv1xvMiyiIBq1S7s3Hsmh
	qmOrR3LpIXv2rmMT0/ZkiKdbA==
X-Received: by 2002:a05:600c:34d2:b0:490:bbc4:76a6 with SMTP id 5b1f17b1804b1-490c25eea30mr366980485e9.21.1781023580177;
        Tue, 09 Jun 2026 09:46:20 -0700 (PDT)
Received: from localhost (p200300f65f47db045b0dbdd314d8a71f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:5b0d:bdd3:14d8:a71f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46028a6dce6sm56644037f8f.30.2026.06.09.09.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:46:19 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] ALSA: Improve style of pnp_device_id array terminators
Date: Tue,  9 Jun 2026 18:46:10 +0200
Message-ID:  <47ae32220446ec1869898cf5e4b75ec94c32dfdf.1781023479.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=c8vvjhG+dr8W1mdNKWooDjYWNckJZ0p5uwC9Wt2SYX4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqKENTvibxv7RI1CKo7rohPWYyhsz3a2q2mYOSG wQ8GS46vpeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaihDUwAKCRCPgPtYfRL+ TkhdCACjlObTKT6iYdhQ37VeizFeby6EEC4KD0QS6sAxGSW/260tGnik4V7WE4izU9A54bOTLxc f8LNfrwSbzOT9WgCpfRNacZe0VUZ2InHrn1pSS2FcnY3ruszyRfECBe/ywImqByGVdCBTg5UNCJ MO6qz1zZAQg93DU5lSUhDDf2c49tjrvzKdJ9FFCfWwDSn1thidfx5nO6WbL3Ilv3NigM5jgZQIw UGYAZB5XwQaNHiUxRCob+2sj316YLqPpi1nJajKjg2XS/mOwUJZxXSiq4W4HYMOSj4lazRLWQ5z kkF+QcIZtkUV7rdD4Vy6nPfTday7FZr22otT8gI0euD7AQB9
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

To match how device-id array terminators look like for other device
types drop `.id = ""` from it and let the compiler care for zeroing the
entry.

There are no changes in the compiled drivers, only the source looks
nicer.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/drivers/mpu401/mpu401.c | 2 +-
 sound/isa/cs423x/cs4236.c     | 2 +-
 sound/isa/es18xx.c            | 2 +-
 sound/isa/opl3sa2.c           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/mpu401/mpu401.c b/sound/drivers/mpu401/mpu401.c
index b615a310c79a..c217c427bf1e 100644
--- a/sound/drivers/mpu401/mpu401.c
+++ b/sound/drivers/mpu401/mpu401.c
@@ -123,7 +123,7 @@ static struct platform_driver snd_mpu401_driver = {
 
 static const struct pnp_device_id snd_mpu401_pnpids[] = {
 	{ .id = "PNPb006" },
-	{ .id = "" }
+	{ }
 };
 
 MODULE_DEVICE_TABLE(pnp, snd_mpu401_pnpids);
diff --git a/sound/isa/cs423x/cs4236.c b/sound/isa/cs423x/cs4236.c
index 238065ffa1d2..ecce31b348b0 100644
--- a/sound/isa/cs423x/cs4236.c
+++ b/sound/isa/cs423x/cs4236.c
@@ -94,7 +94,7 @@ static const struct pnp_device_id snd_cs423x_pnpbiosids[] = {
 	/* Guillemot Turtlebeach something appears to be cs4232 compatible
 	 * (untested) */
 	{ .id = "GIM0100" },
-	{ .id = "" }
+	{ }
 };
 MODULE_DEVICE_TABLE(pnp, snd_cs423x_pnpbiosids);
 
diff --git a/sound/isa/es18xx.c b/sound/isa/es18xx.c
index 1a02da1679d0..3cadbf7cf238 100644
--- a/sound/isa/es18xx.c
+++ b/sound/isa/es18xx.c
@@ -1935,7 +1935,7 @@ static int pnpc_registered __ro_after_init;
 static const struct pnp_device_id snd_audiodrive_pnpbiosids[] = {
 	{ .id = "ESS1869" },
 	{ .id = "ESS1879" },
-	{ .id = "" }		/* end */
+	{ }			/* end */
 };
 
 MODULE_DEVICE_TABLE(pnp, snd_audiodrive_pnpbiosids);
diff --git a/sound/isa/opl3sa2.c b/sound/isa/opl3sa2.c
index 88eada933a1f..66b1e361c101 100644
--- a/sound/isa/opl3sa2.c
+++ b/sound/isa/opl3sa2.c
@@ -125,7 +125,7 @@ struct snd_opl3sa2 {
 static const struct pnp_device_id snd_opl3sa2_pnpbiosids[] = {
 	{ .id = "YMH0021" },
 	{ .id = "NMX2210" },	/* Gateway Solo 2500 */
-	{ .id = "" }		/* end */
+	{ }			/* end */
 };
 
 MODULE_DEVICE_TABLE(pnp, snd_opl3sa2_pnpbiosids);

base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
-- 
2.47.3

