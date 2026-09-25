Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362463C8C46
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 04:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311836; cv=none; b=mwiUjjylFNShMIg/3bX/rsMnlWYSDQjk0VRRdcsnZDz1l3xI6goGIdRHz5rPZakeCK5IYZepiY7g4PWwTvDIlpsNcLU/DncLeJs1n/FJx5R4dbP1aRfN1FJ/Tl5wFvGVMmtALC02v63jQgH3cYbDaWb20NFwjLsNwlrArqex0Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311836; c=relaxed/simple;
	bh=fMdH2xjhZ8APiCyIap+VJT8agwXNMjNGO0L5Q3aG5e4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWUcfyR5+lakxSzUkQB6saZoFA5v7SQZmUyRRtLwtdEUIMo/IgKi/1l8leLixPvI+WCTsJ3K2v9ckBCl4M83S7bCn79QR+kiBRQKS1nHEXda9GZ7nl7SfU0taETvor+NvNhQKGD2q51o3CFbc0uC/lo8u65fMjF+6E17C7MUSxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzW3ucCi; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzW3ucCi"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so166168a12.1
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 21:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311834; x=1790916634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u5cOpKUrfnSjz/MBJQnHunIOTLFWIe1DjKdr4y4mBIY=;
        b=bzW3ucCijN43ZXsKqTGlG9mx0Ci+PYV/oaey6aj1TZJcu/u8cWJBZPQe80AayZcQPH
         KE8n8Inm9NuHTtnbit7+a0qgWJ1EvVySJBl4ZGXlCO6CGmaYvec1JAevCyW/fXBIZMQh
         cfIirHU8XISJgkXS+JI94kGdMLJkC/eLWJ+j0PQ2GXo7s4ved/jGmWcBcfzn2mYeiRWn
         +bffArEHCrXYHwtXymoeY+f0hVdDwvcAZbgyyo8uUQl0EN/VF5tkm+1Ccu6vzVgKLBHc
         UpQDhy/ajizNC+eGOwARf5EJOQsbeBAWM4IFJhXmuZ1pF+GOTcRZjTeseC5Gg/sshrLU
         LpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311834; x=1790916634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u5cOpKUrfnSjz/MBJQnHunIOTLFWIe1DjKdr4y4mBIY=;
        b=SK8CvP8tVDyEmA6k/EfygeQosRApFgmcG+EYf3RcTY+jB6/IM3lXGCuVciqAzOeNZr
         ATOQwJgJKPtyhIo31nR0Xl6Krd1G0Mraf5OX95AUjjc346A9mvKiR2bw36iFhDgv4zQm
         sKXIpTTM7PkQUgDeuqKkbfKEvN2X5SiiGYKfJ2i5PiLQ5v23eRyuXMLUZjdhjibOv4dF
         i9OuLj1cuCM2oaVPVaOkitgOE22Jx+0k87aeBz5RNOaZHiy4k7QS9I88FOOqwvfVj0HV
         od8GQlgwn52u5HLnhKTmOqG9ZDwVLSPXhsYUQMK92vkT7ls06ucRkfCj+r8O2/8lso6F
         B7AA==
X-Forwarded-Encrypted: i=1; AKwUvBysyY2CbU4d6U3eAr4KZGKd/VMIdXXkTHijADInbQ5AqhrdCm3rWBIAOmzo7dPlWMehFXeasy9jIQXhbw==@vger.kernel.org
X-Gm-Message-State: AFuF++lZE2eM7VY+StS3Yun3g0alTJZ27CcJEkeSbzQmEhEvkS85bWgp
	Uqxwcz+vWsczzibfwMKSdw9CBXC7KCjW/4XuwmkqAeN5Hf0DiVHJssm6Btxw7g==
X-Gm-Gg: AYBFou3RcBvvdzRgpYdYYalVk9dk09L8dnvqhynv4klIHzTJNhG/722FXLZsTPk//7q
	sz3BScRKzIjgdFZK8KaBk8M2o/yXId8g7wxdjIZY41q6bKxGYvg9Fycx12p8xIOIVeUP09HiIc3
	eE9N/fbUn3Z6Z4+98ggp2WHYo2d/jshMJQ3tqh+VzHSfLhr8jv5MO+aACVRGK9Y/wR03IaaXMRQ
	N75G3/lDRsIko8EbG3zENxeVnNDig0HDCrrNRn7ULc7xfYXdughDW0u9QVQb17nvGMslfz1ZoBO
	BA+ql0/+7cenHyxXLKXyQbo0MhrGkYr5jzfZF3uMfsP2k1WsRc/7ECiP/jSCYPc4ax00EgTRRPV
	nrBcmBeiQ8Dys3qapDtg7j7J8/1wXf3NxBOZbslwYrLi3L1R/PoYtu+JtUd/OfFJEapI0DUYp2H
	BSIwUbFLzKckR0lg/TTZ4RpjsnJ+U+pW33X8fJXeCPxDapeLvmBBKRAp363xRjkSJPVcND6E71n
	tj++PlzIUyP2bxX2Yv2ycpEr4j/RSJbBhqF2ESkGfcF9jt1AQhkTnlXQXo1kL5C7NF9JQ8jWUei
	cY9O2siJMxgDIA==
X-Received: by 2002:a17:90b:3b51:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3a0b31224ebmr1565733a91.23.1790311834493;
        Thu, 24 Sep 2026 21:50:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
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
Subject: [PATCH 09/14] ASoC: mediatek: mt8195: Propagate IRQ lookup errors
Date: Fri, 25 Sep 2026 11:49:03 +0700
Message-ID: <20260925044908.450775-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate the error returned by platform_get_irq() instead of
replacing it with -ENXIO.

This preserves errors such as -EPROBE_DEFER for proper handling
by the caller.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index b8c3636cb64a..057f116645c6 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3125,7 +3125,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return -ENXIO;
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-- 
2.43.0

