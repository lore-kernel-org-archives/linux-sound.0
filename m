Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CDC2D0C72
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 17:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776188759; cv=none; b=YTZ4CJvAuu+yG2TlxqfSMZS2YFEopeFo7zOhpZJCHyE8j+/DpqYcXwg01P7DY/t6vp93usQ+5WK9G9hAqCA88H3fF4vX2XcabmODtgpZ/QrdHfmxOmiUT9bfpGw7rpwRubG1D+MBmLq2Fjrw17mdIXSCYrrydY5qFgXJZ7Mm7xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776188759; c=relaxed/simple;
	bh=oTuHSrw31MiS5zexrcOcByZMm8xMNDq+rnLcknLuisA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=am3ZihlSeo6ZfxnIU9oaN4iZpv1kQP5JpsUcPqlAetFUwR/4N0WRvqtED+cEO3rRMzaJO8+8OIUhGgbsP8qjMp8cC3esRqXCsrzyL4ksmczdl7B8Fa3LBiTzsNtXtKWkueYYYcxn12zPLe/CmEl/eznQ62QG7QzH/PS8l2MZoZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpMWXUNG; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpMWXUNG"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c156c4a9efso8049594eec.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 10:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776188757; x=1776793557; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RLBC8r4qPbN0LJiGoOYZL8jOdMtxoCcjg2HECBqqPo=;
        b=DpMWXUNG0xAbbRnDTSWru7CbjOgDuFV7FIeOV9SK8SshxFA62abTP0DQ3seYfhvQuA
         3tGm1gEBK8fFNUXvPPRL3VUhz7HJ43cWc9e6F/O4Cc1+eruYHqowF+xodXhECgyv+6q7
         l5anRY+mBEwNcyyno87p+NWK7cNMBXjySgu12GGlgGvimFNbzeFvxnuKu+lM/K0X9if9
         AumrQ3wDs3odG11Se6/b0pK0nKYCC7klK2GjLsiIO3Iuw/VHwLbxFJAg1U6V85e7OLNw
         DtALvJk++IROzlAbM04Keqf8MCDvGAzxM9GZ/UAcbIQb414vdWfioCaQDoJRafWN/zaG
         Yqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776188757; x=1776793557;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3RLBC8r4qPbN0LJiGoOYZL8jOdMtxoCcjg2HECBqqPo=;
        b=O4jCvNgx98zn232LgWlM6rXLn2RGtNrdwogjBUWDP/eg5X0SN9uWrR8MNbEjoUXDg3
         m+EU3r7XGG2NUiC0cnXeRIwkW2V5/ucc5B8D8Hcz4n6M9bcL7DYRXM/ddZODH9cT83W2
         6AxoKXkIW9J7sLmz37cRftNK+Qv9zmxICjLwzo+qA24Z/IVCj7qrU0gxQIEbY99auaOu
         zRDOb4k8gSkmGUQrb7LMfBssPLuDCFN2/d2U+UxB3sT/kD6gZS+gNr/UzXs5RmSYZi1O
         D7DN8L1q5ZBhB4x68kAHlGkxujtPBX+JUmFTMRmPjGnLBo3KCLPOipdgwWiNP5fPKK6e
         E0Nw==
X-Forwarded-Encrypted: i=1; AFNElJ9nPS55spzAfmc/gLp0xmQz/anVqSWrahhxZH2yZ5k2WWcIzOdjkX5UeKPCtA40tCVMYcKL5Vc5ABz84w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmicb3aN8qGQ7HgHgSEdFPyE0OvnLzvNFondpM/rxz4fy+9I5o
	A/oeTAL40Fx7QZphsBIj6eKjPmYsQ3husYYn+w/4A33L6enktcKTKrdy
X-Gm-Gg: AeBDievyd00DMH2LqRfjzbW27XJNlpqVIxlVSvKAg+omiP6eqbfLDKwHUcpYDuWdMBD
	L8T+8g1OxoPrQLxPK0ds2JVcr9byAWoC5fOfr6SLxIFgQveFXSIlPNR5lKyfbdA+OCi5UhaAaIg
	s2Hnu2H/pFW7QqjvQTL3HvPDS42iJiv5Wk/Q3o1g+AAJQ7OXbbw1y8qPQrCPQvvdcPpYnQaly9W
	Al7Qn3rdgvyaJ9KT9GYbttFI1v/iNd6ya4tnHcfrZJX50QF5mrt5OyAPH7gpiOVx7HGMbYV59vo
	h0e2FEJLfnQCLwrJI211th/i29q2sRBZomX7NkwjmTNFKhrp0tEy49iflXwaeQZR1wlEbOiXZHH
	NwGkWjIHEvsZG7v9dJKFfMYxDv1UDxqstqaIXnKXA9fl2AohVKpT5brEUdrQzAk9kJUkX0oKU5S
	aI+gOrWuMvzC2YUd+ELLo3Bm5iNcDeMO3oz6FX/ct6xQ8Q9JAJDUstHp0p9nlm11NKzmT/JUqzg
	8I/
