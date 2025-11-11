Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011061.outbound.protection.outlook.com [40.107.74.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAD520297E
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821085; cv=fail; b=qJ/ISZzN7kfor1cDpoNPgWtaUROeGhcMBeTSLJ15F93dU6vbrnUTfEYYDI8KCKz+BbikanDT6Uozmt1qfVuFj+3VFnS6J/I9xC/8UBtGKZMPbX+sE/4V/a+zsfi5gdYDcbRF3THcXBohe37ucDLw3tDjEdeis6GNzYopav8DOL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821085; c=relaxed/simple;
	bh=7yN5ePAtNAsdK69w8tJm0O65CS+SRI6kFYt3A0gZp5w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ftVrx1yucnIQlvSppx51qYbHsW44ygQvrWIr+TH05GJ8MA3PPaUyc1rkUXuDdla0h0iFDitMcoeC8YDoEwO/YnubWpfCvbdLLEy2cEwKQ5tdwfORy126GssXHw/X4tj/3jZitp3vxIFlnZdDyRjc0rg6m14fvAH/mbnDjSQ/dcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OUp8Q7Lr; arc=fail smtp.client-ip=40.107.74.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OUp8Q7Lr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3a6sXHelPwsXL+mUh24zU2yfSpiei0SaOGBfZaF9BfdVKKPF0y4sHY3w1Ppr8KQscbddm9SoVVa67tJXxgZTOkNS7qrJRITxE1Ug0qOioixWhkrNFIXJWZNY9pYRXWkqwax5cBZWvYmvwWc8YsJsmhU9XORBshKx1aagg9Nyaa1qcNbBK0lCT9NCK0Rv0UzFk6u603g1pV24vuebRKuM7lBKT6sQxCtsySiE3X+ikmrepXQ52fSoDCDvxblwruxZYFWQFIZnWc4pVBu6nfGou7EbaZFqKjjvIw4X7VMWMBd1og1NJ61GNikz99YdGcmZp2u1NMa1NnJ8Kcwsuf/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gq7GLu3xaubrXoVd86SNXw1jl+yzCnu2n3jGexuYGWU=;
 b=H7PdIDEyTssin5NszYr/gR08+bW5l6wwtnyG8vz60Fx84AXAcan44ZBU8lBpyyobSAn4orc+6vyoB6jYFZ8XPyPX1p0kzxdVMDns6nP85CQ6miGzWKcDN/LyqVw+v3xOHKEDDYzOpq2jazoI4DnTqIVdsv6ISIBvBPVlMW06cENBHmFPjVkS5HJUPDYPwqiJ74GwvlecG4UhPi0H24lGOgvODowy0LnnD/heCB9Kbq+8S4k845mtDf1kmw7Ymxsu/jT3maW6KpvVGWscPsu15tVKy0xjjSQWmxRBOmuGVoRwXONVOVlX+0t44awOSvdM6HDVwv2gHI3cazNLOBIkpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gq7GLu3xaubrXoVd86SNXw1jl+yzCnu2n3jGexuYGWU=;
 b=OUp8Q7LrhUStMART2crTeCc2u5QlktX9+JTi+T8uKFIcszoOlE6ScZcg+psOSm2b1inog152x5B/ALx8RAQ98x26eEaFdRCurixAD7DQ7apQejqD773uRPXoewiIsbpxXvyP4D110bj4zCFWxywrHPsCsWDkv50vMdtXR79YNjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9810.jpnprd01.prod.outlook.com
 (2603:1096:400:222::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:31:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:31:22 +0000
Message-ID: <877bvxxvdy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 203/292] ASoC: intel: avs: rt5514: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:31:22 +0000
X-ClientProxiedBy: TY4PR01CA0104.jpnprd01.prod.outlook.com
 (2603:1096:405:378::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 935dfc72-371e-4b90-2aa5-08de20b9a3bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tv2gzyy/uvtJCo6GZEL+pZPwbr59pXeSErY+ZrJcleeV14FfJUoF7BWEinUH?=
 =?us-ascii?Q?moFYN35rywUBRMTkiWsOyTFoIDODkTAizFPrTppBBfzFDZEzEvpdpwh97ocR?=
 =?us-ascii?Q?gTdXnmgvIbt/ioa/F/Vj/urLdTxnaDp28ee29/0dJ0GNXxKjHzbgVVhmr4Us?=
 =?us-ascii?Q?LQunXS7p25FH/QRhO7N1Jpyp2GX+UrpoSqk3lxjW/hknJ5YG1PsNnOFQcJsg?=
 =?us-ascii?Q?44klWERbkcapNorhk/zG6m/+824zogku3bM6VDTNvo9VZMigYYHpdS1XlrJI?=
 =?us-ascii?Q?+sld3q0N6IrOHztWmyHKi83/WP9i2fFjVFNHYvZXRY87lYBz2rtESTXsE5bY?=
 =?us-ascii?Q?u1cWy5aUilMVpLcfnAklxAW/RZs9sMCWI++XGozTzk7TlqMgTiEuWJ9YJIoR?=
 =?us-ascii?Q?VfL6LLh0oI8e+YXlIYaFfYYTj67PJSaLDuaUbpHw+Wo3hU+Ahm5VB4dSNbr/?=
 =?us-ascii?Q?mKR6o0PN3TK/4UKYPOFBN5uecNInaL+xDtpcvfvUQvSU8Pjdol/1y3QDRBi/?=
 =?us-ascii?Q?O5KOkKM6cgbFjyVTWMjeW0y6RpU4Y/hCYB2xED46nITSZ5BO1MyIC0ijsOR4?=
 =?us-ascii?Q?IVTRb2SjjboJu6gTNRHWt7xLv0Iwr+OXHCvbio/SWi9kFCkE9HFWDlmOz+9F?=
 =?us-ascii?Q?ZGIp+4Tbv7RT+frdQhWEAKEPtu6PnxnqfS9sGOue+BAezenDZsfuJcOw5rYu?=
 =?us-ascii?Q?0sdk1zkQXAlakWer4pytmbeYKs84FzrDk4I5s0qBQrKFn+05hcK9W2YJAIIs?=
 =?us-ascii?Q?KwC2F23qMaV48YW7YHE0O2XFVo7lsoZquXjp2xiIb0ujxVMcADz7C357QIOb?=
 =?us-ascii?Q?rm790tr0Vb34YE78hnORNgcOKZ9Tx6LgxVeOreT1ISPgomG9pM7v1YTfMX2d?=
 =?us-ascii?Q?B7yT9WOBiwPk72jDa2k+yZVg6fseFsgMVGo+RDrQYIDD1FP8gvOpdbPI8nw+?=
 =?us-ascii?Q?1FccnXBmRKpaqZQGnFXtpgaKum70vSfLvT3nA0Gcb+bJ6Oc1HauZdV7fvrzv?=
 =?us-ascii?Q?VG5NECI9EoN2+t0cJq+lvPWZvp/myst8ZnsoGKj8LFeVVDDn5hUQjiR4HQLA?=
 =?us-ascii?Q?e0l9vEvo3hs0wimbz8nXcAtuR6psxR6TbitZ+4COLELGZfCUInrtHw/Yr9hd?=
 =?us-ascii?Q?zbfq2F9Q13nV4TmP2BIOw5culvzvONGwG4PRYlB7GIS3ox7iG9C6W8ekuF2Q?=
 =?us-ascii?Q?kmoSCdyJnNwwwLqj4JURs70GOq5nT7c/HfWLEZu9NvfLnuI+mcGZW3IkgnNX?=
 =?us-ascii?Q?Axvrxa4XOwA5oqLtt5IkHGiBMUJS+DD6QFALiy9FDPZtGr/cs5sfyijr5g0k?=
 =?us-ascii?Q?MwL30QarfkZ4h3Cqp+U+LPQsF2nEzm0w3luyRtCyx/tngA422p4RoRTICg4i?=
 =?us-ascii?Q?9p1FOESo8efWMVDUW1nD05f+s4Vq4gXNwlorGTdghkpsR2JHBy6yd7Iv0aut?=
 =?us-ascii?Q?8oIERzcJ1wcd8uAcxrVhpSGpwTeXcHu02le+2URkndMvHiRcBX9PiiJ2PbuU?=
 =?us-ascii?Q?G7V1NkTVi1sH59y1CoOIzUs6HLv+rp0QbyWT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VkY3FNbHW4nP2HL5hqYUK6LLBWwxXpEiyk94h1T3WInPv1eJ9ozPZ+ZEcyOg?=
 =?us-ascii?Q?JI1gCWJvXcT7SCJG5kwdIHiz5rAQi+vzGdJxqQOp6+UA/XHSN6whkLFvb0b+?=
 =?us-ascii?Q?+cu9xyWKifZqQOqTm4VCKTn5/44rsn2/rg/1hM+utAFPAFVVtXRXbK+5Yune?=
 =?us-ascii?Q?rye1h93SuVNh717lnPMcie4PJ3XPh5K5DHGutZQnCleYKTgrs1UQWRmcdGRj?=
 =?us-ascii?Q?vBkJeg+/p1XlsM3GRyu/E97+nUVzpJ9ZlNWNb5MlzCM/LQ5C+B4U+xkhMZBf?=
 =?us-ascii?Q?rU5rtxEZLljbQmyujeNYF4n1Xi5VyroSWKZyL5HXOgCjulvIGi4FWzMT0N0y?=
 =?us-ascii?Q?BXcLndAr9Dg3I5WrNezTFCRY8/NuKT86Er/3YnaAoGxd3UNUwXEhIMQqkPYA?=
 =?us-ascii?Q?5LzIX7Wzf1bW/zrx046h/zj8Xp54FV27lLLdYwiVLI6yRHu7wRYmoWmJ5rqc?=
 =?us-ascii?Q?LhAmPwgSUfqeKYkQnikDjZpI1+f86abIBiTK2yq81QIMPmR7ZViH8chLPWq9?=
 =?us-ascii?Q?cCIrtPQnmTB9kpPg11cdThZnawBcwjGIbsEUwP1E2m5WIWYUwqdA4oEGChrh?=
 =?us-ascii?Q?R9MLaMK8+bdHBulPuS5DwsNIjHS2+3SUY9WckizdsA6a6chQxowkaMue86hI?=
 =?us-ascii?Q?j2bQC+z2Yi7uASXwsVAE2wd2RWvfUSjwYIVhx9IaLuYRMrA5QgtCsux09OBv?=
 =?us-ascii?Q?ZZzsKmszKXyRIjAhZcdXIz6+FvtFZJ12f31fTIm8xVFhZ+6LUXmk4mEqjHXR?=
 =?us-ascii?Q?0otbpu4gVS/Wye4Fwn5QNPc0R4yQw8f3uJ5Em5DWzduU8p6mkDmSHCjzr+bp?=
 =?us-ascii?Q?ALmt5JkCsE29gYv1fyeFs8fCmkOBFMHr86ynep1ix4baQa4Ap2EgiI/WjQXn?=
 =?us-ascii?Q?MbZBTjTMffpzkJ7lwS5PU5i87AV9vmHmPMUvhWsKLOpL0Azrn6l804+pIhNO?=
 =?us-ascii?Q?+zxot/81yFpwcEPfRIDPxEIFdmfDqbwy8vXY+zKPwb/zAMxB2fGvvpzvk5KQ?=
 =?us-ascii?Q?gAGLfhIxDB/IZAzo1EfDvvkT3vMYUAPV+en9xzBXHCOQ845wQBNdvRmzdaUI?=
 =?us-ascii?Q?rVf0A4IoKf3K8FVjLWHEzPkTFNM8RDeISprOEK/aV2q20vnzGNGLh5GH9EVq?=
 =?us-ascii?Q?nOKy8ijDh5cU+/jBxwAkWYW2y7vIGmMTYoCvxCdBaKGvnN9fNz5lfzx/spar?=
 =?us-ascii?Q?qQE0f/ViL8UQaT1UdjD9POoEwbDwAvgML2kF7N+I19YPxnFuy2ZVR/pe0vXq?=
 =?us-ascii?Q?CJkEcX9+jfsYfXTmR+vlPAJOKpM5h7SEmII41+OuQodxAsAlGnx8PLE8oQfA?=
 =?us-ascii?Q?eorl5GfobLDqouj1A4/rj7+1+9d6zETJ9rksSnzdGgErlO7FJlYfIqAtMhCV?=
 =?us-ascii?Q?rbpNAuHlzn1JJe31BaivNo19PCfY94KaSNDJC9Y5R1yezXo5nVyzwPh4XW5W?=
 =?us-ascii?Q?Dq4EllK2Yv9JbFK1H63Qx80AxymM4s5kCRmgiyUxu8XX4pelHHF6nmluO7/L?=
 =?us-ascii?Q?yGttrhg3DkvmVHWjUngKsqE/UbDjmhD6fNw7+aG3/VEG9G5EYqrBfiqek73N?=
 =?us-ascii?Q?nju5i7b8mSuzdc6szzkBROmWK/VTNtDbJZawroxtx0AAKqCHygQ5K3uLgOqp?=
 =?us-ascii?Q?mvgaSLYlTXMAUIIUs3xa6UM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935dfc72-371e-4b90-2aa5-08de20b9a3bb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:31:22.2513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIzACmN2wxxD+D0M5RdB3yo2tLDTRsSmylXGNBqYIIyjzGt0Ua1+GptDU6GDCj9xiK1LjJhiMnWm7sagGpOE0cJg4a0oiRwSFPAaAVbx1BbDcZS+ysOA2qNBdc6cwsF9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9810

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
 sound/soc/intel/avs/boards/rt5514.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index 00b99e36d23ca..22139eaad83af 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -33,7 +33,8 @@ static const struct snd_soc_dapm_route card_base_routes[] = {
 
 static int avs_rt5514_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
-	int ret = snd_soc_dapm_ignore_suspend(&runtime->card->dapm, "DMIC");
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(runtime->card);
+	int ret = snd_soc_dapm_ignore_suspend(dapm, "DMIC");
 
 	if (ret)
 		dev_err(runtime->dev, "DMIC - Ignore suspend failed = %d\n", ret);
-- 
2.43.0

