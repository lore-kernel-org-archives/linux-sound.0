Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2286F30C606;
	Wed, 11 Feb 2026 11:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770810675; cv=fail; b=DYV7BZuOCZPgQFXXT5n4GurMjc53Tcu8lg4yzDByWA5UHbxakwZRq+B9phW+DyWBbqbHJarYrAJcWVFILMhCSmXyWXN9iPl54FR+hkVkSCiuVhi/NsfmU/mK4IxuuT8VU6igqVFIZd2j8409shDp1FOcl1JvRscAtjqdp9dn08s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770810675; c=relaxed/simple;
	bh=7J4IalpD0DnXckDjJwOpiqxWMNPs6z5egRggOlKbgO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0ydX/c8XbKPH2BZLu98uoDwHaYBnq4ns9dgZeR1FfQfBwj3HkxOyW1XOWiZzMyHC89liIK7ZtmeXqxYtCdphB/XZf2W+TVEbY69CortLNp435RPl7tUNaEC9H678WQ4eOZXfBHueKjPJu7Gh9aBwvHXhZEY8d47h2JhixTLG/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lqyfasas; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bu/Q+e8S; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lqyfasas";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bu/Q+e8S"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B6Y9Q11457703;
	Wed, 11 Feb 2026 05:50:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=92hzD0fybqUOClF8TF
	R/mffHtndXKBF/h1qQkywGPEc=; b=lqyfasaslG0H6gMQPBzIHu8yaMDh3Yyf3E
	3puXjgQkpV+WphdV72gFt1cC68/NueNQ8+7L0Wpz//2fvrHh9iEMcEtlNbb7PQlc
	XH5JdpgUYdmz3L+TtNR79hlp0n/W61kF0GIB5qLtbvYGc/hnkSJvyYvK66TmTCZB
	s0JpZxbWP55W5rV1BxgfjveALhvZYd2sNI/pER8ZOB2tcmB1kW/Hdhch6M567A01
	wNxRx0d1ZE6KxONJhYX/gDMFm1zne+YILDG051mavWjPtAp4Dulc/tne62USbk6b
	gmdOFWg6FqediJQfcwhIvU5Mz7b98/pR9WQ0pXJuChh+9PWpdTXg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023113.outbound.protection.outlook.com [40.93.201.113])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4c62pk4n23-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 05:50:50 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ui9edH6nJVs4YkWer1vi0IhC6Ffs7DS02KBeRVUnSI2r8Cmes6k8CbH+M15e7WzkSOwC8/r0/QJYzOxEg3xChITbANxPdZSS8OLpwnHgmk279Ug0RataVKNudkT13n00xs/lExAw2MKegHSYim3N5iJ++RWjkry0UMsm8yV669TxNeIr2ESoYZVs7v0atN7CSy7hD0vjUTYpN+uFHZwocfjgQfNrb0vRhmzlYgrN+OWz3i0IlzzbCVOhhakUw7Aj7WxA3g9oLCjhPsvp/aLV3s+rw42b2GitsoIrqJAcS7w512SQBHPl/iGetQYKbsD3+C+j+Y8zncEbETBKywlyFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92hzD0fybqUOClF8TFR/mffHtndXKBF/h1qQkywGPEc=;
 b=n++meJI6SfLjzE/BNZgwvSbZfpbq+aLI4QvctxV6txSvTl1oGk249vrN3IJPd986gxu+4v0zS5tBJpyQAHQL2MYned6kkH/xmWsimu3p6DoJvsDuEL4+vNFA7rFlZkvc6l0UvXJ+OoRe88jBbRyhdPDiFkUeQ9u9rd7oWKg9KRurBxGKayQa+N2Ile1W8z2r76OcJVKM8a8OpGpA8al27CkFRvmQSWLn4vww5V3WybtSpC8bYk6N0hkZE8iECfb37Zm9nl0tKHhBXHYFFV40oLgfwCpXqHgkw30WoBYhv7XVTLVOd2bopwIEa/69WfTnxH0vBHKToAwD6zTv/5aQEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92hzD0fybqUOClF8TFR/mffHtndXKBF/h1qQkywGPEc=;
 b=bu/Q+e8Sy//Dxp1v9JrT9hSDg7vj6vMxb30nmr1mmpbTflUGn9Gyyks+DmITQyIGJ5e83JFSO2R3hpyCDe4FPM5mJKF7gtHc94VzaF1MGR8v0lNM2RGO42bliM9mf6aE7y2NzU38p7RBKim5lKaLf42aqFxis5a3sKXJhA8m3xk=
Received: from MN2PR01CA0017.prod.exchangelabs.com (2603:10b6:208:10c::30) by
 DM4PR19MB5859.namprd19.prod.outlook.com (2603:10b6:8:67::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.10; Wed, 11 Feb 2026 11:50:47 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:208:10c:cafe::8b) by MN2PR01CA0017.outlook.office365.com
 (2603:10b6:208:10c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 11:50:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.0
 via Frontend Transport; Wed, 11 Feb 2026 11:50:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 73AEF40654A;
	Wed, 11 Feb 2026 11:50:44 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 55765820259;
	Wed, 11 Feb 2026 11:50:44 +0000 (UTC)
Date: Wed, 11 Feb 2026 11:50:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
        broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, nichen@iscas.ac.cn,
        kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH 2/3] ASoC: ak4458: Fix the supply names
