Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE811A3172
	for <linux-sound@vger.kernel.org>; Wed,  5 Nov 2025 14:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762352759; cv=fail; b=PlZ3J9g3B15GT7U9e16ziU2AsanQ9B4Vv7PI5hA1pTdpsGStmxEAg+9rt4oURbnFe0/zWRe35ZQWKRKKxZ+06VUH+qD959jhW1r0VeWd98uWhx+XQmN5ioW9Vao+3nGlUjiRprdVdCyG0LVQcSD6w32f2MtSwunXWDGC6FMak5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762352759; c=relaxed/simple;
	bh=+YeAtv6Xm7eDa3JTbgIigN9xA+DlNPHVSav0q7l9Ais=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzSEB6hQuGa/BMqT0YIjNsaPShj9QD+l5imqLEFJNBnWOGUpLUMZfrnSgnzyG6L0k4l1k/0/mTaTX0vDMby0owvhy+1dhMv1dxF7ThrDpp7LSXWkx9aZwwDY8ewqG0do6YAq28GiuyyWglxV5JDN9MHFh0QB5d6hXYhhBtxIdSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gm0BkfTV; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=BDZNEwJ0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gm0BkfTV";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="BDZNEwJ0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4NA9s03342095;
	Wed, 5 Nov 2025 08:25:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=jXEuxF/lSS0wyKtF1l
	OmtPPgmpS4CFQxmV5QSRHxY3s=; b=gm0BkfTVF2tvX2KO8oBkYHp1u1E4oy8PD4
	5xgdfPU4RZ6MYSDnInRjxRz+9aH9YC/pg4/yAs1cd3Viw1SzxCUPhcDQOhqLdT5W
	MIvONMgHMVAsSBDvSw1AFPAwUA9WYjomhTzTdmro0Rir+U/jTJMymJZ7NpSi+dTO
	Hz5grVMnydafRKaPQYJMN3dG3Ue3WGdPRtgoxm+iVXU6jfU24bOblSfOoq39pxTL
	CikAMGjJhurHaDeyBuUyv3B5W7a31DcC2P+DP4v8FOhuFOYQ4z6ogJ3gEu7WC8yJ
	bfYErj8rIEBEpFno8NhELG8hle0e+rPCprfSYfHzoQ4mQsnzjtzA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020087.outbound.protection.outlook.com [52.101.193.87])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a7bwx1yq7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 08:25:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4NZ4UTlXftdjr7LNRGq8e0PM26o2ASwbtpqgg6DIV5zgtw2mudobKK89o8d/gj+2eMLJe87qPoTM7wPMxw3qOd80PhZORfpqftVQ6d0P7i6AHcXymNSr53TIrKoAT0G/x78Tp4ZGTo8jRpwXD9AF8zecz4RiF7vS0MmJKJ3vwQ9EsNOg6SPWdnHDi3saCYw3WGTaliUSFZi2gvnBfjfMbX9NhpFHdFFgBeWnyq/l55E+//xQWK1JNcKqTEE92enG6dkjbsBqao3pLgLZDvR0wLRVfMGbgU7v617yESM2IP8Jw+Gw231DtYFrZWPDO7jHx7SlhiKq65v/pL4bsSuog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXEuxF/lSS0wyKtF1lOmtPPgmpS4CFQxmV5QSRHxY3s=;
 b=gtxx5ykHYw09Lpxn/CzrdBfNp4fRAszmHGVS5IlfEU4OopC1a8+PxFbIW4t0qkHX72L5fBKQGs3Ku+FH3a9/qKwRM+19agjgmL/usPjUd0ps1Yg6tlap5JVf/7dLCKY1gcU/Wv7IpScU6bXUx2VDTUng25WR7erb/mMhNXCoMxQS9ZxceU7b4FCRFtYHgVZ8DOdnpZw9JW8nzu1lk9m2tRkq6wPa1wvVrBW9lj4BqKk5lfC4niiV3XaoueDrF1dy7sirTX8mhbXKwKlbPa8e3oE+QCoSExY4TwS1bKKNA/+y7hSYHPfZb4LAJyMyKcMcqrQHnmHPwLO3VLg4wIe96g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXEuxF/lSS0wyKtF1lOmtPPgmpS4CFQxmV5QSRHxY3s=;
 b=BDZNEwJ0ZKLvvVb51NTTRtlg6cC0Ukrd9wjLMsOC4zvdAUvmtdIFneNM8gAxvHGICAnVih18TOXa3C0flZMvbzr8uuNT0gSPrI7/+8U7y96MQlcacsg7JEKnIxpDvCzLP7oRkn2FdmNEXwaFguPqc/NWZIAY6DEwcimHTa0n/h0=
