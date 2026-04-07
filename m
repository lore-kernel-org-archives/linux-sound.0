Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D292274B28
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572777; cv=none; b=cC4lsE5/HSykeFCSmvRBx/ZukYchlILjNS8qTYmcACp2y16SoShTBYvPCyqczQbySNeoGwKIJomJmMkWcfciGTUGjwXNfQMiXzxyQuOgBiwSQ/d9hsl3elQLIQO3Esb+VDvwOLzFSmguKjUPnYZ4wsEJ6Q8BCI5NmyFHAfpZbcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572777; c=relaxed/simple;
	bh=Z1Xf70YSDdyq7WdOK2usVKwrCrjA2rwAToV9NSC0i3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S4jkqlGJ10k50F8F6xqBvYmF6ujnBP811OpMjdh1BhPghZoLPDNnLkb/G+CiCicthp+GOYQa/c+56c/Ud7iHtYbh9eaGX4adCvpEZTR4+eQh4xwd8Pt10IKpMI2VIj/DHA0W44sWMMCJjlTmICPccGf+kkZ3nqayUvQr8vG8lK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mw53bBPF; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mw53bBPF"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c15849aa2cso6801826eec.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 07:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775572776; x=1776177576; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9d1ttTDYZQwFcjsb48TykRH2ja2RI1VLyTVwU1CMJM=;
        b=Mw53bBPF9O1n8K3ALuHaMUbYV4IBCdhzbHwfYXkOX6b+qnkhSNmodKoIyhjgUtbEou
         H9alm87SYwYiamh9qesAmo5HKjf9xD4A8jJ/JlrYqGGNsFuyqhZL1H4sxI3Q/byXJPLY
         uk6vzS7MCVtkAIXEWRLO4iUyKtIaAnx4KYRDlPaTO1mpNBA899Jy6zeamSc+n+rVahFE
         gY0NRzmBJolqeowMP2Sa4LCMJRs5hs5LArHaTKh4NM1PeiCEYxP81n63040aJ1KAI07N
         yeSL/AaDvisSUHnKLgDxt5Rejxum4idmfPWF7yl+UYwqCWE6afKAGoKYO8hzeC8oVdpI
         WjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775572776; x=1776177576;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k9d1ttTDYZQwFcjsb48TykRH2ja2RI1VLyTVwU1CMJM=;
        b=bVQWZ99oc1A1tXz+pz7+z+zmHowYizIJENHwSXc0bLe5Wkh/ERjSeGL4i+qgkMFbCA
         Vep/RNKiQBTn3yicDBtfzQoWu37NtjUFlmOO7whflVuGP1scFPpjsRHlOtfYeAe4sqcd
         y/ATZuOsvMSZATspLFBtL6iLhGT2IzaGeq6dGvXOhnopqdiH3sbAr7SuyBuW0oivVHvV
         KYsQnOVUlMtD2kJkmpYuNWe1sDGzl9ieMm733vydVRUzffbk5nQe3z9tmT9wrmvc4SFo
         izYrJw7QlWizL411pXyW2mpXPILOVTB3iDV70x1UpJ/ReQxP+0S/TLrnz8VNQtRPz+Z7
         Kkfg==
X-Forwarded-Encrypted: i=1; AJvYcCXFMgu7EVptK3jLUTHiJvrk3C2B9n2PSc6KaxcJ/WP0dHpnLkLiGY6b+jpeY5jcD5LVsFe5hDp61A+Wtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxZr52cZyN+Uldi8iyoCH0zQiGCq/OjTvEurlvfu1yLns3cgHm
	GB6kJpRl7d7QIm6eO5JAuSBOt/5YqfBI+8oj8fSN7VIN5Z9VOG3e4kCW
X-Gm-Gg: AeBDiev8kb6SEEVnK2vgsBwaM3o2mepbsuePOkxDMzzsUj1bS0OB3kZSk4xeecHj8zO
	AxIznAC46zqkeEJ33IObpApRs6STxyRYIULoJWlj9nTgouwoJBIoIc8V1Mx8HN/FMbkr5HlSrYr
	esGKMOkeXb/5axQMwqqG4JDhYQk91TuwAqOQSSKH2hNkecWNW8IShvKTH0dus7PxEKQFCnd4smq
	e0CV+Eac/bzNz8zygZitB2QP/IH9Qk86xr/7rfjHox9g8v2lCUHZh2GCn1/Jhu2XHOin6pTjmOO
	IiaXC3dmp5CygHw/arkiqsG8OHkFvBQUWlYbazCUVbqPtzix/SOggueG/ij4LQqenZkH/yLiN8F
	k84yVaL5S+8MVje98+Op9cYD43wh36X8htF93NkB2pxTIFWce3MSAIdilCgXWq1EjEL/0rkorQ7
	i2GzjUmcpKwQ4/RlSuNKonM9+8x8x3AeJ4RW54dHX9pj+nz9ZdCmwmb9i/Vkllfv+8EZ6C8LYfz
	6gF
