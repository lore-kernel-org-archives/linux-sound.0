Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C5D1552FD
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 19:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776281378; cv=none; b=STMl+ABS1mks+IosvIgkdVACjsdhcCb8ioVU85a1LoRSd5NiHKTRUhRkThSUqXThe04TO5rGnUxrSUnC7N+9zhZgZyq8Ev1MsbuyZkq8inlcjd+iidUQLzowUKPECK5+3uNgLk+N5Lruk7Od7G3CpoHP+WGiWCw5wad0E8TmF7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776281378; c=relaxed/simple;
	bh=OBDODn8f1ZgryApp5yMtDi3qMeFL/Q8L+JToagd007Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sbVgDjlJCq3LPWgzkMg4LkuYHj29VsvNPuwZlwUSRH/VRqwER0I2fC9BYx8l3a9zwU1l4IrLKsHSp0wqWjENZbf0eh/MYVjCrmql+YUGU14iXD3N/B8CYmtG9QsyycPV0rjBP1SPcX3ViPy1+qYlX08JxvjJ5VXi7v1LpXQIXhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pPRy/+wF; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPRy/+wF"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1271257ae53so15541459c88.1
        for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 12:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776281376; x=1776886176; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqO9SMlfG6aHaLHgvrTCVizzijukG25snbku+NlYz9s=;
        b=pPRy/+wF4eywdiypyDwQLGcv7GObBGxfHZ07nE1QHJDvQWd7qraxOdRT7eYE5gcNiH
         r35SbzPjToB1RoV4nuvfv74NAyH+sa2CBqajzDWq9Aopp4bJOoX+tB17fmUKOFoGtCGF
         dnkJbJ3Rp5WYJtbv19NnLNkl1aVtRrq+skJdgejO7x6DrOkVTzd/431bLERpTn37YnzK
         Fu5e0RhwQW069GSn+IUypGifV4jqORVbObE4ox9ojASPk/GpAv8AUg5yp6jBDcdbvaPo
         xaKKpKHhNC4huoLSnmkhVGUj4qmVEucNjQF38VS6KMOCj6LcaBDRZUP6BIsbug1RoW9B
         3k1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776281376; x=1776886176;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WqO9SMlfG6aHaLHgvrTCVizzijukG25snbku+NlYz9s=;
        b=fC4o7hvWFjjLQxpsW12azQIaTnXmXUR2FUufEIZ4Zoo0k+H8YQg2ohB0jkHVMBnrkb
         5ppu8UQluXUqYNnLqwVR8tkdwqObC9hzkePQ9MV40lG8mZ+J/Fze1rEl8eybZ33D3CMV
         o/L7dW+I5Nqc6y7UPig1AVy3xIj7h7sXq8AtUK3xkZy05LV1wWv94VQ6oou7XI69/roB
         cNry4wf8M6safGFES5aB0bcwybW4bMAY/W/cGPQI9yVMMfk+Q68o/B3EAvxa8qgPsEHH
         XQFz8vMLhN/20NwUGSRz9SNdhaTwM96oKjDqevuVXvoOQjBSBYjXhzWKIXdbDWdF7eBV
         iXtw==
X-Forwarded-Encrypted: i=1; AFNElJ9sdZrkvm3vmgFVYel0jdKhGMM//LYcbq38c14klUqex7bsHDtv3H1FUFVOtun/Ehhf38nP0ht5wZ8eiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMUDLcSHLyrIzzeyvpKd67fN+1jP+SRKKCTsxFv8dvc/BYixZm
	xny7ivWyg8ZBDNHNWoC0zUZ/H3pdSkjZlBwKYM5qnTRVOAlxPnSNFXgn
X-Gm-Gg: AeBDiettE1zNr37mUt90TryDsAO8oKUNimJq9MIJyXQ61l3tFOufrIpWjrW43zYUDoV
	iTiOD0XKta4VFLmB9dkmI9I5CF9Nid0fQ6QL0DGcdqpXvzGycAlg+9GJdwGRokTsjBK2phZrR55
	T0i39Y4ZETOH02RJzig24OBrUhg4yZtGz1Z4vTgv3SXlm/UlFkq3MQC09HwslUFiPne6RC0IZsb
	I54zGoDrfz78+A7E2kju+5nbA0OJKZTHWO+xrmMe3IaRqrz5jSwCEAkIvBQbV58uQ6CYJ8b5bXR
	b9zzLGksmpTi5/eQQ5gVGKGZM4DnVqXn4+GR7VgJQyPi95Bhp4oDeygNZmXV0Rg89dWvC3B74cz
	pMnW0kngu4AHtMTEQ0x29fi9jkXyrlIYM+coPYrDaqH25QyD/2NLJNRyC3/mx3NniXbAcXzLxjN
	tSapOPtraVhWfVERTf/3o2NTRnuuW4d6/RSU3rf97VYWkQOiazKFDcU6U80lf3U5s4GQbpyDVLV
	a8i
X-Received: by 2002:a05:7022:122:b0:11a:fec5:d005 with SMTP id a92af1059eb24-12c34e89780mr12735970c88.10.1776281376009;
        Wed, 15 Apr 2026 12:29:36 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e6a8778sm2982010c88.9.2026.04.15.12.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 12:29:35 -0700 (PDT)
