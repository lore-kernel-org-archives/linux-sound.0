Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584153EE1FE
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801545; cv=none; b=dFg9kaWZ54BfQBUt+9fcJLypXlUom+faGPbtxI9tJapnTWPom1R6sopJYUkQcmVTE4DFtgOuRhnHK2p51yHF0Nl7zqEy+Wal1LMClptR4yTMItv2XOUiis1z9gYseqGyU3p2lWIf8nTTynBi6+01kxz4gNqb0fKF5DIA3Wz9O8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801545; c=relaxed/simple;
	bh=fBZDeHAFDZr0SJjeir1J7nLoUKn2MLHuB+Y6RtEoAU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZDNYbWw7NbR4sMxYrySb9Ja+8I2oD11AasqU3TYlBRmXSZjGmLaMiyAd+jA6kbikiDT02RMLOe3T/WKq62Yf9XhYavx8auuh6Kz1duBCTZwtx6TxmQERaBsKi56ykeRCTmCAIlkQf5YiE8jNgzIvIjsjelDKUPVpfZpWKr33VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZRVexRi; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZRVexRi"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84236f9b638so1782268b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801535; x=1783406335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sA++AxO5NtmYTBb+M8Kemba0fl9Obtf3m3Dlj5iG+Uo=;
        b=lZRVexRiGaePb9c8zuOc5yFRhLCPFrxAu76rcniJi7RWVaJYGV77zNeC0uICg+EHgo
         mhMh+ybqkxFewLQMFPvm6FEPs8fl4OVwMO9NudWQ6bYsAf5O2vK7MDO2B6T5bfTREU2l
         SJO0npPzv8HmSQuF0AJf6GVeGqTXew91yS74NvkHJY2iitnTS7MehXD4Z1RMicBNtjKn
         xr0CJJhmn1I8A7oH/BehprobkAvdzpRdS6gf4peJkxqZSJuLfCdDkTSvUrXkyxW1LCbW
         wJs9THZ4okteNTgh+hCaP7yAlUx+hOXkxkOBMTJ9xWSAgSGsKkuPd9GEcW+3Qy2NtBXK
         8jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801535; x=1783406335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sA++AxO5NtmYTBb+M8Kemba0fl9Obtf3m3Dlj5iG+Uo=;
        b=Ej7gDn5vpaYexWMi1tJoHwRaV/0WhmrY9cyVynI6/0bv8cvp1x33CZgAeUWOQfiCeL
         HkqmNa2SbyldklG0wWfxTOGHpVRlGozzsoraUZZ9WQkuqxZKVNE5LqcPAfav6XioLLo7
         0SwiaSFJ7v1JZdA8EIZNPLbYlLIGdTYE1VqDuGsVocxuQyJtN58TzFg5fHbeECm1uk5e
         5Qlem7CRdNh2CxS/k43i69yz9fdDJkAYy3le/5WSV5ao+CLc6yb3RB60x5yxdbL6kGmn
         LvldzOyLpCcsXNX/wELsyPXxeDVLN2mRB9zGuwkht6frCrUuAhg9u+i3TI8eeALWXQq6
         t5mg==
X-Forwarded-Encrypted: i=1; AHgh+RrI6kxpXGlt9wpQxJibPCPBTQV6apxTaWygFPyARudsrRY9LiWZVpaN//LefcJ4+rKAdhpA9zqlHncyGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB/IVk4KRikjuOYdlI6ZuBnnviSUQGrBJx8r3vpn8+9x/smU1a
	p9E+Jpg+z37ibz0sw1ETvHGkzzEVRiovX3sp1WJckBri2w6kTBQtZFYL
X-Gm-Gg: AfdE7clQ+L8Pk13vzJ+U+F5T/D1/ylByZWWlOn7EaHE0v+Nh2kyiHzPUQaDga+zjs1Z
	udBioUNYEXDUkTspsho9Nd6UBk6IPFIaT6yX0UV79YtjiUF0SCmszoUtnATJe+vEovzeQHqKi5C
	IY6YYrYOhAQjYlaZsLx0F7jEyYbfhzxPsq7mFPDAQDSsqwmVxHwmmVUjPSvcfBfrM2V9bIK/WFl
	eNjwyKPFn6/Uio9geI2w1r2aLQV+8QRv4KTyr5PkD2YNXerjxwLMi7c4pLwzPDgWK7aoMfFzP1+
	3wlmX6u26ajZ2tiorLESTsqBHKBuDfcblsWarBVX7NEcMxZb33SnRtH0JN9dCmgVseLiLWsOgX/
	N9DyX6bxRjmxj0uSVyWSHUL9aMRLiQchvrCIx63OO0sUpx5nsQwbaunDliNPrq1aakQ6BZmZxfX
	uSyMdWwFrypuTfveWDliQtEpjBb+wcu2/kpLdM9jlhEXOT6u8=
X-Received: by 2002:a05:6a00:1797:b0:847:711f:49ab with SMTP id d2e1a72fcca58-8479f137897mr2189312b3a.22.1782801535253;
        Mon, 29 Jun 2026 23:38:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:38:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 27/27] ASoC: codecs: rt722: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:49 +0700
Message-ID: <20260630063449.503996-28-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt722-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt722-sdca.c     |  4 ++--
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 284900933ebf..895b8b2ed607 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -514,13 +515,13 @@ static int rt722_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt722_sdca->disable_irq_lock);
-	rt722_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt722_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt722_sdca->disable_irq_lock) {
+		rt722_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -542,13 +543,15 @@ static int rt722_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt722->disable_irq_lock);
-		if (rt722->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt722->disable_irq = false;
+		scoped_guard(mutex, &rt722->disable_irq_lock) {
+			if (rt722->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt722->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt722->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT722_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 1b6729f363fc..decf9407ab6d 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
@@ -294,7 +295,7 @@ static void rt722_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 {
-	mutex_lock(&rt722->calibrate_mutex);
+	guard(mutex)(&rt722->calibrate_mutex);
 	if (rt722->hs_jack) {
 		/* set SCP_SDCA_IntMask1[0]=1 */
 		sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK1,
@@ -317,7 +318,6 @@ static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_HDA_CTL,
 			RT722_GE_RELATED_CTL2, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt722->calibrate_mutex);
 }
 
 static int rt722_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

