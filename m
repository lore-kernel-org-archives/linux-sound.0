Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF2A12C544
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820295; cv=fail; b=SNa4XLthQUDO3OReufKbl9GDp0dDFGMMi5idRk1FRezd1FErYmCHmo3cmAACIjgZijF3uEr43QTmAr/e0cUeqyHranfynZJE29wehCaDCfXbHU8ypIu6opPLmfF9kETXzD/CmTEFpGW/CyrpeZsD/pn7UriOlPD9Hsn/FQPflyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820295; c=relaxed/simple;
	bh=hLofGx5WOY/sbO40exxpiEwkLTO3OVg1ZTyOu4dwDwg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JqIXz93XXfNynE6eTu4jVZWU056LcH/xmtYrm3xy6+87w6r2ALTbb+ArcmFEhOxAsW+BgXHXisy2pv4JMXkIDYvpaDQKRJ7UbeyOE7uakBMYPrFs4CjPdPCrs60b3krxQa61zuuIXnH1MrKUFD9BIyQ5aQEuJNpg2IZNBrJWTOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IB3VqVmT; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IB3VqVmT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TChmP7BsdeRxzssFYeSLhI72KaGF9E9hiocnNonNw8LZBJa332hFnxGv1sRNpTA8e4kvqSePQVKCuLjqOXVdjm+Or122YdoJKg15AM7FSzP3QfZEtUBcFvqqF0rNI9RjxfLACAY8pw5BnDzDsQ2n6vu+NX9GYQEBIulMDIMSVlHHXawWJi0hi0AzF8+XMP6JOKw4SOfFbMmx7/fdC/MZ6LWi1QnliP5R3oCwkOcLucdOqgl/KVHYpfhOHeK97n7azqGdW/apW9kNBPLl5nxROxzKgMdebeLVARvK6xtUNLK7rEijmdMSCSYR/HjE2fT+wZVjxp8nHeHK9OGMQiSgQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1nkr/VgF+f3tEhNIErfman/kjH4Gofz3MKgHaW7tr8=;
 b=clu3uPf74ebXbrFom4zZBP0GlEiowQCI7XzR7VpdNYf4S5xU9B4bU4imOfmaAyRB4nrlBW6axvJqQn3SplIzyN4C8bBG7pdqSrweiuc4+GwPUbUC3e280I6fyQxNm7nyrRiVOKSJPdW/HRKHBPW1R+ftrFuE908PkFcr6HG4LDSF0XJCpckWV5WSVFSKnDa31WFosgDg6yugJsIEufBlDHCUUk5QX5G6oYtFi1OFPwVjcNdYIA24X7mA8C/N98WJtBz6vGW7l6DX6OUpfZTyEH6L9otBGPLDAgDq9c7nX+vEsXz5hHghui3hMLGGV6QUiQFUDBD6eMzc9F5zOW/RiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1nkr/VgF+f3tEhNIErfman/kjH4Gofz3MKgHaW7tr8=;
 b=IB3VqVmT13jitzuGu4Ov0qYfgHg2aeE7tu06DtUsGeuvgIpXQQ6SZY9aqF66qjCp7MSmIQ6jX+fzTuUzMWMhyj+s1NjRubBp4t77PcmA/dwSo2toHo9FbME8uGKn7HGYfna0q2px9R5xGHKajZAj3ZGVZNjJmgx6HPprslvD3h8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14299.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:18:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:18:10 +0000
