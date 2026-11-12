Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794463304;
	b=jKQePUwI/xXITNwOXE1Qzc5tzUhQnAHKKfLZ0YoyXfZji/6HRu/4QxSig5iXNNdk6rNG
	 7PXZqUQPCJ3ql/ZUagH6MpM9Fktga54FJKBOR2/P1DvzYASPhQT30QQS67TZzlLUdS4hq
	 GwINCZVrhMdOloXQCt+NvEAthQL2+X2Gj9PbLny44ntdipLCQEHbEkEiSQivVnGeQndE+
	 MTyXwd77cDzQ4r2U6pXgxfnvgGq2rlfZUGIUKUCxDwGTmGX87RBrKKg3BlkVGtl8MCxq3
	 8rbbd2LuJExEuVq9uGg6AEy3EsP2sbfy7A6apcZqPit01llYk4+5gi0KaQbQ9BwAesw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463304;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=2vIqI4UKAtHJ1Kmb0YixyEvoW1RUVPvaj6sGCYwtswc=;
	b=FkP0rw6RfuKLvv/wxtrwoa9jhmRarJgjRDYAJJqqpibwd4hiY3D2ccltgeSfhfzuZQzy
	 Z2zQ5evVLYJVpnUwS2T8V2G3Hql+5mq4CCkcvlcgNx7NGuicAtjI5FsZm0syfJRrbP0t2
	 xsHYdnzoNn/P5KWW4Dsdj8p2LcQ9ygjFo0l2DCiNHgPHPoKbtZFlOFJpoUdPpxn8vVegK
	 fQfnkBa9u2aVr/O81aIDnwHKzVg48OlLzaYm8TVz4FnLSxioOgA19aS03MIFWjEWEMef3
	 0ptdPBm31xuZLxeVpQ4U8aeLRX/Eqcs6yXNEuc5oQZXs74dof1bde5eQfYlEVPWIMNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=nltlAoy+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.71
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7BB606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA7BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=nltlAoy+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sF2YgCipx4ygKz0noj70jud+xmgozuAx/PRNhx8sNM2w/2hUlPMguEZVUs4bxPD8b/G4Q0jRz6njIBHBh21fI3/N/CKufNvWTgBgLbtt9qnW/LmBNIpSpE2z90v3JReEoecT1FIAQL7ALdWuKT2HIQCegUxBg+5lNkLKpFTFeM8A78FP0gKqGe0ea51CZMwo5SZP7JfdFPNj2/lGbBrG0mpFjsFUkCAZgsI3XGZNDRLnbkMa9tegzanlCuIqxmOvVR/tavw8C9exK4E9h8Q2l7jB4V3rCEsMwoIXLEwZH2Csjbmzh0cwW/eZ1hZPLBnd1+1Q1cdx1ONE+vbIO746/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vIqI4UKAtHJ1Kmb0YixyEvoW1RUVPvaj6sGCYwtswc=;
 b=LUQATsIVkr3KoxE6pxxqzL18rY1IudUfn6PfAZd4cb3dlvRCQc3x0GvkbhOVWjivRs+TbiL4U5j7JS0Oif2mC1pArkCpkgtVbiNNZSDe/jTEpduNQurVIDw0m025qg9xUcMRc7uIV8kFQQI9QAmcPVbfJIKT9q8PR9RJJ4CoHq2C1k3siCrq55K/JY2PYO5loC787JXvQxlNML0Z3+G+IwPcjM42OdHX/F9HlnaD9RWaie8lxFlUUJnes73Wy4SexpNSMbTI3XarBZLzxVOrTW4nwOjgq52LXhUmbytJ98J1+ry/u/qeaSAeCjvgvyr+Py8cEFFgAtkpVTSOGNfDZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vIqI4UKAtHJ1Kmb0YixyEvoW1RUVPvaj6sGCYwtswc=;
 b=nltlAoy+NO5GEZQgQtg9lwPDargrPFb+gitmpkrcpgCQ9D0KFaOMvj4s0WpqqBIjFlhBgK9HCkf80mIBFOV29WH/XonaD2qgiPtH85oYuAFSzNFiWGjIP+Cs8QfmWXIu6qk00kV/TYcFw7CndHAZ+MB/nH2wnFay/KVnSHIBR4g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TY3PR01MB11298.jpnprd01.prod.outlook.com (2603:1096:400:3d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 06:01:42 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 06:01:42 +0000
Message-ID: <87eccqziyi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/3] ASoC: stm: stm32_adfsdm: use snd_soc_register_component()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h5hmzizi.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5hmzizi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Nov 2026 06:01:41 +0000
X-ClientProxiedBy: OS7PR01CA0234.jpnprd01.prod.outlook.com
 (2603:1096:604:25d::9) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TY3PR01MB11298:EE_
