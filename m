Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288290;
	b=OSqcuDGyctSb7RqqXRKzKCLPXAGVFeBRNWSr7j77FbGrZL57Fn11SSdEuDCbdYIL2mra
	 rv5IfmXDzFoncETHpzd6H7cXGJmSm7Ki53VDXQeW5EWeRN8zL4mc5bcL2UoNIS6DbJZl9
	 k9FZDe1ZajSGTPtkpAUx+tPOmV3MRMUgKdGLHVvUIqw/29hKzA/8F0UU7NfCJW5fuXCIi
	 tFp43qchjQ1iFwbInp9Rj440DvAUsRJUQiPaV7W//ZR6ERYsA4D1fSRXeL/gznBH4dJXS
	 bgnLW4xOBvrEBpb4rGsDoYK6R9zzGa8O1I6/H2d8GCahlcSi3gDB/02Fu+aZatnB15w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288290;
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
	bh=2hLc+BctueqzOEY3NooEVF4cH2E+xcLVBLXI37ywnm4=;
	b=E2S62SinAs2Z3YjANvve+cYYn9ethvRy4i9ktgqoaWFxB6nzLc4VNNIvZX3oeUbq/SRu
	 swjJ6ML1iNaOtZnXJpiQiFjaH7nGGYsgtx57pAoCYZ7/POCFElqEDiSln5ObJPZXC92Zs
	 bQFPzrhqEPDjOPNqCrTjToMIiHwtC1qoSBMfnlYEjJAE68TPmmbXZfRDaurMy4a+REgfo
	 gWV8G5CRYd5+BKwDVo4zdy0Iu/dXwQRRotGPsfkm+Xu2Qc5TnF9CFnB6uqCi/neYeGGVA
	 1KTa3KM7AHAsDndntZPPwhiGAXrbUZjoXZdxZlbS/4TeLeqGkrgePN0p7rpInRRpHfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b="P/FIULwO";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.28
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011028.outbound.protection.outlook.com [52.101.125.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79810606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79810606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=P/FIULwO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFkLCO4G40QCvUCYFOPD7ZECwcbdl3E5wF5UdL8CZDawht4BALhlUG1dsX3WGlxGlyYvuyXMBeikdL2eRYVEyyN9OnNx4KjpbtsDzBvNtr/MdzSa+xqKnl7GUj/QGqw3IJlMcW03Rt2Fz/u8yK3CS/islpflfrcb22reBORmAe8BN3usj8b6ljg8a78tv/kN+SLO4kssTQR6RXZyoG3uMNLBLhkg9QOASVqkYA8zxPZnj7Q3P4RLaZnzm3v8mrZCvgyWGlrIWZwiq8INgr/PfgHPt8vkCn7ciRuXYFA6bc9EQ0XZCOpDjFG3had6uQLgJFEADIhVAgNFFy+ULlyIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hLc+BctueqzOEY3NooEVF4cH2E+xcLVBLXI37ywnm4=;
 b=dpGSVx8RMEJWqs3QkyUzcFrKwQFfbv0/0C0mbmTAI7+99/dqgDGJU4U3gjgL1YxYQTKNKJhZUcKjTZKz21hnKFo+9Quy5SiDc8lSOFEuQ5vUapHDAZ62aLJg97d2+QFDSQkxbspEYuWuaKIAMSO7Tq4+1B08OmgHdujkTTedQCZ+alq7/FkWuiJ52zpAUWn4omdkqwxxx/ZQzefbkvD3owka3BsmxoShuNQkgHY9+j/WaoF+4iUaQIoHT47eWBPg74rBsqkRvsIarMB6NUYHqO5ixdqf5QLscQGvGs6TuW+E6CoIfCaAsTubUBXaoy94vOAI3aKdCirWf+ZLclFQWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hLc+BctueqzOEY3NooEVF4cH2E+xcLVBLXI37ywnm4=;
 b=P/FIULwOlg4IarqVarzmpvoIz+PyLfjovXQLrqqndsEKD2YYNM6qJma3L+WwJ7zzvZIWPd+/lMJMng5f/nU/x5vbgOtvCbllgdeNG5HqFEwSWKF6g1AbuINFEF2+nEwKyWMkxujxFxuMhusc8XbwPtLf30aq9eDjvw0S67s/1Vc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OS7PR01MB17825.jpnprd01.prod.outlook.com (2603:1096:604:441::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:24:45 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:24:45 +0000
Message-ID: <87o6bxmf6s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 14/20] ASoC: soc-component: add snd_soc_component_regcache_cache_only()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:24:44 +0000
X-ClientProxiedBy: OSTPR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:604:221::19) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OS7PR01MB17825:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d3cddf-1e9a-4233-78b8-08df3eeaedde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|23010399003|38350700014|56012099006|11063799006|261021121427099003|261009223027099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	50FRFwkUtlxXeYEzQtV3y8Y2wdS/gyDo37OCIF13ksu+LirlugG4oQCWya4/7C5tJaOMiSjjvlrabZpv74MP8kBoHPxeQIn3xmTJ3mjySiufTFnPudivfkj9KdUE/XFoEk6kxa8Fi9oqee6ESM3L5ZBDum89HOLBMTyn9s1dfPweVQHbrWSH1mfufcnnciS5o5JpRUU+9Ss67VgjTcIST36C3Bbkk/ANMgnXhN2Aoh4s1hBnAgmS7qAgQN3113lwAsKOg+oj3AI6FC8DrRjXRwfhMequalYKrOqSPW9WQcBlBDK7ss9nDG7QfpJU2gxAiA5WyPh983hF3jFy8wf4osWrND4bzSl23zwz85zOGxwlVKR0O1afWw5vQgvEFL6N5JsvRi+L0lkAA23zpfAWgNxXLNHqjrRc/hRt0fNco+105pnQ+AkLddWOL/4yzURfPNqV2aMiEpYkHCtdwyUPCWOkNMBpWlWJWPqG6vC0IcJWShnpEJxDusEAoIb2YnBenqOrbtvIrgxf/6436bpSkZjDo/tF+TMQSV/euqMiuE4lS+jzWjtMRuVJ4nVb7ug+kPn2gbn255S8MUKyclOp/yW38I8z2p99x1LRekHh6DLCh7bWuRUOvrzcgouv5PCflzYDF0jqybWkSzUf72GhSaWYrYemoMddi0Yynt1CnZbLETqUOQRUGtyLv8rQ11CTSnJWT5OKMw/nOkr41QVUNFqTY/HilHut1ml2VtkSEH8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(23010399003)(38350700014)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NuxHZvZNbL39OVL/dkXFO9N2zS/0XhFcy2JPhfjGuINv6lR/F3i+VjoAcLER?=
 =?us-ascii?Q?kAXq8kTPuSjIJHh4K0qbWs99jCSZk9mOy+kC0sngAzn+JWYYYAhPeJXmuLle?=
 =?us-ascii?Q?niffdRqVsKQZ0BDFucasdQfdMflhF6/s7HDptdafNoTA5x/pVDrbTVuRzh4N?=
 =?us-ascii?Q?DpPQ8d2A4MWVjpUulM7v0gjVD6ZXkNe0oOolu9ZZAxDaF6vlaXEl7PbKGlgQ?=
 =?us-ascii?Q?q29cOQIh/SHTT6is7naGhy2IGa+qtOQooLmu2oHW/6zfX44EIoZrzFQiScMn?=
 =?us-ascii?Q?PWL/HwReKmWSJo2vLH9frbGvgvubBkMsEZKPF9FCFCXf84McIbcLU10uykul?=
 =?us-ascii?Q?zRIw7oQCgki9pvMmd3oZ0MjsE1wsogmriGFuQbUd86GHrCzUpueljprWIYiS?=
 =?us-ascii?Q?arflmn1xsImsJ0lopW0GUJ8+4ZMzAWVZhLEwX6arlTS92dM0EyGli0M8CJoy?=
 =?us-ascii?Q?Blscr+ZhSMhcko2MNCaOC/MkxeEeIy/ur1d9Exo9lMoTFkBvkD4BSII6VM4i?=
 =?us-ascii?Q?cpph27JJGGfL9WWiJ30jC54A0DK1F1tW0x8UG7eHjoQGM4bV7JP8PEpdxrZR?=
 =?us-ascii?Q?QysNF4A8vYJqG19tuXyAPfIjx2xQrvZ93MYlqacIVjozwyBG8w0rNRzmTRvf?=
 =?us-ascii?Q?3xfZR/oc9p8nGoReXyfmwYEqwPMJ8Ac0LD1wqXILfjAAFFBlgBmjQCqXnH+n?=
 =?us-ascii?Q?4r5x4Kdz7kKgxbe8YzmRFTjPnqvQlWAf1N+iIG3wecpG5fwa/u5N8tQeNTcI?=
 =?us-ascii?Q?6ZKWlz9IC4HpC96MPFzn6EGsm+wI1AgWRxpgEC0C1oV6wA2bOCxvSgTaT8qd?=
 =?us-ascii?Q?rAi97tkpXQNWuV80AetvkBKo/CGnSXaT+8/nJrsP/In+z1uWbRTItJf3KVGE?=
 =?us-ascii?Q?Q/MOpJ9orGA5kbsGnStAVGTkT34ve6pM2yxNn6Rr17Pw04jJUCdng0RDYLDW?=
 =?us-ascii?Q?mS7wLRkRXQsH1yKgdBZsg0y+4dT1LsfY4xlpVc5JVM29KnQZYCVhP2RaXJAi?=
 =?us-ascii?Q?n9HptySfpOPCJs6arDaJ7WnU8U3gc1nqMP7gscXgRPXNAjbN9uFx9tZaWWlY?=
 =?us-ascii?Q?ZGQvvS+UexuhgZu7GmjFIiHfm0wa7sYxaWv6NWBL2JE4zphQB1WHYnHpjFdt?=
 =?us-ascii?Q?h/8oS4GqxnZh+rKBaU2eN8WptDHAC6OvyfeqRSQZt7YyLY2hMqpJ8x044Eoc?=
 =?us-ascii?Q?0pGIX0b3JSRcHMpDnLRMrZT6Ez2wZG620HfJWUecn/b47tKSsW9CjZs0ukbm?=
 =?us-ascii?Q?478qsXp24gDYlUS0zKgt1xoVYQEJ9upopcKxC8jqcXS4plIBo5Z9dh6hvy4i?=
 =?us-ascii?Q?ANY/ZU4/JUhN7hLP5zCNRSRFkklDX1hTEjjkp7NTvi9Nv16QmOPghUL3yJOf?=
 =?us-ascii?Q?QLtZ/Tcu+A/v7RYSwOmc3knG+eP5uHW9f7h9l7ORj6bAWCOXsDagg7kV2XQE?=
 =?us-ascii?Q?n2hsSxP+yb0WQbhG78HN6KoUgazeqt84VNBeznjThnC3IISLgIh6AfKWI+gO?=
 =?us-ascii?Q?8IVuY89kJ/IPtNjQzLYkY1YdKFMvrNGpaeZW2Jg+2MnRs35U/LFd2NG9cg5o?=
 =?us-ascii?Q?IOA60Gqxeuf8hi7dHnzhIv++SDb9MQjTUlhiiK98ezEYbC0tEAzT2CiRWKjl?=
 =?us-ascii?Q?u7S52sqnBUYxBSqovcbIqeZRpTGzZeQbM2azq7tUxMWEGECVqwU8TR7/xIFO?=
 =?us-ascii?Q?cIS+zKlPIKI6pbnm1mn75ejjQejh41qhfQOpzM1Wvpq8RyhAWpq+3b8Cysqc?=
 =?us-ascii?Q?zYq4JtoTpK32T3oGzsQ49UsV1n7i8e7IK77Xg32PtWtO0AQieEmV?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d3cddf-1e9a-4233-78b8-08df3eeaedde
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:24:44.5367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwmT7ekRo9bxbBv8ZsAZVPsWaCQ04Ucn6xCiMRpdGZOFCUWjovXX1QhR8lWJyVLuIBfpX5aqIi7iCvBhrYaHOUYmci6wSDZprOLydmHiRrVpkQWqVXwrQrGNkGtRojxn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17825

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Adds snd_soc_component_regcache_cache_only().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 25b25389bf0fa..5e43d559b2005 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -505,6 +505,14 @@ static inline void snd_soc_component_regcache_mark_dirty(struct snd_soc_componen
 		regcache_mark_dirty(regmap);
 }
 
+static inline void snd_soc_component_regcache_cache_only(struct snd_soc_component *component,
+							 bool enable)
+{
+	struct regmap *regmap = snd_soc_component_to_regmap(component);
+
+	if (regmap)
+		regcache_cache_only(regmap, enable);
+}
 
 /* REMOVE ME */
 #define snd_soc_component_init_regmap			snd_soc_component_regmap_init
-- 
2.53.0

