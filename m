Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9834023EAA0;
	Mon, 20 Jul 2026 02:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784514216; cv=none; b=gwHUfUwpSgw5+ste9+ilzrK+/net5TT9QD031LxQVNHwWv+O7P7HT9fHaS+fSp4EO9+SamVUMAqFddl8DVLMUxT2JwKt4y19bbN6F1RtUBQsEMokrzTa8lscgSGy+H3E+pa+/HaINCuc8cEwnzp4SlP2YgEW0MqZo9/CJ//zKeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784514216; c=relaxed/simple;
	bh=50AdvGdhuePSjFHXZ3DQqgeP6Zk91kLTBiO/44cORkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCeK0OZJsozWkIiJdj4aJSYSn0093Y0b9zHFOUiXg2jOHHZKEM129sXWGstFz5nUmo6AwbU0jIClk+yAqxJxjcaRXWGt7q68tkjPR7WZZ7rh+wwW2ghvJ+YyGWOrp81exJgh5DX4WepGTSoqLB+5gdcKmDTn9vuHn+Raikb4DWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: fe486aa083e111f1aa26b74ffac11d73-20260720
X-CID-CACHE: Type:Local,Time:202607200959+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:19030b67-7dd9-415b-a215-0b95a485309a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:b9fd884dab7528900885db25aeaa0961,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:0,Content:1|1
	4|50|-19,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fe486aa083e111f1aa26b74ffac11d73-20260720
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.77] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 201426729; Mon, 20 Jul 2026 10:23:28 +0800
Message-ID: <9fc3da84-0985-4357-93bb-ce90a86b01de@kylinos.cn>
Date: Mon, 20 Jul 2026 10:23:25 +0800
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
Content-Language: en-US
From: Zhang Heng <zhangheng@kylinos.cn>
In-Reply-To: <878q77s6jp.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Please add some comment why the device needs this workaround.
> IIUC, the reason is different from the others in your case.
> 
> Also, please verify that the problem is reproduced in the latest
> upstream kernel, and the workaround works as expected there, too.
> 
> 
> thanks,
> 
> Takashi

 >> --- a/sound/usb/quirks.c
 >> +++ b/sound/usb/quirks.c
 >> @@ -1938,6 +1938,10 @@ void snd_usb_endpoint_start_quirk(struct 
snd_usb_endpoint *ep)
 >>   	    ep->type == SND_USB_ENDPOINT_TYPE_SYNC)
 >>   		ep->skip_packets = 4;
 >>
 >> +	if (ep->chip->usb_id == USB_ID(0x1e0b, 0xd01e) &&
 >> +	    ep->type == SND_USB_ENDPOINT_TYPE_SYNC)
 >> +		ep->skip_packets = 4;
 >> +

Let me update the current status: that piece of code can be
omitted. I have applied your test patch, but there is no
change. It might be that your patch has no effect on this
device. I tested with version v7.2-rc1. To be honest,
without any modification, the problem becomes a reproducible
stutter plus crackling noise. After applying my fix, it
becomes a probabilistic stutter (still with a relatively
high probability of recurrence), but when there is no
stutter, there is also no crackling noise. So I am sure
that this patch is at least useful, but it does not
perfectly solve the problem. I am still trying to resolve
the stutter issue, and I wonder if it is due to resource
contention during boot? This problem only occurs at boot
time; after entering the system, it disappears.
