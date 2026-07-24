Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48BC366541;
	Fri, 24 Jul 2026 15:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784907687; cv=fail; b=RmnpMfDup+/BQdV6AdVb+onqNcncceV4VPV2vAN1fkZdJZxnwXhWADzoRNLATbU8wSo01N5bIfKC2ASLwMnS27Z7+X7IaRhL5+Dr6AEkmbQ3GwSmr1fXpsDuCWJiCLEEcoUt1Ueh77lAOMaqB4Gv6DbLrVyaw7u1M7KxWnicpCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784907687; c=relaxed/simple;
	bh=WWPDlQ6q8j7pjfW3yr4QfuzBPLnVRUywekwEZraNTIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbyoGOnG2Hrp6IurGFLcTSMyG0haVPcmi3piswNEgnKE03+8+TcPw1q1iSw2j8rkT4D7eJZi+q+/rSQqoRNqs0q2s1nMzNAKe92MZelmnRQEpXs318dlb2Z0baD983Gohd2acLVBeqWJscS9otP3hk1yZH/5+QGvxbLYoYZKPF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=E7lmmMAm; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=UPl4OGL0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="E7lmmMAm";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="UPl4OGL0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O5hhLF2897547;
	Fri, 24 Jul 2026 10:40:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=rZjelg5znSg1ePj5of
	03lyI3s39tZODExcxVjMUW3WI=; b=E7lmmMAmP8a4TpxEw8g08Lp+AC3FHKix0P
	kqk2fPwslouGBcgEA4WKhlBANpHBRZB25CeoM1/w7QuJtA4Ul1w7yVqjeqNXkyJf
	2c9gyDLc29eB+qoWZUbsXA1om8kwI3f4N2tANrqwIBzR+8L5eCstA4suC9bgQiLv
	4DUZ2yAkM7hSbJi6mqrkhsvwx6xrBM4p87j7OQ4AW8t4AUfY7Ci8V7PRbL7UIZks
	CsGT8c+r1tDy4tCW1Y/OuxjlyugFbyUqgYwrrpKGJmKYBWFbBB3jj4kOP5Dxt6dJ
	tR3svb4SEpmPx1HB2i6GBZICZZNHwMQVxRELQTSzNAPOglBCqUyg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021142.outbound.protection.outlook.com [52.101.57.142])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wfh2h6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 10:40:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWUxQowjTdwFlw3G4Y4Mgxc/U5CiVE4BDJSTrJ/nHgLImob9gzNMahg6zCC59U25i3Vhl7a0WosBPLcdWFSQc1YHV9MfmDCmbsOlZFupaot/zOjgorxgTc3dq9I1YoLtMUI47NnXsZh6wMfGgrAlpkMqBmdzQ0p76DnaN1Qs6P86KY1XQNVfvsGaQB8ZGG/YF0c1Vh6COUj+MwFowLM63ZkRxR/jdUyMXNNChJOzXzKkqSdDu/V291GOo8LNTvLsNkSAJP+tSbANZiBCPiWD3Y6xLWsz0m4a5ep0mhOZwmWJQ9Wd33EU3G5+AmUQiKUYXUVxefsQuXezCMayI3OqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZjelg5znSg1ePj5of03lyI3s39tZODExcxVjMUW3WI=;
 b=dfA8hovV89LXzWl2rbAehPKW2MWlvnp9Kuw+BAndBdroSWnEp3J6WluEO8GFRnYiisgGGAQ8ePC3RUSz7knDQ59CBPbZlo2RosU9tMUd3eaBvxlDyduOcnCB92kJrcdFaiGKPzz8BSTQh4aDIpjS+FDfcupNgsa0K47S01qKRSLEjUYmzf6dQNDjAyGTo96x8N2YuCQhQ0evnQbnFbEXA2kLAKxAXsE2/R1u1+YsLobtk5y+csAIFw9WM6V5kQOFwLJkaHjsrsr9yVCHebXbDCDiTzJeGw3tOP8/OQ5+DRRh0wQEyx3/N37HPw8opZNAXXLlKmiOSzmLgopChJ3LbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZjelg5znSg1ePj5of03lyI3s39tZODExcxVjMUW3WI=;
 b=UPl4OGL0TrQ7SQV/ca/fZT/zbk8CkncLQ6FKmqmbRDZ1O8/IwJYvQy2/w1YJUPyEE4kZ4O0+s8py4WFkCLe6GA4CDuJyCZO8c/kkXu3UjB+WcdQGamOZ+Ms5MA2BbhZ+8jMsXrkXROMqp78RrcPvDqpxFJkZ9Yeo0o8XfQAdPlg=
