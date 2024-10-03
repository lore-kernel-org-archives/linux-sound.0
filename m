Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3EB7F48C
	for <linux-sound@vger.kernel.org>; Thu,  3 Oct 2024 06:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727936924; cv=fail; b=hWLiMt1qVyhd5pKez0H85W2yaAJHob9uuW4FiW1VmqE5/xaai+kySZWoy0adewulf0IujLEBkEOzTKTvtCWOAZM6W0Ri8a+F9FE+kJQKiReIGsI54lj0iHHMa0LqkfG8OIxNeotNY+QIyhkeKCPeFA9yLBFaN45evPmE4gJ9PPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727936924; c=relaxed/simple;
	bh=2fFvrIo3WYlf54phbqJZPssG+ow0BOstybz8VK2lAfo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W4U9WUKGha9SeTiK/kSZwoOMFhG9WjjJOXgdSnnA2flRLwATVS7sCmSUUKaRC7akZSwPBxzhBt9tAeN7JF++RWuwZ8Yj0/eLdM7XtobyBAT4F5EUOzVjb50jyznW4nUVebrWOA2+Odh6uxd5GpQvc++h5OLVXHynbcFXGTXAd+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=C6emde91; arc=fail smtp.client-ip=40.107.223.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="C6emde91"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKZiV2C13i2KHOwznRX4f8NyDzd9MgxgUHsYq/c1iEnEhLFs5Yjolq1ceNKGS/B8PVrd7C7OStd8zi9sZI4w+elGc3YHEkXeOP1MIJN7Q8YjJlbJXYS6crBtY54UKMDQ2B9tDXNFOLxxhSxJ2QhW/PAgFLcpUuPMTXC0B9vBtRC0TepsGz2zmn5S9nk2obYKL2KXlhvyRLV1d0rU4MGojx+SSndqxvJtaql2U+K9GcCDI2UnlSVYAYQ8C3FrlThEaL1CxhWm7QLih48RB/vghslJ0oAkdD3zPxxBxHZRVfXf7omOoemP6ZMIDpslGIELltmBYukPlWW4qbPELTbZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixCqfT0tDGA3/SDTNXdtW2QvEfoPTEB+lWXdV5XWv2w=;
 b=tvN7logxMofI6gDBbBcQt8Crvwe5qg+mvdUFc85hZscYm+vbjERE8xCmsLbYMyHdNVW3iwYQ3mjMhaP2tij/me9JUiYJJxSNBL6ylCn48n8ZwzoyhKceooqsg/28BIPRc7MDis3vNa+BQ7B6UfBT/2ocRhWkKfskIAmpbG/spgPKcnydoHM6BrmmakdV/PrWFnX3bdppBACdVyep7ptOBPpN83iG+B9Amzj/oVVi59to7jqCojLTleF5fLFPyCuMY0d/OyINtB0f51RJtM9NVwTjqHN284SfLzxAlg++hzMJtegpaHtkuO+5IezWV9+ZcWkQV2RLWhhKcHiJY3WWVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixCqfT0tDGA3/SDTNXdtW2QvEfoPTEB+lWXdV5XWv2w=;
 b=C6emde91C8JFtdlBf8EF6T7hpJDE07Yi0IJ4f05RRSj0YQJpIIBEnxa5F7mNBOPFn5wK9SKmnj/mhOXQbKm4iGkmPPV8a0vS171nlxdz6APNWSBNKYEIUOiKYIGmNvC7GWXw/WxK6Cf/7zc8NAy89WXlxAwrN7XWjJGsoJBFIPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by DS0PR12MB9058.namprd12.prod.outlook.com (2603:10b6:8:c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Thu, 3 Oct
 2024 06:28:40 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%6]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 06:28:40 +0000
