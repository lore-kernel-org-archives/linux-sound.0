Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795737520;
	b=dW+FDt/x2LEavLnkoA3NgFBoE3yojzWORmtlOGCdCbEn/Mp6BTkBBc7+Kx5vFhdAWOn9
	 SAKkztNjp4af5PIa6519lRmO4tQyICmn2J7Cj/8ge7JrPq2WoWE+N5xAkHIJovsA22Mos
	 288iH/gKbVSKCr14lPSsK2GXuKtcFUgowTuZQFDYFQriio/qSCfvsYXFXTRUzuKgs4a0H
	 7pQCXp8+YDvf2i5Fyn5hY5/mS3GtxtFGAZ42kFFAdRSbiJTS6epVSwxwVLAXXcaAkItKg
	 Hlcr3mmS+Y3uKVnUiDd5laQFtG7NmGFwNMcTpwB2IooEsq8SE6FdsVG1IhN342fkOJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737520;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jIdcTf74cF1NNL3wLyjc3RHmRs0fVd43JupC83iKgOo=;
	b=gmuI2yGADpZ5tdy31vYXYbirbEH6R+cNmzYX+8/kVjiTp8x67BICUH9W8B2GzN0XXUk+
	 eK2+tWmfLadsXjRMg/FgPhIyAPOy2BzsffA71QRY/SmFJF9q0K15EGxeHyaEBAh3Gjhaa
	 HTRx82CF3ed0PlKe115g4YFRbaN62ajwgMSSugB6SgKj0JlxVkYcO8lDrTafga5/afNAE
	 KLy25BazDd4uOCrzIGGPmrlagJoNEvvhJ94CWEvf24uhb79z8PTQQ9RVmYu7uc3stcSBz
	 7tCAEQYaUG5ijID28v+c6qE428HcYrLtac58vPudnZ8v1BbO85XewOTZv5XleTSc/bA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b="pVjo/ruV";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.38
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011038.outbound.protection.outlook.com [52.101.125.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8169606A321
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 23:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8169606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=pVjo/ruV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/mHu5qx0dH0DgzNpGbfl8B+Q9HqSQnIpHRc5yV8bEQdUvp93JV9UbjFbLtZqZ0glB/UHE8uLvm5z39SYnNiPS251KAkAxi0hq5KxMAAUnfEqUKFETKATmbs2sb6Iz5k/U1N4pZvH46WCRTV02VTMNQG53bxU7vLfsCQlsxABy9xAmP9BW2IHurGfD5EUC/Z4DQNNc8HJChC6asynn46Ud1Yhg0WU8NUX3GISXxYD4f3ZJL2AUBQRZ1H1YC46FU8lN1o48wrzI15cGiPzy12ua1kITtVPDtP4/kHGBNyRwSfwqceoy3Nn2qfuh3rguCtrC7CYIuFMeBdebCPoSG6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIdcTf74cF1NNL3wLyjc3RHmRs0fVd43JupC83iKgOo=;
 b=T1BZjf1dKTLsWGEYRAPL6Q46Ip+o8DR+OWjYkhgTL3jSaMomAVuRMVKSR3SX+OOFsl35mp1FuDAg3D/VetdNvuvkgblOVOXOpyfFJK4OyZdxtlBqYCUlPAOIXOe0NU7Gokk4Je/8QW2qHlXBewys6ibiQYcMtMYUKmu4bD8T1b02N0/zAMl1oCubynESzTc6H4Hb8yFNBWPm4w9TrVd76pwo02pRBwuj3EABJNKuGnNC/L4iPW3C6lcoXSJo3tRvzZquOP2K73BNXWEpd+evoLXGj9K28lFHV5yhYaAFc8k/SgGP1mTz2vXUURk5e3Z3UP0HNlPVxhTgOV5har1iVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIdcTf74cF1NNL3wLyjc3RHmRs0fVd43JupC83iKgOo=;
 b=pVjo/ruVUn4xjOS/nkO3dw13wScZtS8qkBpWTCSKI51ZuzX6lFIPxTqf1raU1PVD3Fbr0oSvKF2SAXucNCHRt2c5pGC7mfE2up6Hh2s4EWBKURhh4HhMmtOBYWUF/PTMuuZ8Gd4Oe45Y5Z8hH2X3uCAQERl9ilouDnYZChCYV+A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYCPR01MB9643.jpnprd01.prod.outlook.com
 (2603:1096:400:197::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Thu, 26 Nov
 2026 23:58:38 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 23:58:38 +0000
Message-ID: <87ik1jqh5e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/11] ASoC: soc-dapm: rename list to path_list
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
References: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Nov 2026 23:58:38 +0000
X-ClientProxiedBy: TYCP301CA0076.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::10) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TYCPR01MB9643:EE_
X-MS-Office365-Filtering-Correlation-Id: e75ab941-8cbc-4bac-8423-08df4c193084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|23010399003|261009223027099003|18002099003|22082099003|56012099006|11063799006|261102123227099003|261021121427099003|10067099003|261021123027099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	PRih2cgPAv6oQwvNKpCwfGX+MktTtAsYD/GPdls2HgxBSxNURQEEw0q/DdbrfPcq3S8JJgkqdKa34GTv3o48DU/F047lUYxMfbmd07sxppVOYYlCFwJh83g6vfyU8ceW0J9hjwFQXHz/fW7njj/ycIk7OSo6k+uCIAQp67mETPceRaVhDkixqFDb23EscGIU+FX7pPvlDd7+9VGHNbBVpEStiPyGRRUjYXxkyWLhdOQh/Gvv2YvdtA/wBHKiqxpitwVBTix+jna5q/PqjOJDOPAA5Wv+VMRjXdesfPuiZs/CiGBn9hxF+ZB+HggX0ZEE5BVeCl/BKypaNm1JBIa94/1lcsQ5Pp1YPYL+vFKPTh6rkuhPd8yUNhU6dSLrXt1nkAwhwZgsYctFp40ukE0LUtL+9rrEmm+NUJ66Zd1CCkmr/cBJtxSGuFmqKUpx9IZXwOci1a3e0nQB2KsLZPJW0CSJeF/fSRlHJahGWckrM5eYaFESAsOeZK+1B+2lBDpDvKI2BCDDwdEUsMz5yzCEP/7N7PLWchNh2OTRvdd2CTYF4qn13MoUgxjt61cbuxNc0/yrcans//98B8XQ/UZQU1/9jNj3gQpTk/tw4DW8qegM+Fej6pXVlHj6bKweM95tl+PdQUzhQ9IO0BxdPl0Mv53yqaEL5PX3MH6CXi/30sQwfHDx/Czkzu5zmtzXtEA5H+MaefuQcF2zN5laQ3qUEVNLnTUmO+VdaF4Rz2DIevo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(23010399003)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(10067099003)(261021123027099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b6ivWFDO9b6ZnJcRiloBSlg60ElDPaFZtOScCgp9Tt8hw6lOjyadz5utPJAK?=
 =?us-ascii?Q?CYGB+2E16ICQ6mqlKtKXcvPlBCucbm3lfol7/yzXC+mDnfDbg+Eqezb/vHHG?=
 =?us-ascii?Q?+qZXFpXju1QM81jWnLhwjTmVQYIPN7Jhmi8R0o9QgG2PBZO9Bumj9Y/63Oaq?=
 =?us-ascii?Q?J/w0+dmbHrxJ5V3G7bRIFPnU8T6AA0RbCp5TBJnwzEh/+ppbCpKAGtyT9ZMV?=
 =?us-ascii?Q?idDzHEpG6UBFMm1tK5KAHrxFv2Zv1LCBaJbIq8igO14LXGBy86Gn1kzE8o3v?=
 =?us-ascii?Q?m300iWk/scfoYO/AQ2YliMUWfRV7H6+E+c1AaWr45sPqwUBg9NxGUJ1wIKl+?=
 =?us-ascii?Q?Dd9T2bT/X9Xil3ueof7Tb0GnXUJH2R5TU5BPV6HfmOCqxZFdzrYYy+1cLiSL?=
 =?us-ascii?Q?DCuxy003VuZsE1f5ghEw0weFEflHelLWEC7e+PhyTBwT7JY8hvXr3DkTYtmL?=
 =?us-ascii?Q?qm6+3A8byktI950kWub80F6O/aSImgYD+3AtLcc+U2/Jp2hIvgrrpSVddX+s?=
 =?us-ascii?Q?C24MXkQn4+dIoySz9GUaAy+t2EvjdzQ5nq0ykxHomW+FutkvKypL+FkvNq3R?=
 =?us-ascii?Q?oTCIAqQcctP43V2AgdNDrkkJQlJMyeY+2aVxdBamT5mpW/5x638XZqkWrk++?=
 =?us-ascii?Q?V4TsYtOyXsGrqxlVMb4+SmHxZ4ArxPBxyB2HCxE4ceBSVWRcbJPJRkGfwD17?=
 =?us-ascii?Q?h53M3YujVGomN+J4q4JidtXw6KEI32puJnBNFZRf1vWROoJKb09iPQDSjLWq?=
 =?us-ascii?Q?JBoBbMxWnAuyP+nLrwpEfWGUqq8laCb9UV1ZEdTKit3M19EGLfeGLdZwoS69?=
 =?us-ascii?Q?ltouATuAHd+tZqPUaCMTpG0clpGXNBahIq7Q7xDfGj5jtLBaIet7C6Y1bsGx?=
 =?us-ascii?Q?9NNOqFZrl+JAO+vIfe6SQFkEbdSzDo1+ZTx9NADgDrm2hZK3gNjWbNUIgxS8?=
 =?us-ascii?Q?zFE9VOoF50/uVqZ7ZpC86uwWoxHxs96X2sANXZg7N0VEcKAci8YoSl3wZlLA?=
 =?us-ascii?Q?83eHvzpt/EtfgV5BgezmtB+fCKQ6Hp3xUiWOz61Wn8aXLXxigoHeNZN9mgSq?=
 =?us-ascii?Q?CTKzkQsYEml7KnaNrTmgYx0/XIjt3NFmd8jt2zUKozUFbwjcB78U3yEUpPj5?=
 =?us-ascii?Q?odwxxRyR2PcVHngvPQ1Za0MxAnLuNWkxR8+2c+U0YGGX/Plc67rAcS8KLol3?=
 =?us-ascii?Q?nddjEYzXenxtRvHQU0sHd187pNQlSFYewjeENiMvufpvCPFerJi3ndWwsNdQ?=
 =?us-ascii?Q?781ME87MtBY6OMtWTFF7j5dcP4xJA7SazPJ9eog3PUc+Fi/72iex+zUdoHTD?=
 =?us-ascii?Q?UZXLpTjKu7ZXyATOCyRovz8KMvwm79iqaLI7y74owJpfOEiatrExK+fFbmmH?=
 =?us-ascii?Q?Gjvl1YjK5uFF1hpeVShPel4nbiWrrSAL8yYXUt2y9gz8Ok3Rlk1+Irq9p1Sl?=
 =?us-ascii?Q?pkJ3r9J/8uCqFBPuFI8wL8EFqyl6qnQEvUbmRe2p9+8/DBOcy0cguydtsXyu?=
 =?us-ascii?Q?u3FQEZqivlUZzcQvVeG0VITTW7uU2wFYNsH9acL+2w7gPJVwdr8eipQ5htXG?=
 =?us-ascii?Q?wbqAwXZ7u/ikQPohbSzsM9iBWIqeaJMmKH0MHAyBVAZIT/tswKUZYJN8nYFe?=
 =?us-ascii?Q?Xy2neAQNYXIiV3fzui0d0QY0FB6rHMFuUUXUiuw9hmAjGbNuanM7+KJpkiyM?=
 =?us-ascii?Q?ydETYFeTYtLn7jB463JSb6gfMiYlQALblqPytwmeklMsg3UrhljQ1YWVs6F+?=
 =?us-ascii?Q?TDC8qIkS+3ao8NhUEbqioZqxL53tDzc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e75ab941-8cbc-4bac-8423-08df4c193084
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 23:58:38.2574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ptv8+S2lkqL7+IZ04eMOACPpitZLsyK2x7yFD90THTlTcGbrePy3zKHRPb6ysi9CY+RYjH0y3c0gaWmaz2+dB5xcYkC+SZj37qAgwLV+3LlYbN90OrCog23Yif/uV0rh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9643

