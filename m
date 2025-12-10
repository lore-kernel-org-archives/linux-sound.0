Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2055818787A
	for <linux-sound@vger.kernel.org>; Wed, 10 Dec 2025 14:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765377830; cv=fail; b=oJM98I95WA/MYcohFpBPJIQw5C1ifNgQIsIKttEgmrjVjfYMv/HTQo5RnR1kHtA7Lw94jhfizqCOPzSRx9FtDGWxvPwl0WpJHl0e1UwzhriWILydaHH4kr+sguichPuPtWrsLAAWdEbiDsP/NOIAFenVfm76YlZtoVT+Rvz4iz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765377830; c=relaxed/simple;
	bh=1q62W/y0E/K6DbrB0Tcv2Bpof3Yp8DRsWkej6iSP0UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVV4ANm7QnFVbe/HPC+ymWJZTRyFz7HzyKwYRf0fWPGOv8fAuQaWOA2F1PMejPTb8yzGa6RdDUnWvpkAXWHcYcIizehZA9D05km86suCrk422n1qmVwNmFsKbXa1UG3d2c2MzDKXdgxcgSblogQ9BJQfr4+GpZzTCmKvfc1+p7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Zeqhc6lI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=CD9aNk+i; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Zeqhc6lI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="CD9aNk+i"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6b3Cd2750521;
	Wed, 10 Dec 2025 08:43:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=tQsNbdB8lXqw2XQsxm
	LvSeaF05DNuXqrIoUKv6vHEWE=; b=Zeqhc6lItTjrfgv4FkE5W6Wmv++LowZwZV
	ZQlSfVkIIL/8ElaKJx8p9OUQiDq3L7Mzl+r+BTAgpcNwgmYy0vQce+sBmoV+ZO4I
	MPaC+vx3Y5gZSQ8uTkz4bLE78MSZyX02RTuzenM8V9hlQCCpNQHf1f44mWHCNiqT
	BHCItickp+2aauJ8MOWr9YtirieLlxO0e1thPbizbsCKzOnDkEV+X4+oBUJTqeAK
	KqR5cqD8We8USCE/EiJ/ZyHNHNI6PV434iKYWv4pDr9ldkcmYBP2UhWUbosfInE/
	nCa2r8gq1Opf3NEkAK8daHcM+gtsX7ngXiLHoj1a0eR+pQK3gsjQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022089.outbound.protection.outlook.com [52.101.48.89])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4avhskt1hp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 08:43:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYmXvxtxF8S632X/4L90BrvJhTFLlGF8cTQsnDbgdFTOvuqaV8QVP0vBjpA6S0VjZaWM9CVpIPC0pl8ai1SRxw0BKMGrI5dHX3er6aoqAwBzGYmWT6k52hIM44JTzXqFxv6kgsYlqdfMDGwSXOlPry+ksfbPUM+M5U/+DQEn1B0UfJ5h2hhr5BJrig4qR2epML1Se43bgxv6Z0hc5KMpEqAHTOfE8Q9MeXTbx2RvDf50oXfk3T+nIc3COsExxSC/5+6OLeD/qTrPDWZ+pMteDdnBGhhULzw5AG+KsWyD/1WtgShq85KsCt0tlPj2gck0DSoKLL7NjxNeYwJQm+zmsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQsNbdB8lXqw2XQsxmLvSeaF05DNuXqrIoUKv6vHEWE=;
 b=HN8+o3texAzwjbXRoV1Ie6AThySlzJm2vDkKD/nRA7D79nCxT0dFMJX7W+R8UJHc+WQmZw6wNgxK7C4CEulwA6ohXA1WZb6WqTzt1CKdPWBYWLjkG4Tdf8Lx5iiH44tK5jL781zOrjvbUzuFatmH7FkJkcoganpU4+p+y06fSH1Q0nRQFppJ/gl59Kk1Dy+PAm+5QL2mKJKcUQZkeW4IcS8s417wZDqMXAMKCPgxxZzYASpEWk+bmhq8Z2sVAwykStEpavtWqkGZN8Dg+KD4cBdViDP/l95h3QIV+aFw+lCj34OVj1XJFK7NeeJRs02ryQd+w/TxNEXjpgOUzNKhbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQsNbdB8lXqw2XQsxmLvSeaF05DNuXqrIoUKv6vHEWE=;
 b=CD9aNk+iV198EJMoaQnxzQgqcN76r87vy/YSGD20fnLuJGW3D9wcHsrw7nNTyyG9Uk5vnHMAe7hJD2KNnNYaLeTRsGKRK+SKaUs2uq102DnFH4m5rC0HvJKJuxfQXzlxvpOA37fVU0FtVS2NPrmg0khFOwde0J1cKlnpvOOp7O0=
