Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545698485
	for <linux-sound@vger.kernel.org>; Tue, 11 Jun 2024 02:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718072564; cv=none; b=kYuDDaEP1VfL836udERUpp1vL6QfO+XsRaLHy1twa3Fpi/i1CALxvbQn5qoNoPl/uhKJKJ6lOGycRRRXkoTI/H/R3fDf23FMPaT2bT4YxOGVj8NZqHwoa/lA2IGXOr9JZE5CT/sjeDAz1HAhm6JX7M5UslLbOmtD3IslFOZz2Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718072564; c=relaxed/simple;
	bh=cGVfdVYeHoF7ee8gZPI99lAdeF1Ov4eltP6J+pZI2UY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pOXbMMkEfmHgY+m5CSjgaJwbPon80JcPSJGUbYi9BXLAXdsrlz77dl53W81PeC9B85Z9OKtMNeDBeDu1nDy5sjUaGYMzJZJuDfshlWYCLFpM/WFfCnysIw9n2OBQ5o5a6CYxUyMWHR5NDcYnWZ8SreIBfKlIpziqgKwOPEmNg7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=y7aNDApD; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="y7aNDApD"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c9cc681ee4so298669b6e.0
        for <linux-sound@vger.kernel.org>; Mon, 10 Jun 2024 19:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1718072562; x=1718677362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rOWiDGoZ3cg9dnynIRWTsyteioX53Ouu76F3VV4WZDg=;
        b=y7aNDApDJ7bHaeBXXcBXwUjPat8I2+0gcbCkgNPIE6YTZI/dwp+fvGjy9qjZamkt4v
         jWvmwm/EMBBb1qfvPSW9HedLqj1gmqXQ8BI0JrmA7te9SEBEKrHL8V3zZcVFPA9PWZCB
         SoYgYFgaED9NmBDFnuGgFOIjaUT/2cFV4cPLJRVdNuKvDhpy5JAccycMsFL1WBEtP3kq
         gqRXl0YyxcMivI1pCNXbw9yMNuz+qF7LMZfxjynzdbrXloRg0d9aGvfKO1qW2zXsRNgl
         nCRTI6Sc9MoGEmJRavPuI41AjapJoh6ypwgHvM5S1yD/XL74MFE+kZLJMfzoZaNqkSMz
         +MtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718072562; x=1718677362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOWiDGoZ3cg9dnynIRWTsyteioX53Ouu76F3VV4WZDg=;
        b=hFM8lVuC8Wn7zKbQj51PiPZLSjyD+noFy7W1rsg/Y/V8gAOEIv48u+I9B565AgZIyd
         ieZBltYWpeXR8fMxmtA2V66iGc4HsdWnAH78Ag3378ckpkD+8wX3V2pF3JL9jOLoMY0L
         Az8fx9YHLARJZ1U+AyMaBFWiJLsN4pJY/pENYMjUWJCxqANRwfyeuniCDkUMLvgjO8iI
         iQ3mz+B8VQkxWJ6LU/MfhindNTwm8vvBOvtrIKGsxVwpXMrszxpyyGCABzzUN/xcFjJy
         nWFYI4YbnQdEl8oELKkapuhW+gks4iJNT1dEcxE6qFnyoS4mE0Zd6Z3nkWs7HcJtUrI4
         c94w==
X-Forwarded-Encrypted: i=1; AJvYcCVrd2sz0dGsh4rwY1sZBpJtD1SA7Vz7JLLm/RyzESJN/eAmygWIeNiKdjzVnpvtUX2AUW5T28moDgh1sSq4LljNFw4rZgjrJCu3Qwc=
X-Gm-Message-State: AOJu0Ywu6bdU3q25C/DEiGooR52DjM20v5FC8yHNOPbCtQGR/b9RcuDq
	QAwuwqVMPu7q9kqSoxYH1zJu5KSDJYpxPIaAHSvCq5HuSqqKMcrtNH6ElhHZrxg=
X-Google-Smtp-Source: AGHT+IH54UnImHOBfDjxg/a/aqysYcwTv7IDKcLuDx7VweoZ916Hrr9pYkdYYvKpgl1/Gy1pVhimIw==
X-Received: by 2002:a05:6808:218f:b0:3d2:1f88:3e7a with SMTP id 5614622812f47-3d21f88464bmr9449264b6e.39.1718072562390;
        Mon, 10 Jun 2024 19:22:42 -0700 (PDT)
Received: from zhou.. ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7042f5584e9sm3953561b3a.12.2024.06.10.19.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 19:22:42 -0700 (PDT)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	trevor.wu@mediatek.com,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: maso.huang@mediatek.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v1] ASoC:  support machine driver with TAS2781
Date: Tue, 11 Jun 2024 10:22:27 +0800
Message-Id: <20240611022227.2508354-1-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support amp TAS2781 for mt8188 platform

Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 5a8476e1ecca..07f67f96c889 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -233,6 +233,7 @@ config SND_SOC_MT8188_MT6359
 	select SND_SOC_HDMI_CODEC
 	select SND_SOC_DMIC
 	select SND_SOC_MAX98390
+	select SND_SOC_TAS2781_I2C
 	select SND_SOC_NAU8315
 	select SND_SOC_NAU8825
 	select SND_SOC_RT5682S
-- 
2.34.1

