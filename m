Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794512509;
	b=NPiCEqJllBlnDHl3Ij2x2ZKzYcpUtvKLcKWP93t8zTaxdBZCLgjvFiHKzmY5ulbKrOey
	 7Uhlc+H/VD5X3tW1J42XVtJ0izDo+2poTrOy1ylCvbGAZuwXbMA54F/obzWXGnVqfBPht
	 8BtkyzkW/IKEQhr64yTcmf5u8D5wKdvSIi/sLrqkp3gLH9VfaObuTv/ntzfyoHWkI7tzI
	 /M8j6Rzb984t6ZILVRvwxDO9A4+DR0SJXRIN+D4WVVr9RYP2Mj6KZlCPgoSJ+DCieXmEm
	 70NYqXrRb1aslqhQlERc0LylaPqV542S5McdXKuUctG43kSyflmor22JaoX9y5kUHEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794512509;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=4uNXaejfERDIf6iNoxMcV9y0qmil4W/vM9VU0z8C1D0=;
	b=zYvb6C3clZY6WrAW5jq1fUkjHKBfeSrSDtQOazujAnW3Ssck4waUlCRUX6dL1yz6LHY7
	 VFNV4uXI6iG2WTHuYRA96McbhPVPXPllhuysNbHR/Hr7igW90GOzRlZY29vbvvvnHll9x
	 /ie9LThdCb29okBu1wAASD+U8TAnrBXrs30uyAp0pbRHMrOD+FlDNWsQG+MtvDpO2Ei0Z
	 QINNsfZUkFPtQBlddai8nYGqgSO20O0rmlOU4A3mKqw19R1iJpSLIabQcSjlleS/QttqH
	 Kabd29hOIcAo1QOzG0eKjQSnKqMLKO9OtpRcbNMSXimhlUm0qw9x4l4C4Dh3486y4Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=b+Ct7ir1;
	arc=none smtp.remote-ip=91.218.175.97
Received: from mta0.migadu.com (out-97.mta0.migadu.com [91.218.175.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE89606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 19:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EE89606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=b+Ct7ir1
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rr0TW2nNjiF4bqOfPyBn7gkwROj7qWJNv4CzkbPzABo=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794512506; v=1; x=1795117306;
 b=b+Ct7ir1123pWMakxfTJoHXXJizvMH67xprm/KGDyjhC4yWWQGy9dOhdyYUXwVwOEy608uIa
 3W4B8GJInoWTZrnk0aPuOu0bqG2vZk5BTecCbxUIW+RXDwY7kIJ6eZzJ44SV/rvWkEQPEXrjq8b
 ni73ZnZDJBni1GuVCTAvtQk60aDA+TTC4vDij6I9/3sQUrZaTomG0qMOywvXqUFV/YyURYDH+pq
 G6RCX3GCPsMthX/7QGDOzS6npDIlVLDTbNaLhWYVvxpooMr0mukIg5F5Fta3NaHs8XE3IMCHBqH
 jcF7PMKrnrrJ4KPU2CnE6RSbUhQQq1pBpFGkrZIzLX37A==
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6316a82e08607db1;
	Thu, 12 Nov 2026 19:41:46 +0000
X-Mizu-Trace-ID: 6316a82e08607db1
X-Migadu-Flow: FLOW_OUT
Message-ID: <ac7e2bb3-90bf-49e9-9282-cd276b60b612@packett.cool>
Date: Thu, 12 Nov 2026 16:41:43 -0300
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
Content-Language: en-US
In-Reply-To: <4dcf8dcb-bab0-43f7-8fc8-d2eba609ec10@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/12/26 3:41 PM, Val Packett wrote:
> Hi,
>
> On 11/7/26 11:54 AM, Mark Brown wrote:
>> On Wed, 28 Oct 2026 02:42:55 +0000, Kuninori Morimoto wrote:
>>> ASoC: soc-card: move snd_soc_card_xxx() to soc-card.c
>>>
>>> Hi Mark
>>>
>>> I'm now posting ASoC Capsuling patches.
>>> Current status, and this patch-set postion is below.
>>> This patch-set moves Card related functions to soc-card.c
>>>
>>> [...]
>> Applied to
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 
>> for-7.5
>>
>> Thanks!
>> [..]
>
> Looks like this (or some other very recent change on -next but I'm 
> pretty sure it must be this) caused a regression on Qualcomm Elite DSP 
> devices (those that use sound/soc/qcom/sm8250.c at least)
>
> kernel: Unable to handle kernel NULL pointer dereference at virtual 
> address 0000000000000038 [..]
> kernel:  sm8250_platform_probe+0x114/0x120 [snd_soc_sm8250]
>
>
> And without the USB one,
>
> [   23.892669] wcd937x_codec audio-codec: ASoC error (-22): at 
> snd_soc_component_set_jack() on audio-codec
> [   23.892691] snd-sm8250 sound: Failed to set jack: -22
> [   23.892696]  WCD Capture: ASoC error (-22): at snd_soc_link_init() 
> on WCD Capture
> [   23.894243] snd-sm8250 sound: probe with driver snd-sm8250 failed 
> with error -22
>
>
> Maybe the sndcard driver wasn't supposed to do all that in the init 
> callback in the first place but well, it does.. so that's a regression


Sorry. Not so sure it's related to *this* now, it still happens with a 
revert of this series..


> Thanks,
> ~val
>
