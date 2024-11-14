Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9364C97
	for <linux-sound@vger.kernel.org>; Thu, 14 Nov 2024 00:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731542667; cv=none; b=YdqaEMux/FismaHocRzaGECi9EGQLWl44EmCHlBL2UyWuQubvtvtUiYdq/bKSRZnk0v0vDyZD50nisr00yIRe4T0PYBNovfg5sNBII5mK+D/YCs3Bp1ok9zWIuCoZN9CFyUQ6d32vtiAWJ3aP7ix3Hsaicq8SfJRqOwJCDknyZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731542667; c=relaxed/simple;
	bh=561KQQ6/C/uqaE76MlqGtmzXHvRMFe4oRknbgQa0WQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iE8Ow/GQ6X+mt7H3WUEVjqL7mfinugz+oUqAubqm+JmddufXa8HF/pwajqHh9YJGT5/zO/jOlrWslOgEr3O3FHu0qsd3bBL2eL0sULr7ZYFdoT+fUQLxj04Yu0BT/e14dMH388C/R5yy63f0cl9ELb2Yi599ZKGEFdGzJTcqQi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4JZSbb6; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4JZSbb6"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539ee1acb86so15210e87.0
        for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 16:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731542663; x=1732147463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y3qC6Tv0EGfP/jM8waCnEIuS4GQbkoOTwh+nz1tcABk=;
        b=b4JZSbb6jqj2/QasGsPXFqSWuTDixU56iJA85oPDQsi1v/LxUgjqfSBYTaAROwiMXZ
         U4w8q7lUijjIk/ENxWjO0gLVytbVDy+97710/re6fOExg0ZMH0g904gn+JKs0NFyoxsO
         T229k6fqm/m9AiLxVneH7E840m2hTa5+K5NXcaCu2XYn66KTySYv0Ob6loPnGaz5m6Ig
         E8nb68GL/kvxRf5vMxYwHiS6VRfq8/mGybDBcbiIb7e441hwH+gFFVdhiNVo8G8h1KLX
         h6QLZtdCePi4Z7sAeXCT7KMeuZvmLAlmgxKscI3Np+DT/oLT0AarArgVJotWNgo+YgdM
         AXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731542663; x=1732147463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3qC6Tv0EGfP/jM8waCnEIuS4GQbkoOTwh+nz1tcABk=;
        b=Hn3C3WadYsnD+CG8ATh4yeTF266nlKoh6qcNkHH25qxK6OFUutaRgJm+lkqb4bInqM
         xvhoaVPH7ec6amVoHhT6zvO2xKF18AIJvjOZ+QgeRa2Y0pFu5PFTwyu8hkWUO02errIi
         tTg9Ehh+bZgZ3PbP5OBOxOW83aFvBGkZtOvOLEUoFu9CiqA/YIMwZUC7R2tQGerDV/0X
         Hj+NtMq0Pikg27XkUKNoPrFUppBlvap6GZvupC6tnO6qCQ4+qEBm/tTHkgT69qtLmacD
         I6VmqMbOQbHauB9yGAuX+6/xJqW8vo9CwydBxeiE3toGDj+p9cCoofUrp23lqIKLaKIg
         agUg==
X-Forwarded-Encrypted: i=1; AJvYcCWJNBa5lBPS1ERwXwMyfsJoOcFZyfEp0CoezDIoRnkSiJWhDjVTcy4B82WjiWYFtvSV6QCAtwl+jdY/KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEnDLbNsUGnGXL4WvDeXgJj7rjMhqPldbDOzEsigRAp11A/t4M
	6Xkvd2+wIhg68kAaSUqDw+OI5UTOzV+D0/Hd79kvaXl0zhbRZdp2
X-Google-Smtp-Source: AGHT+IFW5BXZ0hTyPsOGNhCqua/hVl3owWNSIZD0tU6dUTvrcqyvVgD4JPwj8Eg1jfERvajypHLZSA==
X-Received: by 2002:a05:6512:3ca0:b0:53d:a4d7:1a8b with SMTP id 2adb3069b0e04-53da5c423cemr71057e87.24.1731542663293;
        Wed, 13 Nov 2024 16:04:23 -0800 (PST)
Received: from [172.24.224.254] (admh203.neoplus.adsl.tpnet.pl. [79.185.37.203])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826ae98csm2370277e87.232.2024.11.13.16.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 16:04:22 -0800 (PST)
Message-ID: <e1ce4d0b-23ad-46a8-9f46-c38194376f76@gmail.com>
Date: Thu, 14 Nov 2024 01:04:22 +0100
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
Content-Language: en-US, pl-PL
From: =?UTF-8?Q?Jaros=C5=82aw_Janik?= <jaroslaw.janik@gmail.com>
In-Reply-To: <87a5e9g68w.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8.11.2024 15:17, Takashi Iwai wrote:
> OTOH, a question is rather the other route -- the beep via pcspkr
> driver -- if this beep still works while the HD-audio is runtime
> suspended: that's the interesting point.  Could you check that?
> You can figure out which input device corresponds what, and try to
> trigger directly there.

Beep via pcspkr module works fine without your patch - regardless of
current PM state of HDA device; with your patch applied - the beep is
very quiet if HDA is suspended (same as with firmware generated beeps).

> Also, one more question is whether the beep tone persists if you mute
> the volume on the HD-audio (e.g. set "Speaker Playback Switch" to
> off).  The beep tone at shutdown should be gone in this state, too.

pcspkr generated beeps are immune to every mixer/switch setting except
for "Master Mute Switch", which mutes them completely (i.e. they are not
very quiet, they are gone). And again - this is the very same as with
firmware beeps; that would mean that both (firmware's and pcspkr's) are
using PIT to drive "PC Speaker".

> Yes, the revert is on the way to 6.12-rc7.

Already there by now, thanks!

-- 
Regards!
Jarosław Janik
