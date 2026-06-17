Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19011091.outbound.protection.outlook.com [52.103.23.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAF28834
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781667185; cv=fail; b=Zz7ycinGerdelwbwrt8c+wIHHsS1/XvXgQiSF6fcuOCiYosHQXk02WrV1GNG05Zp5eicDB++vVWbHbK51SBOgI6ngiZJ7jy66o7Yv9EpbyeD+buma5TYS3aksvB2M5hJHo+QtRtm9tZkeb5G+TPTkaCh2ObWB18sUvJ4Mcez5EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781667185; c=relaxed/simple;
	bh=H8DV6tx7Z5eCEI4JubjQMFQc2edGcLKyJAFbyOeWOBU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KRrH3gfRMYJ0z+8J5QSaxf8JOEtWVCDrsY4uYp6HUAwStokDk9esYjLwFZLCRgU2WvNf0lx57zoucQ/Sm4xwfRk67IipSle0B5iv1EqdK5DTFijMPxg+E/HLxnq28dkrbHe/Qd1FFdutG5ISFU3+AARzSklQ2xXGsCuQXqQbfJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=K5Gqk6gI; arc=fail smtp.client-ip=52.103.23.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="K5Gqk6gI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsj36DSNKgF7CTKEii/ULjVloXl7p5462EtCmRC1oULKBRgBpAxiR/WsO3dmJULpoIAgnV0GH6o7Zbuk/DbNqlodusMOcRBmcvUowj1qfGZM84Nc4y8gXSz1mgmDK0BX3bqotk1lTtKpna4uZqVcAQnbz3AEZtH3MgBZps8Uttyk1iHDxDKjdzjevCwNo7LWqxNs1bwk36SOaysGUvgFHCgTX1nbQPv8BSWcy0oNACn4N4yyYYiyLOAuQJN7ljwznY/HBp4ZBUI0FTy2UdaShuazeS4eXBes/+OVdA6jyutRPkM1EgOps9a+CxIXHdbf81er3BIXA1dTvC32FcLIsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sreafxLAMpZBjoUzHhS69/trityP5qoOEbaG1ZMaEbI=;
 b=fcKcjW2h84QC/xJ8hc02mJ/j2JXacdiikNoUZVj4ziPSmg2p3dHOaLnfmctYgOKr5rBMy5pEYmpXpDgWqvcRKBLf8jrsG2XSPEaSCDxIzetAS92wC6cQ7D+mA4niZ5K2MbGXReLeRGdZ5CMi9aHeOTJIEOo5JRiAOha8Xje1Qr6xxeRBrl/m/UFBZ8EMOuyeeNsUNSJXaOv+RqlU/1+ipJ80CEIkZ8QoUkk6Q6mlffPletFbXEZIsMYPoq+Ex3ChcYM3EPhmR5Z5t5xx+IJ3PN4hBQ0CP26I36SPvep/oJRRwe9UdCaYWUYB4vgNwYoexIdyO8hkywyVMvPwSOt2mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sreafxLAMpZBjoUzHhS69/trityP5qoOEbaG1ZMaEbI=;
 b=K5Gqk6gIHPsC4iluV2nHrNU5Tjt5GH4MdmiyYcLwzByyWBcLi17enxCsLoP3T72oO9vTTCcL7bnb2W7ZL9OqXyrpoCFpO8mfgWL2ecsU73kQ3ahJ8i3DtQ5BNEWUKnOW8cIsYtj+snQT7C6vfeQE79N6HL5pnHmvaQ3k1Uc6E+Jfwg26eCrFh1A7KKeBTEhWIUoiCoD3ptDoYGl7acY+vPCXqc4XpGwDHRBpgJVbzei10jDMtLFshUiQ2RHa3eHXt4NA7nlCgUNqGRzdUiGopkCTNVsJ8c5WZBiSnm+zKUNgyupo/SLbEQpYhtiL6CmzWaOCGz31xgxh6tX9AyPmZA==
Received: from BL0PR02MB4691.namprd02.prod.outlook.com (2603:10b6:208:59::15)
 by DM8PR02MB8229.namprd02.prod.outlook.com (2603:10b6:8:e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Wed, 17 Jun 2026 03:33:02 +0000
Received: from BL0PR02MB4691.namprd02.prod.outlook.com
 ([fe80::31a9:d80b:2dd1:2d1a]) by BL0PR02MB4691.namprd02.prod.outlook.com
 ([fe80::31a9:d80b:2dd1:2d1a%3]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 03:33:02 +0000
From: Gregory Romano <elitegenius12@hotmail.com>
To: "perex@perex.cs" <perex@perex.cs>, "tiwai@suse.com" <tiwai@suse.com>,
	"kees@kernel.org" <kees@kernel.org>, "songxiebing@kylinos.cn"
	<songxiebing@kylinos.cn>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: [BUG] Popping, White-Noise, and Quiet/Distorted Audio on Gigabyte
 Aorus x870e Master Motherboard (ALC1220 Codec + ESS Sabre 9118 DAC)
Thread-Topic: [BUG] Popping, White-Noise, and Quiet/Distorted Audio on
 Gigabyte Aorus x870e Master Motherboard (ALC1220 Codec + ESS Sabre 9118 DAC)
Thread-Index: AQHc/f5vqcO7Kw1jM0WkTNZQ6fRbPg==
Date: Wed, 17 Jun 2026 03:33:01 +0000
Message-ID:
 <BL0PR02MB4691F06726452DADEC315E90BEE42@BL0PR02MB4691.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4691:EE_|DM8PR02MB8229:EE_
x-ms-office365-filtering-correlation-id: 6fdd151d-caca-43e6-1ed7-08decc21229c
x-microsoft-antispam:
 BCL:0;ARA:14566002|24021099003|37011999003|8062599012|8060799015|19110799012|39105399006|15080799012|31061999003|15030799006|20031999006|102099032|40105399003|1602099012|4302099013|440099028|3412199025|10035399007|23121099006;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?jYsbgrnxLOiuJ84McM0hsGzwRP0kDPp2DzaSSSSKQTTApgzp6YFCV+z6L0?=
 =?iso-8859-1?Q?d6AH9e33Jp49ddAveU/TD9ftSZrNP3ti9aM6xxrvkHVtsLRkKTBoLKX8rD?=
 =?iso-8859-1?Q?m58JXDOWjt34ZcrYUKEIROZl4tEMHBIXdrrBLXI/AJE9CzVS376AA2Nd4k?=
 =?iso-8859-1?Q?bAmatfwem+wcZ7gNWMlA1rjvotFW4AChiVpKntty/Dg8ayQl0mrdYAdmkt?=
 =?iso-8859-1?Q?PfDMDjuFWps3PB4o2+P/o8PGQYF57LFEw6WPfxBtOD9z6GgF35/usPqeWU?=
 =?iso-8859-1?Q?wW3+RoXN4p0FaKXvpemjXpQJj4JRgRy//fJWO4dJMNvHt1etTuhrILKZ9C?=
 =?iso-8859-1?Q?PKf2x8DJIYhSQSnwy4t9JaZCgrE68Eyxe1NI9gzYIEHjYfzSR3nFp8kRyM?=
 =?iso-8859-1?Q?nTOKVgL0iVJbwJ8GexDOynfhXRPOU7JgOVJURaT0KCwUNHP9H3FqZ8ps0J?=
 =?iso-8859-1?Q?GJ/Y63m2Lkp+XOLU76r29QqGrpuYj9LKHiP/Bg7RfZ13GfSnHRE4JpNtz1?=
 =?iso-8859-1?Q?viMRAauoBdmi2ndYQdBFiv+/WEoUUbsa2ReBaMOG1Ye3/g/P8yrwb0iDGa?=
 =?iso-8859-1?Q?ELjfNoXIx/fMvSrnO2IsRWIXNNA1t/x4RMIuloKqEisNkRgngSktWoNOlq?=
 =?iso-8859-1?Q?9WcvXliePAqAZrIy9x0V73YpEmvi1fEkjPgbR/pfgMt9Gpuw54527i5Cvs?=
 =?iso-8859-1?Q?12iQvT05t8t5h99gd+VEYreLkJS/t38TXBlDf+Hzp8Afm2hkG1lK0NyJ1k?=
 =?iso-8859-1?Q?HF1pCoJo8GAts6sh/bZBhRYn4uvtnyrn7DDs/VyJ3hYCgZPt8LwTiq10b5?=
 =?iso-8859-1?Q?QtMG99lIxEupNhS1ZBtug8WrxVS5c0t2enubXHbG6pfo5P78haVEAZHwld?=
 =?iso-8859-1?Q?5Y5CZnbGZz+HdkEu+6pajotTGzgJkCl7PZpbDyRed7UfUiKKlffEnoViuc?=
 =?iso-8859-1?Q?UK0EyilykzOfmuBWeggU6CRlEEZK9aNkj5NQc/wsEA4Re8qddiFrcMXwD+?=
 =?iso-8859-1?Q?M7pKn3kYPnr0Y/CO1/+1PQNNzxd+B56DBZqKAGJqElvoeYxmEZo/00HZsi?=
 =?iso-8859-1?Q?qvgVIBSauhZiN52pINE98fhiLDHF2VEKrc67WXloQVn3Gm2h3OfQ+3JMYl?=
 =?iso-8859-1?Q?yn6ymyqZHuDAvGFeWKfnyjaLs/hArsKWRUXUSjCBQb8+PMsJCtVwgFJdYE?=
 =?iso-8859-1?Q?sbmMesEZaqcfJEQjrPhCAzSZMPhfjDweb+I=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0Mdl+KXHUkXyUEtz2OWhh59QvovTk3kPtn8GhOzqng4EbI/Uu/rTbSLPB8?=
 =?iso-8859-1?Q?njVcAHapVIuFwPGwjGJs1B5Xu/FUFY4SzUUe4ajZTUPXe3OG2HQo48G3OC?=
 =?iso-8859-1?Q?56OlpT+PqbGtSvPH/v3uHZvxWBwJCAVw4TjVpGfGZdimgpMekRi16nQ2Bo?=
 =?iso-8859-1?Q?UQkLaTmGeXOSONyBOB3cI0JWMcyJxR6XSSqccIzcSZOkuiGfdjNrSxhGiE?=
 =?iso-8859-1?Q?GK+Z8XSaqoH2BxBsGHccGudijVCLO3B+YZq86irvGM/ZBApHMCOgyc7//t?=
 =?iso-8859-1?Q?fxPdLOoIFepr6wggaO5JpQEYox73zCD45ODQNDdKthZZA2RSIEJV4CqbGg?=
 =?iso-8859-1?Q?7IW8GGwaUVafUvCX/rtKNbfYnqZ+NcCrfsXUK1rIFpBp90e79byuUtzhWX?=
 =?iso-8859-1?Q?BKSRf/xDYk4J1OcVQJQ351/Zex7E22j2fak2oGr3NnB6gmS5RHdy39o3pX?=
 =?iso-8859-1?Q?OOSemnEiASg63doUmyha9B6EJtlaOfGbbBiPAVRXJ+BcM5l5KEaU/pEGIp?=
 =?iso-8859-1?Q?cce1cQBfNlgPofnNI9s22CWlBMenwKllvMArUvC+qbbV4riyOUhzHejDAI?=
 =?iso-8859-1?Q?qYLZX+wRRDzuXjOQ0aCM7fZfgsiiftmwCg03P0vW894TOZkcgj7xHvEcfT?=
 =?iso-8859-1?Q?pCZ0FQg3GfIDVtlp3NUNQj5Mg2fJxJX6t3e4fhlqo3ktgFrjKlQpK3Jk/+?=
 =?iso-8859-1?Q?FWBE8CAisy10G+9KrttUHWWvi4XJ6VQjvlRx/yT2F1cE/vvliSAnpof+JH?=
 =?iso-8859-1?Q?VXvxtsystsyAIWJjdZ2edMkXg0Wzx5QQbKMOPZ0WWklohzUb2dOPu9x9is?=
 =?iso-8859-1?Q?LWMyZOUueykaAcsfdPSvetF29aV68DL4SCzbQbWG5TXY5BAzd38E3S0/GX?=
 =?iso-8859-1?Q?ayKF59hKIS28bUXm/O6GdPLtamZrM1gHWEh6bOkq6S22I2URLgAHK0ZfEF?=
 =?iso-8859-1?Q?jixsNLyi75gGRVrqWAlvC8vUKv1KI562/cA0RsHiDkFggExeCyx0GgthRd?=
 =?iso-8859-1?Q?lLUZqGMfh0QIx53u42AvHixkUwq3xTLbz2mM3pByA6ynK0XjvqZO96CUO5?=
 =?iso-8859-1?Q?RVV0rkbmFfxMly2Ls8NQupTc3rL4vdTK4ELnRjs9GJAxlusXSDGygLhGDY?=
 =?iso-8859-1?Q?M1Mv2qJVLV8+F6EaDW8a/z7rcy4NK0ulciJR53djGtPzRwQKmhv65Z4Yxd?=
 =?iso-8859-1?Q?+rRwowAXELRckjaKOl/puSwsLZFenogEK513GiG2VSFT6tO7l32eGhLXP3?=
 =?iso-8859-1?Q?kV6EsqfLcRWjbSVmyUHQoNP/oFwK8HeJVFZCP+13L32lgSLpa97OTjsXIk?=
 =?iso-8859-1?Q?vI2/2tluUDArV/D1Uiwfp3Nn8VmvGMUnVACDieP5tNlo50897gH06j9FXN?=
 =?iso-8859-1?Q?KkWj3f2SHTyJidzJaWu9mdU+X7riKKexxH5cys2dZRyEF64w1x3m145ALL?=
 =?iso-8859-1?Q?RathMKhOkrJRoU9qvoMUN9nE0880gA+PXUrHhvedE2nWn6CHmoMQKg6ZLn?=
 =?iso-8859-1?Q?h6/VS1842qVSNGw+M7Mrv3?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-cd312.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4691.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fdd151d-caca-43e6-1ed7-08decc21229c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 03:33:01.9703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8229

Beg your pardon for any mistakes, this is my first time trying to contact k=
ernel maintainers.=0A=
=0A=
I'm reporting an audio issue on my Gigabyte Aorus x870e Master Motherboard.=
 I use headphones with the rear line-out port on my system, and am experien=
cing persistent, steady white-noise static layered over all audio, with pop=
ping triggered upon playback and ceasing of playback. When there is no audi=
o playing, there is still white-noise, but it is much fainter. Audio is qui=
et underneath the static, and becomes distorted if you try to turn it loude=
r to hear it better. =0A=
=0A=
If I try to use the front headphone jack on my case, I get additional inter=
ference-like sound; I've read that only the front headphone port uses the m=
otherboard's ESS DAC.=0A=
=0A=
I attempted pin retasking using hdajackretask, modprobe snd-hda-intel optio=
ns, and altering pipewire's configuration, all with no results. I have reso=
rted for the time being to using a USB DAC that works. I've previously crea=
ted a bugzilla ticket, but it's been a month.=0A=
=0A=
- Kernel Tested: 7.0.12-arch1-1=0A=
- Audio Device: 7c:00.6 Audio device [0403]: Advanced Micro Devices, Inc. [=
AMD] Ryzen HD Audio Controller [1022:15e3]=0A=
- Bugzilla:      https://bugzilla.kernel.org/show_bug.cgi?id=3D221500=0A=
- ALSA Info:   https://alsa-project.org/db/?f=3Dc78cbe1739758abf0cfcf1aea15=
3543724dcdd79=0A=
=0A=
I hope this information is adequate to begin.=
