Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A6D281525;
	Tue, 21 Apr 2026 19:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776799488; cv=fail; b=fgOcNxtz0jIzu8OdktpbZSK9L05hCR1ymtnqZx0sB0n+UHUOQAiUpKOPPg81o96fKM+1s7GywO35E2abIWoqA69Y/Tu3K46jXLjxS5kcly1KR2oOvmKJXZA6HSbVkNJiDOJdndEFH1vH/SDYTikkVklg08+jb1eIBYFozN1oOZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776799488; c=relaxed/simple;
	bh=ny07R8fN0y/eIe6KeygxKOLlwSVSd5zEP8r13soXhLo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tfkNonaQ/nchHTFmrPDz5411bTZGoWqh1JlFSVCAVDIags8Ji/xOzpSWIbDse72L3r987THGBi4/i8lD9fT8+1EIIg0MgnEpFYf44hnnyHdcQq/CQqwS0b9CwonAIoOLMW/P4Cy9dd/tbRDoKkh/aJs9HaanahzN0ZTPPCwGTwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=u0hk+gTl; arc=fail smtp.client-ip=52.101.62.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="u0hk+gTl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWI4HfUyMLyETQgI+OFfz3eEhmCUpJ6RuYSdCC8Hoz2ej3vfZFK2zUIfZT0mzKQBCpGdQ6Ykedt9bkdq7KAMCelb+xTxQB+XL6VSlEQeaIHRNbqAh9q9S1RfW0hsWM3PYbMD7CLxVBsis3o4hWwf1MJaFiUWzAgSfrGzm7x2yoqtshkPNXEB37boX25kqWcRGBr1mx2qqac++JlDly+d2EB+1MlYoGISmZek8vTGWOyuy96OhKVJIL0BK2meTt17fM1QRouHOfyl1Z5Z4z+YT0OQYIyQIHeFLccVL5218rja1fcD48m+66zg3M7Sn7jw6HVTLZ4kGb8sRmroqzluZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lte5FdUIqt9lB3L8mC9H0KSDyVAnwVImA2CjMyseFvE=;
 b=P8/RSj8rEPubwL/jtzP3x9pNwaj8Rz9IU45aZw+qp0I4bGHkxnt/TUgBIwWXl2GHHNMxJNXclSozgtHJwGx4tRKico5ik3eNwkeQdI/ASk7s04EwBl7TUi8gxhJbMjIh8cgqec9GOC9xuAHLrp5i//MvGlXxtGBH5hQklXM1GfaQMqz5oUv6QLCDRINSg2vISWd0pw/BnCsvXFzEmDgUnakEg0JofhRrLZdtEzXGDfxYxJaSy0kn/Z4ebSoZtvhvenh+MFFh32LGHONFmCaHjrZvNyb5nskUnJL53cMk/Z2wJj938Ujc0bOj1IVvYSWLf2IBNme8tmCsUsSLGBBFzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lte5FdUIqt9lB3L8mC9H0KSDyVAnwVImA2CjMyseFvE=;
 b=u0hk+gTlB9Az7kKB1xs2q7Y5paJim30a6fIvmBOCpB/ZRZ2EC4Pi5c5L4h3KwbBuysc/0mxKfqHyHDE0xpusJwKqAoMS+aOW5kOPaFm0+l05mvyy0Mj446nfrJb7VMjD+Oec0tQm3dv3Ietgz8oaPiZ4Ik8Ljel6exqxT+UUEDA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 19:24:42 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 19:24:42 +0000
Message-ID: <9fd92d17-12f7-4a49-9e64-7ffe8a87a081@amd.com>
Date: Tue, 21 Apr 2026 14:24:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: Add DMI quirk for Valve Steam Deck OLED
Content-Language: en-US
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-sound@vger.kernel.org
Cc: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Robert Beckett <bob.beckett@collabora.com>, Umang Jain <uajain@igalia.com>,
 Melissa Wen <mwen@igalia.com>
