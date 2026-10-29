Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260965;
	b=SYmY6dy+CTv7rXnOuI+tLtEPPxK0DnSzjoyF/L1PuKSiZ+p5712tBfHl+ZkM0RViGCd0
	 WSZccxmy/NX9VtbjOWTtw9hE0b9mfSxHJb3xjC1ZvMj0fSjNctwUM55qbyNPT9p4FZlO8
	 dia1w1Vn6Pt8BuA9lAy8bTs4j2MJ+VnV3c6/TcjhgVVhB/g6gilYflLiXPpFI9LvPJJoP
	 1g0FCMzqpc1j38aL+i2ygbRArJlOObZ/kdaqIyh5iIsYx0jen03C+kGfGOKROwN5REjX7
	 HcTtBYCLKCagD5FysHkLWlgYIV0xE6Lc6nQS1mUufULud+rbdciMjbsbeROCS8f7PUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dJeUddLpTK/3Vwe9+17wPlJ6y+ymPCAlV137W+snCk0=;
	b=UoktS3Zdel4lGaW+LMZNaa6lJ76iAKf1vO5sPM37nYQ/wDHq2gAE3NrXbEyESXhFoPSu
	 1+BG5gWR3IGC93z0+Ie399yP0zkXGppoBJ9d6p3XAGbQEzlTaof/hrC5yPTIZ1lSRyet0
	 hQWP/DxMIXXir1i2TUBjgfL3YLvpnAUtepkN7vjuUpK7HC/M4T9r7Rv6kgS24a4rI4IMp
	 m0lrqUKY62jfOwvBznXwAwYpe3/fmCrqAawehE4LHeswZeAp0q9mFsV6zKgP7d1J8uTUv
	 XISmLPL31WlQjpqTGOdVvnmkArFhjjcuNXFI7Wmangu+9seo9J8vEqwiW1OQT33RFlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiJUUdtG;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B1D606A31C
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97B1D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiJUUdtG
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc147d86bebso280197a12.0
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260964; x=1793865764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJeUddLpTK/3Vwe9+17wPlJ6y+ymPCAlV137W+snCk0=;
        b=DiJUUdtG4RRtVrXbyTKHAELPehfTmFdqFQ0VLNljoFsOKqH5REk8SLKO5rASkfRekl
         mPIG6sTtvOZjdQrQt1q67Nhbh47Whq8W2Ys7vKTeWPrcGeBIaVp/7hksNzxcKqwUEHtw
         DYvA0OUSwvI+0YmSRJhxVPq25YdMV9FWFsZ2EKd8ckouIUgFvISmIhshMHpU9M4+AwIA
         B4Ul9AlpI+GpKHuFaeefj7czDzFNqTp1EwP2CHZz3VIVpKMMM///NNNruw9z3LELcskF
         SQEUs9gEkRoerPH3Im6CW6JWcFmdvn3WEnAbgrt6QSvuagMpwxhCQoId6Pajdee05Ofo
         Rx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260964; x=1793865764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dJeUddLpTK/3Vwe9+17wPlJ6y+ymPCAlV137W+snCk0=;
        b=JCHYghD9roZJ532d7wv88ETJEUdIFUWVuZhDdv5eYDE3b4j4RTF8BGmKhv78kGbyoH
         a39Wd4T2HzC8x8zOQDYP3SpobwWsRndI6AFn5oyR03YfenhuWrvSgt0VhWAjwtqsEEzz
         ygArtGUEJA78ZdE3oXqmpTufQ9EFvcbITqoiMV1CzBjJqAuyGliTefUOyHH1ZCMeBLMf
         KtUtQ9P0vilpyxJxkqSV2p6/XofBUilbh+jkQrmsJlCZ3vP4pvewzijHyS1F6+IxArP2
         mQQ8ak6vZF5rLEHRO/Q45xZlGrOjmPjCEpOgbK/eki+Tj9QrHC6i8HyFCH+OJWgZ1M6S
         wM4A==
X-Forwarded-Encrypted: i=1; AKwUvBxqNatdHyTmtaH7NjsLGjlgJM7unwgp1jZ3LZ5POTpfUjsbeCPdlPrc2d4WyvLQp/K97FGCP8ZuQTLtYw==@vger.kernel.org
X-Gm-Message-State: AFq9FYItkLJLyV+hPeE/OmtvTpWsHBRf5kApazIcehBWA/FX+XNO/mRh
	EUJ143BdTjvsUwjZr+Zy/9V10Cl/FwNmZBXQqg8zCfUMzVc+Xtq8fRc5
X-Gm-Gg: AYBFou1jjYCmOnQYBNGLXxCegTLsdZURCiKMdbtW9By2IkpmaEwGT2AJ3bMB6Fd6nFm
	p4kfSd+sUfFU6g3ncaTfMFmWA5p6NceklkbIyVWHV/3j2nkWMELlDP2zHeNimpiw+tEFWre9X8D
	7zMftpT04+RwxwOdyVk/zerpxztb0STeQmyGjwh5NBn9Np/xp4zxxzasfuR/0q9ehPTl04iMEA3
	5Y6yYfUjPiC1JQeX/m3CZq2+NTXB0m3eszipEwA1rLkZ9nrBBf7L6EXeUwvnkJ06C6MK/2zFc+e
	qmVTkyVoRADHf2agYmxz4BsV90+A7G8X5UYpzAm+ja9jNdjEDkiOlqFVbvm2L9gvnq4VuKcu83e
	qwjleQtvheZstJ1DlV7G4Epz9Xx/MASGu3oHIu6TmAj/oyo6qKx9Xp/jQPK3KBLOyH7C+7WRsoM
	pjKSnMQrts8NWKq+jXg7FT6DjEyff+SvWIhcbQMA1T/g+hb2maj4ZV79XJAMaYCP6muNHq2EsOL
	dBCyYB2jpRaHhzolRgavdCQ6S3ocaqBmxbWIkIQ+Vq06bh3TY+hHwBzI9jxO1EQoPx0uAvAgC1w
	5mT7TkozKKQiSD8r0TNEmC7ZXE/Jc6iWkczgOTGbfEFip852vhsXau/SmaRgz3E5hCqnlr/ndxZ
	jBt1y2gGT8TO7x8t569hrPMdOnE4ItGiyJRfVftaIdFYqljbGr8AlJgs+ComvTQ98THQ=
X-Received: by 2002:a05:6a20:7f94:b0:3e2:b995:fcb with SMTP id adf61e73a8af0-3e9139661bbmr1248751637.1.1793260963991;
        Thu, 29 Oct 2026 01:02:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc682d8sm5059547a12.18.2026.10.29.01.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:02:43 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: google: Propagate platform_get_irq() errors
Date: Thu, 29 Oct 2026 15:01:42 +0700
Message-ID: <20261029080143.12304-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029080143.12304-1-phucduc.bui@gmail.com>
References: <20261029080143.12304-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq() may return errors other than -ENXIO, including
-EPROBE_DEFER. Return the original error code instead of replacing
it with -ENXIO.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/google/chv3-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/google/chv3-i2s.c b/sound/soc/google/chv3-i2s.c
index 6353b2a079cd..ebc352bd9e9b 100644
--- a/sound/soc/google/chv3-i2s.c
+++ b/sound/soc/google/chv3-i2s.c
@@ -303,7 +303,7 @@ static int chv3_i2s_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return -ENXIO;
+		return irq;
 	res = devm_request_irq(i2s->dev, irq, chv3_i2s_isr, 0, "chv3-i2s", i2s);
 	if (res)
 		return res;
-- 
2.43.0

