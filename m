Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E0D30C37E;
	Wed, 31 Dec 2025 20:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767211485; cv=none; b=W7AYBw7mzRYnTgGAEohbUnzZJ2ysa/vR7K12oMbDPoWuILU1Lr81MO8vffFB2k9x14Ykt/CaqtLiEtKep6EGKs4FscbYqFDtxIuB1IQfMyT6zDwY4VaCfq1AD3lXAwDbvwNvzwk17lyUln24yA4U1bppS0lA5diylC4GHh31k3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767211485; c=relaxed/simple;
	bh=mCw6ltfCixzC+E6N5eLf/+9apdNIhEOfV146Q1qsneE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V3bFX82V1piuK8Ejb22XU+MCT4Xm+5UOxvWvnsTbreNUDMh77BTxfwvhTCuWRtEcdLPtcaG/K8LeVB6lGf/nqYc1ZLv6Vfjdj4Yok2qa1mV5+VtYe+JemGMC8eXuv8H+Vb3RLP2d9Ny8QjHfBZ+LAZalL+yrezBhoolpSTaeIg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ntfTUAB7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ntfTUAB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767211476;
	bh=mCw6ltfCixzC+E6N5eLf/+9apdNIhEOfV146Q1qsneE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ntfTUAB7yzHRhPJ5FTAqPypGDYiUjFk/cOVyo8JFzcABAppU6X/SLJVyObxjMwgQq
	 +RI7AEfoqS5a7xRSQvkZr7nkoiT/wmVFqiyOENzb+v85FJIBrmiltOEBozq+Q5MZRl
	 +KN24pI+Z4IF54TpttD5od/VWGoswAfmXksMiWbFtSGKTMHfqimb4K7gnwx6gux8/+
	 CqtPbV35Q8VQXNODx72SNUc0YGgrBqt8/PT8EBDPJOqp8Gp70o8SOrKjKD4svYthJ2
	 kM1eOQp7DqntChsTXY/Alx1U/okSRkq7sC6atGoYXaEOERESV8zH1GmFfOCA65aSg5
	 vMWw02taBbAsA==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF92C17E368C;
	Wed, 31 Dec 2025 21:04:35 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 31 Dec 2025 22:04:18 +0200
Subject: [PATCH 4/7] ASoC: nau8821: Drop superfluous return statement
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-nau8821-cleanup-v1-4-6b0b76cbbb64@collabora.com>
References: <20251231-nau8821-cleanup-v1-0-6b0b76cbbb64@collabora.com>
In-Reply-To: <20251231-nau8821-cleanup-v1-0-6b0b76cbbb64@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Seven Lee <wtli@nuvoton.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Simplify error handling in nau8821_enable_jack_detect() by removing the
unnecessary return after logging the request irq message.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/codecs/nau8821.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 58d2d5e77c8f..6dffda69f1ff 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -1679,11 +1679,9 @@ int nau8821_enable_jack_detect(struct snd_soc_component *component,
 	ret = devm_request_threaded_irq(nau8821->dev, nau8821->irq, NULL,
 		nau8821_interrupt, IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 		"nau8821", nau8821);
-	if (ret) {
+	if (ret)
 		dev_err(nau8821->dev, "Cannot request irq %d (%d)\n",
 			nau8821->irq, ret);
-		return ret;
-	}
 
 	return ret;
 }

-- 
2.52.0

