Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539DE1C1F2F
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 02:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750903972; cv=fail; b=iLXCYK+yIWD/qL2faVfzmg6JCP3xgC0zPGuQMNPHJ90o+lXtwTLgUV1x1iql8dFHQZzRu6v9AEdJayrCsnkn00ndsVxYB+tYNlVqs60cU/8Xknm3+yW/o79nrzDlYaWXNeS3fMr4GBerTIqlYt4n2xDrhhl7KJTf5visfUuLt3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750903972; c=relaxed/simple;
	bh=N5lTNAUm78CrjO+F3cJMa4oShLAACU0Cku7ADnSQhyo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NI6E/ZL8Re+1T6UtTgexsGuxUtv5ZUhoiHK2dMwSisyD5updIZ3aXUQ30N9aX5a91sAfK1q04HtyarALyTpMqmFs4sI8ye0DiQ7zI5E8XjmV6SroH63JjObVQt6+tXOH8s3dEMGUHSn4MAYT4NTJUYqqzR4/Gq6ERPOw4YTBq9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cyjl9sBR; arc=fail smtp.client-ip=52.101.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cyjl9sBR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GykQEOX3UMr0d0PS6WVh97VsaiPrW3mo1y96eY/OW5P6MfkaUhccdo9cG8Fg8V/rq1OqdoytRL94UdaYWA0mho07hC1Ve9SxHwFhSGduCenFh5MWtgBFk78iPJjFhGuAWaUJExJgbjFe+TK5Ffq/qMKYU58oCIWybQt4hEL5+dpiuaO0kx+mEQQK5yV462mql9NNFu6dmPb846sH90EIzxBlywk2+hy4KWNScE/QxRjYbqYHt8ORGGzH4a1OUOG7vNV5SjLExukeDpSuzNL/IIJuXkapXVZNB3CIS21sfeQGlodTzuN97LxzA+YVvtV5Evlb5xlcASqx9fhvuGfhjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ThR4Y4GakmFQfYo2hHXZyM4STUwSXAYPlYMr8KBGc4=;
 b=Cb74xXWfrUCSrpx1xg6B+LrpiQtuokA4syMgySCLUBwdbrHsI+vLMCKVkbovfWOs12cdZUZ31Z1EVmHCPz146YvzIDrLeLgbrAnRFtJul4icMy1LriTbu+E4HYu11gbc+LZWHEEspAfbodBwHWa5/nC29DbPxIaYxJ3iwikKom5aOgn+xVz++We8mq8bS5qIppABCOTe7WPQbvCC33U8ovjzewKJf/MGhvYmpbAGj0l9pMWNdmUNY7eVX0HpTPcqXYHjQ9VIeZXQlbVdPTCiSCWhxrb8v0tAj+x6CQbLyKl7UFVY2IsKwXgyke/2V8jpC0v3URVf06JhqqSzSv548Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ThR4Y4GakmFQfYo2hHXZyM4STUwSXAYPlYMr8KBGc4=;
 b=cyjl9sBRUCvCGcU9nTUYY92Za4NimuJfa2XS1emsBx3J4n8bDj0IhSQFsq0XTT7Dl08U+Ks9NrrFd2uIAchWDsLGmVGUUjBWB9mvpp1feNq1D+dlRJe0kc55fEux2pmwGcqdrGdf6A0u03jFbOtGNjr4uKAcw7QWKm3zJ9zVWms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TY4PR01MB13972.jpnprd01.prod.outlook.com
 (2603:1096:405:20a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 02:12:47 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 02:12:47 +0000
Message-ID: <87ms9v1c9s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/11] ASoC: soc-dapm: use common name for dapm
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Jun 2025 02:12:47 +0000
X-ClientProxiedBy: TYCP286CA0289.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::14) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TY4PR01MB13972:EE_
X-MS-Office365-Filtering-Correlation-Id: 41f55c6a-73c7-464a-d030-08ddb456f1ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?duLv56U52Csi/J2cpqUPYVe3Mf5KD5wIWWj6Jb1SHHxTPgG5llDY8+aOioeD?=
 =?us-ascii?Q?5zlypzrQ2wiul9uhSkxPRuP3EQLm5JD7//D2oNnaI1ggk3EtjjHrand+Qbc0?=
 =?us-ascii?Q?4UJNgACwA220KVqoNMBASq3qlFlMgjgSJDqjRptqCIwVf1J6AnGj1wKyu7eQ?=
 =?us-ascii?Q?rDRha/V0e9sRSzEZyzl/IjzZbiQmMiUcD2zVg6lU1QwjbMxFsPGSyYyOuT/+?=
 =?us-ascii?Q?w8All3rNKvCHcbTuzfiIyi/SgaNekHG4kEgM+nrwf5hG815NbjSE2Gs9GSMd?=
 =?us-ascii?Q?K5hEdCxgLFSeHeSG0GoBLFpXHpncbG8SfasymU4Nxw+vybEjZ+ATzy+80mEa?=
 =?us-ascii?Q?RuB5/vT990lOFJofhaDEC5pheN9tmFH1kF4ihv64VfsXZsTTzvjdT2wacRr3?=
 =?us-ascii?Q?vlmV1x/6EiHTWEsLgsh5wZ1n4DHNcx/mdP627+FJ2FPKlYu+vBWVcSwTnCnr?=
 =?us-ascii?Q?mLjRWHMvKCogTscIPhq/Y3h6MWscldrus+7Q+91figOPh9sL+ib+NT8OKEja?=
 =?us-ascii?Q?iYnyXx5XqHFeHGxmaj339yS/ygMFhKGnANfXy1iCW/LOIpmrgGq4H0UWYV9q?=
 =?us-ascii?Q?aKj+pH7BZWx8On85CFlGpPMf58BDZF6YEjQWFMISw3ztDKZ3Dg7nU4bFtG/2?=
 =?us-ascii?Q?qXk4QjPpiZGOTJODMR22eC5DDG2HESwGInANpZKST0in1kEPyNmSljkKNxPJ?=
 =?us-ascii?Q?nSeYcGl4D4rcMOa1zIE0j1QatEkpU1Nso2kn1/n+1MtBoOGTcGjYuBMR+Oet?=
 =?us-ascii?Q?QcK8RzAMpYzNq+GMznoquPXDqKA+3jaSaaJrZf+lI3ps4vVuLU57PDUG7Wbr?=
 =?us-ascii?Q?1sUCdZg1L3VNBOXQmMbdWPUKcjdLFMvH2KPXGUAQAGrLLI2scMlTFnlAyyh8?=
 =?us-ascii?Q?T+YV87kQpAThv7arIKGfkbcwx5uRRDpy/TiG7WJdfWPdIlHJY7c4ox64ILQ5?=
 =?us-ascii?Q?8D+ZCN0W4aBHjQQk37ctfmcoYEQYKVCImcysRO4VrpTIGtWgcCPnqgpupG+Q?=
 =?us-ascii?Q?0Bj9Mu31kT2LWc1SBnPEybhXHUsNxvjG92ZLJonGXitTyxDTn8F6nM84NcC3?=
 =?us-ascii?Q?UhgKiCh+xwZ2sqY3vRYXG0bdBCsFGHQnjzwEowdpQvsFztvpnkSz0QJ8vw4j?=
 =?us-ascii?Q?Zsyxei6vj5f3U8Nii02tXcK4KJa5pmwsJ+Y02o5SyTRK5IY/hthts0dkq+A0?=
 =?us-ascii?Q?CYQz9ysLUHO/UTPeAk0odh70WwdTgEGzEHRrX0sz0PJYWsWZ6eDghqhkHaJe?=
 =?us-ascii?Q?ejAmZztZCDJYH0Ca3yvMWU2E3A+A+ME2882oqGhxFKNeNCu9KDwkgRwgs6XR?=
 =?us-ascii?Q?6/VpikRNjx94oqI4876LsQtq3Pfeziubp1xd/xAAfLCrtVqDkAW/S8P2X/xQ?=
 =?us-ascii?Q?uwKWVf9ga+2ozzrpWGcMY9NC0DQ8mYdXSgqNgA75HBQMYBpYsWT22kB0Q3rH?=
 =?us-ascii?Q?vwB3joxarPhbItADf9jcvN2nxoXCSuFvXXk+zhmvNUmpDp4lTQ8hlQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K6FgGyCnnK5igU1vEjNlfzTrljZMmcQiuZpPRZhPFGk1nyzXo7pZ9Wn9mtSK?=
 =?us-ascii?Q?l4o7dQ46R3vqpQuPHNo2pXYc57+ZaVuNvuOUYnJmZoMBnWx7dfWRadfPUvmk?=
 =?us-ascii?Q?Fq/T3sE/PutszbabLfHJkOFdmPKyzMnyeHD3L50xVHB/NfHEqg1M+mAI1kuv?=
 =?us-ascii?Q?XuwZgzhXVNwMHIRXwPdSXC2L1v7cmNpgWsImrtKnc1qbRYn/GuVmKNig0izS?=
 =?us-ascii?Q?qUMsNFucCKxgm3LnEmPcf8tvRKCwcHbB5HIxuCgKELSKtlswsifXBxlV/CXg?=
 =?us-ascii?Q?dmTfIbcgZ5ggyroDQJsruyR3+mwEwU/yE+bSxWfHe6VxRuRnflJos9zFZNK+?=
 =?us-ascii?Q?fqSF8k+NJf76Qdh0Ae5xQTd4H84eMbYXioa6/P7xOETTmrAHlLZ69jAXD3Hi?=
 =?us-ascii?Q?1F7UcE6gI2T87i35VqZfwl/NusAYfNZ/GCMAHuGQMgbq6PGwsN1viifQ+z0q?=
 =?us-ascii?Q?PuVBZpwO+JdiMy6N0RBVbqVMqh9J6N5V5jXpceRW6XbB8gD4FsFlgHYpP5/J?=
 =?us-ascii?Q?Cm0DpW9CV8M/20KmOYOtLtTBWifOZD562/Zb1eyp5es2JIz6MyxWaK5SOvpD?=
 =?us-ascii?Q?+G83rNvK1GJo8kEFwyWzeE5vutpmbXslt/QrlYRcPAOSiqz/LTc771pXiMuZ?=
 =?us-ascii?Q?ze+zw8WvTJpKhraA/q+/feYgEgz9JEXhrq1J2P2kanUI/c7vD9Yo/keOASmb?=
 =?us-ascii?Q?1huJ5NWpaJfl+D9Y3FFOmvddwwzx+c/W8paCDJaAsL5c6C53bdqlbm+POtDD?=
 =?us-ascii?Q?gtVHFsSaNQRC4QXm5ik6pCKrKdYnTsDuIewKWq3Oh44JGaFJpt8Wt0ogvPef?=
 =?us-ascii?Q?ETU1mmqMzVRww6sPVJkDE7sl7GkV8Fgdwby40CcNhn88mKeconLnIMmcJA1Z?=
 =?us-ascii?Q?bHkAS5hDgYZa9ymsROr7lvKksNfKWhn4AdFL60gtE2PEkcJsZrc/YkAFgO0D?=
 =?us-ascii?Q?WD6Aw1ru0uM5b9Ya56Uo1biLeO+kVbVj4Jt+FD3V612B5PTF51cjknVUHm+3?=
 =?us-ascii?Q?55WmBL2Li3MMfCtprp+TRgNxXLAU+VljlupbP/DJW+F35VBoWG+FWYZn9mgf?=
 =?us-ascii?Q?P9XkJVnU36YX1oQw13HCrjGSPGj4f1enFfgs8+SZb1Wfvf82b5vxoriiUaVE?=
 =?us-ascii?Q?TE95ehJOz7ei9KEY6SLzGza3IqBJvOZ03x2OKgR46Puln7TxdEUnpkxi+Ljp?=
 =?us-ascii?Q?3gZ+953MRsvBj15Gw2j5cTUHD0yCysXzJ8B4mviTGQYYJm9UPCHhYg6YG1bU?=
 =?us-ascii?Q?7HhEVdfVL5B+L242vAY8YAcbNAZ8fC+xVo8VHh1ecyKmV7uiptF3zzzUN/2Z?=
 =?us-ascii?Q?LxP9qlhsagNcxdFIEV00jzvKL/hTtDjrj2Pc0BZqXxRs6h79t5PTWbH2yNDI?=
 =?us-ascii?Q?AnhS7cOBPDY5R0gDRhc4HUIo56UhmMhpsrOSs+zKsQM49dDADA+HsBqybidi?=
 =?us-ascii?Q?LBSxIEL4cJU9KyO5m4DAVyKupRm3cfHiZ92HDDWkC7hLuvYLAPB9cGpJ/iwd?=
 =?us-ascii?Q?VizGhKQ9Gb3Ul8hV3cXpSlPeimgtLW3ikrVQTYVoA0LxVt0mN7CWX8UgVJJf?=
 =?us-ascii?Q?SwA/vNMYjp5nosxxUBmju1fokENdidkQo8x/twQBqVbDs6DR41gXCjRUcbza?=
 =?us-ascii?Q?tZEU35h55OTp29emI76nqyI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f55c6a-73c7-464a-d030-08ddb456f1ed
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 02:12:47.6918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4cDe9pzwBMsrlsugj2j0wKyf0g6BiG+ThGDo+6mS+NzgOUJw1BOIhM5+zpBcMsMTmCEbzcJAt3EWEbTaNQIfOYIpgFUhNCcHOhK6yuvfmeOINg9Hu5nwfasEm+v7W1s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13972

