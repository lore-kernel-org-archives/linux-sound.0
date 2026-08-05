Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9466747FB0C;
	Wed,  5 Aug 2026 15:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785945084; cv=fail; b=Lof3uCo1EdoEiLsq3dU9mV1lHOYWWlxbVDuYmc1/uInq4xTD9dha3NuCccuW9xKS6YbLgmqg+Odya9Bq5zT0+oUZSeWETjkWZSxQ1FL2RHyE3w77jBSZDDhBPynZqta+5yiJghclVRtcuj+4vwRSoArr815wJBCzpdBRyxD9vyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785945084; c=relaxed/simple;
	bh=kEut90RvMNBu9qbm0DWNbMSA4AlCilkkFyaFTvJzZm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P43W2aSA+fSXz5se005jx8Dk1bCc1ZJE15cPE4FpSfvTBEDwkRhCd9oPxbrqez19GwLku2m+9/vy8kz/cJIcvTe4NOdotAnH9ZMctZ5lHLNDQslzSeAD7eh53pTY6R+Ma/q5yt4+0V2YJ/l+BRgxKuJFb6xl+k3A8GLgpXNU2rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Brvd4GlB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jCRTjt69; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Brvd4GlB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jCRTjt69"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675EMRu03530089;
	Wed, 5 Aug 2026 10:51:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=gt27k3BD5RtZ2+VX5F
	Vfj44RxBpDQqRmS9//JDVGYpA=; b=Brvd4GlBTCK/HNlc16CpPJjseqOft+mXqS
	dPDO/wIRyHotwTI7MM7VVtvvBgGGmXg/5NcDlgsfwWrvjXGqRK0oYD8DDdv68UFu
	9djSXjQy3M71pEg6UYCYa0kvL4EZeHLOHGkXBtLJirooPZKHFW4z1uVUDN6R6HLU
	1fjxmxEq64nAdK/QMmtCmxLKaEo/MdVcax9tV/Igfp1vAOEk34ueOou12SLrzK+0
	YrPEc5JNWNSnO7GomY8h1HN+7pch0Avpp1csoOwRZIuN8ak5a4ZN7Nz4ylvHSMXa
	40BwwKCk/jVvs519DzkE1xb8JZGLl3P8ZBcgrFF47WA0skFfONXQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020079.outbound.protection.outlook.com [52.101.56.79])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fsd7h63bb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 10:50:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFDgwBNRZHeRC7h6ExUfBa8VwZsCx3lb/a8QpicSLE9uZFMZGFrAP64HWp6i/Ol+YFPasH3ZAunytFW1/MbDOGQ0nn+CGV2c0iPrG55snq7BjcgDZDxae8u8d6chf7K9LhQCoIawwGweAfNTBJHqm0ELUrSiKIyCDRopCmXKbGdG0b4L/MOR6iqFrE0vZtCtPTa1AnQ6Hwwo4pgOLfPsI+/7pbQ7YqtHDITJUyWHBWtE9bDFQbyZvzobNfA+nwju4dtHlLX4xMazJNW3+OO9bLkqNsWl+G6L44VG4q9f/7fponImnJOqnnWvlzNo3sAsCj5qG/LKc/FZgPUl9Osfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gt27k3BD5RtZ2+VX5FVfj44RxBpDQqRmS9//JDVGYpA=;
 b=k/uMEnQo/bNnaep7qv0IaaNZnNUpTZ6OzgmF6itvdVQ7zruQwvvjBQc3BrCSKQv12x53/zZLD2tKGlUhaVWEzhw0JnQUxR77LmKStuXxXw1VW9KBKxUFSvAvUVE3NuMS9tTALS1X2Y57pgxuWh0M0JqB+9ZQaXx9wfGSBUyfWexp3ZB6Dhp3vuQ9ozMXD8D1fhd+1RbjUboX2qYOY7iJtLPaSOyPhqGjkBqWC5XdvoJvezbHJeWwAgnycEjJFEv5qd3lN753YW0Zx6RiU/nt0n3XjNXXHX1Bg52Peq0FsMbmciQ+u0gTMTTN8B++28VRIp3Wq+PdNG0u1yhl0Zp21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gt27k3BD5RtZ2+VX5FVfj44RxBpDQqRmS9//JDVGYpA=;
 b=jCRTjt69+0P7hrUYU8x8rAdQ5mS5aNkxq4gYGR8SFhfIlGQVdkSCZd2KCnCBkqxz/e8DhJ22dYRu5hWXIyCa5JPWgCHL9D+YWNY1V0K5izczLCD1cc80ywF10F9K85s7KzcspaXsno0iLQSLey5VPGCCo2zEyeTkHo1Ap2vlUhI=
