Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8760341DE0B
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 13:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554436; cv=none; b=Ee4fgqueo9CrsR/kk0Knu8a476PaWl6pkKafYP5FA5rrasFH2IqU5NAbbeyFe5knATmN/cj8/vcoT/yW6O9I6LNB8BQUhnB/nRr7HT9rjdqV0bh5Q8xdg6ZPdLkMRStYRBohCC+gNqyIr4+P8YtHx3KYG5H8jVnSTuHdMB/e4ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554436; c=relaxed/simple;
	bh=ogLsm0dQ9kJr8uvYBH6TofTXqR4/OtZ9XFVY4whvZYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gzM6U0YVqMLEgCyXdHbe6Lp1J1b9aWICbPYA8P3O/gBC5+hVDpdtACeVLIXxEJzX9fPua/O0/s0eaUDLlYw0f2kMnw5WJLdO9WjYRjztG9qEntg1iyb04R4qnRlb1LI/YkDwmPO7XT3LuqqaU53PAPKQr4CXrdedSR8Qb/Yd/MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FcGgPzzS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FcGgPzzS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4955158f26aso12363005e9.3
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784554431; x=1785159231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeDOpukEI38I7/JMCA6E//qeYpYkVI+SwTNXgVxv1XQ=;
        b=FcGgPzzSCtBsvrW4ryF6snF02YeWjxbYigF2xp42yzLyKzvV6OaZ+9DtBneBYVZ3mn
         /HVl6IO/zlLs+s4sXI1k0WMOUitx0asSjYMJSRTtyCpDl9RNEFL5Msqut6u0W7ujHLzt
         RkDC86uaA3JcYW0it4AN0tZd2vvMLdrpzxlWJnzFQTrIb8C1oIUOZ2JDDh3YRcLTlhVV
         JQiJeY3+NDvk/EixeNX27UpF3Zk9UPHP9uIM8NkhtDiaLU3+q/vTge1WDIgygia8ls9d
         bP6rcB8L0gVTrPnClztuBmGxohAvtUfc0WKbgo7KdXD0x85Ks5JTz6XkBlam8/pn1QS0
         Q/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784554431; x=1785159231;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CeDOpukEI38I7/JMCA6E//qeYpYkVI+SwTNXgVxv1XQ=;
        b=or4ZbpI1N/Xrl3UDqHww8mJ7WE4UvnMNUf2ns6tRMQpGT4DXVPF7XT2Pk97GPR2TfQ
         gSlZT5V0TZXCDHPHLwspcXvgYQRYNCCYji5I1E65bywPSoUahXv4SeGbWoans2lcrOaO
         JvTw7d+1tpcI3sL60782BkPWuv0KkykaLHjpAhM+r+mkNWXaITh9DfwEASe/0pSE5UQ/
         bBObj8q5dnYWztzUSK/kZgLe44Qr6/7Ftea9joo0Y1LPpV1KhOUjfZNdJTeuZXXq4hOq
         XVLXEY/tkn6rNUo7JbKkBx0chOuPWyUhwp+oknfw7JET8OLTWmVvW5RtQznQpu5oJlw/
         Agtw==
X-Forwarded-Encrypted: i=1; AHgh+RpdUCX76dB6eH6hzJP2gfy9jBF73teFuuAi2xYm+ccQq6A1/8uNEfhb5UuGOyVi5rhFWTpjTWHY7fhLew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+M6+qpnFTjcIln6q3jaSCozx4wz7viTUncNGRj0xnQrqnHBxM
	QaXn9sFUfhGd5iFUo9OTW8gOE35ZbS1/i22048arg5CVJrPENdDIHmzTA/XioVumzoo=
X-Gm-Gg: AfdE7cnOgQpyNtP1x29MPxWr3Q2KbKASiDaGnwRAtE/C9Bgo4jhBkOKNiVtGPaFiZt9
	lVJ0muZtM+Zfsg+iDNd15CmZwO6tOCg7yGsIU1SqI3NvelM0PlZO8Bnecs4xkYOCFEjFugb4dJ2
	NB2TfzV8teTBY8AZ5dY6KVer16T5J3Dh4c0jU+m6H18p10Cu1HWecPUFTBNGVM7yvLzoqTPzW5d
	PYGNfmKFoR5zIVZqHvFixUFtlyp788fE8rmLBUQs6g9A9szuaZZd+0DY5d4ZXgK0XsiZKdboQMz
	Lci0CJ6cqmiNEzlJ2FIWUwORoqCQ09r7/ZIL/Uuy5ClQLDUgQjXpCvTarRAdrml3Sm4B4i72MH6
	qpZTNlKAAw7/Af9tncR3PdTascAA7m23i38hFhAKX6zqHIF9xq2Dtvpkij4N+yBumkududOwg1Q
	jL3SdjpvKlDEhd5p86E6+qn6ySndPh2qR4MP8k3lO6xzf317FdAJcKkA2m4dfIjzZNsw==
