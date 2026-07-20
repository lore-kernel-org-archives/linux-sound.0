Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A54F42BEB3;
	Mon, 20 Jul 2026 14:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558268; cv=fail; b=OV5+Gnx/T/hh4+Bk1gvmnhZ2zWmEn0bBpLZbcYaDFCqTewW+64t0S/bWkJ6qZUL8+Qv5qEGgAKNIj1xLW7rJ+CMPKOSvqnNd0kX7oH8wMGL4SDXFe/w6YxwuB2Fu7/mNNSzrNo/CmDHcmhoJSop6NPITBbi2sXYwc2wk76Ealeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558268; c=relaxed/simple;
	bh=4d7gQk+TxS18HgOiT8Ij0CHGSgHwqQ2u9yah1+eN4Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCHg9zTxNi/Y1mEieBUuCAxixSYa+6r43HhxzPoS5OrYMwPW+3apjN7Y64wr5cqkbt/tMeRo5a/7/6qq9+4SgvR++fysqyqeXazKxmFtmvIADKBsKHwEj2ThhPEhZziRbswtr8wWoRubQFPJYDXtsNsHwxNIo5Ogr5H+U8XIySM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LV8dyjw6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=aok1F8qT; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LV8dyjw6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="aok1F8qT"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KBic2U2126526;
	Mon, 20 Jul 2026 09:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=i+11zwRVrOZqbAsS9w
	GjnIfQ4honu6LYaDxebQL4nWI=; b=LV8dyjw6+NN3nXQdCVYUyRAAKhvoj/U2VN
	98ozGcCb9zDb4q40klPDnsJtegalcB5L0Gc6H5q0ClHy1YYJX8j0mCU3P1UraXy/
	5SCYkFrbanMaDYk7XvKK85nKDHZgV39UBD4b35tTXpkWpPFMaepbkhvLNBpWP7xj
	x3knIgPZU0swKmSwhSgmfsKk44RUR9ZCiA4zs1bAe0pcr4nx7+jFXUnd9Np4O+NP
	gYZxwQscs0bXxEgMl82nII/0Vatr/1AoF6XcsuZYeKA4Pzj7fuSTWr7MneynhJ28
	jJTC59qHUS0up8JXPyLNMY2MpD4hKW5KU3A5DfxkUAMV6wzEzk3A==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022086.outbound.protection.outlook.com [40.107.209.86])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wfahg5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 09:37:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jy9GqrwrXE4R++SZKW0uDUfq2c9l2/LH8WTp3Be5PJZWMWxWKafu6PKCpM+DPXtFEibiptwOIf3l1wWSyJmoLlPxVvWjeVXD4oDColbVSY8qa6fNs6qH/04IFPnnZOZA8lfLO9AEunSFO5yp6FQyAuVHMK6igC0+59xn9Eb8mul46rA73ZGZwS6y6P25ZqYWL+CWbNFfqOzM/6w5ATLLcAmgE3+oSb7ZYHf1bmnWG3Tik/ZWwj2pZH1HOYlh5WXlr6dgbN4Yq8tUe236XMJ4IkwoZM4vRfuTH04D1iKO6gmnktJJ1ofoo2LBGliwmY4o62DCW5ljqM1LF10XWJzkAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+11zwRVrOZqbAsS9wGjnIfQ4honu6LYaDxebQL4nWI=;
 b=HC7Kn7CXcFkN7E6AZrytj9xFixcdpN4GRWnbCY9rqzvns+GAsgosf/O8i2hJf4Z461DZD4QbSc8Z3QL+Ptw/DBpfR72/nDbjBULn67UMegkQ0OFtPoPMyA3l8Ghhjz2JvTysmiGFjVjo7silIOCxX5tlpPsZuzwDJzozFiCjUw6zx7881nAo7V8bOeNVOeL3jTyRwiXajJUiJBrihyItLRHmDtQ3MT6graJkOXhB1NsW5XjdDytAZrtAC7oIk7vP1UuQJhV15TgjsNVNFwewP/L5PCKvWr5SfTZAiUJgiB8L+Rtqv1uRzhikH0C+cAaXmq5AEJFbCP1oH/9uAtZQ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+11zwRVrOZqbAsS9wGjnIfQ4honu6LYaDxebQL4nWI=;
 b=aok1F8qTBb3UEPc1ukF3QrR93XiwYDpb9F2LkuHiANllFNUSB/Klkw+T0+GdgqRetZGCCyow8BNwjhuGNaSU20rGrCT3QNM9BFcP92G/X1L41V3K3rv1eJchzhxflOv9mTXTZN3sezDSJ3ZMPE+U0xuL1UJb8vDmw7vJ7fx87GQ=
