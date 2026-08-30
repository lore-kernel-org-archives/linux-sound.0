Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45338353A9B
	for <linux-sound@vger.kernel.org>; Sun, 30 Aug 2026 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130641; cv=fail; b=Wybvtyv9BqN79+ssGS0GF1OiK6VvP1A/ADOI24taEBYiAC0K4XqtTpyEYUSqvSlXOGm5KLC4z52xlB5jqwed/dT+2QbTIjwb0qA7a4SHLUE6/49N6RESL1tjNjqsRfyXII+TE3ew1il4bgYiYm9eIaAI6nG6/FRgkY1PQiY8GCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130641; c=relaxed/simple;
	bh=0odTPW/ZVC/6NmQbRMIFzMD+2KruClz4KPngGfPTR5Y=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DSQZiYlT/y7d6HtbjtqpNiew9el5uNsPOuAKJIJxxD+7VCD5DLZwQ4A6ql8FbEMIfiINDSa7hYk7o4q13hHHNX1hDytlutUUsTBbuYo1y0oxC+Yo88bg2iiyPxhnkwSL0fZp6rB4mEyorL3/OolCZeIlVftVujSwLg76xtIzhng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=V7foP3rL; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="V7foP3rL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHUT0EnKAuHYIyo7V9iM2TyVjdrcSDpWTg080hV8fU0AOP5Hxl684R+3n5bd8yq2Qb4Nj/lc5ElSZPZcN8LdB+hOa3tVMoOAPu70WEck8oSuV2qwqArYFHkQ+htOvC3PKsQEcol9tO+7NCIkAEC8+rrzdjiQhdYa3ciVmgRiNiuEfRwOOYYh0CCIPtBoTYq4YQNSxbhJjZOQr1QG2DlA3YjpGloQw/gWEOIbVPhjEZKXNF4NnlptB/GRCXTiCWcJD675/h17z/jgwX8ofdP2rcWwDXniS4S2Ge4V5Z2wfiAqv4EPxOd8QePEKxdR8tOb++S3eu70R0U9Jo4NoftYHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJvf+KhViXGTg5eXwlt+0/FVYvjICfC2vuh2PGo+1jY=;
 b=kuGZliuHEDYW6c1KXDzZ4WI60L8sQhYx2SukYlDl9kZ69J3gsS/353PrbmNkm8z+EN7F1O89zl02BNY2aUerbuakQMBA2LWXPh/dxG0ESZMpX6X49Znq+bCmyhHt3k+uoZ7lDyu5/fkSkqJH15Fj9aG7s45FqAftdPw0jkyYZn3LvPbMiM20fdYjgcSTpZqzSevdmTo1HFQjMKNOGbplPZei0w6z10tTtH0se438M87LpY0CafubKudN7oJXAnH3t7Fvc7+KG1pxwaSVrvhdurYjdVtiSaIxekW9/w/wiworpzjxKPAqAMAH1e5ja3JBAs/hmF6miGheSnO7zyF2Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJvf+KhViXGTg5eXwlt+0/FVYvjICfC2vuh2PGo+1jY=;
 b=V7foP3rLrflZAYEn9hRYaljhJATKNB0eDHIJR6B4uZvLDaxQf3IwkRIkYxKdRkGenNu5ZHi3rP2/4TpVcsu3/Spr+avLbc5PK+PITk8Q67c/QqzS0c50eG4ECILMCxqGJDTz18v9jE5QyIA8vupTE0okNACrtGfNw8h83a8G6PM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY3PR01MB9891.jpnprd01.prod.outlook.com
 (2603:1096:400:222::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 22:57:11 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 22:57:11 +0000
Message-ID: <87bjajw722.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [Linux Upstream Kernel Test] Release Content for 26_3Q Deliverable
In-Reply-To: <87jypddxw1.wl-kuninori.morimoto.gx@renesas.com>
References: <TYWPR01MB101940CD99D0BB495A79A6CD7B4AE2@TYWPR01MB10194.jpnprd01.prod.outlook.com>
	<87jypddxw1.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 30 Aug 2026 22:57:10 +0000
X-ClientProxiedBy: TYCP301CA0047.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::11) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY3PR01MB9891:EE_
X-MS-Office365-Filtering-Correlation-Id: 92412f87-7d0b-4703-b9fa-08df06ea065d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|1800799024|366016|376014|18002099003|22082099003|56012099006|4143699003|10067099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	wnq46e9Lg+bNQHCmEwf1PHQXwfaiEQb5u+FETJUa/bjZoo6mi3S5kSH/Inqb7yavzs4FQ3mStH0wCOkcZOTqQnXhqrZUEACrfsEW16Lp2GDPzmeUx5FwwI4HunYbAnkY1YgCFMbOCbxp//op+WkKURa3vQCJLmo1qONwRsNssU6a/MiDd8xrPFCj/rUzYUkZy0TdQ1cTA8fENuvQA8gcCoQRE87874WMmmOXBQjmX4u8Ovj4RFRoB/QOJEgfgxSBqyCyLO900qpT0r/TG1JqiT+U/ZqSXlSlRplIdIxlUjiztimWqutG9DY3E+9bHsoEjBqo8Ziq/cO0LeL8cDjwNWyIV469gx6OF3LTfAnA+7zj3hGrfGoJP2sif7G9aqbBzu7XIhr2Y7Lj0DgHqscFCsYy6PS1QOfX3k+epM47aBiimzPv8NBN9yaxMNBmIWf8RBliel9XAH5fn2iDfqmLG4psiX0ShKUxGRXfGef/Ra5oGD0Kb1CaWyTJutocF3rmLmpSQq+7kN2gN4mySXPZWyrxtNLP4PS+Hh5orhieAnfcTXh7tJvZlaWP6bKhhcqL7whb20S5O0X5NcgNWucILk9DHrZcJsXzgTn5C2uKYmCzTS4Z9L2LtV2vdBjtVhbjHnw5QcyB7lnwkv8PTGCWanaFO6qc7ftEBdB0DTHXvvkf+/F5EatDrbPZAFy7gi4Au7Gxbw5WmaR8VO9liNztdA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pcb1GHKTmA9QLk3SkLvuL2sx3iHQLNSmPYr4o+I11rugjwTSU1sk3KiJoi/5?=
 =?us-ascii?Q?eyi0V8BdjpHdcVWbloWaJL4yQJKtHncNMdB/PEJxYnLh3aLirz6/hUvvnVI+?=
 =?us-ascii?Q?2001pVZyS+Hq47BX9p2JEFkIAVRwq01zcX5mRC+7bBB5bzFSA/ZVAikrii2h?=
 =?us-ascii?Q?9XnfNRzmiLKOW9raQLGksy9BiTuw0TtpyK7dSxi+/CU8mDsCmSo+STti+Bhp?=
 =?us-ascii?Q?qcvr3FxHbXyp71RQQFSmXi3PP1ndlKVWVQEMsJC17ir2w1rhv3jX+cJoUdu2?=
 =?us-ascii?Q?pjHcCAmdhlr2vCiqeyCDfymkFelD2GRO2V4VOfnnMDPoVxjSNqhtZ3MeAd+f?=
 =?us-ascii?Q?JULsT0iDMaO1YAII2VlZhus7E72j0YMreRWuG8+J68xV23yIM+hKi+yBWxYi?=
 =?us-ascii?Q?+Ex/IU49Y/FLkCBbRaiuT4HEuu10W6KsPfhbzwPlGjl0MOAisD9hOG9wuCQs?=
 =?us-ascii?Q?pHph+OFsMwVPmrdwXd35bbRTOQj+ItgPSX+oFehD8mcafOSVG2vwRofeFUJt?=
 =?us-ascii?Q?hETwcrpV6+cTSJTJIuBJAwDpFGGQLDKcUt3UiyoxLmlw44K8q2zhafxdvWHa?=
 =?us-ascii?Q?vMGBKw69O7gMOatC0wV5hsiTpBPN9vuhFbnD+njja2ut8BQC/tSYGr2c54Ek?=
 =?us-ascii?Q?Qrn6/XQdGTJkUWMF7zOcQROGIr3i6kWUlvEbp6s5NmhUhDSC5LZUYZ5Tm5dB?=
 =?us-ascii?Q?Umf7aWvO6ciBN1O1xqCDEYltjWtIR8QQ+U01QEvmtyFDm7PKtfG47jLG2Ink?=
 =?us-ascii?Q?2skUDdyQN9DbIE0sIWyxVqFXMFgbUcyBwflsn7V+Mpvcr6/nDqsGEadq1VNN?=
 =?us-ascii?Q?CR32b4BzHfy41g2ROB4P+B1AKyo0LR29UGYy9/GtE+ugvJx2MJtZ+Qw9qXNE?=
 =?us-ascii?Q?9LNfmwP3jxCZrogoQRnhbpFQYCkZCESFzwkaxXnrJmKsKhVFgZgN5YBVKYkV?=
 =?us-ascii?Q?AL0BMtHIOdAWLwxpvbv54Y3wHcpacbqNvF4tjJ9nEuMWFTLD+tveM4XHLw03?=
 =?us-ascii?Q?Kbanv/yh41zwdlGxoS4P3dXpSjX4KntxkK4kPXfawnTfBdLdr01FNcXWXKTr?=
 =?us-ascii?Q?c8xv0t30CjuXi1fq9D/wLmywKGRBHSGr80nwbSqdSBAISLb6hO5v1p9JWuv/?=
 =?us-ascii?Q?0x1FwmqUL7IllbsyGURRtlo7Y2lwh/LCBxoWVnptTYTFV1VFaLa1iSvCBqFu?=
 =?us-ascii?Q?RXr9fFnU8W32SN2S37Db3MKRdfdX64HxifMKoySiBUoEK+tPtlkCELAOkSh5?=
 =?us-ascii?Q?Y9LA//Tu27HBINV1sqWNZPJ9yoSTX9UrWYk96dpAD6V67SvCjGIZpHeZpdZd?=
 =?us-ascii?Q?NEr/7vu20gw6NoEGDi31PHnB8bEIFBWlLxgxNG1BXfy0tMl6iEPCASzzdOmZ?=
 =?us-ascii?Q?qqPMmAr45nj8jN/gzKRecyFX4SJ3P9C9uSJZIjpfpoqufenjKxp/us6fndVn?=
 =?us-ascii?Q?6NWz8tevJavAMRc9/fxrRhoLvIw9TDGXSde4q2EwYCatEHWuIyT1SctBS01U?=
 =?us-ascii?Q?UBxHAGI2Tlf9Aw27JU+2vWyeDP1Rdft0U3ce6PafLfw6d0fY1IBjUbCAmRG9?=
 =?us-ascii?Q?9FH0MMfL4OHOGczz+opisYJm/QgLji/G+u/HrQjB3F4ptNWGbCx/+ioJB2/8?=
 =?us-ascii?Q?zpBPtChWWyIyFSdqiN5jTgHNtucWo9KdehffhHCbvE8V2najdOCCxm5QMPsB?=
 =?us-ascii?Q?9lZtdhIm8m//2hiIS5xBS+0YQKJKIqGluS/XkmGR0zongADvWA6/75uFVvUM?=
 =?us-ascii?Q?iqsdzD95GuRHWMA0iUdFetEhWdcwOGg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92412f87-7d0b-4703-b9fa-08df06ea065d
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 22:57:11.0305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VqmySN1sxlKLMNAomLaUf5jR5+BUUGk3lC9KmX5LEq89V1pGyKzAVOiP3gDRFSN+4BhZIFuX0XbgW/zyOYZ4WUzzXMPxKzUWTrE6m6hlLEwlVF8XVebhEFvVVNHz0XSw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9891


Hi Duy

> > We still need your confirmation of the release content of the upcoming 26_3Q Deliverable package:
> > Method: Upload file to FTP server (172.29.138.144)
> > Content: 2607-2609-038_Linux(Kernel)_26_3Q
> 
> Thanks. I will check it next week.
> Sorry where Can I found this ? I forgot it...

I can login to the server, but forgot where I can find the deliverables

Thank you for your help !!

Best regards
---
Kuninori Morimoto
