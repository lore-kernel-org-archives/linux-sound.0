Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C879C32D7D9;
	Tue,  6 Jan 2026 14:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767708184; cv=fail; b=Iq0ml74ElRXgn6SnxGlC3BgyvqvghzAy6H978Cpk26FWFVTk6R+R+S+vSOZT9OJ0zNFAyzR/hg1p6qfWCd0jWHs7pFnCJftsJp99PUH5+y3EJ93XTyAfdYfFciVGAQNkL1wcsSvVWoIlpq9rpTTe8k/9LJu/cAyWUxzpfzW+EVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767708184; c=relaxed/simple;
	bh=CqIIRsj7Q9eW+2y5dG707vcpoDnl/gV4M86wrdQLwHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDRli33Vc6KTR1v1pl5/w29IJv5YRRwxsFFWa3E+WH6xdIUXmYmX5piAW2/VE5aoXcRQIZTMYVMlug6hZOIT6CrZpynizBvNcRXlabElcTgEkV/KzoZrmT4o/Ou+dg4f0Qd+1NO8GKL0GPvOyQWFUxQyJiCaf+ybfsujuesqF+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cZ2jTAfb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=U/LuNh98; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cZ2jTAfb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="U/LuNh98"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6065eGga366461;
	Tue, 6 Jan 2026 08:02:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=2tnWAj0T1UZlpHq70a
	6dQ8hDAoCMIU6h6eubHQjrAwg=; b=cZ2jTAfba3AppF9xx+mso4DlmGXb0iLKVS
	pwvfYK4rKxMuUiyueRnqGvm0d6TBmUWBsxVJ3bQ4IhM5b05NtvTJAESaU1Qd+JFr
	M9vuPctgIU+dlm/kRpfBdHR7ly4c3wdqfAuzkyh9z75eBXCzsAdaAtBCjUarQXKS
	VqoZvMX6t0HjLjAfbhZoUwjlUIlmtFtOUKiVO8qkzHMOQYnZVjmLgy3crtsFgbKw
	lLYGwyIwG9LZ67FzMaQhySrz6OiOGg/n14mOjmkknN+gLtmXRB0qqTN7bswlMi+u
	gFBw4q6r9JaFGRHJzure8HZ64Spqr9oA454y2b3iDijrfwsF1ZGQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021117.outbound.protection.outlook.com [40.93.194.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bf0dnu037-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 08:02:38 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvQUAiC3nC3095LJIdJYcl3vgI45oqVClE6QG6E43uyURaS55LbvaSmK6TEw4lvbE5mD83Uj4DttTgI+eQZFgGWNnzpD916pW2E5u6iL6aq0eFAeu75G1tT1MSSuyQYBUYLxYgj/TCi1XogMUM6vnLO+WKcXz2XjSV/3OoJdABA1tDt0jpXdHKFvSqywF01EfQM0yOEZXYc+07RmAiklFzwmNZoOqk7HNbPeDehSFoXITxELMg2wTJMGoIeXgiPKuw087Ry7QCpAf4T9bHO4gfa0SlpAIRECyeSHk29XtFXL1b9+piUQw7lbdTrrkruvi8DxOolU4iUWhobZfxcOzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tnWAj0T1UZlpHq70a6dQ8hDAoCMIU6h6eubHQjrAwg=;
 b=UgRMi9WSa4Trmo2TAv5I+jDvdpEA2CXZUC+y1qXmpdzxZQOvvTGIDHfuvd7aqUP/re5Tm+gSNUXePtuo+QFTRX9vb3NekM6gnVq6xN6C6NYqfGDliBu454gpyBoP5cm+4CYKGvFcIl2GPjzaRAavR++x7bQ0vyWjcvkIrWlleqxifuhxaMauQnpuJ/x/h4TPIAfY1OujA7chUWEEJfszmLIczkBuQShCN8ozWBQYqr8J9VG6rxyP7lfhK7xV/tmjo+l2YqSe6bA5WO1zzYXsOlA/i1Jz2btFGd0aUxH4jrk36WWj7ciBhpxGgh2iscJPS+YUwkCSzNVX0ATb3yTk4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tnWAj0T1UZlpHq70a6dQ8hDAoCMIU6h6eubHQjrAwg=;
 b=U/LuNh98eMMqWH+DQYodmf+a5EGTCi3pj0lKZinnk8XI0mFBA52+j3vwgbLHuBEGMESxiP8bFQ9u/Uo2pKPmgFg/9SMkpVTCcBRkahpiIRAa4PRNcK6tjiwLYHgGNPf2ndB8hCS0puLjWrvHgWEpECFCbKmkSPVH82nOla8VdBU=
Received: from PH7P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::20)
 by CY8PR19MB7203.namprd19.prod.outlook.com (2603:10b6:930:96::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 14:02:35 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:338:cafe::fe) by PH7P223CA0019.outlook.office365.com
 (2603:10b6:510:338::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 14:02:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Tue, 6 Jan 2026 14:02:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D6C5040654A;
	Tue,  6 Jan 2026 14:02:32 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BB2A3820249;
	Tue,  6 Jan 2026 14:02:32 +0000 (UTC)
Date: Tue, 6 Jan 2026 14:02:31 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: sebastian.krzyszkowiak@puri.sm
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@puri.sm
Subject: Re: [PATCH RESEND 3/4] ASoC: wm8962: Don't report a microphone if
 it's shorted to ground on plug
Message-ID: <aV0V9ziI+PUqh4dh@opensource.cirrus.com>
References: <20260105-wm8962-l5-fixes-v1-0-f4f4eeacf089@puri.sm>
 <20260105-wm8962-l5-fixes-v1-3-f4f4eeacf089@puri.sm>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-wm8962-l5-fixes-v1-3-f4f4eeacf089@puri.sm>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|CY8PR19MB7203:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db8dc4c-7be7-4a1c-d273-08de4d2c3df6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PiVrGwZ/nIm6bAgkfDnHjCNmkzRMFMktpAOmrI+GkECoBC5mA6FukSRMFfml?=
 =?us-ascii?Q?udJl1MD9Rx6tIcR7sDjqWbdjkz23knHPZVr4Fpzq+IR1ZPBXIH0o2dmvnDG5?=
 =?us-ascii?Q?3L8jNo2VBkHFiBm6AgahBDtPYGKarCD4LMkSD9xj6pK5XFMR3Xjukqh9mojm?=
 =?us-ascii?Q?SjjnCuAA+rEcN7L2l7TBEYt2jGuMYbmCdzzlfS02S3AHoJDn3Hb7sB6L4LRV?=
 =?us-ascii?Q?hXgedp0QUgt3n+ZO08TGMFmAgfHQ/25YckUFrXYbE3iH2rZ+EVcgF8riYu1w?=
 =?us-ascii?Q?7V827B9FIJNrwB/CieFtzqTux6NJtoss9B0ZnX4B9HQ/nnMGa3SNn5cUP0iV?=
 =?us-ascii?Q?qJf1Z1+kVC7dseaQ0r+ROJH5pYZHy98axcZBH/PCeFNT1xKqhTrw6NgvAECq?=
 =?us-ascii?Q?RZHF0Fq7o80NtIyzDcxgB4BbBGArVnXRXg6XIaxnfpYkswtpmqEfQVnBPdmZ?=
 =?us-ascii?Q?/c1+C5yVD/1LmLQCyRPW3o/oi+sX11o2WtW+1h2S+Be4v9r1A2V+k61Xcivx?=
 =?us-ascii?Q?FCvC1+inF5AjGazKAncH+dcrQ5eh/GUpsvYnkN62NlCFxT+PYyazTlcT5+g9?=
 =?us-ascii?Q?7BFSTsc+MEYFUed50XPhBgrRHb9c0Z91oRix5KCcJyc4yxwepuf1X0O2Zk0R?=
 =?us-ascii?Q?cURH5VJCKWm5CZAGcrnwTVcihW0lPsKKsWX/8i3TRj9E1lfSGoAxByHi/Vn/?=
 =?us-ascii?Q?xYim7fVdQ8zcAqpBoRJcLzKyJw8nIS66QTZO/sw63zMZ9z7MHBVOpsAh2K1z?=
 =?us-ascii?Q?BSykNAEFxoLA3c97A3cd7qs64Vq7ZzOCrmI+4c7JxajdIgp1fP0s/CllDYbM?=
 =?us-ascii?Q?4AO74d1oBG6j9zZpfSbh6wi0SE04JbKd9MM29BKDiS3V6G2QUY0FbPQskfJA?=
 =?us-ascii?Q?72VPeCyktSqt65bLPZ68N/vEBJaua1AlEd9hWnmfUtvC0UkGyVCd24obqR3R?=
 =?us-ascii?Q?6/+uQ6vRuMe1IznfCGiiqUwVy8URwmovK34Y1K/5ZqVxv73YWJuKIVDISEqD?=
 =?us-ascii?Q?s6fsEsYEgaEoU7ur7eaQBWisgrJNis8lLlSVJ2Srge65cUYF6lDa/AJm1EhJ?=
 =?us-ascii?Q?82xvUJkQWdmfLOf5K8OdxKnenPUekU2F4ByTwWIAXPTbryLrLTi0yodINgBi?=
 =?us-ascii?Q?mtboZjYimLPcJcIU2qegYV++UccHrE/bltj1d69AjhxY2Rwc4Vo/UcGSbCwY?=
 =?us-ascii?Q?9zFmAoveWnUOvNV4bN7/OeE7MfeYKVbtWdhsrGfxLob9WpVxeix+rtynt4wA?=
 =?us-ascii?Q?FtjXDjffVFXaci1AuaoGiXiaiR2kslTrzbwvi2/CnaC/s3txz0peuKC0L6ck?=
 =?us-ascii?Q?r8lK6rrs6P3plo1D7davVrOAvEU79gcCJ9Zfs5qPWmscX4nmDv0sHmWzh0w8?=
 =?us-ascii?Q?g5wOLYZGltg/34ggPns/tdGrLf93mqhFbwDdXoMpNpOYDNNu5NnVg3Yd1vnM?=
 =?us-ascii?Q?NJ4Lym8imoFzc+UM4MpDd79zkK+hXBXqKEb3VNr+EZoPgVU5Jvl9pbo6iPBv?=
 =?us-ascii?Q?MzCD/J5WtkGqVGMkPMIfmhiQfLRs1oVNoxY6bza/6+OzSsiFCgqo/cZvL5KV?=
 =?us-ascii?Q?xUHFI2yPCJApNh4S3YU=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 14:02:34.3979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db8dc4c-7be7-4a1c-d273-08de4d2c3df6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7203
X-Proofpoint-GUID: LaqD-PBgVnpgraVPmiBNEqJZgonk_X8r
X-Proofpoint-ORIG-GUID: LaqD-PBgVnpgraVPmiBNEqJZgonk_X8r
X-Authority-Analysis: v=2.4 cv=FscIPmrq c=1 sm=1 tr=0 ts=695d15ff cx=c_pps
 a=gR+jnx00JS1rzJoXDrw7EQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=02rSO33laz5aNC0mwE0A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEyMiBTYWx0ZWRfX/ihlQAqO/RNl
 Ti60GWGAJzMkJ5m+rzhtVW4y4nZj3QmjR5tdBjA8CfeskxBuz4u9tZkcqfkhtwDSsjCgcxXGfHh
 Yl7EV2b7bvoCf06ttd4l60OoLYDMPanwZehlMzAZmUoaAIdfzE7GmA+j+KrL1j/yUnSNSvhr80O
 1+C4m48DxINqfF6jUktgbftwHnBlz8L1YGF+OEW6RryxuJtnuCMF2FDq0q8TbeXGI2OYwj4ZyFg
 WasD4RffCgzgJT8GeCuTt7QwoZwUdP2OXkXaVZpqQ8uzSvRD8fSCihAq0ioLILp9/30ncgCojjk
 r5Yt1imyyns5S9077wC1B3PcGZpVHhoMBHz+A4Pp4DEq39FXNIRIIvOrQxKtLYEgGDhoAtDkJx6
 O9mUcT/9XZ8IySPhy+cbC2Nd5rIv1uGgBGIFsstBXXtQtGlLAX6q1vUWP4++sw66RtK3Tr35fqR
 pD4GjRwev/z5hZi8AVA==
X-Proofpoint-Spam-Reason: safe

On Mon, Jan 05, 2026 at 04:02:10AM +0100, Sebastian Krzyszkowiak via B4 Relay wrote:
> From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> 
> This usually means that a TRS plug with no microphone pin has been plugged
> into a TRRS socket. Cases where a user is plugging in a microphone while
> pressing a button will be handled via incoming interrupt after the user
> releases the button, so the microphone will still be detected once it
> becomes usable.
> 
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
