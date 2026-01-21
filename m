Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6393F23C2
	for <linux-sound@vger.kernel.org>; Wed, 21 Jan 2026 10:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990748; cv=fail; b=U/Cg+dQQbG7LAdm48+3Y4bVmxrjASs7y03DgVmU7vCmylj6x428hf5a8OQrLpTwNZQeS03MNkeqt6GL4bH8m0cCxmVSqScB4+NfPIpshX7FOCTx37VwJZj97HaS0rXPPVOTN6tt8E1I5jrYA7JC4Wf+NBtsZ7onG8cj7qB3WwA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990748; c=relaxed/simple;
	bh=u9ELhMHKB0QluD3dE0SnJdJcJJIQO/oTiPFFSH0KMWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3F8+9MpR0CBiqqS1yslg3l6FGabDI6Src5j3lyssyiW4gIkhHwp1ivHomavZU9l2cIQLWhT9yglyuPMg3TBzIQidRenb5xBJndJBH2i9h0eecLYOBI0DmldrkR3IbLZ5vA80vGLFz1KtV4/lhhWaY7dPv47REgvXeSLW0zcydk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JkX7scZN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tWt1s7gE; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JkX7scZN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tWt1s7gE"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L4V7u43888660;
	Wed, 21 Jan 2026 04:18:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=QEI6lcuP53WFhZH5cA
	YFID6xqcdi9dC4l6JMuX6eeXA=; b=JkX7scZNDFtKgB0TRP2/FBKw57Efp+BYuq
	YkxCMY2pjyn6u+D0oFaFBXbyTyTwdiGaYSbTfvgKXXkz5spID/UkzMJKZiXThlHf
	LKipGUKtJOUNSVuxEc0t1uS3isoHYl7JGNdntEo4DztTqcBBJNo2S5rw359QvqQD
	4hgtODoMi0s0OP5bZ1toYe7ohP1FKLT1OpxWw/InTiQdIcQkiRnd9s8ODyBJ/rb2
	1u7i19Rw+ASCB/A2w33TCc9aeqn1LUT70RIRm+LPCDIRL/z9NXWSfvB/eQMjj8D2
	yXws81WMRpHFWbrNWjFwgt05OPNIIMjfHX2ymsasq5KOs80PtZ+Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021141.outbound.protection.outlook.com [52.101.62.141])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4br7qjvmw8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 04:18:50 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHGcjBtQhbqGx+EoQJnW/MwFN1DPKv1RvQm0jMQ/H0yep8HcCDIskcLxJ6ve+afoCmaw9BclPOdt+TnDsTTPDBrJhjW2GgqalbhjOkV17Qqzsh7uox6UrXdgIozai2WpNg7hSrFC6pv3S/eTjKndE3U+KfaNXqBfJ9qFWfDOhC54Biiz44GacJMHyQ7K6h8D37dleQcb+n8rFv7/os2IezRLJM60FdtU3OCpWxPIowgJxFMBN2TwI+IU68eXactQ0m0+Dr8b1qQAVMhKkOvp7viMNnbvpTSzsVhPSzAb9aJlsxKwwBvGFL3M0jK1O5/kLMh1qoiSM9BgP6+Og3l0Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEI6lcuP53WFhZH5cAYFID6xqcdi9dC4l6JMuX6eeXA=;
 b=r62eM3vwAnM/Mpq71Mu5xaqiMxznzrurQY4uhhtcTo0JBSrhyFN1ugF/CI6CTl9eyZGslMLqcygJeng+aBrXi8HPFDc5FsssBQSduVD2USU9sS2sW8feyG0dxs4m2R+0GAFX6PqFc5dItO94/cSUHeSLQEhxSgY3Xf9LUNO63OhH2ETi5WDXmpdWjx/3PYvkdI5JBDXEeoCVuEdkXWJ/Crcp325xJ5XqfbhrhV+M4i23YjMgSD7H3a5GymeahAX04dZSHJUBsPcGyvRPDlzIcBeFSql/hYUqI6bkopQNhRBq18vmlkVRQdwZaNMPdWUnbVSfcglb4G/WMEK5W07C1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEI6lcuP53WFhZH5cAYFID6xqcdi9dC4l6JMuX6eeXA=;
 b=tWt1s7gEeKgarE2C3jfT7xuCaAQXmcnDQBPz0ApCN0/aop8HGPTfZRjdAMWVNfaJ4uiHkS7GLDppC4MUxue/R20jIIT2HIBhizFk3E5c2W3aHw5Vredk15GB+qhPEtEoO6V5olfYtwBiP2J21Y4lcCSNTqF2qpNkHZN/e8ylfUo=
