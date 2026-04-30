Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CE8175D53;
	Thu, 30 Apr 2026 03:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777518029; cv=none; b=tfl7vfT2wL6wpaDarJtZixexTTL28Fyp8B+01plxD3VAm77s2Q7PpNnYFZjWFvDu3dfFxEg1KbsbK0gjc8DONp1Z3myuvQYfs7KXkO/NT7t6YmSAcDnYVmbPAmOYoLoq00mNGVHSNyr3o2iYYWLfUqZc6b7EMe2EehdgzvLUmrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777518029; c=relaxed/simple;
	bh=tfyj8S0FzN85evNnhvxUMPHahJtLkbkIRBZ94QaxhRs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=plPTJRaGlLR+X5vs3ymlWiVzDE47FEngjbYvGbO0WAbPkgjN13CBjDTc7gXCFLrTPqcrLX19YyWmRHfpDJI9KzKsKaVF74qAB7QLvhINPViw4oBCh9Y82d49lKFZ1KO/h+LoOvNzlctV5DpCtZtfSHxkNQDIzN7whaSyGz1VSyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b8c5f6f4444011f1aa26b74ffac11d73-20260430
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:8ac1ad45-1c73-44ba-8b53-9eb5e4941c8d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:46912bda503a4db14864e577c3ea10e3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b8c5f6f4444011f1aa26b74ffac11d73-20260430
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1573180281; Thu, 30 Apr 2026 11:00:19 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn,
	syzbot+e29d28728f38190cecfc@syzkaller.appspotmail.com
Subject: [PATCH] ALSA: pcm: Fix UAF in snd_pcm_post_stop
Date: Thu, 30 Apr 2026 11:00:14 +0800
Message-Id: <20260430030014.259007-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bob Song <songxiebing@kylinos.cn>

Syzbot reported use-after-free in snd_pcm_post_stop when
accessing runtime->sleep / runtime->state.

The runtime struct may have been freed already by io_uring
async operations, so check for NULL before accessing.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+e29d28728f38190cecfc@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/alsa-devel/00000000000060fb5d05f2203601@google.com/
Signed-off-by: Bob Song <songxiebing@kylinos.cn>
---
 sound/core/pcm_native.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index a541bb235cfa..31ea23218d6a 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1561,6 +1561,10 @@ static void snd_pcm_post_stop(struct snd_pcm_substream *substream,
 			      snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if (!runtime)
+		return;
+
 	if (runtime->state != state) {
 		snd_pcm_trigger_tstamp(substream);
 		__snd_pcm_set_state(runtime, state);
-- 
2.25.1

