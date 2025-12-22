Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5982878F3E
	for <linux-sound@vger.kernel.org>; Mon, 22 Dec 2025 01:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766366772; cv=fail; b=Mfj2xmAauefxOKWJzut7GUJJ6Q7GcTc8KOY0iUKVfA9cRwDzWrPDZkm+lUGSdV9r3VSpPOE/udrDQIqYaOA2y6OvZF+QQlDngNYUnKdG2kHJlJRmwa8jy7qo1TxkEj0APxQ4SFVrYlO9MFkqEGt21F5R+XboaT2TSyyB0RpB9dI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766366772; c=relaxed/simple;
	bh=eZmszz9uYeEC8/tevS9E1fBxATJpmg1AfP7YOAZyn+Q=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=E021xspsL2of8SBfTdIGJhMLchDhHYTYL59eDPVmLplkuU1X1ab2UOFk7iH+nQiLGxfLUM8akz+Y+4hkZD5iHsYs/8wh4nwSuCu0mpbvcsMyIpL7xkc/sBEiGxqr6ApRv0Rc7pe707n1un2l64zNFDTdoEsPf1zt4tIStVtJ8pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=a00Uc+Dh; arc=fail smtp.client-ip=52.101.229.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="a00Uc+Dh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJ2zaNLJRPydqE6jmsqLK9Ad/LYeYSGAQonIThlAIkTjD3TQdO99s/tMorSoohUPgoCA/ep1D/J2zIEABfB4gMb1DHmywJN5y7pD5FdTbFumkXgA1AJjbu6nL8mgxeYih0qRMD4E76CP6CPFMlVvvtaTvHU5aodsPY1yUwTw/XI9HAhHwD7EhQi65vbPNOTJK1pwWf3MuQSSjoMB3CmKYnC2oD6794JRxqAxdRgeEcTkXfBswgqHukALUN+5gBQ7dLzgq9J4BzlwdS3gldJeW1pp1FZxdypZQ0WYdykRfb3dbPBK8+Mex3gSIdb2Z7072vzUxDsvyoVvX+qcf9TDow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBN7eGa6aHkdVjhuyGt52edtk4JkZK8mpzmOS4DIQO4=;
 b=qnMj+PcZi/HqUGGxfKXEv9VafkxHVDPtm5O70rGyslsY/JPWxd4nT1sPbuIucF6xZC3W2lFgLGx6hfwKfFC6zMpTnztBRrTVhD4IoVzH1O/D2lry59Wptp7f8O4lJDRLUc81M9hjxjJDxf6ibcMOTDKkpGMQxonVwT/n89+vb2fOAW1pgwDoFW/J9QRAVdevLFhToZQ2Hq+pJkckhyvqM8TZkRFK8MboaHzylYzztreZi951ip2yQLeAmopMMDRm0yp5J18FpkMgZXYfquB/qXaSbB9dujl1O2O4QqvjVd/HIphakXykbkkTJvmwhIjqpkgTLmHhP/C/n4mjj2NJJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBN7eGa6aHkdVjhuyGt52edtk4JkZK8mpzmOS4DIQO4=;
 b=a00Uc+Dhu3XWI+zHu1cs/4PWbM6dCVO1Re8dPn1km+zukBH/gQdxwOEQU622EKz8FppUalQQ/jHmIMutLJsAjO8hAbDhdluKURe3yzsuRH86fSHT/FLJuaqP8CsOadxAq6f/FVVSdbonnysXptJu21GDXlPCFFB3UnrbpOmv2SM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TYRPR01MB15468.jpnprd01.prod.outlook.com (2603:1096:405:285::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 01:26:07 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%3]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 01:26:07 +0000
