Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875413;
	b=ITT4+eLBfAgQj4LOGxn/HPCrdcIPFoH3TOgubFPFggxUEL2wvS87V2X4EQxsFwREWCqL
	 g2EDeM1VFZH8yZmyJmZBQ3cG+MJBiXcDyrcuIYB3B/b7tllbs9xIXtnSudE3zsT6LL5Eb
	 jsQYq2D6d/BPsnm3Ck2H24DsSdwIbY/4yMfc2E5r+P35B8d/+d6OvcpH1WNPdHFp8lxcS
	 WUSL+mcFQu+W/40grPdnNkw2h2bieGPaFqpLRsJNxTrH/x1oVyaCI4BBQW52v7jCGorKc
	 pcXHgkjx5/aZwWYVZGmAT0TGYWSd1faUEADkdAwmsij3cMWCiQQO4wSZxoXW2EM8gHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zEuTfCcCze6o8lz+tPI92UoFysg4iqRaW2ZEcUe6QAU=;
	b=2XD/DQyEezmNkzNbLcoDNoGuTPORjCsxXssoEK4+KKeCrFJWSNb7ECjU7tFw2GhpLPph
	 wrRMUiHJiQ0NuY0FJvZLf96z2Wbdgfor0rzgFS/rBxQzN43uyYaTJ99VPTFWLqzUY0Npv
	 bBUCHSuAhav8iTRvnklsMKhhh0SDTLLqLz20gfsDnIhkEBDVudcIpTc3mQxR+mne/BiOR
	 p7vRkAAB0DL/wDHoal6W9LIJlHsFmtmlBwZj4x27KxjBXnJINXcSTRvDBoUJbeet/mMXU
	 bwOYAdw9rzaa9rQ58zkO5JWvWXgpWtMv4v/R+lB7DC70oF4sor/k+HxN5IHFW3sMFKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FBZNublp;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75E5606EEA5
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 10:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C75E5606EEA5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FBZNublp
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b244fb7fffso2315750c88.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 02:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875412; x=1794480212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEuTfCcCze6o8lz+tPI92UoFysg4iqRaW2ZEcUe6QAU=;
        b=FBZNublpQhOFNRZreAGAfy1sHkxBwdm8FB1Aggl9tmdRO/B+FvbU3aUEcWl0SJD6nn
         +KgBCvhvKVEws2SC0QGaVN5Hualf3RMaxCGu4I3aGZIOjiNwxwCOJa+ioSIH1uIhBZe1
         edhhcVfartiunN86N7+WFH1HQxk5Khkv09lypQXaYYd5oyB0pr7jUUC8rjjZAROz9nHz
         4ZIcXrCmehhg049C7ANF5aLRY0zM7fvJ1EF8xWoa0kQxln6SpjRP4ib7E2S1XgXd8wWx
         wnOXhTZETTITYd8VRHDFF48IorpluFm4ZgJDCesCyCPYeIECQvXLMzRHdrNzrwyIm32y
         a4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875412; x=1794480212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEuTfCcCze6o8lz+tPI92UoFysg4iqRaW2ZEcUe6QAU=;
        b=pNY/UV0l4ekRZPiWhkRl9NtV0T4zt3pYgqpTwdcZeYHtaNYI4XuvZClLz8Hx2qKSAH
         7Tj6Qp6wtNRQFNp1qtRl6UXvIKMnxuGcTMsS9eTtdVcO07H+3Mx5a4iEGcy/3r+fMh83
         SbqOHzbZg0S1NX10usbe2BiD5uMPPxN3Zyhsrc2JxxySSy/cZ5ewgoLcwvBMxZHSiCdt
         Qy3ZdBSqFdxREnAsKVJySeLNTlL5mbz4Gb8rCP2eUUUjVsnF4oqeGEbROYL3iSOytkhp
         qay0ykNTfVE8EfOsl7En4pC0OtYB7IhUjc036HQ6AyoSbKVkOtfu8DXm/9AaDVZXfqwF
         v5xg==
X-Forwarded-Encrypted: i=1; AKwUvBwsCu0B93L0g4MERXRF2lNr4TzL0QUxZRPA+eL7HK0Rbw3bZ+GHSB5AnrteSNJ+O3bJ7oMi8fCGh9imxQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8y432UuoX5asaWqAuo4sR1glarI8ezMnoUP54sT65K0mS0lsfz
	TUmiMGAohjbI+AgUjfmozZNjdWcXYRp+Pb0uxWovxdTm3eVMuk/R6qMx
X-Gm-Gg: AYBFou1hH0kypG4nfFOZ0NCZVSd0oS/F9otj6rNghs7cfwYDY2HqTdh1qNyzMePSeko
	VSHIk1LkGchODzb37SQh61T6COXCxU71OJkyd3OevDNCNAdja29GJUvFOjUL2chcuofd9Rr/dj0
	b6wstcnj3zOobhzJ7BAcwR2AKc8xwKExhC9KzRvJpZ3aH9kbiKdt7flYaIzUulfnkZYy/9LXVWY
	KLEPlvoDrOxDX5si8iofzm9gEpjuJShjlHornvLhxeC4ttXEVwcGmmrd6AO/Z76JA4WkFkTRdi0
	/Rqp+W5BDNknJSpVPri24F4iiqoMqH8L5iBL6tOH4qTMqms0Q6mefFs4CquRAq8HaNEM1Cx6G04
	/Vw1Y0ZiBKnnhICugY+vS2H+gQFwSjw5DF7uazpQ68WOezaUMWY2stlxnbBOpwKU8M4Khe1G8j5
	1teUH7wICMDF89YKrL62hQginl3gcio11CceOaQmhZ2ZJ2N4huEvSq8msEZIvDbvkwus9Ku6BAX
	xnnkt+T6tGBIbwbaESFLdL9J8RG5b3XfPKafN0I96LnMkxc0ucGsqPHVsgeF+67aLNpVOU3vKUa
	Jp6EIMapmA5yjDMftqt5x7im/Xq3vjoZGf3+JlCbXS0zcSnKGWubKIYbIW8Zf6iSXHiTdTeFRt7
	afw4NMWPRoj2cvbynM2Js6VyORzdLajVVR7EL7ilovUvr
X-Received: by 2002:a05:7022:ea56:10b0:176:a225:e364 with SMTP id a92af1059eb24-1ac5de547afmr27758584c88.35.1793875411693;
        Thu, 05 Nov 2026 02:43:31 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:30 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 04/10] ASoC: fsl_sai: Propagate device tree property read errors
Date: Thu,  5 Nov 2026 17:42:31 +0700
Message-ID: <20261105104237.38542-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Return the original error codes from of_property_read_u32_index()
instead of replacing them with -EINVAL.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 5532fab80be0..cb07e7d13132 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1495,15 +1495,15 @@ static int fsl_sai_read_dlcfg(struct fsl_sai *sai)
 		 */
 		ret = of_property_read_u32_index(np, propname, index++, &type);
 		if (ret)
-			return -EINVAL;
+			return ret;
 
 		ret = of_property_read_u32_index(np, propname, index++, &rx);
 		if (ret)
-			return -EINVAL;
+			return ret;
 
 		ret = of_property_read_u32_index(np, propname, index++, &tx);
 		if (ret)
-			return -EINVAL;
+			return ret;
 
 		if ((rx & ~soc_dl) || (tx & ~soc_dl)) {
 			dev_err(dev, "dataline cfg[%d] setting error, mask is 0x%x\n", i, soc_dl);
-- 
2.43.0

