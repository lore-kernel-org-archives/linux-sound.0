Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11442D7388
	for <linux-sound@vger.kernel.org>; Tue, 16 Sep 2025 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758030757; cv=fail; b=BHCkvoMHxiIa9ARRsBbqdeSkk89CpTcPbxXvz5IEJexyr2ZlSsvYIKdf5H+KsiVKosC8bhqWL020z/NpvRI6qbrpfYVER4OLkf8kXJVDB0jn+BDlgokutuu2vvXs391R/5+38Aq+icyCT9gZDjNofgN8wy3wAjKb8ggZnJ8QqRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758030757; c=relaxed/simple;
	bh=3QiO6tgJwTNqhZpih8/DOpy7qdWFMJkEElL27SPAhWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgdOstpj0CruWEK2IAfqCu4c3051YuxZz+6E1aPDSMbDens9fF5ebfsTEQV4dkTNPCo6zYYdOzhh3XifHd3B5xIsQnUC+cWbAesQOl57cZPJToFJTdw8W/cm0hcDjUCH35M8aQCNhfgauY4Rpmjrlb2ZwxJCyw9vv1sfWssL9LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=f+G2Sa08; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dCNwyn5D; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="f+G2Sa08";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dCNwyn5D"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G8Q5RK4004086;
	Tue, 16 Sep 2025 08:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=JtJRk3PnFnCBW822kz
	vz8K1j7kC+HdWPqbihRmNhl00=; b=f+G2Sa08coMYZ3SEWzAz8Y8fj/6q6wXKAU
	PIuc8cjrpGzcUOiPh0szJaLMyHHKwHk69UrXJ7nu2loLPRCjJ5xv1TSvLAIU8Gho
	r0HZxb+svz4e5AITcA0Ygd2Kjna2HXiGJPvMnbKMRBMM9qCP3h4hFcQIzMQkqa2y
	rmSrX72pra807iiNemdVCQsXBoq7A1c2Gw0C7oMwLeKlzaQPUS+f0bsnnXsuIyGk
	bwgvc2N50XS4j/scG/5YjY1RYyKn+KUi+log8KkBTFSfpv5XaThAo3wNTcwWv7tU
	mdsYUQ+AH91/qCsdMLHrJVKNkqKsZwKtfYgZerpWIAOOt/aOQEHA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2098.outbound.protection.outlook.com [40.107.244.98])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 496dhm2c4p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 08:52:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOxPEbbSCl75kTyXaTefhnnxJPkOVpMFW0tTqKjrT/mVJJfJWiborEaUslokQfGPllLntOYaaVssZnivEgq/JRyyDoQxgrkP4oAJUNqNNN0hPsXrtD88AptxZrLokN3t3N9y61Z+SC7vun1ZXseTPmk0hJkE12ufczx6kE6u8cE7oRSwum9J5OVof4bgBxEyTwTSv3se2AXq3Kep7TB1nP5er9mO4y8IRSMkNk0XBDcfXm4HFClk1t+9jajvyINF2YqlzKQyfkfDOxsUHpW6lFmlejPm8cr1y96Tb/QS6vFrhgjVNhg32pg84TWl+PUE7BGAvhDEiDArlkk20kbtCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtJRk3PnFnCBW822kzvz8K1j7kC+HdWPqbihRmNhl00=;
 b=HuWHdF3B+uYaW8ioK2hZHWdXho8npJvb6DAQscuSu7kcLcIMD+BITXZSO4oHOVzc2ZLIskYwMnii76Mmo7TqK7rJM5aD6OwUX/Fhqpj9jtOzGms4SIG0XRJrkirRULdaYeoC9k21j/J4p3ffomTY4vtW+s0+r7jVmytTy75sdE8XSr7dI1PmbonnaQqMdWEmyPQlwe5CMKULH04M0Hb8e0x/4C/uN08GEjAcpgTBmM2z72x08zW/ODHUpxU7QNXo6Jxz4mS/yk0yEkK3N9qwKJS3sv+jIwNU2oNchejkzWM2GwNs9IfE9boHQAN3flBTxFd2DIA39BVDoL+G82nYpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtJRk3PnFnCBW822kzvz8K1j7kC+HdWPqbihRmNhl00=;
 b=dCNwyn5DVHNyP/+klxwkx7RhpjaBQ/HgN6vZqqmT2ZpY9lwSS+qmcLvijKesVQQqc9t97/cmQIkmQvtD+PnpbD6bjzP3zEwHTcCczU2XT9Ze7wnl1NxLJvy41cc22bqP6y1uBNNQuMfNs8tMXybpP8OQVPNP66WPlHLaL622BkU=
