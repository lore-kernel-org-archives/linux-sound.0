Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9443F3D1CCC;
	Wed,  4 Feb 2026 11:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203535; cv=fail; b=T90SzRZT56sgl7Oc/vaEl6FvvrkWrs5zaxnc5oLWZIxMRWf6CbJ/7f18IlCkFlXF5vhOLqvHttDidE+2aJ8IdRY7pzO4c97//qjIWve2ULpNmulgLgq9M06W+DZrj8FQKJiqFaEJ9Hm20GDBv5BfngG51HfRmTAfNfPseK25k50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203535; c=relaxed/simple;
	bh=PQ2QtK2P+a412hV5kGtQHwrR3/7Lq+oyiu8DhH6EDlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZWzIgrUD0crFGuZPbc3d6L/06XfKr1dk/u/uMdoU6RNd/tuipg49maHcm+mz4Sgkq1+L44oisyAW+LthVdwq8OAYMxgv3KKKWZUBKsH1vvch57EQs4evWzdR6Hi2sx7stER+wLNGO54tktCC7Bm58fchE9iov54hxwWRB2IxC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dDBc5NVK; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=A/4bKgqu; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dDBc5NVK";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="A/4bKgqu"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614508Zq2438060;
	Wed, 4 Feb 2026 05:11:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=qt8FlAU35op3k4Kj+H
	iSpWzLjEqhEn9GiKS0N5xMTqM=; b=dDBc5NVKjBB0jF7zmreYmRgbqD7aiOeUZo
	Ae9Cv5y1dNHUGzu7/Ywm1nWgqHihdpmsOMEmzPlFuRhbEAcE+oJoa5+yG/JxZGvy
	sor6FMSeFsU58Ly750xvHtzpGpTfojAUjyeh2MhuyNNrW5wuGOpTdbh887WUjBJ+
	HnHiWO3QbSE8+YzytiaNXvv9esrzmg6Ql0ikRZQ9Xwb2xJP3YunseJNlwoj1nBGj
	zFkhCDvWapz93+yLVY7zKFOaUY8DFGbx5ptX5CRpBGIwVEes/G6rVGd8DnEkltBQ
	ruSJvnqom58aRysJn88s7uRNHBLQQmzCGoyzr9jW6w56kmIhHnQg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022090.outbound.protection.outlook.com [40.107.200.90])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4c1g12ve49-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Feb 2026 05:11:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MsJEFr1v2aT/t9V3YcP4ZuEMesu4MwYkmhSdlysSrtSvJxLJLBTY+KOcMBzqO+9DDAB8nvZB9N8+dWUYxsmAUqulO0FCzT6RJLTtzvwNBNJxKTG7/B15CuZ6pTgyqGZM/ewwds0jNBWdSCkEd/QEQLk63BbpelWgOBxMWrXHQG684V++QZsbKAWet/fH5LugHkC00oFxva6dVxBV9rxCw2mWlRgtV2Utr+2SeDq+Wdj0yIoB+IUs3Zi+lZySCnsveHOUiwcMuNP04BuHLbq169I2uBpzxCgxditj3jDIuOMfXiV9yFsRAh5YWYaJZzMVxESrfJzsTuTE0x0iqYVfEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qt8FlAU35op3k4Kj+HiSpWzLjEqhEn9GiKS0N5xMTqM=;
 b=OEIO0Rw1nxqnBxJ6Zm4X4I3h8aWGgPYHUYnZDKMqO8GJUDs+vbMg7O1LbKHKEESl40s0YqhSoKMLmhkwat69M984/Q/Vw1udf2GCOtLzXivLNzObwzlaIu8WNsHmtmV7v1mpfM30VtNXSkhYeQrNxabQTmGtH84/d6xEeMkNtvQc3JE0ZK1JZj/kqFZZLva8NcOACMWD6a/uwCUOxRFTIEM5tLRbPNmRLxk3zqxRf1cgmPkJ5k82GpTIJu/FGI5O7RIoe7HOeYhiHI/nUXw1fP60yWEx3e1YDg4jpWgheMQLx/SrF57Ha3/rc0IoiOD0zq0BCMXLnfZ1kR9Ez3Ks+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qt8FlAU35op3k4Kj+HiSpWzLjEqhEn9GiKS0N5xMTqM=;
 b=A/4bKgquo3sf+aaUyHxsY65A4I7KZgDPKJmGaK1Zc6hQoNBkOBotgZ1uoK+bzomfOdz7gRZb8ewHAuE9Sr7bRZ2jnsZ0rCMVXyNL823++R611AiuTE8c7D1hXvm3L/vCJ9HpKyzyJq1RKnWytL234sa/ZdJx4BYhstcZj7Jr2ZE=
