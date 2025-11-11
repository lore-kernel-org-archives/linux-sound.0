Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010030.outbound.protection.outlook.com [52.101.229.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8BB1CEACB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820777; cv=fail; b=hG12sxKl2MIsL8HvRy7gddvFeaYTrCzX26iqOy5eu7QGnVa/7tCx+6vg3+SiJziIK4dSxlXyP99AmHRWR9caK3lpdi7Myggn3x/EpGJnHcL6Zfax30LwXjTYL84o6/lfk5u0j12BcVSJC24h304Zg5PBK7XOdHZyq3Q44+zNKfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820777; c=relaxed/simple;
	bh=uBU0UYzUHCBSY+nZD1dqvBT3nuipBfGgYA8aENkTvYE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MHyMeclknkYTjKAHfcQoVwOcQk38O+MG4ogZOnTSjQvFsl5bHsghgwWAfXHDJT3yqhLNxQC0WBm/M8Mdm1tsf1s6K7NvbNefFXFGKKfcjSsrhDM+XmSWxdx2oeh5rAm8CnemHUP7Ab8UbZYYdlz4CSr6gCGKXEVpAwayvrWqDnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q1bhb37v; arc=fail smtp.client-ip=52.101.229.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q1bhb37v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPjw4BwZ0OlhGff+TWdaXh8Ll1s2iUtlbq3uPOP3miRZvk0S9T0eb/jdZrq/ZXTJPEZJpSwMXx4BCLALVmk8d5Q0+q0aXFjgdHVH0+MKLw1riP3uhWF02g9/7SyPQUB7n54AfRYfUW/MXC6KQzEf0DX/uU7OXFfGwsPvU86IQDX/JVOqHRASHTXx4oqH+xfrHuqMUDeZSeLM5E/lPrut5E/nY2yZhJi2BcpN8ted0y5ejBEnS8NTIL60MjnaJOb2khSWxESrgrKRiSA3VIKR0waqWuWLz2KoP6ekI4tkBx9mkbHn8SsHW8UBV9bVvmpriM2GCsnEGL0nCFZfggPVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6k5io1dU5+n9gkNwAhJwTT2mlh5VYi9+WXNutK5Z9YE=;
 b=Xmw6fBFMFV5DTNmau9fhDwQJVkr4oKNiNxXgMHWE9suZNfJ+msGXkuD30py2vx8CRf6fxlqT9Pi9B2y46inK5znBnWbmFRQ8HEU4CV0G4rA/CHotAHtsHUrkFTS02dEyPEHU5ywkEpqJzdgDKYfwngHh9Ogcrpfs5V6Jo0tRMoxgA+Fy7H0GOPNar8vVEGNcD9LS0t94ZPj6p2pqvAxaRLZojX7rmqME0tITJucz/6x/8/zHNCsFWXFR8LaUVfvWqDkoEqbpK3GFHwZKalbAfaZQvxyy5+uxNA1EsKaFw8zKmOE5kHhKN4WyzONNU69X00jFeJQ2L9XG3oP4R6yE8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6k5io1dU5+n9gkNwAhJwTT2mlh5VYi9+WXNutK5Z9YE=;
 b=Q1bhb37vtgoZwXOmpCJDqDAhq371dWXEfNfZBjofow4zt2hoaP8Y7yV3Y7r+9Q2bQJLfuQlVkz7r7Cl5a3I0ON6Cl+ynGew33xSVMCXiu4IKMv6iESLFNN13M9Ry0/yrmrODma30Wp/T6w/RsC1mgvk3bspgWC65dUot+0rAzVM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:26:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:26:13 +0000
Message-ID: <878qgd2z4r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 127/292] ASoC: codecs: simple-mux: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:26:13 +0000
X-ClientProxiedBy: TY4P301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 52ab0a55-45f8-460d-5404-08de20b8eb98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ara4aUc7WDQvTX/uPBhTECiONkrilUu6JmINs1ykUgvwsdFQRz/ahAMsdxYU?=
 =?us-ascii?Q?xX93MpLAhdUr0kCtVBjmCR24J4OYQqQAonNv3Rb0pqP82JamXNCwG8PZlToy?=
 =?us-ascii?Q?cccfpM25KIRt3rive8Dp7mnEZ+qKSOoSgLxDOpfaEcgEu7NjIq5yC5ERcDbn?=
 =?us-ascii?Q?po3EMUE8yI5lPUy4Hic+/yfV2k3+l681iEAneoDiT+ngk/x+WNuzHn/l+pnq?=
 =?us-ascii?Q?gO0/qni6y/XZDzyiltduOdnrp/qbSRZrKKIdZoCN1wPCwdY0+y6T5sRVV6+G?=
 =?us-ascii?Q?Gv5EujZlJZ2E2i3Zt3/4+XJWdPOFU9Wa2jS9Vf+DR6flf+dW+hGA/HEfQAKw?=
 =?us-ascii?Q?ouYtGuoePcJ4iDab5PWi2Hc5jxWbQqV9y75EvRMg16UkU333bNp6BOOnwGMg?=
 =?us-ascii?Q?pZ58GrZ/O3dOPwHF1HNmuomXVtRV0mwp7tro1KI4N8AaIQVHLVQYzyaNp982?=
 =?us-ascii?Q?R2a9c869FP1y/1PI6Julb6YNqHgBLimNmX2bQp6w9xgHorh7SIs+DF+Xy7FZ?=
 =?us-ascii?Q?Hfi0fdG0DljQTUghYTVudfZ878ISxHPRRsBVdI+nv7UhcTS30n48y0iUKQia?=
 =?us-ascii?Q?vQwTLcEUrmQYfFlXdqSXYzS2DoCT2lxX7M/UCFD9ci/0P4o9hfgB029SHHpc?=
 =?us-ascii?Q?Z5HYWCojyElwj9RcHIRWB0lzUGa2G+3+7wFatkPxrO5147PpoVjaTQDcrI8z?=
 =?us-ascii?Q?kHtTZ8pNqKW8Z0BFZiyduDvoCSHnWRn5hKKv6ZPUGjHBgdLczCz9KjMt5eGO?=
 =?us-ascii?Q?xKLLiUfv3i7vYVZLld0wRZNpSgb3PxtTLksziCfqClQDbH3BFGDMLmK3uGnQ?=
 =?us-ascii?Q?Bm5LDP5YAqSZRC38ZTQjxUn1LSv4EZMJaC+4WK8EJnRNJ3WwBHK4zLl/yqpf?=
 =?us-ascii?Q?MmrTTNFbNPE5vIIILuky06Bq2Sgh/0CDDauIaErTX+XC9QOUIW36PWiOcpQV?=
 =?us-ascii?Q?BT7UII4/dIm8KKeNYJG5dN1cIoUJKZCTBtn+HP030jba9cIOnja9xggPcATx?=
 =?us-ascii?Q?ogeYw4Vg2DKMqIjfKNAJIMNwnXhqwqzB+Zr74KpYS0jYKlBRO0LQugFfFdsZ?=
 =?us-ascii?Q?af5B91lNJ6/Fdx/VZ6HSrLP63jxRPgRnj487dn2+RdgfNmlwXtf29F1UVQCt?=
 =?us-ascii?Q?5G2sEfFhY3X6ROJAYJN0i+tCWIZVbCY1odbDoPditaKUdb7ZY17G1RIEJ0we?=
 =?us-ascii?Q?FS5Y4WbtGJSpdSoG7ChvdAWEnSyd4voA6NF+DlK427a0tOS+l2lFKvKovyPf?=
 =?us-ascii?Q?cmUspjVF3/BOubnKpMFtSF2B/KoC5kqt/jwNwFS3ctqhBULqiTWMhOLTWGw7?=
 =?us-ascii?Q?9L05ixhErJ12cTSh7laxVWwOk0znmoIOR0pRL5zW42fVgv1rciM3ZFkbOtFU?=
 =?us-ascii?Q?arxKa/hOjMiHAvPEOYmS8CAdKuJTJ19aMIGzygC+yE29EFpfIUfNBV18hy2v?=
 =?us-ascii?Q?1S9GX1986tnL7sn9uMvQ7leIV4rZNaV78nhHuAttEdC5/yFhmsr+PxplK3F0?=
 =?us-ascii?Q?Ai7uZt1WyddyKSIaLi9wLKm7TiNPjRTCJzCN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1JBoqmHaPJIYzMoW9DKxPnZeEEv4msh13nXz9Dnfgx8RGRV56/NUWo4Jjon8?=
 =?us-ascii?Q?tC7RZsuqWTclWPCnw67CAfKhfOLvdGTQPszFJoKClKa0YYQAWLTG3fEj+AZj?=
 =?us-ascii?Q?pwj0fvtdRHdU6XiDDHiVw8nYwEbb28bs2Xluo8rkHirGV7/TyXhgjp92YiKq?=
 =?us-ascii?Q?K9o8fsAiTeNkXjXrSmSKbdryOCLDv1JdgttklchTevvpM/VrULVO+7cfDLEv?=
 =?us-ascii?Q?zLUI8UQobmXXIrjBTajquJmksTDZzcaeEYLebaUoXuUtXNqnxAtwj573p/zD?=
 =?us-ascii?Q?elFNFpG/ZYOEWNQKKtoqUMYNmjCpBE2CvPQGw8vicgwfF0xmblRBW0ylyHYu?=
 =?us-ascii?Q?aSk/CW+RJixxBGCR6nqjU5ftEYE62FHu8tKHVzRgPDx/nE8BiYZ59pX4DCZc?=
 =?us-ascii?Q?AnfiN6oFvJFdhOJ1Ct9gYrdQXQZuwAjj82hf76Spq15n5MLWWDsEPSKLPHbg?=
 =?us-ascii?Q?coZ3QRfdkjQRs5KgyABXszTdDgT9JUw7qv54R9QM/j6Fj4ZByZNcNZg3W4vl?=
 =?us-ascii?Q?G+uwTGGylMaZ9miA0Maz1rEMhjc5p3oV3oyhO1FIBLFlm4PqtD0Y10OK6qy2?=
 =?us-ascii?Q?CwmRQwHERh66/EVNhf0y0KoUBuz+rx2tWQWUC/voOFCGBqUu7jmUMAsBEt9B?=
 =?us-ascii?Q?svuw4WOZj9O2qOUXYj/grgR3ktO1wnS9VLbVmdnd26C6HJI6cCR6fIZLn02U?=
 =?us-ascii?Q?3MVvBkqMaSIuNafG5s4dATrg3wpCspGE1AcvivJO41dZDQQQkRqSwVLIoBGW?=
 =?us-ascii?Q?nlsFxooEeF9PQ216Z0F5RKB+cdCwvtGE8wueBk46pFnTAeAHuMPIFGS1SD6z?=
 =?us-ascii?Q?TBKDfkAt4n3z+2hbPJk+XLq1hAlHuDqodSVsbqzyibtaRLu+qwo/Kc8hd0DJ?=
 =?us-ascii?Q?tvF63ZwSJ0I1QU6qaz5ekFrgW5pBEXIryOLR5NqRU1yrlgNkz2nFmeLGUNac?=
 =?us-ascii?Q?rjUrPLfGRIjzPkLXjDeuJzG83ymWmC/SxjuavYrLdb11wKrsTgkyBAAHb6Bh?=
 =?us-ascii?Q?K9krtd3U66QjMt+KkXp5D9Mz8fOzxVP9KHm1Li+O9lqxNN043KjhnNbHW/6i?=
 =?us-ascii?Q?PcwyTtSA7zwBnEEQ01XJ5qG7MOmTLZSZrYwNW2ritECpBqdNrs/FGls08wYF?=
 =?us-ascii?Q?wUU9/07s8cM80qc7EiiKTJsGtsnCyWn8U5v34Q501LyE5P5rp0oIHaCMQPol?=
 =?us-ascii?Q?uJjt2mi0kMaxSWhvYr64TsXUlO2vb4U5nZ+0dPf2WtYmiiko63NDE3b8LO/h?=
 =?us-ascii?Q?y2sHJcBbVER5CcmM4g0S+4HBXXHGHzyhvu7QmqWR+T2hcXZ/GiTTMGyocYv5?=
 =?us-ascii?Q?IxX4m3gd4RRskKr0WsK0V8eaOHBPjH7qqayLFusLn92e4WjPLeMkjyCpBrg+?=
 =?us-ascii?Q?YBwOrWVKI5JzGzbxRPLboVEs2su5h26v3jAhvTAs4ei4vspNs638JYNJLgQr?=
 =?us-ascii?Q?wi6pJjLBPpp51UXVlAp3SQLx0HBYWlZbRMSMs6VbPtrUbn2HbRpRFxUodv4s?=
 =?us-ascii?Q?SCWr3tKTmI/cZA3fDbaQ8pjXuyzAC4C+FLh27XnFYT0Ey4FZnKHGHK0X4OZE?=
 =?us-ascii?Q?MVWwe0dHuYQMj+T8qXrn/dbRJHQMfWknrwJd46orrhzxCOb6tSOYX76q8Byl?=
 =?us-ascii?Q?owvIR4GQXlvoA19jdzBEpEI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ab0a55-45f8-460d-5404-08de20b8eb98
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:26:13.3132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9+IrOUcYHBWw4FwMXurBwnrNXxqpzosBgW1Muu02MDV/eGgXVVqrDOSluN85/J05i/oXV47e3ypMlkNNuLDUe4makNmCeDkG+IRsduCGEIlN0zRLxf+a2nz5xIiBhtK
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
 sound/soc/codecs/simple-mux.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/simple-mux.c b/sound/soc/codecs/simple-mux.c
