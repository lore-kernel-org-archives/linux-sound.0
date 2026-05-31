Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0748377EB8
	for <linux-sound@vger.kernel.org>; Sun, 31 May 2026 23:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780269944; cv=none; b=H1/RjOL34lQIcemnYjn1Ewt1d2z40yIYKbi9JDXyWsjmiM8OvLUuyMkY7JevRMWr0NNGxvcT0oKV282GMD7rfOhq1akR1VDqctjGy0rQJn1aYlONXZEg+msGv1BnMuO5cywJbl10mfzMY8yvWsZIPH6vZVowDWGml/Xo08Tu/LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780269944; c=relaxed/simple;
	bh=uTOjbQ7yVLSM84gQua3l8SnCmjEtPDVFBaaY8od+QWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NG5yr5HHO6NbHHCAHUuosERqq1AfzFoFt0Aa8JmwD7gxT/Grj9AucfSwKSG5xTHZHqLAphnfMaMjnegebKD0tGYfgVObdK1EpPkR2zFlZUKmLYgkzjvSXKuqxr66R+rPZSLh1BvGmRJ2NC3KHS77msELP7nfX5Pb2Sdnw16vT1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6eaEOd7; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6eaEOd7"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3045c195251so9864472eec.1
        for <linux-sound@vger.kernel.org>; Sun, 31 May 2026 16:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780269939; x=1780874739; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wsx6j3JKC4u4jIG+cnuIgCoHEb3TjOs3NngBd7xa2pI=;
        b=U6eaEOd7epLM02WgQFeMyapKmO9tsNcrIuOuO2aa6RyGSEW2ddat3k3CxRGsfZQJi1
         uPnXPagRsumtivF1Ig0QKTx+elg9rDbRv3yYerKz9bAsrjt6ZyVpe0FQOK0Zja7u3xeR
         T7koAkOO8Rqo6TwafDbdGtbkVf+NKxCiKvcJLvBE53mGvwKhFTnrpeaIynJClSkCHF/W
         3jBdnWIhUrocpqfz7z+P7n+6HgCjLcmO+BxNAnsSlPhyubB7zVIAYxxBE9WbBGl0c+31
         xa0QjJUbRjMl+cRKjtDxMJlWOXoKxFlooopV8YLkP95HPVIE0g0W6Z19d/FueF3zTvJ4
         2+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780269939; x=1780874739;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wsx6j3JKC4u4jIG+cnuIgCoHEb3TjOs3NngBd7xa2pI=;
        b=QJ1vUOrYDKrQHYSjfR3ybOTU7sUmtV0Desy+DfqiMRomihHjxvigm6RcvNIPbPKEiK
         Emgw0eeK5BtrmHdi8lv9VJ52LEH9xkyA5D2p3i3ZD354kP56I8RTY/eJbPAu7bAH4j2L
         sl3rBLvuzME7FhNRABINU0maNrrGTJaVWz8qEU3NoG3VIBFmFMhbxCVaWTGa1apz4OjT
         WvDLmQ4IILcFXP6E85rGqrb0TdwpvPS5ecdkZeQu3C1mOishoXb8uztdC29ydXGanLEv
         qeUxMChvOyU3/shtIWIuELfaK5yLOpL/Nj1mcgnmt+fOjqYJusSewv/jQbf1DDt7zj8N
         uLUg==
X-Forwarded-Encrypted: i=1; AFNElJ9+9uTFijM23tRZZZzqTJ8eRvGxp8oIU+uTuI5aJrY9t2NMGAqxmZhNkU3mLeZpgcTOFE9HxocPJ/iW/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMflnOogN1tKb+rQ8c8jFaY812ppqm7AMSt8jqk49BgIS2E8zG
	oebnY4uw+4YlKHXXzYcRzzWGtJtA+tynY4EG1KPMj4MMU0KrrtNo7c0E
