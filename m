Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793257185;
	b=eNrFj5VH2h/I3PRuYdoQ2+Mc1o8FgMEmQol8CJmt3BkUOaq1uHhYsiKrjqzs8Km7mRBG
	 5opgzCBQuwPd7iKhph1CSE0VpruUuDVmceaLLUs6vL76IIe7An8Xd1ETp8cE/GnNnO9sh
	 aJcVNv3RUXbCL5XjDxmGf04olkLd2/6NFbzlEGtaAfH9UrXaruwbPw4onULQNnqa3dD/a
	 RhtAHG3tog5nGPJpqxwndQZPrxfPZG7Qfn8eWMdx1bMiRlMSQ/HBpO0Ft2vf5tvhRoNDC
	 bL+wpMXGSgC8nlH8rhWZ/JGOcTf6OyMaT9/v/Ekfa1MelOkxL06M5PfQcdgL5EQvbCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257185;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=4wbAd6nkNx5L6bYJsgGts/CL921mM+jU0bzE2e9WVfA=;
	b=4b2UEqAu3VA++bErwU1rPj+DbhILzBhJPR3Eej2gpaktZYcYcUPpuh8ZQHqOVSNtN8fH
	 pLOV6cVYYpOOpAm1mviow7ptLzxA4UyhEpCuYGkEY8U6+A4qTM+hoo+yS6ofHoOY2cELN
	 gDCzWmdMs810dDV32hBjmZzbBrxv3/psBgxBw6I3kbqB8iXy9PIQc8rUtypc7bREmIyio
	 N8rwiiH7rij7kBOJOV1mMj5+PdWFGJGSvxmqcVEeUytzKutML4vuAAAmHSWsefQBc+WyG
	 AdgRk9aBeVQdTaXabWxs+XOXtjY/WE3GU+kOT503D+vJA9qyjiLFQtguQKYuhXJjsQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="rzcm/tk/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.19
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013019.outbound.protection.outlook.com [40.93.196.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E5A606A31A
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 06:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5E5A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rzcm/tk/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsJUmtDKnPwwiAkWvCIO1R6TZEdTIoRZQCEtls55V6nkbTIC9L9DGTdLpGjab5PVKUh6lT6c4ueiVtdpoW3VmsmmPNLaVW/ys0wvK7VW+iDLMrBqTyW/XtFR+uXdd6jIZfytT0j9oURehlt6r3szVVxYAIIqHs7KMMIzWp1nqFvzMckrxKHU5az35vBVIKu1mBPwkKOaOQu6/WNJdYdHdRgyrrt0ZorGmxrRN3+NKPCAkcCaOqTbZ6x1SKUbOcSkwqvED9ht1Op4A8uofLVbNNvdTb14n2L604rb5iM/tIpSOcHek53p9Ycws9rPHEsie/vsUHxSG+8HGWADxuqzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wbAd6nkNx5L6bYJsgGts/CL921mM+jU0bzE2e9WVfA=;
 b=r3DFpcz3SYpr9RljSacqxf0idinCi9iRj9kccz0NYokeDNklTFxbMLl2wlzJRZO6KqHUGeKcM0BwjdfaEWg9Yn+dXHSPKJiwKcdXwwGcjxWYeuPKEb6lSf0ZoakzRmxDPAU32lJnHx6JqLSnzntaYGD9a3eOsSHz6ie4fl3eBuubz7dHCzjOuOys/rPqHNuI3JaOSOcVAlWSNoKYwc02zpJT+1/sVvn59pr9P4mbehbQjYC84hMT+H4RswmyDb9RLiZ3oM62iOVx6iJhd/T56r3QPIIoU9KxKju0q2n3W4SF0EpvrMkAIPlSXprt8aKDfQhmzOJBDYfaZVUwvcTnyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wbAd6nkNx5L6bYJsgGts/CL921mM+jU0bzE2e9WVfA=;
 b=rzcm/tk/No43ax1AD0p6T6UkkggmFK0wjdEODMD6QaLK3fr2g/EuTGvGuOADAg2ML033m8jVxivM4z1VeeCRsEzFhMYQIpS69wiWdQO98gFy49Rg+q/3Q4seY2U41AMaOHmzum4WQ+I5U3dhdMcES9K2BlWg4WLo8vQw/r3mlSs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 06:59:41 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 06:59:41 +0000
Message-ID: <b620b080-5383-4f1e-93ac-6b95631d874d@amd.com>
Date: Thu, 29 Oct 2026 12:28:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/11] ASoC/soundwire: AMD ACP6x (Rembrandt) SoundWire
 speaker support
