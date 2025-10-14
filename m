Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8B530B504
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416089; cv=fail; b=TxVyrJMleThanb6r4oWPip6SiKO4NDLqFz1zGw/IcsXtJbsNY+3VaSrElLEgSy1pohWc9yw3nG9j6mFIJ++VAlR15FkeaAb7+RrTOd+kJQfmvlEwhBTpegZE/5KcWiGs2jyKdgNfFmTLoG1kNjsosBPNTp17Ik4cRZMRz95M6CQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416089; c=relaxed/simple;
	bh=74tFMxfkgzd52w5qlSp8y65Em3JnnSuGZCUjmg1EzPM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tlRjby8VjfZOoCTWsiEpOKSeYDu/idVBZ+p4WrKII4py9vqYFHYqNOaUPJ2I8j8bvhiMFlve33POsdESfeXiwa8YWze4hT59wE0u4wTnoZVjic/Eo4gPuHcMDS+n1bWseSHsvqEGMFwGLvyYcGLwTQRK8VtQ9qK5//tcbA4ZJS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mciuwv8k; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mciuwv8k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/bjAOdG+nESMw5YMGWmPERwtc2cZroDtiHBAnwQAMmeJc25pnkaWqQ8RjmzoXEmycZVo7TPbUKNEo6HPLhoMFNfa6adu8/FrjWtmWiMFjEkNPMI0zCGESZ782XP9vIqnBEAWbIAfB7WUn7p87HZo9Yc+B5T25qrOFYC2Vt8raqSEQDQuYdzZTKH3O0p394ghJbrqBpDx8gT7zDB/Ch6lfD1Cd0+tbkkxxgvYalVy1CDjj1J5OIDxHRuWRJfmJzN+ptRnLQulxPCElVDsDObXuwz+f0kLek6BeXz17NivTNXU3SeTa7Mf8wy+j+zxh3oWhrVEXo8XZ9vIPKObYqgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ddy4a0HulGafsAUyGauQzewD94XZV/maL6l2vbo/Ud0=;
 b=YlWXmudR08SVGscOiu1wKH7r8QFfANlj1bnQbDV3mig68IMQQM1uJlT0hLS2FZoLSnRosXvf89UiTd3aM3NNUERP6wvvReEtLf3zWfF9XiozJshTWbdbCqPeXGzbSxONQOUHmuqd+neneNz+30VnMiHwUky5gqyEvkC+cQVdhnQ1MGA1D4fSTkXBRrUxgJBS5T2NIOvOc5Oc7LVZPwDpSZ3cp0PZTqg5YR5xdrzOQlpgeZDMWNeR8shXFPGP2lOA1LKitxAa6JAklOMG2N4cn8YcT6TVnGjOcS2+f2ejGpdt9djCqk4KkjbgCaJukCo6L1K36mkAj/AexZkopfQ3Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ddy4a0HulGafsAUyGauQzewD94XZV/maL6l2vbo/Ud0=;
 b=mciuwv8kBHZTNyv6kJlES03XygXeJxltRGjaRN/B/Hmne/jMBqWYYEBjRNLd0f/I3k/wBePrIao1nziOz9YGqOwHt8pY/y0lIwnGLz5oz5ubgaDnk41EQYVGr6qnxzqgDYk7OqVeqEl3I84f3rZ/XrYFUM2FJkbTI4HyCLPw7Zw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7268.jpnprd01.prod.outlook.com
 (2603:1096:400:f3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:28:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:28:05 +0000
Message-ID: <87bjmam7jf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 139/139] ASoC: soc.h: remove snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:28:04 +0000
X-ClientProxiedBy: TYCP301CA0079.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a64aa4-4058-4b40-c430-08de0ada11bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xE+WTrQYd19PILOL0cAmLDfCOgw8YitZTZ7afCT2w667SdqhZqTqmxbPqKsA?=
 =?us-ascii?Q?guBM809UgywSiyGhRcD5s1k6854ZDo3NgCTdfUkX4lcUWQXu6OUi7eChC09t?=
 =?us-ascii?Q?wFxLEZbW/FkPOwARCTtUoILfEhkt5vRzOG4MOZ/hwB27a+ApsCCF0Hydp2zL?=
 =?us-ascii?Q?qyMwCaMz/oVij5TIzcGF0D+9uPgd+nm6Meo5RXHpImsOCqcdkSv2GD3olVJe?=
 =?us-ascii?Q?qW9UUprDNyo1i/2yewO9sohHli4qGpuD5rlYdnmbLHT888hALHR3rQrPmewx?=
 =?us-ascii?Q?xig35CbKRGzDVSZzlLQNGGbRxgObwmKGhyfY5UsTPVGhdflfjZ0M0nmBMLVU?=
 =?us-ascii?Q?CBfHu4LD2ja/87HmnZQJ3FMyN+d8x9f9nZGpITzVNuZ6WBbIOi+nyieT5fWH?=
 =?us-ascii?Q?XYQS4eCIA5iMd4wvbXWzMuZ9n3wS9DoZ69u01F5lRE7OdJOlwHsA7fNABoLh?=
 =?us-ascii?Q?tzklZ/pFfmjizXosqWr/E48UiN+uCpwWi7PC4W/rAi77cLUpuSW44En3Nz0W?=
 =?us-ascii?Q?2fbM9qKAzC0Ud5qm1BqKvYgMgE7IesX94hbfNLW69i0XXkm91ue93pwgWjRV?=
 =?us-ascii?Q?LS4OI04Qwr3cmnFHOiJra3kFjAcWgp99ZdIAgB+RE8W8orsKlYTc8piWqNce?=
 =?us-ascii?Q?AkhdVFkMeIv3GEkSykiFWhyzwQ4VgxXq1nMsKBsRx5CqCcReBirAFQZrYfhx?=
 =?us-ascii?Q?IMlNlyzl7P8cgRjpW/IFYSniwvoV0KDwaWx+ILamJMqv/ZCfe6HysKAUInnH?=
 =?us-ascii?Q?g0HUeRLDNTx8zwKeA1RPBBS2de5F7ubA8QOzYV3jojrMiiY9zPYeAGC9Yl3H?=
 =?us-ascii?Q?7MMlOjxXHCyuG+7hjuyvLXr00/llqVY7PtBKlMD3+5AM806CZOK0rfE64wnN?=
 =?us-ascii?Q?OJec5cpWbRUlCcsd5OoXFRjU1ngZ1kwx27Q+GsZrddlpXSVz2vFKdx1k27ki?=
 =?us-ascii?Q?E1DzITDBeMjNEf8EIcZkmcQCYZpHhteLTGtbGkKs2JJ4tY1476RTmrInnjib?=
 =?us-ascii?Q?rsE3rgvmHP6PauN1WPf8x0uc5BM9ed6p46WvFago7cylxYw9gEpI06z97Q7e?=
 =?us-ascii?Q?yinDjKj2HIL9wlJ45jVgpxBzHKSjjOCxpyONJNABjyN4jJahlzNCN0VgqyQU?=
 =?us-ascii?Q?35UW/fDyBVPcWx9MQgfaf41/8WRN1lBrIQ7HXz3bqBoiRsHIXYdxvCXWvZJt?=
 =?us-ascii?Q?srUjl3/YVJH19lkf4K2e7gs7+k+T2sEnvvCbR7DQXd9lJyGiHZIxLPu+it/k?=
 =?us-ascii?Q?wqLY4PBefq+akG9/z+3vH/Cp1h2e+l26KeAsGOeCZdG+Q7cKHo7K0hd0d2n8?=
 =?us-ascii?Q?kBkeT1WXewV6qDvDMA5oC7pejlDo/+wNADj59Ge806F55svp89H85ar8BJHA?=
 =?us-ascii?Q?AJCFZOlWqb0OrAcPTtS17fL5qJNZw7lbC8zwdzldoKetHeYiIYfVPPuKZVDg?=
 =?us-ascii?Q?7W0SQQex+6pDUiyDIJWddTSz9g3i+GelvIZL5SczVuRStP/piALNSxt6b2u6?=
 =?us-ascii?Q?uVViJaf3ZpTTxwgIBHH5sY23kkEIcbGkh7B6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Su77xis0z5jRZZGOW1Gt5FU8B3Ew4xsYZtJccFQyfO7Vb+Q8kVi4N0JJpuXC?=
 =?us-ascii?Q?ZSW084YBiMpOC9OoswzPrHzCR0q/67lxUlzWl3oJ2Cg4EzyucZYiDDzckYgR?=
 =?us-ascii?Q?owm+RdmK/QyEMwm3fVYL/ftqUKULvlfwuj9qC57zvgMmgV7IhrfkyLxUYUs5?=
 =?us-ascii?Q?F/HhcgBPQ89ncD2EJKtCvWEbvXeuIhC97WSiszNsejtiSfTQ1e59kaoF7wiP?=
 =?us-ascii?Q?DZrRzAcAaTxmopruHU8AwiDiHHL2zRdgkuvecuqJuUIHrFbrQ4ZQK1pSMrZQ?=
 =?us-ascii?Q?WJH6bWA+CDCbRTon8akbUxprRGN1HtLyHtwDNX1/oAml5HdhNQwFgbCyW9v5?=
 =?us-ascii?Q?yy5UDqPEuUTaJk2p5pXkuHFwZOJ1odC7ZrTW7fR+PeAifwPHEowYFMQ4RJ76?=
 =?us-ascii?Q?ll7FRVtwG2NNqASmV7c74ITSl9OaEGsg1VVvyYlgpXHoYHtZBvO/dakABJeH?=
 =?us-ascii?Q?M1eXBydav3PDq1Dn1hAsNDFYh+KoaBHNrcGI6B3kbr4KEQiv96cLLP2KYFvv?=
 =?us-ascii?Q?wvsLnhd650D+mNScMiPdbKUfHkjZ5kT5zc1NmdWz7N8fOzOAVhNRHZBS8O2H?=
 =?us-ascii?Q?FISVDCMqwq/Gh3UvGPm5VRjKXRMzSv3Zb20dy/1E8sjtrIUyN+hdLdECi4m5?=
 =?us-ascii?Q?qjSCjXspHjepbN10PfUDrV58bS9jANbTnFEfsPvcsvNiBt8ZdYoziTDfMeKk?=
 =?us-ascii?Q?X2z+iRMFbs+UfDCzAob3T1eiYdcWBbLWhAlqpOAkPmRx9NgS9VgOuWB8e1qm?=
 =?us-ascii?Q?OG16LgW+h+CRVHWyz0CtIoLWABFXoRYmpbuNmsgCiFdSx9ANY8tmWMeDE51X?=
 =?us-ascii?Q?H9RTtEs8sUvih5FSNQJXCYoRozN07x0JtQGpMZvZK3PsEJJghdg2gIJuIEqj?=
 =?us-ascii?Q?B+cwzBjuNPdmDCpfzSM0gv/j2YIh7i/ons9w9he/sj7g+hMLKXZzlNHBkMxy?=
 =?us-ascii?Q?l2BTHbCF6d0Is2IPVWgD6/RVA33VGxXcjJO1dVbqtu2hF0PXmbN/Q6Da9wr/?=
 =?us-ascii?Q?zwJcp0DGIpfpl37WQkKEPLrT9bWCfJjjPwzvwHrLsGwsCgyvXonWv5Hdip5M?=
 =?us-ascii?Q?LFKjmxsrVOg312pnRNFlehUW3zME3gkiN12Yncg/imFEDp0XrlPkthXL7k36?=
 =?us-ascii?Q?gSZP2UMynCbYuM7WQpK+9799MPn5ajki9SVIVHPiAvp759jMPuqQOLJqlu55?=
 =?us-ascii?Q?iQ5A2v8QALaqzeFZM9Lf/ec1CPKq7ctxrGm4CqtzrTSYCo481Hkop5CeYDoA?=
 =?us-ascii?Q?mtvkfKepnZ4/cxE1lt2bJR48TGDpMUJOT5raIV5vDiL22QnAA2J5oiNcSDT0?=
 =?us-ascii?Q?5hr4DnRyblVjwPEWSUmw0EFL++4kVM5D60LnpRU13Gnq09LlcsxLQuNJCmWO?=
 =?us-ascii?Q?x27FNaLQKTaGwW2Iq2mLcLf5WNw4TM+KQQmvM9aIL8StrBYax2m1ihsB3wO+?=
 =?us-ascii?Q?Rc+KTg2DqMUT/kc1jyCCk/xhDXc8JsWT4qMQ8pALD8rtZ+SqdOhKHcgxJxL1?=
 =?us-ascii?Q?ZE/L28mPn1Ufn+xtrroufJvSaxpPlZnlSalmcFUSbcdPQC+lzDVlVzPx1Qs/?=
 =?us-ascii?Q?9EL3WwT0GAuTqlZj0YWafsSLU3shorXbt1Ji2UDy5XMIES7jBGFDwyBtEzRv?=
 =?us-ascii?Q?8J2ZexkFel/2YmOZn8gly+k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a64aa4-4058-4b40-c430-08de0ada11bc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:28:05.1079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yv4sEEaylosYouL9rNvPggH9dFPBlVPMaopJ+zT6lfK//h/ESkbriVXUgYtSB3ScbpgJPSINyRIdJ/StRaNtvTxkZhwGJQvWrhi1KgD0lFThbj/Nxa1NkEOUHP65J1j8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7268

All driver is now using snd_kcontrol_chip() instead of
snd_soc_kcontrol_component() to get component.

Remove snd_soc_kcontrol_component().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index ddc508ff7b9be..1aebf14fcf80a 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1305,22 +1305,6 @@ static inline unsigned int snd_soc_enum_item_to_val(const struct soc_enum *e,
 	return e->values[item];
 }
 
-/**
- * snd_soc_kcontrol_component() - Returns the component that registered the
- *  control
- * @kcontrol: The control for which to get the component
- *
- * Note: This function will work correctly if the control has been registered
- * for a component. With snd_soc_add_codec_controls() or via table based
- * setup for either a CODEC or component driver. Otherwise the behavior is
- * undefined.
- */
-static inline struct snd_soc_component *snd_soc_kcontrol_component(
-	struct snd_kcontrol *kcontrol)
-{
-	return snd_kcontrol_chip(kcontrol);
-}
-
 int snd_soc_util_init(void);
 void snd_soc_util_exit(void);
 
-- 
2.43.0

