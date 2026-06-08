Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011014.outbound.protection.outlook.com [52.101.125.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554D92EBBA1
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 01:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780881891; cv=fail; b=ctWBb3GBq3RphPAb30LiUmt+FY/v1gIYw3/9+I6U9+l8igsiOH1imw7SlEEkEpGG4PSp6BLOrCVZHWdowY15jDwQkanObH36sxestsvftLpabxjGnIYMeF+rzKVqTWl0+GwzDOLa11QM5ZMIzyb6FV3fu2T2A25LzAruOZ3l+eU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780881891; c=relaxed/simple;
	bh=KFCfzGfYlPKyWiHAXQj5qV/7luRPnriV0aarOidnWxA=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=eUcG9lJwtJ2fcNEiMFp1UbYLvgmBv7KPO2YTtGWHCvzdC7jHZAJ+QQmksfADsm5s9pm2JbsOtsF0o7RWpMcgxEugWmvqL4fcT+1XYcqbXaUWGLf4NYX7v7+1N7I+Uo9VIFnGhdTjIJ0iVob7pma9GH94iDWfgrPhf8XgJ7pHxIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KNUzwkRb; arc=fail smtp.client-ip=52.101.125.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KNUzwkRb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giIkFAggl/xLCuuo038pmmXzsFfWZiRiW1rn/CQkpsuXrz/uajRK6onS4O2hUyRy5BrEbekruFogcnKWGv+htKB9n+glukeTE9cRcAtqvWVH5byeY2G5a4oVkLLv+58dKkT0hO/FaOwuaJc8HEPXfWP60XaxG5sejO2J+SzDx3mOo6KNuxyC6EzVI5Cfp+QTdHCgz4k89grZas0FNj9hUpQM3/9kHrC3/FoGcgPbNUWcJZtiD0uhNOQyDIQD1B2OykHHVZ3ri6YYzNItZjox7ILNS/xVoQ5+Gntg15BSlT9nnaqqQefMPBgl9dQP4KZY+doeuQzi6YXqO0ULELokXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMegYxeWt/whv2k9fmNOKI9iNDwjGcW6BHeMuWpfw0Q=;
 b=PljykWV45+dGvTi8+pl40W6trlUjW9vzKtiuDdwuRFbrsT8qhcFIobk0GL5WTI0WcM++D/nHxWm1IeCjsNrjyuak9uWeQTITNyoBVIopkWRAXnyU38NHuVW2gY+XGa+/nuUhZG9XNQAPJNWS4EsuFwy5WHmhKNcoHx7QYyT6svsINuN68FKhYpn+KsXema9ic7mW7RUub6kMlZLuEbaVOZzrhYj1hVC9BjCx9GG/0iI8ElZHEXhChMEZ9KfBanh5KIU24uSrk3M4VkgwaYmuOeIy0mHCe9KKdI5s9E0kQ7t64YLE/bVrOQesC5SbuBgSa9RPR6iFhBg9AzAycwNtSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMegYxeWt/whv2k9fmNOKI9iNDwjGcW6BHeMuWpfw0Q=;
 b=KNUzwkRb3N0XHhWfCras9rszS0xRUunOU30u6s2FXJc34hK1w2xXE90vW97qknVXa+jbEGxy+RkKrRabblshYMSfPtyMG+mTq8X+IDZRrRFLNi87/gh5lA4pSNDgXaKNd9wvKpgBvvhiDhRxg+RaDELZUdy859COsu+SXDqjxXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 01:24:48 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 01:24:48 +0000
Message-ID: <87fr2xesdc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/6] ASoC: mediatek: mtk-soundcard-driver: tidyup set_card_codec_info()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87ik7tesdw.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik7tesdw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 01:24:48 +0000
X-ClientProxiedBy: TYCP286CA0314.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: 82307e25-e1dc-4e2f-4401-08dec4fcbb00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tCEFxtTmVzPgUaf07M5LGfeP7ukOgwGvlYWxwBKsGht5I5yuhwBTO7Eo0iAafjzDBEJZtcFcGwnMxgbz7MF0ZsdnpokCb8r9aBWWv6ng0/cyp12C4+zviH0iBZfDrZQeqYS81puMp9D3d3iDV6Q+t5Io6Fub/bkXeM49W9rPyLaf/nYSKSaDR/NdMcsg+aiG8133+Xt74d/DjMp28ogg7AgVpG4Zy676Xd9fVDQrx6VjAUDpCve/6H8esRRlLQeQ7oZ3f+mUsf3I7NuDwAbJdDu0z8wLB/sKEBhKqnD+BdFIpZmSsPI9H5iAgVFfY/GF3LGFiiqq9bKN4feT2Dm73IigLlQE96JKBpcJOLSXmfGo7lNyJaSc2u5/AI/h219J95uxNv0nfrD7MjIq/lwPswqok9CoKykogDteQQqKMYcT141p10oEnC/sDPiFQuKOy0U2ZVYIVWoHu0ZO0gOvNOCXtnvlOAAocGvq/CJ7DI4t2HsN6E5/LgNrx+nNcpYtHwJdzk17W4iyRXTf7vFACBT1axpU/tx4U4XU0RSQC12qaTeyuEx3OD4Nqr+Vf4Mjf6ZAEKRlXGM27fAxuZp9LgaXAYwrCvVG5kSVqWntf0eRpC5tAvcDBI6HNNxTkZOMWT7ioHyZAzp5vZpsCnvQHm1/Nw+E5WL04h2RfDOGja8xQFWFunuWMOUQodBw85cVhlnJ4F9bdFBihMO4vtm2my/oUV0V3W/XzEWjlmr6IoeFVwmGvM9I2e3P/sWUIJWi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y9qQ7HpCMkSX57hgfwSop6G8clf9Tr+feJQiD45d5UUftF6kdjDHxvD9awWB?=
 =?us-ascii?Q?2DTJLEqbfJpKJfYjLcojAwHYqmnbbYIj4xIJeb1jToASV7dbP5XHEThKgm3/?=
 =?us-ascii?Q?hrWmo6MD/jEJd4OaXglOufjV1zHb7eXC9BaCrm5dP23t2t1glFaSyD4j0wAK?=
 =?us-ascii?Q?fl+MVp/ZQSAnS7nTPwGrs9TeLoA3x0Wlozbu/c9XRk2Iku56gd9z03HnwmVq?=
 =?us-ascii?Q?iugUGyOeME0O0xT5y1knL6rPnVqgr6P5E+aF9U60O9ymfu5wJGZPD8HLvqLT?=
 =?us-ascii?Q?Av3AztpZA46z966vRNMssx7bqgSt1f2qII/TpGOu5JdTNkPQ6BhZV8VcGVIw?=
 =?us-ascii?Q?DoovE/TkeHTNXQ2J1Q6abhYSH3cydX6luZEAWNVqYN+4xrJkQMhISqrC1evb?=
 =?us-ascii?Q?+DFQEJUdz32A4i9G/GxHc4UaRYcVT+v8farpqAJ6osjvYJg6o0W66qx9HPKb?=
 =?us-ascii?Q?22Q2Ac8nCGcjXfmCqFVxlxdKVUaiY81VEknDTdQmM1cLl81mfNqd1kYck5yd?=
 =?us-ascii?Q?9UkxlcHR0AO4Ur9M5VR38MZc2tF/RItFuM0+eL6w6ZgXoYmaM2mfrCMN+ThC?=
 =?us-ascii?Q?WJdY88r2Y3RPHlwvMD4Nrf0AqXkYlq/8aOBVHgj4SOHPi9G0DfUWgFuRWlLX?=
 =?us-ascii?Q?RJs4U74V0HgFvfg/sMDvOpveRwg7pzoAEKf3BcWaUSlo0YODHH8OHv4LEMmb?=
 =?us-ascii?Q?48wFDwu75p7n5t9ESjqo4zDt1tmcN1LhYmN7mc4aNaVJhOOJKDUOfY+ADgmO?=
 =?us-ascii?Q?2DPjlC/IgLnbZpL9IQ+zZtMfvM9WeLx0QKByc/wAsXuI283+HKKwYs56gf3t?=
 =?us-ascii?Q?GWix1fh2BW9a9d47s+ULcfKR3asLaK7o8U7Q6ajTaCGOrhVery+ZeUwyydlE?=
 =?us-ascii?Q?aepBpK+AwBKCK/bHDdzSRE5QogFD4ju1833e4RVIMgVvRCVz68YYzVSGIu0M?=
 =?us-ascii?Q?0pfxur1/Gdz0/yNzysPPDoOaAPyXJnHoU38PPrMgIW1/WBOIFkSamo3FcKYx?=
 =?us-ascii?Q?rWAJA0fSWDiSB9QKTj3DO2gTQnM6GU7Fk1JtH0mIOwyJ/KMKTa920WULvK25?=
 =?us-ascii?Q?piX4GtG17RWmCTWL3jXik/6uOTOJoyXWvHsOE2dFVDHPwGjY/gI8pA6zprkk?=
 =?us-ascii?Q?a3kP6Mma04eFp9h58+tebo/3xDc3qLrbHkXpsxdonP8Os09PN0/ihdmBFzdH?=
 =?us-ascii?Q?OTlA6KrcjAltFKqOe2c6cdf+Pdg2OCNxzohcPof5xXzImu2Xnl9IRu3z6hco?=
 =?us-ascii?Q?Rjf/nbR7Anuq+84xKxfr0FJMt83JzjNqnxcc7DWqYHrTiQV8A9ILLsi/0Drd?=
 =?us-ascii?Q?Jw6ntL19TT9k3ANXuA4EWIOnr7oth3x02cqiN0KX3DZsaVm/zQ2VpXayOIOL?=
 =?us-ascii?Q?XtcxPUnx/rcUm8HU83vufOUkf/F9oxyof8I9bDCzAqRKdxhLEg4MrN+lrtGq?=
 =?us-ascii?Q?3av3sEQKB9yMw0vclnKGQYwTLOgmBxDXq1EJpUCYbWP4T9OSZzDpJnxVbin7?=
 =?us-ascii?Q?lvnfBmpfCQ+vjvRIdlUGgUF3kzkF8xO8BhoTfTb8hacc4ve2ngNlta2hiiR0?=
 =?us-ascii?Q?zYouv3ETmAG4yp6NzorWNpFvqzpU4tnniRM2RXeDe14EI9SiYm2v9cqhukYG?=
 =?us-ascii?Q?GDtXWJDhqfPmEYIAWiZ0YyoC/gbqjsYEEff2MlO0uSC7+l6OCJMJ6s5q0n84?=
 =?us-ascii?Q?I7lRIXMRw6aHj3FbwIZRcFYtpKkZOLoQN2tViE5peEBBvY2dG/BiNvgJpVrl?=
 =?us-ascii?Q?abRFN6c2bqGVIB7c3U9cDcVoJyRwP7dzMjeAfu1RzJKU083a1VrB?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82307e25-e1dc-4e2f-4401-08dec4fcbb00
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 01:24:48.2794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbJ+UQsALdAld5trp89f9tgUC98AJiFs23CXTMCjnlLDgQKSkJj1me6Prze8mIuN2Fo2GBeykZ1cf96CDF+RGNyEVnULgvTQy9YR3b70fRg/m+TekvZF8xTcbpVPb5CX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

set_card_codec_info() requests *card, but necessary is card->dev.
Tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/common/mtk-soundcard-driver.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index 24118217fe5c2..720216b32a0f4 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -15,11 +15,10 @@
 #include "mtk-soc-card.h"
 #include "mtk-soundcard-driver.h"
 
-static int set_card_codec_info(struct snd_soc_card *card,
+static int set_card_codec_info(struct device *dev,
 			       struct device_node *sub_node,
 			       struct snd_soc_dai_link *dai_link)
 {
-	struct device *dev = card->dev;
 	struct device_node *codec_node;
 	int ret;
 
@@ -107,7 +106,7 @@ int parse_dai_link_info(struct snd_soc_card *card)
 		if (i >= card->num_links)
 			return -EINVAL;
 
-		ret = set_card_codec_info(card, sub_node, dai_link);
+		ret = set_card_codec_info(dev, sub_node, dai_link);
 		if (ret < 0)
 			return ret;
 
-- 
2.53.0

