Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293D620B810
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 13:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617926; cv=fail; b=BHPEyDHNecqtxrBZFHzrV3fxI0p4nZcwRJL2fN0LCZRBNGM1J7PwhzvKwG3wqsYNwI9gO1gMivYM26AIB/rwplBiwbpY+7tjIbeirvo4X2k3smoyGZMxPMFdUptPI77U468O3jVIntonunbn27SLG1pSQepAY01UQqqdwiu+b6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617926; c=relaxed/simple;
	bh=/k+xdnBDaoZepy7fApRjW+C43A0c/5m9qHAevsvNIS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUznCEHWHRx+riAVK7Cs5jwOtGASt35ZKhJyi2B5kITDGYazIrfkAvIf798d87Myr/Q5fjv8wW7qj0zPjI2OPLx9tPhBj6ER0QXc5GPSY1uRvMAeHJWN32ZoZ6weOzqVd+u/DmMf7z2ataePk0EUyWyC2zNkeqhoB017Cu82/kY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aoNqV7Ny; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=eyUdTZyb; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aoNqV7Ny";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="eyUdTZyb"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6L4TB1713693;
	Fri, 27 Mar 2026 08:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=uCDyjkFksYMQtn/FLj
	xANKPC71Gyuyl/fYD3oJMJ/h8=; b=aoNqV7Ny99JgRvkQQTHjwiMK+7JPVI+l0R
	D7yLRLRqLM4qchiiPMh/lHCK08Bvc98GMKyOhNlRlQI/ydYw6qzrbxYSSBwO9GyC
	IFTZMulhAECgNgPj1LCs6iNU755WLw99fLZkH4OCoxj7bEVEtiLnLkV9rCvdgpdF
	stRwCFwiZS0sPu61Uaq+v6gh4qBM3r/VTGtdMLsXHdOpk7MTTf1ZCFb9R24hxLh2
	/qVx1iQ1xRkp5dVq1jwPmX6IGIG/u8iSmNdsUwVB8ZvRiC1jZJqdi9bDoy1h4zah
	XlMWhK1FVKZkKaKmYGYerhLwdmLzvuDIusgfeqAfAApX8Qk0DIwA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023099.outbound.protection.outlook.com [40.93.196.99])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d560qhpgq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 08:25:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5PHyKdL7VGfHaE66ij15dye1eP38kesLj4XAZWMtUSxAXgO9Cf28tSgg5AuoccaB12PW3eWtsRKataNbJDibwqenqoLxao46qXPA9tUlQnICihbPgOrRRF1K8wQ9XTe7F1bu6NqFwok5ODFbgjK+FHAY/AyxauFx56MfEIxlrJ95ook2yo29xsL5TpvzYs/p48MkxRtMvXH4z3g5Rq/e0fBRqxoM5LGrgAYgXaqQbkQbRt3dryp3337PZbJSRBgtIpOUyKyvbX5Otjh949/CCGfuXCRy3gYbhaZLiNtmRnSCcuXIfjYj/QnkGNPzuIONMZaxBgllDIkJyXH456XZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCDyjkFksYMQtn/FLjxANKPC71Gyuyl/fYD3oJMJ/h8=;
 b=daD2K72Gp7JqKHmrf1MSYjUDuesQXfqDqDhGPq/u0gPupURmWBucyHGbgPGUPzEZRAfGbSJ5A22DPdqVcwhLa9meJk5kjeshSLVrwJMdvwxv5MZ++6svTgUVHu2HNEVS5q9YaGKX625pPLsvidlV2yI0PEDYBJAXxsuN8mre9JzXG+Fk7ezgbB0Y0jMPKd0oQHhXhp7KFIrdo962J/Oh/p0gHCUWxKHFsr/+lxW9LP9pTfT5sYzITYHtovGWp+qPWvTC1A/ovIgfqfmvEnsEtd7UNv/ldn3ZOuA3ir0P1z4PizrTu6isFBCzsZsG9HPhvraCFZWeeeTwhxvP7t4J1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=everest-semi.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCDyjkFksYMQtn/FLjxANKPC71Gyuyl/fYD3oJMJ/h8=;
 b=eyUdTZybWeV/Khxv1t4DSPzoUsOFjU1LBX2PvfrWBn772E5YkSdo/0fCyt/tB4DhFJo1eZsSwf7xRnd6JXZ1saC1PjsOSUj6VUfs4g0uUEQtK6soz9HKGPfvCkWqFJ4Dis3C66uGddTBbpEsuznjAixfN8/uVVoOMljAGQ5E9/k=