index 3906964401557..069555f35f735 100644
--- a/sound/soc/codecs/simple-mux.c
+++ b/sound/soc/codecs/simple-mux.c
@@ -34,7 +34,7 @@ static SOC_ENUM_SINGLE_EXT_DECL(simple_mux_enum, simple_mux_texts);
 static int simple_mux_control_get(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
 	struct simple_mux *priv = snd_soc_component_get_drvdata(c);
 
@@ -46,7 +46,7 @@ static int simple_mux_control_get(struct snd_kcontrol *kcontrol,
 static int simple_mux_control_put(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
 	struct simple_mux *priv = snd_soc_component_get_drvdata(c);
@@ -59,7 +59,8 @@ static int simple_mux_control_put(struct snd_kcontrol *kcontrol,
 
 	priv->mux = ucontrol->value.enumerated.item[0];
 
-	if (priv->idle_state != MUX_IDLE_AS_IS && dapm->bias_level < SND_SOC_BIAS_PREPARE)
+	if (priv->idle_state != MUX_IDLE_AS_IS &&
+	    snd_soc_dapm_get_bias_level(dapm) < SND_SOC_BIAS_PREPARE)
 		return 0;
 
 	gpiod_set_value_cansleep(priv->gpiod_mux, priv->mux);
-- 
2.43.0

