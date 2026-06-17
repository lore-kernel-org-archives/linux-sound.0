Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91096175A8F;
	Wed, 17 Jun 2026 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708033; cv=none; b=WiAlFAp9E23F/JCBqL4k/WBcNrvO4DPk0YkChlRVnuvZAGJHzl4a8BNuEjPHAJuJGi4uxlIn4TMABnIjuiHv9PXmTM1FPkhalMy8Ov1PXvoEadYK7KTBl2cGWwRBsn52kBFZAXrDBa0vixiAQuVXbgy0LF349xi2m0U0wlGB7ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708033; c=relaxed/simple;
	bh=/d9QxEIMmw0yDj0iH4sk6Tv+//78Yt4lhgfQUiX3Fh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ldOgiKK+Fdf6/tOk7a36e1Pi730EeptHwYu5+/iyWDll8n4hpYEKZMcaZsi7TBCSvuHD95DwZR0BKiPxG6rzSey8xAG7bFjrba3whPQB8ZwXhSpxLFV1vRxEAwVrhYaWTBh90OS3rEJmaeiQSGQ/xL7UnxjAa7MkBT9VLNAt0pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 82947200B9E;
	Wed, 17 Jun 2026 16:48:01 +0200 (CEST)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wZrYf-003H6X-1N;
	Wed, 17 Jun 2026 16:48:01 +0200
Received: from [::1] (helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wZrYf-0000000CK2H-1Ou0;
	Wed, 17 Jun 2026 16:48:01 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Wed, 17 Jun 2026 16:47:53 +0200
Subject: [PATCH] ASoC: cs530x: Fix expected MCLK rates for CS5302/4/8
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-cs530x-mclk-v1-1-0215b5f1a0a4@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAJizMmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Nz3eRiU2ODCt3c5JxsXUOTFBMjEyNL0xRzSyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgCAEJC2bwAAAA==
X-Change-ID: 20260617-cs530x-mclk-14d424295d79
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Paul Handrigan <paulha@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>
X-Mailer: b4 0.15.2

When this driver was first added, it accepted rates of 24.56 MHz and
22.572 MHz for the MCLK when PLL bypass is enabled.

These rates seem to have no basis in the datasheets and were thus replaced
with 45.1584 MHz and 49.152 MHz, respectively, in commit e7ab858390f2
("ASoC: cs530x: Correct MCLK reference frequency values").

While the new rates are indeed correct for the CS4xxx ICs[0][1][2][3],
they are incorrect for the CS530x ICs the driver was originally written to
support as the MCLK frequencies are halved there[4][5][6].

Fix this by checking against the correct type-appropriate rates.

While at it, drop the CS530X_SYSCLK_REF_* macros. They arguably confuse
more than they help, especially as they are not applicable to the
cs5302/4/8.

[0]: https://statics.cirrus.com/pubs/proDatasheet/CS4282P_DS1318F1.pdf
[1]: https://statics.cirrus.com/pubs/proDatasheet/CS4302P_DS1315F1.pdf
[2]: https://statics.cirrus.com/pubs/proDatasheet/CS4304P_DS1316F1.pdf
[3]: https://statics.cirrus.com/pubs/proDatasheet/CS4308P_DS1317F1.pdf
[4]: https://statics.cirrus.com/pubs/proDatasheet/CS5302P_DS1312F1.pdf
[5]: https://statics.cirrus.com/pubs/proDatasheet/CS5304P_DS1313F1.pdf
[6]: https://statics.cirrus.com/pubs/proDatasheet/CS5308P_DS1314F1.pdf

Fixes: 2884c29152c0 ("ASoC: cs530x: Support for cs530x ADCs")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
Cc: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/soc/codecs/cs530x.c | 29 ++++++++++++++++++++++++-----
 sound/soc/codecs/cs530x.h |  6 ------
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/cs530x.c b/sound/soc/codecs/cs530x.c
index 18b5ff75feec..2c7e33135911 100644
--- a/sound/soc/codecs/cs530x.c
+++ b/sound/soc/codecs/cs530x.c
@@ -1093,6 +1093,29 @@ static int cs530x_component_probe(struct snd_soc_component *component)
 	return 0;
 }
 
+static bool cs530x_mclk_freq_is_valid(struct cs530x_priv *cs530x,
+				      unsigned int freq)
+{
+	/*
+	 * All these chips support 48 kHz- and 44.1 kHz-related sample rates,
+	 * but they differ in what MCLK frequency is required for achieving
+	 * the sample rate.
+	 */
+	switch (cs530x->devtype) {
+	case CS4282:
+	case CS4302:
+	case CS4304:
+	case CS4308:
+		return freq == 49152000 || freq == 45158400;
+	case CS5302:
+	case CS5304:
+	case CS5308:
+		return freq == 24576000 || freq == 22579200;
+	}
+
+	return false;
+}
+
 static int cs530x_set_sysclk(struct snd_soc_component *component, int clk_id,
 			     int source, unsigned int freq, int dir)
 {
@@ -1101,11 +1124,7 @@ static int cs530x_set_sysclk(struct snd_soc_component *component, int clk_id,
 
 	switch (source) {
 	case CS530X_SYSCLK_SRC_MCLK:
-		switch (freq) {
-		case CS530X_SYSCLK_REF_45_1MHZ:
-		case CS530X_SYSCLK_REF_49_1MHZ:
-			break;
-		default:
+		if (!cs530x_mclk_freq_is_valid(cs530x, freq)) {
 			dev_err(component->dev, "Invalid MCLK source rate %d\n", freq);
 			return -EINVAL;
 		}
diff --git a/sound/soc/codecs/cs530x.h b/sound/soc/codecs/cs530x.h
index 1e2f6a7a589c..18aa4dfd0c86 100644
--- a/sound/soc/codecs/cs530x.h
+++ b/sound/soc/codecs/cs530x.h
@@ -200,12 +200,6 @@
 /* IN_VOL_CTL5 and OUT_VOL_CTL5 */
 #define CS530X_INOUT_VU			BIT(0)
 
-/* MCLK Reference Source Frequency */
-/* 41KHz related */
-#define CS530X_SYSCLK_REF_45_1MHZ	45158400
-/* 48KHz related */
-#define CS530X_SYSCLK_REF_49_1MHZ	49152000
-
 /* System Clock Source */
 #define CS530X_SYSCLK_SRC_MCLK		0
 #define CS530X_SYSCLK_SRC_PLL		1

---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260617-cs530x-mclk-14d424295d79

Best regards,
--  
Ahmad Fatoum <a.fatoum@pengutronix.de>

