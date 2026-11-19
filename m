Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085372;
	b=CZQt2ZMaVD53giZu2Wu1hqpBjBeCGuoODN/b3NEU0KvhSE7J8mMfgQLv0M6k1maFs32M
	 gskjQ2ah1TQzeekJjOT+ijCOuKpKqBXjyN/0xdFpYUCY2pwhaGLC++VRcIn5hhErYq+J+
	 PJjEi1Vm0grTo1s51N2qXNLQBN+B5w+WIXeWN3w8q+MrmgoyIUrMVfPTWdomu7j6oRl6n
	 RklmFL8V9jU2P8uBZpckT935pudHcW9GRW/GG6YCgwj0SOv2lXbL57WIVsUosgYarb8o6
	 Gl/NZpn9g1tq/j/k5QvKGQcuSdsp0sUz1HXwPylHc9SlPqqnDSyfelU7B2/HNQRB9ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=24Y0W+1MZQdnlIcGizra0bUgfZU6rBAE53rV3xCkuHg=;
	b=MjWWLwcTQ0yAXb9CCUWa5VgzB07Mn9M/KL0AdQrHYH6ZnE1kVlDa3bDhLIuPqOzK+yBO
	 hgwg3SPfkTsGWCY9iQn5DUrTh016/0Y11m4CrnA61ffdlFQ+xe4LdlDN8xpx9p+oh8nQ+
	 UFK/bQOfOLgUtx+aZxbh+iFtj3hubXOofkXO0zlqzxWH5hPjpxm5iROr6qQf1Imdi/LWS
	 5COvLH8T5cSxyxq79pLetUC4otIajqgctNfHAAmgtchsBRLgeEQSb2fn3BU/uoWEmyNhP
	 B7RLhqfl1vTi1cv5LBJf3X8SfAGY9L8S/3m22nwTPYRNh3BzZwqvDn4u39CYTNs8E+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9FZsBaM;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02856606A324
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 10:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02856606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9FZsBaM
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4761662eec.0
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 02:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795085371; x=1795690171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24Y0W+1MZQdnlIcGizra0bUgfZU6rBAE53rV3xCkuHg=;
        b=t9FZsBaMc5Sd6Y08wP824jpFmypi7QSvbierNeyCVfUa/13gPEHLF+qWkDIJV7gr+x
         LlHYwA3GNJ5CZWBFU5huqPxyrDkqgG7WWSwy/lH9cPgH1Q2OstsZd9n6ryCXGpULERl7
         5FpwzHMTiiCwhpj/BG4EirPuXkluh/yuIYb9ti2GkeCyTCu44OVRHBa3d6xPyqeAjpmJ
         Ga3BKN80tzbCpWiQ+j8DYhiBAQCM0aF5lVTVNmK/ssb7xJIHt5Jffonq+K4IXNE/G5PL
         loShQWlk3bShjV8oBtEfK2+rU5RNDACspALFsBuagHI2795MwmFeWT1VFWsZJGWamJl9
         mPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795085371; x=1795690171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=24Y0W+1MZQdnlIcGizra0bUgfZU6rBAE53rV3xCkuHg=;
        b=HUj2Sn1k2A+s905pmo5mPwaDaRh597ZfuktfMw/yipd764QVFDcopam7u5XJvnR//z
         52YsfUyvFD54Z94mFa8UhM1pzv7RZq+9gmeBwhVgIbY+gRHTs7EX+ij8MYZYLlibHxzJ
         fqFnPU7bHsQG7WUQc0VU53ldZfIt4OA70Ock+ghx1DItGyAE1WKmr93XEsWK6h/XQo13
         1BhTpOzuGqK4kBL6+aFzGMZN0QeSlp0dF0UXx3yn6GjubB+kIgAjIussUeAGHHJxx0vO
         PM3yGZiO4ilh35mwcy5HE5sd+jtEnGYP4fEBKjvdvVHA6BRmS1BP41X2Ne3YovUNsBfq
         CZZQ==
