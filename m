Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2051.outbound.protection.outlook.com [40.107.114.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6941097B;
	Fri, 28 Jun 2024 01:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719539051; cv=fail; b=R0lDzqT7RKnE0dSQsY9qz0XES42evgPTnC10YKHkTK2It0JhstgCdDlIyM3eD9RzY0TsrY5EAOEOF9apsEkrqTA+tQKXK3/hnDP52YMGnmMolpYnmMjaknuurKs8HKurUNrNNR9USSKuF657a/BYpTWeowRQNUNw9aUQOmfP4/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719539051; c=relaxed/simple;
	bh=U2hMXMnzrZ7vh1dVQVlZ0zeCTT91aVgKQD5Mr/tSAhA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QeQtQKKGT7CDre0ksMD3lCHPxmMAdOudkWTBkKKO7mIw3FJ0LQH+UYeehmFxfkPKgfwDIwZFeR8eGvFPRIjgzTuu+0Or7OxinLxqgSUrk21lkWWrb263NtLInpiHmNxTG1TNTMkdxPyn/pp7BoAKKUMMELSscGki9KNZt7tt0DI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=G3PoE+s4; arc=fail smtp.client-ip=40.107.114.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="G3PoE+s4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwTaFw3BoXXriWhaNIBjSQdmGyjdaw7Atbf3HYYoN6R+3rXSf9Ma9yHP5JQY7MowYVgS+nxrHkhj5S5ZYXRX8DFCiyBftkTVnnfLRt8B6sSNMn8AroUFDnYBaqdXbznV3qmCr7fTi5irDDc7Eo7W0dzNHxTculGSUSsjpySlbBgvAda537JI+Ax0uThBNuz3Twt2UhtMu2hvuWmeze+uAVLGUhRVkX0i4sjrbFIP4jDnXv/cCCQff7zvXOjY49kBuk8fzlF1Wo2Rcdc7slCbN3ZH4zF0Mn7Rc0uZ1uIYaxiCyH1Yo2hiubnRBi8rWFVaR0ASUzjWBVg1Ks0C9jzuQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZM/p6+7/e3BD9xlqLiylnYGiFFmAxWqXfTc3rRsbGWY=;
 b=GiGHa4d2KUGlTAGR0MuU+TkRbVSHWMHODeP7T0OoFgTbFVIlkronkySNH8q3TvZWNn4gHuHwWr/Ao/tJcfQjoGIw2hXZfDrSkATPjTAgrcxfbPAdtm8HhDRuvusnpY+8tanFBjadY4vqBBEJtl9f4rH6ubgldJYqfOI9+FMMEJL/yjpGJzH9n5pxR7iavTj5/9dcPoZZLK6tNkKTdhIFDSADSpg8Z7WjklqApVfUhPezohDUvXrdzbFFOsPRdo5O8dGUMd04a5nD6Knl41HnX2sKQLslzQE1kre4xH3FsgygxvvTSRnubAFvocHvfd1H4UWyp62A5tzgE0C4GL11TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZM/p6+7/e3BD9xlqLiylnYGiFFmAxWqXfTc3rRsbGWY=;
 b=G3PoE+s42ZBbaL3zQZHVARMYAQHb+HYAXF+ciffZPU64LB6VfGy8OZjW4QHVwzIqKAZnpTclWJLc/5vyKAC+Z1+9joNfkThjVOLi2XoFQGn768Fm2I3QVbTQNlXXrlUCvIQNGB/IOZTL1K0xH664/gtfV0xpBe1Og1TwQh/473c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9886.jpnprd01.prod.outlook.com
 (2603:1096:400:236::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Fri, 28 Jun
 2024 01:44:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 01:44:04 +0000
Message-ID: <87ikxtaljw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Alexandre Belloni <aleandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: simple-audio-mux: add mux-names property
In-Reply-To: <171953773961.1035497.12432679100328649698.robh@kernel.org>
References: <87msn5apey.wl-kuninori.morimoto.gx@renesas.com>
	<87jzi9apcd.wl-kuninori.morimoto.gx@renesas.com>
	<171953773961.1035497.12432679100328649698.robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 28 Jun 2024 01:44:04 +0000
X-ClientProxiedBy: TYCP301CA0027.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9886:EE_
X-MS-Office365-Filtering-Correlation-Id: aca8f03a-efb5-4a11-a03b-08dc9713cad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TsinwQCj64irImdhgV57yh+K5UdTDjKE8pqH4HqbuMvOYS+hPRcWhchB4Lki?=
 =?us-ascii?Q?kAUD6I54H98Q7Nzzkvi6vMXlR7Q/mcMI7UY6y0KMu4Evd1F5fL1Pb10hdEej?=
 =?us-ascii?Q?NDwFXOdYnlBmP7dKFknotng7H7Kg4DBbdOEbJdvBVx4qBIUhHmGHRE4kmwKO?=
 =?us-ascii?Q?nciZGaQ4JTWNndctSy1H60qsXNg7H3BdYTR03KK3ou0Dj1rYLMeccHCMiUdU?=
 =?us-ascii?Q?gJsVezD9OfudPq79kAdATUTfk2Y/HvaA1tsI+JhKY24gvSljiiUyqo2rjMFB?=
 =?us-ascii?Q?n+OaYWYvYY0ZD1JnCMe4loJzMYuoKdwZbKrIE2HYXveSBRwp2/tR6PRdHc34?=
 =?us-ascii?Q?lOkxcSHpyZs5G/fxrxpHLr1bmuXWXuw4buxb25gPJAx8M2IFu3EoD9HahxTQ?=
 =?us-ascii?Q?5EwOTuATN7jTrfRb9vW406Zca7C2ZzDBlzJhexVF4lqvqEQXYNlwE7zRZhIi?=
 =?us-ascii?Q?xjZjCyVxPyCSvRXLejXIXNHEOksdW6jxooaKZ7GUSSBDOG8LWzI/MMgHro7k?=
 =?us-ascii?Q?A0aIvmzCoqeBDRKF5XUr16U4jzhiixRTzDb7g1qP8WNmOVyq4yZdj25a81mh?=
 =?us-ascii?Q?0SX0OvUUe7CAfyybz4LBqi1/L9IJJnnNwKZvTRnbM0LQXUWkRjOAmjSdtb5B?=
 =?us-ascii?Q?8jk0ayY26XjFrcpZPOWfb+NV8P5bf6LavhwGAoUKL3RFa5TOsGlmz2gTeUYC?=
 =?us-ascii?Q?KezXSgvM9VxkClXEOIiCtKALil29vFnnd/yxRhA/yBo0kx/53YRxEryaArEz?=
 =?us-ascii?Q?/Rz4Qyz9Rashy1YKFPdiDmxWI7/BG44aSYVrrfjV78P9NRHMkMC04ZOsFH2Y?=
 =?us-ascii?Q?gxclY9NikEHzwz7OJLl1SApKBNqZTLgittKir9aYoKr8FNgc66h7CvI8Wzvi?=
 =?us-ascii?Q?yw8OJjKeYtKnMV+qmXfION5L3KbVG5ysoB0QuLx+aG6kpzlccHdr7NPXiyoB?=
 =?us-ascii?Q?VEy9r7yC00vDff+OJEmCSxLoS7h6LBSaZuYjDW7rjksAX/gJcKfF9ZvT9sMW?=
 =?us-ascii?Q?HDzqhiHYmnrydkD2fhB8bsPFLFEI/pcoGPYNupw0mTfJJql7PH8rSjQoP+J0?=
 =?us-ascii?Q?IwUgzPBS6HxFINeghbb/CcMdpDPNVGCbpJLHc8cyHw+G/KoqwWWbhlK0NY9m?=
 =?us-ascii?Q?nqzEYCk/UTISm3xg/iTFz4jQBl+F1kYvx5lYFS7//S71LhY3tncLnX76XtRx?=
 =?us-ascii?Q?cupnLZs7a9c4hkYIdzU95BPnRNlF2c8wtzVyyPBa8xQXAd7VErs56zbtWopn?=
 =?us-ascii?Q?o7rD6I2J1V7GyIyRuK1YVhm2iRCJag1hganPUhZ/I4r4SyiaklYfkX5KAYS3?=
 =?us-ascii?Q?f29Agt3AQn4y/R0Du5jamC3vT0GRP5Dt3UClxBFGFJGSNr1j2xklfkvT0Od0?=
 =?us-ascii?Q?IS6rV9ZvZohk940h3j3LTylQtJYm1ZwuLNZDFDwlzRn2lrIaBQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?itmx72Bvb974Eo+1Qv3z08GgyEtmyjwR3bmnFq2Pad/dxZ8E9//RwQx12HC/?=
 =?us-ascii?Q?FU9DXo/VsoP9YAGcJdK1Pk5sI2OCt2Kd5GBV6DKRfRzptUimxVFtoZkBijpu?=
 =?us-ascii?Q?BgFgkQTxR5PgCkeh2jlyOjyZqPR4V41rhNPF8y65dJG++8wCV/6Jj9gykC2f?=
 =?us-ascii?Q?RmXMokfEvQ1ySpYuvqheMzqGCCFVhBqtCtmFlRX5KJtIMY48ewQ4eHhln/Y/?=
 =?us-ascii?Q?6W9C1S/o5pYFg/LEIuVkKGxw7/EJWxa4pXfCvyUssJ5chtePs/Nhuixkhn4n?=
 =?us-ascii?Q?nbX/eKjYI6+nI5r3+w/nMEh30p4r4vo3p/3lAvtcpo1jDFBqWVE28m+L+UOY?=
 =?us-ascii?Q?uLt6WwjDgVl9ejyI1PtQfIg3E4MySZpDp6s++bEKGKnXf4vrgX3xEcE9N/Jy?=
 =?us-ascii?Q?LkDfWLuCqGJ18gvvpaOQAreY62i8QH575k+FtJ0y7p24Lm24gu4rkqxYbOsl?=
 =?us-ascii?Q?YEOt+ULCuDj70reecH+sULKpHv/O1uh3J+wUTDRecAqsFP3iIjRVEoLmF+xt?=
 =?us-ascii?Q?XFPcmPJFTvPvx6lO9aDJEUicZOYjj2J1aaOcHvV5N5+Kr6sUhe8SVQTJK/Jk?=
 =?us-ascii?Q?YV/xyu3fTHlf7xktbe963CrKoL83gpc+LhxiYJpcgxGt9ciaRnw2r/KtEEOd?=
 =?us-ascii?Q?cPTGmoATMBtWHg76yqszizcE+U0H2rCXCBvvkfr3rG6x3br8FESyZIIkTDo1?=
 =?us-ascii?Q?vMkpWbjlCADmjCfwAQA9wNpfSUyzIKuX2+pTY1Un1MdtrbeFhteWkyMl7bQy?=
 =?us-ascii?Q?dnGoodDo9bjjnBGj/kx0POQ5rX+xWxQSuLd6tpU3v9H9PYmqEJ59TsqdIn4O?=
 =?us-ascii?Q?LRIf9ENfyLQYwKKS5CzEaOBKpG7fhL6NsxhY3EaX63nBakmggDOzXoHecI/S?=
 =?us-ascii?Q?gaIqjS9ku58iDgWFNPDG41dI7Qc31PVywdxSWPnLDkiNjUk9A3fxtjWyMT0g?=
 =?us-ascii?Q?GN4uPL/cHpvO0ZSmJ108vATgfGP6T/NeNtfFaQy8ctjRswRD+R4VKIKchyPE?=
 =?us-ascii?Q?CxW034TYwxq7xGzxKcNeMFq0BC48PRiwsmfngaVJWDlCmWjdPvUf+eg992ZO?=
 =?us-ascii?Q?0orAg4CruY63Ux0TIF7E37ocMbT/adwHWe5IEA+MzypTYXrKnl2iXOGQ+JKk?=
 =?us-ascii?Q?zyS19pIYj+uoeCZiEZSUGy8xn+kApXRLbEUpLeP3kLZD2FZLSE5G4i283Fh5?=
 =?us-ascii?Q?D6502xKZmhkv6Ina36HwrKt3mWdFM1X711f/4O17RRMoSA7r0P+mKC4CWtG5?=
 =?us-ascii?Q?I/ExmXOdz1crM/jRaZSo+7u8iHogY6anZFdIVxMSmfjON2rqEXrypTxVag/a?=
 =?us-ascii?Q?SaaZWqs1O9WGWFWomXKucN+Q4Blo1Gy6RQHH9OxeNnHYDjwkvQRM9S21Natv?=
 =?us-ascii?Q?qppPmT4VhV3taFU3pZY0sDiWhvcKMHYWGRioI8ueQzH5T+s7+f8zLoWR2f7J?=
 =?us-ascii?Q?Y4CsyqL7KzGCBSuH1du8iiohRVEdeXYvjDX9Ok29ap4/3h8x7/GjcQS40T+6?=
 =?us-ascii?Q?t3QM1wpgP8GaqT0v1z/G95NqJUIQ3PqB+TpD9Rm/xfh++jgTSl+oH8x5uhK3?=
 =?us-ascii?Q?utIj7c9r7f63SyvInTGXMUdXUJspraQTxuUrCVolGdNprO/eOk0LedaJjJ29?=
 =?us-ascii?Q?sxj2STr+oQWsLNAe68TY4Os=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca8f03a-efb5-4a11-a03b-08dc9713cad8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 01:44:04.4359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06rJ+fB9hH2Rk9Yi3jCuxJwQOglEIWZX4pQogRe9BeQVuzKq8HWFAckglRtIZFkZQNiN7Z+eJnpdQpSZWypSXHVesBslQ15oh7TauWUQOrQzo2NPR38p2/obNtfZVGv6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9886


Hi

> > simple-audio-mux is designed to be used generally, thus "Input 1" or
> > "Input 2" are used to selecting MUX input. This numbered inputs would
> > work, but might be not user friendly in some case, for example in case
> > of system hardware design has some clear labels.
> > Adds new "state-labels" property and enable to select MUX by own state
> > names.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> >  .../devicetree/bindings/sound/simple-audio-mux.yaml          | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:

Grr. Thank you for pointing it. will post v4 patch


Thank you for your help !!

Best regards
---
Kuninori Morimoto
