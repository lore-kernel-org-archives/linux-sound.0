Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC74F2DB7A3
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 19:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852400; cv=none; b=jLP/5K9ev9p4juuwFuN/4zbMvPADqY6XPZvWVa3O30vRqQRk1hrYhoUBvYY6dU7iFpI4bvM2oYZ/42EdWhNfWxsEPsd8zLKFN9VaURtnFkn2G5RC6W+MnQ1BnV7e8Ns4SZsBgLlPfjhkJe/AreiEIEvhu7JMavNwJcA3Iviqff8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852400; c=relaxed/simple;
	bh=D5OBraIFCsLuejYqBqDttMwf9aqGROn5pKOyd9GF2nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sO74KTff311RSbeKUc0h2pgEneRovwpQizWrFvPMO2WYemhppsNxA8L2Qhq2TmBXGQvkre6nCCjqt4VgqKDwy4MwpRAq6SkJ+63WPU2x/io/hKPNmlYVE8wpcAQT6eHnub8O2vYyr4tUo2T4jhleJ1IpFAhzQygg1Pyy1wZBMoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fkfCX2Dx; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fkfCX2Dx"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b874c00a3fcso752115266b.1
        for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 11:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768852395; x=1769457195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++CdGQfY/XSJr/yxMZl870sJmmACkpKJfiaVemZXNhU=;
        b=fkfCX2DxBO+2Hhqhk7bw5xypIyE3uuww5TIhRI1ehYwNLoov6OZQwnKdwCQXWv4bW2
         wBBX06QvNbgtqVIyXpBcqWqJ4f7FoTbNq2SY5ujLo2hb+abGqjDD6gF9vHBfZsyWni0Z
         S7/FNd/feD99V1ufdAmacylNxmebCRweJjrAgFp3a62/IL2Do5fZzzctcfAzdnj+CkfE
         8jZMzwsjM0ruc0fkpDVk64dsRREsIVscIqOjR/wGB7X1Fzh3EXu+vHF5QBrQAnu98Ar8
         TI1tJSI43KQXUPST5AEvS1m+utPan+q7faienrBunh+omfg5DMRunc0dPHQKFJViQSYw
         eGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768852395; x=1769457195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=++CdGQfY/XSJr/yxMZl870sJmmACkpKJfiaVemZXNhU=;
        b=KJlW6UqJ7exayPHSNW6yub024mSfbbAVqGioTVJp0ldhxqoWt8A4QrOpX0NdkzdrM5
         qfxKA/XwELx5NGOd04got4hyq95bQ1wNRElbc6cAD1rhCxA2FcrmbrR6pqQZAIBEOxO9
         UxGKdyh1MSARiVA5qnsHDoYRvidlDZZGvWi5VSTuHonZG/BZue4XBUzbtljSCAA1AkTY
         KIRKIofNJy3HnPBd8ix6v4x3L1mE/RzwgjyrLw2tMjckc/gGjZQQ20DoED11yNUfdsNl
         G93KyW9+U6Ya6aj5aTEoSCMLdhOtc+fG3X4zwA37ktIdfIvOYXWXER1v/ecNjZBhxoo8
         gFyA==
X-Forwarded-Encrypted: i=1; AJvYcCWl+AKvASHpr72n3hRwRkozJ2PqKz7xKQmHApdRq/5+0sQOq6ed7QS9boQ8mDvPCTnMKnT/14lzBEuP1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAo+MsI1JPOinoq1KmkclXK7pca7xaBP+MpD7iszL8SAaFH5D5
	lVtznYA9Yl7h8Se+ZWyRXGDPo6dYaMOPGfaE3LQYoDvauybPCXA0CNP4WUa/jhA66Zk=
X-Gm-Gg: AY/fxX47Of2O/Se5ETveYrxIMS0hyu273UGlkDov5D+PuF+xZHRWmcjfTcj4yYcIdnF
	2oXY5Vzw/E8+p+VRNJye+gwvYx+iv3KjKlsWc6wF5d90XSAwYGFaoluNXteq86lNZ2w9U5eeNe5
	DCdMMbJ0Tfov1RZJGS9ZsswWSRJsMjA1NGexpAwp24DSc6fFjSCU5ygWq2nGlZUIyrGoEiaSFKz
	1GOe0rCXNvBymqT7yDNSE2sMBdLj4GtKjSP4A9/nNzx0QKsV1AuxiWssqpYZIRtMxvhhZpYr54+
	kb3V0A8M30bjMrGs5O9SmNQ9hXxNYLbGqEeCZUXRAfn/h3A6rYeBDmQjQoIcyUN8fT0UE44MVJf
	jOEfcKzz7WZ7FNhfXrrGDY7KHdnCGDo203cYkJTxkawNpqGS0un5w2zq5kOOseTrsOuwV47lCaS
	Ov12kgHlHnDL2cNS3ImlgGwxdDCbVadRTh20xZBaQ=
X-Received: by 2002:a17:907:a41:b0:b7a:1be1:823 with SMTP id a640c23a62f3a-b879327fff5mr1099044466b.64.1768852395271;
        Mon, 19 Jan 2026 11:53:15 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fbb38sm1167248266b.52.2026.01.19.11.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 11:53:14 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 4/4] ASoC: renesas: rz-ssi: Drop goto label
Date: Mon, 19 Jan 2026 21:52:52 +0200
Message-ID: <20260119195252.3362486-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need to jump to a label just to return. Return directly
instead.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 76e7f0fe9df9..39aa865bdca3 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -881,7 +881,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		for (i = 0; i < num_transfer; i++) {
 			ret = strm->transfer(ssi, strm);
 			if (ret)
-				goto done;
+				return ret;
 		}
 
 		ret = rz_ssi_start(ssi, strm);
@@ -897,7 +897,6 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		break;
 	}
 
-done:
 	return ret;
 }
 
-- 
2.43.0

