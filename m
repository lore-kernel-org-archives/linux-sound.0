Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800219;
	b=FzT5Lj61LFYekWVYkj+Si4ByBjEsJ55X5LQaPz3gl9EBJ/v+IjIHAVAh4UU8GP32OZyp
	 Fqyj5NwhTD+5lvfp8qGLfIyW5iN+Q8cN3rTS9SDsyIPtmtqiX/CbQEbv+zG5wnfCkKWkK
	 9Y3DO17+AHPwAwiTYRtTez3lfsQ8rRGOHcETOHJMDLw7e9UqyjGZA6Q94xrXFp1SoWZPA
	 +9VPYQ4xoxTPJne49tcPIfSEkR8svR2E2EQdoAY4ksn6VCiV8IyYmHEbtmWvrxDI/eHAb
	 pXjG6gkiMpstIFCNwSyeELy8g5lqSDMssrzLOKBnwXDQQ0wUeFN3h+pZe6klGeM/2Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BcKmo87w9i30OoXpNaJS74LR5pert/qB2XLpxfTiTqc=;
	b=mweOhXyB+meHIqP/BEoYTRrovCdX4BCleOoW7/rOLmGY6N/IfKzzLvHoEo7jrM2mbDIg
	 2huKvliyR/FC2Oksx7t+MWz849PHXwjLxokkoPmIU9N5LohbgU0US40hWISF9dkuKK3Y+
	 7kTVSAQRv2ikTDfSyf3CSez/abSy+olGBXjhUc8wOyHBlwwo80/7E1eMgDd3PhtRI8Lx0
	 fUPSrOniQ7IfIQY6e/vYSarD0k89BUITIQEh1wYCpe7UoWLFsz1s1iUGMI97XLp5tFdgd
	 19ygiHYJwx5C7wolk2K1dNimG9UjsOGMbOotkL78U4X4OtzYCmmi/kkLysrARnypIUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uymKiL8O;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18E9606A32D
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 13:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E18E9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uymKiL8O
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so677089f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 05:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800217; x=1794405017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcKmo87w9i30OoXpNaJS74LR5pert/qB2XLpxfTiTqc=;
        b=uymKiL8OnJXi+z2hxaqvrABOffxRFtn2pU3IzaYXL9DIg9+2ND43580uNVMldOl/JX
         bQN+QSLf/Z7OZmnRcQ3uJ1buOov3n5x5s7mSM2Ezo3nKl1fAYFebbNcuTXnvBvkn1IgK
         ed8f2jkOCDZCUhNn+eO1plJtCluaMqsJR/pNxa7JudrxL7t4ezm7tqc93x+OsDlSP+b4
         fAVTGC6ikekpAAtbcW9TC1wL8/u2nOYnTFW5a6AkSV2lvzNe0H9G5q6sJm0Uo60NqjDQ
         JZ9hvFPft30mNfuzNE2b7/IfxsGV9o39e+GohTykuhimcwYgKfTCWFP7f6nedz1ZlJT1
         OWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800217; x=1794405017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BcKmo87w9i30OoXpNaJS74LR5pert/qB2XLpxfTiTqc=;
        b=t2px7GjLmoWX/s3l3sD5DjVPHHNyDtqj/aOzKYBmI0zkfc1jq0MQKVXCBP/SHNwCNO
         +qvitBRY5luKVNXmeMUFqrhRi0UdeZZctUkQR6hep0v/DmNNvWFhTvQqrAzMfPdwbHrs
         NGcAUfxgY53nBEwTst/vORyn5k1u6EbgwKrkWBErTMw+jF6D/pNGHk1phpjBA6gBL4L/
         VkkJANac5xRvNoWFLF+VaImZxDAKdak2Scn16u+t0SyuyaOX0JLdT39HQBSNNyfKdqy2
         fhV1l6jesTtKhQHK1SX0X2iMdi439xEXl32w/xlsTHlMUOCu0a5igrXOJeS9hd5ToY8T
         75/g==
