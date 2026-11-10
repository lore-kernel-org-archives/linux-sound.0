Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276808;
	b=xjii1jcRRKBkuXyVuqHa6eGvQekfmNWD11vz9nEJRJj7ce6t8pPzctnxCCUV2zAa5GUS
	 mHWMRPfW+o4cUU9ujKwxghozv6gkpyKZIDJOhO9dTKN3nybzab5kvEVDqtKRbrlHz96ct
	 NmnmMfNkEJ/7f6ojqOfKR8kdyEMmeIQn923tZwkU9fW9mIQuOWDtHQQD/tWaTng/8SAEl
	 aeLFKHOSV+RDYiSS/Sq2+NudoMLacMIIJAw8pdKeywMoiNyB62ASt/e0+keiBCa7FOSM4
	 Q4tT2SSUofXvMIgBXpE+9EFXBPFMq0MP4pfzX2q6E0YuZ7+tmZfSQk+YsNVaFz1vIvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fvx5Ms/VNPVQifdamFB9/asAfNuvb6utXEi4ao8hwQ8=;
	b=nmyeb2LIZ8EDZtq8AM69r5spgZMEULzyWCIrMmLYfl+2FLcAofIQqdFFoipAVZLxswFM
	 81V1zU8o8ADQOjb4JO2mtTH/6DpPG+BTrkzWPLUtjrYUVoHyBYqk06dVVI9m7md+1+RMM
	 CZOKY8wgphBj9D58NLxRTLexz4vMks5s52flKYm4GHsGBuOP8OviJVndam8XEj8VkwEY/
	 b/vFfCxLGWO8s0ceUb9CjFC5whsXIlr8bylh9Spj5uN/QCa/cmvi2gSdJ7I4PjtXxZ39N
	 TOkuLfZIXvrwHTloj4CBW253/SVKTHaa1T7FoBjyeogYe2bNhoksQLD/aMHrJIipIeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rX51piuF;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFCD606A321
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 02:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FFCD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rX51piuF
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4af173320f9so817979b6e.2
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 18:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276807; x=1794881607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvx5Ms/VNPVQifdamFB9/asAfNuvb6utXEi4ao8hwQ8=;
        b=rX51piuF8Yovy/WH9Kd7V1SaTO8wV2M9lvCViy6In/uwBPTJ9QU46X9nCCJuqTKpys
         xsI4JlEP1DqBExZ6uJPSM3fAzSB/9194yWxkDTvK6v3/AqWg7BnptCjGDK3oWIK1Z4PK
         AKNtmRvWxrsMNDrzU9FhWf8RvQNBfhTnnRxXpbC+ZwZUAS5gDdd4vvwV4g1cViSqzo53
         8U9yGpPKBPPSUergEZMGzlZt7HVt4vN4UTkE+bKSSpubsN9UNb8Lfk4GEXAW9p+YKJcZ
         vZbD+l50xoCXIDy2b3oWobmYDNNxvLNjtkIUxzWREC0kwkqKcfAAPtf9HERVCNfIeju4
         7vSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276807; x=1794881607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvx5Ms/VNPVQifdamFB9/asAfNuvb6utXEi4ao8hwQ8=;
        b=ZDGVoH91iuDCQNqssYVCH2Pu3MJRYfZ46cayzXis6gDqfhsjtHF46RUhKC/aHvSRD2
         uy9ny2YkG9j7ExptTrhfQv03YyBE4dbXnbYBpBt5gciTYJcakIqjy7vvABHy9qwyJXIB
         gdLcT8PA6okYqHGVpWuXIu5/cA/MiltWSvnnrW8rls0TCW+xMe49fbPlJNAg/qHu37Zu
         VOAiNTX9cyHAlRTFCE2OdnW39WlPZ98GbwVCYumyyd/0uwVlMNixkuyjj/tUcrialb7H
         jmB31P031mfziPiM2EGvHOb9WmjeBKumr+vcwa8k4wIIQLF616swAkHzVw+WZZrOPw5o
         RyOw==
X-Forwarded-Encrypted: i=1; AL+hErHkDmCsoTIJB+a5JJ9vAV+8k/aYaVmON3Mufu0kpR56CUMZH3HNTqsQ1iE66qOviyz5MLPESIS+1b2R8w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/BaJjoqQCobGR8q2L9jQRC4moZ0MW7AMGZt0wXDPvv+FQR/7Fu
	bZx0eFp/ndmZ+ZKIbSuAuUok/b4+ZGhv3P0z7Xgu8J0AhjkxMrwrexzo
