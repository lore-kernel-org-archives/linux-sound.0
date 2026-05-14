Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA083DA7E6
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 08:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778747822; cv=fail; b=AMnacRU0H3QDZgU+LlhD25lNnvVtHZC0Fp9FxGNjg7zPBHnHWa1v2+A6q0liufF6BAtdWSg5McvemuYz7QvxTFNMDkU6f5qOQoNp5aUaaklSKYdjYcCo9n7xPqWrjqE/qsHfBvbiM4eyrujyOksDxA95VUvI4bl9XQSBJVU91jA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778747822; c=relaxed/simple;
	bh=Wzh0y/9Jioie2wwpb0mMSVWj1BJZ3ief5NYK6eZibZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTy7PqO5y0+FIWT7CqgvTTrjVMEX+QLCgi12o24Sz+yOCssLlHJXScYYttoq1TxAZ7pUimeLbYcQb+OqpG86KZS96CaUvBwyBFEgy+qXeM8xVEnYjR91A7ahi5MoD2AFyG2JnV43hUnaYl1JnqDxKp5fP1DWgRIM/QcxqMYGIfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=joF0+ESa; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RKEIRN4+; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="joF0+ESa";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RKEIRN4+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E6HQME1563952;
	Thu, 14 May 2026 03:36:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ztGu+oPS/4VWfe+aEe
	DFXAaqNj4q/krBCUjHLuzQ7So=; b=joF0+ESa8l5vTiH4no3Cvi9+fAdavoqRd5
	DxklF91OiEKbAO84r3jnwavnWf0Xptufirw4K3o1EEGeKvp+FB9zNZ/wv8T1gbwc
	G2YAZMsDZCA2HcBdn1Z8wqVccdO2XYzdwXfv4iQ3iqN/QLaNJuzj5y5nwnfKt0oM
	MI0157cVFGn0luzdvNvktbW6hcP7u/50eVpkJbpWY0DbXfK2/fY3RN+/IWPpQU90
	D0FByBbuGiQx4ZJt+VjERFE/1jBJS2b0uWZHu/qZv9J0sWKiMBmVWbFS3Vj2kiG4
	QpbA40dLIHeYh741a8QIca7adGV2FAFHbg5h9SbZHL+Ji5ihDnOg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021074.outbound.protection.outlook.com [52.101.62.74])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e4c7kj3ky-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 14 May 2026 03:36:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNO1+AOy/9HuQwEzfvLnBQ0TwpYahFgVCpNfvevNCgzbXd0D82aDGg8vCslGMSt9WjMd2s73eI864t35hWK7sBqzqw+2FJJqYzgSk1gZKTGm4+BuDTh4GXY4V596cFND2XGpu3aGF8eSz7qh1qhKMPFBLqCP11XeeMaT8pquD4nu4p+sbvjZeuMINOdNSPux+YYwnyi7R1T3haskZu9VkymXpUzQ94QgaP9Db6x4yLUql+MzgqebWZuXGAdMwHCcJpm9U1d/R3hUYfRIhbBcYJp7uuLAk9JNPxHf80B4qx5VQepzDlID6JU6CgwAQMHbDe0UlhcLTS5POofU+64BGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztGu+oPS/4VWfe+aEeDFXAaqNj4q/krBCUjHLuzQ7So=;
 b=BVfIqaCDYA0cR006L92d4TW7D/Z6PG56+9/P25bkkQso7jyvgY/wMTrww2/7Uf3+uWqZG1aNiZ44nURBng7r0hIbck2EMNFhcJyuKW1GFtIlUzNLXREjPBV8Vao9BDtSuWX9JtdCIXtyL2/km6TjXOOWs6pRYObGbYQn1IC22SKteaVdqFGRidkJX5sbBvIEsdsUiBE6K8/TmB1NKi3UeN0HCpFq1kYnzrOI+6TKpHeHW65w+lfxVtRPhXXxEKdZ+6OxQIVFHeNDE5DCeHmawlhcY5gYHckXKbV17u6ko4o9D0U3kBTqvoYB2yravuOkGrqdkKn4h2jLfnt7yEkFzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=everest-semi.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztGu+oPS/4VWfe+aEeDFXAaqNj4q/krBCUjHLuzQ7So=;
 b=RKEIRN4+XOgCM5wBNfdRk6uBfYEoKm18j4DYyzETP+HocK9NdqN7HaX2kcMIILS95BimGsKsdzAlkL72tx5oomeC4V5yRWV96CAs82bK7gdBeWH+XWMQBxOpMsjo1PW7fark4zEunxRfXJYZssWaoaOqixIaIfUrnkGV9F21/Ak=
