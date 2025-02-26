Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363744315C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 06:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740551383; cv=fail; b=HVaH0L+QjxZJQHwxI/U24Jysvu8MH9MMUzKAPVcPV8fGUOmqwO846ksHjzpB+nwYWJxJVnoWG2sNH0oZne3nbM3A47Qa0j5wQQSEGwhCdaqEeiUhkYP0s433eapG34RXMYZwl9W1DOMcmRV5KLELp7lnqgZJGJIBVG44Fdm+Iz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740551383; c=relaxed/simple;
	bh=f6/3kqMkRZUv0VhmdLcnEx8Jp6hNbMbl9j17DJC+4CU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=s0fJg+HNfPSNXGEUDYTI01LRH7smEmGaPP23JQhe74Hi1T5oMfgr2+GVGynO501O9V0hL+kcFE/Sb2oD2x0HRVxoy9sxBlZ8nvFqbheHIfkN78Bhd6Pp43rt19Th1hEgb8t/Lu4rYko1L5J1DR51bTDOHPW7DJnqYjB2eD7hXDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TJhju6/S; arc=fail smtp.client-ip=52.101.229.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TJhju6/S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yiD0KMuGvGlrWwNxICjQEN2eRXPF24NwL0lrtOkzZfqOxslmZGhImE/oalPbJr44cv1Avi+Q7IAnQBF4/VQ0de2O5bQESzmXMDnaZ4+dW3eJu2yBZjayDwjIxI5nGQRg1c+PXFHOupEiiXdFH7S8EfufxPjtwYp+JNFnXKOmYzU++CYmLwiVPrFNRiVBfwwGQjzHjd0BwXilrOSCe7uiSRgHB6c7/qQjRK3CHo1GnstambDSUYcyVYLpLoz6Rrs904Rg1GQ+SSARWhvH5RMQfFRTNqRrQvvwCo24pAvKDN9sR6JL09IfbNWoFnWNgXXfoasmm/idfaD/4nwwhRgyOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHT/SqCCc+cYRl093k52QPh4h8Xb6oO/67PUD46QT8E=;
 b=djhfVy/2SL0uPYkGNTUYp0xYoMpW7sLidL6BRmWONah7nvb5/UIhFsU+9DYtKl+AWxPTVfDM0Bn6xT7dG1gO8j4ClilslX5RrOyCbjya4V1lIQ4XqkKvZiRa58JVogVGhqXrG5PT2bxP4CaDxeAg9R6JRd6z9aJVBc073N8vChGOCqYP0RIzx4+rAgrNmgFRw9N302qSX65inT/P2Zmu4ro1B0YeNK5M4YXaJ7Bk+P2urfy18tUlUAvL5GkmCRH8KxxWvz6FjI56yWcpGhgC+G6PAU7WVMfjwx+etbQ3cQ1n9oVShQooaEKHHYhlaWmTPn4+5PjnqK5mlo/LlRjkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHT/SqCCc+cYRl093k52QPh4h8Xb6oO/67PUD46QT8E=;
 b=TJhju6/SxzaYKxJwDtwH+r01+nNwas1eUV91C4VfSHX9d2U4N8VhnCiKcLPNCp8qZYdbC6iuBRT4+UYaK5Lgzqiap8wFh/EJWUdx0T8dxQrL7Jf67CbZ3mci79N4oDtjcRs6iflhX341eTcsNXnUiHg8qUqfQzcd1JZUG9zf7jw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7993.jpnprd01.prod.outlook.com
 (2603:1096:604:162::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 06:29:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 06:29:36 +0000
Message-ID: <87eczl6wxc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] ASoC: simple-card-utils: Don't use __free(device_node) at graph_util_parse_dai()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>, Detlev Casanova <detlev.casanova@collabora.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <87frk16wxt.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk16wxt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 06:29:35 +0000
X-ClientProxiedBy: TYCP286CA0209.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 709e4ded-3bc1-4d97-0426-08dd562ef082
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?FUIjzYAVJb1qpIGhwBUPURoOpgZEJXnpvjkxnIV+J7cbjA7xYVQCZenzt2fW?=
 =?us-ascii?Q?Xb2DGkmAjZ39dJyCJ8l1qO0FLpf2rMfu4O/L1+ahfcnBDakj/NuEt+6ZvRFw?=
 =?us-ascii?Q?a21k4CRUU6d0sxFt0yHmPVhxQZUDmrRM4WtJdlkOdIksLwJHan/+YovKjU0m?=
 =?us-ascii?Q?9HR2IYB+Qio88e5dpayfczHtu8gCxE0TikGQv8i6+F/oS05Jvaz5AdP6Z5iu?=
 =?us-ascii?Q?kr1JqEXdbo6IYCyVblDsWrZwvS8RrUtq5tWD/UCj0ecmYR1IBV2c0WTjkdNM?=
 =?us-ascii?Q?zBOP+jkk07se3QkJfGbl5eHlUM++HGa3bku2aQ9Mq0lqUE4a20JDr5zF5i1K?=
 =?us-ascii?Q?ZdjFXz7CU+UFp0XDHhGIqxah818BPINLp/qtetAb32cle1c2G/MkWwHwacUK?=
 =?us-ascii?Q?P90Er+F4ND3+kFU/EsQbB669QZD5kEgbgpCZKWvO4rgJYAS9ChvVDzYDaSKC?=
 =?us-ascii?Q?Y3grOqJE7C0M/+mGkmAFCbLrU+XdrA0rZheocemRY0dSWAMUZsY1NkPufGE6?=
 =?us-ascii?Q?F6oHA/0rl0JLrZPegZm3mqraJxo76jKWCrY8nn4MJUnTBjzT9FmFopkKwGMf?=
 =?us-ascii?Q?Hil5nxHfdYOHhgX2qRldzlDbzfSxJQnR3hM/Ixyyh0EzOiscrjhAx/nID02Y?=
 =?us-ascii?Q?9NmYcsr9pJydOxCXKf1JuESCXuHB/Ckj1GUaUWBnwtsw3eeo8UzTN0yxMBZO?=
 =?us-ascii?Q?d4zBjH8rJ0GFJZ2jScmdEaoG912xpnYBH/DSOyEwDV2aYHAqsChdno2WmeB6?=
 =?us-ascii?Q?5X3w395A24je0HvGtOo2Ms+tLQ70zyv8DkxGNKGcrwloPBb6klEBknmiF2u8?=
 =?us-ascii?Q?MmQMq8CJ7uTAmXzRkV57+oFxFZVu48YEtSxBKNvgfMJNmjgMDL8ICmWaP3N3?=
 =?us-ascii?Q?rDnLz0MzTAVnKp1RuhMAKHtDy+3ZwNjNKe0ANoz9fqaJkKX8RAjHd0evfBQZ?=
 =?us-ascii?Q?v4yzndJAhtOQm5k84jc590MWl21OYcOhun+7w4p7QdKjMJ+HKWy+FTvWmgvJ?=
 =?us-ascii?Q?Cf8zIKoLsOzO39wjZEABY4ZLuB7uGxuS2DQ7VhgKvxwUS4hojcDUBy+2Lw4B?=
 =?us-ascii?Q?+EZrqCkdOqlKw7SmF0ODrAsCVMLXpUrxkl5VtaQxqJuhVZSkCYC9S6vV+3nf?=
 =?us-ascii?Q?W07WbzYj63eiynWzSN+CzFZuX8V5+w/vplMWAV20ylEZPovpxf9B2tpWt8Nm?=
 =?us-ascii?Q?3rk9b6wGX3IpjAvISZ7Qi88ZjmhF4HE44P2vrWPTJACHgygpS18zNUklR7Bs?=
 =?us-ascii?Q?yYkBPrnCzEyRVN1mTOkWPC3YtdpU+AXLrCZH+MhGNfP6hIIYSCfgH+Vd6ep+?=
 =?us-ascii?Q?z2AQ0b4+MsCTxKPSzSShSl/kbAhtHASxWcv41K7P6p9FlpX586Tpklf8ZY/I?=
 =?us-ascii?Q?fxKCkeXBeQSOazlWy76JaKigQEi91fSVTmy7du97HaN7xGoibhakAx5j6zje?=
 =?us-ascii?Q?ZStIOAKeONyJfzXYW5jyvdTggD2ugeHj?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?4XgBConaQ82uy4sl/YYvF5E5KfXBrR/ymDQSUbBSG+GHae4+HlsLwu2uxIpT?=
 =?us-ascii?Q?H+U/Rj42Xl9new2Jzx63W/7bCgV+M+6KtwrYALbgaAIM0kj7haiTA+978yNe?=
 =?us-ascii?Q?7cAqgf90HG+7aZXTtZm6BHySI4acXjJ/tkaIhZOozksIx1ZcfEjDg7nMsm4P?=
 =?us-ascii?Q?18cajdntGzHjKx2gMvA8BbsKeRzTnLNNncPlwtwrDuOt5A+MnHmgQeQr16Xh?=
 =?us-ascii?Q?ogRtW3hZSSfw8Vj15oqN9+/ftd5cFPnRPSOW68Mh0vMPuGIqylwhmpvZDUF7?=
 =?us-ascii?Q?cxDBVm4RD/l54PWyVwXCwL8WytFwojn+qbC268gU+SSOPx4WTsAtRg3Lvi8U?=
 =?us-ascii?Q?0qnFVZqT21/CgKzKtoUztGfoi8qDAN1fyHRoDazA8J20qa704XZoK6JsCK/N?=
 =?us-ascii?Q?rd8dz7HJHpKPPa2UTKsbsGnPKYU9d7qjSy3Zcvs4I1/pnVBvPb32Eim0O2g6?=
 =?us-ascii?Q?JM1l79JhRyh/0M3Dtym9W4bgv+OLslIjtIb54WbcHQ8z2VqIuGSaa/MEIfl9?=
 =?us-ascii?Q?v+ryTYhpIde8G7d0uO/L8oj10izccku2OxkP64avHocs7o9MTFSGqVI0YwIF?=
 =?us-ascii?Q?gGlR410NMyZqpi0iAEP2CPF9OeRZ6bS6RHKH8qbCMV1trbL/cA9fs9XQAeyD?=
 =?us-ascii?Q?dLMYqs9vUdsDJSAQ9VhWasDIBkO7XqUoaUsayATSjIn9fbh+X/c8jhY9JWlg?=
 =?us-ascii?Q?dqX0mpUfrT1+MtrnhcxaMogNsJkb6BBkvkNvVKIDcldhJJcNfv4rGv/k+8h8?=
 =?us-ascii?Q?dtdgUQWcI9h01JnXAyNDU8X9NyUlyhQ8LWTAjLRAzy804++MaNd6QM1R0/mx?=
 =?us-ascii?Q?xouA6ESa0oAIEnojCCFCgHQD46Sq+ZvpSByjbKkH8xntp1DMztmXGe9WCcqN?=
 =?us-ascii?Q?bHUcOZwyRXWYJURcnOjBkitaoWyrYEq11HnlA1JqWgdC+8m482BqPQEpZoTl?=
 =?us-ascii?Q?3zMPmRVtOjrYp7csVqfLBi4Oe7nXELJTfdclYljLhohqidcD9nTwz+qW/SKy?=
 =?us-ascii?Q?QrUkTD4qf+3YiiuoVTIcD7m65t0zeRBBCpPJLyoZqT3adXMTAAYEDnExsSbw?=
 =?us-ascii?Q?Bx31bVhopvxbSWYMfJ6j04ecpB8CFqwiL5yAwSLjRz52c59sfVTNiAYNAOVx?=
 =?us-ascii?Q?0tB4z4JDJzRSGUDCuXAW+jgypnsvir0wcqihLqWJOx99x1hANzTzxVAXiPQo?=
 =?us-ascii?Q?QqD8WpdOobw+Py68A8ccI6PsidtkIPrBTzZB5ln7M5fbMMpVMzx3EeXrlrte?=
 =?us-ascii?Q?9vPb1l8j9hVbXoKjTIEPMZ1SQFu85i/iRU5SdZiO8vCB0foOXSyVREyes1uW?=
 =?us-ascii?Q?5L+NyU/FekFTdiQNm33cDwMCoB4axgmmNwuspAyB6RyiaqaXImGhEP5HS29f?=
 =?us-ascii?Q?GvkKbWOHI88LfBJA9uXww7b/WodUuUPZTIMdOFHwH+eIT7NWJ+bFvdHe624L?=
 =?us-ascii?Q?5iFY+AtEsuhA0+qJYKge4bQGzjVD3NAwEcW8U5Z/JplP+wk1+O1fnrAVMLXV?=
 =?us-ascii?Q?WYLf+r8c6/vzSeiTvsgcNCiiqyEPPVkCz8rKWbt0KR5+RYkhn5sCIe0F0a8/?=
 =?us-ascii?Q?8eKbOi5DaDDm9Ab5FUt9xbW9VDCw2auG3NNyOG/UL9oKStCCMEQKrfIaAShP?=
 =?us-ascii?Q?z9QzQPFag8osbJEZzVsYYYA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 709e4ded-3bc1-4d97-0426-08dd562ef082
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 06:29:36.1306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKgecsCovraZhvM1JRjVHlruEH72GV2A6U5nnRkRLKSKSOtChNy+7arEeNXSE7UthzVcyo1+ocG6Er2+jHLefHtnkn3Bf6IEnpkYDzN++e7Dd4VpLL43QkBXM+1WU1qR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7993

