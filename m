Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241BF3358C4
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543434; cv=none; b=G1n+Xfl/o/F1o7H0dig+Yxp1c9LKcVXdVKZxsRA00UHuEE3wJ8EEJWWRMaZ6HYjH2tgkEawkNn+9PxAKa4sz7pSFW36monSbhQrmWbxZxDQhCUzbJg8+0m4zCuSAL+9LwOHFsHO+c+FXvU1kMX9djweux1MZ8jj0iuTHp6KaD3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543434; c=relaxed/simple;
	bh=4zqRWKe6A91rsanLN+R7KRDQ2S2tcRWB++5yv/JjcNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TfOkq1iTY4RryG2xKHlzoXQLjCWMkY7C/9hpTOpJDyZ341JFldfKWs6IXdlVuQx6jqEL/+l82V2ZPXTk+dZ7jCClQ2xb2r7SVDJ9TlTmpmK15UwBZWBd9kdYWlFT2Wc2zIZnw7TB1uSqJ7Kbv+i/1YCKO7h8BPKbjIz9r9SKxjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qqQm/6ob; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qqQm/6ob"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-429c7869704so4840413f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 01:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763543430; x=1764148230; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YE4EP2vHwAOfDYFjAAxFpiiWrfOWjJkp8nzfRZHx8Kg=;
        b=qqQm/6obGSwwExbGZdwXR0H6I7/AMYMSDozrCoPH0HuxOR5KLTU2zi6bXS+paqzhpz
         3KzLKG2J2UoXn4EYpLwxNAXs3XASSj58JZApFbntqMNkiQoUg/jiT3aaUr831fPDNjpO
         0FWRcrwjYIZJVBET8HGmm41jN2JatciNLJNr6o+sndWspwlqEzzViHQi5s2LxAr5B4EU
         RLDHCFPFSnfR3pUtSXF9hD+vkOVdy3MUxzUOqrw+bVBm9KvpY4egyeT77hCMXYMY28qH
         X4xGtinUQN6Hro+S52ALrEOfeRc0zX14IDXalJrRjw6HfmMjnQCrgFgdSwOPv1ku6NTJ
         m9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763543430; x=1764148230;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YE4EP2vHwAOfDYFjAAxFpiiWrfOWjJkp8nzfRZHx8Kg=;
        b=UIYHbySEzMI2qB7n3SPbTRGPO7ta0eggYMW47vClnyItTLmWPG0R9c7nN7ijnctsFl
         sZ2h4z2+SWs4VdPemajK0yBMmOU+sXhuoIrlLxK9PjuW7fNFZOZaxt23nk+IjiVjIAt1
         IISEfusGVQRGkIp/KkmOqznK6BygdGdEHOMEhdItanvT7cn7GTnXpOx15H/xvxBLqx9N
         hpc8c/Uau3o1UnnGxR1v9kzeftc+9XAk2NEVh6DJ7PC5eD+aiyijpLS11OPXFP38z5DF
         SsPXtrx6P3ByhEBTK+tMC9iJn9r/GhzQ8uHswMnxRy1RdrzugdMSeEW6ktijxyzVidoR
         78/g==
X-Gm-Message-State: AOJu0YxLuurh9yc8n74ybHNTqpAkGODUgnR0d4mxnMWPWMh3lK0YG135
	RD+XbtPzgTpYHgYFQOjb80nU3JQ/JD34kqTc0c1A9YvWXHWdjt+sfqs7mYnSTAQZb7w=
X-Gm-Gg: ASbGnctpKrQKt3uCSbztH0wnxSy64Ey6P1ppufwEFCEh74z/kuTn/CLwKAZUbIsn5Rd
	gMuT8D3Kqbv1HnUmKMZ8w5DlltBg2RVa5Omua4JOtQTzysfr5tTvlXL6gIL1JcuC/dhoZkIG5AB
	jjF9+g/uzoLfC0MN8POV9pyGxL/wy1yUGMR7UjwnkvrwB2UQHt1WriWEiL5pMyPt/jweaWcEo/z
	az+V4TSgPdFWwo1nEkjhlC5XC0Q1SS0OJYRYHda2oQ8z64LX3ePTISXd6zNkl9OqAnrNEv+LuYO
	PigdswFaFQs9i+s3Bek8L0y+oAFs+5dvYoEhUMmIyc+zTMPcNmvYkMl07qjUyKhrRnR4sjI1r02
	9+rgwcPdx3bOZIvbRvV7SXHf/tGuNyVSe7A7MeyzjOnnA+3SOp8DxbGoe9XPfr0yp6ACKqGwXD+
	4D7iU9
