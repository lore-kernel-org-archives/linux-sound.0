Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537694;
	b=RZod40M9HlLCX/SAzr9O+g5mBkndY1DtC5FIzwC619DtIwntfdjWDm+hhXQzuu9pAHfs
	 RiqTBdm/OjvUgezLupW6VIZYRlBuCc7OW2ZQKQx5vO+oxAjaDcXqTtAJExyrbXV2P2U8V
	 56YregubvXMZ/hf3U965CUmDie5rTLHwbSCLEEcD9nD8d58LvQkAI0KUXZEb6OS43rnp3
	 20EQZKYyoEqccbSHv8CbfaZ2skZG/ekLqRBXAXu279Q4QoubVJjjQFaIfNFZCJxkvpzZs
	 0VX5kc/cSRUMur3jEvsV+murYMAqTQVi0JJhuqlvZQe8w8aGFcutdZntNOST6sDr92g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537694;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Wtk4FcMHtUD7AzBOaGVvW1HF8HnAVAmvMhgIvgz/LCI=;
	b=Ou4ErVTgUOHbP3VbQogLkAZWWn2XEK6AzwsgcAia17/k3YI64gLU9qWZier3Dx37utyo
	 CGz/7x9kVswgk+f2vU0C6H1lgdXQPrRL/tNVkEiOgiGeWGHR0JcJFPGcDutcc45DJ/3VN
	 yxMgHSA00Q1GXc2EA6gDfieBn7wunW8HZAuHLxTWHj1LjHtjL40Zl7bdMSeHgTH4dsXI3
	 Iqt8sWogyDjwB/vjnAR0WuwmeDTDvPfDNklw4FN/Tjbmyb8sX4y1s+eoczCNGiL/C4eCP
	 xW6sai+SX9o9W/QiGuqokimslNtuyWe35d8XrsXu7Og2nzmM/mn8ELS1lexuqteXZMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=FjDjWryj;
	arc=none smtp.remote-ip=91.218.175.193
Received: from mta0.migadu.com (out-193.mta0.migadu.com [91.218.175.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFB560A261C
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 02:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCFB560A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=FjDjWryj
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OuV+KXjTlGo6gERsN5eVbgt/3oFQq9KuPzlVELLELdQ=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794537691; v=1; x=1795142491;
 b=FjDjWryjHT62fmJS8P2Ab4v6mNnp+03vlWechxdN2pNJHjjYFH2pvMGAslxs2TRFUd1iZw2V
 yjE4h1mmWV3iKkOF9zJk03Pds2TMwJnej5es5Joo4ThqdlVenxHfkmH54uf3Y+13CXovk82HJ9D
 a/V+OIXee5pf0G8qyE2f7kpJhSy2CWC4pqfAATKjeAiW6nzrTIt8FgNzzLfcACqqzM4hOS8Yp8z
 gZWI/M42cmHazY5dJVqoiZJrAncbGmWbYVMPDlzU+RQSrJiHsTfzCN//rWmi1XrsvNoRtxQIsNB
 cjm1qBA2BaB+NOgYyzZt28oSsHhQoRd+TTrMK53ZIUarg==
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 69fc8a9c846866b3;
	Fri, 13 Nov 2026 02:41:31 +0000
X-Mizu-Trace-ID: 69fc8a9c846866b3
X-Migadu-Flow: FLOW_OUT
Message-ID: <76a4cf2e-2444-4e21-82f2-e4e08682980c@packett.cool>
Date: Thu, 12 Nov 2026 23:41:25 -0300
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] ASoC: soc-card: move snd_soc_card_xxx() to
 soc-card.c
From: Val Packett <val@packett.cool>
To: Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
 <179406327208.3424803.13117419976586053782.b4-ty@b4>
 <4dcf8dcb-bab0-43f7-8fc8-d2eba609ec10@packett.cool>
 <ac7e2bb3-90bf-49e9-9282-cd276b60b612@packett.cool>
Content-Language: en-US
In-Reply-To: <ac7e2bb3-90bf-49e9-9282-cd276b60b612@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/12/26 4:41 PM, Val Packett wrote:

>
> On 11/12/26 3:41 PM, Val Packett wrote:
>> Hi,
>>
>> On 11/7/26 11:54 AM, Mark Brown wrote:
>>> On Wed, 28 Oct 2026 02:42:55 +0000, Kuninori Morimoto wrote:
>>>> ASoC: soc-card: move snd_soc_card_xxx() to soc-card.c
>>>>
>>>> Hi Mark
>>>>
>>>> I'm now posting ASoC Capsuling patches.
>>>> Current status, and this patch-set postion is below.
>>>> This patch-set moves Card related functions to soc-card.c
>>>>
>>>> [...]
>>> Applied to
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 
>>> for-7.5
>>>
>>> Thanks!
>>> [..]
>>
>> Looks like this (or some other very recent change on -next but I'm 
>> pretty sure it must be this) caused a regression on Qualcomm Elite 
>> DSP devices (those that use sound/soc/qcom/sm8250.c at least)
>>
>> kernel: Unable to handle kernel NULL pointer dereference at virtual 
>> address 0000000000000038 [..]
>> kernel:  sm8250_platform_probe+0x114/0x120 [snd_soc_sm8250]
>>
>>
>> And without the USB one,
>>
>> [   23.892669] wcd937x_codec audio-codec: ASoC error (-22): at 
>> snd_soc_component_set_jack() on audio-codec
>> [   23.892691] snd-sm8250 sound: Failed to set jack: -22
>> [   23.892696]  WCD Capture: ASoC error (-22): at snd_soc_link_init() 
>> on WCD Capture
>> [   23.894243] snd-sm8250 sound: probe with driver snd-sm8250 failed 
>> with error -22
>>
>>
>> Maybe the sndcard driver wasn't supposed to do all that in the init 
>> callback in the first place but well, it does.. so that's a regression
>
>
> Sorry. Not so sure it's related to *this* now, it still happens with a 
> revert of this series.. 


Actually more related to the new devm_kzalloc_flex usage in 
soc_new_pcm_runtime. I'll try to get a fix submitted


>> Thanks,
>> ~val
>>