Let's use "dapm", instead of "d". This is prepare for dapm cleanup.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 58 ++++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 9925f5484933..88bc5b47e83a 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1988,29 +1988,29 @@ static void dapm_widget_update(struct snd_soc_card *card, struct snd_soc_dapm_up
  */
 static void dapm_pre_sequence_async(void *data, async_cookie_t cookie)
 {
-	struct snd_soc_dapm_context *d = data;
+	struct snd_soc_dapm_context *dapm = data;
 	int ret;
 
 	/* If we're off and we're not supposed to go into STANDBY */
-	if (d->bias_level == SND_SOC_BIAS_OFF &&
-	    d->target_bias_level != SND_SOC_BIAS_OFF) {
-		if (d->dev && cookie)
-			pm_runtime_get_sync(d->dev);
+	if (dapm->bias_level == SND_SOC_BIAS_OFF &&
+	    dapm->target_bias_level != SND_SOC_BIAS_OFF) {
+		if (dapm->dev && cookie)
+			pm_runtime_get_sync(dapm->dev);
 
-		ret = snd_soc_dapm_set_bias_level(d, SND_SOC_BIAS_STANDBY);
+		ret = snd_soc_dapm_set_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 		if (ret != 0)
-			dev_err(d->dev,
+			dev_err(dapm->dev,
 				"ASoC: Failed to turn on bias: %d\n", ret);
 	}
 
 	/* Prepare for a transition to ON or away from ON */
-	if ((d->target_bias_level == SND_SOC_BIAS_ON &&
-	     d->bias_level != SND_SOC_BIAS_ON) ||
-	    (d->target_bias_level != SND_SOC_BIAS_ON &&
-	     d->bias_level == SND_SOC_BIAS_ON)) {
-		ret = snd_soc_dapm_set_bias_level(d, SND_SOC_BIAS_PREPARE);
+	if ((dapm->target_bias_level == SND_SOC_BIAS_ON &&
+	     dapm->bias_level != SND_SOC_BIAS_ON) ||
+	    (dapm->target_bias_level != SND_SOC_BIAS_ON &&
+	     dapm->bias_level == SND_SOC_BIAS_ON)) {
+		ret = snd_soc_dapm_set_bias_level(dapm, SND_SOC_BIAS_PREPARE);
 		if (ret != 0)
-			dev_err(d->dev,
+			dev_err(dapm->dev,
 				"ASoC: Failed to prepare bias: %d\n", ret);
 	}
 }
@@ -2020,37 +2020,37 @@ static void dapm_pre_sequence_async(void *data, async_cookie_t cookie)
  */
 static void dapm_post_sequence_async(void *data, async_cookie_t cookie)
 {
-	struct snd_soc_dapm_context *d = data;
+	struct snd_soc_dapm_context *dapm = data;
 	int ret;
 
 	/* If we just powered the last thing off drop to standby bias */
-	if (d->bias_level == SND_SOC_BIAS_PREPARE &&
-	    (d->target_bias_level == SND_SOC_BIAS_STANDBY ||
-	     d->target_bias_level == SND_SOC_BIAS_OFF)) {
-		ret = snd_soc_dapm_set_bias_level(d, SND_SOC_BIAS_STANDBY);
+	if (dapm->bias_level == SND_SOC_BIAS_PREPARE &&
+	    (dapm->target_bias_level == SND_SOC_BIAS_STANDBY ||
+	     dapm->target_bias_level == SND_SOC_BIAS_OFF)) {
+		ret = snd_soc_dapm_set_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 		if (ret != 0)
-			dev_err(d->dev, "ASoC: Failed to apply standby bias: %d\n",
+			dev_err(dapm->dev, "ASoC: Failed to apply standby bias: %d\n",
 				ret);
 	}
 
 	/* If we're in standby and can support bias off then do that */
-	if (d->bias_level == SND_SOC_BIAS_STANDBY &&
-	    d->target_bias_level == SND_SOC_BIAS_OFF) {
-		ret = snd_soc_dapm_set_bias_level(d, SND_SOC_BIAS_OFF);
+	if (dapm->bias_level == SND_SOC_BIAS_STANDBY &&
+	    dapm->target_bias_level == SND_SOC_BIAS_OFF) {
+		ret = snd_soc_dapm_set_bias_level(dapm, SND_SOC_BIAS_OFF);
 		if (ret != 0)
-			dev_err(d->dev, "ASoC: Failed to turn off bias: %d\n",
+			dev_err(dapm->dev, "ASoC: Failed to turn off bias: %d\n",
 				ret);
 
-		if (d->dev && cookie)
-			pm_runtime_put(d->dev);
+		if (dapm->dev && cookie)
+			pm_runtime_put(dapm->dev);
 	}
 
 	/* If we just powered up then move to active bias */
-	if (d->bias_level == SND_SOC_BIAS_PREPARE &&
-	    d->target_bias_level == SND_SOC_BIAS_ON) {
-		ret = snd_soc_dapm_set_bias_level(d, SND_SOC_BIAS_ON);
+	if (dapm->bias_level == SND_SOC_BIAS_PREPARE &&
+	    dapm->target_bias_level == SND_SOC_BIAS_ON) {
+		ret = snd_soc_dapm_set_bias_level(dapm, SND_SOC_BIAS_ON);
 		if (ret != 0)
-			dev_err(d->dev, "ASoC: Failed to apply active bias: %d\n",
+			dev_err(dapm->dev, "ASoC: Failed to apply active bias: %d\n",
 				ret);
 	}
 }
-- 
2.43.0

