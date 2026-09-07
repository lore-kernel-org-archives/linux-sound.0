Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17918493644
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 12:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782654; cv=none; b=ZkwlaJNmGIdMf5G8cQGUqsn4a9qkRSPpRx/sRZ1VGWTOCwgvJaiS9sD9sSFyCVK/JfgKsKrZFA3ph5Ki0upkmt11Z2nh1EKoIuJxx893kh9VakvuNkFS+QdQR0bIaHkQ+3ITTzsl3PJYIZccQjQjeNzaffxC9YUiYeZje9dqD8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782654; c=relaxed/simple;
	bh=Nph2ROMLnvDhQtRDVClTwoKUmdbXNY6dbwexoUG0CYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IHyy1VB4jftZXEI0fJ/rN/D/62Mkny5Z2dQB+PYmTlF7V48sy6NfiYwRLxZL/SxGCT4djtD/f+08EzZxVNDh50n7PJkirp1kSgaul8UphJY2DysI+O9kv09SUwpRxCoyGlCt2KSm9vmFaBAOhpGUGyjzOFisZoqoDHJIOdNLSTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8oEN0gn; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8oEN0gn"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d6d28aa26cso20438475ad.2
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782652; x=1789387452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7h2S3qXgjH0d2/zuTeGXDlTjAza128Ox3NWLM9is1c=;
        b=O8oEN0gnNgk7F+Y3+m1u/T1vocboO7ZJF6y/iXWBjatyrNwkSyABBH0pTrgrcti9+W
         3dL/MY2T7bQ5ZfldgvgkuoHlIKFlSqqjwZcCWXO6OblfDCihZK3sYKYT9g1K6+jxI1Xn
         kWJCta6KiqYKSPN/1EyRJXqKU4noaJcfhwoFVkr70pg76eXZWi0TrFtYD7i5E69lFInC
         YlGUeXCTAb31eUfkL8eM2WrWNe2Dgq582HaX0sl84JyqbfP+pCr/7SjK4yRaAPBl9Ao0
         KX8kAJmkYij1HicRT7rPG14p8KsuJEyl2XeT7VTWdv6S35SINsnaOwOuAjcau+UCpeO5
         ZTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782652; x=1789387452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7h2S3qXgjH0d2/zuTeGXDlTjAza128Ox3NWLM9is1c=;
        b=e0zd5i8usYopbLRc72Dgeccicw0XqpAixJrD4qHsbAkeM4sMzL40FB7kbHHeHhGFuh
         zeoa1B4u5KlUTZI7Rzk8OFJCxqa+qFAFAax7XXnTc/6pfyekKqIr9soSjZyq93gt1xeA
         Plh0KFeq273ePElwfeax2TUWwfmkYBuRxIDq2FkMb5sHlWJ69nFUbWhAUV//VnjKE0M6
         OZhxv2zW0au4bJE6oL0waul2Tnqz/mTs80V8Q6+5ZGfpKjVeY3gXdArmIIhogmpxkVMP
         3K/ifLXe2uL0WsHXjoECzTceoyxbopjDhQpv0tjkRjm33DyqQot9eRvMz2WGSj5SlXTm
         S8wQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5//rK71U7Sq7qMGftUgB2bvWUg3iw5DWxybXiSbE3GvAD3vDvNqiiHONu+1sB5DDNhd77nCEhx8GrQA==@vger.kernel.org
X-Gm-Message-State: AFuF++mMB1gwfJ4qzgSIwLOPXUMKAa7uyhWxJxZdll6xcArY0ZMcBk23
	CfkBVtKvGW65hBKmKNkdcx3D8wECEWWoWmjZj5y9CDimRgStwEcAMz7k
X-Gm-Gg: AYBFou2Dqx0ll7fAHuomlPR2SlgxeIhRXm5D4VCJXWAkP9b3HmmTTIZDTSbW0ScL2gl
	hxCfdfb8wyPHDr4hwaYzQ4il13SP9UoTx+39g7PNO1KZyi1b49VM8hV3QnvzaFNMbeWvwDz2aIf
	dIuhjJrFTp7snqCDmcopXaPFYbO0+md8yEr7IA5GR//bnGfzhAJ+ukFMdfMPy1YQkDFTTSfz6Vl
	kgJor9wtSklOGPB00oVH2uol2YrwnUyTZU/v2AUUv8F/QhIxss2OGwmSZRUUuxCP55gSPC+iiTB
	AHjV2IOJqjwak6U4cn1faVhzAE4FhQ+k+N4D9HNL4IgdznnyyGA0Bs56OO+ecyAkDJiAjOW4tf+
	tTa7WS5R8qyJjItzytdITe73VKd/1bPcww6vLdMjgtm0fxUkLPDuRXQ+nBEa9xudHGFKuFuB3m+
	4FRViq+y3LYORye9wuoDk4Rk6eOBer0b+W8/X2S98BVPR2+sksryU9XV58XTCWaMZ19bVVcbq1R
	3sDFy1adahcoTbV4E1M1ZANc3tVNcr+pujgBidZDbyJ9yDl8fZnkq2xNN2sEMfM/AcTpYiNiRcn
	QCOc
X-Received: by 2002:a17:902:ed8b:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2db126d8fc2mr211708425ad.12.1788782652165;
        Mon, 07 Sep 2026 05:04:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:04:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 7/7] ASoC: mediatek: mt8188: fix clk leak on error in audsys_clk_register
Date: Mon,  7 Sep 2026 19:03:10 +0700
Message-ID: <20260907120310.135693-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_add_action_or_reset() is called after the loop that registers gate
clocks. If kzalloc() fails mid-loop, the function returns -ENOMEM before
that call, so cleanup is never registered and all previously registered
clocks leak permanently.

Move devm_add_action_or_reset() before the loop so cleanup is always
scheduled. The clock from the current (failing) iteration is not yet
stored in afe_priv->lookup[i], so it still needs an explicit
clk_unregister_gate() call.

Fixes: fd67a7a1a22c ("ASoC: mediatek: mt8188: fix use-after-free in driver remove path")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
index 972f097a13ca..9f3b3a777577 100644
--- a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
@@ -170,7 +170,7 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 	struct clk *clk;
 	struct clk_lookup *cl;
-	int i;
+	int i, ret;
 
 	afe_priv->lookup = devm_kcalloc(afe->dev, CLK_AUD_NR_CLK,
 					sizeof(*afe_priv->lookup),
@@ -179,6 +179,10 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 	if (!afe_priv->lookup)
 		return -ENOMEM;
 
+	ret = devm_add_action_or_reset(afe->dev, mt8188_audsys_clk_unregister, afe);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < ARRAY_SIZE(aud_clks); i++) {
 		const struct afe_gate *gate = &aud_clks[i];
 
@@ -194,8 +198,10 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 
 		/* add clk_lookup for devm_clk_get(SND_SOC_DAPM_CLOCK_SUPPLY) */
 		cl = kzalloc_obj(*cl);
-		if (!cl)
+		if (!cl) {
+			clk_unregister_gate(clk);
 			return -ENOMEM;
+		}
 
 		cl->clk = clk;
 		cl->con_id = gate->name;
@@ -206,5 +212,5 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 		afe_priv->lookup[i] = cl;
 	}
 
-	return devm_add_action_or_reset(afe->dev, mt8188_audsys_clk_unregister, afe);
+	return 0;
 }
-- 
2.43.0

