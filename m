Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011069.outbound.protection.outlook.com [52.101.125.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775432040B5
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 23:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738712942; cv=fail; b=sZlz8GnJzBtV+kjWbQ9EKvpv566YGN4gCFsxnXuWkDXu3znjanxQkb9CE95lBlouuumVDwqqAkohvruXscgsqI1AyHy1w4VurvG5aJkWMWU63Q37oo8u4RntWbpxrv5uLoq5lYLv29eD9Da/2TEqQjFjM4QYBaRd3N8GZXGh9LQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738712942; c=relaxed/simple;
	bh=SkuunQhZoRZ1PY/A6op0VWvWUyQtBz865Yi1b+tMM4U=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CdOBz7dYUzyd5uydHASRIfLsRo6AdKRQy3asvjD1dGHwxNj0aecBulkl69Qb6DPWtL8f9LCZwc1Of0cX+YkCfJxKIhvxesw6k9kQYZOEyq3nS525i0P5X7O4cOwIYMlUDpHTEyLjf42xxriD1zw9zxqPlEYDIyBprsNdkqFV/wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iscMnNdl; arc=fail smtp.client-ip=52.101.125.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iscMnNdl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtgo5L0clJW4iswZy6DYGWuXxP3hvQrHP+2dhZBQ+PYA9CPZx9TeUE1Fe4r6TDPzhCYiNWtp/2gJ4OFdLSC5G/pMyfIYkvEW1Ufd7CT8Kf+u/Zl0ciC00LUj25vy+3RqjHr0X1udv7JIaYPiJPu4Jbr9X8Q4GYV3rSUtO2BzBJpPZ/PLmY0I5/w3lMOPJkWJr+fRWWmzoQJikljl3pCPzcRT4Ls+rszLzWh1MXsu7CCb47QcQoGTtMsfcys37h+ZNecB6IxqCZEtSfL5h/SsAvVwoQKbxEBfQJ/psCTw+JPMuBl34kM+zud7bncmVu7CtnMuFaKBAPT0xPh0+aYDNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riI9BCgMQl/ou9sS1Pcntiwa+kqZ8BlOVE+54lMzzaU=;
 b=vRrhBNwpCuQEZAhACDGOzBlBo6PE5RgbudKGmK4zN1z7NGHeDZosAogZuq5SqS/5xcsZHaQOHr2lnVpD/bViWLFiKXh8D7NBSCmRjQJX570uZEaLtAMDMak8X5Zam6FxeHn1EiZQdJJlJE0xnRSN/m7xhPvMVWTrFEGyhaegVyh6D/wDOzXIjI7tqC01LhtIzlBQ8IgMVP/pxPh4GTU64b/mEXF/Wbq0sWG460npmsEFB0ejL9ybvmL4wgOLCAqhPN7WHHU/w4DVf2CkD3FnUNsVD1uMYfnmQ6QVB8pHVdhmAEceswV51JVh6BYyZyZPmSmNrf0P78smyun/kwHUPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riI9BCgMQl/ou9sS1Pcntiwa+kqZ8BlOVE+54lMzzaU=;
 b=iscMnNdlGc30GWPfPi+R2LRpkVxFDaZ14ZJjv76ZFjqCbJeJIexiybnpFyHOuKL37/du9nq645FJV3qGwXjYeeoNLeaYmvGjK4I16yFVBKQE2yivxnvTeP4mKdLCmI4yFWokBBpKvA3oRyg4xAAcBE+2M3rxHbLfFafRLGF3Z64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11709.jpnprd01.prod.outlook.com
 (2603:1096:400:38d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Tue, 4 Feb
 2025 23:48:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.009; Tue, 4 Feb 2025
 23:48:56 +0000
Message-ID: <87jza52rvc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: simple-card-utils.c: add missing dlc->of_node
In-Reply-To: <87ldul2sh2.wl-kuninori.morimoto.gx@renesas.com>
References: <87ikpq2rui.wl-kuninori.morimoto.gx@renesas.com>
	<5e9c2107-d906-487c-84b6-bdb1a00fa3b3@sirena.org.uk>
	<87ldul2sh2.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Feb 2025 23:48:55 +0000
X-ClientProxiedBy: TYCP301CA0074.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11709:EE_
X-MS-Office365-Filtering-Correlation-Id: 6382b914-4bb3-45e1-3de6-08dd45767cd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9ewcpZzGJ40oNNFKTIA3cQjBBTdagwWhMrul3leZH1rrfAn3O4Zh6dePomxn?=
 =?us-ascii?Q?mwK+i7P6k9kgS/GbTfXXltI8i3Ge7Vouy++O/pVfOWwecCbxu3B/IbJF4X6w?=
 =?us-ascii?Q?sOfijIsf4+l/Iccd0LJursnUcqedVFjC0+2WZc89DdVB1Sy03pog/fVqV0PA?=
 =?us-ascii?Q?ZN3i5+E7Sv4dF0cU2CiPjnHxtEZwkolBzaWdoJKxI21kmZW34sNXAQ5hPoA4?=
 =?us-ascii?Q?/7ZhrXrM/6d3vMGlwwnXwETtNvjN+r/ni6VmWcsmi8LsPunw7L/WxiTkU4Sj?=
 =?us-ascii?Q?HonJyzSWm/LSILlYxoZd2My9/cXyGu1CCZ9Gfkuh1YZfiOWF7vaj05Phdxws?=
 =?us-ascii?Q?PbeEn9XNWyVhRBkHbErlucaX4+rFD1WLNeMBjLNR1HdHMIPJ8UtLoDXx13DV?=
 =?us-ascii?Q?A3uGjhaVjD4tnDdpt+AFpovTqCwYvk/oHkwr8ePbtkFTNQn/9ghFGo5kq9Lk?=
 =?us-ascii?Q?fbpgiQIPKTJd60PuEScex9Lcv6ghg2O2vMeDkQYJDNk1fR0jVOx1j2qJW8Y3?=
 =?us-ascii?Q?YXh50dIzwVDgTEfazy9qIfng2ndg55zxI00bqC+U7YW+yyRIEbqBi4gcDM9+?=
 =?us-ascii?Q?NLcu+U1srUyeR7zJVKZZdPjLtV11G9bUHva5AYIWz0lXNygLuld7z6Ong1UC?=
 =?us-ascii?Q?lo3CuGjOuThsT4XLl2ooDeRku05ZNftEs/JrQQmSiMiSbP5cLf+Fu45bVPKU?=
 =?us-ascii?Q?ZrZdMHWjJ3g7fpoyBwP6A5L+LqF4vT4wdFwYznsTI0EcsB3qn+UrnT24LsWq?=
 =?us-ascii?Q?qS/xq1vYNuYkYSoSgCxdNvQ+F+g81Dxrk9uifmkam73TqgYY9slyAFdEV39O?=
 =?us-ascii?Q?BiwpKyHgHhs9yqhp7tgeK56ImXPIbjKymV/cVJ6PD5lW0mGT/8pSVavwjaWq?=
 =?us-ascii?Q?XtSQ6Tzn1qtZf1i/+p196ZHT7ToDKbXxE4gtfsQ5HPM+Q0oT8pdfUed4Quf9?=
 =?us-ascii?Q?aq6f3FlEqQIF4s3xe0TtiDJbekPbJruVyx8xk5VzdGtYisAZJelmZqAFkvbf?=
 =?us-ascii?Q?8NPSzS/vrmrMGFcm0B7w+ug/tazvbB2MrvuJ/+bBL90cSF2ga4iyMknYFyta?=
 =?us-ascii?Q?sU51+1cfb7eOiCvte6N9G2d/UvkcJucC1/HlSqrx5CX+pjL+Po7q4BGW9Hmh?=
 =?us-ascii?Q?eYO/fDe73XDBRXOi/ccXTda5sOf7VhxGcwyfC9g0tpU7D1Fy01zhvr9ught3?=
 =?us-ascii?Q?vwnEBlCSXmrkW77Qdsmx2W9mPxriS0vXCdPWHaYwJhKZl8Z8WKUDsbSOYWrO?=
 =?us-ascii?Q?2BM6Yipy5TrjhFIZysqGls8TiA1bbXTuEbva4Dong9QpJWxzYTUS4GfR8rYc?=
 =?us-ascii?Q?ETDxNlkrukKGw94+g7cRUGb6ay/u3S28Sd0XBX1/GEaXmggM6ndHO+vm+64m?=
 =?us-ascii?Q?yxTY1Sa4RNxGxO22v12lKRaTuoRGlBIFT5DAht5sru5Co/fnlET5Crcqy6X0?=
 =?us-ascii?Q?q42InlMXvnKg3DhjykzgPp/IbjhUsUCe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BV83EyBUHWHjcgRSD2mmPP4wcqnaZ8oeai0loqVLBMb9EeLMaJrRWDta/H3W?=
 =?us-ascii?Q?AiSoTFcxF/dopWunHcu6dlGloTSIcDsI4USVF9YKaq1YW8Rja7keRAKeiOqX?=
 =?us-ascii?Q?VZYzYIhFwkaZ8qCKO5e6JOCpLccGudUIdzFkG+rcY7BN9kIWn0dYslc4jq6U?=
 =?us-ascii?Q?ACbvm9LXlX/gPZ3/e009XoOoNedgx9oZrd4IiEUsPJmFPFMW0R1uHBQoNrL0?=
 =?us-ascii?Q?F5N4WTlYoYFgI/Ngama4A85SFhU5U52hXP/8C7KWrvWhpJlfh8Gc2OhJqhhN?=
 =?us-ascii?Q?0/wDLeZKaQxLMDBs78QlF/5sTKQQ74M+8cCe08tYWtQw28/o5BHwntURca/W?=
 =?us-ascii?Q?ISKgV4iqby6AY5nOKgR9dsTdZnrnzK1d7I2VnYmFEHmDO7QK14Nsn9B3pbqd?=
 =?us-ascii?Q?Mc1QOVaPOriW/+KQVwwCs+DPAB/BG2DNbs6TELltRhsRiBYGJWyoh/dR+j2y?=
 =?us-ascii?Q?OCsXscVlU7cwmQ5nj+7nkWwWUVxm4tOh9Yz/qT2xm88Q+wg2ENIkhqfkgHWQ?=
 =?us-ascii?Q?lTpMlK/QUpQszvMmCbWMZxPfF6TyGiR0S3MfCRfirqREAHJLw1hznNIa+IfN?=
 =?us-ascii?Q?AbPuhGB8lBYt+o+YLfzB+8XQbxPBIrA6O2cNpIQS327rntW9ShaLkk2/E3q2?=
 =?us-ascii?Q?F96Ev0DljpM/TI2ykewEz+XBQU4cPdOWd3fVpbEYru27JUoebjO3Fy+I817d?=
 =?us-ascii?Q?ShBlUrAopwWAOrgySawJj2y9AxqV7mLVW8UJd/EnTAKusNDthZ/vh2hNsKRk?=
 =?us-ascii?Q?r9nKflVw7oqjhuPS7xaQsj5GMrPVIJ4Xib7YTTtb3FpwfqrqUWSUDYH5s/Ji?=
 =?us-ascii?Q?BENxqDXyFSa2jFo1BiXRFHt8s0XOkHtl4X7Q8ja4gvsjoYmTdJrYNZ8qcGYF?=
 =?us-ascii?Q?lXXsinxNk5Ups84OpR6o5CiY0kAkNXW8T2E709dsAmTgyMqlh6l/W9HPhR2A?=
 =?us-ascii?Q?DMsFPC7KNIfWp9svWBspyrHnVwQ6dqUkqJxe8io/OooMYBAjWdHAuDC0Vf8P?=
 =?us-ascii?Q?kgBckglh493UYR1LXWyGFkXp2T6jG9xKDyHzRtY6IzoEv/HQGaRLhhkn0Z4L?=
 =?us-ascii?Q?aG2M7J7TquXBRpFALPgFN6PwRqFVSkMz1v+NuGxBywXi+88vygFddWuJPMEV?=
 =?us-ascii?Q?FcFIZZTqzCjySWz/sd26WouVUbPwz041Zv3zPmNfyVpnAjcK+NmImJRE2t0m?=
 =?us-ascii?Q?lN+asQUQwGib5bM4c+30sv2AS4X4ngkink/pltCV5igzIbfA38kEyvQGE8LA?=
 =?us-ascii?Q?c+0LAaMXLMVmHHTaBksPIwrFSqi3CPwL01pRrJ5qZS3JXF19uKx3ec4vS9wO?=
 =?us-ascii?Q?hRW5wpDpTW0RM//Hkrr1VL4tzel8tjv4gZ9nGCSfpT+8zXgrujxIC4dwBEI3?=
 =?us-ascii?Q?5/YsAu88lbUtXH1YYxGTcgybd91b+X+bjmeXrBmrm14lIRlWAgWIwYeUmBlJ?=
 =?us-ascii?Q?yNoFnfwcUzcgU0Xu9D7/VOOTcSqOQj8bFjIqYiSI7qri3dauLng8cbReGfOx?=
 =?us-ascii?Q?dVy9g3v124w7gYjrpj8nGAaCcUlRRaap1QY89KZWEoh4qHdBjrocIKm38ndV?=
 =?us-ascii?Q?2C2YzK8+A7M+TKIhreUj93ysqf/SC7FD5BWI4Y4eY4ef25HEHk3UN/a6+uaa?=
 =?us-ascii?Q?S8WuCXkYNe1l07S3bo0LutE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6382b914-4bb3-45e1-3de6-08dd45767cd5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 23:48:56.0552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HVdp3zfVPD/qm7bgS/zlSKRcbADyu5PZEiKuPJkyDYsLOpAARxCpDWFXar3/q2wB39BjqvC/wbu+GBoQqFmd8PYSVgAj8900PfLDuqDXzz4MzVWSbX6hDy26OPS3Qs5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11709


Hi Mark, again

> > > commit 90de551c1bf ("ASoC: simple-card-utils.c: enable multi Component
> > > support") added muiti Component support, but was missing to add
> > > dlc->of_node. Because of it, Sound device list will indicates strange
> > > name if it was DPCM connection and driver supports dai->driver->dai_args,
> > > like below
> > 
> > This is in mainline but your patch doesn't seem to apply on top of -rc1,
> > could you check and resend please?
> 
> Oops, sorry about that.
> Will post v2

My previous posting patch-set ([x/6] ASoC: and adn use snd_soc_ret()) will
get effect from this patch. So I will send its v2 patch-set, too.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
