Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B925D13D28A
	for <linux-sound@vger.kernel.org>; Fri, 20 Sep 2024 15:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726845023; cv=none; b=svmx2FjeEW42OHdC595hQdXXr7YTUK6Mj5ZjcICujV8OUk3nb63kAisghS+CAJ90KvNSSgWRx0L0JjhNypj0Ufo0vKSG5zSa4GD3DRBM6iK4/9K1iKx8nTMsPonDHK3MOnea0yPIwprygJ4YyzCJFnSwAMhsvUc/oo3ehFzpN7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726845023; c=relaxed/simple;
	bh=UMPI6dbr3vZF/IEea0Gxx5qCUzLzf9e2xNJR+bN0i6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f/wqB3F6ItTWS8wYFD/6/7sPOPmXA0KDOq+v5hneRkFcpizwwq79Uw3mNGoh4YOwfcGfDH4KXUzb0XmcLeIjJXD97/BAQMKl3f6cDsRIPFEiUWnb5c/nGdT1XGujkRrSJnwc1jhh67vQzP+rqZyukU2B55fgy2Vh8vfjpzHVhv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vRSpfDQp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vRSpfDQp"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cb9a0c300so18504635e9.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Sep 2024 08:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726845018; x=1727449818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dqxB4KzGedlZDzswgDTRSffnag1Yh8CdsgK618Kt3iI=;
        b=vRSpfDQpPG23yYCrW0VtQ7XLoaHq31n50/ipJ6+4BjHx2Il8WuwD5IIl1ieAvp2KER
         opB5a04iboKiKbOwRyX5XXTdYlvEtZP0zjNHxTeiJe8Qo7a3ZeT9e76zHxPNNJ00rnMc
         8olt9BZJ3hN9hcrfkUMxnWnPtE9cAPNax/0aj0+qegWinn8M2ekD5S2w170cmP7OkN2z
         EFr9htu0ZlAOPxS09OABBwqDlMy1gg482+O65qr3oyk1miNM4s4WMumyFVvaLQN8zgav
         H2+wWnV0G76ydeFE+dDHW7PIbw0c5PWfToXshm1jhftk3C3WU93hg00V41ZCk1DwkNWQ
         p23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726845018; x=1727449818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqxB4KzGedlZDzswgDTRSffnag1Yh8CdsgK618Kt3iI=;
        b=NEeoEF0AWwXhItZAuj+3H2K/6uyMUl8LeddtVyRaQqNgTqgflqkFIc+NiHVRqTsCtT
         /I1tFsNRT+oCJWBQL4wPnCB1zC5X2FJcJhUFHRoY5p4Nm3OCp0Ph+vktuCArSQ9kCE87
         Xx8FsY3CtMhGwHui7nV9qq5nCp77Q1SDEoOlhyTMqBOSOhjcjzB3IP6Gs8UcKqCEKpdt
         l1DlCpNtJHDFFhQwmIb8q+yVTFumDaJJZPIyv1iWOtZZsPD4pia82kGqYP/dJKf68/rS
         +hv3a8DSM4wKrM6WVk8h7ojw/+CkJedPsZFrsndq21dthTBUo9F1rU0DGmxQBKXvBB1m
         HTLw==
X-Forwarded-Encrypted: i=1; AJvYcCWB9i5KPzUvUMZiMFDvtl5ikfACBOiZ556N5ryHqbdYfyM+pc0THGEkvCnmCoYhVoN6W5Rg6uyQQKfiEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP1r1yHnkKePymUmLsDWnA5j8YPsw13r57ep1/BFSJ9oJBuuHB
	YiEZUNUgM/qQzv1TwDbYtqwnZldd37PlPT1CsRFxoNdH/Gy/aU7WCVfjX8f2xH8=