X-Received: by 2002:a05:7300:d704:b0:2b7:fdb6:ccf6 with SMTP id 5a478bee46e88-2d5890795cfmr10721481eec.14.1776188756851;
        Tue, 14 Apr 2026 10:45:56 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd2c09sm25655796eec.18.2026.04.14.10.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 10:45:56 -0700 (PDT)
Message-ID: <1720a3a0-2754-4f12-97b0-5304358e0e54@gmail.com>
Date: Tue, 14 Apr 2026 14:45:52 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ALSA: compress: Propagate real pointer errors in
 avail paths
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260414-alsa-compress-pointer-avail-errors-v1-0-f5a1a8b1dfba@gmail.com>
 <20260414-alsa-compress-pointer-avail-errors-v1-2-f5a1a8b1dfba@gmail.com>
 <0340e472-b0a7-4bc7-bba8-a581784b8e3a@sirena.org.uk>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <0340e472-b0a7-4bc7-bba8-a581784b8e3a@sirena.org.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------d7DUj61dvgdlCP1X06sAueRY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------d7DUj61dvgdlCP1X06sAueRY
Content-Type: multipart/mixed; boundary="------------4AIolL1cPxxqZFyJwZ29VJ0v";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <1720a3a0-2754-4f12-97b0-5304358e0e54@gmail.com>
Subject: Re: [PATCH 2/2] ALSA: compress: Propagate real pointer errors in
 avail paths
References: <20260414-alsa-compress-pointer-avail-errors-v1-0-f5a1a8b1dfba@gmail.com>
 <20260414-alsa-compress-pointer-avail-errors-v1-2-f5a1a8b1dfba@gmail.com>
 <0340e472-b0a7-4bc7-bba8-a581784b8e3a@sirena.org.uk>
