Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7F41E3DDB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820962; cv=fail; b=tZHsyQ9LqYEJEWCVXLKtvDeZ2GJALNfEe32XuufZeCMmK2VND5eQG6LAa+tcPEUa9EM44oPYWCnwwSyNaygBvNwyK5hS1GDGY645U7uxYwPhs4jboG5/zSGPEPvpXYOZ9bQU/GBScmNaK8r7NsUcypbeWN9BINQKTgvAuF7TtlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820962; c=relaxed/simple;
	bh=dI91YQBPKoWewM93OqejGKTGdgmorCaA0oulqZd5eIg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mLl1Fym9UNuONd3/AcmyZnmp7jHgXCzPPRf9e8plZrHnYMQ3mb1Y0eYhn2cM6UyfoIKlgrhqqGi910StHHEs5BVfkgmD/CGoZa6Ci2VFLAz9uCI6alrjQvxZ3ajpItQrw2F1ppE1lEDHevvaCubk8RH6biKuAudHZKVKxaP6UWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ee0rSr9h; arc=fail smtp.client-ip=52.101.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ee0rSr9h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYJaY2T6lo7U3ab9WhawX5pFema2cBLywO79cyT9DlWQtXT4RC5ljFC9/K4WsjZp8omcl+Kk+6KhUmflne5rtX11ADNzE0L1fiE9jWVnglIdwfxhuPYDD5O5HH1FzjYUSvj3k9qLzHYxZPCOOGtLF2gNNHFd5LRmAQZDv8Zvgx2MItpohvUepUfZgkf8IWu0OL8VhT1PTuS7k/SB1FbSjyeMqsHPXL7mBTyhq5bQb+jv+wABNuea2qREahCDQQicV9ca7m/TID3z0U3bKvBOpv9iBOfyK8V2O6GYsICdpwkI7bRvacJLjwOgSCxrsz2wGyc80ytHywoLtyt84iyo+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jm9Kxw6khEpAync3+bOAR7uRSMyYPdTvYb1C72osb9c=;
 b=U03dGmLsaKVR8mnQx1JVHmZUTNsxUiuETju1ef3zBwGPbQxHmOZjRyyf3fM2mmpq2TC4sTt1NnKuzmcQJCxc2YXBmNGkWp+RJ/N8y3OJVKS3UZGqs/7k1SnvIrKHTX5elK7WOIq+uKVw8NV/Is+LVnPltvRsnwpix1sXkmhaNHOcLTxunQWdNBtA/yDgqEaizfR9zJ8NRJh9IXmmj12oXcZDGk5bGBAYv+QJa/AjSSwqjTH6OdtaEtrC6qu7CZZhacxM0ql6xjzsjur/P6UONvyDKKq8YuOKuzaveDx+DadyFz1NUapnuPy3VXNkcs28gYR+/69KIzbHqnpmHt7jtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jm9Kxw6khEpAync3+bOAR7uRSMyYPdTvYb1C72osb9c=;
 b=Ee0rSr9hFiJeOFmP5gfG+l8fcPrEAT+yIA94Xg3hpA4DfMphPaw7AIPPyNf5MCxE4ICAcZ/hHgDLqY5IELOF7RbDNBXdvhTqs778quMbsfBZhRhUtZsEi1rnS5sIs6NGYwC98+8SneUcUbE1IapzFew9ZTfFvNDfZLjQb0plG7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11220.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:29:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:18 +0000
