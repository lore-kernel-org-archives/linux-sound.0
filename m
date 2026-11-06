Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943583;
	b=fu0cfqyZfSku2poB6CHVrkCYT7g6S+9XXAAEXk85UWwM6g5qw0skODsndSC60KHsResg
	 yFllhhpFddewvE2BpqrgPiV0asKrx2OaOwB3V+YiXLbl8geFLiR8XFj242J7JcE/sUeYu
	 LWwFzom4d4MQ7cqdZMlsFYSyf84psHRfHIdX0S8ykO6tTpoCjMP5Xg8r7GICKEzBuIgjQ
	 Bnn0lkPRWbAm3yBhCZoeFM6iLHIZWqalgT6R+uOP3PqyjH2Oua6sVTl8RL92FqAoAARp4
	 gDthuFPEgnsJc38SXbafZ0J4Gj5enatNF2LIdr5lMIL4ArF8Qj7oHCoHxZUenFIxyhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3CXsq8VgYvZgkVymR4JaK9jyQUC6b2rSS5BRoOawhtY=;
	b=VDfVA7htLxEwqbG8zhifhvp064TE8DrchoQ/ruRv2XtWa0TK2gn3qrPuQNLsNExXEi8g
	 +WEo59VjzR/GsQYOPnjf+lSeypO97WSRDcuwTzA+2QKrv0CQASxtacKbSeENk6hklNCDD
	 XeNgrYtUYPw0IqExV7tPRcqckVR3RiwTRumaWPt3Tv8NMHhuAWtCbIfk9SL8gB6pHogUq
	 jbiHysJSYVDe99fXe4g6C0TnQo2hlRDrPPZDl8Txwno2M1YmcCAEW07QhnYSHcxZIwgZB
	 wj9kZsx4MsfeGlurdl5ZIo19SDPscDwOUzhzYbvncV4XF5zN9WmKZYM9kELe4PLbMng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZoQTIGse;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB5C606D802
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 05:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAB5C606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZoQTIGse
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a315ed211so342982eec.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 21:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793943582; x=1794548382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CXsq8VgYvZgkVymR4JaK9jyQUC6b2rSS5BRoOawhtY=;
        b=ZoQTIGse91+8hmF++9MvWkZD6UPBY/5T/oFBYYh3D2ixpdZv+fOa0gvobd4BtOImcM
         5ncBEW3yU5RxxPA2xitOchMznRmLNPAHpruDuewM2EtcerUqnH2IdNkSmVVAKol8i+/R
         FNxUAWh5yruj6q+RRi4gxOYmFeqXkMvjoL+AH2gVedhJ/vB5R+O/X0kEEeDc5nm0qUR1
         PqszPJiC0VN6uc/bMLBOG72TTnrsHw1iHh51V+AdcT8GZJpPdD4W9xcCtEUOTXplCF2W
         CJyTwXx9zm27Q+0FiKqetkCO7pIHRYjBpzAUMlx+aXysZdpzUtpE44psvOX2sVFAKXs5
         xB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943582; x=1794548382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3CXsq8VgYvZgkVymR4JaK9jyQUC6b2rSS5BRoOawhtY=;
        b=rdTKK09EB/qKhJ/6d4mPVSVH6isPSrtWh+mDUwb7fIA9OyKb73Ai8TEjrhJRK9Vstn
         N3QoMV9y09IfRTknuIZoZnN1gHb1bOOeGsF9jSgKc4/Tm1E6VmWGacCJdJrbmlOVXUVY
         uTCA5SKRxkKziP6dnWEOWbe0S5fpRHCQGaOxRs8MZOHdvPWHj1XNoosb87lWWmcRSmOI
         HdpYy1zQ7QSaeL05W0UiwkuO6kLkVEw9lQyuLgfCUA7pt4lxuCn6QzvDIxxsAWibWUcC
         j3W43KNd7eAaLwYehMM+0lzHUW9CMac3EtIQ/oBQs/IdawuoGUKRk2WqkgBacjHM+Ky9
         ObtQ==
