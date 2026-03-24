Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732FE17DFE7
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 03:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321447; cv=none; b=n+1XJwNWkiL59BteaIFraxVtt/VXHRisXJeDXA9gD/KpWi+iqfq1UKvJA5pW2z5oaBbEUNkv5y0O91qEuygoSWtWuEaLDGtJDiiZIp88dOhtp4Rsje+SKakEguF8BoCGiDGaypvp2lvdH5vNPUnEn/L45orJSBNZQPL+Jp0RAns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321447; c=relaxed/simple;
	bh=NJC4vei1KnmKSsXwD9Na60tAl6E58y34rhjj8iBOhzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t5j/SifK8C6FEv6pIxJA7ApVtxi9q4UpX/YyUxDLoVFiFc4tMoMmmvQYRbnOe2RzjkdtP3XorxuTi/5JfToZsn3po0TzrjwbdqZ7CzSeyRVaiCnPuWkwGH4J95ZuBAogg8VYIxkSYxvVX+63snrB6qLKTUt/QtFHi+OFw5sXO3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lR1XdB5I; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lR1XdB5I"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c0d36f3888so3428287eec.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 20:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774321445; x=1774926245; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c9XoxP59asYTSkPcK+ieuamuktqbArkorHR8pqJA8Go=;
        b=lR1XdB5INH94rGDLR7mroTMrkVdAcfUSb4hdxw3nBOcUzhxBpDwZSoWSEv0agwEEGf
         DHi0kaR+OdlVr/XwDHd5vZYMAw5gEoXRcyfv6OJLyd/7trulv8CGyw454dyl2LNE+HMC
         o2tMjzMyqWZ4+5RDRgduqnG8JsTaKQAgUJFuShArzP+AWK7gtHRIueYXw2kO3ZVLI0ZO
         F+2cpiBJ2bRzDuIio/7o1LZCq/s+4ltKTPCQSeZvwL6EbF667S1PStYWtrcX2KNnLpZx
         3G7htSxPxVD6bJh7y2cKpj1/wiAKQ/waaH/+kdw1rGuZCjYjCwQb9wUR8M0Phl9q8Vdm
         bwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774321445; x=1774926245;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9XoxP59asYTSkPcK+ieuamuktqbArkorHR8pqJA8Go=;
        b=R9xr0+5dFG7j7Mp5sEhou+4szwXFvFIulsRmHLqmZs4MlKKqK8Hk1ME0uVHc2MRXuo
         IhwoZNS4nV0lWQEZrEXq0+4qZBWMNLrpkcyy9AVQUsZ4AkVNz9CPpf5secP3vyYn5RtB
         WIUdr6RjikVuICLSpePgU+MVJxN9gmnjL+KFDmJbl4P5Ms+EmX+2EXOrrwn+5wa6tG2t
         I4iWLAHFHDnCAKBMrbd/x9PabKuMUGEmgkIS92tkzOGbEQV0Vn5CumLT/MiBxGCeTjMV
         uVvub3LBgjI8290cWPoWm4qHonfmQI/vxSneySNvtnd3p5Qy8n3nn8p+/gQNm53wHgSv
         smuA==
X-Gm-Message-State: AOJu0YxHQcCj7DYLvTCdlVL3gODjGl1+cTDSUf4RzixgZ9rjDf3oc9zC
	r22v5rCE4ubTEP+o0njlM3yD7vufvb5qQvd+QZm+ebsBM2r5LQ5RVN1Q
X-Gm-Gg: ATEYQzyMUQXQNcPTXQQgdxDslpLLiiFpmm1olGWOeu9lekN569KGlf5Xp8sAh2thb1p
	eun1hyghWLrZ5+bsr0Sh7r3fUcUevEdpLnPaCmwVmfRK9Pbt3ipiuTNyAWmGQoXbRuedwcb15XW
	jq69XvSjVRmrpu9o5Zc3hdEM9YOcRqVc/kJ9zvM46PkD9dRKJs29iyuwdbwqlvHJ1IfaNFW5wGo
	MI2Yo1BqP6/vnmz37TXdb3jzSPwZZEwuy32k/bF+ob7px2fF/bLS0hWRQauFvOu3yMxMvipuEMi
	C7QcymExM6Nx9LogMMs4a4ip9xTvXIgEM1/1BOF955LB7I85n/8tDgZDBvT0WaJrGlpOodx3+Qt
	GYiOr6IshM/XmIhRgoELoqbMNfmuqNTw5nXgQpG5s3QhWbOpgj6eZ/KSHudkOle+nfUEOEED5Xh
	E0sU/dstHhbAHit0Ny+sFrCYG225sdZgQw/XkZ7Hgp132/6QdKUM53ddMMnsth0APn49GoPRs+1
	xl4
X-Received: by 2002:a05:7300:3215:b0:2b7:1d38:3596 with SMTP id 5a478bee46e88-2c1095a4d5cmr6279864eec.4.1774321445216;
        Mon, 23 Mar 2026 20:04:05 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29c74bsm14293456eec.17.2026.03.23.20.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 20:04:04 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 24 Mar 2026 00:03:59 -0300
Subject: [PATCH] ASoC: SDCA: Write init table on function status IRQ
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260324-sdca-function-status-init-irq-v1-1-bba49417a4e0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBswI6OuEi3ExpqNlWMRSHdPW
 j74/AxCkUlgrDJEull4DwVNXYHbbFgJeSkGrbRRrW5RFmfRX8GlUqIkmy5BDpyQ44m+870hbRw
 1A5THEcnz8/+n+X0/q2POk28AAAA=
