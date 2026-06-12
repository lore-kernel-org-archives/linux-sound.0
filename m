Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541DC37D104
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 11:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264683; cv=none; b=Ccid/VayKn2AliToGfPLZ9bRfcKStmgYKVkuZ/Wiuj3vvAKoCyeTQ/+6PMQqhfJABy2y4yFgvPAWS1WxHrnIflY1O8Wy7/SwuzZPJfL3yQmV9FlHDlY86+SOJ04cyI2Aax2jk8kMwj2ZvK59qER6J8skOI8G/45NsHhLzykiBjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264683; c=relaxed/simple;
	bh=02EMTrGqwJRz/35WnrZI6ty2oJRuQvaqYSQRwo7jEHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e+33JFiHuZLAA+rTg/z5qAe7s+kFCRklX8TKH2K7Msyq1IL7RV+Sx9ulfw9CxE1zDF1Qtpsgji77YVISeS0OwlVhasQNmOJj0sB43j8P2XFgaHDr8O12HZnMiM229jEZ1oRqumnAmucFvFsRwupASGWRKDZtaxRparQKeyMvves=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fasz5mke; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fasz5mke"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1384ebe7a10so557401c88.1
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 04:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781264681; x=1781869481; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/S5PGEY9gZoBURauCVph2ZL0Va4MAdVBTW3eVxW6fg=;
        b=fasz5mke6LBrgKiF8CNtHpOfBiW6AsxgatbOmjQ3QoButLBVyjAPOae1e7t2Q/xgvw
         kaLVZhVcqL9FebNu4jtLC6N5GjUaOQP6xT8WxlZjD8AwDCVkBg+RXHWXEYf2D3AjQ+vM
         ZkJ1Lc6qFJkQocelfH5WpIXxHOAB8t2QtTc1PixPphiPr/CbagWwSpSHAvSfZBG2RDFC
         QdwSgnDzyXoh1P9mUYeyTe/JBbLaLuM8tPRf57C1nEFHUrHRMD5TN5khCtkxUcNdr/Vm
         NHkR5WgiZGg5ZlHPXj6DMlJxAQOmSOCNVcetXUvluPtKBYX8IYPySvpslZj08QqLSbwS
         qg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781264681; x=1781869481;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L/S5PGEY9gZoBURauCVph2ZL0Va4MAdVBTW3eVxW6fg=;
        b=V5bL2RrcPJvQPVIqGuEqz+BzAlleWq4+MWzRKJbItck9aZpxJt00bYavYKnCyiuNli
         mpR5KEFXaclQwx5FniT9awPaLXnZzBo7JOzZXhVw0x64VikN5B9tEsCdV7t5KKLw2Lbj
         OJ8KuLI5D+jjkz7XstBgnTC2fO+5hYkgYugX/Zc/RXkVad4JFyTYxrNpfN2PCWddtzt6
         hOSPXAjdW8JROQw7F+DgyFq37Lc2zlNHsFYcOIkBQHcFcUSloDLjWd8W8pQi5BgVodys
         IquimODasdQZ8N+dFPwA/nQt+2q0RHyxsMPxOYg3HQ+G/QfeGGaql7CO/ZGQgAo/eP8g
         XTBw==
X-Forwarded-Encrypted: i=1; AFNElJ8tFV9I8ySKo1dBBAy6Bke8OpQdaZZrcgucCRHQ4c7mpxbA+UICQOKN9UBdauKQGnB+GwTLx94DwRrWDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+DA7AchWMo+tKHPxIuW3IqqSrIYXqRWtTD049VfSIWFsxt9o9
	p8Q8ZlhIRPfWcNy8b4nP/8C9ea+5oxAZprUE+qDW7p33qpB5bxElFLj9
X-Gm-Gg: Acq92OEbGDzAvRWwY1pAlbkKsNyh6UqkFX/aHuXvmRvFtrXCLjF2HeR54Vfzdwxfv/T
	WddTybDaFj4sWyqkEWgIo/eDXp4HjgSrNtce3iCOCF37ifGXqqfj6j8y7tpAAZomkbs5+5ugW6e
	qwyQr8lhz7pam5jgmZ8l50TYKcpljnFnMQ0LjzzOsC8RWuHefibTsDw3YSCpeDaQUeXB6ewBDsa
	+uO2WDoDhJs8jW42U/BciYijST/BX2XduHB/0iVx0f+YDYXCkCrZRFHM6Nzqs8wWHdOLrGkp3pG
	hQI6sxP8L3vX/1Iwatqs9evJJlBV38j8/u0sU59W3VeKV+XtNsDoqpKAndM6uT2gW3+60FGlYhF
	QcC2Hm7CChOgJEjidkYX6KoGWoi5GvlDVmr2PFBkaDuLR8OV85DHTNWRYyFrkP2MLTkHcuPhALl
	MrCaRhTifNb1I05McihlvXYKv3EcfbDtX5mZg0QBEDtI81+2T9LhmPo7KIJ01WCSnmRKdWPT9so
	Q==