Received: from BL1PR13CA0086.namprd13.prod.outlook.com (2603:10b6:208:2b8::31)
 by IA3PR19MB8616.namprd19.prod.outlook.com (2603:10b6:208:522::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 14:25:31 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::6f) by BL1PR13CA0086.outlook.office365.com
 (2603:10b6:208:2b8::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Wed, 5
 Nov 2025 14:25:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Wed, 5 Nov 2025 14:25:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 671EE406540;
	Wed,  5 Nov 2025 14:25:28 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 545CA820257;
	Wed,  5 Nov 2025 14:25:28 +0000 (UTC)
Date: Wed, 5 Nov 2025 14:25:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH] ASoC: SDCA: support Q7.8 volume format
Message-ID: <aQteVxu1gLyzbfLs@opensource.cirrus.com>
References: <20251105091122.495561-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105091122.495561-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|IA3PR19MB8616:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad88113-96d5-4a6a-dd5b-08de1c772c2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BWShxlLw7j3wUJ94Md/GmhjmOoYEVlRO3fq9+/AQCMoQGh6h/y4BYGwFALbS?=
 =?us-ascii?Q?KAbf3DvHVJ7M4Ly+7u5AqhP5bbpMsAyZ8MwdWONgTqAPIoEOP8CRoKxPZhwQ?=
 =?us-ascii?Q?Yqc+cfgYbQRtUuS2bdSC1HYPbvuVYgHCSYu3p6FPv58f70RFt8HG1n3Z9G6p?=
 =?us-ascii?Q?qJGZBA3ekqI5ST23jCm1n0x6KgysVukQlFPSkDYIZKGq4OCEhqqGS1GHp7dP?=
 =?us-ascii?Q?vh9wbwoeMsIYfNwImmbr2weQNcZSd+e6sq4CzgGRkjSHUGWNLqytGQCRObl6?=
 =?us-ascii?Q?w0E5vBV4h0F6UYEQ3kjv1lbYTg/fYsL7IkUuE1lOcm7QTvHxcI+PEQXfaUNS?=
 =?us-ascii?Q?yoCCqmHYxHUTwU1p+PoX3tWvsVud73TGhnBOvuIqWVGc5z2tA+gZRLJ9ukx5?=
 =?us-ascii?Q?3XathOOm83/NTeZilUtRPjwRvszhdzODIastDLHIio+hrG1pg7fK5zU5Fs81?=
 =?us-ascii?Q?Ey/Hvk5YkUTfIGYgDWE1rV6Lmp1hORJpTKY6gvySeMGZM0uneNumPjCeB44i?=
 =?us-ascii?Q?pmJ/EHCbx5+P6/xcKKgvsS2WpjkLrGVpKBUBjjVZWkG8aguhU50QmtLwxJCh?=
 =?us-ascii?Q?svBF8/Gj8kVPAGOolc/OBKLaSQgqhrUhHFxPoiOV2PZaaqBIjgt7zh4AF1OL?=
 =?us-ascii?Q?W4lH8JRZXXgclaAwIKtX/Kv6CjU+oalaYq3aMQUSDEwEaFKw9V5MQ5DSreDv?=
 =?us-ascii?Q?y6hZU2TkSH1xMFBKGh1uToPoWscxmoaGj3/J12x+zg9SoPRJT+SubSzQMd6X?=
 =?us-ascii?Q?2gCAbhRDGbwGtHOzIqUIafQkplHCgVPsaRpfjP0SzyT8ix6jXEiY38Vd+SsA?=
 =?us-ascii?Q?8c7yPIh2oyV6Igw5V5yHZtVr+el6cUgR5UnAh2jHpitv3k3bXi0Q6magq26Z?=
 =?us-ascii?Q?m4tJys1hqb9Yc2Es5fZwIlDttnM1xhnNN4LqWK8i+6rgAdQS/D7S1dp07iin?=
 =?us-ascii?Q?TQ2Pv4/NcIPX04IqIVwpUMHA+74hplaH8RXZMw8l9SxiHG59IPMAlOSno2Lf?=
 =?us-ascii?Q?6EiJqdcqHYA+wACOMgZJKPVzEmc0NsON3a09JTDyw5d9jhDC6njUbI+cc8YE?=
 =?us-ascii?Q?j9QkbeCT011wGMk9I6iIc3U4ApBgG+Fpm5YIbFBXqdXwuRaFPy9zxlqr3d+O?=
 =?us-ascii?Q?ubmoUYs6yQTerFL6MsEU4Slvwxyja21yTJ3KBPyX1Vxs89LRlQzC6SkYPbEQ?=
 =?us-ascii?Q?00v1z2I6qEJuGCi6UdA2MkQi623u8syu3hY24DU+XskeNdoYz63z16Ttdnxg?=
 =?us-ascii?Q?Wl9GOM7m8fqw24xCMkTrtRaxemPjJU/LSu2B+x/zxiFCS5l0E9E+qgtNRGFB?=
 =?us-ascii?Q?KuPXUSCTiYYgIWLIHGVLFrwxAuPl95L7gODncmOAVWWj9F/1So9b4OCDNcvj?=
 =?us-ascii?Q?54N0n6olsjcp4pSFz7FAwjoq+OD1ullxH/GgCYkHdhkvLFJnscF4BJUjnHTA?=
 =?us-ascii?Q?VzlzyMaZWHTYRblYIV3pTpkQzBo71GFxVS1SewurtA0u9z1qBtyTLWeg4HRQ?=
 =?us-ascii?Q?7G8AIax2/Vmn3MTe+BPzBRr9vXdUx8D0b5ghQHJJIZIQgCey7KkxwonedABO?=
 =?us-ascii?Q?Y+CFR7rJLrqZOV9qwcY=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 14:25:29.8955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad88113-96d5-4a6a-dd5b-08de1c772c2d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR19MB8616
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEwOSBTYWx0ZWRfX3ag38CjXL/Ca
 HyzlPDy+Zs8XQEcrgXhzJLRz2L8raPk/2Ep9aK5Y6wIhKXx8ubcDBK+yTBg02fvuqHkJpEYrZ/0
 LlnZ8kQqJS+gtHzWjusvaRmtNBjOq6QEh+/UI8wVBiYz27HmvHSD0SaMZp6CtPoJ0a1InX79022
 3qYY+S/XRqmFHHk4uTS6KFJGvcRxZQWkZA8wTkiBySrutE28oxWSos5gaLQc+G4sicoEQKD3lr/
 7IaqcJ0UUw3MxWS36aQLSuLj3uQ/YguzTs/AkDSrqpKnwuoLDM8codsMEQmXTpb2g2Bz9A36ehL
 iJZGUqKh0M/RzTehh7OOLAGD+tUKLnN8ZNiysheWRwvGii5XiRWWFiRu/iqpkHm3kQnisOtvynC
 r99foikpHczBi348H90++OHmpB1lZg==
