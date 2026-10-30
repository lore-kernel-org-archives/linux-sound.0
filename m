Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374929;
	b=atB4lc03WpOKrKyeN59rhQ4z67vRe54Xyj2+GKfwQm2Ft5O6FJ9SZCVEEFD93+HU2s0p
	 c9mAJoKS0pEppbzG0khIcDxkgvwJErzv19fPNDQpvhY0ha9ry3+HHCbvgp1g4DhLnAijS
	 H2O4sigmekL8BpgEO0rXEh4kdZoVxJtmgWYwvFMoo2kR/I1nkZ39rJWKPRDTtXrwYWV/L
	 BTRvVaS5uHbneHHvU5koAbrkac0rZoNXupWGHrmd+Awzsln/PZ5pA5Z9MW61GdsEYQQ6L
	 g0EnT0c11KO+kyYrcz5zxVsvIo/XB98Ze/gRRfLQboZIMHdDKoyyWrRkxLbEfpJnzOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=71/PhvdcY4MYCOZ7yipaT8Gh3d0QBNm/V3YoucupFGg=;
	b=VCTDv88qkSnrbPGQfLsOgpY4w/NzbL9BWZaTl4exCVLfpZSH5mRTSENiKuRemzcn4mtv
	 JFsYmOxc+cY/xSN2Mb8SeK1nCyIfTM1HDJ8MSYJlsCLJF3XCNt1fEh6m2frz3XGzNuPBs
	 a7jXxwX2qUpPj6Q1qOMl+wfIXqNlv6/eJ78fxkmVk6RKFsGHNtQoIOntNqfzrNNlHH9Jp
	 gSGkl0WePTBCrtBkUciW5a7pej7FeBJfa9dBozDR/ljp08fS+y7+alQVwpZyMPd4qbgQJ
	 v4qiOLycZY7vB+HNV0EZ4vIQ1e1LIyG12OKlNPTTJl37oRsDPW+FJP+bkbvB5oZ/PQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nOxhZfYm;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C30B606A31E
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 15:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C30B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nOxhZfYm
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e10a70540so554601f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 08:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793374927; x=1793979727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71/PhvdcY4MYCOZ7yipaT8Gh3d0QBNm/V3YoucupFGg=;
        b=nOxhZfYmYfLK7lY03jY8+VzT7+a+mWQI/c4bBH+huJ9hU28sG/lMQ/D+KInfS1eumE
         rMiqtzYyngcNNxsBP2rz5Oi7CGUrLbxN9MfqASpLJ3sMqXSYPVqw5vkQvpDHbDdGSVlv
         E7tOlk5PEaR7BUgm9xSrljvtf2Varg/lwiVHnfUa80yxt3DNfhu0k9MY4SMM14JHt8t2
         sxmCi3J/F4MOU4Zq/aBj2njG7iSRLq478Q7Y52roB95kRYVSLeOKfbz6pweIAmk5aviB
         rljFAvbPFaHV8Yu4dh04Pvkt4YrYvnD2rSs3pj8BFHOVFTxzsdekcMOI2F/2O3UAlJPF
         HOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374927; x=1793979727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=71/PhvdcY4MYCOZ7yipaT8Gh3d0QBNm/V3YoucupFGg=;
        b=o571O3UUmWJgSjwcfCpPdOTrN5VkXHBEeICHx8sSBzI14KIoaG+RVP5pye7zD9sQu+
         1XP0NYwE4qe6AyE4i5jPcXKnIcXnqzb44qAKptwL7PQNBDcNTAbYZM5Kq1uO0OKr+byI
         o/bvIs1U4suSn6mZB33CB4LibyE77yd7YYdOHz7p/5hzOY8cB/e43IRrqWdio8ykkhjE
         XENM1BpxshCcv7Gz9ALDIvTsqp5b96+HwzM7xcZXLxy8YCL6ozFTDI9LODRqBuDUPt/y
         W25gOjZDoWQJurl4syxrGxA7GLWcoMW+rrEr465A7deSui6TAvMLx1U3K3XlT4RU2MHn
         5Diw==
X-Forwarded-Encrypted: i=1; AKwUvBxFaW5hRDg6YzCLWViiYimWmGakJQOK0cvLMP+xnS6nfXPC00wSiDxRWimia+OyqykN0J3c5OGTtY/b+A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKAO3Z7DuarDoJysRNOvc+sNBQNE9dpUuIvN26ukb+xjkSZB403
	er5KSxDBDoI2YXLyyD9vnFygVr82rUJ7RBtldTkish43WlUNsZGmjvI=
X-Gm-Gg: AYBFou0te48v7R4DgC6NLEpS9gad4d4txcLSNI5VS6jN2lPdReKdUIOrCwwoMud7x00
	EoMYp+9YvVqAxeDl1OxHkmopyB8xUOAwdQygzsmgbNoZWo0uuNoKWZr1GlvXPGmgyBWnqGX0rgZ
	G2HDjD4JEUf0rMemsaafN6t4Kp3CgR/VFNCCH3v9ByyhmCMkFNa2xu3gKBsBySODBDk3uLOjM8S
	s/9q7PZlRAXUU2+z57SMeypAN/AyHP73Ybwd06l+yXfJo79ptPC/M6xzhRsot0l7bO6K+jJosSh
	+v3itzoyfPXLgcR9SxZtkj3+ke+3pECxomLKSE1pmdmP/OyNtneZcXVmSdv4dhVJwMf0DcGzi/8
	BnOwEDeps/5f+eAzB7T1QEdFQ29DgTn52KX3MDrldcqKP5okAHVr0HibQQy0h/8pSvPAKHQcsSu
	Lf3F4udW0WgqyHFgQn4RRjLuGDV8ySmG/fsIsJ6iF57uM+RZ42RY6VFNA6xWixi8mOc+JUQga9y
	RMlWn8zXsh9+Y1pHBR0XjSXeBe/HhZS72G/NS+yifZDk2kxgKJXl3pKyPzt3t8B0MQYDCwHYDXe
	9k5ZLJE1L/k=
