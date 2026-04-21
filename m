Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19D8299A82
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773680; cv=none; b=jP5zJ0Biz9dKp4LJTCP9IbrTELO5tefLbKzo3c6w9Hp6XglgGVek001mEgk+NuYQUh36PsPfdDZJ5mZxIONHYwiwYUcFjUqV4m15hx9loSIimH5DkANScWKoIAMs8p9Yn6SM2WVlfzqu6VrL4gV/8FwcpW1Bt27ZU9veoF1cN44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773680; c=relaxed/simple;
	bh=Bv+R7Nlw0Py7FhxUwoX/vlCZjeMnCS+6Bzvx8OBVidc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DbGyqnU9FHfTBMH8itrN7XNZLaqvPkhi+nen+8IUB/3pdap9CH0rCH42k8iIQ5RBsdC9q9X1GxTjngwSSMFvI7EPc4tghIgeC+V05c3iFjOArq/ee6QDzICUzCn4s0cmKMAGXYJ1BF9aiYCYRXgAwGW7tXO2jt1Uew4N5jC1Nww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xrn/jb2/; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xrn/jb2/"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12db63c6df4so314791c88.1
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 05:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776773678; x=1777378478; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bv+R7Nlw0Py7FhxUwoX/vlCZjeMnCS+6Bzvx8OBVidc=;
        b=Xrn/jb2/yecwN+DBDoo3lImw2LpECH2vgFfJV3znJdetRdvS9PalD2A4h2Xbja54hQ
         BidHXxq8LtTATQoes1LKdD3j7ZKs9VfnuRIsGtuxjvwwiInFHFo4n2uutfKXdNUKqfDv
         eNdPyQU9/2UK0c4S9mvY6NFMpzAJINV7Olr7D0bclobmQfX4/gqpbJsYjexleVcevsGu
         EzvddQR00sSE1UcWJ0pQbEzdmVR6mNEr984GnmTvIDEF7j8oxIwVlDEk2eejMbunUUM7
         jxPi1E60HeJPzbRG9uVZUiFqxmH7odTOtNzRV4Q5umhFy7TipWx+Cf58jLclay1lBItb
         gObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773678; x=1777378478;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bv+R7Nlw0Py7FhxUwoX/vlCZjeMnCS+6Bzvx8OBVidc=;
        b=qkKBBhx+4HAUOOOL0i2b/TYRxmePy7s4LrrPq8dTMT4P1hcoehZEiAr/0vKFlNjdgv
         HkHXgAduEuQj2Y0hLhdh6NMEFA5rTwQ1Rk0dkXWstlQdIs1uuPdEmgbIkp3/xO608qbD
         ZjJD/SgzCz4CKfI3zAQlgyqwe1/PbXGas3bTiIbQTVj2bIL1ogofVJTEdyojit2MjvQ8
         kmslkMXGDQ02aUMv+0N9FKwTfh08YpbVo9U1lBBP5hzj/rwRpvUk3w2CZq3E+JFUnF/Q
         1DaemYCojT3d5GHYk60seqylnzbWSWviIhtVkjMJ0HNZE454kLIrRbHKYS/oEVT+aXcH
         WHuA==
X-Forwarded-Encrypted: i=1; AFNElJ+kM+eluSZf6s2x49+OGD0BDJQbMteg8s0DsrWJdGx/cfBbn1BdGCFFHs1KjXostYNIvhNHytc1q5kYKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1DXmJqTunJEwNZdk1rs8AxGIr8vQUzQsVzAxE/Yh9E8SWfjY8
	qCwyX0ZRJqhTdVOB8sZ8fa4rtk6K9fQeYhfyrasAmbmxH6sHUsIDoe3K
X-Gm-Gg: AeBDieurjNYpSao9IOMEGyWBee7SYnhLwsfkJ3M8GWeH/m/Z3HENNEmuC8Zz++aPCOZ
	gwAUjeDBjVO2xMgqlldDE/EFl5oePkhD8t7TuQjmKaiq05I+SjNcWPLOeFVxH1yYrX6NaW3LqCj
	HzPa68ELH7ZM6EUz3AhHtbQ9o44hkBiEVsl1A9pF1rds3+XFKVgPElYMlyMNZtuRhfg9gqdOS1P
	TcYhXg88Wp1P18m++4CS2ObvZDA1co6fVF1lqiqz+POhYTBlzPe+00V3gbm+HCXdiTuGB9OpMoG
	6fCo1wqMOxNXbSCYZ3axTZK8DzuR+DH/2ZIMwLhIv5q+fgcSIVmO/nlKzg3Av7nLOy/qL2HwW5E
	HwCmv3n4/9T8eGQ7lhSsEVcaIyPRAtsRQqcZuDQGAFgu3zVGthseOTQvb5cYHV//tjKSQUKzI4k
	OB00mPI2KtPSN4z0yA6z2b7Sy8KlUSGMgtqHi5ZPcAZA817t8WHTuXzpz0lHstuVY9+YizQDV4Y
	+u8RN5GQfnN
