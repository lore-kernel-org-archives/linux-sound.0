Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A8E1A9B46;
	Thu, 30 Apr 2026 02:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777516453; cv=none; b=pmN6PZGXaPHfXmKtP4FAa0kPhfVqKj0tvIOO+LIz0/XTNm8xRZJ73fioBJX/TGAPMF9PtJZyUnp/1MJDwYjT1U4cXyDCwk54gIsCtmz4yG9jzQ5Bb9KK0FnxHVVvmjyKAhHmZfDz8nn8Uz4Dr8GfMj2lD8HCMTmMlNHhRtNaAL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777516453; c=relaxed/simple;
	bh=ORCpzagqGxCz03pXv6+ZWd3F9o4+tQfaorm91kuab/U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f6nQciWBPRjV5oiFtQW74OaUIO2l8IrABQbTZuT/9S8cRkt+JvMqDabiLTB8in2mYfiU6Uos7DHjZofWwxl5c7bDvWUNAZXaLWhx/PU/Zc9OrmwGSdLs8N4Fu9k5VhbRxdP6l7HFIDyE3qhVCRt+5kO6JTFAL1NoiLijmuTdn1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0f518d02443d11f1aa26b74ffac11d73-20260430
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:606d627f-cfda-405c-804f-fb1b7461e9e0,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:c46e3222b428051f50a951554fb9d217,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0f518d02443d11f1aa26b74ffac11d73-20260430
X-User: songxiebing@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <songxiebing@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 944836948; Thu, 30 Apr 2026 10:34:06 +0800
From: songxiebing <songxiebing@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	songxiebing@kylinos.cn,
	syzbot+e3ec01fd2d18c9264c3b@syzkaller.appspotmail.com
Subject: [PATCH] ALSA: rawmidi: Fix use-after-free in poll via io_uring
Date: Thu, 30 Apr 2026 10:34:02 +0800
Message-Id: <20260430023402.213228-1-songxiebing@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bob Song <songxiebing@kylinos.cn>

Io_uring may perform async poll after the file is closed and
private data is freed. Fix UAF by clearing private_data in
release function and adding NULL checks in poll.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+e3ec01fd2d18c9264c3b@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/alsa-devel/0000000000005ea9dd05f20e5b48@google.com/
Signed-off-by: Bob Song <songxiebing@kylinos.cn>
---
 sound/core/rawmidi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 3b1034a44938..7973bace2ac5 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -606,6 +606,10 @@ static int snd_rawmidi_release(struct inode *inode, struct file *file)
 	struct module *module;
 
 	rfile = file->private_data;
+	if (!rfile)
+		return 0;
+
+	file->private_data = NULL;
 	rmidi = rfile->rmidi;
 	rawmidi_release_priv(rfile);
 	kfree(rfile);
@@ -1665,6 +1669,11 @@ static __poll_t snd_rawmidi_poll(struct file *file, poll_table *wait)
 	__poll_t mask;
 
 	rfile = file->private_data;
+
+	/* Prevent UAF from async io_uring poll after release */
+	if (!rfile)
+		return EPOLLERR | EPOLLHUP;
+
 	if (rfile->input != NULL) {
 		runtime = rfile->input->runtime;
 		snd_rawmidi_input_trigger(rfile->input, 1);
-- 
2.25.1

