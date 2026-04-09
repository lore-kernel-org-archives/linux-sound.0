Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3774F3368BF;
	Thu,  9 Apr 2026 06:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775716411; cv=none; b=FMjHlaJXHl0hn0omTOeioAPsBUw3v8EtRWhqseWvNhlHOMmA5NQzPEU8OD0NgIR9btzcbjJPxAh9ZkQAsetOuBHWpZSiQ7TigfXXebktp7Es6+EUITQHeEsN3eiFJGLV1D9GjEyG1EDj5aMtnGLTlxMGA4zTjkk0Yf36X/Q5Iew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775716411; c=relaxed/simple;
	bh=/tlHXaTriA5HqTeCg/D/+pzkP9usuHquY2shP+FHywM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bKIzgh8gqPqC+btHmc7JPtr6SKeSLiCGrQgkcUwM3EB1gdwBUTZmJyt8Hp9aaGweai4NkTHmBHX/Z4ApJgDwkbL35jewebRtY5luejaxh+vcM7LXnBe6YCD0zdbB7+xAXbdh7WHTS3DnzWijaFKw4rOOHu75oCqsC6nfO/M1Jqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0152d17633de11f1aa26b74ffac11d73-20260409
X-CID-CACHE: Type:Local,Time:202604091358+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:96154766-3ca9-47ae-9c0d-484a8ae2d0a2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:f4165319b9ab070e5687ccd022404458,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|898,TC:nil,Content:0|15|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0152d17633de11f1aa26b74ffac11d73-20260409
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.76] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 539887611; Thu, 09 Apr 2026 14:33:22 +0800
Message-ID: <c5079ef8-abfe-4373-8fc2-7892b23b95d5@kylinos.cn>
Date: Thu, 9 Apr 2026 14:33:19 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for CSL Unity BF24B
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260409024028.1297587-1-zhangheng@kylinos.cn>
 <873414lnyf.wl-tiwai@suse.de>
 <84e98864-5858-4bb7-b62a-5b4928f2065b@kylinos.cn>
 <87tstkk5ph.wl-tiwai@suse.de> <87qzook5m2.wl-tiwai@suse.de>
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <87qzook5m2.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Some machines also need to write GPIO again after waking up from sleep,

please consider this.

在 2026/4/9 14:30, Takashi Iwai 写道:
> That said, I'm going to take your patch for now, but we might need to
> reconsider the implementation of Realtek codec helpers about GPIO
> handling.
>
