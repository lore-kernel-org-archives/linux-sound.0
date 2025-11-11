Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010067.outbound.protection.outlook.com [52.101.229.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64BB1E3DDB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820972; cv=fail; b=ugHFGTewToPU/GSAOMkEYqgTQZwMaTK1C4it4vHQljM1FYSeKa/TmZ2dEM+EUaqW2UySSLjAiGmbI+x1/mW2VRjvYxdim5hTdMXnvEhboDNfF9EuLmKabLbLE9mRPhtyWORubKjZbM+yvXmHLN8vVBnjgK6b04HrgfJc8T1jhPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820972; c=relaxed/simple;
	bh=liOqvMbA9G+zjR/lS1SI0yaWkXADLFKEwB6GzS0dRQc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oVMtHdWRnXni3dXeZ5ndfwZfqiMTVrC9H2TJvS8ovJBLg7WaWqqSOch/iYnYoxKRzseu1UubB8O3sVDi0IX+0r/oTohLUal5E2CGgIve86h9MuUjKlI5W7MWojawtBbvqcreUfU3cf5CAkxZ8Bt498LQ6a4EAlIkWxGSO5PgP2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Sd5eORcm; arc=fail smtp.client-ip=52.101.229.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Sd5eORcm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlGmOh78GJZFPykEaFGF/7yITFoOzK9sk1xS9CcT5IwD7qohiEJZdb51hEQ8latt2QjjXY8/tcJFb/XFQb3n1Ya53LfPN+5+ybDQOwS/zw3B/YcJK/RK7ddflYENjO/L7T3yEe88EmG9zyICCjEgCITphmibIf0gpjy9axl9Yth8N181DpIGNlbbWRTCMxmupMwnuT3Z+Rd5o5nvXwBpGu6cT8lnSdrFnEd9VrPZaXf+JeB6OOwr3zO6Xhx1cNYMxMGlTH5fH/0guMNQdM9RSJoz9GRFgkNv54jlEeUdUr6AgGG5c8BQFgn8eDCr8J85gbzO/rZn580JF0DIH0Smiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpOtSVqlOE0LnIpeMtju7D8uVs8aEf0VMDZQg+lZpjs=;
 b=F06f0n6U792J+sv+6ErCBiJA0B30Q+vX8YysrtFU+1TFi7gvT41PURMFCFCu3W8QofBZF2FJ2UO+dWOAuSQjhFb6MeloWLtWXx8LLNcJ79rUilOh3o1HV+bsXe9qAUEEhrOg0qJqYxBpl9jEYRjadoPg1LSKhqUjqnYSQIXG4fwRe5gfF20rqqg77AdAieJUNA6x5zlekO+LOm2F1v6KAN/h66NZkSiqvhFpwRyBjrIWSyGgo8hBgS4zOdiWW6lojJY620GEvSJ3yNEl8q4UFm1+F6fpXhtlA1lQhZrsVuyCVp5QENm369ssIzIxZ1owCpgEG0I2YV267Zl3xWev8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpOtSVqlOE0LnIpeMtju7D8uVs8aEf0VMDZQg+lZpjs=;
 b=Sd5eORcmH24apjwm1OjpPW6KXdy8N6BTddwlI/ZcvS5+J3JTpQQ0om9MMTRlg/z870cWR9J6QsbYrVuOktCaVe8CSaLWZc9sZqffeVMQKwE4mmOzQ65mHjeqWw2aB4lQIJ4hW9tiun18kkdQs/8zNdjo9aMOG1kMu2oe57ak64g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:29:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:28 +0000
Message-ID: <87bjl9za1k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 175/292] ASoC: codecs: wm8971: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:28 +0000
X-ClientProxiedBy: TYCP286CA0347.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b37573-821a-4dc4-68d5-08de20b95fc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5k06noLzJM0tdRSI5O+hZxpZEN24c6kkRzNrmNH1mzhhH817X5DJef638Th3?=
 =?us-ascii?Q?pdUmtAIbXJ71NSXogPF61n9qHrdHL1Gb4VSTdTBtMXlGpmoqrwpe4hzn3yDj?=
 =?us-ascii?Q?TOMWDsim0MZhwknaI7YyucxLZNzpsrUVBRTDMRJKrdF/cQg1yhJZgJ6Cqq+D?=
 =?us-ascii?Q?jHi4MkhCIrUBUrl/gzsyHkLY0jQrUvSeS8TpewRWft2o5046LUGdf8ogKnVW?=
 =?us-ascii?Q?ipAzB8j7nRrJLDqOszjMUEPPbYWLTRgXCBjZ+V8ZUEw43DUdSv7Bkb4XAPzo?=
 =?us-ascii?Q?bk15ARusWZBlSZnSNp3fFVZSSxetYMo3JydXBoRUNMsPGrX6wF0x6pvnWvSm?=
 =?us-ascii?Q?12OLomrQwDAKqXe5ZvUkzHFAx5r+NWsm2qFFJVFHctl4NIOPFgJREOFgcC3s?=
 =?us-ascii?Q?p3hOKwMqiLOpUgk1IQpB9hfejGeUSS3Qe3rwnlMFvQ8V0UhwTtsvdLAM1mMQ?=
 =?us-ascii?Q?44a5wdJLTxP+c3xfcpIllGsoDeQs0/lbd1NGL+qMhItNBFkj0LVi60C6pV7r?=
 =?us-ascii?Q?xEs+DdPNWW30o5wWOPP1S1YIL5imtiGfEduJPRi+Sbrs17Xnc4+mFRzRPp/M?=
 =?us-ascii?Q?6VOpWLiboiLq7woYLvjvceX19dL2Ho3ixztNL+bEDThaaZImT6Imk5e3DEPg?=
 =?us-ascii?Q?RHupWRG+EYfDFb4hmp8VWsMegMPZ8Hdrzzn+ay/BMQwi4TdZEd269zQO65El?=
 =?us-ascii?Q?OSVeT6DHh1ZNoixG4gqENz0wI9RnTRyeIGnndDikNE6CvsfKMwpd2wtPyIwa?=
 =?us-ascii?Q?9r/3lEPJN6O5ZgOs+ukqtsmzy7oNeALb/cIILlPEyf36ok+x7jdNMFcNTk9N?=
 =?us-ascii?Q?2FlUgn1ciN7xd2GbxztvQBdQQ4AsYUXb9Ukeh/g1BDIuhU4FYmyWk10yaD96?=
 =?us-ascii?Q?Kx2GNRW2Iokjt/9NG7FuxZJINlr7az1fUkSRgPD9zYcV2sJ/I8Ua9kHFTk6M?=
 =?us-ascii?Q?EzLsFNdCah4YUpvLV8DdwfIzUpMLSi+9oYQluYwcAXEIxfLqwFTswwDDzLfS?=
 =?us-ascii?Q?EcY3AwzAAU/g5APsQ1WIh/ncMC8H9SAvEfXpygTEqHEP7XGQycF077cCQfPw?=
 =?us-ascii?Q?kNnb8GiPxdtabmu9RereubII9g1arpha9TlxVDRuGEJrt+A3aZS3BUoqQ6yS?=
 =?us-ascii?Q?4nJMDq9hp/F/MjnU1Vguf93pWLlWd/2G3Dd7L2Pv0uPvT7t2EUz9GGIMPGt6?=
 =?us-ascii?Q?5Vv9ZXa21gKL/fxnjhQSq8e05kLVpQv0wyH0eW336NMhykovIUK9mWSfySbZ?=
 =?us-ascii?Q?qd8RhHyKHjqm9gcYch2EmhZ/c+AKbpdXqqrypJgGP0CYt+gjHKmLxoJkD6wt?=
 =?us-ascii?Q?DkkcaRWlbUR314zxBBOeM9dJeG+UcEE/az70E3G/YnW30MlSGUCWBuHG3NyO?=
 =?us-ascii?Q?YKFpKGo5wHFsjJWGKwaUa0a4IAjjVu5GMmQOt1C8VYkyGflrriLslQZ9uEx6?=
 =?us-ascii?Q?MIgVkU8Cnzfq7NhYnDTSbKk+xnz7/gVeYLcgjzt4BFWQOLdHy/1YT6oJ7M93?=
 =?us-ascii?Q?EuLM5jTg8gIgofClA+MpQsrKC+cRz9KachPc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hKbSZUvt07Hm5goWHO1c9V+xqekkXYLFA8nmwEoB98JjStOJ3o/cQj2wWXaZ?=
 =?us-ascii?Q?sW2K05QszKxRIRXavrxp6umel6XBFGBzFsDMA9ati+4v7IvZvzGHE3CzS98L?=
 =?us-ascii?Q?OyAlapEpU8rhxObln+ZBIwJ14DxLnNkgWC9fC/N6MmI8lyYe6r64/TudtjkS?=
 =?us-ascii?Q?86Z7yfHaIRAsvbg4/n/6lxfbvB47DxyK8KCKKRRebUWW0DakPYIxR1CCfMb3?=
 =?us-ascii?Q?f5d3GD705HlqCYsx9TLJwtgSyVJrnVHxC5F7xoxGTbTMe6q69OMPPAvozNRI?=
 =?us-ascii?Q?fFwWFgCtlrz1EBYJhiWUVlR6UWK3uiF+8lh8elO1QMAqxMCikcQAE1RiiggR?=
 =?us-ascii?Q?dxr97v3ABYTE3raqZbNotDkHwfNel2PbSxj2hpRw4adluEHimEE1JchBp5s0?=
 =?us-ascii?Q?OamioO20j4QgeUm1ouFAVMW5SwugFY4bqkTdR7AzVimgHnErt3sBgoekOu9p?=
 =?us-ascii?Q?uzM0nhHhFeUyX/bZ6lCFvjStXygRU8gyjJCs+KmhAJ6Jbf5YCuzf39E86Lt8?=
 =?us-ascii?Q?6jENb+d+IkNomnAqHKz/QE0y7FyR9n/VQjFvn4+f7q+MgbxQxVv4xq1n9+H+?=
 =?us-ascii?Q?zk6WHDqklYm4wxu7scJB0Ds0fyC62Kw8LnFksTnAFUNq8Rqgq+H6Fdk+fm99?=
 =?us-ascii?Q?V8t2myFm25TpkYJTRvd4LRcKkGEl1cZVfuxuW9o+uoiMXZ0BuIUZexKuStXy?=
 =?us-ascii?Q?sWoFlYi2L9jN15uAgDXUVY3BnjPHbI1Crjd1dk+sMALW++op695aKZidiaXb?=
 =?us-ascii?Q?nph2c7UKNe5e4IWymFdsBKNGGo7tehK/FvUtfC4viTHtR1YQ6QKFpLsVgkWr?=
 =?us-ascii?Q?Vyk5egTNnne+ydEroCFC5PPkB2cOfPVCGc8LKipa+/N+dgsb3G1Xjk8RpIeo?=
 =?us-ascii?Q?Z0Q5PcggBkTmhcuubZJ+uvTvcd7zBdKRYPS4BfFYgu+Gm7V57PSD7HTJob4a?=
 =?us-ascii?Q?M7WNABGTHkl6OrwfXNOEmmIIsxeoP64TulfsYmmEkMKT6hS2ytHrP3uBPQ+L?=
 =?us-ascii?Q?zO1LXk2eyA8tdjmsP3p3i+yM1lEhE5NoDdUUrkhwd3dELK90G2b1q6h83xFm?=
 =?us-ascii?Q?xYOgDDH0bvZ0k/B3VLOXjtLcK/FJe+piHcNZ4JKzsuNT4nJXRLIKM2UbvCEj?=
 =?us-ascii?Q?riZKf++nh4PwW+d6EcJp0azHCS+xeMIZ1PpbpHs1+oOk0PC2HnXGBtsnOZdW?=
 =?us-ascii?Q?479BRRZD7Z0Sc9cdglTgGiArJKK9WJFtGK4X6Yj0IFUHD6gB8jmw1j5oYWPP?=
 =?us-ascii?Q?qKJs23AqhXTMgtU54CMTpO/S+JkXNfhz9Fgy7RBaCc1JO1yRSNj++BqOmp0u?=
 =?us-ascii?Q?LpK5AGV8bq381kJFi74CzHcHkRXUxFlYXMVRjtX5mvSXl0TIR4ibXKqMw6kh?=
 =?us-ascii?Q?CwhFY3Tv020rNTmSG3TehDozWu1V6oi2YPM8xxwcsjqwk7WdUQOIurfMqnGa?=
 =?us-ascii?Q?xzQ87cHdW7IMrR+EJYGhi3z1v2NDJy+ULuOOEtT6uv51vBiPd8HoUjEO8+4h?=
 =?us-ascii?Q?YHDZ8mJPVJwGzy9Jc8laco3dQErIxz3C2Wdqr2TKqb5gn0j8zahqAy7rLwp4?=
 =?us-ascii?Q?52HRq6A3OSRFwCCtiCntw5kgvNTPGevPzMCvGYVPinGuIz/mHQd14XNFqhPl?=
 =?us-ascii?Q?6xd6vaKMyzgiRNC9B+eGHKg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b37573-821a-4dc4-68d5-08de20b95fc0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:28.2136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YsYr1h7fVh6muxROw28aE7LDK5vPkHOpfBGzg30zCDnueoLmZWqDDmD5EAvLTZjZE8/LGcymAMgmx2xSGAYaVD4jwNpAZIVf/kLzdz1SoIqT27Xurnw6nGNuFLaGlIgM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

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
 sound/soc/codecs/wm8971.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8971.c b/sound/soc/codecs/wm8971.c
index 62dcddeb78b32..46aa556b44fa7 100644
--- a/sound/soc/codecs/wm8971.c
+++ b/sound/soc/codecs/wm8971.c
@@ -561,6 +561,7 @@ static int wm8971_set_bias_level(struct snd_soc_component *component,
 	enum snd_soc_bias_level level)
 {
 	struct wm8971_priv *wm8971 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u16 pwr_reg = snd_soc_component_read(component, WM8971_PWR1) & 0xfe3e;
 
 	switch (level) {
@@ -573,7 +574,7 @@ static int wm8971_set_bias_level(struct snd_soc_component *component,
 		flush_delayed_work(&wm8971->charge_work);
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			snd_soc_component_cache_sync(component);
 			/* charge output caps - set vmid to 5k for quick power up */
 			snd_soc_component_write(component, WM8971_PWR1, pwr_reg | 0x01c0);
-- 
2.43.0

