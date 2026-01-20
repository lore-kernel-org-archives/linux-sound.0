Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011037.outbound.protection.outlook.com [52.101.125.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E213A249E5
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 00:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768868098; cv=fail; b=S5wstqf6Ogi42VMCOjW7rEtoN7+iIrDvIV0e7EkbkKkA9mAgmD3jssl8QzvZD3F8c8VWzxlOXM2SO2WcRjODMsV7kQXgfxYgAft4efyLn6mClMLztmiuzWA0j10APcTwpt4nHzk1RmQCUx2ikwsLKa+lwEpvLVxfWXKRvnV4nTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768868098; c=relaxed/simple;
	bh=b/6pWQGWEYJJQAND6VraduC8yLeWES3N7S0gZ0bEl18=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=k7nzL7r9KP4BQ80106+2FHiG/YtDVkI0TbvhQwepxmZak31w0SMAIQBgu4H350Uvc1U/sSZghfC7KJP9uuTrmEWoxvS0LrVIT+esDkEqFVEZQWgYUYqHDEMkPkEtKej48u9ZmltI7JRjh0r96+/ShYxSw2AwTVyxpgfVux+wsFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YO5qiAsx; arc=fail smtp.client-ip=52.101.125.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YO5qiAsx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQK54Ql9i3YD2H/7p+Q9o0KXgAld8SG9uV5j8rY9jNcFpyCxtZXnBTsjfip/GJ+KHYPbkwHSwx5FsSURXyihNaxcUBSqC0AnAF7VQuDwh1hgaj8EmqEp6UOyhbvvOo4mT/fYUfQXOHN5kI6Ng8DVoigsGODC6LETcA+ueNdZsPJVaAB7+n1d5al1TRK2vl03eiv+T5mg2kqkZpJUmaASrQ0kXteer4m6fY9UKHYpxQmlyjys8vQ/3RSNzFvGSXMM8iUUk5ZKIwL56kGaFrF/V9NHd3cQI2+aWHOrRvTVXRLGcET/PEpDciMFV2yQ+oVBHs5UxJ5R38ftsOJmbQN/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RutDCc5uDKwCi3TH9kSnTFvAGNqlTM3PJo4SWRm85dw=;
 b=KRjus5r8vJc7kOd4BgTuBkKGTyvi4KzowowYNl0rrXlJ7XbmSLwtIIPS3TOWE0hljG4HSyaEHAp6bl2nNP+PwA4T3c83rPY5koJAYJQPkWUQIr1XsYWYxHCQCasvZJamnD/4vsRX+6bDQTMQqoUcfluwmPy+lmED1mrVSQ+kJipcCuZl1iOMAaXndG1ZQO1nDl8XFp8frjvhQNX6CN5z9R2LYQ9e8beGMx+HosI+2ihOAYNK3zSZ0R1scSbhA88gke5c4cs+PDfe7AJAyNZ2MU0+/XyJ8M8mY/AuqElGooD8a3Q1OV3LrJdoSSEU9c+maPCJ1uc+3VNUaJGR7euaRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RutDCc5uDKwCi3TH9kSnTFvAGNqlTM3PJo4SWRm85dw=;
 b=YO5qiAsxwJnAun74oET6B1bK1rtGiI2jOUURtDJWmlzomn+KXdkMuGHwOt/XVM9xf5j2mnJlm3hHYUEf4qW10AAnLDgFJZyeR8olbFppmsS9QwCfCAK0/ecsN7hIzt/PaxfhXFdAG/X/SNkQEs34DwpyjmI0nnFsCn1b91E+r/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TY3PR01MB11799.jpnprd01.prod.outlook.com (2603:1096:400:3dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 00:14:54 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 00:14:54 +0000
Message-ID: <87h5shqgw1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 6/8] ASoC: soc-dapm: add snd_soc_dapm_alloc()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
References: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jan 2026 00:14:54 +0000
X-ClientProxiedBy: TYCP301CA0066.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::7) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TY3PR01MB11799:EE_
X-MS-Office365-Filtering-Correlation-Id: b819de3b-ea71-4f60-f01d-08de57b8f00f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4Y8yAqCZR8EvDQ8/HpEQFIJifTGp3uUBF1c99fIOdJzBGcZ/zjMmQgf8xUK9?=
 =?us-ascii?Q?faCDd5Gj5nVBciH391NsC3T/wNsVTC/tjBiGvzWNgLDk34YLCOQqQ9lFw3li?=
 =?us-ascii?Q?Tl3vAKpkSsndDQ8VLswAS27Oij/3hV5ryVt/oIQdZUdnF+hlVoRxWK1Nwg0E?=
 =?us-ascii?Q?GlujiOMJm1J48eJ3mxWZ/+FoV1AJUsx2q3fAf8mzkNzEu10fyresxOZMGspT?=
 =?us-ascii?Q?M74A5gFqFjCISHecDUSjZlvgCfwmpOt+rlziXTXXzd16NXpAFk/kts37fKAZ?=
 =?us-ascii?Q?EXXwhhiHzO/krmkj7+GhDr0x4nyykljT9uCgJYq0RxcVixsDyBUPd6uFbg3l?=
 =?us-ascii?Q?HgoYz0MhAwaW2xROSPpAS3nQWRTBUrstYdDmJ7hcMfFZ8eLCEpZTn4A3Jx7p?=
 =?us-ascii?Q?s9AlxwBU8jVxGEvGROuvBkAA+w672vl/Z0RzRoZgFfwrP0qqAT16gQuDdWSa?=
 =?us-ascii?Q?pQWsV2BJCM8Alxm1jrTBNeHSo9FyGODhR2r46Ut2N2yFYtMTJr6K9eTcqZqI?=
 =?us-ascii?Q?pr8peh654luTYrJ4XQloQwp4v4VGcpXqG2asEZQZwRzQjMUYfaQVawO6+cmb?=
 =?us-ascii?Q?+MoT292DASnTIWd2H/3GfDMdVEytGZLjANSD3Fs5YTA6urv+RRsjhEzs8u7o?=
 =?us-ascii?Q?qGNZ9+77pq7w3lV3ofLWL1SItUp59KOf8yttJ892yz8YtgACxkCnjIXF+WRK?=
 =?us-ascii?Q?DwC4LF/8rVdQI6wqMo7uK//jTTfVSGcx9tsfk+dxTmJM8/XaAOo/rX3qnvlj?=
 =?us-ascii?Q?mM1AzGYjb66whnfQXAT8keQKoA3D4hBYMOx0to2+Zkfjcve4SIye1nrWbRne?=
 =?us-ascii?Q?m7DDIt1WuvOvE3EzDQk0Q//AR8HFjMTNHC1sEToE8MgG04IZJS71dXi7jvS5?=
 =?us-ascii?Q?5yr8Oy3Q005uPNybNz68d3+mxNjhxLUYUn9lRaBmqQCtHeAZPkqOMqcAsrjf?=
 =?us-ascii?Q?8Xz9lTTZnqBr07D+VsJOosFRYduX3Fggm12aY/axp2b9TCaZzHGJ9mLuivTu?=
 =?us-ascii?Q?+HFCa14CsI07ijlqc4wozkmef2QVwhE8vXy8X3VoNPfT5xXYfCq+QTnAlYoS?=
 =?us-ascii?Q?VU1kWk5HYS4DCzuyJ8MrZbLr1hVOAE0rTHUM2f/+/oeU9BraZnARPyP+0tFS?=
 =?us-ascii?Q?gL5AVtshS8+bLL9DPOw9guQSSjBjfFj0bISVnJZ7TkHMYyAuTPy+9UxbS3eV?=
 =?us-ascii?Q?3ySRGRBQ1SLzYoevC+i0a/F3fl465y1enT2Of/bD0+mWO+CATxYN2iJlZS5a?=
 =?us-ascii?Q?Xp3FZ8HGE3SH7ihVaEyX+TRgGbaS/fNiwSxn2R61jteAMrkF+QP/DyCSAvDP?=
 =?us-ascii?Q?T2t6RkomnWRcAxf0lHX5C0LSio8duA2bWH6p9DBziUirIVfQakQv1xVupYFP?=
 =?us-ascii?Q?ikxQfKqsMBvqYz+6yZ2y534EOSMIHZzCDr+2SDBkV1OptDCYk/4/v+Ds+YxT?=
 =?us-ascii?Q?jnPfV9aIyFSeZuXyAR8GaBBiLrzIrGbDuAGDsei7DEAFK3uonWhhwvN7kJtJ?=
 =?us-ascii?Q?o/fuWa6IUhUYSMW3DHtWtnnjJJzITJ4sjC/qBdGCeRWeILXSh7sIvviakaId?=
 =?us-ascii?Q?1QIJS6dVqCfv1QXEX462D8eOvDf3K+0HuiULydg5UKcCPoVfZ2OJOs7WtVKU?=
 =?us-ascii?Q?BH2wVygcRKfJ+zWbpXeN7II=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z2KBuKdDBkSeMXtn++1qIXq2i+wvK37ay8NjBX/7OPMVUPbCLDIkimImJM98?=
 =?us-ascii?Q?kFHQDf3kzBzhrPSUMnY9PHjdH9pSs29uuq9/u+YRRRFU5WBDo02//TN2gDX6?=
 =?us-ascii?Q?49J2G4mtVTaoC8DJHYQqnAWSE8sncaNg5ulR1Zv7FryvzX077vEw2wfecGpd?=
 =?us-ascii?Q?vZ98fA6cscrSBD2luG9l/uu0YgdMKUASSJEqgmwMNXXm8GDBARxqEnOHcno+?=
 =?us-ascii?Q?fnZDmP1HXQknnm01iXZfgWib+dAgPDQRzvF9K+nwAfAY73uIwQy8gAz3Hf+I?=
 =?us-ascii?Q?HpSRK43BgXkcmw51A25sLcQSZi4NHb3kXltyiX29q1832gWBStUYIFGJalJX?=
 =?us-ascii?Q?qBxsBxApWXMiQg+pRzhLuZIumGsRH+JHFoYoaT/o0BsdQ/3djBw5VyQ1A/uS?=
 =?us-ascii?Q?HL6gfyU0Iorehf5T2UnJF3ikSK6/KtXvNhZgaq3mcP+DiP6Uj6HxBB6OrDlV?=
 =?us-ascii?Q?s7taeWodUcLcpu10je8ZjXKWac+dqaoDpfXVwOxADVDkrF8y2MkbVJIrLMhI?=
 =?us-ascii?Q?C0g3aApeJQIEv4NC3QL7Z9LhxDb5NcM/gQcWXXc9vEMhYJ9tC4LOrDptNU2R?=
 =?us-ascii?Q?PQBAzEfr445HvoWmlf/rK8v/7tLxfl8VUf03LuyLm6BMs4jCMbMf74k3VD2V?=
 =?us-ascii?Q?cPxJrhxsWdaIVzQ4EtuvLW4C/0fw2v6Zg5Mm8XthiWrRV3XHiy49/yeLjVOa?=
 =?us-ascii?Q?2ae0uDoHHQXBsnLsgL9GlRMZojrEHNdZIYPzMM4YVS7xbn62xorjzVvv+8Ly?=
 =?us-ascii?Q?K3Y7SM2vDdxeHsW7av9uSvG14Y3kTNj6FOft1bJE/jPUm4FDZWuQxW361bPR?=
 =?us-ascii?Q?ckytYYlHVg61nDBTfnUP4GMxGyzI/n190TYggHMw6VYVsEQKnV3WuWEwx2ek?=
 =?us-ascii?Q?tx9KKv305alwcp7ya8u+WMMjdamhPBMtlt5zmUzkvD/VL6s8L4mfwe6JLwFh?=
 =?us-ascii?Q?dnlwEU34fyEmgRU//n6QT1Oz6nnP2te9Nbf1uSGB4af+QwaSezauXUVgZv1V?=
 =?us-ascii?Q?jYPLNq03r34mtgNfCY5FKwPE2N69FFap/WGluZF4vFfwd6ON1s/CNbpvWBQr?=
 =?us-ascii?Q?sPETZ5xj43Ln80r2SP2Ikas+4pX9LKAd0XkV5QtRC9BojpCXL76uCjJ5FWPT?=
 =?us-ascii?Q?1xWCnx66TSl/ONw9RBybJEy32WghXTh2CJiTLxaS80HpRj36NhsEn/2p96/t?=
 =?us-ascii?Q?v1F4K5S9LdVw+JAIHB2hmHv4lN53Qj7g+e+eH1uC4O6+sVd+qYXGycy4o1QM?=
 =?us-ascii?Q?wgtMOqduX5B224TeZFxPdZrx18fd4+ve13W2S1uQM3GKKdRcVS9cxjFKTYGi?=
 =?us-ascii?Q?CyTXh38TEWwpKO/0x/MIYgL+PMwilwWg2Ebkbw6yZDdu+utY/Qbps8Tmo9Ui?=
 =?us-ascii?Q?16v/E4C6jDTRCPoo3Wgd+ijsK1M1Oqm6F/Fp6slRRmC6nECTEfAIql9qlQfL?=
 =?us-ascii?Q?XDxSdZUhSE62xTgz1DYCH2Yd/Q/5zHT1qfamVuJPfH5YMKHn30OlJqfzPlZd?=
 =?us-ascii?Q?ibIRhq4Ml7s96fQPqSJjePN2Z/YxQIcSMaIQR4LJrT/sJKylAJb9PEliB/wP?=
 =?us-ascii?Q?tRj9b4SZwwRPairsKk0+l/589VRq8KWCtL1D3fgitqTTGhT9/c5dfR1Fx9CY?=
 =?us-ascii?Q?Dme5DHa/JWOm+4gIgCmyb9re/coQceblqNIco2zxqGa/Dyl+3BKLo2ijBBEL?=
 =?us-ascii?Q?ZEL0M6foo/8ms6uvhk3MeajF5rLiprtTpP6DSn74aTRUFCZ4xorKIsmvHrUe?=
 =?us-ascii?Q?lYXdAt+jF7FszGb6tiR1qyfDBelh6fschYUHcT+xI/jSevSBf5T3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b819de3b-ea71-4f60-f01d-08de57b8f00f
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 00:14:54.7581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXYuOnG+u6mZahoBn5OXOkbA3IuY3oNewKVs+UAV6SMo3Z7Wo0Z2PaX3IwCWKJ+siS7pCGNGKZZQuZR8gM53OumRy5y7QJSn04z1FPGewc2rUOZ2hmJz3AZgY6sR2aUc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11799

