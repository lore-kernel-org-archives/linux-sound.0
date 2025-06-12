Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA84222574
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 12:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733111; cv=fail; b=ENGW1KfIj97kMMqEJeL+rQdIc5mmIoaiFPCda2KqlhtZ9ormnoga2ojenZX2Gqz0TpW4DDf0NMwacAn9coOL4dNgcOlfkgyFH8GASJ99nXHW/BiPYM5PQE/agQj0qTpemwobB0FGw4EJN8MHxauykV+slQkwZXYzegA7SHJJb3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733111; c=relaxed/simple;
	bh=aHTmmBeM3OU4n/xpJRnzh2Td8iSzZh3z2Cyzs8gl5g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Le4fBdrqeYi+u96dXfF2RvdrvqcigHYkGnEEGi9xDZ2z7yo6LDR8Jv4YJMW2CFnETSQDUU+r0LCDIqMmUR4/ZKUGmUa6Ap9njBXsoNxfi1dB08sczSbehS0JuRCXwCaw9iDBaybjj/fXMYD6vwkmpGYZ4bZvrpoQX33/jkZuvv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oMSNHgbX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vTLFAVqh; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oMSNHgbX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vTLFAVqh"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C3S8gO015305;
	Thu, 12 Jun 2025 07:58:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=vYTNa1N+ty69QwIHuI
	v4101nNcwgYJ07w7y6z9T8cvw=; b=oMSNHgbX1y8OyVC65v13et5k7NqqNmScwX
	bEYSbrtYkKjfDSX0oKuOIDCmWpbPTeZub8PcRcFOGLtVGFth+H5QE55lP6zIZqs5
	X6l2k7YWF/7UOff1mOsFc5iE7xX+qOilaVF9zQEEKIUmSRF8XrZ0c6qWnqJDPZAJ
	PV/8pR3pm9EFut6wuet5cbE1qDS++liwm9CD+7K+jqy521AiwiQ2BDRWrEcCiBLe
	vfvV2ShRP7BxNeJxrNAhlUogwDK9sP45g6sjamdIgJ92L8jceUSXOzVG1NJbJqd8
	0nibjEpKcmdhkAqMGvqbEUDJvoKwMEF3RRbNLDoZoUHEhMt6uVEA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2111.outbound.protection.outlook.com [40.107.244.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 476ksdbu0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 07:58:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=er3rbLL3qCp+uLgnDFPYj2eC868lc+e/Ak40B8njSN5rEi7vrVkLcdU3s+ghZX1jW//Bk1yZ6aFATa9AiiNVkID1hlKtyv4dqvtc7XVAg4rEJ62PqGRxP4CyPfBMqLoqRGV+ZnMtrTZtiJMYtM4iF3nGF7MfFGTOvR10kFBlpzfNfzdf61uYhF6BTTiPF/9rcVmuq9qfm09Szn51OkD1hj9Z5uz0VcH1qn0DizW/vpAqRVrirk+/nm2ZKGR+0PFRshAcLvh4cJ1lDQ6UL+Wohar4arvuBxuQE5YcUPm6BPPf3wg1wO81/UhOzzkmKKOWTcG0gKHl0zeKaknpL2t0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYTNa1N+ty69QwIHuIv4101nNcwgYJ07w7y6z9T8cvw=;
 b=aIblnMpjZyf/9RAER3uZmb7zLxukQtgjh0Vpk1D1U+0H/PUkjSeMfaStPvmNxoW1AwJ9FUjPjPfcpVQ5xqqayTPdrw3E5XR25KSvMuFbNr3nKtomoNeB1zIA9yw2ihrpSxL9dkYjMOIyKS6CP9LhpBDe6R6jwXvfyFckHIZCoGM1+I6T2EB9Plbja1hGCzMuYLgdEU6owgMHnTtIwO97ZZJQIsU29o71E3+hjaJNhZ5oskmNaQ4MOHR/uPMejZE+b1muokkGpdUkKXZYfqU9TLvOMHY8qurbsPpQJ7c9qKbfn5fN8v2BEx513gtpOz+BPbza9FQBmORU/lxH4+sj8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYTNa1N+ty69QwIHuIv4101nNcwgYJ07w7y6z9T8cvw=;
 b=vTLFAVqhKtBEIbor6/GVVoH5ygnQtbkU4/l0B5b6/jyj6mLRyUziUYPhz2G55BJhQZpTMUkKUWzyJmllshXDYYrbwf9WPpIjV6Ro7sudg+dahV+AJXXKF9tcNJhnCurAhU9C1MQTFeynSi+XSBhtFQ++DKVp4xQLGU1HMkGHLsM=
Received: from SJ0PR03CA0047.namprd03.prod.outlook.com (2603:10b6:a03:33e::22)
 by SJ0PR19MB5381.namprd19.prod.outlook.com (2603:10b6:a03:3dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 12:58:06 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::60) by SJ0PR03CA0047.outlook.office365.com
 (2603:10b6:a03:33e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Thu,
 12 Jun 2025 12:58:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 12 Jun 2025 12:58:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CCB4D406542;
	Thu, 12 Jun 2025 12:58:03 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AFA1282024A;
	Thu, 12 Jun 2025 12:58:03 +0000 (UTC)
Date: Thu, 12 Jun 2025 13:58:02 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com, bard.liao@intel.com
Subject: Re: [PATCH 3/3] ASoC: SDCA: add a HID device for HIDE entity
Message-ID: <aErO2sfAHciUTO0B@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|SJ0PR19MB5381:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cdfe136-5c6b-496e-7510-08dda9b0c624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|61400799027|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tqZxJIVU/rEBjMUWacs1Q2GekTplcvXYwScJXtzH0wo7tTrsQHgwAXnsJPGA?=
 =?us-ascii?Q?ScLA9GQBbplJwWRAN28lODv/M63SC6OHuLep3z3iCwxUYhoNscfS9hTctZiN?=
 =?us-ascii?Q?tOnL77FBEa4hKi8cOyBxm9BWMT6VUY29fIusctAPopek/r47ydcczZ9nUqSK?=
 =?us-ascii?Q?ny73Fm/UG6ooTTs6I03//CljzHh0w72B92nT8pbvzLhp2BLpsxbH2gCnD6tB?=
 =?us-ascii?Q?Alu+rEXA6oFRqVuMMrt66UN+B+NayYFOg3mVzd9/GUqM02S2PIA+ktpqsQnA?=
 =?us-ascii?Q?rSSOG5W4q95Y0QewuBqoYtQz8XHCpibe9CGYXh9sLYWH/l+eQYzKp1M3TJQh?=
 =?us-ascii?Q?LU4WxbkzIiSnXDqP0Y3++R16knQkUC4FPwQOdbVVEP+TKmcEOY1LC0zAO1dz?=
 =?us-ascii?Q?JOvdyCUa2bkTE0Ua5DnMl09aOVfN9WgHbtfqeFaK2TscdB2QarRq25z8W71r?=
 =?us-ascii?Q?bH8YlpLIFniZrwvS9ix3hJtsrLYu1qXQqgxuzH8sdNPX2u6TdmxAgDNazXRS?=
 =?us-ascii?Q?IdhqcUC+00PGKPL+xC+qjmkLFJCjch4GpDBtKJBeNRI9R7XYeVCjf6c/A7m3?=
 =?us-ascii?Q?uww/BPswMjfqanJecCOc68M4bVEqsWtB17RXuzpFnq457H5IEHJO1VeOgPrp?=
 =?us-ascii?Q?h/JIXr7i8PC3fAxPHHZCj5b88EZdtsoG2767sB2tXveFW7KqumQsG2B05xUT?=
 =?us-ascii?Q?Ofxh0/KEwH1/+wL9hNpiixjxY+Ga2aq2coJi5u0qi1Z6LJsiDKDXgO+a5W9v?=
 =?us-ascii?Q?hVmkvygysWQWoAn9ufb/eoNt95aemEHTklaRlTxDICI1GnlxgCRHVCjwLeKt?=
 =?us-ascii?Q?GqnrEub/XbAgd2bFmGeOtD1WSfd8YEopshKbISoiPoAkg6OGTGC51pJGHnJi?=
 =?us-ascii?Q?0dbyOjkJ+clcv9uaZZihU2PQ2bzZW2CIlF2RTziyOT4TuDW2yGcr6je1QRXv?=
 =?us-ascii?Q?wPy3cL2FoEpZvyzpeNdTLSpqqFp62tPUvS6yab16tvTCWYZi8MaZ/EgT4+3R?=
 =?us-ascii?Q?U7WqctLUQsHqOZdCQws+rOGNc4rPKkH1yCXXs5h7zOsRVMCg2XLEDVeO86l3?=
 =?us-ascii?Q?LKlwvh17KJHOOPyK9a5UFoZRmjCOc58wY/2Bfvq+o8r6hThmQ+rHDFpqdvQO?=
 =?us-ascii?Q?3qvbx1tA7shalzcR3KaJ1e2ux9HH84GH2xI43NTkI4H7hgwlAj9SwtoLQvHy?=
 =?us-ascii?Q?AOhFWu5DhYrdkyFnDjM7v9ggGVtgzlhiPrPRGi4+VXO8sI/z1euqKWA0VoZO?=
 =?us-ascii?Q?dhZm3iNmNAQdbo8po1BiRvV4D5L5YsSxjfHIVZrff+jSUu7qFxRcxFKpd+Bc?=
 =?us-ascii?Q?fegkpiGQMJZOXx5zKjG69o/hFDfPOYPcM9Bbq5nyQ65QNKBRdD0gJNu/dz7d?=
 =?us-ascii?Q?no05XuCNNQeCF82DIbYzgHv4d98bcKBUJBHbVfkdF/W/lYfySvMNSFNEqdeg?=
 =?us-ascii?Q?x7Oh7OFuErK3gkDNXSDHvt5MZuypEghS57K+NIZT4RguzKNXzDo/6Hgq2a36?=
 =?us-ascii?Q?1pS69RV7Jbb4jkK731UkqgppidzoDR4hmKwp?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(61400799027)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 12:58:05.6772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cdfe136-5c6b-496e-7510-08dda9b0c624
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5381
X-Proofpoint-GUID: h1Mry931SR70Lmf_md-0WTXP0EbCpEl_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA5OSBTYWx0ZWRfX6HeA/zge23rQ DCmQlzqkb1xz6xFLboBpzlyq27Qy+g4WaFd2hkHkFhv/Wur6jAJL4rqZa/WQKCnhMiWbVEf8627 UIu2HKy68PBZ/4YshL4Z2esy9ZZbhQSI1kzkcm5iL4ngCaSCIDm4UgnDhRNlTgCj4X7xmxOSYMN
 4IUS8G5w2wZVuH7eF4VMC7qQ87nJHOhKz8pRYsgdkBOAGLeBYnKpGGLqzT2jhr1IPjJLaqSKMlK qmf5SpLkaHZLZNDzvfVX1uA1vDeuDHW42Eh3t+Am1frG02Odl/ijavySBeWOgylff6zrmHYcdnH xvM/lUUsL1P6NjRmusGx+SGjUH2oAg5JRFvQNlykad6mZtW2I67DnZ+sqVrR+420nZfQYFFhCaO
 +KWxxmi4ae1xAYQrnuJ/NxadoHueuabj229kiCSgcsNFBpJ88kB9OvTmSjVuR28Jt5M8Kbn9
X-Authority-Analysis: v=2.4 cv=c5OrQQ9l c=1 sm=1 tr=0 ts=684acee3 cx=c_pps a=f3W5XOz7tIKFJfa9Mwj+Sw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=n9Sqmae0AAAA:8 a=w1d2syhTAAAA:8 a=ifU0FhMTUfAlTe8hamwA:9 a=CjuIK1q_8ugA:10 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: h1Mry931SR70Lmf_md-0WTXP0EbCpEl_
X-Proofpoint-Spam-Reason: safe

On Wed, Jun 11, 2025 at 06:27:09PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> This patch supports to add a HID device for SDCA HIDE entity.
> The codec driver could call 'hid_input_report' to report events.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
> @@ -1294,6 +1295,13 @@ find_sdca_entity_hide(struct device *dev, struct fwnode_handle *function_node,
>  			hide->hid_report_desc = report_desc;
>  			fwnode_property_read_u8_array(function_node, "mipi-sdca-report-descriptor",
>  						      report_desc, nval);
> +
> +			/* add HID device */
> +			ret = sdca_add_hid_device(dev, entity);
> +			if (ret) {
> +				dev_err(dev, "%pfwP: failed to add HID device: %d\n", entity_node, ret);

Minor nit: Not sure we need this error message and...

> +	ret = hid_add_device(hid);
> +	if (ret && ret != -ENODEV) {
> +		dev_err(dev, "can't add hid device: %d\n", ret);

this error message, perhaps remove one of them I don't feel super
strongly which one.

Otherwise:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
