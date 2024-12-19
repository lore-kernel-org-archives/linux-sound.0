Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6D71AA1CF;
	Thu, 19 Dec 2024 20:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734640439; cv=none; b=OnCBB0/qmu94kIopQseXXfvzynmU9pUpKlKuB3UY/F7HDD4nhq97Jk1do2gyeZkuSO0F3/qEUNyq0vKgUk3mijtmm2AwnTtMJo6Bv7nmmNLhYbgsu/BcLtv1XV0T/q4FUcYRZ2DRLmJarfDqcW6L83+bdkI8iEDAyF+YZsyX1Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734640439; c=relaxed/simple;
	bh=er0OMWT2+NlrTghlLl5FG8rwxCqgLZXrTODizcX5GIs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IVvwi5bXOy2NPp8mLcCK9EeaWcIkvnJkbCeYOI/kyuodKpYT3IigLnRQs7LnIUidikQQdRj+72Lrs9fwUHhpcyabIkuicG0MrEe4Syxu1SSd0nfCh1s07FK9HVanDxW3ASYrpQPI4nnXS8LhtBZocP+2UlJi3MKL/47IWXPTDuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=WCNsWwV6; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="WCNsWwV6"
Received: from localhost.localdomain (unknown [5.228.116.177])
	by mail.ispras.ru (Postfix) with ESMTPSA id 69161407675D;
	Thu, 19 Dec 2024 20:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 69161407675D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1734640431;
	bh=fT5jATXVLXdkFpAfo4IKfhTUS10Kqi6KNdkMhrfR6UU=;
	h=From:To:Cc:Subject:Date:From;
	b=WCNsWwV6UB+JFuGxr2EF+AF33VchrEWJH1PJWOaUsmDp4O7npNfxofuchJuyIsEQZ
	 W4ku1dwiZ3fOtw8bA2hV5EHnUUvx9pmhV9h5/AuGnPcv1OYqYZmqm27ggSDOMZM+D4
	 W9WYLyEErEycOuwzIMnvWrufOphKcvGQtyqVaghg=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Takashi Iwai <tiwai@suse.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH] ALSA: memalloc: prefer dma_mapping_error() over explicit address checking
Date: Thu, 19 Dec 2024 23:33:45 +0300
Message-Id: <20241219203345.195898-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_DMA_API_DEBUG enabled, the following warning is observed:

DMA-API: snd_hda_intel 0000:03:00.1: device driver failed to check map error[device address=0x00000000ffff0000] [size=20480 bytes] [mapped as single]
WARNING: CPU: 28 PID: 2255 at kernel/dma/debug.c:1036 check_unmap+0x1408/0x2430
CPU: 28 UID: 42 PID: 2255 Comm: wireplumber Tainted: G  W L  6.12.0-10-133577cad6bf48e5a7848c4338124081393bfe8a+ #759
debug_dma_unmap_page+0xe9/0xf0
snd_dma_wc_free+0x85/0x130 [snd_pcm]
snd_pcm_lib_free_pages+0x1e3/0x440 [snd_pcm]
snd_pcm_common_ioctl+0x1c9a/0x2960 [snd_pcm]
snd_pcm_ioctl+0x6a/0xc0 [snd_pcm]
...

Check for returned DMA addresses using specialized dma_mapping_error()
helper which is generally recommended for this purpose by
Documentation/core-api/dma-api.rst.

Fixes: c880a5146642 ("ALSA: memalloc: Use proper DMA mapping API for x86 WC buffer allocations")
Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Closes: https://lore.kernel.org/r/CABXGCsNB3RsMGvCucOy3byTEOxoc-Ys+zB_HQ=Opb_GhX1ioDA@mail.gmail.com/
Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
Decided not to wrap long dmesg lines. If it looks really ugly for the
commit message, please feel free to adjust them to the standards.

 sound/core/memalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 13b71069ae18..b3853583d2ae 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -505,7 +505,7 @@ static void *snd_dma_wc_alloc(struct snd_dma_buffer *dmab, size_t size)
 	if (!p)
 		return NULL;
 	dmab->addr = dma_map_single(dmab->dev.dev, p, size, DMA_BIDIRECTIONAL);
-	if (dmab->addr == DMA_MAPPING_ERROR) {
+	if (dma_mapping_error(dmab->dev.dev, dmab->addr)) {
 		do_free_pages(dmab->area, size, true);
 		return NULL;
 	}
-- 
2.39.5

