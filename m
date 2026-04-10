Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011039.outbound.protection.outlook.com [52.101.57.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0217C26B74A;
	Fri, 10 Apr 2026 17:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775843813; cv=fail; b=N/wOnDo7SzIL187A5Xn5aNz/kgYKaKb4X1sgaQAjYa/sO8qCX5nfmeWOF3Q2sbTLe0wr2ZvpNKXPVMo14vSthS4G4nt49VmQN/5SYdMhFrkXiCaHjtlckfEo1Pi2213XFJgars9Twm+AvSeAoe87Fo0aBgKN6FZNKHQUFpKVmBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775843813; c=relaxed/simple;
	bh=m1nkql19k3trQOQRMyAqbRXhGUCbDWVByi6SyZ3wqOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eecUy8AOcsFHTXiXDQbSue2Sl8/KudKVISnpx1laC9y/LLaBrAPFw0mOk3eXwAwC6wUFDLTXRWHmdPoHlejPyqylHlNalYpBE+8jgACpp8YMxGcwCic8lKlbL/xzbFI1ValZHFnWOJJhmE6rQNf82qjE8BoqMJ7ZLOtAe9NcCmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xbzwl+fP; arc=fail smtp.client-ip=52.101.57.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xbzwl+fP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1Y4tHEVKUefXMfvW/+Hk5vNd3iqXusjJR1VS9ZxizWWD1LOfh07YMYmVjspjYPfz/XZfbERsY6Hb2aW06hCO4AfqWmZZvdOC8rTUy1jp+8HuGMadH8zVNKmP9umg4KrKX0ZZksnSDyBZHKjgKsBrV51QfGEDXICAh2sjp2rU5Yib1GVYvXJnX0axAnwXcjsKXvu974QO6CazOGRQElWCftGzpe2SfuztHLWhkyb1FoMAKrfOd7slDYC9KfwLQJGpQUhKPrpi6YKWUEV1tDm8u84E/bslORX3U1yWUtFADOaCVo6TlvaI+qJQNVHjpQFqvCjkU3it87a1rfc2NXAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FskvLhlll+6KPq/g14kBk2F561k3+I6nnqa/Yl7pco=;
 b=A4/j9gzmC7yiFI6EiDSQA8FMsxHTfvY7aRIi0St/zCHCd758Q+wjD/SCgKeRUkTJJRGSsml8MpoJe6BCZkcUHuGo3WK/7aPaP2amVtNmgMjyicYNUppWwe4jTdI0Z7CrennN7H5L0xrJmbvGONHMG/WKX6ZuHr5W38yHoF960Fw04h9jThX7c4hOLadvDdrO2oLkvCXzbFQ0FjqhfKEDM4np8JSN9TzcOfY6gW0LDIT2Im/PSegP2kcjzs+hYfw0YXVvAhEEY3JPoR/MEKnODWAQTRKAWgO2sdXnIwYyEqYJuC1ZBRluAbeE4ufUTjICNqxTAydpx+hB0O+4cC5D4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FskvLhlll+6KPq/g14kBk2F561k3+I6nnqa/Yl7pco=;
 b=xbzwl+fPWCJvVEupPf2ssx+6/e3KbQMExFhf72PafEGoVc6zYIXa/srVFzNSSXtCU2q0wnZgXgPR7RHsCNVph21u7irR1DHaqwPp3nkMFSpwYTcqrWGJhFVy6xrsoDWKTD/gP4P709QovlK8SqXu23StAgqsDHyg3yR72WQNfPs=
Received: from MN2PR18CA0002.namprd18.prod.outlook.com (2603:10b6:208:23c::7)
 by DS0PR10MB997649.namprd10.prod.outlook.com (2603:10b6:8:311::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.39; Fri, 10 Apr
 2026 17:56:50 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:208:23c:cafe::d9) by MN2PR18CA0002.outlook.office365.com
 (2603:10b6:208:23c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.43 via Frontend Transport; Fri,
 10 Apr 2026 17:56:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.0 via Frontend Transport; Fri, 10 Apr 2026 17:56:49 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 12:56:47 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 12:56:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Apr 2026 12:56:47 -0500
Received: from [128.247.81.246] (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63AHulOC609589;
	Fri, 10 Apr 2026 12:56:47 -0500
Message-ID: <a0f50798-3293-4b2b-8d9c-7a85fce9e8e7@ti.com>
Date: Fri, 10 Apr 2026 12:56:47 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] ASoC: codecs: Add TAS67524 quad-channel audio
 amplifier driver
To: Mark Brown <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>
References: <20260409220607.686146-1-sen@ti.com>
 <20260409220607.686146-3-sen@ti.com> <adkC_fNHcpRA_ffo@sirena.co.uk>
Content-Language: en-US
From: Sen Wang <sen@ti.com>
In-Reply-To: <adkC_fNHcpRA_ffo@sirena.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|DS0PR10MB997649:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff6746b-4109-4bbe-41d8-08de972a8a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KkDOoxJn4iBscYtgFVGOOYKtu27xAJ94SDoaaUIQdR/+28ppwkrHxkiDJYPUxa3QFMObZdluqIuG2DQZNo78TrKBPxMaSqNNqxSVOC8d0zJDD2KywJEw1ZKOf2gRY/IQnBGa7OG7KzivGhywsH//v7aFXQuF0KROimjvf8Y14dqEvEt+XY9QVWlFBWtgSv0qBwuJBRLtnvtam4XKLizr39WbthEBthcRx9XiBDFrKcMygsIsX8kfXRrendjh0cHN+mlkk+clcT7zbIGvx5uKXJdYkaYqqkAfUsFds0EnrYKm4LrcKW8dkr1ISNByYyV40nijqxsbta0UDuv6IkSyi914je4d6ozGO7sFPfry0d+arKERVZo4KH526EToPTobeN4w20tn9iOexBzcSzN8YNWzQTV6izRtrXMyzEAdcmFfDGdzFu0S8ufzSMLVZBMnSBsW1DdrmvrKg5X84B9eUXhIUhzFoEasrSh8hZp1D6GT1+uy+85DeVIvtGyz0Dcy3aTCkqeZG25/dcgSrDSjfqf4xZuloYv4fJrG7QUi/yETehflrhfTYpGfhw5en/sERZaQU0V3S5/Z/ENj5sbp1cMlWrBOop8hnyRdPVd+h34skU7mkSrVRREimSSeN2MLw7IEXGOaIXdduYZiKbrliqX13Mq+ZJTqN+HXbt4FHAFbeDfDzPe1Tp5Dr2Z2ufILTnNZrJEyNH0vsi7uFO2Dfgb7UgguBow9WF8j9JxO5XQVUwHUsZF0cIHt0K+6qK82OLVqsF+a7sSDM1UWLSZltQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OvioMhTn7AsFmzLV49l/T5lHTuvtC/hDxHanL7f2slZEjDRzyZzA8u62KEHjqlhF9l3RdxEtY7sH32FVrAI6bsRzvpzgowkQwVYGSC7CClJCE6bZOOS90oGpQ77yW2BtQfiqLA1adci+7AEvvdPlG+kwfqZofxAb466vJnA8zTxNLz2wyDmih3vzAax9W166lR3osHQqXrWvveKdXLn8PFzahVBjtxaDBm/9iuz2Er2UGP8dJbzwfHKpMTM1m6HkzaZTEe5KlP9E9xqyQFJjULmx7RFDfvxCbhyq4obtavCcIliP7m3xOCyver+bUqb7yJcHujA21BmyJ9ZBAEeA6xDcx+MRpqwSQ0WUgWYb2Vy3i43nj3q1y654Z+2xm3MlsypNuB1zdj6k8tlLSQFtkyLZ565zYV8zZorhLBf3sTP2JkQLBLHTrvLKWPNPZplY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 17:56:49.6985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff6746b-4109-4bbe-41d8-08de972a8a50
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997649

On 4/10/26 09:02, Mark Brown wrote:
> On Thu, Apr 09, 2026 at 05:06:04PM -0500, Sen Wang wrote:
>> The TAS675x (TAS6754, TAS67524) are quad-channel, digital-input
>> Class-D amplifiers with an integrated DSP, controlled over I2C.
>> They support I2S and TDM serial audio interfaces.
> 
> This looks mostly good, but one issue I see is that AFAICT we only stop
> fault_check_work during runtime suspsend - if runtime PM is disabled, or
> if the driver is removed, the work will be left running.
Hi Mark, Thanks for the review!

I neglected the driver removal part. I'll cancel check_work and remove 
IRQ in i2c_remove to prevent any possible use-after-free.

Regarding fault_check_work w/o runtime PM: the device has fault
conditions that fire regardless of stream state, so the work runs for 
the duration of the active power state (runtime PM) rather than stream 
state.

I could add a DAPM event fallback to gate the work when runtime PM is 
not defined, but that's more restrictive; it could miss faults outside 
of active playback, and adds complexity for what is a fairly niche 
configuration (optional check_work with runtime PM disabled).

Do you think the DAPM fallback would suffice, or is the current approach 
(poll until removal) acceptable given the hardware behavior? Any other 
suggestions would be greatly appreciated!

Best,
Sen Wang


