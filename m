Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8C9238C07
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821392; cv=fail; b=soNU3/QlifxOfsPAuo6IPykW75jUIC/JG+vPU8TrLHpCNaYLUCx6nfyRKIfujaT604Kl1hWDSU/OQcCgsFs7/dtc43L9tqwvyaw7q/Q3dCDeMtIPOS1EFrdCBd/5j5/ccQGNPozyhl2XECKU6CzFA8kpj0k0nTRC2++UP8tzz4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821392; c=relaxed/simple;
	bh=t3VVzEt4ZdJTry+8vXE5YkYcBQTv2EUk8JQw6CFEMwo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dXm3Ak/Ood5uN1I5tSxkSk2jUo1/rK2i/zm9Q5aYehd3fyMuNr5XwSTgk2k6d/JkPkrYvSO05T9RNrr0PkGbGxg+Bg4wpjyTUurUdUjk9ZapOWXhr4GkX087kPwUIhFya+KLKw2ck5PdG1QDkO+n0Io+nxh9KW0WrqpNm5siITU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fqSXQrQF; arc=fail smtp.client-ip=52.101.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fqSXQrQF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMRKBTCrqnKmDnI4qEdHEsZEPXaqQQ168jgJE5vQj+2kIO+lvmAehYcIRpnn5Yo5HNVoV2xWi5SGmBKLATaEassMRD7FXARGY39nNsZTy21Tm4IIsFoz0OgsxUkewWPDAYNNBRyxS8Doy3RQzSlHBd7nq31BB0Ivc+YXBoMgbFXJdtY66xkL50BVjloKWJ4XfNYpiWEJrBfTxs7ecvWWG6+fd0SX2GOdUAvE6GlyLouDKvZ6Gst8l0rU77NJ2JiFbcx9EBPwyP5xYxkb+JvkqsXrOfEBguZTU2PyW/YXyVHGa3OxueJ9p8hXRAKpOUp7Ep34rOpw1v+gswzp6fP/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWQcrEv0Dn9eV2MH6BuLccp27SGFtmlZLT7Eohvo3M0=;
 b=PQMQgElXw0M4bT8jTgk19Csxh5j4/0jbJEMvfJWltTFQLrg87LHBfDk22QFmcqUypWorXeIoxrKUjORh7CUJbkXLrL3BOAk9jBGRq5NoB9egsVlYRnhZ6Z907gpoA6vPd+rsL0lrb3YdVY6N4z/BGRLRxKR5bH6gjNZyZ8sdhlOxA4ecGagMwC3E8HIEhtgDnDhyAwzjM6485SthgIffGSJ84jk/HxYdWdUI/DHLsKnGeZcqXB0S5UvyRIWSC9RAK2zDeEU66CsQ2Ogoei6iBIzGJ4Bjx3An8EEVrR6178AUkaPfW/ceE8ncxLcsi9bCPGQy7LBhxTCVwTtf8rD01g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWQcrEv0Dn9eV2MH6BuLccp27SGFtmlZLT7Eohvo3M0=;
 b=fqSXQrQF7mp/131dMA67T56v3DP/oap8cSnl+MXN+potDwS9zqbALg1d9wG38Z1K5n4sw04T7R8sl049k3opO/tSx+uG8ASCv7N8csGkq8oHV41MKENDO9/zCLp/ajWlDop0xSGyPTODzs22m2ix3lGz9GAJoXEDWWhVFLOR0vU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15789.jpnprd01.prod.outlook.com
 (2603:1096:405:2c6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:36:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:36:28 +0000
Message-ID: <87a50ttng3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 276/292] ASoC: sof-client-probes: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:36:28 +0000
X-ClientProxiedBy: TYCP286CA0305.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15789:EE_
X-MS-Office365-Filtering-Correlation-Id: 899372e4-3c7a-49b4-050c-08de20ba5a3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LTv3hEPuz5O7XE4aIinicIpwUwSpqUVJAWWYxhWSr/YR/Ef7Bh+auSdXwqTI?=
 =?us-ascii?Q?kxhcN3OZH30kuq0iJl9Q6+1WWkZVstym0Dga8QtE+ccZSNTLBJUdKXXdNMIN?=
 =?us-ascii?Q?nm7bwI8hUmpyJsUoKNFrqKkYzMRXckttA76NsTNrI/reP6GhSTMyDQ8j3JKh?=
 =?us-ascii?Q?lHgCeefr6/uMHwfbBcZJBgovB+wBOO45rJvp7+BVRW4JY7XWw8YPvXkIQ41k?=
 =?us-ascii?Q?wnjLLCoQI0cSem7M2MOalYmfe0s0S3WQRwiSXrff/fr+PfQraILrRQNxc9Qx?=
 =?us-ascii?Q?9T23eUCUPNK3ikgznAK7JIEuWiRS4CfUrFc2Ff+5YHr9dl86AdNIjcTg8Wjl?=
 =?us-ascii?Q?YlXMIxwRGGNciQxaHszvbquKWM0vMMSlYmpLCQbch1lZWNTqkmHdV5aOWDZk?=
 =?us-ascii?Q?D/0KZ7BYMDdLWp6OQdqEGsBx8tyv67a+SYDM5F29RZND0CW5nDdNZKGwxckx?=
 =?us-ascii?Q?zTiQMk2i8fvdOXaJqgaPLiN99rAFQPhNVUf46tMh6NvQlU8GF1PknycHMsZY?=
 =?us-ascii?Q?cFuOUF/NEj5XcNwbeGrkkIkIV1FMMTYmd/7Cfogob3QCKQHKuUTtRuSYcjYO?=
 =?us-ascii?Q?w6KcbRdg4vV+qySehizpVoXLSuYrT8LyWywfDZbO3njapVk+n0ZTR8ucxdAA?=
 =?us-ascii?Q?cWMxeByYIXqx0B2CEReWsit8CPjAp+WQugvrM8wdHjEDZ4OAy3poBa9Shj6+?=
 =?us-ascii?Q?bLIsWrE+kubiM8hJhxMm6cPII4IRuIOfkhVPfL/ZVgp8/HDF+rEpg/zzQiOg?=
 =?us-ascii?Q?A2754PMvU3Ek8HllcvZjTe9DznoHM5EgVeNbNgn83cwVEJQXseClWup9BA+Y?=
 =?us-ascii?Q?jWeRCd1qDIFAeK4mzMqrUoC837geFuT9jn4VHZqkGnZmOFB97KzeqP6c5clY?=
 =?us-ascii?Q?S1L4rt53bawN3KVhn/lK4DN2bi36hNtT3uDtIKRgFcyVLGbLUJcJVCyUdBEC?=
 =?us-ascii?Q?c15Iky5cFYqRi7/1R+nYwR+HPKPoUSUdr2mXY4HBUz+xGhnG8aQ1yB0NEab0?=
 =?us-ascii?Q?MLt+DjPMM2b2/bIDD808trjiWz/fWnRMyTR4eRJ15yeRym7+m3fYYyko9roS?=
 =?us-ascii?Q?QcjHltITQjriUCt/HwOz5lMGMAiWgCK6rwAOx80NRtHdpvNoFE93isgSREaw?=
 =?us-ascii?Q?xdMXMGeh6BPWujHPAkRKf8vt386hQ3FF5Nq1GrA8UzSqjg2FPPKkFgOAIFyM?=
 =?us-ascii?Q?6Q9/bV3UihpOtue8ftObEDOwoITEvAlsGkr6F9vU055UFNB5DxyS7mSFEF6x?=
 =?us-ascii?Q?C01XWErd/clgPL5F6EKpj3ZR/vuGlWgN/97/+332lNN4u/9kOMFNwtYoe2VN?=
 =?us-ascii?Q?iyT4YQMsebsnHsota5jZFtjS2wCHt8qFeJeCmwNDIqfpJcxpYJMGyNLUem5g?=
 =?us-ascii?Q?6r8cMJ/OJ6s7unmUiRd+Ef4ENXsDlf2j2NH+7k0PZlg0AhMErfRsvsvrJ6xP?=
 =?us-ascii?Q?6szoKkMYF9JXC0SSZMqhP0K9oiGrL2m+lbKCrbtIic1xk9e0wwtCUHOoiHxq?=
 =?us-ascii?Q?KtlIPhxxlLqa+STtWilHOrpF07iz7WFlctbX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xe70Wn8uLW6UzUs7xkDw792eut5Ap1hgtnzIOi2JrSMRoCoHZQOy2hhUn9O9?=
 =?us-ascii?Q?66HMBbuQWpL1/D/vRKDOKEoHVEoTpSRbyYTGHNjlOxNU+QJjn6ZhsQmK6yQJ?=
 =?us-ascii?Q?EvGimpZ9+odhk+lw8HH0E7alnjHl/kcSP42MSVnn4WBlZdFFL/kIn30rle3j?=
 =?us-ascii?Q?dj2G5ysg0EpM+GgGigEd2B0gp4nIINRjn487YP8qmQM4PDerlKvonRM7HQmZ?=
 =?us-ascii?Q?IWj/ywzvsfo5tP/DRLLCKUCFOJwci2gBLX4cKzUNx7hPcnj3QIi0qGrKM6EV?=
 =?us-ascii?Q?umlbbD8ODuzmZQeHl7d9/HbrfDQICLzcB37DEfhCDyzuFCdCtxKEBM/bfZ/V?=
 =?us-ascii?Q?Djg/GE9AGuiDtPGFI+XFuSiOU+HHJqp9Mfpmi8kqSKUz3zESaPPIpRisQv3u?=
 =?us-ascii?Q?V9mqwIO8jHPUOuR6Eoi0EeqR0znxkr6dukBgUl0cB34dQrJ6W2NXRCynXYuh?=
 =?us-ascii?Q?5u/nKiPryRkkka/u14i/O4BTVYO+4XL2x37jzXP+PEJExP12iE50kqPqjhDO?=
 =?us-ascii?Q?viL7lA1S1/KzffRHeMWlWfwbrsuWC5gQei5hHVTzSxp9nXI7vOm2ZScvBoLx?=
 =?us-ascii?Q?XKd1arYXaVKCXlfHwzV6m+ESou6dEQLTjAgt/hqugV87MPHa4ZBmXcC6Obrn?=
 =?us-ascii?Q?x9uPA01hhjBo05Duu4roRULDJeHzS6ZFa0icwvHeD5j74tRGUXsxWEl9O+MJ?=
 =?us-ascii?Q?594x6Z7XNKk6uj+40EcGUADMJFyKjs8ZKRgCwIACDSAKYZPScNOHEb3smrmn?=
 =?us-ascii?Q?/z4zddI6NCELlNA8QoeZQ6/HOQv8gJE9b8Nhc/5zOz45JhJ6H/S89bLYFKMC?=
 =?us-ascii?Q?ShvYdPiGoPRD99f+BhQALHunxYbTgJ4uOgsloRmwpGQAQA0lNtPyIZM6NhlP?=
 =?us-ascii?Q?4tOrjlBo0r0zsIqLBERvoXP3Cv9wfhTTwh06MAFLSolmZSaj+W/k7RexHpqw?=
 =?us-ascii?Q?kmzaxwiLXprOQuP1ALtvEiLQbi+EQqszmslkHHqp8m/t4VFlXUDO9C9pz3F6?=
 =?us-ascii?Q?LEt/WWTeGj33Om0THW5J5222Cx3bd5HvrsfSNqWtXD36IyP4mxgPgm4rlofw?=
 =?us-ascii?Q?YuvSEkb2f6BchT3BZMAoJobx8Ok+eeAplgT+OMRP2JRFucCJZJ0kFM66CT2b?=
 =?us-ascii?Q?UJ+tSi+tI1VU7xQDhzu9F1Wd0PvOoFEC1QsGGAbe9YJaCIrtWXDGXcOhqZN/?=
 =?us-ascii?Q?oQuUePk94zXdCFDqKgumM4cMwLfizLrGMaTQVVAB0hntxEWr4sYsnAexX51D?=
 =?us-ascii?Q?F5uOtfFEO8QB4asGyJHrAhvNpT/heARLutFqOk7AS+8nrR91CPJPXeaZKV5z?=
 =?us-ascii?Q?R//UfwjwP/5osmByGJCbgCo8OlAYyhWGF+ZB991qDwGsyn+TkxTaoaHXpPfp?=
 =?us-ascii?Q?HXD4LOqAJuAS0/JmWfvLOQFRMt4fcisSEfP0v8nJqI4zZEKiX6J7A8njLJ1N?=
 =?us-ascii?Q?l6ZJt1Hq0uV3ikrJb37UqAfDKgo1hnQ3EHNbWAmDwV9f6Eh1I/1cimnKCTdX?=
 =?us-ascii?Q?NOCpHu2UT3RA/ttrJeVaE/yYAJE4ODm6jx4H917eMqIughgl5h4ririprNLn?=
 =?us-ascii?Q?jKyDaB05ow3z08jS05UT6dOzymP06xwc0OpUfPbM0CrbtxA1RAljznjBcNSU?=
 =?us-ascii?Q?t29No8EL79RfBgToY9A0Zsc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 899372e4-3c7a-49b4-050c-08de20ba5a3e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:36:28.4549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXnnF8cTDs79NKq6uh9i57TDIh/YW5mp6+M6GtuwkwRwbmlEF5MjczYWDyJx/6Yhjkjpg0+0KDQoBTcon/UTVEaWTAZ+nv/tizoamczxX4G3j41gS+EdvBy6p1H3Wuxq
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
 sound/soc/sof/sof-client-probes.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 5dbc0aacb8e3e..f753e0faff992 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -524,9 +524,6 @@ static int sof_probes_client_probe(struct auxiliary_device *auxdev,
 	card->num_links = SOF_PROBES_NUM_DAI_LINKS;
 	card->dai_link = links;
 
-	/* set idle_bias_off to prevent the core from resuming the card->dev */
-	card->dapm.idle_bias = false;
-
 	snd_soc_card_set_drvdata(card, cdev);
 
 	ret = devm_snd_soc_register_card(dev, card);
@@ -537,6 +534,14 @@ static int sof_probes_client_probe(struct auxiliary_device *auxdev,
 		return ret;
 	}
 
+	/*
+	 * set idle_bias_off to prevent the core from resuming the card->dev
+	 * call it after snd_soc_register_card()
+	 */
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
+
+	snd_soc_dapm_set_idle_bias(dapm, false);
+
 	/* enable runtime PM */
 	pm_runtime_set_autosuspend_delay(dev, SOF_PROBES_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(dev);
-- 
2.43.0

