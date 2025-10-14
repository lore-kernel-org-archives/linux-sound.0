Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E36B30AAB6
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415883; cv=fail; b=FaotmyiDRGPM1y0DmiyboQppwgsIMYcSfWqZbzc9NC2D4DzSmxGlBNIjq19piinrzwHsebNUDwT+YdmvxMKBUnPi//XM/LjTJc2sRhk1ja4tINopmqCBtBu+ID5h/G9VBkbD2G5pgX2TReOemfz0vfz9RtOpAcDME5nIueNEe1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415883; c=relaxed/simple;
	bh=KdtaD6HQUsJPr/nJOlbjW8t5++BuMJKjyPruxKqiamc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MPhbQqHS+Zr245gsj55ZrZ/UGRF0baVyukR2liY57LlV1V0HAvg6z0jZyHTaZY8Lj2mVxvCkAmbQ5S/z2/oy7SfrukSJ+N6edQp0pvxwaCxpYlppydfCjhCp0Ag0vFQOSgS30B+IqIl49LYE64UgSwFNvDQCLqtSk3ajv+WqQRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dTIJF+gk; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dTIJF+gk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zD0x/w6sE3wABFfv//xRpVef7eYAcAnmMuAb2mPffPJbRrfLR1qyK/y8G4fSgBzDxp5rpjOYe/HJl9S0v9RK0VhhOBd3v0t9NHqKGeX86KUBsP9nojzPOSTOb1SFmCYDye0zFS95vAmznPfhc8f8ruRPUdml75nxVrwfYxQYTT1ooRxfDcHUHR4BSHgKg4NFXMDM2jsf47+AxZJ0gLzV2mpK6/Qu6wfpYA8LX0LJr4+6W10vwfYLtjRGrMtidF8cIMpNo/1Ssbeyl0jxQe8P8B7f+GyMynz+XPTdS8KCzGTQWiBCVoc3kXLKaD1cq4QEVCxYsPWruHGh36NutUKmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rssXLs8QSWR3AaVg1/f1oVIQIwTziEWyEp0aEEesXDw=;
 b=vCxB47SvVxVbvFouGowtX9xx/etANUCflxnXYjcmcEZa1CjyCJOyxXqbTYerhViQNUwMSFx8Kh+1GJhnKSf9jyi6GxmYhnNqwVGNqPo5jXOYrk0KOBmZ8CbwSdFxU+cMiAjSZjzm5+C9P2FEWfMeBJZQjapnSm7oF6FPuy6obGaTMALnjBKmAcVxgAcfhgbKtfSyxAOVISPA7jDo3Y96uFur8a2qJAanu1+GxBn0Utw0G2RKSK0llBV5RpMzuBIs2b4pF+Dzh4VkrJzV9wseAbuH7yypkpa4WOsRSDqQmft07FCIuFhQpsyVm+25cxZLCV6UcOOyW6ZzBGvscrhgCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rssXLs8QSWR3AaVg1/f1oVIQIwTziEWyEp0aEEesXDw=;
 b=dTIJF+gkegm4zsDzmjnq7zxpLSrhevsHcWHdrxd110ELv7yJkBqDxnr8NGcbH3M6oWzWUbPDoJgkRz5qla96MPQvW78oW3RrHMLeS36mSWARuUhtqqXYtjgz4GfK0yv8VVuiQg6OW+7MwLBxtRoneVVGFIzmVcOQgsqJmMm0xnQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:24:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:24:40 +0000
