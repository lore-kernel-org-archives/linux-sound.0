Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320DC3DEAD5;
	Tue, 24 Mar 2026 09:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346365; cv=fail; b=toDZ74hd8hWimuJLqdP3zZP+A47yefzRfuZzpyXoRRhGHMSEC5KlJ2QAFXxeyu5vuZ5T4a/wqlw4vDOtRgOgPwBo1JMsbecuStXnsjJBJLv4696Xg40SYZEbmKV2oh/uCyrh81hNB+hLF3mnLQx8FvSUFKOK3duHJKjHEtfHKNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346365; c=relaxed/simple;
	bh=iM1T6ltEdTNd4WJT35dbq34zcism89w+MYkRWMG71fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8826kjHwVy90FVfUFNrauh40Qzx0grsP+aMxvHKvvu1hxr6CuM5konL7PgICYZUCNWlRuIzbWoXUQeBxI5UjdJ3ffop7jLD4Y+KtAYX7TFJ+PgaRMCUPYs2KqrWM4fJiCClOg4JCvJVnzby2HEhFObxe0pK1+zc2uKAqsEI0T8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kd+SLQCU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=uWmX4ub8; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kd+SLQCU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="uWmX4ub8"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NNheQn695310;
	Tue, 24 Mar 2026 04:59:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=wy25Wh60rExh+dSJL/
	3ssTW2uhLEBq8AA8+P6vujkIM=; b=kd+SLQCUZR6FlvJztPMOf7FOFXElOJpjGR
	W8VQxqEAWY3sGmqe7zfevTp6I60k27Yf1fQdCv60x4CeNd/C5uhg4+aJm0x6ZF0Y
	DP5aV5hp1uX7VWFSn4VOmSrqErZioaebFgGiuO4zlfKIC7ko6KjglSnrWNXDCD3r
	g7QDHSgqz2KezIzIFlz81stG6xzKHE1TASXD+VLoUQw0/IfNUBG9FGW20e20i/zT
	bgXs+9M+vMmwud9tqR7n+EeWEsKWAif6n10wDWzXn5/vN1rayEiGAILC852wFP2D
	BnAw663dqpCENjL1PSk/urnX2sOul1CQ82ArIUiWzHTkQs/Ny4sQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021115.outbound.protection.outlook.com [52.101.52.115])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d1qrfayr1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 04:59:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eg5BMOzFofYKks3N3IPkOOdm2kC7V+M0rXD7Jl/fz9GLAhuAYTAb1cJlftnsSqfF/4iNN9vftqbkJlJ0B/X43xJOLuHo2Av52fV1G+pWyH9diqy5z6CxvRtZkMUqN7qEcJBH2yUIMoqalT1WAb+E0b611pXvqdy7wC8KpFUg6sn7gv8Nb1Gwt+5wgrBmgwWH3iQ+FSQ2xfSnlqEE1HrPxaFFyUwJ+v2QzQaJ6/gGJ6NudFH5mPr8QCTZgM+HXfOFr1zS71Helr+OZI6OsjSfN0yUbYhbZu15QNdO2vi0yGMy8a52OHnBefZerMODr+yqnInY25Go6q0iLvi1W8U7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wy25Wh60rExh+dSJL/3ssTW2uhLEBq8AA8+P6vujkIM=;
 b=gjCjeZMFn3QlbUGEkdDvuo1TYueE3w8BNwHoY7eYiIvYEgfJXGgPe5FTdYfh34cFfqd+7QdKHJ8/Es4ePd04tehaoTNPaOp6dqwipfV9dekuePfjZ9sxBIHyMU2177f74uI9H4mX6thrQgCF65AU+Qot48x+/oeO1rJ0B8QTDsBTtL4vQRWwp5ZN15KX6xLwRUq8938pAta2By8frp6ROJx9t77Wff8ibKmpGWMEYwgoRUsFPwmuCEpgEpr6jS+ezKUFZKYFN4XxaBmRzlkkRJs12kcy6Wb9kicK6RV5BxRcLpsWVbjmRT4NxKs/a/gqnTAh08isvhHQanHeeY4uLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wy25Wh60rExh+dSJL/3ssTW2uhLEBq8AA8+P6vujkIM=;
 b=uWmX4ub8Dn/FK7b8q/5EGjSXYNGLRXmxZY28meeIOkmdSZlHVVw0x33JaRqDmsDY4AU9h7nmypWvgCENIIS6A4ylqd6GXn1DS4IFHXfaxt9bjVKG+zSXSZix3wAoXp9Y5crgJIirfLo6DX8jFFBeoELL/9VFE2cgARkCzGKORag=
