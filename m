Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C5D3B19CF
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 14:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509227; cv=fail; b=gvMJSekymlgtV1iTg0TGZpZy7ptsqJ/R/nboq8GMdgnXJYcodM7IfbaHMm8w26RysUMKaODutbvApYXFameb36Ad0fhnpxwXVeV36OU8mbbyjcNH1vryceHv6L4JoKBlivGBku/iK4hX4azDQU/hp6mH0Dj3+8uwKpOys3TPZNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509227; c=relaxed/simple;
	bh=ZCePYcpADmmjUxcSeqGy7PV/RPT1QTCt0LaNpaTqraA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mm0EwqpdtEXMlh8eqa4oeu8gpoldFWhP9kksWXobc2Z7qL0ZdURziAyIG5mtEyMm25fDpG4RVGBuG4oTWaRaGKJ6yAZP4aWZwMkxGbA121TUJjc6y+eHhSfhxpDz1Jp2Ez0ityW/SsaQGFAekkExLsM18c2J0vy5SDcr3KfdODs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fbjXi8JW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=uAdZBAlL; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fbjXi8JW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="uAdZBAlL"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VDECpe3870400;
	Fri, 31 Jul 2026 09:46:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=jKGfPSM3sFwFtIZE66
	if7zPKS9gcX1eUHuWzUVUAMcM=; b=fbjXi8JWxqhzPbWcuxH5mKzKezlGcEa/ec
	V1RjIiDqa+Gs0cXiyL1FhuEvcEK7QUw3vvWXyQccDXERlaUrTQyHMkGywOa2tfZ0
	h0gmVWqrvAy94vNcrPh32lZn846E+O7MiyR4B58jOh1lgLmDneU+gUAL/+P000RC
	09dcELKI8yOAANveSpm3sL2gWeYIqZmbA06CNTwLicM5m12JbLbpauJCK029SL2M
	D+FPV+7cssRLexwuDhNUjtXuMkZUuWd0ZOIgHXuwlLMKEFJJaZjNOXLS5+L8WqBw
	ApJD+pTAVsSBuGqOF+ulQHAGNYh8ZpPxHH6YM845w0NQPP5ziEQQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022138.outbound.protection.outlook.com [40.107.200.138])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fruavg6ed-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 09:46:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bK/PaCmWdQJAVaw2kR2pT/l2us8hww9UJ5XCfhgpvKehmNvQeFsPGWebr512nRTIXHr/ySNhvs3YhVJWEw4CfAZTpnycZzH+jPl65OGzbxvBFNos7I1N3EAbgZKqO3m4XJ3BWY73YCk0TM5WLD7LKQAZGLI31VjwFFvqzMYv+KlZTtgg/ctsYGKa85+dyjUg6G0QemdzNJ70g/joZn9FJiMBi0oI+Ehz7itlDKvFgr1DkZWrMDGSAKYjyNIPknJMOferx3aBP9mfeSLk6cEbKmy2LNdMW0uUhMJeb4bEjkJKBbTgImmsGHoQIpZ2F9cVWvAfXnpmvRsGs9kxCajQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKGfPSM3sFwFtIZE66if7zPKS9gcX1eUHuWzUVUAMcM=;
 b=I9LOgO2pZvenFTLyGtyyV/17j6z/VLf/6cNbdP7Q6pRukMtG97KaJ5swSDdwyIXZG4bP4ZXbBMmj1UenerRSwUSjA7JH7DC+u6qtoKQQgBt3VuGgJ98ojfFXYXHz7I/qysVv5ZiJMOmyJNyuxZ0InyBVJrLXViohDp+2IDpLwaD7oj+W/t1i8rkAUBl2PQQYs4KNMMDVd5i3RtOrrXgrICJpGmJQ816h8MYqJIO9WqvUp1C0ZEXFQNj4wtKqu3x82ShySvZxYivYHGe9O3wWiksCXZ1g/7OUWuRe2o7cSWNOtTqOM95vfoiHAewWjgWXTvI4j4C2SAzjGfE7cTOoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKGfPSM3sFwFtIZE66if7zPKS9gcX1eUHuWzUVUAMcM=;
 b=uAdZBAlLIq0LLJr90+2+sMdDkMK4p6VMupixNsD5ShMpvsDlYEoc4CJrNOXoHakh0vAJ2YVq57U7+miSshJdLWo7KhGNIA7+afRj7mmZpR0BF52ZIDLthLO4KRPOayWAEXvlX9yvur9qINRcxRJgkA8cZXpgbqCab2GvLhUuBbU=
