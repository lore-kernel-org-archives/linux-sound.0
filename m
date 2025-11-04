Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C898B339B5A
	for <linux-sound@vger.kernel.org>; Tue,  4 Nov 2025 17:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762276514; cv=fail; b=JDjGcBVD3zpSCwkH9PY09OhRcyWi6O9WwJPpXZIbGTNDEOex8dj2S6hP/1X1WHBsaXVhHsOloA/ncusiLdHUO+TGvX8LaNArlTzyqmfAcEsMdRqSR+2uJ7czStbumJ7zhxXTc+VIhtFyjinYAW+s+EtALawWsAuftaH9QwBzn0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762276514; c=relaxed/simple;
	bh=lflyGpGbgTd1cwg0sGMK1rXqeqESLw3CFF5w5YJZjj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LR49xF1Mb2QvkEhutg6YDrFqNZhKSqxffqauyetmzFhxlAlrvBv9RPpYOc9/GL55WWXIJv2+YTijuTyN9KHsIHTuM6qhA1oCJWGeiQ8QNu6Xy3uI9vwOGwnABAf4fqbu61VBHTeQ+MhjEHkFgt/C4CEEgETszvEHehtBU5jhv2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AHN1r3NS; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Z/6BU3ut reason="signature verification failed"; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AHN1r3NS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Z/6BU3ut"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A466lJs3342458;
	Tue, 4 Nov 2025 11:14:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=IPkBR9pqVbXkN7B+0CWPuOO/GU9nRYTtnaQHFlaZtxU=; b=
	AHN1r3NStApArvDU1Bwn/Ml52K7h5aAeodOWjs4vKUNMQ/+XSfJsS+CGNEYR+BKZ
	w6Lex8rsd2IvAIzZxcl7ia9zYtFfYCOAEvQ8MEHH6wZq9wXyqiy5KQVOvM6lDBsF
	GjPhC7MfBhRArANQBp05L6T3qhz/2uUdAG1n4GPc1OV09LLwpPFKTEEmC1SpYpLL
	qwHbPUM+ojyid4DximFuPpkG+yuqH2ffq6FzbOVAx/tVhE1nn4N4b6AOGt4AIR5O
	J/aWEOKld7jCV+ts7FuOfFuVQ75DzsoqudQI8Wy/KVA9ITSHjdruWNzjfmcVJO66
	G2aMD9bGXpd2sm3Lkk2o+w==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020143.outbound.protection.outlook.com [52.101.85.143])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a7bwx0rab-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 11:14:43 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1h8cIdWMFKqiPuo6etcJmk5H3jZge2m3Q7YOMePswoHwkNTfH5NADxVi+iyGCtd7eCRL+n+FWn+6YIEFbQX+G7ZlxMZoyQWGxLsu0/2+hjDPLjIwwqH7h1BvzafMu5TFjzVThqiqqKhSNXaWYPNMsrXGLc4LQfCcuTvNBLgdom69KW3Ot74lU7RkC//efpwFN0lR7GPu8U/ZNnOxlOYeb7UVIxZaZUbLkcbWmDNVpHIqdNLg/VRiG/vvib34pSNbSnGYgS7KxoT5BEtbpxGfrgq58lx7v/ZM6uKgDYV69EV6+9Nj/sz77gD5P8zKyDPhTtO8eQ0lXFS96EgX/Fzvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xn8TpVvcAAVWxtKphRRNVRCE6m5XgGlpbdXqoYR5aFM=;
 b=A9cGAPqSVU+ecAvfAanCgwTvIKNEkwCVB3ta5djItsMOTeqnpInG3TQuf06SahkGWe9yXo9g8kV2VSm7DyCNxRNapxzXxEdWMGtYfgN3fvYu4mryXlpVna7S1y6/T+4wZ/nx+LjD6bKslWl5selpv/wdVsfVfBsMvgp4ElTHovbxdqkaYCPxoSYNwb1PhZg7PeXtpQVV8mKVVZq5Fj86TUBfnxUjRuxUBs2oCL05JvnmDH9YTtA2Nrgs/OHSndBHwy/2ZAJeXHhp1OlFIox+sQKHrA/9qcmluKpZaGH5b9VO+mTl3BT/XAJW5LDSjluitRHWrdHifetzCnpB0BT1NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xn8TpVvcAAVWxtKphRRNVRCE6m5XgGlpbdXqoYR5aFM=;
 b=Z/6BU3utZn+t8mVKG4kmHMP6WuY9IABn64FPfItlL8arp8VfBKc0qSc+wvtbL9vKsTFlH2SkSz+JeHCb/P0Sav8JSxFmnZ01M0ZS9767xBO7krDafR9OO6Zm9tGc7KAdWgbba1qkBmZcDPuj0Nm1xpewRygg9yY6lvqmNqH3FHM=
