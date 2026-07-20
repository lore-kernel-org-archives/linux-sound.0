Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6768D43F4A1
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 16:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784564511; cv=fail; b=dA7B3spB2y8yqOKIuIrpmtVVp+QQhSCmg8IPJXb7d8JYFWCDIb749kJO+baI0eldM1aQDOYV2uuztAnHNuM1EmH7f1/Hy31rF9tu86t6GW5weNKMgYzVqc2Um0FKaVqbHWLSxaEggOKoikYqGda2WkhPQhOtFH8VqmEDZFgsERI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784564511; c=relaxed/simple;
	bh=cV2PTZvZCVLYsCMXtOb1bWO6XCrnq16fHy9Zyc3IiAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChaigzsrfL+bTLGpzOY2xD2f0qGEJSeBX18YwO1y0YGW8xJ2VGRvKs8/MZCmqX23eTTpHiXN4bkHWPlxILf92vLNGmXZAXvFwkvlv3GnjeDbzDSPC1hHNNbUPeZCHCewAOpRA7YLZYQ9aHB3U58MDzyq2v1yfF7ifjSh/3Alxz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mMIGpwH2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xdZMnTVg; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mMIGpwH2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xdZMnTVg"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KBgcvk100316;
	Mon, 20 Jul 2026 11:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=z3hb1/V4n7TU+LenUN
	H2uoMo7/TV3tVkIQIjBosHU7Q=; b=mMIGpwH2XGe4t2FYuSMwIRkwENT7N/1jJ3
	vphV63p0YXfkm3efImjpNYQN8HrUu9WGyAsD2GOxIkyiccLVfHAtNp4Qv3LlvzPS
	ys7n2mADbSBTLSy/2Bp7s0vVfcemQoGPfoYTVpWX/bGgBmBOAvV1Bdw7TCvtdpij
	spQ+iMOc9tIdMiiEP4yqzUNSHya0vidkJjrNuyQHUYFwNFAvG+35o1bp+aAY3BdL
	Ujn/4Qb/2uwllYFBCWR53MQJcKjXK+XUQDg4kVHLYMRJJ5syCVsp0TmefK9DjNmD
	t5jyH7vYTJAUrEMywblGIgKUuIfia9EWVkJpvin2XBJDc9CnkyBQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023108.outbound.protection.outlook.com [40.93.196.108])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vyjr4s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 11:21:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsCxug3cpgoUA/cNgjm+dlHugvtd0er4FXXtCJhxpf/slFzLZKmg3oslR+W6Fqk6gaa9bcQi8JMpy/STSmuWYKONs5BOvK35w4zwLy5i9EIRfbI0KStgC6g/SciO0qiu6UIIBt9Am1BNmG8pAk3PfenR40d7EKZQCWL0jZKDL+rxbvRXi4tXkLhpCNuwKYcabi8mFgAuyfkJJRTxXkjvV9SHhoWaHve9bGnJUPfBD7gkO0Wr9h5pNQN2T6Uy2pbOrvMYS7Kvvr4GhfdReZNqScdNm2QVqbytinEj+UEPS3VIMLHC1+tk1tcsPMDpY3HYRQhBv9niuO9HIyDRCgG14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3hb1/V4n7TU+LenUNH2uoMo7/TV3tVkIQIjBosHU7Q=;
 b=R+5UimSQYIfMRfiJm2Q6hUPrsIckArM2WqXQYgKQPO3SC/PfgvCGjxz4CfneUZYSqqESbYmYz3BJ5dckj9hSBO7wvogbSIHG467RMVYQ+qpDQVALs4OWo2OZUYr21W+MPGrZ1S2Fpj+NDXx3m/VbGDz62Q2mNIKE/pu/lE6dyAooBACrOteBbGY5Q3ZByCWUXgWb/5yuF8z0A2w6fed3BDk6cdutUVSBU40a5KZ/MHLkTeJoh5iRCj4n/QcPlz5wLKW2O7uGRPt4xJfbEyaF0kRgmrtriiRFrcvI0R1r4/UFixw+FK2ThnWHOIzw9OuMauWL8im0T4tSiwVG5JxkMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3hb1/V4n7TU+LenUNH2uoMo7/TV3tVkIQIjBosHU7Q=;
 b=xdZMnTVguNJq6pdVRSnZ6cUEI+fbOHQmkkixSdnlZMCM4VUF+M5QVvXUm19jr7bml9Xx7+xLsVNaD+ZggZXeLeOFusGXrcgMFfVQL5HK2XCFa+Aymp/OgP4qc1WwRanlT+lzhnaWSH7qQhnpCZtexXvnw1ihl+vmlgdDndeVydk=
