Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011050.outbound.protection.outlook.com [40.107.74.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9EE3264EF
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 00:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773274526; cv=fail; b=Yb81S4VmuevGXad6V5cD09uuvbaZQKb8zssauguZUm78c9NrBE+lw1ADUEG7K/FAvEOl89LX8szDUaazhZFs2IMMjL/LkrTC0hC7AH+Upu5dwdMFymKM2JRI23SDHhCxOcXJKi3EaQTdFDIDgWtKD4HmRIg292j8XvOw5W/ngAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773274526; c=relaxed/simple;
	bh=fQXdasFXwtYFIfcgYGjRy6yoGUsuVV8T2jYiBi1egoo=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=I25AOjYksA4U5rYmY1UhGK5XbqkW3svmZeFVe/H1/ZT3IcCVeCRlkhh84OTEHdfBgrT5zEUcbA/TA5fPW6L6sqrZHMy5qSCtshf2vYHkj1O+xPT9O6f2xTlO16f6ugD2c8EwIx+uyftruYK7Ogu3Hs/Y1kxLCIQdAPQ60ag/2H0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PEYfE2vO; arc=fail smtp.client-ip=40.107.74.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PEYfE2vO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E28op9YOwZX7wuVrR2Q50qvi1fl7oBRAS/JqligOKylvngWy9NDbNS/NcWKoYyGfXfP+0NJpFGAcRRmLFWV0DvyBjEOGmBjzHAjqCKENWF9uouiTJc9cJXfLtLv7L3pbCkvWyST8/7xfdkyaYDjUiSajUR7q/Kf5l8obJgv/oYFJkX8Eac88ureNvzxdCgBGCqhppQu7/NsSN/CfpBTHryNTs8KfCiudIMmu/M6XHd2nUY+OQ0qrBaFynmdpbBFh18/bm9wcnNG1o9Dr9NNVBDTUrJHIDAV9UGrelQmIDwOb9W5681VkIBW9aBw6hoHHfPUP4h5x94cIR2VmhrDnHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtDw3cjtOhOqnCMLyZo3A4J1Fy1H8TI6gtCEVpndRtI=;
 b=l+cvkWork2KJHFWIMw/Fqz5Y0e5MVsgrseDNt1MIywK0S1xf/tnSQjKhs39uTUJ9BO31v54t/L1E6bbR/lQXUEPXMoQzpmcjSl3WF3H/jK8cRSZETu6HACTWIaS3u83FXhG1dCQRRdzGEkrn8nnH96rwGOSOnuWFBss4njRPFoZVV4uFXODCbZppxEdXVZ4ow2nSLAnXTeumXrQspQ689RGVbVxFa55IyLQgmSbCAFFIUAojNCxIN6BkcY0MnQkaR4Qy2KDH/ovPwb3VGyA4mwHIBYh1T3lEOCnZKxxQZ8RClFVVftH3/MNFOygn2+PipoPSzCVQdQi0hdZsy83N1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtDw3cjtOhOqnCMLyZo3A4J1Fy1H8TI6gtCEVpndRtI=;
 b=PEYfE2vON0PFdo/+EZXK+RK5CYzAa7Gjr5JSdV1UnkvPnc8jDA8LtjQxkaEj01U6P3fNsuyRwx8bhVxMS0GTWQuqayNm1PSFqKRHBS9ysRCVGd6FF2sOvQ7ifz7htOwL4zjmsEEAmXQ+OFYzz4CyuVUE8xG4wI9BrIVujsLm8dU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by TYWPR01MB8282.jpnprd01.prod.outlook.com (2603:1096:400:165::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 00:15:22 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 00:15:21 +0000
Message-ID: <875x71zyw5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sheetal
	<sheetal@nvidia.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding
	<thierry.reding@gmail.com>, <linux-sound@vger.kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sheetal
	<sheetal@nvidia.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding
	<thierry.reding@gmail.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH 3/4] ASoC: soc-ops: use snd_soc_component_regmap_val_bytes()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87a4wdzyxf.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4wdzyxf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Mar 2026 00:15:21 +0000
X-ClientProxiedBy: TYCP286CA0304.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::12) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|TYWPR01MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: a2bd3349-ac92-46a4-c31c-08de7fcc7327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Z/yD83XJ2ChfZiXTlG805H94nfftd2r4XhAetlbfqDhPM+YPMeLA9d42exAWGuDCAxaczmw9E43OPZWJy7NM4T9Pn1Z1JjD0mB+Q85HOw6my1py5TviaaNbT7L7PorGUaKIXZwv5wf0vd5wy0KaL4RZRLc9Pu8N+0G379yvFKhHsIcitBR9m8HututlA5GldVTkMunO+5nqOn+eJywPoqLfywFO7WYousm6xFi5JhpE9t4mQeDtpGzoHkCsJdfygHo1kLX67fFhAxLzEdianuLhfhtQe00OZju+bdZUQ9tok6DB5b8WVLEFrmahWQKUavHFpZ81ecudC3XYt9wHhC1iYrzhIE/vZirr3MryA3oG8IrNXbIyYawRHr+VVmn7GkuxtvGoFFoTY6YDbtNmfZP1WmNY27q0JmVsC/W2C4TDuWfqBCIDVg239o1sdtj5IFEXzLvBhQ+gMXQzBnzzQ48p5nVvNghLxv70xZ183wqtz3jXYLKHKsrCX5dcl/nyP+KbdzJkcHAYo1TJe29Go71ogjw98MnJZTSCP4pbFlAZk2Vxnp4yZpbAqMotQ5gvcRVWeOBrm+ClvbtaECs4FSn8j2tL4z23uw208SImZqEws187RdUMBYtSLO3Clw9/1Br+QVDQM8mYFziz9D7KQMv0Rr5J4BU0SR9oZOxgXmdga6S6D/ygyVUo7wvEe/mMjmSGxRmlGFo8vNNPYsk0pAH4Oz8Y4T0+RxbHSTboHyyTzLT6WiMJzcFpBZswhL0nYrxETF7uWZ1CzuK24/JxMl8cGYo3zAGM02RUeWpIf8qXIKoho611NQRX7ZIdgarKu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b6Lv8x8tRQiQwW3sLbBoxJ2hRRq4vNLBGzLsmAyu9C7iaPkniEaT9sMwLPsY?=
 =?us-ascii?Q?FJruMhuJpPJIN4HCUmhxoaZkx60NzE4SgGwcABAg9LeaxrJeJKR6eKKdkSdg?=
 =?us-ascii?Q?DGKrCHfQ30gyPT8tlEvzsbun9xptyASCNLbuvoW8NDhy3BKICLObThm0O2RW?=
 =?us-ascii?Q?CmjSuJgUsc+JLdrhoCVBsrw2aDuhc+kfTm06tn6URRBspFppcp2HYSksk9Bo?=
 =?us-ascii?Q?zi+e4Koq1aFHgQIn/ysNSk/Sqf1yLuLl+ydxxYfi4yH4OGIaUfA6QMJGyZRC?=
 =?us-ascii?Q?UL1lBdTOyQ/hVNBi5mgpitO1AdMpCbKCOJgYSZmR8st5YueMup4/wp/dHyo2?=
 =?us-ascii?Q?qhDPLjG8d1XMk8160LFi8eLFUkewtO7b+AYJ1B7K1tU82I3D2py3QP6cucu1?=
 =?us-ascii?Q?SZ6NBoNLAgcB8dcL/d/iaUGQrO06Zfqp2U9IR520KTH2GAMgtlgDpZ95Y/IP?=
 =?us-ascii?Q?nd04m8R7xPm5W9W/r5FAkmyNGek37FeIvuNP7DkXEa6nzxAYV40nqsMROkf0?=
 =?us-ascii?Q?K3nv1sCLF/Zk8iZPjgQWMdthc7n1rTQt4rUkD4Yzeo6F5gak7fxyiga4FthS?=
 =?us-ascii?Q?J3mHxyXI6vrAumOywNFjOr3YsiY5udPBViYMp46hpLSteK5KBL8jHBnyQWNT?=
 =?us-ascii?Q?vqQCzCNzOYjbJGzMJ0ScVjrqpFIwk9ss2agoY1KTOpcpqTe0EZOK/Z0vkc7T?=
 =?us-ascii?Q?uiPDmOdQI9L7iFUJ45QJkADs/RrhIv9eyC84n4c2zyHxCZm45SmeibthyUq8?=
 =?us-ascii?Q?50hkKyoFF5adht3C7rhW/8gk2F8hClVe6O6pwuIC1eHKT/HEa4I858gDDu1s?=
 =?us-ascii?Q?Bh9QyCPxTt/e3k6gnRS37aIwqG8Jmhzmwa5SbQ6/vHb11jzKZbDIZC0jwuJm?=
 =?us-ascii?Q?O1MSxdGeRm8VXeeRZwmI7nT4wisuHqYMStRwWcXNu2o6IDsbHIoOQ/k1NSQh?=
 =?us-ascii?Q?XefQc30XBpl/kKJApqMoSeuuVIE3wosUG6H7zrul7C4WF/OrlPVxnfY/iXKw?=
 =?us-ascii?Q?+yQ0ndm5xDj1lEdRNMjXC9fnbpHj+EVQxbo9cRD0NS2A67e2TZ49BT0+cNqf?=
 =?us-ascii?Q?DmZeBpAMBonbtk47F7KEZyHKWFu47HU9zXLDp/iN0Inj25RinhSjPPDmg7CC?=
 =?us-ascii?Q?YDIZFogXqiWDHX6/uZZe6kR7QYUwn4DyWW5Xc4tjfhUPCrDywXO6G3uSdazC?=
 =?us-ascii?Q?40JNn7ZmNXf8bTCALaoo+ZAKe1bWTuKj9nmlI8Nm/QcIN2F4+ZKpZxP7jpQj?=
 =?us-ascii?Q?BwBu+D5vZQhh3APC3BB0swfgLZrG3KlB9qltOLZ6aoklZ/FNU+Gvv9Dz69IQ?=
 =?us-ascii?Q?vlTRpUD+B3BJMGVyhWAQrx3kQlog3f0/aRojrZGq0xy3WGWWdWDuIeIl4//m?=
 =?us-ascii?Q?WstXIxhDYBtE39quaXqY5fsAdrEUk2gBRzakt1JVxYhHS0ffp9G4NGE0vcvs?=
 =?us-ascii?Q?cSfpluRZnnlQjv1/oN/x9J3NMz0FEzpawC2QztbQNaE3a917kfBbuo80KxUd?=
 =?us-ascii?Q?UGoPWfPE92RqySeaDjGVFgos/HhrWZWS3NtaSiCoqvIRh/ekqSlgEqj5304E?=
 =?us-ascii?Q?Z/XyzVAHguDjqKjUYUuenIX2ptAouKj/W6xeCRnHCtz6RMGUxDVLLe5+zOHP?=
 =?us-ascii?Q?cnkKrC5Tmn6c+/6arqdDSOxN2DsSCITv33E4yAmPPIWrI4eMKREEg43rwzYB?=
 =?us-ascii?Q?+luR1xACs3v0BAaci3Uh4VpR3x4S/GQ6TkcbYcJthBHI+X7R+I/VkytRMwYU?=
 =?us-ascii?Q?QePh50N6uceBT3kzOldoy/2dSMVdyiZAR8pnpGxH2BlFptO8d4In?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2bd3349-ac92-46a4-c31c-08de7fcc7327
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 00:15:21.6262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FlObYnJGLhVsfumk+nk1fuIJeLGD0GRoaQ/cQi236ggdmKgFHOJuwRj0TDoy0+VOYnR4A8CDufu2gQBG2kJ9aYj2V5ICtqfWyhLNhvCSBA51XVtRSDYWFVTjYQpSMZi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8282

