Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7339374D1
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 23:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730502929; cv=none; b=Ve8RYcwbzHzEfrtPhwqpSkQoTskznifN8PLDIqJBqRU8n9Gz692w+7ATz8f1ODndomi7VCn4gZCnqVfyWu2sIvzwbjSRtM9E7Vq47BIpAgpv3M7f6WsKQFuKv/pp96iMWcUzSPKAq7Tr9irPQnm6vbBTvo/qOaikMIlDt6X4K54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730502929; c=relaxed/simple;
	bh=qNEbyNsFh8m0HFo9zNrZWDMCVFwkyr9BtQFOEIGU47o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MdP7OgU2X+W219CpRzh2waWiPfATL0yX808iBCxZVtBmAcFFz1wbP3ExLbzIyu3hpmk6lCHctcZXxgdTOAQyAU221aEeaxkhqYZ6KpzvqsIxDJDHdP+so5R1Gf7sv2T1bkJUrcxwrqGuNHBRQJuG5UrGpm+/fukuzNUyhhV3KaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTK+OT63; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTK+OT63"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e59dadebso2922473e87.0
        for <linux-sound@vger.kernel.org>; Fri, 01 Nov 2024 16:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730502926; x=1731107726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TeKTD/weqanNEFQS4DfAE4bTf6nbrT+dXwVhiqfxcRs=;
        b=bTK+OT63FttIBc36woZVqu6FTFRwKf+gkuCt4lRMC2O/qqur31d9/2vi42nwH3rUtj
         OtS+fFoq+7kGiN+olwMv+CR3UpFI3lH2orb21Adn98U2KQczMouXpWnnYalc4XLK0EGo
         EU2k7CvDeKEeMuoaLmrRYUFV9t/b61xXa2mmrQBrEy8/sJaKNRPjoLdYa0FvCQ3nLI9I
         mk9W6dmEyBoQlk/vMHyfjoIHd+o40dpUmgfjFoyrBuHKB8bh0mHQ3x8dAcOlpqmFJqlS
         AayPV1qSmIK8yxBUBgZoZbcWpnOAXVCZdJy+8kFy9joIyMVlZLTObHQDdDN8NLg45Uje
         Nu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730502926; x=1731107726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TeKTD/weqanNEFQS4DfAE4bTf6nbrT+dXwVhiqfxcRs=;
        b=OT/bNJoTuVqRFbTykz+s4zVDHFNukK6GY7VnaG9RzKDWOUsebir6KiebZrHg3TG9Eu
         8f7ES0YYZ6QadYXDWLzVEbWbmvd2vZuiMRhaCGBhAlsbfMyZgDW9xNV+xPElotJoDI00
         nOIEkpwPRgRH/LKxXkdMXiAQEwgFjdkFoNaV55eftPro+SdWFg1TNS6mgXgk89opidnC
         sALhhZocgA7JOoXBDEtZY+EkBe0kwsYK0c/AraLVSVVenF477gHgSoQAUipZnD+VOYu6
         jVpscRGGi09dkOV0Mhu4u1SERl4D58GfmRN6e90xnWDV3KWq/HyqCff3jisjlB/ingeK
         RLOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUELp3mtftY55K0PDADsjhjmBiCk1qgU3VB+2W+6cZhX2U3vp/61XFggi4RXp8HxQmFZS0E8kt1RU4+CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YywOEkVJvR3vNgQlGVJoZ+KxZLmLl4wkOVnbjdCp6hDWr7lXDjM
	UvI8AmEQ/MckU680brHg6wS/ijNbYiky77xfdJXZRSXjGjiLw+io
X-Google-Smtp-Source: AGHT+IEQFBlkuE2j81iisacwVCtGuXknFeJ9h5HHfjAN+258v7vPtm/8kd22O1RBN5BKOamjOfzxBA==
X-Received: by 2002:a05:6512:1086:b0:52e:fd75:f060 with SMTP id 2adb3069b0e04-53b34ca4c4emr11354187e87.61.1730502925474;
        Fri, 01 Nov 2024 16:15:25 -0700 (PDT)
Received: from [172.24.224.254] (adlk52.neoplus.adsl.tpnet.pl. [79.185.14.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bde0c34sm701929e87.269.2024.11.01.16.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 16:15:25 -0700 (PDT)
Message-ID: <74e49336-4552-4224-9b14-204d4264d647@gmail.com>
Date: Sat, 2 Nov 2024 00:15:24 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Fix beep notifications by Thinkpad's ACPI firmware
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
References: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
 <87r07wws4j.wl-tiwai@suse.de>
 <5683a485-5a5e-473c-a82c-d5c8817742bf@gmail.com>
 <87o730uttl.wl-tiwai@suse.de>
 <5a5c8b8f-13da-4024-895b-25a1b9040a5f@gmail.com>
 <87ikt7v028.wl-tiwai@suse.de>
Content-Language: en-US, pl-PL
From: =?UTF-8?Q?Jaros=C5=82aw_Janik?= <jaroslaw.janik@gmail.com>
In-Reply-To: <87ikt7v028.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/1/24 09:18, Takashi Iwai wrote:

>> Well, to what I recall - my (current) Thinkpad has never beeped on
>> shutdown, other than that - without your "extra muting" patch - yes -
>> beeping in every other circumstances works no matter if HDA controller
>> is in PM suspend or not; this is what I've got used to for many years of
>> using Thinkpads.
> 
> Do you mean about the beep emitted via thinkpad_acpi stuff or the
> normal beep via terminal etc?  The latter must work even with the
> patch, but the question is only about the former.  And that's the case
> for the shutdown beep tone.

Yes, I meant beeps emitted by ACPI firmware and I'm not confusing them
with beeps generated by linux console - as you said - the latter work
fine no matter if your patch is applied or not, the former only work
fine if that patch is reverted.

BTW. The ACPI beeps we are talking about are not emitted by
thinkapd_acpi module, but by ACPI firmware; you can take a look at how
thinpad_acpi handles writes to /proc/acpi/ibm/beep - it doesn't make any
beep itself, it just injects some "fake" ACPI event - and beep is
generated by laptop's firmware in response to that event (the
terminology here might not be too good, because my knowledge of ACPI is
rather modest).

Anyway - with that being said - when it comes to the lack of beep on
shutdown on *my* laptop - this must be because of *my* laptop's APCI
firmware just doesn't  emit beep for this specific event.

> You can pass snd_hda_intel.beep_mode=0 option to disable HD-audio
> beep, verify the device being runtime-suspended, and check whether the
> beep via thinkpad_acpi still works (after reverting).

Yes, that works.
I've even had another test - with patch applied I increased power_save
param in this module to 3 seconds and now:
- when I unplug AC - there is no beep, because device is PM suspended
- now I hit Tab in bash on linux console, kernel emits beep and keeps
device awaken for 3 more seconds - so I quickly unplug AC - there is a
beep, then wait ~3 seconds and plug it back - no beep now. That shall
prove that our understanding of what's going on is OK.

-- 
Regards
Jarosław Janik

