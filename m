Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C48119066B
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533676; cv=fail; b=tyFAfhtf5Es+/5WgzxcboH9tzIKwex9AoeLNewSbQTgLgs+wo5C2U6BcnRMIoDIrScmx3vXKvhTkoMkGNp9Gn011LpSZo0AyGgOdER/fmnLIgQIGHmYC9n4eiUK3+ufe3fjuNH9moqpG9n4pUfGyBOX6bz1U1C1GP393KSsM6EY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533676; c=relaxed/simple;
	bh=k8tPoa8wkwu/trdJSsm10gax7rokUSCRx0BdMaV7qCM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kE6u1+SLHPXgFmW8vtYPm6qZM4Sht4OWpk2Y8GvT/vjq5BBTpzw6Fid1amL0IqhBn76/BXAdtqMkcw1DTi5i1TkgMtWTJ37gBxYcS9ClMK7lsIkrDTP4s91lDg62pCV0ekQVD/77TBSmkmvH/5osQ4Zr05Muygy0CRSLV42fvE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UbXqD44r; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UbXqD44r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZv0IjneMDn6pk0a9j8QUcFOCcmZgdYhdAPeH9TTLgd171E25QIK4HX6g/9/Y2hgRzpnN0TRG3MuvqkLXeafrDo1NgeiSS3l8Y9PpqmtLmmvap45PN1Ov6p0jBkOtCW7MiOd/eNNLT4Z22vJy0edC8fd1cuNsInk4JCxNfgSobkEGfASBrkViIoT/w2XuIe+SRKc5HaPgsD7cErtVsZSuqrzTs/6DrL/CCQBELl3lsklppxBzvY+b6c52J5l4gn9jFtrSMeUt1V5bhoKFOmj650gFHIL9H4ZLmXDnWBGGf/osix2cxLv0ISIbrzDyYthw8Spzzbp2fwsLuXI+yfRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNnLcQb1iJIEyvLoIt+gLNNk1SfSVBBwi+WRKaSDj4E=;
 b=SWOReAOuV8yqeRmTK4aJMnYWK9OHV+U3FdL6xmq+Oa/tiNfMoo9yDvj9Ox60YmRfullNoA8zJzrtAaIjND/K1LciNT5RNa4MZLQy+AnWvCdiKHoSWD7q6oc/K1kwbNMa9ZuWu/huTgm2jk/lG3zSwowB3XlYT4Kos3RFteuEsl1owX70T01ec66PaIEC1/hh9lpFu2rc5M7+DAR6JwGB0l108UEPlIr3LqR/LYwez2NBqoYNoe9SO1v5knCqp76vpNfe/c+GiqUdC3BV//1WsX3ZpmQB3i4W77zU/qpGSRa2OgTXuvb0r1mSC1Cw/WhRryVPVqVMDT315TuGn4DT/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNnLcQb1iJIEyvLoIt+gLNNk1SfSVBBwi+WRKaSDj4E=;
 b=UbXqD44raiqSLMh2AnqvgHGAHZrrbonGHnUCwbmRNpFM/a9IuRhuvj6LWrcJAfhy3jt3TVwVblATw5AD+cwxMX+SyVxI4WMjTvM8w2wjSzWW5OEZrPajFd8To0JjbaFkb20BjKKW2Mi3jju+X51KbAKtwwAJ6xqKros9tKShaP4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10414.jpnprd01.prod.outlook.com
 (2603:1096:400:246::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 01:34:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:34:31 +0000
Message-ID: <87mse9cwuw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 070/157] ASoC: codec: wm8523: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:34:31 +0000
X-ClientProxiedBy: TYCPR01CA0185.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: 505b8532-0674-477c-fe62-08dd5605b7e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o8wshGj8so6dQ9c0AqOrbri2+P7tx1lXAjhaJvzXQ5HGo0ym7IECCXYnQ7MV?=
 =?us-ascii?Q?15N962VjNU/k0qoC3RI4rqvCahjYy+fHJwoXmqUjqJspl8xVarYsXrMejYBr?=
 =?us-ascii?Q?p8w6+faQDmRDVmfKtJStzySwbVRc4birOqFE7aW2OTsx1gFwQZMLCY6tKQTy?=
 =?us-ascii?Q?e21ex7rklmMT36YpQj9KlE177Cl8p3+sWX8cLbn5ErgSoCCKVq2hXAS50qMG?=
 =?us-ascii?Q?/tgUdMPE4pFLmnC1cnKSDBCzS0t0Zn4tFeedtAyz6TLDHHsd/M+LXHme1Fap?=
 =?us-ascii?Q?8ijxY9hfF+sZ6XLtaLCYjoTGuvJ24nUHyaNCuqDR2Bodfj8+6v0wUnDtZyOJ?=
 =?us-ascii?Q?fQO2pOLHxEWimhZeWCX3w2v4asazJgdOLrpK7XybF53VRtpLPZqPCorEKLj3?=
 =?us-ascii?Q?64Clxp/7Ui2Wz+kbjthmyRQJzi4OAq8i/QotiU5/r82LsLQmeNkcRVCCDTfY?=
 =?us-ascii?Q?D8F11uyOoccQkH7n1WAr4Sj6sEa/wjXSOnPtb5UuIhqInVH3Ni0NyGCQ7SKc?=
 =?us-ascii?Q?7hV05I4LfokSqRUtKpc61wEdMSfs1MoaAXXqlMnePnO6LUDRlelg3egkVB+9?=
 =?us-ascii?Q?CoxRYSLIUdTWpIe5ZnkNc/POOa+dVlc6vJpThX80JAucCjPt5pafJ0kcuNRV?=
 =?us-ascii?Q?jHlc5gI3poCb9q6fo1llIJHWZiiwHDs5t4LCOFRjCTj88xqvtZuu6bbYshms?=
 =?us-ascii?Q?BiFSEST4Q7DWXvDy2e2GjW8grKkBVp5JyFHgO+fAGfecqxqxC4B+hXkfa2J4?=
 =?us-ascii?Q?oyZnDMnkNg1Lgcc13NhRlvyVsV+RhSjWctZF6Vjjliu0RBaIZ+SPsDNGqknp?=
 =?us-ascii?Q?RgbzYrIYsGKF2cRzDbMoRaSyEhy+XpaLOvDmuKEF1obcw7YQ+FGwUJZ4epva?=
 =?us-ascii?Q?mGWY5tnNf60DtSvP1UlWcYJ76UTK3+qLtexn54ANZLG0P6XZ9GAxjspbKdC4?=
 =?us-ascii?Q?L8aHppQi9x0EWzDhXJoFkZ1NKRu0Jj+olzOzPpc+cZa9myd6/0dL7ratd26s?=
 =?us-ascii?Q?+Cxtvzbt4dRuGqJkHxM7kMH/gF4st8AywJ7occmu/FzrZ5Ft42LSIjRsn1ka?=
 =?us-ascii?Q?DvWiiq5W9eo1FAV6rPyQEIKxv7/E0BtsdTglozB007AvAD1Jo1I3DoxyaZKt?=
 =?us-ascii?Q?78fSDrS8CsITW+sRbKbP4Sn7m1DH3L/35ApyaQL3DMqgOobdJfTFt3ipjeF5?=
 =?us-ascii?Q?bYSKd6fOpc+dNouqYUpPSu2YV+IVBdNFRexS2x8a70+5KzUJTv/6/iwkHapC?=
 =?us-ascii?Q?jZdJe2+itgNceNbxcZF79Yw+LjyHc7+MilfjMMadRGI7UTnY7pvbWxCVNPD1?=
 =?us-ascii?Q?E9j83/SJau0+bLyZfMMdpVfN2cPYhcmw5Ot0XUuHObzwidQVXRl0Ym+4G89i?=
 =?us-ascii?Q?crk00Z8UiSfz0VJ1nJ4TcMXagH4R6fMf3HQMfA6RRntl55y27KzVudfrSqmU?=
 =?us-ascii?Q?RLC4uON6HQLDdTIuzNE9Oa0n/7cecjPW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p6Klmyz3MAGg0gyZiRS3w1i1MnnsB//NMiOFDFee3gwMLo5cdiwVAfYwGQqG?=
 =?us-ascii?Q?rwqJr/1qVLJ9dWaW0uRk+Bcgw4nRStInnoIN32MT3NJ2WLtmziQ+YMbynuNj?=
 =?us-ascii?Q?rjKwJINKl2Ijpqia6rFgMvd0ti3fyuLLgyKh9gtq/ldF4nHIhL0E8f7B8TIl?=
 =?us-ascii?Q?x2B+1DHB2NRoPV0lakvS1o1TLS6DoBAAqBzdpr9vKXh/8rKsdVBXxSvRHSEe?=
 =?us-ascii?Q?ahY9woTR5Z2fqA/FqjEHIo6Sf2NtQevhrb4iG/700ROLJtk/Mon9HEtaQUY/?=
 =?us-ascii?Q?bYEUoyFP/rZCa6v7+GWnay1D9aEi0+epszIUzKz/AVZruyfyFHBFb98Orjhc?=
 =?us-ascii?Q?okzDHedUeAntvNKjVrzn5Ob/WO2Lv9CHpEulvuPSZm/PDOw1WrLN4lVks5bu?=
 =?us-ascii?Q?sY+UyrdyZ9CUb+ibeBOJtt2Evs5zT487sxgFRaimTTIEziuAWNyZKNyq6PmX?=
 =?us-ascii?Q?MXbwSjrOVOs4zccVDkpBxrEnpe4ye1/ZrwzxOod7iIvDsRV7I2QvBrIYPzLO?=
 =?us-ascii?Q?hfqeF2udPAeWwVso1H8gofaO5pRfYch6HtVmFon5tWJkShyFn4ds0bFx/kvp?=
 =?us-ascii?Q?vwfFBKa4mDYgti6ubEFcysjqAbXXuiSmQJnA23NxgdVMVnPyvyC03y4pt+Cv?=
 =?us-ascii?Q?F8eRFKR2uow+Fr2px2kAJQCYQWeC3U+TSYF7z1RuR+uoqsO4zkYOsnW45qZP?=
 =?us-ascii?Q?nP/ocItjLuQS3FQ5TxfIXvjiBxEZaZFxqz/ONpHFBumrCMYSFMXGHjzblF6S?=
 =?us-ascii?Q?bgQ0Q0NdYOOWKJQKBnyQ2Y+NjQxdJ1W1dD3J5bNflDDzrR2Y8UkXJ14ZeiY5?=
 =?us-ascii?Q?uwMkHrVNhRHlGBpZeDpJhg0LFkuANNib9beDdnu91of2+NSAR7gw0AJxzwBy?=
 =?us-ascii?Q?Hxrf+Xzimg0hSz1Co+woA83lgbnj+VdQot646EU1xxHunX5sVBIq2AiaKq9j?=
 =?us-ascii?Q?9/Lo1BVIMwXH1ojpwWmtWc6F3TRdxTZtAJ0FMeNZxVEOQXRFsH9hnmLY+3lx?=
 =?us-ascii?Q?wLlVOBko5QrC3oWzDVZGEWkVM2TSPCH+BpQ9bKwZw9nbVYx4WHJ2LnJjNr0m?=
 =?us-ascii?Q?HmIg2RXDrxXqrlqmaiMkYajKMECWyyRZ9dy5u6DU3vXhtA1iXGvQyA9Y8RYX?=
 =?us-ascii?Q?qdV/J/8UJOjRanG8CKDttJGRhVGIZ+EuQkFrP8nXCV+Q5Ewdep7dd1uTiWdV?=
 =?us-ascii?Q?2BeTMHTEwoEXtrixbQ4s1ShFSkaGWlAya/QknwbbXvuvKONgA/9uUxBz0nZk?=
 =?us-ascii?Q?Y7SM5uFAUy/nAMnPmLct53cKdl5CqQvJ9PJdSLtAvW3bdyiVElc5+P6pfLaQ?=
 =?us-ascii?Q?d/cpb+WXaKSVjSYj6wD8A1KV/2m4QiDXxd9cWuCLiJTe8jzV9Wwa2GhY+ftw?=
 =?us-ascii?Q?PcNs88kvPQUPw27GIjsCm3KLgl4gxkYXJDXhXjfVD3Gs0y+VOKQ//ebH/ujj?=
 =?us-ascii?Q?OUT3etlzi7xRs6B3cs1Q6nOw2UiHI9JpcVaMqWjyKagHBHiZd8J9jlKwEzel?=
 =?us-ascii?Q?fRyHLxwxTx7cTm6rEku243kpx3+gZd1+XrApumw5ZKWjdELPtjUxn1ECvr+P?=
 =?us-ascii?Q?BvCUPtDty9tRdOWmq52MnozpBSejh7zw96UNNOEaAureTy5sqfKyyXyxYRFm?=
 =?us-ascii?Q?TONk1ULeYARK1ycSKsEiid8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505b8532-0674-477c-fe62-08dd5605b7e9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:34:31.8246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6IjxgyIvZl57bIAhuEjpuqVrD5pNs/YhhKnPq4krS5pq+Sk6AFaoi2EDb+m985/IGMtuznbhfxmKxVabAbwS2C4o17anU2roI/z9UyFOe7H8xozPanAXkHhtdN+OzzW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10414

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8523.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8523.c b/sound/soc/codecs/wm8523.c
index 138eba7e577a..6671e13c320c 100644
--- a/sound/soc/codecs/wm8523.c
+++ b/sound/soc/codecs/wm8523.c
@@ -264,10 +264,10 @@ static int wm8523_set_dai_fmt(struct snd_soc_dai *codec_dai,
 		      WM8523_FMT_MASK | WM8523_AIF_MSTR_MASK);
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		aifctrl1 |= WM8523_AIF_MSTR;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

