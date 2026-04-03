Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012027.outbound.protection.outlook.com [52.101.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB83C4503B;
	Fri,  3 Apr 2026 01:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775178997; cv=fail; b=dSZWjOZdFpBOUjUEdIEl7SvjLTdS2uPcWoxZc+ZJCQXPKwDWivr4Pr2A0/FzLeSoLUWk2EKzjiOtqNfCOeRH6joZv8oMzV+9TT0mQ5tHNmgZxMUulD4jdhY4T22eoecbnfFB68vMXVm6iHaJJI5Kc4Or1R/gKAhsw/KV2yoSUFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775178997; c=relaxed/simple;
	bh=Uz+tCHS5xXAVvNBBbf8CbT0luEgaU4MQs4NTeT9mzv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Pa1vZhnB7Agsx+g8EzT0xX9V48rJCIb7RXIiFPv1BfgLW3u//i18XTNN25NKn7aKJiPDj+6ToqQxhqO7VFb5t4kuuzFMAAVAk+kvHdFdo4iI/arCPo4tuz/ZARUVq7B7IEDYJWcHNkl1NGyUjJ5AkzGZYVDZGOVi8sJ67umWO6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lNJD7Af0; arc=fail smtp.client-ip=52.101.43.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lNJD7Af0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oq3ddfSRmd6XND5ozl/vbDQIbruYd4ipxzrvIyGl1CLG16KLhV/cP8bRLRcqlPX6sGJ/4THCB4gHP0nAxwhHQMo2+3amy7qVeLbHyUFw+w1b3EZdtHc8kgaGxog+xp+HkExzBDddUAJjdnxJAXfN5dBM9jetdUgjUzX9yoBgkjQYcrH2P9MGa1o9mZu74wUojm7gPN24GUik55qDDiiiyZ2ZcuBuwWBbZaLbV693cxfn0EMqQjtm9GlI7UK5KvZEvvBvA6vOBJWwWo4yUhImxVnYTRJRMLRoxVN2B/EJ80sJk/Fl2FZQNul7EgQr/PuDXjLC7J7PR9Oz1Ntf5/yhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztPOzsajsBvJRWwCKrL1QJCUZPkXjW46MyuKIjtOVR4=;
 b=WXjJ4rcNPGeEMsJTG+alLobrzb9orZ86MmGlWPutladyFGUoqJ/sE4hikApoczhZhKkn9xNYrjBr//r/OjrV1NaKph4KFeotUCEsWUmMm4E/G1Dtnr+CNO8bjfPjM+rb0j2dJFAY7SA/T6F1q54Rx0+w/mxt2fkrJVulB+ybYnUEXj/vXKO0L4uXuYVpkXVJMbkzIsJwA5UbmVtttYwtxIrzp2sSgKY0CHrrWGD7Z+rDp81Hb377sOUERTdLY1zkmapEkXvaS7Hw+Jr1HOakYHEmujMDHW1++lJ340/KT3XwHEKNLDINonHcPXeaj0UtFQBAKUkuCPN+ETRyy3yDWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztPOzsajsBvJRWwCKrL1QJCUZPkXjW46MyuKIjtOVR4=;
 b=lNJD7Af0+Ja6UMcxDOuKC0DMVdwKYHNTLx+QZixcAHKcMdbIUK6DTxiW7CVGT3iLTaxKoMs0U8gyriu4wtNhc5F4yM1B2GKfZ4lttl7O4/CIQOej/dPovpVLQCKHkDIlWQPtoyw6bLSGtH6Zzc4F+A6KjcoU439xcF2XryGr/P4=
Received: from SN7PR04CA0042.namprd04.prod.outlook.com (2603:10b6:806:120::17)
 by SA2PR10MB4809.namprd10.prod.outlook.com (2603:10b6:806:113::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Fri, 3 Apr
 2026 01:16:32 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:120:cafe::52) by SN7PR04CA0042.outlook.office365.com
 (2603:10b6:806:120::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Fri,
 3 Apr 2026 01:16:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 3 Apr 2026 01:16:31 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Apr
 2026 20:16:31 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Apr
 2026 20:16:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Apr 2026 20:16:31 -0500
Received: from [128.247.81.246] (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6331GVLd3540291;
	Thu, 2 Apr 2026 20:16:31 -0500
Message-ID: <fee4b641-c89f-45e3-a476-58d7728e2775@ti.com>
Date: Thu, 2 Apr 2026 20:16:31 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ASoC: codecs: Add TAS675x quad-channel audio
 amplifier driver
To: Mark Brown <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>
References: <message-id-of-your-RFC-cover-letter>
 <20260401223239.1638881-1-sen@ti.com> <20260401223239.1638881-3-sen@ti.com>
 <3c300b9c-1589-492c-ace3-4d8a1d25f1ed@sirena.org.uk>
Content-Language: en-US
From: Sen Wang <sen@ti.com>
In-Reply-To: <3c300b9c-1589-492c-ace3-4d8a1d25f1ed@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|SA2PR10MB4809:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b8267d0-2421-401f-1c01-08de911ea3e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uZW1BwR86HdEooOokGArs5Ooqgv9Sza7zg46RHcx430marBfYpwxQYbBrgVtfQeUDqtsQM1EoDzxK+VbmPM8E9GFUOdAKibLoFY/D++MWJ29ndqXBGxxYR0E6amGyNhEArp2Mlnst69NW4mcpZI5ne81bvX56+8wKqn8+CpHtxIqt3wVCrBDDJPfNE3m1lxPawYdqYlc3Wnd8TUIXsgTiC1Fw+HO6vUmuKlv/yCnm3p+tk7MmwexhO1oiTRrNV67BrBEjUKdXt3YfKV0DZY2iP31fnZ19mj4fSD5igB8MUegLt2K49cynE+ymk/Syf+CJrrfoSZDgf+t6C14PxQWlyN3xS99QYJrSl8vjHMLnWr8fhQ0jt95K3Cy+QEJ1efCflVfzrasG+5zAPW7VUCwD2RYvg5u5NqzRq4NWOyecvav1uX5KQz+pGZobSRH36R/NIlNbReQW3hSLYRoyXnwGUJWxOihPuSsFLOAztvvlqwIVik1KX9j8dyExJ/PQTn0dfQUcFRV2TrDEXGkBc7U3VIJupc6Z2idSv5ozg5LgJj41Ue41uHESNNrNMI5XVOot2Zx+vsbrjII4NI3qYSOi8eEyE85tyrK0Bs+gENALODXFnVBn3j0yUfeCUXIfbVwDntWG0MQKRjHlW6TECeCJJTmUw7ozKLnv4ATkoDu2s3HONY6+cU4Hj1vmNol9TKzuoOarvOKVmusoQb2fWfBtmNKcF79LlzcDX/isrTTp+qUxOoFh7Eho+Y7ThGB0xDrqT6NTgpRfiPtC+v2J5S/Fg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mRr9PlG+drba8DIE9Wqc24FHMDR/coqw6CUG/y+ZY3j+wROjWmIUI5EeI/GdCZ5cewfphfYQyZ7xMBQAXjhdBfeXWimArCmYqqtQ6ytDgGircV/RTiWN1zEc4ywZOFul/Zdhs0yhFqLCW4jeiyoB9yypROyrEqTywZpodY1H6ccc4cCDGzjs7wKRRLV/B9fAt2EPTCtE5XBSRgztl985M2wcdNscQ5mXd+5VSIuP5/teNrr7K6RllEnfpxYw2EK2UJ4sPmhzrqFOkYPymLaInZMto9z3pLo2g5BZ9NJd8d+EWaugxUBLd3HI5ZVqRs6HBEjpkomUHrCjiIOvdK/RPuwS7MIA0g4rl4Sa+c0y8O98R+d+nsKaUrDsSFrDFAIkHx+ENbBJHCHvrWUtCXpNADVN1b39NH4ifJQVmcsa0p3kZRzG9mILiby2ZVfv2ngT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 01:16:31.7549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8267d0-2421-401f-1c01-08de911ea3e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4809

On 4/2/26 12:10, Mark Brown wrote:
> On Wed, Apr 01, 2026 at 05:28:43PM -0500, Sen Wang wrote:
>> The TAS675x (TAS6754, TAS67524) are quad-channel, digital-input
>> Class-D amplifiers with an integrated DSP, controlled over I2C.
>> They support I2S and TDM serial audio interfaces.
> 
> One issue that didn't get noticed last time, sorry:
> 

The more the merrier :)

>> +static int tas675x_runtime_suspend(struct device *dev)
>> +{
>> +	struct tas675x_priv *tas = dev_get_drvdata(dev);
>> +
>> +	cancel_delayed_work_sync(&tas->fault_check_work);
>> +	tas675x_set_state_all(tas, TAS675X_STATE_SLEEP_BOTH);
>> +
>> +	return 0;
>> +}
> 
> This cancels the work, completing any that's already running, but...
> 
>> +static void tas675x_fault_check_work(struct work_struct *work)
>> +{
>> +	struct tas675x_priv *tas = container_of(work, struct tas675x_priv,
>> +						fault_check_work.work);
>> +
>> +	if (tas675x_check_faults(tas))
>> +		regmap_write(tas->regmap, TAS675X_RESET_REG, TAS675X_FAULT_CLEAR);
>> +
>> +	schedule_delayed_work(&tas->fault_check_work,
>> +			      msecs_to_jiffies(TAS675X_FAULT_CHECK_INTERVAL_MS));
>> +}
> 
> ...the work unconditionally rearms itself so we might race and requeue
> (we cancel *then* wait) with the device powered off.  There's the
> disable_delayed_work_sync() API which should be a better fit.
> 

Right the APIs themselves aren't atomic, disable would be a much less 
error-prone approach. Looks like TAS5720 & TAS6424 has a similar issue 
too, where they have cancel work at DAPM events instead of runtime 
suspend. I can test and send these changes in a separate patch.

>> +static irqreturn_t tas675x_irq_handler(int irq, void *data)
>> +{
>> +	struct tas675x_priv *tas = data;
>> +
>> +	tas675x_check_faults(tas);
>> +
>> +	/* Clear the FAULT pin latch as something latched */
>> +	regmap_write(tas->regmap, TAS675X_RESET_REG, TAS675X_FAULT_CLEAR);
>> +
>> +	return IRQ_HANDLED;
>> +}
> 
> Also, this should return IRQ_NONE if no faults were seen (to allow for
> interrupt sharing and the genirq core's handling of hardware faults).

Understood, thank you for the context, didn't know IRQ_NONE provides 
additional heuristics to irq core. Will post a follow-up V3 addressing 
the issues.

Best,
Sen Wang
