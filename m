Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE4434A3D9
	for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 17:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787506670; cv=none; b=M2vRD39cFc5diElrd2FtlSh+vX+4DHz3vXXjGWVQYYEFJKZYxovF10l1s9mW/cBSYWYLvJmOeN5JX56H8EdIzXHTWBn3OKjgMR8IXoeeG2XzJVrZppfb1sj35JP5Ed/FS0NTipUxlGevqlBpLJQ6vtoXwsyuq5bTFJEhg6hifwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787506670; c=relaxed/simple;
	bh=vDzC1lXQTX20zA2uT4KvproTMpd8ikDZ7Uz9qaUggPI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Lpfr+SXxjhK045JmX2fQSiGHtylP997W/DZGV7BQ4cqmsTLGjX8t8deyECYT1qlInAlPyHhyIqpViWbBBfdAH+EcOtdV4LbwlzhUYl3g5spzJoO53DvP3cBeM9XNZREOsTZKPFxu444DUiyUpU/xoDPsr3/dePEyVkEpTlawyWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQacU6NX; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQacU6NX"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1c52d920b8so383443166b.2
        for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 10:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787506667; x=1788111467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WzxtLwRD92+TCzzKKRXbUxryNiIrjmzaSY4Z8wvm3PE=;
        b=pQacU6NXgdwzVgaamRqgbVzWhlcLvjBztie4RtyJLUrQHp2L4NKw616g3JngzNBDd8
         25xUYQDJJylCNt7sGiw9GPtMC/GwThJq0CIft1otleNIrBCyZf0Ia69O2vHYymJk6jJ4
         Jvh/wiCbT/D2aIJDPjAI6YRsopbagDb2yK9XzGI6O7EUtKbqdJfK/IYTZSqSsmiahIpA
         Ibck/zQu4+RTs78ZOMJdB72aSEJ/3CVk7BqYx/Q8kPCNvryXfdNUl84XpeJKQ1qq3XEg
         drO100RRuPdI9swX012HwWiz9FqP0zCYc8orybXc7Sowl/B+3p/z25NS6v24ku5xakzX
         jKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787506667; x=1788111467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzxtLwRD92+TCzzKKRXbUxryNiIrjmzaSY4Z8wvm3PE=;
        b=IWKMdc+6zwjPwGS5Am+Pi0xzgQGXfnnvwn/XjrmX89LD90KN//JBafhBOqIyKRoSnK
         gO3X6vO4eMcx6himynsU1CgbF9iiHGfLd3xsxuySRcnn+r2iIaE01yTw5zVK7xOZ9L1I
         rn+sc/dPQwWwyMaaC+nIM37IQgJTCWqHjAf3cXUIEv1AxcvltGek0KJUUFs1DbGMTXFr
         2JiIwajUx6LP579E+sR7+Xl5qRuGx1xgT4alQzHhkAsjjb7ozmM3RYkBeb5JNhD6Tqj9
         cOvXtD9486fTY+mSMvlvSZ7LlngwsHG8WipcE9YBSy5xoEAk5D4b7pmXHXlOlhxBM2Gj
         jmLw==
X-Forwarded-Encrypted: i=1; AHgh+Rrr7I/TxEt+PBfsnrsPmuHAKwpWWHUPSKpClo1oJUSpAkmmsWijpM5aL9EUJApLoTpcdtojXJyZMhUHzw==@vger.kernel.org
X-Gm-Message-State: AFuF++lqWSp+O7nGcrJ69xLve+xPydLVNSraptC1Njnw+mO3YcJycRbR
	e7V1nrWaVx4jH5LsF3yyU8tyAGqACfObz9/EmjehXy7d/EtUxvo1Rqg0
X-Gm-Gg: AR+sD13dthF7s1Mp3T5Z3vSdg+benMM9uhGeJ08H34LX/xhBIhFEdL9+k1y1Ji3chhV
	I/GgUayrkwDqW5lU5SjFnVxTzLAkmwZgD5voV9iNJDSZ4yuC1P51Pz5BfNclbJaxVWx2+k2vg/R
	U0udfuSa4mCBy5NymrUK5MS4perCKkB1Y/wEf8QgDb6W9Ty6LkAz65X+Sb5y/+M71mGHARF3odT
	IjESREO6arvundvrkb3HIZZfd7GzdC75KzlRlG7PWsens8TrR80vtZIsVhDewqAc2F8q5Von7JW
	W36sYDWQXS23eVN0E4EU0zmI4rCsZLe3XMJhmyz03sdEl2M4beUfiBkjFFDthzXSpSP2IC1It9l
	ZDE2LpbvdM1HIt0okhRite80fuJQSoPdmiSRgWOPM5moP0+ZRnIgBO0WGXKbjXtQI9dPhaKamcW
	ekCQCY9Q9pVKQsc9L9S39TxdHRfTEr1s9lq18avaVghY1sFPSDsAPkdCQoC0NxBeW2Xy8HRpmNx
	U3xCqNqmdWwcyg4yIJECmHKEbCH1lrs9Rhtua6QhDnCyPGEdWz7TxsaC/rBlZv4eum8WDmmxrhx
	a8qXy4yUNo5M0x3hnGckX2RSawlot+2otvgeSJwP54G1aHyI+YJ2T1DLqkrh/nJhtDuyhituFg=
	=
