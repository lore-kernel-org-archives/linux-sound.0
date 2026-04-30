Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A4D5474F;
	Thu, 30 Apr 2026 02:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777515254; cv=none; b=fU1ZRYVWjqlJ8pqbiAoEVRGkGd6rgXEdZ1GLR9LwozLzkRkeUY4kf6k0crxmC+fyHrVGdc+cnSpySBTrK1YzcpIFHTDXwOglk0cdYotDB5RTseKZdgHyY+MaAiD918wdjOAlu9lf0/IM2SeizQZTawXWRBJP7yK3q6JViLg5a3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777515254; c=relaxed/simple;
	bh=n6iiABDAgQpCu7IaoCW+6eJiiM7Mmi/cWF6ILwLBNFU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qFfZSazmV80JZ7S/BX8YyA8/Jw5A1rfis5MwGVlcYF2M4h1gGMiey4CO83hQo5XIoFeaNWVsgXNrauQccnjCfKyIbiKoaHptoii7ZOx9YBAIBsanW6aUDEo0rHNuZYKIgn3or61BtyJ6M1cDiS/ml7CDwUh7WhAUJ5nvGF+y5rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 431ec29c443a11f1aa26b74ffac11d73-20260430
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:c85ad147-4af0-4786-a033-452fef5ec089,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:9d7e54800753944dc0d6a03d4b611448,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 431ec29c443a11f1aa26b74ffac11d73-20260430
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 548940728; Thu, 30 Apr 2026 10:14:05 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn,
	syzbot+ee73befabe68e7907adf@syzkaller.appspotmail.com
Subject: [PATCH] ALSA: pcm_oss: Fix use-after-free in poll via io_uring
Date: Thu, 30 Apr 2026 10:14:01 +0800
Message-Id: <20260430021401.181505-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bob Song <songxiebing@kylinos.cn>

Fix use-after-free bug in snd_pcm_oss_poll() caused by
io_uring asynchronous poll operations accessing already-freed
pcm_oss_file private data.

The bug happens because file->private_data still points to
kfree()'d memory after snd_pcm_oss_release(), and io_uring
may invoke ->poll() handler later.

Fix by:
1. Clearing file->private_data early in release function
2. Adding NULL check in release to avoid invalid access
3. Adding NULL check in poll handler to prevent UAF

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") /* pcm_oss initial */
Reported-by: syzbot+ee73befabe68e7907adf@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/alsa-devel/000000000000f1068105f20e5e8f@google.com/
Signed-off-by: Bob Song <songxiebing@kylinos.cn>
---
 sound/core/oss/pcm_oss.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index a140a0d9abb8..f3cebfaaa7dc 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2574,6 +2574,14 @@ static int snd_pcm_oss_release(struct inode *inode, struct file *file)
 	struct snd_pcm_oss_file *pcm_oss_file;
 
 	pcm_oss_file = file->private_data;
+
+	/* Prevent double-release and NULL dereference */
+	if (!pcm_oss_file)
+		return 0;
+
+	/* Clear private data to avoid UAF from async poll */
+	file->private_data = NULL;
+
 	substream = pcm_oss_file->streams[SNDRV_PCM_STREAM_PLAYBACK];
 	if (substream == NULL)
 		substream = pcm_oss_file->streams[SNDRV_PCM_STREAM_CAPTURE];
@@ -2840,6 +2848,10 @@ static __poll_t snd_pcm_oss_poll(struct file *file, poll_table * wait)
 	
 	pcm_oss_file = file->private_data;
 
+	/* Check for already released file to avoid UAF */
+	if (!pcm_oss_file)
+		return EPOLLERR | EPOLLHUP;
+
 	psubstream = pcm_oss_file->streams[SNDRV_PCM_STREAM_PLAYBACK];
 	csubstream = pcm_oss_file->streams[SNDRV_PCM_STREAM_CAPTURE];
 
-- 
2.25.1

