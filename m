Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6025D38736E
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 05:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993733; cv=none; b=iWNTkCL7BvQp7tqW+ZBg1rXhZpZq+S7Mx9NmXjNZvTMVknvboGQ9eclDOROeTYdom5+egE7HrLOi5Cat8vuq6pHAq6+Ku8CjMu4IJDEoxLB9VXEdOkP90Pu35i7sUWa4euxegXxT8xhrqceuKucvDex8mHzecCjl/vQF+vtfgtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993733; c=relaxed/simple;
	bh=mlmqnn4Q4LPR6Lrz7pE4C7Sgql/X8hf1PPLJlq0NjVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTO8IjlwpXoZEuSemtLNTmEGbR+wu+I3i6c/e5BOEQZtqiEr8PtlC3UmQR4WQFgmrZm+jQO8P/+d7gUlyZQ8yI2j+04iEQg886AoJdML/KMQR5VE2nPBD/QPXEQnw9kZ8KDmc8MAZFJea/gmF7vMN2pHbLbjYHN4IRg8nlpIMHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lciSMdWQ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lciSMdWQ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so1717325b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 22:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993732; x=1786598532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AjOMq1XsUpQov1kpLT0My6RNRrW7igNYjy0AQ6ioFe8=;
        b=lciSMdWQv3uDulFcodaRNVyjLHYDR7fhJd9BfhrzfBg+u3RDw29KDybInkapCJ+Svq
         /NX8bK6hv7K1so+/zHdUDSzYnRU3dg8e2Xy5NKxoP0O/Bb7PKH+hEh3qEFGNKwTKRgja
         lrodHbU9rihlpYqHtXZrN6SdY76vbqOwtfFHP97yZ1RjQZ5ruEJMLIU8F/zS0aA3nkmi
         yL0bd5aDuI9iDGrAi1wmZDo8p5lfMptGGZLxZTEr1b1vDDylRrN3wxqEFjWriNTOew4s
         TSwHr/G1GN3oFqZtpDJ/rtl0PBhEHl355ghpQGXnLKzkGK8uw7H7u+gThRbs5xxUiOey
         DhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993732; x=1786598532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AjOMq1XsUpQov1kpLT0My6RNRrW7igNYjy0AQ6ioFe8=;
        b=o9ukU5Bk/UNCeK9x2J+oYWmMaY1pwowXdbwQYiApoGMlo42IWUMu9sCUX3Xtugtz1D
         784e3Q2F+ERWJJ2P9frM6dFax8j6Za7zWF8T79ia0uGpiZbjwqyaOHUSLiYkUxepzha7
         nwN5KfQZiXSwBb6qvn89roQrFAMh8BiCHlAb4sg3sWo6Ozv2NBoKYtmKPIn1S2BD0IWW
         306iKbWlWgxfdtzhtXzqkgl+ndEDo7G9I8Z05ZSciMz3yCK2u1ymfjiRnQGnPa63fXIg
         TPUF/APY0B65iEGShJwjLFUDYkt6oLf/ViUXNBSNhrneBPsnl9a2UxGYZHqOLNP+f60I
         e+Rw==
X-Forwarded-Encrypted: i=1; AHgh+RoTyn4vieG6x1wHQkDGAcI7hQBlJ3GGrh2PTCI+6P4WnxL7pmxAEv+t6+qutiwng5He22PBgDrXH9M5Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiuuBwZPs/njFeYijl101cG+uaaNTfXvIEB4HUniMf+fKTUrwb
	TJwDPzCgCb7ATU+atMRSx9dHSisI2qZgeoZ07lnHMlVSUFI3fMg5iAer
X-Gm-Gg: AR+sD12+FeiEiBO3W7EUSbfUl9d2ubBMJu5qDPjjdwlU62BwRqLAdIpTUVBDJd/TnNJ
	pOY3RqrUrj2/qYPgQcGnnSy1woHFI5JuPqcgfdLr+OCvyCuJUn0gIXRhjzHdpbUYJjwFY0KRFVy
	EPaCTnUIkZtpGYmfBRwRx1/w3zvz0ai7nXHkUd4FOQRxaXTsW0Gj+IWsLIIrQ/kT6Eoh+QBYlch
	Ca1/QOP1PJEM6vDQQBX9BexCGQu8/syLuRFODa3b+ir0mWO/qV5UNruyNzXhMqQRnP1zwu9r+NN
	O6Azv8GiUF26tNiooodiCA2NxpGQ3/KeSUmr/vWE6UCxMXvY95FoMPAnBC66TD1tHP78WYLjMon
	NVrmEgveRtyZT6LC0V1QtKJ2d5dimSPiz4bEL5Am1YEK/L4dwfBzDXXYw/HG1Jk82fEd5/bD+qg
	tnX0mR9TSEvv55tzK4QGNZdNrMYV3AnqN//pB2KmuU7ArSfqtPRqzmuVkz/9kuQE4oPXlVbdknF
	YoA1ML+MlQuaK+OoZIpBuGwfqkBZOCsYY3warWAyoRjJt2+CmwVOvj8vVsU6qla8phThwgiPE02
	KH0t
X-Received: by 2002:a05:6a00:3cce:b0:847:711f:49ab with SMTP id d2e1a72fcca58-84f2e006c85mr11362332b3a.22.1785993731714;
        Wed, 05 Aug 2026 22:22:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 03/14] ASoC: rockchip: rockchip_i2s: Use dev_err_probe() for error handling
Date: Thu,  6 Aug 2026 12:21:25 +0700
Message-ID: <20260806052136.21034-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 64c90316fa02..3e8d07b3fc1e 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -767,16 +767,14 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 
 	/* try to prepare related clocks */
 	i2s->hclk = devm_clk_get_enabled(&pdev->dev, "i2s_hclk");
-	if (IS_ERR(i2s->hclk)) {
-		dev_err(&pdev->dev, "Can't retrieve i2s bus clock\n");
-		return PTR_ERR(i2s->hclk);
-	}
+	if (IS_ERR(i2s->hclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->hclk),
+				     "Can't retrieve i2s bus clock\n");
 
 	i2s->mclk = devm_clk_get(&pdev->dev, "i2s_clk");
-	if (IS_ERR(i2s->mclk)) {
-		dev_err(&pdev->dev, "Can't retrieve i2s master clock\n");
-		return PTR_ERR(i2s->mclk);
-	}
+	if (IS_ERR(i2s->mclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->mclk),
+				     "Can't retrieve i2s master clock\n");
 
 	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(regs))
-- 
2.43.0

