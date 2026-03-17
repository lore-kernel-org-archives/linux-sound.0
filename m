Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011007.outbound.protection.outlook.com [40.107.130.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FD030AAB3;
	Tue, 17 Mar 2026 03:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773718726; cv=fail; b=fuQAhVjn8gsHpL6HDJWG3Iq7k6kTiczVJqIIt28sOvqhzUKtChhvthu2a4J7aEN4P/Vze0sbk8ZeZcT6FRFhIVdnHw8pqUUT7JvgIrEVlCqQJo2A3sRhCRjt0NJVpPCeKMnUkqoWn9NIQmiStprgdo84wOe+8OeNOf8sAliVRgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773718726; c=relaxed/simple;
	bh=u5oTh2pgZQsHV0YeNgj56XJzGBSNg6vMnaBIc4/31Bw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mIyW3AKtFcsNOmcaxKveCqUWdvuWyS+okZUT89Oel1rQ+U1Z36MhFrIog7/Feea0tHYu4Rrgi695GoOymuFniURSIgPzXW8xewNEcmAOKD9pI0aikeMiK5PDO/E1y6o6IAv94jH08y8awSB18epCOPOoyYY9AzsTaMXeByZtyAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VZ7JOH8Q; arc=fail smtp.client-ip=40.107.130.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VZ7JOH8Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhGJy+txhAn+RHB1z0MS3QZwrq4hjBFT9Kgsxd7XvYFgiHryScFXR6t4/utyZ5euT6ZrT1Yt9QztCnZzMjxzEJI48UpkbpQ4J+JZ2MkY1mJf+M19D7eaOL0XoxwwWT/puusbEHCixwZIrTFrUbkFQdvYI5sgmyH8CeKPAP8vB3XhcpxQlql02O4GH8Maa4HATp1c4LtNCFPfobi610ftgrkJ7ZBiE7fQJeyLOraETxpyChYzPYqklvIYfftS6avBGCQzAUxWOXyk2pZo5g5xvdjhH0e3SaWEiWOB7IqY3CqnGt7SKEuKT4uxxPtr2kQrFo0S9yGeRqVZrnkc5C5WiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OE1c8i080aKmsohQv9P5b4LcsDovQ+T8kRNT75+u3Y=;
 b=YFZezAqoF7w/rTPnRO1RsMAHpbyf682ai6Y9S2638DWYbb6GH7T5BCptVKEm/d96mg7oZfYKKw6ekjv77C2yGlP3U/x+scNOTXlCULqVqHu/ylWpjeuczZZmY9hkDgveTs8weKqdujE0fJuRjZoNUKUicbLnme8s+FiHTZzTk4qb3GW4+DBpl3bebLWMTO8BIvZVj+Kg9GuPUbSEK0i8dm4PHjLs1aHfViY+DKRYkUfTLrIzYOUe0r2mBff5vCei66UyQHNuRVrrsuIR4dHMVERbbnwLIAGUFdz+ua/vLuXBKBpnqUfvkJKuPkAkUrUh/9uRcElUFG5jPb3ZtoRCBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OE1c8i080aKmsohQv9P5b4LcsDovQ+T8kRNT75+u3Y=;
 b=VZ7JOH8QZo3hKTaiR8MB7OvMlMKTVT+FEzEsWf0Hs403ptkyQqzlLcJzlUlVnFi1/9ewILQUqa4hwGF6M/eSBg23Jg9EwOVFS9y0YldV0OvshSyxNrFPLSAsOUxZ9vXzPk8t5mWWsGxEJBDppUjra42DGmnK+Ib6njj6r0WU1I1kWyGLFh8cYzfIKb4k2iBxw3TPyOC87E7WqQmzqRfCwHvRlVWLxzpszhkeV+gJxNQK9dAmcuGP6rceMx/bcyqBlUggPbmahaWTueHEax5VC7jb3y7E1iob9bl3rqG8g2MuU34B4BmKKdwoVq550HD0gKZO1hLPyl96KIkJCnWHyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 03:38:35 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9700.025; Tue, 17 Mar 2026
 03:38:42 +0000
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
Subject: [PATCH v2 2/2] ASoC: fsl: imx-card: initialize playback_only and capture_only
Date: Tue, 17 Mar 2026 11:39:52 +0800
Message-Id: <20260317033952.462209-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260317033952.462209-1-shengjiu.wang@nxp.com>
References: <20260317033952.462209-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::20) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA4PR04MB9565:EE_
X-MS-Office365-Filtering-Correlation-Id: 01da8086-3431-4665-7009-08de83d6af65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	RAORy7eZA2yygqMu9ZqzYdMKLZI9Fwlx/BOMqEq5wm7et6NVzD0MztCff0Nvr6QtZxvy+AnIn+xWGYtsbGAD7+zRlMpjWClPoI9zdjKtL7+au+SwvPWe1DXM4NuDjPYuCufQDvWP7x9zKgOq0TL+ZVEep6j9efXDpl0Qzz3huee2iMf6m47Z0wq/rQM32PTEJkkUGwcqkIBRDUS7L8rtOJpigzc420yace20fjFIbfBaEXk31fdDIgAMzInFyez4dI0kN4nWj9Zav9VNbtHGwjZN6jzzFmSgaek7e2kHIh9YoLy3caFvkAV2e6g+i23J5Du2P9AmbaFmJDlGGWd1ye+6nBNXCtbuDlHE2U+g+HOWnIRmYD8OhOlHoGTdUALZhhw9lKfxRAfPmmeTwDNLNPh4l2k/NsvGZNAziEkcPuqBZEN6fKMxYRA7KuQS7BNrvqFnTr6LmLonGW/23wyefODlpYrwtzIXJH2q3Az5xTW3Av66MxMVoUgljsyxuAmvMqZi3vjXA8arFIw1MOzLwlKkk8TJZYjyWwyxlGFJctOeCzqK+i3qxA564BNhB2A51i8PvSapVSeKJKx2iVouVwBjvccZalnxzWIb1kbYoEwGwzb7WCJptNmDsKjwF/8WbcDyo+tanDiH34ii5KC1hVpE1qzeP3FLhQCEvnPYtQzu7rPRrnsfpRQLb6icIQuI0mX6ncrW5b+bnp+YMWeLDfiLOwCOkUnsRgOZnXsLTu5Cy1mUwHRO8aPRUuxNoMYgJokemzeFXwZXZcBElupD+pmruwdPkSao7qU661zq4LE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NDu2f7Vt0Xn+ZO/FGfIuaraMsRise5Br4Tt1ziYUoiXjuUA6HEAa2ve/viUu?=
 =?us-ascii?Q?sm3AJXrsZHjf52XZZAjcNJRc3bk3XVYuitfIewUOqKAwpAeGV7XsR9UfpRJS?=
 =?us-ascii?Q?OCPGhzybjD7dlmGyc7XMI9oO++kMKak8BaJx0kEl8hhJczgqEyLT1ul8tAZq?=
 =?us-ascii?Q?r4M0EaKcylNAAaEvv+3jds61PqtwQJg8PqzBu4l964v+I6pBkQAI7PoUt6F6?=
 =?us-ascii?Q?ibqFp4jmGicigY6Pz1Q2lruEN3p5T0qqfa4rFnPWGGjS9OZlKfFmAH3wY4lz?=
 =?us-ascii?Q?B+/uRHIcWDsOtE9iAGPCCGgcijaUkhe0JbxACfFMUlEV5EBxShecQ8+khE3N?=
 =?us-ascii?Q?WaF51GTu9/anBhqTEeySgHG1qlQc2TlCmeEb3CWC7Lo2mpl4A1MlO0M+kFEI?=
 =?us-ascii?Q?XyaA64xHUPw8Ro6uZi+9rBhfBWGhZIFpWVJklVtBBzd2isAfr1EDJx3NsGpB?=
 =?us-ascii?Q?e2Ge/tochUZbfB4ee4gH8sTZ+iJnrdwTCmhzoDwMy8binDGZGSd7VSHoMQaA?=
 =?us-ascii?Q?vuaVWUZn7j+PgcVG0Xzxuxf3kURRtB+IuaRnE837kUwQDMHFE0CPhwkDyuph?=
 =?us-ascii?Q?EgqIKMAZ7qbS5j0R9uF7ckRyPfivh5KU4ZzrfVDW/DzxqEFkTQwNr91ZRiRw?=
 =?us-ascii?Q?0d3p2zjzqAdn3oFlyF6M8KKPStYOuhllnjKw5gl0xTrEA9x9HRAtHkA9iFJm?=
 =?us-ascii?Q?PUjolRMjnOlCvYTiTZ1fs7wg5/WgoddmHcRPvB/omnHRQ64URDQCUld2Lh1B?=
 =?us-ascii?Q?S/ephIwsfDDi4n5yyVpHP+6pL4udG4g9AlPO8J/77zQci/959qnD8+xiXRGX?=
 =?us-ascii?Q?fnhMGK+GfVp4y78bfFTFYACn5Jb0j23Fex3dcItDVu3Od4OOoAp0KovuyZ3X?=
 =?us-ascii?Q?BJT7sAyoKWnPjVvV9+MtAJYVW1p+RLThcCdh6i752sHMQKqAXzoLvxBU/eK+?=
 =?us-ascii?Q?MxqyyoYQtnzwDICe7RX5pkYZd6oqAnFNjqHaUqjGg6vWB1YCdeQOtchyatu0?=
 =?us-ascii?Q?ahjeuNr5rWJx27R7w82PJ0TRzqxFJayIGAmCKFHuXd6p0QTFOq94FCeM1uIl?=
 =?us-ascii?Q?1ComlWY5lw2nM6I+JyXR9V6lcMfl8CBmhtGKU8kYbCIGnXdyTfNiHodCnc4k?=
 =?us-ascii?Q?eQ6TcxtxckwZVaKFQAmZh7caQNV3c872qsrPmJrDLl/bWUThwRsJ4gnnXzf6?=
 =?us-ascii?Q?NoGOz8juUguY+g1Orypod4515jn2TQP3E4sOnwXCqwFB1G0aombghfP/nt6Q?=
 =?us-ascii?Q?xfl3cAUwT4HUdY8LyLo44i3Bg6BsR2QAMnd/ah5oUUGcULbR9OpuiX8krAdy?=
 =?us-ascii?Q?yIHbwzwY29pwm5ccsZTfPcXoy6+ML5GwiDEcA0poiWPoiQaW9J0ZFPGnkqLq?=
 =?us-ascii?Q?rcRer7SALgWLAFiKHwW7GznX53GdjQT9KKHE6B/+8saUu4oOkpaAJrHoQFSx?=
 =?us-ascii?Q?oIY0a7mfx48+dKpNzKz5M7+BLbJev0SSs3fI1GwSKb2/EAsKi/c4YuqWl335?=
 =?us-ascii?Q?8rRIJ3l5hFvW9JM7ZRQp460bTn3/2syp1yvLl+0ZEvThGS2gY8ezfO44/LMa?=
 =?us-ascii?Q?/9+6cj9flKlq5hwU0GOJAEd78MMEbEC3c+w5ECiZa8djgXeyjseObCmH3lYs?=
 =?us-ascii?Q?+WBkuWS4nwG6AuUipxWId3pAf5Xp0Bb/Ko+ybB5uXe58AHi8sLS2UgIPFOPt?=
 =?us-ascii?Q?HAt814ocvGVyu5GeyP8Xo4JidRdN1M9JLt6tQbqg6AiLFyDML3fxR8Ocqx8C?=
 =?us-ascii?Q?MIBXYGL8Fg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01da8086-3431-4665-7009-08de83d6af65
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 03:38:42.4998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suzksPx6e6HrdEacaxHDSwWlGNA7u8Zy9Y6AgwlLJHA8tG6BgNNlJBAMFX5p6Sdj2G48lD5uqijtIRsAR1mpxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9565

Fix uninitialized variable playback_only and capture_only because
graph_util_parse_link_direction() may not write them.

Fixes: 1877c3e7937f ("ASoC: imx-card: Add playback_only or capture_only support")
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 05b4e971a366..4dba52ecc602 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -544,7 +544,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	struct snd_soc_dai_link *link;
 	struct dai_link_data *link_data;
 	struct of_phandle_args args;
-	bool playback_only, capture_only;
+	bool playback_only = false, capture_only = false;
 	int ret, num_links;
 	u32 asrc_fmt = 0;
 	u32 width;
-- 
2.34.1

