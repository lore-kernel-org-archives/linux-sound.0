Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazon11021137.outbound.protection.outlook.com [40.107.39.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B60F416854;
	Mon,  3 Aug 2026 13:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.39.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764999; cv=fail; b=Fo7TA9iMTjIFcDjeYmWj8YEynI+Af/SVgFENK+y7slniSzhR2beADpAf0AMWPbKWJUs9Rv5jjoW1vF3hJb8eWnF1oYMuaZj+ttYl4vN3TrFMVzjSKiUFzyoJutu/0X2Ym+cq28jfg6QSaPrapPaWXkuVfgBRRcaK3ANryZl37xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764999; c=relaxed/simple;
	bh=u3QHobRoDSAkG6pByl7TDemMqQ0/XEZmB+ZUoR0qiWM=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=qCVhIWhMhdzuv7wbEQBitKdeE6/m6TU5CQphcOnaMo6wUcq8XPwYd/gyzzWIrYgNha6pffNzauESHx7Zta2yw9TkNqZBYS/BwCu6GLLonlA1r78pHhNtTUv8CvLUPKFWwet1iuEn6vZ27pFa4U/db3nemm534k7Tor6ITnVBMr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; arc=fail smtp.client-ip=40.107.39.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHGYKaFZIlAupZJrmviekc5rWA5KG3e/Hu5xzPFVy8Rh6y9EbTdGuqkNBxL4PS6OYy+CKSj/U9kgHlLFKuC39uErJtXmEGFKW4dRehoqTGxRCPufJEsf7AAbB1c5yYME9AQBtwnAcuzV1yVTSqMHxYRZCNJGkF49JGvDWPqwSgZN2NUAwW6srioCW/yuU19OouiikJcCb0z7pnqtEQxGMln2BobY28/ECj+O8ie9hm8EjuSTo1T7QA//IlOeen7tIzyOm7n9EJ/sDA80Tdvv8k93VpLHY83dXzoWChEufN/5xJWCYIzQFMZhKlJuMoP0qBpMGDJtSnNo04Qe5iR2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64pk5TMnYlGu0ENBzw0D3+iPNKpdUWnPfv1Jewq3u98=;
 b=kQ9OKz/tV6Izwc45/EZj9dE0h43jB80QLPsZixXmNriA09uswhoyQSvgIsfSP7udZ4dKk3wGrwgjhVkEePzpnLLNnJzEZ1+9pIwlZdKWoITStNnhLUr+jMVWTzcUImbaht7voC9LSwDA/tl4sC9kxG1fYxkMHvoLwhfA2eKZk07//r03+CtlvLv214Zolnp5jpKqEULfyPY/fHzeP0EiFfHPWj0onrL4g9+xMMPugegzsp6xMiTtD5E9F1eRDPmxPAagmY5XiX5BtXVIwVqdSlFinQImDB3P2LEzpmLmtA5vVeIU2B+L/+L7LfJSMC3SmYrRUJjhG36inep1SMd/Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY8P282MB4907.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:25c::10)
 by ME4P282MB0870.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:9b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 13:49:53 +0000
Received: from SY8P282MB4907.AUSP282.PROD.OUTLOOK.COM
 ([fe80::f1b5:3901:d12c:e9ae]) by SY8P282MB4907.AUSP282.PROD.OUTLOOK.COM
 ([fe80::f1b5:3901:d12c:e9ae%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 13:49:52 +0000
Date: Mon, 3 Aug 2026 13:49:38 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: [PATCH] ASoC: rt5645: Make the Kconfig symbol user selectable
Message-ID: <anCcciWmO6QOLTsl@5e001e58230e>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MEWP282CA0145.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1d5::12) To SY8P282MB4907.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:25c::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P282MB4907:EE_|ME4P282MB0870:EE_
X-MS-Office365-Filtering-Correlation-Id: bc67dcdc-2b40-4d59-0f52-08def16617a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|5023799004|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	R02sa0vFe+aif1pYUm9aKRfO2P6f9Tv6PCvDaXuwDHlRWrRdZCcjc6ZKxFMViU51Aem+83Honfn45Jrdo47VGaRAkikfPNG8rvwKfV2FprHyES9lvs8kpVc/KZhY7aN4AKXxqvUHt7Stqa9pKW0K+AcAYU2qNeGQyuXC1Y2p0usmHomSrhEYyJKRJwtuUBOwkY53ZAkX24Fa3IHnI5BfxhR+WHQfWqbLtneywfCkfbaU9n9aYRbykhHSrSwsrUA7domOPxsSoexeIiFUNfBDb+FFlOJcz4m8bXmQdCaGq+1pIg+gD5ujGP3dCS6ny0u4tXA85O6G8CEu+L1ROoIZajPh24/pUTJ2rswTnKyoJyqdQ4HknRddut37Zl44dJiSWk8s5H5goYj1Cwf+c+I7NPr2A+O1rCPxkRpzwKrqiuo/CyNPu7PI9FVxz1jejEShLDJ7ja6dKB2teLfk6wwauJzAO3sjhL8ZnDF5ktyYN4BU/2wVYeiiyRxn0DPz+8Y9TmKRLC5XUBaqlLZvHdQ8q3J60/vDU93sqVZWVYGcouYCtfPqraSHjxGPnnMJ14cOa8T+18ETyQ+w7IVORkDUmHj/1lPZEyDFAfLE2TcOwLyQL43OPIGce5xa3k+rwsB/ARcSZb3D7JlICZB3oGBmfMo+BLgTj+nsWQGt2FB2F/o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY8P282MB4907.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(5023799004)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SsczUB9/zcrU9oP1btXZe2ULP/IzTwc+8jzuO2ppeTkgizpUErcJ3XVEH26K?=
 =?us-ascii?Q?yG179uzAZWDfFkDXK48OBZE86myzAnQYm18PVQvSxfnjUgRsLT42kiIS68qw?=
 =?us-ascii?Q?zMb+8sn4XwRZP7FudJmlwqERIWiK5Kl6ecPpdU/Kqm+9zezHSSgXpI878ehI?=
 =?us-ascii?Q?n7LZZuynDa3MkgSgg5/+jGCBvZdGOzJGbPdtwUkWPkKYS3y9SVJRRwcBDii/?=
 =?us-ascii?Q?pJRsDpDxxLY1vtdEzxzDC3JeUIkEUI9xHZMeWMZjn1jPJ1YIqhV1mj9nwD5f?=
 =?us-ascii?Q?eqgTljR6rYvNo3zOs/UwE8Aa69OSkaS+NTARXuHi/UwlHOOHttaJ7getzrKd?=
 =?us-ascii?Q?nisP8IbF8iSaZ+sAVZJQXM6h1+P9jGpnGBNMhvChuwq8bOwJWQeRP0y2vsOl?=
 =?us-ascii?Q?u8tn5sRKEi05zxA/ccALairXj7x93Hnqb2mtB0oxMZOQlY3lve9+XH7CImXq?=
 =?us-ascii?Q?unkOCprMpsoJL0dJeRpfCLfPMj8zITfENTvR6cj1+e04LGAGvdXiIuS7cd7M?=
 =?us-ascii?Q?OJ+cOwwq2QeQc/+PqFZ2V720rStPMlYXNSiCM3GcZbGZ6n6Rbvl0vp6MpzwF?=
 =?us-ascii?Q?6WirnZ8KQoPEIY2jQkHpoMF9qCMwV8hfuZUa5ipPRhV3USMhZ1Y47OrPf0d6?=
 =?us-ascii?Q?l4LNwAb97sUJpHrPzfUkRCCZhfiTZC+vb4sZ1jldE5VaMmUi5AZJQVU9wJw7?=
 =?us-ascii?Q?SgR4HILWLBB7Jw3QHvT1fTx1bGO0r/NpB93GLfu3TgxPv3t8iSE3WXT9S8GK?=
 =?us-ascii?Q?tCKIDuwl7Ik4He8G2Kw+r+ZIofS6JaDFIjg7IKaolY6XaJyUqRNRsOu1/uTe?=
 =?us-ascii?Q?1Dh1t97OQHljXGadyYIO9U4hOwrM15VVq1iNdM5WBOHcJg6A4BJ8++0/yEDs?=
 =?us-ascii?Q?Fi8if4wxjtpp0NrylV8cH+90KGG5BlGV1DY/IeE1D43WMY/goNhFD8MUZL+t?=
 =?us-ascii?Q?rrk7JnsgaipJmyNaLw5P0EptH3iTqgxFyQ0DsfJUqbbB/CRsOOgxtN4pj7QC?=
 =?us-ascii?Q?Gez5dRPSDb+YiuC6cVZJb0MZV9Pm+0TyjMGgRnW16uGWdlZXT/mM25lELzYd?=
 =?us-ascii?Q?camp9nLGrkI7Xf+8xZAC6yMKQiZx7UqH8sLlnj8dYjDF/HY+qIb7SK1xxyea?=
 =?us-ascii?Q?ADwG8oxBfL68gflxj68hfxA1W2YDg6jWsQWMhpKgl2M+sP5Xi3D92vFuQxxY?=
 =?us-ascii?Q?i8UMx9DyBnWpSIlB8o8rAgqTo4ilxceE9WNbuv3SHmUs/m+0bmcjj3u5Y+Wq?=
 =?us-ascii?Q?8q/qT+P7o9IclHvJwOQN0BfSvjijMHZrWxP1eKWxSJL/MwxE0o3zIknxjfo8?=
 =?us-ascii?Q?/mJfwioRhN50+SagZYYSk28n5j3AeKbpaojQcby4XGna5CtUXiymbNF678+3?=
 =?us-ascii?Q?8hy2XorZ5w/hObaecJrxQ7kQKojwX/+RCYnAJ3U996N9NNvsKwC27RH2DVAH?=
 =?us-ascii?Q?EWJycazjsTPzw+qDYjqZOCb+LQsWUUQ70jMZJESSVZhsakNW3HuRz98SjSxO?=
 =?us-ascii?Q?fSIsV/nM6wVF0BD8oJJFmUHuM/CocI9zP2rmlq7+S6nmtWGS2O8GBQl2znxR?=
 =?us-ascii?Q?3GhMM8fnMHzYKOMkkZAv3NEpfhvXM+nSdMjvc1UMs+GmoRfeY6qm0itZtSl9?=
 =?us-ascii?Q?F2/fexb5Yw3PXzfNYwMrcXfQqJn82OxBK+flX9KYc9tYFppmBlt8FbTkAYqz?=
 =?us-ascii?Q?d6X1C6F3nMxsOiAvjZbf3/zomE+yN//QB6mlQ08A0SaE2gLp?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc67dcdc-2b40-4d59-0f52-08def16617a4
X-MS-Exchange-CrossTenant-AuthSource: SY8P282MB4907.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 13:49:52.0066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqb4mM/3N1U8gxUniw157VkWeO735HmfBBMqm8NageCqIszDVj7DRzi5hT83GJUl3w4JCawdzcizBSN2yZH5Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME4P282MB0870

SND_SOC_RT5645 has no prompt, so it can only be turned on by a machine
driver that selects it. Every such driver is x86, MediaTek or Rockchip,
which leaves the codec unreachable on any other platform.

The part has a devicetree binding of its own,
Documentation/devicetree/bindings/sound/realtek,rt5645.yaml, and nothing
in the driver is machine specific, so a board that describes it with
simple-audio-card or audio-graph-card should be able to build it. Today
there is no configuration in which that is possible.

Give the symbol a prompt, matching SND_SOC_RT5640 immediately above it.
The machine drivers that select it are unaffected.

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 252f683be3c1..d43475a63ac2 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1856,7 +1856,7 @@ config SND_SOC_RT5640
 	depends on I2C
 
 config SND_SOC_RT5645
-	tristate
+	tristate "Realtek RT5645/RT5650 Codec"
 	depends on I2C
 
 config SND_SOC_RT5651
-- 
2.53.0

