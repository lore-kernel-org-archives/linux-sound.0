Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F583D349A
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454458; cv=none; b=IhzO8lX9knXCsGFZS3FGfQWwg11iTjr8mozvU8krPnr1feHrEnm/PGfz9R9xjm8C0mtSqjwwtcloLfYblQrz+k6klfMrPvDhlhhsFd9hMYg4pO4IUm+K/X7KUSWbwbbsoD0qtoQouiQqjmf4cuHelEVIoF69y2MnLx7GtPL8m3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454458; c=relaxed/simple;
	bh=XBo9TFWfRkkBDWeIBbEHSqFNAD+gQAnKPasD7gZlVgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K4uarTYGhK+5qHo51qqQmYJWCJPlK5mEXH92i3imZeH2x4q4DFqKH+/1p7Y67mFNp52OKVoDgJbJ2GXK2vkQOgKbShgazsxunhMVVV6HYOLhc6FDTToLZYBDruJ+LMzL4vDwiJSX199tY3CkxO7zXqssBXAMK77svxvcvlZ+WoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCAUBlXU; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCAUBlXU"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-37dedd62b90so375557a91.1
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454455; x=1783059255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CvHhZDuh9KEqGXTaRtE+YpkRyUyzW6BE6haBhiMpzo=;
        b=gCAUBlXUcbP+SnETHvcgrXvs0+wZqd35G0nk3bJwahozl7Ir8t27xCmJblJeMq2ukw
         QKlCJSRwlg9/SJprxuJwRAgnkR6RS7KvU0f5qdytB92I4t6U1qgU7QzMj/RnDaksQHpg
         /y95vdATMz9bXr40p6LOZFDuue7F7Un277V7Y7PHYTrMfLgqUVPCz19l58y9hXgB7Qbh
         C3nM1HQT8thEZ9HnpkmOobtBxRHroKDtYV6WBE/uKIxGT2Jz3p977cU38BS07SkxPml+
         AA6boO8wZjoGSAs8HTLP2O8TNQZTa9otMfX637gAjGDZIBJ9CE3UFA+Rg8NSSKVWuKhi
         N4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454455; x=1783059255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CvHhZDuh9KEqGXTaRtE+YpkRyUyzW6BE6haBhiMpzo=;
        b=Fj52UveueNCwj4dL4CpOcFWxoALmiLqEKruNuDCopBDQB7Fo/UOH6MLtSsjn7Fqqa4
         V0CM0xmLYi4EnTZ8usX7yXyTepidnLN+PuxIxlXBD0kKPLMx9Psvkp46DSjzozQFqGwh
         fv14q8DVQ7S8IpwX21rCcGVmIycFmGaRMzBOSdmvEKgYt3CaXCXMV8sa7Gsm4BHpskw5
         5o4G1i6xjjcra6Nwf5TWLuOy6Gh40M7JuE0KcAtPug3IM2zHMrWXjVwc13kI+xZUlcAN
         SaNzy/wWiv+DVySLx/Nzu1i2DNqPuwYgYNRgASB+Ht/0BM1sk6N4NFdsJepyTCMDzCcW
         hE3g==
X-Forwarded-Encrypted: i=1; AHgh+RpbAWomJyTrNLBJie79kOP8DQ7s4J08kAAXeWyvXhyx6IqEUeQ1VHOiFshHLlKcML7fm346DFkKuhSkFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBMUgCuvDIOY6KmGF4qZW8VAlsO0Tmo1+NKFffEjqxgIsXsQ52
	oNmp/RgwpuB6/xhgkN+Tbcd+tQmPC/wlp2bHeXqwTW9lfQWuk5fu/H6H
X-Gm-Gg: AfdE7cld16drsvlO/4p+RcpaUG26hWnjjFhYfvnHy3vDooIjgH3I6oLBgYOuVzXtHJp
	knrYopgFg8x/I6wL9G/anfB+EUJ1U2aZRRxcYxE0K4c58BA6LeSfdf5uKeB94ZulBLvGPuSS1H6
	O9CbAlSLYp/A7HeZSFqaHNh/FKEKWH6jFlQdxDPU159ObUFwXBXHBKzeB/2PP+jRywiGojqDKi4
	FNkYOE0avvDfqMdfvh8DPrtaWoqcR0m9O7L0gUGCwCboQXAj7zR+aQO+pDoYUIAuup+TBbArAta
	YzjIF1NW9cVvDM8Q0XLYfBUt/mUvNzIVXZDVcgEnhEfWsV2R04NAsJV0/I3ZuPwpAr2y9EU8W62
	lzfVWEDAUOw0ya/koy26wiyOwfWxLEK5e3AJI40i4wDEyBy/J2KeK3fFKVrY2Bo/8P9sFPFgrxn
	kO2199c6v14pXx9QCAD79z96DK0CVRZUnpIbgSInMrUke179w=
X-Received: by 2002:a17:90b:2f87:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-37df9163af0mr4081576a91.12.1782454455461;
        Thu, 25 Jun 2026 23:14:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:14:15 -0700 (PDT)
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
Subject: [PATCH 05/24] ASoC: codecs: aw87390: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:10 +0700
Message-ID: <20260626061329.23264-6-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw87390.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 020213e0ca4b..8150670fde2d 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
 #include <linux/regmap.h>
@@ -225,11 +226,10 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 	ret = aw87390_dev_set_profile_index(aw87390->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change\n");
-		mutex_unlock(&aw87390->lock);
 		return 0;
 	}
 
@@ -238,8 +238,6 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 		aw87390_power_on(aw87390->aw_pa);
 	}
 
-	mutex_unlock(&aw87390->lock);
-
 	return 1;
 }
 
@@ -280,14 +278,12 @@ static int aw87390_request_firmware_file(struct aw87390 *aw87390)
 		return ret;
 	}
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 
 	ret = aw88395_dev_cfg_load(aw87390->aw_pa, aw87390->aw_cfg);
 	if (ret)
 		dev_err(aw87390->aw_pa->dev, "aw_dev acf parse failed\n");
 
-	mutex_unlock(&aw87390->lock);
-
 	return ret;
 }
 
-- 
2.43.0

