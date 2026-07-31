Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6392733A9D6
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 02:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785465985; cv=fail; b=Q+blESjRmk5PACKVEa+bhsZ7EIyl55JaprxQWGPUnp3pgRJsqOdtUVKe2oa//7rg1yuRUF6rBLk1gN0C80t2oqWA7OAxuIK/ORyjumAa6IECkGcC6RC8sHk8qj9EAgWdovtPsY71c9RJP86WjjtYcqbF5wmdy7hqe/bpzqMK20M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785465985; c=relaxed/simple;
	bh=hAfKiec6sKPeNslj7AWixUkM2YsCEFDVFPnfu4UbkgA=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=O5T8XUijLQNaETAl3WwPd9wEeeg5VzhSgZhADN632ai56KVzRnqvp0jciXyx3S9qgp7Awix7sNxy9I2omLH9z+QOoJsFz4UCUWZbFq5MCKYUmQJ0jFT5W6kqMkDZVG16tBswc2baNaJwHyO1TCZ33JVrWExS9MJmCUwSCLDEKC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=h2kJO3iQ; arc=fail smtp.client-ip=40.107.74.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="h2kJO3iQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ad8xuERKcP/nds4miLdKkSKx+tpbSeA8DPo8ze0WKXfJASRq1hydjJ7AcW2kV+ce+oEBQ10nVtKl6FGhkiD5/6eHafmtEvZhKWYKBxEvqJie4+bOAfZEhdQm9jngePBehFBrtPH0Nn1jBZJaKbsO8793J7dT05S94OW3oGU6iuMbxZp6jQ26WPatqABqe7ClPTN7kjy6mV9M1S+4LjnxgLglFfVKFJ/JMy9CNJMgoJa40WGuBkaMRR+NiQnGeAkHeu6vxq0vt1JYiRJ+Td9S5W1O8J0xtfismOZ485ZYL4QBuJq52fKOlIFgKEi+CYL+JIcA4wFPQiwGTVqzNdUUEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6yUTkCy2gB8woyX/DnHZRUSxYJIrkka8+LE2IM8s+M=;
 b=dYAZoVJ5YoATFNqp5XvX47uApY2nxfLCqvncIvsuhlED2KTqiVZOfyCd2fFDL6pJqDexz44xzcoE6oIlivIDwS61j2wXk/qVaRgAJWNSPo9cSRtSDDrBCD/HPahqsuoA/5ETW99oJ/1zZ17g2a2iZ2437EWki1KNzLhF3epy66XbwL3EWwpkJn+aabuEJXMWID7yrV33SUltlszL6CCmW11JTHDlRuCzDC3/jiMpuDK5Pyrly8sZztRru2fs7AdlQvtRH739tUtFbRReuVtvvHog1KkqBjjtk/zSTkCeh1/ys052oXURKFPeQKD0Lv9kuNQrPPUdO4eGVgstD18gkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6yUTkCy2gB8woyX/DnHZRUSxYJIrkka8+LE2IM8s+M=;
 b=h2kJO3iQfkTdLZfJbxiAhtEjda1NJDf3QMKGGpQyy5DowYAKWaapCV00a2fQC74DHK638vluD5n9NFUobz2X47N42CpdVM/U4et7SQLuXm4F+92cYfWoa9TkBMsL9Ikx7sbKFFwccevLUtCGoCC8K3cAsRgrZyYf6LmqQ8qjneg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB12827.jpnprd01.prod.outlook.com (2603:1096:405:159::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 02:46:20 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 02:46:19 +0000
Message-ID: <87jyqbswp0.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/4] ASoC: renesas: enable COMPILE_TEST
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 31 Jul 2026 02:46:19 +0000
X-ClientProxiedBy: TY4P286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB12827:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c86d913-239c-4243-59da-08deeeade669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|10067099003|11063799006|56012099006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ylfOLy5xKYGBxAHiqeICEPWSwWxVizZn18gL+RC2m82C4zNoKMgo6Pv44uig1RNfY5hvuZGWmjIOwZJ4+uoVtt+uADcVjpfk6HUKfE/Msce+fSBzPU38j5S1rsdHc5QrfyHktgOYpTULUaoqG/2rqloRzZ0ptsSt1sE0s2ssQYWtRZww9YbqCM0sM3RPiBZ3LPoUDJ6YHAnVv/NKGacoZLm1ycSoi5mqVI+Ud2wqKgo38bvqClEqlfsHuSdHvEwxHZfTVt+Tqk3Sa93XBYzCgslcnfrAzN2QufYAn5Eof0l5WKbwqBKKcbjcnDwkh+LVCviVPujVmkFH1BHbqR0T1NrK/QoWJYWdIvO7HykgBgjzsXCMCym0S59d0pGwfCEQssXwfwIDnLIyBMfZEYl/rBa5rKTG0B22G3yDiCVhsm+a1xKZwMvETF6xCo5b6FpqiW88OD3bisBjt0/jOUD/Hft/H7i6mfvl+UfPhZUrDiqr4XSSYZhTlBIgr9ZYeEEAChrAvC7IBG+KxpLzb5TxoWonWGqKc4q6I0aiHo+gRO+mxCECrpbsujSst7p+forGAIpUCvm0Bpz6tMCI5grG2DLnZkkNNSM+g6+zGQBGpF2AaNV9Xs7wiwXdxhmDPOjFQ9ss/JaI0CyyVNlH2sqThv2ZzVmnw0qdYqxoiLX4Bn1vS5gvNVjdUdKCGNv8igc8OgcxxAO2Ha+mBEGZQZqv2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(10067099003)(11063799006)(56012099006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iRq8YbtE12seqUeClKi2+HcRtmmtRqiQH/8n/1aXbPXytwMCMu7EWfH7TJyN?=
 =?us-ascii?Q?FO9vNjm+hInBTRBgxvczMa22kwvk2cwsG3amsWBCb6CZjwsQwQcE3y8pZHdn?=
 =?us-ascii?Q?ovcrEmietCsGRLUCHIiem615T6UECgJXiPUwf7giIfewk19K9YZw4BB7jYHF?=
 =?us-ascii?Q?XHkBa1c39leIH2UE1prGvuu0oPDrMJ3775ApoBkMTAW7s5ZjO71UwWgeqDRX?=
 =?us-ascii?Q?2669y6Uj0+ZyrMvvvhr95xlLtqiv0EUvsyZaCflQhNjVIXGfCfogrE719rb6?=
 =?us-ascii?Q?Hq7Qa1W90h3lG2ZXQ2BORgTe0lHHe9KYkSgMJIOR8uuhlS5ujf3WfMYtWsbH?=
 =?us-ascii?Q?Rlx7+VWZX4UZIryc0Lxc4t+ZJSUPm1EK7tW4ozzEcUNZI8ibonp6/bv8lWLs?=
 =?us-ascii?Q?vaiAAmrSYPFUDLe0bdLBUtp74Y1UNkUI5biKa+meZDxMn4CTYS2QgcVH0fDq?=
 =?us-ascii?Q?Pw9PIqc9o/Ux12Aha3l3N1BEMGu4SCxYiMigUO4g0bIYnS9iMkDucznF/iLy?=
 =?us-ascii?Q?zxRcpxHI9TcG4tcraG2GvXARbEBIYSraTe/XXKxR7idKFuNpd50lG7f3VPcv?=
 =?us-ascii?Q?9432mQzaZupShwyH83VcHlgFKiWIEjnAwYCxS+vpLEAk/XJON/yRuaaN6JOO?=
 =?us-ascii?Q?A6bnQXhhW4apv823LKxTuiHcwp1TLZ7LMIIyTGdYMQwYgivoPgHRsNy7pJ8y?=
 =?us-ascii?Q?fuI5dDKRzqtr2KAJxM1N7mjqN7EK0XCt5BjS/hXqbNaAfxcS9Vu4gFHYRT6k?=
 =?us-ascii?Q?3xYQGv419NLGC686Mc2q2yAGrVnmXAx+wsYC3gsCDAonu/X6WeZrvjX+TB/w?=
 =?us-ascii?Q?0o3vwE906ket0t71aGHHVQ+XA4Yu7lVR1Dk0vhoAIGWacfngBd9WM0FgRbu5?=
 =?us-ascii?Q?KWkm76RDP31ALyW1WqkGkDKKFh5xxzF4+sBcXi1yIU2EBl/EVlqwTnvOVS9F?=
 =?us-ascii?Q?/QmBCCl5KoQYoULxqR9TdC16I02VVoaIkxYTqxpF/TtfMen2vo0F8sOZL/JL?=
 =?us-ascii?Q?QD+bwOrkH9vOyku+CCxA6EeXeuHFe2JlCAF/iz5gNr1b1/eB2czEvGnlrg8i?=
 =?us-ascii?Q?QwRBYZDMGj7jDcRWNwNWuikaHXXNcJXJEce67tDwgLBdcW0sEbAhs/QIxwn2?=
 =?us-ascii?Q?47nLnxKsPjleApjqCX1Aiy8QffNq8YSeDggmZCn37jT5weEAnDrmm0G1VcWg?=
 =?us-ascii?Q?54ynH+f+EEcMGi+dssRv9Y41u9734A0N1rgxRcji7Ds3obm+G2clijFRAue9?=
 =?us-ascii?Q?Wcu/+uFRvapJkmjdTnECo5jiyyUao8BD/w6FR8Iq4z4Y3LENvuAamDmecTTN?=
 =?us-ascii?Q?DwYwbqiKNzpepOnrXdLzPxBcmp+nQqAzS2Nxur0xU3JW1AmRCGHH7MyB1wZD?=
 =?us-ascii?Q?61t+UMNwalTvrKL7Y3gs744HdCoH3yj0z78KAodAkhpWWtoDpGmXyA6gozln?=
 =?us-ascii?Q?XVqpgs6f1JzQiUfJ+1veG8nULFW5yj2TzcIj+WoTbWgqnnPh27XDVxCEGJD+?=
 =?us-ascii?Q?0vm98I8XrWnMUQLGNwX+KooPscpRjY2B8CAJukkxKSIIgTQ/tRMbnl6eybWi?=
 =?us-ascii?Q?egTYLLvwnWIwDwaN1vCyNYkexYnobNtst6u5ISmaNv6tk0fHtrqZTgVCHYEO?=
 =?us-ascii?Q?VJMVVUY7M+0gkdeJzf2j0Kom1WTsrGhlqGPRCydS7aih5iVscpTUG+huAjJQ?=
 =?us-ascii?Q?izoBzkaOn5ct1yuKSZo4H5q6MLQefz2ES/T4WRK9Ri2uQ459pmtV8MFMCMN/?=
 =?us-ascii?Q?YktWwMw7qDw6ZrEeYHr/SsyBhkp0YdrwGQSck+UdenFL5ojBBK3V?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c86d913-239c-4243-59da-08deeeade669
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 02:46:19.8218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwc8S/4f6Z9aav/4KErCIKdy/aEsUwdR3jKChGAaSrT2yPgJa7Y2BHA0PXRMpC20KMBIGTzAaVpzBC7qrcEOQE/gobLlnUSdRt5h/+dMw1aRVbrOFqfa5xpym+3AI2j4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12827


Hi Mark, Geert

This patch-set enable COMPILE_TEST for SuperH or SH-Mobile devices.

Because they have complex dependency, and/or no defconfig select them,
we can't compile them by all{yes/mod}config (= COMPILE_TEST).
So it is easy to be overlooked for compile test and/or ASoC updating.

Let's enable COMPILE_TEST for them when SuperH or SH-Mobile case.

Here, I guess ssi.c (for SuperH) have not been used during this 20 years.
It makes maintenance difficult. We can easy to get back by using git.
Let's remove it.

Kuninori Morimoto (4):
  ASoC: renesas: enable COMPILE_TEST for Migo-R / SIU
  ASoC: renesas: enable COMPILE_TEST for PCM SH7760
  ASoC: renesas: enable COMPILE_TEST for AC97 SH7760
  ASoC: renesas: remove ssi.c

 sound/soc/renesas/Kconfig  |  16 +-
 sound/soc/renesas/Makefile |   2 -
 sound/soc/renesas/hac.c    |   2 -
 sound/soc/renesas/migor.c  |   2 -
 sound/soc/renesas/ssi.c    | 403 -------------------------------------
 5 files changed, 6 insertions(+), 419 deletions(-)
 delete mode 100644 sound/soc/renesas/ssi.c

-- 
2.53.0

