Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011064.outbound.protection.outlook.com [52.101.125.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0588418A92D
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533497; cv=fail; b=rrZ0TW+1o8POOBN1tarwqMRT5b5wKsugo3Q8xK56RESHGTUhRsqEQjK5T8xcjaA+pIyxKtfe1KpTkKYSlIcFxblo1w0kNkG3XDKG1IPtzD8tt05Ht/j0pUlwDBhvExHTfD8IDn7fYXntYAswFsn2zuFYDnejXjMbAc7KDyuFNnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533497; c=relaxed/simple;
	bh=VrdgRXQKISH9yN7QanQMA6EuYRqVolBvkD/ZUE1eNsk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=CNaJnxfwEdOWl63x6qlIuPUmyjLScdovPVP1GGkaIQrd0BqeND0d6WBqBGE/TicghTzh8gvJ7C+/uZoYqAqhPmxF38Xghm9nfPKwIH8MA0XR6dpKMXj9HVSav2BblEmZtugSKIgHle/XUpEgdO9DuCV2Jx775PBNljX45Q7otZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=K3FFOzrO; arc=fail smtp.client-ip=52.101.125.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="K3FFOzrO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3pKevlfzGmIM3dG5q6jrLbRgYM5xCa7oXWenzSwUO7It59Irhf+aVZyNwsuGkGvwmd6cAMx8NsqdNZUxSGn2wYHour16clm7dAa6aEvdEXZliRpNSp85i8QSh5REueNZcKPIisFv/DZMdvuBxSsYAsHawVQ14CqzCF0iSfHUkfCLck3L9AGunmnZgAEmWN64uSiOpG4I6a57//U+32KSsiKY/Jw7io2LKW6kGLbwPXPkH7P4iUS9uKcfHRUv786sso90OaqR7D5lv5DdC1OfD3ynWqgDjW+0bar/xuDwZ/AUXSYV8eI973oGtxZq1eFW6pq3LKEFy12vmApbs+5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yun2pggPzEtOtYKyJKnuBWobmk3hFrc5i3JsfGt1BAo=;
 b=Z+Iswm+0AXcbSXjJbqpO+uubLTlDivkmRF300SAERqo1W1Y9XIbTDK+dN6r3PYJWecIyKKfbSwSuyx22NHSUaWeNzFPLZFy/UHY3Pfcr2FUaXKE5fEhYbBYEyUqRq/TO0FbvKPWqrpATOBFxervajegq/iPTp41D8X0hd7uKrYUUmZDQt4Qbr8wyxUOv1Se/b5jWRKvQeSAh1FhiBGbF26NvxXyWL+4F9rI1lCxMeHPeuUEpSqcCpeA4AFHpvwDCmgSZKaOaFIoFU/8x6onT+cnPwP7c6tmAbTXzZoBklQlfNniAHErSaewpo4B75IcYAvGWJ9qWHAnvsxQ4MzbBXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yun2pggPzEtOtYKyJKnuBWobmk3hFrc5i3JsfGt1BAo=;
 b=K3FFOzrOYfc+0TDsLLyGuvFl4LWruVCzDhnwWA/eyPjLPQRCGWcbO5EW63eNj84sFjMAgL/BDnxij9E6h7fiCEoaJEZpjgMDaLF1xP/KJmTDsq2ba8/E1CWql7Q4Bt9h6+vZMmHAUVXuRNsOZrxdvkc59zl0LZkJFAkodEn029s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14997.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:31:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:31:33 +0000
Message-ID: <87ikoxfq4r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 023/157] ASoC: codec: cs35l34: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:31:33 +0000
X-ClientProxiedBy: TYCP286CA0229.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14997:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ac5a4e-98ba-490b-afcb-08dd56054d7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NMapBwnPQlRakZONhnUx7FWm6PtVC5I7hlZOtl7ZTXRPzbsoy0wHpUyHpxly?=
 =?us-ascii?Q?DiMKEru5zyf6phS49e4Lz6+7waXWXL6cUAogE2tRMYzGSPbaO9HYtLC8IBKs?=
 =?us-ascii?Q?hRxVOZ/L1gAQBTDs/RGFuQSZVdnobZdkmFMddXNV0Mj68Q9v1tKOvOrSTIT8?=
 =?us-ascii?Q?JPQRl+Rhrxvr0jqzdFIYFNAM25EZu+QS0JR+Ftvp5tvveV8LyEGZeZXtrI0R?=
 =?us-ascii?Q?WnataybIlHYNHtbAOCXrmPJVNuCfS/2Hxa/sqQ/htZV2PtwmSowfPgD007Kp?=
 =?us-ascii?Q?CGD2CFBixfZ2tVjWWj2nOtNrCtmHp8wMBx2ilatp90uhsYbGrYgRj/HYUwRl?=
 =?us-ascii?Q?WbwWkryGZD8CoUHualxxPCohzMWaCqCiaeCUhYJ7wpXK0BcPsbyHZhGr7YfP?=
 =?us-ascii?Q?eT4LRpHvLiHtb1pUz99aK7tnTGCY2/0GxC00gqG+Mbd6P8hgGc3JQlCr8EfL?=
 =?us-ascii?Q?sIFguT1gLxno/gi61iBabDRC6tG56T0gTpxPBsDDbLLxMnAkcSlEogf9SCQa?=
 =?us-ascii?Q?5uivXNkbyQvG59zymzn8gwQEVU0alcGtuoUpzI60b7uPN+3kmf6/eX7c+80o?=
 =?us-ascii?Q?ybPjQFzN++P/ZjrSUDjjwcPBlWj6oVOpf7wakadUTUXmpTagnW7qHQuOKzVb?=
 =?us-ascii?Q?0vQYZZIPngK+vdkS86acER2eLoITh0mwtSZaAU/5l+bs+eslhuBj51DICXzz?=
 =?us-ascii?Q?QHIXejlHDu8xg55IvhVlYopg5ADd7neKKo/cvqnqkbdp6xrURjnJqwImAHLN?=
 =?us-ascii?Q?c/FofhbqJ2U50gMuXWy9VDqbZJu/Y7g70Nj1TiTsND4y2xAfiRdfcSrU0KwR?=
 =?us-ascii?Q?nqpWzdf9E164tv2xEhciKXyPf91qTHZQvNdDZ+C/VPNOMLwgM5ceZLfKA5He?=
 =?us-ascii?Q?P/aT4DmCQ0csTbAEgvG8nZeprJNuHbin+ULPwB4T3r5FfvMx4Iy61TIUtOY0?=
 =?us-ascii?Q?gcJfT33RBA24YKhL7/4uSmIxGHLbt8+7qHIz3lLoxkV7YSxmdfd5kCE2rZLl?=
 =?us-ascii?Q?b1qkpOxVaGElHkYPTCHBYASfZqYOM5PqME+9UkSp+n/sI1w9UoPr50gsz/aI?=
 =?us-ascii?Q?kYAUtskdTQMRtRtJsh1zrFmOYbsCv+nJR5rGYKnJ/a09gCLBunPZUvZQPA37?=
 =?us-ascii?Q?dp/sosWMNovf2jBC3QOZgNQbMjRohvca+dsEbS/rmJFDSVFUc7upIu7/xlM1?=
 =?us-ascii?Q?A8+zjf//6RT8yMjbNJdrp4atUzKSLagk9IwujDSMZl5eTxO53v/1Qr1S3Vy5?=
 =?us-ascii?Q?SdSaFuo0ed3iyt7TzaoAkzQZDAvbcJq/WQWgy54Z8cACTaVVqOn/MzafxGlj?=
 =?us-ascii?Q?UZdnIq2KB4JGOYp6HDISnPbiOQRojAmDNBR9vgKQSPBovyysgcj4RvqpcKmf?=
 =?us-ascii?Q?0GJmlDKp/ndJ2v1WxIydp/n4aLIFmatYyEVVB3F3MzBFyTMbDnIxguZPaPj+?=
 =?us-ascii?Q?T4Tumhqy3wSAyT4BN779LEecaKyU85lR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k+flfXRay4bomArrSYEvuPkT5xBK0VX3/zZ+wBkeC+ReUaC+I5SiNfgHB6PH?=
 =?us-ascii?Q?Fcsxf6rxHZl7Id1i9wWGPy3Hv5oXN4dXEJyUVbWjnOLy03ANC0BTeY4ag+Uf?=
 =?us-ascii?Q?76gO9Klx3YCnQ/JC5OPdrQvyIq1gzWN91eq/IRSiroJLgO1sJSk1WelrVGm4?=
 =?us-ascii?Q?/u9bTtpTAwyYQzeDWy+d0ofV5EOuqn7/bUpF7CRXxfIbZMzS4WIpwroXk/AZ?=
 =?us-ascii?Q?k/KbWsgTCWXrjbmvhvFzIPAmP6pq7STYvDftSOkCHtFq20WNmGBv16JBkXx8?=
 =?us-ascii?Q?uaCPPq3pDg5CVuwetugxnRRs6fHhH3PTlq+H9H9GzFJ3bUhYEiPj193iphmR?=
 =?us-ascii?Q?w9jA6aAMuyNqOOw5XcxqRsAe/ed2coNcKHX4noLgdGbIrqYKysXBhWsK30wb?=
 =?us-ascii?Q?wR38fjJOstXJfM4Z+104BrQ0fnkHZJ00rk61rocPB7+Lwdxf/KuGja0NdJU2?=
 =?us-ascii?Q?/cA0QFOpm6jEScBWBQr3qdsB7piy61qYE8BNCs1pbEHYz/q3PC1gtG/DxO2m?=
 =?us-ascii?Q?ZRT3AXSzeWHfWDCDOgoDC4anwDtUawt6RzPOVM9TXrPNyfQUL299/ABjoiLo?=
 =?us-ascii?Q?C1AEEIh8FwWTo30AsCKoVFDNFcMIkhFRaxRmfrPsWbm30k/vBivoLZztA67I?=
 =?us-ascii?Q?G/72xt7j2UsNiZ0LbTTkjfyiihUQIzlaqyJsuzUlog1bOccNfFLxktcRbHRw?=
 =?us-ascii?Q?VOhEtzF+MQDkwLwWWwiY0ure6lQ+v66A/aDnanKtKcONPpME6xVZrZQIH6zK?=
 =?us-ascii?Q?KNKD+8PhU74s9MGRmZH+7mcC8amN72d8PJDt9IA4fzok1hO8nkqLfBn23yUP?=
 =?us-ascii?Q?/r8O5bVNkNN6ryEIhHOgLJ23FDljV9N6jccJh9WWrO23GQFSloOWclm+/9ks?=
 =?us-ascii?Q?AvHNpD4S/qlVTa/Ih3HL9VBNZOp2B07gk8CGPHzr9AlIvQeFx+Rk19msLyYS?=
 =?us-ascii?Q?dOVI2HzmPK/0h6nVGeBf6uYVtIXPag3HxorNXhSgkgT8Mm0pD8T1dypnOnKn?=
 =?us-ascii?Q?2EM3W+za2jM0AF7AtZjwwWhHu4NWE6CvZqCL+fZ/E1DV+0olEg+YHhZUR2bb?=
 =?us-ascii?Q?gBY6HH1m07yybEGhHPON5VD+FDZHFA68pQupR2xkdOcz+Gkm+xyB2lun127j?=
 =?us-ascii?Q?ecWzPbvMKP5hpFDLUNwhqEEpftY9O7QTZ2YB9boKjagIKTreS/gCskcx+fDw?=
 =?us-ascii?Q?TQq6voUYEP+gOg8NoQ0PgHnpPXDfORCR9hmVhzmn7HcGk2k+IOlqm35nDdsx?=
 =?us-ascii?Q?cxKVpYkEg3Nnb/yN6Rzopwyr0HUdKQwArurHEkKJIPee85bTzQVEmNMJOWzO?=
 =?us-ascii?Q?W6tT2rbfywfQtNxtynKFi46UzzKbPiE7I8pdVKjO3YVUtM9cOKbrJ02YJsOD?=
 =?us-ascii?Q?zME1U716/IgUEmcP1TcR9Ke0nsANwFQWWFDwK3BehMHQqARAdlQSU4QZcUTZ?=
 =?us-ascii?Q?CxNYCOecSmVpUCYD1ierrmLqwAbx5mI4SzupI+Etq1BK5+LYm7fyYEBTOHl3?=
 =?us-ascii?Q?9cqIpYQwLx6kLT9fT2wkxZEhnXNx9Xk42w+enDZe6dXDxilHS82tRHW/RZmq?=
 =?us-ascii?Q?rd3HL5JezIis2Ixk896V5sCkNnPQdRXZtB/QEKuVocTS/xv6JsCDNYYno6P8?=
 =?us-ascii?Q?I2q0ok3s2UdA0O8sFKKID8g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ac5a4e-98ba-490b-afcb-08dd56054d7b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:31:33.2711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2EdcX3/tdP1hY44b4jH6aePuN/tIHgcqtk6bYYp0YhRjMqsgl5FO4M/0wBe7/U08Sc0m2LnorFqcl6DVP0wuhc7mk3twgxeYUgbQWXkkAVfxi0FJyyHRVytsvEnFpHN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs35l34.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index 287b27476a10..6d098bfd38f6 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -523,11 +523,11 @@ static int cs35l34_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	struct cs35l34_private *priv = snd_soc_component_get_drvdata(component);
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		regmap_update_bits(priv->regmap, CS35L34_ADSP_CLK_CTL,
 				    0x80, 0x80);
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		regmap_update_bits(priv->regmap, CS35L34_ADSP_CLK_CTL,
 				    0x80, 0x00);
 		break;
-- 
2.43.0