Message-ID: <87jz0yp0tz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 083/139] ASoC: codecs: tas5720: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:24:40 +0000
X-ClientProxiedBy: TYCP286CA0250.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 088fbacb-86b0-4ccd-1077-08de0ad997cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v0Lo+/qH9Jm4NVcPNUDGR4zW65iZGlsCFqz9Mw9AD01JYE/SVCbOGZTMqJfi?=
 =?us-ascii?Q?odJsE/UKp9/FOofdqizDgV3VLtVbAGXmJtBv4/9Y2vNyfi7t7iWBTmCuhA16?=
 =?us-ascii?Q?EX4RFSfsN9ENugyKhrvHImLvW9I1KSIHSR/4fSIhZ5P/Js9TS0s3x6L/62We?=
 =?us-ascii?Q?jcuoZpEbqqBf3SmHDYH/TfcHMp3NyK1d4MADWvVPaX2o+3yihU17+RJga0IF?=
 =?us-ascii?Q?eweEKfsXQsegFaHAyKypZaQdFtAnsGvC12CSQeJiNhJnAyzvhb1WbpzZTwyo?=
 =?us-ascii?Q?3ACn+lJKcdWgXjx6/Jk37IQ4t7/dtkCtVPpPx1E1dwqLprdyskSVKH6AQ6/k?=
 =?us-ascii?Q?rBDwh24WRhWKLFa37G3Sbk/Oj7hcSa5VuxxxLPzl6Vnc12LvIb3Jhamh8w0J?=
 =?us-ascii?Q?ZdYNlqex1Jm6dHVyshZs0vAr7GChaZJXwdoJ9uqAWPbzRJKJUOUY0YoIrnnz?=
 =?us-ascii?Q?3LzNYQbQ8xCnSIPqgr85vEa1oQxxU8g3wT07rjNhnpyfIm12kF5yMqrUfULN?=
 =?us-ascii?Q?gbX1NVCz1PT7cnneE3WhYwxCqRbWX1YBFnZYgQ/5MIdoaNLzHxmxfHHkMDP/?=
 =?us-ascii?Q?DktACGc9Te0/JmvjkjKuxgGmyJuXRvGZJ2m65AoCuoRnjLx4AtlCjlZBS3Pw?=
 =?us-ascii?Q?voUaVtINPmlLk2207B3M1rte7ifFH/TTwrxLYU5CV6LgYp9v9MAgwqQJnQOd?=
 =?us-ascii?Q?HMsoBsfJ81ANLy0HUpIvsSPl7GbZUzOuCwbdmc4A8BcWcYR6iE1NWFfVTeg0?=
 =?us-ascii?Q?11OxdNhl7jROf9AmD6283+Y0ik3jX5aV+QXP7bWn1v2efovR6OquPWqC3PPd?=
 =?us-ascii?Q?Zfh2wTBQn35TmWGyfDL0xKTjV7fArlkOf6gxQuyZqdyk/6tI9D7W7euLbfoQ?=
 =?us-ascii?Q?YqidEAE22+a63b8J2/p1kJ2vv7kE+rqbhyo63tm/wko7sQ6HhJZNgEHbG3Sy?=
 =?us-ascii?Q?RGr6Pk/Xvg0/X6b7ZGjFH++RbOGHwHZvBo9P33Ca7vxuz6c7WPpKRi2fuQLH?=
 =?us-ascii?Q?T1NSz73jyJq2kpuynr5FBVkKNmcXClG2cY5gQORLoG2vqGoWqJSlkOzD+OZW?=
 =?us-ascii?Q?9EnWiGVyh1Y0exqLbqYJwtCJCs63tmvParGibQhwxEnX6t7y+RHo3jpzz2wf?=
 =?us-ascii?Q?8bZOOz0cnXx2QzM9mJnxwRJJZ+I1aVll5CTTLht50GZWzCVPIWpwFBtv4w7v?=
 =?us-ascii?Q?32FB1FoETtWnfEz3BpB9nVx/VGSbypya1ZrZaABSV/3E+PjyJ+Wpi17yR3r5?=
 =?us-ascii?Q?pIg7036j6WmplhH1cCYopSkXI9CsqJ5GCsSjHinXFvEMJnB/4iojlhxuGdoD?=
 =?us-ascii?Q?bX+JyjBFnNTeYgLhKrhDz/9fDcRU1Fva2ckiX0dpn8gPg3JLn0tutkCfIf16?=
 =?us-ascii?Q?w5MZhWkaCn0iesn+bdouiXJncdZ4+ocZwHi4n0xqCZupR1YITyfnHrskToey?=
 =?us-ascii?Q?OgKoRuWymNZQuXiBlC067Cm6kfS+Awg5L3w3bH9hneFO6y0NuaY8xclLK+6a?=
 =?us-ascii?Q?YODPpAtUqZabk3IpAQ8gXF0rF+w84zHYFxIL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mxV19MoqoobvRKUwe4e9znQIWuJRNNEs1kgN5MKyHkNgdPqRsRExztt5qdz2?=
 =?us-ascii?Q?kxNUk6G72Op5zF5u22umXHzCwtRfSqTNsZmllAtCWeAs/4m3t3gSKJKWJLeh?=
 =?us-ascii?Q?YqU25l1gr7Y9GuCXfjlrBtIZfOwyeDZPsS7umVkcewpiXKY9x89odJKU1AXr?=
 =?us-ascii?Q?tqBpCKQ5PPHCLiBlb+M2RYGQhZmygo7z5KBWKOKE+pSU4sDmC6oUcWhQqC5w?=
 =?us-ascii?Q?/3XbgRwXFgQFvNJPTH4foYYdwzBslQG55Txz45dDJHeOlk3L1BQnmcfONIwu?=
 =?us-ascii?Q?JjqC29Umi2aO1OQDWvDSKBCYwtXku3Jw3y4q+Rn6ksh4D+P4hB+OdU5gVH+R?=
 =?us-ascii?Q?PttOlo5bC8SlztQ8t1x7OGu4048Z4RNrn4QwY5tDSbLlUXsnq8rMbsYU3yZu?=
 =?us-ascii?Q?8Y5DHydPY8PsdL4Wdpr36Ji+L4bKgRARshDE47l5TDiOFKQhDHk3M7VvKclU?=
 =?us-ascii?Q?cP7wrB22pOKByxpWPPCMOOsFb0wJ880pYp0X2GFZzTF+ywUou1/IV4oYOXqr?=
 =?us-ascii?Q?Bgt1WXIyJ5vakiGPdmYLVZRusK1HCJvVCzXgQq1Zwptof3yqX/RMMbVhCABw?=
 =?us-ascii?Q?8d2EC0RI/2/QVYMZkDQrbTUdhCOOMIPKBMahdgKdILI/S1kOkIHfPS+f0py4?=
 =?us-ascii?Q?H54EIAfylE6FbgDhsW6NfIlQdU2S59JmCAOEszx0HjQMAquE9glk2qLqFQjI?=
 =?us-ascii?Q?sn7TMMVhVHguGkcWYm90twMJgflvBA1mCJPIX0YK6KwFxnhDQlFDq4/56GFD?=
 =?us-ascii?Q?sEndc51Mm6iSRk+hpwDA92SaEd3tUfkWgac8UJ1t3yvu9h7Q2c+4CA5UbXGQ?=
 =?us-ascii?Q?8RZljqiXYV9avuvkskRA92+lWYJ4savOpBI1NceUAaZO482pySyBWdPB19NC?=
 =?us-ascii?Q?qzLXzMHJ7kQA98KOnvKb2+pkkhpY+QznKcDwQ3UAvqHDQs4baTY2h5dKM/Cu?=
 =?us-ascii?Q?ho4zgntHhDvgHiyJsRsDOU3m+PKjYXViqVDdrbTAa1j+sJPuZHBLbKT9LHee?=
 =?us-ascii?Q?yRThb6g3QaGR1MGVRkAND6hqLGHOpopgX5/TmcC2SRRC55jN+Q8bdOJcprIt?=
 =?us-ascii?Q?rLeC69NrhIqhiWK3fLJf+CYNvMezs9xQhYA+asniFMIA42WCn4qjCuhAxnpB?=
 =?us-ascii?Q?ngleFpD1ovUbh25hVpdJy61x12UzFR6Lx8Y2OwxqQL8MRhgci0wRRt2/FSJv?=
 =?us-ascii?Q?zkb+SddI5SP1IMMsCj85EENF1K3OEOsXbsUUjiAQY/piC4KpbVgDf+1AA2fc?=
 =?us-ascii?Q?KqaqT2v5KPeR2mgcT8s7R4iRXKcsdR67o9o3hk3Xw76QzXJJD/bUzIIr45dC?=
 =?us-ascii?Q?NLyPS0QxZSBxnctOly+yPSDSXciT+GMWlFwXXv3s5kU0I50tkucS6Oa1cE03?=
 =?us-ascii?Q?mx3AJMn8XXOwlCaPsprLAehIrGB+DeiU/8TX1MoSnElcKVdyW56uaRmwcUl7?=
 =?us-ascii?Q?ySqwipREQNUHc8vAlBG41uLj5d+XY/FolYNhnGrtg/bSt+QizLc8lZhJDRHt?=
 =?us-ascii?Q?s0llnwTjIkO0nKmOKqgbf1dJaFMj+YS7ionzm2wycexkX/hPt73UXZHNSbbx?=
 =?us-ascii?Q?cLXP/KeByFdOfzHBYgvuT+gn0Jm4aCIqzYVDwnycnXYWBVX8laZgWkb4qaLn?=
 =?us-ascii?Q?dlZ5E00TTq/vHe+cA+3fGyE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 088fbacb-86b0-4ccd-1077-08de0ad997cd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:24:40.5441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5ElSqe5Jzbd96aNAyGubFAhPzywIP5cVCbdx/IOLI2uUzQFLMWiyJ5FbbsstV5y4xcqv8sXeC9Io5e4EO6TcFFCB9982Fy5lAhmw1zh3UeWmDIhYH1Hl9SvLeNS4sbL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tas5720.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
index f0361822061fd..2dcdd0a4bf80f 100644
--- a/sound/soc/codecs/tas5720.c
+++ b/sound/soc/codecs/tas5720.c
@@ -564,7 +564,7 @@ static DECLARE_TLV_DB_SCALE(tas5722_dac_tlv, -10350, 25, 0);
 static int tas5722_volume_get(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int val;
 
 	val = snd_soc_component_read(component, TAS5720_VOLUME_CTRL_REG);
@@ -579,7 +579,7 @@ static int tas5722_volume_get(struct snd_kcontrol *kcontrol,
 static int tas5722_volume_set(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int sel = ucontrol->value.integer.value[0];
 
 	snd_soc_component_write(component, TAS5720_VOLUME_CTRL_REG, sel >> 1);
-- 
2.43.0

