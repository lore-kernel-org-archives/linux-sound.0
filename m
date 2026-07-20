Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA4F3D7D89;
	Mon, 20 Jul 2026 09:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784540463; cv=none; b=st5q5jO4xtpOg6tUq1DuWHLox6Pwt1t1YS8sfzcoRTyHGWVmrBnaclAkKBDVhSZ3cSwYadMA2koFENNzW9qiLzNgmGLbmmIcGv02FW83tyMoIJdG4D5L3PJbGcuXf3iBrrWFgol4ghlYNlfYFy4kcIHrN796t7TsP7/dpGjGRk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784540463; c=relaxed/simple;
	bh=nXgTN4fVUXo0So/7EuJFprldWeNbukgV4to0lXCk/wI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cmlm7KwNYwAtz4+bdqWoo9GvdCXQCuOYXyOZCr2qerTzFXopy9xcl1HMakr8KVV44Yy4/EWVhnOUKVUp+hlKUKxfs5T/bYsWdF9Vw3ClKWx7T/WKUK2zUi0eH7eyVT/pt32nZkyhsZ/cZ3mr3KzrV6GTQl1H1BbiXgc3DnvOlFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 19ee1ede841f11f1aa26b74ffac11d73-20260720
X-CID-CACHE: Type:Local,Time:202607201735+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:20f721f2-c77f-4ac7-9807-9ea183aea3ea,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:ec2af2f861e8247f2fdd921626e909bd,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|817|865|898,TC:nil,Conte
	nt:-10|-8|-5|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC
	:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 19ee1ede841f11f1aa26b74ffac11d73-20260720
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.77] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 18337804; Mon, 20 Jul 2026 17:40:53 +0800
Message-ID: <384611aa-8a63-4996-8f64-e951b2d2df69@kylinos.cn>
Date: Mon, 20 Jul 2026 17:40:50 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb-audio: Fix boot-time crackling for Generic USB Audio
 device
To: Takashi Iwai <tiwai@suse.de>
Cc: Gordon Chen <chengordon326@gmail.com>, perex@perex.cz, tiwai@suse.com,
 kees@kernel.org, jussi@sonarnerd.net, hulianqin@vivo.com, i@rong.moe,
 g@b4.vu, cryolitia@uniontech.com, pav@iki.fi, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260713081048.189281-1-zhangheng@kylinos.cn>
 <18c1dc0246121271.5ea4dc9a201e9dce.cafe1c196d712416@GordonMsi>
 <87zezvx73v.wl-tiwai@suse.de>
 <d77254b3-1e6f-483e-8c03-b8f1e033d7a0@kylinos.cn>
 <878q77s6jp.wl-tiwai@suse.de>
 <9fc3da84-0985-4357-93bb-ce90a86b01de@kylinos.cn>
 <87tspuqi5m.wl-tiwai@suse.de>
Content-Language: en-US
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <87tspuqi5m.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> OK, if the workaround is no solid solution, it's not worth to take.
> 
> Have you tried lowlatency=0 option?  If it's an implicit fb and about
> the playback, it might stabilize.
> 
> 
> thanks,
> 
> Takashi
I tried lowlatency=0 but it didn't help. I am waiting for the customer 
to send a machine, and I will test again once it arrives.
