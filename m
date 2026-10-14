Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C7D4D2EC3
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977342; cv=none; b=AL5E0PKIrrqUuk3RqY1Aq654PZAIdN1TcyakZhpHBGgG0IpnEohmFK/eWcgPieNF03cVWaI1uID7eiI9pkoSW5xIjhLD0TCwlYEuxRlfN3p0cMmxZxCee6RM9+ewZGLjRe8wxiLBQ+9XbQQRJXUtu2Eo6NL3R26/WmeFkqfUbBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977342; c=relaxed/simple;
	bh=EfqEyXGvqorGIOi3nlEkrgwSNHUn/0ZDowiAGxNh+Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=msS84F1EATfxKpF/BANkWb69f4fRWINfEjNT7x1O78XpqtTLRO779gKMQLloDllnzVFvf06c14Od2qdzbw+z3mODNi6bKYBcLOMaJkeQglllIYxdFUnFQKegVke43VnnncnPzur3cNk9ecVASfvCsJmiJTdyGNA8oNRALYUTpHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSMajkKB; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSMajkKB"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so2430820a12.1
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977340; x=1792582140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8VUtK39HIhzGJ/7b2L2Rojv07HVw8BatiG+Ir0yk9s=;
        b=qSMajkKBROcAE3YqKmcs3c56hygsg2ruOHWCFNSq8CXrUtDUm5MzMnwlJCszL3Oj6B
         zS/HSC2rb+9LopJ4Tm3h+3WXYQ0yNrnant2i4ranWMpY2Wu1/lT1YRocYVaTmok0kUW/
         aM35HpWCTMbO4aUNZFDRLnt+JnoviEj66why1tNLawIBc2hRNn3CSMzUh3v+p8jcwyAl
         S6X5kDl1Q3Varp+5pj6g1t2INToaoRCu0yar7CGKalIS+pbLAAxWws966Wb036LPnr4L
         GaeJbLstjTFxdhGOxSTDgm+4cSSglN5x19s/ChWGuGH2wDlr3JLm8DOjJcN8lBjJ73x4
         M1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977340; x=1792582140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C8VUtK39HIhzGJ/7b2L2Rojv07HVw8BatiG+Ir0yk9s=;
        b=n/pLO42F6Z8WKSWy48R94sZUGCTBgd8Vb/JwI6X5x/hs08NFE+51RAC0IvC6SYoTQz
         LdtOBYnOC6TI7lPvBWDDh1N+ij9hNDEeefxZ3HJulrgwVnUKDbV42OAvbWYh490XEPz4
         if1wf6gr8+RIEyZSQktvAVK+1P8OK+jtP6I4mqM+B4vL83z9tiW2yZ8Qa/0Pm2cXLpfo
         JLRT/flQMo34vwlf2eGlzvzbXFBChakKlnXHUE3TD/LuwJOfPJ3hGI084PJrqJt3CZi3
         JqfOp75NGzf3r4mzbF1AjBIkztkmRuuCw5xVNrkQreXPPC5IyxU4KG2CbXv99YPAXEkq
         0oDg==
X-Forwarded-Encrypted: i=1; AKwUvBxkCy+Ewduaqp46qId9bUDQWH6DJGP2rCa32gIn1uDnJD+mblxX+0PHh1+VOYZP6KQkLl1kc4miQFlY4A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKdsSdzy+lpQ/U8D/+X3DYf23pa4PKVYdd+hEEWjjpzGn09dRzL
	gU8RG/T01+LcgOh+I0GJhQPeH3FSsPn5i3IaYLGof2gve9kn38Hh4oeD
X-Gm-Gg: AYBFou1fNSlKGsZrOwj9OgmgSQD81adXiqB+kNDPuYMWbaXUYhwU2aNA81ptSKG/RGi
	tvuNIG0bWkyWrUv/X0HOAKsiP9T0Tg/aJIHKgLhER5d3N4uoscnkY7Cd2eGdqlI5TZvD9/yoyiT
	2Y0kqngXmjcCjlNf8yCGfe6tXuVgGa6ulJe+DoN/sjmyM1VvxN/lZ/fcOteLyg09GiUO3/OOYc7
	Rcx8kUxe8CooTn0ch/ADj48AWHlTZSghO8bSP2w+VAY19+wVadhpe8GD1YKBCmtfR6Ny0CQ97X2
	krFGkPOtre7KlPiz83gqDZZMF5H69OXvbOhGmp29B/sfPR0hMx7/SWOU1iI7RjgJ3FI/mZe53Pc
	AJh4fF7yrR6qYiLhfzEq6iKMD/NbC7mGxOz1xHMT4hzILfKYT4wkyCCba1jWl7g1zGqpnqEp5EE
	Ld0AHokgtViM060cRBib1MY8Zy6Qc8FJL/UkP6q1v2vVAg4Ys6oPHsgeY4oO3mEiCXDcKQ3H7uQ
	LdzAL4udzI2uwQeUSgO8QQZNe3r15OC+xd5ifK1hpEeXAMI+Bntm90AMPu0p1ILoBF6qREekfqI
	1T/7MMKq25DOgQ==
X-Received: by 2002:a17:90b:48c7:b0:3a4:adf9:5d38 with SMTP id 98e67ed59e1d1-3ab3a3596c5mr12440768a91.4.1791977340498;
        Wed, 14 Oct 2026 04:29:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 08/16] ASoC: mediatek: mt8195: Check paired MEMIF clock enable in FE trigger
Date: Wed, 14 Oct 2026 18:27:43 +0700
Message-ID: <20261014112752.683032-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check the return value of mt8195_afe_paired_memif_clk_enable() on
START/RESUME. On failure, stop the MEMIF and disable the channel
merge before returning the error.

Also skip enabling the paired clock if mtk_afe_fe_trigger() fails.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 02736949ae6a..4216c47a56c9 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -466,7 +466,14 @@ static int mt8195_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		mt8195_afe_paired_memif_clk_enable(substream, dai, 1);
+		if (ret)
+			break;
+
+		ret = mt8195_afe_paired_memif_clk_enable(substream, dai, 1);
+		if (ret) {
+			mtk_afe_fe_trigger(substream, SNDRV_PCM_TRIGGER_STOP, dai);
+			mt8195_afe_enable_cm(afe, cm, false);
+		}
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-- 
2.43.0

