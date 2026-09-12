Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DA138AC87
	for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789201470; cv=none; b=uNH0lA03DbinAiCKj2fgf54wVsq/6h6Wu0OqPuCJ/BbJiVzsXWrtCTQYLJnssx2K/nD83KrvZAAAEu8dOYwUE/TVsone78F+eJLTMNVNowowhlSVpRfyIMbBuh7+CLSHB6VzknajFou/eFFNXySGWEE0j0jC/pA2arN+YuU2IgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789201470; c=relaxed/simple;
	bh=Y7BDJA2XQDYA2/DlY2vPG51pA0G3lrEc/rtLWQuzI3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RQsQRtpKKchr4dQNm7+GStHbRlktwXmHeQc/nOUeF/0qk0WLyGA1DTvFk0lPwTU6xr7rY1SiGKUg3VhVAVppEvcLWMApkjUPO/cQDncgkEIzytHqrBx5SOKRAvRDnODv4THLMjK+iiVPEWFqRfnwj4URiVk6+PSN5m8Ex+Uv8RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zlmz8zde; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zlmz8zde"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47de0093c42so1657879f8f.3
        for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 01:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789201466; x=1789806266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WuB0E4VgqfrJ/Eym4OxocKoRvyxK15RKapEkzriuyaw=;
        b=Zlmz8zdexejTkhA9CeOuRwbyCwBmkaKj9ZbkLOr1xyE4CaE2k4KIvlAfHONOODTPnD
         /ehuVTXvzQcm0gXSSj3PMWBOvBlbMqwvawARZQKFWDgiQb6j9ehP9ODfuCAUfUQuCS68
         jjW828Rd86sTeOdSVNl2nDBKpqP+aaAuE4GEoZy3pibd04icFDov9etxr6XIXr46WNjV
         CMEkZKF7Z+3CEiNcF8vo9wj5L0oX9N8LrLpRsnrgn3gfggDBYu9V/AZ9rS89RsnbKjLm
         nGfYZA4v46ulD9eckMkbiiEzwR9hBU6tWT71XlXXwbnNaLG8SuJXrHivWiHQwc///MUd
         rVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789201466; x=1789806266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WuB0E4VgqfrJ/Eym4OxocKoRvyxK15RKapEkzriuyaw=;
        b=pvWJcQsYxBJTFxzimwceujd7Db1EIAiv3tnlGNeZvE5mDjjIrmR0exzBQBKv1+2gJB
         RSx8KOvCWlmd4GJDOjGXNARl2XhC1vKIDtM3jZU0n8PhipGJr4q6ViCuSB9hHMSG0dW0
         kIG2YHYRhQbQj0t4+JupzsHCqLR5k4Ct8hfTjB07Q4CPODNhlRqdXkpPNtY0QeDG72Gd
         7cfcboRmfb7VveStjasj+dhHDV+R04ZiOc6Z2mvaR9KtgYH49jqO9rAbEMgKPQCkAtzU
         IAOmF5KIBwOatWtyqXZVuX9FvBXZ1DBaLlR7y50B2w3bYLVR10okyQFlwVm95+7Z5LaO
         2fgQ==
X-Forwarded-Encrypted: i=1; AKwUvByEM+tezwQ0TvsKHI2od8XU92jrvCY0DDHT4slIZiUTb6GZGv7ACoUAQJ7uOs8mN4Tyl9DzUCPa5RSVCg==@vger.kernel.org
X-Gm-Message-State: AFuF++lz1a57eIe7PP8gfAEcpf6Y8zPT6Nv8B0wo5A2Iq2w9dGYXd+Ad
	IV+D9sWRsop1uyCrYc2yeidmC3jNRuHOrThhpARFst8z5z8l0e4G9MYi
X-Gm-Gg: AYBFou0+La92iDnUCq46xMf9+WgUsLSNmwxbWppOWVz3Q8bfz4o9pKAkBuphBkjr+jt
	NURZVYkxYcWNdd1EPTcb+jr2LNRR/q/2150nsHv0tnONB37SIPGtZW3EcgT/O7vJMN8ZGGwQUFk
	r94nBa4sFXM3WskDJBtOfjhE5c5mh/LyulgwXoTGB9RHuuWzzr1fUO6QE49E5ffEhzpk/+tVvuo
	dKXBxhl1Jil0oNlXB3/j8pZR/KNJqGzA5dIdp/0P/c6yp0/j3WxHAhkwhjT9mWjayU+HO81+2jJ
	hzn/zoSUGh1b7dGX3YVRp/YJlb+NUvfFcHxKI96BSsumMTHmYPzc14gZ/ibWxtZy/BUtkxm6hoF
	42dMVP1Bc01yRSfP62ASe6iHDVbzWXhxoh3DKB0v17/OGfCQjqMx3A5jwzleoEFmP+OKWzr/sXN
	MnAGZof6S06swAjaEfhZicEPaxkCdGzEQascOEmBDfJPlKTJxs7itaJhRXEaeTs263zOsAmY2jp
	11cQ1Mtz9SdJUxPwpJ5DvheRS7r1C36pA976+7mksVoVQgPkTGi7PtnpEyaP53OIVmiGOmFX9HH
	PntyyJAU9F/2vf9DW9KlJFHdjy3C8gY3yN4wlL66+DZN6nIhg5ISKCFhDZpVscb645KangbMHrM
	V+KAPxIr6ifVIRbZ2VgYG8EQY1rvTgHxfvwPIXG4/PWlPgfPBopiVRsPs+DR1H3pAH8dkvIA=
