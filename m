Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8993389107;
	Mon, 20 Apr 2026 09:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679140; cv=fail; b=Vjyv7J22tJUpXjdkt72LU0Bn1eh86kCjUC2WqMYg2QHiym8PPM10zaVUOUsVOrHPV0PU7pR547A0ySa1PDFVpWfSnE06iFOyfOHfAsftFao5tAdjO0vTwnN4Ayqel6RxmL1r/y6TRBn9g84ig9AmZIYBYPxkjwZ4DqJjN2Q5nJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679140; c=relaxed/simple;
	bh=hB1UKd/waDwYt16fQ1unS0o9fjvviuApu4yJxDbZdHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdc9iAkW52dfpeOHbDZH5ukij24TPL2srn5raNIVyZQBHVp8PC/zCsO6JJ3BZBnt8u8H74JWwDcSu4gXDiiMHVWAKLVehhOc2hBiDh0SyAgTRUWmVXx+/Y7OJVbrQDMQj6+9kSLYbJtqItbpkC1Y0MqSS5lMXZeNj1Vxd7hat8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LAyY4ixp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QIRVYTjp; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LAyY4ixp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QIRVYTjp"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K4wwfF1543289;
	Mon, 20 Apr 2026 04:58:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=5zS0lu+LV0uoY6gNAT
	3iJZE2f4QWrTinUdw/PgiOaYE=; b=LAyY4ixp07PHBrLgMKFeuQXjouGWqjXKhn
	sQhygR8loSElW0aH2CJ8XUFb8JIhKq1N+n1lh7kUuPIBlmVwLez2bQyHbdKI6YsX
	HMfrTT9TZcZORakhuJwzI00TTq4CIz3jeEEsOrO3e8DeyOHQeASJKWF3MULuQHfX
	y84LJZ7jxLWeIjMx/bdWGadeAKT7hsgb43yBxXGdgEFYVVqEkRbUumt+7BygCqNV
	W9xjut+9Bkr4AxPHyAnlewKQC5IxfW41+TzidHpGKmpIJ3maFhHixyTMShFvB22T
	9cxc2z87tcHZEoCOhfpwouwy8OrMN7xgjlviXEemZF0ljTPTUeqw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021098.outbound.protection.outlook.com [52.101.57.98])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dm6cfja5d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Apr 2026 04:58:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDQbySrIxVYdHWRqYX7qHWKwHDG8+DUiybyw2DFV0j7aLsZKk0Jxk2/pWFFrcNDLR9x4eIh+97ZCyxr9gP6IO85kejA26eqY6MBHNzfuBg8BN6mjy49V6e2gKoeNAQttufwSHJWYeLmf1nNOujygR25LGcqSrYOwc+L0syDpScyLJhPQyXm6gchqxLBvgpGXRzfoughvNcmVexxwWG1KK+nAa6cz7ritvdJQ1buJd8D3FimwnqwHAK56+G5GpMD78eOB0+zGRaVvwXQ6dic7WEvPATAbEJohjbfvqGRuOEYzUojILw8oe2WDqxutrOfHlQWsQ41L1AJmLpo6orsnkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zS0lu+LV0uoY6gNAT3iJZE2f4QWrTinUdw/PgiOaYE=;
 b=s+UOfwSQcGSXGr34puedJfxA6GWjcTgjEdkM8uGs0Ml442QI5Mqesa0o2WBBX4XxEFQLEIzh4wbbjhOijOmEPpQM55N0jFrPF97z3295WCNa1OXlYzTOq4to6I5qeK051h9micFyQjntbvkQb+GEMbzqUL3xgfi/cKe8f1XrHHFB82+KI73SIr9w9B2MjZiBPwkSNo9FNoerT3bu035PbJhyOPCdjuCHwFDfZ+kpyhze3PcZuTkZFtGnM4Gi8spOBOSCK2G/jMGBLM9HfGZZlgbAB6n2pfy3q5Djd4vRxbgqE8uqzj38y9pHi+3VRF2OybGu5FF95L2/YXTVVf/8nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zS0lu+LV0uoY6gNAT3iJZE2f4QWrTinUdw/PgiOaYE=;
 b=QIRVYTjpy5+1yIs2KiTG/ki8sJSvDlk8KGjVWXPQ4KrsAZCiQsBpl4fE4rFCIEIhPdwJaT0a029oaRgik5VvYjMLDpdYReS2fC8108lLhWdJByd8Z6+WUFyAlrDvvIDaGfT+6qlFlXBbQmv5hRyhP56kSpIi4KFsMPag9OjIJt4=
