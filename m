Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A98F2F83A2
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776953379; cv=none; b=iXUBR05HaZGyAd6W8OQt5sLB4Fqv+fO+hixhnDLgMQzm2pyy1bo3tPcocPXyQxGAwzMUGFmkx8BfaoTlKlThE+O4GV7xO+JBxaKowYYnZr/KM27Gf7XbWkANw/U1WVy2eX+IK54vOuj20y9otB87IyNtihtxpzGjYc5EciuseDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776953379; c=relaxed/simple;
	bh=ca0h/sej4Kdp4Ig5mZIMczHnKlPYYrh6ta/PfASu4yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=noIAmTSwsehIbGBfZvU9DmD6+J/it0obezbTIkVgHso/QjpqahfUxz0j/oTIYZ0kwDhUXzcB27w4GP8/Ouj6mRQZm5nj3VV+hOmaGtw6kDKvku23EAX2yqzw23KTVIj9X9QxPY1QxK40iUYQxApsX2VieJfbQXEJG76oVLUXPQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7BBokrk; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7BBokrk"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-479d593a0c3so3245681b6e.0
        for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 07:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776953377; x=1777558177; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ca0h/sej4Kdp4Ig5mZIMczHnKlPYYrh6ta/PfASu4yY=;
        b=Z7BBokrkDcKkonXlPVreCceVHzY38NIyU+UkbpaQGg523VYq55LCmZR6CBokRXEKZ7
         a1Qwu1oRK36G6Pb8U0ITEDbaZM6dQPk7GBFE+Mbrb2AS4f0+e3Z5iECxx1x3pHYTUDuV
         OaCO1kwK8YJy1DQlqba07dpqU1GEFi+IgGyLFZvNdy/aM5ZwWAwaQhozbxcnH/LgE04X
         YpYbAe8DZlUWpLzEl/8MHqgfsffWNgmrbOh4ZP7I/KS9N2KUU6IkMCjDMZvpycNkzlQl
         NRQWvt7DaokyiZAlPIz1IIg5wemedoMRvgO2lv8UQBtyGyUWy4DSSmJkCS1xtmwDSf3u
         QRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953377; x=1777558177;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ca0h/sej4Kdp4Ig5mZIMczHnKlPYYrh6ta/PfASu4yY=;
        b=NIiqmFyBJDYG92PGwk1KCvKMvplpoZlv8IyfKwrT2iYX4y3tCLlVyQSlEtSGj4i7Dn
         6BjCIR1JOcpHi2BhAcU3Jx8zlahuFP0z3Dw1GTeykrNgZPJz6EcdXcxgQqa/kU6769iM
         M05Jq1zx3IkrLBm2IbQEI6sI8EgaLWMYBOLD7o4FYqfS07TmoUj9J6Z5/imgmDoItu54
         iTFnN4oQIjbi0rdThOd1UyhLQhfay4j2P+7SufLaX4YMkxX01sEmnZEwxPM5FJ4jxGLw
         0Uoxphxd9hgxWQxAqM8vA6SsBg/AKJrUXh7pJZddTgk0uiYE0HaPi2IERlEf7cU2wIHP
         +OIg==
X-Gm-Message-State: AOJu0YzNd6/4MGSOCPPb+7Pg354CUERyEIHIEsSU8iW22AnC6WCg6kJW
	ghFcbYR2xs5nK7Ipt5FOKoQDseU89/W+0znePJaxnbcValEVguwgsblC
X-Gm-Gg: AeBDievkRBZV1MfMjl1jVGCCKwsEKw4YP1hDfV1Su1O1/+KtV9Iv5n7+OE6Hbo/oYnY
	UySLBcrFoZ0c4VelD08+8hArgMXsPi4hqPyOXVz/pd7FGYkEK8EOTlWUfoj0/c9Rz0pp50pWsVM
	SDqUwQLz5hkqJrW4CbwcKzkb+JGJB6GcS3GklkEbFiyswgBrpx/IYp3HUiDnic1loBwbRq+L6y+
	9k5UaWtocTjeEXbeaaeOY07XBxO5juzUaA1/YRNp02pkKxngzBN7IXJsUMnATsm4jEPuS9RlowF
	43AkxBGy585+958Rf16A59F/EaHmVirAoRCv0vga/pmYJXs2Os55eYbHpB3076jNUJN6vWxHxlc
	zwZPqczMPZCx2QNC9GJUa1wSqKxnoq2b5BVkbPuHUSfk2QCmKwRGNu3KT0D9VWhmTn2WQTS72d1
	w2OeEskMcmtWtxZfHoM8zxvyTMvpBQ8sHTKoKU4XLWWhGCVJ8RV9O/GLRi8eN6Et7IH5HPigttC
	xJK2AJL41TF