Received: from SA1P222CA0187.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::14)
 by LV3PR19MB8253.namprd19.prod.outlook.com (2603:10b6:408:1a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:21:12 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:806:3c4:cafe::93) by SA1P222CA0187.outlook.office365.com
 (2603:10b6:806:3c4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Mon,
 20 Jul 2026 16:21:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Mon, 20 Jul 2026 16:21:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5721A406541;
	Mon, 20 Jul 2026 16:21:10 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 42DAA820244;
	Mon, 20 Jul 2026 16:21:10 +0000 (UTC)
Date: Mon, 20 Jul 2026 17:21:09 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH] ASoC: rt766: add RT766/RT767 SDCA driver
Message-ID: <al5K9RHWIeHjL0BM@opensource.cirrus.com>
References: <20260720090613.2239891-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720090613.2239891-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|LV3PR19MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: cd50ef74-64cc-4fc1-8564-08dee67ae9df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|23010399003|376014|82310400026|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	AUN1fyLB5i+4r7gR4NF8QF2ujHAsuGtDiQN0r2Ladgz1GPNLp1wAHiWkS85mtV5Ss2YRiJqNaZ5QXAey95RJJITRC8O/q/ixG4MXPjkk8pbjq56u3MnJJT58ld3lbPLGHOhPLvbA+OJsDIaQSaGLCNj5/p8yg/2VV24S4wayFpU8diNXRG8/m7HeUHPgnNmdkkP9ypwRVNYOGuZx7DOy21z7lUb6CoR8zIu/MQOTFNtcqiVSxkBGKJeT3HOBR+xIJttSInRzLoP8g7mbFIYzNvBlJtlpdXJSrynP286NyF2u1G7227Sy2LHq1s41scW3lN9+/YjL3lM+rHZQ7EeuUu8hnCzZjWQV60jm8W/PSLwPsrAbtFgcUCJiyG7Enlz2vfAs37hh4MggxAKRuRNCt6ZkqsVu1PGhLwJdXle96UuM4Sda8Le0ST5jiCcAWIdfKknkkdEV+2BJswU2nyc4G1coG4tQXBfl8ZxRzQLmADdYgYX438dJXIwaNjQo/X+EMZT9oizY4kFFRW6Per3yRofu8+qy9sahIteRpgcjyf7KZ5+1GdSvZTsh68zLpFkWsrhLuIpfUEl/wH7xUQDyIwvvtC7bLeM31XEEpXhPbCgewRbcmBafWfJli+GDixHNzncMGnqk3NQ85y/vKrZt3YlmLqprP1vFHuUYnIXdqggxCVzqXh7d8r76eo34Od5E1JvZoGlsl9mT2NxefDkogQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(23010399003)(376014)(82310400026)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9uQ+KiEvsSqzWSEggW0GjijbCTdkxZhRBic8rqc6gq4k2y1ZVEXzNDun31z2zoOS/1nkv9gqJyncrx3kxH4ACbqtLoqyQAlT5e1DnC41l45NdIep9Qx0SNu8wBI5vxjKx/nCa6IHwL7YvC6omjsTtryGrd+Qcv7EAEpxZ7bjffBWGBDCxZaP7fAwXuHur89XAy9ggkYFXKEWNKBV5pWBbxVyEcO+OS2c+VSz1wagD/6ez84yG7BFcmxvSczyuC4ku/sav6akQfmuKjqE1MJVk8HFxGsYrHokBsHnCrIvn/bHZKcAG0tJ6YU2g9hElHsIfJCKv5pasKJFkCqLH3Ac9oUIF5D3D702kjwK32lBp3Wg7+FFkOm5nfO1IVwk6qDaILmzTg7jTbbFneYPrU7v8AgN6uLpIN2AFFjG60FD+HJtSUOOb6h3A2eFtSuSNlIW
X-Exchange-RoutingPolicyChecked:
	nVR1fhkvOcYrpmc+EzmzUzsiuR/5xtWwB/RdNngxAFDBNYFmG4mkr0kEGAEoWHIXfcVnIrC+ssKWnwdcksYsKk6gqhtZFMA3c0rKKIM7woYAMb6wQqihupTXaMrfCzs1Ede0eiTW6TkLuS/A4hNR9V3y2icn0sIVM0IJy9WFpjMPw0NPk6YYZLPmJQQ34W9KSgehhRTdYJcBFEl4QkaCbsIWlIXLm9t7X1S+PBH4GWLdM3Va3bYwRBE/weWoUu6WOiwuZk1VCIUnNzx0xHMCgkGywyrtIy8zIGqldlXLzHL2oe+V4EPyYTiZ7XQ3b3A3RamUqVoT/IAIJtO4zXwzMQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:21:11.4468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd50ef74-64cc-4fc1-8564-08dee67ae9df
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8253
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE4MSBTYWx0ZWRfX/cixuwsZQP0p
 apqA8loJYnNOTBV4Ox7K5fLq/4Sb6PzdOpO28xpc+uZyixCEZA8SPnS86JC7Hoiyo1WqTf3PHsS
 iVotxDLBk7Y88aVTZSexMi9odkm83FM=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a5e4aff cx=c_pps
 a=5+C5dWQ2lNXIGJ5Pv9T82A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=n9Sqmae0AAAA:8 a=062RrBuUMarYxC8gZw0A:9 a=CjuIK1q_8ugA:10
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE4MSBTYWx0ZWRfX9xOroGZQ6LwY
 zJuZzv/iI7M0k0gb7loQ5dvEsW36zGJzf6pIQmtl0PMiQMyi96jwpHV9ZlDDapAVhSl4w58/H4v
 X31yn0rNoZhTvIBwzL66E5TInSMbwr7JoCZXVlCc3Qx1L0kSPqx2/Qkb8zKpesUZZ90aVQ/ks6n
 ILE2APcLgO3gOxssjoac7XmOXkTFTD5lrmq5AuzImPomyYQ6VBI1h0a7xcFux2OXHuNbfkNOiIt
 qeNijvxYXtXzFcAIk22dWSZW+4cN1GGzRDqK5NbRmg/G8ESxUJ4qb77syGC7RS7pBzAJtUQKWpV
 XO+xc2bZTixTxXsLGBqo0vUXCU/FxiS/YwYxRmgoR/OafNEz4KvbbaMKBKyzFgBYc9QBkeKoGXt
 RSCpcgQzhiwhKvfB9iNP7/ayvVBzRM9Sd8O6oqVwlxBi0f9NF3u/HrQlJP9VGl1itIT1Eif1/0W
 qIL6L3KjhP5rKV4pMVw==
