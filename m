Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771460;
	b=F52+I1QAllTd2dqT0tw4eoO0MZmlivht99cYUQhiRDWo+PyeGAFJo1aNwgOJqchRpimR
	 H0545nXXujgzApGm9iynwQGn0I7j1lxP6c/mMcIVlA0jMRYqnKNYUFFcTiWB7oHo4hTvM
	 /ZwqUFC8WexVvwuuf/4m05jlVyzIFm5K5hqetvdnbfuP0XJkMERher7Rud1VDMOFQSPgZ
	 Ez10dBmlsorznedhZ8XBmdhjkp4pV7YDnxDSBu+wKUOMUERoHek+oDHygRf/DF5Dck/o9
	 w8TWo9U4drT1J3pz03zdhd6IFvyDVy2KpT6UZvycKMScY/cT6u0Tb5l8yO7q+d39j0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sIlYxHLSdQtSPp876GteXWV9v1qfiA7qZg4ralsrU7I=;
	b=uhtdrZGcG2dxo47zDGbIGjLT5ewzMJpIqi/VNpE473oDkNXGWu2QtnJiG+1Hsm+vfAQ8
	 U00I4dQV0WHuuY1SyOSxmFUYeK6PCtu5bInugTy58tGtuISQ+FwvxLZIPjuzeVNGGqgEE
	 fy+2+hl8uqtFPzsvr0v5TTTlQyxr2+8p3p1FUJsIGbPVup99HWcnaebYWGJhFdBDR7Zfw
	 up6yFKVUXUjv2wB+hw8DCQh3/3clXvDl4n9S3OWuaVeFCRsnBO/G1CjdHmwKUPB6RyePh
	 SGU2jJ7cjRh/dFxsZtKhHFPVeA7N7C3cEYKYM9kH+6+Yhbc5n+ziiRaA5itSl3ftBcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tDgQCC5e;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645D9606A31C
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 09:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 645D9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tDgQCC5e
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso3748614a91.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 01:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771460; x=1796376260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sIlYxHLSdQtSPp876GteXWV9v1qfiA7qZg4ralsrU7I=;
        b=tDgQCC5eO/Jw4U04QZZTgXghQ1FMpydPtxmFZUV3G8ZbHVTDSZ9XGVnjSwHG93q1DP
         YIT9CVb9xKaW2lxsTexy0ck4/QTnT8156kUNsfyDrSWBGb+ax/FM8d2CYkdCjl+QkYCO
         S3prNXumUdqtq3uFTnu2ocOi3jZzHv6IPz0yqktK3GESWtgxn5rn0dTTg6Wg8qtvZDGq
         EGvVdW0WhBL+UUkqJFLQLds4xW0arK55qsVx92W1VEGKe/hR9WgD4fPrXmHBcwvWskBj
         cGUwUsvt9eI6y0Tb7rsu8LxF+Y7dU/HkNARbItYl5/JTTRMN2lSJoDQQMeD+66kFLrrO
         EK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771460; x=1796376260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sIlYxHLSdQtSPp876GteXWV9v1qfiA7qZg4ralsrU7I=;
        b=fypzJj9m9TyGWYysCS2Rj3LvY2YK/6gkadtmU8B10M4fcLv6tyy2EigFCncic1uVvL
         rTv51966ahehUqXApW3TEI6HtYcZE5vV5EuqhCXXvmw13iiod9PC0MfFdbWpaiG+D4Aj
         FmreiYjjgUEL4Kva1d1IymwiQFJEJRBPXd3j4wzXvlANibRwLRKsPBCKNWyYXijqItAl
         nExoGObtCT1XutFsgKQTzbiMlefHv82KVIie17LXdkytYGWT9ENszRSJaP1ceyEHc6p5
         GsYjo8i+nhaYkS8wmIpmyL0nueCo8sXmLiNKH/dQjY7NvAJT718F9eKgKFH2F+aARh1r
         mAIA==
