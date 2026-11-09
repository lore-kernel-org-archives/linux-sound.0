Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238903;
	b=tPzvOX5oNEtmsXh2c3rEtTf3QHjhkym6/SPBaUQ5gHVUGZCzzSsoDiP79ywSrc/1N0yp
	 FSAh+PGd+rAiWJWcfmx9oRLU5wifPN40qVotzhBUIL+xurzNBy5HhcnxYRmkSOylBfBbv
	 yLlb0LueSkdTajxYZcpWWdUXSEuID0porqvxHGPoiKwDdSsM3th4xU/ZYWRoEG/ZxoktR
	 ynSl6it4iNHOZUD9mUzIUMhNXC+BW+CpsGPz27+RSgivLHifhP/tpbEVy5PqKVs5/UGD8
	 rvW07BvZgY9mVL8rzE8ymEKksCuq4d41FpgeWlJMgphZRfxMlMUadmVPQbn7dEYJmFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OxUvJu3JfSMq3bHVs2CGVC07cR612RqD3otgVjEHieU=;
	b=F0TSwevcqueTooXoEsMINbhp/c4YBvwZL3ZuKAp2dwdL8L9y+f79+egs0PXFKjsEfqzR
	 L+JSSviovhcH06Up+mCYChS6vqq0m0Pp81/kQIYnpxXHpeBXeOTxU6PnprqcexGdz30Gw
	 jplWueZlW94UxLIQ/3OuLOu74CVgDSI1xO+dEXa96WAEu02HmJZ1KRcx6WX6M+tRtiGBU
	 3ifJ/sta+P0Bw+Rf3vHxnGmX4/d3FU4ToeaRLVqpyst6iRQbue/Xpwutjs9f9ldIzlFOD
	 UhPpNIjEziUUMrQ+BsF+ae27zY5INo+RxXDujcEKS2o9UK0iTAKI73jFXcI9VVLzWXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NN1A0RX2;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FD3606EE81
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 15:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34FD3606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NN1A0RX2
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so8919535e9.2
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 07:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238902; x=1794843702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxUvJu3JfSMq3bHVs2CGVC07cR612RqD3otgVjEHieU=;
        b=NN1A0RX2qAyZCkj0S3mmw7+ZRqcnPr2R6EeK8HY8MHRI2mpvxzxdLWG9yg/d/YMfk7
         JKOIcB7FedEV9OrKEa3rbjyjwyeW6PbnkMu2RiDuy37mPptYcA6ymfyXwCG2TyL2t/Ln
         oEf4pVAMGAOnteb45QuqnDSaqP2BCHirEm0dXhNGb/AthYW13IzjK5vwiHNSkJVhcCxj
         UvY2fIRI0YwExYbWlGMENCaJY89A9d/w49d39dDVbd9jN/AEThIiZvEdgpoY54l/FwYI
         +VJQeMENTmNBnaGjk323+nTX/0fLDX4qsRJGDBRrnNRw1GbkCkhhIxlrQot7Xr7U/lco
         xmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238902; x=1794843702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OxUvJu3JfSMq3bHVs2CGVC07cR612RqD3otgVjEHieU=;
        b=bQu8loa4zO0IpYisCx8GXR2d+bHydJS0/8qdFsHETV9J5K3CtUTmOXdpGs80NdXPh9
         YAhdkrQFANPRRFc9qdNOBxP4EvwmqaCZ7gFaVGsaW6ckJjjXxGqp/4VtuYtVcY4FGxjl
         b9kMaRYM7JXk8tFwF3Z3Hww2ZvwpuEvfpb+PBfUNIme4Nh82NPkjr1eSxYIqkola3y+7
         4FH0SZSTwZp41cP0UOlbL2IXdmcNSLpavGd4xJggbd9obp3mJTAhH/NjKnpAGHAR09vk
         uvTn8ua48Zymy2M5OE4WKZgE6jj/VoAQNAt7Qq978ys5W4062EvhhapEmDULnKkASveA
         Kt1w==
X-Forwarded-Encrypted: i=1; AL+hErFdD74OjxxAVntyTWCMLL2P7yD011mww3oRDTUI6Jm2+ZpF2X/btlYYafZKnvzFXJExfeT8jGN+Mp3qXg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8wMNqRtj+V18MxazkuRcLHCoKc0CE/g+t2NAs45QkxaPeXWhba
	b8waf96IpU8FOGPwqlPheZo5QPgKy2T8ARp5O8oQVS5fDVIuE+4rlx6N
X-Gm-Gg: AYBFou0Git0IS/Ex+ql56enzZKGGSGwNVKJMZG6Z9LjzdI5Y2nKtqZBSbdLMAwXuXl8
	tRb6o+dqi03Hwf87Qng/YHrP4plhOTl6s90eBPHqJ5u3BHyvSuwcnkKA+3k1HTxThgTeO1+wuIP
	HnfcsBH492kS3wg8etyMr3ICcwHgt85HixGRxJ3tcZqNV2J7GeUuaY21IZh7Eic6xKYpH/RNWrJ
	1K+dGpWiwzoGXqgqifjvW3Si/9q3j69OgLyiGlrCLsoNozkk87YxtwGBlQyq5eyUmYoozlEPzWB
	opK1wyK8sX7WMTNacUGahyjYcSdwARzQXc2GIPCfx3Ih7o3SIIo2Dkb3fRT7UVv1RiJ87QZ4q2v
	ph6b/ZqB7KooIUoH9HXXyWnW3mrLN/nYFkiyLeuZsqTcgEJojG+QYD/d4JHimqYSsQEhXLA7SU+
	IOWat05NFRJUZswFgqiflPPialIEQRwKIdCIkJMvmDS2rEsUsZZ4fmWc5NTYcjR1f8+BeQsc42b
	hUEJy5CLC/LUyrwMvUbzRd1h06+fqaeu1j5yR6DAj0fHgnub5stY+BpRdAJ88yaByKsl5YG36IN
	nkUlwT28plNcLVmjP3Rr4vc18Oh6YDfwckFa0PoYeeEM9ABb2xMNb8ws4Ot/H0W5Hz/o5gChgeD
	O7w==
X-Received: by 2002:a05:600c:34cc:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4b963c6ca22mr78879565e9.18.1794238901583;
        Mon, 09 Nov 2026 07:41:41 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:41 -0800 (PST)
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
	Jude Gyimah <jude.gyimah87@gmail.com>,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v2 3/4] ASoC: meson: axg-spdifin: select REGMAP_MMIO
Date: Mon,  9 Nov 2026 16:41:19 +0100
Message-ID: <20261109154120.592392-4-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154120.592392-1-jude.gyimah87@gmail.com>
References: <20261109154120.592392-1-jude.gyimah87@gmail.com>
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

axg-spdifin calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-spdifin.c:(.text+0x154): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_SPDIFIN unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_SPDIFIN=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 5ce5658375e6 ("ASoC: meson: add axg spdif input")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 4b06a9e7c72a..10c7d59a5ad1 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -85,6 +85,7 @@ config SND_MESON_AXG_SPDIFOUT
 
 config SND_MESON_AXG_SPDIFIN
 	tristate "Amlogic AXG SPDIF Input Support"
+	select REGMAP_MMIO
 	imply SND_SOC_SPDIF
 	help
 	  Select Y or M to add support for SPDIF input embedded
-- 
2.43.0