Message-ID: <aYxtE9itdo/aYvVc@opensource.cirrus.com>
References: <20260211093527.2892297-1-shengjiu.wang@nxp.com>
 <20260211093527.2892297-3-shengjiu.wang@nxp.com>
 <aYxlh2YDmBrvCOCs@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYxlh2YDmBrvCOCs@smile.fi.intel.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|DM4PR19MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c712cf-4e97-4305-3be0-08de6963cadc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|61400799027|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ue8g8vVXvPe1/5RcCFONUWxE1V7ISQ7tDq1y04auIDW8Q3WHqdh1ya4o/QEz?=
 =?us-ascii?Q?Txkno/sMUw5+9iVGz4WxbS49DMqYEnpSCormwqj5aS01cG+KqHVZt5PMJm1K?=
 =?us-ascii?Q?gA//kq+LwMbU7JLaE3LxSmu5MdKp6fImoXlxul24Zw/y3/Ljw0v34ZwP/Inu?=
 =?us-ascii?Q?L4vsxRN4/ZeeUM65qKyRY6unA2byZxZr0kWpHBK1q9ivJ49h6qb+uETGbjmd?=
 =?us-ascii?Q?deQ8VQZ/Ok6w6e6DKd8zYVm6BE6w1XTREm+8dfpXWChwAazrhem2wmafMHnm?=
 =?us-ascii?Q?Yd5NKoXfaKCqmEiSA6kld9H/A6sh/XpiAAIF2HFpNzp1kcHnsjVppQe9A+Gl?=
 =?us-ascii?Q?Qm7CEwDt4eV9ztF0929N27nnyJ0y7hd/T01oVWKQe3n5tjKTtY0iIU/lvU5E?=
 =?us-ascii?Q?0fSxilbLwwKKN6Gru2aqmoelIyP7w5Ka+OAwvVkrxS3ULiD7oSTxGuRuJhBT?=
 =?us-ascii?Q?TvHoiGjFkVT/j6b5ZwCTV5T+YG3IW8Kur1jXmZHaQOhp3Btq/WRzfypPb40m?=
 =?us-ascii?Q?i3JHIsD5P82Dsw8RqdXIaib2awNkIp4FUOf3WuXdc6FumQnKCkGqrsGipTMj?=
 =?us-ascii?Q?7RgvlU+BCfuDOtyTo6SEqyPKfDYPVZy5bUEgn4fwyzP+xhUWHLYUEZ4NgXuh?=
 =?us-ascii?Q?gif9ZIw/r8oyDyFRQkmB3F+t+TiMdhzXn7c61BkPkhrcJBrVMB6e+CdqXuBP?=
 =?us-ascii?Q?1nHLV3pwC6l6cra5TxE6JTgCpxzj+kKpVcA/l7wvIn9CXpjeNdYVv4qDGgYV?=
 =?us-ascii?Q?ef5T2+bHfVvNXBrUg7XymXM3Hj1ItNogag0I9VdDt9ptr9VXptNGgdneoVHn?=
 =?us-ascii?Q?oac1qzhegb7smuSSUQI9tl9Pn44b1vxgrwFRIDEwC3ApqdwgkBZqEtvFCRYZ?=
 =?us-ascii?Q?2GeroDcTYHoWpw6USRMPsAdKmovA4MYIz7g5eqBrQfY9EsBt6CGRSmEeSgB9?=
 =?us-ascii?Q?hYXyy7mWwPLsbXKM7eVS9p5vJgf955FQR/UAhm69XkmJRUYCbz710jW/UVDv?=
 =?us-ascii?Q?fHMYLmfsU/ceg9v6FKXFkP7k+nHqvurhGhcWhFatJ9UcaevA9efp80FrEr/q?=
 =?us-ascii?Q?QSUXrUACnWulJO3q1GAHoVM3lYPsnkXQhXViONK0T2Cks/2MuoA/a9iEKXQy?=
 =?us-ascii?Q?17Y2LSm9VV/p6mmvQH+obhvkNKSX4Xt2ge5nQ5zg4sSisVJfNvZKugL8w2kQ?=
 =?us-ascii?Q?kMCqQcwYS6pg1+AKZTz2AgDPAu5pEiyTZme6Dmf/pTRWMkM0IgLjxgPqq4U3?=
 =?us-ascii?Q?XPWf+/KiV/h0lnXl/4znFB8XS68Q3mU7TvsZfKD17pU+3aKZgmAcbyWBnOcd?=
 =?us-ascii?Q?xxLlGIbkqkCVo2/bfpinRGSuH9IqixXNxZTxnhM5NQREuuqpfUcdAO1f5IPo?=
 =?us-ascii?Q?v/i1TAiu9e2NVxhrwQlFsOc6yci2P/oYzYeXTalhvOQ1dRUiYplfoi3RYBWL?=
 =?us-ascii?Q?Ha2QXkCvosOcAj7xqzYaSuVMfo1KedxKw+Mjz6RGChkqyYE5Q1nUGsXpheP0?=
 =?us-ascii?Q?XrVvQWB8VftE58Ks2y01fcy+NcOIfjHWunSdLWjo4SQSbc8OCWbTMU6J90xM?=
 =?us-ascii?Q?tIe8IeZN6SxK0k3/i3nLtbpNnfJwltnYP1JJlyRCSmQLdVQFNjaAdsNHFDea?=
 =?us-ascii?Q?KOeAbR13NihVeKAQvARMbBX3xV8wAnI+6hLVddLY+mvJiJruJMLnX2JDvQRv?=
 =?us-ascii?Q?hMeY6w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(61400799027)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qo8N0rqt9zGOA/ssklnVh/MtHiPBz+ayOA59qloF5MZt7/wv2d0XS/qj3nwTb3tjfCkr+MisLpm3B7QtyDkCPwjAxs9vrgAoxYth9Ol0ZwBDW8LwVBEmxqA4aXiJ0NvLAwLu+gNqkUIiyZ0k+8MQ8h1JRZ+S2Dept0SKIQhkZwJbqs2si08RZWF250Cn8CGxJdAhpe4F84OTw54O6Ii5SLgs5JZtgyCqlPvB5xEEbbF2bA05QzznmIPo4FE6effr7iqWHukly37IjSwQS08mdrY+OcLpXtJM7/NVzU19YA599sD2laxU2VQWrZ69BDCFNMaDRFIBuVPJfuCig375Ux7fMWGmIenPPHuV+nr9cbS0NuPv2AMmxhD821KUJ7JDe51lErLp3WiHQg+XfJgdmubcupbvptx6A3SaVLI1SecpZCjmaT5sa30IABF1sgJZ
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 11:50:45.7165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c712cf-4e97-4305-3be0-08de6963cadc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB5859
X-Authority-Analysis: v=2.4 cv=YeOwJgRf c=1 sm=1 tr=0 ts=698c6d1a cx=c_pps
 a=zMw3/4lVTLt0/G0IafOnjQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=JWJ4FJhelzuem0mPFmAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: gqd3I7JbNAbAnhpNTTaA37O56qmbSrXd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA5MiBTYWx0ZWRfX/pEQa49U1EFJ
 RTBlaMzUHPpzQDVbctvAzF2hU8sNUfR556l45v00HtyddsJWtxZCn9wpw38n6kgw7TGmcHr0czb
 2DNsacY3acNV2loWteD0HFic1tNhfNjUi+i3uRVIP6Roqp5JibA8s3eaSW3REm7xWM+y67V3Wqr
 IvuvhbqgL+bY7mxR8sBeBXF3y5jtxFGQ7OM1jiLN0+wabfK3lAm9QmdA4AY+LJ+eNrs3SLOmCXq
 o1zeJej/5fVa6HZGc15jMLhrWsGy7xGe0PLObHf80kRVy7ku2FJE40PzMyf+qOykNzzvHGTueqJ
 AhNIbCMMSltNopuk1kUanUczQuzYXywVhqcQ3gWSGZySHI475cxaxyVyPE8Nj5w4UTXH4eLqiAn
 tFJtVvcgIKZ/6ddkDFHQ18efk0iJmpr/+TETPXihn3r22OV9/EQRXn4fj2UGpl792kafBMXhy9e
 VM8Aezk+IgrDI/0/R8g==
