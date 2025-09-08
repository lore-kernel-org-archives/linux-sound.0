Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B1D72626
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 13:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757337419; cv=fail; b=Oe1g4KiWoCam1iP9lMZYJDML6CXmtkYRmvLh6T6tMcyNLrMb9+3/uvPj6qsMws5v7STpy6kVUYiDuS6U4TyBj91X1mgZ9BGVTedwB4Gx3khaCE12rzT3s7DVZuXgtDLidtOWSGrkTtoOKw69/8pFzgG2j/jowUqnlgr0ejruSA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757337419; c=relaxed/simple;
	bh=vt5zbeuZwL+SaiaKO+nkcylvoT3sWp7ymMu8a+twwSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ojKYch8HXYeQD4E53d2+HPGAbwSDlaVLTl9lPagkEoIr5opwpbFO7l/G8ZbnXC07y+3bkp017kzL6R4RrD6qs+jc/jZTaP5sTxM1YOut4IykT/zAFp7vW5st67p5b1UIVKmjJeTEaT1Ic9j1HznS2YNB78V6znoMIkGa+Ncy+WQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=h7/xt1YN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=B9aYjnes; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="h7/xt1YN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="B9aYjnes"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5888UlSW2152512;
	Mon, 8 Sep 2025 08:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=xTxWervLNIEE2WHijs
	9xYpVzbfA4duThEKDr5tW0Fik=; b=h7/xt1YNuC5jzyPV42yj6rvygxpvJu2pn/
	IE9WwwKYSAxK8n6RxIjBzqAtOW5D+87sBWrBvGJyPzCwBOHRLSK0xI4DWcRZO5Ah
	KeOwksCDwN3Zv56uC2HZ9/qKLdk6Nkzc6joX9NU0Gp3ihlf2uiO+SB9zj/9kKgJs
	i2a6u0NBs6oTB0Gjw1AwBoV9EOdeFOA24DQTEhH3esMfGwaidDflHh3ODIn1blSZ
	h4SdDpnnICgVDK6HkC26+8MdrX0LPt9fJVlEu47t9cB0ooUuWk7E4zRHDtKZ06qp
	2e8mmaZlsG9HWX5CBeG9u+Ozs12o4fSSpjPqBc3+3HbnVj5db3ww==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2135.outbound.protection.outlook.com [40.107.223.135])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 491upq89af-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 08:16:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2Z2r/dJMRD7JSJI4GgHjAjslyc3lqSp8fz5BJEiqRCkHy6P3vmVtoQ+C+T2bYPkl+ci8owhvk8S9SfuRxwhHUu/gc1X6xw2/wQH8mZwmGgDbQwJPj5AtjOv7Q7P2R3UxsAgo03NYN2YL/VLEeoT4yBJj5kZA9kGz9C3b8ryzHGCE6ET4ximOentLKaNrZodfaolIgSpOw4B8pEjkjiQrYvuklb+8N1duQ11k5M9XCQ8pjS5Ld1wC62RlH6inzB64CQ6gzdZV+3G6e6jFfgcC9fO1Qw+KtJ14ZMDK1rK1o2hXT0HoA+bfAXbabdxbJAt8ldebPLcPQhT1HoIZHRecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTxWervLNIEE2WHijs9xYpVzbfA4duThEKDr5tW0Fik=;
 b=Z/G3vsEsUGF6X952cFOLRJ+m+ykvMacTlyD87hU3hep45djW5+BBxsUFwVBAKLDlBkFp0hmSy0bJYT0OG5OwYi0dFcUeCs3/gFa/C9e9eyx58fok7HDz/EWPww0acPH5XTgb4Zcsxdey34yi0I3IABkg8tItPYjtKv0xaN9vtWDfo1KI0zEvPIPAWkfDPEHZUVYT2yD/x+y0kYKR8MRL34G4DnuinPCLV7kjV77pnmUP0JAun2LcK9HyFS46PHbL3SnzFR0lZ1Ivq6fH7HojUO0uhFy+vKAE5+reGdWjfRsuSB2bvbjGQY3bbrCIXWUJgnVVQpI6zfYnVzU+4om7/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTxWervLNIEE2WHijs9xYpVzbfA4duThEKDr5tW0Fik=;
 b=B9aYjnesTWhs4q63+ceObsYrInhjNdx/9+mmaAIIHPg5SuXMPY9LyNorZV2LvSQuHpdgFPjUukMVEcTt8JhB7wDjclUj5Hh6MeQl8jbb0pNbyR9Tuh0e4SQsrkah2fO6z7b8ut98GUa6iopx+TYmxotvfeHwu1lVE/23vpnJ1lA=
