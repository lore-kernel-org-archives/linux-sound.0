Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A69393DD1;
	Tue, 24 Mar 2026 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349641; cv=fail; b=nTNRK3CdWBEifd2n5bd0Atotrxd9RzTpc7eCvzvKoMleyNHZmegoBe7gGzJlyrm73uokQO9/9G55LeRrs1W/qHWm4Fde4hdSYQT+zVBnE7aqw87yOrG27q43vyAKddc8nmHSTfff7vLpo2PJkBZpAq3u21hm1DNsmohrHkRLDZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349641; c=relaxed/simple;
	bh=OZ5EyC+6HQefdHlgtbZFNFXXmdEYmK9N/aVCElTL2rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3Ny1cvoH227HsRNgS0IJiMFLMJ73G/qO1f63nYQFqIPb37QTQTq2sljguB1MfE/NTt5lEbjlO6s7M9py+Kl4ja2EukbKhL8c1vp9Yx9UaWfbREfJ0grcXJR8Zl6/u4yA5cfYwkC4G0CNJ881qkck4VeeQnNKOz88LvACega68g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=eVE9+mMK; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=zwcnddjt; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="eVE9+mMK";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="zwcnddjt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O5rrZ22694356;
	Tue, 24 Mar 2026 05:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=7dZg7jxf8K6+t2CM49
	EF+bSNY+AwBniVZnVkNtW7TNk=; b=eVE9+mMKZJqvy1KYKEavcbqkG9ee5isESb
	6TV61pTopcYRAdOV8kzg5w3mDzjj+giTCUzt1EhCMygyDd1BVIjC0VwsMfNSAxhM
	Wmb2l3RrslpWyqNlBxRsMufU0ZKVjUO+Sbhw8dEWedA25tHLvSWL90o0yFQpM89/
	ktWsgg1S5Hic4+ybuoQ0Np8bYuqUXHB0Ho9v8UkCD1Mefxd/bDYtXZIGUKOvkUo/
	CpWPD/U282PWXVFwiH+NdWnaPCvMAe+SeyZMc9SmuRRlQlKw434RPxVyJXgESXGO
	HjOCwScku093pdla/IO0Lqljvwdy8UcmneiGEXHGSaKTJfzNwLiA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022117.outbound.protection.outlook.com [40.107.209.117])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d1rqxtxe5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 05:53:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjI1Y+CQ41QIoxmnWyc3ZiHrpRMkkPfdPP/ujuGgAf6u6nbSt6IMRSweYLLLId91FCf3TI2D1nc0WY7HHGZPFrIl5QCi00b2KNg1JFgHI7qEPtaZf/qZTN6plRq62DDzlh7BSzBniMn9kAL2kffXdlFgt/EXuDebMZYoN9uNidSBmYfnd+naygBg6U3aRgTNiazsb8/ZiA5/miV5tqVxLWfod2b3cgtGUj1rB6nM2QdmEbaw7+UlKYFMiLLF/MSCQ34CCUYSU8MTLSy5uJL7BZsrDmcJTXHvcIfTTL9tACmqPZ5LKRcv0kdDivL11NzFoxFH54c8jA4/WMju/j8WvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dZg7jxf8K6+t2CM49EF+bSNY+AwBniVZnVkNtW7TNk=;
 b=TKpikMjIMRI45CDAu2MY7QqFwWhUCUEAm6XvD+cYWoSIPYDz6daVyBNlIrXhFpxm8BzcB6D+DhgUXGUt9iX/+EcEQe6ufeyFh10xHuNzidLpRKVOMB0Xc7VALk5tD/B7TUn9K2IETLK90U8zjztjrkQ/wKweXDvE5lt0PlKYKZyQkX4y3pZpGAmmwBHIREnPnCQoizemIzGYw0rmuDCOuO9aH09lmtNrMUo2J6cY01841rYNUM6xPQFDq2iFRUmlA1ERB1TcfEoipKFSqZohTgm4d6jtfZx2Dx1kvmNe76p9wk813TGVXfxOEGaIpcDvjmW2eY8x4k3Zlbk9e0N4Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dZg7jxf8K6+t2CM49EF+bSNY+AwBniVZnVkNtW7TNk=;
 b=zwcnddjts+f5STJKKwB10A/hNQvBah4rA6J23a6eJhQjhEGK6wVK0ld806QxTPZh6YHCkX0teo2PZNKbNESBUWMoeqzo9ZZjIUVAAFGqEkeU6JXibuws1gEbzqQLgz7qcbDida8YWaoVzHyFv05q0+rrt4NtCOY3l/fQggI7X3A=
