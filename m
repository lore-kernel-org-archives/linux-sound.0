Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94653876C3
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804239; cv=fail; b=SINBoj0p9uYuig4wWYNLy9fp3te+JXjULS8u9OrwG//OC5+n1Mfe83JIA7k4lo5KdW6IJF+Vo3zQWOLuPqLou09gx/Ak2988jzHaBTLYAC8nTQHfelYiETr/BTXUcx1cEWa2KG7Vpzhzv+wq1Ro11UxwRLynkxfeh+mzOfu9/TE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804239; c=relaxed/simple;
	bh=xwUki7q0CJMRhbukk2QarkGoiooFlp7jO9Log8x7qZY=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BHz3JQMHnTW9EPXW4AlscSbrapYxUK2XqOg4A8HxcHC+4sKUqnMK/le41iBdlhJuyZ2q6AbZAExDdRgmWIQ9PR/idqKvMksSD6j2uILC1X+KVcIGiMtzi507kufRGxsGXzu0cLOvbTnkE91Zkp4wOPug44glwhbZaOK7gbKXCRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EiSwnjCo; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EiSwnjCo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJd6+dWledMEl7jBWY+SX47fe2ozkgMTKPL2eGjFaAnA4naRkiPftnjv1p1Vg7MYiDI7IJHctcS5QcXMElHkEqJ3H5KtJgMkE3Pd3DSBQaAlNzxaZzzz/3ariS4Ddi1miQ2nhJe/yl14WoHZ17Lsx0Tgo1m9zSKTmVVjU4bPqNZUy7bUABlBW7SMPETiZsw5eYnMvsFR90gusUR4+ZV/N/0gJ7IL4kEITY1Pf14raMlpgKDAefxs0vUo5lAdInc9InQzpAJf2zA5b9csXFlPooglUmU+YCSsXq/rCYdlQo5uvGOOdTCxHiA2MaRva30JeT13w1oFef4PFIJRdpZpLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SypYu/CYd9ozTpWLISOOV8ylhFrMbqx/eVAp0ol8418=;
 b=LyMxzJRlIDdOsq95moSzyEFksjplnZ0JDKUb+1rfR0XfM1RZKOTQg/9lluHsXxUKVdPsW+u3icgAubwsnpVncqm9/vlOj5ZTAVVP74JFroJj4ZS6rGq77tcy+wVRrs11rn/4AW6AQ4fiicOYG7RqjrAV2jqWGz0aa2OEu/361QigeUb0gq5NzU+Sn33E0zQGawKD34efIVw2FbbdYWgM2+U4avvh2taoJN1KgeL0N9lcMqc8l2w1zxjcp5UQfhSyt3IHrSkzobmrLAwWwpaBigIfgg3AtNuPkaZBzY/hxAYp8rmB/crTjtaq5rqLX1FWIXU4Qy0Hv8RVfv9OZGp5pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SypYu/CYd9ozTpWLISOOV8ylhFrMbqx/eVAp0ol8418=;
 b=EiSwnjCoips1y3xiOiCcpN5S9efjC+BWOv0P0WL3GAXU6netPEiR5bYL4v07IzeDaBj3d2Ssb4AXB8dITP5WvG3qEl3SVSsAggjXkdM7uElNRCyQ6b6ffAHfvD5OWO0B39EbqBy1Um7Lh3m8gAIAQG4eWfHHuEzcGUceFKOMhiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18293.jpnprd01.prod.outlook.com (2603:1096:405:3ef::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:43:55 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:43:55 +0000
Message-ID: <87qzkevho4.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 40/44] ASoC: codecs: tscs454: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:43:55 +0000
X-ClientProxiedBy: TY6P286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18293:EE_
X-MS-Office365-Filtering-Correlation-Id: 8808ed8f-8460-4853-1876-08def1c176b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|1800799024|366016|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qp1U1UZAHz6PjU2R89Gu4htT6E9sZ8LfGd57YwmqG46lAcw6mQrBbLK5qguOQSzp+hdYfqNh9K0ypS7scOr2J0tYuZQd/rxQp0CF7GzGNID5YUslH7MG1f0pPq6U5dTQOzBt6Wra8eUeW8JY7oDqr3fJpS8dbmVwM1t0ErYHocpHyYdtb/G5PlCvJd0RowX/17Y+15IoTZ+0FcBs+CH6u7SnG2yaRQTmYo3zc+vv6dM9JVvZHH4UnFALM1T/IwZE06Nmlrz5woZ+Xm/FgOKl4BxinSx3qt7jpcbSLWH61MSYa38WiUQsIZXXkGh3RBdHnwUwP5mh+JVhAAWRU3QXOjAiBqI5NW4DacVECgp84dE3N0XeP7ddwpYEGXqbEtCwjN0ztRXkU4Or9IMp7O9eB9tynlEDh6ofEuvbnoMyQuIXmp0RDHGBpGkB8oQpPW82wle0U2BlWuAkOg88GE5WF4eKicVWGuDWYb46AzXwc56bcmKIK18BVvIh4cNGOJEc2tQfiRz4Nm5FL4WMZWt13GdPGsOo0oT5aor151oOH5FM11mXpdwzEjs8515h41wpkzkOhrmEAHSKNQ+bPpGYMXnnJynX3nClQiA51owfITmXb571JLrjM4AzQRIjsTbBY6FGmyN58VXBj1Vk7ikGq4Ci8YJPmxlI4x14Dfl0VJ8Nty4NEnZqRuc8+Hu0cbERZunt0hWUb0aYFonH2M0UWQagbSSOI9hDD0Ed9emsD5w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4zSPVdtnjGdtRydxlz2R+IKYnGwLYAzJj2JlxhV5yD6SsIYB2uM3Py00ndgZ?=
 =?us-ascii?Q?JNVvkhgV7u/BHZaD0fhGNwyadwYZalG7/L4xeVOmzkd87m0g8YqSTYTD9PUE?=
 =?us-ascii?Q?osGlqpQJyMa7TD9fEgM9wRoENG+FlIPPa/mSXY+001BoPRQn5rqG8jmNk2JQ?=
 =?us-ascii?Q?j2SM2tw4wen4dtamCeY4TqaDxoDUIavKdTAF/W5jpyd6faXVriPoqgaFwI6l?=
 =?us-ascii?Q?Nb/2LA8PiYawcYdTJzbd1wB73UXMZldsxtwjU1OCFMGoKNJ1hb8Xlo331vmz?=
 =?us-ascii?Q?j2CJNrhm6ZqSXlFZzjTbQObJQeariZ3kA6oBVVFUSVulmNVZI34dUMC+PBZT?=
 =?us-ascii?Q?JWYANF94rec5u0faMjebyHNHbLRQ3VuWSVI/iCpi1g3Nk+zEdEGSYl7F7uNv?=
 =?us-ascii?Q?EtrYRVDTBBqUT+wiz7QYq5d3Ff7Z9nR4hrsToK6QnBOLziuN8Cx01cJ/gudC?=
 =?us-ascii?Q?eRI9feLgozCGGOwtEGIiq/z5oDfMXcJVIVl0bE3lIrskKgX8ll/XRz7410Y3?=
 =?us-ascii?Q?zwngaf/T4awuvgmpXgWJm51P/mB4ylyxR2GO+A2pAUXe4VGd0FCle25QKSII?=
 =?us-ascii?Q?SFv0Ju0Wt31qQbWRf6SEnV/fYvBd3sRD0qJPcXNkPqMzFKrRYgVD4YyJ5p2e?=
 =?us-ascii?Q?QpVbXnLaw4iDCuvJW+FTs9mkpnK+o5zdDtw50tn0ol17ose63Ky7GwWC5ABG?=
 =?us-ascii?Q?hkW4CElTORezcik/r2Z9oOchnR4TgyMidxXRjRU1CD+ynfz38cvEawMh0IDo?=
 =?us-ascii?Q?FiW7RDwuCAsuQjazdZxT1cnwlzpdGbnCKqS2Pwgztgb+kwy7B/aMjissSaiY?=
 =?us-ascii?Q?2GqNex1pmBIsyJwyYIVtf6qjdMEBBFxKeiNFJQnSXGOkJwlq6Tlb+QtYdroh?=
 =?us-ascii?Q?YYBBrbbY/jp2oLu4Gbgv1/iFrr+xZrQa+ekcL6S2RqBXKdrhS0B42h0peIBi?=
 =?us-ascii?Q?hDX6Oo8swNHLGfy9r9H7bewsyRe+DLR3eOQbHob2YpINgGy7KuRqREDnHQvj?=
 =?us-ascii?Q?7tp3gOG3NHAZ4wvwxCpGkNXEQ7ZLWHc5uJRmuS5hkhbHTIB5cu8KZPi3GavL?=
 =?us-ascii?Q?BDuw4a3WzYk5DeiWtqxfWTCP80PiOSMM9VXGJsomGJYvw/tNvsP2+RI0sH+k?=
 =?us-ascii?Q?ogGG5iJzBv98oy7h99iwYsZA6yoA+mPyLGKSgEXgoZPFDlfTKepIgWdDx37j?=
 =?us-ascii?Q?ACWrNMdnovVbFyq8K9LGyrrMQraS19f/1N6hv6KabRN+2ppUXMiqLURS139P?=
 =?us-ascii?Q?Y3mOocUoqZ8nuTX8gU9Id18ufj7g+dEvFf6g2qGwLEeLV/S4bnCEpvZG2h6H?=
 =?us-ascii?Q?bHEC5CnCBr16I39Bp7Pp/nU9YzyV32JkXrbOGDr8dxSufu4XOXugop3YxHhF?=
 =?us-ascii?Q?6gLXPPTZNyA6DQCMherj9lN+SO8EB3kN7YMYep+TOVME/wxL1sEI687z9sMh?=
 =?us-ascii?Q?6xNzXOhuS2p9XtnHOsy3CQMqDrFfS5g9SXv1sZ+VPp/okat2TlJf+uWk770e?=
 =?us-ascii?Q?+qQiXKlOwNvkqrK4+l00iElH4gUVzPbwSajfoR80ek+45UeYGyD7FRABVFYH?=
 =?us-ascii?Q?mGZLaMhwFY1Kyp5aEaviY+BV6W/udO9hpclAktbKzcUnSySuKrW/Cm3Y6HeM?=
 =?us-ascii?Q?cOqFzAak8Q6emQeLmQJOfEu3+3asPeFaPSKk7QCIR0/Z2jq+xaaG/BUBdTbI?=
 =?us-ascii?Q?Cm49S3ge9rn+uBbcLZBS2u5LnfYcdVgwE+9/+0c6mwUHOxnDofWScaC4V/AF?=
 =?us-ascii?Q?tLqkEtMRkRHTzSxwWPfwc5s670JTy8fzWTCN1yc+czsD63my2ggt?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8808ed8f-8460-4853-1876-08def1c176b0
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:43:55.6708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cpUhL5GPtKRFH6eKsMFE2db2nsNLobhzOlrInEwOUoVI3lxEcvEqdk/Y0ga7w1bOxkvZTYYmRo/rRKEWIxNLkfvRdIzupNC3zHH54luxqiPNdFN1YllaiVtirWh3bW8L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18293

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tscs454.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/codecs/tscs454.c b/sound/soc/codecs/tscs454.c
index b70c9d931e1eb..e772dd39a849c 100644
--- a/sound/soc/codecs/tscs454.c
+++ b/sound/soc/codecs/tscs454.c
@@ -3233,6 +3233,17 @@ static int tscs454_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 tscs454_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static struct snd_soc_dai_ops const tscs454_dai1_ops = {
 	.set_sysclk	= tscs454_set_sysclk,
 	.set_bclk_ratio = tscs454_set_bclk_ratio,
@@ -3241,6 +3252,8 @@ static struct snd_soc_dai_ops const tscs454_dai1_ops = {
 	.hw_params	= tscs454_hw_params,
 	.hw_free	= tscs454_hw_free,
 	.prepare	= tscs454_prepare,
+	.auto_selectable_formats	= &tscs454_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_ops const tscs454_dai23_ops = {
@@ -3251,6 +3264,8 @@ static struct snd_soc_dai_ops const tscs454_dai23_ops = {
 	.hw_params	= tscs454_hw_params,
 	.hw_free	= tscs454_hw_free,
 	.prepare	= tscs454_prepare,
+	.auto_selectable_formats	= &tscs454_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static int tscs454_probe(struct snd_soc_component *component)
-- 
2.53.0

