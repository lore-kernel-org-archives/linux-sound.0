Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1643F54D9;
	Thu, 16 Jul 2026 09:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194386; cv=fail; b=gj4glTEBL/Vq9d+wRIPyejrHNYINNFCmRWq7/1AcwTUoOH2I0cK3fIqRWoRDWh/o4D8T/sLQCfQSM8hjaCA+/xQu7INigVgWnl4tKA2Z7DkyMrF39IBWR9Kevq/2QcxZBPMjpSfuO7fLj+YjljPKlAj2y02TK7+0MC70Gi8sWrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194386; c=relaxed/simple;
	bh=l/wXwQ5MANMpr7lOrcBZesOzjw4TulOvXg5Rkx1xT+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kL99YaG9GKxeY2FZMBSH9rEEQ3C2ol4oOu5+85O0IPatRYrEqVCAteuYzrA7ZUOxp7lq6ExNFX0Ucs3bXxKqjZvEpPr4DQci3aLGhWkoFN1FVStltUaT3wnuB6Qq0ASMlWYzoVA1EKKAaEShb4xYaLUT5s6LJVBsIp/mPioOrHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aWRir45s; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=psH1YGOt; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aWRir45s";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="psH1YGOt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G4iPZp2661140;
	Thu, 16 Jul 2026 04:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ebFb7mGKMDPF2SUboF
	7IyleWhBCG/7qe5nsEUTtrDoc=; b=aWRir45sMGqUyryyOpZ8c9zpWyliyQAnQ1
	rwMmXWXBhwe8E5BUQ1+B/tq5ask73at0i5dO1WD15Uvm/7vlUx+wL3ZQxY/B8sU+
	lxVEplueGD7EFORJaF9BEyFQ/gzh9hOEcsug+8ApvN9fb8RF2/66YLmD51owHBjG
	Pkl2GUNh3FPyJ/UaajSLI8SGf2T7Gf3PxvnXorYLq4LeTQfhW4tLqmVRgdipx5Dd
	LeSIHobk7/oOkzswsooFJbzsLM+no3kfu9ripJT5IApotDw78UXgjihtEgzcdd8y
	+oBI/cM2AUpt96oX5i4x/MhAwAM6FmPIhCkUg9KmKBoLEZJsgYbQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021082.outbound.protection.outlook.com [40.93.194.82])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vxxc5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 04:32:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFlQoJMgrjWkbtPe0fURRzIzHF2qJEi/+Vu1IpwOJBj9f4KFMzFdbg90l7yzqH5F5my/phGEEg1rBXWEjerkzTL2OMkNqMwOXCL8DdGL+3rQIKgVfBEnXpOiI2eTInKYXV+sH+GfeSTy2IwG/0Qm9wsTCTR3437+XNFc8jn6fMuSfkncTXI0MXPbefOTdCtdFpGELIQXQ48a4XaYngijHwaXNmoIZnSlEdKrHGQ2HoiGu3/boStPoxxkDQvA/GSMAucv6pLucoPNKDEkj8EBVJsoPQz39dITVgC6AIrZODRJrCyM8qfdyMU4lwIfNLjtqH7t/SdSsJtpp5XEvg4kPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebFb7mGKMDPF2SUboF7IyleWhBCG/7qe5nsEUTtrDoc=;
 b=JhTxBO6936JE7ftdfpoEpLduGtu7SxskbpmsocxPZNF7G0jaXADP8teVWBai5soh1Z9HocabwliTQ6DRoAtnCsgDw9toxcTKta3EPTaljxlH+5mBPRXtRwQQP3M8IqO6O2uQszDsIjhT0clvy6874Q0jJXCBZon76lQHuJp1pU/rSv2PIyW72fFe3ekPXKyok8IxyBEtYnlh/xAP9m9H4T8qtMBL8lxDd7X+qvN7jdCoyBSRveKVHyvFuju8NUA1kjB15yXfW40ywiRBmh/phIl50bqzS6l8FhZXborZXLA5dhm2rk2ueUP31vy/KpMdmJF9GYB951pEUF0ngvzEwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebFb7mGKMDPF2SUboF7IyleWhBCG/7qe5nsEUTtrDoc=;
 b=psH1YGOt6vvvdT0iC1nQQVEGWAMH3obv/9Ivg/XWqExu69IAzE3Mqq4aNQpaiUdt607xrFfJ/GHyCA/+/Z/Ds/av9Dw6eiGJF6G9WVZL3k0rUxzXRYpauz902nOVyvs8wfFmot8hrkJbSZNPKZ6QRq5EhmUG+A600zGHF3SdzDs=