Received: from BYAPR08CA0065.namprd08.prod.outlook.com (2603:10b6:a03:117::42)
 by SN7PR19MB7137.namprd19.prod.outlook.com (2603:10b6:806:298::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 16 Sep
 2025 13:52:00 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:117:cafe::e6) by BYAPR08CA0065.outlook.office365.com
 (2603:10b6:a03:117::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.21 via Frontend Transport; Tue,
 16 Sep 2025 13:52:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Tue, 16 Sep 2025 13:52:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3C64F406543;
	Tue, 16 Sep 2025 13:51:58 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 20545820247;
	Tue, 16 Sep 2025 13:51:58 +0000 (UTC)
Date: Tue, 16 Sep 2025 14:51:56 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 13/19] ASoC: SDCA: Add SDCA FDL data parsing
Message-ID: <aMlrfFqcS8gu9XXj@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
 <20250912103504.2679226-14-ckeepax@opensource.cirrus.com>
 <06104715-5d1b-4d3b-8846-be7b5daec996@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06104715-5d1b-4d3b-8846-be7b5daec996@sirena.org.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|SN7PR19MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: 20c39bc8-b520-4fa1-c461-08ddf52835a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6Pa/O3NaRGoRcH1aQG2rwXKwj5mijnkAytM0zrUISpeHi9HHcXpfIKX3ct3q?=
 =?us-ascii?Q?e9EyzIPdr/0zXa+BFGAgD+lKIDnCRPVUwx2JHuNd3AtCz1iXDt7D50pi5zx0?=
 =?us-ascii?Q?y5IYeo2pM0sKEIgsxFwtPbVv/IOS2AGZdjwhTnasWmDomWmbwIQpfuRofW1z?=
 =?us-ascii?Q?iiHqL2QhRXVB120mlWDebRuM6SyBTW1/yAQcPjTA337a/xoxeBQsPp650Q7e?=
 =?us-ascii?Q?TjdvghAab2bBiymgmKYPJPW+eHarHq9Pfzmrrak7S4xz/I6kZgUJryEsP4Am?=
 =?us-ascii?Q?Vlci92hUT0wgWn/8y9oKiYVOLtd2RG3ZKOf3IqDfBFiMPQcsT9eCgwv7IqV2?=
 =?us-ascii?Q?UXo2hZWsRlLNeu0bmhN+ng6bP5dCjX5nlie+2Yndrh1RsIETvd22JrF9n7X8?=
 =?us-ascii?Q?HUyCSwKy8u8ZqzHpNPeNj0/9EI4tF8tcjEzPd9NetcRAx/ttMEXQ7JHMZXbB?=
 =?us-ascii?Q?wr8QHPV8JVzujuvKfY6kmfwd/MxUUyq/iVmq+Ia5AkhIpy6kPf5xG0++3Jm1?=
 =?us-ascii?Q?zULgUU1/QdVZ7QRyDYbGpUYW0w5Dx92T8AZ4a1JEvEeAtxrW6OHywwSrX8Oi?=
 =?us-ascii?Q?d6BBBpWgMLq2ia/J5oPH1oPpFr+o08VXSNHTdu57OwJ5oSAclWVVshNec5W9?=
 =?us-ascii?Q?6p1R8/5//ONLmLDWo+iarla/rHDFZ8Ol0yC2yB/S3pnqET3Ngwa+eOcWkZaF?=
 =?us-ascii?Q?fXByZlu+TxJG+kNGqz2fRZQ9+j74zBHdgzohRM8D6gyfAPZERYNZj1OqI6aT?=
 =?us-ascii?Q?+eZVtvdWU2cWXAFQzvwxgvy1Qi6UU8wMnfxCa3Zd1R5XSusM0YYgj6pm3SxR?=
 =?us-ascii?Q?qmmLHd2dnnF4sPsIIxwRpbjOVCqPIBOHvaISSMCBhV+5SmwjjY+EZi/hO8kc?=
 =?us-ascii?Q?ssiN7iAR/3aGOuDQRRQ1tFizTS73xxl9ws6FPQ8UsuySgZKaB/NdBhmvALeV?=
 =?us-ascii?Q?DWOzCHroQ/dat+2JD1aisuq0S8fkS7t1Yxsj94RMaTF6atA2b8+x7jUSeBh2?=
 =?us-ascii?Q?yKvqTy63bPGZemNE5jchJdb+cJP+7Ne4LspeeeilP2MKIn5zHs0iUuUNmUmU?=
 =?us-ascii?Q?JKGrTtYdsPqxNj9MsAvRq3FKYLI7hw6lgh0BFjwgKtkg6Z5kYfQ0IC2m0hp0?=
 =?us-ascii?Q?Ap5Cdph/PHsTcfzEBRxql7Bqwf4JjsEacocJFlGPIif2aARbipyUpRwiF2j6?=
 =?us-ascii?Q?g28xxxG1yW/xyqVMk07UjoyFw/9ZXJXYPIZv05K0yWW7Ju/nggwbYJ8zzetN?=
 =?us-ascii?Q?rPbhz4H4RAA3re++WLIf3/WDelJSORpEGX7OT1lRZblHvLQoeLAoPJcELOQv?=
 =?us-ascii?Q?PWpyJmzy7YX9SeZ6IbvUcHOAgqqtuu5mQEZ8RYF1UzjO4rMAvQNi4CVLGfwh?=
 =?us-ascii?Q?YQBS0ZRXlZqbYOrXKgU81ydg9wOJ/ia8cbSxxdctcjVM18Oh3RAby3ZntezM?=
 =?us-ascii?Q?O17eO5DqnWik85xo0j/2vWWQb+vqlLQiCzedsKV9U+jJVWM0Ulqu/DU1MFnP?=
 =?us-ascii?Q?TrrC5RPc8MgZbjHohMorcSDVDkJp47pKbeQ6?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 13:52:00.0614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c39bc8-b520-4fa1-c461-08ddf52835a4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7137
