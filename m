Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB04381AE3
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 12:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662059; cv=none; b=KNswcVHTNAmZzFske8TtOAZKM2Moal25o+6YfsbF1Q9rzQs95jKuakPv4+/iQ2a95rjUvenZm+9yo2w7Khbf1BzICfrcVBdT68hhy0e3hKJbYgySYWhItt3KGtKmFhpknnYn9jl88tiBI23MwOPu/bhUsQoTL4ZSGu7DldqzQWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662059; c=relaxed/simple;
	bh=ceY3n9dzbLrF6UzskKUXhtBxJklxdTRM4gCgSQyi9G0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cYWnhNrjunH8TnJ9vvlTo7+GiDPMVzVEY7mH/a5rqtCoG3KQlbtXbUTXFz1LjzoVrBWjOnQVjoePtjOFS3CWpJTVz/qgDU1W90u9yYxRFBRDgLdO6N+LLSL8t7AnkLfQo2ZyRArKJ44mRbAlpI4Ra0fRLn0++gCubjQmO6yVPyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXMcPuMo; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXMcPuMo"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c85a297d2d2so1133654a12.0
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 05:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662058; x=1781266858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRIkhCmMLekSBDwmbxb2dx0SojXZ81/d3iroLxefd9A=;
        b=iXMcPuMoXYl5EXmyoVRDxdb1Ar7YmqbkVx7ARA4mwLoLiDoF/DZSoMlNn/Maww8iZK
         J4JSlZzX8fo7GafYlV2SNshAFOZ435f22S8Iv61cLLyENFweXITtCAJF7Zc/hjQR+yvk
         M/IBGxAiiQnxdDPWkjDMSKxPtyl2SwjAT5TuUHvsmN+BEZqoFwHmaLb4X5j5BdfzOKj7
         E1OhX6Fno+aRz5Udix5HRL5aV8kk9zENN1f6xBV1lKCj5mJf3OhWin3AGwleYxi1xSdy
         khF/aGVvCSEO/bu7+u7Yhquz7Nt7tDJfls7BQulHiI7XioRCMJ9LpUWrxZI7I8YfT/Pt
         BHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662058; x=1781266858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uRIkhCmMLekSBDwmbxb2dx0SojXZ81/d3iroLxefd9A=;
        b=oYrZk0NXQnyA7x2d9aZhz4eAOYG51t/EdKgvC7Lezuzs6ckrvR6Wncavn3Gs1GnsB0
         i/dKaPqH0YECyy5dXgyDqmV1Vw+lYe1TbZ+aHcxfWQIhr32zeqzyIXLoUoG6eyj2/JL4
         jMmpsi2x6ddfdoTNzSdOQqbYtGBvcjDimuNc8M9Z7JBICp2OCU0nLg0ibdDocgk8WziN
         7DhvZRVMRvvZHtt51EazTawB9DWnx9vBqCur+dH8+NTse0eCdVbvaY0opp3+mB8qDq07
         Q5K8R03XZxjCwWe6yPBJ87zXOXdBIQ0IvYI7J+mK5R+O4hbdB5V644QW8y5du9ShdqE5
         2+nA==
X-Forwarded-Encrypted: i=1; AFNElJ9/e+NwMgZ9teVU347wPJrxEQTV6eTjXsp6jl/EnYPu97e/IhBrgLAWpMaBI9FoinfFnHfFr4/TS5SeyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqn29ttO24M2G4F1gSdiigEn4U9EiC5VioW5sr4MrIqMaUBg70
	VMrdEtzlnXiWrQm1/2Y34RcnmjxT7aQHYS86g85KHK6NDJbXtz7/chYuKgDOZw==
X-Gm-Gg: Acq92OF04tTUehVENedxlh/ZWJ/84tlbk20oxjci0Z9FnT3PugGaZoApbiepS+Mzo74
	iHUmgTT+61moEQW+mlYKEtuY6PC4IhUGm10TdI3smbO2OdbSFRjBN3pQ32qiHF29+Lm3rAI9qtR
	IMZl+0aIWymA3dO1Y1H0j/RlAhhEaJSsLnzqwKEiXTPSaAi844QlIclcYNMJwkI/oWCjDU3ZScB
	9OhVxVPv5pkd3Ak8y5GKDdQK8KAl3YocFIi9ZgbTM7yJkCt3wYkBuzFrPFfLUlfOjztdYf8oWug
	Y0JMS8IXmYocMVnDpz7iv+kXp09/U1lYxTKVU9G19AMJF4UEIqWyKC+t07UAy9cL0l5OVCExcUN
	xwlqEtUszlAwKtbfXUgCkJg3a60qkgJbRqgGlCQWbyfUNPFv4CJRdIX4ORUtg9PXDt6JewBEyZP
	JwCw4acqJ6ZP14tQhpBPon7+i8swFmFS32btEB/CuCMdzdPyy7BpB/lBeGjasR6eULuVeZ
