Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC21331D381
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 09:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011554; cv=fail; b=K2J426cFf0lASxiuH6b3Gt6e300WQUhoTsooLXIO6fk4jmZb3xaFMn6VuvZPsKfSqbIDb2wZueyB0on5DwoM/2V667MuwrheMa6/9ACOOU60xYLM+o6IQvhvGabdgvj0VLaFkAeZWpVY0FO53lyguvGrlcLRlZhMR/nvGlZT0fY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011554; c=relaxed/simple;
	bh=au7l5irb78P8J6R8L5s630D1F/s+mvBr7WI7Bo7nSjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kCR+aVkASf42ZK3JUslwJXV5DbZWkuKnNpicb9myXCi5tAnKPTvYuDVmY6cGzv4OYUAMBFGAwrMSdmE+GoKUDW2ETEfo1FD8Z2Mv9Zx3C9JV/Sy1Xt2I4ZuQv5xVRFGizS9sWHQhdDLD8Xb/FYXegegQt2J9mlZGM5A39BFEwuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=csNSieOF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=rvk1Pids; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="csNSieOF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="rvk1Pids"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P4lWej2255655;
	Wed, 25 Feb 2026 03:25:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Yx13/1BRqemcg637zE
	+ex8i5zoK13dwGI5d0kKARwzg=; b=csNSieOFuLs1FQq/OwVafNYMThYr+HcWsS
	fxkFEnW07JmMDOpFah8E7Ko+YfKE5x6zbUL4xzMjIdph2df3I3yPDgDvYRAVHffM
	QXZGPf+D6N2FNC0Ql9kIBF0UywXXd5zwuOp4nYjANfaWSL6dKS5LIAqdU15X+KCW
	5FPSqah2HHLYJwcoxDtJ5f/IUrSRB/sMQD+FuTSn1x5W6Hb/nYCzstERgIvvrkgC
	QPp2+8D/FRYMitoCSPIDHkhPar5ABInDc0CHwWU++yXSUIYAwXltWIpjmupDcQyA
	oCLrymdM6jP0akyvtyNeZQZVMKzi5whg6RNnsq54F3RpEPQJ/0Cw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023140.outbound.protection.outlook.com [40.93.201.140])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j45q6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 03:25:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eE+LtvVagPJ65wn6sBYRC0EQ0mRfMcpk1GqqTg+UjHHBqiZxL1OWNJa3y+dtXQYx67vcTm9nF0e8vJVCV02Sxiukiyy9FPsg7SOXvGuJnUHKRGxkDeRB75NJ1RUNH3rF1Ibhrop0kePLS/5eXaWvewPSpt9CrGzLY7DNbnMnqagpPE6kF6UW96V7ZZUAMOrZM/5hu+luSFv9vEiU+hf3hKn7lIiZc/xlmKAaoveOrd216tgbijKbQml0FrWq48idEoHsf/Yn7+ljaFdalbLzJYEbarXAAuBIY6iQTfxhbwnoK1ZVXZo4t+74iOLTkNbO9QiOgSpuQtuMuGk7FWH94w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yx13/1BRqemcg637zE+ex8i5zoK13dwGI5d0kKARwzg=;
 b=Y5cbcDFTpEU+aUWrDPShPX7ZGXGjbqwTmQYKgqSY7artw28ChtzsbjaQOqGVDORjZ5yI8Ycc5kcYiLd3IsS38SFPqJeyVN3HFO6dwTdysnYkCs5SixWAFOE9wXfhLRlDqLKKOZVAfPJ6YUmNOBeqw21f19UqpzkzezAouiq2TQSHS5nhlu/4gWtgszH2rwcGge92KSAG/Ur92fyX9gIHfmyxs2LkHkkniHTM0rB38yXLuHHNPhbn2e+WMGcH6+h3dhGPWO7+oGtPc5yHVkBuGtrYxmpG6RMQKzDpWAZBwMvXGmy/f7dcKEfkHUtClM989M97KpSKQNVHr+QFVktfqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yx13/1BRqemcg637zE+ex8i5zoK13dwGI5d0kKARwzg=;
 b=rvk1Pids0q9NeHGNk2nbJyEc7VofEaZM2oV7gMAKGOvGsTN6L6maTLE3Blni9iHUOtlDbQjYQJWKDUPun9JFxA1ZYe0aKXXPXHboiNOHk80ClNdG+mdTBoxLhByipeDuoJ5ISINIlMSZ8kqylS1cnWvahPdmA/3PHxQHn2knBuo=