X-Received: by 2002:a05:6808:338a:b0:467:697:7bbf with SMTP id 5614622812f47-4799bac70c9mr11859049b6e.0.1776953376839;
        Thu, 23 Apr 2026 07:09:36 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4799fc19273sm13239626b6e.0.2026.04.23.07.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 07:09:36 -0700 (PDT)
Message-ID: <e6d5bdfd-6d65-43d6-b14c-b0d5e949b969@gmail.com>
Date: Thu, 23 Apr 2026 11:09:29 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: cs35l56: Propagate ASP TX source control
 errors
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Simon Trimmer <simont@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260423-alsa-cs35l56-asp-tx-source-errors-v1-1-17ea7c62ec31@gmail.com>
 <876d2550-751c-4299-a090-fb7f4d264bde@opensource.cirrus.com>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <876d2550-751c-4299-a090-fb7f4d264bde@opensource.cirrus.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MKAmRkM075UcXxZqCQ9cGg58"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MKAmRkM075UcXxZqCQ9cGg58
Content-Type: multipart/mixed; boundary="------------Zo4lNyoGb6v0lX1VX0XOYPMb";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Simon Trimmer <simont@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Message-ID: <e6d5bdfd-6d65-43d6-b14c-b0d5e949b969@gmail.com>
Subject: Re: [PATCH] ALSA: hda: cs35l56: Propagate ASP TX source control
 errors
References: <20260423-alsa-cs35l56-asp-tx-source-errors-v1-1-17ea7c62ec31@gmail.com>
 <876d2550-751c-4299-a090-fb7f4d264bde@opensource.cirrus.com>
In-Reply-To: <876d2550-751c-4299-a090-fb7f4d264bde@opensource.cirrus.com>
Autocrypt-Gossip: addr=perex@perex.cz; keydata=
 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
Autocrypt-Gossip: addr=broonie@kernel.org; keydata=
 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

--------------Zo4lNyoGb6v0lX1VX0XOYPMb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4/23/26 10:32, Richard Fitzgerald wrote:
> On 23/04/2026 2:11 pm, C=C3=A1ssio Gabriel wrote:
>> cs35l56_hda_mixer_get() ignores regmap_read() and
>> cs35l56_hda_mixer_put() ignores regmap_update_bits_check().
>>
>> This makes the ASP TX source controls report success when a regmap
>> access fails. The write path returns no change instead of an error,
>> and the read path continues after a failed read instead of aborting
>> the control callback.
>=20
> Are you seeing a problem on hardware? Or is this a static analysis
> warning?

This was found by code inspection, then checked with a focused
Coccinelle rule (I do not have the hardware to check it).

Rule:

@ignored_regmap_read@
position p;
expression map, reg, val;
@@

regmap_read@p(map, reg, val);

@script:python depends on ignored_regmap_read@
p << ignored_regmap_read.p;
@@

coccilib.report.print_report(p[0], "ignored regmap_read() return value")

@ignored_regmap_update_bits_check@
position p;
expression map, reg, mask, val, change;
@@

regmap_update_bits_check@p(map, reg, mask, val, change);

@script:python depends on ignored_regmap_update_bits_check@
p << ignored_regmap_update_bits_check.p;
@@

coccilib.report.print_report(p[0], "ignored regmap_update_bits_check() re=
turn value")



Before the patch:
$ spatch --very-quiet --cocci-file /tmp/ignored-regmap-access.cocci /tmp/=
cs35l56_hda-before.c
/tmp/cs35l56_hda-before.c:187:1-12: ignored regmap_read() return value
/tmp/cs35l56_hda-before.c:212:1-25: ignored regmap_update_bits_check() re=
turn value

After the patch:
$ spatch --very-quiet --cocci-file /tmp/ignored-regmap-access.cocci sound=
/hda/codecs/side-
codecs/cs35l56_hda.c

No matches.

--=20
Thanks,
C=C3=A1ssio


--------------Zo4lNyoGb6v0lX1VX0XOYPMb--

--------------MKAmRkM075UcXxZqCQ9cGg58
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCaeooGQUDAAAAAAAKCRDQXT8aWv/ug0xm
AP4ktrFpvSR4xh7eI6xaxGonEX9NHGM52brIIjLASY3u1QEAhYjEi8Pcof0xEc9buBayojEi0IOq
uLrZi6+ZE9iCKww=
=/cQe
-----END PGP SIGNATURE-----

--------------MKAmRkM075UcXxZqCQ9cGg58--
