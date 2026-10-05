Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E544A262D
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 14:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791211182; cv=fail; b=Ry4faY+Pv4TXZxe2ZUZibSjZH5uZfU48ZHXvX5pDZo7XEWYz5ivum5jzYNNRQfp/0FTYNTzDdekA0F4DaOxPktI50ti5Rj+hubWXZ0cX/sMoJNDgch7ZiraGdnxb1BI/rNVq/j/QjR6op1e1+1hrgq825mBaO6ff25YkDHMitGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791211182; c=relaxed/simple;
	bh=l7/7yDAfl3JhfUfkagidFMvRV98fAWln9U8dAcObIwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/2pRPD1Ft/hKfcZSzqyelDtZrrbfCrx96UHEUBDwcO0FJ/iL1fnhkvYzly0ID7d6lO3j+LfVIsm2M322N/oG777fqJ2X415bLHIfjtagtlhbA6CjpI/uRSgC9vf8o8VTHKkSOar1NzuI2nZZ32uDRwJx5HNwEWE0KvV1CZAzas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jrGMgdB+; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ieY65JWw; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jrGMgdB+";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ieY65JWw"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695DUo4i1788942;
	Mon, 5 Oct 2026 09:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Qc/UPcdlaYGGq12PTz
	Pm6c1Or/BvHQa6i6f0SM4Jhvg=; b=jrGMgdB+r3BtKwDSqlLMEqEymPsnbnLI6p
	Udse+4iou9OFhYdOu/m2BF1wBdF3sDQFzgx5mpxs8Sud1ZbrogD2gy0K7K+kvxdP
	bUqr6Wd8Mg49dyh692utl4RfLe714H21/RhuPWBWEk60eQcSM2IdfNG3PM12Amrc
	6qUkjFmLlb7SI+D+3Wjo/+CyDu6eYA4F+bUDLdPY/LfNkJHMuFJ0UIr16FlHiltJ
	RiVwtZZjMBn2LSC58N+T/9EK/hri9lg9vtWL4m3fN7P4Lqhiq8ZUqmZu+cMeGodG
	ligxAH6f8WhufhQJKmp8kt4Z86pvzSD7sObz5mXT9ujFJYG+21fA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020091.outbound.protection.outlook.com [52.101.85.91])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h2x4ha1ad-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 09:38:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5DTDmPoI1M7WJ/MQjZoPzBIdZ+JbMsi6/tfJp1TJA6mHySjPWh0XAaI2ScCwVVsevoXCM678qZ+fXD0xqvS9aczRAw31l0lb8u51qNG1+Fxch1Uir1GoGs2wpbaes7jC9D5qptKfAma5kQ0+FSIrfY67/9iNqnSMJ2HWc9IvPMsenjN9C2jV80QC+4mSm3MXITbpGrNulkjlT/Qq8H2s7H2VuDOs/5qLjiXqasLgPnEQ7eYo4LnVTPCwpRSTSnYszV1TPQXUlO/l8OnEdYqUkRRbSCUi12UMIQPjDL8mH36tOEBIt8MfBOHjJjXq/RP5CkmQ47HrbxKLD/SXmvvtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qc/UPcdlaYGGq12PTzPm6c1Or/BvHQa6i6f0SM4Jhvg=;
 b=L/LtxS2XQKZ83lNfqh7nwh3PEkRVoZ737bb8PerjUXMw5M/tbEGdvKKae0hcHjqr6brVKIpTLeawiBoZqSSnJu4iiNZ0EAw9ctWlfAjOZ/lceGAKMIE4ncSMJzbQXY3b+SIe39rdkxl3XUTmEQICRKJyB8SAtbtjP2n3RtwWUBXXH+TY9RYwXs4DYA6zJJVeJbY1VokLOTQTGBj+RSJ+Ds/8+jBiD47wtvmr+lRaGpBwlf31nbA3du4ZL3G5NPDIhElubgwTg74VsMWmmhsKFR2r5NMB3NwNbPzRjYkI4Eu+RsTOJaLoApiekM5ZiMlEcopegXgKxkldBCy2Nfe0Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=accosted.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qc/UPcdlaYGGq12PTzPm6c1Or/BvHQa6i6f0SM4Jhvg=;
 b=ieY65JWw4mPJ1ryBTZILItvn9EGmR80DiNK+8Yv1giZ1/zenSOxz85Gi5/BnWkdnEhC7w0GBHDlKxmG7odKu1Xml8imRRWPaMaMJknW7coHgx45fJ+Hk0l1qwgbBJ44jtr4s5eXRnYT53+mOKALpzGlvThHiyyvGZv/x7R5Xl/g=