commit 419d1918105e ("ASoC: simple-card-utils: use __free(device_node) for
device node") uses __free(device_node) for dlc->of_node, but we need to
keep it while driver is in use.

Don't use __free(device_node) in graph_util_parse_dai().

Fixes: 419d1918105e ("ASoC: simple-card-utils: use __free(device_node) for device node")
Reported-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
Reported-by: Detlev Casanova <detlev.casanova@collabora.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
Tested-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 sound/soc/generic/simple-card-utils.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 51e0e434514d..79fdd57a470c 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1102,6 +1102,7 @@ static int graph_get_dai_id(struct device_node *ep)
 int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 			 struct snd_soc_dai_link_component *dlc, int *is_single_link)
 {
+	struct device_node *node;
 	struct device *dev = simple_priv_to_dev(priv);
 	struct of_phandle_args args = {};
 	struct snd_soc_dai *dai;
@@ -1110,7 +1111,7 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 	if (!ep)
 		return 0;
 
-	struct device_node *node __free(device_node) = of_graph_get_port_parent(ep);
+	node = of_graph_get_port_parent(ep);
 
 	/*
 	 * Try to find from DAI node
@@ -1153,8 +1154,10 @@ int graph_util_parse_dai(struct simple_util_priv *priv, struct device_node *ep,
 	 *    if he unbinded CPU or Codec.
 	 */
 	ret = snd_soc_get_dlc(&args, dlc);
-	if (ret < 0)
+	if (ret < 0) {
+		of_node_put(node);
 		goto end;
+	}
 
 parse_dai_end:
 	if (is_single_link)
-- 
2.43.0

