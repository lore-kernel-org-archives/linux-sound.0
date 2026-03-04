Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D49A37F8CD
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605451; cv=fail; b=A8OA4gnKylTd4o8phTBIb8wRSJiyw7QY5Uhx5dBwoUAI+cYOvtfTZd8gCQswHiHNfmt9pRbm/Ygw33cwJCaC54nfYZfIa2c3dtLvr5fkYRF8mL1NHf2VejpCNHCAckhZXp2UwH3UJv7kCQtmoE6xjqDHagF1gMabibCLCvsf+Wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605451; c=relaxed/simple;
	bh=iXOTymJt3IZGZr+ip2jkDlMK+Hk4msybL+NSOvHXMkg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Wc5TEl5GY4NLQ9e9FgY046TY2Bp20Gu7De2qcHK+6YWbo4HNvUCcJeGkcnRKjPB1PlUZT8W1EbWPWPLZygReI/b2xXagufYnGZLOIBYt41ZymPckg+m9hfN1Q0oiCT0unG0U0mrCmdTnlOIcCsT9YARytUHMw/Qo0konntuSNw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VYRQ8NKM; arc=fail smtp.client-ip=52.101.228.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VYRQ8NKM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFOv0ila2lBIiDZLI6j+7Ob9P68JHzSKTdoyEQ+xpY9g24z/QIVYTgVUd7LUbNyBfn2dueHsCPMklpT9/eIh20WKJCqIhUN/PNJ4Tw9lvwyqYAbC9YMnd66cI5aMMJ0qOX4xP/R0tyRsZ0oOSdJguYQUnEusRt6rLuT42kVCFqcn8EaXV/Xj3uzhNNr/tDGfQ4pALUSyKQGV+61Xa9ZOMK8DIdIK92HOnP513HNidEdGNtYZSB8qN262j3LlV53BU/O6uitJxvUv3qOe+1P9huUxxjyP1dohm1dGnA/uXGL8PzvunrJ43Cp4/tzPEsszIN0Dv4vnLghPPWMx5DAsRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDv9B+V09dduJ9L2UJPPq7CHJ6AQUqEiR3icRNji7ug=;
 b=MzoAXpn+Xks8Ccj8KpPwRPk+BlLBK3Y+aYohTp31TxNvG/rsxudi0VzeF829sQr12xlKiW6TEHScU5oVSnoWWESgiOBKCDypusAtHnhuLsErYxidJuTd23Ct+BxASw6ybtL4l8Mshk2SHVEtMl/jrAkhVlqXvIdgkuu4Vm5PdCMelctUGcyc8fCgeTZN4Ntq/XMQi4ypkfka7YVAmZFc9cwlGUkLpBBDoj5x4gBmvhhCcZx71ATMEfS+W7X9s9soq1tsbgTI0Vy3Swkj+cHuegBAND7xDBq8RGCllYD5fGKLBkp8yeDYGp7ef6oHQF/d6hvSlwK0Jflr5hMsr+b0yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDv9B+V09dduJ9L2UJPPq7CHJ6AQUqEiR3icRNji7ug=;
 b=VYRQ8NKMviBimGYsxDCi/SKyyHQX3rQruSmRn240sfiucE2RKDJnM3dbIQWokV4OuvwcAJdzK3STKTxonv+6Cft895QtI/taOBa0j/UkyIzhxqkvDDLFWQM6Eieh8OFEDAtDN4fOwfL6KFOvsSfCgTZBv3ppwoXjRouTPKl3O2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB17519.jpnprd01.prod.outlook.com (2603:1096:604:44b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 06:24:07 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:24:07 +0000
Message-ID: <87tsuwnmd5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 26/29] ASoC: uniphier: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:24:06 +0000
X-ClientProxiedBy: TY4P301CA0034.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::11) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB17519:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b7e084-5ad5-4142-e87d-08de79b6a3a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	nqZvdPYtChbGLCVtGS6enNdjeM7BZD9PdLMhSNgg0pv7sTQuE7/IM5WTAl6Re7g9nWYuFykoTtf+dxAlLYbpLjUWbJLthg9/uKB9fr+o9sKfk1WoOJkNuUzwIRBbJShh9xHxnK8MJ3gWZSN9ncpDFIJsqBT6WljcT1NQ5MyDMfDMHF7w4jutfy/3K0/QEb3u01Xyta+gvOsC+D0PWkUCOL65qcMnAMCQtiqweeQZx5CSW7G+DLJrxKNEsAGSG6MenRNvmZSkJr0ivPi4TbTKQqinRicWgCI5ut6Pe/Jfx781iasUBIbXldMlbLc1LHdEgIAXktvbTfn6joH2k2AklAmo5y2DNkBfGdLPYdkes3n4vN34NYrjzq03LrBig8OKHOmp2JfbVk7wCcC/UjS29cf7geu0CmzKUvMBb9IcavkY/KgXgFt+aTrlM39524lUZMbrbtKpYl1WsBCmeMePLwg8t4FRkjDysLdIsha29B0+wPk+bWEesYCkKW279qEUYg9gczFIEvDVYP83TErNzTGVdYwJVd6GG762R+Y66PDIzmaDDZNpllyTRbt1I7DDg5/KoLFRz74NSrXGF2EO8Nha5ECIA8tSzHWob9E1/8TiJVDZddo4XRyr9b6aE4wLO84lAOrLDLVj9se4X+iTArczJdzQo9OEZPvPxTnwHYZ2Eakbihu7SBwqXH+lrV9g2lg5XT4PSXNuA1/3zFMUuPnwH25uCvHUIQPhaSzNbwExnDU7WrJAD+cQ/T3T6XdGmA9pBsgE4qAP9slVGvRWb9czPq2udqcqm39LgKziMNc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1k7rvEweR0nXdJ+b12erwpgzylQhgxj0wAD4UHY//x7ogHEoQGiNGx7JSqHG?=
 =?us-ascii?Q?C8N4WtXI37UltP1TYqdbaiwbqXMQbw3Lh27nt36f/LItYjsJKzcolp3aif1o?=
 =?us-ascii?Q?PX5e+/PrhjaEsyXqUoddcIWNqBYstI3u8TQ04FxujuCeGPtlOUPA4+N9wvGF?=
 =?us-ascii?Q?/rO2Te0zv8nbBSZQCFhO9xMHibM+BQheQ/J0OthnQ/L/wfaDtNVDFYiIF6sv?=
 =?us-ascii?Q?n0QBAJ5NNo/8bGOtS3/igskkW7zFp78VLZ/ZbNYTTuMGLsWyk0f4BsmTO4He?=
 =?us-ascii?Q?UNHQJDW1oBfKqtHz4J1rpC0+qrQBBb74bQHZlZu5bGrvkSLGxEe+QmFINChg?=
 =?us-ascii?Q?xv10jDuo6BEbkXQ2M5i3VJj7MA4OwpH/IdogTNFASalf15ykgboiJGCY9WqJ?=
 =?us-ascii?Q?smiATZrFzlfkh6CuaXVJVDtcpF8AHfvfY+aMFKjItFkxma1WPKlng1qQtfF+?=
 =?us-ascii?Q?pLBRtSD9qX/pGD6aAygqy0Rd7eTmBJs0ZG+mmDSXOyAN2LTaxtXZ/px6TrZH?=
 =?us-ascii?Q?Q3GVwNwyjPmsAbHI5C3ctg+ZNwqRA2libQwB1jypCAS8k60Urh9XL1Meur7P?=
 =?us-ascii?Q?EX6pnsbI5viUzacEc3+niUBkcvPFZfgaQSwrj/oBbo1arzuQfYKNGDmVxgWK?=
 =?us-ascii?Q?QApQbdrfgPGl78TXR1uSN6U+kw2ZV2MxCJ6ENKfkF1MtDnit4576HNq9PcwN?=
 =?us-ascii?Q?2EBELh6nwIK3gmyF/E8rJCPS7eT7d34aHodfaYZrVPftnTGOs8xuVKDumZqg?=
 =?us-ascii?Q?4P0Fn8YC2YW/Re34qCulA+5udHTQ2KCZDNA8meRn2aiV9zX5fd3lB/CVzQu0?=
 =?us-ascii?Q?hkQXEYyH/EBUSO9KkGVruHYaAQc5L+jmb+GfZ+LqDonmcs9WclAxj/b1ZW3x?=
 =?us-ascii?Q?PiYoSLJM/94MYNMzGrMJPDR8jY9wK2yHi/cWQd0Y3kJEw+/H5Nm+fB6WXG7b?=
 =?us-ascii?Q?gROF0nkA7TIRKnrRy6QgfN+buTSN6m8rpN369wo2Eb6ds+0AV37Idf9Kmo2i?=
 =?us-ascii?Q?i7mRcaqNPEDV8fwiFttVxbohjLaJkb+GG6ubQxVh04fRUEFmaiNMCfOfpZ6F?=
 =?us-ascii?Q?D1BdspSZJvgoSvCuv+So0eR8VVCoDLNKhsZKsd3RgqgmN65c3tzf18KVuC28?=
 =?us-ascii?Q?+do4u9pO5YJ1wynUGsTZgsisnjOc98MMIeNHoPIhqv90b8pIHAZSb/TvJJVm?=
 =?us-ascii?Q?SS8hkOh/kKE24LpNnqJWR/onGbbm7nLEpxZhNSVISWsDTL6tFKfIETKw2fU2?=
 =?us-ascii?Q?GluY1tg5KWUBCsTbSQ+sE9ePxDjTnzaSylF5ub44fn4oQ8rN/sHWkkGATrH8?=
 =?us-ascii?Q?3WHp6B29qVEm5KfGRLAFleIl6zrQBqnITNzCIM/1c4qb/AoMnkZfWat3ZjsF?=
 =?us-ascii?Q?a5tNR694T0X6ifFSB2C8DDnmkhRr1OFO1FBAvqRIvu/PgLF7Nle4qPxJQE3w?=
 =?us-ascii?Q?96Bdg3CMwyf+RpOCYvuUF+Y/Y/SGgE5zTR8EJj+uyhaTJoiK+QPH7rtP4FdB?=
 =?us-ascii?Q?19wE/O9+O7agV/0y8z/O2kyKYuYDhILuocF3QdjEMeXqRLptag95kUSkrG+W?=
 =?us-ascii?Q?/stA3huN6cXTSK9Dd1PTVEK8Zoxrw1ND60cxGvahL5/TCvuET+iu/n5apHUd?=
 =?us-ascii?Q?wasflFKNbNCK4XY7kg1V3HVQAY5801rINHLLn9guka8XP4qo1cA5tCZthENh?=
 =?us-ascii?Q?f+z2NXG7gvZWHHs59SKMGSqd/S17cqds/VFzSM9tFVh99pEwHUqOWTHQPFT0?=
 =?us-ascii?Q?c16zHSbunaI5aI9htXl/HI7SAyKXcxIboGw7R29V/8WHA7BAse+Q?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b7e084-5ad5-4142-e87d-08de79b6a3a8
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:24:07.0881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xxVFszjWLGUW5h2fqrIzCw2PsGGvRv9RXarpdtagbCY7o70GTyzizlkseO5S7+kXsWdRY/5NOJ73vgGuBYQV04QRX+oNnSyqjtkJHbyTGZS2j1Vc45jJDpMMivhCd5w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17519

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/uniphier/aio-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/uniphier/aio-dma.c b/sound/soc/uniphier/aio-dma.c
index 265d61723e99a..c1ca559971037 100644
--- a/sound/soc/uniphier/aio-dma.c
+++ b/sound/soc/uniphier/aio-dma.c
@@ -226,7 +226,7 @@ static const struct snd_soc_component_driver uniphier_soc_platform = {
 	.trigger	= uniphier_aiodma_trigger,
 	.pointer	= uniphier_aiodma_pointer,
 	.mmap		= uniphier_aiodma_mmap,
-	.pcm_construct	= uniphier_aiodma_new,
+	.pcm_new	= uniphier_aiodma_new,
 	.compress_ops	= &uniphier_aio_compress_ops,
 };
 
-- 
2.43.0

