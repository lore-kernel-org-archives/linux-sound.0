Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508872;
	b=ZfERnT0XLlSqWhtOMfv/SRjVA91BhcRsazP+9RfcAIzvEwslOhVGqIzapy+EIZNTs5bT
	 Xjt8gPDNvR3exqX7tqK3vQ6AQdSFOaotdnS7ix4N+QAAWCoU0NfysKcbL5dZQC5zHIAP+
	 YZfAcGQgjUqFdJ/JIXOPmpOBO4nccFHOeZvB3KF7ykQNUhBL6yPbik9670e7pXSzmr33U
	 9mJTkogAmAJOGXTXmUwv3LZKcPcxwE6oovSkLxerCznmmVhrIcVgLh3+hV8lvU0U2tyjK
	 sww/trpV96fiwIxOL/LyQz0DekZLCc8czYTzDneAXBZiAWTuWAd63w2Za9If/PEWx/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508872;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5Pi39K/eGM+3DYSL/QS1s7831P/nrAhrjzQ2ntDvMAI=;
	b=a+RlHvE+/ASFW/NZuu3CZynIelaKvUNFSkpuB6VTUBkg14NCZYi4jMDv+ZQtlq4iqp3p
	 56xETndUuM4OjaKrRXK83OIeVZZheDbwJZphReNAc+V72jzgBflu28sLcEkMXn1RRSDUk
	 9STsdExVQCbx3hBanh8EI8IxlOJMs8GV01g/7vJpPnXHBP0hVEuXicGrDdVbdPgKmLdiO
	 zpYO4CIlyPTFJf+6cAEuGMLdntkbGVyCVBEcOvlpbUTP42w8AV7o5XvBU32qhRk1hTQvl
	 z/M5le8zd147RmqFCIzasdANkIsDVtnXJsfSs2VtKhEVP5EbBqtTncvS4in9j8BrLsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=ekMGPkSg;
	arc=none smtp.remote-ip=95.215.58.151
Received: from mta1.migadu.com (out-151.mta1.migadu.com [95.215.58.151])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A18606A331
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 18:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98A18606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=ekMGPkSg
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XaEgyzuhhJKRZVI1hBTvnz8vps5LVTdCsbaiQX+6ty8=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794508869; v=1; x=1795113669;
 b=ekMGPkSgRQdjmwW1btTLfrXgUmg+SU8qomRmC6xt2jq2tTFNHM1EvmW22lMnb4UAf0o2ul0N
 tHF0XymEMaXcaNmdXxOiTa3Ftw6VGBahj90u9Z072A4PqStrjPqzyVIzZIQvP8wL9L+M2R/icPz
 nINGyCy2N70HoVRfIiniUanV7Yf9uSApqU2mSpOgNRAfOYbjMxfEG0oGP4m6d9goZz30S4tCK6b
 3H0WEkFvIdtO4kGDXbytF55t3oKR5mDJINZhhgEqnKKozdm2XQ6efK9mPSoDwsogiiGaYMBFSlK
 ka7T8oxCpvhtIPnNZjS/bBFcJjEOBX/5npzwsmwshC2Ng==
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8ca1208ba096189e;
	Thu, 12 Nov 2026 18:41:09 +0000
X-Mizu-Trace-ID: 8ca1208ba096189e
X-Migadu-Flow: FLOW_OUT
Message-ID: <4dcf8dcb-bab0-43f7-8fc8-d2eba609ec10@packett.cool>
Date: Thu, 12 Nov 2026 15:41:05 -0300
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
To: Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
 <179406327208.3424803.13117419976586053782.b4-ty@b4>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <179406327208.3424803.13117419976586053782.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/7/26 11:54 AM, Mark Brown wrote:
> On Wed, 28 Oct 2026 02:42:55 +0000, Kuninori Morimoto wrote:
>> ASoC: soc-card: move snd_soc_card_xxx() to soc-card.c
>>
>> Hi Mark
>>
>> I'm now posting ASoC Capsuling patches.
>> Current status, and this patch-set postion is below.
>> This patch-set moves Card related functions to soc-card.c
>>
>> [...]
> Applied to
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5
>
> Thanks!
> [..]

Looks like this (or some other very recent change on -next but I'm 
pretty sure it must be this) caused a regression on Qualcomm Elite DSP 
devices (those that use sound/soc/qcom/sm8250.c at least)

kernel: Unable to handle kernel NULL pointer dereference at virtual 
address 0000000000000038
kernel: Mem abort info:
kernel:   ESR = 0x0000000096000004
kernel:   EC = 0x25: DABT (current EL), IL = 32 bits
kernel:   SET = 0, FnV = 0
kernel:   EA = 0, S1PTW = 0
kernel:   FSC = 0x04: level 0 translation fault
kernel: Data abort info:
kernel:   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
kernel:   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
kernel:   GCS = 0, Overlay = 0, DirtyBit = 0
kernel: user pgtable: 4k pages, 48-bit VAs, pgdp=00000001146ea000
kernel: [0000000000000038] pgd=0000000000000000, p4d=0000000000000000
kernel: Internal error: Oops: 0000000096000004 [#1]  SMP
kernel: CPU: 2 UID: 0 PID: 76 Comm: kworker/u32:1 Not tainted 
7.4.0-rc2-next-20261111-uwu+ #197 PREEMPT(full)
kernel: Hardware name: motorola Motorola Edge 30 (Tianma)/Motorola Edge 
30 (Tianma), BIOS 2026.07-gca7686425f32-dirty 07/01/2026
kernel: Workqueue: events_unbound deferred_probe_work_func
kernel: pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
kernel: pc : snd_soc_card_jack_new+0x74/0xc8
kernel: lr : snd_soc_card_jack_new+0x68/0xc8
kernel: Call trace:
kernel:  snd_soc_card_jack_new+0x74/0xc8 (P)
kernel:  snd_soc_usb_setup_offload_jack+0x38/0xa0 [soc_usb]
kernel:  qcom_snd_usb_offload_jack_setup+0x4c/0x88 
[snd_soc_qcom_offload_utils]
kernel:  sm8250_snd_init+0xb4/0xd0 [snd_soc_sm8250]
kernel:  snd_soc_link_init+0x30/0x78
kernel:  snd_soc_card_bind+0x7dc/0xa50
kernel:  snd_soc_card_bind_call+0x70/0xd0
kernel:  snd_soc_register_card+0xdc/0x120
kernel:  devm_snd_soc_register_card+0x20/0x38
kernel:  sm8250_platform_probe+0x114/0x120 [snd_soc_sm8250]


And without the USB one,

[   23.892669] wcd937x_codec audio-codec: ASoC error (-22): at 
snd_soc_component_set_jack() on audio-codec
[   23.892691] snd-sm8250 sound: Failed to set jack: -22
[   23.892696]  WCD Capture: ASoC error (-22): at snd_soc_link_init() on 
WCD Capture
[   23.894243] snd-sm8250 sound: probe with driver snd-sm8250 failed 
with error -22


Maybe the sndcard driver wasn't supposed to do all that in the init 
callback in the first place but well, it does.. so that's a regression


Thanks,
~val