Received: from SJ0PR13CA0179.namprd13.prod.outlook.com (2603:10b6:a03:2c7::34)
 by MN0PR19MB6216.namprd19.prod.outlook.com (2603:10b6:208:3c8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Mon, 20 Apr
 2026 09:58:08 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::b0) by SJ0PR13CA0179.outlook.office365.com
 (2603:10b6:a03:2c7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 09:58:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 09:58:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8E322406543;
	Mon, 20 Apr 2026 09:58:05 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6D420820247;
	Mon, 20 Apr 2026 09:58:05 +0000 (UTC)
Date: Mon, 20 Apr 2026 10:57:59 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
        pierre-louis.bossart@linux.dev, baojun.xu@ti.com, shenghao-ding@ti.com,
        sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v9 1/4] ASoC: SDCA: Add PDE verification reusable helper
Message-ID: <aeX4pw35JhUbVom4@opensource.cirrus.com>
References: <20260417131401.3104-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417131401.3104-1-niranjan.hy@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|MN0PR19MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: 89534a92-7dba-44dd-6b13-08de9ec35275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|61400799027|16102099003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bdaZgInBr+N5MxKDgd33b7zXR+q/nWarlcIdpefPpxzy1GtPfC12LdtngU9HZmHiKHumBaQ/TEOWBQT+UZQGEHC+gJqp9n1XxlPg6NDh8GCaXidcL4p334m2JG4KOb+wlUi8qnnPSKtaiDPs1sqIU16tMzT8updrOXthsB3sBFI7383vtJ1rvLIRdV3CASqAB0EWPtVlhqfhtmzqVjiu/RZeW+V8iZTp9s68JOEjUOjAgH2wJ3Abjb9FMctkB7zJD0sg9qNt7tGBd8y0dT+vlyL8yhwTDmShfLc/2TSDtvEuhxzgPwOM97UFhCHs9FNNwuUq8wBDUJaX0yxIDF1Uqv0xLOa0ZSXHQlSpunrH21uytpcpsrO8x9KaFcZdw7k32yIVZFF1S/lc+AEZMQaY6Bp7jC3S/sE7SVV7IbLGPYNWhpA7LprOlEETgMN8HXj2rp96uHBDZ+Po9F903JhR18INuvAb4Lwn4rkw5oaAuoYXVWgS4hGy52WYS6q9L2aCgjP7Exf3x6GcG3ExVSbbiH5oGVs3PEMfEtSrKmBXOZpzDRi442VPwn1rzn6xkjDR3EEzWFNgMTOgfGKMWFCKgTSC3cIuoyGzGlQXGWu/BquHqaKiMG5ccGSXCxl+qNHqPb8QG2WZC/PP2AdZgc5asyj93apV9chxU4ULRNaR5ptdnmp0quzW8nsj1PjGVP6OYXJz4AuTi/v8U0Lzouwm2bUvogYT3cZ4MOqaVcGdyLppV7JCS3Mx1WyoHYvTsAkV9RMN9lcCr3zMQQjgH0nBdw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(61400799027)(16102099003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wJWPX1ssmbTN+Fj5yPem78kLQpOlhhBRu4j7ytd4EOSGeZMOZaZcHcM5go9T+W8q1GtTHW1PWhWQrlfk1x1V79bNqBArLWGKmPFlLC44NUSQFKUbc3kzoZMOSE8fo/VYiY/qwSkhEJSh6DL1YxUwfjDSo6HxEjwnt7CZvj7cM5d69i/baxVDQ7ql5jubB2EREpCsR5tCiCeoqK7D6WMUJm30GtC9d7k+4tUMCWSHL/ej/11uE8axcV7/yjjYDnpogffuGO5wvwCk+nKoe+gNeGRkvUgtT3/J5evewwwcdl0Hs1ZnLFXOIzF2rnMFpVAUhiLtn7ESG4RWFWy3rZ0uVb0dWEJY8GHp99R8XsoouV3zdlNIZoMhhk4Nd4cCE5xlLz462xMy35XPnBafR153jPd4OJov/+MCmmJTNjIj9Z9JXb/N11FY+fa4cBkoqziI
X-Exchange-RoutingPolicyChecked:
	VMrTWlXUhC9FZk3wD4ctQcleo1RwyhLxgVblNUQj03xyCDj2BEwU4Nc+cAfZ9OYbN6MMbe1CeMog0OyYpgdF9ndWrrb+l0DJdV3VXvSZWo1fjnjCUwCiNMgm5e9Y0TRJdPLbiwiZ6UutwokYWBkACjgohyrFTJ2L9JL9aUurY6yEWR0uZwboxmW3QTV4ypyI1kBQmwvfW8nDUdYImKE5C4e8p611WQi7Xe2Fof8ceG/yA8HdYidUvvcYnemrp3iUNBZEIln7DrXqqpFPVqZ1VXHZsa1T9UHJM3hBxlnaPEMShNEWKzO1LokjkQYfxJdIJGjt6o1SEK4QlPa+S3FL7w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 09:58:06.9243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89534a92-7dba-44dd-6b13-08de9ec35275
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6216
X-Authority-Analysis: v=2.4 cv=EdT4hvmC c=1 sm=1 tr=0 ts=69e5f8b4 cx=c_pps
 a=zHc5ipMoJZhVMviFMUShKw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=sozttTNsAAAA:8 a=pW4axVWlBQd-_jkBPlgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: gxFZFNt-qnZExAYkw2sCF_OdCdDM-fBp
X-Proofpoint-ORIG-GUID: gxFZFNt-qnZExAYkw2sCF_OdCdDM-fBp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5NiBTYWx0ZWRfXzcTTYdhp9vFN
 pQIhBEtqkiJu+DTEtMlTud21Q/cMOg5U+o5oNzW+KU8dEXcmnmilsOcjJ6R3LIQoVHF1EMU7Jh1
 Vjtg/wcXZRsIzxExjTmYRNlCFKOwP5Zilhel+Fm1YyjTj36DDVCkg/CvlKNpZxJPlQo98K0juzr
 2laEMMPx1gZRtVWBJgiVjv8TOd2RmFZCpquGJNy/qWk1NWLJKjcIkVHWqS4RE+xbFUSoWorTUKf
 8WoKfQyrBb+YiLf1wNsv71Bb11pVLPDEQ1aoOF+QPBEVpVe2ut4wxW7n7GG9VrD2zTLCTQmKBwH
 OD+50/3uSfamwLsp/JX8CgrF9aX3pfPAeNDdQTsrpelVWa8h1L6IlNuAKzz39MTnD3aCjopdd3Q
 V72XaCNR+c+fd7eN3WFUy+79V9R8rpc3iperu3lM16uMtQr0cXXQPxihKu4p/cli9Mc1vG3nA0U
 nHIrCw+7rJkCt/76q0A==
X-Proofpoint-Spam-Reason: safe

On Fri, Apr 17, 2026 at 06:43:58PM +0530, Niranjan H Y wrote:
>   Implement sdca_asoc_pde_ensure_ps() helper function to poll for PDE
> power state transitions. Per SDCA specification, after writing
> REQUESTED_PS, drivers must poll ACTUAL_PS until the target power state
> is reached.
> 
> Changes include:
> - Add sdca_asoc_pde_ensure_ps() to handle ACTUAL_PS polling with
>   support for device-specific delay tables or default intervals
> - Export function via sdca_asoc.h for use by SDCA-compliant drivers
> - Refactor entity_pde_event() in sdca_asoc.c to use the helper
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---
> --- a/include/sound/sdca_asoc.h
> +++ b/include/sound/sdca_asoc.h
> @@ -99,4 +99,13 @@ int sdca_asoc_q78_put_volsw(struct snd_kcontrol *kcontrol,
>  			    struct snd_ctl_elem_value *ucontrol);
>  int sdca_asoc_q78_get_volsw(struct snd_kcontrol *kcontrol,
>  			    struct snd_ctl_elem_value *ucontrol);
> +
> +struct device;
> +struct sdca_pde_delay;

sdca_pde_delay should go at the top of the file with the others,
device is already there so can be removed.

> +int sdca_asoc_pde_ensure_ps(struct device *dev, struct regmap *regmap,

Perhaps sdca_asoc_pde_poll_ps, but I don't feel super strongly on
that.

> +			    int function_id, int entity_id,
> +			    int from_ps, int to_ps,
> +			    const struct sdca_pde_delay *pde_delays,
> +			    int num_delays)
> +{
> +	static const int polls = 100;
> +	static const int default_poll_us = 1000;
> +	unsigned int reg, val;
> +	int i, poll_us = default_poll_us;

Put poll_us on its own line, and do all the assigned variables
first. I would combine i and ret on the same line instead.

Other than those minor nitpicks this looks good to me though.

Thanks,
Charles
