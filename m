Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022143.outbound.protection.outlook.com [40.107.75.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9181E30596A;
	Mon,  3 Nov 2025 11:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762169414; cv=fail; b=hSgQcMnZdD1uAI/NztRqmztpKeYYA00ouciHJ3If1x83Kb683i1u4Z210yenis2f2aF9fK4fnDvaMV5McdbaLSMNQ0sPMdr65TztQ3n0QKu00k+vMvKyzKGp+kDKzDxFPmIxz56+H0/pADwrWz8tsj2ujNRx5ls/OqYrKdhq7dQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762169414; c=relaxed/simple;
	bh=bgOmo8Iv4m6nHn8lWfCeVaL4x/94UYLkNObh6fPq9Ek=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QsVSxgUP+qFxyILghTwPR+LgePdls+SLPT8t3bzvIMm5JwGb3J2yzEFjnSLrt0WVKxD6gxLJbbl70bj4S7eBtTLQzQSO/p5qaaUoLRylFr32NmZFcPDMVDiT7Z4kcsTV9OE820VBO4UDQQ29F5uCsK6rZ3K/UdDoXaikjBdr/3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKcFpxU4vSfb8gzf0Sv26fRZjAAZ20n0pS0N2eDymXg7ksJhMYcTas6jBcO7mcLgDoGApiv96ysGU7lpifTbVSH0QGROuxdDF2hsUUA3e9Vgbz48508fUMVTrE9uoHwouDMYt60f3Z5IA6U2rJVwXt3h3K1sIxJxYMCaD4wdDXljBQXeOOzEuYSVt6ZHzTdSWseLN4Zl/fCfRN/7fmb7B/khyfFjtG7VsHIi7Srhfjw7rh5/2R/nkuz1YxazLLb2vfjqC+fnI2uzrdI17k2Yj4E3ecMwiXk4wWvy+EoayE18FHQE10QtyGVYbi7DKIMzo3u/XrBlhwzRiYqE8aOTDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soFlRwEjUq0M+XlYrZ6cm1ME1uxb7z/vxMnnOPjklNs=;
 b=l50iHrXHZhvnJqKcNlWBaFpxR0ckgkrH4xoWNOXU9aNesVkYFW/xzU7G3kyHKpftu4Xv7iYNoFrpv7ou+sx9DwwbDBhwZYlfZQXhBUomQgOSTNS0DUYWwxyekGK4USdsobryTiNRhrwz3KZE98fe6VuumxxENrhrVIlRgNnZmCjottgu/gxukZL66BxyEbTri410b95B2oJBcOmLzCo539na/U/oAQ7L8LKNnyX8umBLfsywRFKFbIv/hYQKuKaIu0R+GHnssQq29L8wme9OhAPuljpSdoni/NqtAZjcjV93MLcgPEuANKjZ3wsVXIsjYkuYXKC3cJhmmofT2N/zjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by SEZPR06MB6057.apcprd06.prod.outlook.com (2603:1096:101:e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 11:30:07 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::b19a:5df6:1d59:70bf]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::b19a:5df6:1d59:70bf%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 11:30:07 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: RE: [PATCH V1 2/3] ALSA: hda: add bus callback for address
 translation
Thread-Topic: [PATCH V1 2/3] ALSA: hda: add bus callback for address
 translation
Thread-Index: AQHcSY3fXpnPYF79REi810Kk8OFzRrTcH74AgAS3VsA=
Date: Mon, 3 Nov 2025 11:30:07 +0000
Message-ID:
 <SEYPR06MB622678E8BDC43735E5BD99FB82C7A@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20251030110928.1572703-1-joakim.zhang@cixtech.com>
	<20251030110928.1572703-3-joakim.zhang@cixtech.com>
 <87pla3joop.wl-tiwai@suse.de>
In-Reply-To: <87pla3joop.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|SEZPR06MB6057:EE_
x-ms-office365-filtering-correlation-id: 274511f5-c910-4af8-ec0a-08de1acc5776
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rXZt8KZ6vWygI+iYPHOqsNFs598Ox2i/bOHEhadKoolSdKSIYJOoRVXdOlks?=
 =?us-ascii?Q?NBvHCpAHa79O7+G7C0xXo75B9wjH5r/zwAAHcDnFppR2lY50j59bP5Bgyi27?=
 =?us-ascii?Q?hM8aWp/8BOuuJ7vGl0Z0HRr/OKXAruqyYvMS5xuha4gR0vdHW7soQVdUXmaM?=
 =?us-ascii?Q?OO3YjX49X/wRLCl5xKL41snR+Oy+HqUkJL01An87VDBcWjN0ns/HcXPjrm5B?=
 =?us-ascii?Q?N62ng+Esmi/HFvJh4Zpor0XpyUylVdJSPBLsjPD120olJsoqi4MM1BKP94uX?=
 =?us-ascii?Q?j7w3eNAFgKDjA4eSt9oKGs6VwOCUMW6V8jWruxJ+2X66OCvjeXqYd2d3Fwp8?=
 =?us-ascii?Q?6pzLyRnuin97lBezQrsZ8yxYq1MMeN07cxvx6IvTO9s+04av1IgpGiQ00rBM?=
 =?us-ascii?Q?mVb4MF9X9tvMOIAV+uHLelj/V6mT2EDX4byi4xvfi9fo1qSs0fGHKrzhg4M1?=
 =?us-ascii?Q?eAZWpfiv9SYp/FNQ8H5J9NTVbK7yVNF6QHhjLhmIbY1PriTCaqcPT6ZSvW0R?=
 =?us-ascii?Q?KNvAMCVs8/DfWSV7HRiEHt3Z3yCqoUXJ69cMbeTL5+oqnIlyDuixiQmoWAA7?=
 =?us-ascii?Q?iPwabWout4sDF+78C+tLmfB9iekOiRH4K9jqe7KgdiOi1o8ajF7bybqKs4Xi?=
 =?us-ascii?Q?HEEFQ7APm34HYzsQOlnae3B6GTRM156mpbZzt3DyEaGrS//WseqC6E3vJzNP?=
 =?us-ascii?Q?acU9FIhpSljEoG+vKeor8hjdPjyZlSPGtdHgu3e9x6tscAQrJFNq7W50WiZI?=
 =?us-ascii?Q?myrI+RsodUDc9hzgWeUe1uEiSO4zLMK3UQbE3XTE8QHw5OgBRAbdQpHH07sH?=
 =?us-ascii?Q?WWN6CghsYG11Ix9wv8QGkPqCXzYELNsRw2n/3I+Q4TDHBTYsvP/r7zrLfe6q?=
 =?us-ascii?Q?8be6j8g2RtGbEvlz1PqDNEjM7nltWGVQauOahh5hFAhSdMoZU2AqOO6HRd2U?=
 =?us-ascii?Q?liGH2OrRitQT9TywpS5Hw5LkkV8niSWRk7X72guHUnsPxp51SfeM17MeZXbb?=
 =?us-ascii?Q?RceEkb0Df0ktpKzg0sCWBwl1/rSM3RCjxhHcljYKqM/nYmn0va0dBVMmDbVg?=
 =?us-ascii?Q?igptvoVTrmQGuNT4xW37p2j2C4sx3i/Q3mfvmBMbZxtASG5vZwGqFR0sFl2J?=
 =?us-ascii?Q?WAIAjfXNrVh9k7bJ9m60emAy8ekw+4z7q4acFLynsx+Tj472JQAwMQJtnjpq?=
 =?us-ascii?Q?OPX71pqWHWopxtLSRo9e3hEZpirGA5+hio4rfdKmPF9Xx8PT8eUUIwRtfHWU?=
 =?us-ascii?Q?gOUDBwAzOuSjuNOIBY9NrZ2egFOgCQaimW9fbO7EPmW5gosRc5cPOD0FTWk9?=
 =?us-ascii?Q?HgiGaKRxAS3STu3Sd511nJJNYQV9GJgkBjtm15BFhWfNbm21bz5Db8OgQ9Ew?=
 =?us-ascii?Q?3W/kTqbUxrccXOA4koOeGJQdmsre7vN1AbuMlM7Ppo7Yx/s8xUN5fW76Lom9?=
 =?us-ascii?Q?vNJeg40PbpORfiA1n5TCoFswTALT14urcyvN9JWgDrVLtzyxBt79d8w3iJmL?=
 =?us-ascii?Q?VwVr4LRT3ZJf4cvi5BTmFe51rzJpe7x0uQas?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3aYclTPQm/YcnzzZhhykS4lwAfoTCYnTvMV3OP/lv0aqpw91grf/fJuwnIfC?=
 =?us-ascii?Q?FrNeQ/5iGB47KRC6HAm7wFnqFSJX/VpBELlCQPUOe3ei3DK122vJxKLlkUZT?=
 =?us-ascii?Q?IKNLXDprXUx/F87VC0Qlc0ZOEsDIqRchY52IcYsV7bsD3THQrjUXdHDeu2tt?=
 =?us-ascii?Q?OtNy/0A1+XvI2d2pDsN7gXXQ82DqkgDAB5QBaZJGDnvk8nSENKG4+cnMwDUy?=
 =?us-ascii?Q?RUHs6tgm51hXEce5Vr98FxKf7y4vbSpxvXARExDB+KMMbyNMOWnm2dDAwadK?=
 =?us-ascii?Q?yG/zsuckR6F8+kvHko5apyU+7NGJFiuuYjmsLLTmLE38kNf+U4hfeOsdfNuX?=
 =?us-ascii?Q?JAjWssfGgCgRY0IT5e6v1CxWYu8J6PIXEqyU18hAqeT/U5MBtUUFjlVmX8lA?=
 =?us-ascii?Q?F1bheKLZmzQ2yuHmML2sfPJ/qIBDAxqx7CxI+SpHeGJot1JqHJKme7sXzWrs?=
 =?us-ascii?Q?YtXLKdioum/OSyb9CtMqqvxan6pXHdn5zoShhifZyWHCqWPXUaZlTj68Mjke?=
 =?us-ascii?Q?g55d43rIoSi/VKaLJ5ovgCzbTK9rStNgUj99Z8wAz6sdhijtS2uPXEFC29aa?=
 =?us-ascii?Q?CLeiQRwBmyARQeNxqWAaK0M6kUZH34xBZACZLclSmvNoyGjJjPUONTMrvQQd?=
 =?us-ascii?Q?mxdCYiEGZcR7c7vatl4pWHE1+cb1mf/fuiemQ0yr4zt9dEUToLL3nxP3/8P6?=
 =?us-ascii?Q?R4WPs7Bkl6UfG61AA4S87wqVqIdJxrC5zgeZlmtRc9tTcVq4s7cS8MsesA5y?=
 =?us-ascii?Q?W3VF9sm+iooB9Ep2HdPHx+KB/O7KiT5eFC/bM7ODrDGPPLfOshOVSriiIBf5?=
 =?us-ascii?Q?adgFlzv3ZoiYGPEi/P5niZQDytKHnSaYhougETMwIVPhB5X/rVItoNFr/vMM?=
 =?us-ascii?Q?0OB3QIrOycY+IbSiQt0sY9nFy2l0THpH5qxUtM1jSr18Nbqoe0cHUsZswU2U?=
 =?us-ascii?Q?tDjCxEc4vLbyrlDOvEMx0bt6jpv1VLrunQu4n21xEzUva3Nqmi8nfcNVGkrS?=
 =?us-ascii?Q?2UhDexTfOiwGZ43+vtkhIod5VW3gb4SbDG4i8CcSpnSyurNYFEylbDL+iEWT?=
 =?us-ascii?Q?TRaGyFuzcaF6FgZ+cMD+y3krWN5nzNCe3yblBtfD0eYkZuQ0Q3VG4erE6kUi?=
 =?us-ascii?Q?ySo5EK3bf3OPWFA/5cQJgQ9YAZ3BJynxWdx3Zxz/b2kOtCMiYftwn8VUW45m?=
 =?us-ascii?Q?Gsufrz+CBBHvl+jM0ALCwd+FNvqJ+SbnvWcoLMGcjeTMNoudzSGFdn9lRUF7?=
 =?us-ascii?Q?OrUan1QGKJXr9iQ/iZQU3t33vwfe3cOIsJRWyBzHPqH3d1lCib0OBcE/Wahe?=
 =?us-ascii?Q?pNnrQKWSRn0SEEWwYpisTtWrCrriJ5Tb1CFVNtBxuaAEJYKqBAlz+O1oqZuG?=
 =?us-ascii?Q?Mvkh+Dey02MgF4EQw3AiLXgPWsyTkzaOqgJZDdnE6rfShaYKXftPTF8qcEOP?=
 =?us-ascii?Q?ab0qZcOFJLjl5uTVgoURyKLUGnTsutCSZ4MICpIte1OZNoe6rGfSCKVsvqgU?=
 =?us-ascii?Q?dFSNV09ZwUY5OMh8DJpVZUUvPbJre6zkNxrqb0WmSrmM/8wkECDo5U58qs8w?=
 =?us-ascii?Q?0j1NLIHUMx/iaKvXBBui/cVbXNoNMw2UZYIaducv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6226.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 274511f5-c910-4af8-ec0a-08de1acc5776
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 11:30:07.5985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KwqdrrAQOuPFWVyB54gsaJNGQ77CG9ZuQSxNsFKPc4lB1pUshL9Wb8tXBVBvMtARGOkO90n7Zz6EHOd/5aLGf8Znjcl3jh/eQoWtosg/Jus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6057



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Friday, October 31, 2025 7:28 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>
> Cc: lgirdwood@gmail.com; broonie@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; perex@perex.cz;
> tiwai@suse.com; linux-sound@vger.kernel.org; devicetree@vger.kernel.org;
> cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
> Subject: Re: [PATCH V1 2/3] ALSA: hda: add bus callback for address
> translation
>=20
> EXTERNAL EMAIL
>=20
> CAUTION: Suspicious Email from unusual domain.
>=20
> On Thu, 30 Oct 2025 12:09:27 +0100,
> joakim.zhang@cixtech.com wrote:
> >
> > From: Joakim Zhang <joakim.zhang@cixtech.com>
> >
> > This patch adds bus callback for address translation, for some SoCs
> > such as CIX SKY1 which is ARM64, HOST and HDAC has different memory
> > view, so need to do address translation between HOST and HDAC.
> >
> > Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> > ---
> >  include/sound/hdaudio.h     |  3 +++
> >  sound/hda/core/controller.c | 25 +++++++++++++++++++------
> >  sound/hda/core/stream.c     | 17 ++++++++++++++---
> >  3 files changed, 36 insertions(+), 9 deletions(-)
> >
> > diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h index
> > 4e0c1d8af09f..61b41a014f4a 100644
> > --- a/include/sound/hdaudio.h
> > +++ b/include/sound/hdaudio.h
> > @@ -293,6 +293,9 @@ struct hdac_bus {
> >       const struct hdac_bus_ops *ops;
> >       const struct hdac_ext_bus_ops *ext_ops;
> >
> > +     /* address translation from host to hdac */
> > +     dma_addr_t (*addr_host_to_hdac)(struct hdac_bus *bus, dma_addr_t
> > + addr);
>=20
> This should be rather added to hdac_bus_ops instead.
>=20
> Or, we can just add addr_offset field in hdac_bus instead of yet another
> callback.  Then the change would be simpler.

Thanks Takashi, I will take a look.

Joakim
>=20
>=20
> thanks,
>=20
> Takashi
