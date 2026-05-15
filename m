Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00C03E0095
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 16:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778860963; cv=none; b=u+LxMjpP7GEkUUuER3ahiAM29dTQpTIs/9dLSoQ/odFWoi1xUIWbW4oDSt5tBpjhW2avSrp4mWqdhaT8ZxHzQsmfRm9WNDlFB/MOj+admPNd4deH/JYCrPaCN3pb7rviFQtlXgSitecSgbqQ5sTS0QYNiyTTyw4j596/OAWrwc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778860963; c=relaxed/simple;
	bh=JyGv54D5TTESaZtgZUvwiPYuZSMf0GHqQPQ8V5zwCeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GnqqhHyNTUZUZ0hjvrYYducMkZeFGkO6e6rhPHo8nOgkmxfI6nsYrXKMUspAjiNbN0GQXCTGewyy4S0h7hLq0SQNU8xupfb82tHBfEYacKrJHvArNbRD15hIAUXL5GoRmmlUA7hvYcmfbzqu6xDuGbYM+LBe+Zsz4E+S98YD18E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tKqiCYSA; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tKqiCYSA"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f68f3b075fso14298326eec.0
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 09:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778860961; x=1779465761; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyGv54D5TTESaZtgZUvwiPYuZSMf0GHqQPQ8V5zwCeo=;
        b=tKqiCYSArxoqB0leUiy3xqrd+elE9TjNy+cP34/1gL1leWRUZhEBVsO+uh0MW19Y3w
         Yp7g7h5FkQiAT+LXTFCaWtX2UJNX/I6XKpmCR09GnyCYIaLjT6kkGFScBV5jQ6bIyh3R
         IC0oUsJ6fYLOnmYPNUCB0T0ME1VJPYoOmI/RsVVFfhvvS17PE4qp19i6LfUmQPwytQ+/
         lyOJYhNrtdZ4TZrvP6jnFxCdLXMLChIbxdCSKF2We7yJKUc4RE7GhKbekOuHDDkv530m
         KkhGK3sVbJsEIYATysWhSVi9ZoH80w81cKDflOXb1rZQHqI3e4r7YHkH4kDrEssCjMlk
         bW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778860961; x=1779465761;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JyGv54D5TTESaZtgZUvwiPYuZSMf0GHqQPQ8V5zwCeo=;
        b=LU7lj94N5nREIA6YoyGnquPpbsHc9jQMh8jWVMJRPCPI1KU58IfEaLKACeGzhBS8UB
         BhOWhIcJXf/+js7AAtPqjuFUJMvAFdSdnl/Ah31MyICDo3/UBg2SjlxKE1yNPUSwiTxl
         p9Oi+Udc6XJd7xjrtSuDOACfrTKUPKswgZXQQ9Ds/YLYvemuzqJYyu+j8XMtnvIqW0vi
         o4SYT9YVtiCgET6ItjwMQp96IwiHHJd7B33UhKNUV75L00opyEYOl33gX6s9qdBrE/ya
         HaXsO6zT0a8NOZ/aIGbdQK1Gtc56pugULPWdNa6vk7oi++GeV2ZWBrG1eAkeGNQBcbQo
         SG3w==
X-Forwarded-Encrypted: i=1; AFNElJ9VlJBMLSPuvF8ooF/BCz+MU/fvwIcC39DQqrl84d4I0RO5muGSNUll6FVUC4V+B1UJSPAfqFJQK57Wyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAuRkK/+ogpgdtCMVCw7wL47tcIIHxzUl4oVzGfELD7UdRQydR
	NctAztU1FAddlEYdMoNjCkWrWg0O63LfcCyMjxKj4URZIK9Z3L3Qayd5
X-Gm-Gg: Acq92OHYvqC0TWza63AaK3QNIy8167r54iW5o/UZBemNjMUBj6iiDafSHX6Pz/iGzdq
	4QRnIq9TOZru3hs+jqpp0aUFLQzjHe6RkPb95kv6mvIvqzvNyaL6E6slN9nevUYRxzdEccJ6yG0
	604cZCB4Zjb3hUP3VL16ACQAYQnM/e11ZfyQd51vfzgtcA1w042SWr9+JR7inn1/mKH2o3aE30Z
	fX1bt8NlOc/e3Dpyksx3KPb0lTFit4GadruF6jn8Ng7l5v5cNaXmQ2DvY+/F5bPB3vTcnUl8/h8
	BPRmCr2bBZCxtbdV0OVMk+peR8qYwVPyyzJdNkAOOR+mbHElpv7mPegeny6QdlmIAs/pSl7v8vE
	kWbz5TboAUHfYVinE6RJyHVGIK9d4nZNoeH7AkzUQ/jJAfR3qVtSyHn+ERN7NpVSMnkw9Lo8tUc
	yBeivAXmdK+TkUjCUhIyGU1xvIe+KZyiA2F9dNggdV2fy/02+dCj9orDdX1zSObHFyDDmeU++wP
	w==
