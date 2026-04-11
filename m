Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFA01E5B9A
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 17:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775928598; cv=none; b=jH62az+ag2KAsv/bQ1B4nZpQqmUl2roaSTGie+a0YSUzXnbzqg7j6qIjwQafwRu1uJLMaI7YsTW7bJEgYBdC1FfLgqn6Tx5LRnySaAIVy4LJZu+lpfw1sCwnoUy01yR3NAlZk9FQyhSiF9ByA2pchWP+HcEsouRdIRC3XoIM8ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775928598; c=relaxed/simple;
	bh=dirA1a9UmDIid6Pgg9ePon3skrfLDFOxXN3oXVH9hRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V1PZm5mx9vDeRTHA3yi8NM2/aN5guy0KYYZO0NVxs2xV/Bbv+0oQ8tzXpYMbAOEH2zE4sxO3d+j+TPZAcGmsrsIDXNATSe6/fQqeFoML0YWme4f9AAjYqHRuoX8uhhfowhPUTMxUuEcecuIONSFYtIjOi07342ay+28m3pn0Bd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ky/RA19W; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ky/RA19W"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c1fcce8f8so4086187c88.1
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 10:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775928597; x=1776533397; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDHKKqaGG7fQBbe4wTpVAAuYKHB8RLNkBF6HBQZqJCk=;
        b=Ky/RA19WV88tTxIvOnEtTwfez/oRUZ9kRGTBbI+e7a0SSUni4rCjKacIRbM7fgDsnx
         jVa4QmpTYz+iQUyyQxSklW3LYjiyaIVbvcuR2YMWt7pp6LjQGIDgOrAafOpZN+2W41a7
         T2+vSma+NeQXL/Fr3ygMcmacoxpOlxQa21Ulw35Dh1jaSJP3XJH6wdAz6oTP25VuyfMr
         BhhDe5YYl2xCJLBfUG+P/4MxoGhM6Egm6nQukjyIKfJI5KZLHGwrEEslJG4R/mmUoRjy
         KgaJBNE52WSKC7LO880hYdJ83VewQOr6tBhchG0eR/4sskH8op2A0BTo2d4HCraoirUM
         Qb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775928597; x=1776533397;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HDHKKqaGG7fQBbe4wTpVAAuYKHB8RLNkBF6HBQZqJCk=;
        b=quQZC7u+tgOMP+6R4zMUEYEhWismi3pEUVRBeqzVGsCJXZSUpI1Z6HcSJRHfhNkE9d
         JqQHKA3BEAovJ8QoMhtKX8or+LVtD+7CqppkQWSBBJSHoQXHKwndku+JPTScYoipDRtE
         NRW5gYj6pvsjdByrkUGZSBr+00zA9ZVVCLNFzEeznKOlMJSDEOBlIhJltW9Ve87GZOht
         IfqJ5dAjvlOUpHjhDL8hOZ/m1WlbPtH3S/KqttmC54byL41bkoBwME/AIJEdjSeXfeFU
         QscoJq1pYs6NsGmGOFXwSfKy24pI4hiuWRAn73C0f+N5077Opt+CmaB5N17ZyQoySnIv
         F0nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSsu6x8K7mBw6pxkZFyGSUstQ12crYED+s8eiTmKx0JatJpCmzPs4o73zWVneCWrGPWNzah2FTEvPTSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyegbxyPkw4E2AuVeNpmGBUg9S3W3qMa1QguKzdGJExXRpkJB3u
	gYukB8ZE5dnCcJkuMkDOaYYwkE9n/hb1/B5huEJjSw3RtdhBPMQCcb6r9Etx7muQ
