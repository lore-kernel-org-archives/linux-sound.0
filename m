Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE66D2A1C9
	for <linux-sound@vger.kernel.org>; Wed, 14 May 2025 13:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229632; cv=fail; b=ary11IGp2cS2PYq8N+1DyhXmfAnI/Yr/DM9S7JboSoQJAk0eLlTOL7LdUFAibimCryxhnWvl1SKAe4JIyVC1ZZDPALWY74qeHji+cTLZMgzs+ptykmePD3a4ang9d3AfFM5qAoszGDoVb0Ogmqqfv20eHZDghupsLYlnetaBDpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229632; c=relaxed/simple;
	bh=g3Yg4pqOprflre3o30BhIemGs+HNmQ2F/OKvjzyW8Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kn62QW68d1fVxluoSylvdN89Ik8mfocoFVxc3h0XD6mOSwk0Ngmu50mKEXbQgHL0iLVueKWyNdWzzeyO5MiWOtW10y2IEMKBk2wsC2IXFIn+IEMPJIGA+UfTLGfri6HpysezGaTeDmloNOw8ZeNI3tujRdNhxIOGtqg2El91XsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Q8qxa6KY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RLeb27xy; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Q8qxa6KY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RLeb27xy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E6tgc1006140;
	Wed, 14 May 2025 08:33:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=zkLE2kFvhoFaUn65F/
	fE0sin3JGuNdH4/qm+PKrh03c=; b=Q8qxa6KYsAQOfYhJvKik3LBd663pS00QUW
	CfLdNNIWqzsdSl8lb+JFXmPHBz34dMXpADsbgeTnF+bK5t3w+WtZgDBzuWyNn2ib
	VaBUG7GhPXZB7Ha4nLFHMuYy9Yx6TtEKC7WbzFL0OsYRln6tXfjzfcA9ADHTvkvb
	ZHXEVt6BQ0VK7Q6CL0RRlVRXdMLzEXtT9pK+JOGbExMfWsd1b58YSfuhTVbO+qTH
	TNw2ciNBbSEYuMWfpdOUdRbOFI6DWgooZR2ROtCWl93QDBR2dYLVIfPT014Cs4+1
	RAnrUpRXRMidLefXVfYpqr4cr9tC3RTyJ5wddWnvweBNNiz4YxTA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46mbe595ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 08:33:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJwX3uyYYi95r+SIKt2Qe6ZeeiDubwfuqjbglx81me6o/W7tBy8l02jOBPG+M0MLRHB/f35WrBFytopXgiyfV+ndNQa1qPygmrXkbqf4ky9TuNqGjGlBkRlN9cTziaksYNked4v2+TSVjukkEMOblsBDf9ENKBerY5awQ36cUZA1EhIrOT4hxv13sPYHtSd27emhXk0abBFmYqMiCNqSkgVk5yvOWvNiV6g2AqRV0JSXQDOosOATjOpAyQmaYTJaU2F/FQdHxeBuGBTjM8hYGQQr4IJiREDdc6nQ0cW2lR1IDNinSx0NbipQXNWJJ/tdyL6mW7t2cLjySbReZlqf1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkLE2kFvhoFaUn65F/fE0sin3JGuNdH4/qm+PKrh03c=;
 b=p6Pa/4VEBwJkPZD4GuYmVws5A1GDshoPEiD3AfVQ6pUByrkzeKUlzksrMBVd96lbWMP9hTVMUHLyZy38ESYhaMdnm0sr8b1I5YGKu3ue6z9/ns0ovW7mH8YMJid9Jd/VbcphPOblAVXwCzkOubwEhfohkjvTOBlu8xrV/vMqESf4pkGsCh6ie2tzgC5TgtQ6psEqhctB+cZC9PZBsMy4KlrHgkurNMBY/aT3uctnyybv43cRBG4K1Yp1+BATcJrCa/ZrQwUW3yIpukyjmYZgSjVooTmRgtc35ty6GM74ZzA9GhtMFBwwvIzLmwKfxacFlJlhLDzDKWIQLQTi2hsdRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkLE2kFvhoFaUn65F/fE0sin3JGuNdH4/qm+PKrh03c=;
 b=RLeb27xy/JfVVU2D55jKRCMQNaTfceQ8CV5APWy2NShNSrChI/n3w8HggIquJ960fDE7bmgEaRBHl/uEfH/MJJZ1YX37KNbZqfEkooz4sVCJCTl/dVozU/8dJ53DuofqUg0iiBIGCxihKA4LVk0im5a4l15iBBNVjJcN7b8j0iE=
