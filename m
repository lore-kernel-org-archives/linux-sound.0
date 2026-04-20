Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699ED1F130B
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 23:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776727313; cv=fail; b=bc29ubhw/U9AmCchu7HHmF7M6jt0Z+9GLBccP6YdR/OkDLU8OXq1Va1yHfV3yjIbZrf8URC23mz4nDo4nk4POKsExphZ/uDsnDnwtnKz+sMMcoxGzbVMWgOTi6HcAtLZ/qtzLk+ZkxbScylFDLBdcsOQZhmPvGBo0Rp33ziO2oI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776727313; c=relaxed/simple;
	bh=idQztBKVyb8b6RuoMs2VV9Uor99W40IvP5rv8aFALQY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cUMq5jMI8/4YWocJIsnbfRmszdXxUiIgLzuI4biVLVxCto79M3q8082iP18HtM16zp1y43QVp8PTBzs3DtU1w4L6tQ84iFO/sO0yN5gWv5gct9aDWZjBX8Sw3Lnnqe8JpEKpzQ7DkoebgXAqpdAoRjdYcX0sW7hWirOieFQJIwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ScLZQ11P; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ScLZQ11P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9XQORQMWL12nryZhIy7+J68M0w9cDBLEogMR1ArIWeMJryT9a+vn3MzoGM9JAdAh8b2K7x06VxvKem4ltWYhLxppdy5PclRDJniurlnYx7kgpcWXzutqT+D1Ke83vtkQhh3GQ5uN/whLUaoO3hDqdzRScOsvLAHFdPoZeSHtiBZRVytq/LqzouANYGPTBacfpyPeM7vwyMOzI1YUC4hD9/ZBoSWaTxLOMWIwRTI7mHPI9/muu9RsfZggULfvyDSPsdEsQRx5iL/xdqTslUFwoq+PkaynEmGiJBZGHaiz18xtyzCwfVjPGje71dVTxI/WJiRwzj8UDtOIw3xFVbklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Zs+wOCFBluqF9lXch9cm/UCRd988uGajBHOrfUvT0Q=;
 b=T5j4TDx0xn3whYELGtnSMkYZ6XB77EZQoMYfVzUQ+p/OPfo5y4YQ53vANiZhf7rrLvPM5GU6Qhok4o+/pSWK6xHXhtCTq6J+PXayKBugyYFflPpP7a9MCCM7zrc+XyzqeEtdzFAxeXzuULcCElQ7JWs5LSxeEb48S1/4seGS4D1M1BYjKOxBc4WYvV1VLy3ARP85QqHDCDPp2cIqF7MpFuLsugbdZvWG5oA7EnTNaq53sowUFoit4b/5Ct1CyXz/Xial3RSRRYuJbwyDeeelCqQoorjiT06IFQDRNJ2cDxZOf+lq7mafubHSdJSyk8yCKRuGUsMn/1DxrP/ZQWie4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Zs+wOCFBluqF9lXch9cm/UCRd988uGajBHOrfUvT0Q=;
 b=ScLZQ11PX+B/blA1jBVQaHZF/6skook79NmAa4U44iBpYWspFqeA5GhASsox8vwfIvxJ2XY7oKgZ+mf8kA+kG3cTcIYfctU3p10m8a2GiMzjj7bXBs3fEiPTYzt/miagAxBx8njjghQrwABX5UE399bM70NLLd+fHElOnh36aOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB13131.jpnprd01.prod.outlook.com (2603:1096:604:30c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 23:21:49 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9818.033; Mon, 20 Apr 2026
 23:21:49 +0000
Message-ID: <87h5p5z08j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: ti: ams-delta: Stop (ab)using card->pop_time
In-Reply-To: <kEUB9WXTRsS9I55YFC9m_g@gmail.com>
References: <20260412012657.1370381-1-jmkrzyszt@gmail.com>
	<87cy0336hd.wl-kuninori.morimoto.gx@renesas.com>
	<kEUB9WXTRsS9I55YFC9m_g@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 20 Apr 2026 23:21:49 +0000
X-ClientProxiedBy: OS7PR01CA0074.jpnprd01.prod.outlook.com
 (2603:1096:604:253::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB13131:EE_
X-MS-Office365-Filtering-Correlation-Id: eb585160-bb98-4b2b-b3a2-08de9f3398fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sUcYfdN/mIXF6CE71EHFrR/CwI+fb3KB+UqJB6aVvSju/20yNthqIwUqS7ThYmo4d2qeaIU9ekIPP7cGd2xw4z7k9b4JA3Di/XjVyoBYRjjc0rbHxb72ni/OLCLA/v8Lr7Hu9jXJsN87nk0+yxENVAjFS5DnXXaZYseP8TC1ZFfoYqhapUxBvi5s6x/WXcgivc9+ww6Fs9ZlIcDSqcrBlySwm8RSVwTznlYOSd4TKxB9zt0PrwUhaYeuu16/SNMBkANvlMxsv4yHIbVOptmzK4KUC+AOiZ5Up5euWio8+iM3uOz4UeLI481tpByQhTWn4DjZ2WBH4LPG2XMCWBT7li3atvv9HlBWEjrKikZ1P4tyPKWa2dEqDTufBfZaVWREJVpvAE2P+NESl1L1YhBbs4otZqRaoK1MziG/xuHisYihBgGpUktBiQMENDHauZQwm6dBLUZzNsiNqezwq5fFkXWS0p7pDqdtMVWFJEIiWeUTVpK1i1G3s/+eURtO1rg2C3StUrMAzwVAaRaCFNGqH/vueDXJXOosCym04DrpcuWBCGe0pF9tTcbLVDBLp8GgZfeBnYUakwLGv9YkYxhPPwoKuRT9B6cvFZ5xP6mbYbqCwF29kc+744cpuway1XJAdDyu+Ip1kzzUWryqQkB9GcabsNieqOGqs0Jw5ADCN6XpaFjFQElHRuy1JscurQYSl4pMgKxXr91+dlQsgK2ZePP+pnIJodaDVWqiFK23NS4S0FYskYjUA4omHcbLm6ZUiZAo9A2b/AY0PbO/D5lsl+CTk3JXKhnSKVKqsQcYsRs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b5vKUgj9u27X/GZtKO/LzEUJbwGfKtLd6NvQZwtuN3yXebm/Uz0wvVtLObnf?=
 =?us-ascii?Q?Gt40/uBvocssM8RtAfBk7aR2LH/3X86btqQ2jlhQomMr+wX6DjFrI+RHGCBW?=
 =?us-ascii?Q?uxLzHH7T2z0RuXsNbcV+IIFwNxp/0svU9mFsjZSG7p6+7MVCwBdPecSKZuGc?=
 =?us-ascii?Q?2+bcM1OTej4TKzvX7dVbXIF14ho+QQFy2ErY0btkfWzgo3JsSouHiPV4y2od?=
 =?us-ascii?Q?946rFYnDJVTzxE/NYLHpEpZNtWqtnv7b4zIu9UcHjm819vVMsPE1QFTg06SZ?=
 =?us-ascii?Q?RNtwUiKM8zFxuwVPoYpwkTVvk9AdtIg7rdgKC85Ww3qZqxLjXjA84B6Obbyz?=
 =?us-ascii?Q?vmGLMifxKac1QfNTX4Jv2ESaJjavgr1TL7yIHuo9GMmBemu88M9JsVqPqtBO?=
 =?us-ascii?Q?iTVaHMJIhyhGbMyaD2Q9KuUu3CW9yU+sZnFb5h+xpedtTZgQgmRNqJoXOQrE?=
 =?us-ascii?Q?LJ60n3K90XW1hf/4rxKHEeVaS9o6ZFfB9K89cll90TwiTtEma50650/yZ3h9?=
 =?us-ascii?Q?9IIM147jl4ih7+8ohGYVOTmZ09C0HFO8uY6fGMaJZIEMUIeyxMGtHb9zk777?=
 =?us-ascii?Q?gMO1t3loma2kQxyUfIJcQkT4tdWThajsRCWWbNQN9uaZfcHpcyRWUJFHoVPC?=
 =?us-ascii?Q?CaORFg/grmKcjI467tdrL/NY1R3c35OXH3w8uCoqeXrssmr6JB6TYZGamr58?=
 =?us-ascii?Q?mR2E67KHnEwynCF7QtNsJ5D+8MkR5PfCHEUV6+lovcyTE1rtIFHLc6pMcxt2?=
 =?us-ascii?Q?SQ05gzuIdJBRsyBSxPMRwPozwvTu33ohASqJ5eZ5+Xrd1hcUwUDHCNq0mgqP?=
 =?us-ascii?Q?s4npTZLknSlrrgTm8Yqx2GrbYSL9DYlbSxzsSx8j2Wle8c9yqDzY9ebfMZo1?=
 =?us-ascii?Q?L7Fjg17sxBiTyAYSf2kgDExKsi3o9y8mgQlivDT2IaI1B2GcJskH7Ym2FZ7O?=
 =?us-ascii?Q?p6eQjPXtZOiKSnjc671ZW6/VtDvkjgPTqas6sd9i/R9Le+XxcFpFxK4KVtot?=
 =?us-ascii?Q?w9PyEi9rytJUG/K3g5eYpdlybXzwKI8BVW0Z2mDhTdX89pitYy6jub9TssrV?=
 =?us-ascii?Q?K3Cie1GpHNDhSyRjxYKSEYE+xIRbI1KqltYH4lMyXiDqi1GIR48EkDS6Lbzg?=
 =?us-ascii?Q?myWgEBDmx+ttTH8yKaw5eEaafiE0GfUTZXpFRq7U472M3w5FIDFcAoAeJoC8?=
 =?us-ascii?Q?IEJALeJATmVw44PYlcWPkTabQXAxSyV/9BTGPeHDmAz+x6Afc+wl0yi6+8vm?=
 =?us-ascii?Q?lao3HF6fmmnoqe0Y1lNJwM/TEndIT37+G0YLWI1wX4oknVbxDGdnNP1SQzpp?=
 =?us-ascii?Q?/49WNzQtHL47vlAIhxapZQ6tfNLB907hUZdIqqDpKAISJTexUJBEOOx4cY4W?=
 =?us-ascii?Q?nG18fihGgPgy+0oscqsxAhAYW+u4YY9huNrX1k+XK8L7Y2X39WaBlRMxP8dE?=
 =?us-ascii?Q?zQVqFq5t9bCPeSG1qGixYBYqUNeyOO6znJRwrWLkHtSush2iKKOzzPFh7Mmj?=
 =?us-ascii?Q?sPw346Te1YR1XYnMO5a6ByXbXQffMAI1/1UuSOdfup6QRCeLUy9nxUeJCPZc?=
 =?us-ascii?Q?nnt0e4FelYpvyvQeiNWh7y3ulA5KdRHHpio9mlmnouXKSIV9tyBRki/5zVpq?=
 =?us-ascii?Q?fmjk4lj4p4oFhBeW398BEb4CnNA+ogldaJO/rOR/DoNzRTCRJUnlYI9Ovs5e?=
 =?us-ascii?Q?M7kX5puddy9slezWVsk4xNZdA3OBY1Idlu2N8oz7BeCZ1GofPD2yArC1JDNo?=
 =?us-ascii?Q?CXmeUDIUjqqiOuMCmkQWnysbUTW9GDWx6gV9tDmOoghKbVCe8AWw?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb585160-bb98-4b2b-b3a2-08de9f3398fe
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 23:21:49.4124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LnbmTO0BalMIjQ72eH2pEYnbTSVmepVn0k8FBgGef3SYOY6V2Tmaga7A6nfr/e5Fz2RzjER3ccFBV/KJu2R6WelQvxbS8SIb7KSJqtTrGU7MFfSorVVHJBrLMviYtCCZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13131


Hi Janusz

Thank you for your feedback

> I can't give you a definite answer because I'm not able to recall exactly 
> what it was needed for, and unfortunately I didn't provide that information 
> in the commit description that introduced that code.  Moreover, I'm not 
> able to do any testing right now.
> 
> My intention standing behind this patch was only to remove the non-standard 
> dependency of the drivers on that attribute so its abuse doesn't block or 
> complicate framework updates.

OK, thank you for clearly the background.

By this patch, it is easy to move card->pop_time to soc-dapm local.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
