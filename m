Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011043.outbound.protection.outlook.com [52.101.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0928C322A28;
	Tue, 17 Feb 2026 10:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771322699; cv=fail; b=Onebvy8/Ar3LQpkImlW9Uzw4x31Usn3js0WkTb6STpvzE9LBX35Ei+FwVx0Mw4EXQ7WTyg9KlXOWFsCT8+yw8LDu4gAI8vOWxnoNTSXgAKnsltrJ/0AAFM27jD9po7xDTMvnt4+50+SKEp/1KD7EThWK+yU2IoutLAA6vlu2Hd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771322699; c=relaxed/simple;
	bh=+J63JOA+pAYYbDC32K2YDxUC+egStW8/x18M9xtx/rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=REPYVdduE9wM8+HG8SOA2NGiLTy64tyfnwz0CNG9cG/dqmi/IJI/ILAi895TSFSM5cAg/ps6+UpHfjPrT9NqiOGmqERDVY5s3VitkPbg94N60nvXy95Uf1/IlzKFhhUPayIQgiyfTExJsTYQiXsk+EShmkkMrsX6Te4WzQdBnQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lJ/THRIb; arc=fail smtp.client-ip=52.101.52.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lJ/THRIb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhB4GK/M2vB2i1ec0BtwUqWd7o7OFTqR4QPGZdsySz+oLW7TMR2fJ9LHA0Iw5cjHpVHhZH17YpEPlii5hELFNCfx3hpXuseGTvVTb6Sl42YnYgL5nWRtwbYd5ylx5C6nzz15/bnNZGyx8CNOSCRqgSRXEARTP7NDlffL81Ss+lSlOgPznGjzYKAhtzPTGLw/8C1JajZoFVbBi6A11ZKKVNg5wMZdibK4Ru1qzguCbq2HwTFhYNJfhP+asK+VI7+7Jeqk1iZG04icqa3kb8wA/GseSE53ZkttsB0z2Hpg36etOiLYZsL8Va3Du7cUPbHP/29MH528+tg1OpyZ+RLzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iay4TSC0KFsZ+Umm/Tu2tje5YNQJX19Vn++8Dcr30Y0=;
 b=CCeA2O+jpUuCtmcObN79V3ksqmd3HRw4ZKv0tFsoOBosUBRbbetheBIpKeHWLXpkLH9fBOsCfF2Z4EFt1u208VrBKSeq/nZuA7cSRhF5sOoupTbKAvyIyn1amPHVT1AGJDx53cfYorBFC/a35jD6SriY9WxRs8XUHvV9wTXzFeBZj5FYtIYjzji1JV4Ir8mgjTOgQPo2Hs4+O5doYR2JuG/YXW4xR9HkY8MuTg8g13tDLw/BevNoMxdy9FUes7K89oIWxfeXGEcge7S6WbEx6Tz2JKOmnEKigJcgTiF1YBFWN0MLW2zsK0i+m4YybrdhvRjpmKlXQlo6BoXceY/h1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iay4TSC0KFsZ+Umm/Tu2tje5YNQJX19Vn++8Dcr30Y0=;
 b=lJ/THRIbn7dTS8vwFaxRQgBO6r/llB89PSoy7bQ7a3B/HYjMC6A+m8iyTuENewk7v2YCWezhMaOOmN8DFUjBwgwrlM1g449Ilc2lbrQdv8v4seENrZWEFGnMcIjcbfa6jkw9wAXjq9umWgku0tP7ICGbPcU+bBeYEKfNTkrHRMQ=
Received: from MN2PR08CA0028.namprd08.prod.outlook.com (2603:10b6:208:239::33)
 by SJ5PPF136884A98.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::78b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 10:04:52 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::f6) by MN2PR08CA0028.outlook.office365.com
 (2603:10b6:208:239::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 10:04:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 17 Feb 2026 10:04:52 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 04:04:49 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 04:04:49 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 04:04:49 -0600
Received: from [10.250.151.50] ([10.250.151.50])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HA4i153172664;
	Tue, 17 Feb 2026 04:04:45 -0600
Message-ID: <3fed8767-d0a8-4136-b602-f236254c3efa@ti.com>
Date: Tue, 17 Feb 2026 15:34:44 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: ti: davinci-mcasp: Add system suspend/resume
 support
To: Sen Wang <sen@ti.com>, <peter.ujfalusi@gmail.com>, <broonie@kernel.org>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <r-donadkar@ti.com>, <s-jain1@ti.com>, <m-shah@ti.com>
References: <20260211221001.155843-1-sen@ti.com>
Content-Language: en-US
From: devarsh <devarsht@ti.com>
In-Reply-To: <20260211221001.155843-1-sen@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|SJ5PPF136884A98:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eaf8cc0-450c-4bd6-0afa-08de6e0bfe36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OS9TNkQzeHcrZDBUMmtyeHdMSmZsWFU1OUQrNmxOa1cvNUtSS09JdHpWc3pk?=
 =?utf-8?B?RnY2dzRNSVNZRDVZeGVCZTZxSFRqYkdMS2VkSGlEa0ZiR2IrWnF6ZFVVVHFm?=
 =?utf-8?B?SVFzK3VsclB0SHVTTjkrY2lGMThNbVU2dktYZGxGbFVSN1EzK3dYdWcvMFRz?=
 =?utf-8?B?cUwvKzArM25EcGxieHN0bGtLWmhUbXFDWjVVd2N4a09iMzdNeEtXVTh3cEN5?=
 =?utf-8?B?K2dQUTY1SDl0VkRNOUJLMEJianM4STBjbUpHclppV2ZqVG13QUY3Z05WSW5s?=
 =?utf-8?B?VkpqVDljam9uM3Z1RTJWcFVFR2ZBTUswV2RQOFpQZGUzeHoxNDRCV2VUVW8y?=
 =?utf-8?B?RHNMeG1uWDl4UXBmMnRScCtEcVRFaWtPblRrVWlVM20zL2c5bzl5YkRhVlVI?=
 =?utf-8?B?d3B5UTVWbHBZYVBYaFpDNzZRc3Jnc1dsMUFsYWwrczdqY2d3RGwxd041UTFZ?=
 =?utf-8?B?c2p3R3M2OTFFZHlubWdYMDI2Uysrcm8zQmdhOGxGQXhsdkgzbUJLWlc2Rkhu?=
 =?utf-8?B?UjA2eEdHU3lpOG1GT0pVb3dKa3F5TkJMUlhKUjVrbEtBYW1pTkxpWUxSeUhF?=
 =?utf-8?B?aUM3Q1lhQ0xaRyt3OFovYmMrVEpna0k2YXBvV3VtMzhPUVozbHFzYUlkbGVx?=
 =?utf-8?B?NlNCODdwVVd4UEhQZVNXWkNBNFhWWk9tNUxCVVlsQ0NtR0lpQzRpdmJpeW5m?=
 =?utf-8?B?clpQSTRHOVd0REpaNkNORFNtcVhWeWUyajdoYWU0MmJ5bnFrMDNLcGJNMjJp?=
 =?utf-8?B?dmVmZmFDaS9HZGEreDBNNlI1bnFsRG9mWWVRcE5EdjhTTWRSdUpra0drM0FN?=
 =?utf-8?B?dHJreHJnMWNDbFNuSXd0QnBOSXhHUjNOYlRzU0I1dGlvRkx4Q21UQklqekY1?=
 =?utf-8?B?dGFHSVlsTDRjbms4RTc5enlOM2c0UWdtQ1JzanBCTjhaRmdoaGNLNkV2OUlX?=
 =?utf-8?B?VVo2Rmg0N2tEeGlZemtIZTRBMzdRaHBod1dlcmJPUVAyZnFwSG9LeDdxOTRh?=
 =?utf-8?B?dE5jTHJ4QUhMSWhJeXNsQXhUWFRSaTdSUVRUTStnWEhUQnpyaEFrZ0JXc2Nx?=
 =?utf-8?B?cUNVSzNpZVBlUnEyWG9uQ0p1T0d2ajZaVlBZdjVkcVYwRTJBLytMSlc0bTFM?=
 =?utf-8?B?bWR4ejdScGhvVk5ucUcvd3NPOWVHSWtPMVhhYS9HMHN5d2J1Yk85N25yLzFn?=
 =?utf-8?B?aWp1c2tVMkZ2TlJJeGJQU2R5ZUZ4ZjBacTI3ZzBUTERqWmovYjcwZ1FqK1FP?=
 =?utf-8?B?dzRQSk9NdFk5c3F1c0RJUUtrU3ZEeC9UMWpYYlU1elpnZHR6MVpkaVRaRUti?=
 =?utf-8?B?THp2UmRFL21SNXpCSWU1TXQydGtXZ2xyRUJJUTlyRmQ5WGZDNXo3YkNyc1JC?=
 =?utf-8?B?YTJkRm5va0lMOXVxbGV4Y0lnaldPbEpWZ0pHaDhGNEhkbkpBN1NFNFozMGFk?=
 =?utf-8?B?OEk5d1NCaWYwdG00Nzc2bE1JMWdKMWtGNDFnL0IvRW1pZGtIa3AwdEZ2Rit2?=
 =?utf-8?B?VCs5aDU4ZTVMSk04M3BpcFA3MHY5NUVTMjdtcDQzM2RLazZIR0h4WkZWQmRR?=
 =?utf-8?B?QnA4Z0JXSkRsUHJhZmpJeDFwekp3aG9hcmRkeG4zU3ZvTThFZHJwVkFpVllZ?=
 =?utf-8?B?NUJlWW5ZenJXNWMyNVE1dFdpcFExNkYrUlhMMEw3SEdLQ3VWVGQxTFZnSC9S?=
 =?utf-8?B?VldZS1B3VUxFMnVpUk5wUnp1ak1PQTVUWXh4VUVSamdHbkNmLzlDTTlQSGxw?=
 =?utf-8?B?NGFlUHlaOERFbkNURTVNQ0Z4RmlPdFRiYlR0bjRkZG9NcGVsa1c5M0M5V2dF?=
 =?utf-8?B?SG9oZUdRUlBoZkhhSTNkYUJnZllZU2dJWEVBYXlUdkpTTk5kY1lFazJVSzRr?=
 =?utf-8?B?cHI4ODF1ejNkdnduTVBPVEdhUGJENXE4c0h4TVFmbVd3MmVOdDRrbEtBSVFr?=
 =?utf-8?B?NzVwcEZqQzNra09Vc3dXZ0lTZ0ZQZnNHV3ozS0x1OUlqVGdOdC9jaEJBSyt1?=
 =?utf-8?B?aS9aL2VTTjB0bEJpVUl4UVBjMzFSYkVGOG1WY0s2Zkg2eHZRR3RWODByTGlu?=
 =?utf-8?B?UkF6ajF0akdOQzhrd2RnR1E5aFZaVFN1Ym9tVmV2bUU4dk5qbGN5NktCcW04?=
 =?utf-8?B?VUU4UTVKczVxWVBhRE1DTEdKRXhvelNRT2RKblVLYnZJL0k0SUNHRGNGbGRF?=
 =?utf-8?B?RGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gRl0xol+vxOxGZNpgOtM/rwE2n0G5ioswBt6xGu05sNNfPEHAaQWL5aeNGEcA4waOZsyfapvsxhFEvR5jSspoX7jpeffrS8jieVOUVAhSS5ou8tI58lWizhdK02VkJj6DnNyF4Itvjyc+Zd1DNRmdPQwj3urdeBYSflYblBUVSeEQ0eSI5Z02xay4EKJc+hW4uEuZMtGB6GtEUzYz4QvvU3yz0gQWtz/ToEpX6I905BfgICA9gkXDP+S1dXKRvEmFGs0ptI4bcI0GZoWId6CXqSscrRSGifhpyTNmtYRB3VqLt3Ef0VLY8zM43d8FvRfRoSYkAYeOHo5f4r+U7IP5CnSDiRAZqSPxg8O28VA+TRUApeOavWWDu0bA8iNgswOzzbfFpkBGbd93RZ7ZdJ2XjHcVm+P2p4bONnZhjl1CLaR+VmOntvL2+zfUXjPp8e1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 10:04:52.0698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eaf8cc0-450c-4bd6-0afa-08de6e0bfe36
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF136884A98

On 12/02/26 03:40, Sen Wang wrote:
> The McASP driver supports runtime PM callbacks for register save/restore
> during device idle, but doesn't provide system suspend/resume callbacks.
> This causes audio to fail to resume after system suspend.
> 
> Since the driver already handles runtime suspend & resume, we can reuse
> existing runtime PM logics.
> 
> Signed-off-by: Sen Wang <sen@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
> Tested on SK-AM62Px with audio playback during system suspend/resume cycles
> 
> Testlog:
>   https://gist.github.com/SenWang125/065c2840071f2569a79db9e99010603f
> 
>  sound/soc/ti/davinci-mcasp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 8a2977093df1..643661ebee83 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -2811,6 +2811,8 @@ static int davinci_mcasp_runtime_resume(struct device *dev)
>  #endif
>  
>  static const struct dev_pm_ops davinci_mcasp_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  	SET_RUNTIME_PM_OPS(davinci_mcasp_runtime_suspend,
>  			   davinci_mcasp_runtime_resume,
>  			   NULL)