Received: from BN0PR04CA0007.namprd04.prod.outlook.com (2603:10b6:408:ee::12)
 by PH7PR19MB7004.namprd19.prod.outlook.com (2603:10b6:510:204::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 17:14:39 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:408:ee:cafe::1c) by BN0PR04CA0007.outlook.office365.com
 (2603:10b6:408:ee::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 17:14:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.0
 via Frontend Transport; Tue, 4 Nov 2025 17:14:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8388540654A;
	Tue,  4 Nov 2025 17:14:36 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 39E66820257;
	Tue,  4 Nov 2025 17:14:32 +0000 (UTC)
Date: Tue, 4 Nov 2025 17:14:31 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
        vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 3/4] ASoC: SDCA: Add basic SDCA class driver
Message-ID: <aQo0d3UWKinyzTYT@opensource.cirrus.com>
References: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
 <20250925133306.502514-4-ckeepax@opensource.cirrus.com>
 <13c14d26-29ba-4d39-b96a-b12b97935d33@linux.dev>
 <aQOEREIJ8TiwZHef@opensource.cirrus.com>
 <a855b919-d21a-4564-a901-fc09e68a9087@opensource.cirrus.com>
 <382ce438-5251-4d4d-af44-863197c77b94@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <382ce438-5251-4d4d-af44-863197c77b94@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|PH7PR19MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: 6110b4a9-f67e-4f41-81a9-08de1bc5a2ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?GiYa+2M/qWNN4uCTUnU9/cbf8xun4nq6UCRjygTj4Gf81w2tZeC3XXvC5T?=
 =?iso-8859-1?Q?UhB1U5g/GUE1vSeu1ocic7fTUeyO+i+FMlcFzDGIHINF7NsYaJh9WPpzDC?=
 =?iso-8859-1?Q?02A41mi9pkfLyEDy7AvAVFhJwwYxDJKgzROeyE3Lth3O5wiHfQijyGlvHG?=
 =?iso-8859-1?Q?t9a3kfWOKAPGAHnEYuq5MltELkSN1WBtx8gfCwO9O6wsZWyo7gbmfLzNCN?=
 =?iso-8859-1?Q?I/yVwD7YQNIzqaOrO6vH9xdl/1OTV1vKvon/7dA8Siqxlk2aOHSeeU0OuV?=
 =?iso-8859-1?Q?TD4nNYDEBmN8lRMcHkvL3icFWI/+86l6VGmnHyZFKNd6/HsYaUbvC3S8Na?=
 =?iso-8859-1?Q?SWR7oBC/srAHILBMT/zJJlnzE6cHALb9RtdhwcoB0Lx/Q1T4z7VGs1GXtR?=
 =?iso-8859-1?Q?NTnAMhBt7NYbGbScnQgtnGawDDqZYgr97gwExeZbNHnbuTEypGIP3aA/+d?=
 =?iso-8859-1?Q?7ihSwL3qfyyeQWsGo4GI61hyjjhGafxPwSJZxJVgVXhXMTeJ+7ja9J1Ch+?=
 =?iso-8859-1?Q?jaIt1abyvgPMzqOUNMa/iiWqZav04eJrGefPNXRPABIMxOASuraEAqppNV?=
 =?iso-8859-1?Q?tv/d1qwROO3Gs4ltebabnTCV0H4JfoGedM0IJSZN05g6NKCdiaGzCRroAh?=
 =?iso-8859-1?Q?G9Dswa760gj4i85CjV1PEW/OeA8/HrVvQbzd1TiTsBwLeX78WjGdXE6aaB?=
 =?iso-8859-1?Q?2lURt8M1gB0/NSsfeiuqqvx6gItL4n7WPLu2INgQdLsDT6FNSRdQvYTH9V?=
 =?iso-8859-1?Q?XpwI0VFkhKzq45ab0WiF/SPUR3O9gyoIbM0Td2ZNeQtGRNkXQD1MQd9uSJ?=
 =?iso-8859-1?Q?O3Cmab5hOxt3nmOYiaj+wKy3rQQQyAV99LIR6OI+BUrZLVcLxfJD9j4Dtf?=
 =?iso-8859-1?Q?qdjRLqh3luYdCt+nU490aR4eCq9UvSGpCMgNaUdzV+47V6YUBI1b6cOp70?=
 =?iso-8859-1?Q?d8WEwOYcuUEBUHSpoAniBH4NyBl/EbuBY1rE1aoMn+TiTetMF3H1xz4x47?=
 =?iso-8859-1?Q?22J+SUNhiiHkLZWbsVPnKni0q0o1hjPPYrRBKV4K3BMfwqEer7iBWo8a8f?=
 =?iso-8859-1?Q?C+yyFXxLkhkL4LUW+NCMTfLwCnDS9by8/qEipvQIH2sPE+M/yZQWN4oKmS?=
 =?iso-8859-1?Q?kM1B2UpP6PcvwlZlhEOHPoRKaUoZN82CdGytiuBmnBeEGLFqyUkWyzTnOO?=
 =?iso-8859-1?Q?k2+cNvyhoeHeoo6GRuVGlsnAvmpbgAKfpFoFClKZqZaeurPS/29fMNpXcu?=
 =?iso-8859-1?Q?ogm9IaP38zL+x6uxPWLcSAT2VbJbkOFN/ZhLe0SjhWLLDvGNqz7ODhoyL1?=
 =?iso-8859-1?Q?vQKXC+RuNYrricUY9GtH1IUdhXhzJ+WKDDpBvOvMtPv0yQjBxfkaKffBxp?=
 =?iso-8859-1?Q?4TbUIw3+S72W97ESa+71cADOLbiZcilTmJLrBLt1i89DknLLSJQ4O4oDau?=
 =?iso-8859-1?Q?9FpmEul/4SO70Ip5rcBxVyPqAhJcMx5ryNVPJaV2/mJNl4pmCTbHiEj1D7?=
 =?iso-8859-1?Q?ItBz0V+ml15CIjIxHJ00geAhhezBOPcAVMbfRAUBEH3lc2uht4fJManWoC?=
 =?iso-8859-1?Q?GOsW0CD34OhGIY2inX7AcQcoJooD8JQ2Xz+/MuJf+Wxh3pMQVeZV3IymoF?=
 =?iso-8859-1?Q?Md6u3QZj/L49Q=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 17:14:38.4744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6110b4a9-f67e-4f41-81a9-08de1bc5a2ca
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7004
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDE0NCBTYWx0ZWRfXwSxuo88DUkFC
 MJl4iUl8HmiNRxEBI51YstHzD1rSRYNpPEDAylrWRZZpw990rwWz8vbMUE8C16F5+bLhD6L2tXi
 H9LQNxtmgCwcvsS5tMVnE1N38h/CWYT2pzaIXAkfKDIJ1UBUTsNlkkmlIRhxMZf2smt0x5rUTus
 jlnWUJS4kuXV4jFyyJ9+WQZlLm8l3gsVriZJ8XkQAb4Wbw5uWxkYxY9QdAzsfdub8CF+Hbxyy4c
 3IjjuR95UW4bbcNsDrmXeYBepoiobJdmIrFOQ3egBKeE8iEp+qlUWF3BnQvHsV7+2PtKf8rKMzD
 //EIcO+DFRSNksGLLwoRRcCjRIouH5ldbfIQURKuBf0PRDrNZaA9Y27b9LeiS2Jr5QTlYDHSPdF
 fDpu2uFb+8zNmKxbthKvQRCWsyNJlw==