X-Received: by 2002:a05:600c:3547:b0:4a5:cfc:1e95 with SMTP id 5b1f17b1804b1-4ac182dbb5emr58789785e9.33.1793374926469;
        Fri, 30 Oct 2026 08:42:06 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f047bfsm144419935e9.3.2026.10.30.08.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:42:05 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <bardliao@realtek.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v3 2/4] ASoC: rt5659: cancel jack_detect_work on component removal
Date: Fri, 30 Oct 2026 15:42:00 +0000
Message-ID: <20261030154202.2989936-3-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030154202.2989936-1-tristan@talencesecurity.com>
References: <20261030154202.2989936-1-tristan@talencesecurity.com>
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

rt5659_remove() resets the codec via regmap_write() but does not cancel
the pending jack_detect_work. Since the IRQ is registered with
devm_request_threaded_irq(), it remains active until after the component
remove callback returns.  The IRQ handler (rt5659_irq) schedules
jack_detect_work, so a late interrupt can queue work that runs against a
reset codec.

Track successful IRQ acquisition with a flag so that disable_irq()
only quiesces a line this driver actually owns.  Guard the
cancel_delayed_work_sync() call with a flag that tracks whether the
work was initialized, since INIT_DELAYED_WORK is only called for
specific jd_src configurations (JD3, JD_HDA_HEADER) and cancelling
an uninitialized work is undefined behavior.

On component remove, disable the IRQ to synchronize with any running
handler and prevent new enqueues, then drain the residual
jack_detect_work synchronously before resetting the hardware.  On the
next component probe (card rebind), re-enable the IRQ to restore jack
detection.

Fixes: d3cb2de2479b ("ASoC: rt5659: add rt5659 codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---

Changes in v3:
  - No code change from v2

Changes in v2:
  - Resend as part of unified series
  - Guard cancel with jack_detect_work_inited flag per Mark Brown
  - Track IRQ acquisition for disable_irq/enable_irq
 sound/soc/codecs/rt5659.c | 20 +++++++++++++++++++-
 sound/soc/codecs/rt5659.h |  3 +++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 3097ee6d4e89f..cdf499fb36d67 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -3667,6 +3667,11 @@ static int rt5659_probe(struct snd_soc_component *component)
 
 	rt5659->component = component;
 
+	if (rt5659->irq_disabled) {
+		enable_irq(to_i2c_client(component->dev)->irq);
+		rt5659->irq_disabled = false;
+	}
+
 	switch (rt5659->pdata.jd_src) {
 	case RT5659_JD_HDA_HEADER:
 		break;
@@ -3684,6 +3689,15 @@ static int rt5659_probe(struct snd_soc_component *component)
 static void rt5659_remove(struct snd_soc_component *component)
 {
 	struct rt5659_priv *rt5659 = snd_soc_component_get_drvdata(component);
+	struct i2c_client *i2c = to_i2c_client(component->dev);
+
+	if (rt5659->irq_acquired) {
+		disable_irq(i2c->irq);
+		rt5659->irq_disabled = true;
+	}
+
+	if (rt5659->jack_detect_work_inited)
+		cancel_delayed_work_sync(&rt5659->jack_detect_work);
 
 	regmap_write(rt5659->regmap, RT5659_RESET, 0);
 }
@@ -4271,6 +4285,7 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 		regmap_write(rt5659->regmap, RT5659_IRQ_CTRL_2, 0x0040);
 		INIT_DELAYED_WORK(&rt5659->jack_detect_work,
 			rt5659_jack_detect_work);
+		rt5659->jack_detect_work_inited = true;
 		break;
 	case RT5659_JD_HDA_HEADER:
 		regmap_write(rt5659->regmap, RT5659_GPIO_CTRL_3, 0x8000);
@@ -4280,6 +4295,7 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 		regmap_write(rt5659->regmap, RT5659_IRQ_CTRL_1,  0x0040);
 		INIT_DELAYED_WORK(&rt5659->jack_detect_work,
 			rt5659_jack_detect_intel_hd_header);
+		rt5659->jack_detect_work_inited = true;
 		rt5659_intel_hd_header_probe_setup(rt5659);
 		break;
 	default:
@@ -4290,7 +4306,9 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 		ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
 			rt5659_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
 			| IRQF_ONESHOT, "rt5659", rt5659);
-		if (ret)
+		if (!ret)
+			rt5659->irq_acquired = true;
+		else
 			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
 
 		/* Enable IRQ output for GPIO1 pin any way */
diff --git a/sound/soc/codecs/rt5659.h b/sound/soc/codecs/rt5659.h
index b49fd8baf4e7e..e10b3844501b9 100644
--- a/sound/soc/codecs/rt5659.h
+++ b/sound/soc/codecs/rt5659.h
@@ -1813,6 +1813,9 @@ struct rt5659_priv {
 	int jack_type;
 	bool hda_hp_plugged;
 	bool hda_mic_plugged;
+	bool irq_acquired;
+	bool irq_disabled;
+	bool jack_detect_work_inited;
 };
 
 int rt5659_set_jack_detect(struct snd_soc_component *component,
-- 
2.47.3