Message-ID: <87v7jh8lrx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 012/292] ASoC: atmel: tse850-pcm5142: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:18:10 +0000
X-ClientProxiedBy: TYCPR01CA0173.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14299:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c06679-39db-4464-c712-08de20b7cbeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ukQ2kbHwNhJdtl8WUMwAGVDZ2+O9I/8o/T9cPM7mhdbbWaA+MS3143PDsgw2?=
 =?us-ascii?Q?q94zMiTFbTkMlMw2k+gXXFN1d/Y9p277Zov8XsQk6t09UTM5eVl95afkU+Ct?=
 =?us-ascii?Q?XWAk4KFEL2NXsD7blrutZp5vlwD/PNVYfwyIXs56ZcBpwjVb0ztIgGrOwsk+?=
 =?us-ascii?Q?0QLEFfJDO8Gvdd1MBFpOamhkEM8m6y91fODIqo/HmGVZ4jgqdvXZwPeW24pX?=
 =?us-ascii?Q?lDz1mXDp3ruyGLSUTHbH6aKIPQAgSbIE9gNiwHoAXBwyTx4DiD+MbcxDSAEJ?=
 =?us-ascii?Q?P6ZWfYt3DyT2k/d0F6LWtlnPY8lTQTKKGXSqYns1IjN/wC/MhMSVNlbE+SLK?=
 =?us-ascii?Q?s3cdU7IrqcLlri/Sh4bzUdcyskXueE53oe3vehjpcDKd+GifOWykGyrXWGfV?=
 =?us-ascii?Q?S3X4Yd5judKo7dPOPETGHpDYA1OwdNslrudZnoCO78uKw7V6W68HJZ+KSFzO?=
 =?us-ascii?Q?mrSRhZc6HMjueLTx+Q8JfEcUib7cXmTlnxQMmJHceboD26RgtT8RqftiehBQ?=
 =?us-ascii?Q?/wpy4FljAb5+5JW2Qa4L6iidmMZa3P6PpdxRlGFvM0XrxXf+KV/yeit8TZbD?=
 =?us-ascii?Q?wAq0ulCMzEdzQze1a9KBth1K2verbS/t/JTBd1CJkSXwkMOa2N61PII0v6re?=
 =?us-ascii?Q?Hy4vtqABM67rZ5erSWSiom2r2EzmVEiiEsErRHnOklS66vGfZmbJPSNAy/Bf?=
 =?us-ascii?Q?lTdPQiLjsW1wrBTcnOFBMOEQiI6dSMD3CQJew37SlRjLKDE9wJpMQ2CdC6Pz?=
 =?us-ascii?Q?rrH8JP4LXW7gCz1qYXdg/TfxwmIpYAxRyZPNFYryTbBaBkwQSPWXi/LpSo6v?=
 =?us-ascii?Q?8pxSZEgqaoBKyLaTpeXZnCE7FNLQ4qTzm0Sl11OEi4slmCa4Enkso/JNe8o3?=
 =?us-ascii?Q?9xOuk+B4KKYZqWa7GY5YixWtVvuFom8zyJIdzY2659PCECC2gpy/bITh/3jf?=
 =?us-ascii?Q?fCrtBmZgToTa9NZXdgevC4s1CFGCP0ygCVBsMpeGh3W7tNWw7ylve5K+qqGt?=
 =?us-ascii?Q?3nOlk3JjxUvIzXr9FpeVshSrra0cCvq3zq9P+tt4fQ/N29AHBmwCDRJK7z2u?=
 =?us-ascii?Q?NypzJSjnFvbnjA13pOT0lh0GKTVp7tizVLZAjHBk38jqiKlsqIeIski8EKdE?=
 =?us-ascii?Q?bQPAY0RwEmZsioaEdl990YxJAB4jBXUkk5ed+B+Z+E8sfOjQx8LF5ivHOjmo?=
 =?us-ascii?Q?E15pl5OliGASpiJpxFQ2ruQamHWmGcdQxP3Q8uXoUA1U1n8IVWU3zW80hUz5?=
 =?us-ascii?Q?eyqO+66Ik+YZn44hTu/MarPy70u7QnGMY+WHzAzLG8h1Omn1zn0JzNJwxdLb?=
 =?us-ascii?Q?VsQQf/gvQM/xLrj83m4dpCU1fXexBwO7hAyosWfIIgufKSnkoRTd+Cy9HFqG?=
 =?us-ascii?Q?A5DJ9EcDN55GQiDPJiBruw9kwPAU0SDtzBgxTcHUZpQP81y0dm3TJV9qD/wx?=
 =?us-ascii?Q?JROfqWWV0jM45xgoMobW8MpoJnGigurtwh6g8YIp63X1SbvzslfLInkKeVX9?=
 =?us-ascii?Q?nLTcNwYr5yvEiC3v8ONWsua+JuppcDmeaNjd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JuAp0uCPuf5LdHoyZqdQ4j6K/8aS35ALDaR3B11doPWSd/c3L+jGt2SyKeF/?=
 =?us-ascii?Q?5yMbHt38kKLkYJI+VYa+s5HGoXoBVZ9B+4ApC3Ii2oOKh2kYxgpBmnnWqyMm?=
 =?us-ascii?Q?PVxDXQhnNRpvR6rfXVqJCRzTh6CxwEF85eI16AEBktR/2w8vsxVTBj6i647g?=
 =?us-ascii?Q?Pd2Y8S1w65IjsxWmr6fEr/Q9TaRESuO9LNfKAcuoC/mXIbSVgeaDYIK26RDm?=
 =?us-ascii?Q?kyjbHdXa3h3I5C7KuYDOTi0LIjk66BMuRWDugouZLx3smCfYlEzLJVeN/Dct?=
 =?us-ascii?Q?etBfrOKoigYX7Cw9aovkBWsmhvLZosQmBzQU7NAut5TLmR+PyBys4/vHy0lb?=
 =?us-ascii?Q?A7QyY8P/AlODg9IuV5+0lri6uqL0CijeFjN56KNPp+Y7Vv7mvjGaN4sGAQOR?=
 =?us-ascii?Q?bVFgKjU138GtnIdB+CgSKfljhcafiUxG8KVBcG5kIX0aVQ/yKijbDXlx25ET?=
 =?us-ascii?Q?Nvo1w7/gn7F5WEHdsICAiV5TMk5+a0VlvS9lRiEDsfJ6V+7LLbYfrSTP+UKx?=
 =?us-ascii?Q?dc+GlHiR9b1PQo7GWKMuTySfQ9YOUcytoLhDUaNitELooHRJ3C9y/1hLEZGd?=
 =?us-ascii?Q?fCDEjZAYdIZ52vi9i+d1iPsWoaOwVtKxy+NPdRB+8Qi+EbYKwYqRvgK/a8J9?=
 =?us-ascii?Q?r7seI2HINzh7l6IgLVkxW8cUMLSfMPFNr8D/Wg78rw7/UKUs1YVMQTWrtbtP?=
 =?us-ascii?Q?xik/0qCEGNijb/hjYxRgJ7BGANEbmPjNTej+2KtlvSl/bb68rq8p7E8O5Xr4?=
 =?us-ascii?Q?+8a9fd5rXvdd30i8moTGD0Wygd8dMGQnQebL8UBWcnapWvz59rcVyDVMPP61?=
 =?us-ascii?Q?U/9PUvlOjLj6qCux8vrJ5QZ9r2OfNnftTVZD+F0K13NjAYUIPuepHwGbOQj9?=
 =?us-ascii?Q?/G499j7XEOfRVwtDXo24fMRzCZv9JTNztSIY4mNVsXm4JPLdulkloQLDPNE+?=
 =?us-ascii?Q?vjW1z+cl5XYmhzSTx98gobws97By97nmjkVnYm9MT2K9IhZcLog0SlaPJ3QE?=
 =?us-ascii?Q?mS/faPwvoQzg0zplOIGRjocq5cSyLDEahNJrhVkSWn+S9POA0kopdNzzG80u?=
 =?us-ascii?Q?eVYC3Y+/R2IxYpj8ejAoRySlDzvTsQbIsFcDc5IPWZJGgPDF7CWb4SDzMKDb?=
 =?us-ascii?Q?gjcSU9J78Dir96XgbPOctx40xD86eu0G1fh6nsU5ynY+znYEcA3WW+IdxQ/Z?=
 =?us-ascii?Q?958aOeZJLGQiyZ1qN9YN/tUgqvAf/heOjsxgfkhMXKDiDS+OZtcFWdM9V6Ti?=
 =?us-ascii?Q?WOdWmj0z7NtR1LNUrFFxUNlPDY4hBQG1oC9XBBkVMlI7pHjidwbls2nU/cq3?=
 =?us-ascii?Q?bT4seDhYlNJWxvHuFflfbasuKdpLtIvGmk69cHUGwxDSNk4VX7g/WEf+CjcM?=
 =?us-ascii?Q?7rO7DanAwHVG2D1An1ymOwpLBbLlDiyiEjOMui99ydsBSO3M2Uv1UUPhsnDg?=
 =?us-ascii?Q?ahsTVY4wZukr7SEeRTajYjqYk0mejPFOQwEDVJnPI0PiN1YWHF6DMEFyAN0j?=
 =?us-ascii?Q?6+1lgJOjxtwLNi9KG5mJSP6aP77S6ZzCwK4DcThGTYbn+SGS1UBeJGLqTzNa?=
 =?us-ascii?Q?yYC8PW6MMk+LP+qGUrimmx74khJIGhfNrhdz4sW7khOZnmU64yCmCf0Cr9OI?=
 =?us-ascii?Q?JXnxu7OwOo/P4F7ysMGzZ6s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c06679-39db-4464-c712-08de20b7cbeb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:18:10.6412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++5a89CxSOHY0HOVVeFUCuP4kJGQP3Cr75fPM2SUVO8N0hTSZUUWpL0GDpn3ezW0BtVPO0f7U/SX7ni6Yg+zCXclRzJ440Gug39HY7r24awy2XbiT2FGGm1kYqTxfso3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14299

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
 sound/soc/atmel/tse850-pcm5142.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/atmel/tse850-pcm5142.c b/sound/soc/atmel/tse850-pcm5142.c
