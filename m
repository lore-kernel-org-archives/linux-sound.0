Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190BD219E4
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 02:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733191836; cv=fail; b=CJjIc1S9eZ8I5s02fN6kTE1XjkBo5y6fNPVIF8IZ4j8SFchTYjq+5AuqyJP6i1xMM7fq9Jzv/2VCDP6w3Pnmm7bmYeHNNr7qzSuKQxqiJmU9aUpRz6pn/aND5VGDpCnPyeCSmR+IdQRFFpD7GEH2C1nB/cg+0tU6//drN9VciFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733191836; c=relaxed/simple;
	bh=rhgGdOwpYnXtHSjgCcIv/krgL6IM3SZdS1aQ+wo8c18=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iZyyCeRn+KvLTvlVP6iiTRv/u2I5+IvmY1c8rIR9mdRlQP80pHIcNp0SeUqrHJ1rZPNGDQxl8qyZFzxVVpfHSCu6ZyL4VLGoFZCvs7w1paftuTtukOJEBdTRLBbroRjy7bnjl/jrvErYRF5TyAhgrBL4WJZshmJA4EBsD/hkLkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RduDpzEi; arc=fail smtp.client-ip=52.101.229.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RduDpzEi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQts+bOoyaTbxw9gwiDe4TV3b82nYR0vg5G/IBCxj+8qt9eQCEayGsDIokXeq/Usvfej7gb0hx3MCEAADph8+q16TJkVr73g3AP01hmID93TRWRrq6Q36b9DQHVu2G4U8Ahh8gbGj7HvVatGtoLSeEEf8oYja3CUuqGiyOmdbtD120Y/FUtlSOHQ2P7WyemxOl4HyZQDkfGtIPXuNY6jxZfrF/R+sHGMghgWxPYqUh0Tfq585JvJhyWoCS2dpyIiMqWFI6PvLuB2NUT0upAv7Ft4yBnIHIp1uw/UKWmSiLCXK9fVKThRfQ9TYs0DUOCNaXzI5hqE+KU0f+gR8+xsVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/jJ/9ZqEbkCZzFLoIOvC3rXGBbT0V3nj8xSGJfemyE=;
 b=tvk70BLd5w3xNsZb4wnK5BT7ttgkKj83xIYEBnatrAO/YROyTI5y1fSd9Ssblv6rxVZKx6ocPoeMLgcedjInh2RYDNJKUB22lnskPuwfyWvyGpE+YuCC6UMazG4ZSFuayF7ffuVi0mW21ojfzLped5+4B1d3phmI+RlDnnsMQWv7cz84+Y9MOge3b4j1lmHqPMbX3DxGH+wJRe8uamLav41M6OrZJosVrCTvBG2JsyXtB/fecxDaUPBabzj7VVOrJYft+5R49V9FFvS/F0TvXyDQaREC0NMhit6P5aakApsR4OuK2NROSSmSI3Tt1BHjYiizbdYYdr7bYxhtJp2XSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/jJ/9ZqEbkCZzFLoIOvC3rXGBbT0V3nj8xSGJfemyE=;
 b=RduDpzEiDhfV7VdmWMCC/op03EiBPg24+oQk5HeLkFkyJIeDobFl9qMiyXWDCDfsnVlUOZEDw4q68DI7TOTv70itQkIjYl8Zl732hkZmNX63rzGqiZbchMA5J0GMetNOmyiPHc220/E6L5YVdQqkKzHYco7d7Un1c+dkGo1Qkks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10407.jpnprd01.prod.outlook.com
 (2603:1096:604:1ff::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Tue, 3 Dec
 2024 02:10:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 02:10:28 +0000
Message-ID: <87plm9fre3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/3] ASoC: simple-card-utils: check port reg first on graph_get_dai_id()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ser5frep.wl-kuninori.morimoto.gx@renesas.com>
References: <87ser5frep.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 3 Dec 2024 02:10:28 +0000
X-ClientProxiedBy: TYCP286CA0037.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10407:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d095eb-8450-42ff-c860-08dd133fa839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5fRf/ksKIl1KzYq9usFkrkqoKWcNxHaXc5JSehi6aXAdgOuzRwCnXl5tLHr4?=
 =?us-ascii?Q?9D8AZ0xFZz7AE4mCKgTqVLJOlMJ2MzvaVxUGx1P69/APH7i4giBEC07RkFzo?=
 =?us-ascii?Q?AmDwj53nmDs8iZMUUvlBCGGVz2ozDWwaJ397USt504EVeyzosDcIwM+serQy?=
 =?us-ascii?Q?xIQcKppMiYvdhqfokK8JvsGkcbQ6I4V8NJNolyBKwj/MFELS9pQCCsGq+bck?=
 =?us-ascii?Q?SeC45Xw0fnyZ4W5uyjAD9Vcb6mP2eTr6gFeqGb9whl8brljF5H37ExRvi7ER?=
 =?us-ascii?Q?Sb3gWQckcJ8lBNagA9ZQkg5DyAaz8kX8IikCNLJicgj247WqLkkO+WT+IIOM?=
 =?us-ascii?Q?4dXIecW6GeF9teOAoTOmziQXPEBlM5ZNzQ39rE5gvnKHgo88w8F+Oytlc51q?=
 =?us-ascii?Q?Dj2SQs6T1e/a1uAXs2g6muMZ+/dYOWeaSaB37lgew027rfavb1gU2WgKM59d?=
 =?us-ascii?Q?ECXvfhxIxKDOp6zZmv9Zy4y6nVEpPjXXDIV8ppBenxSrrYUzac3tf6aiZVd1?=
 =?us-ascii?Q?Ez3axsYA+8r8sdPgYJp1m86DRuRJKl+a5n5vCOgR6G66B77rpQyEvB4XkvXZ?=
 =?us-ascii?Q?zxED2eyzzhhRFv0dHqsNFKfU8YZ0SACV/oB4zKoz875gbrfBjxuPDRc0jE0g?=
 =?us-ascii?Q?y3sx7e9PVk4lYXzu+EyLcLbh8xUhEOMTmOi/aLnSMfBfZVbi+JEKSjgl8BjX?=
 =?us-ascii?Q?YsUqt92gP/bao8pphcAKrSSsJ0rv+1fYc7vSZk3OKsEcM+PUoDa5l2AbOV6K?=
 =?us-ascii?Q?nWJa44bd1wzS713oaokACW8tIf6PF9Lwo44QorTI9tRySwLZJMZc2CbnVsxY?=
 =?us-ascii?Q?7pAOK0n2WUYvvDtXKAOtU0lp4J4zRTNAYR0o4UI1CLNl82dbHLnXDWHZXkmD?=
 =?us-ascii?Q?Y5gt+U6B4/6wZtFaae54Aj1m+K22HuH4LStkA4oTfGyVybMeT7HjDXbrQZVQ?=
 =?us-ascii?Q?voThvHl6Jm+LMoed+jxGguIuBPz8h0WuV4yxebU5N8BseiYDcP7pGDQ8ZOwT?=
 =?us-ascii?Q?k7XVJWC2GgdgdCKKwlJxvttPXTwp8MdCMigGW6qJ8o8cI8Z923dLJTcU9Z5O?=
 =?us-ascii?Q?v3QfCrw9vHLs8/rhwVAVk8IU0BZC7JQsOqctrcO4cL07XH+MWKTkw5AbigqU?=
 =?us-ascii?Q?QgNCgxyo+pwMxYq4n/UGrpTkzZrt67dNClFWkAxerB5fNnbIU6GlRYQivI6l?=
 =?us-ascii?Q?0QCKIIo6t98DlwBdMhcItTozURtggUB8/xlNI6dQN6BEHxdZgxYaH8XUfcXG?=
 =?us-ascii?Q?KdLdNOhgy6DXX30x1JUZ3kL4jWOjJ03RIFLrRpLXXo3RnqGdGbfgdV0IqVhR?=
 =?us-ascii?Q?ldUsc2JIcAAaCDO68dEfNTPhxcck58EHjEuX0iD+Zlarrf0rfCuUyWOKTyOy?=
 =?us-ascii?Q?aKM8Nn4NBgNhMVKlAb44mlI3FtyA1DFu426hcXnjgey4kYP98Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cs4hUVBBU7hoNTvLZ13f+ESaFVUaVVqtUgvToBb7/7kPnqzli2fGQ26c/9TI?=
 =?us-ascii?Q?lN8seqlP31rhS6eaY7RxNo75NDpcSLaALuhDuAlrhSmu/tPBrUyRfgzFXIb+?=
 =?us-ascii?Q?tfsOY3FM2hlJOprL28y1lDPcFZiQQSD7eK1A0dO2ZaSosw9+vb1HXnJEgYIz?=
 =?us-ascii?Q?kfdMfMbtLDmpbc2DHEBA2pv2zykurwaK2cvQrMqYEyhiHmKZkZB1lfWPalwG?=
 =?us-ascii?Q?zSaqrJ/HrPJzb/zeDyEc7yc4RUDhTLcGibFnHUsejR/3oOuoFVi1pVFQAvBT?=
 =?us-ascii?Q?riFN2G5CebKEbMilnt5UxhzZhNsjjvv+wau5PIxRacOqiyrQaD85ryIM17Ei?=
 =?us-ascii?Q?oasBn+7JEBoq+/+o14X5/tpj0STj3B+0fv+CBfrz6jlNwUScB7+zWhC2BWJ6?=
 =?us-ascii?Q?Pv6oGiOj7+TkTcX0sAraeJaEwUJwYfrQz6LUjfJDYuMt1G2by4vBq6PmVuUi?=
 =?us-ascii?Q?sWBxByR1qK+TtktOPi33li0Hbn1i84RkonESPzIhuCNSPU/IcbPOsJfZa7Em?=
 =?us-ascii?Q?m4+30oGM/vgRa6KK0dy4Q/p3C6dk8egMGcwynznV0qwaqXZKboUdr9WWaMgQ?=
 =?us-ascii?Q?BTx/6jIWV9kSQcIVPu1gQohKAiMB13Z5eX3ch3tnEw2hKEmNaOEB9ZyAUMlZ?=
 =?us-ascii?Q?kXpnQ9JZR6kL6ofxfIKnJQ/94XlGZBR3dCls8Za3OyX8vS+yEsa7T/kVlCiA?=
 =?us-ascii?Q?HJwiRnqijA7Q1/7fFM9pstpaY9zcNC2U7ErXmFRpQHOWdWchLjiwt0KRbiNo?=
 =?us-ascii?Q?Jgf7na10xruF9J4kiBUwN3A0R80NRpMy7qUQvnVvUYb6aPFiwUEFk/WcQe7+?=
 =?us-ascii?Q?U/nr8L0SW6p4XqBlCeTy0XHKw2BjqC1CWPQ/sZ9Nzj+ITNj+2RpHH7DDvxH2?=
 =?us-ascii?Q?J4rnMhswah2ZuVrMK3ZHvIxjhlZlWD+qor5dgRnfhDgFbM82z7s6SO8ItHLh?=
 =?us-ascii?Q?VD/jCEiu9UyxepPPHsS6t995jbukC2zvKqF7zr8PQwF6snqBjcI+Rnws5xA2?=
 =?us-ascii?Q?sc2zeewBErtYVMcwhC4CUNdud5whX6YQKeB0Hd0T9h7/TwUG/xQKXtBv5III?=
 =?us-ascii?Q?iA5kENFJZrzj4Au1gwC5Y+SQGiayLYH1cukOWXFXNWKx7PzmyehY9Cu4hnap?=
 =?us-ascii?Q?H39zcToWcM2wAMHYH9tNlNT6WUNHZr0yw9gfDGdlZEFeDY6pS2wfeCDKKrf4?=
 =?us-ascii?Q?/dRsP26arlYF2C0z5ZxDFzCJQN5JC5iFPBGe3osb47fAC5Zmwdq/6Ti+dYaP?=
 =?us-ascii?Q?Y3LX1A/S49H3p9WGFDkqGwb0R9IzigdQABqAHFqzLxb3Wdu4kbCNFcxvmOW+?=
 =?us-ascii?Q?hIHQwdIp0FDjZLEA3UkJAYBDh3reSMuKwzfVxql3p+Y9G+SjoHEIBQrdA4aF?=
 =?us-ascii?Q?2P5eWaDVMqmWkZCzCKW8UJc3VuuUucdBHxZy00mODG7QyId9j6s/sIWaFXAb?=
 =?us-ascii?Q?YTMdBJXy/oVUkkRJ45wdUVf3Hkt6mnJS6eEYcU2DjQKorjr/bPUxdabmK7hk?=
 =?us-ascii?Q?63O3Dnq8vPB+1XpX/MZapV6jtJiZICWVlJ/JWEVV5IJg75GmmJUgKktSjR3Q?=
 =?us-ascii?Q?kiBd5+4TIQ1rQts8GgLNeJRkw8ChtYAFC9mTcw2AqWSBFoF1Tf/ri6syjhhi?=
 =?us-ascii?Q?f+fMMgOSnlWBwqAQP8lHMWQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d095eb-8450-42ff-c860-08dd133fa839
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 02:10:28.3572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9cuozm0Pe4oPy8vbduHTswfQq6DmMLG+Lzo7rJS0D56OdvFIOkfMM8T7tKXqvXiEL9bTrmkx+QdJqoMKW79ooxR7/orcPsG+EwRLq5ryOfFzwE9arSwOAk9R+rpONYc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10407

