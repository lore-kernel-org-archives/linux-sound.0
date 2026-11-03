Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691680;
	b=N18G/WqSXS7ptoBeA+2LhADAdNrZaiqsBmpZsfp7ub4BaWvnwCaIw+GBQyJPNqA4xhh2
	 RkYH2c1JUkzqoj9dNmmQZ69TiwL/EGIroFcodKQQpZZe5TKGCa6LInv8T0IWa5CKrYenO
	 fLHfAePr/FCAqgciw1n9L/UfKq+H7GyEaSNhkg2QM0uwk4+a4+abf9nsFkwWH1v6TuVdR
	 3cwur6klbOysToi2LuDgt8E4rXcW84yHgxsFUtlIKay0cVtwBc/45Ic7c7BhxhWcijER3
	 +EE4vNTIoFzKJ9KGFLMpp1HtqkjCCLAnrwrStRQdl5IrcS55ZBxWFtRPeSo7ukZin9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=;
	b=LteOdZmX1wtVYp1y9UE7GPTEDoIvOr4XDdVsivzGb+kZlKjttyYIW2lg9tYQVyhAp3Mg
	 gLYKsYL6TTvfsFoetC22YVvi/w13TtGirWWhhQaLgBhbHnxYSv20lFRwrgyHaVzczVswt
	 DvQyjZypf8K0bACK4PLyvmWjlYqqVaJAp8qqr0zjZJ1IXQaipgs6voaHdEpwh00l6aR2x
	 kPdgYLz5K2fxFefv53H50XLgwAEty5MBgZhYwO/9CfAq0LbivNYMLIimkbZMg0Xq5E5EA
	 JwGZe9X80QMIiPvQCy6tdrbRJDfrBL8dTHRYisxFs61En4jT0Ky/znJ64vybGyK1+2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bliOVFYw;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1175F606A33C
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1175F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bliOVFYw
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so1829488a91.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691679; x=1794296479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=;
        b=bliOVFYwq+YgawJHDEA/XjkMNFWU8so5SsslWlXx1+oU/NNmf+023ioIxb7NS9eCcn
         XZe3GGzLESi/TXSDcEUmvCECqWyDeZYzJKvC2tDcqs8rb7ZBx5/4kmtD/tyv5l6Tme7N
         mMq+vjxLLP8iRWGpBDpyGvIkD3wxFGsT3jXo7jV8a09brSudb6vzy1Uj44oqAmSzWR/1
         o1dwAjLkNeYsOvHD7fYqc12lnjcceDCwOjgCpVX8IU6NB/5ucfKSkIraSk7pXZVXJJM3
         trJwvyr5hgPR6FH3O3glK8xidNtKEmBScpGsp48Fg/BcZRQOQlXtYeg+CaXtzr7k3UpZ
         TEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691679; x=1794296479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=;
        b=G2dU39UShGl+WDH2t5aqGKCNrYZnpAHsiULFRNAHZzCkBrWdMTzClZA6MkmnPQoDrT
         HLkl+/CcEC229GxM7ir8t7a3zxh3qO1V+DRuakxE5aaA8n1ZoZ8NqSZz63SpnloX5RRJ
         uwwpom6pNr+bfbr/rxN59ZngHWmoPYbNm2EsLTvrvYRd4xLFHjUaIr7uJAXSlfN+wIVU
         FsZIx59gLyinTawsIQMnIk6DPT9qAnJCQ1PFmBDfkl8qKuA+kka1FU9JLW86bjWCQSGN
         3Vcxm7oJujig3Ku3zkxwtT2N2lIIciTJySEQytEA+MVZq0s+iZUpaUfIMZi9FTAEXLGU
         Iokg==
X-Forwarded-Encrypted: i=1; AKwUvBwMQpdCGb00xYerttINkunSAlP6BlFBqZfvLo3VEjwfI0eAv8blIfWTwtB80vqaDGxuUOFYgdP6PruEdA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9DEjB3RfsnZOXYj7u00Ut3R/646nwavcu9qh2l/NZFCDGJ0U1G
	vS28us4EVgEyQyvkMYUdJOuUaeg6za8vkz/+SiFiVOrqTOfNeDydfgXl
X-Gm-Gg: AYBFou1FdMrdSMmg8YHPILBKjjKaHjBGWK6R8/Bvi29DgigPB74/aayBPDZdA7sDlCr
	iFht6DAcpUumA6TDpEeGOh8mWSoHGBHSJhNc7LSxZ5CQ4IUEqF6BFuxeQrRKvnidgpVjsDTRNjS
	xN7XhfguxRi69L3ZgYBjEOGYHOeMmZIKEdgIRWNRFDJBPPMzcgVGyY+qANM9kzhqiHndHXWT7e7
	ym+HxFe4mZbUKghkOW+AVzBeUk2XsqCvp5D7ks2AqOTlwpyIW/TrmUscdZUnqYFWMrqEwXnGP13
	7ha2psIpuA2H3xnUF5MaE4hmkZ4N1ZqVzuraVF1ahPfqQdIld3KdENMUxfTiCVWZs108iqbwDyc
	emxLsCl6LfzcrIUn68K0GJkRxFOMkAQygwX6vcoYNbxd0k0b1T/3l33f3v5UIfwgOA6S0cUYpiS
	PSyFmAGxFcQ9K18qOHwVoIkes4/Moeim6m4u9SIf3h9qOH/HmqbNnrSFA2d0HrVuQ9Q2UlXMGKp
	+WM8m/9MH95mPd2dJTH2gD/O1CH4LL1/0pyCURykIHWGRCwxdykNqw8hnH7ZSTqjFSTvzZtk2uk
	8pro7skKPNShHcuHsNjoPoCbgoZzr8d6iwH9qoIP765Ody4LQkrYsDd9S67+kiLG+nkX1pqxeRP
	dD80Qgin01sqoS2f3sIVqFitjY4W6LQVS24Au6Sgg3wYGlquznGQJMWlMfEOcUf40DcJw0UyOlV
	fduVE=
X-Received: by 2002:a17:90b:1d0a:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3ae897f6e87mr9311929a91.44.1793691679407;
        Mon, 02 Nov 2026 23:41:19 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:19 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:56 +1000
Subject: [PATCH v4 08/22] ASoC: tas2770: Add compatible for TAS5770L
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-8-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=758;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=69WolvDz8NBwzZIcSNN8FfeWXOxg6F1Zc88rX6gr6IA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/JT/yQMm+dq82UlFMPTp/2dY06tJip9pvC6e8Tp
 nCaxhnc75jIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1TQbDf5dT0nnf72fPOLBj079/H7k1rpdmX7u6dl1j6XIjR4djR6oYGXqmvg1
 +8eCK2cYJOaER62doThWo8+3ycjEK+na7YN3RfVwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS5770L is an Apple-specific variant of TAS2770 found in a number
of first-generation Apple Silicon Macs. Add a compatible for it.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 67ff2dd949be..57de75115450 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -987,6 +987,7 @@ MODULE_DEVICE_TABLE(i2c, tas2770_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id tas2770_of_match[] = {
 	{ .compatible = "ti,tas2770" },
+	{ .compatible = "ti,tas5770l" }, /* Apple variant */
 	{},
 };
 MODULE_DEVICE_TABLE(of, tas2770_of_match);

-- 
2.56.0

