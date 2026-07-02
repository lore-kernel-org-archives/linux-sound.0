Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02526381EB7
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783004046; cv=none; b=G8PEy0kEMVU5k/GpNJrcE4/R25zQ5gc9VLOmPC85RoPT1iINK7pMjo89kb+0wOIsBJVmv291yrQEAeFfKLU8bNkyi1y1V2zGCK3fjznigOH0ZDR/OncdD/7xirx3yumALHsJ2NWIdobRVRuNj7PhsskmcFss3/zsj+zD+b14MLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783004046; c=relaxed/simple;
	bh=Es7SsSn8e0HRgyV3Fx080mF6R5iQ/dMdO440YIjWaMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xja3XFNTNox6v/oicv5AtdoHjkT/muBVX4SGP+qTVjjiYTInTYcTDMX0C34U92XZ+tFeSw7db00F6y1K+dPyytLFoUs98F+woo7uQ7rM/thK8BCF4G219o6KxgY7unp7MXLMvRWE6hItGcxRYDgnxC0w+V9KIdHq6eKdMNYof6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WT503TEb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WT503TEb"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4745492ed3aso1265941f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 07:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783004043; x=1783608843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdo6EW50u1yXg+GVeHLwl9An8gN2KPQ5xyF5/s/7kS0=;
        b=WT503TEb1wutlHqBz1zKLnGrtZ7xWUi7lWOGW1Cmqmp7xo3y/E6GgF+1xyO/Cv9SPI
         CbGgbILWx5QYURlbdXtNzIvU3qcjOOxQglGQDl/4CmzwcnyVFNInqKhk11ijth97y5UV
         N9zr+NyIcXTiNKaGRBaGWfSZdN3EUZnUuxHEFsBF4u2sP6+mEpnhEHdYJG89PsJy1TLB
         olAXoGxEEShE5IboYk3Y8qFGPVcscmUQYKDzDIVGfMB4oBEviZ5m3IVrOfqepPLPzq/J
         Js6uyV1k3t8JerLIVozUt8oSXuRVsuFl7enu2JTsmFPQkX+qaB9WeVb3NJpwDQdIZMvI
         PQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783004043; x=1783608843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pdo6EW50u1yXg+GVeHLwl9An8gN2KPQ5xyF5/s/7kS0=;
        b=LPgBPlI+FZIhk41PfqbIkYiGH5Snlsx53MNvNtDCvwTfW5RPQ6f9BoEkZfhS/DMpCO
         XbKgNyBEuZn2x4ATdH4kiLoWWgz7sDytobLkRblIFFCc6Blu0S1lfQfVRfPdUGQu6hZ0
         pp/+bhVDXhMV68B3eT+mGBBpL27KVU7jNTIrTrOFDHxWJmSRCYWEQb+/f6W9YTqcazYG
         636Mz8DsXZufL+kbokC+3fTO+7tMNYTdedCGozi1QFnwm9zdpnqVcDl5R+a5lgHrbpEp
         y/YGByPk5PqL260yPO7KeM7DKMtT26GNRnIIHnxVGJPzouo8pBrnInJll3tEiZeqmt35
         ElyA==
X-Forwarded-Encrypted: i=1; AHgh+RoB66VM6tm9Uy9FfqhFKVKezQxW/fEy72RZcrGktRmN1BBHcA+GIHc2guAzBsBoBAiDdv8sQuW7ZmEw8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEPusvyiJ0EUItRpFb26mBY9+V2GRibImkqIobTiGN3mvuCdhU
	OpS5SEIQxtKD4BDKuiTqupGsgoj/J8eW8DpkA/OCj76dtiR7t4mqr6fdmvtQ4sRsxsc=
