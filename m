Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897E1202F8B
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 08:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222869; cv=fail; b=SN96QfGzG9KAvoUnR+gkoqx0p4s8KBKX5/F2q+1YTfIj6Hu1CpmErc/1yJlgQeOm1dNZvm0/7reXCbAv0FwPDDviY2mkFsWVziqiyyxd+6NqkBQVeV30twDkAw+R/4lxz8t3EgcVxFuaHZ5ZsHkQKA09j6rBVD/8HC90Ie8p0ZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222869; c=relaxed/simple;
	bh=12HeMRVGKJE0Xz1CYmkkm5GCCDA/Au+Y/mprY7wgKRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KijV3ixM5mt1m47E1TXZXSXPWTwYAxd8fDwoz1XDSZ664eywrXKkfQcYCNTU3BvaIREXOdsZvVi0LKeHnpN1nag6ZWPCEILjCLG/A5PTLI/y5vdeCTfOPElxQXUGoFMnogJerhgYQP4ytc9n1L7drfltXkassfyuU9ZOICzadhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LAoY6s+L; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=iKxjmTyy; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LAoY6s+L";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="iKxjmTyy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B5ww6R014521;
	Fri, 11 Jul 2025 03:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=NyRh0VvbhquNNROmbP
	vTXOoPkBb35NMMVKheoJPS23I=; b=LAoY6s+LefcExRaK9u9OYwdK1ThyVsbpxv
	+Z0UoImZknEdJzDceUWL2NMKhNBg+yWIva8xrpQvWAoE56e6KFqnjQouaD7jqjF8
	91hhLvTAqczO4tdeQVfo4iS4nQZ2Mdtt4Rb3Yp5O8XtaHeHgJY/Dn1ZF6P+EpAq3
	1RBhacNv4cwbNXXOuUViUwlazAfvJclCy9oVMYyaFDQqe5Ebtxe3nDW/oZNKvOvj
	0P4q6CqCE5sSftW+FzvUK/uBUTFKE2TqpXHtG1dKOpE2P/xyBrorGygn/wvwWYaz
	gFtBfsUvOCDmK4+XEZQ2vvQ/NTOXG5ERD/6qtxJXIxhhpuO/5eBQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2106.outbound.protection.outlook.com [40.107.220.106])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47sev6drwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 03:34:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAe2NqVRZF2uKnHrTZn5pCKoAuM36XTq37scxZkNxNcXSzkLE3VlOoHVVe/WwM29Vumyohf+vpUOWwST1Pf8qPIk5ne84oKAWvTGK0fq5ZeFn9FdTkHh2C38r2IxxsPZrEEZRikrucN+MTu+zgx8pI3Obqc/K3EQULqgCrd5WgQyDzYETt5ZHJT5klyMM+PnTXHJMLWEJNcoHEi07+zvQ6vX7ry9+MHa9A8+Uh/UcT8Jqc30aNY0ohuXUd7Rgv/ySVKRiyHG8eUDjNWq7wnj2Blv1RhUsRo2DCsQMnXGLSiQ7EcAa98chcSY9WHNcdRIASRoJfM9yRW/PGce1zqnMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyRh0VvbhquNNROmbPvTXOoPkBb35NMMVKheoJPS23I=;
 b=jPOS4KZF0UbeyIk4LdE6dwvqpeP05827//u67s1J5/NNg4u75M1UTwjb83hJxqvs1au19ggBMt3AasNDQ4oG+pKThuZVXZTz8PpFiC1DfirzbFKG4iWfrZgeJSAmV6CmlnvxwcPplMQlnLN4KJ4B2r90+YIfg1xjjYLezYOTJye1kC5LUUi7+GkbFQTXwMayrgNR4YEWAbfjzSndNbt/JxACTrEt7OKeY6e8SubHB5YWoo4iX9yRMgEiyeh0NIaJGLOboEZsFlKSswzlh2TASLQp15YjFYq5ukUtSsP7rTzg774z8Sj7C0QCn2XhtVcdBGlLhj3NgGkV3y8KdHlMfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyRh0VvbhquNNROmbPvTXOoPkBb35NMMVKheoJPS23I=;
 b=iKxjmTyywi9I2jJ/gKwx9E4Tam76hwZQgXt444cBcQq6E8jxVr/NAXjGBZ5ONPkNLdUVR4cWMxHjA0iDzRbJDNmey2x9QL1En/HrB0AFlrgA/SkG85wTWf8kGvJKuQJVODV0CgIeiEurdaEwHROITEk/mVq7imPFAewqJlfLCOA=
