Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2060.outbound.protection.outlook.com [40.107.114.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D2857314
	for <linux-sound@vger.kernel.org>; Thu, 29 Feb 2024 00:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709165778; cv=fail; b=XMios+YFuSAc+UsA5V0VLKQJFAZEnQiLfGL2hHCDz3aEjzSb7KBChQrdK13Ia9ENizMFmwc+Nl/CvGbLeoU+eXzMV7OCfNtAPFT3hvHRI86sGphXeiAFdYE2BJVUIdvF/upCv46W5YjntE3/UH59B0eeVmtxASlGVeH7uJ5KDp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709165778; c=relaxed/simple;
	bh=EEOrHSRaicw+vyRiK6B/QVN+CwdXb4WQSptxIofG924=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ul4MSaQWRb8QcAw5ny9mJN3saAJ4sooYmqZpfrhnn+jmSUeHeQ+vJmXEvoVHywosvYymFEn328p3EDUEqYzAXIWEdTmx9nQBkC1ww3mSdFwfXvbN95aF5QQ0xZ4sAgiokX4D/v1gjOhhzyUtjpyfWfnltTJUv5xDU4eLUX5PHGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=elRIcB7q; arc=fail smtp.client-ip=40.107.114.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="elRIcB7q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzQiBqpufZ7m2cy7IhFJocpt/yho32uYcV6LPwTwQZKeeng+mnYOLXnA/DFMXnUcwdQyqiVllka9oU0iLoW1hBLuCSWYQkWrz+/gSxMdtzYyoRKXgF6IDq3pSwl7rTWZLd67PesRWk/fdwxISQsoxl8XLhfuZ0ngGF5ATwPvzpMSFkj3KUxPPW+4pYKPOTOuScFODYWMwR+eafuCSVFozv0VxNmqwDghjqfISdSOQoiGymdzjqY2tkqoKfO0Im+sVkdBhF3jcba/PWvBtedlo8+edB5r3ZKwEVhD5z2P8hqqHJlFmg/aNDecKJxsBK0jWE/TyjFg52Bp0Lqyvtt7Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEOrHSRaicw+vyRiK6B/QVN+CwdXb4WQSptxIofG924=;
 b=RnC3u10WmKiQfb3J2OFea31VlsH9STZC01IM0ZRYrCVR6nVhpU8DspRWoceqhBHamos8KIjib6BQLtDsKaYr8bj17HoHUTXr7tWRbfTSqvsKY6WpftmUzmK+DLQlX1ho8wr1BZOYIuiJ5J3lNMsFqwJpAGp0W/CoJc7dgYUnkthQdN/neUJhLWc8NpuNBf5O7dvZx9nNiLTO6qByn1FhRJWu5M0sIV7k4jdyvYzF/5138AR27+OCbWzZPYVV3eqELvEZa4zpSnSDRsSdQq2lk9Icbu90MC1VqPXVrmPko2KfDDWpaMyxt4qbdaufDVAmzAwqh8qJeCYN3nIHxSbKgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEOrHSRaicw+vyRiK6B/QVN+CwdXb4WQSptxIofG924=;
 b=elRIcB7q5C3PaE/59RYr0N6ib8m2g2DWGe03TR1/zkvc2gKAGLJEELSplHkAi6D5oR1KUqDQzD2ISuhsiUqm2o2VJ7ZH7Q98MUypJsyYKI2Bd74bIEOXHy1TEMdvPtnxltatQqAada18L2UO0FC+av0/gTpR8g928oqugh40LNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5608.jpnprd01.prod.outlook.com
 (2603:1096:604:c7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 00:16:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::1934:4a38:d599:33a2%5]) with mapi id 15.20.7316.035; Thu, 29 Feb 2024
 00:16:10 +0000
Message-ID: <8734tc86ra.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Eugeniu Rosca <erosca@de.adit-jv.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Takashi Iwai
	<tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown
	<broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	<linux-sound@vger.kernel.org>,
	Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>,
	Charles Keepax
	<ckeepax@opensource.cirrus.com>,
	Vincenzo De Michele
	<vincenzo.michele@davinci.de>,
	Dean Jenkins <dean.jenkins@siemens.com>,
	Andreas Pape <Andreas.Pape4@bosch.com>,
	Yeswanth Rayapati
	<yeswanth.rayapati@in.bosch.com>,
	Eugeniu Rosca <eugeniu.rosca@bosch.com>,
	Eugeniu Rosca
	<roscaeugeniu@gmail.com>
