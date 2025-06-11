Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0440227466C
	for <linux-sound@vger.kernel.org>; Wed, 11 Jun 2025 10:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749639322; cv=fail; b=thfvq86VE8p/Oo2Sp2D42+5ZZQJKGEMjOg5D7IPvMMhWrXy8ym7H2ISh9PC5ISzIYG1uEgh4CanbTRCcbAwTB7rhyDHtTIS0s4bud7UwmPgu0z/ac17yeAxwZ+w1gjTm5hbV0Zx4/nFnNgKGBXbn72mF5P3yomjv2FCvl5axStI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749639322; c=relaxed/simple;
	bh=j3HKyNzc7aSiFiaK5txOHjIfIjVMXTHTlVdRYh8++SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jj6SkKUrR0QRT3qHI17gXK6HtHzrR+MMBt4j23UH2WSHp/M/xxPsFqhIsNGh+Wl9Ccjqx0/CjGwOaiA1VynZ2GOtzfDrkAjqhGBfkcChqETU959aaT4HXisEXAISSaS0aJdkNeMfs8Xa8BPTP7lsWmAuHpq3CyWkVwkWRMED6CA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=c4To5xJB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FlxkXbJe; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="c4To5xJB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FlxkXbJe"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B4tp6G006417;
	Wed, 11 Jun 2025 05:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=pbYkUE0PeKn98aF2O6
	plgwDV7dVM6hjTRSaRTSyURRU=; b=c4To5xJBLxoYp8j49Xenc53g0nawtnK8fb
	7DMm4nFJwF0BKPJKXX296i965HPO1BVSNfJJ3U3Ol0PE9XP/5zwJZ4cUU3sBFM/x
	QeYUeiQI/IwSVxS/RyeiNjH8Cq+8gIV7c7ZkubQr3YhuKCI7kK0DXFxMplPjTro7
	dGYd7cAhzUeOqAhWw2lu6k+fsyk4KvchBEMZX84atY7YXBpqXRcNIGdxTA5noh+k
	SEMZW7ClyBeds4L7bj48dM/e6AHLCTMKt1Ebftz2YJ/dQdpssQOhIFoyzIgxnU1d
	XV4Gochp5jsUCcUYKzfM+a1seXHaHS0BEqCe+m1bYB02JtiyJUoQ==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02hn2204.outbound.protection.outlook.com [52.100.159.204])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4760mwu996-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 05:54:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nz5S4fh4WHFhgSQAv0zkXCto5BFRot46XYpW2hUWChkF1R4ykAn0a4TeUJ0eFwhcvODpPPvVje96SEL0ZTp/O9IR+c7xuHgmUApKY3jFQfpcrvly6oFKiroONxJ0THu/rE5GzcQ7hpvQZXGDCMHek68rjQayq/tbN5uTnIabEH33e+T7mWbfM5SFJL+usnYwbq/nVoBg3TR26Cn6i7GsHlyBfwpPN3o3t2CtFGvY1HHAvXgCS5WxiK2DgEjkNe0UDDo5baS62oLbR4H5GscaUNMXksW36ZIjgDr+ZZQdjy4vlUwkc9E+B5PRRJ5wSakaiWZOi4sFmUHWK0uOD31ygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbYkUE0PeKn98aF2O6plgwDV7dVM6hjTRSaRTSyURRU=;
 b=xDN9CKxiCNUd3L31pZhwnShjpzMc+qxBbrLzoU1bxrg+ZXKanakQDH8Fn8Nm0Yp2ea5bEz/g+g+UK1OIzsqXfG0lxBKIRui1QQdojAw5R115HPZCDJGFZMS/4Yox/zx82bWOVC+aHG+1sb9LtpyqFrIoXf93BXvZh+sv4zhgu3kzHmMroylEMxzXQAh7dbzrmFwgthruzVpVT0Zh1Qa2dE0C0iWlp9F4Gcen19/KyxYIzVP/ukvPfW3HyO0vA5uYu5J4K+iorckAtYhO9VCa9ull+3NL2AWf2jYC+kwnhd0vgeIPELDbh0sBgO45uDzDGFoqo0tVQO6FG2z0HwNHPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbYkUE0PeKn98aF2O6plgwDV7dVM6hjTRSaRTSyURRU=;
 b=FlxkXbJeQV5MWv32QLQHB72kMNtE7nRUrA1vBOXx2jLcnsQFiZmyrQqjk5k55TCU/AlGtOTRqHXOkXtGsAWtbfwMvm8tJnmgFrLzuQXQg870yT9CRGkH9PVCsfsQMFNwMXGbpmDhJYTHpvy0p0lILyrIJkR7sQ1KpKeLRUx0RWM=
