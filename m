Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD59466B55
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 11:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805049; cv=none; b=YT+ZDO/7dB62S4GvrUea9NkyBXuylWAnfq8sPVGi79WKMQtpoujUx2lSLoAfodqP3o89Q7+70k1HaXWZ5vmXGYSY/rt8GKczTeLQOKgxf4+oXsBnQM/DmWDK8jxmkB/yNES9oI18cspiJgE+MpufDWkS443ftFHyQl9uJ1k2OiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805049; c=relaxed/simple;
	bh=AFBxKIBwTyZrAmGdQnJGgzy3nM1sTvnC25r+L1MwTS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1WowJ28aaFB4Ds5sr0YfgtJVOfeaCXyGeAeYlcWt+zAXrBGr3oLp53JuKxgDyEMzqiSDnenoFNMJGo1EmbrBLw3WChDpLvIQ9+hD/Z5sVXbXs/dUJ7qcjZFdLf19cJ/rWeRCI5cWf7P4W4dgiUGNSePlPbiA7EUA85Vb/5iCeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pbs8DL25; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pbs8DL25"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceab75934dso5825745ad.2
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784805046; x=1785409846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mMkS67zlUschvqIwbn8/Rc0NE/xfd4xHXYatpnZ3xec=;
        b=Pbs8DL25VtrbFlGzWnytjNn6m6kGJRaPmSBl2Uw8X+l+unVYpWC2ekISjtxeKxCAYr
         CvChI9E9V91N/RGnULaLtql8f/W63bt0Gwb9TUSfq2Ia42JlXZ65AGaMkH23HPrZO8J/
         /eyBdKj5h3v20KO0bZ/UKP94wL16qM9QZDlYiz+UhlqM8LBeadpWTjT1xzwO2allEUSw
         Eu21x5bLMBnaVOKzduOs6/bbZqOtspmUqIKqjLAFvqfbwKzvxtbmXCkPqq6ZoT2ckP+d
         IqfxRvK3e3CD8ox+S7N/eyau624AxknzJz9aWd7fyahKpjEPdimfADNGiUs8DI3R4xIv
         XO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784805046; x=1785409846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mMkS67zlUschvqIwbn8/Rc0NE/xfd4xHXYatpnZ3xec=;
        b=mHDQqPahzu1+3+LoFXmpXJ6j7UNcbTRrX+smTh6JMDcTa7HcyC44EOyPeuHBiqCD9z
         LSFZRsvBtf38ur+tptfJi4HN0xNgOoJLjUqaOgUCMpHz4dFiIdn4gTfJtiYY7TMGyaCR
         j2ULH0WVMzMcCXukSWBn+sbWNYjfH7NReCgQ307VxUpLNWtqfihr0Rj+ZtanOf+BLbmw
         +2p53zZuJH8rtSOqm6+AYNInRgvvcIkcSKGZ3ABRATQypvYzIsMzHmqTvZDAJjZ1T7Ac
         ucRBI4qDDroG8Pyiqd3PPzyGehess5DtvSZE1o46D9mUH+h6WxRl7ccoqtxB1dS17PlM
         rPQg==
X-Forwarded-Encrypted: i=1; AHgh+RpnHSUiTEAx6X6HR0lrJ9C2Jg5ZTjrqYybvDnAmb00UVrrJF9M9v85S5KJlhycgmSSmvf+Haibm0NqKyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM+iIGfiTY9dZqdoYcgQt5r+4zde+Qri0SCBqQGD3DFD4h/GqL
	577VF7G5eRczwv2o8MTj3VK6XI0Bt5N0hSxgFCN2+a8VlLr7gHyf2E+S
X-Gm-Gg: AR+sD11A68lWFmqZNRYakjC2rCZ1husj+19CN+uYxe+hsRcNjw3QWok0AyMxugYnsGw
	63o5O1irFmNo9E9NAKJTHm6QjuA9OZ14HPQsj3iZGuteO3kC75Qm6/bA4i4hXGSts437ad7rAcz
	mhCQpVeeu36tj8QtuitHEIt66mmy4wAvh3LZuZPW1uj5NyYSi7iMD/ugMEyAqF/QB1vxh9gOyxO
	jCjFVqEe89YatYjGLNjbP4I7wZIG+5pUuayjOG1xnAel4+hdigSuWRJcDbaIBqzGwoXGzh1DE3U
	WrkAIzdf4wlEbVHZ3cPJo4CPsQRYU9d+/QaGUpyQSCms7b41GksdwnFya4hlmkxwyhlQLj0tKGY
	VuamMFqWPkFBFLUb1WXNCoEc85k1PNQJjUPdrdZQT6O30cjro/oc5eZt17WJqtTEzODK8EEWLfi
	RqiwNtVZk4YaxLNQfbPLsrBxsjwVK+jUNLbDAb
X-Received: by 2002:a17:902:db01:b0:2c8:2808:3ec4 with SMTP id d9443c01a7336-2cfa748ce6amr30066565ad.24.1784805046169;
        Thu, 23 Jul 2026 04:10:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f38a893sm31500805ad.77.2026.07.23.04.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:10:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Walker Chen <walker.chen@starfivetech.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/4] ASoC: starfive: jh7110-pwmdac: Remove unnecessary goto
Date: Thu, 23 Jul 2026 18:10:11 +0700
Message-ID: <20260723111014.54071-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723111014.54071-1-phucduc.bui@gmail.com>
References: <20260723111014.54071-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The error path after jh7110_pwmdac_runtime_resume() failure only performs a
single cleanup operation before returning. Remove the unnecessary goto
and return directly after calling pm_runtime_disable(), simplifying the
control flow without changing the behavior.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/starfive/jh7110_pwmdac.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/starfive/jh7110_pwmdac.c b/sound/soc/starfive/jh7110_pwmdac.c
index a603dd17931c..562936981cf0 100644
--- a/sound/soc/starfive/jh7110_pwmdac.c
+++ b/sound/soc/starfive/jh7110_pwmdac.c
@@ -486,16 +486,13 @@ static int jh7110_pwmdac_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev->dev);
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret = jh7110_pwmdac_runtime_resume(&pdev->dev);
-		if (ret)
-			goto err_pm_disable;
+		if (ret) {
+			pm_runtime_disable(&pdev->dev);
+			return ret;
+		}
 	}
 
 	return 0;
-
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-
-	return ret;
 }
 
 static void jh7110_pwmdac_remove(struct platform_device *pdev)
-- 
2.43.0