Received: from CH2PR10CA0005.namprd10.prod.outlook.com (2603:10b6:610:4c::15)
 by BL1PPFF6A2D9BA9.namprd19.prod.outlook.com (2603:10b6:20f:fc04::edf) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 25 Feb
 2026 09:25:36 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::11) by CH2PR10CA0005.outlook.office365.com
 (2603:10b6:610:4c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 09:25:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 09:25:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AAF30406540;
	Wed, 25 Feb 2026 09:25:33 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9277782024B;
	Wed, 25 Feb 2026 09:25:33 +0000 (UTC)
Date: Wed, 25 Feb 2026 09:25:32 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 4/4] ASoC: SDCA: Pull the Q7.8 volume helpers out of
 soc-ops
Message-ID: <aZ7ADGTN7D3X9oC9@opensource.cirrus.com>
References: <20260223095425.3905703-1-ckeepax@opensource.cirrus.com>
 <20260223095425.3905703-5-ckeepax@opensource.cirrus.com>
 <e47acf64-15f2-4cc1-8c45-6c0a101a288f@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e47acf64-15f2-4cc1-8c45-6c0a101a288f@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|BL1PPFF6A2D9BA9:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c4a96f-b3ad-4856-ac3e-08de744fd49c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	c8y4uVoTHegZ3lyCeHZJRO3cFfTtxw3cj/Z2rMQkhVClXxho1Gh30kA9y/1iHheEWe5DJfV6caj4moFDIfA/FdXYBwMbmF7IEAdIUbpuFex5hlCNluEcrcdGQs8XtbTZK5LWQTAPDM7C/u4nrfFYW3aSZTrrLOVm05s3vKzH7jDaWtvpEu7BK8JN4GOU/as87p5UYtvkTTXMEpgFKpfeMOzFIlyPsMmajjMnkc8coDXc/ADOHf2k7+LDWTTKjEG5m82ZyiwLGyA7VPxfNkMINzUc09/4sgvA/99PrZcfVQdd6rKopMCcs3SCuE7HLzzPONFoMaSdQw9LTOXCYtoXdaiEw2NhmV1+Pu2FPFRfPC6oG6DyqEuQhitgeDrbLTAQeQukB1U/ronNA2zkZJxErWGrQKFbG3gEHERyjnzw6wVzrZ9ZyHdnoL8rAU2ABQtbOdD7L3bZ8h22tuNkBvvXOQU4nzffXQ6rNDoG5rLYo7eI/WMvtpNCp2iuwqNTCWUsR0L2QL9445qCeXlPEMxRQJuQ/xN6S2lx3CrgyYbul4UWwykDBYUCdUwO228GLTtDY3qQiBfYmfnRxxlGs/lCZSy4smllBarapq706RNf/kYOE1gIxqNAAF46JmT7hgzRLoGqjIXnTw1rcFjszv3ohoucd4bpBH6BCfHL1ptmymvT06r0dEiS1ygEfYMii0eNbIIQhiZMaI2lz4lwrNVEb3esEySh+Mhcij36WQ3sZPnpnIe4s3XlABoDBbK94qPegu9KS16WkY6fs9TxRuzaKHI2my20I95qWhaDr9f7nJ7JuGiNLWH31L5AeGSEJZ//
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YysABJTQ/FbWASc4RllqCCy5u8C7qDTtzw6SwsFaY0u/MDAtsrRowv0Q0Y695puZlQ0M4PSWGtWL3yai7gr3OzEsaOkcM6wvI8I9LwH/S0rM5uApbkWN9azCn4Uv5UiYH5yl4jdoqCIlWrsLTey8eofJJfCYE5ZfRQCw7yoHGu23bXMD55AnOBiM6K1eH76S1H7yJuNN5zkk7AF1KjJoaauTBx0CFdaZxDkJ3jMxwvJ4Y2dVVebOQxCskUzTgO0o4z6uoBN/XV6XQ4LdEzzGCVn1t17FYBPn1cGmPujpAZIywAvYDj6tvJlcvrE7RZahZkuedA8cZaLX/aNdGLV/6qVqDng5qXJlB5YXbY1NZWpJkbTb+3WqdKptEbWk0g138jLTELS1Z1rb18M4aaydsj3A4JAYsnO+k769bimNcJfn19pF/Q6S+ypu1p/iQXbD
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 09:25:34.9150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c4a96f-b3ad-4856-ac3e-08de744fd49c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFF6A2D9BA9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA5MiBTYWx0ZWRfX+ac9CTeN6Ore
 sZF51Ra/jtnIsl30I2g5SoDceSQR6pPgycvkpjuCAj4jJV9pW2qkYkXnUBMz/0qL1N5ZCctq1D3
 5dSdVCRvIhDMPyE1WrbOAJnDpblkOCY1QASSdLLLlWm4+a1thphr86hy5mSc0Yk4hbTDlBMfUPD
 J0+UDu0MzffhslrMEHrrJCD0DKzgVyR/Z9WHSvGLCVwwySe8/SU1Xa+viMc4bCZfVY2LqxYFXBD
 qWSXeLsklXuYF5292AADvWNPixoz8glwFgT5Um/LwEZB2zpgaw78M2nnQ9sPYIfurGGh/w50u1F
 2kQ4RKD31Vvigu6Fy1i0kDRk/oVhwRl9+BvNEV74Dte0c+ZWHsWKu6t7sRgFhEL2jGNVD3BZz6P
 lVGL+q8fMOMREXjV4WchOWt2cbdhak22Hfq3XP1UL/mlnjrq82NGMbSO94Suf66ceal/0pS2e1R
 3QohuJsjzqSUQU4vsOA==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699ec013 cx=c_pps
 a=Yd/70bDpgrqg65f6KmCseQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=xYq1dOmx0hGuFGWg-x4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: MxkrSxZUvvNfytp5gOpKinFLJxPUr8KP
