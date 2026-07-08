Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4E84779BB
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 11:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509432; cv=none; b=Zott55wfZTlqxGivhhH5x2lWSz8BAzO+75SKkX0L6hfw3/GHi6yEI3UoY+gox2hL4smMp3ZG0qf/M/Zrdu6QIp/MMj+SFIMjeeUQwCQBPvsbJETjsFw8yuGQsJk+113uUgc9qJaM5Bc/nHf9CRX/njp/Cbg341YAu4YhqHmmUSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509432; c=relaxed/simple;
	bh=0J9253uCRHW7Dyg8hqYskvGYiZ1mSfxyMzfcf6OnIpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HAgcfG5wY8SOXqSPZoQEc8FCoQ1YtN3xtFEysumcy5yK8+L+NrmLUu7wDy6HYOYY7ViZQbbqSDtwVjGe+8XS8N9zzEOAM1hS0etyMsBjAZZUz/d9eoFC+BFm8eo817u+6IF3pKOUKDbcCbLBF+k2HF3q+D32jClxOAasc/hSMrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Qp9aOAB5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Qp9aOAB5"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so3121985e9.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 04:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509428; x=1784114228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H5jhc6YVXr1FZGUjHnU8wtQTNwuB/nx6OMzkF778AIk=;
        b=Qp9aOAB5Avea6SxAM4MPEafU4nsn89KTrEdnzMeQko/hyuBKj9fk96zWuYSfuRPczf
         /KWJ73qji8/BapH2fhwdRbw/ElPuQhLwUsiyctU5QyVojO2VznCHeAu3XYzAiiZ8q3Aq
         6GOSmQbUB2IWJapnGsk5fcpDMvfYM/U2OrrICB1Mz59CbTq/ehVD4pbFWfWARrS19VA1
         U4biE2NdsseBMhyKI3f8BpaBJKBeo89NIA+KfHWJD7oNw51MEEGDFpGwMO/kjlkB6ykk
         fniH/iBe1DLXrYdWSKStLZyzYycEiY/d2Yeuv7vZ1MxljA235B1JAhw7YmxlgUhfB+cs
         bhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509428; x=1784114228;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5jhc6YVXr1FZGUjHnU8wtQTNwuB/nx6OMzkF778AIk=;
        b=cFfEEY4eXwE5W8fOzfkxj0j1SIvyvA4ZFLZRZSvwKyKAvVHQcKvu2VohPJkas7jUf8
         E8X+36YJfLXId3jg2JKv08QdQdA0eg6qRSO5VlDp0HUEhIuVh8dmID/oWDFuLLERbU3i
         aFO+uf8mGICLFE2FVEcXkvTfx1HgNK1oiTLh87MjCWDazUPLmscIO+2chmDlC508xyBr
         KrWkeGkpAfnN9v6R76tNepy77sJpI3Q18zRKSB6kNtEhdjMFS8C6ExAE1b5b1gBvRAp2
         br/wqsR1pGI9Fle6VE3MNQq+CsM9WrskgAm/+E2XM41dy1yVW8FfG/KZWkjBL4FIEJMC
         SRfw==
X-Forwarded-Encrypted: i=1; AHgh+RoNLfx6PAgphbt68xHKsw1TKm1kpekBHZKKGJi2NOJul5cnM/B6EUOleX0jAYDUZIzXa46ND6yk5GQc8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlD37gDZTu1fU122oEsDJzuWdPjeF6XS0KxdYcyKyIa9DWuIvP
	5HS/VlmzBze643CdYoCL1O40waLOScMbJy8RVbaOcJwzzGMWDlQ343PF40v0w5QuTcw=
X-Gm-Gg: AfdE7clYksxUWt8WEBofSZc6n1uDNEmQfWoAWHpsKCr4pWngc8aI7xNBIT+QgJRvXvr
	RaQDDIry0TprQQ+FPBr5coyTVILdPkFtxAS6DSeJZcugLCfhMe84LPkQ4oebFpBaHFTvwK+HzIa
	vuhuRcHJev9AVaNRpISEBVjch1KWXfi9cbWYC1BpZuPqkpd+gnIOlDwJ8HS2G+MdS3czK30/6CM
	yD+k+bGwT3EmZIMNCo6wNstg/c3mV705toXJppfEYfQtsf2vvlXdm+KJ1CCnzOkSHoQ+PmqM7XE
	4s+x77yZin/saUMB0oiGrorOh9RksAm4QPzVrrXwxVSfKFMHFVLvr9AyNVgwyfwNnjgQPq7vsrq
	KqZKUYKvtb6drIfKy9h2xzNoCKwKRJM0Z6grtcV4bZEHCJr6ZmWizbJ0ISxOmSx/42ZgroZcOuF
	REVgpAZoZUKSklJASAfBfUV1iCZXenlFiwIQ4AnOSsyIV25IYatbinX4oIDEeMQ2/otOe3Xmuaq
	ZEcJWOWszNLFpo=
X-Received: by 2002:a05:600c:8a1b:20b0:493:bc4a:fb55 with SMTP id 5b1f17b1804b1-493e68a4fe3mr15360095e9.38.1783509428075;
        Wed, 08 Jul 2026 04:17:08 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e0fc1348sm139152395e9.14.2026.07.08.04.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:17:07 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH v2 18/23] mfd: Unify style of acpi_device_id arrays
