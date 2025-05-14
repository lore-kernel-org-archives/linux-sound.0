Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE674B5AE
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229768; cv=fail; b=roAIoUEFKXMsGND0mNYyL8DQgJ46AmAdJzFStIuRgeXDaRhVcH4EDbuRgxpid5oKP5KQQxA6vjp8jKKMLjTXzJ0k69kFNYcVUdhjsIC2nS1dRSHaF55MK8CcRuHRrM+JnhpjKfP3CtUvDLdbCxCEucCdMfngK3PJf4P2HWJxlow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229768; c=relaxed/simple;
	bh=7WGMaVRu70IT6dfZBx4AHtByWRCKgTdToBtrFZchTOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9bC4oC5lCnUZ6QyCu6EOxkjJP4py9eS6GFFcX6+v4tVjEGW1RrcQMDcI5GU+asIDuFCoh2GHFpGm+U2Fh7xKyIJ+wfvnJv95OmGp6myjH8GSjgU95uH6ozJM6hRu6bB1JUYg1agb87IcBpU5kcpwr0ZO+cOJF1D3SOPUdqsAgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kPMJ3NSc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=u1pOWXou; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kPMJ3NSc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="u1pOWXou"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAo6TW022018;
	Wed, 14 May 2025 08:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=LfpWZbdzo9Vjg3GNB/
	AO8ylRnfCFXYgddy7bGopvGDk=; b=kPMJ3NScrZaaSZOkH3MTpYYVQqD+DgiuwW
	oyeJiJF4Xd92gMUHxc6Rq49qlt1a9QDq1NNkFzkmZpPqfsWRNZ2j1SSg+vy5dcvA
	5ik6uG56b+M6zkOkQPNW/+oTBKElz+zba38YG8SlnwSAgQEjOTjiIAWNJzDA69XF
	JuVFGCqqDNaTla9Yt1MFOwhtKfnVhHeEVpTBCljSbX9pi8fE/2BNOE3D8q7ZKfNm
	SbqLxNPomnqL3CwOSdBo7LiAAfUS4c1zCiSyRtF8TuqlyoLVOKS7YTFde4r1uNLU
	3LVha8LHoMBxhlSQ3RR6xOuNtuRld6mBbLh6I8BI6YmEjUdo7rOw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2047.outbound.protection.outlook.com [104.47.58.47])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46mbe595ey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 08:35:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8ClX7Lj1L0BNJUCCv/AjtGwy12VLCBbUbn1t4Z2J/KnzjS0VoYJtWphdL1+2DSHRjlM7lstwDIn7Xj6WzwdM2f2Z9AjBiAfRKwqn4jrhBYH7AIZHuDOTFAWjWDklMei4FuSeYzhfoZwAsTCd54DzZrsa3ImmMGtu+jGkDs7wjbvL2hsEbGAm57IjgM8zg8XC+vAyrhuUgWW5J1OXf9Bp+Tq3z2P8uoImSkVM+jQKw5kmtjXBM2eNFBTXBNDzP92FnigW2crB5amekJLK0Cr/zXVag4/XXsmb9nfU1ZNaXCTC3MMTFoBr6OZSYM/le4LeaZ+yi8EmJBmCliXiz4S8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfpWZbdzo9Vjg3GNB/AO8ylRnfCFXYgddy7bGopvGDk=;
 b=H4PlNFZ177PFQHGFy2x/13OOJnxAkHvE3ONU4kW0NhlL5r8AfDtGnEipuynXyXDEHriJLelXCdNRNV+6LRigka+ZcrVCxoGSfGYtLXeTbzSs6Q30Pes0V1eU79ZfmBpBdodwb6o32zaHMHnH39zoZL9JLMwWeFxfYdlFDXhX+nR79DTsUR4Duzwa8JJ2LsThXQ9jXat05vfeWjYePcLQ7+6XI0QtKC300Mm/FIJRITdYYc3takTbMftLYemoEeXWfkuX5hox5YKlsfmsltSDnrwuDbVoKzzj3xohlrbuEIGFSnX6xkMXofF4fbeFc6ngBKd/xlIyYpqfaYmgRjeczw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfpWZbdzo9Vjg3GNB/AO8ylRnfCFXYgddy7bGopvGDk=;
 b=u1pOWXouVSDl/0xELT+6FajgS8cEDF5SlD9gLvBSj8HTdd9WM3FxFmFRFOW9Srq06zb7YnGZCWd0i+IJ87ECFk+NopUEPFRux5DzsqVelj/51PMR2747QZeUAXmwOMcNYRYv4F7VSBDZuj+cne5xYXIrwifdq/iA4etP7jb00pk=
