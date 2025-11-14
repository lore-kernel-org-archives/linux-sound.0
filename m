Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FE12F6924
	for <linux-sound@vger.kernel.org>; Fri, 14 Nov 2025 07:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763107143; cv=none; b=sRu4H+Y6/LJMKKXK4XJVBxfcFHyybwFxdXM+t3KmvX47Yq8nqtp6t0Gy3du2RKLtiYs0sVR2ocBpuGx3O+u7+hHV0xDy207NhbXm+xSaASi/RTDhkEFiYx46aDg4LJ6xh59YN1Imra3HfWTltAvBYXcwI5knsf29BqddHVYp7yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763107143; c=relaxed/simple;
	bh=qr/JTApNIt8LvdfHSv2pUFL122dI4OtNbZig3GzIZcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNcmZue64liA1Y8FGcLWJUmDeHW7pWBdvTJzU1WPT2Q2150B9gxIuk++gZMwfHXNWqfrcaPsrAKQJBIgYZUYR6Ls8Fo8Ls079roGwHaGB1o6TLqsK1XdV/29xqCpWG+6ULfRUXLFGgJN45Je/wKSfFI8fe0ycp/bBXYJuI1/BII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBYUma44; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBYUma44"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477775d3728so16758675e9.2
        for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 23:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763107140; x=1763711940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVdLYT+QZMSS2Y59bwaoXmWf+//7PAt1P2cIuP1Tb5U=;
        b=jBYUma44HpWTIg7Ro0T9KsC1MOibmE+A6YLvfiPYqiYfYG6XAcqYCOrKLF9YFNJkVa
         1OzbF+VX8u82tpFurgnPO3FIJHHIuXkbJCxu/+Q1c5MujoIm2Jys2aidIf0Lus0shGqX
         yo7RAaEly7gzEL/D9EwTf6yjNTAxV/iUn5NCyTRRBX/vuxB6xuQ6ncylZQYv6pc3EfIH
         /hwq72EaOjl6xorTMPsfoo933eMW4rBkMOKW1XLboPV/QC7rTWYbC0p9x3rrSCfmXiJr
         HT1zD8h5nemuVtMwtaJfT7XYFys3LjeRGqvT5dLe74pqXPV2o4BohZzxJfVjKhXEdH9j
         ICcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763107140; x=1763711940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qVdLYT+QZMSS2Y59bwaoXmWf+//7PAt1P2cIuP1Tb5U=;
        b=WgM+FuHTdAKfaYOUxnlo0dIEAZzfjTISJq8Kxh+zvlPJ/AMFWnXvhUU19iLr7dBnds
         aTyAWY1MSyztt1qteHQD5ZDloRWym0uL9M9+lVxckGdBt53cY8j7AEFa1YZBRotPRmcn
         5qBtHwXoE9FlWXsw/wltGJ/cNNeEB4OjSi6Oft7jvSMzCbBtdkg4ILsKBUTd1Wc9A2El
         KQIacZgXtT0Ze15qW8XswFVpoPHj1eeNFop3J1hBj5eYY72BxdKTKW/IJy54QCfjk+2k
         L/OxlJ5LnjuMMWHOewzgG12Cs48+In4Up2j/MTQytDRhZkBT9hrjidEbhIkSkkTAvlV1
         joSw==
X-Gm-Message-State: AOJu0YyBglUFlAuV17+KnMzWYibspEucFftlWjvQ+THMxNqu4GqQhvQf
	sfLRC1wfxwml9wfVLVgbNue820/4H++F4zHeEKcKrI+gomyCe3vjf5BO
X-Gm-Gg: ASbGncsSMr7aLhblLoNd+/0Yhkdr85VD92LKNQ4G29JUnVMnLRIXxrdppO0eXQmNjDl
	mJzOfwtwxYnAEFT+PHHtD2j0/1d9N+I60eU4kzrsQPFNcOlPlsrfKwXLPfn/iUqNVeyQf6ON7Uc
	A0CoTREP2G+yG9JQyDg9mw6C8LfXyrLMUJOiFVC2wTw2i0WYodD9yhRjHqvHjMV62jA4jdZAGHS
	qMam5KRbZ1+PrdPLIs1plHRHC4eGtoMvRysL32/pBiRRrgwaztj2FRKqrfzhq4UQarNewieD58a
	Fg+m/2bZuD/HuNzM52zKx3ut31apbWFUlBd/mfUjgN6+AXUyNSFV84O9LHQyyDeXVRdQFocKXoR
	095WvWDFrIoH5ofoyCrxdW1T4mLS28Ovhm0SByRObr0XU78UH7k7hWWI84LgDENImqwzcmiqy+o
	emhU3K4yCXAJHGei+EY9RGMonOjEXeVIOxGsMSeayqRcCGh0dIDCikyv1A0A/DqSMYcdT3VSsbJ
	5KVB59f4Wu/oGZ1
X-Google-Smtp-Source: AGHT+IHobo6oewAWiFwXHme2VtDD9BtCqGhcYtLVmrnit6G4r0D6gR9euAVscGX0uxhM9kixd1ab+w==
X-Received: by 2002:a05:600c:a05:b0:475:da1a:5418 with SMTP id 5b1f17b1804b1-4778fe55465mr21359635e9.1.1763107139410;
        Thu, 13 Nov 2025 23:58:59 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c847bbasm76347895e9.1.2025.11.13.23.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:58:59 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 1/5] ASoC: renesas: rz-ssi: Use dev variable in probe()
Date: Fri, 14 Nov 2025 07:58:48 +0000
Message-ID: <20251114075856.4751-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114075856.4751-1-biju.das.jz@bp.renesas.com>
References: <20251114075856.4751-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace '&pdev->dev' by 'dev' in probe(), this makes few error paths
shorter.

Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit message by replacing '&pdev->dev' by 'dev'.
 * Collected Rb tag from Morimoto-san.
---
 sound/soc/renesas/rz-ssi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index f4dc2f68dead..845a55250d70 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1119,19 +1119,16 @@ static int rz_ssi_probe(struct platform_device *pdev)
 
 	audio_clk = devm_clk_get(dev, "audio_clk1");
 	if (IS_ERR(audio_clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(audio_clk),
-				     "no audio clk1");
+		return dev_err_probe(dev, PTR_ERR(audio_clk), "no audio clk1");
 
 	ssi->audio_clk_1 = clk_get_rate(audio_clk);
 	audio_clk = devm_clk_get(dev, "audio_clk2");
 	if (IS_ERR(audio_clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(audio_clk),
-				     "no audio clk2");
+		return dev_err_probe(dev, PTR_ERR(audio_clk), "no audio clk2");
 
 	ssi->audio_clk_2 = clk_get_rate(audio_clk);
 	if (!(ssi->audio_clk_1 || ssi->audio_clk_2))
-		return dev_err_probe(&pdev->dev, -EINVAL,
-				     "no audio clk1 or audio clk2");
+		return dev_err_probe(dev, -EINVAL, "no audio clk1 or audio clk2");
 
 	ssi->audio_mck = ssi->audio_clk_1 ? ssi->audio_clk_1 : ssi->audio_clk_2;
 
-- 
2.43.0