References: <20260421192214.77819-1-gpiccoli@igalia.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260421192214.77819-1-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0226.namprd04.prod.outlook.com
 (2603:10b6:806:127::21) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|DS0PR12MB8044:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ad9bf8-368f-42ba-a0f8-08de9fdba339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	L52+a+M4+HC3Wk6zZuF6UKHoG9Ahev1/EBshmfGHbHdTuLS5AlYdl7+yioSrMF+2IsAAhlS+sV2vWawNFCJ/vkP/mezd7vgYQBdhJubvSm9rJqbrjDrZFtnO4Cq1p2iSP0TBcSnqgF7J4Fr4lejOB/ZIIp869SJ1ihKjTDvbLZrdbxO7kjJ3WBzSmgOoIPO4EKIfFeDMv96+YhmYtjG9ZJoEOyfP/Y2kNSrnOmaEG2E+OqMHlEO5wP96vir9KVO0J9WG3mUe6qFXV5ARLYA8V0YVdYcO0RHLQnrwVMeZC6pNaD8SDv7ZIUYQCegUjgFTcYyr2peRAJ5Vg1oI4tBq/yv32cDpiF05sGkOgab1ze+qU+wIhHOgMlTq+doT4+a8hLp3ZPmCxduC1g/81HoeXLuChXljDEsVuXMm0BZmoa1QdN5BDvrDXsOi/9+wymB7XOnnArxkljpzSFXwzoQpVRGWNQb2zkoPLA9lLam1jjz+W4+bRMpQtmMMsfVApPBEbxUyun7Q9qS9ZegwcKwAUAvrxArvCNwymM9yVdgTkSZJ8znYjyMFp283kwtjYhU6tpLvRM3RuFsjEI7wIbrgL10mI/OYbNjqbPrRNaxVUBeqqCDbL+ZmzkJtJSA0R9iioonlV8JNwj4NGRcbGAn3pucntKYz/skfJ4bVixY8zGqomqG284Jg3iLg8ZcVv4OooORDjitiz5V0kwhXq6YR3L5kE2kySLWF6S7OfPCSwAr8pwJTmrqtkBs2QtkDBVxo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUwyS1VRc3dVQ3ZzZGhXT3ZjWkxyY1JHbVlNeHZGV3BDVkQxangzd3NvelQ4?=
 =?utf-8?B?ejJxSjhRQnRXOG5xSWtiNXRkdzJYelY5UU9ncG80T0ZEckpWSHBBL251S1U2?=
 =?utf-8?B?b3ZENUFzcXc4Uk1SWm5ETjZ6VE1pR1d3ekp0eTJYbWp5MW1lRXZIZVFac2xJ?=
 =?utf-8?B?OE5UUW5Dby9LNDVSUVE0RW0reVBrcG9ST2lxU2tndEk5UXFyU3R0a1l1cW01?=
 =?utf-8?B?VCtDaDRza1c4bVduZjdJK2RFbXlGTmE4bnFZcmFYSys4dEtKNFU1NzI4QVZD?=
 =?utf-8?B?VWZmbEhVNExkSlQwVVpiQVBXdzltOHk1RWZvSFI2OXVwZTZ1bjl5SWtSdkVO?=
 =?utf-8?B?djNONmVaNHlpR29mR1hTNXRsQTZiWThLcmpuQUxURHMzaDVjSFRJWjhkZGVw?=
 =?utf-8?B?TjFpcFd5U3ZzbGxhSC9jVVFkMW43MElXSUlVUDZSNGFYR2RuRHR6M1dUNEcz?=
 =?utf-8?B?cUhRdm1RMXdMNlRNckVqaElrczYzOCs3WUJCVlQ0bUEyK3FHS1dnU0FHOW5Q?=
 =?utf-8?B?K0d3NEpIVjZjT0NJMElEZXJkSWpHRVk4U3lvSkRIOHY0R0p6L2h5eVg3SmJp?=
 =?utf-8?B?TVZjRG40eUpEdjBuM0c4endHMFlraHUybExMRmNjcHRQSXpNd2c3UU1FU2V5?=
 =?utf-8?B?SmlLQnNvRXBaWi9yZ1JFUEJ0TVY5bU9KdjFkbXZZWTcyamVIZWdnSXdhdG9W?=
 =?utf-8?B?YXdad2h3ZGJ5N3ZHczhKTFd3bGRoclpFbXgrM0xCWVBSVXJLeTRHZVRucnRJ?=
 =?utf-8?B?VzJTNlczMWU2Q0tBUEFVckFxWE9rM0dDL2tTS01ldVZPVXpJZjRMYWFzM3U5?=
 =?utf-8?B?c3kvYmJWMWF0Q1ZZbUZ4YjJnWUpLRU83d2JTU1VvUS9ZSjlYVWRMRE1UM0Nw?=
 =?utf-8?B?V2cyWElIdWpJc0tpZ3kyZXBXUFFXV2xxUVA2UFRsSU1BL0F4cHdCc3B0TWdz?=
 =?utf-8?B?RkcyQTdxbVRJWUxRYmwzaWxNQjdUTFY2VG1IQzVkM0VCeS9laHlleHM2OWJY?=
 =?utf-8?B?Z1lUK3U1emFiaDZ2TFpnekMwL3dPU0FrQVJhTUtGNHRqRUZ4L2NjQVFsRkJD?=
 =?utf-8?B?OWZxR1AxYko3alNYUkI2K0V4b0x4NG9NL3N3Ujdoc1Zkc3R3VVluclFzWHBB?=
 =?utf-8?B?MnlVT0ZkdnE5M0R3UUdzV0IwWXY3VVhiempEb0lEZ1ZVcTg0K1NZY2JQN01u?=
 =?utf-8?B?SXZ2QStOcDBsSmo3Z0RKS1diZlM3SkdNWGxGcVhzajJwOTZDL1R2bE9vVnc0?=
 =?utf-8?B?S0ovWlVXakdOOHIyemd6TFl1U2kxR2JOZXB3czRqRXpHTk9zSmQ5RXBsTnRu?=
 =?utf-8?B?RFdUTWQwNFAyQzJQWTlYY25TaEMrTS9lV1hubktxeXpwdEUrTm1sNVBBbCs1?=
 =?utf-8?B?M0Yxd0hpb3QzTUc3Q1dGR2FBUTJuaGVFeXdJYUdPUkNFL2RGYlkzMXdPaHRv?=
 =?utf-8?B?Ukx5bmF6ZlE0OWJSUjJNR0lJTmZJUEVxR1BIcVpwWFkrYXdsNVlwTHR4VHM4?=
 =?utf-8?B?a3ZPRE1yQWUxb0NNY2JXUUl3M1Y2RUFobVFNNEVZdVRBTElaazc4SVlCZ0Rz?=
 =?utf-8?B?b1ZOQjZ5QVJLVUkrSm9nRnM2SVNTUlJVeTRGUHZFWDVvRHQ2ejY2d1Bzc203?=
 =?utf-8?B?Nm1UOGo3TkplZzFkODN4emlwMDF0OFdQS3BCb2FTVEpkREhqTFJMcFJ2Z3ZY?=
 =?utf-8?B?YkNsc3l1UTQxU3h2S2pZdC84VnB1cEtjMFVmRGNRLzdUVExKRkhDNFp3cWFM?=
 =?utf-8?B?N0NmcGw0QzhmZkFJMjZJUGRlanNmc0lJQnZxQU9HOG12VER1RWpRRW1tRHhZ?=
 =?utf-8?B?YW9rcFUvUlpGMVVKRXQycVNVYW9JME1PL2tNQ0N2RmNvWHEwR3FxQ1NmNzZx?=
 =?utf-8?B?aGlRUWwrVStiL0d5VThveDAwK0pxZVlER2xhV2EwWnMwaWlVRGFVRGh5MlNk?=
 =?utf-8?B?WnoyVUt0VkN4RW5OVUpyYWdzRXZYVTZKRlJReS94bDFlb0dpblpMSnZLcVZs?=
 =?utf-8?B?a09OckZKY1FRdzNySklpbjgwLy9QNGlMc09RVnhVS1BDdkFmNVFKSTE1Zm9q?=
 =?utf-8?B?Nm04MEFUamlDbGRlaExwNGFmZHRIWTRBS2x5czI3QXJEdGlGV2d5QlQwbi9G?=
 =?utf-8?B?aGhqeVoyM2pRSEFtUy9uL3hHTjgzMklsRWlwOXVVNVd2dkRkK0JHUGtFUXBW?=
 =?utf-8?B?c1RpbU5WV3c0TUpjZGFVWEVrNkZYYWxsVlNISVhCMWljeGM5U2hIWkhNcys4?=
 =?utf-8?B?aUNDOWNiWFR0YTZrS2NmRSsySDZDOXR2TnhaOXc1ZkpLbVpCajJEZGJvWnor?=
 =?utf-8?Q?WSMzixyDRteBT+VNxK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ad9bf8-368f-42ba-a0f8-08de9fdba339
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 19:24:42.0696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldUvDIhz150FwUmXccBi8Rcf4i3FCyAXKNdrlcW5o71KthRGAPAgtuEkpSyaZVw4cSA3tQVNSTq3ZLotXtKfYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8044