X-Forwarded-Encrypted: i=1; AL+hErE2x5+f9uSUSyPjMECqO5vxSHo1SPtoh37zEyyhPVlRBZfFEw0qzIUjr6JNACSBj/VzUjEY3SFRAwvG7w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/VB0YnYRpVXdJYEMF19R9/JhMOZrdGL2ABHIhF0uS2VTV3zvJz
	QNG2dX3n/larsslhU0iywzto9f0a9cApmjnNaIiwGyBGafPoifazbCdQ
X-Gm-Gg: AYBFou0OaW4STtBVVJl2qmybDvfkZ1bYoYULati023xvEFITbjuVUaruEIJPXU8ZRIH
	uieDU0C2Dd0Jhj2YsHqTrdiCe/vqj3HHbg7r4ovtBsKNyLEqzV/bhW9VHqallnrpixnQuvBTh1B
	qT/QJ0edZSzi8K5PZm8D4khcOZG4HD89Qr+79wqiXMEYiVT0cUG7DkfvkWcVfgqUmtvXn0r5URu
	IjaQGcWqW6jnDEv/qmlO1S//KNiVi8DjfppFnlWS22niHGHY+Ww13NgXnVJZXLy5e1sg+EGHgZF
	KglCELrV6MkbS4IJLccJgOsz8AZ5wCk4d/DHFaoVnYlh2NePVQ91e/fD86ddzhP8yodg2euu6qP
	F/pudNeNAZCgocoI58lGSWa29orvOKbIve6fyd4tpv9RUWzSNp1nfB3h5W4n5OSs79jEnsUd46l
	1FiBkoMZd7XuPpvFbiq0iE8//DHslA5ocjneaIVGxPdhfHMnuBC3cCGG8Q/O8Fbc4qAf/0Z2jKV
	Vn2tePqHX6jpzjk9+rNSA/OEok01CVdrVGjaRIXKsdIo7klHGeULGubdULcbJQ0dxrqH6+gjpOy
	V6A4VCftegkiUddeKmbQoTVhR2yi8A2G2+yuVnPbPTwAVKvW65GvlXusz+rp6+TihSsY4x/JT3G
	oUOh3Hd9hrv63956R
X-Received: by 2002:a05:7301:90d:b0:36d:6a77:960a with SMTP id 5a478bee46e88-36f73893ca9mr2063176eec.1.1793943581818;
        Thu, 05 Nov 2026 21:39:41 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm6126445eec.3.2026.11.05.21.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:39:41 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 21:39:33 -0800
Subject: [PATCH 2/4] ASoC: arizona: always parse device properties
 regardless of platform data
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arizona-asoc-v1-2-25ec7338446e@gmail.com>
References: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
In-Reply-To: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.17-dev-e56a4

Always parse device properties in the Arizona jack detection driver and
codec drivers even when platform data is provided, allowing DT, ACPI,
or software node properties to augment platform data configurations.