X-Gm-Gg: AeBDiet237AnyWeRXv9HmZKgBthFYbOIdQDUPvWF7zrNc/27Mqs71o4xP5EW/WgbdEg
	/w97mbjQKKZ+a2nO0vkpPhnEzt3pO6nvS3nhBLkn+qp71UAf6G/5/U51EdCkrqoj9vIegizAYht
	4JmexchBoqyQzvasW3io2lmD6MVBWwS3JMyQ3OdR5J1W6mmos3Y+EgCCfgq0LLN8IVjx5q0cMQ8
	20OWJk53/iBeKlyfX93h6bWli6yy4RO7pTX+GnXzBIUf26aBayzE/Y/XOoCexppeezSR38FMZzM
	CY+XPnIwEoh+Z4jc4b0niyFGWCuaExoR5jXNUzk7NK1DdvhPlFrvR0nfBoJ5404bahtXxI1bjat
	rk+4C6nelcqnQWlbXUl92x0eJiVre4AJbw+LU95YWEeKbNvYyjJO/kOwBZxT0AyhostA1X1/clW
	jpHnWrIq4eI/va1JoyBnMt33BFxvSrpgbGwJGePuwTfi0BE/7gncNxZ48wl0wE+tFGDSeZzzCwS
	OIfaQNnXeHY4uM=
X-Received: by 2002:a05:7301:1925:b0:2c4:d01f:6ef7 with SMTP id 5a478bee46e88-2d5883a3a2dmr4849615eec.13.1775928596350;
        Sat, 11 Apr 2026 10:29:56 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5630ac330sm9246431eec.29.2026.04.11.10.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 10:29:55 -0700 (PDT)
Message-ID: <77e38ccb-3f38-4c1e-8fe4-98ee643ebe63@gmail.com>
Date: Sat, 11 Apr 2026 14:29:51 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ALSA: sscape: Cache per-card resources for board
 reinitialization
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260411-alsa-sscape-pm-v1-0-3058d988783a@gmail.com>
 <20260411-alsa-sscape-pm-v1-1-3058d988783a@gmail.com>
 <87a4v9gbs1.wl-tiwai@suse.de>
 <fe520e2a-5a95-4b57-a16b-a7a08a326ee7@gmail.com>
 <87a4v9o4j1.wl-tiwai@suse.de>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <87a4v9o4j1.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EJeIUOQp0h0CigEWmYx83BKJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EJeIUOQp0h0CigEWmYx83BKJ
Content-Type: multipart/mixed; boundary="------------XU8r7xD8PPceWL6vxmPxygsR";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <77e38ccb-3f38-4c1e-8fe4-98ee643ebe63@gmail.com>
Subject: Re: [PATCH 1/2] ALSA: sscape: Cache per-card resources for board
 reinitialization
References: <20260411-alsa-sscape-pm-v1-0-3058d988783a@gmail.com>
 <20260411-alsa-sscape-pm-v1-1-3058d988783a@gmail.com>
 <87a4v9gbs1.wl-tiwai@suse.de>
 <fe520e2a-5a95-4b57-a16b-a7a08a326ee7@gmail.com>
 <87a4v9o4j1.wl-tiwai@suse.de>
In-Reply-To: <87a4v9o4j1.wl-tiwai@suse.de>