To: Corey Smith <corsmith@gmail.com>
Cc: linux-sound@vger.kernel.org,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 Syed Saba Kareem <syed.sabakareem@amd.com>,
 "Prasad, Prasad" <venkataprasad.potturu@amd.com>
References: <20261028020552.35278-1-corsmith@gmail.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20261028020552.35278-1-corsmith@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN5P287CA0047.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25f::13) To CY5PR12MB6252.namprd12.prod.outlook.com
 (2603:10b6:930:20::17)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|MW3PR12MB4409:EE_
X-MS-Office365-Filtering-Correlation-Id: b7ffeee0-a28b-402c-6e3f-08df358a348f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|261028144727099003|56012099006|261021123027099003|261026121527099003|261022075727099003|10067099003|261026140227099003|261022105027099003|261009223027099003|261021135927099003|261021121427099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	SI7AHRCio7kE6lE3JIxdYsPFiRtRhf5QW298y8gd6F6wewrM8M+HoxUvMsfRwOXDASMC2h3bxy1CF4E3x1ji05/bMVcvdspnkivZJEkJmoSrtRg+O1aS823WEQYzMtJ9naLoZ2JovfqFbZPnWgUTnwQ79Dp/e3Fj1aq2n+BpmeL3gDTaMrfkOnQbJZmCCHeflqQGRO4PmYeqGB1tZW8iu7YlCE2QP6km0l0mavylTvG0B8twU6WHAk04myEfqRwhEEQ6i6S1uN0JJIlduSggI+6p9mnh940Ph2itniB0LyEbAxs9+dlKAo9GczZyYyu6icitihbo73MJ2v4TD4bw7SNSETQyZ4cwlj8UJpVd68htE3qgw0K+YL6f0aABj9m4od/4wiIBo0WPLtqD1G66LIUDViO77pTXP1EReW1kR7rTsBMNOb8AhCtzUlgwnW3RxvuCM/FFn5DrBNb3RSo2j3owd9eyTfQhL/qyw8s2tBb2ocTOb7pvWVe2Xc1evVmbOUTKCS/i3YiuLM2U3XPeOGjqeMOFHMnUgiQqIvq/+j9BlyRZYHqIJ95kHliksw34wBLnquQ/NTJaYT8rQo56TtPbyW2+tB69fHqQSvy4MudyWBPADVQLg3u07ODyS0P9goK1YJTBM78zlZuvmq1YiqsxwVyNdTsbOOs3oI7RYpg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(261028144727099003)(56012099006)(261021123027099003)(261026121527099003)(261022075727099003)(10067099003)(261026140227099003)(261022105027099003)(261009223027099003)(261021135927099003)(261021121427099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2d1d2grSURvaWZucFJVRHEvVGlwaEUwU1dsNXY0U25QNnBzWUJnb0FFRGRO?=
 =?utf-8?B?Y0ljb3h1bXZTUzl6ZVNkTUVrSytmajA3RzVvV3BNWERyTmJJWHpqU1hMWVpj?=
 =?utf-8?B?UXFiUEhBV0ZnL3QrZWNLN3c3UE95YmZnYXdnZ3hCTkpFZ2hubisrcnlFOXBs?=
 =?utf-8?B?RFZhckpBRHhQYkdvVnUveThxaWhRdWgvQmRUVmJoR0oxeDRqcTFTZTFwNnA1?=
 =?utf-8?B?UFdEd1VTdE1kU1dYb3pOK1k5dU1GeGloazN2WmRqMnJ4Y2dkNlV5U05zUGVO?=
 =?utf-8?B?Tkd0ektmdWxVOFlMeElFL2tYQXBSb0Y3WXkwQjRtVWxONTZrTE4zRGVDd052?=
 =?utf-8?B?MjN1cEVPNGdHN3RuM0Z0QVFMTmxPN0hwUUMyNzl2RXBqeVJqYWJ2UHFPNzQv?=
 =?utf-8?B?TE9rVWJvbTBLcWxQZithTzhQby8ybytMeVpCSytWd2dGWUNNVjUrRzEzYndk?=
 =?utf-8?B?SmVmVThjTkxVZmt2QWhJZSsxeVlLcnJoQ25mb3ZYaUJEeDBSSWJONlVYU1ly?=
 =?utf-8?B?STNjT0pnOHZzb0swWGF6TytyR2hQQThKbFZ0cHgwNXMrN0QvTDBCQzJqdEdh?=
 =?utf-8?B?b29rWk8rS0Yzb3ZFeWs0U1hpSjl6ZWExZE1BMkZVaExWa2hMVjFGcE9NcHF4?=
 =?utf-8?B?VGJzU0JxWlFCQmdtMzM2RFp6QnpUaVcrZGN2MHJJRUY3Z1N3anlRWU9nZUNB?=
 =?utf-8?B?clRmQk5sY212MGREaHVCMTFESHlLak9uanJGazduL3I3aDcvUWtBTGpKTUVZ?=
 =?utf-8?B?Wkg0UmpHVUk4dmNMeXQxd2svT08yTjFZckFtaWF6MldjNWNiaWxjbko5L29u?=
 =?utf-8?B?U1BFM3A0bDgxNmtwR0UvbS85T2ZjSVJoYnNKZVQ2ZkYvZFlCRGx0NWdhcExD?=
 =?utf-8?B?Z0xIbXF0RTF1aW5RZEp0OE5JWmREeTYydHRQTEFkZEhlQnVJYnlnRWpLbzEv?=
 =?utf-8?B?ZThZT0dhc3ZCM1NzOElPVEM2ZDRPT2VkRHVpOFZSR1JlL0tpWXNUenBKUkRn?=
 =?utf-8?B?RzZlVGYwWEQ4RmVXY1ZwZy9QRVpzRDNldjl2aC8yYmxmc0dNcnNyODhtRnJn?=
 =?utf-8?B?WUJlaG15NWVsNWlUNVB4NEVQL2daZkUyK3FCNFJqZkQ2ZXdFRS9EdTdVU3Zz?=
 =?utf-8?B?OUpORFlFZjB2ZjJORXMzOEdHcXlDR3dvWkJucERNeHA3WmtHWmRZU3lHdWhq?=
 =?utf-8?B?ZnJQWGZJTUEydmdtNnpsYWNtTEYxczVoRlcvdDNIYzI2WWhPbWY2OWNDZld2?=
 =?utf-8?B?a2taTU93L0VxSGl4dmZGellSSWEwUTRRbFYraW5OL3hVS3lIbU9SbXUxQ0h1?=
 =?utf-8?B?dXYzZzFWOUx6VWpPeC9Bc0VEaFV0WWo5a0h1MXVneldtM0xIS3Y3TG1GNkN6?=
 =?utf-8?B?cHR1dkcrRzdpSXZEeVZwdnpUN2NnaktsRnB1cEgzcjQ3c2dUMGVZTjN0dHJK?=
 =?utf-8?B?N3ZlRFB5R1JVeHVvdXNsbjhlVU9aUjF5RVE3Ni9McngzWlYzY0JUWWpielJG?=
 =?utf-8?B?UEJpb3N4K28vNWQ4ZXgxNU9vYUQ0bFJJekFDV1dYNXYrQUluNjFDUFlVR1NX?=
 =?utf-8?B?cXY4RUxVeFlFU0F1STc3L3p2bTBpTDlRTFBza1QwVjV6Y1RJTFd2QUdyQ2li?=
 =?utf-8?B?NTRjQ01HYmhYM2NsZEEwcmV4Ly93Z2lGdm9pbEJpVU1XdkQ3bEhCejFmNjlJ?=
 =?utf-8?B?UnRuc0ZVd1hGN3VkVmc2d0JxSDNTejFaOC9YazN2M3VaNTYxT2dVQVVadTgz?=
 =?utf-8?B?d2EybWk0RkVzeUY2NHc3dHlFcWt2M055RWI5MzVQT1NkNHNENjUrR0dLWEE5?=
 =?utf-8?B?N0dBU3lCZ2pqeGc2T1dWZjNJWGpqWTV5azZBa0RwVk9yQnh2NTNqR1F6MUZG?=
 =?utf-8?B?WTZ0a3YvVjRPZ2xyWUZHYVVRcUxVcWxQYTJscTJCRGdkVHRCSTZNZDVuVVQr?=
 =?utf-8?B?MEQ2ZFRZUjN5L2ZJaGNVR0FKemJyakMvcGpRanBhN3NSYzV3R3BYdUYvblUr?=
 =?utf-8?B?VFZzVEJFcExTQzExTGRDcTV1cFVsdE5oVUJuNzMwMmUxSDVuZHUvbnhGSEpD?=
 =?utf-8?B?RmxIWDhwUjUyNWxIWXpNcjRIWm8yY2p3RkRpVnFXVDgyUlpzK3FtbTcxTm5n?=
 =?utf-8?B?WDREUUlDOWZMbDVmMVc4M0xmY2ZmYThWcTZSVnZtd3hFektVTlFyVTZXK20r?=
 =?utf-8?B?M2xBTW4yRU1uaVVrcG9nNXBNQWlHMEU3bFp0OUFuRWE3ZzFrQm9HVkQ3S1Qy?=
 =?utf-8?B?ZkpEQzRKWXNMWWlJWU9NQTJMNjdoOVNlSmJFNStnMklEakp2eTFMTkVJcm1X?=
 =?utf-8?B?ZjhYU0d3RzYzUzk3UmdYb2ozazVwVEFHQ00xVFR2NVdTblRCZURmUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ffeee0-a28b-402c-6e3f-08df358a348f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 06:59:41.6888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Loj+bQvzRfTn9GZRd1enX973F+TEoMCn1z5BFZF8lgq9dzmeK8y4+Pk8kJKpnw4rMi6JTt6dznXq8ic77z27g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4409



On 10/28/26 07:35, Corey Smith wrote:
> [You don't often get email from corsmith@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> The HP Dragonfly Pro ONE (AMD Rembrandt, ACP PCI revision 0x60) has no
> working internal speakers under Linux.  Its speakers are two Realtek
> RT1316 SDCA amplifiers on SoundWire link 0 of the ACP SoundWire
> controller:
>
>    \_SB.PCI0.GP17.ACP.SDWC.SLV0.AF04  (_ADR 0x000030025D131601)
>    \_SB.PCI0.GP17.ACP.SDWC.SLV1.AF04  (_ADR 0x000031025D131601)
>
>    -> manufacturer 0x025D (Realtek), part 0x1316 (RT1316)
>    -> link 0, unique id 0/1, aggregated as one stereo "Speaker" endpoint
>
> None of the in-tree AMD ACP drivers can drive these amplifiers:
>
>    * snd_pci_acp6x (sound/soc/amd/yc) is the only driver that accepts the
>      ACP6x revision (0x60).  It implements the PDM/DMIC path only, so the
>      machine results in a capture-only card (pcmC1D0c) and the speakers
>      never appear.
>    * snd-pci-ps (sound/soc/amd/ps, ACP6.3/7.x) has the SoundWire manager,
>      SDW DMA and machine plumbing, but rejects revision 0x60.
>    * drivers/soundwire/amd_manager.c only knows the ACP6.3 and ACP7.x
>      register maps.
>    * sound/soc/amd/acp/amd-sdw-acpi.c only reads the modern
>      "mipi-sdw-manager-list" property; Rembrandt firmware uses the legacy
>      "mipi-sdw-master-list" name.
>
> This series makes the ACP6x SoundWire path usable and routes this board
> through it:
>
>    1-2   accept the ACP6x PCI revisions in the SoundWire manager driver
>    3-4   accept them in the Pink Sardine (ps) platform header and SDW DMA
>    5     add an ACP6x RT1316 machine table
>    6     add a FLAG_AMD_LEGACY_SDW DMI entry for board 8A7F so that
>          snd_pci_acp6x releases the device to snd-pci-ps
>    7     teach snd-pci-ps to probe the ACP6x SoundWire (and integrated PDM)
>          hardware
>    8     teach the generic amd_sdw machine driver about ACP6x
>    9     accept the legacy "mipi-sdw-master-list" property
>    10    harden the ACP interrupt path (fixes a boot panic found in
>          testing: the IRQ handler runs before the platform devices exist)
>    11    restore the legacy bus clock defaults when firmware omits the
>          MIPI DisCo clock properties (fixes a -22 SDW probe failure found
>          in testing)
>
> Assumptions that need hardware validation by the reporter:
>
>    * The ACP6x SoundWire manager and SDW DMA register blocks are register
>      compatible with ACP6.3 (the series reuses the ACP6.3 register maps and
>      stream/IRQ associations).  AMD shares the ACP_SW_* register
>      definitions between ACP6.3 and ACP7.0, which makes this plausible, but
>      it is not verified against a Rembrandt datasheet.
>    * The ACP6x SDW controller child is the device at _ADR 0x02 under the
>      ACP, and Rembrandt firmware does not describe the PDM controller
>      (DMIC) in ACPI, so the PDM path is enabled unconditionally for ACP6x.
>
> The series has been built and booted on the target machine; the ACP6x
> SoundWire controller is now probed.  The register-map assumptions above
> still need to be confirmed by actually playing audio.
++

RMB platform support is already present under sound/soc/amd/yc. Adding
RMB support directly under sound/soc/amd/ps without considering the
existing implementation may break functionality on existing platforms.

RMB also supports different audio I/O configurations, including HDA,
PDM and SoundWire, so this needs to be handled appropriately rather
than enabling the platform unconditionally in the PS driver.

Please run scripts/get_maintainer.pl on the patch series and include
the relevant ASoC/ALSA maintainers when resending the series.

Once the series is resent with the appropriate maintainers in Cc, I
will provide detailed review comments on the individual patches.


> Corey Smith (11):
>    soundwire: amd: add ACP6x PCI revision ids
>    soundwire: amd: support ACP6x SoundWire managers
>    ASoC: amd: ps: add ACP6x PCI revision ids
>    ASoC: amd: ps: support ACP6x in the SoundWire DMA driver
>    ASoC: amd: acp: add ACP6x (Rembrandt) SoundWire machine table
>    ASoC: amd: acp-config: route HP Dragonfly Pro ONE through the ACP6x
>      SDW stack
>    ASoC: amd: ps: probe the ACP6x SoundWire stack
>    ASoC: amd: acp: add ACP6x SoundWire quirks and machine support
>    soundwire: amd: accept the legacy mipi-sdw-master-list property
>    ASoC: amd: ps: harden the ACP interrupt path for ACP6x
>    soundwire: amd: provide defaults for the bus clock properties
>
>   drivers/soundwire/amd_manager.c         |  33 +++++++
>   include/linux/soundwire/sdw_amd.h       |   2 +
>   sound/soc/amd/acp-config.c              |  19 +++++
>   sound/soc/amd/acp/Makefile              |   2 +-
>   sound/soc/amd/acp/acp-sdw-legacy-mach.c |  20 +++++
>   sound/soc/amd/acp/amd-rmb-acpi-match.c  |  63 ++++++++++++++++
>   sound/soc/amd/acp/amd-sdw-acpi.c        |  15 +++-
>   sound/soc/amd/acp/soc_amd_sdw_common.h  |   2 +
>   sound/soc/amd/mach-config.h             |   7 ++
>   sound/soc/amd/ps/acp63.h                |   5 ++
>   sound/soc/amd/ps/pci-ps.c               | 129 ++++++++++++++++++++++++--------
>   sound/soc/amd/ps/ps-sdw-dma.c           |  12 ++-
>   12 files changed, 273 insertions(+), 36 deletions(-)
>   create mode 100644 sound/soc/amd/acp/amd-rmb-acpi-match.c

