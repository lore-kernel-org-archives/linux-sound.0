Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BDA3FE640
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598494; cv=fail; b=YHJvcCTeU8xkgfDj1dLAmRzkZGYP7wEYjg24RO1t6sQ7YpStq/K7CcD5Kycp77k9vVuHOaUgFMcmV6oSa/B4h6SZcBRUtoammPnW49sy1NA0h5UBaNbTnrGqDoQukSmaHLjIHC46QRVTLFLp+MQesH5eGTmauKYS2WMiL5mmpRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598494; c=relaxed/simple;
	bh=fBAWmBed7MhksBySy9qklVNswGZTkF7T/a4bebXNwBQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iJbV32DP/W9vmINQJwzldFv306SaoZMavE1inmptNUJw7U/w+85GvlebwyDhnkDCm353YuEaqhlh0eaX5WY4EwXxxLAwi4ju0fdqE+WZDb6MAtBor8nNhmUmWKRcklJX8AqGcGJwvTihX5CcAY8SarT2TOV4DKQ4L58YAmSJPjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VTQwg+Jx; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VTQwg+Jx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnniuydWxAXYoU1QbXb6IOQg56efAozUuGLkitk04KQJ+uwcWFFD5OHBtWBbX8oM9aWsDKTSN2UaGB9++xEAiY0IXIHmJ/DMekiZK2G3spwRNjmZD1eg2jSg1susknTib0ew9JzzJskl4I/pGUrskdes8WVTivAE15O3gpLO7UdquulvUsP1deOxF+k8gmazx8f9GvIbsrU1l/OZdLwB+rfv4hIRwuPowIGw/4A71RNccFc83OdoQUfgA4TOzziy84USvFbFNmLuitIVQAMlwOH5mp2lgMt0eCMOrAl8gMu8TpEa6PcKoyuWUYSphHCK+LUs0G+XL2YHPmSGqV+AHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6NG/rQx8DgbSryoGAvpK6uGgQCi6A/LDxOIp49KYS0=;
 b=DWVsIn3VMPifUplTOv8Z7cpNMdo8vxHArvlevGglsYysSvqSkuVVfh40Rf544WGGSSCMAyeaHCYruaaavnOnloeS8pi9hOAke48S/B6g5C65v47VTcZfHxgBk/xWzoxRngXw9wTNuLMn31MpF0KIKLq5j0w3JJXzivqUBb1bvo95arL7I3W85vb4AB/pSHs8A8LD1pKUqK8PV3i8ahscqyOyXIFfZxJPjda/9GFOLgl509RPrM7Od3ZMHIaJo/bpvsQjgNkhQDQbplvVQwu7jbQPdrnrpse7tGVtYyfdsH8VqNHL6RuDfdNucdCT2/fZGjE/Wz0oPTRtYbXGp2nK7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6NG/rQx8DgbSryoGAvpK6uGgQCi6A/LDxOIp49KYS0=;
 b=VTQwg+JxCqBVWziGpzzWAp8smSlLCXEXm5ElqG9gW+hmMCJnABzZy/wdx0k2kebadvB6LsdvfsXA2B6cQSINkpJi7810mpdbhiev8htxxhGdsZzsx6tNGAy4ca3QGB+XPJTnvxuPTvyO4tw3fePUdZ5NlWoaeidpYVm1RLhk6kU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS3PR01MB7707.jpnprd01.prod.outlook.com (2603:1096:604:17a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 01:48:02 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:48:02 +0000
Message-ID: <87a4rli04u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: amd: acp-sdw-legacy-mach: use &pdev->dev instead of card->dev
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bjc1i05a.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjc1i05a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:48:02 +0000
X-ClientProxiedBy: TY4P301CA0092.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS3PR01MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 383b8b3c-871b-4549-61c8-08dee6ca19ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|52116014|56012099006|11063799006|10067099003|38350700014|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	rl9EQSxvlFFiv8iAbCs3w7LqFXYqAcfNA0uGQKqmJJMKohPVE5vllyPnQ5yL1cmlu4lA4F6UXqGGophLUSRfYwQap0Y7Ba5l8jtcp5JhrIfH6vdH93kjz9RdVMaYCK1L64zgQ9QpunlM8ID49ExeempdKIyHDz0Wp2hRD4ByQ7wy5Ngy/8XL9n2UbDzfz74Bs3FG2OVKpeDygNV6gJiXQP8XxN3INBn+r+CZ+HMo8dgGZ2T6/pOHuQbKxs3S8QtPp5NhjyXmf1bYt3O9H0I+VUFkeNVn7P3CicjgGyBNBITwq3rVAVAOKdFjf4QBSzlUpXQv4JxUU7aXiY1pDq5pgtScVKfSI25Zb8v/g0aGUOh595Q34vLEFvHXKwGznkKtRwqRVtJbleYxO8p1wEcksMczJ49GI6rk6uY6J2ZWtVHwTrTCd/p4lb4cUzFuolWRtm9UOEbsYuYA1KfWdPyWN22fxh7sINPQ6CviEKmzfvC7kay9erDtIMNXd8Dr0r2VLp+P0tflGHJ+FSLyzAfXzeIYzuuqiQhurpf8AhbFa4/K5LjiF0+V12V1RjpV7XtZfJEE0kS7R5XzbdM28on9yLkmq9ESLdO8D9sjpxdQCm0WN5wTQNawIN6pVPRvknEbBmpcz/FMh4EumiEXNDz4V5ulEKmupo0zky6ghlQE33IlQJ47FgIHBqfxPCfi0SAmJjeLITUt7cAlHdWqBTqQfA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(52116014)(56012099006)(11063799006)(10067099003)(38350700014)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rOlo5fDCY5xAzKABwpKhdY9VQaTfGDONjaOx9EG3FUZRDNOojWRCyUO+BMgF?=
 =?us-ascii?Q?Qo8QYpHa6UPsSNz5bKPMsSUA6qaJcl48vFtqImWTWgZw9/T3Xm7+rDPDby1h?=
 =?us-ascii?Q?4I9Xtvj+X6H5HxswnTq3DvKvEe10s83WpnLUyBMpAqyG6h9pPCz/Yr+2Jbp6?=
 =?us-ascii?Q?7irilPQrLX1jxwt8d+rXsaM3WV9bJdOGugOeYR0P/U8I9Kvwu8s1HRRJOiRV?=
 =?us-ascii?Q?JoSFMemp0jdzPWbHOLceVMJasvifLmTTp4GSaLhbq90EZOF6ADENoKts0WdA?=
 =?us-ascii?Q?2hOI4iZ8SyZdMLig4WRP35BMLYAZ5e9Y/CblcQZUoCjFSKAZJ/C1Ccd6yNdT?=
 =?us-ascii?Q?iEvO84Gm54lWPeNT2MIsUesJzV9IYpalFgJ02fEmdJI1+xV5+7YvvX8wLJxQ?=
 =?us-ascii?Q?hXySExdXt3EeMyTWsl7b9T7L0KVvkWyHgwMpsz/lks3/fT4O9VYm4pXkqDRM?=
 =?us-ascii?Q?hgxAhFD1dR+Vq+OGyZMy8scEwr117gixVyBAcs3BZVrGiLT9C71VppO25MFB?=
 =?us-ascii?Q?wUtN/icwOUvvjEc4C07BK8CJ5qmcTASdOSVSNDl086k02Rtd969+slAAcGUA?=
 =?us-ascii?Q?NqcPT+fr8qYdmYjKt13Lol/Nl3p/UBljajSrP7tA2fKkrOnxda28mu1cC0IZ?=
 =?us-ascii?Q?4nCEc0Wek4mRPX7zRK/fFQ+mgq3zQQUgditt1FVd8FENa/+s6idbc/LEOM8j?=
 =?us-ascii?Q?wpUo22wc7v3/3z0aa+cSVOPWscJNA9HNbzh6X+jf2xo3/ukJdNh+kaAG+ewz?=
 =?us-ascii?Q?GXVb/VZ7VOcDPszA9MBocfPx+7+l02UA+zNvl0lV1cT6KWws+Bex3tcL6jFU?=
 =?us-ascii?Q?453Mj3urQ7vPoM1KBl+3C6BmvjggmmyukYVHvFj1jTXbB6rd/2F6pdHud/v1?=
 =?us-ascii?Q?PCXGVIQsV+M2scr6O2y4PEpWuCLKmZcvnE2Ab20QHdeZRel2SXSiBJEjb/xx?=
 =?us-ascii?Q?Zy20OT3Yz8EFmUsUE9vFFjnaLYWiA0mntsv29doU0asNQQDLdlUtxSVyQ3Br?=
 =?us-ascii?Q?RIyg1gki5AzXjRa/A2NhBL8qCAKPkK9Y/Cb83Gojy5vKpcGh45YhkuWzByd3?=
 =?us-ascii?Q?Bos03I+IWnuFTCwO5+AJeQtzEQ9X2ooaY8we2n6GsE+G7yX1qjTHw/OT1SeG?=
 =?us-ascii?Q?ffSvZrXYjFFnnFP02QcR1KDeKqiDd7YLIzz5Yh+Y5At624BuI3Ib4CxQsbrF?=
 =?us-ascii?Q?ghXZGpo7nNHT1prkQb7gGYnu2L4aQiL5xNhf2YviFCYiE4FjPZfYCKaPe4mm?=
 =?us-ascii?Q?4i54ASW4tsWmFsGtCG84r4Bw/VIEI3ZYN2sF20ZgNo6kv9LZIlAwtEdvSv72?=
 =?us-ascii?Q?OoQZppUwqxssV9rwNrJtit4e1VtLBer5JYR11E+SGGW02vGIKQUA7nR/Hvpa?=
 =?us-ascii?Q?Z0K/ljWRCwMc09OHP7L36/NzfdHmlpE+NqvqPIqGSjgCO0eDmM+Vz019OjRd?=
 =?us-ascii?Q?uZOthDK7z6RAMtQrknmhFVYwFvbXOo6fla3fpubfrUtjYsQoxVyYWAaNR/UF?=
 =?us-ascii?Q?KfKRBHcGw/1Vi8qy/HRCGmvka80Vswe3rfXirehvX66ghSCsrNDFv2TRifvQ?=
 =?us-ascii?Q?jLEQiosWVAha6rIsIRRg7EdHtuKvIhe5Pa5hch4nGALa/udzbfxKF2ASIdcF?=
 =?us-ascii?Q?UhvUORSZ0PpMAlcg7s2MJwDOdaVjJA/FNwFyjLTqFqRr0UFa61HgFxu/IlH2?=
 =?us-ascii?Q?o1Lc5BNFQXyZ3H29Up3p4zMEwVwd9nOb2Kfkx25f/wlRrf6aCgGHSvxndTcd?=
 =?us-ascii?Q?2HAohEk2Efd8o7PALmTCJEvqtbQc2EKc75OFSHADznV86YCm3mhU?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383b8b3c-871b-4549-61c8-08dee6ca19ad
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:48:02.3091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfUllCWY2AbOMFJmyVkU9CusXouREG9lUEzCZyvHVXnsPyyirL0vSaeG6cpUV8g9s0kl6yT1sNXtFqKv2eE08rWaLi5E31Deotg7P+J3i9GZQ+tEnuphSA8qlnLnMIPT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7707

acp-sdw-legacy-mach.c will be updated when Card capsuling.
To makes its review easy, use &pdev->dev instead of card->dev in mc_probe().
There is no diff, because

	static int mc_probe(...)
	{
		...
		card->dev = &pdev->dev;
		...
	}

No functional change, but is preparation for cleanup driver.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 9726a9d33ec6e..3a2034bd382bb 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -521,15 +521,15 @@ static int mc_probe(struct platform_device *pdev)
 	dmi_check_system(soc_sdw_quirk_table);
 
 	if (quirk_override != -1) {
-		dev_info(card->dev, "Overriding quirk 0x%lx => 0x%x\n",
+		dev_info(&pdev->dev, "Overriding quirk 0x%lx => 0x%x\n",
 			 soc_sdw_quirk, quirk_override);
 		soc_sdw_quirk = quirk_override;
 	}
 
-	log_quirks(card->dev);
+	log_quirks(&pdev->dev);
 
 	ctx->mc_quirk = soc_sdw_quirk;
-	dev_dbg(card->dev, "legacy quirk 0x%lx\n", ctx->mc_quirk);
+	dev_dbg(&pdev->dev, "legacy quirk 0x%lx\n", ctx->mc_quirk);
 	/* reset amp_num to ensure amp_num++ starts from 0 in each probe */
 	for (i = 0; i < ctx->codec_info_list_count; i++)
 		codec_info_list[i].amp_num = 0;
@@ -546,12 +546,12 @@ static int mc_probe(struct platform_device *pdev)
 	for (i = 0; i < ctx->codec_info_list_count; i++)
 		amp_num += codec_info_list[i].amp_num;
 
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+	card->components = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 					  " cfg-amp:%d", amp_num);
 	if (!card->components)
 		return -ENOMEM;
 	if (soc_sdw_quirk & ASOC_SDW_ACP_DMIC) {
-		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+		card->components = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 						  "%s mic:acp-dmic cfg-mics:%d",
 						  card->components,
 						  1);
@@ -560,9 +560,9 @@ static int mc_probe(struct platform_device *pdev)
 	}
 
 	/* Register the card */
-	ret = devm_snd_soc_register_card(card->dev, card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		dev_err_probe(card->dev, ret, "snd_soc_register_card failed %d\n", ret);
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed %d\n", ret);
 		asoc_sdw_mc_dailink_exit_loop(card);
 		return ret;
 	}
-- 
2.53.0

