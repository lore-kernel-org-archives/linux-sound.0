Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FF331F9B3;
	Fri, 29 May 2026 13:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780061008; cv=none; b=hyhr5bxCIrlkL+04Hwd3hbiMqU5FKd7itIeiHUAbN6+6qWc+xQLPhW1Xbibmmtkj9pzSIVB+WElykqhp7i7+X8B8fOFPQhu3DF9vGqC705fkhot6Qr/sMX9U624jbiqcsQoMa2q+NSaHSblXkhxk4Duz9rh1jMuj6V4chfCKO2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780061008; c=relaxed/simple;
	bh=phiXckLTIlny23T1U5b3jpKzG0jhTBjoHdbE5T+fVFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K1ArL0euFvCY2UrMPlELE7olMIoD9AMW3sJ45npNYVSXACc8wWZeOi5isEu50XlD9JOf6HBJKAiHuop2dznLUHZFjJziDelrH/KOx+N48OxCwcph99g9LotpMsJA6jGwCnwy/6BUHHW62kzGcD0WZUVwzQQQojsiePxnXQw1KOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8fd330bc5b6111f1aa26b74ffac11d73-20260529
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e80563e3-7836-415e-9deb-86e15d45b639,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:5db1e2e82d988d31cdf5dacb35d29423,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8fd330bc5b6111f1aa26b74ffac11d73-20260529
X-User: lijun01@kylinos.cn
Received: from [172.30.70.202] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 743750998; Fri, 29 May 2026 21:23:20 +0800
Message-ID: <55194c42-91ac-43cc-9891-86604fb2618d@kylinos.cn>
Date: Fri, 29 May 2026 21:23:18 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: loongson: Fix invalid position error in
 ls_pcm_pointer
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, lijun01@kylinos.cn
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529024830.3078886-1-lijun01@kylinos.cn>
 <87zf1ir3me.wl-tiwai@suse.de>
From: lijun <lijun01@kylinos.cn>
In-Reply-To: <87zf1ir3me.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

When the addr is abnormal, such as when the DMA controller is abnormal,
I think x=0 should not be a point, but a range, which includes the addr
address being less than runtime ->dma1-adr, and the addr exceeding
the DMA address range.

在 2026/5/29 17:01, Takashi Iwai 写道:
> On Fri, 29 May 2026 04:48:30 +0200,
> Li Jun wrote:
>> The "invalid position" error occurred when the DMA position descriptor
>> returned an invalid address value (e.g., pos = -1048838144). This happened
>> because the `bytes_to_frames()` function returns a signed value, but when
>> `addr < runtime->dma_addr`, the subtraction produces a negative result that
>> gets interpreted as a large unsigned integer in comparisons.
>>
>> [   32.834431][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
>> [   32.845019][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
>> [   32.855588][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
>> [   32.866145][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
>> [   32.995394][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
>> [   33.006025][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
>> [   33.016748][ 2]  soc-audio soc-audio: invalid position: , pos = -1048838144
>>
>> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> Since it's a change for ASoC, use "ASoC" prefix for the subject line.
>
> About the code change: how does this negative position come?  Is it an
> utterly bogus value to be ignored, or is it a position overlap or
> such?  Your change seems just ignoring and returning 0, and if it's a
> spontaneous bogus value, it may lead to an unexpected jump of the PCM
> position, too, for example.
>
>
> thanks,
>
> Takashi
>
>> ---
>>   sound/soc/loongson/loongson_dma.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
>> index a149b643175c..f0a7065ddae7 100644
>> --- a/sound/soc/loongson/loongson_dma.c
>> +++ b/sound/soc/loongson/loongson_dma.c
>> @@ -207,9 +207,15 @@ loongson_pcm_pointer(struct snd_soc_component *component,
>>   	desc = dma_desc_save(prtd);
>>   	addr = ((u64)desc->saddr_hi << 32) | desc->saddr;
>>   
>> -	x = bytes_to_frames(runtime, addr - runtime->dma_addr);
>> -	if (x == runtime->buffer_size)
>> +	if (addr < runtime->dma_addr ||
>> +	    addr >= runtime->dma_addr + runtime->dma_bytes) {
>>   		x = 0;
>> +	} else {
>> +		x = bytes_to_frames(runtime, addr - runtime->dma_addr);
>> +		if (x >= runtime->buffer_size)
>> +			x = 0;
>> +	}
>> +
>>   	return x;
>>   }
>>   
>> -- 
>> 2.25.1
>>