Received: from DS1PR06CA0008.namprd06.prod.outlook.com (2603:10b6:8:458::6) by
 DS7PR19MB5782.namprd19.prod.outlook.com (2603:10b6:8:77::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.11; Fri, 24 Jul 2026 15:40:52 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:8:458:cafe::83) by DS1PR06CA0008.outlook.office365.com
 (2603:10b6:8:458::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 15:40:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Fri, 24 Jul 2026 15:40:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 51CC7406541;
	Fri, 24 Jul 2026 15:40:50 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3761682024C;
	Fri, 24 Jul 2026 15:40:50 +0000 (UTC)
Date: Fri, 24 Jul 2026 16:40:49 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/8] ASoC: SDCA: enable on DT platforms and add
 Qualcomm WCD9378 (Tambora) codec
Message-ID: <amOHgSiSfm2MgQqB@opensource.cirrus.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <amHqO5pMFmKRNYTT@opensource.cirrus.com>
 <87452472-0ca6-4ed5-a891-3a688598b5b3@oss.qualcomm.com>
 <amNcM0AxYAe4bU95@opensource.cirrus.com>
 <6d1870c1-7fff-4569-8de2-bb45b83cde25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d1870c1-7fff-4569-8de2-bb45b83cde25@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|DS7PR19MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 608b3435-18ea-4b18-6118-08dee999f148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|23010399003|7416014|376014|82310400026|3023799007|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	ap2RLkORd1KzIdjJBxZbH4g6J8qj+22Xf++8cA1hLKw8ohNh495G1NdgL/53A4c1Y0WHE5SVTiW3NG5L82e2gQ+U63zw4fJX7iABXAhPeIaxhFCnAdsLIPYdwF0cRAzYzb1LiZwToS/KIGEZsIerRexjwVi2bIAHeqETO54nWq3gnCPjPS0LHX1zVIYrClAFAWIpQcVGFitBjfbcTaHnBJ4675XLGhp9EwmlwKEUzUVcPuqQCBGV7MkIc6FG3Xrxd23zsn6ngUT4Y7iV+m2KDDN67XdpiOK0S9wLevDsDjLjTIjkO1oYArdeEQZL0NH0G7jOZjSp6yDbqzSjCXA2nSdlictcnZumFErNfsSbFi1aonxlMjoUgi5yXmeYpSkAhtdeCggzWwHIIbvdFpGAlc22cqcJnmMaeREFGgnS2uY6BwUT9idOCNAh3qMO40uuSjaXGW7hGdYLoVlxdfLYNu1rTOsJZwcEUixOzIOczGsx5J6H/f7OsT8D2GXywVkYWecL/FNdsIz6AOKomcGAOVYtOgMSHRF1PdbDtIsV47VqSPrzhv6DaocEV8idSbQ9kE3FIkf4nYxYPtSoLrLfFNOkVX1875x60McqzVpeoyjkUJWhfe5mI35P9ofKZCVo2eYNBpJc4tvAsJ5zOUTUsVOxk7bbqIBqHTgfS9JI3qNiOlQot9tb4rfy27iXuFd9p7bqpxKhYbIhPX6YpOSOKg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(23010399003)(7416014)(376014)(82310400026)(3023799007)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LqrVsIYC7wEnFjYiCi9FneIio7B1WbWqaylwET4TYF5bZoy4bdp9RcooWlB3nCqPC5rQ2y8VmbVv+F//eRju6CargvKYZvTR2C1h/HMAKscDz5Pt6uQWDMjxjCRVRyFRVTh5Afi86pAY3cHhVm7c7WKckLB+wjcKLc1rirkDVwv6AXAnaUgrLRe9DsSSWVd8WvBi1p1VO/oArAiF48JiCJe3bG489DBgPSXqvZtdpBoA80ynNjG4nirprNNA8y0S0zn/fiP5KS8rXjWIrltdA0NSoK6/BdEriyO1QUqiGiGWaJgUTaOn2cCzLNit6CdzS0Ajnolc5wE7Z5mDpJ9UEq53iP71JVo09Q0CzpYGX/1+XeV9XfdWW512LRr8HV5yarFqzdGDHoGwqrfaF53p/a9MyBHdmaTjMDNB5twWEJJDi/jOqZ5Zm14fSIcCQFXg