Received: from BL1PR13CA0433.namprd13.prod.outlook.com (2603:10b6:208:2c3::18)
 by SN7PR19MB4813.namprd19.prod.outlook.com (2603:10b6:806:f5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.30; Mon, 8 Sep
 2025 13:16:37 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:2c3:cafe::15) by BL1PR13CA0433.outlook.office365.com
 (2603:10b6:208:2c3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.12 via Frontend Transport; Mon,
 8 Sep 2025 13:16:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Mon, 8 Sep 2025 13:16:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F2516406541;
	Mon,  8 Sep 2025 13:16:35 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E22BF820247;
	Mon,  8 Sep 2025 13:16:35 +0000 (UTC)
Date: Mon, 8 Sep 2025 14:16:34 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 11/15] ASoC: SDCA: Add FDL library for XU entities
Message-ID: <aL7XMkyQr77zaPqO@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-12-ckeepax@opensource.cirrus.com>
 <9504c1fc-d65f-40ad-afd6-cc4bbb880b23@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9504c1fc-d65f-40ad-afd6-cc4bbb880b23@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|SN7PR19MB4813:EE_
X-MS-Office365-Filtering-Correlation-Id: f4dec178-8604-4846-04ab-08ddeed9f101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+4ewG+oHEwMbNUaxwAlwjauerCS8yty8r2Suo1ru3Ur1jiI9GsmKuRAS2A0L?=
 =?us-ascii?Q?2Df1ND97hcTrzMu8C9JwkNNEPv6gDRFEcBLnw5cq1iaRyQtwWX0fk4+yF1tb?=
 =?us-ascii?Q?2auNSo6AA9Hxw3YDAJ1tIbllOPmPA+6fBnS0NVqA/BKQTA1uGdy4B3CF3iMU?=
 =?us-ascii?Q?arVKwcYABaqB4ytXJXEboXY4YCu8ntpclf5KjF8NEQNtJAygwvAY3gZaBj1D?=
 =?us-ascii?Q?PZfNNjf3qAJLCO6fqQ1vjjq7NyRma6dsdqRUMJcDS95wb8MIf2ye97cOxBX8?=
 =?us-ascii?Q?mYBd7yUWZYQRn/pUVBwulPvrmhOhlFG9Up0qdNWMGp9FWCT6Z4pz6arb7mUG?=
 =?us-ascii?Q?16SIwzMowdwly/k73aAKJOrTTg1g/QckYLWsg3z/r3y8TAURNJiMgPTMOjZ+?=
 =?us-ascii?Q?OCbRcfIlOij2b4NXaUiulykpwUUAAf88casDcoFjYU6FNH8UxY1dcF5b7p4p?=
 =?us-ascii?Q?1bSdRY7wTBcEG/vjV0UCgK1UMJTcKDqI0T6darGzwXWOWDuIdrauBuiYjGNh?=
 =?us-ascii?Q?3OO1k/BMnmZ0Wh16k7g9CBBfM8wZSKqZKITWJnFLzEyrqH4C5WuEWoieJkfW?=
 =?us-ascii?Q?6bCHuxBOacWU8F+WpOcnwuXqZsTAAIkepFwietD/l6aCOFm2bXR8Bpc9zEN6?=
 =?us-ascii?Q?RLq/9S1jfLhB/2V5JWl7d120Z0WIgavjQTwQRHvgdEQrdz20tnwD1k+gkKye?=
 =?us-ascii?Q?pGpZQg4/QFvmQqQZr9iRP7fBOsKWag3RK3W2Vu/8ytbxChaz63BQJqqhzdlR?=
 =?us-ascii?Q?DboRMPZR6yOaM9kILmO4b3UznOYTnHfmSVvWQK2k5yr5HfgqSGuecrtZh1Oa?=
 =?us-ascii?Q?WIsz6Gh/hymQXyjx7PUCmJApjvWNvVcycgobEWZZkqb9hD6MVlF2QFovv0qY?=
 =?us-ascii?Q?WixH1UAHtE6MMAojwwW7mgoEoYBhbJgwRt8okKYEfeO4iGf/HduoYoPv0LlV?=
 =?us-ascii?Q?QxUqmR6vujfQpeFxSOX2jFwMtPJO9zhGR4iUP05sTpKrxmD+OX7tRDXpmi0Z?=
 =?us-ascii?Q?zWsPDE0eOCm5Nxz5HcFunoJMt0JZ3GSuKhWtXXUZ5XGpa1ya8TqAncVIFW6G?=
 =?us-ascii?Q?P0DJWPjYtBoE/SfoQJtFBusHx7JXxcfkDvtpac4W0KP0BfV8DkLeqzQOmH3x?=
 =?us-ascii?Q?GNB4q8ESJQiQ9lr93AOIlgtm81T5ueP6QlL+2XtqEvxayHL2wk8YFFiIRIIt?=
 =?us-ascii?Q?g/farxh4tsJDQRFQDPU3XErtmnA28wG5Sg3DYjcTDv+9H0v2pm3uR+VqVYVb?=
 =?us-ascii?Q?P1QSU7M08LdsIF5GP+XBS5NUWtcHHLUXV3TIsTXo+EZcbEjPVUvfI6N8oAOQ?=
 =?us-ascii?Q?k1Zl9WLZ6hVKIwVywy/qT+j14fnJDrd0QxAUVC91SSD0lSstXU0WjHX06pPO?=
 =?us-ascii?Q?R8ui/wiNXnkpKW17p8peC0xilap1JXLuyptWuX+lVLz4LhSjfZwwrKPEkYyr?=
 =?us-ascii?Q?AI0dcKL8tiwwUh8yezukhEkguTHQIVLSv/F5LCPewmjt/OgU/eFqyzY/vLGr?=
 =?us-ascii?Q?Ju/Q1i/oMV8CRlmGMZ6tdLd7YmfCWaUSg3uY?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:16:37.3095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4dec178-8604-4846-04ab-08ddeed9f101
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB4813
X-Authority-Analysis: v=2.4 cv=DMuP4zNb c=1 sm=1 tr=0 ts=68bed73a cx=c_pps
 a=SfKpAED18FmY9QLmYdbp3w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=iVzNly_GkmyTTLDjW18A:9 a=CjuIK1q_8ugA:10 a=0lgtpPvCYYIA:10
