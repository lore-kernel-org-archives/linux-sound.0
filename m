Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566277;
	b=Jl7djLjrCCnNcSp/C0Hsqbav8Z94EepGD/ZWSDBf0S6BXsnBEse9xsgNnf9vm8BqlYkp
	 UkMOACsSiB7FQZIDwYiiadLf9B0YKWpZrhKAkAik0sgYIicVrw4ufJN2LhcDnhkW0UKWu
	 vaU8vImdII0+V5Tf1ZB+0iC7BnSdxykI6enZOHy1daPrfBfyhHXKdyoqR3uUNBQiOE1ub
	 uEkFJW0q7Fp/7SPOVgkOmwRqVe4d69q1re93WuRLb/tPHFgg3Py+BIby2YbwRcfrp+zEd
	 vXk2E4AtvykjSHEj8fZJPuXodPRL36VjCeKO0hBtou+IZKzAXm3Y4KbmgF3ANX1Bw8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0q3RmALjF/bvDrFsLW6GlXC44FE9KFMVqpsZYQovitI=;
	b=Tb/GL4seYr1PEI5rDNQaTOUUpPgeYou10yEDShwGtGul1e8aEL6DPzYdQ9PY53Qo9AaX
	 yGnfoE9YHQz9jB63LPWe/Toyj8zTm+Zge4sGH6dx+jkCB9/cX2WdSSNtMNirgdktU+2vW
	 bdhkjDHXC+/KMm0vVXGuGDbDuBsTm4+8A6+LWoTgolB6DzxlyXuT8JITrs0QdfXyvabEq
	 JaFzjKddYk4IHJVm5Pp/rGUlH8WOutAfPLmdUhZnBww6M82fIa+WdpPhOn8DAmaX4zHN8
	 8z3FOFinfyBozihktMOxkQ4IQUGUyKYTaKXxScdWvo2GmhTqYYiNBf+Xu6j6I+oGD4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2WnIjX0;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161CF606A32E
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 10:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 161CF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2WnIjX0
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b8ecfa886bso920117b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 02:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794566276; x=1795171076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0q3RmALjF/bvDrFsLW6GlXC44FE9KFMVqpsZYQovitI=;
        b=e2WnIjX0L/uaDrA8lDs4m5wrhQjwIodzFg1NmphQM+jxOjr5jw0+fy5OcxlP/Vku8/
         wspc5rQNLXOBVwnhS4pKHBzEGPXHO0N/Bi1zOtPNCYBScjw5SRgqNhsh+I2TDKPKWOzb
         qmo00VSHrrE8znHmzMclufDTKDPl7ScPaVYnRzd378HcUQK/cjBW0vbCGgijuMrnNocg
         Qv/Dau/iqQd7om001B6rSUKIzVSpnjtaUMb77W7c6ex0NVMlW3LHxF2Yjl2LeSaWkPLb
         rTwOq7c3bZiRn+KaVaRtM+x4WxqeO+wS/yfOWK5muuEbz7EdrN0ywzr3hH09/CXEiBgU
         0AHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566276; x=1795171076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0q3RmALjF/bvDrFsLW6GlXC44FE9KFMVqpsZYQovitI=;
        b=PYFbg97zbYvvxIf/kPPvu0oYzdTkjGqkq8lf+kDAicliU18tWMTXKi8AQI2s04uGLL
         tz10kz+EE6W3vjKK79WgniN43+rbMZPfZF++1t7WRhMLLhm+mlpF19IxXl4+4JiVA7E4
         5W2zUjzWX3056j+G6d217e6BwNHu2ozbDbQ3ejkQRXd+dbg8XQ/njvLMfRQXzOKfLwFs
         abxKFRjn4nVWe2LxkycoNaeK4aKLC8jC8gU3eV3J+4fZMdgeJTt69OE0j9dCuWGwSNMF
         98u3cYFeSHna3TJ3rMOtvh73II/D83PfXAL825/eQGIUzVyH0RMrDeOSlZuob1oR/I/N
         PF/A==
X-Forwarded-Encrypted: i=1; AL+hErG3Xhg7yUTF7eTotN3yc+FoCIvMtrLR6HmcTFWpPoJKvwMBf5VDAMTxppWoqzLb3BA6uEY7ANxMHt6jow==@vger.kernel.org
X-Gm-Message-State: APuU4Z8X7Byn9Riaud1x0+iaopGV4A90wfh/1cBTTBcWZpQa6cbyCQIk
	XMNTWebbp9vXeD7MclXYLX5gQYZWESzaqTMrNUWfzF9bYa5KVnnIFHuX
