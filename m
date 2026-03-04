Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C129F37FF4A
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605404; cv=fail; b=NJ4ppv7jX70p/Icz7Y5P/WNt5Aag3E46eZyYJNfSC7ADECrT8K7OQz7OL6XsN+Kw5jwTUnGIz6DZ+Ywg0V8cOiNNvAn13Li3Lshyea8o/s31yFxAxbIpx6ylUcJJJcSYSlGHfuhpq8fOKiQcAbxIRq/IB6kcp510Srvw2bgzcqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605404; c=relaxed/simple;
	bh=WuUw04zVmxQY1F4dGg+QNOB1R2R0XMpT2Gih8V9iAsA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FUzyeDHl+9q/CAyM3EP9f95Yzw76tCJSTIWeoRxdDMKQwVCEJbDZXF/G+8gvebgozQwzx/rQ/djzdorj06MDIQ3fKYJ3Z2R2zt3gdOiYByAeUqpa9LOoBx3qL6lm8oysL1+Er2hAhgcLlHGWSOp2xAyAXu1JO8JyPGy+2CqYxBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kg+9Zsiy; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kg+9Zsiy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUj/S9EEGWpzpQpG6eZ3eaUARGQRqs5ul9JmnXjXWUIYas7ekcCKfeHIhJcu1jLmU6q8JmyE+lw91qV2yeWpdO6pwMSZkY/91nXEWgZ5VwMSL9CZI/UEFjQlTmXUAEGd6TSMvUxkBmcmy7jH25bJ+KYxIDApNwKy8LI86DdWVIPXeCPs6HW+PVquE8vLuM6YNADPcK1L5saVNCYQ1prxZVwdr01l7NODowBa+oyUXsNX5xsOuOTGJJFapx594YcVE2cKFhAwadwoRboM2MyCYL6WGSqZGSZgMiAmb/lJrbjeAsR9gHD/aBHm7cOvia+UZk6CB8gbtt+txcm516wm5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSKejLoYWhxaUICxD1/Pg3RJNkZbAKALeD8ZWewAV3E=;
 b=K/qEuWB/BR/q4zjik2yCYX8fojiZIEaiGiXo+F36xUbCKNvtvhW50UyNQ5uc5RqszBIpjAdAcqusjffM0pTqY86IRS+tGxZe0oxco/CTAXft9pcdwpK229aN8Dvrvx4wX1DRSATF1i1x7Z/hP4jr4R1OcDzjz6B9uzxMCK66CpKVnd7OiiepaUQOXSBiR053RZZ3AqHlkaU24U11XoOUk4wOCvDoSEVEDTHGooE8BoLgZPOj0385pFNxuPaL7ZXWJpXY1Xjt0SMkBffnEOS5Mgsra3bXShiDizAZ77UwC4ljBvTKtRXpFLLsf9Jt3BtSe/MDJ+EVJaDof8hYpIK/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSKejLoYWhxaUICxD1/Pg3RJNkZbAKALeD8ZWewAV3E=;
 b=kg+9Zsiy3+YaKRYXFFis/0Usj7/haiWXVZYRBUEgCtkJGvYM0bOHO0dPd6Dvhd+LWtRDPvJ1qe0cUGK1qiUdahurx0sbm/BcXGXLHLdk8iwtmTIoKEUnz6ePBmhd+sBHplvElBqoAi49Dp3b5fLa4DQwyskVQUtiflgxDhTX4EI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:23:20 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:23:20 +0000