X-Proofpoint-GUID: gLeCcIcT0zwcjxaRsva0OuS3rhE21x6x
X-Authority-Analysis: v=2.4 cv=RZaQC0tv c=1 sm=1 tr=0 ts=68c96b85 cx=c_pps
 a=FxXBCnfXph51YBDQzOwJNA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=w1d2syhTAAAA:8 a=ZyGN5LtQVk1jzaFaxXkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: gLeCcIcT0zwcjxaRsva0OuS3rhE21x6x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDEyOSBTYWx0ZWRfXzfrLEmalTm1X
 Ak+WBDPhSI/UohCn1mUbDcSebWTdV3It9YEoy9hbQ7/iZKVJfbsEH5bw26p/WpBuGK7tJ7J31ux
 kY0Pz4KR0e4Erzjqlv3Zu8L9+0SNLB4ewUU5uL7hTONqRNy9THqZqqheADpyYLzk8FCeSH5dxG7
 InVmMmc2mgpS22EqtqvOfaj75Oq6xI6PKt2WT+CJkfjfxT1FA5elc9hScOGazZQ4yELv9/JZJPB
 YHxUki9PBrknDYlWdS0EhQNoKM0Ri3NjRVjLae9NTvIkHRh59zXKxUehZWamGuWnr9gWnvySU2o
 Tzls20v5oB/otMzq6klDNkuG7ML1IH2W/Zc46pDWfgRH3w8u6o47a26KJczWBs=
X-Proofpoint-Spam-Reason: safe

On Tue, Sep 16, 2025 at 02:38:06PM +0100, Mark Brown wrote:
> On Fri, Sep 12, 2025 at 11:34:58AM +0100, Charles Keepax wrote:
> > From: Maciej Strozek <mstrozek@opensource.cirrus.com>
> > 
> > Add parsing of ACPI DisCo information specific to FDL (File DownLoad).
> > DisCo contains a list of File Sets which can be requested by the device
> > and within each of those a list of individual files to be downloaded to
> > the device. Optionally the contents of the files may also be present in
> > a special ACPI table, called SWFT (SoundWire File Table).
> 
> This breaks the build:
> 
> /build/stage/linux/sound/soc/sdca/sdca_device.c:40:26: error: use of undeclared identifier 'ACPI_SIG_SWFT'
>    40 |         status = acpi_get_table(ACPI_SIG_SWFT, 0,
>       |                                 ^
> 1 error generated.
> 
> The identifier is added by some tree in -next but is not present in
> mainline or my tree.

Yeah apologies for that, it is called out in the cover letter.
But I wanted to get the review started as soon as we could, as
most of the SDCA stuff has seen a fair few rounds of review. If
we are ready to merge it, we would need to organise some sort
of immutable branch with Rafael, he is CCed on the series, for
visibility.

Thanks,
Charles
