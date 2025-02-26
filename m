Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C91F191F7A
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533699; cv=fail; b=EZWLqCOLkLWPiOs77scHsC4U8w+TR5gz3wZN7515cwun9dKvSOrn7IKCqkLgtybVzUtj5Floyhj2cx7rnF1RiFvHvPMnY7C4nS5xphRWuu6lgQ/RL0EzHW39fripe4jdhxVve62d34EM+4w1MsaCcQW9Vc4IsdC8fsdU8wCaan8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533699; c=relaxed/simple;
	bh=Iis8oVdmf/1YYlsiIj36RDYfOMunEzhUAGsRYoFAP3U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=d6FO2c3fBnqAsMY6B/AqSnPdGwVyU86pvyhUrGZV1r6mAq9hQ6Rw1yHsPx3MdaFS2vVchpZyu6tNaVgmGodTf5wfNVgbkn7/tUrvjFWVfYiPTzcJqWJCX4j9W/9NwVGKSNovuCfeuOeETn/L0NVFouNNIwnciGgeuRIYbli65B4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FdAERy01; arc=fail smtp.client-ip=52.101.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FdAERy01"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QODaPYLvJbDzCxzy3HJCUF29I830ChAAai35pgTzLsRFPi0dWcgG64g1BF1IlnTj4x+KWlXB81gMzoTV49cVV3h8bkIuATLPV4yGNgh0KN+Sx+YHSCEmYvMBhsSIWTH215Nof2NfyoIPmIIXs1pKiYbAJy0KwsaXxN0V7PQ6O6fVXH6h/hjkA7+WR2VfGctGoZlDqkaql9W6QMPe+I8ypFSsTeXENyo663UU6Hhg8AZFdzTQXpOpxwUMGmxfhE3JqqIgltgoXTzyulBqurfA9bwjrbsRhQ5vEVNe6fJJiyo7Pr8G6jqOhieq2msXd8eve7DniTuW6rGm4TsqYP/RHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HAPAhkUijiLzeKPNlqKVaX7VkoRep4OPVqPNY9uEfc=;
 b=HlZ11MRszernyUOHb4gY6egdgPf92B4utfr+4xnRX2u/4xfNpmcHpEsJDy9DDcNgtxewA8M1wXIIzCrxpbz6YxrkIj+JezPWENyl3lgoRSXyFpbH1qz9eLMIRTcrGjfNB37YxI5+cuiAxQ5vP9Ig1gN4KyVCGYt2GU1Rp9xltK6rmb7v+CJuHtbtWy8c6/bpzhIKfynxuXpb4CQh2UoUW7Tb6vmkdcCKrCT/tGYg2nJWGMJ0hd8jHIilTGEwtFdFqpjQSIlwDozNMKphZJtAmlVl1F6xLQepZZXIslgenmHWrDyqtFAOcZ8m7Lx6lLHopXFeN8dc+T3JgZz2Ga6LkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HAPAhkUijiLzeKPNlqKVaX7VkoRep4OPVqPNY9uEfc=;
 b=FdAERy01X/FPQ9eTLbsl+mlasnK4td9K8x8ENlvJ44AXFRTslB+pKAw9CQUWH7Ju4bnkvHs3947NYbTwZC4KPGDLYm8gsrjCbXp9ACwQTkVvekAWLfp20mG0D5ICl76q4sHyf1Tsx/xAPPjZvJAANe+DThUP8Lzhd0J/v9wGh8s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8745.jpnprd01.prod.outlook.com
 (2603:1096:604:151::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Wed, 26 Feb
 2025 01:34:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:34:56 +0000
Message-ID: <87cyf5cwu7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 077/157] ASoC: codec: wm8750: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:34:56 +0000
X-ClientProxiedBy: TYCP286CA0289.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f6846a-add7-4cad-ab77-08dd5605c6d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AYF34Zkg60JwtOTRvE2SbeU8Zs2epojhEMnmZHd40sWiUtuTHq0F52oUd64E?=
 =?us-ascii?Q?YLtLgfruuk7hC7H6/JE9RiMTgibC0G7iYbVQhqMlcdZH51T5gzGN16HO9k48?=
 =?us-ascii?Q?5jIZLkHIiOMdHQrhoo2FwsO9b1ycIoLls9CD7mjpeR5qwrbZ7VswDqLaEZTs?=
 =?us-ascii?Q?xrX67WSnGnJK9k39eJ3qMqXTgeBLCsrbkkxnD97+njRXz15hJotdJn05HR6A?=
 =?us-ascii?Q?rKDtc81XrzONJdUbHE/vsM/Y5seiNXDXumsUqOAwWOlMKjHL3stRy113Vddd?=
 =?us-ascii?Q?JgxiiL2KqrYUeojEXU9+gC23T94BcMvcuKLOTEPLJk7Ed6vurIqIIPnC1yUK?=
 =?us-ascii?Q?JDhbl/SJih2l0AuTLVtWXYdGTvB0Mqz8Lzlz0IJdmtVcgPp8aq6FUOpIzgIy?=
 =?us-ascii?Q?IbmH2VuSVZ0foI8YgwO76UjOWWzOyOfVMAGYPegsa1IDweqDKS7XlAx5zK95?=
 =?us-ascii?Q?Zck7FyDA+OuqsJLD/ylz4cuIwjrkA0umuhaM9bfAL8Ew2XnZlM/5+2AXW+8N?=
 =?us-ascii?Q?l0NDeeqXzrgSU9NYQThCPaZcuAe/q9MCDp+bDEqXh6rN+DOZYWgXy5zdSKzV?=
 =?us-ascii?Q?7uYcC8qzOaCB/T1DO5eKup76YMeOFf+lL+bw/pMcofXY3TNh6hsu+rdnRcc/?=
 =?us-ascii?Q?dicv88tnrhx326jyMxlkCw1pN8JXVdxyZ/jnkpNkDWPl/PbXsSH7KuUAkn2R?=
 =?us-ascii?Q?RCSyvijDJSzuhd8LGAPkN16N9Vd+xa1lcpNQ3Igm0pfxfwawSHP0RtJ/N6BB?=
 =?us-ascii?Q?BavZDbBwmWe4aZesAuC1ewwMom7oGcdgpfadwnDrBMBPL7sW2/ccAzpZULE1?=
 =?us-ascii?Q?8IsXTU4HKsZti7h3/ieFc7ViT9yT31o4ObXg5dPxHRR7ZMYnJ2gBPBYQunQU?=
 =?us-ascii?Q?UOuDcC1BwzELQChex1DZhkEHpJQj/cl/mXEQ6/K8v0wENJ0yR04fFpmYEruK?=
 =?us-ascii?Q?xw/vu+XaMvFPOYZ5VBCPBXPxYTEs5wXTFCAZbAZTK//oZv+cRhe2HFwK13gQ?=
 =?us-ascii?Q?M0i0GEvq9aAjJWuOWsldzFeK6lXGMOZDzg3SaKwRI+Icz8jqi1jgoKeoVoAb?=
 =?us-ascii?Q?Yxr5XpzTdwUAb6tnn1C7zFZKHlIvd1AL2r3H7teYX87v0SHKevG+HPIIZsVc?=
 =?us-ascii?Q?labU9Z6c47ApKtnjfv3/73NmyZa3maT0JbjFplUFugc8I9+NraevoaGybiYn?=
 =?us-ascii?Q?EMQWp2VUCN+WFBGbozpHHJTfGRbRC90DKer8dXy/OcLXld7w42ip20t6Jszi?=
 =?us-ascii?Q?jEuef/mwnClAmqnCfIT9GAAWWdXuRN3c/2uLzc/WOXtC9fez/J8cmCg+MVE2?=
 =?us-ascii?Q?oUAwAOSD9BgdbhSbJorigOERSbRaRDjsTcDZDmu+KTitqi24HX/E6nnvtGTh?=
 =?us-ascii?Q?4z1VXr9vz0nbAtu/4JghQQjQWnO9PWRqfm6IHkSvH3dTLKsAY1bWADG5Fq7c?=
 =?us-ascii?Q?mV0eOEmlI361mGiPsT7/O8PvHkg07lfO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XMDkaAaHjMslfvULYiSzdLkxwNJmx9Kb1d8Pt7mFC7q+frRNba+IBVHOIGz/?=
 =?us-ascii?Q?b7tEVAK954Z3wHzWXLuR+mCcMXbbKK2t3rd8Zeri26uq8o7dD/hVxGh6LqQF?=
 =?us-ascii?Q?BGoo3ErILVEgPu3+R0wGZ9acHGsPGclZaegdr11IZXP3xyakQl8WII7QYJRW?=
 =?us-ascii?Q?mwAyV2odd8Ts1klTW0EfDx7VplaBzgvmQJqjFXbzneGCRlUfY+esZ71GDsjN?=
 =?us-ascii?Q?6mdQ7DYLqM902NgjTebvV5JPo+N/4kig5JDV0TlEeezfjt2H9mSf7T9xi50G?=
 =?us-ascii?Q?50gEHZq+v1NAltYV6/H0eUC7sOEpibYs4+tqStXJx9X1Cq5nI/pwNOwFBFSP?=
 =?us-ascii?Q?ZDfpp/Ow3xpxzhdCNMfvG7U6K/UqF8LOlT3PyzGw2GMwZ0ssRkmgOI1LQlcB?=
 =?us-ascii?Q?bh1R68nJCDOFC7qxB3Y/4d/sG0GWW8vu9iYhI/lEHNWU4Fmn69zMuvl/VAgs?=
 =?us-ascii?Q?WhX+TEVoo9VhMT5nnKpnD47ZMgkJsivGh8dODeat5IuY5cHnlTRxa9jnJxIk?=
 =?us-ascii?Q?KpUSjlxn5ijpylCoiPNBFPVcNHSn483JBeG3eM/rIyvngJE+Oe/OH5zxzjWe?=
 =?us-ascii?Q?yXPm/bkaCRC7RqxlHCjvUGfssUJvnU4innd3zjb8eToKO5B/wL5x0OdIFwe+?=
 =?us-ascii?Q?yJJ3WzGvfQzDNs5TDiVmZ1iOomX3zcFTha0YfEdaCZa7YksSJVw9CFfFWk4C?=
 =?us-ascii?Q?jRGRFkeWft0gsu0Tppi8jfJfwQvdHiNqJQ93o8iXayYdphcBpgFv29XZqUIa?=
 =?us-ascii?Q?07N/E6Sf+VWEl6iq0pGohpYlQwFGzBuz0jweLdfWcqnqX7bM4rTGwWiI1oKe?=
 =?us-ascii?Q?a1aQpxP5W3BX5XWK6oLouKsTfLFoFF1guls/R+/7I/QS1HfmvEmew8urjmc3?=
 =?us-ascii?Q?idNHVR2YEXdqbm6Nxr1GpASuenvfEvadi7+X1tm36gspiAUVqqAc7WRS+Xt5?=
 =?us-ascii?Q?v2Huk8i9GxNKo0fP6ThVdYAup6fClOxvzft8lZhvdZ8Ju51bGT9KcE0XM53o?=
 =?us-ascii?Q?7I33sg4uvhJLWpeWoTPyJlZ0iaPVi+LClLV3mzwdIciv9UtWw09qjFzxNi6c?=
 =?us-ascii?Q?u+KS3AxaeHKUNJFUgayhgEiNHcYLXl8C3xoz66AOejW7J+R3gnJZU3abFfO8?=
 =?us-ascii?Q?q0C1w1mi9SsTcS84p6vH5ozDA7a8Ge7HvDU+Yge4LtXtMMHWx0s76h1MEr5O?=
 =?us-ascii?Q?Udx9qWY6NpJ8oS1DhfyhR2UmmgB1JacSaVMeiUKWQlx5LGz1wsJSCLhBdZhT?=
 =?us-ascii?Q?iU8Zsna4RlJh1l0Ji+I5tzG3C9o7erznCZrBDa4jOBwzs5Bh2AuN3IEJlOCG?=
 =?us-ascii?Q?9Iz9piGSOgKEwbspxYycu07AVa3c/TYwjbqK9DN5GYwuGSKBxLkoVPtg0kNj?=
 =?us-ascii?Q?KXKpSMtYUsOftpAUESm2EPjSLjkOuWYy8DHk7PA/QuRdI764eAuFiaFt6LeJ?=
 =?us-ascii?Q?20rqEHv7awHamOxvHvBCCk3pT9foJBO324/0PxawIpnQWI2ff/HeVwltyPLU?=
 =?us-ascii?Q?shQt2I7JvXO6zpwLo6mfMj6CVaHP3Yv9YbL11sj0pAwLpnGuBTSUHalfT9z2?=
 =?us-ascii?Q?8vVvdSTsiZhqNzBFcuDfC5JXUESBEGoQcYY92t3QjFOZlOR75wD8CL+F1nNM?=
 =?us-ascii?Q?CjDm6ktkAAGR6Dfn4B+7Tjs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f6846a-add7-4cad-ab77-08dd5605c6d5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:34:56.8304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47b7d+A7td65AfXSE16+lLbQBFzrOuSMk0Wk4WiVMwyitkatoDSdfacNgxhz9gZV88zUI7nq6GevXXTwJl1zPZvGRl3mrIlRm9eAxYDmB2SmxGHCUbiCmmrMp28f2cqN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8745

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8750.c b/sound/soc/codecs/wm8750.c
index cae97fa3bcb0..312be0721b5d 100644
--- a/sound/soc/codecs/wm8750.c
+++ b/sound/soc/codecs/wm8750.c
@@ -522,10 +522,10 @@ static int wm8750_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		iface = 0x0040;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

