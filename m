Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7FC2D94A0;
	Wed,  3 Jun 2026 01:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780448859; cv=none; b=AVjyqoqlfrzxECpdpKgkisfs3ExVe0i+AFIjrNdROJn8hYX6GdGTXZb3uOVpTJvl1Cz7d2T1xpDKI0YlTlskd0cZH/fBhy8IEB1nwywJCU5VuKhZWoSWow3PzGAl5jSVxvrE4lklpcILsou98s8nHeOnEKye5BW1Y6/N2czQ70U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780448859; c=relaxed/simple;
	bh=7CmHJ1sD5tabedTjPJjGbpHYW0UAJKemheL40hkq6HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mHCBYivNxKJ3t5v7X1UqnB03PQcZ5axO7tMBeIPVD/duuEFM3jDFhkDpS2Unt3vFd1C+Q20mTyyFVOBwh7ZgYpmoyRa9RjNV1uL+LR80tzy1glG10gtSzz1TY3wrXxfQViBXClEyI3ib9ZhAfRA9CceIBWKi/LQKIF2KowGtoTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 99a515585ee811f1aa26b74ffac11d73-20260603
X-CID-CACHE: Type:Local,Time:202606030859+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5431555c-05e1-4c67-9785-db322f86a904,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:1713e10e1f68a2844fe6f071846a2294,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|136|865|898,TC:nil,Conte
	nt:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 99a515585ee811f1aa26b74ffac11d73-20260603
X-User: lijun01@kylinos.cn
Received: from [172.30.70.202] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 727336880; Wed, 03 Jun 2026 09:07:32 +0800
Message-ID: <7c1bb036-3670-4d71-9f0d-a395b4f6823d@kylinos.cn>
Date: Wed, 3 Jun 2026 09:07:30 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: loongson: Fix invalid position error in
 ls_pcm_pointer
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, lijun01@kylinos.cn
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260601084309.845322-1-lijun01@kylinos.cn>
 <7ff4cebc-4873-4135-b58c-29a9ce2d696f@sirena.org.uk>
 <e4c628f8-dac3-4318-bdeb-758ac007a92b@kylinos.cn>
 <40a51e9a-56d3-4859-871a-42842158e976@sirena.org.uk>
From: lijun <lijun01@kylinos.cn>
In-Reply-To: <40a51e9a-56d3-4859-871a-42842158e976@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Is it handled like this?
desc = dma_desc_save(prtd);
addr = ((u64)desc->saddr_hi << 32) | desc->saddr;
if (addr < runtime->dma_addr || addr > runtime->dma_addr + 
runtime->dma_bytes) {
         dev_warn(dev, "WARNING! dma_addr:0x%x\n", addr);
         snd_pcm_stop_xrun(substream);
         x = 0;
} else {
         x = bytes_to_frames(runtime, addr - runtime->dma_addr);
         if (x == runtime->buffer_size)
         x = 0;
}

在 2026/6/2 21:13, Mark Brown 写道:
> On Tue, Jun 02, 2026 at 08:49:29AM +0800, lijun wrote:
>
> Please don't top post, reply in line with needed context.  This allows
> readers to readily follow the flow of conversation and understand what
> you are talking about and also helps ensure that everything in the
> discussion is being addressed.
>
>> for example,the DMA controller is abnormal in hardware
>> the addr = 0,
>> addr = ((u64)desc->saddr_hi << 32) | desc->saddr;
>> x = bytes_to_frames(runtime, addr - runtime->dma_addr);
>> addr = 0 dma_addr=4195352576   x=-1048838144 i think the value of pos should
>> not be a negative，return 0, maybe better.
> Right, the question is if this happens in normal operation somehow or if
> this is an error condition.  If this is an error should we be reporting
> it as such, for example with snd_pcm_stop_xrun().
