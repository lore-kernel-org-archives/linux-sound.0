Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012045.outbound.protection.outlook.com [52.101.66.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB622BEFEE;
	Tue,  2 Jun 2026 05:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780378275; cv=fail; b=taAzQFQ0hrCTiCCYriu9JjhaBI/GuwT1ARrnz4MEoB+oEb3DefzFUqbFjD5uqE6K7iTeZR+qWtasYTsxphjeD+Jr7FEQxfcc1hWymxbiIuaX/t0+p2S3e9zh2nozDa0+vCLnauo7ainNT7jKJnI5YDYZNanSEL/T97VmTsz5vCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780378275; c=relaxed/simple;
	bh=QJuLfWlPps2VnL+Uwox96lQrmvwni5jRSHbn4n6Buvg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZTjixd7xRSz81/j/arR3ETgh3jRF4rTKQDk23UpgbNH/hGSDk+/GjNKqdex2Xj+up8PwOz/tbAna4Qhn53jE0o5msrer4wD6rbzeBDm8U90+HsyxztWrNdZvEqBjFWi3SlUFQgswlbRk6dcU2U8W1hauPk/KhQkMuPxPJKvCt4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=L7rvsnJH; arc=fail smtp.client-ip=52.101.66.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="L7rvsnJH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eu3MnHtl3LxdCrCBE7ubmtg37ekoXHe2bUgMOLr55SB4y7qKw4vLe9HL3yqECJws1V1AuraC//YFpAhL1g5MGS79odYXCdU+C4PWdS9tW2jAyox0A4qphHtDC1WSy0mXa6GUHF0z7MNxdLtXUcaiyWFX7T6vCsdEwQG9X+tF0jotqSj7RttUsfER2PMqUMrPf8PHp4nVsjPTmDOtSO+TzsAZaRCWZIAAEt8UtZh9tXHM630umTNXKvzKpbLl6cb5W6mucbjTveLKyLl9fH0qXdaAW+/r3XdLw+eVc+1YPQ/Vz20v1BDN+aKKUe7YZSgeGzuI3FpXg7dj1cVhe1M7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXfuJPHdesXUFl9U5b2Y6heDAXkMvbw98ycIPdmC7cc=;
 b=PMnP7b4T6JG4WpWebDiYW2bY3TTFDryIqhykUi9Oiy4bRS+sRlMZwLZTWNKPdsQVKCTSbXoCjlCrIMzamAo28dRVE6N9IK5DLE5anKoVyw9tJ1RHraDFvSdWn75Q/aaTidGZmlX/C9+TttXANjjKAKSkIyicnH2JTpPqWQjrEG3baTNTagvD10FjKGB/dhyDjP1siCfSx0zE8C482T56LT8gbRW1Jn3sqm8eGOnxwHJMSVQbIuhG/Adk1RcJBS+6nl0ipMgQZOD+r5wfLYi6XZPnp0U0LrccQmyiemi/avjEIV8YGl/jApn1JWZxke6pPBmGUWyH82JxCpN2tLo3yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXfuJPHdesXUFl9U5b2Y6heDAXkMvbw98ycIPdmC7cc=;
 b=L7rvsnJHlXbDPBzwRlnN/h3JvVIRIqgvhl3jE/WTxLPeFq3tX+UeOjoye73XoeU3dBBJWr/45pVQaWdk//088PqXe8SLOX631owz3VUce3nJEnrrU1N7/0Ki+FpkS0lZF9EAAPFZ3TLpvxhcZ/if8x4lbff7l/29pByaDSNTWYcyNrqYc/x8xUc86yyqELj1F9+6ieDlx3DrT0BVwgNysNMhiYyXsgJvUO3RzpIUgRSpYtQuz+W+ADysOZ0YmXHxUN2pregemlGsQq4kYXwTpugZuE/Cpa5agtCKXqHfuxaQgreCGRfczJvlssegfalVWtpR1vbzjqDxSfwd/bH6Ew==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by GV1PR04MB10351.eurprd04.prod.outlook.com (2603:10a6:150:1c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 05:31:06 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 05:31:06 +0000
From: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, "Chancel Liu (OSS)"
	<chancel.liu@oss.nxp.com>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
	"rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Subject: RE: [PATCH] ASoC: cs42xx8: Add SPI bus support for CS42448/CS42888
 codec
Thread-Topic: [PATCH] ASoC: cs42xx8: Add SPI bus support for CS42448/CS42888
 codec
Thread-Index: AQHc8Z0AIGfcF6Fd3kykcLp7ctQtFbYpYQMAgAFc+eA=
Date: Tue, 2 Jun 2026 05:31:05 +0000
Message-ID:
 <AM9PR04MB83536FC1D2AAA5935B28A291E3122@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260601080224.1410292-1-chancel.liu@oss.nxp.com>
 <ah1FMEQroBCjOCD0@opensource.cirrus.com>
In-Reply-To: <ah1FMEQroBCjOCD0@opensource.cirrus.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|GV1PR04MB10351:EE_
x-ms-office365-filtering-correlation-id: 471c151d-d80e-41cd-e1ef-08dec06824e7
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|19092799006|56012099006|4143699003|22082099003|18002099003|11063799006|38070700021;
x-microsoft-antispam-message-info:
 XziS8aSwpwyhmE++U1y48eEd2JjljuMqF1v4DnufZErHsWdUF2biA2IoFmxWh7dN5UgUYkp9x1Ij62Y33lWV1xbMzL56q/uXiYe8zKYaNJx5+Ix+ai2X1A9RgT/r8uzqOAz1sCgYwDuao6t/qi+GI30TzwnDpGh2F/D4Ln4RjFjDgz9MA/ROq20GZVWzqAePJS4TksW+a9Dj7kOxW1nnTlzIvknUHmQEndwJDPVFnhjI2evJXcgvMQNiLHPrFvuGOxhWbb5hzTa9Cz5BWUL2fNNk9wMMl15u/O41H8JqyoJHrHdjnwoSvICwZcfjm7M+Ezln0KX47yWkteBts4ZdLNbFcZPR/nnIZrKUcAdAI9Slyou48eVv39Mmh2MntNuUaE4wBsUI0TNcr2BkpRpp1MIcXBrLYIA5i9h/w46wrhUiDSi54d4b9aljHO84TATBQvWne3ff3MHZrWpwWNeA8BGjJzhZh49aWRKRix+fQld4LyILIpYeIdFFAzCq4C2kyY3+4TsDJvUhkvxm2jmgZUxgRBANS4ba4NTQMPLyrSLMoQUmvzHWqCQJIOSpt6Co6fzNy780Df69Q3eTocl7f5sSfuIa3HPqBRdKfK3gdlt6TJF4xuGCd+0/ooMtr/FNZ8QQfybtwcVbrXeD99wJxNQmxmf13AMYxln/K0ALFKbslHpu+I5rYXt+68o9fVprCn0QLAvyGvG0X8rD3zhwiuxCDiLWGOG0ODSlPhqgzm5J1YwS6zNc+vLNZMRIZ5wA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(19092799006)(56012099006)(4143699003)(22082099003)(18002099003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GkIHPSmsoyssjgR1TOz6WcvxiStL9a4scyRV34EqsJ8dzrRugOxizuLituVm?=
 =?us-ascii?Q?PoA60WQhHHf+pP/fML6AK7Dr/r5e9I7OIbjpl36liBykNtsX/0EEIzQ1KJH4?=
 =?us-ascii?Q?AQ5s9n9B6vkb+VqiT7qd6fEEMzF2rBK5/Or/LF0hqAHuE/LnFZY1Um2X5T6V?=
 =?us-ascii?Q?ZUjdiUQdVsukZpJnF7NNpSmf0oJQFb/BGtMhAAkCw20X1JsQOo7pqiJqPoXE?=
 =?us-ascii?Q?ORfj9hwYY4KiNyAwrdbSTyRYeaAYNxJ9atzi+hbgIRnoKt3xJC5a0J3klOYz?=
 =?us-ascii?Q?BUys0rAa9mQKkjhf746E+xeb6/s7FpnasqSxitKRAp+LIdms87Rz6AxXiy5v?=
 =?us-ascii?Q?R/JPhjHt4G+ai8Fjvly8gMP2E+E9K0U0AF3d3ycLeQJq0Y9/BpSkCeiVNDES?=
 =?us-ascii?Q?Gy9giSWKsghydYm3ueer7hiO0fspoMuBCxfwof8aQgBEzGfn7YJnVmFBv2Op?=
 =?us-ascii?Q?k2VgoseePsBi5LclG+qEUakvqK//oPEaepFHuItGkGLGUScHfUOgY84Oz2X2?=
 =?us-ascii?Q?vzyhk/EU5DwebWEd0wm6l7DuFn707lbNMnNxZOwood1oGbwFASexgtznrgVR?=
 =?us-ascii?Q?o5untjCmNQ8LQn5S8WD0F7VAQ9/eozO/jgNRjiNGxF8Rzl+rI3B2/r3Zxh4Q?=
 =?us-ascii?Q?DTrHWp6tkjjy9tM3bcKUbmnsyaRrzIph3SE3MolGE9Mt78HGDcQfNp5Wn3zN?=
 =?us-ascii?Q?l6jzK7Z5/V7BC7XhuCG7Gfe4t+EBFWCVlaY9MlYmU2p/ULUKHXEaCeX1beI0?=
 =?us-ascii?Q?It9pCihcFe4R7MocKw0XX3spVuyW4gH6kTPAm1Bk8RMKc3Qi4VvEY3Co6AK1?=
 =?us-ascii?Q?wCeaa1Qmvf24nBKxjG+6JRyyuwqF5w6yIO8UCNrEP3+mLErBIYcTisOQzc/3?=
 =?us-ascii?Q?QfCr38IAZAYaw2YCXg2XwjRDPCbVhVwb8ov0O31MG+1jNmlqzTNbwwVifJcw?=
 =?us-ascii?Q?jUf5Sx3TyBapzJgHUQDb6K+Dp3xkNIa/RG5DAdZ2AMGiTdu4/lJhotRaicN7?=
 =?us-ascii?Q?+PaR2lAz6fExf6tlU6nlxjc0qxAWr3iGa3TqhYqECbspAFGpejgfESqS14FR?=
 =?us-ascii?Q?9bR8pDKsO2WGnO7WVuXzF/kPthW24IalnK5/97Xe0cXvkef5VDpn9N9Homra?=
 =?us-ascii?Q?eF+SydZC8l/WTvriY5V1T9u89x6BNsyhMZY3Sm5x3vdJ/GA8gIcUgHBN5Bg4?=
 =?us-ascii?Q?4HjppleXnVvkFDRlxTDNaDif7ytpCKzy8Nyn/q20piTtq62DqLk7OBR5s9Nw?=
 =?us-ascii?Q?Y3h7rwJdLNIW1Bc5afn+f+H8F15AVI6C3IvrmxuJcbzqhjd+4qiUHy0ieD1N?=
 =?us-ascii?Q?uvKeubaFel0zyVOqqszz+hmGwTZjPVjMsT/W492krcF4c2eFxcAjpehHswcp?=
 =?us-ascii?Q?HxO4S8WmvUGnryv+cRTMWzDkUKyOYAzBeheahkp+Uv45XdD5NSsKkDukOD+9?=
 =?us-ascii?Q?VVemBZ7VcTJJHI4dd81/kV8LNSxduixH46I6AEoeA1vzGdaU2ch07GnP5p6q?=
 =?us-ascii?Q?lOFHoyCfXODfizSF5dGda1WThW6pXwJoQq1AwRTgmEu3xH2oAUpVEIhO7vlr?=
 =?us-ascii?Q?fSKk/24jscxeXpJZfQ6XsPmdv7zgG6B4TqpugqV5/HJlRb+1py2Dq5GoHwxn?=
 =?us-ascii?Q?Y7b6eq+bk1huD3z/9ZTsMnQvvykVcdGJDhmMaGFEna31ye7xIO7cLpyv1/u1?=
 =?us-ascii?Q?KO8DJfEs5Bdk1GOSmpzyTHAKDCZpS1Xw+qu60aYEt/K400pt?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 471c151d-d80e-41cd-e1ef-08dec06824e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 05:31:06.0927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dnoh6yInlai+h12+j7WJNk9X0BLYzAOZAU8Ht+8sfgQNzyXEfKpOoQfiT0s/uJDFKYUwu/QhwfmcfLw0gZwtlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10351

> > From: Chancel Liu <chancel.liu@nxp.com>
> >
> > The existing cs42xx8 driver only supported I2C control interface.
> > Add SPI bus support for the Cirrus Logic CS42448/CS42888 Audio CODEC.
> >
> > Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> > +static int cs42xx8_spi_probe(struct spi_device *spi) {
> > +     struct cs42xx8_driver_data *drvdata;
> > +     struct regmap_config config;
> > +     int ret;
> > +
> > +     drvdata =3D (struct cs42xx8_driver_data
> *)spi_get_device_match_data(spi);
> > +     if (!drvdata)
> > +             return dev_err_probe(&spi->dev, -EINVAL,
> > +                                  "failed to find driver data\n");
> > +
> > +     config =3D cs42xx8_regmap_config;
> > +     /*
> > +      * reg_bits=3D16 makes regmap send a 2-byte address field (big-
> endian).
> > +      * write_flag_mask/read_flag_mask are OR'd into that address
> field:
> > +      */
> > +     config.reg_bits           =3D 16;
> > +     config.write_flag_mask    =3D 0x9E;
> > +     config.read_flag_mask     =3D 0x9F;
> > +     config.reg_format_endian  =3D REGMAP_ENDIAN_BIG;
>=20
> Probably nicer to just update cs42xx8_regmap_config for the endian, I
> believe this part is the same on both buses?
>=20
> Otherwise looks fine to me.
>=20
> Thanks,
> Charles

Okay. I'll move format endian into common regmap config.

Regards,
Chancel Liu
