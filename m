Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012046.outbound.protection.outlook.com [40.107.200.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B214032AAB5;
	Mon, 18 May 2026 02:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779070828; cv=fail; b=b49SQGGC5GkHE/5kVn+gR8aIlAN26o9XY7EQXM3mWMXK0G1pgubAOQYObP82w1De4IL94OIyPmYtxujhPNT4RDiRVI86WHncQUK8q+YUad/1tiEbYDS+90L3+2YbFYIodiFU3YbfmDN0r/WEPT34dYR3sv7zfIGitmI6nh/ivZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779070828; c=relaxed/simple;
	bh=RInY3VFDpzB/E3zEkuXKvqKNxpaMSe+uoisM2GP45pA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bJnSb025IrI4z7b/eSKMdH/dxZmB3g2CbkgFgxef7aKYK1ziiJOKKJEGoepIrtR0Whc/zdP70oUqVecKgyJKJnCdFjBZGomtX3cGCtRo7j8EARNGJC7U/aWUkHHbv++VTz9eEKXUQrVmkX5gs8bOdXp9RlwAeO/2URRTDdQJIes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pBywWkEb; arc=fail smtp.client-ip=40.107.200.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pBywWkEb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hy8NTBo41+r7QBkDgpjpgIHOGs50UgPOgvmXUtWLR6wMytORkp0ecMgzXwSdTMXjIyASWXEz8o7jVjiKjfMlvJ6+ISjJA6mS8PILzzgTdlaCVKJigrRwRU83wWUn5K8j+fAkRrnTcQ1sSjeyzltiAikOThmyYE7BW7B9oLR+Dhar3uW7nDzlu7cO7cdMmd4O0PfiT6Wk5/Sal20vyKVV80xZjcSP95f2RVuuvEvMayo7QoHMbiZQJMcCsiDxmHsbVl5Iu6nYm4ifnRyfUeaseOEuPWyw44ZUV2jKVbOH/x3lEAEJ5syxVM4G5uaLqQ6nd+f5LnoEfEA5CV5JXP7zcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0JeCUJBqZp641ldMWNkLRGWf1fCqF4j1/RpjBQNm0A=;
 b=gwpp5Uvt2sI2Gp2APYm5wDA7qQ3I+CCslM2ATQ06vNJ4szl2tIarNrSFnnVjhCMc8PMJdHF7Qe+kySbFvOnz29TLcB7hiMiGiXfoSRw04xLqU7ChKsWTnIrso171wyCNc1lg6Qn3IpxT9WBRXplLDM6A49g0ytFPjGFv1U74aTGbnE+CYbu/kTV1tGewi9AJgPMkifHRQWW8CFDqAGJy5FjpWtkAFyhmFj6GqQMVZXdIQJm9AbBM1+x24auO+6w1fFasRTDHGH4xw4cxZnFvSZlhe4tvSSsnlM8GSF545KWkBB8lcbMUsRjdzDrOsKleCDvGsB0jfdzDB9uQ7u3Qjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0JeCUJBqZp641ldMWNkLRGWf1fCqF4j1/RpjBQNm0A=;
 b=pBywWkEbSYk79D1ukJfvA/fd6BbxUPLvddgUdlT5sFAMMxd4CkIvi8FcHKpDAv+lJWVIm2tyrsG7Wcg2/0mIpqGwZkVizQrgbP1CYHPP1R5CXwun6QKJTDZEvq2g8j8chpAT15XDRIX7jr47yYt4Rc4vgrccpZhauTErVt4KllY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 SJ5PPF1C7838BF6.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Mon, 18 May
 2026 02:20:19 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 02:20:19 +0000
Message-ID: <83b5f7b7-a138-462b-b482-d018d9808a99@amd.com>
Date: Mon, 18 May 2026 07:50:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: amd: ps: Add support for MSI Crosshair A16 HX
Content-Language: en-US
To: Sidharth Sharma <wednisegit@gmail.com>, venkataprasad.potturu@amd.com,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260517203955.42490-1-wednisegit@gmail.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260517203955.42490-1-wednisegit@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::27) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|SJ5PPF1C7838BF6:EE_
X-MS-Office365-Filtering-Correlation-Id: c498e01a-9489-434f-fba6-08deb4840199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	LpvevI/EVCWSjTVMpn6CA3NLkfMYqH6buSmSde60HgOEIhlg7wm56R11X4pMyh4HCrMP9Ep+TYc5YfSOiMkz36gKGDjy3z74CalK79eVWNbCpJ4mve8gwfjeiLG+jJgS+VxqE+qgBZ1ihV1+/SC9y687eS9HyYsFEw86r6Gi8FC71wWGbFH7EyxLVT0eSJXCAsxbaImc+tTSbi19Q0ApglSQA9Kj1ld0iyQnKdjFj7y6fEG9JHr6eIt0fgvHwkVcVPALdJuTAXIaTtood1a5wKB3UDyxYjfYTgNWBLRPsBYNk41Wvl6hifypP1SshPtXSQHCWFjoZFIcvJg/VXI3dgFUy8kX8VTvT0OpVEHn6Ny0zeF91BSv+Qi5o7lVOIlerFje6uN/L0Fh6k70S3Rq/ieAMgekYB0ImcLNIzB63JH24jNRdikdDmOVjTtHIvd270PtLB+1wY2kKIjw6rapawSRhRP5zSH+lljN2shCuds0d7m2Jj276Q2EFLifwOwzahXMm3saQyQtGfXk++dff6Umjar/G6XBaKGIJaVl4m46NOlqK41X+EJtBz0zSA2hCnTxFuwzwN/Q+2a3FVIkBuDHA+Vdzi14SXapkcu8lk4j5DXOMHCa35uxel12BLdsnAzZo2XY67emCcJgDdI6Ldzn6MV5/3C9CPEoWquDU89+KsDWwfJU+IylfrIVQSRF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVk5OTloV2pDUEc5V1pQZ29yZm1tS0NEYVduVzZLTjZHMGEzdG84U3dwbmta?=
 =?utf-8?B?a2xLSVpCUUxLRnpZREs3MVNtVGcvNlA0MURKVk9tSThjUXZyNVlQU2owMDhi?=
 =?utf-8?B?SGhtTTg4NmgvbHErajNwR0o5U0cyWE1nUEVpdzdZMU9wZmhia3FWNUVsT2N2?=
 =?utf-8?B?dTVJMXRHb1ZWVElxWlJHQmxZS1dVQ2ZNMGVNTzBCN0FaNHc1RHRDNklTYzZr?=
 =?utf-8?B?UU5OWUZSQVB6WHFwQTZ6NHZvaTlYeEJDcFpHQzRFR3EvYm53eTMyQUdnY3ZY?=
 =?utf-8?B?WFpxZm9seVBLTXc2a25JMEIvSFZGV2lrbXM3MzBqU2hvTnlVdWxxczYrcjZR?=
 =?utf-8?B?djZvQlNGUkhpR0lEMXVGb3JjejFlL09uY2UzL1dEY0w5S3BqcGtUenFTSGVw?=
 =?utf-8?B?ZDZyOUpIVnVWSkZLczYra0h4RU8yRGh3RFRTdERucEpXRWJKZFRjTStLS2Zw?=
 =?utf-8?B?RGZ6NlB3RHVTOEx1eTQ0UnBkVHNuZ3NrdnpVNjRORG1UN0IrZ1ZycE5RQ3lP?=
 =?utf-8?B?SG43RENZVjZiRHJ1S0ZoeFBTaTFCeDFTbzVJUTd5U2ZDSUdLNDVqcnlBTHky?=
 =?utf-8?B?NXhINXZ4eUJiaEEyZ0ZsbFZwWWZ0dTlhRllwQ2NNamFoVjcvUHJOSHhObDRr?=
 =?utf-8?B?QTZTVzRGVysvUUZES3JxWG1TRUNkc05kQm5ocHJyOGRNaUE0S3VHd2ROSGpU?=
 =?utf-8?B?L01wNkhuSnNReVplTUdrdFVmU0tqUXdrVWR4TUVNeFlFOHpYYVlsRFQ4SFV2?=
 =?utf-8?B?V0c4Y1VEZ0VaeTV2NDVmSEY1cHRvMExHNFFXR3VxVWxCZGZhUkk0RFdFNHZZ?=
 =?utf-8?B?T3kzYThkUE5sekVkK1JML0ZvYXdXSTl5RzU0empBZk15Rjl0OFNRbFp6d1ZR?=
 =?utf-8?B?T3lMRUViK0J6ajkwTFc1TDE4TUdTd2hTcEJyKy9rbW9sYWRyZ2ZYa3ltTmJG?=
 =?utf-8?B?VzRJRGtFYzI1a1ArQjlLMUFzbjFRMXJKak52TW8rYm5MVUxFR0RlR0QzeU5x?=
 =?utf-8?B?SGtXNEY4VUhHaEJjOGNwTC9GSmc3S0FuVjFBQ0ZlTzVMdkZ1ZnpLcFMyazNj?=
 =?utf-8?B?akRieUtPNDQzVkovYm42cWdEd3BuZEMxMXh1V3dnU29hU3RhMy9sNENUaGcw?=
 =?utf-8?B?dmFZdE91NEF1ZU8wSjloQTdzS21OYlNPbXpmV0NRQk16SWFUV1RQYmxzS20z?=
 =?utf-8?B?b3VqYmwrUk91endqaXg4V29aV3U5dFlsN1JSK2J0NzdvMWRFSUw5WkxOOGpG?=
 =?utf-8?B?cmhaMDh0VVgvdUpIeXZsekhLMXUxS3Vkb3FRMFVvS1ZHZUplV3BOcFhTa1Zx?=
 =?utf-8?B?bW00QzZlQjNKb2Z0K0F3U29QUFgzSFArS1ZVYTZaTmxtckdXcEUzYWUzemFn?=
 =?utf-8?B?K2libzljcUxRYUtjZzMzRFZTMzYxQ3MzeWV4WnM1UjQrbnJ2T1dUa2hOVTBV?=
 =?utf-8?B?cXBJaFlmeFk0K0ZUWWJsZ0gyYTgzbDlEN1NGcGhpcUNRRHJNbXQrQXBJREx3?=
 =?utf-8?B?bGdnL0p0Nmt3RFVCM0RnTUNUL3Y2a0xEVkVPZzRNR0I5UXJsaUZxNmdscXFJ?=
 =?utf-8?B?K0xJQ3NIYVBLRTBzWUsvbzhrVjd6SDY1OCtJdGNHYVRMcXdVZjliVkp4dEZl?=
 =?utf-8?B?Y211eWFueFZlY0drSXJnV1ZYTHJrOUZmMnpGUmxLOG9meWtMd0Q1NXRSb0FO?=
 =?utf-8?B?dHlYRUZYNUZvcXBBTHNpMFdkQjBtdkdxdXNZT3p4dXJ6NTh0N2FFUFBKUHBH?=
 =?utf-8?B?UWtpa3VTb3R4SzIweHdxckVnellhL1Q0a0NMWFloVHdHTUJVdFRReXN2ckxK?=
 =?utf-8?B?Q2RWand6ZWpFSzBRNVhBZ3FBajYrY2g1dzVrUFNEZHNtMHJKcDIwMG12Kzl4?=
 =?utf-8?B?ci83WWR0YVBpR3UzSlM5ZFNqMkJIbnVNUFA3QndRZmFYUTdvZXlONFVnK3Ay?=
 =?utf-8?B?bWNrZHFPbXNMTlQrd2VSU3hPZGhEdXc4VVZqV2E1ZitUVXo1cFZZSUdTMCtB?=
 =?utf-8?B?OURoemdsdytSN25oWnFDNTJITmJFWWs4dGw4bTdCNXl4RjZRRE1maEJGOUVh?=
 =?utf-8?B?em1HSG9tQjZaZWxScjhRVTdjeWx3NC9uZlg1S2xZNnBEclc5S3FkTFVmKzZB?=
 =?utf-8?B?czY0TWwwUHk5WmxoUWRvRWY2MWZlNzBPOFRMOVhRZGptb3EyM1BLRkFZRUZw?=
 =?utf-8?B?d2lKUG5udEpObWFGdm1wNmxUSnY4VkVLd2pTSFhvRmVVc1dyYndvYWUvVVhG?=
 =?utf-8?B?QUpGZUpIWDZRRjlia3J6SjF6ZXVpbEVxbkRoMXR3RGcxTktEMXJUZFNBVXkw?=
 =?utf-8?B?V2lvRGVHMHloVy9WTTh4ZEVyVHI2OTI1Q2I2b1UxZEJjaHZzTDdZUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c498e01a-9489-434f-fba6-08deb4840199
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 02:20:19.0194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVmGVn9rjtrCHhEZcTT7aOUk8Kz4oHV1jMktkYl6Nf+/vjkds4ySi0z6iUgZAC4c9yj05W+gRJ2LDSWtooPaOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1C7838BF6