X-Received: by 2002:a05:7300:cd94:b0:2ea:4228:ab11 with SMTP id 5a478bee46e88-2ea4228ab6amr1691332eec.3.1776773677571;
        Tue, 21 Apr 2026 05:14:37 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa6134sm19204952eec.3.2026.04.21.05.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 05:14:36 -0700 (PDT)
Message-ID: <8168eb7f-2e07-4f77-9b3a-38ee25bfa9e5@gmail.com>
Date: Tue, 21 Apr 2026 09:14:31 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] usb-audio: fix mixer write failure handling
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Chris J Arges
 <chris.j.arges@canonical.com>, Detlef Urban <onkel@paraair.de>,
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260419-usb-write-error-propagation-v1-0-5a3bd4a673ae@gmail.com>
 <87v7dkag5r.wl-tiwai@suse.de>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <87v7dkag5r.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4wcrJbl104l9Fi56M44Fkzr0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4wcrJbl104l9Fi56M44Fkzr0
Content-Type: multipart/mixed; boundary="------------YQJlNMRd4p3DuOd5v6KIUDvX";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Chris J Arges
 <chris.j.arges@canonical.com>, Detlef Urban <onkel@paraair.de>,
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Message-ID: <8168eb7f-2e07-4f77-9b3a-38ee25bfa9e5@gmail.com>
Subject: Re: [PATCH 0/4] usb-audio: fix mixer write failure handling
References: <20260419-usb-write-error-propagation-v1-0-5a3bd4a673ae@gmail.com>
 <87v7dkag5r.wl-tiwai@suse.de>
In-Reply-To: <87v7dkag5r.wl-tiwai@suse.de>

--------------YQJlNMRd4p3DuOd5v6KIUDvX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4/21/26 05:09, Takashi Iwai wrote:
> On Sun, 19 Apr 2026 22:30:28 +0200,
> C=C3=A1ssio Gabriel wrote:
>>
>> This series fixes usb-audio mixer put() paths that currently report
>> success even when the underlying device write fails.
>>
>> The issue exists in the generic mixer core callbacks, the Scarlett
>> Gen1 enum path, and several Tascam US-16x08 put() callbacks.
>>
>> The US-16x08 EQ and compressor callbacks have an additional bug: they
>> update their software shadow state before sending the USB write, so a
>> failed transfer can leave later get() results out of sync with the
>> hardware state.
>>
>> The series is split into four patches:
>> - propagate write failures in the generic mixer core callbacks
>> - fix the Scarlett Gen1 enum callback
>> - propagate write failures in the simple US-16x08 put() callbacks
>> - commit the US-16x08 EQ and compressor shadow state only after a
>> successful write
>>
>> Successful writes are unchanged. Failed writes are now reported
>> correctly, and the US-16x08 shadow state remains coherent with the
>> hardware after write errors.
>>
>> Signed-off-by: C=C3=A1ssio Gabriel <cassiogabrielcontato@gmail.com>
>=20
> As this might influence on the actual device behavior significantly,
> and it's in a merge window, I postpone the series for 7.2.

Thanks for the feedback.
=20
> thanks,
>=20
> Takashi

--=20
Thanks,
C=C3=A1ssio


--------------YQJlNMRd4p3DuOd5v6KIUDvX--

--------------4wcrJbl104l9Fi56M44Fkzr0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCaedqJwUDAAAAAAAKCRDQXT8aWv/ug/qM
AQCavMbleHfa2Thh7teKJhptqTC7AULyPLDMHDF8+3CS4QEAyNEGvZdT930ozr8ywVtukBNoxadT
itI46VedOLyKPgw=
=C2ec
-----END PGP SIGNATURE-----

--------------4wcrJbl104l9Fi56M44Fkzr0--
