Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18C72638A1
	for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 16:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750090718; cv=fail; b=hO8/Ya4LIF7j+IUZj+pseSqlp6wejq2lFHLRiyUZ/l6FbvJmbdOLJ/7z3adaEcBaRWcL77DbEwjQNCt0WuwkzSTAetuKM+Fv0CnnVbVaCd7U2makkUw9dRFzwkkwUxF5d2nRbJ8Q2SwhPA813YxN7Tmnj8463EPjwhrGV1N5wWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750090718; c=relaxed/simple;
	bh=VOdBPb+Gaby2eJkM7nyzmhxe/xb8V2Sq+zTaWzQU9Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLrn+G2hDK0FcL4WMEvb52s/plDYp0y3croo1wL1rFOoAakjRH3acRPVZP03pALbaPKJUsmiZtDG7VilkcdEJfjYfuIagyw5nK+cIGcwmYIrYOg7Sxkv8kIujoxg1oCzWhbdmBKHetEUeWcGqphWQ4n6xxNZkiPbdbV2yRvlVH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=T/FfN+NB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZHmBnXCf; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="T/FfN+NB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZHmBnXCf"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G5mARM014513;
	Mon, 16 Jun 2025 11:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=9YkEg9DJcC6ZFvdYTR
	98u/qG1/JwFKFp1ieYqYwsEhI=; b=T/FfN+NBKak55uuslrY3uVqrQ7qQNHEWUn
	ptRR1zWb/et9EPyoxr4DPx+Ierg+gITICsBRXP14pJQszCXQhWuhzk4vqRCivAlY
	Q394jRRMPmRmPpetLUCXWRQ3UxX63mhKeqjiv9jxSBbHJJ1oDOXZPyUa3rRM1xsd
	Ts+5CdrsPT4+p19Ra2yoMS/cS7KdEbwU98KGfVP4EFaJ6beEnRtaUtCyv6PF/DWp
	OEHwUoHryxBacJDPsDjFXP60EM+jsPNAFWN0criMJ1eCuMbq7QaX718X8BFce7US
	4QV/HyVDPz9A7VaKRT25byh6IqlSk4YhUNN/tL6Hz07cZcJ8ILUQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2131.outbound.protection.outlook.com [40.107.237.131])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4795ghansh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:18:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyqrhZblCSVWKZG3+fScDx85zanpXe2V4Om/XmPBY/jbH8zjMKzIGmJLwngHkElrZ0N/hD/EKcqYWjvzmZjSZOYQb3ajrGaV3HBm8xaIra5tti2H/6FRog+1NQxtcS5pDxgMr6RcUgiw6cpD7j4vN5FUOlsAR78LYpodvekV6rCHUKCMm7MGDrhq2dcxNar0R0iBXtp1+8CPAw3WC8rsFcEzYt6u3DMnSWQM6GBuSOoMyvEmTRYoh+ggBbr++Og7gabhdJI/V+ijI847NEfdRIeAIaU7moUGMYY51vXI4NCI5RP/3XU4TaNW7mjdpHyeXTB+ColaVRDzH80B8g4BLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YkEg9DJcC6ZFvdYTR98u/qG1/JwFKFp1ieYqYwsEhI=;
 b=HP74tyk3RDdk/EamBZYvsvHt0G4Raektc0qX5YtgmO85yLalclKz2erQ3LxGwX120qXpjjYiCVUcCad+8LfDgR5+UU+Qi7k6dgj4ILEBeR86bDkKCJu8LvNk/DjnWO9k3EV26r+sxBDmkbQNUBfXE66G2aUX1xWVhnrYAPLAEhbxUUOjoqUsXUajoQfLEU5pandTj/YGo6szw5Xnat4aHlAvSORiVcDrwTkv4UY7wA6TrKYSP9aQMNcbvdMH1m9+iIp+5dLmHPeYS/kvTQRh8IdszicCKzORhKi3QAlRtgS72m/VM9RPO/+sY5zo3E19joo7Ld17lZj3FXzswJY36A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YkEg9DJcC6ZFvdYTR98u/qG1/JwFKFp1ieYqYwsEhI=;
 b=ZHmBnXCfQCtscZvjiSHdntcCU/m89eT2fGntqdLLuo+wzBR77X8mCxP8YGIo42fFHENVttC43jgmLDzhNXeM6nkY1LEqYr1o+qHjKPwnYzUwOm68GqOr04RFln9sMHlpm0TnoVX74Z4JEEP7gTRIHYzQLLrLmArQ0JQTaLEj29g=
