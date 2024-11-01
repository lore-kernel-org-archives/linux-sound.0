Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227EC1586FE
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 09:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730454567; cv=none; b=p7csPlCG5nJ0dRV1If++GRbmlE/lhSoZwVRnLPSrNGrjPXfLpL7EzOfCSLWYKzBz0j0UaENz3xvdoKYq5JrYcg/iyLg/DGeMMvP2QxSbTGOUrMaic+isom/OjgK91S+gW23Vj/tS5VHC1uG728RR4MVz5OUR/V+vfZv0Ket3mTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730454567; c=relaxed/simple;
	bh=VIa8YAv0nViQdPdXqhzqDRsv+NLBUMyjnJX5y86Th0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqUMcoKyZUazuVS9O7mf9Bho69LY3QC/to4r7yBa1aaEHZL/QSTdQwEEG6+IzInbRq7ZMmbd++yzz8Nd/UFVJN/1rRZzDbvmB7eYiwVdKS8yCvX8/L4Jfk6SSw46bupPDjFuIBlP+9+MNuqPxvUZHg44d88I+ZBv2ueXyMPEAxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gc1qtaad; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gc1qtaad"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c948c41edeso2182575a12.1
        for <linux-sound@vger.kernel.org>; Fri, 01 Nov 2024 02:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730454563; x=1731059363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L4gSREl1SRsbN8KrB+7BJe0/JjYYn1cw5BJYmLJiPjg=;
        b=Gc1qtaadeUHt5ckLXe5Oj3ZiETRCvSVCN2BOPseVoSgY6ef10rK1KqBG4n2dp613yR
         cJ9Os5Z+tDzrYXILjOJS3701nL1yR2u40GaMq9hwaYxGAqzpngotW+010YT/Eq6PfSMs
         Z4leX5dyq5LKZ1u9R2BB38MSNlT3Eihlqa+Tx3232BrqOyi2tB/5fkPcHQ/ftWO5SR3y
         IYwBcJfoYWLFNh7ryJVNS61uzozy91fTmurWsZg9b1eGjPcEcxflDczSTdEnLNxF9t4O
         owcCvjGq17JyW9iu1C5M/JggoiC5rEMGMHvKHWoFLVJQHgRMfgce7K/RJzCeOK7fTYO5
         Pg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730454563; x=1731059363;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4gSREl1SRsbN8KrB+7BJe0/JjYYn1cw5BJYmLJiPjg=;
        b=kpQu7/FpPstnoTTNCZ43w6ViTAfNtWStpL6egVokP5Hji+e3vqNQMJHOHuEkFF7dCS
         yasthiQeauWWhyJEMq2iJGGT8Y0MMXvGwba980wfrUJ6nGbZ51cXkWpA2s9nL6m2NUP2
         TA05IXnA1KPRVudGYn+HxjqJUdjmRWgmfVnip5la2n+HaXFmH329NTI4JIuQOP5GZFVI
         5vXP+C7zlDOYto6NFttjlhC24xh0FzggVEOslod+jCRf3CjQfKDXjIpxPNcDKxKV8VSq
         NcbNRJ+r5A/1CreRAD8GuSOmKpR6yD54FZ13tUWInrZtrI64UJHm5DKx6gDMxAYQaeKR
         L2NA==
X-Forwarded-Encrypted: i=1; AJvYcCVtQStL083pdJ/1QuFLRI684BxAwobl9rDXQ/omWLQ/9ZU0+37ROJH/bS9NUIvv30yX4MXabuagYLa/PA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyljl6hsHfcEaPdVzZCojTdOQMmOOzGTgeLiJHr/zFOXCEvCXhh
	8waFm9GM5sgcy0mhqQlwXg4nXYbISORCjjSrxfLcjTnlPStgClEt
X-Google-Smtp-Source: AGHT+IHzVt2+M0rolhSIaAIS2/95HdL1QU0MnRy4czCekhoYDIOkTFKbNxOObSDpIQ7srHXcxSr4sw==
X-Received: by 2002:a05:6402:27d2:b0:5cb:e53e:85a8 with SMTP id 4fb4d7f45d1cf-5cea9677d26mr4480556a12.11.1730454563061;
        Fri, 01 Nov 2024 02:49:23 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9dbc:bd00:c5db:e5ed:512d:1904? (dynamic-2a02-3100-9dbc-bd00-c5db-e5ed-512d-1904.310.pool.telefonica.de. [2a02:3100:9dbc:bd00:c5db:e5ed:512d:1904])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac77051csm1355223a12.32.2024.11.01.02.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 02:49:22 -0700 (PDT)
Message-ID: <cc57a1bb-719f-4840-a84f-ceb7f03ad061@gmail.com>
Date: Fri, 1 Nov 2024 10:49:23 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: intel: Don't free interrupt when suspending
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org
References: <1b7e109b-eb69-4542-8022-4ac8f9116474@gmail.com>
 <87h68ruzy1.wl-tiwai@suse.de>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <87h68ruzy1.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.11.2024 09:21, Takashi Iwai wrote:
> On Thu, 31 Oct 2024 20:32:52 +0100,
> Heiner Kallweit wrote:
>>
>> There's no need to free/re-request the interrupt on system suspend.
>> PCI core takes care, using functions like pci_restore_msi_state().
> 
> Well, it wasn't always true for hibernation in the past,
> e.g. snd-intel8x0 driver had to deal with it.  I guess it's no longer
> needed for modern platforms for HD-audio, so I'm going to take this
> for 6.13.
> 
Interesting, do you have any link to what the issue with intel8x0 was?
In the commit history I didn't find something related at a first glance.
Maybe also PCI core simply is more mature meanwhile.

Heiner
> 
> thanks,
> 
> Takashi
> 
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  sound/pci/hda/hda_intel.c | 13 -------------
>>  1 file changed, 13 deletions(-)
>>
>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>> index b4540c5cd..9fc5e6c5d 100644
>> --- a/sound/pci/hda/hda_intel.c
>> +++ b/sound/pci/hda/hda_intel.c
>> @@ -1040,14 +1040,6 @@ static int azx_suspend(struct device *dev)
>>  	chip = card->private_data;
>>  	bus = azx_bus(chip);
>>  	azx_shutdown_chip(chip);
>> -	if (bus->irq >= 0) {
>> -		free_irq(bus->irq, chip);
>> -		bus->irq = -1;
>> -		chip->card->sync_irq = -1;
>> -	}
>> -
>> -	if (chip->msi)
>> -		pci_disable_msi(chip->pci);
>>  
>>  	trace_azx_suspend(chip);
>>  	return 0;
>> @@ -1062,11 +1054,6 @@ static int __maybe_unused azx_resume(struct device *dev)
>>  		return 0;
>>  
>>  	chip = card->private_data;
>> -	if (chip->msi)
>> -		if (pci_enable_msi(chip->pci) < 0)
>> -			chip->msi = 0;
>> -	if (azx_acquire_irq(chip, 1) < 0)
>> -		return -EIO;
>>  
>>  	__azx_runtime_resume(chip);
>>  
>> -- 
>> 2.47.0
>>

