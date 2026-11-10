Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288262;
	b=T3wCf2Q1MpuGeEafXwyZTTBR4TE9N0qDF9blsMPPa+jsefkkRuv+JMxDOMVV1O6UeLlS
	 l61V5ME1lrGA1y6k5cMlAGT+/yCR1MBqcg35N35r1U5j/s18FqDDH7OA71YGqH8ToG9mQ
	 LDNxCTFwDHTVFdciWz05cAAxDMb5tBi/u1UTYsVJ4wbjbQ/ElZpQEO0i2lLzZrcn7CEgK
	 T1LzBrzvPYmiWatRMgnJc/QIqdjXSYDwGErPleglGVpoLdSzyEnN4lwm2ffVt53MynCZg
	 gz2e6qco1XfJj832aUe7LorAA1KUZw3yIrdhYGk/qLmriQCyz6gTRUw6FA+734Cwbow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288262;
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
	bh=yrhYdhF0EXCPm9TgrhOXRsaf88++pzFzl5J8QOq6rMM=;
	b=rx2kU5BADnFmp4IR9gHHyvjCXsOXcVroOrPTse7xK/HH5QHHZDvYQpoNkycEyiHm50Uq
	 oKqimQsF2Xr6yWTtitqF3SwmJAHKNEkeh1fUNkA+CPWav8eXa9soc5xr0JB9KIg+TsbQl
	 j5ludVlEUK2w6+8ffVQi85mmCmzY2FT/BKf1Xn847lZJAJQROZXKZOzkrmPMUUCJ1fiGU
	 v/hSgTyp0uhJihvQKdJ0fEolzdjSsYGWLk5dRUmkosRfDw8NCeDr2gAytmqLVG90hmrvt
	 qh1nj9f+2h3SFeTL7d4LGP29LvmaxXeLrID90ko4HaFyTkhxwXoKrLhxKM4W0rCweTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=QUFaBB1y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.16
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010016.outbound.protection.outlook.com [52.101.229.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED00D606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED00D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=QUFaBB1y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Suv2+lwvdx6CteCUt5qf5CMk8ubxj0xCGB0jiynUBLHFcliE36Sn11xVxuatgIUCNWzTLmojLRqH9J36fTjkJrkMUY+zAOhxHonyppPI/JOF5iqyPJz2US1lQLO+bQea4pEGPG3kj0ur8/ezaAHo5JBgghCNZ/9KleBeZSxCy1RV4dYN2CNInFHij9lkh/txajlc8rqE4cWBsg2pOlI/IC7OyOpyV7E0evNqpEx7Jmy+U+z9wA2g2Ud06sa02GI+TYsOZZstxao6oi62pQqap+uioZtw0qxKgirGvQyVN+JY4Xo8cj6EhcaVbDofP9xjS7Ce4awIx+iJT3eRpfY3bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrhYdhF0EXCPm9TgrhOXRsaf88++pzFzl5J8QOq6rMM=;
 b=hW4HRNElv86VrYlwUf5HjWaqL/TmbAZSeJzLP5GznkvAHuTeZfogGJLcrpC4ddikInYTc6UeeFsTwzlkDF1XOMrOirVG2C+qqWAbyhKnWYzHfyww1Sxrhq/8CDhRjXFtH4NI+Z3YQ45Z3QsYVfR3WTD9UcEGFEtObNCqVXCZURYKAwfauVrXjjk3IJR6mVs/hbp+CqP4O/qxJ9cSQMiwmFSw8H28mweBLyJppsl7jz/uscJAtSLoe6wPFFQ3ObJYLPyxH7SP3jOY9ZUb7zHW7cTqPKtjVLb85T2PTTku6+vB6ZrU/SLKMBdfdHw9ND10MqNfeJRPr/BzoakpE9PFyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrhYdhF0EXCPm9TgrhOXRsaf88++pzFzl5J8QOq6rMM=;
 b=QUFaBB1yMbVZKVv41804gNEjBM40CWK27G7hRMLJPM4vkDv75vRIcgMD7SGkw5/Zh44ZkgxBRpmNLT8DqN5rjbygy+ZhgyU7YjUL2A2mIVT0bGLqb1zQE3B185ij95+Dby+pnZhVqx2/DOmYxri1X7C9eaDQ+nOh+q32yLOJrhI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OSCPR01MB12483.jpnprd01.prod.outlook.com (2603:1096:604:32b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:24:20 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:24:20 +0000
Message-ID: <87v765mf7g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/20] ASoC: soc-component: add snd_soc_component_to_driver()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:24:20 +0000
X-ClientProxiedBy: OS7PR01CA0231.jpnprd01.prod.outlook.com
 (2603:1096:604:25d::13) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OSCPR01MB12483:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe20326-181e-4720-a0dc-08df3eeadf6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|52116014|366016|18002099003|22082099003|10067099003|11063799006|261102130727099003|261102123227099003|261026121527099003|261009223027099003|56012099006|261021121427099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ZV2Pq5MYpnkAq+MsGdqvuNHwM5toG8yNOw1DRxf5eX9MLURWyQI26/b30CCOaT42qZ5QwNkfVBw466+YUlKAk2ndAySxy0Ch5S3a9Ix6iurZZq2BgCyfI1thSwCNCjM0IBOBlo2E72OA5Zv50VskK3u59Dc3WLFLjP6giOCBtfwSbB74rJMCFIJ/RcQU1nLYBEsbWIEavdx9iQcQhCjjOs6KUzfbujjlpEfvOlGJI91t99SRCLgEgszy5AU9CYBMru0hPGfnwcAefax3k1EajKBRhvXLxtR7HBluuXP/hIyOQZgn7EI6L6dHt/Fy4j5ne0y90Q+xlNYbBJNJ3uJEuV+w0kASugShULaqr3QY9d1exlI31Dq1fVusWD/iOJL9NG23cLmAutzdKlPrcBQkekiYnXEbnYm4aCl8Pu+n5DZbEk3JYxL/xUWM3Ew4myMRwQOEzhRDS427KfZsTFIKod0eGx/EcEayYT6KNr/S3rHS7Hm5/9shHd6j12o/WaQrke5NxEOWpxgxLPGs4CWqXf3X9nb79rnVw76EhvoUy7xl7Jd65509Nb77wsjC8WnhcICt8GIP/3mkbx9KeJ8o5rHM4AYVElg/OdkTnpEZCImDfciQZEKQPQthvU5uf9CagBsKHwq63mJjwuv/Qe5++UF6P9PZPNrGWG9xtxN1PyZ0crRXbgYdiHxGzFGLmIeECC7e22vnETgNDG0y9nFRo9wpphP2QD0IaRe2+bJPRzA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(52116014)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(261102130727099003)(261102123227099003)(261026121527099003)(261009223027099003)(56012099006)(261021121427099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sin9xnZEAyi+iK/0ewebYs5XIznkf21CPkEo+4Te92im4fkypAdtmzBHcGZX?=
 =?us-ascii?Q?NzfccOWy5BvHgYe+gkBqWxUn5LsPcOKc2jAcmIptYuQEJZg08HJ8NGe6SaEh?=
 =?us-ascii?Q?rHkfu5liezhg7lDXYiWrOeWXLC0MuH5btVTX7OIvd5A4VsKYBAJCZT/wkZ58?=
 =?us-ascii?Q?EfWSm55R2tL3F02ht5sVZKFAVtcegwuYUMz7aZEci2Pi2r+cTWMzXAY5kSm8?=
 =?us-ascii?Q?ZemoO9ujqCbTsBt3Y4TSvun/y+vK5JGpUbforEH2DaW8B1+N22jUPkhM+/o5?=
 =?us-ascii?Q?eyTtOcgAq4aZWR88zrMsKzE+kErpozMDSqxSCm9/yees2IYunwCqHC11agmo?=
 =?us-ascii?Q?GVvSp8zPi7m/+P2t/3/PpISnXqqsL6vuL2vGC197BtuEF0HyiUfXefJzJqsB?=
 =?us-ascii?Q?trOZ+o+Sa8cWkxqRreVpMrNNuZn7KsjDvpAtfZLprlQAnYhs3aofNkoRU9yc?=
 =?us-ascii?Q?wVd6NFqaKhSmpkLCA3g/zScKHAfXt8LIzkdZVzxQHeZdnTh7iB75w/SScqZ0?=
 =?us-ascii?Q?dJdbspTch3/8Xk/5JflLLGdtjy9UW21wT6m134uPtEfhxlibkM/HW0WCmUP3?=
 =?us-ascii?Q?lL+CG+8vVneuS1KniFI5Pv3xwAB39iCt45pTUaxm7kbF4fM5VxQQg1bHFEGj?=
 =?us-ascii?Q?XdO/POS/VW+He0Uu9g5dLVmhMt2eKmV2qs9V320nY5D1C61Y+Ag7bxqmeAi6?=
 =?us-ascii?Q?D+BTLPxtY++T2tv9X4eGpX98oTteCt5y7JhOrFfT99iwoQW+aUduh/TnPWmr?=
 =?us-ascii?Q?3toIXXRVnkOyCnO2RfQHr9L4TQRtw3hCBDUPy5BJMxNHHRXel6IV0a7ofJgc?=
 =?us-ascii?Q?6y1NoPBLBZc4slKCDBcur05aNcqdZ6whk/HZpXbQEAGInfMnd/ksUar/NTCJ?=
 =?us-ascii?Q?tSoCBR93Z00AM9MQCQ729L60Rl9QJs42Zi5cFa2EB1WxCuyXJkUU+PEFFDZW?=
 =?us-ascii?Q?wmEDy2AueQtzkxY4mSxyaCHwxbOtcpyvaaOCthDTke48aLjzUYGhF8fVdhTu?=
 =?us-ascii?Q?ccH4h5aOrnO6bMGBpcglQf7+32spgG6//0HMViA9a0WJsxwDtFSOfl+Ga9Yo?=
 =?us-ascii?Q?OH4gDGGDu0wDkKavwPj7lwDz3r8G8w3RJvhQYu4om7Q5hwJH+Ru3N/HCeV68?=
 =?us-ascii?Q?BOw/hWS5H7TGZl2c09DqZzZBVSfY0Qw9Il1r1uzqPDjyy6WIlWK0hX2vdhIU?=
 =?us-ascii?Q?pebDjryR3LfssaquAJfcg/C5xRLScfjcQ2HKTzhnVW9jNI6gEQfRFkMjb18M?=
 =?us-ascii?Q?yHaYthElzdEb0d6QZ8Vx655lNBL9KNDvnDA9EbtBeckG/V/KbWeEGolMwxtM?=
 =?us-ascii?Q?GnnDrBnoGUPw4YtYWR6RIQh6s34SV/Hx/Z6eIyyUiI65rOt5iLld2LcO+G/K?=
 =?us-ascii?Q?/zZ23PeKIBdK+QD1/xkTTljPgDoSPugmaNtP1X7mKsZ08bFJpxR604VcJFqH?=
 =?us-ascii?Q?5ncy8eN9SPh7BgYqIQDt7pgxiyRiFQXFRVaRfYtdsfxU9+Ig8Q++FZBqNmaG?=
 =?us-ascii?Q?ebyz3woiKZVMcpiJ8uCER+f12bXwjpFgiMT+70+5au5/NpLdxpTTSibzqNMs?=
 =?us-ascii?Q?nO42fByzU5TX2GkGfYnhq0jMEjQWg58rGcmld1AKneih/klaFaftzcJj/yLa?=
 =?us-ascii?Q?4xRkcw6ZMjGP0DvZUeV2uxlGCQDJA7iAbMdt49rs7H8IZMf2JapoBUBlNGfL?=
 =?us-ascii?Q?Z1aNqs61BUTYaYi2aP8S4g2HwXr9qTRshmB8m2jgEQ4bi/6y4kSgAk6j6VYG?=
 =?us-ascii?Q?7dThzGYe0C0m4BFW9OQ/blg2IxsTwRtkPeAlw+m6GYrx2oGcyO1F?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe20326-181e-4720-a0dc-08df3eeadf6f
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:24:20.2876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6Ro9rhxyRuvizpts0rVxuHcVo6ie4/q5GoO9ZfCHuXFRrGFX0qQ9rCS+Fprh87gfAe36+Fo1ObzMhZ3k1QGTWV42rK707UXx5/Rp0tn+uUEqtPjEXhYHBDHAbcXiXXI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12483

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Add snd_soc_component_to_driver() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 2 ++
 sound/soc/soc-component.c     | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 960645fde8e31..23a41fbe55abc 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -274,6 +274,8 @@ struct snd_soc_component {
 
 struct device *snd_soc_component_to_dev(struct snd_soc_component *component);
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_component *component);
+const struct snd_soc_component_driver
+*snd_soc_component_to_driver(struct snd_soc_component *component);
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *name,
 						const struct snd_soc_component_driver *driver);
 int snd_soc_component_register(struct snd_soc_component *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index abb8cc843662d..e42e5152a9f93 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -73,6 +73,13 @@ struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_component
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_dapm);
 
+const struct snd_soc_component_driver *
+snd_soc_component_to_driver(struct snd_soc_component *component)
+{
+	return component->driver;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_driver);
+
 unsigned int snd_soc_component_active(struct snd_soc_component *component)
 {
 	return component->active;
-- 
2.53.0

