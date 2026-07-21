Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4983848B369
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 10:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629789; cv=none; b=GWvTqDFcbJPTrGosBLrmimoe46T3v/0ro3N4WtYtk7Ai78H9T+UEhBrscaitHq9ZFHWxE9ZkHsIwfk6+ivMsVEOGYCuaAi3IgWuQV0iEPHcmHcxrDdUOBc2YMaNuSkpnlk1tDJ0mhDQ8jkpWKzZbeyCzXH/4/PNIyHmUsFLXSeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629789; c=relaxed/simple;
	bh=8F9X1MduGNHr+4W/gnNomvdCKgWHsQzUoZZo1MszsZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FwHiYP+3QTOFcM5hg/JtHdO1hLdA+zMqBDKc2qtZaVB5mDPFgNdT6yKGCZFerjTByaRzKltOkePcqFkey7kx9lIFu0wHNGpjSdLJTnNVpLOcUQuMJPLn/pBxGY7ziaWJWQMAEdfk77Plzz/dbNJfMJwXnlXDf6eYsjkRRXnoUhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=co/rxicp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="co/rxicp"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ceab75934dso117026215ad.2
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 03:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629787; x=1785234587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lO6f51j8XQ2LkBzH9pjltC7krTy+qWIB9damC+nLnm8=;
        b=co/rxicpSp8GWcpqH8wg39FEytFxMeF37wIVY5qmVbKwXNb0i/BtY5mYv2y61KcjuF
         EEVDVuEi8DIzlgEE3rbSEU8PxGDmF1elGlg+BBvOMEPP+fPJipy7Jsu4jzEGlUcYNgJW
         v0LRzRhhBB/GHdCM6xh0J/vOPwKs+lesId7bEmt5nuRO4+3Y7xS+HVp60w7V5jJeSVzJ
         F2iKTVFZbU67ASY8KKJLqt8PXNY7YbUC74mTt8s2Fvh7ZDRUFF/XJIIaeWJcFZMGab/T
         jfqSqyDlHQdW44e0UXk00rgNlrYQIhCwwkKx7hg4uu3ymBCQ6UfJFc4kACgvUiE0+miL
         xwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629787; x=1785234587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lO6f51j8XQ2LkBzH9pjltC7krTy+qWIB9damC+nLnm8=;
        b=inEYiHM/tNBUD6afdqWOm56Du2WepKBF0ig58kf/uvxa1H46+yWmIjfRyeBE1KKGDe
         /7pU0Ixfz90cx708fRfwV9hIRvuXnSUrije/aL0OVdBFu5LHuYGjn57i1mEiDEZNni7c
         QPZhtDwngwHz6x/D/a0DNg49CabdNPJm4c9Gltbfs4eMIMS+Bnb+ZfUYa2ethfYxEBl1
         ezWzcPa8jzDv5ZH5+5WAFsu6wbHpTqu8yjdmji20uuiYB5xsf6GPVGxkSvLIxjyu1PMj
         +1eMFKsAmniOUSp7gAeXBUh0hTvnIMNRAZAk2811V30WBldroZU2TVHL903+0STdavCJ
         A1cA==
X-Forwarded-Encrypted: i=1; AHgh+RovfvDxh/PAuQGFir13S6TcGgWm7gxd+1ybJfD6PHRrCJxv5OIdf2YU52khkCXyUdzQFyoOBxTsjMwduQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbOvlx4Bi1Ep7b7w6/zofoNPinKpXzyAEoZ0vG8e0bN02vpFmh
	jXnEw8WqFSqkYnBPfB9JwOaEta4fE3EegRf+xdNcH9GIG+eLSMIM1mlV
X-Gm-Gg: AR+sD10M3UFW93WW9pKlT3UgBNYNK/9EpycfNB/sxVTf/mwHjnevjWy5Hx6jk8WXcxV
	xPS7mkuIkzKX0EwqP4Jj63BGF5mPVTLzxy1GTWIpkO+Vyz84gBnoauJ8vBi019h7GaiTN7pdN7L
	h4gVJayi96M49BYExgb2uOOB970hMmmmOI+oR06utt/ylfi1uSgheqf7tq7s7CfzuK1lev4b1Gk
	j3EEJ2G1Ghh1yKiXcc+Y+2FCS2x1tm5FLpPHj7Xhax3qJSBb2WTx+1d7Q5bjRCMsZuXlRNTvCLv
	W9snuYzAD+CGS9sIeHAXQwcFqiYMicP78fOsHAKjz3cUraCPE+isIFySUQ0GfKhQyTCTAcq3bvE
	0s6OQ3T8NfPzwZRjAcnU07QX6ftkaRMDRM31hwjyFowO4OMSRcG8S1pmmldHTSfAy7A7525f8LJ
	JPekld9c9eyVh3bkF76dHhJOLc891F9yWRskWL
X-Received: by 2002:a17:903:3d0e:b0:2cf:6dba:b294 with SMTP id d9443c01a7336-2cf6dbab68emr73742545ad.22.1784629787546;
        Tue, 21 Jul 2026 03:29:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:29:47 -0700 (PDT)
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
Subject: [PATCH v4 26/29] ASoC: codecs: rt712: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:57 +0700
Message-ID: <20260721102600.523199-27-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt712-sdca-sdw.c | 30 ++++++++++++++++--------------
 sound/soc/codecs/rt712-sdca.c     |  5 ++---
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index e23501ed87a7..c50e74e20a88 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -427,13 +428,13 @@ static int rt712_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt712_sdca->disable_irq_lock);
-	rt712_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt712_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt712_sdca->disable_irq_lock) {
+		rt712_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -455,14 +456,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt712->disable_irq_lock);
-		if (rt712->disable_irq == true) {
-
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt712->disable_irq = false;
+		scoped_guard(mutex, &rt712->disable_irq_lock) {
+			if (rt712->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt712->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt712->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index d6353af07380..2218f9918ae3 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -7,6 +7,7 @@
 //
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <sound/core.h>
 #include <linux/delay.h>
 #include <linux/init.h>
@@ -403,7 +404,7 @@ static void rt712_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 {
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 
 	if (rt712->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -450,8 +451,6 @@ static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 
 		dev_dbg(&rt712->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt712->calibrate_mutex);
 }
 
 static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

