Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084DE241105
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 21:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747948452; cv=fail; b=ZJCX6WVuaEvTwtHKjcjaXMsiTrmYSn23BPLl7pvTIP8u27n2NTNZ1Zv+KlYoFipvgY0scUZ11qbZzvcjIYP1pm47+t4zE81QdL9nFv0Jrg4CiO5vSvWs1rzzWvxO7wMpgMgEkzos10yWbXU72ygbX1HeLVbxZZSmCGgNaGl7VwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747948452; c=relaxed/simple;
	bh=XgRIZafvwTmYR9aehvcCx/dAI0V/4mQnp5BzOWSOUKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UhbYZclQyjqCU9ds5qdLKRhTvxsyq6F7JWnQ2Fv/3iEf33Bl2nySW0y/H5HlvHoo/4V8CyvbJIFprZmNb4PNrtV4Y8iwVF5J5io2ZzlKOlI8dKbWmMd/3PnT//XFBKW+qV4ixaU8riM67Iz0Ha5GjOElxfPQR+Seer8DRMo62zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sjqUP9BJ; arc=fail smtp.client-ip=40.107.93.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sjqUP9BJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnNgATmfzyPTPo9PuuUdgGB9hSkl8JQNc/wL2Dn5l8Ow7KIc4cOFldGTOXoC01Jde6iwLllU5mPe/UD0nZxvZ8Yi6HmYW9V6C5cex0+hucdVUDOaMmyoFUipfmHMf6vPuWsJHGRUrqC1Te2ygjYBvsFAmX5K5B2zQ8v8yQhWAFVawFLnqNYXbxDZTUEpHB2cnVbWwb7XcY96HzlJmQwhy75hMYlFQhVj3LrAsA0aI5PZw77gduS7DPffpL3c1GzcQNI/60rfEeL6z0/d2rd0scyk+8VeWxiOLnRfW4MbKh8HIN5ABrQrGjCFt9fygQvsxE0FKMNhEUK/cw+T+KO8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uob+mUo4RQPKUEMMzJLdZYBDz93bmtEzL7yatG0NSY=;
 b=vqJy+OgxNdciWZJauBfz9UONu6yv7L3hBZFycGtT6JD6tniOwK6sL9LCMpMR760GWMqkp1k5Ut4OqBgWoZMbnNaSrXyAoQo6IV/XhhZ4JbOS/HWbI7yMgtIL3iGgMMxC0s04+Jipmt0Z6L/vAS4/7Crf0WKYoMRAGDtZYNz7b0eAEKVqC3X22k25AkMcNhEXHIxqceCgQ+mkGewac5RtgmQ9HQbmI6Xxa3Wr1CXLM9HF12DQjFYw9Ax3akPfK3HlahjJvUv7KQq60+CWv9w3Nc9BCH0bcSn6jCVINIL5D7whdG4+knzXFjKVyC6dpDJ73tXrLiVdJG3xTMAsnRyXmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uob+mUo4RQPKUEMMzJLdZYBDz93bmtEzL7yatG0NSY=;
 b=sjqUP9BJLdT61viSrU/4eTAhYijD69TzdGddQUtKAIHluMg6bBa9Bj7EkyRvv8xvyljbIAGJm6ibiHI5eqYQwYM0jD93pZQNllzwFR8DuLKHBv1EExH+MeGPh+mPRrZCM65tmrPFOHKTCyPzvFQw/qyEDa/FzwOUBDkQ92cpDEVnk2y8iJKKa6jFkBRWkNj27MOGQTKU3XXgjtTaxfwpAf/lXUDuGQ+FDKndVKXk9g75Q0d4UnuDlwbXThve8nc8duEn5uNEcrV0nRkJN7tQAViKga8AJu3ueJoIbZQ4wRrLi+XGPj1C4oavr9hmk8yfp9KX1WLa+CtV+g/esXZTyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by MN0PR12MB6222.namprd12.prod.outlook.com (2603:10b6:208:3c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 21:14:08 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 21:14:08 +0000
Date: Thu, 22 May 2025 16:14:05 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: acpi: Make driver's match data const static
Message-ID: <aC-TncPaN3n-Esc_@ddadap-lakeline.nvidia.com>
References: <20250522205252.4056-1-tiwai@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522205252.4056-1-tiwai@suse.de>
X-ClientProxiedBy: SJ0PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::35) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|MN0PR12MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: 4401d3cd-9c61-4b42-d255-08dd99759703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zQf8Fwk3D0uUKSPy+141aMXU90RXefKfD04Mtday20lV1IpCMiSQGMjAcWbt?=
 =?us-ascii?Q?4uJkx9K+j2mlNe6Ds9inYeLa/+m45bybAUnt+Z186RKvlTsE+RoWpVjQCcnT?=
 =?us-ascii?Q?/9iKPJpxAaGWEovjcd1Mbxd67fUyBeJKETYEHH9a8uSNAauJZxsCVff2o8L3?=
 =?us-ascii?Q?qDRHhah4ZA5/TbbqUFSRNpyLnOWtKor0hSJjBQjq0t2gZ4Ww3m+lDXIgWucs?=
 =?us-ascii?Q?FwHqiaAbu0dxnMvbehDc0FnRd+mMiE0xdUal6WOrqlajwSDwEzYyUB8lVP3M?=
 =?us-ascii?Q?fbqp2t/BFrV686WEAGQNibGIBt+4ZG1GuT6T4a5tX6gHh+YWmTGaFcWYv2T8?=
 =?us-ascii?Q?BVJ8Oz6MJBsSpdHGXzAVq3ZDys2MNSZuD7bEzzipuQ6TuYyQxqg2ekVq+YVZ?=
 =?us-ascii?Q?yEbEr6JW7y+vCTIFKhZWK12YYjMLXLxqlZ7PlqLT1BbKmg/Croxucu2Yb3kO?=
 =?us-ascii?Q?BuYaIVzmoBjxO/3eihHlJvAx0X5lwL+zJI1LhVwAHXmj2G4dcpdZ1P9nMY6X?=
 =?us-ascii?Q?Zn/njZLnL6c6vbN/1I9Aq9XP1anzAVHEXO05ksIeJsFcTXSr1BXsmISDDIcH?=
 =?us-ascii?Q?CcfeDaUUqLVnjnoYJcMm8ycS9vK16DSLtjAzJOvuc4epK5lq7COjnF9x2xMf?=
 =?us-ascii?Q?e99zUnLkJeM0KtoGAGusb7d4d0rDY7ffO8Wqsg9Y8yBzvLnvn6LrOQhhDP3+?=
 =?us-ascii?Q?wdf6OuUROWJto48pjag/O3wG1B0MhE4khKNxefmEgWfjTsz9c85lMd0f/QDw?=
 =?us-ascii?Q?di790uYoY4uPlCYa2slm3eibav0NdIQ3NZXVdYNKsxKm21MoqBHoe0KfdsJF?=
 =?us-ascii?Q?OVJ0tL35O9y5lryvFuODQ9JmThyhIncjZWz1yCYe/anrBsN+CXZe9vtf/g/K?=
 =?us-ascii?Q?9agRW6z6V/Jt4L9YtIgGB/iaNfT88SHfzvG0MiQ1ukTsdA734670Zlb2GDSg?=
 =?us-ascii?Q?Xwady6PCb9yfCnO+LDZuIx3NsEs7q2exyZFV8jH1QxEbtsNX+Pc5+sihVfHV?=
 =?us-ascii?Q?JDai6mB91jUw3YPudKH/DZMuW63MbiE74xV9FCM+m48UeDM2bJBDEZBDJRx6?=
 =?us-ascii?Q?MEO+/H4c9wTf1273NxSiyn2eBXj00wWBCRLAWq8nH7gvgw/DP77M70uNJNqM?=
 =?us-ascii?Q?cXJSTPopCMEQnK+9UktyX/ynElxKeVdga+xlAzyYBgcmA+FdCzYk7vXT7bb/?=
 =?us-ascii?Q?gAuilJLmU3PeZiOwnx0Oub+E3Jho1DiZ1NTgoaVkH8vo+9JIe+AAN1L+Cudb?=
 =?us-ascii?Q?GEhFJqql0Zd3cvWufPSqLsaMLthUKfnApzqCNjZ/YI2wpJ7FntkI0vnkvh/8?=
 =?us-ascii?Q?reKiiOvVDJ4DVIYpzzQqIIcNl133aBZlFAfYnI4hzZwmDKNcaaStJEy1yG2a?=
 =?us-ascii?Q?/5En19YlHRf60renkIfKYEiDYjvjiCBM+GuISCaoQeeHCmwdKv6DNv0/dhE/?=
 =?us-ascii?Q?UjnFPCxc2LY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BZ0+pPo+nZIm72UjzT6KKaW7jcKKo1PZBFqoVOlCCOp+p3akmyaQaClPMYF7?=
 =?us-ascii?Q?Emo3NjQhuEGKGerEbLqttcC3whjF5O1qiGvhOrLYeLAAvC7Sa4aiSZcj42fD?=
 =?us-ascii?Q?bS8F61tQl0ahcGkKLT0mrWEndEMvVAnsPFhmwyNuvcw0SEHwA2TXMu1DHM3+?=
 =?us-ascii?Q?0NFrTAcUqSVsLrY0VnfoDYud9qAjgtriOuJxDTS+Okdmt84x1mHTDlj5MQxc?=
 =?us-ascii?Q?Ut0skeIut381QA6oB1/PHaR9sDCkSwxziauDRP0e2cqBe+f9hhFZUr+HyU0A?=
 =?us-ascii?Q?xPMWSyy16dWwQeLr8/LWm19bvmyflkLwHESdIBE2tdui/xONNbxfcTo2dU7O?=
 =?us-ascii?Q?n9oQF3OWuVojT+/3xWsFkRoneEZAmAvfVNDGdjeYVTDYvNGVgVYgvQlMHuAC?=
 =?us-ascii?Q?/vkwifw7bpJm5U6lPb3mZmkmpvRnPEsrYADB4SemMVvmnFLCqp0w2h8hJjtb?=
 =?us-ascii?Q?rYi6Yc7nongPSUsZufdBjWy6O6+I0dSst32oDDyr42mm6GuWjnkv5vVfVDKV?=
 =?us-ascii?Q?ozVDXQu+uDanHNdkCKzt5J9xFF+jOBLoapJwb3IGqIAzl0Whcy5Av/0vR1Zr?=
 =?us-ascii?Q?F47/3XKsFsqeJBHdkgPxbVgka6IJCNoq9on7NV+uoqbyGdNABIOY/9d7C1Cr?=
 =?us-ascii?Q?l1jGpru3IbaMjI5DibXQyof2AJaDJtBbc1OHOKBujpIXmqgJhnR3Lzuu9wLh?=
 =?us-ascii?Q?zeNE5XsiyDvd227ZsJeHUKFuYwUCyVwvXTRRdRD02syIr+2vOiTAW0cpPaku?=
 =?us-ascii?Q?T4kEPkYt7QGanGcNhC7F8Q62CtRiyYe7jK9g11aYFJs8WruKA/TUZaNZ1nXr?=
 =?us-ascii?Q?ce0XadT5CHr3ATVmUck63gD1wMjAov8ho9w4SK0R8VvNvMJzHn1IwSl1IjP5?=
 =?us-ascii?Q?LzHkSTyWYNvykO58SC1FTOjHFWH+zF2bDwTTX4zVr5s6PuLLoPFPO9+UfxU6?=
 =?us-ascii?Q?zM3BxU0o6LTsaskO5LYDnWw/lztyihkyyY8syThB6jEOiziARpRJI3mepdux?=
 =?us-ascii?Q?YS5aOTFA7aKxnk5e4vN7DC7sAdgRE+HinP6XMv9DLfhY1dzcvwBFWa2Gd6mW?=
 =?us-ascii?Q?8PmnJ66p5JpP+smXk84MgXPfxHDLs9iJ8atTHWkiwK5IcYzTKHVrbc4dmGZa?=
 =?us-ascii?Q?++VbpiRq5Ca8FtPv+AyUPq/HK58v+zA8dUkJUgy4JGZY/ffYBSvG1viz20kP?=
 =?us-ascii?Q?l9c21e0E1IbEuXTlcabzK9akYRhgIt7sq+DMgoGmTu2xORFuur0USHVasfcv?=
 =?us-ascii?Q?JQD1V+7tHO55lQrfUz2nnIkwZHzNJqd3fbIus5StAfrTvS8ajKrTGgHFKCjs?=
 =?us-ascii?Q?e3MrjaMITliOx/3oJ0FDrZ+BM66SPEAsSjDMp990nZ2HXaqLXCSEju3+qYR/?=
 =?us-ascii?Q?PhNPcMlPHuZfrP/Q7WqVX8Vsj4awG+Y5FP4tlLQnnikpOnP60L+XB9jr4Q5y?=
 =?us-ascii?Q?NGaB5xpJkmXRghZrA5dPHO9DxSZ+dj2hgXvEYU/RGQ9mx9mevRBvTdKUCidK?=
 =?us-ascii?Q?V6vSubqcmJ4Go9T/4XUnSD9gQQCpbTtRB0wPrBxS3BkdONzHFWOY0GKYABY2?=
 =?us-ascii?Q?AnMZIW1p7xi1BuZEH+/vvacKfd/JFf1PNMxmoEg9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4401d3cd-9c61-4b42-d255-08dd99759703
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 21:14:08.1320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IodjtdxamUONugypIGI6vVI/ioyi9ubOSfd5VqmtCmgEkD/pojYMInQJn5HF0IVY06JBffgGqspO6Po5vbNUnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6222

Reviewed-by: Daniel Dadap <ddadap@nvidia.com>

On Thu, May 22, 2025 at 10:52:51PM +0200, Takashi Iwai wrote:
> The driver's match data, nvidia_hda_data, is referred only locally,
> and should be static.  Also, as it's a read-only data, it can be
> gracefully const, too.
> 
> Fixes: 4b214c9bbe26 ("ALSA: hda - Add new driver for HDA controllers listed via ACPI")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505230426.k8ruTgnr-lkp@intel.com/
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/pci/hda/hda_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/hda_acpi.c b/sound/pci/hda/hda_acpi.c
> index 513f8fde198b..505cc97e0ee9 100644
> --- a/sound/pci/hda/hda_acpi.c
> +++ b/sound/pci/hda/hda_acpi.c
> @@ -296,7 +296,7 @@ static const struct dev_pm_ops hda_acpi_pm = {
>  	SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)
>  };
>  
> -struct hda_data nvidia_hda_data = {
> +static const struct hda_data nvidia_hda_data = {
>  	.short_name = "NVIDIA",
>  	.long_name = "NVIDIA HDA Controller",
>  	.flags = AZX_DCAPS_CORBRP_SELF_CLEAR,
> -- 
> 2.49.0
> 
