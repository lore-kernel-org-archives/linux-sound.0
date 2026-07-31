Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EED345ED8
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467578; cv=none; b=uRfixZbsziYMuAiMYpCIPkUCXrRc9FAO/2f15MQ47RIxB/0baJXdVoRXbRDNSq2VmswBIcAbaOkmPhU+/s8g0vvzRRWFH9CZb+dew5WY2Hn4UpNGUQdCDvIJ6PaBAT6eDeLsaMDddrvltFd4mNVcSiHDxeUlQaoPnYE/fdVNcWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467578; c=relaxed/simple;
	bh=wXTCecCG3P1SgVWHCEU9tj8tNEts7yiCpzhIsjE4ebY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bj5VfOPasB9iXC9gvoE3ChXrvkokJ40YQCRg0DhVohI+eR7l4UtG1wt41uORf1t7EMTuAVlZ2P3FFrz5EtmfUE7QYgfesNu/+kQohfJrVLM4fVV1wtoSiurtYlytRl8U/SFnTVtipSXGOe7hZkdr0cbk1d2rt5GKL4iNjxIi/t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWyJHDfk; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWyJHDfk"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ce7d2adef4so6823015ad.3
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467575; x=1786072375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqZF/A9FX3lKVGMpZI4nxsIDlraiqAClU6NyZ93gkxQ=;
        b=dWyJHDfkJ/AQiHm1vys7aqC1lVqd/abOpjInkTCDSsrUIHY5oO8mKTMl7PEBRL+yvd
         WKNYFT4Xe3EdC5BaP/wW8d7CuDB5SgI2Ywx4HwW/tNvkrqStMGFpGQ5HzPt169Lv/l1R
         j1p4COnrC+xvwGOwXMmPtAodHFvsZSKMEuBAbc0BdPg9uh6OtcCx221O5xyQa4tg/Ur8
         PDVuMlC8YfC8HHm3mPPsPW7wWfA4mFcN2selcZw9LU3JVM9dDlEBvgFUxDctsxdZDNZs
         a6a/U5hxNIPfdd9jaF/qduYgGrFuDb8hMqExb8YTCMWucMDujfqMvxi1gpdjsaYPBrni
         RqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467575; x=1786072375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MqZF/A9FX3lKVGMpZI4nxsIDlraiqAClU6NyZ93gkxQ=;
        b=sA57vNwnUZ7/e0dVlA9n37DumegKu8Qvy1upMw2QFMg62sera+837W5oPx0wTaoI8A
         vCpaxBWjx2uqlgJvfOukV6iaOEWsQ0x3x1ldtF6yMOn3kp/5ngj2bmCidx5fFzhBZmvi
         a/jBG60hDw/IPS5ByVbub38Jxu32gICoeRXMsOFl91ZGLGt03VLwCO/U8i9NqXvU8z16
         dsQDd4dw3wMZp/Ih2neyVLtaPO1hUNh49kQh9dt8/NAP+aO9AFGZjJciVbMmUMyVK/AP
         7regjDlSfUxvQim/CckDI//vcNX1VTRDXmJMpVeHqLJqbjK3TKpyE4SJYaML5jCkdQaK
         Orvg==
X-Forwarded-Encrypted: i=1; AHgh+RpjYVr1cFp4TAeS8emuYud+cWS1Zl8jZ4wVi7pO8e3OjUICPSpQdcVq9lDYENk2rMH9HQIps0CIpdod4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG+7M56M2Y5vSJ3tigCZYg1mEbnIU2/cK+TMZBULqdj5ZcjjX/
	4twMlkWkZd/XHylBoasFUUNOqwun+BoH0+Gxl688XWcdradC086jw4iG
X-Gm-Gg: AR+sD12qUl/xPynpIH677jNtuzpTAFeLPKTiUZ4YNMoQCGP/QMIyQ/4PF3waOsXMLQV
	CmFblhF5eo31Vdo4YJbTHTODFQzkEdWE3uS+8Mqr32EmmrmJX97iZULknDr9MtqQXaDsII7phj0
	KXbEzqUQDanv4SYekamZMWLv1HtZqnpxuLeryY7paZxCa0d7vN7XRH77JpEivlCQTUF1nMOIi9b
	eOzrdl54SGdfyruNKHL0wInrOwL4Btg+i1j422JPXcyj82HlcB+vr3AqYMtkno6adIB8oJMxn5o
	Ay43GMc5qaB9VEmvZIT+clXaOCw/e1sc9Y2+orOgekj6Xvbd/d9bNrm18sHVbQ7uzf6oO39jhuD
	Y6zAa/w5GLy+G82VxAuuSbkpOrHVfPnQ3aYKbxLsV4lOEga+/akIGsRUXrBguynEyRrAZhgayro
	4IO6g7bYbk3P62a30hbA4G+bi30rOKGioyTx0MRgRGUPu43+MIZa8P45EdgVaXGDphEaAja8MNd
	HvNyYvGP7yke1Rz99PZ6AvmyvAFGRleD9pur0iLI0Nfup/LNKHxjeEEAaam52eJd5r5ak8VIiK3
	cfWE
X-Received: by 2002:a17:903:1b6e:b0:2ca:b8fd:1a8f with SMTP id d9443c01a7336-2d046efb568mr4883115ad.39.1785467575060;
        Thu, 30 Jul 2026 20:12:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:12:53 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
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
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 21/26] ASoC: codecs: wm8958: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:43 +0700
Message-ID: <20260731030648.8706-22-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731030648.8706-1-phucduc.bui@gmail.com>
References: <20260731030648.8706-1-phucduc.bui@gmail.com>
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

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
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

