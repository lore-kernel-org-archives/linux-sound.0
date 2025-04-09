Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011048.outbound.protection.outlook.com [40.107.74.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1CF8C1E
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 02:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744167439; cv=fail; b=peTlWUSm3b5mMDKKQlwyttCheuEVfKLH9U7/QYq7gGzWK+t3Eqf16auR6G7V4QKOc/4LQ4rGXazsyZWoFiwRiMwHtBMry+NjF+s9edkx15D5TsStXt+Z8Sxt7txeU5hvM3ujJNk4Jvh+mJxfHbTH2SybiuegSwNK/rTE3x/Ba90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744167439; c=relaxed/simple;
	bh=a1kSGLvURlyB4pQx6Cdd7eNLQg85fcEpcihJqUnPEdQ=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ofsoSSSMkIsox4mvYfFhXSU8JT70JVYqcjlndV+KMX18TbYRJ2PXQrjVS+N11UdhA9qKCSyLrTu6Z+ASvBY5+D5tJ3n96dXVzsJjnRCygNZ5lcjCyNAZOicboOLh0snqXBkEPAjmok6EuwWZp+VdL6OcCWoorCZYujATqveDGkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GO3Jup2j; arc=fail smtp.client-ip=40.107.74.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GO3Jup2j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jB/2juL2YhRC+hXVwz0qI+Zwzd98HHHwu7PWvOCTQw3NlIHSrqdBv02fB2IGinu6mfsER9xJEpnGkGHm74q1St3X8e0bX0+pRkc195ZgIN+wl8UrzhQOKpJs4TpE509+QCmVSaMqeHoAgMJRNeTsqOWjl8MaHr585zinN5HB0eAG3jsbaf5VoIjEg+tav/U3mdcvoeyyGAu0N6vRHihNDBIsC3j3hwNlDqoytI1y7IrnQlAmZrQVRbQusMg2LcQ5qD2DraunQdk6RzzHPELUArPHS+ytXBqNdWaCIoHi5dYRpNvfc+hJWf8B/7/wrHep+9KZUPSaqnK4FQXGs3xVTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WvcAJJJYZaU7ksZGT9ZyHJKdoL7a6KODWLiHvGAbFQ=;
 b=q2umOgVkQX6plEpcHqjaq/oj3ESZTsOK6TRmOGfjiCDB0V0iXXmp4PdvzqQPPQhIrK4DGdc2xVnd1K70UMwBHDWMOkg3aP1fUENW4W/gYS7LVPNGPZC1Hyh08SzWrxKIdef3V6i31pC0m1dFahi2X1MEfn+mbLBCXh2szUu2qBTQAmF0pmUU4XChnwwodU9eOLHwBUF5QbPVzPahO2YgdZNRU+xEAa1iWEgdO93P4LdpOflHugK14y7ijXMVFoH+oFtcMyQED3o20QQSnX0WOYSz5/NFUVnt/3jSo5lPbWQb8mmAv2jzoOnJhNo94qQugDPn1thHLJGO/LzIh0qZHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WvcAJJJYZaU7ksZGT9ZyHJKdoL7a6KODWLiHvGAbFQ=;
 b=GO3Jup2jbW2e86nwsAqdc4IAM4rI77Po52Lg9HSna4Uzz4MQq5ckoOFXqlNVB2Cb7Klf3OXcGYsEdvB7WFnzR0QvL6dKRoq/x2PRbkR6sm91T8XhsAaVb4mOgrWEczKj+PmQtcRJ9MjODNowg2/5hB9zzOpWiRKbPnzJw0UNn1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11643.jpnprd01.prod.outlook.com
 (2603:1096:400:3dd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 9 Apr
 2025 02:57:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 02:57:10 +0000
Message-ID: <87mscq9h4p.wl-kuninori.morimoto.gx@renesas.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bard
 Liao <yung-chuan.liao@linux.intel.com>, Cezary Rojewski
	<cezary.rojewski@intel.com>, Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Kiseok Jo <kiseok.jo@irondevice.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, Vijendar
 Mukunda <Vijendar.Mukunda@amd.com>, <linux-sound@vger.kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bard
 Liao <yung-chuan.liao@linux.intel.com>, Cezary Rojewski
	<cezary.rojewski@intel.com>, Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Kiseok Jo <kiseok.jo@irondevice.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, Vijendar
 Mukunda <Vijendar.Mukunda@amd.com>, Benjamin Bara
	<benjamin.bara@skidata.com>, <linux-sound@vger.kernel.org>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/7] ASoC: amd: use snd_soc_dapm_to_component()
In-Reply-To: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
References: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 9 Apr 2025 02:57:10 +0000
X-ClientProxiedBy: TY2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:404:56::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11643:EE_
X-MS-Office365-Filtering-Correlation-Id: d2c20cf8-fdb9-40cb-5fb1-08dd771238fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f6cto94PTVbGldDmd2aR6n7qlnLLKxQoc85gKzY6Uy91ZF24u2xQZIVo0OGo?=
 =?us-ascii?Q?mifvtTZH8j+orRLXP0QV597HPfCzAhjTeHOCqYH/3uo1CBtRMuCpiMd+f9Lc?=
 =?us-ascii?Q?51e7xzsWp1cLq7R+ztSX2hpR/JKTkTPBg8j+jHenTnYP1mdW30Vo8ZZi28Ev?=
 =?us-ascii?Q?5AYKsaqqAHXY2qMWYkXzt5sYVOsmfS9/Nuw1NPYfQy2V5CkkzLtJr76z2Z88?=
 =?us-ascii?Q?p5jRvZQAk3cVozv6CuZAiikMq7VH+q0DcWkjgJy9Exbw7+YLNF2MS8fLKD4n?=
 =?us-ascii?Q?Jl8lr/ApAs1PKR5y6SNQ3GXvR+DOfxJADgQWUo8k7fYVlEh7ywFHUhU+cC/j?=
 =?us-ascii?Q?kiAQdDatCgZm7DRHcVuvO21mTdZbRRAFTmMfvop1NWKEd2b5Juqc1udN+Nwe?=
 =?us-ascii?Q?GDgJs9Gio+xXNLERwHLqif45jLr09JduHvTZkZrAJQmPX1Fno0/GvBK81+t4?=
 =?us-ascii?Q?RgFFujozfLlR7jK+wQHQIj2UTyPvRz6oXfw/YfdST4T6fezqYBXC1rntft/Y?=
 =?us-ascii?Q?K7htpULREtRMTaFt0Y1y8tHsGwMVGj2vJm1yIbp3/6gFU72fiQ8f25D1ic5c?=
 =?us-ascii?Q?kpLkcpVpLHA3SjWeegIagDXUx3UAtGm52BUFvEvPLaKqhOMTOc7pRh3wwm0J?=
 =?us-ascii?Q?9Sc7L93E3St7IwDX0Q3Hp6wr5kfjkICdQrPzBYpLkNeXajoN9Bslby3DfgFV?=
 =?us-ascii?Q?MWw8G3efWRhEdedo31VWpycTNhY0FRAc24/k4pP6o+snTt8kZRuiYj23hA7o?=
 =?us-ascii?Q?QDDbtA3iDYhfdNQj9XEPVPLKihuY0Z7HujNDFMaUYsTs2SF8yukFCyMpOWs+?=
 =?us-ascii?Q?pTbLaADI3ft4nQIha9TdhWvwVV86Bgt21DPSO8W8Ut/dwIAC+1r7PkF+gJmN?=
 =?us-ascii?Q?+U1A2GwCZHZtzvM02RFTpKeJdSfsDvxSgbkLSn85M89NUkkbGZrEM/iFc7+Y?=
 =?us-ascii?Q?mS71TjBD4+IBaRZuou3qQ3hf7qPL+Amcgbi+p3YGuCvLWoxnglaKHStR0Hgf?=
 =?us-ascii?Q?3LBgNEX3sisVcli74i9t7cEpULH6/kB8AWXt/7Pn9CU2GEn0Xgf/WJZMvGOr?=
 =?us-ascii?Q?6lBQD6pOvoFjWYNP7v79r5zRXCpHlc+0UvBev2vvea3vFa4xtpw3J7UmXKD9?=
 =?us-ascii?Q?VhjWoDNJjBNeMa5o+YdPHU9w1BhYAHQLXA0y/BtNdLJAaG2+n32Kwpft8sLH?=
 =?us-ascii?Q?VBeszCiWdAtn+BCRSSEsDOgF0buXMxBy5cJfHCokNW+1VsgBHXBrcPrjKwmm?=
 =?us-ascii?Q?Pt2F+lJK+RtwOVF54D7LOaKryqmz/yF7LZDNUNYQdrDjGZscNdJSfyUVpqoR?=
 =?us-ascii?Q?OPcf2/Tkznbv0YW8eUbuD4yB85AtFWthZBai8LmXSbHrt0n5WNb5d2+5ubkZ?=
 =?us-ascii?Q?EsKsUUMSyAfax28thbEl2wvzaM1WdDdYF/3sV7eauuW9hXlPoImKogEwci/p?=
 =?us-ascii?Q?g30UzJJOFVq8n90EWviNMuWY/QAA2mb51GyicHQkhFgGo66tMmpVkT4cjNi4?=
 =?us-ascii?Q?xyrL2p4+vFC6MgE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+Rea8qQDTzjiNo625meEav4XsrMa9WjNTzvEQL0iOUkIVyIxYhtot+rKwrZU?=
 =?us-ascii?Q?BS21T4VRrCBMaFGXUqjpLBz6Ws6Bg7wPXxyV24ELPY2Fb/+Y0UMcHZ/COEt+?=
 =?us-ascii?Q?et07kU23VfzPVy8epjTIVCH3OB+SQvTT1Nw+NfcBESTSB+PDdkNyDS00ShTm?=
 =?us-ascii?Q?PmhsN90laWQ/8t6+9Za5nKjG3vbrMMCvGKz3mGP4KW2MCwmQZ58wtZxBia0J?=
 =?us-ascii?Q?hWfpQp4niZQL9Ydw7gq/sUg/ySNerq0+/PNUhn7Sv2k3+SHohPgZUTpQn0yZ?=
 =?us-ascii?Q?E35zHt+/gJX3IgsKMrkiJtbHtUW6L6DPoi8GRTmZx8qND+dCG7dIGKVVCkpX?=
 =?us-ascii?Q?cl0u3B6fiXRGEe3Ye1CAqxDLnt7eIfLVSkKjo6tanwcrfskzRnuGtdXWLgRB?=
 =?us-ascii?Q?wnecKzkf7f2CtBUQTKnYs2bJ6OZZEl7Hh1ExIX7oCrLw98aB4/gDY0tKa73y?=
 =?us-ascii?Q?+HOAMKb7xFtVdDXW/gnySihsYuI0EhJaW9u1z+1cv1yvOCDMEAy6VOOAzk1t?=
 =?us-ascii?Q?CITpPN9EkJEFPcXfjPwKzzm0rq4rihDuUTMxhH6vlotZyt3ALrvCiNPOncMj?=
 =?us-ascii?Q?Y5B2QRKzCkK7FofNTKXwd9n0r6ExZBXroKXEOmD2xR8MD9TKEPSNNUnUoMFL?=
 =?us-ascii?Q?DowsU3+s/2WUNCFj1eWMq71sXTuWNDwO2THsgoDhWf4yROmK7PiqfKJ9cnpR?=
 =?us-ascii?Q?/b58MpIDmBnccf/P3agPuJmfBtVTy1P7SWi27uU1GufCJhrdIM00rA/AenMT?=
 =?us-ascii?Q?hfvXvuTy5gwoXAH6Xtm5ibgG0fD1/t+OfbB4WIjtaI7dUSexWCX3ggyyPYuJ?=
 =?us-ascii?Q?Utf67rXBsxRDtrwCqOxe0PhJhccOvCM25JCqrz1BjhZeUumt7H0qDCSgeH3J?=
 =?us-ascii?Q?DqsX9c9U09fE0r3ebG4/17X8G3WoA6UGT/12jG05DtgtJO/2bSpqr3VgqIEU?=
 =?us-ascii?Q?+NB/FICOsAjBuN9MZU1cekQDh/C7Wj7rrVcOdEnqVyfL4ehkWrtSw1U5vIYu?=
 =?us-ascii?Q?2eTmtCD0gFRWzX/w5BsJoM6XDlGi3BCPh3cm/Ef6HWA40omiXb54WaCqYZlp?=
 =?us-ascii?Q?QFI8uVzMZG/mRKyixPkiWBzLhJjBjM5cNbRn6Oxhi1bQU+yBz3MncsNX3vSS?=
 =?us-ascii?Q?6Z+vFucYDxil+dnN7jaPXgT+9bH2euWRN2IBlwbKzvaSMR4RHShbe/pHRZ7W?=
 =?us-ascii?Q?ulC488v5MO/8HTrbm+VCxJwMVokiwHnjUqDLDSKJRV7WVDaT5OACqIZ36RPW?=
 =?us-ascii?Q?/iZIdiljmvGa059vGpDUuuaCw0Sirz4GBQagN9l2/4F+awTaRNxziiOuWw++?=
 =?us-ascii?Q?W1YWSYlkL+OH9I/WTwpZtaGTsdUm+Bns8HWt0W7YCaxtsvCdwHEquNmu7srY?=
 =?us-ascii?Q?7WTYCkUPhhdE/1riKh1+aiaZc4vrTapWVWa0EMrfZpBr9Bqm381tNNg96kBA?=
 =?us-ascii?Q?6OE8KtWQsyEFpiiCsGiEUlXXFBTWr+dMeQD8MFhIphgGHy1d7HcHDvca/lHx?=
 =?us-ascii?Q?ZRQttAqVclcFt83i/t2tpBcteKQHRi47O2AcwRD8QCN6URHUspOmij6kQh2Q?=
 =?us-ascii?Q?uzJAZAkg8dNP1fddut1JLAVSbFspUrlPgIwCiUvdXJb5sKrWfh06de9pLjY1?=
 =?us-ascii?Q?eF1knq2jlpxLuJMZygFU2xs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c20cf8-fdb9-40cb-5fb1-08dd771238fb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 02:57:10.6850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QditdqVdfNArZ2YVCHAM+rcGurcAb0v7QJCRkxFvd6a/+iqp3xEVqhzLPyDKWTrePcnV8OyBu3138tPHueq1JINU2OXdGYs63+olvCytUhuw8EGnpQprwbVaNg6ubaXk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11643

We can use snd_soc_dapm_to_component(). Let's use it

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp/acp-mach-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index a0dab85088ec..b68ee80896ec 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -1340,7 +1340,7 @@ static int acp_rtk_set_bias_level(struct snd_soc_card *card,
 				  struct snd_soc_dapm_context *dapm,
 				  enum snd_soc_bias_level level)
 {
-	struct snd_soc_component *component = dapm->component;
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	struct acp_card_drvdata *drvdata = card->drvdata;
 	int ret = 0;
 
-- 
2.43.0