X-Change-ID: 20260323-sdca-function-status-init-irq-f5f76e26ce19
To: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5077;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=NJC4vei1KnmKSsXwD9Na60tAl6E58y34rhjj8iBOhzQ=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJkH/yuWxzIti/nzupNZWG/jw8Z32XlWHdIf5t96ISzI3
 Oow/Vp/RykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzk3R9Ghs1XXk9UKZjnyLV7
 yoQve6XVry6VbO/78GFVqKKA1TvVs28Y/oeLyW5qdEnK4/9+VfWzJRdjwYOn0S85NN6rpbKUrmz
 RZAAA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The function status IRQ handler currently acknowledges
SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION but does
not perform the function initialization writes. Since the
handler clears the function status register afterwards,
the request is lost.

Use sdca_regmap_write_init() when the initialization status
bit is reported and apply the writes through the device regmap
stored in the IRQ data, matching the existing class-function
boot and resume paths.

Fixes: b9ab3b618241 ("ASoC: SDCA: Add some initial IRQ handlers")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 include/sound/sdca_interrupts.h  |  5 ++++-
 sound/soc/sdca/sdca_class.c      |  1 +
 sound/soc/sdca/sdca_interrupts.c | 20 +++++++++++++++++---
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index 9bcb5d8fd592..a63ae9df26d6 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -30,6 +30,7 @@ struct sdca_function_data;
  * @function: Pointer to the Function that the interrupt is associated with.
  * @entity: Pointer to the Entity that the interrupt is associated with.
  * @control: Pointer to the Control that the interrupt is associated with.
+ * @init_lock: Pointer to the lock serializing function initialization.
  * @priv: Pointer to private data for use by the handler.
  * @irq: IRQ number allocated to this interrupt, also used internally to track
  * the IRQ being assigned.
@@ -44,6 +45,7 @@ struct sdca_interrupt {
 	struct sdca_function_data *function;
 	struct sdca_entity *entity;
 	struct sdca_control *control;
+	struct mutex *init_lock;
 
 	void *priv;
 
@@ -82,7 +84,8 @@ int sdca_irq_populate(struct sdca_function_data *function,
 		      struct snd_soc_component *component,
 		      struct sdca_interrupt_info *info);
 struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
-					      struct regmap *regmap, int irq);
+					      struct regmap *regmap,
+					      struct mutex *init_lock, int irq);
 
 void sdca_irq_enable_early(struct sdca_function_data *function,
 			   struct sdca_interrupt_info *info);
diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 7af4e5d1b347..426c11c47557 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -149,6 +149,7 @@ static void class_boot_work(struct work_struct *work)
 		goto err;
 
 	drv->irq_info = sdca_irq_allocate(drv->dev, drv->dev_regmap,
+					  &drv->init_lock,
 					  drv->sdw->irq);
 	if (IS_ERR(drv->irq_info))
 		goto err;
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 95b1ab4ba1b0..caf5f6ace168 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -22,6 +22,7 @@
 #include <sound/sdca_function.h>
 #include <sound/sdca_hid.h>
 #include <sound/sdca_interrupts.h>
+#include <sound/sdca_regmap.h>
 #include <sound/sdca_jack.h>
 #include <sound/sdca_ump.h>
 #include <sound/soc-component.h>
@@ -121,7 +122,16 @@ static irqreturn_t function_status_handler(int irq, void *data)
 
 		switch (mask) {
 		case SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION:
-			//FIXME: Add init writes
+			dev_dbg(dev, "write initialization\n");
+
+			guard(mutex)(interrupt->init_lock);
+
+			ret = sdca_regmap_write_init(dev, interrupt->device_regmap,
+						     interrupt->function);
+			if (ret) {
+				dev_err(dev, "failed to write initialization: %d\n", ret);
+				goto error;
+			}
 			break;
 		case SDCA_CTL_ENTITY_0_FUNCTION_FAULT:
 			dev_err(dev, "function fault\n");
@@ -520,6 +530,7 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA");
  * sdca_irq_allocate - allocate an SDCA interrupt structure for a device
  * @sdev: Device pointer against which things should be allocated.
  * @regmap: regmap to be used for accessing the SDCA IRQ registers.
+ * @init_lock: Lock to serialize function initialization.
  * @irq: The interrupt number.
  *
  * Typically this would be called from the top level driver for the whole
@@ -530,7 +541,8 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_populate, "SND_SOC_SDCA");
  * error code.
  */
 struct sdca_interrupt_info *sdca_irq_allocate(struct device *sdev,
-					      struct regmap *regmap, int irq)
+					      struct regmap *regmap,
+					      struct mutex *init_lock, int irq)
 {
 	struct sdca_interrupt_info *info;
 	int ret, i;
@@ -541,8 +553,10 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *sdev,
 
 	info->irq_chip = sdca_irq_chip;
 
-	for (i = 0; i < ARRAY_SIZE(info->irqs); i++)
+	for (i = 0; i < ARRAY_SIZE(info->irqs); i++) {
 		info->irqs[i].device_regmap = regmap;
+		info->irqs[i].init_lock = init_lock;
+	}
 
 	ret = devm_mutex_init(sdev, &info->irq_lock);
 	if (ret)

---
base-commit: 834f16f74d88054df215eebef09ad864c7e5977c
change-id: 20260323-sdca-function-status-init-irq-f5f76e26ce19

Best regards,
-- 
Cássio Gabriel <cassiogabrielcontato@gmail.com>

