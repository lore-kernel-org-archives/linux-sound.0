Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D823D5235
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454562; cv=none; b=mBKncuqTFLroX7ulIWTo6u2zlODx131f7YsXQwwSkt5YEIIjIPqpcgn3NO9OCQeE1FQMluYoGGzMn6rykOUwRt9BZPntYfTGhZTn1EHY5dsiGVtN76KmrnKIU+9YIBrlpdNWnagltkvRFp5hRIDG9ik6+61d81Idxt1w7mFm0mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454562; c=relaxed/simple;
	bh=30u1yCFnqEUYv19yUdILx4u/FILeLQHTLXJbU/H9wec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hx/vVNLj6Mvgo1jDFqpJ3sBnzggoJy7Lmro5uorYZ15t7KEgJQ+jSph54JdUyj6viJb3JJ/9XC/tQH7QsfufvQBLUIIgwyfdOJ0k6WFigR0o+sLreQYON9Wrtsnj3PnOJcGQet8CYIBKRwJ/dfpx3PHM3tIy8YN/MH/8ePoMd6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sd1EDQGQ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sd1EDQGQ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37d7c265ca5so524311a91.2
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454560; x=1783059360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rD+jveY6wp1Qp2f/2vAi8iv6onv3PbIlpebXHAxGHGw=;
        b=sd1EDQGQI5MqCFCUI3BnPWjXEsUcomGQHIFogoAF25Yy9niH1TmNC1mAtHmBwbd3RM
         lCuA5iJ+rlYoqz/rrnw8bqtCWyBXMlz4ZGL63YV/hhKI3NU6KR/fLgxVSb0hw13MmHQ8
         9o/dhfv8su5nIyq4DPO47Wjlw3UvI8nYF0L5ObA1j32SfnsTzlhhgxUbp137YzWQfYhS
         gz/R4QOA3qxrb24IU/59VJO+sjlXTLjvEMdjy0xglw/8ixhw+ewt851/ofPJmP2HdnCe
         c4FJYHgdOwQ2rLbNX8PvFKo+GtvJaM7tPVmeKJa11PRb+l7YI7jJ22yXlBPugFI298bu
         QMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454560; x=1783059360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rD+jveY6wp1Qp2f/2vAi8iv6onv3PbIlpebXHAxGHGw=;
        b=Y0w/vwjsoBzAADhV4zg056RcZesl4/NRzl9fQ+3vphDelVcUowbI36elCizHoGNhzi
         22RZ3UWYhIt+6n5iyOJRzT99vsAdvw21kzwbXVpcGg/UzDxK97aWCFn3+IgmpEkCV0rE
         yX50KVI+5QZozZHFWI1C5b1jAxSPR8tsdWLHEABuD4qHyaX/w7L6RHdoNRSWQy/S6tBk
         9YDuUO5fm46LNe4jzlHuSdT799/b8WHjOjWihPf3jNYyKjoK0G8kuAgFMgm6+xpmPFIx
         djWIsULAegE/RUuxfd60NRJ4K3NGCXw29y927J5Ht5uskWhGUoO+vgZ49ScN3Oc8ynkn
         L/bw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3AD2oYUSgap0/+3fjCePWD0d5ajwgYVDrzg/FVn18OPfDUr5i560tAjDBYp+wuyhRAKCU8RJjm3XLvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx4vPryxVh84RW+bOlIUibGeBNxwqJhlHoFGr1PU8xOcmKYej7
	omX4Ox51+nHV8H2DvHw5gzXkS3RMaqh1ryFMCLtLwlmue7DjVPdRvpdd
X-Gm-Gg: AfdE7cnVcKq6pQy3C3uKvR/z7LY8kHi1Xf9iKbgiOoBE//i5emILj6TZATeUvDnUL77
	ChpOstKQ8fmpwP5FxAjbRX4142KcrCICnUJsO8tkBi0ZSsh3ORfQ9DOrkafcDkJiE1vp3W9m1Da
	UWKgxIif3eVI1a0Eq9gtYF/768pKF8ilwU18rQx6oNEClj6j5Zg9dIIrtS/eb3XXaFpRYBiqL/K
	V4DW2fZce1XZkTrtBfUDg/TXfapilyTKtlqb7RlstcEvWTcZV820cDxVWMdwhm+qabd8DhKtqI/
	C4idDtuKcFibr+kZHsKVHnLUe8TKakvhXe0vLU+sn5h65Ss0Zq+a4S9/4BIaMiX+RtM5pgcN9Ds
	5kNwEUKa70+DYKLO+KBsYHGE7xieF0lBgUwpkjhWxqPmpZs26BY4nmaCmTKLE34fVIF3yGD+wtx
	IWOPYGI3sLCp+/T4e20jGNgWbckVkoTnscde9XRo9J7qlIY7E=
X-Received: by 2002:a17:90b:3c05:b0:36d:df4f:ab2 with SMTP id 98e67ed59e1d1-37dfa250f2dmr5532632a91.13.1782454560385;
        Thu, 25 Jun 2026 23:16:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:00 -0700 (PDT)
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
Subject: [PATCH 18/24] ASoC: codecs: cs47l15: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:23 +0700
Message-ID: <20260626061329.23264-19-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l15.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index da64e0a1db28..2f30dd834709 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1285,9 +1286,8 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1317,9 +1317,8 @@ static void cs47l15_component_remove(struct snd_soc_component *component)
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l15->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l15->core.adsp[0], component);
 }
-- 
2.43.0

