Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011062.outbound.protection.outlook.com [40.107.74.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E10221FD4
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 00:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780964606; cv=fail; b=NNDIe5h27iz83FZd3HNbMxnnK0IAthrTvy6fdwrZ0qiKXc7fWDVrQVGoUd1GYPz1Ky6EkFLjpMUKFPf7o34BMg1dOxbjbY5zdzDUjm/7edNmRq+0eZiuonkGkohYNhKR848YrGjjaktqqtSR6hbtoSZg0ejQodB5eN8e2zUYoT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780964606; c=relaxed/simple;
	bh=QtrsgtHXjWAlOerXnQOQ44XXjUc596IT6K0IEvmAllI=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PCgugA5VlR4BVzGL8eSFhLJQiNXJ+XTTC1V8NJgqmirG36SKqepLjoy5LQQJZ03jZrAd09I5JFgJgFSFM8Sbv82UgBQrZCLBx1mvNUsemxtrQeJc51rsD/Wl45CrpPEjKdZdfzQ0+VPY9v7OkL2UOC2A+rVc1Zi2ty7FQqW88Ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WVTHtJY/; arc=fail smtp.client-ip=40.107.74.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WVTHtJY/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWgF3ZtV09YJjxHa2lMuPpAOWEDtOmkYTNE2fCmJX9E1bGJF4192biz4rZ0WLrawfcy5jVeZ5Dp0sf9e1gNXo2zzf8ELcN2F3kUUwktuaFx2FDQYCI+cqGpT2oci8UdWrZRchWNvrlRj3hZDwnv9/UB+wOv9MnjZEDaVb0+PnA2MuNpmckBHexwUNlIl9Vixm7zaIFl6mJKLT5fmcAJoZzgyJ8GcmFVuAgs3iET1XbjKzjledT0ijwspszBVR8ktjiwXm2yo1qnW0jle9YNoGKpngWUXm7l2mIttErgZIY6ehP/KGU46yLX104/CwwS1LCipBnENWXXtIExL4H4OnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dibVg0AtH8orxUNkJxy/zB7TmClb+GG2InNi9Rjwyk8=;
 b=g7sGjL9HJbkTwvngyofgAwSeoDwK21u5HYnUiR7tKdufVbba63VbZdDoyHUIQ7cKG/tiCPqMsyGkzZOjDG4EsCh2XmnX+k+3ZUlNl0AQTA4L1JlrHO/vOVzFUl6qoc4Urc6bp3cmIB7+wZSNg7OcdUbpCylINEejGeNPDtGFQs9BcGuzriqG3xygWnCWPuyz8z9ZnmrawKoU0rhZqZYVlEPZdKZanT1NRvK/N6RpSAaSdXXEv2VVhzEKCGa95u32MCDHRHz45b9zeMUwkyVaeNP4LnUf54vNQNNVo3Hk3/hY97gSmJyFvhC14lMfyTk8A6KKif12ZsyEO43FK6wlog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dibVg0AtH8orxUNkJxy/zB7TmClb+GG2InNi9Rjwyk8=;
 b=WVTHtJY/ULz+WiOm4h5gjnmIfaZMQ4Ki50v6YALrk0+ep2z2Xl3loE/AmpSUMycQbf/SR9jkPyTRIA7oGCdY8eDsrCO7DXfEBWdi/gwafV5nsyXotWImVb9nKjZvVAR+WRb9IW+pdqVB21VreUZPJBVR+KCblTNtHCd7WqC+Yl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYYPR01MB12760.jpnprd01.prod.outlook.com (2603:1096:405:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 00:23:23 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:23:22 +0000
Message-ID: <87mrx436kl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 6/9] ASoC: codecs: pcm3168a: update auto select format
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Jun 2026 00:23:22 +0000
X-ClientProxiedBy: OS7PR01CA0075.jpnprd01.prod.outlook.com
 (2603:1096:604:253::7) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYYPR01MB12760:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a0cf765-4e17-4865-16d5-08dec5bd50c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	D9UlItFgvNj11ZeqirJ9dPErzFLxprNeCUbN9xMoI5pGDtXFI+WDBRuENJi6EhW8z2r4UryC+ccb9tBdwI4ZbSKmMQfCX+PteJhDcENnEAAgcZG+Ng2cEEX5iMcO9uCRlmyGVB4Xx1Xex0i10W6g+fp5EhjtHCwAhgc+DcuOhDvoDFSMLqye01zskhp+ZAtixVeQVmBDblz7NKsPnBvJeyI5pHb4XHzRzvUd1sE987RZOjXtEraPoOhBLnh37qs+2JO7kLA2DYyK2SBOy69hZiDBDHxBljIo8nsw5YnOxa1nyZsq4h1d0UbiNIp+qwALUjHhzzGb7R/bpN6ILJTcobOiyuecqwl87NRJn1Q18VoBE2P3dAv+D8oOh+gZYxXSToThf867R+wZYx+2+06UUSBMOGxcFF2l5rBIDKk/Y7VXuYJZzF2nbArsvFutUa1pQ4x5OGWgFmQ5EqWoaBQ6gBjD87LXyDHrGGXA8pkb8z7ORrwpNyl6kDAqDWkqlhExT2+/XjSIeqAQ24W2L2/fud82lHplAg0aPllIOV9U5qJlkHohH9w/ot24/ON94tWVPff5m2LLEvrHmDMTPuc9gph7BbPPe4sm67ZQI5n6xUsYgLUvz1TIZOkYFbK8VvycnNCKgThcoLzolBuCUvV5FR5GjyO4ZbgDinXC2JWjBjLkQyCR4q0WpU3+nLVvPPip/vIqPrRE0+BrwQW31pTKEWor0Ii4tXDzmo9bVQhSOZB/F1d8v2MXQLaKp9guFw2JjYA+XSJU1zstWAP9yNGXYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PpTe/axVJcVU0iy7WHPNNoCYlqeR/0l7BXf6u0qYgpiZMItYu6uRe8VdHZqy?=
 =?us-ascii?Q?7ltpCOM5NS9VH9Anawz2i6iCtXE2oSQnXbDti/QvWupchYaE9gFBA1TW3+aU?=
 =?us-ascii?Q?XG9YBpHehn1gFxFguvTTXOgPTB0Wkm/FlzJ5RtMPbRm1QBfmmtdAveAJvnJV?=
 =?us-ascii?Q?QYUwZ0bfoNJlFsnM6Z4tWVJzAzRzP3Wy4sHXAUI7+Q0N/25G/brvaKTygXO3?=
 =?us-ascii?Q?L16+zL5tVnZqp/1zL0yWcwY4s013SW/yVVwyY51eWMerUQEKZur4zJsx9qxR?=
 =?us-ascii?Q?sQ6E/6y/08IL6LAuNMF+VMXKVVVcGWGjcjbHepNT4mq7iaA+/Kv6Eh4m5kga?=
 =?us-ascii?Q?lw+CMfSe9Ugw/viQHF8l4x+YIi488fe4vJHRjvKiZ0clX0oZ9kp81nBqkCmg?=
 =?us-ascii?Q?InumyLT1QnwyBy9LdxCWld8lFiwyywuURX/U1Rzz6bMMv8cWUdHiV9U++igw?=
 =?us-ascii?Q?o8K1IPzEjK9huw9pk4WnJFoDED9kB11aSgZWHJ+/8PcrNyHk/QH1fpr9xa1Q?=
 =?us-ascii?Q?YwEj25w21lPCFBnJDShJdeBxvxHs9X6N1MzB2rQpLUr+PR+O0hHdvElDTfQd?=
 =?us-ascii?Q?3MwmsG2iZK7YJIeRrtlijzOMidRNMzTMtrllqQrTqUPRbveYDm7WWWAv/rRr?=
 =?us-ascii?Q?Tj+ZuAJAC+6tLefFT36hvtB8VCpYQxSDh6IyuGUPDT1CONSVt18+ipC2cKae?=
 =?us-ascii?Q?upArXfucKa2H5ZsePQTcUuDZIVBG3bV6q9xvEwBjHREUf72tspmwUuIsARvH?=
 =?us-ascii?Q?dVw7/BWPL9R2z0fw3QDi+rKvgivKNLLE4PWC+r9bzj/GS7kXYz/VJB6FPDXf?=
 =?us-ascii?Q?ZQt9V3cYMSlG69x/nklc3Ty7nUo5liTF2sCP9jYML/FYGChaH6/qsyStBAUL?=
 =?us-ascii?Q?9RFSHvEKbuVMwWWMAk8nP3e0PhY/DyGiwS68+BSapGvDUCNSs9De9oWtYWrI?=
 =?us-ascii?Q?WeTrYOA2jDriiGQB1PZ0wXBis09Z6mINpPxiYIUh+uPf/9fBEepce0UTZT2R?=
 =?us-ascii?Q?fvlc+OolSWIfgjB4J0aYTGYQ7J+ACcLYqQOVHqsF52Bzn9zYiiO8WcFv6Q7L?=
 =?us-ascii?Q?iGhU2foVMnL8U3DvYFEnd0/SHB11ffblEAVMvfE9xBnUJ4OAGRlzERNp5ctx?=
 =?us-ascii?Q?FYwK4WLyk1T9E7lnjiz36ruzIAyfeVmZU4O90G26vye+BuTFHVlWHHLegts/?=
 =?us-ascii?Q?3crDGVD2Fy5zxTIADNmjM3u46rR5xCuvJfplIVlARZiKcdPl6l0gtESa+H2a?=
 =?us-ascii?Q?T3Au0d4tcDeoitgv1hSIwKU2NGKdCmMNHzNnOiWy5cqjbDVjDFXz2k3vCQSk?=
 =?us-ascii?Q?Nn1lZfiLf+UFT2RXbtG7A0PBqG9mi51E/GKnN2eCxVtNyaWkmuhHEVc6M4C2?=
 =?us-ascii?Q?8TdL4ZJ8YMBsiVjNXaEvKbihCWYtbOQeYcrARie13FT5caFeUn6C9vkKkoBM?=
 =?us-ascii?Q?ncNATatGddI6PkrItNVPo+06hC1s862yfd6OE5KsdSoC5DPuEEiULa20VD+w?=
 =?us-ascii?Q?p6x8ou7KuULasnnsQt7nApCNMNEKub4a7s+EvP6ZQRTXW+FtQfGcEEB87N4T?=
 =?us-ascii?Q?c2gUyszZ9itJb30B/s6JdPVNZowgRE8vr54i4aH1ioZ5KIRUb+13zdJSQ2Rd?=
 =?us-ascii?Q?EaFfrrGL0WjMvxyOEbBDpH56fqOcjOb2qGgXYDJ3C446ky/koS2z6G2AklUG?=
 =?us-ascii?Q?ITSr4rkKXm/EIy0gAsrIvjK5whUnYtJtOdhVePyKoLiz/m65sE9mzahIi4sh?=
 =?us-ascii?Q?pFhIm/fWSUrBfWdrr0rbPktLyUEqSH5txNGMScODBoLZMQla31E3?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0cf765-4e17-4865-16d5-08dec5bd50c1
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:23:22.9282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2AWrVP1+lCU+teTOSJmAzdcYtCWU6QKA6FplV9b/rJo0v+FUP37rLQzrJ4Nrd7lH20FMRq61XXw3ah/K7IJwsAssFQjYHDq92nObOJmbjYcjPsZLhMgoMQDE6accJhwz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12760

Current auto select format start with the highest priority format and
gradually add lower priority formats one by one, and search matched
format. Like A+X -> A+B+X -> A+B+C+X+Y... (a)

But in this method, we can't handle format if HW has some kind of
patterns, like A+X or B+Y etc (b).

Current drivers are using (a) style, this patch switch to use (b) style.
This is needed before update auto select format method.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/pcm3168a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 55a7fd5f9251a..cb6a6f08f2f80 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -575,6 +575,8 @@ static const u64 pcm3168a_dai_formats[] = {
 	 * see
 	 *	pcm3168a_hw_params()
 	 */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
-- 
2.53.0

