Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1051D618C
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757341052; cv=fail; b=ToaNOt8f/G+1idODEfoGDUA7ZHXCwHHbekGJdtvDcpY/V8VybN21eyxCskN82cBZ0l5ZioPcJQh7nJldTFPDEgvMPHgq1DliCoUR+5dccnzoLr8HGBMZqHuym1tRdeKlzT2rFMuyC3D2pNATry7tXiq3IybNlEFOHTJpPb+L9Fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757341052; c=relaxed/simple;
	bh=uAQJOA9pCQImhXDu2MaWkV/mvkOaZn0OsLwLtKO8y9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdyiZUo4kpWWBhhSW77PwYBbLLcZogapQG7JFadR4bkNxrFfECVtl1WvCuyEs8bGSUK/OYWe+1J4y28mv9msi4AJ6VynhLEuIojmBe537mf0X0lo/7O4UrwwiX1zDqJWNpj5YRE7AskTTbg30H/onThdhVQJPE11eh0iq9dersw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=md3IM/MG; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FZ4xkioW; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="md3IM/MG";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FZ4xkioW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5888UlWq2152512;
	Mon, 8 Sep 2025 09:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=3xTIbTE3PiIviE8Y4N
	ufG6IzqjMLerIetKwyhQgrPPE=; b=md3IM/MGqgTauR3GP8izc2JyY/2lwGDU2e
	HyKfqGaNG+gpcCDSG9a26nfD8J3TWZ0GTDBfhRd6QS3fm++V42zjKgAuAZzokE0w
	mvb0Vo8TNocFiULKtskwTE0sNkW4h4lLjVpdTFnB5bIAFndH3FBLlDtJZO4shkDk
	w7k+R11u2LsxKWPX50yUzJTY93yIbpMQ0GELnwogT06sQTAwsh7iG9scLJVUBipA
	rH4E8QrjlFaH0+hnjugWX3g7BWvy0aHwtD2fF9YWpU+aGkE6d0MSbDSU06MuHZO3
	7+ElGFZVBlPXRFmdMXo9j/yLiwz+FbJvPgVU6uaVyhbKppdDSC+g==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2129.outbound.protection.outlook.com [40.107.101.129])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 491upq8c1m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 09:15:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UKYOtzlooQ8dqV6WdZ6bVPzK4q4B4t4Rw6FBvfONO8nxB1YscK4ayAwSBfPkEkJ8MQ8LnIlE/05W2XbfJpqS4Tv7+TbGsdJBVRqULKbA7nMeoUsOEScHwdkfnGJQdZGT7zgU+tZZulVZoOtX3WHg+qiQUGkc2qHaYtRuG0lbNaNXsQzHj2GougRR4GXpqBtiNhCPIK32H9dEg31ZL9zi8314X39pPqdi5wOrYpMwd1cJNaucSSAh8Ms9/DNI04qSEV1PyFAMHa5TKXsolo1+dGTOuKRDDAeT9zqeryasvLC+GeF5bZb6SI9NC7ED4yivIiS8MUy1vnlFJZJU0bkkgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xTIbTE3PiIviE8Y4NufG6IzqjMLerIetKwyhQgrPPE=;
 b=diJIDYk/8bUVjEt7QHag19YkQCie08adIhyTknLgIaBjy8gpksdHh3hmjLnzcHZukDuMZtjeuvocJwGIBIIMEUgbXHMIKeBefcaSlUCqy9CmMRwIXLL1ZKymT2d1DJph8blmQd4K4dNmBHpQkVJtuVWxl5fQeoCOq6YJPiO6P94H1wtuLEqzkP0/c79PMxS5ppPYx9SGRGU0iNhlAkt8E/kwCAqgiek1P1YAu+MY4XHhwwz1XDBWxnPtqJS3MwOBVBe73SkON+YfNR4UtpGic1YGrTW5MnM3njs3oc1woyBB8In28Vn4GlB/+64MOZPPZzPO5JaLsqjtQYdd+Q2vRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xTIbTE3PiIviE8Y4NufG6IzqjMLerIetKwyhQgrPPE=;
 b=FZ4xkioWXpcFUaBkiZKn77mJLZegyClvYy8govAYv3wwW+xjcuz3FDzqUllzI5wpKdf++4wzU36CQAOw1u32auixNNQ36bC5mW6zc/OBeIZ/3j/XYQiUcAgUmAykCoHHwnlfMKrDOZeFB8emYIhBp4IPpY5j225h+OHuKw0BpqE=
