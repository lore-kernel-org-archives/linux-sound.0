Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581DA3D649D
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454592; cv=none; b=jMiAOCnwGFSG9qV/YPzaMISNfOTOkzoVhjiLjAhuYiutRqLHrGdiEWE9dVN0//IoDvGRxNRxuZKICugICtXnVtVNBWRpBTAPo+MC20E3+zagT8oECiJu7LFbvLcjFfbkBltrkCnN8khGzaBo8k3vR6/r+y+j/SRvXtS70/guz4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454592; c=relaxed/simple;
	bh=maiamEYW/VmulEyBtMYwj0uqdV8jgFn/WOixNWVxsn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fymhb6M1R+w5D5lV9+dr9cQUQR5UGQYBVsebidnKvIA4AugWDsJPi11KV8zae9KXgwhIfSbjiNcNF3XbSHXtzxK2a6roSfKWQxdzzJcLobEpKNz5wZyfnFaYl7796aXSEBmI/XAJ2u8mNbwp73+G4MyHIK5ZNNPHGnSt4vRk1xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5jn5651; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5jn5651"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36b9d265355so293567a91.2
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454591; x=1783059391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SX8XmTSnrku861xf5UWM+H3QucQPdKfApxb7WoywOqQ=;
        b=A5jn5651V18eYOgCuHY1GpRIFVeOCLjOmAqmvQU/xH4U4C+wEad316BCyVG2eqYiL1
         ydCO5gZsyP5HrrF2q48OwQxfvu++6EZQYWnpwbljROrVgPAKsI5bRd5uDiA4gtf0m1o/
         0o2Xqo0yhomI7cVnVYTF03B+/a9RjfMHrnQmr7c8z9Rj4FOJhHTBut28DPER9VWXZiJ3
         vtiF3QFCS15zVORiryQbxXMEnepmAp1bQi6wqcUgBsA1AvCzA5bK1yv6zCrs/BEVoatV
         1zo5rZ8EBP3XfOvVihPhTA/r/PWexsfXdej1fLIxCUlpbzEe0mkMoYkeXROVQuwPI02Y
         3c/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454591; x=1783059391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SX8XmTSnrku861xf5UWM+H3QucQPdKfApxb7WoywOqQ=;
        b=GYiiOkldSuSm5Y8Bx7X0Nh21mbniwkSyDn+k2YIMz05Lda8p1abOqclzvN7PpOF6wu
         5PZKqk2ihDkCfVVQjzGlV4l+NAQw4Uj1MKgNluMXmHN5SwbOiioPkAdgXPPjLuYYWiDo
         ViJd59Dnk3G8OLzBcTpu9VnlcdnTe++KVzpmh5fho7tEQLXH+bqFG3faZQjsnBpB/oXs
         NGjkuAsql5Y3/4cPS1NEI0KmOF63S+tgC6U0jSe8QSJ9kf7xynzRDeYWq8OTEWfZyRYA
         UTNwCr8V3rK5aJNklW1NHxRwI2SAQgbmO8AyyK1Uglr2Mrf+GiLOhU7Qv1YpNwCadp6X
         qRNA==
X-Forwarded-Encrypted: i=1; AHgh+RowoBKSZKLdHZT0jbmRUF8jSDeNxOJUFOeZuChonWFTVhHVPLSKDwcnq8BGSgZBxQL2MhGMU4/oFSUk+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM9s/9KXQilZXt2ymPP29vp8y9s6lvnzobq7YurpzRiwrP/IMq
	MCP4RUGRBRJMLXEtMRoW6k58KMiC4apW+crwe0l4UvES1gQQJMxm7YfH
X-Gm-Gg: AfdE7ckeXKCJM42kD2lGe9TDbc4CHXL15bRaPYzoaY0VO1fWKvOaCd97rK/Ym0YLJOP
	lB1EMjTYlL7ucUUtopxZb2+nFE4itAqX/K6Ck8QwIgaz3jdUMSXkNSST4U4JL5fVbtH+P7bvFo/
	vs/C7dAGHhjCM2nvOpxRcihBxN3MLAC+HKZyIm+PkSAnIKYkuXpExEC8CzY0SIvI9+rBtBOtI35
	BiVbbgq0mIHHrbzGouPVYThfpYWTsvmLBp9KO6XkJ+wWK1IVtW64jYGzkO64bcUjbPvQsWiuI0f
	5XPvm8xJBQ+0Rk/bllfxS4zaq0ZgpSytxY32WTFyBNivsyyCjwMiDtnuOfBDXMRHF0DnueFWaQz
	3N/6cCj7gXRoilwmYpg9uExt3QKyr8EQPiLq0LutZzmIb9j13nUn5d5jAo3V0/Gu5FARXzhJ02X
	YKivVQHoAaWox9grmvQRRSHhnGcizYLBWcvG97WS0zp0NarDY=
X-Received: by 2002:a17:90a:d444:b0:37e:2a6:8cbb with SMTP id 98e67ed59e1d1-37e02a68d34mr3887125a91.19.1782454590646;
        Thu, 25 Jun 2026 23:16:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:30 -0700 (PDT)
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
Subject: [PATCH 24/24] ASoC: codecs: cs2072x: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:29 +0700
Message-ID: <20260626061329.23264-25-phucduc.bui@gmail.com>
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

