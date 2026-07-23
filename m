Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42057395AD4
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782596; cv=none; b=gv+rJVPjeoln4cB4hklask6AyXEJI58tgWXrb0OdUg1JNtAtZVFQ6s5EQ4F8AXPtF3ymZUvpe03bzSA9r0hzjio6D5x9UkaP/X3DAy7O+iOnGKoKgG9w/M5Gj/HWk8of+gDu252SA+KGeZ/DgoJWzylSzaUc+UxrCImSZ1JwmvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782596; c=relaxed/simple;
	bh=K0qNNfC3kV/sDligl/YtVeKeS0f+6Ya3lXb6LENAZSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BCtvCEqiXQzg5jdygG2nKqku5RrVeYwckc3/vWkhKTuc5BTkeeojarAz34Rah7CrimHmUcnRWxr0xpqSuAqad9RGTAyJtYmqIDpm/oCheG/VnrQjMMbKQLePz93qcGBjnLBj0Tw1bc3jGama9AzXssQmESr9muvSEvwL5qZxRm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+THBt3O; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+THBt3O"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caced6038eso589925ad.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782584; x=1785387384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6nAKMdocPGkvuO4NtwVmzSRSgTeiuWi8Ahf/iUqF1PE=;
        b=L+THBt3Ogue/f6u48xoVpyL67PRwJjV6FiIRb6FMd0fmJMJmihBRUUIvB6oXgCCnk6
         ga2njBwBxb4xQpzBFVwu8p82wJxMY/cTjAOp+OGERaqYX1OagtCNUqGKnJQ0j5tOORVl
         WDQAOW8eSE1u97FCKUHEqepvbxJ553IKXXDpIdpBjJXnxQ/UKMrC+qKMC8bAP1f4ygkF
         rqe+vTnQ9WXlZzyC6/yQmIKQI1nw17MSpe8l7toXoP2kyTfOGUpxk7+ejrjVJxsTrXOW
         EAiZouE8OaG7cuzGEfx+hP/vu3s/uOR7EzvsbiYQ551F4aVJHNVIuq0kQ6cs7GK3BA3h
         NVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782584; x=1785387384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6nAKMdocPGkvuO4NtwVmzSRSgTeiuWi8Ahf/iUqF1PE=;
        b=aiKIYk/OybRihhT0FOlvNlAqP8bFW9wYrri/E36OsH1HKkhJmXFOQzy4RqnRt98LQk
         h6nTHz6Sa4UL1+lVBp67nzKgQppjBHQkz81qA5dtSLHerCSpa6DChUUsQ0NXZX0BNDsF
         7RQQ/QgtviNaBGAhNC0o4u30EeizZ1xtPZnmIyY9Jwu3srTH7t6/46BAHNQnkHJRS1ku
         1Vos/LURQ9YyYCtvJ/8pWiQbFra0hy0+NzNA/NAQ2Sosdin9F+ntjgDvjHG0SGofbvIE
         fZTFXOC9c81cRSWfPjL+EuC0Uc+VJHCbtzLZGS0P+1SSZqPYYeXs1c3ueqS1srfbV65g
         +9hA==
X-Forwarded-Encrypted: i=1; AHgh+RouuS1wu6tBGo3KhSr/hddu4Wjtvu8tvFsMB7LpBzLq1sqw1hMzxkwPuDrIPxjmEFoOt2/KsW412Otgjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMEgZ8U3E4Mz8QtIZTG9Gxtgq+VuQ2wZoiZDnRztBtQq1yGKT0
	l9hdYdio2GeynKQoQPM5auzgG5emWLhCkqI4Xq2z5phRaTRSU2HMasBp
X-Gm-Gg: AR+sD12Lfg2C78DDFDwne8puJc0HidzKMuWrUkPvkLV6usHxnMFZE/WikxBVDuuojeR
	wPo91NRKQYrHRrcsP2sep5U9Dz2YCn7SyxaYu8fAtrb1Q64we3Pd6fWtuzUeUFFScxLVzPrg5sl
	Wq5lKR1D4iu4v78JxQHvX639LMYEhstJKu8Fbi7ttt4f2r+tH1CpcEjql+1V9EDBKY+LHMujKvW
	XnzRHvBK2xKE+/HMqCCBAYBftakFClwVjv05N7ykj00bZiH7x2gm6AUjJYM5gHFFGQBqVUpvgLH
	r+quIZMaX+hrLOFbvQMa2J7lO6+umY76GHRnd0LRUE6663p1ZQFBybcUeHm0sc4/+0PFMUeivZh
	h6vKLCx2T4+2WSy0HDC0ovWqjmNOfcxgXpRDvCDuNfwZ5oF9vQXPtfCsdvoiXJmngcLyDK9e4E7
	+8r+uNG7Q0jZcKs2K30nBL9ffhcPhfP+kaAAZn
X-Received: by 2002:a17:903:2406:b0:2cf:41ba:96c2 with SMTP id d9443c01a7336-2cfa94ce6demr13480345ad.12.1784782584053;
        Wed, 22 Jul 2026 21:56:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:56:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 21/26] ASoC: codecs: wm8958: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:22 +0700
Message-ID: <20260723045327.28260-22-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723045327.28260-1-phucduc.bui@gmail.com>
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8958-dsp2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm8958-dsp2.c b/sound/soc/codecs/wm8958-dsp2.c
index 8ff0882732e7..f75a6dc9d2bb 100644
--- a/sound/soc/codecs/wm8958-dsp2.c
+++ b/sound/soc/codecs/wm8958-dsp2.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -864,9 +865,8 @@ static void wm8958_enh_eq_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "ENH_EQ", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->enh_eq = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
@@ -876,9 +876,8 @@ static void wm8958_mbc_vss_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "MBC+VSS", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->mbc_vss = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
@@ -888,9 +887,8 @@ static void wm8958_mbc_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "MBC", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->mbc = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
-- 
2.43.0

