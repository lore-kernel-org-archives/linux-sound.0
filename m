Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF14337FF61
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605452; cv=fail; b=YA/a/wAqvtYQie5HBr1MR4Wu3cRYAZi3iw3D0O7+LGcKcc+7rKjpleYMESz7IKrHqdw7cpYWL+STkNyCsXpG0qYdaRS65wm+Lc/QdPwrI9PTyqpXQkx1lYO0pTSEGZZ4UB2jc436rQ5+AK9AULbCRy1hBzu5U/YuE7paMxI4pTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605452; c=relaxed/simple;
	bh=AmAjs8Be1ryU2l3ivECWD8qKs/tGH0aMUC20HwkhdSk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iOzW7aFKduhkcByu/ga+q6T0A3tv535DL5+mWkS+AGC/Q6/MpAmXtWH16bMNQ+B9lptwX11YO6GGq5JgNYwr8MTJJrDxOIqLEX2TyAmlnlXEckoMt1EWWUhevBhP7c9St5VSB6JtBbIWYmZzLmTRcBzUWLckeftCbfYlI3yH08g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SgzMA3hB; arc=fail smtp.client-ip=52.101.228.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SgzMA3hB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaMce8ErJWPkyKsnf1ySt5I1eckho8QYQVeIxtZUMADy/77PV6Umga7mPOBFoyh+ZJQ2MwkUuXlONE6zLGmRcS7yoY6LNbbmfydvezebklxyUmvBY6WLvfQa04XC4s7GqCx/McmjAnyzMnSxcsPO1BP1eaDWlb/cyw+GFJh7C0Xvi0XtYEa+B5zcPBmStaBxaIhVpyFIRTzErR++QltphnZmpYQHBJucGDIgSZngyWBCr739V0I/jQWMe6hDvgul4pvz8XZBj0QefCQssMRt2HV+OKVYsCo0p28QIGmGvLN4M7ONpC+vrGj+uJB7amteLThwhHsEOeJEEO/DppNDrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xv4olI6/ql7RK8xVM/SVmGeB50vptqSVaXOJrWId4E=;
 b=qQvHMcUofQUdMue8i6jDRbUF+so0h5cf/ekd27A8iyDjqBjOzuhHEDFYvt5b9HOuHUEhYadm2IEK6l+/L5vTCiL/ip6cN/U6eT6PL1u2McDV3NIFa6REdSZDka8PFrURJEJZqKM6SMQM/yrj/JDEY2Uxf6WRJTOHGxEihxU2w4nfq40QoC0IBcWz9K2mU8xpvbxko5Hahhhps9CS17vPvIfdcgVSlXpYmeG/fbntOxSy3iVPv+y5JbLY8t6r6O7JGuqWia9UcqqbbIzKeXAd4bZwT7LsL32VB2OMD1hdBWD93NBOqStwcN8NfmWB93pYrLcwdQw54iVcNdgIxhrjNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xv4olI6/ql7RK8xVM/SVmGeB50vptqSVaXOJrWId4E=;
 b=SgzMA3hBRpZ4uNLeR90Df132z833M8c5dkuSVgKMIsfZI/7sZViVAqVPhLfNnGYkZAW6zBhXaKophySFk73mBpeDgbsjt7UhOiAiQ6z0wb87UuflIq8eFGE+0co6X3hzY9eonP8dZGrFMmd8nZws154jF3mp8phuMcSQiYgBQAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB17519.jpnprd01.prod.outlook.com (2603:1096:604:44b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 06:24:10 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:24:10 +0000
Message-ID: <87seagnmd1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 27/29] ASoC: xilinx: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:24:10 +0000
X-ClientProxiedBy: TYCP286CA0294.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::6) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB17519:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d9ba40-9d35-4f54-9ba4-08de79b6a5bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	S0N+dlbWKykqZDriBAdTKExH1z2ZyDhdNy5njRstPvpD0CN/y/KVBv6AFVl4/scz1rgZd7lmCnaDvzfC1Cvwih49lbs0Gp0qTNZnBAZI7VZwzitrtUX6kPOyRpRYr8jiVUrSb9SA8YAcoKyS7p8QZJgmr3qJkERYrgiBdtGlQgOwiVwN0O7GwZOxmPly+sS4r7y2AMt+S1KTsYXudCri+1E7yb3eEGrZx8qmVvxHcA33VLZRaaHtl1yQZyBl32ZsQiFqlyP3sgfKshD93WRy7DyTXKvsdZMiBufcucTdhtDIfq5tRytYUDnqBbljVjsJVkwcLQOxM55J8+1xFaR8TkirbTHcZgAxi0mENdMCdnPMEoZdxwfT0r5z3BSvk2NKPpaATGkqxF1hJoGVIczplrNihGs6CWQfST7Fa906tZiF1b+S/6JAeWfRUjSCK7UASTwOSpllJZaqAhyBXHisv9zrJN5xr1hBkucj5J3skXGhFyXliJPlrAAj8VaWvfzPq71ugfoOvNrqIPW4OibLDWMHKkT0psxEjcup6gNiVA92EX3RYZP6rL33GpYOwE6OEy5Heurz6iNigAUP+V4cBn9Xhy7bV2n0ZUiQvd8/sb4WnCMip0YAcGSeMTepmGdyB1+7BdgxCMzdXOT1gQosk1+QCfSxXLmUeN7oGq7PXtONRYC+rnpIbvp36jIC1EjDc9VKVX0HptREwFeTmd4OlqAIs+Eg5fgw+MUjJ+x9vaC9VK8idBwUGiBIuzqP6BTzVpTfWVrjvDTnm56yxPJE7xSCKVAb7epUrOzqSkaF5Qw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nfw5b8kH8KRogyavBfbYLQmyCdNaremWFLmK4/MhXJWK3GHzX71pWOT7f06j?=
 =?us-ascii?Q?kkUyvowX3skkUsUmXEGqKpvJdXsrsPbOR2a0edE3Qr00PaS9dfg3F4AmIe7u?=
 =?us-ascii?Q?Zlk4WgrmhjbiaOJ/xy4iYfXq0ZlFq9qgJ/z8OuXZTVGc1FTXssncoZllZUH0?=
 =?us-ascii?Q?VtE+NoA/527ZOxUydi9oteRAIOV+il4BJEqGdK3DK9PeP5Tu3NIaZU5mjMiN?=
 =?us-ascii?Q?3ZmKALpmrL+ax4gc0JcveaahRKTz9xwWFQwz5oeDEOK0uiZWXinTfi/orcC2?=
 =?us-ascii?Q?murdkfjTyA8FBjlv8j1eaM75DiHfzent+UmANYfaTr56XPSOk7jGMgsbgsqc?=
 =?us-ascii?Q?JLAwcUKBhZgJWgXg03lJOOVF1epeWjohtvhGG1eYPb7XaNNz7O9Yr7tynk/o?=
 =?us-ascii?Q?JsbI/r40DrU1fpnZ7IDWb1fq1cVBCR9oGEkadVGe72//jUWXxa2BicTAptv1?=
 =?us-ascii?Q?DymjisErMZnk3otgYSDSp28rEJfehN7cCv0VGPmHCvu8jcvJTvIRrvXWUZDH?=
 =?us-ascii?Q?Lm9td3FPqSFY0BY/DwIyZRz5ueMML/QMgX/vJUjMjKQBm524TRBL3Z/ECfSg?=
 =?us-ascii?Q?WKydIABkItGfZVCT42zDRaqO7qEJ+U/uVzupd0G4Qx4CJuHXWbKQv/evJY+m?=
 =?us-ascii?Q?mFRueq5r5H+l8AXZNifiichXxAMb3x8bqKT23qj0XFKPF88eTUmR4K95eGAw?=
 =?us-ascii?Q?VniyMYvxXcErNSlpsS1lSbMAxwiDGJsfWvNvTPPjD6C1tYpHvY68q+ji1FRz?=
 =?us-ascii?Q?3RQIJrz+7nDDU8EVKJ2ze/VSNikvqiQBeIoCQH6/bNwZRkllJDtqjuWgLo4n?=
 =?us-ascii?Q?45zy0el8AuwrjWz2Oo4/FOZ2nlxxmMKIqJumR59/jqRPjZdNinR8DvIMyRZB?=
 =?us-ascii?Q?MnQWs0rggsqcLO4bzD+Y0JZTfYA5cCk7uua1TxUahNVKNi/d4srlcDdyp0k6?=
 =?us-ascii?Q?/sE/47Q7c2KBv4xf/Y1zVnlzrmn2oyxken1DHqwPw1oYOM8Iot0C8GRVI4fQ?=
 =?us-ascii?Q?yURr+2xXpp+3zn92ecd31ad/ByqTFDzjPVvongAkKzdPxNEsAbzdrfNtQSRZ?=
 =?us-ascii?Q?MdyAzEYnBGyCeB45hXx+ApmrlcKCKUVSrTy+gYcstBsFjalKTXwb9uIwit+v?=
 =?us-ascii?Q?BZQRWNXSjqGegRk7o71KxGdzKXWL3pjimY+l6f4BnWk2CmR9BPZ8ZlNX0OAy?=
 =?us-ascii?Q?8RHeiOKT9RuvwpqffrNgkLeWd/6lacs7BowQQvg9XfFhqjOFdzU4JGhHmGRU?=
 =?us-ascii?Q?uSoVoEVHs/ueiYnBcyhLV2reWFXTLuczNTkdSGgz4Aar2XsPpExW4QXg5dmz?=
 =?us-ascii?Q?PF4CbKPw9wbchZmDpyZ5V17PqDr7JD+eUpqYNRKuUaljRxjkPRLCcBDspAOD?=
 =?us-ascii?Q?EHilivIy0fmWf033fXiaDYrotHT8vQyB//pYwzeqnFeZvtuXTfRxsIvQKKWU?=
 =?us-ascii?Q?P8GLXjMqwUaU6y90FKaT8PLL/K7Qgv2dDeEN52NmvA3bdVqRNUlcWnRzlfln?=
 =?us-ascii?Q?5hMABnFKmX63tjPgQ2dtvFwKElTniWGhvDGpd5czMlc1TdnPXAZc23VKwfH/?=
 =?us-ascii?Q?vSvQOwg5SaapD9M5ou6wfVTBvCiEDC7WbCIryTMfUQCiwHHIeF4tmXmhXcm3?=
 =?us-ascii?Q?Rfy7AYBaUl9d6fZDYo9vwGQon1P+tuhmawi2P+fqBmn6GWPM0U7C24uFioNR?=
 =?us-ascii?Q?HnTMamS5FGymhYCjHp5GYb/TdGrfBYB0Ux5Wij6mEaiLFXj+/0pqZQ6zScqL?=
 =?us-ascii?Q?BNsolgOHZStBubKHDhRkdDF2NZ/5J4bgurZU9gwcyer+Yz4wulae?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d9ba40-9d35-4f54-9ba4-08de79b6a5bf
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:24:10.5931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsqSfzov3tvy53Bs+hvWytN0LN1vrWJ5RWrlRkHXhLlbCpfrPn7iqxtMC0cuQ0sMgLn1Vdkou/hLU75u3nW844DKp5nXJC25TphKfRBu9WyrUx4VRA1P3kYr+15Jf6x1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17519

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 04a4eae1bc92b..8f7a76758535b 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -582,7 +582,7 @@ static const struct snd_soc_component_driver xlnx_asoc_component = {
 	.hw_params		= xlnx_formatter_pcm_hw_params,
 	.trigger		= xlnx_formatter_pcm_trigger,
 	.pointer		= xlnx_formatter_pcm_pointer,
-	.pcm_construct		= xlnx_formatter_pcm_new,
+	.pcm_new		= xlnx_formatter_pcm_new,
 };
 
 static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
-- 
2.43.0

