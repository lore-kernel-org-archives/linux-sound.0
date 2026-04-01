Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010008.outbound.protection.outlook.com [52.101.46.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525EE329395;
	Wed,  1 Apr 2026 20:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775076210; cv=fail; b=U13xZUMMPH5VO9qk2tow75Ehh9HWTV2oyi1JiYS0rhDGBsix39VBLLunc+VFybSUoKqFgLVuQmSWLOdtGNJPmD2TbmA+KqAbfc00yXaT2ArZHJYyhj2iDiMILibxK7WzoTcoE5nVHKEiAQ4qUm2LVkL/hc4g8R8KEcrXVDgS1SE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775076210; c=relaxed/simple;
	bh=cQC3K7fk1JzZKIBTA+N67tWuWADwo+Od4a8bTF5SXLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HY9ptpuLwCNFEvIr7kqL16ZjISlLb4L/bL1iV5dpSJr39/GoJ8+krQ6lIL9TqkMdOme2aBwNaaZdfZZ22dkyf12tu3g2AOO5ME+pNTrl3PzUX2sJEp1O4Pc2wIxmJsPjyHkVlU5TpX8TUascR4hsRJ+Ze2isSPsKbnnLgv8W07I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EAUjuf/U; arc=fail smtp.client-ip=52.101.46.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EAUjuf/U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/o8/b8B60APDbASXecNrocYq5+gxYemFOz4LVJdlWGHx+Vsu1IWOhSPA7UnF/wLMq5OM/odOd2FWHPkNUfHYW9hqiMhWAizWx7bFFyROj4pwz0SSkqKWEl7qp16CmpY26Dr6T+ECcjboV168pzyULz6lhFBR8RI4Nu7v7vso/4VMJcah8YTTGPFDFxO/oayPZty28+TuTG3xwJydL0SKlCkKcrrf/nSDuavR2FYZCuRC1rrOdandqiK9u5diLnBZffI87SPS2AkO+Cc85hvuEToKu8Vp/sFoPFVYU1ZuBjmv47WclHySlTxUTgD4wlkabEkhS48ePBKRs+Ewk+9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CCNdBFT5kbCNtaouPMl5GGAI24IsGjlZUdFd5vZYPU=;
 b=wLPGxDBQFBj5fBE0Z0fSTfk3qgqjLxMmtdlCf284ne0aq+IHI1mMk+iHT41CtzUp8wy9qE17zOBXkmB3thB7X7ks/fC0Go2OQiT1xOMCSgxK5QAHU0+lJZ+UgxjbmPVaiLopyjt9vILszoSog29F6G49SvRIrg2prcN/1o2ojXp676OKv+BrwNdHDM1wzQ3dCThrpIROHjHxo+QYkJuDvZIJeJ+ngP5t68hWXqplsqJEEh+G1ZJAKieFGFjsRWwqjDrTde4LiMf6vLOm8v3ahX6ffwKShHL+vnT3hPUZ2OthEQAP5P86xL5PFHKp5JXLLMtpDUcnlnwTWOEHrLtgjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CCNdBFT5kbCNtaouPMl5GGAI24IsGjlZUdFd5vZYPU=;
 b=EAUjuf/Up/4ERLE+BvnRIbYWTDCKiq7PFOZLZ7BPOgVOFJb/mKocMbKdgO+dCfbhMDMVfrqMBYBYGPx5wgTx9bH5BqQV+n1BoXcF4gH0QNMssK1GsszmNry/MZ9otsSFbAMvM00na1lkcVUuA+o2yMOIjfW/kmCwkF0z2BVMIHI=
Received: from SJ0PR03CA0144.namprd03.prod.outlook.com (2603:10b6:a03:33c::29)
 by DS4PPF072D269AC.namprd10.prod.outlook.com (2603:10b6:f:fc00::d05) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 20:43:25 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::ca) by SJ0PR03CA0144.outlook.office365.com
 (2603:10b6:a03:33c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 20:43:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 20:43:23 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 15:43:19 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 15:43:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Apr 2026 15:43:19 -0500
Received: from [128.247.81.246] (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 631KhJAN747311;
	Wed, 1 Apr 2026 15:43:19 -0500
Message-ID: <436bf0b0-1678-4b75-9c6c-8bcdf913f1d4@ti.com>
Date: Wed, 1 Apr 2026 15:43:19 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: codecs: Add TAS675x quad-channel audio
 amplifier driver
To: Mark Brown <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>
References: <20260401024210.28542-1-sen@ti.com>
 <20260401024210.28542-3-sen@ti.com>
 <8eb47e54-12e1-4f92-a488-09485df035c6@sirena.org.uk>
Content-Language: en-US
From: Sen Wang <sen@ti.com>
In-Reply-To: <8eb47e54-12e1-4f92-a488-09485df035c6@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|DS4PPF072D269AC:EE_
X-MS-Office365-Filtering-Correlation-Id: 417fb58a-bdac-4c5c-5a15-08de902f518e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|7416014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aIBcNMrQ5P3eoSNg6NW33hc9g06JkCfYG+Ftg5LcSc28oUqy/CCBzu8DiroB6rhjYh4uMbtbZt6k12PSN2ZJXugupndSZ4UVFYLve9ZKvFAxen7nqZSwZ8FFlKWX9Iooriegm41+Jx74oz0+5ETeDJxJHimdfX+zGQVtqZnFIzVKLYmZZhEaAffvEy+NwOP/miLB9vx4XX8otHNLq0Q7cubvlKqZPHJpkvX0QRdCmnw1lzGb7U63qwWhIsLxBlL9UH7cTGIZOaRWPevX4xfYEtZ7lmpzdHH9WXid292bf1ehCHV4DPDdeSYjK78rYRPBdKkVpRoQJ5Q5Ss0dYZuXOWWKkc/1DvAGhyzeNKGFuzA0LFmdVIVDkV9ijgv0fNL44cfdL0YJcVQXTb0gGUzJva9LPiocH9O/7OeLIfMZx9M1sc/nwBvLm7fPmt9yw9kzHWolLeTFVjsAUDHrPMl0yUAuYxo7jZ4Iy0AQie2AFLmQgcM7xdhkSN3caddEC/h2uzitTEPcIzhmxruL9w6xtOnB1Pfa05r5PmNbicHQc/L7DhkQo/yWsqghjDFCwVgAjqFNiNllb7CkSTDiR/EXKCjVbxiNbzGWtT934NQQ6xzPtGqBbKdgRZkf6K6X6+IrFI2wkP07v8SdHdqa1eW3JRfg0gf44RhPo6xMGsk9Qedj8VsoKf7UV+h+2lFiRCwhsVcOwXQactgC917GUuThgu4n6/EWQz9zZMIA2dqB12qQoBGYXT0ypbShHWns2QKqT83Ly7+VbSXAqz1UizeCbA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(7416014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oU48/MafOViPr+wZVblo5pJG1IP3O6aH1h1NtsNbICbyUqzCD+T97Un2jUqFPW2m1ZfsPPjcMT6dyqPIuliFgaS+Ag/0RmzQmdI9EKDMy24U+l8xo9D1fkuqhreFS6OlI7zCykaND6ifkvcckSY5qDxzcgv7MJ3oDfSqpP6lJ/to7dQDb3JTM5xNrNF4gCjOYolhetS/MAfDyghVq468lJu8LckAF78mWZ5cmmtJLXQ7QRTVC3EqBcnB+uF/z1hyN20hRe+Naov3f5B8LFq7qzf7wUeBxqXDhImXw6FpPdbWre8O6cUYWVEcuP3Qexakt4w3UL25gMY6dgJgM+g1tBW9A3lkObmQWnjkXzWzVcylYsCheTZehhP1TUwUE6S5c/HuoPg0u4YB6Xwy3XXg9HqsfdhTJDCihniU00vcrldwSczF//DtS6Mrcu94VKPY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 20:43:23.7970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 417fb58a-bdac-4c5c-5a15-08de902f518e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF072D269AC

On 4/1/26 11:07, Mark Brown wrote:
> On Tue, Mar 31, 2026 at 09:42:07PM -0500, Sen Wang wrote:
> 
>> The TAS675x (TAS6754, TAS67524) are quad-channel, digital-input
>> Class-D amplifiers with an integrated DSP, controlled over I2C.
>> They support I2S and TDM serial audio interfaces.
> 
>> +static int tas675x_dapm_sleep_event(struct snd_soc_dapm_widget *widget,
>> +				    struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
>> +	int ret = 0;
>> +
>> +	switch (event) {
>> +	case SND_SOC_DAPM_POST_PMU:
>> +		ret = pm_runtime_resume_and_get(component->dev);
>> +		break;
>> +	case SND_SOC_DAPM_PRE_PMD:
>> +		pm_runtime_mark_last_busy(component->dev);
>> +		pm_runtime_put_autosuspend(component->dev);
>> +		break;
>> +	}
>> +	return ret < 0 ? ret : 0;
>> +}
> 
> I'm confused what's going on here, there's runtime PM management in the
> ASoC core - isn't this just duplicating what's there?
> 

Hi Mark, thanks for the review.

Yes this function is redundant, it was a residue that I neglected to 
clean up, let me remove this function.

I was experimenting with DAPM events and see if this would a better way 
to systematically clear fault status and set the prerequisite registers 
for LLP (DAI1). But ultimately reverted for the sake of simplicity.

>> +static int tas675x_runtime_resume(struct device *dev)
>> +{
> 
>> +       if (!to_i2c_client(dev)->irq)
>> +               schedule_delayed_work(&tas->fault_check_work,
>> +                                     msecs_to_jiffies(TAS675X_FAULT_CHECK_INTERVAL_MS));
> 
> This is the only place where we start the fault checking but runtime PM
> can be disabled in configuration and we also start runtime PM in the
> active state so potentially might never suspend and resume.  probe()
> should kick off the work as well.
> 

Yes, I need to add work at probe time as well. Didn't consider the 
scenario when PM is disabled in configuration.

I originally wanted detection to only kick off after the first playback.
But scheduling work after the power_on which clears faults status
essentially does the same thing.

>> +static int tas675x_init_device(struct tas675x_priv *tas)
>> +{
>> +	struct regmap *regmap = tas->regmap;
>> +	unsigned int val;
>> +	int ret, i;
>> +
>> +	/* Clear POR fault flag to prevent IRQ storm */
>> +	regmap_read(regmap, TAS675X_POWER_FAULT_LATCHED_REG, &val);
> 
> 
>> +static int tas675x_i2c_probe(struct i2c_client *client)
>> +{
> 
>> +	if (client->irq) {
>> +		ret = devm_request_threaded_irq(tas->dev, client->irq, NULL,
>> +						tas675x_irq_handler,
>> +						IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
>> +						"tas675x-fault", tas);
>> +		if (ret)
>> +			return dev_err_probe(tas->dev, ret, "Failed to request IRQ\n");
>> +	}
> 
> We request the interrupt here...
> 
>> +	INIT_DELAYED_WORK(&tas->fault_check_work, tas675x_fault_check_work);
> 
>> +	ret = tas675x_power_on(tas);
>> +	if (ret)
>> +		return ret;
> 
> ...before we do _power_on() which is what calls _hw_init() and clears any
> faults that were latched in the registers.  This means that if there is
> something there we'll handle it through the normal interrupt handling
> flow and the rest won't buy is much, probably better to reorder the init
> vs the interrupt request.

Absolutely, will reorder the IRQ request to after power_on(), so the 
handler only starts once the fault reg gets cleared and in a known 
state. Along with scheduling work at probe that I've mentioned above.

Thanks a lot for the catch! Will post a V2 addressing these concerns.

Best,
Sen Wang


