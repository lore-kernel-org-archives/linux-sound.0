Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B998519B5A7
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820666; cv=fail; b=GR5JtdACuRdJ5SkX0m4u7ZAcPhfFushKPYuFHrjPZ8MNrWjyE6CjZmmf7co/4Ept8IvdpxNnOKiVdlgQ6DzstnRMreI+ZhrSHEK2vUmW7c+qy28633Lu/Ir8fBUwuEv6xfyMHy5wZaf2ksWB8xl87SXVBcx66gIlnioX9rwrZDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820666; c=relaxed/simple;
	bh=tSphOS2Y8xjrnFfuswgRT9zH8fjlo9BYHe6zcNNZ8ek=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LcWoVbjzcXYYvnhwoFe588I9gDALNzNhkDdqApp3UgD4lj9BgsKM8ONf7U6E49OjbH1TWsBnUcLc9FvN/og2SiviquIDVCrUcjDTNC3WjE22WHbKRSsbSHcq3tru4ys4PN1bjyowURtfFY2k2MJ5oifPDziU6GZRHqt3tix3kv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oYMZ/Tee; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oYMZ/Tee"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMwDd3EVWiYXLxP5l/mOpiVWrYJ8LeMmnlvXCf60q3oRw834BMTCiJQ+AoiXgl008OAyhqHVi6woTskKuSsDAbsyH1k8sg1WGT43Xs0pU9g/qawyslBrtFnYTXuK4JrXm4MBLweQogXlLa7dvVq+0feQGs25ZDYRQ8QxDcBxB+8pnSF3j/5DDqiWXcCXsSTj+Xml6xIv6EPLDHrARKT63qOErGUBC9naaD+wT0jMvYXkOeDj7aqUSpl1JjwaApu+ZnX2FBlP+0TAfsfcIgAtkBwriORSYi3dKelZcJ6pLXMGq3tj47ttXqN2XdHe+IuXr8HIkD0ZCIl7L5YxISKLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zcZtcE8sFlWscLzj12QNxq8wO0IyJPOKKSpty+LpDQ=;
 b=JX36HPJQQWboqbbNa518OLsRSzK0ETHlZ1zj6zIdBuh+myqDA/SGtm9Wd5UvgLpHeg6/8O3z2eMckNGm3P0nWzTEzLjRKH3PuAQxUH00zL2stdvHJfDrL5OFi5zMJNL+tTLf+3FR8+zoBUDSbAaGTG5tSu8CsvTJtGcrCD2UYcqoqwXgJCOhtuNhqsbiT4WZ0OWelbnnkbvO5V3grws9dewqIzZijdiC6xEwXnVuFP3OfB+VfgbuwmCqryfxdt5PjhgXpWIT/JYw2Phh6e8yTAiYJ0Onn/AU0KTQN7l0wc7XSM3Q2rkva2lYLCqZQeE4kqVK/m3iymFyFZzRB8UZJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zcZtcE8sFlWscLzj12QNxq8wO0IyJPOKKSpty+LpDQ=;
 b=oYMZ/TeerJHNaqg84scmUJ9J3W0A0bVavaqVrPJ/GEfmp0lgmK2DNO8rmRwa1VjvYJPfjUtMvk8JmdusRxRnHCGT9h4CWfXFt8hm0KehtDisHLT5mXYmP8q9DeGCZAf65NXu6nY/H4FXkgV1PGVmZI8gNwi5zi83O2p6+JdoEcQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:24:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:24:22 +0000