In the jack detection driver, initialize the headphone detect channel
from existing platform data before querying device properties so an
absent property does not clobber it with the default channel. Preserve
existing boolean platform data flags using bitwise OR assignments.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/arizona-jack.c | 27 ++++++++++++++-------------
 sound/soc/codecs/cs47l24.c      |  3 +--
 sound/soc/codecs/wm5102.c       |  3 +--
 sound/soc/codecs/wm5110.c       |  3 +--
 sound/soc/codecs/wm8997.c       |  3 +--
 sound/soc/codecs/wm8998.c       |  3 +--
 6 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index 6587d46a1867..d5f14fc8af7f 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -1184,7 +1184,7 @@ static int arizona_extcon_device_get_pdata(struct device *dev,
 					   struct arizona *arizona)
 {
 	struct arizona_pdata *pdata = &arizona->pdata;
-	unsigned int val = ARIZONA_ACCDET_MODE_HPL;
+	unsigned int val = pdata->hpdet_channel ?: ARIZONA_ACCDET_MODE_HPL;
 	int ret;
 
 	device_property_read_u32(arizona->dev, "wlf,hpdet-channel", &val);
@@ -1213,21 +1213,23 @@ static int arizona_extcon_device_get_pdata(struct device *dev,
 	device_property_read_u32(arizona->dev, "wlf,micd-timeout-ms",
 				 &pdata->micd_timeout);
 
-	pdata->micd_force_micbias = device_property_read_bool(arizona->dev,
-						"wlf,micd-force-micbias");
+	pdata->micd_force_micbias |=
+		device_property_read_bool(arizona->dev,
+					  "wlf,micd-force-micbias");
 
-	pdata->micd_software_compare = device_property_read_bool(arizona->dev,
-						"wlf,micd-software-compare");
+	pdata->micd_software_compare |=
+		device_property_read_bool(arizona->dev,
+					  "wlf,micd-software-compare");
 
-	pdata->jd_invert = device_property_read_bool(arizona->dev,
-						     "wlf,jd-invert");
+	pdata->jd_invert |= device_property_read_bool(arizona->dev,
+						      "wlf,jd-invert");
 
 	device_property_read_u32(arizona->dev, "wlf,gpsw", &pdata->gpsw);
 
-	pdata->jd_gpio5 = device_property_read_bool(arizona->dev,
-						    "wlf,use-jd2");
-	pdata->jd_gpio5_nopull = device_property_read_bool(arizona->dev,
-						"wlf,use-jd2-nopull");
+	pdata->jd_gpio5 |= device_property_read_bool(arizona->dev,
+						     "wlf,use-jd2");
+	pdata->jd_gpio5_nopull |=
+		device_property_read_bool(arizona->dev, "wlf,use-jd2-nopull");
 
 	ret = arizona_extcon_get_micd_configs(dev, arizona);
 	if (ret < 0)
@@ -1242,8 +1244,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 	struct arizona_pdata *pdata = &arizona->pdata;
 	int ret, mode;
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_extcon_device_get_pdata(dev, arizona);
+	arizona_extcon_device_get_pdata(dev, arizona);
 
 	info->micvdd = devm_regulator_get(dev, "MICVDD");
 	if (IS_ERR(info->micvdd))
diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index 09cef46f09fc..6965a2ec7642 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -1222,8 +1222,7 @@ static int cs47l24_probe(struct platform_device *pdev)
 	if (!cs47l24)
 		return -ENOMEM;
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	platform_set_drvdata(pdev, cs47l24);
 
diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index bd747171212e..f7aaf1433ad7 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -2041,8 +2041,7 @@ static int wm5102_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm5102);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	mutex_init(&arizona->dac_comp_lock);
 
diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index 73c4ffabf4ec..58bcd54aff11 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2403,8 +2403,7 @@ static int wm5110_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm5110);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	wm5110->core.arizona = arizona;
 	wm5110->core.num_inputs = 8;
diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
index c126afb65928..877305a83283 100644
--- a/sound/soc/codecs/wm8997.c
+++ b/sound/soc/codecs/wm8997.c
@@ -1119,8 +1119,7 @@ static int wm8997_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm8997);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	wm8997->core.arizona = arizona;
 	wm8997->core.num_inputs = 4;
diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
index fdb2018e9367..28af93104201 100644
--- a/sound/soc/codecs/wm8998.c
+++ b/sound/soc/codecs/wm8998.c
@@ -1346,8 +1346,7 @@ static int wm8998_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm8998);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	wm8998->core.arizona = arizona;
 	wm8998->core.num_inputs = 3;	/* IN1L, IN1R, IN2 */

-- 
2.56.0.506.g506a7eabc5-goog

