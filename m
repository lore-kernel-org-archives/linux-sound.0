Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC46B3ED135;
	Mon, 15 Jun 2026 13:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781530034; cv=none; b=auwqfoHh5wBP6X/VLwRNPy6KX+FXXWujQesQH7iZrBMseCDFNyRkxeHCDGle90LtdZeUrKhDMUyLFa3/n3G9d6OkbKjqInfEPkfprk0Lh6sm5Hr1RW7Iq4NX1iTAkCB2gjV+pNMCyrADavc+CouGdmJD3cUPeU7wnubDDoFToDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781530034; c=relaxed/simple;
	bh=YC4oeTfjlLenMe0r/xN2tOjDms3a//iCOblMI3Tudks=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YEyM4smnhOf6+ImP/oselwAHnp0sHFwZN5vLqcr8ZDn4ZknRCVqkX1/rFCkGgueFiYte0wqpCb/PyTNWybERfhi1Q/sf/vY/Suk5+77dfrYcjp9xYWAYHSXFTIu9Fs9f56EMOS8GGQMQziopQikyiYQJBiVeFq5DvOgcne79qng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e5400d5e68bd11f1aa26b74ffac11d73-20260615
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:c218716c-da3a-4644-a30b-061d9ec581eb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:207cfdec898b710a03ff627cb484a168,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|865|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e5400d5e68bd11f1aa26b74ffac11d73-20260615
X-User: aichao@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1041868681; Mon, 15 Jun 2026 21:27:02 +0800
From: Ai Chao <aichao@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH] ALSA: pcm: Show closed for DISCONNECTED state
Date: Mon, 15 Jun 2026 21:26:57 +0800
Message-Id: <20260615132657.2097213-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Show "closed" for DISCONNECTED state allow audio service
to detect USB reset/disconnect and reinitialize the device.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 sound/core/pcm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index bfedf571e021..6ce35492ea56 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -450,6 +450,14 @@ static void snd_pcm_substream_proc_status_read(struct snd_info_entry *entry,
 		snd_iprintf(buffer, "error %d\n", err);
 		return;
 	}
+	/*
+	 * Show "closed" for DISCONNECTED state allow audio service
+	 * to detect USB reset/disconnect and reinitialize the device.
+	 */
+	if (status.state == SNDRV_PCM_STATE_DISCONNECTED) {
+		snd_iprintf(buffer, "closed\n");
+		return;
+	}
 	snd_iprintf(buffer, "state: %s\n", snd_pcm_state_name(status.state));
 	snd_iprintf(buffer, "owner_pid   : %d\n", pid_vnr(substream->pid));
 	snd_iprintf(buffer, "trigger_time: %lld.%09lld\n",
-- 
2.25.1

