Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E285E382295
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 05:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401281; cv=none; b=ElYX7x2lwbv/6kayxTn0Lj6WpwjG5ZLK0sSc1T0cFDREMpn3811iFFixOj6KEFS1ySNz7XV9R0cY5vRsy/VgOoyHtTGGar2s74YkMkdxKPEHw+XLWDTXbf50w67F+Z8BKGJQBlWceEPwM9kcGy0pLl4lYZuuyUl2KjIgTzLisQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401281; c=relaxed/simple;
	bh=IDudHAnlR+Q9Pih9JQC9jPGTfVHcOirb50Q8pWm1ZCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GtsPYxUw7BC2cR2fs3RSzb+92TwO4a3DjoSGtxW+iTBjmtQIJNk1ZIF+C/z1kRNo+0DnRfjvNUHmfaSsxCpab5xmO9m638ZkU+niYSEgIgM6iVK5VvP8ahfWc/Y5Fu8/FcIOxiP8BxdrAe1eIFKlTV/8RorbR9neVOZ/IWFk3SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSmaZkW9; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSmaZkW9"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-845ea8924fdso4166116b3a.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 22:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401279; x=1784006079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jx4K3R7J14qevcRQlQ7H2imyxPOvHjyo+blKhtQwrsE=;
        b=qSmaZkW9tuc7zD7rKixW2IzUGS8TclFIGKDKXXPKxSfag2eyFIBlpVjddr6kK81Aml
         mzsdZmBVxUT7Uhv1pyXbYL/Z4H9EzlC57UCR+g9PYPCnLcFr3iKy0keEllQyh5SH3r8w
         QOxIsPqM1UvIw3MClST4OoAWJ8BRpWn+lICT4m6YkIX766TT2fbFjMofmfKomX6NF3Wv
         EVg/LkHSJMeZ6Y00f16nitCocB8KDD+EaOguDFMfPcIoGOfZFDosa3ikkKiexAy9MuN5
         L5bEsXw7xy0yj2AXgCRl37REl1DGfKp+KuZUKIxB27lwFiz8CvowVncg4mrKspvR2bOR
         dxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401279; x=1784006079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jx4K3R7J14qevcRQlQ7H2imyxPOvHjyo+blKhtQwrsE=;
        b=hPcVYOxIPuJWHIdmiYvQPfCErmIrFjfwnQWvKVEG6cDERF7pRhO05O0zUL/JNTKKUt
         SiWf1y9489HMTTQiGiEBERf43Hwr8rqWPLTQaHYOiovJkm7MB8tBfDgl3bh0XDnuihAj
         qtPAseVdB4J2fufcjea25HPDW51CxRsDtfNqnjW3I5RbFe/wYDlxJJPIK3ZjfdZkQuQE
         KAzbFcGoCdKVnmtHxHHwO4/mxbk9lHfM+f8ZuSWgsrQ/gg0U42JiwHxTBoffafAk+Qut
         R0y0D1BYZCwAwzGVOYKZ6sABrQ1ecPtlM8aMBn9b9fiOMUac4Z8LRAl7km5YQBlLGb8c
         X4HQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrhdxsirv3ZQgV6iTKtX55Za81f9q6WcyfXyhPXLBOHgyFrWXjkSrMjC5chXC6/QKWPyuSf8cIrf2bSrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Yz67R0ScDjnPFZcrD37rdS+Sip+30NYp9be5A+QpkHSTkg4F
	zjkk96x7qtCtzRmwuT/iSiHsbh7eJ0j4wvocmGiYMQpo6yHM2jQE+rfD
X-Gm-Gg: AfdE7cnTH+GzreZsv7hN/5Tk+aYEbWDuVmyTgO762aVvLcx+YhAjRQZvm1vnMqbE8kV
	NhMVBAMur2zwmLzvIKmG8AOgFxSaIbS/2nxz1DcM1liRXubRyrdEj+HXPFQ6/yKLTaFMiAcC/yP
	N5pIQxhW7irggGlnewEL9TZg347eF6uCm5cyNvZmfpGqzhZAYYRY31oTPLkbVyOVjlyPu1ORZnd
	yGRUsbJ+f6Qm6MSG1aGoXuL2gJ/dBab22//7mS13A/iaGh+t732LXD6Tkf1n+Tf2/uYVMeaouey
	cwJezJFhOat65gCm/yGxeccOdmRRNZcDNOzQ1v3ckF+IINZTOY/qUDQle8wmMdJBZ6sM1RpHtjq
	9AuC4SwlpjIBybvB7HXI60ywHzKiZ2SvriOcD4Baje/BgNNbVRHMkF7GCIKUFuq6qR4zmpH4OSf
	74UB2Ogo0csQtaZMKWuAzacs2YhTJHLvh6invfjvBNSRCQ8C0=
X-Received: by 2002:a05:6a00:f94:b0:848:2f6e:e52d with SMTP id d2e1a72fcca58-8482f6f032bmr1452187b3a.65.1783401279348;
        Mon, 06 Jul 2026 22:14:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:14:39 -0700 (PDT)
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
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 24/24] ASoC: codecs: cs2072x: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:10:06 +0700
Message-ID: <20260707051006.20058-25-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cx2072x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 83c6cbd40804..908344ee5892 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -9,6 +9,7 @@
 //
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
@@ -1408,7 +1409,7 @@ static int cx2072x_jack_status_check(void *data)
 	unsigned int type = 0;
 	int state = 0;
 
-	mutex_lock(&cx2072x->lock);
+	guard(mutex)(&cx2072x->lock);
 
 	regmap_read(cx2072x->regmap, CX2072X_PORTA_PIN_SENSE, &jack);
 	jack = jack >> 24;
@@ -1434,8 +1435,6 @@ static int cx2072x_jack_status_check(void *data)
 	/* clear interrupt */
 	regmap_write(cx2072x->regmap, CX2072X_UM_INTERRUPT_CRTL_E, 0x12 << 24);
 
-	mutex_unlock(&cx2072x->lock);
-
 	dev_dbg(codec->dev, "CX2072X_HSDETECT type=0x%X,Jack state = %x\n",
 		type, state);
 	return state;
-- 
2.43.0