Message-ID: <64413e7d-cd98-433a-90db-ad9f9854df56@gmail.com>
Date: Wed, 15 Apr 2026 16:29:31 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ALSA: compress: Propagate real pointer errors in
 avail paths
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260414-alsa-compress-pointer-avail-errors-v1-0-f5a1a8b1dfba@gmail.com>
 <20260414-alsa-compress-pointer-avail-errors-v1-2-f5a1a8b1dfba@gmail.com>
 <0340e472-b0a7-4bc7-bba8-a581784b8e3a@sirena.org.uk>
 <1720a3a0-2754-4f12-97b0-5304358e0e54@gmail.com>
 <87cy00fgp7.wl-tiwai@suse.de>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <87cy00fgp7.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Wr6L3YG8p7yb5radrSKZ3dZy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Wr6L3YG8p7yb5radrSKZ3dZy
Content-Type: multipart/mixed; boundary="------------hU9YshDR5OZNoKfnuQ94t9qA";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <64413e7d-cd98-433a-90db-ad9f9854df56@gmail.com>
Subject: Re: [PATCH 2/2] ALSA: compress: Propagate real pointer errors in
 avail paths
References: <20260414-alsa-compress-pointer-avail-errors-v1-0-f5a1a8b1dfba@gmail.com>
 <20260414-alsa-compress-pointer-avail-errors-v1-2-f5a1a8b1dfba@gmail.com>
 <0340e472-b0a7-4bc7-bba8-a581784b8e3a@sirena.org.uk>
 <1720a3a0-2754-4f12-97b0-5304358e0e54@gmail.com>
 <87cy00fgp7.wl-tiwai@suse.de>
In-Reply-To: <87cy00fgp7.wl-tiwai@suse.de>
Autocrypt-Gossip: addr=broonie@kernel.org; keydata=
 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

--------------hU9YshDR5OZNoKfnuQ94t9qA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 4/15/26 11:20, Takashi Iwai wrote:
> On Tue, 14 Apr 2026 19:45:52 +0200,
> C=C3=A1ssio Gabriel Monteiro Pires wrote:
>>
>> On 4/14/26 13:53, Mark Brown wrote:
>>> On Tue, Apr 14, 2026 at 01:47:54PM -0300, C=C3=A1ssio Gabriel wrote:
>>>
>>>> Commit 61327f3d817c ("ALSA: compress: Pay attention if drivers
>>>> error out retrieving pointers") made snd_compr_update_tstamp()
>>>> return driver pointer() failures, but snd_compr_calc_avail()
>>>> still ignores that status and continues with stale runtime
>>>> counters.
>>>
>>>> The fallback for an unsupported pointer callback remains
>>>> intentional, so keep ignoring -EOPNOTSUPP there. Propagate
>>>> real pointer-refresh failures instead.
>>>
>>>> -static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,=

>>>> -				   struct snd_compr_avail64 *avail)
>>>> +static int snd_compr_calc_avail(struct snd_compr_stream *stream,
>>>> +				struct snd_compr_avail64 *avail)
>>>>  {
>>>> +	int ret;
>>>> +
>>>>  	memset(avail, 0, sizeof(*avail));
>>>> -	snd_compr_update_tstamp(stream, &avail->tstamp);
>>>> -	/* Still need to return avail even if tstamp can't be filled in */=

>>>> +	ret =3D snd_compr_update_tstamp(stream, &avail->tstamp);
>>>> +	if (ret < 0 && ret !=3D -EOPNOTSUPP)
>>>> +		return ret;
>>>> +	/* Still need to return avail when no timestamp is available */
>>>
>>> It's not clear to me that the intent there is to only ignore in the c=
ase
>>> where we fail to update due to the operation not being supported rath=
er
>>> than to also ignore any other runtime errors we might encounter (eg, =
due
>>> to the stream configuration).
>>
>> Cool, thanks for replying!
>>
>> I rechecked the current tree, and the hard-failure class does exist:
>> wm_adsp_compr_pointer() can return -EIO and switch the stream to
>> XRUN when dsp->fatal_error, !buf, or buf->error, so that is a
>> real in-tree case where pointer() failure means the stream itself is
>> broken rather than timestamp data simply being unavailable.
>>
>> That said, I agree this does not fully justify the generic change as I=

>> sent it. In particular, SNDRV_COMPRESS_AVAIL and poll() both recheck
>> the stream state after the pointer refresh, and there are other driver=
s
>> such as SOF where pointer() can return -EBUSY for a not-ready case,
>> which is not the same class as the wm_adsp -EIO/XRUN path.
>>
>> I also agree that the current patch is too broad because it uses the r=
aw pointer()
>> errno as the policy boundary for avail handling, and that conflates ha=
rd
>> stream-failure cases such as wm_adsp's -EIO/XRUN transition with
>> other conditions like SOF's -EBUSY not-ready return. I can rework patc=
h
>> 2 so the behavior is based on a better-defined failure condition inste=
ad
>> of treating every non-EOPNOTSUPP return as fatal for avail.
>>
>> WDYT?
>=20
> IMO, keeping the behavior could be safer for now.
> The erroneous timestamp can be identified by zeros, at least.

That sounds right, I'll drop this change for now.

--=20
Thanks,
C=C3=A1ssio


--------------hU9YshDR5OZNoKfnuQ94t9qA--

--------------Wr6L3YG8p7yb5radrSKZ3dZy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCad/nGwUDAAAAAAAKCRDQXT8aWv/ug5/x
AQCHsO11o2u3eboMqjTk8eQ3NrqULb9XmHGOmxUQGZGCcQEAxLSgqban0e1cyLCGVoxqHmGN2Ldk
jhYmuAkTS100mQE=
=rlXx
-----END PGP SIGNATURE-----

--------------Wr6L3YG8p7yb5radrSKZ3dZy--