Received: from CH0PR13CA0014.namprd13.prod.outlook.com (2603:10b6:610:b1::19)
 by LV0PR19MB9309.namprd19.prod.outlook.com (2603:10b6:408:325::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 13:24:58 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::30) by CH0PR13CA0014.outlook.office365.com
 (2603:10b6:610:b1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Fri,
 27 Mar 2026 13:24:57 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Fri, 27 Mar 2026 13:24:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E641D40654A;
	Fri, 27 Mar 2026 13:24:55 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C85B2820247;
	Fri, 27 Mar 2026 13:24:55 +0000 (UTC)
Date: Fri, 27 Mar 2026 13:24:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: broonie@kernel.org, tiwai@suse.com, linux-sound@vger.kernel.org,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
Subject: Re: [PATCH v4 4/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
Message-ID: <acaFJh0SF8SF0n/9@opensource.cirrus.com>
References: <20260327095954.3465-1-zhangyi@everest-semi.com>
 <20260327095954.3465-5-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327095954.3465-5-zhangyi@everest-semi.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|LV0PR19MB9309:EE_
X-MS-Office365-Filtering-Correlation-Id: 190ba2b4-2db7-4cf0-119f-08de8c043d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700016|13003099007|22082099003|16102099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	W2kqUJiIwutopuEZvfeD+A+GdyCq/d0IeFPiAMkOZTjBbiow7/G7dBnKWa0yQtoD3YDQvwFGsD821yxPgsY3mMu5DHEp9MfRa1Yquk2yq2wHo5IeO3qMn+W1gnxiJ5ZFk2bpYNj3eX4DXEbEwB1Iea23eYKvQ97VETHAFwF3QkcPKmo+tzBjuGcQNXbhkbYJUy03ZfzsqMBGz9B2U+GnUFI/R9l90VzgxEP1X4weXtPukbDmdcSA55mPclfMs8JDg46DbLBIRwCZMUqN/K2RWEChvwR++aWLD4jpS6AforS9ScAd3Y44BO2J7CSdmEuUMJk08TtyqeRlUzYObio7VzTu1dJrjhAhP7Xb5cUlnOgQRNBtDerBBNTIs979s/QmbxMMvwIVNxdI+CUtuN1dZnPOliibbRajvk5UbqcBexSZQ8Q3AhtfmNeS2GRIK8UZsDRrhqMNevmRh+JYojG6RNfDbiTK+RIaItiOZMmINRprFVW1cN3YDAaBiwajZhvACupcRbRGx+RGOQhlqXhINjVdP7sHlXRki4VysWdLRjUzajkwCUraNLKcAemZPOIXFbrNDAwEe27a/yJ2U0GMJCKIpb/gcMsKP0JdTNRl3+WC7V9TZFKyeZvF0s62upGW/nI5lof7MYBeZatMSlFrHkA/op+yxfFVpMx/nkW3uh739M1LRRFXQS6Zjh3U63yvmk3AaXoA2dSb1QVOIrZZEkHbLs/3MT3YErOMFSvI+0I=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700016)(13003099007)(22082099003)(16102099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rkBNBJvB+AwvUb/2kxw1LFyY/4/9z8RQXNUjTqOJmcGyAPN+RFzAmP3f07iO6dujG6xE+aqoUBUamaxvfJESZF+8duC3DiyvLSFnokrc9ZKTTFC68daDvSMmpsJWali+8fG4wdzvKf3KmHUmGZyG5+5ZVQPOYBrCVKOye4+daZN/F4TFpq9hmhr9CV6dKGgKUNjc6KEAtbstSNwJ5BOeyKzQNxMBV2HORd0fP4VzPWiaoEKFJavvPIagvODe2bF//2zhIXGde8bvPadRJkiXxEn3NVz8A7IkHy9fPCYqLX7IvSlw6k15N03NPcBPwr4xx22ihWi9jPOjh2qqkR/Ulc7p6Ws7lbo2rPXHRvzc4BjCczv4qzOnjYBmKXbWAQ2zr3m+4meKdvtx24yWN/wTwVxCCs5RcQm2G741uuZ23IPxgTP4CZtnQolXmF2j4VFW
X-Exchange-RoutingPolicyChecked:
	nVb/xh5vX2mg/lYm7bKB8DAUZLPf68JbuGDeykSfOIkOFud+XYy6KytQumxsdM746w5xRHlFjcMz5y5O6GvmKlHYyqgHC9mAvmGT/b//N2MDM8cN05g4iq7WO/96IXHcja6NEJA0UQf1ZDCjM03dqXu8UyHxbqsgt59hnTAcB0siqZF11o6WQSi37QzVYinfiuoso6OH/+IzBXlaCm7koS+MqfziCb+DqzxxYQye/REwz9M8dhnaFuh9cfDvgrYT01WgaBPpo91PdVq7LcexXAFakg4WypdrzX3t1B1fGR6xKzpmm30CU6DBxBjO/7THGVIbp+0YnWnSaSQTLb2sGg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 13:24:57.0443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 190ba2b4-2db7-4cf0-119f-08de8c043d81
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9309
X-Authority-Analysis: v=2.4 cv=VKnQXtPX c=1 sm=1 tr=0 ts=69c68532 cx=c_pps
 a=iMozJJ0ZMpdRlXWW5uynUA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=tdWpEtAxAAAA:8 a=Jmm2ylxVIryOywAGLM4A:9
 a=CjuIK1q_8ugA:10 a=jllm_RjNYhQZp96B3cJE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA5MSBTYWx0ZWRfX5WI+U8XN5ldN
 kV5LQfLt80ZyELWFiBiNRVdANiOXtrwkVrilD0SmbDVAmomv5pAx6QHKcd491XgwazatD+of9td
 WzjkMzQBBl1GywpDiKKwM1+CXdUjOqwEOwaNEjLXIJN4hmHVGH3VVGIa7qN/bMijwJrB61hEpKg
 f5yTKhdYFjWqcTZfZn1Fo80c1LYeEUNvUq7M/Gw5EJ1gG19H+07Cel/YmeG3FbjKxSvQYQE8Kfo
 pr72dfpPYNUHKR9wH7FLpJjBpr9+2uT/i0BbI2xeiDu9y3G+2EItmwBqJJGAg8/mSM4hmIhn8gR
 s9hkbMVEdfJWnRBoz0FsgM0mD2heZRxK4UItyTbROTpSxhjXQEyxA8cv2NS2ZylPM/VkA2RXhu4
 eIrQplVZNv49aBeYgfTugD+zl57wmIrhH3mcA4L7Fz1vZRN04BmurbbMnTw2bbv3b1m6d3RlKa+
 yiZtMqPSULXbyZqjYhQ==
X-Proofpoint-GUID: 6FJLxybBtRnNbFkQ233yIii9Q8L-UDld
X-Proofpoint-ORIG-GUID: 6FJLxybBtRnNbFkQ233yIii9Q8L-UDld
X-Proofpoint-Spam-Reason: safe

On Fri, Mar 27, 2026 at 05:59:52PM +0800, Zhang Yi wrote:
> This is the codec driver for es9356-sdca.
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---
> +
> +	regmap_read(es9356->regmap, mc->reg, &read_ll);
> +	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), &read_l);
> +	regmap_read(es9356->regmap, mc->rreg, &read_rl);
> +	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->rreg), &read_r);
> +
> +	if (gain_ll_val != read_ll || gain_rl_val != read_rl
> +		|| gain_l_val != read_l || gain_r_val != read_r)
> +		changed = 1;
> +	else
> +		goto out;
> +
> +	regmap_write(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), gain_l_val);
> +	regmap_write(es9356->regmap, mc->reg, gain_ll_val);
> +	regmap_write(es9356->regmap, SDW_SDCA_REG_MBQ(mc->rreg), gain_r_val);
> +	regmap_write(es9356->regmap, mc->rreg, gain_rl_val);
> +
> +	regmap_read(es9356->regmap, mc->reg, &read_ll);
> +	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->reg), &read_l);
> +	regmap_read(es9356->regmap, mc->rreg, &read_rl);
> +	regmap_read(es9356->regmap, SDW_SDCA_REG_MBQ(mc->rreg), &read_r);

