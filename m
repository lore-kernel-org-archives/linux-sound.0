Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011034.outbound.protection.outlook.com [40.107.208.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6482D248B;
	Mon,  9 Mar 2026 05:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773034412; cv=fail; b=Hrk60l9FvF0zrk/wal+brPTP/zyMUcUOLdTWg4JrRv2wvxbjSr5jUpV/QyW/dT/+Bgo3GMfn7+dejoMTHnKoyI7fk0kYcpH1mytp7PTQ2s21XrA8SUOhUoY8zkuBSUHsykCPMZKDoxKjPjl0jR7noM8RDoxNz3wdAqLiVND4Sbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773034412; c=relaxed/simple;
	bh=onfz2fCj3r/l8PeYh/W/DnycqfXT9X+XzmXK0kHtDBU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=srGZYhDUMy4srkFj15fGrU2X2NDyenlI1tnvsXRzFly1DV/7aSUMZDONG36HX/EhmGHBtnvo1Us11q582m+MJZiXWb7m4XkdhQO37Arm1/uj1l75UP+PKcU7fsjSEh7FBFQeBpCUGZEIHnap2f4tmcvj7PLd1V0bTMb4CFy87oI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=q9gdu7eh; arc=fail smtp.client-ip=40.107.208.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="q9gdu7eh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xgyKmM/0EkCCG+hriUQYhuGSMgQ0OzCiEzvBrme6PpraQHz6pOh486w2uHUacZZIJZUg3PafmB4A6So11xdnJ223ZOI5ScTl2U28aL81b+mGDQp/UGTxWfraz1dQby8gWBr5HQAKp1yy/rhcB6ZU5rz8ZuzD4XyymsAxbFybxQ1ImaVHUZiIhrWzKpXPiKsivw1DsnmxA/da76lzBnNRRL9SkAw9H0jEU1BvwReWt2TxwYlb5RyqvxyD4TS0cYCxClqlGkAaCjDpOWiWEppqp4zz+v9cVCFgwHx8WpSuZXIsI0HWkK9i1nRDmmHnnf1qBycFbNNCt0v6w4+Vr/sraw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pXcHovQQe7t7XXqbAFVVLggGvWs2Cog6MUUPmeqZg8=;
 b=pTIQepSrayr2UNu9DMNtnp1Y5u/CK6Mix+MjXBtEFvWbA58P1SS2eQ+eJINW7UMTZ7eDlnUk+8NiC2gFj2V4l485K2/Ed0nltVP4HtXOjwr3OgAsxBZmtk6UubjrCwM/5xmSg5kUfqfgbZXPZTD3CJ9giU094E+fwkJisHM0WGAray6BnjlNuu+gk0jAwa5vhmN0otMAgpnCKOrY/zNGRWvG0BWKF2f9GwbzDexIkLvo4F5fvFWUcsoUfRDhnJMwyij6OY4gZmWBJd+JxKwDepICB+xC60nY83gMEQttZisG3avLB05tK1GHDsRU6k4rOi/c9QJEgecCgeTtKMK+YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pXcHovQQe7t7XXqbAFVVLggGvWs2Cog6MUUPmeqZg8=;
 b=q9gdu7ehzx2g7JapilcxPhSjarMahE6rRHbRz76eW5VWjNY3Yn9LD5M9Gw83didRm2JIbc4VRVL9TU/v47ORyfdo/EnHBTcvG51OvtwAzSTofaBzncS4x2O5zap5mCiLHvmitWEmWmq08TVLEwUAYB2jarjhwp9h+5lHljX1USs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 MN0PR12MB6319.namprd12.prod.outlook.com (2603:10b6:208:3c0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Mon, 9 Mar
 2026 05:33:28 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 05:33:28 +0000
Message-ID: <55265fbb-490b-4af9-aee5-1af1960c2b51@amd.com>
Date: Mon, 9 Mar 2026 11:03:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: amd: acp: add DMI override for ACP70 flag
To: hasunpark@gmail.com, linux-sound@vger.kernel.org
Cc: venkataprasad.potturu@amd.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org,
 mario Limonciello <mario.limonciello@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 "Gong, Richard" <Richard.Gong@amd.com>
References: <20260308151654.29059-1-hasunpark@gmail.com>
 <20260308151654.29059-2-hasunpark@gmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260308151654.29059-2-hasunpark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0227.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::14) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|MN0PR12MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a63e68-16ba-40f6-d8b4-08de7d9d6461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	gzNPKKi1UWKG6vGJ3NV3CDxycrYQcwh8uZf5kys+oc6Qk3fLfNrQCaI616ngPkr0BIxaamSG54dWUSEMIQBTFQ2RUu/dziQxKY/U0TrqjHys058lGUBJ9o2dSdlOevVB0thQBS8YTjKetOen6uGCJJGpK38jfxu4aMYK6zYVpOYZvf0IfBHyn7OwgtVka4CtQ09WYxdY3Fvu92q5bmLD/wso2ivBVZlUrK16SrXXClLUqdWVrN+RmDFa0DepZoYMRVGYaElyYH8O72qAJ+zI1utF8B6lyWiqqSGF9AusUhUF/zNYnx16CwP6vDi4CZcBHDVPx3Ay7rPNGE7QWQICMZXRDNxVcxxYTEjkjd92y07YXqsXtxCLQGKk6eyj5pr9Ocf5ijlNNAlqNRpERjWbUeCh9iFQ2WUA88jbDWviBakjuZYDrhDVQYYzZx7uh9qch2MrxT6P7usRIdA8nRZN6pslBshfqsqMhQS78e5Xlxfi+lQc3ITG7wObCyH6puXNX3T4Zh1eM4DTQTYFV7nNsxbRZjMbv5uMEErXpvGWQr4yUwzTHiEm0pB9DOmcGks8j594Y2F6d+rx+jdeHDbEYpmDUswqdIl3aNTdl2H/auKYm9PCeLYwbv6emmqeBUnO3hHjagzuAqNAUrhMcg7m6H2Z9RsquHjdrMGkS0N+SARnII8eaoK7zHx0ELR76nVUeWjbyCjTTJobanbbf24Se2z/o+Gl6eSpY1MZkwHt7nk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0RrU0JVL3VoNGE3R3NYcStsYkpoeGQrYXN2blRibGNUaUNnRVArRDl3YU8v?=
 =?utf-8?B?eXV1VXNVUVBHZGx4WERLREsxZnp3eC8ra2xvZE5YTHJ2MHQ5TC85ci9FeFFi?=
 =?utf-8?B?NTE3V054U1pXbDRKWEhXMEV1QkljVGNQMUh1Wk01VnNGbG9ZTmhJeXpNaVdi?=
 =?utf-8?B?RmtjbkF5T1YvcW1uZ2FmU1NIdUxHLzk5TUllWU1LcmppTTgwN3V6N3BKN1Na?=
 =?utf-8?B?YVk3VDNqMDNnYVQ3WHBnV1M4dVF1U3NjSXAzSEduZ0hHWEU5NjNRREk1b2Rs?=
 =?utf-8?B?cWJ0UmJnZHc4YnBjZzNDNE15SnpEVmZuZzhKemp6emt4VlZBYllGL1FCaUFt?=
 =?utf-8?B?cy9NWkpKMFkzc2lkeXc0MUsyck9aeW9La1NRV0tTK2JXaDFDMUtEY0RGMkFz?=
 =?utf-8?B?dHVqR2U2T2dVT0xkNVl0a3NzZnJQZzFuamdSV3pFRkJmcE5SUUE1aEUvUzBH?=
 =?utf-8?B?YVJla1A0SUlBb0l2UndPbnZVL0tKbER3R3VPWVJyUW5zNlgxVG5wZGRwalJi?=
 =?utf-8?B?b2tkQkZnYzl0KzRnVFlmREVhd1VwTlVSSUZrV1kyUHdjcTZXaTFQZGtnTVJy?=
 =?utf-8?B?WDIvRGFPd01kYzFBNGl4MXNLcEY5aXIxSGVwSXU3VTFtMTRuRmExOC9XcUVT?=
 =?utf-8?B?Wll1QytuY1RnbGpIenc2dXRNM2pBMmwrRW02TkJZNU95K3ZLbFU5b3FCOW94?=
 =?utf-8?B?bkpIQmpvYmIyYnlQeUFPWVpFUU4rQnF2WXJXSW5ka3BrUXdWUU1CWGxtRmJZ?=
 =?utf-8?B?elQ3VWorSlVFWDUxelNHY09ZdVZEQ3NVQ25MK3dMRDI5RlpoUjR5bFlnMW82?=
 =?utf-8?B?SGgwVjJTYklzNWdmU2g0ZFliZ3FibjlBRnlOc3lqWk5lSFZSSEVPVUUrYWx0?=
 =?utf-8?B?ZjBFNVQzRXEvdE83Y0xjNklWTUZ6ZnBNbFNTSzVJallYSWlDSjNrU1lhampU?=
 =?utf-8?B?NU90WXFvV1RiN3dMR3NIOGE5MFdZdXVub2R0Nis5ekw0MWp5VWhGRDI2emdI?=
 =?utf-8?B?d0ljVzdIYmVCUDQ2WS9MQVVabnZsSEIrdlFySE93RkhQOURhRlZhbTJsb1JM?=
 =?utf-8?B?QXJhNGVCalo0blF6aFprRUtGa0V0YzBNR2lYaTg3MjVnRm1QcmZQWlYzZ2du?=
 =?utf-8?B?bnRtYkpMam1laHRhaGgyTGVqNWcyZW5hR056UVpTZnUvYjVSejVIYmJONncv?=
 =?utf-8?B?b2Ivbm1VcG94cTZvVUpsZ1Y5NDFxaFJ4anEzSDkzREJJcXVrcGhDRTVDL3p5?=
 =?utf-8?B?NTVTeUJPa0I4VnF5VkhxeEhFdlV0dlJ1SEJITFljUXVUSHg4UnlNblFUMTZo?=
 =?utf-8?B?S2NYZ2NhYUZPdDU4SjYwTTJORythakdIWkEzQyt2UW5oMlNqSWhpUVdnVFRY?=
 =?utf-8?B?aXNWOXkrekRlUW14YktlaWRkT0lIZzRWeGI1SnhoK0g2YUVna3l5d0xlNVFh?=
 =?utf-8?B?RjdBZEdqQjhWNWpROWltQXNiemlDejkxK3VEbnFGSlBSN1ZRZGM4QzJXcU5j?=
 =?utf-8?B?em5zMjBkRVJyYUFJQ0k3WTNkd3NkZUtTQUlneVAxRHdlQXJleU9ScDhvSW1r?=
 =?utf-8?B?WkNaOU9yVmNhR0UzMmt1SlNlTnhNSUdRcEJSa2xWdndlYUZKajFwYXFzK21l?=
 =?utf-8?B?a1JPVXhUSG5ibGZQRHN2L1BMQ1ZhM1J3OTdnNy94VkhsQjRBdmI0bnUyRUFr?=
 =?utf-8?B?TW5oejRHbk9hTEtjTWg1ZTJ6RzJBSG5Ya3FVZWowdmExWDkrR0RHbFo0bHJD?=
 =?utf-8?B?eFRmNXE5VWpuQzBVMy83U3lnL0VHeTQ1K0lnYmpseWZhMGpaS3FZSkZCYnlJ?=
 =?utf-8?B?MWdNNFg1cHlzc2RIZGNwVlFUbUxZUlNjeVRvZEt6dFBxT3lOU2wvRkV1WnY2?=
 =?utf-8?B?YWZxTDdoL1hwZXJBcHpQcHQrb3RBNzJsYm1UamJnaGhTWHQzeStyZ2FWZnhw?=
 =?utf-8?B?WFUzenVUeTJCUW5MNXJOWVJLMkJha0thcHdFeElMV3JBMERReTJNMmVHLzZn?=
 =?utf-8?B?VUd0citUMGQ4ZFVCZ3hRblFwVElYRWhJajVKR3pOMnZEd3U1ekVsUmtpZ1FJ?=
 =?utf-8?B?UFdnODVLNzIwVURBMTR0a3FvMkI4b3BjYWc5cWxnVEEyYkVlb2ozcTgzYXR1?=
 =?utf-8?B?Nm0xU0Joek9RSU5rYWRrVVc5RW5ZRU12SDIyODBDcTFSbjRTYkdGeFlqRGs0?=
 =?utf-8?B?ZUtVVkYwTHVVRGpJOXFrYWlKOCs4djRkeDEyQjVPTHNLRVpyTzhlMGhzMi90?=
 =?utf-8?B?TVpsOXdyNzZmQzV3NGJUdWFORDJISDduZ1dtODc1bUxLNkw4NUVJODJ3QldN?=
 =?utf-8?B?alZZVmRwOTRlMmdzcEdYT2pNTDQxZnJ4YzUwVXJzWWQ3R2N5K0NMZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a63e68-16ba-40f6-d8b4-08de7d9d6461
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 05:33:28.2047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpPk5pjqjKwO0BCF2KDuTAb4GZn2AjnGqlg2GQyMNc5K6+GExcdxcAk3WZ45hIJS0IlaX3h5i1UZnpLJEmmGjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6319

On 08/03/26 20:46, hasunpark@gmail.com wrote:
> [You don't often get email from hasunpark@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Hasun Park <hasunpark@gmail.com>
>
> Some ASUS ProArt PX13 systems expose ACP ACPI config flags that can
> select a non-working fallback path.
>
> Add a DMI override in snd_amd_acp_find_config() for ACP70+ boards and
> return 0 so ACP ACPI flag-based selection is skipped on this platform.
>
> This keeps machine driver selection on the intended SoundWire path.

This patch should be dropped.
To avoid overgrowing DMI quirks table, we have introduced "acp-audio-config-flag"
which should be updated based on platform hw configuration and required driver
solution to be loaded.

ASUS has to update the BIOS by changing "acp-audio-config-flag" to zero.

>
> Signed-off-by: Hasun Park <hasunpark@gmail.com>
> ---
>  sound/soc/amd/acp-config.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
> index 365209ea53f3..1604ed679224 100644
> --- a/sound/soc/amd/acp-config.c
> +++ b/sound/soc/amd/acp-config.c
> @@ -23,6 +23,16 @@
>
>  static int acp_quirk_data;
>
> +static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
> +       {
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "HN7306EA"),
> +               },
> +       },
> +       {}
> +};
> +
>  static const struct config_entry config_table[] = {
>         {
>                 .flags = FLAG_AMD_SOF,
> @@ -186,8 +196,11 @@ int snd_amd_acp_find_config(struct pci_dev *pci)
>          */
>         if (!pci->revision)
>                 return 0;
> -       else if (pci->revision >= ACP_7_0_REV)
> +       else if (pci->revision >= ACP_7_0_REV) {
> +               if (dmi_check_system(acp70_acpi_flag_override_table))
> +                       return 0;
>                 return snd_amd_acp_acpi_find_config(pci);
> +       }
>
>         for (i = 0; i < ARRAY_SIZE(config_table); i++, table++) {
>                 if (table->device != device)
> --
> 2.53.0
>