Because DT check when compiling become very strict in these days,
we need to add reg = <x> if it has multi port/endpoint, otherwise
it will get error or warning. But it was not so strict and/or
mandatry before.

Current code uses reg number as DAI ID, but it will use "endpoint"
reg first and use "port" reg 2nd. But it should use port number as 1st (A)
if it was used for multi connected case. There is no priority for
port/endpoint if it was not multi connected (B).

case (A)
	port {
		/*
		 * "port" and "endpoint" are using different reg number.
		 * It should use <x> as DAI ID, not <y> not <z>
		 */
		reg = <x>;
		endpoint@y { reg = <y>; ... };
		endpoint@z { reg = <z>; ... };
	};

case (B)
	port {
		/*
		 * Both port/endpoint are using same reg numer <x>.
		 */
		reg = <x>;
		endpoint { reg = <x>; ... };
	};

It will be issue if Audio-Graph-Card is used with Multi Connection.
No issue will be happen with Audio-Graph-Card2 / Simple-Card.

This patch swtich port/endpoint priority.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index d2307d135931b..f67a1e58e821c 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1045,12 +1045,15 @@ static int graph_get_dai_id(struct device_node *ep)
 		 * only of_graph_parse_endpoint().
 		 * We need to check "reg" property
 		 */
-		if (of_property_present(ep,   "reg"))
-			return info.id;
 
+		/* check port first */
 		ret = of_property_present(port, "reg");
 		if (ret)
 			return info.port;
+
+		/* check endpoint 2nd as backup */
+		if (of_property_present(ep,   "reg"))
+			return info.id;
 	}
 
 	/*
-- 
2.43.0

