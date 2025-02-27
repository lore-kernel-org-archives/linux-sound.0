Received: from mailintern.ednic.net (mailintern.ednic.net [89.58.10.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0EF82D98
	for <linux-sound@vger.kernel.org>; Thu, 27 Feb 2025 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.10.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740650632; cv=none; b=iXznxZtgQoNdzFeAF5ZU0W5np5OoelO0ldSoRX0VpjIldQUJkmks3n2b/4m1+XacsCg5smC/FRHYtjY0uL841mnFRg3AMyaJ7Vzlftjj/layXRtNCONrAXKe7vJXt4cM1r+p2qtQlRU+HFo7Z9QbUeE8Rw39DXb1aKw+RFKEhOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740650632; c=relaxed/simple;
	bh=5b4EG3lPUl+EAv5cEjH94/9rR2BJETVgsz35t8ctpvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NaVrrG0Tehp8v8tUc8P1GUwRt7+H6QY0TUn0gLm+1SS2f2XESnGPCDAlN60pNIOKAXIEz8jtkr9Y3SRsrx7HdiCTwvtuvgdnKHuqz/E0Z+Pi1n1FbIjWezKiZL6jL9idP/GHMeMWBcvmqwZWRLuNtBjclWHlCEAR2AJoKwTiOkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=s7u.net; spf=pass smtp.mailfrom=s7u.net; arc=none smtp.client-ip=89.58.10.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=s7u.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=s7u.net
Received: from localhost (localhost [127.0.0.1])
	by mailintern.ednic.net (Postfix) with ESMTP id F1C25A0108;
	Thu, 27 Feb 2025 10:53:42 +0100 (CET)
X-Virus-Scanned: Debian amavis at mailintern.ednic.net
Received: from mailintern.ednic.net ([127.0.0.1])
 by localhost (mailintern.ednic.net [127.0.0.1]) (amavis, port 10024)
 with ESMTP id NDjM4FvmbeTt; Thu, 27 Feb 2025 10:53:41 +0100 (CET)
Received: from [192.168.17.17] (p579d906e.dip0.t-ipconnect.de [87.157.144.110])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailintern.ednic.net (Postfix) with ESMTPSA id 4981DA0102;
	Thu, 27 Feb 2025 10:53:41 +0100 (CET)
Message-ID: <ecdb2314-fb78-47d6-96d0-dcd4a51ee397@s7u.net>
Date: Thu, 27 Feb 2025 10:53:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rename s1810c* to presonus_studio to get s1824c working
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
References: <20250227064308.154758-1-git@amin85.de>
 <87mse77n1t.wl-tiwai@suse.de>
Content-Language: en-US
From: Amin Dandache <amin@s7u.net>
In-Reply-To: <87mse77n1t.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,


Yes, the previous file was named after the exact model 1810c.
I would not like to put the 1824c into the file as it suggest its just 
one model.
It feels like monkey patching for me.

Also it's the same series: Presonus Studio.

And yes it's just a new device ID, but there are some features missing 
like SPDIF which i could not test yet, also if every function is adopted 
by the 1810c.

I just tested the basic functionality and it works perfect for analog 
signals.

In the future there could be some differences in the handling for the 
models, so i tried to prepare that and rename it to a global name that 
supports more devices inside and more cases for the devices.
like the mixer_scarlett.c which supports all focusrite scarlett devices 
in one file.

I will refactor the proper subject and try put the signed-off-by tag, as 
this is my first commit i have to learn a little bit new.


Best Regards,
Amin

On 27.02.25 10:29, Takashi Iwai wrote:
> On Thu, 27 Feb 2025 07:43:08 +0100,
> Amin Dandache wrote:
>> ---
>>   sound/usb/Makefile                            |   2 +-
>>   sound/usb/format.c                            |  12 +-
>>   ...mixer_s1810c.c => mixer_presonus_studio.c} | 247 +++++++++---------
>>   sound/usb/mixer_presonus_studio.h             |   8 +
>>   sound/usb/mixer_quirks.c                      |  12 +-
>>   sound/usb/mixer_s1810c.h                      |   7 -
>>   sound/usb/quirks.c                            |   9 +-
>>   7 files changed, 161 insertions(+), 136 deletions(-)
>>   rename sound/usb/{mixer_s1810c.c => mixer_presonus_studio.c} (59%)
>>   create mode 100644 sound/usb/mixer_presonus_studio.h
>>   delete mode 100644 sound/usb/mixer_s1810c.h
> First off, could you give the reason why you must rename the whole
> stuff?  Is it just to add the support of a new device ID 194f:010d?
> If so, we don't have to rename everything, but just keep using the
> same function as is.  You can put simply a comment that the function
> supports both devices, instead.
>
> And, the patch should be formatted properly. You need a proper subject
> prefix (e.g. "ALSA: usb-audio: ....."), then put more detailed patch
> description texts.
>
> Last but not least, most importantly, we need your Signed-off-by tag.
> It's a legal requirement.
>
> Could you address the above and resubmit?
>
>
> thanks,
>
> Takashi
