Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011068.outbound.protection.outlook.com [40.107.74.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5599A78F39
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820301; cv=fail; b=sIcYfx1nYt/nnSNfQaeKL72ivh2j1KGZ8f8nkDyL3DwC9GynpBDIWm3yLBBtPRmDdf7QACBwXOj1ex7jb9Zc41xnRXP7CE9Sq6bBl8+z1hHiWvkcNRAvN3rQA1KN1PbfUCrGuM+6p//GFX4VYbiLvjiiZDHK40yCWjMsSm2u4HU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820301; c=relaxed/simple;
	bh=QOGyWLckrqt1ZBbRRYr5veCJNy0nz/Gj6M0vY3wbET4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VbErfxVW5eQxvkDdzKa/PH5YvV5FOoxyMlMaUMSJqFz9g4pUuS3M5FA/PhTLZLL8uizxkKQEh1ZbU5ylTlTL/KT+Um2UC7Y0uLB+Gw055P9m6YsUDHCUPhFifvBrQM7++DF802neibl6rFdBydPYspOjaUyiArZyFghHeu6IBOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YWY8PBGj; arc=fail smtp.client-ip=40.107.74.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YWY8PBGj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ImRRNteKE0WHaAePIcNjzyhxpuVe5xAzqbh5h5d+sI2IETvWaU3eE1y7/xVvvmCMCVLctU2TEwVeG2OFibWqOM6cnxbPVyJbdQsqMrpjhUkkFR4Bo9cjGy+nrTXD+gOTEe2r1JPmxHSEYBe04SAXs+Jcjhkz74rp3xIi2VvVy7q0oCL0ctQ0YgmWM9VQrQnPqQvj4nJYBWrTX31jKyy3Xbx0fX40Pvm+jZTbfo20nPVLYG7zmYYs/k6XPa65XJ7VjncS/+9NOP+1xeI8vfGdQNBZHJwS/zbRqooX/EoPdg88DKo0XNoldJWpMAECj5bVUdR3+tjOrVqR0tVaGp2j8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIP0Ob9u1j+3ay3OTjdKKd6gQ/9QaXNLTRBkXRb8MBI=;
 b=WqkqITIYkNCsu9GDvaO/OGOHNnXdpk9zxo0IoOTru5xZeUlMbisnpNAD5JX/x5Zl+zAkzwtmDNQxVTLGZDErXalLw+C7anTjWXI2c2f5/IEL/ANqsz/BLf8Jo3ruywgfGACakKyFqbzlNg8MQOTiCCv2GQp1hHoUDyz9wlPe54wPE09hTyFdUWoooZraX4UEFxaWfpg+/dN+OIWYpLMCP6YagIPzGCG3Uch+UVKZCqhBB2Y0ujp+Q1CdaXryTdPEEVXQq//88U8FItZ5bstNaSbxlX6l028GjR95ED92lO5rs+/gRVWhupr7sGkDBT+uOZtkz+F92ASvbahdGiIvuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIP0Ob9u1j+3ay3OTjdKKd6gQ/9QaXNLTRBkXRb8MBI=;
 b=YWY8PBGj/Goy5ABVnxMbx1dfX7L0yASu7LUg749rAGYz5gKRNSpVlI7dabj7fgXUJGCxlF+7/J/81/48FalF2hI2G1DMwWCBqQ6Ut7V67ZzD0B3VM3N3uEm01ZgzPsyQNdZ0rL7lNhmraWOwdPB0SOLc36JTL0tqIBkeL8XiqAI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14299.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:18:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:18:17 +0000
Message-ID: <87seel8lrr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 014/292] ASoC: codecs: 88pm860x: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:18:17 +0000
X-ClientProxiedBy: TYCPR01CA0178.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14299:EE_
X-MS-Office365-Filtering-Correlation-Id: a55629c5-219c-4eb5-81a2-08de20b7cfe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5fabmH/KjfA1F7fq29mJgQtjgxOA1Smv4Qq+cu69XTfTuPcGNwRgUyDmr/s8?=
 =?us-ascii?Q?/Q15xlOqVHjdiTFdQzdBYyBPVD3eYQoFvbksjZgu3+9MEF3JZBVor1Tc3PVa?=
 =?us-ascii?Q?xQ3zO3s9iYPf2UdH0SlLm7eCRDpmPE3xy6nBJ+OaW8gKmWpdA6TSWdrYaIWT?=
 =?us-ascii?Q?DITxeGUFjg1A7SHE3MZE24nmSdfpUwQOuD0lAAN6hMatKGDkPOl/JPhZKSgr?=
 =?us-ascii?Q?8DIOcdflfHz3pE0duRgxkyqVxYDBZB1fHyi8uBkWom6I+cs7bXqaIlFUXKZ2?=
 =?us-ascii?Q?eY5uQqUIeMxnWvQ2pHXgu2vJ+t5OBgAJCZs/YLi+UFFuckz4nj9nWvG5WDvy?=
 =?us-ascii?Q?KlFJRZsg4OwB9pRPoeLRuBSnHSFCoL2LG6tjBJ81RJ6N2Ft6x0VfSfHp0SBY?=
 =?us-ascii?Q?tQrhDis24egd8l2vTfUrQufvKFNL/pm+jS7cq8k76Qii/RFSs95nTy7nrG3Q?=
 =?us-ascii?Q?lPKXm0sBdQJtTk5q+qOWeoJKDhxJ4XPnl2UDw/XRXjxcoLEIxg7YYWd/aB2H?=
 =?us-ascii?Q?lFMGGGkG2tLMsFqMRkG5+taIbE1pIaZOwKoHeFID6J+jwtH2jTvVz9dwVJpF?=
 =?us-ascii?Q?VF8nHMAjpm3QXQxswBg29G4DJIAXJD2qvBiQ6d9KuE3Y9brLrImadF4JF1wl?=
 =?us-ascii?Q?cYsva2hw2+5NvUoz7d92G0Sgtzy03nCRTWdTuvGNfxdjgXFnT59VZw67GetF?=
 =?us-ascii?Q?zMG7ie5fUtvVX27qVGKc223zZy+8r87hgVnw7GSdm9d9b28/CjOXwhiFFccR?=
 =?us-ascii?Q?HQPQz5kFhMPS/zD8GzgmG7RYi2aDv75jqKV7xD6SocwEWNXA7afecmt6OFu1?=
 =?us-ascii?Q?aLHjR7Jq+wi/L7wR5D1Ux197iZGyuNndi3MsSWcS10HGPqLuyTWAcXVKvrpw?=
 =?us-ascii?Q?m0n+6CT1bRhtX0OXWZ954BN/ZEFAHBJdjtrWgnksoTaLydCOHF7X49BgIPIX?=
 =?us-ascii?Q?Bka421onFdcFuBl2ahpIe+v0L+Iy2ZsYIk1VVVZoNO1wYOs8lbwVj3rkHqMk?=
 =?us-ascii?Q?Asbpl4AxgTwJ+MJHVEUeqqIhA5Ds/JorC5D3kUrxTExykauL+47Z39+rdBig?=
 =?us-ascii?Q?LYbaatqutpcKeeDiKYPqPoqRZtPQvydCBm5IYAOGziBoX08Cg4Kr87TrnaT/?=
 =?us-ascii?Q?YEi6tkSZTYpJvDsNJGrTpf70Hm9Bzy+jrvglRrDEhabpFtS+Nk76Oa9jEgM9?=
 =?us-ascii?Q?N3LnUEL9iVOeTb79xCwwaZss7q30IhUEhX0wwtEG+SdC572360wvrONzou3Q?=
 =?us-ascii?Q?JEGvJ6MJsG9AqIEL6EHvcbX/6AnJlg/m3iH55HXthas08BJlM9VBb5mQ/ZSx?=
 =?us-ascii?Q?jKQ7eoDyRKjpIaqFVhsZTFJgRj6HeKz6b+H/XWq3jW3zNWOL5eTg9QIi/KtW?=
 =?us-ascii?Q?yGxLs2Y3dnAL//hgr9+qGxPbrfr8TyC+cTC0DzRDuF0rlNRrevLhC4HJZWZO?=
 =?us-ascii?Q?1CQgj2LTQig5VHxtxOWQfl96OR9MjrYDNNBOiWRVEpIZHwGRMOZeBb9lk6Ks?=
 =?us-ascii?Q?0MD5m9SyVJWqxuFiEwXoJdqdYB9nQ6PTpgUU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+KGXH5FCNk4rQkupHYkXAvpbN69D/WAbCDqD6Jwz36EFPVbWU/qoGc9+IHXL?=
 =?us-ascii?Q?eHwMnfGmexwgF3UfwFncEyZqrYHVWIqevsCc7EounR2GjuzkvI21W4P+KTF6?=
 =?us-ascii?Q?p7Vy2B4JF3fBkKgBOm4I6/BlYR9jgyQMmOJPRwau3BG4gJhkP7FNQcoTjmdd?=
 =?us-ascii?Q?NyCaowiSxPZ1rrH/eHtja96DLKLE7rMOBL7voPyx66x1isa/GpY01okvsN4B?=
 =?us-ascii?Q?ti9hyafZzpss5zv20QvDei/h/WJ3fCSezCOLVc20/j4oqVG+rsA75lGFEEF3?=
 =?us-ascii?Q?Mcun5S5bZBkjO7Zd5HwfSxX6FnAPpk04Io58BUWQOq35tJIJyksCsO0N8xXG?=
 =?us-ascii?Q?UafeqTflVUUxREalxN3mGa6qq+3XHk5CT2XrTDgztlKCLaEvzPhYSO9ztJse?=
 =?us-ascii?Q?LUOKI4fuk4Jn3ukoxEJubju14p9vXfS1cI2C0gI9/0SY4bWMOwHS1YUKCOyF?=
 =?us-ascii?Q?Yer9l3H8EkY3ZokdX2ZwAHOa5NrpmvBk2Um4fF/uGW5IyoigZY5L5JZQ+DQJ?=
 =?us-ascii?Q?qPGo9wp4JNcK4OA2vRHe++C0rafVgzw5raJ/mE9ym7Ec7OfPnCosXUo1v3lj?=
 =?us-ascii?Q?uQswgdlmGJS2jH6EEIxuAZQkkfeQakNluRhp4QHS/V3hl8Dzm0SzlkFKB0ID?=
 =?us-ascii?Q?btsXeOZFu6csaZebmV3AkYOFolKM9zEWFCPi+4p1BvEo0qTQcZp3MHEcNw+1?=
 =?us-ascii?Q?F5Jz2BDSgArn1OfZwwC+lJwJdvkn++oTjmcLp4k52O6e2+Z0LU9cA0Ib4Wte?=
 =?us-ascii?Q?a285xmFt9XrpQ8oUQ3fljiZg/xixnrnDaWQf97Y7ju4VzJtCPuCf8kakNDkO?=
 =?us-ascii?Q?mk+db35iKKeamF2W90pfFXNs8C/lQwjRR53YBNAl1UiJpo1veEpJc144CGTw?=
 =?us-ascii?Q?7eMEFw8Cu9sAOb8Xf/LuSDgRuXBFOGUR1qeA2B2wNdJbJjaPECyekyvCGzSi?=
 =?us-ascii?Q?jt+e39wOXCNOSjt1o4pY+Mx05aiMILXpAZ7LKn0dYLaHPE59ZiMzhjhpZMsp?=
 =?us-ascii?Q?GrzmNYW3VjSFLHJWpz8AssyP8dl/eJk9xHGumo/S3A72Ggj6uhxUPyZVfl6b?=
 =?us-ascii?Q?b0xfBOXuhEYR9718SyYs+9dNKjM7h5vrsN0gJRT6TkiQGfkRpb+JW6F1SRLw?=
 =?us-ascii?Q?bZtpdgOG4xnZRsz0sCZ+qxZIQmYEaiFH/D7aQiSTk31k8QYBQ5PI91S+vshM?=
 =?us-ascii?Q?WxEn8wKrjEwaW/R7oZFdYrZtSfiMa+NxyBfKGu+X0EodX+4/qmTlEudq1jmp?=
 =?us-ascii?Q?RF9EU+xC9Rdrg7Bj5k35K3YJcrGe9Pjd8WeIdNY17l8AhuomAyuCms+HwUVv?=
 =?us-ascii?Q?2FVatILfnFt6QLk5oIDKXRNmtW5EjC2jzLd7LwrxEW3dsH7trSl3tc+rz/iG?=
 =?us-ascii?Q?FDGpnu4NTL+/pjH1GF7RCCs39DkgC9A7qj1ou+aVMOLkO0JHAwCbn1lHxrMO?=
 =?us-ascii?Q?8vdiDanbH7mZ/LJ1LWqON4/4LPVgYOdubJgWS7jXzS/qMccpxqa0kZyWgOfE?=
 =?us-ascii?Q?bWfVHpcZA1OqbCCof1fzf9Kwe5V+mLs2CMB6fm8mc6n6v7LGaqG0dM2RMSfe?=
 =?us-ascii?Q?dAZAz0FsLgi1JCZ0mG/KS8DMj/xNF99OkxVwa1GDyji1fFzPTgLXL/f7z7mZ?=
 =?us-ascii?Q?4TLRriyXD9Sju4DW38SiZc0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55629c5-219c-4eb5-81a2-08de20b7cfe8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:18:17.3816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGlPL/3ga/BEiigijqhFvPn+xPIQeg5/bzExQoQJWnvHX2y8fQCXF4h8Y/edQWLv8QBHjPcdHqXmCqfn991BPPx4b/wjWmiF7/QPHIq8T1KwGwD1cnFT02zWvCsaXdxz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14299

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
 sound/soc/codecs/88pm860x-codec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/88pm860x-codec.c b/sound/soc/codecs/88pm860x-codec.c
index 58e35da2f85e2..b4f5b24cde456 100644
--- a/sound/soc/codecs/88pm860x-codec.c
+++ b/sound/soc/codecs/88pm860x-codec.c
@@ -1106,6 +1106,7 @@ static int pm860x_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct pm860x_priv *pm860x = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int data;
 
 	switch (level) {
@@ -1116,7 +1117,7 @@ static int pm860x_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			/* Enable Audio PLL & Audio section */
 			data = AUDIO_PLL | AUDIO_SECTION_ON;
 			pm860x_reg_write(pm860x->i2c, REG_MISC2, data);
-- 
2.43.0

