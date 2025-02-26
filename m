Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011027.outbound.protection.outlook.com [52.101.125.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DB2199FC1
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533962; cv=fail; b=pxXayIqtO0N/x8nt+ZGPlGqEfLB16Nm1KdmfzjoYz7hH/r9xz4pa3oyWaLqOi6HPyKCqD9KBH38ph9CZBhpAwEs+2mfqVx73O/iORFNfsTbgyYmbSMTdJTFJkpC42nbvO9cWnzBLhvrvFd4s1wNiZlEwVFtUXEdCWOqLiAXJE2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533962; c=relaxed/simple;
	bh=1/1UXHNwQ5eVelnfInAoS7NHUc4jBzuCg+D9Q/mvKZo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dyxVc7Tr93KUqUV2K+J4dcb6eYtJ+qFfE4CB2/P+du0Nfh1a4nyHUYvSZWVstFyJBs97tTwabK2Usas4FodDsW506TImr+NryU94e9+sqgh7cYFGbrf3wmllAtu2o8i2hjWr3vyibWipeXurLPnTcAzw+Out+3udhQkdd5fgQd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Kq/cLhFt; arc=fail smtp.client-ip=52.101.125.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Kq/cLhFt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrxLrsjChYLy1n7nlE7ANHf0GWF8tfSj2IVm+sk3ohmS3jKwiA8pXH0ZcVP8vy8VdULrsevGyYWD8D3ucvfNoe51+Df9WgCRUwAb5j8nDNNRVtKGinGdcG7NiLJT2VfMSO4rs+Cde0EODVHybA68ieCFxc7pNAVEooyb9+iGZ/F00s7zOZQ2EEYOnwmWXLDpBN1k8RfEcfNe7mwmnGAqG8fP5uB5+5HAbm9nEdC0HNYxw2sgezqgIuues4wW2HI9A8CWcojjuCJTVcBJdBgqWuS61Srii15jBlwtY5+EFTzNRdFfcAF1wV+rNZ4JmwB16VtfhaCIEdPEHZ+SMdbp+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbnrbhWDf2mzi3GbdPrIRy62wfR/2Xe150MnJU2bTNU=;
 b=BrIzsveYiECSn67c7RTTdO/MVv+OdMRZkSopsJ7qSsRa/egep9sIGLg4IxhjJ64cyVRxgUCpY0VL+k2Mq/chTJ/H+PXdS7J5fgS50YjsglrClQyLEXW2sr5sOvIDMMafmf5xuBscJuKJAc3UnPaOI7/7woU3M+BMixIHA74hTqWej8xV+ytFcdX9lvPEpNtPaJv8Ugh4Vz10DqZ0U3ijJmert3hQl4NbI7d5C5467Gc2ikPXJBT3wpkLTT/tVN5GZ7YdLAuGXJMVENN8BPv/afRCtd8v0FR4aNY0dm1rM1VO9nfE9oULhaYt/YJERbja9hM2lCLV2hGLPVTjd/EP7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbnrbhWDf2mzi3GbdPrIRy62wfR/2Xe150MnJU2bTNU=;
 b=Kq/cLhFtlKNXCcIE2wvWBhEIOKuBEg/f56NM2iOSzXqaspCnr1WpiXxEgSxKdo4vRWVaysmWwnxLI5pvfNDjBGAB39N/6VLXwU+7ppjl+2MsKUp7xCfox6SS8DvbH+fDvLALhDEmIjiRdnKt2V8aHvJba2qzXGF62/UwpttIBiA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8140.jpnprd01.prod.outlook.com
 (2603:1096:604:1a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:39:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:39:19 +0000
Message-ID: <87ikox8oxk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 148/157] ASoC: mediatek: mt8192-mt6359-rt1015-rt5682: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:39:19 +0000
X-ClientProxiedBy: TYCP286CA0139.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e7099fe-8916-4c67-8aab-08dd56066361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jqzj7I46wHDY+Nr2zz/mhEL8bKq6L83dqe9K9E5wQ+Fy2CCD8h+BvETYv7ta?=
 =?us-ascii?Q?uHBcDhXTYDMbulph2nmNfKptIn285wcQbYMVGFtK3AJ00VohVrdxAPGTgB/F?=
 =?us-ascii?Q?sZBuT3TMRjyYcmJJUu9naj1ViCsCKyIaEYbhzrckL7r5BvZ2brQBVxifTEqu?=
 =?us-ascii?Q?H3CY+Vh7Hgt/LcswwO4VkdiKQV55GRi7QH88OcNJ+YbmbiunziZhxE3+UM82?=
 =?us-ascii?Q?A15VF9xGbd49C4Xcwz73KjBpYuBw+EHxd2LNdj84dktgfGXQs7Xw4iIX2gPI?=
 =?us-ascii?Q?XiBBQWuyPa9XIIzKLksrd9u3J8aF0LbgGA8fM4U6BQHbf6c1MGkA8AnGjerm?=
 =?us-ascii?Q?uuJGppsepE+DDdo7BY+6mQuKTtGZ4E8m+Qz4DIRkM4gor7j0jekIE73wFIzO?=
 =?us-ascii?Q?mDfWMvunfq4nuie84DYzN6gg9NkOsObMi/WiyC36M8Z3Qy5q+cEbTslj4eES?=
 =?us-ascii?Q?G5a9SWDjzpRSxPk4TMmCU5/Hvs05/DC2GcXAd0kh3CDBv/IylXuqWpRH9639?=
 =?us-ascii?Q?XeklFQ3B7wBINsBkh87YmIdIpqJv7aD50VF4NHpMYG7Fb/hRG36+upGgHSNy?=
 =?us-ascii?Q?JVIqRtXqkOLLKX95NkI7SwHN4UoZNXcgZvSw27chJ4XVNdxRgJA2n2TMUUWu?=
 =?us-ascii?Q?eQ9gh9Glqp8WdVZ/xdNjJY3pV9hB1h2nI53TXOpyNU9BY0P4gKqN/uIac6Wc?=
 =?us-ascii?Q?4dzObe5zf3DFyVW8lfKLzBW8t/m5hjklp8qb7ZK3TF5hPHOvC67OoPbjJ6Vu?=
 =?us-ascii?Q?lK/KadOxXtLOUKMqPs2UIWFK8ko9gGmebhW5wF9E27pDCz7J3tXD+eUIRMum?=
 =?us-ascii?Q?IzUs0gX5keCU588pycdtvsiy6o6q0Zo5NoRcTyKq6EwQdup9QNcfIUVwy9x2?=
 =?us-ascii?Q?zj4mgq5hyoHhF7GdCV+K2ogDfq6X93DFnljWPFBSDeGiwUgIyj/xwMpOYnaM?=
 =?us-ascii?Q?G8szL3seGZa0fTnOBo8fOY/y2J13NrtAa9/4/BNnvQVaBngbZNgZwdqxTFMX?=
 =?us-ascii?Q?MJVi4aqzxHC+YzTyoLgTLSjtRqeL78drcjkbJnSZ1X5ROyVu8kEd3t+Ht8sN?=
 =?us-ascii?Q?RMgZ+093YXoCuMGFKduDRGlSR0T19yImFmo+pQj3z9AKGMiA/fQzD/XIzYGN?=
 =?us-ascii?Q?4WE2XyixKBP0GiZ3f5baP+B+f0/jqg5rBjHokz6rFSRclGsEYUA/in8ymOst?=
 =?us-ascii?Q?srtzROVtbHWySLHQos4SE3pZ1VbIK7/AOiphQW1UZ1phOrWibk6/NMwjRvKA?=
 =?us-ascii?Q?GPmn9wjr0G/Y4nEcypxPRA+16EWv+VeM2AbwIW998nw0f2EKaw6DMdy4QsgU?=
 =?us-ascii?Q?AxDolEU3KwHPbQ9c2QHYUj4hggMGF2LK6Ffs46BxbO0sxmY12IPQkHHWGtlU?=
 =?us-ascii?Q?UiuIE6UzJP7CiW44E93/rGit4CVlcDbfEE/sXDEpZdZkvGsFw+d68aes/yi5?=
 =?us-ascii?Q?5dqE9Wqkc9LwewKLEQnq9Cl22FriR5gZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5Cz0p+0nXF5HssWQtaHd7FEiW/9nDl/S8fqM40DUtOwCSYfMaVSzGqQ7xrbj?=
 =?us-ascii?Q?r2ZWbKxTqabQSN8tbl5F72TC3d3yI67fLa9ACDn/88odZMzDxq70z/fGekZA?=
 =?us-ascii?Q?BThhOhaxAHu4fBWiG+3qn96aq3JXgTr7oP+5f5ddDv/PFRfu0rBN/aFTn2ra?=
 =?us-ascii?Q?bzfzojKr2Cf8DGXWYoXrMyM8UCpAiEkzYAw2WJaMBKwPQrQuOj+9xaweKkAV?=
 =?us-ascii?Q?Z6oOhbH/r89bVg69+CMR0QwsHQCYapH3nS5BFaJt+aLc1s0UunzxHxqmiJpY?=
 =?us-ascii?Q?d8OabrWG8TMGrwHrRx6WGVzI1ltKgyBHPXN2ME667zDixXC8tWWt4+5VlTi7?=
 =?us-ascii?Q?ACIuVd+VQ9ph8XtxxgtJCzXI0vA+gWI6NaSG967IXaAKIRToxgagGE5D/etG?=
 =?us-ascii?Q?LZmVcSJv62WPIEuPrSymhZqLJNejkXwT+boGbmVaOviSBoFZ3/M3hMTm8pZA?=
 =?us-ascii?Q?+e/Lz1aCIjEnK2K32nAd8Jd9mhniivsW6bsvbzer25hUc9wiEbeZsnfZ3Vq/?=
 =?us-ascii?Q?lAmlOwonVqrmzuXFbKqtfUxmYXifB3cLBYPnGTqHG2kHCmIibdfy4A8SI6MS?=
 =?us-ascii?Q?i1aeEJkuH3dmkIERuPCIARxNWUW8iVCjQLfX8AZN8jJj+67nAuoEmJPdkvI5?=
 =?us-ascii?Q?m3VSAhplBCLmccX7CYc0tRgxv7pkVljWLZtaAj9RE+ydm+Klr2D20U7q3tzg?=
 =?us-ascii?Q?wZFNM8P91ptch1CLrh7nBD0knftZeqbBFTXzaO4xA9GTnbDegnv7W/ryROhy?=
 =?us-ascii?Q?FSE3FSpUD5tR2lu3xspD4iedFxIHmCwqrxqe5qkjZQ/BPweo6Jp+Bqy/eBPq?=
 =?us-ascii?Q?FQpwwC98qW6rFTtiaDsregvMtL46GtDNLzMqtH0OH4Hd7kI0UIzZSHmCLNwP?=
 =?us-ascii?Q?c9IhcL/iRosivgCsGuoh6O5GdqMrzoOhH9TYqMb6B+k3VDvpLvO9d9LRhYtd?=
 =?us-ascii?Q?VxQQP64IuL1KDyjJ5lMG2yHB4EO2X0Yg/l6CwKpFFY2UP76nJB1lNYC87oqL?=
 =?us-ascii?Q?tgUsfPyUtYEbOlus5fD+bZGzvyJ+Og9hFCMbLB4DuK/LGcNlNfgepTNtM3DV?=
 =?us-ascii?Q?F7O9kWv6N66ohkCSI6xkIrGsh//cyYsMMw7XKpkfqN+hq9GMcIC6LMz+FyyR?=
 =?us-ascii?Q?4Z5a7xMrshTleqYXpwEOCexrhyk5vXXgsX6xtVyqcr+vNosT0ufynw4gbb05?=
 =?us-ascii?Q?qbCKeMxllPUUe8EUVQidXNFBIiT7S6pdiZO4EHjX3ic8BZXaQ3lRvN+atWsb?=
 =?us-ascii?Q?qlk84XwYTjtEjVIm2mFUAAPDA+kogncm4L/Jm92mgTeV/BMSdduIsaAcVEbk?=
 =?us-ascii?Q?gI9HZEJPwpOz6Bl10JdYJdSTwgpID6hpJaPz3H9h4yPcLGB/RC+cnI0DI3YY?=
 =?us-ascii?Q?QvN3AEIsBPfElm2IYq3CIT71RVNgp3rDXIIt58filjZhP2ZMTz/bcazJJca2?=
 =?us-ascii?Q?Pa9/S4PJariN7vGLY3aeXXnXks84Hqupkq2j9kObFAdgWi8mCMnwol24bJIN?=
 =?us-ascii?Q?SQ26M01b+68gCTwl+PCKgUmQuLpJXc+PMbqqbPkkpA8f3zPSzTIQ6Q9YayNg?=
 =?us-ascii?Q?duLprGkwhj3koylpwfmqpjaQu1/4ltktghSjOGYnyLS72r2YQAg7t4tyJhzb?=
 =?us-ascii?Q?egscOvgFhL0hvxVQVzUS0tQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7099fe-8916-4c67-8aab-08dd56066361
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:39:19.4909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sv0bKfvVjlba/PdrANqMkX4YtOuEpEsoXMyXWGuTwEzHG7bKp7D/9cOxTwNfe2b8ddDB2dy351MtvxDl7Smuh9exqRdBNnFY5CD+bUx0pTwdjNxBzRhVt4uT43qFRQf/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8140

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index b1598cc5587e..bf483a8fb34a 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -920,7 +920,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_DSP_A |
 			   SND_SOC_DAIFMT_IB_NF |
-			   SND_SOC_DAIFMT_CBM_CFM,
+			   SND_SOC_DAIFMT_CBP_CFP,
 		.playback_only = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
-- 
2.43.0

