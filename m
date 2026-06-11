Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3A83B2FDB
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 07:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781161319; cv=fail; b=OpJBuP/qgdGjmRX3tiDHTyTRX//PX68CxIUTZevav10Z93G4Hb6ZUHil5RPBpRghKqyndAY7Wdr6wA3O+l/rfbweIGqJ0hJJ989FFdwcXg/u2hEOsP8bk5c2T6eoKEtVk+1XUBjS/DpLm0YMbOxQFek8qmf2BUXSPgTTV1y1zr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781161319; c=relaxed/simple;
	bh=9gUvAsG/EjyQ0uE4UH37uV6TW2AheSepUGiWjk8Mmds=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=e9iGxDwqm3+0PZzxANt92ZOsFkfOO6Rag06jHLgqejjSIiIJsuYqRcBwJ2FrA73dBh+M+qeADuPnetrHPDkUsHk0i9b6RMbvMfmuSrBfV2KBBs0ZvV0ECqsrGQegrfgppEvJyjFK5iV/WGFesNxfb7Q/PsMwDtR9tdmvS5htth8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NyM75Wj9; arc=fail smtp.client-ip=52.101.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NyM75Wj9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiY3plla2G5rbRCUGoBGKFZl14xMG+8uCRvt4jncoT08Pi0hcK1yroOXzhyPn2UR2/ORr2JB9g+3kbBFmgHS6LKSeN+qAeVSbL2W9ZXvuT8uqKqZ0G7J/LeB+t+beL6bTT+x6+e6mBjtVcWt61nkRNiiMkcvgFUBR7+jX4fN3HAI2LUE78fU0EyjqOmZjeW/pApOwQrz15e3NlzC0cNoq1/Sh4l9uiPGtB9MmL7774dovYTymOPnTj0iXlI3DBq6mLygL+iLzqnaGCBbsLnKo+VizK8rgXEAawG5BfxKvVol3QvKLEbMJxMfA6YbD+/rq/veYuL7nTT5aed9KiHgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWoVxrT9uJYAGLX270KIpgFCeMWo/x2b25hqnRff/Mk=;
 b=tszwBLVFYc9CMeHB68KvNPLGBP4IZ/qCbWwpwOhHomCYyM/BKVprDgxO+DL3UhvqnbYQN/OfvG9f5cTDiIQPRpVJZNdMesqSycSZ58U1HiK+JdrSPBs4lfd8QWyAiCt86PjG2l2+nXOTmAsNO8qyIVylsR8QiwQk1V4KIbb/otkYp8r5sltTXtaYU2QEZ2vVLrzFfYClY1WmywxkKsMyaWJ/Nz3u4pJ1xlzPPyzPag6T52CVvOmc75Z29t5yDj9m9fAhY8SZ1709GduRYVhwyPN3BmJNq+raSvtZ7bWrimeT2Ca+ucoUIWzud3AXugFUFpo6KQxrsKJe2VzhWSJKQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWoVxrT9uJYAGLX270KIpgFCeMWo/x2b25hqnRff/Mk=;
 b=NyM75Wj9dkRmMjPx7xC5xH7dL3Ge1eCOSoN2xibrJNyjc7+y0ZGG2hk3bDYBxP5K5gnkmozUouizYPHJE+GEEr7gN7hz8aMPaG9G2FQo+FncS+vTZI2Z8yecJuhz7R7YExz4ANjjDsQxdlUZdoDmDxYgUO3V3fShq4NROIDAeC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB11962.jpnprd01.prod.outlook.com (2603:1096:400:3fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Thu, 11 Jun
 2026 07:01:54 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 07:01:54 +0000
Message-ID: <87wlw5mufz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH] ASoC: soc-ops-test: remove component from soc_ops_test_priv
In-Reply-To: <ailKjsngVh4q91C0@sirena.co.uk>
References: <878q8wcjuo.wl-kuninori.morimoto.gx@renesas.com>
	<ailKjsngVh4q91C0@sirena.co.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 11 Jun 2026 07:01:53 +0000
