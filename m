Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D525730AAA6
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415881; cv=fail; b=kT5AMX1lsdNykdjlzc1FQQ28KRxDtY6GGVlK//ukLmqtd51kW0Mq1hCZHp6NxjvKQbYUQ97852c+SOZNBOERyYB0fPMvWZvCEdC+T1PYeo66B39Rvhf/uc9gTKTmYU3kFotGjs6pO9oj2wKqbodY7rTaJvu5XcXaCkcpCBLNzbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415881; c=relaxed/simple;
	bh=kUJADuWbbMGKH15c/QX+4wG5Yhz7EWOoKrQhiXNyFTI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZOP76tW2eeFg/CnbSSoliQcKpeNyEPGUeyzGTAQ3j4GrycPTkX9OkrsDvO2CCPB/6TtDHI7dJLfXylGxPcdiukcG+3mc+B/wsetgVRm4dW1cVaHb6nQYxRVuXCDoGjc6Bl4aNN5EFdxOo2b7tpbxbVw7skHur7OPByv9eHcoUyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WKICJ6jN; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WKICJ6jN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hH6hEiILC8WrBBP3w8MD28zRhFzT7RV9VbKb6KI7NA3YlcFZ1Rtqw9vloHF4QnRueedGUYbBtVQhBPDL8jcvSebe5xHMCbaQ4NTlPyBZQGIAVop8LQqQTySD3mjBRusU9v4WtVw3kX/XpkW+ZgbCGd4SaBoM6O9Slpebnym1mZpI0XrR6s47pRZNVDuE+OICNmcyDoz6F3YJ/wMMyGPMZfvxOOrMmem8LpMnKhNIcuggmwuBmiQoamHKWkj5nlcBuSgV9HU59UgsxcXRpobttFEPHV7JInpP4plxTewPALBk84dPbCp4GmBBSKCB0sNWKaBS+xecf/jRpU5lc9BtZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/xcX8TRX1qMieAnJyDJAiKZ2ghjvvGzXhNE/bQW9fQ=;
 b=E9aM7Bv/j3nq/Cv5XdRSFBPtx4d/4AKcw2HNZzy+ABpCq8dnhNQCqRslPY7FzgQmN0K11SJviLKBz8kWs3BPtaWNCtilx+IdzSUaj98MkJdiR5Fh7Har/EX0kuHIDPfxzF5zkWJCVbABYk4wj5f1tfuuwNenvKFjZ8TcQ83JL/l2Op7ekN5J7OAnzz4/fhYa/+50Fe4X72t9tbXA8FCjhMZdq3GrmDH6FQWU7UgbneuTROee4ve6aPAzRKESgPoDz6YD9xIXhf3aGSsZ56q6YHQ1/p67be96wX/PhkzOTCgoT/82oAkvuWjIVYxEa0q+fNWSMEiDwfG3XvZGUXXGNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/xcX8TRX1qMieAnJyDJAiKZ2ghjvvGzXhNE/bQW9fQ=;
 b=WKICJ6jNvHcPX9xBE2EaRwwsn5kgIUGR74e7VQ9K/bfKB58dHryPPgkflHq2m+OvEWqVOYpRuynIY3hf7Qsd9XLcEQ/dazPKT/+alw8BR3FVnZVKEkugDlnCt4DSZkNBrqIGNlsvp7Wqs/iEGWO8Xt/GORk/HJ287VXSCJDveZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:24:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:24:37 +0000