Message-ID: <4c1d9af5-6bab-45a3-b588-c0e41f5ed84a@amd.com>
Date: Thu, 3 Oct 2024 11:58:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] ASoC: amd: acp: refactor SoundWire machine driver
 code
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-sound@vger.kernel.org
References: <d245bb1f-27ee-4a7f-a5be-6b2573bc2c8a@stanley.mountain>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <d245bb1f-27ee-4a7f-a5be-6b2573bc2c8a@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::7) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|DS0PR12MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e0f963-4fca-43ee-42c0-08dce3749eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkRHUW9nWEVCa2NITkc5UTRoZXlFeTE2VXZXcnBtZW1OYUs2SEsvRFNadkor?=
 =?utf-8?B?UnNuRWtQVUFpTzkzN2F3K0x3MGhWQlZFbUwrSTcySkkzb09XYi9LdCtONElu?=
 =?utf-8?B?OVVCNWJ6eWl1WWU0V0dzVlRpTUNnSkkzbXRVamxBRmk5d05hemp0eW9GcUE2?=
 =?utf-8?B?eWNFSGdCek5vNjBreWhtenZqYi9VZlhTTlJobkJIdVZDRXJlbVprTkIwUytr?=
 =?utf-8?B?aHVsd1A3MWZ0Sjc4aFVXcUtBZ01ZTmM4ZWJQRnlGUzNGQTlUZEt0S01WM1hp?=
 =?utf-8?B?UXZiaUMvMWtwcGRPU05kdjFiTUk3eThDTmNUVFhmR09YWktGa1dqVFJMUGJI?=
 =?utf-8?B?blNKUFJOZmRMZzJiL094bVJYT2xnNXg1NTJ2dGNLdlBCTGRtSlo5NFdvYnlw?=
 =?utf-8?B?M2NGbEQ4RzBDdWRnSjdlMGU2dmcwenZIdmM3ZFlnbkliclBpcnFTTzJnc2xr?=
 =?utf-8?B?YnN6VlZWRDJFMEZ6by9OT05VcDhsSFo2bnFBY2R2N2QzeUdXTEVEOGgwT0Fo?=
 =?utf-8?B?aGdqaHZoc2JBRzlzQkFKeTFnM1pxZXppOTY3V3EzMHhPY1BvTC9zcmxCOThH?=
 =?utf-8?B?bW5pRkxRVTFOV2IzZmRIMFZ2L0dySlZsWXhna2l4Umo5Y1R4TGdGNzhTc21h?=
 =?utf-8?B?YmlMQndyQzliL08yNXE0SVNRUjk5NkJCTzFJU3hZQkxqVzNaOEYvTFhCTU1D?=
 =?utf-8?B?aXR1N1dyRThKUUJ6N0pFb2ZjOTFGeUhIT2dGUFVqUmZ6YjFwU2xiaDdyVG5L?=
 =?utf-8?B?U3BpdEF4cmhiSXRRdW9KcGJmSE1QL0Q0N1BTY2pLdHp1YlpROFhhRkFjSTN2?=
 =?utf-8?B?K3ZrV09Wc244aW0yZDBOTHRlNzduSFl4ZlZFVzNRdVVJVlN0NWh1bmtHcWw5?=
 =?utf-8?B?NS9MeGt1WFk4NHNyTXJsWCtaRHRrZUxsS2NKbEMwbEtQN2tMUXFHOFBSczIv?=
 =?utf-8?B?dEExT2lmbDN6elF5NGpaVUVDUVdhVkpZL3J3VFVXb2ZqRkJWUmNuUG5pYUMy?=
 =?utf-8?B?MVU5WEcyV0U1WmsxVGRFdDRNMFBqWncxTy84bDR2eDZVOTVJYWpwY0VSd3l6?=
 =?utf-8?B?RGoxYTUzNmYweGc3TTJnOEQrWjA4V0hNV0lJc2R2MkFJbHRaS2Q3K3ZUQ2ZW?=
 =?utf-8?B?WWg4MWFBNE84QWh0OE5tSENuUmx6T0ZRVFZrRVprUFpnbHhzTEQ4d1F0SFlj?=
 =?utf-8?B?eWtqZXFvMUMyVmphWDhVTmZ6dEdhN0duNUZoVHd1TDlaSFFybEg1Nm41T0o3?=
 =?utf-8?B?djZ0cTBVS0RONEx3dE15N1h4RThYZTZJRjJaSWtEeFdpeE5XY0o3cnAyVXBo?=
 =?utf-8?B?Y2RYRWlHRFRSNFIxOWVCSlE0eDJyOTE1TkpuWFZMSktIM1Z4S0JLa3FwYURh?=
 =?utf-8?B?angwbTNZZGFlNlBXSTY5S1F4Tmx0bmYwREdTSVhPeXhGWnpzTkhqTjBNcUZG?=
 =?utf-8?B?eml4WGlHUTFxUlAvVWhaMnl3bURJaFRlWUEvVmtzbExvaDlvYnNPejJZRU9K?=
 =?utf-8?B?MEJEYmpEcmdGNzF1ekVSK1l5YlB3YXQ1RTZhaWNBODUyN05RbDcyVDc4QXRi?=
 =?utf-8?B?MngrcjJLMXpiQlZlQTN4Y3Y4UVoxV0dGSmtEZ1JCcVNjNS9ZK2FGcHAyWDVN?=
 =?utf-8?B?NWpLcUh6YjJScmVQKytJYUVrZEJVWlhpTHppU1draTFpT3RWeEhjUS9pSC9D?=
 =?utf-8?B?ZU5Ed3NXS24zajNiLys0eU41eEpZM0pINFlwcWwzbWpkUEx1Q055M2FRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkxEbUxvTWdtWkUxdzhLc2lPRFJQa2t1MTF6NDBaZ21JUUhxaE9WWmVrUnBP?=
 =?utf-8?B?a3RJVkhjY0tCZmlKRzlLWUFPcU1jYUE2dVJ6OU1QTUg2WWpKUDBKU29SbGVw?=
 =?utf-8?B?ZTdnTHEvY0dtODM2WmlmS3UrWDkvQ0ZjUkpMNHR0Y2FneGJEN2lydHY1akVZ?=
 =?utf-8?B?cFR5WWtsTHdBVTV5V1RCU1RtWDhEZHRtaW5lcHowSGIrdUlBUjY0V0ZuNExD?=
 =?utf-8?B?MWlZWWpRUm5pU2VoMmhBU21uM1ljSWwwYlgzaldmTzFnM0NrdDhidDZMamVC?=
 =?utf-8?B?RHBydlAzN2lTeWdneUJFTitpMXBPblVnSFF2TkFreG1lc2p5cDZISWprQ2Ir?=
 =?utf-8?B?dW9iek04UVJJL0lMNFVzUDNwRVdpeHlSd3Z4akFUcUh6YlJXSitsTThVM3Nu?=
 =?utf-8?B?T0lvZkZJUkI2c3k1SWwxMmRRc0lURitSeTR0Smx3VGpZN3FiNTIwZXozci83?=
 =?utf-8?B?ZFJKYnJ4aUI1aE11bXVEUTMwRVd2bmVrb21idXBVYjFZWDVyVkErL1Nha29r?=
 =?utf-8?B?WFMwUkdoWk9lVEdjcG05SElZZVlncURXZVorZlNOVlRLRE5EbDFCazBITkQ2?=
 =?utf-8?B?TGtCT2FWOE15SDNSNnRSYkIwTFRKczhPL0ZydXZMYXUxMXptalBRa2hhL25K?=
 =?utf-8?B?Z2Rqa2lacE5NQTdNSWpHQldnVFpWRTZIOTVGbE9wNHJ5bmZCbVFobklRRFpD?=
 =?utf-8?B?T0ZNbHFwbmR3SkhsOTJ2RXhmRWtzN2srYThXZTRiclNnZG9IbkdISEpxem14?=
 =?utf-8?B?cm1RVTJ4SGhHQ3RPQnBFaWFhSk1jNzgzNytwb1JnenBFeU1BZGNkZjZueTky?=
 =?utf-8?B?cDRrckpHTGxCZ0xCbW1WT2ppUFh6WGttR2p3VXo5OSt5cEdKUEh3bUNUNWhh?=
 =?utf-8?B?YjJZL09TUWwvckkrSzdpYWRFRE5CVmVHckV1TWdwQTBPbnhSRjdqYVJYa0ZR?=
 =?utf-8?B?VHlMc0xFY1RnNG5QK21PYVVYRUxORitPTnNSQ1hYV3VQdklVMExoeDB0anY2?=
 =?utf-8?B?cWtsMWZRTmVMcjRhQjUwUFpUcnptdVpPYmpTRjBjS3haM1poZ0VCZTNUQ2lT?=
 =?utf-8?B?OFVxT2o3UHlaSk1jTTBoejdaWTByb0VDWmdGWFh0KzRNYy9XcEFtRzg3bzNo?=
 =?utf-8?B?NFZ5TVloSkNha3A2YjF3bjUyVnQrcHN6cFNVWkg0Nm1TWnFMaEZadE9CMlpz?=
 =?utf-8?B?Z2dpYUpLckt1eWs2TTVNcUM5eUIwZWxEYzBKVnhEb1RzN0Y2L29WYXpMNi90?=
 =?utf-8?B?S3k2dUNXQjlkOTUwSllWL2piK1ZQblZab3RDa3UzdHd0SEFmTnRoalZSWkk0?=
 =?utf-8?B?bW9NWG9XVHJ2VkZFaUM5K3dHNVJhckNMOXUvWlFhS0FLanR3cC9lRUVETVM5?=
 =?utf-8?B?VDRWRlh2RGZGRkRuTFdQUE55UGptVTBrRXdDVWpsZ0pQN3F2dEZzQjQzRzIw?=
 =?utf-8?B?Tm53NEFrL3dCRXNGbFNIQTdoZDNTOXNEei9HUkYzUmpxWTIyWENuWVVGYzU2?=
 =?utf-8?B?U2lUOCtDYXhSZURQWGVuYlEvZEhmQWM5WExDNnJZSC9CSEU3ODBob0FxRDJG?=
 =?utf-8?B?aEpmbEg4eFdsdzYxT28rSHJJRVNkRkVPK1NEa3FCcVdCbnpFMWNlQzVva0Y5?=
 =?utf-8?B?alJobXV0K21nYjJyQXFlRGtTZVBqUi8xQVRENFdWZE1Xc2tWaG5hTHlzbEhP?=
 =?utf-8?B?RDArTVgzTFZ2bTRRYmEwMUNBcXFMZ2I5RVl5M3dITk9lMnpkNVdBbWpYZjVD?=
 =?utf-8?B?SjU0R0V0Si9Ea1VJN2Y0ZHhia0tOcmVBNFQ5TnRGeU1GNlZNOVZCZzNjd2hy?=
 =?utf-8?B?SFNqbzdpam5TRjNacFhnbkp2ZlJ0dFBPdEFIUHhSa2JuNWowTzN5MjFHOTQx?=
 =?utf-8?B?dlVIZkpVSWNpRloxRDBrQU0zbTE3TDRtekVKMnhQcXVkczE1bVdyZ05jQmxm?=
 =?utf-8?B?SzZSdGs2RUh2SHNFNXhNKzQvQjJacGZoUmp2THZKT2FFRDc4NW9BQ2ZUUkgr?=
 =?utf-8?B?OXJYRDZOV1FvNjR4dWVYZk9MQkprS05WVUwwREdhWlV1MDVnY0UwYnduU2Va?=
 =?utf-8?B?ekNPUFpwaWVuOWhIMTMzZktGRDVaVWZxYUN6aHRkREJvemxDUzg5c1VTS05q?=
 =?utf-8?Q?zSpM1T02dj4WeqWjEn5BP6QaS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e0f963-4fca-43ee-42c0-08dce3749eb4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 06:28:40.1712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vaMHgxEJ5sk6Myk9wJTMtwcAyo57FgzFr40JG7VpFVVRfr9QhjeLeMvkEa3QQJ91dWxDD3M9qfWN9bzWvt7pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9058