Received: from BYAPR11CA0053.namprd11.prod.outlook.com (2603:10b6:a03:80::30)
 by EA3PR19MB9619.namprd19.prod.outlook.com (2603:10b6:303:2b0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 09:59:05 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:a03:80:cafe::5c) by BYAPR11CA0053.outlook.office365.com
 (2603:10b6:a03:80::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 09:59:01 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Tue, 24 Mar 2026 09:59:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3711640654A;
	Tue, 24 Mar 2026 09:59:02 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 18396820247;
	Tue, 24 Mar 2026 09:59:02 +0000 (UTC)
Date: Tue, 24 Mar 2026 09:59:01 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
        perex@perex.cz, tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
        baojun.xu@ti.com, shenghao-ding@ti.com, sandeepk@ti.com,
        v-hampiholi@ti.com
Subject: Re: [PATCH v1 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Message-ID: <acJgZV3MuxmbPIb4@opensource.cirrus.com>
References: <20260323041545.2101-1-niranjan.hy@ti.com>
 <b79e1263-e696-45a1-a335-e023058ad035@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b79e1263-e696-45a1-a335-e023058ad035@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E80:EE_|EA3PR19MB9619:EE_
X-MS-Office365-Filtering-Correlation-Id: 766ee7b6-ab72-4487-f227-08de898bfb56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|61400799027|18002099003|22082099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	KpSMBgIse5X3AWAEKxP6KsonRiYpzamiKenJQXnpspSJSTu0I8RC7ivyaquhY4BVfUDWgB+lmY917Z2kF70YAxTgpUpYARoX1r9nUZmscHbl4CTId7/1otYPP02euTcyCXTLWYJ7cSgocgy0m1FupAOagXkSTE0115/jQCmENbUpy9D83wsBcrLyekFaFDZGfbA37Imn8EKv+SF0XxRkv6gZwMKIaTxfayIOvPHQguvSrf4zmfTc4k3SVA4mIShAzGR6mG7e6LM7mHpueGltdiSTUT7EHQ9oUl4xBx3PSO8m0lI4kqc9BZAvHGUWj2quQZWky1zH7NPKBqIJV2f1r2PjZHwtlRsmUMcs79C3GDPT6P54sVf4QUJdeGn5tqVUrDU0ANEadhB2Vv+3HkOYxbDYBsubb4ZlZczBkDQWR0QlZg56ySMOlOKx3kGUqJgiJ5ZekuLspF3wG/k1Ur4vRXhRST0I8sa6ZTOZ4ezypcvo0jBjl3P08EoXBaNtybj9nbub3+KKhUzmUBWisqgFri2sTLMGgS6HvaBKWuJXI88ku+qi9JzXvVDs3mPrq+46rc/3xcRUq0zz+qp8phot921KxPgPop3IPb6OflST428wvt9ZNeY3Q9vfspWfNZwA1KYN5PtrPpAYp9ReMl7F5pLQXJuqX/vUwrAnqxps18HnEwnbBLc8WTkrarKg9KhGrRVRh788En0wHvCVRsOaHuxzZMaAPBavq7demq5hm7hoQlZsUAHHWBDGVLg0l+/z8gjRm8WdS2GpmEQIVkk4LA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(61400799027)(18002099003)(22082099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8wEJpp+4ZOR0x9Bp0aBmq0P/pBID9Kvi6DbI4w35uJWfGWquprzAvPFkCxbC4AQZTfKQWD5FcSUe1uUflQ1A+uhZFXuIRfkQFZZSiCZzyo9AFO7BLSaKfcM9US9uo1lmE864+ohUNAdzC/WnDlrcC/DzMDEjRGajAxBU0Jjc6YPjmWzp/WoMWgPoZR/Mty8faRKSyKD78jhCN15jzeQL0doAqILfxgyl8GCGvyoVWGeQ+mz7femNFwxKqNeXPoPQaXwm+fjWc/Agpg25uU4UJ74qSdfyh3EHRbS4PrHd3jc2QAdKldX762lKccaNnl4C9l1luz+qxlupK/HAQk9kld8gi0lEfxy4/4pwmTyEnEZbrajZ7QEChbYJ0aqn/5tQD634+BVLeG2i2Tvc5XGZ0ZpHbrA6Pwiu+4W4PPWItwaTBGnipp8c4BvctwNz6KgQ
X-Exchange-RoutingPolicyChecked:
	TCtA6/zrkx+28jMyraviopWu5oVKbBApAia7jgULCBEchAfjm65Q/vzDsrBlzWjck8/qafS2RxSrBwcwUW65jxr8cIoOx7smf4WBSc/1yyT5eSvVoMc4U3cy55Koy0K/Dbyqy1+9KVtN93dVX5B4VhAiAOLjAL3Zvt9JtEl0dWj4eKv/SVOQeR/+hN63PW4izNsdaJd9qUFb0w/Y96KYHAACsaiygTz+ECDXLyYf3AwelMIOV2sf2KIJad60KBin72EGnt+Az4GmdaTgVVLUHADUwWC1tQbxtgaghPT7qbZG2gfUjTyKIIpkqpG8pQ13KfL5tvNuZdT9S9M7ZBuZkQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 09:59:04.0138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 766ee7b6-ab72-4487-f227-08de898bfb56
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9619
X-Proofpoint-GUID: 21gzUgCMzqHAA4koZ1Xnn9z3zbaGEoJj
X-Proofpoint-ORIG-GUID: 21gzUgCMzqHAA4koZ1Xnn9z3zbaGEoJj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3OSBTYWx0ZWRfX1VoVVHf3FWhi
 NtVy7X0E4+f3BSwXoAvNxkAMvDTr/JtLrCsIZFtutHWW7j7jSZB93VqiAtKpAUKeFN1yrxIdP2E
 c3H7H3Q7Jw/Rdof2QrV2CHwOPMdjS4HietH5L4PfhqMslbvIK2C43CG09LvMWspO6Lpvb0/LXwd
 w5cC7cZZpR12jmOyiTBcMVnmYMZnfw4MYFW6D5JqGj2hkBBbMWaPbyqsq8CtcBgUfVL5kx42uHM
 DA1b8vyS8lujAWSgNWIN8wFnXSjRkajY4LH9UayhLTdJqK9guJBVj94ahVnDj7M3o5QLfhGcPqf
 JpSNBPIdwkecX6dSUqJ9xKhxnqhN9cqbfgJiSkTrtcbQmeELZ3D985EdXWQaC8szfdAKuaNimds
 EF5WfsYnnlgxFuJO+apJ9Bju9CcTZef43FnvM/nzJR0DWw18as0Tv7PBoxld461FQavDKafocDM
 qzTMxFoA8/Bi88QO3wg==
X-Authority-Analysis: v=2.4 cv=FM0WBuos c=1 sm=1 tr=0 ts=69c2606c cx=c_pps
 a=G7MN2QGakcCL30ZscpFwFQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=9uW4T4NYO6VyGWfcNLQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Mon, Mar 23, 2026 at 02:40:42PM -0700, Pierre-Louis Bossart wrote:
> > +/* Convert dB to Q7.8 format (16-bit signed value) */
> > +static inline u16 db_to_q7_8(int db_value_times_100)
> > +{
> > +	u16 result = (u16)(((db_value_times_100 * 256) / 100) & 0xFFFF);
> > +	return result;
> > +}
> > +
> > +/* Convert Q7.8 format to dB*100 */
> > +static inline int q7_8_to_db_times_100(u16 q7_8_value)
> > +{
> > +	s16 signed_val = (s16)q7_8_value;
> > +
> > +	return (signed_val * 100) / 256;
> > +}
> 
> Didn't Charles Keepax add some macros for the Q7.8 format?

Me and Shuming Fan did some work on this in the SDCA class driver,
it is currently based on a slightly different system using the
TLV to map to dB's where as this code seems to present 100ths
of a dB directly. The problem with that approach however is you
tend to loose some precision as you generally don't end up with
a 1-to-1 mapping from control values to register values.

The helpers are not currently seperately exported although
no reason they couldn't be. q78_put_volsw and q78_get_volsw
in sdca_asoc.c.

Thanks,
Charles
