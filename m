Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010023.outbound.protection.outlook.com [52.101.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038C21922DD
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533721; cv=fail; b=aVT+KN5WgfxVgOZU818zFIlADSVl9fLPi0wDdNEpll5zxLrb0uApK1DvbT6cP0wON3tzYjRdSdALPqvE87DG3VzvECsBLrJVGlLSg4L/0idrsS0R9KZzMeffPxwIqVX52ITWA/iI2CgEr1V5KQUINDUXyMgx12nbwsCLDxY7GmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533721; c=relaxed/simple;
	bh=ToccohWKkBPpNPGpMMShzaLz6c4c6ee+MOAQ6gQjEo0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MnJ8HQtSCY0f5qFrhXLoSpvUh/k0HfUrvrqw3f8JKuzCzv/kVFHibNSEONhqgkVFjcyUye5OXN1A7Ts5OecwrIQfrdclFbwWC4us+x7AgP024X18OcdJVl6KMjpktzi/seXl2hQqan5sZZmVmc+/9rZSP4Xw3llQ9KOIIZRBsic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=T7DY1ihh; arc=fail smtp.client-ip=52.101.228.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="T7DY1ihh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zvx1lizK3wodYaxwmSCnZC61RevBGuJ0R+k5E7VJrkZd746OFwUVGg6WyVWDwzhhq62BgfS5VfDijkryzewjLcQr7v8JDwbiVjxAXwxTX/l++6ni6cn7Wvj4BOc5cweYcCos/OF4Q39dq2wDnQ06cIN1JsjHcstMY9RLcq1CyCJv46xWzkkFGZ87K8TbwvHtbkPMBSRv+/tt/Bn3erI5zuxLl8czjl/YviO+1qRriekwybF7wR1cI6DsuitrwxsXGMeDLizCHGQn76hGEa9FtfYrCZo7pLYndfCVzLUzj/QzTT1JjSeNVCT9j0HbHFydORzn48IabHvIU81pAikOLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5miYEYGFXlacpMU+IhsERdsI/sISYbzsiDQ7fSWOq1w=;
 b=TzHyjh8Nljws6i/h8nSwQ+SC7278Vm0YPIJDmROTGWNaig5HU0p0pv8wqcQVsAcgMpEylbSfieetDVkFAyn9mz63jpM3RsEntr0AfZtD2e4pXUulTfIab6hd3gWIJwCURlZ7QdCjGhifA0uR8dSOX4px7zbI04lK95mtrZdOMZ0Q7D+fRInKQmfPR+pwftcyl+5j8Acf2M5cNvmtZ0zGLA10i+lrr2Dmrtxv+CYRzoLdWxeqNrraaO/PUMTed39bKfyX09wkj2aUIoXl+qf5ezKRklfEJ7DSVjFAYtAc4VO3mUvp61P91FbtsFv2/kX35p9QkhXYzX7/pzBuFfzbyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5miYEYGFXlacpMU+IhsERdsI/sISYbzsiDQ7fSWOq1w=;
 b=T7DY1ihhJacl9ITgIBs6uPuvra43wPGdpU57PjwQvjWGH+v3XNdc0RvZACIEuP7EBVuH1fzVJe34JWvQMOKG6C6KBHMB6p+zYSLFBMGBqM0KBdMaQ661FFT77P93tO1CyuQqI/fej08MzSQdvil8LlSlwG/HGS3BQ9+2xyzZxQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:35:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:35:18 +0000
Message-ID: <874j0hcwtl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 083/157] ASoC: codec: wm8903: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:35:18 +0000
X-ClientProxiedBy: TYCP286CA0050.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9e8ce2-fca7-4681-563e-08dd5605d3d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qaSh87HQLbUe4kPziJs6qcu2kcJywbTBtlSSnbIEidWp8yHcDt5j1fwoCOA8?=
 =?us-ascii?Q?OEivv3UPmS33WRJpgBd5uw7joaXxuPZ0E1ivlnNKpv+ZTkhEgR4FG++IL1Ki?=
 =?us-ascii?Q?emsot6qNTSDwuIGgHy5xFnK8pavqF4B4/O/VX2+dz7OH0ATSS0J9GUiPvjzP?=
 =?us-ascii?Q?G45XJhE+mBAUlTs1xmKLPby9IOOBoq+V3x9avEzZz41vC/CaP9EIXYlBXyca?=
 =?us-ascii?Q?C6K3dAvhvD3K1SB6gOYzSFVUoJp3KPAv4qA/jPHDBjo9eguZ+/NCcBXqSm+V?=
 =?us-ascii?Q?PZN8u3PLc46N3uUgBbxsN3QTyYtqgXroeDwxi1T1zP0JjKyNRXGKMinN2M5Z?=
 =?us-ascii?Q?Jqb6t+KN/9xcV79i8K6DL4U1DnMzNwTRmARxT2H4EkqmM1pdWmOd0iQsmZwD?=
 =?us-ascii?Q?3DKvlgZqeXzfEypp5bY/7fuxUYuSFKeqahe6Ytk3WEG1E271gdj1zszygF5a?=
 =?us-ascii?Q?MlKEsph321YveqxBveLk7qax6v68/4p3qHfVSepG5CLDp4K4xgaCUHUPvPEZ?=
 =?us-ascii?Q?h+9c+gbU1oN3QIVoe9xlxqG7tbW/K9XMY4UcszLwMpF1RZKLGHI7Ek9O2Fuk?=
 =?us-ascii?Q?8xQG45BgqT9lU+C9c5427aeeB7mzQYhEcSxV8b/nNWNfTOJKpgjRt4Nmdsaq?=
 =?us-ascii?Q?0Abt74DZh5zgnfTEW8zzqnPmQgCw0yOo9DCG+JgW+jaYYUezPRTDRjWDlRV0?=
 =?us-ascii?Q?9bEHUvUoEKisYrwTOFoEZWycmK8bLsUYN3cEw/84Yo6U1NYJBe+XI2MUeO3B?=
 =?us-ascii?Q?iWM0Nyh7KBIGam6rOQj8CiZLdnAFcKoj8Pk9cq/YNoSXD0D8ItPwiWdq3pdE?=
 =?us-ascii?Q?1d9/UUZ3EsBKXxQ2QE8WhLO3haAt5urNdK/Gi+LUsPma9q4JcJx6nk1M1+jT?=
 =?us-ascii?Q?/CpyODXm40Z0Gm/QBdjRO6ctk/w6KRuh9w+TSPOfYnfxDeaLKHuygCcgY/4x?=
 =?us-ascii?Q?CTC8/0GuhVLgEuGgEkoPSkHjTWfAmZQW1DmOrDy8ryGqgC7izH7qBDsiVJmF?=
 =?us-ascii?Q?SZbVmidPvJtqoRbETH3zNQoWjrRotvD2gREWInKuyhdk0TD3tpyqeEUm1a8T?=
 =?us-ascii?Q?LAl3zt98/3LaGTiiLQlUeyYDGASCwOBXZ9uNUBdxENvC9zgw6bXESoPyiWNc?=
 =?us-ascii?Q?tw+dFsJ97n6NZk6pzegkeiECkbRnDT1K0znk4DSScZfTcFx22f2sXD8zDNkj?=
 =?us-ascii?Q?VpEIsvQRe0f3oQ6B/VjsoCHuS28FLg76WIZTK7BZqEGhDExkiyPd73YEDkIa?=
 =?us-ascii?Q?EPinUPurndIVNCgJTb4rVq/jl5xTEp21p7dZK7RjhDZrBjcrExrshQ5dZFKt?=
 =?us-ascii?Q?vXn0oyAi/WhGH+9A/sHjpicVO1mmg1MOKwBXf/h+A3Kd4wQnr8u8ADci2Xtg?=
 =?us-ascii?Q?aFiKZK6dldpwoJJTfgRgyx4AP8EET1gQQt98BIzwL7CtVlbsmK8Mnv8/MPew?=
 =?us-ascii?Q?64O3wac6C748UEA67GZOeL02eYN/VzfO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WgkgGdWetCmkRYUawOJnjqDZ86SqKX5k151MgypzR7GWCrGc0jYfJmaYy+np?=
 =?us-ascii?Q?ex1y/09/1oeetcFttTsy5h36WK+C853YhymdVmSh7NLwaPhBPCasQiAYEh2N?=
 =?us-ascii?Q?BqpI+zeS6oSbj9O+pj0oyhDCTrvJb2MrKSvIORj3mo21OzGKFIlPPFh98OeB?=
 =?us-ascii?Q?i7CDbqM1mSgFfKV8y2zs9vv+IZ0NYHee3CK8mCw3b7kbelekaI1mW32Co2Th?=
 =?us-ascii?Q?qKnQjQSNuIYe2toFnqyQRuFlhrjfF8+PZV33YA43aDcnxKLZDV5OeM6BDYi8?=
 =?us-ascii?Q?xka2oQEwvLWpm5NIjY2uM28e2zHcx+BWJF9DMDJ1r7buyRdgoOEE57QpMnUo?=
 =?us-ascii?Q?aiJD3xnP99zJ+QCzg9CKA9G/wI/uGX0lrMXl/onpAYY8JdO9+tAAau+Uymu6?=
 =?us-ascii?Q?YLas3enFMlRi5FJHvVarGVeYW0D+uo8sT6X8gh+uX20IJ2thUkFmqNJhHW2j?=
 =?us-ascii?Q?mORD+//7mBExTEqbWT80r+L+F2teDlbgA2vr4EFiDR+O7tE+aADCfduqmGR4?=
 =?us-ascii?Q?K7gqJnKakuJ8lChNXVYgH3N7dFdqvz/R1S5nGwmKOqVe7dSb0t/MLwK0MG4d?=
 =?us-ascii?Q?WtVbi6tBn4mompkiXAay3mQp9oYRn9jIIjQ3xAcAcLkbt3t0dnlkWNircSud?=
 =?us-ascii?Q?i3oxeu9efIzxRRzuSEDNHdIXCSOL3DvLG9j3NQ58Gzoz6oOf9oAQkNMhuZw4?=
 =?us-ascii?Q?rNP1jTjNwTR/krXpwjir+BVOhvjkJEXossCXStECdZROJWj2F8KMdgW4fa1m?=
 =?us-ascii?Q?K1QCEuuToNH+/mQO+Vu15XXdQ543jn5Qjeh9b1IiGRcXbCpXhVTA730XgRnw?=
 =?us-ascii?Q?s0/bKvBOJQ4Rje7SNbvuVFIp0jGXIgoQW7cdCE2aEdewVJ8x+I8aWaWqDsA8?=
 =?us-ascii?Q?6BWkEh42GTzVaq3nGCRDC9sq0BbHX1hlUZj3U1EuWgiEY7Xaj1Rdlp0to6ON?=
 =?us-ascii?Q?dUMDYGHl1UpltS7Ax3kaWXoR03iysHmpfS9DgarODIhO905qW7Za0qKI9tg9?=
 =?us-ascii?Q?qgj3sevfcAs5fzxKL6Wq9mC7plcyahGRQWd2yAReP8uVfQNgonU6pNPlfCVc?=
 =?us-ascii?Q?CCSmzR281HOUUNdy3oDBr6e7yLTLN81xxJlyQOgyDt7nTc2jLmtmVGIeyGa7?=
 =?us-ascii?Q?bpFZALValzaz61phavLkVK9DaMoohoa8Vvp+h4QyOECq+1fjkN0z9OX1IrTt?=
 =?us-ascii?Q?vMUkmt8EW0ilUGt8XkRDJ1GkajglYGUnNW/Cdl19o4dEZOpAwxLMgcDSMRsQ?=
 =?us-ascii?Q?29pP1lJl+TSuRBdD6HtTQd8C2IdVtXKdR6rAXDkZnEPtaIIXNDKjITzU/mtT?=
 =?us-ascii?Q?hXc8uWyVXqwd9Arnyt8CZQYhYA7A5sMkoRW6iYzcaDlJ5f6gGp+V4MUa5/T9?=
 =?us-ascii?Q?zQIS5695r0NMmVYXyc83adt4i1jmTnLm6pdPzCQgTF2D6HRvKUwyCKQc/oPW?=
 =?us-ascii?Q?vYUAyXsYRzxkVjQ2WFoDOfkgM6wias66V9KRgKhHkl+1OrJnBopqB39ZPJ4b?=
 =?us-ascii?Q?1HgMsJiKb4WwQjwldh6QYuXN81bjW1vIATl7HyulzSIHhjG8cHxpbq1q/ZUN?=
 =?us-ascii?Q?dbF1Ul36/skMfdzDO50wp8Qs65HWfh/yfq8OKu0og5iK2QDV82X6FX853T7Q?=
 =?us-ascii?Q?f2v86osn0pgVH44hWiwhipM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9e8ce2-fca7-4681-563e-08dd5605d3d8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:35:18.6678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GdhUt95oOVxCpiWFkbyNoAZWazQOJ46IIdffhyDsvDmh/DSGvPid9AHrKvRlwZJbzRQ9EX48DI1x0N0Ox9MYtro4xrlhlX8ZjvAx68GkHQTRzIGjs2EO3IN9a8y8B2V8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8903.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index c643b5377d3a..03902909f27e 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1229,15 +1229,15 @@ static int wm8903_set_dai_fmt(struct snd_soc_dai *codec_dai,
 		  WM8903_AIF_LRCLK_INV | WM8903_AIF_BCLK_INV);
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		aif1 |= WM8903_LRCLK_DIR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		aif1 |= WM8903_LRCLK_DIR | WM8903_BCLK_DIR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		aif1 |= WM8903_BCLK_DIR;
 		break;
 	default:
-- 
2.43.0

