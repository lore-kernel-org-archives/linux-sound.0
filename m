Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379863;
	b=m1bYVvehQztFshxgvGnlJc+EaNENGH1mkee0bvvoKY7BLZc6u4j6wRtZ9yKpZ+4nB2JP
	 U5Hmc9xRN6w6yQI54RB9DbhX4GVagi535jvMjm+FegLx1FgCosEwbuPGLP8SCUaxye4wO
	 wKMCyH3SiwlAg6CVB4MGEwFN4rcM5WFDAQymheDv+sl/2FlRBdHRt1qtdNbwCsfitdw9v
	 exiQ/c/C/HeSfZcQi5K0Brpv7Iom81tv+ULc8jvz7zzyw4L/n40A8Ifv8N2lv2Zze1DVR
	 1BwkcoDVmJE+ibChv8WLw+XFVYoiC/zFcQr36tp9ZmkZRzj+b9r53MJ+6gM1NeLmdmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=pHEQCdfSxii0nq13bXW9c5IyViFN4cTWPLLIw6alyys=;
	b=z05diM7Klg4AGypzwvCDegfqYb/0O3VkJvULbcGIUNi53YIT2tyUdYUcpw6Wf7aFbnLP
	 ZPbcojjGORZITuZFZe5INn002KGdpBtstUUmCBLF7h3uMfAclI/Fdxc97wD+Aelga6GVW
	 LBoNJqRqKydc3toRPd2LXRajFewaf46LUgjf8feRxd6V/D/AqbZ08MguttxG/HSnCUGEU
	 sVAaMMy6GhO5bu7PvqdpKNZph0IJylIUmEEjSh5TJf1tGb19ClMGwfs4m3NuroKUk/JfZ
	 ukGJY293e5FMF38dK8TXsM5ICVNJ6NmUx8YO5MB3ba2zg5/nIZxDbRhDki7nDuyHzLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9dK+NiJ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F1C606A326
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 17:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F1C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9dK+NiJ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so7190645e9.0
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 10:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793379861; x=1793984661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHEQCdfSxii0nq13bXW9c5IyViFN4cTWPLLIw6alyys=;
        b=b9dK+NiJn/FfbTh5Z1ZSaooSJk95Lu/nMaO7kHMYykHBl5BgHUM/GLtCayYhTzLDPG
         gUlFzY92leUSqElBkJeYiRDZJoY3hmp/vYhV2ZMQAOUb+ASqDjWuhg9zrzAH6UFm+LSW
         IBlLaVpuOwgwTbESrbvEgM1tvKabB+72gKbWd9oxtojGDD7PMc8KBonpEJkuA0VuJPd4
         4otCVUDtkypQ44dRZr0v63nJedHHtu8YAqBZC9rk/BlSDBRfEVZsl9tZeEbp8++N+cQr
         0EknJWBSZSdP0Zrty07Yvjb4b08MV1gcUuv4xX5JsmAQoI4s0ai5KuvyKcUJJwtaAhyw
         h8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379861; x=1793984661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pHEQCdfSxii0nq13bXW9c5IyViFN4cTWPLLIw6alyys=;
        b=zINeaQAdWaFjYdwOQ1/LY71CIYW1wyEkoUmvOz26CbVdWNMha6HzIgFpj2cmLZyFdZ
         uonIvQAjqtE39iTjHq6nXUWdzIZ7MNogVvMA4prHQeGQYO90piDQEJqlHODdBtWynZ/z
         30UiyiBMt2Ok4vtGjUZIXK+DptRMoDz+WKXSqHR50+3LeTrKSYl7dFMaL3sAPHQPaZ3b
         2BiffbSU+rgoCVSOtd5aullIxsej7FIHvF1lPyY830rkl7KfMl0rI2tV9irk6Qa7bTIR
         sgNxT2aTuLcRhzajC0IMI3g44pMdnU0RAl03hv5sDzEq3qPSl9ZGOeT3i3TOotTlWlvT
         lhMA==
X-Forwarded-Encrypted: i=1; AKwUvByL1rS0uQsNOoQkcVSV+b5/fizOTD7jSWf0/UWitUmuOl72XdsCzJRGnsjOhvQJ7m+t9Ssc5mpjL6FXiQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLQPbt4wp7cFPY2F3t9D0jdYYJK2N8AiTWfDtp0cZ88h2kDVPm4
	2+s887z2hN8ZftPPbxPn/HyA2K+MzDNkrwSnaLUP7HG7L7DpyKgXbjU=
