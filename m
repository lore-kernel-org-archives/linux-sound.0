Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D1B363C64;
	Mon,  4 May 2026 12:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777896101; cv=fail; b=cpNHgAn1c1RU77KsNQvHy6URV7qNYtjrqGgLyNCJizQobQkWiU1m7e73McmS+uT/0iBQmKrYjT0NaYGmRbEtwNu5bxOnHjc7d86Msh5+0KBaNwQX+eL45H8Q8NHO4xt0LqPSDz8Ipvpb0llncLgBhS0UQWZDc34DeGFTi21NDeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777896101; c=relaxed/simple;
	bh=MfPB+//LsaJ05EOSIhrBCD7jPvLwL2dCfP5YUjCk61c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Mr/kBCQ4fwpZIuF4u7lgU3o2zY/j4w8fXjVvW2PCikFm0R8fQV8jRKobdTY5390jwjvh9GNBNj/j+INGnMIYhWwmSRCyxRkdI3/kAotgGh6OETABzCRYAiOgr2ZFRYUzxA/eVQst0tgoJXG/sniJbPGsl0lkzIdI7/gHbRje1cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=q81MeirM; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yhYaxPJ4; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="q81MeirM";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yhYaxPJ4"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64460Ln42441108;
	Mon, 4 May 2026 07:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=YHEngZU/gCY7Jqm/yAisn6KcU8ImIVgw6AvT+EeKKb8=; b=
	q81MeirMox2NARTSYWXnwwOZxYABn0si0ND/6Wde1/llG1N0ghrcdR1Sx/KYRglu
	FViejHlkVXtg33SxRyu4I6GkwJcnWqAPP9AIrBI0reWuTu+ycHns0BX9JFI4m5oV
	48Fvz7NBNf8jI7LgDIkz4vlIxPCy6llmvMMY1cSkduYM+iXrCMcR6S8Zdt9/FGt/
	1/KExSbw2dQyNwmQZXGMiAd5DqYnQeWH1CoDgvWN9BcXqs5WpfXHgO4BJCx3NI6Y
	TOFg1ZBEsKCWoEOPyhTRRSK0pqDajOyDl7fgDQlPxD9Y04vOhKfdUo1xNQFCl2Jt
	+7e5OA4U7/yyKuQIgHYiRg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023076.outbound.protection.outlook.com [40.107.201.76])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dwdpk20tw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 04 May 2026 07:01:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCCRy0lnCEwTiOkHg6xFR4nIWU6rviSEZIkAT+JVlHgwxi2dLpwET5Rhj6SfMh0A3JOhDTDFqpb+WoSrGuJtByEvqDqf7ulXOBjTnSH31jTuHTN+Q3tT25p90DeNEQgv9AOjkOo9YwVaNjl2cFVFvxMzhd8GfE5RflxmA7OzEkx5Dq1R4ifTH3NCunDIn2WYLouE8uQ+ytPXGH+vElK8LYAdJetCyJEoYvPb+/T94WVTr96FezFRT7UAbbnbGCwH9uFEj3Hq3tw8Fv+4yvkOvkydbaU+C+mKKwBVFWgvtBpmjOcValXRLlYmIgahq1BdH8/MWuAAp8XrvWro76Va+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHEngZU/gCY7Jqm/yAisn6KcU8ImIVgw6AvT+EeKKb8=;
 b=hCjEGW7W7V9V8ZbHjhu+EULtQnDYfbX2iFk5vV89jBWoGRUGzHLLEQKQSVbyc/NThswWFlFqIP0jvCo95Cumo5ChptZ/srPcBtE1JnZjie1K99LWCjkO/2n/dCUqeG2AW6Xk4+Ywun8dTCTgu1Y3alISQetx+UVf+ZGfcgwndU8lCTbOi1Ljycp68+0ZWIfuiA8GXUK/YAdZsXxLiZrHwc70wbt8qqZJdFtaykkHoCYfQwlrQVC8VhuivlIwddIKaTT39r99/A8/2+2yHJ6s2KWM3wNrnrL1mC0eh2Y/CBf1WMVMFHBZEJ+4KEBZn3Qsw8eK4WUiv8AgOVoFWKMM8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHEngZU/gCY7Jqm/yAisn6KcU8ImIVgw6AvT+EeKKb8=;
 b=yhYaxPJ45nHZr6eM9SnSND5iEBOH//WRqEa8/2jpWdwAupQvbZAGse2UJCG4eiATzvOIwCOh+pHhYHCdbTu/URM4e9EhwrP7XGl9WCHD/V8cTlz1v7IMYx4Sfnn4FUMCpW2Q8SiLYsKhYK69+x1fdACpk4XQeB4rHdcY34+4K2g=
