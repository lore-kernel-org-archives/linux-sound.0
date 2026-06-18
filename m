Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975C43EBF02
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780943; cv=none; b=pTVBqBYr6NocaZIhmoXecNOUhym/hyEr0NwZFvN5wsMcHYYdFZCISlhGxy8GtcCa/AzFYtreUDTFPz2BKzob/q6143e7PWJo9xk/R4CpOmzSqsqtbIqhgOZnyD/vVDC4J35wcqYP7NKGC9UnXyqgDwRlDSmPFGOX+xR6mmUenmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780943; c=relaxed/simple;
	bh=3k5ocHDAte/5Y9dBudXlQ2zklcKkxOUMN9JvPLnupMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SF5+wtTEAWNfQ0g5y7eFET6lzaWy9pNnzZb6JsO6MqG/f7Xzs749dAAHtcufMp+ASdTATiwCfIlFLk+w3Sx8lhq9KolHWGd1c590WyivAYhcXP+SdkyK4dXj1/F62BVfQxz35TlGl+AzSVoAe+UKUD6v3hwYaS6v9H7YHbJ0vLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFY0cApE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFY0cApE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c6bdb8a8bdso5158235ad.1
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780942; x=1782385742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgwBmSSCggFVLUhXUYpfKHZun58CwgxvexKdy5tq5OA=;
        b=UFY0cApEvc0Gu4CfbSBeLzMwDUPNdhSzOxXgnPi02GrbjLHBk93pdIRszSs7XZrN3L
         DIaZYxTXZxtSuq4AYgBXOMg/wkb50B39F5FyKRNsdjdrrmxE3GhcIvp+dottfuGRU38O
         A+mLLIyyz+uDrde4Cxm/Hiu0gmTVixyqYY52Mm5xoCVH18uH8Jh/Y/pbcCt0hM/uH1p/
         iIVlPrfdloyfwGOkPt1PjrCkci7H4ZvwYEoHivv+kQqAGuJaXGrxDPfgtBxL+k2oklg/
         nvI9zVZjg4noxx/G/03zjmaRlTxDOYsKLwGilC/F3qbtDxC7jdOBvH2PXi2ITejWdLZP
         FVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780942; x=1782385742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qgwBmSSCggFVLUhXUYpfKHZun58CwgxvexKdy5tq5OA=;
        b=Sir44Xu0UZsspDYaZohQOUmBTLX2ZRdw7xkIg9+hN/jntzOsN5meJZqBMAh4cwW+YN
         PA91xqDrIW44N06t84RDmR+g/7vuALlxBxUd3F6zM5r+z5RCAqZ1ddzVSxq3EH7qXMXY
         hKYSS7YZIHIsAFpQU3C/hwTo2QC0fJFi/ibWdxNDfthVWJoxe24rhmJF46fzYBl04wam
         O7FQj0RtzXFUUTKI7oQ1ZVH6JT4MaEFgFPuG0Gmcq1Cif4JiLJfgM+GC6ZtcId9FeYLa
         9pCIBYQb+4LSd4x2mmz9MGBxxsfaqI5XxpDyH4u/qCyD4vAXGUUcQbZg5S5Tndm+I921
         zYNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Z33/mdAFS+y0QMkMDbU+9ixVLC2eesp625xYDB8Zm0LKrML9/tOlyQM3lEYSMoL6qAat/gHiwY0fuLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YycqBeo+LTIeXyC4fMfWOEsfMo+EOJLzdMWaZH+h6yh6iKTp0lB
	OVFblXY7qf/qBK08FG0WaYg2QwyTGEkpmhlcMo0zrmCFEBC2XSZjfc0Z
X-Gm-Gg: AfdE7ckGRl+FASkPTXEt8AhuB4+X40a9+gkxRGwSe39NYY8tNNwmLKvmyhZqJQJ+HhG
	UOfOpCCdZu/3Fp+t2VBzUp+bVxvmwBGk4ujnTqw7o9wkS+B1nuBC1ypfRC3kIck9QsYHjBqyZ26
	8De4giAiIF9VjG9gFUeaSckdEQ771QCY+bIzla7Q2NYHu7VT36FbA8zLU/oDDkbyDcOzvLw1En7
	uxH8aM4x9G5GeNCu6TBS87YP/QXpmTgS+Yh41IFjyyPu3hbkEomUbg+s0Fg0bYGpysubOJ06uB0
	upPHpLQYTTHEu8xNjTSDVxhEKxAPla92NeId46acT5F1u2oC7kB4QxNI0oFUK9WvEcYKI62g1Bf
	SG2U//A2159s2QsXUjevoBe79F+LFydG1BMVN5Lu9HdLNq3hRvc0hMvoRK6VMVnyM1mBmjfbFdp
	OgJmpSBNqeDZsr/xAJG8U7SWrOJcRpcz9hRYmi98S5KITuIXg=
X-Received: by 2002:a17:903:2a83:b0:2c6:ab74:985e with SMTP id d9443c01a7336-2c6bc24997bmr85186495ad.25.1781780942104;
        Thu, 18 Jun 2026 04:09:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 58/78] ASoC: codecs: tas675x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:07 +0700
Message-ID: <20260618110827.232983-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tas675x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tas675x.c b/sound/soc/codecs/tas675x.c
index 6f89a422f3c6..c44bf9144e44 100644
--- a/sound/soc/codecs/tas675x.c
+++ b/sound/soc/codecs/tas675x.c
@@ -162,7 +162,7 @@ static int tas675x_dsp_mem_write(struct tas675x_priv *tas, u8 page, u8 reg, u32
 	 * DSP regs in a different book, therefore block
 	 * regmap access before completion.
 	 */
-	mutex_lock(&tas->io_lock);
+	guard(mutex)(&tas->io_lock);
 
 	ret = __tas675x_select_book(tas, TAS675X_BOOK_DSP);
 	if (ret)
@@ -176,7 +176,6 @@ static int tas675x_dsp_mem_write(struct tas675x_priv *tas, u8 page, u8 reg, u32
 
 out:
 	__tas675x_select_book(tas, TAS675X_BOOK_DEFAULT);
-	mutex_unlock(&tas->io_lock);
 
 	return ret;
 }
@@ -191,7 +190,7 @@ static int tas675x_dsp_mem_read(struct tas675x_priv *tas, u8 page, u8 reg, u32 *
 	 * DSP regs in a different book, therefore block
 	 * regmap access before completion.
 	 */
-	mutex_lock(&tas->io_lock);
+	guard(mutex)(&tas->io_lock);
 
 	ret = __tas675x_select_book(tas, TAS675X_BOOK_DSP);
 	if (ret)
@@ -211,7 +210,6 @@ static int tas675x_dsp_mem_read(struct tas675x_priv *tas, u8 page, u8 reg, u32 *
 
 out:
 	__tas675x_select_book(tas, TAS675X_BOOK_DEFAULT);
-	mutex_unlock(&tas->io_lock);
 
 	return ret;
 }
-- 
2.43.0

