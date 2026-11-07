Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070553;
	b=lY8sEdnW5knxTybyFhQV2gmA0CKMFUB1z22Zb6OQpqwHAtpIPsZDYho2apEX66pZ6QXl
	 XIyioOjOUwaKY61oce7ApTqEa45S2j8mOPxCWMlao36znk5i339pBYZQYlFbABwot8C5I
	 wu//dOn4qnsq5vczu/kgmiduM09Jpav86D1Oo5fyvAEMZb5YXNvfI+PrfsmGAlV0ACLT/
	 Ww2FeM6F7TZki4vagC9jgwFOfQ2+1V4m5aRdtxzvRVvTjXr+B3qiE901ffTCrIFTsGvH+
	 2+nSBXFzf3pQUbvxPV4FbJKj9gk3tkkLZEissniDTIFh5r32oPY7MCKC723yK3/hRFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TEGARoUazb0CZK9Y7+6uTs8sJWEMjS5uHIP12nGwzPw=;
	b=bvZ3KENyNhPp4+brxBSLi99wIuwKah41gt18FLRMd4cjKLTzzPauLUZCNscMa6vy0qf5
	 IzimTJpyVyvB/ippN1Kib8RxZGoURc8ZNeRh5jm1YLuyKqhAqEmtl8ltXzn9joSHU0W1J
	 M9PGJ0lSZ20L16HARqChJ++JuCg33WagukuG6Vjmbz0tEVbmbceQaV/5QXjiB20iGSSnR
	 +AI+4/181q8u1l+LoRsnWXw3qvFcCHJYmM0kRx9Z+iGENz29wsrn9W+yk1jOHaWmkcc+P
	 l177e/Qnlhsg2oFdfLPnTY1XxISWkdhZ7aUcDQCY0cXe3jNNdfq8d+ciCwcLFdtDhbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PF3svjCZ;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64814606D828
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64814606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PF3svjCZ
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e47347279so931498f8f.1
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 08:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070552; x=1794675352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TEGARoUazb0CZK9Y7+6uTs8sJWEMjS5uHIP12nGwzPw=;
        b=PF3svjCZ7q5UlZ12sY0J4HeKiTsdNl/2O2wVO4EVNvCk0+54rUOz00g2nQvgTcnO3D
         pPTBgX3duHnzXILDn0MFIUtxEH9xuIdF05Royyyd4KjDUA1h4vzdblboCkUzUN7fbSBz
         wV6Ax2oiZLHRnFCuDDmM3t9SgTNNO0AmU76O5AcXQ7J1duYJQcVpuDkxp+VMTIzipXiy
         jwIpIN7yaOkz1UzjQPiK0Sm96btg1QPAsejvn2j91CxbDtt7tbthe5SHMjZK7aLmgAIF
         5lKunlXM7yFlXLSQpfOFvOQosIX1f/IKtidTRMPZyegf/+s/VCZG5nHdpbMqE2d7rd5t
         D9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070552; x=1794675352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TEGARoUazb0CZK9Y7+6uTs8sJWEMjS5uHIP12nGwzPw=;
        b=0aubmebJUGEIc46KEW/LIb3AN9quPO4h75VY7eiBmgMh7J86jXbgNdqMW84p/Y+t5u
         P+A5b1TbSJfXQ3vaTh0VGliHy6BzHBiV1ewJPGzBPlful320p9uRGe09kc/UxTtCUaT2
         Q5GEO/CFZgfaTUWja6bHOn2vqv83wxZ4Qj0i8/YP0ZztyXAXouyJjz0m3YzzoVLvDl2a
         2ho9PtZrqUMCHpFVt03+WH1V1ys04dTl//1Z9fzmJV1PGwxhMfkrK1ZQGl/j+ODqT1mP
         jmsCiLKKobbJC1z8xwn3H56JxuFeXKuhfLwo3yxNJvyIEn9ob9mjB9XTXA7fVF3dGQxe
         AWzQ==
X-Forwarded-Encrypted: i=1; AL+hErEEBskRsLrvNS/fkq1DIlUoX/r0hbYzDlpNiI6mPxGTRBuHN9qqVlti6b9XZF+t4Vt4dzT00V6l3/jy0Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ybL6hG834a2mQ4mseD/nsrecT3hEAVFWrB07zw/atVfG++rTT
	3F9UeyhFaljmWjxvbrET3ca/65t+PtHlstV5VsA1obb8mTc+bkgRpkaa
X-Gm-Gg: AYBFou1acDZVDLmhVfBkVY5EjV2vML22qtTQX7yqAySudLmmhjYxSuVNQ7y2KNUDfd7
	lFNEyl50lDSBz/TwvX31LMCbBoBi/YPdgJt2fT2LD9c3hNDwIVTyGVOTxHZtfkqfru6LswjiPZq
	LOZIheTpmiw5i89OUzuOXgtaphc2VH9UGy/M9iZMZ9ZhyFVmNm3hyPVjDkP4cn/UOyM55LLNkYi
	uCwNwpne7bi3uhMW0c7uaCWtm0s+zsQKvtzs0kJiPY3AFg9Mhzm2qzQoMgooz0onv0PEU1JfFQ4
	4K7x54RaEpewSq5wE3xlX5JmEenLeAuHkihjbG5H5H7puDx/ZczWkKGMxz2gNUTvPEftmKK1F4Y
	/vIgwdP3feSDdLzhLBG3PJQqelaB5PLjaZjgKP+qlxsf0Pq8WxSyrFBBP961btd6u0p9X3KVZm1
	Lb5+a4kCA75iRyjUc+Bg84wxKIHlbAAVbElH3gC9gipEDCt4k6tRuemUYwrzPg4/38W0AhqeJiP
	TlEeboR6ju2udk14KAb0sEKiiogcB3/6sC/OCTVdzei3l+hghZQ/UQKPxaIMheOqPJeNxSWuRBW
	sH1tTTmcZRkyBQQ801ZCAGbDKJLyRpYdXTcv5rQSVKZZCIMBVwxnCGA=
X-Received: by 2002:a05:6000:1a8a:b0:48f:bbf3:cf52 with SMTP id ffacd0b85a97d-4927ff37842mr12135105f8f.52.1794070551891;
        Sat, 07 Nov 2026 08:55:51 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:50 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: jbrunet@baylibre.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 4/4] ASoC: meson: axg-spdifout: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 17:55:27 +0100
Message-ID: <20261107165527.576383-5-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
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

axg-spdifout calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-spdifout.c:(.text+0x9c): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_SPDIFOUT unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_SPDIFOUT=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 53eb4b7aaa04 ("ASoC: meson: add axg spdif output")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 10c7d59a5ad1..272639dd8eaf 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -76,6 +76,7 @@ config SND_MESON_AXG_SOUND_CARD
 
 config SND_MESON_AXG_SPDIFOUT
 	tristate "Amlogic AXG SPDIF Output Support"
+	select REGMAP_MMIO
 	select SND_PCM_IEC958
 	imply SND_SOC_SPDIF
 	imply COMMON_CLK_AXG_AUDIO
-- 
2.43.0

