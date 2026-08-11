Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B022342AFB7
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786443019; cv=none; b=FWcW1aUT9ljINXiDSTn/TcWiN5AAVmjZQkpgUsZvii8cvMs/dJgiPL3A6sqH/s/SXzuz/pvqN7540KpVSE08540ZGePrZ+zIqnZH+CPXfPSENGSdbDw5X5QItymn+fXd+GisViM86bRUX19HxrSV0oFUsr/7h7JKQjyBECPSpSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786443019; c=relaxed/simple;
	bh=LDkL7QUnN4FVFemBwTfUF7bwBHp0F+iLG4wJh0jG3i0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rw5h0WuBZlszQq9fk/he7OkxKQ6nKoW3z/MIDMPZLk9e904no2YRzhPVm/OYmdoqL/nX0E5owez0B3t+0FUqoK6pozeLoeUjV394l4yLUm6K1n03606CShqDmSzjsGcNsJAeQE7WNlrC/nTApos+s/ZLEMwPKU9jGEwtQej0ELA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+c5bF/A; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+c5bF/A"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso7906505ad.1
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 03:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786443007; x=1787047807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yi2AQubmBld0thtX/fIlK+IyfhDWkAZ51GVpdWF8ty4=;
        b=Q+c5bF/AfOEZke0JdQV3mDHGDINq7f+Lp1MuKAszvFd6dm9kHj7WYT7d/5GRDuuSxa
         X7WA65v2h4hEUy0WqcXPhCDSt40pwfC6ixQr/k9+h8bb1VgBhhVnp+dDCp4x/uG+I0XG
         oBt+ud+aBmOk5ejm2lNYtQ/3qd/c+/1P4VHR3UU+NKcm452wdBnpBJ6h4eTgFw+vtQdo
         FtOarqtK4YTV89eS0dG+M1lqZ74vV2WHDXub10y8WH4P6ohSv8r0k53kFzWnDWJIrKOl
         FjC7k3jMa/piKmk0A36kGbqc0dXsZxZc3LWgkFRgbjb97gAvmxOWNmdXBL0RjBCgtugj
         Gmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786443007; x=1787047807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yi2AQubmBld0thtX/fIlK+IyfhDWkAZ51GVpdWF8ty4=;
        b=TtBiFuOU7QcDB0kdBRVyE8f89UY6KSZF3pjwxdZo0DtKMWXwK9hP+2tHKADFwOPvSt
         Mav7bMC3Qtb1WcYGz+DkxaiwRfqZA32RAY6GoJpp4EvVg0HHxc3dYY1sgRBJgkmnls9m
         ErcR44TUyYqlBZXIEojTaiQYWE+ssymcCGpdWESDS+QiKg2y8YziVWCRbUJ9Ek/IkDLf
         FqTU/86ZATLrBFhuFa4RUHRjEAN5lsGABFuUVCE9Zl2pPqOkxnagBZ/8t5/wBVt2h+Es
         4a+OabC+hqDBoYXLAphL9i2vLK/++gg5/xxnMW7ci7jBWNC3YB8oZO12j8WYeHgM7Fiz
         zN7A==
X-Forwarded-Encrypted: i=1; AHgh+RqXaIqTdST2y/5z1MNtg7Kondm85wh/QeRIPVqVINNIYnTf0GMCFINGbYliZM+o0Cd83ZCANsNb21aIvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHJ19/WzMVCIk4EEhOCSCkCOGMwH8SxSS+MZm1LLg65E2onLCs
	qtkouDwCSPIcpGGu3rXJTGRypY61jt1M3FQ8zPfaK+Xdyv7aBZkflz787VWclg==
X-Gm-Gg: AR+sD13n9HIEZbp5Ogjweygl+pRzID9dWfVZcmwPFhmz9LhWcbQmYUI0CMtwNVttMeR
	455SWODRCOjTR5iBbhJssVM7J61oII5XuryqyV977cQssqirN22c7t9YVfyBkoXozPtVqkMkvdV
	2GW/CML4MjcADurvDMAwKrXn9Tx8KqeKktTHnVhQZE6B2q45eJn4awOv6ogCQ9dGNdBmSJmxLE1
	sQhj+FbxbpzppA/ojs4k2lbYcXVSlUWddcIaqqo1gErYKjvU/2Uc8PcFmboxDhhQZtl+eyovgqj
	feODoq0/vS9g7P9c4cHclfPWN/EH6OBmXznvp07PGkq0v4aXiKhQmrS5MbO7h1yxypiDSMwy48s
	g/fqjx/4TMm7uxBICRJbFBvzfihFViLz0WEIvaoWpqVskM3bmveIr2faZk1oBoh4tJNuSdrKgkO
	uaWULn3jGIWCB+ee8MAouz6PkQZZd1m3bDnZoE/MX2Jza8AyKXFTViVyAq3R7K49TZcK0rXUCtm
	+mZrfmUUYFylpM+NlRK7w2ZcjU3ZNDKWc0s7kpdOmiWPKejImUgVr6iH3fLt5xAU+8urR0QaF4R
	aJdS
X-Received: by 2002:a17:903:4688:b0:2cf:4339:aaa with SMTP id d9443c01a7336-2d317925cbfmr22741185ad.12.1786443006674;
        Tue, 11 Aug 2026 03:10:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm5189625ad.37.2026.08.11.03.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:10:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Daniel Mack <daniel@zonque.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [RFC PATCH] ASoC: pxa: Use devm_clk_get_optional() for extclk clock
Date: Tue, 11 Aug 2026 17:09:49 +0700
Message-ID: <20260811100949.61142-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The Device Tree binding defines the extclk clock as an optional
property, but the driver currently uses devm_clk_get() and manually
handles the absence of the clock.

Use devm_clk_get_optional() to match the binding and simplify the
optional clock handling. This also propagates errors other than the
absence of the optional clock, including -EPROBE_DEFER.

This changes the existing behavior for errors other than
-EPROBE_DEFER. RFC to discuss whether these errors should cause probe
to fail rather than being treated as an unavailable optional clock.

Fixes: 90eb6b59d311 ("ASoC: pxa-ssp: add support for an external clock in devicetree")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/pxa/pxa-ssp.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index f8054c1c59fa..3a0abcb0bfbd 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -769,13 +769,10 @@ static int pxa_ssp_probe(struct snd_soc_dai *dai)
 			goto err_priv;
 		}
 
-		priv->extclk = devm_clk_get(dev, "extclk");
+		priv->extclk = devm_clk_get_optional(dev, "extclk");
 		if (IS_ERR(priv->extclk)) {
 			ret = PTR_ERR(priv->extclk);
-			if (ret == -EPROBE_DEFER)
-				goto err_priv;
-
-			priv->extclk = NULL;
+			goto err_priv;
 		}
 	} else {
 		priv->ssp = pxa_ssp_request(dai->id + 1, "SoC audio");
-- 
2.43.0

