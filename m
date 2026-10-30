Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350667;
	b=rODEqSuOZ5sraokP+gpmOULQqCVB3uIk40WpAKiKxU0TYrBZin8WRdRkP3q+LOX0Yaqh
	 kO2XeX8WUQzLvkQVhJp1c8kcqaf0hPVa2HKar9DDLiRP8NfgdrZ9TPeLNhw2hh2k1ZtNx
	 HxqY5WjyFW4DswJeXwrb6H2xqnvRAapHSzy66ZcKz/1yaYnEKzx8BF/D9nG7O6vHxP5/C
	 aaFmzRh/FMATxWaAtvw4sRzpWBypJrcNtHL5gX7oSRd+xsdOAeaEzx+wiKlXtRf1BUh/w
	 zZ/LMPp1cyVgBf4ZCCylOMbXzhwgesxRrI6ENfCUyPNu9MYmVG//1q0zzwCCqpA9uDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=If4vsWGhaeiTS83cVTbg7yhri2qjNXjXUxc4AnG1P48=;
	b=VDS4uHuQbgCbHkf8eq2ITT4wHjUZ05OZhqoNU0hsir1ymm4S603b5rw3+FXfsKSSk/Vg
	 FxGqijowkIjWiZzsJga6YycFYKeoRotKeiIZ2oKA9KwJw5aWpC0WO6G9lV4BZ/46Qx7KN
	 IVKH1WUw/QGNg+ahlL368mR4dz1hcPvGXmoX5AHfMdq21FAIsmFLOtd30h9kjyEHK1sPU
	 cycK3GJGZuPPhtkMg+5VLu+0cPi1xwJqgFuylJfb9fZWIdn1m7pjT3c5BtpeUo1JXvJQ2
	 OF4wEJa49dp5eb5nUu5m1WSl0e67rNo36RV6B2PTVhqpxR4wzKQhvpOVJBLx/IVZLng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tP9TCIdt;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A7E606A31E
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 08:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A7E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tP9TCIdt
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so3040485e9.3
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 01:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793350665; x=1793955465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=If4vsWGhaeiTS83cVTbg7yhri2qjNXjXUxc4AnG1P48=;
        b=tP9TCIdtLibxgvOn4AvisJ69/kZYvCD9tgfwnXdY2G4tY3iTiZthUPn+B61shOag+/
         SyLCxsCfayAxNWfs1mjps81cvPwhjSni02SSt1NUtVKMty3ALS5pbnHNI5Ql4HX9WwM/
         eHJYvKn4AuIDijAWulbdmoShh3n/IwOEJNwEMHVGa+y+vkBiMM3CFgXIITbNyKoWJvL3
         I8fTFJCfL4tTq4xutb1mSD+Y5lo3iMn5ezIz1laxSLKsOCqXL5MFirTwepWXe8cjBlxO
         9UrMzrwL2VzkNSN8KIvgGs0VNnPnwGolulJOEh5QCuqCFDAi2jWvZOhCPEG+vm8j9aeg
         cOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793350665; x=1793955465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=If4vsWGhaeiTS83cVTbg7yhri2qjNXjXUxc4AnG1P48=;
        b=GBDRtBsl4yGzx/mW5D5f2xYKdmyIwlSx1HQYRcakarPxgbkbNVgnqSpiwDVTdCK4xU
         BDIkpP8bYSE4hW25nMimygqEGfC8C4D3UwvhsFmXdpvlk+l18a0tpBm4vOLK8+WorsZZ
         pIxMHZgyIUVNybQWYm51ta2LM7+593UMelwBaDwXvWKqI6JVpK/KO95BPhBH4dxfKaq0
         /U6uAkSC5ajt/Urcpl+7moi73wl0j+h0YdHyrUESzsNw8mHcK+Snls8eGWSUv4wEo/mT
         oeler4iX/HtCbRKgXaygT6GJcnEHQBUr8antmmnNTME0fxqixhq3IuFaVTm3VeFplIxZ
         iebg==
X-Forwarded-Encrypted: i=1; AKwUvBzi2Amiu4v2o/idNuna+EtyhSVXWzydx+64PDkrdu4k61/bWJWTrRM/yCJi7JyHu/Khon1JPBheMREXWw==@vger.kernel.org
X-Gm-Message-State: AFq9FYItWxGorYWxboHQ3BzFOfzZq5I76ZumWw9FpZ/RUc835/9U/LlE
	oB230IOYkgky0MOJbatUdYUv9ZQLUPQ6VVTatjPTRSuDSkEqzb/KrMGT
