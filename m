Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AFD340A46
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467626; cv=none; b=t8cJ0Pwcc8sQ9LcWEDFfDQrhCP7YLvvrkyNThY+B8O3w8ei2s1Gqox0xs4eSUaTGRKbs2n7Mia3Fxwq7vUwThKC5YFZPGvpWU2UHR4EDSoIy4OuLh44M6wi4sJr6Q1O6BC3a2Y7hNuDtYCI9H7ETmlPcI3hKDjij/s/0I7nnOG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467626; c=relaxed/simple;
	bh=chor1/9GogowF9EJgZy2hFJZE1uubwSj8Yvkq6IYPwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mTR+goiirtdlUrPeh60hkpWXBRr0sCgceHcVRR9vG4NPug88HERJuQ5/LusZunL1Cxs+YroMtkmzRdDlyW/9s7cUZik6nUGi/EznbrWflrgE24m5n7kDjJcVDVICdkLTQ8ZGu7d09MVW0IbqHLdTWPSbZghonDB0C0hYd7lUmPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/TSDQMR; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/TSDQMR"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cea3004256so5660445ad.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467624; x=1786072424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lljKBSDJsjI6QypuaswVsYuIZiZ2Rt7j69Hl6k2jRSY=;
        b=A/TSDQMREx++mLiEPRYYD12U/5YD2dk2hZQAel7mFjapINm+Cm9wOPkw/Ql5+3Ip9j
         ybG8T+oYlHbBdlEy9RxuODVlnjyQr1S9cdNctpreGXNAlnVWg/1+v8LJri1ZucZW/p98
         UaUlCAHEuHmo10vLqY89Hwk1FSbvzkgRnNqzx0yYhjYVKjssINSDHgO8rbD5/pt3I+h7
         3kSR6oYyg9UcX4aabnWyY+6WuNSha6/uJ+CLdh2wSAwMYYeYTfWs9nUdCwONa8t3vx2i
         iLQGE+JZnpZusi5mDlhlecKsYbbXWIQPmPJGk0yO7BZ9XWlVcngtwPIDnTmEg8Jt8Ncx
         bv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467624; x=1786072424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lljKBSDJsjI6QypuaswVsYuIZiZ2Rt7j69Hl6k2jRSY=;
        b=D2rcyMsouxQ5oXsWCRzzmVcbL84Yo3k8kXJHwJerychThfNCSwawV9gntjFZQn2CCr
         bTeOWfMAlA6hiPQ8ZH7aXAOB3a53J5AQZEf0oIMr98wVIhxg5yh5HztqcnnLk7sviGqJ
         xmDBEXJZeHT4Wi/xSR8fpXxIPEj2/cyNUSA0sllthHmQtHp6BpGlJm1ZRQ62FZgvLOUy
         XMcZO8pFDwMvkgVR5XA/b9JnKsbxw0QuDoyVdfuwOnUvPBdttxSi89Eadhx7DvB496cv
         Is9iI7ndH53udJRmSyrMihru6Tal0gAQOvCw21hr8drMlzJax2iElluuK0z8Fwaq8SjX
         +GfA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7B15FYfqiRIWgdLYJOcSW1TfAWnLIdWSaJ/nu6epmA8UBEqJa2i+ganz2/wlzHo3CAcDI6Ca29+4Xkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRtd9hHABNNAvi0nOU+ielE8nP7T0wYbUxYlAn7IHoHRV6jdWv
	h88lBBOXJztNcNBk3qfv9TT9gtrMnG3wA4ua/xtB/S0B4Wwy27+I12xt
X-Gm-Gg: AR+sD12/j5Mzgoc5XQFA37jvw05lbGuxNdvWeB5Ocw4jG3HWKsz2fS8+esWDI4Hhb8x
	1XVEhu7F+naRC0wTfxnKPxU7zzGKTOKwP9ZQC2SzCHQosMM9EbFj0RppuBuxbwNCva1xmk5O9bK
	uAcLLHrtNdbCnp+YtFzpzh49IWaxQQAKv1TLMuF8hCbFviGthxiJ/BcpqIovgVIc3ngYwSwFwe0
	smhqQYWy/Ll4Sm//tFWARcTVSr8zIqnqUVuaDcyillrcOmZ2zxWEEGLfT46bLyPHOE8AuQETjlx
	BxOaLBelbv92ghssOfGjgjIzPF9FyFbpF2E7Hou2qYk1GPa+DHdNlOwVIDxoYWG4i43I+08l4a6
	1ubCxwOp82B4kEhiL0+6T7BTT6EwHgl24BU7VhU8TRbvjuqSP6Afin0x2kmscNIPIRs3cRjnezj
	DNnjak4sC4xEuNfwCWxYUgcG7OhOzxjKEL4WFX52pToVwEle/jLCMPqiUIGBv9Xj82hObmfeX7G
	+JksSHNKljq7YFt6PC8AGqliAhcFAP+KsEB9HD44Yd3SvV8CKAHGkGCihO2d2IXpM7vwtUEX51j
	mnGq
X-Received: by 2002:a17:902:ce82:b0:2ca:1bd2:d57b with SMTP id d9443c01a7336-2d046ae7abdmr5105505ad.0.1785467624546;
        Thu, 30 Jul 2026 20:13:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:13:43 -0700 (PDT)
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
Subject: [PATCH v3 26/26] ASoC: codecs: wsa88xx: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:48 +0700
Message-ID: <20260731030648.8706-27-phucduc.bui@gmail.com>
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wsa883x.c | 11 +++++------
 sound/soc/codecs/wsa884x.c | 10 ++++------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 24a5904d8e6c..442cf9f3eaac 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/hwmon.h>
@@ -1237,9 +1238,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = true;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = true;
 
 		switch (wsa883x->dev_mode) {
 		case RECEIVER:
@@ -1290,9 +1290,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA883X_GLOBAL_PA_EN_MASK, 0);
 		snd_soc_component_write_field(component, WSA883X_PDM_WD_CTL,
 					      WSA883X_PDM_EN_MASK, 0);
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = false;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = false;
 		break;
 	}
 	return 0;
diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 567861dd42ad..a367c94bfb4d 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1701,9 +1701,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = true;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = true;
 
 		wsa884x_spkr_post_pmu(component, wsa884x);
 
@@ -1717,9 +1716,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA884X_PDM_WD_CTL_PDM_WD_EN_MASK,
 					      0x0);
 
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = false;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = false;
 		break;
 	}
 
-- 
2.43.0