Current DAPM widget is using "list" to connecting to "paths".

It is unclear and confusable naming. Let's rename it as
"path_list" and "path_list_head".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/staging/greybus/audio_helper.c | 2 +-
 include/sound/soc-dapm.h               | 2 +-
 include/sound/soc.h                    | 2 +-
 sound/soc/soc-core.c                   | 2 +-
 sound/soc/soc-dapm.c                   | 8 ++++----
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index 0de46577090c0..e7a6eefb08735 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -83,7 +83,7 @@ static void gbaudio_dapm_free_path(struct snd_soc_dapm_path *path)
 	list_del(&path->list_node[SND_SOC_DAPM_DIR_IN]);
 	list_del(&path->list_node[SND_SOC_DAPM_DIR_OUT]);
 	list_del(&path->list_kcontrol);
-	list_del(&path->list);
+	list_del(&path->path_list);
 	kfree(path);
 }
 
diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index ca456e3ac9e56..1f5bb3a92fe08 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -510,7 +510,7 @@ struct snd_soc_dapm_path {
 
 	struct list_head list_node[2];
 	struct list_head list_kcontrol;
-	struct list_head list;
+	struct list_head path_list;
 };
 
 /* dapm widget */
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 13ad3d4f81e53..fe9712a560c15 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1040,9 +1040,9 @@ struct snd_soc_card {
 	/* lists of probed devices belonging to this card */
 	struct list_head component_list_head;
 	struct list_head widget_list_head;
+	struct list_head path_list_head;
 
 	struct list_head unbind_list;
-	struct list_head paths;
 	struct list_head dapm_list;
 	struct list_head dapm_dirty;
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 16f1e097dd538..fa839b33e247b 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1277,7 +1277,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	dev_set_drvdata(card->dev, card);
 
 	INIT_LIST_HEAD(&card->widget_list_head);
-	INIT_LIST_HEAD(&card->paths);
+	INIT_LIST_HEAD(&card->path_list_head);
 	INIT_LIST_HEAD(&card->dapm_list);
 	INIT_LIST_HEAD(&card->aux_list_head);
 	INIT_LIST_HEAD(&card->component_list_head);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index f2e739ad8f31b..5ccb9e087c6e8 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -652,7 +652,7 @@ static int dapm_add_path(
 	path->node[SND_SOC_DAPM_DIR_OUT] = wsink;
 
 	path->connected = connected;
-	INIT_LIST_HEAD(&path->list);
+	INIT_LIST_HEAD(&path->path_list);
 	INIT_LIST_HEAD(&path->list_kcontrol);
 
 	if (wsource->is_supply || wsink->is_supply)
@@ -691,7 +691,7 @@ static int dapm_add_path(
 		}
 	}
 
-	list_add(&path->list, &dapm->card->paths);
+	list_add(&path->path_list, &dapm->card->path_list_head);
 
 	dapm_for_each_direction(dir)
 		list_add(&path->list_node[dir], &path->node[dir]->edges[dir]);
@@ -2857,7 +2857,7 @@ static void dapm_free_path(struct snd_soc_dapm_path *path)
 	list_del(&path->list_node[SND_SOC_DAPM_DIR_IN]);
 	list_del(&path->list_node[SND_SOC_DAPM_DIR_OUT]);
 	list_del(&path->list_kcontrol);
-	list_del(&path->list);
+	list_del(&path->path_list);
 	kfree(path);
 }
 
@@ -3255,7 +3255,7 @@ static int snd_soc_dapm_del_route(struct snd_soc_dapm_context *dapm,
 	}
 
 	path = NULL;
-	list_for_each_entry(p, &dapm->card->paths, list) {
+	list_for_each_entry(p, &dapm->card->path_list_head, path_list) {
 		if (strcmp(p->source->name, source) != 0)
 			continue;
 		if (strcmp(p->sink->name, sink) != 0)
-- 
2.53.0

