Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97B518E1F
	for <linux-sound@vger.kernel.org>; Wed, 20 Nov 2024 01:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732066204; cv=none; b=HNTew8s08rsJGtXlE23+S7Zy1LQfaMKJ0S5WnvNWVuiHy6OzLRhC3+Xhjc3h35Z0qLK7CZuefzqaSH0YrTP0m1SGv+2xX30ul4jgv+X8YFzaCWAxtsiosEKHYq6tGQFssdy1GWM6+PFi0QClzze/29GKUKKWsvzpD+wBgZ8w5Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732066204; c=relaxed/simple;
	bh=WbxO4jLPapS/2iAZNXRI7FltxQspczqI8mZJEw7zfsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZDwXwEzb6Tk2tTHMSSYBuZmG/izo1LnZLpZOWFRzvcW8t0iEtuZNuQvAJRJ7/0mpfCT1IP/XJUUQgVFVw4DB71xdcyPar9TJf40Mgca5BaSi/pCpP0dRyNzM1vlcI4IdZfIPnYBJt0gwiVF5zs3VXdbmpNgxq3GXzqxIoA2RYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLrTNvwM; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLrTNvwM"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb587d0436so36163831fa.2
        for <linux-sound@vger.kernel.org>; Tue, 19 Nov 2024 17:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732066201; x=1732671001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6EPb7BzM5sFoAzxgHdc/VGIzhDScmhbcy0lynlu0CVk=;
        b=OLrTNvwM+FFpzPVLWnij7hUXOMWZDj79zfWNwCgb5ULRiEbHFqd3wIm19fnUDWiEwS
         PV/g/pLw20NmzgZmLxktsWR8ScVjHlT6qQWwWAoq6I78pzYqQMzlQ49EJQ3Led35p/hT
         cCtSkEXAvYy4JitTdtJi0pK4nIDW6oTp/y9NwD/l3NaZKBUxjyfXuy7quliWFgP0uiQs
         Tc/Hdisy0/yY4vNsL9h5UkElQ+0Cq2h2UvFxwhLQBguEJuJORBQPZSi4RaEVkUhS/5xx
         kg6lUzao7t62q4kG9V4AYXdF/brusqbgumil14CtYeppscozloS0KHMkCAXirPWQddJX
         vcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732066201; x=1732671001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6EPb7BzM5sFoAzxgHdc/VGIzhDScmhbcy0lynlu0CVk=;
        b=g5FgIwzmL1XeV/4cGC+T93mTxz2zSx4jx70UbAne47+WmKBrXt4d+uyampUBW1qcPc
         pvcsbS4f/x9C2WI90IZgMucRBO1MFnuE990KkoVlDrmXC5qAb1g8+meZH/Nz2o0Vcqit
         /yDm5LB7mkUPEK/XYdqCKOcaqF6I+JZAeS1lBxlD1DGm32hoGRLF+/FMPZeO9wYxjxDm
         X8rMkmi++IOnUXz37WGCXQU82xJl/ZYDoEyPM1UuwZksC0uvsm85DWlYsSPi9QxOBS83
         LwHnD/sXXIRB8h3XAeKwwhaIqmf1oZ+54qjWTYY+njA8fTeg+DEqCFxpSZAfXVU1kZKi
         H6wg==
X-Forwarded-Encrypted: i=1; AJvYcCUbVxDHKUbvAio7o/L3KcNYi6OfGXcOx3KXPDa11oU58eG+yUf7fdzoiEPyDDF4GMFB1GserrFAYfkUQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4bH7WxG4VYP1h4nEctzOcsGSOpLt/vWCUyL9ZirFjpin3scig
	A0RUtrXKhvqPQGN3hIG9VUSu1D9EHA9HmHf6NDHZri3b0kHsR7ag
X-Google-Smtp-Source: AGHT+IFPLX6XE3Ijp+fzxghO+t9NaCvtCvTqiGEbk575cCGIyzvJjzDeDiMSrAqhLft86n9AuCsbcQ==
X-Received: by 2002:a05:651c:985:b0:2fc:ba7a:c97a with SMTP id 38308e7fff4ca-2ff8dd44496mr3628881fa.39.1732066200564;
        Tue, 19 Nov 2024 17:30:00 -0800 (PST)
Received: from [172.24.224.254] (admh162.neoplus.adsl.tpnet.pl. [79.185.37.162])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff69ae7f80sm13455261fa.90.2024.11.19.17.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 17:29:59 -0800 (PST)
Message-ID: <13b257a1-8336-4286-b801-bb09082bd316@gmail.com>
Date: Wed, 20 Nov 2024 02:29:59 +0100
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
Content-Language: en-US, pl-PL
From: =?UTF-8?Q?Jaros=C5=82aw_Janik?= <jaroslaw.janik@gmail.com>
In-Reply-To: <87jzcz5jww.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.11.2024 16:21, Takashi Iwai wrote:
> I'm not sure whether I already asked it: did you try to turn on/off
> "Beep Playback Switch" (i.e. mute/unute "Beep" mixer element)?
> It should control the digital beep of HD-audio's own beep input
> device, but this might be also related with the internal beep from the
> Lenovo firmware (and the output of pcspkr input device).

Both "Beep" mixer and mute switch don't affect beeps generated by ACPI
firmware (and pcspkr module for that matter)

> And, judging from the fact that "Master" volume influences on the beep
> sound, it also means that the sound is routed to DACs -- for Conexant
> codecs, Master is a virtual control just changes both Speaker and
> Headphone volumes/switches, and both Speaker and Headphone controls
> are tied with the Audio Output widgets.  You can check whether the
> beep tone volume from pcspkr or Thinkpad ACPI is also controlled via
> Speaker and Headphone mixer volume and switch.

The volume of beeps from firmware and pcspkr is fixed, it's not changed
by any available mixer setting; the only thing that affects those beeps
is Master Mute Switch, which mutes them both on the speakers and on the
headphones.

And one more thing - both beep types are audible on the headphones even
if Headphones mixer is set minimum and Headphones Mute Switch is set to
mute (if Master is unmuted, obviously)

-- 
Regards
Jarosław Janik
