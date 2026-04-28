Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ACF402B8A
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 12:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378391; cv=none; b=VGbPsG8JvaraHmTLjJK5GOhPQO3Z8FFxkB7jAkKawwCb55KBo4D7wmK/mryf/K8Dujl/wk7tKHy4KiVGLE1RWyThMdFmQKp8VzW6Z1Ji39slbCVB79luML/Lsx25tbLO51dJ+Oz3vYOG4ex2EHzRtqo6PN3BLEGw1lSktr8IsrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378391; c=relaxed/simple;
	bh=XFzufhTaMWTolGojSbMb3qJM+WyCcx8sVwhkI+IC20A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=dyr2egklYg2CPrEU8EQrqornPzSoyHNp5n0siFInSWh2+7ekRPGWyPYkcDjMeD1WzOQLr2DAyqzMGcRkWd4hkbdgn44a5sSIwA7byF1Saz2JTC8r1Ge+Dd9c6YLdm2H5k+YMm17yPaemidA+gsXCC7GT/J2AYohp8vxRebvvRr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddObvhFz; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddObvhFz"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-651c7ddf514so10296884d50.1
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 05:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777378386; x=1777983186; darn=vger.kernel.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64jvgKxRvjKTmLtVQgGQErHDJcjZHxHNrtFfbd97+is=;
        b=ddObvhFzv945YyjP4NW8wsve5usrO4vfBmxGE/3BvIB1sq//7cdcASjsAjHMi7Yjas
         W/uAa6MHqw7GeJWN/6rZMUhQRUB+Jf7afcO1VF3BJtZoKTJmt9QbYmoNsVg+hi4an/vP
         gkt0gXPPnwhKZ5YmxyY/iuxwLuIrOAFVpDtMGYxCnV6SYlziYbyJRLp21qMTNrTDW/qc
         ujn+d8sgeM49elC1bND7ukl2e0L9zt47odNxNH1r+pc/meNdWZgYRVYtqg9lQAY5j7DQ
         vuKfm0fq5NXuwEBDc30VfvFHI9etKL27l6FSepZkE05rLmv7RekPysDEKMAeSMh2xUlK
         gPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777378386; x=1777983186;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=64jvgKxRvjKTmLtVQgGQErHDJcjZHxHNrtFfbd97+is=;
        b=INrhixVzbSdN+AI8bl5f6p82bnC+lqGcQaJ3kVAfLjN7HvAM/OLaxRetCNmmwEN7DM
         jAJr0Ltxuw4erzTM9s9v8bwrtjv4mx0kWhCdWyzhPQ5bXEyLaG8QBZRJw1fsZ5E9jesA
         B8/I8zwscjhlMhOw3CQUHfug3LnQzYj9CIN0Jl54FU3VAHGj1ikpzR9WMU3EM5xfHAfg
         R/XjKy38KfrAHlaEcCACyoUjSlGZk1sPhPvi3UrXHwqHNquqFTn/H7GmM+Ydr6jCXIlU
         FEDGRlYc+SmeW5riedPbhgqEATSTJFQVmpaANc/YnpqVYiHRNKQRy9u+7MZTlfiv26K3
         KKHg==
X-Forwarded-Encrypted: i=1; AFNElJ+tjQWdIeHydz1aiR3mErlfpoEnIofcPAc+9GlyyXmhKdrPnx7VvDTf2YW5gIEhNvrMYnbvIU4Bfu9SWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkokRkQAiTEmgyLdNWh+8VJbFi7k329XXKbWEf4Zh5juqVH+6R
	Di/1fWGR09FUjQweZxFnu74cCTaIC0VPgoDsVnZeJQjokRMUrkGPXTuH
X-Gm-Gg: AeBDieuC4nd/nLId6EQPrviWCliNJ876YHLzbaUkMrTU2/ya7g2/zeKadJEHWLMPLVD
	Cs0xEQA8jHyiYAu26PEl117r/sgm3mFFxmBSVYOP/w5quW8NL/WMNGhbA7Kqyx9S3VATI49+1BE
	MVRvqOO+T4Saby7DEWz+QCdGbuaUNQrB5cBTYGvoNKHKGGgAhD8pJumt1N3MXjzJDB8AUmN8Oy2
	Pa6jj7/G6I+Wd+OFLB/th+xegMDip31CrLe67al6yZx7Y2bfuFsla9jRM5Ocl+FGBL7coOcJ/Vp
	t20PtfKUDdIpD8r1lz4x3/knoVMuq0i37QkJL+BfMHxssMeo8oSKwdLSakbgF/lnqzgGaAdPJFh
	hb1lyUdst7MamTQ4QUNFG72QeZ/0tI9IrJtC1u2ul6SqihWEdvPLGcvi+I0P8dGJ79BWeTztRgt
	k45Ozxh+QKnOS1x8xleoFl2by59raOZxWDTEipjVSMfyVIeWsbW34d5TL1ny02dgXZanczrcoE0
	eazt/HF0N4=
