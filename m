Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7D4238C07
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821381; cv=fail; b=I+oYR4nsNTcJgBQACwi9HtzpuCa5kWMAGJo1qz/mthDfaZ9q88MEcZ7FMyJZt8ESa5Hk0SvVwtpw94z+zGK/dL+Ms1eZd6zyAaxFoGdWFKVqpkwjkqIWQmWhe70WMsJ8sqB7TihyRWSTKXXrBhqPNglb8+r0i3mXwTIFk40f09E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821381; c=relaxed/simple;
	bh=/K7oYLFEP+EzLcv51Ogr46ljfFd3zWpFqUoS1ZwN0D4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EmEdO0s28PtAKUQuFW9OU54WzhzQRK0F2QX3SV7M9hcYooudLxPQOMVjotee3XJRfJYlgcWPNok9qF2DbnmW8ukvKrHfAqqfFCWpOvPXDx5pZQg8Vm6orzYhbGBEyCoqELBGBq5uzuV101PHCweH13SDv3Frai/KIcAVa2MoEq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WV85cIS9; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WV85cIS9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etzUH3E9iMQ9PkctTAYo1vqeO4LsIs/293KalJVyX1hbfMDO/24dIkDqXVEHlTj/DB4dgLLrYA4J8/K4JdyV/jHexHuKM4IqdXNaQczxtcV6Mf8bSLawrn+AbEaDYMsrNo+LkNsuNvmjKkhtHakvG9T4A/fKZ0moGh3dNkZhJJHnswyx8wP3TSpshaJ3OG2W/qRFhfCd7U6pC6K8b+PR8+pdjBZlchskQ4z7EYVM2vhDTzT+y/3lsgVTOeAwZGsiKxdJB7FQs/he8XOVm2DsKhd05RnFKwzKNyoUVfID7wTdZj+KwpBKuhy11Ij6+f0BxwzebiTqjTupz+ZeKlsZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPldi9vgQzkRs/ve8jFRRtbR6iheqwEWWwMsHpdbPG8=;
 b=wmLPo99joGnj6MPu1fgrLojuii433ExAuaiXRKmkmp31WF+s5Dx0tWJLt6qZVIqX8OExeRSHWhffqSY8jqMcmET27oGDRYX1idLiOColR9iW6B9yxaNSz0k5QDJ83aH39xBuoh1Kbbe5jgaGqmMk+8AdW1ViU41/Yc1Cm6d80klhELr0LrCxTuf37m37RcyosycYprFtePs9TFHZBFXozj6yCbnwb6FINKClSWFMOvUXxznqzVR6HpyL50qQU400WAlHJs7ymVNK1f4m1KKzDRUQ7tIYdl+UpcyTpp/yD5h3HeX+nxeSkrSWSZJgdGI+sWytEZXq+cbzDUr6YXD3Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPldi9vgQzkRs/ve8jFRRtbR6iheqwEWWwMsHpdbPG8=;
 b=WV85cIS9qVjFhn0Hl9y+aOL2D6UgkXkLrzetqJY0+At8RUZjgegdPUHX7GZlo4B+SOMo1vckJQu0OcMFVqqroWIi91vAK7rH+G5RyvfRI48EhcVRGz88RjQ6wcJwf65OdwVjycKW64UF8uGRgG/9RHjfmQzqswH0GZu1wbjTWdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15789.jpnprd01.prod.outlook.com
 (2603:1096:405:2c6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:36:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:36:17 +0000
Message-ID: <87ecq5tngf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 273/292] ASoC: soc-jack: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:36:16 +0000
X-ClientProxiedBy: TY4PR01CA0004.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15789:EE_
X-MS-Office365-Filtering-Correlation-Id: 03df1dc8-c735-4613-df5e-08de20ba536b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0L2CFTM/iI5DqCE5t/A6+vewLB4i8daxOovacrS7ffdRINmekJUmWsc6kbRk?=
 =?us-ascii?Q?05hdSlC6RKL2CHzULTG3ZHtV63C7trLS/vBUmKz0bNskYuvs5jHZHZX3KQKb?=
 =?us-ascii?Q?WnGp6WIy3VIjqZMpfR+qD/iPaiNKeIPAAcpvBfVR5hzXvu6nR3Op8zhyEDWJ?=
 =?us-ascii?Q?guEjqVjQgyaT7OLabuz3WGHwnz8rML4M//2Dt+ND5NzxavhwJpiDAWY9Z4cg?=
 =?us-ascii?Q?RF/t55xBqi/6QahRm4eg3xT3Ww3MGOJPmOsz5jATCOxcPtGnFtEOniMoxGX3?=
 =?us-ascii?Q?TtFDAtIXtJlO2TYzh6ljjIaKwJwv+qGdxwr+8FnSKmF7u/JHqTJ9qr3crWQ1?=
 =?us-ascii?Q?gliShVFdETPCzEw6BuUeN2Ks6k8coajjWNCL7LfAY741O+RFXhE3I1E4tVPg?=
 =?us-ascii?Q?cpz6yCVT7FFUyQFbJAO4v5MnI1mEtyfzexfTGO+7PSYV0nFUi96wWBTHdhkt?=
 =?us-ascii?Q?LpVF8yGYNnmN9OE8mUJ/jGOXbjFttUpI0OPMpM5hugGOI/KfHIoE1f5/mfTg?=
 =?us-ascii?Q?EswOuXpMF51515KxjoJjHLAEuY6CM+JEPo7B3X5R+zmV/cnOyweSXMbilUmX?=
 =?us-ascii?Q?zjSMfnIglqv3BIwQ+Bzgv/eXmuUFco8eSLvXrLvwkDUUHUKDCAkRCD+CidNT?=
 =?us-ascii?Q?Hsi5Uc5m22N7wbsiVsOSUJdxM1tKiYKPPZScDZFMfk544+3nK5Aep1U9H61P?=
 =?us-ascii?Q?p10lQpV8U526JPOOOpXVXrm4YEUgJAWRLVCoTWR7WkZ6QPgEBR22qauEtGFV?=
 =?us-ascii?Q?awfY0bEmRG6vrRUFrBmvbVj+xm9ZnRPL9X83JTMKc7f41Ag1iofE/JK4zuEy?=
 =?us-ascii?Q?qdlKUvQqgLfmj9SFS4sV5TKRZ5PMrn5e7U/w+dp+cXmBx+KVAw36Tu/gmfGx?=
 =?us-ascii?Q?Sa3+ziFxq6WfxytX017ITnT9zsFZvHRmtPv644yaq+XLcxql7dm0oCVatxEa?=
 =?us-ascii?Q?8Kih0ZuGwakiySuUOIXDKX+1Qa6bda6o/dLDbVLm07dwwkNWqLgZPJqvQmSD?=
 =?us-ascii?Q?WNe7ra1iH32w5V6Rt7sqBR2Tx+idrw6/DHrMLbgYbdGE1dQ4zWVRzCzNjxCa?=
 =?us-ascii?Q?Ij5uR04gDJNXR1cZZM6BMOyUeJiNN8HSNarmTBzMmeJ0pHf5/828D62yeDwB?=
 =?us-ascii?Q?wCsSKWmtt4EKBBn/oMwSbtIfRLyBsC4RGFG9h+laH59sLIHpfHe+Tbtcibh+?=
 =?us-ascii?Q?+qPScFnmZ53LBCBt/Fiokg/StY4Aa/rzHevUkS2N30YLvJyOv8phxKRULhW2?=
 =?us-ascii?Q?8H1rBC0191sWMp42fBP5LuCGA6fbAiSnCnKrmbRsy0cBBXnewYuBvZ+fbu+b?=
 =?us-ascii?Q?IIrJ9DL8c+GTuzmvAE/aYnGi0x0dzv4Dm/78GGb9nDH/RdSxwvb9l4lNgi6U?=
 =?us-ascii?Q?zuVXFrCadGP969HDu3Q8+EKKDtyeJaXlLu3UaJCkv2/UXWOckPdZWwdgaLZE?=
 =?us-ascii?Q?tfhmM3L6Jk/0NL+XE1+gbjmpRULfjs/DBochlGpL4P4kutqbqJ9SbquvYnUS?=
 =?us-ascii?Q?mIkZQWa3+CcN5jw/qVR7Jm5OkrtRJgKr6vDV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7tbPgCaR5QEneV6HzRDkYdK1TMtjEXAeaFeHdWKXp0XyrWBb4bTeeBHW6JMH?=
 =?us-ascii?Q?BZ+v7KrkO9ZZmWx4nnaw1h60VucnpIP4jFOgKuvLc5KNIUZqxiCwknfAXqkf?=
 =?us-ascii?Q?qj1JoD/VlxkLct8FmG4XlWk399fDU7TFhomkQUz2+VZG3jqj20uAe9Cbsol/?=
 =?us-ascii?Q?xsF90cMtRpdUTEkQ30hMPytOqSfrj4NdEGAXgdMWyQVC+kucTlqwtejqaBcg?=
 =?us-ascii?Q?k+4jym6/GYRsx0D4YH89klfbvWDwW1jr9C8I59D3E8iHm3z/OnSIhhldgviy?=
 =?us-ascii?Q?UBjbEV8E+r/GhLxQV1tAE8esoWw2/fb45jL81gEi7Vq1YsI+M0g73L9xy19d?=
 =?us-ascii?Q?7ynGN1dsM6SZ/kZJdsty8QST2y3RbDI9G/RIZTx58GYaZz8xHcdk/y94ncvd?=
 =?us-ascii?Q?yaFolShVoeob5mOY/XAv2mBs0n6KJIkdazSsnTP3fI3WtL5K8Upbjtqk+q+7?=
 =?us-ascii?Q?5CAEJzl0F3/jUVCh1wmsgywy2BmgsiKygZf2O2vqgf/gum7WJaqvW3xLErr9?=
 =?us-ascii?Q?jWArj3kAGIJBX3gOsFvOAgL/1yTRPu/muFtG53oKcLTebft1QZio5Grmaa9H?=
 =?us-ascii?Q?vAefoYNf9t0aE7a/dt1XcFujL14Q3uLeCWDdcqWrjQOtgojUC32S7c+Sfs1N?=
 =?us-ascii?Q?BuDNvwNZlBk6vqD9kUms6xI+efs6Z8EneDajRH+T18WB4cnlyn6HMY77aDch?=
 =?us-ascii?Q?Tw9/bD1dKrHL0egmVtxbY9kryPpLCj5Xb568Zfwg/tWIXlC0tLpM5U8tzkHu?=
 =?us-ascii?Q?9ry0twXAX9WGDiR783lKHaS8on6SX4TfBunB1OgWub1GgZhLh6TBz+xRv6ya?=
 =?us-ascii?Q?ON6xOn0dKYQLmVO4vsJnKT8FtGzFTMyOSTeeMqgcGhNAsHNqnG/brjCh3mBm?=
 =?us-ascii?Q?l7qmitOJHvkg4MPsf1cw86mfIBBwa2tPH7f0av15r3rsqvAIV0eStjoD4a7N?=
 =?us-ascii?Q?Dqqj73d2U6zrPoMeVhoJ8CNhcfE2uIItd/I4wFrSH2hHS5ZO1URZ+EbTGxBM?=
 =?us-ascii?Q?4/99DKnOxA7G5varMtBPzhlV4wDjOp4pyXdJDARgAThu+Pu1K5IL4frYZWqc?=
 =?us-ascii?Q?px3qyHIpfyjaPQ0MRwtSi6fH+XKoT0eaLR0FvWT6oqeKAoGfjLKH26kBxzPJ?=
 =?us-ascii?Q?BnjCGKb71N00mTe2kkdT50fgl9UWSalUpPIElZAV5aTqonww2sbYaDxifY3q?=
 =?us-ascii?Q?+NeGjS4PIO5ODBSIjk6Lneoh578os7j/1zmniuqug1S2iXm3At+HK1WsmFkN?=
 =?us-ascii?Q?65qo7Z9hn3uUGsZXUoXFTRgeFfOmIsfzk8znNcYgfhJWDiCWOyNi8VZZCR01?=
 =?us-ascii?Q?GxSZrAkJabIKYe/NG/EHD3KL3n3dfNHJqMgm4fLjkaO5XDLkuITmBojcOBCY?=
 =?us-ascii?Q?vnBBImxrnDWd5Ti6pG/dgwsB2q+5zyCkO0MRxTLQuQ4a/x7zUvUG/ZpNwiRW?=
 =?us-ascii?Q?ntzRRhmGOlU1cVJe8FVqXIQ8HnFgQaV2/lwS+p04DR2lazi3oEgFrmHxALWy?=
 =?us-ascii?Q?AdTGcYWvX4v/RlAxTP0IujhiOjdJSa+7LyZCaFWhFnG5Uqt5Z4uIyw3vZEx5?=
 =?us-ascii?Q?4f22I8SvORCUUF+ltTs1cMRKaozlkUO/kULNTM8z+9qLI/jnzw06dJWdFxXO?=
 =?us-ascii?Q?2RLD1nezHRlyVyZJJYSXCfo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03df1dc8-c735-4613-df5e-08de20ba536b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:36:16.9759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwwdt12dst0rJP+6maZkwoNZlzgpDuvzUgHa4HWmvo2t46TX/Q5neBQQ/YHDZg/ktSJm9Cyc33nL5HTHA2cDw1P+NMRE+J0wbivs54mWFs+lehzDcyTDPNCrqSSPlwnA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15789

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
 sound/soc/soc-jack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-jack.c b/sound/soc/soc-jack.c
index 63971396b708b..05985ccec571a 100644
--- a/sound/soc/soc-jack.c
+++ b/sound/soc/soc-jack.c
@@ -40,7 +40,7 @@ void snd_soc_jack_report(struct snd_soc_jack *jack, int status, int mask)
 		return;
 	trace_snd_soc_jack_report(jack, mask, status);
 
-	dapm = &jack->card->dapm;
+	dapm = snd_soc_card_to_dapm(jack->card);
 
 	mutex_lock(&jack->mutex);
 
-- 
2.43.0

