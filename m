Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191B01AF0A2
	for <linux-sound@vger.kernel.org>; Wed, 20 Nov 2024 15:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114812; cv=none; b=aDFGLaco6uqGqO44nMCf8rQK6tSpSwa6jTBvuMZthkMUo/TL53H4Q4pNhsQ7ZXH5WfnX23uooMTmu7pFW+J9rsrabGE2ikda3vRkCtlYELmSW6sKaSQedFqfaAlIpzwCKql/qSCZD7q+jK38Up4sKwENFknwaqzeIzd5SsVPZp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114812; c=relaxed/simple;
	bh=bABanf3r5mYN9XnZeO0FTyoWbNZCRZydwOaoY+h24vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgxbYdeXsaAd3w1VBOVeY70JwDSZW//SwfSRh0yzOH26WygzwRLuYFt7CptuV+cQIM6ybPyQaxq04zYsyYhwA6LtN2cx4+4xIb4WhriLL8iih5QA7arLq2JQ+TFcmc5vaii3BicT95tsADcp10wx2ZM9GXYxKYnHOJ0M+FroyYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYEttUJ8; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYEttUJ8"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53da353eb2eso7192290e87.3
        for <linux-sound@vger.kernel.org>; Wed, 20 Nov 2024 07:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732114809; x=1732719609; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kGz4Muxeq+roPjz5tK7aNeJzyPrX4ZD6sOiy06WxKzY=;
        b=mYEttUJ8sibSN1t/OwaP9OgcBgzzNDTgoOQnvti/UoaNCSEf/YFJ6qe55i3QmiTJS9
         z649GhXkbMcPlDS+tBlgQW5kmzJYxS0hYZNxOR0HRocUbSGMm8MmPilJwvvtrJC+E8JA
         2bIxQ34STWfx30AQrHbnjQGmHlxSEEhcxwZlj3KOkVQwZMDgi+HcgwOc/v9MPWq6DmSI
         8CblcGNn836+IXnyGrXGPzqW6SBTu+xAfrDipMN2/ow2Y0lyR8nAmDVTUiGCSMAoL/e9
         ZYS0MfpBb76k7oFGTDBlfzY9bD8oVYBjPkCgv4A6Xc1Y0rj2R1TXrPpfv5fOOCXcctOk
         qKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732114809; x=1732719609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kGz4Muxeq+roPjz5tK7aNeJzyPrX4ZD6sOiy06WxKzY=;
        b=RVU+0OnUAxSZgpCX7F+z1rMHsZmtyHuz1EvIU5asjzjVe64X16UScYx7NypBMESSV1
         EW/AJdz75eJTJyFKIYSOLwSw3FRh+RbjELHVjvdHDocGPA7s74AkDxKusZMInv5MHFkJ
         XjZc1wKBYTvkPtwzcMVRA0+L5lggv3WHeG7+RpG4+6BAUb3cOtgpqaC5aIkBDJV3O5pD
         m38t2LL/uTaln+tAsn2hCoPgh7NVfKrMIzVdbvf6KpFz22Ln+dzTuIG5A97y+Btyg4rQ
         vZVN6ZEOGssQfi14p7RvxTSZCKxBO19PGI5T4U+olcbYVcNAJihGyLv1pO6QdQBNb2KI
         IkYA==
X-Forwarded-Encrypted: i=1; AJvYcCX82lcpBTP2KmBLBjQEMEY+9GGPDI3xnl9ZDE4rp/KUe52zUjbuPe9m4k8+lai2kQ4aAIcoyvHCfwARpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxck8GUrnsmME0tC07w70WjcK0bRIamXFMdsYFmzGEpnkBmkMYb
	4djN/6ohM5OBS7fxV0zpc6gqkdmmEjb1DtvWOrJa+nqTlJ1zn6s1
X-Google-Smtp-Source: AGHT+IGd0ka6I7HYEyRNNporsz1SXFRoOOcpjq8T3mpRKFz3T5/Y45AR1cik8HAbGx1Lwpu8+0WV+w==
X-Received: by 2002:a05:6512:b20:b0:53b:2105:18bb with SMTP id 2adb3069b0e04-53dc136b873mr2117192e87.51.1732114808978;
        Wed, 20 Nov 2024 07:00:08 -0800 (PST)
Received: from [172.24.224.254] (admh162.neoplus.adsl.tpnet.pl. [79.185.37.162])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd3edc9bsm665405e87.16.2024.11.20.07.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 07:00:08 -0800 (PST)
Message-ID: <af71370b-e68b-4dad-ae04-8b9f5742568e@gmail.com>
Date: Wed, 20 Nov 2024 16:00:07 +0100
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
 <74e49336-4552-4224-9b14-204d4264d647@gmail.com>
 <871pzuujkc.wl-tiwai@suse.de>
 <18c74a03-ca32-4eec-9771-bfbd37d315a4@gmail.com>
 <87a5e9g68w.wl-tiwai@suse.de>
 <e1ce4d0b-23ad-46a8-9f46-c38194376f76@gmail.com>
 <877c96szig.wl-tiwai@suse.de>
 <98af4276-927d-474e-a78f-7c6f0bae3090@gmail.com>
 <87jzcz5jww.wl-tiwai@suse.de>
 <13b257a1-8336-4286-b801-bb09082bd316@gmail.com>
 <875xoi5qto.wl-tiwai@suse.de>
Content-Language: en-US, pl-PL
From: =?UTF-8?Q?Jaros=C5=82aw_Janik?= <jaroslaw.janik@gmail.com>
In-Reply-To: <875xoi5qto.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2024 08:04, Takashi Iwai wrote:
> On Wed, 20 Nov 2024 02:29:59 +0100,

>> And one more thing - both beep types are audible on the headphones even
>> if Headphones mixer is set minimum and Headphones Mute Switch is set to
>> mute (if Master is unmuted, obviously)
> 
> Hm, that's odd.  At this moment, do you hear from the speaker?  Or
> Speaker Playback Switch is off?

The speakers are completely silent once you connect headphones,
regardless of Speakers Volume / Mute Switch settings.

-- 
Regards
Jarosław Janik
