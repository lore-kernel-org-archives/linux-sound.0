Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3566C4207F
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 06:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563649; cv=fail; b=EVIwFYF/6ZYtEGqIXiJ1H2E4hQf700XBhosJXKNJBRbfqzpOaBxpuB6TAG7pzxTzPw83tCgUd1Po4nzlo0Gfx4L4T6msyu7OrRh+KN1J6VMjBaTc9ayUDO8EG//eJW6VLJ1N97YEOkABdl7ehvs4Ss/99RqdNRV/LUJ+Kp+A95M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563649; c=relaxed/simple;
	bh=Udrt5Plt4F0Piucl/w9k3Q231gSLwMV2mb8KrAZgH/4=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=nIPIxudpxSJ6k2/ugINlUKPx045OCBuqELKpLVK3WLKSvrrkG7B9H5QEN2fXYSXQ05PGIDP6meUnsxl/hvEj7EOvrYVC3fO+tLWz1cIzGUj7/ZYn4Y1YQe0Q0MAsj+oPCcdUFdScxX2KgODBuCUr2WnrIPHNsfcxXvgLZAlKoNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mYxfU87V; arc=fail smtp.client-ip=52.101.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mYxfU87V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yi1VyEzrlGM8UJEorFbLuute9o6Osg89u3X0dF2CTgFUUtiEy7ttB7f9J6auTRdHIt/NVJ0f6tH0ml4K2oBZP87NZyHXaMYp/34QVyWLtn+TGKbhq3Rww2KpX6NTPgl4PhDqfp+iRVk9HtyXm73ChDcbgB5l4cLmV33CNjusSq+SCiGHMZYYzUMp6oooTPrGPb+Poo7z3hl+7K6iD6Gvucevb6mR5f2XPM8JQRUqDoepdwdNm87mCHWVylJuL9C0XTzuVTD8ytF/PRZMYAG3RnAhjesd0h4XYDN60YO9FfPFdS3aRkL7toCfzPvtyofmXUJYr37d4Y7jplyIdw/Yjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBKckZ5+cZ0L7SxOSJzKy513bpvFfX4liGUHEfYYY6o=;
 b=aUKSdcF3Rkav8Au2xOjR277E0FtLhjotzEGAqnAlLNSVBz/4NEHIeL2c4W0X5bY/jD3BtgWUOKysJROtXqfU46mE9DAJUUOfyxiu7J5cB0QhSzBbaAA3Hpc9ajpiyo334HgGXQBP3BrCmXRd/inLJeS7Di2faCMbNyjNKQlsuQy/afq+RX7a8i8kk32m1GVrQkaLo5Xj4IVJ07m/7WwSNDCPn6YsVthPzYNc6W9LkRNPRg2OTlgObAeFxVLj53+CDhJzPZ03GzBubrEWoXEKEylo7cmUxl3u9vFXbSYmkhuYbl+//vIjlNYvekH9KTP9YHwBsW+iawspxdpSMb1GtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBKckZ5+cZ0L7SxOSJzKy513bpvFfX4liGUHEfYYY6o=;
 b=mYxfU87VGRKWxjHfkYKzM2CmaDkv9YD3buiTjg0nfQcK48LZCgXFUC+E814nWIvPFRDfP+xlcSrl60F1di2p2rnzy1dX/v/TiLGY9MOBHLIN47nN4J63fhLcr+LSpNaDZuKVOW9JAu3FnaEImwPj/Ujsrh3eH4vhxqe49FlMRzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11036.jpnprd01.prod.outlook.com
 (2603:1096:400:3ad::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 06:20:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 06:20:42 +0000
Message-ID: <8734gvsg5i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/6] ASoC: and adn use snd_soc_ret()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Feb 2025 06:20:42 +0000
X-ClientProxiedBy: TYWPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11036:EE_
X-MS-Office365-Filtering-Correlation-Id: 2adc2c4f-885d-452a-c233-08dd441ae2c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?reQtg5Rfn/KQ7D4gyWNjZU1Yox/r2M75toHyTGV18V1U8z3JSOrji5vgAnb8?=
 =?us-ascii?Q?LwIrxjVAqy5pog6RlDE0QXR1u13prUbuV6yIL7gndxYLEzN1q3SG6wusZKxx?=
 =?us-ascii?Q?N6H0Klif2KWwbN5fWwnzgeb76TbrsvtuOH4ux1ONjqpvt9qK5nALEX4sNvDX?=
 =?us-ascii?Q?VOk2gqVlOPbWw04hDzDIvL6Gefc6V7k26cxPWqxEhPs/bVAH3Nb/I9BXAJBk?=
 =?us-ascii?Q?RaGQZ1mg67cZ7ScNjgNZM4wbFvBvptrm/MbSKyPBETzpdpvZBQgRcskXzibf?=
 =?us-ascii?Q?DCMlJKTlMHa60YiWDfBwqNtxVWbRg5K7aEQYQJwLQGxQ5DSwgM/hNAScn8M3?=
 =?us-ascii?Q?Mcj2Y17Zwqii6afuWyI0vxXWv3uDsh0e/NNbK4NvW1d+1qE8SNxSdMhH7KIH?=
 =?us-ascii?Q?KsxzM16ThBnt/u1L4ZAsLHrQXaMYl+wrGd6bCk4q80qSmM2ACAJiA9jCSmhq?=
 =?us-ascii?Q?SrPbXsIHkWk9eYlYG+xo1wN8GEbwg3LsBFk//WsJ7BKn1GuNmcDy8+1bRDtu?=
 =?us-ascii?Q?68zgOYezhPVEchWBP/OgCL6Vvikt8w8WaB5EDPKKCzVnGMrzlh+vK6vs6eYh?=
 =?us-ascii?Q?/eOGdRD+QWC3A4kRudFNjll1n2MCmIzeAXRocNTtZGUx4Nn2Nm3nR5PGAvoD?=
 =?us-ascii?Q?mChi4jEOdQRwdXcFP5IzGW2nmNzDFNT6Cj/oLP2i67R/Hjn+kR0zM71NBU5b?=
 =?us-ascii?Q?KxX9cqqU1wJe7mpiVAL2Q3uctZGOioxmQNrzj125ORrFEwq31TGTXwzYtdXJ?=
 =?us-ascii?Q?LDIq3/Tu/0xR2ySG45OilNKslIdfkj2vBwZ5frg5z6AwMUp/KwFj0RMURGHI?=
 =?us-ascii?Q?nWyV6/kluVTuhmJH6o2pvg4IGdLC8Fbal+7RrCTN6/O9Q888VD4/bFvTFPp/?=
 =?us-ascii?Q?viL0RVjjyYoscufYseGHE9332JOg0lg70pej/DqDKpYTsCr18lIH8DeeHcMx?=
 =?us-ascii?Q?/DtvOTGlQZjI1nq6jlpUNtLmwMLQoFCmQslmrTKaGsqH9M5S+DNbt5XXLXme?=
 =?us-ascii?Q?c7B6C6qIz6K3Ll3uLtRiUwrWn0H4FbpCKJLUQELD8sa+tlFvw56jiVInhFd0?=
 =?us-ascii?Q?cW/e/l6qlv0H5WT0Yjh+8cnoNAYCJrmoXgqHPx2SQ7ZcHe5hh5L1fKeBh0nq?=
 =?us-ascii?Q?WLbvfjn9QWUgrdFdPgDAWsdM6evNsN83HjQni9QrkfsTeJ0aWBzgJO5BQ7As?=
 =?us-ascii?Q?DNvULv4WoanslSOLjq4yGMoIYHra6FQa0AfQeAEFydNVl+Obs0cIGX2ss5aG?=
 =?us-ascii?Q?NSTdQfVbbsJT0lC0+l2gekhNMyQ3DBv64/1HY2ZRWTfLcse1TZNhntGBbwmR?=
 =?us-ascii?Q?/BItOdIKzKUOtJW14jcSGO83vsYDrpvj+sCMxVU9jIvP+lg/7qL0nKGfNaHh?=
 =?us-ascii?Q?JiMNCXY7/lqyoStmdMpe+cus+6nHLil9zLpoRbehqbDGftUXItBJQV2wZbWX?=
 =?us-ascii?Q?BahZLvdbeiw+4BZE/IuZOw4aFRg7WUsk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7wAuSdeH8AuhwVi2cDJtXkUQ303EughX/tkAUd7kQlex60kyF4btUOsz04UK?=
 =?us-ascii?Q?i1YKeI7hvJzrUYWCVT9Qre3nepIPUupoGkKFzeqkCQ9rprf15nMLK7TLBkGr?=
 =?us-ascii?Q?VlwNh3T4xZsVRiQOIpgtSnQdmucq//CcUAQ+W99gbaI2JUYitISLBGDyhHoI?=
 =?us-ascii?Q?ZfRdWV191WjQnTLvo2ehy5SMHqQHGhEe4r+eAXs/h+a+qHuzdA4lP9bxuIPh?=
 =?us-ascii?Q?kwum1O9ZN4vm/BpKlCPlMFo09XgaNs69DfnQMMJO2/vLdsboyP52X2BbuHdy?=
 =?us-ascii?Q?BsiIRDcZymY+Xk95Usu5bheMrYlc7YqZp5B4oigC3u+5lawaIKDafbRRZWpx?=
 =?us-ascii?Q?YLfoNv5Y0PZc8XM6eEeiewq4fJUpu6BX/BV2LDP431SyteDAO/WUM/6j81iM?=
 =?us-ascii?Q?fxbNW9mvFkQzEHWqmt36e6y87Q/5O47yrW5UlbQabcmJgleG0hxziayde6Pc?=
 =?us-ascii?Q?wHUqJjZ4bhCGo1tuskBBNyWKcDy0UbbeVEVg9FliUqBk+utzAl3wbrtccj06?=
 =?us-ascii?Q?RfvvPRlObEY9KM7AHd7QRcMEnYls8EQES3t1GT6FSXO0JxX4R40GZSJokwDv?=
 =?us-ascii?Q?sbQlkmd5smyqkA/yUYOvlDuU1afSGRtaqvnGDDgrgdUV+JrW0jOF9A304QXP?=
 =?us-ascii?Q?NONLn59tBFiI4mDsCzc7CVSBWPUzmwIEe69q5PZFV2YIzThh3hytgDYmVPnv?=
 =?us-ascii?Q?RkLl5CRptvQnNsH62tiRdy43yZFWbFWs9FnpB9Zhl36Ghv5p9Q79bM904+rg?=
 =?us-ascii?Q?s+Lshh9rJwWuba3EhCg5xDuUMcnfotLMAcEplMPJXHowxWn7nrBo2Y51rqQf?=
 =?us-ascii?Q?Qn1jtM29d086CzHLbVBhdskTOZQAi6P2ViZm5niqmasx++Oz7Ejf1WwcO4Yf?=
 =?us-ascii?Q?A+sTH/+BkSpRdUHRbThyCuKNaW3emlfGmLNfe60P8lmFCtG5qqX+ZS2DZBxA?=
 =?us-ascii?Q?yqKWQF7QoDcsHYaXj/GlVyMAZ8zFRNm91O+udYZEQ3rCyZlXIw6kq2uMZxkH?=
 =?us-ascii?Q?OWo2qT/prllxBZuxxUwnz/tCpvmJahHxTITzT/YWISIEhEG+jiBdkgck/nFB?=
 =?us-ascii?Q?ku3PBBa+zBfGpHQENm0aImX/BPFGad1aSBF0+VcNvsRpQ6W1HrYRlFzzb21c?=
 =?us-ascii?Q?U9niVttI9rvjhBYIXvclmUbgG/A7Vd27HmXi+D8vn9QtbXE1joSTy9P8jlqQ?=
 =?us-ascii?Q?+ST4bDmAk10w1jCG0rv1t0fHGHQGT64Yez44JD2b1Lq3Vo29/XF2ON4jKLur?=
 =?us-ascii?Q?HAjlhgPiOwcw7Wvw/zo7Rk6xNjhBvS5Q0LuiTSEK/XwC5MpgTCuef/jhLTTd?=
 =?us-ascii?Q?dWTfKbyLmWZH8SqdiSh+of6aPrrXcywKx203UGHDO/s15Mg/d6mwOUuA3sFM?=
 =?us-ascii?Q?W/V7X2NoOseA9IGJk2cdrXKmq9Fr3JBHhmkhsVK6SQ4oUG/A8vCAAf35j1oc?=
 =?us-ascii?Q?1yxcymVjK8Be8tp3/w8ojStRI2r0GBMqrQuwPiaTz4iQ4Qz7I+VDX3ful1Rs?=
 =?us-ascii?Q?AEQyh4wkCxBPILiFL2CQPdQY6xTmHFHECAkQXukjhzRM7t7YhDUPDoSd/Rnu?=
 =?us-ascii?Q?Bx9LXwdtF4tLbYmfIJb4B51Hx+ieE6G54uUWqJBntiklKKVOZtlPcEcNn1eU?=
 =?us-ascii?Q?cSil6+HbUxMg9yVIvpcCJf8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2adc2c4f-885d-452a-c233-08dd441ae2c1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 06:20:42.1703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ikSWITQEjBq6gNhCrP3ITp2i0hvY6+UO8pmKA/ELm87BvUe7EB2HkKjRWmkBAK4Zkg3j8mVqjD2pvLML3TWCceL/uzXIlsdNhEyfsrVCuzsU9hgzaEzDQlrH28oAbWw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11036

