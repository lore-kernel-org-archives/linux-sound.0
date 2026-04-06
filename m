Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4669F25783C
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 13:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775483575; cv=none; b=duljbsAYv6Ayd2Y4rSt7bVc7+pTM+C4wHvhIO625HQL0jpOzlW/f5MIe+0gDe8ZRhOqaDWIBZz1sqdXMpmgUXGVBRyQIJzPzjBxWyD12JKUsDv5+K8L3sC2W0+JMSoxcnhO6StfcECcPThuCZ1LbZueznjcNLTeKyh02gw7+pbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775483575; c=relaxed/simple;
	bh=22hKC46dbCRJcym8lUmOuVU1oLDlhUIe4QIT1uhfPIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CAuiUo6jB/6eLx8ngZW1b3+277BflK3rYOcMnFf+VyjCVG8LUYjM6glMEibwJmD6T0jmCZKQHh4WvHXX9/ycR8Bdgb7E3GSCzxKiiuRiwdwdqfGEBTE0Hvub2ELtjo2atwPjteEQz93shzCtxSiX6+r3OneW2zu6EAHQYsp6eLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLzcxxqW; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLzcxxqW"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-953b7d2c820so1235154241.3
        for <linux-sound@vger.kernel.org>; Mon, 06 Apr 2026 06:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775483573; x=1776088373; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZyzAAVXvHZePckrxp4XEy+EEhPq9dXQONt7YXi0aJs=;
        b=HLzcxxqWZowYN9AYs0kvlGVo6cZgG5PUmBPlNL7zLSxT1tRlCCmGdDjnfN8pm8jVNU
         VjMaoSE0nZOIuRPhfPqszUg6Hu4NGcY3qFJig73FIpdezbFAn9xnXlqeOj32Yals+VN0
         CU4OMRteOGNlBt0SUMQqPO6xzeICVcACZBfTZc7h8hfeZHIwGkftHqAtgObda5e7BPtA
         Je6NfunPPIxhfHJI8o9aLiXXZVpoiNlC5JMC8cfK6kAhaDRwlbUD1TYCeiBiJpYtqtMA
         Cox75KNMhBepwHhmApyO3c4rWqFBt8nDQjLTEdI09moHbJswNbsq+zsOawaQhSbgffRw
         yIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775483573; x=1776088373;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZyzAAVXvHZePckrxp4XEy+EEhPq9dXQONt7YXi0aJs=;
        b=G4AXjR0bl7lV99YbSX7SQY1t8z25RKedXWpJhcGm+QNRLB413v1V2j+y3jNQAa7q6S
         1J4lMjACCi15GCey/BK4BfQ/a8hrtxnie4Hu2RphcUajIpqyFSxsrC9Q+3bXCiWQTmnT
         1W1lrf3bNMDzFWQ+Yosn0UPongKtZICC6VumgQ3ov8jbLSqYYG6iRfYXWqvckdZzwu7B
         Kl3xBQsByUJM4WL3/xiGpiS7b7G9dK/9pXvZjG5T09SZ4Ess8C6MfZ79ZwTOb5gsTJ87
         HOakgrrsUgfxquDqNjYRrZb7w4Utd7jXcv+Bipti+MWvKCE2BAyQ4wFjXnb1+zHywkVy
         01UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE7cWeATVv1y1cWncxfaqfsgxZ0rmBzn8U1jEoUkuGP6deuBePToZZfQLkMH8ZPHcsoyw/6REaqe16qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW3GaK2+v0T5sHWxDOOHB4IbgyXCqj3Wp1vVrUwabfDttVuY/t
	xMaBK0Hv1cD9QnCGi0FmQD0ntiYFIBNHRdOhyn5Vfe0Vs5CWRBPg7CXb
X-Gm-Gg: AeBDieuIqv7GYr43QWugWjPlMnbqs8aBVEy1tbeFQfdhylJqR6xbz4EAByL+aD8hxyR
	/n4GaT9gFbBqtAct2mKYpPmZoiJlM3f/Bkkjxgd4KJkaFTRnZMA4uuEGY8vIdJNhzPDm+buWqjO
	YXvyFlrYHGttdeYJdZMiJgt2skG4Nz6vZdnp7Fn3KLP0DaCoMqpv0RJ3h0/1XWaEgp9Y9/QXTNB
	us+1bT8UYxlk/JI4fFn6norcoKd9j+A9kQg391EyQJ+kcic8Neuk0BxOr5zW0ciQaX64H5B1PYg
	6jxK5ucCiIXMszF/dHnjDbKYB90TOMRi5D4xD00mm5LBUssPx2gCrMYy7iawliih2W+CPgUzBVA
	TyQCLfyNk3dOQec8BDyxpc+Tl7Oo8/w7hV48c1t6J4CCMe8Ia1AD1pyXPh7Ycua6LaRFtHRezat
	kOTSh/povsRopg1oiMLDS+zk0laoFgyUUFVUtymTl0cGLSM6JRrTrxCpriTWRo2Z5xC8pMQxQdS
	RDR
