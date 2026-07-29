Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5E53AAF62;
	Wed, 29 Jul 2026 15:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339587; cv=fail; b=W078ex8RQOt3WW4vMo/cB5OTDIuMV8VfIjuOb6XY04x750XLKqQwInTmHx/ejlY2COkj8YbBLUNWrsHVbCeK3PDnQNFJHAaaVSpPkVajESSZMaw+N/Hor4TxS0/SyteyFTPiyqEPZyzsTvTvOTj4s/7TxgIg2/Juxa0kskgOegs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339587; c=relaxed/simple;
	bh=W8YueaEduJz/BgTDPlCM/48lSODuKNZ1x9X5S3ODgPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oVkMYheX/GjIGp2PRQ6FM1c3roGFoJOutwhEXFIrVSN83WtY6FaZXolQW6i7102uPcO0/uXjoVC2uQgPaNojVXStWBm4R+ywYH4xURFBKxbqAOWCAjyZDlU3rPWd9V9YNjZ5DwWLZEwk2kOKZVND3x+GMp0P5jd8pMNlggaCuVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nqetCAAk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ARBml/Zh; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nqetCAAk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ARBml/Zh"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBphd13049205;
	Wed, 29 Jul 2026 10:39:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TFam2Ru696yOPTMbZIz7Y/s0UEyaEJmr9F1/LO9IyJ4=; b=
	nqetCAAk8ob6LwZrVhKTkMHoLtFgFSAG1yvBtINk8nFhLrw4XwvWRyF7X2YUTAmu
	edV+QoXqZWJNVKOOiNmIBb5S4X94gjX4+mQQrOj/WB9GFoe1KnvIZ1Ta5EqZwjv2
	bBHXQ/iGAVjjrnmEXGjmo1/+XJ/wjN/yN8urd6/IWo5HOojezOtyaTYbvGuUGy12
	fswqwDfhSnHUNV1bplSTn/8JUWkvdMgNwzDeVmmynjTrx8FbfcynNhmQwudDch29
	WnUlUkliUuDcDWUoSOqpY+ZZ56Fj7x7M1XqlGeo65oq1fIoVPZe1YAGcNdJYooo7
	SGHJ0wqmsZOblRgBRHdG4w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022082.outbound.protection.outlook.com [40.107.209.82])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fqh100drn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 10:39:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h67NpeSE+h/h5L/ypffiJ3nQeIlJepFMejPmz0SfnakBM+7Kpsi7k7RK9FCDvMmVyf2Q+WvyBYg7qDRXber8HrZ4ybgxddZw6f3fATuc3rjAaZ04PAfieYGDgnFR+TBjVpKqOxxjPT/O/NXJEjiBAPnD1guCuIRJQCnjJTbOykvriYuKqKYvjxcfRLsx00LTpKPn0zEkccueCaRDfFlWDcj60Jnc5Zpfi/21II6z/andyHB6LB52IT8KANA/s4vI2d2ACmw/RCWnTtRfneroIz0emMY/4BGWP/Av6BDVnKSNh2imaO1YmUzwyvgAQf5ZcI3WcrSLRk6gFVz495LYAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFam2Ru696yOPTMbZIz7Y/s0UEyaEJmr9F1/LO9IyJ4=;
 b=uVHBXVLw8w6A+FAgsSmBKuvLvcaxPhb0z4wLiwCY4rF/RyllX6X8VnHi9ZPz8IsiJQE9MtVfDm25xf9UWYwSgXc/fAXiQueD9erox/i1wP0aY3Ef1eH8zdFQwUc5TpgjnpOhoLv8uOLXQHBnW+TTdPTETSm/G6QWYQleZqX2hcH8+SSf/FFsi+GSC/3vwGfbXkxJdSysVMQO7T2VF4JSE5VWaQzphzJUwabjHHsYeXjbM8cR7CnWKp0NJIvoXeUkfkUtwi5om/smHoZQ/YoksdPK0nw/Qih6ERn8iaLBIJEuHS1JXZ8J+LdENlxXHdOeG15pRlmK1GxOioQghiMtVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=intel.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFam2Ru696yOPTMbZIz7Y/s0UEyaEJmr9F1/LO9IyJ4=;
 b=ARBml/ZhNpKgVHfHvnATYw9rMuJsVPS9AS1RbW+JNmVT7+oOmrcN0tAGSEvh/3XEtcmCSlpPD60+WdxHef9h6y986RPhCbuSFoilKaPdkdg8D8geL5d1etIRPTFCymPDET7BIGxa1ZdQgAaNyM7LIZVhdk3uOmuQDRkpjXqMBzM=
