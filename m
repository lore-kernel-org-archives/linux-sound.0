Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAE340DFA8
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 00:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777855066; cv=none; b=MKE9ioreyiG6viwuKC397YhLrN9/0q+LFeFesYwB/bRLHfGC27+zaWuprf8+RecPVxqYO2XBffC6aAT6GjtJB+xbK/LXbY6Fo8ry+Z4xu9q8kATxtiocHmRXNWzeRmayMVtf+QSgjd20+xezLvMVb9qEUP6W+TZZ9GRGneD54qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777855066; c=relaxed/simple;
	bh=H7E9CZey6Rw8EVXE2+0c64omzuAXprGdc9wueYU2znk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g7Ohsb4VfjwkGyZ+I557HuOsiPPZXb8KVdoTlz6WAtnw8Bys29wus8lV7duZX8VJEtpPbKtCjK78xIydKrOx4n3gFytvSFu+Lt1QfG6wgAgcxoBSGsETw7AMgu+oCJ95YH7PrW4nb7Ui5QK6Q6SDKNDjKUEkKDTegp8EzguW1j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTkPrT+k; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTkPrT+k"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50d6ab4476eso36250531cf.2
        for <linux-sound@vger.kernel.org>; Sun, 03 May 2026 17:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777855064; x=1778459864; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdnMoWNmHx03CmSFG9JPS1az6zENVbaK4uztdJwFV3I=;
        b=UTkPrT+kJxfE345QNqd4gz1p7GiHjGM6+iy1Sx35YisXPj6ipPLzRU5wvxrmx9R12y
         uKMN6am1Rqsh/jtfOFKsopqZ60iiZQOvN+UrUxGNzi0OvFVYPOjlfgwX6i08z6A/1uNk
         KUx+HPA7HytUX4t1boEHOT6nsVljXqXiluUe85GxwAWXNVCEqp+/o2ia1BRfEQAd0Nu6
         eXJ81A28QKBedvH21llkrj7tkWbIvRjgPy+VDCQZu+IqUlEZcub7+jaQBSgimQ/foGXJ
         Zxn+HgUqi78bdxF0vFmUMKDaJTcSqq1e1SUszTZYBpayZyRQFlASeMOidkV+mYlKHdvn
         HfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777855064; x=1778459864;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SdnMoWNmHx03CmSFG9JPS1az6zENVbaK4uztdJwFV3I=;
        b=GRT+5H5vSG7HNJLUvrnDP/rPm6s9LNbNmantd5yfhri1wDCmlB4Hk3wCTzZGWO5KqW
         f+yQX4W8Kmtxa5b3AryYYcQqS6KNlA+z8T2HFVliV4Yh8x5w40rsd4ylaL8KC+HZ9wlY
         9HcL6OauZQ19qH+hid1xE6OeyHZjNHSvF2LYaUMoBOac1OvkuJPO9ZqAkgOcuHZTyNwb
         trnwyho+nMpuWyLTf5Dz8Xg4MdZM6225ZuozGslrFUrgR8jSRhmxaZUMTjaqe0kgqdZu
         SExaZI3EihapxBN8cxxNeuaFKI1k6+gXAoXQ9BN1YXHgVkqHv7N0yuypR7sbP6uK6iVK
         HrCw==
X-Gm-Message-State: AOJu0YztgpNaVKKTfxu7Ra/CZtuHoy8amdffPkTk39xNinWhJnFeGKjd
	YdnvOsK2ehM00kWbhA5ilvrmvY1ZoAj3mnZ8uGtYTJvqs5BQ9ogtZIsKIt82og==
X-Gm-Gg: AeBDiesghT/IPcURflcZfAu9OIGiS0tGQUaGazWsJdpaB+xIcSK1y6buXWDu3m9ZV15
	lQ3cp5qm/bEtoRYtjmrCvtie7gzUHzXyToyuN+nNSLyTDRL02fJxSColOlzl71L92mXtiXpVJhx
	cX4GLTH7IcT1UgMR5MDbceDwH2LI5jBx6lzJiiPJxE9VAewfXdaIwZq23jYNlTT80LPL4xFS+mK
	JRiqjdidk7VoRo7VsO0LyZZuZ22Jm8LBQtT0Y9WlJS0Yy2YPt5ZRgFg6NW0pf0kroeSwa9Z7hcn
	TFy5EIKdqq7aPZYVMBL1y4wjteGPL4Bc/7rb7w+p9pf+EYsWeEW/aHbttizggcclAacsiquWdMy
	rFAOrzpvRsjPmuOrP/8F0ZH6tNZhFa1zSNYGhjHn0DejlDfFGdTdsHNN/xUqwAb263A5cDB9lVy
	D8qFSY2cerJL3spWoWjlPTImHRIqGZAjLypUcN2nizUHcTHSk+CtdNuS4s9hJQBXLLZah6N6tG4
	XF/s8JzOIDy