Received: from MN2PR03CA0026.namprd03.prod.outlook.com (2603:10b6:208:23a::31)
 by CH2PR19MB8996.namprd19.prod.outlook.com (2603:10b6:610:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.20; Fri, 11 Jul
 2025 08:34:13 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::4a) by MN2PR03CA0026.outlook.office365.com
 (2603:10b6:208:23a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.23 via Frontend Transport; Fri,
 11 Jul 2025 08:34:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Fri, 11 Jul 2025 08:34:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 103D2406545;
	Fri, 11 Jul 2025 08:34:11 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EE622820249;
	Fri, 11 Jul 2025 08:34:10 +0000 (UTC)
Date: Fri, 11 Jul 2025 09:34:09 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: SDCA: Kconfig/Makefile fixups
Message-ID: <aHDMgRqhl7Z+ZLCO@opensource.cirrus.com>
References: <20250710163424.1158958-1-ckeepax@opensource.cirrus.com>
 <20250710163424.1158958-2-ckeepax@opensource.cirrus.com>
 <a52b2d56-d9eb-4adb-84aa-8bafc81d8c35@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a52b2d56-d9eb-4adb-84aa-8bafc81d8c35@app.fastmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|CH2PR19MB8996:EE_
X-MS-Office365-Filtering-Correlation-Id: c8563fb9-dde5-43ae-a23e-08ddc055b6a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ogFwg+Ox4WLBwIR8l7nN7VVGp51jLVMWp0XgrS9S3RlTm1B/Nn+eGSOFXdMD?=
 =?us-ascii?Q?+A8NE+CZG0ZPax4L4stND57xpV6dxhYmFyshR24+CpehocF8MhCQI2z4oiYH?=
 =?us-ascii?Q?E8BGJxZoCVF7WGztEsiW94wpKshkt1lskaZdenUOz5OeRo1q1dk0GgDkL8V1?=
 =?us-ascii?Q?d81JBRKm/pDK5DwZ22/kORbxICK9UeEh7IJ8VcGzAr8Cem1iyTwnkfaSUvP8?=
 =?us-ascii?Q?suGZjliT79pmkh022GFI03Lcdr4z8qMpRs8oX+cmuiqBKVeKvwV/ruJDiihk?=
 =?us-ascii?Q?/3Bqhv24om4AWOSdhIsKkP9forsXfcOnzVS85vSAmBUtKg6DkmQUcYRHbyT2?=
 =?us-ascii?Q?6gP873bgkFwSC4H/cGKW1+3xCkoru8BcOFCAC+7wDo6zj//j6eFeYN29aKBv?=
 =?us-ascii?Q?IB9cZZgFiA18USMLYJbXsNqO9hYjpx78B4cAdM/xIoCAU71jspdrBIIvSEJ0?=
 =?us-ascii?Q?ibqM/aJWssrnjQIERWQsIDxSsHMysR3FUiJNGzIYbmrGVWqK9G/ZTfoQ7MII?=
 =?us-ascii?Q?J9WIGFXnbiDXPWGGr123Rv6GzxahVoRJNLmnMm0ai9ab4mDZ06/BLct2lA85?=
 =?us-ascii?Q?ePHf3/QCmxrSnvGrn6rxwHIQxeuS96IlLx+OwdMjxKGQ6vSrgQ0RHOnYTTmk?=
 =?us-ascii?Q?Oz5l96cxClxdyPlVLgLteUDuUu3KWDMjLvJKjf0HrPE4r33QOmO/EoATYt4y?=
 =?us-ascii?Q?vFHyhHWmeAjpF3YU9zenCcXu7OU+wP8d39Y+rIhtujOoMjJzOz8nWY5046Bj?=
 =?us-ascii?Q?ufEr0+O2BIzsMkgF0Pu5p0n08z7Y/JXOgew4eKlMdC0smpxw4FuhWjJAYa54?=
 =?us-ascii?Q?KDIywHcGhHfoqUxXc89rFAR3w9IRIvyf6GhnJi2i1h60IomFo4OwX+stSpgD?=
 =?us-ascii?Q?waJWn6KlGBScyvvgsgu5UEsncfXLWXdV8in10C9DhtdKEVeUFJOwattDuWpO?=
 =?us-ascii?Q?sdzV2sJhAo+/QZIBIaxV3SGbpbsPj84Wnv/R//naU4SZnxurvqN2lIA8g6Kv?=
 =?us-ascii?Q?wyYOzoQ3Nmr7psDWsjwYmCvLwq3dxr8gmU3XTDww5eLqNVciBZoQixqSsCzm?=
 =?us-ascii?Q?Y80ZgcapIuiIhghJppfnBIFnL4GVd749cn8o7qNLnBL39+570W45kaMmvu6x?=
 =?us-ascii?Q?2LjHzs7fNVO7q8SBjK2JffjaRVStb5a7YFdKzOS38baYLX0scOa0PMqxp8bs?=
 =?us-ascii?Q?17NVC+N2Pv3OWSXorZPr67LAFPkVJD9zXzAFTlOV2RcIIK1PizihiCBH01Xf?=
 =?us-ascii?Q?dp+QRHz6B5ZSV82H/sX4TtpTS1C5fcd7QE7Bf7hzU++14lpbMFIMCe5jEH+P?=
 =?us-ascii?Q?oUWrcTSDGv+SqYMqzaVyZInpOMoiWuOPQTFywV/5nKNvx6NzGOtXXD8gbSR8?=
 =?us-ascii?Q?uMWWNFu9Sp10J262C39uoVYRH98rKasuugpWrqlrolZYOOdw3qR/0Gf/T6oS?=
 =?us-ascii?Q?3p4YOF7UdtY+yyKG4bvRlpuS7NMZOzOcSksjs08l3x1SywL0m2IcYbIx/WM8?=
 =?us-ascii?Q?CEz83xogF00wHtv9cXSTMQMYxmflDzta/6je?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 08:34:12.3122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8563fb9-dde5-43ae-a23e-08ddc055b6a0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB8996
X-Authority-Analysis: v=2.4 cv=Zb8dNtVA c=1 sm=1 tr=0 ts=6870cc89 cx=c_pps a=gY8LtSt0YPldneAH2Nvzqw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KNAzoNOrUzHZSbwSqqAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA1OSBTYWx0ZWRfX7N+adje34EoU Q/O+8iN8fGD6QoX5jWnooXsfei/zRAnQtg2Mz7LkPMIvkEmlbaSXgTv+eLIvxSaTfyx8OpYZPeU SOFd93LQCYhbDsvUqPKy6kifb9/f+d3X3T74Rg/UZirhx42/QLdww1pH1FS0gzqvqGo6mgDR1Md
 ps6f0GSsD6VR8+ONF2+GDtKbDEcm9VYo3yHS8XVKL3y/dj3qZwee42uECa2K3i92V2QrtJfvPGC cPpxjo+NLXOQt5YZpQI885Le+YlRVm/rdOGhU917HBMxr2n65hitVHlrDxgg780SKhWCxXnsFNI I2cl+EIlt1qidYmwmHNfkzxtrhCkl0J+nEM6/XPmW94ACZ+o3OHG8TYibYWJjJJry7lk0FpMX+/
 DRb6mRqmNaDMdGKmWG0i1W6bbY0DVRlNEQ8VCNqSS5Hys5uUhVHcy3f3+avFyK21PSZ9UGbl
X-Proofpoint-ORIG-GUID: OKqlJRcWWXqBisKyWwFxS66CAo1zsBK_
X-Proofpoint-GUID: OKqlJRcWWXqBisKyWwFxS66CAo1zsBK_
X-Proofpoint-Spam-Reason: safe

On Fri, Jul 11, 2025 at 07:58:14AM +0200, Arnd Bergmann wrote:
> On Thu, Jul 10, 2025, at 18:34, Charles Keepax wrote:
> > Tidy up a few bits of the SDCA Kconfig. Make the primary SDCA
> > symbol visible again, whilst this is selected directly in current
> > Intel systems it is not a given that is how other systems will use
> > the subsystem and a user can not directly disable the symbol if it
> > is being selected anyway.
> 
> I'm not sure that making this one visible is a good idea even
> if I don't see any immediate bug as a result.
> In general, I think symbols should be either user-visible or
> get selected by other drivers, mixing the two tends to cause
> additional problems.
> 
> Would it be possible to just not select SND_SOC_SDCA from
> drivers that can use it and require users to enable it
> manually, or does that not work? I assume there would be
> a link failure with SND_SOC_ACPI_INTEL_SDCA_QUIRKS=y
> and SND_SOC_SDCA=m?

Certainly nothing needs it right now, so I will drop that part of
the patch for v2.

Thanks,
Charles