On 4/21/26 14:17, Guilherme G. Piccoli wrote:
> Commit 671dd2ffbd8b ("ASoC: amd: acp: Add new cpu dai and dailink creation for I2S BT instance")
> introduced a change that "broke" Steam Deck's audio probe, in the OLED
> model, as observed in the following dmesg snippet:
> 
> [...]
> snd_sof_amd_vangogh 0000:04:00.5: Topology: ABI 3:26:0 Kernel ABI 3:23:1
> sof_mach nau8821-max: ASoC: physical link acp-bt-codec (id 2) not exist
> sof_mach nau8821-max: ASoC: topology: could not load header: -22
> snd_sof_amd_vangogh 0000:04:00.5: tplg amd/sof-tplg/sof-vangogh-nau8821-max.tplg component load failed -22
> snd_sof_amd_vangogh 0000:04:00.5: error: failed to load DSP topology -22
> snd_sof_amd_vangogh 0000:04:00.5: ASoC error (-22): at snd_soc_component_probe() on 0000:04:00.5
> sof_mach nau8821-max: ASoC: failed to instantiate card -22
> sof_mach nau8821-max: error -EINVAL: Failed to register card(sof-nau8821-max)
> sof_mach nau8821-max: probe with driver sof_mach failed with error -22
> [...]
> 
> Notice the quotes in "broke": it's not really a bug in such commit,
> but instead a problem with a topology file from Steam Deck OLED. This
> was discussed to great extent in [1], and Cristian proposed a pretty
> simple and functional change that resolved the issue for the Deck's
> issue. That change, though, would break other devices, so it wasn't
> accepted upstream. And the proper suggested solution (fix the topology)
> was never implemented, so Valve's kernel (and anyone that wants to boot
> the mainline on Steam Deck OLED) is carrying that fix downstream.
> 
> So, we propose hereby a different approach: a DMI quirk, as many already
> present in the sound drivers, to address this issue solely on Steam Deck
> OLED, not breaking other devices and as a bonus, allowing simple patch
> up in case eventually the topology file gets fixed (we'd just need to
> check against any DMI info reflecting that or the topology/FW versions).
> 
> The motivation of such upstream quirk is related to users that want
> to test latest kernel trees on their devices and get no only non-working
> sound device, but seems some games (like Ori and the Blind Forest)
> can't properly work without a proper functional audio device.
> Example of such report can be seen at [2].
> 
> Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Robert Beckett <bob.beckett@collabora.com>
> Cc: Umang Jain <uajain@igalia.com>
> Fixes: 671dd2ffbd8b ("ASoC: amd: acp: Add new cpu dai and dailink creation for I2S BT instance")
> Link: https://lore.kernel.org/r/20231209205351.880797-11-cristian.ciocaltea@collabora.com/ [1]
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218677 [2]
> Tested-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> 
> Hey folks, thanks in advance for reviews / suggestions!
> Would like to specially thank Melissa and Umang for testing and early
> internal review, and then Bob and Mario for another round of internal
> review, leading to good suggestions like improvements in the commit
> message and the name of the quirk itself, a simple one compared to
> the early name I chose first heh
> 
> cheers,
> 
> 
> Guilherme
> 
> 
>   sound/soc/amd/acp/acp-legacy-mach.c |  2 +-
>   sound/soc/amd/acp/acp-mach-common.c | 20 ++++++++++++++++++--
>   sound/soc/amd/acp/acp-mach.h        |  4 ++++
>   sound/soc/amd/acp/acp-sof-mach.c    |  2 +-
>   4 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/amd/acp/acp-legacy-mach.c b/sound/soc/amd/acp/acp-legacy-mach.c
> index a7a551366a40..fccaae99e150 100644
> --- a/sound/soc/amd/acp/acp-legacy-mach.c
> +++ b/sound/soc/amd/acp/acp-legacy-mach.c
> @@ -174,7 +174,7 @@ static int acp_asoc_probe(struct platform_device *pdev)
>   		acp_card_drvdata->acp_rev = mach->mach_params.subsystem_rev;
>   
>   	dmi_id = dmi_first_match(acp_quirk_table);
> -	if (dmi_id && dmi_id->driver_data)
> +	if (dmi_id && dmi_id->driver_data == (void *)TDM_MODE_ENABLE)
>   		acp_card_drvdata->tdm_mode = dmi_id->driver_data;
>   
>   	ret = acp_legacy_dai_links_create(card);
> diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
> index 09f6c9a2c041..f42c07249af4 100644
> --- a/sound/soc/amd/acp/acp-mach-common.c
> +++ b/sound/soc/amd/acp/acp-mach-common.c
> @@ -20,6 +20,7 @@
>   #include <sound/soc.h>
>   #include <linux/input.h>
>   #include <linux/module.h>
> +#include <linux/dmi.h>
>   
>   #include "../../codecs/rt5682.h"
>   #include "../../codecs/rt1019.h"
> @@ -37,8 +38,6 @@
>   #define NAU8821_FREQ_OUT	12288000
>   #define MAX98388_CODEC_DAI	"max98388-aif1"
>   
> -#define TDM_MODE_ENABLE 1
> -
>   const struct dmi_system_id acp_quirk_table[] = {
>   	{
>   		/* Google skyrim proto-0 */
> @@ -47,6 +46,14 @@ const struct dmi_system_id acp_quirk_table[] = {
>   		},
>   		.driver_data = (void *)TDM_MODE_ENABLE,
>   	},
> +	{
> +		/* Valve Steam Deck OLED */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Valve"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Galileo"),
> +		},
> +		.driver_data = (void *)REMAP_DMIC_BT,
> +	},
>   	{}
>   };
>   EXPORT_SYMBOL_GPL(acp_quirk_table);
> @@ -1401,6 +1408,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
>   	struct snd_soc_dai_link *links;
>   	struct device *dev = card->dev;
>   	struct acp_card_drvdata *drv_data = card->drvdata;
> +	const struct dmi_system_id *dmi_id = dmi_first_match(acp_quirk_table);
>   	int i = 0, num_links = 0;
>   
>   	if (drv_data->hs_cpu_id)
> @@ -1572,6 +1580,9 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
>   			links[i].codecs = &snd_soc_dummy_dlc;
>   			links[i].num_codecs = 1;
>   		}
> +
> +		if (dmi_id && dmi_id->driver_data == (void *)REMAP_DMIC_BT)
> +			links[i].id = DMIC_BE_ID;
>   		i++;
>   	}
>   
> @@ -1587,6 +1598,11 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
>   		links[i].capture_only = 1;
>   		links[i].nonatomic = true;
>   		links[i].no_pcm = 1;
> +
> +		if (dmi_id && dmi_id->driver_data == (void *)REMAP_DMIC_BT) {
> +			links[i].id = BT_BE_ID;
> +			dev_dbg(dev, "quirk REMAP_DMIC_BT enabled\n");
> +		}
>   	}
>   
>   	card->dai_link = links;
> diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
> index f94c30c20f20..edf5e479afd4 100644
> --- a/sound/soc/amd/acp/acp-mach.h
> +++ b/sound/soc/amd/acp/acp-mach.h
> @@ -26,6 +26,10 @@
>   
>   #define acp_get_drvdata(card) ((struct acp_card_drvdata *)(card)->drvdata)
>   
> +/* List of DMI quirks - check acp-mach-common.c for usage. */
> +#define TDM_MODE_ENABLE 1
> +#define REMAP_DMIC_BT 2
> +
>   enum be_id {
>   	HEADSET_BE_ID = 0,
>   	AMP_BE_ID,
> diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
> index 6215e31ecedd..018e4f28a02b 100644
> --- a/sound/soc/amd/acp/acp-sof-mach.c
> +++ b/sound/soc/amd/acp/acp-sof-mach.c
> @@ -110,7 +110,7 @@ static int acp_sof_probe(struct platform_device *pdev)
>   
>   	acp_card_drvdata = card->drvdata;
>   	dmi_id = dmi_first_match(acp_quirk_table);
> -	if (dmi_id && dmi_id->driver_data)
> +	if (dmi_id && dmi_id->driver_data == (void *)TDM_MODE_ENABLE)
>   		acp_card_drvdata->tdm_mode = dmi_id->driver_data;
>   
>   	acp_card_drvdata->acp_rev = mach->mach_params.subsystem_rev;