Received: from DM6PR07CA0125.namprd07.prod.outlook.com (2603:10b6:5:330::7) by
 LV2PR19MB6056.namprd19.prod.outlook.com (2603:10b6:408:17d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Wed, 14 May 2025 13:33:34 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:330:cafe::da) by DM6PR07CA0125.outlook.office365.com
 (2603:10b6:5:330::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Wed,
 14 May 2025 13:33:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Wed, 14 May 2025 13:33:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 97A77406547;
	Wed, 14 May 2025 13:33:32 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 792AC82026C;
	Wed, 14 May 2025 13:33:32 +0000 (UTC)
Date: Wed, 14 May 2025 14:33:31 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v5 4/6] ASoC: SDCA: Create DAPM widgets and routes from
 DisCo
Message-ID: <aCSbq3UE/siXjM0C@opensource.cirrus.com>
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-5-ckeepax@opensource.cirrus.com>
 <470de11c-82b1-4d1f-aa52-e0849ea261e1@linux.dev>
 <aCMXXaF56CAKEHGX@opensource.cirrus.com>
 <ac2ff52d-1338-4bb3-b9e0-3a7e28c3baf6@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac2ff52d-1338-4bb3-b9e0-3a7e28c3baf6@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|LV2PR19MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: f86890ae-1475-44cf-0d87-08dd92ebec88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JfziDMR6Ozi05/IsIxi+3TWfLrBq8p6sAc/qghhSA8Qz1a0bDWFvp7Dv8Z89?=
 =?us-ascii?Q?Xr8irnLfya235c8goReHjRixxNe5nF54mR5jZPcHdTGWDXKuKlN481XD8DRd?=
 =?us-ascii?Q?XlTYMzW+W4AtA6PXMR/T1SHiXhctjVOuEAXMdM4u5Fgftoq48Txy4cjbexKq?=
 =?us-ascii?Q?BBLSLYAEm2arJLcSFW9NKHOU6Yh9P8iaheTleExe1VlghWElv9jyqX2kqjVo?=
 =?us-ascii?Q?23nKMWZR3PQmXcJL3bCGIAfrnP/0mHENuX9Swq+HlSFPf9uFAL5XF7fRzTED?=
 =?us-ascii?Q?Dz2ZKmtOC7BlWd/6kNBSI4UMks9LMftbF5i2+r6aLmNvXvRkeHCXY/D5z83O?=
 =?us-ascii?Q?pQCrQc4bHgxaY7khAeMduEHEj8+AIbIDaIyllR3nHvc28mq+aBE76eQGXTEr?=
 =?us-ascii?Q?nd0BhAK31hN1HPROrbVe4nHoYHXY0Z0r6tsyQqaCC2FybyJzhYuAazswk2Xs?=
 =?us-ascii?Q?bDG5//wCQVe5o44LkzCMsQwKfM/cwBVRUqJhVziqB4fTD4DLdvCOWY5xVprH?=
 =?us-ascii?Q?fw/veY+ZHPRZy29f81WFjnix92l1l9SwFJqKTXQ+UROIxr5fgltGEQhphUWI?=
 =?us-ascii?Q?ZyWF3xF8atOBnV9gyr4UpXnd0G6TeIay2yBNYnFMHSdYrFr/vZcgOwYS6H8p?=
 =?us-ascii?Q?6Ww2ux32AZA6r46+V3GUqxw6xtmHJbyRH6uzStIMwKlouoylF4GEbIV/1mDZ?=
 =?us-ascii?Q?Z+cZ5B+AV1BO+UvBdEa6mwbOSKdRbwcxnpFJ9o6+d70WIlhCYDxNm95MQU/c?=
 =?us-ascii?Q?UQTjdQn5t9YK4WtzwwYqyqciVCEprYWLexbI6yIuJz4Scxvf6qetEQy39sMR?=
 =?us-ascii?Q?Vp7/PkP/UnFZ8IGUVmh/9he6rJtnKLxexmBsbyKPJe9sSUWzV+h03rWCtggq?=
 =?us-ascii?Q?R+/IEIAtMVWGfJyKmu2k/ZdXGksEJflSN1ab4anDgFZlU0n/E7sfJr/f9em4?=
 =?us-ascii?Q?Zk8Ah42+VrBbV0u0w8ti2bTYIw2Ci4qMcBISXy6z8eBolmaDUGcPAWoenXDD?=
 =?us-ascii?Q?fB4ltAOKzjdo2abAIK0Tk3LwgotYKVcZ91QGti+OsuQuTCd/J5DNnFji6Ht/?=
 =?us-ascii?Q?5w6/v9i9OGA4gb6iO7TkiWf0JgiY8lyuvo16RrMpyaFwiOxbVECw2iP8nTyo?=
 =?us-ascii?Q?IfFml1bnXbyEOW6ONtlBibnS8cybQj+MWrYTBWZkqD+tpLmAkLq0PNgKaF6E?=
 =?us-ascii?Q?H7ZYJPnMB9YoqWLT3kcM0qHqf/UJKq++je9lFB6KU8xsvJyyox4l3NefueaO?=
 =?us-ascii?Q?RYmt6Sro21tcv3bYUC9xvR9YCnohdIJT2Y5qHpZE7yXj/GGLNyRN+Uf2uo1a?=
 =?us-ascii?Q?P6e1whKEihkpxqGe0Gt4AuxvFBDqx1urGQbMNJG3SWrChrLw9Nt869rZR1Ob?=
 =?us-ascii?Q?J/xaSq0yxeOYHG8nsU7QqjZ4dlkopZjrxiBqbKwVfNwLERdD2cGafXeoM78c?=
 =?us-ascii?Q?xCECI8hwHNOxENR9bDdV+c051Vt/Z2drRCjYlRwcUyzTLeDXrEeC2dtKDQ47?=
 =?us-ascii?Q?m4J+X6y2eXg2Ne4juIi6TmvV7aNdZXve3o08?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 13:33:33.7006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f86890ae-1475-44cf-0d87-08dd92ebec88
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB6056
X-Proofpoint-ORIG-GUID: ERp4OjBVKqDWAOsE5Tu3mUsx5MEmbtfW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDExOSBTYWx0ZWRfXzkg0qYNkCn/t C7cGbBESQ9Y1onsYFPE7S+BKWKF2o9b+5CPmhNJ92i2lh+FhshMGVHILW2bD0AkgyWmNyfiNQKb YN1j2gpYAQtLshpFus1F22jEDza+U+0pe2EQBMBCkk4i23WOl+MAe5OrKAqaVuqdZDwwxwyvZj7
 zZBrUO7GvizxtJwQYAwm80gd9ooM50Z4TBVnl9kLEl+urpLKMdXTwtuwsDBy1p4QmE4iIVwe6Bc A97XemzxgbbrsqzKNpdY3+RCdQSZo5tRd0/fv/mJLcxM7lHat3PpSUFHokdRYDKltz2iz8Xs8HL tl8COJQ9NsJTnuLl53Zy1YB9y46O/b5cwzTx4rDDtg4xYM99Ej8wBx8kw+GHEycLZp+uFNUxP5y
 X9rmvaY7457bkOc2zLjYCZayGFNkReGPL/YYNXy570THAtwKUvYHtRd3YNiKyrRRrq/I/20E