X-Proofpoint-GUID: gqd3I7JbNAbAnhpNTTaA37O56qmbSrXd
X-Proofpoint-Spam-Reason: safe

On Wed, Feb 11, 2026 at 01:18:31PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 11, 2026 at 05:35:26PM +0800, Shengjiu Wang wrote:
> > According to the binding document, the supply name characters are
> > lowercase.
> 
> ...
> 
> >  static const char *ak4458_supply_names[AK4458_NUM_SUPPLIES] = {
> > -	"DVDD",
> > -	"AVDD",
> > +	"dvdd",
> > +	"avdd",
> >  };
> 
> In kernel we also have
> 
> arch/arm/boot/dts/actions/owl-s500-roseapplepi.dts:123:                         regulator-name = "AVDD";
> arch/arm/mach-s3c/mach-crag6410.c:631:  REGULATOR_SUPPLY("AVDD", "spi0.0"),
> arch/arm/mach-s3c/mach-crag6410.c:632:  REGULATOR_SUPPLY("AVDD", "spi0.1"),
> arch/arm/mach-s3c/mach-crag6410.c:655:  REGULATOR_SUPPLY("AVDD", "1-001a"),
> arch/arm/mach-s3c/mach-crag6410.c:661:  REGULATOR_SUPPLY("AVDD", "1-003a"),
> 
> Are those related? Can they affect this one?

No idea about the roseapplepi one but all the crag6410 ones
are totally different devices from this series.

Thanks,
Charles