component has component->val_bytes which is set via
snd_soc_component_setup_regmap(). But it can be calculated via
component->regmap. No need to keep it as component->val_bytes.

Use snd_soc_component_regmap_val_bytes().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-ops.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 0d633f38cfdca..bbf277670718e 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -472,9 +472,10 @@ int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct soc_bytes *params = (void *)kcontrol->private_value;
+	int val_bytes = snd_soc_component_regmap_val_bytes(component);
 
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
-	uinfo->count = params->num_regs * component->val_bytes;
+	uinfo->count = params->num_regs * val_bytes;
 
 	return 0;
 }
@@ -485,18 +486,19 @@ int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct soc_bytes *params = (void *)kcontrol->private_value;
+	int val_bytes = snd_soc_component_regmap_val_bytes(component);
 	int ret;
 
 	if (component->regmap)
 		ret = regmap_raw_read(component->regmap, params->base,
 				      ucontrol->value.bytes.data,
-				      params->num_regs * component->val_bytes);
+				      params->num_regs * val_bytes);
 	else
 		ret = -EINVAL;
 
 	/* Hide any masked bytes to ensure consistent data reporting */
 	if (ret == 0 && params->mask) {
-		switch (component->val_bytes) {
+		switch (val_bytes) {
 		case 1:
 			ucontrol->value.bytes.data[0] &= ~params->mask;
 			break;
@@ -522,13 +524,14 @@ int snd_soc_bytes_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct soc_bytes *params = (void *)kcontrol->private_value;
+	int val_bytes = snd_soc_component_regmap_val_bytes(component);
 	unsigned int val, mask;
 	int ret, len;
 
 	if (!component->regmap || !params->num_regs)
 		return -EINVAL;
 
-	len = params->num_regs * component->val_bytes;
+	len = params->num_regs * val_bytes;
 
 	void *data __free(kfree) = kmemdup(ucontrol->value.bytes.data, len,
 					   GFP_KERNEL | GFP_DMA);
@@ -547,7 +550,7 @@ int snd_soc_bytes_put(struct snd_kcontrol *kcontrol,
 
 		val &= params->mask;
 
-		switch (component->val_bytes) {
+		switch (val_bytes) {
 		case 1:
 			((u8 *)data)[0] &= ~params->mask;
 			((u8 *)data)[0] |= val;
@@ -670,9 +673,10 @@ int snd_soc_get_xr_sx(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct soc_mreg_control *mc =
 		(struct soc_mreg_control *)kcontrol->private_value;
+	int val_bytes = snd_soc_component_regmap_val_bytes(component);
 	unsigned int regbase = mc->regbase;
 	unsigned int regcount = mc->regcount;
-	unsigned int regwshift = component->val_bytes * BITS_PER_BYTE;
+	unsigned int regwshift = val_bytes * BITS_PER_BYTE;
 	unsigned int regwmask = GENMASK(regwshift - 1, 0);
 	unsigned long mask = GENMASK(mc->nbits - 1, 0);
 	long val = 0;
@@ -714,9 +718,10 @@ int snd_soc_put_xr_sx(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct soc_mreg_control *mc =
 		(struct soc_mreg_control *)kcontrol->private_value;
+	int val_bytes = snd_soc_component_regmap_val_bytes(component);
 	unsigned int regbase = mc->regbase;
 	unsigned int regcount = mc->regcount;
-	unsigned int regwshift = component->val_bytes * BITS_PER_BYTE;
+	unsigned int regwshift = val_bytes * BITS_PER_BYTE;
 	unsigned int regwmask = GENMASK(regwshift - 1, 0);
 	unsigned long mask = GENMASK(mc->nbits - 1, 0);
 	long val = ucontrol->value.integer.value[0];
-- 
2.43.0

