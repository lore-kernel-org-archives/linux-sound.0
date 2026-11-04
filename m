Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800400;
	b=uIB7GUrCm66q6MayWjBuOG2YfKdaovRB6/5hYMgjda6vJZJv0tzuQ/teyUe+n8pfTE2E
	 5z6VrrQSZYkpR3v7tCMjiie1qi/g/DJAPQ4BVFWRmoJOzjyLiiSOWkMqHOEaHtsKijhlo
	 y8NYTV7uGHCJwG95uFSpOb0s+5lazazZrnesQKfiPLeZjotbsYdLthZejthq7ODkrnVe3
	 WGKYodYC7J0fXjXWNxdrbrQHPwhRiDsz6jWg0i5sMh4g4tGkvK/VK7Wg4xW6oZV/laOg8
	 C5VJzYcUXmRYGmIQKFWTIlk9H5kZyxk/EZQSdFH9bwQz+cyEJqcIUmUF4koMsElNBfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=u9NTI3wQWhg6Ur7+7Hw2oDzx3iUnpb32rYoJcf5DJsM=;
	b=MXti5cYEvWEYsbNVL77kBAh4BxK0vgkrgeliR6mSwfTjBn72yr2VBhpyUu57PTlG2i+y
	 xTs7+O8nx/xtqtwWEdRAHu91Aq+UPDNjIPzBoqxORGSWH/tauejEm4b3ocqHyMuGI2+T/
	 K6HFnsRo8xRVsXX/LiNmV3b9QY8JCCOH6OIKAH29WFtwvea8jUNnJfTfVUzbLdvVBwCrU
	 PAZL5q0vlAytk3tt6RfIDjFWV6+bBJXSVTHWwtrZ3tbBZf3N1A26saD9Vu7ui3URjW357
	 ybv59wGk3Ud0ZDOll5N5yPZlo6254kDSu2YnIVFTjl8eNhZ0XxogMW/9jHhLaqBaX5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uo+0lmil;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CF4606A32F
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 13:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35CF4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uo+0lmil
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490585eddfcso359130f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 05:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800399; x=1794405199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u9NTI3wQWhg6Ur7+7Hw2oDzx3iUnpb32rYoJcf5DJsM=;
        b=Uo+0lmil8Z3aY+bkjJ4FbHVGMdy2lUTCpIQrUNMI1TGKhOVbFWIrTB3ivU79w2NJSl
         SRAwOStGrvuPK1bTZY01itsChoe8HIpuaqwj5yzR80bmvxE7T2REafV9f57NOhkj8vK1
         juGYDHc6G1meB3ybsfoCKvO22Nxhhsr4h/7Z7INLXhIVd9Sck+0I+QBfxU7o3VdmkOBj
         pGl0UHV4NOIjYK9orlAvJI0O+ah1AJ4mODKEBoNFqzmPtgVaoJqF5/QLhOMHG4n5jAtZ
         TZirkIt/A6TTbdVrTkOgukkWJX9IXZBYLA0pf47LVU6TskSLiLFF20F+rQj+P0zN1v3W
         9oLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800399; x=1794405199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9NTI3wQWhg6Ur7+7Hw2oDzx3iUnpb32rYoJcf5DJsM=;
        b=s1SdkHRdy93US1RTHh5rrqBIlqZc7Yu1muNH3qbhNoC5+yrneqnH42L3yAUhVPOzMN
         1mLk5NzvH3jDYzimxozVOBYYy0GRzRVgnWE+hauRaPGsMy7JfezPAXoqDEaDybz/TMy9
         yIebhdsH5pRq834pridHR2tDjnH6tusFv3kodOKWKvoQ7xT0wMovk1Z3+QU/i44tIUwN
         TC240LqkNiehH7a0/2lYa+SLEC8IbitHn7FkIicEf59lYOyktVlmv+jgq6HuZnGDUdHX
         rUJUWy0nMoeW6hPnVTAc1CKuS2lI71deKaEvvZhxr8O5nSwQ9xnNa9INPWcAh5wFtmQ7
         O3PQ==
X-Gm-Message-State: APuU4Z/0sKlXXBuvl52RnsFua1D9uRSystEh6WgcMyTiX3I3aq0a8yBd
	5QuSijMoJYYacctXR80ms/i5O1O3P++j/tkLKV4U0mzySxVxbNuWdDaX
X-Gm-Gg: AYBFou08C2RnHPdVISYvnXrnAgWkeZP7w9O5oikmGbJ57jYMOMfBZj0/HZk0BAfsmzt
	dRndc+Ny8TrOSbVNmlG0aEnNQbe2ditZx7PEp8XlAgumG4+PrEP6o63XK1XFbepbEN5JGBpkQsb
	5ujp0WY4UrICeb6W6kQj/2yORhPQHhA5jt1icPqF9/UjdxcVqS8zBOn6R6OinmXwWFyEMWA07BX
	euFLmPkKiawA9J21yD95lRT01w694EdMiUo3XXgtBRX+pzJB9LXpTPun1HMxoY8bpehBPcJHTn/
	aEy+ORm89+JpOV5hfuADgSuPjAPx/gFUfhe2RV1ZRcjwLUtag9H6BpvsB8CYAEvoK0fSgSGDC/u
	/gLYnMPDqOnemtfuK4Knj+DJybiF/sHExvxn2Kher0Rrqmr0odqtIotR7kgEK+1ZtBQovZ/uPWl
	lPmy5oh57Xz10gJoXKqzlxx6rPHBfEn4exGX7Ksrmra7r02WJPACyyGl9DLLS/r2+FJOjt+F3H7
	Xg3RJsgWYg2x3j4h9K23yp/fWKVSvnmEKloCEj/sKCWwGXcC6ZcuVsgrD04xLoftK1enRcuJTgH
	aaMbGVvo22dh67LZz0iaa7yYNzp229Tq3bkky8PRBV9THhyMjUYBDLgGrFUNt1U+Kgj94rfH2WE
	PcXat2jmLPpWm29/+2ymaX9Wn
X-Received: by 2002:a05:6000:4914:b0:48c:69b3:610f with SMTP id ffacd0b85a97d-48e6e5008b4mr34049088f8f.26.1793800398437;
        Wed, 04 Nov 2026 05:53:18 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d88e1sm4160971f8f.15.2026.11.04.05.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:53:17 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH] ASoC: sunxi: sun50i-dmic: select REGMAP_MMIO
Date: Wed,  4 Nov 2026 14:53:00 +0100
Message-ID: <20261104135300.3723057-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
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

sun50i-dmic calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  sun50i-dmic.c:(.text+0x142bce): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave SND_SUN50I_DMIC
unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SUN50I_DMIC=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 9fc2c8ed923d ("ASoC: sunxi: Add Allwinner H6 Digital MIC driver")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

 sound/soc/sunxi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sunxi/Kconfig b/sound/soc/sunxi/Kconfig
index 205f422d9ded..c8a626396e9a 100644
--- a/sound/soc/sunxi/Kconfig
+++ b/sound/soc/sunxi/Kconfig
@@ -58,6 +58,7 @@ config SND_SUN4I_SPDIF
 
 config SND_SUN50I_DMIC
 	tristate "Allwinner H6 DMIC Support"
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M to add support for the DMIC audio block in the Allwinner
-- 
2.43.0

