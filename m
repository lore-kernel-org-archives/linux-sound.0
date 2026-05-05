Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685F73EDACD;
	Tue,  5 May 2026 16:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778000267; cv=fail; b=ZasdC1evM93dqy7kJEqXrnK4+sTbgWuY/rOd5xk2wI9D2tOsvRUDXXc+IJ6Jq0YAwMmCCfka+WUvnpwWLsPaCpzRl96pnvX2sX1Nk4cNn/Du7fzf39lDomasRb3ZhTMhztvXvIyqlNhWtUb/34loU+TcssQSReUORtCPuS/DVls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778000267; c=relaxed/simple;
	bh=JbjmNJ9G1+hYCb0x2CJZozNc6zYbg2advd89A/xadsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fC0dADjDTLf87svbZloHRh/e7QLiXbbijOp02rTrhtjfm3hHSSoYWO1TuVMHBElueIeH6SQ+Rp3R688nCYj5V3YUpFnkHpaeq/E+DVVUsgSBEz2XVGBXh0o5cehS6EnpO2Bj202jcYbxjMbFMyy4Cq6gbRhrfvyvRdIxjq6C5Ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cF87iLWF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=G160Nf+/; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cF87iLWF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="G160Nf+/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454rAOT1749407;
	Tue, 5 May 2026 11:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=vWjTrqsTtcaqGyjPK2
	i1+mwppy3GNXuO/mUe8uwxzFY=; b=cF87iLWF3zTqUsSqTHIgUn+sEH/FTYtctf
	Ik+qo9E+gIJnVjwv6BntEfF88As14e71NDhhB9lJ5MZmxRmt033Qso4QAh5xH1vU
	iImXP1K9bVfTl7TF1soNk366nrRkh2GmCu/hsTMS1CN1lgrx15AShgxYprPN3Ge/
	dPbN9iP/Bh5dj4zFbxlq8znmqBOfnyJ/3feievNTsS+HWTQ1kNIj4KpMMFL6yCl0
	VPGKIHJbNZbzFF4LqfpKz6VBaYHeGJi+y7pmOsazhCyLEmLbI8ZT7t8WI4lrLKBi
	gfHNgPSsa2qXbq0a3/c/Zc8b8vv13HSg0mqkhBF9uBKMjVje592g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020129.outbound.protection.outlook.com [52.101.46.129])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0uw32-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:57:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLSvR8WoaHKJ53j793+CQJjjZiqOOT75EeH4kajlsFzDJUahxMhA+ON05iojgJ8pXmVqa36XoV+altUW/t9plsSGDkMcW9FghOvbnXbBtL4G+qoEA4dFXzJYA1uGQ8+2zzBi7lEIV/0mYm7d+LVMcG2JrfkN79VHA6fkhzBq7yYZCmXa9eJ4sOIBCc/cvG/002m8YBmklUqScX1zjKrBbVwDWLJFx7VDXgkS68S8sjg0Ab8DWgIcHMXZIkRxyFhvCHZjR9LeZuIDHbsPBz9Anxq0OJXfWkdXx7Vs7A8DPa14N7b75nilgU5qKQkJMMH+cNvhPyE8+eHWdo60zz8KNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWjTrqsTtcaqGyjPK2i1+mwppy3GNXuO/mUe8uwxzFY=;
 b=oBvQL9xDG9XSmxIMyw+Siq2IyEQFMUOVGdtniyomJICvyO5Wntj6BozEa3mB5KykPD8PKZbHAcgbpMPHZvbow9WAEifUQ2DCbY1rgJWYiX/Ul8tMHGZH1cEpiPZl7WrC3AqBakldcaJEu7vJ5eWqwBtjQQuut1kNq7aXrJMgThsZYShySLyIL39lplM41wKfYwbS84mC/sFV7GzVG5UM4k3KhjxaXwDBZi9m7dpztxhs/XjM5T7WpgEyMtq9tZB0BjKQkWE4iSKdcNfsO4kBYGEipSE054ndkVWbLD3X7nxZnAG84+r0cPgq0+Ri8Xqg9nNVmhV/ahxs2mvtdC0iFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWjTrqsTtcaqGyjPK2i1+mwppy3GNXuO/mUe8uwxzFY=;
 b=G160Nf+/y4gICx+lxiICxjWCw8dWhoSjOjnipZaYqdvJSAXyUBXzHrVpB/d3TP/0WuI5xS5HF03ejo+sT1gfK3scqxi64H1/2M1A+XcSGahjL7SLdC/NeJoRffzlqQ5fJ5dFKEOWVvlnNqrhSOoN/K63t9xFov87u7Y3uAs/3eA=
