Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF9B1DE4DE;
	Mon, 28 Oct 2024 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730130221; cv=none; b=MdRTFMBWQz93L7bU7djlA/GVx5Z0QyYg9dw9E71AbApncvnwz+Ze26CV6zV7ZZSl2Sj9+6OUwK9+Goa/JbU3jCBXts9SfKIMpdao092dtjSuaXPqhO5Nfv6hKFY7cRb7nbnEYNrKcyJda88YkqmSmKWHymPvsSoLulOpi86thKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730130221; c=relaxed/simple;
	bh=2x/ZD96RRHOBCxrye3iTWKv5vRtUhfGFCT9vm5h5CAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OS0Eu+2p3erhfpNnhhXNG55XEFVMSibF+bdFHthqXS7ZfyIku5/3zwxiB8K2Z/RbCBSgbDjy75S3lTXh+aHn4O8OKYGZXR6fLzeO7OOPsizSspb2KOpyHOnW+Ryd/sB3My2YTXTRL1cKGAMZbBHhRNadq1kIry1GVtFOj+iFFiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHJDIRsG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHJDIRsG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18699C4CEEC;
	Mon, 28 Oct 2024 15:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730130221;
	bh=2x/ZD96RRHOBCxrye3iTWKv5vRtUhfGFCT9vm5h5CAA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gHJDIRsGmOX66i8kO/6XtSKyHN9UQqnP9rleDfFexySAzLqFa0zjxaLliY24glCJN
	 C4a3cgHTMPdFilVNCXYwMNRkZroq1qoySWAQqp90ptLrOSqG5QQjHjMU+3Xo7r6lQU
	 roDuHk9qqccIBzqLHppLqpAbzlrgzYtEOZung6JwcDAIaVtLQ7fojDExbuVx40Nxpg
	 1HvgVUVJSbPLfWlN6zJ29hCJlCa5AwDHUmS68oF+Ilk//Iw1npf+WoJgDbWCwKTjxi
	 Ini9kueFERShOxfCc2h7bDaZg4kcJFigte6CfPAaCpxSlSp6Uycf2v6wMveV9cr+2u
	 9XXASEPLCmNxw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E32DD3399D;
	Mon, 28 Oct 2024 15:43:41 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Date: Mon, 28 Oct 2024 16:43:41 +0100
Subject: [PATCH v2 4/4] ASoC: codecs: adau1373: add powerdown gpio
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-adau1373-shutdown-v2-4-647f56bbd182@analog.com>
References: <20241028-adau1373-shutdown-v2-0-647f56bbd182@analog.com>
In-Reply-To: <20241028-adau1373-shutdown-v2-0-647f56bbd182@analog.com>
To: linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730130219; l=2094;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=l3lW7MaibCAG7NXnOqoYOWvd1BhDU+VCpOJOb6hZNr0=;
 b=P9AQLYbRT4/dJAYNIHgWRzAYiDqi3kiQm1K0uxO+anv520Spe4z5gu1jBz215/Nv/2LVtso3N
 gpDhdaWUWdoDKDAdgYWIoFhQ8LjfjvnI2TVzWjmxB/pYC5IVq6xyGpp
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sa <nuno.sa@analog.com>

If the powerdown GPIO is specified, we use it for reset. Otherwise,
fallback to a software reset.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 sound/soc/codecs/adau1373.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
index 9568ff933e12..16b9b2658341 100644
--- a/sound/soc/codecs/adau1373.c
+++ b/sound/soc/codecs/adau1373.c
@@ -8,6 +8,7 @@
 
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/property.h>
@@ -1485,6 +1486,11 @@ static const struct snd_soc_component_driver adau1373_component_driver = {
 	.endianness		= 1,
 };
 
+static void adau1373_reset(void *reset_gpio)
+{
+	gpiod_set_value_cansleep(reset_gpio, 1);
+}
+
 static int adau1373_parse_fw(struct device *dev, struct adau1373 *adau1373)
 {
 	int ret, drc_count;
@@ -1547,6 +1553,7 @@ static int adau1373_parse_fw(struct device *dev, struct adau1373 *adau1373)
 static int adau1373_i2c_probe(struct i2c_client *client)
 {
 	struct adau1373 *adau1373;
+	struct gpio_desc *gpiod;
 	int ret;
 
 	adau1373 = devm_kzalloc(&client->dev, sizeof(*adau1373), GFP_KERNEL);
@@ -1558,7 +1565,26 @@ static int adau1373_i2c_probe(struct i2c_client *client)
 	if (IS_ERR(adau1373->regmap))
 		return PTR_ERR(adau1373->regmap);
 
-	regmap_write(adau1373->regmap, ADAU1373_SOFT_RESET, 0x00);
+	/*
+	 * If the powerdown GPIO is specified, we use it for reset. Otherwise
+	 * a software reset is done.
+	 */
+	gpiod = devm_gpiod_get_optional(&client->dev, "powerdown",
+					GPIOD_OUT_HIGH);
+	if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
+
+	if (gpiod) {
+		gpiod_set_value_cansleep(gpiod, 0);
+		fsleep(10);
+
+		ret = devm_add_action_or_reset(&client->dev, adau1373_reset,
+					       gpiod);
+		if (ret)
+			return ret;
+	} else {
+		regmap_write(adau1373->regmap, ADAU1373_SOFT_RESET, 0x00);
+	}
 
 	dev_set_drvdata(&client->dev, adau1373);
 

-- 
2.47.0


