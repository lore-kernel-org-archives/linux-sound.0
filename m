Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010035.outbound.protection.outlook.com [52.101.201.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E4D3BD62A;
	Thu,  9 Apr 2026 15:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748454; cv=fail; b=h3zXzUSzArGi7lWCmXcM8BFcTD//8TltLpNNPTcC3dPvxGqYk/L6gqRGAswIF6fu/PYXeKDwqh25JGcAmQF/0ecX5PNYwFEW68ZUO0oXX/BWOE6mLFhqjyPDfhXM7F0rZgb8IspXSUArVKF0iDU+iNpS7L7dQEWA0vx6e6S8Vb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748454; c=relaxed/simple;
	bh=uEdKeeZFdkuCrxW7zZBb6RxWhHdcq5h+5sdT4GTaWwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rWiWGcRQiibvFZnFtqLjq95YAEHyF51VWI9BGqogND8rqQAzHN/HUMVPnmgIIIU7gD8q3GLTeqpv3VSg6I910cBfKYEPi7AY0/Ijud1iVdtCZDLpurVlcGTKyXefQ4Qx17/D55a1QQCvYw5XyQMqa2ZkYqy9GhKtONuFxxS1FnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ko7c+Dcs; arc=fail smtp.client-ip=52.101.201.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ko7c+Dcs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUZWwsBrxHFleacYViuMmt+pfkWUC3y2Hq26vCWNl/fXis1XmDuLFNvmfIMXZhYawdQwxWbOWWSDWz5lb1pWO6KC3he918gXEp76I0GcGlx8PsdQD1y2CrVEgfsn/Ks4oI56/wRJ3EtfCA6SC3bsPSFxpEfPKOqOccaIr4oV3NSkxyp13aFfGLelxJfoeaEn78SwQIeU5FYmiZjPm3pUe1Zs5NV9GCbzf1C7MNh5WsxgojeJi7WuWnAUCJliyoxolXL3niRdYdOga9k4Tb1GVDQkifeSJMexaKjn5xbJBozEBUte7In+WaYJykXbp61dMP7/8F98DR1eMlzqEi4/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5xVos7b2EuYayAR3TgR3IQAzIIsxb9TsfqOKgSDcxQ=;
 b=KZqQLRdDTbgWZu29CFV4R8Ox5z3ApC4faZpH6NHDH6Me37hdMRi7Lb9mgjUrykquGkFGo08D1O1fVVPlgBlJqapZZVyfMNhqwzu1IepcxOiTwRJVo8XnHt1//5QrSQYRtoF7Tyi43arOV8vVUtjIsat74V0SoQ01QfO1EgaavudnkdmYw727t+XSNmbMn9h07zcHVuLs9ZxwiWkyYQ4MeFCJBHUq9XMo4RKDP2lqTP36cxUHcljx6nHZllDUja89BYwcVGv0AMpqihY2BbN2FjAd9TzYYmaEMvmcYC2o7JbfDatPOH8K2qDS+jqFPv5+VmvWU7BPp/8renePPLbjWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5xVos7b2EuYayAR3TgR3IQAzIIsxb9TsfqOKgSDcxQ=;
 b=ko7c+DcsHpuU/O3X9xS9t22qJUW/kFron7ab3MUBDRQ3L1WSgTbXv18h2OvdxjmAEr8mlLYxuPtrg9/q56S/E8JkC1xuMxVJ05N74Y7hHzt0DI2nMASsUyFr89Flp4hhLT4nVZpGpb5IdUdq4HP+0RcXJbgQ+ChamFmX1kNHWfQ=
Received: from BYAPR06CA0071.namprd06.prod.outlook.com (2603:10b6:a03:14b::48)
 by IA0PR10MB7382.namprd10.prod.outlook.com (2603:10b6:208:43f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 15:27:30 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:14b:cafe::55) by BYAPR06CA0071.outlook.office365.com
 (2603:10b6:a03:14b::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 15:27:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 15:27:28 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 10:26:56 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 10:26:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 10:26:56 -0500
Received: from [10.249.35.69] ([10.249.35.69])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 639FQtUG3991264;
	Thu, 9 Apr 2026 10:26:55 -0500
Message-ID: <6d0fa8ee-b189-4ccb-a120-d7d42300168a@ti.com>
Date: Thu, 9 Apr 2026 10:26:55 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] ASoC: codecs: Add TAS67524 quad-channel audio
 amplifier driver
To: Mark Brown <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>
References: <20260408053149.1369350-1-sen@ti.com>
 <20260408053149.1369350-3-sen@ti.com>
 <588c699e-7ad0-4f71-9727-56e8a3c78805@sirena.org.uk>
Content-Language: en-US
From: "Wang, Sen" <sen@ti.com>
In-Reply-To: <588c699e-7ad0-4f71-9727-56e8a3c78805@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|IA0PR10MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: deb2b58e-6172-4acd-c2e7-08de964c8273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DV7j0ZSW/8zNSMthz6sxk3kGnknJt7/zPabatKQySpaDwLUSyFAv1vjGozLL70iPOKfiGNJJtPj0VZFvnEtisfUkpI9hO9+N8v/Jt/0Vtl1FecKkEGKuoVXc3RqktJ4Dk9aw5iidd2l4swgWps9iJlp4WglXMKfn5Icttf6KiNx9sm7k8FXsGckUxdTj43YyKfz0pPZ3tKHq8ZsHGUCEbIVvyZher3bUW9BkHRS+Nddz2V1xMbaMzIJBrGYSPvP3Kb4hhlCt+QGTYWgOa4kzSJIZCU3SKJ19O0vMZLXe3vo+wMMcRz32z5IZKapFFooXp5k+cXkmhcFAWeP/XfzSHqRPphbrUMDUMkz44gdXajoK594R+trCehU8K2jMit3508SbGOuxlN2tNlasIM94eZbJKOMEh2bv461LBZzd2ROY1CH7pxAaAS/A51X0HT8BtpG+ci8+s9gAZaL08wqsMSaBCL2Sr/LXcAIfLlgmrfuHa0tjtPpqoVQWNLvT98doQb/0ZgKxBpaU+KrKXeqqlXauJAiPiOQQB5LMkVLc07DsjZ1+f8g5g+3edbdIKp7sRrIzFQmLOFl5WGPpmgZxXLrIXzQf6ZRBPHLXvfN9iFpz30Bi36XmucDDDjxefj1SxsdNdTinx1K7HZhUbmzYdunYlfFOIhsBlFxn94XZElu8aOBmMMq7g8we/qqnl3XK8qlPv3Ec7tuPULMdh0+WKIqcve55gQeiFcAJkWblkWbfStOvVrrsCvMoTPMByOrq76vuqMoRxzihnplG4Wjs4A==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ACRjupLoGpScVOn4Id+HWTL5es92ivdmvsIJmtrTOJZmM1v+WxmQjnGTSCGz9IJFQw8WJO4pAeAuy+4uee0abmGpPpRooze6fXoVRB4E+guaH9mIQ5VW+h+PNYEeaK4mQuztRQYtMAudnd1GXuWM8O+XLDkHy45cO2aQV9y8QJk92DaVFgaRBXsj7SSdToyIx3y/5IZkyv7SmUitEsRYFzBbls/P506CU8OCRatyrP33Qk3tsqj3AFEp3u2MvD+VqoMdaEoQD9S2c1g0FS6lxQVVz++uOkV1ipiT1yYW+mj/kOclKjmrLFF8aszVpRspmssnbOOxGZkcHBv06VfIPL6getVrWKgWact6VVUlfevgG2T/S0JUm6IOy/UrcMtsfEomsl1E238PEFmWz3KWHM2pJMEd2mbN99ZnfaXZNQ1ZOOJVI9XIWG17bD3rzHur
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 15:27:28.2211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deb2b58e-6172-4acd-c2e7-08de964c8273
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7382

On 4/8/2026 10:41 AM, Mark Brown wrote:
> On Wed, Apr 08, 2026 at 12:31:46AM -0500, Sen Wang wrote:
> 
>> +static int tas675x_dsp_mem_write(struct tas675x_priv *tas, u8 page, u8 reg, u32 val)
>> +{
> 
>> +out:
>> +	__tas675x_select_book(tas, TAS675X_BOOK_DEFAULT);
>> +	mutex_unlock(&tas->io_lock);
> 
> Do we really need to restore the book here?  The book select register is
> marked as volatile so regmap will figure things out if it's the next
> thing to write, and anything else will need to set whatever it wants
> anyway.  Alternatively if the book register were cached (which wouldn't
> be a bad idea) then we'd need to restore whatever the cache has or
> invalidate the cache.
> 
Hi Mark, Thanks for the review!

The book restore was needed because only the page register is listed as 
the selector_reg, and the hardware also requires page 0 before switching 
books, which kind of prevents cache and including book management into 
the ranges config alongside page selection.

All other regmap accesses in the driver implicitly assume DEFAULT book, 
and therefore I can get away with simple and explicit switching of the 
books with help of mutex in a few places.

Would you suggest a regmap/cache mechanism better suited for this 
two-level hierarchy? Happy to rework it if there's a cleaner approach.

>> +static int tas675x_dsp_mem_read(struct tas675x_priv *tas, u8 page, u8 reg, u32 *val)
>> +{
> 
>> +out:
>> +	__tas675x_select_book(tas, TAS675X_BOOK_DEFAULT);
>> +	mutex_unlock(&tas->io_lock);
> 
> Same here
> 
>> +static int tas675x_rtldg_thresh_info(struct snd_kcontrol *kcontrol,
>> +				     struct snd_ctl_elem_info *uinfo)
>> +{
>> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
>> +	uinfo->count = 1;
>> +	uinfo->value.integer.min = 0;
>> +	/* Accepts 32-bit values, even though 8bit MSB is ignored */
>> +	uinfo->value.integer.max = 0xFFFFFFFF;
> 
> This is going to break on 32 bit architectures since long is a 32 bit
> signed value.  You want LONG_MAX, or to restrict the value (which would
> be more friendly to mixer-test!).
> 

Right, I should restrict the max value to be just 24bit 0x00FFFFFF to 
make it friendly to mixer-test. And I can also lift the explicit 
zero-padding in the dsp_mem_write funcs which is not necessary anymore.

>> +static int tas675x_set_dcldg_trigger(struct snd_kcontrol *kcontrol,
>> +				     struct snd_ctl_elem_value *ucontrol)
>> +{
> 
>> +	/* Wait for LOAD_DIAG to exit */
>> +	regmap_read_poll_timeout(tas->regmap, TAS675X_STATE_REPORT_CH1_CH2_REG,
>> +				 state, (state & 0x0F) != TAS675X_STATE_LOAD_DIAG &&
>> +					(state >> 4) != TAS675X_STATE_LOAD_DIAG,
>> +				 TAS675X_POLL_INTERVAL_US,
>> +				 TAS675X_STATE_TRANSITION_TIMEOUT_US);
>> +	regmap_read_poll_timeout(tas->regmap, TAS675X_STATE_REPORT_CH3_CH4_REG,
>> +				 state34, (state34 & 0x0F) != TAS675X_STATE_LOAD_DIAG &&
>> +					  (state34 >> 4) != TAS675X_STATE_LOAD_DIAG,
>> +				 TAS675X_POLL_INTERVAL_US,
>> +				 TAS675X_STATE_TRANSITION_TIMEOUT_US);
> 
> Don't know how likely it is in practice but we ignore any timeout
> failures in this function.
> 

Will add in the complete error checking for this function.

>> +static irqreturn_t tas675x_irq_handler(int irq, void *data)
>> +{
>> +	struct tas675x_priv *tas = data;
>> +
>> +	if (!tas675x_check_faults(tas))
>> +		return IRQ_NONE;
>> +
>> +	regmap_write(tas->regmap, TAS675X_RESET_REG, TAS675X_FAULT_CLEAR);
>> +	return IRQ_HANDLED;
>> +}
> 
> This probably ought to take a runtime PM reference to ensure the I2C
> controller is woken up, and in case in future you get regulator support.
> Even if the device itself shouldn't be generating interrupts while it's
> idle the interrupt might be shared or something might fire for some
> other reason.

Absolutely, let me add the runtime PM reference (mark_busy & 
put_autosuspend) on this one as well. Better be safe than sorry.

Best Regards,
Sen Wang