Received: from SJ0PR03CA0280.namprd03.prod.outlook.com (2603:10b6:a03:39e::15)
 by LV2PR19MB5693.namprd19.prod.outlook.com (2603:10b6:408:14e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 14:46:17 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::1c) by SJ0PR03CA0280.outlook.office365.com
 (2603:10b6:a03:39e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 14:46:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Fri, 31 Jul 2026 14:46:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AC6D7406541;
	Fri, 31 Jul 2026 14:46:14 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9BCAB82024C;
	Fri, 31 Jul 2026 14:46:14 +0000 (UTC)
Date: Fri, 31 Jul 2026 15:46:13 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com,
        pierre-louis.bossart@linux.dev
Subject: Re: [PATCH v3] ASoC: rt766: add RT766/RT767 SDCA driver
Message-ID: <amy1NRAeDxB683hr@opensource.cirrus.com>
References: <20260731091037.4144022-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731091037.4144022-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|LV2PR19MB5693:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf0a186-339d-44b3-d5cb-08deef127a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|376014|7416014|36860700016|82310400026|10067099003|11063799006|56012099006|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3rz7gLhk6t9ZEJp4DwCSiDljn6hKISY4vLOsRa9uFe5R2FjECMY8YK5heKfRupOOKsdR63R1qzeyqVfuWwRgpvqQYAuOk/YGSwySuhHADipfzLEks2hYyyGVY+Ct2xI+wJYbEMp0MybnmIxwbWg8/W4Ff48tmx1uGPwmvMLhDd6XJAQ6lRgwXV6uNrC2mZE2eWsC3PE9LLsRwYvHV51pzXK8gryg/ERt9asww+1t84BJr+KsafBdQl3OeXw4m1iXF1Z2gks+mesWpO+nJ/nIMRuze+GJtSqtX3ib0pb/OOUFPZOxS3ku9oWqJD6vT+yzu5bW+QLCWqGFTkegF7ExUqBRbFk86xj1nVeVBK1isk8+f1MVmxk6eceFY/uzZDjc61jcnUFoGuAzxv64ufm0Ypy7H77sbJ9zVP8FxgKAYKVmUyfhe9LSYssFicSI3+dGUVTT9GAE8BXtA7v0G8fTPxT9lDwIYqamdPEoahqndLR/M+q3+BleqIlK7hJ5dutsIRJVQo5wCbRfL7vD6zKjx5u6DsmMOAzppebnCfh5m+GQ6/U1BJM1Qd4QP4O4ldUE2myi6yKLqHDilzo2wTK1+/+IBxFWlAH5HjzhdpY17WrlwHHnkpldkgNqgxluMFC9jYmCXimxf10W0Xxrzk+KYIVoDcT/Ss4KlLmu50Jfc1OExguoVr3XBhNx5tPRKNhom/NgEqA6fprmdRTkXmyBNg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(376014)(7416014)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+OuyVNLUy0NKBFOtNYnsBtBGztSnharohD6vPCOGwlIOGBvhYnh5SgztAj1W78NNBxsJD7Wi2jb2Og7/O/kud1SdKEPHEss9Xe+ynqMWBmoKNu/tx8dl94X8ozH2DWKan6/Uc+FFF7SDPwroYY8m8mgqw4m51onG/k6fn37n//md256/egt7UrkRflz8EXhAi4l/58Cp1N0oLk8yG5FLOjycwL38fWaZvEkyHQYruuR5RUoNEARgaLefzZ31StPqWb1l2EWx5z5efbMHPRj073oaMUk/RLEWuL2saisgQcBuTCU/aikQw0uSBT6LnS2l4P3t2QXdc3rGMCKmJHwArvG5a779282aVZ6q02bVbJ3vQJk/pNPccKaHET5wYpYV4xgdFdkvXir6k34Iy4/Llz82LGzEwFLB+DQ3KoJOb0f7mYry98aoMSwGLThX/5Q4
X-Exchange-RoutingPolicyChecked:
	Nfk48BAUEvmH2KYvj1MpgzZl8lNf7TyH/JHNMWEzAqjP2oL9d7s0sVdGEJK3xm6Pg6iwq6rK8/y/PA9WkmCJd/cW61uIePIDgdCbJaMtu3WgKABTpBk/sdRiMOoDmRWJ+n3N8vAl3cpqHzD9cAXJusr6XIqcZwS19eBMVaDeDUY2T0JPcFK2uvtEi648K7WkvVKxWEvwu+QpGrn3PazUTJ3sCynSqxU8ZSqd7wpKUkCQceRmNIul9plSjKLxuzHEHM+hg//Rhv9SZjq7G+5RpxOITTjOxsN8Zow3ffw6sOn32BMgZulszcqPPjsqwDFRgRpXYqpyyHBbpJASpulOiA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 14:46:16.5256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf0a186-339d-44b3-d5cb-08deef127a01
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB5693
X-Authority-Analysis: v=2.4 cv=N8cZ0W9B c=1 sm=1 tr=0 ts=6a6cb541 cx=c_pps
 a=deODUgPfQUv8p/b5W3MLRw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=n9Sqmae0AAAA:8 a=5dyI03yTtDWAqfP-F8sA:9 a=CjuIK1q_8ugA:10
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: XILrJsrLOlGzWuePVhzC80MDlCK1IBfE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfXzrFndxXMnPvN
 gHekr399BeJtRb+VLVsbgC9oFxhqlypmEs/rf248x/dfuNokss/beK0l45Yk6hX6ncuWLfvNLUo
 l5fA4goDyI0tEaATE/qYBsX3X5U4qAg16eyrZfj4hFK+9FfNzcx+vp21rA4bDc3qSWOABDV3XGW
 xzlmHGke8WmyA44bweiPajuX7DOk47q5l2ltcfgXfEi1LQMjMsap/b29DOy5unl4IwGlzNjXp6c
 pcwAk8D7AK+AFZptdu5L3tfKQ+xj9yu0mx55T9B5Jm6i7WutuMxcWfTNYHlICUpS+QQi9x8Che3
 PGT+w4tK+qZe/O1uUNCFoliJoDhSxgKhWwzora7uN4D0tYS4qwOCjxZ7/2/MW2G0uWHxF9fV7aQ
 YIw+o4kcgfTbDgWJnBxMHLzt1ba9SwD6P5HGLafKL73hZwpL9hAU68b6XJGUMtFG/1B4xvYGzHC
 UlPHzqx2aNFJ3y8H/pw==
X-Proofpoint-GUID: XILrJsrLOlGzWuePVhzC80MDlCK1IBfE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfX6xtj3vZxIilW
 +dqOhFVWJM4/nGWb6d+QdBWdKc0M9LDO/T9nsCX8WnPQ1YGoKiIwTUPH1YxcP5eJ3D9BCkH9wsB
 hEkzYTI0iAZxrinkCPSqHHhPtAqVgTo=
X-Proofpoint-Spam-Reason: safe

On Fri, Jul 31, 2026 at 05:10:37PM +0800, shumingf@realtek.com wrote:
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

You need to also free the IRQ name allocated by
sdca_irq_data_populate() here or it will leak if the jack is
re-enabled.

> +static void rt766_sdca_remove(struct snd_soc_component *component)
> +{
> +	struct rt766_sdca_priv *rt766  = snd_soc_component_get_drvdata(component);
> +
> +	sdca_irq_cleanup(component->dev, rt766->uaj_func_data, rt766->irq_info);
> +	sdca_irq_cleanup(component->dev, rt766->hid_func_data, rt766->irq_info);
> +}

These should be sdca_irq_cleanup_late(), to ensure they free
the names as well. Although, worth noting this only does anything
if rt766_sdca_set_jack_detect() didn't already clean everything
up, not sure if that is guaranteed or not.

Thanks,
Charles
