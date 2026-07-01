Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011004.outbound.protection.outlook.com [52.101.125.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3198B224AF2
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 06:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782886684; cv=fail; b=NLNYXqTRi+Cvdj6qtu/RSazuQ/dDQYnqJ3g3vpydqZLZ3HbsFdcWGtSTb9GgxhsUu5iJWaY1n9fd7NXW6oTj8ewEHscV5xEjx+9VLvXHO4wL/e7LdgxiWas35RY7Wl5VtheCo/UkPSPwQ0afx0s+cQZxScH0jEvOzGOtJBMXU38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782886684; c=relaxed/simple;
	bh=j4Y+JarOtNp0xVVCUJLSZFLTFqb62ah6kezJ3bKZe1k=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=J8zVgRUTH16sjEl5iq5W8vP3csnnllzA41+700LjoWcqDhZbL03LZXLbGFYEcGuC3SHyavpiQwWxjBiVNP2nzledKjuYqpsyF1i+9F4N1mdlYzf6UCpxontzi7ZxnQxtpml6hexi59+YhIOEQkvIlNf4oMNlmtpZZeHs7KzZ2Ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=on/EF3JD; arc=fail smtp.client-ip=52.101.125.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="on/EF3JD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SS8Xb9kLrCcNmuzFV+YbpMWhdO84GzbJxs3qq8WRMK+bMBb9fgNYVOvgCwjc8yV0Z/RjtBO3xwZDQcPkTM5LP9cdpSPTV1le3aFgD/5CNCwEdCmXVIPuE8zWrwBqIj2xBX+VZHXDU+xh/emRuh4RlwBE6z/KpZ+M84H9xBmn8YJJ+3OyivyliBwLDfKSfSsKrbuvaGkHepRt72yKKKL1pcK/TqGXQvfJKP0wF0Ror/4t5C2tZtjGiESXwhsUIxk5luS55qK61hdMcDf+0wRclm30HHtXmAQzHeceu2MUQr4gxUGuvfVw2A1T9FdEGl50758iST2Zx7rSI4TwNXug+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUgn9XVgCdfL1yHoLdIVyyMJAK0jlFPSySq1P+fhWYw=;
 b=dx+yHfibqYWQzCICL0qSamW/6b12/k+L5huEJIoVT8qi6ythdyfcYOVpH2whFBUCdz/H0UqZPME/DeNrPqIVNLvZV8B0AZvA2A63Ra+VGp86Ye/T7VnwH94eGnFbmzz4HM/UrWEFGFAkd6XePR4TEIEwAkyZrowQnKeHnRA13lE20+k7+QHxObMOW3tvnf/y08UarTmbkJIHhYtxkhp9xOKEhdQ+pPd8IySvf2fsLYxjIPj+zVdxpOXYK7rbCqKOGZZpuvJqCNFJRvJ2Sjbe+ybBjrpRU4WVr/8u308jmefgm31adYBROcJXK/ti2eZ12vibI4/EACE5xabuXxWgUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUgn9XVgCdfL1yHoLdIVyyMJAK0jlFPSySq1P+fhWYw=;
 b=on/EF3JDugLX4XPwDNCPOi81uWQqqut3b6GjzWFzigXvufkU0MSnSHxDyhVEusHYXjzSQU3Y610r9awCMn/fdTr6reOIJ2q//oh0NTNSNgzy7shY7G9kHye7xry32IhmPoOTdiUC6n7ID2xdXVIECOoNGBUBuWhcZn3IyEKwVkI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB12462.jpnprd01.prod.outlook.com (2603:1096:405:105::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 06:17:57 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 06:17:57 +0000
Message-ID: <875x2zcjxn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: mediatek: mt8173-rt5650: tidyup error message
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Jul 2026 06:17:57 +0000
X-ClientProxiedBy: TYCP286CA0312.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB12462:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e0645d8-d7b4-4e2d-6112-08ded7387e69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|56012099006|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	iemnmo45G+GIp/cg4NCXWbi0C4HMUW65pFtZW+FgV5UOnSfYkLHz4x0WSPtrGUiqThm7U/J75FTHaT4m0mv4Z5k94maLwXEeX77b6u2wDW5OZ3uvXsAXWFQ1MJzW3O/xMkKBvLqC2brXneBVhbseXQ/Jg0qU3X7WmyEVOBCUYsKao1HPAC3hsHQJMKoSem/xEcN1elz5v4zesLIUMSPaZffS89sAfIiBJOaTOoIikOW3ah+KlOaTyk2A6xeCeAMavSteo95xvlbnCAydxW89LhPPDqrLh4e72GvivXPLdpIbCijO6G1k5FFO8xxJZ7IZVan80BuL7zkVb+J1eWbuGSqRjfrEW3kn4klcPxpKEeVnGEK1QgrHAfcPlNZJwRp/Fsd75SWxbHJJcwGyeHUapVbycg+26GJKqJGFcGzTRuwfDcK3n06UkAsJdf+SMPvi6jBza78mCcHEwlZ+p13/1IWHmKVtxRZSZYBl9K//zmVZGY5qHu0fhq0EbdYSVwoa+V5BDdoLV/g2Ka1bvotXzODGa2ewXVk965xkWCxUGXBoqHrCLBqWvDSbV/RWjqZeSAHI0FzJwiaCH3jwzKjABh+BaFhdArwDsegkYKFWYR6cHzmBhEArswcAjmR+JQZSU3d2o5zAvBRxXMe0j7HTml6E15tzx5DWCMm9D/0FLC1A7weBnQNQK9TBa0s/uAEoZRVXmo1mkt3/G9B5fRO3NC0xqYPiBS8gDPaRKFjis8Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(56012099006)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mX8GX11ZGyiBj/eN8Tf/nXX37w2p63Pe/8zecDQsGStzOTkSECtBiL47WAJ8?=
 =?us-ascii?Q?46Iy+0JFaWUBOjZuR4MKNSmzhoqedlmF5CGQiZT5dBlgRzDKhmZ6yIvhhwJR?=
 =?us-ascii?Q?T31+gzUmYjM4+eTAvIDbqEqMD5/oRoAOgYGJNmxSrAm2g8j1N/thJw2hXon0?=
 =?us-ascii?Q?XBQbgp82HqQiKqQ+gXylAL9HFG56wiP4MmqhOiKH3Zghyzh4Hgg64mIBHtkP?=
 =?us-ascii?Q?AK++bvgyWp/hETBD6SpuOWylvdYIbISBhRuaCt8tJcn1mLpd2jLjNwcqtGzT?=
 =?us-ascii?Q?1f3k8g8CKSfzTv5AI/G/TgTRnSdF5pzfhHYgGC60v+0Qi10RBcLv1BKjXPh2?=
 =?us-ascii?Q?bTUOpIepkoNeYddcZRd1x8S0JpvfENmYtb6CR4Da19p7fFGyGMZEP9BsPett?=
 =?us-ascii?Q?uMf+qSxQEd1hnFIQtL2/8zdHj5CdUxNYGgp5uyz4FmdgBWOJgb7ONlVPR6CJ?=
 =?us-ascii?Q?u8UqyUeSC84eKz6XYRSiFi59ms6T9PLq6Fa62rN/v55qutIzhPGGhRvVdGey?=
 =?us-ascii?Q?zHDV9TCsG8L9WHSrW+KtIcfAvQJwVR01O4R2DPiNB7eZHzeCc4JsE6S3mT4F?=
 =?us-ascii?Q?EH4NtvbNTF2Ii0YxNfuEDYYogOrGTQeupE6oSLhdKun9bRTXWL+e3/+3ZNXR?=
 =?us-ascii?Q?YKQC4uFRe3yIOK4PvwSmuoTICGA3uzKj9GmW/kzgIjEzyNiiJeUL1CWMe+Ji?=
 =?us-ascii?Q?g8Sb2kg0gDpmsZWvxPbh/KaAqxXmEgNOwohxebJcEWI9p4sp8hJOP5YAIHYa?=
 =?us-ascii?Q?dJFe0UkTtlFH/VmcEP7zTJRBEJpVP8hhff/bfI/x+xTAY7ZBMvRWTXjbLE/W?=
 =?us-ascii?Q?dpxTSKCnRlvYp/DBPB52fw4su3VRFV7a9rDgdtXXr7X9OB3wXw56eb7CLFEy?=
 =?us-ascii?Q?GF0EwMacqA4f5zyO15laR2UEIPF8R9iHPvaweMCJvyn/rFGVMpTHcCVN4sfV?=
 =?us-ascii?Q?SDHc4cLR0ZiV8ljb0VYzb7Ca5E4DFAUmoIlHC7xt9Xhiix3BUsxGwyup/7vy?=
 =?us-ascii?Q?kG7df3V8lUdHvgt5CZ0bHDS/TgBctMSeFjAUD9F+Xr22n0QwBG0Cjre7IlzT?=
 =?us-ascii?Q?2I2tf+SP06i2M/n0TNjRgcbs4qtBuVqIGAbx7HkxmZLAtEt/YfN4YQfa/DNK?=
 =?us-ascii?Q?2ggW31hRhuEjHAQxsjE+R/Cx/GpKZmk67zurDYqswIZ3wHMfXmBspryxN2bV?=
 =?us-ascii?Q?tf5XAle7ElojE8T4Z7jVIp9vrxSYC6n4obhunyQHgBWRtId2rPgqytjK9pCq?=
 =?us-ascii?Q?7GvaPjptpsJRz1kmohQKTJgruXixgSAW+/X7NxoxX+fEjoMgV68nlGq/E90X?=
 =?us-ascii?Q?3ABLeawDXO7jLSmLdtYdXeaLiEiDdyUL+wSwL/vQwMpnrMy7QFuPxJg4tZL/?=
 =?us-ascii?Q?eUrOPHC4EkE6D1bwI47eJrzSTdyGacuW2erOrcqlmOX5h0f+iEYHbfsX76nA?=
 =?us-ascii?Q?bUR6o4eOT2AwYPLH9v+461DXn0FdjqQ2oRCznQzXYRemXRJt1KOhP0Bq1Ilo?=
 =?us-ascii?Q?48wJDIbboauiAEBfKPeKUQrzxjMJqeusMAzfQ7Y5Gd9MYBklMsgJduHOTI26?=
 =?us-ascii?Q?op2y768mXC6J67/tCUTXwVI6jkHf3yT4N4BkP2wi4LLUDrvJc4XLjmlj32ke?=
 =?us-ascii?Q?ueZ49uXPT05/2nK9fTbuxj8ctyzSlKv4T9ofvvW98VoOp3aPeMHmoGXIWPqS?=
 =?us-ascii?Q?RUSnK3b2Rf6+kyHE3qVZXMz0nUDiakQ954obsAnjNjb7VXNpk7XT2oit0x4B?=
 =?us-ascii?Q?Y0hRsc8hgqRi3U7FKAfD/eHDU9iZRtioXuqX9XdgyBK6VgQ9sw1t?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0645d8-d7b4-4e2d-6112-08ded7387e69
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 06:17:57.3872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vcLG3qWU9H8zycmL+yyYGD5IgnkjUtnyvCHp8LfOjWifgjCFosOnjLgMh41jySP4bST5Cb9nX6Gc/7218tal2WmM1MOG8+Uo1YcP/9V5FHGptwQLD+s4j0W3mcyYTr83
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12462

mt8173_rt5650_dev_probe() has strange error message

=>	ret = device_property_read_u32(...);
	      ^^^^^^^^^^^^^^^^^^^^^^^^
	if (ret)
=>		dev_err(... "%s snd_soc_register_card fail %d\n", ...);
				^^^^^^^^^^^^^^^^^^^^^

It should be "device_property_read_u32() fail". Fix it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8173/mt8173-rt5650.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 3d6d7bc05b872..8c5096482520a 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -315,7 +315,7 @@ static int mt8173_rt5650_dev_probe(struct platform_device *pdev)
 					       &mt8173_rt5650_priv.pll_from);
 		if (ret) {
 			dev_err(&pdev->dev,
-				"%s snd_soc_register_card fail %d\n",
+				"%s device_property_read_u32() fail %d\n",
 				__func__, ret);
 		}
 	}
-- 
2.53.0