Received: from MN2PR08CA0011.namprd08.prod.outlook.com (2603:10b6:208:239::16)
 by BY3PR19MB5217.namprd19.prod.outlook.com (2603:10b6:a03:36a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 12:01:18 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::e2) by MN2PR08CA0011.outlook.office365.com
 (2603:10b6:208:239::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 12:01:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Mon, 4 May 2026 12:01:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CF35240654A;
	Mon,  4 May 2026 12:01:15 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8923782024A;
	Mon,  4 May 2026 12:01:15 +0000 (UTC)
Message-ID: <f25384e7-4352-4cb9-a1a5-ce3c2a32ac08@opensource.cirrus.com>
Date: Mon, 4 May 2026 13:01:15 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l56: Use devres to destroy workqueue
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260504110743.3341869-1-rf@opensource.cirrus.com>
Content-Language: en-US
In-Reply-To: <20260504110743.3341869-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|BY3PR19MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b69ffd-5231-4ea2-6a83-08dea9d4d94c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700016|82310400026|22082099003|18002099003|16102099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	b32oC1K0sA4gSQBl4xV9ioQSzjCCLlewdrPQho4W4mYGtlmAQzkPCRiZQCN1kjbk9uZ4JxXcxORYwf3c7OzpCJqINAql1X2PsZMovgizM0AXz1LmEi4EO+FnT96Ky35VEQ8yQ1B9Oe3rLWeaZOmJsG9elq05kzjZoFITFsj5oe0jtpNlUHO5Z6r2kytLJPPVpJ9dh0e1+208+rvBZtREtITKOL0HMi4QxUjJR1BAtZO8QWwvALDjuX3u4aRf4s2pEFAe8vvFjIiYI+kuXLuFOO44gDMP06P2UdqF5dmx4/I1yIGk4fN0/dlUBNSNWY3+yDXyGHEgyTxH0Ni3mr58c/WRNuQ+SjN9EgHDwXR1HClaQxUsSJTtdF5upOmtOpJbCAwh5rc2ACOhb9BtC/B7lkZF2JzaqJoqGPEzfcbwbeFqmG9Yh1OqChh5j2AKPqzcvwaBB9owEJlAIPsJJlhYztQ50RuJXHqV05xpfvV0DiGDOEotydtTZc8jBlumue9gM8LCONeMFFC5DlUhl/Bs7y7/vAjVsQnIj4Tot+t9PkOScr6PVUDbnKNwYApvHUYTjny+pm/GlatKJ4y+l7UZPhW+o8iR1nHUqVQbsKzwJR37wmhj29+Fai8MDMJNmZP4OeETzno6k2iuUz4T6r2G3shDSW1RVFWHIH21I07dQTc=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700016)(82310400026)(22082099003)(18002099003)(16102099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QAj6xc0LFvg3nXYInlBSajwyLsk+DWdjGTSXSj/SciBGGc9p8BYcfDm2mA7SRZqPlynAD/NNq3pDZuU/s6cW83nvfeubDVoDQa0wNKtVdLH+TxD4jLuZNty4R78fM9lKMyeo5rMELpILITtBND+9sIGUs+iq3va+RkVqZvw7oadRDZgYYyRx3BoNo8sHDC95TK9k94iNN47/ZfsNI2al3znp1Gh3rvbeu3IAH3GtbOQks87Ta7fXZG6lFqNuJ2WhNLi+F/LrF9ejwm15GJyGvNTJsWjftAIS3qXVF//XWrEAh785dKJGs/zbOj5W2ICFZEFtxZkXUmAmtVl0mwR4M6b1U/Zp+qRDUHWshCdSXouBgf7ckWzOBlN2Wb9yVeDjf9BVrapu5B9b1QEUz059E00l+aBVxj/usOu6PjZeUNpiO078TP9cTafACWRKtjBk
X-Exchange-RoutingPolicyChecked:
	cBWwAZKy5keYYFSSB4xQujWP+aKjiq8e7+Ihww7Ll6jhWCbHspyYrTiL44Bio2skt/Re9iSg5j/oW6InPDYoDS3Ndfwu6gK5XAPThboTl8yHj5WthEs3rPluzREUJ6Qfaul/yPT433KBKehkl+UyyQJMbyTM0SNkskjgdifzhTn36SEPptDSn+N6Y6o5uEf37XefwupgZP7rs4fN4LVcDj0VDIiv7l0yT0+NaQKpi8H+HK0Ni5LIrUMNddW478c6alRVHIZIy7+tTGbwp16IHvhm29Qwns9kF+HNFpJz867pXgv6EVlM+QeSGzWVl6ciuUTSUchrgtc2yLf1wIs9eQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 12:01:17.4932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b69ffd-5231-4ea2-6a83-08dea9d4d94c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5217
X-Proofpoint-GUID: Ezs7FHioF0zW9UChZ_cw0YYsj01IXH_L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEyNyBTYWx0ZWRfX5DlawX7LWner
 giXbySFBk/vaOQb82Fz/L3FW1xNldbbG0qZAGcHCSIu13u4BTiwwZPRsCJjwj1vEPgUVgCelB1p
 pdMAcnAfdkWa89kjSyY5q56LQXxjwOnofnIacwTQKoSKDvyEQWUmttC4NtDr4dFpwPlyqF6h/Qy
 5r/lMp05UloDR44zuw2HoA0imoZmIZP2SOHUXZQx/3LEmnHSy8fjUM1zrgCOJhXVP1ifTsPjjz4
 rQWHEsqrWncvbLnsaRLognkpIhKqHxghCEWP8AgrHlNVNGu4IdR+b90+gxnSif1HHRW8Yu4WZqx
 xYh3ilc4I4nbhnLk2z2Um1lstHIrwbbxmjzO4YlUnqpLZYpA5bMP3y6RnQgTb4DN1Wyn70HBP/3
 I0KIxYjWw+yt1oviLv9SqYeYjJtRsdLxxFAxXjP/zGzhfQamq1SR+08tcUnDpwpbLWbAj36S2ew
 Iie+s7IxvseqhH2mk1A==
X-Proofpoint-ORIG-GUID: Ezs7FHioF0zW9UChZ_cw0YYsj01IXH_L
X-Authority-Analysis: v=2.4 cv=LZcMLDfi c=1 sm=1 tr=0 ts=69f88a93 cx=c_pps
 a=QEJrKe+JhCFsWCDgFi+jqQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=c92rfblmAAAA:8 a=w1d2syhTAAAA:8 a=lV7Y9CQmkARg9b8iOjMA:9 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Reason: safe

On 4/5/26 12:07, Richard Fitzgerald wrote:
> In cs35l56_dsp_init() use devm_add_action_or_reset() to add a devres
> cleanup function that flushes and destroys the workqueue. This replaces
> manually calling destroy_workqueue().
> 
> The error path in cs35l56_common_probe() did not call destroy_workqueue().
> Using devres keeps the destroy_workqueue() automatically ordered relative
> to all the other devres-managed cleanup.
> 
> The call to destroy_workqueue() in cs35l56_remove() has been deleted.
> 
> The use of devres cleanup was suggested by https://sashiko.dev to avoid a
> small cleanup inversion window if destroy_workqueue() is called in the
> error path of cs35l56_common_probe().
> 
> Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
> Closes: https://sashiko.dev/#/patchset/20260501103002.2843735-1-rf%40opensource.cirrus.com
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>   sound/soc/codecs/cs35l56.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
> index 378017fcea10..030051292534 100644
> --- a/sound/soc/codecs/cs35l56.c
> +++ b/sound/soc/codecs/cs35l56.c
> @@ -1627,6 +1627,14 @@ static int cs35l56_control_add_nop(struct wm_adsp *dsp, struct cs_dsp_coeff_ctl
>   	return 0;
>   }
>   
> +static void cs35l56_dsp_workqueue_destroy(void *data)
> +{
> +	struct workqueue_struct *wq = data;
> +
> +	flush_workqueue(wq);
> +	destroy_workqueue(wq);
> +}
> +
>   static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
>   {
>   	struct wm_adsp *dsp;
> @@ -1636,6 +1644,12 @@ static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
>   	if (!cs35l56->dsp_wq)
>   		return -ENOMEM;
>   
> +	ret = devm_add_action_or_reset(cs35l56->base.dev,
> +				       cs35l56_dsp_workqueue_destroy,
> +				       cs35l56->dsp_wq);
> +	if (ret)
> +		return ret;
> +
>   	INIT_WORK(&cs35l56->dsp_work, cs35l56_dsp_work);
>   
>   	dsp = &cs35l56->dsp;
> @@ -2066,8 +2080,6 @@ void cs35l56_remove(struct cs35l56_private *cs35l56)
>   	if (cs35l56->base.irq)
>   		devm_free_irq(cs35l56->base.dev, cs35l56->base.irq, &cs35l56->base);
>   
> -	destroy_workqueue(cs35l56->dsp_wq);
> -

Sashiko points out that this should be replaced by a flush so the
workqueue is empty before the following cleanup steps.

>   	pm_runtime_dont_use_autosuspend(cs35l56->base.dev);
>   	pm_runtime_suspend(cs35l56->base.dev);
>   	pm_runtime_disable(cs35l56->base.dev);

