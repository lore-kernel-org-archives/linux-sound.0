Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013020.outbound.protection.outlook.com [52.101.72.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F57A3A9D8F;
	Tue,  2 Jun 2026 06:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780381542; cv=fail; b=nPrYYqaCHM1ZQYHCc76S2Ah4T6gKa424LM52xq99I1YnFqXED9btbxliPd+wfoKGSDXXDajbk/ljp/NVX1mnu15c356JkkBSZgRKBtJG4X1dlY3KwILoPBPaEL/dzcA57gTZaSSIRTEX35tkMSAjC2O5cz08I4Rcw1rNSpfL/Zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780381542; c=relaxed/simple;
	bh=LnNzxNCi8/9r7zjw4sWulMZwkPRmIUtoLojknrxkIq8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=syBTGFRlubuOXB1rbSpvv+BlR9nQX2go3/39hT1ytSrPWDAXAg51SdlrLoRiwd3a3yfvyf44zDZQTxjSFRy6dzlpOacBsaLzExNyEiPq/XFRRUNgZ9tb5Av6nKKV2TMIkVH7micStFnwpTMIvOHfCcGJzaIZ658fdpNVM29qi7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ua3e9Fh4; arc=fail smtp.client-ip=52.101.72.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ua3e9Fh4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwUVJMEaF1ortn5DG8pDoM7jPJufxS9U6R9TXHQMc4rFjUvvrhsIz56mBEjyRAXQIIsuy93NEmda59+1h20e2w+hLhs5DustZ9oFxXAPhAl5+xileNrBTM1KLH5MhtGGY4ISmkHwAT1D+UxPA2NvZRXE0gVbhZAH2SQ/vamoRT4l8WFnriyHUt7H6fqXDHiXYiwpQwHea5yReqkfAWzLT6PPrLmWVMp6hZqg07Qr0QI61Ffen2cZGTouH6bd7hbJxHNESirAcXi+osp016te3KVTp0WQVYJziqpGGI12yK0EhZL9Mr23AV59vEn9+Ear1UlC4LJQk+d7sas+JWLxdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+wLNuwtZiJVVaxY18kMMm+BxSgecWCdnfDDLtwqMVc=;
 b=tsJ+gOX1Oz6lDSKwhe9Sg4efn4KoDe8pIZm3y09MKAt6XX6YRWodF5QpY8xbtbZqlz0Ok5mn/bFAGlBthxiVhS9UCQDkdllqbq+2sA+k1oSW8Jz0Tq2eX+wqhMo3YVsJIkIyo/2pHWvSqFboz11VlCS77AMx0jS4RXPiTYz/5tU7oJL0ykWiIb9nyuc+NwlZmD0LYbJ5bHzBirPfj0VP86n3IbYldPIwOd3S45UxX1va1JWSmu0gRmo47F1PrpMTnChqplqYhvvlA5LXb042BXhoRhilv1nZvB3/GbC5d9ZLEDj62CjiDMDGDO8ln6DueqgazXLp98uGnQpxoQ5rVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+wLNuwtZiJVVaxY18kMMm+BxSgecWCdnfDDLtwqMVc=;
 b=ua3e9Fh4t5/jwjWYs1Qklwmt+3CfW0o27APDPl2OxN5ZlOvyOWXIaj6phHfgjbSQ62UYUhm8JPhMUjG7vXTJQLQO6rCfCYTHHh+cMqgocK0Ua4VBOtSSin2jMBQ212OkjR9pi7CZaRoEtRSZVbNeUgqu7NQOGPSdVXIF9e4YJ5+B6WXFPP2Y2O1ENnjk/0j8L2nWta1HDgKz++n/pawxdOL9P32VMJKBGUMjqe55bxRsBBD1XDPzPlqg8Kr8HfTv5B9G1XMs28/F1COsp26rH36ufmuF5Go66dfSvJnFU9U+Dp8riCQuOGRPZ3c93QBnrjMmchxyUn84K2jBTWrwJw==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PA1PR04MB11472.eurprd04.prod.outlook.com (2603:10a6:102:4e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 06:25:34 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 06:25:34 +0000
From: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>, "Chancel Liu (OSS)"
	<chancel.liu@oss.nxp.com>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
	"rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Subject: RE: [PATCH] ASoC: cs42xx8: Add SPI bus support for CS42448/CS42888
 codec
Thread-Topic: [PATCH] ASoC: cs42xx8: Add SPI bus support for CS42448/CS42888
 codec
Thread-Index: AQHc8Z0AIGfcF6Fd3kykcLp7ctQtFbYp6xuAgADTwrA=
Date: Tue, 2 Jun 2026 06:25:33 +0000
Message-ID:
 <AM9PR04MB8353ED13E31C180953F8C9A8E3122@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260601080224.1410292-1-chancel.liu@oss.nxp.com>
 <ea0e8942-75d6-4a02-8be8-cf0f7680f825@sirena.org.uk>
In-Reply-To: <ea0e8942-75d6-4a02-8be8-cf0f7680f825@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|PA1PR04MB11472:EE_
x-ms-office365-filtering-correlation-id: fe3b08b1-d904-4201-ca61-08dec06fc0b7
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|38070700021|11063799006|56012099006|22082099003|4143699003|18002099003;
x-microsoft-antispam-message-info:
 itszSp9g4n05JWwPUW5lN3uph0jXetraYfDdE/uatzO2bXqkBQnd3z+b0l3scwUEO1chD/RdfUWOL4tUYUD9B1dotUS+YW8/M2bZCZR1Ic9w0KLqegzhssULc1iOQe4SBqjEjlH9bNrs1RB1B/t8HkjZCOIiJ5RCmJcRggCYH9s4dYJPdxub6NeOyr2HaYqlSL6dZJzmpKtlgYcQZDy79ETcoMNsWwcq9J38bH8I5tUOdC9fncjr1yn0sRcxXlM+1D5e7e+KGUq3YRQ6QV3y3sTLYWajePS+ahGC4EwWJqKJwfCDczKNcWaX8WoSdDridF0JMBsMcZc2mjwB+gxw3TKYtXZXMEr11e48v5svLXMXYNwoimF0W/eqodKxoH5DgLKtWKSVIAB5KDFIeqnharTC7YV/TiMzQAuklXi8xiqWsqlGcS/PgotxPrL22y7WIWTtvJT5+iHkXAxnzdEHcztVXWngPfZbyRN5fEhUY36bI+IPjS+b5dmxhH2VFDQmek7D7mprYqXgJr0Ft5C5qa/5sOmEegFMplOpzIs3lRUi5zDUBYu88kqRvw7s6QL9gWl3rK0A0QNlRFneugcYKg/6dvZ36D82YXdIvF+73iyVo4JBVEASn1GUoYkp6iM5s1uvkk1JpKYkUnAnzrIdFlpptVJg+hNZXfFGTibC+nOe/7qnvK47oJGxa3/OBRTlA3g5mmT0va+ASMpvxkGZDvxpLA5jDeNbDGsXAOhGcak6VhaX5hBK80FHuzemBC2x
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(38070700021)(11063799006)(56012099006)(22082099003)(4143699003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ih01T6hUCSxX0IKGv52FIfmGdqidSwPzBrTwXREcwl4b2fFmysYBAze+yG78?=
 =?us-ascii?Q?gjLL7/3URRT5Ep6kcSLiqL9+Wta0h3L8Fo+kwJagycvb1k/PWTMb61M8dvCw?=
 =?us-ascii?Q?qc0aJFZ4qk78GglEJunqzPFA6Rp2XDZ+iqX7vlXi+JGDm5/tGcJQnR2rLEVf?=
 =?us-ascii?Q?7YPKVNt5u6OKYbAntJ9sPwrmnrxVVxLSXckrbR6oNr+PnMtOWdVOoXF+9Tkr?=
 =?us-ascii?Q?2UoO0kDWtIJp7UMYNT+9pJauRw6E2jv9JRv3jzfVnZomXj4Q+0cs93+y5Gmn?=
 =?us-ascii?Q?sPAsmV7Cqgu9Hbtvvsbq3bUpsfuP+jTtGF0xGhXBPYFnucE8NjjkfTGY9c/A?=
 =?us-ascii?Q?D8IVkwC12f7aSJAa1qE6nRPMBcKmV5xhzDHDpWnezK/1xMiX7QtPZYJ9/Xl/?=
 =?us-ascii?Q?e1lstfHIKPEYzOx5lJ+Vnr6IeyMKRfnMeuuxB17RDfcHDiHiGgMOI6tqaugc?=
 =?us-ascii?Q?hB8/HdUFW6DC9GO5SuyjPPkJZhmkGYCliJItv5m+NZ42raeWWSIvRRdJp4FG?=
 =?us-ascii?Q?JxQ3jT7iFnlhbdOwQKYgrv/53OMbG/HPSCoOGvOKxLhl+wPunpgwZQ18tRCr?=
 =?us-ascii?Q?Td9F67qSHbShIWgrQwH5uydGYNtoKGPLrSUoImj7d0gWXZV24YJ3ozariwUq?=
 =?us-ascii?Q?yWnaNZmNzVIAo4aB0w399S3sd3MwJEeFUkQhP/nTkHTQKulDgepMk9kXY54A?=
 =?us-ascii?Q?8bX4WuLGYbG1qH4FjW3d7/db2hGHSzXpA+Ya59XHrTuDMWXTqS5qm9RnR1tK?=
 =?us-ascii?Q?7lKsk56I0u64bSvz2p2buusj+vNHeU6tB78A5+buQOi8Tnsk2WK69Mo7+5Bx?=
 =?us-ascii?Q?AC6L/c0icyNqxP1bruJj7lgWzmtKxne8M+2qNLq+yLanirlAfFvKPX3tvsoD?=
 =?us-ascii?Q?WEPPwdu2Q23dTJBo4a/vcjEhKtn5jQkB5eJAROB4v+WyjZ6R1fIs5lWNKVz9?=
 =?us-ascii?Q?YT4QbCqO1fqDnD4wBW3c5quy4NajDyVDZyXp2wr3gG7Fhk/pAK2zhOyKa5M/?=
 =?us-ascii?Q?AsKcKLEAbEUjiKkMaBQMPTuRkWc6z/tQuJxKivEU8Z3eJIVqHXrTzcwFZux8?=
 =?us-ascii?Q?anSyNaKNHCEqAts739XSaBOR94+n3UFgboeJDGouw/MDjyoxLBcQlOL8ltw8?=
 =?us-ascii?Q?ksrX6d2lXh+j1IHU54Nx1e1iRxXTgh9JsSQkjTFxe/L8Hmj7Phij2yvHDTpK?=
 =?us-ascii?Q?RCqlmVliC7ZCNs3ZGFcDYgc87EVedq/49nS6pskNlOZ9hSntvoVM6CWM1xx8?=
 =?us-ascii?Q?ZPg/yiykQHqHrcxIazSE66WXHzF+63xzf9JqDvGDheocqS52iYmDpU7EA8Ov?=
 =?us-ascii?Q?55hIB3F5z0xU/fhc3GOr/Aj9EVyZRHdKxgVlUHsbgmaz8EsjRGtwUg/A0R4n?=
 =?us-ascii?Q?YKaEXZagZgPy0OrtfRfJMjEHzuvfWvty3hklbuuPnQHPwsgcv4EWgLuB0CWf?=
 =?us-ascii?Q?WkzsOoNFGGcBuNMoQCetRfIoTYQcTkkhWJcg5a8aa90o8AK6R/dQ8du0qD3u?=
 =?us-ascii?Q?rzSFYTMxCAbk6/ZBl7gGSpnbOWaXvJ+5AqfcDk8FQooXMHUKv2USAD3Gb9Wc?=
 =?us-ascii?Q?gE9M03BGTgYsFnNdDCCmYTgg6PyRkSwnA+IRRpY8vYLcOH0VW6UX3dhBJc1A?=
 =?us-ascii?Q?Rf+dapjlCtsPZw5e8kaynh2L8NewoESDfKEI3Mrkn1OdF2nmDj8S+7J6Qnv4?=
 =?us-ascii?Q?tlBhSFb1zfS0aPKqgmMNXXyN8oef6OuTy4IZvK2nPTWrY3+4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3b08b1-d904-4201-ca61-08dec06fc0b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 06:25:33.9930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CPt4O/M7XfY0xhbFpBAIC865kgl4to6IYgKwlo4O0z+QliFtCbH47R6J4oSfG8Cet3NaINRmScT7HFTB+/ru/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11472

> > The existing cs42xx8 driver only supported I2C control interface.
> > Add SPI bus support for the Cirrus Logic CS42448/CS42888 Audio CODEC.
>=20
> > + * The SPI frame is 3 bytes:
> > + *   Byte 0: chip address [7:1] =3D 1001111, bit[0] =3D R/W (0=3Dwrite=
,
> 1=3Dread)
> > + *           Write: 0x9E,  Read: 0x9F
> > + *   Byte 1: MAP - Memory Address Pointer
> > + *           bit[7] =3D INCR (auto-increment for burst), bits[6:0] =3D
> address
>=20
> > + * We configure reg_bits=3D16 so that regmap treats the address field =
as
> 2 bytes
> > + * (big-endian). The chip address byte (0x9E/0x9F) is placed in the
> high byte
> > + * via write_flag_mask / read_flag_mask, and the MAP register address
> occupies
> > + * the low byte. This produces the correct 3-byte on-wire frame withou=
t
> any
> > + * custom bus implementation:
> > + *
> > + *   write: [0x9E, MAP_addr, data]
> > + *   read:  [0x9F, MAP_addr] -> [data]
>=20
> What about INCR?
>=20

Indeed. This patch doesn't handle INCR. I'll enable INCR after reworking
on write_flag_mask/read_flag_mask.

> > +static const struct of_device_id cs42xx8_of_match[] =3D {
> > +	{ .compatible =3D "cirrus,cs42448", .data =3D &cs42448_data, },
> > +	{ .compatible =3D "cirrus,cs42888", .data =3D &cs42888_data, },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, cs42xx8_of_match);
>=20
> This should have an update to the bindings as well.

OK. I'll also update bindings in next revision.

Regards,=20
Chancel Liu