On 18/05/26 02:09, Sidharth Sharma wrote:
> [You don't often get email from wednisegit@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> The MSI Crosshair A16 HX (D8WFKG) uses a Ryzen 9 8940HX processor,
> which identifies with ACP PCI revision 0x62. This revision is currently
> unlisted in the Pink Sardine driver, causing the probe to return -ENODEV.
>
> Furthermore, the MSI BIOS lacks the necessary 'acp-audio-device-type'
> and '_WOV' ACPI entries required to automatically route the internal
> digital microphone array.
>
> Add the 0x62 revision to the PCI validation switch block, and introduce
> a DMI quirk table to manually force the PDM configuration flag for this
> specific board, allowing the acp63-dmic-capture node to map correctly.


For ACP platform with PCI revision id:0x62, required support is included
in YC base driver i.e sound/soc/amd/yc folder. i.e any new platform support
based on ACP6.2 should be included in YC folder.
This patch should be dropped.


>
> Signed-off-by: Sidharth Sharma <wednisegit@gmail.com>
> ---
> Changes in v2:
> - Moved ACP62_PCI_REV definition from pci-ps.c to acp63.h for consistency.
>
>  sound/soc/amd/ps/acp63.h  |  1 +
>  sound/soc/amd/ps/pci-ps.c | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
> index 62cb6bef1..4f955a817 100644
> --- a/sound/soc/amd/ps/acp63.h
> +++ b/sound/soc/amd/ps/acp63.h
> @@ -11,6 +11,7 @@
>  #define ACP_DEVICE_ID 0x15E2
>  #define ACP63_REG_START                0x1240000
>  #define ACP63_REG_END          0x125C000
> +#define ACP62_PCI_REV          0x62
>  #define ACP63_PCI_REV          0x63
>  #define ACP70_PCI_REV          0x70
>  #define ACP71_PCI_REV          0x71
> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> index 9751cf078..561921d4b 100644
> --- a/sound/soc/amd/ps/pci-ps.c
> +++ b/sound/soc/amd/ps/pci-ps.c
> @@ -17,10 +17,22 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/iopoll.h>
>  #include <linux/soundwire/sdw_amd.h>
> +#include <linux/dmi.h>
>  #include "../mach-config.h"
>
>  #include "acp63.h"
>
> +static const struct dmi_system_id acp63_dmic_quirk_table[] = {
> +       {
> +               .ident = "MSI Crosshair A16 HX",
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "Crosshair A16 HX D8WFKG"),
> +               }
> +       },
> +       {}
> +};
> +
>  static void handle_acp70_sdw_wake_event(struct acp63_dev_data *adata)
>  {
>         struct amd_sdw_manager *amd_manager;
> @@ -436,6 +448,12 @@ static int get_acp63_device_config(struct pci_dev *pci, struct acp63_dev_data *a
>         if (dmic_en && wov_en)
>                 is_dmic_dev = true;
>
> +       /* fallback for msi firmware lacking standard acpi audio routing flags */
> +       if (dmi_check_system(acp63_dmic_quirk_table)) {
> +               is_dmic_dev = true;
> +               acp_data->is_pdm_config = true;
> +       }
> +
>         if (acp_data->is_sdw_config) {
>                 ret = acp_scan_sdw_devices(&pci->dev, ACP63_SDW_ADDR);
>                 if (!ret && acp_data->info.link_mask)
> @@ -587,6 +605,7 @@ static int snd_acp63_probe(struct pci_dev *pci,
>
>         /* ACP PCI revision id check for ACP6.3, ACP7.0 & ACP7.1 platforms */
>         switch (pci->revision) {
> +       case ACP62_PCI_REV:
>         case ACP63_PCI_REV:
>         case ACP70_PCI_REV:
>         case ACP71_PCI_REV:
> --
> 2.53.0
>

