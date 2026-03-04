Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57CB37F758
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605367; cv=fail; b=faxpUkhri4Ex2GTT10x3HdCun6Gn5vpGQOZQjjg3xOBiDUZKAHUVkpZ2ADvjse8hICnZk8vQrDEN9FNv9vQ6ynVpQy9kTQ0tyNMBVsHbuu77itJXq8aW28T7fnBfKEkOzTzB3rBzmuohQSIVGPqo3CALOQAMllTI1sJsSGYLX70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605367; c=relaxed/simple;
	bh=DiihS53u2YcSunu7B7kvSRTjfck02Ql4L/fgTYVZfgQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jwkv5cbIVqQ1NrfLPW2BJdU9SxOuhO9OzFBFiuVudxdf2q8ars0JyfsVx8jG8MDAk9LCESGFgOxhMa5vP06b7il8GaWbi4PHgoGPK4bfGs7qnnHbG6de18O5rUegSaCIOH6ZiOuOqcRDOd/ITLiRLZeSesuYE+VSIdzCjkqfpHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Eglo+Gr7; arc=fail smtp.client-ip=52.101.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Eglo+Gr7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amReGpA6kMzlB1RPBtiMNjF9fKS8kg01I9jCv62qNINP2xaceYvjFEBPhwXkj8YWO4qH8KQD+5o1ELSpk936XRH19tE7iISKlKbsbJwB7bKvcEx7rkrveyu8q2v3QUCM3C7HwoD7tCogYaoGeQZC6+fIlC2hNI7S0sZE5HF2NhaZhs746eNTZEUJ1IGFiXkzR7hwRlEqtMwpFfqeW0hh+QyGWbWsG8NrmoLXtvgVgMzSGv0/8Xu6XSQLfF2bhZzXInrWxHlBgyt9zWy7ALY3vapOuMEkVwZz9buBoEVgIfucoG4FpTEJy+oSZ/iVv6w+Bjhzj2BcYtAba9js1TGQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3+6wEnhX8BkNMU1t+V3TO2rHevwZ5TGpU4SYoOifLM=;
 b=sLbGpv+G0hIyYgXFC3W/P5JpE4h+RsiEOwAACosGjXOtEgnee46D1cZxCTPFiaI5HneYKYzE71my4PyySz0KZXqP+tR2ZXHUOT/WuKd2Y/rcE/ZLrYTtpL8g38ivKgaWOdhIbd47WKKvTW0offYSyIp0ja4EI4uBWbaNRakgH3g9VPIY1AuOg4uTHlksYl4XJfDXT6X2aKvCFlvEztbJLVw8teAbIhQGUl2SJ2y09uD6nPzf6UAJXvcsDyItKDbpboIQeLD/uDku+LzsmDzANKvRSmDSI0fuj/13WsUP1ULoJ8mN/Nxv0UufCIrvawAYP2a++JYBkd5TXCnmdOwqpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3+6wEnhX8BkNMU1t+V3TO2rHevwZ5TGpU4SYoOifLM=;
 b=Eglo+Gr75OzUoILOLFq0uLxZnPx9ROhtUOP5ghVQQUDw6RD8UalaanMyyEC7Tip+TCf24GpIaxBYZ4F/PYZiqH0FAvel+FUErDCgLyiagya7XceHxV+cRkk3QzyOmvp3rKsBjT3rE00qMFVRgp2ol0EgwUEzpHpQ/ZNDy13ruyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:22:44 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:22:44 +0000
