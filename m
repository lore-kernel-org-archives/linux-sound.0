Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7131A0B14
	for <linux-sound@vger.kernel.org>; Tue, 30 Jul 2024 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722348829; cv=none; b=FTjIvS80gg0RVEXBMhT3zQXCcVmzKpc7X77mD34e+qXMoCgGceyU4nI7QyKcLOfUvEOhqpjIXXjtH1ymDKbP5p7XavE9yJfGI64y5U/OlqvJSHQreoQ23CjERLa9HInqnNCcJeU6gt2AMmlPvDRUi9ugfyNtPntf2J++sAt+9Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722348829; c=relaxed/simple;
	bh=ymlq/9UfFj24NCPSGwapvrH+DMZGMPcJ9lbN0il/iwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gW36Z3tVHC7Tl44wbUH5wTvwAspIZBHdRafjxIZ3CvNu5Zrd451cLRhddp86tjM40A8pc14oTwcuJSW1nVRnrQxWyVjSrB3+DqLKGmQPfeumC5dI5AkcnJyQnguWNep5UjK8w9gE88MMqkQzmWneHRYa8wIVWd2PAO9RUiLvoak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=W1s4sakD; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="W1s4sakD"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4DFF436260;
	Tue, 30 Jul 2024 16:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4DFF436260
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1722348820; bh=HSXCWZAi4nVIciVqPwKTmPRuC7q7+NfO7d4br5YBv5w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W1s4sakDEvy3zc38oDBCQR2UU5mly7PTlsH5aUEhCohN/XGvjd7dZkMkKGde53Y00
	 jggFenWqvV2pLmNZDqhTNZziRN8eTlT4GyZMY75C1FcLhqq0420ndS9ijZSW3xgBEu
	 XqBIo63t93ccb7fPgV1krEB2T+0yO5xap3q39t40=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 30 Jul 2024 16:13:34 +0200 (CEST)
Message-ID: <81eb73d0-60e6-4a77-a3c6-f9d7355119d0@perex.cz>
Date: Tue, 30 Jul 2024 16:13:33 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs42l43: Move shutter IRQ handling into a worker
 thread
To: Takashi Iwai <tiwai@suse.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20240729155932.3054632-1-ckeepax@opensource.cirrus.com>
 <87plqw9no5.wl-tiwai@suse.de> <ZqfHC7IodobTlVT4@opensource.cirrus.com>
 <87ikwo9etj.wl-tiwai@suse.de> <ZqinleaAqikxdQGr@opensource.cirrus.com>
 <87ikwn3vqf.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <87ikwn3vqf.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30. 07. 24 14:33, Takashi Iwai wrote:
> On Tue, 30 Jul 2024 10:43:01 +0200,
> Charles Keepax wrote:
>>
>> On Mon, Jul 29, 2024 at 09:30:00PM +0200, Takashi Iwai wrote:
>>> On Mon, 29 Jul 2024 18:44:59 +0200,
>>> Charles Keepax wrote:
>>>>
>>>> On Mon, Jul 29, 2024 at 06:18:50PM +0200, Takashi Iwai wrote:
>>>>> On Mon, 29 Jul 2024 17:59:32 +0200,
>>>>> Charles Keepax wrote:
>>>>>>
>>>>>> The microphone/speaker privacy shutter ALSA control handlers need to
>>>>>> call pm_runtime_resume, since the hardware needs to be powered up to
>>>>>> check the hardware state of the shutter. The IRQ handler for the
>>>>>> shutters also needs to notify the ALSA control to inform user-space
>>>>>> the shutters updated. However this leads to a mutex inversion, between
>>>>>> the sdw_dev_lock and the controls_rwsem.
>>>>>
>>>>> That's bad, how does the mutex inversion look like?  Generally
>>>>> speaking, a call of snd_ctl_notify() from an irq handler is a very
>>>>> standard procedure, and it should work without too much workaround.
>>>>>
>>>>
>>>> SoundWire IRQs are called under the sdw_dev_lock, and then in the
>>>> IRQ handler we call snd_ctl_notify which takes controls_rwsem.
>>>
>>> snd_ctl_notify() doesn't take rwsem but ctl_files_rwlock.
>>> And rwlock isn't taken except for two cases, at a list traverse at
>>> enumerating from user-space and at the device disconnection, so it
>>> shouldn't race.  Anything missing there...?
>>>
>>
>> The trouble here isn't the snd_ctl_notify, the handler uses
>> snd_soc_component_notify_control which also does a
>> snd_soc_card_get_kcontrol, which eventually calls snd_ctl_find_id
>> which does take the controls_rwsem.
> 
> OK, now it's clearer.  I think we can change snd_ctl_find_*() rather
> to take rwlock instead of rwsem.  It's only a quick look-up, hence
> rwlock can work well.
> 
> Totally untested patch set is below.

But why the interrupt routine does not use the cached kcontrol pointer? It 
looks like a bad driver design when you need to do such name (string based) 
lookups from the interrupt routine.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

