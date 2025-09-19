Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44BE10957
	for <linux-sound@vger.kernel.org>; Fri, 19 Sep 2025 08:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758269218; cv=fail; b=RIze0D6UImoQwgrBn7WSpl1IgPvccIjqR2SOLk25FKZoMWjiE906Zm3T5DtbHSk4Z6rUKFsAnHE8wiuHfcbwos3H6PA6LEO36MGpAJJ3LADYHoMsWvFd/IZsJHUGOawzjhh5puiKywFUmz+kOdV7NeleweQrPgJmvPbVAsjoUKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758269218; c=relaxed/simple;
	bh=g4cJf0LrLZLe3ctKczwipTgLnLwsJE8/4AUOZDjCwmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBNsIcTZPq2vEI0hvvHtydcrWtvSPYy9nmb6vBCgQi2xhzZ7C8wB8Avniq4HWlJlDoqnYR/XmOjC6CWiddCt1YkoZU8md1D/ioCI/rbWPRIGcuUhe+IKzeIAew5WevSEObuxsU5ZcAqbyq12AWwCFuAZRydg1z8L4hCQe122Ur8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IQea6hAO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xeGpl9b/; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IQea6hAO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xeGpl9b/"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58J4dC594041844;
	Fri, 19 Sep 2025 03:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=CeNSY037FYIyufBxYg
	ikTqTCTndfhGXV7zSh/MdTSbs=; b=IQea6hAOpYzIux5R06nLJlvXthY7opthd4
	FEGYwTGbUnwwy024t1W9CoTX2HJMlbecTNir7uv4KDlJDFAK7YR/SVkFlSBQV2Cg
	SlnFjX1zy21slVoej9RiVIhIZ9p2zK/mvpZukMIMzSeYfXJO17jraO0rOWRNIRMX
	0Shf0iMOCF72LAKIiX2DC9KcuB4AWN6QOJUwV1m6vdRTY3QYwxo9WHn5jR7J3EMV
	Y+C/SR6gYzQRmtHDcZEsdt7wY6HZma0MKH9+3RDSyiWO+OxVqDk4IlZivqoaMuHK
	Ofj0cDcIm1aM27/0d9nlJoTcAM4cGTYZbaSZYb/kuEPl43cemMdA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2130.outbound.protection.outlook.com [40.107.223.130])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 497fykutah-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Sep 2025 03:06:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7pWnHTqxHhcquX2YO/I9LaEK2M45K1zIubhQzjjIe78V20evtjvJ9BM04dHBIZZw98feAeVYu6wgfNl4CHzTBueTKUiGrdLtbAPf/CEIySmvAc/3fGwQiFZe9ed8xLuya2eC/0YiCq0ZpeUbnuKqIDM7w6k63pACCRioldmGFklvFdoGxpgpihf6bnWz94yayCH8AMGMV0jCKrnP1ZAYR5+Va5GNP8kukNi5EoVJcXAaqUeNdPtQ5LHvY3+WyGmPO5g+Lk20WBtjKMMP5EdBY+Qhniwt2Ag+2WBF4Nx3Yadq7ElYVL+JUuPwmJ5bhiwoHJOHQ65uY0MR0bWvtuedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeNSY037FYIyufBxYgikTqTCTndfhGXV7zSh/MdTSbs=;
 b=j/cgvRQGnU9U7hnjePsYSXNeZXWw5q0+c5EegqYQpdlkYzSRPkybhun/DsHnUIYB9HbqYCfI6KJzdlfdQlK7dbW73oZIESbqn/qSsVOfbo9uohI0fB9W7c3q6xp657V4NBDHee4Oc5Kzb5Bw02qeDIf4z6lMZMRGsXqlgju6vxfo2XdtHK0oQo6tjIuMfohzo1skllDBhJZBPEEMXS532wu1Q3UPwd0Nv2D5nab+vgTXWek2s10LXbcR4MVJBfLYcqWL1prHFZnguWZsbRXT3RTnqPK+5mPYRRgI+LAfn1jL+X9w756ZzUn36lPCO3XIZM7dsHCp5ouMZWy6vex7lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeNSY037FYIyufBxYgikTqTCTndfhGXV7zSh/MdTSbs=;
 b=xeGpl9b/SdC4Xz815XOFyOgnqv3yHwaYU1eayzGWRnpg9OakR/aRMTuHhyoK+Re7pIXy+X9q/sJEchOpoHln55Y3peAP4woOkKbfRB4nLZNZ82GP/A0uXQWQuWcBQ1vyH0g4pn/6k6wbtLDdKhlxrsETkuod6FvNHoRAD//8ij4=
