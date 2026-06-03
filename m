Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39D3478E45;
	Wed,  3 Jun 2026 12:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488853; cv=fail; b=Nc4y6TpIQHgvjGmXu2My3eNl2V0yi6M/Nmv8fz8hglAim0ngQcL3MgIco003PJkFq0FJ5w7DbGGk4BexJubsFmNEdzoovD2pSQkw0MY80liPSHO1Y4X2HlZamKZLprDKpuOtGJgcQjUdPZxFMNwI5ES75UunNc2ACO/zyXwsduQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488853; c=relaxed/simple;
	bh=9nl8E1VHOrPwDKNlO9ostx6UPDOAPJY24rXNRLY11F4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VRg1fLSAvpsNFUr4M+QyMZds9Hc2VBEUdNJSQiVXL8V5S8Ip0j4vncuEIgVLHm5XsncIxHT4Wvi14Ds0+XpM1fMcnAfyESIAClJQ73Fuglb7Cu6Xm94/5bHuUEAkma/ZIT7fdOyJSqPS7NiAB8evREZWLX5EKzOCi2jAKB5ZQjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=S3VCxc03; arc=fail smtp.client-ip=52.101.72.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="S3VCxc03"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yn+lfDolgWU6rYHn1pWFvhijKQ+OGw0GMs8pRV2PlrKuzpPBvxVSdxfjuTMgCZ7SsLZgI371WYnB5onFFSLO1WJF6aQSuEZKr46GfRtGzect+IKjzMqJaD+fp+BMSFsi4xTJf2XpVAh84scQdAuh5PCnVyYu1mySeY+XOQZibe7MTISAsSFlYjeuhSI4XJAjNynLD+zNz+RSLOEU3CQALEj4Ic/kf6zyf/xBcppuBwgteYkgOJz2IGps89S/N+HBfc/ZpRp75V6pdkAk1VO+du1orByLPoZ2Q45lfRzv26VldCN/IdHKHMFV9e388MTMuBUfkURTg8zeXD3DNnu5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nl8E1VHOrPwDKNlO9ostx6UPDOAPJY24rXNRLY11F4=;
 b=eDtUZw6n79xPB5+iLKOj77P5cW7vsr94xGQqTLAJ6n3Obt4gwRcmYX9deMKeEjOxw1PLskqcCIAE5chlEmYF9Pc6u20myDl5Jy4vxzTKztdG8yJ/fAbyBtQ9u/DO8kyRgBLOkl5n6MacYRmWULEja8YIPMXCrn5UkF7TKqORYxnY20z/PUf+7TooNrg0XPcsUxSm4I4GlYdN/H7JiV0NAfmJz0fIKG2ySi+6b6DVYBSFahuS4HsbUurZYtaCycQDlgKxNWJ8PQqfKY5PxycfAeCaIBRCLQGZleMwTmSUoEeYTi3LIbPuPHaCCuubv9ubRkL2QytVsbM1ade9tvg0rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nl8E1VHOrPwDKNlO9ostx6UPDOAPJY24rXNRLY11F4=;
 b=S3VCxc03vKFtcrvqhOfVB9+GDI1+NtexoJnt9FoohMfA/PDCtu8q40UbJoeewEb76vQKRQqGSn1OIXKPd4ETYrBpNSuseVsdCW1xNMRLUsRz2LM3je/W9oeAZt1Ga30OvD5bZQgBzQJC6sMW008pA9Jn44GwcbBEpAtEObJrftJmSQAIvQE3KAkGhExzEMw1k1hHa6kUknahT/DsAxuBURq3/w0vJnMutHIPSCmO60ceBpWVq8Tv+bFvFbKj3Do3ZWeXPeM2XLC52z7KT1uIWe0ICHL42rUQCUdy/aYpIx3zH0kp6KWA1Lii/pWnx+6SFyFUIfCzWNCxF0icyEHmug==
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AM6PR04MB11267.eurprd04.prod.outlook.com (2603:10a6:20b:6d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 12:14:06 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 12:14:05 +0000
From: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>, "Chancel Liu (OSS)"
	<chancel.liu@oss.nxp.com>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
	"rf@opensource.cirrus.com" <rf@opensource.cirrus.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>
Subject: RE: [PATCH v2 0/2] ASoC: cs42xx8: Add SPI bus support for
 CS42448/CS42888 codec
Thread-Topic: [PATCH v2 0/2] ASoC: cs42xx8: Add SPI bus support for
 CS42448/CS42888 codec
Thread-Index: AQHc8z5198ueWsltp0C4ndfwHNQCILYsubuAgAAEI/A=
Date: Wed, 3 Jun 2026 12:14:05 +0000
Message-ID:
 <AM9PR04MB835327DABBB8A6F53CFD1F05E3132@AM9PR04MB8353.eurprd04.prod.outlook.com>
References: <20260601080224.1410292-1-chancel.liu@oss.nxp.com>
 <20260603095041.3906558-1-chancel.liu@oss.nxp.com>
 <7522f14b-f416-45df-9e84-477dd0c81ed7@sirena.org.uk>
In-Reply-To: <7522f14b-f416-45df-9e84-477dd0c81ed7@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8353:EE_|AM6PR04MB11267:EE_
x-ms-office365-filtering-correlation-id: aa759a1e-cea7-4952-5c22-08dec1699b94
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|38070700021|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info:
 f2TYKMNmHACAwS7Kp4qUqdlEB/Rtn/COm0Jra7cDzaHcgUupZ9nEpi4Vgr3+Gu4boPz3eRjwMveZhji8Q8hqaPiYLi3w2ta49AhRAzW8BcYe3zom+G5pfvpyqYDeeN9AEfAV5osFtgSjSKV3ONflr/s35dGfndRRe8ejvkPGO7FOQCzdpzxpB2Oaw70kojXzdipcQHL9eEh/2ExJ+xrB6mlJBaJ64KpqSNkb6kNQ4HYHGxGNr0WyRUTpaJk3Hsn83fKshJx1pyAQoVIHsBFloatvxtnb+MgBZpNefqfcQ4OfQ2MN+Mo3A/CFs57EEd/bfHbqO+a6okW43zOzHlcvf7cSzd7p7mjCbVWn/YJiTLA8UV1r7P3ARCTOk4otVGKbYdUKMLEkTKVpdITYvicMlgQRQyamnPGEGaq83uNIhFtOJiJMMoRMkY6oMaCFW6TvQq0cMm8xQb6kpdId02Lsu1VAJakg9ZjzKv3cz7ZR3xu6GquQKgE26/9RUlrUIrVreeYy3u/2NdskuHJxlwOMfKDs0nDeCTeLBMjljZA/O7h4/2i6NUnmefHR1eNsYPHeaj7mSpBNVk9B7lCyp//LdbB++kbXaR+mO81W3sij5QyztEEaV+1+qH9n86FkZQFFnYOQITZkBUMkg12ib6Qf7hVH/tOkaBmUTjb7uVKm4PyUIhG7wyZyOnKUWB9Oacqy241CS1fd8tLuyCgI4MXuYr2S1worAGGvpGB+d+D4e+0ShXmELNDK1feCBTzfrtfn
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(38070700021)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MeCtWj4nUXGVdalldi2/zM0d41tKSZ6eNvX8o/zNK5R67fsefAAztQkuAovZ?=
 =?us-ascii?Q?skeC9rgAcFZm5iccdyegjKs94ATEXF4icYpSpxXVt1qtZV+24qFN1AmM8NFp?=
 =?us-ascii?Q?So+RbixUkX0lvOH4I8qewftqoKIsr9V+QezhvZMvJwcWH/AsbeFOYboSw7JN?=
 =?us-ascii?Q?W9NrMFjDnrJKJI+Ljifpd8neDhPkbyT+8e2qHuc6lR/ChV24EtPIrLCGSQ/n?=
 =?us-ascii?Q?O19s6R0xsxNxgGnfkZCGb5IstMKyxDJMMg6jE8lyXiO39yO+sYd3l71R+Cmy?=
 =?us-ascii?Q?jomTwdnE4h8YaF/nOvXO7i1RMgMJa5lk/T5Kpug+quE4X/PZdmNdTu3ZW7fu?=
 =?us-ascii?Q?G17y92fIcDpdj7xHoKVqrszfnfKLGWvoT2vthr1T2Yjn9OxCCb46sC8nKTx0?=
 =?us-ascii?Q?IdsrQEs17oStZvf5zX+Uy/rTA1Bq9Vi8CvQXnjiiSJES+nxHPqEAnO10vsOt?=
 =?us-ascii?Q?FksHmnNurDfAejAfNPxoDtOgqgz1qjg4g3JqfB+2sihPsP7/GX7PrsApNRYL?=
 =?us-ascii?Q?9mzyDoo8AcKhthmKyQjpJ5UfP5vvAfb8ealzVkB5sJSSQc1q9s3MHyD4oBXq?=
 =?us-ascii?Q?MexzvL+copERzEV71XYiyQkvj8s++nuv+wgLOGHVKe2onQhcrzlFL8IGFLfm?=
 =?us-ascii?Q?+iTXfKPLLhzu4iRIslsfXjegIbxdQaHjMZNop9ZOPGHXRrVMxt7D+VpnRSvf?=
 =?us-ascii?Q?vIlutZGCqcVRbMsTD4GXtdJ372tIeO5TBsLu5s7wmdfHSx12PNYm9YCE5qvG?=
 =?us-ascii?Q?VoFe8Z+gtfGxC475y0flklqTe02MCsWJwXtM/Nyxw6bcBOOXzkW+hcst1KV+?=
 =?us-ascii?Q?JewpyMLGIIszbT4sWNHrcSxtRjV40jeJrHMmsLpgxhGFFipbTqQEa/IqfpBF?=
 =?us-ascii?Q?RdVpHpqVyDMDm91jcU4Q7h/gefrT+fHBh5KpfmRhAaHGjDv1Hg7eLUjZuslu?=
 =?us-ascii?Q?qRygj8eX8VMwYqMgf5KoE+CuwDJq36SmZU/1//rbijFCiJ5DxDRauKPuDKla?=
 =?us-ascii?Q?9zKZEJ340ytMbmlIw42QNS3EwXhk2/x/9lIYhktM774zXiG1QcOShGoGUkzz?=
 =?us-ascii?Q?T/SUHkhZxHNT6d3pqwAW7Oa8m7UbMCt4IQ06AajaCrTNLvM7An+1TE0Z79yM?=
 =?us-ascii?Q?uQ32eearJTx5S3jvvHhJDKHZVKy+jmrhjVbQ8fiDTCCa6W1jqiAzzF4vQy/Z?=
 =?us-ascii?Q?ZEMLscuamTIrUqBVoPVnVyFI3zVSDcm7X0kiyCoQCmxtlYaIarg1IuFQ7Sdc?=
 =?us-ascii?Q?Kl5TbUhf5MQl1TZfOSvCqZbjAE4KTf/Y1sTE9ScOZg4EDEF+8wWxNvg33x2G?=
 =?us-ascii?Q?PVq+Rpln8Bwc4XqYnuUmpcFKjHDVahDysaXjHJhnMV6kR3rCAxhA1yYnxsg5?=
 =?us-ascii?Q?2ynmuZ9hN9RzCtXj5oGe7RdHm2AmewEEn0jGLHnq0gxBpsEHjW2QvgStuYUb?=
 =?us-ascii?Q?1ZyAdu6mKK8FaMQS1lpmUd0oVad751ey+CfMSWKNSQz5eEtGoFhDvkBbELGG?=
 =?us-ascii?Q?xkiZSRe+NcOAf8rkg1PtBMEMvN6lOm7qUWfmjss8srDRKzLvqmKSb7BbpqTe?=
 =?us-ascii?Q?+6vtjCvPzaCQqCAvB1ENETuE99rkp5dN7Mnpzn9QAFm1jX/9W9GzYEiyfYXF?=
 =?us-ascii?Q?HLU/TT2v53RzkbSixVwEWUndu+NaSMXFviD0+WuzCt/Dsy1CoCQVdEp2EQgL?=
 =?us-ascii?Q?vulY/SZe+gp/xi7KdOfYqLFjFH0NZi3TTAtoCTjhHETr4V3XhMSuq4kXwd+b?=
 =?us-ascii?Q?kawHH5QHeg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aa759a1e-cea7-4952-5c22-08dec1699b94
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 12:14:05.9021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 61q5KyECKyP6yq5lmib6GYfsLJkKL4mdzCbE+5bmlI01rT34CpTVTY9Yc9hXKr6ocfZQtMY9Nx4EFQ90NuDMMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB11267

> > The existing cs42xx8 driver only supported I2C control interface.
> > Add SPI bus support for the Cirrus Logic CS42448/CS42888 Audio CODEC.
>=20
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.

Thanks for the reminder. Sorry about that. Understood, I won't do that
again.

Regards,=20
Chancel Liu
