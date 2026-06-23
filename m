Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B6926F2BF;
	Tue, 23 Jun 2026 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217227; cv=fail; b=J6IVzp2yu+Ks9tM16tDSxXw5TCJzUJ7my+elObO0VEwCWf/rm245+Ht3ET1EfKYC9KcNPi2c2v5vZvX2gBDyLC2TbCsSohW/LZZln9NlunzP0W+y/rSNCwIOnK2846m1Ub/S8o2ZPKHcj6PCThykjJE93F/9nycGg4NockV17/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217227; c=relaxed/simple;
	bh=TyEcGp1h59u4H9upCzKGShNFORbiyRMBhxKDpO1nqJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iA8BAJuMtK0gbbJ4X1zacx71VRPAk3uBxMyFPv0/8geE6ovcZNSgRg14GdZF4C/yedRIJRiczzXzBHVaIUHd/pTK0ldY+s2tY/wjIQ7R0sWdTnRirkZk+xnQAeWFYj4UW7sg/GVBQru3qZHVyCHueREUr9mDItUTI+MvOWqxAkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qhoGJTyJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tNHqvJaA; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qhoGJTyJ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tNHqvJaA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N4m0HS1105576;
	Tue, 23 Jun 2026 07:20:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=y/RgMvxFSSdphWGujw
	gF3M7eDJJJ1cWMR/8mXEyeeH8=; b=qhoGJTyJXBDA+qfD/e13kQJ1yK32L81byl
	3AcFac8L097Z7F3MYHrPB7JfNe2SBBzJFIdCMjPGaQrlnOX5RHSPnUUN6/RguKfY
	2nBP/Bgq6VpQCQq8AMjk2RfxArLbQgxgmq4QOKasPwUpI4p1o+IMfATwvtoiTDCD
	0CPw//JvHnfY6QC9EHhYmWgUzXNFP8Hdfs+BddY1x8NPssQ52keSft+eO4FZ4C8T
	MgCKwKqx2Icu3xrPH4wZlcRYwL83DM+Hf2+npS1UnOcavzCZ3nOFLpUTAPJmgU9z
	4Re9WW4sBKgZHzKbJ4bvN11HqWwaZNYvnG8wbWTWO5Ksr0ssZpcA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022123.outbound.protection.outlook.com [40.107.209.123])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ewq9jk9wt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 07:20:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjc2stic+W1WSmttG4tWxClRSlkq9a++45wx9FH9Hl2SEZ8Au2ICXnT6TrfV8fe/7RnII0mC83LQAzTZ7cN8lffO/cwFW+IM+FuOmGdAUy0FlVTNREg71T9wZmZxmQA9nf0XqNMUjXCtuGPf6xJhFRcw3xufZYVyoohApLqbQkydLZe08M95exXPPq3z+GRCj9H0tCPBFaKHKWU3ogtr2walJXzQ3LIrAPvPSQuU9dToJicsw5A+9WJGAwOTJ0Ri7NtW2+tS1iDhoXtpPS8iYoplhA7LNgNSmC951zoCFqrK3v7CAbG/yjKaXBfatRxNH6KTcXyWXP7Sqqh3oyaA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/RgMvxFSSdphWGujwgF3M7eDJJJ1cWMR/8mXEyeeH8=;
 b=wVANdGv77L0Q6cwOG4LR82McdbIqHmQdM5Ce1HT9mTt+MNgZTvKbtF2+Wa8wNboCMvwARMLuGNPMAcQEOHoBmrr36SrywmendnaC0b38RvU4KNBEWXHFHmoeEaTuvtwI/k8J3UjH/1aWq56gwKWSbnFWSTJjw4IJTU/XJ5xvE0In1ouDQ4jwUBmvay8VspzTaFuUdeILMdW6cOPabuO1rLWW0Hi5HMReRcyWndIgred1tr9sr5Q0fYH7eDnB/vCBMZHabOcsVUtOQ8oXGGZTXZS6TRHs7Ehujx+q4XrjdWO+1IjEeXFI3VLR1uTn+PpOS7EsEJq1VMufTK4YmuOH1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/RgMvxFSSdphWGujwgF3M7eDJJJ1cWMR/8mXEyeeH8=;
 b=tNHqvJaAS8nnOAJ0ghmtE3D9haV7p49BaqIkQ8qe5FQ7rgTgfc6rIifWfr0SXUsbtpex6l0zxEqBgAHLaL8A6iez2PQvaewjb/ju03NwpTdv7Y5WxBRMJNi4FXdfCJo00pUTjn8o6iO00+KS+AfDTRwRbvl8ztYWw8c3t4DJ+x0=