X-Received: by 2002:a05:600c:198d:b0:495:5062:17f9 with SMTP id 5b1f17b1804b1-49550622f5cmr110304025e9.30.1784554431485;
        Mon, 20 Jul 2026 06:33:51 -0700 (PDT)
Received: from localhost (p200300f65f47db048587886ecb5b26b2.dip0.t-ipconnect.de. [2003:f6:5f47:db04:8587:886e:cb5b:26b2])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4955370d78csm161360505e9.12.2026.07.20.06.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:33:50 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2] soc: qcom: apr: Drop unused apr_device_id
Date: Mon, 20 Jul 2026 15:33:46 +0200
Message-ID:  <e8b352f33ae38df3616dc157c1cafd13d49c5e3e.1784554037.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4691; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ogLsm0dQ9kJr8uvYBH6TofTXqR4/OtZ9XFVY4whvZYE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqXiO69C3f+w/W4aap6VkF3kX9s/z2ohlgutdaG mRVIlS1V9WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCal4jugAKCRCPgPtYfRL+ TrddB/9unsx9fyLK9AplJlW+Ap8Qi6TTCEVFsTOhTVmlEkDnkZWAtEmOA1GB1m3Ef196oq5sh4v YU5mmgo/Sk4hqIYAV57QAWaXyVqX1O1+f7s4SjfELeHi2L6beiG8cZXvkj85x5wjtHLBBTCCe2x qhZkDwwMax2n2u2aOIIEPWOt1hx+34rtXC6PGX2YBS3uO2G9dG/mka8OMjMGTwsRz0KGflP1V/Z dbDwRONC239zR0h5RI95eKG3iSQPkYLrSiHc+gUEfTx28pBLpZCMkXPoPANk2YHMyFkiSP+q6ev J3m3Rn0XZUOjmDDtrbUp8Y34Xetgr7yVlOYijGuFcpNoDlfD
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

apr_device_id was introduced in commit 6adba21eb434 ("soc: qcom: Add APR
bus driver") in 2018, and since then not a single driver made use of it.

So drop the unused id_table pointer from struct apr_driver and move
APR_NAME_SIZE to the apr header which still has a usage of it.

Note that with the id_table being NULL apr_device_match() degrades to just
of_driver_match_device(), so replace this callback accordingly.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

v1 is available at
https://lore.kernel.org/all/dee008af1510ee2a71087f3798814dd516730413.1781517268.git.ukleinek@kernel.org
.

This is a rebase to current next which didn't rebase cleanly due to
commit ad428f5811bd ("mod_devicetable.h: Split into per subsystem
headers") that made it into v7.2-rc2. I kept the Reviewed-by tags anyhow
because the conflict was easy. (Not trivial enough for git to
automatically do it, though.)

Best regards
Uwe

 drivers/soc/qcom/apr.c          | 25 +------------------------
 include/linux/device-id/apr.h   | 21 ---------------------
 include/linux/mod_devicetable.h |  1 -
 include/linux/soc/qcom/apr.h    |  4 ++--
 4 files changed, 3 insertions(+), 48 deletions(-)
 delete mode 100644 include/linux/device-id/apr.h

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
diff --git a/include/linux/device-id/apr.h b/include/linux/device-id/apr.h
deleted file mode 100644
index f282608ea018..000000000000
--- a/include/linux/device-id/apr.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef LINUX_DEVICE_ID_APR_H
-#define LINUX_DEVICE_ID_APR_H
-
-#ifdef __KERNEL__
-#include <linux/types.h>
-typedef unsigned long kernel_ulong_t;
-#endif
-
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
-#endif /* ifndef LINUX_DEVICE_ID_APR_H */
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index a397213bedac..4fe1cd64292f 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -15,7 +15,6 @@
 #include "device-id/acpi.h"
 #include "device-id/amba.h"
 #include "device-id/ap.h"
-#include "device-id/apr.h"
 #include "device-id/auxiliary.h"
 #include "device-id/bcma.h"
 #include "device-id/ccw.h"
diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index 909e84f84e0c..2e4231092088 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -5,7 +5,6 @@
 
 #include <linux/spinlock.h>
 #include <linux/device.h>
-#include <linux/device-id/apr.h>
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

base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
-- 
2.55.0.11.g153666a7d9bb

