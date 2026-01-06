Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D77330644;
	Tue,  6 Jan 2026 13:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767706170; cv=fail; b=GeWv1/A4oOV/IThFsLIKhNmhjsAN9+qMeD93NLNT8nHPA2DG4vATM0LZFE535lyyU8juftJ+R9TmbNuiIyMix/PHbBixmn2sqxUktd79yyH0C5I5EFfp6YJk3aVz0vlNpcHeoHDT+PT/44Tv79ijieCBMDdc1gN/STp1oG3NDQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767706170; c=relaxed/simple;
	bh=y+UMiCbTNHe4r7z7JbxmKvkn5XKok52J6SbSWovEi3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SoAn/rT4msezqmibR7WoDiTGU6mShSEweVLw6I3Tn1ZUXM+Hsdz44twPeGtIl6sVOHsouBIght/9PTCs3yKZMVGeCdjdT1a38xgZnuS8uxvNn8VjBgtQUu9iTmdIZvakOGqK3G5yH/kyzAG/IK/kXMbdA/nmmj2MhzbEB66TsC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Tssm8P4v; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Up96gqE6; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Tssm8P4v";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Up96gqE6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6066UTJH782196;
	Tue, 6 Jan 2026 07:29:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=euNfXog0wuWcbrYBPR
	aLswwl4RCDVL7wEk9NYeBQt7Q=; b=Tssm8P4v62I74G66lrQICivpdOZkpvyt0a
	91EbkEK+jsNmMI5ClT+l9HTBbLfCLQZ5ZeivjXavSeW43ae5LFfDbUygMcI8hFDc
	o1MdhrVvaXMK4CznMo0rrykVUJHJrzFLogks/o+fl4Z/JYBm7IiQonKAa7TCGv7U
	RGHGxSEyfOjHI74e4eQcc/9hKRCRdAU1PJFdIOuEkpCTnEr/lneJqxxzxOUfHyZa
	FetkPVte2yRSZOnNExJIcEMw1kvXGDXEa/5pRyBw5XKpTxe+CiNocqdia2HOlsUM
	OcLr1EtFzIOmQruCob2M/HNeqc32psFWqntL1bkMq0olOrI4D5mQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022112.outbound.protection.outlook.com [52.101.48.112])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bf1d32y9m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 07:29:15 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQ9Ql3qovpffUnEP/43NlWnJv/K7Vr1GJtbZMIZHHB/dMeMcK68FXJ2KHmJjPaXpNHDGBGRqBpCBXj1Mm/eMce1BMJDqnGF7ZJtn0kHnJv3J7VDCXXfdMrccFptbasHTNGrdsX3qvuHbFhN6V15eFxGrTt94b7Ik+weUG8xxB4sYFERqj+iWEMIcudumEwrH0gAWfw1HUhV6Yub6wKoOvCVX+Qk5KOBHPzeMMIHsvsznohQxHEDMjNcV5Taja27gfa4CU+Djxc7n2WAM3lWao/ca0sI2q2dIMsaLWqgR4U0B7HIzFgXc+dvRUhX3hy7MW4qwsD4/N8E4Ac1AZZkVIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euNfXog0wuWcbrYBPRaLswwl4RCDVL7wEk9NYeBQt7Q=;
 b=GAenLdWU18i86PLQDCOo3G9uywtmEfzoEhK9W5qpjR+k3Eauad0RcNoJ51YDnEmh07vtoUpZegp4iaZw+FUvAU/4k5LnNXvWRIbMqzleNdLkxgk6ixSVaiUrOAowBQbN035DAWd0s8Xxj9bKtcMDAqG0UbQt9TCu9yyohO+jTL0qN29ifbLTCAdTv64wNSgreVLRkBTQYwB89NIdIjwMr3qQK+DzQ5K0SAVqfVA1xrw/mvF+AmZhcv3ckjp3qqy/888BquS25gL4xod7EXNTPV2GZuj8oZCGOptJa5pb6xvc2IjC5tM7zw5A7QLF18HDEm61jc+Rp1y0llZI9dK8/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euNfXog0wuWcbrYBPRaLswwl4RCDVL7wEk9NYeBQt7Q=;
 b=Up96gqE6THXOc/eW83Sa4wyisOa35oaLezKvGLQzSNOdmaiiLr4yArYvNjpOCx1mIbtFFjK/Th1ZSf6uFqm1D+nfnYBNH5JrZrGKc3xGzAPpQdSqcOksfZwKIx8RCmznFUreOiz6hzNH81JneVEO9LdyNPdynqd0eo7HDsYYWC8=
