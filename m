Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6B13D7D99
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517882; cv=none; b=TDZV3DqUZk2trGfpUhzXh54ZDyTzAqrOF6P2W3s5loHkqfPlIDDkboMIX/cl0P6jArSLZ8LXz3N/Oeol732QwQAYssi6TAWmzOwQ3kEV6RR8pK3oUWEnUQyoFwmQG2zqeWKDRs+4c7OHSvO4KYQipI2ddTYT5JabV8ABY27dw/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517882; c=relaxed/simple;
	bh=HWOy5qI3cE3XDG2aY78lPGc4t10sB3g/XAplVhrp81o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GDD/7dqIUCK5I2VC12u3qhHJipoDgnksJqL6P+1OJ0m+weBvhXXa2ZX+eNea8Q/xVPr7uAJD+HU30AiNxaD69uZPLqdbyHs576a4aimOayNXEMS++uYGPFNKXGktWbl+tW7v0HnPwrOSyBGOX4y7zDytQiMXSCBIBBYPOnD89EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LRDJctQh; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LRDJctQh"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so2587293f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781517878; x=1782122678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=chId6eLdk67OpLiEbLar+llIOLem48s5WXHEBw8NInU=;
        b=LRDJctQhfTbqS6YbYE0rs+xwqmeAOUUcDEogaezoXdUH9gXzSA3gGEmXVEiT9CHmeH
         LPGwZyTe0WZPgBNbyLTH4S5Hz5cv2ehhOovpYK3WcccnO9Wt6uzbE7Alhpr8W3PhVzRR
         s59vSCHuppmSoVRYVYLeBF8z9aZF6IMSsV0Mh01m3LVJXdGEz9eCIUu4lQlYYqFCyETG
         0gEYOBjzBZXfPZI54bn6per6xiJWKWcM3IlKw01voJAdZVwGuHCBHK0om8c39Ork6I1T
         NqmPb9kQ0oDSSYKfmf5SL+c5q444Db7TyQh0N+IQlz+vVWr/UQcdJjR+Fq90PiCqZfzz
         enGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517878; x=1782122678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chId6eLdk67OpLiEbLar+llIOLem48s5WXHEBw8NInU=;
        b=SKOb/bKbqH3kVMkHdRSCRfec1SSBFfiqEeXRXuOj/UCZ//7t7ivbbd5phkldepKyra
         rk8P4zwi1/0fEGLIP+YkLmuZ4iy9lica95bHXN9dfaDxgGy15hBE/OkePsfk7MruP0/b
         CbBAqAh1OdO49vbkys6VYJcrl4naAPFa8Ppa8HDeDMF7XN6+p/viHttCU0VbRkiupbJ1
         FlzTXVBxFTbLmulMHRIRBnx1wn72Vw93w18MZaCb8aAUbXA5vmpDF/Ulvuey+oVOpx6U
         mhZm2TlsYMZnZLLfvADmMwCOO3kF1jJHyobWXZsxRHcJ6ossWrCi01Bo8lv7NDypLqtv
         2kIg==
X-Forwarded-Encrypted: i=1; AFNElJ8Zz0WRb2x9Q5Usd3S4I++L2+c/Sn0xrFcdHbYvGB/4Aag7wuJRnmfj/yWaAIWBN5i1trfSFx13firvvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7NbSPC+E988j+bWF1jH1IHqd8wHhoRpHInfQXAvNKuzE6QMsa
	jsUlmiZQGDDjstbjtLTc5rkJAIoOl6Aiv7IEqT1aOZ6YP/xa/MgAlSL1AoPZYxg/TJtJIWSLNQz
	r+kW/
X-Gm-Gg: Acq92OF7+ka+I9d16dMj0zHyxF2v804cBNdERvJmkb5gsmXb89R63x4upHGYlI0xFix
	qGmIISw7tLStndcM4LvG4LPxPuAen0oRamf3KhK9lB3VRXKtVvIg60cyJtwEIJWn+Uv6q6T79b5
	oRL6VIqd0fxaA/eJpeulQZQe6aw5DmnSQNO2sBo46XACQwa8TWOOpOAaWAXBqqBG036qopq+mlq
	FE2fbERF0pHj3Wcfu1qyTYerd4xLIQ4/55oxyiAAvFRtWNBBfpohjDaWNY9mh9N5GFi7fId26yS
	MO0h/ONX8gPrYFpkJ3vdHOns4Wk3tPcn25YB5XeMns5oEnPKdQeBn5s7A8/GVE6YJk3lNgD54Jx
	43FurXUO0aEKHx3D8BePWPMWrmzp/njIabHpC0LTysWa5wjhLqgAoveCt+zuIy1tnqBR8X9UwCI
	oGcg1jsw6PzbVoOmp1kdoDFWUbwTQCVEVPz1qEmpxmtiKGjXYlw85SJVQU1cYIssIsExx5d1ps4
	GmbzK34Qd2VY6g=
