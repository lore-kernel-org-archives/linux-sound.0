Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F3A2D061A
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757436245; cv=fail; b=MlHH91EzD9mdt5rx+zwTLbwWfbQcI7mb0LE3qDc5h06dvHzS6BNNyTr6UVvi7eWA4cRxjzMt4kb4n/+3YxYJV+5wFxBI6/v6F9IpaWPjL9ohhIe8qNh3xWF6CUb+KfztA3vLtfLa6sGeRfaSgLlUDBxevABkPkohgqNnyyDCtmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757436245; c=relaxed/simple;
	bh=KltrzdxL3khFzjuG1dvw5TLJ5Jc6Lze6gOmht6UxYt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShFnW06zJ66ea9ci4qvix2H2ICQ76pnQirnbUht17C342VxyNJhhh71Epz5YRXyxlT0FWqsuxJtg3IxavSdttY24RdGd7cgdiPGvfTJ1Gb/moHXHJe4U6OK/MxCS3PxNdk7gqu14wxT0M1kE5Wk+At90FpDM39TpQbTqEpAwEV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ml7K9GYG; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=OcVtYvYh; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ml7K9GYG";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="OcVtYvYh"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 589Flx9s3627667;
	Tue, 9 Sep 2025 11:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Icb97/4F8Z31wl/fF7
	XUtckOFHcdZYTulg+/ykPhHzQ=; b=Ml7K9GYGB5gR73mkHLsPOHDDGUoPX1xyG7
	vmNG9kTNjteueX0CFYLk1EjwYrlBJX9naoCMdbfMJ9lIwR7LZtPE4obb2nKBU2Bh
	D/O2R7+yOMa1w7vFWjdZnrpxUFb7Z4rSLBeHq4yOLaHVXPazxI94WDLw2b0B8Jui
	9WV4L+Fh/Crkb9th2tX3H3R8NxBghvnYHXAU4oyojXqKl0BZJtr0WCEj7pclzJFh
	NH80pIC1cBy5PnbP3hUSxe9CRqhTi8qR9C6Ppk7HTDSN4O+LUA+j66UOM0dvs84Y
	/uql3zdCK6Z1nk4v4AnKkSZuVexfYbMP1RF+hGyPF7rEdM7BdU9g==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2109.outbound.protection.outlook.com [40.107.94.109])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 492q6t836k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 11:43:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jekq7850Rwop6dcmBq59ZSIackQ4+lpgtoNgfHe2r+LK2XTdLpJ1Ns4i0TXUnICYRjMbqcPAxKD4LB4TubFcOlT9rMW14FYUUsyqLT1eN2zR1ba5krlivdKeRR8cWGseu9GM4CPM8kKkLBQpGYzljHfj1/JZyMUpVKKyZK3w1PlekPt5CRfUNJPTuHEZcQ4dm8/9QbZuT2vvBT3iBMjJJa32opet1TPDjiKl1lMuP9VPwdGeLPZp2Syezpptrnx172OWQndIYcamcteye73gsjh9sSbjDb011DzRuFB7EtdUfP7IGFHO1ROoJ1AKQFJWvTh/NtLqNRLu3m+yuw9VQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Icb97/4F8Z31wl/fF7XUtckOFHcdZYTulg+/ykPhHzQ=;
 b=TyM9DFXD5g2da55u1aptJ7VMZpYEbvc3OtveeYGliiJjVGbY5/nFId9OMrmlZc1O3cDpUC1Nzjqg6Vf/64mEITG9GcP5ZXJZHAp9oylcH3Sd19X/7kCh3H+YpsVEzur6rICLQyivX86kQYTXRoLLTAJa1NCudXS0m5kg8OEvC5K8baM3oTbPXuf6x65DSQ9GZ7a54yE0V/LyYhiwrdoZenH6fZfIzTfVNZAmPjHrtLEIxaOduUCA/Um++88gs1N2eh7KlfZxfirkjzVyfp6cYft41CwLzv+oxIZ4sEWAmJYbY/yR4h7OOoPRbv6QTxis+TNIWANyySx/EqoBFN1TSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Icb97/4F8Z31wl/fF7XUtckOFHcdZYTulg+/ykPhHzQ=;
 b=OcVtYvYhU0eg9P9LZA0qAQA2jmgji3T0X0KpTsflkz/PrA4jXjEPrs08gTbHv6Kon2kGe/dQge9QHLTbDcQpQ6bfvXsFMQCovCZsaVRmxoeoBWodlId9ePLORjZxcwK5nJPc+wuu9b8TTbAuwcb0mdlgodDtZF/6QGX5d1+5oOk=