Date: Wed,  8 Jul 2026 13:15:25 +0200
Message-ID:  <ac8389353ee128d3841cf91c27ef84a8cfa3b5ca.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4214; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=0J9253uCRHW7Dyg8hqYskvGYiZ1mSfxyMzfcf6OnIpY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjF+I6MmqkBGKUrusSTty5Wd6pY6NBJpKQstM Cx54fZb0x+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xfgAKCRCPgPtYfRL+ TjaaB/9Bj0Ig8aVXwtojSbhDug3A8xTOrdYsoU6TfRqDcwnihXXeHEv9ANrkhWRgB7frpeqSm/j 8h/7ZebRBi9RtyxTbveJTRKXsl9lFoutFI069UqPfHmvk1r+snMBpuKXJZWCsvcadcHdn2GLLnH V6Nno0vTo4dbXE42ODJ/ejdY/QKg2L2ym0QhxMIOAi6MgWmTLVtlZSirtVEQYt/sY4g7xzUDHPk /QExt7hcnVLY4+KQFot2+yjCzrnvTAUsFEQFZlj1V9mitWIVdPy2/OjZsR8nQNTrhaa7kb1wQ9t h36GXbvBpfh2GCzPUV2Ehx6eUpM4rWnLeJ+Ug3j6ZFWbyLA6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the various acpi_device_id arrays to conform to the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the few offenders accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/axp20x-i2c.c              | 2 +-
 drivers/mfd/cs42l43-i2c.c             | 2 +-
 drivers/mfd/intel_soc_pmic_chtdc_ti.c | 2 +-
 drivers/mfd/intel_soc_pmic_crc.c      | 2 +-
 drivers/mfd/intel_soc_pmic_mrfld.c    | 2 +-
 drivers/mfd/kempld-core.c             | 2 +-
 drivers/mfd/upboard-fpga.c            | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 2f595e2b883c..57695e46e00e 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -97,7 +97,7 @@ static const struct acpi_device_id axp20x_i2c_acpi_match[] = {
 		.id = "INT33F4",
 		.driver_data = AXP288_ID,
 	},
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, axp20x_i2c_acpi_match);
 #endif
diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index e9cb4fb9854a..6a4e4ddeb268 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -67,7 +67,7 @@ MODULE_DEVICE_TABLE(of, cs42l43_of_match);
 static const struct acpi_device_id cs42l43_acpi_match[] = {
 	{ .id = "CSC4243", .driver_data = CS42L43_DEVID_VAL },
 	{ .id = "CSC2A3B", .driver_data = CS42L43B_DEVID_VAL },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cs42l43_acpi_match);
 #endif
diff --git a/drivers/mfd/intel_soc_pmic_chtdc_ti.c b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
index ff6223d6f54b..49f4138961c8 100644
--- a/drivers/mfd/intel_soc_pmic_chtdc_ti.c
+++ b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
@@ -163,7 +163,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(chtdc_ti_pm_ops, chtdc_ti_suspend, chtdc_ti_resu
 
 static const struct acpi_device_id chtdc_ti_acpi_ids[] = {
 	{ .id = "INT33F5" },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, chtdc_ti_acpi_ids);
 
diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
index c1c02700ef08..95588caa2e77 100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -253,7 +253,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(crystal_cove_pm_ops, crystal_cove_suspend, cryst
 
 static const struct acpi_device_id crystal_cove_acpi_match[] = {
 	{ .id = "INT33FD" },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, crystal_cove_acpi_match);
 
diff --git a/drivers/mfd/intel_soc_pmic_mrfld.c b/drivers/mfd/intel_soc_pmic_mrfld.c
index 9d7e1881d693..531d8b8be44d 100644
--- a/drivers/mfd/intel_soc_pmic_mrfld.c
+++ b/drivers/mfd/intel_soc_pmic_mrfld.c
@@ -140,7 +140,7 @@ static int bcove_probe(struct platform_device *pdev)
 
 static const struct acpi_device_id bcove_acpi_ids[] = {
 	{ .id = "INTC100E" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, bcove_acpi_ids);
 
diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index bf02189b9a70..9b3a877f44fb 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -469,7 +469,7 @@ static void kempld_remove(struct platform_device *pdev)
 static const struct acpi_device_id kempld_acpi_table[] = {
 	{ .id = "KEM0000" },
 	{ .id = "KEM0001" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, kempld_acpi_table);
 
diff --git a/drivers/mfd/upboard-fpga.c b/drivers/mfd/upboard-fpga.c
index 6674f4a1d2fe..37c3c50aa6e4 100644
--- a/drivers/mfd/upboard-fpga.c
+++ b/drivers/mfd/upboard-fpga.c
@@ -302,7 +302,7 @@ static int upboard_fpga_probe(struct platform_device *pdev)
 static const struct acpi_device_id upboard_fpga_acpi_match[] = {
 	{ .id = "AANT0F01", .driver_data = (kernel_ulong_t)&upboard_up2_fpga_data },
 	{ .id = "AANT0F04", .driver_data = (kernel_ulong_t)&upboard_up_fpga_data },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, upboard_fpga_acpi_match);
 
-- 
2.55.0.11.g153666a7d9bb