Received: from DS7PR03CA0081.namprd03.prod.outlook.com (2603:10b6:5:3bb::26)
 by PH7PR19MB5872.namprd19.prod.outlook.com (2603:10b6:510:1d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 5 Oct
 2026 14:38:49 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::46) by DS7PR03CA0081.outlook.office365.com
 (2603:10b6:5:3bb::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 14:38:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 5 Oct 2026 14:38:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CE543406544;
	Mon,  5 Oct 2026 14:38:47 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B936B82024C;
	Mon,  5 Oct 2026 14:38:47 +0000 (UTC)
Date: Mon, 5 Oct 2026 15:38:46 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Arun Raghavan <arun@accosted.net>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>
Subject: Re: Linux-audio BoF at Linux Plumbers Conference?
Message-ID: <asO2dl/9d3wjnaou@opensource.cirrus.com>
References: <871pbsnce8.wl-tiwai@suse.de>
 <5f459099-4364-46f9-a3b4-1c629aa91209@perex.cz>
 <87se48lv6z.wl-tiwai@suse.de>
 <8733uoys02.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8733uoys02.wl-tiwai@suse.de>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|PH7PR19MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cadf40c-9bac-46d1-fb55-08df22ee5e60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|82310400026|23010399003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	TWrfo76fqcfzmQMJ5aIb6hnLvu/LQD0AnRnz/+w8gQTk5rEQwTSXUleTbQ5hqXzRJMWOdjCZIEuKKv467gUanwj3ednJSMrIRjC+DGutpBOkjpY3FFv3Na2OMYA0LJqt3oHdTAr9omc/vAxmkKDlaCQwCM/O+sGKoLDK5f7M7Zws7vv1He8i2Iv0oRlm1gVcmGoDD11wfWP1eMRygkWv6Blyq1Q4GLlEz6/fElufdh21z04jUs273AsXgiD7ueP9ySeeNOL4qlGk62bXoyJXsUmwYPvfbAYb/3K9O8qFgp337mcuHuO9AYvQFkzNDUK+LhxLCFhvMxpGdjctSNn86aN2cGMF2u6tFMv3RCFX2oL94DdgW8kTT+jTjamcJPL61JJdh8WQj0ozHZdWwMkOKepeqIgsrA55TNzJID873FCC0dkSkfAMHdRSCvIyzOrmEDhUYHtSKHWiOYBwBvPUpLnVERnplg1Qk4nxKoDmpGiUUTTjuu85oaMIDp+icOLpzvnLR/fjBf16bjRPLcFvIRCdM7nwPoGcz15aQqKarl5HcUCf3LLA3wtvBGCwJv1CTbBzDoj0kjhvD8Ve6uN8IgKdeCp3od3jy/Hjfp1kl7Sv4Q/cSqfMozKxuPo+Ze0UJf/sdQbfIiWYsBvvpDMCGJHF0IM4rNZOlGUIliwwOoNSWFAZUbkLqZfuclreMUCu9QWNy+GsRnWd3rEeVP9ZCA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(82310400026)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y3KY7iWGZ1jmaxuX5DBgp6AWCnpB3n+F7/a/WIG4sFuVgVaRPEo33CFUPMMSr+K4zKdb7RJ7egRH0CVLrdDk05hGKJ0RglsORKsdOKiCEz+OFIWrIX1VmW4L8swcOcKleuHtEFXRHTqk4SSoQDF5kyOuuqtXQOp3lefErM2bd8jN9LwtUW0ySbs0e8tVMjR3b2GxxKw3cp+MbD4keOx6bN0/+xSAeX0jTW5U1pr+duxaUovXu82GPDxpL7yI3mKHbqsq+sJ579uy6gCy7RzQDSkCJ07UQTtBekLST3kV0EZTjt9/xxVDgTYfUCfAsGfkCR8idr/ikemDsgUYVYO8RL+6NHoX+MRyAiNoDb1ieiRE5lqIordhHo3NATJb1ro6c69mZQ69LSj96NXTG3aPf4DccQ39xoJuKerO+ofDgK6n1Z94UHjszo2wlx89plxA
X-Exchange-RoutingPolicyChecked:
	ofSpxBU5P4T1LJfukXOwJuDFbs/H4tA4niv1C0y/YRn8uMyJUhzDfrZDlPra8sJwb1bqKBNtxULfBwXHa8mvJu8HW1aCUvahlyVunPJhVGbp3BcE1aU9YaPbWBjHmPsr7c5j160UhClrNGVMOjPOlqolfOOTaK1a/RsP+Qd3pDdrpr16v6ZnH0Y/q0uzmzxR4ixrRUjgkk2YtumzPncs4yudOYXB4kdw7A2k7tG6qqczopRRdh1d6wQ44XU5mRCjfvBKHC0IrHWpskC2Vnh5CjO+GtNdIkIo6WEq/DOWyNMyq2H+d+X+HzfWzin7aXi9bFRl5V0bGxqTb6yUMSBftw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 14:38:48.8510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cadf40c-9bac-46d1-fb55-08df22ee5e60
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5872
X-Authority-Analysis: v=2.4 cv=DuLDa2/+ c=1 sm=1 tr=0 ts=6ac3b683 cx=c_pps
 a=kkQK6hjpUACXm7ua2zl0Pg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=BFoJIGQfhxmLq0B7ZqkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1NyBTYWx0ZWRfXzqiKNcZw8VtC
 aNnk1rtAQkJrM0M54PrLT1wkzRm/yypZoCvkYwQg6BVoplgV+gE0/ytqtAGjQBN5GTH7lAT9bJA
 FbNTn4c5XG/9HULB2la+67CnvPEcKpH+eUFdEAVe7ADJr0xqR8605HP+kdewCWJet7MGYV85KeJ
 NLoc/3MC5n9BHEymIibMU3PkdJbW5RTr/5qDMo2IFc36gHHtG+Su9Qtibq5yEPP6Or1mhJT4Kib
 JAfjr+QHVyMTduCZqK0+RgrEpo+P5uvPqpmBmA08A0Nk2NqYCp1Ry8UAl+mcOlFlq3o3I1DKx1/
 pUQhuoz4F6FeQNOmlCyS1A6WaEozcAxvIDjxvf8RvznCVQR7GRUMURsh0/X7Yak4w6/k1BMR6Qd
 KgzzfhQSBE1osctdLYOixzdy5u9hH4/ujGdnp6LgEPLNqnvyoAm2lUyHB/JlzkNkHjKwO/12QN7
 0idsdLiSW/IVPbP7Oug==
X-Proofpoint-ORIG-GUID: mhaeUQy3wqfx_BaE5Cu-j_QmlNzEqPnF
X-Proofpoint-GUID: mhaeUQy3wqfx_BaE5Cu-j_QmlNzEqPnF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1NyBTYWx0ZWRfXy1rXcQ94CCvN
 haMT5b/3MdmME0XEHfa1xzjiLfFG26/04w2dWOAivKIrfOi+7UDxB02HdW5IrUSvl5mp5kkON9Y
 H7j9+G7e4wki84UJCajyTLIP29eDQ5E=
X-Proofpoint-Spam-Reason: safe

On Fri, Oct 02, 2026 at 06:41:33PM +0200, Takashi Iwai wrote:
> On Thu, 20 Aug 2026 16:31:48 +0200,
> Takashi Iwai wrote:
> > 
> > On Thu, 20 Aug 2026 16:02:45 +0200,
> > Jaroslav Kysela wrote:
> > > 
> > > On 8/20/26 15:34, Takashi Iwai wrote:
> > > > Hi,
> > > > 
> > > > a few people including Mark and me have talked about holding a small
> > > > meeting for the Linux audio stuff (finally again!) during the next
> > > > Linux Plumbers Conference (on Oct 5-7 at Prague).
> > > > 
> > > > Has anyone already planned to attend there and is interested to join?
> > > > If we have enough people, we can try an official BoF session.
> > > > Otherwise, we can just have an unofficial session at lunch time or
> > > > such, too.  Just let us know.
> > > 
> > > Hi,
> > > 
> > > I will be attending Linux Plumbers and would be pleased to participate in
> > > a BoF session or another type of meeting.
> > 
> > Awesome, looking forward to seeing you again!
> 
> So, the conference will be opening on the next Monday, and we still
> haven't planed yet -- business as usual :)
> 
> I put people who showed interests in Cc.  If more people are
> interested to join, heartedly welcome!
> 
> If anyone has NO-GO time slots (Monday AM/PM, Tuesday AM/PM, Wednesday
> AM/PM), let us know.  Or, since there aren't so many people, we can
> just have a lunch or dinner meeting, too.  If you have any preference,
> speak up, please.

Afraid I am not going to make it this year, very sorry about
that. But I definitely approve of the idea to try and restart
some audio meet ups and hopefully can make it for something
next year.

Thanks,
Charles
