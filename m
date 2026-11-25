Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570949;
	b=KHuCW9z36yrPTrL7/1MBeS/WXWXWmfHDGcXvbH4oSax/YYEgX7jB2H615MSyjA2aShwa
	 uQfGIWFA06VkV/8KfXRZ10kW+k/I3/1GYXzEKEdDZWrnd7VENTO8ioja1t6kzKlTFBbMS
	 HbvPsMM2zZWGamZ2g4I/36VIhPSNpAId+TENOn3T4HyDa9h1faPjKOFcH7aVak/DJpUfA
	 onNyeFgsQCUnm4Bt+b1QKmHd6TT+7JEpJaXGisxpMH3gz6v672jZWFba3aVpsDQxmZVYw
	 qrUl8GM2QxkgrNQm3WpWzbmAPowi6AumQU08eUUyMjcgOsxJQWd7hajpe85M2R1Y7CA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570949;
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
	bh=nYzJqS352nmmTgYFFAe9F4Gmxo/4rQP/cssuI3qEik4=;
	b=m0elUg+NJ4V735DwPmGsDbLVLyyxjrQN5KSWN7EDrLpzoO+FOulV0stBJKvkOMsLgtoo
	 9qKiqorjLq0/GFAhwMk1QFc0rSnmekJPsg4vZykLT0z7QvMpPUsKt9/IK904bGQSgrFVI
	 pfMVNTGNbAFCKQhtx0LTI2cccGhiFfl+Lqr4nyjytHTXdXBrLV59VyaXNhpGPyJoYaVos
	 KgTk0VrdV1rnQJflRSyMbu63zoe+3uy0pjyDCCxDQ42r7QxO+KN0c9j1z6qs78eMIO1kT
	 BmO7hMgjexcFyc9wb921ikkWrhWqv8E8GhaDxY9FiVW7u5BMgpzQy6SxsviMj/WwlJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=RVGWSPR9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.30
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011030.outbound.protection.outlook.com [52.101.125.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A54606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A54606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=RVGWSPR9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/BGzg7iNFsj+3jkgYR815F3/FJHDtCK6jNaXrmESRV2r0rtHn3n0eC+/cxczmb4JGZtJ0rLgRfbzPszRfxtb5lj9BIrjypeE1RjwKMTWe4c1DOvCYpM0QKzgybyLJ13PZFPuyTH6UbWevfnHwnmYs6aAvyt9jTKz4s4Ya/o6KJAVMCnFphW0nYFxmHwn73hE1xNh/o8kPvcFeP/9So1MsHkrvQPciSt9or11QDcH/minZv5KNp0b+4za3l20wfmtDTEPuBu/LRiKmu8fhLXw9nxMhhEm3yJxgOuIq3z9WlDReGiP+G1M9usuTpMCeRtcjLk70p9n2NII1UXqvaXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYzJqS352nmmTgYFFAe9F4Gmxo/4rQP/cssuI3qEik4=;
 b=kkHMB6rmm42LvuEjH5nl82kFi6QBqAHYBMC31NIb880efykFvd3r7bWYsTbv4zV5Sxym9FjfMTeN22C0ayNzBtFA9OFxOea4aOlqxvkchdNbQQ/4xwY9ItdolVOPIX7h3l/T6MWr3ViRHLIejF117xhAPRYMIIQNe42/+tKePv0vdezwYo8uPZYcYkqr6l/3khUpXhpQMaBaa2cFVSLtO7N/skvj/FhOoYRHuWYoJ9BGz+cnRQ6Mv9rLhw++7d0tt9xA3M1GW5VHPEHfk2SyVZGRGC4V0Q8eZfTASAnk9xlEszB/qbYFm3YzSuVEAFyHXfeSJfK5+VMPQAN6+K4Vag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYzJqS352nmmTgYFFAe9F4Gmxo/4rQP/cssuI3qEik4=;
 b=RVGWSPR9KOVVXYp57omEj2IXORzyTFfnvn6zGzzTvyRUnsiBi5f1L7Za42+7NFmwxkjkjagrm4IQ3GabnvICNXhJdsD5Tz+MOwCbwLTBJSUD703aHl6dmdy7aq5eXpVJyaImlYbJvXiGaL3Hg7+uDi36cgXb49Njx8RkgOXd+aI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYWPR01MB9838.jpnprd01.prod.outlook.com
 (2603:1096:400:234::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 01:42:26 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:42:26 +0000
Message-ID: <87zeuxelfi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 07/27] ASoC: soc-core: add missing snd_soc_component_unregister()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Nov 2026 01:42:26 +0000
X-ClientProxiedBy: TY4PR01CA0103.jpnprd01.prod.outlook.com
 (2603:1096:405:378::16) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TYWPR01MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: 47720740-1817-442e-1af1-08df4a955be3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|22082099003|18002099003|261009223027099003|56012099006|261028144727099003|11063799006|261021121427099003|261022105027099003|261102123227099003|261102130727099003|261026121527099003|261021123027099003|261026140227099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	jfZixadQPtUT6xIEvd99cUGgbVDk8PIGzkMWlVAMG2BOOahPz+Q0eZFPtOV1dhQVlCQ3tsp+ieBaZjGLEWyodNbIBUzkFfTBL5pC/GXYeV5y/BmaQk0hMlEXaa3g7V/4oUENcubPRhZraIexDML2lq/QFQ/2AF3Ye1M3Lt3wQms1ydnX4aQmpSdKTtdiLb88IijTxpNfF8fF0zM3D9CissYFd/l0bWW9jAWTXxQwrE5wonP5pKnpAEee7oXj8lJSn5L6pldj28wm7I6NgHdHpo0ut3RR1vt0+m6Wtot9f6EGxY1biqxjESE/lSoJEZlnbodz5RQfB7aoL1l66tjmwnqpvxXF/19qKVWRFozN6x7t1acmlcbc2hlmgX9hIlzOkoq9HIFzlLLd85J2C+x74zbJanae9l01aevuakcwTaVFR+Sy6lNSgm6DI22+te5l9llzyK8PYWR3tkwbEsdgdW55+JeZ7PBAiReBeWIYl1AVwf1vv+wwC2SYuop4Jx/bPl+Selk8UfGGnTeQEGoTGzUQiJTTMzZXojc8T1gV1G1sylNeKQ2W7tAFroS/qR+FF6WiiBTr6ga3R1bxIMYDIm8I12gHq23b973VwQF7Mn+r28CQ7+Zdx4eQQCJ9kPDcpgABu/R29bG+hyWEu6Hh9+mvZr8xdlQPaSf4mDcNG/wbSPFgpFSiK5BisIlXwpLvQVEDuObQgFCzYyT0zcwTaCWQoAnN+otbtbvm3Bmazsg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(22082099003)(18002099003)(261009223027099003)(56012099006)(261028144727099003)(11063799006)(261021121427099003)(261022105027099003)(261102123227099003)(261102130727099003)(261026121527099003)(261021123027099003)(261026140227099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qyVKnvzyhwaxhkSO9SqRqEOp9bFtFVXUQD3Xv3D0izcLWA1L/M9z6swvmFhy?=
 =?us-ascii?Q?dmcKoNDNKs8HmcnBjqZbdeTivZM5+BYBaxSWklPft1bXKKJju+FAnVaNERgT?=
 =?us-ascii?Q?q9LN2/aspAGzaJDl9bWyE1ZJNSIhiURxFJEAy0BcBfFOVh+jVqXVY/70upSG?=
 =?us-ascii?Q?ddm8TZvlxJya/mBs9WExJaUGHgVCvjyW9s48WW5H0Cr8QjCnqp5FtpllY0aQ?=
 =?us-ascii?Q?unsMaJSk1yaPcsQ7f45bpi1RcqsUauIKxzU9Uq5KPv+gZjGMLYbMntL+4QSY?=
 =?us-ascii?Q?d6J2TNqCJBuc4ulqDn2H+uzU0O9LhRzfycl8DNUerml1K4HJSkGU1DN4tAEL?=
 =?us-ascii?Q?2LBEr49FwYHNFEtaDGCjlrGGU0FBBum3gTP4zF8cC1FDKiPuzGkA1BdqO7TC?=
 =?us-ascii?Q?U54QbGDeiBdckwJsHaySC/ol3Qc69OhxmDcGqRlTsPaDczUHL24m2VLw7ypQ?=
 =?us-ascii?Q?X1ceKHt/ONsZISnhV1DWj/eL3Lz5Nq+XBxARb7GQkWJG6YoQW+e9OgboWgJx?=
 =?us-ascii?Q?SCwxlP5Or2KdNKV9SGnX9bMsWrdY6s6HvXHH8AN/8c+adCtQ5KjrGbdurFCd?=
 =?us-ascii?Q?yU1xeTAU3oMh5ZB8ck5L5/6rhjP2ne2+SGE8jAVM8KwdqZTuM2ETLPqCtA0N?=
 =?us-ascii?Q?0ZiCAaWakH+U5Eb5fyJ7lUSBNAUlt51fCTAt1Fg7al/3Ud3+2eVv98BOH+oN?=
 =?us-ascii?Q?p6ZF62O3LDMQcUIT2FDCUmIzxVJxQBhAd8OhsUflfOQpFXotVs2/MQbNCeHa?=
 =?us-ascii?Q?oRu/yEQOmpTU8poS//gx+9kRtbg0JX3jHTsEBhmFJOo1ZajJJSL1MAN8P5Uq?=
 =?us-ascii?Q?Io9m9URge1TvSFyI+BqRLgkJ3Wb9ScVJ2cTLWyohW25LJFVCRWWutzo7Jsh5?=
 =?us-ascii?Q?uvmpjfRYfBeeSk5+QN73P9RI57GWSaW6MxCa8aVxfdob0sQ9MDz3mI1EvjK/?=
 =?us-ascii?Q?DKUWixsuNiMjgLPS7eyghJmp2kxxyz0SCuZHMWCjJOqgXOdQnvD6r06PEesd?=
 =?us-ascii?Q?yuCWhooRbLGlZabHqyhWGrfZxU6QL1fPEQkFHbiGGMuWzXa5ALtaJ7MGckVl?=
 =?us-ascii?Q?ciaKfCDtIsc4K1T3nkdfS07FP2hSh1WJT6fJGKMQWjyQYPbRv3292dHs0IFg?=
 =?us-ascii?Q?4bDXnS/Gj9+iY6UvFhG1N3UYDl9zifNFRnCp1nybpC4f/361vYMe9pNXTK8T?=
 =?us-ascii?Q?MQWVn1QVhr8510sFJqeFqmS51SKCDDm61x8jxtOekGK47H4xgc3k42Sms4RS?=
 =?us-ascii?Q?hwnYCTtzn/jdoTRZCDYYKqJbzNf6lDdb1ZfXX6ASYShmHsg69NTRjSXzJkNJ?=
 =?us-ascii?Q?eod7hAUbr0xFF6mE/CiSmXwf9+VkQY7ydHLZx3dSCBrUCQ9ov+EplddhnWJN?=
 =?us-ascii?Q?wcL4/aBmz6UeV6y6hTeeoJoBTWqWXuVxNkDFwd3JBN4YMRwAJ1kxQg0BRBJz?=
 =?us-ascii?Q?MdaFS/gkHeYkHcSo0XoUbUeXkN5pw3fVYs7/lS1N2l1JIuIRAwoXYhSIVVD3?=
 =?us-ascii?Q?dDp4AgRA65RU5rOHP16+F9eYct5IAYMgAGsWQaus8g6fKpFb45i0Kie1FgtE?=
 =?us-ascii?Q?f+tS6NPHIb/z7KkRiK9i/U+amqIECfHFlotKszIwMOl0sKlkzhzcCROSeWTH?=
 =?us-ascii?Q?r6qbhF3aDbj4Q3bLQ6VGzmJrsoevQrOfmRek1GOc08y0egBYJP3taYj+ABKz?=
 =?us-ascii?Q?ZlsdS9fYztWTCd5WQ5cCTgTGLK1+7ZcdTQ+08BYN6xO/m2N1fAlnU/Px4MuM?=
 =?us-ascii?Q?+t1gYmq/Jc0kF9/vQpPjXf7paisxMcA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47720740-1817-442e-1af1-08df4a955be3
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:42:26.3573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jU8ehRgmQ2YHbaYoTuqPEiolJiWqa7zyRKJkcmV3IeHnkNlQ1nCcFY21GaRNGeceesXbKBFH0X5+JVo4WBKfo716DU0w9E4CmJ2K98VLQermYT/o64BhqHTK6Cqj3s3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9838

Current soc-component has snd_soc_component_register() (A), but not have
snd_soc_component_unregister() (B)

(A)	snd_soc_component_register()
(B)	snd_soc_component_unregister()

We can use snd_soc_del_component_unlocked() for (B).
Let's add snd_soc_component_unregister().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  1 +
 sound/soc/soc-core.c          | 14 +++++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 7476923c60d0d..d6685812cad76 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -275,6 +275,7 @@ struct snd_soc_component {
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_component *component);
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *name,
 						const struct snd_soc_component_driver *driver);
+void snd_soc_component_unregister(struct snd_soc_component *component);
 int snd_soc_component_register(struct snd_soc_component *component,
 			       struct snd_soc_dai_driver *dai_drv,
 			       int num_dai);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 15d466b5ac15c..a7313419dc5f9 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1493,7 +1493,7 @@ struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_new);
 
-static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
+static void snd_soc_component_unregister_unlocked(struct snd_soc_component *component)
 {
 	struct snd_soc_card *card = component->card;
 
@@ -1505,6 +1505,14 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 	list_del(&component->list);
 }
 
+void snd_soc_component_unregister(struct snd_soc_component *component)
+{
+	guard(mutex)(&client_mutex);
+
+	snd_soc_component_unregister_unlocked(component);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_unregister);
+
 int snd_soc_component_register(struct snd_soc_component *component,
 			       struct snd_soc_dai_driver *dai_drv,
 			       int num_dai)
@@ -1540,7 +1548,7 @@ int snd_soc_component_register(struct snd_soc_component *component,
 
 err_cleanup:
 	if (ret < 0)
-		snd_soc_del_component_unlocked(component);
+		snd_soc_component_unregister_unlocked(component);
 
 	return ret;
 }
@@ -1584,7 +1592,7 @@ void snd_soc_unregister_component_by_driver(struct device *dev,
 		if (!component)
 			break;
 
-		snd_soc_del_component_unlocked(component);
+		snd_soc_component_unregister_unlocked(component);
 	}
 }
 EXPORT_SYMBOL_GPL(snd_soc_unregister_component_by_driver);
-- 
2.53.0

