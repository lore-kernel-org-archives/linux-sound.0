Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A6C610D
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 01:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758765289; cv=fail; b=q9Dl67y73odp+45dLTkVBQkGOA5tQZzG+t/vDmFYDg8jgjZWUrOwjmgemSgE+Okf41uB7n1f0EbBaJgqhIXyQExJwMhm9SzlqH6kXIjx2Gps5pKzw7g5CiBmiwazCW4FSeG+8MXl4LoESrOq0hs3Kkga99/zhbAF/FyHFzEpdtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758765289; c=relaxed/simple;
	bh=dfFfKTRXPjFSt/IDv7uFL0VSRcjt73yv8mkP3zFnCMg=;
	h=Message-ID:From:To:Subject:Cc:Content-Type:Date:MIME-Version; b=cKP1TO+dvk1hBf3bkxj+HrvNxdMB/W6UwB7xXWFon+5FIyY51oa63x1rZ913JqFcu5raQ8wPkwNl3rc9MQp+zc748s/3irY/6sta4p4nGqAd720cOfWdrTuGCZUhZqV37zEQs9AHu9BO1m39GqX4ozva8xZ9ADUqpSXtUAwS+0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=otgvWAlJ; arc=fail smtp.client-ip=52.101.229.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="otgvWAlJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wN6ZZWhA3em7DEFH14kfZeAzSncaH2YZUg+gMltSHZ7P9Gre1SfwuFbPDcrlmIEnrQlHinrmAYfBVsYma3xoPE0t5Qhl3CfF86vD+4q818CfDJ/pq9GqJxEGYLoFytblJFVMrTFrIjvu8v5in2eZq+xXPcEf1/WpnT6+saHllsPY4vODzlz3r4puTYpHMygfIlEqJ89cDEtAW0rWHdlLvZPOi1Fl9rJTszZSxrFZ4NtcJp7DkuentJduATFGSAwzfxKmUvAaKv+u0Bf43uUCmJmc3ErO+U4zn+Le74cqK7A2tyRyRXzcQ1emLR0oVN9tYndYDYx8jy8YaECOA0HP3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7YmAMhrW8qm641cqSbjLAia9cU1nOrYynBCAnNN5CE=;
 b=OwfaihQP07uOIg/tN8uS7bot4M9eC5Bvok+QpkhnbimZ94Sk8PTOgyWu1dpPg/McAMmGHxUUGECp74GurotEU6+DI8r7hEQlP23X2xs5lBV28ZzFGOqK5MMccpcTlqAu4GvqyGTYc3Xd95wPR+OW0W8x70PUPMmHc0FqUuErTFo9lLhcaecv0yZcALfFtZd6qiulKMH/RYe2JmRHbcuGpVaXVkgqzkMbDpgE0UW0OtSoGAzpSJ5cOQjW26XbbzpmluVEqkn6MiB+CWpZxnuX4dZHvvdT26y7pdwXXJ/9muDbHW7giorL9TOTBQjVXjFmWZZ1/a3g+Z8MQEy7e93IuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7YmAMhrW8qm641cqSbjLAia9cU1nOrYynBCAnNN5CE=;
 b=otgvWAlJuAIH68YWpFcZj05Swzyp9VIZ/D6l62UmBTToiTkxodSDAKTQ9i5bBW2Fbx/ijPCbhJXoo2zJKGzZ6I0ad2srNoeV6zrOcV7jzhQuCd96A4kJVq/411A7OfvlGyqVMiKlF48ZM5KNDysho6EeGz5fUAVJy2ngobsiYLc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB16015.jpnprd01.prod.outlook.com
 (2603:1096:405:2d3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 01:54:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 01:54:43 +0000
Message-ID: <87ms6jz47x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [RFC][PATCH 0/3] ASoC: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 Sep 2025 01:54:42 +0000
X-ClientProxiedBy: TYWPR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB16015:EE_
X-MS-Office365-Filtering-Correlation-Id: c1889b42-0060-4fb9-58a8-08ddfbd67f0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E3MDdFrnHy8G1qct7Z27s+2mRFaFxzLfMww2w7q8VvqYCgsyo5C1vaoZAuQF?=
 =?us-ascii?Q?yNj8VIhgc1E43MKZhpB5IkuE/2Xl5R7ObsqqvOdv41Uftl4YNvtQVY7HcnaE?=
 =?us-ascii?Q?gHNPkWopU+HNJVT/Humdvh8BQkGQrTnTNMfODsyHqbAQ2ERd3BMbtPszKPTY?=
 =?us-ascii?Q?miDjT1hFCyY3VMl0jN14wiRU3Cqw7gHSKaYoONkg+6EG4ls3OJ5Xxk4o8grW?=
 =?us-ascii?Q?2FUX+5ARJ8NKpLOfUe1I6sGiA7wWuWtmgJM6PI05xG6ZBEvmm9M6ZU1TalGo?=
 =?us-ascii?Q?dw2opknk5D3qrHlGcAhX/SGLPNyv03zXYUH/F4JKOBsbL6JnqeS64Cc45Czn?=
 =?us-ascii?Q?zLIL11tDmbtAzE+n8vyrkzT3KtCqRHyTAa5l4mBAyXgRj3rh3e4mag00xEl/?=
 =?us-ascii?Q?4B7P/xRPq2+YAvcly2hFSRJUFip2t1jXxtKA7NrfJlPvYZajBhxcFu1DWZVF?=
 =?us-ascii?Q?yvSQKpQFdntkNXqTMF7hvtTxwLKXKAl/1gnzn3s7nYl0zmwuyFr29zWcjBbC?=
 =?us-ascii?Q?9gJtzvp1Nh+cBKJIOsN/9V0Bb2An5rb9X2+arjG8jCKbO2cevodzTjcA58tu?=
 =?us-ascii?Q?mCiQXevhVOPh+b6BfCV5LO6Z6nxg8CwkEFUy2a5MPEB+/0qlqmJ2HIM5WBxc?=
 =?us-ascii?Q?N79uzI/AseCCBfI44CNmAPSUCH8HrSdcYMnwG5Qx4bA0WcNdePoI41ldeZB9?=
 =?us-ascii?Q?xS8a4dkl4XzxFlONq/ylUZ0R2SHEPFMr+xtVpMeyC7Q0rPF7AmrEKzN4sbaJ?=
 =?us-ascii?Q?Nrr/f+eClnhGauqQFO0aUH1aX5bNfdxVcGFDjaptM5H+K3xmfhcN2td9lG0T?=
 =?us-ascii?Q?SWeo4oWOYLer6+Zi9HUNVLMi0w+BA6sAsCQfo5M2NtoIr74oKwM+mdGVNHMK?=
 =?us-ascii?Q?2AIXEgHRbjtAalm6lPb3wAtDG6xeOzFdPigycp67hjsGMd+cO6q2DMIougMz?=
 =?us-ascii?Q?ycg5vGIVZeVGdlbRpD75IPUB5huuZNPHcnI1lDkFlDHpSvPnd+QGHeBmb1cC?=
 =?us-ascii?Q?6Svf/RWMWYxXWXgLM0KplwejjnQgqlVYr+TQVfB4mJgMnqEZQDO9W709d7T7?=
 =?us-ascii?Q?RHiijp1WKYjVgYYbZvQ7Nb9rHmgwRXkx7smEFaBxXEPOAZ7mlLvzTvs3dQpP?=
 =?us-ascii?Q?BLKE5SkNmFnOnQH73Q9JtcYJSIKBKLQODMTxIewgkwqerKcss+5aJBZcVmvK?=
 =?us-ascii?Q?7sa2iAJswITxa/IwPw3MV8nvw/loGTk0fhuImXo5XywdWu+YiWe9ZzCsA7oi?=
 =?us-ascii?Q?jRDqCGQptxKbqBtv1YqsEh/n4PiHtB/y2B9Bm0/nkhkwwc9duA6RLAajpN/e?=
 =?us-ascii?Q?jibdeTGJ41xp+zS9EEnQmCjeK2lUKc4bC6Y3ftjEET8ugP3ha1SZTNYZnEjY?=
 =?us-ascii?Q?1nOQLB7HrS7iG9CojMBvG8M4ZEnqqTbDSlRSustNxLmEm1gq+lUfJjL4cDnw?=
 =?us-ascii?Q?FxH4O/benjJZTqkLlHWww32lssz65JZYRJeg3ZsOc/rfSxZM1g7W1bWBxnk5?=
 =?us-ascii?Q?mXrOSEnOjIbBlp0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j5qMHwCEN4ztWeV6u7As6R1Dlym+E0Xq8PLv79I/3qfkfrR9n/GnTBUubkSA?=
 =?us-ascii?Q?vOXASnQyeGHB/YGBwL+b0LmNIexY35sPinbm3GpqfT4Z1Tnx/2vSJ37dRsE0?=
 =?us-ascii?Q?hiJGx/+vxigblyXfEIQjJxG8j868L5JEnl7R6DFDA2VKLdvJW0VF5HP1FRBm?=
 =?us-ascii?Q?R2rDD01YjmsAGV33jI+/zLZqsXmx3/P6pVAefR06rhG3+oW5Zm1AW1mszYN3?=
 =?us-ascii?Q?1TQRRblyXTpE6NCQ8rGLMDAIbw/9AutPRxi6YRh74Cqla+IRH4g+tS0PIJC3?=
 =?us-ascii?Q?h7mAEdyNZfC5g4IAEq6ODogm66GQJ98cO0sSTrKPez//ZVQRATEP6+aHXjyg?=
 =?us-ascii?Q?Z3/IfdvrVSEOu4gjahlPJQa5az+gpmyvAOkKRjXJ/cur4eiJPF9PZhsvOKMx?=
 =?us-ascii?Q?wP/rhAA49ZY7XuLA7eqoGGZN+GntrEFh1IsnnUdkeGjdoG9OjJ3QX6BuU3IU?=
 =?us-ascii?Q?eg4ewhk/p22VFtzl6OVv/NHgp2r0BasVdupAEWU4/Tw0Gpd8PRX9+aWWX6Nj?=
 =?us-ascii?Q?BWrdQ0CUDrFUE6ga4rNtt2z0CiJRbmJS3f0QoOSuztIGW1zjy0UbY+IIVmZM?=
 =?us-ascii?Q?r5Z/SBZxJphLBcr0YjmYNIQdWluIR/nnZssdX8qL0mOlnlwesRbi/5cRJdck?=
 =?us-ascii?Q?+1GXHilkoon36K3igMleVgdgwXzIl6a6U8kPYuj/rLchN6leQMcG4rJG6Vl/?=
 =?us-ascii?Q?xgb3E/z/IPxX1ET8W65RBL2dU4rfJYztFfMR4QvSIzpj1tm9Gym/9LeL1XS1?=
 =?us-ascii?Q?b04udUln3hTfI605T3lSuNU6+dGddXd7J9J2GfpjmKnXYzCaM0aQBYHArz/E?=
 =?us-ascii?Q?/DdtdU4Xdr81RbvdVrBrWLfCgIkWUxoaelV8vrRFhqW+DHb+rfUlLL2LVJy5?=
 =?us-ascii?Q?/fFBTw9BPfoiN6XtPpCoLsz5q0QC7VYqqRd4wWrJce9XLvlPUjKzkpJCw0o+?=
 =?us-ascii?Q?cWHQMQsoGf9ZzHG/4VyDPepeAO81yozegndBuklAZDyPiv9nk/g1pcXzca8D?=
 =?us-ascii?Q?LWic12jolUw8DccIeXYA+AFOOa3QMifBQR7HOG1HRuLAsvbFLoE4wXAjMwk+?=
 =?us-ascii?Q?WlGz8hnJTO+G7NJJ9HKBTLV0aPgLM04tVaWy4friUtFpxCtWsMDrI6hITCdV?=
 =?us-ascii?Q?0WSekYSWO+r0MqTBV+ONXsE8x//lx60y4q9N6alFbwGeUXsZ61EXaq4q3xE+?=
 =?us-ascii?Q?60vF/Eb+CNf0hYv9mqHsauExPH9VkE/zcZb7tjbF8nUhX+K+B4Rx2Y1XK1vP?=
 =?us-ascii?Q?+SCyweCNSLLOqBB3UVcF2dItvGppvYjFDV59E7LVXlJ3gpFf1biX773jPhcm?=
 =?us-ascii?Q?X47bPL86J2Z3lZdDFGmaxmDZ9swNGiWuWr1IQDN9gQ2bFH4K3n1Fysx+rQQV?=
 =?us-ascii?Q?vHpbR7zsD3omTrCfZsdLqY/mQjVWV3UfgyQj3CU7GyuwISdA34ZRjqPhUhXq?=
 =?us-ascii?Q?ymcYF4G1GPOXMADcf0HrY6xtLFyRNWAGvuYkhi2Qvv3jeH4N+aKEiWD8E2me?=
 =?us-ascii?Q?Iw67+r3ODaDId5PKzU9JhVrUlz2mqtMVve2ABaUF3LTkvMK3K4o2Gnlyu7Us?=
 =?us-ascii?Q?+UqFb4oWf0Ui66r/CAIqCyewZ5GCGZydwTXBHHw1FkfM9OifxCZWqeGb0Tur?=
 =?us-ascii?Q?EcHlJqjuPrXzEDzMvYds4go=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1889b42-0060-4fb9-58a8-08ddfbd67f0b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 01:54:43.1244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuvfmXEgAvSL8EFUsHu2SltX+CsO/4VlqEldpiXCZxRZvhQx5SrQlyGMIwpbEZd7jROs8yCsBbVB5P//nzS3XKTq1Z/CBSTq8ekyLJEEfzM8D7K2u/Kxc0AHEVRbOV5o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB16015


Hi Mark

We would like to hide struct snd_soc_dapm_context from driver. So we need
cleanup code  first. Current ASoC have very similar functions (A)(B).

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.

I would like to post cleanup (A). Patch itself is very simple but it will
be very huge patch-set.
To avoid patch-bomb, I will post some of them as sample for reviewing.
If there was no objection, I will post full-patch-set after merge window.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
