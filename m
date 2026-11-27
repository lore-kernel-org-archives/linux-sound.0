Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799182;
	b=r5wYJQOitnWkeGL6uNQ/jQ1uDIOinz10shIrAmTQwoJu2CFHHYBWY/XX8s00QT3jIJjD
	 L1Kmbz0E9AJ3V2KHHCFSTxAMhc6mpjRdwNOGw8tnETTcEnrbISfO4GQOM50PZi992iidi
	 AN1WgxgDgCRq3xneX6k3iiypr1/x3BIOjG/FkCbZ0in/1AAm1PJ4HvXPCJRLT5fknmDu2
	 5xj9kdSVD6FYJx7pUZZ2NoLJ8d8BMoiDy4kPVCURAeetgc+nZDBMh03gp4FSBCLJrYnGs
	 ua2l9SZptMyMOmtRlNlxkcCgU4EEHZ7gaH5FcqzeeKK3hsQuKUPtASZHBPZLUnSVdtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g1KQmw9HEAIV75UKtQgFIwtTmsEH/I6XD9iictGjPFs=;
	b=FWLNJNDC1UGCsVTizIXjJU1BqxDWk9i7rBkONGjVb7Z59jPGrT9kHf1naSqLu6WDQIfm
	 7fHaEuxilkKy+VXieqStwM57/t2mXtT+M09YxvS6LOlsYjdcxmrTFv8R+lT4cjunNOZb2
	 bpBiTdYHTiAXcqAg/eASG3lc5mZ1ARv++29F41tgg8x2h8VM3eAozhxt4hQDo5L7YfUte
	 IfQgcxwRMQacSvd4/O3XYqNaonH0EiKkC9kVeLxSoVbYM6Ry2JpFV/ZO8LtBKgXMWs40U
	 +WIZWjSCCxKuiciyc7xmvLVe4x42P9eY8GIqKtxH+9xKnSQme/MwG3eqP3MOes2AVxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VWNFIC84;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6809B606A321
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 17:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6809B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VWNFIC84
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4aa5833c263so7998937f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 09:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795799181; x=1796403981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g1KQmw9HEAIV75UKtQgFIwtTmsEH/I6XD9iictGjPFs=;
        b=VWNFIC84OhJEVgXGSOwIpVM2bJAY0l2A6L/QADtOLadrGJKpafRkcyne+ATWZ1O8fX
         tRC8CSqMDh8bQj3/1VOrJZ5yXTAHYZ7teRJvBe0KKZfu5bbDLSBEQmKeidV+3SInrbeY
         n7Whdiv7nRLkfWL9HgabGFfVzlGem6+zihaOYweVpSDoQo758P2GaZ+A3Cx1nIGiWm+l
         VjLhT5bj3dxO1rdDjwleNsyBqzhdB4vIcz467dG417yp24vVq80QOaqVo4HcJFwROw/M
         Ga9UxLdx2KSniycMoCYntQb5EfYt7yRzrTKdX4Ut5UVQdH4jdQhQfEtmtjt6pt87KNC5
         i+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799181; x=1796403981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g1KQmw9HEAIV75UKtQgFIwtTmsEH/I6XD9iictGjPFs=;
        b=ZNbmX7a0u/yO6XsRvKIo8Y4QohT8OX+KuLvgh8s5etHGhVYeKrUOFk4AbeBx6717bD
         6KxHGpORWqc7ol9z4BoYuHsjt4T2PkMk4Plef0FFhAHDc5ihNBY/JRFW3XPB4aD1fKCL
         P38XGzYBL9cI8fT44Z62rAhcWU4v5yln8kgXAnSEuwt4A2rPIBiBKnSnfSUedZfLNbEz
         yIgtx/fVc3Fq2q8pseqJm73k5ez+puLCUk5Vaci7vurtOqlYT4mahLY18gXGGm/QwUqy
         2fvIPCM3MWuwkObtJJ0kQFXhkqXROusfdes3mU/chz4Nm1FOwyprJpr0klW/5xZY07qg
         ZmZA==
X-Forwarded-Encrypted: i=1; AL+hErGcVW2mL1u/htDWIbiQuTVMHqpRF+ITPYUM8j5SKHCSOgLdogDm8nK9yjUG5/2ranir3bG9nH0rQo9nFA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7457dX5x9Blj7IYVRB46Fp46kBGiJu3mN7cIn/f/1xPMRLFBE
	OM4PLfJi1D92JmStUeV4iut1BPVOMX3QpWGv/RPneFYBlqs3Ufehr3w7
