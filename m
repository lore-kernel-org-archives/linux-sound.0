Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99A143E085
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 14:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976075; cv=none; b=rPoPh8GGyEYzTibx0CjQLIQuLKcSXoy0HlBR4fLHa0kVHsdmjL3aj1/6cLwL2Ur/g7dZ/sFm2jxsKAp3aellU/f+qETdZv3841oH0ewRBqeyj2hVNJMpc72TJgC6Nz/hy9GEahIDpRQqSUx9rtDv71DO67qLZBLrZ5IWdu1ZhnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976075; c=relaxed/simple;
	bh=lEPbhkAEccg/+UNfVGbkEMpzyY0mRkY78hs0YVYZs6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPGz1wlyELi+SjYOJLAUc74v76hXa4mGDsIxMUFkS0iOvAlLGePEiMgpE97OLgrkKR5ngR3sDN7TIxi19IuTmOXLqr3bnemafAa8emPptaIO4wodTafxEOov1aVJ5PaOh17y1W6Qs5/hU6HOkQVOKQUV9TsOK2IEW/q/vWx5bsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBzl3ulL; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBzl3ulL"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2591340a91.0
        for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 07:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786976072; x=1787580872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVX3vWywMBNgDR8AdiqyF4jrABflZKPn3lQ44d4b6Us=;
        b=BBzl3ulLRgzgmOdCw6+ZacQbQc2/DSR1uRJYRQoHoLdBzXdLSzcWnWv0Olr+l3oWvq
         0zPY+vMNJIK0uXsktqs63Zrcq3UQ/7EBqUJSH++hn3iycbW9bwf8z8u+RH9TYgeI5Gzj
         l/UNfDLDQhWT355n8j6LT0R+V8I9UQTLuNyvpvTFZ2kKIuNb0cE5ZzGFldCvXKyOjSAN
         1vvjkgET07k8dRaXL2P1Aaj0iwFb210zJO8kUG/CUfaiP3KR1zHEYNkskX6efEB9hCpA
         pHNENxRjtIux5L6gmGmGxE7n09QsKtc7UziQD9V1eMy02UaizA9zx4DtOVzwYaEYUj0p
         NyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786976072; x=1787580872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVX3vWywMBNgDR8AdiqyF4jrABflZKPn3lQ44d4b6Us=;
        b=eVkjWldrCKFQ7qbnIkroaj68gpxBxOlDF73QqdXbX/rHTTNcgXZUIEmoBrhu6w4urb
         3kB/8NpCwA3B/OT+RVRp2Em/MPqBazZblvXXC2IVj8rqFHAHlSHzcGNemBwpMzwf9DOa
         DetqL/cMCd+RkdeRXmWrmne8eV5AgG/00Nau8Hzw4l2zSQlgLNbuQZP+yX41DuEzCvKW
         rCequCIe8nhLeU3YehKZL4lKD/NJ22MZkKWdbjaR4xK9NIZWAOfT6HKBpIHdKeQbFIQe
         LCm232bLlERsCIc9/RZyZ9PeMXiIcSr7U7g1bjWrXjqzkid0+hDe21kJDCpp+SGJlKsF
         0jbA==
X-Forwarded-Encrypted: i=1; AHgh+Roc+bS56zyUHvJjFsZH2+tlPoGH4KijrkT8wFhvWAU4vmQ90LiB6Ec/8odH0nhGQxSVtJyHoufOdRWz8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKMd7przfJZYvK1fyLi1F6bZKTPBhyVVSNoPqsdtJcAqwzXecN
	52SXGFIOTpYlh1f4yX6aiivrc3m6r57BKJKSL/tV+o5cY9xVEZFutkGH
X-Gm-Gg: AR+sD10xMXjSuF/aMQQxS7Ge9lBX6ckwACUfvmA32ckUBX28WS+ldNX73cVr+FBXKt3
	REif2KtJ1/YiPDqMgKVAvqz743eLhIiuopE3b1IvYyTrOBkSUbokDbpbGS0sUZg/mHrv6M9+m0G
	iGysyPY79/KBFviFCXpgXjLcBO2icAOX+j82ruCH3tv2jABDXKQr4fUCpSvp2+T5nyMxOKSwkDd
	l8GA0B59q0/XzPt6zwRn5EmHxtLIfdIlNcKue2Ezzhaax5CBjbhjKroms/yDKAHBf/YHgKygpNB
	l5RDnEt5rMDmobKk75tmeGKX4rmgz+a5l+4Y896HUDU7VAy6b5LZnO2rd7KorVCQpHg+c6YgE7u
	kx3wgDlnSTVH1L7Fmcx3xtKwbjYBeoMZdiSGFMnLLCAL1qiANO8mZ39NxRr8qx9pDqER4PR5Tu1
	T9ROtK0wiQWgvRj5Gm3W05Xwj6JS+6f0gTMCf28T799Oax9xiE7LlXO0QgZU+eDaZzwe1kjddWV
	RJTaQWKS0/GEl+7FnpRgZELQgUZ4HLjjgNBhDx6feYtOsDFAxDCa4NNovTK/5cq7lDMhL8jW4IF
	u1JAztzcJ8mW5Q/cnh40U0Yik8M=
X-Received: by 2002:a17:90b:28ce:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-3933b891cc4mr27074305a91.10.1786976072079;
        Mon, 17 Aug 2026 07:14:32 -0700 (PDT)
Received: from [192.168.0.104] ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d2b8080sm2483192a91.4.2026.08.17.07.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 07:14:31 -0700 (PDT)
Message-ID: <de38a940-9973-40d2-a4d1-d9e8f43e6439@gmail.com>
Date: Mon, 17 Aug 2026 19:44:26 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: docs: fix dead link to Intel HD-audio spec
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, corbet@lwn.net,
 skhan@linuxfoundation.org, rhys@tumelty.co.uk, rdunlap@infradead.org,
 linux-sound@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, me@brighamcampbell.com
References: <20260321140212.5026-1-ninadnaik07@gmail.com>
 <87mrztsjnu.wl-tiwai@suse.de>
Content-Language: en-US
From: Ninad Naik <ninadnaik07@gmail.com>
In-Reply-To: <87mrztsjnu.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 27/03/26 3:01 pm, Takashi Iwai wrote:
> On Sat, 21 Mar 2026 15:02:11 +0100,
> Ninad Naik wrote:
>> The existing link redirects to a generic page. Update the link to the
>> specification document.
>>
>> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> Applied to for-next branch now.

Hi Takashi,

Thank you for accepting my patch. I'm not able to find the commit in 
linux-next or the mainline tree yet. Could you please let me know if the 
patch is still expected to be merged, or if there is anything I need to 
do from my side?

Thanks,
Ninad Naik

