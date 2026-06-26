Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1A83D567E
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454567; cv=none; b=ut9YE7ri9e3P+jkI/vUIPeEZIsesaQpdzBrUifvEiZ8B4vwxluPKNX6B/7DbLmxiM/SPc4NZE+7lOkmIzLSf937nxBZrkqspVOi4PMA3gQ1kzn2aabIUJIlADjOhXCjPPrBobrRpPk6kIGc+uJTY/K2rgHz9AdJfiuB9ouVVtRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454567; c=relaxed/simple;
	bh=4u5h0yVn9yjNIfqtU9rFyysttAZ5X//E9h3Qe2r+g+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J90VH4BLMFO+1AS6Qzrn6luD+/SsblohOU8QkTmLIu8s/Imm5WASxZ9NWj5PIeaDlWTwTYKIzzCqbJmJDLMUvnXJB2Ce+goZhU2lx9T/lwjkgMN4/E+uNhG2poKe5LQ94o74uV2wnzAk6tAwzglfPVerNvsieCVHeE78cHFLwg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGA8mIXY; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGA8mIXY"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-37e00ef16ccso501726a91.1
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454566; x=1783059366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m86tuCHiDSXFV1VRHqmj5im360M3DmbD2YS9wwBnIRI=;
        b=aGA8mIXYx5XN/LSYN+squEbMx565SJ8ryCk1afbFrK3y5q/OCCOJ5vLQb0xTo2oBZI
         IwejDcSaE+aptEQTeJou8dQCOM1+F+kziPWmWWIXtxRsVpGZBYNa3qmqkUjt7W0z+SWR
         2179yapfpiYtOzT4Y9H6wdsIKKPUGOe8lhgvMRMyHLoFxwB1aN8U+ZRB5yKOC4gFrAhu
         RhrNBct9yOSGQaiX72sQZ7p08g0xwZORsl/bSzqc1nure/mOYPkwxHjH3g3pXsCOAjNR
         q+1MVyNQ59Txj5zxmLJrqpJ5Mlp52a4NhEm6dyyC4g9w1mNg4MmD3WcqJ65rkInNxJ6E
         4tSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454566; x=1783059366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m86tuCHiDSXFV1VRHqmj5im360M3DmbD2YS9wwBnIRI=;
        b=MCoTaDXmONfjNbuH1BO0dSjNVaoHSxR0tlnfL2gK93FzgSwGA6GzL8JaGQrkdsVpaR
         sSoN3qPeWGlajIl7+kJx3/9T4UjRAkiJx4dRuV7LlNSDAZFxRs0eb1qq6OTXvpEWQ/tj
         4Gg12mbN1b9iriTnJQDxTaNf75jIdWF11d0uyeEl59kikVN7349ZWQ+Xxzp9yEbjYJBl
         Lnl8zC2VZqSEFMMDcbWbmZgzvo+2P+9xwWRlrLMAcid+5A4X1L57/hHstPrHR4Aa27p8
         bHAJGDK9j4I0WfxBBbMOGLbgx9yCfLyX6CWIQpNH8ueLAO25fff/bK8vOhbSLJ/LDIOX
         d3HQ==
X-Forwarded-Encrypted: i=1; AHgh+RowBPD5LCszSIZe8cp8TumVChGEjKDiW+tT2VUEonD5MSPNtLGHpebcHvgsj/Lp75PQqPgnqh9lLOstWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz0e/pqqkZ1A7ZTtdKSRSqxkyxr4rI8hVd0M7zgrts4CzIDW/D
	KLM4G2YfXLpsC/BqGEuSpdS1rzhG+oluDi3pqv9SIwAg8envfYPXJad3
X-Gm-Gg: AfdE7cn4iDpQPD+z3mVlDsWWqVrMiAl3Cp2TNRsMWv9bsQQF3F4mzKwpoDXERz7mNxC
	Tk8Xew6RNrdj3uVSVhjtabWmKtyddXUJCs8kf9Q2PpMlLXgUF3x8Vwisat+JSDIszk67OOsaB07
	siSMESHWp4XmFlf6jGA2OenImdcerDT+fCj+ciJbLVv+fc94G5AmFuPQbNSVHYt+KIQ2Kt3pzMX
	OpiR0msY0/YnIMyzZMlqmPJorhWmbFTRN0umHU9tBp9rg+CkZtFHX4biNQ/+i6j1J+0tMNwf0sh
	HOSUA7p/T8CuWZkXqnynqpSb/ka7c6u5vTYnFy9+uM1kqsKbZRmp3jnuuxUiRSUZiIWmVB1Lc8Y
	kaidaDJm1DKjpJJlGkFO3147zRW/rUnMl0t7KJkq3hU3ZeIZYY6M/F1cXdeQaRWtKFsDnRG657A
	+VQ047RYKjAJkCmG6nR+grDGN9qyTqq+YZX3Xbr76P/GVyPSI=
X-Received: by 2002:a17:90b:3a47:b0:37c:6505:e7c3 with SMTP id 98e67ed59e1d1-37dfa274673mr5403834a91.22.1782454565637;
        Thu, 25 Jun 2026 23:16:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:05 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 19/24] ASoC: codecs: cs47l35: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:24 +0700
Message-ID: <20260626061329.23264-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l35.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index a8fe5a99a8bb..e77ac7bc8466 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/init.h>
@@ -1566,9 +1567,8 @@ static int cs47l35_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1600,9 +1600,8 @@ static void cs47l35_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l35->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L35_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l35->core.adsp[i], component);
-- 
2.43.0