X-Gm-Gg: AYBFou3iE+S+I0+qHVR+w3Q3lp/NIpvYHZiAfDrwfjHfFAX/jbeCKVLrjG0VBt8a5Pi
	WeEKHVuHpw7zetHVAH0nNvHu2y80YmGaqTqVyPT3DS+tRBa37G/nHI+AAhbs3EdBJSF5mXPDy9G
	XrosX3odtxFSiirCAlY8/6mvqveVM1u2FWMMAf0IZ2ffsCVLb65nL/uOFbRuPUI95xNOa6nEhHW
	iBxiECtHycqJB6Ck5o0JVtEcRGmAoXtfoRdPyhZu/92jKrkQEF8nWXvpWtdGOldiv/gzRZlmucY
	cWPIRBmQyqCZWXJuZeuLfoL3qJl4+qj+IJC4QrJpgU1pBgvc2wnXla9cUg2eMYr1edh/9wDIk2u
	A0qE6qDAo1wPMPzDqzXiPnpY7fOaz1bDC+cwG02t+m+n1eG9R9uj66c5q1KBVmBA9da8w8EesOv
	xzC9CBFRwg0ctLXUz6DUkzQUnRvFXJIw25enoAeTiu2QeGkh89IIjRBIyjrI7ciG1SUgH71pjBv
	G4Emb9K+E2/gDj2VnOeg60Rv+0oWjbe/SEuSdWO9dazE9pAl8iO7FKpI0cuiNnnPlyACOobUWOj
	HBFaoqVS3VScQHukSi+RUOFx2ZFbGvjsf+1inHm8oGqJbQ==
X-Received: by 2002:a05:600c:4585:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4ac1889d5a1mr33312815e9.28.1793350665364;
        Fri, 30 Oct 2026 01:57:45 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:6ca3:c7d9:c03f:68c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09ad35fdsm28215155e9.2.2026.10.30.01.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:57:45 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/4] ASoC: rt711-sdca: handle HID button read errors
Date: Fri, 30 Oct 2026 10:57:33 +0200
Message-ID: <20261030085735.2146047-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030085735.2146047-1-thnkslprpt@gmail.com>
References: <20261030085735.2146047-1-thnkslprpt@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rt711_sdca_button_detect() returns zero when a regmap read fails,
so the jack handler cannot distinguish the error from a valid
no-button result.

Return the original error and make the button result signed.
Skip button reporting on read failure, but still report jack
changes and clear button state when the headset is removed.

Fixes: 7ad4d237e7c4 ("ASoC: rt711-sdca: Add RT711 SDCA vendor-specific driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 sound/soc/codecs/rt711-sdca.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 9781f289f8adc..11ffe1b861972 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -184,10 +184,10 @@ static int rt711_sdca_calibration(struct rt711_sdca_priv *rt711)
 	return ret;
 }
 
-static unsigned int rt711_sdca_button_detect(struct rt711_sdca_priv *rt711)
+static int rt711_sdca_button_detect(struct rt711_sdca_priv *rt711)
 {
-	unsigned int btn_type = 0, offset, idx, val, owner;
-	int ret;
+	unsigned int offset, idx, val, owner;
+	int btn_type = 0, ret;
 	unsigned char buf[3];
 
 	/* get current UMP message owner */
@@ -195,7 +195,7 @@ static unsigned int rt711_sdca_button_detect(struct rt711_sdca_priv *rt711)
 		SDW_SDCA_CTL(FUNC_NUM_HID, RT711_SDCA_ENT_HID01, RT711_SDCA_CTL_HIDTX_CURRENT_OWNER, 0),
 		&owner);
 	if (ret < 0)
-		return 0;
+		return ret;
 
 	/* if owner is device then there is no button event from device */
 	if (owner == 1)
@@ -259,6 +259,9 @@ static unsigned int rt711_sdca_button_detect(struct rt711_sdca_priv *rt711)
 			SDW_SDCA_CTL(FUNC_NUM_HID, RT711_SDCA_ENT_HID01,
 				RT711_SDCA_CTL_HIDTX_SET_OWNER_TO_DEVICE, 0), 0x01);
 
+	if (ret < 0)
+		return ret;
+
 	return btn_type;
 }
 
@@ -330,6 +333,19 @@ static void rt711_sdca_jack_detect_handler(struct work_struct *work)
 	if (rt711->scp_sdca_stat2 & SDW_SCP_SDCA_INT_SDCA_8)
 		btn_type = rt711_sdca_button_detect(rt711);
 
+	if (btn_type < 0) {
+		if (rt711->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_0) {
+			unsigned int mask = SND_JACK_HEADSET;
+
+			if (rt711->jack_type != SND_JACK_HEADSET)
+				mask |= SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					SND_JACK_BTN_2 | SND_JACK_BTN_3;
+
+			snd_soc_jack_report(rt711->hs_jack, rt711->jack_type, mask);
+		}
+		return;
+	}
+
 	if (rt711->jack_type == 0)
 		btn_type = 0;
 
