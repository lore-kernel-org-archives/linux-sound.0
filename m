Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC60360EDC;
	Fri, 19 Jun 2026 09:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781861396; cv=none; b=Wx0sdbByUOUUKyXmriNCc9abUwyMuAnJ5Nk6LxUL7a5FVdIXjv7Pbv15cGzy5EDbOM0A8MaeY+20vviYqWE2fyKDN+hM0wPDdFymLmFqa9y+KudGm+7XeiwFmEZNH7F+aNkho1gqaumXjINEfGFCMkxT2Lhknr6ca+ttoURwrnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781861396; c=relaxed/simple;
	bh=J2m1yXXnHB04J+5RSrJrkXsVQMHNYX70jzV6keHH/4k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X/z2McCV5W8/gIr5pMgvru0NliT56BTs1ywNqIw2uMR21aRRfyIHHuClyG7HdEYYdiA/S0eUZdX9DnMuct88Yk5FOn5yCL5hyjVJxue04Qt7kPnj1LktnaxcbC3uqpXznjQkmHveDi8XUc87rmUxfyO6e6fwRm5Vrukzz8r8WKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 65a53e5a6bc111f1aa26b74ffac11d73-20260619
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5b6c00a7-8eba-41e3-a48f-38f93cc28323,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:7e2429649fd2a2e16737137e36320df3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:83|102|865|898,TC:nil,Content:0|15|50,ED
	M:40,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 65a53e5a6bc111f1aa26b74ffac11d73-20260619
X-User: aichao@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 83847475; Fri, 19 Jun 2026 17:29:40 +0800
From: Ai Chao <aichao@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH] ALSA: pcm: Show closed for DISCONNECTED state
Date: Fri, 19 Jun 2026 17:29:36 +0800
Message-Id: <20260619092936.806715-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Takashi

> Right, I suspect that it might be the case.
> Does the change like below help (or worsen) anything?

We tested this solution and verified its feasibility.

Thanks,
Ai Chao

--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3907,6 +3907,8 @@ static vm_fault_t snd_pcm_mmap_data_fault(struct vm_fault *vmf)
     if (substream == NULL)
         return VM_FAULT_SIGBUS;
     runtime = substream->runtime;
+    if (runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
+        return VM_FAULT_SIGBUS;
     offset = vmf->pgoff << PAGE_SHIFT;
     dma_bytes = PAGE_ALIGN(runtime->dma_bytes);
     if (offset > dma_bytes - PAGE_SIZE)

