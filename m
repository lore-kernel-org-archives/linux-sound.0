Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67797380
	for <linux-sound@vger.kernel.org>; Fri, 30 Aug 2024 07:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725004408; cv=none; b=gtJ+/PYC0CjHB0CJ5z4vLSsmRXpXSDeIarwtGBR66NFDItJKWzDX+a2KvcCK2u9Q+JWyBOjachl8YrFzlVDCdFO9k2K35gGBjGLgzdotfjgZkL0K6G0H115l/NbVeO1mWs8iwaHmBYNkPpzo7Tphggit27hHiIkmTRrPVjD2bFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725004408; c=relaxed/simple;
	bh=9vO+Ek6hKVh9w0BK4YkwOrPzcSbErR0GiJZuJvUdFr4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R6A3AOg6wRdNxBkO2rY8ZwWSg28KVsqEKYGH+LKriVf9pI6NAdEDD07Be0DWxcHBRwrfKoProvW9RPKC6UFIwpoVy1f9yXTd1mCd0icKqDLnAnMhvKjxWCg0LEr9iiOe2cmNIZcMnPzjVKi76RTbf18WHS/VDNdxR5LkbBI/n28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ww9Kj70sGz1HHgn;
	Fri, 30 Aug 2024 15:50:01 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id CD44C140136;
	Fri, 30 Aug 2024 15:53:23 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 30 Aug
 2024 15:53:23 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>
CC: <lihongbo22@huawei.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH -next] ALSA: pcm: replace simple_strtoul to kstrtoul
Date: Fri, 30 Aug 2024 16:01:35 +0800
Message-ID: <20240830080135.3544948-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500022.china.huawei.com (7.185.36.66)

As mentioned in [1], "...simple_strtol(), simple_strtoll(),
simple_strtoul(), and simple_strtoull() functions explicitly
ignore overflows, which may lead to unexpected results in callers."
Hence, the use of those functions is discouraged.

This patch replace the use of the simple_strtoul with the safer
alternatives kstrtoul.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 sound/core/pcm_memory.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 8e4c68e3bbd0..fea8bed02604 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -185,6 +185,7 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
 	char line[64], str[64];
 	size_t size;
 	struct snd_dma_buffer new_dmab;
+	int ret;
 
 	guard(mutex)(&substream->pcm->open_mutex);
 	if (substream->runtime) {
@@ -193,8 +194,10 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
 	}
 	if (!snd_info_get_line(buffer, line, sizeof(line))) {
 		snd_info_get_str(str, line, sizeof(str));
-		size = simple_strtoul(str, NULL, 10) * 1024;
-		if ((size != 0 && size < 8192) || size > substream->dma_max) {
+		ret = kstrtoul(str, 10, &size);
+		size *= 1024;
+		if ((ret != 0) || (size != 0 && size < 8192) ||
+			size > substream->dma_max) {
 			buffer->error = -EINVAL;
 			return;
 		}
-- 
2.34.1