X-Google-Smtp-Source: AGHT+IHUqL4AiPh3Lxs/BJo8HrorMM/Yb2oeCQiCieOWqwtZ1l/4ODlTZezCzSvp5hc6qozvX9gQdw==
X-Received: by 2002:a05:6000:1847:b0:429:d3e9:667 with SMTP id ffacd0b85a97d-42b59349872mr18945075f8f.18.1763543430334;
        Wed, 19 Nov 2025 01:10:30 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c10a:203f:120a:d2f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206e2sm37369280f8f.41.2025.11.19.01.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 01:10:29 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 10:10:24 +0100
Subject: [PATCH RFT/RFC] mfd: cs42l43: setup true links with software nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-cs42l43-gpio-swnodes-v1-1-25996afebd97@linaro.org>
X-B4-Tracking: v=1; b=H4sIAH+JHWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0NL3eRiE6McE2Pd9ILMfN3i8rz8lNRiXYsUk0TzVHNjoxQDSyWg1oK
 i1LTMCrCx0UpBbiH6QW7OSrG1tQBa1UAjbwAAAA==
X-Change-ID: 20251119-cs42l43-gpio-swnodes-8d4a7e732d09
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4611;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=o7oQ1XaVb5wC1ZDBDcJbldzYHxr5SKuSoMF0kqHvAK0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpHYmBBfvF6ldeycbTuHmYL7zSkv8OFuOn00HZJ
 1o+6FgKdUiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaR2JgQAKCRAFnS7L/zaE
 w6oMD/92PuCX/DA05qVNAHA18lQ1nQ9rq/89KQv/B6gLTkk2NxwREQE72VlfEXzAIFKs8Z7TpwN
 6aAtV4M0EqZ+/22ujJMIkJNWwrtRrcFg3cjAEfLkCgIu5M4vKRjT3LuOg66pyI2c8qNYHsZWQo8
 AhGGJ7/+GPMChEska3BERvNbCiYTtjtakVeMx1PmOZ54uMaR4OPHLcSK6fpY8CUILdLXdc6XlTC
 DbqGQwcgjDlZ+HARaCU2M7b/GS13tGVZ2ruyzGL2ngce8oxyxlUyF2SBKsM3k4yV9KL7BykuRy1
 8juUonyNrK+mseoeBoot/hnaaTxflHUq+ibL1GTNBr5UNE5yE5DXlEBf9/bcEQmoOt8/vDZjYnh
 uwT43vAFXk8cY1q7fVV9K3/va4WtIfwyleT5jKgZno0oTrqgnYPiKO465zImteXtutTcqAHDZHG
 wTxUi7n/sSd3R7gt6BxJebBEwls5DMmCZphqoO2xc1KKo0Xp5A5dxoQh/o+YjfoFJKO7m7ViaDz
 zDVwNW5kVSJaaxGb2jlYhYLzvlx92oEepz2vLlA68Tvs165KMsf6RiWsuglRDRbFck+c2wPDMIb
 NumGI5ax9s33LjFRstILQ8+/0IlO6ccd0ApiFqqO+nSnXaWxb7L2FygBaTBj/jLbA6uSQd61QM6
 ke6g8KUYckMdCeg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Currently the SPI driver sets up a software node rerefencing the GPIO
controller exposing the chip-select GPIO but this node never gets
attached to the actual GPIO provider. The lookup uses the weird way GPIO
core performs the software node lookup by the swnode's name. We want to
switch to a true firmware node lookup so the actual link must exist.
Move the configuration to the MFD core and connect the SPI and pinctrl
sub-devices with software node references.

Fixes: 439fbc97502a ("spi: cs42l43: Add bridged cs35l56 amplifiers")
Reported-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Closes: https://lore.kernel.org/all/aRyf7qDdHKABppP8@opensource.cirrus.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Hi Charles!

Please give this a try. It's only build-tested so far. I hope I
understood correctly that it's the SPI driver that needs the "cs" GPIO
from the pinctrl.

Bartosz
---
 drivers/mfd/cs42l43.c     | 25 +++++++++++++++++++++++--
 drivers/spi/spi-cs42l43.c | 33 ---------------------------------
 2 files changed, 23 insertions(+), 35 deletions(-)

diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 107cfb983fec416bbdd31caa1e6a569026467735..629faf8674af651eb64aa63ec768ba18c1c8b311 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -14,6 +14,8 @@
 #include <linux/err.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/jiffies.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/cs42l43.h>
@@ -512,9 +514,28 @@ static const char * const cs42l43_core_supplies[] = {
 
 static const char * const cs42l43_parent_supplies[] = { "vdd-amp" };
 
+static const struct software_node cs42l43_gpiochip_swnode = {
+	.name = "cs42l43-pinctrl",
+};
+
+static const struct property_entry cs42l43_cs_props[] = {
+	PROPERTY_ENTRY_GPIO("cs-gpios", &cs42l43_gpiochip_swnode, 0, GPIO_ACTIVE_LOW),
+	{ }
+};
+
+static const struct software_node cs42l43_spi_swnode = {
+	.properties = cs42l43_cs_props,
+};
+
 static const struct mfd_cell cs42l43_devs[] = {
-	{ .name = "cs42l43-pinctrl", },
-	{ .name = "cs42l43-spi", },
+	{
+		.name = "cs42l43-pinctrl",
+		.swnode = &cs42l43_gpiochip_swnode,
+	},
+	{
+		.name = "cs42l43-spi",
+		.swnode = &cs42l43_spi_swnode,
+	},
 	{
 		.name = "cs42l43-codec",
 		.parent_supplies = cs42l43_parent_supplies,
diff --git a/drivers/spi/spi-cs42l43.c b/drivers/spi/spi-cs42l43.c
index 14307dd800b744fee17edd864688a68c65666c68..fa844ce6cd7539bf764f792b99e8f8e191fc0c15 100644
--- a/drivers/spi/spi-cs42l43.c
+++ b/drivers/spi/spi-cs42l43.c
@@ -52,20 +52,6 @@ static struct spi_board_info amp_info_template = {
 	.mode			= SPI_MODE_0,
 };
 
-static const struct software_node cs42l43_gpiochip_swnode = {
-	.name			= "cs42l43-pinctrl",
-};
-
-static const struct software_node_ref_args cs42l43_cs_refs[] = {
-	SOFTWARE_NODE_REFERENCE(&cs42l43_gpiochip_swnode, 0, GPIO_ACTIVE_LOW),
-	SOFTWARE_NODE_REFERENCE(&swnode_gpio_undefined),
-};
-
-static const struct property_entry cs42l43_cs_props[] = {
-	PROPERTY_ENTRY_REF_ARRAY("cs-gpios", cs42l43_cs_refs),
-	{}
-};
-
 static int cs42l43_spi_tx(struct regmap *regmap, const u8 *buf, unsigned int len)
 {
 	const u8 *end = buf + len;
@@ -324,11 +310,6 @@ static void cs42l43_release_of_node(void *data)
 	fwnode_handle_put(data);
 }
 
-static void cs42l43_release_sw_node(void *data)
-{
-	software_node_unregister(&cs42l43_gpiochip_swnode);
-}
-
 static int cs42l43_spi_probe(struct platform_device *pdev)
 {
 	struct cs42l43 *cs42l43 = dev_get_drvdata(pdev->dev.parent);
@@ -402,20 +383,6 @@ static int cs42l43_spi_probe(struct platform_device *pdev)
 				return dev_err_probe(priv->dev, ret,
 						     "Failed to get spk-id-gpios\n");
 		}
-
-		ret = software_node_register(&cs42l43_gpiochip_swnode);
-		if (ret)
-			return dev_err_probe(priv->dev, ret,
-					     "Failed to register gpio swnode\n");
-
-		ret = devm_add_action_or_reset(priv->dev, cs42l43_release_sw_node, NULL);
-		if (ret)
-			return ret;
-
-		ret = device_create_managed_software_node(&priv->ctlr->dev,
-							  cs42l43_cs_props, NULL);
-		if (ret)
-			return dev_err_probe(priv->dev, ret, "Failed to add swnode\n");
 	} else {
 		device_set_node(&priv->ctlr->dev, fwnode);
 	}

---
base-commit: fe4d0dea039f2befb93f27569593ec209843b0f5
change-id: 20251119-cs42l43-gpio-swnodes-8d4a7e732d09

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

