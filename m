Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A7137C0E0;
	Tue, 17 Mar 2026 17:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773769653; cv=fail; b=iP8zyfezH/Y9SZ3Emxpvyw6RhD1FhUV3sw2jxjlnTL3sXgfwUL6lzQqV3I1drZnDbkTFWVmwc2rwn+u8m9M4KsNVS+ILgHuOGHEqGQUj6cZGLbe78wYOoyDIFmS6Gcy43e6g/Hec+891kBp3VbE0z6dF7+3j8KCr3pB5JFiw5a0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773769653; c=relaxed/simple;
	bh=L+Kobo17ztvh59tgrj8X1fT3+g1ChC76DnshQAFtYBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITHTKz4XhI6yKVt8d2hUw1o6A5noF9ynApreGuJapt3p9IS2wPapEKDtWKtEwAAlHWDJLf6u6oe5PYBCFD1Z3ed58xqZl3rIp93VJbg3fZoqGoMk+A5UIyoj2yuv9767ekEbisxo1IERrscbmiZWh1r6x7xu8jI3FOIzhOoEYh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZHpMrQUr; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=C7G/MWMq; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZHpMrQUr";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="C7G/MWMq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HHFstN2043694;
	Tue, 17 Mar 2026 12:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ZZOc7O73xkKnBlgVVr
	1fTdq2rH3hPF3CrqLp6Uab6k4=; b=ZHpMrQUrapuLPvN8Ub42mL2VCk966n/6T2
	WarLzpoKcly/QKD1lKYQLR/bxoiLkvUmjmCW+KoK9Q1P0Dr6QnrQRyZdunfrtD0u
	Ox3ONKe1SVxayY/NaY5DG/xfcGZqcUyzEvUwG8PBXhtzmIpDwXQSxU3htr1gYXoK
	efRsxTla/OqKFAO8w711iFaQ9UPL1fs22Os0uZCbwT9Uoa1B0Lv8+6WJl6J72uw5
	zRP6ECjF40poGAW/Kz1xK28CJ4e+0WO+QsRdskLV1cnfKPTT6+V5GLVyNqYOmILC
	wQfmQiwV1CESu1CyWUhdDYaq1eLgkclvvegfcBed5Og3AZxq4UHQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020142.outbound.protection.outlook.com [52.101.193.142])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cw43f41hm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 12:47:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rAjswJRCWZH7InAVQF8jz/rUo3Bk8fcH/vptoOMCdrcopbBrqRykwW3WWL2PxMNQhcGGY9bbUP6yFNS/u37Uyt/rWox/b05Qsu2JLwePgnviAB2BiTCxFAjKv1eek+daN/0OWWdmbxrwkc9EXSU/zzPuOvsGzZBkfwiOUA2of7idfcNApY0c9uRUuDMZthCahAdpjJCoCVgAOqbluF4gSSEIuKQ3Zya6H3YhNx3rqvx+qTYP322bF3f4b6DP7oBYFc2jCjjz6kTf97484BrWP1dTTVrNz1OOCK4nMTH9CNT93S/ARhUjIM4rT3So4YauEzmyBoYogGuWH2H2RLK5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZOc7O73xkKnBlgVVr1fTdq2rH3hPF3CrqLp6Uab6k4=;
 b=livnqqHsBHew+3put52egP9ovG0xna/WlUs9NVL4SOjzK+JDDcOV2+nKyqQN/ysm76Q/JYelg9BrdiNIT0iDieYLQkcDf/meuTfX28mNdrl3pgZfHqu9SdkIFnhfvTksgKiMKvXMeogGjkpVGpn2oGjWGGAtsa6WjHt9GDgL4fTSZC4kAYtwHNew4yL1EW8popdlbtNW+xmxKsvqS89uiDnFwEA2Cd4Aa8LkpwGaal1x8KEbe7vaN5q/eIw7lAjaeK7Opay7fvtQxJHEB1cU4BOYxaM++gxq0eAKX3pr7dylQid5a9FU34CVcFUNremsdWIDVDSzBGVu+RwnC6YeTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZOc7O73xkKnBlgVVr1fTdq2rH3hPF3CrqLp6Uab6k4=;
 b=C7G/MWMq1p50mTmbIFIXS6QmzsraOEjqWmhqoSfFg+Ky5FPt3Kbkz3cA7fv0Hz2/3edCDz8CW6ee1+Mpao9NH6u7PMFz096Hl5Bjri0CrlsxkZBEyeWLpawwwdOE/0K0l2kUFKWjaG8bBySmOQo7MxdM5LrHP7kQsQRAC0zuOJw=
