Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD203BB102
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 13:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764761; cv=none; b=ZeP55hhPedQhlVhM4+qZA1t6LsxGdkM3eJG73QBxDQKMVlkIrSNpOdu/lo97wuG4OWGGTuK+7DQqEhJIFwEmUzURiGuaHjtYOenApoF6Q5Rh1V3u3tjv464z/fT8Ba2PYf7yM79YHUwnLKdOPZVfXssLcmCa0MXWK9Ae4v7EO8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764761; c=relaxed/simple;
	bh=Sknwt+sH8Lfzu/yJVB9s+/5ovQsfmHpDBFBXBhFOpQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7N9ACOy8jA/sbdY8wY92cbTiJ2YfEoSERXANRRi9xm9ryaMAOhZO7955by4w8P88LI+kzyY9Y6B5Mo5dnJ7LrW99HeAMdU4dBim1YghQY1G07nryrejDh7u3Oh/NakJVMmM+u0+ZG/DcKUAkmvOWsK72bBewwgBZBfxsx/LoG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYTjyytG; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYTjyytG"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c15849aa2cso10723795eec.0
        for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 06:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778764757; x=1779369557; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PbP609V434boetcDsZu4rD2p6QNlwYdZeHp8pNJAXVY=;
        b=RYTjyytGYI45cGNFnkF71Ui9fLd76CSgvllCUKA9uCru+I2jGI7BtVNafrt+MEdr/i
         9sEWkAzczgl0jWNchgx/TbZGHh4FOfGbIOaXBHzLxKqTCfQuJhqQXj2DyBWF9kLniXn9
         2+Co3NLGQcHpX0dE0cA7ufBmZDd4KYnZxH5r/2bYTrIHWiM1fMNkzAYdFnuaSpamgc0W
         P+dqxkXFa4MtnD/NyHI8wmoXbASxO5taPIxvBCCZ1daz1o+k2he4ogK+CFwuY4qUYRAk
         DIi/w3XMx//CCHcw1kezPW1UAxTz7YnJTtu0LW8WgicEiV2f5z0dWFOwSYEleFzGp6mj
         Ww9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778764757; x=1779369557;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PbP609V434boetcDsZu4rD2p6QNlwYdZeHp8pNJAXVY=;
        b=PScsgicqYPBrYvn+Jp3V2Zq2fEByy7GL7Y7+qUEU2WgsGoTSTd4TTTzPnWq2QlXQT2
         1vyT/+bRGZs2EnYyNNaqtTCUHCo1EfQ1bEYuKQmSnxaEHfms+JFIGKks8OAhSyWSDSkC
         FIXhciN9isvjllDWo3srdQ4HUdmTOxkMe7lew5vnr6qebuyMBLebDJO/3/hER3N8lKe8
         REFOj/BcAJXYWwjY1bWU0mA923XSxQ9f3Jl879x0qIdWd0d0dZXNdga4ydAUUXcjZbts
         5HMl/bb1s/rIPQXln30kdOSjSwivn1hRQKokRikfV/LsDSyJlxKPaBNpOJc32pPQNVK4
         V6xw==
X-Gm-Message-State: AOJu0YziITbQHrT4JinDOAC312VMtG1WPMxxHee08OfhLfgGYMBmUPCD
	2rBUXb63+gx7tqE84RDx4In9C6EkdH9DTgLVxECRnH8rsqWhqszmOwcx
X-Gm-Gg: Acq92OEF4QkgyiAuQkGwWwBq3iVxq4nulVw9GczzDiv2R4UWXnkuqMqOQFr4st++giy
	g079dt39voPzgdzEQ3VefVA7VWJgRC/UZCN/yfFYdWsuqTeYCnJP35U1sSfcXunr8LBMRYneSNI
	VlyZxGaytkMYD2d1YqxGSjfDM2A1qpdEaASDH0NZp36G5E/ET70Ij6aFysW5t+OmxBruE73TGWc
	8I+iF5WcslEfWnTgyyMeMGtnzLo0lCqL1tojIz1J85rkiI+WzfwLJhxMZ8ncJi8CquECc3oq07C
	jHcCOZFwWwUo20ehM4MopwDh8OVJFWZnqG+k6hTsGr8MANEiTFdCPDA78h3+iuXDQPRq3eeW79y
	KrXVuOkzUfJJZCq16f3BVqPhMqe2W7ViwS/ERXXRK7k9zQ/FDWUwtdBXX9RElHYlA3hglZl4cCC
	IGlWtiU9FbTb2HKrcvstR+w4fkI3S+wwyIhmUh62aDSKK9GGw8T1FpfSoq9WjELOWFK0EoqGzJR
	g==
X-Received: by 2002:a05:7300:e7a4:b0:2d4:94cc:eebb with SMTP id 5a478bee46e88-30117480740mr4835454eec.13.1778764756475;
        Thu, 14 May 2026 06:19:16 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302977a9474sm2854299eec.25.2026.05.14.06.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 06:19:14 -0700 (PDT)
