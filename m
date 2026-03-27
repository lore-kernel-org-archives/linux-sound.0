Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A5E42A82
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 02:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774579419; cv=fail; b=rFLXrp42hskJEiXK0WZfbyrJSib8/FBqnHCGbhy8kxPkF9TjEe7IwbCzFxGb4P/gQmJRDg3XsknAaTeCoi96xG7xQsxxTE9FlqthkkjBjTklHo0Lkua6LbFn/Ei0NHBkmgMVc3IP6orx1Cr/5y5/01GuY4Wmd5p/r93YVcOV1f8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774579419; c=relaxed/simple;
	bh=UAg9A+3RGmls2rG+D1EwQk3+QOD3jqioKNhd1Dqz/t0=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=E70DC5UT9tnmhu3xnzlZdEK6iLN2N7g2Fn7XVCTG4BKKXMcvT14M0ywxylt9h91ZawyLkz0Wb+OMa7Ps23qv6VImEdNwQiBniSCMDify/5Xf2IWfp95/mqGdMNc+hLD0nm/q4JD0dNnJ9l84WJd22ZBDGLDOkRG5SJ8RZm5h3y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GnnKqRe8; arc=fail smtp.client-ip=40.107.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GnnKqRe8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WaBJWYyu78IFuqH6cp+MTV7H0cX3Ekbq0sm61rxUCpN7uyNby4IvZ2wfM50YqhkYR0mCHcNNt1PdYLwICHlLKGbRJ6Qo7BUbPa7WMsUc2rNGabpQsUVezWKZovooBR37LiK2x9Hofp8kIlqepMP9qlB/i4wZJCGbtD775zBEUo7HGHEKv7IqofEhNzF2L3yUvNjZwmBZgwjxiMAga/wcKJYp70ouc/N/giPLwmGaiiLRzIzhyt3kAE/vLnKzlwR4klCo94PIhleGnweaes2/UlYPxCFMRLAc+Yh1DlUIAnWXaF2cMP4CJIlGk2PAj3pyo1WPDe/7mHGenNsyPRwDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5de6zzQ7Z6JGBeDjNWKhmxgKyMwgA5MvS18d1EF0hZE=;
 b=nQT1p0BccWmmoObEJih8gEtlUudemURVxi9L+FSEeji/PSV9cGyMBGX1A+Gr5FHpSW7gNJr2DFaKJ0AIrElZ90E74DmNrke6mEPP5aBrQBFQ0Qvs/1V67cp5BJbuUqD6/MSzBgBIuCnHdrvn4FJUujVpx5EIBN5TP9C/w6Rd3Bg23WMls7Juji1KlG8u9m80pVDxZreuwDvv66g8jrYnH4Bo2OCLQ/PNpJT7BbCNMLUr3KdjYFd+5T7dooRGyw54k9+7QhpmARiSU9zjEmjbwh64SvsvUHD9dOtIacV/0u180QJe21UXEJouO/73kUmUZMkPi6oHWcz31oiJ8y1lZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5de6zzQ7Z6JGBeDjNWKhmxgKyMwgA5MvS18d1EF0hZE=;
 b=GnnKqRe861b5DKSKsyFiILYJOYFnYekBhjTitTrZ3qd1qMqTuE7cYJGJVQU4nB8JRuGMOX4H6IqvjSNNHfVsFr9iqS3df616Se4x6XmiuhDyVuKovItYnukfbKlTVfusUrzOT4ooZaKB9gjTfvOVb5QK+lln4+8qldR3RFWKKHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB10243.jpnprd01.prod.outlook.com (2603:1096:400:1d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 02:43:32 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 02:43:31 +0000
Message-ID: <874im2xa98.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-core: remove unused dobj_list
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 27 Mar 2026 02:43:31 +0000
X-ClientProxiedBy: TYCP301CA0060.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB10243:EE_
X-MS-Office365-Filtering-Correlation-Id: 0afa03fc-e1b8-442a-5d45-08de8baaa256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ABNT5bVxLlJkzJdfFrtBxoeqOHpDQWGbp1aXCFl7vpfoRJLtOIvwFTUCFiBnApZoEjLswKUeFGERLnt5R6VKqOpuAQ8cf2r/2ntm/2WPrsD6A7c9cW8j/OLrGEWwWMJyTHe2rG3cdSEUhMFtIFXA76ImIzuscYj5YO6aX1prBNXa8rfm1PUfcOdNi8kgufSEK6l5Im+KMjVoS3pO/DXTk8fbUzJDKvYBfPj6DlWvuvkBzcWbVDwlJGWOWZW/70CMfKATEr9+jrXtPWcIKhpOLvDlNu/MFk9/b44g+W++k+Emziz834nkeNHU8l2VZQ9Vy2aEfCrzUE/xuU0D+fiIhh0P6dqx6zIaWradi8UKIRVhLdZuFlCcL81GsJK+6YJ2veKomKD9bsSLSrgAFEvSg8WnuQ5JeT4d4ae/5Zb7JKAZzmdqlM0D5uP0lSFdkDcEyG2IBsE+hyL1Sj2pIz/u9ux1bs6FEaAWfP4/0HVvswwVEmA1KHaSSv5pYC72BX42pUfT/2Pyu0nBh2lCdHObTZFSW4Agi5w9n1NTzE0/uJPaD2HoRHe4tWVeSpd5WPSOHmbiUZEjxIJriSMEBF7xNPKcQT3JhZbOmmFSpHGWTwuwd0Mb9EhEF/VDmMtXE+BygVdDB0KIGlA5jEjmBR3Z5DrH4ueWHXfrxM/My+aPzW60Tubq5cC8QwFhmey+Z7YR7P0phTPQbTlUUsPARrbddXg/tDiKjyslaP+Nb1f+HywWXi3sZkEd44bNLyuIrsQKI/NHGFJQ7poOqRFAI5bct5zsbLPPbGN086NN1jyrNRY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W6SJPHQMjOjgx4uazqsEDyC7c0PeGhWieiuOCmaVfp/uhzrAWpJyJ1uWGpJk?=
 =?us-ascii?Q?6sJsQkCm2lgHSrR8BiHfMYySi56vVzZ6rRjSPzvw/Ei417BMaPQcomFH5Qvm?=
 =?us-ascii?Q?sHSGwQwXKKSMB7zx26oAbHr1vcGtNhCH2dkfe+hMv8dAS60sqFtzlh5DtKgh?=
 =?us-ascii?Q?OLVNIdsX6AdYV67UQnzSTtRdBhvsRDR6aqsKYTZsPb+d4a0OCZOROZbmMsd0?=
 =?us-ascii?Q?NM3FerJd4W4vzauWZdGY9WjWfdKoVM2WONS3++M6b4vBRZD8FFchieMAN5WD?=
 =?us-ascii?Q?Vxx1Hh+F6CCA9QvcyXW38+BtFbTM99SyeNa2CvNuh0iAxwuXagtoXGRvFdQB?=
 =?us-ascii?Q?jTzJrRd4mp4GzvtmBSPij2Y4MHuKwzM4LjMIk4PuvwirYt4exd2teJboOviG?=
 =?us-ascii?Q?Z9kPFLXDbLwoY7nj0axSJfqxwnuZjVqizpKM5TSMu5tXI8P7QmT4/0do80l+?=
 =?us-ascii?Q?4lt3lSZ8l3U/zlPQ5QRYkzCSScvOGqjkgG9dpr5CfLWFCYXt3oVhZRVBWtUH?=
 =?us-ascii?Q?k6gdtR+4w+s57VId3zAT8tER9JZPSHn0lyiZtEb+J5KYBLJOc1Ir4nYPI05l?=
 =?us-ascii?Q?/PtfF4wiuPeZK9Dbfp0c86Z/HQI2Yb6mrmk7pslPeYCYz70G+AyILhNlceNM?=
 =?us-ascii?Q?m5e6XHYQ1sHpws/wiLDzXLFlvrmUhjKlT01mFk5b0PcsPHyffoXFH7KnisE8?=
 =?us-ascii?Q?wteBStFVEJReDULdfQUNogHtardFlmWR03IpHixiR8i0NDXOyqWj6nMEL6us?=
 =?us-ascii?Q?7PTpiia1ckvNsKytcQ2jNf+NXYltA0QSlWOM9P/O+IAmvnXrTTb1mZC8qfB1?=
 =?us-ascii?Q?Xfg0CpxYBuy8GqGVJ6LPRU3M08ONrCYT6Rlc7joNfozx4+kAYnju/mRht5XN?=
 =?us-ascii?Q?dIV2DDl5V+S1MaBZbXO5pMfGxfuZXI9P4zaN/Pf+UfFXq4KKahoAHgTImtPx?=
 =?us-ascii?Q?0zcuaQOQu3XeT3X63AWZ5U6AbCpP1FmKyVsZ3OyZFsukik25EWn2UT5p9dGi?=
 =?us-ascii?Q?SmZlpwJGSqKQBrGXzDDjBZn4G8b5ftKz8Jbqj0ECYdU9WnNs98jJf+j7RICD?=
 =?us-ascii?Q?njo99LKzNNYKYYctCteujV75FIHEwGkAgjnPuYZFu2Bs106sfWn+oOGxTZi3?=
 =?us-ascii?Q?6+82PCPP0MG5BobPASClYdEtw01VXt6S6/W8Hkvzabm1szcSKLcAnyXfp/vp?=
 =?us-ascii?Q?OZKa+50qPoMZvQRO+3CZ8NLXilvR4BVB7WQTkJTV7ow/6n3ZcAF7GOcJLUF3?=
 =?us-ascii?Q?losmZ9tkDn9ZDphnXQOJjKHdyE5mVMDh3MJhZbOXOrudmzgEr0aqZv8AovqO?=
 =?us-ascii?Q?gEL/TB5/bSCB2UoGp8QtyBUzGX8TS0/OiMCpdWqvcqi3bXrF/s7KRBSHlI7v?=
 =?us-ascii?Q?niraRh5Xpz1/oLao41hG0L3br8JsLAgg+lzA57m710oFnim+ef1yLlqL6OKo?=
 =?us-ascii?Q?TXwAM5R1ze2s7x84yfml39Rjpsz0AA/vzkaKtYQo1anBGBdostNRu4dm0bO7?=
 =?us-ascii?Q?WM+Ykn6GhxkZmfGhqYE7lvGIZ55pqCyGJsK3ulOA/1e0GP+mBQX35z7DcWdh?=
 =?us-ascii?Q?8fWFSaXFv1qUxcdXJeEl7g5hVWeLohv4ebW/qat5f/l0EPDgM5od78PJeNUN?=
 =?us-ascii?Q?dwM94hM3u8zmri5dR6CMwXmZeMkDY4OkedsaVWzPppQBtBwu7ia+mJiVfffv?=
 =?us-ascii?Q?uUGpoqZH7fUNITptWL9ih7m0LsO4LK4ur+WAoRhPijdOGHsda2sr/2nO0bfP?=
 =?us-ascii?Q?mtA6DzYmkAHCEXpREf3G2AE6sDIMNcyOrSMI7PlTM3OBAfIdOCO9?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afa03fc-e1b8-442a-5d45-08de8baaa256
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 02:43:31.8577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ghRZx3pyURXpjTYZ3nSfoe/JYKpMJFiianzdMwCcq7e/PhQSYXCS4xTpLwJ6DqC8hqnMfvxbP3BvlM+G3UGq3hax0/TKwEjb+vhkcMrwdd3QsJ2/pYLR7beMctaLs4N6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10243

commit 8a9782346dccd ("ASoC: topology: Add topology core")
added dobj_list to Component and Card, but Card side has
never been used. Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  | 3 ---
 sound/soc/soc-core.c | 1 -
 2 files changed, 4 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index fd6c1c8055d2f..d66164fd83e53 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1073,9 +1073,6 @@ struct snd_soc_card {
 	struct list_head dapm_list;
 	struct list_head dapm_dirty;
 
-	/* attached dynamic objects */
-	struct list_head dobj_list;
-
 	/* Generic DAPM context for the card */
 	struct snd_soc_dapm_context *dapm;
 	struct snd_soc_dapm_stats dapm_stats;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f80f1a149ad1b..67d9ea319c84a 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2574,7 +2574,6 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	INIT_LIST_HEAD(&card->list);
 	INIT_LIST_HEAD(&card->rtd_list);
 	INIT_LIST_HEAD(&card->dapm_dirty);
-	INIT_LIST_HEAD(&card->dobj_list);
 
 	card->instantiated = 0;
 	mutex_init(&card->mutex);
-- 
2.43.0