X-Received: by 2002:a05:6102:4a92:b0:604:ea79:d425 with SMTP id ada2fe7eead31-605a4d335f0mr4090264137.9.1775483573073;
        Mon, 06 Apr 2026 06:52:53 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fba6abbcsm13265958241.9.2026.04.06.06.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 06:52:52 -0700 (PDT)
Message-ID: <1ef2e922-68f9-4240-8c7a-0c44879eec5b@gmail.com>
Date: Mon, 6 Apr 2026 10:52:48 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ALSA: isa/gus: add ISA PM support for GUS Classic,
 GUS Extreme and GUS MAX
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260406-b4-alsa-gus-isa-pm-v1-0-b6829a7457cd@gmail.com>
 <87v7e4lagw.wl-tiwai@suse.de>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <87v7e4lagw.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NA60plkNngbg0Voy1FLlt0xq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NA60plkNngbg0Voy1FLlt0xq
Content-Type: multipart/mixed; boundary="------------a0M1htnrXbZmGRybdJEmloJN";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <1ef2e922-68f9-4240-8c7a-0c44879eec5b@gmail.com>
Subject: Re: [PATCH 0/4] ALSA: isa/gus: add ISA PM support for GUS Classic,
 GUS Extreme and GUS MAX
References: <20260406-b4-alsa-gus-isa-pm-v1-0-b6829a7457cd@gmail.com>
 <87v7e4lagw.wl-tiwai@suse.de>
In-Reply-To: <87v7e4lagw.wl-tiwai@suse.de>

--------------a0M1htnrXbZmGRybdJEmloJN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4/6/26 06:11, Takashi Iwai wrote:
> On Mon, 06 Apr 2026 05:20:02 +0200,
> C=C3=A1ssio Gabriel wrote:
>>
>> gusclassic, gusextreme and gusmax still leave their ISA PM callbacks
>> disabled, so a suspend/resume cycle does not restore usable GF1 operat=
ion
>> on these cards.
>>
>> A simple wrapper around the existing GF1 start/stop paths is not enoug=
h.
>> Those helpers are probe and shutdown paths: they reset software handle=
rs
>> and tear down runtime state such as the DRAM allocator, timer state, D=
MA
>> queues, PCM state and UART setup. Resume instead needs a narrower reco=
very
>> path that rebuilds the GF1 hardware state without rerunning probe-only=

>> detection or discarding the bookkeeping kept by the card instance.
>>
>> gusextreme and gusmax also need board-specific resume glue around that=

>> shared GF1 recovery path. GUS Extreme has to restore the ES1688-side G=
F1
>> routing before the GF1 is touched again. GUS MAX has to rewrite the MA=
X
>> control register and restore the attached WSS codec state before the f=
ull
>> card is brought back.
>>
>> This series does that in four steps:
>>
>> - add shared GF1 suspend/resume helpers that quiesce PCM, DMA and UART=

>>   activity and restart the GF1 hardware without rerunning memory detec=
tion
>>   or allocator initialization
>> - wire gusclassic up to the shared helpers
>> - wire gusextreme up as well, restoring the ES1688-side GF1 routing
>>   before the shared resume path runs
>> - wire gusmax up too, restoring the MAX control register and the WSS c=
odec
>>   state around the shared GF1 resume path
>>
>> The scope is limited to restoring post-resume usability for these ISA
>> cards. It does not attempt transparent continuation of active GF1 PCM =
or
>> synth state across suspend, and userspace may still need to reprepare
>> streams or reload onboard sample data after resume. Open rawmidi
>> substreams are restored only to a usable post-resume state.
>>
>> Signed-off-by: C=C3=A1ssio Gabriel <cassiogabrielcontato@gmail.com>
>=20
> Applied all four patches to for-next branch.

Awesome, thank you very much.



--------------a0M1htnrXbZmGRybdJEmloJN--

--------------NA60plkNngbg0Voy1FLlt0xq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCadO6sAUDAAAAAAAKCRDQXT8aWv/ug5o+
AP9zu+Neoacu6M0Im2oq5sGXfEoUI0qo08iWsnUZwgv18gEAgleROlZGQPWjBAdfub3MMNwbFVZf
ai+0QPzuLmt5+Qc=
=IZkK
-----END PGP SIGNATURE-----

--------------NA60plkNngbg0Voy1FLlt0xq--