X-Gm-Gg: AfdE7cmpcNk1BYGXLnQhMh2d1xT3xZmt7ZFIbPOaKQzYf0OUCWdbHm9LQ50LdlJtalM
	TNJf3e0jGCc5183NQx8wwlflr7YR7NYZo1f7lEr4bHbpoXxIEh9vFwuU8zs7wbPEKjUHBb0N7Zr
	2IyDniVj8lOh/0ucUDLH52Y23nngh1ChvAqyd6Yg2GeS9H+T78M0OUyOJN7UI7bvdZ/26e2w3LV
	4AOi07f8wZbbxiP1mtjesLNm4XZQY5/r9+i40wT7T0Kbqly9iyZvN+jj1F5MXADZpWNZXkFm09U
	vxryFQHZtkaGhmUoFqdPF21dQBnrjdr3pK0pnAQV/iYAk6NZfAR3luxnwWQbNULs8rTgZf2XjRN
	+GolJFPjHYuQLsk6UOWaSFoirRqZSI2ERQs27/AcTYAmSpzxlPP8YOA7ZokYIFZHWmnnuFOPLXj
	mtdCnvNYo5dCbptmiZMuSph7sZbHIlHJHVn/57Uoj3L2jvgho3XSLkzYthACZ+zVk6bLV/dkCT8
	alT
X-Received: by 2002:a05:6000:230f:b0:471:c76f:332a with SMTP id ffacd0b85a97d-477573b7906mr9238829f8f.3.1783004043377;
        Thu, 02 Jul 2026 07:54:03 -0700 (PDT)
Received: from localhost (p200300f65f47db04bdb9899c6dd79ae8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:bdb9:899c:6dd7:9ae8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477db8a450bsm10150079f8f.10.2026.07.02.07.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:54:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 2/3] mfd: Initialize spi_device_id arrays using member names
Date: Thu,  2 Jul 2026 16:53:40 +0200
Message-ID:  <f83c8292e7e3ba9425792591fb136d4ae1468215.1783003256.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783003256.git.u.kleine-koenig@baylibre.com>
References: <cover.1783003256.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7533; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Es7SsSn8e0HRgyV3Fx080mF6R5iQ/dMdO440YIjWaMw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqRnt49Rz8hQwyuGLmQ4QsBwmREUTlRIsCEdHWu r+Z8AGHldyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakZ7eAAKCRCPgPtYfRL+ TpUVCACBgWaEVYajAsPuzKuv5cAHxaubBHVn6YEDEX0YWIezmG6ryGtnVJIdcVmFPF90vztkjiH wg0giaTrzet84juyBYlNLPI5zFMr4wTfgiq3X9224pJCGrjb9X6CCmzCP8Ah3wkjodikr1HmoVt BcAyR/wukQBEFujmCCQ+cxEiTOSKeNBRuOuMIXbsHMdccguSRtOaKJxaRvXH4IOeXVvpHAZcGDK 7dkPVEZAozZvG/vnBomhpyYjUTJ4Q/24bPx+XyI6kinjNhJ6GiPDvGAwTgbcDqSA9YoS7zlkPUr 55jU0eAiuAFdlZldot+CUniGvTlp9Jq7xlYb3VOi5R5BmAxq
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
spi_device_id that replaces .driver_data by an anonymous union.

Also adapt spacing and usage of commas to the most common style.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/arizona-spi.c       | 12 ++++++------
 drivers/mfd/cs40l50-spi.c       |  4 ++--
 drivers/mfd/da9052-spi.c        | 12 ++++++------
 drivers/mfd/intel-m10-bmc-spi.c |  6 +++---
 drivers/mfd/madera-spi.c        | 18 +++++++++---------
 drivers/mfd/rsmu_spi.c          | 12 ++++++------
 drivers/mfd/stmpe-spi.c         | 12 ++++++------
 drivers/mfd/wm831x-spi.c        | 16 ++++++++--------
 8 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/mfd/arizona-spi.c b/drivers/mfd/arizona-spi.c
index eaa2b2bc5dd0..04baf5a1c652 100644
--- a/drivers/mfd/arizona-spi.c
+++ b/drivers/mfd/arizona-spi.c
@@ -255,12 +255,12 @@ static void arizona_spi_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id arizona_spi_ids[] = {
-	{ "wm5102", WM5102 },
-	{ "wm5110", WM5110 },
-	{ "wm8280", WM8280 },
-	{ "wm1831", WM1831 },
-	{ "cs47l24", CS47L24 },
-	{ },
+	{ .name = "wm5102", .driver_data = WM5102 },
+	{ .name = "wm5110", .driver_data = WM5110 },
+	{ .name = "wm8280", .driver_data = WM8280 },
+	{ .name = "wm1831", .driver_data = WM1831 },
+	{ .name = "cs47l24", .driver_data = CS47L24 },
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, arizona_spi_ids);
 