X-ClientProxiedBy: OSTP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:219::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB11962:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d479f67-10a9-4a90-3a08-08dec78751d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|366016|1800799024|20046099003|56012099006|11063799006|4143699003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	07cr+w75bxeM83RnWeztkJ26NR+DkGobLiDuSjtDuuo21Ab+DghuauuDT6faBrVzHV8N2qv01mudIsXhs8CfGMEno0DcDhWq+SfT/h4uOLT3ruaeHv2p6elYLaxKjKr4KUpHaCJ2SbNZJ9T8ZffSYOxpz5vg9uuIC/fIHbIGuq8kio2dI7rLXQNqLu6SkiZiwAXWB54gjcDjZGTp/b+tJzMxKqZNgGXYpZg8ZYrAtkwdyAPO6utextYsxEs6soneayv4cgwO7ixwNj5MR3trM+MFk1R/J9xuUxPe8FmUbJNPwGsbmN2jCi6grAMJuONK8rhFqkXeoIxX1ygZO28ymLmBcXlxnxAYWsfprHylYGXhHpw8YVuDE0Abf4VfZv4f0LK/RHp8SDyZOYLp6i2DuMaJXz6O8bGaUIfZ5VcgAi28tNJcop82QQBMZ1IJGrO3Cl0LUDwIjQ0kQcQQVWYosKy3a5geoRvC9ti9gow7CVfDLsA3zX3j6/0c8P99y2Ji60vbYsy7QLApNh7hQxdGAVTSKAewLxw0SXuo8Y2PEtJeGJF8kbY0A2Bcemk2//L1x0g3OhcO5I/ogR5AXgEVGEztwLWv0mZV5Q83UKm+NRY6psrVrI3IHSEulKSQJdujhmjAMJn34xdTWp7wwM1vpSObBWM/RiqPQgAq1wJsoVDJWIHcPllTYum4ZKNthMMsouEcGzy9TksuiBnromCFKuqWMLUjIcPvd7GciTWZZL3yypwJOnxSXqNDKIIrKs6I
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(366016)(1800799024)(20046099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M09aqbOejsvx8faIEV9SRG3uFCO8xQcxf7ma5OThB+Aub0peAjhxhmJKhHLS?=
 =?us-ascii?Q?jCtc2fqa8kQua+GJXTBkStrN0MGpq+Te5/rvXRrA8M8MdL3abFxFR9vgQ5+4?=
 =?us-ascii?Q?ztVRCCEBsIxVgYtrkwjF8q7XinSfSrlf9FesFMk8mL2JP4TRBTqZQJjE0HWC?=
 =?us-ascii?Q?7DkTrOY0nhWWZwYuXFg4r0nhJEWvF6XEJ9NL16z790qm3TSfOSbJUlyebzz0?=
 =?us-ascii?Q?uiN/PeRQk0F6p1BJqaOyUXC/vSfxFpKjL38hEFff6QVtwQsLYJwn/4KLcqK8?=
 =?us-ascii?Q?CXF3fiZOkSsUdmXPffnHLzAzxllCY+AhAvTMjQ8yQ9iqo7frJuQdbijGWyxl?=
 =?us-ascii?Q?KqASvcld8lISfVLxT70PdqLyxq9v1qCnRtgXuz6a5lInGhi9Z0c7NUVMtK7j?=
 =?us-ascii?Q?LqdsbOEdQ8gND0ej6L5auuin/VByqeQv2qNvX4zxaOMFGn7KyA6zblYByuOa?=
 =?us-ascii?Q?NZNwhR3hHP8vcRU2/7xlKxXIE5wf4ZLaJu1NVA9Tm/JTGDHUleykKF7EY/DT?=
 =?us-ascii?Q?rC1VaHQFa6D3FSI36qoxe2W5Ay+HqR0xbBuZOW5AcvC5Vh+RDtkYfkXURrlt?=
 =?us-ascii?Q?xSyrJ7aYLuH3OhH6l8qAOh8uSe/wPbYAJ2F6KOyXqRS5QJHvc5JUOxNWNmmD?=
 =?us-ascii?Q?NbTUjiC4TsVatevDCxlG/+iEZQuHa8VAQ7axdUmLFGiCGjC9s+widR+4iO5b?=
 =?us-ascii?Q?Nw6U4HmulzHqahKAMvnuFfLmwdf+1n+jtcjjwsh1JzA1XtVxlfj4OVkXGS4O?=
 =?us-ascii?Q?X7Az8mjVi1W4UtMTpojuMjcuIPAeYWW2oaysJU5bj6qU4Snf3ezr5M4eA6jM?=
 =?us-ascii?Q?64uPts91Trc0gFrjl7PXjoaECyenxl8pkVVeFRLgukEUWR3ZhS0P9mTOWMoc?=
 =?us-ascii?Q?Se0p13B7Y2njJ4Glo2YDJxiAll48GEQ/AKgIxwo6am3q67ZkDxgSVeN4Q/MY?=
 =?us-ascii?Q?qEoc/dT5UhtM+hBYTZGY3iMnyOBp+O9BN+0E4IUl2HrdrlNQcvZfs8IDrfIv?=
 =?us-ascii?Q?yYnEglLPCQQ4Cn1QGZ+rpZUKtG5JXdacL5X+3fqiyqeGMvbRh5Gcbwvk6AWM?=
 =?us-ascii?Q?x4Wvv/Z64PHn8NmL8AxA66vvWZLVrLaeqdhNzC5y/MF9tX3WrZ+jTVzHOw3a?=
 =?us-ascii?Q?b5aiS7B5qwox5kKgfT8MitHoC27eKRDbu8yXo0sp24B0KSNziKgMznt1EB0B?=
 =?us-ascii?Q?+/pYpST/EGBtZNqZSSY1/cZWfF3TiuJHYN7n4AS8vG+Ck8Gn48GXoLNeuYTr?=
 =?us-ascii?Q?AmbXCYjjqNTnNrERzF1qbN+pqexOFKa13trLio3uxI5oVnZWuDNadMIIeUd2?=
 =?us-ascii?Q?+weMUhan2prH0MBeB1GW/jhaXmgTI9jrka3aFghk2lDCaeG2NLc85jjonrxZ?=
 =?us-ascii?Q?HNcLvUrySf9V7eIKAcByQLVqFhIwhDm8N8w5gUlsTAb1+iUMyTEd/cTXo8m6?=
 =?us-ascii?Q?sd9J/2aLGXupv2i0eBJ63FCprrFuv6K3zO8IEaHbm6dWJNPc7/yfH0SMCut/?=
 =?us-ascii?Q?Cz2PAUfshz2uwjHnb3xybmf00+JVjg7k81iOiu9LXp9JIPMg3nwc3lbLQ/CH?=
 =?us-ascii?Q?LR+M1z6oaZGFy2g6oGMKR11v19MVLj73P6AoquzuvD7DnyZxPwh7y5HHkTPD?=
 =?us-ascii?Q?gmr1zHP4eTA5pBwi1w8krDHKbinVlAIincPa6p87qJwyBFt+YOf0bhrLoEox?=
 =?us-ascii?Q?RQb46a0R9rPjPaOcu79AXEpn/qVgQC12neOS+m3w0Vqqmb8xwrCfqZplYGFU?=
 =?us-ascii?Q?lp8HRhrKD310MBxkE2CLL0Gkzcg9vUA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d479f67-10a9-4a90-3a08-08dec78751d9
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 07:01:54.3527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79bDzj4iPG03jzZ50sMTY96z7jT+UPwOs5LJjqyVqIVbbVXkjLJ/8XXE/SDvN9l3sLDohp6oH2I28KOezqCW9srnuJ1SXaIlMHBDvKGgHKGLuNaU59hHfJdcpAJEB3Ko
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11962


Hi Mark

> > No need to have component in soc_ops_test_priv. Remove it.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> > In my understanding, component is not needed in soc_ops_test_priv,
> > but not 100% sure. This needs Acked-by / Tested-by.
> 
> So long as it works it should be fine...  did you verify that KUnit
> still works well, we do try calling generic ops?

I now double checked, and the component was needed...

Hmm... not only soc-ops-test, but ASoC has many xxx-test.c, and they
are using Card/Component with *non-correct* way.

For example, component->name_prefix which should be set by
soc_set_name_prefix(), but codecs/wm_adsp_fw_find_test.c /
codecs/cs35l56-test.c are directly settings it.
# I'm now asking this in ML ("Question about component->name_prefix")

In the first place, these xxx-test.c are using Card/Component
without registering it to the system.
It is a very hack, and is not the correct way, but is working for now.

It is OK for now, because Card/Component are *not* yet capsuled,
but will be problem if these were capsuled.

As a workaround, we can create "special function" for them for hack,
but I don't want to...   but hmm... maybe it is the only way
to keep xxx-test.c...


Thank you for your help !!

Best regards
---
Kuninori Morimoto
