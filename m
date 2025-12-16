Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010038.outbound.protection.outlook.com [52.101.229.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3270033F376
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 06:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765866286; cv=fail; b=NifIgEVJuTQm89yECp9xc2v9ldNm/Hp1YCSBx0rYFVwWw4IjJY4HN9mxUz6kT3668bVDY8IiyDxSbseEmV5nQNEDLEJe4CyIS606HdSpGvi7qJzrvdisU1XgXL1a9UhxAeLHdYsK3LkA2eJf4RSL1Po3Z6w4ZIHTBbn5FiVwbKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765866286; c=relaxed/simple;
	bh=oJTE31TVhS5CDTGb+Tsq0D7jsTNNiGW+CJpJE5QL77w=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=QDOLnbJNkksmWDxGmJFlwzsLjRdz5SAbeY0kK6Lfj68O8s5JMEh/URF14066fcU3zLVBmZFkG1/+ixedLG79VImltuc2/8PXgWmof4Ife5GYBPsep81Ap8OTr0Z5BA3/LLkNs/l9Fnr8mlH9RgosHGaLMZcgMcKc9sNmWv2buPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=n/kiyVNR; arc=fail smtp.client-ip=52.101.229.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="n/kiyVNR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFsQ88tP6LsCB6HGRs7TOK0KAn/UhEY+84ojBDooRS9juULd53lh/PdU1ObPjoSHnVYf45fURz3rHbRpcv0OjZqhBweA8+QrRPdFeTgrTbWU3lFVRBzyhV7Q4MLM4G9JiiJbqv604awzdmxjxeDgoWFTaPWyT18o278JrBJQ7RQ8uVU2zKx2CZvdBb/vLK3j1mhs3VTBClM0NcWs3oS/PjXgfXfOE0aurrRu6fPQlTXlGeuLD0CHEfx4V/l0iQT5jy4Nf714OfhIaQrIynp/aREbrzLAidRh/fL1zvDUiFnTwF0DRxjBjJhHtJGZADorz4ASsfmu7U04VKbW8weUBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6yyywu38aw5HMAt15dDjFnTxyn4j/bkk4EdqpuAmwc=;
 b=J7ZRYXvWWvFlHPGFCcx2SGxRNKhdMcWTyYJvOth5bY/VH8OmyXQpxydrLj7wt0dbZB2fVZ0/bTEVUeE2+cL8GvDJs20w72dlnKkKV5vgHQ6UFl73LuxaD7+X2YCbmp9/Eh2N6iIS8chwbCZIv3ZVPPaqYcV3AQPIJppVZSt0+jFivKGHcTdLOcKTCdwVzXINs2kaWzI6jjNQKenqL0idVqx04VboZekH3lmlpFpyG7frjNHWuU3YRrTxgxlcVGhyOU2ZFn0c2C3jcXAfbeUIMXy7uZLBZWu6mR72mNAFcCw2AUOvLYvh2iOMqfME/OoWfDwcnaG0SRAnECYszqpPSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6yyywu38aw5HMAt15dDjFnTxyn4j/bkk4EdqpuAmwc=;
 b=n/kiyVNRjXD7dDJxRtVSi36oLAoFkQCOaG/YZv6+rTgXDg88Lj6hL1Q0CvUfBtZ0UZ02eSAA8C7ZVeDgIa2rR/sjlc1UfSguSUZYtfjslHZ3U8SKPmqA8uHikrEw+wwO3zU0nZZOSvMHNIxcZGFTw8v3dFtsOEvRh8W89kSVCK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9692.jpnprd01.prod.outlook.com
 (2603:1096:400:232::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 06:24:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 06:24:32 +0000
Message-ID: <87h5trrljz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: codecs: tas2780: tidyup format check in tas2780_set_fmt()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Dec 2025 06:24:32 +0000
X-ClientProxiedBy: TYCP301CA0008.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9692:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a6a048-607b-4221-9e2d-08de3c6bc6a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4FRvtM9wnY9oU5mwSwb5yzBZe22KYZq3a3EHraz4Fr4Rc9GWaI59lW8S7rAJ?=
 =?us-ascii?Q?0WU6tVuVjC/nJDpzBIfqZ3oeec2FJYL96517q3Flgxg0tTXlvHlksNHQ9DMC?=
 =?us-ascii?Q?N2BqwceXMYZNm0nCYw/QTubCbX7LSs2lsqz8meb9U5rsgzPDuW71zbmRc/gr?=
 =?us-ascii?Q?UfNwHFjqD3Mjma/yMvfSdNfi9q/sQ9VW8DI/KJwExqg/2/4681/JvF4bFxpu?=
 =?us-ascii?Q?6BSm/H49EE/4wqSgcK5qvY8Ly+zwz4eGCmm1aupO4yfg32RaRzKQF2n0Scl+?=
 =?us-ascii?Q?kz/RPMTvNIt9Wywtv3PgMpv2WNp7Dfkx7ddvXSYi0B+ILd38Xd34/XmlJhRp?=
 =?us-ascii?Q?Tc2EfKCPY1v1gRtFqPLzEm2QmbaGmkZTLi3pbGW4Fh2DTPRhJFHZbV+eR/xf?=
 =?us-ascii?Q?9YsaCeqwUei8XBtNoIrEjyucj0yked840eiwvGjxM/F4ddBie8XHZMJI9bNP?=
 =?us-ascii?Q?V1go+zKxs7C+JryGTlz3kAOwAdP7H265bPhiLHF5wE2wJpf/kqYlnwPe5Cqm?=
 =?us-ascii?Q?P5/Y5KFjFmjZXevF3CUYCSnXBM2dTGzyvMoVh53cbKGO8xQRGTcLLTLXkn6r?=
 =?us-ascii?Q?J4fi4N77NRPXebLSUS36+eyjapEQ2pKmI23LXGHhz8d8xXqy5fVQf6Oktt3a?=
 =?us-ascii?Q?S91L9vH3uSWGrLdlz5w6ecNJEj89uWzt2yBtCbFEv56oODvYzWYNORUACXXI?=
 =?us-ascii?Q?/zRXd9mOXT7RhfTjvcYJiYfWO34M4Yg4yfAhmBXvQGJ8jlhH2L0L7zZ52T65?=
 =?us-ascii?Q?B+paa9mMHfr+iKK8K280DHa36VXx4AaAQJ/xtaUzQKsI20oZyxNw5NYnK7E/?=
 =?us-ascii?Q?j4BIv6xu1iqzXvEyJm4UI8MPG/Z2pU+efA86E7jFZFwTya3VDE2fkiGao+X4?=
 =?us-ascii?Q?vXf70dGhjShnB79tJx9yz1STzSsnX/uGWiZW+5j7bGX3JW5sFV2B6/Ot6HGR?=
 =?us-ascii?Q?JSFN9Z3zaQSNw+YKS2E3QcByVKTA4ekKOgJI1m82jOd4lNf884FIyFppCLVr?=
 =?us-ascii?Q?fPm//WodSn/nAv+H04JANQKpGJs+d2UKv6/zEBklAgleGZSJfsum9fJujVtS?=
 =?us-ascii?Q?syj6TDVMGmzKQRcX8gTAFHgB1BbjtsVUi3jhVfIJcWCLm2YPwtqBMzBzsIXt?=
 =?us-ascii?Q?/UXiZ9Ip56ZI74l09yUsBvOHc1iEZWbSROOYC/A9bm4LIfjR5DMe13S4xiG1?=
 =?us-ascii?Q?VH0FGa/A/zQSfOLusjktlFZvW6wAv3aN3MRIDavcrD9frd2MAY1f4nBOGDKs?=
 =?us-ascii?Q?1RJl+lFrIhzoc29t+rc8QGxNKi58ZjyX5qZyXPiIxAIAROc5FW5JKvu/nTyw?=
 =?us-ascii?Q?SzkoJfnH5HMl2Pm7VwHmtZuB4N7OX3aGDF/DriX5d5RIa3c92u783CT1Gd8y?=
 =?us-ascii?Q?hmUkFAiapYlcRqvNnN475ACyrxp6Kt22wbMzuByh83b/brBuh6ozxadqQOJj?=
 =?us-ascii?Q?lOi8yAntBtItDyqLKhBU0/0qawwjTBjuNwu8jAMGeftaUi+Y5wu6BE3hCT+r?=
 =?us-ascii?Q?JNQsLwBuL9WlJeevdVWE2nDUDSt6+eWepHqs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rqa6ducK39NRJrtLm2XzwNQdCRRqNOcQxYPDaOnbHcjF4VcAkM12DT3ouVqc?=
 =?us-ascii?Q?4B1P4tvy8437iU8aiPSVEmF2VzzL1x/5YUXHs9618KKbcDHSoHQJ7uhJ/Lup?=
 =?us-ascii?Q?fkbjzgT8j/7V4hLIhH9YlP19RU2v2IcVSdYXZqVW5NX4WHxvvwAtEaG8PtWx?=
 =?us-ascii?Q?UKrKMoAvrTVBjaG6FOqS4zegwkK0lzVuHz6l77Kz4Co1ihuRKYAx39nANKv0?=
 =?us-ascii?Q?3GZBXdFAhdlWUUM5q2m6s+vbMuSFJu3zD6ErDxd554S9o42R61OscyjyckGt?=
 =?us-ascii?Q?VuJpU8kprUKCR7JDcB8axNV9tEt6HVYdAkBxDRrocixGQd7Uz2IZ8H1Cx/lK?=
 =?us-ascii?Q?HMVV4sDPE8WovWWL0Ii9KZ+j2sygJz0/xS7rxpqkdWg6ssAKoB0//yqPVDQ1?=
 =?us-ascii?Q?AiQRP4hoiHTRFT9QwL7hjoP6l4KdtA0cKXOnYJmP6n4F/HZwyc/d6o36c+5d?=
 =?us-ascii?Q?LtMyKHC5AR/7zP09wAZ+RhItWEmQnEOYsPdF0r3KtT4tRj2n7fj8ILifxRIL?=
 =?us-ascii?Q?emy4G+fAu3+EPH9RLa4pYrgtlq13tGiv9Is+Cp0XVkR4X9aR2tXscin68+Sy?=
 =?us-ascii?Q?Jaix/ss76HsMA3rqRWX/hrIBo7dcCevhi0GFBQJ9AZSeLeBtYdH4d3sT8THs?=
 =?us-ascii?Q?p+CSQmtM1E4vf52KxDa79ivfIoXERw1ia4IyzRh9ol+9/3MS3+7eqDatDzbw?=
 =?us-ascii?Q?tUgnOwMdrbo2IL/bn6n8/FUusE5c9hv19mmgr2uLaLm8NWf8FQetsGmNRS4J?=
 =?us-ascii?Q?H1BJolPnpIu0hZyRdRokEivt8UkoDLe7T8UEZbPFHzu1zHU6XE6kXau5/IK0?=
 =?us-ascii?Q?LFLvG6F52ZkLZfLrVYcO2pQDDVPP40imFeD80ydZZts+0jrtT1kUP8ZRVkVK?=
 =?us-ascii?Q?t7eHqkZl6apGDslhWdXlnKWk6Kzl7CnrBQZkuVQSerogRjHNz/JtHBfat6fb?=
 =?us-ascii?Q?X5B2gb/YNVrcEdrvfbP9GvwoY0XA8MmZT1JyH5qbVzJ2kos42VhBPruTMGAP?=
 =?us-ascii?Q?M8V4ERlPBHGW86eQHJ1AVUk+klRkfRj7xEy2PDUDT9dYfOLvKTtYh6ftIwNd?=
 =?us-ascii?Q?1NFMb04MFwCpnrffrx/gYg6ZRf1JAjrw8jSLq6ngoPuS6Jqv+XPc4JN7k4UT?=
 =?us-ascii?Q?0FszCHTNOwmBvU8dgBSgfCNQ44CwRqX2fj0+/MQDLTvf40RmHLhtKRDh+eUX?=
 =?us-ascii?Q?R3wGZmmvY9CyJjmQLev0gjhDuVv1E8cOvLB5EXJ495P4LsDO57aA4TI1WHH+?=
 =?us-ascii?Q?Y/4q6VXqQ6mq7ZV5361dlCJXuaHseolKoIQZ2oIQ4VRtjnZW7JcOAWLyx50P?=
 =?us-ascii?Q?MJ1gaVPpj1RNv+FqSqWgQadxRFvPV3L2i61AGee9mU5ITrCG2rFzZsqH3r6U?=
 =?us-ascii?Q?wKHPM2Lx6hwuE8g2Qorcu9MB47QbzbBCzxHxKTqh/X3DGLyeVoIbzpvBCb+t?=
 =?us-ascii?Q?urVH52ouItoEnAnHHrNyfGWiDT655MlwggTpjr26WgBo7fuCcMytwOF1TN0A?=
 =?us-ascii?Q?tgorkv+I31aUmjI1tCxEtatDV+JB7ZzzLzrZLRE4hiBO7hK6VTOsMwPbZsQN?=
 =?us-ascii?Q?sEabBdddlQTsX6Qj7BKw68b/Lqu8/3OQKdstEfamGJqz0kpmhRlh/GRHa91T?=
 =?us-ascii?Q?/Jg9uRwNP2ruiJ1u+rpxRj4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a6a048-607b-4221-9e2d-08de3c6bc6a4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 06:24:32.6327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TExb8W4l36LgiDIlEWlRrjuERO1Ycx5DDI2k71/pJQapjSHpwtWPdnyPqH0o5pW8lvlRULsSEUXuZ+SSe+OPza2kKBma4l3azL9BCsC5GfWjiBE3fFHBEpWW0PC68PSL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9692

Current code is using messy code to check format. Let's cleanup
it by using switch().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tas2780.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
index a1963415c9317..cf3f6abd7e7ba 100644
--- a/sound/soc/codecs/tas2780.c
+++ b/sound/soc/codecs/tas2780.c
@@ -319,25 +319,22 @@ static int tas2780_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		goto err;
 	}
 
-	if (((fmt & SND_SOC_DAIFMT_FORMAT_MASK) == SND_SOC_DAIFMT_I2S)
-		|| ((fmt & SND_SOC_DAIFMT_FORMAT_MASK)
-		== SND_SOC_DAIFMT_DSP_A)){
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+	case SND_SOC_DAIFMT_DSP_A:
 		iface = TAS2780_TDM_CFG2_SCFG_I2S;
 		tdm_rx_start_slot = 1;
-	} else {
-		if (((fmt & SND_SOC_DAIFMT_FORMAT_MASK)
-			== SND_SOC_DAIFMT_DSP_B)
-			|| ((fmt & SND_SOC_DAIFMT_FORMAT_MASK)
-			== SND_SOC_DAIFMT_LEFT_J)) {
-			iface = TAS2780_TDM_CFG2_SCFG_LEFT_J;
-			tdm_rx_start_slot = 0;
-		} else {
-			dev_err(tas2780->dev,
-				"%s:DAI Format is not found, fmt=0x%x\n",
-				__func__, fmt);
-			ret = -EINVAL;
-			goto err;
-		}
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+	case SND_SOC_DAIFMT_DSP_B:
+		iface = TAS2780_TDM_CFG2_SCFG_LEFT_J;
+		tdm_rx_start_slot = 0;
+		break;
+	default:
+		dev_err(tas2780->dev,
+			"%s:DAI Format is not found, fmt=0x%x\n", __func__, fmt);
+		ret = -EINVAL;
+		goto err;
 	}
 	ret = snd_soc_component_update_bits(component, TAS2780_TDM_CFG1,
 		TAS2780_TDM_CFG1_MASK,
-- 
2.43.0

