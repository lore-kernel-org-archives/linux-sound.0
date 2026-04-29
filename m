Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094603F788C
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 13:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777467886; cv=none; b=FprIEsXcGLvN8NZUD4FICotntX4zfz4pNkDLbgSIaIf9XT01X//BQZqOYtALDy1IbdqcYmagxHG+lHcVlRhwzlvoMm0s0sZZICkLyWlXmJkGlLUWZvQBwTSeFOsQB0NaWkoj2TtR5ssyaqj4iG0wNpVqoKR8qH0qMvJeZmIfaRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777467886; c=relaxed/simple;
	bh=TJSav80DktfmY3B8ZqB1exR63A4WNnjakBVK9H9Fy88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F9xWnhOi0Ae1MgvN7IsDtG85CSeu9YV/TKUmFp8WVhNQfDYMJDLRw3HBR17yf5rB25Sr8xKSG4J1KY8UQJfjEYdDEyco/D9TyRidVB7B6K2EfXg2pCryDag4F4RkB6ulDPmGlpyNctEj3MkJ/8iiLTkYXm0A274KlgKsQrMdtdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctISp6AY; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctISp6AY"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c156c4a9efso17446424eec.1
        for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 06:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777467884; x=1778072684; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dG3vv118uAikoQ8DAdJIrTS307cS6CSisA18Twdwdyg=;
        b=ctISp6AYaRQWwHV3rO4VWfskkZWMUiHjXfry9lHv1QJJVZ/qOCJr7OgokvhcKDfXjs
         1/rI+CFa0GRcxuAYy/ptJUHY+HpN5KOFHS+jD3oBtHofhbpqD/dSHsWCuvnKgJCkotZ+
         4Pshnn3jaNmMyjZsK4QKG25yNsUXZb9fL9DyhkLFOMgYyn2HUPpkpRc1Attex7Pt02uN
         0OBbgipEQ40RS9VrPLb22HtDV9w1NC0M7ZXJSY9D1fdn8humtGvzmFcLbf67ywjEL31Q
         0KBekRsg5jPBYz+9Bv5PSL+gTrfbqBgTLpSETDItz64l7OWasi/Bd3pS82INPcDeLpi4
         TQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777467884; x=1778072684;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dG3vv118uAikoQ8DAdJIrTS307cS6CSisA18Twdwdyg=;
        b=o0+PHk7ccgTu0WqWAXmZL95b6SCx3/mn6FzNSp+WSNOOkRnx98P1F/D/VOE/fvM6o8
         v71HTuZQn98TlkznrqRxv4ct4wdu5drR26TY+Xetvk8UHSBC+qk8cJ2pFnzL21zOCygr
         T+fh+qwfLUgN8/XP5t6OQoctrysPUPR0qwg42gbAM7hcMydZsOPUVPUeW9vdZoPozovV
         HWEBms3HwJWeyJBqRETS06qz3d/qDuN0JQ5HbNXsd+a14NO+MeKEi3KSFol3PUqyY/Ue
         G9e3HHK9MTrpMoroUNW7CNTRdt1d3mPl08i4lPoRMYEdm+pm5C7zwBnQZOk1ieMpI2CJ
         FbmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SI1MSTv4aTIugs9pBmVJWLehUuFXpihOm3kjdP8PV1qm4q5VRgDixSViuUNkJ4AI51OBFEVJf7G3QTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcE06cuha73LCohvWE3AA2Xj47XF2qrvDkynUwNSErff2BXLAO
	aMj8zPCpOjsk5pmDhVEyVIVBwnOgXNBALj3Usp2Fla6NWFYUzTpUNGcY
X-Gm-Gg: AeBDieukKbBzIE+iR+/AJeuTTA9HQJBNJCf9w5V990G9bAVr3C6ZuxB4EJChxv5m9KS
	EteXixKn8vmUYM/PpDUdnWkW4gRZd4ZAu66lWkgXJZbA/wkiuGOneyVtRPhzl9IJKGExlJKhKOn
	WscN4Ls719cCTtTZLZ8lDmB9WQs3+Hn157uA0W0jV2IK/rlMkiGx6rhd9f0yCI59Oy2NwkJNUI3
	gtsO/SjbSHODLaSRP3Bo5ZLzT56WGoEVOBulh0D9lNMu7GQtb59c0LYyjMAKDXjj1V6+ofXmk5J
	Cpu61FvhWLl4Bn2BozBSh8Z0XkhsvzBFCTZS8tZmdhPRGt5Wwvx/HcfjBbsQlvSfNn51WBqs76K
	AUYK1XzGsRBw7ROsZRd6QDk3MC7EfvItYngJkJn2DJPodcx1TdGqh6qcqz6ak49C/IFQWaiZeLn
	JimYWLbyi3v64r+gNuQoAaATlJsqPOorLZONMDsInBBo2JJgntjKBnxBWoFRtC9OiFlpAtuZSIr
	3R1TPF8bHYl
X-Received: by 2002:a05:693c:3018:b0:2dd:db16:478e with SMTP id 5a478bee46e88-2ed1977df07mr1864099eec.10.1777467883726;
        Wed, 29 Apr 2026 06:04:43 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1c070523sm2093806eec.19.2026.04.29.06.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 06:04:43 -0700 (PDT)
