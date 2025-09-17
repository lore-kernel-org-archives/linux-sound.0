Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0732EC099
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 14:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119526; cv=fail; b=Rwxqc0GVYEdYNZUXVsJLhP/qb2/H1RUrRRqMySFD+AI1dstlt+WGCOci9N1vAw03lDPH3WaRw+p1bO+DPZpRj+5ep16+O4qwTDjUc6hteqllfGRiyThTlTLB+UxSHSrfplJuRa6cRL2u5M2IdOxLM35S1XbaVS47OCvhrdDUHc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119526; c=relaxed/simple;
	bh=Qni5p8CVCzO0yFmfStTV9SRnoIbMn5lt2kMfC2r1R+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RactdnGzm7DlX24zOxFTyrm6nhURe51hmyfKtzU6xIWo4nIWxSXCL9p0ZW57oY60J5U+K+1AL0uzkfFyHJYBmNIZBEoe32hG+7fdbPzlcAqNHAxXWDGWhHQb2eIRscpy7cuYmrqxP54dZqs/ljHETLM4Gzpw9ToxuCK+/r2dQAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qKl4VqUb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=gbQ5/ckM; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qKl4VqUb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="gbQ5/ckM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58HBDHYG2718596;
	Wed, 17 Sep 2025 09:31:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=FZXobnRHVgE02AO4A5
	WM0jLoYOr1KTaJILOPhwnq+qw=; b=qKl4VqUbyDCSf0ymUt2BAV4E72leco2+qi
	slTAUYRq0rN0Y7UhiEBZuajSfGGLxVt3aFuMwxA87+sMCXZYdCmuTrdV1lbIfgXl
	pT6TUC8WtaO8x5J6tALCx+mo9U0WPCGyvl/nVTpQ7/1QRLN1diz007QogoEgDoli
	lkMPDRcDcSy81sc7g9ISWThCzZht4B6dAnaQKmzxagDCwxPN1L8yklP3jltMOKLy
	d2HUrBwxVewmWpNF4fHB3vlUO6EVcqt+jVM0UlPMdnVdR8tunrbeZCenLt/VTxv+
	H7fZdxPChcwXPsDk0CosOkYqxB3H0TRVEmo2b8FEQWUU7XTnEJww==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2099.outbound.protection.outlook.com [40.107.220.99])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 497fyks4cu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 09:31:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcR9AHTbBqeKGMJRnf9FbbmxuGuo0Ek/M8mWvlfAKXeoMIhCrpAOxwYrTX/G4JKsk9V/e9E4QzOcnGBePBuaSRvgsD21sPf05E2rIC42/DBhPjs06UOLI+15QhMlxJDjqX/r6qZHkHgMpe1X+4AWwc24n6wJHWdN+ZKviOUZ1iTQmOSirodGQ2JAxbni1Do7Lx2E4N5QKT2M12HNaLx9yATzPyQlmNeJDoJLOqg186nxdTIZnklIJ8rovpqoskt9KqSUzX0UptjuAmddSqx5Air9sh9r76zmf36Tu6OVGJ3ooJOwakK+4vu0mRIq0eGXC8PRHMdeOwKXuGtWkMpN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZXobnRHVgE02AO4A5WM0jLoYOr1KTaJILOPhwnq+qw=;
 b=UFWFeEMDLL0ydjO+xHeAe34JhMNiAqRjIKPjAjY8MLYTgNANbrvLKvvI/xOJfM85RKMbRqCrOL7GJ5VTyBjfpFyjpa2ldDcwKJH32CmGM0nvYKI+yIME7SlCBv2PhIMQNztkiKNzHdLGdozfMkuhxpFkdDX5IanrVAYE79xGQsH5ZPOl5bX1t1r3j/1wniaL24MD4v2xSVzxvp4gSvtz2rbTM5AQlgd9qa42v1tJl+xmgU7N+bXwiKOyS/goWv1sU+Tx0Yu10vR4lAmYikgveeuqrnkL15yuFPQ6l79YYFTmJWbQiMi55QWk7a09x2VjMrQbw8bg3FzWKaNyq1Ngzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZXobnRHVgE02AO4A5WM0jLoYOr1KTaJILOPhwnq+qw=;
 b=gbQ5/ckMOC9NHVNKBWiJQZLljtngXlg6dYA6ePZQTdeSbpNbCV0qBgy00iBA41rE7mCViBTuHK5Cx5k4fK+XfcGMh1dkqT9TIbMz9+DEguAnQrXtYQtvUTbR4MosJXOh701CF2E4+pi4WEKd4sRzIka3DG/CTdFyWIUObec+258=