Received: from BYAPR08CA0033.namprd08.prod.outlook.com (2603:10b6:a03:100::46)
 by CH4PR19MB8709.namprd19.prod.outlook.com (2603:10b6:610:221::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 08:06:27 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:100:cafe::dd) by BYAPR08CA0033.outlook.office365.com
 (2603:10b6:a03:100::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.16 via Frontend Transport; Fri,
 19 Sep 2025 08:06:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Fri, 19 Sep 2025 08:06:26 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 08C3D406547;
	Fri, 19 Sep 2025 08:06:25 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E2E01820247;
	Fri, 19 Sep 2025 08:06:24 +0000 (UTC)
Date: Fri, 19 Sep 2025 09:06:23 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 13/19] ASoC: SDCA: Add SDCA FDL data parsing
Message-ID: <aM0O/1jtYQJYNLL0@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
 <20250912103504.2679226-14-ckeepax@opensource.cirrus.com>
 <06104715-5d1b-4d3b-8846-be7b5daec996@sirena.org.uk>
 <aMlrfFqcS8gu9XXj@opensource.cirrus.com>
 <ea3cadd8-95c3-4b4d-b1fb-c8ee23f36804@sirena.org.uk>
 <aMrGQNYkoPR+QDtX@opensource.cirrus.com>
 <c8a316c0-6b91-438d-8540-4d59d934244a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8a316c0-6b91-438d-8540-4d59d934244a@sirena.org.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|CH4PR19MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: b2597b63-551c-4dcf-9a86-08ddf7536ee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i4boqiAXHSw4rvRqCWntvcsa60dSGfrPu7a5vdbk0MFC7R+3wIQre7uRtCo7?=
 =?us-ascii?Q?uUbhmynIvjsyXATynxt1zGL+Es8M9GxQflXBt+Yixdc1wrgEM21JQLYHCgiu?=
 =?us-ascii?Q?he6Eov4NFL7DgxJX6TU1k8u5Lw1Hnjn2KDN6jjRA2DFmIk/7jVHrf2jOX70P?=
 =?us-ascii?Q?L31u5if3Jntm0Lf0QDdZO7rtCc/TeOo4nDZiqxIfN+ZM5EnR19z2+33PjfRt?=
 =?us-ascii?Q?lLfgpfju7cepLC1RGc23Mi68yUWPXHSE0hN29G1rERGN/JSeXJWgw8snFG3Z?=
 =?us-ascii?Q?aZNQS+vmBwMNFPXr5dQOtlJ0E6V2jh40cGtHpFN7VeyZNCebKDG7oGyQ9m5h?=
 =?us-ascii?Q?4VspoaX6G+QDqqJ4l/eZTmPC6wcEadXI0fo99kVbtlnylT/qEKBmQ/8LoCoZ?=
 =?us-ascii?Q?KfpxONLbMAOJmZdcqe+vXk97b3OPF+bGOox1uvWUHL3V3ROe/OHq7KDrgdPx?=
 =?us-ascii?Q?lHKhjDRsa5Kqlo9vQ6PyRKtzZzzUrdUdUYIMueR4PfA3QGifAU2m4IInil8D?=
 =?us-ascii?Q?bczG95pU8lgFKCjog7y++fwrr+FQZ1gfeI8bMXlGVwJuQOldslHEjOJwe3pD?=
 =?us-ascii?Q?Q705RlngWufmeTqtjWjuvBgkiqRFnYj6s/xXNl3D8TdGPqPV1R2Qig47HK9n?=
 =?us-ascii?Q?Ju6D+PfJBLJaweOdKN2ayomyUtq16nbxaLOr1o1z3O2i12hwgI33Us6qRcwR?=
 =?us-ascii?Q?isxUoRH83TE2kA2cqBmHb8LgyBFETkcR+qiq/JlDxMJjmK6+1UlDeMKDG8MO?=
 =?us-ascii?Q?yUAbSAHbM26nCz+sdRlopUXnAmhQFuKHvrN8WBFEDnTQJwlI+1YW9WPytqUj?=
 =?us-ascii?Q?M0AbHdvyyivL/vJM3N+MrcHjSsDCriaWMbcGOXWZD+p4gWTghBhRCcNpGHEn?=
 =?us-ascii?Q?6uVAfA5CssEeWt+ez6vQfpnyuAZJ2sYXyWFnASz/MrugJ+e5hEUbCW8jmccP?=
 =?us-ascii?Q?C3tuIbnBhB2JOPEW5/OIbhJpVCJtdyZ9aXyXuHnUTyDsXnQcaQvW8YodMGPj?=
 =?us-ascii?Q?Kf53FGZA1HM4RsHn4bKqLUkW/XKWo/dtKys+MmY7TprJVzrY78TQGGdl63J8?=
 =?us-ascii?Q?P3/6WTtqNj4F4DYeUZfQV22+ANYC3mJ5Q9SmA/ukLO7bw0hbRUXgV1CRjLnh?=
 =?us-ascii?Q?hS+x2WtUlLogEnRTybdqJ2JxZ7WBGM5KKen0GEQumxSosucYF3OQkFQsGjOm?=
 =?us-ascii?Q?a0sEJeplU6rja0bub1lTqxycHH7domjBgMNL9Z64n7/dCi5CxAbiuAPukTnX?=
 =?us-ascii?Q?guxzuCXgTByOWCMpL0nmOz0isV/eQtD0zjUcmYV41V05OL9pJGJURs0maxOW?=
 =?us-ascii?Q?ibxx/vcMe+HZC/vAt7j4IZOIcqYUqiQ91mxXKBLSyCysOv9nAFeGy3Xbx2tx?=
 =?us-ascii?Q?+7G7XrmT7eWcBCmIKNydbV4kSSTkCVIIJRO1vVYH/0ln80qFhogPkzxqTUen?=
 =?us-ascii?Q?01lztRyN4TKf1wIjwAamd2MZ1252CRGaVNQm2kmmRKGEJRjQTdcjHbu4fiWU?=
 =?us-ascii?Q?x2WVmOmQyB7tF4XrZyW2O29aBBtsESQTnkCX?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 08:06:26.8131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2597b63-551c-4dcf-9a86-08ddf7536ee4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR19MB8709
