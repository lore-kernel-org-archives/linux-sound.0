Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11F742E419
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 06:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959582; cv=none; b=K7pgmH1ygqnykDCE8JMY/RFo80rpqtbLn3riuQWDJdJB3NbG/bJnapYSal4Cn2xQEDURyrSTqMmZfn31e2KQjzpkxpFxgFQWYYFVo8J942HFh3+dTb1rhiqYBqVB1UvCaFHVmu1tZE4qYnADZZ3fn1UfFAADG6fDRwK/hIg1WlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959582; c=relaxed/simple;
	bh=xxVW7N8Ua3Mc+UaVlqa96Hyoh5+xLewb+9Uj7IaPfzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oGUvZrZ4kxmI1h4LJcIBijWOa96/pREV766YZGPx+BrfwwDH59ukwBWXGIKaOj/P+VG+0n0VafPiwNJsdH/A3EhnJshFPfLNTWhf8UQ7w/42f1SHEejb4LpQ4qAexUDr4rT9uh8dPUWL10mwss21rnfAXJoJl2Gi8J00vTGxbcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=artyRKt3; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="artyRKt3"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab066bef7dso30923a91.1
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 23:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959577; x=1792564377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWRCVZZ720VVLLC7FnNB4vKZ7B0W9tQEirvbm+Acavk=;
        b=artyRKt3QbLQaZwX5i9I3uoyQ3AAiPeFiOUEM4gzrl/rxPWdu6HIFpYCvM1/kbSlob
         w0KrSYEaM4BXkSgTXEcafAhwv0+GGG1YpkdpKdXcMLHEtscfR0wYzDrV2rptBnyY9Vr6
         Gk1+WQZBRHvXti4j/E7gpp56zYBWCNl/5C8xjl6PxGTscCGm6nstfBwQKtp9jlfF3Pzv
         xvDcR0SEuNBvpAHDu1/EeFYzrnR78ajjJMDi0rV0+Ij/M8KYzyTYUv/xZO4GPbVcCo/+
         N2Y0eMQUoo2RqcmaOHx1bjHst9Ad0aV3cWorhXJfiDaZ9WK1VCr3b/NIhOmheDLKMd0e
         lo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959577; x=1792564377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LWRCVZZ720VVLLC7FnNB4vKZ7B0W9tQEirvbm+Acavk=;
        b=HtDGydQKEjn6ksNyQ1+pkQtYrPk8n2fAFskwySmoYbMW5HoFO7jDBiENalhjAFNuep
         +fsT3qIADZXCKzkgKPP1SlGQD47FT6c2L+61fOt/NUz4KoTKBb7yVFCxOZBM38lD9nmK
         CA4WTmTrCHXifdKLNu5UueqdGswXMzy8a8d7OF/iyoPvYEx7zyJCJPoMDVnaN0jID0PY
         mm3ibY6pE63eGfA5yAUfKzDPu1ptNC1JLxzoJ+nhfGocQXnu+esbCmCaEFWvLY4K8jy5
         eGleUKDAx9hGbz0leE5rH/hbVMlcewBXWTMfNe1dgQlSmXf63bVgLwhDvXLoSJ/16O5+
         UEcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaslT/V/oDfHYHPgcOngKRzOYq9iToMWlt/4xhlqLnoDCCMGDtVGausmExFhLEWQ4ksd9O+N64LSbmfA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLJcYRnpQHUFcz/nRiPwwqo0yZxMOEiZtn0s8chAjKneb0IwHzb
	CiyRBuBWdi6Bq2TAOcEp4FveFDRjKYOYqOc7FjgRFv/oRkrgLtsCcB5z
X-Gm-Gg: AYBFou0OY0Zo8kN41KqbFdodMoAXf2jJB/7ve2tIzBZ9G4kz9VoF3hhh3C4i1gVhfMI
	b+jGSwbprE/tyhKPmfab59CmZectHKLNHKtHNYn6L2mzdlEizmEThTcB24PfkrjH0HxduWSKVV9
	+9uAs9dWgHbGIcFbWjZYha7/xVVWNtjuOJjl05EYQl2yReB2DkmQFDYerz73zAzM2uU32poqqGj
	/UesE28q+tu9FlZf1RwU9PRQDxGbS+ZvpQBWHcPca3FgwUGB8ZhYD/wl3a8ySY9VKAp6EOrpo3+
	YgvTxdrB3ZD5ycocRvc2sQGEE841357qt4LKiD0u0xWxFldPIeiDHBLBUl3Ixetf8ysEO2S/lS2
	9z+uGLAql8/Kpg2YdZV2ioiZtvsj3JSFauxDvisJjUVaxQf/ecl/mOZMCD1p35FaWSHEhInpT5K
	903kq+D7AyiPbb3lJMKm3FlgAk7OgarVdOsIYQ/pvaehVMVqkBuyLB4TDwPz9fw/SO6IKsaQKGw
	LRWmuNkN4IkprXHNrTRPoY2h+GS19FGWpmq2MYUz7aRw0IoVNdP42pji8QxgCC1vIlQrCFMtgk=
X-Received: by 2002:a17:90b:2681:b0:3aa:ff61:9504 with SMTP id 98e67ed59e1d1-3ab3a9127f1mr11592708a91.20.1791959576587;
        Tue, 13 Oct 2026 23:32:56 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:32:56 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] ASoC: codecs: wm8991: Fix definition of LOMIX AINLMUX Bypass Volume control
Date: Wed, 14 Oct 2026 15:32:31 +0900
Message-ID: <c6e230b0e7d7e3db2136cc751e0b563030dbc16d.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LOMIX AINLMUX bypass volume (LLBLOVOL) is at bits 2:0 of Output
Mixer5, not at bits 5:3, which hold the AINRMUX bypass volume
(LRBLOVOL).

Fixes: 203db220718c ("ASoC: WM8991: Add initial WM8991 driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8991.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8991.c b/sound/soc/codecs/wm8991.c
index 157b48f02451..471310257123 100644
--- a/sound/soc/codecs/wm8991.c
+++ b/sound/soc/codecs/wm8991.c
@@ -184,7 +184,7 @@ static const struct snd_kcontrol_new wm8991_snd_controls[] = {
 	SOC_SINGLE_TLV("LOMIX AINRMUX Bypass Volume", WM8991_OUTPUT_MIXER5,
 		WM8991_LRBLOVOL_SHIFT, WM8991_LRBLOVOL_MASK, 1, out_mix_tlv),
 	SOC_SINGLE_TLV("LOMIX AINLMUX Bypass Volume", WM8991_OUTPUT_MIXER5,
-		WM8991_LRBLOVOL_SHIFT, WM8991_LRBLOVOL_MASK, 1, out_mix_tlv),
+		WM8991_LLBLOVOL_SHIFT, WM8991_LLBLOVOL_MASK, 1, out_mix_tlv),
 
 	/* ROMIX */
 	SOC_SINGLE_TLV("ROMIX RIN3 Bypass Volume", WM8991_OUTPUT_MIXER4,
-- 
2.43.0

