Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9AC3B777F
	for <linux-sound@vger.kernel.org>; Fri,  3 Apr 2026 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775215671; cv=none; b=aSK07iotMpAsn3CNCbQAQ5dmgx4hLww2GHuWtE7QUAlL6dHWgn/wb+BG5F9QjJ8ilt4ZoeG0WMyrYLYke6sTa4SnRYgtFhQAyhjma74XyNe7mQwpywGlFR3C0sXzXvQaBUl+gsonZ+2a26ERIU09Gqar/XwCVfEiA6D9GI2Rm9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775215671; c=relaxed/simple;
	bh=BVteWb/phfOhOywch6JtszRF/l+CN+UQyrXxfcmY7BE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCOS8aE2gmv1v4nB5nG6zn2/6CbDXq5QEFdQnHFAkUTrdV1RmnuMt9a4M/htpEroaZYwp1UH9T5CiSXiPIWs2zayZcbppTNBkCDMjO7hEjgEtags0fjCUyVnRhBmvawt+bF+IiZwOltEf7jihcXchocQu1bWSH7s/v9ooSxAG8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9pCyO1P; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9pCyO1P"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82cef263bedso882973b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 03 Apr 2026 04:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775215662; x=1775820462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7WBGw3HYIKasCGZa6UoZqUVbnabzZNeOPFe5FYqFjk=;
        b=O9pCyO1PADi8rd6HfOFS5Zrua0Y6TPixSAZao6hbAqIlyfstz8FEWNURkxyOVQ8XOl
         oI5KowzbD9ncDz7PlYdz3II0LFIAP/+iAhcQZw6gAwU3wKWmhbkcAabwVzpayVNWOqB0
         rNGFd/GPA/dZqTMO9GqewuNEBknrawo4S2evKLd6uxhJ0VffPt5pAQ6CJF9zqCMVETAo
         6lxT6t4EmBeGe8u/GcF7F4n1O23oAk74uwj7dffBNlPhy0gP+jJi7mgFacRRiB8cF3RH
         kovG/EtPlEHsmlgvULN/Qe46NtGQd8pa8UYLFmMTFFxVFwSmwY7TNQ04IjC936prDq0r
         ZHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775215662; x=1775820462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z7WBGw3HYIKasCGZa6UoZqUVbnabzZNeOPFe5FYqFjk=;
        b=fOLUWR7Iy55HTGAEIr76ssq1r5MjfA/Um00klRXJqhUfA0yT0OBp0KmggEddpQpG0F
         IKeq/4oY/JytT4/AkSndEOBUfYaUC0FkkqWzVqUu7rZKRfd8gCfRjsDCAqmpenAUWm9D
         RDCdmHUi/1LsqlO5b61BXs46nw7jnoGzeJpRlza71gHXEYM8Sh3t+P3MNd6+P1Ou9Xli
         iQvW4VATG9db5lBI35b+BEteCoiOlrh/ckLOrK8+G9rC01t7l1DXHMsKBAq51IYkIXzC
         2vyOsD/GeP4suJoI/MqAn0+5soK9LuwBkUZHX4ayqf8i59KrjNxEoH8Fj3FNUhGbGXAt
         Lhzg==
X-Forwarded-Encrypted: i=1; AJvYcCUI+463qp7Ah5tGytMKIjw+iAN3FeESkE1qXUiqKt1VC38fa0DieyBYRjYh49qEgrEwTIqLv+Qmqv1pQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsWHJ9khpgatLeKW+PXkI9ajjW0/lghMTKkKk+THgvSORLG3fM
	92YEVrqp+KJbhNrOPl++icskhuB2Bkz9R4ufWvFbyIFlcOhb4D7oD49q
X-Gm-Gg: AeBDievDuUelsVlPkFGK4jGuPSfhFtce/Iv1Op1HuoRPDKZ9bBWyJd6v5Iiu7yBDzhJ
	j93K9KDvhW3zri3EIFhaPiZDCaiciEjmz8/HID3Mna6t8XS7ipcT7afyB9zHocQva5qoFUpUG1r
	XlNVcVhmJvrjbt3kOMXcdrsrYmJyX8ObUHrj0cxmyBTk/Q/ofTRGST1xjrNCa83+S/CmzdgIXxg
	8fEZwdfwtIdI7V0GKgB47lp9iGg4RZ0jurmFUKfmuXLyCYe9eVMZaOp5XMmlIkmWvGdzgyByL3m
	nBzeNH9vDFc2ifrRAcN4qmpJrcYL6Yj7k2eI4dW+3wopjjhBQkfikG/CUf9nqOHBEfmcm11mofd
	7KS4czweBQOHYmu4NR8wZAFUDvdrBecM/Yo0dm1wZH6dF08YgjViztClleEjpbvA33ASBDic5v/
	E4F12qJ76iTUQMSeiRp0hrqmbutcqBZ4N8QJpPx1MvBMoTpFKJzQFGprwGHQ==
X-Received: by 2002:a05:6a00:3d56:b0:82c:d7c4:4c6b with SMTP id d2e1a72fcca58-82d0da2e1ffmr2446985b3a.11.1775215661982;
        Fri, 03 Apr 2026 04:27:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm5202251b3a.23.2026.04.03.04.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:27:41 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock
Date: Fri,  3 Apr 2026 18:26:55 +0700
Message-ID: <20260403112655.167593-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403112655.167593-1-phucduc.bui@gmail.com>
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The FSI on r8a7740 requires the SPU clock to be enabled
before accessing its registers.
Without this clock, register access may lead to a system
hang.
Retrieve the "spu" clock in probe and enable it during
DAI startup. Disable the clock on shutdown to match the
audio stream lifecycle.
This ensures safe register access and prevents system
hangs during audio playback.
This is required even if the FSI functional clock is
enabled, as internal units depend on the SPU clock.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 1491c2f2cc96..44bd1c1e6294 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -292,6 +292,7 @@ struct fsi_master {
 	void __iomem *base;
 	struct fsi_priv fsia;
 	struct fsi_priv fsib;
+	struct clk *clk_spu;
 	const struct fsi_core *core;
 	spinlock_t lock;
 };
@@ -1554,6 +1555,11 @@ static int fsi_dai_startup(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
 	struct fsi_priv *fsi = fsi_get_priv(substream);
+	int ret;
+
+	ret = clk_prepare_enable(fsi->master->clk_spu);
+	if (ret)
+		return ret;
 
 	fsi_clk_invalid(fsi);
 
@@ -1566,6 +1572,7 @@ static void fsi_dai_shutdown(struct snd_pcm_substream *substream,
 	struct fsi_priv *fsi = fsi_get_priv(substream);
 
 	fsi_clk_invalid(fsi);
+	clk_disable_unprepare(fsi->master->clk_spu);
 }
 
 static int fsi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
@@ -1963,6 +1970,13 @@ static int fsi_probe(struct platform_device *pdev)
 	master->core		= core;
 	spin_lock_init(&master->lock);
 
+	/* SPU clock is required for FSI register access */
+	master->clk_spu = devm_clk_get(&pdev->dev, "spu");
+	if (IS_ERR(master->clk_spu)) {
+		dev_err(&pdev->dev, "Failed to get spu clock\n");
+		return PTR_ERR(master->clk_spu);
+	}
+
 	/* FSI A setting */
 	fsi		= &master->fsia;
 	fsi->base	= master->base;
-- 
2.43.0