X-Received: by 2002:ac8:7dce:0:b0:509:2455:2b53 with SMTP id d75a77b69052e-5104bf755a7mr117799901cf.49.1777855064170;
        Sun, 03 May 2026 17:37:44 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b353a3sm82395431cf.15.2026.05.03.17.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 17:37:43 -0700 (PDT)
Message-ID: <4435a0cf-8c3c-4b2b-baca-a980598abb9b@gmail.com>
Date: Sun, 3 May 2026 21:37:39 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: firewire-tascam: Do not drop unread control events
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux-sound@vger.kernel.org
References: <20260501-alsa-firewire-tascam-read-queue-v1-1-7baa4ba1a4de@gmail.com>
 <20260503112911.GA351328@sakamocchi.jp>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <20260503112911.GA351328@sakamocchi.jp>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AiquIXScSOB6UblUbODttMVT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AiquIXScSOB6UblUbODttMVT
Content-Type: multipart/mixed; boundary="------------DICcvek3KaftEFH3Mu3bzxOR";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux-sound@vger.kernel.org
Message-ID: <4435a0cf-8c3c-4b2b-baca-a980598abb9b@gmail.com>
Subject: Re: [PATCH] ALSA: firewire-tascam: Do not drop unread control events
References: <20260501-alsa-firewire-tascam-read-queue-v1-1-7baa4ba1a4de@gmail.com>
 <20260503112911.GA351328@sakamocchi.jp>
In-Reply-To: <20260503112911.GA351328@sakamocchi.jp>

--------------DICcvek3KaftEFH3Mu3bzxOR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5/3/26 08:29, Takashi Sakamoto wrote:
> Hi,
>=20
> On Fri, May 01, 2026 at 03:22:58PM -0300, C=C3=A1ssio Gabriel wrote:
>> tscm_hwdep_read_queue() copies as many queued control events as fit in=

>> the userspace buffer. When the buffer is smaller than the current
>> contiguous queue segment, length is rounded down to the number of byte=
s
>> that can be copied.
>>
>> However, after copying that shortened length, the code advances pull_p=
os
>> to tail_pos, marking the whole contiguous segment as consumed. Any eve=
nts
>> between the copied portion and tail_pos are lost.
>>
>> Advance pull_pos by the number of entries actually copied instead. Whe=
n
>> the whole segment fits, this is equivalent to the old tail_pos update;=

>> when the buffer is smaller, the remaining events stay queued for the n=
ext
>> read.
>>
>> Fixes: a8c0d13267a4 ("ALSA: firewire-tascam: notify events of change o=
f state for userspace applications")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: C=C3=A1ssio Gabriel <cassiogabrielcontato@gmail.com>
>> ---
>>  sound/firewire/tascam/tascam-hwdep.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> Thank you for catching the issue.
>=20
> I agree that this is indeed a bug. While your approach makes sense, I
> wonder if it could be simplified by updating tail_pos instead.
>=20
> Would you mind trying the following change?
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D 8< --------
> diff --git a/sound/firewire/tascam/tascam-hwdep.c b/sound/firewire/tasc=
am/tascam-hwdep.c
> index 867b4ea1096e..6270263e7bf4 100644
> --- a/sound/firewire/tascam/tascam-hwdep.c
> +++ b/sound/firewire/tascam/tascam-hwdep.c
> @@ -73,6 +73,7 @@ static long tscm_hwdep_read_queue(struct snd_tscm *ts=
cm, char __user *buf,
>                         length =3D rounddown(remained, sizeof(*entries)=
);
>                 if (length =3D=3D 0)
>                         break;
> +               tail_pos =3D head_pos + length / sizeof(*entries);
>=20
>                 spin_unlock_irq(&tscm->lock);
>                 if (copy_to_user(pos, &entries[head_pos], length))
> =3D=3D=3D=3D=3D=3D=3D=3D 8< --------
>=20
>=20
> Thanks
>=20
> Takashi Sakamoto

Hi,

Thank you for the suggestion.

I'll send a v2 patch.

--=20
Thanks,
C=C3=A1ssio


--------------DICcvek3KaftEFH3Mu3bzxOR--

--------------AiquIXScSOB6UblUbODttMVT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCaffqUwUDAAAAAAAKCRDQXT8aWv/ug6k7
AQCnifix0qCiVdN0vyG2sP1vdfZJQVBRoiVL/UdOBySzIQD9G+L9GNdoRYRPbsukcRjktnxW+ojG
nh81pEzPBWUJggE=
=Mz9K
-----END PGP SIGNATURE-----

--------------AiquIXScSOB6UblUbODttMVT--
