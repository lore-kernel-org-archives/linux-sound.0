Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011031.outbound.protection.outlook.com [52.101.125.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8442D31AAA3
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 02:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909493; cv=fail; b=hz2SxyqGyxWaAQ35gsWG0oS+ps6UzIbMmlpqPzUoqTHnQqAv3a1gLfJie2mT1yZPvvaYNoGUCbeijLxEcuhhwy3qtP17DJa8huWNPRGYRKdBxwFmAAn0Z8GfmcCIDDHLKaK9J1CPtp/JgZPjtih6rwV44sL++HFhfe9og+oSvt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909493; c=relaxed/simple;
	bh=xCNoo2ljEIO6Zz1yNaTvRlE6wVO42REiXIm2wWqzdrg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jSYWnlz78Rvw+tsBg+LMc9/gnKf/H0vPeaMn3pdBAe7FAAtcSF3WIYPCdzmOgKjXTqCm7jXODvso9KRMDS9RkCmOfLTShhrv3WtsEJFtLLhfYyRuohL/QIGlQdeH4OxdtAOIalZRLBoouAy6e2RFMG1KOrRhq/UGzNIk2gpoPCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ESNabQMn; arc=fail smtp.client-ip=52.101.125.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ESNabQMn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2JHI8FH2Rlqa8EOIseHer8pNOJhpjfCi3f81buHu90jkij+1PMWouK7gL15T33mPTTEXLb7aiWcVObyrJl0efjM7KDTGlCIU81XYj9F290n39N+tyFLwmmNGLfMvD8WVoMvfdcXry2W//d2TF11GoVYx/9GiqOHPHicSaBjOwilR/X5dNEBquXzYrjl+mFFjqqIDXC2SNsQLz4ueLCF+ea7hfff7dQGq4pRaJ4xOPiMyV9bkXr20dyY5wAboTCDnGNd8nA9ACED10XU4XMuIcz4sKWUfapgWWFWVaeCQSLLvfn88HtoHw+csMIIbJV8otPYV83wisoqLBYgzhdhFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bfTICcRvpIOXqdc7CkAYhBAwtgdFJfSf8YZKGF4tT0=;
 b=pRUn4hLjc3BQ5OvsEHW5azLIYHwjBq4EsHtDBy9/d/a/eMEL3Xn3qNrnNBs3WOgPhXaDHf1O1v4KV0ilF9SUBksLMmwnpYyCyFz/QOINrl98WxxsXOaMhPqLg+e7PIZkO5fsr9M3dCE9COWvlKoE6jhqb3jUzrtlMLw6si1/GYYPR1nyR0ajsd1nZxOsi4uv8SSQ7JyiZ973kHvasjrad96Tvo9OqYVyuus3Y8BihAy2WThM8J/+qVfhdvs2YyJUIEDDT/am+o8C6if+uyxVoAVueGjM+EUvCUOIAfBTBOCKv6bDXW0+jLYn4xy+A+IDiyrOU3pKxKurtRBM4uqK4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bfTICcRvpIOXqdc7CkAYhBAwtgdFJfSf8YZKGF4tT0=;
 b=ESNabQMnToHCJpT+LFBYZSJS4EMt81FXAd/c1EAm+6KqHB6M4/lj3sI/H+7FoBUtlYsMVgbA7Qqq4WComEX2KpgjnvHzoc+SHpMVNmWwZgmBQWfmxLhJoVa6J4m5M0fye/xb1cl+2Rp6jceb5sM2bGIB6aaWLqMw9oQ7vp2Yf+k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OSZPR01MB6725.jpnprd01.prod.outlook.com
 (2603:1096:604:f9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 02:51:29 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 02:51:29 +0000
Message-ID: <87ld8g6ci6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 01/13] ASoC: soc-component: tidyup be_hw_params_fixup() define position
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 Oct 2026 02:51:29 +0000
X-ClientProxiedBy: TYCP286CA0069.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::17) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OSZPR01MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: 189e6a80-7617-42ab-54a4-08df20300f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|52116014|18002099003|22082099003|38350700014|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	FWaWuiScBABVHv51w2ZODRSIH+jaVZ8bM1tQjriA6ysh/KPm1LWybTVTHybOG5WFvkf8eqc7yKHBN1IU/XfIXyfagSqN4z/avMUVyzHudhYcc7579nMDiNYTpe/NObXQs4CbFBn32G4AQxD9icQOURqn+EVvQ1xrDgGysjNf4f/AgzBHmsLsEVkzZmFGyQ7zPoC7ozK6GGGifvuD2TwTKWfFSjNmoYMvgu6jcEpfuee8wQyGvZQ4Xbfh1kHspJs10UZRd7MY7tmJV5ICOE4nc6R+7o5lj3Zd9b1VkfV2lH7IfheumIcaXikjvCnZI5NcTIqiUmORLyeocAN/tIsUhSFPURgTKqWFbuy4TFtpYZt7ZOJmDHPCBQxCuOVWSz5g4QiS9gxFM/uaxHHHMpqINHb5PoDEzGmZMDIDR8V/GH5AaCHV4s3gRRWqbre9RK+tkIISQWffmfSoj+JalmFKdFcWWVYxqkNjRZ4LmjTJNSkpoW7g45W0BNqS5HWZBqf3qNzAdzOtIYhLXuB3mLnwK5WaHtDV3fQhddHMu8Vsoq0X35RETmKOZK3U0c3gPBJfp6Ym7AfVrtr1sb4ZkERQ2kyKDdMcC3+8ANu9wbaeRAt04JYP0SqsOEY0TtKasg1/1VVCT09O3jDsPctE8k2ZxgSfL8vI185RqxgtshyCV5D2OiseMbt68Cx8RGfKcDIJiU3BHt5f11q0w3nldHHZ69DkAgUxawOPwTY2BqcfxPY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(52116014)(18002099003)(22082099003)(38350700014)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?lG92AKLBWEbiZQ9xGZM/0lCFbcc6iDAvQGXIpeskefBUyAXaJ4xTWP5E+T?=
 =?iso-8859-2?Q?x8x24XrEFWUmxfYhQ/3yzG+0QzUaJJvAZUSkCzgHtBCBh5LrM6x0KmcQBU?=
 =?iso-8859-2?Q?+fAm0YCt8T9OMkLYz3yg9V/6RoQSllJ7wm7BpX1cC+BcuHCbfbMnJd2B3g?=
 =?iso-8859-2?Q?zjc30a0NEzdl7KBGl+dpiZ//ZWBTsAahkIJss4isZaRHYjTY4KeJzH2tqK?=
 =?iso-8859-2?Q?gkxCtUAQ21n+ieaM0Zd9G2ob6qVi1LpvbeTlqywGJXoW4tu2oWCXkU5Bky?=
 =?iso-8859-2?Q?UwyaT76dYYYItnK/7MJe0ozQhC+0ilGpm76MXrVef2NsyCcXm4nvE/P+1g?=
 =?iso-8859-2?Q?kqemkDGP1LI3z7JEQUoNf3+rmxdp2NYeVvZHYc+HTta2yv2OFGUdt7ylfk?=
 =?iso-8859-2?Q?Ldqw3Al2VG3DURO7jSCnrXnn6c5zdLGFJ2Fi4p8Dt8LlmIhWA2BFZ2+0mV?=
 =?iso-8859-2?Q?w0ERT6casWywMApIOwHe5HrHAVUJPTIWUZsDig+sKAxsSpIwrttXcn2an6?=
 =?iso-8859-2?Q?7bX91kFA+SWvvFd/XiBNBp0hg07wca56bBzhUNxu3/aA0FjlElVgsjWEeX?=
 =?iso-8859-2?Q?IFaEV9LY2aQ+jnXvNXQYo6iqIc6/GNHHcsOEZR6i60WiI+/HgLNlAXP9wg?=
 =?iso-8859-2?Q?H/v6dvx/xEMUp0RhRc3AG33oAEOVD9X9JPrO1XXXrXGi5IOnOLH45qlbmU?=
 =?iso-8859-2?Q?v3ddtNtvwbyLb8mUXGS0nZGgKQRfFKxsNT6cd4vHuuCyFSzq3EOd6lYmYO?=
 =?iso-8859-2?Q?51E6sEOt1LtPUhOEhY/KuXEnlUbbSVR6LTdbgr1pCEReZOIyH18JCtpPW2?=
 =?iso-8859-2?Q?iyQX9W9gQ0zpOmrhWCl39+kcxdjLWWHudYkL9y57ksFH6kBoHhDDLQqUv7?=
 =?iso-8859-2?Q?08zkG7gOKV6GuR+9GZdegkbM9KsvLyNHpCBo1RgIxAuv1ZeGqtsLcWjV7V?=
 =?iso-8859-2?Q?1MShh2EVWGV3ZNSgOZZG2WOJGWmWHE2FCcpK4odf0mMRKnntTdacrbxBJm?=
 =?iso-8859-2?Q?b9R6JgP6OB3g8+az5GcnjttHwjVs6mfAKLgNi2V2AJrZwGRitOG3ihN6uY?=
 =?iso-8859-2?Q?rQtNzGOLChHV6DW1g6zyTeK6QVtK+pyYtQMB0zOwFPAUf4kiFkwrJophZo?=
 =?iso-8859-2?Q?z6D4IgZhMSf72Mx2rBjF0yHeaceTVGT/vf8RqXJUE8CdYtfGb4ANVWcAGc?=
 =?iso-8859-2?Q?Jn1dbow+tX25F5RIZeU5Gq8M8K1bWsSl3jmBPVCnK70Qjpm5RF0RMNR7h4?=
 =?iso-8859-2?Q?erf0C7xtjzMNtSgyMVwM39Ug6KV+XkPOjpEUGjCyffpW60DBd4K4G6NYaQ?=
 =?iso-8859-2?Q?W63PsfZQFXsIoW6vi4EgVB/U8gdpd4apsyN4J+tfJjiFs+/mhO/X7DalKx?=
 =?iso-8859-2?Q?p0mAaJ3wE+Eodxci8Ksj9WWBAKsWi98bfGetnIHvAdm9yaMxZN0vBxDpZH?=
 =?iso-8859-2?Q?uoPvAycYs0kbXfDg6R0g63b7OnPEgLNs0sYE7lIQsQ348NU1XGWl5Dy6fL?=
 =?iso-8859-2?Q?0qtxW5dCJxtHBAqsKxrBBjF64EQz2kngq/qvQ+TcMXxJVmYafv5juROn1A?=
 =?iso-8859-2?Q?iWR4oMwlX2FyYp3Viwqubq7aKzYVuPioD/NMk64glt8v6NBwdiREnsuBff?=
 =?iso-8859-2?Q?xJCx3YDUMTaw2GRMmvG5wBcLowM46rHgVIa9wlwJLg7pFLHKuX0P3Y14fu?=
 =?iso-8859-2?Q?jRY4CyRPnC7JxOhBAUy0qluJ6TKbuZduNCN1yvxYXCKvp/gN06kZlKVtIk?=
 =?iso-8859-2?Q?ZVkxpYOQkwXqBYtluWk2LODfHtmXEUAdChgva5QLpZx4TVjauaLzfTCgSm?=
 =?iso-8859-2?Q?1PMx+l2YwKdtF7es3KsQIzmK+IKhQO4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189e6a80-7617-42ab-54a4-08df20300f1a
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 02:51:29.5418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEX/z7WhU8yLF6rDWCebVfCSE6W5sUNtEeQi8asGrlsfHcu3IeX5dONu1TIHY7PSTJ1VoHGiGOj2BFP7F7AdN5L65ISJc82KJEABMCQvZJa+h7FLJ4s5goUQD+JKF90g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6725

be_hw_params_fixup() is one of snd_soc_component_driver callback
function, but is defined as alone in a remote location.
Let's move it to the same place as other callbacks.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 6c1acc984ecb0..2da196de6b89c 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -154,6 +154,8 @@ struct snd_soc_component_driver {
 		   struct snd_pcm_substream *substream);
 	snd_pcm_sframes_t (*delay)(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream);
+	int (*be_hw_params_fixup)(struct snd_soc_pcm_runtime *rtd,
+				  struct snd_pcm_hw_params *params);
=20
 	const struct snd_compress_ops *compress_ops;
=20
@@ -197,8 +199,7 @@ struct snd_soc_component_driver {
 	/* this component uses topology and ignore machine driver FEs */
 	const char *ignore_machine;
 	const char *topology_name_prefix;
-	int (*be_hw_params_fixup)(struct snd_soc_pcm_runtime *rtd,
-				  struct snd_pcm_hw_params *params);
+
 	bool use_dai_pcm_id;	/* use DAI link PCM ID as PCM device number */
 	int be_pcm_base;	/* base device ID for all BE PCMs */
=20
--=20
2.53.0