index 2a1d0408a4cf1..0b4927d07f25c 100644
--- a/sound/soc/atmel/tse850-pcm5142.c
+++ b/sound/soc/atmel/tse850-pcm5142.c
@@ -58,8 +58,8 @@ struct tse850_priv {
 static int tse850_get_mux1(struct snd_kcontrol *kctrl,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctrl);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 
 	ucontrol->value.enumerated.item[0] = tse850->loop1_cache;
@@ -70,8 +70,8 @@ static int tse850_get_mux1(struct snd_kcontrol *kctrl,
 static int tse850_put_mux1(struct snd_kcontrol *kctrl,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctrl);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 	struct soc_enum *e = (struct soc_enum *)kctrl->private_value;
 	unsigned int val = ucontrol->value.enumerated.item[0];
@@ -88,8 +88,8 @@ static int tse850_put_mux1(struct snd_kcontrol *kctrl,
 static int tse850_get_mux2(struct snd_kcontrol *kctrl,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctrl);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 
 	ucontrol->value.enumerated.item[0] = tse850->loop2_cache;
@@ -100,8 +100,8 @@ static int tse850_get_mux2(struct snd_kcontrol *kctrl,
 static int tse850_put_mux2(struct snd_kcontrol *kctrl,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctrl);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 	struct soc_enum *e = (struct soc_enum *)kctrl->private_value;
 	unsigned int val = ucontrol->value.enumerated.item[0];
@@ -118,8 +118,8 @@ static int tse850_put_mux2(struct snd_kcontrol *kctrl,
 static int tse850_get_mix(struct snd_kcontrol *kctrl,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctrl);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 
 	ucontrol->value.enumerated.item[0] = tse850->add_cache;
@@ -130,8 +130,8 @@ static int tse850_get_mix(struct snd_kcontrol *kctrl,
 static int tse850_put_mix(struct snd_kcontrol *kctrl,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctrl);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 	int connect = !!ucontrol->value.integer.value[0];
 
@@ -152,8 +152,8 @@ static int tse850_put_mix(struct snd_kcontrol *kctrl,
 static int tse850_get_ana(struct snd_kcontrol *kctrl,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctrl);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 	int ret;
 
@@ -185,8 +185,8 @@ static int tse850_get_ana(struct snd_kcontrol *kctrl,
 static int tse850_put_ana(struct snd_kcontrol *kctrl,
 			  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kctrl);
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kctrl);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
 	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
 	struct soc_enum *e = (struct soc_enum *)kctrl->private_value;
 	unsigned int uV = ucontrol->value.enumerated.item[0];
-- 
2.43.0

