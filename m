Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011065.outbound.protection.outlook.com [40.107.74.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7B13A6B70
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 01:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695617; cv=fail; b=F2L2DpRXowEqldhR4ntNrFKWC9mcVkmRINxbk6wllGn9+uRMogbktFxEGV/J+I9M/w3P/eVlV9DpKwgxcOBpRF0Kkn62KGvcPpIfNfZIFbQzU+m5TSRRGqIedHhZNaZAi0qzRHHlvWsx9wo0xA6IHBNfF/J9P4Tn1kRTvJQYxrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695617; c=relaxed/simple;
	bh=W7xubr9m4LUU2QQ9/3QahFg6qH1SaKe1ke/sb3C6LEQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=t0H1UJMRzCBP78VctElBZCItdLnGadDWBG0ZPjGqk49Rn02cbq8+GdU3y35/VdLd/SfpuTzV3Ienbs8zaCkgJXYsyMfC+Yqu8e4EJwGyqhMn/h1jWJYWKYjISxcovk/FZZZXMGnWBHCNIgpxUIRKTt+Z3mt9T6pFmeRgsRXJnEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SViBrSi9; arc=fail smtp.client-ip=40.107.74.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SViBrSi9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqeEgCv1qCLb0zaA/9KXY4A25PL9aA3uRZvSR9gVmMRCUVZqzC/frS0K4FTmoL8j+6nI30LD00AotxpfnAd7/uROIPu0P6EWA5Iz6w9AQ4aJlZ1mmIYDhOF3dXkZBMwCBTZ9zFaaHdBtYdL1SCoTmR197Nj4CxhFInqt2VYSXS1BNHU/MbpOYSLZqnzqHDpnf5cIIXWfgD1sfijcxe/+XIYsbGLZN7RI3XCVaBgJ1oxJe/TWVvEHv7rDIba/VNISUDdGNIK9K1pTHoIxX3itI9utshUXuIphEHVNodal8O+5kjAfJXxN5TYSFB++PAAlXMi0BlrUjKyRvNatU3pqWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IP4v68yWRjfljY+X2zQ886/+3CQ5AB6dK300NzSAlho=;
 b=HNX1olpXAzb876d7HvsmHHGViqwNmZm6Kmzwy+zWi8Ahkm1jvJbogiDX3R0kONwfCtdnpHP8yflVCN+r8TJ6k8Q2a92CkAy4s5V7RGbvmdpYwNx5WXgvvFo30Zb9IZ+q57MqSZeGWC8VDFMpx0i1MA7sIRn5gqBUprINU0lyDYieIn8IzQzwLfQx00ybjcCgsVODRjwChQwQxosqAMEpLEIM+MsOjhXtiJjbJkPjl1BlcXueMzL2QxqRtV2LQ47arF0eix7HItA0pw9OYy46s2eU6SUFB4LnCKsdZqSl9aP4CWx1oazAwDl9f90KBdVTvW5vvdWnUK8sfYez2O3TDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IP4v68yWRjfljY+X2zQ886/+3CQ5AB6dK300NzSAlho=;
 b=SViBrSi9AbP10gnJ27oBi3Uq6WIgoHjvCZPnVwNnhlv+Rj8XTZUVqqOYlo7brPB3N4oB9ciifufpYJsucUAWcTZELWt3MEAbvyezAH/DEfEgJRiEku30wd5oo2ROKW4mrUnX+Dx4bcld4RBzq/CYQ01gc7ua+jgmn0L8CHToMcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYCPR01MB18388.jpnprd01.prod.outlook.com
 (2603:1096:405:3ee::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:40:11 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 01:40:11 +0000
Message-ID: <87qzirjq11.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,	Khanh Le <khanh.le.xr@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: ak4619: Add suspend and resume callbacks
In-Reply-To: <878q50ze54.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4pgzijx.wl-kuninori.morimoto.gx@renesas.com>	<878q50ze54.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 18 Sep 2026 01:40:11 +0000
X-ClientProxiedBy: TYCP286CA0073.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::18) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYCPR01MB18388:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ce0a93-3732-4631-0da5-08df1525c77c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|10067099003|4143699003|11063799006|6133799003|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	91Gnr8x4wPJ9A5amf+jqh3KPLNKsHJ5CrSSTFAnDiy/SK3u7eJyURUML5EBXdoM9YoYEjOLz5NGD+FJrKTmVRZJ6T1s3fAiJYoiVlf9k4ow/EEEya/W8Ri7RQRXyTPLwGTJT2ttS4Fk93X717fKVW7g2WW+WBc5b8YHfzfxPML2V49Ds/2GbGe318p+RzuWGqcKaNE0APtnVg9275Unld5tlFuyQnDluEuR8q/oBjYdwp4j6tbgjAq+lm98tWY8gqvqxRiGztvH/ch689TCu2d9Me8zrMaaQ/MQdvYAKkrm7dADYQeArodDcUrRFcQZWzoz0Al022eO2zHTHgxKtm4cngLg4e1BDs7EyVGoyr45CXe5ugMM2ZWtwlcGzI7SktQzSUYZmxVRZuoa/pwwNg11tLVAzVKx2PVxkBvvNi9Lvsf5JkvMbzI+SXI1zZfrK8uSizb7/9IqRfc7SWdKznlSPygLN2OmTqXc11pSf5g2lZWe4pVz7QEu9JtdWbi8QLlRq6VFOvboU2uzZCKe4FP01LI+A6yDzzUZkZSjyzRTWlUeYBoiHz0BIE9B6aYIlomh4wTEpq9Qx0b+sKtwiEaVc5ngeSs6Aag8DKjzIt29GY/oO28iv3Kpoi+GavZ/8E0elD1XkjNEM4wkIK2cnv/gco9PTUJuKhdQ4XlbVTkBQNKFzjuS56oFxvDMuOM+pMSqNYmLShRk4mONaWe3LGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(10067099003)(4143699003)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+jwDowsyN5JFVNWI20C3CU1DC9Ot4kAfdOiGaqLphpKwzWKxwhDcLFD01nqL?=
 =?us-ascii?Q?VkfcvRo9k05h6e3tVGXBhuW+xhDBAFRdFdo+qLJYv3ecbZoaKpQsa0aGK2Hv?=
 =?us-ascii?Q?NQ/a39NcgiUQ2IQ1tgam9TRzwmxKvwWeDm6yKXHlet53SEC2C+Swf8rXqzrW?=
 =?us-ascii?Q?GGQbXhmaeFEimAWIooEpL/iY6nU1x+ty/RRc/Xt9BfRrpNgaKYXlLX2Z1tsI?=
 =?us-ascii?Q?/TT4plPkJZOeWZX+6gRWBKEKokw3mdtjMks0ct0zs5RwOW1jaj5+ZxFWzoW1?=
 =?us-ascii?Q?CRsCta8OsVP7rReCsXN16ABb5n1OjtegAvAKmuKGWt8+INbleMEd67eSQG98?=
 =?us-ascii?Q?8Z7kwqnYSoJ6wO4UjTmXr4Onvx5hl1vbSQVhVh9cYfu0mtj7imNpKe5+8YoF?=
 =?us-ascii?Q?Yxsb++8amt+YNMLMRoBiYr5y8f1VDAP9/liog0SFRQAJ+NmoA5uRzz8JRG8Z?=
 =?us-ascii?Q?6MBwPbZ4t96RwosGRi8NEGVzFyva5IBIqGezxdj+LKAfmd1ZfWdB+YyeaIvg?=
 =?us-ascii?Q?B00GhsqyqoPFQIE6nYLT2RengAfWKSXPC1r7LGDXPA2ZLZilG2wU3sSgrNXR?=
 =?us-ascii?Q?6Za1B3dZsSCoCn26/E7WKIIUocZM6Mj0Pnw/Zma4krIMp7xQY0tbWsjxZClv?=
 =?us-ascii?Q?pmydA/PT1f2pzm5rEzBeEuiE2XB6xAFlf2V17MVPhOL2gJQxGbvZ+1DSC3GD?=
 =?us-ascii?Q?3vwxnHmDI30jVSocuwEIhw5V7uZ9PjpU8xi6Tx/g8LdlDzGNMR2CyFN0f11d?=
 =?us-ascii?Q?o/NwMigL8aTqLAbMRmQhrDaZRitfehr7/kAdY3Id+wS5my0GWAUclmsQyOTP?=
 =?us-ascii?Q?8nJ7tri/IzH642gWgPMNEWCwvmfdXLAcHy5AVo6t9bhnXDffH9aJ3uRIGbPS?=
 =?us-ascii?Q?Sj+0A6sHbZ6Icl6vXy8Q56J5YavBdcSQUzB6XewzTqVc7oZllKpdM4t1+8ic?=
 =?us-ascii?Q?2Fb21NQy2MnPgdgL8TOVzicF4ykOJ26jY1tvyLlOCmv9mHsSclzywMvCREIh?=
 =?us-ascii?Q?XwpEHMUAkoRArgh6E4tBkkVsRg8VLSstnZp3B/iHymF0f6upU+5rU84Hz1qx?=
 =?us-ascii?Q?0cvN5EYbNWVjaJcG8OfCArixFZwJ2DATPo9oWqA+gec4coJ8DSnI82FISXc+?=
 =?us-ascii?Q?4kiguuITAMSNuYmcqmS3baihhwqIB2PQonjEv2waCa2p9nlkXfgY1k9N9EbZ?=
 =?us-ascii?Q?ax0Ki54aaqq0o5iMZu91tX8qrbiaB94Gx1Y8TXdsLhN5H1ZGHK1xbwoPlxCd?=
 =?us-ascii?Q?zEkJsG/nNp0knrtd2mjX+zJWSIKDzhfw7K8r7svhsKxap+Dsfd+L0xzQz+XC?=
 =?us-ascii?Q?cF1BjPmFd8Cbf2W8ryAI0F9+O+dmisg0sL1AqtbU3f8fAs74w4QS96GA2oB9?=
 =?us-ascii?Q?JjlXuDzz7UJzrbh7/ecj3GYQMKVIJnmqg8glqgDiQ0wGyNi+x47WbJ/fPOl9?=
 =?us-ascii?Q?iSczZralvQ62m1u85GHaLfpn5/W7fkKoj+EcqksVl9zBucfnCro5CrbcyjR4?=
 =?us-ascii?Q?cIbNGHcCrFHxn6z/OAdhVfp1itKIVWCjC/HH0z2uo/Kl2Du4Rbq+UNZtrlNA?=
 =?us-ascii?Q?otW6gc3/HV9FivH5LEtNfYvhZlVSLGbXjT7pyfu/buXoquf5u/ybejyQP2Hs?=
 =?us-ascii?Q?TomotB1SfIWiXfuNO3KlNBNg4K4iWjrDNrllH8cqmQejLI9dc/Gk/wrSybvh?=
 =?us-ascii?Q?og/0+G5Qk+4MxDrBQkHz6OvBvzcrxgOBxrU9jgkASdZ9HtBbYg9qAfxQsKXg?=
 =?us-ascii?Q?m+ifY/RVbkoG8gjeEXk4uNKbzqc1dIY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ce0a93-3732-4631-0da5-08df1525c77c
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:40:11.6261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rUBD7wT9x9agSRscDg91GCMaQN3KsR5aWNtl7k9cxWvkXA7Wwo6Gqo0xGNn+DRdbs3QXMDAfeDRlSxMyqJnbEa1tEM0aa+V/QfElqttllGKoqwlGd5MTjW+QapeZxR/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18388


Hi

> > After resuming from S2R, the register cache is out of sync with
> > the hardware.
> > Implement suspend and resume callbacks to properly restore
> > the configuration of the codec on resume.
> > 
> > Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> (snip)
> > +static int ak4619_suspend(struct snd_soc_component *component)
> > +{
> > +	struct regmap *regmap = dev_get_regmap(component->dev, NULL);
> 
> Ah, maybe we can use snd_soc_component_to_regmap() here...

Ah... I was confused.
snd_soc_component_to_regmap() does not exist yet...
Sorry for my noise


Thank you for your help !!

Best regards
---
Kuninori Morimoto
