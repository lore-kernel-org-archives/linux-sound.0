Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8263A2472B6
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 11:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776165260; cv=none; b=pOpcxjKcmMUZy8sNQt1pO6zp8OfgCTPnGT3zZqTh2ZxpfNTESFi9VeH0W7vomoZVjsZVsR4/mEVGC+ESMfXEZtIrSVwuttw7Z68B8YHJe5BQxuDo+pFDY1IA9sJKQ8fS9ycaGQmFQeKtOrbngglFUXSopzL1rBjMTueFH5wLCm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776165260; c=relaxed/simple;
	bh=05izLorHA67d2cUzAOTXsLLbDWwmUAoKA5th1n5pYzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ET/jsbu37aSjzqpeKWoUyPKgBHXI8uK2/bQkDXAjcEUfiSCidzyBWdmVmS6Jm60bxIGxHba3qmx+B3uZq4viTKq6oeauT+5kJv5R227Nt8DOpfpro5SMFiGvX1Jq9SD81SMTNKUV8dsw7TshLKiPtLB3zITpS0fStHPqniqf/AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bicz65Xk; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bicz65Xk"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2d8ffdc31d0so4104998eec.0
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 04:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776165258; x=1776770058; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzhhgXhlTTjemePB7VTwbmZj92akxNUuHsLGFCiFZRg=;
        b=Bicz65Xk6k6Km7g5OalzBVwsjzUN/ypt+jZtKOGG12kbC7hyeLb+w1tsq4kTUKdijo
         iq+qkinX7iApvfuODEiXu7wcevOm3LF4JmSFjb3uI8oOwf9SVOBTi1mVi5d3Ea/epBsd
         LoPlKYZ07akgM/yzCDRaA9pt5x6cKf32HZg+c1bHuKZfuRqIHRYnCWrZYQWTQfWPZUuD
         v09ey2JCu+KVLPSma4jydgrWcEkmHUWqwsDC/b9oaXsiOy1AFpW9eOpjL6Vr0k01XI+a
         5vf2c4W7THjA+o4bMIzaKOpARYFIZIqjTfubZZXvYwQW3fIVCOJ/VhHEpmFVldFQZZ0F
         2VAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776165258; x=1776770058;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FzhhgXhlTTjemePB7VTwbmZj92akxNUuHsLGFCiFZRg=;
        b=er0wkzTlH/XLKRi66BiZEwsqYI1zB7sgDdgEtKLvkrwXr5tTku6sGwUS3sTBiuPY9H
         t96313q+wLulruEsmoY3c4D8Xh+UPUK9/uZbtcUcI+33Thplf8x44LVpJNfKCEh+r0mP
         NKjJMKgXk5WCZYx3YRuN4E3zDIUaAlri8o1uDR/norotpkKdHiXlDPJa0GL4VI3FDsMG
         4+cENwHKp+fasqulsbQUd4Mf0lYQw5XQPuwbDCsDbYDj8+qw2Eru77zzlgvU56xm5haa
         iKmfzGetZSlAJD2bv2WO5dRBH1vKZcUh4CYwPE3A/ryqXkMtohuojkyZ8etKLFYB8Fyi
         /QyA==
X-Forwarded-Encrypted: i=1; AFNElJ8mbmmunVX5cnwiag5C95Mj9DEByRzaxfxlGX62ymxVmGHoBihBzXgqmqV+N/JQ6Pd7u6RNM6QBgSQmBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOHUB7SIitrVxw1L7IKAAdnt/f3MgOrNbX99YifpjkSJp2XUuD
	xTRgGhqsnKJiCYK6KkA8bE34fijMvevfr91R0pU5ZYq2QFJfOEGm63Jf1W+i0mVO
