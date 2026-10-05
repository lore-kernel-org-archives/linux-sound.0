Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08D447DD4E
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198239; cv=none; b=r/hydeWO+xzgE9uFzwys6rvweV4ETAynSCIC6DGiLHu0Dg53c0eUYptD1YM6jNaESdBohTA19OifDZovSnXNNNRSi80RnAthx/LVVtfhlFd/MozPArGasBRG7nDKr3HE8CV9Ic56jTQ2/iD1wh6qpCytn30KXO+Vb7vn64oI14w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198239; c=relaxed/simple;
	bh=iKUUJSt7p8vtsHId3IsDg+ZkL6DO8SyYLRDzOeVFSmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YAG3vDxiVoz3sx3Ym7/z+WHDK82Xt2xmJziAmBaUlZCKyg7B+ZNRV105o2p4AfHHG2rS/8X//Ok82WrzkxE/PNGlSmC9yShFG0nemi8dofo0BVciLqoUXKppbAN1N0YOqXwcyTnW9vmHR6u4ixtM2rcTnyCwYfXPeg1waVWz6+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKzbHyQ9; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKzbHyQ9"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-88b7d853b11so659100b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 04:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198238; x=1791803038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YgpriKXAFPee7C2GuzfFWAW6VXCoHmf3bAWq9txmE68=;
        b=KKzbHyQ9kV5pNe1jgIXpTWs5Pz2qvc8BZlwM6eLiYNutqy0PRjr/4Ln+9k09nrOkpQ
         sO86Zat7x4wKNXlfRwRZcxsJ6n7kYVI82syXMgBPS83dsfE0q71wtyu2sUcXMEnHNyyP
         3zg5NsTv1RJahIX32S1z3ORzE9rGtDuwd0ryrJsLpZ3uP/e+e248OIMjGj5uJMytKdcq
         CGb4ikksVXQtjKh4EdHBzl2gRdjpCikGDBzoD5XE1cKa3iSb/dsk9Uv11j/R0p8FVmRq
         lbfY3P856hoOSoDUnPIXB3ufXj1sVjeuosBc7urnuG0HldkwBq0C5SsFdqY3N1Qez85G
         CEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198238; x=1791803038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YgpriKXAFPee7C2GuzfFWAW6VXCoHmf3bAWq9txmE68=;
        b=eQsnDYr6DahndAW4hclM0mVuF2XMj5/ItElHjCuAXevk66P3q5Qce0KbHoPRB56VAK
         Mm18p8T7e4xV9k4x0r2OWwWw3+h9C4VlROukpgmLAWKCa4nS0m9EsacpBJTEsN5BiLBE
         d9LYxb7EUhJc4xxpZyo2PlE+yIipJBovvw+BM0vKmMc1Tqhw3IpYm8J/WdkeGztGLhDk
         cY4vcupUuBxqH714li6xA7cRw61rJTA2Z05D09LN171JXLOyxNCJotvISrQNbGmY34Fh
         AF7+iinSuuAIrFzcs/PzWh0AW7DyaqREIqfCCqDydhHdlf26myuyf3HYAKLzklxBcjNV
         zozg==
X-Forwarded-Encrypted: i=1; AKwUvBxGKauiYmYvj8q6Waym3FF1dbduFFSUXxtNV8rq1Q6yhfsF2QMBt3kyMFkXGB5XVcdeYphGVCwzxnfhAQ==@vger.kernel.org
X-Gm-Message-State: AFuF++muelFkRPoyFwN4HmUEzqAPmh+3aneNB0DZnfiF4/d53qBfmujy
	SHSdnez6kkYhFhnDw1S3zjBziuQrYFZqTe0ai94uDx+NRLe1sCHd8o+b
X-Gm-Gg: AYBFou2RTEkQrIOm4332WFHKCfs5D0D+VeCs0sYH/c2xuPyHM+i0qPlB0ZJv1CNvseI
	cA4n6RtDBAXnFfxCSdqVJ/+DJ3h3Wqc8mKHWFSxAN8Fr17dxS6rCJ50TbRTD5AWfOWUiWrccOfu
	32UtGr3Eq4NsxqhG0oeekwD1QmZlP7cdNBN8SZ6G8WHAAd4XPwSkiukJRQ8cuc/g9Rbk9/qy+Yy
	5i3mbuK7HHvNRqqM6ST00z0EnBTX7aO7tlJ2yjLcMNE5cnYQgqX6KF625iteld8bnDQhFDaVYDx
	1y5C4BXH8c0puLUemHcNM+56txWYXxMN8IP8txp4uW74+QD6iZ70CVpgn3Jx4gR8GqlBU6zCv6x
	7v/bzeLHU0RHRsIejxT4PCUz1lxnB7WN3/rfKLZwaJsoO/1izgSbI+Y0w7Ylyo0r2UeG1bsiLNM
	uLhxvM9S2ZQQkZcosvdEs4QPND7gB83Lg6uQv9WOjjfAo8hO3G/Nn+Y/MsYUNFzi4pwyoKxlMqw
	v4UW8py+Du1PeLoOd3LHsCDO/LCc9Gh6HUSBpG6F6Fg2l3xTi5ggZ0Ex6TrCDxZe3EQaor6ZQvB
	n7p+mPUauCZySw==
X-Received: by 2002:a05:6300:2209:b0:3dd:57bf:7248 with SMTP id adf61e73a8af0-3e0d6b554d7mr6668842637.18.1791198237926;
        Mon, 05 Oct 2026 04:03:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:57 -0700 (PDT)
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
Subject: [PATCH v2 09/14] ASoC: mediatek: mt8195: Propagate IRQ lookup errors
Date: Mon,  5 Oct 2026 18:02:52 +0700
Message-ID: <20261005110257.50145-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
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
index 1bca2f62e76e..4ddf2114a1ab 100644
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

