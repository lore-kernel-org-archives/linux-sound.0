Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CA2394788;
	Wed, 17 Jun 2026 09:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781686931; cv=fail; b=NoLGVuPPHz4DBw1osaPbAJaZDtiLyWPY7brFfCBEudoywrxPlYtyLPBcCOG/Lxvm2z/7PIZ6UdCZwmvJcgzhAcO+akqeHLU7DxmQYBP4timEUUeJu+qnZ/d9jFt8mB/IJUaew4XaZQVSC4qBOkBu0IrQV2c3EI5Btk1vefmorog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781686931; c=relaxed/simple;
	bh=QJ5O8tJX7l53zuVghJEeDoFh93HYnvNiPLpk1p+FFJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCWRIMV1ipPgs5ZN5pO9rO3wh43Bi7cSYmYIWXUs4+mlaPhJynlPxMdJyACMCWvyt4mR8EggyQMwfHJLh82E89wek5UuFjS/sB7DLWszQaNw6+5bHZRDZcZqcvFm+KF0HQ+KpsLZXwWVFfhLsh1KO4gsRDhGOAIUtUszE2ZczXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ml1UM5IA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QVNRkc0m; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ml1UM5IA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QVNRkc0m"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H2qmPd1832765;
	Wed, 17 Jun 2026 04:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=dcVpt2TYEGjLWB9MGw
	T4inD1DtVqMFuwItANkkOYovo=; b=Ml1UM5IAdliBRz8QLi9stooqvp/0b0c/Fb
	sKzzcMj5FES+one2UTi/fBn3SF3zf+tw0pOx8ac1stChYTsnoMT6z8bAVLkdMn9l
	7pxahBokw999DBj6u8SwpBkR7U/P6Zeq7fodW8dbjYvyqV2Qd2kjKf5r2V1Z5Zuh
	iEPAK9Dz6d7s05cYRigr881zeYTAKGOkrhba5pe3CMGhE7GkBNn3DxA0TysQysDS
	k5nmWKc7x1nia4mQ/LbL9036Y+rwRIWxsmCS/YeSJnBslCSLdIIHVEKCsBJG8Slt
	cXXVgGKS/14XSmzPa3LGqI3DsDUuGxgYHbTEvxHUwnyu8SRHPqDw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020135.outbound.protection.outlook.com [52.101.85.135])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4eueefrne5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 04:01:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tsea6lFbUMwDSyCZ+hpR3Rs51V9AIf6ugqOC+nBBzTWLU441ujfKVh5i/I3guyGl+AM9/z/0Xg5SfGhznOvnW+SWSXGEnis8x+8YvppnSF4lIKI09psJgTCmMWVbOmxHMuaRUmJ3Em5qlza4Becfo1SpiBL6P/q6wXrQSU/uNj3AjIqNH+2MP1zVhanustrAeK5zcF14WdyETTUiakdUr5/lZsn00+ncs8Qf4d1wAzZqbt8uEctlUHP7FWZbhkBYFI/GxwPq2uTMt5GB68ezxhIH+IqU6uKrUc4vACcYC2WofcOEJKk6vZsS/uCSEMupybhHcGkvaTx4oqfsVHkK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcVpt2TYEGjLWB9MGwT4inD1DtVqMFuwItANkkOYovo=;
 b=O29xP8Qe4BiyOAmaWS/m3D9wwilSMZJqUKo5eXYlVPjdSAcUkIZQICRI1bUc0uHdp66X6aGsyseNDu4rMkKxa29VOqo1BX26yuu1VT2OKs/NNNz1t1mK4/KUPL42rG1zzjJAz+iQXfyITZ8B4/vGbEStA0zNgUm216g8wM3js2n8wvGww/LKjBrzN9jx37KHNeFLqnbJLzlaKvkXsPqEKxthn6/lcASRGzidGW/pXVAfb6HL1fiBO8PtyOB8sfYyzc0RDtZADZJkfFQ/anbi6bZhRFEOXJnFYNB5f0/LKIIXFuxmMt5asMU8ocyhEJsGfg574nMmrEMd7Qss8c/1HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcVpt2TYEGjLWB9MGwT4inD1DtVqMFuwItANkkOYovo=;
 b=QVNRkc0mrhAuX2WF0FL08VEtZpiIa9ewVTZ9lDzJYzi6vKebFNEmlyVQhjOAX+3dDL56xyKUJaPWz0ye2ruITfreWv6CqxMweqjWIeZYFClfhamth2Evv+J5WdVmQ1Rz6T2PPOQe2nSdsYMA7xy5jWbgKyBkUHsoL7+0WLv03E8=
