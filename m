Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB43288CA7
	for <linux-sound@vger.kernel.org>; Wed, 11 Jun 2025 10:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749639373; cv=fail; b=hsew5PYkikByU7bCTtOhjFAPEKUVvqSAO624drmkHaqLLdU6zQxyTSrJAHP8/mqLva9Xp93QWHE6RfV7fGLhpNiI10xWrKJh+MhujGN7H6UydelLqY0XqW2Bwlmu69sVauJL3vlEsqKfHMvJ4NB2VDMFXgWDW2AF5VCsSs1HlsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749639373; c=relaxed/simple;
	bh=b0PXrMpCir5PwcqTp29O1K6LO/u4AsSYuaDsXc7nDHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyFXArlU3h8iJgMLxlLlCEyrRE7wDAMHag9aYYdpZvA4VZLyneu4qf7k1/1CoSLoYU+wumhQw1bAJofz8uAYJMW+QDqLs+7iDFqUz6+cbqEJMx2oRv1f5TfzllJ7D54qRYfchJK29g+sG6ix2hWgTn0vZx/deh1ORZuaMpWdEws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qd7fAtZm; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hkn+m/0h; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qd7fAtZm";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="hkn+m/0h"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B7OvAk027765;
	Wed, 11 Jun 2025 05:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=qWJN3QEyP8huDalb1p
	KWO2FOib1i3peVYnD/uu1Mtxo=; b=qd7fAtZmiYR8e+eVbSpox5pR6UNSQLH/be
	+5chqpr8k98caZ+wmvrxNOe33ehxm/7FxdbfvXwsdOwZgfMxq2sapvGKgy4oVdyq
	t+w1e1Pct4BHsoHAG3cWD5NuQJN+raeE/C1dtUD5FtJdrP9xstDfhSSzTdP7Ly3o
	xxP9bLXkLENSFhQey6i8SCWrBAuxCQJkfF5NVTkGwtKepuUUnm9ZvEFtKFOyyRxz
	XobNpwg0FM1BR9gek0hc23Lh3Oz1+7PYTttMoEo+aRLkXsNy9BdQ1lXK56NNNZw5
	mFqe7pEXsGzwzbPil3DzceSuOjFFOoZXJA/nIxpcveJ+4KHOH2gA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10hn2205.outbound.protection.outlook.com [52.100.155.205])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 476ksd9xku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 05:55:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ak7hundyAH3HZgeneto/S39rW8C0OQQ+KFPB8Lcko01PMZ3kiCnIQngGC/qVBkqvws6nY2vJfrzVTJMHx//AdpSWnVAh8Mq3SDJNTC4/+wws1+vcYjVKXRn3CbfDb9wXs8ai+hdiD/QvNlq27o4U9dhzFqN7nypTpRUmAoluBtv5F2TZtXuUpo/gLQ0dsqI4VXSjMIdHAxgwJmr8FRCV6PhIqpoD5bRQEkE6lXhjy44BWkzE3YgJfAplG0/nNHrvJpfD1a9Xg7Y2qQJ8Zz+Q1DJmCIe6kymD/BHCe/YDpG34K8EqwdXijNqVgTdDNMdb7wyEy7Z4HA2oJ1Gev7HVpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWJN3QEyP8huDalb1pKWO2FOib1i3peVYnD/uu1Mtxo=;
 b=QF+0f4GxzPA6UVTdqXW+o5UsDkj8w5zYlCo/Ob8XHG3aFb3aWeMrNRMbPeyaqbEn62killTkCO0Lhsug4KQXNo48Xb1pjRny+vHKFr/YNQBGITmJiMnIyfPSWn+jNhGQ78ysSLiMDZTonCxI2ayxzPnZjv+b7vlrwq166OAbUZIK/yejerEjfaFBZ4ofAxpLM2LEU8Y8pctwkU23QUxphLPCkfveJyS6d2w51HEI862IdAntaNpmFatrUpl10ufHd43XqlITFoOWN1C+HJx6xgdf+XysLedBcxzlA5wYwn9EKBLOEHiazJ37CXwP9k7Ivn73KH/crR9h3B2uxov6dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWJN3QEyP8huDalb1pKWO2FOib1i3peVYnD/uu1Mtxo=;
 b=hkn+m/0hN7Jdt7DCbUlEW1IAQklJ9Qr/ma1aFVivX6OysMc5W0wJrx7Pmmut2DBgFVZkqd+yfJy6XSTs+cfBkIQSNad0UYro5mf687840KoBQFQWOrsVmamC0/6dfAOrYGfzAY/aZ/K+KpofVUSL9p0SyYSWMO8E/WxOs35B5Gw=
