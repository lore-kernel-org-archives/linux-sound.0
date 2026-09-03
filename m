Received: from mta0.migadu.com (out-56.mta0.migadu.com [91.218.175.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A9144B662
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 11:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434357; cv=none; b=e6KD9DbI2pvsrCp4ndbTI9L9aMGGeNXlZfyXWelovd0RGWGZpN8j/Y/paxgnY+uwYzElSi0kF5t4lEEcIPYhzdwNWmDYbePKGmJ5sOcHpifeOtLaAXQOKtdatuZZ6ScSNvYuXtVi85MvUc3adl0hNBAEeUxaQA9WcLi+P3cpMUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434357; c=relaxed/simple;
	bh=djQR151LWR5r6Odqk9EUzUmJZ8ji9aRJQ5JrguueLF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=jAT+3lAGz9X8ySAyiGRAk+SkYui/77CCT8pA4aDIUEP+1XWoRDQd7ueEgyulgtEGHioO29XZh/dX4ChcJVvnElzfCFY6JtFBfrVr7s7CYYTTgGeU7qeJsnyzgqLVE2lPlgsOEc3XW9C2O69039/tNXlYD/ghBWkKnTtueww25fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-sound@vger.kernel.org
X-Envelope-To: linux-sound@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id c5d2fd294c07e24a;
	Thu, 03 Sep 2026 11:19:01 +0000
X-Mizu-Trace-ID: c5d2fd294c07e24a
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	hch@lst.de,
	harry@kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>,
	linux-sound@vger.kernel.org
Subject: [PATCH 03/13] ALSA: n64: Don't use GFP_DMA when calling dma_alloc_coherent()
Date: Thu,  3 Sep 2026 19:18:26 +0800
Message-ID: <20260903111836.1777265-4-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903111836.1777265-1-hebaoquan@kylinos.cn>
References: <20260903111836.1777265-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

dma_alloc_coherent() allocates the DMA buffer with the device's
addressing limitation in mind; the DMA core picks the zone from the
device's coherent DMA mask and ignores GFP_DMA passed by the caller.
Remove the redundant GFP_DMA flag.

Cc: linux-sound@vger.kernel.org
Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 sound/mips/snd-n64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/mips/snd-n64.c b/sound/mips/snd-n64.c
index f17e63f2ff5a..e2cf9df15d48 100644
--- a/sound/mips/snd-n64.c
+++ b/sound/mips/snd-n64.c
@@ -298,7 +298,7 @@ static int __init n64audio_probe(struct platform_device *pdev)
 	priv->card = card;
 
 	priv->ring_base = dma_alloc_coherent(card->dev, 32 * 1024, &priv->ring_base_dma,
-					     GFP_DMA|GFP_KERNEL);
+					     GFP_KERNEL);
 	if (!priv->ring_base) {
 		err = -ENOMEM;
 		goto fail_card;
-- 
2.54.0