X-Proofpoint-ORIG-GUID: PZfGacB_rw8WG_YlDlqy2u38XGAf6Hi_
X-Proofpoint-GUID: PZfGacB_rw8WG_YlDlqy2u38XGAf6Hi_
X-Proofpoint-Spam-Reason: safe

On Mon, Jul 20, 2026 at 05:06:13PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> This patch adds the initial SDCA multi-function codec driver for the RT766 and RT767.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
> +static struct sdca_entity *rt766_find_entity_by_label(struct sdca_function_data *func,
> +	const char *label)
> +{
> +	struct sdca_entity *entity = NULL;
> +	int idx;
> +
> +	for (idx = 0; idx < func->num_entities; idx++) {
> +		entity = &func->entities[idx];
> +
> +		if (!strcmp(entity->label, label))
> +			return entity;
> +	}
> +
> +	return NULL;
> +}

Probably better to export find_sdca_entity_by_label() if you need
this from the driver.

> +static int rt766_sdca_irq_ctl(struct rt766_sdca_priv *rt766,
> +							  struct sdca_function_data *function,
> +							  struct snd_soc_component *component,
> +							  struct sdca_interrupt_info *info,
> +							  bool enabled)
> +{
> +	struct device *dev = &rt766->slave->dev;
> +	struct sdca_interrupt *interrupt;
> +	struct sdca_control *control;
> +	struct sdca_entity *entity;
> +	irq_handler_t handler;
> +	int i, j, irq, ret;
> +
> +	for (i = 0; i < function->num_entities; i++) {
> +		entity = &function->entities[i];
> +
> +		for (j = 0; j < entity->num_controls; j++) {
> +			control = &entity->controls[j];
> +			irq = control->interrupt_position;
> +
> +			switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
> +			case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
> +				handler = rt766_sdca_irq_jd_handler;
> +				break;
> +			case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
> +				handler = rt766_sdca_irq_btn_handler;
> +				break;
> +			default:
> +				continue;
> +			}
> +
> +			interrupt = &info->irqs[irq];
> +
> +			if (enabled) {
> +				ret = sdca_irq_data_populate(dev, rt766->regmap, component,
> +								function, entity, control,
> +								interrupt);
> +				if (ret)
> +					return ret;
> +
> +				interrupt->priv = rt766;
> +				ret = sdca_irq_request(dev, info, irq, interrupt->name,
> +								handler, interrupt);
> +				if (ret) {
> +					dev_err(dev, "failed to request irq %s: %d\n",
> +						interrupt->name, ret);
> +					return ret;
> +				}
> +				dev_dbg(dev, "Requesting IRQ %d InterruptName=%s\n", irq, interrupt->name);
> +			} else {
> +				sdca_irq_free(dev, info, irq, interrupt->name, interrupt);
> +				dev_dbg(dev, "Freeing IRQ %d\n", irq);
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}

Hmm... yeah this is moving in a slightly different direction from
where I was going with the core code. Let me think about that and
update tomorrow.

> +static int rt766_sdca_pde47_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	struct rt766_sdca_priv *rt766 = snd_soc_component_get_drvdata(component);
> +	const struct sdca_entity *entity = NULL;
> +	unsigned char ps0 = 0x0, ps3 = 0x3;
> +	int from_ps, to_ps;
> +	int ret;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(rt766->regmap, RT766_PDE_REQ_REG(UAJ, PDE47), ps0);
> +		from_ps = ps3;
> +		to_ps = ps0;
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(rt766->regmap, RT766_PDE_REQ_REG(UAJ, PDE47), ps3);
> +		from_ps = ps0;
> +		to_ps = ps3;
> +		break;
> +	}
> +
> +	entity = rt766_find_entity_by_label(rt766->uaj_func_data, "PDE 47");
> +	ret = sdca_asoc_pde_poll_actual_ps(component->dev, rt766->regmap,
> +				   RT766_FUNC_NUM_UAJ,
> +				   RT766_SDCA_ENT_PDE47,
> +				   from_ps, to_ps,
> +				   entity ? entity->pde.max_delay : NULL,
> +				   entity ? entity->pde.num_max_delay : 0);
> +	if (ret)
> +		dev_err(component->dev, "%s: PDE transition %x -> %x failed, err=%d\n",
> +			__func__, from_ps, to_ps, ret);

Does this actually run in cases where the entity doesn't exist? I
would be inclined to error out if you didn't find the entity.

> +static int rt766_sdca_pde11_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	struct rt766_sdca_priv *rt766 = snd_soc_component_get_drvdata(component);
> +	const struct sdca_entity *entity = NULL;
> +	unsigned char ps0 = 0x0, ps3 = 0x3;
> +	int from_ps, to_ps;
> +	int ret;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		regmap_write(rt766->regmap, RT766_PDE_REQ_REG(MIC, PDE11), ps0);
> +		from_ps = ps3;
> +		to_ps = ps0;
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_write(rt766->regmap, RT766_PDE_REQ_REG(MIC, PDE11), ps3);
> +		from_ps = ps0;
> +		to_ps = ps3;
> +		break;
> +	}
> +
> +	entity = rt766_find_entity_by_label(rt766->sm_func_data, "PDE 11");
> +	ret = sdca_asoc_pde_poll_actual_ps(component->dev, rt766->regmap,
> +				   RT766_FUNC_NUM_MIC,
> +				   RT766_SDCA_ENT_PDE11,
> +				   from_ps, to_ps,
> +				   entity ? entity->pde.max_delay : NULL,
> +				   entity ? entity->pde.num_max_delay : 0);
> +	if (ret)
> +		dev_err(component->dev, "%s: PDE transition %x -> %x failed, err=%d\n",
> +			__func__, from_ps, to_ps, ret);
> +
> +	return ret;
> +}

