Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D191E30DD22
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 05:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993724; cv=none; b=iq7zoiaYBcD7vYGuaU5l24oETEZPFyl+Nl6kUhxqW73ted+Qwgd12ak5FL2KMno4RzLEEVc/+2koIG7UbszXO3pNx1Wt13tv2JTfdyaY/tHir/L0nIcDmy0RzGM/J1DjQWjb9TDZXbarF4nS9oKs+Mg3BMop5Od+GnNLz08/Zz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993724; c=relaxed/simple;
	bh=0iWtgDDIFrHYDk4E+PsLQmmYM0+L8OeY1QwmiBglMDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sh4w9Xg4XD26O5KqxHMk7nwNGziZBHlCB0+p+VQTvlvgGa06fSv3gNNeckCKvHUYBp60DDUm+sKrqf7O9onbgCydoxd5P7b2/Wbgy2uu/Qp+tYEEwAMb5MbtIep9M5ALxdhDPOKTatWuXVzbeqGYpDRld6787bbY1JaafwIC9JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfXrl9Hr; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfXrl9Hr"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so1659974b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 22:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993722; x=1786598522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVcxW4CrMFPdiaxkpRl6bL+HxVIt7TtpKeqoh/VcgyE=;
        b=ZfXrl9HrFLN/VWxLAarYEHct2xbCNzjKX6akDwmhuDApFLopxqM+5DSSJ+Yfp2MH1Q
         ljad3realcuIZp/rKk1EQky6gcnVPZFLPGz8Di9DpvpAWqPkwOcCnAD70f9tFV67Ze/b
         MmU0HvH4Fp2y6qRdvvdRveImBpAl/OS9JD+IOUZlmsfbXit53n/vx7Q/Z8x0CV+b4xSS
         eZV233+2UkPyG61LQeYNWDX6NBO4sB5psoNRkvkquTEI5wyb2QcJtuUkk7wUFr0q19Ho
         gp/bNaiySOBWtWCFlwURasqiMNqFdApmVQhMcmPwCGwzy5Xs6shS8w5mhFRKsoEhqA81
         zzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993722; x=1786598522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVcxW4CrMFPdiaxkpRl6bL+HxVIt7TtpKeqoh/VcgyE=;
        b=aimJAyNibCm2g9kRDQ6ydXwDvx+XJYL7zxzeFfFBP3YWoMOPuxHTXOJFTlHjhHKF9v
         5sDG47qHOs2FI0yPgrFu11N/k3TNjjmKvDEPH9T182eawnJS+ZiItz8GFn0yhrpc8gkX
         53+nEsaBA7EMZG1iGxREiBz49WsYpgNbGB0iPPfqsWYNngfV9dcOF6pdW2ga1Ush5F54
         nbgpEvlryzavGDwOPl7gUShe2/eRqe2XfLCsLREKQx4oELB1wUsqGJ4N/9k0ytNILiaV
         bro6um+NqRmYoYVqqLVxelu/oCs+U1949AIVdznXf81QKWewJR/VlGWqvwcaxr6dUT4U
         YLJA==
X-Forwarded-Encrypted: i=1; AHgh+RpM7jgaWdj+AUyQECyO8d0oRnW9zBPanUj7b5EdYgbdQQLuXVOgPka4O9St1l/wPg3FB2IfhHHWFQ3cLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+80tlNG388n4CPFI4ixJN5jzkAyfSDjplVveqxCgJ0dooJdPm
	W7sWgOqjrIT8PL4CmQMha8O1rltPC6oyvu+yUjmOU/2hIVwSbaHG4ZJL
X-Gm-Gg: AR+sD10/vnx6T8XWFDPXfJrupTNeeuH23nffbx1dgE0kp0f9+oMYIqEUw/oz0afxH/k
	UfsdR8+xiPtGp36D3OOLmtf/YNfyuCv3qX/1KLvaIHrrgiQGPifNxSESnkNjJSYmmPb73T2nlIe
	L5pLPIVaujJj4dCqsxwScL8MnePDce9o6Qe8O41/1Coe2WWqiiXB+H71IS95z8ZpBLhgna+/T+S
	SpN/kp1eAMnupowVQRGWwJfBqZrKoz9ZnZTyd4HaHS6tMG2ZlMuZ6XW9gQg+zNE4JKoIU25RnHy
	BaHnCfGX0jJVQoEXz95VpYz7cja4TSv1ejAUoK+S802kxHvNUHUWtiYzdfge2w47MXNzR4qOq/B
	Jt6hKgZqRUB6rqVQBAM7/JjD+/OHyB5A0EjUlvI3kydv4euJ1Zqj4pb0iuk5woxUOsjobRWzdjs
	4TZc3i5RlMKMsZO1A3FG61448GequZbH+Ll/8An21ZQm+EdwLZOwWM6Kj8sWurFi64x5ZBeb+OB
	C0D7BK7nKrHNJF7fxqM7rz4MKpBtXMwuZ83AigJtPfyEg9MUTzXmZna18jGPFbeblGlRLMQG3v4
	fRpQ
X-Received: by 2002:a05:6a00:14d3:b0:848:63c9:ee38 with SMTP id d2e1a72fcca58-84f2e13adafmr13246503b3a.39.1785993722219;
        Wed, 05 Aug 2026 22:22:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/14] ASoC: rockchip: rk3288_hdmi_analog: Drop redundant probe error messages
Date: Thu,  6 Aug 2026 12:21:23 +0700
Message-ID: <20260806052136.21034-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Remove the probe error messages to avoid duplicate error reporting,
since the error is already reported by the called functions.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rk3288_hdmi_analog.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
index cf642a23c38a..d88d5ccfcdb2 100644
--- a/sound/soc/rockchip/rk3288_hdmi_analog.c
+++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
@@ -185,10 +185,8 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 	gpiod_set_consumer_name(machine->gpio_hp_en, "hp_en");
 
 	ret = snd_soc_of_parse_card_name(card, "rockchip,model");
-	if (ret) {
-		dev_err(card->dev, "SoC parse card name failed %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	rk_dailink.codecs[0].of_node = of_parse_phandle(np,
 							"rockchip,audio-codec",
@@ -223,11 +221,8 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 	rk_dailink.platforms->of_node = rk_dailink.cpus->of_node;
 
 	ret = snd_soc_of_parse_audio_routing(card, "rockchip,routing");
-	if (ret) {
-		dev_err(&pdev->dev,
-			"Unable to parse 'rockchip,routing' property\n");
+	if (ret)
 		return ret;
-	}
 
 	snd_soc_card_set_drvdata(card, machine);
 
-- 
2.43.0