Received: from BY5PR04CA0025.namprd04.prod.outlook.com (2603:10b6:a03:1d0::35)
 by IA1PR19MB6225.namprd19.prod.outlook.com (2603:10b6:208:3eb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 11:11:47 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::eb) by BY5PR04CA0025.outlook.office365.com
 (2603:10b6:a03:1d0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 11:11:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Wed, 4 Feb 2026 11:11:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 339A940654E;
	Wed,  4 Feb 2026 11:11:44 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1170D820249;
	Wed,  4 Feb 2026 11:11:44 +0000 (UTC)
Date: Wed, 4 Feb 2026 11:11:42 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Add support for CS42L43B codec to CS42L43 driver
Message-ID: <aYMpbnzi/UTO5Fqs@opensource.cirrus.com>
References: <20260126144011.140029-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126144011.140029-1-mstrozek@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|IA1PR19MB6225:EE_
X-MS-Office365-Filtering-Correlation-Id: ae8c1bbe-f568-413f-8141-08de63de2f5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|7416014|376014|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s1YgNc4t/lzydpDc3Zd7s+Jh/cFTWBBej14Yczf7S8gB+q11HYRrj4sNkHfC?=
 =?us-ascii?Q?oKEY+cpxiEG2bvWDrkB7bB2rwb15dGHVAovFBhoNagGtMkBafaIlO8tFdPeR?=
 =?us-ascii?Q?G+SI5fKvJBhRlu2i+fMOzxPpuVLStcIB132sKXnl37N1kKhKkd59EzHmsjSU?=
 =?us-ascii?Q?z/UfYy58dwCCNp7NhBv0qQVfOrbNO9EURW6etOnzyYe11f2KSEBmOp+vJJ8e?=
 =?us-ascii?Q?sy8GX/BZ5VE7tqx8YX3BZFNq84aM06hyISpN62R/5gdDmvcemDZPwOUtTDsd?=
 =?us-ascii?Q?FyF+7m7C+QKV38qQT286arFHXPs3DCjsEUhd51ewZw6+lXp/yU/DVZJmwFig?=
 =?us-ascii?Q?Z8Xm4mPCXbrKRi2jWiI4+77qofvFUUSaqDzFydxC/enAUVztzMQmQTgsK8w0?=
 =?us-ascii?Q?+RxggwBRLQbElNnyTV0u2YAk7NP5wvdwH7u3ZSOI6raUXVYONik99dULhS8N?=
 =?us-ascii?Q?xHIkrnNTHyDL9ch2eKtSKsB08Arkvv16doiGrDJrbJ7na1yKewgXYCTuW7Mq?=
 =?us-ascii?Q?cQAhm5v+4bqh2VWNCInqEzAuOPRG8btxpkX7HruvMYqU1DqxF03VzBZwektC?=
 =?us-ascii?Q?1zsrqIXpDNSqTYSiyqc73WIbFM9OMWn0edV08yeCSonfwaesvZjfvs096UWf?=
 =?us-ascii?Q?X/z1nw5k1Jf0zlAC8oznVl+BxtKaoXWywgJ0rVDYBbfc/UlVftUyn+cXUtDR?=
 =?us-ascii?Q?Amh0Nj+nZcTrJoQ1I/uxHJ6P/BSZElj5HyAak49j0o2EfxF9olLkZezBmMV3?=
 =?us-ascii?Q?7M+sEr2gjEmSwv434F7OUMQ1Gr3PDy4iGQtxSG5JjagRv/rIfRUzREYn99UT?=
 =?us-ascii?Q?TMvKnfuPa1SctJYk1pO4Dsr81efGzXAik7MwCQ8T2P+x6e7xGnEVejThZmlz?=
 =?us-ascii?Q?fGkHYJkNzVZfIteC1oUP6jY6wZX3Z2MrYzERhGaupBpQ+TuyptKe3SjdT6SM?=
 =?us-ascii?Q?+BW5GYbjn/JP4u+87umYkQW/27FY8tMpGi6z+95TjFXTRNuTeDVCEdie5gBA?=
 =?us-ascii?Q?aExQM0kwp1bAwxtytvp3q9w12kgZ9mo+du62WWS/Nt0mXSAmBWjAmzPJ6r/w?=
 =?us-ascii?Q?gW3yiDrnfNXx4cId/Yv+KyFAzILtiTEUX7H7AEvze1gd1s58i+qniOUkv/cR?=
 =?us-ascii?Q?OocMDEZRt4y/N+NdDhJOhfKaNuwRtRQO6J+iO7xKc4xcF9kKmrKHFYfgkpSt?=
 =?us-ascii?Q?QWw3s0djgjdSFmq5enEim6dS4QChg0F0jz3qg6TAQBI47Wne91oKwmQ5nIJj?=
 =?us-ascii?Q?5iF/rdH2gJmlXU1uQDUaEWAWq+RTaptiBWaK1AMKx7Pi2ltSNgqw3Opo9RX0?=
 =?us-ascii?Q?XB+OPr4+C8loZiVp+jXC7oIpjbVPVfyjhJ8YxziIOMvuu4l7eOKSPD0i62IT?=
 =?us-ascii?Q?ynw/eyan/g/u418y1AbatjY8UHb20Mf9hEFJCUP98ZVGfJbFyvFP3GDoFrEU?=
 =?us-ascii?Q?1j5Jrfey2yJEM9DJkk9qhHdGtdBGc/OuTd2YuOjA/81VXNUSx5JXm+bC6aRi?=
 =?us-ascii?Q?7hX+HLellVFuAboPtGNmgA3H67fDPA8LE5YvdqD5ZbHq7QynGjaBcLxMHhQn?=
 =?us-ascii?Q?sX+nXjwEI9eOYf5gqcOlhfkswPANn1JG6A075p3Sr52JxMHGmnEzf39L3YFl?=
 =?us-ascii?Q?KbL8HT6Cp+mhbFYqx+Ve8xNB+6vyjCItKUrq5JlKezBD9Q0c3TOaMvz7tyAQ?=
 =?us-ascii?Q?lSQxMw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(7416014)(376014)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	reoDTEYgm3qfIUi7zQS4JFs/M4i9sqxCmtNc/mQTAVnSxaJa/FxKqyye4SG+WliMtBbrPK8YNyOITJMBKy+FbbutfSFExi0FxHLi+XNASczs6PHxpJqs+WucRUa/7FDyUpH8s0v16E4RTK/MCSsX0Q2WxwS4fh82Ev/yqUf2t2cDWOhZqQUWE/jUZ3lQ3qx/kAaHYXA+cF2HBcrBhwR8Fi5MI0YeIWEyks6O31sxZUs6qRbhZLNmH2r7QCHCghsGW+72ABaZpfSttqbFGnUPYgGh76SBxnkSgjC5JWq9zipU+pomYl2VOXkB77th2W/nCYZnrS+4t1VtbImUYTnArqcQyqC7yve4Cxl7HI0mpbSHgbaaUJ1vn/17JYcF7F29C2EKMfD+haQHv35sF3fYhTophMS6278FK+e2FS+G9V+SwXrRlPm/Q0GOEX9X5AHa
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 11:11:45.8534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8c1bbe-f568-413f-8141-08de63de2f5e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6225
X-Proofpoint-GUID: 21azQAukmzvtFUClCTPvXEJJKQ1lUqlH
X-Authority-Analysis: v=2.4 cv=Mdthep/f c=1 sm=1 tr=0 ts=69832977 cx=c_pps
 a=EQiSdmqO/0h9UsHobtR7BQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=O88-UEvnqW5qY6NVAaYA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 21azQAukmzvtFUClCTPvXEJJKQ1lUqlH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA4NCBTYWx0ZWRfX4Yaugg90NEWX
 pf801zq7OKKAtzyLmAvS5f5vdutbVDMfrM6GO4DSs2WBCzKG8mnDSU8gkwMA375IvGGO9VTL/Zt
 Ou/FppzvUUSQtMckDZzsMekUNHbwZtmmt28tt8AT1C+861azMIVPlMdHf121YYyb8TPx17kquVL
 WAOaUIEu4rVnj1Zm2/kTEmM4mdW56K0t2NzJb90ND15nAQDWQqibsygo+JoFNMlXFru/z64i/N9
 CgWSQXYhlknk4XL5ge6yxpcqRN4rhpUy7K2i3tCxWJTUrwMFM3HHOJAY4K8dMv+Lp8EzEDqKQlO
 hXCM990GTCF2jvxNdGrWx5vzcci7dqweJNHRcEintcL0mtPMq9wBogxnpXCTANGnt1QNz6scToS
 h6s3FRAPYz0SdzaWX04VrmBsQkfM8EwClsriBMv/L9f3XpowoXsIFMjwUbRXteUGmqwEoNx5588
 r4AQANAblP1jBpIsuvA==
X-Proofpoint-Spam-Reason: safe

On Mon, Jan 26, 2026 at 02:39:14PM +0000, Maciej Strozek wrote:
> Hello,
> 
> Introducing CS42L43B, a variant of the CS42L43 codec with changes to
> PDM (DMIC) inputs, RAM/ROM memory and extra channels to two SoundWire
> ports and ISRCs, and can be supported by the existing CS42L43 driver
> with some modifications.
> Support is split into four commits:
>  1. Add CS42L43B codec info to SoundWire utils
>  2. Add dt binding for the new variant
>  3. MFD driver part 1/2
>  4. ASoC codec driver part 2/2
> 
> Regards,
> Maciej
> 
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
