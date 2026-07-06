Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443F937CD2C
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 02:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304578; cv=fail; b=bvEL7R2QWv54gBywFy2X2GZ5lOwHB+dsgMK/tBa4CyT8rytPvjD6YB7tY7Z/dJy3E9uKJwPl7rKzjY34DbBpbhj2JL9Z71QNYDHfbMhYMw/x8UMVM74Vf4+OmQ4q3XjpkKhXjNkBn18cm1sdQwQ/UJOFC8ck5A88UUk8WZ/tvow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304578; c=relaxed/simple;
	bh=NS7ZASvEmxP2xNXDwVG9s4DolpyBreYOgEx2JvtIAm4=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kYhpM7AHlAtg9Lf/TROuGnB6rC736RyqMrZkRoUgE7qwu9hN2UbQQ3I34WMufWW4EPfQFJxGpUDWptNGkYimvckwLmnoluYDoa3aIkkwY52TH9iMUAJbs3LFf1TQDidE8lkLouUqT2g5u4OOXSqJZ2vgxdRvWlmbOfi+1ThnAvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Qgv66fps; arc=fail smtp.client-ip=52.101.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Qgv66fps"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbDyrBcQ8PweDBwPr7S2C/ip1PwR/WYWBqk7+jZvOBG86BLd5MPKUAoWSjfyeWoVYpLhuaSRUvsxGDHOj5mAc9OomnRq4cfus9ZX3AXpZtsjsC6wKv8m2mtjoyJY18NDXswbKcS071d1//X7YPqQCx2KbT8dqFw2ZwXTEz2FiCO25R/FeCBPg8eICwe6+ny8wnodKAqX3Vd/8/um6RGHtPaMaxE/FET1Vs0yQLP4F/iaTib04/6MzTXH+yhcwwpx6c9RWIkePIqaLLx+7pr5/9uZWfxBWEt5izDBWqPK3dmcJe32FhhwIV77hTT4TYPL6cNU1sZ3WgwWH149GwPhjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lW+rvzy3phTfqUgDMe0OjCckUGmfS7T7uOk1tFQsuqM=;
 b=msUZ3sgKZC3CBHRWbZ7T+otti/BjbJOtYf3l5WMgyO03hFwOIf6jplA4WVSgcVvKzYSDFQzr/c1E8RSbwUkT8NLjcU3uB4qDnwNBnTFS1v2c8aeqOV+yKusLjAu7RmdYEYfqT6aJpTbLwf6bMjJ2+gUU/qP0FdehH+zuUK4hzBhUD37YP2UX/j6/5MUj8u02Fq8YEQm47VmeK9yLtLf0pV6jzEXDLqoSmxMZeKKiivbC3n0Pnk2lg+uh0LUzmdkmise6dGPd3dSjTrnUVu0gMyF8DHi2eNToJ2hjVNk1Q3SqRVPApFo0PmOuAg2BgE3xObYZcV5YN0xzNXtABNYjVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lW+rvzy3phTfqUgDMe0OjCckUGmfS7T7uOk1tFQsuqM=;
 b=Qgv66fpsEaEhoTqCgwZvhmw3gHJmuTwjjr+mgJD7vXIf/OQIIy7sJTYWO0tmla9grzL+LQcyypMCwCcZ6kBLzzOfg3TQDWIDAZt3AeqdATCnaP4pBYU+UW56hRdWuskyxa4wJhRZejMA3K4wMoNYIRi1iP8GP15Z/lZISRNMUkA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB14070.jpnprd01.prod.outlook.com (2603:1096:405:20e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Mon, 6 Jul 2026
 02:22:54 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 02:22:54 +0000
Message-ID: <878q7oc0w2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH resend] ASoC: codecs: max98090: add missing describe "data" for max98090_set_jack()
In-Reply-To: <87h5mcc16h.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5mcc16h.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jul 2026 02:22:53 +0000
X-ClientProxiedBy: TY4P301CA0059.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB14070:EE_
X-MS-Office365-Filtering-Correlation-Id: 01df260a-280f-4e32-8e30-08dedb057c4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|366016|38350700014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	/i9RekRZWjCyeB+g5iNxvV10Z7W1ZMpl1bl3lcvSkfZXNPUWLf12evawsIVddO0nT1YnA1SZioU4iFyFH9sgZ7CMjxf0tMeIuVSJQz7hsb3ha+hpi+xHZ153hpwkQ7/NnRfnXmAstOa/8zXe6nwNCsihkHAsn5ONCzaYljMhS27GlwycuiqjBBkQwEMbKGEeGQwd/u9GpVLMJgt1iEAzBRAZ41DQYiVShpPe1tt1vQ2Mzae0Q3JEn44LTf6OsxDfKfYdGJhnAfB+c7l24ZsaU+xKy+fIXBhzKBh34vL1rDvOh6XwFQRGTznY1R6mXNO1R/KOpYiyD7WTf/Buq3pUxf7o338fndVJh9ZAFsVb7Uy7UDzIYUCxc2oFIOAmnCjG9vrljq3UD0uvoRH0A6zV0l6JYKfbTFY90I0kbSlGtvFvbf93whHZLvNt/5NboFAap8L8mUI5i5TLbvZfpwr74oSSIJWMzN9Kp692bHu6M7UAddlUib6uQYlTe9Y343bCzzmDKdwhwsbHNfGF1EcA/wNmJo2L/xfxMv8xVuZ1zRzowhmm7IgAj3ac7xmPA7n0eXfXcUpd1XsMAMBG4kgrZPRERhrujdg8aMtRK/dixpKDc+XE3x3unuAErGDb018D/8C7ox9maBD3NnGruQcXTKpY8n+HCADbG6sB0uzr/sNFosom1onexQakEZjJ07atFUoHi+rdOs14GtkYN4Ws3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(366016)(38350700014)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?86XpgbDgjBqvPfDXhaLhAgXc1ZIcScOwoq3eQICQChbSEVIEbd361UG5iJDJ?=
 =?us-ascii?Q?p043yrwkju4oKkbiLCOs3Uju0lNjuJ5SIROmmAaHKmKqpsjCRMazkhsNviei?=
 =?us-ascii?Q?J74/5ngwJ63BAFQ+f1r0/VJbTQG+oPPLelDUeTm+RpBjOqyXBFSs2ANeNnoC?=
 =?us-ascii?Q?enc14BPG/db7bGu31VqcSRawP0zJVsCynQAnsSxAwR1PtdMZ3hUAJxhxSIcj?=
 =?us-ascii?Q?UZig5VnTkQv2k7qMPxwk0zPBTeINEgKcwjzvL3I0JmLnyyETBg3Ma+QhEKBI?=
 =?us-ascii?Q?MNq6lA5aCRjwNu2xwOSmHsHbYxmtibpEUkrP6zNetrYjQpY62BnZSZoYh/2D?=
 =?us-ascii?Q?J3VkRPteqHtsQT+zvJQzEyAZF5rNtD/Wr5Pa4EhJC42zWg7boP5Lqum+gn/L?=
 =?us-ascii?Q?XYJU0X7D3EI1CfdP/uwqNJOMQ5CrNtPvxedrYPl92O09xYxjGfpVdAjXzOso?=
 =?us-ascii?Q?bPFcUx+k9CQOFLWpVSvOU1SWsEngJhmxj0k1WcuBJjUQ5Nb4EWE4XkSZsp4g?=
 =?us-ascii?Q?ZT9PyZ7StAQqKT3Zo7xDITmz7A5lt/U0v/oj38SpsOj7VhZbRxos3Y1+tAKE?=
 =?us-ascii?Q?KrdigWVGgqtcXqvVm38odHxwBwMHW5j7YZb0qVybuoGa36jJyUgm2xRxh8KZ?=
 =?us-ascii?Q?GLSWJLK7nbuTOoPrnyWyf8KCiuMZTw0nKrG0yR7AKVfd+ibDhVxLvrS9yCtT?=
 =?us-ascii?Q?3vtNYCqf9vDaeUA4u0Lf0lPOBKy5xvxt9vZ5JoKTVjsvXR+fAAEvRhnz1MpE?=
 =?us-ascii?Q?rGG/8NYDpdE/4LU+pTGnqCs0yt5ACDXqtTVvrNP2tM+ky7DJmtiXsW6koRnQ?=
 =?us-ascii?Q?ui9amavkSlf5gWylCtJzGPBDdc7WqiHf1Ke8hEN4pUFBb0locokwWYtAa6xU?=
 =?us-ascii?Q?XL0GYw0teTItcqd+EORTAhfjVZmLK3FwgCTlvFgjnvL1pP5vo60rKu7IPxKk?=
 =?us-ascii?Q?4FCAQmajulKQtRzhLxgjnzGQSiFk3vkO/v4S32H46/rsMr8K4LFgCVFL1P2k?=
 =?us-ascii?Q?1UxnkvsgAYvRHgUvrJ6eLILtSjhkQxAUNneolrdd1RreM1otRbcQ5VIsjJ5/?=
 =?us-ascii?Q?erKtyiZTtWOuGLjl6LzzMOQ3ZQUoqD9187ileqX+Bum5U9GuiZdML6QUycWS?=
 =?us-ascii?Q?3npzfFf5xrj8qzGMTWoEu9S0VnP4OXtwD4DIPbGqMmT1YiYeV+DPihWWPBTK?=
 =?us-ascii?Q?d0Ae+qlUJsU92OkudWH0XYSCxX8baSobqiv4SVAPGoSHEsUsAkidh7xD/etO?=
 =?us-ascii?Q?5pikVxfKGnTJUV0WQ3F7/lt7yRD18IlTZCCHq6QMouC1ESYuiYAYBP3GAOvq?=
 =?us-ascii?Q?rxddFunA2wzO99x6Rlbh3xkLsNUuUvXXkET588bXqOjc05qdCyVt3YxFMS6V?=
 =?us-ascii?Q?J21b0oCFzjdDOpv1PivfZ4aidHaPPfCXYBrFutk8RDcqifeVMfePZ6kJ8xcT?=
 =?us-ascii?Q?eCQ9TAGMACKpa6Zs2IAugv0/0Se5OFw70nSwsH2hZGOvxl+sBZsPAaZ6Jbf+?=
 =?us-ascii?Q?4e9L2eU8OqdeI62o9jRL/8KFW4SXDQOySmTsWJzbpAx+PBYH9gWdziUaK3As?=
 =?us-ascii?Q?PjIcXPh8OooIO0/yrZGnq3Wj/IF+i87QZROs5dRrks+JN36szo7pXg+qqjF4?=
 =?us-ascii?Q?IdTNqLl7cd+6yvJQlQ6+kwFlUvfggWyffW+tP6oXYp6pXd/2booAO2eI2IT2?=
 =?us-ascii?Q?o/JYZMxO+0gpOaiFhavmWJPVaD4S7iqZibV+msPywedte+u5Tm8bkA/xNknP?=
 =?us-ascii?Q?14FLi38++SHElDq21mDJ4ZvCGcn5JTDGbLb0h/n50Gfq3oWjGkx5?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01df260a-280f-4e32-8e30-08dedb057c4d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 02:22:54.1032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyLC8yGmPy2ktvoNsCtrvi3Aky6UI0W6KtWg+Q+CJCRub+H25/neT6TeRW3FdjY6ewKpNnuPVtW8By/O2u702hpHHZP8AinKZgrOJBxuRUQBktuFtR9Tp+zEyJ2Xvrdi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14070


Hi Mark

> "data" is missing. Add it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Sorry. This patch was already applied in asoc/for-7.3 branch.
Please ignore.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
