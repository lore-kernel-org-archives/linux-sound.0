Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011012.outbound.protection.outlook.com [52.101.125.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0876D2FE56F
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 01:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398034; cv=fail; b=NPyIReGkINM/UDpLmFAYqSRpi+SyuwXQ4+blI3xcDb8LYVm2ffQgR3OQgj1Zgeca6iWj/kWTqUYJOoMamAZ1yeD0L6JuwZPfvqPNQAAzPSgA1oPB/Fs5NqSoK4wVwyyHZEjQ1z38cjbu5WrNegog1BfL+HWLCdp6R5ZDXv0Soj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398034; c=relaxed/simple;
	bh=0s81oI1ES042MyAcUTCTMg3euEGgYdervi62RdhNg2g=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JzJ5LdkC+OPBlHYob5e8abjB1s0ZDs3xOlr8o8+hRiymOcHX3aCnCaEJjM3bh7rPToRk0IWKdvSh6832mQqVAtZFJhLyXyOO6lCXFszRqCh3DK0ix7++tCCUY4TBzJOlKlFlI3JlBUDouvHnTszDUOdZbwdoN+4BvUzIir06ZDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nkIWeH74; arc=fail smtp.client-ip=52.101.125.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nkIWeH74"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLkyj9P2VancvI+VFAQcMzdvKhS6v5vUaj1gvvHgDBceQRh4m4fU0ApcGU66mkzQBwsSGkiQJVi0MC0JV8RIviB0eYt8A3R1ImsQ4c09KXfuu/yJg4MSDD/2eFH+4TbouWSsNc/IMfQ0oCG1TpZzdTI1wwjEXfMhzKcku0hhVzOw8FTMVZaV84naE6CQLpV1diornCqC4ZsqPxvd2PCG6p9F4xGSUsgoGVcSNqXtvg4mxaSeaAcDG6CcuMveZo8z9fiFTktSoEBXyfWiE39p+rWoHMwJ5uXl8Mu4Z7GVkHDQwkSrSphjFF3Flbi/7cyHOk17T0ysyflghKRZyDuWfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvPufq7Qn1kyvTvSaoB7d3qaxWfR7aAyvv+pxRPOCLg=;
 b=u3dEg6fqmhN/wg4OU3gi7BCqxqKWDrVMDFqQbjMxJnRbenESjDq2NCtPtWao1sz90be3orx5YKlFOGspPvNYU5PaOpxNIJAbhKUHBRlsB6VUKo6mw5l4GOtyENqsVxbq/iSJsn6zbPpzzvsdY0aok0rHlO6o2ws5FX7BR3VMFlDHCPlKMTnSlwgtRquS5rKT2++5+u+Se52tl56U1ER3L6JS3jyzaCOGCCrSl9M/k46akNk8/XgROasOM4UIT0B8p2WJN8GgYk07UHFR5dsCEoLSU/S0fUVlUQJzrJabK9KFN2HESilXW5cwREf9lNBIBx/Q3Mkc82K9ZJTN6EaHxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvPufq7Qn1kyvTvSaoB7d3qaxWfR7aAyvv+pxRPOCLg=;
 b=nkIWeH740fwCd/b4wM5dLzkZCP7sjldFvkSNXSVb6FBk88JNTdN3U/LRemjLI+PQ7Q5wc+zj3O9Nb8/Oz+lWpK1EZ3xPpmm2NGRlB5/upwe9oBmgjatjteJcNIL5ObrY5o3NScT9fBF86ywcM2DDYr+biILKpuldcpB29yrzvdg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY4PR01MB17164.jpnprd01.prod.outlook.com
 (2603:1096:405:367::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:13:51 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:13:51 +0000
Message-ID: <87qzjbyw4x.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/21] ASoC: kirkwood: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:13:50 +0000
X-ClientProxiedBy: TY4PR01CA0070.jpnprd01.prod.outlook.com
 (2603:1096:405:370::18) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY4PR01MB17164:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b68ce1-7919-42fe-15a8-08df09589d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|6133799003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	jwbeFKKOMJtPl4kOA5pN2ugmS+tYWacew9RyoliHsWt1W64v11Ne1fd4+wJdllhoU5Anacc22ObUyfK2Rhih9S3wd2SFxLOgePSB+F6sorliCeAeyLup4V3RrOEykMK8R0QEFNX1sQtdydUxYYN13v3eOHEN6wItY961l+HTY4xsJxnMn+LT5Dfvt0y/n/v2JygRyJHNdQIcSeqIwpK2+7SsgIhUCcdjXnE86QnKGpBMoo5zOE4Yl5ovZBiCwQjuyOkM2kVVV3MI3ICgMxEjnh1Dv/ULhZ9O7O5csURxfJqvUR4DxmxoXneP3H5Zip9/v4vjuOmD9yBsRLeE7ILe0/eSvSzQXDTTPqngwltPQFOapiJcY1UbjtHDeMBcjPmvBUp+FybQkizz4WuyPAjg4CCad0db0TGWcTldcnRSDUlgbLrdmV7lpvzdk/1rJj8Jy3YG4eBxjFnj8AukfamRz7XuBJowWVvhsy5m1HpqTO+1k9P2DhhdzYyLMkHNt8CPt3HPVHDT395bLMXSVIGcGo31SmJOtkTIxOQXQ1SD+8lcy8qzrZZwB5NHtkvNwO3OWl8GzP9GysiyK3ELhREBSEf1+UagE/3ox+1sE70rqmgAR3bUST0GfjuvUmwCEH3Af2eAhuovwOt238VQIK589HrpRyRsScpoDN487Cbtn+y+DRbUkZ5QeDNH3WDjBJ5e1/+MtFOQNqRV7U5dXIRObzoAUfeWb67qZNzDxapaq+g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Do0ChugzvYhQgZMWeRAqO4TJyxUFQjD0MGAvqriLESV4xcOdOG5/UCPc8B6B?=
 =?us-ascii?Q?gDDSz8VRANx4jqzSJAtRXE3sFZQh15r0e6KEEvocqkmHqWC6g9pfHEi6AZtf?=
 =?us-ascii?Q?JzgYgqcxCuQ6pWmo1JbO1X5K5dK3OVDuCaSpC5Fn7FPFfDcllcaK/tclTO+6?=
 =?us-ascii?Q?WWUqwZZTxZFS4zCLsR702U7fi3o0H4lofClW6sK8fHpCCGBrfzBfQbrUbXox?=
 =?us-ascii?Q?yqLX3RZId6sjNJeBmZYstL+U4zmpQG423sOqICsKPfH9B7KjwiDBIjcL658s?=
 =?us-ascii?Q?MinoAXOiLFB8uwY5nGqKocYXdkpjmWl3yMaW/JfszZ5VvGJn8oQbJ6HpFl03?=
 =?us-ascii?Q?PO7VHgjAIIkG2ppj4cswO1aoefWEVIIe+KXA1LKxcW0BjiWYVYcaTtft0Xbi?=
 =?us-ascii?Q?30q0e4Avgt6n0cHtEY5ygzHMk2qpcurNW4hQeAuN62xDn8BXpBkOyE5yCVHd?=
 =?us-ascii?Q?8d+6g9Nih1i5Ts+nmUVpYU6UGSSBCRKOPPkSz3lP/QVqQDovN5+vsXPWRiCV?=
 =?us-ascii?Q?yP1S+qLw1aMTahJKVN4BZ7LVVWtv5g2BCLdDapoSpMO8MZgD16MUurc0s/9h?=
 =?us-ascii?Q?PoTK9J66TqDoOCPhpTzMn5rKgHf1ykwvmilwpnzWLJpga0D3zfm2/LafWojm?=
 =?us-ascii?Q?wIfN30xFgQHBvlIrO/pMzjsTJubv+oPHUFi3soMZqeZWDmc9lLAW/qsOkUq9?=
 =?us-ascii?Q?5ayRDmEglyHfrLeJlmc9rGwZsHBGuhhvxsqJEvnxUMi2LQuRM6wGZHhQA8A5?=
 =?us-ascii?Q?IAsVrbKuRMmjp5IZ/pIHAy4YHxML+ESPKvzGu14Yo1JBZXQXazJEhuLnOl7H?=
 =?us-ascii?Q?BGYPZut5x+iuqpZm0PpNgvQydfEXyOsXGQ4hc6S3MJDi7lNky/bdv2WcVlOM?=
 =?us-ascii?Q?WndXoUPVnKToZ1MTSuYPE3HOWHoqWxH7WANMlv9NLotCEDNjhBecOD+kDBbe?=
 =?us-ascii?Q?rlt7wzhrUPyKng2eogU6USMqzCjcodf98vomt1haO8A1VqBfAj+QHz8Ciimu?=
 =?us-ascii?Q?huXDYkphxeNGp0QhjAzp2aWe7K3JM/+dLGeHPOM4Mzb6PqHrqlnzpgK/yP75?=
 =?us-ascii?Q?uWBHRS4a1YExGX0FBVQhBmECmOQw8KDn1PX7n4H0HJXoRhapStnR91rO7kkM?=
 =?us-ascii?Q?sRRC79qX0dsCpwHbn9JVrplI62sAqasQivnk7MmX52uXXRLANI1WB/PG4Sfp?=
 =?us-ascii?Q?QDIGNGYr6iI72763W8qnFgHqxDZ8+XWxPssjRvjm2dq+JAABOPkvjNYtxDd6?=
 =?us-ascii?Q?oueWN9VmJALIPx998lRD3wx2yas/iZentjFpkZBY8RY2HI5dxCzWISxOErfK?=
 =?us-ascii?Q?N+ylY+dyfoWETR6lr2iIRNRyjGGeQPUsN3KCU8ECDu8QHYafeyFukTYyh+zp?=
 =?us-ascii?Q?DfPsyHZ1/BrmU1ZP3SoIimk5G/nrInfg3iYwxMIDCl4/D9xzHV/fCI3RnqGy?=
 =?us-ascii?Q?jhNbVFgAnpUn/CSdwCFigM+nyRFM1b0FOLb/NG5o5zQXAE12S+/IKn/8SJCK?=
 =?us-ascii?Q?4Jhuwl7Gq9kHnic19JHLsaNllPJ0j08NjMXhcEOyCuEVtPh4FgL4E0cWU1eV?=
 =?us-ascii?Q?sqAx72z4oItO+dwIwLWpcjNRF0K17BwxAax1g5SgGOFuLVs2Eu0ZaR0N0a8P?=
 =?us-ascii?Q?TVZvdXCXXAyKhSkf+Bldqi2j5AGAha2hMqDBaREIjuymif77Pd9gEnbokuV+?=
 =?us-ascii?Q?327G67WlRtL76GgTGaM0dMrx1zeCU4HE/LX9OHzx2ovojaLA+7xFdqqsqyG5?=
 =?us-ascii?Q?zAqhFWAGB7hzUECy5KphlUmbzns8EoR/IHjFbkjHwtG19fsju7Do?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b68ce1-7919-42fe-15a8-08df09589d38
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:13:51.1401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTBEPLBdBbnuxaWIvcklbXcyn7U/grrzVfODdoTMr/Vg5XTScKjQuWvHM6qkXtlltI8m2KAdEcF8JmgQFv7IFoZOyKQSamfVhjmzbbOmpS4VRxl3j26meMdd9iAIK9Kc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17164

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/kirkwood/kirkwood-i2s.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index 99bd066c7309d..739a819d84945 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -544,11 +544,18 @@ static int kirkwood_i2s_init(struct kirkwood_dma_data *priv)
 
 }
 
+static const u64 kirkwood_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops kirkwood_i2s_dai_ops = {
 	.startup	= kirkwood_i2s_startup,
 	.trigger	= kirkwood_i2s_trigger,
 	.hw_params      = kirkwood_i2s_hw_params,
 	.set_fmt        = kirkwood_i2s_set_fmt,
+	.auto_selectable_formats	= &kirkwood_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver kirkwood_i2s_dai[2] = {
-- 
2.53.0

