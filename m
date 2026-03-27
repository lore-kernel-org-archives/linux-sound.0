Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012022.outbound.protection.outlook.com [40.93.195.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E26349AFF;
	Fri, 27 Mar 2026 16:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774628146; cv=fail; b=eVqHvL0sF+HM7BNI3YRMZ6Pa5NWWkZ15RnL48MBYrX6oZ4nWD/Srno86i9VsMUGkC+SCPctGuefJJqJMem3VSIoeGuXziGaECtdARcz3uy1sZB3LgZR904bNk/o8Sade0hs6eBEyAHolUu5Nf/65R1eto5ftLme7KGA4deJeBzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774628146; c=relaxed/simple;
	bh=aRXznpAsdqu3mvnAq4VLyGNK0AZt8Pw+2YBWHGs0bDw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OXn3UMEMb73LwVdDHb53YkkwlWXQrZcOEOT2RfvWoQYSgNC9nedWCMA7M0BeWU1NEs+xNm47fsZfkFbiIJF88g0VFEM7AOHsuQT+fYH2EjOOLOZHbHJ95z4kgsKaHXsCg/5e/dGVnHoJwmq64J/5ZvKM0gGBUCmRi4OoFbwf/M4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=43plDIlc; arc=fail smtp.client-ip=40.93.195.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="43plDIlc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAqhyhMsbsGbOJD+l8bZv6j21H1t2DyVlQA3oE9e5/mU2RzkSgaimfBEcNByN1UeKwniRS7wc50qp6Qfrg9ALs9nsfFRu91TRGSHIf6+nUFuM6/MbfRS7l7RMMQ7XjIvlJv7SMhyKGzAxHSiXy29f9eHoFg6dAJ+Xhy2KVIUSJL+PbeenJ1yGIgpSi3IMR6UNx+kRJjcyJWd3UVLCYY+JghGrt2HDRa4n/4WCvz2fDQMu3HX+F9lub1KzqpoGFqP6zv4nGxfR1gnrMS0b9NXWMFecvNGIfwCMTFMSB99neCbaBouzR0GYvaSlrCSfV3FXUhpSbIvntPxcIpTXu84Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apZBsY+/6GBt9BXPvPlY4iJ6O1187qp9gPByJwNQyrw=;
 b=nv+9nhBGmFfRj4BI3xJG5SD8qGn+J8tIIOPDEUIDPbpZrG2M996uM7yyNJTtmnbNrUi4yY4rWAN+bsLOFcTVELb2Njf2Ac6+19i4hyq475NQQZbkI5P9wQ28f78sVeXqkhCHBZaJ4aIHy3XIB0CACv9yKwaiTCwvfNigBDD4QQqPky2NJMsicrKIAWmSWkUAF1W+OfOBty2iu7daXNGd1UDr8dui2BghlQYOdFEIWgUgP2kalXGnSXlpAvLMHS64r0p5J1rbyBE4bmNe8II3kG+DZR0M3ztjGwIRMiLx9Q8/OvQxl2QBtELc5FWwsHt61Bs35CLanshAzwASWHFBRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apZBsY+/6GBt9BXPvPlY4iJ6O1187qp9gPByJwNQyrw=;
 b=43plDIlcCKh6k++cMJ9Qgohb5g7djH3pWvWJpJ2P5iiQMklhY9eBG3rk+DesZBZ1+5Xv3UAJD0/58PqUoxRXJx+Biq5qgomSje9DSi+ZwTZzv5g0XMs7sMhOfewiZ5bZDjgIp508s1N6UsfKlZVepNWMlO6IjxazuWxvliVCh4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by PH0PR12MB5645.namprd12.prod.outlook.com (2603:10b6:510:140::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 16:15:41 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9769.009; Fri, 27 Mar 2026
 16:15:39 +0000
Message-ID: <05e1cb0a-18f0-412f-87c6-99319b18af52@amd.com>
Date: Fri, 27 Mar 2026 11:15:38 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/intel: Add MSI X870E Tomahawk to denylist by
 DMI ID
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
 linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>
References: <20260327155737.21818-2-stuart.a.hayhurst@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260327155737.21818-2-stuart.a.hayhurst@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::7) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|PH0PR12MB5645:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4e16c0-8b9d-4646-e4ed-08de8c1c1633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7M0Sq5I59VAPD+vVtDlOBd613CrJCgT2bvH7/EiEpoT+Y7GohUXd4e25Ii0ZGOy9B0hPslvd659IXT+P7KaC7veGU+nPCiDyAjGXFi+A+zUvzzMNpxPdw/4MAk4mUFXTd12CdHvV0IPstycfwug27tzU+j6MFkkrgYgh85ryFs1zeFR5Rc9oDwzITPkWvZ0xylWWe6l0pdYqQg0BlUG+gJmFAiezRs2MaBK4VngBGLKUk+Z+gdhdddobUZFjE4kJofXvohJiVwYdM524A82RKy95j/WzkSU/Pyyr5KC9XSBwyDWTDMZaXrqztiDY6KM4IAu4TdfAExH20jjO2hy/dyL8P6S9hRtBhfCHsOzF4LVODvnRHRiZX3szoZnWOX99hknSHbTESNVthi5XwsFE56zb2m7sOop+xml8EjoFvwLTPS+dnZrR2akK5mYXR83fg9dOqwBRqKUeVbAxtahfHMCx75WI3xmCI2INUgOMBpWnen7EnQDzB8WO8JrRy2fIgaQX2x0B5KurakKD3qu642eJB8K1ABAOQU/hWJIvXp0BTzVVPczq+dxrH965+cO0kdMu+187Sesw1XbB5fq25UKhCnOZxm7F8uSpX8VkAtmmom97IMy6hyAagzNR9xve030VM3VvFWd1W5KdHTvGl9xbG4YJkbV1NPzIcILI8IfiAT9SgYo5W6+AwUqZealwSRgF8F7VhLZ2N7V1z/2e9D3KaDB6x4gxPdW1rc8w7Nc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFpGZWUyQVFIdWxpNVpORzhBNE4zeHlUd0pWcDdtbVlsMWo3UitnQlZyWXNM?=
 =?utf-8?B?MzJjOUtEUDVmazRRK01RYzRRUURRWi9SLzlpeFlwUGYzK0ZLS1RQams4MHVr?=
 =?utf-8?B?L1JpSGYwNkJvUW94eDByb0s1elRSbCtlMHdJZTZzYmdrM1Z1K25vQm4xemFH?=
 =?utf-8?B?ckF2VCtJTDlzOTBCb2hIV2kxV1EwUXBrUWRKNms2dFl4R2loVlEvNS9FRFRZ?=
 =?utf-8?B?M2czcy9QZmIvU2pCdVVERlJtZWdZMHJydGtoSkNrYlZLWjY2NHEyeFQySHlh?=
 =?utf-8?B?VjNnbVZnZGY0a1lOMCtINVUrR0ZoK055T0l5V3JTSkpWYkZXRENkaXdxaENo?=
 =?utf-8?B?bHpSNzBMeWZQRU4wK21kQVdLZUk4eHZHS2RDOGY0T054dHN6YVdNWTZsbFMx?=
 =?utf-8?B?dG1GQ1FpYVlvaU9RbWZNUWFiNE5UcEwrbzZUa3VOYzhyMm9iNkRJQW9JVE5K?=
 =?utf-8?B?U2gzNm9EYzA4ZGRKRndNZzBsU3hjeFd4ZHUwUTRKTEI1RUxQZTRkVVZHV1Zh?=
 =?utf-8?B?ajdjUjFFejlRWGtlenpRLzJselhORVlRc3hqcEVOQmtLYmRGNkNqN2p5MENx?=
 =?utf-8?B?aE4yN1dMUjlBSURMQnlRanZDejA4cjZpazlKNjFpU0g5MVdHZjRDU0laclpI?=
 =?utf-8?B?WERRc1pvOVcvQTBsM01Pd2JUQWQxWGtqVkVEWENWWlMvR3RJWVJTMWZOSzdO?=
 =?utf-8?B?UmR5K3c1Qi9LYXhYZWl2eGhCYSsvL3Q1S0l2M081bW12UGRLUTZITzJYWWRL?=
 =?utf-8?B?US9TYU9pQzE0N2ZKazN2YlV3dnc0aUltaTllcm1MMm50VjROYmkyS0Y3ZVNR?=
 =?utf-8?B?eTNXZG9KbERuNncxYnFSSStWNnZUNXN1Zkp2L00zaUZVbjJTVDFDV1Z2Z1RW?=
 =?utf-8?B?NjBtckV2QWZyQUlhMjJOZFdLVm0rQ0xhb1ZSZVU0RWkwWFVYYmNKcXdtaGtV?=
 =?utf-8?B?L0J0VlFHTmRJQi9BTm1LTW5ZbzFVRDE1UWVybER5eHgzZGR4bTNneVpDV201?=
 =?utf-8?B?Kzh2UEpzRUtUdTJ2Y1FSUzVtMHZ3M294ZVI4UHdLaG1mU0tmSkxEWVlzUnh1?=
 =?utf-8?B?QzJYa04xWDd1aDlNdTEySE5nZlFjbnc1QnVHZ2N0ODE0d3hnaGRWTWVxcjZQ?=
 =?utf-8?B?Q0FpZC9OTEcxeTNLd2c3OUZBV3BzanBFRFdMbjZXeWVTRjVvMTVmN1dTTk40?=
 =?utf-8?B?SE96dFB2SXFQVGxsSTZkZ2wwNWNJd21leXZqKzkzSVVhSHU4T0pLK0QzdDJp?=
 =?utf-8?B?TmNFMXB2QTM0RjlsQWRxQzJLdU1nc2ZzMW9tc1YyenRCSGVhRm9KMy81VlV4?=
 =?utf-8?B?M1hmR21QOXllcWVDT3hLek1yZ0xtNE1FSlNicjhjWFc2eHRQUWFBenR0cGJI?=
 =?utf-8?B?UW5wdzY3dDkxUU5oOStOMm90TVZET2dEOWxPREo0endnMkdFbXh2VVJlaTVH?=
 =?utf-8?B?QXVsdFVNU3d6bnNkRXFOaXdUei83NFo4bTI4dk0xN2E4MmJGOXpmUTRkUHFq?=
 =?utf-8?B?OFNLM1dKekQ5V056bXNPMHpwT1I5b25HYlAxTmM4NGtIUC9lUmtLTFlCTnZC?=
 =?utf-8?B?WFNBaklwUjF1VVdoZ211Ykcxei8yT3duM1ZkRkVkanZ2WFE2WXNmc25UZkdK?=
 =?utf-8?B?ZDdCdzZCekJrTXZueG0xMXpCN3JVdEs5cXJLUUh6TE5VYndXZVdYTHB0NXVo?=
 =?utf-8?B?cHdaUnZ0YU5sWjNtaGZWeU44NHA4K1pkaFgxeXhhU0U2bTBmVjlCMVc0c1Bx?=
 =?utf-8?B?cXdqZVErSHd2UnNkOWJ3NGpIRmJiZkE2WjVQSWZPL3pudXBaODd1cTFUSGpr?=
 =?utf-8?B?N0hOKzhWY28zbU5vMllVUVJCckhzMjM2a041VDVhdDkrYUF0dE1GbkYrendJ?=
 =?utf-8?B?Q3ZWVXJSZ2FoWVRsTDFGQjNsWFMyQTM5YkdFUkZ1dnNoTEl0Q2JSd1lGWHlK?=
 =?utf-8?B?RDZEejZ6TVZNcXRLTVlXWlIvL2toL0VDNnBhdXVEN2xubEJpU2xlVThCY3Yy?=
 =?utf-8?B?eUhiS3djOFY3cERML1pPS050V0xzUFhDd1JxTHFIZ2U3UE1zVjBIN0d1WFg1?=
 =?utf-8?B?eGNlc3NuOWRKS0lxZDRwNU1yMngrOVBIMTNFQU5XMHdJeXd0Vm0yc3gxbWcz?=
 =?utf-8?B?ZGR5emUzWklqcnNoWU9HNUhpMlI4NzZzTzQ5SmVuU2RSZk5uTlBXTkRIMFZ6?=
 =?utf-8?B?YkM0WkNjZnhtMlJNNTk0b1BjQ3pXdVRaOVNKVnhYOXcrZGFIcUFHL2FGb2x5?=
 =?utf-8?B?anVUT25mbkN5c3BJbVMzM0tmRERjbk5ENlpnMDVXT1cyZDZKQnJQa1owRkQy?=
 =?utf-8?Q?xFTSTBOuzPF5UOl/Y7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4e16c0-8b9d-4646-e4ed-08de8c1c1633
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 16:15:39.4085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGpitiyroEdhcsyabv4egqI9qOPVFYGlwiW3/8xddKFrRASDBUMs1UjNKD+1OJa/8OZMHdnP35jxEV/Sfb7QbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5645



On 3/27/26 10:57, Stuart Hayhurst wrote:
> This motherboard uses USB audio instead, causing this driver to complain
> about "no codecs found!".
> Add it to the denylist to silence the warning.
> 
> The first attempt only matched on the PCI device, but this caused issues
> for some laptops, so DMI match against the board as well.
> 
> Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>

Thanks!

Takashi,

Probably worth asking - why is the "no codecs found" ERR in the first 
place?  There are obviously designs out there like this, should the ERR 
message be simmered down?

> ---
>   sound/hda/controllers/intel.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
> index 2edbcab597c8..8a7bd49e411f 100644
> --- a/sound/hda/controllers/intel.c
> +++ b/sound/hda/controllers/intel.c
> @@ -2085,6 +2085,11 @@ static struct pci_device_id driver_denylist_ideapad_z570[] = {
>   	{}
>   };
>   
> +static struct pci_device_id driver_denylist_msi_x870e[] = {
> +	{ PCI_DEVICE_SUB(0x1022, 0x15e3, 0x1462, 0xee59) }, /* MSI X870E Tomahawk WiFi */
> +	{}
> +};
> +
>   /* DMI-based denylist, to be used when:
>    *  - PCI subsystem IDs are zero, impossible to distinguish from valid sound cards.
>    *  - Different modifications of the same laptop use different GPU models.
> @@ -2098,6 +2103,14 @@ static const struct dmi_system_id driver_denylist_dmi[] = {
>   		},
>   		.driver_data = &driver_denylist_ideapad_z570,
>   	},
> +	{
> +		/* PCI device matching alone incorrectly matches some laptops */
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
> +			DMI_MATCH(DMI_BOARD_NAME, "MAG X870E TOMAHAWK WIFI (MS-7E59)"),
> +		},
> +		.driver_data = &driver_denylist_msi_x870e,
> +	},
>   	{}
>   };
>   