Message-ID: <875x9zwbm9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linux-sound@vger.kernel.org
Subject: Re: About component->card
In-Reply-To: <f3e964e5-dfc7-4c76-8b98-a6bec0f784c7@sirena.org.uk>
References: <87v7i5esrk.wl-kuninori.morimoto.gx@renesas.com>
	<874ippecif.wl-tiwai@suse.de>
	<873457z45u.wl-kuninori.morimoto.gx@renesas.com>
	<f3e964e5-dfc7-4c76-8b98-a6bec0f784c7@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 22 Dec 2025 01:26:07 +0000
X-ClientProxiedBy: TYCPR01CA0204.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::11) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TYRPR01MB15468:EE_
X-MS-Office365-Filtering-Correlation-Id: e4375f24-bfa0-454b-8582-08de40f914c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9oREmR/nuB0uqew21R+g1yU+4frh2LT6MTvlKvvIeqWykM6r9w4uXZ1EXa1Z?=
 =?us-ascii?Q?qkEvoWiZVrqgamdOnG09nv5hS2hg7Of3PgUs2VFkE17ODKsoitrKmXurh0za?=
 =?us-ascii?Q?8+y/i6aYdE0725m6etuIph2kA6gg5wGzizL9FE1iwjoe3LWGTzVAEi94AfvC?=
 =?us-ascii?Q?FUbcvnofOFq6lEJ9t4K2KSQSrl8JLCC9CYfv5DFVrfe3H98XaSxGHX4oLHRR?=
 =?us-ascii?Q?fWUS41mV2VkVVDIMqa4io5Cry5QtwHzyUtdWtOaCNvaHb2wyx36ccPTeSCUB?=
 =?us-ascii?Q?fvhiYstJ35e3VyfMwQRVUX1bE+bJ0tHmjj6NQkNLI0aF8TYMj2Ul2itkg0Z2?=
 =?us-ascii?Q?9dmdxCkqoa/31N2YyqX8s0md/3E+h5CQLbd90aWGfxXGKJEnwOF0aCjn3y+P?=
 =?us-ascii?Q?k8v67rx9Ae6XN/AkPFZC56PpOwibrUXxqqU0Z1dxw73HIOtHl0msxA695VB0?=
 =?us-ascii?Q?dlhHdXntXRJ5wRsuyYcL7kzP3GyHaNMirIKnMbfxFHN79fBdUS+thCKfe5YG?=
 =?us-ascii?Q?KmJtmd01aT8LDyE0qkGJ+2n7u1Y/68bPWDXENeZbj7sOrXxEj9fBj9800ByW?=
 =?us-ascii?Q?lF+8ua+kUGiCoC+/quuOwCr5A5F7T1q/WNCkYPHEux5yJfpHwtMbnTWQDttr?=
 =?us-ascii?Q?sHShL5FDdpw1WpYZQzD3fprvkPsSlx08PHOmQ+nVvl4GM7g60HnvzuUQL5/n?=
 =?us-ascii?Q?dVvdjzLxkGTvZwj2z/uBc/0fyVmSa/1gCxAirdmRqwVQ6swGLluDE47VVBQf?=
 =?us-ascii?Q?YARW0/zMH9MkixHZgDILzFl/9Qsce9yeepkukdiB2d9uG3W5CO/X4HplOEQV?=
 =?us-ascii?Q?eAFNbUhnqz/llmbsO7BNZDObPdPaM2Jeg8SvDy6STX1elwGZJeT9B/Hwp9dw?=
 =?us-ascii?Q?80oelbDCXIGe8BX+UFDu2OLpQYGVFrgzosHd9nQujI3rTrOawD9yui9d1hrF?=
 =?us-ascii?Q?H91XGJJfeh1o3/4KOg5xcz9BvD59/udsYBrgivuoHunzrLy0KyZPvZwOmWfU?=
 =?us-ascii?Q?kEg5Fe2AlLG4QlR0KcJGZlY1gQd22SADl7e4gRLqMlO4uigY9DBNp+wVRbbQ?=
 =?us-ascii?Q?EPXW4AppjSlOiGH6UdU2qIoip1qgj65YhksI9AIsCwuFd+XR0OT72838+xi+?=
 =?us-ascii?Q?lAmceMtn7159HLfzxhQJehqgnbGoPvCOLoOm8j73hVheLZF+oRt4MzxRtMeS?=
 =?us-ascii?Q?NDgkNZrAWgCYh5eOzYEpvXc9mi+mH/91P8qDhLc0lYpFyWjtzcxwbjjVrhQj?=
 =?us-ascii?Q?u8xRk0h1JiT+4b8nZcFOyINuLOqtmWbVZoztYFik0bF8zVyDlnAw9kRvMLso?=
 =?us-ascii?Q?ZwtVEepm1Xbpm14Vfs7WHDjCI/oCVTqVfT7T/uJieWNcEtHiuzlkqu7ckkPW?=
 =?us-ascii?Q?BUKILPwkK4/0+TIDE1BeKGVrzWfPUCFsXvZOGyOzD1iZApIg405+Eyq/vMCQ?=
 =?us-ascii?Q?GcWl4ovxWTaxscYsNvIxPC85hNHXbNRk9j7C70sNnFrYiZWfZmoZ4RnyP+V0?=
 =?us-ascii?Q?lPgPM29TF2pmrujMWRxWykthwAJatHF4qFcF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C91FC2uOORO6YwGdyuEoNQhwk+VyE6XkMqPWaup/EepVzseKL7UstCRZ0mIY?=
 =?us-ascii?Q?GLxYAnkRJYg39wm3Nl2KVDwok5S/WNLzCmrfCv7qFJ6KxzzQGNdgwQaF92Rq?=
 =?us-ascii?Q?zv6lRaL4ewwrYCpq0XjFo8EUi3HSNkBcAkO7pE10VZ7+vhUdTALZrt6Agke8?=
 =?us-ascii?Q?XeD/lD57D2kBXoIllam8DjqK0yMB2HoCEVWtGuMeFZFlZv7lmoIGLK4S0YjN?=
 =?us-ascii?Q?ATTTMTUmW9fvZaQ6QB+QqaE2dxBjQzj4iK3Txn3AK+9A3CObtfoG0qddHByK?=
 =?us-ascii?Q?VoCDDLER1KNX+2tIOPZU4TtMokzGnAFUE3ZgF4Pjhy8baMXWwoa20jAZTCrs?=
 =?us-ascii?Q?2C3Y+WM9cysZ2dp6ATb8lAa6YODVsLBmFoJfhvD4FyOBEJ9MRstjEflmwy6P?=
 =?us-ascii?Q?8A+0NepW4NPsRXhwa3mOVhsSz9jXLcUDR0OHCv4GSdY1gKHeXkznDSBA9goQ?=
 =?us-ascii?Q?diSaKPYR8TDQWck0R8QU2c9CRFA0EmeeoW/GyhLExmSCFkCOQdllOUOV8WSX?=
 =?us-ascii?Q?koHyFdRf89OKvKQ5h4tKLKB8Uugqu/pPac/ojQRk31DpYxvrA1ZDFlJeMN+C?=
 =?us-ascii?Q?gxGBiDrrnxdt2GNx2yvsq4fv79EyZ9JeFMfgTzBPpF5lvHEYErmtWRsXcTkH?=
 =?us-ascii?Q?oshrZlqelgytnyuc8sqPkJAlaOEQQ3cfoUzZczlX36zyxJ1cV3klSVi/4yEF?=
 =?us-ascii?Q?dPAwRJgGAV2cq/mwoLa147/SSthPeMV6W/N/dwJOzR/VjRXHgWC/2sr3I6I1?=
 =?us-ascii?Q?WmHPJ1DmnIrfBB02zFUwCKcyhsJeugGOZwY9GxenLX2WPM2dZqzYLIdBrImj?=
 =?us-ascii?Q?RXqnspff3aLmkJoFFydMxc6O1RYcBOMU/elrRygQfdDc6kCp4prkHufE9bI2?=
 =?us-ascii?Q?25Iy31LfE/ukJFnZmkHlb2/1wcmtpu3YJCerj70x27bHlMSF4j+XG3aHPAR9?=
 =?us-ascii?Q?8uE2my5VMujdRwp+zVujRoipm0E3MUZQn3JAPIiJqQzTdIoVyhFHHK4HldR7?=
 =?us-ascii?Q?icZJrfpydcoDQ4KgRY1WtfIikEUqZ5faAdP8YCc2BGhL1ct2ThHLmUPm9Wip?=
 =?us-ascii?Q?bWL/KSu9COTT+IaFmzhVAB1+DoocfLC+wvPEkiW2BhWGSwknkavKqgsu2aSA?=
 =?us-ascii?Q?ZC0tNGWo9RKK2BDL/S3tSt5mieNEOa9P/iFUV56uSvkmsAIDwg13pscrrAiK?=
 =?us-ascii?Q?ueJDP0Wa+x042kmoIDa5w3T0mwQFpqxyNhZQR+al4VT8kE0j+AUQx2qG8oAz?=
 =?us-ascii?Q?Gi89CKMKa5hhjiJ3rr3dXI2860LzenR7J+N9+9TNL11qjUfe74ksEq6PL+7t?=
 =?us-ascii?Q?Us9URYPk1ekAXdBccbcniZqONb+P02PhZGnT5PclWNmcgOV/YBKspNC43s6x?=
 =?us-ascii?Q?I/dZu9FwdN67c8r8h+RKh1EIJBdPKIchl9XfxxmYFvx2phACRE/hBryn+69V?=
 =?us-ascii?Q?PhdCgs+fytPxfmatujVHmGg1UfP4yZdE1YS4dOqKh7h5lSmuz0UIVMe0XecY?=
 =?us-ascii?Q?NRk4nSD0lyGz7PVFpakISVdiFooSUhYrDSsJqV/3lA4A3X9y1kPi0UJkg3Bf?=
 =?us-ascii?Q?F/d6Gj7UKJzOyi49W99gNKcRUqv31cfSb4jtn4WdSlcKhZFMLzoEA5CT6o3n?=
 =?us-ascii?Q?FAFmC+APMDFk5J4Wsvg0/zR2/J+CaATcL9yFmFNhUBFg2GWR2fuWTIFep8ao?=
 =?us-ascii?Q?bG5ktciH2ZSJB2lipYNyNVXTfZvfqXp7l0nNqmrLZs6UMKUlv7/FX/Z9IEmD?=
 =?us-ascii?Q?iKUDg/n9EgUCFgTDrRuW3C+ysmfBF8+dwOT94bGm1M/IYsmP9LEY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4375f24-bfa0-454b-8582-08de40f914c4
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 01:26:07.3831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Heqe+YVlEGRumvFEcxzhxC56ynpe52Mp4888v/T7ls3ns0RUr+kjBnegUInxvauHDPYoELObOVUlYOgSzRUq4qwsrgIb0Ie1DUfD1avkZ566lM+gvxR6YZyvsk4LvBmw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15468


Hi Mark

> > Indeed there are practical concerns (= complicate locking), but apart from
> > that, above image itself is not so strange, but am I misunderstanding ?
> > (= It is one of the gap between "ideals" and "reality" of ASoC ?)
> 
> ASoC really wants to glue a bunch of components together into a card, it
> doesn't have the concept of a component being in multiple cards.  There
> are more assumptions than just the locking issue, for example DAPM
> really wants to have a single graph for the whole card.  If there's any
> overlap at all in hardware the natural thing in ASoC would be to have a
> card with many PCMs and ouputs rather than have several cards.

OK, thank you for clarify the situation

Thank you for your help !!

Best regards
---
Kuninori Morimoto
