Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D472CEEB2
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 10:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734430474; cv=none; b=HveRMqLLORI9111lBGRD2fVeU5wftwoKU2i7253c8cTFNXFQRE7tfNyRnH22PyvXyrf10y88dXUv1yZ8MNsg7eu3tUY1qHH/TV8YzES0rpM349HlIQm4uLwhbIk1K5q/EntSs366qhazI7nbBkEyFKjwMXWh0TWYXlv1fssfY3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734430474; c=relaxed/simple;
	bh=Zwri+Qv2b9DkKk1NQsGfSU07gvZvm3V0LQuKgHtSqNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bv/2y/R+HHs1TgiXVb1+Ofs8X7pfDJLx6dBvWU6BIAdaT99646e0dovKKmmZDSIB43hdXmP7fJ52zmPAajtLdFNS4gorNKdCnEzxwSNYCySaJ9JKIpf0aDOV4t63MvcRKqoZRz0C4j9AsN/lnFSpMad48lk3DVGMXIGVX4J6MZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=OLcTzM4p; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="OLcTzM4p"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 853852A2B;
	Tue, 17 Dec 2024 11:07:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 853852A2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1734430042; bh=4+PgQeGPHi/o5LXIgcFEPU+QI9rMaXKw5ydQSm4kyxw=;
	h=From:To:Cc:Subject:Date:From;
	b=OLcTzM4pirMONf23dvKtp5A81L067cgBbc7whU519LinhM8Ag8HNXL8iRHe8evI5m
	 abJ3Wudp59iUiNl84olsw6LII7wC0fVp28RV6u+A1noPoj6RNch9v8Yqskn2k4g/7O
	 ZtswLoKU4ONrdkCqd4oY/Ztaw/OoCxDFFt/b1ICE=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 17 Dec 2024 11:07:17 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: Linux Sound ML <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] ALSA: compress_offload: use safe list iteration in snd_compr_task_seq()
Date: Tue, 17 Dec 2024 11:07:07 +0100
Message-ID: <20241217100707.732766-1-perex@perex.cz>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sequence function can call snd_compr_task_free_one(). Use
list_for_each_entry_safe_reverse() to make sure that the used
pointers are safe.

Link: https://lore.kernel.org/linux-sound/f2769cff-6c7a-4092-a2d1-c33a5411a182@stanley.mountain/
Fixes: 04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/core/compress_offload.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 86ed2fbee0c8..ed69b742786c 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -1174,7 +1174,7 @@ typedef void (*snd_compr_seq_func_t)(struct snd_compr_stream *stream,
 static int snd_compr_task_seq(struct snd_compr_stream *stream, unsigned long arg,
 					snd_compr_seq_func_t fcn)
 {
-	struct snd_compr_task_runtime *task;
+	struct snd_compr_task_runtime *task, *temp;
 	__u64 seqno;
 	int retval;
 
@@ -1185,7 +1185,7 @@ static int snd_compr_task_seq(struct snd_compr_stream *stream, unsigned long arg
 		return retval;
 	retval = 0;
 	if (seqno == 0) {
-		list_for_each_entry_reverse(task, &stream->runtime->tasks, list)
+		list_for_each_entry_safe_reverse(task, temp, &stream->runtime->tasks, list)
 			fcn(stream, task);
 	} else {
 		task = snd_compr_find_task(stream, seqno);
-- 
2.47.0