Message-ID: <f2636cc2-4e49-4a20-bc68-54c6ed830ecd@gmail.com>
Date: Wed, 29 Apr 2026 10:04:38 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: ac97: drop stale CMI9738 PCM-volume quirk
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260429-ac97-cmi9738-pcm-volume-v1-1-d3f90cc00604@gmail.com>
 <87h5ouos8m.wl-tiwai@suse.de>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <87h5ouos8m.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p0GITUeVMg0bwkw1oimDtb2h"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------p0GITUeVMg0bwkw1oimDtb2h
Content-Type: multipart/mixed; boundary="------------vP7ADpzMsjtDFwv0PTyOtC0m";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <f2636cc2-4e49-4a20-bc68-54c6ed830ecd@gmail.com>
Subject: Re: [PATCH] ALSA: ac97: drop stale CMI9738 PCM-volume quirk
References: <20260429-ac97-cmi9738-pcm-volume-v1-1-d3f90cc00604@gmail.com>
 <87h5ouos8m.wl-tiwai@suse.de>
In-Reply-To: <87h5ouos8m.wl-tiwai@suse.de>
Autocrypt-Gossip: addr=perex@perex.cz; keydata=
 xsFNBFvNeCsBEACUu2ZgwoGXmVFGukNPWjA68/7eMWI7AvNHpekSGv3z42Iy4DGZabs2Jtvk
 ZeWulJmMOh9ktP9rVWYKL9H54gH5LSdxjYYTQpSCPzM37nisJaksC8XCwD4yTDR+VFCtB5z/
 E7U0qujGhU5jDTne3dZpVv1QnYHlVHk4noKxLjvEQIdJWzsF6e2EMp4SLG/OXhdC9ZeNt5IU
 HQpcKgyIOUdq+44B4VCzAMniaNLKNAZkTQ6Hc0sz0jXdq+8ZpaoPEgLlt7IlztT/MUcH3ABD
 LwcFvCsuPLLmiczk6/38iIjqMtrN7/gP8nvZuvCValLyzlArtbHFH8v7qO8o/5KXX62acCZ4
 aHXaUHk7ahr15VbOsaqUIFfNxpthxYFuWDu9u0lhvEef5tDWb/FX+TOa8iSLjNoe69vMCj1F
 srZ9x2gjbqS2NgGfpQPwwoBxG0YRf6ierZK3I6A15N0RY5/KSFCQvJOX0aW8TztisbmJvX54
 GNGzWurrztj690XLp/clewmfIUS3CYFqKLErT4761BpiK5XWUB4oxYVwc+L8btk1GOCOBVsp
 4xAVD2m7M+9YKitNiYM4RtFiXwqfLk1uUTEvsaFkC1vu3C9aVDn3KQrZ9M8MBh/f2c8VcKbN
 njxs6x6tOdF5IhUc2E+janDLPZIfWDjYJ6syHadicPiATruKvwARAQABzSBKYXJvc2xhdiBL
 eXNlbGEgPHBlcmV4QHBlcmV4LmN6PsLBjgQTAQgAOBYhBF7f7LZepM3UTvmsRTCsxHw/elMJ
 BQJbzXgrAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEDCsxHw/elMJDGAP/ReIRiRw
 lSzijpsGF/AslLEljncG5tvb/xHwCxK5JawIpViwwyJss06/IAvdY5vn5AdfUfCl2J+OakaR
 VM/hdHjCYNu4bdBYZQBmEiKsPccZG2YFDRudEmiaoaJ1e8ZsiA3rSf4SiWWsbcBOYHr/unTf
 4KQsdUHzPUt8Ffi9HrAFzI2wjjiyV5yUGp3x58ZypAIMcKFtA1aDwhA6YmQ6lb8/bC0LTC6l
 cAAS1tj7YF5nFfXsodCOKK5rKf5/QOF0OCD2Gy+mGLNQnq6S+kD+ujQfOLaUHeyfcNBEBxda
 nZID7gzd65bHUMAeWttZr3m5ESrlt2SaNBddbN7NVpVa/292cuwDCLw2j+fAZbiVOYyqMSY4
 LaNqmfa0wJAv30BMKeRAovozJy62j0AnntqrvtDqqvuXgYirj2BEDxx0OhZVqlI8o5qB6rA5
 Pfp2xKRE8Fw3mASYRDNad08JDhJgsR/N5JDGbh4+6sznOA5J63TJ+vCFGM37M5WXInrZJBM3
 ABicmpClXn42zX3Gdf/GMM3SQBrIriBtB9iEHQcRG/F+kkGOY4QDi4BZxo45KraANGmCkDk0
 +xLZVfWh8YOBep+x2Sf83up5IMmIZAtYnxr77VlMYHDWjnpFnfuja+fcnkuzvvy7AHJZUO1A
 aKexwcBjfTxtlX4BiNoK+MgrjYywzsFNBFvNeCsBEACb8FXFMOw1g+IGVicWVB+9AvOLOhqI
 FMhUuDWmlsnT8B/aLxcRVUTXoNgJpt0y0SpWD3eEJOkqjHuvHfk+VhKWDsg6vlNUmF1Ttvob
 18rce0UH1s+wlE8YX8zFgODbtRx8h/BpykwnuWNTiotu9itlE83yOUbv/kHOPUz4Ul1+LoCf
 V2xXssYSEnNr+uUG6/xPnaTvKj+pC7YCl38Jd5PgxsP3omW2Pi9T3rDO6cztu6VvR9/vlQ8Z
 t0p+eeiGqQV3I+7k+S0J6TxMEHI8xmfYFcaVDlKeA5asxkqu5PDZm3Dzgb0XmFbVeakI0be8
 +mS6s0Y4ATtn/D84PQo4bvYqTsqAAJkApEbHEIHPwRyaXjI7fq5BTXfUO+++UXlBCkiH8Sle
 2a8IGI1aBzuL7G9suORQUlBCxy+0H7ugr2uku1e0S/3LhdfAQRUAQm+K7NfSljtGuL8RjXWQ
 f3B6Vs7vo+17jOU7tzviahgeRTcYBss3e264RkL62zdZyyArbVbK7uIU6utvv0eYqG9cni+o
 z7CAe7vMbb5KfNOAJ16+znlOFTieKGyFQBtByHkhh86BQNQn77aESJRQdXvo5YCGX3BuRUaQ
 zydmrgwauQTSnIhgLZPv5pphuKOmkzvlCDX+tmaCrNdNc+0geSAXNe4CqYQlSnJv6odbrQlD
 Qotm9QARAQABwsF2BBgBCAAgFiEEXt/stl6kzdRO+axFMKzEfD96UwkFAlvNeCsCGwwACgkQ
 MKzEfD96Uwlkjg/+MZVS4M/vBbIkH3byGId/MWPy13QdDzBvV0WBqfnr6n99lf7tKKp85bpB
 y7KRAPtXu+9WBzbbIe42sxmWJtDFIeT0HJxPn64l9a1btPnaILblE1mrfZYAxIOMk3UZA3PH
 uFdyhQDJbDGi3LklDhsJFTAhBZI5xMSnqhaMmWCL99OWwfyJn2omp8R+lBfAJZR31vW6wzsj
 ssOvKIbgBpV/o3oGyAofIXPYzhY+jhWgOYtiPw9bknu748K+kK3fk0OeEG6doO4leB7LuWig
 dmLZkcLlJzSE6UhEwHZ8WREOMIGJnMF51WcF0A3JUeKpYYEvSJNDEm7dRtpb0x/Y5HIfrg5/
 qAKutAYPY7ClQLu5RHv5uqshiwyfGPaiE8Coyphvd5YbOlMm3mC/DbEstHG7zA89fN9gAzsJ
 0TFL5lNz1s/fo+//ktlG9H28EHD8WOwkpibsngpvY+FKUGfJgIxpmdXVOkiORWQpndWyRIqw
 k8vz1gDNeG7HOIh46GnKIrQiUXVzAuUvM5vI9YaW3YRNTcn3pguQRt+Tl9Y6G+j+yvuLL173
 m4zRUU6DOygmpQAVYSOJvKAJ07AhQGaWAAi5msM6BcTU4YGcpW7FHr6+xaFDlRHzf1lkvavX
 WoxP1IA1DFuBMeYMzfyi4qDWjXc+C51ZaQd39EulYMh+JVaWRoY=