I feel like lot of these put/get and event helpers would benefit
from a parameterised helper. You have loads of functions doing
the same thing, would it be nicer to have a helper that takes
the required registers etc.

> +static int rt766_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params,
> +				struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct rt766_sdca_priv *rt766 = snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_config stream_config;
> +	struct sdw_port_config port_config;
> +	enum sdw_data_direction direction;
> +	struct sdw_stream_runtime *sdw_stream;
> +	int retval, port, num_channels;
> +	unsigned int sampling_rate;
> +
> +	dev_dbg(dai->dev, "%s %s id %d", __func__, dai->name, dai->id);
> +	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
> +
> +	if (!sdw_stream)
> +		return -EINVAL;
> +
> +	if (!rt766->slave)
> +		return -EINVAL;
> +
> +	/* SoundWire specific configuration */
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		direction = SDW_DATA_DIR_RX;
> +		if (dai->id == RT766_AIF1)
> +			port = 3;
> +		else if (dai->id == RT766_AIF2)
> +			port = 1;
> +		else
> +			return -EINVAL;
> +	} else {
> +		direction = SDW_DATA_DIR_TX;
> +		if (dai->id == RT766_AIF1)
> +			port = 12;
> +		else if (dai->id == RT766_AIF3)
> +			port = 8;
> +		else
> +			return -EINVAL;
> +	}
> +
> +	stream_config.frame_rate = params_rate(params);
> +	stream_config.ch_count = params_channels(params);
> +	stream_config.bps = snd_pcm_format_width(params_format(params));
> +	stream_config.direction = direction;
> +
> +	num_channels = params_channels(params);
> +	port_config.ch_mask = GENMASK(num_channels - 1, 0);
> +	port_config.num = port;

