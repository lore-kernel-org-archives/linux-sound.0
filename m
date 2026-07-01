Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501D13BFE41;
	Wed,  1 Jul 2026 09:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899214; cv=fail; b=e0uidpsbnu+uMJ8bZ4pQvi6Q0mSow/kMzdFoFHZaolpMq5nBxRMYZMrAi6pvXaE9SCMqdwIkG888SPFTLie6VvwxySM13gFvnFkk0t50/IB1/BXtN2N9rX24Hln6jOJjOq9RZ4IGuP3cqYWZ1XMh3AJeqwpW6uHSODZsbCD3m4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899214; c=relaxed/simple;
	bh=AeBwOMZiMQHjDblUvrOPVu994s+fxiFLr8G7zVWwS8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mm2yKqPM7SvwHR9sWI0+ltoSSa0BZWdytWMQom0E/KFyjjxf5zT2Vt6hLHYUaf1b120ix921X/+m9TCFWGJJx7gXBTawH5PmJjPdaQsqr/wfiiAaeH1giw51I6zWc47y/Jv31Dw7LcGmZJoVchS2C9oYfiJzW4ZvvvPwiIUCj2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aeznNAVW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cyPxJ9KW; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aeznNAVW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cyPxJ9KW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615Ga9W1082044;
	Wed, 1 Jul 2026 04:46:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=FNMWvy6R9Nn54j+YmF9pYP0GKA8kWFP37NIA7YAP3pw=; b=
	aeznNAVWKma/jCniMr9+N0d/zifvxA4t96qKLPVs2KRxkA9lVZRUEP2vily+qydG
	RtxrElSqm7zlmmGxYeMveNf17dgFk1cG3fYKYmzR+cb6s3Ixhx54eBP0rKhY5P7O
	+urWrvw1DxMdB/hzTsUH5Jas/HOtOTtYMxHVCKLUu7YROyaN7krdnKnTGmBLSbeE
	MBP+lCnvkJl/C+M9qIKIeFrpyohOMSiKpIkQTsN3iKV7r0xZlfVQ6hwzV2xIWwCt
	IMFB9dMrR6HCBE/SW7Hady3hzf/usTGaV9NoG9X0tidzJve/WTn5rn3ydE9fO4N2
	rfYWoT3W8fCsJ+cQNLikEw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022122.outbound.protection.outlook.com [40.107.200.122])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f4e679mq8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 04:46:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIvS+VTBkEZl5ZrOXx0Jz31gaOzRiMcv7L2YG8qkurlvk8G975/ZUfanPus3PGbQ0Ro03s3r7HBgAqxPmBf8HJBWfsiRCPG3h/0qPknw4z3b05CKkII1k19p+s5LO+BJSrNXYnlnFARZ7jM2rEfkOfUnIpmkOVhlNZm4PtUQ+TY0oWtuV7U1pFIwNjbAeiqevWP7UhKaqTlpwUlgmonidO70dhKYV0WxOqBx/KLJyLWqwGgEnw/BRMr+DVY1rcl6nCN3di9Fvk7ARXDB/rs7O+TiFHGOb5UiA0poyclxaCbjSs5LviwHWOsEea0Fkf2Vsal7GJZC7RAoW9xqTSMOXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNMWvy6R9Nn54j+YmF9pYP0GKA8kWFP37NIA7YAP3pw=;
 b=Vn9jJwr/CoqWu7JcEEhh3mN7On4s/+ORp0YP8tqA61Qhpsi9ZNaKCtxDLKt9hjl6nsa0ctwdM3hcP+8GCgVCBAf2GiCR//Idvc/wL0jz/Uf4/PpD6nVJYpLpJgpBRMl8idD9vGyyzh3lV04foRe05qZRDufDxhltKbjdkJ2WDGJpnZhJPxcHCsk36l1UKomcb8ClN/q7gFFChIq1ervSr5W/L5Y8TBMlUFELD3FPsNZSFt9OUuYx2GyYRZ8HDqOKwJsoCgQ3kTCuS0mxQV+lXrqVnfC79hlVjgs44bBlfRoTTuGX2OsycTvwAj1lC+RHWIaOohIgVOMX0BhFL9verg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=163.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNMWvy6R9Nn54j+YmF9pYP0GKA8kWFP37NIA7YAP3pw=;
 b=cyPxJ9KWKta0Tl4g9bLryl4Opnvoq9JWFdUveMn83OT0i5+dOoPIJUxJiWT/9rX41pN7dk+NpH7S/gEIgDaGrCYPROHq8aHeWNJIYGB6HIHyxnPbMlvA44V6V1ZA8i3o+hIK4lgOfN7cF2Zuo7DpkeLbfoMLNvtSmrHXuUH3AFc=