Received: from SJ0PR13CA0226.namprd13.prod.outlook.com (2603:10b6:a03:2c1::21)
 by BY5PR19MB3841.namprd19.prod.outlook.com (2603:10b6:a03:22c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Wed, 21 Jan
 2026 10:18:46 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::e) by SJ0PR13CA0226.outlook.office365.com
 (2603:10b6:a03:2c1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 10:18:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Wed, 21 Jan 2026 10:18:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 39E4D406540;
	Wed, 21 Jan 2026 10:18:44 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 25E64820249;
	Wed, 21 Jan 2026 10:18:44 +0000 (UTC)
Date: Wed, 21 Jan 2026 10:18:42 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Cole Leavitt <cole@unwrap.rs>
Cc: linux-sound@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com
Subject: Re: [PATCH 1/2] ASoC: soc-ops: Fix clamp range for SOC_DOUBLE_SX_TLV
 controls
Message-ID: <aXCoAldpRqiGHpG9@opensource.cirrus.com>
References: <20260112031329.17088-1-cole@unwrap.rs>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112031329.17088-1-cole@unwrap.rs>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|BY5PR19MB3841:EE_
X-MS-Office365-Filtering-Correlation-Id: a33385dd-6a03-4922-b565-08de58d67635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014|54012099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IWljDB5y3UWK8HpF6F0woatNZNkIQkih0lWDqm7vqkalT1i5QHuxBdw06DsO?=
 =?us-ascii?Q?C7Bi4jENQXbWDQanNuzvUKzvn8fPGjDFyYJzZJREPn9a9KLKaADAXihsL3lm?=
 =?us-ascii?Q?9jqIrig/QM6Rzm94qK1zz3bLaQLcZ7wwshVwgkY7zvEZcvfli3BxZOIgTeDh?=
 =?us-ascii?Q?MeXEVl/S1pZbFZQCxxMcR/LWr0gQdlFJ9W+XIctbUk2le334Lko4w7xJ+iud?=
 =?us-ascii?Q?I7O74s7WaAubP7T/6qfEYAWRT/4WNNFd+kxFxhQJZ23Txx4LqqBIXcBYrBlF?=
 =?us-ascii?Q?lo+dFOktB4eoywvV0+C6q92vw9x6kPbVRsZ0jedbZcENsJWkXteZ8eFjiCic?=
 =?us-ascii?Q?yUazbwyBo8NWrWI/hT2vejf+Od5XZM6hYtj4AvITQW0CRBSdpXFd3AWx5R8H?=
 =?us-ascii?Q?0gB2sCFjcxNcSVnrLTiV6Q4G3fnfLC791H3Ju4Lks5pGsZznZozKI4vBSksH?=
 =?us-ascii?Q?KNn0a+XqQXT2djAyrgrjtTHEiUt46ZSnePPySP8k701Hp9VF9X5Q5N2S9ZjX?=
 =?us-ascii?Q?SWpmtFcG2QWt7p0e7XAhNTXwttAGSHBxcw5JvbvpqfS3ravPr+u8BXY8aaJR?=
 =?us-ascii?Q?63EVW0yRiXcVeCzklgRmWu0cvoRv48+dx2BiOcruwKVUgNtvaNyzUzeCJ4An?=
 =?us-ascii?Q?0DD8Ieo4jyKte5opjdr+4k5Scaloj0rA2b9pH0PLNijrrWA8KP746FqcbCWX?=
 =?us-ascii?Q?AtnjJ2s6TmxFYwAQkvz7l2q4XZoYbb4X3emP0GhgtpDwIBdoA0x9jpankYJe?=
 =?us-ascii?Q?Z74cnqq1PQQPVBMGHQKqaX/ks+oYRPYmW1zPD3qCy2ze50HWwM2WvOuhz98F?=
 =?us-ascii?Q?vYSM19ZvK+phGL+UNu0czFBX8rmyeVbAM3M27yhVHVasGS0tsjHThErvFp+c?=
 =?us-ascii?Q?uCKJEw19s+8jJGlYTINPvVpKSNxjdYbwszKQ/mFgW2zGtpSY/Hdc6wglXWWa?=
 =?us-ascii?Q?ukwowDvc0r0x9JGTarmlZxfaQdL+kDdjAQt+1uwOmyW3fkAnmWXoOBJYU98u?=
 =?us-ascii?Q?FG0XEV0UhaFtOXRjC/6eWcXxuchHkmQLQswHiyVEkegiPLFRFLgkmdmP+201?=
 =?us-ascii?Q?5hWgd1XyEZhwz7UHUnR3XbydjH4FnDeZlZEIg3oRUWKehgYk302Bkg5gmv6m?=
 =?us-ascii?Q?/0vA6iArotjLyvYX6C9aXGETe5pUF+kaOSyE28LAE9l3oOrkhVTO76rO49mr?=
 =?us-ascii?Q?dASN2+aCBZeS2SzCypYe+dfAXIfPUODLxUuDz4W9l2V7ybXvfCgnp2PhZ8dY?=
 =?us-ascii?Q?joHV3YFeABupyHHxvGb29FO+14VWIJDa4O4POiwqPDSI8H9UwAuxN/H+T8WW?=
 =?us-ascii?Q?RUJKsZTiZfXdJGCoZ+MKJstMFsc+4H99F3OpjEwgSlrOV3BYHwUeY9Fh2BJb?=
 =?us-ascii?Q?bk6gq4XqD2J8U7abaeWM7m0sCEqRBF/Cx0N/E5ncp7ZrGKMNpKzeYWI6EvP5?=
 =?us-ascii?Q?LZp71HHFwwPYtJT+WBTiRC37vMqO3UlIXYOIF2omFvKR6abZkNWyQZAsDmKB?=
 =?us-ascii?Q?18S18c/IpTcpgBKLJ/2le2E1y9mNIaayLOJeZtYbFOTQFzD4BxnzYqaOFsDC?=
 =?us-ascii?Q?d5mgZPo2T0x5BD6lPIg4HUqxAw9UeQ178BKqCpDuXfI+z8XSH579UCbk/6vu?=
 =?us-ascii?Q?N4jxm89owHoxQvhCHdGyZaDXxs4kAqPYc78wLbTEDYIlCOygw4N5hnXj3x1r?=
 =?us-ascii?Q?DEdzOg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014)(54012099003)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:18:45.9413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a33385dd-6a03-4922-b565-08de58d67635
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3841
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4NiBTYWx0ZWRfX1geGt74Wsw9u
 ak7bbsvrAlvlXlxIeOJEuq7fwCrklCToQxPz+rEXKzyy+bAyxqzJbTL5lO4KDkgQzXtSOII0iaF
 tO1t6ymFDM5ftUvC9ed1QGb7Ceijzd0i5MiOwIZl4PXod4bXyYQjsYeF4Xzj7SQgnMqG1S6QcFu
 9dnxb+Qtpg6uR97AQHwAtZNPFtiLDoOBUzITcVgHW+9dPSsGhTNirNsRquy+uxqBvsR1wn3AXMH
 TwCR3EHKYj52pWDuNHqH7g9dKt4i5jahEnPcUgQl3x3grwSr4cNtcs2n+sRRvcYn+n8R3TDPAKo
 7cwvpdNU0pgSeUWv836MgpPzx/jalLBiJlBK1YCApZQCNvnSkFeOAxamvH4qYtIoHPKKc/l9F56
 olG5cz/2dwWrZjz2VdkK/nvFUfbhKqjJhnCISF0kewet7FPSk0LDLcIsYCVZv4RUGR+uH0mbpMF
 FvUPyj4VQRCW7SPB1hg==