X-Received: by 2002:a05:690e:b4f:b0:650:4936:5975 with SMTP id 956f58d0204a3-65beeed4756mr2267806d50.64.1777378386290;
        Tue, 28 Apr 2026 05:13:06 -0700 (PDT)
Received: from [192.168.1.8] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bee2afb03sm1543504d50.8.2026.04.28.05.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 05:13:05 -0700 (PDT)
Message-ID: <2cd5d716-1e42-46c7-abbd-8d2022b9fab6@gmail.com>
Date: Tue, 28 Apr 2026 09:12:58 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: bytcr_wm5102: Fix MCLK leak on
 platform_clock_control error
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hansg@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260427-bytcr-wm5102-mclk-leak-v1-1-02b96d08e99c@gmail.com>
 <CAHp75VdMEXag0oeRd620YJn5TpgqGy4YProDcR7EZE__cwwC2g@mail.gmail.com>
 <d4d340ad-d181-4892-8f70-9b71f2cbef83@gmail.com>
Content-Language: en-US
In-Reply-To: <d4d340ad-d181-4892-8f70-9b71f2cbef83@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0Vi1iiQYsASsgylVId8zn7ex"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0Vi1iiQYsASsgylVId8zn7ex
Content-Type: multipart/mixed; boundary="------------PLRGWGMM0IFGbRsrMLuAXrsu";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hansg@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Message-ID: <2cd5d716-1e42-46c7-abbd-8d2022b9fab6@gmail.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_wm5102: Fix MCLK leak on
 platform_clock_control error
References: <20260427-bytcr-wm5102-mclk-leak-v1-1-02b96d08e99c@gmail.com>
 <CAHp75VdMEXag0oeRd620YJn5TpgqGy4YProDcR7EZE__cwwC2g@mail.gmail.com>
 <d4d340ad-d181-4892-8f70-9b71f2cbef83@gmail.com>
In-Reply-To: <d4d340ad-d181-4892-8f70-9b71f2cbef83@gmail.com>
Autocrypt-Gossip: addr=broonie@kernel.org; keydata=
 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
Autocrypt-Gossip: addr=perex@perex.cz; keydata=
 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

--------------PLRGWGMM0IFGbRsrMLuAXrsu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4/28/26 07:28, C=C3=A1ssio Gabriel Monteiro Pires wrote:
> On 4/28/26 03:55, Andy Shevchenko wrote:
>>
>> There are 6 drivers that do the same, why is only this one special?
>> Have you checked the flow on the error path of the caller of this
>> `platform_clock_control()`? Maybe there it calls with the opposite
>> event to shut the clock down?
>>
>> TL;DR: If it's a real issue, it has to be fixed for all affected drive=
rs.
>=20
> Yes, I'm going to check the other drivers.
>=20

I checked the other platform_clock_control() users under
sound/soc/intel/boards/.

The same bug pattern exists when the ON path does:

        clk_prepare_enable()
        <fallible codec PLL/sysclk setup>
        return error without clk_disable_unprepare()

The affected drivers are bytcr_rt5640, bytcr_rt5651, cht_bsw_rt5672 and
bytcr_wm5102. The first three were already fixed by a02496a29463,
b022e5c142ef and dced5a373a96. This patch fixes the remaining one.

The other two MCLK platform_clock_control() users, cht_bsw_rt5645 and
cht_bsw_max98090_ti, only enable MCLK in the ON path and do not perform a=

later fallible codec-clock setup in that same path, so I do not see the
same leak there.

I also checked the DAPM event path; failed widget callbacks are logged,
but there is no opposite-event rollback guarantee that would balance the
clock enable from the failed callback.

--=20
Thanks,
C=C3=A1ssio


--------------PLRGWGMM0IFGbRsrMLuAXrsu--

--------------0Vi1iiQYsASsgylVId8zn7ex
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCafCkSgUDAAAAAAAKCRDQXT8aWv/ug6YU
AQCjZrVf4hSOg0fiYbyOKLEuPnzMSG9X0NUXLzP1xwcN0gD+ODFvneBKwRQTIy5zK+VJLmaMitGA
x/A4CBHpiMJVqAE=
=1C3v
-----END PGP SIGNATURE-----

--------------0Vi1iiQYsASsgylVId8zn7ex--