Received: from MW4PR03CA0103.namprd03.prod.outlook.com (2603:10b6:303:b7::18)
 by SA0PR19MB4190.namprd19.prod.outlook.com (2603:10b6:806:87::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 10:55:34 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:303:b7:cafe::2a) by MW4PR03CA0103.outlook.office365.com
 (2603:10b6:303:b7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 10:55:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 10:55:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3B819406540;
	Wed, 11 Jun 2025 10:55:32 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1F18882024A;
	Wed, 11 Jun 2025 10:55:32 +0000 (UTC)
Date: Wed, 11 Jun 2025 11:55:31 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com, bard.liao@intel.com,
        pierre-louis.bossart@linux.dev
Subject: Re: [PATCH 3/3] ASoC: SDCA: add a HID device for HIDE entity
Message-ID: <aElgo/oalHlGRu6g@opensource.cirrus.com>
References: <20250611102709.563179-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611102709.563179-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|SA0PR19MB4190:EE_
X-MS-Office365-Filtering-Correlation-Id: c3ec7bf3-59ec-4151-b67a-08dda8d67d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|34020700016|376014|7416014|82310400026|61400799027|13003099007|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bh02QKj4H5L4YnMKw0q1l+eD3vS3l0aLdyzCePL8SFnDpGuorBAyq3JuztCo?=
 =?us-ascii?Q?T81gK2I3hu+2AsVwq6+MV981zQbbmVlbxkWaCiRUrQaZpkqfyqkY2dQDYVur?=
 =?us-ascii?Q?24uiXM5Cc44N5x5S2LSQeozYPnyXss9xfWJLPkjMk56rQ724h18lyeXL5d6x?=
 =?us-ascii?Q?IcwRgosrDtJe/KjvXJZ25VXpR0LLGv7U43SlJ8+HXq8hX2FZYnU88BZaob7C?=
 =?us-ascii?Q?/XUSYySDzHweSqNPGYTh5NFU46DCTu8dBW0aqQglY6f2bH5oQnrZrFhYVczg?=
 =?us-ascii?Q?bzREC5rfn9ojxrQ0ur7QNHjVTL3JzPzSu/bK1FvurfFE8gFulSS1EhRiNs7m?=
 =?us-ascii?Q?demlT7oxxTPAazOwaDeECxVF1naPl+qWa2XL7oZ/cOvqdKp2d5QI7J8+fwaT?=
 =?us-ascii?Q?qVMrJl6Pws92qJJxYqr+mL11i8dzIJ007YFUAIJZWiBDN5xGosWnbNx55xaq?=
 =?us-ascii?Q?XPyhv/5nDUw86BmP3O+Rt9Tb9lRtqKCZaaHyJaQrDuTlADw+a1TdJWEVCRO0?=
 =?us-ascii?Q?/IMXOM9NQgOsr6PHXJufsOAUuIWaP3/Wej7kPsTmrFu5NYW21m+moWafiSRN?=
 =?us-ascii?Q?0Mzcp+Yb/SFIdfKPOVyC4cI2uUpcf6akzhX4sVIpAE9faXCQ5SHLHYTc2yFd?=
 =?us-ascii?Q?fugzm1YyWwkjqr5EwoyJsJYpWL237uEnp67LcUcqfpTB3RsCCGXVJ5cFNrDK?=
 =?us-ascii?Q?56yjf+VyUW8IpzjiKia2wqWCNWNcHO2tYyhOmQEehD0cbDz3oWEYWw2tBZ79?=
 =?us-ascii?Q?aNBC/Fb0RhF1RHxlq9MR6OfeU46ouZhqyi++FmVtfzaXFknB0XRPMvLErvbg?=
 =?us-ascii?Q?MaotOiv7fujo75LsdTIl74Fg930Fdt7loEnHhImzw7oYvU9fekS7Ph8kDjrO?=
 =?us-ascii?Q?N7TSjOZImGuFPeUgv0Pu3aauUnLcsfhiLInDT7y8oO7XcJThvP2nzZbl8eTU?=
 =?us-ascii?Q?OiN6aI6fbVRi2h7q+DJ4TV9L0ZYYaDVTSOgmzrpcnj893jNk7gKPP+r7a8AR?=
 =?us-ascii?Q?DU/q8iXm5lxvJZaawFESTli2Bnn99Bw6HoJFlHnQylK3ooKeuE98L6a80soY?=
 =?us-ascii?Q?mHeFEX4gQSmZrg74XwrXtt3jsT0zZ8TtVJOzf+FGYPmvu6mZxwPlqfsz78ie?=
 =?us-ascii?Q?kwktFDwQt9q9Yyjk2tYUm9Tb6s0H7gtmYN0UCds5dvs5tgr05tR7ELkfnsGa?=
 =?us-ascii?Q?IW5P2/WSkqDX1H0K39RZgPgGkXD8otNkLultAq9UeMSHv4FmyXhd//h0NEgE?=
 =?us-ascii?Q?MltM1GeBHqTXHtjn2p6pm6gW/7YcDkcJeOuI62mTGJO5PiPP1Y3g80eSJ8lK?=
 =?us-ascii?Q?HQlIoNpi2cIU5LONj145wGE2tQucB90LLme0U2IZ61rM29MCHsxkKgEMhXuv?=
 =?us-ascii?Q?GTQoYf4i8xNlsmvmdN/8aWruMUhnY9A3G6dN7sPfKLf1P72KJH91ZXqLdCEH?=
 =?us-ascii?Q?1AdpbLqBv9CrtD0v7Cmw0selt0hADGS35YF1TgRZunOFe4gtatAJ2w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(376014)(7416014)(82310400026)(61400799027)(13003099007)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 10:55:33.5104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ec7bf3-59ec-4151-b67a-08dda8d67d79
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4190
X-Proofpoint-GUID: 9c0nnUGo_uuG4Hevcnlf-oiV4fB7OizH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5MyBTYWx0ZWRfXxKR/4q5jrRh7 sRVX/A9OFL71fkxHw/kVgSy/Xn5fOwWVduoa9bJrgUHnT+87bhNeW3k0JvGTzanZf6MfzkVZjDl 2pv66DAjvyADjEgXfVWlF5uxq/MVhbfQ6RaDC4O9RcCfzy99rf/m085tr1baIsGijtUwNzV4vrL
 j/+VbpWq1ftgmSP3meohMB1k/++5Ac3jTN2Yu4o50OO7YVGIC1B+G0dl3rH8OZZj5Y0xtnMW+av TTuP+EXGuDSQm0wnPv+sCqXE94d+ebcA4UchtS8sP45dDKJM3dNfnD+ZKA4h6nSeLiYB7pXmqvT 1rV1F2a5VLK5E5EVUoufwDvbZsAQDX5MbCTclD0he5KM/ZES9yamnLzY4/5u8RHkyJGgkcX/xBJ
 AN5poQx60TyuQIKXStDfm3hL4GkQyuPHCqb7ah5pUraBMGJBCD4ZRVou271nY4gOHggPwwIp
X-Authority-Analysis: v=2.4 cv=c5OrQQ9l c=1 sm=1 tr=0 ts=684960ac cx=c_pps a=LBzlei5oLQ0mdBwmGAYK4A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KJT-RnjOAAAA:8 a=n9Sqmae0AAAA:8 a=anRmsjPirKbq13nJy6EA:9 a=CjuIK1q_8ugA:10 a=HE_01F9_QflCRFonrIQr:22 a=UmAUUZEt6-oIqEbegvw9:22 a=jZz-an6Pvt0H8_Yc_ROU:22 a=VlVynqX4KLlZR1Cn4-IV:22
X-Proofpoint-ORIG-GUID: 9c0nnUGo_uuG4Hevcnlf-oiV4fB7OizH
X-Proofpoint-Spam-Reason: safe

On Wed, Jun 11, 2025 at 06:27:09PM +0800, shumingf@realtek.com wrote:

Adding Pierre.

> From: Shuming Fan <shumingf@realtek.com>
> 
> This patch supports to add a HID device for SDCA HIDE entity.
> The codec driver could call 'hid_input_report' to report events.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
>  include/sound/sdca_hid.h        |  25 +++++++
>  sound/soc/sdca/Kconfig          |   4 +
>  sound/soc/sdca/Makefile         |   3 +
>  sound/soc/sdca/sdca_functions.c |   9 +++
>  sound/soc/sdca/sdca_hid.c       | 127 ++++++++++++++++++++++++++++++++
>  5 files changed, 168 insertions(+)
>  create mode 100644 include/sound/sdca_hid.h
>  create mode 100644 sound/soc/sdca/sdca_hid.c
> 
> diff --git a/include/sound/sdca_hid.h b/include/sound/sdca_hid.h
> new file mode 100644
> index 000000000000..8ab3e498884e
> --- /dev/null
> +++ b/include/sound/sdca_hid.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
> +/*
> + * The MIPI SDCA specification is available for public downloads at
> + * https://www.mipi.org/mipi-sdca-v1-0-download
> + *
> + */
> +
> +#ifndef __SDCA_HID_H__
> +#define __SDCA_HID_H__
> +
> +#include <linux/types.h>
> +#include <linux/hid.h>
> +
> +#if IS_ENABLED(CONFIG_SND_SOC_SDCA_HID)
> +int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity);
> +
> +#else
> +static inline int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity)
> +{
> +	return 0;
> +}
> +
> +#endif
> +
> +#endif /* __SDCA_HID_H__ */
> diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
> index ee20b9914aa1..ec28855fe3b0 100644
> --- a/sound/soc/sdca/Kconfig
> +++ b/sound/soc/sdca/Kconfig
> @@ -9,3 +9,7 @@ config SND_SOC_SDCA
>  
>  config SND_SOC_SDCA_OPTIONAL
>  	def_tristate SND_SOC_SDCA || !SND_SOC_SDCA
> +
> +config SND_SOC_SDCA_HID
> +	tristate "SDCA HID support"
> +	depends on SND_SOC_SDCA && HID
> diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
> index 53344f108ca6..9af46e7edfd2 100644
> --- a/sound/soc/sdca/Makefile
> +++ b/sound/soc/sdca/Makefile
> @@ -2,4 +2,7 @@
>  
>  snd-soc-sdca-y	:= sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o
>  
> +snd-soc-sdca-hid-y := sdca_hid.o
> +
> +obj-$(CONFIG_SND_SOC_SDCA_HID)	+= snd-soc-sdca-hid.o
>  obj-$(CONFIG_SND_SOC_SDCA)	+= snd-soc-sdca.o
> diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
> index 4a89067dcf76..093c681e9387 100644
> --- a/sound/soc/sdca/sdca_functions.c
> +++ b/sound/soc/sdca/sdca_functions.c
> @@ -19,6 +19,7 @@
>  #include <linux/types.h>
>  #include <sound/sdca.h>
>  #include <sound/sdca_function.h>
> +#include <sound/sdca_hid.h>
>  
>  /*
>   * Should be long enough to encompass all the MIPI DisCo properties.
> @@ -1294,6 +1295,13 @@ find_sdca_entity_hide(struct device *dev, struct fwnode_handle *function_node,
>  			hide->hid_report_desc = report_desc;
>  			fwnode_property_read_u8_array(function_node, "mipi-sdca-report-descriptor",
>  						      report_desc, nval);
> +
> +			/* add HID device */
> +			ret = sdca_add_hid_device(dev, entity);
> +			if (ret) {
> +				dev_err(dev, "%pfwP: failed to add HID device: %d\n", entity_node, ret);
> +				return ret;
> +			}
>  		}
>  	}
>  
> @@ -1933,3 +1941,4 @@ EXPORT_SYMBOL_NS(sdca_parse_function, "SND_SOC_SDCA");
>  
>  MODULE_LICENSE("Dual BSD/GPL");
>  MODULE_DESCRIPTION("SDCA library");
> +MODULE_IMPORT_NS("SND_SOC_SDCA_HID");
> diff --git a/sound/soc/sdca/sdca_hid.c b/sound/soc/sdca/sdca_hid.c
> new file mode 100644
> index 000000000000..b227ad94d08f
> --- /dev/null
> +++ b/sound/soc/sdca/sdca_hid.c
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +
> +/*
> + * The MIPI SDCA specification is available for public downloads at
> + * https://www.mipi.org/mipi-sdca-v1-0-download
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/byteorder/generic.h>
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/dev_printk.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/types.h>
> +#include <sound/sdca.h>
> +#include <sound/sdca_function.h>
> +#include <sound/sdca_hid.h>
> +
> +static int sdwhid_parse(struct hid_device *hid)
> +{
> +	struct sdca_entity *entity = hid->driver_data;
> +	unsigned int rsize;
> +	int ret;
> +
> +	rsize = entity->hide.hid_desc.rpt_desc.wDescriptorLength;
> +
> +	if (!rsize || rsize > HID_MAX_DESCRIPTOR_SIZE) {
> +		dev_err(&hid->dev, "invalid size of report descriptor (%u)\n", rsize);
> +		return -EINVAL;
> +	}
> +
> +	ret = hid_parse_report(hid, entity->hide.hid_report_desc, rsize);
> +
> +	if (!ret)
> +		return 0;
> +
> +	dev_err(&hid->dev, "parsing report descriptor failed\n");
> +	return ret;
> +}
> +
> +static int sdwhid_start(struct hid_device *hid)
> +{
> +	return 0;
> +}
> +
> +static void sdwhid_stop(struct hid_device *hid)
> +{
> +}
> +
> +static int sdwhid_raw_request(struct hid_device *hid, unsigned char reportnum,
> +			      __u8 *buf, size_t len, unsigned char rtype, int reqtype)
> +{
> +	switch (reqtype) {
> +	case HID_REQ_GET_REPORT:
> +		/* not implemented yet */
> +		return 0;
> +	case HID_REQ_SET_REPORT:
> +		/* not implemented yet */
> +		return 0;
> +	default:
> +		return -EIO;
> +	}
> +}
> +
> +static int sdwhid_open(struct hid_device *hid)
> +{
> +	return 0;
> +}
> +
> +static void sdwhid_close(struct hid_device *hid)
> +{
> +}
> +
> +static const struct hid_ll_driver sdw_hid_driver = {
> +	.parse = sdwhid_parse,
> +	.start = sdwhid_start,
> +	.stop = sdwhid_stop,
> +	.open = sdwhid_open,
> +	.close = sdwhid_close,
> +	.raw_request = sdwhid_raw_request,
> +};
> +
> +int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity)
> +{
> +	struct sdw_bus *bus;
> +	struct hid_device *hid;
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	int ret;
> +
> +	bus = slave->bus;
> +
> +	hid = hid_allocate_device();
> +	if (IS_ERR(hid))
> +		return PTR_ERR(hid);
> +
> +	hid->ll_driver = &sdw_hid_driver;
> +
> +	hid->dev.parent = dev;
> +	hid->bus = BUS_SDW;
> +	hid->version = le16_to_cpu(entity->hide.hid_desc.bcdHID);
> +
> +	snprintf(hid->name, sizeof(hid->name),
> +		 "HID sdw:%01x:%01x:%04x:%04x:%02x",
> +		 bus->controller_id, bus->link_id, slave->id.mfg_id,
> +		 slave->id.part_id, slave->id.class_id);
> +
> +	snprintf(hid->phys, sizeof(hid->phys), "%s", dev->bus->name);
> +
> +	hid->driver_data = entity;
> +
> +	ret = hid_add_device(hid);
> +	if (ret && ret != -ENODEV) {
> +		dev_err(dev, "can't add hid device: %d\n", ret);
> +		hid_destroy_device(hid);
> +		return ret;
> +	}
> +
> +	entity->hide.hid = hid;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS(sdca_add_hid_device, "SND_SOC_SDCA_HID");
> +
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_DESCRIPTION("SDCA HID library");
> -- 
> 2.34.1
> 