Because struct snd_soc_dapm_context is soc-dapm framework specific, user
driver don't need to access its member directly, we would like to hide
them. struct snd_soc_dapm_context will be removed from header in the
future.

Current card/component are using dapm_context instance. But it will be
moved to soc-dapm.c, and we can use will be only pointer. Makes it to
pointer.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 5 ++---
 include/sound/soc-dapm.h      | 2 ++
 include/sound/soc.h           | 4 ++--
 sound/soc/soc-core.c          | 8 ++++++++
 sound/soc/soc-dapm.c          | 7 ++++++-
 5 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index e538784746db7..2a2b74b24a609 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -237,8 +237,7 @@ struct snd_soc_component {
 	 * the driver will be marked as BROKEN when these fields are removed.
 	 */
 
-	/* Don't use these, use snd_soc_component_get_dapm() */
-	struct snd_soc_dapm_context dapm;
+	struct snd_soc_dapm_context *dapm;
 
 	/* machine specific init */
 	int (*init)(struct snd_soc_component *component);
@@ -268,7 +267,7 @@ struct snd_soc_component {
 static inline struct snd_soc_dapm_context *snd_soc_component_to_dapm(
 	struct snd_soc_component *component)
 {
-	return &component->dapm;
+	return component->dapm;
 }
 
 /**
diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 010d63db5436b..6f3e1b57cda32 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -627,6 +627,8 @@ enum snd_soc_dapm_direction {
 #define SND_SOC_DAPM_EP_SOURCE	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_IN)
 #define SND_SOC_DAPM_EP_SINK	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_OUT)
 
+struct snd_soc_dapm_context *snd_soc_dapm_alloc(struct device *dev);
+
 int snd_soc_dapm_regulator_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
 int snd_soc_dapm_clock_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
 int snd_soc_dapm_pinctrl_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index aa0fe6b802934..7d8376c8e1bed 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1076,7 +1076,7 @@ struct snd_soc_card {
 	struct list_head dobj_list;
 
 	/* Generic DAPM context for the card */
-	struct snd_soc_dapm_context dapm;
+	struct snd_soc_dapm_context *dapm;
 	struct snd_soc_dapm_stats dapm_stats;
 
 #ifdef CONFIG_DEBUG_FS
@@ -1136,7 +1136,7 @@ static inline int snd_soc_card_is_instantiated(struct snd_soc_card *card)
 
 static inline struct snd_soc_dapm_context *snd_soc_card_to_dapm(struct snd_soc_card *card)
 {
-	return &card->dapm;
+	return card->dapm;
 }
 
 /* SoC machine DAI configuration, glues a codec and cpu DAI together */
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e4b21bf39e59f..355ccc95f28ba 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2556,6 +2556,10 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	if (!card->name || !card->dev)
 		return -EINVAL;
 
+	card->dapm = snd_soc_dapm_alloc(card->dev);
+	if (!card->dapm)
+		return -ENOMEM;
+
 	dev_set_drvdata(card->dev, card);
 
 	INIT_LIST_HEAD(&card->widgets);
@@ -2840,6 +2844,10 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 				 const struct snd_soc_component_driver *driver,
 				 struct device *dev)
 {
+	component->dapm = snd_soc_dapm_alloc(dev);
+	if (!component->dapm)
+		return -ENOMEM;
+
 	INIT_LIST_HEAD(&component->dai_list);
 	INIT_LIST_HEAD(&component->dobj_list);
 	INIT_LIST_HEAD(&component->card_list);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 4c2007c61ca14..7aef57dcb2a72 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -165,6 +165,11 @@ static void pop_dbg(struct device *dev, u32 pop_time, const char *fmt, ...)
 	kfree(buf);
 }
 
+struct snd_soc_dapm_context *snd_soc_dapm_alloc(struct device *dev)
+{
+	return devm_kzalloc(dev, sizeof(struct snd_soc_dapm_context), GFP_KERNEL);
+}
+
 struct device *snd_soc_dapm_to_dev(struct snd_soc_dapm_context *dapm)
 {
 	if (dapm->component)
@@ -1076,7 +1081,7 @@ static int snd_soc_dapm_set_bias_level(struct snd_soc_dapm_context *dapm,
 	if (ret != 0)
 		goto out;
 
-	if (dapm != &card->dapm)
+	if (dapm != card->dapm)
 		ret = snd_soc_dapm_force_bias_level(dapm, level);
 
 	if (ret != 0)
-- 
2.43.0