Received: from BLAPR05CA0040.namprd05.prod.outlook.com (2603:10b6:208:335::21)
 by BL1PPF6B58BD5A6.namprd19.prod.outlook.com (2603:10b6:20f:fc04::eb1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Tue, 17 Mar
 2026 17:47:24 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:335:cafe::9b) by BLAPR05CA0040.outlook.office365.com
 (2603:10b6:208:335::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Tue,
 17 Mar 2026 17:47:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Tue, 17 Mar 2026 17:47:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6EA6B40654A;
	Tue, 17 Mar 2026 17:47:20 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5608B820247;
	Tue, 17 Mar 2026 17:47:20 +0000 (UTC)
Date: Tue, 17 Mar 2026 17:47:19 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 00/10] ASoC: wm_adsp: Some improvements to firmware file
 search
Message-ID: <abmTp0NcfyCjfdpv@opensource.cirrus.com>
References: <20260310141817.1871794-1-rf@opensource.cirrus.com>
 <70c45f75-7ccb-476b-8646-3896181a2569@sirena.org.uk>
 <e9fc894a-4183-4d22-a9d7-6ad05167abe0@sirena.org.uk>
 <abl4wZyYTJf1C4ml@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abl4wZyYTJf1C4ml@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|BL1PPF6B58BD5A6:EE_