Message-ID: <87qzq0p0zw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/29] ASoC: apple: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:22:44 +0000
X-ClientProxiedBy: OS3P301CA0040.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21e::7) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e339097-d5e3-4ac5-e2b3-08de79b6727c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	eg3zLt0XXtiAqXS+EUbepvlGX9dsvA3lpvrsLRkaD4ozhuGuJpjWaL+E25+P/DHvq5qWU11pYTdygNJjz24zKzkHuvUgwHB488r33vbdhAMLkDocjwX5lAwP74r6S+4CqsTutXwofW0N38wHdMoaYUY/EyJIa6LpZ+KVX7ntvMqqO7TsNUOxygFMLBAGSUxK671ocKJLlmJ0WJKePJ8JoaqEqs1r65wbb0GWMoyRZbbD5wfN+N1N6wie3kA83EPg9uBDdqplakSO4WXYQkhwC8N2Yodk7WeoA3zLNSq6nAeYWGM4OdxSiQqHUa/sy7DRWQJ3hBaa0JVUpIOsvoDTt3sLnOq9jVe24gLGTKYDJYrSxvxXrPJXnGSbJ6Ct/OW/7/k30Gm6yLXJXgRcrKi0YgbI60Rt4sK+uXudgnsLyns8Ze1qIQuLIeKdAoDK0WyEaWKucGP2N/5BfOkpzi5DdzMsP+oOJ/MaSnhimrF2Osksogq6rbMOCoH5AODE0arvcnUnWus7peiQ2AaOmrUAC4UOTuP3FRE46fvKxZLewEqUM5C8wzqkksW34N96+4IvgJp2lmWGAptrjxXI3v/lUdpHN3Sl5ydIEFhsl1graAzti1YDQ6rHynUgWYb21Smhhp8kN6iO42XLAMg+hHna/vkY0FUrJZhQqWaSPZZAcpRLuOKRzt4Tar7JQ7ezW0wv0avUB/cKlUFFNmanCTac+cFfMEizfxmoYfFkL+ZHGRPmuagTHSNdDKp+ZhJac9gq+rxr8yxPrDMPKM5PO4XTMc1OcfSAVU4eD7ID5BCqxsk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?saky7etViEn8O48qMgtb7BvjoBpwHlS4+lJUdAoyplXaHvh3ku/3UE1lVjW9?=
 =?us-ascii?Q?4ula6fcXHpji5PVIPSKO7kZVy5cJyaElLLiOa1chwlsqVDYGzWKntHw/uuW9?=
 =?us-ascii?Q?IWkpMeLh/YL6Sm63XtnWA8DgK8cnZGJzGpht9xdTfJjel849Z+oqft3grde+?=
 =?us-ascii?Q?JKc0mKdWz48z+IlvAHJ0FLdEjOPUmkuZDvzNmdXUU/CmQEOgk6pHxymtcqY9?=
 =?us-ascii?Q?FD+Cn64ghnu16+1PEgZLF2Uaxszj2+qxlLl7DMuhGDm5eMG5PEbgwe0UDdnb?=
 =?us-ascii?Q?sdcN7vCqLq+eO1u9C/kejKpR5BgtXOL+CxmPY55ya9CXSw/7Z9ky7YNuyxR8?=
 =?us-ascii?Q?XmAuSsG/91Sz+in2f14AxXzvPWPrn3T+2oA1oLHuLjK583wmUl14lrzvX3Rw?=
 =?us-ascii?Q?XBTRk5B288nnq+x4PLoTgBiA7FN2ndY7D393Nj6NDOuOEs6rC2eXkKLH9p0X?=
 =?us-ascii?Q?2hAvGw7W8HQDy6dSRtBQXtYwKYvGvkRdydGrvvoX6w7gkMzgxb8WFe7on185?=
 =?us-ascii?Q?Rpwby5iwBRyahOQg8XJP3ZjvzduW/SrQ/TBZ+/oswlsaYSC/dKYO0GyCeaeE?=
 =?us-ascii?Q?Lvdl/dW15iW7az4N6iS6Gb3ZWNKn1bDosAW8F+tNDIXU9rhEVPnCvbc0UZBI?=
 =?us-ascii?Q?J6ZvQJnFfNQUdvRqjCcI5HJUJ0hrRSSWVP6lrexGSSHkxY725ea5NJjri3we?=
 =?us-ascii?Q?fpL9jat3zr3wZhM132UIfb29lwQBoPIW3DyIzc4XmQQig6v6U5vcOK6cQcmn?=
 =?us-ascii?Q?KnjALKhQPkLAZcesiCmPGxf7ZyQP9TkGhkXTv3MesX3tWCQP/fNwSI4+wI+w?=
 =?us-ascii?Q?8et1r89FHHr2PnJpRirExCCwOUCnvqQ47bKJ/rbWJZLvQE6IIylsFH1eVC0y?=
 =?us-ascii?Q?XHKF1ya1+val1UkbRySqBLTwWOH1IYmfPNVIsi45KWsgqcVqUQzgmS0IEYqU?=
 =?us-ascii?Q?+Be3RyYNAtzP37169kAEHxx3MRcvNt7zGqSwazXFIOuTR88CftakviqoLVoK?=
 =?us-ascii?Q?bkOppgOQUAvojCdFOqrpiS+XiPNKSyPwd28t2NOhrIkGJcjt3Qs8dfhGRn5E?=
 =?us-ascii?Q?M+RSCzNkDqCmoSYXHJ14N33i0/rM0rigSlvK5cumWCp5Qo4Jk8zMBdn0GuAe?=
 =?us-ascii?Q?thQ21h4ePYF7yrbFcgKWoNtr2dTUq2sBH43cJBeDYCGiaBp8/sB86QqReEg4?=
 =?us-ascii?Q?lBnT4IW4YZRQiD4Ccrom8wrmASq2U2Mi2ETEfMHnL8IkD5uNsxuFypNe5xvL?=
 =?us-ascii?Q?Q3aN+i0B2ekEAlotMhKEy6reoch0ZjFgIIxcqFLw9bH68QXtOEeisI1YXKAb?=
 =?us-ascii?Q?qg6EziH0Yb8CsCOLRhsOWuOUBEF0ei9A7T37q7yEuA66X9UBZgl9YvzqJx9U?=
 =?us-ascii?Q?UjvRNoNkL742o5RSu+6OAw/++gXebBfsmQ4YFw80p18JB6uUsxcwGmN6dYIV?=
 =?us-ascii?Q?Kbtl9SlYONqOXiIIppwGXrmKzjzfGHvKl7IE9DmQuJMXFr8hH6hgiWftYs1G?=
 =?us-ascii?Q?PxVLsGFQgH6rsPlhQkkNZY8kY9TG+wd8NDDhr23VD9+tBznf4u4vOlZ6CH3a?=
 =?us-ascii?Q?fkofE1vhcgDpVHXvY3qaVCLSp5xAeCd5s8qU13LkleRHxJ6AxOL+TISADop/?=
 =?us-ascii?Q?LorVPrguX1nred6FWPyjn1gwWP67LI3oqHFW5cLsWAmq4BM9daPZifNjBUkN?=
 =?us-ascii?Q?5iMxpAWMPYt9mjlTPjuSM4gkkzNvqIi0je7XbkuLZf7YRxAVKJXLX5pkZG2W?=
 =?us-ascii?Q?A7YlIes+wfRAYonItyqbUOrRKoMYohNuPb8CYJx01XGHJ3qkz4sn?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e339097-d5e3-4ac5-e2b3-08de79b6727c
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:22:44.6052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHYvD59z9UaGMq7QpxkWQSj3G6ogdElTmpbTiZyfokxV7wL2gJ51uB1F/6A8mysUu3L0keRDdVsHnMi6BRqeAs8COX14EdFUIfRBu2CPqdUD1S8OqfYnBaXGuSYncYYc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9755

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/apple/mca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index c4dcb2b545912..39269cc7def62 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -1002,8 +1002,8 @@ static const struct snd_soc_component_driver mca_component = {
 	.hw_params = mca_hw_params,
 	.trigger = mca_trigger,
 	.pointer = mca_pointer,
-	.pcm_construct = mca_pcm_new,
-	.pcm_destruct = mca_pcm_free,
+	.pcm_new = mca_pcm_new,
+	.pcm_free = mca_pcm_free,
 };
 
 static void apple_mca_release(struct mca_data *mca)
-- 
2.43.0

