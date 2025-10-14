Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466C7309DA0
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415763; cv=fail; b=MtIPgMJN9IPkyW0Stdg6C7vu6YuCfaC5fsYLpzKcF8xBr7Jsc0Q1obKTaWritLrvVpUAj3yLy4YMEQCt2puwL9WVjd8f2cg0jXKpBbztVk3erTeO3EaJZ1JiYFpsdJQvsm4wQ/poJ5/KSWe9m5lMUptXcY8vtgPj2n5BZq1XY1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415763; c=relaxed/simple;
	bh=AEyDZKRurmcKpRdKxzEoMI0NhoPTnuG9kkuFFsjmc6M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UCPDyUUTdWutvn6gbd6Rcc64yeBw5QRbMLSOkTH2E/Jcoci1xzG4NEf2WCdTg23aO8MMCht2RrZZpmBBaACNohY8fgFL5CsdT8LmiQwYnnmkG4iOdr+Evij8hm5haqorXbusCHryiptKgkS8uB4rKi7zP8TNq5Mtbc0zm/pE2U0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fQ4S6QVi; arc=fail smtp.client-ip=40.107.74.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fQ4S6QVi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2EVOY0miujWKcXDJ4tcH1Nc4pAEZpMolLPNTCQMo3+aryKb8ELmJG7tqkzlSvkWlGa0G6PKOP2RLterBtjCFM+vwtnuu+YXOugW48wIx/DHrRLWwU1GLoe4Zdd0KNsYgKKN/X16EH9G6TcFLblbYBXhD+uimc6BCt54qE2tJ9pIpe1qKFRf1/V6rrnAMK9HNG3zCh7VOdl433htyNBl2S6+hU0lNqxbk5Xhn8foo/U3m1ZTm1vboNrLQlVs9OfDN0Idz2cKjnpR4VCxLoqDOdMyfvp62IyW9MxrENskrf1b2IIdPvQ8gwnTGHhsIhRBpEeQ9vSKj2HJUCjxBa1H0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYBJcJJIquC9DvPfYKy9pMcp45HwO7T7llW38nqkeUU=;
 b=L53eLkOQMp5KgM+3bV8rN8sbREPfY/Q5PjraTgte9Lp0abA9h2SBsso8itDLFoz7sME9FFpF1G+Vr6JO8c3HM6USqfnHC4INOGbQet3ToaUwHtWBOoxsUXGAqk1IZFayC3oWXpbRvGpkNIplyL4FzDhpGOacUwYhI6YHeGZ/4vwq+2Upf5oz4IwZ7PJ2SmwiviNBrYDuiarHurAe2JtqDregv/coCCo+3mLSDetseNRV4X6XkdO8jkPZDaHlEZqEXC//z7MNod4hG8nB/WCKrsJsEjRREjpwXC89JelqHB8Bv3wohmsuYBdv+4iwpTUJu2Bxcve2pg0Jaz85UmwugQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYBJcJJIquC9DvPfYKy9pMcp45HwO7T7llW38nqkeUU=;
 b=fQ4S6QViOZYDesTveXBkvCj5piaxMqhbuhVYFX/xOL/SbBiaE71Zc8RmDslSKiS3H6KbZ4Muihll0Q2s7tuJnH+xAAxCb7WNNyAlrTnkREhsRwg0An+EantL9+dJ8Mm5EfZn6cnsB29eCs4B5lYEJJTE/nidnKELR0pTQUrpzME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:22:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:22:40 +0000