Received: from BN0PR04CA0129.namprd04.prod.outlook.com (2603:10b6:408:ed::14)
 by DS7PR19MB5831.namprd19.prod.outlook.com (2603:10b6:8:7a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:57:08 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:ed:cafe::96) by BN0PR04CA0129.outlook.office365.com
 (2603:10b6:408:ed::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 16:57:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.1 via
 Frontend Transport; Tue, 5 May 2026 16:57:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 75A08406550;
	Tue,  5 May 2026 16:57:06 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 546DC82024A;
	Tue,  5 May 2026 16:57:06 +0000 (UTC)
Date: Tue, 5 May 2026 17:57:05 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 01/17] soundwire: Add a helper function to wait for
 device initialisation
Message-ID: <afohYUQLPLjRXjd4@opensource.cirrus.com>
References: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
 <20260505164807.4108684-2-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505164807.4108684-2-ckeepax@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|DS7PR19MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 237f7151-09f7-4295-e5cb-08deaac75779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|7416014|82310400026|36860700016|22082099003|18002099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	wdmxbw9NfBx2qrlLKPJ5pl9ePmF2XsYgFWuGP8xRYW4Eyu0PKq4OSE1JC1BF+IM9PX3hulYTG/OMNafwpqSxeqDQ/ftacddLDAi9u8ePwRTxjGNstBG49IWxBJTzmP0f5+YAffj4zCpqGcBlkV/vwIVIv7DHG1Gasw8cvM2qPhRfEBcW9SWlTTvyntrzwQt+cREIJQSWAEKAcuI5YKjwPIu6Osqr5i8o+Bo71jjenlA2Kvq4Iie3a44OP2Md14ZHz3NEs4Bh0beDYXLzHWDdGFxaam77+qCDPvb6eRUCXrtKO1DYtxImFn2J2O5/9rCWDpQ2SXUv5N//erYmX0reAvCwph+/sJIyE2oJm0mTfaSi2S8kW9SiE3RPtxn0gBlhBXP+Z6jBQbBq1BpSByPzT8qFlYhyH8Aado0PN1zh3GkckavrrftP1HT2KoakhfSsxURVk4BWgd5pyBLhkaYI0jJ+nmvyQma3gmXbY5LXPJoCMioYVpSOjV6LTASRDgPV3mhGQ28Z/dXWw/kyWjgoOPYJxB2lBxcIlpKyjNKYzvWzz4t9c24Lwh1AHQUakYt4TdudEDzlWs0E2GFCK4Xg7Zc/EDgZ00vQPTExrpNo/X1zYQHHcs9LUueoBKJPP5pX6mO5X6GzT4K/or4AexgNDuhs8yGyds8cEwaw9bLAZffGrPlzrSm7lS0/p215uJ6ZtdVBjh5D/eiWA7P0J02zsldr1GLc2EuDCR5rKTg83Fs=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(7416014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	InnH4IZaDRN8o03VqBCCH8FclxYTuvG/L9sn8Qxev9V3690jey1GGT9Z30eUrozMJuPwaUyVZ7uVVRJtTAW6gJRWg0tYxtGMKFZxzvRUBwDkOiH1SNzUvAfNQj+Sn4WxzpypcfjcRLgJMNEDyuVadRcnFLK6sJg5ZUeqHp4ZkKe4ckqOYZ7ODy30Bnpu6iC4TONFgSxVNvO9fn8swrDVdxc9Ue3JEhnwfVCNAR0w4LPMo58+7GI34cCOGgRzCEJ8WgT/Spiu0ueN4FWdhwJYDvQuOYddo3gk3BdrcJRyQgzfUgTiFcBCt9IDFPiCLS79J7ufLjTbc249RJVrbLMttVh3TAYgCkFe2qEvkjVmACAo9GM0BY4T/aCNnV51kPGypfn+ZNMQcZwfR7Mo4vap7Y5TOFrNJd+7CsyMcqjEA97hLlhX89FLYsJfOWGxXqhY
