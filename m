Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8D917D6
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 00:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783296383; cv=fail; b=leK/RbglAHeEQbPI000EJY3Lh+gTArFmdlF0L0xul2h388HTVBsjvmE4PotnZXFZKweP3g5jbwWT6yM6Cw/Ps9ZLZxs8/7jH0bJ9bAFomlN/J7nq+cTshYmXuGojntOOp8vIB5KqelrhVFVoQt3GH1OIrO3UT45ods7sKVVhGYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783296383; c=relaxed/simple;
	bh=FZKOWY7t3EFB0IqxIWczqGhsgvISWmGBVfw9vYdh3BQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=G7oL8aC3Ij98fskCR5LmZ1l1DhuQZxqtGojYP1WsH0IcBObQiKBN3sEEvEfYehdmLvlZLgrqxvRrlJAW99K8G3ng17ny9+2UGM2iMbKv+OCh/yuz/Q35IbD0y1RlVCvZZAd0msnD/Tsf9t/DkhWfY8rx1OediT5Nid+qbignklw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AelfS7v4; arc=fail smtp.client-ip=52.101.228.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AelfS7v4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufNJizjNKsEciUJBXkW4dMtPA0NeSR958WbTSXoV+HFKy12rcMsJwfSncGyA/i12o7GzStqn0pTsiVOzN7yoMIWfbJtl7xv3qVO0a2qglikWs0pwLSAER8K/lDHH9LZpbHWvKJL4A7FIEyd4bTyKsPduRUQUVES1iSMjk1YEyMRyNXsA8QSI3rLiVPg7pSlUnzXYiWsJrTR+aZqKu4Xp1MKhOOtLtHt+//YP2yIj55Dhtr9bcFJIyp7LDnmXeJbgRbEpVUSo+68IyKKzKc8ixHzESti3u+6EPrxHWZ1k1sZSrWn93PVSBZBzThgSAL4C2/L8/xKm8fEacAHrwxXkpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCRB0yW41e2ClseDegx5VEycnFyAQHI9XP9wnUSsi+4=;
 b=jyJKFsJN5vBryTbPhmC10IG4G3QC8Dow8+Kk8OAIOc5lPdGmn+BYj4R+Q5r5v/4H4wOyn/4YRYpL2lOAVlNzIEgaoy8IU7X4ryYMJxNl255RJwKD2C0PoG1ZvYBFHsV/0KgPeZIAlToeCDmT9BkbBS84lvyCJl24NjOU/29nW2HZV4mBLdAvl/kZYEswD53SGSsdMwYR4fpseDOmO9ywD3s3FeWRcp166VEmx5tjOwTVtfinJ6T8CM0VjKvl2KzbAGZWGj4st5GlV1c20wGxX+Q3viBwfdviCmc4p5YTRbWsVb8vDKRTNt9CQ6V1VTO4fYR7+D0kicKKWo58Dq8ntA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCRB0yW41e2ClseDegx5VEycnFyAQHI9XP9wnUSsi+4=;
 b=AelfS7v4TP0CxAMnTFn5qvBI4oWmBSlO4yfEI+6aN8JZUApbPEpQw7ZCWS1gjZkJjEkrKgrCC/W7+xj6ywJ7eAihomtvqhZtrPcg7wysrdVSRZPrVeGKhZegrHKpKMTxpHPkFKufneymFqxmLCuAsX4mkLa5/XNn49bNbHiyxWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB9276.jpnprd01.prod.outlook.com (2603:1096:400:1a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 00:06:18 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 00:06:18 +0000
Message-ID: <871pdhc77q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela
	<perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood
	<lgirdwood@gmail.com>,
	<linux-sound@vger.kernel.org>,
	Mark Brown
	<broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai
	<tiwai@suse.com>
Subject: Re: [PATCH 0/5] ASoC: intel: use component_name for Component name
In-Reply-To: <7aa11565-9973-4742-9fdb-7c70b664cf3b@intel.com>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
	<d5e3fc22-8a17-4672-ba5f-167d8cab2aa8@intel.com>
	<87se66dyqp.wl-kuninori.morimoto.gx@renesas.com>
	<2965d6d5-6cf0-4fba-97a0-7a97861fbbaa@intel.com>
	<87o6grd4ol.wl-kuninori.morimoto.gx@renesas.com>
	<dfb5efcd-6c9a-462d-85f7-e8fff3ded624@intel.com>
	<87zf0axr11.wl-kuninori.morimoto.gx@renesas.com>
	<87wlvevtgo.wl-kuninori.morimoto.gx@renesas.com>
	<cf0cf8ba-f47d-40bb-8321-47a7054e2027@intel.com>
	<8733y16j82.wl-kuninori.morimoto.gx@renesas.com>
	<7aa11565-9973-4742-9fdb-7c70b664cf3b@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 00:06:17 +0000
X-ClientProxiedBy: TYWPR01CA0009.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB9276:EE_
X-MS-Office365-Filtering-Correlation-Id: 13880ee7-03df-445c-6bd5-08dedaf266f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|52116014|5023799004|4143699003|11063799006|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	sUzcg3A8H788wF23eBGxS8E1kO9VZ0LOgH2xZ8gcMiKydECQWnfI5SabkazwFg//Zp4ELKM/6Mwe3Ks9YbXoOihmi5x7vtbStlJM4jEOYMVfFq2nixUDbqRwAPuLhJOPF8DXnNwwa/kvvZerdFAsLVqQIT4FSeQm5UM1IeteXmpzNaf5UKWcTwPelONRXsjNsah4FFFNFSqJ52jwQflMJwbw6LKwDW2Dz4WGqBxBef+s8r26hgDt1Dx079jZeUov39l/xHLSE9LGXMTK/mOgN85nnefm3+olykIMyQL0iXIyU2sd12nXEt0SJ366kpgZ8RzZ76qGFsbUWRGmcz3Qs5omv86iXsp8wsZDvdDCEr1GmaxGBFktRp+fPpBSlUQZOnNJyLbLpwYG+mu0GfX7if/3mU1pkhWQC75IdRXkuLoy5xOTRY5X61ae4zUKaQ1p8QcT7rm9WQFxhl3MTHChfzMj9SYTgvNK1ER9+TL2GdMIdNYUPYob5MGRtPWdEWJxBky+13IC3s1Y+m/U7kq5M0qY+d3ceOREf/kmyUfiek1RuIhZ8IvFucCYa2Ern6vEzXIl59Fbjn2K1geMU7xPEtZdknHlhBmQ7WhvoRf3tCYlfI0dTzlmHJBWFmWZ2xqQfq/wJBA8/1HJwW6WHn9i1GpmazG6inxhPytW9d5C0EOFK3MIO6MckUGmw+1/+fKz1UFVgTtZof6Lz3hdIcHNag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(52116014)(5023799004)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o8qsdoqoBjOfV7yPM/TwgqwEkOIM/TNwooXN6k7y+kRjHPWLfBeR887snibh?=
 =?us-ascii?Q?ClmSSSrXs18Ik7KQJj4m8JeQ11q2llDiwPyqNm5xumWBILkhKHvEiGKDO/U1?=
 =?us-ascii?Q?3ko3WKnnaSR6jPdZdsxS6zjUPbYnciA2SdWNglmj34nVWshV0YLN3bDWJrnS?=
 =?us-ascii?Q?+ec2PDKZxcOYtY2gDwQrPdAhGSfQKm5YnF1FZc/s2ZhONFtIPlTw9t7i7mUh?=
 =?us-ascii?Q?T8MJ7VGzZu5YfRARXPScpfQlDTUuYVKf2z8NlK/XfiWFTVG3H/XWtITDA6r3?=
 =?us-ascii?Q?UJ361t/tacTKInKgUVkkr4YujGQqYnDV9umUeQhERV80mn/m8+YktOfeyQ1v?=
 =?us-ascii?Q?YdGwDqX6xlVALceNrqnDTWfUDj5k+yvvGz31KBJhZNysW7bJDQCOyrmctX6B?=
 =?us-ascii?Q?6S2CNkxQzCBgYqAHjkW/VSaqhHT1knZAKBTvaRFJ8zfJ8kiGXaRd7sNPYJWJ?=
 =?us-ascii?Q?iAG6i0hJxNnNrDG24tNEDjNgkpwskWSNGJhdhpkkrnQc1WQcdPrFFSY/cgUn?=
 =?us-ascii?Q?4TYeqbYAa08ZSTWgHau2uEPawxWagsTmDe8oTWB1cgRbiBuvDgMTKXkFDdZ6?=
 =?us-ascii?Q?bFowN55lHN8loqagEttp2Qan9XgMQ6PxWrx3/Uc/kMMk/Jbp2KC+m1YmDsZM?=
 =?us-ascii?Q?9pQd/EXBDyIpvT386A/thmvJLIyJnj0LwKbpHSgYJQz5hVeWOOYQwnv8sVGe?=
 =?us-ascii?Q?njtAG8fAkZ4vAZ1WtduGmpGLBGR5ksUPI/bag/UegIVCsg0Q1aerCGgxOzF/?=
 =?us-ascii?Q?bHJulubjM7H1cJcoUWuo1t/QplhxdgmO1RNPISNlZrWMMCPnRPcx+sZX0sMV?=
 =?us-ascii?Q?Xdqmu5ict8WYCH54wvEIidhP+Ngt4NpSuyZJnoIvNcx2VspmYUT90J4ie95A?=
 =?us-ascii?Q?VVceAwEuQ5hRmZyXnsXmNKtny3qDChkVKUIyDINj+B9FL2EnUPcvSl/N3512?=
 =?us-ascii?Q?0fduyJ0kYFwu4RdwFTadOlohiVJMJu5cd9v41vFQ0nT1Q0PoG0vo6s/QI/dO?=
 =?us-ascii?Q?JTGiQbdEXrOiqSfuhTBbUk7tbIHABrBpoSwLnhD6GnP+0f93Jfr9uunlq4CT?=
 =?us-ascii?Q?Q0LolUrGlze+r7Mj+WdOe2NjzmKugkmVLS16MQQKJD8X7xGr43nmhJ2K4Yv0?=
 =?us-ascii?Q?Xvizl3pgOgFzl6FoIsmSFlrjAnJ+fhFwjDqkrbOhuwDv+3qtuO9QNsxrDT8r?=
 =?us-ascii?Q?S56ecaak2jVGoTcb5nzy+J+yCqiTMDL0MKqDEauDyt+6SzzFfis7eMqMqOaf?=
 =?us-ascii?Q?PsAU1IIEXlPSqweaLhjxPkVXPZqCgFFSvt4/soz6Xz8dsZrzDb3Q7EIyMP1j?=
 =?us-ascii?Q?0t7wNIKgWHJPUc+kXvHxCdnkAMA/Bq/LqKzbBecNK2BT1esGjGAXrHtn/7s6?=
 =?us-ascii?Q?ly+iT2rX/XB5eKpUfCVEnHszr8NgnY/xrETE6qV5BN4vKJ2TIeGmFr9GQC1z?=
 =?us-ascii?Q?CEF1LdlVKiTsaQEfXbzzSydFUiQ8AlzVltmqy/yGvI1TEDcwVo5e67Oe7yxn?=
 =?us-ascii?Q?A1fmRqP7e0jWZYdenzNqutUsEIWckf3fJMgfClyH4FCYtb+HQ/SMd8cIWvyK?=
 =?us-ascii?Q?FUk/dz3WZ3izR6ltHGrcodZrTT7cLoMEocoTQJibF4Hyxz1c3aSBJyyVzX/W?=
 =?us-ascii?Q?odOCpdDwgFzmJHflIQLR4lMk+XxwPpmFjSDlXypmn5zF3iLKeTlDIwd3ru13?=
 =?us-ascii?Q?0rVcvZyWHF+FA4gTjPIatkyibG3zylAguukfSPwJoarMGlqYButGBFkPOTa/?=
 =?us-ascii?Q?CvChGtsHEUlVvZN4ih5VF/VZ5KJcm2Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13880ee7-03df-445c-6bd5-08dedaf266f6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 00:06:18.0130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0da5wAy9RlGWF2HxZLJwoCN41c4BA2g0WlWx17wiy1MqIzX5UY2imGWVd3h85bclzUKIveukUavp6WXrd2gmFVjHvhgxujkoLnC7xS6Pup125rqGmHOYqVTnhIr55BSN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9276


Hi Cezary

> >> 	snd_soc_component_name()
> >> 	snd_soc_component_set_name()
(snip)
> > 	snd_soc_component_name()
> > 	snd_soc_component_attach_name()
> > 
> Why? There 'get' is typically matched with 'put' in the Linux kernel 
> whereas 'set' is often paired with '' (nothing) when talking about 
> getter/setter context. One of the most widely used examples: dev_name(), 
> dev_set_name().
> 
> I'd prefer to keep close to other, widely known headers.

Ah, yes, indeed.
OK, let's use set_name().

Thank you for your help !!

Best regards
---
Kuninori Morimoto