X-Gm-Gg: AYBFou0/MAHd5FwGE7e00BwYggjcH+PYP2h1+woQPMdKE+wN4Z9hBEte/X4P5BHe7lc
	swrQDLgr9ChqVrfvBK+kWqXSFOiHQqzKAhhtv68v7KdZNlDQ4u8TlL3Ha6vQQwGXUmzHQeT4JXh
	Z+9D34a95v6JTldGQdsez+3PBMlvijz3++yLBamoaNSiCuZPyYFpjrS52d/vtAeNsBA4cP/yPmJ
	IWYEe4ngx6nCThhF3bnWVucCkMuKygk1hCq/dV11Seob4ugciK7mYhSIzwVFZGDEzse8Xft7W/+
	3svkLnTTAX3UX6QOxj91QIKtfZkMgpIpz82YkrYMo3s2qw9MkO+AfmFc4PQkcGdBmuBRM3MmJsb
	7zJYsNamxROKpHbkV6vP/Hv74CGrxjjf6c6UYhcXfbZjjpJv+NFPSBognEGk/yVawxmVi8yNgvZ
	uGY1ds6HfoqYUl4gmyt7bEXuPuv+3L2kuhuexkVDtpQzE6gXO/0ptue2HQdyHpHy/0dxSJ3AdH9
	k3U+Z4P6ABTfuG8TMp4N/K4OR+pBh6Dg5IVNSC+PQIDLBPlyolOX3Ws9ILxtI3N8ncSl9goolIt
	TvIlDSSOAK4=
X-Received: by 2002:a05:600c:8b04:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4ac150b2044mr65640295e9.2.1793379861164;
        Fri, 30 Oct 2026 10:04:21 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf7146621sm75121785e9.13.2026.10.30.10.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:04:19 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Mark Brown <broonie@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Bard Liao <bardliao@realtek.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v4 1/4] ASoC: rt5668: cancel delayed works on component removal
Date: Fri, 30 Oct 2026 17:04:13 +0000
Message-ID: <20261030170416.3561618-2-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030170416.3561618-1-tristan@talencesecurity.com>
References: <20261030170416.3561618-1-tristan@talencesecurity.com>
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

rt5668_remove() does not disable the IRQ or cancel the pending
jack_detect_work and jd_check_work delayed works.  If the component is
unbound while work is pending, the handlers access freed memory.

Track IRQ acquisition in rt5668_i2c_probe() via an irq_acquired flag.
In rt5668_remove(), disable the IRQ (if acquired) and cancel both
delayed works before resetting the codec.  Re-enable the IRQ in
rt5668_probe() when a sound card rebinds to prevent permanent IRQ
silencing across card unbind/rebind cycles.

Fixes: e13da14e8543 ("ASoC: add rt5668 codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/rt5668.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 4154bad276101..ab63a43b20b89 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -62,6 +62,9 @@ struct rt5668_priv {
 	int pll_out;
 
 	int jack_type;
+
+	bool irq_acquired;
+	bool irq_disabled;
 };
 
 static const struct reg_default rt5668_reg[] = {
@@ -2216,12 +2219,26 @@ static int rt5668_probe(struct snd_soc_component *component)
 
 	rt5668->component = component;
 
+	if (rt5668->irq_disabled) {
+		enable_irq(to_i2c_client(component->dev)->irq);
+		rt5668->irq_disabled = false;
+	}
+
 	return 0;
 }
 
 static void rt5668_remove(struct snd_soc_component *component)
 {
 	struct rt5668_priv *rt5668 = snd_soc_component_get_drvdata(component);
+	struct i2c_client *i2c = to_i2c_client(component->dev);
+
+	if (rt5668->irq_acquired) {
+		disable_irq(i2c->irq);
+		rt5668->irq_disabled = true;
+	}
+
+	cancel_delayed_work_sync(&rt5668->jack_detect_work);
+	cancel_delayed_work_sync(&rt5668->jd_check_work);
 
 	rt5668_reset(rt5668->regmap);
 }
@@ -2533,7 +2550,8 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
 			| IRQF_ONESHOT, "rt5668", rt5668);
 		if (ret)
 			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
-
+		else
+			rt5668->irq_acquired = true;
 	}
 
 	return devm_snd_soc_register_component(&i2c->dev, &soc_component_dev_rt5668,
-- 
2.47.3