X-Forwarded-Encrypted: i=1; AL+hErH10+e25Fsz+SD6BWfAahUSAucJUD0NglZSQmu4HlRZ8vZLV7jdhYH0gCteoNnBQ2wwoUCh3pMsoCVXmg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+PgjVdluypgIf05I013y/zHxh5EfCeVHLXBPuK+D2el2FDtY7h
	zXkfw9cnpBNNrPYZASHiaobhwkFMlqTukjoOOlOAqEywbP7+0IYTWtSv
X-Gm-Gg: AZFdTZf4Jq3Drz+XP9uYq+x2iR9VdIIPBa9AD24ZObprmVmVck590I8zM/ay1o66nsj
	Ctuq/Z6Ffa5e3zKrlEgsZRFoOKcIJ/4LgIy5sn0rOVK29QiFQ3SUnlL0EkfAZxHt7wRmkIoSBv8
	LxfUK6XlBMCmggtUabd54aJly4f8YpEu0/QTb5XebgUwhw4HteHHWHxxTu/xDueC7VoIdzf7LH/
	ki4h0EXXKIwBU5CfMSezO4BaMzhwVFt+SONTn7loEpgSSyq+4J9CLxdAw4rTYIu/b399Y0Ne094
	1RnFAKL5j/Z2MoCrgsrhn19iX1QXz3ildycjXv1IiCgRKrI4I8NBg2pm6Adp5qvFuB/JyO+4uIK
	EQZ6kuz5SN2cJAxp3VETo8KdVBUiTqOD7HdmDDYll8xuXngTdgCmqRhMJEo+Jo2qVbVLd/QcOmY
	3HqDUe2QMoozoTlfl4L/1fFAoo7ALSnBMNMEyu/nJ0YGh7ubdlUdvOGu/ElkaCRz7d/cl3BMqHW
	KE48sA415Fe4A3MY6tgSMHYq+8pewM+8rt2oSJd6G6fbW5O2Fn2mKriosHt5bt3C29XSKYi1GU/
	qkk3TUrv91945jRiVpVvhtsyQHTXvBYdDeGWdVjDMw2oiRo0xTYr
X-Received: by 2002:a05:7300:ccb0:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3828140905dmr5025675eec.32.1795085370697;
        Thu, 19 Nov 2026 02:49:30 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6df02adsm17242712eec.14.2026.11.19.02.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:49:30 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com,
	perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: memalloc: Fix DMA allocation retry cleanup
Date: Thu, 19 Nov 2026 10:48:59 +0000
Message-ID: <20261119104859.2807-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119100928.2740-1-sreekuttan2156239@gmail.com>
References: <20261119100928.2740-1-sreekuttan2156239@gmail.com>
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

Avoid retrying GFP_DMA32 after GFP_DMA has been selected, and skip
the DMA mask check when the coherent DMA mask is unset.

Free the allocated pages before retrying and return NULL when no
suitable allocation can be obtained.

Fixes: dd164fbfdc20 ("ALSA: memalloc: Drop special handling of GFP for CONTINUOUS allocation")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Avoid retrying with GFP_DMA32 after GFP_DMA has been selected.
 - Skip DMA mask validation when coherent_dma_mask is unset.
 - Add Fixes trailer.

 sound/core/memalloc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 5986e9b84ac0..8fec4a8fd219 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -294,17 +294,21 @@ static void *do_alloc_pages(struct device *dev, size_t size, dma_addr_t *addr,
 	if (!p)
 		return NULL;
 	*addr = page_to_phys(virt_to_page(p));
-	if (!dev)
+	if (!dev || !dev->coherent_dma_mask)
 		return p;
 	if ((*addr + size - 1) & ~dev->coherent_dma_mask) {
-		if (IS_ENABLED(CONFIG_ZONE_DMA32) && !(gfp & GFP_DMA32)) {
+		if (IS_ENABLED(CONFIG_ZONE_DMA32) && !(gfp & (GFP_DMA32 | GFP_DMA))) {
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