X-Exchange-RoutingPolicyChecked:
	HRBQVyppxWgUL8o1R9+iv204X5iICVrk8bh9TtuWqBwxqXyVKGoMhsS4gWhLFsnxca3XyTSiDB63aFxRWXUxgq734ZXa7p/k+jV0+43EmPRyZd3kYzeVVy+9V6klPiP3bnmrc+WF9lSCR77MJRrkKIX9rNtu6quO0aYO9PKbXiUuZGgo1X7FsxfCbEQuNw8YEaOz19prPoYMaGmSi4wwpSBg5sjuRRwbdZO88qFvKUpaDvJgKERRwUNg0ccjTdhqqxyblnYpd/LeQr+wDoBF98tcb62ZjA4VgH7/j9i+jMmbG6jGVdkw0JurfqBygWmaBJoPlgNy59qorD0nDAtl/g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 15:40:51.7886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 608b3435-18ea-4b18-6118-08dee999f148
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB5782
X-Proofpoint-ORIG-GUID: ZgPtF8CRrC01DDDi8OAEEZQ8Hr4_NzeI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE0MSBTYWx0ZWRfXykEXfolIBffq
 lq82juaIRaKarkoD0VoHTqNTjZOOt8RnHXzjJV/cGrsoCv0r2rk/8r4+FnhMMRZB7xz53lr70Vl
 zwTWa5K6lMLZPVNwIbzSnk4g6T9+YlQ=
X-Proofpoint-GUID: ZgPtF8CRrC01DDDi8OAEEZQ8Hr4_NzeI
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a63878a cx=c_pps
 a=a1KkbayPxhvfYlTdgkZZag==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=0gJhq8_m9W0SIoM8vSsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE0MSBTYWx0ZWRfXy/e+meWhebpB
 cO0mZuM0qP20mH72VUGX6CbHYpw41/XL765aiORcHMgP+/OETEUGLUlwa3JRVkOIwcyM8eKk8ut
 hVsi0BuQTZi7SWNZPfvfbXWXIjmr9ytryeudyAVNxh5CM7248+qMbhgDXKdklVVhDBs4bqS6My1
 OrLSfbU+SIB7KrxhHu2YyPMwHrdZZk0+SAbALQ3Uthp38opFL2tSJUyTUK7AUqKIy5rppjbINex
 MG3hO2/M6SqxacLldoVR09ytUqqgPqkzqKXxKHQvOgyqgXYu6fbSeImGQi68tcSAlkUkXYPjS5S
 yaez/1Fp4rgV+TmxqXE3E8Ki4Q/mq9eMnooEwXdISnYtGmPhcgGNwcQJur9AhGAlSslyEiPFW2l
 +sZtSg44k47OPD9g0G/XY6sVUu7z3Al9OjGTIVxWl0c68mWwTIFrk5ZBDy5ekWy0+nI89b4EnHK
 isxe7hq84lTTOJUYYRw==
X-Proofpoint-Spam-Reason: safe

On Fri, Jul 24, 2026 at 03:31:51PM +0100, Srinivas Kandagatla wrote:
> On 7/24/26 1:36 PM, Charles Keepax wrote:
> > On Thu, Jul 23, 2026 at 02:24:19PM +0100, Srinivas Kandagatla wrote:
> >> Thanks Charles, for the feedback.
> >> On 7/23/26 11:17 AM, Charles Keepax wrote:
> >>> On Thu, Jul 23, 2026 at 12:42:10AM +0100, Srinivas Kandagatla wrote:
> > Yeah agree be good to get the DT guys thoughts on this. It seems
> > like a misstep to me to insist that the SDCA spec implements a
> > completely different system of storing information for DT. SDCA
> > is what SDCA is now, and supporting two different parsers seems
> > like work no one needs when the one parser we have would work
> > fine for both.
> Am not sure I understood the two parser concern, what we are
> representing in the table is something that sdca core already does after
> parsing acpi tables. So we are reusing the same structures. Its like
> result of already parsed acpi tables.
> 
> I did try

Apologies for not being clear. It wasn't strictly a review
comment on the code in the series. It was a wider point that at
some point the world likely will want to put SDCA data in DT,
when that happens there are basically two choices:

1) Use the "same" representation as ACPI, in this case we can
share all the parsing code we have now. But some of the things
might be a little unusual for DT.

2) Do something more idiomatic for DT, which would likely end
up looking very different. But this would require a whole new
parser and lengthy standardisation process.

Mostly what I am interested in here is getting at what the end
goal is. The impression I got was that really everyone from
Plumbers was really more aligned to 2). I am not sure I agree
that is the right choice, although willing to be convinced here.

> > That said I don't totally object to the idea of an option to
> > supply a static block of information as you are in the series. It
> > could be useful for transitional and work around situations. But
> > it doesn't seem like a good choice for SDCA on DT going forward,
> > it is basically going back to the board files that DT was saving
> > us from.
> 
> Either we have this at driver level or at dt level, both of them have
> pros and cons.
> 
> If we decide to go with dt, this how the dt entries will look like, this
> should give fair bit of idea to DT maintianers for discussion.

Thank you so much for mocking this up, that is very helpful.

Are there additional constraints from your side pushing you
one way or another on this? Or are you happy to do either? I am
thinking things like DT needing to be flashed onto systems that
have now shipped or something.

Thanks,
Charles
