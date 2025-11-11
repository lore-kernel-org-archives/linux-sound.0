Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010059.outbound.protection.outlook.com [52.101.229.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FD7883F
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820832; cv=fail; b=i/jxQc2c1d0gKrkSJDRaxIm84bX92/aYnxFj7pshQPXS8adfwvxn+5M6wlgfd4zw0bjvrMBIaaaeukFSWzIG69cwZAQPuDKiQqqWYWFJP4KpiN+SsvAnA/V87xrajFQu7T+F2BpprrUPIegwnDFdQfuJYL080/RI4JXXf2Fx28o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820832; c=relaxed/simple;
	bh=jg5Q53QoiVOecXr1KTVwOTzkzh9HB6bq8U3ESRVnD/s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WYd7j6WDbCwO/kWIN3eVAhWqvd0d/1H8oJLb06otsbYVXl9os4XnY3xgYGAEXs6Oh1QHcknu9ATWh29mdeXdoSmolwBEwdRIoAvCAHogOPxmKQYtn+wW5b/Tltc88X+Yq1EfLnegRhSTOMGOk4lyofbTQXiN1qqRaHIpF2ujJBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WzERDr1W; arc=fail smtp.client-ip=52.101.229.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WzERDr1W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAZnOkU+Tf3K2N8R7EuawertF4rg034UxSx3o4k0AX+qF1h7CO5bWSJg6iDKdyxqxN06Rj+yp+Lwfa7DUP5h5l1Puip2C1NahjYHYrvPx1VrwZGqlEXjV4E46xeGYYwybOeejY1Z5B1JKjtKXFlEZkC1NyJ0+X+UEKOKdkPk31m9JCCbMuipyetXUCq0DwJVEE9nOIcB9r17SYjdNQGIGMvy/aX4q7f9aiLworv4P2SyCCIyBW5oShEpAO2He8AUC9K1U9SnzYfnobe/NWBNljGJsp/Hl+rbjnGuX+r4rN/Q/kzY8hmAOIa9PZ6QxuG3vgKk6x7EhxanSxQ1CVeTGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59T0pFq1OFgx8XfpnzZEw4GaVr9kP0AagT1ZIZJn/EQ=;
 b=V9EYKE9AP3x1i4PUdc8PGp/CsVr0yCOz/ISV0yo/l4AdJ3l2sNVl7X5jY5m4aVO9dAge/a/oCALWc9l3W/HMPBRUqr11/tDAoo5iW7juGhx1FtGhNSHSO51NUlN9Mi7cZUeXTyw5PKoYewypnfeeC+WCP8w7Qp0VZfn7tMNYOJZTvKEJwuS2tvKwHS0Im+0gfLXfDaR0m4MSISBX8wlThuJV+yBp/l5f9pI6cYHgVBULlOEaF5kTLEbMBdasQkvWfzgmPmH82uMVWEHlWzxaLoSQg8wB/9LzezptKyOv8O5sHaZfLNbD+JOAR0RniKxrrynjjI5ziGwPhOhmIzLFCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59T0pFq1OFgx8XfpnzZEw4GaVr9kP0AagT1ZIZJn/EQ=;
 b=WzERDr1Wi5Uyv06/wAjOCodu3aiPKoEAjBN390frDsnvuB/DsuCVGleX1LtqRSFkUMb5VyQ0sfsbBowPrtUPAtcPjRjzSkkgO+Hus1oyKIFSoXYB0mNgJn6jhFwJJ74EuuT/NVduUBUc58owRlO1EOeFsARnkgRFhlzBTU4kdjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13460.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:27:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:27:07 +0000
Message-ID: <87pl9p1kit.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 140/292] ASoC: codecs: tlv320aic32x4: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:27:06 +0000
X-ClientProxiedBy: TY4PR01CA0076.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13460:EE_
X-MS-Office365-Filtering-Correlation-Id: d83a5afc-913b-414d-fa45-08de20b90ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LeLBtlAlUyCHQ69TmIeu26VglhlucZtGi/hSvkbdGrNwY+muM6WW9UrDlHAf?=
 =?us-ascii?Q?RJoJAgLSoKR3svF095nxLX7llD3yax5dXqLj3PBLAaSujQh979WeoyR5Tpb4?=
 =?us-ascii?Q?yrptf19umrNQ5jmRrdReuONfTQ9OgZXI4wvwUQUR5rafqe5kBxr63mCCmZ/T?=
 =?us-ascii?Q?mNXvCcH2NEfut5wgIMtFF76L54JXkRURUP8KX0DlUkaCPFT+A1nVS1I6ra5a?=
 =?us-ascii?Q?Ga4xU1SEnd6OCJC1MrS/1nJPTXr6iwp0IBZ02D/SCwyTA0Nqw3MGyQ9bvJoh?=
 =?us-ascii?Q?EthsHIsRykaQm80ApXcgSsl5gIrhHFVUAbS2+O5ZLGCxnRbHIbB6raKmTqnY?=
 =?us-ascii?Q?Jw38nOQaxt4cQdFdcMOyMbAKp6LBKyH4HmMKUVRmUj5zBxohI+M0UpYn9mQ8?=
 =?us-ascii?Q?mjBof3JgHZr0pJBqQy+l1JU2m90lKLHda762v8CMD4TG9oipLVBV9YMBz68y?=
 =?us-ascii?Q?ZdipbO1cNj8Bw2eJ7UtipiZFD3meFY/C75pYYFHgVd/HF6fAVYJMltXyn8Sh?=
 =?us-ascii?Q?b+PNzdNLDmf/CyYJUyqiOO0R4ewIEUimFtcEQa5KVLCzJr1HM4Fe50ygel0K?=
 =?us-ascii?Q?9Ih6zJcn6q9v7LdG5h2dlDRgOTcUEtTP2rdTqIPecphHL7M31qgqK0phCTSR?=
 =?us-ascii?Q?3XCR5nrQH+O0LSkO59yHDzRLVSCgFeFfr/9CLZZ6pRztLDL68DgotO7PrsES?=
 =?us-ascii?Q?K37BF7lHAfVNU8E81LzX7OcpUTNC+MeNsGI913XJKnYokcENpWuVnXGxwp/d?=
 =?us-ascii?Q?HxBuLQWuHIU25cVdPzFginAZDirhmqRAuoDQ+VxpOjsXghl1gztWo3sHQY0T?=
 =?us-ascii?Q?LmUFDzd6ZSJ+a4BFVxsIg/HzbDuM9bflB2v5mhwOZUkOBhUmn3veMzaj3rHS?=
 =?us-ascii?Q?5wiTO15ioGQCHUvMwHmn16i1UsycBxwp34C7A0zlUGzxUlIl48v9QH9m3k8z?=
 =?us-ascii?Q?QHE9ycwSEnCCxm1lGufwb3s3f7kA30ipTPbxzViObbmPytO0rRbQamyIJp5G?=
 =?us-ascii?Q?hxtoN69CS4xzI0krfnEMw26nFqT0ijWgYVw6cwWYG1buL4bKCnzq4pmEMcYv?=
 =?us-ascii?Q?6zVRU9bqK8RrBxQOFErqJdrZRerl7LXOy4lGXmuLhLf8nvOi+6Pcy3Xcza8u?=
 =?us-ascii?Q?inoB8USDBf6MQs4RafxQrqzmGzKcGOmgtvHNsl3o2R7LOOhSRYHysHb3MZ9s?=
 =?us-ascii?Q?9u22rSq3eJdIwSDlSjdERz9FHpf81FhrL6A+3xPdLLpxLddBrdt2gnW8/snR?=
 =?us-ascii?Q?nejgeY3sH4wSqC2yrWYs3WjZ2bXnJ3vjwu8cTOOGA0xysKsuq9zDVigqLVMo?=
 =?us-ascii?Q?sAgO0j8ZSMSK9cJFlc9heF3R9ktSrzu/dkwZJZzEZDT3sFqcj2CcUULTVaXF?=
 =?us-ascii?Q?+982p1dPgq7bxZYYMJ0x+NzNEHA6nU+YVQADfPk43T/AoX6Xb95lHeFhwozL?=
 =?us-ascii?Q?g5LCMsl9N5HM2QyOmu/GJcwn5rc8tcswEJi7fDgVjF7iqqmX+hhUm11jIkaL?=
 =?us-ascii?Q?AKhoPDXyixGXmYrEaUNqgOyehKdbY4/nVs9h?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NGLhdKQwsVjKBb7T45bCDxiVkQBbY9BkkdPNVxVPNPp/2TU0Ub4oWxyzzG1b?=
 =?us-ascii?Q?p7oaQL5MenaGI+9MgycT2A9jrx92XIdVGM4N9iIn3YUXISEsTLCeAhhos43p?=
 =?us-ascii?Q?KY+598kay0kmpQfBw8bl4dnL/z76Rm5uBFB9FmvhCLlkWgmlXa/Zo3zQiql8?=
 =?us-ascii?Q?L/1K+kqUG3CIpTSr665ldExmo/VS3/rcezOj0gd1gzSjT4+8jre4YrgRjh0m?=
 =?us-ascii?Q?tnNglQuu4k3gS6QmF5dGdRrkFpkDAmbWC2kC6jYggbRecLC+5y1Cc7RYNiqK?=
 =?us-ascii?Q?Lx4jU+hwcDcXIcXI6VIXJewmb4djJ83l1ZpJaFQrw0196l4A8eTdtz0yvKdG?=
 =?us-ascii?Q?e6dZ0w/55Bg41yICGw+ur69uMdf5+BdQVPKAZ+ox4xAacRnUiRMEOqut/8S4?=
 =?us-ascii?Q?pTNTV6VSUJTzNpQv/LHISb7Zb0uZLqgguWBNajDAVqVu8wHZWNGrdcctoQAq?=
 =?us-ascii?Q?3ITDGyVHrLYSDho9l4KfE9kSoF8XAAfm/YjHNhtTFUCaGEUMisMG7LFAiYVp?=
 =?us-ascii?Q?qu06DTc6mY9YdboyEpSbmJuQFbc8wVs9dKLXSO5oc47u155HoD5+XBe7ACM5?=
 =?us-ascii?Q?ir0VnG7yLsAh3SO92SdJUl3Xkj+gODeynp7bgosNWN9S08jF32F7T5A16CSu?=
 =?us-ascii?Q?ihBY3QCpthWgYtz2NDbqiixGMl+DHp98QhfyrNq5okmykjd/xnrFtCfwxlsv?=
 =?us-ascii?Q?WG1yyMot6a2w+FEJtQoBLjQ1DZFjpSsM1/HgA7Zv96YhjboDmcrmk7SnuE+m?=
 =?us-ascii?Q?OU8mHpnqhVjr1fqHb1htZfItdohkasQpHP90A9TFLMr0EY2C/FW4nflktTEX?=
 =?us-ascii?Q?fb2JWY/jeBuj+OPgT6ZG0jSIWYre/Yhi+T493/ELsGlxPNt18X4vf7woqzL6?=
 =?us-ascii?Q?YFTnZPnLDoeExNyiwiz/i7wcbDbHkHsoAu1JxS27XMqosMsazwpPSiR3vYBh?=
 =?us-ascii?Q?QtNBVYg9lk6KasRRKc0wxHWSCLvx/GHU/KueTLesP13miBF2H0ZyEa45bMjE?=
 =?us-ascii?Q?1XcgHo/y0zZd/nNp75YbRVApEefIkOQna1i3tY3TpTwh2Bb8mr9K0M4M92ky?=
 =?us-ascii?Q?lqsQyfMCDe4lcyV8i0PSuE+hmMLqo3fJaqxvOCQ4zUpRF3qyUWbvGkTcRYNL?=
 =?us-ascii?Q?GH4wbpi3SQPJfV4vhBcL6UI7l6Fhr4abhE+hh2HZlg2EuANZv662VQ3HIS6a?=
 =?us-ascii?Q?K9/9aMOmZ730Ec6DDCqoL4Yu5tYPSubgp/VxUqQ7SkdzK/za0lrtpjJck34X?=
 =?us-ascii?Q?Uz9e53vbYF4GCn+gB1S+g1Cz4LIDjKtRj3UK/x9i7SV15sSVlQrl/euEqTas?=
 =?us-ascii?Q?C2t7fajCWsaSeqYz+2E2Qlv18yDOfxHxHbbjcvy3p+SIS5Iw8klsYsWWWXrs?=
 =?us-ascii?Q?7Rcts99QrxjsqwDpyoAXOIBAxfifBte3X9J3yXjVM+rbiDd20yuBJu7ujzJj?=
 =?us-ascii?Q?nwlx93EOP1n6Jvb3LK4zCqH5/sY4lgRs43HKhUaegozYRvDMIC3BpFh4AyEa?=
 =?us-ascii?Q?oRDX+CYuh3mFGTnFbjB0v0QmCXahG38wpa62TUL/7l2ssFsLatKd7hidgftO?=
 =?us-ascii?Q?RFi66aU4PqUtJ+jdrnuklcDUvcKLHFavlKMstXwrHNyIqg6tmejU429Jyk+v?=
 =?us-ascii?Q?5t3zTKEP5fW5po8sZ3mEpy0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d83a5afc-913b-414d-fa45-08de20b90ba8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:27:07.0754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roQfcUj91apQ24a/6VZ8EFm34p8WV9FooE6HJEL6kSGTreq2WL2sPokEKhyLV2DWx55oFdYf8RlXNLa8bVCpxp9t72K51Kxm6cf4KWgYlrX/9hjPTHJ/ZBkkqxdFoOGd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13460

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 715a07ab97b9f..d850945572151 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -883,6 +883,7 @@ static int aic32x4_mute(struct snd_soc_dai *dai, int mute, int direction)
 static int aic32x4_set_bias_level(struct snd_soc_component *component,
 				  enum snd_soc_bias_level level)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	static struct clk_bulk_data clocks[] = {
@@ -907,7 +908,7 @@ static int aic32x4_set_bias_level(struct snd_soc_component *component,
 		break;
 	case SND_SOC_BIAS_STANDBY:
 		/* Initial cold start */
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 			break;
 
 		clk_bulk_disable_unprepare(ARRAY_SIZE(clocks), clocks);
-- 
2.43.0