Message-ID: <fcd7277c-f0db-4317-aaca-ebfdb52da3df@gmail.com>
Date: Thu, 14 May 2026 10:19:09 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: tac5xx2-sdw: Use SoundWire init wait helper
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514-asoc-tac5xx2-sdw-init-helper-v1-1-aa2a62e87383@gmail.com>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <20260514-asoc-tac5xx2-sdw-init-helper-v1-1-aa2a62e87383@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------i0XphG9bNTGX1PpwFQDc3Sxl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------i0XphG9bNTGX1PpwFQDc3Sxl
Content-Type: multipart/mixed; boundary="------------KQikk436H1hSyy700Uo22E8G";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <fcd7277c-f0db-4317-aaca-ebfdb52da3df@gmail.com>
Subject: Re: [PATCH] ASoC: tac5xx2-sdw: Use SoundWire init wait helper
References: <20260514-asoc-tac5xx2-sdw-init-helper-v1-1-aa2a62e87383@gmail.com>
In-Reply-To: <20260514-asoc-tac5xx2-sdw-init-helper-v1-1-aa2a62e87383@gmail.com>
Autocrypt-Gossip: addr=broonie@kernel.org; keydata=
 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
Autocrypt-Gossip: addr=perex@perex.cz; keydata=
 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

--------------KQikk436H1hSyy700Uo22E8G
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5/14/26 10:16, C=C3=A1ssio Gabriel wrote:
> The runtime-resume path open-codes the same SoundWire re-enumeration
> wait now provided by sdw_slave_wait_for_init(): check whether an
> unattach was requested, wait for initialization_complete, report timeou=
t
> status, and clear unattach_request on success.
>=20
> Use the helper to match the other SoundWire codec drivers and keep the
> runtime-resume unattach handling in the SoundWire core.
>=20
> Signed-off-by: C=C3=A1ssio Gabriel <cassiogabrielcontato@gmail.com>
> ---
>  sound/soc/codecs/tac5xx2-sdw.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>=20
> diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-=
sdw.c
> index 917b36ac1cd3..bb12cfb6da12 100644
> --- a/sound/soc/codecs/tac5xx2-sdw.c
> +++ b/sound/soc/codecs/tac5xx2-sdw.c
> @@ -1437,7 +1437,6 @@ static s32 tac5xx2_sdca_dev_resume(struct device =
*dev)
>  {
>  	struct tac5xx2_prv *tac_dev =3D dev_get_drvdata(dev);
>  	struct sdw_slave *slave =3D dev_to_sdw_dev(dev);
> -	unsigned long t;
>  	int ret;
> =20
>  	if (!tac_dev->first_hw_init_done) {
> @@ -1445,19 +1444,10 @@ static s32 tac5xx2_sdca_dev_resume(struct devic=
e *dev)
>  		return 0;
>  	}
> =20
> -	if (!slave->unattach_request)
> -		goto regmap_sync;
> -
> -	t =3D wait_for_completion_timeout(&slave->initialization_complete,
> -					msecs_to_jiffies(TAC5XX2_PROBE_TIMEOUT_MS));
> -	if (!t) {
> -		dev_err(&slave->dev, "resume: initialization timed out\n");
> -		sdw_show_ping_status(slave->bus, true);
> -		return -ETIMEDOUT;
> -	}
> -	slave->unattach_request =3D 0;
> +	ret =3D sdw_slave_wait_for_init(slave, TAC5XX2_PROBE_TIMEOUT_MS);
> +	if (ret)
> +		return ret;
> =20
> -regmap_sync:
>  	regcache_cache_only(tac_dev->regmap, false);
>  	regcache_mark_dirty(tac_dev->regmap);
>  	ret =3D regcache_sync(tac_dev->regmap);
>=20
> ---
> base-commit: eeecc92a9f1dd213dd52d9b8f42d155595b1d278
> change-id: 20260514-asoc-tac5xx2-sdw-init-helper-5c2363020069
>=20
> Best regards,
> -- =20
> C=C3=A1ssio Gabriel <cassiogabrielcontato@gmail.com>

Sorry, please disregard this.

I just noticed that the patch changing this has already been sent.

--=20
Thanks,
C=C3=A1ssio


--------------KQikk436H1hSyy700Uo22E8G--

--------------i0XphG9bNTGX1PpwFQDc3Sxl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCagXLzgUDAAAAAAAKCRDQXT8aWv/ug/du
AP0UH41KVLnfNwzFHkIW7R2JlinXOsCqP3+9cMusXQndwwD+JLbpOPX35oWh0XEcPS8oIJMsX5oM
zm/RUiT291NN+wE=
=F3HZ
-----END PGP SIGNATURE-----

--------------i0XphG9bNTGX1PpwFQDc3Sxl--
