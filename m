Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147200;
	b=ci7pFSKkQXefXbW2qUxXxcOBSzhvsQQgbQQ7hJyoVvI+EmJe7JB5VyDfPz7F+aWdJtrm
	 b5G35K/e0PYmsT16L/IaNq9D7bPaOsTVyxjempBz+EshWS+aSwW5S/+scCiKaAd5nBUku
	 OcU+94b8BdTmErn9/IeVI2y0xr4+Yuqbq8cnb3QfTJNnwOH/VZA9iAcgJmhfA33Dhasin
	 Lc5t6Gg/ONpy+Jt0g3imd3YXfKc8ICfs7p6xiCd2la+pvws/pnk4UXpA6iycU8okQvh1v
	 54KLT+Cbkk05/ACzIuzTkhuMNXad5czh+rccn2RYJB7xp2GS9GSmCev8U8jx+rV6uog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CpA5O4wyUxbqGe+dCFjBVccndMPCv3b8o+hsoVqh4pM=;
	b=ZposmcKGSylIUn4YRI0nAgXAZPFHUedlD8iLvu337+HnnGLJssPW1+VvdPVSZcIezvHi
	 6RLIyBJyMEdT3m6SNnwJ7y7JUVVHMnq6iSYXavGXg45//8qMsh9g2m8xsyngay2ZV56gy
	 jzmg9HabgF8zDLmPNTGMm9lXfC33U2++d9DGXrvf1P/WL8RoVOevagjWPB/1kSnh6I49c
	 +NXAKHCsb1h47LsEdgCt5+EuCBEJP/5yHtstuf1boW5HZwbZIgNfgic7tYbojeIe7Emiv
	 vaLdL1jb1eLN+c3aFhkETwg/7GGLmtB4mYMluy+WvlShvRD4LjrkALuHQfRYSmVxIxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pv9tEZFT;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7E6606A332
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 03:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B7E6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pv9tEZFT
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso2763985ad.0
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 19:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147199; x=1795751999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CpA5O4wyUxbqGe+dCFjBVccndMPCv3b8o+hsoVqh4pM=;
        b=Pv9tEZFTlOfAj6PbvGp6C32fm5LFFqJO/T6RHjukvgU86yMpRPRomGOyjxNHHEA/m3
         4/5y2hMUew54Vvk+lyRATXii4GLdpAmhjIMt/pis0HHU7aMbGiaA4Bmxk3nHn8ro5cQb
         D0Tff6ZDs0jG+RUwuXQOWChPlgNqEBSdWV70drN4a0KOgoejiwxwctXytEsLIa9Gzv6u
         0tl2hd0A/wAku1xfmdsGRzoani1xTexThyDrCzmuLoCYM7YVFdXdeF1/hcLJnVFuE75W
         EPKM2kQ6qyz7b6IxHJvyi2QpMmatMNcxt/9XeLfItTYrFxyA3ho+EQ50FuMGq9TRFhHv
         1zGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147199; x=1795751999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CpA5O4wyUxbqGe+dCFjBVccndMPCv3b8o+hsoVqh4pM=;
        b=ByqaPC5+xkwP2kpC6HZ8ETqgw9gbDXWX5N9UXNzqYmCD8nQ/tmQNEF2u2nwbwK1hji
         AVsKsXZSrbbJQ7GlKcrsxu+SlK9jsJ81JToPuYuUr8JOcHD+1GyDd4+SrIKC/zI3H4I+
         FzSekkA814OwxW5SzTySj0mT7zqZsmcpTkNu/0BAHSAKZDXYng2by9YqrMEABVK2eG9I
         fQXXy3FLawtp/pBv9U9feBxf2GEGC9iOiKvgfiNCrOtx8IRZ4bRT4tiAQwDl0Wu8Tdkj
         KynaebMsO14vQiZ5iUWqa//oTWKSgwl5/fcpzvK9Ir+F56kNNYnJDFj5PHXiS2/GJ5wp
         gwpA==