X-Received: by 2002:a05:7300:d4c7:b0:2f5:3641:f126 with SMTP id 5a478bee46e88-308201deb64mr1332952eec.24.1781264681104;
        Fri, 12 Jun 2026 04:44:41 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5fefecsm3182455eec.13.2026.06.12.04.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 04:44:40 -0700 (PDT)
Message-ID: <b92f04fd-3e28-4ce1-b6c3-b371f4cbc648@gmail.com>
Date: Fri, 12 Jun 2026 08:44:34 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] ALSA: Consolidate CEA channel allocation data
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Thierry Reding
 <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, notify@kernel.org
References: <20260612-alsa-cea-channel-allocation-v1-0-b1bcbb6b1051@gmail.com>
 <87ldcki0k3.wl-tiwai@suse.de>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <87ldcki0k3.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mSCLmRCv9RqdPoIe6T4pH9iC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mSCLmRCv9RqdPoIe6T4pH9iC
Content-Type: multipart/mixed; boundary="------------MueHiew5emScRGiYjxvoHacS";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Thierry Reding
 <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, notify@kernel.org
Message-ID: <b92f04fd-3e28-4ce1-b6c3-b371f4cbc648@gmail.com>
Subject: Re: [PATCH RFC 0/4] ALSA: Consolidate CEA channel allocation data
References: <20260612-alsa-cea-channel-allocation-v1-0-b1bcbb6b1051@gmail.com>
 <87ldcki0k3.wl-tiwai@suse.de>
In-Reply-To: <87ldcki0k3.wl-tiwai@suse.de>
Autocrypt-Gossip: addr=perex@perex.cz; keydata=
 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

--------------MueHiew5emScRGiYjxvoHacS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi, Iwai-san

On 6/12/26 06:13, Takashi Iwai wrote:
> On Fri, 12 Jun 2026 06:53:22 +0200,
> C=C3=A1ssio Gabriel wrote:
>>
>> HDA HDMI and Intel HDMI LPE maintain separate copies of the ordered
>> CEA-861 channel allocation descriptors, ELD speaker expansion, and
>> allocation selection logic. The Intel implementation originated from
>> the HDA code, but the copies now differ in supported allocation ranges=

>> and fallback behavior.
>>
>> Move the common data and transformations alongside the PCM DRM ELD
>> helpers, then migrate both users while preserving their established
>> behavior. HDA retains the complete CA range and channel-count fallback=
=2E
>> Intel HDMI LPE retains its CA 0x1f limit, ELD speaker bits 0 through 6=
,
>> and lack of fallback for incompatible ELD data.
>>
>> The descriptors and their derived channel counts and speaker masks
>> become compile-time constants. This removes duplicated mutable
>> initialization and provides one authoritative allocation table without=

>> changing the existing allocation-selection policy.
>>
>> No hardware was available to test this patch series.
>>
>> Signed-off-by: C=C3=A1ssio Gabriel <cassiogabrielcontato@gmail.com>
>> ---
>> C=C3=A1ssio Gabriel (4):
>>       ALSA: pcm: Add common CEA channel allocation helpers
>>       ALSA: hda: Make CEA channel allocation interfaces const
>>       ALSA: hda: Use common CEA channel allocations
>>       ALSA: x86: Use common CEA channel allocations
>=20
> This looks like a nice cleanup.  There is similar code in
> sound/soc/codecs/hdmi-codec.c, too.  Can we integrate it further in
> future?

Yes, absolutely, and thanks for pointing that file.
I'll work on that.

--=20
Thanks,
C=C3=A1ssio


--------------MueHiew5emScRGiYjxvoHacS--

--------------mSCLmRCv9RqdPoIe6T4pH9iC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCaivxIgUDAAAAAAAKCRDQXT8aWv/ug3V5
AP99eTDpoCnByJwx/MIRMuk3mFaN+LHcjGBudQVwRkIB5gD+IFx+oOCrmEXU89V+1HqfBMj4xClv
DqfTU4xvr4ILLw0=
=Sp01
-----END PGP SIGNATURE-----

--------------mSCLmRCv9RqdPoIe6T4pH9iC--