Received: from SJ0PR03CA0179.namprd03.prod.outlook.com (2603:10b6:a03:338::34)
 by SJ2PR19MB7560.namprd19.prod.outlook.com (2603:10b6:a03:4c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.17; Wed, 17 Jun
 2026 09:01:28 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::a1) by SJ0PR03CA0179.outlook.office365.com
 (2603:10b6:a03:338::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Wed,
 17 Jun 2026 09:01:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Wed, 17 Jun 2026 09:01:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0429240654B;
	Wed, 17 Jun 2026 09:01:26 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DECEC82025A;
	Wed, 17 Jun 2026 09:01:25 +0000 (UTC)
Date: Wed, 17 Jun 2026 10:01:24 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
        broonie@kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH] soundwire: Correct ifdef for stub functions
Message-ID: <ajJiZCdR4pUZbwjN@opensource.cirrus.com>
References: <20260615150523.4006982-1-ckeepax@opensource.cirrus.com>
 <ajAe8DX6XnopzEb6@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajAe8DX6XnopzEb6@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|SJ2PR19MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: 400ba2ed-436e-4cbf-cb08-08decc4f040f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|61400799027|23010399003|22082099003|16102099003|18002099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	wfWM5aG/qQRhMxN+YCRO8DKEcC1rMzkyzp9XDlNlSJq8Lyc8Z8/2RkP7foP9VYHmkdGmCGXvOpI121hTlSIvmSIUYz5PQrf5NQNX4NwZdY6yMNzjcrDF1QNNJLJJxvHZNmsVzVNkR3WBAi+fihWXvN/cT6jh0yHavN9UlGDy2OmHVq4IBcO2K/vZO8WuMmxYurWSPXTc/+tDLNHtF3NJLGKuQG8FpiEPM8bgBHAGXwRWdmV9Sh+VuIt5XeYFq4dyc6rH2Q/FS9RCjeVjJ/aSO2KFIKQHyEUGEw6yuYiH5C46TrhVT5pB3ecgUQyiKSZOuJR8KYLjAeSBzeW4ROOl32i5k9bOMvT9yoAzT0T1WLvckdw0QOmZgl1eDn3RJKl4ZOuJk++xKmlifopVgjoHkUnbxxCdlXDYklTbgFDyB1HD31vsKN7BI0me+lCLyI/a+TDyhw9j9rk+XgntzwWyv305kpccaQOfcMe/c4kRvRm+sq7bCewzdka8WdQM8f8mKTGJu1lkjuvEUBZh8yHkvWd86JRof9B3xh69B/N2twAZh0FnpS/MFh8JRwb/Jrq3sWpfUUA3si6g9A6OzUNPlWNYdA4miP4tvzrWO4tMDxr/QBQngwWSd1l5q+d/9U0slLmyitTndfwcuAAc1287godUKvsfg2UGkeWWOafa6DX2+MEP0WqaPoPI5P11ggyjVE8UmJ37IZoYFu1mQkZGP+aczlecTvTxL6s8CMfCsqw=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(61400799027)(23010399003)(22082099003)(16102099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CUaRUMJvwXCNeVi7EyKazAcL7DLMKt0kkvMzBhWoeT3lLvwiw5gsGrHBGATAETBc+RjhJrGHTAnc3ZHRoDqGUNDnlP5KqmGB3Yi6DqVnes7j7ulBj1Fv+y+Aeho72MGjeQvJr+p+OuaeDeFTlbVa7R+RkIpF1qpmCmY0Fy7+0xsD6e1fZGH4T2Q8vVVtJr+htMTNd4SEEs/oJ3ld4vikKuydCf+Cojo6xvJFucKsEUkH9i2ky6s47NdjLqm2ZCctVvU7yz8EreWL/jeR+2otcAHTwePvqCN4qfEolDApaxq07ptWk22cXlMQcx1trml8m2tataLHGzfmAOf/Rzt/rAhYjCa80uERw6MEGzLncZcBzbHsJdG2uxNuztIwjgEKb1ta6DepTH8SvgmtukBk9T+1qGAxB5K8Z725EGoO6mGb8nd/mC1KvuqKfAKXMNyT
X-Exchange-RoutingPolicyChecked:
	EJSLXZAtvJOWmqgbBos49SscsZC/PCJwiyqvabL4FecQW6ZI/BGHn/t2p0/8Jq1Zzb0OrP1O5kHfD5B6ZLaW8ENdsoNWt+0H55JGVCzxRs9wuMoxHCfGcK3qpwbAmlcQmBByFqA31RJvhV7ZM7QxuHDm+3m+q3f5ZwNnSswWwHOCn+dA1ngi4xbUNw13cbj0QC3L9k2P3Jg2GCpXzdGwEiw3mUbydXoQ3rpeonJpFMq2y7IITLCymglq8DW5YfmD5mYQYbbuk5HU2r7/DjNgyUOJNG/OPLW4o2RDS5I6XoxvIf/gNxk3RPJZAyGU4e3WBqKmVKgcR4D6HrohMoToFA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 09:01:27.2586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 400ba2ed-436e-4cbf-cb08-08decc4f040f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7560
X-Proofpoint-GUID: pB4H6g54wqdD3alYgV8bS7haceToHfC0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA4NCBTYWx0ZWRfX33mXb3NifZG0
 vjFuzVdPEndy6xfLdwnc705vtAK/2nPWiEaLznbXHj5vgrmEf4nIGnI+ShiO0aZyjM/Y3rCbvSu
 7I57H/ZtVYvkwMwQDRb2LxBxqgPh3K0b3iAR0CbiB7Rbh+GVlf2qgA5QTfAM1c9scFYQUhMTn6j
 hEN6KCP6bSnRVdIa3DYrR0nLha/WA2oKTgJukQhiUmnF6JiFsUqYenZd+EKepKu7E+Xa0cf2t5K
 fnqPrUydAMHud/jVLuTV6bNRcx+/9wZbxnR8ZB/jZ7Talg8IUb69KzeDR8hJXOVSy6JLk91AAMB
 uUuNVSmEOegpKHUrGXjVjOT6mM67sii/c4epgvnBEthRyf4gjNr73QaR9TajJpQcVqllJfiUmob
 EyP1lIZ5KpeVo0pz/wh53IwdQgYViekOc79eegMFbP8lveG0HkI8drMAcZRl3AkvZBX66KfDruX
 5yMQO11yxF4ltOEWc7Q==
X-Proofpoint-ORIG-GUID: pB4H6g54wqdD3alYgV8bS7haceToHfC0
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a32626c cx=c_pps
 a=gLGM17pEjTTnGae4oH5VFw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=XuiiAzAj2Z8fXaBEC6wA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA4NCBTYWx0ZWRfX5FcjpGnqRbdI
 KL3dHcSQzrF9UQNa1gor76MBRQ2m3ULfQ5xhkDJrehMFt0JlrdIpulWKyt51Rs4d3xhlQv6TdME
 UdgxqBHC73yQvE4ncA0N373TDce5J40=
X-Proofpoint-Spam-Reason: safe

On Mon, Jun 15, 2026 at 04:49:04PM +0100, Charles Keepax wrote:
> On Mon, Jun 15, 2026 at 04:05:22PM +0100, Charles Keepax wrote:
> > Currently the stubs for SoundWire functions are enabled using
> > IS_ENABLED(). The trouble is if a driver intends to use the stubs
> > it by definition also does not depend on SOUNDWIRE. This means a
> > state can arise where SOUNDWIRE=m and DRIVER_CALLING_STUBS=y,
> > leading to a link time failure. Update the stubs to use
> > IS_REACHABLE such that the stubs will still be used in the
> > above situation.
> 
> Feels like maybe I should have noted this can happen say for a
> driver that has two control interfaces. For example the rt5682
> (in the test robot report) has both an I2C and a SDW. If only the
> I2C is selected but the driver calls stubbed functions from
> common code. Typically these are gated in some way so they arn't
> actually called in the non-soundwire case.
> 
> An alternative would be to add a dependency onto the driver to
> ensure the two modules are compatible, but this felt like it
> would cover more cases.

Having this weight on my mind for a few days, think I am going to
switch to just adding the dependencies on the affected drivers.
So please disregard this patch.

Thanks,
Charles
