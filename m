Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010032.outbound.protection.outlook.com [52.101.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14AF1A0BE0
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820617; cv=fail; b=B+FNtkhBDcHkbA2QEs8LqRvsgShEP5zyAqou2ptkkEPWf41siEa+de9pVdJ1lop2JVs8fFdwEl7Nt5C4zaaxUE4y4uovdaz/7eVkyKhrRlNZboC0BacsoPEPYewN9TyaxoS0mQVfNmphO5W0H1/spg7QPCO4b/zk5qB9ktTd1us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820617; c=relaxed/simple;
	bh=besKLchu4B7Fj1Cd77fmZ0jjXGtWHvUIQmbjiv5vg34=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OFSph3wVPCByVFH3jB7wo209c0Kt5q/kCvDoKoeOp7juKJc00Hk8iej1aLq91uPa1mPDMJKwnfkHkYCGD9YwEQN67I2yey5yK7rFB1eJ3OqXaPpofT5ORFi2wi2pu59KNU8Tf20+U3PNIWjiQE1WpK5Bpdc5J/lm6hUHsKWDmVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DrNiOoCE; arc=fail smtp.client-ip=52.101.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DrNiOoCE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiAwrEBDC0GPdJA0gLH3XkOS73SFePhtefFULEOCuu2niIct6txd4r50MCeVFqh7UvVAtPgVIEC2CAxcUsOlbcn7LhVA8YRT7pSPCU/Px3YmuuZoM/6X2FHHdFgqTfUMqlRR09SC2f9ZBgGyaGFH1DW29on4jFiw9+rHvCwc15aUpotGr23HQ90i/oVt3zdkBk4eHUsfVRx99js3AL6jcTSNoxj5gKhk5U9kqnfPJA7unXvkFuVPTy3+aTkNfPKw76p9cvzAXdZ+jnazjcvp1FCbLynKZOA8pFgzf0Yk1oeHOksAVne8a4YGWRikw5ULPDE/viVb68NxkmVs9uH+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H97F5RYXoI30MQpqVaB/n4W1bNMDb35O4ZYS0dK6kaU=;
 b=e0QYtGmscTBC54/6QFvs868Alw7I7WjGz5+TovQr5De0/tuiRL64a3rF6VmsbXjHgGWZF+3cbixj8YsBV1R6+5rRMSFS5BEaurB8SH4ifex376SJpagwKF0AfpZQq0uOL8VbLfyQ8ADqg/kV6cnY6BRvb40fBI9EFm4HzN0fdzqvOSjyQ96CgEVpWAvGjqyQpGBq3CcK4VKQsKEpNv23L/5LggtRkDu8VEYtySck2qAXGimfYXZthU02WaMinAs7ShKkHfmU/LcqS28uCIg9Dy4R5mF2j7VQtq9u4FQbPgGWAGAZBJOvI3vhv8Ui8gCgNDpjvfTRE04u5s761kJaVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H97F5RYXoI30MQpqVaB/n4W1bNMDb35O4ZYS0dK6kaU=;
 b=DrNiOoCEWgIQdKOPfxAmHYoYjJzxC4KGTH+u/prZ2m4ySrF6JAvhpAstjwWZpnTnmqxJL4zg8B2ifGJg/VOVaAxcBcBiNaNNDfc1NVOVvAXKUo3495l2OaB53FCUY5b3ua9lL/YQ9UIi9etM+w+gaDu5BuoPd0cWm8XhIYq0LUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16404.jpnprd01.prod.outlook.com
 (2603:1096:604:2be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:23:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:23:33 +0000
Message-ID: <87y0od4dtm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 084/292] ASoC: codecs: max98396: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:23:33 +0000
X-ClientProxiedBy: TY4P286CA0091.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16404:EE_
X-MS-Office365-Filtering-Correlation-Id: 874e0c51-3117-469f-2166-08de20b88c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9eXlKAaEJoe2HyDxmC9C96IlfxUv65sqHQlRcwllTMyBgVS6LNQoEowOSu5H?=
 =?us-ascii?Q?T2rio18yKJIX/a1dp+ITCvQhTN5ifT8IvT1sKUiP0AEsoUZ5UpSqFTMw55e2?=
 =?us-ascii?Q?hBF4JLwAwdjcSUXfwZ97xzjRgSgur9ttIVSiSUa5dx51fqc9CYzxqr5XcaKW?=
 =?us-ascii?Q?OxSx7xH4QwSx99xtryRbB5T9syufGQe/nu+ovqt7Bmf0y1fS1bemQzrCk4XK?=
 =?us-ascii?Q?yTqnIv3GUkiF/xR2VO7h0HhY+de0eE/r/4rj7uk8lUp89p+uAShwq0Ek9ntB?=
 =?us-ascii?Q?2MdzTtfcRzTzbvMbQuetsCRDNvZB5cKlHkAOAHIRu+zThqqvVbxydKHNw7zo?=
 =?us-ascii?Q?CymTy6kbljgLQNiOaGCQ/tnfFzDx528LP/IhXCM8VNhsFX999uAUvrysv76b?=
 =?us-ascii?Q?HzwjYGeNi/i5mkGVD9/rX38KlnKKP5JpsBOv4xjN0WR+l6d90NMtvgPjRMKf?=
 =?us-ascii?Q?EHE67hI95lqw7U1U5fWXfHO1TydsKPytxdeLYBEh11cJ2uVPalYyVKK8dD1W?=
 =?us-ascii?Q?3ez3yzyd1fKxRQ67zRXAbdWChsSLaFNRuDodsdBCFKMnBz163booVpgFvk+n?=
 =?us-ascii?Q?fI3HsbQRVKF6B3+d9VlDONmSzoEv/tOmOG1PZs2XCbqmajOLR+AJKR/CypIB?=
 =?us-ascii?Q?IQGyXXj/tVGJTtIXxiixAFY8SEJrm9i0FBEpvFb4zpe1gDQDtcbE0AqwOydr?=
 =?us-ascii?Q?syv6n6ntrU9Psx/EcIpLKK5YfTH+mvtOLBIbf1gc0sUKgHCORNX15pEipmWR?=
 =?us-ascii?Q?fP0LvgDq4FNhII5OI7w1f8sYgeGnaQUpdLjLyxhrojGwq3E9Y3ge6dPfNucY?=
 =?us-ascii?Q?9Z/DkEpaJda0oM1ti4WfrqmqQDuOKyQUXRBFGrZfQ46rQar2IpptbPFCSuiP?=
 =?us-ascii?Q?uDVx2Fi51nQlgFAudE28KVIfw7/Vg7nA2i4qpbHhKi2l371ju+/U5wAdxwhN?=
 =?us-ascii?Q?dI/jGZmID+G5pBPXcfxNuVP07AYuJGiGbn24yRbL9J1nd6LaIf2i0imYK3D0?=
 =?us-ascii?Q?deK3phMYWXnCaRiapQRlkhQ1m+S/DnNZNTk7F7wYSym8IIiZ9vTdurSrVbmr?=
 =?us-ascii?Q?y+fsZUF0rEXPpM7WbGkgHmE7emkNswnNKUa8GzxkgwdB5Bqc0XeAwxNebX/h?=
 =?us-ascii?Q?y3Fm311v4sbg/Ic8H+Bm+dws2j9Gc2rD+ElthjNWOpeamZfOhZgiq50lpfjm?=
 =?us-ascii?Q?L0vMS0TL/7j97GgUKnZwtGYPgLgRIzerf/APJ7ARkcCDNHcKpzR3ekwDfH+g?=
 =?us-ascii?Q?ZCYJn7qDfF1pnemIhIJyBYYCHDoQLdHq+P1SLopUJFaDumBRccjfQid2gHyj?=
 =?us-ascii?Q?xquVbz5MTEt86w3SNzDtjID44l1KK40v1cr9jexzlYuQYspWQkGrOqpA6+Bq?=
 =?us-ascii?Q?mXAW37XPC7DJE8sxDnl0590sS+je1HeBzr6ZD97itcl9wkNZRs+jmWzleWBp?=
 =?us-ascii?Q?HmAGk6QuJ6tVYXqewt0jGwdG4Jk2RY+65/Tj4j/zCnOq7tM3B8TWL1kzOq8x?=
 =?us-ascii?Q?k81ESi6vHwaEZvbNSKRu8nxCsKRp4vKjtbfm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YR29DSr5Jx4CDSR9XAjPMJBUSBT5jq6pNV1tFW+IqJ7XLvxqA1Cx1rRzqVNA?=
 =?us-ascii?Q?NZwdQ08C2yBX6Rk7nKviongzmZ1syH1VPaJHbsjw9D9Y9EVFwwm3TphqOS9b?=
 =?us-ascii?Q?eXPXVYL87KI1S6WQ+rBUktEw0108D457+kQfMBOrd4H0B+CLK3oLA32XFIaJ?=
 =?us-ascii?Q?Cxb5hw8SonX6R1my5c4Er1d/IwabQU82Zd6QHCrLathESKrgQLjBQ8beE2wX?=
 =?us-ascii?Q?5V00IVNCAv1DpbwlB4el3rlOYa9mmDNXjLEiiJkbxH0B3jFKZegfVn1gxNHp?=
 =?us-ascii?Q?rdsRixwrhLNJpAmvYOfoOpCe1FDlTAKZfWngoBTCWjaUx0Gr6iEaiCFhnxMR?=
 =?us-ascii?Q?DYBtJ1CrjD0XUkqSxRzm8/w3Qs0/RzLe6jdZBRFAMy9ncen1rM4coja81usy?=
 =?us-ascii?Q?nudbk2+Dq9JsVI+311cYLawoYmbKEfa2EQZ8yp+igwBrbB3YYSPJcPLC+RCv?=
 =?us-ascii?Q?yutbH747rSAlMFfljNaVanUBT1MxL8tcIkCQJSgugZjv6aEd27RRN0vZbAlC?=
 =?us-ascii?Q?KhBPNcDkbzMB1/R8b5nRbPWufAmxxJCnaaZZhTH7q7OmpBa1aE05NrDfAUCe?=
 =?us-ascii?Q?U/QBVLPt+/M/KYozNh8UMxxjMiDYWS3Fc3Bd/fwMPG0RfAd64PnCqOYnWnnr?=
 =?us-ascii?Q?peESKZrfL7/c5Tjm6zZFwDhK73y1nj7uwTfyzEAQqbgCBW4t5qvGuMNQAFfS?=
 =?us-ascii?Q?vLT1IcKltntfYmrD9HGspd2pY1TPI9toklW8lR6QFVO8aA2QPzbNo6DYokBB?=
 =?us-ascii?Q?jau0vwwMlSSgHmxCWMM0aMexQp+3KPMNnhdT94fakuJc+/J6fO2iJ0mZMYUh?=
 =?us-ascii?Q?yoQ7Kk/2eU4ypHem2Dksg24Z9Dlb0eIBZ+um0eCEYXfRVpvasa/AcWXWetep?=
 =?us-ascii?Q?nm2ha2icNo9HH8MwuXeGT0d/aT7KBQ58wgNotN44lK1gNN9FLNlgZBsB5aoY?=
 =?us-ascii?Q?W9k4uZhQg2TNLi/zAP9YpEI2IUBDIVCsb1T+XDJJzeFrPzeZGwZ82v86mEPN?=
 =?us-ascii?Q?qgVlqyh2btkp4xMDSWR2HSOgCTgUuwGSTD3KignHiFr09tBtxSr3B9bbTmXR?=
 =?us-ascii?Q?fc1XQdZq5WJJuRjnG5FzXfdeg8K/uAD0zuQur/INLF2aqqonMaqQW4qxUBrL?=
 =?us-ascii?Q?v3V4qzv2KOi2HoDcwFfX4P5WVAN35pDH/Ut+9/lp7V6Ae4nJ8sY3rprvBNYh?=
 =?us-ascii?Q?kgdLGWFqeGPmhBwmi92iOTORESNIsRnm7Fz8ESpsQiYB30bnWHZeZ8PAqbLq?=
 =?us-ascii?Q?OXrGM5I2irk4NZlJ3QDVUec9Ifhot4KEoo2nthEFTRMPx4L49OkKW0G4LVZ7?=
 =?us-ascii?Q?3K0w2CXwr1iI9WChP0G7EpiuhRKlgi8zueZDkMrTCnkMCPFW7HoTaxIRHe6E?=
 =?us-ascii?Q?qQeQ3yknFCVhVN04AIFclxrUIkAi9f+Fo/Ud7UNGTKN4Wrj5GIgeV9ymBZ6k?=
 =?us-ascii?Q?iodEXHdhrSRfVv61HFhvBynFY4ZGxg8W8vh/u4IZvUa9UWekzYKBuaZ7BBmg?=
 =?us-ascii?Q?wGlW3oagMH/jsnRASOj+YgpI2fsIcAJ6iN1k7dYm5EkaYWhWrkGjMhPJ8SCb?=
 =?us-ascii?Q?Cs5GI4PifD9Te16zdidjoKVz7c/77yCXMWuBeJQ4C/Bbua3V91q/icsryiNZ?=
 =?us-ascii?Q?eaEI2/LubY2iQ2giQ/mNMx4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 874e0c51-3117-469f-2166-08de20b88c81
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:23:33.7617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NiUKXwwHpF9nm8wPvCVHhNE228T7O22dhZvKBZsyv4I4mYbjCQ7wgDh4T3+m5JxORo4nq66AdwZ+DsHutNmn2tySlu8J5YgZyAg3ZlhOFsM7FSLyMEHYATR8PH5+CavW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16404

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
 sound/soc/codecs/max98396.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index 4b4e1fc98a6da..18fd902271871 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -953,8 +953,7 @@ static const DECLARE_TLV_DB_RANGE(max98397_spk_tlv,
 static int max98396_mux_get(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct max98396_priv *max98396 = snd_soc_component_get_drvdata(component);
 	int reg, val;
 
@@ -973,9 +972,8 @@ static int max98396_mux_get(struct snd_kcontrol *kcontrol,
 static int max98396_mux_put(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct max98396_priv *max98396 = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int *item = ucontrol->value.enumerated.item;
@@ -1107,6 +1105,7 @@ static int max98396_adc_value_get(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct max98396_priv *max98396 = snd_soc_component_get_drvdata(component);
@@ -1115,7 +1114,7 @@ static int max98396_adc_value_get(struct snd_kcontrol *kcontrol,
 	int reg = mc->reg;
 
 	/* ADC value is not available if the device is powered down */
-	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+	if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
 		goto exit;
 
 	if (max98396->device_id == CODEC_TYPE_MAX98397) {
-- 
2.43.0