Message-ID: <87ecm0p0yw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/29] ASoC: google: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:23:19 +0000
X-ClientProxiedBy: OSBPR01CA0114.jpnprd01.prod.outlook.com
 (2603:1096:604:71::30) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be34076-284f-4b96-416b-08de79b6878e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	DtyiJzU3aYgvz6OXEfvekxzE98j/jcOVhvw2jJIw5Ps+50I+2ImzR8V3jd0qluO7bpjEhHeg1DG5G0eFVDIMXa3qAo6C0Fez4JVvb8YGju9YtJILicjUSy2uqZGpHWc+javbIGq+Oc4NCnwJ4f+okgDIkiYxAHXQF9HzP7peqPqbNGsgm9Dg3odV1V6VJrsnSmj6VEfUeCgbckp7BG0vn29Rsrtl8iE3w4Y/YgJblcR474WZQ5IQnLKYvkgdUAN6evINWXVp1DjwV82h86F583Wvxf0bBbaZPqJZ1XOlv0e2CnNL6ZnRFQ0esKxbZlNY4F98n70yZZq6uKcIMBTSg09rGOzqn2sp3WL986BR3PGohG+SNCWfy03OqJ4OOtE9T6NB+/nIjhZBw762uWu73V+arCrQPTjWJX8+1Mv/wNqZszyEFCBpfdMo+9HYaCXwcUvPIPlDirj/uhpA3mL3PL3iDwoOQVoxWPAGz0lLe7/DLjK1w18YdO4PQDVVCPY76GVjZwuMaQSNUIvk6R5cPBfErCE8FWY1NKnI751+iLszbMC4h+/piluermkcN8jp80tI2OJQEII5mTTQ6x5WaKSo+CnSe/z1cO1Jlbdd4mmgxN5AxCQRv7gYWg3VuESMDsKn5HTSbQJCQI/NRITOugSJo+5HKRcctVGFaDC3J7lY8duloijCZao4xpe2A+kAXhVTLxDTG3k57mDhjrzrv1ZFNUpHpp1XiG3m05CrAnrGsgx3qn2ng0PoF685FrgKaRtOOhA+fRrWw0HC+grC9g99aH/4bhTlBuA4NTqqzkg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FdVfbzhqu2P586V8lovu3jLfLwhCQeRabl2OmQ4Ax5oFk+shOg1DlN6So+dh?=
 =?us-ascii?Q?8BbxHVGeRVO91My2WnVO8SiHk6kSkbTIIfBk3JjxmSBq6vK7I9zYaUo7bQHL?=
 =?us-ascii?Q?xzNaqM24eP0mOSv5WotneRBi698oqfnQN9NAJc4vJERlTb+V75pQvk2E20vz?=
 =?us-ascii?Q?53cQxHr4BnJ1hSTYeiQIlobYkm8AfmPsj+r0kjeoxIuR601EU3N4ogK+ZQOl?=
 =?us-ascii?Q?53u1/BslMgRTkgtneAn0nSvxlxgSdbGZDzDiMola3y6rwHBfQ7wckkYOsc9T?=
 =?us-ascii?Q?YIiDFJXF8a6iwEovtDZLM9XwlIsRnCkNWS848Lg6liUedZVESwcPIH6YxVCj?=
 =?us-ascii?Q?YE5Dmd9MYRJUbkz49ZOeQJgo9u/rOYVL45iuuRMjVoWsi/9CpVuKlE2eTiYd?=
 =?us-ascii?Q?F9KtMRug7kR6r+3oekz+9VTaGakwMzru5fHmlPCDBxbkfQdJTE8qgR0FwJt0?=
 =?us-ascii?Q?4kaee2RXpoEurHpyhmnkNbcvnuzFWf/HFagMHvmO9Av3x1T2+fuHWDRyxvEc?=
 =?us-ascii?Q?WTeh6zPvSB5mBNHJ8Hwo8vjU0HSXPfhCLdJSLh5HftYGl/VCdf69lewU7mBb?=
 =?us-ascii?Q?Tt3cAxu9FSaBEUkZ0g3uQpbD+9PeoSXqZU+cZmcwCCXAG64cBKneYQo59Ju1?=
 =?us-ascii?Q?j1/HeIvLFc4Rv7N+VSWe1Pl6ZySGTdDBVmQVkbDGjz5FlP+poIKQsuVC8fSd?=
 =?us-ascii?Q?a5VgcbvHjnmVuLlYmPGnrk7/hBN6bHgHN9ASYKPZ75fsEtZ+FsZLFFcrr3wj?=
 =?us-ascii?Q?6nWodA3PV+mq++ILBjzMpnRjgof9RsNr2owYF55RAPXPTcWWpw30bGbdmpPD?=
 =?us-ascii?Q?GaE9a8Cqv0hXwue3fW3P96a5ZF/Qwhn6/lUUthb4MLg0SPzOXYOWNXpt6rgs?=
 =?us-ascii?Q?bMYAEEFgSEWHHjzZvZrptwDKJYBAYIi9eYs2rQ56Nm43dYIIO/qQywIkbC4V?=
 =?us-ascii?Q?W1OebL6zWU0EFRH53NwakjwqfCpywkmjmiZNk8A0CXA/6lLv5JC2Qlh5C3+7?=
 =?us-ascii?Q?iZI0I1zaplI8z6om7vl04VDZMcMxx5IyyOcqoldAyc8swOvpVbxlCTa09088?=
 =?us-ascii?Q?y/zQc3zVVc17ZN4UAyntKJNjkhyUIGti8SHr8xktW2Hv18TuQfeHYyxvhN1x?=
 =?us-ascii?Q?VFJcLQ1EikRtMu9aEz3kpGOM/Bo3fBmIa8eQWGibdpzxM+0sUC90HPlTmDw7?=
 =?us-ascii?Q?ruKj6odqZtYAOtzXcX0YkbwyrmdqyrMOkDX3Dliiz0+8AY6GCw4uJiHq11R1?=
 =?us-ascii?Q?uPqHhvGz160/tM2f1Ha4xBdc1fJnRfPcyabF50bzI7HsbmOeRwAmq2jiy6Sf?=
 =?us-ascii?Q?957UmfK4Lik9/jPkfJeJey6ZC/8g9nT403i4jIRK9Ja+KkRt7E7s1veOggDi?=
 =?us-ascii?Q?8OekdOcL7QzNaVyAnDST8Uznne92VOGcHYxBq2X1nN/JRn7PjVIyJwe6bX6x?=
 =?us-ascii?Q?QwAmHrBsw1bFkQB2aiCNpBxa3CK7jZvFPp65AMShtJK10Be47qNL7a8Rpd25?=
 =?us-ascii?Q?HQ27ZlE2UloRu++/t9g7EqvrmS/j/jGZodadvc2nOwtWbeXu0mSmAFm9jb52?=
 =?us-ascii?Q?eQJ7FD6ObG08fbM3NSTHY+zRT2FngEpKs2SGDeyW76SxNwzsxLL+TvajWfn+?=
 =?us-ascii?Q?4LRJs/FLYsGEeGcjWFGQT2myMmS3hDX+4SGUCqEbFLndRy6MM7wAQSJiAdNk?=
 =?us-ascii?Q?gn8wFGstAFkZG9sOLjKD09noJrPt12jX6TlCgrx3RLMslzYwr1z+DWD5oOAU?=
 =?us-ascii?Q?AY9R3G7iyNrSv0kn3lhv8ieHil7XkcdIedrFlzWVDfDOxQQQkbwv?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be34076-284f-4b96-416b-08de79b6878e
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:23:19.9531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HXUjHR6FGwCkE9FH3EX6G99xwN5O87hF7BHu7HduMVLLEFYPBnDDfXnF3JrKFbpvqsnCac/mstWy3HsQLVpvYuX1bl42QlUVk3AD/j40/Ja4eboWQF0s4DPBiMcZaKxv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9755

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/google/chv3-i2s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/google/chv3-i2s.c b/sound/soc/google/chv3-i2s.c
index 0ff24653d49f4..fd12cedfe1c9e 100644
--- a/sound/soc/google/chv3-i2s.c
+++ b/sound/soc/google/chv3-i2s.c
@@ -163,8 +163,8 @@ static int chv3_dma_close(struct snd_soc_component *component,
 	return 0;
 }
 
-static int chv3_dma_pcm_construct(struct snd_soc_component *component,
-				  struct snd_soc_pcm_runtime *rtd)
+static int chv3_dma_pcm_new(struct snd_soc_component *component,
+			    struct snd_soc_pcm_runtime *rtd)
 {
 	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct snd_pcm_substream *substream;
@@ -271,7 +271,7 @@ static const struct snd_soc_component_driver chv3_i2s_comp = {
 	.name = "chv3-i2s-comp",
 	.open = chv3_dma_open,
 	.close = chv3_dma_close,
-	.pcm_construct = chv3_dma_pcm_construct,
+	.pcm_new = chv3_dma_pcm_new,
 	.hw_params = chv3_dma_hw_params,
 	.prepare = chv3_dma_prepare,
 	.pointer = chv3_dma_pointer,
-- 
2.43.0

