Received: from forward103b.mail.yandex.net (forward103b.mail.yandex.net [178.154.239.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EA950275
	for <linux-sound@vger.kernel.org>; Thu, 21 Dec 2023 09:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="Do65JobI"
Received: from mail-nwsmtp-smtp-production-main-31.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-31.sas.yp-c.yandex.net [IPv6:2a02:6b8:c08:d315:0:640:bb64:0])
	by forward103b.mail.yandex.net (Yandex) with ESMTP id B054C60039;
	Thu, 21 Dec 2023 12:17:49 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-31.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id mHKxWeX7VGk0-ETMXLghD;
	Thu, 21 Dec 2023 12:17:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1703150269; bh=a7hyItTJYxatho6t2uQuuL2eE1sI62o6vRp5hcS8fkA=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=Do65JobIuL2JcT4UyFT9SU9sTe5WXPCi1jOtr7RA7drnstBe1+eWyPZlDVm54l8bd
	 AFMWtT5K3imXExCLYDwrHzX2ydioJ7SI7vQkJApCIIJP7YMmUY/8kXfp5xWOwBQkVA
	 uJMQ5g2hShhjlwXERe11k2qHznBIpw/5iiu4BOVI=
Authentication-Results: mail-nwsmtp-smtp-production-main-31.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] ALSA: seq: fix kvmalloc_array() arguments order
Date: Thu, 21 Dec 2023 12:16:00 +0300
Message-ID: <20231221091605.14660-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When compiling with gcc version 14.0.0 20231220 (experimental)
and W=1, I've noticed the following warning:

sound/core/seq/seq_memory.c: In function 'snd_seq_pool_init':
sound/core/seq/seq_memory.c:445:41: warning: 'kvmalloc_array' sizes specified with
'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
  445 |         cellptr = kvmalloc_array(sizeof(struct snd_seq_event_cell), pool->size,
      |                                         ^~~~~~

Since 'n' and 'size' arguments of 'kvmalloc_array()' are multiplied
to calculate the final size, their actual order doesn't affect the
result and so this is not a bug. But it's still worth to fix it.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 sound/core/seq/seq_memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/seq/seq_memory.c b/sound/core/seq/seq_memory.c
index b603bb93f896..e705e7538118 100644
--- a/sound/core/seq/seq_memory.c
+++ b/sound/core/seq/seq_memory.c
@@ -442,7 +442,8 @@ int snd_seq_pool_init(struct snd_seq_pool *pool)
 	if (snd_BUG_ON(!pool))
 		return -EINVAL;
 
-	cellptr = kvmalloc_array(sizeof(struct snd_seq_event_cell), pool->size,
+	cellptr = kvmalloc_array(pool->size,
+				 sizeof(struct snd_seq_event_cell),
 				 GFP_KERNEL);
 	if (!cellptr)
 		return -ENOMEM;
-- 
2.43.0