Received: from BY3PR10CA0028.namprd10.prod.outlook.com (2603:10b6:a03:255::33)
 by SJ0PR19MB5446.namprd19.prod.outlook.com (2603:10b6:a03:3da::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Thu, 16 Jul
 2026 09:32:40 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:255:cafe::a5) by BY3PR10CA0028.outlook.office365.com
 (2603:10b6:a03:255::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 09:32:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Thu, 16 Jul 2026 09:32:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 45512406541;
	Thu, 16 Jul 2026 09:32:37 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2EC99820244;
	Thu, 16 Jul 2026 09:32:37 +0000 (UTC)
Date: Thu, 16 Jul 2026 10:32:36 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 3/3] ASoC: SDCA: Switch to fixup_controls callback for
 IRQ registration
Message-ID: <alilNHZXzlqGmARL@opensource.cirrus.com>
References: <20260715162918.1898396-1-ckeepax@opensource.cirrus.com>
 <20260715162918.1898396-4-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715162918.1898396-4-ckeepax@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|SJ0PR19MB5446:EE_
X-MS-Office365-Filtering-Correlation-Id: 7623959d-9fe1-492d-b3e4-08dee31d2dc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|61400799027|10067099003|18002099003|22082099003|16102099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	0RP+E6gA1gyfKOwzLklKcCj+QxdbrLok3d+DRoUSfwi34G7QJQYFSNWePggw8aAckIkCHLIJ3i+gLrMM76kE2G3ldVfUUnpetj0dl9lXKMdqGeFzSODx+j5g2mtWghqECX+wwTordWNnv+fQg9It3BbwSh+YFrlVCvfyvLn5II8lMVRa+PSeNSWEDO3DN8ChZmNcFX8ayqGp8EC8IGf/lgkBycs/7T6jtuS44AVNXSf4czQEREP5036sx9qouE2L/gZGlVjl1z2wkViNchVeHONHQirzKiPZW5/u75nGVraJRVNnUFCN57szEhTMNXOqPxJHmKdaPA262Qfvdz2DhUPJCzFgxoYT261RqWbUudUvVrPD6SQkYYxdIaO5jXGMmdkq40AOvZ2ZTv24NPj3Vd2BtOPXZXlqKQtK2rK9dvaj8IOnOjIcDR5hrFMcATov7cgzPwXTfOznV2guBr9BhjIJX2CElYSirLQO88q+4t8bEGSPquNUnHjwe0d2NDPdFJHZjliE7MtUZgPy1KbaRPGoglpsMEgb/W2Ire8xeW6XLewhSH6HjSq//exx9EIeJ/747Y/Hp8FtCPuZUx68bQ+REv+1FDlXw3Z+MUHwuf6NykNzJfQ2MDQ1vx0hAr2x/6U0PYl8+UgUrPWVx3qd5pKxUik7lOvhADfDuMPWER8ZX57HFFqSQrWLl9438i6i8bPMD8O0I3mXoeeze1wxSw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(61400799027)(10067099003)(18002099003)(22082099003)(16102099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6OcG6KC/yUk0PZI/hclUDj6xUEUsJ2TDHseNLxegbb7QVuk6TbNN4+dIYbnVJk/ilw9ciW15js4YazBp8VJOG1kEGcY7fzVw9HeNMemjlCGNbgRk8FflSvStuTuqP1v7gczr/od04VjCZyki6llNMD+7t0N6ypa/jaQ/cP5cOWwXe9ECnEVUSzS/xOfv3LbPmvXHehFGPNMXONuexufC4W26e8TOE2cktTmgpW6SueK6ty3/l0jqDOv2fp2WCB0N21iVOnum7M27JUyqDI3wnDzKs4tII+YAeRQYTO9xBrhiKFU+pz0+Tk6JvRBjrNaiiaW7b2d5vsR/bK8U3ZZb7I39hRr415jIf8ZbYZIoChTf6qAE1Dd6c/0ZoJ+pQi1S48QFl4cQWffTQq0OVAaUUUkFUkdHoP6a6l6kIIhWyV4lyQLi8O7kvxEWqh1HRVtX
X-Exchange-RoutingPolicyChecked:
	OukhnwVPozn3SIgZdlsrToo27Wr2nniuLoox1Ztedjj2KRkqwBC4anDYn7kVbTTtwe2DOD1vhIMNR+pncQK8Up8az0JyZXg3FtOl16R/zbaTGeChQ95riOWelsszNCYN4L6v+sMJOtZD+gEWSRMzhWmiVhHLGzqJuM7D2fas2nTc2ktkFp+bCU+RRMsfmhOb3MZW6EN6Fmtg01b3aZc+1XSzVhsGH+ye2ZFchjOmOtvrEjDwTIlaWcukHVLMqPx/dA557UGwBVS55GGn3B12/J9iZheALltIh/o6TmdXN2PqIWjTZspdjyPA1Ge2pHAyKq/o5+rCnkakqo31afexRg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 09:32:39.1453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7623959d-9fe1-492d-b3e4-08dee31d2dc5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5446
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a58a53e cx=c_pps
 a=A+KY2CRJZE6laZNMCPYSqg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=kBrmhM2jXSEFeQCXvDoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: xUz6-c798Z6TbV25Crv_vzbM4gKEq4mM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5OCBTYWx0ZWRfX9N9lve0E3lCJ
 AscZbOIaI/cTGxgoNxOzjBoTPySIrwwiLmO8nOdkV7uOmrqTiXdiy61Oziswy4j1+blbrWLAtlA
 ooc/QgIN9npbF87DCpOg6Xq5z4cF4Uo=
