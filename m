Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F13D2E2665
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 14:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759848647; cv=none; b=rP6Ldgp8QnrfXLVtBmkB3EI6T820pxtRscpJi//Pvalsb2ZdelDc/7sATa0Q6TdOscppr0iXYVNONx8MYQXN7kNaTZUSHVgjKEjgkaAn4NIPhUzGdC6WP5C540BDWtMpG+WYZI+urYE+rs7kJu+6BS/gOeQTCmMCqsUgNjlG7VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759848647; c=relaxed/simple;
	bh=EhsgpQb7Uel4d6/a0KV9NMjV4SgYUDmvyndiTen54ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iqdog9bABMdwwXgNKtx2It9wxrlFaI6pz8exM1xTMBTtUGJTRePi1XOOMzW5X/SPqNhGOb4P9dwOGRPdfm3/DRgpFjX0LD+2Cvo69+oCf0F3dpxl5G3V+GFWVfgS+UprDNoPDWG7/VMzIAFntGEaIUfvLEbo52aHsAcY8HB4ETg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mr9zrZX/; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mr9zrZX/"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3369dcfef12so7074785a91.2
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 07:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759848645; x=1760453445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ln5XXfvynWD5s08ekS6kiZ2giWwkOej2qpSY6KpsAO8=;
        b=mr9zrZX/RuB+Xte5HpEoKmM5Q20NeiCLlX7kju7HJpA6oFGjDSiP9Itw/pFA0pu15S
         Fi5c7IkLxo644eksmzgz/gi3dbbJ335w27lbRAII3I6Ay0A0gJ3Y82kELauFroWuYOft
         du91MRgdj/HMw75ZhRj4f7CJaYailVN9Cx37rCu2kjt7Y7q91sNTazXnMvhn7v1ryPYT
         N34TYgKOIajb5xcOVWaA7QV645/+wNmxTfvhyzQLLkDebCXRRfO8tXLjwRL3TC26gTRg
         /kPVlIMo9iAz/wBQIACbPjRGcboZ+z9SL446F2iFXErUazYQceWKJ5Tx4T1Tr1VO905d
         xdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759848645; x=1760453445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ln5XXfvynWD5s08ekS6kiZ2giWwkOej2qpSY6KpsAO8=;
        b=rxPDIYFEnnRrqRch1Gx5U9r1rBkF+kcMCoCNw6cBUg4A5LEuoymJJSo9fKiJdtVHPQ
         YDrq13GieWcNBsnf8HQr4jOWEuaNKwj94QLzznFljQKe0ADapz4l48P/AUQ/xXLLCWwR
         UKNVQAoL1ADo08yCVKKb7wEu5S7+orMF45N6PoA7C3j+bN2btkVf4/xOMODBW0fT9xJB
         W18+dIuv120DTQbRV6KjCpLS8cL0w/5JUkzhIaXk47O7LLCWjLSMmrT+rbA7hiflCR9H
         C2vbcmHtxgB54XwKQBb3x31sbcnKfsdK4a7WV3eYTMoZLIyeSuUs1zNR4EzJXOxKNSW8
         eX6Q==
X-Gm-Message-State: AOJu0YwWd3EYqUacbKfOaNvq5SCru4Hd2jllgncbpV+Mrm8LEC/hGuuQ
	DVdI3Aq1lHRGHSPz+iLWndUlOKYi5zLhb7QVo+ajgc+22H8yDHWA5l9f
X-Gm-Gg: ASbGncs12Q5hqRkubnuLVhJ1CEaHm9Rs9ZDnl1CVuJ1zsNHyQ5yGgiJCX9L2PyX9miS
	c5pULNPJ2r3L46ZSZY0xEzCDXUJgV0mEvvlf6i12HpmU/JY/REwIMGzneT0LO10Sx6cLvUJKREC
	+hlD0RFIa1ywUYsL6uam/HuXKmrBO+6h6z9q0YyfwZVw94sfgXPVxW1T9Kx5Qzf5S7BZm1APjxW
	tJ8Z9UWyXza76TCLxgdXmIY7nqyjMvw/TSFP72p6yWRJ7fundMZxDNgYTWjNswtl6O0ur3/pOjO
	SqXyI4fSjSUweOi3Gnv32IS1iR10CcpuESzhE6YITLj0wlgTgN4VRVnIhXEozMFV3nejTvK8Inc
	uCsrIN1oZwkW0QLa53ZY7HuzkE5dnkxwsLDBMd3zXUUMFh8mDwgAEqYcBnWkEAy7zR3dVpHwa