Can you use snd_sdw_params_to_config here?

> +static int rt766_parse_rates(struct device *dev,
> +				struct sdca_function_data *function,
> +				struct sdca_entity *entity,
> +				unsigned int *out_rates)
> +{
> +	struct sdca_control_range *range;
> +	unsigned int sample_rate;
> +	unsigned int clock_rates = 0;
> +	unsigned int rates = 0;
> +	int sel, i;
> +
> +	switch (entity->type) {
> +	case SDCA_ENTITY_TYPE_IT:
> +		sel = SDCA_CTL_IT_USAGE;
> +		break;
> +	case SDCA_ENTITY_TYPE_OT:
> +		sel = SDCA_CTL_OT_USAGE;
> +		break;
> +	default:
> +		dev_err(dev, "%s: entity type has no usage control\n",
> +			entity->label);
> +		return -EINVAL;
> +	}
> +
> +	if (entity->iot.clock) {
> +		range = sdca_selector_find_range(dev, entity->iot.clock,
> +						 SDCA_CTL_CS_SAMPLERATEINDEX,
> +						 SDCA_SAMPLERATEINDEX_NCOLS, 0);
> +		if (!range)
> +			return -EINVAL;
> +
> +		for (i = 0; i < range->rows; i++) {
> +			sample_rate = sdca_range(range, SDCA_SAMPLERATEINDEX_RATE, i);
> +			clock_rates |= rate_find_mask(dev, sample_rate);
> +		}
> +	} else {
> +		clock_rates = UINT_MAX;
> +	}
> +
> +	range = sdca_selector_find_range(dev, entity, sel, SDCA_USAGE_NCOLS, 0);
> +	if (!range)
> +		return -EINVAL;
> +
> +	for (i = 0; i < range->rows; i++) {
> +		sample_rate = sdca_range(range, SDCA_USAGE_SAMPLE_RATE, i);
> +		sample_rate = rate_find_mask(dev, sample_rate);
> +
> +		if (sample_rate & clock_rates)
> +			rates |= sample_rate;
> +	}
> +
> +	*out_rates = rates;
> +
> +	dev_dbg(dev, "%s: entity %s supports rates 0x%08x, clock_rates=0x%08x\n",
> +		__func__, entity->label, rates, clock_rates);
> +
> +	return 0;
> +}

This is mostly just populate_rate_format(), the values end up in
the snd_soc_pcm_stream, can we export that and use it here?

Thanks,
Charles