Received: from BN1PR13CA0016.namprd13.prod.outlook.com (2603:10b6:408:e2::21)
 by BY5PR19MB4050.namprd19.prod.outlook.com (2603:10b6:a03:22c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 16:43:34 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:e2:cafe::ba) by BN1PR13CA0016.outlook.office365.com
 (2603:10b6:408:e2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Tue,
 9 Sep 2025 16:43:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Tue, 9 Sep 2025 16:43:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DC56B40654F;
	Tue,  9 Sep 2025 16:43:31 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DA8FB820247;
	Tue,  9 Sep 2025 16:43:31 +0000 (UTC)
Date: Tue, 9 Sep 2025 17:43:30 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 04/15] ASoC: SDCA: Pass device register map from IRQ
 alloc to handlers
Message-ID: <aMBZMv8b0Skl3Xu8@opensource.cirrus.com>
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-5-ckeepax@opensource.cirrus.com>
 <2f9bffb7-1f89-477e-b2f2-09974b189d57@linux.dev>
 <aL7ScExrl3u1TlLs@opensource.cirrus.com>
 <7c1585bd-9835-41f0-9bad-f08a8ef0f5ae@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c1585bd-9835-41f0-9bad-f08a8ef0f5ae@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|BY5PR19MB4050:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ded248-1ac4-4f10-f106-08ddefc00411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SS/XgTiTq2vPaebLiJlAG/3zxq+zjgPsYSNCBuFeqyDPvrFcsiqrZyYsfmNw?=
 =?us-ascii?Q?sC0UJnQGChHDX54E+njwKy0gh7EMFtCNzf2iTK7KWF1YGK6RXBpX64WyMf9q?=
 =?us-ascii?Q?5eKCVz+Seljc11Y6ZwBm0fYiKnKvBFgSg8gf8cH4wQLecYhhj9DM+p0JwMxU?=
 =?us-ascii?Q?s2RsGm/FB93qt5r1jvUit3L6W1b3EikJQqPTyxvHcumUmVKPwQHaL67gf6Y7?=
 =?us-ascii?Q?qUndESzYnGIliXPMGO4rJlSND37BqUZlnX6hIl5vsdg6CPDKJP39f/YJj7Y7?=
 =?us-ascii?Q?YlZUP6oluGKISDlUzKbMoNFVybKMpwcUK0D0oPM/qPbfgxdNy9ptB+s3Kb0c?=
 =?us-ascii?Q?/6qoiCYUjfb64NnNJDZ8P2JMRVDKRrlsmTi+Bd7mR/yh6wexg3xRA4yAVkUn?=
 =?us-ascii?Q?R4lWGieUA74mb2lQLnE9i9fdda2KO0kcAXA4NSsOB4lXCyxdRYSw74PzsZPj?=
 =?us-ascii?Q?ozDdsZl2MnvAc7/Sw8vXeBy8pfIJpQyyhLrytra15+J854ixoX3Qwzqte5K1?=
 =?us-ascii?Q?NLUDFFJZs7y8tGpn5XwN7+hJ7HemT9crsOYzt7KQ4Gbm6yZYP3WaPZfoEjSp?=
 =?us-ascii?Q?GUXHQvLbU8CZB84iojdG1Rj96xT2FOFZzo4962cskOef1uNAFaPorMLlLRPO?=
 =?us-ascii?Q?ckyymLgHJvW8O0v6a/MlTeFCmyyCGUtF6Zs8BA4xtuG8V8uEZXeF845n/8/E?=
 =?us-ascii?Q?flQTx7zpK0do6x8hnAKjHAhrukSIr2mPc8L+jimVxYrEbdlhA6nngC78wDwl?=
 =?us-ascii?Q?oaIN2J5pyH5htyEi3DWqdVUwkqhnJMojdi93IaQ//ErDhneorY925NyZklJN?=
 =?us-ascii?Q?heWiyXiJKjcrCsvkUJ+dgEid4P4FgtaAhNHQPfKeqSxYXcCzEt0g8ZsFQr6Q?=
 =?us-ascii?Q?9amyn0XxK0wjbJdraRJV25dIv7wzJSB1hqv4vBa+POoVQyZ9v4+d0GJGtjxj?=
 =?us-ascii?Q?r8D0vScasZfT3SljP++oYbvZzdP10664o8QQuVvUry0u82BNtxxWZZbftswi?=
 =?us-ascii?Q?W2G4LPQJBM+Ck44VbCFWMatdzKf8Q+4qH0H3pSJEf21I7HJxqjFANzT/MfUt?=
 =?us-ascii?Q?SAAahyQG3Q+yJ4JniabC35+sKORqa1mCVB9FGlhjlzQ7lVCORl+7an2wGCVt?=
 =?us-ascii?Q?9nKukRq6yAP24cNkO9u7Iv5Cj+1POWY5MaOd1//gELwtSWfBxtOK3KlOMhVz?=
 =?us-ascii?Q?9hebqAjfuXNmxHhHUaMy5P8MLK4TyQXkv1z/NhwAu6gQCP4GGhWm3aPfWpko?=
 =?us-ascii?Q?mhSoqKv9FX2XDmKprIWKhW1IQdFdRwi1pg6vd8HBH3KFo4IaR/8PIzbOPjcA?=
 =?us-ascii?Q?PzS/h0O4v7u3FuLnu4AsVgvPLuBASByl5e7jFY/9hQ9AOp4A5rzw05oUpNv5?=
 =?us-ascii?Q?tcf2BkreJQLv0bB1L+3pH16ZuZvd+2++PdZZN7o/zLEvugJ6NZxlcaqT5FMH?=
 =?us-ascii?Q?eOpFOt5cUjKODLwI/jU1jLZMbBdyfppNDCvYp5eAiB4ESiXRGfWsLgEHftPA?=
 =?us-ascii?Q?ZveEJfPiAcQrEYm+YC6D1f541XFRNhLRrIrd?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 16:43:33.5369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ded248-1ac4-4f10-f106-08ddefc00411
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4050
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDE2NSBTYWx0ZWRfXw00KUt7QJUsh
 STz+jXYQcESYOPIy35PogfMc126YjHv51UnvHXRCiC0X9go5w6sBabUTpvDD/mwpCuOR8KffUjx
 vAXFmy1QaBNoYRxqagWBlyVMxrBhskAtWmhzGDE6erObOcwUPh3HxnEZYHqdeFfgFZCDiq45Kvi
 KQYhbdeAS7ZBjIKumRW3oiYIRysirMLJaupd2Xs5k02RSHkiEIL7uOPc+HGY2wF1XRpp7JcckLU
 /FYL2dI8ffQLe87BQzwEiRS7nbQ43qGIlSjkcYEtjnULtJ3GZxGCvBY3QWIgmoKT4p6lBdV95h6
 LcoKgC6fNGsN0PObaGjaGOJsYW+aa1qH1dc35zG1jw6g67HyeU+T67y8PA6kaA=