Received: from SA1PR02CA0009.namprd02.prod.outlook.com (2603:10b6:806:2cf::14)
 by BY5PR19MB4003.namprd19.prod.outlook.com (2603:10b6:a03:218::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 13:35:53 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:2cf:cafe::19) by SA1PR02CA0009.outlook.office365.com
 (2603:10b6:806:2cf::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.16 via Frontend Transport; Wed,
 14 May 2025 13:35:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Wed, 14 May 2025 13:35:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 46AB4406545;
	Wed, 14 May 2025 13:35:51 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 3148C82026C;
	Wed, 14 May 2025 13:35:51 +0000 (UTC)
Date: Wed, 14 May 2025 14:35:50 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v5 6/6] ASoC: SDCA: Create DAI drivers from DisCo
Message-ID: <aCScNg8FRydkPZQo@opensource.cirrus.com>
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-7-ckeepax@opensource.cirrus.com>
 <8f94874e-0a4c-4c52-af12-c3e67e45cd18@linux.dev>
 <aCIs30Zr0uXRt6cs@opensource.cirrus.com>
 <2241a45d-e63e-4640-bc0f-c6f4537740a1@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2241a45d-e63e-4640-bc0f-c6f4537740a1@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|BY5PR19MB4003:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e47c917-5bda-441b-abd9-08dd92ec3f40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eDgeN5jiPB3aNkcjqZwHlF1RBeMozmCOAnaCOzRXhwzXMadkZw0eDohTex8Q?=
 =?us-ascii?Q?sVILMdhzk6wa8qxZTXUepkuMbkpEEqgXJLLs9GbAV8tkAiaV2NMxhtDdtdAk?=
 =?us-ascii?Q?5IqGW28QpBB1KiY75Xn8aHWQuw01Qma1GHysbxppUHQ/Dp/PxmdkdQgLfodH?=
 =?us-ascii?Q?IrLrlBk7pFWWhrWCDD2kz2ty4rgZcs+2wnwp4h5ivKpmT8iyDjzpDPj4VVvy?=
 =?us-ascii?Q?i5WimXH1hUYXUoCy0nwjKgK7GJ0FPI+7rsTRGYkftAaoyAe2d3Tj0Lew1PVI?=
 =?us-ascii?Q?Km6sRqVzQ0DHHQyrZG9+NOldvLD/y1hoQP5dxP2o2CnG4fy/4Jih1WX03BQ3?=
 =?us-ascii?Q?P0s/VXtofhQFnYcUS8ZGJfdImGI2dd4n74jPsJltlcN2NJzM4t57gmnLnjjv?=
 =?us-ascii?Q?LIs+CbAJA70WgUsddgzceq7aQM+ZKZTXj4qmpE07cNUfgf0Tq2ZqNPERxI93?=
 =?us-ascii?Q?TCl98hLRvEbspTiZIEzX96d89GRC3QJdmExBL8d9n3VBfR/RVnGfwW6+B5jp?=
 =?us-ascii?Q?KeLc+lyldxnEMrFDgU5pGhma/cPB4TDd31yEHC/ZlnFOuNCVG3tHM5Uw8Dod?=
 =?us-ascii?Q?CUnjOu97+cjV9lCgvhK5Eej0Jqq6WvfOTeb6td9ltWHqUcVSIfxuBEreHKM+?=
 =?us-ascii?Q?1bBP7Y8WiakFhJeiVkS0nuT/8+vEuDfHg7+ljKTxohHCle1Aaj7KoemILRQX?=
 =?us-ascii?Q?o2tQhOZgKG4sYD9FctFsNi8FMWOsSpMp6sxAVEKnuVOwbKyGfVuXZIfcXdpc?=
 =?us-ascii?Q?VVaTWvxR/vWoULWBmRoE4lZnBiHEFGqHsVdEFwr1zvJ9dAB7i5yg9Cs/sYaK?=
 =?us-ascii?Q?wtpxk5pFyLKyikWIerF2xeumbKcloL1F3zcCo+vn/fLZZkKhv4bc7tAaI2Bh?=
 =?us-ascii?Q?bOMqhmKU/dBvc4gIyik1uXna/Hp2zb5zioLlNUo1fYqY2oF8BpXy2w6w6dBA?=
 =?us-ascii?Q?dVB9tBMWF9gqGRaxQ7tD7h/VNZzpVwa0/IBuOnn0+pCudP8YLtiY2xDdnSCv?=
 =?us-ascii?Q?M8zgwtTEcLIUhXHjt4YXLtfuAhFv4dhflz69F0T632tuEHmorClUEcJ+ild6?=
 =?us-ascii?Q?noDgKGSVwcUgX5mOsEuz2s6OzVR2VeJIkYH/FVXLbosUZSHSxlsdTluwNeay?=
 =?us-ascii?Q?NFCuAu9GCaAp0+LyIt0bP1gxb60tR3qo11hvfZF4U1Lf41Xj+oVkLtFO7LKX?=
 =?us-ascii?Q?846RcoQSSZUb3uhg2ATEk49nSeO7vcEr/cV2uvk5il3a/AC6vjvfdPrMiut0?=
 =?us-ascii?Q?EXdugyREjOSNXCw4NgLSoMzQ1dSwCdo/adqiU2JX3Bg/ncfuWIVHZtjVQCfH?=
 =?us-ascii?Q?LMfhCZieF3FAt0wT5gTsBKDXd5Cwtr8MF5KTHzg0k1yoZgzvixuWQ2p33VGU?=
 =?us-ascii?Q?rUfXR5EFCKQ5qdj8ugcFhg11fAffxzfv3YMBTKAIODTaCmVH4b2GJatNVHRj?=
 =?us-ascii?Q?y0XEWN4pcsurfsiRHYVoA8hK7MizMP/DZx4FLmzvkuZaWbCmjdn9uBbpy5Pq?=
 =?us-ascii?Q?L0PL/KdE31kc1T5WHeTH7vTuoz3jkhRFwVWt?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 13:35:52.4883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e47c917-5bda-441b-abd9-08dd92ec3f40
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4003
X-Proofpoint-ORIG-GUID: _-9JzFN-8tRCjhYtSZwZK7Bq7lBNjp5B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEyMCBTYWx0ZWRfX44qN2yJ8cWbL FYpQMaw5BsDFaA6H+UGOvWUd6P4BjFKu6bR4b9VdbKm2hb/sN6xbnF2vFzK2KsmO/Vie4f/JeOz ChBpM9zBSR5gkl8mwVqM0OPOIyfD0ziF1ed1Xm/44o/aYLWH4nS9MyYryxaqk+1ihXwDOmugxvq
 s7uCcZNCgR979VX0sPY5bKMskmoYFVzeyCQfo6+kdW9m1kwOlnf21qZRCqT8gDIBf4aHB8YbQOa xOeQDI92lQLLdpHmp4fe3rQzhRJ3OqqcXejaRx5r2f8HM6aaJFr15AIRMWSi3MAXlTfdPUKjT5b kGD6JomDt0wDW+doVXy5RS1eGT7SzFo/hJcQt3G0neyIsM0spyelmY011RIOb963gVGvY54XQOW
 3yuUREQcJED25CW8yjTIAj9YKFWQHvTbBhFcFaKZFrsm7EkGEWhkp9qIZqfFZcWZryScimlq
