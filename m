Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013063.outbound.protection.outlook.com [52.101.72.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150FD3A7845;
	Wed, 18 Mar 2026 10:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773829668; cv=fail; b=BKaDkxK/8lb5Kdbr2fWxY1BDBX32hjbq8PwGb68mRqlPEx5l3kcFDGSdJuv2MpKINtEnMiX+8Kv9U4YMtqY4PoeW3vGYjphBbUc4tY70Kyfj2NRcSCBVz1OjfjoFHwZvT/u5RoWZRTI/1TE2nYHUU6OzjHnlx1Ss4eMZUWJd940=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773829668; c=relaxed/simple;
	bh=0j4RWfi/vZOWPIi2q5qTu/0s/ZeDfbpPXr70AJFHGFs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JCq5hhpfgpO0BhXwsn6MmDgRC14IEzKYpcq+EXvY3+92QWSrDquZQg9xgctmiA1u2nPR75vT+TDgEQ+r0YM2j2n48EC2pf6HFiT3XliY3sgKoIKQDpehLSQ89yBkktiTfPDTM6WR++ctBNnzXj66LiqdqOw+XuQ13DhMwYSMEhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CsFCHA9m; arc=fail smtp.client-ip=52.101.72.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CsFCHA9m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIzMZyT4zYzOJkTjQn6vFeXOIC5p5NRPWKAAeS4R3x/nwKQ7wY2u/STOETeiK4R0UQv5JjvSc13D7qIQYM4WPiU992mq+So1XTPeKAwu967h/MDQHn4LZH0799b2O+ye3sMVhtxkTOC6hRxgHHMhh8BP2M5qQgCMIoXkSyYn7b1hwNmHjTSj0ojjaLSgX3kW6dfIEwrxp3+FfpwnGDnQasepZ9vdf3/mdU9PPZo87dVvIBuN7sKgrirzdNAysO7n3p7vGti50INjskEZzGqzCRtw2mXo5/5wvajBjterINFcedD50NoXY0FOkbmnoK/jeoH1T/LDBcwLOckRuD3kPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMOoT9ESJfBRduJPMVNTLixhD1Gyhlyc+ssdBJ3Zq9o=;
 b=lm8JorPfEMUsZpyLGbbR8FYTdYOUPMeNR57aEAaT/bXzu8dwx0hjOPuOTu7k6ZpHMnPzd1VAM+lrewzOwJ9+lx9H2f4cDcy4UNCbEVoRDQrgsGtiYlYpqF+9JEnGLZOo57SrwvCCh3z92bmlehdqtHISRWhtpbv73D7iC4QfXtRPNNVdWn+JCWMEomiaGKswLJkvZ7TxKUhNIDmtZ8C5+FNY5PtboBEJWgQJ3PgLWmpL7GFQjW2IRjhE8DCWUvdnegvfE8xDpJoJ6e8HLS4gD6A/eCb9cmkaFyUgCslFFucMkC+DdzexuGhX1feSj88Ieh0N83KJCrDBjaYVpOKngQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMOoT9ESJfBRduJPMVNTLixhD1Gyhlyc+ssdBJ3Zq9o=;
 b=CsFCHA9ms2l9tBtLBvRlcVSd9zveoOn7Ft/qOJX95RWjEycL9SS+uS6hC8W1xxU6QVgugWdCP4D4/pQnhelZ2raICk+KvKWyzMAc5EU0lBxzX2tFgAbviGfoDgY8koPXYtfww3MxrAkFDGqxtGD9PO6k0pvkFdEkR7KURINfJ8j1wX2XVHOxXQIVCjMqAL7A/3sAHH7Sr+UF2meyNZBm4rnnTXhZqEc5hkRGMpkWU6WKbxZm/8UOmKX+Eh70bbVpCsxwfAzXGaNpQaGXXBXIOpx7Sw2C2+fdHUs+FH9zMkLzQHWQ48r0871tUgem2gYIhXfoIUfyBWNiWm3BFxjw1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB9514.eurprd04.prod.outlook.com (2603:10a6:150:20::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Wed, 18 Mar
 2026 10:27:43 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 10:27:43 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: broonie@kernel.org,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	shengjiu.wang@nxp.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alexander.stein@ew.tq-group.com
Subject: [PATCH v3 2/2] ASoC: fsl: imx-card: initialize playback_only and capture_only
Date: Wed, 18 Mar 2026 18:28:50 +0800
Message-Id: <20260318102850.2794029-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260318102850.2794029-1-shengjiu.wang@nxp.com>
References: <20260318102850.2794029-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB9514:EE_
X-MS-Office365-Filtering-Correlation-Id: 428dbb03-8443-4810-7981-08de84d8fd3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	QCJASLvE/7dm2C83oDI7imjYmbnr0XlsMc7SrLjPDPpY3MpQaCUwve37rDjqqQ7cVuR835Om46Ki2sc2YowShZicDKBkZtJiuSrTR9UbA85OXnCtDUD7+GRoFjMTc6+c5CYxuBBhdGzUnz5wTejQM5ZSTs+F/66bRRLDnaDn0tRN1yfb0jqYnnEHi9AaBInWgjqPl9KsU/lWxkG8wEk4PSI9sS1LeoomUxS8trJyIdImEGlV6JCrmBHkcYihWPZBBxgL/C77sCq9XfHv5w3Ap93ejwzX81zTL3/m5jaQ+s7OHIlVelPr9PYsMaBuko2FxPW5yjKrjm6Bdle0LEUFDoJ4MaTlgTzNevbYu6E1ikDdI/POYaYArAonPd7v4xJ020OYcrc1pVt1ol8TKoNOVk0EVJ7eYvmAdhEEmPE29DSkt6EtaHgh76GCkQftIdIsFHV4Av59MCPghdIJbGL7wzjBxgf6OPTEKk8lJcrMLzKw0C4K2efHE+37c70AXIFPZ2B4PfLTiuTv23BZaLT8E6mGZhV1F0kjHins29AA/B+tun3iN+RA7UsHCJU4WW5pMFmVIah+pjHxx4M1IBDfg4Lpf6SPGUTdz9GwcJCwx7h0nEAmOBXdwyFhMqnKHwGuH0BpL8u3geJn8peyrxKf9VrdwW4pYoRLdSjlENg+EjEFE3b7j3VUcZwyBobFJG7HjEH7ywT4Dfyuc707S6bbE+WN+hGeeg0gkhLjGxdtcGecLi47I7NQptUQCGwWXfWZ9dlfVI39JLtuOV7daZY9kGHflYx5URVs/A4CPLPUQDQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qYn0aaND06UQunyg36P3+cJybn779vNpebaykxXpbZW8hGurR2tCbarQzfP/?=
 =?us-ascii?Q?nY23metjNYdiOJvUd2rgI8Wf/IYdytgJyF8Rfv0YY96SWI6FAs0V167Z/br+?=
 =?us-ascii?Q?uT6h3K+V9HyAi5p4w8XZRuKpU77s0XcODHxEZ1OzsJC2/alVwZNgBc08AjwH?=
 =?us-ascii?Q?ll7erjTJyDKZ+XYC4JFrPQ5wctYW+9gXwNcfimJbliRM/3QFh4TjAjdlAzDO?=
 =?us-ascii?Q?V3XTrptllf6m8n72TAusKivG8PJOnDz4glGHREvOvNNHwuFnCc8tYZydee/g?=
 =?us-ascii?Q?bMj3fBxROV7kqeICJEX7BfZsKakaX6iJUjy6N02tF6LRJLSIheqTQ41etJdD?=
 =?us-ascii?Q?gDYE+Bh4rPDHdnNrKZcXGNZ1YytSY1PDKRpET5rmIow3SWySSr3dJp0LqjoU?=
 =?us-ascii?Q?toiWSUaWctqEd9Ahq7xWESwvtxWVti1GoXQk+WHdTaLZzDsbbOV9jZ82HfGS?=
 =?us-ascii?Q?QuRIQNKJqWtB6gAtHf4qd42xAVNelBXFN37NZBpB1WZfakCOa0qEjnwC/Y3R?=
 =?us-ascii?Q?acdKDmI4H5p0lNqxgeV0HLjCb4QklcMtEzTVFSrfIDFiCFSJjqKmD7s2laRt?=
 =?us-ascii?Q?MF6wx5LVcG0f9TE4Ke+pjN2hIIZ7S568uh8yTO7GjCzAeiecyY2OAqEkAitK?=
 =?us-ascii?Q?WH4eK04AumqeAhNRAH2aXWPJlFUX6oPFbBbrOrQPHB6PNLLmXkAp+RzSnGN3?=
 =?us-ascii?Q?46YOgffbeZGht1ck1iPM6z14mkWBr8PsiH4lUf8BORVdUMg2z/WUti5HHRWa?=
 =?us-ascii?Q?kN6bQbjAiaVNJ6b1nMpV2XQRLEYaRm5MrTgrkTWTAGX6dcnImnBIOLDhmEy3?=
 =?us-ascii?Q?al1tn2uM5jEIoITI6cq3jMhGgrfHyGvgfbBlT+pzNAJgzIGcOfY0hgB9j1vT?=
 =?us-ascii?Q?aWEpNtxedysFQRoPLQaiK6vuZq1ijB1jJNQy9HDdEJq66Fn52wbeoXP7+iMd?=
 =?us-ascii?Q?8PFiTPQ12RG3WOYg8lZpldQOV4BrLeIbow7XsypwWQnZ6XABWH8WtFxd/PAo?=
 =?us-ascii?Q?FNX+GY/0w1xf+6Ejwx4msY3pGGI+PigHx0lOyT4VbYjoMxhBAEPFog++UZQm?=
 =?us-ascii?Q?zRhW0GymzDizcfc4dwPcc0MILvgzNx3+1tnXnT8Xv80kSora2ZoTAd1LqL0P?=
 =?us-ascii?Q?t2cYfrqC5tUk39qwa8aghHi+4G7BGYMumaPFcMJUNjrvbIoo+o7yo69Xo0cR?=
 =?us-ascii?Q?ASKiHM+jrgsxhF1Ct5aqye3kHZa1t/NqXzt9tyjZjNeoDhBCA0H+9nlw5cJH?=
 =?us-ascii?Q?8w3ZZ4GABCdTJtVpTBM+x6UqDXc2O41v1Y4BSD0U0M31hItPw/9iuRFpFj2f?=
 =?us-ascii?Q?ta1aCmfpxW9e7cLB7/sup3QV8Cb/iKrmEx0tT+VZDDHisqpiu+wuh+p/ChqX?=
 =?us-ascii?Q?Q3UbaROI+pWrDy6R2TRKQf32GW8uHE8DhgpPIh34wq5lquXDtQA8EpWJHGL0?=
 =?us-ascii?Q?RpuODrMqjfDQ28WfrMG/uV7i54dqyZyqk0tEUUZPHFcYmRQP/eN5tLVNDk2P?=
 =?us-ascii?Q?WejytLcvM8CQzKGSesLRJ9GD/GvMQkC2eBzj+zl96C8MokWbTFRqdO31rWhB?=
 =?us-ascii?Q?734ull3WQs3qWuwtaUuH8P5nwvtCyZTHnf9dZJ2lfKrjIx0PvmQa5eqF91z3?=
 =?us-ascii?Q?/QzOodQdbK6nNkOnaohshef02M9XEbU5fVD/y5E6E1yvpxsPXbwqt6gTkwW1?=
 =?us-ascii?Q?PvCF8jfLUw3d4UfM+W+9sf5D3xOE1f957MJQLAlRassMrYsJdK5l+KoUtfk/?=
 =?us-ascii?Q?a3N8j9AR8w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 428dbb03-8443-4810-7981-08de84d8fd3e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 10:27:43.2982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bo6dJA62g06B7GVaItoJ/mSAzzwTpobyKVOQbTEJM9yEVaRthljf/CEba4Ayw/nKoe9t9MGF3LELDgNqxVSdtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9514

Fix uninitialized variable playback_only and capture_only because
graph_util_parse_link_direction() may not write them.

Fixes: 1877c3e7937f ("ASoC: imx-card: Add playback_only or capture_only support")
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-card.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 05b4e971a366..a4518fefad69 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -710,6 +710,8 @@ static int imx_card_parse_of(struct imx_card_data *data)
 			link->ops = &imx_aif_ops;
 		}
 
+		playback_only = false;
+		capture_only  = false;
 		graph_util_parse_link_direction(np, &playback_only, &capture_only);
 		link->playback_only = playback_only;
 		link->capture_only = capture_only;
-- 
2.34.1

