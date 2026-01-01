Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3B426980F;
	Thu,  1 Jan 2026 01:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767230317; cv=none; b=b/YCrn/rwKH20Lj9tbZ2Fv8Vccjl2gHARE/SjUg6Me85lBcAdB2ObW1J6GB1y875+2TuemQqnM47zyHnTayiu0masopmeHkJq2IDALtfVrz5iero/P1QUTw5otAz4rPU7X2WPdQop4q5x/Nnxl8ik/IYLyxpsmsZHlGOIVaLlfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767230317; c=relaxed/simple;
	bh=jJh/gfRbn0HGkteVEjdrNixoOYdwoMnNMXioA/vGzgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbMVZgS7FKRdlvFXq3LySphOQlGqF/yyGcEDA/K1CGsvMwdmBJHdpk3Cxthh3xGPpXR8aeXROaX3u3l4/7ioi2HYWDBBenBL2gfT8wwWwkgk3MZZmVQJ+4B11VixfjB40wdWiZCGVzOHg6qm0BrE3bRAQlyyQxtKY/d7sODPduc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c5bc99d8e6af11f0a38c85956e01ac42-20260101
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:45c5b92a-d8b4-4da5-8ce2-539fb97b9737,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:c9b0724d29e3fea90103c643588e5b21,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c5bc99d8e6af11f0a38c85956e01ac42-20260101
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.76] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1766834081; Thu, 01 Jan 2026 09:18:25 +0800
Message-ID: <5879f82a-d21e-4210-987f-449d2452b5bd@kylinos.cn>
Date: Thu, 1 Jan 2026 09:18:21 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: Add Line Out to iterm_names
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, cryolitia.pukngae@linux.dev,
 kuninori.morimoto.gx@renesas.com, lhi0729@kaist.ac.kr, pav@iki.fi,
 rene@exactco.de, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251229093130.3202058-1-zhangheng@kylinos.cn>
 <87ecoay7vt.wl-tiwai@suse.de>
From: zhangheng <zhangheng@kylinos.cn>
In-Reply-To: <87ecoay7vt.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry, this is not a new standard. It's just my personal idea. Can we 
promote

the addition of this, adding this Line Out, so that it can be similar to 
hda,

simplifying the adaptation task of the core outer layer? The jack events

are relatively unified. Otherwise, for the current sound card, the

rear jack event is Speaker, which requires separate adaptation.

在 2025/12/31 23:43, Takashi Iwai 写道:
> On Mon, 29 Dec 2025 10:31:29 +0100,
> Zhang Heng wrote:
>> There are three jack events for a sound card on a desktop computer,
>> namely Speaker, Headphone, and Desktop Speaker. When both audio
>> devices are available, users cannot distinguish which audio device
>> is being used. Can we consider adding Line Out? similar to the HDA
>> sound card. This can change one of them and reduce the complexity
>> of the upper layer adaptation of the sound card.
>>
>> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> Is 0x0308 something properly defined standard?
> If so, we can add the entry, of course.
>
>
> thanks,
>
> Takashi
>
>
>> ---
>>   sound/usb/mixer.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
>> index 3af71d42b9b9..bdde4261d994 100644
>> --- a/sound/usb/mixer.c
>> +++ b/sound/usb/mixer.c
>> @@ -615,6 +615,7 @@ static struct iterm_name_combo {
>>   	{ 0x0305, "Room Speaker" },
>>   	{ 0x0306, "Com Speaker" },
>>   	{ 0x0307, "LFE" },
>> +	{ 0x0308, "Line Out" },
>>   	{ 0x0600, "External In" },
>>   	{ 0x0601, "Analog In" },
>>   	{ 0x0602, "Digital In" },
>> -- 
>> 2.47.1
>>
