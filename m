Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCF61DFFD
	for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 02:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784427770; cv=none; b=gzzCEd74X+aKD66oVlPVco4nnFLB9E7DY16kenNA+wCpQIZq3bRZVmOXbdga+RTPratqZPvF0IkQQ4Mw4SfNSsXcmrGvUVPH3r1cyH2iJW2MNvCa0ms9r5jQlAG0m1Y+SthmYuy9aaoeKmQa/v9RtbMlw6fksn+R5NPfunScuNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784427770; c=relaxed/simple;
	bh=205PGOhWA3GiaPzxyZjcK2paETYLYmho/eXrULg/4NA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZWOwh28DlX3KBvkh6DiswQ4xhna02MLimzzDCFQa2b6nLIXG+m9AezTKPGPEbnWAhL4ETCgKqwJthc09RGMwM0GBmNNF6NW7dN4dswFugbheCxibw/vEHunwRrEJzcNnMjAu8MiWzi91jGTwdzIvbSQjqW1+nLc6dl2aMI1V8BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgMd3UGw; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgMd3UGw"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66825847b2cso2820558d50.3
        for <linux-sound@vger.kernel.org>; Sat, 18 Jul 2026 19:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784427767; x=1785032567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eflu4Al3WySioMoQONHlRvylppCSuqZirkAbybWJ4Ns=;
        b=RgMd3UGwl+d7XSbZz8/xVUUayKtnDSdl9UuDNalV+KfynfZZy6MUWam6PSmgFgngUY
         F4sQ+kg3ec2FhBkWSmsbrCQmBytpWpVW8mk/s95DlC85PmpGMdOLQDfRFLptpkda6vjW
         N7zoVFy7adHFBnXwPLxv/wFP2j/1MCKJLarWUXTQWOeI+UX2Gbt0V9kCYQ++C/KJDt74
         iQtPLmQQJukH+8oANp9stXKvue+9DNmQwFj6BGWXr+G3E0W13FLutz30dRvT+mD+rnsB
         Uvfdar4b5T4o82ZgTxf1b9PtfZNCF/LBiNvNmn6tGcl6cU8qjYyQdPSAjlY+nAqqbN+7
         0ftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784427767; x=1785032567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eflu4Al3WySioMoQONHlRvylppCSuqZirkAbybWJ4Ns=;
        b=c8YjnKfPvjbA4I+0WBYud3E4gYTUdBR1f8rmdIoQok7Gwyx6W9AsVIMYKr5iUtLOfb
         +KZ30O1o6m3jpsWDGRC5wqkeXc7Zooto7KJV3lZebaHF5pwngLzLexGbg3DRSLGSZGY1
         i/ffFSX0Av1fU0Pfb6jSQ+6FGfI37pJ6OaQH0VZ1bVU3aK/lk8BYx5Z/I9jUyRr4ZEoX
         BeBNIfp4DPHwUlEA978qX+DIOCG2/cypK818z3uO3PaNceRA7q0Mjjz4PWwlD8eTfBTk
         ZArYpLvd7AfWJzxR1lAmhXu63UF6oqSCiOCTqJJ/Fhj8HSS1A4sqmi7O0lC/VAjETt2A
         xOAg==
X-Gm-Message-State: AOJu0YwsLWPmF9HnCmNGSWs37lCR4vElNoHcmvKgbeUxhFyB3SvEken+
	MS8l7VbaAyiGQ8ZxMROSZakOV99o9m4h+assC14I3OqIXHU1RqfaRIo0t1Y9fHFH