Message-ID: <87fral4dsa.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 097/292] ASoC: codecs: pcm512x: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:24:21 +0000
X-ClientProxiedBy: TY1PR01CA0188.jpnprd01.prod.outlook.com (2603:1096:403::18)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: de0086f6-1258-45d1-bc3b-08de20b8a948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OF1j0roYHhIiOSbjDDutugcAXRdJvdnN654eNQ5AiY6B7/JOmgn8uiqP+QJ2?=
 =?us-ascii?Q?3ZfHySURq6qHhB9q/PseQEikamN14bR4JjFgWr54xSbe8siwd0kf5JOcTURq?=
 =?us-ascii?Q?eEQPRnx64rxLUYMeIgUtq0E91x269S10z74Gl8PEp3w53vdzRRDn70ULilJg?=
 =?us-ascii?Q?ZOGo6RghlCd6ESrbXiOIbts2Ov2JY7mtKqh9uufuZeswmtQUPsejysZw2Rf/?=
 =?us-ascii?Q?El1W/0mi/3Iz8wLGU1tMVPumHHROYr0FJ06GCX19r+J+ebuS/w1rlYkInacG?=
 =?us-ascii?Q?5EzMaYSdmCFtHCRDNNI8KRR2Wx+Gi5uDEyLYblPUOEKmDYseeqie/lQF2RQE?=
 =?us-ascii?Q?n+a0A9R3EhrSv1S+VjRtzrQdnUZRNjM9cVcTpSPx8CNha8n6OS+cH1psYR8/?=
 =?us-ascii?Q?SJh0g9lM+/kPLe4i1Wi2q0CReLGf8XszMfTQ0cEHxdQ0upD85E0cfKG9RZ/8?=
 =?us-ascii?Q?kTBAbfRehunEmyZFHA8XraEIL/p14bDkyYjgmdCEE3C0U74eruDpgm/rfFAv?=
 =?us-ascii?Q?45mZt+paRwhnTwXRHBX9pllpHf0FDHU7bw4Mf5v/ik2WzOzNipW6lZNxxEfp?=
 =?us-ascii?Q?zlr1NkeSyKdkrssZgcQK911+y9RpAJPXMTIyeP//qPzL19fyt5wdYLKvKT97?=
 =?us-ascii?Q?T3/pnsDnIFwTOcpdTGjz5rMDF9/bPn8WzA+wIyDW/bVnxCGoR1CZBZvYZzjF?=
 =?us-ascii?Q?GbWDlS+mOjckZkQO1igLbmNtz+V+ZfJlE+ZkecR17s354VVqHIyRyA0sDByX?=
 =?us-ascii?Q?p+ZBRnm1lc4nG6CECaRS8ilVX+m9DvDX/Wbd/SDyCyhfKeA8gWODqloOsyKJ?=
 =?us-ascii?Q?uzH2+RWRpJ+lcW1FIfPIAmx+o9UKODwH6Lai7XCCbk/HPatSUU4dVmiLtPDY?=
 =?us-ascii?Q?brR9YLiqn9MZgiqxNynuBqwJ5FLdnuTPWJC54Dj1o5rM7364Px8xRv8ecAiu?=
 =?us-ascii?Q?xb0SdUaSys+KNl+O/SJ2GAJ8cFGnPE+kWcz5Gt4WX1r1HnZkHINzyvHC1uPZ?=
 =?us-ascii?Q?XhaJaoGHS3idZV/HRI52vrVpj534wvMO5OSgkrpct3YnivUWrzJ/1dYjMApf?=
 =?us-ascii?Q?iHxI35YVEXomfMB9PfiGlVq/BhaTzdM38Dct/7sNKNUsG448tjtmizmqOR8I?=
 =?us-ascii?Q?m27f6wTlKZ2QJZonFnA3ult/BQNtD7KOyTP16VJfH8PVcJvJoJKqYrjCHxdR?=
 =?us-ascii?Q?hgFoJsMsEZ5ya9Wg1lr9xPL2V13eKUTyoTpf7CddZiH4+khKkGxhuHXNDAvr?=
 =?us-ascii?Q?tNolmJz/9wk1OsQ3zfbW3Ge435PLJPVLaQ4JmTMGSXSHK2HvA4jtRoH7FE9j?=
 =?us-ascii?Q?/mL7cUPSJUHcxLoZ/7ksDBIxbP1R2LYcv2QIq0uSSCig9uCZQ63V9Rqk1Gli?=
 =?us-ascii?Q?ruGG0gsG7YzZ707mW0A3fW13UuEBhaRlUMYkrCOG0BP+1rlzwfW8wCoPxaO/?=
 =?us-ascii?Q?k/UQg13JdYC8pndP2teqHinTpe+6vD8hXPIUb++rMClyqWqyYP2Xiu0HuVZN?=
 =?us-ascii?Q?RGZ8Lm3/vtJoVnUUsxXeUPZM+p3oDXwFFskV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2AF0CLji930vneeNzIyEuoHgw9EYAkJ9oB230/UxaLbx8+gZw090dJrs+iHo?=
 =?us-ascii?Q?U/QByVgsVzp1OiN3D+hXlJz2mvqF+qdTlcBn6OO1NorEkau7kAiDHgXe1i/s?=
 =?us-ascii?Q?4cUzzhvR7r7ItWwZgB97li6ppI8WgSH9SMFUFWyQTXE2fHy9le0zpHtj5u8K?=
 =?us-ascii?Q?AV+Xb/1F4y8Ciawtnm0CPnQ1kVP8/jLjcugAXxvE3GClB7VtHpRiACqgDiZW?=
 =?us-ascii?Q?NS+ngltJAwBLhZSF3UyiPbMEPkc6KJNnNkxBdEZL1BGqbkz6fGG9/14d568e?=
 =?us-ascii?Q?4XHA2WcmkMKeP4hQ07xjdS78Uw3yLECBcjxQOgCgbBo8SjsbAAJtWs+l+mPN?=
 =?us-ascii?Q?i5QmiFNOqDWp85ExpayMxEzycokN36jWllgmIbtONG7gLzP+sS9oFhJuSyrF?=
 =?us-ascii?Q?scYZx61hgwpjR542VZRLqFWyfFMzEZS4/CoCf46Ic3s4FT6JWkrfizyCFaCT?=
 =?us-ascii?Q?4VrkRFpCD09JnFFinMIJ1/rSzcS5qeeQGpI/Q8pRpHBbHJ70+/AfhZitBb4h?=
 =?us-ascii?Q?WNxdcR+hS8G2mGP9dWqfXTuxBKkIAwder5OAFDmvbOaOL4YCUwsMHkY41cUw?=
 =?us-ascii?Q?+4hLcKpVm4i0xVmxJBpPaszIF7hpFVh0dMVgTKdOdF0ib0lVNrkMGbs7R6wr?=
 =?us-ascii?Q?tVoP7VVaxl89GKEkTGcXtx1KpVQg+uTHhsohizbnntOLQ+4aT0WHeiowEoki?=
 =?us-ascii?Q?c7Oo+Z8V4dvkmPazDVhLwsv6tJ4thD1ETN+xGM05QrYcNJW3dW6g4ETU56tz?=
 =?us-ascii?Q?NOhM2zKnQdc1bGSm3G5oH4SZteDC2iOvLZtuSqBbd2jz909pKUN7SpKJTIKR?=
 =?us-ascii?Q?r83eGxuvmKhHyAfoXpkadUKmGshYfOkRuzUn/2IMNC+Z1n7fLH8RrWNAqXMN?=
 =?us-ascii?Q?ng0emISiJIPhtZlCT4qyCIcM07U5Uixgf4dcO4eVDGIIvJGLNl7YdAY+uwcZ?=
 =?us-ascii?Q?uS/gX9tlwII66VIGlxXoa67ZxVsB5+Qieou8QKNMpX8NokFG8c0apKche6lx?=
 =?us-ascii?Q?Z+cyIOq8z2yv8w+XIfmAjrmRXEgKRz1C9uD3QZsmqtEeLZR+TG3NyynOPccX?=
 =?us-ascii?Q?MJ0mYfR4g+11xdKLT63swu9c6xvW8cf21OzI5t2YU6k07dGZpMJ4glgqxgUo?=
 =?us-ascii?Q?Tgfb519Vx/fq2Xeobs/niEuuD+1q1RaAgl52PvibydCMcReaFryZh9iDoMD5?=
 =?us-ascii?Q?0FqY8s4Gs3f755Sb2KuhpZibDNmBvag96NpgzB84EXZOnGHWy30vsjkXd+Et?=
 =?us-ascii?Q?Eg+UXQLIreXO6+lrck2ONt4tFpt4l23dHVKt2175CTiK60WcenctgNJf8OpO?=
 =?us-ascii?Q?sCiHgGIr2k8w0UomwT0JElsBAco61OxQaNE53mfW1SRdFaOkOWJ2NyH0bnvX?=
 =?us-ascii?Q?g8052TWwezBSdzx8nWl47Hgj9Ayg7+ZryksZ37lcceGGx4m5c50nc/JuR+Nj?=
 =?us-ascii?Q?WawZO8PAUcYZq+XFtjWeOo54/K770rbjkwGRZthuSMpBS8Udvqhtsw1NiVKo?=
 =?us-ascii?Q?EGXb11huODiHRH9juwmmcqcwgUqRWIIWgKNRHsUhfbUQWtGk2YUdr07ZawNA?=
 =?us-ascii?Q?DsJd7wxkpW1takpfoJuDz2d64X6Z7NXByyOLdQdA3W9ROOXSCZH4fRy7z/8E?=
 =?us-ascii?Q?KCT/CDOvMVP/UUr0fZNdzUw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de0086f6-1258-45d1-bc3b-08de20b8a948
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:24:22.0655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 734rIbWctLtL5pRBJOgNj5g1WeKlYFV4HnfhzW0lOGEHG8A4hcdoHG/WWNUZ/wLmjqibPot6mTxpI+zGp5ItDv0W5/GhccIR9slpI+A7aSCZFlJMnpmSFue5fYPRCBvl
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
 sound/soc/codecs/pcm512x.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index 0c06f1f0da3fd..a70e8ea166dc5 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -235,9 +235,10 @@ static int pcm512x_overclock_pll_put(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
-	switch (snd_soc_component_get_bias_level(component)) {
+	switch (snd_soc_dapm_get_bias_level(dapm)) {
 	case SND_SOC_BIAS_OFF:
 	case SND_SOC_BIAS_STANDBY:
 		break;
@@ -263,9 +264,10 @@ static int pcm512x_overclock_dsp_put(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
-	switch (snd_soc_component_get_bias_level(component)) {
+	switch (snd_soc_dapm_get_bias_level(dapm)) {
 	case SND_SOC_BIAS_OFF:
 	case SND_SOC_BIAS_STANDBY:
 		break;
@@ -291,9 +293,10 @@ static int pcm512x_overclock_dac_put(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
-	switch (snd_soc_component_get_bias_level(component)) {
+	switch (snd_soc_dapm_get_bias_level(dapm)) {
 	case SND_SOC_BIAS_OFF:
 	case SND_SOC_BIAS_STANDBY:
 		break;
-- 
2.43.0

