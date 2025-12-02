Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022110.outbound.protection.outlook.com [52.101.126.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796E6283FEF;
	Tue,  2 Dec 2025 09:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764668760; cv=fail; b=sOp8+JiOY6Q/BCeHhm3lL2wXjh35KIy7nS/stDZBL5G7b6/OGlKwHKWQWgzfwTBjxmtTTZfUvNXqUmisA+MgT2BtqEbDuIbQDqC8wjVPe0m7kX43PFJOrfX3DHpE0B+25GY9E/k1ykKdcrGbjOG1QEj04zR0NrpeOjubAkgkZGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764668760; c=relaxed/simple;
	bh=BoVJhujiKXPeDENPiMeR7AsGaEAv4FgbE7SFyqYYZek=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d6rtfMxS/rqsHxNTONhVnwpBWaobNnXFHcb/m0PRDDD1YKuzahWTbqbkK3hx9/I+P7WHGZAVBCKfQty1Wx0SNOkOjpf45gCjpVAy/jPd6ZJw94Ul/cUodX2MAwUuaQ9hbSRW83yA0STcx/ANkNyOe1uUqBBNzjVH2urD+St7imQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mmg/fnTigX0EHjGwtkT0YlOslSfqk4924BdewzGQCYBJrWudRpTpCidSY1Ngn5HtnyTreDDo3aecjGvNGNqZAuUb7UiwI5jZeAdkZ46i1KmhUntxcXsd7IkiFCSj9MNORbSE2NWG2zMWsPe7pdke03kXjvFrSBLs38a/zPP5BTrJxcr6HYqA9Mm2wUZ9Und1FAV5nbgEQcQiC+ZvQ80q74Txd43QChakLDNLJBNFIY+0e+oV2M5M+YU8TveOCIZK9TS14keFIus0dSlSrE5JMnCtQ4TmpAFmqEAgiiCjvFPhWWlVwLQNvC0iXNI+n34DRLAc5zCwf+NUTJZZtkcOTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoVJhujiKXPeDENPiMeR7AsGaEAv4FgbE7SFyqYYZek=;
 b=EEBiRowHdtoZGVyIQlT6Z8XOKaXtBzMgpMc0BwkLkSG2Ej9J3r52kDUNA0z/8U/1YCRpAN5csmfFpkaovN0bhd54AoYFF/Lmk6+04OHBM3aF1Wa1LDj2Twuct7SzVxCHrWI8YYTL6fwYLU5O5ClcyDgTC0Ipr2pYNguwkUVqPY159NeLgz1oY18KjhetIT1Wux5b8z3GK1g9OMIltcbw4SnB4pkDSEabcWevGOisUB4ElXFzN/ylEduDKREBD984GEpAhquSrlC+NfOkob2I+m5ZmKyj+8ucYT5Aya2XB3gMYKLDcKr8PAoXPYMKL5GmsgrZN+FkN3t+Oe3r4uH02Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by SEZPR06MB7004.apcprd06.prod.outlook.com (2603:1096:101:1f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 09:45:53 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 09:45:52 +0000
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
Subject: RE: [PATCH v3 3/3] ALSA: hda: add CIX IPBLOQ HDA controller support
Thread-Topic: [PATCH v3 3/3] ALSA: hda: add CIX IPBLOQ HDA controller support
Thread-Index: AQHcYrE8SyNQRYmPEEiZzVTFHQiBDLUMvZaAgAFW6mA=
Date: Tue, 2 Dec 2025 09:45:51 +0000
Message-ID:
 <SEYPR06MB6226B3E1A33A299E1D94EE1F82D8A@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20251201105700.832715-1-joakim.zhang@cixtech.com>
	<20251201105700.832715-4-joakim.zhang@cixtech.com>
 <87zf82bby0.wl-tiwai@suse.de>
In-Reply-To: <87zf82bby0.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|SEZPR06MB7004:EE_
x-ms-office365-filtering-correlation-id: 3d90cf79-f296-44c0-0536-08de318794c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?mNKx12kBjbCXN14Q8F6AFaAe9eQIisKeVo4HWjuYPFT3ai0eMLhisai5PSj+?=
 =?us-ascii?Q?WwPM6gQmLxY9a75PxopQFZ+50Nw+k6LgDvbOcUc8YBiVuQlPStzV2/q/MW4c?=
 =?us-ascii?Q?rUVzqYuKJ+TdmT/N5vDn9xuySYWUdleOeQEi4TR+zLvruMvSxiRBMcpiGWpi?=
 =?us-ascii?Q?RJIx+LmyP5N+sxpYBEY6OxfW1NtrYiu29+Hk0OyG35714HUgDOozL4nbEw6x?=
 =?us-ascii?Q?CfSSI3VGdFdKkR1Hm1jDstPht7NLPT5EYacMUPIfodlKdK+/X53AK90ijHxD?=
 =?us-ascii?Q?5fGWkt0VJP/NgEKSn1Q28tn9gYjlRLbKtaUy80QbQiBY7zVIzvwp3U8dGSiw?=
 =?us-ascii?Q?S8YEB6fRaorBC6NcUtI7/OJk1ZZwPX+/AjY6Or0ltH7qcVtEkd+V6FJHb3p+?=
 =?us-ascii?Q?A1aEXOO5LR8IJF6O6BDZK+SuiGPadkT7ulKr57Nobev70Ecbi3bSxkjsxP5d?=
 =?us-ascii?Q?C3Ie9LGVL5jH0lv/3k/4fzduV6eT2mX1VA90PYeeesuzSNKJPH/T6A9L5FaJ?=
 =?us-ascii?Q?Uu/etBqcbONHYUKzf34kYFtvxgrm1ZBUNmfn4JDnWwTMngrEw+DxTnlyRXxN?=
 =?us-ascii?Q?vv2h1Gkm57HWyIhOaMjwPbBFhdgXhq11QgASUL2jcFXallr6hyVA/GAeb+Z7?=
 =?us-ascii?Q?R9Np/Ih6IgR9N9H3+pSXpZ8PqkTe0ErLNcqmD3/G2YYb4+FFnpr7uhTXwQFu?=
 =?us-ascii?Q?CNxWAh+8rpeGdzVQyA3XfAaRPzg+R4JKXhAwoj0NqybDCGMxfltJPja5185k?=
 =?us-ascii?Q?SIM1Guf9RtR58N0YYg6ZJhAJYL9hhpwhlJ68OHSPKeaykC/xuY7gKpnQaIEH?=
 =?us-ascii?Q?2n+mxUQr6SstKVkibfs9nIQ0AtFQGmeyrjeYGrNdku0QYHkLp+alhxg+5OE0?=
 =?us-ascii?Q?dVpY+bgHzoMLpSfogXm0aI++qsx1B3g/B1aorGnNulG/Or6zSdQVQSaP1LuC?=
 =?us-ascii?Q?w5jYinmCqTer+S0p55Rgni69QkkKJest5srWdpwPtvFn6SQ/7b61JEkem1Le?=
 =?us-ascii?Q?8niO7IQCoQpt1f+hO+sI6dTbMHcytA3jMiFnuwDDUlbS5ubSVUUZ48OBH2+S?=
 =?us-ascii?Q?KA1vctSRqC/7Ab53/qYfgyoaIpQ9SHyK3gs0/bc7lzXJkbsORaWXvWVlWIh1?=
 =?us-ascii?Q?x373zfyMT6DuKyjZv96nkxvMMunhT/L9m9xucmMyUMyph6wI4qrnV8xMZjyU?=
 =?us-ascii?Q?F2A01ALz161OLjJfbQ87oZ+LP7xqYxmq7TChM2v+Sbt8kUIJ6+K0G3ZGLVz0?=
 =?us-ascii?Q?Bhs0kv1kwcGmYwsSD7I7Fer5uZpBIDvbKqp1T3j/HrZoB3yvjxbYtAYzB3SI?=
 =?us-ascii?Q?LyjKZYKhmJvSDxB+BxJ5Q8ls72Z/KzQGhQjKc6ldWkK9O2PW51+/ukQZQJOK?=
 =?us-ascii?Q?zRhYHy7kn0ljr6JPNw/YiZERV7bndeB9dvcvuXWyNVJqLZaGWDoeSPYDqX+6?=
 =?us-ascii?Q?MoJUsLPfofXt+FDHnkWjwrRBoU/OIf46nqvrh9G6Y8i8ZdyDPttVL6zFiYMp?=
 =?us-ascii?Q?QgYCjwT+inTXAAkd3YTHByC8raclA0DRDHQu?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pxvA+Sh/irAQLROwc4uMGg+4X4701itbKXZTJ8jxMkbhEH8hSbV3fun7U+jn?=
 =?us-ascii?Q?tV6mZZVl1AYGqPM+brmNCrtOzEMkH2g1DQDJzJb1Gydmzy8KP2UBrIbESOAM?=
 =?us-ascii?Q?vdqTXTcr1LFwp8/khrb+I06OPCaYEcsks7mGyVKVtoEYOk1ge3OEUe255UdD?=
 =?us-ascii?Q?uP6TSTqgzCT2aUt3ilxu6yPjREELuVnkewsgEkG4S8RjTaxrUx9Zt6SvtbBB?=
 =?us-ascii?Q?9Hen6Sg9qMVFbTjdSRsh5Kn6mgH0sJDoEzVpYpfLMgIVPZa8RwqVZsqK8RuN?=
 =?us-ascii?Q?VeU0VA9JvYAHZYhHhjMTxF4IBJ2Fk0Y+JQ4uhWkZtvK7HAKEHQm5tNQ5c3pB?=
 =?us-ascii?Q?CAsOvW6ka+c8R0IXRrHxOPbd8TPfOn6kQV5X9xDpyQObXnK+yapOvkOzYd94?=
 =?us-ascii?Q?RzTdBO0507sShNvkozISZqJXMFnJjYHAXucENELm3Pk7M3M5y3FlOyPVVe1f?=
 =?us-ascii?Q?IZX/vKOgeDuJPr1GcnkAFmTZkCagBU93/F5Up8LeyyxjUzv2pe8UX2S042Dk?=
 =?us-ascii?Q?bTsmJx0Ifv+tQ2TquLS4TvR9k3EvGnNgf0cEBQolqyI8d54sGGiNV27RMhVX?=
 =?us-ascii?Q?l08o4FKt9Gs7PEXPJjTBZe2kV3AIQMYxEAIthSK4fBJW0kF+U+nrXnikyERQ?=
 =?us-ascii?Q?citn60MUNdAwsgmMjx3r6q7UWn+ek+IoCwJ7m1Mh6e3Xifq2VsS9ss74bsCa?=
 =?us-ascii?Q?zvMi45R/68AbHxoY2EMV2pJeqXi69/xguymWo/SfS9taa8l2KAY+0H9GSNBM?=
 =?us-ascii?Q?NQj1BDfoPj7TcCCD85EuJpzUhc0FJBf+vxh5KaPuuuXhT7yPVYYxNfT0wwuB?=
 =?us-ascii?Q?SkCE23fH8NxIWPIkxd7eo6aTJJFbU4U5gdkiIjVsPQ/rs8K7otz5kV0d24UC?=
 =?us-ascii?Q?5Srd1U+fEJ7vJz5LpL/lRrBieiRViNub235AvEMSSPRN0id3wkp6bElFHWhA?=
 =?us-ascii?Q?6E6ssGld6rx3/w11PALmMYhmZCU8ApZ+5WVVV/+dlNe0YAJ2cc/NAGYRdMBp?=
 =?us-ascii?Q?JQozgALMMw5G+6tgFOYTjHyT6HkLMGvC6a8L0qnlhj3MQ9Zhw5/7Wj5NahR0?=
 =?us-ascii?Q?t/KdRD8t4KIQMVcM5GVfF1tNxdnGe/+APQCbi2h7mC3YZ9kmrJzussQ1uuaj?=
 =?us-ascii?Q?aMTo1X0//KytYTElxwgkREgGdP0ePtYcz3YKz+m8nNksR+lKwd7NcEH4lYG7?=
 =?us-ascii?Q?iFQWi8CS1FD+QHGfClngi9/k8pauQwFhu6AF601UDifbYXSN/RXfOmAv9/Zx?=
 =?us-ascii?Q?SfPHTVj9i1yxMKfz/eCEqJOBV4YR+a5SLB1NqpIdRGn0q3Q1uUz1xSSwdkCT?=
 =?us-ascii?Q?ZyD5iof/fi/aR4XN0ScjXwrtuVA/uG0dMBpCCrPl95N2EIMl6uP9j1zbsoDi?=
 =?us-ascii?Q?lwIt9NRoXZ22HkwHx4yHOfNWtwORiinqswYVrs0ZEGbNA1l2tkPbV+jyXCoi?=
 =?us-ascii?Q?qXeZXho2a2fcYcqOjfyHk9kg9c5kM89DUIlogOcXYNhBqi51ZNxBHyptvUJ9?=
 =?us-ascii?Q?kLY0tbaf9K08ayfuRtibmtUcbkbm0oAJ0nf8OLDaIgejsuWNovatomUajDV5?=
 =?us-ascii?Q?jkGy7kSRK2jTUoTReUgwn9sMwsCcui3rqSDo8/gq?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d90cf79-f296-44c0-0536-08de318794c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 09:45:51.8990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xxHg9t+Hw95g2Ox4ZFvIkiyEGWYL6zCl1BqLef8k8g5DNwKgP/KeDCO3UKTPvloRkx97YYxkRq16H7oKQ7vACpld7NZ0LPfMdjqY4sQ7vX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7004


Hello, Takashi

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Monday, December 1, 2025 8:53 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>
> Cc: lgirdwood@gmail.com; broonie@kernel.org; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; perex@perex.cz;
> tiwai@suse.com; linux-sound@vger.kernel.org; devicetree@vger.kernel.org;
> cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
> Subject: Re: [PATCH v3 3/3] ALSA: hda: add CIX IPBLOQ HDA controller
> support
>=20
> EXTERNAL EMAIL
>=20
> CAUTION: Suspicious Email from unusual domain.
>=20
> On Mon, 01 Dec 2025 11:57:00 +0100,
> joakim.zhang@cixtech.com wrote:
> >
> > From: Joakim Zhang <joakim.zhang@cixtech.com>
> >
> > Add CIX IPBLOQ HDA controller support, which integrated in CIX SKY1
> > SoC.
>=20
> It'd be more helpful to describe the characteristics about this chip.
> e.g. this chip requires special handling for jack polling, and it needs t=
he
> address offset, etc.
>=20

Fine.

> > +static int __maybe_unused cix_ipbloq_hda_suspend(struct device *dev)
>=20
> Those __maybe_unused are superfluous when you use
> SYSTEM_SLEEP_PM_OPS() or RUNTIME_PM_OPS() in dev_pm_ops
> definition.
>=20

OK

Joakim