Message-ID: <87tt02qfhs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 051/139] ASoC: codecs: max9867: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:22:39 +0000
X-ClientProxiedBy: TYCP286CA0049.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 6442f7fc-3d3e-4df8-3568-08de0ad94ff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0XLRb4Hd4doQFnTwCflXOAiohNF8qE//5ErbwOQ6sQWlyW2/dQHAtEYhepZL?=
 =?us-ascii?Q?QYRq+FXlPqjP+lYIkJG1iHpk6Wjk3ghTIbepxhCwkaWECzsM/GpohF9M4w1i?=
 =?us-ascii?Q?hi5GAZdVq4SUDYxACjfIJ1RHrR+svOZGVAroyX234yzbByft1vkinXcMy/7/?=
 =?us-ascii?Q?psQv8KJyZTmlUP0LfUYk+R9G0frGCjgxxI72LypQsqF6Dfjk+/+cKAD1z6qj?=
 =?us-ascii?Q?r78CrR7mOB47RkOiIa3b/r6gcq/r+Ym5ZPyI+ERitYAmW3waLoPLyeTrk3X6?=
 =?us-ascii?Q?MUSToA5/wfHuyG35nTuialz8Pz1EVAJtMZh/9HE0vBEPLSxDhlTbzRCWgtiF?=
 =?us-ascii?Q?a+vPAZfVgpbwXutQM+Vttk/J9USRJ1lnphs1aUCGT0UJD9atW50WgIyseTqC?=
 =?us-ascii?Q?C8r4PVmfqSVGWu07XbzQVHei8nxOMSPtDXE2ZdDvZqszV97UA5KOJedrrgJn?=
 =?us-ascii?Q?z3nk595U2lVpzEYXVLdBRul6fnxY/x4rxHFi0LoKPazSt2f1VEhijT5/UpuU?=
 =?us-ascii?Q?9oQ7SM+y1IDcjqJ0IbheC4hu7vtt9DTsNeXEcVZ4A6Torxp92Qt/reKwKyIP?=
 =?us-ascii?Q?/4xylhuPk5SNAt8GiIYwZKHe4XvmAaGFj9CMGnOe7lmyXDWF2AAyVHaqvZTw?=
 =?us-ascii?Q?w/N+EcCFDKaoXNpAAXvUHULU4VCog7lBEbBH5daan8GkAGawhJGBrfmabPaN?=
 =?us-ascii?Q?hWQitssAlOVAsX+UPlIcj7l+PzdMFgr6FEqSnWL35JveVFMvew0b/M+JMzAh?=
 =?us-ascii?Q?hDMzjOp/LqUfG0hBVTCSx4GF3YWpd8RRvjuTzfTfoXt6sj/6ZU638yfIUmSV?=
 =?us-ascii?Q?9Rqhc18G2hYR6Xl7Cb8lCz1By6S0Z5GgGKBDtT0MMWMxpJFmzdwoSWHcsflr?=
 =?us-ascii?Q?IxoJR6NMdJTFXtdGV7/ozPdxuHLbuONlhBVkrb5XAX6GY3fy2rdup39Ypx1g?=
 =?us-ascii?Q?Phtpzh8Xqppb7UE+KIvLVHd8qLOoGbfosSKIjws3xwCYKISqDuR6JF5c261R?=
 =?us-ascii?Q?j9vNSy18AhLgsA/AjX1v+VYm2QuiCrK4DD9hiQ576Lx57In8V5ZPpFF8jcYL?=
 =?us-ascii?Q?ipl9erMlX7VowivANieHHbbrS9PfVfvSa5t+ZynIj0TP0rkG0hL1YIuNA1OC?=
 =?us-ascii?Q?OyGQ7tTB3fqjHCeiz7cnSVn7viu5GBYF729Mi3I2v9mWIiMNTg0tn9atbAWu?=
 =?us-ascii?Q?MbkFEwd3LObCLoarcL09wHvlN8MkoXcfDMFWXDI7ipac5KKdv5rujafnjWwI?=
 =?us-ascii?Q?wujHrvS1CqF6mtKc84uF8hdRyOkSYulQu6V08UBSAsXHm7I8TcVOaOyahT0v?=
 =?us-ascii?Q?qCcEVrBb8F0Fi6u+CPlWI+xsNbu5n6FxWr9FL3cR35jU0R9MP3QgprYGGxs5?=
 =?us-ascii?Q?rufa27UGqxACWxVdsnujec+Dr5ZEHuvgrM1iEnGUOX17/ry78vex0YVihuk4?=
 =?us-ascii?Q?FlprD9IUvmlzvMMYcWvfMZAcGPhX6HxKRVP1QWS1yRKeRRHQkcXk2TdDHsAv?=
 =?us-ascii?Q?TfDY51/21yD7elm0Ce/A9Pr2eroDKr3lL+BR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C7o5WTqZkjLlxB8W5IoEJEsmOvvD+u+EFsJjxoGP2hJxBn3qfYeUvy60wTSv?=
 =?us-ascii?Q?aDSkoqY+CStezIpkj8+tPLcIpk2vEOa3dg9QhWBm+IC+FbqIhvzJrTeyQF6O?=
 =?us-ascii?Q?yBh8p5igtPGseOnHEMu1Ji+aM6mQ2GbIAO0PQFTNO8sfMkPVMNKz6zVHNCjV?=
 =?us-ascii?Q?64BlyRX2UGUo/OpxyDX0TCYlbjabnOBRtsoReIwwqz1VAq4Dzzr4QBiN+6Tm?=
 =?us-ascii?Q?sSNnBIjxHy77aLcpnyPZdxOx7UXCY89ZYG46URxZY0Pv8c5RQY0SpmK35c2F?=
 =?us-ascii?Q?B9x7WM8VpuLVnf3u5Aq7LFYo6EKyDLT4eL65/IMlQjRnVFwPwS0vgLIbE4yo?=
 =?us-ascii?Q?Z/CloWJRy+ZWkN/Ct1xqqehuRnCPV28I7zw1H15e8WTw/xh1rHBdw6Mcb8Z/?=
 =?us-ascii?Q?lpYqG9SkXNLr6fTxHfr6N7O7vSztJBfkh+Q6rCfR77WgAiBbyUQYyuHQrlxL?=
 =?us-ascii?Q?faIH4U7EIPxgL9ZBMfUbePbLuMXe6gY8AGUGpMbQB8d6pYmGzFZV7sZ5BxDc?=
 =?us-ascii?Q?MTQ52GkZA19ikPI5leoIO8HObW6f4t39XlKZeAgVKR0/4jhNG7d5SgCXkFmS?=
 =?us-ascii?Q?5EozCG++5mVKLMDr0uq9mGdvnfPW4VyLq3o5My3J3708/FkL0o4SQubjnbnK?=
 =?us-ascii?Q?vpUqyhYMerGzvx9RqfPpjJTeM6GL4KhQrki92NRdCnZZZr8aeYZrPVDlvKVB?=
 =?us-ascii?Q?ZcfBOiwDPWCOBqKQuzaWWs51mVhBB6hJOOQvH42S2vC3uDl+MqS5KyvibciX?=
 =?us-ascii?Q?9v6t/xm4VB1B1ZTaW1Jp64mjdf+YoKQZfuaHF50nBE51U2PNelIKCNOHpi0R?=
 =?us-ascii?Q?xz12AAweAzdOV3aouufCey5d3g7c02VtoLFgaDixYtGo/wu0nbw3GgmSKRmr?=
 =?us-ascii?Q?8D1BJHbsp7FQCfcpija0Vb3dflYs6y3Buj5AZXSv/ido6xhBBVraF78EjH+J?=
 =?us-ascii?Q?D7W053vY6OdYIlQeFz65NI3jghUvS5W39PXyVvZoDG/df9YO1TaivQLrgpg2?=
 =?us-ascii?Q?Pkrwmbj1QOGHNUsxwvZnvIGNtKPuTK0gxi1xahqaSm7ZbMh3FJyb90x36f0D?=
 =?us-ascii?Q?wYnVb02GQMFoPGY0eWklInQ8jekT70PBfj+wxhbgwpce0Mx2Eo+IZF/mQ1rP?=
 =?us-ascii?Q?nhhY8mphNwm8YLM/3DLOyYZoABQdQRA9MmWSI8SbX7F5feRHc5Y+LgN9+pus?=
 =?us-ascii?Q?KFzmIbdN80fqhlTES9SYQgUcl3JpPa/ygtlH9vhgm9l2jeIEm+XOeLVn/Wf6?=
 =?us-ascii?Q?r4pNEAEVDGeK+0gR9SCIgEOwYCxOot7kuFqlZvQRON/JtzNB/YwbIJutOjp0?=
 =?us-ascii?Q?BCLXrRRYfLj8POtLu/1tSPARd6XVRXRcpslePiFyZz0iVWcGt3PoT1f06JYG?=
 =?us-ascii?Q?6uLUj9Tf1HTSY/3+R7qQdS+lOJ9HRvdQIPU5h251lWXBrbCuk1e1Jm9DXPij?=
 =?us-ascii?Q?FXF2YAgcoKHW99Xl6MVfFHIWXuT5IbVgZUncYiQ4IU85HFA10l13cdQH3jIH?=
 =?us-ascii?Q?0+cT235dA+YWHQPzEio0qXnv3OI/hqiQdDV8v+4OyzJ9nFQWExnxSMvCDNDQ?=
 =?us-ascii?Q?GqlI+ftN5qGuZaOz1HpGG/lpAw5MN8ZVm2PHE46rWw402s0Opv2cGFCecgol?=
 =?us-ascii?Q?M/515HzFkKf2d4ykpd8L3dA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6442f7fc-3d3e-4df8-3568-08de0ad94ff7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:22:40.0227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dfoQYktVAeaKtkA/d+kVkW9b7KBX00KNHEcdRxwcQM9WqZCb6P0PomH2LLsieC0piBEL2yIldQhu8d7+IDG7xSQ8X5shS98M+AyikoI2enMp+HV3k/vlqtLiqiS6jx8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/max9867.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 50db88fce904f..35ec9c1b18f91 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -78,7 +78,7 @@ static int max9867_adc_dac_event(struct snd_soc_dapm_widget *w,
 static int max9867_filter_get(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max9867_priv *max9867 = snd_soc_component_get_drvdata(component);
 	unsigned int reg;
 	int ret;
@@ -98,7 +98,7 @@ static int max9867_filter_get(struct snd_kcontrol *kcontrol,
 static int max9867_filter_set(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct max9867_priv *max9867 = snd_soc_component_get_drvdata(component);
 	unsigned int reg, mode = ucontrol->value.enumerated.item[0];
 	int ret;
-- 
2.43.0

