Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F733264D9
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784598368; cv=fail; b=CT0YNW43WmAGfvQUvxJ6fiPObXho4nL120soS7R4mzKphc2WiL1vWuL5Avs1d42IjVbkGBzddbF+oJvq+RP5oTwaJV5DBMQ4L33s2yI0lvv7F7UujTjsr4XqhIMHrJxCgtAVpEjSt70gnm61RHZcz5ixysUXQ6DdW1ijwCQHIdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784598368; c=relaxed/simple;
	bh=MjO7cXpvyBaCn/8qErZ9QaBNSYDZu7dlov1S60cQEF8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fElbafOnuCtadY/SLhnbDAC+GsIAAk1b5f0YT365rFLiMKAshEs0haxa0Tw66zq1f2OfxRwzjucaTT4Quk9ZVh5c4z+Uwl1GleNKyXx1438ivuWx6EHTRcByqRXLkvne5SSGQVOmEwJAtRAXinLeQwnihUfLy3HXKm0WEEwBI58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IApmsg8o; arc=fail smtp.client-ip=52.101.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IApmsg8o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozBabQX1sL0QO1zQkUjBwlkUto3PdZW06CqZPZfxfYXW/ZHCGztx5KO5T4mo7vOA8azOsraM+lkgPhe3cEd9PtAwT4mxBOt2uNPfZY2KPyK/vDF2AGXt1sCBs5XZQ3er14EV5E/AkdJBZupECBtm5kzed0FsFj9ZfT8KPPNohZKPlQdiCQFM0UhJQ+TGPDgJlg6EcplxOtF+se5rmTK3+gQTtGB6ngwZolPcjz+rQs1HUVMCmXLzZKc/w0osamclFtVlAWJFrm0UX+7kChjpfnrMQt2y4zWvJx2iFgMI5M07+LkKtw64VFffyH6KRrjXOhdw7lrxado5SrZbd7jaqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2f6aP1cj3I32sk93RC6fGFGDhXHEIfeMNmZvXm4Zs4=;
 b=ncetYOH5/WFBuTTmlUT0b0kBVgomytXwYN0bti9hEM5ElFitDC68sOJ3bA/Yrgiqq0DmG+B1u8JNSCpWesFMqnEheBhpg7T8ZkVj5WiQgucAQp2bmEt08LDKWhT+u/R0Nq2BkfdH2kHw3eoda9qsIaKsuIqQTyzVz48MASqhlk8i1Uqe9uDMrd+8hDwcowx62DQBaXiPM4CAVHfd4a2cbtbgROhST8AN4feb21hthoH5C4yQrkXg/SxjfB2QKPre5+b/B5BrNx0dpNNTTr48pcCZPvXGyadmY1nf1Q7x2PV0CS7eXFz14vTUvWjnc4qO70dEMbSBDIR6wEdT3fC+pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2f6aP1cj3I32sk93RC6fGFGDhXHEIfeMNmZvXm4Zs4=;
 b=IApmsg8o7vkrks9R5j9reoM/mnFnXHK9qd+0wj/zRhwYfU/hQ9UeTJ98QmoSPoTzeAS9Lfg1pv3DF2FznEotatzQ1CelzAmVVF/SXTYlQav9I4cjUDtOlQuhqN83rjbGBPWbMaHTI952i3Y3kCMyKdIW1CK0xPWof31IMm/ynZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS3PR01MB7707.jpnprd01.prod.outlook.com (2603:1096:604:17a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 01:46:04 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:46:04 +0000
Message-ID: <87cxwhi083.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: ux500: mop500_ab8500: tidyup mop500_ab8500_remove()
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87fr1di08n.wl-kuninori.morimoto.gx@renesas.com>
References: <87fr1di08n.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:46:04 +0000
X-ClientProxiedBy: TY6PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS3PR01MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: dc8eea8e-6f19-44ec-cfe8-08dee6c9d3a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|52116014|56012099006|11063799006|10067099003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1tagp1AceSKAxbq4JK0VKtyw8YxQrnsfJGCBQpi24BdbcKEA0O5s19yM0IVK0tlXD/SxFhulmg725oWen6iv0isZTmJ8gPkv465Mt2wolkD2448pjoSlv5Kia8FR1YwCshapZQbFL8TcbMBSPGM09cnnq4OapOeFVQsTHhFchzS6bmj3I/+JX5T4MX8f/W9a+ekoKnOjC4QGESJ+dbj1HykGz1KhyLWyPGWPMyQAdGZXoG2G/Il7dQzTNt7m5dc7NgbwZ2nnUTgKRsV8bpqcC+QzfbywKLVOuIk1yNRrTDl98X/SETH1+2hPuee3aLH7lFhAQwZiJLWwmpImIdU7iNLlU0ydT83aQeUhbBLL1ivjJw2gxyjavG78jgMd2mGuOuAggcxxNaENnZhiwZPeuABEkNy+j29ZPkXaHOq3DhFu/m+r9GHF2AkNX2KgNwEVvuVlIK7/GLQxDfjNDZQIDefjsIv5HJ6O9n5thwoKIUF1a8c/CLwQZUBVrEANNzvdLU+b23r7Fw4Ky+BGuC4HZq5xvFKV9oft7YL/PbbOpIbwLF0CJ/M6ueOinvgumuCzS0V+TJj+A9YNWtJV6LxYn0sYjjo1glQ7TdDlIBuzNBWGF8AExeQM7O9G1kwLPZedN1LYk7EFgVdnAFGPO8hY8vIPPwNlJgRR4iafdNTBAirzroC1Bmhl+ra0U5oBdQeqgfBlKdXlBcEsciZ0qCbtMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(52116014)(56012099006)(11063799006)(10067099003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?79WMn2Zt06ZB0uwuQOplSBB5gz1Hw5zdP5g8Yp7s/ESXcCuZ939zwkDxMhLD?=
 =?us-ascii?Q?N45zY9rK0HquAoXsAJ3lIc9xQawGxIObLCQdhpgSi377wo96TcndCYgs6pl2?=
 =?us-ascii?Q?0lDXiV53s1EOQoibhShxKIT/Ai50ua0v3Y0nesozSkRGQ4cxPXngNyIZbaOi?=
 =?us-ascii?Q?iVL4Gyt/ygQaWvJ6G4TuAPLYrMqsU9p7K60cK9nNIcEQhHfKKU3bIE9sf74n?=
 =?us-ascii?Q?mXZG7dDX1KtAAO9bMqZz1Q6RYTDJRFZIAoOnoGkzAa7/COEW918ztKek0pws?=
 =?us-ascii?Q?ySHAjcOs5qgzSSLq+uJQ+37sWNoqj2E2UX7/haQfXPX8VSFK033dii8/3679?=
 =?us-ascii?Q?rJAnHBixEnRVjVn5EH6DekhKYzhDnBu2lCEgxbyHTL93c4D5p0QuyPSWI7o8?=
 =?us-ascii?Q?jy90TTjrlzxZFyI/eyXulnT6c/4vcXDt9XOJ/0UN/lCprO45avWTcIuSsQIz?=
 =?us-ascii?Q?BsalAqAUirzOfsuEMGbxt39MH1/6P0tJyRyRBetcCkGgyBqDZjZ8hgAnxs2g?=
 =?us-ascii?Q?EDBxQY9w20RM48+a91lJfTj9qcjZDoacydq6n0PuyXV9mRP27iCtzIFTvH53?=
 =?us-ascii?Q?vliHGsfWTsM7Vddv5Wk6xYFQcLp09q7CbqeckKEQLvL5BwKYhn9ovxXQ8CBo?=
 =?us-ascii?Q?A/oyd1+xdHg23MGooHTe2AjRA1Y2D31u1QzSPD2+Hz2ZZ2E8IBxysqbjY7vE?=
 =?us-ascii?Q?EXuUWiyAZhpSoJIErLKZAiiIWxrbGLNVzOvRGkW+3VCDLkZBX8IA0CfoGB8l?=
 =?us-ascii?Q?r5QfNuRlqhOpSaQ+5ytZGb9TZSDFe4vDwENhdUYrU2UGApi/X9VsJse0ZlAT?=
 =?us-ascii?Q?nAr27i5GY8ZnqXaZz7zneWToqwVaP+lWVjtB8gn9AQXetA5RxiazPoDCLA8m?=
 =?us-ascii?Q?84N8jpuP7ZYD8JUOaXmsD2doIABFJeDR9xBzsWniliJHnbA49kvZJeIkHrNI?=
 =?us-ascii?Q?SaiTL+yMjQWIPY+TuIF6sK2byEjvgWY1y6OvHUl8y6PEWkcZlXNKvv/LM/z8?=
 =?us-ascii?Q?gvvUWvmFW697ZW7l9+XUh+Nr4KkD6riRniI0u+QM3r1D75MawOAg851h9ez9?=
 =?us-ascii?Q?IqZZrFIcMxBVeGb4r2pw6l0cy0c3WuGnqMPer+5xRAJPzELGW+Enbu84hN6t?=
 =?us-ascii?Q?Um1ZIL/c63vy7/P6VrKO5DXrAH1fTrhDXL/Wy8jG8yZC9d24col6gznwaGsd?=
 =?us-ascii?Q?VOjr0SctvjhvBOSuafdP3ixg82nZS+LSzPAoGw5hgsptx8UnXAr2W6KImaVo?=
 =?us-ascii?Q?/o+DjRxqRCMDnwjd5mx5IKElqXES09fycaQJeOCLT+G4WrzMFL+Ca1IByAtO?=
 =?us-ascii?Q?FlqowDAsVEJFHadnP2LRPMRVJKBFJlaNT1Z+9Uk/dkSvyaMpKxreIk9Knsb3?=
 =?us-ascii?Q?+MeHyHj8lBtHkK++y3FUPEjRwwg763T9KfJlTc/pOdCKntzXlcHSCEeS5kRj?=
 =?us-ascii?Q?HWCAV+FmAFyV3tIHoATdsbAJihI21YE+wqeTXEP258xNY4sCsqeh1Eyz7JOB?=
 =?us-ascii?Q?SEksR7sJuTA+RGiGu38+Zp8LlBtLfxIi97wK7/r2dwn63Adu3hghKsgkG7g/?=
 =?us-ascii?Q?ZhjS/UlMTl64Jtr09SxZQRWm9zvfJe6PaFN481t2kuJCKwAWFR4jlxaQcLil?=
 =?us-ascii?Q?4ZUsNRnbdIR852+zw10ZWUvQPX9tx1jV4cfQ17wlrsYCshQqsoRt9U07q82c?=
 =?us-ascii?Q?Bb/fShkwQMnAHmGX4Ph+otSmaP492f/UlY/PNyMt9b/rUy2G2Wsnz5bl9MCh?=
 =?us-ascii?Q?rlM87r0RG7/X/V+j5WlkuvnHwXQwKGOUOwWWu8203Rmr3zBSfEC+?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8eea8e-6f19-44ec-cfe8-08dee6c9d3a9
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:46:04.8527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxDbSOJA0rKTv5vcE96KVyq+QMzKMxg0vfm86LQRbpET+78AsF7ngGIPM+KfPlwTl9Qwt0utgWLHO9C321V0EtDI78tFpm0LxQ6E1m1bhAjntfJSVk9YAXpBjpJzNFqk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7707

It sets drvdata again in remove(), but it want to remove it.

	void mop500_ab8500_remove(...)
	{
		struct mop500_ab8500_drvdata *drvdata = snd_soc_card_get_drvdata(card);
		...
		snd_soc_card_set_drvdata(card, drvdata);
	}				       ^^^^^^^

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ux500/mop500_ab8500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ux500/mop500_ab8500.c b/sound/soc/ux500/mop500_ab8500.c
index 2a459267f0f91..feb683c55d113 100644
--- a/sound/soc/ux500/mop500_ab8500.c
+++ b/sound/soc/ux500/mop500_ab8500.c
@@ -433,5 +433,5 @@ void mop500_ab8500_remove(struct snd_soc_card *card)
 	clk_put(drvdata->clk_ptr_ulpclk);
 	clk_put(drvdata->clk_ptr_intclk);
 
-	snd_soc_card_set_drvdata(card, drvdata);
+	snd_soc_card_set_drvdata(card, NULL);
 }
-- 
2.53.0

