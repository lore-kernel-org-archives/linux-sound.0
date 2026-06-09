Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9216A344DAA
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 01:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968737; cv=none; b=RsQg/kMhdGU5wvR+Vqm/gsQFPXNhoa1FtpgpfkxuDZuJ8rbHowKZXe/SaMwnnl6qAAreUYNErEGo/n+3oVyK5t4YD7OqZ+DV9kWjLgZ45rO+VkqgzXBiDI/N3BHSCAcVaUzW0sxM5n1K9JhI1uf3xhpC1MNdxTQ9vDsk5xMHYPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968737; c=relaxed/simple;
	bh=FRuIe996eKvxY8l0bKGRUk8hVAskBRiNmK3+CXj26cE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKMqJFm3hmOG6Xc1G4sN2gS1jwHWe0Z7EGa5b8HH9GAdY6vI0JjpRSn7LJPh1X9fdltn0aym+DLV+cIAOoFxEedtzf1T1Q/nGG0VwJVe7HRRn6Kh9LwerUlrimo6DLDf6QjcA0ucGIhHi11+7fjVwtiHNB7KaqjNaXIZn7AbMG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQJu+c9F; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQJu+c9F"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf2247e38eso51281705ad.3
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 18:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968734; x=1781573534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRUk5lBBY750n5StT+TrvtjJM6eotrKNm2nySlVxLJg=;
        b=HQJu+c9F0jqhnbaje+hTuaxEICL+AUItZB22sMHGOCjCyfJS/qDqnQIGmcczVB12lp
         AJxpnjvh6Tbp5q3X/lcph/oaP3Winn0sQAzbU8KwIzCJdRkcROd5GBFmmHBrN80xIZdl
         hi6OOljz9UYHSS8sixCtV4gnbbw04YYe2uGms2IxOsaUzXnRzy4D8VcpnrPE+g2OY0VD
         bf9mt40AOzzAOu47a7QYvMa5nA8GdVhQMBkhvLfAZM8BmUwOmRXNIcb23d6VMcnYPkr2
         YMIgXglbh3R3k8idyRkcYsje3WggxRMIZvZ7RsAXwolfgw1WqETMCGFlkmEegBaD3j+p
         djlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968734; x=1781573534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JRUk5lBBY750n5StT+TrvtjJM6eotrKNm2nySlVxLJg=;
        b=A8WfP1t2cfaKygo4+DmKJrWJBU+QMsaGRMHx4adzjXNkI/dtRoxL1ZVjnpJysiBA8f
         jKcXG3VJ3gYUHHcJVtdQBk8OpURfFc0RL2fgJxC5ju5pN2AgmLrjZA5TfwyuavdUQkS4
         5dKtaIqvDP7C38HBTljaiSKW5tbaUAldmeQ+VU0iUWmMxo/Hg0OXjR3Np0SoFNPQiis7
         9P/h9j0jhfF3b4vBLrGfSRjmB7QK/aSz+whZzeuvDHFloQmLIUBuXUvN8ZY8l6/5GicV
         UZBqZrMRzcBJZmc3MPTsiVWZ6IOrfSaEM25Ch65WJGeo22OUuWpy7+JL5l8p6U8mEvvM
         7Ddg==
X-Forwarded-Encrypted: i=1; AFNElJ9CX51ZZRpm+1ZbTP/GQPG0m7aZc6Mm9PYMQt9jvTg41whNdY7ISY0MG+QEvUX5D95dqqGN0Q+xi9ofew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgUHku2qZEHsfMNt8IxU4EbREYusLWuQ7Lnm8dnSkvNfoNR5yB
	VfTdV+hZxsoIHi3Ayd2nB+LjuDz7ftKTefAWYG9ql7fm4tuvPJ3XW/uLBwqRsA==
X-Gm-Gg: Acq92OFg0ncAAxNBObfBPUMB6pdjlPZppqzpkVHlxdeGITHhAFh4xQ/wwg4IRgDje1J
	rr1DZaZnFqlwnPc6DGwlzG3TAXfO2wWlmJdfhys4JrXfaz2HuuQbRBH0cwixOckzD2aFlOXZ16y
	R5Qday0fQdLYUWUSn09xtJPD43YbIVJMy2RPNXQXUZyG/0prpbTU0R/7YQyL3ZORXlCISdwXSBq
	12Mmiv9pPWyTN5YPPGS62HmHqd3TfAwfFrK/2XwzzLyw8I/B7CpwWK4wtRCds/dVuTj5bHt+5iM
	5COjwDK1EbQ19ME3y7uRghgd3xL7lMDHpds5p0KSIoJdBRdBV7E8hyfekoWMvhcY+DWWYD3Y3Tw
	I9YHdwhXk15JRzKN0Jt49pszWvlCX7F7uePtloxNT/qSulPKb8j1GKmdKaWozusplRwP5lzNxaq
	XLdQ4HWc2sdeP4G0YHWJH6tN4pJLW6udLTgh/oqoqWCI8z+srp1+CLtbmIUsu2V/ORR5EW
X-Received: by 2002:a17:903:41d1:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c1e85c0cbamr211904955ad.30.1780968733886;
        Mon, 08 Jun 2026 18:32:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:32:13 -0700 (PDT)
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
Subject: [PATCH v5 10/11] ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
Date: Tue,  9 Jun 2026 08:31:06 +0700
Message-ID: <20260609013107.5995-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
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

Changes in v5:
 - Drop count & spu_count and rely on the clk core for clock reference
   counting.

Changes in v4:
 - Move clock->count early return check to the beginning of 
   fsi_clk_[un]prepare() to simplify the code.

 sound/soc/renesas/fsi.c | 51 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 6c432c7235a4..80e87b815c1b 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -730,6 +730,54 @@ static int fsi_clk_is_valid(struct fsi_priv *fsi)
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
+	ret = clk_prepare(spu);
+	if (ret)
+		return ret;
+	ret = clk_prepare(xck);
+	if (ret)
+		goto err_spu;
+	ret = clk_prepare(ick);
+	if (ret)
+		goto err_xck;
+	ret = clk_prepare(div);
+	if (ret)
+		goto err_ick;
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
+	clk_unprepare(div);
+	clk_unprepare(ick);
+	clk_unprepare(xck);
+	clk_unprepare(spu);
+}
+
 static int fsi_clk_enable(struct device *dev,
 			  struct fsi_priv *fsi)
 {
@@ -1580,7 +1628,7 @@ static int fsi_dai_startup(struct snd_pcm_substream *substream,
 
 	fsi_clk_invalid(fsi);
 
-	return 0;
+	return fsi_clk_prepare(fsi);
 }
 
 static void fsi_dai_shutdown(struct snd_pcm_substream *substream,
@@ -1588,6 +1636,7 @@ static void fsi_dai_shutdown(struct snd_pcm_substream *substream,
 {
 	struct fsi_priv *fsi = fsi_get_priv(substream);
 
+	fsi_clk_unprepare(fsi);
 	fsi_clk_invalid(fsi);
 }
 
-- 
2.43.0