X-Gm-Gg: AYBFou03DxJOqS0laMkMQI+kWfDeGOx1+UHflp9kDPa0b1Pm8TDP5jBVMe/xK9i6suv
	jgJ06NYC4y5BI93rIsAeuyDY2OF8CU33QdeTmfXuaXFP0l+hf8qSvyD8HOeW86KGkxDFqR5pz3t
	iKf360g4ePP6yapJ62poslfQVPDyzupWZxWhfPyg6ZL23wZoQXClPVCNnoAJVEUWxEsCv8rrIb4
	SvTzLYOMJKojrS2yk25/Uj7jEMkFBGQnxXJu6FpxLJxYzfXNcXybJKf0SlMZHLGGwDww+QrYjnL
	SKLadAGLzq1cfHU0wN+s5tNUcycrQ3WAvishwJR3gYc7yMeNFWTXe41VmXVwPnGS6UJPDPmeX2I
	ihcNLv8nMN8Ir7MmtJajMC7DZx+h4crOIQDuA1Wk/WyBgRmx44ZUh7VZkjWoNwk1OoWzqTwHe42
	SfJV8hOku1MvC54IhSf1NYU1V3NaF5nt6Zs81rkiGt4H8x+U94sjm53A9sPfJdfszp9vcumMAQ2
	GQ8hH/WAeKct5kj5o18QFyOhYSXVLjtBh7KxWUliyHgH0Pd8QlsHs66Hyu2YV3tb2Bbr+hjv2r/
	Y1xnJZW5mocNOL4VZKRq7s+4p17dCmngg1NFh6ahCLSMkg==
X-Received: by 2002:a05:6808:c40a:b0:4d5:27da:a498 with SMTP id 5614622812f47-5683cd76353mr967405b6e.50.1794276806963;
        Mon, 09 Nov 2026 18:13:26 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905f2faf5sm867656b6e.13.2026.11.09.18.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:13:25 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: Re: [RFC PATCH 13/16] ALSA: mixer_audient: Add enumerated controls
Date: Mon,  9 Nov 2026 20:13:02 -0600
Message-ID: <20261110021302.1077745-1-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <avJJgGbAVnVrUlPM@khmer.arcnet>
References: <avJJgGbAVnVrUlPM@khmer.arcnet>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Christian,

Thank you for squashing the fix and for testing it on 7.3.3.

> patch 12:
> - I would declare snd_audient_int_max, snd_audient_int_min and
>   snd_audient_int_from_ctl as inline [...]

Done.

> patch 13:
> - I would have snd_audient_enum_item return the negative errno
>   instead of e->items and then propagate it.

Done. It returns the item or -EIO, and get propagates the error.

> - I wonder if it would make the code more readable if we refactor all
>   the if-statements snd_ctl_audient_info has grown into something
>   like DIFF 1 below?

Done. snd_ctl_audient_info() now uses a switch.

> patch 15:
> - snd_ctl_audient_enum_get uses ctype->init which is not set by the
>   ID14_ENUM() macro. Is this intentionally always constant 0? In this
>   case, could the logic be removed?

I think the logic is still needed, because init is not always 0.
ID14_ENUM() builds only the readable enums: Mono Mode and the four
routing controls. They have no cache entry, so
snd_audient_raw_get_one() never returns -ENODATA for them, and no code
reads init for them. The three write-only enums (iD key function,
talkback source, optical mode) do not use the macro. They set .init
explicitly, to 0xffff, 0xff and 1. A comment on the macro now says
this.

> - Not sure if this is relevant for the iD14 but we might want to
>   apply something like DIFF 2 to make update events work on the
>   replaced controls 11 and possibly 60 [...]

I left DIFF 2 out of my patches. I have no objection to it, but I
cannot test it. The audio control interface of the iD14 MkI has no
interrupt endpoint (bNumEndpoints is 0), so
snd_usb_mixer_status_create() returns before it creates the URB. The
device sends no status interrupts, and a knob change shows only by a
read. On the iD14 the diff only moves the table-created controls from
id 0 to their unit in id_elems and in the usbmixer proc file.

Two things in sound/usb/mixer.c may matter for your EVO4 events:

- snd_usb_mixer_interrupt_v2() skips an element when the unit has more
  than one element and info->control differs from the control selector
  in the message. Our elements leave control at 0. Would the event
  reach them?
- The notify paths clear info->cached of the generic mixer, not the
  mixer_audient cache. Would a cached control report its old value
  after the event?

Could you carry DIFF 2 with your EVO4 event change?

> - In mixer_quirks.c: Fallthrough case statements seem to be used
>   almost everywhere else, [...]

Done. The two case labels share one call.

> patch 16:
> - can we rename 'create' to something which makes it obvious from the
>   name that the callback is optional, e.g. 'extra_init' or similar?

Done. It is now extra_init, with a comment that it is optional.

With these changes each of the five patches builds with W=1 without
warnings, and checkpatch --strict reports nothing new.
On the iD14 (stable 7.2.15) the read and write checks of the controls
pass with the new version.

For the next version: unless you would like another RFC round, I
would send it as a normal series, on top of your four mixer_evo fixes
as before. Does that work for you?

Thanks,
Will
