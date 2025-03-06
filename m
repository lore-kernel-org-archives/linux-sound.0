Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011061.outbound.protection.outlook.com [40.107.74.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B9BEEC5
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 02:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741226792; cv=fail; b=nD/oKPPJMGXmSvdsp7bNBaArqcrGx7gR5lGL1WwFEmGX1+ZyKsqK1+AG4EHrtkHbkMU4AWtZSIrERe38kPX9sbERDaV7AHdbJJOv130riIQ8gDXXMNn0IEzmDmY4YILgzYzYoJD83UZncwDaTvx1wwWormIQiOeG6HtzwPbSNEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741226792; c=relaxed/simple;
	bh=DQs9B2PC1NFYA9PagCuuwE5r+psTd4yAT6IW/xj6nn8=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=lrLcCX/1YZAymBuKXaQ4M9/sOm8f2pSFWu885rUwwT572coYS0JwV/SQbga1vSCaY9zGx/aUDphJLhUCsZN2ewgWti7lD+IP9myxVRuV2AYMxsnIeZHgPQLsVYfhGns0YnY3Pw4KwWieBxQttH0xEVgfZ9iUEs/srl4DLJM6oK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GmQtERnk; arc=fail smtp.client-ip=40.107.74.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GmQtERnk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuS6dlxKepmGVRAhj/nRvFW5E26/2M+/4JyluQcSxS8JBY1QLAK6sl1RmwBESwAcH/TA0xDUJ8aJT9TCKGyWqhLjet/pkqXy4w02TDQ5u8JJRoVWOIqVs2Ua8jR52lupzjkcKn8CrcPAsP23C0sVmHbAxMOfLeNss1McXL5SLiFmmEyIVF33txqdnEJ/I9yNGGpi7KNt0ClUmh1whRP0mjVtOv4t5oFahINrxKVwxm9HG4kMa8Z+j7NGMUq25YBNbk3vs9J9ZAOJ29vg/RlYVTFGA9ixSIO3h4Dh0F8WIQobvpnhpOvsRvHDEruIcWmon7iRmSjrLd+Us4q4MiKPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcYYPvJZckpGLCRyZ+u/2Tvcp+ApxkHDMXPRj2AY7to=;
 b=AmZ1mzbUhcrr3AhRYcoavVH9r9iBbBiV0ZeOKFSH6dTcD/JWbbNyH+hryo+qhraspz+APWMYwkayz0COXCebnr9bZi+TekEoe7I6kUhONAflg6KOYLZTxZNIQoxmxVV3EoKbtfK0MLE9n6QNjaNYqF3ugvH22bZ1iFWK4WpHFZ4gWKGY76wacXga7dyBX6BzK3ALStcAEmelAJBSafFyMP2hax65n/whdNuVwcWLrwURfZvk+GPCX5pweCWe9iatY3Yl5Y5dP/HCVFGAIE2vzsyU+CP8GZWh1PCd5zcuTX2Wv6KnJHNAfUjwKYfHAaEysG7C1zGr1lffK9TZY59kWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcYYPvJZckpGLCRyZ+u/2Tvcp+ApxkHDMXPRj2AY7to=;
 b=GmQtERnkwNeMVcAspGYkdvgYlIdMMEnC5Cj58GH5lOpwcVH/I4iHsIanwL6/J+fAUvn5adq4U6RutAs7rJcm1xBlJpgfQyz5OackGOKQ4mgW224vzAOvvJIld8//4edTOde9MANe5F7O/Q/7cDeGARbxmXs8/oDN59f1U/oiUfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB13518.jpnprd01.prod.outlook.com
 (2603:1096:604:334::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Thu, 6 Mar
 2025 02:06:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 02:06:27 +0000
Message-ID: <87y0xi52vx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-pcm: reuse dpcm_state_string()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 6 Mar 2025 02:06:27 +0000
X-ClientProxiedBy: TYCP286CA0315.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB13518:EE_
X-MS-Office365-Filtering-Correlation-Id: b2418c7f-213b-4a48-9a1b-08dd5c5380fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+AQzIDlw4atljnQBuMHTeXVOcGbAFXf3xNYp/yrXovWPxI+Z2xFmOrRgsnAM?=
 =?us-ascii?Q?M8oXG70qcC8q+QhhSpImFVaEDSAg3O0ufis0Xm9VMDp+cZNC4tFuyEuhfpk0?=
 =?us-ascii?Q?Tlct8lGiOGuMRtCCpR39ZHmlfcSeosA+dJ1GmNBRsxtBYTNZbmZvDdJiuPAY?=
 =?us-ascii?Q?fukujKKQoSvNBXIcCWbko8RxrE3/3MlogX4Wve9c873MeyyGZxHQBI1Ymg+G?=
 =?us-ascii?Q?iytuBrpk/HRtiqDnj2gLU7x9mGUxHf86iTruszTE6T8tHieGITya6ld+cSsG?=
 =?us-ascii?Q?5Se0dny36waZFRE2OdqbBahrpqht5f23KNdImihCyqnKBiiWzdQavOBuJOEW?=
 =?us-ascii?Q?6+mmnEymRLPhd+PzyjDtoA9GPq/BmYuxhQz+/dNtD5aL40CEcJLkh/F4m2iF?=
 =?us-ascii?Q?boGdFzU+mHRjVMqikX48pI4PtV42zaXcZ+C4FhTpnAADrvVNlNl7bM2T2YNM?=
 =?us-ascii?Q?jBMUDv1btG/crNxjzlraupjCAGJK0lmnXvZDPuKmvUHyxLibIfuKEmavOKCV?=
 =?us-ascii?Q?iajP/nLesc4GJaRb0WPzKVmZK1AgiMczAy3Mp1H8ot1GBaUsO1+cTo3yRZF8?=
 =?us-ascii?Q?YlJQWKGjAV80R6hkoP1Tp8oJg+Uq/CIXaqSbBnjOArYVfMp+IhZ0oZLvkbOc?=
 =?us-ascii?Q?Fh2ZAxJgR1rh0PURPda0mYMMtUR/dbjjIMwnqdMB/w9fksmAQouD6UrxMsPs?=
 =?us-ascii?Q?gAC2q8BwSTcm8U/z7vtBQAnp0gsiXxfypifD/U0TGHTf54KG7bZj7wiYb2AM?=
 =?us-ascii?Q?Jf8wMcX+vgBmle+3XqX4LQbWUc/py94oofBBu+B/6qAlh3gFU0/NsrrSr9io?=
 =?us-ascii?Q?AqIajuhO3ry2zxd9lvoLk6P7YimedXucvgr60DBScp3AaZ5C0DwzUiVgAUiO?=
 =?us-ascii?Q?hUPWVwik22Vyxhmn/eanF/KKZlYuxnWIVtGnY1DcgrrDQ2t73nTCORO4hRZq?=
 =?us-ascii?Q?4Oktn/dt4euYTGGmeH77+qyZe3IDbceKAFvCdLwcbBmNhlJxbSyvjn8zkMQs?=
 =?us-ascii?Q?BGiPgL9oIDeUtpoYIVKds4uBjPrUiThEE83l/7ti6r9wxRn6h4J3f4chHVfH?=
 =?us-ascii?Q?HZuG/4pOdT4JNXKsljs7EOE/Ctm7Us+DmdfjApx5QVJZk+6kGd686aOa8GQj?=
 =?us-ascii?Q?M1Nc1D4wQQb+zcLEN9MAw/JXfZc7JbkbpHJXvPJmD/AsFPLjBRXbOXx+uxZj?=
 =?us-ascii?Q?t4/TP0X7acWz62g/12AgT/+yfEl4+D3+8euMdzqfnyGDmB9rN7DkvMRyIfrU?=
 =?us-ascii?Q?iAFo4j7XmeubVi6ReNiLIplD1SgIs5YiR4IWiqLUDEf4b25Cm6qLFPXVFLVl?=
 =?us-ascii?Q?ELcCf9bC6fGTqQpmDRjnbCV9U5eLUyif9YcslIeJU5yh0QW3Lh0pXQV/KKUd?=
 =?us-ascii?Q?+B6Xu4/YpHCKPlwOBIwej/aaQcft3sNp/coBxDCTuY0vVbMOTNNMqgYhK4V1?=
 =?us-ascii?Q?0W8RMklF3+nVn7MBaZahHmCrE3QQBpRf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rzWIRBt45aiqG+fr5Kas0/iEoX0Osp2ABAgI4mR49gxct/OyqDcDJFPXZOSB?=
 =?us-ascii?Q?rZy9pYkQp71a8w+KHQ6wnJCsOElrJbaLd5FdqxIFqyHh/z6GfBpBg9nVsN4E?=
 =?us-ascii?Q?mMLgw2MC//aqyaXQr6PR3406CtLPx2BSgNQZiYFkMBOqsk9G+THhiqNj5t9f?=
 =?us-ascii?Q?7hQ8Yp2vCNI0uKZiXMLajKVSTEwqs8YWa4IYsBtx7IgHq4oO6OkKxqptyqVD?=
 =?us-ascii?Q?90ad1ZCLg7FHHeYbTFkiUBJO/RJTVet7R7686iicM2Wz8E7s1F+fV2TZUcoy?=
 =?us-ascii?Q?+Av18+YOxt6nC5+5iUifb0eIMj82y43/wZDwLSw30Ajket+HN8g9XeXeaMZ8?=
 =?us-ascii?Q?T7ELdosIxINuwDIC4xgBGat89eopCQi42z12mZN9e6f2S9mvwNqkv6cq8R2I?=
 =?us-ascii?Q?y6nwRHsUoaACsuIpsRDAYX5I8ClzkWXODLFL0+iYnd6k5hmmnxfYe9/xTAfp?=
 =?us-ascii?Q?Qx0zAGu7XsSBmxft7R6Y/oszR9w2cDNvLJCM49aZwJqfNDb6mrtfa82arH4F?=
 =?us-ascii?Q?BNRowdHBik9bBfWglTQf47ydUBl6M7pjzjgUysg0Cghig+/zFmKfwFlEvREd?=
 =?us-ascii?Q?fo87YpiauMs8MMllFo1v7U04UpYMMi0yxrqSWf9O9wddQ0WQlJWdi91jEvEY?=
 =?us-ascii?Q?22NOvi2UEN+tPAi9o8xPzomMl34hYUqM4iBURT9Yc2+GL7k8gWOHrIL2arLX?=
 =?us-ascii?Q?2hFEenBNRmcxKfFH1FeRVupDw/jtnhorCWgd+1OOMflBfS4Wke3SROGvwVeD?=
 =?us-ascii?Q?JOSQq8nLtdkgPhqT1o6eJywefjL6W8pSvYo3VISHVSPL98eL3w27JiEsED2E?=
 =?us-ascii?Q?8NX/AEoGxoucY5ilOuaBAAuhgsno7D7adv9aOF6axmAGAKfA4zsbBJVK7YsD?=
 =?us-ascii?Q?W6SeCbtvhggk9Ws6A+5JS8GEebysDfCDFokpDczNzIRNXgSduJDXhPaL0/C+?=
 =?us-ascii?Q?8CLsHPmPzfaeWm8YoqUzee70j4oJtXb3ag+IHxeUa0/wrhRTucZ8zt/R9KWE?=
 =?us-ascii?Q?LeoqLZRMEkJ+b8sX9pWR0pXTIR/eWZXZ+9dc2ddfEKrbT60Xx5b5KHF/tjuX?=
 =?us-ascii?Q?UoyD5Tc9NZ/1Ai0LzgUWn1pCK9as/LUtLmg9CLN3G2qD8h1ElUncISmt3YY2?=
 =?us-ascii?Q?MaE8LbqPfIVm/CLXLCpdZAVF9ndhBY1eHhAJLIQ4657SfDATrzdZblz9YDYx?=
 =?us-ascii?Q?z0p5X+Eq6PqPM0Ab/48HX3gB0Ns5fhxLm3ICCQicP7HIZ0IMfksqrh4o9GnK?=
 =?us-ascii?Q?gywD1rG9I+1aJJIbcrH4YajFFLcEszw26m6LZKbA4p5+/0hgFLzdmT9na/G6?=
 =?us-ascii?Q?J3yclvw3+oEUKR5OSf2iU7LZI6GUtfOe8UdaQS/dC1J6jfdCN6YwsAasBPVR?=
 =?us-ascii?Q?hjEZqSTfurKpd7iHLFspZu8zOyWZBQ2TM6EABcUPCqBTFBd2zcKbS2HcKCTS?=
 =?us-ascii?Q?+DE4rjZDRO9OHYXpsO1zO4c5owogr1RKUaPjdS1WNOGLPdfObNNCbnUS081c?=
 =?us-ascii?Q?3INAze2Y+qNwxsyBq7noRpvWG1/rLIao1cUl2GCpE1kL1dYuqE+2mymecFbZ?=
 =?us-ascii?Q?ea8KYRnHUPcACTt2WZBXo8XlwhpcuYI1fg+LEUtQoCW1SPtXA6nC3GVA3+2H?=
 =?us-ascii?Q?Svn0NiOV3d+pBJRzYIHEpxg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2418c7f-213b-4a48-9a1b-08dd5c5380fc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 02:06:27.3510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TK+jyojTiguMmiPurMgKPeKaEbfx5fZMv3KFDj2y5Hjipls/wA43evumwEhofNp8Ohmwo5L2a67IrYRUpX07u+SJVDsASVjpjjwrraFWqe4HS5fMnOpKNdrykPf9nVsH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13518

We already have dpcm_state_string(). Let's reuse it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 73b05b8f5a07..88c948911aa3 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -144,7 +144,6 @@ static inline const char *soc_codec_dai_name(struct snd_soc_pcm_runtime *rtd)
 	return (rtd)->dai_link->num_codecs == 1 ? snd_soc_rtd_to_codec(rtd, 0)->name : "multicodec";
 }
 
-#ifdef CONFIG_DEBUG_FS
 static const char *dpcm_state_string(enum snd_soc_dpcm_state state)
 {
 	switch (state) {
@@ -173,6 +172,7 @@ static const char *dpcm_state_string(enum snd_soc_dpcm_state state)
 	return "unknown";
 }
 
+#ifdef CONFIG_DEBUG_FS
 static ssize_t dpcm_show_state(struct snd_soc_pcm_runtime *fe,
 			       int stream, char *buf, size_t size)
 {
@@ -1636,9 +1636,9 @@ void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *fe, int stream,
 			continue;
 
 		if (be->dpcm[stream].users == 0) {
-			dev_err(be->dev, "ASoC: no users %s at close - state %d\n",
+			dev_err(be->dev, "ASoC: no users %s at close - state %s\n",
 				snd_pcm_direction_name(stream),
-				be->dpcm[stream].state);
+				dpcm_state_string(be->dpcm[stream].state));
 			continue;
 		}
 
@@ -1687,9 +1687,9 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 
 		/* first time the dpcm is open ? */
 		if (be->dpcm[stream].users == DPCM_MAX_BE_USERS) {
-			dev_err(be->dev, "ASoC: too many users %s at open %d\n",
+			dev_err(be->dev, "ASoC: too many users %s at open %s\n",
 				snd_pcm_direction_name(stream),
-				be->dpcm[stream].state);
+				dpcm_state_string(be->dpcm[stream].state));
 			continue;
 		}
 
@@ -1708,9 +1708,9 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 		if (err < 0) {
 			be->dpcm[stream].users--;
 			if (be->dpcm[stream].users < 0)
-				dev_err(be->dev, "ASoC: no users %s at unwind %d\n",
+				dev_err(be->dev, "ASoC: no users %s at unwind %s\n",
 					snd_pcm_direction_name(stream),
-					be->dpcm[stream].state);
+					dpcm_state_string(be->dpcm[stream].state));
 
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_CLOSE;
 			goto unwind;
@@ -2572,8 +2572,8 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 	/* Only start the BE if the FE is ready */
 	if (fe->dpcm[stream].state == SND_SOC_DPCM_STATE_HW_FREE ||
 		fe->dpcm[stream].state == SND_SOC_DPCM_STATE_CLOSE) {
-		dev_err(fe->dev, "ASoC: FE %s is not ready %d\n",
-			fe->dai_link->name, fe->dpcm[stream].state);
+		dev_err(fe->dev, "ASoC: FE %s is not ready %s\n",
+			fe->dai_link->name, dpcm_state_string(fe->dpcm[stream].state));
 		ret = -EINVAL;
 		goto disconnect;
 	}
-- 
2.43.0

