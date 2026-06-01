Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5655C1A6815;
	Mon,  1 Jun 2026 01:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780277287; cv=none; b=AXkiIR65WOeIQ5tAy2SMTHsiV7GNWPPtChvY62UuZYwH8sYcUYCb8oqOSZ3Nxz8JS+r4cku+Ix89OJg7gtA/xkqP3UVcqRVl2Zq1Y8yclWqkqf+Qcl2/W7DloN1rE1qBNQoB0qFGwDGFp9qC69zWxngFKoML6xOHZ2DN6ZuiUgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780277287; c=relaxed/simple;
	bh=43FAxUi20u0exTQeJ4TpNxhyGv0pTIvVVe3oZR6Kngw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJcP6XRGUhNwRZRMbo5bIC4VRnDCJ/1j5iAEksa0PeN+C3VWPAPAft3GRaFUHVqQCTQJnLwPGo24Q47VyFkZ1fqoOCIoqH2YS6E2DQADLsz9wdCnBC2yWSWu+yxqJmnWdYXk4PXukSuU/fx7n9CvAtoB3AU9SjYD2U2XnwdHUjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1f47ebf45d5911f1aa26b74ffac11d73-20260601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:cbf80f0d-d797-4db7-a360-392556300b92,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:1ae784a83f10ce3a5215a68ef7d5f802,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15
	|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1f47ebf45d5911f1aa26b74ffac11d73-20260601
X-User: lijun01@kylinos.cn
Received: from [172.30.70.202] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 468787874; Mon, 01 Jun 2026 09:27:58 +0800
Message-ID: <bf500162-5cc6-46cd-ad91-45b180aa54bf@kylinos.cn>
Date: Mon, 1 Jun 2026 09:27:33 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: loongson: Fix invalid position error in
 ls_pcm_pointer
To: Takashi Iwai <tiwai@suse.de>, lijun01@kylinos.cn
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529024830.3078886-1-lijun01@kylinos.cn>
 <87zf1ir3me.wl-tiwai@suse.de>
 <55194c42-91ac-43cc-9891-86604fb2618d@kylinos.cn>
 <878q92qpkp.wl-tiwai@suse.de>
Content-Language: en-US
From: lijun <lijun01@kylinos.cn>
In-Reply-To: <878q92qpkp.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I am debugging a new hardware sound card, and every time the machine
power on, addr=0 occurs. I am analyzing the cause. This negative is 
caused by addr=0.

在 2026/5/29 22:04, Takashi Iwai 写道:
> this negative