X-Gm-Gg: Acq92OHBPhEaErX8YAbKKeyfMrcFChx0bzvdsxOD0ixITeqHfq2S5J9VZ4o7yxvkVr2
	SXa+oCkxJnBGzMPDPhKYnGOyiYFkiTbpDyVsNtTj4BfNF+TMQyG3ypu76r5X/a7UAT+38IfEnqI
	sye4+Lhm57dhZYiFSitWEwsdLj//3UmrK3tQIb4wLDi+KuXUBZN87bWBSQ1MG0dq9QK+b5mdlmc
	uUuXPW26NOdpDunse/YsxoUczovrhLtcc2z0TysMD8FbA0LcN2paX8PLosc2azhPrDgnCF/j5/M
	qr+EPENyNfx4ka67GCh+7zok1WZQawmDQK1f6ZVhvkAwJsfkOHHN8dg+CVqIpvuKTRQV70LklSu
	05IhZOlV6m+wQdxc2ADrCGKCzSoDeRrV9eUbDfm5iyCpDMU/otQy4ZDx9Egvy8tU9X2mxQkG9dd
	KG7z97dvHbr+/yalNmFlrRFYl9yr48ORK7uiawn6L0HcDCiUeohUcytsPtgElvjFG4E3l9gZezQ
	SyOL5D+CJU7
X-Received: by 2002:a05:7300:e683:b0:304:d8e2:3c4d with SMTP id 5a478bee46e88-304fa61a258mr3346444eec.25.1780269939294;
        Sun, 31 May 2026 16:25:39 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5a9d27sm7315561eec.25.2026.05.31.16.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 16:25:38 -0700 (PDT)
Message-ID: <d90f4c6f-8b09-41a3-9d80-bfa0b0a411c2@gmail.com>
Date: Sun, 31 May 2026 20:25:35 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: seq: Use flexible array for device arguments
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, notify@kernel.org
References: <20260529-alsa-seq-flex-args-v1-1-bb3ff5c62d49@gmail.com>
 <871perpujb.wl-tiwai@suse.de>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <871perpujb.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------049zIao8DuoP3DSZV0OYtvMV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------049zIao8DuoP3DSZV0OYtvMV
Content-Type: multipart/mixed; boundary="------------qGH6wHWtj2aQrikTakDqTzs3";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, notify@kernel.org
Message-ID: <d90f4c6f-8b09-41a3-9d80-bfa0b0a411c2@gmail.com>
Subject: Re: [PATCH] ALSA: seq: Use flexible array for device arguments
References: <20260529-alsa-seq-flex-args-v1-1-bb3ff5c62d49@gmail.com>
 <871perpujb.wl-tiwai@suse.de>
In-Reply-To: <871perpujb.wl-tiwai@suse.de>
Autocrypt-Gossip: addr=perex@perex.cz; keydata=
 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

--------------qGH6wHWtj2aQrikTakDqTzs3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5/31/26 10:39, Takashi Iwai wrote:
>> diff --git a/sound/core/seq_device.c b/sound/core/seq_device.c
>> index 1b062d6b17ea..a7b69ff07261 100644
>> --- a/sound/core/seq_device.c
>> +++ b/sound/core/seq_device.c
>> @@ -234,7 +234,10 @@ int snd_seq_device_new(struct snd_card *card, int=
 device, const char *id,
>>  	if (snd_BUG_ON(!id))
>>  		return -EINVAL;
>> =20
>> -	dev =3D kzalloc(sizeof(*dev) + argsize, GFP_KERNEL);
>> +	if (argsize < 0)
>> +		return -EINVAL;
>> +
>> +	dev =3D kzalloc(struct_size(dev, args, argsize), GFP_KERNEL);
>>  	if (!dev)
>>  		return -ENOMEM;
>=20
> IIRC, we can use kzalloc_flex() for this kind, too:
>=20
> 	dev =3D kzalloc_flex(*dev, args, argsize);

Thanks, I missed kzalloc_flex(). I=E2=80=99ll keep the negative
argsize check in v2, so invalid callers get -EINVAL before
the count is converted to size_t.

--=20
Thanks,
C=C3=A1ssio

--------------qGH6wHWtj2aQrikTakDqTzs3--

--------------049zIao8DuoP3DSZV0OYtvMV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCahzDbwUDAAAAAAAKCRDQXT8aWv/ug+Qw
AQCaX5JaCnT1CEQdeXyaSZG2awgxnQWe1o6DQRe8sleWdwD9Fu8mcQSX12uIB8LB9bIARKUJEUSK
51XbGBKq1DNQOQA=
=mxY6
-----END PGP SIGNATURE-----

--------------049zIao8DuoP3DSZV0OYtvMV--