Received: from CH2PR04CA0005.namprd04.prod.outlook.com (2603:10b6:610:52::15)
 by DSWPR19MB925581.namprd19.prod.outlook.com (2603:10b6:8:3b8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 15:39:17 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::34) by CH2PR04CA0005.outlook.office365.com
 (2603:10b6:610:52::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 15:39:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Wed, 29 Jul 2026 15:39:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2322F406541;
	Wed, 29 Jul 2026 15:39:14 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 17C9D82254E;
	Wed, 29 Jul 2026 15:39:14 +0000 (UTC)
Message-ID: <8c3ce954-2dad-40be-ac14-3af6525f74bd@opensource.cirrus.com>
Date: Wed, 29 Jul 2026 16:39:13 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soundwire: bus: add CLOCK_STOP_MODE1 support back
To: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
        vkoul@kernel.org
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        bard.liao@intel.com
References: <20260629144450.2096823-1-yung-chuan.liao@linux.intel.com>
 <20260629144450.2096823-2-yung-chuan.liao@linux.intel.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260629144450.2096823-2-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|DSWPR19MB925581:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb76d50-aa07-47af-8b0a-08deed878baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|23010399003|376014|10067099003|4143699003|56012099006|11063799006|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aCfn0ygXJSIixyaGoH4zJn9lrjvUcPUC8D9VEPNIM8QYkV8jItdj1iD+dyJXKVysGutKVqUQcBvbp+GvjE4HbgDMShDnU1sC/DiLLwDOsIm8uigbZ5SM767qjAlmPVFmA+xccp6tgRWvHifOgxLtzRiS6sL94PdUfgYXvjJPeqcbjv3VdxP4YhEycQI1gvQjEFgf5E+WlY/WvGL9bsWma2qgx9qz5zofsEN0foPoDC3KeMyk/k/Z+9Zjedp9LFpO2mH8MnNP650yUHNkgvYy5FVbaa7HfRs6/pB6+ae/Hp9q/IEt7kLyQOVqEpHyR+gGmeLISMunU/RPpZrcyUp1BlwK/HhUmS74czuIq4hUeysE7lEgbBkUC9bjVHJm4k5U2bbfbku+V0k/k+pcCIkJGEpMcnPrmfEQV7t3kPA8TWVL1BOaCZknqOmL7npYa0BViPST5WmmE0oL/60nSBvXZX9a3NXssai0vJgncDZQF97Z7RAlAKPRt0ixJQ78VA0DtDSE05ohtC1feOIDxTIhJHmNzoaoysdsAPEqY1tpsDVDQgP0M3L9Ql/Ij2joKG7HFoSraSRl2MijkoLsbwkmQKopRbTwh1rtwosWWNHMWI86iKBkfW46+gKkzLoZ+96UAXGLS+s6jCl86dDElDPG7aWEbKkVRdDwJaAyU8nGNT0krWe3tWCKVXN4T8wq/gKPQE4H8KknrI3sAJsvIpitSA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(23010399003)(376014)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LZyHiuiQBTM2Le5aG2BWsA9XUxXUIHQKz/v2fSj6q1G5Xf6w30wkSErEizWc+pUHBKCz5c6Q/hBIfL2Tu4aRXePm85CDEf3wSwJw5DnRcegvIHckdUuxfXh5y0RZCRKgZFnvX2FkcQLPhHZy9extYuJMmGrHRR3YaKgcOpPJtRCQhMw1jdHJUsV4+PFuDAyOjxGQEC44GSsOaaIfiAO8rtBdWse87I9IQaEr5ewERQSyUIk3eFeItDhAlDTH3vsw9CRlUnH1eEnATo4eyEuf/qw8Xt7pKW/CG1qdPJGOf6yQRqIrhltQrW3FVLJZskR9aXUfBxJwXShbujVChE29HN9zTLIroq/7/734OeNTYczj/sdaFHum3PwdRpbH4Zi4kUWSwyxPus6S4zXjaDaqpTUWyPZGmtLAXcjeXOdHlhHwRhrGJBmWQWUCMZkpK2/o
X-Exchange-RoutingPolicyChecked:
	hhAdFMe6ASqrnt5UXIwfuhudIuPBkPDX/FmpyEz6HPjNCCPEupCz8OJYu4BYxosFDxMq/tdUOqnmRNHZB5cFNR13Hnh2Muf9krSLknwuL/+jfdU/8tNQR4f4f7zuQyTi9I0UVI7xPOMnoc4H9vDmKNOiRdP8g67VlwI+j2RX0n7IQ2l33s5KW8OD9FoagMib0xBCI1F5ACP82tnHQ8c04xRSaS7e42IAd/Ijlw2VRWuBkohudzvSr2ItW2vIrr7oWDHWN3HzNBzhsfLqKsSwcYBw4gvyb28E5JIcoy07o6RCKPMrNoIs3xTT2Z0FSBOF+LCkvGrhYtxmoI9HLnsfYA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 15:39:15.0392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb76d50-aa07-47af-8b0a-08deed878baa
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR19MB925581
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX2ha8rz3ZWZ/z
 tAwIGqzPWVQ8qwgw7viHS4/2afBjSRPbkz22UOCr/0etNozLbIXoDxQuckVNxCk77Fjj4Cme+MM
 mCZ5UcyCquzz94LFmNgVLXgvfxekLz4=
X-Proofpoint-GUID: sUksUolDnhBJoT44uRg0y3IwK9pa4lEc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfXyxPDq76KunLV
 MsN87aDjgyUWjzICKRFtVYRWaBrDPCC0cs0Zr9RB+Z3GWGSz9KPyRiadhZtldxzkl6xh+yjOON3
 nUB058aVIbEnzPI6PZk9OTomc7pzUYKw6ZfVFYupr3xvACLvftpuDjpBCzXjYUzWeSrXzaGOmh9
 Knu6ffgqBUZVbG8jfAfo4I4XOOo3ZkTIX6tRqv9kcdy7gviTFs6zpsYGq27L2jByZ6cpdbJiInh
 AcyqrmwXuJXri/C4W3jlRiwJ1eQtH+6v8dbEGnvOKgmfhhRxrPWvkXb6WP9QaSah7QR4GJRio5B
 Jl6OkgN6xj0U8wKfr7C8M540+i2cCfc7k4EstPCu6UJUikHhjYAwcU/0eHDQ9PBOmq6ySZ0xZlw
 t8v9dlOf8e8cGEe7K1bU1L+oJwXh/byoRkW/CiucywWZvoM8lRueHUvJxn5vbYWIREmaTpAMDCZ
 1ENEpph5N16k8SWLeag==
X-Authority-Analysis: v=2.4 cv=QtZuG1yd c=1 sm=1 tr=0 ts=6a6a1eaa cx=c_pps
 a=yElQ4muSOuhJtI3odKz4wQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=QyXUC8HyAAAA:8 a=I5TDoHPj2JXCu3VCwGkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: sUksUolDnhBJoT44uRg0y3IwK9pa4lEc
X-Proofpoint-Spam-Reason: safe

On 29/06/2026 3:44 pm, Bard Liao wrote:
> CLOCK_STOP_MODE1 is used when the Peripheral might have entered a deeper
> power-saving mode that does not retain state while the Clock is stopped.
> It is useful when the device is more power consumption sensitive. Add it
> back to allow the Peripheral use CLOCK_STOP_MODE1.
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>

<SNIP>

> +static enum sdw_clk_stop_mode sdw_get_clk_stop_mode(struct sdw_slave *slave)
> +{
> +	struct device *dev = &slave->dev;
> +	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);

dev->driver will be NULL if a driver hasn't probed for this peripheral.
It should check slave->probed, like in sdw_slave_clk_stop_callback().

> +
> +	/*
> +	 * Query for clock stop mode if Slave implements
> +	 * ops->get_clk_stop_mode, else read from property.
> +	 */
> +	if (drv->ops && drv->ops->get_clk_stop_mode)
> +		return drv->ops->get_clk_stop_mode(slave);

It should be holding sdw_dev_lock when checking ops and calling
the callback .