X-Proofpoint-GUID: yqvs2BDx2l20nsJ9vCXA9lA_osiH-sJe
X-Authority-Analysis: v=2.4 cv=X71SKHTe c=1 sm=1 tr=0 ts=68c0593b cx=c_pps
 a=Aw7NL8YgY1wPWxdbGT6CAQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=u2OgZnarSxtlr55zCdYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: yqvs2BDx2l20nsJ9vCXA9lA_osiH-sJe
X-Proofpoint-Spam-Reason: safe

On Tue, Sep 09, 2025 at 03:05:40PM +0200, Pierre-Louis Bossart wrote:
> On 9/8/25 14:56, Charles Keepax wrote:
> > On Mon, Sep 08, 2025 at 01:49:43PM +0200, Pierre-Louis Bossart wrote:
> >> On 9/5/25 16:31, Charles Keepax wrote:
> >> Lost on this one as well. A child device could support multiple
> >> interrupts, e.g. for buttons and jack, not sure why each interrupt
> >> needs a separate pointer to the same identical information.
> > 
> > Most IRQs don't need custom handling so the core can handle those
> > IRQs. In the case of custom IRQs the driver would register some
> > private data structure that would contain necessary information
> > for the handler such as regmaps. This array of interrupt
> > structures is basically that private data. A pointer to this
> > structure will be passed to the IRQ when it fires and it needs to
> > contain all the stuff the IRQ handler needs, one of those things
> > might be the device level register map.
> 
> I think I am still looking at interrupts with the standard
> non-SDCA interrupts in mind. In the existing SoundWire handling,
> all interrupts are handled one after the other in the same
> handler. The only case where we could customize the handler is
> for the 'vendor-defined' interrupt.
> 
> But for SDCA we are moving to a different design, aren't
> we? Each interrupt is handled separately with its own handler,
> either provided by the core or customized by a vendor, and that
> handler must be provided with enough context information to
> access registers. If that description is correct then yes no
> objection to this copy of the information.

Yeah exactly correct, each IRQ gets it own handler and that needs
all the necessary context to handle the IRQ.

Thanks,
Charles
