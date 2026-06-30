Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4890C3ED3C9
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801511; cv=none; b=DRmmuEfPlX+U+p6t7I0nRysfF1f+A7zNfqxGEKlWZeLFznMyKOUgqC27qvyFeifFFeEbfvnRQdDuh80Tj25TAeXnyK1ewHwrjTr++CZnsh7sYj9eEaeAQ/aaxcbQxi3IPzQkwofG0xg2WV6EjtOc4nTAQFflhJ3bYGYEkAuG5Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801511; c=relaxed/simple;
	bh=pw0S/aozuZfLqNq1mfx8Qgloh+QRimRV50r7uAkzncI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPJKTgMHWxUF8vGrDoeV/etkpyZ+fIC7Q0MpXwAzZMh9UgM9TqVyuUqBycWeyfCr8ovQVgjTSWDdZeapfo0ttkq9VyM6V89VyUgI+sOsLDS3+RYjKlIK6gG1ZY72bP642IqDsXYIWVvA+qpc3hma+XT7UmBYLfmAj4ppY7ewxYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOu5o+pM; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOu5o+pM"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso3418254b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801504; x=1783406304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=;
        b=WOu5o+pMTkGmraBQD57Oa3LU2AvzkF2SBpX3I9zVAWt7RZE4I8aV1Bcguec6PLdY81
         GVeEYZR2Bg3KyoXJhabW0RtNifLzLKUQDp72QE/ArYwqt/4vYfwgA6a5BD0Y7nbZvqxa
         9xR07NW2pTZLXLq8gl/Eat69Mu+A9zFLZjXS8LYTxV3bQHP3J/QkgN82e8BK62yKhfSs
         QoxZgtC+R1R9gfydYkYSX3Q9VOML+UfeYo7ZOiuZJSAWks5Lxp6q/QJblJvPSuW0D7Td
         obi0jH5pizpGcs+/gns7nauBpmXWjuJw2c433CmHPYipUWrmpCKru3gmc32zAdqdDxf8
         4Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801504; x=1783406304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=;
        b=ToGUZNh7dMG+OYi3Jc3cJPL5U+DXJCQVmJTpjA2hb62T/KiFwbj9yfKcIpubfvKTpw
         0vreqNu0C90EXS/urVVYKxCP/xRfMOO0Rg6DruQWTy3wE2GnwboiqwYu5nFG8kuqzQ35
         90umoz8oOoJ3ZkdwRA+jEQjAbbWnvJrfQn6aazpcYQTtWRGAMIB0c+vYda3DdLKh10ig
         k8X60sfWLZ60Qw3rwGsRYE3k9SlKLwoAz7wvMeu1nEPTGkz/w6vBPwQxcfze1E2IRUVc
         7ES/QW6bZQx3tbTQmbcqEmk5VjS191VpQVdxl07KZFO5QB6ycHUPNHnAXDoh056G8/TS
         cFJg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+yd/hvtRUZMRyl7xakInFUz5OXnhiKN7h0Fi7WKIwnD7ZutN4mtkY7Sw2PW6jAn8ujxBEmgU5pTSaig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJmuFSdxZv1j/liQqVfiV+v/wsZshfn0+KSU95ltcet9tw+kFn
	4XTRrK82gl3tWZIJElYVF03FNpqlcR4wyrF97Hd5OgCS3fRF9zMwITBp
X-Gm-Gg: AfdE7ckskhsR0N71fz0Gs2DBXG7FvOlhIxKInEirzDeGF/lFv0XgesqpwkokriIERLe
	vrNDi+I+sRsWulur74e9qKMJ8yBFMHQoIP9iRoeZcu07jyJi5CSifbRCyM/Hyc4xYXucKN9trTB
	ZyOqp+QQD0+SR4XEDf0LjID+ZtiSdy27U9+kgbXmrIlaCszdQcik6L8bk2RvnZl3BEn+udR84dk
	1UfHg7sQebYk+eEXKd53OgtvrAzxf8lL4dvdA2NW3Twuho3y5uD2eNNGsNIJoRmpXqJ1bG4ODKn
	PUvnoQCo1Xs+/XFbBDL+TMoFjlYigHoB/j7PWN6WuMKrT8aERC74bunIoyFIdcZ0GVNn7tOZEgE
	Q3AJiDsiKUAwAo7qpgELDh8rwmaFgyslURU+WSEIOO5OybJ/4105q/7aS/7XJMUXZiRNkxxPDW5
	gbr5r88WmZtz9QwBSp6s30p4B9f5CRqXNFt/MFZEBbgvtJHwg=
X-Received: by 2002:a05:6a00:1ca1:b0:847:7f6a:c56d with SMTP id d2e1a72fcca58-8479f233abfmr1895233b3a.30.1782801503940;
        Mon, 29 Jun 2026 23:38:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:38:23 -0700 (PDT)
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
Subject: [PATCH 23/27] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:45 +0700
Message-ID: <20260630063449.503996-24-phucduc.bui@gmail.com>
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

