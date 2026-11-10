Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288292;
	b=kQxojJO2d85B2+VXMTwuWg/4MsjW4mWezq00UiERau4oUj9MaNgd7f9RPlDbITCIVcIU
	 b8ihJGJ0CFwO4e59qudWRl8yhHnPXcBSSNjfgoZ1HAOkZr5CeMrv1wPLNhSOfRn7Ur3Sn
	 NqnLRe7LRKOnGWEy8DNPfDGvQlTicXSkraT9ygRXUg3nL4khujlU7ZUuXdkvawiLuTJNY
	 omfbZDKduAtjOLWOQc8YZLDCeM02zCFe0AhfkiB6ZKFBTGFMrvFtjnI1o9XHoRkzMR/9W
	 3bHLdlWUMeKud9cAeP/7O8w172VAZteUA6V1gQnmUjI8hWKU5KhuK7czygQX4k5FF1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288292;
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
	bh=X7Lr7cNSvHJ8CLp7PqhgAANDEULejmyMHVN4U8HVLs8=;
	b=K1xFfMnfKiu7ZDC9Wk5MN+kVlSPHnf2iKI0CNJK5hhMBhOkHMeHreRcOpOuRhbhvXnSK
	 fb6NlI/NNQvDFurH7u8WLd+Hsv2+EPVXk+jleA9iLA3LZZPz3fvBmg4PNQG61hWZZYhhv
	 bh1SUw2oXkb2XZDpld/p7kcK9GvJ4py9F44L2WmlemB6z+OuvG08tDq8u9X6fTxx0ckdX
	 iMYfXuMBIjnxiEeFFg3VEtPL0lOB18sWab6MVhLEcuxa0PmyJYgNc6FKDuwL1eiiP+jGq
	 6edRS3hh/vMscFiar83fpVMW5FSZXsHAYsA8eRiI1uao49SNsLGJOW6X5DxR5iZkkcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=hsiZizCG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.13
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FF3606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95FF3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=hsiZizCG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqCSInwGIgFGklopvoknELVG8ul0zrMGifCZeFvgYk8ZtiXwxdUtiwfdTuBJ4EV8tSDGn7gmuyf4D5vVrY16TFtyK+459xYajgq73fRh1Cri1j47KrC4+rNopFGHy6SjDJoMEip2q2tgiIlDyG5JnxhZwPMHtMnQc8mhbeyVgusScKa4hTWwsfAbN8EAKRcsfWLXecBgBNnZ9k9FrIGdxmmywEVWw4FKJhQwhi5kV8lBSmhQ72Ecb2VDJvcRfnyxOpzirSlZdL+hcdxeH9SHtR39npjYUpAKRxhLlNZIWdncHhMs0nKWN5B22LQtVIiYxT2RwFu2d85VYAlTLJ6nUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7Lr7cNSvHJ8CLp7PqhgAANDEULejmyMHVN4U8HVLs8=;
 b=MgYTYBqJq5pabCtSSeSol5h650FteFKs4+frQwJd7dBjvOcVzKZ1TXr52rI7yRhFXTjeWNvjmOKqNw0rgP9Akxcr6ssprfHsZX5t1VaC8c+LCu/FvrekysVFIZGDnX1D2Zu++Ck5FAgOKeifmRBwVvc3E0tiCq+7hJjHHhqBhdbjbAqB++/cYfzHnttfNOHpAk+6g5rSV+V6uATxKBWCapAXPz5Cee/3xT2RSdBZUWOBAvL9WCZAJBKchtbc46eL5r6+Zs4mSxz5WpO7z+c6sa0nmFwoGVXhpVVyUXV6WsR/qK13iE7YQT7LX15z9+artId2/ooj6OftLIbXbQSxrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7Lr7cNSvHJ8CLp7PqhgAANDEULejmyMHVN4U8HVLs8=;
 b=hsiZizCGsuJ7xCemMTzCOj1iSNBTLGba2OVkeoDD4SByh45msvb8qnTUUnwQIJ+SljLNNqeoJ7WjHyt1OYtoSzXB9A07qLtXvBw+KymNXq0dBAyDHcobWjkHsn8xiFNsFLpF/bAr8C8PDlDwHvLqDr8N1I16mtsxK8aWcX7BcXU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OS9PR01MB12373.jpnprd01.prod.outlook.com (2603:1096:604:2e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:24:50 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:24:50 +0000
Message-ID: <87mrrhmf6m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 15/20] ASoC: soc-component: add snd_soc_component_regcache_cache_bypass()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:24:49 +0000
X-ClientProxiedBy: TYCP286CA0063.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::12) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OS9PR01MB12373:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed56fb3-986b-42b8-93df-08df3eeaf121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|22082099003|18002099003|10067099003|11063799006|56012099006|261102123227099003|261021121427099003|261009223027099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	FFGXuhRYnKKCXQoFIZmZmirqxyC5iDIZj8ZnhuLbpdUtmMUXkCWVT6lzzqisdi4z8dHIPEXzpAFXCtYdcpK97a/4KpW1lO5N4xDc80yfTEwYeLWsreuldAbLPpq2thNjYf7khK2iuDVRK3nbKVb5vvdMV1c0fSgKHotx69QwwrYAKWKZbooM6z4YCDNtVlAMGlXL4YiEsWpSuy8x49E5ZBf8NisOlOlnvYPwjCGtJAFuzIrOl1UoEAPLjFhmepP359CFNJWv2mxjmLyK0yQsL34iImreOBpHLR3D3JcN8a7GKmcPJKssfqizY4h5wOW7BE4SRzEB2I5W9dTZ5SYtWkvLGfbQrsn4yEpVTRnGhxjN2nTEcYbb18+uHaNpkRfzEPfvyUzg0gMX23EGp8ULNSM1AVCfWndR65+lLsG42EaeiX0IzRrvzd1qImnpwdrC90kXt5pi5cPLYleRVzX7j0TdYrWLSAvBhlHAjIlWp4liKLoFeUmXccTJxZBt1ue337y+9PONEwxJrLExFq2xjjQgTG8nyKgqy1VLZqy0aRBTimOQaAKI0Jz1U+runsBxpasrD8Ok1ZPLt8wW9+GETYHrkZSG8mtKpSUiDcTsyR5ABNJURICeiuXuWWBZiYBwXSMX+PmaoOtrmfLN1jXnlhSd80/1bsRadvmVZ6YEIx3duKBPWoegdeYxGmRG9P99a7BLjTA4vQZCFiVKCucZGFZHM02rTbZq5oz3Y0rhxXM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261009223027099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j1FE9KsUFZ37OcLnCE/v3qK3cpgjcjVyquq7llwJqGTgKCTVLZyL86RsXVVk?=
 =?us-ascii?Q?/F909s9pZWlQdeoLvr3NAGE3KfIIiF8mFr7njbTg9Y5ct09AYLHPD4wv9xB/?=
 =?us-ascii?Q?9pJkkPkThzQf6QynCLfoy2F00m/V9pr61GEDt5vQOHPtTAWDkjdzcExxEiip?=
 =?us-ascii?Q?ZF9gr4IYVfl5FiM8gUoAjLU9LKJQ9xKUHx6rYB0YVR1f32fx5KI3mamA1Etj?=
 =?us-ascii?Q?jslUry5EqMyCxxfYU55ecjFr9B6XvrVbrzdILCE/qdjip2T4UiVYLdxgxxJb?=
 =?us-ascii?Q?NY5/NSrUkdalOhycrBl1hGtrkrg+Bdw2G0Dsiq4Dkdsi288wFcwP/rlsbCNO?=
 =?us-ascii?Q?uWDFwO02uQs8U6r/OwUqCvyeNhyjGAyGEdEwdudfusV2jrTkDGnjfz2L5Emz?=
 =?us-ascii?Q?mN74PG8HeTgxg8Vvpb5xKA3ZI0bJItUmLjat1AdwTQIOdk5Klz3RaWdN93vE?=
 =?us-ascii?Q?3H8IviOsLqAn3m6nIeWsGL7uKgk16ubOx6Rd1bKIcdJiMrIyPgwfI8yfoaFs?=
 =?us-ascii?Q?RQtgd/EpnjifWLM1D5BwqF0Wv+aBXda+gNPCgyNoibiFAUhfrn6CL3TOEU98?=
 =?us-ascii?Q?kl+92b4nwltOXyrdogWdFu2tcI4kwZQY+JroAIMtJyRiwtUR2uj0vRnzmLaB?=
 =?us-ascii?Q?h5QCsUyal/ZLbk/Tlt4Y94ZP0zslhnNtz8OrfNWK9rOhtk6zJ24eq9OUCoIi?=
 =?us-ascii?Q?DPQ+azcW3Tl+xv6v/oSLFKv1O7EgFXSJnsj5jTEpZ1jSwNsPMsBmPH6TLeR/?=
 =?us-ascii?Q?2pUyqDpmk15BKGCvcxTmKn9ryq1bUouwRk6B3zSvEI20bZpbBrJAP6h1u1Oj?=
 =?us-ascii?Q?OlJNJw/KdSyECYzaxj782BRe445bLMMJzHbrFfQVr3jJeCFOAC5C5wh57IuX?=
 =?us-ascii?Q?53MzkfRL7Bkc+O7APJ5nplXooPBu+oQRCbW/exdj7kfLZzghNz/GkQptJVNy?=
 =?us-ascii?Q?m4oTYRKzEKHuoQX4XjFm8ttBouCPH8RJrlpo5Q8oIXOSph9lFbk4j81Qzf1C?=
 =?us-ascii?Q?jfoqgULHOa5A62rXKMgNcnNESjlHmVb2M6wVLpl0mbqJ3tLokzifLZ9Uvd82?=
 =?us-ascii?Q?bExoaD55UiyvuZ4HbU/DOixlkYoTK6vgiocJpmbZqghIpiF/ZOyhG01tPHQc?=
 =?us-ascii?Q?gMb2BxSRYJ+wrupm32CvbNFkyJs1sK/mm8fbOdUvZB17foYYWCJ9fmsEyQen?=
 =?us-ascii?Q?6LmCDxrfxfItpEp6bNczjzxq5n/yxWKi+Ze9Lm9klnPIwYY+DYaP37fmAbdg?=
 =?us-ascii?Q?QFTTXKM/WfVJxg7eo4ND2rumE//SF/WWvP61XyJf55o0FTJv/2lbgBJZFp8v?=
 =?us-ascii?Q?k75JhtQ+QFu1gQ8fxTTXeg68HGIX8J730V7zBo8rDIDJSST6ykgTHXo/k4uF?=
 =?us-ascii?Q?qTQJ9ysPLJd4vEyPxqnTc0bqa3qF95SVKd/CfFRe57XQuA+70UTj/VsTPLny?=
 =?us-ascii?Q?eNIv5b7g1AUjVtbfS2n7Mor/eRauavuPK/EogwhXRFVRisBoSf4vkmbtRpGw?=
 =?us-ascii?Q?93al4QfmYYVBVc6z6yRqlYp5QBZkUG+5l06nQEdbJI9AYeuPWjXEZ6RjZSvx?=
 =?us-ascii?Q?3jaAqh9syvBJ3oMUhMXx4naoKTjt/170XROgE9D4ytS57Wocqssu4bFeZuQj?=
 =?us-ascii?Q?3CDjxL2QXtfuway7sRSRZHP/1GqCd8jcsq2wD9bsUb1oflEyW6IC5N0+Yz0N?=
 =?us-ascii?Q?PbnA26TUoJahKZOIzWm6fJOK3WCUqveiRKcaXFPWSa5OByyEYA9pjZ0w/qSH?=
 =?us-ascii?Q?7w52inrh9rjS6w9208zT0OjAl8r7DTWgFebaharnaatx2OzoxipD?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed56fb3-986b-42b8-93df-08df3eeaf121
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:24:50.0021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpNpo1HwqYx10FbLf+b98UKq1jLtiXDxw+0wHtt8wGerrGVp2Xby5fGLu7gNd4zrHDEt+dxtMaGxw80f/Ww4V903zereqPauPawI68U0bZp1S9Dj9tCt8WJTLCvpjqlf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12373

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Adds snd_soc_component_regcache_cache_bypass().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 5e43d559b2005..89ae650b74f87 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -514,6 +514,15 @@ static inline void snd_soc_component_regcache_cache_only(struct snd_soc_componen
 		regcache_cache_only(regmap, enable);
 }
 
+static inline void snd_soc_component_regcache_cache_bypass(struct snd_soc_component *component,
+							   bool enable)
+{
+	struct regmap *regmap = snd_soc_component_to_regmap(component);
+
+	if (regmap)
+		regcache_cache_bypass(regmap, enable);
+}
+
 /* REMOVE ME */
 #define snd_soc_component_init_regmap			snd_soc_component_regmap_init
 #define snd_soc_component_exit_regmap			snd_soc_component_regmap_exit
-- 
2.53.0