X-Proofpoint-GUID: xUz6-c798Z6TbV25Crv_vzbM4gKEq4mM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5OCBTYWx0ZWRfX7b40Ycg0tZ8O
 asNnxW72mr04YKtTPRhFxff1JYPqoOcHWcm2GkDxZijFzVRayNe/isfFLUrLnWGVvHHknRZblZ3
 8XIbJIYKlPnPPuaQjlk6VOz6+8UL4TVxHMt/GWUQJkoCW3/3wxd1ja1WbOiPjYNUZBuqyCLrAl+
 RH6i3/jkVcNZJC9VDdxauUy6yc4t1mMrWDoqix5cl6SskeAFdNku/5Me5CGlA06acj2KHUT0HNd
 8fosNslmEGNczPBNYEiyzhWT+ejGfDjqPuSjnssvsKBYFIbenI/pxXFtjbizelENN++nA2S8DOv
 lLBErk4ZpWDRbTTCp/H/+8ctRfnsK+bBArBObuuGfOZbcGgkBkEz0arN9PJHvlNjeKc3qG/ku+9
 hPX79arcJ3nprMouJbsk1kkW1viYALLaG5YXfWaMjHWB6dGfJPXZgNfoopwUxz5duhdwICnpSE6
 Y1qeF6QcUlHkvMKJCNw==
X-Proofpoint-Spam-Reason: safe

On Wed, Jul 15, 2026 at 05:29:18PM +0100, Charles Keepax wrote:
> Currently there are some race conditions around the boot of SDCA
> jack detection. The core creates DAPM widgets/routes quite a
> long time before it creates the associated ALSA control, and
> the jack detection IRQ is currently registered in component
> probe. At the time of component probe, the DAPM widgets exist,
> shortly after this the DAPM routes are added. At the time the DAPM
> routes are added the register value for the control is checked
> and the appropriate path is connected. The existing handling
> in the SDCA jack IRQ handles the case the control doesn't exist
> and updates the registers directly, which works until the DAPM
> routes are added.  After the routes are added the DAPM graph has
> already set connected on a particular DAPM path, which will not
> be updated until an IRQ is received when the control is present.
> Thus those updated are usually not reflected in the resulting
> DAPM graph which can lead to the audio path being erroneously
> powered on/off.
> 
> Switch to the new fixup_controls callback to register the
> IRQs, this is guaranteed to run after all the controls have
> been created. Which means we can avoid the aforementioned race
> condition and as a bonus no longer need to concern ourselves
> with a case where the IRQ handler runs and the ALSA control
> is unavailable.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Changes since v1:
>  - Remove the bus remove callback since all the IRQs are freed in
>    component remove and the memory is devm managed.

Sigh... very sorry I shouldn't have removed that. It is needed to
free the FDL IRQ if component remove never ran. Will do a little
more thinking and send a v3.

Thanks,
Charles
