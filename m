Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010048.outbound.protection.outlook.com [52.101.229.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DDC37F8C8
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605392; cv=fail; b=QZS/8Mxs6hAce76oAbK8nBqz58J+72obJZxVWP+aPgBhVKVbL9jrVvl8SaUntgDksdRTn4jV3vsETf1ZrtAnoC/abuxCtVQ8QsI62+Zm18t3l6oi9jfD8TOD5xmTc9CtWszSLjTWxi3je2p3r0Ozu5eceuGUyiCe6c9CLDR0MTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605392; c=relaxed/simple;
	bh=soQW8Y6gnz7kn2vBGtYFtGXjXVDVFOaaAPsoWM7H7wc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NC59gOwoUWfUEXLs0AgyYip8X/qbVldGvKEY/3eBwRqKKoxIFbhHCnf2Skrw4IFZnNg1NDAOnsv86UZyGQq6pRgtDGXdMo4ossJkxXute7TCUcZ1mDVqxxd1nyhd5YVTgT+pugwcVwAqsML6u+O8308U23EiFb4iwqVY2OwX9gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OXtMCAfo; arc=fail smtp.client-ip=52.101.229.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OXtMCAfo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTH0triQ8MohR6yAMLsTHw+ksF/6nOL+WosgTWv78ktjEwMxWcf9Q3Uxxmhb+Djh+9zSygylyV1c0BdMLmKvrxt3/0hX0MejfeeStQsSiEe3OzA6rEJ0dSuCa8FMlqMIRD9PWzSsWS6f+TC5ytPMIC87eO8Ep9rdR7YdlPBxrqODyxF7xe0oU5li1zNq99TlFWRAS+GLIjkwgEf15zfqOtuJ8Z+JuW6Z0LoksuWf27PwIBiijbJIzmfPQhOb+fuJ25u1XRDf8VTu2NBV16u+DM0GNGj1OIMVAJYP5xLnJGOBlrhrqmCn4yiCvBAVN5b0XfgCw1yINGWsDikL5UNyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+B5zVxd4COYsOsERQLMpTPh9/rd0crvJ4onYfs+vKY=;
 b=dn/lePD0YeFg/WEuz7mat6WLVKvaGJBMAOsN4sO1LJNb2CdwKOJaIZYX8ZvQvMuP0D5Qv1Pho1Rco6r/rxPU++AmKU0J0EKBLXnKnm7O/ThsD9QuYN/MXrgEZQsDXn8ZXF2Qv+bNexPzl0JYxClI7TL26pP0xXdmOS6eAaV6++i93EmBbF2cizcQMfDuh2E4A3ALKiw2d1Ei5VpPkkZ5fRNl1fNuIhy8SS5YyWccu6R6jqTGja609uItYpjPUP6ZxB2OHinvKOB3CdZLCa7NUekIxY4Uu7D4WZDxSzfz12DeFnxX71xirjPSR/wLs94T9BxPhUH0MRYE/tQvrHOKNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+B5zVxd4COYsOsERQLMpTPh9/rd0crvJ4onYfs+vKY=;
 b=OXtMCAfo+80tnqRBJFHJf/TM5MGgqVgLx3bryllJzkF3Py+OdNmushT2+2wwcR1Os1rwMf5XByEeKZq5f+pYllJ3VSEYsNyxKjLMaRHE/5xA+qn1TX7yaqYtn7zo2umjlyyRJGjyfwyYwFfvz2pACkXe9QRrJ/wu+qwBE8wIY48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:23:08 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:23:08 +0000
Message-ID: <87ikbcp0z8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/29] ASoC: dwc: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:23:08 +0000
X-ClientProxiedBy: OSAPR01CA0278.jpnprd01.prod.outlook.com
 (2603:1096:604:2b::26) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b30fb34-08af-4929-b5ef-08de79b680d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	q7DbnyQw50zYEBAi/kjJntYDQl+VI2ZCMSDa6EGZgs5b6Wue4eiyy/+6GHqZ0RtgkyMtYo1h/KXS7rwQBbgg36dyfRltcW49+w+c5+Ox+Jo+p/1hv2f/t2AD3nYtgLh3cH1cCAQkZS8CsErphHeQv7v9diEsIFZrh1cqxKgHrBx8Y3ldGEdCI/haSouSaeyfzFh2Hk5IydOVVRMe5NjBqJ1wtfUJfyYDmSBal3m7Fo+EzNoeIpXyg7Bx+Yu9O+SzyNyg6NaGKShYgNYY4P1fzb+Z/IgglDuuC5FqdVmzkhJgKwikWGWwuMNacr1WiBg9P531dQMSQCssHBpFKDc15FYPAGkwMIIHqfE1p64GjfAHEWO4dctYE5vjIDZayymkbswPLUWbY++2ZLsPfqGN7Lkht6Z+irQCthef6dFi2pqsBxvIJ/qhW1JgR/+62zbnDMGDicIEdKnSvNyHyMN5bQXSKg9nO/1xoOkoFbciTk1Yw2GiP/MbZ9ZhG+l3byCk+nAWQDSEIEaUBWQSfHdaLIw9YLo8l26wiuFp6Opt4ZjHqkn7uN1AWiBCm8/hCkrBP1gPksxQZf9W+xZBhkZu2FJsdcdBkavXQ0dK3i8FocTEKXTB9+bEngrwmvP0GKDBH8ZsHrup2LbOJXk8nRlBzEybClh9cK/qST2VJEdOikeOtPibj7yyk89PvBA6P5XQ/bTNIfNggn4HxMF38A5/NwarLUwiKRAp1lWB2bNbLesnyV5lILWZxGKrVHaA3eBIHAxE9vbgkgEO16z+Yyxb61okcR4HbLHuPmXCxWRISJY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+1yodQQ8kGxKfH25Db23y4Wj1bfqsUTnlKa+Ipnjds3YxEZe/6ZoXa9e66uk?=
 =?us-ascii?Q?NpeYshetbmv3aG/UChW7tebNPUfCvQJIuesdcips0T4UtGgmduiRNsVTXKYJ?=
 =?us-ascii?Q?r0S+N1TLhOfUFiT4Lyf+FHDHZqzdAz0b9U7PbzpyjD2v2RlojL4ivEjVCl2W?=
 =?us-ascii?Q?y8eo/9pO6iUV4QSumz64PosWFKKQiJslrUdFlDwKCdzWvLQEAzZv+7HMJnJg?=
 =?us-ascii?Q?kgE08Nj/KMlZk5A0Lv0hce/5Q/lEPcfxa6FLVPYUCeU1/TSVjIu5pb5j3D3M?=
 =?us-ascii?Q?Gr1OwP/1QZYjZWvKhuyWb4qugapHS+WtRfLk6GE0lYzjothcILJS7dOiG5Lw?=
 =?us-ascii?Q?4imVIXUnLuXy1rGipSYG3Gciii/GNBH523vhgjRfBErjelJCp/peYTOaWe54?=
 =?us-ascii?Q?+N0H1/PJApTvCQmKlODPnnicVv5NiBIBnV1GdhH8TkQkOBRW6FPXi3LQfd2G?=
 =?us-ascii?Q?8pe/2zxKUu3dxusj9In7CkSSTD+ecweGuy2OBQH1TaIuq/NIjo3Jxr8Ba7Hq?=
 =?us-ascii?Q?mSkFcVNvOFaC/em6pUiJw6VfmcwxRpDwQk4VMY+i2Ut6J35gk8AhAidWhMpA?=
 =?us-ascii?Q?VK/bHSz/JdJ9Bg2z6fl1Sb47JvWSf8Z5aVZcaJmc2MVgnjhbxlE49bPRgQq+?=
 =?us-ascii?Q?dQ9VuuO3hBIF3kAw8nRfWtcWwXlYxxYeMdf4oqkKoWGzitALVWBSBbNtpt2+?=
 =?us-ascii?Q?JY6jXiXY+K+i6wkordOrdz67s7wq8lOeI/QLiol9GDwliqEojIv8DuexF+pi?=
 =?us-ascii?Q?Cp67B4R17dAXEDxEcw0Dm7fWXxGaJ2pC3MZKiaeDRN1GSGM+HPxCa7IAkpPR?=
 =?us-ascii?Q?gqkPeobcdBnKDSaZ7Z4kwWvST8uPVr7UMxSQAvQioKdnYqRQcToGr29gGhev?=
 =?us-ascii?Q?dCdrBce3UiLFEYLdPJ9xMG6jvhVEC1sWUpBXZZbPEA2ctlh7ONDRRpbEPXNu?=
 =?us-ascii?Q?YPcvQf2czhtruFzFKvg24mRvPMTepLbZOjgHnDRolichZPrWmUOHfD4e7YWS?=
 =?us-ascii?Q?LYMRR1T1fWFySTRiTR1AIoZT5cYrN2ehyYY87u1EBtRQPPRXwy4LIHVUIlCf?=
 =?us-ascii?Q?/FFUitHaJ4AzILsEyUvzmp7CdWHIWp0eUL6XMCBU1XIf+txuvH7MuDtU4JAb?=
 =?us-ascii?Q?A83a/xvGLdi5ruTRIRpmmlljrgtd2ZHGD0q8EeTu7ilVMtVa2rHt5410tmM9?=
 =?us-ascii?Q?aw+ZvPsrf5gxhFs8ZmggdteCKDR7TQ+d9A3wBQOhwewJZcOObLzc4/Uu85pr?=
 =?us-ascii?Q?9P0h81k79V1OpMby0TJ13dI2putDl2YohgHlEm4kPprVtTI4Hu6A6A0tBkKg?=
 =?us-ascii?Q?qTSZNXW75P3OCt3TYmZ8rhI2kkjc7dUpTnSQJNOUY1MtyeMrwkykJOYBH0zA?=
 =?us-ascii?Q?pseD3kDQfHBSg2mr1AfrcXPWLGiacPzLJEquujwg2f9gTpR2sHHgCBCpq90H?=
 =?us-ascii?Q?aAClPxWl+Nj28TrFDFEvC8XWpAaVY0npH4GMkN/RjC2GXxgIM1xenrl0DQ71?=
 =?us-ascii?Q?LLWQJECeuwvKOcNFIE34KF6QoC1XQP4SLAXpVDk75KIwNeGwYCl8REj3A4Fe?=
 =?us-ascii?Q?0DpuGMQvz0pkq2L2eSxQM6UTC2GLMakRtAx5Rc1MA7N2s5hn/HnpWhHUxN1h?=
 =?us-ascii?Q?hWqmuJFemjIWDLAYlBaHf1zPjQ/zfpUkwNGK2rzEmyod9RUrI1r8P/08Z0Sq?=
 =?us-ascii?Q?eIadVtOy+EbRks7E7zXcKL1FMhqTZ8BXqEhXXwf5ph8tg3Xb/4pPXcQO1PTo?=
 =?us-ascii?Q?+MngyY0+tJgN2aLl/I2MkMhzRFYRe05Tn3yxiaRFTMYOOqfOLkVV?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b30fb34-08af-4929-b5ef-08de79b680d5
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:23:08.6571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkpSY91opx0QgbbM5GBCCknpCuTce8XbKPAbDYwbi7a2xzfEkwJ1ZS2xbTFk9HZwazA/ogErRFs9hoZCyPV1euzym+GegYtbEpnktcbpyDT1kxReKeKSQhYAfZU56nLt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9755

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/dwc/dwc-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/dwc/dwc-pcm.c b/sound/soc/dwc/dwc-pcm.c
index 15ff39b1a5098..bbc4ea88edc4e 100644
--- a/sound/soc/dwc/dwc-pcm.c
+++ b/sound/soc/dwc/dwc-pcm.c
@@ -253,7 +253,7 @@ static const struct snd_soc_component_driver dw_pcm_component = {
 	.hw_params	= dw_pcm_hw_params,
 	.trigger	= dw_pcm_trigger,
 	.pointer	= dw_pcm_pointer,
-	.pcm_construct	= dw_pcm_new,
+	.pcm_new	= dw_pcm_new,
 };
 
 int dw_pcm_register(struct platform_device *pdev)
-- 
2.43.0

