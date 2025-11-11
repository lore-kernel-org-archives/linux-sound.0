Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010004.outbound.protection.outlook.com [52.101.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EE81C3C11
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820772; cv=fail; b=d67W++lwv8NIwdIOpadnphYQTM1dC28lA+u0hi3ejvZXdOZZNBUrHujBrlo8kSuUHogg5kj0Wk/NC1UgJVDpHcxrABZsMekx4lpvTnvJjCCz+f5ugZJIFJtVp4rWCyJUGn0Yw3Y9kiCAuVaXC4iny9KJFJk94ynyVkPQMZtDb7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820772; c=relaxed/simple;
	bh=TTiMtlU4jwvjoAz8tbYaoYi68Mp5Lbj7q5EhvQxL9UU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mC3ihoXTsU9GZeOJZhmZwXxDjfC/9DDGuafrZoFolMy53Puw+RJyLYgnEszVCDoqIVuzFPfAsZqTSXszPLaybFpUTlZ3/DUC6Y3rlHw9FayjpjFfd5G/Ry60lHUl6Q8s6cEfD8zzWJIOwdD/Bm/wJC6RKuGkXGDFC8GZPTNPrxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Mz/8H89r; arc=fail smtp.client-ip=52.101.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Mz/8H89r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVSy/qIFvSQ+Ws6ko2co0MVFvklJJrSb15yhUoObWD35Cp4P5csxI3DV9ErA6XQ/otOIy+sUcRnA57ppuRqr9noYdRzhgcTbbgtaZYWKU4BmyQD+dR5yc9jbhcmaRxrIQabaepfTYQEiP2lZnPp10Nu9ottSBIXfVDAkQNuodsNDDJF87mc+kIu9pOgeCDBae4TwU2cwcd8zf/DyXf1P7K3RGpyxeqOddUXnnZV0Gcvrj8Sb4IGsZs2UY4pK2hzWIsPH4gX5yQTD1nmQ50UHu6pYobiZdywYTA/H6o96zrwqvafShcl1ReKssGg5PNEZdNlgn+vbSJnt1zRLDlwzbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJK7aZT2+IJFR9HyxJEWlwnKYbC4kxwQ2AB3f9Lel+0=;
 b=M1mEyyEziBq8UjtWECwpdLz6KL5hEgY2nEVZismUfMWp0Kb6GxxbeaJFHc3N5BBDBK0GrTO5akOQ2sNaMWWd1t0uFLGX8KcprMMRQPwaQIXh0kMvw369aFEY8Q/Z1GvZdOJpIf6Z4oAPmjjar0I7aKxpW+QSPvdkB1QLwQa1AqKBMNdfuBBIweHtmA7WxT6RgcYmdeVw2964ZGEfLvcEMG0r1AXc8FOJ52txe0DmF1F0tgi0pCcZ7zfuqw+a6ElbKWLbjtY50TMvKj6BF4AFp+XOj+76CW+xPJt40YtLQBj4IQoepk0oYv20MJ8othbmyKchtJAl1eWLSmbvmZ234A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJK7aZT2+IJFR9HyxJEWlwnKYbC4kxwQ2AB3f9Lel+0=;
 b=Mz/8H89rXX+91FRA7EoV0gRSi2XlzipapBA6ucTUlslnXfnNyFaVaA2hKt4g9mSu6XAfmB4Npv7aBsaHPO0x9Qll6i3uQlRd7GrBrcyEo8Px70cITReyR2BWLTbkvWoYnzLqMFBwlUPkujJJlJtNQh82QIRt+PxtG0CqBa2+oQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14439.jpnprd01.prod.outlook.com
 (2603:1096:604:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:26:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:26:05 +0000
Message-ID: <87bjl92z4z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 125/292] ASoC: codecs: rt715: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:26:05 +0000
X-ClientProxiedBy: TY4PR01CA0081.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14439:EE_
X-MS-Office365-Filtering-Correlation-Id: c48484c0-10da-4e25-70c7-08de20b8e70a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2Arn1d17AjlJhWeTca276prcBJtJX/QLpfOMky2eqm7Pew5UtoAZLwleyjzJ?=
 =?us-ascii?Q?PPo1AQfI0dxhRHfZH84veqQYmYGfmOYcqC3UYsnlpJiqdjmwurPxmVMQ+uid?=
 =?us-ascii?Q?LC3edTVYncTSRBbkygHIVHqxxqTLStlxzacXSWvPh3aDnmHF6yWHTuMw0dGg?=
 =?us-ascii?Q?qDHrJ+oRB6guKbXKHwRu/R9yfKEgXd/2tMxkWfoUuyVT4wgHUFPIhpzCZaLA?=
 =?us-ascii?Q?Yp3WT3f/gzJAeyK3zA2ngtQ74uOcMWA5wBimLSqpO6LfpK+nUOE27zB9WnPm?=
 =?us-ascii?Q?/SYR9bm7xkYE0E/kiRrPNin+gt9k6RNCU+gsnEsdxD/q8QmdG47cZmpJnozk?=
 =?us-ascii?Q?AA3KYIbKYxK7aJ3bj1NKQKR/h5JJRPLOSuu9PwrMnYQnxvB22FiQcU4nxPNQ?=
 =?us-ascii?Q?I1u8lqbF49JqaQzz78KXPQWVOiykYjP5M+eAWAy2LC02RNqqoTo5RsBw5QYy?=
 =?us-ascii?Q?oM+POVCOovUw0STspfpsWvfNnoXQw2krf3ln5lxDnMPSq70Nipg2jbkOvUsT?=
 =?us-ascii?Q?v0S8MxX+O+GrT2/d46kvx/MYf869z1Zd30MBILoBE2+Y5iOCb9LxUbnHqq35?=
 =?us-ascii?Q?nBDra0EEXgJSXFPFNaN6FDZgjMOJJDOs/tUVIQNR0OEEcM8MWsp5JreB8QoF?=
 =?us-ascii?Q?8c1Bp5ZPYSFN3CBkFt/NUjAn6NX11TJTIlU6AUkyV2IVDdXFyvoSTm+4xJ21?=
 =?us-ascii?Q?YwDdagH57PCtHWkmI9webxk7Jm7w9Jg1vEMOELOhh88Ni79spCsIo2KJXbe7?=
 =?us-ascii?Q?FYjI2/Fr71g4Evuz6CpfgbP3JFdxw4L1Aq1/fYfKoM4UEby8DEw0Y2o2/MOB?=
 =?us-ascii?Q?VjJRIqXe0SR7jdHK6lAfRwu0lb+mm/fSB2VuseLY2Aj45jXgwNS99XstLqI4?=
 =?us-ascii?Q?DqYtwhlyhdN5luBLw3vvr9+tmZbAJPmrlbNHa1EHT3Q5YD6EkcPgKNWJkDtw?=
 =?us-ascii?Q?XbSd1/m/RDBSjyFREy+MTHBXjepaq7utlEmVlrgr9QblsIT2tT0v87e9PitB?=
 =?us-ascii?Q?g6ROgdyM7/Dw1SP0gWv0RFxPtmelmIRXOvqjt9YWxEgTt8R+bpezKHN3Qc2Z?=
 =?us-ascii?Q?hKzFDNj0NARt2t6JPYXirwdvhz6PGzLoB6x4EdkkjtIarCLK0hvhxXw9vDaO?=
 =?us-ascii?Q?RBHTDj17jJUSBPnP8wPel5OQbfZnvtyYPx/eCu5/nHxDpmoInI828UxsoW6g?=
 =?us-ascii?Q?p4UTwAujMkH9E5Ao5l7rI0aYbvo0cfaym3Tu1bJseXUTDAIUQUbPBLH3tNnr?=
 =?us-ascii?Q?qg8hMdhqUCDpGCldr2pGIRxJjvjrwsC2zbd9OssnPL+wlvo7MVVLPlzvcSvB?=
 =?us-ascii?Q?6Jsu8WUm/3MdKsgfYcqggwnDxOn+h5JvAXOkNEXgIZWK8KSj3O2/ZYHXn1CL?=
 =?us-ascii?Q?WJOBq4gPylQSicxlvuQIcJOnO2D3aqV/S6KBQwxsoBACBIvVjPmOh709ZcFS?=
 =?us-ascii?Q?Pox3ZngWvcoFiRr2XdqEReTi33jef2Cw5rTu6pe5Dsex6iBPLQXkVTYVfcNI?=
 =?us-ascii?Q?EcxdOFWimGP7lCLuuaSHR2XzTWt2nG2nUC40?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GwM7SsA/3tnBkxLmNcenD+EFcR8eaDJbfl17MWDZphTG1I5Mfh9x5yXOCpCO?=
 =?us-ascii?Q?5QgFf6c8FejZgotvr6mye30T7BxjWB1maBSUzWikaoIeSq5k5JjcJ2XuIGbH?=
 =?us-ascii?Q?a9xsY0MriWGWGb9rPsViX5RUedtbqU3oK4YKQCuC7Gp5eNAmvHT3YbVzDtR4?=
 =?us-ascii?Q?49vv+BJg804Pg6A9L+NICgGtqfhJz1k2hv7L7sT5XExvIaMUJ4LySP3PQjS4?=
 =?us-ascii?Q?ipOYaWSQQpnOMxkIrp5XEzgnTTh69n4qqDHytvszi5A/v5CzTNngw37B8BiK?=
 =?us-ascii?Q?sQ9joVJvwyxssaztjPnR2yB40OzKPBPXtWjGtf1U83PJ+yU6Dei6tvXv+c6I?=
 =?us-ascii?Q?h0kIJq/R3DcF96uurfOVZaHKpvldT1FP5XJqEYkdKH/2HXki81hdPK87EVKt?=
 =?us-ascii?Q?6tLqprrRKJKP/wL0XtzIJowEYct1N+D+4ml9M2bQqC68YkWQ+t8UqaoZWyYb?=
 =?us-ascii?Q?l7H4VaR3Nvmk0FgRUM1j3fD8w5JadqObomPLcEcEEvbIHb7JDwT09vx/pBPT?=
 =?us-ascii?Q?metZmk4Nm9AEHfx+QPu+JYjbmu9dzWfiCum/NadUqrJMXgU472zRoUWCQDJT?=
 =?us-ascii?Q?nQCO4dZuCtK3p/Uyqyf3gTj5uXWgE8cJuqmG9eToPhQElPC8zS1WdlqAWJuD?=
 =?us-ascii?Q?CNf1kgsopzjarnhG/TJnvmGRF5mmvzHLpRW8odfK3Lx8WexIXoqyoriQafnh?=
 =?us-ascii?Q?AnDYR3SvxNZy+O8Beoiq76kmFEiTI4qoTOOWzjlf6WTOf6qcHtzXUoL4thC1?=
 =?us-ascii?Q?f1s6L2mWskPqAev//QdwZ0G2d2/HQBnlw/4LKWVYiECD7FzoCmMJILZZDryY?=
 =?us-ascii?Q?vz05rAVyn7PMtHQ9Gs2yG7gsJl66W3675C9UU6WMaxd/NbslKv10rpvC8KvC?=
 =?us-ascii?Q?D8P0sVfP2qmH3r/pqUDnNZBk6d8wkreIuA9kt0eqbWWuxwtsYCa2/1uBHmA4?=
 =?us-ascii?Q?FZu1eOHhJLDibkZXNMJuGOu1WDrx+W+2ixDjJSqn+WjyNqJIlFqFdJpfU9Mq?=
 =?us-ascii?Q?Bn5CfwKnk2DpVPPG2+k4deHQ7vDVkVU8p6X3NZrULq4R2StjOkr3YXaNVok8?=
 =?us-ascii?Q?4M89gRErWUImFC6Ob+PqkAkc7bOUX0kb9dqyEn+gB5MDbyxvaJE+vI8bR4xr?=
 =?us-ascii?Q?NKQ9UaOM+DjyaJwzuO5aKikfkQjmmRouX0v6A68XZDHFxuie9+5KqJczvdoR?=
 =?us-ascii?Q?pL6WCQ415x40kq9S1oDN0x9ZHV5W1kPNMBAe5FLyFGLg/9ybj+NAIs6K9dWm?=
 =?us-ascii?Q?/kPUGi/oevq+hG00deYw5Zm5fe6JeHClGQRoQSwcYd5ywXTT+3t27jMWiO+z?=
 =?us-ascii?Q?1ijDRH1lj68ejE43y/CqnshejpsouhBPEEQMs09JHA8D7OntjZcM6nOIrcE/?=
 =?us-ascii?Q?5ZzPZxmqmef1bKj3+onHl2OtQtA6313sc4wQYcdRVo/keuIQiS5ZknwGt/Z0?=
 =?us-ascii?Q?65JOgmjkYgHavWvmneTN6HX9QdbpipGaprUHm0bK/LmCG+XffKLjnfUJf6gs?=
 =?us-ascii?Q?N3ZK/9cGUMZNdFd3DpfnO6U23C3c52g0zwtrpuR2ibcwp3+Dl86DUUDuM8Nj?=
 =?us-ascii?Q?uYBuLcJcPR5jt/Y8pHjEPDwmJD+zaONs87gv73llWOeqUuxT2yUWM/Ny38Lh?=
 =?us-ascii?Q?FD4gjv31TnsBYxKVxEIiOdU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c48484c0-10da-4e25-70c7-08de20b8e70a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:26:05.6364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDUKIvZJsKzp/snU9e5IHeTA719sdo5zhBapz2PTLqGg5Y92U+B7zDEhOMFdxoRZ5mR8zHEMj5ie9gG8G5JcFLR1WJrk+q556lsDcsWzqDmBOcBRsHpVGGLp4UqBl2ZP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14439

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
 sound/soc/codecs/rt715.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 7e1628a5c9d1b..0881826de2f16 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -125,8 +125,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
@@ -152,7 +151,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 
 	rt715_get_gain(rt715, addr_h, addr_l, val_h, &read_rl, &read_ll);
 
-	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt715->regmap,
 				RT715_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
 
@@ -206,7 +205,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 	}
 
 	/* D0:power on state, D3: power saving mode */