X-Authority-Analysis: v=2.4 cv=eqLfzppX c=1 sm=1 tr=0 ts=68249c3e cx=c_pps a=zzjaJ2HwkiRAih7KxKuamQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10
 a=RWc_ulEos4gA:10 a=6eSbv_u5r5u5_Jb563QA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: _-9JzFN-8tRCjhYtSZwZK7Bq7lBNjp5B
X-Proofpoint-Spam-Reason: safe

On Wed, May 14, 2025 at 02:38:11PM +0200, Pierre-Louis Bossart wrote:
> On 5/12/25 19:16, Charles Keepax wrote:
> > On Mon, May 12, 2025 at 04:00:18PM +0200, Pierre-Louis Bossart wrote:
> >>> +		switch (entity->type) {
> >>> +		case SDCA_ENTITY_TYPE_IT:
> >>> +			stream = &dais[j].playback;
> >>> +			stream_suffix = "Playback";
> >>> +			break;
> >>> +		case SDCA_ENTITY_TYPE_OT:
> >>> +			stream = &dais[j].capture;
> >>> +			stream_suffix = "Capture";
> >>> +			break;
> >>> +		default:
> >>> +			continue;
> >>> +		}
> >>> +
> >>> +		if (!entity->iot.is_dataport)
> >>> +			continue;
> >>
> >> should this be moved as the first test in the for() loop? The switch
> >> cases for IT/OT only makes sense for streaming/dataport terminals, no?
> > 
> > Can't be first in the loop since the entities can be different
> > types and the iot is part of a union so it is only safe to access
> > is_dataport once you know it is a terminal entity.
> 
> ok, it's be nice to add a comment for the rest of us who
> don't remember the low-level details of the data structures :-)

Yeah never mind putting a comment in, I will add one for the next
spin.

Thanks,
Charles