Received: from DS7P220CA0073.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:259::7) by
 PH8PR19MB6974.namprd19.prod.outlook.com (2603:10b6:510:22a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 15:50:54 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:8:259:cafe::16) by DS7P220CA0073.outlook.office365.com
 (2603:10b6:8:259::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 15:50:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Wed, 5 Aug 2026 15:50:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 971B840654B;
	Wed,  5 Aug 2026 15:50:47 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7118F82024C;
	Wed,  5 Aug 2026 15:50:47 +0000 (UTC)
Date: Wed, 5 Aug 2026 16:50:46 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 4/8] ASoC: SDCA: add PDE pre/post-pmu hooks to hw_ops
Message-ID: <anNb1uNUO87Zmv74@opensource.cirrus.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722234221.884765-5-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|PH8PR19MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: da39e73b-999b-46ae-3299-08def30951f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|23010399003|61400799027|36860700016|6133799003|22082099003|16102099003|18002099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	RD79RlwKRFvr2x5uz8KypNSM6H6Ld7aQPpVUksOd6bkRJTC867WwnasCqLIO0D0rTj/k8JHkRJ08/Pmnj6KEmAI4wOVll/Zyx1OFdQriGigh99KAwUlUPTUaTv2JJRUMCkKhYpst1Qc9Iwmk6GndRC5Jg/sDNhB44WEc1oS7nev3sRkgiEpAyUAN3gILlk1Ju+bMPujAhy9RpZIYckLl+4KUhbnx+M1aDJQPUIwt7XFM7H2zGPInv2WQ6oEsqSivII6eMnux072V4VDD07F83RmJiHcYK1kEVhQSEKQhsvWU1y2MtYJdG1qBQ7Brn59tMxDHSRA5gAmHQi10T0zuCs0Ih8RSNV1/vQq5M/cmd2ztGTJSmdI9viskKjzLABORgsxfQNLNIzEnC91h56Z1bNuUvPQY72Dr/4aUeXwPUEpcG2G3EF66Pv3EeiGA771ewkmlX1Jn6EQL2HvMsurlwme/7XbWMcUTK+dIgvToIUaL+ex0Q51+Gu562ZcV/mxytV2HgzEgV+/HBj2TLZHaYllUHKSO5CVieSJJHbPo42GNw6T+xKTAb4qLQerenYumPsGURL9vqFRmPX0jnvKZukkKy7skcB9uLIZ6pMgUpnm73NUqKlAgNmh4ZS8dR8RpC6+u1/3GjbPLvLTm9B/JnB70QVFO0R+qYKOshE1PGMtjFeVcC8UXJXXmjrk6QmXL
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(23010399003)(61400799027)(36860700016)(6133799003)(22082099003)(16102099003)(18002099003)(11063799006)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I+Qs98yZjRhDWTFVN8cvCFazroLdpqO7rq/Gu/Bc7b2tvSmV7XKOYoc+uRcd1T2hMk+Wv4pLsp1nR9yJOocdroPtScZ7n8Q51HOiDVSDzGYgn9weKXoj+hGV8XNj0atKdYWHe/Z1jMkX7a8e92YPxhUaenRxx71YJkzJzjq4h8a0rySOyLnUENXFhU0NcR4nT2SDSkyoEkvG0+XxtHWo+53tk8mdFHvD4P0P0CGQo8Hq5Lc3HFXK6SVgiLGXfgaBdnye6xFWq1iKzuvSWw8VFI/TIn4l+YYcLyIwvz2QcQatVIin9wIgF0dZmnSxFX8R1sxY3tLSnpF6691ov3610j3WWEiEq439j4ThqIzIKssKXaVIHIc3fUANCZzPYbBjALWaAHoUWjtIgZi18Z9elmp7W06t+7BTxrQ+ONb3KWk+KfkCtwKe+CPnOsF1mHW+
X-Exchange-RoutingPolicyChecked:
	q5SAhzMzSoq3EiicDgio+WG6vtFovQOFJeDB9edplTMuxwnQyZ9uVG7CQTQGhE0FsYb0FUpah7dmE51/0Kj+0URjZuOtHrQhrBtTbkXsec7tGe6gFAizGA0i+magwPyNUaL/2YmNnUjvjOGfvp0aSR6cQG2dv/s37kmGUjqTElDJZeeXQJ0DzqI+q8ve3goBnciVvcdw6lO6KM5/soeTvtn4/v6Dvq+gT1z8aKJrNbAUlyuFPqM6dGCyhkQ4v5MliZi6KxThhBpMBSkA38pfqgHKuoqmGZW2+DkBUlqaHeS48AEH5bvFGIPbFLKCNcEu4qq0Faou8+iadrVkahWFog==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 15:50:48.6147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da39e73b-999b-46ae-3299-08def30951f8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6974