In-Reply-To: <0340e472-b0a7-4bc7-bba8-a581784b8e3a@sirena.org.uk>
Autocrypt-Gossip: addr=broonie@kernel.org; keydata=
 xsFNBE6hyg0BEAC+NsL+ts5b4OUV1L2r4CdYohaOp5o8M8Jk6Tt9ZhoceA7zyM5+WrwQwOtI
 OpVPbg7q0dfumqCaEwfVa4bC5Z6W6AhVLaPxczPNeXRNDWSDZELTUTwTrZlA8X/PfanawGWZ
 iKZ54IBb2BEHCNOkZ+JiMxDBHFAI/KGCeZHCpTSPLVohLU4pjZfbSNg+lneRgXpDpHM5LVYA
 pZyC+zUtwQx1wQK+3SwW6PTvHyVIlD8LoyyEJQesacO/AQ960LUq7dhlP2wLJ66w/jCgTlGz
 i56CfaGZ7MFQJGUujfHqJZAmM/D6tQzqEUabujTNAd3sUyPEF0udgv9DYsbzCuzyzuE48kEf
 tQqNQI9sW2PPUC8B3nx9gTbjd0gia+6HDZw2zRaJPpSzC0eDUztHPX0aSTo4ff/GY9sHf/WT
 KrQDEwllhO1am5txVnTDcsMMBkBuPzvDcMuIgbNisSe7FKqw/j95bbxAF8MasVT4bQXk8uw1
 pVjt64u73PGdUWY5HmabSN8YDqZoIfHJvian5ViLJDiqtcSweuzHPhGjv8rhmCptdcZOdIOb
 3IIlBATcCVz5XyB66sqdIP7sdO4K7CqykqmJk8pYJAGLGyC63BWDsvTm8sqLLQynEAkd3lhV
 /kjKDnoTZp4UGa7jDaioRRZ2dDDO5j6nAKOQLhJX9TUHWJnEAQARAQABzR9NYXJrIEJyb3du
 IDxicm9vbmllQGtlcm5lbC5vcmc+wsGPBBMBCAA5AhsDAh4BAheABgsJCAcDAgUVCgkIAwUW
 AgMBABYhBD8laKrCaZj56BOhxcP0Nsow9djrBQJbiVJ7AAoJEMP0Nsow9djrkJIP/1laLEsW
 X1yvA3amfpsUntl9P7B1QTHECXVy4n9LXiSFbxKSBpI1oZkqAkMMJJZQYuqIt/AEPDV0cnEL
 x8UpJNGFOtyhciRn/oxzmTkkGPqmSq6VJtCrgm4O5iLnncG7hcSGAg+rQBTaxx6jhfullB8a
 2JLFnzFzHruMAE7xUOwPIQV0jTsBAEbVjPCvGh0am+BBksZk20VdjcsDsMdAgjwqRPOrZcpD
 d0SioFouENfQyyJE8Kq1WXQ7JzWKgRx5fe54EeLiSSmcnaWCFDwjWXZ5ha4o5gEKknXMF1Tf
 erL7lM9UA0vh+TNOW5qVcZJKeKqBGaKph7jzB2KsWooS1bN+CPLvjUBNo6G2yU5hWrM5TR/P
 aGxegJBisTTmltnsFbYXk6E3uEhm0IzQX+0Ray7J8jl0tG95Im8ar8tVs66ZgorvtkyxSRsW
 C6+PEulrExquI7lNStqd38TN46/Q4hFCfD5AhZsvAsr6WbPHCfszMHxCjKFMBrV7G29BOYuB
 H04beh3FHkte3FzjUCFEKJwUF9ePTXWQtZ5TKJALDDn/PxoFcRGzHqxYLdsn5DXWJRxwtqCM
 2wKAD5Iq6t1wjBeFElgUhY+SCMe74TNv+IJa80FDci8SYRGoMrcGl3MErCJ1iCtqR/WZx++v
 2GKsIO/CTT3e3bOtOGn4n+qtyKUVzsFNBE6hyg0BEACqbZLLPYnqPkQEyl1h67kDaeqm5gvu
 bjy9wvYx/La9l3+RZ28OYpDD3/U1grlpuv64RgUZQIbNDzU5o0zHWf1VO/yEEe3pHxpp2D64
 mfkCJ7TovGc8w6ftTBIhbZ2VRiCjTY8VtljD+2C9XCBDJRn+UbwKnbde+z5mkhBmcXSXe9cq
 MM5CKp2gNzaeeW+qN8aC7m6KYYq61pno1PWkg49gEcuH+cp2WIF9XefXqXee8y5Ed+KfvYIY
 V/FsZUpBVlIynAi7I0Cxd/cvRs2luCmK7HxOIpvc/BciNUVclHE2Yosuld9g/XuBd8ReMxqC
 StxHNIBUxyZgnGvLwxDgUPPaAl5MZkolY4Qy39gH/AOIqMdBDDpVBaeIe8TgNljcukXuG1Np
 SvI679LrI6F2Sn+oGyDyoEkuA5zdv+RB1jY6kIS7/x8e24iPsXiSC+Z4RCm/IAb+sSN7UToC
 B0bMu9zaLT/UWVduLk9Oe7pM1VvqLwahp43vePqnrDdMmsZN8VJteRuORxm2i3lKPJecbkze
 T6xvv7Q+tK6OTRV93USEIzFg6PSYjwVkaJccjlbMcer08/JaGfP9qBswy7Q7pMIqCr5G/Rpw
 PSeAX6zmrW6FaM/B2CBTI5bniPhnZX2egM0IWLnNKOw/l5fZMYCiod3l7ACtHYcNM3px1g5S
 H15UgwARAQABwsF2BBgBAgAJBQJOocoNAhsMACEJEMP0Nsow9djrFiEEPyVoqsJpmPnoE6HF
 w/Q2yjD12OuoHg//axAlkB2GR6kosrVPE9OIIf/e8kVTFlKE3DFVcTqgkg4ha8/hUpJodxQb
 hjgeI+/B2JxoA09lL+xs1DlC5iLxM3smIbw//6iytENpAcGbDJqFMPRCI4tCSRiDqVVyQb06
 vioNQiPv639MBA7D+UrPqtpGRYq4vaeQ6ww0A/fLrv8ELbZt/Icd9W93o+fhAGYjHRXV6y+g
 LJyC5AYgaZ6lGzHgONObXNbWx51BMxFSUvNo73q0XlgdOYmf4x64yS1CGmoBi+f/1kW2MpIt
 gDerIcY+XTIs1U+Z67RBHFqDtURjRhqw1RbJtSXRdOvBmvAHK5iemGFQF8IqrBT85Y+iShP5
 +2mb6FbmlnMxT6OYxOifUlqFBDd0kvxmh6SG/VKrHI1i9/GaLEWXvNtgsMRMBH/VgTWuNOCj
 0xQQUSVNWo4IoUgoqjDQQUVmTpdIvRMl6XjWAUxvYJ8QL6HJWTkbHw2EYVU42ELZicwkj2ue
 Bvc4pFYf++72EW7qN3A17wKLtS2XlnNNtrBZFnyk8Trkjeht2wL4fCORv6tFYtFM8ntfLBJX
 Fb82VRH/M76iFbWIPxsKRchBCw1LuDTgAgxyxfSlDcwWT6ON+wuD8PNRQdro6ynGHwyy44oQ
 RLvV9pcNDtanGHTocsUmbtDxdW1jfH1WEpM85EyW+GFCZNGEUJ4=

