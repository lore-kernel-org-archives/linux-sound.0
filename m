Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DC5165F16;
	Tue, 17 Mar 2026 15:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762766; cv=fail; b=bTrs2V0Gcrj/d3+t79+xGm+MGn6Ay1HqqnkGt5EnF8AjS9uzYxEQwI5DrmJl+4Nyj4NHiB2MFVvyb4o9eigwnDO9g03vARdqqZnKGTbjtbysj0bkWj/gBL1vuyYhbft9o+UyZ0swPld/j5Fwz2tTIvg+TLhsiQ4c35b2v3jT7W0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762766; c=relaxed/simple;
	bh=tby2unuDC3aJBEQlsazYF8Yw82rQyQmUxmnJt6HtOmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmJBGXWe2cTikgDzewbmvif6zeoLdMGl6fBY9QP2mBS1P+T3rQOJbtrVpmognRLfQN6a7bS4MfG3EA0fb+4UgFA8IQZUqVLHFhKmqWZbzKaveppYCusa0lldU1Fga19EeCGUtR7aHrEtYPjjkSzL8R03Ii75Lz1mlYYyC9qQsKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=X0QzYo4R; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EpkOUlUr; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="X0QzYo4R";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EpkOUlUr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H4oASk2847607;
	Tue, 17 Mar 2026 10:52:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ZTpauP3He1Twes01vB
	+MmYj+jgOCusCeEN5Mq+NxdL4=; b=X0QzYo4REXr49PSdCa7lfh2iFPf+07qFaZ
	xGuQ6Uou03hFLUDOicMnDU0tzqUpf3j2gWEqovohqrdYi/vbciQURfIMBsKDToZV
	tE5OvkL4HVr7ID2nzmHzxgajTOcshieZY+k45Z/a/Eg3YMEVIsNlqXYvotKsQQwN
	a/HdukQhCJRndYZNt2gNy40tGgW08G/xXcrbmmY2+mLw5dGs3STx12iGBK5PISay
	W8dgSY4VJGWHyQQEyvnMkgrieggt6qEOCldQ9FS0kFzaZwqBgZ5HjPeJCtjgMjBz
	zI9WlrPCNH+HihLH1pG0oRFCP2BR/+uQSd1iuZ9JZsJ+J7c1JqTg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021127.outbound.protection.outlook.com [40.107.208.127])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cw52v3vj7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 10:52:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7xbNOlZAN4Ppr5y31B7aI5Eanh0GEFVWz0NlsUasl5ORnP8jh8dyH3I2+ZCPecCDN+xusTwFYgL4Ks3VRVp127+TdGehtbhsKvrynxEKXb57Vb7UKnJgWbOculbpmBGd+33RcFQyBNDWf7MnB43uBBd9CapxBX9XRfsRPXzIlO+KGBJEAfGEEHJ4xVRL5vgOwXQVsDJKXDRFTP0HedNSJZGjylGMjU3sEe8b6RvfwxzWJjK5Um/YmCuMLTBfk3RexRXlGTfbJKJkihWpaEgr4jlmZiHmC+ej5oi5NHvT4Nsi8lZvN25J0vJ6NX7ZKGMxvQFmj5KGnFdXbB01ZgZCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTpauP3He1Twes01vB+MmYj+jgOCusCeEN5Mq+NxdL4=;
 b=VFr14ffpLb0HC8RJG3Pt6ipuaMcen/7i0m1dyle2oPHVvb711V1TgL4ajPpAue+qjdV+xQSwj3hEgghLugLkkP1XMSupiyCGeVvaDAf/ntPAc01WJ2a4n1iM6EHTmEQFMByGwzquRUlcADclKVR3BZOW8B9Ct55hHVhb7UAD/W2fCRyYM1gdQEuCmsI8HaXwdYUeOmHDNMMFCG242Q6JGIYp652Lrxqm1cYImGWaVsXRd5xk9rnB62zipty/ZJGAB7DugHLdTjKbzmWWGZlsQYpoHPh9Jg79CVW9G2Knl8eyVxedqCH0CMnO1N/Z6wrwxX3XjWZ7AFT9qXN7iCZQGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTpauP3He1Twes01vB+MmYj+jgOCusCeEN5Mq+NxdL4=;
 b=EpkOUlUrTIPVBwa2clC7F46c36vF/xdMyrBt+6ctW9cECSbVT+aeXG6E1+DsiMOPtr2vtQ0EPtzP7kf2ExCEOUG7kQqJBJ4hnTpCFYZT6m0+6b6ksL0bgvJEhHHTETliP/vHcZXN8XxrkoF9CfWxwIIT+cTTWIlwCN1WrW+jkaE=