X-Gm-Gg: AeBDies2iD8q337PwTP8HkAr66zoZB/ktjNtBsduDzokipHpRj23xCHGDpXlvq/mLHD
	iFDzserfvuwt7/+faWtIbOu8G5elna+cWadVvbPI74p6278Ru8z2Jt6yqapSSHAtMfJ+eNO+9Dp
	VOB3mVSYvPLL2OPuHK8g+dPZQE62OBJ8W6XO6rojffa4bnQtRY7bj2dhn7gujNTKUKeSUiokr4u
	KHc3h3j/tK51+pRydoeCskhxKY4OYEQ/Pnpw33YkPBmaaKFl5NGh/0krcgI/57gBtDwWqhrl6BT
	M1XqSQCAnD5OpwWLATJVS0FWWfZmZAjDdHsjwb6arRMBggw809xREfJWB7lD0g7KsPwIrnm1ri8
	hyODMN4uXGlqr/tCw3mCJMNMj3vwnuOq3B77Me1pQKixF8tx1m2d3pJxsTgkSOabhsaR3lQXM1v
	HEmJY9tmaCZJ7MvS47M/Wp5hKfMnByjTp8mPF43VF5MwfKNxD+y+wusxfio+F1+u5ffDQW1ip3X
	nJB
X-Received: by 2002:a05:7301:4586:b0:2c5:220c:5673 with SMTP id 5a478bee46e88-2d586380bf9mr8982937eec.5.1776165257385;
        Tue, 14 Apr 2026 04:14:17 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa556esm24392252eec.8.2026.04.14.04.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 04:14:16 -0700 (PDT)
Message-ID: <9fe289a2-b548-4680-9070-7558c516d09f@gmail.com>
Date: Tue, 14 Apr 2026 08:14:11 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: opti9xx: restore snd-miro state after resume
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260413-alsa-miro-pm-v1-1-07cc1ce3463c@gmail.com>
 <877bqat3y9.wl-tiwai@suse.de>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <877bqat3y9.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KepiRC0d3E23dnQrI8UC3UKz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KepiRC0d3E23dnQrI8UC3UKz
Content-Type: multipart/mixed; boundary="------------zHW2Xf08qRqMoGTjHBZa94Wm";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <9fe289a2-b548-4680-9070-7558c516d09f@gmail.com>
Subject: Re: [PATCH] ALSA: opti9xx: restore snd-miro state after resume
References: <20260413-alsa-miro-pm-v1-1-07cc1ce3463c@gmail.com>
 <877bqat3y9.wl-tiwai@suse.de>
In-Reply-To: <877bqat3y9.wl-tiwai@suse.de>

--------------zHW2Xf08qRqMoGTjHBZa94Wm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4/14/26 04:07, Takashi Iwai wrote:
> On Mon, 13 Apr 2026 21:45:34 +0200,
> C=C3=A1ssio Gabriel wrote:
>>
>> snd-miro has no PM callbacks, so system resume leaves the OPTi
>> master-control registers and the board-specific ACI mixer state
>> unrestored.
>>
>> Like snd-opti9xx, the driver needs to reprogram the OPTi routing
>> registers before bringing the codec back. snd-miro also keeps mixer
>> state in the ACI block, so the codec resume callback alone is not
>> enough here. Save the ACI mixer state on suspend, reinitialize the
>> OPTi and ACI state on resume, replay the saved ACI values, and then
>> resume the WSS codec. Hook the PM handlers into both the ISA and PnP
>> paths.
>>
>> Also initialize miro->card on the ISA path for the existing dev_*()
>> logging and keep the cached solo-mode value aligned with the value
>> written to hardware.
>>
>> PCM20 radio tuner state remains outside this driver's PM scope.
>>
>> Signed-off-by: C=C3=A1ssio Gabriel <cassiogabrielcontato@gmail.com>
>=20
> As it's no trivial change and we are already in the merge window, I'd
> postpone this for 7.2.  Or, if this is the very last piece of your
> whole changes, I can try to put.  Let me know.

This is not my last ALSA outstanding piece but this is not urgent either,=

so postponing it to 7.2 is fine with me.
Please defer it to the next cycle if its proper to you.

--=20
Thanks,
C=C3=A1ssio

--------------zHW2Xf08qRqMoGTjHBZa94Wm--

--------------KepiRC0d3E23dnQrI8UC3UKz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCad4hgwUDAAAAAAAKCRDQXT8aWv/ug2Wj
AP4/NfBvlE4+ZJNQyHNs0ZWQvdERD+r5HLo48LCrElWIwwEAhvbuTQvy2RF+kEJ0MLOJ/rpCU3yh
4iW6ffWLJ2oczw4=
=Z281
-----END PGP SIGNATURE-----

--------------KepiRC0d3E23dnQrI8UC3UKz--