Is there a reason to not use the MBQ regmap (regmap-sdw-mbq.c),
it would mean you only need a single transaction for each of the
MBQs?

> +
> +out:
> +	if (ret >= 0) {
> +		pm_runtime_mark_last_busy(&es9356->slave->dev);
> +		pm_runtime_put_autosuspend(&es9356->slave->dev);
> +	} else if (ret == -EACCES) {
> +		pm_runtime_mark_last_busy(&es9356->slave->dev);
> +	}
> +
> +	if (gain_ll_val == read_ll && gain_rl_val == read_rl
> +		&& gain_l_val == read_l && gain_r_val == read_r) {
> +		return changed;
> +	}
> +	return -EIO;
> +}

Also in general for the volumes it is probably worth seeing if
you can use the SDCA volume helpers, some work is on going to
export these to help custom drivers re-use them:

https://lore.kernel.org/linux-sound/acZgyKuKns2wAZ1R@opensource.cirrus.com/T/#t

You will likely still need wrappers if you genuinely require the
pm_runtime gets in here but at least streamline the volume
handling a little.

> +static void es9356_pde_transition_delay(struct es9356_sdw_priv *es9356, unsigned char func,
> +	unsigned char entity, unsigned char ps)
> +{
> +	unsigned int retries = 1000, val;
> +
> +	pm_runtime_mark_last_busy(&es9356->slave->dev);
> +
> +	/* waiting for Actual PDE becomes to PS0/PS3 */
> +	while (retries) {
> +		regmap_read(es9356->regmap,
> +			SDW_SDCA_HCTL(func, entity, ES9356_SDCA_CTL_ACTUAL_POWER_STATE, 0), &val);
> +		if (val == ps)
> +			break;
> +
> +		usleep_range(1000, 1500);
> +		retries--;
> +	}
> +	if (!retries) {
> +		dev_dbg(&es9356->slave->dev, "%s PDE to %s is NOT ready", __func__, ps?"PS3":"PS0");
> +	}
> +}
> +
> +static int es9356_sdca_pde23_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char ps0 = 0x0, ps3 = 0x3;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_PDE23, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
> +		es9356_pde_transition_delay(es9356, FUNC_NUM_AMP, ES9356_SDCA_ENT_PDE23, ps0);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_PDE23, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
> +		es9356_pde_transition_delay(es9356, FUNC_NUM_AMP, ES9356_SDCA_ENT_PDE23, ps3);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int es9356_sdca_pde11_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char ps0 = 0x0, ps3 = 0x3;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_PDE11, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
> +		es9356_pde_transition_delay(es9356, FUNC_NUM_MIC, ES9356_SDCA_ENT_PDE11, ps0);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_PDE11, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
> +		es9356_pde_transition_delay(es9356, FUNC_NUM_MIC, ES9356_SDCA_ENT_PDE11, ps3);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int es9356_sdca_pde47_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char ps0 = 0x0, ps3 = 0x3;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE47, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
> +		es9356_pde_transition_delay(es9356, FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE47, ps0);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE47, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
> +		es9356_pde_transition_delay(es9356, FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE47, ps3);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int es9356_sdca_pde34_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char ps0 = 0x0, ps3 = 0x3;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE34, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
> +		es9356_pde_transition_delay(es9356, FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE34, ps0);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE34, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
> +		es9356_pde_transition_delay(es9356, FUNC_NUM_UAJ, ES9356_SDCA_ENT_PDE34, ps3);
> +		break;
> +	}
> +	return 0;
> +}

