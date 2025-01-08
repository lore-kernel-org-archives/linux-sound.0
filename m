Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF2513CA81;
	Wed,  8 Jan 2025 02:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736302968; cv=fail; b=bL28jXRikRZYSaNlqd8VXuFJ8MGxowDAextWTGODy7quBb4xdHaXrfix4Q9SYnj8OhNDIfgJuE6dM0RITQEQtVob+BOH5N05NhMhq2ytS15XAgOOLdFyaHi1DpAjk+NJeecepwQX3MeHGIBciudchIxGyngcIlV4I7igb6yEwfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736302968; c=relaxed/simple;
	bh=aIQj/PSBvPn7tT9oxMzNyPDdLQ+9BNqb7GPdVuBWOEM=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=a0Va27MaKEk1ZOJQjnV5TMebKkIPt0qkVY4DgNj1VrU2GeWv1x4jlnANJb0YGQ/bphj4vrejdw5WTpU4EY00t+Uzpl7cfYMG4jtEHCua7rAC1zIHooLM1h7sOVyRTeMy7YGs6dNtjx6F8BWbdLEL/XksanxP2nwG2W6TOYLqwdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RidmsJmV; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RidmsJmV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GygqfaS+UhGNnsM7VKBRvNYJmV0DaTcn4Y/7BD4D3mesyEzNwCbYHz3Czb9+ztkhcn9BW+XShTV15Ihw9VPOCLWjLb+aPGVyd+ZuTeoN7xEb2hOnNZBc/iba76f957+TaD0efVqXqxGwA9WISmhTfLt2QG8DA7kokGPZd13THEq0WsYlZHKAk70ajWoZib5SY9tKTDYhOJoQYyiGlsCXh9RxPKAQ5c44g/HGn8XbsxHfjubX6Tg2zUmGWq+sghxl2mCC26FQsaxjjVsK4vXQlVulw5yNyBCYgM5DPV6knzmDeSJSDFw7crqP4UopLzWuYnQl++cc6W+yrkPGB4iwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4yLpwnmMrRkh2nrbyAybl1FKBhKUchwZ27QlqiiMTc=;
 b=St1vb+eBzZtwXxWWe52lJ+wX/2Zn/yuzpcndxCjwtMNNdm3o6S73L7Exqtw+uJL09qEt0G6uKpTk5B+oJfx5wCj1B2miZ6OKKsCjj09VBc5BdWMuWphtKbfeE08KyJH235q4ZNo3Grw80yPU5ak+2G3f7r/3sAViA6CUfoUaRKqntX7kU6jRSRrfc7HU0+5en7LZnomIz+4saPLgHooPq/eS65z5dbg0cvxeo5f6Y2GBViea/Xe6Lj/JRqHl8BBhG9P2QTTAEtIth8XhPX+MoY7YCUW+pYM5nKfmLcN22lxSXM0d2tPox4ELSCZczykp4qfGVBusNLGURfM1ZFyRTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4yLpwnmMrRkh2nrbyAybl1FKBhKUchwZ27QlqiiMTc=;
 b=RidmsJmVynqV5PSR30JKMQDLjfKscKw4BmhiLBLErMi9STN2cDSXj/flrrv2zFmDO9dB/Zn0NTOlZI0vI87815G5sbYC4HfLA456th53o3A7ntcG0mhCuKrp0CvGcvbXHFk8uC0al0tW/fVpOiz5xwJMJWfjMNPIhavI+hannFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OSZPR01MB8035.jpnprd01.prod.outlook.com
 (2603:1096:604:1b0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Wed, 8 Jan
 2025 02:22:43 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%5]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 02:22:43 +0000
