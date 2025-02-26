Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010018.outbound.protection.outlook.com [52.101.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFA51946A1
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533785; cv=fail; b=K5edMu2bhf406F8cWN8M/rh/9oUplidLBB4e5Bep8yx4aG/CfjVbct/tLLNW27KtQO9UXBYgadY8HVkG20x2Wgb/IjneaHdwlfik8DSHHnUfUxWNSb9GAs5S3udfPIBpwUB3us/p1YLHOf03fXhv8iHG5wrGO4TzdQH4ZrnGTu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533785; c=relaxed/simple;
	bh=Im5Y+zSw+9EHiRaYHGMEjfTyIl6FNslZ/8zDgVATL8k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=crgW7mhRJjs5Kq1HavqJIjFId9sZ1cIKgIY8jcRA1bD/ihUDQ1RLauy9JP+W2Klst/dx8gQRbW/VPgX5LE0XdI8HPoS1hyV4H9flPw/V/80O7cfibuNeAnqCNxgwzyUC0IkIDfdZqXCVJi08Bf7067D0sH3gmTausSp4N6crijU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nP+U6nn+; arc=fail smtp.client-ip=52.101.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nP+U6nn+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FoJIV+wBZjYYBLT7Hz2WRKDqOnUOgL6rVj507evB6bXXe0DAgjBpGzF5x2rR9ZS3NMpP0ospkWQ94Zub6mZj9iFNaqp2/fNI8qku5vjK/yRhcD8iIkvqcuKOV6j0N+bbEgQY1+1Fg+qfuxCe4i9NYA7B3HGc/NdgDK0nI4d4Pf7I61ba3+6sPeLH3/dfVZ4Wdf2dvDxVBY0dic96TI2GCZOrgC/UGd17FHNbjKOiAC1rCQHrfxj3a81fdcE4nfhvbiflsuIwE1nzscnRhwoqGTghi93NdLQsMIeEccCOhVBLnhpGDzJjs3opjPvZKptprNedNs0hxTSqWW/EKs7aXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1Tx6tVQEW3bNcRAJN6TcttODuCbXc5UXzhVZPJyYEA=;
 b=OVAq1VXMVtwxjYB20p3JEOHYTmyrFIwtlu52rCqH/FqH+r8SQlFFtW9i35m9f8B09Ewkm+mtrYtZaWrTtfORXQwLquXrx0zsjk2qmMzU7NZjG4PtAwBxo3he526NmJEIz+atsfx3M9eZTDV+8qJBIe+7fKYoDjd+UJjb+cB+uunjv2xZK2CEY49ifSbJWUNmGRcGcEdG9aLf+wFL5U1onljingWNY7XF8kMU+jQ2WbH3vU2SIHtZie7DknynH5NOEqkVD+ypEV4Z3HkX7EryWI0l6k+lZfyJxLKN+o/c4haZyZxRGNMI1o0qItQK3xMxXqo2rOgtPzzuPmJLCfltUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1Tx6tVQEW3bNcRAJN6TcttODuCbXc5UXzhVZPJyYEA=;
 b=nP+U6nn+6XhU7kMsuP5qdBtPII16GjM8SeJT1qaUNVd44C7z97WE5n7bSxLwAYTf/hudC1V+SP9eeTOf3GuP/j7v2ZymWCFSl8013VPBhdsh4vjRt5xRnzaJeM7lkSjXduEVvh7JJV0lEyNwuGAw1827UrnGOvPQH/FCjuzVGX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5511.jpnprd01.prod.outlook.com
 (2603:1096:604:87::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 01:36:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:36:22 +0000
Message-ID: <87eczlbi7e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 101/157] ASoC: codec: wm8996: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:36:22 +0000
X-ClientProxiedBy: TYCP286CA0232.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: e9687191-4c89-4df3-bbb6-08dd5605f9c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3yzpw9EgfrGqKkQeH0IKLln+dCrSxWYBl58NV0QlHBREnk7e/AYafX1qk8Sd?=
 =?us-ascii?Q?x/a1MTslJ+ZWNJsNMq2apYDbuF3oEHAxdQXnFRfD7erx5kB3JQ981vnQ+pRR?=
 =?us-ascii?Q?K7Zpeynk/lCapWTT0kVWuRKup99m9C4lXqexRhcs9+bXpdsVEkCjs/O6wl1z?=
 =?us-ascii?Q?QHQgQ8lfOAZEAaKrr1397vxlzOE13IzqEPqtvZgnb/1626X0uoqCmZvFZNYN?=
 =?us-ascii?Q?WGbbexoJuaK5jzbXqJZQ/ApFkW0k40FOD59pPdt8WVkafaAw6YNkWbYSqXpV?=
 =?us-ascii?Q?mS5NJoAZFOC9yMoHhE9gq4wU9CycW4gzYvgzMEw3iuCvEbCHPlbr+YC0b8gc?=
 =?us-ascii?Q?tlxDp3yEHu8VuRJZwYpB3N/sZQuGbOYNIl0epvYSPYizUCFhNGJrVOU+DYaj?=
 =?us-ascii?Q?mcxN9+sIzvUkvz2UHX1G5LElMjGYYfHpHIJ8Pel23pDgMr1gQVKIhhoUxnzt?=
 =?us-ascii?Q?fWew5BI8TvwteCwV1dou3zXhXROUqP2eWQBGbw8NcBtJh1hPsQgz5s22xNE2?=
 =?us-ascii?Q?8v5zLLXmDltQS2BFlnoVo/YdcxzjfRBX8o46+LWYY/nueGhQY2vwUMZ8V8Aa?=
 =?us-ascii?Q?AxYrIytuIrUAsKxSY/9GShNy+VQudbXMny29P3GnSU3FrZnMucvVgbcKoZFt?=
 =?us-ascii?Q?lJrBduBPq/mpJc8DFU66v98poH+Iocb8u25il3k8oRb0s81nKJ+W2cJbmJyg?=
 =?us-ascii?Q?5fnUbV5cDrZhYGPCVLvU/Q2gHEH8OoJyqPLY+Wa9TB6kcv0M/pqrTaXN7YK0?=
 =?us-ascii?Q?V4M3G2YePBf9T++JkUtLZIZbXZo9prrxnmytKomrMnhA/RkLziEmt3c4RFZv?=
 =?us-ascii?Q?uOAmb8kU3Iw/jAwdR0yaiWh8Q1rukVFt0mOSNZpx6CJQUuXggnQu/Rc1WXKe?=
 =?us-ascii?Q?en/hRWqKhwaJCUimb7epezuZEi+woM/sPeLs5qVxycWvWwGuvY/Bz36W60+W?=
 =?us-ascii?Q?RIm9oJfXTUScVZhEJYgftSDDYmk/hWEVu0AbOdx3Akr4/zmOkxoQ7f4+didl?=
 =?us-ascii?Q?OLmd/vFn0ouOGYvpanu8L9j7SWjKveNpJMM8TH9BqF+i1y6oKAIKOEu8pGBO?=
 =?us-ascii?Q?0+jnUT7RQBOrBi8DuVThaPNX6dFVJ/MmHzfdzMx6yOG18PYKzvWtaGDmvaiO?=
 =?us-ascii?Q?ZsGBdKbbxoqqmbe+9OBIxIER420Tk+AB1JXIjbRi9d9KdLHGHzo/TB2ntqIo?=
 =?us-ascii?Q?4QH7hapWnAQN+j8TMoLtTh7YtqF7OePjsFxfYmlZybtNiN8oeASkWL+0ZUoc?=
 =?us-ascii?Q?S2ELjh3M1c/pYPgtKg8vehrc9qcbwQRgx1x7pS5qxNc7ZQUR3TGzilJdh+9N?=
 =?us-ascii?Q?iFHOUCnsj6K2vCfrRrEL7np0aYoEId7i/k49AvT0yslHsFQFRIdeMOIzfCV3?=
 =?us-ascii?Q?TqOxAYUVk8aNrPueGFOJH7zLv1r9m9jKtcuIeSPWqOkbWX2hsCsv3Q/QYI/+?=
 =?us-ascii?Q?O59oPvLGcdputf3or/7OUP229EA0jcxm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nj13+3xAIIOsTfiFo4dZQqJvp+Gs54MHEecaMX1frE1Keo8f4z253h0GTSIE?=
 =?us-ascii?Q?c+9WOaL6BD4rOHqdl77zlzJ1VwRCzZQcWfcve4RJxWH+L8WfqB6ElisTEWOR?=
 =?us-ascii?Q?0GnRP74186o46wygm4+8bw5zRzBBQHsaj5XCSWEbCK3viycDSdnYalXn0HU3?=
 =?us-ascii?Q?Qx5wJN0rAv699PcMyTDcK1wH5Luu+R8pUsXBFUk1LEfTXHsO4XgxFx0u2aZO?=
 =?us-ascii?Q?1NcITIHzxY0OJVE4u3xD0gQr5FEgEgPn05YZEF/C+iAAwKAc6axc1ApLOW+D?=
 =?us-ascii?Q?5DTy3T9LKkIQ0DXph2BCtow4cdap/xMMkkE3EDKzE7qCl2ESrMzGB7VFsqRB?=
 =?us-ascii?Q?UfTWRiKIJAoPwwF/RnlCP90KhT7RT03iOCt07ajS4vNEWNNwtG/P5eyPPoRA?=
 =?us-ascii?Q?KJAmHSvcGYhTB43O0d5bKEoIXbLywvZNf0XCRd5Q7KAvP7I8xgDcttWEj/5Q?=
 =?us-ascii?Q?GkTdVj6JRtF1npdQNela7GcWjidGSH4/yzMl9KJHkWwmFxoNUTfzWKbXz98A?=
 =?us-ascii?Q?CJcRMk+G76PFRdrZKmsjg481HNvt10f+PfwKxSOCAiGKIqktGT2JPv/nptZk?=
 =?us-ascii?Q?kyek2maxrX6lqCOfDMUZEpzEgONwQuXwp7IjhlhzMv1PtLK/9cFvQniAmsW/?=
 =?us-ascii?Q?LkzERDebvhiIVC2VGv6SHIvMk0hfwzb6TbtWOBW+irjYNDBQ16a/OSa19WLQ?=
 =?us-ascii?Q?P+NTvsu/inUy7X33wQYn3Mx+1s09myX/6ReFYyvnYnYaWBtRYC4WtKOJvNmV?=
 =?us-ascii?Q?DEctg6iwn4n6pbgSaKT3CuMo30f0mDRUpIg6I12TGSe0weXfct8I2OtlRWQB?=
 =?us-ascii?Q?s2sq4R4rfDS6KJWpDtvYmwUe9Y9cyWSy4t6Z+hzNS3GsFvKPpcdDV4Ox7MKe?=
 =?us-ascii?Q?5sKF/+fCcFX4axe5IVo6zkomIq8cDFLyC/vTVw4Q8wOtYH2aM1Gvz8tkMINe?=
 =?us-ascii?Q?YvWXlKRCQbfyLdV0WqAUNc+MoWnH5agbYj805sjf2FonXcuV5DR8/Ji9SVQH?=
 =?us-ascii?Q?yU/Z1gweiv68nXh4ItnaUiLFlMmTHYwh7QaqoqtanfVv2wieluUlbThKuSii?=
 =?us-ascii?Q?Bi8N4CpgRq68RmzasxGzmPDFh2dCwvVe23CKW0NKW9lnnM0Z/bLv++IZTTB8?=
 =?us-ascii?Q?LanAH7npfo4/Fq08zKOBGOYpgq5WOvEJtFCvGG6V/UCbsHOTMpba7N1rDv04?=
 =?us-ascii?Q?VV3TD/vRBsPneX2OQLxniDVd9AJ+yUNYwl/L2Xb5xzwddfGX4E8wxplllzDm?=
 =?us-ascii?Q?2gHUfjwTVmHpra/PS/roxzTnO2iYbbEi5VJv3Dur9y6SJEyhc+AZgWgOBTDM?=
 =?us-ascii?Q?GXnceHfcFWQTLEdxNeGUsL+hhAZQRjBVU3PyssJgCHR3cBo7DJssf3IJ8wMJ?=
 =?us-ascii?Q?BgY/dJod7be5Lhl0D1nXRaXbszOJZIdvYqSrqp9wWYIMdNX3wiMiRAtGNDXh?=
 =?us-ascii?Q?leV9p+/5DCvwTm9SJoPkS5kQ6AVxz/qP8eAvGbT/lm2Ar1Ha/ZvV9P7hPc0W?=
 =?us-ascii?Q?mSCwejI1qLD23sf/rWZ6XFStjvSNNSuVOvpKeJq6qBUJbihHN+kkb21Rjava?=
 =?us-ascii?Q?HbZMJ/S03seMM9A8dGL1Tnicgi+CJVti60OaejASVujqeaYBA137INVsr5iM?=
 =?us-ascii?Q?xJjKc0YRopNSFPq/wIZ8FgE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9687191-4c89-4df3-bbb6-08dd5605f9c8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:36:22.3382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nq/HO1W6N6mORnUf8M3zWWbkdrYJTWWkqYWG2r+zDhPFsFTAT+cupWzmlmn4upIe/bYZJOl9/5k6u/3DrSO5zyOMWybHVmU5otMaozcvXGSL6HYbPhCrsSowQx6Nioq9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5511

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8996.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index 5c06cea09bd1..c2af8d7ecdd8 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -1672,16 +1672,16 @@ static int wm8996_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		lrclk_tx |= WM8996_AIF1TX_LRCLK_MSTR;
 		lrclk_rx |= WM8996_AIF1RX_LRCLK_MSTR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		bclk |= WM8996_AIF1_BCLK_MSTR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		bclk |= WM8996_AIF1_BCLK_MSTR;
 		lrclk_tx |= WM8996_AIF1TX_LRCLK_MSTR;
 		lrclk_rx |= WM8996_AIF1RX_LRCLK_MSTR;
-- 
2.43.0