X-MS-Office365-Filtering-Correlation-Id: 737725f7-ab03-49c7-8260-08de844d3d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700016|22082099003|16102099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9FlKbck++icBL+0V3y7cRUarLeeLOAsXTbgtaVvuRKniB0EWqNbCDPCHR/p91tB4T6ffoDC5ThYZey2NK71GUvSlB08eppZmzJm/34VHgZsfYGrFE6qH14AwpnAh2O7faVt9dKVytcO5+QBCPr1mhanG/JYMMLlgLmlz49X3jf0KhnuWIOW2KVu+IPjiFmO3VrzBFhtSaJpe2cUw0XC3PBegscazIalgUrRxtXFIVlY8NaRoM3EyFfcyaHKXYPl3mjBuSFaYmkGkJAjMUvLODwqK5n+a2ws6hP542o7rSTasqnLA936lBZ0OfRVlozVOfgmylSmrORdBAEw9hLU0+CJJR/SiXtLE3zhLu8j9G8f0KeOSCrps29r8p9nZ2MgzUpogdmBrP13Sm0q/vEoHV9JdWPiG1nAy1BDLgkD7JVWOEpDohdJr1M7LpypA5z1kWIGcu6OwW9L0HOZZTmn/xpnneLiqiwvTj/0KIw2PfmUxai5+xMGidIVVeNKR62naMc8EeNn0fxzDdZsCcU8JBGjLMbmfM/S0B+h24VAUXC4exrtE2lwbIsAde31X/Yg5rrac8/8LOO3O3DNdRsDVLBYai7mAMDoa96/J0Bdq02zc/+MYJr1DJL44avufXqsk5olcrqvbcsIVz4WGVK8+5w5ZmY5nPFsEdVcYlB0jgqgoFwsjbkIPdK5wLe95PgkPt3LLAuQbm6O/MYvdfb+ej2KtHY/eV7XnFBm9Efr2okWNcsDb1kf+Vc7TW5hRw41PL89LSeWmFA7xPG9GnoYhPQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700016)(22082099003)(16102099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qdiM/9frxmq3FQjRc5D42BgQ4F51yBoYwEAMlRAj0STsF5hcMSsoGLejJbW9XvBYcWTv2EMc4GemdAKYo9bIZYU/c/uyc9ecxRjkB2uZQRe0VHpsSU5+Lue3mFQTRbkFRFG5jed4x5WTky9iW+w/41K3hOd0JKVW4iP/3OJBUoPRzx2cfLmBUFDSsJILCjbdaoZiWpbxbUb/yo7wV+Jj+5A/o8aydLuVA44//rBVfnVpFJ25G8b1d4O6MIC/lpOBCKZ2qeBVzMtDT93e21HhdR36OHKndaIcXkyUeYktBpmnJ6v2eBWKLCFHO57u59kUdNyzaPpBkhusGLs19wR5CDWwaRaYrpAfeNu6moLLN3W34Aib4V0pXaMeDnaYiZoYgfGQsZ4lzmkWH6iUE1eyDXBaLvz4nHPgiIdZJHN98hAThT3Kn3ykHdBSWFsAkAkX
X-Exchange-RoutingPolicyChecked:
	T82VX1JNWj6+Kx21/xgqjdpmfAHVIrxy+oQmfUKoMQq9npy5x4vmprfl+6DjapPBVHc3LMIgSeK8zstpYGqoh+ceBNpdeUQUEOp2UFdAJGaS6dzte4wGrJpNvuC70zuluDa5KhkbJxj0sd+NESekbAg94Fl6mSWxe9DJ+PGC3wLg4c9ZLY2w1XmaHGajTYuEYBVlfMfl2zE1erlubDGlmHjECMiR9lpDCvN8wsXKcQWdq2XutXHG5fF8VnNpJS9biNwQiotOppI/CnmlnrBj9S970m61POuMEJ5MqHhd8tC0rToFJVEHHPY6xAHF5d77vhOQjGuqsTYW2KAXgfUTTQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 17:47:21.2285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 737725f7-ab03-49c7-8260-08de844d3d9e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF6B58BD5A6
X-Authority-Analysis: v=2.4 cv=YqQChoYX c=1 sm=1 tr=0 ts=69b993b0 cx=c_pps
 a=4hwGk4Ee9vGu72pLTFfh5A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=2I9_S8xaWe-85zi1aYIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1NyBTYWx0ZWRfX4NdhZd+OQFsZ
 uz1K7y3kttkh2VtsPT3nFnZkn7bY8HPawLz1XZXlpyOGeU3lLEs4yt/SlsFHrLI1cFiVgNPTytR
 STckOpiXH4hhFfe4CD9WsK22tapiR2BL0G73gjOSEJMZdXj8ngctjuNoik29pOqJxmNg0uf7rwR
 ohUo+LtK4exQdl6Ra4c3yQojQxdaFxl9SO+Fc9l6PMyuIcUAZGbszXJOoOqHTQ9Kg4E8Ls5jP4h
 Vo6DnD24xlpCm0R4aD8Z25lcJ57at8YJW7hHzsuCQ+zDC5yV96o0Y2ehv2pXSkkkqOfFlieQuvQ
 jYYq28BtCaiob0GJh9H03KaAnL64rAjsRIVuw5Dm5FmhIDDCyMUGps5rOxXMYaU/gtDCrTc9Nh4
 an4ki1YzGzOihMwnoCdXUXkn75q6LLH4OZhKkLfFI6+uF48RxW6urynW6sN+FEE76bvEyTX027J
 YyEc0pqwfnW62y8t41A==
X-Proofpoint-ORIG-GUID: uExiU7wTyn8Seq0JpvuxVqWk1icwya8o
X-Proofpoint-GUID: uExiU7wTyn8Seq0JpvuxVqWk1icwya8o
X-Proofpoint-Spam-Reason: safe

On Tue, Mar 17, 2026 at 03:52:33PM +0000, Charles Keepax wrote:
> On Tue, Mar 17, 2026 at 03:37:53PM +0000, Mark Brown wrote:
> > On Fri, Mar 13, 2026 at 02:58:13PM +0000, Mark Brown wrote:
> > > On Tue, Mar 10, 2026 at 02:18:07PM +0000, Richard Fitzgerald wrote:
> > 
> > > > This series makes some improvements to the code that searches for firmware
> > > > files.
> > 
> > > > Patch 1 is a trivial patch to remove an unused function argument, before
> > > >    adding any new code that uses this API.
> > 
> > > > Patches 2..4 add KUnit testing to prove that the subsequent changes don't
> > > >    break anything.
> > 
> > > > The remaining patches remove duplicated code and clean up some of the
> > > > implementation.
> > 
> > > Actually I'm seeing failures with this running on arm64, they were
> > > missed by my testing due to issues with KUnit in -rc1, looking at this
> > > clearly a lot of the problems are knock on results of an initial failure:
> > 
> > Any updates on getting this fixed?
> 
> Apologies Richard is on holiday this week. I will see if I can
> find a moment to have a quick look.

The rabbit whole looks pretty deep on this one. As far as I can
see it fails adding the device because the device already exists
on the bus but this is the first time it added the device and also
I can find no evidence it even created a bus in the first place.
Feels like there is a large piece of my understanding of how
this is supposed to work that is missing. I think we might have
to wait for Richard to return on Monday, how much of a problem
is that from your end?

Thanks,
Charles