Received: from CH0PR04CA0080.namprd04.prod.outlook.com (2603:10b6:610:74::25)
 by DM6PR19MB4229.namprd19.prod.outlook.com (2603:10b6:5:2ba::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Wed, 17 Sep
 2025 14:31:32 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::45) by CH0PR04CA0080.outlook.office365.com
 (2603:10b6:610:74::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 14:31:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Wed, 17 Sep 2025 14:31:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 916D4406543;
	Wed, 17 Sep 2025 14:31:29 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 79F2A82024A;
	Wed, 17 Sep 2025 14:31:29 +0000 (UTC)
Date: Wed, 17 Sep 2025 15:31:28 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 13/19] ASoC: SDCA: Add SDCA FDL data parsing
Message-ID: <aMrGQNYkoPR+QDtX@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
 <20250912103504.2679226-14-ckeepax@opensource.cirrus.com>
 <06104715-5d1b-4d3b-8846-be7b5daec996@sirena.org.uk>
 <aMlrfFqcS8gu9XXj@opensource.cirrus.com>
 <ea3cadd8-95c3-4b4d-b1fb-c8ee23f36804@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea3cadd8-95c3-4b4d-b1fb-c8ee23f36804@sirena.org.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|DM6PR19MB4229:EE_
X-MS-Office365-Filtering-Correlation-Id: cd27f4a1-20af-4614-0b5e-08ddf5f6e516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zxwfz9Vm6bjvqlwMDRr8YLAqTDbafZnFTSCzNKW+lFTBUnWfkMWhBfBolXkb?=
 =?us-ascii?Q?yMH4/tngeF9/e1hxa5n2iukWQr1s5Jfn7btKq2xBzUc6FH39mn/ZYOWgGR1i?=
 =?us-ascii?Q?1eLKceFlYW9EsqGAiBRMMXndI3cS5Fi2w0jmEB2Lm43eQMil77tTbkyUjRyv?=
 =?us-ascii?Q?LOwSjwK3M5ZNsLahj+Cq6p4uambinZpcRjuruVa4EsUgPsW0CRkW8zbkYMwP?=
 =?us-ascii?Q?fP/d9j66gk0KsMPz0Kcx2XlymWS0unRlVoaepKgGdCNVSf4fe3RvpofLKJI6?=
 =?us-ascii?Q?AW+HyT3xTPTBgmINFn/hBu1YaXncFd0qAg7Kmjzk0vcnp1H3Ez3CsiwA0cEF?=
 =?us-ascii?Q?5XXyIwc1s2pjA3MHaRlDayKUI+4UXHHDhuLAxVQgUvzrvZo+7mXwRA5plmLi?=
 =?us-ascii?Q?gImHsRweEc6L4LwSndH/q8vX6C+B+olK6BGkkpzFNrHdCGiaEygpmCPvkJGf?=
 =?us-ascii?Q?HjBXvCskrYmlvWCzwt6saQp5ILMtUHRNKMrBTAqmbdQENbMitPoorlMncxzi?=
 =?us-ascii?Q?7W3ykhaekRUmrlbSVmSsc83MFVLbGL+GAGZqZPT3w7KNDOgZ6+VUuRN6x7HZ?=
 =?us-ascii?Q?f382wzZrLgK4DvU/RvBkBJ3AIx6k92cY0PkqXHN8z9JL+Kns2tvL9bKHEyDi?=
 =?us-ascii?Q?oQw+3ziv9Sxx18CmJjnAVInLFgULblTtJf1sLYeChJMFsp4gQQS97aFT0b1S?=
 =?us-ascii?Q?trWD2AzdkT+V6OX+4itPQ8qMSWkjvIECy48ybpNAZyPvRGbbn5E5l7RTetK9?=
 =?us-ascii?Q?Raia2DJjd3M5M1I0qs5X+ds0LJ1CdNjlj8Rcsdv4VyK8aFZ1bNC3QEH9qyHw?=
 =?us-ascii?Q?LgoJoMB2BOtXOe9LKA8gLZnuiE0ELj5gi8v9bJOsFD0NXzJS7KXR2eR62CVg?=
 =?us-ascii?Q?2xGHmXSGYeGsPdOgs+aymbe9xq1zcyKDpW6ilKSjaR7oA7zDjd9pWjrISsNa?=
 =?us-ascii?Q?pXTfh7pWcj1+EbFD+X3ioLci0we2DuQjrIegVObEGLKy0MyyiE1IvMdnsAKZ?=
 =?us-ascii?Q?yLSpfrfOcpAOnV8wkNKr0rj8xUgbRWT/Kn6j9yEHO1wMmEGV+eO/kkxV7RiS?=
 =?us-ascii?Q?mPJZVz7y+/mPirtiY/VwNczo2Wxdgnw2gAo2cXR2ZfqkDf5ajJ5F2Tu95a5Z?=
 =?us-ascii?Q?KKXxdwPhIz2QFUfj+eRTykzTlx3xlZzXGANFzy/iobIW3pUcIeQwenDwPc1n?=
 =?us-ascii?Q?PGr8gE03BnZ4aR7GXIkin6xe7KBtvJYCpsNM0H+S6fwLuKWARnEx3tPhxdx3?=
 =?us-ascii?Q?c7Do+9/fjU+KWNNTsZ5xPBHPWNtPSZc2ZbrEsMBw6JBckcijlaPdLBKMfdr3?=
 =?us-ascii?Q?RYammziSe4LxDVUIPuzcYxn9fX4wVWPrTGaMFysAKHSmQ/zsOxF9uNb2EkMp?=
 =?us-ascii?Q?Lfb7Fbm+F57aWgXaxUA/BsLX/DZHV/2z6nP978Pme2s5MStEdk9ci9HFoB7u?=
 =?us-ascii?Q?kEqUGQxg8pMcGHr1SGMlq3fsxgtvYoSZiVJwlkDWfPj/duadi+YBCNaFoAI6?=
 =?us-ascii?Q?XgqZhFpDeOgq3pkX+eRu/ak1z5gYKtkxpRzb?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 14:31:30.8345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd27f4a1-20af-4614-0b5e-08ddf5f6e516
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4229
X-Proofpoint-GUID: 2r9W4PHQKsgKaC3Z88Fxmilr-ciIst8e
X-Proofpoint-ORIG-GUID: 2r9W4PHQKsgKaC3Z88Fxmilr-ciIst8e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE0MSBTYWx0ZWRfX5lO9TTVjqbpo
 ywiO66ZUXsHTn2xxxCFHZgQvl+NTgcr6w0p3OF0Kc5Z/wkX2fkM3TMD6flVDWeBy5eYEap/D/Mr
 Xe+D0GGG4eDzv9BEDQ22i87MOLGYSTkfgi6jy8T60uzBEHlk95gjN7aVGBSCZTwT8xINiwfs1dL
 4J2EGfg+6F4Xe9sLYgjeiN74P9KGWrrm/9OmpILvq7CbP5lonfUli1jC4jmX+LvsaVmnx9L+KwX
 D0Y6szzwOxs74/E4tOhaqny3sLW1GZfUX/M1HySMy0tUq/eKn4uOOKZBsZ0Ub7vwL2WEcYB7e+m
 h52Qzlug55YtkVRpnjiszI+5IrehPoK857ehH5yjAuJMAj9l6ULefyYvEbRemc=