X-Proofpoint-GUID: QYYxjCZcM-9KQ_pE5A62wP-kx1LDxACc
X-Authority-Analysis: v=2.4 cv=GrRPO01C c=1 sm=1 tr=0 ts=6970a80a cx=c_pps
 a=YwNxXrBOkeX2Yvw65jHa0Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=ysCPWlJ6tARuPX-pMoMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: QYYxjCZcM-9KQ_pE5A62wP-kx1LDxACc
X-Proofpoint-Spam-Reason: safe

On Sun, Jan 11, 2026 at 08:13:29PM -0700, Cole Leavitt wrote:
> For SOC_DOUBLE_SX_TLV controls, mc->min represents the hardware register
> offset (e.g., 283) and mc->max represents the number of user-visible
> steps (e.g., 229). The valid hardware register range is therefore
> [min, min + max], not [min, max].
> 
> When min > max (which is valid for SX controls), the clamp() call
> misbehaves because it expects min <= max. This causes the control
> read function to return incorrect values.
> 
> For example, with the CS42L43 headphone volume control:
>   - min = 0x11B (283), max = 229
>   - Register value 0x1FF (511) should read as user value 228
>   - But clamp(511, 283, 229) returns 229, then 229 - 283 = -54
>   - The masked result (-54 & 0x1FF) = 458, which is wrong
> 
> Fix by clamping to [min, min + max] which correctly handles both
> regular controls (where min=0) and SX controls (where min is an offset).
> 
> Signed-off-by: Cole Leavitt <cole@unwrap.rs>
> ---
>  sound/soc/soc-ops.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
> index ce86978c1..b28fdf238 100644
> --- a/sound/soc/soc-ops.c
> +++ b/sound/soc/soc-ops.c
> @@ -148,7 +148,7 @@ static int soc_mixer_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_v
>  	if (mc->sign_bit)
>  		val = sign_extend32(val, mc->sign_bit);
>  
> -	val = clamp(val, mc->min, mc->max);
> +	val = clamp(val, mc->min, mc->min + mc->max);

No, this was discussed here:

https://lore.kernel.org/linux-sound/20251217120623.16620-1-peter.ujfalusi@linux.intel.com/

And the actual fix was merged here:

https://lore.kernel.org/all/20251216134938.788625-1-sbinding@opensource.cirrus.com/

Thanks,
Charles
