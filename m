Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660C9149E17
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820489; cv=fail; b=R2Wk6tP+s+2ggsGEswW8eAUDsSCRZPfYBwewR3NzQNmHpiAwaToipKyv6iA+sP2zBb8uo+Ly71/UTPCcEUSCAD/Wrsmg3pEJfhwKxoYJd1/yLnAWSsOOD+JtHv05oL/pYNrOs5H/PU8qrBn+zUWctUu0SVoRSR8KZ91otjwEZXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820489; c=relaxed/simple;
	bh=dqIJCwGite0NVCLP31BPP8ljFGl0Payd6G6mLOG+fZo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=V7LpyHm/0mr1pHvnFl5a/QBa0W9rpjwiugZ7XMWzVDBbiPAjH3w6res1TenvjsKhjZAEKQ7ukTn18GpnJmYFAnZaUvTdu4zFhsP+MpxJSmS2KP15LiJNJsFYtLRy1WeOr8GUjAIkoEqyoEUDWcwipAEEWzsfKFWe6S4IgcwzP6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Lv13C2TS; arc=fail smtp.client-ip=40.107.74.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Lv13C2TS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxs83cchX8Z2+GWUF3MKy87l9HfBwj4beFWPM3MQt9cNj9TpDBmbYGgBMpuunxhvzgEgJ6uLSRaIDjIu8hAoa47LSchzR6K/nm4TIS/mOhJseTLM7kLBahhgkjwEgQFbl+5dFThcjLsw4IN5iju+8JXH2v4CWeQUktS4ry7UMm57uBdlATnEE5+oBl5xmVMcuSVsNEMICoVZ0qR5VQVj8qjhrjAE4TGfP93ZI5k7OKvAl+i+OInqXqGG2C+53muFhiRdTQd/uFnHQE3awmAPBwyyHEwKTNv27Ytfh5uEOToau84pCkGdG57XkHYLzU3CIeNNuUVjuh/BNKUmMozzsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nl6Ohv4l5jL24/TAO/uIDHyi2kTAfuzjiLeY/n4khaw=;
 b=E5VBUwsW7RKNcWZsPqaU+oHOe/27/V2HMtllXUUw0otbsRgTCKpaaw1NyMGYK6FYLN8AP6RP17xcrvaTTt4J5+eNFj6d6f10hkOhSX+W9MUtrWXv+BY+rmwe/VtsgQxFE91insSRz/11Epn4O/FmQYQ1NXaRUGQTnvz2Xnsy2hbfQGh4u/kj8gigjHwe4KouD76EBYAYIjDVUWWIVZ/fnSI2f2uH30bVSMNgPyACNSqYQKgU32xZ1PalGEYArxqMSP8I9vBYnrgoGV1rUw8+LKf0rTjIgAu7S0bMzVkCB4q+u/JQUgHJM8k9BXuoLaAMSypA5STsN61ZnxIvsoAzpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nl6Ohv4l5jL24/TAO/uIDHyi2kTAfuzjiLeY/n4khaw=;
 b=Lv13C2TSQFIhzP7+uJiZwVAmuSRWtxIE9w/ABVc/8ISV57NBp8gHrS3iRfP0CRZ0MKMe4Uu/AVIbTO+FMu8bJxel3c4cDzBjkr8eFxkj5wZR+awZOPjeI2Ix9s+UsoI53VR7A1d/5IA7mkbjXVqQIwDdiv6qk3wxnNRHz8wMD4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB14361.jpnprd01.prod.outlook.com
 (2603:1096:604:38b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:21:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:21:25 +0000
Message-ID: <87cy5p7722.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 049/292] ASoC: codecs: cs48l32: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:21:25 +0000
X-ClientProxiedBy: TYCP286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB14361:EE_
X-MS-Office365-Filtering-Correlation-Id: d2fd323a-a9a3-4ba2-7d55-08de20b84009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9zhWcaOO0Z9OknFe1PBdnNNcKaXfyy9RG6aI4IPZo4M15QOqLjsR7T5o3WKd?=
 =?us-ascii?Q?F1BLCprhrV6HEANtqctoBt0wSWYxCey4w09E7Y7tlzJC8iwqvADYw7E5GqvD?=
 =?us-ascii?Q?vlNrxRkbrxWE8qyz0UNCeWCySNBvHPjLTf3I+kWmINU4kdzd6kFOCRL6CcFE?=
 =?us-ascii?Q?oC6Awlw217x6VUMsalB9H/MnX1xiqtrzxYeRc8+ENkvawVW0HF4HFKyv1m11?=
 =?us-ascii?Q?V4asVelyhlj3wwQMr+vXHw8DJP51sZvvv24H4Xa+WRsa7jZ6DWBP6tnvvdS1?=
 =?us-ascii?Q?u/Gr5IiICcG2yzhKxvm0O7Rv528uPeZgfdoNDHESvOJm2uzM4/IPDTGiUQub?=
 =?us-ascii?Q?oioxQb8OUVqIpr5uLwZuCt5lM7yVdR0XIbsy5inKqth5Pi9T78XAAdvokzBG?=
 =?us-ascii?Q?Qb1PMchIMeO4LrkOh6Xo98i3hwpVDr+jq7XqEKJI6qbin/+LeyyKfnHltMHm?=
 =?us-ascii?Q?ISKlRMFyfsygRUe+iCitX3pc04vPBKIrWI/fA0ZjMs6eEH3QXgXCPI9eeEsU?=
 =?us-ascii?Q?o3IOv1teBgn/73BIW25L5t3T9H5yW+dkk1bKqJ8rBZ57p83qrVSJB/C64H/j?=
 =?us-ascii?Q?ld5iy32+tXnp0zupe/ynhGmMXmpMlSXx812PWLVCoCsnUsY+DmpyfbxKlNR2?=
 =?us-ascii?Q?ZB7b2KY/qWrvmG4zjaFv2TAexfBHBBKnygyGRc7iVLGLOZFyWw5biuR/3wdX?=
 =?us-ascii?Q?osRSHHnCpC4FRv1JxO3gVi18AdMKw1CG4ELbv7wAEZeUXokZP7rD7xM5Gzzy?=
 =?us-ascii?Q?B0hhVGRpdHyPK8B6/xk2Mx4oo6sXVvxDjKRxbRB5wI9KXamOZXOEo5eMfsnR?=
 =?us-ascii?Q?9ez7HeS5kVzew6hTPf6y1RwlMKrh51UnfNAooqo2B+jnjqE4XONZvbvWoVyh?=
 =?us-ascii?Q?MI2NX+dOkyt9tSEaYoDKBtqlYBnhuTCGlA3kIQ3WHU8CB0ExCs7EXKPV0SXh?=
 =?us-ascii?Q?qdB94LAorKzXvMAyx0HcRf9uuQLfB4kwmMm0EHG1+DFwMt1LHot0qrw2AxYT?=
 =?us-ascii?Q?ok6o/hEvbUNtj/txqfNunT5af5S6F1bnte2yyVyvBblGLAqWwzayfeSqwpd2?=
 =?us-ascii?Q?pF85oJ0HBHSYdt5c9e9WVkqjmn6fsPgBdyYrnChFgnwFmwl8cau+YOtEXCpI?=
 =?us-ascii?Q?z2rFp04GRvn64WylzUUg5H7TN2m9xsgajG6xxs71B2ojdHXoLJASSEziHLlv?=
 =?us-ascii?Q?2D1Fw0DkmqZoUsqBDPFcfcDEzpFS5L6YJDRro4nqzA5y/OldpH5vx/wOgHmx?=
 =?us-ascii?Q?rj63T7QQAQzX+E+l57w9RZkqPzeh5Ky5iA95KvLnh5/5rDDHkbVmNvixJTcG?=
 =?us-ascii?Q?e//GCK8525u0i30CE5QJ5oU5W9juigiduJm07MdVagrSmKiwvmPHsY6+/xga?=
 =?us-ascii?Q?LgiVH5chihzZohNosgU/SBMmBKsy6UbHtxyHTflCarszXJQa7Us7M7rIdH4h?=
 =?us-ascii?Q?Ilavu0B/4QUv4SAEHDoqLkBlgDK/GNl73Py/88sIemRFLejDVrsehdPmsFGY?=
 =?us-ascii?Q?OIToFrrsxONYFmO0OEfWGPvD9J0FeiZZKIki?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?quBxVPlHp1nMRWyS3+F5m8hT4WDScJoLVNsS7jww5EGAWzULUly16RLHVDSK?=
 =?us-ascii?Q?y7ZHwzNQ2xuUktdR+EAJbFmU3YWQjuyRFb2bM0qoyxXklAuyOfruOCUUM/p0?=
 =?us-ascii?Q?gYPf5kbNk2sjcd+tvIivWIUXzTiyBzbt5bwB3ztcefvzudY0DaiLVQmIacfO?=
 =?us-ascii?Q?Ji7L9KB6kB2g934MhNEa5sjPvSV3sH4iERY3rWiszAecokZ1e8VNmVglzq0R?=
 =?us-ascii?Q?bBtLECsCsxshcV1olgYY6vA27hIMklJ+ymfljGxGx0AbYOrFdjzyvRNibpu3?=
 =?us-ascii?Q?noM42SO+fE/8a7mC1pCl1nY+LfGMRPb40uv6/UeNXki88k8MltTqiYzt4Wbg?=
 =?us-ascii?Q?3aMbwTmKfjbxqAjN6z0wgcHJ87cv4/wY0/jT7EOwwpkANrVFk/SkQBhQOoPN?=
 =?us-ascii?Q?AapqePzXdozx1TKsOvcOXFi0WmQad7jla16i/XhV9SKNyWlAsJAapck3kgEz?=
 =?us-ascii?Q?6B6ExjTcezFUwg4vFh88+ihPKDMPS20eIOAbzhBne8+OCex4OWdowSlvrpbv?=
 =?us-ascii?Q?5QOGu5HqnYV+eYbMUehn+O2mEV0Y0Wl6F+lclq/Xcvez2ltXaebuONl8RKrU?=
 =?us-ascii?Q?9d3KU+cwt4DFUiX6EpKAQibJ73eeQ+amL78aAyeZA1stKdQghirAEta7gn+H?=
 =?us-ascii?Q?C7bBLLsOA/+5+u5GT4jTvJWNScvjvvWKoVXDVDxbuxSnYoxYErQ37wouB8X0?=
 =?us-ascii?Q?xbwTHhV1f8HL3Gt8KNJr9a6hzoQJnG2JXXg6YkPRIm7bdz/hPB0Q/W6PGzc7?=
 =?us-ascii?Q?4l6QzZWTUzxDoekaFohdvN8IFkzKHT4oEO1OJ2Q9XiNP7K2Rev7LB0tgvb1O?=
 =?us-ascii?Q?q+aIKnYzc+55k/r1GuLrafggeX3awZfxljAoFfg7eeqRTyjbC90FKaE+42mb?=
 =?us-ascii?Q?pNjW4R/DZA8gfVf2yogDO5ocOVN8Nlj0yBveXgWBwIv5W2gH5J4/YTsRJTpb?=
 =?us-ascii?Q?cUK65bC6htpypPFTesbNEzAjtY26NoHezWWuWyUu1TTvJeHe6Lyx3M7g89ir?=
 =?us-ascii?Q?nRK2S/a7Qc0jrF5YwDvmRdewr8TvZeROr2HHQs4G9+V4VA2XWLlWnqQwMvvV?=
 =?us-ascii?Q?ke6/ylRy8iQhAV83RxjEXOZ1n3zswnupsKoVWk/1cOwNT3z1sG3ec+DhUctI?=
 =?us-ascii?Q?RPi9wvmEgvhj6H8EV215adoyWnfTdqHGKAEU2gUoljrAM7wZO2TkW5OLnX52?=
 =?us-ascii?Q?ACbkakGntAbBXXSI+0Ekf6H8FLtKQkY8R1S13uWBiNvWtvEXmeKQ+GezOHxn?=
 =?us-ascii?Q?/snEp/R+RGZww+ergKSP0tS0J4eiXbpmn4+2uRbexdzUdyDNjQFSU8+lKm66?=
 =?us-ascii?Q?r2nJBDptLdz2ZL0/iyuov9DwXyc42V6QGskcOMkhKzKE8dZSPuNEFQykiWLe?=
 =?us-ascii?Q?Pqu/7OyqsUDqDGpq8k2C1dtCNdvTTAEi9ZWivWWcoGQSKUgZNGbOo9kUypWw?=
 =?us-ascii?Q?EqSdmeQ5GcEosoGLE/eLFMlz5rkbIPmmdsb2ByFz7hwrgejEupedF35j9Fci?=
 =?us-ascii?Q?0EDOlkkHS3Sb4NywkVGIwnB/kCEU/Ez4IrVXJVN+n5eCfbD288aZuNDj/c4x?=
 =?us-ascii?Q?GGUpSUy5Iv6TM0/uEDYHk2NvllJgbk7Hf1q+OrKxUzyLVDvRQ15MWsJ3Z3uq?=
 =?us-ascii?Q?PmBVYj407eEaPNU+KAiXcS8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2fd323a-a9a3-4ba2-7d55-08de20b84009
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:21:25.5194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUDTUP6GAOGy/i1HCTCOqOvLnldv4/fDYHdZSMxDXZe1hsutvo7TEtl9+kSfH0kP5vKm6EheOn2SwdGjz3zx9mmHCMVeKttzgPC4hJAt3Eu0wzH8Y4c63BJkgTL8qX43
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14361

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
 sound/soc/codecs/cs48l32.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index 657f0697e8569..086ed0f57a85e 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -320,8 +320,8 @@ static const struct soc_enum cs48l32_sample_rate[] = {
 static int cs48l32_inmux_put(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	struct cs48l32_codec *cs48l32_codec = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *) kcontrol->private_value;
 	unsigned int mux, src_val, in_type;
@@ -347,7 +347,7 @@ static int cs48l32_inmux_put(struct snd_kcontrol *kcontrol,
 	if (in_type == CS48L32_IN_TYPE_SE)
 		src_val |= 1 << CS48L32_INx_SRC_SHIFT;
 
-	ret = snd_soc_component_update_bits(dapm->component,
+	ret = snd_soc_component_update_bits(component,
 					    e->reg,
 					    CS48L32_INx_SRC_MASK,
 					    src_val);
@@ -385,7 +385,7 @@ static const char * const cs48l32_dmode_texts[] = {
 static int cs48l32_dmode_put(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	struct soc_enum *e = (struct soc_enum *) kcontrol->private_value;
 	unsigned int mode;
@@ -705,7 +705,7 @@ static int cs48l32_in_rate_put(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int ret;
 
@@ -756,7 +756,7 @@ static int cs48l32_low_power_mode_put(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	snd_soc_dapm_mutex_lock(dapm);
@@ -962,7 +962,7 @@ static int cs48l32_eq_mode_put(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs48l32_codec *cs48l32_codec = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *) kcontrol->private_value;
 	unsigned int *item = ucontrol->value.enumerated.item;
@@ -1026,7 +1026,7 @@ static int cs48l32_eq_coeff_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs48l32_codec *cs48l32_codec = snd_soc_component_get_drvdata(component);
 	struct cs48l32_eq_control *params = (void *)kcontrol->private_value;
 	__be16 *coeffs;
@@ -1083,7 +1083,7 @@ static int cs48l32_dsp_rate_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs48l32_codec *cs48l32_codec = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *) kcontrol->private_value;
 	const unsigned int rate_num = e->mask;
-- 
2.43.0

