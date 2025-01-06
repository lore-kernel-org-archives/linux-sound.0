Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011019.outbound.protection.outlook.com [40.107.74.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351F417C
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 05:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736142585; cv=fail; b=js7brTaJFe5DerXtFHSxDATQgwlQI/1PznkFDbToFuN+m+yevXaRUgz9mGz9iGzpEx0lHONDkOMSX8j7yEVkpNpclBF5E9wdasTimuZ6mc3d1iRan505MIcx8I+GGECxczdssZmBrT0I3q/eu8BC0AtbuKnmnMqc6dK3h9GL31I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736142585; c=relaxed/simple;
	bh=LqXbG0+P+5VaOJpRuxpG4dLD6+l2bMZWieNfQ47XrG8=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=jhlvzJPvGy4sTC4UXgX+NlnX2FcRbXwMM9htvQX8o8Ncr3VtJ3uaYD7tHHif4CX6368+SQB8EIymYLbeuVpbQk2rXl1s75QhEk5FtL8to7GlBzz2UMo/lz257rN36wIWosa+Vamfv/YvOh9tre6RX3rc1bYx9ThqgEdXeJDhSxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NX81eG8C; arc=fail smtp.client-ip=40.107.74.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NX81eG8C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cq+hSOHU73WSoJBbQBy9cr6Lxj3+Lb8j2EV0OrW1o9EYJe/qRTn1SsYcnqbwPXNRv9DWpmsIlUAKfJSbYmrkBL/yumtxUU/g229LoosTILH7hoSKFKmj+utHpiJLn9qL7z7ncxxTXnbHs+6KIp2oqYWdPwkbZk66QxQUPUsPA0Cq7RL9rCJWvzcOMCFgY6+OrsWVEEXCdCkDFf2ymGXKCUprdA6CUzLtGlwNoGpUQYYstG5d1w9xWCQnl2qs4WGADOGuX1jYQ0O9wy6Qxm79gIhlXvxGhF6RMDcKf72NZGHyjZWuWfA0SUZg9lNihg69dpzoo7Vi3WgHRo1sCP+ZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+qsAUtCDNvvznHto1UkM2CdECtHDK0kw06w+JhzIyI=;
 b=LV48PmMLsvBL4xIepE6Xce9HKBSy0rj0AN3E92T6XKeSVLup5JvIKVVc7EJ/q1JoHS09D6mVLYaY3iJROw771OJZ4As3xMpEHnAsUoEdeln0j87mVSsPAs0TA6jzmItmIzQL5R9kafhsbuKG561VxARxDndL13Ats41DniuCJ/4KlrXt+wWYsbigV+sz9p4V07xGXmFAhLNH2BwgR8SjQbwA+pt1J1C9BKIEi/jIaQV2mRrA4YzQb+EHWDvuoKgEEjji+fUojOlWFW8wRVa1rHUqzFE2EB0nCIKnXkp6XejdfJ8oorJ/OPvqgpQQfaS6HIqoMssVFguyZCeuHlXqOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+qsAUtCDNvvznHto1UkM2CdECtHDK0kw06w+JhzIyI=;
 b=NX81eG8CYbJqaDSyqC2qSCZCk/O8HfTB6t5YKyIeQFZZLZ5CKus1hlaZoDpayYzwaUiDY201z1+vz6KJFQSLbK46pyIrfVbxWkGlvkZ9GX2jWNpUp++CgtMVDOGdyCPLnW0VnlliFcujJTE/KrUaNKRI/wsChjVjtJHSfNmtKHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6247.jpnprd01.prod.outlook.com
 (2603:1096:604:ed::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 05:49:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 05:49:41 +0000
Message-ID: <87sepwo5jf.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Stephen Gordon <gordoste@iinet.net.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfk4o5l2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 5/7] ASoC: audio-graph-card2: use of_graph_get_port_by_id() at graph_get_next_multi_ep()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jan 2025 05:49:41 +0000
X-ClientProxiedBy: TYAPR01CA0178.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: a8053e46-3275-4818-11fb-08dd2e15ea0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kjU2qTrc++0GQJ8D8kft1SnRNhd8EmkaPJZ8pGJKHnweHO6kVMiHEtG94Xl/?=
 =?us-ascii?Q?TS4uHT2JuAHSZzMR6MQzPF2jUdjloHGTAb3Vc+45eStct4ND8wCbWbbVXCKd?=
 =?us-ascii?Q?Dq8R+z2rN8HVyD9phsU3pts9XvfkpRtwqTmoZWzNinRJLlLHEx7ADmIMDvTA?=
 =?us-ascii?Q?3m5YF2l51G+X0+I54T7CiMUMQWvwaG8wkGWDahj8uBAYbPBAg8FkK7HPdOaW?=
 =?us-ascii?Q?TOXaRAfUxURFyDcJCDOLwX5VdFFwrKYP7lPeg+qWtsY0nBYk5Cc3axmTTB8O?=
 =?us-ascii?Q?nXfM6X9Xldso19CM0CT9DcxGToRFijwynJ9RtVrT0rpwGs0RRpFCyk4+thhD?=
 =?us-ascii?Q?7dO3kf5iHu8JTpNM7d5rVWuoBqK5352K7Z5cdoZy+ybaxFKqJeupDs7xy6Dg?=
 =?us-ascii?Q?Q42LUGknVgdXaH+9LQqvrxQoCWle0qV7XzIIndA1h0bNS0eqpoQO/ctKlrz2?=
 =?us-ascii?Q?GkecQTeYdTiqgVtlnXnhVkghv7etBaCZf7GE1Dh8t/ttA1xiad2+Fe6pprsG?=
 =?us-ascii?Q?bpR8RW/IvonepkF5iBCqzsv2U1T09YspkXyDG4Wr+lXXXZxaE+kyNyVoQoYx?=
 =?us-ascii?Q?p91K+zAdl2Kg+LQAh5Gc+YdZ5vzG6CJ10WjaQ4RfAbnnWx0EHHIR0zVuwHHx?=
 =?us-ascii?Q?ugt/roqXCESgldVwGX5336pdJ8Lb8R2gdKOtQ+viAEIZoq25rAupKB3MjtCy?=
 =?us-ascii?Q?fDHYaD/H1AC8IwFuwDKny8wAQsnZNyohj/qxGdaMRSkQCiImJz/X7KfiTK8C?=
 =?us-ascii?Q?kPUORA0a2wEw5qaMy3NncDUFrCoZpiFkp3JcKypkGpjuo3C5aCA3luJOkWbP?=
 =?us-ascii?Q?uX2l7frMF5MDgDCkkvBbNO5MJrmkcDHiaWaF5QmmPzkNKiZIZBUXrmFYVzmb?=
 =?us-ascii?Q?CP6SaUf080WxXds1I5e+6V81vdV62A266YTHo/iV2jfBIPfYXl8iVkr7XgDT?=
 =?us-ascii?Q?yySUp4jyIPuQIHRyAro8e5XkkDULO26H14WClI/MYb4cxnO3HpZ5A8vnY7Kb?=
 =?us-ascii?Q?nkcupLfW50YFpbvMLijQc+5YDiNG1gp7GtVvW10eHYdjgiRliKTHaEnHvKEA?=
 =?us-ascii?Q?eBeJhb3V9WrERxeq07tV5YWs1xQuT4tW3Ji39Dw2AMiCkuEzHks6VFS1hBCY?=
 =?us-ascii?Q?PoNa1JLRk7caQzIVF6ONB3zeivOn5fkFpMafW+zFkAhPRgDYVULRmHYSKw7r?=
 =?us-ascii?Q?rokvI0QcEAJTFW+7Itn199ykAI6C23JfujWjj6KWpJs0zWvNFiBLOOcp/qI7?=
 =?us-ascii?Q?naldrqqtxZGyg4Mrr56YDOsr1tpVf0QwKcczrQDnVoQDuN8hiNO40utJpd3m?=
 =?us-ascii?Q?kkVUC/wD25GdBVXZRLu8Apr/wdisQ5Hp6uSg9roJ9k0O/WbNUWFAJkOroJNe?=
 =?us-ascii?Q?a/tjT8Jc4em28w5ZdtIyaCu/Ehrw1ADr/b50xBl4lluudo8B8TVnPwwpw7I1?=
 =?us-ascii?Q?h9orjQJimUJ5OwXmAZElddqwKo3a58EN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JcVqWSlXUBUjdBeDbLqocjJtnVY6SE025R0tnNDEbfbzRw86FKmI8FcN0BCq?=
 =?us-ascii?Q?8u9WFnAOVG7kABEahg09kIH3GlHqDc2AwqajDdONzZOiGew3OHxspWcRNrxL?=
 =?us-ascii?Q?Rie3wX++Jnd5uwPaZtpWbbT91x+rY8joW6OVLM93xx1C6/qfTqw+WDfQU0U7?=
 =?us-ascii?Q?QXiRMof9RMss9yW9upjY53sRVb6dT3cqez1D7oB1yNANTGf8l8W7qBtI728Q?=
 =?us-ascii?Q?9I+lKViQMB7o7OKG/pXbDoPftZQrXUQ50S160ua81rbc1GAEvSlZXvFufv+r?=
 =?us-ascii?Q?3aVx3q6i0xpcWN7yhVFAog1dS/ZAgtLnCq2UfYeuQr0g3Bii8mxLNxZnXqLc?=
 =?us-ascii?Q?k2W//nVpPvp6jo03/GXNgxzMZ2HrDBD8WoLuQibYaXop+BcRg5IPJ2VOpZ3o?=
 =?us-ascii?Q?LzQyOzMb5ni0BmWR9QF58eFtx5Pwo3YdngvB4I8ZvB2Q9/p1ZutjO4ovcJD1?=
 =?us-ascii?Q?va21FN8sT/i0wT+9TVeyW1IMz+1/adf9Rirjz4jxfs5JnSSDKgZokjCIJf7c?=
 =?us-ascii?Q?yJO+3ScP8ZKYWvKcmFOlYuzwdRUA0vffo7L6fdfCU95P0+DyT0n7mUHypTrK?=
 =?us-ascii?Q?ktd4o0dYlif0MClIz6e45ZK1ChNBtudnYupLPd2Bm+ZrRQRIH8TobSQvZeHZ?=
 =?us-ascii?Q?o6V3f/60eVgF3/jylwO4oHaMLSBy+No5KXeBE5zc839X0KNeJ922ycbrWFVc?=
 =?us-ascii?Q?sbz4lbrQwJqqRdgYiTqqkawFo7wkiMlZpTd7w0F2k5KAbPdDRN+078zmdJAF?=
 =?us-ascii?Q?DRXS4rrveBgLBcmDdEBhWWfKpNZY78Xzpa44VdeNq45AvGMd5Z3r36mDUXtU?=
 =?us-ascii?Q?4hQCx5egHi3WX354l0YVmKKdR/SNNdHstPRIQiEDeUjevdpsi9um5w1DBSmJ?=
 =?us-ascii?Q?BB1AIcOIl2Fdgy/Cnrf+ZLDEMZ+p16d7CMp3OjL8hMmhZcwUHEF4XH/vwsR+?=
 =?us-ascii?Q?+4oFXfm52YkRbYMbTRQha+m3B/ZdyXRWZGEkx95bqOv+8gzCcxbN9627apXt?=
 =?us-ascii?Q?/9Co45xQtiVoTrxHVpe+E0hQGy1xNJmNAWmBOsagFhlnRRnCJZmtJ6or7YfZ?=
 =?us-ascii?Q?BOEJYIl47w75aGfqxLGndQgrJVOiQubxAefbMhwlhw72fhpHihnSqPUmqaYM?=
 =?us-ascii?Q?T8VPc7phh2rBGIenqq4/zIoNmGc6uxlFF4lNgY5rt0i/Q/m+oCB9ctu8FR+p?=
 =?us-ascii?Q?QK3mSK8FCF+/VfhA421v/W3CZTdwyyNA4VTp9DoObax58HnasArCAgY9zW13?=
 =?us-ascii?Q?+7I2MXJYtqWpzuG9TXGl6r5QURO38wOLEpJTUj8UtHr0V9Ph+qBgI63jnzXZ?=
 =?us-ascii?Q?4Yu/NApSrNi0d+XQwT2FXkXuY3mIaDEOIp3hzw/mollzAfxiHGmug8ManjeK?=
 =?us-ascii?Q?tb/wFIMgJ1YEpJp+2s+zWYpPW1G6CSBtyaQfTjPDaBBFeKBs9LllhK0XBopk?=
 =?us-ascii?Q?Hbz3RvOBeUjfSh3f7W/uYYtY7Pnje4PN4RibdaqhgE/rQmCMkQV6a+1rWnmA?=
 =?us-ascii?Q?hGp0J0GZhVr6sNvbSSBhyjK8T+/e4UpX8IXmAbIkWIxygSuWnAALRFGptBpl?=
 =?us-ascii?Q?9iH60KnyyuI3M5Om11TIKD5cS5qPfHIAS+CWj/Au2GZwYvHmfEQD5sVXqNCw?=
 =?us-ascii?Q?z6GyLTq+jsj93RwjdLoAnyI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8053e46-3275-4818-11fb-08dd2e15ea0c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 05:49:41.3498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+RfznUlkc9H44yS2lYG22Z0VWn9Cr5mB4YhbwSSaBnyiBQpSKDeYDXUhObzk5grN4aIOV0A6N5y7dN11wDZtX4vymPcukyPGlHH3YM3usUOxiYT7Tv8UABADvA7VexX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6247

Audio Graph Card2 is assuming "port" are necessarily in order, but there
is no guarantee in case of overlay. Use of_graph_get_port_by_id() instead
to handle it correctly.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index f4c825b56a7e1..4e330aae04894 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -331,7 +331,7 @@ static int graph_lnk_is_multi(struct device_node *lnk)
 	return __graph_get_type(lnk) == GRAPH_MULTI;
 }
 