Received: from PH8PR07CA0032.namprd07.prod.outlook.com (2603:10b6:510:2cf::6)
 by BL1PR19MB5722.namprd19.prod.outlook.com (2603:10b6:208:391::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:37:35 +0000
Received: from SJ1PEPF000023D5.namprd21.prod.outlook.com
 (2603:10b6:510:2cf:cafe::aa) by PH8PR07CA0032.outlook.office365.com
 (2603:10b6:510:2cf::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Mon,
 20 Jul 2026 14:37:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D5.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.0
 via Frontend Transport; Mon, 20 Jul 2026 14:37:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F1004406541;
	Mon, 20 Jul 2026 14:37:31 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C7FAB820244;
	Mon, 20 Jul 2026 14:37:31 +0000 (UTC)
Date: Mon, 20 Jul 2026 15:37:30 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v3 2/4] ASoC: SDCA: Populate IRQ data earlier
Message-ID: <al4yqpvM6iwG0kjo@opensource.cirrus.com>
References: <20260716142639.2306757-1-ckeepax@opensource.cirrus.com>
 <20260716142639.2306757-3-ckeepax@opensource.cirrus.com>
 <bcd410d4-9736-427e-a921-831fffd37c5e@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcd410d4-9736-427e-a921-831fffd37c5e@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D5:EE_|BL1PR19MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c055af8-4b91-4860-0603-08dee66c6f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|36860700016|82310400026|376014|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	dMzGsnTA5a9Q40QAU+L7rBqyepBvgr2qI+A9dF6fsydlFAz70u98JjqizsnqFrAvDpnpjnC+F7X9Env4pwYvTyZqL9q0v4JfAkyyzkrQJdiuj2AyBqI1B1l8fjFyfgxmx4ZGxtez9kAljwUqnzV5XYUcmw8yKRoCRvlTewG9oM1rLuvK6FmP8sBZIB3P1p8AddXlyvA1WjNxo4FN4JugclAYevuSZqZvH0Ed8sr/1BKJJYEr5EF3CUyrGLeEhDGyHl/jE56S3oVs294QxF7usUmXLMk6vl4YIP7N1k2WxN0Xo6FEQvSCtvehvys4ExLO8wUSgLBpHKhEWHWGnfbEENnh2/JVs3vpHrLBc+EpS84Z6CiCHA6UWlxNEDj+ofDYg8UtGq6jM7LmTAQ0YLVrYDs43Iv6Ew5ZhRdzZa0fzxa+G0AyRigPaePY8re3pDUQBsNryadzR7V0YLSQ1hQmL/OGF4WjYeB3KYk50vY0FP1SseJjqdDKTVRP+UtOtxHJqsCIlj0ySwvHqfdzguQ9HqAxeOG8NlYvjsC7dd0BMTvGFfUgItMgA03pfoKVLnR29M2H+D5GPwyzYFYlMLmOhh6MFjyTRGj61B8Fmy9u5QXfPyi+8loF94hInl+dE5EWJFuT4lyGTxJ2Cr3x0IT1WdqyP4IofU0VfH/AUTSiLMRzy/AYa1jw4rfZbAPsCDwsai3IYXq/uVm5hJDMiOnXUg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(36860700016)(82310400026)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nI+XyquEya0ZmdyX7Dpo3iEX1q9hVc+oCQ29K5u7WsBMAKZHCnI7W6786Qjz1sX2Ya+nFzbjLcQnX9t4J+pkR0k3ef/T5NaemWgQkmulUwZnTJP1i83AZbQ1O0t3w3NVNd+pI1ailtfqYwQqzP0vepwY4OPRI867FrnvD82Fm1fgeu46ztL4K3fXniASqNNI7NXt4Mfus3eGcBoRp4zOf4zLLxmlq6Nc+VGXqCWXNIaQmsBUZ+UHiCeNugGmoqsja8P/+Q8bzVoRVTssc/ZI4xmONUvobPOKavSv8B5FdA0qM7g+iEovPKFSxrUGqDIXidAwIxpXgv6FZ+x5RV0bgHAfHe/r0MXdvd4Eriz8hUP8uysR7lMpAehqgXfp48NB1N3BBZxolYFZcYS8/JZGexhvfvuPynWFIPsDvdvBJfMDAQwoLFPqAhhoDdA41KyF
X-Exchange-RoutingPolicyChecked:
	WGCQ2F7y5WOBoFRpyGqssrKbdwgaJiGtchm0aKc8WqOPgtjo6iJgodY0xMQ1gzAqTt4fYMnb3PMzf2G4lnBt7ZO1znos1nqq+k7D746+2HcPOEZk4QTt0PqAra6XaFeYyFK44n26zgKfnkABm7a05ZLk+b8DY2KMJie/DnhXc6JE4w7LWDpIY2UohLhIfLCzcdkQse2Vd8s3ZvV4mIA0eutOfigxFiU+ihsaUKlFWZvwnSu0m49vJuR/qIQK3I0zfDquF2ly6/IqL3Mo1HccXQWXUb2/CljFP/FS8+86xb6sr6FezJEY/2YoBKE/MtUB+EG7+7Ghlk7k0nZAaW8kVA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:37:33.3183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c055af8-4b91-4860-0603-08dee66c6f9b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB5722
X-Proofpoint-ORIG-GUID: D79YGCew_FQDuWzVoOg-4kuy-w0cbZ71
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2MiBTYWx0ZWRfX6fSlVPkUGHwR
 1IsRB4cDZsdulDK/OrE4+TFI30n0wUuSWKJvU6TJpVOKA1I0S+qRwH2zIWhh+2A/nxOCt/tiA5B
 7Yszj1ZOWwrM+PXHB4/woMRHgtdtYn8=
X-Proofpoint-GUID: D79YGCew_FQDuWzVoOg-4kuy-w0cbZ71
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a5e32b4 cx=c_pps
 a=P2PW7aKoITpMSqf9AZp3uw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=eiSR6gKPmBV-jFrqV0IA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2MiBTYWx0ZWRfX30XH1rCTt3N2
 cMiwby0Rk36K+bnyzD+sXXiF9Mqjq9zR1HU2PCX1Qgtn9NWU8/99n5tRTezSgS2bhXwERk3zQem
 b/86NAzUlqrFTF5ksGP3PxGTIVVfiDtqRhOJ3BAALVsrWMVMUkrtgWoJdKUc93JAvuEr3Ba13vl
 oXH4MR9vrEmO3VPwNI7D4DZsezdQ6QVN9sWMFoeXxnch6l8HFtg9FlluZPL/WWKDFjo0aVtVFbR
 ktt5sZtxcRCc5Ghef0LWPM9oSQ7Ku4t+j4MvxK6APstF+F3LSXAXi0Vdc8XzIQ6suQ9ykt7sih6
 y2CuHXKIbegTzqmH+kTHc/anuT6yCQai+Yn4nRiwDbXuArfXoFO2DPu8usx0pPVKUClVgWw7R4a
 5mltA52EmiCwVZsxNbL6ogXF0Cd840wx5b4yA7gAuvYbuatMCGBPys/xLKHPDBGoaT4I88g10FZ
 3VpfilkOa+ZZ2mO/8Dw==
X-Proofpoint-Spam-Reason: safe

On Fri, Jul 17, 2026 at 10:42:46PM +0200, Pierre-Louis Bossart wrote:
> On 7/16/26 16:26, Charles Keepax wrote:
> > Currently, the IRQ data (attached Entity/Control/etc) is populated
> > as the IRQ is requested. However, this can cause issues as
> > occasionally the setup process wants to access specifics of
> > an IRQ before the IRQ is actually enabled. To facilitate this
> > cache all the IRQ data during sdca_irq_populate_early() and make
> > sdca_irq_populate() simply request the outstanding IRQs. This
> > also has the advantage that sdca_irq_populate() can now just
> > iterate through the IRQ array which is much smaller/faster than
> > going through every Entity in the Function for Controls.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> 
> I may be splitting hair but shouldn't this patch be moved
> earlier?patch1/3-4 seem to be completely tied with the introduction and
> use of the fixup_controls() callback, I am not sure I see the link with
> the IRQ stuff. Or conversely move this last if this makes more sense.

It can be moved to the start of the series, probably not worth a
spin on its own but if we end up with changes from Mark's
comments I will do so.

This is slightly related though as sdca_jack_set_jack is called
before all the controls are registered and we populate the jack
masks in there, so moving the IRQs to later means we need that
information ready at that time which this accomplishes. Although
it does also just generally make things a bit neater.

> Also while I am at it, I wouldn't hurt to have an explanation of the
> races conditions earlier, it's only in patch3 that the race condition is
> described in details.

Yeah I should have probably included that in the cover letter
more. Likewise, I will update that if we end up with another
spin. If either you or Mark feel strongly enough on these points
to warrant another spin just for them just let me know.

Thanks,
Charles