Received: from BN8PR04CA0058.namprd04.prod.outlook.com (2603:10b6:408:d4::32)
 by LVUPR19MB997299.namprd19.prod.outlook.com (2603:10b6:408:3a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 10:53:16 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:d4:cafe::64) by BN8PR04CA0058.outlook.office365.com
 (2603:10b6:408:d4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 10:53:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Tue, 24 Mar 2026 10:53:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DB97240654A;
	Tue, 24 Mar 2026 10:53:14 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B8ABB820247;
	Tue, 24 Mar 2026 10:53:14 +0000 (UTC)
Date: Tue, 24 Mar 2026 10:53:13 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
        pierre-louis.bossart@linux.dev, baojun.xu@ti.com, shenghao-ding@ti.com,
        sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v1 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Message-ID: <acJtGVN5nOTvFnxg@opensource.cirrus.com>
References: <20260323041545.2101-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323041545.2101-1-niranjan.hy@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|LVUPR19MB997299:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4c4145-0803-4d6f-d859-08de89938da5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|61400799027|56012099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	pX83eIVwjXMlzEgixCoSkdXfWKzXypHptXruhg9IP+0Rd2zbeRVscsxaTjG4ulGQmns/oaWIVhW5C8ULxLRDZ4wrf/hfFXnuzhFaxXmGhXKO8Jqnf2E1MtLwXxd9S+rlP9hutYlD+Xv3459A1fymJHJRoDcF3KAKTDVr2Q4IH66lFQHo8uKAu0tFcE6GZ1pSpxJvST+xFFfWsXZAxlUfKq5zZWUumsSJ6igyRvlx2/yYDqEhSgMBOnDEqxVZXXldtvOPeTJafNZt1hhjdwTL39dnz/2Jjx6XxC9MG171uPrRXl6oNeesPUR8iufdouLUHj+x3EH1rQg1+nnDE4ve+P5nK06yZMe+ZHKVRFs+1hmSDXAuPY44HKfRZIxSAy0Fgwb/kVdx1qqXkpm/E3XkSVO3bDznTdSG7bAfAexnLgvSFq9DP4Swl+XEbZBAzCJkTcrJfF/52e5w+zCo6a1ltPtCJPtlPJHWqKded4/2FTUOW+4+FDfQLmZMa2SIrwfm8F+mvbOY8pNt4Z6Kp2gKxjWhyW89rHn2EariRt6T6fTZVFeoO81HZXA9Rrt7LOXHgcKfFRjUB+K6NyMNrPOYU5jSb/mmfoFPQWRUFgW6dNrywY4Snf7RJmqaIlP8O3D4TU57t500WCA3R0D7a5MGW3Q+MMIb9Uo/vnFORktKTLpHxjr0RXGaFFwOt6lgWwpZUR3T4C6oNqKlcktXymwnZvsjfN5qYHtn5m1VofOu7gCYiBwphThIMFNc+HDlJ3TCxu028jnWUuYBhEbDC9FCYw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(61400799027)(56012099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wxCpT3eHW3OjObVW5wdojRfdBdUJH3pXbGN01EVkkKXTdp7Bxt1lOfRxRA6OJuFy4fcnDYh/Pwuq2wA+oGgLTqVuUx3v7gTulnq4+raROnNbpJgDbyVishvmQiT0frtbg83prupgkb1lwGfyEVQEM8m5sayEgPJMtDh3X/8DGVVU8WeNtZFCAoXr7JnnGvSYoiWs0DxHe7Tvu9CBovcsTEIj0I8uNxM5FjnpP/2kQuS3P3rHXvFdpooHXUrHA2FqRIr3Ed4NAS8YJ4Da8nld55z08HJCBExwpiR45JNjX+t/OkuwyD1ai+WuMfx5s8lcic9rC/Obgllmc7SbG0C3OSs6IWj0I6RjLbj+svMnCnRKNWtOE1yotUe++EvTww9cgPsGibsAS0jbF2axWLre9y9qonElgzcmMt1XtX5WNfWm87wKlJ0gdWL8/GymRPsz
X-Exchange-RoutingPolicyChecked:
	gm4tTj/3422ZvD2Hm2GfX9l7XKTFEDVxeofCwFvgi2r3XAoCQBilx/L/B+RdjOYX5WxEYHge2vN4+mV4uLbc+PDr6cj44x8vEOiwB8Mf1cqXqqaj7zam00DbZBBTahHChN8LmCqMryWqjr2YpE6RjacxwPtTwG56KcP9xzjukbMVa83Z0skG9jrC1UYkxX9KvkvcqB+jRJ/mex85ubyCwHci3luVL8erFFFdHiGhAYnMaNroYKjooKdcQaxFP+fuMn/sjN7jLKbOwyotnKRYG0Ih1fnMu+kXM3XoW4/vyeW5ad4/zQ0oEQRqUpziZSE7SX9LOKju8Bg2prs4YG6kxA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 10:53:16.0710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4c4145-0803-4d6f-d859-08de89938da5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR19MB997299
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfX7FxRa3GSHeoD
 80e0aK0WqR13DWZ1ORw6nYMFYe1KyMmIDZHmS2ZwZjBHAXmvRMakEHROFya3BEn36DJU7/hLgL6
 Ir/bBbh3kQZrQE5XxMRcuwGFbsSNDWfdojclXz+IuHCNamvcosCEc7XcOQILqC1l5TLiwEBd/eR
 bFButhK8FvOWMEeej4rprZL84tEwQDA/bHICF8SqN+eB0V9rSj39bdjjDWqLKPlJKirPcDw1plu
 zoaDfZeUt2RUpfBe5BnNVXqmve+y3VVRNeRvVIfFhoE53ICnEHg8ddq1b9MXKbiNxTOmZFGATqQ
 e/nnMg0FGJlgEriXLz5ZziqDbDSdXqieqFJWDDZw4Xyl+xAgcENQJa5xaPLtyMtTI2412NkYa2w
 hp+FwRYWdCmTiAkVcJb9Oh8gDY3h5iRkzcEjY4ADJkvrP/Emjt+ZtALOkL6iif2xC97LteunT5g
 XcZ5Gmq+s9Gm41pNNpQ==
X-Authority-Analysis: v=2.4 cv=DKiCIiNb c=1 sm=1 tr=0 ts=69c26d20 cx=c_pps
 a=upY0ag0bgN/A4kti6igY/A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8 a=dEmcGcdb1VgnhRyShQEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: DAVgY6Qrvb-8jueqbfUnRp7Nsa6LyRkH
X-Proofpoint-GUID: DAVgY6Qrvb-8jueqbfUnRp7Nsa6LyRkH
X-Proofpoint-Spam-Reason: safe

On Mon, Mar 23, 2026 at 09:45:45AM +0530, Niranjan H Y wrote:
> Add codec driver for tac5xx2 family of devices.
> This includes the support for
>   1. tac5572 - DAC, PDM, UAJ and HID
>   2. tas2883 - Amplifier with DSP
>   3. tac5672 - Similar to tac5572 with feedback
>   4. tac5682 - Similar to tac5672 with Amplifier DSP.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
> +static int tac_fu_event(struct snd_soc_dapm_widget *w,
> +			struct snd_kcontrol *k, int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	struct tac5xx2_prv *tac_dev = snd_soc_component_get_drvdata(component);
> +	int mute;
> +	int channel;
> +	int function_number, fu_entity;
> +
> +	/* right channel and mono case uses ch 2.*/
> +	if (strstr(w->name, "_L"))
> +		channel = TAC_CHANNEL_LEFT;
> +	else
> +		channel = TAC_CHANNEL_RIGHT;
> +
> +	if (strstr(w->name, "FU21")) {
> +		fu_entity = TAC_SDCA_ENT_FU21;
> +		function_number = TAC_FUNCTION_ID_SA;
> +	} else if (strstr(w->name, "FU23")) {
> +		fu_entity = TAC_SDCA_ENT_FU23;
> +		function_number = TAC_FUNCTION_ID_SA;
> +	} else if (strstr(w->name, "FU11")) {
> +		fu_entity = TAC_SDCA_ENT_FU11;
> +		function_number = TAC_FUNCTION_ID_SM;
> +	} else if (strstr(w->name, "FU113")) {
> +		fu_entity = TAC_SDCA_ENT_FU113;
> +		function_number = TAC_FUNCTION_ID_SM;
> +	} else if (strstr(w->name, "FU26")) {
> +		fu_entity = TAC_SDCA_ENT_FU26;
> +		function_number = TAC_FUNCTION_ID_SA;
> +	} else if (strstr(w->name, "FU13")) {
> +		fu_entity = TAC_SDCA_ENT_FU13;
> +		function_number = TAC_FUNCTION_ID_SM;
> +	} else if (strstr(w->name, "FU41")) {
> +		fu_entity = TAC_SDCA_ENT_FU41;
> +		function_number = TAC_FUNCTION_ID_UAJ;
> +	} else if (strstr(w->name, "FU36")) {
> +		fu_entity = TAC_SDCA_ENT_FU36;
> +		function_number = TAC_FUNCTION_ID_UAJ;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		mute = 0;
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		mute = 1;
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	return regmap_write(tac_dev->regmap,
> +			       SDW_SDCA_CTL(function_number, fu_entity,
> +					    TAC_SDCA_CHANNEL_MUTE, channel),
> +			       mute);

If all this does is write the register why not just pass the
register to the DAPM widget and not both having a callback at
all?

Same for many of the other power callbacks.

> +static int tac_sdw_hw_params(struct snd_pcm_substream *substream,
> +			     struct snd_pcm_hw_params *params,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct tac5xx2_prv *tac_dev = snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_config stream_config = {0};
> +	struct sdw_port_config port_config = {0};
> +	struct sdw_stream_runtime *sdw_stream;
> +	struct sdw_slave *sdw_peripheral = tac_dev->sdw_peripheral;
> +	unsigned long time;
> +	int ret, retry;
> +	int function_id;
> +	int pde_entity;
> +	int port_num;
> +	u8 sample_rate_idx = 0;
> +
> +	time = wait_for_completion_timeout(&sdw_peripheral->initialization_complete,
> +					   msecs_to_jiffies(TAC5XX2_PROBE_TIMEOUT));
> +	if (!time) {
> +		dev_warn(tac_dev->dev, "%s: hw initialization timeout\n", __func__);
> +		return -ETIMEDOUT;
> +	}
> +	if (!tac_dev->hw_init) {
> +		dev_err(tac_dev->dev,
> +			"error: operation without hw initialization");
> +		return -EINVAL;
> +	}

This is a bit weird should these not be handled by runtime
resume? This happens in a couple other odd places too.

> +
> +	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
> +	if (!sdw_stream) {
> +		dev_err(tac_dev->dev, "failed to get dma data");
> +		return -EINVAL;
> +	}
> +
> +	ret = tac_clear_latch(tac_dev);
> +	if (ret)
> +		dev_warn(tac_dev->dev, "clear latch failed, err=%d", ret);
> +
> +	if (dai->id == TAC5XX2_DMIC) {
> +		function_id = TAC_FUNCTION_ID_SM;
> +		pde_entity = TAC_SDCA_ENT_PDE11;
> +		port_num = TAC_SDW_PORT_NUM_DMIC;
> +	} else if (dai->id == TAC5XX2_UAJ) {
> +		function_id = TAC_FUNCTION_ID_UAJ;
> +		pde_entity = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +				TAC_SDCA_ENT_PDE47 : TAC_SDCA_ENT_PDE34;
> +		port_num = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +				TAC_SDW_PORT_NUM_UAJ_PLAYBACK :
> +				TAC_SDW_PORT_NUM_UAJ_CAPTURE;
> +		/* Detect and set jack type for UAJ path before playback.
> +		 * This is required as jack is not triggering interrupt
> +		 * when the device is in suspended mode.
> +		 */
> +		tac5xx2_sdca_headset_detect(tac_dev);
> +	} else if (dai->id == TAC5XX2_SPK) {
> +		function_id = TAC_FUNCTION_ID_SA;
> +		pde_entity = TAC_SDCA_ENT_PDE23;
> +		port_num = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +				TAC_SDW_PORT_NUM_SPK_PLAYBACK :
> +				TAC_SDW_PORT_NUM_SPK_CAPTURE;
> +	} else {
> +		dev_err(tac_dev->dev, "Invalid dai id: %d", dai->id);
> +		return -EINVAL;
> +	}

Maybe worth considering sdca_asoc_get_port() although if you are
super confident your ports will never change it probably doesn't
add much.

> +
> +	ret = regmap_write(tac_dev->regmap, SDW_SDCA_CTL(function_id, pde_entity,
> +							 TAC_SDCA_REQUESTED_PS, 0),
> +			   0x03);

Agree with Pierre its a bit weird to be handling PDEs outside of
DAPM, at least a comment to explain why would make sense.

Thanks,
Charles