X-Received: by 2002:a05:7300:a145:b0:2d9:6373:ad22 with SMTP id 5a478bee46e88-30398172c1emr2498954eec.12.1778860960345;
        Fri, 15 May 2026 09:02:40 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcc458sm8803477eec.18.2026.05.15.09.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 09:02:39 -0700 (PDT)
Message-ID: <3761688d-4964-42cd-a1a7-72fb95154efa@gmail.com>
Date: Fri, 15 May 2026 13:02:34 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] ALSA: hda/cs35l41: Fix firmware load work teardown
To: Takashi Iwai <tiwai@suse.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: "Stefan Binding (Opensource)" <sbinding@opensource.cirrus.com>,
 'David Rhodes' <david.rhodes@cirrus.com>,
 'Richard Fitzgerald' <rf@opensource.cirrus.com>,
 'Takashi Iwai' <tiwai@suse.com>,
 'Vitaly Rodionov' <vitalyr@opensource.cirrus.com>,
 'Jaroslav Kysela' <perex@perex.cz>, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260511-alsa-hda-cs35l41-fw-work-teardown-v1-1-1184e9bc4f25@gmail.com>
 <agbxffucE1h67TRI@opensource.cirrus.com>
 <002f01dce47c$a7859760$f690c620$@opensource.cirrus.com>
 <agdAlJek88n6K53H@opensource.cirrus.com> <878q9ksm37.wl-tiwai@suse.de>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <878q9ksm37.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------P03C5TJIek002OBwqw9pmNXh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------P03C5TJIek002OBwqw9pmNXh
Content-Type: multipart/mixed; boundary="------------AW6hUK2TkIG00rSxRSt4nzC0";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: "Stefan Binding (Opensource)" <sbinding@opensource.cirrus.com>,
 'David Rhodes' <david.rhodes@cirrus.com>,
 'Richard Fitzgerald' <rf@opensource.cirrus.com>,
 'Takashi Iwai' <tiwai@suse.com>,
 'Vitaly Rodionov' <vitalyr@opensource.cirrus.com>,
 'Jaroslav Kysela' <perex@perex.cz>, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Message-ID: <3761688d-4964-42cd-a1a7-72fb95154efa@gmail.com>
Subject: Re: [PATCH RESEND] ALSA: hda/cs35l41: Fix firmware load work teardown
References: <20260511-alsa-hda-cs35l41-fw-work-teardown-v1-1-1184e9bc4f25@gmail.com>
 <agbxffucE1h67TRI@opensource.cirrus.com>
 <002f01dce47c$a7859760$f690c620$@opensource.cirrus.com>
 <agdAlJek88n6K53H@opensource.cirrus.com> <878q9ksm37.wl-tiwai@suse.de>
In-Reply-To: <878q9ksm37.wl-tiwai@suse.de>
Autocrypt-Gossip: addr=perex@perex.cz; keydata=
 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

--------------AW6hUK2TkIG00rSxRSt4nzC0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5/15/26 12:56, Takashi Iwai wrote:
> On Fri, 15 May 2026 17:49:40 +0200,
> Charles Keepax wrote:
>>
>> On Fri, May 15, 2026 at 04:08:14PM +0100, Stefan Binding (Opensource) =
wrote:
>>>> -----Original Message-----
>>>>
>>>> @Stefan, could you also please have a look.
>>>
>>> I think this is fine to do, and I did some tests to make sure it does=
n=C2=92t
>>> break anything.
>>> Reviewed-by: Stefan Binding <sbinding@opensource.cirrus.com>
>>
>> If Stefan is happy so I am :-)
>=20
> OK, let's take it and see whether everything works.
>=20
> As this doesn't look like a particularly urgent fix, I apply to
> for-next branch for 7.2.

I appreciate everyone=E2=80=99s time and effort in reviewing this patch.

Thanks,
C=C3=A1ssio

--------------AW6hUK2TkIG00rSxRSt4nzC0--

--------------P03C5TJIek002OBwqw9pmNXh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCagdDmwUDAAAAAAAKCRDQXT8aWv/ug5N3
AP94a3w5lzGrPeqsrtOEnUEZn5AKIEOqGjeJCYyiGv+IGgD6A4ZDKN3UYdjFbK7eNCLyNvas/DaZ
GHT/hzxjWAwTywM=
=05mg
-----END PGP SIGNATURE-----

--------------P03C5TJIek002OBwqw9pmNXh--
