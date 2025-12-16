Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4508D224AEF
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 02:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765851358; cv=fail; b=W9RG2CynrHZXhkPL2T1ghv7WEr6vkZbGXs5dfxWSXOUcJehctDUn6VzMkSaTkvPPIoIKbi40RAQPmfqfXXCtqTs+QhwkqTuocFtRUlhkeAvcUAOj3bZdJT+VryXEdb8N1mqZngUiKP9SOqlR0jhxIk3qhngi2Oihf17FdvzINhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765851358; c=relaxed/simple;
	bh=b/6pWQGWEYJJQAND6VraduC8yLeWES3N7S0gZ0bEl18=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=P48AU2lF9DimUqYOxmegtiG8yAKlRtWVuR5JfNRfdHnGRY60E0AEFb2XTHiqQKU/c8Obsn3wQZ5iT3gwaPoUk+LWvJAMYjYScF0xKiN3kkGCLSmopTv1YoZvh7HQgvZ8ce8p0jlQFVGyPyWTRHJ3X+OFqmi4GeXe5HpIBA9x+7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZTpag4av; arc=fail smtp.client-ip=52.101.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZTpag4av"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lC+AdKRDO6DwcluvoLngz8eok7BJFuDwYa+Vb3iuzNyT9Sm7ehfY5kCiF7iutbPFpwq3FxWWwt1TZzMKzPlLjGWa0tjOcJc3+760N7xHag5COXYELWiutG8Fqt7e+3XC6i0m3YkoGX6LHX8zkSVsvix/OgCkenm7dpHL5AlGnzzDl/8ZIMNcUucMfoCcPOn8gPmpYdtaGG55KmHrcSWfOvQKZZvgjD5OutN4YPnoBugO7hzU+OGjxBUBP5wfmcdFsMi3Y0i1K07osZtj9TQ8pfmdiIVrFerf+uyDhiNofRGTI/SN8m+z1lCKd+vR0pYQDN6wNwEsrxdyc2ogBF6lzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RutDCc5uDKwCi3TH9kSnTFvAGNqlTM3PJo4SWRm85dw=;
 b=fAWzCRnk2+yCdJGDjs5q78AvJuFg56DNwm07p67wyb6oZN8xcWwmp34oOub3d2zlJZUbwA6RjwUhkAQGTSdc2XHV/MVyI+kQKIQLE9J3wovXaBSWaDkcd7r76o9Zng4JpbdLhyTUM5oNlTNDY7G12JGHKtLFd+paatneqYzDtq0BsOI2VKzDIFntU854UetAdjKmxB2ln8RZH0zyhl+YwQjKVzmcapSMMZWTX6Q1cdYJpPvAv7Pr78Q0A4WIFWkmKrtAyLwgN1mYtsur9YvNWAAcinEMO8weasjDA4IiGq2CedZ6bLdWfXeQKp92B0pT/eRruKKuw6wbyNH9nYDJoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RutDCc5uDKwCi3TH9kSnTFvAGNqlTM3PJo4SWRm85dw=;
 b=ZTpag4avOfK/HprqQjTRNVcZUnxTGvbQ8C3eAGWsdVEuPFovI9Dkx4hqe3z498IVDaOh/8pC+D9YwRVCEpm7ub7BlP+Uy8WoRS+IyAGpJD6bE/OBtZirohYa53RMjI+CB84/3MUf79oB8rL8Us4MOnOKashcIhVu7zmzAqVIBeU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8637.jpnprd01.prod.outlook.com
 (2603:1096:400:13e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 02:15:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 02:15:53 +0000
Message-ID: <87qzsvrx2e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/8] ASoC: soc-dapm: add snd_soc_dapm_alloc()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Dec 2025 02:15:53 +0000
X-ClientProxiedBy: TYCPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:405:1::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8637:EE_
X-MS-Office365-Filtering-Correlation-Id: cedf6891-afaa-4051-6954-08de3c490a40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fI6NWpmMIMmHuABeaxDZDyrDuYhthDmRsyb3zW4DWYZS7tCrzw9lZNdb+b5b?=
 =?us-ascii?Q?cFqZf4IeW/E2Kig77WFcCURqwwLW1OTjnS+GdqbTdssHjNE2dV1oh+P4LvoD?=
 =?us-ascii?Q?0noIBXpoT/Ys1JSdpfVpzbiQ94kedDlE8J69wF7aOvTWIKnpOqanrR3+qydF?=
 =?us-ascii?Q?YmzfChtZgbUmnm+DyQA62HyR4ZWm8FpkY1/9vYfPxLoCHzTYMAM6DqcdiWvR?=
 =?us-ascii?Q?GsrMDZ0ZShg2axLNJ8sksCv2WJRXvE7rTuQ5jDFQbjSHpCbWcpTOb2MLDyPQ?=
 =?us-ascii?Q?VczouGJIySUrklbpTpvxeuc/0AjW0k1iy9VgAbkppJ1o0n8UoRXznNguhqNm?=
 =?us-ascii?Q?UY4dtAI8xzSu6JoHK1S/o7B8QA0RgmepoDtQ8a/eZhBYvckcUMp675f0MxO8?=
 =?us-ascii?Q?kU7CwcZhG+Pp86huTYmj98QGa0Z701Y4N5y7fLAZKyi3xPIoGLuT4wgokmmY?=
 =?us-ascii?Q?TcSdCuni6TbafPgWMmcxZ0GUF6oRXzWEG9lc3HqbCGV13O1Cmeq//GdNXwHT?=
 =?us-ascii?Q?MBJlhLGc4VNTAHxx665vfjllZNCG/wB+fU3zKt3o+P5cfgGfkA8TVAPB4qxW?=
 =?us-ascii?Q?XoSmOmjDA5tOCdzMuvwdEEU7TaFpCIG8anKOPd9SxW+rrnR5+9JICRhimQXE?=
 =?us-ascii?Q?vBZY7EO0DpS5ImPeRPYLp/GvKEep0nqUWA8o/l6VrLZrHMR1gvOBl+DUPbnE?=
 =?us-ascii?Q?OFzxwa764sEa2P6HZAHjSuJF2KBu66jYnfdVkMukEFFq5F6Q1iESX6AEpboU?=
 =?us-ascii?Q?l80Q2s88cCQSA5FXXKzDcpdrR0cXiezos0O28z+e4loOFQMgC2hJSeR0lkFk?=
 =?us-ascii?Q?DiCC2uWKKiHvRpJOKA/3zqmm9kqJ0kddBluPzqHWH/Bx5laM0s+VcmVYXNUS?=
 =?us-ascii?Q?52opUIG6VHzI8yluRNINworBbdjQzUJGQ/DdvjcHYG2VQfqd3B+4Ya4dfvDM?=
 =?us-ascii?Q?ToAU/F43AxwbVMDp0BZSItyGdPnfPjh+knHzzYlco6r+4wb3z3p2MpnShH0Y?=
 =?us-ascii?Q?GgVJwdDiNDivf2HDrtX1JU6awZN2GtA5H56rvyKrNqRcMQH+1qNmwUgp/6Wd?=
 =?us-ascii?Q?eEAPGQlCF2pxJVtspKZ63LXbASPLeYzn1P9hlIHIp9YN7a8GKn+yZJiMfjNY?=
 =?us-ascii?Q?7+0LC6JsA07rwAKZaeBwMtbS8W7gQxdhBUiInK8wNWs+ZGjLAkCZEqCHRtCA?=
 =?us-ascii?Q?jghPyFN1KBN9GkxA2f38BPbWnkxAU1GIOxXx+GFgyxaBDxz85xiw7FnBV0Y6?=
 =?us-ascii?Q?4WxhyrJ9aBLNT7xzcr6xHuBH13Z776DNQkrIgOUOtq+kYLk+K7OHBl1vg1QO?=
 =?us-ascii?Q?fzRNKK7+rP5Q90CCiZoYXh6fclKnvRE9m/Zd1uglyGWoeKu0dQ02HMJ944oP?=
 =?us-ascii?Q?DbsULBAkLFmWVW25SLvO6VHV3H4qs11OsxjeJjsD3Ag2TX4zisdq7duCG8Tk?=
 =?us-ascii?Q?dfqz5zE6QrX5hYhXK8euLxGnVvjWFJ2ly16WqiKVlqav8BwBIqFPlOLT4X6r?=
 =?us-ascii?Q?Q9K8wShzYiEN/iiayiTIxMGZ73TGpI3dOOuc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fa5Ri70hFok1E26ixUMucHVQvh3tuDjwQ/uX7NcUUqAFZ3y9XjFLLHcUrls4?=
 =?us-ascii?Q?aZV+qPfmU/KXmqP0R198mmtHag5qGrlieoEU0nQ9fLfwHMilOPTxedOZZrmu?=
 =?us-ascii?Q?9QkP8BJ5w9efhC48Lvr9dI4Pf+HjfZ8C2Ad1KeTj2d3UOBmUvQqiyZUStKXK?=
 =?us-ascii?Q?7xMt30cigWocJKjmy2UJTHngmozNlAehTcGOLq0B5AvKx//ii6EvqIdeEXUb?=
 =?us-ascii?Q?wR1UkzHdDJO2HhmQaPON9nj+V5w6A7YBOWan2u5IsmCk/A+MYfwSR+VbA8Cy?=
 =?us-ascii?Q?u7G0hxjvfrVf6wPt4e6WoFXEpCugfj4HRBHOzvRkn52wBw0rRu0guKobLcsv?=
 =?us-ascii?Q?ZSFZkeN7dlj4WLgFLGr+8MHzbVUs0VjnlSwcD77uANbUM5uX7L9Bq1xAgxGn?=
 =?us-ascii?Q?MgINICpS8C+ZEv51BlMHS46B+2O9qB1dFyVaFmbNd1p9tO2AeeTcvBy0z8iK?=
 =?us-ascii?Q?r93EOznVUxcYCefJKvW3Bhg/V40Ydekt9kdOSd1Ucd/rWt2mE/Vt1pSsGd4Z?=
 =?us-ascii?Q?Y4n2HAGxw5mIdGik1Xr1GxUAqwJcQFtz2PzRl3p0rao/qpJA6idcdUxTH32p?=
 =?us-ascii?Q?H4ohAMc24fP6Xn3kZ8ZWzYJBugycBKDuOzEPgYSx1JkerbvQcNZxJmYf13py?=
 =?us-ascii?Q?QTjpF7e64YoBE2ZUcl2JHBE8PLHnNYp5Jf/OFvOE1SDI+99RajevfcLd79Sj?=
 =?us-ascii?Q?sCqvhaF+EFdkbj8u8agATiVV3vHXeAy3d/+IokvTQBBtQC3hcOWyp+i3u/Kh?=
 =?us-ascii?Q?QIkJU61p5LmA+HGhLnEqgasmGlChFlS1JKvSwZ9a+NkDjjygRHwKumH+uPV3?=
 =?us-ascii?Q?TC5y+R614TIRlXPb15I6iIzW6m33WPWneLzgHU3EQU42KoYIMpjveHJn6bBm?=
 =?us-ascii?Q?mnS/DplSwtpvOtQNuYzVmV+IOzDodfEbzfmwHr/3j64MGpNA+rX/xPvR+nHg?=
 =?us-ascii?Q?ZBoUBOd7G5L6m/RLjjdOuArddXGCzapk29f8HOs4p+jNzIaJrJmF2Ip5rtn/?=
 =?us-ascii?Q?Z8B8Mc5jTnwf6el4w3n3dayjnrLIMTVwhVq87iURT0uG8Gf4jheQxBI0ESdF?=
 =?us-ascii?Q?1PXDdBvg7zs8cT5Ifm5BiyubC3Rmqsv7s/pxlNoIZmHVSkPHbD3JHToekD9H?=
 =?us-ascii?Q?+1cxEn5PPROTReGUukS1i/waiRboVdzzw9bBH24vYL9vmZ3N+U98yjjUmHy4?=
 =?us-ascii?Q?rB2Knn886HRMkuA1dOooWYvlSGFHbvIGwA9e+SGVyKQ8G4xfE5eN4oIbHfCj?=
 =?us-ascii?Q?RaEWsUp/ClaP/AK1XM+Wl1gCK0LdDJzqcsbxzcw9+B8NQiO39SwqCj5VGyQ+?=
 =?us-ascii?Q?nzBajZbtYIluA4mx4JrErXq9L1o5SEZRYb/F5PfCAzV9DplaXz725EqqfRRi?=
 =?us-ascii?Q?Kz6zLpBP34c04CxywZNDGXCDtDtz4mySfbVhMUcyJIIsrdRXOp7dWZTIqu+6?=
 =?us-ascii?Q?nLDIWuGLUMIeanGER3UWBKXflhTye4xnaNO+loLyzGIIQJ8T0VxGgExtBEmz?=
 =?us-ascii?Q?GzNn6Q+8PI4CsDrcrOMjItPD7RLpRPI0+3u55qxs0GTCuo60SNLjxp1CG5Tz?=
 =?us-ascii?Q?h93pTYLbpQ/lnIV+EhnU2H6FhfQxNWBZuC3UJs9RH8YK3FBB/qrdgoSXOgO6?=
 =?us-ascii?Q?0ZycPxkR3ZnoGX47jbPlMJs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cedf6891-afaa-4051-6954-08de3c490a40
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:15:53.7238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwCxx17GhL/ASgwfhRUcAeqDNYpRR/7TFYBX8EpgVwYQIssddUUqO6xacepgdvAgnRzC4zSvvw1OayeRsTWOqVhSSVe9c1z55ep6z70/sYRNDQX+06ElxuZSq5rvW9pI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8637

