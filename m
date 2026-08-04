Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1B539E9AC
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785839497; cv=fail; b=dCVWT1p6hAYxJAFp4W82bq/DbKdGAkd+l9ZTQilvWdbdfs2hN7/FtdkmGhRHSdPFCjVekP770YwCpvwCfEyJFtaXIlE5Z7MaeCbdDqD3NAQBEUODRCoNthGu0DZ/R7GRhM1F35s1p0DmvKrdqBvSz4suwkWQGyjBZsLudKGLABo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785839497; c=relaxed/simple;
	bh=nPyDp9HylP8nVIX61pBHObAqn3iH1IfCEA5vUe+oC+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7fz5H0miKNfq3lc1OoqgeRc3LYlGWImLXshOSM5PsXE6sdoPCq3PvUjVMYK1JBVaAaIlm6jZcDS02cruYsU61e4o0wW/WaiTHsmD8tCWaK4/IBOiEdk/9vS36xZmR5WpewQM0Y0dxgf3Qcyso1QWGpA5o2lvNTmoO3L/QyQmPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IIs1dvUh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wYnrnfOZ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IIs1dvUh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wYnrnfOZ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6743xeot968342;
	Tue, 4 Aug 2026 05:30:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=3NJ0di84gGwzA9aaRL
	X0nFrYNVqIUrgGPf+jq7qTa+c=; b=IIs1dvUhpKBCvqc5eVBHwlK6lERadQFHec
	6RlFqZV7mfXrBNO1yYKjBZ2NG6xbDZqFAIIlgRcq+JSYOO/uPazFK6Tp3n6Bl9+y
	5vX7bL5/5+VCN6zye7Z4jVH9TGONYBpHSd8JdZfiuIvwjPx2ZbxUEUcwGg4GHUVg
	VNEYR7gsGLh5a9d/qN0m1TtLnjXuc1MjbqKGV+/VGfFYvblZG8tiauSFT6cJNcy5
	/7KKv5UoBvm7nPHijgse9F54DSfknQWy8qfnaPO9OO8ENw4W3lFvCa4LYa/lolVL
	0LE87YsQ/OzWV/K5c06eRND2r3MjElH4WrUODAHQkUw3tsZixVVA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021093.outbound.protection.outlook.com [40.107.208.93])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fse6vkh0n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 05:30:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBRI7+sxrKDBiZwY5+b6b/JqTmo1UaWZPeUNRwrli9c1uZ6o6V1YK7aylbHk7k3auzn+b5obTgNGFo/Q3bDsCIxc+Ul+gRzmYaQykDvkSD+qrNnUeuH36z6+jDCTpOSa098OI6xWgIwYSbY97em/l9yZwvI7yAwXXHaVLxYG1iOMbChBPTV7etfNyOzHG9YF1xhKIf9tlAm6Cg1hjFWS6OJN3JnHUi0NFF7e838vCs7dGMtOy2qFbw+FMwbSgxVSqJGaEbv6wEiNmXKBGleCZF2DAW4kzG3s/dWAdUtMEbj31yIIXWFiR5O0fSI4wDVQzWHmUwliEl1erVhclBqPoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NJ0di84gGwzA9aaRLX0nFrYNVqIUrgGPf+jq7qTa+c=;
 b=ldmMM4tEADCkccUwOyWtSDTViODsj2anck3jWXw3lnNlt4EH5fnd53jiEkRfSDM6umYKx5AlEmQCDn2Yg18JBrrRf1mNj/TAeg9dsMRrUyEabO8g3LGtvTxcij9pZI86Dst2XBDxRGPen9UgRzzK6OdTbHS2P2QlZevqo/J6sgHvnmVAktwJmY+T2FL5tYD5gaJJ0GBieW7d6QGKWbAI9VfBRvg2FZk4E41U4g70MvpM8e67L10hZ3DmYgisMooSWqNlNVCzkT8rmOsJscV95M0rHdE9Kxil9P3+3sKC8Y5js/bL8Hjj0Ngw9cVC3c+Tv8tSf66BG83hr7+PCnrScA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NJ0di84gGwzA9aaRLX0nFrYNVqIUrgGPf+jq7qTa+c=;
 b=wYnrnfOZpfVYpZhsbqsZm8zxJa5DgbbwdS3mvs8vj7X0H0rSgCxwNCo8q5JChc8hd9s5YHrniR1x90qaM62qY0kgVlmsE0maBgOkbYxjoQUrVblPlFhCyFmvNboI57Qo/Jlh1uU/GdgYpYQy/LrJ2Slj3RlD42hg8WTKd45TJy8=
