Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010015.outbound.protection.outlook.com [52.101.229.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF33123313E
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821313; cv=fail; b=PGKlL9MkxWb/sABdTGcALC9P4W8LK5mVt0ubCCnfHeUkJJnda9FTFDvlaTVTv/G3JunAttQNnkyZ4bCOuywwmKAzK1GHXIv+Lur9Zq77P5FbT92METz0HJPai0weNb47B5qAUlz+MdKZIWjtz+nF0c6Amn3wUaUjy1ixy6qLKcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821313; c=relaxed/simple;
	bh=pyRHupOYG3phOWvsgpEpWARUctG3G02gwM0BTkcyMZs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PtBys+6XYOUlB8vmD7YM3aaKAHsbZ/XfGx+bAnBOFS+ZlIplh017qFri6vlCpOyqbTBzmq4q2j74SYrp7aaH91lQKIE97VXgewdqJ0WC7YU2cYALzZclM8dTpSnkbMErdDuk+lvm0i9BglFHHxNjHSNZ/MZ4OSVvuY3LfMCCokI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=i/8XkXk3; arc=fail smtp.client-ip=52.101.229.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="i/8XkXk3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1OBjxK8ItVqTbPKpNNPuiagawj3Xaszq0EYkOZXtHA0bqXnDoSU3cxftes99yL2sdzmiJedvJJzFyJxbHnEL3cNbXoLc0skg3SWhn65kS2DCMEo4G7oZEshlZaAYpjVJnOMFQqdE99mxzCOhD96mTUX8gj63Fb3WZOklsJ79IeGY/Oc8pqEA5l0BpSpTcaPeXzFRWonGB08kN6H3zwE0pZY04D6Z30sVtEaMQCwxr5gsaFLTmjQ+DzlnRFJ+CRbe2OzIOnDNZO7SY0aEGzvfSr6kMsUMhCMmZLpP7E71/5KiwyyYfVm+12qwbzV5ChFDmNp53X47SFDm5GrGLpMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJFXZPkYCwY4BlY9RCIED+UkYovj8J0/e+qBHCB895w=;
 b=Bd/K8QqE6dB9zTlVTfWB4pvq35UsR0X+PnLV5DeG7KcfJuLCcVIpKhOoSY8KNIxGV7yLwnYoJp3+dLBEafesLT5TzNrCtPNoozLoZIjmHEor0Lta6gRARb7iU/xeO2d05YnRj+LysWzwvAeHz/6tWVlkUw0SiRJONqHCeAMs//6mAPSLoAsfRjwCw3ayYq5U89Kr0l6wHbvPjjbxk2E2Hl0Rev+tCsZNX3njcju698L6eb+TnfN4Qr8sXL9Ie4GdFSnPKt4SWLhl6W/WeggD8hNtKHQu7G161G9rT+XVEG3amb0AR3ZDcFP4F3x7ScGH3CaICI68TfeTnkIRPZQg5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJFXZPkYCwY4BlY9RCIED+UkYovj8J0/e+qBHCB895w=;
 b=i/8XkXk3boAbX3ch6FaWdHXHJCj4rnesNCRqZ1GL0XKIl3NU21JF0MlkRHxfw726luYTc2CMIH565Cji4zfgMFy3F3E6pfIthQFrjstVkIB6TZupd7PADEGbRJPJbvgK08+eLEV5GLT2X2g4fRw/9EtZXstzxwCAiod9Zk06uaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14482.jpnprd01.prod.outlook.com
 (2603:1096:405:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:35:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:35:08 +0000
Message-ID: <87346lv22r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 256/292] ASoC: sdca: sdca_asoc: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:35:08 +0000
X-ClientProxiedBy: TY4P301CA0100.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14482:EE_
X-MS-Office365-Filtering-Correlation-Id: c038bf16-0c8f-4ddd-a46a-08de20ba2ad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EPgHY1maxgF2mtsJZ+NmmoJ1/MShh0e4VrpJfMUR8KvjfwhykIc7cepnP+d/?=
 =?us-ascii?Q?5/sDlG4TVcPCoMOkrnOQbZkEKuLvxJKHzMPzdDyMNSAGZuyCroOt94FdyFkT?=
 =?us-ascii?Q?ojMt6KyK9isq7qVt1EdImG2uv+y4GZ4zcAICElMQre5Me54gG4+ffq8s+tvi?=
 =?us-ascii?Q?iBFW/B6vD15u6FbNJuOED+uQyII0zrmbWPHj7qAJ+a0YRJiTj+XxW0x61ou7?=
 =?us-ascii?Q?5P2ngofsSNP8da7D1Ukr6NAYlLke1lG6JmyHa3bWmrwPa1mOoZ0SiCKPx7hl?=
 =?us-ascii?Q?4ymVLHe9PjsbFyqCsBZQ9dee10cQI3CepGC5IOxdfC5bS3Ax6ocSssQAuFAe?=
 =?us-ascii?Q?vvCdfEtQEAHk2B+VbKCn4iPCE/Hr7+wwAsNirs55J43tA3cqEa78D4gZ+1rJ?=
 =?us-ascii?Q?Fk2ISIiNP6yhXQvrGGQ5DaSw4+LPdya4FUWt9UkvfjujlkzV1rbrcQgyaFKv?=
 =?us-ascii?Q?NXlh6+r8VXdCXsND7ZRnUFFSMY53QSRMWwXfrDsCDRzJMG6nj9jh2Rd9gI1X?=
 =?us-ascii?Q?ovhvIp/gc7ygVZZ3VTHTP/IqaxI2+93hI54UTjQPtq+/V5c6yoOzevIgmldk?=
 =?us-ascii?Q?MdaLrn/Cj58szHGHHde+MB5J5l3CdKzm9MoCtFWDOFDWCbKFMOpB4A0r+99o?=
 =?us-ascii?Q?9CjjsTG4EC7zhv5dXDwezFITSkEPcPbg8DRIxmaMxcD8HWqG6WSz5tsR6Xul?=
 =?us-ascii?Q?oz7oTMWp38UJv178QYzgv6OyGxGth5UzC8BkEmtBXwpdeHk7EzvOz+rVbyTZ?=
 =?us-ascii?Q?Hw1CDEGGk6tm1qkGoNVsAuMAIL1rOCWeOiP9s+k1dmbQdGnhsl35ZFbG4Kwc?=
 =?us-ascii?Q?mYjSxTPXFABWrHw4mFJgi025qXklN7ol181tJu4lwM3cg+hKu3AKqqwOfLJE?=
 =?us-ascii?Q?+xqcL2ObJYI38o2JC+ao9Vhd94F8hcJ1E9zYFH08NCqC0Ni/Go1JU8qEHzSX?=
 =?us-ascii?Q?W7ftLtY0C/dI5D0gDduH8cG9YkCvxwRDwGSE6+D6RHQloUQ/brccyUYhvcCX?=
 =?us-ascii?Q?lhMGn5EghA7bvsi1j8od3i0WFAzfMPUr7ikopzcEPdxaYv0fc2URueHpiiWA?=
 =?us-ascii?Q?qIPko0iF2cL91KlEDlJu8pyCWuSBxY/KRxmUK1tcDvG/kY7lLS0eXkQLb/iS?=
 =?us-ascii?Q?4MmY1DlPPUtlmocB1kX1JBjUJPlEAVdsuHL4GmqEzMI47b4mFu7Us72Iksk0?=
 =?us-ascii?Q?BrbzYPkhI9oOwujL7MnGPPVmrV6SLjIE51ubsCyOw/3p532xolI5IBnYDLiT?=
 =?us-ascii?Q?it+B33Le6IXteKeSi2gk0qJO4JcqYU2UKJatYISWqX3+9L5G1JuuR2LCqik+?=
 =?us-ascii?Q?tHePu4iEPDqX2U4V6HypNpM+AJ8fBBqOxS+uuQSWSZzvUWtZewQQSJwLv9IY?=
 =?us-ascii?Q?FDjJnKkLlvl4h3yVFGVXAFrVJ4FbNM7r+yf8ayCqfnWyA9q7pSDngh6iWcoN?=
 =?us-ascii?Q?Br5AJooy+bk4HFCFD1/Dl5ory2bl/2Qtgu8PYawNHYVJtBX8sKDiroDdymBw?=
 =?us-ascii?Q?eyjprYCZJvBkMexR3G6zD+SXLTb5QxAafr4h?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kF2D8PVu9r7xzfAwdwL0jrRJyepTVhpKCEwPq0bEIkS1+PknBYE0gXVH5+dz?=
 =?us-ascii?Q?pe5yThyt0Wg5Qg85Pz2fkyV090rEVkkJyBG0h6oiocjMqF8WM8y3gbUxfnTx?=
 =?us-ascii?Q?CZQYtoa07ULgYNyIr5LnGofGwcMovSxWhCkacGeRQJPoXlit+Jfg11OWhoIp?=
 =?us-ascii?Q?xgkW7eG0KA1T7ckFNOO6Y8lVTc4kVtNrs9lPJ5TuYwJNgrEkcQW6RI1QKkec?=
 =?us-ascii?Q?lojF2gS8/CNmzepa1T+yJxjbufig6W2R/3vy6PV4sZRNSEjOJoBg5DWEZ42z?=
 =?us-ascii?Q?fW8d+iBPEjKYDgLUicHTuSD8wRJFsotHNvwYv5QTmCGlFgY5g7pek0U4sh6/?=
 =?us-ascii?Q?TEftK3VSmnSZ0KZ+B3ySwB3Mnd4Af3MkVpIvagD0p1ysh7bb+vUkwHkH3HJr?=
 =?us-ascii?Q?P4kmQ43EvPFYPNY6ntGmRpR4rGu5HqkIJjC15QRtg8pNIPYLseEJQM5et8fH?=
 =?us-ascii?Q?QgWWyi+jPoiYxXtxeG41/1/ozPSNb7xcM434XIHCMZI+8JAHMrwsTTnefOp/?=
 =?us-ascii?Q?kMTW4bf/OoWPVNhfBK/nEVbSSpFLmZoPByOxl/tk4BiuYKlXiWX2/vWknwJu?=
 =?us-ascii?Q?svltVgkrCL6LQ1LQrgjNOwG4pZzBYJ8tG7bmOvFWFjyXugQTc9FXmZy99Sob?=
 =?us-ascii?Q?M0EV0SsDwwT3M7pDxbgtB9CBRhikQz+EuV5Z7Jy76105Nhv+87syK7HO6dqQ?=
 =?us-ascii?Q?WqT3ANRg996LKGzt5wIw/sHNQ4cFPqYmw+E2ykihqlWBDTHQxZseYhhAJpUR?=
 =?us-ascii?Q?wZvKUMljPjiGd1GGKsKmWV+r70dSSmEmqarBPg5kBu1L8tO+uWmefSKRWWoE?=
 =?us-ascii?Q?l1ioa93O9uVjrkfaqGanRLVis8zN1uGfZNoi2ds+7LWXoVtXbkhDC5Ej6aTq?=
 =?us-ascii?Q?4IC8oFtOKlWlTa9wc069k/4i8mJe5E8MQ4BeIyWQ3c0oAOq/044E+b9cfKm6?=
 =?us-ascii?Q?JP4S0Bw/yVYSlDhBji+v7WvsP3hl81cglDKOyKCBUDvh7FpD9a/VSaD/+aDs?=
 =?us-ascii?Q?1s0vky68udNGG11irbVpLbaFkCftHdM+uVjDpRxOm0f6HPANdXOcVUQOrJCf?=
 =?us-ascii?Q?BEm6zP+lbEHDF8RJeG37U2q5VdhhwBUsPfk8blW+ihg+qabVtpNwrf4ARH9E?=
 =?us-ascii?Q?9oVQP4dNOQXb5Ndcz8BibnlDJhAaq8kpeeBaRU+ga+TegTTe89+vBZ8/kkHW?=
 =?us-ascii?Q?9bgWgHmQ1askkKCgfICP/rKEGQaG5mTnuc7RQtrMVr60CW23Xj1og58ZNRgT?=
 =?us-ascii?Q?o1HE5+dsJsC2jXtejI8hJNF9qeL+I6k3fsFyPIdE3hC8Y/e/hgUKaG1aRSV7?=
 =?us-ascii?Q?OlGPlvCNjbjxSRV/5vcS6U1iaGz+MDzXWbrtPw0v+r+OmKAe7DtSFGTHCxMP?=
 =?us-ascii?Q?ZVcThg3++mwEw3E87yXuxyGgRLqKYH15QGEeOB7t7GeE0nn2GiYgle/qSOgn?=
 =?us-ascii?Q?evfdxCxXQ2wh5BV76dIsdXpuCsXmbC3G9zy7IIGj9smhrIfkOpQgcNmZNTfS?=
 =?us-ascii?Q?ZN9P8T9zWm5TrbfqlGScCkA35BrBaedljNJxkMc6NOozwmzmd34sMWg2hcEW?=
 =?us-ascii?Q?tSQxp7f8p7V2kKPPyZ7A53LzKS97PY0OfVQP5A6Xwj/Ys833XNNg5SGGiIPW?=
 =?us-ascii?Q?wGAYLFqz5k3gZnqkGSdbY3o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c038bf16-0c8f-4ddd-a46a-08de20ba2ad9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:35:08.9136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4A2xhbcly4aM5MRqmJfPZ+zHSCTj3eOnenMQYZZDLEV4h+sAoWdIXnSwsMb0f4OcBiIApi7wFJxK6CBPkBJyX1JwRBzwb8T0w+P8wni+6r5gn9oAuCzSb3NpA3fXy1lF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14482

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
 sound/soc/sdca/sdca_asoc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 892b7c028faea..4e3f193c75eff 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -337,7 +337,7 @@ static int entity_parse_ot(struct device *dev,
 static int entity_pde_event(struct snd_soc_dapm_widget *widget,
 			    struct snd_kcontrol *kctl, int event)
 {
-	struct snd_soc_component *component = widget->dapm->component;
+	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
 	struct sdca_entity *entity = widget->priv;
 	static const int polls = 100;
 	unsigned int reg, val;
@@ -655,7 +655,7 @@ static int entity_parse_mu(struct device *dev,
 static int entity_cs_event(struct snd_soc_dapm_widget *widget,
 			   struct snd_kcontrol *kctl, int event)
 {
-	struct snd_soc_component *component = widget->dapm->component;
+	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
 	struct sdca_entity *entity = widget->priv;
 
 	if (!component)
-- 
2.43.0