X-Authority-Analysis: v=2.4 cv=ZK/nX37b c=1 sm=1 tr=0 ts=6a735be3 cx=c_pps
 a=kNb0EPoEURSSyKZUeQUlVQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=EUspDBNiAAAA:8 a=6-0cdJtF18ODVkxtCagA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: S-_y3hXGwOwlYNUgYLG7j_AnmrXTv1OG
X-Proofpoint-ORIG-GUID: S-_y3hXGwOwlYNUgYLG7j_AnmrXTv1OG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEyOCBTYWx0ZWRfX7zdiOeD1iIeV
 BdKhfifGU6w6Pf6oEAGWUaQqv3w0U8blFPMa0xmea/KjTl7+XcvMLnFCoXnpm9woOIDxOjOoUbE
 Q1WACgZrsdwMuvF6mII8rrJPgnn1FK/3AGNaLl22OmxiE7lBXiCqQtHBdQoeilSzX6cgGdtNgA7
 Entt0JBLm5lStIazhJqGnXYO5t2cFNt9KtoUWj3Fdagp1wwYS+rRlOf0E7AxyCzAhKW3mW5mUIR
 vbWWxWoURnrwkM5RhZrdvJQApcSjBjSmiNmBBLTBaCvkRWooxmo+d6j03/zD6vFgeUmYfTdNxZl
 ZLoiSxSaaFFkGhvPtqiSV7QqEQS+GH8uJLjKemOv0YgtmeXy5HREEuYEb48aiQsS4L4rFbaR9WW
 7dR7qIDWsl5d3ajwSh6Ke7KfTPiweXDXO8fX8CscD4Ywp02kaFl8KTx01zb1fFOvrbTKqa4niJO
 qj9vv2g4/3rxvF06TOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEyOCBTYWx0ZWRfX/O6ngBvxDwqx
 s206D536Q6HkmmVml5wqmxUPJ2regor14rxerd9bUvbgAGXwRoLXIl+VSY3a2FluZfoZTy6tsea
 NLqEoxBgyT3qnPawvRvXu35gq2uzr0M=
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 23, 2026 at 12:42:14AM +0100, Srinivas Kandagatla wrote:
> Add pde_pre_pmu and pde_post_pmu callbacks to struct sdca_class_hw_ops
> so codec drivers can hook into DAPM PDE power-domain transitions.
> 
> pde_pre_pmu is called before REQUESTED_PS=PS0 is written, allowing
> the driver to stage state (e.g. IT_USAGE, MIC_BIAS) that must be valid
> before the PDE sequencer runs.
> 
> pde_post_pmu is called after REQUESTED_PS=PS0 and before ACTUAL_PS
> polling begins, allowing the driver to commit pending writes (e.g.
> FU mute/volume via SCP_COMMIT) that the sequencer needs to see.
> 
> Both callbacks receive function_id and entity_id so the driver can act
> selectively per power domain.
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/sdca/sdca_asoc.c  | 33 ++++++++++++++++++++++++++++++++-
>  sound/soc/sdca/sdca_class.h | 11 +++++++++++
>  2 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
> index ac688cd62970..795498b9a314 100644
> --- a/sound/soc/sdca/sdca_asoc.c
> +++ b/sound/soc/sdca/sdca_asoc.c
> @@ -32,6 +32,7 @@
>  #include <sound/soc-dai.h>
>  #include <sound/soc-dapm.h>
>  #include <sound/tlv.h>
> +#include "sdca_class.h"

I really don't like accessing the class code from here, bit of a
layering violation.