X-Forwarded-Encrypted: i=1; AL+hErGpp2gKMwlmXVde/6BpD/Lt6sfbOS/Si1hTwGI+MeKdvUpy+oJ5hq3Ijzc0Q2hWN8QNA8lxgrzTTU2d1Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/mLBRZRXsriLxWP796k5sEzVpWKXbqQqXKAp05srOwTQZGvCHF
	g9zHGorpVMYbfjh+rhl+/+EhjZe16J/H2SpkrSV/3ZBOCoMKdLp1Cviw
X-Gm-Gg: AZFdTZeqknO7xKCYJNSmWLpKcf/vwJtfgg2a7MDDK3ymQIxbCTKAuJ2Xx/s3P+88zUK
	o0cIVYT6YU4wHeI8lN5H+BzwUPYXZPbBuzxkykT+XwWV67N+MUzpFlmbIcpbvRyVmlqGA3oAXIe
	N+iGgwAyzwHDgU2Bzsh8qOBl8+PPxCIdedURAc5or0EJwYOIuDh7CUFCCjLtb8fMeu8tnPCqZGy
	xzU92bA5x3kO+VBbiRWYjyIH9E5/YNyLwOtZBHLr+ue4m+xwBHdCj6XOl3QzM+QjG/rQi4RH0JI
	UfhqqYUXatbdwyAFgdmI9Ye6EX9//SHBXrE92N+ZeWqQpgZ2+HGiOITD0f4CxNLOXX0bG1qrqlP
	L0VxUqrq1+Wh6XEVHCwZbwDYVefPxW+kbGIj6aJl7EpaKQYmUp6mX87kNeCaUmnM4p0XZPkk0nb
	hxk5vfS12LeKwSl7Z4C7x9dckOTjWc+eUYAqgiPXiUXwe7ZSexhWdJHo/qAdnhxSEDQWIEO3jWP
	d6NMafEyFWTHRYX+TGLjsiouz34E5Y1eNJ63SFy6HbnvBcD2C9ZxIHQDCGROitWH0oGHIQqwlTH
	J33oGmulMXx7iKTesttTBgtcsHyzJNcO7W8TyfR4pmB6jUzn/vuDMl2M+NM9PZly96nBsC1KGPZ
	WpAsZx8TnF4fQGz1+pRWlXwQqtlzORpymDYxD3xVqadvh
X-Received: by 2002:a17:90b:57c6:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b41c9617ffmr16825117a91.37.1795771459702;
        Fri, 27 Nov 2026 01:24:19 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm37942052a91.6.2026.11.27.01.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:24:19 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: stm32: spdifrx: Enable clock before setting substream
Date: Fri, 27 Nov 2026 16:23:45 +0700
Message-ID: <20261127092345.12383-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127092345.12383-1-phucduc.bui@gmail.com>
References: <20261127092345.12383-1-phucduc.bui@gmail.com>
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

Enable the clock before assigning the substream to avoid leaving
a stale substream pointer if clock enabling fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_spdifrx.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index ba6c715750aa..1d62a6fdc472 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -753,14 +753,16 @@ static int stm32_spdifrx_startup(struct snd_pcm_substream *substream,
 	struct stm32_spdifrx_data *spdifrx = snd_soc_dai_get_drvdata(cpu_dai);
 	int ret;
 
+	ret = clk_prepare_enable(spdifrx->kclk);
+	if (ret) {
+		dev_err(&spdifrx->pdev->dev, "Enable kclk failed: %d\n", ret);
+		return ret;
+	}
+
 	scoped_guard(spinlock_irqsave, &spdifrx->irq_lock)
 		spdifrx->substream = substream;
 
-	ret = clk_prepare_enable(spdifrx->kclk);
-	if (ret)
-		dev_err(&spdifrx->pdev->dev, "Enable kclk failed: %d\n", ret);
-
-	return ret;
+	return 0;
 }
 
 static int stm32_spdifrx_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