X-Gm-Gg: AYBFou3En7rg1j0zrQW3RFPKq26QQaiVJGcX+4D7BtGmBEepYfZdEDt1yGhPV9820JL
	FRzvL13TnR+YP44lTuU4lnwlApIIq/bE6zHeYeWtYOo/pXh9Ihd6Jv0dFdqt2Oj5y2jmpGl9X/K
	gEMsSmYtVrYtWpuXsxK3RaHQ4LOyqf/Me7PWEQo/cx6yeV6be13aJQX4rR6JiKYV0yxoT8a0hAz
	ictZUwMFI9X24PZSv1NjmvPkzdT9Hhugj4EoUw/YZcZ4CKstsNUEwdDVmyEtfChptFvb1KE4xbI
	+W97/bQh8xRyOm7Q8ycY2xLN91jquuN+rNfjV6FGx8zdi6VGtRrj9ugjUAuiGBk9TgISf+I+GbD
	TBlzSC+bZx9TOJGKlciuFkiiNPxMkJHGT2KvDVPzhExUcIYs0/a7/vtrFadVtADb9jOU8jOtLha
	TIFsQ9UzUinGiS95Vo+mRRucbcntC7a9FnQYXGV3Kh02IwlZs6NhW/NjS8zm8MqjnRDHD/qM7a0
	6j81vARETGAbi88VtoBtDnk/332nD6OmrsjZiZ/M3/191FFDb4fm2ojIeYFk7C3O3MhxEPU79+2
	at6tM///uh//gPqGlJitcwJbvtNe2AHiAb/uwxSDs4y+SRzl2rSZp19Z/0GZFv85WlC/5uDOS+Y
	o4//+BvlgXUZMea+UKtz29da5KtvoziAMJMbPZdOxz/aa
X-Received: by 2002:a05:6a00:886:b0:8a0:2d72:17c3 with SMTP id d2e1a72fcca58-8beb619fbe8mr1640146b3a.15.1794566276302;
        Fri, 13 Nov 2026 02:37:56 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm890955b3a.10.2026.11.13.02.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:37:54 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: atmel-classd: Simplify probe error handling
Date: Fri, 13 Nov 2026 17:37:26 +0700
Message-ID: <20261113103727.30449-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113103727.30449-1-phucduc.bui@gmail.com>
References: <20261113103727.30449-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() for clock acquisition to suppress probe deferral
logs and remove the unnecessary cleanup label, as all resources are
managed by devm.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-classd.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 6693bdcbb8f5..117c8e400184 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -547,18 +547,14 @@ static int atmel_classd_probe(struct platform_device *pdev)
 		return dd->irq;
 
 	dd->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(dd->pclk)) {
-		ret = PTR_ERR(dd->pclk);
-		dev_err(dev, "failed to get peripheral clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dd->pclk))
+		return dev_err_probe(dev, PTR_ERR(dd->pclk),
+				     "failed to get peripheral clock\n");
 
 	dd->gclk = devm_clk_get(dev, "gclk");
-	if (IS_ERR(dd->gclk)) {
-		ret = PTR_ERR(dd->gclk);
-		dev_err(dev, "failed to get GCK clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dd->gclk))
+		return dev_err_probe(dev, PTR_ERR(dd->gclk),
+				     "failed to get GCK clock\n");
 
 	io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(io_base))
@@ -593,29 +589,24 @@ static int atmel_classd_probe(struct platform_device *pdev)
 
 	/* register sound card */
 	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
-	if (!card) {
-		ret = -ENOMEM;
-		goto unregister_codec;
-	}
+	if (!card)
+		return -ENOMEM;
 
 	snd_soc_card_set_drvdata(card, dd);
 
 	ret = atmel_classd_asoc_card_init(dev, card);
 	if (ret) {
 		dev_err(dev, "failed to init sound card\n");
-		goto unregister_codec;
+		return ret;
 	}
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret) {
 		dev_err(dev, "failed to register sound card: %d\n", ret);
-		goto unregister_codec;
+		return ret;
 	}
 
 	return 0;
-
-unregister_codec:
-	return ret;
 }
 
 static struct platform_driver atmel_classd_driver = {
-- 
2.43.0