An additional helper function here that takes the register for
the PDE and does the regmap_writes would make sense, lot of
duplication between all these functions.

> +static int es9356_sdca_fu21_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char unmute = 0x0, mute = 0x1;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_MUTE, CH_L), unmute);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_MUTE, CH_R), unmute);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_MUTE, CH_L), mute);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_MUTE, CH_R), mute);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int es9356_sdca_fu41_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char unmute = 0x0, mute = 0x1;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_MUTE, CH_L), unmute);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_MUTE, CH_R), unmute);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_MUTE, CH_L), mute);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_MUTE, CH_R), mute);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int es9356_sdca_fu113_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char unmute = 0x0, mute = 0x1;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_MUTE, CH_L), unmute);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_MUTE, CH_R), unmute);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_MUTE, CH_L), mute);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_MUTE, CH_R), mute);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int es9356_sdca_fu36_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +	unsigned char unmute = 0x0, mute = 0x1;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_MUTE, CH_L), unmute);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_MUTE, CH_R), unmute);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_MUTE, CH_L), mute);
> +		regmap_write(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_MUTE, CH_R), mute);
> +		break;
> +	}
> +	return 0;
> +}

If you used the MBQ regmap you wouldn't need callbacks for any of
the FUs you could just specify the register to DAPM.