X-Gm-Gg: AfdE7cmdbb5YRVYXIKjnlIuOv1MKPtTcCLwZ+hc4TL4vt4j71HQxY8lAgdSDCMaL7Re
	Rya3SIrq/zZEk/6q19gUfy+5YcNAp72MW4TxVpGm3V0XAeWLunHmsm7ZaCvZd1PL1dKele4UFxt
	YxaAcCM0GrIsIJIoyZROJ1ohKJu1nJ0khruqhvmRpKcWZmvuwvkLFiOGkgLoG1KXSgHgD2A5Z26
	tuiMpMuazmmmUu7V01yao+ryEarbe3/XHBe8cux6BU5wq5C145bz75UBrygd3l++DXqzJ8mLXou
	ZPCt5B6c8plXY/zt126gw3cNzNz2/5cYQgOYjHrr+6ZkRxwpWZrY45ig9BEqlKo+ugCg8/o3h0Z
	wvZbscVSeB8ng8aO7yqupI0g+7MCHAT618m34I14xOJzjUNukxXStaeGO0OdwvUDl/53beI8Fpp
	a5Q+m7sN4q95FA1fZlT7ywqfhy1VCg+ZlB9QiOl3XLGEXDnD8xDE79TwDAbY8JaayAEhJprA==
X-Received: by 2002:a05:690c:4d84:b0:80c:2874:67b8 with SMTP id 00721157ae682-81ef254a7d6mr29568917b3.32.1784427767541;
        Sat, 18 Jul 2026 19:22:47 -0700 (PDT)
Received: from nixos-office.attlocal.net ([2600:1700:566e:ba00:173e:d781:2a07:621c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef4033935sm37247817b3.11.2026.07.18.19.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 19:22:45 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: srini@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	arnd@arndb.de,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] soc: qcom: fix unmet dependency for QCOM_PDR_MSG
Date: Sun, 19 Jul 2026 03:22:41 +0100
Message-ID: <20260719022242.139472-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QCOM_PDR_MSG is defined in an 'if QCOM_SOC..endif', so its selectors
QCOM_PDR_HELPERS and SLIM_QCOM_NGD_CTRL also need to ensure QCOM_SOC is
enabled. Otherwise, QCOM_PDR_MSG has an unmet dependency, such as:

WARNING: unmet direct dependencies detected for QCOM_PDR_MSG
  Depends on [n]: QCOM_SOC [=n]
  Selected by [y]:
  - QCOM_PDR_HELPERS [=y] && ARCH_QCOM [=y] && NET [=y]

This unmet dependency was found by kconfirm, a static analysis tool for
Kconfig.

Fixes: f2866e6a27f7 ("soc: qcom: Hide all drivers behind selectable menu")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/slimbus/Kconfig  | 2 +-
 drivers/soc/qcom/Kconfig | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/Kconfig b/drivers/slimbus/Kconfig
index 60b0dcbc0ebb..5dded61191e0 100644
--- a/drivers/slimbus/Kconfig
+++ b/drivers/slimbus/Kconfig
@@ -17,7 +17,7 @@ config SLIM_QCOM_NGD_CTRL
 	tristate "Qualcomm SLIMbus Satellite Non-Generic Device Component"
 	depends on HAS_IOMEM && DMA_ENGINE && NET
 	depends on QCOM_RPROC_COMMON || (COMPILE_TEST && !QCOM_RPROC_COMMON)
-	depends on ARCH_QCOM || COMPILE_TEST
+	depends on QCOM_SOC && (ARCH_QCOM || COMPILE_TEST)
 	select QCOM_QMI_HELPERS
 	select QCOM_PDR_HELPERS
 	help
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index fd4d4ecd2df0..ef844947593c 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -292,7 +292,7 @@ config QCOM_PBS
 	  This module provides the APIs to the client drivers that wants to send the
 	  PBS trigger event to the PBS RAM.
 
-endif
+endif # QCOM_SOC
 
 # Options selected by other drivers from different subsystems must be outside
 # of the menuconfig if-block:
@@ -314,6 +314,7 @@ config QCOM_PDR_HELPERS
 	select QCOM_QMI_HELPERS
 	select QCOM_PDR_MSG
 	depends on NET
+	depends on QCOM_SOC
 
 config QCOM_QMI_HELPERS
 	tristate
-- 
2.54.0