Received: from MW4PR03CA0227.namprd03.prod.outlook.com (2603:10b6:303:b9::22)
 by BN5PR19MB8966.namprd19.prod.outlook.com (2603:10b6:408:2ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 08:36:46 +0000
Received: from MWH0EPF000C6189.namprd02.prod.outlook.com
 (2603:10b6:303:b9:cafe::a6) by MW4PR03CA0227.outlook.office365.com
 (2603:10b6:303:b9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Thu,
 14 May 2026 08:36:46 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6189.mail.protection.outlook.com (10.167.249.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Thu, 14 May 2026 08:36:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0895A406540;
	Thu, 14 May 2026 08:36:43 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E8630820244;
	Thu, 14 May 2026 08:36:42 +0000 (UTC)
Date: Thu, 14 May 2026 09:36:41 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: broonie@kernel.org, tiwai@suse.com, linux-sound@vger.kernel.org,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
        vkoul@kernel.org
Subject: Re: [PATCH v15 3/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
Message-ID: <agWJmbokLLMx/SyM@opensource.cirrus.com>
References: <20260514075206.3483-1-zhangyi@everest-semi.com>
 <20260514075206.3483-4-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514075206.3483-4-zhangyi@everest-semi.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6189:EE_|BN5PR19MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: 351a9488-d4d6-455f-406d-08deb193eea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|376014|18002099003|22082099003|16102099003|4143699003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	KaTWWaxu7UHXmc642g7BQf/I95+Ef1i//+wI8lqXXn62Ah+np7F401O0NLuRmTbzFLgEjXIAaYNGqvN2+Qaskk1EAYnA/sN6V9+3E0sgOgaUXnNrHSaPornaiV4a/X6yrqB6jv6AIlqpwkzbf4RGk1MRO6EfDmotFOvewLtBBmRMhrPDbwnqIr6e82HRGsjEliHJpzUahzqwWbS5q9MQhgivES2XnklE4A5PqAC0bkiH33v5uKEjipc1DVZyFMTVfDtaXbL14PVNiSmwy86qGdKWT/p9apqKUuZaRbdK1L5cWBuY84I6ZjuwOVAct4sfcWPEiC7ohYFujTQOrSOyKfDpCJIY4YUykbHSxQt6XokXS5BMfPfAR7OpWcN8xzwr8co50SpbGPGHbirrmJv6acwVRRH/sXFCd2rySw4jXFvraEPF8SfI+WAyE/bn4VOQf9Fjfl1KjdPFewBwU/Vf7Q0mwbWMMPXl2jaOr6El/th7gMT7Y7pm25Gxm/d4GsHYF1E1UvouUIGQBnV/n1W4B6R0KA6+7SdpqMO7tMYpCyTqYK8BQBR0c4fRbcKMIqcSzkN2hGFfSN+Up+lpjeU/h4k8UBettdyWzuSLfbp3zo0ualMnn1m56TEkAi5EtZL+Q5kzKIpWutW9ZrJaSNXkbHRe+qbYET1wWt5+JKYySC+LbOCOOXM2atyP2IPKuD6YAk9syxkRmh/MqGtpKYqzvgwMm+D075Z7qtSueyoqubs=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(376014)(18002099003)(22082099003)(16102099003)(4143699003)(11063799003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ahNcdB7iKxc9nrjajPw5v0ZqYp+GexTp/kIy5cpKkfveVSI2a5/NXT7x/banj5hMRxSBAwChB+9vMST394aLMmMlkCkT0LXAGKyDN5oCOrerPvamDt/0QpYhWQLpYZKAC8VJ24YmreXmoJju7QU7KB9MqKp8xTe6dClTkqhZDeHTjdLOQXIjuTDd1t7SwDIqNoy4iFDVIVgmfu0OUnlZo3FiO2IsyBIJV4y0YVxQ/pr+WJGCYgt7J7/G3QJGz1ZrOhtAazZ/RQfY+EhvLrw7LxCtDVCJmiPM4OcLWdCK1cD/3duTuvLb1BxD+DCd2SsYWIC+my7I9LBPMiRD02N7RpFQQPxYbZP1KUIjCfcvFooFV8XA0QDmYu4tBM42OKNcAYCAxISUjJv8Uv4B0FtAFibtI4Zv708Y8mJ1k/E0WbLwSd3Mbe6GiWbH47J4Ba10
X-Exchange-RoutingPolicyChecked:
	fg8pdhosQ1fHjt3AdS8I42Snehb+ZB+8jz75SNfMX8EjHsRQoAIuSi6qX9fO0D99UlgZRbauRRqHVRYXtPQR+0RR9By/zXXPS2sKFWr9m2yCMhBWFT8ZmRkmvrGGT8brYDnZflwHRXOx6MQukIFkqFNTSpOo1l1BEJUPi4Nd1jclDoI27gLKBS8HvXWU8HF5dxVc7LOQfAkTr+UtaenS0xP3jlANov3rmxJdY3HQPFkVMJ+r1ZMEd7IESieGNLYNL4vJh8iabh31MSTm+QQUFH5egbQZ5gDT4rB2TeSxPidM45T8+KoJIM8y5Ze4hlU6J008mLCfydkHxilcRF18/Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 08:36:45.2231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 351a9488-d4d6-455f-406d-08deb193eea8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6189.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR19MB8966
X-Authority-Analysis: v=2.4 cv=DZcnbPtW c=1 sm=1 tr=0 ts=6a0589a2 cx=c_pps
 a=GnodoI7vw6685P6KDJTVEw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=tdWpEtAxAAAA:8 a=E2UlyhqEZc1galCVtNAA:9 a=CjuIK1q_8ugA:10
 a=jllm_RjNYhQZp96B3cJE:22
X-Proofpoint-GUID: y1umGRBYPooPvSk-Wc7_WCkuOjBFtbbR
X-Proofpoint-ORIG-GUID: y1umGRBYPooPvSk-Wc7_WCkuOjBFtbbR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA4NCBTYWx0ZWRfX6lqd2sC3na4c
 FmpyLTmL0lTHVbxTpuPY+I7aEQZboW7cbXLykoRdNMMf57VpOLGFs1tGYRqbiyuIMVOWmOtdI0j
 sNeqp7Xp9H/8ix4qQPUxGoxU950K1bS8KKeh5335A/N+kOrraN+0DiUkfqFu85toQW5uBq30qbB
 JMxg0FASybnqkMR3rN1uxWvf6Tq4d05cq7jyCidUq52hFsYp6/kmJDl3ZEUVdAvfhE05DGKaLtL
 gpIhF6HEFkLN95sjQqu/YwdFxXsNHVL8u7inG3XV7plxO5lhrigN25nMYAI0ZYUkaM/ufPjtwkI
 AtFbiD+aoivs5KwjFDIbu6FQ9A1IwKtJO+WR7vthnZIR/qzPYSlyZ84ZhhgBfYszzkMvugM+uyd
 WOZimNrEjbyhS1uayrbF//t/7b1LSkYXkuxAnAl39/ZxaCHrEtYwFF37INKtIChb8YVxUvGWg3W
 d4Hj5e24hXRDrtxEwlA==
X-Proofpoint-Spam-Reason: safe

On Thu, May 14, 2026 at 03:52:03PM +0800, Zhang Yi wrote:
> This is the codec driver for es9356-sdca.
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---
> +static int es9356_sdca_dev_resume(struct device *dev)
> +{
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
> +	unsigned long time;
> +
> +	if (!slave->unattach_request) {
> +		es9356->disable_irq = false;
> +		goto regmap_sync;
> +	}
> +
> +	time = wait_for_completion_timeout(&slave->initialization_complete,
> +				msecs_to_jiffies(es9356_PROBE_TIMEOUT));
> +	if (!time) {
> +		dev_err(&slave->dev, "Initialization not complete, timed out\n");
> +		sdw_show_ping_status(slave->bus, true);
> +
> +		return -ETIMEDOUT;
> +	}
> +
> +regmap_sync:
> +	slave->unattach_request = 0;
> +	regcache_cache_only(es9356->regmap, false);
> +	regcache_sync(es9356->regmap);
> +	return 0;
> +}

This should be updated to use sdw_slave_wait_for_init(), as per:

https://lore.kernel.org/linux-sound/177858284069.1043532.13233320271274458583.b4-ty@b4/T/#m58ed8c01e7e96c991c8f05b636e36bc65cde8add

Thanks,
Charles