X-Gm-Gg: AZFdTZfF3ZqblzYfnP3JKtTxa0Jh5oM4LGLpUEEaxGmWbh7SZ2pN3HVmjxWTfhYKs2M
	9z1VGHlmCLmN4pptn5qj4l1djfpLVAVLqzk9qOWGG6FjgGhLlltuX9KG43l7uErA4FPk23nff7C
	eMahYDYHMdhgkCYOV03zM1b9D3/3N5DMIvgyClpbz8A1F0A0rKakDM6sGAv94JhoOFsbybO6EPt
	4AZgyqUyKBkKbcNsl6DPVTCgn1od3O9/9boubgjXBuru6qrPxmxy03dY9etdsxuPTaMi5KWgDKn
	8Uor3FYfTnOYSg5UAQq7WkU0ZA0p+RbPrXICLy+kv5Oy1Hwxp0MpdWGGG4EWB+i7He51y1Qyo9Y
	ZmfKq2MBQGGCtQ4zzdSIF7gSsf4DefjCjpIxP3/Fc3QEAVzHrVYcYlnq7HalyT8ykZXKtIYV0Mn
	h26FEO7ApJZO58OVd4lbRHmNY2Lyrs5RZA86y4VaZYey5Ns3Q5pdpGTDPo0xOix4Ib47YONoxMe
	swo6Bx2RRuLSux0L5CfrW8kryfcN7kh3dpWBn1LnUnixcdJ2WNX73+upYaGbp354qrURDYwyb62
	HV9//HCMR1ZomhI16HDfha+5AQOTF0m5wPjpjR9lsOLm7t5ZWCTWjpRtjQ==
X-Received: by 2002:a5d:5d0d:0:b0:4b7:66fb:b098 with SMTP id ffacd0b85a97d-4b766fbb5abmr28304884f8f.20.1795799180462;
        Fri, 27 Nov 2026 09:06:20 -0800 (PST)
Received: from SMW032656.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm49324759f8f.3.2026.11.27.09.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:06:20 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ASoC: wm8962: implement GPIO .get callback
Date: Fri, 27 Nov 2026 19:00:37 +0200
Message-ID: <20261127170039.663-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127170039.663-1-laurentiumihalcea111@gmail.com>
References: <20261127170039.663-1-laurentiumihalcea111@gmail.com>
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The WM8962 codec provides two GPIO pins: GPIO5 and GPIO6, which can be
used as inputs. Implement the GPIO .get callback to allow consumers to
make use of them.

One important detail to remember is that the get() callback will not
function correctly if the input pins have debouncing enabled and DBCLK
is not enabled. In particular, for MR-NAVQ95 where GPIO5 is used for
headphone detection (LOW = unplugged, HIGH = plugged), what would happen
is the get() function would always return 0 even if the headphones were
plugged in. This would happen whenever DBCLK wasn't enabled (or, rather,
when SYSCLK wasn't enabled since DBCLK should be enabled automatically).

We might be able to get around the aforementioned limitation by force
enabling SYSCLK before reading the pin's state. See TODO from the code.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 sound/soc/codecs/wm8962.c | 51 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 1832685aca40..7122d93a742c 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3505,12 +3505,63 @@ static int wm8962_gpio_direction_out(struct gpio_chip *chip,
 	return 0;
 }
 
+/*
+ * If your input pins have debouncing enabled, then make sure DBCLK is enabled
+ * before using this function! Otherwise, the value returned by this function
+ * may not be correct!
+ *
+ * TODO: can we work around this limitation by force enabling SYSCLK before
+ * attempting to read the pin's state? Is SYSCLK's source clock guaranteed
+ * to be configured by the time this function is called?
+ */
+static int wm8962_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct wm8962_priv *wm8962 = gpiochip_get_data(chip);
+	struct snd_soc_component *component = wm8962->component;
+	unsigned int val;
+	int ret;
+
+	/*
+	 * only GPIO5/GPIO6 can be used as inputs! Note the difference between the GPIO
+	 * index and the register offset.
+	 */
+	if (offset != 4 && offset != 5) {
+		dev_err(component->dev, "Only GPIO5/GPIO6 can be used as inputs!\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * we are forced to resume the device and bypass the regmap cache for the
+	 * read operation. This is because the GPIO level could change at any time.
+	 * Remember that the GPIO registers are still marked as cacheable. This is
+	 * because the configuration bits and the GPIO LVL bits share the same registers.
+	 */
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret < 0) {
+		dev_err(component->dev, "Failed to resume device: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_read_bypassed(component->regmap, WM8962_GPIO_BASE + offset, &val);
+	if (ret < 0) {
+		dev_err(component->dev, "Failed to read GP%d_LVL: %d\n", offset + 1, ret);
+		pm_runtime_put(component->dev);
+		return ret;
+	}
+
+	pm_runtime_put(component->dev);
+
+	/* mask is intentional! We (ab)use the fact that GPn_LVL fields share the same mask */
+	return (val & WM8962_GP5_LVL) >> WM8962_GP5_LVL_SHIFT;
+}
+
 static const struct gpio_chip wm8962_template_chip = {
 	.label			= "wm8962",
 	.owner			= THIS_MODULE,
 	.request		= wm8962_gpio_request,
 	.direction_output	= wm8962_gpio_direction_out,
 	.set			= wm8962_gpio_set,
+	.get			= wm8962_gpio_get,
 	.can_sleep		= 1,
 };
 
-- 
2.53.0

