Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C8A376466
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 10:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705915; cv=none; b=BG5XhTLNvM3lCU5M7TZM3tJTOLEq/kqXGuzewCg2xpQNbitvbqQbMTk66vJwuLmTRCOUd0Eb4vQgj3NGsizLF9cxVOGdAEH1pNVTC2/wyP+XXzyPGbb5XC1wY88WDt597WJEPK1GepwPjSDqyBY8KZrkUu3T6UVJNVb4bFh82qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705915; c=relaxed/simple;
	bh=MtCFqJbtHP9NgsaOVgO0Ix9ABP8fFX/ihUBykQvxWJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ekPYRBdTYSXglv5zZ7COlwmnbewywe6tIVIrEiL3QwiGxSipkSsiBd728nUSxyMBRCjq6RLJTyYPla1D3JCskcKaPtV/wpBiM/QLNkCB5iefF9t1JLvdhUVyoGgaZBZd3XIMR1w5NESDDBhSNmXhDWniChjRKro8xt2thYZhiVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vsWkIcsq; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vsWkIcsq"
Message-ID: <7c01439a-8edc-4aba-bd7b-0e19f4f470ae@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779705911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MP9Fi/qJsb57xAKQwEkJyzpRKj97pIr9BYqc8X8Nvlo=;
	b=vsWkIcsq4IsbjDlNxWrwlsPZxyIJzLqb/YbdZ4DG4aSJwHJLzfSOTcRmdXOlf88SM1YCrk
	SfJEHYLDXA4CIQMElm1j29n9tN8iv3zvCrTjBtke+M+3nMQJpGu4eYsbJePc1HvqJLgkV+
	e95QXWbWl3NV8UTz309RC57VUTNFUyU=
Date: Mon, 25 May 2026 12:44:57 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
 kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org,
 "Liao, Bard" <bard.liao@intel.com>, "Vehmanen, Kai"
 <kai.vehmanen@intel.com>, =?UTF-8?Q?P=C3=A9ter_Ujfalusi?=
 <peter.ujfalusi@linux.intel.com>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <01d1d642-bf24-4ef4-a30d-56884300407f@linux.intel.com>
 <5d8cbbfb-3884-4c6b-aea8-0c9a76964b3b@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <5d8cbbfb-3884-4c6b-aea8-0c9a76964b3b@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 5/22/26 16:32, Cezary Rojewski wrote:
> On 5/22/2026 12:16 PM, Péter Ujfalusi wrote:
>> Hi Cezary,
> 
> ...
> 
>> This patch showed up in sof-dev kernel after a recent upstream merge and
>> broke audio card probing on some devices.
>>
>> There are no errors in kernel log, the card just does not form.
>> Reverting only this patch fixes the card binding.
>>
>> The affected device have 2x sndw speaker amps,     1x headset codec and 3x
>> HDMI PCMs.
>>
>> It is likely that one of the codec's probe happens after the card
>> probed, the card is not created for some reason and nothing happens.
>>
>> rmmod snd_soc_sof_sdw
>> modprobe snd_soc_sof_sdw
>>
>> will create the card, so it is likely that going ahead without waiting
>> for all components can and might break audio on system boot.
> Hi Mark,
> 
> I've had a debug session with Peter today (yes, right after one with Alexander) and the outcome is kind of an expected one - dependency issue, TLDR:
> 
> // working case:
> 1) snd_soc_add_component(sdw_codec)
> 2) snd_soc_add_compoenent(sof_platform)
> 3) <sof card is probing just fine>
> 
> // failing case:
> 1) snd_soc_add_component(sof_platform)
> 2) snd_soc_add_component(sdw_codec)
> 3) <sof card is MISSING dependencies i.e.: components>

FWIW the SoundWire codec components are registered during the ACPI scanning phase - there is no dependency on an actual codec being present or bus started. It would be extremely surprising if the missing resources came from the SoundWire side. The probe is done early and returns a clear status.

Conversely, the SOF platform component is registered in a workqueue which doesn't go well with deferred binding. It's a known problem, there is *nothing* that will trigger the deferred probe list to be rescanned when the probe workqueue completes. If a component isn't available, the card creation will fail and nothing happens.

You can test this theory with a simple Kconfig change, with SND_SOC_SOF_PROBE_WORK_QUEUE set to 'n'.

Alternatively you could try this patch from 2021 that will force the deferred probe to be reinspected.
https://lore.kernel.org/alsa-devel/20210817190057.255264-2-pierre-louis.bossart@linux.intel.com/

Note that the workqueue isn't an SOF concept, it's directly inspired by the plain HDAudio driver to make sure PCI probe of non-audio devices isn't delayed by the sound driver taking its time due to the use of request_module for HDaudio.

my 2 cents.