Subject: Re: [PATCH] ASoC: rcar: adg: correct TIMSEL setting for SSI9
In-Reply-To: <874jds88lb.wl-kuninori.morimoto.gx@renesas.com>
References: <20240223163502.11619-1-erosca@de.adit-jv.com>
	<874jdww2oj.wl-kuninori.morimoto.gx@renesas.com>
	<20240227120725.GA1141156@lxhi-087>
	<878r35qypm.wl-kuninori.morimoto.gx@renesas.com>
	<20240228094506.GA1150007@lxhi-087>
	<874jds88lb.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 29 Feb 2024 00:16:09 +0000
X-ClientProxiedBy: TY2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:404:56::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: ac523938-8635-4a61-364f-08dc38bba17c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zbZ7xjAVNMb7K5kfF1x/+vPXvElP21ozvSbWsXUF5UoB3bgAVzlLDSxFYxhT661ai0vgpEtezg7JMbD9PTr/e2jYKschP/6BR4eAJ3M3fg+6Na8z9r8aHxa8/r54wPctjs/kuoykWIJWd3oZi7mCRK/RrvCi+UdaheDDvafw/5ZaUKELdD1frKTC2T95aYeBUqzKuxaoIl1KwSPh9Fn2F2GNiNTb6qI0ujCiOephQR1PFv3sI3cFz8SE7gIARK65Uk5LHw/JybP73afHb6rg87gROJmMOQK7VRZfC0+3qNzvWm0mydrqWmxAyxUaM+QeQCyC5Z3lTwvLrmd7KS/jHQOyPBWCChQtDbQ9m70ZSQX3uf0nOuEKq3iPuvegbTQY2idRGMDMGtaV5HWwm61uGugYYhob869KHDz2dzE3qJqRADjjXqW0gT7KG/z7pqzsoAbrEM9CaacKNKOJMuWANWZMIYKGErp/tv4Pff3dvoNaA820uNNiDI1T11BrA5gnFLobBw41FuVTxjvEpIRfgrtnJQXTPwvDaZRvw8YFSbmUxhMIqCtYEVpj9QGg4HCGWr93ucKniaguxzLsU+3YlVPYPVOk/2mDirRAykQsC9gwnMk2sONTOYraMfwoJhh555Y52IXoG3e3T8dKoblgDV5NCvwQfT41lQ2KlObS6hsddW5EAWJZ+T8W7SuaVlgdISqCc/5AF4saI1u6jQE6TulPaMzZ591pw4/H920Ieto=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hkupo9pzj1wdldsqOLgmaAyrMp5pVqSZXbit0CxtYqtIr9DV5lovrfqd2RPE?=
 =?us-ascii?Q?YphXqCsqX3VtZHkNq4yV98V68d/eJqrxUMcOIymmbRQ0U1bE7n1xW64FE63c?=
 =?us-ascii?Q?RNPIpEhIimYC7fPVBqxdhH7R1jV5MNnBsPUH/1DeeZWtEY38S+ItJmFmEG4+?=
 =?us-ascii?Q?+AiSU4VpAFNSehoxRzkWKWbKV3egB+zhKorDt2nItFXhPCLCZ/vLooM39H9m?=
 =?us-ascii?Q?W1rFPyjgAuirM9m6sQ9UOvp6AH2E9CDdaFS5P35ZXfj13z+az9dyAOqoh+GQ?=
 =?us-ascii?Q?Pxg1QQUo+jTJIxrQuKNfr5Yazh5w92vRlC7Lj8JDzT43xuPSvTW+FLbShBFb?=
 =?us-ascii?Q?yvuYTg99Un55qItir1p6qvgKu81RBdemZpJt5ncfL5jDPkELFe9ufpPUQyF/?=
 =?us-ascii?Q?XzJAoXWcppGjUaopDZ9A+gxviCJhkv+sXTovyGiPmbFawTyKupN1Xp4rZJol?=
 =?us-ascii?Q?5zYozdNtBDG+Rh+3GlOL9t7cgIsKF92/QEoVziLITU+Bj/QP72G2ACfY6rIF?=
 =?us-ascii?Q?o9Y11nJTX9jeCFTyus18B7DNYuubKoA2li3cGzkbbGKFIqtNbM3fIGL/R9Yk?=
 =?us-ascii?Q?MNuJxe9kaxk541XolWrpGwchOQv114s4FrICCUwQQcxgjTaxzo5efaYx7H+A?=
 =?us-ascii?Q?zQWXC1BABACALCa/ryuttxfgyCT8h/sX9kuEQ/sGT7mZVYPaPOQqGeDw2uwS?=
 =?us-ascii?Q?u00esjVP3MHOC00GTx1k8juvKVsiKm2j2dz0jgdgzLVDOQmr2+b+TDti7l+h?=
 =?us-ascii?Q?aBus/lYMcOgEYtXsY0RvRkEFr0x1R1KwRA5UwzwBdMOtDpaqLSZ/QZYGpKYg?=
 =?us-ascii?Q?vT9d/IebMi1XzslUVlFKDmrYa1aeXE1Y4ezmh3Tpqynz3u4wlyqZuefwU9Ea?=
 =?us-ascii?Q?YfOCYDz/n9+GnohKy0vsB64YERpuPzLDcD0IgwCaJVX6a/FiODDwtoijQSiR?=
 =?us-ascii?Q?KkvkkX6i1OmWL8/Sh1kb+Iu8civU3VriTdfNzLB50S0Pnb/EyK1xvmos9IpT?=
 =?us-ascii?Q?qO2YnzM1Hqe5cP9MUNkyMG11hUNHH9L0Qb29lGcfWX3LHdEypHuZbTXVVtCZ?=
 =?us-ascii?Q?wiFo05Kxw+CwEeYnrmwCVpZFDJwkhMii9R+kAK2iuAXLCG5tryCclltinkHk?=
 =?us-ascii?Q?1P1QYwnTbOb9C9FXKh/oN5wnPAPQrWQGmSq+UGVkye6tnFvw+oDR8lZWsHw5?=
 =?us-ascii?Q?qoScsfDj0cKVT5gAHCj+G694eYZv2wjBg7GaKIaq5Vo/rYIy+5l9FexGiVVl?=
 =?us-ascii?Q?+OholUrUPQzhAE+P2A1v/OeMzTzVbrQP8p96T/NgaS+0ZE5Giaj/vnZkeOv2?=
 =?us-ascii?Q?UkTWSD3B39ko8csxVopKfXxSyYc590IoLZgf/8ixL+rLvZwfrF6oQqnwjM5/?=
 =?us-ascii?Q?6E5WrDH0lByvgLm7lixxDi4imqZ+kHqIeFlCLITM67yiB2ZOGaOklUcjEO7s?=
 =?us-ascii?Q?h8IZb9v/xwTwuGyhMZnLWwcY37OvrdsZUCti2hyCWLIiBcT37mx3LX5tBf9o?=
 =?us-ascii?Q?8v7tfPAkMt/vufVxW45JDwurJLGSXmSKOMIdq8BsBYhB8kgGQq5/dOeNalYP?=
 =?us-ascii?Q?CLI0YkiCRxdE+otlCdjaP4fYSyvbdhbX8GynsXDCCDhLkXzdJM3XtCr0hetp?=
 =?us-ascii?Q?wSDDe8OmbQwd5XQ88wK0SRE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac523938-8635-4a61-364f-08dc38bba17c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 00:16:10.0152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iaIYIg7/y/MHRaIEnq7C9qcOBksnCgU+mYnf3e8gmXlfKhW1NklsAkz0j07Usg4wv7BtQ5yiGoKgzYhuIiTsX/kYBgi3sWyP56N7lebOeMVSOZcp4AaQZY3Otgi5hezL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5608


Hi Eugeniu

> > A number of concerns have been raised internally, related to the fact
> > that the "optimized/simplified" counter-proposal behaves differently
> > depending on the value returned by rsnd_ssi_is_pin_sharing().
(snip)
> Could you please indicate the sample case of differently behaves ?
> For example, if xxx was xxx, original code behaves xxx, but simple
> code behaves xxx, etc. I'm not sure what is your concern...

Ah.., in case of SSI8.

> > While it may be clear for you that pin sharing is mandatory, it is not
> > immediately obvious to the casual reader/contributor purely based on
> > code review.

SSI8 with pin sharing is not only this function issue,
you can see same comment on rsnd_adg_set_ssi_clk().
# It is not clear for me either, I have been forgot about it :)
# and I have never use SSI8 before, so I'm not sure what happen
# if someone use it

If you have concern about it, why don't you add such error/message
when begining time, instead of each functions ?
Because of compatibility, rsnd_ssi_probe() is not good place,
so I think rsnd_ssi_connect() is good place.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
