Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BC733F587
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 14:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775918041; cv=none; b=l6K8Y454kqMxWdlz5fW1pw7ZjI13GUFEywhWox66yT9Zkr9p/3JoBQ/fpWIQn1wj4c3CzLWTWiym37fujaaaLAZwVUd48goMgsJqa70DrxG5MXJQ809EGzgpjEE7VzYNT8wj4xrS5r5NknZj5HjV0wYcZpdeaJJxnfMSggfhRe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775918041; c=relaxed/simple;
	bh=E3AjJnm4RhjwSj+BtUY3AZpUlFWknFcxj+2roGa+isQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DOmQCzqAgwCkoiWFmMjg73D6qHTgA0259knM/XDgp19UiYsyajYo5c0EWG/jfQn6lwi9hFt1XQAdCAz00M+JlVY4f7BCOI2mxcz0d5Hjx3TI8aAcJYCHwGg7D5ie9eNd1dfvtIo7jUh2SamF4YUmSVeTiWRKLTYd6F5toO49hUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5Bu3c63; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5Bu3c63"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ce102afb0aso3905992eec.1
        for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 07:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775918040; x=1776522840; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ly0o2gX9BmtRHhotuMZKHgxWkRVy8Lup9REE6+TFCw=;
        b=b5Bu3c63wKEI7WoJ6Hu61GRhTCtJHsh4aawxT7z2MU7dcS1k0NNSjYMeslvdutgWSF
         34TfB4Vbdl04rw+9rBkPE/7JAh4RDX4HR3nM4Yoa0ZTymY0/Kjei3p4IVcHwNrMZZtRB
         jrPz6wjE0f6TPzCE/AeUgAzp0i8S8ZGkh3/ti3ZQ+vU5Xz+psJiGvPludvP0nKjmdzCq
         6US1CsH1qk6T2PyyxAw9vc98INoNAjA6k9k1OH+gGu7i4ee1DNFbCRc57YvQmaXqkUK6
         yGZ972sPeKuPDUD/t53e2YCMF5yVJ0CVN/YOwoy0pVu4EgT+Uqsf9U68ZA5gmPRJOYw4
         TKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775918040; x=1776522840;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ly0o2gX9BmtRHhotuMZKHgxWkRVy8Lup9REE6+TFCw=;
        b=J4+CbAPzGEnIdBhs83xeCCodBMYJRQI6EOMhPtDVpuPsuqe5yPv5nnth+V7Dmt7mN+
         O72+PK0+CKDWYVnmvXBSTngTfPzZsKK9pCq4pWvNo3auhJSmSLn8LVzCvqc1vKBOq1AX
         QtKGjOrcbxM84UXeMRuvXHPjJFYIb07yN56fiVY1gFivFcCKGWC0VgZyFIugeYL8NWRQ
         epg7HS14cl6K1Y2Hf9uKog9Jdgwzg0Ha0NRdjDntq7UtzcSlHGN7LF24rrZEpjGWD+67
         SwdhrdnFqUvTFp0qwNBSKTVY1XCvDEJBQRsu/WzrHYUJwX4ygr+aJunf8D/XulyiW+NP
         JEgw==
X-Forwarded-Encrypted: i=1; AJvYcCU6uwff/4edCT/czsKo05oXVRUfMVe9lS9Go1EL8EfFN2AEzOJik/Pqi670bnoovXUld+tRzVekxlpovA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNd8FN35nZNx+9NgwnSFORQ17zCp8q2shIW8n34YPhn+ZwnhOA
	3HwjTke3Ccka2RQuXo7NruF96GZVBwODC+ypKxLFHvpzvyG5yuGGUXVcqm0+c2Owsok=
X-Gm-Gg: AeBDietHXPpAd4KuPGd8iKyBhMKkglaiZC2QVtgUj4PtfA8/ElMW6nBu9YJjDDHG0FZ
	8R3jmd+6k+GTISzBToxw8jpKeU9JChuugZSnonjkID3Vum+QnnjRzure9euzNb61DErA1JqJoP3
	mFlUzcBdtz0kASe/xeJ0LEs+xBfOG2Mmh9dX/OXSxdW4HqpRB53MuvgVIJw/2dOzNli6kA2Vavx
	obKZ5YrJrLphAMZbOtqbhsR4dS8OPwsBNyGI6VK7/VggdPdurAjxJ1i5+WAzllkhEVMxp3rGFaB
	W4/jh241xn1QJmeLPeNeYxS11HsJXx8dQ/e+YmwSh4w9iwfDIOlFVUw2YDUil70lB9kGRS5uAkB
	SEWZSRoClkTfkg82XOAn6KuZwdp58wO/qySBMSEnCifaKr3Ijz0kHOOYsAeguC2liM8ETCAUzRv
	Syqoypp+hrAsCukyLNyqcgeWi1AKaf++MSIWNESXL/Kmp2ttZJcfHCnIF3ONVg/T+BLKmAOt35p
	tXl
X-Received: by 2002:a05:7300:4311:b0:2c5:3b87:2ffc with SMTP id 5a478bee46e88-2d586ba7c00mr4049786eec.7.1775918039417;
        Sat, 11 Apr 2026 07:33:59 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5630ac330sm8753546eec.29.2026.04.11.07.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 07:33:58 -0700 (PDT)
