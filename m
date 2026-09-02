Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8500B3E6DC8
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 07:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335775; cv=none; b=Y6dbtX0+r53KpkQdM3d3E4VsLF8m2oNv7+3/RsYePeauOS0LGghpJKjp0O9A1ggyqkTuP2zHb6yj8T1l3rmde/Y1rs/h7y+fRHPmQtgrigmSrq57tLGqkmP0ea2CkU3SMNY7kj/Xqsy5pZiUSLRMDbepw9HfeM5H/zjaIL3jMi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335775; c=relaxed/simple;
	bh=WNCQIF/qfGuYQxxxek4rxZvcnaSDqFhJJrZ9tJ+0tZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ir6Y+yx2/QOjjEBss+874ErXP6pcqUD0chmhVFoL/P/Z3rKWXq0H/WMULdGFhyikAifgPsx+lm9SD51gy+8pSaBFRG89kZHmt/eo8/5AVzZ9hG9UN1hrwLLVuVopUBHyd6DcDx5If6lqfVPXuZSzKUnu5EJrxm3NI6raUPHhqFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7KLdhCI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7KLdhCI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FCB1F00A3A;
	Wed,  2 Sep 2026 07:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788335774;
	bh=EX6l5BO43dR8usJpPnpzMA2x7LlhIVIP5ZH177WJF5k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=i7KLdhCIDvw8D6g6XwRuKSUozLqdvKVp2Sm0N60m0GTlvRc3OVNIGyyky8OJnUAeL
	 ZLtjTsqEkUMUJp7jgNV7bxMny3OcRuKH7MwICoeb6XplzsnbdU+qdasvBUiwX8loH9
	 eu0YpKAe6HTN78aGJBJqa4NeAgbce+VSdalSRr8YA0bBJPRI4zq99vMeYKxaRaQSVo
	 iNWYsPKoVi/IDJ4lb6iiF1N8mqqwvxwZy8rjeiLIlGCGLpJs3Pumj3PhNcblfM+QjB
	 BVrayDTK0SFmM0Wti8d2KKw/vONc2o9oIMb0gzwv0uHbTKpPZDVRiwljSvM7XSs37U
	 Pg2OknHR14QwQ==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 02 Sep 2026 09:55:59 +0200
Subject: [PATCH v2 9/9] ASoC: ux500: Program the MSP FIFO watermarks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ux500-msp-fixes-v2-9-4b60b002d55a@kernel.org>
References: <20260902-ux500-msp-fixes-v2-0-4b60b002d55a@kernel.org>
In-Reply-To: <20260902-ux500-msp-fixes-v2-0-4b60b002d55a@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The DMA engine is configured for four-element bursts, but the MSP
driver never programs the FIFO watermark register and instead depends
on its previous or reset value. The DB8500 DMA request protocol requires
the peripheral watermark to match the DMA packet size.

Program four-element receive and transmit watermarks when configuring
the first direction, before enabling MSP DMA requests.

Fixes: 3592b7f69a54 ("ASoC: Ux500: Add MSP I2S-driver")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/ux500/ux500_msp_i2s.c | 2 ++
 sound/soc/ux500/ux500_msp_i2s.h | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/ux500/ux500_msp_i2s.c b/sound/soc/ux500/ux500_msp_i2s.c
index 43dc9b3aa4ef..683b485fb570 100644
--- a/sound/soc/ux500/ux500_msp_i2s.c
+++ b/sound/soc/ux500/ux500_msp_i2s.c
@@ -507,6 +507,8 @@ int ux500_msp_i2s_open(struct ux500_msp *msp,
 		old_reg &= ~mask;
 		new_reg |= old_reg;
 		writel(new_reg, msp->registers + MSP_GCR);
+		writel(MSP_WMRK_TX_4_ELEMENTS | MSP_WMRK_RX_4_ELEMENTS,
+		       msp->registers + MSP_WMRK);
 	}
 
 	res = enable_msp(msp, config, first);
diff --git a/sound/soc/ux500/ux500_msp_i2s.h b/sound/soc/ux500/ux500_msp_i2s.h
index 17b5c37a7e5d..2bf2699bdc49 100644
--- a/sound/soc/ux500/ux500_msp_i2s.h
+++ b/sound/soc/ux500/ux500_msp_i2s.h
@@ -62,6 +62,7 @@ enum msp_direction {
 #define MSP_SRG		0x10
 #define MSP_FLR		0x14
 #define MSP_DMACR	0x18
+#define MSP_WMRK	0x1c
 
 #define MSP_IMSC	0x20
 #define MSP_RIS		0x24
@@ -228,6 +229,10 @@ enum msp_direction {
 #define RDMAE_SHIFT		0
 #define TDMAE_SHIFT		1
 
+/* FIFO watermark register */
+#define MSP_WMRK_RX_4_ELEMENTS	BIT(0)
+#define MSP_WMRK_TX_4_ELEMENTS	BIT(3)
+
 /* Interrupt Register */
 #define RX_SERVICE_INT		BIT(0)
 #define RX_OVERRUN_ERROR_INT	BIT(1)

-- 
2.55.0

