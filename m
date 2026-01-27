Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010000.outbound.protection.outlook.com [52.101.84.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CA03358AD;
	Tue, 27 Jan 2026 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510082; cv=fail; b=ZvowZ/+HaGFFqG9eyp2Bv8JDRiHUC8KLPub3rM63Kwohf+/zRFOWjhAXv8uDl5eub89o+4BU2b7RDNmTdPuWMiE8inB64/sPuiggJS3iHwGNbKzzhdP9SmY8KMwrGKv8cQo16TtBgZsspohS1ktXBCgjYtehW0uuiOxNuRAafcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510082; c=relaxed/simple;
	bh=2f/N63kSOcC9lgDPIhysUhVwU25y6JaqA/vk3kHlsOM=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YwJY675S9JVY7LXUNGaV6rLM4okWElFZIHmLZ5FKlYTbIa9bf97afPZMhaF1J9topkjyJGUFtsGoSCfcxMj4Hq1ALkWSkH4rmayORsKkzwllh1XnqKLnQSbhy88bQsHPOInQubMHUwOWgz1QDl6yC9z8387NwVMK2wwoNf2kXFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mBdg76Ib; arc=fail smtp.client-ip=52.101.84.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mBdg76Ib"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ve1pNRg/6/6I7p1nQEMAyORgOtOZ+h4MpkXv+UVd468rOyuf+0Ro5TMhS/HzKNS3j7oPxyWammdrH6rmGK/wS0GqsTIS1VQpEnDPzY6NqTKtoRPHkEjDOABCWNd4IQaeysMGUOAroOCzSHMbDBWpsMZQ5q+I3bTggBSVvUBHe3C0u/cZdpRvkqrHAkaBb/usOtsA5kRs6f77ls2pvuMdD10rMu1GWQQOHg481Pi5nQzZ+zeFlE7zL0h1ooL7rjY6I07JAGjJ/kWQmO+PzBzZ/fMLL/qluAwcpnIMctP+b0sN7tpQL8gI86+2j9uzfFw47gpU2pB1ixzzs2SglxNxcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0R4aiUur7BSyWMC89gTflKLdeKdJ2boY4ZmI8w84Ec=;
 b=eWTe1jdlEY9ZuYfIDRiSFgb2FqWwk7ZRPt9aoVFkI6PwpKasrWuIsCerV+NzkfHUybBw46RJ22w26+TH4WAM/bD7ewXcCIe0R45ERRQbNrg/QVMV85sRFgF02PbVurw92nNOxaXBMNO2TgnHILKFvZbjvw0nyrr2Y8WM7ZlmNsCSOmhqnF5L2gu5cAr56e6wNk1B7d4E0OCsqqtwMS/I/h+znXYOGaPguBnhLLBJZYd1v4lDdMI18DHFyRF6jQIyiqu9lI67iwJUt3vzjFPOG/YrHoU6VPGgoKmXCcF1q5xcCeHASoFmRaDkgBsbj3ns1ZUFxnzc9YuFzVs12b2+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0R4aiUur7BSyWMC89gTflKLdeKdJ2boY4ZmI8w84Ec=;
 b=mBdg76IbugwRbptHX5ClPewqjOuyFzhSvV1yb9oqBpdGMI2oQ6eDbQhZSxQ9vqFbwBTOerhdIFM5G0Jad5CzENStE6zpkD/bwJ+Z2Qp9dZNWWK+cA8FiDlFue9/rYvAhb9dFhZZkUou7L+kzI8lnODz00g/19bLmwOJCuWWjHn3wmDh67TWdSRZwaynlqiGShfKncpJkXqJGkDzITWCRMAfw1Y7UVaBzhugrGDrZXZi6KLS7g4zLJzBaYGkng2Hqn0bV3D40ui5MtCXidBrMZLElQoI1SA543TjZov0adDXzsr85pX+maPcGWpsI4E8T4A0+O1Yhtf2Et/wDRnzAvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB9PR04MB8284.eurprd04.prod.outlook.com (2603:10a6:10:25e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 10:34:36 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 10:34:36 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	sebastian.krzyszkowiak@puri.sm,
	brgl@kernel.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: [PATCH] ASoC: wm8962: add .set_tdm_slot callback function
Date: Tue, 27 Jan 2026 18:33:26 +0800
Message-Id: <20260127103326.1920525-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB9PR04MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: e274e92e-cab7-44b7-dc4d-08de5d8faae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Axx2mXVJqaxpO68ojHbE0HVkhq2pDmFKZ4O2HE3Il7QBSEpjLW2i/g69URkF?=
 =?us-ascii?Q?zKZ/63upky89JGJ5FlXuV3Qe/ycVeIK2LQTlhWIeV7VGb7MFjhC2WvsL5eEn?=
 =?us-ascii?Q?wetZPZ9uTKqzhglo6eSQWof88G/ZlttMcijH7Qeu7ZBfYWPkGVyFMZRCYgSh?=
 =?us-ascii?Q?b2O90at7er5QnBoIMDhiaTV6131OfrcMFHxcqDTyoVWFFb0nLjuXgyizOEA3?=
 =?us-ascii?Q?3JDqbjLDOOVexyc7UP6RaDqm6m7/JW9FP3iPRmhGPX+NfD/5lSJ/s2N9Q/3N?=
 =?us-ascii?Q?8nIr5zhacVqcV8Lh9Ul844Y8+8uEon0l4Ufaj/uZKZLhFfoKx1NobeEkIv6y?=
 =?us-ascii?Q?tpGKuph8CbAqSWg1StANW8tQATB4SxO3Q10pQu6R86A0WYdnsopnK2K391N1?=
 =?us-ascii?Q?twYBCJD7ctzP5UiY3ym864gwMp7OSvkpTzolOT6mJM+apDajHrOMHiXK1qpf?=
 =?us-ascii?Q?kSpV2JOz9gvDcNgo68Q/PFdpXXASGp42vTcwwg9EMiimRsFX9RI8mDkPrz81?=
 =?us-ascii?Q?azWHSmPZyYujJNYaGDQltZEfkekUYfnJuZ9ELvajeKbD91Hl/ZAK8d2XpIGM?=
 =?us-ascii?Q?+CSwym72hMDl1yFpeUhDVdPDdTJUcpuwMY1NRBC/Wn58jJou93Qe6a71grA7?=
 =?us-ascii?Q?grvK7L2A8SnQX8n9jDlJoGZzLruGfMzLDXDnGDl1U3xqf7H/37SInGDRLZys?=
 =?us-ascii?Q?Yzrw5GsBYpQjbogC97u8dZ41Oev0OTImIcbJvKbxfhgfcx8EKj8pKEnJc+Yu?=
 =?us-ascii?Q?IrI9mSjmKNJaMO8q2LWiG65avS90NoiVn4ob3P/lpNppcddD65bH1OooRePU?=
 =?us-ascii?Q?JFzvDALN2+cyA+dD/ZJm7nGjePLDPcL0sRoZMIOSbjD1T2tINwRwvdeWtkH2?=
 =?us-ascii?Q?kzmqdLM+idFVV2jv6/BKNkmFe8lI0/PGF3fWKqbvJY8TynZzDSB4hPZVV2hS?=
 =?us-ascii?Q?/DHKCGN7oVC2mBLb8tbNU56EU2QMRTIKw+VwNlAnOMuwSwXLXRYtBsoUWZwh?=
 =?us-ascii?Q?wvwWQFZzEnar0XmHp0aR8oq6BiKoXbdjHOUzYB3KjnlQ7sUZI0Zu1BlXzuUX?=
 =?us-ascii?Q?owKchjtSQ+S/wUXs8L/69y7AsHNqcCqjgnFScbaiHEO9wq+DmhSYs/7c7MQf?=
 =?us-ascii?Q?AbM7roDlnBUnWp9/+V9TzwKVgr10Pa+VE5rgP5gEYG5DYzAyHIHU5O8ll/q1?=
 =?us-ascii?Q?kZEk2CdLuK0I7H3YPENe2jpJAZQSaJtxnN6hy6ZoAS/QP8xnVjLLVWh6BBjU?=
 =?us-ascii?Q?dETpiPxhMeSrGl3gyrkQk5yjgMg9Dj2euAaJXVoL6EcKJ+HeGABeIg7NkY4d?=
 =?us-ascii?Q?Jrc4WJXnS0oOHVVHLXexsNYYwrqNxbOxzr4UBHD/fcFbCsMU4OQk2ZUPfaq/?=
 =?us-ascii?Q?xCt2AqgS7cfEo1sduc82OwIl1DwtxGY2A5/pb1L7vJu68xPfBolIsFyUqBGD?=
 =?us-ascii?Q?ZeVnSsxmYPVUDk19ZY2qQQ0ezmbVPvd/EiW6eaSBt18lif68pSiEkGbckSF5?=
 =?us-ascii?Q?H0UD0mmSvYvD666n9ebldXsos1yhWO9YybhV6ucQcmkbLLEomyt53iJOnstC?=
 =?us-ascii?Q?GgzVcV1M4PmUIrWRyEwA+D0NV7xo6qR6gD0nij/wKhrNeD/rFfbBtYF8xnR6?=
 =?us-ascii?Q?OQB40G1GxQrzpo8/xLXv4JJjEBZosQXl9g0j9zxkqzID?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wL3wheoSVpBnR581umoZIwOScpnNApCaVYuURo/BYjGc+HzCoyWE9XvP2kSV?=
 =?us-ascii?Q?mNiqhMfQoROmM5gLgDikwnbtP5nj75eyXdVWe8yCSqW8dEEGj/xfFyiuUauP?=
 =?us-ascii?Q?YgO0rI1u8K7OdaGplyAvrlhn3TWZx2YVsSMbRJQJGkjNYdX73GO7litbzcE2?=
 =?us-ascii?Q?sc3M63PfSvYSuz6OLYuinwgvl7MbmpJMX1pais6RbQhvV0vF8dDeO39lRL8X?=
 =?us-ascii?Q?nSkRxpBtFmhtTCV6oXlhhPRJmPpcFkBJnk5XS/P9u24c7eZJCIlsFfFrM9zU?=
 =?us-ascii?Q?JfEqEc3sFtUK1pHIHnnH5s8IhO4VZjGsA3ECPurqLJNRnbXecL14c7QMWEny?=
 =?us-ascii?Q?zQEHqDjAq5bpODCaAUu3/+8HGpJ+WB0sBvdAuFdGLa6PleBO3PzRP1OSr+GS?=
 =?us-ascii?Q?35jEeSNy3hWnQwYb1+gKycvkr2cPiI/siQIXsKcbkAZY85ppB2e1W5DkqV4/?=
 =?us-ascii?Q?JxnRJifgp+UTJnzny9KkJB56MuytBZNgqrfUPk9dNDXrrnZH+d3WnP7KueII?=
 =?us-ascii?Q?HVPKk6X8E03I4Nr6ROVZ6DvVTzNUv/F5wQEf4tUYrXdqHJKPiRBA94ckR6it?=
 =?us-ascii?Q?GT+7NVYyjPly/aL6lZRhrl7Bxqmp0K2h0xpleW4+6+kcOmtvl7cr4/Og9eDm?=
 =?us-ascii?Q?SzJEQMqNFclZ4beBoc4rSDISuxZiuKgxZAmgzKv1FzW94W4CtGNNQTYLSKSi?=
 =?us-ascii?Q?hV8xJzDQnb4R8Ek0Vh6wHi76Afp47XWxaq7yRtdzR8RSftX1unC/f53wzXb8?=
 =?us-ascii?Q?st1vDwv5BTj/YG4OLcnAFk8sa7yBqg4VUuQASV+Vo2euf/M5K6D+XlZhFHbK?=
 =?us-ascii?Q?RLnRXhd7XZRag4cWQd+IlpWOw0RgUOSyolfDz1dbFNqJBpIHl4RCe8gJ1AbH?=
 =?us-ascii?Q?EWOhCrDC4QaXXXEQwE+p6lJz3hOm3KaX4YA9pTvxU+QsT72+jd7xP02b/5ne?=
 =?us-ascii?Q?BSCn1Qntwz7aNNe1/VD8rIqoS4tsv/2k756beFMmlnUEssI5X0g9UF5d3UkQ?=
 =?us-ascii?Q?2+Oob/mWen5S7hJwgbVZkY5A/yDZE5Pqo65Ay7dg0j39oAEzrgTxey7Ex7Ia?=
 =?us-ascii?Q?Wu0mqEwLSkwrEq8oxGywYzXxJTkiUjAPesG5E288sV7EO2PHbjDcq4m2Jwtt?=
 =?us-ascii?Q?hprG2F0UhLaBCAhTXkpVHjKAsYBPHQX1oYylkLCJFOGr0aBt3dvis8KbtObN?=
 =?us-ascii?Q?e/aOam/Y1CRp4Yv2fbxA6uSiYIEq4eUZpNkM8sceff/ZBMNkBV7n6zFzD4Hr?=
 =?us-ascii?Q?ODGs1+he0FzJBui2GiixqQKsAx7R/pWn5tWqOK+zQ5fjFchCLR5Mc17gt25k?=
 =?us-ascii?Q?2WNrARL/0a8ENJIG5H7D8xlue+eUErn/7IsqZ4QGsqsXr2ZLI24neXvFyNTa?=
 =?us-ascii?Q?6XQZ8DUDStdXKqiNdCbHcL1XE+DN7NU0GMdBy/HrQufnnZ3cDKIhWsV1MmN5?=
 =?us-ascii?Q?zG1xQr1AXLD+oEnJVmTvaRP6SVmTE6/cMLPQhO4GdX/9qoJbrpf9xZXjqszx?=
 =?us-ascii?Q?b8qnhlHwDxNqMfzAg2AszCSXTVHZ+Grb3MQNC4fgEW7mnSTkqHGlwv9TnQky?=
 =?us-ascii?Q?v/bS3LIYSeSHab1bvBxqEJsAlziRaVY0zjbyDTLZvew2YC2iaY/vqMKulah3?=
 =?us-ascii?Q?l1YxneWf438CFMtqLjDQ+dYP+mFt0T2AAypOhCCxjZQrF2l4JqoptzVjR+PC?=
 =?us-ascii?Q?SzHvbSkAt+bqnaU5w8WOoxFrY7N8cMXDoomVTV/BHMZ7TLJ++xyiDrEhLpEC?=
 =?us-ascii?Q?a89opLZZLQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e274e92e-cab7-44b7-dc4d-08de5d8faae4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 10:34:36.4971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPXTLeW642QNSIgO8NamUm7Zz1WF9o1xLvf8Mtxv1NevOXGrrsHj0z1qDkMeWyZNJPpyYw6n3B0ihCURRFtyLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8284

The slot_width can be different with the params_width(), for example,
DSP_A mode, slot_width = 32, but data format is S16_LE, if the word
length is configured to be 16, there is no sound on the right speaker.

So add .set_tdm_slot() callback function to configure the slot_width and
update the word length according to slot_width in hw_params().

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/wm8962.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index bff864467416..4a3943161b54 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -85,6 +85,8 @@ struct wm8962_priv {
 
 	int irq;
 	bool master_flag;
+	int tdm_width;
+	int tdm_slots;
 };
 
 /* We can't use the same notifier block for more than one supply and
@@ -2612,6 +2614,21 @@ static int wm8962_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static int wm8962_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
+			       unsigned int rx_mask, int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
+
+	if (slots <= 0 || slot_width <= 0)
+		return 0;
+
+	wm8962->tdm_width = slot_width;
+	wm8962->tdm_slots = slots;
+
+	return 0;
+}
+
 static const struct {
 	int rate;
 	int reg;
@@ -2639,10 +2656,21 @@ static int wm8962_hw_params(struct snd_pcm_substream *substream,
 	int i;
 	int aif0 = 0;
 	int adctl3 = 0;
+	int width;
+
+	if (wm8962->tdm_width && wm8962->tdm_slots) {
+		wm8962->bclk = snd_soc_calc_bclk(params_rate(params),
+						 wm8962->tdm_width,
+						 params_channels(params),
+						 wm8962->tdm_slots);
+		width = wm8962->tdm_width;
+	} else {
+		wm8962->bclk = snd_soc_params_to_bclk(params);
+		width = params_width(params);
 
-	wm8962->bclk = snd_soc_params_to_bclk(params);
-	if (params_channels(params) == 1)
-		wm8962->bclk *= 2;
+		if (params_channels(params) == 1)
+			wm8962->bclk *= 2;
+	}
 
 	wm8962->lrclk = params_rate(params);
 
@@ -2660,7 +2688,7 @@ static int wm8962_hw_params(struct snd_pcm_substream *substream,
 	if (wm8962->lrclk % 8000 == 0)
 		adctl3 |= WM8962_SAMPLE_RATE_INT_MODE;
 
-	switch (params_width(params)) {
+	switch (width) {
 	case 16:
 		break;
 	case 20:
@@ -3039,6 +3067,7 @@ static const struct snd_soc_dai_ops wm8962_dai_ops = {
 	.hw_params = wm8962_hw_params,
 	.set_sysclk = wm8962_set_dai_sysclk,
 	.set_fmt = wm8962_set_dai_fmt,
+	.set_tdm_slot = wm8962_set_tdm_slot,
 	.mute_stream = wm8962_mute,
 	.no_capture_mute = 1,
 };
-- 
2.34.1