X-Proofpoint-GUID: 7QnbztIO0kAGfXepCh5ROzHJUafozex-
X-Proofpoint-ORIG-GUID: 7QnbztIO0kAGfXepCh5ROzHJUafozex-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA3MiBTYWx0ZWRfX/FABhKlzIkED
 IiF2h07IMGnVb9ZY7lKH4lhCyQUECOZTT1W9RJEnhbiBM2JDNVSbPWlonXZPjozkt5Xib20/Wy5
 +qUMXCATsq8TbJR9LracMfa7N5OjihHU4Fh0C/tDoxVzSelZXfsHywj/Acq98B9Mg0ow1K2K+FD
 cCumy+0NsQjEn1F8jLmIv00BHogPkgYfbDFxJb0I5DxFlIvOxlJbmJGK/BFcyE63GNjm9CBqIft
 9WYhGo7pVhF6ndQn09F98KBsh8shJplJ+eyIeNaBysqmRAmWu/2L+mbOZc2Y+F874Y6wH4qLT7X
 0TiW0wgL4VYN/XqLi0Eaz1Dq+l9chOuLhHfQ6wg9oWh0iIUvVmG90NVHlg7JXc=
X-Authority-Analysis: v=2.4 cv=KvRN2XWN c=1 sm=1 tr=0 ts=68cd0f08 cx=c_pps
 a=2ognbUw4Psh/WuD53yioUw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=LPmjvFnAr0cy0dijVxkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Thu, Sep 18, 2025 at 09:25:25PM +0100, Mark Brown wrote:
> On Wed, Sep 17, 2025 at 03:31:28PM +0100, Charles Keepax wrote:
> 
> > I think that is probably fine, would be good to get at least
> > one more Pierre look over before we merge anyway. Would you mind
> > if we fired up the next series early (likely in a week or so)?
> > Suboptimal to have two in review at once but it would enable us
> > to get a head start on review. We are starting to get a little
> > pressure from customers at this end on supporting the part this
> > is all in aid of.
> 
> It's fine by me to have both in flight at once.

Super we will work on that and Pierre's latest comments on this
series and send new ones next week.

Thanks,
Charles