Received: from MN0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:208:52f::29)
 by SA0PR19MB4394.namprd19.prod.outlook.com (2603:10b6:806:bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 10:54:43 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::59) by MN0PR03CA0019.outlook.office365.com
 (2603:10b6:208:52f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Wed,
 11 Jun 2025 10:54:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 10:54:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 61868406540;
	Wed, 11 Jun 2025 10:54:41 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 44E3C82024A;
	Wed, 11 Jun 2025 10:54:41 +0000 (UTC)
Date: Wed, 11 Jun 2025 11:54:40 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com, bard.liao@intel.com,
        pierre-louis.bossart@linux.dev
Subject: Re: [PATCH 1/3] ASoC: SDCA: add support for HIDE entity properties
 and HID descriptor/report
Message-ID: <aElgcGWx/mniRLlN@opensource.cirrus.com>
References: <20250611102549.563070-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611102549.563070-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|SA0PR19MB4394:EE_
X-MS-Office365-Filtering-Correlation-Id: 653771b1-0361-4a40-5e7c-08dda8d65f10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|34020700016|7416014|376014|61400799027|82310400026|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QiMVmqRoClmESHCET7hd+BcWTi5G21gat2O0SJ5ySaT/k6zEMU7v16TQk6dp?=
 =?us-ascii?Q?GHLjjZ0BAAGbmhTnbz9d8MBOOxyDweACNjB/UtaIjBVM1lWQ2kH/xQO4PUJ+?=
 =?us-ascii?Q?3qkcLZsAR0kk4JmDzkuoiihGU2rkz5RxZDZXtgT2SMcJgfppR32/b62wKdb2?=
 =?us-ascii?Q?trrgIj+8jUIZ/uSFAYzs/fDOL227Dd6A96QVovC1ydHFrqcFOjoV6pXLZNyM?=
 =?us-ascii?Q?0o/Pfj3QS8aMNdTN9yJxz+ddt58pjCBTLbhpRP17sgyfIJSS09eVX637DZfI?=
 =?us-ascii?Q?13SkDPIvxhfmYgvriviZOLbgSKvY6wiuu3a48e2xmlyvz1iz8Gf/XyVhOriQ?=
 =?us-ascii?Q?hz+blR6abtCY+VYT87g7N7vyk9e3yrQqfGClJIMWvM0g91dEg5+f7Cy/NXLv?=
 =?us-ascii?Q?6kF6+++Bfef3ClDfb0R2Ag6FO+FxT67UrTYGg/zkrx7zuEdaQEefyGigN9bi?=
 =?us-ascii?Q?mPaHfXtYG7gExpYOXu/7I3VBdgaq4Oy+2Ny1yqooGav0J82UdwZFscQO1YdQ?=
 =?us-ascii?Q?/TUDXS1Qa5FtLW5BmjLsHVv7AcjG5+aGOn7A5fmvRqVSb6DJEQ6nkNkKG+0d?=
 =?us-ascii?Q?UWxpulYactS9MgIYh38Y3JBq0Ywvpf+EpdIglO2y3uQaFexu8Xv6Ap+gImmv?=
 =?us-ascii?Q?rOP7FPiSPo8oU4G1K9L7GkaTOTdytC5IUsE8yiSZeqhuFW0/D0RN+yTrZ3Mn?=
 =?us-ascii?Q?pKhiSeIZsUy1Xl0p1dpmrHXthxkSBEYkL034fdBHJcffN9IKI8RSbj1C1ujR?=
 =?us-ascii?Q?JQd2peRJnkMjhb34XfgAhMn/rNE2Q+CjUbK0YBbfDfmjCloiJ67Lcxt24AUu?=
 =?us-ascii?Q?HIuwp1ToyrgRXGmstkbfU5yidn3g+mkLjMo5KpPBTFneJM/wMrIZJ/HT8TK4?=
 =?us-ascii?Q?8OSPz/xx1gdrayEww1bWXeiRgOLdcxcNc1Jfv/viloZvmll9g2mVuDcCky2N?=
 =?us-ascii?Q?bvqf1EdQcowdMKfltJ7GbmAxQYGKTuGtlRM/f9EhsvJRhn+24Lq+26P+oMfJ?=
 =?us-ascii?Q?idkXetHian0DGGKsc04QF9Bc6ju7E+PRBOvNMmvmbi3FZ0VJK035xRPE18Ad?=
 =?us-ascii?Q?3od5jNSNK0KF4HIvknCvpaRKT/nMQkjkagtobjCA/JiEjKL95Hdm2AIIvvn8?=
 =?us-ascii?Q?+pBmAeu5shbQwKsFqjV5fdrvYxoGKUkJh8u8h6PTuLk/35xfcdLKrCzSO+zZ?=
 =?us-ascii?Q?zyuwapLyCcvMG1haYpfZtOM0Ixs4anNUBut6fg0TARVWgTP9oSL0qLl3n2VG?=
 =?us-ascii?Q?Xtzlxwhd9/PGnOEk4/pSD7KvtXX91Td/oBlUds3EjH0gbmY3zhOHPUwC1DM8?=
 =?us-ascii?Q?Tq49KOtUjfm7SSmgap7gDw5kh/Xq9RZ5qtd7FfkYhuK5oQKbPUcARdeLbxqe?=
 =?us-ascii?Q?tcKFCSFf0s6agexNA+YebjniVgS1+Hd4VeFAUrxdP/jlTUmV1k9Ugc9yT4bY?=
 =?us-ascii?Q?TMd6dogmx+qTwS+Z3jJqoNvJP6Nv2llKN2X+8u2lEb4bB7+rAstdcRIDkekt?=
 =?us-ascii?Q?cqfkus3MUqoQpafdF/TLlwglYI/90ls0Lo/b?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(7416014)(376014)(61400799027)(82310400026)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 10:54:42.5776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 653771b1-0361-4a40-5e7c-08dda8d65f10
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4394
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5MyBTYWx0ZWRfX0cochGcpL6xS SyzAm1n1z3sXuWKRAscxHlJcBTkiFxzbp8vw6UegByC/WBmLmHhKwuINr8ZmaN9dZf0sSMp2Q82 mmGW/8CpAjq7hXU4cr67JODl7kRj5MHyy9A2pF4Je3/r7YNt0l9M2PsB6zCr492oNbzsF862WIh
 y4TPnraw1fLJImwUtXgf4tPyfSrc7WTJFze9vmIfSf7e9QzmfeykzDbuGXKHcv4CYT7QaSW0f2U U9Kewbg35P5U5lt0N7jPrScI3EAsF9xmoVvWLxMiRAEfd8Pho9HshyGXj+X1B2mil0qYHWUzsxm xIY7QT1eRsa9/tY+C3xI6UryqjolM09KMZ3cuqxw0lqyB2sYkEFiAWn7ioowEF9+4qlMK8kNVtp
 Av9KV3gHWvqEF2S783IF3ybo/yCfHP756eC9VXnCjzryBUcDFCik19YOfDrL4D0NpfOFKriU
X-Authority-Analysis: v=2.4 cv=coCbk04i c=1 sm=1 tr=0 ts=6849607a cx=c_pps a=ZZs8apLswjWZdO4LzFDIqw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=RWc_ulEos4gA:10 a=n9Sqmae0AAAA:8 a=VjFQ1vXQTzoD6Hv9_xoA:9 a=CjuIK1q_8ugA:10 a=UmAUUZEt6-oIqEbegvw9:22 a=jZz-an6Pvt0H8_Yc_ROU:22 a=VlVynqX4KLlZR1Cn4-IV:22
X-Proofpoint-ORIG-GUID: 9T9ywmOYmaMHf1iM18QhV_HZNz3WJVSO
X-Proofpoint-GUID: 9T9ywmOYmaMHf1iM18QhV_HZNz3WJVSO
X-Proofpoint-Spam-Reason: safe

On Wed, Jun 11, 2025 at 06:25:49PM +0800, shumingf@realtek.com wrote:

Adding Pierre.

> From: Shuming Fan <shumingf@realtek.com>
> 
> Add support for parsing the HIDE entity descriptor and HID descriptor/report
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
>  include/sound/sdca_function.h   | 29 ++++++++++++
>  sound/soc/sdca/sdca_functions.c | 83 +++++++++++++++++++++++++++++++++
>  2 files changed, 112 insertions(+)
> 
> diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
> index eaedb54a8322..856b0f40ce5e 100644
> --- a/include/sound/sdca_function.h
> +++ b/include/sound/sdca_function.h
> @@ -11,6 +11,7 @@
>  
>  #include <linux/bits.h>
>  #include <linux/types.h>
> +#include <linux/hid.h>
>  
>  struct device;
>  struct sdca_entity;
> @@ -1040,6 +1041,32 @@ struct sdca_entity_ge {
>  	int num_modes;
>  };
>  
> +/**
> + * struct sdca_entity_hide - information specific to HIDE Entities
> + * @hid: HID device structure
> + * @hidtx_ids: HIDTx Report ID
> + * @num_hidtx_ids: number of HIDTx Report ID
> + * @hidrx_ids: HIDRx Report ID
> + * @num_hidrx_ids: number of HIDRx Report ID
> + * @hide_reside_function_num: indicating which Audio Function Numbers within this Device
> + * @max_delay: the maximum time in microseconds allowed for the Device to change the ownership from Device to Host
> + * @af_number_list: which Audio Function Numbers within this Device are sending/receiving the messages in this HIDE
> + * @hid_desc: HID descriptor for the HIDE Entity
> + * @hid_report_desc: HID Report Descriptor for the HIDE Entity
> + */
> +struct sdca_entity_hide {
> +	struct hid_device *hid;
> +	unsigned int *hidtx_ids;
> +	int num_hidtx_ids;
> +	unsigned int *hidrx_ids;
> +	int num_hidrx_ids;
> +	unsigned int hide_reside_function_num;
> +	unsigned int max_delay;
> +	unsigned int af_number_list[SDCA_MAX_FUNCTION_COUNT];
> +	struct hid_descriptor hid_desc;
> +	unsigned char *hid_report_desc;
> +};
> +
>  /**
>   * struct sdca_entity - information for one SDCA Entity
>   * @label: String such as "OT 12".
> @@ -1055,6 +1082,7 @@ struct sdca_entity_ge {
>   * @cs: Clock Source specific Entity properties.
>   * @pde: Power Domain Entity specific Entity properties.
>   * @ge: Group Entity specific Entity properties.
> + * @hide: HIDE Entity specific Entity properties.
>   */
>  struct sdca_entity {
>  	const char *label;
> @@ -1071,6 +1099,7 @@ struct sdca_entity {
>  		struct sdca_entity_cs cs;
>  		struct sdca_entity_pde pde;
>  		struct sdca_entity_ge ge;
> +		struct sdca_entity_hide hide;
>  	};
>  };
>  
> diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
> index 64ac26443890..4a89067dcf76 100644
> --- a/sound/soc/sdca/sdca_functions.c
> +++ b/sound/soc/sdca/sdca_functions.c
> @@ -1220,6 +1220,86 @@ static int find_sdca_entity_ge(struct device *dev,
>  	return -EINVAL;
>  }
>  
> +static int
> +find_sdca_entity_hide(struct device *dev, struct fwnode_handle *function_node,
> +		      struct fwnode_handle *entity_node, struct sdca_entity *entity)
> +{
> +	struct sdca_entity_hide *hide = &entity->hide;
> +	unsigned int delay, *af_list = hide->af_number_list;
> +	int nval, ret;
> +	unsigned char *report_desc = NULL;
> +
> +	ret = fwnode_property_read_u32(entity_node,
> +				       "mipi-sdca-RxUMP-ownership-transition-maxdelay", &delay);
> +	if (!ret)
> +		hide->max_delay = delay;
> +
> +	nval = fwnode_property_count_u32(entity_node, "mipi-sdca-HIDTx-supported-report-ids");
> +	if (nval > 0) {
> +		hide->num_hidtx_ids = nval;
> +		hide->hidtx_ids = devm_kcalloc(dev, hide->num_hidtx_ids,
> +					       sizeof(*hide->hidtx_ids), GFP_KERNEL);
> +		if (!hide->hidtx_ids)
> +			return -ENOMEM;
> +
> +		ret = fwnode_property_read_u32_array(entity_node,
> +						     "mipi-sdca-HIDTx-supported-report-ids",
> +						     hide->hidtx_ids,
> +						     hide->num_hidtx_ids);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	nval = fwnode_property_count_u32(entity_node, "mipi-sdca-HIDRx-supported-report-ids");
> +	if (nval > 0) {
> +		hide->num_hidrx_ids = nval;
> +		hide->hidrx_ids = devm_kcalloc(dev, hide->num_hidrx_ids,
> +					       sizeof(*hide->hidrx_ids), GFP_KERNEL);
> +		if (!hide->hidrx_ids)
> +			return -ENOMEM;
> +
> +		ret = fwnode_property_read_u32_array(entity_node,
> +						     "mipi-sdca-HIDRx-supported-report-ids",
> +						     hide->hidrx_ids,
> +						     hide->num_hidrx_ids);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	nval = fwnode_property_count_u32(entity_node, "mipi-sdca-hide-related-audio-function-list");
> +	if (nval <= 0) {
> +		dev_err(dev, "%pfwP: audio function numbers list missing: %d\n",
> +			entity_node, nval);
> +		return -EINVAL;
> +	} else if (nval > SDCA_MAX_FUNCTION_COUNT) {
> +		dev_err(dev, "%pfwP: maximum number of audio function exceeded\n", entity_node);
> +		return -EINVAL;
> +	}
> +
> +	hide->hide_reside_function_num = nval;
> +	fwnode_property_read_u32_array(entity_node,
> +				       "mipi-sdca-hide-related-audio-function-list", af_list, nval);
> +
> +	nval = fwnode_property_count_u8(function_node, "mipi-sdca-hid-descriptor");
> +	if (nval)
> +		fwnode_property_read_u8_array(function_node, "mipi-sdca-hid-descriptor",
> +					      (u8 *)&hide->hid_desc, nval);
> +
> +	if (hide->hid_desc.bNumDescriptors) {
> +		nval = fwnode_property_count_u8(function_node, "mipi-sdca-report-descriptor");
> +		if (nval) {
> +			report_desc = devm_kzalloc(dev, nval, GFP_KERNEL);
> +			if (!report_desc)
> +				return -ENOMEM;
> +			hide->hid_report_desc = report_desc;
> +			fwnode_property_read_u8_array(function_node, "mipi-sdca-report-descriptor",
> +						      report_desc, nval);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int find_sdca_entity(struct device *dev,
>  			    struct fwnode_handle *function_node,
>  			    struct fwnode_handle *entity_node,
> @@ -1261,6 +1341,9 @@ static int find_sdca_entity(struct device *dev,
>  	case SDCA_ENTITY_TYPE_GE:
>  		ret = find_sdca_entity_ge(dev, entity_node, entity);
>  		break;
> +	case SDCA_ENTITY_TYPE_HIDE:
> +		ret = find_sdca_entity_hide(dev, function_node, entity_node, entity);
> +		break;
>  	default:
>  		break;
>  	}
> -- 
> 2.34.1
> 
