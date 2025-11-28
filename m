Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A1D30277E
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764321841; cv=fail; b=K1QvQztVgZoACea+hpP3Hs9vJd1HIS4NQIUX1NNkdPwsicgO0lrlJl7qM+PkWKmgpfVOn2t+fi/g/5jtD/28B7NI+lMAUgss40WmO9gVpbd+6F+4R3TAtCqZdL7nTK+iNGU2IyqnTcKomn6ZPkYC4L4d6U1chgjOPma+MLWZUpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764321841; c=relaxed/simple;
	bh=qcSkmfhY3lP7YQbNTLT+2E0eU/RLiiy0eILEqC7qm80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2NJpVwfA/5EKvMRlRsuIvuK9G6m+B+2Y3d6EO7nWiQiLKLft4ghGTmp5XP+FtZio1e68UgM3UKmGBuOYVykY1vI8EX4Pv3j01IJqrSbqLLMWBPBK+Ab3046nRXG9+HWoYOKvloiNS+X7wiXFDDJCt+jFjp8OnGyPvgAC4guNWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EOAnRaU2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ToGp4wqs; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EOAnRaU2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ToGp4wqs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS91Wvr3346245;
	Fri, 28 Nov 2025 03:23:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=dVyb4sj9KUPTunu/jd
	ZtsiJuOfk/lMWzb4bptW6pKd8=; b=EOAnRaU2obVOyhm+fdkqc7JunIH/nYkqOE
	TPHcSuuRdg9nVKKzZe9zVVhdxYLUccR88vvHfzID444NMTpMRvqhzLcxjvo2UrBR
	kG8NWaq2UTlVpwQ0VoDt+76E8aZICFxtjPFoVugpm+IHVamwg89MbujiUVxO/rD2
	wRiiYpXZjGp/k0Inuavt+YKOxSGeojFNYnP9lz+WlaksP9L2794bakK+AlmPztZx
	Y1kxsX2SKaDh4j0/1buJif5ySMpSrpzdkpr1q4NkOtZSpcR8xgYW+snYEg2t5fxk
	KYq2MHmPU1H+6rLiPRtT+IEtf+QQheG2Ab7QrSDIn8H9YgkwtHIg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021107.outbound.protection.outlook.com [40.107.208.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4anjvwucm8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Nov 2025 03:23:50 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmOjioB39x7J054gCr0HxAShjx4A4wGD7bGO9g3dklYDuIIpN2+9P/7lHxtkIUBQ5Rxl/TUJZkjEqlba8vCW+SiWgV7p5GSVpHhwif1KWoYJ78UyrYQO1QffjJixZeuDx/zfDzyV1LxeQaKHN8guCXdpzvy760ubwarm3/e3ESXvbQ1I3kQss7K2oCg3SWVcZPmpbjOfSg9BxiAVYe+kG8m+AlmzR56AzMVmx91t2IPYO/c0OccWl8sG9cRB/5lUpUpSifFKMWGiBZwabXggFdW8+Sgu54eirH3jVt28AFdxXegwhBb3ub6eXRNU2rqX2Z1G8FOgMusvKeVBpSEbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVyb4sj9KUPTunu/jdZtsiJuOfk/lMWzb4bptW6pKd8=;
 b=Xhp+PQeHsnyTGvYOeBkmtNPMiOeethMzvdNEGt9yu5q2juaTNEiEos7Y8bF2W5XREdQXt5Z1A7OxZ9omknaUBuvDb49BcrrJpfF7GOPFmmOo0/uUzdbF3ha6NElACOlciPhuQyOJyzMT7yP/vQMvUNhXXcUi31Rns8qIJ4ihQ9rslwu0G/H3aJCgaBYUrunj4BSreitHcRIYOjS2AAIp22vhMLg18yBLc+ZaLduk5PWxLNCeZ6BsRVbVwvq8cVQlFEASlv+XvQASIzfyjxMAikNSBCe8jl6lXXGxk1WXvdA7h+R3WFWkjk5980GUV3C5+vB1eqjzAKE1ZpDlFVXTTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVyb4sj9KUPTunu/jdZtsiJuOfk/lMWzb4bptW6pKd8=;
 b=ToGp4wqsuIbUtAcjuAJzlzq8pdL+3OwzRSNQ1r8+wf7dBqXmFuvfPZq1Ck3OTPD4dMn0sU4nNMLt3pgFKnPkYD+xlCGSEn5H3iJeuCS+zFlgRCbN4tlqbZbIZs19MLmV6EUf9GypYObnKRXDBxRzx5BmuHugk9LwrcDwAizRYD0=
Received: from CY5PR18CA0027.namprd18.prod.outlook.com (2603:10b6:930:5::30)
 by SA1PR19MB6896.namprd19.prod.outlook.com (2603:10b6:806:250::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Fri, 28 Nov
 2025 09:23:47 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:930:5:cafe::f2) by CY5PR18CA0027.outlook.office365.com
 (2603:10b6:930:5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Fri,
 28 Nov 2025 09:23:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Fri, 28 Nov 2025 09:23:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B5239406541;
	Fri, 28 Nov 2025 09:23:08 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A221482024D;
	Fri, 28 Nov 2025 09:23:08 +0000 (UTC)
Date: Fri, 28 Nov 2025 09:23:07 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 1/7] ASoC: SDCA: Align mute controls to ALSA expectations
Message-ID: <aSlp+/7O/hHzyVCB@opensource.cirrus.com>
References: <20251127163426.2500633-1-ckeepax@opensource.cirrus.com>
 <20251127163426.2500633-2-ckeepax@opensource.cirrus.com>
 <7a972ab0-a7bc-4c72-b0f1-06591f5075f6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a972ab0-a7bc-4c72-b0f1-06591f5075f6@sirena.org.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|SA1PR19MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: 18321b61-9387-49a9-8dc8-08de2e5fd4a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UXr2AYgTfPa4jowWvAptWhyuk0v6PEy2qzAR8HiIKUDzFupS4HsaJsAUARy1?=
 =?us-ascii?Q?dm566sOO2RVfO8OnqJSCv3Aha9skwEhj73olsQIs24hsHa7H6srPiM1ER9tc?=
 =?us-ascii?Q?ZMOSAILHk8IcfMZ7DDgiy/OEgSU+u+CuSf7IXleHEfWcEHb8VYDEJ1XHO5u0?=
 =?us-ascii?Q?zriv3D6fXUo2Wul0U+7BZoX7Qg1ubvu2kVzIis9TphaS3nAQyV5EByA6eQHB?=
 =?us-ascii?Q?CRy/9sm0PB3LQ/dHQy7BUHvGkvkK8WT0GAKTvVQdvn6yfO5SmW5vBhf+UBL/?=
 =?us-ascii?Q?ynt+Em9O0Yg2TNwpRqKMqT4lsB7HVlNGznxI1dG1fQ9AEC0UPWsKYRxRb67G?=
 =?us-ascii?Q?NEQO9Iht49bCXxZe0zLxC5RJAoLggdnH6h2MRUvW3sriPPira4gHuWT74NAJ?=
 =?us-ascii?Q?R/ufbccg0c3IJWN2OeritxvPK8vOYqsxozhTC7rVlVOcnQhp2+HNh9rnwprh?=
 =?us-ascii?Q?hG1UZNm3UUZBmbKJpizqfkzRjTiAJe2Xrbzl3PeawEQerHRSFOWmSPYfodBZ?=
 =?us-ascii?Q?5YWZp0nyUyzc5W7czkX9N1QHRGi3VidEAyrELZkZcMRkzGrD9o1q5D2OOu9W?=
 =?us-ascii?Q?vK0f38JLNOQThGsh32augXOx5PqQ4Zf8SCIJyNsM/myx5CvH2v7jkYpKDv5L?=
 =?us-ascii?Q?Ha1byurT46Pw53e56dIui6uX2pf9IDBLTdQghOu+BrjwdJh5spWIOdRuhM/j?=
 =?us-ascii?Q?Qn7avHtW7c4ooiDU0V9U3mIAT0jakjzfaVrjtuAYwqLjFkHhmneTC+W8Ccmr?=
 =?us-ascii?Q?VuWyqyx1luhWpU0ItM3yc0SEmnHFDfWwA/wLibfGx1p1QTzDDMZLdfkWHhgz?=
 =?us-ascii?Q?Lad91kduzC92pDf/ByJdoTBPHoARlm3ZUUhpZlOozzCy+fvNMSzPb+GaY/VQ?=
 =?us-ascii?Q?VvdqU6Nz03ay9u0y0zACpDXBQecbvUyKhBnixme9WaOyl7rgWkJN2KIdokTJ?=
 =?us-ascii?Q?JlAyDmYbTeV9Qr8bK5fU1ukaef1Gd0dQ29ombi1EwRKq3642YsSCfqAmstNO?=
 =?us-ascii?Q?ryWvGTWhsr+s3OmQic3WCn4U2YxJtSiKaCDILSxI1HSCZgCcix56W4Z60++1?=
 =?us-ascii?Q?cFJnA6OnubZiC5ufYuSPjWBy8qJG8bVpFQrZT2iw16DOau1EyFHDYjss1hIZ?=
 =?us-ascii?Q?iRjyUlUTXvPUEFy6mxJLb+s5AANqeskVsyqNrwAgdo+8LOM+FuRJQumE3UwF?=
 =?us-ascii?Q?mRG94TkxKFOqDmHzcmfgpTnPuhEaVB2PmFgIlPmyoW0IUIn+LWwR+wLaFGlC?=
 =?us-ascii?Q?1/8JQhIsJc36Qtw5i9NuzNEJ3vghxnfyXstZysH7umAd/SrvoyNN7xmipoVF?=
 =?us-ascii?Q?btPEpBLMyoNZq18tDEBxT08QL7Jso1SuadZB5VYZA39nKYi/E2r//sjbMzF8?=
 =?us-ascii?Q?+K1A2kzSubSKQ+F7CphQVgeCtiwKHb6pIJv3WIXgqHdQb3pZKivNB+hnYPbC?=
 =?us-ascii?Q?DX2nuN6DIzfB+fan9/tlyl8BVtwuUqYU7B+fYQmflIdWZsxFaXITHZASZs7v?=
 =?us-ascii?Q?HeC69aGtsLIsMxx5mn2/vIwgyNK72dyJdWPV2Sg8mHJy3X/EZUpyxPD4Po6+?=
 =?us-ascii?Q?FRpkKmQ0J9CtOhulcHA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 09:23:45.0507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18321b61-9387-49a9-8dc8-08de2e5fd4a1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB6896
X-Proofpoint-ORIG-GUID: s8C_6B9D4x-ImmlgoaA90HOyS1oqLLqc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA2NyBTYWx0ZWRfX6gJmRjmnUqA1
 aiqTUBltHdMV9BBs2nsM8SHU+LTJ5AK7NMxBtLCYH52HexSALCYJqMY/bCCkDowaZqUJe8if0jt
 4ky/wBGVZhpZMj08NOCQAS9nmc7jjdGjCM7+UToVBCpQUIUtaisNYTIzjVeUusS63qao9BED5XW
 ntRj/wId1Jwt9V1BI6XVzbPKGVW6A4f2JL3W/4aXSrcLUPHRCVdlDOWugX0jeMDvMQAOdHkvgzh
 olAtD6NAuLffbeHKoFhusDlTNM1SOlfNKitaBr0YKpp71W77rp48cudOQP9vsc/rLV+WuULnknA
 JnV3/e/2+2Fc8Uk5974d9dW32HrpdAiIAtnyxp29ojdJTM7+tQsu5ha5hBfwY4lLWsWiIbsed3P
 l6G20LSHMmrAZSuABjaqQ/li+Z4XwQ==
X-Authority-Analysis: v=2.4 cv=Vvouwu2n c=1 sm=1 tr=0 ts=69296a26 cx=c_pps
 a=WvTO7h1a7pp8pZEQxufCPQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=-5Ko2fJXMsdV5xpz9KgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: s8C_6B9D4x-ImmlgoaA90HOyS1oqLLqc
X-Proofpoint-Spam-Reason: safe

On Thu, Nov 27, 2025 at 07:16:36PM +0000, Mark Brown wrote:
> On Thu, Nov 27, 2025 at 04:34:20PM +0000, Charles Keepax wrote:
> 
> > Update the names and invert the mute controls to make them more
> > standard "FU XX Channel Switch", this does slightly deviate from
> > the SDCA specification but it makes the rest of the Linux ecosystem
> > a lot happier.
> 
> And there was me thinking you were going to address the FU bit. :)

Lol, yes it's a spectacular choice isn't it, I mean it just
screams Functional Unit.

Thanks,
Charles