Received: from MW4PR04CA0272.namprd04.prod.outlook.com (2603:10b6:303:89::7)
 by BL4PR19MB8908.namprd19.prod.outlook.com (2603:10b6:208:5a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.16; Mon, 16 Jun
 2025 16:17:58 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:303:89:cafe::5f) by MW4PR04CA0272.outlook.office365.com
 (2603:10b6:303:89::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 16:17:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 16 Jun 2025 16:17:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 76E1340654E;
	Mon, 16 Jun 2025 16:17:45 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5956B820249;
	Mon, 16 Jun 2025 16:17:45 +0000 (UTC)
Date: Mon, 16 Jun 2025 17:17:44 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com, bard.liao@intel.com
Subject: Re: [PATCH v2 1/3] ASoC: SDCA: add support for HIDE entity
 properties and HID descriptor/report
Message-ID: <aFBDqPnJ26OyC9sJ@opensource.cirrus.com>
References: <20250616114820.855401-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616114820.855401-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|BL4PR19MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: bab1ee1e-11f6-49b4-3d93-08ddacf15b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5ZVLAgtxdFeb9YCqSw69qP931GVfZNunQCyunNr5iG3cRbiis+HRHoYKo6cl?=
 =?us-ascii?Q?xH318N0ARdiW9xsa8KKtx53KEugWGbgXOFH/gVDcEoBfa8POOeA0dd3n4HmX?=
 =?us-ascii?Q?leDHOVYq+DJoZvuj5T/Ns9VE1Edz2wsvfRHAkMmWMyI7WL3Cki+26LttT7mn?=
 =?us-ascii?Q?K/6IpdQyH+RQD+FbTeI0gGR0OC2pfwcuf2Ozu0bAxFIpRabxPAGf5Ct9/UEu?=
 =?us-ascii?Q?KMuAx9uhaG0ODDqJunO8fA7pmqtI/PAF6S7uMbiMXnnBlsaQ/QCTG/X8q+TA?=
 =?us-ascii?Q?Y2QqQNTYg6I3iRJpYo0hv7/X++i/KcHxzxeTAE+naCtvNf5v8vJyGEncPRIf?=
 =?us-ascii?Q?dCzERRoFQpVW+Fl6VnRAhApP7N8wkkhpHyXSlniBgq59f4LPer/7mZpL0FrE?=
 =?us-ascii?Q?BVaIz/Yz7R7ib94zj4Z26Il3n6NNohzL/sSb0OCBixBvldYMjFiJ4H66Y6l+?=
 =?us-ascii?Q?hT1oLMjJ/era+Y6yELEIUZPwYvwySKSNsSLBcfoo3SuvJiMMXBObnachyhqP?=
 =?us-ascii?Q?Y6KQR2qgNwLSZWrsKMOB2MX+e0QxCzRUTIppTmvTSrIW13lcE9alFP3hkEjH?=
 =?us-ascii?Q?55gA7e4U5vx196xFW8dWtG9+BOBbYkMlP/M7zzfF8z7idIedrb7hvtExAJkV?=
 =?us-ascii?Q?VLMEQEmMr87jE2yJtM3LKfM1sUxLzNMBTXRmYt/KACDT8UyVYElP9BMfEDCy?=
 =?us-ascii?Q?1+Ets5RbW0LcgWklH2I9zMH3umYFfabBXrbmrdIDZPLjgbpV4j0hGDdL6Vwj?=
 =?us-ascii?Q?uNmwPkFznsRic+VB30zD9mNTPlyBPbctoCEYQBy2n5v0slriEXeTcpktYf/r?=
 =?us-ascii?Q?wzxSIKhWB/Yhr/PTOk4d3eOD1wTTWvOXCDAOxGcbp13hQfnsm//CeHo0R9vA?=
 =?us-ascii?Q?itKsTAOf0l87j6tF/uJ4DjUZaxE51wDJDMU08591UIBjxA02c+4jt894bGY9?=
 =?us-ascii?Q?8QyyI+HkEZBxi7zTmY1NAMaewLeO08oDptG+cnJcDk76KaEDhNmyc5p17DwN?=
 =?us-ascii?Q?Eb5jkZVRt6snUGFcYD0r/qPwOtx6+yRktvpldVY2QKF8ZVuRuaDcxOxyNAy9?=
 =?us-ascii?Q?zM26cWOUHqv+vUn/O2nip64dCf6y0OZp4shqTChErIu3pie07d8e4fb1Jd/P?=
 =?us-ascii?Q?SI2YiSMC74Xqj3o9BDyHoUUjYrhfXWBcPnENP5oMDaFPSDzkH6bCK9aE0oBt?=
 =?us-ascii?Q?a31XMtZwolHWJaMEFCW5dl0yiSrenvicbl687S4LBWHeYC3jWbiRuoavXR0W?=
 =?us-ascii?Q?xZyVS3xOoiO/xUuDbeqBQTeNjEIdVd++M68WWh1shgOJPE/LnWs48bg2Yh6J?=
 =?us-ascii?Q?HEX5R8Kp0V2ejG53kUK5Wfjz2gj3a2FVF9CjhQfQ1PPrHuYIj//FXx1vTHDM?=
 =?us-ascii?Q?yYVQ+ETu50NrLNCjMSzrL7ty/5Ipbu4ymMISbMgAuj5akgSxXZcbO6ohdPHw?=
 =?us-ascii?Q?e0g3ohY839lXfjYeP9Ftg/ynBmju/TzHgU0H8wgt6GlIsy/gAnmifzqWCatM?=
 =?us-ascii?Q?iJ42FELWly0o8vduUrLqcROhD2sam00bufBF?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 16:17:56.8092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bab1ee1e-11f6-49b4-3d93-08ddacf15b10
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR19MB8908
X-Proofpoint-ORIG-GUID: jmXJLgox4FqcKhLzgsvCt1T6nKODWBx1
X-Authority-Analysis: v=2.4 cv=GrpC+l1C c=1 sm=1 tr=0 ts=685043bc cx=c_pps a=fcxaBkvc0RdMyUcE3d7x9w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=RWc_ulEos4gA:10 a=n9Sqmae0AAAA:8 a=w1d2syhTAAAA:8 a=yyFc5hshBIobQjZI_QQA:9 a=CjuIK1q_8ugA:10 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwNiBTYWx0ZWRfX2XMbBs325Qop 0t207Lpb8NP12Hb70He00s6loPim3wdOEHvv1ic/1Hoo+CPauKRqCyem3gYveiNn/vF2cT5E4XG gsfp6p4B1sJhc9/TbNgM3PC9ii4aL8cK3Q/9A0JXnOEQoHIn2nW00fIhn7dYHAhCYQhhh55tmSx
 GgZtA/HyDtCYhGLL7S9hYpk2G76BC4FMaAjX2DuRH+BOfWlWC33C+YACr6h+SSfNtUaspzQRULE ovNshXqsrV2dHaTHfDzuaFsTnSJ7PYML43DNK73Xkrda4h1WVnIz/gMtVKsgLE4B9DLIKw9Hr/E 4dQxf11Mor7sog6v3Ae7WZgknhGZqBWyDNw1N2myJgYCOSBj3sHpYHUa4cznPxzXw05CZWSscUv
 /8BJ2ZtXlaEKfyEobQ4jfZt4i0X1sFka+FqWP2pUgO6C/H7GaxQVo5HrmoBaVmfYi+ebaHKi
X-Proofpoint-GUID: jmXJLgox4FqcKhLzgsvCt1T6nKODWBx1
X-Proofpoint-Spam-Reason: safe

On Mon, Jun 16, 2025 at 07:48:20PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> Add support for parsing the HIDE entity descriptor and HID descriptor/report
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