Because struct snd_soc_dapm_context is soc-dapm framework specific, user
driver don't need to access its member directly, we would like to hide
them. struct snd_soc_dapm_context will be removed from header in the
future.

Current card/component are using dapm_context instance. But it will be
moved to soc-dapm.c, and we can use will be only pointer. Makes it to
pointer.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 5 ++---
 include/sound/soc-dapm.h      | 2 ++
 include/sound/soc.h           | 4 ++--
 sound/soc/soc-core.c          | 8 ++++++++
 sound/soc/soc-dapm.c          | 7 ++++++-
 5 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index e538784746db7..2a2b74b24a609 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -237,8 +237,7 @@ struct snd_soc_component {
 	 * the driver will be marked as BROKEN when these fields are removed.
 	 */
 
-	/* Don't use these, use snd_soc_component_get_dapm() */
-	struct snd_soc_dapm_context dapm;
+	struct snd_soc_dapm_context *dapm;
 
 	/* machine specific init */
 	int (*init)(struct snd_soc_component *component);
@@ -268,7 +267,7 @@ struct snd_soc_component {
 static inline struct snd_soc_dapm_context *snd_soc_component_to_dapm(
 	struct snd_soc_component *component)
 {
-	return &component->dapm;
+	return component->dapm;
 }
 
 /**
diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 010d63db5436b..6f3e1b57cda32 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -627,6 +627,8 @@ enum snd_soc_dapm_direction {
 #define SND_SOC_DAPM_EP_SOURCE	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_IN)
 #define SND_SOC_DAPM_EP_SINK	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_OUT)
 
+struct snd_soc_dapm_context *snd_soc_dapm_alloc(struct device *dev);
+
 int snd_soc_dapm_regulator_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
 int snd_soc_dapm_clock_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
 int snd_soc_dapm_pinctrl_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index aa0fe6b802934..7d8376c8e1bed 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1076,7 +1076,7 @@ struct snd_soc_card {
 	struct list_head dobj_list;
 
 	/* Generic DAPM context for the card */
-	struct snd_soc_dapm_context dapm;
+	struct snd_soc_dapm_context *dapm;
 	struct snd_soc_dapm_stats dapm_stats;
 
 #ifdef CONFIG_DEBUG_FS
@@ -1136,7 +1136,7 @@ static inline int snd_soc_card_is_instantiated(struct snd_soc_card *card)
 
 static inline struct snd_soc_dapm_context *snd_soc_card_to_dapm(struct snd_soc_card *card)
 {
-	return &card->dapm;
+	return card->dapm;
 }
 
 /* SoC machine DAI configuration, glues a codec and cpu DAI together */
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e4b21bf39e59f..355ccc95f28ba 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2556,6 +2556,10 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	if (!card->name || !card->dev)
 		return -EINVAL;
 
+	card->dapm = snd_soc_dapm_alloc(card->dev);
+	if (!card->dapm)
+		return -ENOMEM;
+
 	dev_set_drvdata(card->dev, card);
 
 	INIT_LIST_HEAD(&card->widgets);
@@ -2840,6 +2844,10 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 				 const struct snd_soc_component_driver *driver,
 				 struct device *dev)
 {
+	component->dapm = snd_soc_dapm_alloc(dev);
+	if (!component->dapm)
+		return -ENOMEM;
+
 	INIT_LIST_HEAD(&component->dai_list);
 	INIT_LIST_HEAD(&component->dobj_list);
 	INIT_LIST_HEAD(&component->card_list);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 4c2007c61ca14..7aef57dcb2a72 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -165,6 +165,11 @@ static void pop_dbg(struct device *dev, u32 pop_time, const char *fmt, ...)
 	kfree(buf);
 }
 
+struct snd_soc_dapm_context *snd_soc_dapm_alloc(struct device *dev)
+{
+	return devm_kzalloc(dev, sizeof(struct snd_soc_dapm_context), GFP_KERNEL);
+}
+
 struct device *snd_soc_dapm_to_dev(struct snd_soc_dapm_context *dapm)
 {
 	if (dapm->component)
@@ -1076,7 +1081,7 @@ static int snd_soc_dapm_set_bias_level(struct snd_soc_dapm_context *dapm,
 	if (ret != 0)
 		goto out;
 
-	if (dapm != &card->dapm)
+	if (dapm != card->dapm)
 		ret = snd_soc_dapm_force_bias_level(dapm, level);
 
 	if (ret != 0)
-- 
2.43.0