X-Received: by 2002:a05:600c:3145:b0:490:be44:32ea with SMTP id 5b1f17b1804b1-490ec4a16b9mr207550085e9.7.1781517878214;
        Mon, 15 Jun 2026 03:04:38 -0700 (PDT)
Received: from localhost (p200300f65f47db04b1d4be4b87a025dc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b1d4:be4b:87a0:25dc])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490ea94f5b0sm231746795e9.1.2026.06.15.03.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:04:37 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] soc: qcom: apr: Drop unused apr_device_id
Date: Mon, 15 Jun 2026 12:04:28 +0200
Message-ID:  <dee008af1510ee2a71087f3798814dd516730413.1781517268.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3433; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=HWOy5qI3cE3XDG2aY78lPGc4t10sB3g/XAplVhrp81o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqL84tUuQ9DV3X0CAvNauDcPbASZ2NR58j4lJBR RzH4qa/Wl6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCai/OLQAKCRCPgPtYfRL+ Tg8+CACmUm8o+aY9qCJjyOBmQb/ne/FIsv8OweqcwNMbpnO+dom4nyzGjnLH5SjzZxI0aQxEzjx DhqKPOehlLmEpJARER8x3RuMAWBmc1X9W+DQs78eDWLiNfaMJUOSnZgZ3XRCX3YF4LVBP3aoV9p wwJJP8R/vpsODOtaozb1rNn9G+SZ3HOk+64CNnR6Q/UfF+1RBsCSFNF/6VjzyJc5s4XhQKw45V+ xFZ5Gfz4T0DMslNP56GIKn9DW61rnxMFLvTooCIAhh4nLEL0azFKUUx1X34w88u4Yca2T6sLwWI bwK14ok7OPv/STlq66/9Xjf/ghCujagUtvo8rpXSzpqPApeI
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

apr_device_id was introduced in commit 6adba21eb434 ("soc: qcom: Add APR
bus driver") in 2018, and since then not a single driver made use of it.

So drop the unused id_table pointer from struct apr_driver and move
APR_NAME_SIZE to the apr header which still has a usage of it.

Note that with the id_table being NULL apr_device_match() degrades to just
of_driver_match_device(), so replace this callback accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/soc/qcom/apr.c          | 25 +------------------------
 include/linux/mod_devicetable.h | 11 -----------
 include/linux/soc/qcom/apr.h    |  4 ++--
 3 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index ea7f83916d8d..2073edb416a4 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -338,29 +338,6 @@ static void apr_rxwq(struct work_struct *work)
 	}
 }
 
-static int apr_device_match(struct device *dev, const struct device_driver *drv)
-{
-	struct apr_device *adev = to_apr_device(dev);
-	const struct apr_driver *adrv = to_apr_driver(drv);
-	const struct apr_device_id *id = adrv->id_table;
-
-	/* Attempt an OF style match first */
-	if (of_driver_match_device(dev, drv))
-		return 1;
-
-	if (!id)
-		return 0;
-
-	while (id->domain_id != 0 || id->svc_id != 0) {
-		if (id->domain_id == adev->domain_id &&
-		    id->svc_id == adev->svc.id)
-			return 1;
-		id++;
-	}
-
-	return 0;
-}
-
 static int apr_device_probe(struct device *dev)
 {
 	struct apr_device *adev = to_apr_device(dev);
@@ -401,7 +378,7 @@ static int apr_uevent(const struct device *dev, struct kobj_uevent_env *env)
 
 const struct bus_type aprbus = {
 	.name		= "aprbus",
-	.match		= apr_device_match,
+	.match		= of_driver_match_device,
 	.probe		= apr_device_probe,
 	.uevent		= apr_uevent,
 	.remove		= apr_device_remove,
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 7f44057aa65e..d74ff3ee1424 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -547,17 +547,6 @@ struct slim_device_id {
 	kernel_ulong_t driver_data;
 };
 
-#define APR_NAME_SIZE	32
-#define APR_MODULE_PREFIX "apr:"
-
-struct apr_device_id {
-	char name[APR_NAME_SIZE];
-	__u32 domain_id;
-	__u32 svc_id;
-	__u32 svc_version;
-	kernel_ulong_t driver_data;	/* Data private to the driver */
-};
-
 #define SPMI_NAME_SIZE	32
 #define SPMI_MODULE_PREFIX "spmi:"
 
diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index 58fa1df96347..2e4231092088 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -5,7 +5,6 @@
 
 #include <linux/spinlock.h>
 #include <linux/device.h>
-#include <linux/mod_devicetable.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 
@@ -135,6 +134,8 @@ struct pkt_router_svc {
 
 typedef struct pkt_router_svc gpr_port_t;
 
+#define APR_NAME_SIZE   32
+
 struct apr_device {
 	struct device	dev;
 	uint16_t	svc_id;
@@ -158,7 +159,6 @@ struct apr_driver {
 			    const struct apr_resp_pkt *d);
 	gpr_port_cb gpr_callback;
 	struct device_driver		driver;
-	const struct apr_device_id	*id_table;
 };
 
 typedef struct apr_driver gpr_driver_t;

base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
-- 
2.47.3

