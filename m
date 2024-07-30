Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0324C1AA3EF
	for <linux-sound@vger.kernel.org>; Tue, 30 Jul 2024 21:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722376083; cv=none; b=Yw+Te0/WUHssuiS1Xy4lD5795k+WUqH4aSYLvwLfnHo0l4scdA8a25huXsOcpCaUogV6BPnP7za3uKhT3o25BbeW9FK+0Q0Ad80yrIJ+J0xSrn0P2SOdj3DDoT3V5tKnO2OChEIhGSDZHv+TwTDrUCnQx+1blc3k+AMVbV74VmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722376083; c=relaxed/simple;
	bh=/5MT2rpgjVsRmGla0EXMGUKanJQzlInAoU1hs+XwOLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePXWE6nXL6D/kW5Fxu3ADiuVyIINfXHAoFITOVnLICH/pVP+KJIfX8mJaAPPw4vrxul6/CczDa+AmTO8LGJQ6TTHtUEe4D2JAY5QMDYO2LcpzaOrn2i9J60mOxThQhJ3MDvqol/bXSdSmfmuYplNx6WexVIgpMzxlUhg894GsYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=SUmxrrjf; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="SUmxrrjf"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 831146E90;
	Tue, 30 Jul 2024 23:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 831146E90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1722376075; bh=qbFPdbgmrxWaJ8S4aj6ZIbqP88QudAJz83L4XP9pczY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SUmxrrjfjPGzMiXV/798KyyclM6PEvKlx+itUmPYpqxcnZm4c7oW3qgtLysEGKdDX
	 q+DgJ/7pqN1Jd2rPQuWki5evO1/qBIu7ZLdzLbn0/p6GWmxIfhadY0i8mA1k9mf12W
	 dTAxvZrsQZATWti+EmSVNv4VKXWLdZaDUVn4S554=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 30 Jul 2024 23:47:49 +0200 (CEST)
Message-ID: <3615b393-64cc-4983-960a-44bd2b0773fe@perex.cz>
Date: Tue, 30 Jul 2024 23:47:48 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs42l43: Move shutter IRQ handling into a worker
 thread
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20240729155932.3054632-1-ckeepax@opensource.cirrus.com>
 <87plqw9no5.wl-tiwai@suse.de> <ZqfHC7IodobTlVT4@opensource.cirrus.com>
 <87ikwo9etj.wl-tiwai@suse.de> <ZqinleaAqikxdQGr@opensource.cirrus.com>
 <87ikwn3vqf.wl-tiwai@suse.de> <81eb73d0-60e6-4a77-a3c6-f9d7355119d0@perex.cz>
 <f7503750-d751-42e7-88de-061f6263e4b6@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <f7503750-d751-42e7-88de-061f6263e4b6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30. 07. 24 16:44, Mark Brown wrote:
> On Tue, Jul 30, 2024 at 04:13:33PM +0200, Jaroslav Kysela wrote:
>> On 30. 07. 24 14:33, Takashi Iwai wrote:
> 
>>> OK, now it's clearer.  I think we can change snd_ctl_find_*() rather
>>> to take rwlock instead of rwsem.  It's only a quick look-up, hence
>>> rwlock can work well.
> 
>>> Totally untested patch set is below.
> 
>> But why the interrupt routine does not use the cached kcontrol pointer? It
>> looks like a bad driver design when you need to do such name (string based)
>> lookups from the interrupt routine.
> 
> With some of these slower buses it's not immediately obvious that it's
> worth the bother of caching - the overhead of doing the lookup is
> negligable in the overall context of handling the interrupt.

I don't buy that argument. We should always try to write an optimal code. 
Every CPU tick counts.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

