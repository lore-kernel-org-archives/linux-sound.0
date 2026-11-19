Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083009;
	b=LhnL2yrgrsSzl3UIjx7dZNfbJlDvizMoWh/yLIsyLYs3XMLeREt5+5MFk44VulgWcH6J
	 Uftw1t+9B84bqW5jZbkd3U4yE1eAGPN8SnWhS7VVWuinET520mkifwCJAVQ2ukdgPAmqx
	 m0ZiuxQoKjz3xl2wmkzp+JfLJewg8QVTLeSt/CcXkc/WA+S45ZvJCm/dCmdoG7oECxp5I
	 1QA+5vIt2DFTZFE+dTEmJWW2mjmCViNush8D4Gj9LFE75r3sL88U2OlwMNqAObyRK/Pog
	 G/5MjhHcVZCAcEr8bIwE4fBigymypxVOyinbWOWVYppz110dea5vr8yRj3inziY47jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1VCxugRGfr9JL3h5ot/gqlsJ3Pc4OjcX6nU5IZyeWk0=;
	b=XMGik0vcfrPfxt/3vKHW2yH6m4P7F7NfeNxk8aZcdR2CkqroTdMcBQ1Rk50+KNC4Pfvq
	 qan8IjyKLkly8Z2AavLL6RP5Vjyvp70Nv97enXsNJ/iBcXdG6iUkedM88HxON7/3A/JF3
	 zJeVZpUGLjgzn6g+Sed0natnp1yojqdpo5eOsfJmDD+NoHVRrrxrtwGO5k2s+vlxJsoeb
	 nC/pUhrD4c/UnRHJcouJrWtFc4cxLProY5Sxa093cOWa5ehf9rpE8F1NtnF04eNCIfvfp
	 KPHo+CxFrEPApxIql66Q5L1CsyQtLRyv5lP5cxR4l3NRpENFoYhVq/+n6PUz0ieB5FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWeVUtqF;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC488606A324
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 10:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC488606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWeVUtqF
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a315ed211so719905eec.0
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 02:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795083008; x=1795687808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1VCxugRGfr9JL3h5ot/gqlsJ3Pc4OjcX6nU5IZyeWk0=;
        b=lWeVUtqFC78fSXsXF+xwkLqCFLPeZbMySmeOJbs31rL+CAAeclK1MdGPZY6lS+X9XP
         KBYxiMWx4FvNJ4JhQTDNQlGQM7FkeINXx2UJKB1cHUYGf0MQqYwDsgIn9jm0dbp98GAV
         j8u9xjVl7cUdnV2MWcexsUucMhvsBj694DWVhrhrKVgDO59mqJL8gYo4RIHWuAvDPEzL
         aw9PlmTlLSvvK6gcz87pUZBzZm32QZWdfXWepGMbTmJugndUdTC4N4h5d6efWWObXzmO
         l36aVCyqDnrsxcDBAHazRt9GpR6dZIRi7UggbKkzuydIIAqPXMKbqNov3/AAYf5zAkVR
         n4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795083008; x=1795687808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VCxugRGfr9JL3h5ot/gqlsJ3Pc4OjcX6nU5IZyeWk0=;
        b=TgiribnvIimNw3iinkTx5kh+bI3rYMiUs1CUFenbZY6UW2ypxRp3Qj0fvdvSnw4sT4
         pSj0dmQtfAeU8eRdACs1mcoUqsMeE/hCs2FZajWexpxb6t+2IzbLc8hW06syYVomJsYx
         JFCQkuR/Szc5TJUUa6GEVEbsp0U36VFEam1z0Phyq++CjgtwGrWvC+JQ5haUgk9jWo1+
         rIrSgduZhhDNzd3oiFoq9sro3j7rUfDZvdUR6nQ+5mCYXRyVuSzL4V+6O0oWZavyYxaB
         nsqT43YgqqsBQN0eEPlwyRPGgjT8gCtuekkuM2UNY20klOk7HPwBn1Sh3at81BTt8Svy
         kRGQ==
