Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011031.outbound.protection.outlook.com [52.101.125.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DA217E4
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820262; cv=fail; b=XfmjrgLya0KLR+HIXKTRu2u1Uw5H1PVIMg3fsWPIuC3JyvUHA0ZwWYbBBFX6+NJMqY3IA0znkrxcsEdDX41p2OyosWHnvUAPzdgYv4RVEqKYiGgF+0Jld7KD6+o+1lT9q8NOEPmpAUfANMjKzMAjm2A5FHhqQyq1TQOo9zM/YEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820262; c=relaxed/simple;
	bh=y49QRlGI5TgAPAFGSnH4rJ5vPeN4e9Wclwc+lc+9XbE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=giLevzoOuKRQqVfZ4sTopibg0JDFmutZ8goNeIQxwwWmhGRWQyyZYWn+Iwae1XqW/l/xQjdSAS32F/AyGBe2VZ+BxOygfpM/2p+NYdTo+1m7pvKrRL3/eA+3vpL7VCb49fvFcWofuxscMPRdNuo4fswvOR2oqAJV4dgtZ3C3pTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bhVuIVWx; arc=fail smtp.client-ip=52.101.125.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bhVuIVWx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJk5lpFZTVGHKxE8scWImxonjsuc8yO/MejCC1TnV1Dsq0jCfRIjt3x5l/I3k4fcmA2s0r0iS394dGeG8u3SnXQUxCo1+8SN14UXIq6SDkFcMz6uzq6B0/fvyMbRoYOrmmFd3moPaI1fEeENeKr21/W1QewNNhgononsL6Z395xhh7C1yv/jeY1i/UQ+nWinjtyFV1xJfv4+W2Gtsl8Nn67SFcSKJvjntBurXA6QoHq5SyxJdAbM9CCnXgeYTh7JFHAtKaRgmdayrUWkpcCynINvitMLB4Zq4OADlw7i+TsGgT2Ga4bbMbxIzVhKIj8AxtUJkezTl5LJCddacriqqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VgYaxKLIQgnf+J+MXUbYJoyy8sLV412QGnZqw12Xt4=;
 b=oXjgDiqA7K/GNMSoSlkT8pULD5MJpMST4zrEPXgSu3bNxtApWDQp7zRjMOJbjvdMKxqysduVv+Jt4vqJ0g0hxSpslrYN7WMA4cOi3JWAjzTQu7zI4JpiPKed7zZ/eIC/8N9nFsJGnxlkFTPAH8uB+0TsXyVcI16ZuqA0kK3feIiWpS1FSpiRwWdlrzPPm+Em7xAKmIIvQKnib9mITCQKJ9oXbcoMKknA3r+2yCjiSYE3xGfOe6LyFRIDUAZe4XdOQDmyrfh4FIgX+z7Btg2XPuLAkFlzFoKgFhOaPcMeHPhyTxGB/q+yza1gPAWeKxwJserswLiXwQv8xYx7J/Z3QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VgYaxKLIQgnf+J+MXUbYJoyy8sLV412QGnZqw12Xt4=;
 b=bhVuIVWx0bydbn7TC2J1AVLmIYoA2Zqy5TqDjPT7Conm9aZtfa1EwdvFwfmgyF6eukVnLDzwnlfMIG0f3x04YC7ItCC9PcFsj6EddPMYH2PVGqxm86UFnnyn8Wc6wLdmUeAo8IybUcKnol0L5w8smRCretT2N4rYlLe6kjY0y5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7893.jpnprd01.prod.outlook.com
 (2603:1096:400:182::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:17:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:17:37 +0000
Message-ID: <878qgda0da.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 003/292] ASoC: audio_codec: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:17:37 +0000
X-ClientProxiedBy: TYCP286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b4b459-6933-4b11-0383-08de20b7b844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IXGozKUvjH9tCpZmfm88l1g81LHragO0LTye1zxXmFkuhwZInGwYXcXsDO5c?=
 =?us-ascii?Q?VNuj5UpNT3hmR3cSJ1wext8AJsg8bUfECPqXmQQiTZmfVXQN3tY79VXr1QCS?=
 =?us-ascii?Q?86bE5LIw5DS/A1nHSK84wTSC6yHwS7gKq6bnucAnvfBXz1c0y/5t3vX3tJV6?=
 =?us-ascii?Q?ZvYRF68Z6hBtG96+CKp6Qf+O10O1uHefbaSjBiuM681ct0Q60JitavijpwNE?=
 =?us-ascii?Q?dyqp88An7ASnvOfb9u+cSbRNqqtYv2qsUArfNSLp9oCv1tIZCAOGUyRcJkd4?=
 =?us-ascii?Q?eFd9B9xvG4dsioV1xEME5rjy/l06wqjE1VObs2cneZpJCcILldguZLj1toW2?=
 =?us-ascii?Q?72Mn6MTCAhMNBcPTdju+VfhLNoKpVKpgMd15L2d5xPq3iGMisTjfZjSG9In5?=
 =?us-ascii?Q?GVetROIY67j1ovE1YzPOeXTyhNeXWkSBcGTWJX1SaJFUhmJIl06gCNhIFhjI?=
 =?us-ascii?Q?qAsS+ayPOE+2N7N66YtpxkfotGm/zHKNUGPAdeIVbiq0Zq/h+eCa7rskpNwZ?=
 =?us-ascii?Q?Aq0AipS8aB/2Y7qZU2KbPHmKKPkRmUVFviU5BRrFj0B6zVABw3zQ/PKLS/Ix?=
 =?us-ascii?Q?iw5PzSwYdQG1zn78pa9DoJbVj7s2J0O6vNdM4rL0Pu9HNy1LpRFO0AloYKLO?=
 =?us-ascii?Q?hqhqWUAQ/dUmQR/3xn13olyUHGdzoL/WXAV6f2mOdlW3FtLMJRSVyjtYLVQd?=
 =?us-ascii?Q?lnwmb2dwhu3RwIEihkFkpDFY+ukJyV2vv8bjfLAc3wjBxGc6vGT3eQVeEjI+?=
 =?us-ascii?Q?m5D6zA5y9brekS7DBS5EuKdlvR1DxQ8NlNsVLZKNBzAqIw+7dnJVtbC18Pvs?=
 =?us-ascii?Q?F/he2sDRE04rVFTN2cvStEqYKJlqirBcftYWhgOx1pTWOCLVNW3ZlG7xVKxX?=
 =?us-ascii?Q?yqGzBrCfhgxk88rBz4knwS7pCWuzo3vXRoMlF1w4O/AJCL/co/F7vt9/aa3+?=
 =?us-ascii?Q?azHnO5sHMV26makSsljXvFiabPkBm++nlfgFhk9NxShypoaMrDXCXUKECdyx?=
 =?us-ascii?Q?cQZnAT2W9xAmqMuh0OUelyW6WpeC6I+yOXA+SvcxdA8Q4H7XnCjl4FVIYoz0?=
 =?us-ascii?Q?Ml0ExmdffHWZHTD2KFoqj5vrP2v/fHWaBlbutwaC3d3bSSO8hBIpzPzLCs1K?=
 =?us-ascii?Q?XDG+iY/i/132Sti164YypZm92vRVrSRHm9q+Ex/JTOceszWvoN78Pn8uhctE?=
 =?us-ascii?Q?SnmmEy+GJCqXowkLu46/9X6eJmrSmdZfn7hUHp/8FngW8VU6uH/T0NQQzjEU?=
 =?us-ascii?Q?0hpCI8yQkmQeL5PrYj+sE659wdj68gI0hw2UJmhNnlVuU1VAkHJFzdCR9el4?=
 =?us-ascii?Q?KXzyJJn4M0ub02UXa4TLVBRvdL65TyaPufWqcgh3prSvdEDhsyv/3GyuqDOP?=
 =?us-ascii?Q?854dmSsrrYsX1NnaCFk72pt5b63xPxMinM7GUVcZK6Y0Hx016minj7GVIf8M?=
 =?us-ascii?Q?0iOv0ob5zchwtpoXdDOVnH37VpOSL7bb3/BDu0mQflPyXElgKuToKb/ZrE55?=
 =?us-ascii?Q?srVMI2zQY9pofaqpegHrmyfuPoDFi2qgJeY+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?udwUbRhszsAkgK1+yd4URJkTD6dfsgcq0lmStol56RvbzKMlhBmtsd44qL4S?=
 =?us-ascii?Q?V6QlRvmeAgzmSOEGCL4+AkLJc8q/uQvkpxRx7AqOncM7ojC09t6u7zaVN9qN?=
 =?us-ascii?Q?Uk2kk4F+JEY4CbOpx1AcJxVOu/L2uGFmlq6AdltwPvTAKPJLWN7Tnu65hloB?=
 =?us-ascii?Q?Fb+xYH+4NASHvhp2OvmAcLIx3qMonOcSVd11fQeGOQZS0/CKhDDtDkV+vvko?=
 =?us-ascii?Q?6z+o2+AQHcrK3LOtTFB6KgRTWpIsrn2A+MF7rwyoji86WPeg4mEpYAefWkFp?=
 =?us-ascii?Q?59lXntSbTV6eAStgMY932Vir5Ca5CZJH+I9lVJUr2A4QjKrh5W8OkuAcYAj8?=
 =?us-ascii?Q?2DMWd2AmLEH3xdQOWnh3dJyg5snylqfPu6T+WlV/KJpEL+jUz8LaOoRPpxNx?=
 =?us-ascii?Q?QtjBIt0LHELC8bG++f6ohuAMyWJQ5rKZX9zCkjiiKKisyG67mk+s+rv1vidP?=
 =?us-ascii?Q?FapsXZ/tqFeOL25DRv3hH17MKWJSaTxmtDtHNzaWMq0qQ+wgpwo+kpdI/3SZ?=
 =?us-ascii?Q?hxKpaAY4m7jZ1+ElOWsSRpuzBFkhtO3WlYdqHulWiUzfgSpfYlxCRlXlfAjU?=
 =?us-ascii?Q?YgYXLrsxtqT7FoCXFpX/a4TX1uyGQcH+s1WXTt1rI1vJtJZZd3MoCKZzIP3Q?=
 =?us-ascii?Q?MHpIEDNbX96WXrcEUiKpDcPXYiXNoLTeGqJgD5XLjoFrzVIBRw/wR0mBHQwv?=
 =?us-ascii?Q?cjtnekAnF7if0HdVLZysFoEN+i6rlTIQeqoceEqxTJpxtX96GO6Qc7tgN6Vz?=
 =?us-ascii?Q?kAIKP2WznaT6pER8X4Xox/v0FtRjIdo0oMPSEeanfYqStLmtPrZiLNtA9EPi?=
 =?us-ascii?Q?INmQAYaVMXDAd1PNgOEeYfWuMvc1qErD0fXTeMO5eOXxxpy2s3yUdCMwJko7?=
 =?us-ascii?Q?aOphlfR1E1dRPoEa6qI5sa0YySaKr7J4AJ79N4eZhMwlndtbl2xrgtx7c2qK?=
 =?us-ascii?Q?zdUIEL/kGFL3XJKd4hL9glB/c0SGUEf9Ms9dk8Ylbml3Sz2loV3AzmeRXORY?=
 =?us-ascii?Q?2O/bnWMzQ8Q8HrFdAorkEFcTX6FqSLwHFLh8DMIrSbcyoG1D2bwviVSLWGJQ?=
 =?us-ascii?Q?I+MXqKtuZSiXqYvjNqsj7nO/4J2cYYKl5tZD5NnSqK2Qq5Ozb5s9HQpmrjTv?=
 =?us-ascii?Q?4oOyYNDLcUquDRC7wLQo7wvD9iRYtWFVpoebJ1ptzoKFykKyM94XTxuYN4Bi?=
 =?us-ascii?Q?p9Px2qyVm2mPhEMFdRzXr1rBHmclojRfUOEAJnxO5XrJ5g4bonv3F/Nse/ML?=
 =?us-ascii?Q?0q3qx6TsM331dBi+47uJ3K9sl+R4aWWiybwREMc547zmzTfFDmxgwOaHf33q?=
 =?us-ascii?Q?J/x41OWVK6Ct+tDH+u7wvtuW8wJHxgZSvjXynWeLB/QYBPZzQm0izGx5ka8q?=
 =?us-ascii?Q?RLAPW6Kb/TwmNbszxXqVNxSP5dsTHiNzvAseFm6STFwy+OGy5R8+UP4Av93g?=
 =?us-ascii?Q?6cF1lDudb4NsbvAAXh6y/fPDFNCjDvOBoWFF0y7ID+IxNBJ6ButJ2S8RLUCd?=
 =?us-ascii?Q?tBWFlar39fT1EvCzkgBkcOSSBOfxovdndgvIf7qm3o+YV9AHTXsmK73/+k9V?=
 =?us-ascii?Q?q9vo9IiiROqvNs3Nbf1cFYCFfEQ2f6rIEmwei8RfWuHm9MMQsY7sFpT2XNeJ?=
 =?us-ascii?Q?vxGRiZtT4GQMGhCgd7BcV6A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b4b459-6933-4b11-0383-08de20b7b844
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:17:37.7131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29dgg40s821vQXH/V28gAj3WGKeW42K2rVR7QBQHO6Ng8MwCOvyUvzGKJ8oV/nsbxiC1pSis1Jh47cXc4GeREhEst53LOtkhWC/QxVWY4vgNYJ06Zl1yb4oeJRf/qEFc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7893

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
 drivers/staging/greybus/audio_codec.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 2f05e761fb9ad..444c53b4e08dd 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -807,6 +807,7 @@ int gbaudio_register_module(struct gbaudio_module_info *module)
 {
 	int ret;
 	struct snd_soc_component *comp;
+	struct snd_soc_dapm_context *dapm;
 	struct gbaudio_jack *jack = NULL;
 
 	if (!gbcodec) {
@@ -815,6 +816,7 @@ int gbaudio_register_module(struct gbaudio_module_info *module)
 	}
 
 	comp = gbcodec->component;
+	dapm = snd_soc_component_to_dapm(comp);
 
 	mutex_lock(&gbcodec->register_mutex);
 
@@ -833,18 +835,18 @@ int gbaudio_register_module(struct gbaudio_module_info *module)
 	}
 
 	if (module->dapm_widgets)
-		snd_soc_dapm_new_controls(&comp->dapm, module->dapm_widgets,
+		snd_soc_dapm_new_controls(dapm, module->dapm_widgets,
 					  module->num_dapm_widgets);
 	if (module->controls)
 		snd_soc_add_component_controls(comp, module->controls,
 					       module->num_controls);
 	if (module->dapm_routes)
-		snd_soc_dapm_add_routes(&comp->dapm, module->dapm_routes,
+		snd_soc_dapm_add_routes(dapm, module->dapm_routes,
 					module->num_dapm_routes);
 
 	/* card already instantiated, create widgets here only */
 	if (comp->card->instantiated) {
-		gbaudio_dapm_link_component_dai_widgets(comp->card, &comp->dapm);
+		gbaudio_dapm_link_component_dai_widgets(comp->card, dapm);
 #ifdef CONFIG_SND_JACK
 		/*
 		 * register jack devices for this module
@@ -966,9 +968,11 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module)
 #endif
 
 	if (module->dapm_routes) {
+		struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(comp);
+
 		dev_dbg(comp->dev, "Removing %d routes\n",
 			module->num_dapm_routes);
-		snd_soc_dapm_del_routes(&comp->dapm, module->dapm_routes,
+		snd_soc_dapm_del_routes(dapm, module->dapm_routes,
 					module->num_dapm_routes);
 	}
 	if (module->controls) {
@@ -979,9 +983,11 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module)
 						  module->num_controls);
 	}
 	if (module->dapm_widgets) {
+		struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(comp);
+
 		dev_dbg(comp->dev, "Removing %d widgets\n",
 			module->num_dapm_widgets);
-		gbaudio_dapm_free_controls(&comp->dapm, module->dapm_widgets,
+		gbaudio_dapm_free_controls(dapm, module->dapm_widgets,
 					   module->num_dapm_widgets);
 	}
 
-- 
2.43.0

