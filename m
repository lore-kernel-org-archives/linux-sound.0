Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D1D10957
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820859; cv=fail; b=DzqvmHTccHeuAxLhep2mJSOFucMG8X/lvZVrsqBWXaQ5M67m2hJK9KKp5riZvGFa5R3hatoJvKhezhmtIBODrT3mlQt+VbMK+gYPYugw4iRLrxz0G2Yb9qPl7P90Hvfma+E0AdqA8qye8u4p7aXijBwdFiNsulG/vWEp1BrlEcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820859; c=relaxed/simple;
	bh=vheumf6dihA3LgnSNjZNh3MutnxyPVO9fi5aPvuhw88=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Jwj4bQjIGlXgN+iAIk7lAHnYXRuBRTjd8SHYefsT+GWI1E9uS2PS5dVlIdOyFcACXWbl5SGzmkKbET6HQImo9X7c8XYWsAuK5sgm9UUTgyS2OG1snhKfHl/YW+R20alLYTeSCkbUwmOYsjI+A2gspBAzi4RfYK5FQhNoc4ptdp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OE/oqyrl; arc=fail smtp.client-ip=40.107.74.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OE/oqyrl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SP0ODnvsLwHjcNi7D2tlX6fS/Mv7q7/h7BNVPag2TQ3JOj7KfjbtA1Xpcgz5+EBBYzIqmV4wlxPqNSCEMKml0FrPmYDjt8o16t4K5jBX3InenRoKGF8L+IsO0a3auJFQMBlbVr+mnDpfDDyvI0wZNEckV3aJFSt5fmZXP4afEHJ2MQRnwjzXFgKna64/D2bpofrez9qXGAsxEhmF+s0KN9lWKHn6GI1kh5tNsLuw02NsJMW4d7DPOCT53po+283Fn3zqA4wQJhlUN4z7+V8+53LLjzZH20sAZ0iQU6y7cRLdvAn29NH10s85Zni05fV+WQQoITgV4clY1lB5HFNi2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNzXnz1EWjBKflh54F0AL2LkA5wS0LbspLFMMs8Nvv4=;
 b=JiglNYwXR5tai/l12dHpuSgPtc3538Ypf1O8VIr2s9TF6WZOzjZAh+ERIvT9NfFsRyoj5oERpfPCA6JMvAW5f+WhgBX/6KorZUWGOF5Ze9tWGlkfPv6Uxx2SNS1ngKmxNdF/Lnfmc56mdh/3+h8+9toM+R8fawD00vH+p7nVIi98VDUY4A8ZwyFp8UxfcCU4fc7h/hcbFWBe80MVJYwrT6BCy/tc3c+i5SH6h5mRBKqQt9rig2yKYQIVLbA1qeVItBLbjowKCz50567tRw3iwCsAoUmvDiIw7GSJN6dElhgpovipMhz7z+E1DoNxMz6hPIy1F9Rew9WmwPoQY7do/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNzXnz1EWjBKflh54F0AL2LkA5wS0LbspLFMMs8Nvv4=;
 b=OE/oqyrlHM4vMjeqxr2HcBlnI0y3crC+SlQNP3t6KG6rVD2lD7lf2j/xP+QqASinuLKJcw/KE0ImkkmMlM61Iss4MVoxPOSz243Ys35keOVBl3dQJvx81nWW9qooMcJ7Vz+xjB07kVlFAESmO8GFvUQpaMk0r0Ufax9M8fxeSW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13460.jpnprd01.prod.outlook.com
 (2603:1096:405:1d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:27:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:27:34 +0000
Message-ID: <87jyzx1ki1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 144/292] ASoC: codecs: twl6040: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:27:34 +0000
X-ClientProxiedBy: TY1PR01CA0203.jpnprd01.prod.outlook.com (2603:1096:403::33)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13460:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c7cb4c6-435d-404d-e0ac-08de20b91bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?psFC2HYQETeEBnGr0Swu325Qq2HPjFGMi54aFLE3m2FTk6pJoU9DCf4inonb?=
 =?us-ascii?Q?m/hMGF7CN1/QDVAa10G8/d3YnTJDOmwCxBaCbZ4X836y/JnMGZVSeWuln375?=
 =?us-ascii?Q?4w3/+G6M/E5tNuUKAB+sioJ4QEJdPuwz+WJYrmuIdz0LUHUHrnfHuHtqPwGk?=
 =?us-ascii?Q?ADLuS6u6XmnwAkMNtLSNtTb/HCF2lQ0XPIE3gLWASWYRCKDoL2HfZL/vih6p?=
 =?us-ascii?Q?vZfZIR7x2ssPXONajoK5WP2gMr9Ynh12brO2RGVIQ5lcwlYFEU9ouZHFX81Y?=
 =?us-ascii?Q?AhW8bYBLlQ/CWuet3NrPMYAn3myMfXiEGa7bYwBJXhnNQHQbK9UQ47O/CQEe?=
 =?us-ascii?Q?ZON2KtYKRyB/FrrW5bPuouKMJ4I78YTvZtmLCrkiLEmKPuqTrB5Ip2RD+i3l?=
 =?us-ascii?Q?MMPwzoJvMU+clt0e9xH2k63AWOZ4Y922DogNGN9psjv5wugyQVvu82BDZVct?=
 =?us-ascii?Q?pzn+Ze0uYNQfpO9idkgIFEF5ibBI2GCE3CaTMuJXlIqQzlPLxV7vwi/dhPJ0?=
 =?us-ascii?Q?2OACp8u6t83SxvHHTeQkK/aL17IjC18fiDuCy0v3r2/6fW7O1C/HI+rmP0dn?=
 =?us-ascii?Q?drl9gohb/YKFsi2jwGJ+I/IixxB9yoHty8HoyFs7f4nXLozOE1RvlqBoaGPg?=
 =?us-ascii?Q?VpIQIxDJXjUlS1GZ9/D6+XhNrLNJpuBeLgz/eASRHNaIYe3s3T1Q5ERIL3xN?=
 =?us-ascii?Q?PSpjRC4NGILGOODqJ2XU5CI3DWRABJZ2JWqJTRQzxQfV0qrsG4W+MUQZ8Ng0?=
 =?us-ascii?Q?3oMTQJfAYHH0fOjH8qtVcDBhU0VsSmCE7Kuy88Q8NWY21q5vG5INF9XgFV2/?=
 =?us-ascii?Q?BoF3QU0Knu33oWVi3lLT+BHVs4dG0ipEO+ahWDmvkJs+vUnKZ6SHvcinNHnM?=
 =?us-ascii?Q?KeLMMzxlpWbfB0D2DPv/yeXzxMhzmSx8T6iqOk2fPTcLIvKR/iKzQqmdzjvT?=
 =?us-ascii?Q?eR1/l0j0X6duAFnNC6u3yPeG3e4pwqox7Mv/TReZ/h/0r+ucBKAI9+hTuAHm?=
 =?us-ascii?Q?8CmyWe6S4ejyUl+1a9mW2BxrZqBhhmi4KKewcStStjM4aMnxoIoNPEAC14Sx?=
 =?us-ascii?Q?ye7Puw/x49SRRqkfzHy38oQj9pmHi1jpMkKXjyrncvCVqNdWYBsRAAgDpXyV?=
 =?us-ascii?Q?MDskySlZHoNiRXWJr53UskvUHAf/f5kus7LbzDm7IHlA8Y4+ImacSZLwqSGC?=
 =?us-ascii?Q?n0x9nGLaL2YpS+qlpYp7G/fXFMNZdEhfyrGXffRTy8QPDp9+7W3nB4BcPqA3?=
 =?us-ascii?Q?atVUGzVChI+W8S/a9X46m573z+pmLEcQStTmSZbNh3skvH0MB62Z/Uk6lAMg?=
 =?us-ascii?Q?sJz0J2RvIgzCswqCTMZ7J76+rXonUloGwxkUvu8SNd7MkBdDDHoJIZ/uMplO?=
 =?us-ascii?Q?VmUlr2fpQTkG+V5fhWNNBR8db517lZLlMXUQTsTOLgTlZi5N2I3GuLyZjo+X?=
 =?us-ascii?Q?ZztDs/Tte+9SviKvEEDnlccsdbSEhjltgyvLz97C435qDP5UIBstQJXplQx1?=
 =?us-ascii?Q?dBNDySdKnGboljpAdN+cHKN6jiszCPK5MQB6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kJI9r228dRCcBKTIYzOHIJAOSOL62Fdkx/edqag4yVdK1jXM44DHJl33IYtw?=
 =?us-ascii?Q?px33AejZf46kxGNYPOCAS4sh/w1IKyMlNwhgaODhsNO3/nfiwPUDcyZYy62w?=
 =?us-ascii?Q?t9O99Wh9e8nvwmlEWw1VdSMqwiQaH7dJaf73uOI61Zx095gbITDaeAVqMBOR?=
 =?us-ascii?Q?eEIMhcFjb6/nIaEoJ3CFRgb4sJWW/zbvgSjx818PCBm7/UVBc3HsM7HRFDGU?=
 =?us-ascii?Q?K+BMYa4EJ78SrcuzvmNT4gBj+6nOyae6MRQuiYh7EXWsGFW4YWNqX2CGd6Bt?=
 =?us-ascii?Q?MRO92VMgG2EQj/Xv65uePl79e+fI6w6hEsMi9XD9emWKy++L11AtQyXEH3DZ?=
 =?us-ascii?Q?wWWcqKQ8MOESsZpuqakjUXzmrrYB4HSx10chAFH1BOgIiy+qWxZ493btb2nt?=
 =?us-ascii?Q?IVNSRCBtWBdtYxLYYVt8sSNVIU0mWqL4vHCF/naLXE06UwhfFmnDVDoKslSS?=
 =?us-ascii?Q?UVF9rHq07fHjKG5Vamr0h/PesYS2ypL2DL6Y9gGulzmxE3MVuuWFV4hguVhU?=
 =?us-ascii?Q?GRO/z8JfMyOL5gdY2VQOWRlhuA/bYIt/Z66wxa2vw2rIoNLHy7KgVoq1wrIl?=
 =?us-ascii?Q?ZcaO8IEBDt8NsnJ9drYhXMNzBarntJpPDjffu4d3y1TWMsZxllNHQux7Gfam?=
 =?us-ascii?Q?F8P4erKS+vBa/KQf+hS4AIbfQcAuGpEbRZSj5DYHgTcR/fMnv2+96xCBbHN/?=
 =?us-ascii?Q?r5+cvfoyxS/0jjizmMMb4bDVQbE7hVeN90drxo5fpgxpT/BFPKwz8r+yPOCa?=
 =?us-ascii?Q?e4RJBueUoM7eXPrP9omb2wv8u1Y0mSvmsVq1kLjzT9s6gSjQMPmUQMUdioGt?=
 =?us-ascii?Q?fOPy4+QEVDI0lPXqqN8QcnU7tfhW33o56YTpjxkWSHYPMqdHXPIEw5kzJgut?=
 =?us-ascii?Q?9o6ic6CBs1UXsN7QaZOHeibaTkwtt98gRwNv7p7qCkP5w8BxEWURc8HPOchk?=
 =?us-ascii?Q?p4SllaPtFrcrMtyXc2mnrA9lJUJ1/Jiu8BAB8ThtWDiX0+cLDSBevvM689RQ?=
 =?us-ascii?Q?kGjmvfnRlPd2ukAiWw5lHL3zqXrP/HkryIFSbT3GlJDJE6ZOSbHpDsEKjB29?=
 =?us-ascii?Q?VljJh/6ycxsz9WGx8Ipuu77YqTfExsY7RoSig2yzifhZqyB0/mfAfyFcbpql?=
 =?us-ascii?Q?sp1Z5qurwbpT1OWybNCUeCKL7NI9h9NzNWvB/G4aI3m0ZO8xt5FMQEWoZp5g?=
 =?us-ascii?Q?D5/N0cXrLLKPhFU5TtV/etjJD8XTUBtRqpv0XQYgOrVlkanQZ2MvwbASH+aL?=
 =?us-ascii?Q?GsImB5umik9KmkRQq574RCUj6ti2Ezx5axcHz/fB6ePDQ+CBrH4zKcezNa4U?=
 =?us-ascii?Q?pNisCPbmtmtTLgfwon3Ut5nlOi+qwqx5h5ECq+KJFRNh7Zk5ZWne/af5R6O1?=
 =?us-ascii?Q?0LdAFQS1pF14DwmGI2wer0C0zEoMrG57KPevvM6mGhf8RGoZAgLorAiq7nxC?=
 =?us-ascii?Q?jiceCkLt+SF/Jrn2VQCNTzSNM5FO40c+mxH2SgEQENuCPtYlg9z3bKA7Rn8m?=
 =?us-ascii?Q?brhGhBt2zreh2TUr7sLxXAlOP0RqkvVXGuRwNGTHGaS7wHc8MuT7ZIr5swy8?=
 =?us-ascii?Q?6h2VdqZovrokS+0iLDF6SaRKia6LoOC/rooalKylX3B03jUXTnm1JdZ1nZYf?=
 =?us-ascii?Q?TxbqVv5WZOTOHLFemIoTUu4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7cb4c6-435d-404d-e0ac-08de20b91bfa
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:27:34.5069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IaERFhz/1h2MwnBMl/idmpsCpiSsjz3tyxJCCU1WuTN79o/eEQUv5ANTXKZ/vKFiiThnSzfUkG9DAHG+J36R8GJp9xQh0dcUQxQ+tNlgBdeRghXOTBZH2Ya1ZisNICG2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13460

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
 sound/soc/codecs/twl6040.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index fe813e0960713..e10c51092a358 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -323,7 +323,7 @@ static irqreturn_t twl6040_audio_handler(int irq, void *data)
 static int twl6040_soc_dapm_put_vibra_enum(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int val;
 
@@ -521,7 +521,7 @@ static int twl6040_pll_put_enum(struct snd_kcontrol *kcontrol,
 
 int twl6040_get_dl1_gain(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	if (snd_soc_dapm_get_pin_status(dapm, "EP"))
 		return -1; /* -1dB */
@@ -1097,6 +1097,7 @@ static struct snd_soc_dai_driver twl6040_dai[] = {
 static int twl6040_probe(struct snd_soc_component *component)
 {
 	struct twl6040_data *priv;
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct platform_device *pdev = to_platform_device(component->dev);
 	int ret = 0;
 
@@ -1125,7 +1126,7 @@ static int twl6040_probe(struct snd_soc_component *component)
 		return ret;
 	}
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_STANDBY);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 	twl6040_init_chip(component);
 
 	return 0;
-- 
2.43.0