Received: from BN9PR03CA0944.namprd03.prod.outlook.com (2603:10b6:408:108::19)
 by DS0PR19MB8435.namprd19.prod.outlook.com (2603:10b6:8:193::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 12:20:06 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:408:108:cafe::6f) by BN9PR03CA0944.outlook.office365.com
 (2603:10b6:408:108::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.11 via Frontend Transport; Tue, 23
 Jun 2026 12:20:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Tue, 23 Jun 2026 12:20:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 22505406544;
	Tue, 23 Jun 2026 12:20:03 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0D3C282025A;
	Tue, 23 Jun 2026 12:20:03 +0000 (UTC)
Date: Tue, 23 Jun 2026 13:20:01 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SDCA: Validate written enum value in
 ge_put_enum_double()
Message-ID: <ajp58Vd72dnppcx3@opensource.cirrus.com>
References: <20260623110526.813217-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623110526.813217-1-sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|DS0PR19MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 98818046-6924-4f6f-eb93-08ded121c18f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|23010399003|36860700016|376014|13003099007|16102099003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	vu1eVVea+OW99TgeISI5HwHdaYlva9EpVJg6/s1rE5npTsyH+Tjn1hcMThPFnLEsVGWsz9wyWC3yi2yuwZOHmMSRAljqMR7A99osf3aj/4VlDM68GuieeEREOj32Xqhsdlk/dzsvPv86gssTQjrFF4waAPSKK3R+Q6rcnszDFRQx687L8hcR+doBUNuanvw3CQdAA4L9Yn5TpdQkQ3TeAtZ6GL1icWAjdhyRlIT0Uj0gKuNMUxwJilV1hKoNlx3rYvO1ma1cgfSQOz1YZV0tUduv39xXWkKlxcBhO5cnQIwIh873GLlU5xGOcLTxv87Bf9EpR7M33wyL0rZWFHcOmP56cb1IN2Um+c3d2AJhWtDM4XiKKFp/kfoTFTsB9IP6KlIybfPoGpYAqqTycxUwj51kYdPPk4qv1qRqzYyeCxv/At/F/MrBIQePj3lXMWW6loJy6myDl75AfYJFW/Y0bUHqGO1fDMf7Y7GIBOEQd5CXJgirpScGFHzWETLhfizlbejdk9ZbqujIghhydIdM4NwaSMuqDvqoekD4cNhgkyUOIjjPvfi9+3VaaJNxaMGQPFGZKIxBxB+pGy8Bf2v4gIEx2uhhP7kaf8cqJ7j3Ku9eASMm3O66noXiAMLHPnePF3v6hgDr+0hJOdMYMxVf9HW74M8Wv10lN5Q3Ym2/aLAzjzX5MP/PVqpSkHwQkRaUoUEXuN/PCbBINxN/ERB2nw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(23010399003)(36860700016)(376014)(13003099007)(16102099003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PNheOH3ZU/M2oc+1metJHm/5LNt6Ex0gDQhfNgN+F8C9KvBUtzOmiH6sukl1h13e5oKBhKv4iTpOyUtl3Yz0qaV77vW4m8ajZ7WRQRfVD3RdnoOA6+zvFErtgVerxMSV5NYwlmG4JUXB8ye3hLnCaA2g3m9fsC9dYHd5epMOZXgLbPsd/OF1Hhc6/i9K8OTZcbRaPofuKISG/1AzyzOgxJFs1SAHQvrXD9Tue+M0yCk/m5yESRxKG/gT2Atj9XmjY98CECTNKqxBcx5soCPZYrw9+5DbBSq3TOTmRdg9fYVcO1evhmBeiMuRVRmLhifC3A1sPiBsedW7Hi428/lbE3gbDvglPJCMoixRrbGtCpAleVhR+HTkSJ59/zr2CCoiSuPaRUiAxTDL6/p6QGGUiY6lFet83WCsrEeSi6aVqE+CvOB/18KGHp5ilxDxUHeJ
X-Exchange-RoutingPolicyChecked:
	rj02+bLgB1cTc2nDQCzx5uam8uhpti7u7BkUMcN1wsM/CxO9xUEtKtUrD4iLbQax7vQnN9jQ0gBW/QAqob7t1nuEgYzW92pfY7GQuPFSCxllHQti8LBgIy4CTpllbHTzLTPND45Q8D50az0iBQNLzW/LrHajpgCrmRW8u9gI5gn0svMQGYoMnpaDajrGbRj32w/ynqrCx7GNIkpnSJvB9yfudVqwkU2pe3tTu8V7wiw+w73SLNtdFjE6mitqz/tdSMBw3/zdyy8pELCuYBFwDLBIJy7roxdL8s5wQCnkEkYuumt04m/1aUemxkr8pZYihYoHQTNfzivGRRxvWKzOsA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 12:20:04.2697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98818046-6924-4f6f-eb93-08ded121c18f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB8435
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMCBTYWx0ZWRfXwM49gFNeDCzM
 Z/XK8XsIiammOTt53wZUd5cl7TlrNaj1/EUToPhFsJ04e2TzDzaDYeu3MHMdYm1OBSkmDEItbXC
 iYt5O3NpftVOfEH8X5dt5BgW1ooGA8XnCou8q0xpUrV2Z+tEn2h+6zauY3fPyz81kfhDLulfYQV
 t4HcGp5M0WZYc8tFY+KW2gvS5X/29KQp/QIYjktkhYe0cLaVr0qUKdMZzOwhMitBc6SIn5e7p65
 lhXt4NICe1iU4r4Si8QGA7I835e4dXWohzMGL1NjmOgYUHJqaLmQRNZdwKjKGJP2fujh64hN4MD
 KMYT16KyQN2Stvu3w1TeanJieXY/XTvcSL7Z/sNpB4HsPnsXI/A/CMfktxMsTs7JKjS9/dp+Mvs
 IaLJKxsNeAHp1C9JK1lJObRC3BOaUH2HKzno9GO/Hhst/slpsk8ZiG+rutoKDcR+gJ8B1Yx/zbK
 r/ASwxPq0y54OLFVfRw==
X-Proofpoint-ORIG-GUID: -QkvwksAZQu_hl8MKylXlpLQG92UVRwY
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a3a79fb cx=c_pps
 a=EEuUCq1UVZeKBjwkVe0TyA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=A3AeqPEmJqMbhak1AnoA:9
 a=CjuIK1q_8ugA:10 a=D5E-lV8vLpwA:10
X-Proofpoint-GUID: -QkvwksAZQu_hl8MKylXlpLQG92UVRwY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMCBTYWx0ZWRfX5mXZI0P+plOY
 pG1v8Uc609Ba7vCHxT4vOOv/1erd8atVY20DkGSQIHVP2SEU6eZOPHvJO7apAjJEYeFkAyY+KjA
 TqJETZUNUhFU6wYQ2zSxB1ZPs+IUuic=
X-Proofpoint-Spam-Reason: safe

On Tue, Jun 23, 2026 at 08:05:26PM +0900, HyeongJun An wrote:
> ge_put_enum_double() passes the user-supplied enumeration index
> item[0] to snd_soc_enum_item_to_val() without checking it against the
> number of items in the enum:
> 
> 	ret = snd_soc_enum_item_to_val(e, item[0]);
> 
> snd_soc_enum_item_to_val() indexes the heap-allocated e->values[] array
> with that index (e->values is set from a devm_kcalloc() of e->items
> entries), so a control write with an out-of-range item[0] reads past the
> end of the values buffer.  The bounds check in
> snd_soc_dapm_put_enum_double() only runs afterwards, so it does not
> prevent the read here.
> 
> Reject an out-of-range item before using it, matching the other enum put
> handlers.
> 
> This issue was pointed out by the Sashiko AI review bot while reviewing a
> related enum-validation series:
> https://lore.kernel.org/all/20260609125735.CEB651F00893@smtp.kernel.org/
> 
> Fixes: 812ff1baa764 ("ASoC: SDCA: Limit values user can write to Selected Mode")
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