-	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt715->regmap,
 				RT715_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 	return k_vol_changed;
@@ -250,8 +249,7 @@ static int rt715_set_main_switch_put(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
 	static const unsigned int capture_reg_H[] = {
 		RT715_SET_GAIN_MIC_ADC_H, RT715_SET_GAIN_LINE_ADC_H,
@@ -274,7 +272,7 @@ static int rt715_set_main_switch_put(struct snd_kcontrol *kcontrol,
 		addr_l = capture_reg_L[j];
 		rt715_get_gain(rt715, addr_h, addr_l, val_h, &read_rl, &read_ll);
 
-		if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+		if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 			regmap_write(rt715->regmap,
 					RT715_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
 
@@ -322,7 +320,7 @@ static int rt715_set_main_switch_put(struct snd_kcontrol *kcontrol,
 	}
 
 	/* D0:power on state, D3: power saving mode */
-	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt715->regmap,
 				RT715_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 	return k_changed;
@@ -358,8 +356,7 @@ static int rt715_set_main_vol_put(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
 	static const unsigned int capture_reg_H[] = {
 		RT715_SET_GAIN_MIC_ADC_H, RT715_SET_GAIN_LINE_ADC_H,
@@ -381,7 +378,7 @@ static int rt715_set_main_vol_put(struct snd_kcontrol *kcontrol,
 		addr_l = capture_reg_L[j];
 		rt715_get_gain(rt715, addr_h, addr_l, val_h, &read_rl, &read_ll);
 
-		if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+		if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 			regmap_write(rt715->regmap,
 					RT715_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
 
@@ -431,7 +428,7 @@ static int rt715_set_main_vol_put(struct snd_kcontrol *kcontrol,
 	}
 
 	/* D0:power on state, D3: power saving mode */
-	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt715->regmap,
 				RT715_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 	return k_changed;
@@ -546,8 +543,7 @@ static const struct snd_kcontrol_new rt715_snd_controls[] = {
 static int rt715_mux_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int reg, val;
@@ -577,10 +573,8 @@ static int rt715_mux_get(struct snd_kcontrol *kcontrol,
 static int rt715_mux_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-				snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int *item = ucontrol->value.enumerated.item;
@@ -752,13 +746,12 @@ static const struct snd_soc_dapm_route rt715_audio_map[] = {
 static int rt715_set_bias_level(struct snd_soc_component *component,
 				enum snd_soc_bias_level level)
 {
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
-		if (dapm->bias_level == SND_SOC_BIAS_STANDBY) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_STANDBY) {
 			regmap_write(rt715->regmap,
 						RT715_SET_AUDIO_POWER_STATE,
 						AC_PWRST_D0);
-- 
2.43.0

