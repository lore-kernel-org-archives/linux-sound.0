Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DA21DB92A
	for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 22:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750113215; cv=fail; b=QDWruKAQh75C8aW+sjl0pX4u+dZb0ko3CcLtLr/4sj3K3pUw/deCGY1LKb975Zq+QNq/NjGevXTH03dpCQ1d6nVT7BFl6a94GynLZARCnkMcvCn7RI5ac30ZFsJh2foal6MWYlLi/T1AWO61N17nmULF2YE9sU9gRk70LYEUkrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750113215; c=relaxed/simple;
	bh=VByCPmpzlIaPRHUbeqzx4dVWcGz8XGxXRxpeVFiaNT8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HCDMMPwoZ0NcvdTN4FDZYSvny7/3stXNZv38S8/cikgeCyMtzv6O4Ja7in/WFCIBLAt/2inTzber8koxl9EM4Zq2mEYu5hGoeGIfRflhU9XcbjbdykwINCBk8nWRFmoUFvxGtxDqSHBu6zX/q63a8AV2U0ONvzfTmNauhhcWJ1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fPV7qMXn; arc=fail smtp.client-ip=52.101.125.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fPV7qMXn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qye5O/ytGLbNYieQiD/50W7NNTh8ZH7qc5IB0gd6usXEnAKinahNS1C6g72PyJ8AzNSZSI8hngFumv6OreZa2xt7XZpC8dyeoherg6Tjp+EUnoUtNh5Whtci5VOEKxUviQ2hOC8TjMufGsWF2qVzK+AtRqIPuzv/+VSG0QmXJcwfctBe+LatYzVY4LWoYE/deyCYQ+9rcoZOs3Yo+4/exPhWRJmNNAlteFa0A8L9Do4K+CSSGgeNQHQJtFZ0XNIe+LLaGMukli3NvuLKLUaBpa7kHFzH98srxVwrFo27TqldIlY4hLaA2oTfbdxpXP88Jy380JalorinUGfFAsiPrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKSEWIcfkKwCofjW2G+UXDi33qxdtct7/+JCJZQc9/A=;
 b=TVDn4vIKxezRaiq/ro5taEysFSnf1mhLcrYQZyILzPDau/x4vSTJEvreUic7G6CqcQ9GcUbnn+np3wQ5SvDJoOwTT71Kd3Rps9t6leEgMxrQCjESKhyVbCYql1ayRC4e7kJ9E7u/tAoxw+qDJMEFfqgDtw2Z9yePyEYaXP0Z1sCqoRkePR57dlN3Yg/TzO2vJF4D8ix+xnvb8VMRIIBaQoOhLPAURBxt/nYJEDyIw1zHzT/vJjf1NeK0Y+/qbWmWp3w/NsRQZwvKGbEGLxCPdH59TMavl0mjMbmJoCQgXHofBZCtB5j+CrX1WHww0lc/8eWNNUJW1CtqLnSdxxr1Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKSEWIcfkKwCofjW2G+UXDi33qxdtct7/+JCJZQc9/A=;
 b=fPV7qMXnEEn2bqdHuaRHnUuvc3uVcZ+i4/S8l4PTR6vSLL4ZnNx3D3mz4qZiEdbQlaJ9Hh1J5wAsQeokU7Q1GeOi7kaKREay+4459MMJRLqcpYHW2QLMzWj0fwUh3bIeMtojHERWrb74GrVRWue1O73zj9XWDzwbqUxaISpGn7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12177.jpnprd01.prod.outlook.com
 (2603:1096:405:f6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Mon, 16 Jun
 2025 22:33:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 22:33:29 +0000
Message-ID: <87y0trnwp2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: soc-ops-test: dynamically allocate struct snd_ctl_elem_value
In-Reply-To: <c1626628-8d71-4d8a-97b3-dc85eedaf030@sirena.org.uk>
References: <87sek489l8.wl-kuninori.morimoto.gx@renesas.com>
	<174983355578.217351.13383396626687362293.b4-ty@kernel.org>
	<874iwgp6jz.wl-kuninori.morimoto.gx@renesas.com>
	<c1626628-8d71-4d8a-97b3-dc85eedaf030@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Jun 2025 22:33:29 +0000
X-ClientProxiedBy: TYCP286CA0164.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12177:EE_
X-MS-Office365-Filtering-Correlation-Id: f6704ee7-8e3b-486e-ca7c-08ddad25d176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u/RmklpnBu88OG2HxW+GTLXYcfnTKrMa0hhVtRmpUGGsW8qQ4c09l+mtd0ih?=
 =?us-ascii?Q?meOA3lCZf9gkeqnSirlztre8RGjslnEqR+FK/0+Vc1r+sru4RErWSbZgqtS5?=
 =?us-ascii?Q?KAYkKWp1WzJeS3kspDnJHPSmANNm0L1zolHCYaPyvUpSnAdvQ1slXnQ1fNc0?=
 =?us-ascii?Q?+tjIv3swHyUMAbgBV7RFC3wpfTpkE3sQQVUqhnG5ZGJIJSFJwR22gyTHeP7m?=
 =?us-ascii?Q?DlW89P5At47hU/vDGEwyVhZJcOIZUKBNscEAQ9A9dOj1+5icgwmJHTrDV2zp?=
 =?us-ascii?Q?vA14xj5hhwRbkrepibpbuX+sM6Moj0KrmcsP+02DQtpAa9RbEmyhJf4hQluP?=
 =?us-ascii?Q?O+c4rDgvbUryrA/HdEf6RE1ym2dZehrmpq+ilBTRu+tPyPHL7D4dEMorDftb?=
 =?us-ascii?Q?g1SrAuUudI1hoy5t1d26Muwu8m9Cv2JtL2R1LTk9tSH0T/KTX7rHWy1Fgt4U?=
 =?us-ascii?Q?RplEZNU9uTpvQhvOr7TvFoRUQ4uIOjcw0+rI+NcASqHVON/DdkLfAWb96cmF?=
 =?us-ascii?Q?3o1xtUgCgfKTaT0JIRx2MbhbvrC3xQg0+D7Gq+FSjhxHXPPtPZMelKwTroe9?=
 =?us-ascii?Q?WGIW+0B7h860vc/LMX1bpkJ9+9xc61BoDlWgAyMqxV+1+Sm/aRsiRVISjcHJ?=
 =?us-ascii?Q?V4djbKB80RNqoIg0snG7ftwtEAz7zyfU3/JF0C3Q7mlhKZpcBN92qKGu/CqB?=
 =?us-ascii?Q?DsX6LI7Z+F1e0eoSUXtSzJ12zrt/aFAx5Rw6/jpQ8WwZdRQCM1MYJPUfw7DK?=
 =?us-ascii?Q?KT/Ot/ojXKhmCz0TgP96FkesENF/8TCOjyCHI4SUye4F/1cO1Iwq82WnvRrS?=
 =?us-ascii?Q?N3V2k/xIfZsfqENuyfzeK02Wz4wO24w3u6HsEbQO0IwfZ1cTKbqwKE1rGv4t?=
 =?us-ascii?Q?19ar3LDhyWo48TapIzV6jAzLvF7gx3h3tmTa3ml+ga4zBGW8bYPz3HYbYKOL?=
 =?us-ascii?Q?WA6jsB/P051YGLWXAv+MWVZVMz6+JPZKnQvcLLc68yWu+DqpaYxMWnHznO7h?=
 =?us-ascii?Q?iDKndYfltdGKZVPGTo8mDcpTiJ0vS4FSvZ4wqEgsaIS+mAISmIeaLln3nqNc?=
 =?us-ascii?Q?p+szagBmtlP9ztQjPHJmiEIM4VJ5BURcidkwsTjqywpXIQ2ZeMBe8JHCP61P?=
 =?us-ascii?Q?3QUQm86w2rw2dMXKPszanfEGirLACVpASnH4z4m53vfdKKsng12hYdEBRhrO?=
 =?us-ascii?Q?zCrzoMjxsOV9UU3FO1uannjlSybA+WaXV5sNkGKBNqKuYUE7qoehqH5EH18c?=
 =?us-ascii?Q?3R7nxCHv9Xbpohl/O98RYqwYsg/bIbqxX7w6j/zgPqnXYiiwLNj8CtXsa3Ou?=
 =?us-ascii?Q?/UMjw7UauD/JU3Gn5Ar5V3keZLFxOs/g17LnyhaVwrlX5LNy+K312D8S8VF+?=
 =?us-ascii?Q?epOOhSSriSjTPvsGr/9p3cBpn9t8JVTamyIoccIdoJPN327H9m1zlAOgJpJr?=
 =?us-ascii?Q?dLh6NB0Yp7EH45Sgd5D064BruntFXWfHLHqpMzAlViUau6pG9dkaUQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pnzBGu86wsQn42It6tUMfzCsIgDUKpnhB3mcruJLTk7ZYr/RK5M5B4xK/pjw?=
 =?us-ascii?Q?5pK+imhOPByGwb0+puVtcagoYYP4iHUxy6Pl2IEhrj57YZXdvev1DKXbu31a?=
 =?us-ascii?Q?8xhonOgxPDvXo5QAYDqMHsjV1xw7e2hOniv94BF1qaPF2ElHo+B58ckhM6d2?=
 =?us-ascii?Q?oYhGACuhzPG+HPq415ULz1I4cTvIlBZr7KQj5hEPIJVxUBGd/rfr1Z3cjHkz?=
 =?us-ascii?Q?Nu3L9pw5xqYZKc41yGT8FYJEvdNLJKLQvUwl7sW+wyHzHwkR6JBHAfvqVLTU?=
 =?us-ascii?Q?RSJ9V+NPr/KQeWm6E+TexOFo0g8BKVZQE3ZPzHzPNYtFXlMO7qRW4g+k07UP?=
 =?us-ascii?Q?fniHssCE6X5HkoiF/iflPo4X1T/ymip0midh9Ewc5UDYOlFxq1ibycGpLdQf?=
 =?us-ascii?Q?aw2Y2MAYpgl4i9SVf03Zw5Oa7e8L08A36OWbOUrRskQih5DrkZE6zISYvx9B?=
 =?us-ascii?Q?SCTs6u0al+CcrlYMeFZ3hzogvdtO110B05srZ52qiMCGIu6mYt+zzFGlne/r?=
 =?us-ascii?Q?/QW/kCbZeqjGXR8eQ5A5JEfBJQS0De8xCnAiwOss3tkGjTv0bpyA32D5+NyT?=
 =?us-ascii?Q?q+UNj3tF1Eg/TbbgtwPqQZVz0ESK3DNDJIqh5mYVoXvwHg2UmVS25p3Le6m6?=
 =?us-ascii?Q?B+QysFisa+SxvpD4DtgkI9A4kA1Hi1SHeFa3LW6V6L5IW51slyrrrx/fmQR2?=
 =?us-ascii?Q?LiV/fkXsGyvfoAm4bREOB5FIaoH0LDLfXAZCSewlqSG7vrh19yj5UcdCG+Ry?=
 =?us-ascii?Q?mbL6N3Vj7LqVSGM9GWdDWPIevERIBszXpHd6J2/S71h9/ewyfYHkoV9zDl6j?=
 =?us-ascii?Q?qd7lemv6gMvhWrjl8Z0CzNr/vV1YOfjA5MmqsH8/onFiPb7upw206E8fmJyb?=
 =?us-ascii?Q?Jdj8F/ovyNIhgRjoTKQyluHv05dI+9fM7GFJutY3aqq7Z5aYp4u9joNvYkIK?=
 =?us-ascii?Q?LEqJwwOpogwU2Cr+VzkQZScGwfz3LBVNcUfaiixHGm0dCnYDmKqQa5cdbebQ?=
 =?us-ascii?Q?FIRyZ8z/pGeL4CIRJBFuz7enL2wvVLUY6zz2boHSZoegUtZRyuM3mhCz0v8F?=
 =?us-ascii?Q?R5YsZrG2keZbfJHicL2wiyEX6VJhpORf6mWpgb51hChbTkgEKswaDQ326Tzp?=
 =?us-ascii?Q?e5Xu3oKob3JsJX2A1KpXMnz8ElXYPNO7ldWTRXCo+BNvQXQX+KT/SYODyC7T?=
 =?us-ascii?Q?OOtF8U8jFiVqAAn7pxdGK4E/sAIy/FZdRhU2ZDwMECPq0Ov15ljXK+tummOt?=
 =?us-ascii?Q?wYqPy+SnVsvryO201MYinVslvszc+KYMarJTqU0pSuOldK3GbDRWIgkv8lKn?=
 =?us-ascii?Q?UogSWAG0DED1ROIRpyoAT9CW0F5Eu49QM1r9te6WSknS8+etMjWCneYe5/Fn?=
 =?us-ascii?Q?lwISld8w+EB4912dbLk6cDGYIP5TWT/pStVvsPfMXgLI+8vswA8gPiB/2loG?=
 =?us-ascii?Q?YX85xohPY1kpG4znyLNRlQuao5mk9C5GCG0pqAHanGHUYbNAw4ZdZrXS7pqR?=
 =?us-ascii?Q?LF2+24n59nlhYi9M/bhmjc05WV9PBznAcZy6gXMezxgQm7Caen5BX8NbdTZh?=
 =?us-ascii?Q?RISMAJIfqdjx2Kb1ugQdyIWnYoa6qjqxzm/qKe5yktPsf9CKKxEyKCThV+Ib?=
 =?us-ascii?Q?KVCc+UOvQ6SfFDeUmRMQMq4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6704ee7-8e3b-486e-ca7c-08ddad25d176
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 22:33:29.7053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yP3cgTvrWjGdXIYwOzRPLOsVd1LD1Hvi+kiATohc8QK+tgK+/4uZOVZZsZULDu0nw9hNdRLEtquRgk3ehTH3sw7JL15m8PDIltWK0DWip4q7BPGC5vShSUmiPD6HbUXn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12177


Hi Mark

> > This patch is needed to latest linus/master tree, too.
> 
> Yeah, I tend to treat those more as warnings unless they're spectacular,
> or someone reports practical problems. 

Thank you for your help !!
At least I got this error via ARCH=arm.

Best regards
---
Kuninori Morimoto
