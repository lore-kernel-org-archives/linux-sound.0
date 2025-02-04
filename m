Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010040.outbound.protection.outlook.com [52.101.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5663518B494
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 07:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655437; cv=fail; b=nxEj1SK+rvGsXF99nQIgaoB03fqJrA0sn7sNXufBE6lG80Cwee66hht/9TWF/mKbDxDcI+0OAVuVIuascam25QL1/2kINtltFmPN0GURINiV67Hht9OY8S1AEWqW8k+TChSWz3SEG5ks0IBeFC1SswHwYhgSVziq5v+rey0ATOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655437; c=relaxed/simple;
	bh=pYB/MiQeOnr9lZDiaun9EbnwAVYIefnBQD1tUvQB+5A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y7x3zXLyFV+3tGBik53/5/RWzuOmX4UbcFiFVnhiCObrvmvmXeFLF9sogGoQsYCYmQnBoQaYKB3oI0rR65kfI49e2l3hOEi5L5eVNF0GGzz9gG/Nd4+NB8F3xIsh802OvBw0YPhqFEJhQeEcAQiDy0e3690EGB0VoxOwempZYMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=a03myon7; arc=fail smtp.client-ip=52.101.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="a03myon7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgUUA5fC+UXZE/2b9tfUrN2eDOsV2cf9CO5fhtxpaTlrUuLnIdrQsfWPJSql3UhxPO+Wx+SH3ges43MInmFvwPJZNQOt8H9rhlvNElxVIhlhTZ+sCsXykdFs8u46ocS78dRysJywL5rcC/52BMF5ZbXdMwgesy7uz7Z+jVldYFV37xLJZYAtCxlshLhX2KBceKlBrD82WOvWpl3owHsJkmWjbCiDWGq/nBNd5GxfOwIqbKCu7XunYTPacOwlyQ4VF9B/bstBReyUdumKbCtDNAHHcP1OIT6dP/jzUvcJnEj4cfW6gGvKLoRSFliI9qUn5rHogWpdAjnxzXg8CID1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONeXYKS5YVGLHjwfezE6CnUFJsLQvVuPIbe86YPAKZY=;
 b=V8Pf2KfiymfMeWZI3FxeX3p6b9i9QOAOu3h7RtgnV5JNHt4lDSWitT/lAPgUD1kVnxzPMhVShaTpPuV6YNvJrl3V5IzDRibcASPeYMOQUhnEl5dCzmLbuEbsJQf8XlD9d3yO7yh+hwV8A+b9w+8ptUNUCOlPYv0oaRsBx809Z/nA8N5Z8OhkAOJedUt81bwFx9zxsmxKghncOpRcyh+lxOPG5+yRU7t5IPS60wGhz39kMGYjJeiGq9Xx/bWleF3xLv1UjkT3pFsn2u6LtWnxg2ejUYkaq7nGXsNa78BvX17KyAxOrKQCjbJ5usDSJmz6aIYbJWWaKMDneZ79STmLDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONeXYKS5YVGLHjwfezE6CnUFJsLQvVuPIbe86YPAKZY=;
 b=a03myon7Ex5Dpa8maODFXS7nE976GW/0EKEuagxz8/M5r+OmeOXqBBu6qjcLX2TzpeqMKDtGw6f3rTGPYEV87wW7tCqmpU9Ld/G5IU0GWL3QDzcgxePvIe8Bhepjv3Ogx6jLoEfULOnF7qIbmWd6xuSgSXDIIbV9qSEcNbCYin4=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Tue, 4 Feb
 2025 07:50:31 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 07:50:31 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	<broonie@kernel.org>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: [PATCH 1/3] ASoC: rsnd: indicate unsupported clock rate
Thread-Topic: [PATCH 1/3] ASoC: rsnd: indicate unsupported clock rate
Thread-Index: AQHbdqXnDfXBEBKLBEymwd51pNxvvrM2xUbA
Date: Tue, 4 Feb 2025 07:50:31 +0000
Message-ID:
 <TYCPR01MB11040C4F11C282279DE559DDAD8F42@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <87o6zi32ry.wl-kuninori.morimoto.gx@renesas.com>
 <87msf232rg.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87msf232rg.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TYWPR01MB11935:EE_
x-ms-office365-filtering-correlation-id: 0f47f1a9-5e16-4374-a1b0-08dd44f0999f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?x8td4j9er4dlSYfZtI1coUKH0UYZKMztkSBioLjnQwaJ3QXzVchfjs0QPRJ8?=
 =?us-ascii?Q?mAxk/Cw7KaAn83dkK1TBBAhO1/MAD0HRRPzdwAvu04hbn8qkilWkNXubucMv?=
 =?us-ascii?Q?EjhlUUSgpIT/Fsa+ozQ6G6aL19kZI7pVF0iieONKXfNhLrVVAyHf9MrHWQas?=
 =?us-ascii?Q?R2gFa5ElI/X1fu5iEdr+J2/Ed+FPOEGurrg8VwpUmzTBMsPNnktMFcbl5FkB?=
 =?us-ascii?Q?YMajpSzr3uB37qkrLTkEqnOE7P8/BrWb46nYSeg6QJBGRle6PkMhpC97aKOt?=
 =?us-ascii?Q?bYYb/EVD9ucT61JP9bmdFpPk4zs+xluA62UVL0LFRIKhBlvNi81VpZ58sv4H?=
 =?us-ascii?Q?SwpEW8X0pYCmWU7myF64mHxGyKXMmZiKcFIYvvPIaLLtsTb8AqcHMIph1Hsy?=
 =?us-ascii?Q?w1JRLsMNmcuMuC73nPmlBL3GFz9Cl/JASvKdFf33HVE/frFYDtE9/a/rvnQQ?=
 =?us-ascii?Q?gw35a82E9q9FS8/xX1/cKrwLlW0i7U6yLs97edx0ExgI/kzNN6yMzZuIPAWj?=
 =?us-ascii?Q?QKWHNdSJkmtMtawHxgRGlkw8Kg+0zxCH5i0Z24wJDk3dnShjg6R9W3VEhfRb?=
 =?us-ascii?Q?4O/BiX6pEgTL3gATn/xcDSiAMeGPeg4eOmSU281Sx3b+w4dCj1LSRPPdrNJK?=
 =?us-ascii?Q?XAGtyL26skzPzQDih+ZKb0x4WB/gIHmwf64oR0Ui2lnDmxoqaS2+3rU/rlOy?=
 =?us-ascii?Q?RQlGas8rxNpnbPbG/H9RM3T/Tg78a0Cu0o0bnx/KQsYnObRq0BZWpsyrATVl?=
 =?us-ascii?Q?ksoZZmPLYvPuozf8vftpfLWmUira+yrLDFZTDSAFcUMmBgUS34YeDOF3r8NR?=
 =?us-ascii?Q?hkyKTZS2HjhDwfhVoszZYmNQAnIRE82njfKaMj+iUzISccrdR/QEwTFL2bix?=
 =?us-ascii?Q?0rsnYSQPtdGXHIRIHHTm0Z2horgf6WJAlzSQsMF2ZOr4rILF/y3tUml7ddOf?=
 =?us-ascii?Q?j0jnTZibXbXqiUXsG7LqiPDmhY1pG/y58XJ83YeMJEs5y2U0lcRPb5PcfLH3?=
 =?us-ascii?Q?CR+9/CuwE5eBVjJVLFFaHmH+0KELbFSmw24pwBvP8x7kTEO5M2mTjqIdhtMd?=
 =?us-ascii?Q?glxxlE+Jq5J9/2f8+Y7IrCW9s2w99yO0YRDa53HJCicIkV8He8kpakQZimOZ?=
 =?us-ascii?Q?dH1XJhO3PgsUWddrxWP10XEBGDRhXjMyfoejkWxEGbMnoypHaP+Rz+P9OAXM?=
 =?us-ascii?Q?OJsViDcQDGOZJsZ7Dr/qFbGyTehEWaTRKyyp6m4izR8Rixaxa7d90vSKduHe?=
 =?us-ascii?Q?knGdzy4wfeYC4IlEGTLQAGpQH+PYDkqRJouEJApNGxgl5qSp7ee+yarKX4hm?=
 =?us-ascii?Q?oHzgAj7OCEa7Cd8OYdQDluzxQ6t6ZG2xMsHzTwWt3YrbI1yDQj+EUddLxnPN?=
 =?us-ascii?Q?iLP18GKweKBHTaIZ59U9D+/o/+Y0UvRcUkGRt5kHmxfOCqiFKNtsKlPSKGjk?=
 =?us-ascii?Q?ojEscsd0lIuJzO3ohFDx4ii0d9uwNVeJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zWpSzSO/maggRCvSk17WspAbDryXPs+EikjrIbygl9/jgS6Q+qBTSpopWMl1?=
 =?us-ascii?Q?rQQUAMxP98/9rkAL9NO9fyo9fPJ17Ou48sVwj8lbNIFI1/6mjpmcLvrYmCYJ?=
 =?us-ascii?Q?LyuJ6VYUf/VeytMZwfFRvkKXtuaNwRcPSXBy6L4VbxMWoze1T3Qn8gyVY437?=
 =?us-ascii?Q?u08CtL1GTgco1pyG7bmAUr5g0lbjvmfjSQtXPc1JK/mF/+JNkg4afDLqqZ8a?=
 =?us-ascii?Q?xeFxh8rCBY9lCazGTJNXOByAaP+dwTvuoB+NwU/PTxgyYPCVTcdi8LixD5Hw?=
 =?us-ascii?Q?liSgvj+4GDfGJs+u7bZtZ5HWuRCIZLOHP5vhm3gJjfU5uVWROib7n8B93K6h?=
 =?us-ascii?Q?+kCKhU0T7LIXFZdGgl+Rth6J3FDRUvzA1oHi65PyQRPKcSD6eTN/fRA+Suog?=
 =?us-ascii?Q?50cqi0zc426Dzu2oHDrLp8A9f28t0ESQxH0Z2XxJD6xzULKmhEABe4hzDbkD?=
 =?us-ascii?Q?zBYpDaCa/bupXLmTZRNOhprUitTFf/R/8srOZjRjpC+F/JG9McBWPiZHcwVD?=
 =?us-ascii?Q?Oa97IaSXMszRAK+95Eb3zCf8HJd1SHqm8E/8NP25QUyuXvWUzNPhGhf7sYQD?=
 =?us-ascii?Q?mSw7rr7UZogBU0J8a2DJQkRUqeuq/4ZhUMVhRvmZa9q/ycea3xWNTKqqGT39?=
 =?us-ascii?Q?hlBmhEXeeLeklpmcBdgeBqRDxwiENjPMSlbhUjBNiVX4dsivgO/0ySrwgo4B?=
 =?us-ascii?Q?88iLzfabPs8XErh4JRNH2UcDMG/wBo9r2/8mcMvekaPS07lmV/TdwDtg3eSS?=
 =?us-ascii?Q?hEDQPYlrZjffKI2psNnWBGzDsqIayhUoF0pTVxPJh9RgJAavmxBTm801B4yO?=
 =?us-ascii?Q?NEPDBkB3+5Mz/XMY89DC2xEM4bV5ta5hfKaAHgDSvWDvKgS1untTkaZXlTVc?=
 =?us-ascii?Q?Orh0EAAUJudEmHQlDV+yNB1OUljxf+8Gyiyjg9zNSpTEjMtdN0UK7obL+Px1?=
 =?us-ascii?Q?1QBXg+IWsfgevN0Q5yl6VmUfcsbqNuTSB/XV5kYjTSG86XLmA5Hcq4afHst2?=
 =?us-ascii?Q?XM50SPiYFulVnza994MVXxujkXJ/ESmz16RT3vJDvdLpkLvoMa7Bewxqqeth?=
 =?us-ascii?Q?scmNIf4Y7yca/SGok7Q0u3zdW9Dka0mTZOt/TbvQ1UlHHMVPYu/MfLi0k/Nd?=
 =?us-ascii?Q?oGHmM8FyLa/rrPr1O8hFkAZp5RPH57Mr+PA0QIBqbPxSR+hNqEy98NLgxh9A?=
 =?us-ascii?Q?989bJJkgvrZ920CzMLrEsXomk94CJ14yyKwUMzkebr0albkFv3k0o/Zkg8Ps?=
 =?us-ascii?Q?IDNlQisVQP19XxDYVj8YexEqy9dQR+9k09TQ0iZYUVNaQ24I03xOPQRu8XC3?=
 =?us-ascii?Q?UH108iLW6n1R+bHxQS/X+cOYU8Q9kxLcbb5g/nOOGdxH1EOUUL43Afhy8x6w?=
 =?us-ascii?Q?xyjoTZ6qcl5+O/W0FgihtL5AFkM+Vhycc0Bb8m9KqIe3m2la9VmBgbeeqbvh?=
 =?us-ascii?Q?Q//sWLFmxtVug9t8jhJ5Ios02zlC0jMXzP3bi4hqUzm7vHOHYxbXt8/5+i0B?=
 =?us-ascii?Q?y1fuZ6MzbDChIHGnub5UXFIYLSiMS03TWUBH5HryXtmrzanhGZPRePiYMxZs?=
 =?us-ascii?Q?mrZicWYSwbB1ibf8ZqqJxFfKNCCKWFLdKT6vZi7sL+iqXKUvJDU9E59+BziC?=
 =?us-ascii?Q?eec3ILPuaXfw6AFdH1GVdmmb+MPlMXNxg0tmtGBiea7B5/b7nYDEayKfvSz3?=
 =?us-ascii?Q?9PMxNA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f47f1a9-5e16-4374-a1b0-08dd44f0999f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 07:50:31.6514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZuShfDsIN3Cw1EHGzhRkS6qakVUSm68ScYcmD+tl2D4JqNoDDmhQNlexZyAP7jvYGWbc1LKGNHUoYUBGynm0tWNZBAASUmQWZOQKiXPVEw82FQVtgFHaWJmngqKbUZFQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11935

Hello Morimoto-san,

> From: Kuninori Morimoto, Sent: Tuesday, February 4, 2025 10:41 AM
>=20
> It will indicate "unsupported clock rate" when setup clock failed.
> But it is unclear what kind of rate was failed. Indicate it.
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
>  sound/soc/renesas/rcar/ssi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
> index b3d4e8ae07eff..0c6424a1fcac0 100644
> --- a/sound/soc/renesas/rcar/ssi.c
> +++ b/sound/soc/renesas/rcar/ssi.c
> @@ -336,7 +336,8 @@ static int rsnd_ssi_master_clk_start(struct rsnd_mod =
*mod,
>  	return 0;
>=20
>  rate_err:
> -	dev_err(dev, "unsupported clock rate\n");
> +	dev_err(dev, "unsupported clock rate (%d)\n", rate);
> +
>  	return ret;
>  }
>=20
> --
> 2.43.0

