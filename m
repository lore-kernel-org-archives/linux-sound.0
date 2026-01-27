Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814CA221FDE;
	Tue, 27 Jan 2026 11:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769513153; cv=fail; b=l+S996FNhNrM3MFKeIZ6xvUi0VOqQblJOx5GIjqTsl9iYCkS2n3jxF55FfctV7DEcfWIxPTxkBeZ3byB0A8Khdte9VWpuezrc0MyRN9CWKKugRMytTds66A0x3IOWG7MRG2ujVHedUkzGqSRUCKnffcLK/jUIthMa1FBTJUjf9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769513153; c=relaxed/simple;
	bh=5lSSV8+3o2lV88P3NIR0YaudhpIMANt7W9FnwrLfubc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyDNZnKqy2znrQMvK0iQlJ5Cdud1nLmW3tjBK+c/8xpAlt5YFo0J7n6hbDu98UTJ7A6VzBomM/gBb/VOrg1pWPDccSnnSrj1hbi+teWmg41C9aAmjbLnCRUBM8AfTVpY4XncaTjc+gTWJRfcWJ7RsJZT1aO9wNT/HjTW7R78Rg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PnYiI59o; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Fz24fvBU; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PnYiI59o";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Fz24fvBU"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R7UwZG151391;
	Tue, 27 Jan 2026 05:03:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ToyuntlbTjDeTD/OgV
	7ORpOfdEnojcKdkIFk/kkAGyI=; b=PnYiI59op3D2zufly7Wfv60DW3nb6ELriC
	HGA5ZqNICD1mO6dmBl5tphufKC0ySuAjGzsRJ6/e5+bsBeCVxSNLnQTVtfrZoF++
	2oKfzyYqL9k3w4DImJ7AO0pVzU4snk8ltaapKccifT0o2GTYFJRcU5/g/Ae5fB8T
	Rq9PAk6q0VgoooLPWgwz59Sp1BT0BK0uXc1zZaax0UjhG9TNdQckcXIs89a57AMY
	pJmq1jw803W5aXF2eImteXLjk7blcvvnifabWbZ3+RLMfpK5bALEGWIIMiow3Ta9
	e9JpVQMVkscky5ja+VT5R2Hij2h+OoHbuX0Y3LMk+8SPlkvxHHlg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022079.outbound.protection.outlook.com [40.107.209.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bvvc02p8t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 05:03:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Riyo/4C4atKv6kJgcwVai2n9Z24KxwC2LwPfejwoCilIQf2vknecd/UmirMGs8XRDlnYNueD9rvIKTVITOm05wOI55nOd5GWWUov5VBSIsk7GX9thFWUL3A1SqKS+isTmMBTMmB0oOQWN3MGv4JoS3/ukURle3ZEpWu/8YfAFHfVZqJAzsbKWyOOmO+/KxtLKiJFvz14f4az7IbI5kDV02ljUBYoXNbI9K2OC9k1fYPQ57r5d1bqDILcRBX5vsGBpVeTDdWYhh+52frPe58akmyq8aQLCAJFFKuq+jSwQTzr/j1KSqyqgG1UbdTIMzYx48pOmMmqU2YqWxutUkcuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToyuntlbTjDeTD/OgV7ORpOfdEnojcKdkIFk/kkAGyI=;
 b=BPqadkxuLLUbxMVcK4E/54jrzWGqWtRUdNz4lkRET3/bQ4Hz6K1OprhuFzkTrT/s8RvFQOcjTE5drfUJaRfCQ9jR2Q3TrNBrz88jgSvEDcMM4uoBBvmDRwpLZQJsPYYpy1vfDZxc/6yIYkHwrmBhUHEKcOBU5k62wldGGNJsIVkZBERXIKm1wl1JA2BVRMiA3CtHVCqZs1f1QSWDywrwm20UGuEYBWrYtdKgJzzov4BMD1zrtSStfnCnLOyyEVCdqSojLzNlhq/gLKDNejoZm1Jq6ZXQM3OZ5xLE76eqGt3AryAAf3J5ZmSVzTbh/rd6FMk+9nVCxiMD7HduvZgfyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToyuntlbTjDeTD/OgV7ORpOfdEnojcKdkIFk/kkAGyI=;
 b=Fz24fvBUr2BYBTr/djNCZGgC9M/lrb39nNNEl1JV9/QzMeVSZwnBW4LWbhMQDOLAvBHN7DRsPnkfL7UCIxJHfudKeZMLU5QOUoRaYr9rBzgjDgDw4ZYZGj9L7qVZN2KeD909YV2EVjTmOC5JwzWIfbppyWQCVBQ1iUlYhi8wYPQ=
Received: from SJ0PR05CA0134.namprd05.prod.outlook.com (2603:10b6:a03:33d::19)
 by SJ1PR19MB6236.namprd19.prod.outlook.com (2603:10b6:a03:459::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 11:03:04 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::27) by SJ0PR05CA0134.outlook.office365.com
 (2603:10b6:a03:33d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 11:02:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Tue, 27 Jan 2026 11:03:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D55A2406541;
	Tue, 27 Jan 2026 11:03:01 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B05DE820249;
	Tue, 27 Jan 2026 11:03:01 +0000 (UTC)
Date: Tue, 27 Jan 2026 11:03:00 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        kuninori.morimoto.gx@renesas.com, sebastian.krzyszkowiak@puri.sm,
        brgl@kernel.org, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com
Subject: Re: [PATCH] ASoC: wm8962: add .set_tdm_slot callback function
Message-ID: <aXibZNhIZI01tJyZ@opensource.cirrus.com>
References: <20260127103326.1920525-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127103326.1920525-1-shengjiu.wang@nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|SJ1PR19MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b11b5e-b131-4cf9-01b8-08de5d93a4d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|7416014|376014|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ENcmYia7e01o3OrXMEMP3xwe7zoTC4L/UiCE+vngi92+JHNG2es8gAo9S9uC?=
 =?us-ascii?Q?NyLk6hjhUeHjJP7ncMv1eHhJHmAPYyz6NSmkpRUKLpsU4bSZkr6vBP87unEE?=
 =?us-ascii?Q?eQ9tz9YlaTYrBga3unx7l5IswdiZ4U09PclZAtOEEu53zVNQh4oMJhR118nc?=
 =?us-ascii?Q?HrpQLw8pXZjkCVzh1kSiPuKCIv4aHXJpZCGdQ9x9y8vQI0arBd4qzv20x+aj?=
 =?us-ascii?Q?Ro0Pv6nWlM6IEG67y5AhWN4U2n4FyS0oXMaGiB9Uz/DTCj0rpnODLmcWt1uL?=
 =?us-ascii?Q?p6qMQ+sFfoHoEog+nLWqqTunIaAkfKFnXxpNh687mfbkcmWNHnJk2TCoGx7D?=
 =?us-ascii?Q?Lq817VarCSNEL4GLbTwyppPWp/lteyushda+QHF7UP9zp2YsSyLSidZKMYE1?=
 =?us-ascii?Q?4pHDmTnnyfKng5uvoNFe2Zu+jeeIyuTW6pOX2RH/XiKngbCW2Wt0ecl+kJcd?=
 =?us-ascii?Q?qrp3k1uj3jvNzpOhSwRtuOV2ehV4siunNcDqgCR9/0XzgOogpC1Vd9TuO5pK?=
 =?us-ascii?Q?2hWoYp7WTxR2uf3IsAXWB3Om/Evfpdo3OfEk2cl3foN2DnjH77C9qcVHbmfg?=
 =?us-ascii?Q?TnsSCfSH2f9lK5mtazzcGwY2NyAJgKsbgJHqghyo5cZTtCJSO6e69LU9/5Vb?=
 =?us-ascii?Q?2o/fxmkXH7GAB3Qu5bazYQK2Nr6Eqb96I+ksr2QCZh6wMydExYQRxffyZqG7?=
 =?us-ascii?Q?jZT7Y/EIbRPvgt57AuMN18f3LghBeQ+Z9u2VAJF2n6uOn+jPs76zc7EyXN50?=
 =?us-ascii?Q?sQyZiXuGMYC5A5cgyShrbuqmaeHWnwB/EztfweScb6kM/od/5qKb1HtOlBr2?=
 =?us-ascii?Q?4AuiXGV1XpR7ygjYmmBsIDKsTygrjyGGvHGjSIlU0YYh14gFHyxTWPwK4Udw?=
 =?us-ascii?Q?6vH8GHvdGytZfoSgYWo3v8b0V58K9lf4ARMjbr9CQ6h++ijE/0YzbpAjj4bC?=
 =?us-ascii?Q?0NUNKUH+kB4nKNXyv73uehLoo6zRbOY8RZdNwL4AqBkRVY30V8FdeTfGD+C5?=
 =?us-ascii?Q?vjLHN9eA/AL2gdkH/7Aa08pyn+3b9OXTKh8eWs919P6hsu4c2z3KXjOGy9uj?=
 =?us-ascii?Q?8OwvJwFLUdGIjekfB55hbyXK50peESghef6CPkAb2lKyLRHA2gIQBpsB0CK6?=
 =?us-ascii?Q?Bk2VOn/bj6sbsU55tkHJ3IcP7FB7KYjBmyuYqxqXmqC0ofxhvXtq04q1TIbY?=
 =?us-ascii?Q?emZOWnpujCDZ3p1FJeb/klfoROG2x+f3s9n5y4k4eTuBXXLiSiiFlrLe0+hU?=
 =?us-ascii?Q?bKbXnh/TJ4TiyA5giv3b5Ao83IfJ2YHxCuiKnqULeVgMKaMKzeOm3DQz3mcw?=
 =?us-ascii?Q?wv87apzbnujcxzfhTi+zZewgyQef5wkq2pk7Tj1RnLLNnCeaOYGwY8w1K/o4?=
 =?us-ascii?Q?hposjaQPrCub/6SBs8r9Yp/lUKPBTpWdRZqPWxNfIngmp475f3P1rytQ6+/V?=
 =?us-ascii?Q?33hVGVbgfNyxQa7hQxtg7ZTRDnU9itqKSxVv21UeFcLHH4IK1ZlDmNxCdSH/?=
 =?us-ascii?Q?afFrrgWK/WnXN65OKVTP5K7VNHqjd/+U7XTsnG20Rgyp1//8nQ04eifqG3Y7?=
 =?us-ascii?Q?JXpeUAF3DfdOMT50HJ1WmLnI8DZV3TeP8j26UlWqdKBwTgpdEqPpfV/RQ+0Z?=
 =?us-ascii?Q?om5cNmlli2ifcPIKfByHHUjg51SSqQU36U90EVGMb5V2i+UpTIwpuM3FtaJP?=
 =?us-ascii?Q?F6ueQg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(7416014)(376014)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 11:03:03.7066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b11b5e-b131-4cf9-01b8-08de5d93a4d7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR19MB6236
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5MCBTYWx0ZWRfX2W1Sexy5Kch3
 l419Q7G58yxOgSTZjNzgmSoqE6Ug1GPKYZHiCK1iocP2WtZV+8tEGydOCWyeRioNAyjQxpVFVPn
 y4zTzMFGio7gN3KuVYOmI7DyBMtzLoz/ENe3+/1m37y151weTGolopesQwUWUxUlt/50sSex6h4
 wAw7a7IhRVji2QYConqVmJi/7sAyxp5+wRcANZBzf+ni6gDz/zggwTdbM6nnzSEV5DidLquSLDt
 xWMf9ru5+g+sMGkTD3Hh1Gc6B0BB1fK2l+uUDp+IMNQB5pXiCD44DGlnVX5PGY7Dl6z5Kux/Xlx
 38ha3Zw1CJRaz2nnA6mliqVxMTbylnuU6ATWRam2P0WcQgG14euF8v8AvDvEXtQk5gVBY82PZwO
 LXeO+aOTGIt40sscdfsL1POhEOBCRarEVa+v+lhVLBM5EhZ65xctJ2caxbI7vzMLHk5ZEKazH7+
 wj4DtMyfLLbFVddODOA==
X-Proofpoint-GUID: XJKQQdMAkO1LG8_rmu-GtHN_zjwtP1Ls
X-Authority-Analysis: v=2.4 cv=KvBAGGWN c=1 sm=1 tr=0 ts=69789b6f cx=c_pps
 a=/ox7Nx15/I3RpRoI+9JZHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=Y22INAjB99xBzcTUZ2EA:9
 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: XJKQQdMAkO1LG8_rmu-GtHN_zjwtP1Ls
X-Proofpoint-Spam-Reason: safe

On Tue, Jan 27, 2026 at 06:33:26PM +0800, Shengjiu Wang wrote:
> The slot_width can be different with the params_width(), for example,
> DSP_A mode, slot_width = 32, but data format is S16_LE, if the word
> length is configured to be 16, there is no sound on the right speaker.
> 
> So add .set_tdm_slot() callback function to configure the slot_width and
> update the word length according to slot_width in hw_params().
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> +static int wm8962_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
> +			       unsigned int rx_mask, int slots, int slot_width)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
> +
> +	if (slots <= 0 || slot_width <= 0)
> +		return 0;

You probably shouldn't bail out here, how does one disable TDM if
it is no longer required?

I think the rest looks good.

Thanks,
Charles
