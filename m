Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9268B1922E6
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533714; cv=fail; b=DAVc7fY+fA/n/St5ll0JBVOD9jd/SFJjwQOvhiYeZaRkY49mpOjnv5/GkbOr0TmWeyITRs5LS9/T7lbEJE/i91q7LtMQGKGBfjJHYaAA22zzTaq/38mNuwv++ycA+h5JtDbZyOKQQpfUaI13ZokK9/eBzrcoMbA9AG5RwqB6gYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533714; c=relaxed/simple;
	bh=EvGV0iA6P0QLUaSXHCaF2TYGP/+zbGSqixX985JiWWI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=je/U1Wguwh/W6wRpR1NUhr6Iip5nU57WuMZmCA/P2Xn5FNGKG4010YpzOzAv4XwNL7g9Rn/SWKkwAX1YAk9FKaeh0GzBJXnKmwC/ruzJGPdU4A2P15tkDfwVAGoWqfklK7H89xAd86BaZ8F7wYPgBrrlwCUNBYw/qnhLgEdZ/HI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jHlvxS9S; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jHlvxS9S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qq4UrgdXeY7vDHUmPhD8d/s1BxLdWWhyM+qaAj5kKvzBYtUI3/uVD73FotYLW/LckY16neYxCHss6a4pBIdUPZ3goIseIcqdGB5x+KPsPlvZmE7RnWc3FpeInP+nx1go12PNxxACZqKzzPOqER/UYcsUsFYUgwLEyiqpAtxS8Xtr/+csXmZ47bCGWfUO4yQqgOuA+W0lEsBwaKMDnnCcbnWTm4PgGHGhBBDMRvqKuHq6SS/gDc+5a3bHFDoOqxJROs0OelUIgMWtBemM0dNOXjXrDfEyMbTW0GsHyckg+v674l1KnLpFq1qgHvdcNfhg7Nf01xk3JFFeIIa2KhYguQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0UCezw4IIOx7Gac9YzO9D/SPNLPrOBuwDIAf4d3Vd0=;
 b=Aqjl2Qzm9uAIOiqmtoPVa6fGMksu/nUdM6LhGZIUnX4neUIq41VDz/qger5tpqK4VAsWu1jH6XRdt0h0NDlZeQuXk1lolqMNy7XaIAvXPReREtaLAvj3PWUvy2X+JUn0NWszXD2GNda917UXUIwoVOavoaFO445H3ddJ9truqeJmhzPuPGWF+Jh1zN53/dRgIDGwH863IZu66VS+lu7+L3mJF9R6lwN+DeiGOrZEofxxfy0nkTUGsShS3YXK8+rfffKCySV79NM7ADcB4LBLhbrH9V6h3zUyz049Kg3dtj1KWojDMqxtmAUzMd83pf9CzjDphQ+Q0yBfSN32/et2jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0UCezw4IIOx7Gac9YzO9D/SPNLPrOBuwDIAf4d3Vd0=;
 b=jHlvxS9SlAkrJVIUd6RBcLxUOKe8KdpRWqzl3UIvCQLiM++EpBRTwxWWOjUpCPhIfPe7MqrsQS6EsRt7g3Zn48RhRSAGJf38g7aySLXIilRs2NJQeL7BSOpM9u0b6FjjarHn3bVI1LOW+BBH3P1k7e+2osqA0UDUeT4MsrglKDE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8745.jpnprd01.prod.outlook.com
 (2603:1096:604:151::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Wed, 26 Feb
 2025 01:35:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:35:10 +0000
Message-ID: <877c5dcwtu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 081/157] ASoC: codec: wm8804: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:35:10 +0000
X-ClientProxiedBy: TYAPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:404:28::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: fb7dfc48-b195-4403-c6cb-08dd5605cece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PKzqYMPuEywxAoTz08C/hxISOJjcj3RL0KmV47Ifcn95CVSbQl2AvXLEVYgm?=
 =?us-ascii?Q?fu/oGhxtFC7/je/t6n9tr7NRqSqFAf2I+ln0WQwhQVA1tchC7cLyw3zfAsbv?=
 =?us-ascii?Q?jzTHehQosdmqQl7/5VAleNT6mO+gWy2oZNyhebAAwougyBkQJ0D2zv1LhKSb?=
 =?us-ascii?Q?Nz2wfFoGk6SuVMibYG9nISUIEo8HpTTEIxmQBHqRXIWG09iaoFrmwdFRc5Xj?=
 =?us-ascii?Q?//c7k6P1VJhImUQLvhPdO2+SEedJkPdOLsaEpP10ZjVJggRt5CTUNR0fnXmv?=
 =?us-ascii?Q?QqLQfsSwN/TccEM1hZTS9qj8nvXjtaTZ8eliYAs/YlN02tkt7ZzPnicEKDHO?=
 =?us-ascii?Q?W2x1lxurOIrf9NUNCcOepEilSl6NXVX5d8WxgkXXJQBwj6bG7c9/0vVFD/P7?=
 =?us-ascii?Q?2H2brnIba1TQ26UNUN2Zk4KQb6fA9a05Ry1IdJiTpTvXyc3yqStU1o8kDPH/?=
 =?us-ascii?Q?5vlTmfDrI8bB6diMri2QxtNpsx7hRLgWuEd+GrVFQX60BKtWmXxF/tFbC5kJ?=
 =?us-ascii?Q?dExMwVPoq8Jcd7d4gsXFf7Fj34yCY6ILy4xzbS3vcwFnlSiGCV6Suynnoklp?=
 =?us-ascii?Q?kBle/hyujJDCNjIHeDRloEd0Is9fQ5A7JO8kBJSYEnVlgleuCUaSZvfuClM9?=
 =?us-ascii?Q?g3VH3ap3rb6vE/IMnYA3NLjKKxu157AJpTDExqd3Ys+HKDtU0yfS56AMRbTZ?=
 =?us-ascii?Q?mhNfg33YbAdcXAbuNpthnu4S81m+C/KkDuZE2AINQwSV9fD//DimH2v9gnv2?=
 =?us-ascii?Q?22GiNXDqETtm68Ra6hOU46wVBFJBYE5JqZ8jS6of43wNrC5kuhLOtPlswrjU?=
 =?us-ascii?Q?cnmm3VCPND0rKLOyj6BLZ3/lamBb511L1nam753ljLvFK2ZGm9AFf8P6+t2w?=
 =?us-ascii?Q?+EczYKWVYt1HzR5Vby2TV7QGYXl2c66vyvAHnYXik/xKQDrgesc9i79sd6SI?=
 =?us-ascii?Q?SvMv6t2guoGCqmaPLwDXGgpuKFq2yPpkAJTUE82qZXs1IlFXVXU8BGW041nm?=
 =?us-ascii?Q?298BLMkHnu0NT3gNAk3BRKqDPleo75cYhI9H2Fh4Zgvp6wnQcWUEqvr+R8yC?=
 =?us-ascii?Q?tcoYP4u6P2rxZptfr9YbhNoPPYTEe93xMBTR94i1AAzRu29wrTqwZ5zXXsIq?=
 =?us-ascii?Q?Mq3MKmHQq7Hs2GBEjyn9DnNZAL3sUscF49DPaOS2AEeo4tIRHskwYqnjdYrI?=
 =?us-ascii?Q?UxzLQyc73tFo3AhYW+BZB3Fk4JE8c86xKQ07VLBa9zlS4yo7LtvsQXX/6kEn?=
 =?us-ascii?Q?125knzVUN/947WoLyj+x0m639aYgVzY1T9HtMkvDrcUkLOSuMrkGmYmIZr59?=
 =?us-ascii?Q?Ut+q6Oh6kM00v5nYH7c+Wl7Cb4vCHvkTSuL7t7uP+Z0r97vpKWmKU7wYW68k?=
 =?us-ascii?Q?x134dEev8GU5qhJ8cMUpsd1rVy0kcmKmDIGfXfoU7scXSXWYGsKtuvf62zO7?=
 =?us-ascii?Q?YGcUVUd3zFxafCYUm5KaXVu2UG/b4VS0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9mbPbgselinzGvHd35BGMBlZokaeVz/Zd8AjggR5TNUTcxc1HZKVzgDhKr2Q?=
 =?us-ascii?Q?BKS2OhOujozBurcQr9Ih6wrMk+xRDss0ZqQrXOaZr4odDF6uAqmxtlm4/Wkw?=
 =?us-ascii?Q?1aAo7clv9zIr3Z0j3kVNikSr3XsdRR+/ZPdMzchRN4O/xeTuCoi3kFChMERo?=
 =?us-ascii?Q?i/A0RcJ66lPfLjKH0btl75KIYD0kyvkdnAx5IuMJMz3JO13nLKd0LtmJI0e/?=
 =?us-ascii?Q?je16UxUpfwPcZLGP3pe6m7BQ0P07AYejwU3f2XaFbNBoRUyg6amHGNjjZLzg?=
 =?us-ascii?Q?8S64JZg1LS6nOeZQJnEvtI5qX0/RO2zAl5VfWMfy/YcRfim7zrGeEzy5uiXM?=
 =?us-ascii?Q?Z55/8/anCwToj2dlBpIA3ZXc7qwFQC23MtToxGRUhxwmtoVTIvrHQVcXOUfa?=
 =?us-ascii?Q?1lkfoOZcvmGfFRiZWVuNpt3BaNMIPG/H1ZwPc8Pd2MOoeybk89Q7dNb/goIX?=
 =?us-ascii?Q?xeZIjgpxHpJgd6a81iSHA5LAnMmtFGMLJ3NQa6//L548K8ltbPFA4UrhuNZV?=
 =?us-ascii?Q?pZLzV6qnKfMDpYXBYzSoahN0tm4VZP9DS5sw/NpNZUPZmAuftFrIajfYDuVI?=
 =?us-ascii?Q?kkAkRAB9Yj90XlZddh6jiTM85J+4CRRomhBgklgNiRPG7en1oWG1tRB53Cmk?=
 =?us-ascii?Q?pWqtFA3utqdWTdztWJloJKW7m0evXD8ApzkBk+APX1EfZi/oQT8aR7KrZnal?=
 =?us-ascii?Q?RUXQvePYx/ATxzMHE0hyRa18y1WgL+G3lrEdDn/45G02xzOgrC17xQA7GFL6?=
 =?us-ascii?Q?Y+VUSkg+3Xd3FEcGTbwyG6G+qJH9lxWqf6+BrBV5WLc/p6fNYu3s3mrCplVZ?=
 =?us-ascii?Q?VeCl5cX1qJ1+zhJNCT4wf1GRw3qHIJ29kt3hRX/sVv5zVQAD4tl4j7IRO3L6?=
 =?us-ascii?Q?vFAtvRvhwwkz5XArN/VfOj0JkMe2lmuIWD1/UHNBQAXN46c73Gm0TXYz2yH2?=
 =?us-ascii?Q?qYImY9wRlNtbtFPV/vB0z9iI+8Y9PzeQwZfc0xCxlJhrg0XLD/+MuRASaMAH?=
 =?us-ascii?Q?TtluCXmMtaOoUE35KzQt4F13t5kcso8hFqbBoltSsnSzdHE3jHngoFfN3Rxc?=
 =?us-ascii?Q?tnHM3oxJgW/jYTJ4HdIOi+MdPJOijnx7Cz0Fro3vQundr/uCwiw96E4ZbKW8?=
 =?us-ascii?Q?O+FUiGDFwVm4fYrNM4jmmT19eZlCYZL0n2rx+oVtU/CoMtxS/gIWhjHLhc4n?=
 =?us-ascii?Q?yEcb79Es/zt6kxcB2WFgXQTQabHfkTGDwW3BInVaYG9Z8wN7LbFVyPUz5vjQ?=
 =?us-ascii?Q?SMF8pfoZEi0Nzepp7zeQpeUW3lpbMQlgx3D62OkSE3+NWT/2uFiL2Wpi4PoB?=
 =?us-ascii?Q?iuzkOBt5G2Ih3eEYv4EulHZJNpsTATrXhkV6dHXgZrjjSYH36NYkhHtllp5n?=
 =?us-ascii?Q?tQFjwWGoZFbXs0qHRUDmK2hq/mhrleExVBnqcr8hoPgaIlB5Cm+ZnHCji40M?=
 =?us-ascii?Q?8tTOuMof9bhVaqZz4hr0t9byCjnplvsBPO9c1IQV2RIKv+BHQHY89zbQcL3r?=
 =?us-ascii?Q?oIIBJ/24MW949Zy9F0JhkC6ODTtjW41vNXDzCv4UTp2sJal2foD7nVcVQENk?=
 =?us-ascii?Q?Td2thKEuXdxZiaAB9H2GycyLtjvk8HRaC06nnSKRcrbB7PAc2NTovL9LizLD?=
 =?us-ascii?Q?046M0NHJbWnPrM/+BpQ33PI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7dfc48-b195-4403-c6cb-08dd5605cece
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:35:10.2433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERVi1EVbirQTEkHB9dKt3UffdkVUd4vmbMlzQmmntPJUnQXfgyCz8cFURJw7rDRk7bYeIJGNiXpK79K1/3QkYOid0jtSQUn3UmzXsdAcvXfPe9zYlzPNjK3GYZx4PRTG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8745

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8804.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8804.c b/sound/soc/codecs/wm8804.c
index cfa78e4d8b73..0a879c29eb04 100644
--- a/sound/soc/codecs/wm8804.c
+++ b/sound/soc/codecs/wm8804.c
@@ -243,10 +243,10 @@ static int wm8804_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	snd_soc_component_update_bits(component, WM8804_AIFRX, 0x3, format);
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		master = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		master = 0;
 		break;
 	default:
-- 
2.43.0

