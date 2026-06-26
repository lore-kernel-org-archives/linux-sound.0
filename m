Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF0D1EB1AA
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782453870; cv=fail; b=FpgwMMXGkuAHdfg23XRI21c04NQ5a4CEKAwtGAuBhpgjHk45QFNe2Cof73AScU+TaIXwQMSuRqo0mnXyB3vvRqRctef43ZcV6l2JwgqE3UyR2P7H8yIRA1M3oqULBapCB55QbMoR/ewIxPbuHwsa+HGnjTh1EUcvqGngJgrVWqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782453870; c=relaxed/simple;
	bh=iWlMSnys7V4pshhxgH8eylcE8hTsl1W7Qc5d03OiJ+8=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=r02OZonX0qzMrZxm9lRKUTGERWoa3A05edxbPCS3V9swqEZmdekYfRu3PsVs3JA2hNzXqWn47nzXoKnMu4EqpR+DQB+/8seJrV1xJmVmx9rOT9jUaNu+EgOFO5O9+cKrA6Asu22kFgoTj2zKSaE4KslbFaHme+8w+Gpv4FTDe98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gfKoJ8Sa; arc=fail smtp.client-ip=40.107.74.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gfKoJ8Sa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIG5ZQ6Kw55PwHiX6/1/b0lQY62QIp8s773aJqTnMe3Sa2MZFKklMxeGFQaEgGHkvXQP3aG41WGdlsf8+vGzwZvuxbjzbA2nW30D4d0ukng0FIJwvp8XEWI1drJiLiOsl6BJ10xlA8nSRYcqsYIW5Brg+2jGrC89mFUeUUN+NUtqC5r7q8DjlsdiRlpUPNQgmD8I6dvdtZH00M+bGyZ0QMDp7GmWYNZlNEbJWS2yaz6mzAM4QAaE1nGCx3UGx+abWFGeVGxWfh5a7RFIWT8uTXEdB52EC8Mw3umt4eHflmBUjkAcQnM9OOyryETDg+V8tcMRZQVGBmWl2B4tyScL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5Fc7AieUiAIpZTy6dZT0yx3pd+H2HaQE1I4RkfmQvI=;
 b=MRnNwrOOGt8PDX9zDvpi0yed3PJ+b0Nr6m237YPVXCEx9odZTWqIJuElJFNQLf2FG0XmywBmnb/fSAMI00pw4OlQZQdM3Z3kS7SYigIsatjaUtKcPQnzlPQbI2TPM4sXglKqvwjahH+IU5dcBbP15RoxMrQzNdgCm4MAfRALyB7ZlXzB+pP+0oQaxppbZrnfkQ88FDXSIpz7kphIjKEBR1Ijc4D/VtHKLKhk6IFM20dRW059YfD6D1JzXPl+1kiWZ0O2a9Iazta+qXyVIw9z6ffC4gHD5lxb8TBfno0k8IecdqpB6Wz/FUknrm268vLV8Uk0yq9a827GWBtoZ+dRrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5Fc7AieUiAIpZTy6dZT0yx3pd+H2HaQE1I4RkfmQvI=;
 b=gfKoJ8SaJfGxr303O6QuYE1GiGZYug/EhpfVTwAadBFitxYXRAwPCvSTP7KZ9VJwYKs16NbW5GyMHVOwwyTZQRMSOElGH0TvqdCgGGyRBkR/+KTbzBHlzk6BqRlKmTAtx6sdPzHuXjjs7x1l7cqbzIuiEEAjwhHX3Njtyndh5Dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB16025.jpnprd01.prod.outlook.com (2603:1096:405:2a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:04:26 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:04:26 +0000
Message-ID: <87h5mpet2c.wl-kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Takashi Iwai <tiwai@suse.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: sof: topology: use for_each_card_rtds()
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:04:20 +0000
X-ClientProxiedBy: DUZPR01CA0303.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::27) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB16025:EE_
X-MS-Office365-Filtering-Correlation-Id: 940bfab3-8bb9-422b-ecb6-08ded348c6fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|23010399003|38350700014|921020|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	h7t3FMGlpP42D6WOEkqdwchRl7No1iKr+4lagweOlgMsIsK3hKiwq38FgWy2ctarNXF+fR7UwVsrwwlO5sQWQullraUkJN40mb3xYA1L5CzbonZGyhnrP43blOpHnAFLOvYTTjpcG2ssKJnP2bZWcLNxC13Om8XhXCIQIGstrPhhf9L3vOpm2Caupe0ZCz5gxIV9s7YLzXGSeetuANKziTL+EChXJ7UYeFLnKQv+OrkUUO8AHbnHBiAfU+kjfYMeR7z0Ki/fGpIamhfTM6q2JMjyfZQxNGpy83/F2ScgNHFU6/DTOQHp8i1wZGaKme2QFEmID3kp8aXM+gRb6Y+1kUvBQYE3iPhe8Y+NrhT3tIjm26herFLBgOlaIbQNNwqWLTWIFygmBk2Wt7Dgi58SjDsPdVQusvYdOj7C7Linc70Ky4YTEW5X8VhbBBdeq+rVMHL3MdspLWk5f45ImgYmTf0b4aJ4Wtu78Kmy/O7UDNwpfzJcLlhrDqKbqcALrLi6LokFRWIsbYX/hZwrEyV5RGEe1K7z97J+kQFAW92+cdiyxa3dfuc+bWXIqsBawp7iTim05xsOU1K4zRYz/h3BP5+XWfw/H5KMVZOjXJ0h4fWhiqbouBAC2xsIdW9xCbjbyeBt5A4lhYBxuO7uMwEGAAOG0Fg6mU5HInk/u0Ax0LdpB7OhYMxrD5Q2mOR8/K1bghfOHhxwOKQG4wcsCSnoVBCGiURmdWPsjFRXFyaI1uI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(23010399003)(38350700014)(921020)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XmIaTHtD4BFroaAYT20MfZqZv/TfdQVMtYe8a8y28+/e+7CAjIXqIy2XRYjJ?=
 =?us-ascii?Q?Td0E3sMNZAcv0/O6fYca8apTJ4YKqTSO5HobdldTC9ZYIVgLLgsah0qvBH7/?=
 =?us-ascii?Q?aPAk8ZDld+tnr+N+l5BQJ3MkfFa/9OWU4HR2qbNzjghhHw6bOCbGDMki3aR0?=
 =?us-ascii?Q?fPVDjXSobx+c4Q1FVDoa1NR9xHaN8QAcIWLllg85UbpLle8oNOUBjXs7Y3Oz?=
 =?us-ascii?Q?t1m0MKWFjN/al9R4Nvu+SU2NYQba/uUGfRoOe4o2X6+5I0wcAIASbVftZhmx?=
 =?us-ascii?Q?uEKgBVi4SwDA9htacm7FnAUOWyoLnJMdL2LeiY17hh491vS21iZ4nd12JXxT?=
 =?us-ascii?Q?dF/Mhqffo7cWLy8X8rZ8pADPwvOHGsu/MvzkRI7ZDCZgpd6ui/k+NxYV2nMr?=
 =?us-ascii?Q?WJwoTTT0V/bQIEyhn4lo9wntjBBVtZ0y1HtDhgB48NSqqm5SSAco7C2HadB2?=
 =?us-ascii?Q?IQBfSvQKgWu0jMO/JwzsiAttj7Rho/v69fhoGmW7sUcHggwuvqS/aznxDNSv?=
 =?us-ascii?Q?diBA7ovIH0rtb+2cr+HYytUCgH++AfTGSljoN0rv0N3OCez67/ldpE26vxvu?=
 =?us-ascii?Q?Qt6/rbvxqxlX7a0DvqoVeNTEbSbhE+auKharLQNj1pLKZ04XUnVghVPEQUYB?=
 =?us-ascii?Q?LmZUSTY34SnMVVxkp6w8kud044BETRJ9Prz3Bi19iiAWl1DZbZiIxzogTYIk?=
 =?us-ascii?Q?sxsC8Ttw9DLNRCWQY8UZOS9v4ATd0ibYWk6z9HpWfKcTmtrL4O25xI14O5My?=
 =?us-ascii?Q?xRQbLVPWj2JmKfsWVMPYjc9KuF9dHo6e8h8jBKtlApyOIYQXH/So3rqiZ1X9?=
 =?us-ascii?Q?NGj8BvuGootBkjZCvUVAoSpZ/2Efm4cb2NW3IbMcHrRPGeL8ZQaq7gK59HdM?=
 =?us-ascii?Q?vqyWDXEXMrID+tjk4WTwjENnmdnUuO6UoQuL22YV0gH/WnILCkevlLeYDdPl?=
 =?us-ascii?Q?HZLLEfDS8+KPToLISwxvgawqBikgf0USh4UaOJJhotn4vDPfBs1L+xc2sWLZ?=
 =?us-ascii?Q?8FJns3a9xVBnc7o7onY508Aanla7lVaK1+W8kxqTyNUKg5ORnBjRhsyFr+Kc?=
 =?us-ascii?Q?FjODDsLRUdY8WwwgNTtAmjv7S5NBdPlonOOdTHoR8bu+Udea5TzC8hqa5y9D?=
 =?us-ascii?Q?ZvEy1KnZo/96nL44Z1Lp6Grw9P/d91Ql6/h32DQK3cEnYwPX8Fqr+volKMdq?=
 =?us-ascii?Q?DNinWpblP5BG7peBQvgj+1tOK6hghUuyGfCUpYoPe1fV8lUqNzBiINRvhmeJ?=
 =?us-ascii?Q?NXlpjym6DX2KaK2uHZXfPDhIpzF5iustwE7yltBuqAs72/X8BHnthvGMmVNV?=
 =?us-ascii?Q?BAisJKBJJLTeOs+4bbKx2fVurYZpHf6OFdfd1sosZGYGRikFnnN4XtzfJSIQ?=
 =?us-ascii?Q?KtOas89tnQIo5+bw78wYHnHtQtvsB0x+eEbfHu91g2LbPo6gLRB6ZH5m2LYf?=
 =?us-ascii?Q?rovwPlZukg4qvXXgMf2UQ+F1WRqQIPaLHjlVmplVWu7oj/Csjc1+uj+eL9YN?=
 =?us-ascii?Q?h79NAGCXGB8NgT7bs7QCqUL3nuBGAk9ZM+8vaXJxEIETAcexhVd/Hx0Jvvgx?=
 =?us-ascii?Q?0TiQ6XbKL8rWCZq5DtPo6HH1d9EBIWW8VuHcxd5uhMVRyBzTWbY+BVsM6uGe?=
 =?us-ascii?Q?RHkDzro2HuV+81g+MQStH/F6+5XTVTZmBjC/X4vKTXgKcG176GvsLpuDgDBz?=
 =?us-ascii?Q?p01s4Wplc9QhR3/2mrhSgbRecQ5uARYeJODiVPfEv5Xic1WXiJtV/cQh6LfF?=
 =?us-ascii?Q?xbmx9bNfkzZ6YeUnYNl2OUUsMqrZH2V5yAWK3l8owYzRrssfJ5wn?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 940bfab3-8bb9-422b-ecb6-08ded348c6fa
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:04:26.4463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YXRqKUjlmAJa7Ejoizk5DIah/9wfxQIswVA7whjdV8BhvNl9MQVX74voka10Bm5IZp5gWfrET3I4pv6C7Kf1pW+JAONjQEW/SbcT18GE7fAnq1jmXcuU36fxNQSVb0T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16025

We already have for_each_card_rtds(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 42a2d90bb705d..17766e6924f29 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1102,7 +1102,7 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 
 	full = NULL;
 	partial = NULL;
-	list_for_each_entry(rtd, &card->rtd_list, list) {
+	for_each_card_rtds(card, rtd) {
 		/* does stream match DAI link ? */
 		if (rtd->dai_link->stream_name) {
 			if (!strcmp(rtd->dai_link->stream_name, w->sname)) {
@@ -1167,7 +1167,7 @@ static void sof_disconnect_dai_widget(struct snd_soc_component *scomp,
 	else
 		return;
 
-	list_for_each_entry(rtd, &card->rtd_list, list) {
+	for_each_card_rtds(card, rtd) {
 		/* does stream match DAI link ? */
 		if (!rtd->dai_link->stream_name ||
 		    !strstr(rtd->dai_link->stream_name, sname))
-- 
2.53.0