Received: from CH0PR03CA0078.namprd03.prod.outlook.com (2603:10b6:610:cc::23)
 by LV1PR19MB8942.namprd19.prod.outlook.com (2603:10b6:408:2b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 10 Dec
 2025 14:43:20 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::55) by CH0PR03CA0078.outlook.office365.com
 (2603:10b6:610:cc::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Wed,
 10 Dec 2025 14:42:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Wed, 10 Dec 2025 14:43:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2F941406540;
	Wed, 10 Dec 2025 14:43:19 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0CF4782024D;
	Wed, 10 Dec 2025 14:43:19 +0000 (UTC)
Date: Wed, 10 Dec 2025 14:43:17 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com, vkoul@kernel.org,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 5/7] ASoC: SDCA: Add basic system suspend support
Message-ID: <aTmHBbS22GyoH+RB@opensource.cirrus.com>
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
 <20251125152128.274808-6-ckeepax@opensource.cirrus.com>
 <02bc8d1b-ae25-4398-acc5-e5779c245a3c@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02bc8d1b-ae25-4398-acc5-e5779c245a3c@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|LV1PR19MB8942:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7f0c17-00c7-4867-76d5-08de37fa769d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IPYWsnfiBQvCIQfDSBWPHaz1AuNLZSnOqXNPFqD1pjEs4mLpIqyVdVOCFvGl?=
 =?us-ascii?Q?evhnSaoIWU+n2136fUfOervfcPWYFnBB6Qwh85Db2BxtbBnKlMuc9BXu09r7?=
 =?us-ascii?Q?9kVcqIxmacVM7frPmMTUimNq40uKNNvxJlpNLTlewmKfk0UrOVWt0pNZAaNw?=
 =?us-ascii?Q?lJpU51IZRiCELse7dZQP0bht9I/iPULWNrX185InS7/JyC3UCdoBVZzXsab3?=
 =?us-ascii?Q?jfRRMl7tMBumGM5TsxseygVQYpMIYPrh1IpnNtpZh2XzPkpzHoFiaCcmbX0D?=
 =?us-ascii?Q?1bKsLzzFLWHksbxMIKuEqsp4mcTkQn+AvYWeMh3bwoF/y888zRtwEKL59nQt?=
 =?us-ascii?Q?BkbSYTlyFlo4i3H/LpgHcz3LE15t46UXFjap+Jv34q+2qyV2QNgiNhql+fBr?=
 =?us-ascii?Q?IdbSVa6QYs8Nt/Kc/mCJvKKRrRS1oq6nHOgDxSj/SLZZtCBBdgBjKKU4M9BU?=
 =?us-ascii?Q?M/DBLo3YZpx+r7b95rStI+J+u0W2O8oFeYnvSaqFifw0gSyLKxhMSHtVJGnY?=
 =?us-ascii?Q?GN9wIIT5mWxxr7YS8PFPWMPXphZ2Bq9GNjnaKrpc+UbVOKx2TpaWCvsFi2hn?=
 =?us-ascii?Q?UEJVNo8ifTHp1Sy7HR2zpuLgJ4B7QV53JHV/gDXft1mwZd9CkJRO47dTzl6M?=
 =?us-ascii?Q?EEQCLq1WlrfVShKfAJjxzferoNaFzCeSz7ormlIzMkHW366HWhuUIEzMziNa?=
 =?us-ascii?Q?DQlmEaxCv0SK+7B6EdRf6jzqai8FOpkj30xCfZszIbEvHd9WF+Wdc2l6TBNJ?=
 =?us-ascii?Q?5G8HN/3lSWHBqZ/9fSd5JEDvBvQxOsI3F3ujJ/HOmYkU++VfTOpCQIOdMVjP?=
 =?us-ascii?Q?iaNf+W4wsI08B0d3RA47o1rJSKUaza6+8ji5VyPKd5UqU/sCQEFnKzovB/oI?=
 =?us-ascii?Q?h5fACfEu0l97ZUjR4OOH4iSymT5wMpGT16fubGWkrAcEj08QDR2ZpfRRH9gd?=
 =?us-ascii?Q?PX2Uh8vYlBKQnLBjyYEJV414tNpxcMe+ASBe89EKRIfczJRfqJy2pk5u2gwX?=
 =?us-ascii?Q?RNOIlKHXXOh7fixMIyvtPGnT4jDyOgHBJruHtJ44krREHdWfbad87VKB86od?=
 =?us-ascii?Q?V03FrlXtGiUjdgzs0faOfmBKAAgPp9+PTJ22nEh7RoURfgkgOCZfS64xMLAS?=
 =?us-ascii?Q?63bZJUHKmRs7zRy7UltXPUBzG/CnRgaDu/eQvTi6ljSC1/lPfOD48n43wsY3?=
 =?us-ascii?Q?wDtaKNx90HTd/BS4cuHYqn/0fhDLbKWp8aFv2hPZAMT4p/CeyZdrFvxODS4I?=
 =?us-ascii?Q?qMJmOGYPAFFxuxylTJYJ59ENEx0qLshDS5lLoHOi+f2mDAUwL1jTEjRvTnBg?=
 =?us-ascii?Q?kpsdskYzzFX65cAO5vA8Czxac4z/mq6QJ8MM8pn2mpwZmKK5vTsDDiw5JMb6?=
 =?us-ascii?Q?Iq0TabRkfhm58iIWgxZYL93tt1ZrD8ZJQt2iwrxEVaunvXejsfImdYYY8hVN?=
 =?us-ascii?Q?sjme18HvuZgjJBuPV5LOsv0DXdSJzc41tMqvwD1z+3Y1pgHV48CCzeBJxwHJ?=
 =?us-ascii?Q?uz5L+tRfbigvbIcbFBhKGm3HSfXCsHzF3+N0QxfAPFSJPKdxPtm1hC4Ucgkq?=
 =?us-ascii?Q?/TsStYlbD3q3WiYmqs8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 14:43:20.2194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7f0c17-00c7-4867-76d5-08de37fa769d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR19MB8942
