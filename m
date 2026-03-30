Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazolkn19011004.outbound.protection.outlook.com [52.103.1.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B5B3D47BB;
	Mon, 30 Mar 2026 13:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.1.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877908; cv=fail; b=HGFqMRnEzB7Ri9LpGGD+Z/KNvHaBYJb3+XwsJJxS6e9b8NNp5i8zLsZYVTjTIIWDelOLDRekq00cqTuh6fG5L+F92/e6VM66ucfIqlq7iDWqJx4aUTPrYymGQWQxnaWyrn+91uGJTsm6xLiv3bfooeWxblh2jjEfwiaUc79RnYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877908; c=relaxed/simple;
	bh=ysjnp8vKvDNcT7LENKCcpo7mqrziAgitjszkiCdugms=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sZ3NvnpPivRNuKxTqchnt38Smy5BnBOBxv75zT/KnLPwDGlAi41EqnaTBSMVMvEaDkWLzonSWPOTxqzLcg4XVt6tnpJDk6o/WhHXyeOWaEtstKr5EUrVyNVoefrSn0syabnA4ne/iAOhrfiMYnJTZzUU/RGL6OjJSRbYw++tq8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=fcHQka9V; arc=fail smtp.client-ip=52.103.1.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="fcHQka9V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZS0+4QGmG9ubm/fL1tDkG2ovp9hlwvLQuljO/mhyMPV5uwh8YqZE+Hs+LkQeE0qkzhlPqEm7f6hQMZZ6P9V8XsbUKveAM99jItiZ6MMoZ8k+HL6HOh2Kn6j9fPI3SC3lRD/JEPlUSSGRHMeHxzbBO2+kwhH8ll1M3PMsoHio2Kmv3kbPtxdK0CwwtneaxAxiIh+uY4AWI+5LBF+stBzaVa+Vj/Sr7eUkh16WMcWhHNxJS2guePCixm+9d6scPXxDRjU94Vli3hHMvPdW37JiQ01wXtSJp0xafbD5RwEC/rppj4jdDjsNP/+goY51nWUtym3aoh6bPpg/r9OQFnQ7Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqGeVohS3U6HNQIdr530oYZV4NDwrdFM6b6MSEAznNA=;
 b=ZIeEGTJjobQF+rdv4dCl4o1nHRAx5x0xu2GH2pPLT+O5i7WsBsbhzQsHO42/+3QjUBQgPa7RbusmWYnxemO/nhlYmAjDnDeCFEeHpiZ/CimKyYkvxdA9Gk4bL3FnTFoRxX32p/+ahDf4icPJ2akygzImsqGjuE/uEIbJPntRDl70KKrwNLJMBo7b5NUdKolL8Crp5EJQQfLcfqsEFxeajAzAcszMWWk3nFEy/vCDIlgJaNzdsastSkb+/K7dXh+wjfUk2q9cAYPaOzUXCHs4yCd/vAWlvEh2nQCZ9hrQyLwbJT2frzbDrGSJAxB8ClU8m1aNIrNi4yx8DskLdaz7pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqGeVohS3U6HNQIdr530oYZV4NDwrdFM6b6MSEAznNA=;
 b=fcHQka9VfODvcpUGmcbhMJgUNDWLNswWvWn/hcVePeznXSIFlNXavtqNQMUQTAdsz8ItTVWVVqYOV3eYrT6ujKnBG3isr5/9NwyzyTDQrErxYSuboZETluK0Q2kgsTxILHfYxKPg/sUfaa4iaXFM45hYYx8DJ6xHwyFHE11IonRXtrNxOsBTlGqFGmDJmSRMG57xsJelDVUBjUhv30bp4RcSqLAh9zBTJUjJm/MJR9Oi8OVa3yMxpLNhXWDQ8KHjgXNRAPlALcfGdpKWhqrjiKykj9+e/A8tr0uHtQfxnbHRZJgzoxYraqcnhPipGPHKgk96YBtzqskLW2TXHBkoJA==
Received: from PH7P223MB0552.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:1b3::14)
 by SJ5PPF8C2F678BA.NAMP223.PROD.OUTLOOK.COM (2603:10b6:a0f:fc02::62a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Mon, 30 Mar
 2026 13:38:24 +0000
Received: from PH7P223MB0552.NAMP223.PROD.OUTLOOK.COM
 ([fe80::c8d2:d013:f3ea:a03e]) by PH7P223MB0552.NAMP223.PROD.OUTLOOK.COM
 ([fe80::c8d2:d013:f3ea:a03e%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 13:38:24 +0000
From: =?iso-8859-1?Q?Gilson_Marquato_J=FAnior?= <gilsonmandalogo@hotmail.com>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
CC: "Vijendar.Mukunda@amd.com" <Vijendar.Mukunda@amd.com>,
	"venkataprasad.potturu@amd.com" <venkataprasad.potturu@amd.com>,
	"broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx
Thread-Topic: [PATCH] ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx
Thread-Index: AQHcvxwREdil+NJ1g0qYzpmt4T8b4rXEycyAgAJL+js=
Date: Mon, 30 Mar 2026 13:38:24 +0000
Message-ID:
 <PH7P223MB05528B0777B09CCE2DCB7DA9B352A@PH7P223MB0552.NAMP223.PROD.OUTLOOK.COM>
References:
 <PH7P223MB0552EDAF94ECC3D28F066E90B355A@PH7P223MB0552.NAMP223.PROD.OUTLOOK.COM>
 <aciOxZ-3YSnmsxlc@geday>
In-Reply-To: <aciOxZ-3YSnmsxlc@geday>
Accept-Language: pt-PT, pt-BR, en-US
Content-Language: pt-PT
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7P223MB0552:EE_|SJ5PPF8C2F678BA:EE_
x-ms-office365-filtering-correlation-id: 52228d51-6116-4674-e8c6-08de8e619db8
x-ms-exchange-slblob-mailprops:
 P1EfU6pZOd8VPwDsmXmpSwyPl9aRR8R+72daRbz6pc1U3wCDPX7pN4HWcrrqot7iAkT5aSM98YX/dSnqm/OTDdKd6yH2MT4ud5AJM5CRPMO3i7DtkcfBNKNjTqlga4MbPgvOdrwXScKwJcj5HM+OVHtlPpQxHHX1bHn0rTLP3N1yhbmjXAqUXA1hbqb5htxiubHhbBAtX4u2+3dD1tY2cRWMIA2SvZe1BM9sMZQKw2ycuoWKxL2/ot+X1WFGKFGfInVdJFPCvu18QGV7ECFWEg4cLe4jMr622tTbbPabcpxV/57BV9y/o0Iie81mMp3hJY5EjI3nAucSHpf6i95jyqSyLmglqA1Qm87+wlFs3H1TwN/K5QBw59q2+Nh+W3HqV/DiqOHpVferuT8VeZBeFkXt12j7rwS4XZoxyBxagXdNf3RHH7fhzK6KzoUBpzvt8v79InHhO4Z7h9vZKXg0dYGm7ZTHftOgbVGL69JWuxLPfvLAMVnqfQ4Vy99cN/ruc4ZDzSnfIeQZqanvwM1BAFHxz0H5FI6HNFMyDD1LzKdA+KES2zNlR0X5qk8kiQoS57vtV6XbPJsWHFKKoX6X5NxTQzxG3u0U3IP+OWscCK4HWq9amisdRMBBjcZanTjaEBarJgJGKSRLKeCrtMv++7peQubGADvDSTNDMQNXbMtRkYXjKhIAelCZEZyMnSTjDB7M5yiFcSZ2F/ZPk18avJJVfvbkN6vsKVuZz2CTSySagtQjoZbBvCZvSZ7mtb66RQ8Ge9GDde0mM0En8knvdFp+llR7LTsO+laH+1d/DU5qpVbRdjt5xA==
x-microsoft-antispam:
 BCL:0;ARA:14566002|37011999003|25031999004|51005399006|1474299035|8062599012|19110799012|461199028|8060799015|31061999003|12121999013|15080799012|15030799006|3412199025|440099028|102099032|40105399003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?JFDpTqeAGQ/ffUdPStxMLFglbURHF0yJ2tY951oiw/mR4A2eXk9VlgEpvb?=
 =?iso-8859-1?Q?UYu8MNQXFADlTfvvBVmQVLrE/Wf7fy4L3GNpLX3e5czdlHLbuXEo9rQ0QK?=
 =?iso-8859-1?Q?jIYviZKb2+DxvfZGFdLJyLx8ncEngIYJ3xfHinJHEe0iX9kTTww9OfsEEg?=
 =?iso-8859-1?Q?bB69cTuu0IzzE9tIDWRiMQ5GXc3L3aEpOUvBK5FNNUd5yrk2sAjly0yetq?=
 =?iso-8859-1?Q?hcOPSigr7So+/SFSD4fiEzzkSofaD+aJxPMNsDpI2BLSwOn9SWaz9pgyMU?=
 =?iso-8859-1?Q?9M/vykUf7PyuoIs8qVl9jKITCsqdyr4L1xzyc2/Vx3ssmxSpPUDTLe1oOa?=
 =?iso-8859-1?Q?jS4jA9hBgzYhMgxz7v5wlybqv+sZz6r37AZnbmu9HlP4Qp3SnWbtBb/hO7?=
 =?iso-8859-1?Q?NtBfsq+wtwWAwkxu1/KKgD19CPOzfYm561i1+Cohan15neREoRF0HGfhM2?=
 =?iso-8859-1?Q?KPOEIblEp5vOfKSs9yp8RTBtdmYg9DzaU1arXCOqNlPx14KNno3ekxhkBF?=
 =?iso-8859-1?Q?OQtSwbgA8mGmyu2zTCPEIAbtgFZT1t4GO+h/5Ml1GdoZJKwO7cxFznJeXs?=
 =?iso-8859-1?Q?v8JcBTO2FGxOC3ycAdaCx8VM3rQhP86KhNCMjloAVs+ubQ/8zXb8vph74a?=
 =?iso-8859-1?Q?xP0skF/hN62ESup471ylo6FMh39Reh6jvEXpdYWRilubbZALp8qO7yvmMj?=
 =?iso-8859-1?Q?Y6/9y/N1qotqjxWpSrU0FB+jumCoHBr//hKjpuGPmdlx3jvtAtZyE2CqFp?=
 =?iso-8859-1?Q?piv1REOOM9xh59/vSKRXyBh6ZFUkwARZXVW52C5DOrtaL7CBzy/B7nrjsA?=
 =?iso-8859-1?Q?HMMEgYvpMd/Gf0494ds5XyKSuPOQIX2Iw96mWFwoYHUXWI15N6QgdF/aFo?=
 =?iso-8859-1?Q?JmqMvrAMnYGZ2thOATs7QqVQY21T8cO/93et2Ed1J6BPoFpK9hKjnWhfX5?=
 =?iso-8859-1?Q?b7EEF35EaAUiHs2ER8ipn5TiD+1Yd0bdtN4vDcDPfkvox6oTzaBl/SqdSv?=
 =?iso-8859-1?Q?5vDy65GI7lmhlZqENuBjR360wDuAAO988RMOokES3baacuFAcxjGKllKay?=
 =?iso-8859-1?Q?ewSffOx7/ZWoWHNmWOSy8Iv7eYdEiaIviVHKlqWZb/3H?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jpl3UQvT62eHqbAmmn4QgeZzdo5n+22FlY6EIZELff7if3zQDben+X8UT3?=
 =?iso-8859-1?Q?GrKGRII5Whcr6e3QfckKI+FF/MDoR1GNkxGKAOZaWu/t7b5tLm34hAlLa9?=
 =?iso-8859-1?Q?2v8i0qC+1+ZpCcBuDOPABZHQv1jO5cUezYjyAqhxg0SkC0m2gs3srDJfpS?=
 =?iso-8859-1?Q?5Hfzsphwmsy2P+NERZoMebcssq9PW9TNDQg5WX5pvkQeEjLAKv0mXtnwvW?=
 =?iso-8859-1?Q?k7BbJW12nRnYrcxlkHV3maiElnJ+a+5zOw/L5GmMvxtgPgQivWFLhmzHFr?=
 =?iso-8859-1?Q?5LHfvhbpA2FULc4VVR307s84GXL0ukvk21tpeLbyZyvT2hA/ofhh//yNG+?=
 =?iso-8859-1?Q?fWCJogZ0JgSJIKGxiFxgWCJ433A3lDMnt0MBTA2cyJgcPjQPEhA0YaeT3o?=
 =?iso-8859-1?Q?CNPo8aFICO6wibCU61Gqg7sjbmimUeQkm347DKQR1XjpkaHUpUqQbOnoXP?=
 =?iso-8859-1?Q?bwLmdhbp9GnFaiCZD4Qktso374fCrY4sw50Jx0mgeai0Lkj9fVNjKIovP2?=
 =?iso-8859-1?Q?pknAn3hlAXQTnHVEE0FbUWZRxdqSmxn82kujxES1t0P1sU+Vd/qlryPJy6?=
 =?iso-8859-1?Q?hV1rAR5YH3z1QAWeD3ZmsP7vqpT7zdhDTTfgcqIIsYayIfQ1ER+9fAOU7z?=
 =?iso-8859-1?Q?eOXTb1yqje0HSBVxOJCopNTcvQxRxyMJYS2RkYYeqiDviPsFgAkSd/pr9+?=
 =?iso-8859-1?Q?tpF60XQCghkxDbO3+J4cPDFYq1i4bcKGeMTxHwkM1yd12mOCDfGP4Pq1j1?=
 =?iso-8859-1?Q?uLB3MbDOWaeh0PsGqqmV9ggVECvuOTU/dcSnabXTLdF+l2esH/+93x4j9h?=
 =?iso-8859-1?Q?ff7QgXuXzoutHR78pKOu9S1AkrXQKHhRWTLxEZ7t9Y85GyGHgenIk+YO/s?=
 =?iso-8859-1?Q?boLzTIENDZ10pS0RCPy+LT9KQkPeli71ggp30iQjBX1+ixQmUclXA32QLA?=
 =?iso-8859-1?Q?UZT5rVxoMXZwzuHEosv8aS6TtS7V5YKpTXi8gW1arn8ViuMG6hIN7uJSqA?=
 =?iso-8859-1?Q?wIW/C1XC6qrTVUB8JQ0Po2fLA2a+zp2lvuVTI1ppr5qea4zmyYcbncNZyQ?=
 =?iso-8859-1?Q?RuI+ahcf+oBpgj4td5qgNGPK9tiCi2r3/g61Wa/s5X4f/jqMhkrT3QGkYD?=
 =?iso-8859-1?Q?lCDMzVmGlYNgqPeu4cVdaBFtoLgIqO/37U5wodUlQ9msWGqF/PSkzZdUQq?=
 =?iso-8859-1?Q?eimOSCiuFBmPmT5bu5B2dk4cfT/U2znq2AH5nAUldD861FXl3Yqkk0gf67?=
 =?iso-8859-1?Q?laDFRApctdGn3I0YKVAB5HWnP1fc5JtrQR49MVXEbsVWj4B4CpoMECUYkz?=
 =?iso-8859-1?Q?eqm2Q+74O09mUnHmbcPeaGYg+bKRow5ibK6f0Y22hiIUxyEDYFmRkvrunZ?=
 =?iso-8859-1?Q?S5WjYwmOVLS8EmYsch/nPu9S3hc1k5G2tU0JUUJjCyJLx8Y/m66EMeq0SH?=
 =?iso-8859-1?Q?gXoXghWjSQ/6ps+W?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-583ad.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7P223MB0552.NAMP223.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 52228d51-6116-4674-e8c6-08de8e619db8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 13:38:24.1708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8C2F678BA

Hi Geraldo,

Sorry, this is the first time I'm doing that. I resent using the b4 tool, I=
 think it worked now.

Thanks,
Gilson Marquato J=FAnior

________________________________________
De: Geraldo Nascimento <geraldogabriel@gmail.com>
Enviado: 29 de mar=E7o de 2026 03:30
Para: Gilson Marquato J=FAnior
Cc: Vijendar.Mukunda@amd.com; venkataprasad.potturu@amd.com; broonie@kernel=
.org; lgirdwood@gmail.com; perex@perex.cz; tiwai@suse.com; linux-sound@vger=
.kernel.org; linux-kernel@vger.kernel.org
Assunto: Re: [PATCH] ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx

Hi Gilson,

On Sun, Mar 29, 2026 at 01:34:16AM +0000, Gilson Marquato J=FAnior wrote:
> From 37071560173aadb81a52ae2ba1587b6581e1164c Mon Sep 17 00:00:00 2001
> From: =3D?UTF-8?q?Gilson=3D20Marquato=3D20J=3DC3=3DBAnior?=3D
>  <gilsonmandalogo@hotmail.com>
> Date: Sun, 29 Mar 2026 00:22:03 +0000
> Subject: [PATCH] ASoC: amd: yc: Add DMI entry for HP Laptop 15-fc0xxx
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>

On first glance it seems to me you have copy-pasted a mbox file into
your MUA instead of properly importing it. Please fix and resend.

Thanks,
Geraldo Nascimento

> The HP Laptop 15-fc0xxx (subsystem ID 0x103c8dc9) has an internal
> DMIC connected to the AMD ACP6x audio coprocessor. Add a DMI quirk
> entry so the internal microphone is properly detected on this model.
>
> Tested on HP Laptop 15-fc0237ns with Fedora 43 (kernel 6.19.9).
>
> Signed-off-by: Gilson Marquato J=FAnior <gilsonmandalogo@hotmail.com>
> ---
>  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.=
c
> index 6f1c105ca..4c0acdad1 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -45,6 +45,13 @@ static struct snd_soc_card acp6x_card =3D {
>  };
>
>  static const struct dmi_system_id yc_acp_quirk_table[] =3D {
> +     {
> +             .driver_data =3D &acp6x_card,
> +             .matches =3D {
> +                     DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
> +                     DMI_MATCH(DMI_PRODUCT_NAME, "HP Laptop 15-fc0xxx"),
> +             }
> +     },
>       {
>               .driver_data =3D &acp6x_card,
>               .matches =3D {
> --
> 2.53.0
>
>