X-Proofpoint-GUID: Tsba9upHetiy8ZvUzpoqpK6_giXjLzOW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDEzMiBTYWx0ZWRfX3LFIGl9Hwqhn
 kUavg5aOVRoMHOuKPeWpVUnOORbPkVrKEdv1lIhMoVK10++TH6l+CjyTO4iirgxTO6gclQRDhku
 KpB7DuVtbGfWS09+l5R5Tc0qB0xnryfpaR0ehCkYyEpTpCGeZlvsDCyOxr3THmXbFs6A460cqfl
 JvENtU+AccrjHLQ4M2UWMjYOO4BVtqeKzdEp3NW1X6vpnRedeBEhvd1MOZTSdYjIjT3+Fr9WflP
 K4WJt0r1y06FVEqqJfnk0xjc/9EnzD1ftvH4rt+c2lNrKV1cJlN5Ls9thPhlzBejKhrIVsAxa0F
 mjMN8/u01gWcyYKuIdDtaboCJL5GzCmgbcX051e7XokvXn1T0hh35ObYUvHfXc=
X-Proofpoint-ORIG-GUID: Tsba9upHetiy8ZvUzpoqpK6_giXjLzOW
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 08, 2025 at 02:14:00PM +0200, Pierre-Louis Bossart wrote:
>  
> > +config SND_SOC_SDCA_XU
> > +	bool "SDCA XU support"
> > +	depends on SND_SOC_SDCA
> > +	default y
> > +	help
> > +	  This option enables support for the MIPI SDCA XU Entity driver.
> > +
> 
> I completely agree on the need for a common library for file
> download. But that functionality happens to be part of the XU
> scope. Other things might be added by vendors for secret-sauce
> controls.
> 
> IOW, this isn't XU support per se but FDL support only. An
> actual vendor-specific XU driver would rely on the FDL library
> and add more things of top.

We can rename this to be more directly FDL, that seems fine.

Thanks,
Charles