X-Received: by 2002:a05:6a00:1d8e:b0:842:6099:c55c with SMTP id d2e1a72fcca58-842b0d82a44mr3266499b3a.3.1780662057726;
        Fri, 05 Jun 2026 05:20:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:57 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 09/10] ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
Date: Fri,  5 Jun 2026 19:19:53 +0700
Message-ID: <20260605121955.105661-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add fsi_clk_prepare() and fsi_clk_unprepare() helpers and call them
from fsi_dai_startup() and fsi_dai_shutdown().
This ensures clk_prepare() and clk_unprepare() are executed from
sleepable contexts and keeps clocks prepared only while audio streams
are active.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - Move clock->count early return check to the beginning of 
   fsi_clk_[un]prepare() to simplify the code.

 sound/soc/renesas/fsi.c | 77 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 3f303e15e835..6537321242c0 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -294,6 +294,7 @@ struct fsi_master {
 	struct fsi_priv fsib;
 	struct clk *clk_spu;
 	const struct fsi_core *core;
+	int spu_count;
 	spinlock_t lock;
 };
 
@@ -730,6 +731,78 @@ static int fsi_clk_is_valid(struct fsi_priv *fsi)
 		fsi->clock.rate;
 }
 
+static int fsi_clk_prepare(struct fsi_priv *fsi)
+{
+	struct fsi_clk *clock = &fsi->clock;
+	struct clk *spu = fsi->master->clk_spu;
+	struct clk *xck = clock->xck;
+	struct clk *ick = clock->ick;
+	struct clk *div = clock->div;
+	int ret;
+
+	if (clock->count != 0)
+		return 0;
+
+	if (!IS_ERR_OR_NULL(spu) && fsi->master->spu_count == 0) {
+		ret = clk_prepare(spu);
+		if (ret)
+			return ret;
+	}
+
+	if (!IS_ERR_OR_NULL(xck)) {
+		ret = clk_prepare(xck);
+		if (ret)
+			goto err_spu;
+	}
+
+	if (!IS_ERR_OR_NULL(ick)) {
+		ret = clk_prepare(ick);
+		if (ret)
+			goto err_xck;
+	}
+
+	if (!IS_ERR_OR_NULL(div)) {
+		ret = clk_prepare(div);
+		if (ret)
+			goto err_ick;
+	}
+
+	return 0;
+
+err_ick:
+	clk_unprepare(ick);
+err_xck:
+	clk_unprepare(xck);
+err_spu:
+	clk_unprepare(spu);
+
+	return ret;
+}
+
+static void fsi_clk_unprepare(struct fsi_priv *fsi)
+{
+	struct fsi_clk *clock = &fsi->clock;
+	struct clk *spu = fsi->master->clk_spu;
+	struct clk *xck = clock->xck;
+	struct clk *ick = clock->ick;
+	struct clk *div = clock->div;
+
+	if (clock->count != 0)
+		return;
+
+	if (!IS_ERR_OR_NULL(div))
+		clk_unprepare(div);
+
+	if (!IS_ERR_OR_NULL(ick))
+		clk_unprepare(ick);
+
+	if (!IS_ERR_OR_NULL(xck))
+		clk_unprepare(xck);
+
+	if (!IS_ERR_OR_NULL(spu) && fsi->master->spu_count == 0)
+		clk_unprepare(spu);
+}
+
 static int fsi_clk_enable(struct device *dev,
 			  struct fsi_priv *fsi)
 {
@@ -1580,7 +1653,7 @@ static int fsi_dai_startup(struct snd_pcm_substream *substream,
 
 	fsi_clk_invalid(fsi);
 
-	return 0;
+	return fsi_clk_prepare(fsi);
 }
 
 static void fsi_dai_shutdown(struct snd_pcm_substream *substream,
@@ -1588,6 +1661,7 @@ static void fsi_dai_shutdown(struct snd_pcm_substream *substream,
 {
 	struct fsi_priv *fsi = fsi_get_priv(substream);
 
+	fsi_clk_unprepare(fsi);
 	fsi_clk_invalid(fsi);
 }
 
@@ -1975,6 +2049,7 @@ static int fsi_probe(struct platform_device *pdev)
 
 	/* master setting */
 	master->core		= core;
+	master->spu_count	= 0;
 	spin_lock_init(&master->lock);
 
 	/* FSI A setting */
-- 
2.43.0