Received: from PH7P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::30)
 by IA0PPF0A4D809AB.namprd19.prod.outlook.com (2603:10b6:20f:fc04::c88) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 15:52:38 +0000
Received: from MW1PEPF0001615E.namprd21.prod.outlook.com
 (2603:10b6:510:326:cafe::ed) by PH7P220CA0013.outlook.office365.com
 (2603:10b6:510:326::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 15:52:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW1PEPF0001615E.mail.protection.outlook.com (10.167.249.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.0
 via Frontend Transport; Tue, 17 Mar 2026 15:52:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C30B040654A;
	Tue, 17 Mar 2026 15:52:34 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9DBA2820247;
	Tue, 17 Mar 2026 15:52:34 +0000 (UTC)
Date: Tue, 17 Mar 2026 15:52:33 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 00/10] ASoC: wm_adsp: Some improvements to firmware file
 search
Message-ID: <abl4wZyYTJf1C4ml@opensource.cirrus.com>
References: <20260310141817.1871794-1-rf@opensource.cirrus.com>
 <70c45f75-7ccb-476b-8646-3896181a2569@sirena.org.uk>
 <e9fc894a-4183-4d22-a9d7-6ad05167abe0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9fc894a-4183-4d22-a9d7-6ad05167abe0@sirena.org.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615E:EE_|IA0PPF0A4D809AB:EE_
X-MS-Office365-Filtering-Correlation-Id: c70ed0fd-312a-49ee-f0ce-08de843d3674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700016|56012099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	vh+CqNEWBlk1uINpV8WzMark9N3EFyi+DpT7nc1AZ0dQ6/7jWooT/7ozkguAXPVoXgf1I08WRiyz/WyqYf5+a2zZEBFA2+q1O0V/fpZhhlNBP2lrMIyslwBkg0g3/mm9xj3roKv86o9/iTHwcM9AXbm3zSXfdBBdzdIYcgfdPNA0LqZqKLWYCvPfn5ifEF21Z05BCXX9IAFAnTDxIOPlCGK2Y5DL0/XihEvLMz6D5XuIj4B7Mf208w+118D5KwjoIqQ5qiMLQHqMDB9r9Q1c1adkAduMVvZX2jztdQWwaoy5TBcCFyySCHC4QTVOlbt4LwNdpuMkT/3eMo4UJyvS2Bouf71DA9/C6FxXezkAPcWYLwIU7T72QOOo1ByJlv8jB/1nW0+9/qf4sUfuyLBFhzronuk3Ec5nH1ExHjxnPZUrHe+P7nX8fD1FJg41xlvS3QQtoiHdmsJPoSwORoYW1C5lDsuz4OrfSk4jWIhlSP6yF87LxzOdlnVQMnS6ne+loD6AVQaYRFbPCmmRFmYIMZy1Y8ae0VEuXG9kMtJadpjimZb+Glj1FS3WTMH6MQ4r8x0RBjcc1IlB+BqIi/Uh+AmBzmKoZ5mtOK23doxbnmAWLq1qDBwRNhhC91gMBAgHPpST83gU19jtdKiUUZ9LCLkDpHfvt2+Jy/HUFxecaBW0oYYsQ18kpgq7JhO5MLdxgeVffmxB3L9PZXh1B/qdYJMEHW6E7K8zLfE0T54yBq4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F2Hz1hi1prj4dfwVERgesAHRJL5RhtJCy+W/M1viWaU+RsyBlhO5mrB4gg5YNjdIQAIxgCLnU2v+c0MocCCHsUHW637sHdbRnlXyTVU+h2uoCutXJLc7/bQ8BIaP8VvIARHrYl45TepWTk/TKFV8fRakZpamqegoN0QUBi9+VNxqt+x7UP5MLN3iZZn31CBOIPiTJJODzf3ECtm+LpgSczspb1lpm7g9GwLb8TqoXhFAbqzM4PKkuySA3e8WVQl2ia/wj5XrA/H+hy2SyU1bYIG4wy1/HymQqSKilW3s0/GdgIhfyExrkHRjvyBEIBI1q2ntxLbg+d+QbN1P+zADuqzMkaBFSAhd8ePvpaUvQh856a27M9yCV57YMs8Ge97YH6RKGvScUJd9uAA9N/8Crbbs+wi+EjpAMOckhNIaXszm5ZRf54oAYtfhcFkmV8v7
X-Exchange-RoutingPolicyChecked:
	tGXZQzVVCzuS1t/MI6Cn3suxEx3Nw2W020N92z2DmGY+SPWXV+y1VvjIvJCDLCeVammUiwQHES1ZIFpJl3afxuiuPNHVC8J+Qe2/0jey+XS32xBM1Sz6aUHIEClZzxJXc+9l2BW0cQ/xmqkF5+GAt6LqieKd4UzS4uYLbaGRXqhUyPM90ymALusNtI2thxk7UaT3DJmjhNR4sOh/0v/LoeEVUyFHWWQfKtxTCjA655K5LAnOoAHmzFXjBcKffoethf33CodktFkeG0ivnJzmuiGLo/ktKjgUgQDNaCdLqz0gBPzbWMhveRD3jnsXWeRTSTFpf18C7w6+Evg4sYkZtw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 15:52:37.1415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c70ed0fd-312a-49ee-f0ce-08de843d3674
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW1PEPF0001615E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF0A4D809AB
X-Proofpoint-GUID: pm0qDN_2t_HCSiLUB4vc015KdtDw9BYv
X-Authority-Analysis: v=2.4 cv=MpZfKmae c=1 sm=1 tr=0 ts=69b978ca cx=c_pps
 a=TSVcXIYLINIUQqCwOqgFvg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=zkt0fCY---C-ACS3k5YA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: pm0qDN_2t_HCSiLUB4vc015KdtDw9BYv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE0MCBTYWx0ZWRfX0CiuIrym5A/U
 s2updZoaKqKAjOizl+U7suh5BlqH2YQB7LcR9dP826FU1328AlztkH0cojN8pKkigNDrtZw0PS4
 BxrS6nXkFWZOBCRIj9U1L6zgBddAyQiE199YRw5WeZmyrOQQOqbLhrmY2iVM03lusAYs6c5p+VO
 w8KiLBBn4lzm+2WGqWlcKJPy3zMrjw2ZJihSXu/dFFqnvVLKJKDQD7OZ72uKu7kHvF2Z3woYQND
 Iz+l6AoBREhc8E22yY8BFvlacZxizdeo2gdCN2ExUhM3EmInc2/dcW+ZHJSDbwod4u9F2lZpImd
 qVtI8ib64FmloXqWzkHbFIXWUrsjjv3O7db4tCJ8A9xgOONh4e7TLuYfqiPeCTnLLBChiosBx0y
 B1qRFdukVghBtT46JjYEWa+I2L9ndIFM2gCR1KTQ9Qk18BmQ1hI2J+MJCSTwwiN+3Yxo5FyihFs
 p/m1+AJtiXYt6QOF7gA==
X-Proofpoint-Spam-Reason: safe

On Tue, Mar 17, 2026 at 03:37:53PM +0000, Mark Brown wrote:
> On Fri, Mar 13, 2026 at 02:58:13PM +0000, Mark Brown wrote:
> > On Tue, Mar 10, 2026 at 02:18:07PM +0000, Richard Fitzgerald wrote:
> 
> > > This series makes some improvements to the code that searches for firmware
> > > files.
> 
> > > Patch 1 is a trivial patch to remove an unused function argument, before
> > >    adding any new code that uses this API.
> 
> > > Patches 2..4 add KUnit testing to prove that the subsequent changes don't
> > >    break anything.
> 
> > > The remaining patches remove duplicated code and clean up some of the
> > > implementation.
> 
> > Actually I'm seeing failures with this running on arm64, they were
> > missed by my testing due to issues with KUnit in -rc1, looking at this
> > clearly a lot of the problems are knock on results of an initial failure:
> 
> Any updates on getting this fixed?

Apologies Richard is on holiday this week. I will see if I can
find a moment to have a quick look.

Thanks,
Charles
