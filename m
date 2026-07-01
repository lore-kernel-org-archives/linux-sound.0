Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012028.outbound.protection.outlook.com [40.93.195.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7259D1AA1D5;
	Wed,  1 Jul 2026 06:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782885876; cv=fail; b=uxhCy2AOKB2/xEaRAR2ncDzlyeeP+R3HXmO5ktmSsfntikpemlBRq+csQLQOcaqjoXrKyj0VW+3LULQTtkfQfsYX7+7vCP61Kn2qUilOq12v9ewyK0wE5RezxIuCdmXto25/YxZG1n9lG4YLfmbo1UWlXiYXW8I+KGEyrM7VrTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782885876; c=relaxed/simple;
	bh=P7bt94/XKVBiTj/L49fMu+1YJrwmdYUOXX1MWqiB5jc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OSBnv8i3clscjYGBa61Wmr0GMZ2V622WfpwLjQYXLK850UJthbEbMDj0PA+ZS/A2H8owDGPZG0QzsjTcGaUFFMDiRyA0Jkg1wurTXuGSQ8hjtATQYKfZsCV9renbcwbMnbZRBc5S9oKogXw5hJ24hwW4HtVckQkig74fs+092pE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UYY8CGgQ; arc=fail smtp.client-ip=40.93.195.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UYY8CGgQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbQ7DU0wXx2c0+FntKy2OjpgEA48HGv+PygUToxj88YDQ8p8tuSNPhcleRUjf0uePvOhiUemI1hBnBeydo6bVYlE0fet+n7/UKKhNtZZErjbVP/PU2+S34hKqyES22w5W5VayNQ9QyTStTMBQIxdVz5vq8nUJsrsgAbLnUnRCGE5dz6unFJUWjizGK71sCBPociZUPGTY3R0RcX5LbjXAMWP+fY4q9NLWzb21lLeaolUxXZn5V2gnUHjGjeQc+G1jS3GzyvacIGORtepwx4pXCeWf3WN54IFjmkfa0UDah+NAYQo5yMPHWDtixgIp52Ilt7Fcx7WqGPcJpZNtgvsiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQd+/0TiLjRo756enOgSQf6eNJcHjbHy0Q0Hd7SXCYg=;
 b=VwmtFnNPowxq2dbAUoF12KCqxto6oDE9XbrQ3Qsds4p3IDOTZZErxcynW6cuI6iqrUdBLUHGundKrp5hRAwlB3lt2ENHTWBDeK0pDYEoWP7g8qIP7XAf/uCsO2TaUdZzYtEUoRMuM79dT48wQVfjVFfClnFw0lX7GDA+oeHcmyoqijU1jaBVBxRskuL63CWMRWqLyjvXyMusA/O0i3ZSLTebDNXmpyrIY2cgOv4z14VLfIdVRsq7BV0yC27rnai4ovNoPUkPVV084yb/oCWW8+301MHmz6o809NuVIqifr7Cg+ChJFCJ5T42TvmT+yHxTVIF+oUqTKXOfUBPfqarMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQd+/0TiLjRo756enOgSQf6eNJcHjbHy0Q0Hd7SXCYg=;
 b=UYY8CGgQF6uYvQsNvFPmlQmg5fCE0mmpL6NlUiaBUtvAmUoYO5Ov1tXMRFxtOEi8zp9pvopznmcA8MazZip3Pn3JZeuHaz1I1cOX7xv4pW1jtgaxXnLcrFtrTVl/TA5f9JOkpv03DXIJVJ3NEJRsCscr8WBrMCIOuC4KnPcW52U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CH3PR12MB9251.namprd12.prod.outlook.com (2603:10b6:610:1bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 06:04:31 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 06:04:31 +0000
Message-ID: <84bfa2a7-d8cf-41d3-b3f6-706485f0efe2@amd.com>
Date: Wed, 1 Jul 2026 11:33:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Add Alienware m15 R7 AMD to DMIC quirk
 table
To: Jetha Chan <jethachan@gmail.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260630003328.15675-1-jethachan@gmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260630003328.15675-1-jethachan@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::20) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CH3PR12MB9251:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e5745f-0d69-4b6f-f95e-08ded7369e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0rgQ9mkuisXYC/9OSoIeh2/VOTOXAVpAjpge2Cik98ZVXIa7Nciy4nmKHF+3GOP1ZYcITtrPWEYMaqg4nQ3M4BqK5sWm36dyVXbaILGrQgkuhOJrsFpc5ykZGRYGzOlYi38DakSaL9/+zW3/FirFe69Dy8fepMCIFkSj4F7pf4SUktu86q0B5Ot25r+OMDSQtPdBVjhtPCIHgZn0x02Stivg29FiSPip2TTGu7E4vFceudBmO2y2IQ8EevTzxg6ZhQe06CZ0NH0IzXgHAgnkVlH70riTt2+LcpyCOHUrGSmogJy7ZAmr2wuua6Y5y1qaWQnyquGwQr7YoLH6rPkj0WAx8xzvTxjVigi6il+xJpNTC5e8ElfFOpX9Bcr/urlpFnAZvCqpkxIL/ACfbBK0puzcr0957qad+59S7lZO5+xGI2OyvsG2KDJKboZDHY0Kl6He2VCQRwBFNadUSEAI+GjTJp+ieljV9sn5Rgp1I0Mu8hkDr15tmYpYOp8aYUsyAF3SeWcCG6e2Ca9JX9e/SR5d/54HDtSXcuIBU0Qx9MQBOqgKnu+lVYohSzrPxDotPKNQ30Wa5Z9XMUcAyGwgIfpOGRzkrh3JBbwvDn7jk48=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckdpR3BEYVQ2RzN6SmpDVk4vdVdrOWFyalN5VHRPcnBnMFdPSEh1RStIN1dK?=
 =?utf-8?B?T3BsWnZiRFpXWm9CMFJWd1RoZE9aMWxtWDIvd2tNZjVRMHpHam01NDBzSXFF?=
 =?utf-8?B?TGN2WU1jSURUeS83bndVbzVFTDFMRXlCaTNoVVozRmxNQ2cyMjkrenpPSWhU?=
 =?utf-8?B?ZmlLdko2c0VGMHFWaDQxZm1qcmRwZzN6dys0MzBMb3ZxU2F5bm5hVnlRYlAy?=
 =?utf-8?B?SlBtVXorM2t0QlJNM05aM0YrTkFYUnc2ZndkMHRFTTlVdnJ3ZkIyV09mZG1r?=
 =?utf-8?B?aUlDMHZueTd1VjVyK3Y5WmpKbmdxWkdJTDlvbCtmZUVhbDY0N2tDc2RCMlZX?=
 =?utf-8?B?WG9CR0xsUkhmSDNlOWFOVUEyQnVudHlZOG1rRXVvNGVRSkNEbFV1ZDBwV01h?=
 =?utf-8?B?SURSVTB0bm5Cd05IWjJoQ1FqdVJwK2p4NkNjWkFsSlNmUFNxV3g5NFJscGFv?=
 =?utf-8?B?anpiWTBhMStFczBzdWYzREVSU0JtL21nVlJxZ3FDMGN2N2NtMllDdk9nNFho?=
 =?utf-8?B?eTZmRUZqeWtHNU44SElsMVE2ZDRLSUpDN2JDNFBWRFZqdDdGQW04U21YM0gw?=
 =?utf-8?B?OGhNMlpITEszM3lnaDdrc08vdUM0bW9BalI5OXVLMWR0clM4akZWNUpsVy9x?=
 =?utf-8?B?SXYvaEp5VkQ4UTdSc1N6dUZqdXNyNVhKNWpmbi9tOXBIRC9ZQ0xaMUdibExI?=
 =?utf-8?B?T29HMFNGcVhMRnZaK0tsTTJrZ3R2azRGY3dNdVdjNnlyaXB1ZGdkVVEzUXV4?=
 =?utf-8?B?VUtJVnFscTZWc2JZN1VuSVl0clpyUGExV1lRMVVhNWZTanRMMEhVYlFDMjVS?=
 =?utf-8?B?TkFnTUk5em9hdHpHa1F4VHRUU2l3RVRqT2ptVlRXUk5YbDFSYUNIaVE4L1Zp?=
 =?utf-8?B?ajE3bk91djRyN05LdjFSeVhTREYraFJyUnJoNkdlK1Y5R1hzeENCOVp2c0NH?=
 =?utf-8?B?S3p5ZXE0REdKWTZGVERzM2ZTOXZZaGt3NEhqRnlMT2VUak5rd1o0TmdVVWJB?=
 =?utf-8?B?YlMxR3RzUlUwUUFtQUk5VXlack9yNzBGUFNSaFBUMHFlQzFDUitad0p3OUs0?=
 =?utf-8?B?Ny81YTBqTUQ5akNweWt1VDVrVE5taFBXazRIZUJ4OVU2c0hzSTlnZnAweEY2?=
 =?utf-8?B?VWRvZHdocW9NZzNIZ1VZa3pYdjF4SVJjbHJLd3YwUHJjbzBNTnV2SlZMWmdN?=
 =?utf-8?B?ZHhFZGIyN0xSM1JTMjJVaERYOHhrKzFRUGljOFNjRXlJaXA4WGF3NVRVamtO?=
 =?utf-8?B?QnZjUlVJV3pSaFNBN015TGxLRW9ibGZUVTRaZ1YvaGp5QkNieDJXM2pCa0hy?=
 =?utf-8?B?cGpIcitaMUhLUDZ5QzJnUDNSMHlaYUs2cktxbURYc3cvUmxDWlgxbkU2ODN2?=
 =?utf-8?B?NFdHbU5zWkFhVkpZYnBEdHV2ZmVYL3VKWTZqQzVaODg2TU8xUkZyODdHS2p0?=
 =?utf-8?B?TmE4bTVHbXNnZDBpbU5QOXVqSVdLM0RkZnV2SzJDeC9WNXppeS9sTzdPdnhT?=
 =?utf-8?B?OUV2SWZ1K3JFN1h4WWlxTnczZUZHNTVqREdiY1ZBcjJtem1OTnF4Sm5VcHpl?=
 =?utf-8?B?SG5XUkFWbjM2Tm9NNXUrUlp6OUFjMjliZXkrRFJyU0xQb2xQWHFmQWZxdEhV?=
 =?utf-8?B?MWRLeXNGWGc2TjhIbUJHMy9ReVV6b1RyWFdnOXNGVlNKZjUyUUI3Tk9aVStn?=
 =?utf-8?B?ZDErd29WcHBJcWEwRXM3NlorSmFkNDVDZ3Eza1gyZXVvejlPSlV3bTF3QjZN?=
 =?utf-8?B?RVBHRjBZajZPZWlJUzRXaThVbzRKVXU5YkZkQm1ESjkzNlFFWGJRQzdieUZ3?=
 =?utf-8?B?NlRFQmo1NVZMVEhkUEhDTnprb21QUnZnS0lTWEppUjZkNXNlbFJxaFQ1bWNJ?=
 =?utf-8?B?aTZIN0pxSU5XK2lFNnJZSVI2WWpLTk1wUzlXbjh0RVFzaVRvMzQ5cUtiTVJI?=
 =?utf-8?B?VG5rMFRzenVrMjUzU3pEUm00MFZqWVpBbjFhT3VSS2JWVmI3bXNGRUNSSC9w?=
 =?utf-8?B?U0dEeklkeDZFejE1SDd4eEZqTmpTS0V4dUU3QWxGODBDck5kb2phRTBmVzJR?=
 =?utf-8?B?aTFyVGtmMFVrN2h1eUtCYWRwODZsUE9CQXU5M3V3bEsxbTdSOURBZFBhVU52?=
 =?utf-8?B?cXZzUVo1NGltbjIxQjI0T2c1bXFTT0NwZGRqZ3V3L3YwbmRqbjErL25ndm90?=
 =?utf-8?B?bVZwbVBEeGtPNkVOajNzejgwbHlZb0NKWFIzR3ZyVTFmdDFQWUcvVmpRbHRr?=
 =?utf-8?B?Si80eEdNZVcwU1QyZ21jL0p1TVBhU2Ntb0lhN1RxY1dYUUFxMytQVithRHFj?=
 =?utf-8?B?TnVaN3hlUjlRdmd1cWFHSzJsTkx1cURYNnBSMkdhMWpTZnhGNzJnQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e5745f-0d69-4b6f-f95e-08ded7369e1d
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 06:04:31.7813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58vTIrAQRGN6WPPjxa7n63oeWi4rt1DMs9jI+9CcD+P6CF70Jj1zbFE9z1FFNFAhk85TCUlKK9VczkhGQwmMrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9251



On 6/30/26 06:03, Jetha Chan wrote:
> [You don't often get email from jethachan@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> The Alienware m15 R7 AMD exposes an ACP6x DMIC path, but its DMI
> product name is not present in the Yellow Carp ACP quirk table. As a
> result, the ACP machine driver does not enable the DMIC card on this
> system.
>
> Add the DMI product name for this machine. With this quirk applied, the
> kernel reports:
>
>    acp_yc_mach acp_yc_mach.0: Enabling ACP DMIC support via DMI
>
> and ALSA exposes the ACP DMIC capture device:
>
>    card 3: acp6x
>    device 0: DMIC capture dmic-hifi-0
>
> Tested on an Alienware m15 R7 AMD with product SKU 0B59.
>
> Link: https://jethachan.net/dev/2026/03/21/fixing-internal-microphone-alienware-linux.html
> Assisted-by: OpenAI-Codex:gpt-5.5
> Signed-off-by: Jetha Chan <jethachan@gmail.com>
Reviewed-by: Vijendar Mukunda  <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 000000000000..000000000000 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -504,6 +504,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
>                  .driver_data = &acp6x_card,
>                  .matches = {
>                          DMI_MATCH(DMI_BOARD_VENDOR, "Alienware"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m15 R7 AMD"),
> +               }
> +       },
> +       {
> +               .driver_data = &acp6x_card,
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "Alienware"),
>                          DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
>                  }
>          },
> --
> 2.50.0