Received: from SA9P221CA0028.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::33)
 by LV3PR19MB8477.namprd19.prod.outlook.com (2603:10b6:408:21d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 09:46:20 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:25:cafe::85) by SA9P221CA0028.outlook.office365.com
 (2603:10b6:806:25::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 09:46:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 1 Jul 2026 09:46:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 70AE0406541;
	Wed,  1 Jul 2026 09:46:18 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5F332820244;
	Wed,  1 Jul 2026 09:46:18 +0000 (UTC)
Message-ID: <32d2c13a-25f1-4783-ab53-b59ff41940a8@opensource.cirrus.com>
Date: Wed, 1 Jul 2026 10:46:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ALSA: hda/cs35l56: Use scoped_guard() for irq_lock in
 cs35l56_hda_fw_load()
To: wangdich9700@163.com, perex@perex.cz, tiwai@suse.com,
        wangdicheng@kylinos.cn
Cc: david.rhodes@cirrus.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701065108.596046-1-wangdich9700@163.com>
 <20260701065108.596046-3-wangdich9700@163.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260701065108.596046-3-wangdich9700@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|LV3PR19MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c3add2-7e1d-4c2c-4945-08ded7559ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700016|23010399003|82310400026|16102099003|22082099003|18002099003|4143699003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	Bqzeq+lsT7XLNxDZ1YqNp8c6B1DWDGalm6kCE/c0uDvJoE4kM3DaKKzeLXwdDyly86Y1t0Hk9zoxwwbZjujtZclZb+WYDXLqwQVjOClS+Dnd5+awiHjrqzjge+66RNJKFMwsdwjTMEpLXMgRu882S7ACHyHlGKx+FEzO1t8owSlpRnPFOA/pF10+tYyDR3T3maD9HOmsRUNlkfeMtQmvKpksLc0FfW33AKTq3xmALfKb+lYT5QmLl7bLffU5CplOsdvRh5TEu6j0ilnABcEXMN05217gun7nNyF1+ot3TSyu22AwbCGHvMGPWp93K93D7HCzBymnd5GBfkc6a4t+zlYJGZV/MhZ4QDNIr9hoaHgfcEPe3c3pOK2NVd8F0lDsEzFP9KCFK9FIGpgD17BKIViEuu/uN7oJTYJVvG0/mPVuqgyr7RvLiy4AKvjpIYEd5BSeAictADB677xp+oAfTo3DOcOx66jwBn/oRdL7+3O60m83cS2wF4kYWyCBvxsdJpNHjURVXc/8IVjD7wHJ3VkfrCQl58EuUpCiukRvQCdVFmfytSn2ii985O4Zko1srEqYAdAWokrbiH5fGe37QR4Q6YTT/oWvRs4qrfpoHzNPjqhfU7pEodF8qk5nVze4wuXb8FyjLnhl5tKMSbLHgmYjKot1ybtkp5txEl9O3sQ/96uYYGZNfhiHf1nTtRfueClv5KE0SKj6lrHeoDBElg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700016)(23010399003)(82310400026)(16102099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MKlauXAX6dBM14ddQ1kvBGkGTKLumAHyx1ltG1UrBPI0ouC1crCwimmf4YHDewKeHnAcrpdTpeEYgfZAUbCiIuO0C1Tz4u75zgkIvJKwqHy7d/mKF99F2W9UMMAJqtoHBimicheVMkyBVxDZrRx+FgRzKWo0cg2pJNIBPysbKRKKKM9r/OpkVBAtMxV4VyBcdc/jZizCfZ10I7QaZ+/NB9DU04vtNfyi5TLB7p20twZQVRMNBpwmzpAeBrPEIBokoNlZta1c+95PIbm9ZOkRpktt2nlu9t+NQtvYrzUbGUinXm/07vlOzj+jiEVQAFTn4YoCZ2u2efbaQgxI1eniIL/fzVZJuC7D7lBlF3MliJOy35beMD5MDJ+nz9uaN8bkUG32m24CMs1NvD5tp2WUpjYobaWxzL4K3yTeJiSZqSaLkfamBTmGBCC+ztE5GwiT
X-Exchange-RoutingPolicyChecked:
	JqkMTeTOZlVhPLOIkocvOKF17Nlc6vzH5sVhwxHaVKBvN6W//7bI27yNwd6sELxf0swgaacJ9oFyDU2Hglkd5JhBjVOEtGOVEo6YygyNXjYcLt4cFinLzuBlDUFPm/WBA9nQlVPauQQrTzlfFcJCl2BesItr7pC9HwypY/0z5qJaL9mFmIwOL/OZNkdCiTO4wSR60xcM2Nh3Z9KJEXhayTqVQUObgVxq3aLWl91VLhIW1A7AgRTZ9un08lILzEHvO4zvMB6IyKsv80nlLmBVvAy4Dagb/91LgL0RYzarRTvdkyjyLK08BoXgUZ+AOteFbB1mm0M0OwZTySVQ08Igag==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 09:46:19.8336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c3add2-7e1d-4c2c-4945-08ded7559ab8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8477
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEwMCBTYWx0ZWRfX3SfGPK2lmXjb
 7EokAY+rK9eN/R9Q2BIOCjQdPoIneJdCKKYRCmHFZPSbLxMZG+BeuoXZUo8HsmSiB67NSzmPsFY
 8TCsJ+rYGgA2hY203RAzvJo9M+FlWUY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEwMCBTYWx0ZWRfX/hYytISdpEj6
 8Q1XJJrVKM3yN9zPPxiw61pSPGsAQ6U5RbyvCXneSfJWreyhevTG259WW0/5h+9mPJxfuu9D4CF
 JS0i8N0ErsfI6ohDDQlrZiGmbuwYJqCe6zXoebkse79SBQ0fmuNHlDqpeS+h1HnknXYCmI1fjmA
 ufqzhDl+fsbaEYHthFkIXxpr1DB6cqjEEuOa10b0nGMI3JVaV90GW6dFSdBmAtvnYXI0dooa9Hs
 Iijc21r90pbJCFLeaar87vo9hE2J98kVZknXzCYuiFNo5Y203IqxzlMuN2N0LfpeatPdZI7qwyF
 62m4NarlVbXpSWm36J9DSN59u7I4HcvpFt2Xx0Fko+ThSkeniQVfEECZy/rjq+JN1ybIwh75WWU
 hoUpAZPWf+VMVP1DHi6bAcDkyZxjyc6Cth4GurtWvYpFlSOI/zM2fKPCLld/9OvzalVhhZHjg4Z
 uI9YMCuI35wzK/roNFA==
X-Proofpoint-ORIG-GUID: o2UzzxkG5nS0ErZeIrn4ifEjHkqjb5HO
X-Proofpoint-GUID: o2UzzxkG5nS0ErZeIrn4ifEjHkqjb5HO
X-Authority-Analysis: v=2.4 cv=PrSjqQM3 c=1 sm=1 tr=0 ts=6a44e1f1 cx=c_pps
 a=jsJx5cRpnMcsqjM19+T+dw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=Byx-y9mGAAAA:8 a=9wctomZQMzHt_drke44A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 01/07/2026 7:51 am, wangdich9700@163.com wrote:
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Replace the manual mutex_lock/mutex_unlock of irq_lock with
> scoped_guard(). This lets the compiler guarantee the lock is
> released on all exit paths, eliminating the err label that
> previously existed only to reach the unlock call.
> 
> No functional changes.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
> ---

Is this fixing any bugs?

This is a lot of code churn to fix nothing.

>   sound/hda/codecs/side-codecs/cs35l56_hda.c | 104 ++++++++++-----------
>   1 file changed, 51 insertions(+), 53 deletions(-)
> 
> diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> index a0ea08eb96a9..2d9d75053293 100644
> --- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
> +++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
> @@ -625,74 +625,72 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
>   		goto err_fw_release;
>   	}
>   
> -	mutex_lock(&cs35l56->base.irq_lock);
> +	scoped_guard(mutex, &cs35l56->base.irq_lock) {
> +		/*
> +		 * If the firmware hasn't been patched it must be shutdown before
> +		 * doing a full patch and reset afterwards. If it is already
> +		 * running a patched version the firmware files only contain
> +		 * tunings and we can use the lower cost reinit sequence instead.
> +		 */
> +		if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
> +			ret = cs35l56_firmware_shutdown(&cs35l56->base);
> +			if (ret)
> +				goto err_fw_release;
> +		}
>   
> -	/*
> -	 * If the firmware hasn't been patched it must be shutdown before
> -	 * doing a full patch and reset afterwards. If it is already
> -	 * running a patched version the firmware files only contain
> -	 * tunings and we can use the lower cost reinit sequence instead.
> -	 */
> -	if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
> -		ret = cs35l56_firmware_shutdown(&cs35l56->base);
> -		if (ret)
> -			goto err;
> -	}
> +		ret = cs_dsp_power_up(&cs35l56->cs_dsp, wmfw_firmware, wmfw_filename,
> +				      coeff_firmware, coeff_filename, "misc");
> +		if (ret) {
> +			dev_dbg(cs35l56->base.dev, "%s: cs_dsp_power_up ret %d\n", __func__, ret);
> +			goto err_fw_release;
> +		}
>   
> -	ret = cs_dsp_power_up(&cs35l56->cs_dsp, wmfw_firmware, wmfw_filename,
> -			      coeff_firmware, coeff_filename, "misc");
> -	if (ret) {
> -		dev_dbg(cs35l56->base.dev, "%s: cs_dsp_power_up ret %d\n", __func__, ret);
> -		goto err;
> -	}
> +		if (wmfw_filename)
> +			dev_dbg(cs35l56->base.dev, "Loaded WMFW Firmware: %s\n", wmfw_filename);
> +
> +		if (coeff_filename)
> +			dev_dbg(cs35l56->base.dev, "Loaded Coefficients: %s\n", coeff_filename);
>   
> -	if (wmfw_filename)
> -		dev_dbg(cs35l56->base.dev, "Loaded WMFW Firmware: %s\n", wmfw_filename);
> +		/* If we downloaded firmware, reset the device and wait for it to boot */
> +		if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
> +			cs35l56_system_reset(&cs35l56->base, false);
> +			regcache_mark_dirty(cs35l56->base.regmap);
> +			ret = cs35l56_wait_for_firmware_boot(&cs35l56->base);
> +			if (ret)
> +				goto err_powered_up;
>   
> -	if (coeff_filename)
> -		dev_dbg(cs35l56->base.dev, "Loaded Coefficients: %s\n", coeff_filename);
> +			regcache_cache_only(cs35l56->base.regmap, false);
> +		}
>   
> -	/* If we downloaded firmware, reset the device and wait for it to boot */
> -	if (firmware_missing && (wmfw_firmware || coeff_firmware)) {
> -		cs35l56_system_reset(&cs35l56->base, false);
> -		regcache_mark_dirty(cs35l56->base.regmap);
> -		ret = cs35l56_wait_for_firmware_boot(&cs35l56->base);
> +		/* Disable auto-hibernate so that runtime_pm has control */
> +		ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_PREVENT_AUTO_HIBERNATE);
>   		if (ret)
>   			goto err_powered_up;
>   
> -		regcache_cache_only(cs35l56->base.regmap, false);
> -	}
> -
> -	/* Disable auto-hibernate so that runtime_pm has control */
> -	ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_PREVENT_AUTO_HIBERNATE);
> -	if (ret)
> -		goto err_powered_up;
> -
> -	regcache_sync(cs35l56->base.regmap);
> +		regcache_sync(cs35l56->base.regmap);
>   
> -	regmap_clear_bits(cs35l56->base.regmap,
> -			  cs35l56->base.fw_reg->prot_sts,
> -			  CS35L56_FIRMWARE_MISSING);
> -	cs35l56->base.fw_patched = true;
> +		regmap_clear_bits(cs35l56->base.regmap,
> +				  cs35l56->base.fw_reg->prot_sts,
> +				  CS35L56_FIRMWARE_MISSING);
> +		cs35l56->base.fw_patched = true;
>   
> -	ret = cs_dsp_run(&cs35l56->cs_dsp);
> -	if (ret)
> -		dev_dbg(cs35l56->base.dev, "%s: cs_dsp_run ret %d\n", __func__, ret);
> +		ret = cs_dsp_run(&cs35l56->cs_dsp);
> +		if (ret)
> +			dev_dbg(cs35l56->base.dev, "%s: cs_dsp_run ret %d\n", __func__, ret);
>   
> -	/* Don't need to check return code, it's not fatal if this fails */
> -	cs35l56_hda_apply_calibration(cs35l56);
> +		/* Don't need to check return code, it's not fatal if this fails */
> +		cs35l56_hda_apply_calibration(cs35l56);
>   
> -	ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
> -	if (ret)
> -		cs_dsp_stop(&cs35l56->cs_dsp);
> +		ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
> +		if (ret)
> +			cs_dsp_stop(&cs35l56->cs_dsp);
>   
> -	cs35l56_log_tuning(&cs35l56->base, &cs35l56->cs_dsp);
> +		cs35l56_log_tuning(&cs35l56->base, &cs35l56->cs_dsp);
>   
>   err_powered_up:
> -	if (!cs35l56->base.fw_patched)
> -		cs_dsp_power_down(&cs35l56->cs_dsp);
> -err:
> -	mutex_unlock(&cs35l56->base.irq_lock);
> +		if (!cs35l56->base.fw_patched)
> +			cs_dsp_power_down(&cs35l56->cs_dsp);
> +	}
>   err_fw_release:
>   	cs35l56_hda_release_firmware_files(wmfw_firmware, wmfw_filename,
>   					   coeff_firmware, coeff_filename);