> +static void es9356_regcache_sync_volume(struct device *dev, struct regmap *regmap)
> +{
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
> +	unsigned int reg, i;
> +
> +	mutex_lock(&es9356->volume_sync_lock);
> +	for (i = 0; i < ARRAY_SIZE(es9356_volume_register); i++) {
> +		regcache_sync_region(regmap, SDW_SDCA_REG_MBQ(es9356_volume_register[i]),
> +			SDW_SDCA_REG_MBQ(es9356_volume_register[i]));
> +		regcache_sync_region(regmap, es9356_volume_register[i],
> +			es9356_volume_register[i]);
> +	}
> +	mutex_unlock(&es9356->volume_sync_lock);

Does this lock acheive anything? It is only used in here which is
only called from resume but you can't have 2 resumes happening at
once.

> +static void es9356_register_init(struct es9356_sdw_priv *es9356)
> +{
> +	regmap_write(es9356->regmap, ES9356_STATE, 0x02);
> +	regmap_write(es9356->regmap, ES9356_ENDPOINT_MODE, 0x24);
> +	regmap_write(es9356->regmap, ES9356_PRE_DIV_CTL, 0x00);
> +	regmap_write(es9356->regmap, ES9356_ADC_OSR, 0x18);
> +	regmap_write(es9356->regmap, ES9356_ADC_OSRGAIN, 0x13);
> +	regmap_write(es9356->regmap, ES9356_DAC_OSR, 0x16);
> +	regmap_write(es9356->regmap, ES9356_CLK_CTL, 0x0f);
> +	regmap_write(es9356->regmap, ES9356_CSM_RESET, 0x01);
> +	regmap_write(es9356->regmap, ES9356_CLK_SEL, 0x30);
> +
> +	regmap_write(es9356->regmap, ES9356_DETCLK_CTL, 0x51);
> +	regmap_write(es9356->regmap, ES9356_HP_TYPE, 0x10);
> +	regmap_write(es9356->regmap, ES9356_MICBIAS_CTL, 0x10);
> +	regmap_write(es9356->regmap, ES9356_HPDETECT_CTL, 0x07);
> +	regmap_write(es9356->regmap, ES9356_ADC_ANA, 0x30);
> +	regmap_write(es9356->regmap, ES9356_PGA_CTL, 0xa8);
> +	regmap_write(es9356->regmap, ES9356_ADC_INT, 0xaa);
> +	regmap_write(es9356->regmap, ES9356_ADC_LP, 0x19);
> +	regmap_write(es9356->regmap, ES9356_VMID1SEL, 0xbc);
> +	regmap_write(es9356->regmap, ES9356_VMID_TIME, 0x0b);
> +	regmap_write(es9356->regmap, ES9356_STATE_TIME, 0xbb);
> +	regmap_write(es9356->regmap, ES9356_HP_SPK_TIME, 0x77);
> +	regmap_write(es9356->regmap, ES9356_HP_DETECTTIME, 0xa4);
> +	regmap_write(es9356->regmap, ES9356_MICBIAS_SEL, 0x15);
> +	regmap_write(es9356->regmap, ES9356_KEY_PRESS_TIME, 0xff);
> +	regmap_write(es9356->regmap, ES9356_KEY_RELEASE_TIME, 0xff);
> +	regmap_write(es9356->regmap, ES9356_KEY_HOLD_TIME, 0x0f);
> +	regmap_write(es9356->regmap, ES9356_BTSEL_REF, 0x00);
> +	regmap_write(es9356->regmap, ES9356_KEYD_DETECT, 0x18);
> +	regmap_write(es9356->regmap, ES9356_MICBIAS_RES, 0x03);
> +	regmap_write(es9356->regmap, ES9356_BUTTON_CHARGE, 0x00);
> +	regmap_write(es9356->regmap, ES9356_CALIBRATION_TIME, 0x13);
> +	regmap_write(es9356->regmap, ES9356_CALIBRATION_SETTING, 0xf4);
> +
> +	regmap_write(es9356->regmap, ES9356_SPK_VOLUME, 0x33);
> +	regmap_write(es9356->regmap, ES9356_DAC_VROI, 0x01);
> +	regmap_write(es9356->regmap, ES9356_DAC_LP, 0x00);
> +	regmap_write(es9356->regmap, ES9356_HP_IBIAS, 0x04);
> +	regmap_write(es9356->regmap, ES9356_HP_LP, 0x03);
> +	regmap_write(es9356->regmap, ES9356_SPKLDO_CTL, 0x65);
> +	regmap_write(es9356->regmap, ES9356_SPKBIAS_COMP, 0x09);
> +	regmap_write(es9356->regmap, ES9356_VMID1STL, 0x00);
> +	regmap_write(es9356->regmap, ES9356_VMID2STL, 0x00);
> +	regmap_write(es9356->regmap, ES9356_VSEL, 0xfc);
> +
> +	regmap_write(es9356->regmap, ES9356_IBIASGEN, 0x10);
> +	regmap_write(es9356->regmap, ES9356_ADC_AMIC_CTL, 0x0d);
> +	regmap_write(es9356->regmap, ES9356_STATE, 0x0e);
> +	regmap_write(es9356->regmap, ES9356_CSM_RESET, 0x00);
> +	regmap_write(es9356->regmap, ES9356_HP_TYPE, 0x08);
> +
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL_MBQ(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_VOLUME, CH_L), ES9356_DEFAULT_VOLUME);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_VOLUME, CH_L), ES9356_DEFAULT_VOLUME);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL_MBQ(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_VOLUME, CH_R), ES9356_DEFAULT_VOLUME);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU113, ES9356_SDCA_CTL_FU_VOLUME, CH_R), ES9356_DEFAULT_VOLUME);
> +
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL_MBQ(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_L), ES9356_DEFAULT_VOLUME);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_L), ES9356_DEFAULT_VOLUME);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL_MBQ(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_R), ES9356_DEFAULT_VOLUME);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_R), ES9356_DEFAULT_VOLUME);
> +
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL_MBQ(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_VOLUME, CH_L), ES9356_DEFAULT_VOLUME);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_VOLUME, CH_L), ES9356_DEFAULT_VOLUME);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL_MBQ(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_VOLUME, CH_R), ES9356_DEFAULT_VOLUME);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU41, ES9356_SDCA_CTL_FU_VOLUME, CH_R), ES9356_DEFAULT_VOLUME);
> +
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL_MBQ(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_L), ES9356_DEFAULT_VOLUME);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_L), ES9356_DEFAULT_VOLUME);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL_MBQ(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_R), ES9356_DEFAULT_VOLUME);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU36, ES9356_SDCA_CTL_FU_VOLUME, CH_R), ES9356_DEFAULT_VOLUME);

If these are in DisCo you could use the class driver
sdca_regmap_write_init function rather than having to open code
them all. But fine if they are not in DisCo.

> +#define SDW_SDCA_CTL_MBQ(fun, ent, ctl, ch) (SDW_SDCA_CTL(fun, ent, ctl, ch) | MBQ)
> +#define SDW_SDCA_HCTL(fun, ent, ctl, ch) (SDW_SDCA_CTL(fun, ent, ctl, ch) | 0x80000)
> +#define SDW_SDCA_REG_MBQ(reg) (reg | MBQ)

There is a core function which does exactly this called
SDW_SDCA_MBQ_CTL() use that if you really need to do the MBQ
stuff in the driver.

Not that I am pushing for this now on this driver but would be
good for you guys to perhaps poke what happens binding your parts
with the class driver itself (sdca_class.c). The hope would be
in time we can support all new SDCA parts out of there by just
adding the slave entry. So good to start finding out what does
and doesn't work for you guys. At the moment the class driver is
still in active development and a lot of shipping products have
dodgy DisCo or hardware issues that make use difficult, so
this is more of a long term goal. From scanning the driver here
it does look like a few things might be slightly not standard so
I am not sure how well things will work but be interesting to
find out.

Thanks,
Charles
