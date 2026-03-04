Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D21837F758
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605376; cv=fail; b=hKvyqNdU2L8/UXfiWK1o8lX/B8IyzW41YiIcZSomQrMXQ4FEyNlWTKukq6FXi1bP813YzOyjutWT6sGBULpnF/rQQCVvG/Q44vDV1I82FsHtPjub6Mzp6NnCvMRg7qJMYjkIQ+5JIrv57tnZ3KSOIrOAj2/Ych3Alb+Yqlxs5iU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605376; c=relaxed/simple;
	bh=QFml8fHQNahuy6YrLUD6v3kWMDjQZoCTOrvyNLIXKaI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=A4OZki1x5Q/H0xW1aqa8muxgUNbSvilvUfBIKq9VkjIAbj+k2dVnmQnGgjuO/XX7CDu4xIgI6bP/sizsVWmK3ES0wtg53QBI3LaefoMzn1WOpYxbmZlWQqZIiNswfERwCyVQyV7hHzrdkIch0AtaWFTCExxvkof7Z0yYvs3tKeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IORSTA+R; arc=fail smtp.client-ip=52.101.228.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IORSTA+R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZdnl+OLKAhU8STcAWnNvh5WN+5W6BTrXdTVdnp/hV/NbCpste31axxnU2gwJdkYvWUdTbL38iJj6Pofc5kDqVyVhSTqc8eHGTBhnZ/25jJWYiyjQsU5SGbAszIMot2+AL1oGZio1ybofeiQFmbRTfgdOerzdLMcZEv1/t5JKRGtDfBe2JDaWMkSOoMhlmo3zfXFAoqWkEyzz3mjG4nP5wvBrMZYZ8iH3vv0BDAM5nGtziXqnZeUljJC9zbRvTTgtcRykrnGd9gTExFyBPuYu/6VHi/s4gxFrw2Ik5lguAgALp83fd8+9mri3+s3SSov0J8JA82RkAtVAuGhbIIKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mf+mciFQeb+aZK2GRdc3fY4cD0obBgqM+Y2DkAFEsv0=;
 b=OhSDVy0CU+klMwL2+JB4fLZDkXsr5qetIEf4KndenC08aLbkMXgONELNwhYi1m8yASmgZb9isW+ZsZeSWHaU8Dj81pD8BoNHkGFABEfT0ZHYxf+WHNr/XM3l3k4puMRiPVePba5XQLy0q8OltOmjMD3AissUp31Fm8G/D8fLK0p4GoFJMkJ7Z1XOH+ZHBhc7uNA2lyRjtaLjTSqC7hx+3dJCujgefJxvrGlX4+S7BakwO38UHUE425PxhNg+PrmVtDOgi3n/VZvigHlwBWh8JAMR/L9JarIenCRu34bnF6dtZ5C28maxuKMbDsT4WGm/b8lIc1aBUDio26iOexaH+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mf+mciFQeb+aZK2GRdc3fY4cD0obBgqM+Y2DkAFEsv0=;
 b=IORSTA+Rgdl1oiU6seiN/1SgvXA/Mnox8ngyNHtIAzr2pJ+XegWq5x9GhIt3JLQnBQeYcs4IZ9iDz72LEXK4dSPfKzGGpv6N5hFlFLTg2jUXSGShh+v7rqHNnXHpkpvv3ZRHnJkv9lwp/n03lf7iFpu3aJGQmOVCWazou4isu9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS3PR01MB9755.jpnprd01.prod.outlook.com (2603:1096:604:1ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 06:22:53 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:22:53 +0000
Message-ID: <87o6l4p0zn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/29] ASoC: au1x: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:22:53 +0000
X-ClientProxiedBy: OSTP286CA0046.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:217::17) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS3PR01MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: eb9bb377-1c89-474b-9fe4-08de79b677e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	7JE9NtSnP9sInPusztS8wc/sis0UsZ+DNTuaMLz47ew2D/84gBK0xiXrEXDt7YxzqkZDDJGK6nUGCarlW1RqV1hbjTHWG8mjrrewcwog5znjaJAlfTDAhcpssujqgZ1EP4WKHOus9jVHF46UFBoHVsAiZIh42gpSIWHFXcLpLawZhK6n9X7QUye09LS8KMxDfIwBvncWkVju6HJmnOD+sIRYTe5e1s5cspEFbS7DjJ+7byNVSZjg96YIHMz3lbwTRsv+kGxKs59Ixx3zc+SBP0OgOEZ1CnniWsfZvncqN5k/j6Vd2lxiTrXffPXrTollxGQn+jBoc13nK12XwtZ5NrARhPWDYYmUrXKx5OFMNnH4tPoAL0uvSiJdXO6k4OIlxCRvX5B/sLNJ3HwkrVpLNvudGOHlPGlXDYPAsxnmLqCEqdAEn+9Hjplvhqn0epkDcQzCY/w5oIfDrBS8hsl1VZVXrni0DeZogCGcTu5iy28U4fCwIPOY2I4zvP+bkQgrKqEiuQQCPXnN4IALsKtUJhBWs3WYx1hCDwlRBIO2ZnmJ/Fv1GKfpFG4wC10PPw94E+XVMvsstjedPpntDuQT4vS91SnBiOmAOXCGL3Bb8NXayzh+MovbnYtE3KQLnAsIT3dBKAfATlcbVopK2vqQao/L/fK3WKsGnvmZ+qGb0alI7/DbGiT7VG/GuFA/8QbEuzS3UZek4Uqh2fq/1nuQuKMnz+xQwAcm5hT8RcEJqTUxeVYp5Cj/PnUkkhxUHm1kyKbNEjaFN9hzBdcVE/vRPJsMw6WptjLWCh9wErI501s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GfrX8xEzjyfvyI4EvKIcb/v1oFn8Ac2ZbPb3Bkv+NiMl/LoA0nkP2eSfdMK1?=
 =?us-ascii?Q?4xlOdVeUeaXpjs5PEbkGW6K5quDJgQ3v+UZcVSjn5skPtgUqOAXviIs8/nft?=
 =?us-ascii?Q?CimiRxPfNc7nyrGN5dttNmTp1JrpJVdcKuVSREpe4F2lFn0YtN3eVKfr1HFo?=
 =?us-ascii?Q?C86mWJbU2QQT9uLetqAVyee4eixS04c2cWzfH7p0n1yqAyx+U18xlRykU2zU?=
 =?us-ascii?Q?hIoS3uTHoeKgGWAeVQpUyL6KlUNJPda0WcEQnKXFJGI7VmVKFK1DH03g286F?=
 =?us-ascii?Q?uKAsFTHqaHfT5I0ByLCjtvQOHauDGiBv9CraeZ4siHbT4jQACyA8l1DtIi0E?=
 =?us-ascii?Q?glRmfuQauiC1mz3OfPQGNtVOQgsPW6GMjv2XaRxDeR8UlUCmWkb2Dxkavykt?=
 =?us-ascii?Q?98BNCBOZiPGlPxJniNWQJuDm08/P8RZSuDjNmFYNdG5F2/EyMXHJnAoYgVVz?=
 =?us-ascii?Q?y4QoeuB/sODnKk92RNdCbvAEGNUMmvHLuhf+uBCeznmXEX98m66VFx72EdAQ?=
 =?us-ascii?Q?bgyVzv7zCPIszsaBntfYTIumuz8y8BALLRSFn7vHTax5ss4X2xA8+Lgy/17H?=
 =?us-ascii?Q?ZK2bcYyJ3RG3xDeS8mH9lEiEflpKTe87FGTqt+aIau/MgRZV4eBiCIERcmo8?=
 =?us-ascii?Q?ccS0xQZU00IPOzV9dGo66FWRKwPuhXQEf9OAlgDnbwdRD+0miUGF3YXACaP6?=
 =?us-ascii?Q?p5igVCLvBkBifi7wBp/mXfmS9mGFPwawxrrlnlsFJstcul+8vTIK3NnqNIT/?=
 =?us-ascii?Q?IWFT3T5IUYmpFkwIM9OJV1B/sstkqoNxTeUkvjtMMo1s3Mx8ZwY4hgMrAd1i?=
 =?us-ascii?Q?k1OkADbRP1N2kbaIUojflN4ztt4Wja9ka5LVULtihVoZAUMbA0GchLuU46pc?=
 =?us-ascii?Q?T7iXexZpSmCAGbtbE7Ud5UqxvNLJYPkASWiPdrbbx0dOgilSdpwPwJAfOgpH?=
 =?us-ascii?Q?taXOus2A398HS9mV1DsKqWrUli1QVkFQlQynH8+Rpu/SR8zPkuBbjxmlAesh?=
 =?us-ascii?Q?BUGpm75pteThXRzSyfya3yIs12ba1RjOZcY0WgY+HyNH2PP1mDzSbGP0cpob?=
 =?us-ascii?Q?9thq5+pZFb3yNdlZKbjZkWnd95H9pr4FDuFH3lmGwngi4tw6SKotJa4CEfcn?=
 =?us-ascii?Q?w7awo8dIKSGtOQdt47LCRJLv73T0KkbfCAxdQ7XlfLG1PM+ktOu7lReo3zjl?=
 =?us-ascii?Q?UpYrZuDJrZnhBmjqfksVKbUKEBw4vyJLkMVwwq6u7wBeQq6/4/lMlFLExBnZ?=
 =?us-ascii?Q?HY2S6SFLLyTRUNifAvFJv8Q7J3ZqRiz5x0suRG0bFLKw04MezEf+euS1OVtE?=
 =?us-ascii?Q?ISup+/93BsHaMSi3dZFXHp1JOUN8l3pHWcFj4WiD+stl6Ji51oRjOC2wsSJT?=
 =?us-ascii?Q?zP6S3EorPwT7iuvF+h8AhwUj3+3XPQgt5wkWPscfRQRJZAiODEZ0uFohJ6Ac?=
 =?us-ascii?Q?3u7WYEqA1/BYrNhmAgADVnT3SHC6ctALRI7uwPBjr0tlWAjF8sFlN4S71piI?=
 =?us-ascii?Q?o0b8aeK0iqgp6qjpHBiaoDwLpC4poI79+D9tMesiC957ij03j1C94xFr/a+h?=
 =?us-ascii?Q?HeMjE24bdbF97uX6mYLpgSlvP4XwWjmms8o6JcjzP0WYVhxA3RDK4wwJuQIi?=
 =?us-ascii?Q?zGWt0MFK3q0BWID97wi8yrIV6Ecr1l1T8Ua/835IowXSvmeXFTGEYX/0RokR?=
 =?us-ascii?Q?8R+O8G56SiIEAMnCQU5hh2cwpgBczTrQaFgwh2xNB520UPzZn1LTFA8WZP0F?=
 =?us-ascii?Q?hRDgirgGyflmgpYamDvTjeV3D5fOWWcUeQ0xF9O295+B+BZH3yPu?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9bb377-1c89-474b-9fe4-08de79b677e8
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:22:53.6857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjPo58C4dO0EYHU2n+4mNLcYTa+aAXlPT+rmIJrNSXOc684sW4IB0IjUiUKMnE3hv+0JGxE5YpWPPmh7G6QyhmYZku9sla2IiZSkLlyXDXF7ZKuEgDdSvp+p+Z8rR2eC
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
 sound/soc/au1x/dbdma2.c | 2 +-
 sound/soc/au1x/dma.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/au1x/dbdma2.c b/sound/soc/au1x/dbdma2.c
