Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2023F3054F2;
	Tue,  2 Dec 2025 08:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764664576; cv=fail; b=UBuQHaUiQv9GgDNY2tflnKY448CL68N36XZTzhBiEQoyxqQtZQXj0f6oMVkFJsERLVEFMueOcOBvIykFHZGM9HvGBtBWHwlm6K0/llNSyeI4yd8Wfd/qBVj4pMcunOoSLWp7WX7tk8suC48Nh1ezBj4oAi/tICzY4j5e58XpfvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764664576; c=relaxed/simple;
	bh=AKt2fqAElyEF3ZhmDQVE/LdeETHE6lrA3NezUgETW1Q=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mscDD8dsKbuBnPbxbLVWWaqUahL4/EwdAhlBz3Zrns0KOsQoxdNb8lz9j6OfBPQ/M9cLOxapdgud1gXpFGXXZpK8jv+2sQbRBrl+tBuyd9PUQCdG7Kh6kBcm9uQUuM4ovwHy+UyTTDlEFg8STadEzzVFZL2XA2abyLeUVQTu6i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ePGOmeUA; arc=fail smtp.client-ip=52.101.69.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ePGOmeUA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vvl6lHrqm2eW1dhqJMdxsez+KfrqosE4/2cyIBPNGNBL2j6XpvUxg3x7AKOgGfBarQ6i7LduR+Ug0zohmsCiEVWmDApjlFgxRMWh6QB+wra9L1v5rY0FhJaUSFOveo+dLSQhdEvIDyMYIw8t0C+Ch1Xzf5rKiS2nsFpaxFLTvEt+1noGV7orngb9LDfRN0ECDmlRoycI8DG4j/I3hyOtB2n6GW/zgbC0g2l7SF+4vFqoVE2ifNCfdheDPITaKsh5G3110mSP4Uoj3oISVIAnGhq1N7CNjJGConYeWAjQC7De0wiLxQ+oouGKxCxTA7MPU9REZSu9PshnO7YI8g1VdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQU1f+4lEd+2DxZZ1mK3YRvdBSDHn4Z6EthE7MqNZck=;
 b=iWNMs3c0liUIiz+7vAZXRkl8lVJF20KnetYjxV6nmS0i3+nEjj5IDeE7Ap4H4JkXokarzx0qXsCOZCxLUMt9TzRV/IMjHnRWWKyb0g0eK4a9cXiYVkmI3TmXP8glG1oI59upOaejUGDVILgphFLlfCryPP3S+r9fbHjhyXcz0IGvGGbPG5yHyLcg5b0w1M3YwOmP2ta2ySDc1sFGJBNNqn+qI49PinUbld/hkijZf9CGH6i18zAz9b7ZZtf9EETo4RaseeC1GOEzGKP6RcdCNlt2s+GyNbSmOpZ+fkYedgOjLW35OX6hg5JzgO8oDTCEpq7B1jxagS6bDh7HG0buwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQU1f+4lEd+2DxZZ1mK3YRvdBSDHn4Z6EthE7MqNZck=;
 b=ePGOmeUABF4eftwa+rMJWvGGzfRFOHYd7UkBMlyix1V0rl5o4i+xH1eQHd+hZaRu+g1aoeWx8pCJeQ5AflFqKz5wI/C4mQOfimEI+Qy58RRReI7KgluP4wCHmFYlhyhnuqHVXIwSPL0SgdRR3MYhKGCJInJWHL4dZr6MMJcAXU/CSRPE7i2AVmn7D6rD3kYCF42HWO7A8TKSUy+WpDAGXsjb8rcSCqR/6blb2TSxfT1PyQuzr79KrVA5dwaqD5zfUdbv2ZtvhWdQ2y9g3Y4fuIcRs5Sgo8a8h40m9p3oxFpdtTy/+ws1jVnetccfJ0P36GhzzLgqUDtOieQKwCWCrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB9PR04MB8464.eurprd04.prod.outlook.com (2603:10a6:10:2c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 08:36:11 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 08:36:11 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	andriy.shevchenko@linux.intel.com,
	kuninori.morimoto.gx@renesas.com,
	nichen@iscas.ac.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: ak5558: Disable regulator when error happens
Date: Tue,  2 Dec 2025 16:35:35 +0800
Message-Id: <20251202083535.1985714-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20251202083535.1985714-1-shengjiu.wang@nxp.com>
References: <20251202083535.1985714-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB9PR04MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: ecaf0ae5-7ec9-425b-f055-08de317dd89f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|376014|7416014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kBejtk9mrSzSDm0q4fL5zi7RqoMWm6xA/Im4Ze9WXh9ODcQtWI7VWrji6OH7?=
 =?us-ascii?Q?IozRsWy6l4E/nWJ9T5eGhhdVwW2P21od+WhBFZyT+R/QlcekTANlj1nkD8A1?=
 =?us-ascii?Q?kIanVXkYNzAoVZ6G213chqum7NlSuxfX7O4vJ5bpTKKA5iL8TrzwOq5juPhH?=
 =?us-ascii?Q?LgmrsL/TtZGX0gUFEk1HLxdnz3Lxc9/bBYn/pTMUydAPppFoAAi8KCeOlOOy?=
 =?us-ascii?Q?mRsU2IROCV+kkQBlHqM4x79S+eKI2We8oL0eKywJtdZOx2ZMTifO7V8Ppqon?=
 =?us-ascii?Q?c7iRutwFw0lKc8rMWiXI+8J7e/WheItUZgEOlYBxyK5gtxHvCQrdMk4LRDGh?=
 =?us-ascii?Q?sT5m3fxXWyqF/qoE2u/n54PtQ06Y2yfFCUX/iotMfRamVge6D7n7REC/ZSp/?=
 =?us-ascii?Q?glFTdNNGkuxn5OkaouSC8b+fOYOCYphprLeJWMMixveVYDq9R96YsrfrM5+G?=
 =?us-ascii?Q?YgL49s425DuCnhsLu/Tw2BgZyCVGBmWH1cNjbQ2yFU6Z6/9UBbtGcPQnneg9?=
 =?us-ascii?Q?cyszoJBX32GVzho2xBgoslm7bKB0HIp0rnFXs6QpqN1x1GJ5rTCaFC9yVA6b?=
 =?us-ascii?Q?SDnMjca7v19eD1nKlcgFSwBTLKLhxaWa5X1LhU+k8EAwrLKtpx7tDoQJlEAc?=
 =?us-ascii?Q?HXBm9zWUlv2cjoAgOif2YUXW7Wi0/354qpPdp/62IqTgTcpYZloDLvqWfXKF?=
 =?us-ascii?Q?xGNAA/ytXAyR3pEtqA4rto4IWeV6Qj1YCwGnwkvKoMAmGo21bpsYQHFfwy3Q?=
 =?us-ascii?Q?PasbgLq4O6UzrnBkbCXTwOfDk8R3gLfZh2d7JKD/oWTjVS0rxeOU0nPy5Plq?=
 =?us-ascii?Q?WFzjUCOwVpROC+gJ5bDXG4D70eS8wqSeFwbpyPxogyKtfaELH2oK1lpai2qP?=
 =?us-ascii?Q?m9odqYubOUbl/rCmFiF60NFL1s9x3JsrAeMtgCd2ooRxhkp/3JJsJ+3oYvcy?=
 =?us-ascii?Q?RPVpFbQi9hNjEmkCDjGINeqaZr5YSVAARXSXUgegUPHnNS+UuPGTneS9QBBq?=
 =?us-ascii?Q?0ClYBSc1Z22Pee+eXmvICeW7xjxHQSXtULL42PTbJqXNnIqNIS89OnqrtYHx?=
 =?us-ascii?Q?1g8LoVeD3rnNPw6k8Q1SRKVFZOtOre2P7vhRLtblmrt2Gvm+TV37QZLPJNfy?=
 =?us-ascii?Q?Te8jLsgFoSVR+pxb/Vm/xVrGHnLXt9ZioUt8bgjts4yNGgOsACSk4UgVXZTz?=
 =?us-ascii?Q?6JCgB17COaebXDSJA/I+XVg+C2qWl4+2ujToEMZJA186ag3lmSaTTpZ0HIy+?=
 =?us-ascii?Q?JQ610y0Sb9m0dvabqqIXZx0gfIjimYwfKiZCaMqDArYprx2ZJWiWwcLrG6Sw?=
 =?us-ascii?Q?GoNHUxuONy/+MQzWuhIrPE1h6qPI4Mr5tkuhJjC3+fzdHBXCj+NeZkPtAMNb?=
 =?us-ascii?Q?SzReMUuRsFZkZhOuR/Q4c1exIISE1J7YoQUW9ZTG5T6ImANyflq14Y3ZZ91Z?=
 =?us-ascii?Q?YOzvbIxKI5BfSYY59oi1Qt5c6qCJAXT+bLwD7yM+zPaB5r0pRhetwK92GBRT?=
 =?us-ascii?Q?Fo+p0N0ox9HaB3rw1/BawUzTjWQoV0U4umHjlYCcxod9jl6FFnMpM0itpw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(7416014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?piIlVZGM67RuW5GqqrW0fTZlZXIXzlkFjmy4NRmbUICQp00k9pIiEx/qng1/?=
 =?us-ascii?Q?jhcutsLDi9cTMoicTLXPU+ODWn3dKruHRqnn+XYZc6p9pq7dhxNaD7hrEar/?=
 =?us-ascii?Q?aueahx9G8Id7f8JuXIBmaonMvsw2cMGYZQUl/8MP4Lq5tkeR3J5vsL0gcyI7?=
 =?us-ascii?Q?ZHChIUjElkM4wj0gWXaRB6suMHd6x+TG75t2O6sAC9cj8gXoszzWbvmthFud?=
 =?us-ascii?Q?Va3IvtEpaL1Yi8hwIddaDRUjH3/Zc8rXUcuijvZUA3S3T9gaL/2c002YeNQy?=
 =?us-ascii?Q?IO+LkapW+baSwbWyaCNZssDUSrw8SYwuZL8d4WXP30GsK6F1Z7lzsJ/xf43W?=
 =?us-ascii?Q?GU6yq8+Qf1509yqygepwf9hefaKj9GwWsT8R7mc8Q2ntI8NgoH3emqrnnOi/?=
 =?us-ascii?Q?tsZ9IRe+uZtUu7wOklbtAAqa5T3pU2nsb4EtR8TEdQluncoMsK6j4opb6Vn8?=
 =?us-ascii?Q?LGsIHUuMaGgah1Uz5ZS13GjS0lvTw8B8qxsgjx6pGp0dEbQkWaRGip580Cnm?=
 =?us-ascii?Q?Kb7fIUTjDGFeeij36VZfh44NkAaVu5EmZWagE809co1ImnsX+84Mncl3HOrl?=
 =?us-ascii?Q?3Xq4J10UWaAeHlSQNVClL5lhU2SwFT+x9haXLoLSG5ZUC2/7yGZt+1Bu3RqX?=
 =?us-ascii?Q?Y6BouHkfl47p5Xs8TZ3O1sbsgreASVgRiADSHd408XjvN768IcCrV903DIkb?=
 =?us-ascii?Q?p8+EvNPNzdS4xUC7i5kh0Q25yM7jorPLjZ1eNrCzR3i5rYHVftUEFzlr/ahx?=
 =?us-ascii?Q?1MyPBketetrfJ4dbwAw4qXFktcMjX9M2elGCI4fxK0i8OFkGY/kbqhXuoskV?=
 =?us-ascii?Q?RXsx9HdJOGjVevZrHDFUEUqtUuPssT6r9MDwnPyJrpnyK6CXxQA4vUiUOR9q?=
 =?us-ascii?Q?uK6QPdtb9T7hsB89NI4Fd6x2I86tq8uYixc90W89gsuV+ROkYP4cPKRpYkRM?=
 =?us-ascii?Q?KF+ppaxt5PlMSiLOjKw8Fm+/caaWDj9c+00+HGkdnTaVOaDB2VgjWyZopePL?=
 =?us-ascii?Q?c712bwSAjr6LEuG8A1iKk2MCzc1vHXa8vilJulUfgwvQpv+3cH0v7qkb+HCW?=
 =?us-ascii?Q?EOE6CbttdQsmDPhw8x2ij6HZDsPk4GuJ4x+3vFperYNgm+N+PeAI/fN5k0G/?=
 =?us-ascii?Q?d0FDs1kbfrvu3lucM4gVpdeSYKeoKWPW+uomk7gI/FH6BG50HADyNmVksY2o?=
 =?us-ascii?Q?eFar6aYqA9Sw0zXT2uwv805CewMjsPBX+YhvuqNDy+oOaaM1u+gpmvCx2mNa?=
 =?us-ascii?Q?/BH7y6pKr8wjhLB64HVZvji7Wg86Va2unWrMj5yZ2ygvamMupCsyuTC2JIoM?=
 =?us-ascii?Q?X9ze+8jIaqjyNtokjRIXONfvnOST4A4JuAZsPvqnfevGnb289oVIGUXBVRBI?=
 =?us-ascii?Q?kj+MzkyGSnL1Zl0qoNl1EhaAgpARLrdc1O0mC/LZMLALyra1rzb2vB7U7QFk?=
 =?us-ascii?Q?KgxAcPjFRefFxDtANjHNX8uOOJPk/yZalU+7a8DlmutpIPScTphyC6yzBpja?=
 =?us-ascii?Q?AItwDSB/JGOLdBJxHatSOo0LtruK5HBcHjoOwlfnf6uUplJW/DrN4bmpO2T3?=
 =?us-ascii?Q?ez0ZTbK6q1xI1MSkwSIEH4L8LmUTxSu8M6G/XPFk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecaf0ae5-7ec9-425b-f055-08de317dd89f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 08:36:11.0956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4oKZyKdh/ppF1YVMlwHFSLbtR7eAhqayY/ivnp+f7Lz16dwfS2k2mUNIfF6zCBA6+7qG/RY1mNXIzWahtwR+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8464

Disable regulator in runtime resume when error happens to balance
the reference count of regulator.

Fixes: 2ff6d5a108c6 ("ASoC: ak5558: Add regulator support")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/ak5558.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
index 683f3e472f50..69ec215e2817 100644
--- a/sound/soc/codecs/ak5558.c
+++ b/sound/soc/codecs/ak5558.c
@@ -372,7 +372,14 @@ static int ak5558_runtime_resume(struct device *dev)
 	regcache_cache_only(ak5558->regmap, false);
 	regcache_mark_dirty(ak5558->regmap);
 
-	return regcache_sync(ak5558->regmap);
+	ret = regcache_sync(ak5558->regmap);
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	regulator_bulk_disable(ARRAY_SIZE(ak5558->supplies), ak5558->supplies);
+	return ret;
 }
 
 static const struct dev_pm_ops ak5558_pm = {
-- 
2.34.1