Received: from CYXPR03CA0064.namprd03.prod.outlook.com (2603:10b6:930:d1::19)
 by SJ4PPF403D7541D.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a1b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 13:29:11 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:930:d1:cafe::a5) by CYXPR03CA0064.outlook.office365.com
 (2603:10b6:930:d1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 13:29:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Tue, 6 Jan 2026 13:29:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6F04140654A;
	Tue,  6 Jan 2026 13:29:09 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 57516820249;
	Tue,  6 Jan 2026 13:29:09 +0000 (UTC)
Date: Tue, 6 Jan 2026 13:29:08 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: sebastian.krzyszkowiak@puri.sm
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@puri.sm
Subject: Re: [PATCH RESEND 1/4] ASoC: wm8962: Add WM8962_ADC_MONOMIX to "3D
 Coefficients" mask
Message-ID: <aV0OJKOSZHG8SbxL@opensource.cirrus.com>
References: <20260105-wm8962-l5-fixes-v1-0-f4f4eeacf089@puri.sm>
 <20260105-wm8962-l5-fixes-v1-1-f4f4eeacf089@puri.sm>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-wm8962-l5-fixes-v1-1-f4f4eeacf089@puri.sm>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|SJ4PPF403D7541D:EE_
X-MS-Office365-Filtering-Correlation-Id: 70554b9b-51f3-4a22-66fd-08de4d2793a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ydHSYxE7jTfdK0g69YfNA3f4r5MhFjiJRBG3iNSzrRp206UQcRAEsUHov9gZ?=
 =?us-ascii?Q?0vMLuqHzxMmkXg5ZjfOCFtV0wVz3/R4uaTodR24WMONQDXEv9NtKu+cZqVbk?=
 =?us-ascii?Q?8XdY/6oMzsp1LnUFWq6zvrliX14jxRMvUxNJxvJlHIUS9bIi0KSkacsfiMwU?=
 =?us-ascii?Q?L/zOcX1gwgKGtit65OvAlTKvztPpcnOFDRK/CAwqMBW8X8FJ4qKc7hfDxlfG?=
 =?us-ascii?Q?ltRiR6OR+0H+bFm7ZJCy94nDRZjDB3CvQt5DqWGq6MfUtAzhGi1itYgFoqhd?=
 =?us-ascii?Q?0qgB4JoMgF78Csfc/imB1voBrSI2SeGXC9wZumev32tNxJw49qAA2H8IXyT8?=
 =?us-ascii?Q?uZnSRhkcKX03dCvFyhv5DVcp4ZUDwZlHluInd5WA6Pp6WiQxIhwHOn2cPfvK?=
 =?us-ascii?Q?YesoRLlugByHr6k95MbN/f1OoBDRfsK7ewhJhNtHjXGwEIXjEsJmsuAFKym8?=
 =?us-ascii?Q?zl3C/VOCxtXJewG+MuuLCHWN3YAilPX6+IXTgW/L3PpfX3myNyJBVf2ebVzD?=
 =?us-ascii?Q?sa3IXDXUph+P7Ar03A+3BBYhp5WdeLL7p9QlvxtieotYYl8HU+zAs8bmrPWy?=
 =?us-ascii?Q?Z4wTrx9UtOFaazk8km9CphQhj4JVqKMeaXdA7jSPJykhPBDPyjnCHuMLKift?=
 =?us-ascii?Q?5swJ6RC0CmB2ft6wV7riyTMN/o8nGstDWuf63F7WVEykbylMsJdAbhKdk0yl?=
 =?us-ascii?Q?vENRH0ql2L2zGblxiWn871kzTF3ylnJkQbdtTfxE7JlxGrTgrVq7gt4DCBgG?=
 =?us-ascii?Q?g4zWL7qk6uIJrWeja8DJ+gqjFoh5xB84bdFZRU6fu9qxMNpuhBlcqDyGtuAo?=
 =?us-ascii?Q?87mc6VP6Umr+OWD4ywHGFM1yQ4wiDvEj34PGu07GmMuEGMYlLT9idqts3nnh?=
 =?us-ascii?Q?n1Nay53J/EtHsyZ/rFoVy8mPM3Dhgvqd6Tx/5kXOYfLPHmaL7Uv6cCxHU67x?=
 =?us-ascii?Q?NGb9lvcAhgtcbpYv/3NDjkNCEBzCL6ipKJFvTV4NfI/x2tzKhOtfEm1kY0E7?=
 =?us-ascii?Q?kPYSLHPT5N+pICaXU51KPt1G0+4dZ9AV7GVmUZwRIDKV7NmbFViU1zcmmu3D?=
 =?us-ascii?Q?ZOhhDESHYMBCizRqnGBaCcvaHAWrGV2R/ZAi2/KNJPS1sKdnIZ9O0jwPsjrl?=
 =?us-ascii?Q?2fm1km414s6Qol38ReTKgn0n8bBni0AEprukWOzzWbB3I68IU+nnhCh3CdPR?=
 =?us-ascii?Q?uFRmvByRKqDKPR/+74k9ZNnlJYUYOAtK1UflucqJ8Tx+6wcESRvVsN5W+P8x?=
 =?us-ascii?Q?fR1eK/jLwzBwugpW6IFKR59qjy85euxDKLrCApXzRaOzk2xDrvxxfHPhtAHw?=
 =?us-ascii?Q?7qHAmXCHwo8niVKklTBmaXhl9UREHGSfv5d7TDxwkbZ+IVeLykvbu3gUqFxk?=
 =?us-ascii?Q?n0uhEsZIK8rE/uYZnsSKnk7FtDodnkufvB6/WPXMTIVSjP6aQjHRR0KTA0Pd?=
 =?us-ascii?Q?3e+RXYf/g8/JPDQ6tr1L3e81gB0p0PfQS1y2FEcMc5UtUFpm9UhY29k6eyfm?=
 =?us-ascii?Q?J/ajJJg9w4y+qbzfq5c+zQx2alqU1K0PInl6EungMT1aiCSKH/0IyxCc8zbg?=
 =?us-ascii?Q?t9c/nb7o7eIc4GYPr38=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 13:29:10.6706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70554b9b-51f3-4a22-66fd-08de4d2793a9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF403D7541D
X-Authority-Analysis: v=2.4 cv=Ushu9uwB c=1 sm=1 tr=0 ts=695d0e2c cx=c_pps
 a=G4Ko59ODCsIEEcBqcxGMiA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=4hoqlwxYuvOP6yDbeHsA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: Q3xY6fBhVE4vxIWFXnBDqQj_yoceXUYo
X-Proofpoint-ORIG-GUID: Q3xY6fBhVE4vxIWFXnBDqQj_yoceXUYo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDExNyBTYWx0ZWRfXw+tRwVtNS2+g
 Ff0oPR5z07ntCU9Qce6jjqtmf5u8TbEZNkpkSKIuVdmFFVqfjnUTq07ke7fJiNMgWUClMimAKpi
 b9+/YyftkY7qG1weq7/u3Zz4jmtKvao37KjtPtFtiI28PTMIfhFZD94ovlgLfdM369GHfTBZm/Y
 fCs2HWfIEYyi7BZrAeRvQjPnUDbaoRSPVVevQXbV1xhYNa0wQpOipZgc7nNh1YPyiKlYaNICntw
 w5DJiXUUDf7zgZXcWcsU+2ew0ASt3vXgbJK8B4cwGr6R6HWPrlvZDdPoFaljiLwc0y3w0crYx74
 sSQx75BAcO6H+Vpz3LcuVcVkuGGxOvLPfq/SYR/dLtoQRWjoW3jVkOEfjDs1aWzXbKXJs55wmra
 MKAEt6COaI5SMvs7FAK4h7eO9BwUHeQnz0FZ8OO5eCeJwWXDg7FbJj77Ffg3yn29XM6R9TLipfS
 Xmxkd4t8tOWB2eVz+sQ==
X-Proofpoint-Spam-Reason: safe

On Mon, Jan 05, 2026 at 04:02:08AM +0100, Sebastian Krzyszkowiak via B4 Relay wrote:
> From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> 
> This bit is handled by a separate control.
> 
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