--------------4AIolL1cPxxqZFyJwZ29VJ0v
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4/14/26 13:53, Mark Brown wrote:
> On Tue, Apr 14, 2026 at 01:47:54PM -0300, C=C3=A1ssio Gabriel wrote:
>=20
>> Commit 61327f3d817c ("ALSA: compress: Pay attention if drivers
>> error out retrieving pointers") made snd_compr_update_tstamp()
>> return driver pointer() failures, but snd_compr_calc_avail()
>> still ignores that status and continues with stale runtime
>> counters.
>=20
>> The fallback for an unsupported pointer callback remains
>> intentional, so keep ignoring -EOPNOTSUPP there. Propagate
>> real pointer-refresh failures instead.
>=20
>> -static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
>> -				   struct snd_compr_avail64 *avail)
>> +static int snd_compr_calc_avail(struct snd_compr_stream *stream,
>> +				struct snd_compr_avail64 *avail)
>>  {
>> +	int ret;
>> +
>>  	memset(avail, 0, sizeof(*avail));
>> -	snd_compr_update_tstamp(stream, &avail->tstamp);
>> -	/* Still need to return avail even if tstamp can't be filled in */
>> +	ret =3D snd_compr_update_tstamp(stream, &avail->tstamp);
>> +	if (ret < 0 && ret !=3D -EOPNOTSUPP)
>> +		return ret;
>> +	/* Still need to return avail when no timestamp is available */
>=20
> It's not clear to me that the intent there is to only ignore in the cas=
e
> where we fail to update due to the operation not being supported rather=

> than to also ignore any other runtime errors we might encounter (eg, du=
e
> to the stream configuration).

Cool, thanks for replying!

I rechecked the current tree, and the hard-failure class does exist:
wm_adsp_compr_pointer() can return -EIO and switch the stream to
XRUN when dsp->fatal_error, !buf, or buf->error, so that is a
real in-tree case where pointer() failure means the stream itself is
broken rather than timestamp data simply being unavailable.

That said, I agree this does not fully justify the generic change as I
sent it. In particular, SNDRV_COMPRESS_AVAIL and poll() both recheck
the stream state after the pointer refresh, and there are other drivers
such as SOF where pointer() can return -EBUSY for a not-ready case,
which is not the same class as the wm_adsp -EIO/XRUN path.

I also agree that the current patch is too broad because it uses the raw =
pointer()
errno as the policy boundary for avail handling, and that conflates hard
stream-failure cases such as wm_adsp's -EIO/XRUN transition with
other conditions like SOF's -EBUSY not-ready return. I can rework patch
2 so the behavior is based on a better-defined failure condition instead
of treating every non-EOPNOTSUPP return as fatal for avail.

WDYT?

--=20
Thanks,
C=C3=A1ssio


--------------4AIolL1cPxxqZFyJwZ29VJ0v--

--------------d7DUj61dvgdlCP1X06sAueRY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCad59UAUDAAAAAAAKCRDQXT8aWv/ug1nE
AQCSu6N/vsFPstwA7qpo0ISHbABbzL4FhufUGtFYUfI/7QEAtgbGzfVtKqJaCNNsC/JJaDSQz7r7
dpEkjtcqsEUZ1w0=
=lh5a
-----END PGP SIGNATURE-----

--------------d7DUj61dvgdlCP1X06sAueRY--