X-Forwarded-Encrypted: i=1; AL+hErG+T2f3rr5wBilVuEaCnSi9CBexhN7SKhU20kEdNOeJVTsEPUdsEAfobs9ZObKBKjFvKkY0WwwmLyREIg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+mvWkbbl81nACM3ol5K2a2h4JuZz5xDHMaiccyzM8yNZGr31eD
	aFplc0kV2z/kjNBPzZ/XVxLXW61Ay1hASIoP98x3bABLDsKcA5tHtxAJ
X-Gm-Gg: AZFdTZf5fzzqDt3xA8kZYQPrvI/4900pwVNGbCoevB0IYha4rBNoC5ZzjWIaz+mx6xX
	ISJwHz2HjY4X5Penk06CPGR+Ma2L3yllGwKZLaQ6jvBMoRQs9Rhd3IyktFvh8AblDmJ1LvyofOc
	3GwDA+SEPe3UMAGUKDaYEh2YkjXY7K9VJS9Rg5gdP7RvnF4WK4Frv+xR8tFCHsMHBlVQjCN87vI
	cdhBRyd/fhbH4jR6E700/Citi8ru5b8jZVhvIVUnRyFU4AG/jw8RPW8jfY5PddVcnr/aT3yX46+
	0eGXlqWEM084IGkawOpr//+ldXJHu7WloNDFyflGoHWbYva5/7aZgM9+xW6hA0TyY7VXKvcQTOB
	nc6NUh3RdpVC6qpHWfa7pkRFCny3eWpjyhtQX/d4aqtCBAUAPElfikfA5FS3iLurReO3L8tKlmE
	riJgRaglE6G96PNd25XPF03ux5zRKCOXjV9Ym4HNZgTvZ+bkx+UcqElpWFL/kDMPdidTSCkMXKo
	Pe8+Nmwo6x0l5l68UFky1LAmVRSDSSt9j7WrODUQE5Jxy9QLjv4w0ykwXXS4W2hV6DN5fOrE2bO
	O0i+UCd7VSs3X0+BbMGT5b4FB3Ebw+/J753w2mWMUzkvER+j5b+q
X-Received: by 2002:a05:7300:51f8:b0:375:85ac:d14f with SMTP id 5a478bee46e88-384b3e786bdmr628025eec.14.1795083007854;
        Thu, 19 Nov 2026 02:10:07 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm18680854eec.18.2026.11.19.02.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:10:07 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: memalloc: Fix DMA allocation retry cleanup
Date: Thu, 19 Nov 2026 10:09:28 +0000
Message-ID: <20261119100928.2740-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

do_alloc_pages() retries allocation with lower DMA zones when the
allocated address exceeds the device's coherent DMA mask.

However, the previous allocation is not freed before retrying,
leaking the allocated pages.

Also, if no suitable DMA zone is available, the function can return
an allocation outside the device's DMA mask.

Free the allocated pages before retrying and return NULL when no
suitable allocation can be obtained.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/memalloc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 5986e9b84ac0..9458f9cbee53 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -298,13 +298,17 @@ static void *do_alloc_pages(struct device *dev, size_t size, dma_addr_t *addr,
 		return p;
 	if ((*addr + size - 1) & ~dev->coherent_dma_mask) {
 		if (IS_ENABLED(CONFIG_ZONE_DMA32) && !(gfp & GFP_DMA32)) {
+			free_pages_exact(p, size);
 			gfp |= GFP_DMA32;
 			goto again;
 		}
 		if (IS_ENABLED(CONFIG_ZONE_DMA) && !(gfp & GFP_DMA)) {
+			free_pages_exact(p, size);
 			gfp = (gfp & ~GFP_DMA32) | GFP_DMA;
 			goto again;
 		}
+		free_pages_exact(p, size);
+		return NULL;
 	}
 #ifdef CONFIG_X86
 	if (wc)
-- 
2.55.0