Received: from SA1PR03CA0012.namprd03.prod.outlook.com (2603:10b6:806:2d3::15)
 by LVUPR19MB997299.namprd19.prod.outlook.com (2603:10b6:408:3a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 10:30:54 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:2d3:cafe::3) by SA1PR03CA0012.outlook.office365.com
 (2603:10b6:806:2d3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Tue, 4
 Aug 2026 10:30:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Tue, 4 Aug 2026 10:30:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A7F68406541;
	Tue,  4 Aug 2026 10:30:51 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9431C82025A;
	Tue,  4 Aug 2026 10:30:51 +0000 (UTC)
Date: Tue, 4 Aug 2026 11:30:50 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com,
        pierre-louis.bossart@linux.dev
Subject: Re: [PATCH v4] ASoC: rt766: add RT766/RT767 SDCA driver
Message-ID: <anG/WjB5sCbaEEFC@opensource.cirrus.com>
References: <20260803090355.381491-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803090355.381491-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|LVUPR19MB997299:EE_
X-MS-Office365-Filtering-Correlation-Id: fb4c06c0-0db4-48cc-71b9-08def2137648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|61400799027|7416014|82310400026|10067099003|56012099006|11063799006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	p1vox68FIQAQNsl24VDjamXC4vC6Uqe09EAiIecAuOG5lmHWx+KYKNna3El6nIrfAm+WwIF5JD46bBURqtwA/mlsTkTipJcllAoIDqAAyluHl1349wP/i6o3XjweBW1t1+K7kr2OMMoOnWnGQ0BFopb/eQuRpjEYHV5K0ub5DWl3X6A+C6zv3hj5jtOCCGdvzWhWhsFgLGugEeoOw6+yTcSWnWVBvh6CK2bJPFP2C3bWSBN/hGtm2wCfBwrCoN5iKFESuQC7r3NUmSVIJR2YSY5iUKnl+liM3VH+c6BXhIm95h2YfZOo2S4EyNp2qEw7o39VIXGTAZBYg9CPF/Q6f9eijQuAvo2Y8iW32RoBczMUofJXR/kN+3XCRiLq9z+yjuhz+UfugfduWEfN4AgNHUNvwIhLGLNaZegRrqOjvI6uDbBJX5C8Xk91zCgk67MwgRB+eIZU8wyP1dRbQv0k2wTKuswh2z+9Jc0NpiKAHU2QQnhTfPNskmrnCfj5wqN90du7gXJPOW/3aSfXTuxd5Tf7P0i84NlVKNGlRICLbuny/MpeRn2RRrbYIGBAEGq6jdNlOgGt01q/bQVuV4Rc2G30PioRzl158nxZezSj6JjLyoqTVWgNGjBEIIZpfrZOD6VEx9m+yWnAb+AZow8P7XDbBztpMxt3DqSAP9tOn0X6KzV4Qw7z+imVi1oiJRZD/U2Bb9qen52JgPsZQS3xYQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(61400799027)(7416014)(82310400026)(10067099003)(56012099006)(11063799006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H7hrpk/Ek6K8PSOFMiUp3B33lKCKDlVRXj5Q5rZnB2yVz6zsSUJSnNaJ8gHPxlsCND77+go+MGBLZQjfRf52cjdBG3jDuRbzfmMW5XAhYHrJWB7yQW13qOhq3Uf2LIfGKURup/zQE9kqn2L2fuLpqdjYA53TExyh5/Rp9HONmN4GtddJH+FYyVzsZ9gwHh/qmC54td/6j9VALf352YLsD31/SBnnboBPro//JwD/WkiKtlvR8SF7hmZqqjEY2c3Ir431bYBf30CeOldCw9bb8qIQrFChLjUXFbZyNbhOtCebUk/33bCEa+BRkkWqUjU4oGdnh6Cy4xOCeFCj1zsQXHtbxueyBcg+43yHLuS406UGyJKm+xoWYbgWuTypCaJ81B12zUJx8ymdchOdxSCXNatngmNEpvZNzv7/3Jd1iup6JXMP0o0nN537aS6zyuHP
X-Exchange-RoutingPolicyChecked:
	YkRyKqtjFIQa+mKALGc+jtLPlG5jGdkl5apcoNkTDeid00N1HJHNPeohnc++Fcg72ErOHM4RnQfmlvXY5V5FiVeXvKAJR7ovXLg5ikkLNvu55cpld9cSdQXgQPNUE7v6CH9hliNRGVWTXNFOpP+prRxFp8hwk69Jzis5iEq3H6/LzoA0jIgf/2Lw+Gj6RbSbM3cs+OsRz2TuGhYmXyLBCO6MebA9DdAaZ2czsjdgpAzf6jsWUoqZ056ZNZnMAqvlorwAWvGRhbcJpiP19GUbKggjfz7mlL5a7cXw144LsDCSrCY2C4B1pSLGAJi1xHthLN10P2VvKcx986+SAN47qg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 10:30:53.3139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4c06c0-0db4-48cc-71b9-08def2137648
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR19MB997299
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA4MyBTYWx0ZWRfX4I9ETVvTQ+H4
 z6LoW7sBN3F3iwPDf3wgLSRVkWkYAkDOsrXtqGX8exzEMGV5NpVGZ4gNz/6eBA5B4NPnTcuFo93
 otYNpgRnqUJYLiRCN52YCSEx2z86J2Y=
X-Proofpoint-GUID: ysYoC9gp-CRN39JhVbD7f5silxz4o_DG
X-Proofpoint-ORIG-GUID: ysYoC9gp-CRN39JhVbD7f5silxz4o_DG
X-Authority-Analysis: v=2.4 cv=N+MZ0W9B c=1 sm=1 tr=0 ts=6a71bf62 cx=c_pps
 a=fLTejda39blwXVQ+ySBHCg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=n9Sqmae0AAAA:8 a=5dyI03yTtDWAqfP-F8sA:9 a=CjuIK1q_8ugA:10
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA4MyBTYWx0ZWRfX+ytuAVf7hOXq
 HojXy9BD4+nBg9BQyMMZoHDQ/TOjPTQcuHBpSmdBzZiUw/i+MDF7iFR37vtpcbM85CUdcmV43WD
 84ZLAuyVW9CnxtrbSClbydAn9S1TJmNYKuO03l1MsquqtLcWfqbHj7FmRG7+yfx5jjQ616TyLLj
 5RNQYq9h0nfbusAeqKO66IwBdrl1jW6frdNQ9z8zJTffzaRARlBMBzCq08zwzcn1fuD8XuCeQpv
 YtyDl9aYqctskJNCwicVgOTxthPexBM1OJuGYrdhBYUA7bsuZDs5DBhs1S4KVI0ChF51ge90GsN
 EXFvijiMmWdNOChtQmBrqq6gMH44xjsNuIQPeS+xak/2ohwhRyzefwkVDrS3L33seuGaP6p3zNn
 +cLxfH0N34vWjU5ifc5y6JEcnIPv5t4Je6g+NO1ELgdPrfRP0PQrURBA7xlGpyWXw47zHtRl+f5
 JYnRZLX9EUL45OOAcOQ==
X-Proofpoint-Spam-Reason: safe

On Mon, Aug 03, 2026 at 05:03:55PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> This patch adds the initial SDCA multi-function codec driver for the RT766 and RT767.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
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
> +					sdca_irq_cleanup_late(dev, function, info);
> +					return ret;
> +				}
> +				dev_dbg(dev, "Requesting IRQ %d InterruptName=%s\n", irq, interrupt->name);
> +			} else {
> +				sdca_irq_free(dev, info, irq, interrupt->name, interrupt);
> +				dev_dbg(dev, "Freeing IRQ %d\n", irq);

You can still leak the name here, if the machine driver was to
call:

rt766_sdca_set_jack_detect(component, jack, data);
rt766_sdca_set_jack_detect(component, NULL, NULL);
rt766_sdca_set_jack_detect(component, jack, data);

I mean if we are happy that will never happen I guess its fine,
but given we allow the machine driver to clear the IRQ seems wise
to allow it to re-allocate it too.

Thanks,
Charles