X-Exchange-RoutingPolicyChecked:
	iCG4OZyIIbp5GPGbywQuCL8AHJtHuZsiKv7iZYVUZWB6zbBkR3OYr80cw6xoaqgdo8qF1p7CjTaJEFd9QNUHN8mt62u7gkn9tWP3fHa0ygjYm7tdHCLGPLRwxBRvTPl39wA35WzoKVsFvFI2jNP7l7DDl3JUsWKB8i+oTMCZjVcdTI5KLL7TM3BAUCGIRzOoPgqWKluPkor1nJ+OujGve+k6DGar6ULBqxOMCppnuEDXEjGAYYxvwFhPhk0BQ8wGqbcYnBsIodA86XnM1XSPWUMACRMwtABopInXqm9TXSRqOUnOcueEatFvLcIoF2YejRX9We36c+L74xbKUNmzGg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:57:07.3882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 237f7151-09f7-4295-e5cb-08deaac75779
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB5831
X-Proofpoint-ORIG-GUID: HqSuijNdpnDFvhocHudfePkK3Ctu9hHO
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69fa216a cx=c_pps
 a=h3k+fpqimRfUez0hfxQzig==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=RQvwbgZUH6033lUKT80A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfX3aNyJWWUeZqu
 5wPJ1DrTKuZOOtJWx1kbQHxAdVWY/F5vtDfm8gqDhnYOTsWMbdntgVyy00yhMeSY7OyPcW/mEVS
 7fDhI2D2Jz07yhvOEnOoLFVPxJv1IGia1/nTABR92r4YwleepgAfXdOVdOxKcrmXpu7fDJS7Jjw
 JtuFt6yCaqCygshLwk4wIHPi6y+nvx9Buw6fxu5bPvGwof84n1NFUJwqYUUqIA/oJGxHHJgX/Tn
 HPorYEbZdHij/UJvBcVKp3IkuqUQKaVSH9y7igTHC8tr8IvLkd2049NO+6PVAN0VM9aDEV5mtdz
 lWG2UmOhuvZeUaSIBQldxJ7TCZmPmmGDcIjQ3yv5VsIxzGslItHDPXDDIDUWywbFJRsaZ6gEzMa
 j9R1s6ncC7oa5KNpX/QWcJGtFvMwKSnO0bJjaEhA9KnREd/enVLjdyOryRZw7fn7P2hSpvXLw7h
 OHdLsaxw8H02ORQAvag==
X-Proofpoint-GUID: HqSuijNdpnDFvhocHudfePkK3Ctu9hHO
X-Proofpoint-Spam-Reason: safe

On Tue, May 05, 2026 at 05:47:51PM +0100, Charles Keepax wrote:
> Add a new helper function to wait for the device to enumerate
> and be initialised by the SoundWire core. Most of the SoundWire
> drivers have very similar boiler plate code in their runtime
> resume, and that boiler plate tends to access various internals
> of the SoundWire structs which is a mild layering violation.
> 
> Adding a new core helper function greatly eases both of these
> issues.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

Sorry Vinod, it appears I somehow completely forgot to CC you on
this series. Let me know if you got it through the mailing list,
and if not I will do a resend.

Thanks,
Charles

>  drivers/soundwire/bus.c       | 21 +++++++++++++++++++++
>  include/linux/soundwire/sdw.h |  2 ++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index fe5316d93fefe..b9ca35e530a3b 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1372,6 +1372,27 @@ int sdw_slave_get_current_bank(struct sdw_slave *slave)
>  }
>  EXPORT_SYMBOL_GPL(sdw_slave_get_current_bank);
>  
> +int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout)
> +{
> +	unsigned long time;
> +
> +	if (!slave->unattach_request)
> +		return 0;
> +
> +	time = wait_for_completion_timeout(&slave->initialization_complete,
> +					   msecs_to_jiffies(timeout));
> +	if (!time) {
> +		dev_err(&slave->dev, "Initialization not complete\n");
> +		sdw_show_ping_status(slave->bus, true);
> +		return -ETIMEDOUT;
> +	}
> +
> +	slave->unattach_request = 0;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(sdw_slave_wait_for_init);
> +
>  static int sdw_slave_set_frequency(struct sdw_slave *slave)
>  {
>  	int scale_index;
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 6147eb1fb210d..847b001d1a774 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -1093,6 +1093,8 @@ int sdw_slave_get_current_bank(struct sdw_slave *sdev);
>  
>  int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
>  
> +int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout);
> +
>  /* messaging and data APIs */
>  int sdw_read(struct sdw_slave *slave, u32 addr);
>  int sdw_write(struct sdw_slave *slave, u32 addr, u8 value);
> -- 
> 2.47.3
> 