Received: from BN8PR04CA0061.namprd04.prod.outlook.com (2603:10b6:408:d4::35)
 by IA0PR19MB7243.namprd19.prod.outlook.com (2603:10b6:208:43b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 14:15:23 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:d4:cafe::fc) by BN8PR04CA0061.outlook.office365.com
 (2603:10b6:408:d4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 14:15:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Mon, 8 Sep 2025 14:15:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 25C52406540;
	Mon,  8 Sep 2025 14:15:22 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0F4DE820247;
	Mon,  8 Sep 2025 14:15:22 +0000 (UTC)
Date: Mon, 8 Sep 2025 15:15:20 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 02/15] ASoC: SDCA: Add manual PM runtime gets to IRQ
 handlers
Message-ID: <aL7k+JaN0W41wyqJ@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-3-ckeepax@opensource.cirrus.com>
 <f5716cc7-8971-43fc-a646-56a9353fbab5@linux.dev>
 <aL7aldXtzWLYDTt/@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aL7aldXtzWLYDTt/@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|IA0PR19MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a8cf237-7f19-47f2-5464-08ddeee22679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z56wjmDGbWmaKsUoyMB0yutfKuvbuRKIj/nZPsfo8A9rxikYCAmwQtKxIMUh?=
 =?us-ascii?Q?IqJRi/s0CQhNVTQ5VUfbF4IJy+6Ey+3u0sZNV82drPTOOo91PAQb9TMp8d49?=
 =?us-ascii?Q?aNdtlZKyBujlXmsVxi2P04EmO8b+W3zUR0zcHRs35IGiZKhv7Yvh/SYa67XG?=
 =?us-ascii?Q?PahLDTp3BU/Ncxp0Mj4DswtWwR1HXOPWONE3TaEtWdLzOBFlt96XCJM46fZT?=
 =?us-ascii?Q?4uAU5cpiMzOkPUcRrS53w77jKHJ7JaKWvfHZPTyVFqlmuPqK8UOLD9mulTGm?=
 =?us-ascii?Q?bJWb6h+KTxQoke7bUrfmIANw0L6q9tyhjNykOkutYrKvj6x8kBFb9TEZ6PSr?=
 =?us-ascii?Q?kJ2pZNRIuNEWrR8LSIhy0SHW4UQMGL7MHRjO3t3N+P+g6TqcFHRTk3cRe8yO?=
 =?us-ascii?Q?rEhlMzgt+j8Q/xaMiZ398Tbw69G7OD6UsVUxOO7qtrAL6gBESmoMwAU0jRal?=
 =?us-ascii?Q?U4+rWm6bGAqFyrq3XYTknjFG4YFoSoxKjP4al0ca4nSqbZXKLNWNHHCVJVFA?=
 =?us-ascii?Q?HzcZTa/TPtHZAPohQ5oiJQjkTbKmjCf4DYGnHDHFePax67XOSYrSDxsy1qXx?=
 =?us-ascii?Q?a0kXy5zNqFNx0ANYM0kuyd1I6v1iN/ujHwJ/T866a+vbbqylkAt02uGZFVoY?=
 =?us-ascii?Q?W7NEEGsfb8SgDMLfw1ZTCiZlAKWaUGscDBsTumkEl+Q4MQT+hWYQujzEykhH?=
 =?us-ascii?Q?zYzjq0pIfgVmOd7vyGxlT+dftFJEqAhwVSE73gUGpHOLTmVt4x1Nxur5hv9O?=
 =?us-ascii?Q?W0HFfdby4NAwWeH2zKTrsaf1H/y/rscDeq5+JMeK2nouMKesZ5CaFU9goA9Y?=
 =?us-ascii?Q?ICS/yNcWwwyXJTKYH+jxVB9FSKwTigoleUF3VDqrYCaT6V+49B9s4f6okcvU?=
 =?us-ascii?Q?kr25oYOEwHuVkRAYP+dl3ywVPA9AdI6AEehR1QGHDHaOTKhshnRkr5t1zUTa?=
 =?us-ascii?Q?XVqoL0jJyqWegDAS4f4yEjT56Y2PuYx9VqNdaguG5NqltKleDRxw95kRpxns?=
 =?us-ascii?Q?YxcSLDtwUiSftRfLY+sigSpJdz85cZtoiMn4l0VFIGkrPI/9nnqoS38NXKDD?=
 =?us-ascii?Q?QUglsl+PUYMm/GmDhNnev5h4CGcr/+LWP1dL3F9q0/ITRfOrueAAhoecwAgI?=
 =?us-ascii?Q?JjPNAaagyExucjlAQwmlzBMmIBXAsi9pY6N9AHyhCrruKV+GBMhITIPMZS/k?=
 =?us-ascii?Q?k5R9hhvbYiC2eRnpi+/HO6nPEJH3jTeQnk8SHYPk4wckLvVXkNE4/Zc87fDT?=
 =?us-ascii?Q?SRaTUu7cuR1Fq6Q+udk7l/QCgwzzlKgfhfXbrHkRL4OJM/SyLuCaFyMfmX8m?=
 =?us-ascii?Q?EJ5mjdsqYCLziT4VhqNIV/ccr2oymgGsuy9uUNdycEOrdKCfjpIm/t9DaFrU?=
 =?us-ascii?Q?yp47stWv333sv/KrXS4aW3XgfLjb+It6YVVTsk1FfdGHLou+3rs/chzbZoab?=
 =?us-ascii?Q?Use6DHtD0ESIXaDUXfcYX6hKwL8DOYRT2FgLbePgMX07zIHcZjALtZdb8M73?=
 =?us-ascii?Q?WN0Sv/ydGBLU8g02KuNdqyhwiIUsqH0+BzyK?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 14:15:22.9830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8cf237-7f19-47f2-5464-08ddeee22679
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR19MB7243
X-Authority-Analysis: v=2.4 cv=DMuP4zNb c=1 sm=1 tr=0 ts=68bee4ff cx=c_pps
 a=vZkr2q3v8/EhvrwyCn1p2Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=-5p1rIFNb3oFAzPg4esA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 4vyEFYIiPlkCb8huxtJrfzOoPdx2D-Kd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE0MiBTYWx0ZWRfXz0nb/7BE23ed
 KMb/cqYoFiPcbs8VkbF/hOLU4QEn2txSkmeHXADW9WO6hK9exSAaDIOmvTaXVxClOgWfNCYbLZC
 VtmdV9ghc/43JZLduauKBsFHlHLnfUEifCIinTyNd5i11GS+8u3//aSmIOFZrxyX+v0Miph3rSq
 J7jlR/pQPMhbJYQigJZDWo7WEVqTbQveY76F5KHBxOONOIT2owefeQluATG4lAXg0jg0OkPzdzZ
 xzNMkgH0Me/iR/Ush9f70v1NskkwiUT2oTqiMeh4xQZZy5OCuSlSeiKHJOya5SGBeGUCjFuptA1
 bYi28u04zdvUqfBHIBgOnEYZpP9tuHvBFXMPipQfULExH9CEx2rBAGZkTAxk54=
X-Proofpoint-ORIG-GUID: 4vyEFYIiPlkCb8huxtJrfzOoPdx2D-Kd
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 08, 2025 at 02:31:01PM +0100, Charles Keepax wrote:
> On Mon, Sep 08, 2025 at 01:42:40PM +0200, Pierre-Louis Bossart wrote:
> > On 9/5/25 16:31, Charles Keepax wrote:
> > maybe use sdev and pdev as an arbitrary convention to help the reader?
> 
> I quite like the idea of this as a naming convention, will have
> a look at updating stuff.

Ok going through the code, basically almost everything uses the
function device, so I think what makes the most sense from a
churn point of view is: dev=function device, sdev=parent/soundwire
device. So I will update things to that.

Thanks,
Charles