X-Authority-Analysis: v=2.4 cv=eqLfzppX c=1 sm=1 tr=0 ts=68249bb1 cx=c_pps a=R19XVbJ/69TrMGWtO/A4Aw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=8mWpWSughUY5tCnLjPIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: ERp4OjBVKqDWAOsE5Tu3mUsx5MEmbtfW
X-Proofpoint-Spam-Reason: safe

On Wed, May 14, 2025 at 02:33:23PM +0200, Pierre-Louis Bossart wrote:
> On 5/13/25 11:56, Charles Keepax wrote:
> > On Mon, May 12, 2025 at 03:46:40PM +0200, Pierre-Louis Bossart wrote:
> >> On 5/12/25 14:42, Charles Keepax wrote:
> > But as you can see the correlation to the function diagrams is
> > the spec is pretty good. As I noted with a few minor exceptions,
> > like the GE having more paths, since it must connect to all the
> > widgets it controls separately. And the DAI widgets that are
> > created by the DAPM core.
> 
> Thanks for the diagram, very useful indeed.
> 
> The only comment I'd have is that all SUs are represented
> as MUXes in this DAPM graph, but in practice most of them
> are simple on/off switches. The case of SU35 is one of the
> exceptions to the rule where it can have multiple inputs. I
> don't really mind if all SUs are represented as MUX, but it's
> not a direct mapping from the SDCA spec.

I mean I think we could special case 1 input versions as
switches but a) I am slightly concerned it might make sharing
them across a GE harder and b) I am not sure I see what it
really buys us.  Generally I prefer the code to not require
special casing for certain situations and there shouldn't be
any difference in the behaviour from switches or muxes.

Thanks,
Charles