--------------XU8r7xD8PPceWL6vxmPxygsR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4/11/26 13:17, Takashi Iwai wrote:
> On Sat, 11 Apr 2026 16:33:54 +0200,
> C=C3=A1ssio Gabriel Monteiro Pires wrote:
>>
>> On 4/11/26 05:07, Takashi Iwai wrote:
>>> On Sat, 11 Apr 2026 06:54:29 +0200,Takashi Iwai <tiwai@suse.com>
>>> C=C3=A1ssio Gabriel wrote:
>>>> +/*
>>>> + * Restore the SoundScape's MIDI control state after the firmware
>>>> + * upload has made the host interface available again.
>>>> + */
>>>> +static int sscape_restore_midi_state(struct soundscape *sscape)
>>>> +{
>>>> +	int err =3D 1;
>>>> +
>>>> +	guard(spinlock_irqsave)(&sscape->lock);
>>>> +	set_host_mode_unsafe(sscape->io_base);
>>>> +	err &=3D host_write_ctrl_unsafe(sscape->io_base, CMD_SET_MIDI_VOL,=
 100);
>>>> +	err &=3D host_write_ctrl_unsafe(sscape->io_base, sscape->midi_vol,=
 100);
>>>> +	err &=3D host_write_ctrl_unsafe(sscape->io_base, CMD_XXX_MIDI_VOL,=
 100);
>>>> +	err &=3D host_write_ctrl_unsafe(sscape->io_base, sscape->midi_vol,=
 100);
>>>> +	err &=3D host_write_ctrl_unsafe(sscape->io_base, CMD_SET_EXTMIDI, =
100);
>>>> +	err &=3D host_write_ctrl_unsafe(sscape->io_base, 0, 100);
>>>> +	err &=3D host_write_ctrl_unsafe(sscape->io_base, CMD_ACK, 100);
>>>> +	set_midi_mode_unsafe(sscape->io_base);
>>>> +
>>>> +	return err ? 0 : -EIO;
>>>
>>> The above means it checks only the error of the last write.
>>> Is it intentional?
>>
>> It was meant to accumulate failures across the whole sequence, since
>> host_write_ctrl_unsafe() returns 0/1 and the accumulator starts at 1.
>>
>> So an earlier failed write is meant to keep the final result failed, n=
ot
>> only the last write. But I agree the current form is kinda easy to mis=
read.
>>
>> I can rewrite to make the cumulative error handling explicit:
>>
>> static int sscape_restore_midi_state(struct soundscape *sscape)
>>   {
>>         bool ok =3D true;
>>
>>         guard(spinlock_irqsave)(&sscape->lock);
>>         set_host_mode_unsafe(sscape->io_base);
>>
>>         if (!host_write_ctrl_unsafe(sscape->io_base, CMD_SET_MIDI_VOL,=
 100))
>>                 ok =3D false;
>>         if (!host_write_ctrl_unsafe(sscape->io_base, sscape->midi_vol,=
 100))
>>                 ok =3D false;
>>         if (!host_write_ctrl_unsafe(sscape->io_base, CMD_XXX_MIDI_VOL,=
 100))
>>                 ok =3D false;
>>         if (!host_write_ctrl_unsafe(sscape->io_base, sscape->midi_vol,=
 100))
>>                 ok =3D false;
>>         if (!host_write_ctrl_unsafe(sscape->io_base, CMD_SET_EXTMIDI, =
100))
>>                 ok =3D false;
>>         if (!host_write_ctrl_unsafe(sscape->io_base, 0, 100))
>>                 ok =3D false;
>>         if (!host_write_ctrl_unsafe(sscape->io_base, CMD_ACK, 100))
>>                 ok =3D false;
>>
>>         set_midi_mode_unsafe(sscape->io_base);
>>
>>         return ok ? 0 : -EIO;
>>   }
>>
>> What you think?
>=20
> Ah, I see, one of confusing parts is the definition of
> host_write_*_unsafe() functions.  They return true for success, not an
> error, while the callers use a variable "err".  IMO, it'd be better to
> change them from int to bool and write the return condition in the
> function comments, and use a different variable name like you
> suggested.=20
>=20
> And, looking at the original sscape_midi_put(), it's rather like:
>=20
> 	change =3D host_write_ctrl_unsafe(s->io_base, CMD_SET_MIDI_VOL, 100)
> 		 && host_write_ctrl_unsafe(s->io_base, new_val, 100)
> 		 && host_write_ctrl_unsafe(s->io_base, CMD_XXX_MIDI_VOL, 100)
> 		 && host_write_ctrl_unsafe(s->io_base, new_val, 100);
>=20
> which is more straightforward, and it aborts when a sequence fails.
> (Though, strictly speaking, sscape_midi_put() should return an error
> in this case, but it's a different topic.)
> Maybe this form can be used instead, too.
>=20

Yes, seems to be a better solution.
I'll send a v2 patch with the proposed changes.

--=20
Thanks,
C=C3=A1ssio

--------------XU8r7xD8PPceWL6vxmPxygsR--

--------------EJeIUOQp0h0CigEWmYx83BKJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCadqFDwUDAAAAAAAKCRDQXT8aWv/ug6r9
AP4zyg/TeepzbaBDzqVDD2NfUNpeH6w8+UHQOKcbr3Y1CQD8CKwpEN8g3cdd14Igj6Ep8Fbv+Iaw
uWbPBh5XAtGvDAc=
=+n/b
-----END PGP SIGNATURE-----

--------------EJeIUOQp0h0CigEWmYx83BKJ--