index 3392693faeb93..3d10d64604727 100644
--- a/sound/soc/au1x/dbdma2.c
+++ b/sound/soc/au1x/dbdma2.c
@@ -319,7 +319,7 @@ static const struct snd_soc_component_driver au1xpsc_soc_component = {
 	.prepare	= au1xpsc_pcm_prepare,
 	.trigger	= au1xpsc_pcm_trigger,
 	.pointer	= au1xpsc_pcm_pointer,
-	.pcm_construct	= au1xpsc_pcm_new,
+	.pcm_new	= au1xpsc_pcm_new,
 };
 
 static int au1xpsc_pcm_drvprobe(struct platform_device *pdev)
diff --git a/sound/soc/au1x/dma.c b/sound/soc/au1x/dma.c
index 8d91a0e0f112d..026d9f36db106 100644
--- a/sound/soc/au1x/dma.c
+++ b/sound/soc/au1x/dma.c
@@ -296,7 +296,7 @@ static const struct snd_soc_component_driver alchemy_pcm_soc_component = {
 	.hw_free	= alchemy_pcm_hw_free,
 	.trigger	= alchemy_pcm_trigger,
 	.pointer	= alchemy_pcm_pointer,
-	.pcm_construct	= alchemy_pcm_new,
+	.pcm_new	= alchemy_pcm_new,
 };
 
 static int alchemy_pcm_drvprobe(struct platform_device *pdev)
-- 
2.43.0