Hi Mark

Each ASoC framwark is using own snd_xxx_ret() function, but we can share
these. This patch-set adds new snd_soc_ret() and use it.

Kuninori Morimoto (6):
  ASoC: add common snd_soc_ret() and use it
  ASoC: soc-pcm: use snd_soc_ret()
  ASoC: simple-card: use snd_soc_ret()
  ASoC: simple-card-utils: use snd_soc_ret()
  ASoC: audio-graph-card: use snd_soc_ret()
  ASoC: audio-graph-card2: use snd_soc_ret()

 include/sound/simple_card_utils.h     |   8 +-
 include/sound/soc.h                   |   1 +
 sound/soc/generic/audio-graph-card.c  |  97 ++++++++-------
 sound/soc/generic/audio-graph-card2.c |  95 ++++++++------
 sound/soc/generic/simple-card-utils.c | 170 +++++++++++++++-----------
 sound/soc/generic/simple-card.c       | 132 +++++++++++---------
 sound/soc/soc-card.c                  |  14 +--
 sound/soc/soc-component.c             |  38 ++----
 sound/soc/soc-dai.c                   |  18 +--
 sound/soc/soc-link.c                  |  18 +--
 sound/soc/soc-pcm.c                   | 114 +++++++----------
 sound/soc/soc-utils.c                 |  26 ++++
 12 files changed, 370 insertions(+), 361 deletions(-)

-- 
2.43.0

