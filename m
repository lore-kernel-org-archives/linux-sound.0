Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011041.outbound.protection.outlook.com [52.101.125.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2170D1B4F2C
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820781; cv=fail; b=NmD5if7S88e+ShGPty9EF8ZDIrUnRw/ICDvWB7qCjayd4p5xX1cT+AWp5h8jXQRAJade9xxCV7zsOdqcrdYP4NxACr/AcCINoF3A9cElG9lxXlju3amElIlUqrtVj2hVQPnHYL3faHqC/HfDExgz4cOFFmjXyNBQ1hFyzqyPmKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820781; c=relaxed/simple;
	bh=6/+BNRaLf5GuocxiImQP+UfyIn1aRx5tCfQRVtiSqws=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZfNRgMRP4ULwIXTtX6LMwYCYE7+7LXamNC38ghooyDQ8yjmVqrc7r03bJS0EmDOji0TwFOsjtgPPf5sGYXOQkL8SexyvLjJr9hk/a+v9kKtBGkpzXqRHoDfg0VZNo3AQk6WrRieUgkTrkbbGVQfxjFJZaXFz2eROYakmhdITOc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=W352kZKm; arc=fail smtp.client-ip=52.101.125.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="W352kZKm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGaCUnmhPpEHo9cc67OsSxfcOZlIyoIFhtCcWEARgMsnouOtBYj2YRPXsTdy9WiOdEv2nuTPsnSjG+1odlTNh/f7BUzaD2fbl3HixrrsskBtJDFkNY7Zh621MWVexZqf/6+4pmRxEU4TWrwujNclzR6rGu7fYASar6wHwVOKswSPlGVdprqHXHJnhcUkbEs9jMY9Wcgp8W58VNyxw2pX6KAyEpmLc/W1T2fdbpxCpAp0vphw/Q22ShWo0/0f1DBz6zxyHxge6DbC7ISMPcuIClmwCHHb1PalwoBFhOeyw4SWli2c0CAz8qutZIwvNuCDvZzhbXYMS6RYsH7DRk4Vjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPRRtHP1ydybRVS9ipj5wSwWWwGW7NXOfBEjVDnuBFg=;
 b=SQnSaXQRZSiYwoEEFnO8ePT/tdItP5cCh3zLEXPCv0zPeww5eNezvlkxOkPzi3eXDL4MHb8V9RNo7BsX4A5XOMuP3M16nxzqsPe8d91Mhxknvk4XLkk8JePtSxbLKnxdLTE//seQ/C193CUYjzSmzgtlDbzkSExJoIqPH8z5jIt+bmjQEq3kByFCIOZiiCKnJx9ooxb0gYb3wOKhvOJkTfcTAl5Uq01k2Co+VngzCeYCnEhPtn08GHyq+Lwkx5fpDOXmQ2weHiPUVSYx/jP/Js9Ohkcmr91FyS3bn1+Rn50ZlUpwPHoXhPz4OP4CJ2+/xtmR2RC8+qyy+iFaZEyRwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPRRtHP1ydybRVS9ipj5wSwWWwGW7NXOfBEjVDnuBFg=;
 b=W352kZKm2WjgGWYeOOe/aKAtF/gx6fouavtWKY9DOXDedPqGq7+98oIrpxw22CdcRmu4LpEvITQUHZ7qlQGx5FC9cUvYMs8uzRhH78wNeWzX+lAJ0tYR6ZMSnt7TTHULli9g3TIVuDi95pelSWQa7DBbcoCcfdjLkWddFPfWT4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:26:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:26:16 +0000
Message-ID: <877bvx2z4n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 128/292] ASoC: codecs: sma1303: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:26:16 +0000
X-ClientProxiedBy: TYCP286CA0035.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b1e1ba-2a79-42dc-7d85-08de20b8ed9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UbE9nqc+wVAPJuDRklqOoAIjOdf4Q+E6BkSzyre43jOU5MlbL7Fg8hXuSZfK?=
 =?us-ascii?Q?udCLJm63nNJsWfCUb5JFK8U6K3XLSCv2o8Z4PqngIRhpWCW7lj4o9/Sf0lr1?=
 =?us-ascii?Q?W5LZuT6kGHytgF6I6vwtX6vewy/HWmRg6GH0qVNIRW47OnbC/xyDtXl0N1da?=
 =?us-ascii?Q?geId/eprxSN1Ls1/Lv8ddAL2zi7PY4LHiiJsA8nS12sBpPTQk9p3Jj0PmbLt?=
 =?us-ascii?Q?p5BfvtV5wI6beNaDMfP9zOF8p8R1AT3zsNXTW1tXAZE/3eR4G0lP060eM/Ag?=
 =?us-ascii?Q?43iMmoSbW9Mc/Hdq3K/zoWBRjNsxrqLnsPeR5Sn5jnPj1xSZ7XHAEMo2JFGW?=
 =?us-ascii?Q?sFluKguVDacwv9VjFCub9pppVi0frOM/d7TggklS9Q5yHayTKY0LvQ8c7ngY?=
 =?us-ascii?Q?Ao62kyzu7c/OERFK5DiozDjUrJJAUyKw9+O145YKjsu4sVCixRCo9I4p7ZID?=
 =?us-ascii?Q?Jw7OFDn5uoTS2Ec+0iJ6BQUmjJFBTZT33dnofaRzMrnZohiIl2czSMllxCxj?=
 =?us-ascii?Q?s3xhxDsf4wPD95njsfIWOJ8IDBsisjM4m4IqvEIWI3jKicJsO+b4eR/qLhZW?=
 =?us-ascii?Q?yVBdHEY4iKz023HXNF1KVpWwcO77tU+hB4BY54sHyU5SfSXHQMqOuK+uOIQq?=
 =?us-ascii?Q?eYYvZvMX7KquGdf5vwgSAuBor/NPUc24yYw4+YvYbv14z4O0iYnxtp2YK9Uv?=
 =?us-ascii?Q?dqZLWyFFs3PT62elTr9SoWpKYE6ojcp5TyKrxcR6pFDsF6TTjr/U33/IJxQC?=
 =?us-ascii?Q?RlkhKpBsIV6zdTK3W6Ay4coIkEwujqrBGQUpIb9DWN32Pr0XDANcDRR5SAZ3?=
 =?us-ascii?Q?tQ0ZgJg3V/OLckbkoPOWEDQdBcXM9TROdRftxUmGcWwdk/l4hhYi9yD3v66k?=
 =?us-ascii?Q?nVgRnowzVQEDpH4L1FtKzZlkUoe77n2n2kNNJoo6LQyDIpcQ8eFHORbf5ji3?=
 =?us-ascii?Q?ImCyCOoaLQ2PYwsJlu1+3YgpLafGks0xpKytvBBHKn4Vt1N7Xf4vFOAYuN3F?=
 =?us-ascii?Q?EOmMtdHAe7El8pRC/Xemv/YqP2oqdOg3+QY4qSmzwUpwb/MEtmFxAHzjN8tR?=
 =?us-ascii?Q?uOe/JGpRZZS5j5kjYz/DNVyZORbS87hcgs556ydtr+ZO8vqU6Q0VDXAs7dxv?=
 =?us-ascii?Q?PBs917Qotv1boEwsMGzhPxnZfj3we7RNB47NtANdBoctcbD3fAenDcaSDN8l?=
 =?us-ascii?Q?wTb0tpr8J5PTwg32ilokZR5RdYph/wv7JSTq/nkdDEdFSfIaCqmddPG59vm8?=
 =?us-ascii?Q?M/QGP1h53BHwLNSIJD1Xwkv8Kvd5majh/Lx0B7NUscG/VJruy6z4zh7J7Z7x?=
 =?us-ascii?Q?3BOb7giX5qOXwrhDbUtFfB2I0I7ZnFLD2VsfIMn84fcIireZ7yMaSValvwWF?=
 =?us-ascii?Q?ou7UH1r4m/N7vAJVu2HWL6FoBiRqJnOBMeT0i80hvCCuUC1QpfZOchLk0j7t?=
 =?us-ascii?Q?l4mPi+fq8pRuqJq4Mb8ZEkBMqvDH9f1Bay/07iPSczrTAC681jMul2V3LJsT?=
 =?us-ascii?Q?ZEGMWKOjAn/ITQz1iTf1YLAkcGwkgE6Zsa/0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZlXXIXLoW4iuloZnYq5hJT76TO5uOtxaLd2PN7OQ9l3JzuQRSJGoVGbIb0p+?=
 =?us-ascii?Q?NuTHrflpf2CI73hAFt8O8jgQJZ+woOlknvtinkS1cJYQ3egl3YbCOXubzSYh?=
 =?us-ascii?Q?UW+pv3t3sFX7AcdW0o7hvgWmO6RKBo5CKCvFoooNsm3/dlww2kUsbT34WT3t?=
 =?us-ascii?Q?uNFbDVL7K8UmU2e5+K8C3gxnfGZo6WJRiurCFgUmz27JftCFS4/jJJxnvvnM?=
 =?us-ascii?Q?kxFICqVWEXz6Y4H2o3dX4p4hhJ1hwjs65WODE3+nGh1NAxb54lL4t/XZsUft?=
 =?us-ascii?Q?6RA61dtvlEvAGKa5b2T2ktGaF9me2iZ/BL47K6sKiBADrPrZ8vX6MpHvi6mK?=
 =?us-ascii?Q?xo9bYGMfLUOLuztJtp2pF9dSFF4v+4q/UVng9IIsFU8h1ApPDniV0Fc6psoJ?=
 =?us-ascii?Q?w913usguFOcm192B4LL/7QvZXru1Ya47+eo8ZEAreZ7hreXzgV3Mj6iVYc1A?=
 =?us-ascii?Q?Z+96H0QU83EIEpppz6QW+FTpsTEIJOZGfxJvVNPe3ZoyPV1aa5eh3x/5VsxU?=
 =?us-ascii?Q?QUXnOOs3vAOW386SO8prLAdQyKszwkBEHed9iFdA/iSCWFlNFTX1TgUsw+Pr?=
 =?us-ascii?Q?DI45pMuGL3ycyRB4GvX66YO2R9QWOV0qcC/0xHotlY6du8egAZhzjtgV4bzP?=
 =?us-ascii?Q?p2iv5qpPLv1sFEmZSp6CA8DqB7k3xLJS/HHGkvObxphJxX0kDvf5HZvOM+/c?=
 =?us-ascii?Q?C9dS5SxEhauFtk2EiAGuqhZYgv+QkUBOPxDGfT8iqA16hl0edoecnkEaUBrw?=
 =?us-ascii?Q?hCKlUWCKexdRk5/Y4Bbb8ibXAG+Hy+F4Jc7HM/q3df9yhKZhBrr8P9mhcEIe?=
 =?us-ascii?Q?Uf8gO66LJ8JkznPypO8D/41ZpcdseA9htVNZtIcIOMWxyARF8os0xK8B/cMu?=
 =?us-ascii?Q?fqpFEnK1bRsdZHc5j7ckl5YXotTZyM2tHPJzoRdXqpVSE4Tg364+h0gzwQKA?=
 =?us-ascii?Q?81BI8CipSEsLkI+rnuijXjezsDtXxqOuEE6nxRJYYbl3s8HIcNhYlyLUWi8q?=
 =?us-ascii?Q?NO/Cbp6cV7lFK9GQbbjK+NKewhAJh6SCp1CmASO3f34ltsWl7FBQgFHhH8Fx?=
 =?us-ascii?Q?aBrYdP3CyVERGRei3W22jxbDqK6twXpO0Q5ssdYsBVL3gdFbmj+3CQs+s4zI?=
 =?us-ascii?Q?li/9dv1/jbkrL30ZHOYyYjl9ghyk6A+nG5Vqjn9Z/EwP1BYf1mTEBhgo3kCt?=
 =?us-ascii?Q?yx8oMFmImb95l3ZNf3eQAx3EoLlxe2bl0jLaYmXY+3lN0s0Y1uHFa1LQEuuu?=
 =?us-ascii?Q?FUpHsjok3Lagfbg4CXi9/LqXfyOd7sJ451b2dp14yfdXVP/nuVJkxjiuWykq?=
 =?us-ascii?Q?tR1znPMxCx/natemHLQSuJZLl+TU4/A3jwIWsSZPcun2Lv9mTAeGhKj1X3hK?=
 =?us-ascii?Q?TqMwJ8giUbLz3hMdoHkDm1xNfONtAubdnQOpDBpwoz84W6Ch8QJqUsp4iXHw?=
 =?us-ascii?Q?d9DSiNFeVg+EzoCOv//wCdr1vZvEPmngvgPhEuxDC8yiYBfgV+4FOgLV6sTi?=
 =?us-ascii?Q?kIGSlCCMx/fDdKL2DCfYLnHpBX6bORRWlI0b/3AHpXe19BZLF35Gxs0pg0+s?=
 =?us-ascii?Q?xPvfd6IOYXDILxVfzF/sG5Oeg7bmdTTC88PXANd/bf1JD+SDbznucD/QW2Oh?=
 =?us-ascii?Q?Adyux071U9tz7K2j6NJ2koc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b1e1ba-2a79-42dc-7d85-08de20b8ed9c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:26:16.7506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hiBXThidn0jZ3BH3aNYj1vgGbfZQcxJ9pQNisZxtvaVdCRGEWgJf2+W6TdADqHvjTrXwzxdR+pS4eYkwKAeTnbc2QZlxrUiPhwh/LKZnzAVyaSa9B9+GvOUTAsZ1h4yy
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
 sound/soc/codecs/sma1303.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index ebe22325fc57a..06de2b4fce5e2 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -518,7 +518,7 @@ static int sma1303_aif_in_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component =
 			snd_soc_dapm_to_component(w->dapm);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+	unsigned int mux = snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]);
 	int ret = 0;
 	bool change = false, temp = false;
 
@@ -588,7 +588,7 @@ static int sma1303_aif_out_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component =
 			snd_soc_dapm_to_component(w->dapm);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
+	unsigned int mux = snd_soc_dapm_kcontrol_get_value(w->kcontrols[0]);
 	int ret = 0;
 	bool change = false, temp = false;
 
@@ -1557,8 +1557,7 @@ static void sma1303_check_fault_worker(struct work_struct *work)
 
 static int sma1303_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	snd_soc_dapm_sync(dapm);
 
-- 
2.43.0