X-Forwarded-Encrypted: i=1; AKwUvBwpoBNSDB6IXwSKOyRM8Yg67hi0W3wp/eo0D6IThZ2sxhVgT1sbZIQsWNIiVK27cuWmpGnIKwXHxGDyHA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8glBQE5W3amoMG5pSF7cw3tRl0dquBXGMEulwDln7vSFoMCWdj
	oqHAz3vlR8w3GU3JWu09eWLy3eKPKpgolNZY245ubv77dyJX6vkG9j7o
X-Gm-Gg: AYBFou01b41QWN1/N2P/hSgtuLCB4FJHybLS2xY/O1VMCLk/aNnIfMe7QpTDcRVzyEB
	KpxVxJqxhmAOLH4bxKpXCmisl/F63nw0Al6aXL8HCXrbcbkqd4jlFDOZTBpckXed4mmPHhG7C/p
	GmMbeDIP+YrpgU/APvyDrKXGy1f2raV1E4Lni0hggNsjvlnsytRjRzmKDutLVFs21ZuVn/UDh8J
	T7MV5UKqExN0btN0QuNQu1MwZgQF2wSfl/Pv0E9KFOxL8h/Q4qVrhge4PchdBMw8dvaILnsQRoj
	iV8qLkGfmL0x+YIEV8RKpfE+SA1yPdRtv43J5jgN65SxAuCDpmeiwPgEe+b0p8XbUS0iwGuVPgm
	J9IxqcxJVJ6US7kWSL0hCGUsN5oG4FZQIcf7JTP2VVhM+hMiyGBFleZcbx3UoBfoVEYPGqq4ORH
	4zWzjf7ICjecT48KwbUEJkSPqpG9jn927dG7kA2Yr6LSAVs1BRI1T3uk8aH/seGTY4kZwIBGoyz
	CdW+hm++aNkRRhUyNVrys5pVZNq7ZcsVf0gjpQxfTZ7kqcqZWkY4xvZC6ULrtT6fjOgjMvYKUer
	a0odXB2cc3azLIcVYVJHG50EYCHYQXp+m2tYtz0+/XhO5cVjNmpHW7WTeH0z2MMF7b5WZTCpknn
	OlQwpxaz7RTdJbxy4JzDVyiA=
X-Received: by 2002:a05:6000:2313:b0:488:7d08:edbc with SMTP id ffacd0b85a97d-48e6e30ba6fmr36959078f8f.24.1793800216947;
        Wed, 04 Nov 2026 05:50:16 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb5196esm3701024f8f.58.2026.11.04.05.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:50:16 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: chancel.liu@nxp.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 1/3] ASoC: fsl_aud2htx: select missing dependencies
Date: Wed,  4 Nov 2026 14:49:58 +0100
Message-ID: <20261104135000.3723017-2-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104135000.3723017-1-jude.gyimah87@gmail.com>
References: <20261104135000.3723017-1-jude.gyimah87@gmail.com>
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

This driver is short two selects, not one: its configuration fails to
link on a symbol from each.

fsl_aud2htx calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.
fsl_aud2htx calls devm_snd_dmaengine_pcm_register, which
sound/soc/soc-generic-dmaengine-pcm.c provides under
SND_SOC_GENERIC_DMAENGINE_PCM.

  fsl_aud2htx.c:(.text+0x30c): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_FSL_AUD2HTX unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_FSL_AUD2HTX=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 8a24c834c053 ("ASoC: fsl_aud2htx: Add aud2htx module driver")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/fsl/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 04940879dfd8..e8924ed652ba 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -116,6 +116,8 @@ config SND_SOC_FSL_XCVR
 config SND_SOC_FSL_AUD2HTX
 	tristate "AUDIO TO HDMI TX module support"
 	depends on ARCH_MXC || COMPILE_TEST
+	select REGMAP_MMIO
+	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select SND_SOC_IMX_PCM_DMA if SND_IMX_SOC != n
 	help
 	  Say Y if you want to add AUDIO TO HDMI TX support for NXP.
-- 
2.43.0

