Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010055.outbound.protection.outlook.com [52.101.228.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02742221F0C
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 06:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773641074; cv=fail; b=YelstSJ5maepI9Z8Y0geuurzhxBNK0UtrNPTtn+VX+tPhFdr8+WcwLBnm+Il8faS7emk8z1yhxOKM8ewcwHhPfWg9eKnnZu1w/0r7KkNX0w5mfWAbsi6sYo8Bi6ddZPwYoL/DLkUkwTlW3/ijOiVXfVJU2hNfICP0mDJgW+CG/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773641074; c=relaxed/simple;
	bh=QcJaGyJvxat7XX0JG0CY/GbWovHOLWlsXMZEUruir5k=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GmB37e+2TwU05W9o/mRj3WPgduTsRHUS/EpxXRpYidQm2by/Jsr0rKtFE9YAFH6EGPuWN+rXvNC+eaI0tCbTd6FJAwN5FUFEJ3VgIu5rSvv8uszBQemjov/BO/cb9JXhzQr/O2lrSMaLwRblc3liRUq5BPKOs4SGjtX/sl3Ilk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hFp1lVtY; arc=fail smtp.client-ip=52.101.228.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hFp1lVtY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+XbH9GgyGYafPxyAQP9RFbgimNPCcMcXzr0nufuJEsMBnBCVErXrY5o6cSZmqWjLAKHlNreSOiz8wG91l7z4gjhF2jW0JTksCfhyw4FMfw/he/TEg1L29HuEH6zqwqksQhpX8iJnRuoWoQsw4/DT8NKdyEshfQWpyq16tb0i1YFhl+IbTuNNI8nQSnwd1McOTU2wgzZvlaRLOvOn5SpR4YwFnbyAiDnIfrw5rUD62lt0WRzgL+suU+Jso4qY49mEa9OYCCPxIMRh2LLsEkmv0/Hunkvd076O45mgMCgxBOwH0nfqwxzYhlAJuQd3y3rb/LhyfZXED2KQ3amT7vI3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHmYDPeBvpbiXJlGteE9GoqfolI5QoK/aqV4w7i9w78=;
 b=MUpfPFr925+15th3djy+EN+XVH1EF6vYY+MdLTUzYiHAVdeb9rH73gl0lxZSdfW9I3p1FfIFkMDVRAeMwH/9vNuQsli/FfnieR42oWgMGQQaqvw9YfDxjzj7xenR4qwMcGQtijvYMbOwDwAC8z8RSjxF4cUVDT+XF21kn3LjZ93ymLadGUDk41LM73cC3OWqDxSAeqBPjVUEt0MD8BUbDIkKy9p3NIbBnx+s73QfqC3/q3FleLfEhd9pxCQXwwSurXyl5lsn2JVKraC6q+kcMAqiD672VDMgnH8PNUtJBVnfHswTsn3DbsEZg1CRmqjk94H+GrhSWhwTn+YGksTkDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHmYDPeBvpbiXJlGteE9GoqfolI5QoK/aqV4w7i9w78=;
 b=hFp1lVtYotJ7nrvEyJizEtkzZ4I+/mgnReBgrQghSREojSHz5coshSdu2z1FqIug08erS/6gldwVcchN+S4DTZEi5hQaCHbUHAjSuRF9L10SPtLBf0NRggOtQgoJyRixWt/keI/goZFhyEk5/lk6+YTaiMyXQww9Yln5IAszg6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by TY6PR01MB17861.jpnprd01.prod.outlook.com (2603:1096:405:347::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 06:04:07 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 06:04:21 +0000
Message-ID: <87wlzcia36.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: Question about DAI count
In-Reply-To: <16d4f5c4-79fb-47ee-81a9-1f7c9f2ed16c@sirena.org.uk>
References: <87ldfwy16u.wl-kuninori.morimoto.gx@renesas.com>
	<16d4f5c4-79fb-47ee-81a9-1f7c9f2ed16c@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Mar 2026 06:04:20 +0000
X-ClientProxiedBy: TY4PR01CA0007.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::10) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|TY6PR01MB17861:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f8f4f9-e1df-4dbd-dba2-08de8321ddaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	13JKGpQ7vPWpGHsj31/Ivd0+brjgJcSc4s6OnMDx3PECkPNSguWfMrXDTzTGC5d87OYxIgCN0kpEi9HOws/yy+XgH37DWGjawn8T/if0jPsS1dtMwnOzh361hKfmmwqldh2K/JYuRHXC1zz63ka+YhNxxeUd5BX43MURoVg2L5//otbckv6D/XXtffG+qQzjzpfZOvAF9ttRuYcI8IA3u0r6CXjJ5erjlBxBQXkQXu2qpR4G5cHqvpv0lhdref2QcrceWAzx4xSGBxcwcuRLyQY9DXs/1brbcDBdnl+nf4rFEKhguhIvFJz320Qb2yat742uNLGjskORqgb7RhbMrlLAD1AKOWsH2WqwPd8hWdw3UuGSStHmSjaj/r6PrLgRkcjlbcJN0zC4gKSn2uEEUy9QjDxJAv4xDh/R4gfxsVFBb/BzmNO/dEfcaZtjQoyQgBC5TjSD+3PpxdsJEpL9nbyQTydbfcF66uQb2gMvvMhBIISrhKH5u0E7Y+0AdsrFmErFxhRHIS+hD8HJu6dSSFgZbBu5gBJj1DffwdchGFIKfKvBJwvnr1sCvL1pBpfUzebhOwuVs2L2d7qLXhm0SP/lqdCRDf2b9IpPIGbM7PSMAQrpEPcwaO+51sgz8MkirjpR5EGVeJ//tbqp7LB8TMuxD1jGA9Lt9qb690RtYvyB84wTvtrPIyuyFQ1MpIGOUWzrAYGsc5BUMFViUTQygFG0AFJ2qnlfK4vcGKvbx2wcsaoCIdQqHoJrS76zPeKxqjYR34CqNhb44fILzTHR4i54aRGL9HzpUZtxgHvPL0o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bs67k3n7JUxxsyTaLOy/Lg2Ue4ZBgtIP/lpSGIPnFDd+qT1Dg6HHQzSp1D8u?=
 =?us-ascii?Q?r6nc/2DFiM04vqD3kOQmShNIyxQ5+L29TBJ5luOsiMwvo1YZymNHsDynW1U8?=
 =?us-ascii?Q?2QUJyW/VtcaSlUBDNw9pIZzVZcF7lhLyw/jDV5kZUyoHqfxH3KVp5k5xh81c?=
 =?us-ascii?Q?MQ7JvR1MDKJhFELRgFeg8BHqy2nKCdzkiDPAaZ8XA5mQvshKprsslOTWfN0J?=
 =?us-ascii?Q?h9G3Ykgi37MBBHH55IAPaavrlUc15sFEbCCq6Ny/klQ9XLX1i93nJ0EMSLpA?=
 =?us-ascii?Q?HnaqGWXqTVwbbsaMrhrupQgytmDMF47/tS0SiqOoAKxZz8+h5q/3Sde8wkqX?=
 =?us-ascii?Q?N/vvRaPW/PVHE2aKkpsttmDqq1sG1DU4F4MggiPc7dHZ/zjfikQsMQhjMWCw?=
 =?us-ascii?Q?4nxUCDgZXVWAdvILOi60c1jZNgyDGHFXz2eM77emJ2uNQRxpllYbJxIEpEE9?=
 =?us-ascii?Q?xcDogWawwVLHsGC2ZY6QnCsnBLUbCDPMgp6NaMt8tp6E6tMsQsqiC34cXpyS?=
 =?us-ascii?Q?RgM0bJwFyCTwDYB6lu6jntsUEOLlNo2FLr4DNf4b628e2wj/pc2NdXGIvHbf?=
 =?us-ascii?Q?Q23ahPwx12pAMzb61qbiSSmNu83FSWUQS9pI2dJtKZaWV5t3p+1jzCD/1dFR?=
 =?us-ascii?Q?zvVb95idM5tP2+EW4UM0/x5jqg6C/7K1dTuKFiJ3I6910GuzZxwW5PqCOp6w?=
 =?us-ascii?Q?TehGcU06aa5036Jh8w2V0eXGGLta8C74AqBxTUk1CUYdNgMp+M+ks04cTfHk?=
 =?us-ascii?Q?Cylhaf/dWwi4g3mvfSAh/YfbKWPNe/VGL0iAQdchFM2WHDRI0Y9k+IIQkNP6?=
 =?us-ascii?Q?5rTlvK/yZQm2L0K60JLsBXp/rTsbYeij5VGCPlxe7rHYDr6i/RqyDg3FodP3?=
 =?us-ascii?Q?VDHP73qzKdbvvVtccRfeG0/+CUKKuqExhDiwBIXbIKJMjypnAKaQIf+pynlF?=
 =?us-ascii?Q?VDktGbNConsfekxEamqD9l/V4W3wsdJ1Nqsf9LKzHqOfgxaTUwwvfpLA6LNu?=
 =?us-ascii?Q?P7dw14BttzUzaPpK8zrAB98cN/9NscFsK/+h5jgwM0GmtXs/Hme7jlxmkuoa?=
 =?us-ascii?Q?BiqHHWh//cpuIN8OauDV2MtMAL1aef8tmxA4Um9SLQg/tzja6laEvgIkydq8?=
 =?us-ascii?Q?o88npDF7UWjFsVGysbzm0163wMjW1i9GiOqXG797nMgdL9u6o/D+ucssaCIU?=
 =?us-ascii?Q?Z9Sr0dY+QET+EAlOMLqWstUTL/rrPDkewZjp9BeCym2K5pDPErjYpIdGbV6s?=
 =?us-ascii?Q?dxtBOAYi9y0q3hBTk7CykysIqmVu9/2bzxxU+EvtsuKEHTTl79F7uDblUikh?=
 =?us-ascii?Q?8rR7DiBMYEnl/Z45B5lSxRAjxHWQ0KvmLl2jsk9n0lTUpuaD+HUiA3wuxhN9?=
 =?us-ascii?Q?r0ffoNwWFYQ4l4Gu37Zvy+iZ1qlNzc8Wc/sFEZN3uT09PdWEONrxj5P4aq06?=
 =?us-ascii?Q?/Uy1+R4KBejb6HUKeHBjHRMilW/TBhTNSFQ5ckTxd60sCU0MLYHYqO3vvllv?=
 =?us-ascii?Q?GGjV2RuQow2bZxGY8ywgeCuIlP50lfePRRMRJbDc9aJhdAuJOPpVGq1M0XkE?=
 =?us-ascii?Q?s2tT9xzZj011xqgptzscvzHrKlUTKjgoA3DIfiP8+jQf4uZ4rdezt4i3bUu3?=
 =?us-ascii?Q?pjbl0zbmDq5NcpAU1FR08jf1wRo5BdwSrMHNQZ7Z3QrY+Kh2yJPlrTvyppfD?=
 =?us-ascii?Q?DDqaEryDd2pFuD2R4H2ZjDeWQn0ZMWvz1Jh9acOXtjQi/wNwbWc7g1KnIoNw?=
 =?us-ascii?Q?kCEYbvqODMJDuAUJ5A3ZQTpiXhjs7nU1WXqxgCkXR//X4OQsnQ+j?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f8f4f9-e1df-4dbd-dba2-08de8321ddaa
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 06:04:21.1255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFi8CxeLV7Tjpe/QpV7OF5+lWZJ3c90aIjcjxKGdhngDnuL5xLomJnXfiR40Lh3YEacYOPD3QpeCQNHfJLXONTjIZ6Rjnp6xFNkuz7UiXOM62Kfgtv1ucXOkkCNsEefj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17861


Hi Mark

Thank you for your feedback

> > I'm not 100% sure, but some code are caring DAI / Component active count.
> > I guess soc-pcm.c should call activate (X) / deactivate (Y) too ?
> 
> Yes, probably.

Ah... sorry I was wrong.
It seems we have 2 type of conter.

(A)	snd_soc_runtime_action()
(B)	snd_soc_dai_action()

(A) is used on soc-pcm.c,  count up all of rtd DAI/Component
(B) is used on soc-dapm.c, couut up related    DAI/Component

(A) is for normal ussage,
(B) is for DPCM   ussage.

And (A) cares the Component which has no DAI (= platform).

Hmm... complex...

Thank you for your help !!

Best regards
---
Kuninori Morimoto