> @@ -432,6 +433,8 @@ static int entity_pde_event(struct snd_soc_dapm_widget *widget,
>  {
>  	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
>  	struct sdca_entity *entity = widget->priv;
> +	struct sdca_class_drv *core;
> +	unsigned int fn;
>  	int from, to;
>  	int ret;
>  
> @@ -439,6 +442,19 @@ static int entity_pde_event(struct snd_soc_dapm_widget *widget,
>  		return -EIO;
>  
>  	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		core = dev_get_drvdata(component->dev->parent);

This is probably not a good way to do this. Ideally we don't want
to assume the class driver structure above this code, we have
users and are likely to for a while, that are doing more custom
stuff. I suspect we need to change what is stored in the
widget->priv to give us access to the bits we need.

> +		if (core && core->hw_ops && core->hw_ops->pde_pre_pmu) {
> +			fn = SDW_SDCA_CTL_FUNC(widget->reg);
> +			ret = core->hw_ops->pde_pre_pmu(core->sdw,
> +							component->regmap, fn,
> +							SDW_SDCA_CTL_ENT(widget->reg));
> +			if (ret)
> +				dev_warn(component->dev,
> +					 "%s: pde_pre_pmu failed: %d\n",
> +					 entity->label, ret);
> +		}
> +		return 0;
>  	case SND_SOC_DAPM_POST_PMD:
>  		from = widget->on_val;
>  		to = widget->off_val;
> @@ -451,6 +467,20 @@ static int entity_pde_event(struct snd_soc_dapm_widget *widget,
>  		return 0;
>  	}
>  
> +	if (event == SND_SOC_DAPM_POST_PMU) {
> +		core = dev_get_drvdata(component->dev->parent);
> +		if (core && core->hw_ops && core->hw_ops->pde_post_pmu) {
> +			fn = SDW_SDCA_CTL_FUNC(widget->reg);
> +			ret = core->hw_ops->pde_post_pmu(core->sdw,
> +							 component->regmap, fn,
> +							 SDW_SDCA_CTL_ENT(widget->reg));
> +			if (ret)
> +				dev_warn(component->dev,
> +					 "%s: pde_post_pmu failed: %d\n",
> +					 entity->label, ret);
> +		}
> +	}

Can't we just include this in the switch?

> +
>  	ret = sdca_asoc_pde_poll_actual_ps(component->dev, component->regmap,
>  					   SDW_SDCA_CTL_FUNC(widget->reg),
>  					   SDW_SDCA_CTL_ENT(widget->reg),
> @@ -502,7 +532,8 @@ static int entity_parse_pde(struct device *dev,
>  	(*widget)->mask = GENMASK(control->nbits - 1, 0);
>  	(*widget)->on_val = SDCA_PDE_PS0;
>  	(*widget)->off_val = SDCA_PDE_PS3;
> -	(*widget)->event_flags = SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD;
> +	(*widget)->event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +				 SND_SOC_DAPM_POST_PMD;
>  	(*widget)->event = entity_pde_event;
>  	(*widget)->priv = entity;
>  	(*widget)++;
> diff --git a/sound/soc/sdca/sdca_class.h b/sound/soc/sdca/sdca_class.h
> index 74db9d4ce4a2..1278159ea61b 100644
> --- a/sound/soc/sdca/sdca_class.h
> +++ b/sound/soc/sdca/sdca_class.h
> @@ -29,6 +29,13 @@ struct sdca_function_data;
>   *             an array of struct sdca_function_data and stores the number
>   *             of entries in @num (must be > 0 and <= SDCA_MAX_FUNCTION_COUNT).
>   *             May be NULL.
> + * @pde_pre_pmu: called before DAPM writes REQUESTED_PS=PS0; use to
> + *             prepare device state that must be valid before the PDE
> + *             sequencer runs (e.g. IT_USAGE); may be NULL
> + * @pde_post_pmu: called after DAPM writes REQUESTED_PS=PS0 and before
> + *             ACTUAL_PS polling begins; use to commit pending register
> + *             writes (e.g. FUNCTION_ACTION) on devices that require an
> + *             explicit commit trigger for PDE power-up; may be NULL
>   *
>   * Codec-specific SoundWire drivers pass a pointer to this struct to
>   * sdca_class_probe() from their sdw_driver.probe.  Codec-specific
> @@ -39,6 +46,10 @@ struct sdca_function_data;
>  struct sdca_class_hw_ops {
>  	int  (*hw_init)(struct sdw_slave *slave);
>  	struct sdca_function_data *(*get_function_data)(unsigned int *num);
> +	int  (*pde_pre_pmu)(struct sdw_slave *slave, struct regmap *regmap,
> +			    unsigned int function_id, unsigned int entity_id);
> +	int  (*pde_post_pmu)(struct sdw_slave *slave, struct regmap *regmap,
> +			     unsigned int function_id, unsigned int entity_id);

Yeah this needs a little thought, the top two are directly class
driver things, but the bottom two are used by the lower layers.
We may need to do something like split these ops into two sets.

Thanks,
Charles