Message-ID: <87ldlep0u3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 082/139] ASoC: codecs: tas571x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:24:37 +0000
X-ClientProxiedBy: TYCPR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:405:2::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: c9af141c-bf09-48fc-d06c-08de0ad995e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LOA7mXA0tBDHojfPCeIE9QxJTTP7VJnvvo8p+KZkqOincHcPn2Lw1XFZ7Gxl?=
 =?us-ascii?Q?u5H8OtdSPBJdhPYT3lyhLGXIAzZG2LLWt4MbPr+SL6z3CjBSrwgZW0f3McNi?=
 =?us-ascii?Q?hhJ8fk74cP6U9pulCgV8A3NEUtoyeIh0cT1F4t00UM+HZqyoB0hxPYoVSmfj?=
 =?us-ascii?Q?9IjsUsBKjfiSdEOHlB34Vsi0NaAaZBJWAnpmnC1FyKOL33Yjrw82mA9QgtQf?=
 =?us-ascii?Q?dApGIippJBvCO2qowFFxj7sN9L/B6TKIcT07Fc81c6qz5tn7TorivbFquNwj?=
 =?us-ascii?Q?ksEMnB2ac19tBBPO5uzcwDVw0fFh0YEPgBUfEOaZCatbQDdXFTKBRN8Ptw8A?=
 =?us-ascii?Q?pvg/w9JTTPKaRn6GyqvLJVLbaIxA4vQ3Go52SICFCKLDXgt4SrjPEhJvdETi?=
 =?us-ascii?Q?UhjWV9fb0S9GnZx128zmIzydbAyffydXY0KDwaeUwicQS+uzwbR0TPl9HOt8?=
 =?us-ascii?Q?38dM+uxzV+lex9vj/ok2T5QRDBz1OvaK06ewVd7jblfOwbUzwTCRid4hqTIE?=
 =?us-ascii?Q?oajGKuSn28edPDeg1O/yVM/XrPJtuzjbJ2P8cKjPxxeBfClNIXSJtUrx3vIk?=
 =?us-ascii?Q?UrKmKsWUdBNpU7oviFh2D3cVx/Rs3i8I1K7AcICQuKcwMbee+t/DMkzHhxf0?=
 =?us-ascii?Q?amiIh/joQEewWUIIRAdfd8wEEF4NvGE6nRQ5kBJCzZqwBoSyU8IgufEfvXjR?=
 =?us-ascii?Q?7VpdDhoR5V2BMNXLJvLuhkgMfjP+zsirv7Woz7BVjbMIApetmQB6ZNuMF1K7?=
 =?us-ascii?Q?WNhYF92jnv1LC8eDt25mqWTMOEffLAb8QqB1cZ7HpyDt1K8/+nJMYk3oZV0+?=
 =?us-ascii?Q?jGsXMcMQDgMN3bRDzN+vkzQ+wAZ1shynLV1b41c5p2pFm931wtQZe9Cb29iQ?=
 =?us-ascii?Q?O7alA2W3qtPK58ElgOhzEin+xwSMo3QgeCV5TwPeJGpWs+A2czYuR+iHk7dV?=
 =?us-ascii?Q?Ey6oNwODYZksGhocvBPcaxQVzR4sBmSI06//G10k/GGDhWCc7K9bIT5+2DBr?=
 =?us-ascii?Q?q0QdWYIYhfAuXIJKdlR9kmPVfhK5Kw34EKru8r6murMj9N/1MIIqx32RfEvw?=
 =?us-ascii?Q?msK0GhNg+ck0xK968OgNeVt16UpBr8sMq6iPsNmZLn/dq3D+fQhCcrSGUJpB?=
 =?us-ascii?Q?fZRytvAnsrCMgxFVxvV4KmmSBpR+YDF3x5KG3QccLMl8mUBVGIb6I2IaeOmP?=
 =?us-ascii?Q?a6c/MIsYVKNPZuDdxcPPPYnmQEomPdPJ/7jzW5uZggYskXRF5ANlmoLirVdd?=
 =?us-ascii?Q?hjtqRmeOpvVfsdthxF+WDU9bn/TkpBVjyIU9pFGLvRJHDYivZI0hJORej/of?=
 =?us-ascii?Q?RL3OF/3uCMwp7b+zlI2KJuLTQ5DhLy5ocZfi0rDnSkSKPTryhuguTmotOYDs?=
 =?us-ascii?Q?38hpGADojpvwU7excTPzb/+c1M2Azh1KtLKI43PwwyOHMxOKOKgNEi5Uj9Wb?=
 =?us-ascii?Q?OT1gdZIcZF7Bi0n3qE9E1Y89NJGi9zO1mbDQ97gs3/Qh8Ve4klV7p6EStaxb?=
 =?us-ascii?Q?uMlT857xoOAtnTwLSXQakAVYqehEteM+tQOo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v8Q1NQYmUTpQHW/inZxrEOAMq7xm0vzfUX0vUBOGyQJom7Oo/X42in+ARvld?=
 =?us-ascii?Q?oCggkNQVoORfR2MAIPnWA64a7ZfLxadvcZSC8E9BohVOqfTppdzJduUwZVZ0?=
 =?us-ascii?Q?1PXa6+U+4BDvY2NPzAWtHKsbUbLw6dq3O+iDK45ylir2n+h+fXgTc0joV2U5?=
 =?us-ascii?Q?FYD9DwoTkuMH6KX/RGVmifeFFusAoOFKPahD3g8J3YjeQJWEjo8k4+m8ocIi?=
 =?us-ascii?Q?RyaFBXQCEW+sDMXSuXYd+XtsoB9uIJuNHvnlPtLiNJ64d+vyP+kAGayiOYH+?=
 =?us-ascii?Q?IpfV6KVxewcLefdCc+sAu274QUuoLj0EyVI8VE1TozgJd16sVJ72RF1B1oIQ?=
 =?us-ascii?Q?FalOqeVQYFhny+3Vg1i7Bc0wAE3A9lSu2pmClzhmhJ25/uiUzWbQRC2EqLlv?=
 =?us-ascii?Q?7tzAvJ1NaiMQjODWrNFb9lo05P9yDf1VRhgh/boxEWZpKSX4geSH9DAfrhb6?=
 =?us-ascii?Q?yefkF3rc2KLSNfdDIQhuvS8ZsCS46iUhgWd3NT/kg7C4IzJcKk1+6EzqoCcX?=
 =?us-ascii?Q?O2sKePxNoGGqZ++9hH+Q5Tg40x6tp1ImWfGlDPw76D74YwomHt7M/VpZbuCy?=
 =?us-ascii?Q?wlAIWxRI1rBfDDk50f5S8O18OfIOvL4EG0ZeZE64vLWmVfFRhLGjB/A9l4Q1?=
 =?us-ascii?Q?ues63ZUg+Dz2YQXzSpZFFfN2hG9ir5/QOZKHjmr+pcATjtIKBf9F8PJUvGpU?=
 =?us-ascii?Q?7nn2Mfx1+v7PxGLaEG8EKRBJThZnxU1/gBBAn0ufm12VujFHQUtEfwWJDuNv?=
 =?us-ascii?Q?I/7agRpwwP+91ag5AnCQaXpuo5idZa9nj1F5sTFxgWQjNjBLKh6+gz7d4/kR?=
 =?us-ascii?Q?+Ap22NtWFBfJb7CE0PPGo99cfyfJLYikxe9o8FuN97TSsBb5n2apMQtp9Ygh?=
 =?us-ascii?Q?2i571sTV/FW5RMIf5x5/1s6JgTDQFZtqrSKjI/lnJCsHcrqK29tgVqv61QrY?=
 =?us-ascii?Q?MyjjQT4Zlpnl39PATg9LM3SH4Ky++A32MUFzA+qpwL1PIMAMdOrkMxx0QNYf?=
 =?us-ascii?Q?+FkKJlucZBqJwpuKozcladRq5N0+Gyx5J+3OMWjopDnVPqrCp25c4MN73xTV?=
 =?us-ascii?Q?3fPS6gIazOfhix4OyvqtPrubJ/fVIAhpyuHwCdHrdHiukzTRld5ffgrL4eaW?=
 =?us-ascii?Q?/0jqR5sTKKNNe/PofMZ8dXA7CZHjEUI8OP8QVy3U6eFn02+VN5y7YInJ3P6E?=
 =?us-ascii?Q?WoHsdIZq9EWM9w5ex+GGWF/u6Ycq2gd83GY4o44gYyw7CJqXiYUExr+hg4PT?=
 =?us-ascii?Q?9s2V/w042R966X/1/Vgky45DdNa39hT/+VQZk4WhRg+aOzi9mNGD9+6Vham9?=
 =?us-ascii?Q?fYrKp0TUCLSZXn+2NT3NSaln1lPZLSZthZCfhlHh0UUt2H+MEtoZT4Pt7eyw?=
 =?us-ascii?Q?34VInxMP4Yewb1I9bLwkxoY/9NMEpWKj705CaVBP9JSJLUpnYbmxSysijy4o?=
 =?us-ascii?Q?7eKKYUFAmVcJZ4RmW2w5CJVAfCs45og9JIFc/VYTgGJH5BHLQl5612tawqTl?=
 =?us-ascii?Q?i/CIxBO4xz6YtoLKIAUuSOMTFXhkRzsARndJhw0WBPZbZTgmphfBNiMQEcqy?=
 =?us-ascii?Q?6TcaMjU7aZQJkRwbqvgZY27ezfW+tObFaweZ1QfVUESqritvNFfkHlVpS0/C?=
 =?us-ascii?Q?hJ6FQeH3Q6osufma9bUYO2s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9af141c-bf09-48fc-d06c-08de0ad995e0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:24:37.3459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFD88WoVhl5LoYgNbTu8U5VPo/7663V6Ad/DONneuTTXDT4308CR0DNelpXx5SVy63yj+ODkTKoCU9uGK3JAx/uPQcuX+UPk+0Ue7jog/JfoGUQsvOGN+k3ysHlszhs5
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
 sound/soc/codecs/tas571x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index 41d73f470f8b1..ca68651e5f756 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -241,7 +241,7 @@ static int tas571x_coefficient_info(struct snd_kcontrol *kcontrol,
 static int tas571x_coefficient_get(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct i2c_client *i2c = to_i2c_client(component->dev);
 	int numcoef = kcontrol->private_value >> 16;
 	int index = kcontrol->private_value & 0xffff;
@@ -253,7 +253,7 @@ static int tas571x_coefficient_get(struct snd_kcontrol *kcontrol,
 static int tas571x_coefficient_put(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct i2c_client *i2c = to_i2c_client(component->dev);
 	int numcoef = kcontrol->private_value >> 16;
 	int index = kcontrol->private_value & 0xffff;
-- 
2.43.0