X-Proofpoint-ORIG-GUID: JOYKZTVgn8XAT51S8GkjkHqDOCSQHsni
X-Proofpoint-GUID: JOYKZTVgn8XAT51S8GkjkHqDOCSQHsni
X-Authority-Analysis: v=2.4 cv=FpcIPmrq c=1 sm=1 tr=0 ts=690a3483 cx=c_pps
 a=VFd5apzHAUrRjeJ3DCr5RQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=IB82lM-6ztVMLi3upPkA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 04, 2025 at 05:13:39PM +0100, Pierre-Louis Bossart wrote:
> On 10/30/25 16:36, Richard Fitzgerald wrote:
> > On 30/10/2025 3:29 pm, Charles Keepax wrote:
> >> On Mon, Oct 27, 2025 at 04:02:54PM +0100, Pierre-Louis Bossart wrote:
> > 
> > SNIP
> > 
> >>>> +    pm_runtime_set_autosuspend_delay(dev, 250);
> >>>> +    pm_runtime_use_autosuspend(dev);
> >>>> +    pm_runtime_set_active(dev);
> >>>> +    pm_runtime_get_noresume(dev);
> >>>
> >>> This seems odd, I don't recall that we do something similar in existing codec drivers.
> >>> It'd be worth explaining the whole pm_runtime flow.
> >>
> >> I suspect that means those codec drivers are broken :-) at least
> >> if they actively use pm_runtime. The first two enable
> >> autosuspend, that is suspending the device after a short period
> >> of inactivity. set_active tells the PM runtime the device is
> >> already powered up, as it is. Finally, get_noresume takes a
> >> reference, this will stop it powering down immediately once the
> >> pm_runtime is enabled, it will waiting until we put the reference
> >> we are holding.
> >>
> > Other drivers definitely do that.
> > For example:
> > https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/codecs/rt722-sdca.c#n1544
> > 
> > (the other rt drivers are similar)
> 
> This rt722-sdca driver seems wrong, IIRC we aligned all
> drivers to do most of the inits in the driver probe, and then
> the only thing left to do when the device attaches is the
> set_active/get_noresume/put_autosuspend.
> 
> See the rt711 and rt1308 for reference, they have comments to
> explain why we used this code pattern.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/codecs/rt1308-sdw.c#n709

That is some scary stuff there, that is basically working around
the fact that with those drivers the soundcard is created before
the hardware is actually ready. But its one aspect of that and
there are likely many knock on effects/races hiding in there. At
some point we should probably revisit the whole enumeration
thing in soundwire it does cause a lot of scary code.

That said... the class driver doesn't have the same problem
however, because of the two layer nature of the auxiliary driver
stuff. The soundwire driver binds to the device and completes
probe, but it is the auxiliary drivers that are used in the
soundcard and those are only probed once the device itself has
enumerated in class_boot_work(). This means the sound card is
only created after the device has enumerated, so the same problem
isn't present and we can have a more normal PM runtime startup.

Thanks,
Charles
