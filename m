Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D274D2EDA
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520566; cv=none; b=DEsWZwrCzZp1NFOVis6pb1IKyhVjcSCq6EPmtxEHhGcqYDeeq+kZVJMkxcWj7Pivbagn9vz6oUmtKZz9T+5f/z3QUhtxHmgoR0bBA3EDoNzR9d5pGzdROostwPCJH2fFdcvdKtPj5klgZqDnWcrD38wFxgT73s84q6EKC7IP6R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520566; c=relaxed/simple;
	bh=fBZDeHAFDZr0SJjeir1J7nLoUKn2MLHuB+Y6RtEoAU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGgfHJ4u7E94O7x2hOpnAGE8zegFO1lU6Lr/WHLIXIWhQQEpVIm/DXBp4x+P1uAKFXGxJSKtx5u6i4j2hYcx1vkX6JrXuMLCnqqPp7x2tUdg3PYw+6ckse1cyZNbaY+vsIhsPD+g0Srp8F6COYgDhJWUCxUOfvQQ55KBg1nZ8OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kF0Q5Mk2; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kF0Q5Mk2"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso9420595ad.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520564; x=1784125364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sA++AxO5NtmYTBb+M8Kemba0fl9Obtf3m3Dlj5iG+Uo=;
        b=kF0Q5Mk2A03k0aOv/Kh65i/Yu0MZUe0ScPS+8ypYpirzOZVf+yjetzjW8N3KjxZZLD
         00BmMOGYqnyku8GA1b/U9FFHyj643xtTx1j7huulajKrGe/y67pRbPctnSr7TPogxFj/
         7ev2a0apQeN89CRSjvewE7UlQDoYNWMzG/NDKmVdu54iA/qKP6iWHuUkEm1/sXm4w7F9
         yRxtChWpp4Ij0Tla8J5z0gOx/7Jwi4kOK+FUK/4MtNFH1EyjOmbp7hERPC03kPcZTas+
         1PkDN9aoIJQXmzCQkjwAImDl1Jc3AMATg3H7h2KSd1J2+zWc75fZInKeY19MqImM9HF4
         RqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520564; x=1784125364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sA++AxO5NtmYTBb+M8Kemba0fl9Obtf3m3Dlj5iG+Uo=;
        b=rZTQivpB36TzBUfrZ0phgCw5LqCBC4xnbH+I4/yEqcvwjFCd2HuvQ/zMolL8L9me0/
         e6gQ1iIAXCpWDk9jrVPihJ7eJAnA7GCyTX4oi2NMAuWN31+Flk/vvJ2vyaU9R8dgUM7i
         lOqWyYjgkxlIxA2LtN0Qb96dmv8OlLAwujxIz2fHRocGV4M1YIlDooVYHdUCfVFqrxGG
         21BbQgnY683Q9J5LsJu40el/s+joTYnW2fFyKHpalDMSjQyK70wTtsibqxAO3aRQsc+Y
         qAZIGEW6ie14jZw1qgjQyb1m3bVeHyMhwDdxVnSRsu00/TNWvr0ezqmwF/sa7g3IQp61
         61Mw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1NsMaG80eXsrLWVu6joUt4OD79rHRCmJz80/0Rg9V1DSPhwxpdBKhJMQMpQ8ZKbdwpusc0RWWu+Bsqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA66DyxQNKB3OGYmC7c0wYV8kC8yRcPpjn4oSFMtpjCb6gXuD9
	g/UQnBHOTIN8oBDTD+LSlTSjm0psN/eTOuYBXjStaTzegZMdX9wTSKsV
X-Gm-Gg: AfdE7cnqv2esm9VFR+7fDuEtVsLTrytJFcsk5V/AV/YH/qDP/LU3ypBHHp66ZNsYN7N
	LKdOljdAObVI+Q5DRG7/BneUdRp/TmQZm9nXcbUh6tOeTO8IqyUdFT80Zs7QVQ+wT1gsBv0UXxA
	y+LpXntHgSq1o+dwq9tuGAjwWj2sOwnQSoWVaDapot5/dH3Fqou/NPeoX9xbtwS01JB7a2ladj+
	O5H//xXyh7sVSvM8OjRNN0AwO5eznzUZ43pdioGhepsB5+X5zCingXPHw6ltxI71sJy/XN3+yfA
	L8kkrB9ug7jYbrue/XzM6i8bMQFdxA2U23oC3/MMSIHnsLeo6CRsPt8ZRYmJ69ICXAgHjEI+AD5
	dNUYob8abd+HAmaOv9M6Ue0qn87SnTEAv3sBqx1dLdj/L7aETlyx0ipIWjmbM2gL6dAcIBZ0rC+
	s3FrjIeCSnDNWR4Nl3o+k3GNYjOIfgyNR/qN3WAudGGxIgo7k=
X-Received: by 2002:a17:903:234f:b0:2c9:97a8:8c17 with SMTP id d9443c01a7336-2ccea5962bemr27443295ad.42.1783520564494;
        Wed, 08 Jul 2026 07:22:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:22:44 -0700 (PDT)
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
Subject: [PATCH v2 27/27] ASoC: codecs: rt722: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:34 +0700
Message-ID: <20260708141734.578926-28-phucduc.bui@gmail.com>
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

