Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34D42D4B68
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956709; cv=fail; b=pBmMnh6CagENPEjIOXIiRJ/QhEjg1WGgxgZQBn4TrXa0pMl/XOlqL95M13Oetw/nZ4yKJ7jY4Jz57rRyuW4d4NqaRothvhl4UAUKe+mt7qAQNjrS1VnHaxBmhNBAx9AK9T/EYYgZ7QPa4LfAaOHwbPNVun6TdEwsSMTizV1T7t8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956709; c=relaxed/simple;
	bh=sz85t+lXlZqv/Dxvj3hEPdSdzyD86fTcxMrKgWnL1/M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OarGpQ6NhtF7rWgds9Id67dT3aNqLY+/z7qk7O5PUO/6vwMKDDybnN2imXEOpU3H4lRUbxvIn7wJNRRNKRfDsn70hQOgZtR+yaAkrvNRIf6l9OeXdxqqXxOI4fJPYR45o8Ahdd+nij5WnqSdV/g3b+/6BN5uhQ/kVQY5U3W7ceE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UzkBGoV6; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UzkBGoV6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3GBw5U5K7gvhrB6ElezpLDnwfdH6TqWF4wyVF+AiMX5OKQT0EPzmpCaEk6VI3zyKIPg87rNzIXjUwy1U8C8LK1yz6Yo1YAdYJPDy0JAqCZUlTVoc770jcJLkI/FJOXwCn6NARWxWeU8TcY9VtqSsZ3Jo9Pq+le6b7IwSB8xucHlM3h7ZV1ZMr9UMgPWayUqJzeYWn1Nq6OSI38PX6VJzQC2SNlRFbIDhYB45Kt5wqoNSM5YlzFL+X1i+zZR3bK1nbs/YAgPle2EQuN/y+fdHxk6QZGmQPtvCK8RFzN9Y/9XLQTfD9dQgRZLisRa0KWUrZ9/LsilfTyDPvTYPGh8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zer/C/fSGKLzUIKQke2T2uA+6VryQsf4W+BcLZ2xASc=;
 b=yv2VqEuxO4+pFiIMEJkJ+iNjT5ETiOc5d5sfKpkkQc+Ap7/ADx1pY5MXYdjmURU8q0PV4UT15uAhDTLtVx8m7PGz7tXoTs6atf+OSw5ZOPQ7FjS7/lrRImh1cWtUo+0AqYxDgZhCvkM/MHvZ/mUOpxn9nz6uawEWWQjXhgZ3n//NqB9MexO144aaXYTzuj7k/CPDV8O8CaKvwGt+4UMY5l8f3s/ZqOSrxP0yFaARC0S6sz2ii+/G3s3vUUX895ND9cMnvOfC1jRrz40OueymbF5BuPyGj8ps0ujnv/2jpPRak6wwe2za1wu+1B2jbiyKc2rTIeTuEFK/h+VXrzz0UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zer/C/fSGKLzUIKQke2T2uA+6VryQsf4W+BcLZ2xASc=;
 b=UzkBGoV6yB8ldhpZRg464K/PVKjXtp0t17JZC0jQuM1DGyzsfOc+jVH8FDW/n19ejBfI5shDzJqzlfNlQgJ3XU/8/Rm9OlKAhI/ezqfbXUSh+YfKYCEZt0SOUSbAYp9A3ivJt85WRUbs26AKEMuvv/RPcEPfc4vLhV2KZuGR1Ic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYRPR01MB15951.jpnprd01.prod.outlook.com (2603:1096:405:2cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 01:45:06 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:45:06 +0000
Message-ID: <87cxx6xizh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 04/12] ASoC: audio-graph-card: Tidyup audio_graph_parse_of() around error
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:45:06 +0000
X-ClientProxiedBy: TY4PR01CA0059.jpnprd01.prod.outlook.com
 (2603:1096:405:370::8) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYRPR01MB15951:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b03b014-9b41-4eb8-09e3-08ded7db8b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|38350700014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	f5Pho6+FwwjkcQ5dosH58DAKuJGRCISTzIIa/7qSs9gpVcLBWM/yE0J7k4LB5V1Q+qtH9NXVacS9EOgs9lNeGBDZGSu+nralMMqZgp9vzULZlTRbNcQUqaPyfGG2tmIABOOQ6saf4mVP6uAmZdfBPtQVoAA086xiwdIqugYB/YyJ649TpvWjETBBCq9fqTiODYqPYTormGWiCLmqM+WE0OKr26qwqSU9PNIcQiGJSzJwty9SJkACZ0UCWxRhX7Lzjl8GqWU9jpzMITrZeXlXse0fSTdN/CcelEtvQA18mt8qGOIYu58SPspqdhzTGOmcjNIz3PhgHJP77EWkD6LUG7pOJPDhGbo/ZqojclL0+JLt3C4MaVN6xTPIHLou2cxoKrtSXEeU26tov2NP7MfN8ywyJwL+IGEhBkHxOIIMBH//GKxgX+/GQHUukfVQ6vQ6w0cP5DHA/9nfTnTmmUP1KsdHnTu/o2W1t6P4eQadh/NyAAxHmPxeHbV6UTt8Pl6S7AxE1+tFgP+a2Ej1VDOPBqiSX6YNGbSnyGKzfJmdrWSRbAp+ZSKUAX06gu7B6qAmXU/SMxRh7l5U+KM57rvSOPAPKxKwmmFd/cTxRt6D0Csu2vBeuYXQfcM5yXRLcuyNnTTPv9jXzRmg1unsmibVyg+fpCXORqCqwehkiZnhgdD9EqZcEhBNXwF/6FhYJaLFrAKRdvDeTYrtjSZZahsQoXT211GIehPvEO/MtHUaVcM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2+xoF2FweAFL+SrYC69MFvXF2n0o1RVxg4XGJoDarDW5MUtZAv/Xr7pc+63P?=
 =?us-ascii?Q?pioFLrWjlz5c5AdIZHrcxybfZrsbM4QfzEPD+/j1UIyES7ytFlICwnat4P7m?=
 =?us-ascii?Q?eq/d+ZU/wcYIsQ/V64ARabOtmmQKjkwxp6hw9h9fPisYxDaK6m5y982T4cJF?=
 =?us-ascii?Q?jiKOsoysU5b+thLXfr7UCsOEpXP28MjNs/ogc61b8CMJ+ADWmjKRiJz9Jx8p?=
 =?us-ascii?Q?E9WSoKgOyNngtEqIK5C1r7IJNfmw+fpcCQvaAa0ZG/zwhcv2ojUHMbqwIZMt?=
 =?us-ascii?Q?sY28Z4zfeI70oNph/P3fAuD28UQFhA5n2q8ZTduLGox0gjn/CUzZKJAdkF9Z?=
 =?us-ascii?Q?dWv3vnI2Q3aOm8l39vmisEfr0ryaI6tu2DTkbeHQH8JOBF/sFWLqqPOaPQOM?=
 =?us-ascii?Q?4W65ntGr1bcwJ1t2y7pyeGTD/iHMnITWZmeH2Gy7hHoZ6aMFbkc81zpgNwse?=
 =?us-ascii?Q?jLl53FQ07/Vm3MgykXv/ujfFCWdphwQSCA6btM6J4aBXp7EsHslMC/YGyPD/?=
 =?us-ascii?Q?IQgs5c8N0C/RA6NBQYK4vmqrP8GJEHFYxaUt3AD3toI4Qximwtof8JILgBl0?=
 =?us-ascii?Q?zU1lw4cQAI7RaDKtQdDZyTNph9AupOj1G5S8LI7gaahdScdcLsRekgqE+SE5?=
 =?us-ascii?Q?fnM33U60aX1wLUVMfkextVfBa9VOSocAnprvWYuuBB6/vYaGhM6UKQAQarjl?=
 =?us-ascii?Q?3a6zvvWqtKS1aBDimiqzLGePxNvoVyBHnnlkQNPpLM3s2WMKqGG3CpFPQ/d2?=
 =?us-ascii?Q?dG6Vf2LaxacbPiwZjhQ22olikw30T/+KZeCiAu1Ei16NsSeY5I8YA4HNDyFz?=
 =?us-ascii?Q?7Bkz27Y7PhEgIlrQ0A+x1d/5MLpUL40maqrRUXERs4/FdidY+nZzHB+Y2YUb?=
 =?us-ascii?Q?K8RdZIZT3jxmQ4vvVOBPdC3I+KE4K3G2kIG/ajXowAxNsWZLDJyb7xP5uTpA?=
 =?us-ascii?Q?nBRdBflIQJW/d6RbOE7JcnKjVC6S83qV6w3FC4g8ZX26XETwfBCiR4/orOOh?=
 =?us-ascii?Q?QEu7J0Spm/hLuYNfNKV7CqH4suxkqTUjeu3yXKHk0ScF52PyT0jGVeG6maHJ?=
 =?us-ascii?Q?VjzUgzZ8MjFJ9/KWyxu+sKad5adRmzgfQuDUlNvYG8ZEawzaqKlHyQXQJ5vQ?=
 =?us-ascii?Q?CC/PjQfmBX+BCXIbGKYOPPe9SqwoDjCUCafunhOzna19i1LOtA9aYVZ4lHp3?=
 =?us-ascii?Q?JvrAnFsRNeAKx4oV9K0skkTxETOlO0hJ/Bt4eBmRzroa1mY7yUjZGouoy8Jg?=
 =?us-ascii?Q?vAHO8uK+CMGgnGS5CY3ZThC6+nlP6hEkP47tqSxuxkHXM5qkVAjc6v71i5h3?=
 =?us-ascii?Q?8Yn9CiYVjFnO/WVKrtbfJkoWskY+iVOn38/RPgY4msEmyacoGcpwH3AFMJYC?=
 =?us-ascii?Q?NYZ3DNVGUonRXwcXdL/jXHwUvMVhBNsCr6/9jFhiYYeHRbVLRunvilVbY954?=
 =?us-ascii?Q?Bn8y06U8gp8XH9l5DuM43ZYjDx7XflTUQ9FvIajqe5GD/n2q27jYEcOhTTID?=
 =?us-ascii?Q?Qofhoi/blUdZep+bcPYdnQKZXHJ4RxOzU1o2J3OX+sdNaEbh7SFu4SGMoky/?=
 =?us-ascii?Q?raDaNs4MkcdVyluLbSh5DAi10+7X7p0lBGry5/aRQD+zOsFe8M0gmI7a/1kY?=
 =?us-ascii?Q?DnEJqtLnCEsb3uw1kcIhfWW4ZbvqzLsR+MC6ExwonsfScKw2PFi6bQJ/+v1d?=
 =?us-ascii?Q?uad/8kOCoREyRLecT0MZtwX7PxLTB/nDgY2ku2f9m4npFGOMrezkjwzcI381?=
 =?us-ascii?Q?vTjbnGSduDW4Uvrh5Sryg3FZVv/OqIa5/id7641ZJ7D6zBCgnS0b?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b03b014-9b41-4eb8-09e3-08ded7db8b07
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:45:06.5025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEj/Dks44q2ktubv3LRbZGtlm8WggxbI7B1+aWz4voYVmMogbJVWlDx97LqmoA9bhMEL3Hze9w0BObJmVJVmw3rF9ZNs5arqjhtZ3S9Au9KdT23Oi0TEsTv7QQD/oqyG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15951

It is already calling dev_err_probe() in error case, no need to
call graph_ret() in success case. Tidyup it.

Let's keep same style with simple-card/audio-graph-card2.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 18ce4ee063509..42e1b77fa65e7 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -603,14 +603,13 @@ int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 	simple_util_debug_info(priv);
 
 	ret = devm_snd_soc_register_card(dev, card);
-	if (ret < 0)
-		goto err;
-
-	return 0;
 err:
-	simple_util_clean_reference(card);
+	if (ret < 0) {
+		simple_util_clean_reference(card);
+		return dev_err_probe(dev, ret, "parse error\n");
+	}
 end:
-	return dev_err_probe(dev, ret, "parse error\n");
+	return graph_ret(priv, ret);
 }
 EXPORT_SYMBOL_GPL(audio_graph_parse_of);
 
-- 
2.53.0