On 27/09/24 16:05, Dan Carpenter wrote:
> Hello Vijendar Mukunda,
>
> Commit 6d8348ddc56e ("ASoC: amd: acp: refactor SoundWire machine
> driver code") from Sep 13, 2024 (linux-next), leads to the following
> Smatch static checker warning:
>
> 	sound/soc/amd/acp/acp-sdw-sof-mach.c:157 create_sdw_dailink()
> 	warn: iterator 'i' not incremented
>
> sound/soc/amd/acp/acp-sdw-sof-mach.c
>     144         for_each_pcm_streams(stream) {
>     145                 static const char * const sdw_stream_name[] = {
>     146                         "SDW%d-PIN%d-PLAYBACK",
>     147                         "SDW%d-PIN%d-CAPTURE",
>     148                         "SDW%d-PIN%d-PLAYBACK-%s",
>     149                         "SDW%d-PIN%d-CAPTURE-%s",
>     150                 };
>     151                 struct snd_soc_dai_link_ch_map *codec_maps;
>     152                 struct snd_soc_dai_link_component *codecs;
>     153                 struct snd_soc_dai_link_component *cpus;
>     154                 int num_cpus = hweight32(sof_dai->link_mask[stream]);
>     155                 int num_codecs = sof_dai->num_devs[stream];
>     156                 int playback, capture;
> --> 157                 int i = 0, j = 0;
>     158                 char *name;
>     159 
>     160                 if (!sof_dai->num_devs[stream])
>     161                         continue;
>     162 
>     163                 sof_end = list_first_entry(&sof_dai->endpoints,
>     164                                            struct asoc_sdw_endpoint, list);
>     165 
>     166                 *be_id = sof_end->dai_info->dailink[stream];
>     167                 if (*be_id < 0) {
>     168                         dev_err(dev, "Invalid dailink id %d\n", *be_id);
>     169                         return -EINVAL;
>     170                 }
>     171 
>     172                 switch (amd_ctx->acp_rev) {
>     173                 case ACP63_PCI_REV:
>     174                         ret = get_acp63_cpu_pin_id(ffs(sof_end->link_mask - 1),
>     175                                                    *be_id, &cpu_pin_id, dev);
>     176                         if (ret)
>     177                                 return ret;
>     178                         break;
>     179                 default:
>     180                         return -EINVAL;
>     181                 }
>     182                 /* create stream name according to first link id */
>     183                 if (ctx->append_dai_type) {
>     184                         name = devm_kasprintf(dev, GFP_KERNEL,
>     185                                               sdw_stream_name[stream + 2],
>     186                                               ffs(sof_end->link_mask) - 1,
>     187                                               cpu_pin_id,
>     188                                               type_strings[sof_end->dai_info->dai_type]);
>     189                 } else {
>     190                         name = devm_kasprintf(dev, GFP_KERNEL,
>     191                                               sdw_stream_name[stream],
>     192                                               ffs(sof_end->link_mask) - 1,
>     193                                               cpu_pin_id);
>     194                 }
>     195                 if (!name)
>     196                         return -ENOMEM;
>     197 
>     198                 cpus = devm_kcalloc(dev, num_cpus, sizeof(*cpus), GFP_KERNEL);
>     199                 if (!cpus)
>     200                         return -ENOMEM;
>     201 
>     202                 codecs = devm_kcalloc(dev, num_codecs, sizeof(*codecs), GFP_KERNEL);
>     203                 if (!codecs)
>     204                         return -ENOMEM;
>     205 
>     206                 codec_maps = devm_kcalloc(dev, num_codecs, sizeof(*codec_maps), GFP_KERNEL);
>     207                 if (!codec_maps)
>     208                         return -ENOMEM;
>     209 
>     210                 list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
>     211                         if (!sof_end->dai_info->direction[stream])
>     212                                 continue;
>     213 
>     214                         int link_num = ffs(sof_end->link_mask) - 1;
>     215 
>     216                         cpus[i].dai_name = devm_kasprintf(dev, GFP_KERNEL,
>
> i is always zero so this just sets the first element over and over.
Currently, multi-link aggregation is not supported. i.e 'i' variable
will always be zero. 'i' variable can be dropped and index can be
hardcoded something like cpus[0].dai_name.


>
>     217                                                           "SDW%d Pin%d",
>     218                                                           link_num, cpu_pin_id);
>     219                         dev_dbg(dev, "cpu[%d].dai_name:%s\n", i, cpus[i].dai_name);
>     220                         if (!cpus[i].dai_name)
>     221                                 return -ENOMEM;
>     222 
>     223                         codec_maps[j].cpu = i;
>     224                         codec_maps[j].codec = j;
>     225 
>     226                         codecs[j].name = sof_end->codec_name;
>     227                         codecs[j].dai_name = sof_end->dai_info->dai_name;
>     228                         j++;
>     229                 }
>     230 
>     231                 WARN_ON(j != num_codecs);
>     232 
>     233                 playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
>     234                 capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
>     235 
>     236                 asoc_sdw_init_dai_link(dev, *dai_links, be_id, name, playback, capture,
>     237                                        cpus, num_cpus, platform_component,
>     238                                        ARRAY_SIZE(platform_component), codecs, num_codecs,
>     239                                        asoc_sdw_rtd_init, &sdw_ops);
>     240 
>     241                 /*
>     242                  * SoundWire DAILINKs use 'stream' functions and Bank Switch operations
>     243                  * based on wait_for_completion(), tag them as 'nonatomic'.
>     244                  */
>     245                 (*dai_links)->nonatomic = true;
>     246                 (*dai_links)->ch_maps = codec_maps;
>     247 
>     248                 list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
>     249                         if (sof_end->dai_info->init)
>     250                                 sof_end->dai_info->init(card, *dai_links,
>     251                                                         sof_end->codec_info,
>     252                                                         playback);
>     253                 }
>     254 
>     255                 (*dai_links)++;
>     256         }
>     257 
>     258         return 0;
>     259 }
>
> regards,
> dan carpenter