Message-ID: <87fralza1u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 172/292] ASoC: codecs: wm8960: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:18 +0000
X-ClientProxiedBy: TYCP286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: b17ffea0-8f49-44d3-35f0-08de20b959c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gZkP7F2K+0xV8M83o9emov8KZROklEkK3s5PiylUQHDSDjldAZvhKB6BS6Wn?=
 =?us-ascii?Q?ZXSapLSj4d5faUvXgmpsfT7x6gMTQnn76IXYkWYbnRrNoD0ElgL3bU3/F8du?=
 =?us-ascii?Q?DlbyvUuZx2UjBPwzxNjEQ4onX8ZZrfi6cR4xY1HY5gm5AeSVXO5T1UvHXxnq?=
 =?us-ascii?Q?7xgEq44XnGZeKfzSMrcrO0NIsMHE/WWW91Y1+Do8PUo/FKhud6YkuUqfaxHF?=
 =?us-ascii?Q?e42vG61lqY605prFSPAB/JQvoxXRmfIYHuFks/qnyFk6RaYGzARWVsXFiyCS?=
 =?us-ascii?Q?sFnJzIEk7MZd1V+Zs0rwFC4ZtqM++I1ORTDlsIA9D6WTUeNaYEA8AXOwKE6o?=
 =?us-ascii?Q?Oyqb7OjFCL8iiC1iNvbkno924xGURLrJWENU2HLtZ6MnZhVescKyR7XQpOCE?=
 =?us-ascii?Q?Jxs+EeGhhMJqCIlTYto6jBrILA9IC1ybdXVLOc89OAotqoKGRv1dWFt+ehdF?=
 =?us-ascii?Q?lHWnscPs3LsFD9QgWh2EIuS8QNVEcT0bnD1nRzFa4si1XXx2BQn0m390YANf?=
 =?us-ascii?Q?cRkqCcn7Uc46t3QnWGI0y+1zxdfB2f7BsUv9y8j/Wka2lQ4EqqMBMj/qRxS3?=
 =?us-ascii?Q?1nqhYR6hIh32mlF1z57OduYZ7KnYKmTmTcZZD6FhCNGecul0Yg2XCCjjJ99n?=
 =?us-ascii?Q?fGqKmV7rKfKWN26TSEls6lfGUkjfENpHpNA/i+5xHxJW5nOh9n0JgSmBSOgn?=
 =?us-ascii?Q?3JtOsuHd//AOVV6lddpuE366De6SeeMzZMhNUxj6LJLYQLUL38cIetYG0/xi?=
 =?us-ascii?Q?lA1W7HdfYjLPAT6UefLuingjSCOpjhlahYXCCWP+gQXtkG3wRoRKwVVhecqL?=
 =?us-ascii?Q?zEPYsmBp+NsfP+l9F2ZrsCFcrR2mu8tJRKgTq5srEcZ1R4fpNvaIiJSfPr55?=
 =?us-ascii?Q?g4Cr1QCxDfMZan7nQp+fccCP2W7xnXvfgnM51PHaNm/cfEgwP6c8fv1ttlGt?=
 =?us-ascii?Q?rMHAKTXH+iMPHlU3Wu7Zr9HbnS+NAyDeL0sppWb5gqqeu926Szr2cHMfKqua?=
 =?us-ascii?Q?bNcX6vamXKT8Squu0appt4JQ67s2J34QFkEUs4qNP+XL6TJvV7Ua1nJhSV1s?=
 =?us-ascii?Q?kT7MDhZE/OBVKVb1z2RnkFsNMhaV6czSa2DG6AoGjcNqIU8pxcwPTiAPaD5F?=
 =?us-ascii?Q?46AGFBd/6NAh/Uux1glmmNTTJAZBX19UB2huqt0XKs2Hp5sCNCgEZUXmdOYE?=
 =?us-ascii?Q?gm2vNmRmUbK75NO7lkMpKRn7Bnesl62zr1wdMXeXR1wKvPFIq6NEde8gDHU/?=
 =?us-ascii?Q?YApxrE0N++S7f/5nH4gN2kZRPkcnTXtFvFhCkhYJkncNnLOLNajzvTQve2gk?=
 =?us-ascii?Q?zNH7k+f8lsxTiLY5zgmdAPXMVzyTn81AbY3zBNcX+BKAQ92z6N2K74l5rsqz?=
 =?us-ascii?Q?ObiKije1DgCCLeAxQcFkm3fKrwkvVDAjZ6NFayAYxeP5aLeRq50mRivAz7Ld?=
 =?us-ascii?Q?295eUSKCZ054hlIDFHB5uhMzRX1WrOnyHySFDI/cAy5krWoMmf5DF88awNEm?=
 =?us-ascii?Q?omocsarhWkrdkqYaHav6JBIZCe6KPSpqRTdb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rrLFS4XefSXkD4W0Ivr1iL4ITD08tDD6niX4LUUt3FZEM9RLhrjDK6Avs/b3?=
 =?us-ascii?Q?9Ib2pJRETay/2UMFYPw/Nnn19O6TQAkDciyrpTRDdkTQ44/gSZPmfx5KQiC7?=
 =?us-ascii?Q?aztCZKmXpDILSol+lzwOg8ce3OMc3gOfn6q2pWEirhwuXo19frjKQu6+wgfS?=
 =?us-ascii?Q?fmzdDkh4lU9biC+sAOsMn2P+zQEpleGVWs64OhY2saztf/xWmWe1fzZDJAeV?=
 =?us-ascii?Q?28zVbbiGFTSRpVbHV+TrU0zJYC1lNzWG/6cjfxtzPEn68QGc5UH5waaMPnBu?=
 =?us-ascii?Q?q0+5f/tE/C5UlZzRSrWzqveJSuxfgtLzbNEdIUfS8LO5BjAj7FxBO9dcGVsR?=
 =?us-ascii?Q?NrDTvbFTPf1Pg/P9/QKhl32Qzts+zBmRNfyOCu6rW25l44Xd3KJ0fY8E4xXH?=
 =?us-ascii?Q?YYknfLbZ09cZ+afd+8Qb7FnO7mlTq5OOKrgntPaupsrcIiGth/suffaBsZrQ?=
 =?us-ascii?Q?P+ghiYeR5c/utHMYS6Sm0MwgZS19uTFzWd/JBmPCZgJcpdoMRRpDx8mR/ng5?=
 =?us-ascii?Q?zAsvWVXSyL92FzdtuVWyZt6E5c6kKNMcWp76DbY2SGABEu8tr0n4u4wGs+Wq?=
 =?us-ascii?Q?12ARTeEoUFKgrjRPOnMHEZeAdAbslq9ejHiIrnGrirOnkyeWm70l9KUTKzmJ?=
 =?us-ascii?Q?TO4QKw54uP/O05H4JSH6LzwwIxBfjIHKD3aMFYSNShZ2RXUmo+lel/TN9duK?=
 =?us-ascii?Q?afUL1xvX/RQqeF6Je7FX/CA/SA1ZMm+xlMI5XXpSv+QLXvT13tkq6JXDw3i6?=
 =?us-ascii?Q?qnYLdgfxUovRukt6mmkJyK/ncEW9/IJtrnICFx47T/u8lWvOu2ejR5NeULUK?=
 =?us-ascii?Q?MxL07IywNVGTmhj3mSmLgDeE63gAug9+i3jvSKfBpfWoVcTVLYHYBmxS8M/0?=
 =?us-ascii?Q?guaK8DY0b4ru0XijrTWl7E3RedeVSslQrf6SlJvzjD4e387hAaA5uld8B49P?=
 =?us-ascii?Q?52+7z8UsUZLWQYVxNskTVYdoxutr/5A2EsBY44NzG+3g2MTdU2Wgq18FLCiI?=
 =?us-ascii?Q?Hmr/JcF8MMwpeBwHt2ETIV7kDy/jbdshywQdeeT67MILY8FOHQmI/m8Luu0p?=
 =?us-ascii?Q?AcKcg6mZVDZoKvOzQnqWfALdNxfVT2HtJ03ai/bcHzY/ViCHuQKaejVnoMDg?=
 =?us-ascii?Q?E9bhl5goUWzi8GTwjaVGLeVhfuZ7zLTEZ/F5ORIr1XgfzGXQ4rosacEIA+Ld?=
 =?us-ascii?Q?w3aHmXwYAaRIoFVD38Bd6/fU6DT8jktPkGQRmTlVc0armjYtLjoCx3aaTIkX?=
 =?us-ascii?Q?DEqtMw0iRo81yj9ZhTiXmdhsfqdWIjFbyCEW4sTj0Yu/W9f+Us9KTodr7ePQ?=
 =?us-ascii?Q?4hWM+fG6Jiem4gAGo+GSCyqc+9skvYz9oz5E9tp79nbVOKHtvpmmIag7fljv?=
 =?us-ascii?Q?QpJfgeeDBWS2+9lpHFKBKjUaho89mJ7J1j2DYncSqHY2b4UGDrAnJJDKxXdN?=
 =?us-ascii?Q?2cPoZ4hzBXtpo2jh6ZGUC7vjnpjVXQj/A0mE1IlRPRyfWBmroSiFnoDrm8hK?=
 =?us-ascii?Q?Ls5uHBBwEfR+lzyJnysB2ae+QE7TsvOuwjGP+8RojjLJqAB9UihCQCIwhB4o?=
 =?us-ascii?Q?ZUOnbCzLKHKkVVFXlvYIMNueQwVvfieBUZtTJ5/m4ADH808dqisFoKvGu05j?=
 =?us-ascii?Q?vMksaF+c5+GD1OVMvUcakTY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b17ffea0-8f49-44d3-35f0-08de20b959c9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:18.1662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: palkZtlB37+TbTBmQUE6NYIHAdgoygzRrf6wBHW1dx21U1VYurj0G/L92kQE5ROLhxT93p1YWu0z2LG1jEnvtkRtl/TlSfHmx5JnZGWeH3vaBSqXIrARtlixcgfZyinz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11220

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
 sound/soc/codecs/wm8960.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index 740c3f7da2a50..384e8e7034468 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -488,7 +488,7 @@ static int wm8960_add_widgets(struct snd_soc_component *component)
 {
 	struct wm8960_priv *wm8960 = snd_soc_component_get_drvdata(component);
 	struct wm8960_data *pdata = &wm8960->pdata;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct snd_soc_dapm_widget *w;
 
 	snd_soc_dapm_new_controls(dapm, wm8960_dapm_widgets,
@@ -913,6 +913,7 @@ static int wm8960_set_bias_level_out3(struct snd_soc_component *component,
 				      enum snd_soc_bias_level level)
 {
 	struct wm8960_priv *wm8960 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u16 pm2 = snd_soc_component_read(component, WM8960_POWER2);
 	int ret;
 	ktime_t tout;
@@ -922,7 +923,7 @@ static int wm8960_set_bias_level_out3(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_PREPARE:
-		switch (snd_soc_component_get_bias_level(component)) {
+		switch (snd_soc_dapm_get_bias_level(dapm)) {
 		case SND_SOC_BIAS_STANDBY:
 			if (!IS_ERR(wm8960->mclk)) {
 				ret = clk_prepare_enable(wm8960->mclk);
@@ -961,7 +962,7 @@ static int wm8960_set_bias_level_out3(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			/* ensure discharge is complete */
 			tout = WM8960_DSCH_TOUT - ktime_ms_delta(ktime_get(), wm8960->dsch_start);
 			if (tout > 0)
@@ -1009,6 +1010,7 @@ static int wm8960_set_bias_level_capless(struct snd_soc_component *component,
 					 enum snd_soc_bias_level level)
 {
 	struct wm8960_priv *wm8960 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u16 pm2 = snd_soc_component_read(component, WM8960_POWER2);
 	int reg, ret;
 
@@ -1017,7 +1019,7 @@ static int wm8960_set_bias_level_capless(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_PREPARE:
-		switch (snd_soc_component_get_bias_level(component)) {
+		switch (snd_soc_dapm_get_bias_level(dapm)) {
 		case SND_SOC_BIAS_STANDBY:
 			/* Enable anti pop mode */
 			snd_soc_component_update_bits(component, WM8960_APOP1,
@@ -1100,7 +1102,7 @@ static int wm8960_set_bias_level_capless(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		switch (snd_soc_component_get_bias_level(component)) {
+		switch (snd_soc_dapm_get_bias_level(dapm)) {
 		case SND_SOC_BIAS_PREPARE:
 			/* Disable HP discharge */
 			snd_soc_component_update_bits(component, WM8960_APOP2,
-- 
2.43.0

