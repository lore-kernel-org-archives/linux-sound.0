Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C84036C59E
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 08:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402662; cv=none; b=KghEpL5rsfkJYbggvggUmXCvGD7mK18quli1YRNtSjWbPmT4xn7HtLWWKH8xJeDDSB579rM7x/DvJq3eN0bEWaB3hNYAjCG/qfiwx9qG/cTrBKOSwlqx1cO842KcwMTz8NaBAZTAt5qd1fibT1cy75CK15+Q7zmzhJauCJWBrkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402662; c=relaxed/simple;
	bh=hAz9cVk/REbCqtvF14qK2qb5B2E/7eVaibiWkjmIo8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+ocEKAPwm/f0p2zVXw5tQBWdUFZCn41dk0o4l5erVfUI+WLGaXyJgCBw/vgS5gjQwXZtrL3peRmGVFrrMSuLYfTgrnLJnDLzi5e0ghmUNPg8Eiv7vQ6dEO5HJYhb6LgIJpDQtUmy4IdI6dNFSR9No//b5ZLO+CZX35RMfJFSpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuqfS2kt; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuqfS2kt"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bc78d56d3aso6870485ad.2
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 01:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402661; x=1779007461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2/zYcrseTTot6/6qcImxSuA8kM1CWD/r6OyNv/RP/c=;
        b=ZuqfS2ktak3H8/wpGlvN/oR9G6PeJSWihXJxKqWvWGVMWTFmxHF7+GItfSk3Uvh9oj
         Xbtphv/I0JYqohufOtIvjd6KXQLIlYkbqWWZgiCZkAnkKnI58uFSlAWXjhkpPjkIDunB
         mHHj13HFY68B1GdNDkvhzA/S7K+gy+iBmQgsMP6MwyYdqpLzpyNP4ycmiCP5L9517Imb
         BJe7TWabFuErDbIW5AhupqjotMmwpTMgSB72yyPOLxET2iBUUigpKSA/pO1ASgCfYCZu
         jUyxSezrjOliE8onjutuay6Bmjy2fuPts7IFRHwxStJWVMI10hJPRDGhYVw+vAcpQIQl
         GrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402661; x=1779007461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R2/zYcrseTTot6/6qcImxSuA8kM1CWD/r6OyNv/RP/c=;
        b=TiNFIisu2lnO35VEfEHc9dT8ue4tL9SZfD8K/IEQahOMg1dKW0IDXl7VzNDgw6Qxlg
         M4WxjoSNE3xgqHs1efffDO9q8PbMAFGdFk2uIwtfXH+Fl9p3gCQqJjCk/x4DAm+W9gLO
         Sd16ihJ+k9fNRPBIrYzby1twzvGcL7M3F0Qoh+RDA+Zb3cGQ6tk1bHlZ4yJU248flvJB
         /yHPjxv3zzo7DaREr+Uje0qlgEsuwsir2T4Gxl0Jcp4z440yLIqo6jMbieaLqsDX1/jQ
         CLAQbXgI882hAvJlunHc98kaeL+pxRne1XAC1fRqsE2Bw1fBwlyCicFwC+HSdUvXt+rk
         o+lg==
X-Forwarded-Encrypted: i=1; AFNElJ84NRe4MJFjRBzqKGT4AkUFZ1Hnyl4qXlXKQhSrHgXDqREMy952fEccR9xgNDVTkiOLJ9DcIQGQz7EgjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJu18qcjvSZWeOWUZAfJPXpmiLA2Q1Y0exRIXx7TLqOWd0KQDv
	DPmgsxpCAbKSE2gYuhu0Ev0ot1RVLKTw4UwXXAV1YZT7Qq3TvRztKZuQ
X-Gm-Gg: Acq92OFR0esWPwautS6ts/3/tF/X86Qao74aeZLyW3M9sKW7wiuqSMfDnhBlp6hejx/
	n/r5fEGIGRWCocGaHCg1UbnkRCJYHCtDbpXvrRTFdrVzQr5xm0EOGz4PgBbf0Maa3z+TAhP6R7m
	8xU68ylQmpJa7yKZ1fbecFnlAM713dinpggNGUYUkiF3wPK2I69yxf8exkBClVkErOeRqq+lusk
	R9WnKB3bPTJc0tdevdrrM9+Gu8Dw8Q6/usYD6uORo12V4U7Me61S68BXD7/vpNkdfxQvGIZr2gR
	sOd6NC7FeCw2D6Fg6YI5m9uYLDx/wt7r/gvhbiRYT9hm+Ovu7bT4MpqJZ398GZScIzi3BJ3ODNB
	somaPNuNqRsVBjPhnn98rxi50q+X48QRQAgJCUiCcgFDOeFKDqY2Fp7xdlz7cxYPTrQONaLYxJO
	un8fin8B2+NzGUA4q2LGK1uCZIYwznxuGogTRBSdGTwi1v27NeX4pB1JG0wA==
X-Received: by 2002:a17:902:fb0f:b0:2ba:6ca2:bca with SMTP id d9443c01a7336-2ba79c20dd6mr140989945ad.26.1778402660935;
        Sun, 10 May 2026 01:44:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:44:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 08/10] ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
Date: Sun, 10 May 2026 15:43:01 +0700
Message-ID: <20260510084303.122426-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510084303.122426-1-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add helper functions for preparing and unpreparing FSI clocks.

These helpers centralize clock prepare/unprepare handling and
will be used by subsequent patches to move clock management
into sleepable contexts.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 66 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 8c46d6806958..b93809b5da15 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -732,6 +732,72 @@ static int fsi_clk_is_valid(struct fsi_priv *fsi)
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
-- 
2.43.0