X-Received: by 2002:a05:6000:240b:b0:485:8c16:5efb with SMTP id ffacd0b85a97d-486eb3162b2mr8422137f8f.53.1789201465664;
        Sat, 12 Sep 2026 01:24:25 -0700 (PDT)
Received: from cypher.home.roving-it.com (1.e.2.e.9.4.4.d.0.e.6.8.9.8.8.3.0.0.0.0.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-486f301121asm6952678f8f.0.2026.09.12.01.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 01:24:24 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] ASoC: pcm5102a: Add support for optional reset gpio
Date: Sat, 12 Sep 2026 09:24:18 +0100
Message-ID: <20260912082422.331962-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for optional reset/enable gpios as per the trivial-codec.yaml
bindings that cover this basic PCM5102A driver. Some addons gate the
PCM5102A's supply through an external GPIO, and rather than forcing
this by using a manual config to drive the GPIO high use the documented
mechanism to do this. Based on similar functionality in the pcm1789 driver.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---

The Pimoroni Pirate Audio [1] uses a PCM5100A DAC for audio and in it's docs
has you manually driving a GPIO high to enable the DAC. While creating
an overlay for the HAT I looked at the trivial codec bindings for the
DAC and it seems the details were already documented so this just adds
the ability to control this from the DAC DT rather than the documented
hack.

[1] https://shop.pimoroni.com/products/pirate-audio-line-out?variant=31189750546515

 sound/soc/codecs/pcm5102a.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/pcm5102a.c b/sound/soc/codecs/pcm5102a.c
index 9bca53de2475f..ed1e29e54ef8b 100644
--- a/sound/soc/codecs/pcm5102a.c
+++ b/sound/soc/codecs/pcm5102a.c
@@ -6,12 +6,17 @@
  *		Copyright 2013
  */
 
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
 #include <sound/soc.h>
 
+struct pcm5102a_priv {
+	struct gpio_desc *gpio_reset;
+};
+
 static struct snd_soc_dai_driver pcm5102a_dai = {
 	.name = "pcm5102a-hifi",
 	.playback = {
@@ -32,10 +37,32 @@ static const struct snd_soc_component_driver soc_component_dev_pcm5102a = {
 
 static int pcm5102a_probe(struct platform_device *pdev)
 {
-	return devm_snd_soc_register_component(&pdev->dev, &soc_component_dev_pcm5102a,
+	struct device *dev = &pdev->dev;
+	struct pcm5102a_priv *pcm5102a;
+
+	pcm5102a = devm_kzalloc(dev, sizeof(*pcm5102a), GFP_KERNEL);
+	if (!pcm5102a)
+		return -ENOMEM;
+
+	pcm5102a->gpio_reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+
+	if (IS_ERR(pcm5102a->gpio_reset))
+		return dev_err_probe(dev, PTR_ERR(pcm5102a->gpio_reset),
+					"failed to acquire reset gpio\n");
+
+	platform_set_drvdata(pdev, pcm5102a);
+
+	return devm_snd_soc_register_component(dev, &soc_component_dev_pcm5102a,
 			&pcm5102a_dai, 1);
 }
 
+static void pcm5102a_remove(struct platform_device *pdev)
+{
+	struct pcm5102a_priv *priv = platform_get_drvdata(pdev);
+
+	gpiod_set_value_cansleep(priv->gpio_reset, 1);
+}
+
 static const struct of_device_id pcm5102a_of_match[] = {
 	{ .compatible = "ti,pcm5102a", },
 	{ }
@@ -44,6 +71,7 @@ MODULE_DEVICE_TABLE(of, pcm5102a_of_match);
 
 static struct platform_driver pcm5102a_codec_driver = {
 	.probe		= pcm5102a_probe,
+	.remove		= pcm5102a_remove,
 	.driver		= {
 		.name	= "pcm5102a-codec",
 		.of_match_table = pcm5102a_of_match,
-- 
2.55.0