X-Received: by 2002:a05:7300:a287:b0:2c1:74ad:2cd7 with SMTP id 5a478bee46e88-2cbfbf760c4mr7952481eec.27.1775572775438;
        Tue, 07 Apr 2026 07:39:35 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d16d115c00sm3463169eec.12.2026.04.07.07.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 07:39:34 -0700 (PDT)
Message-ID: <28143355-b02f-418e-b1ec-1551c497d416@gmail.com>
Date: Tue, 7 Apr 2026 11:39:30 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ALSA: tea6330t: add mixer state restore helper
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260406-alsa-interwave-pm-v1-0-6ffa6f317c8f@gmail.com>
 <20260406-alsa-interwave-pm-v1-1-6ffa6f317c8f@gmail.com>
 <87tstnm1bp.wl-tiwai@suse.de>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <87tstnm1bp.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------84WCao7fKof4TSSDe6Ien0PI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------84WCao7fKof4TSSDe6Ien0PI
Content-Type: multipart/mixed; boundary="------------vZVPEhUw6ayXGNAyzD0dlEg3";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <28143355-b02f-418e-b1ec-1551c497d416@gmail.com>
Subject: Re: [PATCH 1/2] ALSA: tea6330t: add mixer state restore helper
References: <20260406-alsa-interwave-pm-v1-0-6ffa6f317c8f@gmail.com>
 <20260406-alsa-interwave-pm-v1-1-6ffa6f317c8f@gmail.com>
 <87tstnm1bp.wl-tiwai@suse.de>
In-Reply-To: <87tstnm1bp.wl-tiwai@suse.de>

--------------vZVPEhUw6ayXGNAyzD0dlEg3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4/7/26 08:55, Takashi Iwai wrote:
> On Tue, 07 Apr 2026 03:22:07 +0200,
> C=C3=A1ssio Gabriel wrote:
>> diff --git a/sound/i2c/tea6330t.c b/sound/i2c/tea6330t.c
>> index e8c50a036bea..3e413929d3ea 100644
>> --- a/sound/i2c/tea6330t.c
>> +++ b/sound/i2c/tea6330t.c
>> @@ -358,3 +358,36 @@ int snd_tea6330t_update_mixer(struct snd_card *ca=
rd,
>> =20
>>  EXPORT_SYMBOL(snd_tea6330t_detect);
>>  EXPORT_SYMBOL(snd_tea6330t_update_mixer);
>=20
> Oh we need a cleanup to put EXPORT_SYMBOL() after each function.
> (It should be a different patch, though.)

Right, I'll do it.
=20
>> +
>> +int snd_tea6330t_restore_mixer(struct snd_i2c_bus *bus)
>> +{
>> +	struct snd_i2c_device *device;
>> +	struct tea6330t *tea;
>> +	unsigned char bytes[7];
>> +	unsigned int idx;
>> +	int err;
>> +
>> +	if (!bus)
>> +		return -EINVAL;
>> +
>> +	list_for_each_entry(device, &bus->devices, list) {
>> +		if (device->addr !=3D TEA6330T_ADDR)
>> +			continue;
>> +
>> +		tea =3D device->private_data;
>> +		if (!tea)
>> +			return -EINVAL;
>> +
>> +		snd_i2c_lock(bus);
>> +		bytes[0] =3D TEA6330T_SADDR_VOLUME_LEFT;
>> +		for (idx =3D 0; idx < 6; idx++)
>> +			bytes[idx + 1] =3D tea->regs[idx];
>> +		err =3D snd_i2c_sendbytes(device, bytes, 7);
>> +		snd_i2c_unlock(bus);
>> +
>> +		return err < 0 ? err : 0;
>> +	}
>=20
> I think snd_i2c_lock() should cover the whole loop for the race at
> linked list traversal.=20

I'll fix in v2.

> thanks,
>=20
> Takashi

--=20
Thanks,
C=C3=A1ssio


--------------vZVPEhUw6ayXGNAyzD0dlEg3--

--------------84WCao7fKof4TSSDe6Ien0PI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCadUXIgUDAAAAAAAKCRDQXT8aWv/ug8kV
AP938f4DU7qLIvsshBaDykyvVZKAutH/s1BsfX0QTRElgwEA/P6D6V44rN9NDXMXZM94o+1YETpc
YgwTdBgb0iroqwc=
=UFlT
-----END PGP SIGNATURE-----

--------------84WCao7fKof4TSSDe6Ien0PI--