X-Received: by 2002:a17:907:7b83:b0:c20:fe93:a86 with SMTP id a640c23a62f3a-c246a62b495mr2653594366b.18.1787506666570;
        Sun, 23 Aug 2026 10:37:46 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b027-cd01-554a-ffde-5279-f351.310.pool.telefonica.de. [2a02:3100:b027:cd01:554a:ffde:5279:f351])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249689fa1dsm791239266b.56.2026.08.23.10.37.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 23 Aug 2026 10:37:46 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] drm/vc4: hdmi: Unregister the ASoC card on unbind
Date: Sun, 23 Aug 2026 19:37:40 +0200
Message-Id: <20260823173740.2983-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vc4_hdmi, including the embedded ASoC card, is DRM-managed and freed
with the DRM device when the aggregate device is torn down. The card is
registered with devm_snd_soc_register_card() on the HDMI platform device
from the component bind callback, so its devres node starts out in the
component's devres group and used to be released at component unbind,
while vc4_hdmi is still alive.

Whenever an ASoC component is registered, the core retries every card
waiting for components. For a devm-managed card, each retry destroys and
re-adds its devres node. Because snd_soc_bind_card() requeues the card and
converts -EPROBE_DEFER to success, even a retry that still defers can move
the node outside the now-closed component devres group. It is then only
released at platform driver detach, after vc4_hdmi has been freed:

  # modprobe vc4; rmmod vc4
  BUG: KASAN: slab-use-after-free in snd_soc_unregister_card
  Read of size 1 at addr ffff0000456a8450 by task rmmod/262
   devm_card_bind_release / devres_release_all / driver_detach
  Allocated by task 171: drmm_kmalloc / vc4_hdmi_bind
  Freed by task 262 (rmmod): drm_dev_put / component_del

Register the card without devm and unregister it from a component unbind
callback, where the HDMI device resources and the DRM-managed structure
are both still alive, regardless of where the card got bound.

Fixes: 42d99857d6f0 ("ASoC: core: Move all users to deferrable card binding")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2:
- Preserve the existing ASoC component-lifetime comment and document at
  the card registration site how deferrable binding can move the card's
  devres node outside the component devres group.
- Point Fixes at the deferrable card binding change.
- Add the ASoC maintainers and linux-sound recipients, add the stable
  trailer, and update Assisted-by to the current format.

Tested on a Raspberry Pi 400 (BCM2711), v7.2-11658-g26260251022f, with
KASAN: report gone, rmmod/insmod loop clean.

 drivers/gpu/drm/vc4/vc4_hdmi.c | 24 +++++++++++++++++++++---
 drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 17c8635c5afa..7e312932488a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2422,12 +2422,18 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	 * snd_soc_card_get_drvdata() if needed.
 	 */
 	snd_soc_card_set_drvdata(card, vc4_hdmi);
-	ret = devm_snd_soc_register_card(dev, card);
+
+	/*
+	 * Deferred card binding can move a devm registration outside the
+	 * component devres group, so unregister the card explicitly at unbind.
+	 */
+	ret = snd_soc_register_card(card);
 	if (ret)
-		dev_err_probe(dev, ret, "Could not register sound card\n");
+		return dev_err_probe(dev, ret, "Could not register sound card\n");
 
-	return ret;
+	vc4_hdmi->audio.card_registered = true;
 
+	return 0;
 }
 
 static irqreturn_t vc4_hdmi_hpd_irq_thread(int irq, void *priv)
@@ -3345,8 +3351,20 @@ err_put_runtime_pm:
 	return ret;
 }
 
+static void vc4_hdmi_unbind(struct device *dev, struct device *master,
+			    void *data)
+{
+	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+
+	if (vc4_hdmi->audio.card_registered) {
+		snd_soc_unregister_card(&vc4_hdmi->audio.card);
+		vc4_hdmi->audio.card_registered = false;
+	}
+}
+
 static const struct component_ops vc4_hdmi_ops = {
 	.bind   = vc4_hdmi_bind,
+	.unbind = vc4_hdmi_unbind,
 };
 
 static int vc4_hdmi_dev_probe(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 29d461d4ee49..444c73513d86 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -106,6 +106,7 @@ struct vc4_hdmi_audio {
 	struct snd_soc_dai_link_component platform;
 	struct snd_dmaengine_dai_dma_data dma_data;
 	bool streaming;
+	bool card_registered;
 };
 
 /* General HDMI hardware state. */
-- 
2.39.5 (Apple Git-154)
