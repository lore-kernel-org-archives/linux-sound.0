Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010021.outbound.protection.outlook.com [52.101.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C7932FA18
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 23:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790724987; cv=fail; b=kiDLHanlm/C736rZKJiOJUbq6y4eDFxYVWssMvnw1Aq+fOznSewRaDI+a02IEVkiyHMOZv4aUABrMagZ9pfbG1a1EOHjJ0iES6hIy6n8dhTpHMpudz3Pc6RYYqQrbG44WEDyJiY4n3cDwSwbEsDc0ViFqzes9Yadvf4YnGBJtOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790724987; c=relaxed/simple;
	bh=Mjp8TNyp5GFDZTBL+x8d+ySqcXjkasIlrAUpyhT0QuM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mC4/l/1NMQZs818i2E6wz0woxRg2DWPPBu9+OO0xCUYwC4bKg5qCHsZClik5cJFtppZj7aqoYCgPv5i13DSd2lXuV0yW044txPDgXIHdG3pYTZx8K8w2R5M9uQ2nCZytH9VaudZ3r4SGmAdPT/5IAc+4YV45u5PbvPymveBndQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jJePFF7O; arc=fail smtp.client-ip=52.101.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jJePFF7O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8SJvaNTXsaLU9ZxCHCx4x8vc1qSt2IX41dggoKiVyIxaeC3v2G4uAic4vujyrlvDbA3FqquvXyiNb/gmFVX3f0GbuZF1StP9uW5/ACz4+ETzMJbbZD/9/94Wh8ACw5yddhzH8JHnY/2NErX6/dbhVOrRXLJ48uALA9PzFwxDjC0AJ3Ah+boW8XhwHroPJx2cMcWFwem0sX9v42XA9zJyT97CH+v/7kh3XPMDwqHLs6omHcDOMGHp7WsFEKB8aEHnnbiTt6TjaeMNZqD/17RrTBIM1fKXdDQgh3RDSqDeRC/JCMRFis16CGfDKFLO6EKxScXYBS3WfxL8gKY92VjCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+G8/B/5Fam3eR4E1Ura0jc5ntcEEw2n+XAKVg+gplvw=;
 b=BZIqaP79jqk+y3fKv0eZPHGZyAMhslcfjEec6zfNGXUfkcOJ5S078thPnb750bvZ2mig+PKxhVtBBHYy5N0gtEJYfi20nA0nbc9j4KuTO1deTXexYRo1FdN5cXEspskoPGIwP76gwFvBPnSbwCMie6fvWJmqGWQGCZE+ewnC0A52NsO9N9mjRWZbbhIWjuYahg1Ke1vjJkNmRy5bYC12JgJNgUgH16v6GHgkO94bRzBcMqHJu0lect0harrkCil5HALU9+OsgCl/p/P/ImVXMXpLou1G5eCSJwoXt9uerRkfkZPvcwhkzY10gzZW9VuZTCF+uSqbuK0q2VhrZ6djdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+G8/B/5Fam3eR4E1Ura0jc5ntcEEw2n+XAKVg+gplvw=;
 b=jJePFF7OtfS30xujWontFkHhmdTUS0g5mj4EPBw/lBIkGknJGfNXUEAqEZRRyok8+mZ6F7pbvy9IRV512dWms1Ce4lqeOYD2luglHlHJGB45zTsFuf3Jcu2mp2mPO/ztB+b996CLBjsqG5NEZL//twZmW/hCQnSeUoRHhVP/eBI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYRPR01MB12172.jpnprd01.prod.outlook.com
 (2603:1096:405:100::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 23:36:22 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0472.015; Tue, 29 Sep 2026
 23:36:21 +0000
Message-ID: <8733ursk96.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alvin =?ISO-8859-2?Q?=A9ipraga?= <alvin.sipraga@analog.com>
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 07/14] ASoC: soc-component: move soc_{probe/remove}_component() to soc-component.c
In-Reply-To: <art0TqnGvw7Ci21C@analog.com>
References: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
	<87fqyseiat.wl-kuninori.morimoto.gx@renesas.com>
	<art0TqnGvw7Ci21C@analog.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 23:36:21 +0000
X-ClientProxiedBy: TYCP286CA0140.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::14) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYRPR01MB12172:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d300cf4-91b1-4f82-f8cd-08df1e8277c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|366016|38350700014|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tM8VJ5lSlBfivRFkP/fL4swZjF6n+fsx4KE6v2uaczfYUQbakwVpK27+OH2xSS4iGBy0Duk0a0YK5ycENeROE4ciZ3Lp/Q8s0lH/i1+g0Y7Qee5hwH9+UBc7WYYY0S/mXxR0Iaix1iwx9atv2EGJA78p7v82yMdY8igfgdQ8SuLVjx4TrIhf/fcbyBJ31B4t+oKt5Dc5NNBWjhxZ4e6+xbTwzJJpjP3dMNfpeulxNzc/MA2B3hvBzqEkhEqcEEO7S86jfsiggEFbAOVbYAFmQ67G8rY9G8bgdISdJJxUoYRkAk5BykqnYWKbIY5lzjtAgjyr58c6r74Mzm4XPl6xc+DS3aYsWJrWpejHsUfQ4+fjsblA6s+Rf1A49iUYLMGWNcAtIqKMAVr2wMaSS0msw/SwPiBrad0QTpsHfxEJt1Xs6XN+icaCxb5awwXJx8MkjD2PvqUDK63iiWHz3vhmrcJgsgYOUwUK7vWtDOw6mK6qV/WMROn0gkBelAlwG/Gg7+LTJw3oKeYWAMlHkoIT5Fn4oojWNtS424H8/O8culrsvn2I5INj1XTDdtXQLcg65ZY4Cj3DmJrP5e9eoJk/P0xADY4PZwxG/gM10q2bTutRxB1obL9Z21ii7LWqeQZ9bbqeasqZc92VEY158kYZNZMh7NlF6MA4EhOnVQ8CxnuUJJEAEKP38duchmG1CPHkbA8A1Yy3VHhoL5e/Ox4RS2+KL6wGnW1fgSKjv2J+Wnc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(366016)(38350700014)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BUThnkWRNlI+Duz9V5aKteI9NUp2oXsoR9Ae8Y3yonbmSVIb/A5VU5lcRDU1?=
 =?us-ascii?Q?0oLKAddLWEV0PQXYwHKc0xjfW7zg9V/BglPBT0hOYmN6LbLzUfNVPlabN3es?=
 =?us-ascii?Q?/f/DqhVsNQtRf8IJAky5NWniF1A8Om0KSepmA10xqNa/OJfaLCj7x4SrUjXY?=
 =?us-ascii?Q?NnP7/2MD57cM2jMsvK3BoB0tgh19Ci44i/TxEaOvTZqsNrsut8GdEFssLXYx?=
 =?us-ascii?Q?WYoFFsv49sv2jffCITFy/5hXCaFuqtQZFl2+dqvDmUDM3QUE+vizo9mU/3+Y?=
 =?us-ascii?Q?YcSKXBF5EuG6IAUpvkB6GI/3Ktd8VSu5IDVHVHWE7E2UBCxMiXBvPGii5fHD?=
 =?us-ascii?Q?dBsVMAGN6raxDok6Je4NaWZuozSmeVgkeLsl/614AZmVmm0i/OMuQx5GG8PH?=
 =?us-ascii?Q?fEuOyWyTohfaYNig43xbiyXWIeJK6Hc76X7yhofhhKUgvv0VHmFZGEbW3dfm?=
 =?us-ascii?Q?j9BwKZ3DcBLXHv3W4aCEXJyPlw2qTD/KCbmYbn7jngRq//oyfmxGfEuuJs5y?=
 =?us-ascii?Q?kcOv/c0K2njWAs06fkI3IJ6bFwfiAJOGZsk4rcv0L7veODalduS7BFe5bHKs?=
 =?us-ascii?Q?ihSShn3DniguPaWt4kCfirDIXNcOARrkmnJPFe4GzjOHbXVEAephVqo5ZYFp?=
 =?us-ascii?Q?jNpa6Tz+GreuXBo0s4+bK+A/NMKqQBqcjP/CuB8xe6hrh7kR4E75j2X8Uk5o?=
 =?us-ascii?Q?yQNqY7vPz00N+stKnh9jWb0H9nATk+UkTzHE1lOrlhP+pR2lETixZPaVeZGj?=
 =?us-ascii?Q?HT4MqgbryfKpL11J9diobbu8Ta7YUQCRRz6dwayu5E+7YbC0QTQGWTjbX10i?=
 =?us-ascii?Q?JTPiXA++bH2KTF0WW+niOJSdnRvROBTFd9hv6vs7LRYbFQCakC7mQmrqwNli?=
 =?us-ascii?Q?1GwKfLDAcUqTpFv/PK/68TkvHIIRED2gvqwEVPtfFIeCWOSnkXO/SzvfRZp2?=
 =?us-ascii?Q?iDoOT1/KuBbCE+mPpFgYPr9lrm9QQb8sk501an+YhpPW+xI43LUxV/vx+BPp?=
 =?us-ascii?Q?6fkI5njRHk/POlKlDZboHTYhuhyKStfdoL58KkOKUMY0Lcbg0LZsXPVB8+5y?=
 =?us-ascii?Q?7kSIVguAjvj8rBKEw1j/wPCZ0iTgdpU+vTgxASYXrEkZpDYR0i/4Ddx1o4Kq?=
 =?us-ascii?Q?axK49lKiKe9apYkxyy9C/KxFKNFzJTcXJQuf1c3PG//+QxnObSS6Nni8sSqN?=
 =?us-ascii?Q?H9wTBjgNhSCe/8XvxuSI06KcyXpsIhWH4mX9R4Fsaz3C2e+gGJBzgeYw1kai?=
 =?us-ascii?Q?gnRrsa5cKStOoNknepX4Fy36Gfx+XTuof+Fv/hTNohPBVTNmleGu1/HPrSTn?=
 =?us-ascii?Q?cfeSzkPZM4PJ2OebxzpXZBeDeg2G7cAt0SFC97kdHnEP09nNmXkBozJgZh4U?=
 =?us-ascii?Q?gcBh5mQ0Lge6QUANLcFXdWGKY3EFyi1iE5bG98YNpqC0mUneNEACS1qSH6n5?=
 =?us-ascii?Q?RxvTbPXd+RzI/zK+CAYhVUL7j0qKUCss0urbtzVfZtAtqQ+gbwh9mzVBZ0YR?=
 =?us-ascii?Q?/+gWkKgDEMAMkSeNhNPu0tHxIgKuS3t3ws+bTqqXi2CdinMIcuC9A88URS+b?=
 =?us-ascii?Q?aeE/6XyBfGdumn2AR0Bdn48hmueVfiSjkc13RszKocBxh8WPHLvezKIxfnzf?=
 =?us-ascii?Q?WmXhuP71YK0Xbuh+X5nksYH/iLLcqX+/Fmu6gYMZ0eQEfQGkdvrkdyvmQdLn?=
 =?us-ascii?Q?Shi7Jsr8tiLpy4UY2xfLfwzG/vzubIFKw9fz5ZPvCnk6VBXrzRz4Kn7Dw9wd?=
 =?us-ascii?Q?rSFiESswbuW1m2pkGZXOwSOd2EPok2anvm9yM7aHbW/nvPShtmvD?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d300cf4-91b1-4f82-f8cd-08df1e8277c6
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 23:36:21.7458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwgVCKAwwkq2COKDwqKarlmMdOVEu7z2x6QDarHEkyKHmqP6DOnTXJ89vM1FfSCOPBiZUHz6z3qfqMxcEBuSsOJeQvK9NLFmtqSLMxYEjoh4+H/skJoBb4Suql9EPZAY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12172


Hi Alvin

Thank you for your review

> > +static void snd_soc_component_set_name_prefix(struct snd_soc_card *card,
> > +					      struct snd_soc_component *component)
> 
> The card argument isn't actually needed here, since it's already
> populated in the component struct below in
> snd_soc_component_probe(). (See below). Maybe it can be dropped in
> another patch.

Ah, yes indeed.
I will fixup it in v2.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
