Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F6F12BF25
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 15:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723042968; cv=none; b=Jb1072F7iSxjBO+UF0huNaabz6HdJWaUPC+/jX3gWU/W8N5qowOB7TIQvYaliaanDUbhDy/fFeI2PSDqkJn3gWyx8bWBZjo2th5GWWTDXpwWtYL1ur5yUIiFudzgRgtgRXNMz5G5mN3uiCbP9RtFcYFolmaz5fRI5Ec/I7Ht55A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723042968; c=relaxed/simple;
	bh=gD60QMy/QwxxGBLOYwPLMsMir9my6tspif2L4UDaxCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KzuU3vUOvelxoz5fsmIEqABUiZi/GwBoJLYS0JeucqBqx/+Bn8r1rwDD1pzzJjZOdP3herFyuwCKdP3saRch+WGIsrlPm++gslM5TNoiIf01bxMEd+jy1UnHYq3+G6gs/Tu8PLS0qs0xzisbMN3k+fK4jQWTjMRLxfOUQpyz9Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V3FwzrXB; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V3FwzrXB"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5b7b6a30454so2721987a12.2
        for <linux-sound@vger.kernel.org>; Wed, 07 Aug 2024 08:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723042964; x=1723647764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zb7lA4qnI7KpE11eMK8Td9pIdoQNK6RGZ1WWHf+hwpk=;
        b=V3FwzrXBnjaiasK9Ob9h2GAQIct1cF/wb9N4tT0DeGsDybdEV34fB8CoGqEpP5ObiU
         i1Ft0lqxmzLTQuRBX+Ar6e1EP8QfGCY6eJR9oY6iUrJQ5C+enREUTU201gzIYSyO5pDz
         X6pSM2sVi/D2Nbt2KYy429MgV3lAP3eRQB5D13Dzdt/Dgf4ccqX0nAqbwvuqT7yMB27P
         JQjWsOM9AVhzdrCmc8V6iGLhTnLlWbnUkKCRARvX59FeP5HfLPQCCbac30kPTfxfvIwU
         qs5U/YvY7qWfkNHeMsbAJEhfKwvxDtbHYutR/17C1Jx4UDTxbHAobMk9PhBpexiddh5G
         nKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723042964; x=1723647764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zb7lA4qnI7KpE11eMK8Td9pIdoQNK6RGZ1WWHf+hwpk=;
        b=AYdNGxqkiH1ozD42p8acyQ2Rp6/W9357aXfnR0w9czGUTGg4itvqrywjaxY5jXCve4
         6mx06RQOO84EZHycOzW83J5jMck3Eapguvygdbvfr1+f62YBe6ol9uqViTJPWn300jZs
         ZvTjg29VaHC849Ao6Yuag/GXhNTLYYHRvCFNEv8uo82QpQx/sEWN3EgUc9W6c+q4gCeS
         byJRqfklwl49kJ1DpXxh97PhYLTmr6zKISJuJKexr2Afz5ivnTQTCD0fIX9JzSQTynLD
         i4xVOSQm62bOPh9KtDkEGGEdOw+vr/oHDilD7RoTJUmt8BGe+TX6wsG6Xi9sWBlZCjjx
         juFQ==
X-Gm-Message-State: AOJu0YxHQHqHXa15gEp1uDezWTTBKUK4OkHPzmnAhNasdgUTyWg54X1j
	ob8j/4ZTGN0oIIAZ4SFsv10etl7KCUZKpYvZZLy1fSsMxJf6/ly8UcbC52byDLM=
X-Google-Smtp-Source: AGHT+IEBb/2tO0u0sDAp3dDW7mXSiJkZfOd7Vz4ANN2+MBZgge3MX1YpJhT2vVz4APXcj0lgtag8Kw==
X-Received: by 2002:a05:6402:1a3c:b0:5a2:1f7b:dffa with SMTP id 4fb4d7f45d1cf-5b7f350462fmr13646143a12.3.1723042963968;
        Wed, 07 Aug 2024 08:02:43 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bb90be3a91sm2583047a12.65.2024.08.07.08.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:02:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 07 Aug 2024 17:02:34 +0200
Subject: [PATCH v2 3/3] ASoC: tas*: Drop unused GPIO includes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-asoc-tas-gpios-v2-3-bd0f2705d58b@linaro.org>
References: <20240807-asoc-tas-gpios-v2-0-bd0f2705d58b@linaro.org>
In-Reply-To: <20240807-asoc-tas-gpios-v2-0-bd0f2705d58b@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shenghao Ding <13916275206@139.com>, alsa-devel@alsa-project.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

These drivers all use <linux/gpio/consumer.h> and has no business
including the legacy headers <linux/gpio.h> or <linux/of_gpio.h>.
Drop the surplus includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/tas2552.c | 1 -
 sound/soc/codecs/tas2764.c | 1 -
 sound/soc/codecs/tas2770.c | 1 -
 sound/soc/codecs/tas2780.c | 1 -
 4 files changed, 4 deletions(-)

diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index 9e68afc09897..684d52ec6600 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -12,7 +12,6 @@
 #include <linux/errno.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 5eaddf07aadc..d482cd194c08 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -10,7 +10,6 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 5601fba17c96..9f93b230652a 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -14,7 +14,6 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/firmware.h>
diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
index 6902bfef185b..a1963415c931 100644
--- a/sound/soc/codecs/tas2780.c
+++ b/sound/soc/codecs/tas2780.c
@@ -7,7 +7,6 @@
 #include <linux/err.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regmap.h>
 #include <linux/of.h>

-- 
2.45.2

