Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647504A32
	for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 06:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771221612; cv=none; b=sVv2JJ9d3P3oBwH3cLJbcQdm7BMUnXpxzqg9AvhquQ/cIyEzfdR9JuWPh38cxLltULeme2ROSa5rP0mISSjJwOTwRpkl6Hl1d7Vzgv6fUmXf9fiWG8pItfUqNJrBs2ddXXlukrGII3S0RTE2Akvh+FO4BYoNWn7CFbKxEZt0H8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771221612; c=relaxed/simple;
	bh=ZT3N/qgsDKJLClRrrsJpD1An3BaJNl25sapQOxs18TM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ucf5fMgsUIJeWYLp/QdjFxwXK2y0ZqfvMf6d9p50+QvkTsJWrH7zPwUJtwKgEO5MnKI18wAkIN3gu6gGHjyWZL+5ETCFLzTZ31Am1XIKJ57r6PRytGiriir6MLl/nD40KM9iKbnHd4rQ3sU99vsvuZL/ckZjGozCeB5E0u8XVBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=j5gwHWht; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="j5gwHWht"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=tMaVIB4IxlHp7fuxn6lbrgt8+8KiNH4ASR35Eu56eSo=; b=j5gwHWhtNm3DNDzLrLrLddVZ3T
	05UC2/svezrQBq4EjZaMv439rXy8ZNbHNQTkyXvMJv//9bkZ03kF0h0RjB/o2qQr+JkJErpOkd5ad
	8kA0goRI0yndIqCTYHTiMfV+8K2nMy5ZtuT3aUF+Bdr6QuLM3oDAkw+AXzHXHrYcTRHZ8LNF+CtZ6
	NcUfDWkJOXsKSrqSNGAXmi9pPz+GL1KXLsMnUis+YHiULfSTr0kKXuzHo/JAF+Eoq9PBi3daQhACd
	SroCuRHVBi/yPIceWzBbXPcs93raGIiZW0qsPRB75o5CgCiFaq9C9t0hXPaWOMg63HjrlGJbUeuRX
	HJEtifng==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrreU-000000060F5-3Ryn;
	Mon, 16 Feb 2026 06:00:10 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: vx: use correct function name in kernel-doc comment
Date: Sun, 15 Feb 2026 22:00:10 -0800
Message-ID: <20260216060010.2784438-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the correct function name to avoid a kernel-doc warning (when
W=1 is used):

vx_cmd.h:210: warning: expecting prototype for vx_send_pipe_cmd_params().
 Prototype was for vx_set_pipe_cmd_params() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org

 sound/drivers/vx/vx_cmd.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20251210.orig/sound/drivers/vx/vx_cmd.h
+++ linux-next-20251210/sound/drivers/vx/vx_cmd.h
@@ -199,7 +199,7 @@ struct vx_cmd_info {
 void vx_init_rmh(struct vx_rmh *rmh, unsigned int cmd);
 
 /**
- * vx_send_pipe_cmd_params - fill first command word for pipe commands
+ * vx_set_pipe_cmd_params - fill first command word for pipe commands
  * @rmh: the rmh to be modified
  * @is_capture: 0 = playback, 1 = capture operation
  * @param1: first pipe-parameter