X-Proofpoint-ORIG-GUID: KDaK70wkHE5FqcltXyWEYr5xujyBTx-R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDExOSBTYWx0ZWRfX/Qd/22dQnBIH
 2uzu/9Ztvci5Oi+wA0qoOpWzKBfcTKYJLLWoUf3854q5lgEk0PhsHEj/FZ4qSN80d24Ljt+rWcO
 od4/Lc1dzf4oVrdiS1iKsVUt+qjFQNq4YFlEpEHu5WEPgZX3Sk1ThtwOfh/wL9zF4QGUMr235Km
 +yQ1//XtPMEf3HgCoBIvj1v3Vxs7gTqcah5soYAbC/GjoPd1OZva9vUR/VdUiYv8FkTc+xDdBkC
 D6K+z6TF6VfJyJzu88oBKJcn7hbraI/ActcaS/uqJ5TTWXFZ3IG4B8NIE9bC7EmmHQQA98/19/z
 CtUYQmz+HObCmWZuImNng5khFlzN15A9n3Ueb/9IiydEK3TpnVVDGpUYPl1Ac6hLM+ivE82yegu
 h7W78hFUz9VPqpVmkDR7d5QgYoemFg==
X-Authority-Analysis: v=2.4 cv=DJ6CIiNb c=1 sm=1 tr=0 ts=69398717 cx=c_pps
 a=88cenwDluC1K+zw7ozncdA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=BQRIhRJqe40q0joKf08A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: KDaK70wkHE5FqcltXyWEYr5xujyBTx-R
X-Proofpoint-Spam-Reason: safe

On Tue, Dec 09, 2025 at 12:11:27PM +0000, Pierre-Louis Bossart wrote:
> On 11/25/25 15:21, Charles Keepax wrote:
> > Add basic system suspend support. Disable the IRQs and force runtime
> > suspend, during system suspend, because the device will likely fully
> > power down during suspend.
> 
> Power-down during system suspend (seems natural) or power-down
> during pm_runtime suspend (depends on what the host does during
> clock_stop)?

At the moment this is written to support FDL after system
suspend only. Which is fairly typical of most devices I have seen
(Cirrus and non-Cirrus). Generally as runtime suspends happen
so often it is preferred not to download firmware there due to
time constraints.

This is definitely up for debate, my primary issue with allowing
firmware download at the runtime level is that SDCA gives you no
way to tell that the device is ready to rock. The only way I have
been able to divine to do this is to wait for an FDL irq and if
one doesn't come within a reasonable time out move on. However,
that waiting would add a considerable delay to runtime resume
even if no firmware was downloaded, which feels problematic.

I guess my two questions would be:
1) Do we really want to support downloading firmware on runtime
   suspend? I am doubtful it is really usable due to latency.
2) If we do, do you have any ideas about how to determine if the
   device needs firmware?

> > +	if (drv->suspended) {
> > +		sdca_irq_enable(drv->function, drv->core->irq_info, true);
> > +		sdca_irq_enable(drv->function, drv->core->irq_info, false);
> 
> and a comment here wouldn't hurt, not sure about the side/racy
> effects of turning the interrupt on before turning it off?

This is perhaps a little misleading the last parameter here is an
early flag not an enable/disable. I could perhaps replace that
with some defines rather than a bool to keep the calls more
self-documenting.

Thanks,
Charles
