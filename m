Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32614BC007
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520532; cv=none; b=fNa3fwjO/6/gayoTGDvCe4pGPmJcaa7CcMUgabH01a7gybzJKUvoCG4VSbPoUSlG1AJLysmSuiG5XdyCeFfkwu07+5hGdqWKAfKOVQDL6O8lksPBF9Vd23gSnPVyuOvScmpYxMjgtYl7uyM++Gw5l3COFCMR18oSyUNwGM5up2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520532; c=relaxed/simple;
	bh=pw0S/aozuZfLqNq1mfx8Qgloh+QRimRV50r7uAkzncI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O1DKPrxWPG2dRl8cXQR/1K+bBIcspYx9uq7vyjrkDnEML+EflyjO+z3WHRdSAduZRoLL22nAsutasF8nW3PAvSP46BjeCV5n4NSZ6Qj1/NbrlZtrdwAeVZg0ZjHcoxVfU7cNKh7WiyWzaDLWR4jL9DEtgjUQLHh06pshlVglDyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcXesz3e; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcXesz3e"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so8367905ad.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520530; x=1784125330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=;
        b=hcXesz3eH9Uc/hGejA0vLsZeaPG0jQWkkyFlKzcB1H+wLWJ/wrTzDAllF8yRQjXsJp
         nU24oYG9LuDP7XBjnPg0Zl2+VsXJpnX0/iZtDYX+N1oa9A3+70J0LwvjMI30r4w3NsgP
         gZ7/xu/xGK3DQK+22oiBpkQO9Elh+Bv/I6Bza70gHPycN4YK3kX62mClOlmaaMZ4FHbM
         P+38Z0B5/VB/tzas6GFIoS+gAGQWYchz1XFnb7W0QitoDrFIhYaBFKzmYeEbdGH+fKNA
         Wop7W5gpl5Rk3LO5Xx1Y7LQoiP2vs7/0pmvk4J2LBu3d6HeuVhQp+iqy/tWeuzjicTrw
         ewBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520530; x=1784125330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=;
        b=DTMqa78C5EZG1dk/zqseRE8P3qJICBSZrnEx6EFwmPISpN3Hh7JkGOT3fp+8fJfiXl
         jPLQ4JcgzUhEXVPzksisF5ci8VqHc10mOVC8dkxS++tktdEcRnTdBGN8rUW+ZuXpRJe3
         gYciSqIIFLQGXRdNLTh0519GcKjcYu+pj1tAgtyyrOl/sPhEBRb+KXzmFGrZkwQqoJ0f
         NKOlY3dZuTuxutv+1VgYRXoFqm4QBVJcOVELJBS+gmZthat1tbgcfmr22U9r4pyHB5Se
         McPVWortbX3ZfdnyuQFA/E7QCtlH7XM3U1E2tymF2PFHT5XuEEslPV+8FzH8pA/zKWIp
         Gv7A==
X-Forwarded-Encrypted: i=1; AHgh+Ro3pblWfd6yDwOHrAjrh0QGYQYJwVJoJxaadYTMK24vD1GIa0Q4T+o1vtuhThizAT7FjlOxi56o0j/Pbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvtN+Sqfgo1Ey9/oV8vOeL9ld8O2XFh2V/7sl0Q33gGYhcL4rn
	TtT0ZWl22dmAUG/SzTLWEAsKd8K1Q4i5gSjmX5e7mvsX3wR2Q+8xbJlK
X-Gm-Gg: AfdE7clXhEaK53kfKsB37BFvA4H7Tms1S3xyIrwylBu7RUOhQF17kd1NbIuXq/ImPno
	qYk2ZCXuppN7nQzuzzom8DAi4NnQXWmZR22DD0kukw7/kg9KkKURX+0dXcAk/JDVhohJ36DqZnp
	bFO0xSGwMy93yPjxT/zZotoRoKpSNK1xRa2sqruVpJoEObPZZX9QMAiJriKlVPvhEZE+vu3DwS9
	A4jBYGVgGwpsHAFiLY7OWqJrlUaPD5TsnguxESv0n/6XFJWty8AeUo5LOCIUOcxZPIiaAivK+cg
	+4KCEoQy1h7DdtL3YStE9F9mTr33JyA+vWrmaIJL2zFUDXLF04rZCTdSx5YKV3PDBLl11jIOjt5
	8NxWt+PH0gUcQe7FjJOarfs22ThnfZWRKmRSyQqUAIVBgEWSTb9t5gfxUEVZfqFetB25GLnFPSK
	fjOxqa86okjvjx4tJXPEBF4rUd3TZAbFsPIo/bYuOoCT+UV+g=
X-Received: by 2002:a17:902:d58d:b0:2c9:97a7:71b1 with SMTP id d9443c01a7336-2ccea5828acmr29807815ad.44.1783520530129;
        Wed, 08 Jul 2026 07:22:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:22:09 -0700 (PDT)
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
Subject: [PATCH v2 23/27] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:30 +0700
Message-ID: <20260708141734.578926-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt700-sdw.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 6bc636c86f42..053ccb92c726 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
@@ -416,12 +417,11 @@ static int rt700_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt700->disable_irq_lock);
+	guard(mutex)(&rt700->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt700->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt700->jack_detect_work, msecs_to_jiffies(250));
 	}
-	mutex_unlock(&rt700->disable_irq_lock);
 
 	return 0;
 }
@@ -502,11 +502,11 @@ static int rt700_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt700->disable_irq_lock);
-	rt700->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt700->disable_irq_lock);
+	scoped_guard(mutex, &rt700->disable_irq_lock) {
+		rt700->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
-- 
2.43.0