X-Authority-Analysis: v=2.4 cv=KvRN2XWN c=1 sm=1 tr=0 ts=68cac646 cx=c_pps
 a=TjEtcBNk5QtzPaPmdoRRgA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10
 a=yv_1iEIKZwg4Md-gskIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Wed, Sep 17, 2025 at 01:14:08PM +0100, Mark Brown wrote:
> On Tue, Sep 16, 2025 at 02:51:56PM +0100, Charles Keepax wrote:
> > On Tue, Sep 16, 2025 at 02:38:06PM +0100, Mark Brown wrote:
> 
> > > The identifier is added by some tree in -next but is not present in
> > > mainline or my tree.
> 
> > Yeah apologies for that, it is called out in the cover letter.
> > But I wanted to get the review started as soon as we could, as
> > most of the SDCA stuff has seen a fair few rounds of review. If
> > we are ready to merge it, we would need to organise some sort
> > of immutable branch with Rafael, he is CCed on the series, for
> > visibility.
> 
> I at least wanted to throw it into CI since it looked to be settling
> down.  I think at this point it might be easier to just wait the three
> weeks or so for -rc1, that gives a bit more time for review and it's a
> lot less effort.

I think that is probably fine, would be good to get at least
one more Pierre look over before we merge anyway. Would you mind
if we fired up the next series early (likely in a week or so)?
Suboptimal to have two in review at once but it would enable us
to get a head start on review. We are starting to get a little
pressure from customers at this end on supporting the part this
is all in aid of.

Thanks,
Charles