X-Google-Smtp-Source: AGHT+IFgA8S/Hviwv0i6ktwLJ7KmgfbSl1PoBilNAioJZc5RhrRBnJAaBleGNVS0uz9y2sjfTjLGhA==
X-Received: by 2002:a17:90b:3b81:b0:335:2824:aab4 with SMTP id 98e67ed59e1d1-339c27a1930mr22876015a91.24.1759848645287;
        Tue, 07 Oct 2025 07:50:45 -0700 (PDT)
Received: from localhost.localdomain ([185.213.82.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b63039f795fsm6399656a12.1.2025.10.07.07.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 07:50:45 -0700 (PDT)
From: Brian Sune <briansune@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] ASoC: wm8978: add missing BCLK divider setup
Date: Tue,  7 Oct 2025 22:50:28 +0800
Message-ID: <20251007145028.1845-1-briansune@gmail.com>
X-Mailer: git-send-email 2.47.1.windows.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In previous WM8978 codec driver versions, wm8978_set_dai_clkdiv
might not have been called for BCLK, leaving the bit clock
divider unconfigured. This could cause incorrect or unstable audio
clocks depending on sample rate and word length.

This patch adds a check in wm8978_hw_params: if the BCLK divider
has not been set via wm8978_set_dai_clkdiv, it is dynamically
calculated and configured at runtime.

This ensures that BCLK is always correctly set, whether the
machine driver configures it explicitly or not.

Signed-off-by: Brian Sune <briansune@gmail.com>
---
 sound/soc/codecs/wm8978.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index 8c45ba6fc4c3..8dfce6ede8cd 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -99,6 +99,7 @@ struct wm8978_priv {
 	unsigned int f_mclk;
 	unsigned int f_256fs;
 	unsigned int f_opclk;
+	bool bclk_set;
 	int mclk_idx;
 	enum wm8978_sysclk_src sysclk;
 };
@@ -590,6 +591,7 @@ static int wm8978_set_dai_clkdiv(struct snd_soc_dai *codec_dai,
 	case WM8978_BCLKDIV:
 		if (div & ~0x1c)
 			return -EINVAL;
+		wm8978->bclk_set = true;
 		snd_soc_component_update_bits(component, WM8978_CLOCKING, 0x1c, div);
 		break;
 	default:
@@ -717,6 +719,11 @@ static int wm8978_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params,
 			    struct snd_soc_dai *dai)
 {
+	unsigned int bclk, bclkdiv = 0, min_diff = UINT_MAX;
+	unsigned int target_bclk = params_rate(params) * params_width(params) * 2;
+	/* WM8978 supports divisors */
+	static const int bclk_divs[] = {1, 2, 4, 8, 16, 32};
+
 	struct snd_soc_component *component = dai->component;
 	struct wm8978_priv *wm8978 = snd_soc_component_get_drvdata(component);
 	/* Word length mask = 0x60 */
@@ -820,6 +827,23 @@ static int wm8978_hw_params(struct snd_pcm_substream *substream,
 	/* MCLK divisor mask = 0xe0 */
 	snd_soc_component_update_bits(component, WM8978_CLOCKING, 0xe0, best << 5);
 
+	if (!wm8978->bclk_set) {
+		for (i = 0; i < ARRAY_SIZE(bclk_divs); i++) {
+			bclk = wm8978->f_256fs / bclk_divs[i];
+			if (abs(bclk - target_bclk) < min_diff) {
+				min_diff = abs(bclk - target_bclk);
+				bclkdiv = i;
+			}
+		}
+
+		dev_dbg(component->dev, "%s: fs=%u width=%u -> target BCLK=%u, using div #%u\n",
+			__func__, params_rate(params), params_width(params), target_bclk,
+			bclk_divs[bclkdiv]);
+
+		/* BCLKDIV divisor mask = 0x1c */
+		snd_soc_component_update_bits(component, WM8978_CLOCKING, 0x1c, bclkdiv << 2);
+	}
+
 	snd_soc_component_write(component, WM8978_AUDIO_INTERFACE, iface_ctl);
 	snd_soc_component_write(component, WM8978_ADDITIONAL_CONTROL, add_ctl);
 
-- 
2.47.1.windows.1

