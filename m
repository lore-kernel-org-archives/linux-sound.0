Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBFC4207A;
	Mon,  6 Jan 2025 23:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736207045; cv=fail; b=At0lgkItbaVmLvdZxQ2H+RxR5YPDiddgaJtHgPJOl7IC+hY8CHroog66BIPE+j6zU0U0Cm6GC/InZMSF+eh63/tJL0EH5cvM6Yr6F8ydSEaSV1MZiXWZanMZBmXdMIcIitnJQYE0mFKrifOP8V8edOewlyt0eshUkHf2Pt9Su4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736207045; c=relaxed/simple;
	bh=+e/0BgAJG4KD9nfkkQFm04qFTn12qimceiJCxvtPjD0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kJU6qbKAAwH9yrjVrJbBv5nwz+N7CjXWQtaoqfm4+oDZPnDt4XK4fqizbqQAhe3sq9nV4yQ0O3PIeuulQkzNLEvB8K2HrGsze//zsHj0CPEmijSWm8SdjOBXgsAkSmYCn8jpZKWLxuqTUUBz7V7qEWZcF5sxT/NNhAn/fn2mlLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KQVKyJ1r; arc=fail smtp.client-ip=52.101.125.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KQVKyJ1r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTHyHr/bHVyLMyb1JISxL4k2oRmERWCY7k8P33dmWnquLs0OhUwuE1k74yqOYO8xPeFXpRQwP/7D2eL37mvg7XJHz6FiwJAC6Y3K6ITAGVl3HfajtuKkwhsHx/pNQaV2xWhnHDU8vSE59HALWaAdnKgwGhnfs7mSf4gnPkBOVYdRdE7bkMfZfffhis056CibpwmnelJnhqN2uiADZvRs8kUkarXYi3f45uhAqDlDRnHqhhYnh0zpjyhiM7P6kcpjCCoNh30S9J2sy/MbECO22T3VwOXsrld8F4Q/4t14z8fU+rQy2GG1p2oc40Gc+onEXZGmcEM2By4KLTz40C3kRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+tuUh2y5VljutAmfOwZ9oirTPPBhKdMk885e/CtzTA=;
 b=ctUGL8Cv8EO8Fi0DxzFGmvgS06oHsT8b7WC4MjFQfx98rVWFCm2Ecyr/tsavh23znpdoiC2QWuTW6GM/kbURFs/8/R9c/jJ2jV16UI45KiulouiTyZ15+hnDMRt+WbdhM41I8/BtlN9mbUKtiKRWXLG6vdigi/hAx2ohholI9OMUo6HMnfIyxqceUQbvKJmRd/J16EhsK60y5iDp7awUfAbxK8GObL55xr4BO4wepGx4wILwiL8lJz1pAM3eGjC0bQeONBzViaHI3qk0EjwgUjM6SrKDiP2o1g2260hnTl2dri18Of/B8QxGBYnTc8QsOQJZO14uIx83ANAiLZ1YPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+tuUh2y5VljutAmfOwZ9oirTPPBhKdMk885e/CtzTA=;
 b=KQVKyJ1ryiN9P4vevSN+seLR5I6j2amO7CP/NrMKBbaUop/UzlWU9lEvfJolkaZPWvHHhw/b7FxLX8wRzYycgG2hSu0CZeASDQd6ESBjPVnXWO78widkIaT7BCGFSNl9EqDDBPuX7o8Veng+cM2eYg3RbDeU+b1exXxhiMVjwYU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7432.jpnprd01.prod.outlook.com
 (2603:1096:604:14c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Mon, 6 Jan
 2025 23:43:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8314.018; Mon, 6 Jan 2025
 23:43:59 +0000
Message-ID: <87ed1fmrsw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add missing maintainers for Sound drivers
In-Reply-To: <2505bc4e-2968-414e-a7e0-4c0ac0862c55@sirena.org.uk>
References: <87msg4o4zu.wl-kuninori.morimoto.gx@renesas.com>
	<2505bc4e-2968-414e-a7e0-4c0ac0862c55@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jan 2025 23:43:59 +0000
X-ClientProxiedBy: TYWP286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d7c11cc-f76f-4e4c-008d-08dd2eabfe0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c+Da1HG60+qDvGcDLETEolJ/5qkdN17y7K7q190Jaf6aet3rCqnN4a1U3UEL?=
 =?us-ascii?Q?KtfNuTtwBZ0RTWckVNH4g3zu3B3dp+/XtyCD2GJq9N0JfXa87dMQ8rCnNhQe?=
 =?us-ascii?Q?8WGKMb+asFRnl2apodUPKAMwH5QiTtiO6xClFMvz4IqwD3Tiu/SFuDXEZ1Kl?=
 =?us-ascii?Q?59sWuov3WsfpB5Cip13ZCB2uPC2pfS3tfZiZrlGLqY5VApGWe4KtsLpVedAT?=
 =?us-ascii?Q?EABUivcJ9j3aTJzueQxcpG1t8fbkN1oBS2JLBOBcGRuDDjfdHWwG84E4bgrk?=
 =?us-ascii?Q?PXlMNpQNRh7JP+Lsxombbcn5LqwEDLPC/XUvMb0VqwnMvx+YtaZr0HED4iiU?=
 =?us-ascii?Q?YtVqz5cpN6qCeYv0X+a84gHs8wFgb8LTHA8ycz+KUTMS6w2fb85eS1wf4Eli?=
 =?us-ascii?Q?Yw4eLQEin9oiDYGVwoKuRdcePXnbEjh/JuSYIHkdphdxAijxl80vVufJPkeL?=
 =?us-ascii?Q?KePhp/cVpbt0feVtW/E2046AbVHGUdAHbcDTG9hJPTR7SgfZyNdgLCgcoM/z?=
 =?us-ascii?Q?GlGFJ/gT7De3YkmbuTq/cwyW7MkHYksGwB/OENPYgHxFDKsGrhE6RhpvxHAo?=
 =?us-ascii?Q?LurR3vvMsHIWV7zBHoysPJABmrWlrZGOCP5PjnKq5SPbT7gean/QU8FCe6AP?=
 =?us-ascii?Q?YT32obF6EUTqZr/IdPZ9fkPFZ7Ea0HYuqJani8MvfM04Ot5oofS54MoFpXDa?=
 =?us-ascii?Q?iMJH+IDnfXbu98YtVmrmSQGrpRAg/T90B5tiCPaB+5MAZLJB80i8tykYylkl?=
 =?us-ascii?Q?e2+tZzUjhrKZ89kDoZs87JG0LQmS1XhEUjhvvuRSOtjgsaCT5s5xNT/vRhSN?=
 =?us-ascii?Q?HJEdq6yj0yyJ9MGe2C48kTSr2r5dKJ5Y2h0vuONjPgcrZ+C6i4hKkmi7vJgS?=
 =?us-ascii?Q?433c21XpZsRX9SYJFZqSYIbS2aRY/h1rpk0OhrTDg0Q/wv3LiDKA2B+iAs2e?=
 =?us-ascii?Q?CqOww3obULKlAiax5KuweDGwW/tXhIKBWyOpmAELTJwm53ZLNEWL0ZaOV6fC?=
 =?us-ascii?Q?Zr5FRjmy53CfDMylgsmEnhXjgt6s3d2RjNx6j2GbIirObXIyg+lcfnWBhCEP?=
 =?us-ascii?Q?K151lSGLgtqLKLOVeayqPtZc9knn9BJRUrE4nqBhhgzxynf1WEhCiQ1WGRAo?=
 =?us-ascii?Q?SNXOTAwmrAbuqVKkDSgWcGICYSCj6SzThf1I8RSUoH8h9jQSM7SYW2fsoqJX?=
 =?us-ascii?Q?ZMZN7rdmzHFYQznrfKUeh2UURqUdpQ0it2ZD2uRJ59m3F8c6JnJqdztce3Gg?=
 =?us-ascii?Q?Rd6EcUerN54ulgaVOffaH20IqeI4v8nxcA+7nP/kAH5k8EdWjbdWSvOZYMFo?=
 =?us-ascii?Q?gwD0RpmtWFcqfBEDUFndgP3NvG/8nbF4CuIjGrPn9rgq/y+aqm5DEH2Xl+Ad?=
 =?us-ascii?Q?sf2oBCfTlB5+Kxmbw9IRJP3jWURgdXg5jYUXjYo+NrKNlFcrsTdUT2q7wSPS?=
 =?us-ascii?Q?KLBjVUEI/r96rFEJ2aqsFAO0N5aPMXkC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iLo6enynWie8VenkDH63O587e2byZeCySmQBI0j5ELUk5X/24OJgzCfCEy6v?=
 =?us-ascii?Q?wMG3lGuVSPf+lvlAcDhhtRQbiiTUzzT3zjO4dCNBCcp7aXEG9kW7ggNiRh/o?=
 =?us-ascii?Q?6zv2UCeoU5GxPv8dmQFwCP1AK9iUH6zdgGORm6YCYMB23IzduJCCnG0tWZ2j?=
 =?us-ascii?Q?Ho6x2itydhBepdO09DEu1YH9/g7tyc78uIPjj5mgdJ5v8SQOQ52Gt1Eu9EPc?=
 =?us-ascii?Q?+2R0ap5fV+ckRP08iPQd/poTHlX49CG8j95N3PyszyeXullDbqQKizBvJ3Lj?=
 =?us-ascii?Q?uetYA6IFcCmu5Uiiz3fUhBNm9HO7bKpgAfAu4xYlwWhD13WFeLxsGLni7Mpu?=
 =?us-ascii?Q?aVTXIe7PGV1cHwMpc4CFlEmj+HjAROEXk3tKO8fAnwJahTSZsAnht94JtJeC?=
 =?us-ascii?Q?9WWwa8j10vmqIjjHi1wE8fxYMHlqK4caNBWULygVU42IVMOsxPl91WDgCko2?=
 =?us-ascii?Q?H6pdXaMlE94qoszIz+UWdDJxrJ6EHjF44Ch9Mo+iPyDK8wIc8CDjr/KBGNq/?=
 =?us-ascii?Q?OkthlMxZDYFPLWaSTmHI7Gmp4IVvXqPbRtGcm811UJfkSqzU7PG6adj+dh4Z?=
 =?us-ascii?Q?3+1QabEKaOAIXUCDpiNpINAGGXcJ2nPVnSBc9Uvy8wmFsh5FbLpkZkLO8Wog?=
 =?us-ascii?Q?0/ffblFxo9uz1zPJkU5/BbO1pwYIpGNTEni2s7Uo00232myGIHEk51AAR7yl?=
 =?us-ascii?Q?Pyp0fLZyEBz/2ZKy85Zf1+bObK4NN2AAP5rrIHsyJyl8bap5QQHL1wGDOmt6?=
 =?us-ascii?Q?AUEB/pJGUinKtUVB+SD7hJKf7AzlKVC2a2tOzFhOAit7nrc5/DqLv9WVIPIX?=
 =?us-ascii?Q?RhUQG8RYj+U/3ZXZa5uCKTWKhK49WtllHTIvudl9FvVVt+CQD3R6mUDd23H9?=
 =?us-ascii?Q?BRCRXxT8o82iLgEuOeDTT4dXtaz2sVhrg8TMpel8GjbgVCkgAMisq0uFcc2P?=
 =?us-ascii?Q?HwSK2RDYMBBj3N7J7/fTTYvxWfm5gncETmTinA+ufYN9b0dFYWFUd0EVBvvB?=
 =?us-ascii?Q?p6iobuxwX0SfjlCVKOx9VRpihY4ZeRO5ixoagzB8QBpazIwfusItH9E9GpUW?=
 =?us-ascii?Q?aLiZBR/PI9IPQJwk4iSmWq0xz1/W35faTvK+2GizM25WWIuQC+PezTNSE6P0?=
 =?us-ascii?Q?GU3Uf+ssgkaMeQt5sU0dT3RvfRVoy/g+EBMTWjKhsgS1kq1EIPri1tUTi6LG?=
 =?us-ascii?Q?aiNMrnx5YHNpp2A/lYp+/PdmSXtQFjDwHLyFLY31QA3KLwn/mWOHc1eGgME3?=
 =?us-ascii?Q?L3L46W9mpHdWqdThcOPxbyHBThwaFPKihtWHmJ4WkevCxDk283JKi/hShcRH?=
 =?us-ascii?Q?tW11wUrCIcISYlbW6S3c3cIzKZadft1oD83EmpKxGOHZUWxMSLirOG53eKUn?=
 =?us-ascii?Q?FG5Fg5q4sfvgablGjmib2KB50h54j9ITH5WtvSNCQODmQOo5ZC9nkveasDu1?=
 =?us-ascii?Q?gV34QnfwGb1R9fryxNlTIRReHmJrEn9srSGUUeI5CFoe1zNMZw/OUEGXJ5kV?=
 =?us-ascii?Q?CCd5nPZOurPzYjg8scxYrfsF1uf8Ej8f4IuQHld4l4sDLpfQbSPVB1yKhm+5?=
 =?us-ascii?Q?rqDKdDr9VXEIkwd7bSeWX/AjF9A5n/+j5t8UJmtg9mMiMMfJYo1rd6sCnFMW?=
 =?us-ascii?Q?F3lV7nTNUj0fwdJDGZ06gzU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7c11cc-f76f-4e4c-008d-08dd2eabfe0e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 23:43:59.3877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pjxbfAur4Xo/gQKotgzTuYfbCQhu/D22x9LauEZT9QBl8KSgwuV6M27ACAezb9FJAz6X1nEEfGVRqhU42oLj4LfPl1tL9m1VoKacW+WCt54w3JzRKW1kkTVyYKjzIT+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7432


Hi Mark

> >  RENESAS R-CAR & FSI AUDIO (ASoC) DRIVERS
> > +M:	Mark Brown <broonie@kernel.org>
> >  M:	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> It's fine not to list me for individual drivers, things like
> get_maintainers will wrap in all the upper level maintainers
> automatically

Thanks.

Indeed no need to add your name for R-Car driver.
But I noticed get_maintainers doesn't indicate your name for below header
which is used for Simple Card / Audio Graph Card.

	include/sound/simple_card*

It seems under include/sound/ is divided into smaller parts.
I guess we want to have this instead ?

--------------------------
diff --git a/MAINTAINERS b/MAINTAINERS
index 27d9d68675b2e..9a21890bb6fce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21964,9 +21964,7 @@ T:      git git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
 F:     Documentation/devicetree/bindings/sound/
 F:     Documentation/sound/soc/
 F:     include/dt-bindings/sound/
-F:     include/sound/soc*
-F:     include/sound/sof.h
-F:     include/sound/sof/
+F:     include/sound/
 F:     include/trace/events/sof*.h
 F:     include/uapi/sound/asoc.h
 F:     sound/soc/
--------------------------

Thank you for your help !!

Best regards
---
Kuninori Morimoto