X-Proofpoint-ORIG-GUID: MxkrSxZUvvNfytp5gOpKinFLJxPUr8KP
X-Proofpoint-Spam-Reason: safe

On Tue, Feb 24, 2026 at 01:55:16PM +0000, Richard Fitzgerald wrote:
> On 23/02/2026 9:54 am, Charles Keepax wrote:
> > It is cleaner to keep the SDCA code contained and not update the core
> > code for things that are unlikely to see reuse outside of SDCA. Move the
> > Q7.8 volume helpers back into the SDCA core code.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> > @@ -226,26 +203,17 @@ static int soc_put_volsw(struct snd_kcontrol *kcontrol,
> >   			 struct snd_ctl_elem_value *ucontrol,
> >   			 struct soc_mixer_control *mc, int mask, int max)
> >   {
> > -	unsigned int (*ctl_to_reg)(struct soc_mixer_control *, int, unsigned int, unsigned int, int);
> >   	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> >   	unsigned int val1, val_mask;
> >   	unsigned int val2 = 0;
> >   	bool double_r = false;
> >   	int ret;
> > -	if (mc->sdca_q78) {
> > -		ctl_to_reg = sdca_soc_q78_ctl_to_reg;
> > -		val_mask = mask;
> > -	} else {
> > -		ctl_to_reg = soc_mixer_ctl_to_reg;
> > -		val_mask = mask << mc->shift;
> Still need this line to initialize val_mask.

Thanks Richard, will get that fixed up today.

Thanks,
Charles