-static struct device_node *graph_get_next_multi_ep(struct device_node **port)
+static struct device_node *graph_get_next_multi_ep(struct device_node **port, int idx)
 {
 	struct device_node *ports __free(device_node) = port_to_ports(*port);
 	struct device_node *rep = NULL;
@@ -351,7 +351,16 @@ static struct device_node *graph_get_next_multi_ep(struct device_node **port)
 	 *	port@1 { rep1 };
 	 * };
 	 */
-	*port = of_graph_get_next_port(ports, *port);
+
+	/*
+	 * Don't use of_graph_get_next_port() here
+	 *
+	 * In overlay case, "port" are not necessarily in order. So we need to use
+	 * of_graph_get_port_by_id() instead
+	 */
+	of_node_put(*port);
+
+	*port = of_graph_get_port_by_id(ports, idx);
 	if (*port) {
 		struct device_node *ep __free(device_node) = of_graph_get_next_port_endpoint(*port, NULL);
 
@@ -614,7 +623,7 @@ static int graph_parse_node_multi(struct simple_util_priv *priv,
 		 *	};
 		 * };
 		 */
-		struct device_node *ep __free(device_node) = graph_get_next_multi_ep(&port);
+		struct device_node *ep __free(device_node) = graph_get_next_multi_ep(&port, idx + 1);
 		if (!ep)
 			break;
 
@@ -729,7 +738,7 @@ static void graph_link_init(struct simple_util_priv *priv,
 
 	of_node_get(port_cpu);
 	if (graph_lnk_is_multi(port_cpu)) {
-		ep_cpu = graph_get_next_multi_ep(&port_cpu);
+		ep_cpu = graph_get_next_multi_ep(&port_cpu, 1);
 		of_node_put(port_cpu);
 		port_cpu = ep_to_port(ep_cpu);
 	} else {
@@ -739,7 +748,7 @@ static void graph_link_init(struct simple_util_priv *priv,
 
 	of_node_get(port_codec);
 	if (graph_lnk_is_multi(port_codec)) {
-		ep_codec = graph_get_next_multi_ep(&port_codec);
+		ep_codec = graph_get_next_multi_ep(&port_codec, 1);
 		of_node_put(port_codec);
 		port_codec = ep_to_port(ep_codec);
 	} else {
-- 
2.43.0

