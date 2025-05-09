Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A5D4C7F
	for <linux-sound@vger.kernel.org>; Fri,  9 May 2025 00:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746751016; cv=fail; b=PYhOr6x1Hg46+JFUlF26gdGxHUcIlkRo0+PeffZFOSN4f270+Bo9qZrR3bxr3c9/bcmO/Ix1lkQnmf8kPVnjFkGKSFGV1mOqNv9cbVxl60q13NPBjctQUQQF6pD2jiX0ky74+mOp8HcgfKncW3/gGUVY14nkruMTpOcDEywvjfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746751016; c=relaxed/simple;
	bh=VKtEDZJ5I5JNP1DFaoUaxqm8791HzE0Zt9h6xZlQRBM=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=QjXci4Rn5Y+z8Uumst0WB8TjvyHf85TjC8fU9/nBn4XUN2Ln7j2LJw8hlmOxQQzTB3qjvGUnWvoXSB124zhZhp9dnetP3lAUboTVJbgb+IV2kMvdhhNqsq+oyc36jBIVUZ99XVjHUvfnHjmbJuijKE8OB9e7BBKxlCmpzJdigi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ib319eI+; arc=fail smtp.client-ip=52.101.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ib319eI+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHBGjRCFqs2jwCB7hEwDqTn3hLocA6xW8My/au5PZDMJsJGvFhsooIpEd5bUB5vfEBTkQILdpo3TTm22Rmb6YLIJ0PXlTXU3X0A8Ggwkc1F2xIIxtJep+OiVeYCXse5zM+VbVTX29HjFDseIZlDYha34MaNxVeHCDPjWKLTeZxhKZM3xWLXhiINocrh5QPBIDtlYw1SctpMo9ZVXoSvALskFvRMAlxjylyNhcdb2UOBqwaqiDL3NicJluymTBc9sUkASCh8ZU4lQ5xZv0hAhweZ4iJLqohiltBqXTEOVA/08unM5sG+8X+ndVNCvJLNjS3yGhF/Pl2+Ysu5iWdNVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJubshNigW/6ZN26VFXTu51UrxdXZKP/c6gVNswVnnE=;
 b=OTKIaqTzU2pR6EUAsSt3DfGZunXOgOfmpEcioc851ypyIsuBskds+bp3AMgsT0MKxcAbA17+rszRJ0P6FNAsqyRHAGVRaF45JGdQCS2VHZaNfPqnDTV8USBCJzjvJ9bpcVW9ExVYxs2iONvW/h7aS+GEiH1bOVVo7emXoVHsHzXTc+647QpwoHiw+ITk7Z57rafHq8IMluMH4iTmWkdYaenbPfHXHT6GIEBWM9os0eiS9UXHKr/4zTXap6acphDiT4SXn7Y+kuxBKc7ASxyMqjYkGxZHNQJuNlSKJ2mBH7S2POcYsywT7XsBPFStIeqqY5E+bgpPHeYszDYixUCcLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJubshNigW/6ZN26VFXTu51UrxdXZKP/c6gVNswVnnE=;
 b=ib319eI+/WB8/A0d9gUdMdMKmZXdnpWBtvSfLN0+OT4sHf4ZLe+UdwN+gOI2ZsFH135MraSITszMEA9ANm1UuVKVjPRiK1+GyYeN16l9LhRvf6h0oU3igrgEJL6gMSltGLzYPoPFTkIor6TAokLj+g1a+ZpVLmCIdD5O34iz64w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11320.jpnprd01.prod.outlook.com
 (2603:1096:400:36f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Fri, 9 May
 2025 00:36:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 00:36:52 +0000
Message-ID: <87jz6qpql7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc.h: remove snd_soc_disconnect_sync()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 May 2025 00:36:52 +0000
X-ClientProxiedBy: TYAPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11320:EE_
X-MS-Office365-Filtering-Correlation-Id: bcc64a69-009d-43d3-c901-08dd8e9197c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/Yaa1D8ZxFHdNWGN+GXECXbTYFN/H9pVCM9OdQFr76XD9w4mT/p5JiJYa+e3?=
 =?us-ascii?Q?nwTfFA/vbbHuxW2NvGv0Yy6H+EuQy91ryZQ++Hf4HXfP0KjmR0MQmhuHd0ud?=
 =?us-ascii?Q?GItO82US8c8EtmcGWtGKQ8gQjaN6Gbtnz1QOgOXhw7Jp354ek+ouDmIAAOxv?=
 =?us-ascii?Q?oFK2SvTJumMEklfj/QGcppZZhXhfNagfeAG5+G379hXPXvQzM8oxeYdp/cub?=
 =?us-ascii?Q?Xdk4B3YXMZ4DYvAuBH0OqPhpDGpJC0U1uKrhsSRiaD00itvWDj6/mfAjO7BL?=
 =?us-ascii?Q?60iwnIGdgu9ipQGwjVgSnJA0oAvfvKUWRyzdbI/toW0ET5uIh6KDJbBBJK5c?=
 =?us-ascii?Q?GmInTe7a29ALRQVFdm8u5s/ZB8uvzb1v7h+ifH2HYMkaZpNxZFJ1k4vPTILD?=
 =?us-ascii?Q?NgksT0JSBUGElP907S++OOBdCdOwLQcHyWo0ynU/wci4f0BfHPRkbkpp/B6z?=
 =?us-ascii?Q?OkPC18ySsSHtJLEPCwEEq2IcDyUwkgLFca2gT9WMzmDTmNWkrx7AzKgONiwC?=
 =?us-ascii?Q?7D+C5JpUPvCZNsU2xvO1xkEmJlmFbKkAVDI4kjTwPZRrJPLEl/nWs3blrY1k?=
 =?us-ascii?Q?DCuP4lrwMhSNGdpv3CmHTiQWEyy2ZIasEQRShGdBxMMpNAGWoaCsGxYMmO+5?=
 =?us-ascii?Q?5K2Fd+OHsgjf0CdgyFSWkBsmQ6+kpvMAk4ijgFbECwsYJZpg37xUL5LDbKfW?=
 =?us-ascii?Q?Z6iKetVX8bTCI1LWUYNuCpe5FNFxbHcduNOmplALHiwF4GpzE0DMYq/KkNPi?=
 =?us-ascii?Q?Kio7/Mk2EyQuL0PXdVDZta+UR3HEwrr9LtJxDjPq4PCi6WharbdCyXOEN3m7?=
 =?us-ascii?Q?i8R5TyYCnMtAQ4tVLMs3OWPOOcl9gEIalVCXavdLnu4bDzREYhlm4vndGCPl?=
 =?us-ascii?Q?1YIp3lzZDIauxtyM9GRc3pPpI4x7pp0oglEjVLD4NCUP1igYZLlVG4nMgVt7?=
 =?us-ascii?Q?o9ocz6MwpUB4vbtT6CTk/tiTNAJCSejgoansq4YbarMCVbLqIKfTsbJEyZcC?=
 =?us-ascii?Q?9XphKfulP3e+eJr2uu7t/PD2ZXg1F6Db2weKPW55bJ0q6zOkZYeq5grHgvwY?=
 =?us-ascii?Q?y2HH0Hf7+p8xd3vsXQPWj2+yk4MnsS7O0JMv9/8cY6RnHjVbsuMzuOrSLGNF?=
 =?us-ascii?Q?s81Chw+seGN2U+QnaD5aHW8KAnee7c+I1uL9rO4wn3yebZNMWDd+0TVzBJ2p?=
 =?us-ascii?Q?JIw3OEuXEllAWxZT4D2r/TQ+MpTpKIff0fEV8ocblThdnUu1dwO+YlZHwIux?=
 =?us-ascii?Q?xiOSbh4dRti+srsTAc7qJnzPPSVYHP2rjeJV0xmlZYgwDANDCS8ltG0IEemR?=
 =?us-ascii?Q?37uoZgBgjRqC2z7EiCS9B8VMavl8PK46L0s+wL5mHJg6iXbCJrdUGAwgDHzJ?=
 =?us-ascii?Q?+8azWYKYV2EbxHblvm4KK8kD+qw+A/9gbs77flcT2wgbcVtUiwlkODHhttFJ?=
 =?us-ascii?Q?GdcC2esQH5ZbACJ0wBiz2NI588Y+5xEpp5kvI8GZOXLWgodWXHvm6A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rhlo/389+wytqYxjNv1b8zIWmu2RKkCUlzmiI0yRjxFId1GmEH6BQ6NGaKQ3?=
 =?us-ascii?Q?gCoar3hZVViZGMp2bTVvJyj8SfyYPS+J0muEkyXo0j1zY2plq2q535dEf+1O?=
 =?us-ascii?Q?TZxkvSpycve4YhOa7QuGrmF++6xF9smDTNPsu1WrxrfsdNyS9mBPqnnh2CCt?=
 =?us-ascii?Q?S2pKs5uM6s26MEKyLAnNyuVt+mygM/9YgSyHVs7ZL3JXFSRTzgFkW2npHBVy?=
 =?us-ascii?Q?NvScmxSXfnFUfotA7Kr2rHsvcc6zEU/FxV95nCYN/b63haPfX0xZ7nRfemY+?=
 =?us-ascii?Q?4kEMJ0KI7mxIiF8K0Xdq4w4mlkiqa0vd1kAXUXE7nOcshRaQ1+92dmhgiUB4?=
 =?us-ascii?Q?rHL+K8jVdadcGY7cahjlwAke7tqcKxX55TRRIcOLeLUtRX8/hlzuRCpuTya2?=
 =?us-ascii?Q?/d67I3fn5MTwqLUI2MWJQL0F1oTIWdQkqFHW83cf1jQXgxBm3mmZXlebbzob?=
 =?us-ascii?Q?zVbkHNqgescJu1Xe/sP+YYolfeZRV3IxspBV0BliF/kteam9mAHHl+gVROSs?=
 =?us-ascii?Q?knki9RGih3nYYQkHupL+kRYlQY1fPv+zzjjtRdfCEkkl08Sn5GbFcQXBKB5z?=
 =?us-ascii?Q?p7R22n1Ykq0MDSvgoSRne05rr/qehCEVzNceV4/DcGNVAhwjH0ZKObWsd9kt?=
 =?us-ascii?Q?PzCgoZaKd03tcFUlrHn0KvKKg4R6+UGSFWSZNBgIXdXQmoqtVLnkfbS19FJE?=
 =?us-ascii?Q?0uUtW4AEPlGHHjmQT3LT9eZ/bpFOLPcdUiRKfDpVow+wRjhP+hnUa50cOFiT?=
 =?us-ascii?Q?WEGcMGtgx1mrl0hepEmbynDzg5huBWnRTNSdp7Shy1zNGP6dbf+3gqMiniyv?=
 =?us-ascii?Q?a2sdFGfX0KcOT+xxONTh2wQ0c637MlSNL99wzeFkL4e98KNWXqd40oIvmm0W?=
 =?us-ascii?Q?tG6GbD4gGjbyV7PmOS/jwQ/DWef1xV13MlZI9YTe+HVRG9P3Ds4hEdyUXXP6?=
 =?us-ascii?Q?KDw2YFAdo+K5NBX0P6ZRG0O8X+k2DdGKVpjlxBp0dq42Bff1KIqnaj6uulfu?=
 =?us-ascii?Q?t8y2fPqc3LkJAzh9TTtqlTSJO+NEwsjtIb/36PFIoC5XZr74F2ph87cJ+wuT?=
 =?us-ascii?Q?TxWc94V/Mkwc+VGwdpgFUvDJl4kEviLmQyWr4jC0ONw5CnZGxH8gV0G2n8ed?=
 =?us-ascii?Q?Xz4tecKNElALecmK5OIsz8FEiUyZ4P4EmxwKA34ei118CICTE6FW/N+2nwcA?=
 =?us-ascii?Q?8O/0Kq9lFvNYc4iBdKCl3A1JKnZYBED7GFOGgN0X3c4USGS7SL3nApei/3XN?=
 =?us-ascii?Q?HW3UEZ9u5PioElYyMImkBhEs194svkQ1K3WnEpmJ4B0dFc3RvYj92SuaCvId?=
 =?us-ascii?Q?OcxZ9o9Dgj7tFL+U2VNxdMFP78xAuKhqfzOHe+WnJL3TXmdvWCiF4JBWlxHm?=
 =?us-ascii?Q?p82Cpv7//81smAepeUoS+IJNUluaLb3AljdkvzNr9BhlJ1KliDjnuYrBKqYA?=
 =?us-ascii?Q?ESVG++59SNcmqZoQSKaJ3LwCPV+LmWcafCc9mI9HaGkoibFExMPO0cM3EI46?=
 =?us-ascii?Q?pssMHsV/r0vB85GQshar/4lwO6GKeydwXSpChY4Ux1EyJIRwkb9tYYhCA9dY?=
 =?us-ascii?Q?OA57m+4sEpj3L0D4+mjGREmL+DAEqmM9C4VkaKZQ58oL8pY+KfcvtoXS36JZ?=
 =?us-ascii?Q?Gnwwmcz7sRLMRy4L+stdM4M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc64a69-009d-43d3-c901-08dd8e9197c1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 00:36:52.4748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEu/kNgm7ObT5R+xaz9+jIUt0EJyPeJcmJOaJLhp8nz0LpuT8cH/xXkLgxOt9D4Jx8QGI5mEGiA4Lo12OAESwRjTSWZ/t0Po1ltIyLdR/EMbYnGb8atluYS+gnS4/v2d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11320

There is no snd_soc_disconnect_sync() implementation, and no one is
using it. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index dfd3496221cf8..8d113ee8c2bc8 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -462,8 +462,6 @@ static inline int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd)
 }
 #endif
 
-void snd_soc_disconnect_sync(struct device *dev);
-
 struct snd_soc_pcm_runtime *snd_soc_get_pcm_runtime(struct snd_soc_card *card,
 				struct snd_soc_dai_link *dai_link);
 
-- 
2.43.0