X-Forwarded-Encrypted: i=1; AL+hErE51XOFS9RkwuCuux4+ntqd9sRPKwSNivKecw8JkfpG356pDRBcoL+UxATnMN4A7dBfKxqQcWGbWQQpJQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+pbKftUAlsNFyHtOP8iGPYDbnzJwgi+SsggWq7J/e6+L9cKt+k
	0kXGJet02nQyFISwGXYEueqsH/BjD5xVrnZYVF10pCGPNNg7tcqp/BnF
X-Gm-Gg: AZFdTZdmQEUrldL9FaTdZUmH5JejXRXV4Q5pUcfkcOVQcN0BdCYSgN9NMVOIxha63+m
	/hRFw8WVsWRV06mOiBW8Qrtfi5N01lyfuWSGkWOpie3uuoxtnhQp85KutTsCy/v5vzxxRuRM2UJ
	Q1+5yBxxnS+VRpnPlUqTUK7w+WHFJbb8LGAsY6srqkYkWs8Qt+e4kCXcgRzdC6sKKOBRdFlPenl
	eD5huHN9U85YyPpG/vF4wIGKYj/8vuBQ5CL++xqq+y10RGEM4t3ZrgtoXMhCG/F9JRRpcj1DckI
	6Cnj66CGQGkeeOpWrHYR5VHgmh2/5oeTaw/ZtN00Q0XmXZnEt6OubZYBTbrv8C4Krf2k1acanS4
	zTk3RxBG+oeEh8Io3WvezQI/8VXnFWRpUmAMXR0TLDDKLJnYkmiswJJKURmtsJx15HqN6zDyJB4
	IcSYEd0MWxfC08ONDsXTkWIiB5rHbaRta0TOtlRkoMjylALChxbT1vY57XjlZZxuLSy0HIlTsWl
	rKaqcxr/Oj0rTak2LA7k70Z8ZNRfjOZDbnfREVsnUlkgj6OTpaOR+zOGeXpxkO8c9FGvgWiefRT
	Zs2cS/IxSKc/ArYDp7Y22pe8+JIaKDT/7ke29KlmBaiZUPsG2bVMefSrELp6ijG+WfInyQKuWO4
	ey8xDQTBvB9aUWnwVjL+a7aOSkCwbzwCy17RI2k78d4ED
X-Received: by 2002:a17:903:19cb:b0:2ed:2afa:9221 with SMTP id d9443c01a7336-2f03f1707f5mr19772845ad.27.1795147199236;
        Thu, 19 Nov 2026 19:59:59 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm7801115ad.63.2026.11.19.19.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:59:58 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [RFC PATCH 1/2] ASoC: atmel: mchp-spdifrx: Fix 16-bit big-endian format check
Date: Fri, 20 Nov 2026 10:59:38 +0700
Message-ID: <20261120035939.12774-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120035939.12774-1-phucduc.bui@gmail.com>
References: <20261120035939.12774-1-phucduc.bui@gmail.com>
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

MCHP_SPDIF_FORMATS advertises SNDRV_PCM_FMTBIT_U16_BE as a
supported format, but mchp_spdifrx_hw_params() checks for
SNDRV_PCM_FORMAT_S16_BE instead.

Replace SNDRV_PCM_FORMAT_S16_BE with SNDRV_PCM_FORMAT_U16_BE
to make the format check consistent with the advertised
supported formats.

Fixes: ef265c55c1ac ("ASoC: mchp-spdifrx: add driver for SPDIF RX")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Note: 
The SAMA7G5 datasheet does not explicitly document support for
16-bit and 20-bit big-endian samples. This change only makes
the format check consistent with MCHP_SPDIF_FORMATS.
Hardware testing on SAMA7G5 is needed to confirm whether these
formats are actually supported.

 sound/soc/atmel/mchp-spdifrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 632da8d7bc81..06a2a5a90a63 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -455,7 +455,7 @@ static int mchp_spdifrx_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_S16_BE:
+	case SNDRV_PCM_FORMAT_U16_BE:
 	case SNDRV_PCM_FORMAT_S20_3BE:
 	case SNDRV_PCM_FORMAT_S24_3BE:
 	case SNDRV_PCM_FORMAT_S24_BE:
-- 
2.43.0

