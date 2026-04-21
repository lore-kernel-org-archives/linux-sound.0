Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2782E2286;
	Tue, 21 Apr 2026 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787129; cv=fail; b=ePHoqqQ1FFjXm2daoxxtGju+sx2STVRbieDGaxFXE9FIvLaU5HNLZAT7iXaiLElA4rHXKjlAJWJo6gkHlYAu2UMwZijzXWaiPP9RxGEWWGZXAxrYKuDs9pcc93snQnpqTV6PBkEkfJ/8dRPw+bbpqZM/PrSxx8eERpnAUzJbL7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787129; c=relaxed/simple;
	bh=5vMKzUa86ysx4nsAa4oBZhxwpMQfZPHkJjtzOIdLURM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WysV5vlfdmGRMTNp/iJpImXVSyNkYbmCtYPxDz+LG3S5xoPb2iF17mPmq66kAgCqftDfj76sjt4BH1y861zifMOaM6E70vlhekzjCS7jbhWDqj42UjPJ376QwRGlYPySYT7DWf5huCzRsueoe5e4FVLjqG0rc2fHk/ILmqepztQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pDJNPIdg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RnUueWHV; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pDJNPIdg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RnUueWHV"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L5eYWd4018003;
	Tue, 21 Apr 2026 10:58:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=sQKCYa2da4FXUARXsm
	6qXppsxWRYNu7ielSxyshuGm8=; b=pDJNPIdg6KXxvGQBz1ImuSmgd8hz6+jUKa
	EQn2Ngph7fWxHWpLIxXb8lRAFqXxb1Kaki5+ChWoM62sd8Sl1VHlwkQWkt5E8dAW
	hJJQ8aaoabYDzYgJ9+8EvSQu+l9jNUJpcHtPENkMRVQhcaFmLmv00LYYrxbfT2Lb
	Q/kiMZToHiju4HIbVhbGJZO/kQKclE3rQFeLcbw/84gnvPuMsC4hz6xion7CM5Wa
	xehtP8rGHUvuU0mkiZViiAFRFmCu3dCKucNQbhA/t5eQiVL7zORLUCC7vvTTKGfi
	sXHw5wfdHuozacwocZZMnDR82YrVX9s29zHOK6E11d94NQHI42pQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021141.outbound.protection.outlook.com [52.101.57.141])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dm6cfm6d3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 10:58:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnkLNYxpFmGJYizwuDj+OdqnHs7gpKwpta30J6U0oypGKQ1My1dV54ma0Y9WZ//phTWwR4POPItTMqJTlkRlj3NaayqfIAbioi6OlRLB22p68vWjJ15tt4aAhQxRUmOvPRs/ZqZeBZnQ7Hl/93mYDJ6iThXwKYonGXLA+WPKH467bLa/7thi+p/A6WrJacSVdarV3xZT44HtVAFCax8RYM5y9nv0ZJGL3I09dOL898tVFgJx5FCKcvQu2Hk+BRw+KhxBBp+kYPKWAUmGUim3cK/Fd94Bz+Pk/m1mkA8G3zxw+CTNLCWLr/8RK9u4S5g9tncL6GPPCWkX3SgU+A9J7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQKCYa2da4FXUARXsm6qXppsxWRYNu7ielSxyshuGm8=;
 b=n5aVhjsPPk6aMGjxa7wQlye7D1wd8YTk8+m82j6H6HGCCg09RE80O0cffStso/dOjr8S5t1XEs1Zxk1YRU++X7v4J5C5XqLTlJ5y4C/tBzpuZrRMe6nTazKhYGIgbVFbrZWrLvWCQZ412ZKVsO2h2IJ1wBlwFtz/J9PhALDNWm94u8vk9LLcu4CNbGtpM8gVXzBzFkUpXaPRvb2Q2WaPCtcQcZOOYEA1e1My+zQDOSkbrMBTCBRXtJChgk4PW4VMar4DmE0ew+s5xXc6ipX6SfEaI0/Oh40vqQd32+0J2PrHD0tfG9sKfI9sQO49fQYWru7XvXHFR+kzFIbcRh4+/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQKCYa2da4FXUARXsm6qXppsxWRYNu7ielSxyshuGm8=;
 b=RnUueWHVLNQ5MES8Dm1HHKhr90c91SpBJquVOc6nz35eu8AW9vA9A/8P+TuNCuZ2ACiHX4wNGYQUGwsUeNjwwkUQWKywyOivVlH75YIsK4CJfUBw4tlEM7H5YlyB3EftHt4JC2RjHFgDf4iDr7Dc7P7FWMy+99XNyrHUJu8n/q8=
