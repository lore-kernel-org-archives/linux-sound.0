Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB3213A885
	for <linux-sound@vger.kernel.org>; Sat, 31 Aug 2024 07:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725091118; cv=none; b=CQvBxzGysgLRxjjTZXIEPSUhjRT/O5gpwRN3dvZr8JKyHk7ybBiQTSfnPwWR8Ecsr7TXG9Wqh20ha2EVU9MUOExJdEOKb4H7noXD2KzVHLpdR14SEUhb0qXUDNyhggj2h9da6JZFDx1dRlPgEUxKLDsTweHi+Ay4/8FzhwM7Ih4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725091118; c=relaxed/simple;
	bh=DYts0bYVhccT3saSWAJzO470ZFs4M2idh7l9Z3A1PC8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lH+VlVNkxuQB+CmoqP7vejcbxFSR9woZzx5/ybFEb388f/rWF6d2YzqCAwEVchALcWRXKoqBAlcVFQsemfPC4WbD43SaHaZ/aMxkp7eotZYEPSkL189Y7jlk0119M18S2k1hHGVVZkKRWi4uHqPFE+vQ3ulEUtk/v1/wwZTT9PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WwnRz45Ddz18N3V;
	Sat, 31 Aug 2024 15:57:35 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 8A6541800FE;
	Sat, 31 Aug 2024 15:58:27 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Sat, 31 Aug
 2024 15:58:27 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>
CC: <lihongbo22@huawei.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH -next v2] ALSA: pcm: replace simple_strtoul to kstrtoul
Date: Sat, 31 Aug 2024 16:06:39 +0800
Message-ID: <20240831080639.3985143-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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
v2:
  - Avoid introducing the ret variable, suggested by Takashi.

v1: https://lore.kernel.org/all/1e4bee4b-023c-40e2-ac4a-f71299fa2efd@huawei.com/T/
---
 sound/core/pcm_memory.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 8e4c68e3bbd0..73d4fc49a0ca 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -193,7 +193,10 @@ static void snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
 	}
 	if (!snd_info_get_line(buffer, line, sizeof(line))) {
 		snd_info_get_str(str, line, sizeof(str));
-		size = simple_strtoul(str, NULL, 10) * 1024;
+		buffer->error = kstrtoul(str, 10, &size);
+		if (buffer->error != 0)
+			return;
+		size *= 1024;
 		if ((size != 0 && size < 8192) || size > substream->dma_max) {
 			buffer->error = -EINVAL;
 			return;
-- 
2.34.1