X-MS-Office365-Filtering-Correlation-Id: cd8c2280-48a5-45f2-3075-08df40826c6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|38350700014|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bH5qtvpP2qS7IPDKq06a4vM27gj/oKlnES/CAcy/9NwuPrJyxi2uOVZOBMD+Rnq0vM3lZ0Wto1pmu1fLTs9xCNHqOxQQxAzhBaIovTjrMPCVXDc89AN+FemdyytivFWwtxdSMFAsoOqT35dtX+mJz+qnT+rzgCgO41EHaNLVPvSYr5Vbv7377nyv+yhNzINTvt6/JvFyJvB6eKO1tlSSvn3odtGED/U9hFrODWKwuYS32AI7s0270Eaz1u4miu+DvQH7qaySgGGN4bvSt5PZG9gZtgEYTpu0TplRorTOY3Yjrzkd3eam+HN5unIwBgNFggeKPqIEkVzK0im5ol5qEkpdp8Xuw4RtgvAnxPRa+Jz55tPoH3fVSS6KZ2l1ckKEytZMLZxZJO1yo3wBFi1hXqZaE6Wf5w8hFII5mdF+weL3hmkUXBS+z4V+5CIHVbVzhZfCQwXGEQG0wds61WVsmQg2VqQnYWqEV4f4qamH5KFs0N2GSbTQSanm77e0PA1SF1tRmTiMr6J6fQmsi+qHc263Snj5NcKSQ0Tn6wGCjP9XU6ayV64Mqh4VDp9vOVJtN1wYmoAG31S6rxGBlIgQ1ZQLFt7Ry/bwruinWst65I6oEU8ymex23GDFYB2nZiCNu1LGmogLn+m6Ny0U3WHtkBRTFUq3JhD4ULzVvKTmHzlzuisCFMYMwItrSPVv7zFS1lIBlp3i4qDCG3C+cmxpFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?34dfnvAa5Bi8YYjTfYhlhpIA7bTtGTyH/ZbGKhM/X0R863sQYfprNx3qGYQV?=
 =?us-ascii?Q?aH0khdXgdqucxzfmqNHY5zihEn45VxeG3Xa3W4gRJAJtXbzbSldLHPLoGlF+?=
 =?us-ascii?Q?wkRzydhwLQpCYucdJEHQ6z2eljXCkKnO9s+7qX40+xrqVCu8LHme+ryFKMuu?=
 =?us-ascii?Q?YjUZJ3HFkrbwiluLsMugF1LlS0J0JSszANZhikU4YPaS1Tx05cjtB5yHiVBD?=
 =?us-ascii?Q?Vn8vU5XpDags9MCeUHMhzllK91yZzBSsbVMtFB7tV1X8tJ/8uqDrniFOiLez?=
 =?us-ascii?Q?a6DQ3FA0XlIldAyS/h9cc0TRL4wzhqr8d44qc/3TbVgJLIDsSQL4psibSaE+?=
 =?us-ascii?Q?J+saUJWCOj8TQA1fPaBo6+7PRlQAxc70TIpaAMnRS7GGtNIrjQcujUahwNUE?=
 =?us-ascii?Q?QZqq0ciGyNgHy2fuhkGl1b/SrKxKrgqHMlc7KeeMw4oyDmeqJ9HSwKkbt4tx?=
 =?us-ascii?Q?fcGNCdmfki0fn0X86AxC+iw+j7eCZZSJLcgwKXu2m5lKvx6qGPlT55KaPr2l?=
 =?us-ascii?Q?+uz9JyRopfInqxwxpMCxKjRsidV/RpsttyRn9hQxzyTr4CT9C8QHSR1BGUeH?=
 =?us-ascii?Q?1tepFqOnOZpp6W36kvbJErgGWdidOjWN+fXTVmxgD3oLOVyHYArX4HCEhZF+?=
 =?us-ascii?Q?/EbpYGq2NfgKoGRb+2lFHguuek4+Llei103F52msY2Ca4VMcy5iNWHWMKYYc?=
 =?us-ascii?Q?I/VQQDj8B4iLNHZWNvoCDRRqH0csiHsQE7sHi5wEjzPMMsbckFeMZWKN62pY?=
 =?us-ascii?Q?NYMbP2S/dc0Ih4UuWEAxCwC3BBQA6+IWosPdal8H9/nbbQCnxbgQqWNhfRWZ?=
 =?us-ascii?Q?IUtpVqDkvKCifpXuYWz4T9jHYGgITArsBgioj2+r9qv8sUrmqr0dc6WoIn+y?=
 =?us-ascii?Q?vblnoQkem/V5NYXi4vrU8TmkI5m2y1teNdjzEuHVw9dIW5+jqCnxqiLBu3kY?=
 =?us-ascii?Q?8BhY8/rPhRVPR9AeKG5of2mHSQbUHyXu94RN3IZliu3x5JYhafkFj8cw25PE?=
 =?us-ascii?Q?ViPA8MFduVP28IPClQmyF+MsnoWfyIxqgBFpchmg0VOd6yiCKStQ0vi6fjYG?=
 =?us-ascii?Q?rHs6MXO+YxcRi7S9Bjb84/Xd6aQygQg0+zuQqMquvroT1no2NcNxnlVGDWUz?=
 =?us-ascii?Q?dbJVQl1WcxY8gOStXj9IPGAHhUkx+TCcY/I6J/lCKM2OQ7JNTP+9tCVaPqjv?=
 =?us-ascii?Q?oaeen7kfvTd6TDUUagzdvMdk4U+Jb2OcqOiLtXAc7EoDeKsCR+X90B0q56Qt?=
 =?us-ascii?Q?e6xg2mPXcOyvI2VVy7eUIi6y1Pn56/p1ee8zjuQ3djO0PidKSJeYMtwuYk3w?=
 =?us-ascii?Q?4c+9shiJoZxXjWcjWXn23UVixJgTpjZLeBJ7zN4GrN0W3Qj961ocRzkEMvNW?=
 =?us-ascii?Q?90X05dtLJ/n5F8OAzoyBe5myLLqOforAcmMEwcwSk/bsbxMtA1tiHX9bAa8P?=
 =?us-ascii?Q?HXw8IAIgZweJHygsXfnMtgXofVbAKS55bKbLJMHyqaq7Wazxnt8+OTIzyWiY?=
 =?us-ascii?Q?olkLIeWdtZ2KqW8ZiA9Gp4RjKoOavX1dp6S7ukKZK4OiKLplUmkGrRw1zC6t?=
 =?us-ascii?Q?ABABK8Cj3lR4oBFxI932Sd6IQQpdtF1vxlsygmtVryaRdJAOsD1AhRQXlKOb?=
 =?us-ascii?Q?tuasMwOsO9BVAWp1hWrKDHe96yZX83dnnPqZeph0Ieaq5fpIkQfp4JZdAB7m?=
 =?us-ascii?Q?JDAb+b4gHEvuJsJkA4MwakPXees+GkQE29p79PENW7DwcYYUoC9F8Lejtqz/?=
 =?us-ascii?Q?lkCKZlKuZ5f3wvNMgT5/CCeBWOKqRLF5Gw34u6rRJxn0SPIrsPgL?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8c2280-48a5-45f2-3075-08df40826c6b
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 06:01:42.1740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsHqtM5L5k+6A/gp++8ffNfndteoCjw6a+JUYWenoX4gYL4K3vigUhFmGDOK22W1xPUjkgNNhyj4U1QiVJi2wysiK4aFuVaEhgH3sxdxw+epme1i2po7IEFqKthWE9Bi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11298

.remove() is calling unregister() by itself, and call order
with pm_runtime_disable() is important. Use normal register()
instead of devm_ version

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/stm/stm32_adfsdm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 018f775f36bb8..72843c28c43d6 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -357,9 +357,7 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &stm32_adfsdm_soc_platform,
-					      NULL, 0);
+	ret = snd_soc_register_component(&pdev->dev, &stm32_adfsdm_soc_platform, NULL, 0);
 	if (ret < 0)
 		return ret;
 
-- 
2.53.0