Received: from CH0PR03CA0238.namprd03.prod.outlook.com (2603:10b6:610:e7::33)
 by PH7PR19MB7801.namprd19.prod.outlook.com (2603:10b6:510:248::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 15:58:00 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::dd) by CH0PR03CA0238.outlook.office365.com
 (2603:10b6:610:e7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 15:57:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Tue, 21 Apr 2026 15:57:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5AC1D406542;
	Tue, 21 Apr 2026 15:57:58 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 45FF882024A;
	Tue, 21 Apr 2026 15:57:58 +0000 (UTC)
Date: Tue, 21 Apr 2026 16:57:57 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
        pierre-louis.bossart@linux.dev, baojun.xu@ti.com, shenghao-ding@ti.com,
        sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v10 1/4] ASoC: SDCA: Add PDE state transition helper
Message-ID: <aeeehYTuNON2cGKJ@opensource.cirrus.com>
References: <20260421154804.2670-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421154804.2670-1-niranjan.hy@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|PH7PR19MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: afe7abfa-b740-4393-6925-08de9fbec2fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|61400799027|22082099003|16102099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kuM1T8XSKMhWvSA/PY79371Car3C5qzYyNdgEtgMTSVUqIEb/dtTxSfRNUj0+LKoMcOY3vk7CQuoEFSYOY+lkX0nhuL0XqVw96luRsZZ3OO3AECDQDmG1hPE/syul9AwN4chTdkf1e7J9QZXM+Ru1lGa9p3TQzKrjuh3JFOoEIecw/16zef57ovUattJbt5tjk7ULkh5tfJEa2LgH1ylTzwVX4nLyyzd5Z89PWMdmX+e8QM5qcfVU/MLNStyytv2lqo9Tx6nRFHWM9erTmS9TPKZ7OSgLDqe3ImbcdCw2IkPnN5/GahZ1DgTXQ5u4kUYfJcQUeKOVD5gkKz9u5yehYPsK4nmhSDxctGQK/Yu75d9OLyrXOeGa66mYji6cU4OFq7CcLmhax4fadST/W0wIjRU48ol2HITy2gHIYvxyClQTh4KGTuu0VNikPtCr+VXKaVnHWZ9kheNMSjEy0tQbkQYndndMdzaYxZDq38Ozycy8ZoAtsgl3ikPqgkrATx1d1Sfk0sMymrrOecbexs+nfPyZ8iu4VLPLluIkKxHtNTcmJDJ3Z3WD1lrxjQi2gI6nII0WBsQ6esKQytTppOj601nOZ1dIMfRf9tq66C+zi6CxStCggP5tUmsWpR7ZJ7o4EZeW+VmX2OyqCTYEtaDt78lsRrkYeEjYPWpVS7GEWQoCjuNz5pLkn8+NPxkanKtjLLSuWHqZSm/itOhOzw+6b3556fngdk7DgxIoPl+tCPqu9qrrw2lwt27+u97+0xsYKCCJZDLGU9qkKUalPMhfg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(61400799027)(22082099003)(16102099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hXD8DFNMvXAjfejbDkgw9wuYZd048kmRLrp2azE3olBbtyxhh3bc8wAx1qxwsnYoB1Qhl7tQlsPPii04g4fT45PJrt6QzClo+oZ8LzDmeP0+jRxsLlIsskhlXKxPaVbKYJDjLAKX6FYbNgApNMBZYjaha02r6vdhooQPD15EUs1igT9/KZH0igRpDp8PBCvW5pB4EoOWw5t0kS9e+gLJ3ZXwMXAzfq8D7QFy88626ZN/w4FmiGsxRfcVTFIg+CRKKFiZWItvfnXlTltCXYEw47H+x4tD6/AD/bYKknQdeEGd28QS/j0tlgErj06f/kUH5oYOpxW3oiANDxOQnyhYPtlCRXDUt+NlmF072c+Jn5PMcELK5Kzk+AOloSEAfkTamreahKt/iFDw5ZlvWfPoVIAcdEdo0zTNZvYXTEx4FrEFdVnWR6KSplIMXpsRf04V
X-Exchange-RoutingPolicyChecked:
	fP/5MmM8l8yho6bf0x3+IBol9s6rC6NHej3gCqgpAZFHGTD8rVkidkhkGkQX3bymvMRhcGDyffO0G+OGpjtvn0WHgBfvTMXzVvsNB5iZpKQ6Bosbs33G7GgJMKXnMeFLRO/hWEftCdTPH74HYTLs5UW7UUq0XDocRIh5R9pIgYbS/eq/99GD3cKAMrasDm7WEA1cQ/BnVDmFrPvorYF3H0jnfJsOCQL3Lf4SVFLYbUzYKqtLbVEDxhu5UFa6hZVSCCF0uDndyGKN5lC0TWUfRpC8oSiqcq1dm78qzInhZqjuKFJB5NjLfuE+jqrl5uxcSk6KKGSs+f76vsEi41CeXQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 15:57:59.4557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afe7abfa-b740-4393-6925-08de9fbec2fc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7801
X-Authority-Analysis: v=2.4 cv=EdT4hvmC c=1 sm=1 tr=0 ts=69e79e8f cx=c_pps
 a=IXZk8buBm3K+4cvqFqH88A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=sozttTNsAAAA:8 a=SlxAVYLsSmJnezxAAxEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: UOPjA0x3Ea88hP1kXfueuZJlyycg7aif
X-Proofpoint-ORIG-GUID: UOPjA0x3Ea88hP1kXfueuZJlyycg7aif
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfX+YFA7k61jVOW
 RxyQLKhvVHn5mR3CZmsNIu1u4Tsi/kF5inuoj/KPXJ2br+yErQNOpTeoe9SiOLCWog+YeEBN5vq
 OZyLQ9FrehRtq/KIROhFma/v93twHNntZw8ReJ5Hl7OTtSMZjTZtFp1GG9nbTHIoM/IgFn4QTtp
 NhSSe8v9Uz8ibyiaY268N7kQxN3TzGKx17IRdMgnaVyEzHVi0RdTUbWDd/SPl+HkgBrtvyKGXr2
 9ioupUGOMjU391khug6TaoqvzwukvY8kiUzPGBplXzMuBegmqjB+8AIsutk8oDY3hWssl3pW8e1
 ikoeh4tFsHPp954njl9J5OLiBUI0uKoYIodDRFgnLlauSHYlRtQMA9mdaU5EHdEeRoCZuPyJo+F
 qCieu0qanClakjukPZJLIXhzShRIDI/MQsFLGLuh6A0Wc74iAfeYNmOCo9qib1x7+XpgGtc6N5W
 0uy+p1zD9UQls9B53jw==
X-Proofpoint-Spam-Reason: safe

On Tue, Apr 21, 2026 at 09:18:01PM +0530, Niranjan H Y wrote:
> Per SDCA specification, after writing REQUESTED_PS, drivers must
> poll ACTUAL_PS until the target power state is reached.
> Implement sdca_asoc_set_pde_state_sync() helper function for
> changing the power state of the PDE widget and wait for the power
> transition to happen or timeout.
> 
> Changes include:
> - Add sdca_asoc_set_pde_poll_sync() to handle write
>   REQUESTED_PS register and poll ACTUAL_PS register until
>   the target state is reached or timed out.
> - Export function via sdca_asoc.h for use by SDCA-compliant drivers
> - Refactor entity_pde_event() in sdca_asoc.c to use the helper
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---
>  static int entity_parse_pde(struct device *dev,
> @@ -449,8 +492,8 @@ static int entity_parse_pde(struct device *dev,
>  	}
>  
>  	(*widget)->id = snd_soc_dapm_supply;
> -	(*widget)->reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
> -	(*widget)->mask = GENMASK(control->nbits - 1, 0);
> +	(*widget)->reg = SND_SOC_NOPM;
> +	(*widget)->mask = 0;

Hmm... yeah I am really sorry I totally overlooked this. Yeah we
should leave the write outside the helper it is much nicer to
have DAPM do it.

Thanks,
Charles