X-Google-Smtp-Source: AGHT+IG4ybmvfCPFK7GpLPZJ9S6gMbOoQX6B/i66eB46HTLEMiy8K/MDelU5eMphLtP74FLdVw9wMw==
X-Received: by 2002:a05:600c:1d85:b0:42c:c401:6d67 with SMTP id 5b1f17b1804b1-42e7abe12c9mr21430965e9.6.1726845017829;
        Fri, 20 Sep 2024 08:10:17 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e75389c88sm54088995e9.0.2024.09.20.08.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:10:17 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linuxppc-dev@lists.ozlabs.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH] ALSA: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Fri, 20 Sep 2024 17:10:08 +0200
Message-ID: <20240920151009.499188-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2252; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=UMPI6dbr3vZF/IEea0Gxx5qCUzLzf9e2xNJR+bN0i6E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm7ZBR/8GCUV4aeWj8Lb2TYNLJVkJrXibxwUuPQ 5Sqo3ZScMyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZu2QUQAKCRCPgPtYfRL+ Th38B/wPssqPeUx8jeBlsp1PHwKwqwZKv0klqLgfgERAspSV9HlI9RhbIl5FNCUL+XdJvUV62A+ Jy0sEEPwbrSUxzs5FY2CGHw1mLFG38sJVTWAcAQvGAiNQQmpZWeUAmE9ypN2EN4oGnyA+OxmR1W p7uFRCfonXSQay49ptoU+YwMGcVz2sfBfYOOEcaXufzilvyMVasjLMnvG2o5TME6VJQE3FVYVxj XgIuqy6O9iFMl5KHMxWyoGPHtSHoWly2reMtLnsvHUtRZjyUZhy0uJV2GAeYeev3xwORxOoGBQM Pt3kHzQc/wQNGfPt/6j6t/pU32qov0X5Z/ManUH30q8z9FQw
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/aoa/codecs/onyx.c         | 2 +-
 sound/aoa/codecs/tas.c          | 2 +-
 sound/pci/hda/cs35l41_hda_i2c.c | 2 +-
 sound/pci/hda/tas2781_hda_i2c.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/aoa/codecs/onyx.c b/sound/aoa/codecs/onyx.c
index e90e03bb0dc0..ac347a14f282 100644
--- a/sound/aoa/codecs/onyx.c
+++ b/sound/aoa/codecs/onyx.c
@@ -1040,7 +1040,7 @@ static void onyx_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id onyx_i2c_id[] = {
-	{ "MAC,pcm3052", 0 },
+	{ "MAC,pcm3052" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c,onyx_i2c_id);
diff --git a/sound/aoa/codecs/tas.c b/sound/aoa/codecs/tas.c
index be9822ebf9f8..804b2ebbe28f 100644
--- a/sound/aoa/codecs/tas.c
+++ b/sound/aoa/codecs/tas.c
@@ -927,7 +927,7 @@ static void tas_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tas_i2c_id[] = {
-	{ "MAC,tas3004", 0 },
+	{ "MAC,tas3004" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c,tas_i2c_id);
diff --git a/sound/pci/hda/cs35l41_hda_i2c.c b/sound/pci/hda/cs35l41_hda_i2c.c
index 603e9bff3a71..bb84740c8520 100644
--- a/sound/pci/hda/cs35l41_hda_i2c.c
+++ b/sound/pci/hda/cs35l41_hda_i2c.c
@@ -39,7 +39,7 @@ static void cs35l41_hda_i2c_remove(struct i2c_client *clt)
 }
 
 static const struct i2c_device_id cs35l41_hda_i2c_id[] = {
-	{ "cs35l41-hda", 0 },
+	{ "cs35l41-hda" },
 	{}
 };
 
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index f58f434e7110..4b9dc84ce6bb 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -951,7 +951,7 @@ static const struct dev_pm_ops tas2781_hda_pm_ops = {
 };
 
 static const struct i2c_device_id tas2781_hda_i2c_id[] = {
-	{ "tas2781-hda", 0 },
+	{ "tas2781-hda" },
 	{}
 };
 

base-commit: 62f92d634458a1e308bb699986b9147a6d670457
-- 
2.45.2

