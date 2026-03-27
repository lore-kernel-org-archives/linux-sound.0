Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D157392831
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 12:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774614522; cv=none; b=G0yqu91jQZef2cG4AXpHfNXde4FyamHJ3MNfG4fg2mwmVXaujkAyCMvq8Y9BGG80RhLXi6Xn++BecSAxTeobfk+ZZUkxC2Dh26bJCVK9LlUYeKLDNJzbIQVOU/AXCbaTDMgXNty2eLrbG5/owp3CuuWQ7A4+Wj3sKALT3ikDljs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774614522; c=relaxed/simple;
	bh=/GQREby2l5g/PuAOH0xjt7pPxN1b/Y0J7Sacx3VEIUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LzluR3shmU28PSFo27F2bChI45nJZhKsDmr458Aemu2UCUeVDsYYCh036GqIILVN9TzJrC3MBj4hFwTfiGtZqc7TP+3cDyPy31Y0XU3ec+d0MhSqanXI9JyJKiw5ovT78T9yFTcrHw7XWHH2OIOvCWF2qTTweSPWyFxPGiyRlEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLlaC+iE; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLlaC+iE"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12732e6a123so908996c88.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 05:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774614521; x=1775219321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qgGKHRXHvxgAbIuqYwH/wwAlALbdgjHZfUyg8uIlkB8=;
        b=fLlaC+iE7kLj1uT+pokkjP+OtLWQUer7TIhnhaadHyPIJdE/LyQYRjvX23Tlxc/P8K
         6E9nRsMah17KSCVWRezsLPeg4q1tsgH/AaYRYXY8/0pP10DNu4TVqE6u6pthdQISi7tu
         pCetzT0sqeOX3tMCVq3q2p5AMgxTVyL09a8pYc8W5HqsBjH6omDKq8ohnPPnkiRdT8U5
         ojpQ2MjyFyF+QNeO/Sozwa4xECCLHhbQDgKlvms22O6ub7hvnePH9xwoFzPmI7M35lrQ
         g16vgW62NxPo9hg9TtLSny5eRhh02vb+dgwEzEFJ1PivyPA7mwB2LEa8nag7ZodVZQsv
         Tnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774614521; x=1775219321;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgGKHRXHvxgAbIuqYwH/wwAlALbdgjHZfUyg8uIlkB8=;
        b=JZBXERSiFvNx+qvsXDJAY7UchauREKNUbuVcRVBrWPlFXr7Y4JD3c7bklYODxEKqya
         Ed7dC82ZLlcP2TCri138RvqZ3LPpCmAc20v2oRWlBPN+l7Uts3WIRaz+3HI7QIWMPngK
         Ac71Ho1oTJR+ObALdBSS5Kf0wIrb+Qxtm09hRZs3E1+ppnZ1NmfwSARCA4pUDISfV9cL
         nSO+w3qXDplucpSeYEMdJqMVnohZapgBefnAP/xkwbG4e66MLmorluMtGeufJm1gYsjY
         +lPsJfeK6fvlV0Ae4RBJ4peovV1BzUnA+mk0OCaARWcihookGSAJl7C0akuuFi3KtOtS
         mCFg==
X-Forwarded-Encrypted: i=1; AJvYcCXufui9fyVFQrXMOjIRphDO/sEoMR3xeyU5Ps8YUp4HCaHMjGHIOLuDKyEFPv4AfqhUVozhs9vEJT1HrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2COiiQk+cjyPzCw3tQwHcbDgML+2WeFXIggRtTwrzedbKYwPn
	wRIEHns4AejlSqY0lFlXJ8loZflFwZUKFegM+kU2y8xCxy540QghlCG36rH3X5Rh
X-Gm-Gg: ATEYQzxvwkHy6WEP5RzhNQoQGSP3v7CJ1tk6z3vyjhdTHRAifbXZweYhn6JO+SjiITA
	9d851fBzVTYNEPDm3OBPJAvJQ2lIhTSwQBHIU4HY7pndohrIv6/A0ThVj0eaQ3Ltu/3v4DFSh1G
	v+kW1udFAaLFv0BA/Es7aX0XvZYWTjyvzQ7pNomdMQe2kGMYwPsvrP39Gl10/+4Ykdy179BREFf
	LTSo3TEyTpIGVePA0Ac9HXDdEVnHcYdxDbVhd1k8awttETGwBNfeZI3Q3eLQQuySqfige++gCVG
	/fwzUSD3UCcWiU/eUn+An1ey2twoKlRG2kLiHDMSs6WdfJnAEdgq5/fTc3R4ucHIfsPA5JLASBh
	G0nWH1LMc95iC7espUgrg0JRih7xNgorePNpytBbKldbAw43cs/AMwazUYDVwD5fqs0ogvavzK6
	jY15NvkTatqXcvv/xHg/saBGJ9+StgDb1xLiiOXPJvjgU8eQoKDebXRHiw2cdopVHlEXDn7ktx
X-Received: by 2002:a05:7022:4589:b0:11b:ec5f:1c37 with SMTP id a92af1059eb24-12ab28d5ce5mr1422992c88.18.1774614520473;
        Fri, 27 Mar 2026 05:28:40 -0700 (PDT)
Received: from [192.168.1.8] (177-4-161-78.user3p.v-tal.net.br. [177.4.161.78])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa762430bsm7686697c88.10.2026.03.27.05.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:28:40 -0700 (PDT)
Message-ID: <598871fe-b82e-4d51-9886-8c16dc68ed6a@gmail.com>
Date: Fri, 27 Mar 2026 09:28:36 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: pcm: Serialize snd_pcm_suspend_all() with
 open_mutex
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260320-alsa-pcm-suspend-open-close-lock-v1-1-b5992a120335@gmail.com>
 <87se9lqz8k.wl-tiwai@suse.de>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <87se9lqz8k.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/27/26 08:38, Takashi Iwai wrote:
>>  walks all PCM substreams and uses a lockless
>> runtime check to skip closed streams. It then calls snd_pcm_suspend()
>> for each remaining substream and finally runs snd_pcm_sync_stop() in a
>> second pass.
>>
>> The runtime lifetime is still controlled by pcm->open_mutex in the
>> open/release path. That means a concurrent close can clear or free
>> substream->runtime after the initial check in snd_pcm_suspend_all(),
>> leaving the later suspend or sync-stop path to dereference a stale or
>> NULL runtime pointer.
>>
>> Serialize snd_pcm_suspend_all() with pcm->open_mutex so the runtime
>> pointer stays stable across both loops. This matches the existing PCM
>> runtime lifetime rule already used by other core paths that access
>> substream->runtime outside the stream lock.
>>
>> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> I guess it's safe to take open_mutex from this function, but it's
> still worth to mention it in the function description.
> Could you update the description of snd_pcm_suspend_all(), too?
> 
Yes, I'll do it and send the v2 patch.
-- 
Thanks,
Cássio

