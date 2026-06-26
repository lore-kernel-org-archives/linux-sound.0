Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9043D47D3
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454551; cv=none; b=cbr2YscfzRBr26zT76CFkKkIavgL6NIhhHzhB7Ax2MgkFJaTZ2k5YXATqfZLe8pFR8pTLVaCInRr0mEha8cG0s6VgSOMBLy0N1+Th8cDRToBBXnttwb0CErt4cshM4vNloHXCjxv06oIn6CNA0Wvg/slaYGvaYqEBYz7p1HKqNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454551; c=relaxed/simple;
	bh=N1C18VQ6R1+hqjD0MH354ULBt2PbTMy9FMT2BU1d2WY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lv0BulmKRch6ohaDBZlQwC/L7UoTnvko/5ytwoWcJ1BZLoibrgxc94iUz9c9TIQ1nBjpebfaFSGP1SaDt3hQmAqQz1dF0yzp1gqKFcP9aP544qGSt+XBdjkddywAQNX8X3Wi9F8wkASbtlRsLQqcOxra694J+8ex4vb3Xm84Ih8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAnMSo2+; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAnMSo2+"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37e11438c66so175124a91.3
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454550; x=1783059350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3eXIkGzz4V44GsXFfq9IipILWhP60rb5QQ2DRgZ+QY=;
        b=FAnMSo2+Du2SwbVseJInhFjjlv1qiPi7X/pp0k8LgvdIViupshXzoQtyuUd7p44umE
         IebBkItCrPWBzyhIqAYDp+qjRI76OuDYWmfe8Z+zpmGSP4uIKpxNr3Vk8FAIKlDqpCbs
         ScQBqwTgdl5QCEX2d8PHA/r/UT4DWFJnAS/8JaMe8LLkLyTzH6566Ug4Ex+1vmUpRn5Q
         MfwIKciWUf0Mf78cXeCZQv1TUPSAZs824ji18WQPuNp1jTcqZxCmrzy9AY7DK7eheyF9
         9knWSEWdblUePaFbgkS2W9U3WsyOnTAwG3xOjmnSF7SNjO30N6X4Ng9LofO2aQqSuG9I
         s0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454550; x=1783059350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M3eXIkGzz4V44GsXFfq9IipILWhP60rb5QQ2DRgZ+QY=;
        b=qBrGEKIvB/7f6sY2rfcMPYrfBGKs3Pe8avgQXK/SdK1rsagcC7PmGsaM+NZOeOCu1k
         ODZwkkfaOvJmUiOq/GxsRc2XWZtAy4yarjf1cQXEPcDCHbT7lflpqe8UPlabpOTcNAQV
         8liQjCxuFCPevjl2KJPSJh39yJt9OI+N7LjlU/aD/CBUomzxe/1T3E8dt2A60aNKe45Y
         yaTv3Xcvjo1wy2imSVkhB6C6z8/pRsTE5A7ki40GNwH4drm7WdOTmnjWpYyFsTIXZJuS
         GBh4DHT9eIMuHyAf/WzV+r5V+f3ylwcJkmokUe9OiT9YgXPA4j1lpdZ9e3ykW6sfiSVS
         tMYg==
X-Forwarded-Encrypted: i=1; AHgh+RqQBAFd0Ambo1NT/TxfnH01JC63g/Pu+FN5os5AyDB2Ad19Fw4jBI+Yd9983cUe2NcntwBHmzOHY0NfXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhpXczB1LktQNwuVshrfLokTLI/4HRRMAHO0bwudE/XCdky8gc
	B8ABKVjyg3S9Ze/KAqdzTjss0bNPu18YuuGw01GN8QfTtU9P2l4Kj3ep
X-Gm-Gg: AfdE7cnxd5tT/2PlHz3WV93uGqZ65Wn9FNEOImIVfiPnQ+S7tZQJmvyozGSShTVVTFK
	gp7VKwkg36G3LhwsQv9220C7bkXXREXejZSlhzxc4BokKx8B8hVIcHtTGIF20tng23BKPJuvfdv
	tJ0Yo/VMKTQTD1ItibNfQCmOvyIcfpTcapdUOpSlTTt1jxAUILUMnK172ApDcp5r2SSDtDWm5gj
	9wVl7zNe0lITHqW3nqhRXxb6HX02Pucu69cXlSFG4j5fVtmjfnKCiLn5zYxmddtmvm72slLvxSI
	IJwzZ6Fh+VwjCdL0ntUXOHiNyO4/WCyj1gSoE/AaIukOxL++nZCVhVmRVoFS0f199YlClcU2hsi
	bPqFsIrq52Ywhmw3Tmzj/ynhxt/pmqo53Zfn0zIL28KBo51yJx4HBeYNSpddbEiXQEQ4x58YP23
	iNA7gvXhr6cz1FBs0MesznyZuRztHnTG783RAivwm1Cn5V8SQ=
X-Received: by 2002:a17:90a:d888:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-37dfa1d5614mr5298175a91.16.1782454549650;
        Thu, 25 Jun 2026 23:15:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:15:49 -0700 (PDT)
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
Subject: [PATCH 16/24] ASoC: codecs: cs42l84: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:21 +0700
Message-ID: <20260626061329.23264-17-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs42l84.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index f2a58163de0e..36533a13319d 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -281,10 +282,9 @@ static int cs42l84_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l84_private *cs42l84 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	cs42l84->jack = jk;
 	snd_soc_jack_report(jk, cs42l84->hs_type, SND_JACK_HEADSET);
-	mutex_unlock(&cs42l84->irq_lock);
 
 	return 0;
 }
@@ -831,7 +831,7 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 	u8 current_ring_state;
 	int i;
 
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	/* Read sticky registers to clear interrupt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
 		regmap_read(cs42l84->regmap, irq_params_table[i].status_addr,
@@ -902,8 +902,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 				break;
 			}
 
-			mutex_unlock(&cs42l84->irq_lock);
-
 			return IRQ_HANDLED;
 		}
 
@@ -919,8 +917,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 		}
 	}
 
-	mutex_unlock(&cs42l84->irq_lock);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.43.0