X-Proofpoint-ORIG-GUID: y0UzqG8rTunWW3VQAONkTpdxOu_EGY_o
X-Proofpoint-GUID: y0UzqG8rTunWW3VQAONkTpdxOu_EGY_o
X-Authority-Analysis: v=2.4 cv=FpcIPmrq c=1 sm=1 tr=0 ts=690b5e60 cx=c_pps
 a=kBs6TrnBGiNV6zZMgQ8KSw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=n9Sqmae0AAAA:8 a=dwFpMkFZHURrADZ9gosA:9
 a=CjuIK1q_8ugA:10 a=UmAUUZEt6-oIqEbegvw9:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

On Wed, Nov 05, 2025 at 05:11:22PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> The SDCA specification uses Q7.8 volume format.
> This patch adds a field to indicate whether it is SDCA volume control
> and supports the volume settings.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
>  include/sound/soc.h        |  1 +
>  sound/soc/sdca/sdca_asoc.c | 34 ++++++---------------
>  sound/soc/soc-ops.c        | 62 +++++++++++++++++++++++++++++++-------

Mark, how do you feel about putting this in soc-ops? I think I
am good with putting it here, the code is definitely a little
smaller than open coding helpers in the SDCA code. However, I
do have a slight doubt that this doesn't have great reusability
outside of SDCA.

> +static int sdca_soc_q78_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
> +				unsigned int mask, unsigned int shift, int max)
> +{
> +	int val = reg_val;
> +
> +	if (WARN_ON(!mc->shift))

We should use the function argument for shift in these functions.

>  static int soc_mixer_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
>  				unsigned int mask, unsigned int shift, int max)
>  {
> @@ -202,14 +232,22 @@ static int soc_put_volsw(struct snd_kcontrol *kcontrol,
>  	unsigned int val2 = 0;
>  	bool double_r = false;
>  	int ret;
> +	unsigned int (*ctl_to_reg)(struct soc_mixer_control *, int, unsigned int, unsigned int, int);

Would be nice to put this at the top of the variable list, given
the length.

Thanks,
Charles