diff --git a/drivers/mfd/cs40l50-spi.c b/drivers/mfd/cs40l50-spi.c
index 53526b595a0d..a635951ca6b7 100644
--- a/drivers/mfd/cs40l50-spi.c
+++ b/drivers/mfd/cs40l50-spi.c
@@ -40,8 +40,8 @@ static void cs40l50_spi_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id cs40l50_id_spi[] = {
-	{ "cs40l50" },
-	{}
+	{ .name = "cs40l50" },
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, cs40l50_id_spi);
 
diff --git a/drivers/mfd/da9052-spi.c b/drivers/mfd/da9052-spi.c
index be5f2b34e18a..29cf2c17fde1 100644
--- a/drivers/mfd/da9052-spi.c
+++ b/drivers/mfd/da9052-spi.c
@@ -63,12 +63,12 @@ static void da9052_spi_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id da9052_spi_id[] = {
-	{"da9052", DA9052},
-	{"da9053-aa", DA9053_AA},
-	{"da9053-ba", DA9053_BA},
-	{"da9053-bb", DA9053_BB},
-	{"da9053-bc", DA9053_BC},
-	{}
+	{ .name = "da9052", .driver_data = DA9052 },
+	{ .name = "da9053-aa", .driver_data = DA9053_AA },
+	{ .name = "da9053-ba", .driver_data = DA9053_BA },
+	{ .name = "da9053-bb", .driver_data = DA9053_BB },
+	{ .name = "da9053-bc", .driver_data = DA9053_BC },
+	{ }
 };
 
 static struct spi_driver da9052_spi_driver = {
diff --git a/drivers/mfd/intel-m10-bmc-spi.c b/drivers/mfd/intel-m10-bmc-spi.c
index cfa620f0c70e..94b9c99bb4f8 100644
--- a/drivers/mfd/intel-m10-bmc-spi.c
+++ b/drivers/mfd/intel-m10-bmc-spi.c
@@ -160,9 +160,9 @@ static const struct intel_m10bmc_platform_info m10bmc_spi_n5010 = {
 };
 
 static const struct spi_device_id m10bmc_spi_id[] = {
-	{ "m10-n3000", (kernel_ulong_t)&m10bmc_spi_n3000 },
-	{ "m10-d5005", (kernel_ulong_t)&m10bmc_spi_d5005 },
-	{ "m10-n5010", (kernel_ulong_t)&m10bmc_spi_n5010 },
+	{ .name = "m10-n3000", .driver_data = (kernel_ulong_t)&m10bmc_spi_n3000 },
+	{ .name = "m10-d5005", .driver_data = (kernel_ulong_t)&m10bmc_spi_d5005 },
+	{ .name = "m10-n5010", .driver_data = (kernel_ulong_t)&m10bmc_spi_n5010 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, m10bmc_spi_id);
diff --git a/drivers/mfd/madera-spi.c b/drivers/mfd/madera-spi.c
index ce9e90322c9c..3fffa21ceadc 100644
--- a/drivers/mfd/madera-spi.c
+++ b/drivers/mfd/madera-spi.c
@@ -112,15 +112,15 @@ static void madera_spi_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id madera_spi_ids[] = {
-	{ "cs47l15", CS47L15 },
-	{ "cs47l35", CS47L35 },
-	{ "cs47l85", CS47L85 },
-	{ "cs47l90", CS47L90 },
-	{ "cs47l91", CS47L91 },
-	{ "cs42l92", CS42L92 },
-	{ "cs47l92", CS47L92 },
-	{ "cs47l93", CS47L93 },
-	{ "wm1840", WM1840 },
+	{ .name = "cs47l15", .driver_data = CS47L15 },
+	{ .name = "cs47l35", .driver_data = CS47L35 },
+	{ .name = "cs47l85", .driver_data = CS47L85 },
+	{ .name = "cs47l90", .driver_data = CS47L90 },
+	{ .name = "cs47l91", .driver_data = CS47L91 },
+	{ .name = "cs42l92", .driver_data = CS42L92 },
+	{ .name = "cs47l92", .driver_data = CS47L92 },
+	{ .name = "cs47l93", .driver_data = CS47L93 },
+	{ .name = "wm1840", .driver_data = WM1840 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, madera_spi_ids);
diff --git a/drivers/mfd/rsmu_spi.c b/drivers/mfd/rsmu_spi.c
index e07f21482439..cdb0f9797ec6 100644
--- a/drivers/mfd/rsmu_spi.c
+++ b/drivers/mfd/rsmu_spi.c
@@ -239,12 +239,12 @@ static void rsmu_spi_remove(struct spi_device *client)
 }
 
 static const struct spi_device_id rsmu_spi_id[] = {
-	{ "8a34000",  RSMU_CM },
-	{ "8a34001",  RSMU_CM },
-	{ "8a34002",  RSMU_CM },
-	{ "82p33810", RSMU_SABRE },
-	{ "82p33811", RSMU_SABRE },
-	{}
+	{ .name = "8a34000", .driver_data = RSMU_CM },
+	{ .name = "8a34001", .driver_data = RSMU_CM },
+	{ .name = "8a34002", .driver_data = RSMU_CM },
+	{ .name = "82p33810", .driver_data = RSMU_SABRE },
+	{ .name = "82p33811", .driver_data = RSMU_SABRE },
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, rsmu_spi_id);
 
diff --git a/drivers/mfd/stmpe-spi.c b/drivers/mfd/stmpe-spi.c
index dea31efface6..22a3da062dee 100644
--- a/drivers/mfd/stmpe-spi.c
+++ b/drivers/mfd/stmpe-spi.c
@@ -121,12 +121,12 @@ static const struct of_device_id stmpe_spi_of_match[] = {
 MODULE_DEVICE_TABLE(of, stmpe_spi_of_match);
 
 static const struct spi_device_id stmpe_spi_id[] = {
-	{ "stmpe610", STMPE610 },
-	{ "stmpe801", STMPE801 },
-	{ "stmpe811", STMPE811 },
-	{ "stmpe1601", STMPE1601 },
-	{ "stmpe2401", STMPE2401 },
-	{ "stmpe2403", STMPE2403 },
+	{ .name = "stmpe610", .driver_data = STMPE610 },
+	{ .name = "stmpe801", .driver_data = STMPE801 },
+	{ .name = "stmpe811", .driver_data = STMPE811 },
+	{ .name = "stmpe1601", .driver_data = STMPE1601 },
+	{ .name = "stmpe2401", .driver_data = STMPE2401 },
+	{ .name = "stmpe2403", .driver_data = STMPE2403 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, stmpe_spi_id);
diff --git a/drivers/mfd/wm831x-spi.c b/drivers/mfd/wm831x-spi.c
index 54c87267917b..1e519fd9a9e1 100644
--- a/drivers/mfd/wm831x-spi.c
+++ b/drivers/mfd/wm831x-spi.c
@@ -77,14 +77,14 @@ static const struct dev_pm_ops wm831x_spi_pm = {
 };
 
 static const struct spi_device_id wm831x_spi_ids[] = {
-	{ "wm8310", WM8310 },
-	{ "wm8311", WM8311 },
-	{ "wm8312", WM8312 },
-	{ "wm8320", WM8320 },
-	{ "wm8321", WM8321 },
-	{ "wm8325", WM8325 },
-	{ "wm8326", WM8326 },
-	{ },
+	{ .name = "wm8310", .driver_data = WM8310 },
+	{ .name = "wm8311", .driver_data = WM8311 },
+	{ .name = "wm8312", .driver_data = WM8312 },
+	{ .name = "wm8320", .driver_data = WM8320 },
+	{ .name = "wm8321", .driver_data = WM8321 },
+	{ .name = "wm8325", .driver_data = WM8325 },
+	{ .name = "wm8326", .driver_data = WM8326 },
+	{ }
 };
 
 static struct spi_driver wm831x_spi_driver = {
-- 
2.55.0.11.g153666a7d9bb

