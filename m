Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382522;
	b=tXMMHuIIKMeahAvkDtFtFzeOA/mg4NIEpv+NDbSVWf819esUY5U4hm+e1qFxO/BTcvB8
	 oWnYHG1x6A8d2BHoE/3xMKi7IFTJ+6GHQpOCSMpjDOe7f/Ngv7cqqXQGYIgDa0p1pX78Y
	 pIW1rt8hr8zRpFJwnyr1ZoWEtnscVHGW48L8oV74cytRMBVtBUMJ+JE2G5+Nvip5Gy3PA
	 OoSISYYS+F11I2Y8WknxHdJZ9qtgpEfC22PLyA8rfQ1E7/uYmyDPkSMOHGDvcvfz4k2lN
	 hAJSB1LCZr7vRmpYwc59ws7wZ5SXXdwVoR7kVvN584QvDBhQSqLeyX95buYi6YDietw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=blJPEsm3yTlzl7Q9Z+trIM/D190QszcHUFXY8FNDqQ8=;
	b=2Ka+oZMV2KahSWn6R/HFOrK5XSzBVa7UQiSHymU6cdhM/0L0SrQCftHTF4YSfW6pPaYt
	 J192IB3LnxxUgX9X0VBX2zygYa+JnNNl4wIDiPkigok93n+wSAA5evpEoIYZFQ0JZwseN
	 Htv0aPfbCiDyjeY5+kW0jLc8yJ546SGHhBlckafMviS3UXWaBOjNx9/mQKj5+9QH204S9
	 dtAk+3oUQ85WGny1OwjMnMjEtN5eya7LGhx92C4fulp+CC4e9dkQcbY2yAMPCP4i2vsQZ
	 FdsEO+qVgLGCm1+3kfcgyRqUWJC3I5Y/on8HTz42kGOTVzOsVLLvz3TrxENBeHuG6GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r6K3xeVT;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1660060A2601
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 17:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1660060A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r6K3xeVT
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df8fe8513so914672f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 10:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793382520; x=1793987320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blJPEsm3yTlzl7Q9Z+trIM/D190QszcHUFXY8FNDqQ8=;
        b=r6K3xeVTQJ+PkrzeYC608YNPD6yjhqOeRCT0Ld7O9l9pcjCJpuQOFqmvhcp0gYnwwf
         1Afh4QbuQT4Mvs0Sph+T4x46w03fy2txJVPTC8TZEcaTRNKUglVdS9O3Y58KH4oq1hoC
         r43cV9LMqrXe+bziOUmeesY6pHwHJNJ4NjvptwNG+MJ5AWUoyjC7zGx861eWKl0C5EQw
         mrPrj/wZ6NIpmcB9hgiCdF02Yn+DGvDRkndQG1ePHN/MdsSAlDpU3dkQLAy8Tc/FtK/a
         fNWF34q51AwFDJgVn1smeEAXRP5f+lhthMwJwe5d9uS8Ic9DhAks+wvh4l3luSZ7TN9F
         Cb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382520; x=1793987320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=blJPEsm3yTlzl7Q9Z+trIM/D190QszcHUFXY8FNDqQ8=;
        b=YSqWi37ZlO0xoQz37/liXcNj/1PuCdJO0wUBv5idB1zVD9RP6slxQ9Nq7N+ois4KXh
         ZmF+HtW6nDIuZmrjLe8iC0v2Qqka2b9VQ0IS8CCehLhjqd5TOe5UE2QGax/lV/rW52Wf
         e6nZoGQHOS0kor1aDao7mZjoTwbPrZ47CyrVhNQp0mtMgXDnB23qDK6ValOwY/AMkDru
         r2yIj/MlTwnuxKgPVyZ/OaBFWW6YQDV/RiirVA40MMwtL03y1kDeASW4jNJoOSGV/gTN
         /CdD+eWPph6dJDNe48Abk0Ah83tAQgQDsn2LUbRTBuqGS8UEmyAuX5xcxQnwQnYkryDm
         /YAg==
X-Forwarded-Encrypted: i=1; AKwUvBzgJaQjEpSUqP2NjnjOjJFPhF5kAi14/Ov8WunNweHr0oEsjhAqa7v5kdY8SNCaZbnqTeXdHZYuHbNC+g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKwdE2Q34i1iEN6gWw3tFwi3QbhTeHoUVvwETb04u6Uq1ZmI6V6
	JWrOOVIHYxHhFLFScyx004x8Cb0DyohHZv7YATit2+9mOZTgUrO8trM=
X-Gm-Gg: AYBFou0hJTZyFEKUH7KPSEOxyzFlxdeATNB2AG9Zve8kHjymwaGfa+XZBcpM611+nTD
	FHs2+IJDysYs4bElzMjO0CJw7qRVPTJajGn0qMzFwcN5VcsSXSBW/3cOw2GuPKmv/Nca4A+UJa4
	g3WVJ/JA+Pf3kGaFe+66cRDWZkE8kZWW60qE7OwhbR3OEyvx4aqzDuv7DwRuBs93JVsIFAK3xYZ
	tZU2VdCYkz46gZcDAwRJnBWrCAa5M/NfD962KGc1SG8Ci903UHPaDZWHsigv+6HiJ2aR9dDM+QR
	a2XNRM3Q+lNcR2ZbR4pO8oOQExvnvZCvOmc906vOUXuNyF4pPw5eGsTfrg/AwRUtUFHc7XwcvjE
	ZnHCRkrNLZD2K6jEw3DmW0LB9zPPyocn/O5qQYiz6RR4uSvxBc3ll/tJTnpwVYRK6diqdOGY9tg
	W9ryBpdojlnDfI6Wsn59K8Z3ky76zfScsFc8ih2m/UKjdzZN6+4C34aaSCaLbDhnDz9flxtEeOe
	7Shkbk7Px9bcWOFc2R7bGEuzMAQ/lV+WcmvAFGDTCb05wLI6ejmLlCqhY2h+BCPFErMf/r3jLEn
	BPCD+wRoiVk=
X-Received: by 2002:adf:ee0c:0:b0:48e:349c:af4a with SMTP id ffacd0b85a97d-48e6e529534mr5117683f8f.50.1793382520291;
        Fri, 30 Oct 2026 10:48:40 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8e5f4sm4492926f8f.40.2026.10.30.10.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:48:39 -0700 (PDT)
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
Subject: [PATCH v5 1/4] ASoC: rt5668: cancel delayed works on component removal
Date: Fri, 30 Oct 2026 17:48:34 +0000
Message-ID: <20261030174837.1839402-2-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030174837.1839402-1-tristan@talencesecurity.com>
References: <20261030174837.1839402-1-tristan@talencesecurity.com>
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

Fixes: d59fb2856223 ("ASoC: rt5668: add rt5668B codec driver")
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

