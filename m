Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3288A244698
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821423; cv=fail; b=PogdOp0qD81JovoK3du+8uSmSSO/cyiIGTVxl+OHJ1hNywrA441gMhHEyuXIX0F0NRlAV79vDKCzb8jrV+iSAVM0Iu2jKmk5TxNWssDAjaFy87BKzSrYv4DSVhH+HJ1gtQI8oFAm+f802W4KAF+J4oHjb4vDDjs369cFWBJvolU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821423; c=relaxed/simple;
	bh=W6VV+A4nWmd4KyFBm2i3b/eG+ZQY9M0xeav0VcHuy3o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=s1eWuBX9uW9gxLm07mPzzvRVlGmGK6kCA2SkDxsqaa9fxnlcJ2/ZCTbtOAtkS7E4zuo8o0B45SMT3IgLw7pw30UOvwQJs7pSuntnICYUz8vAqjkbt1g1u8uQCOxqvaSzrqJbbYFP/ds6/t5v4WcCKhjPL+e6pYh5arEj2/BWqGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CkvpLAjt; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CkvpLAjt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHnc7vGi+a+H9uTpFCOhGFvzau8/ltYnOhxKeCDiaFMZ3AhvuIjs3t43Zb/g3QjJAghJqYxbiPNVo+ZeJXD8jPCQir5i0cnA5GnGEfhiQbM6a5Ek6UGPVjl9bkI38eUG6InohZ00F+MAm/jlraamc6GDP5Cwlql3PwDKw5EJTF16zx6WRkvpLyASF6yxqM85EX1FiAkJMaluE07oEpEYvgPShvMbA71NJKqfsPViRv+S+zUJiUZuFW+Ycp72aE3kmzbHhE6nINhS2iMM5qIMjHVmI3yyiP7b/R1/0Y5tPo0H2vQCKcQsC9cg8J2Ryts11HO0OiKC2Sco7/CfTV0Lfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgwY49p6E9x3gKX9Ah6ngDACHqQkY9aQq70G5ECqqQo=;
 b=CmZAmzHiqLBGOzG0TSe0CFVdeEY8o1GLaYv5rkyBH7VjGRPwuEEheOVOToU0AoWZZHR5e65lbCFrd6MyzEFb3k1rka97WucnvHKpiXL7T7dgw7zaoeX5VaJ209cqd5D8m3kMMQtAN0tc2iah3qtQ5bPgwuXE/WTPt7hRlmsf31e3hZ4h3VMC4fImFIcdAbfxQ9jkya0Ff97Dg3fApQ7KYSAjjxAZGjsT4MoK80/HGVBtT+S7T6MRdbo4ZGSX8d0L25pKx2pkSk+m2C0XY97k74tSPj8peirIx744WPzzZjhkIPflhvMlYJd0RqztIOeYpgbXiZeKfaq4wezqam9Zow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgwY49p6E9x3gKX9Ah6ngDACHqQkY9aQq70G5ECqqQo=;
 b=CkvpLAjtgUUZDX3s+jbEUut5varMhhVVyb/2mH7WuUyEqFz3eiVqpM8GbvEMDBRtYS/u8Yauz6/xJVnp+EELfzWRknI0NnR89XABwSefXUEg0r3RhomlSOVm8fsEUusFivWgKvS7+Ttk1VxFmsLBXQQeukgHDNWEOalL+WT+/N4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB16378.jpnprd01.prod.outlook.com
 (2603:1096:604:342::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.10; Tue, 11 Nov
 2025 00:36:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:36:55 +0000
Message-ID: <87zf8ts8ux.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 283/292] ASoC: tegra: tegra_wm8903: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:36:54 +0000
X-ClientProxiedBy: TYWPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB16378:EE_
X-MS-Office365-Filtering-Correlation-Id: f93bf36f-cc35-43f5-c467-08de20ba6a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YMJWgjBmW1TZm2YYvLVRqVFfhZFU4C+pRiHwrUswTTZWN+N30MYrwPFHFglo?=
 =?us-ascii?Q?MrRT/KbVz2HOkLpfPbQvzT4BFRaQIjz102487TI+zjcbty3pgWQCsu+2ElmI?=
 =?us-ascii?Q?4levxA+db1WwjmGfGarRaaNqyQjsyTazU8RZVpo1dNnZa0qx18aV7te6e0vw?=
 =?us-ascii?Q?gj+UWB+DimxLDNjQyhzXgmgY/QJaaC5BOqStrV+r7oDULmiYB1Aj9IdaS+ML?=
 =?us-ascii?Q?ZY8Y3H76hwGNq/pFikZsE0Px/gA8+60P7xqcqPgVBVnihxFomzPRlgh/itp1?=
 =?us-ascii?Q?cqq/ExSLQ45rRfkWECb9/P200XJS+mPeH6FguU/ZaIOlueJnNX0q2EaJRZ/A?=
 =?us-ascii?Q?EyFbSZtcMeqzar9wJ92/N6rRNG4YMu/CNz624KAybQsQY0j7pmLVS7b8ouZW?=
 =?us-ascii?Q?5QeVd6ZmN2Q914KALE0cbPTB132UMGkyOr8qI2bUU/1H9oZ660gNP3m2lmYT?=
 =?us-ascii?Q?JAWWjYYUUV8cqMcw13Gd2O5YExdXTBIkViVVHmSNY7OmeAX+dAvMwMtOWoeO?=
 =?us-ascii?Q?dF7u93aifTb+kRXni6fHIt9N7oQHkeuu4vLRvF5QvkIvA8JldZ6FZRYH05kb?=
 =?us-ascii?Q?c+DoCTma0trP7UL2g2i23wGM71W03yhUCPvC1PbB7FTUn2jy/20yRhFH1Tta?=
 =?us-ascii?Q?1mlXa3oN7dS8mvgjOr7Vfe+eiOB+jjf78yeRgrHzXNWGuLO6KJRTf4WsO9HH?=
 =?us-ascii?Q?H1QrMVgrc/JTguc5pgh2XyLcEaX2uFr+PmdteTYTR5ZsuqwVQUCLQ7U9R4Mg?=
 =?us-ascii?Q?/AW5QwAvBaaTcWzakz57nl+U5vk+Nf7hASPVycoSgq+DAbV/BT2OajDOPw5A?=
 =?us-ascii?Q?U2K1i1akM1SU49rx90HsGTErmktPxXypO5iYTMc76NxI/EONHftVrT4/ikws?=
 =?us-ascii?Q?QduEzzNgzMsXvvWaHoY1qQaGcuCJJCob6mHBxGlYII/lBpO7vGDB2lD6DXXx?=
 =?us-ascii?Q?BxxzGZR8VJ7Jbm7rbDfsY02sUgmx3vJZDeiNfuprCMXsHBDpJxasiGWCNiQU?=
 =?us-ascii?Q?o2iorrU+I8jWqTnqd55inj6IwqTx1EenPtxXA+e4wwTUmwfiG8JPrsVHKpvu?=
 =?us-ascii?Q?lsvU+67nwzkXyZRG3yspKCW+/caM+X5blS3i6Ovo30sXbY3GCYD88RP7gCUb?=
 =?us-ascii?Q?gyYJyLP2tvb0gf3E2NLvzkmCAP9TdD9JItOxCxt3iZFCr7W6YRj0B9/tRKCI?=
 =?us-ascii?Q?wzJ4D9XDj61Xu0FjHj1USH2DyeJIh1WEVCUVLzU1LpvHmgQMFGLlDL7JkA7D?=
 =?us-ascii?Q?iLp5HAMg7LEcv84BumMm3hUX+6vjNSLteX+FxiXcyLXZwt4LJdNsMRkdSWBm?=
 =?us-ascii?Q?IkQF8+KMdmK5JtEEyojOPpivcQvtRZ3Gy0ZyF9WGlsjS/opYusIF75GCRTwV?=
 =?us-ascii?Q?gx8uFzt6OxPuun1HEBr8N2zuGbUqF+/5U9NsC2KFMg22UJzTYlqZ3V14ftKS?=
 =?us-ascii?Q?2zTdtb4XVo9X1ll6kjWcDlEXCpCWSnJ34pcSDfse0Ywi1m0Rvyg3neDF5u1F?=
 =?us-ascii?Q?ymSnSRN7Y/+ShaJCjEO22P6Y7Fn+wCGGih10?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xYIbOWHdKG+6qtz2uQ8t/s5GBPDR8n1LGQz0752C/vLEsxqBsdZxNe/jQinM?=
 =?us-ascii?Q?TS4ua8/T2oqbv7RkCOAdlfrj+Mse1jc9t8LI5MM9+1Z4uQ3O7L3Yc5qYNEgx?=
 =?us-ascii?Q?tFWL6kTMIeuCeaAMWvThleYjuHW1scjeY+OWbTE/jwMerf/UCTBkZtUvqEHi?=
 =?us-ascii?Q?FcojDy2Ib/uH9eO/gZWaf6t2m91AcVLgycB1aAkT/vQCWdIDnTmQHwpKWNQu?=
 =?us-ascii?Q?8i5X4yQhGcJYx72e8GPnmVvLlFhpjCsPZEt5ug0oVWTxsVgCZrzfCf8CmokL?=
 =?us-ascii?Q?PFdYkuaZVo35P66OKT5BC9R/86h0UTY/Uup1qfDdPPzvn7lD6chV+qXbdmcR?=
 =?us-ascii?Q?x+3HxoOe1xAdIo8AI5YPYQe2XQg4Ff7dC4RUrN+NztRcwnAATbpdZ874BVEK?=
 =?us-ascii?Q?oJ/53LXadg/7K3BQAzlYHNFpgc9Q5acurOD9e82c8tzJR583XlwZgj8CxyAF?=
 =?us-ascii?Q?QR9gcN2JEnhfgLirhdgDvZie8PkMlDVSpAdZKlkOPRF9sPutK14vDj9P5QQo?=
 =?us-ascii?Q?nSmS4zXMiih8P97NdB/Pfph5rgw8LeTHQj8sg5hdwJ4ik0ZIPeVv6Jl3Vsm1?=
 =?us-ascii?Q?qGlx9yk5wex5hz7Hh3UWEbmqhiaMXT3Rayf6xXUmF67XoAWM5oqNi88Saahe?=
 =?us-ascii?Q?HtkgrKtV16VZdUqaUzEoqlm5/wP2z8OGC8AnTk9WDP+5s8ZIDcygfcECIW4z?=
 =?us-ascii?Q?Bp4IbHcTaSDd4t9Uto7+IEkUVxL062MpZkihyX7OXtp3M8T1dEnJHCX1pRRh?=
 =?us-ascii?Q?gfCrcTrpirIKjpOF8lcuoxHEA9EPZQgpkXpvs45sh2ccebHPOQKoyNRyggXT?=
 =?us-ascii?Q?wbAXzQVO9INRNuqpPjqH7oQxNZG2jQa0TQmt7iy/q6rvHC04qTdEqdWL1DbS?=
 =?us-ascii?Q?0/6ZXac3lUSA8oZz42uKySNzstKTGjx/Q7RiCsDzD8bkZIj1Y0WgzqB81RGj?=
 =?us-ascii?Q?bkReov95HruU8j58Emhvn80EwxOGKp5bnHKFj4hNTZRJdtBPcHjlESkTUUUB?=
 =?us-ascii?Q?RNZXgttDu1WPiA8n5uPl0GJoDpnEmjl3qbb8gqv2OR3P5C4Le7tKwTM0IuKv?=
 =?us-ascii?Q?Ig0XHphEu0d2d2rGBM23H04B9B4e9EpDPVXOza1IC3xTt3VnVb2LWyyXkZvD?=
 =?us-ascii?Q?ZNtgDbF9hxnvuLJFuvj5XEMdGb4TtjY9hGNBu/dfdMvE0sWoN8PubHCbimO+?=
 =?us-ascii?Q?b0BKt0GEwOwIySF9oYBjuhIkZI3N21d+vqtCLIvJAmgLCmLe3eJ6P1kXnqqt?=
 =?us-ascii?Q?SUdtCHkOZSliZmoUHZXNlB7310BrIZUfyiiLk+3+NrTT+BgXtvTHKPg7O0Nl?=
 =?us-ascii?Q?JvfH6vAOHd+BGZBlKbDrz0J9EK1JsEgKuQjZE3BE36s9BjknEncBblyjgeIa?=
 =?us-ascii?Q?ZF5aV46WTs6A8mMOUhrES4JohwdBOSwpi79iQhi0nt/sd9aLVLiiN2u6vLDZ?=
 =?us-ascii?Q?7u7qxqjY82/WhJqbUPJ0rdKvCbm25X266g1zOr7dO3c6YoAe5Nima1oyMBwo?=
 =?us-ascii?Q?gxT6JlfEAtp2CRao+PT+e1R8mPTtH3THrPYfEwWK87JboAOVJSKpGkQnS8z5?=
 =?us-ascii?Q?LY1+5de3OKcpHhQZhac8HP/7r+vQ7pndxSAlS26EqqifVXoj8CQTIa21VaWX?=
 =?us-ascii?Q?o7oGg+rb/rrxvRvaAwxsSK0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f93bf36f-cc35-43f5-c467-08de20ba6a0e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:36:54.9659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00A7nnY81pop8PlwNol/ZpsZKI4qo3N6q4jVHexsfuc5NVLL9FZAx15XiCYQwKY0NJ2QxplMC1ik1tqLfEmBBNeyaZrymjKm4aY+NqzKrooIaIFcTWvPRmlOYZJYz+R+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16378

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
 sound/soc/tegra/tegra_wm8903.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 78b02c64d95c4..91180f4cfe178 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -56,6 +56,7 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct tegra_machine *machine = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int err;
 
 	/*
@@ -96,7 +97,7 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 				  SND_JACK_MICROPHONE, shrt);
 	}
 
-	snd_soc_dapm_force_enable_pin(&card->dapm, "MICBIAS");
+	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
 
 	return 0;
 }
-- 
2.43.0