Message-ID: <87v7uqkpye.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-Kernel <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Subject: [PATCH v2] MAINTAINERS: add missing maintainers for Simple Audio Card
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 8 Jan 2025 02:22:43 +0000
X-ClientProxiedBy: TYCPR01CA0132.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::17) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OSZPR01MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d46ff71-4e4f-4abc-5150-08dd2f8b5525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YIT9X7F2Kjcf97cdBaynkHqo9AEy0YYcukj9Pof/0VBNm8AE3J0phd9QAZjp?=
 =?us-ascii?Q?ka8oFoLN1iL2JJf8Qj3WDmN1SBnSwx8owokwIye93ohWg9nICq+T9kh2SaSk?=
 =?us-ascii?Q?MvthNKkRzeLh2W51SwFFihu2NaCch1vNEFB5/4GTu5hiZ/4lo2FfUmpwt/dl?=
 =?us-ascii?Q?chXoZwS+nV90decVcB/EmP7Z3EE+dCoTeyFRv+pjbSl1MYY57FeD+kICBMwo?=
 =?us-ascii?Q?Enh4PvKBu5Wgab+EwklygSSJliGKPH+t/WS8IbbyX6+6bo4W8TPwWJjKPyfu?=
 =?us-ascii?Q?O0SNRvppVJ9M8k5ZGG6gpkvQIEUgjnHPej2TYKLZdG7NFBhkEC0H6P0zjkPY?=
 =?us-ascii?Q?aYKjwgvzIVR5TvN0hPG15uikkYTRd0pawiokPP19yjEBgHsNcFlTEz2BY86f?=
 =?us-ascii?Q?vuDA00G42fv/zgTkDtH3GmB/XXkgtKA+sY0VlWorpsRhkVW2vQoh4Lzdf65j?=
 =?us-ascii?Q?2/PEMh1Yx2dpO9NAgZShn3Mfk9OvZ6Dh3Ot1zodajyEBDFKAH7YZEyr7eRaW?=
 =?us-ascii?Q?ACinoDVooFZLDPHejcoVe10FIIn31pFOxlT//gHcGIkYoeniDdueTO6gIhgP?=
 =?us-ascii?Q?k4sfNC650Go1jjeuqKSRgMfqEUy9eN+GaN3E90Gdsvkefrcx39CwdTz11H5G?=
 =?us-ascii?Q?hKEjMyhucIhUVCJ3rUghNR7cPQxBFPBi7+Hi5rzixhcMc8pZW7sVAEXcX7LK?=
 =?us-ascii?Q?tuyGKKCKC0KGIOKAHVGKEONE5/doLt8ldP90mzqjkmNpEkFDHR6iCPL8o0hv?=
 =?us-ascii?Q?t1jU3/U+27zBGLMoWKqe61oA9fO55J943uh3/pYT8oB83XWXfDOnUnjJbTqS?=
 =?us-ascii?Q?HhS5ByF20NPqLqJTNmhFZamCDD05JGfnADEtutWUDVaRDo1gxJ0h9oQNAwbv?=
 =?us-ascii?Q?awP9f5snHKRWTYkTm8eukmx13VNIyR2N3foThJdl9Bb6UsOSw381cHiGAV9s?=
 =?us-ascii?Q?GiCvLUxBK07CyX8i6LsLGtONMqtH+jr3PDsRDX877v4Dg2eQ1G+fG2s2PI8N?=
 =?us-ascii?Q?RFT8cEc3P9UHJL4GArhOHjZ7OPO3Z2MXmBFkQxNtleFEw2iarC2kF+MENWwG?=
 =?us-ascii?Q?hM1tl5aUqX6UsSYn/xSkFhpB1UhfegdUlDlHPcH+NTb8U/cjunED/3ILr+uv?=
 =?us-ascii?Q?81wP4+b4mvkJyZ2EYGN+Xltmj65GDEi9xm0L0ZIoFZ3JvJNePEUCcUH3EgHo?=
 =?us-ascii?Q?EtAU0EV1kPPFg89HmSArgXoMJmKhfo0QWWsrgX+uIWssHX+rcTfXo7UETryw?=
 =?us-ascii?Q?DlIPKwgu1S08z+ZHzFtD71Kb+ghWRLLVXzoRtFGO6+kJX7bxaaoAFCgzwRyQ?=
 =?us-ascii?Q?AtqMX7CNzH7vkmEPSwG25KmG4A9GlBwa3HEekmVPScub0BWqxvYLCUgynVVt?=
 =?us-ascii?Q?DKPydbiyZeeutAHgF6ZacT6O1DnE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DK8FJV8Wr4jPUUL7qXWbL1Q8j/OaZGyipIXtee12gn1h2KU2vZ+EzEYDbFTR?=
 =?us-ascii?Q?DoXYLJ5jgvyUHng9iUTgamvpHPXNZcd6/P23nMtCSIWI8EyWICifMt+Hxev9?=
 =?us-ascii?Q?OS1z7NHWYptaVNvVCebuWJwN77G8ha28JpgHNUUwLeYhf9O0EUxQmaJQWQke?=
 =?us-ascii?Q?CyYLEjU7wlye8BJoB8Nf/Op1wrDmoMh9k/ItVH+T0CLQF21cWeXwiYeWhLY/?=
 =?us-ascii?Q?jaSJM3veQDSs7qIUyQ1nicMe4E+BDoUOprwf9yVboihgoUs+OArOOVQu1v1p?=
 =?us-ascii?Q?okha0T4AevcOi6cZ57lWlb3l6QGY5K39ASeprKMxU/v5ai+6Neo2Uzhyc65r?=
 =?us-ascii?Q?A3ifTL4TuGCwwqsfo99mrS6bnNd0JTQjEOSIq6gkVV08kiasz3npURq5R0rD?=
 =?us-ascii?Q?E7n+Wh3sj4Bn08Hd1CbC4Y2SOpkgJQXrkfroQmMhhw6vQo3KbLpLknCPCDB/?=
 =?us-ascii?Q?Lqr+iN9vw9fMWk4+rc1lNh2KAMRorNAzcBZ4Qu9HwYML4zHkJPSiJYYT8Yz8?=
 =?us-ascii?Q?EavwqazNqrqWw95wB43UuR1L81D8xJmHWVfCyw1V9ei1ezdGlNvk/Yg35fiV?=
 =?us-ascii?Q?iBQ4CyktElqBkBBaSxDSg02symw5b1d7f+g5YFEAUeQmvBHTuC5UFAxjXEnN?=
 =?us-ascii?Q?OcnTR7um56gNekM1nxqF+bUTRTmOcz3iGyLt1mXPJd8lJlQjWoR0DHvfP7dV?=
 =?us-ascii?Q?uuAkjUTOHhUm5eab4R+7UVrUv4ztAZa0h2of8evRF2cDJsshRNhwS6lcawh6?=
 =?us-ascii?Q?Bkhr+BA4jqER7wbo9AO7AY/0fndUU7dUcfCNUou6i6CDHYIuD6Tp+uNk2ght?=
 =?us-ascii?Q?8g/jntAujvkafWz5bKa/xH4TXiTp0OwNZiCuFGLMe2RwNggMESuUHA5X3W5a?=
 =?us-ascii?Q?q4/rtIUevSn4GVJF56NWAXu/49+KNDZ2zvrOIVq5oOCGkrLVA7wcAK8UsFnC?=
 =?us-ascii?Q?zrD2bv8FqItmvJt0eLk44LLR0zDYiF4I4U265xC3Wctwg5rsXraBJOEisUn0?=
 =?us-ascii?Q?LApZaooH5vMR2VRDorcOSWh2/aZixZwV8nh0dk/GwggovfNS1xCNbgMcfGXV?=
 =?us-ascii?Q?X51vtNHV6OOWRQ4pvugP6I7R4SORwEQv+/He4qSayYJLcNU1Qdsqoiu+Jt+K?=
 =?us-ascii?Q?raha8vyVpDybKt0VY7Nb9N3tumbHxlp04Bkf0AAvA8ibXvj1SA+he8XNBExV?=
 =?us-ascii?Q?j0i6yUKkF1CHcmA9jgB6Q5Ja89rnS5jc+ls9uvurLijzrs4QfMKgMHy4oCDD?=
 =?us-ascii?Q?dtC0cGBO/60Ol75IhuzJOP5IMD0IXH5Xz+prH5q/08Xq2MC4BluHCOeALPEb?=
 =?us-ascii?Q?uY5KyWwsNzbbOHoh34f8baL9ADz5depsrObW2OJbByp4Zdzt7wLi5aJPiwxN?=
 =?us-ascii?Q?kMhCNMd/r4LcVb7rav9M2ObtE5CginFiKyCYtdaVBIdEzBlp2EKNIjfCY08t?=
 =?us-ascii?Q?fQIM8Q938J5VxFPRBzxHBo+sBkiOH2LFfwjDilxBqSnYMDuo26m/OZu8bo+9?=
 =?us-ascii?Q?a+e7mszfcaN7zKwxJzhgJa6vEZcYbr7pEakUUm3bhM+UIef/UhVzqvy0/mj7?=
 =?us-ascii?Q?/kDxOn5Bi8K3F0is0qxh4fJ7GDgNagdACSImRAUx0VjzLcIK+tEjCf+rmhL7?=
 =?us-ascii?Q?Dg=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d46ff71-4e4f-4abc-5150-08dd2f8b5525
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 02:22:43.3458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xM8BYj9QutAutIuVPHcOkdC9oRte1xqGhKDXRSwCPjhZD2WC9v0D9SVfab1h2/sgoJ3yQYiR4rwl+6W5tfbfLjV+0Mk13HyQZoM/v1FdHMCWzuUONAgz8WXstKoGf3wc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8035


Mark Brown will take the patch. Add his name.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- only focus for Simple-Audio-Card

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 27d9d68675b2e..5d84ad0e04a6f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21991,6 +21991,7 @@ W:	https://github.com/thesofproject/linux/
 F:	sound/soc/sof/
 
 SOUND - GENERIC SOUND CARD (Simple-Audio-Card, Audio-Graph-Card)
+M:	Mark Brown <broonie@kernel.org>
 M:	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 S:	Supported
 L:	linux-sound@vger.kernel.org
-- 
2.43.0

