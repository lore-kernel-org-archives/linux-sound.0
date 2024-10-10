Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD341E2317;
	Thu, 10 Oct 2024 20:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728593626; cv=none; b=N3sX9vYZ3vpHxwEZ6Dt4WABW5b++SCJu0nAFXWo7wVusJ3zgfsBiTfUmIHSEqGx9lkRppC3OTQgDirMYrjR7b01hLMrZhVwnzPv2PwDEH6UGKv9thekYTR3/f2tOlG605iSvAlz6clNebySW+2cJgAepZg06fxYESKLGPlzwui4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728593626; c=relaxed/simple;
	bh=/tCyP/0YdcXRjDmegk+9uAFckzniZ+ognS0EA1OnMWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R7+ktFGc4a/7usV3PhPEfovyNtbfJXwdUTOOz9B4BG/Fc1lND04yHBRhEkHOy6DbmQJfEKJV73vHVlOlWAh8BkmPj2cr9DZwX6l2MD00I8swDHTiiQ97EkJkP/xdAPOeTtFlAvNjworxqYQZqE1muIcZvkVGEjnfjOjDQXeQplM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=LWrS50by; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="LWrS50by"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=dIN9SUDcVwpX/Crm33XSbiqwhkhMRMTPoIouQU+F9jw=; b=LWrS50byN0vrA+to
	oENAABUyZr+mMgZOQWKJNwWNouAZvusVr42HedSIRCKC8tcHLgpTk8fuDRtfi0vEXKceCC41Yl9Yo
	acBWpnu+5/7otkTEEl6go/dYuT+9/rzkgwxkKtczhrkeFFtutSIGXkpX1fjk3eCQ8AOT4XhF1xKoQ
	y7UvWrRAJYO8YjB4K/5EwvUdL9g9YYj5A2ZiDcXA/usOxNtOXM3Kgtdeu4n23eQsir03KcysmIGEA
	HYwCqHN4ZpjNwAOOZIXrAirwD4hwMuERsFXD6U96IpfBX5uGPrSNzwbJFY1gRYvP8r2TH3UehrM6d
	fBBOQFc1SRXwMrQZMA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sz0AH-00AMqJ-19;
	Thu, 10 Oct 2024 20:53:41 +0000
From: linux@treblig.org
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] ALSA: core: Remove unused copy_from_user_toio
Date: Thu, 10 Oct 2024 21:53:40 +0100
Message-ID: <20241010205340.278133-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

copy_from_user_toio() has been unused since commit
ce2d8ed8d809 ("ASoC: qcom: Convert to generic PCM copy ops")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 include/sound/core.h |  1 -
 sound/core/memory.c  | 20 --------------------
 2 files changed, 21 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 1f3f5dccd736..b5a6f3d2bff5 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -267,7 +267,6 @@ static inline int snd_minor_info_oss_init(void) { return 0; }
 /* memory.c */
 
 int copy_to_user_fromio(void __user *dst, const volatile void __iomem *src, size_t count);
-int copy_from_user_toio(volatile void __iomem *dst, const void __user *src, size_t count);
 
 /* init.c */
 
diff --git a/sound/core/memory.c b/sound/core/memory.c
index 2d2d0094c897..8222a851da87 100644
--- a/sound/core/memory.c
+++ b/sound/core/memory.c
@@ -63,26 +63,6 @@ int copy_to_iter_fromio(struct iov_iter *dst, const void __iomem *src,
 }
 EXPORT_SYMBOL(copy_to_iter_fromio);
 
-/**
- * copy_from_user_toio - copy data from user-space to mmio-space
- * @dst: the destination pointer on mmio-space
- * @src: the source pointer on user-space
- * @count: the data size to copy in bytes
- *
- * Copies the data from user-space to mmio-space.
- *
- * Return: Zero if successful, or non-zero on failure.
- */
-int copy_from_user_toio(volatile void __iomem *dst, const void __user *src, size_t count)
-{
-	struct iov_iter iter;
-
-	if (import_ubuf(ITER_SOURCE, (void __user *)src, count, &iter))
-		return -EFAULT;
-	return copy_from_iter_toio((void __iomem *)dst, &iter, count);
-}
-EXPORT_SYMBOL(copy_from_user_toio);
-
 /**
  * copy_from_iter_toio - copy data from iov_iter to mmio-space
  * @dst: the destination pointer on mmio-space
-- 
2.47.0