--------------vP7ADpzMsjtDFwv0PTyOtC0m
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4/29/26 09:39, Takashi Iwai wrote:
> On Wed, 29 Apr 2026 14:05:31 +0200,
> C=C3=A1ssio Gabriel wrote:
>>
>> patch_cm9738() still carries an old comment claiming that CMI9738
>> has no PCM volume although AC97_PCM reacts, and then forces
>> AC97_HAS_NO_PCM_VOL.
>>
>> The CMI9738 datasheet documents register 0x18 as "PCM Out Vol"
>> with mute and left/right volume fields, so that old assumption is
>> not justified.
>=20
> Well, that's actually the part the FIXME points to.  Although the spec
> shows the register is available and the chip reads out, the volume
> didn't seem reacting properly on the real hardware, as far as I
> remember correctly.
>=20
> So, it's really doubtful whether it's safe to cut off this workaround
> just by reading the data sheet.

Yes, that matches what I suspected at first glance; I wanted to confirm
whether the datasheet was enough to revisit the old workaround.

> thanks,
>=20
> Takashi

--=20
Thanks,
C=C3=A1ssio


--------------vP7ADpzMsjtDFwv0PTyOtC0m--

--------------p0GITUeVMg0bwkw1oimDtb2h
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCafIB5gUDAAAAAAAKCRDQXT8aWv/ug5SX
AP0Yum7Eac5IXqFSoWIQT1OBuK37ilvy6DNOKqr+WZPikwEA7JNo3F6Jr6dPBUk3P2TxOwsrISBX
3CwIZThngFHnFAI=
=Oyxn
-----END PGP SIGNATURE-----

--------------p0GITUeVMg0bwkw1oimDtb2h--