Message-ID: <fe520e2a-5a95-4b57-a16b-a7a08a326ee7@gmail.com>
Date: Sat, 11 Apr 2026 11:33:54 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ALSA: sscape: Cache per-card resources for board
 reinitialization
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260411-alsa-sscape-pm-v1-0-3058d988783a@gmail.com>
 <20260411-alsa-sscape-pm-v1-1-3058d988783a@gmail.com>
 <87a4v9gbs1.wl-tiwai@suse.de>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <87a4v9gbs1.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3f4bYGKL5TDyWWM0aeszzmpk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3f4bYGKL5TDyWWM0aeszzmpk
Content-Type: multipart/mixed; boundary="------------mRadz0yqWTDvs2Efwuz0fUy6";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <fe520e2a-5a95-4b57-a16b-a7a08a326ee7@gmail.com>
Subject: Re: [PATCH 1/2] ALSA: sscape: Cache per-card resources for board
 reinitialization
References: <20260411-alsa-sscape-pm-v1-0-3058d988783a@gmail.com>
 <20260411-alsa-sscape-pm-v1-1-3058d988783a@gmail.com>
 <87a4v9gbs1.wl-tiwai@suse.de>
In-Reply-To: <87a4v9gbs1.wl-tiwai@suse.de>

--------------mRadz0yqWTDvs2Efwuz0fUy6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 4/11/26 05:07, Takashi Iwai wrote:
> On Sat, 11 Apr 2026 06:54:29 +0200,
> C=C3=A1ssio Gabriel wrote:
>> +/*
>> + * Restore the SoundScape's MIDI control state after the firmware
>> + * upload has made the host interface available again.
>> + */
>> +static int sscape_restore_midi_state(struct soundscape *sscape)
>> +{
>> +	int err =3D 1;
>> +
>> +	guard(spinlock_irqsave)(&sscape->lock);
>> +	set_host_mode_unsafe(sscape->io_base);
>> +	err &=3D host_write_ctrl_unsafe(sscape->io_base, CMD_SET_MIDI_VOL, 1=
00);
>> +	err &=3D host_write_ctrl_unsafe(sscape->io_base, sscape->midi_vol, 1=
00);
>> +	err &=3D host_write_ctrl_unsafe(sscape->io_base, CMD_XXX_MIDI_VOL, 1=
00);
>> +	err &=3D host_write_ctrl_unsafe(sscape->io_base, sscape->midi_vol, 1=
00);
>> +	err &=3D host_write_ctrl_unsafe(sscape->io_base, CMD_SET_EXTMIDI, 10=
0);
>> +	err &=3D host_write_ctrl_unsafe(sscape->io_base, 0, 100);
>> +	err &=3D host_write_ctrl_unsafe(sscape->io_base, CMD_ACK, 100);
>> +	set_midi_mode_unsafe(sscape->io_base);
>> +
>> +	return err ? 0 : -EIO;
>=20
> The above means it checks only the error of the last write.
> Is it intentional?

It was meant to accumulate failures across the whole sequence, since
host_write_ctrl_unsafe() returns 0/1 and the accumulator starts at 1.

So an earlier failed write is meant to keep the final result failed, not
only the last write. But I agree the current form is kinda easy to misrea=
d.

I can rewrite to make the cumulative error handling explicit:

static int sscape_restore_midi_state(struct soundscape *sscape)
  {
        bool ok =3D true;

        guard(spinlock_irqsave)(&sscape->lock);
        set_host_mode_unsafe(sscape->io_base);

        if (!host_write_ctrl_unsafe(sscape->io_base, CMD_SET_MIDI_VOL, 10=
0))
                ok =3D false;
        if (!host_write_ctrl_unsafe(sscape->io_base, sscape->midi_vol, 10=
0))
                ok =3D false;
        if (!host_write_ctrl_unsafe(sscape->io_base, CMD_XXX_MIDI_VOL, 10=
0))
                ok =3D false;
        if (!host_write_ctrl_unsafe(sscape->io_base, sscape->midi_vol, 10=
0))
                ok =3D false;
        if (!host_write_ctrl_unsafe(sscape->io_base, CMD_SET_EXTMIDI, 100=
))
                ok =3D false;
        if (!host_write_ctrl_unsafe(sscape->io_base, 0, 100))
                ok =3D false;
        if (!host_write_ctrl_unsafe(sscape->io_base, CMD_ACK, 100))
                ok =3D false;

        set_midi_mode_unsafe(sscape->io_base);

        return ok ? 0 : -EIO;
  }

What you think?

--=20
Thanks,
C=C3=A1ssio


--------------mRadz0yqWTDvs2Efwuz0fUy6--

--------------3f4bYGKL5TDyWWM0aeszzmpk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCadpb0gUDAAAAAAAKCRDQXT8aWv/ug8ki
AP9yLWGM4jdsqqh1c8eZb6g/P9BQApTVUnGv2bWhbtdX2QEAu71Avg27rnYzOta3Qw0YzBdjEwbP
b0rdpL7V8PIsawo=
=8LvT
-----END PGP SIGNATURE-----

--------------3f4bYGKL5TDyWWM0aeszzmpk--
