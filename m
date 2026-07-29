Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0380141A51D
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 07:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785310563; cv=none; b=AKQ4e9n2wL1oHb3sEJrRRIXQ5Qa0yD05gG5jp9Z/q+A7PRKGwie+3XREcnW2MPFA+hpPW1J6QUfSIL8CQLiLJ+yVrAHHPKeJsQCuawhZKW175BAuO6VOZmL+0n0mtJP7/6SSgT2VCJ80YO4EtpZFhM0D3zBdGER1PVW9fjxNJzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785310563; c=relaxed/simple;
	bh=AqHxtlNM7AyK8I3L8LLWowlUF9R3cXa2DOHr3/BrB30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aMM+fWwi+ZyHZiBDUYj7epGmi7Y0Drm0hc/xnMuYrOUNKTWbgM5TKJuD/LTBJwxcLxuk/xoJhwRdNuwIqzDqfmKayDGnb0Fz9TCalzMdWyEM2EvSHLe5WmvihH6cEjYlpHD6NhBjR20x7KwN820jAlny/A3m3ZHfhbTkSs3T4GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIKKprWS; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIKKprWS"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso376178a12.2
        for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 00:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785310555; x=1785915355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzyBHHbPe20cW9Xhei/La8y13Pw7WVo2I+NkOrEqUUk=;
        b=VIKKprWSUGW76r/iXtb2ah0HCieKuFTVtRUXRZFPo/vpA0bpCkn2VLUozBAqjClaDq
         vsENRJPwS+dKgQhqXbLPCqAdqAsP/OdeyUWrhPyTv2GRxBj/EdOr/ethw0I+lP4uqDk4
         M8ffOliS6OACdhAnXNbwMO1W8/2iFbkQl+ZzUEHJ4l8qaffLN/T3G2/9LGLHVAY4nT3/
         nbLkKYCnU9izCOAl83MmKQz2uNd5+mYLfMg5V2MDQjceFtR84WZP3OdyxL99zyejhGV7
         EhI+EGVUCHfUZ6yaf1Q+YEEE46BHIh04WIJGwF0xOxMI9Angebu1gZoF6Ig/wpqjLDGV
         78xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785310555; x=1785915355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzyBHHbPe20cW9Xhei/La8y13Pw7WVo2I+NkOrEqUUk=;
        b=KNE8f+yJzA4pYliLtz1iNqd9I6Vo1K2eEaeI44sNYDn47Er/kNfbdhaM6w1U0C0MRI
         3FkZDZ1pAFycRjTNZ2gOuQeDnfHaS2ZWGkjkm/Cljcz3dgp/776eSaRXhD00p22biiOU
         on1lHHaxjzAAA1LgeBzvBt0+mZD84zGJwt9knMy3t+rk4T1DKUEvT8DcgVK9HevG//Sq
         02vn907+hcA7AKrljPGuuS9TzR4CV1tI4+Y6oCUva8IcQxpQmGZuoEdMq9GsyeWOcffv
         600Y5zoU1T6of24wjHmGmccLOaJULtEEXStyWLTqNqGt2b86DxboLrn3GakBMpuVDmL8
         be2w==
X-Gm-Message-State: AOJu0YxvS6fY52qqe0BbLa1SDqgaEAy3cDjmybEFKP3gd6j8aNLSKLdR
	H7AGwBR6s7vTtOv3Jq+dXF/JnwIkxrVbccl6a3jmn45HOMdQikdEWpmq
X-Gm-Gg: AR+sD10mva0SwkQgP+VHmUyTfViHQbWGWAXJuJm2DHV/a5k5AsXToOyM8qJLr5a3aaq
	SbqQNq8SLqic0RykNrMm37mBHSsrVW6RBsUBMJYHXU+8ZCtzMH/WGY6tj7HLg9yRBDWQmSc0Hl5
	nUfoSegFD40xy5r16iRglLgwt6/gXCmQDv6uzrgI97nLQUNS84zQJ0QfxC00vFNwDNy0I7vXfDB
	s/WAqzeTvMajTAI1EAAZKEaxs4J0Y1RcfuX90Gz0v5zg3tw7XWQhsOZTsT5E2fYVws2bkjRAKUq
	CKq0e5FwMB5m50ptVPMzoIvFyBYHMDvKNHZNrCvlQDWKDb7sJu5meVljEF1IRuvrZznv9bm4ToL
	2UTz4eWWoKASvCcTrAmWoWBk9ooUhrLZhqxF6QjeZT5tMODp1UUpRXnf8SXvq2z8dd42ea0LMg3
	gyRkCk8BC5StWH99oQ/oj5SDEWwtDy/WexKLElSgmKFgN3fZ1vJt0aw+c4Rq0YWenAcLbTNq4Ox
	UwIjCA7S0oqA2j4x/dV86rbjLyQY7cbwUX6y6Qsu/2ZlNDvCaN+6qktOEYX7OTh2uRETl4BYTNl
	yC6z
X-Received: by 2002:a05:6300:4083:b0:3c3:90e6:48b9 with SMTP id adf61e73a8af0-3c8ba639865mr6686785637.66.1785310555210;
        Wed, 29 Jul 2026 00:35:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb7a99a7dsm513175a12.5.2026.07.29.00.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:35:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: sprd: sprd-pcm-dma: Drop redundant error messages
Date: Wed, 29 Jul 2026 14:35:32 +0700
Message-ID: <20260729073532.56468-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729073532.56468-1-phucduc.bui@gmail.com>
References: <20260729073532.56468-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The called functions already log failures where appropriate. Remove the
error log here to avoid duplicate error messages.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sprd/sprd-pcm-dma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index cbf5bf82d96e..f509a4601de2 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -469,8 +469,6 @@ static int sprd_soc_platform_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &sprd_soc_component,
 					      NULL, 0);
-	if (ret)
-		dev_err(&pdev->dev, "could not register platform:%d\n", ret);
 
 	return ret;
 }
-- 
2.43.0

