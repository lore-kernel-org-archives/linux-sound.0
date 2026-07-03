Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287C623BD02
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 05:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058188; cv=none; b=pRppmM7SddNiHLiTUDdskemUb3bSwnpsnyyy0u/m7J0JGtefLaEqnoKNK1L6mBa5LgUbVrokTYKbRW99rZc2l30KqRQkmsYSYXSEBjISyKovjItr7Bm8TNXwAsrccXrNV+dwOGNmD4EPxSfdFE0k+9Np5DaA5I3iZBbVufsP780=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058188; c=relaxed/simple;
	bh=WYggS4ZnMt6fzQmOJcSRrkDc66AvTs7KIbRAtBpTltY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RtjIZ4SSTZvx1SYIgkJ0OsZO4jL4SJN+iFpbB3G8p+Sv0DWonShKN2oB5JTaKmRJDAeN9OGVwVOPj4CPR0qjxzFUOVYeD7LZacUuMdEsIYDgkyu6423lCxlAdJoIm5RsixVgBhX6Oy9Bn1VCZ+le5FYNq3bIul56FCDAX982OOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6sajgXz; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6sajgXz"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8479f1a86ecso101942b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 22:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058186; x=1783662986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTbk3qG2turaWbnOrhzIgpcLjXYgFFUDaRvJ6ZSqU3g=;
        b=g6sajgXz+k0u0u3RX24O/XOG5Fmj7lgnktaqZZp2/NEzHK3gPmYTXnTE8ALiC7tSMM
         KDptnTOAINsw5V3CeQ5Xmg0mTASkrqXkir/eNoqL6t3dPiNIdlogEojjrIvDlunLvhVi
         xdoTJ+267/02N/5jMEnwftoJRmfiEPhMpkIdPNKLl7zS+pwYPP3t3dhg3o9FbD8BOc4f
         P5CrpqXpU8dSIxbFfUUSY5uPRt9/6KRgKjZN052/0Lda6ppAER34ESIRU6NfifS+N+4c
         xLH3mfwxwNl288lLJp/lOuranvPLJS/Lb4AKQfeGO1c4O/FIwk94WgKlCRCVBtz/fcZA
         jahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058186; x=1783662986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YTbk3qG2turaWbnOrhzIgpcLjXYgFFUDaRvJ6ZSqU3g=;
        b=jNoSNrRUD5KrdPrnJr8/L79PCXQZQl0hXpQFCXBCsfaq4Gp7DnvXf5j9J1JXg1pHEZ
         R6bhVUF0dvvBBwd2QNU2NKf7RP1ckX+WhWGj4rv0ZzRazThF6RUaF7QS+VzSqIwCjXxC
         RAFkt27QQN4RiDlTHhKR2qnIdeO6KAHevFuzeAa25LPh5O88CbHY85bJuSYKY0MxBrM2
         ++9DfmzQ8e5hZUnATVLhZfuBMSiOPMggbXAzR2YtuQCnGGgr7yR2+3ZWFTM0J0rH2BTY
         awJNID+H3rfXR8X3x4Y9HMzCVwwUMyRObd8CHUoIxGyVtNe/3X7/hTjRLuK78OkWWqBf
         sdnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rod8UmAprpNz/c9gYxZDSSLtleILlbXjaIj+dEH8+W4lqYcxwAn+U3e7em7SqdFkflTXVIL7iPHaV505g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR/yrkM1ueR1BZQoKpdgQHUCpRP8GVNF6pv53uDznl9eoXeE/q
	sXw/G1fREZXmueccW4phVKcba0mANgOGR/mhOc8rseUrR5op3XpVnJqn
X-Gm-Gg: AfdE7clbhxDknSkavSmiWNXKoZVVROl8YdsKvOr0mAAh8pDTqp0yHhp9327W+Tb7H/W
	hphogfS/HvTDigFexe5bm4E1pUIcuflgMKn8VpsW9p3tHxKIfYugdrQ23BhV28RcGVvdmDyxI2A
	xFG/ernaLBHmqrwzZSvtIbYW6fOnKfk2ZjQs+SSZENsvU2y48yixzB0xomhifQhX/tILrMkw7iQ
	Zw+0U4lw1Cwv+NsuRFp7dvP3S3uN5wuGVLdsgiqHMc+AhJUYb1ASOMIf67U8LcRFsDQgfQqXVhB
	DdO4adJ00NT1Rbmw9UmcqKfPCWTlWDGq2mEdUHZThW4di1A8xMw1VvKD4vKImBoCVqAtT1SQRtp
	kb/Oj8lE6qZy8xhdcThYQ50ufj6vYjSvtInHaT437UZvL1LJ0ffUE+ih1CZKC1KpvDiAt2CvuAW
	ZSx74rr3JMK0aesDPYpUwKZAzb9gfFOvui5qpVp3UUF61G5a4=
X-Received: by 2002:a05:6a00:414f:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-847c50428a1mr8169003b3a.14.1783058185595;
        Thu, 02 Jul 2026 22:56:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:56:25 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 13/24] ASoC: codecs: cs35l56: Use guard() and PM runtime scope helpers
Date: Fri,  3 Jul 2026 12:53:44 +0700
Message-ID: <20260703055355.244898-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Convert the interrupt handler to use guard(mutex) for automatic mutex
unlocking and PM_RUNTIME_ACQUIRE_IF_ENABLED() to manage the runtime PM
reference through scope-based cleanup.
This removes the explicit cleanup paths while preserving the existing
behavior.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs35l56-shared.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index f14e2eaaa4ee..73fe1cba3f5b 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -645,18 +645,19 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	if (!cs35l56_base->init_done)
 		return IRQ_NONE;
 
-	mutex_lock(&cs35l56_base->irq_lock);
+	guard(mutex)(&cs35l56_base->irq_lock);
 
-	rv = pm_runtime_resume_and_get(cs35l56_base->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(cs35l56_base->dev, pm);
+	rv = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (rv < 0) {
 		dev_err(cs35l56_base->dev, "irq: failed to get pm_runtime: %d\n", rv);
-		goto err_unlock;
+		return ret;
 	}
 
 	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_STATUS, &val);
 	if ((val & CS35L56_IRQ1_STS_MASK) == 0) {
 		dev_dbg(cs35l56_base->dev, "Spurious IRQ: no pending interrupt\n");
-		goto err;
+		return ret;
 	}
 
 	/* Ack interrupts */
@@ -680,7 +681,7 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 
 	/* Check to see if unmasked bits are active */
 	if (!status1 && !status8 && !status20)
-		goto err;
+		return ret;
 
 	if (status1 & CS35L56_AMP_SHORT_ERR_EINT1_MASK)
 		dev_crit(cs35l56_base->dev, "Amp short error\n");
@@ -688,14 +689,8 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	if (status8 & CS35L56_TEMP_ERR_EINT1_MASK)
 		dev_crit(cs35l56_base->dev, "Overtemp error\n");
 
-	ret = IRQ_HANDLED;
+	return IRQ_HANDLED;
 
-err:
-	pm_runtime_put(cs35l56_base->dev);
-err_unlock:
-	mutex_unlock(&cs35l56_base->irq_lock);
-
-	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_irq, "SND_SOC_CS35L56_SHARED");
 
-- 
2.43.0

