Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011008.outbound.protection.outlook.com [52.101.62.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD151E885A;
	Mon, 22 Dec 2025 07:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766390266; cv=fail; b=GJP3Tw9W4AwFgLTnL8/RDfpl4fuIUrcTx9AlXCYQsDNHkmq3jxCoeYO00hqJjGoZzgMNwuzTTK6JIRXaO8w70BG55O7Hxu9Y7fEIHZ3vFb2DYc5TLat5konn5P42uZFGrDweKkmT0MgIUJOqr+so6raoeQoK8sivC3bqUq29tNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766390266; c=relaxed/simple;
	bh=5S1TahzbrlMpo9pA6mfeEq9VZ8OLbzw478m3g30rTG4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uZrrMRKeEk/f8OLeqNv23Q5KkMRtJlCw08Gp7KjEw+VMDZ5C0K64huHeJLcQ1NW3f4uNzQ1LpU7c/kAakTu5PN2MjK22QUsNMzVwfWbfZBn81GyYbMlfwctHtR/uivzBi92Bmoa4FD6feipSpBh9D7wTGpkYVGoip9IJRMnDN/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jpIxrTjX; arc=fail smtp.client-ip=52.101.62.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jpIxrTjX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWGiSiLJ926xg+OTrTaCtgBXBhzDHl4N/7ku01irmJPQ0DalVBHMnAaChQEBSjEPlvpbAEd2It9hMcNdqEY0y38V1CVx7X3E6JUodsU+umMU7Q/qAB8+CAtfCwA3uja9wRuhygXwAWCDRug962Oa4tnLAmdvQoVbpW9M3oIvqRnY9XTllnF0hqUY3lziHCWHQSShqE93XYi7p98dnPl5av/xO19hua8QyXoXzA8hscbmJsRN7/P0C45zb81XIQvbVFY3IVuXAcECwFAd2fJnNxq2osTuaaUDuu0Gx6TQbbLW0aO0l2AyLNfInW7R+jL11+izLEvRv9HzrrqHWoCrSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hV0PVx0KiYGg73hkqXBI94E8rZOyK5U0oK9+Vz3jlfA=;
 b=n/4VvpHoBuAi4g1hTjaxoS4bgD72DSbeqbhdG5FvgjK+1G5brYf4v0V2jFIHlHIWpoCDcLe+qRqxzQvXTi/r5jpwaTeNNTlk+okXI34VyqPaT+qzM1VS/4YpkE2J4Nbtm9lcHgmWC16txJ4duq3tPY3+Gmt+AjxOZ2VDXvbUBkV6IV7UXDwM69gT7Q4SS4bQBvsm1LoJmJWJvdITsbf27ce4Igj/DRWsWJdvkD1F2wgaVcVan5/tL+j3cy8pTGUTTDs3ZNuooXK05nyhxtHrBnZhXh79z7lQ5YoB7zt3oAOBszHGi04iA8meG0LwvDEltePbLebJ9Z2kHFzbOBDoMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hV0PVx0KiYGg73hkqXBI94E8rZOyK5U0oK9+Vz3jlfA=;
 b=jpIxrTjXEbKcZPYik+Gcwb7064PVQF2YuSiB1k+1NXRxSY+eetTqEbS+UwSzziMNumOZS1UVF7GFel59OITAON4tEhu/Xxdq5RcpmKzMB06kGitVstIWod4wur7HP1iND6bRbzuQrgpnzzfwVqxG9SQPOKBw2oKOe9xZM/hLRJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 DS7PR12MB5959.namprd12.prod.outlook.com (2603:10b6:8:7e::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.11; Mon, 22 Dec 2025 07:57:43 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::5c31:b454:e529:99f]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::5c31:b454:e529:99f%6]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 07:57:42 +0000
Message-ID: <890c81e6-e950-43f2-8fd4-2b2e794367ce@amd.com>
Date: Mon, 22 Dec 2025 13:27:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] soundwire: amd: refactor clock init sequence and
Content-Language: en-US
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251222074847.7270-1-Vijendar.Mukunda@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20251222074847.7270-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::9) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|DS7PR12MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: f6cce08b-c611-4447-f4e2-08de412fc90c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkZEeDVsTVBBanBIeFhaTFpmRVY0Q0FmTjJucXBkcVlNZUpiMmhUZDk4YWNH?=
 =?utf-8?B?S09JdkxVajlLbXU0Vmd1cmp4T0t1OThUZmpXK0NGN3IxMUxxVU5saFBzUnNj?=
 =?utf-8?B?TE1TL2dPK2ZmY1F0eWoxNThVaDlTRWtaQWJNQk4vM2lqYUJWZC9zb2wzemR1?=
 =?utf-8?B?blJ6MW5MYW50SUxsbU5vRGdyQUJKR2VBSlp1em9CbmVPV0JVVmJ6R0NuR2Rn?=
 =?utf-8?B?TU50MUxCT2Rhb0RlNXcvVmhEWkRhL2RtYWNLTmVjbzNrajY3bW9uaHk2SzBB?=
 =?utf-8?B?dlAycEdEQzMwOTZsdGFITXFkTFV0S1FHUGFuUWFiRHNhZWFOeVVEMkovSWJn?=
 =?utf-8?B?ZUs5SnlQM1NXc0x2VVIrenZPSmVabUtDVUlMOTBPdmVLZmlpczgra3lLRmRv?=
 =?utf-8?B?cmUybXBxOVBGRmdRWTl3dWdxcE5jdmEybndtTkp1SVVzZFBVeDM0cnZQYnZ2?=
 =?utf-8?B?WTBOQUd5MjB4OUpmTmNLV1MyV0ptdjBZRS9KT21NMWwySERZYnBlSktDVS8v?=
 =?utf-8?B?SmYxMVNmbW4rSHlNV3ZVdlRPTWhaQXA0U0hCYTZHTmpDTFA3Y2J1SFA3T08y?=
 =?utf-8?B?S3U5aGFoRjZjY2twMEtnZjlPWWp3Zm1oVVBhMEhtTnpubmdwRlBNWmNqeFpu?=
 =?utf-8?B?SjhkK1JIaW9wclNNNFhoM2FSQXZuMzFMaVc3U2dLdmJ0cytJK01Vd21xcVcy?=
 =?utf-8?B?MnQ2dE42VHFuOTQ2UzZqaGtwUXkxdlpKdTYzUnp2U3NVcm9wSnMwV3NSak53?=
 =?utf-8?B?OW5WRlRTb2Q4NjhIeFBZVWwrN3FvSVJlSGFteFJNdEl3Wlo4ZDd4M25zbWRN?=
 =?utf-8?B?S0I5ZlVTc2d2WmZlcndUUy9rb2I5UDJKT0JuSEtobWFrcnlFRGNLVXVLL25K?=
 =?utf-8?B?RkpmTERENkFpOG1zaVN6dHJMWGp1SzA0bVJEc3FGTjFzcXRVYlB0aUdSM09P?=
 =?utf-8?B?QlRlMFp5Y1FBb0l3a0I3aG5uNTFZdEhHUldxa1UzMG5OT08rTlZKdTB2NzZi?=
 =?utf-8?B?QnJMcVpxS3RuRHQxeExJRGFueDlqZTlvem1jeVJIUU80ZzB4dkRKOEtONnli?=
 =?utf-8?B?QjFwTk1CRzRkZ1MrOFVjVDkzZ1pyNmtmZXFyc1R4VTVzY0k4T0JPSkdKcFhI?=
 =?utf-8?B?WHdYVjMyRzRlbmhhRk03QTNvUDlTVnlWNnk1ZWVWQktWYkh3V3ZhbWRoNC9Q?=
 =?utf-8?B?NFBpaElZRVR6WGFBTkp0QXFtV3JQZHFvQXF6cm5xNDJRdklYbm5wejl3NVk1?=
 =?utf-8?B?UXRQTEZZRTVoWlhlMlZUSHd4d3hHejlrNlg4dVBOTGRGKzZqRlhvWWtWallG?=
 =?utf-8?B?TGpFaG4vVys0M1Rwc1cxRkVjRGpvU0RhMUlKcENRMkVaL0NESHpOREliNlI0?=
 =?utf-8?B?cVpFT1ZJQjA1MXV0NlZXVktCZFFBbU1oTTJYWXQ1Y1Vqb3g5YU9DNHlYUDdl?=
 =?utf-8?B?L0xkRUpyZjVxUUJ4NnlEeWt1U1d4MFNZR0Y0TWE2NkFRMDlGeVc1V2NTQ1Nh?=
 =?utf-8?B?NFhXbW5jQnlDeG1mcWk1R1NGS3NaTTlsWXBESGY2NVUyekdzMHRMNUl0Slov?=
 =?utf-8?B?SDdIYnBJNkNSZ3ZSblVETk1td1lqUStaVEs4OHFWNXdUT2NQTjBZUU12UHFW?=
 =?utf-8?B?YVJlVnh6d0RCZi9jWnN4RFpGMnVka0RjOTFvRXY3ZkxqTTJJWVJwY1M3cCsv?=
 =?utf-8?B?RDFCZ0ZKZm05RFRZRmhlY3cwek4wRHE0aGdxNjhnemlOM3hYRjVVdHFHa2ww?=
 =?utf-8?B?S3B5RWttRDNJU3hzSW4ydzZyUHJrNHcxKyt3NjA4MXJFUWZjeks0SEdqODE4?=
 =?utf-8?B?eXU5QjRQU3BLSXVMb0xDd3JVWi9mNnQwVHQrRGdLczcyL2swZmY5WFZLZnhD?=
 =?utf-8?B?ZjRBcnpnWTZWazN0TlVtcks5d2d0Q2p2UW1BMzZweFFiNUpxa1A2Z2JCYlhp?=
 =?utf-8?Q?N/5AOq4OyctRx+JayuYJ18qTLJlV1Wsd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWhDVFNwWWFacjZJNjBrWitaejYweXN2UEIwZ2NYVmhQbHlZR3h3S3VtQTBE?=
 =?utf-8?B?VXhVcFhNK2NNVjZueGhIR2ZwOW96MzFNeUI1cmFXMEhzMU9EYzhBZXBHMk5S?=
 =?utf-8?B?NlFCNnVFMGtZT2s0S0Jibm1VOTJja1k5L29Wcmg3WndlbmJYSzE2RjBUZWM4?=
 =?utf-8?B?Qk1UWVh2cXNiU1U2WDJrelFOUlEzbHZmVGxtajJCYUcwZC9ML1UyOG9RUnZT?=
 =?utf-8?B?VlBNMk45djZLMkd5VGxybVhmWXVEeXVwSmhrN0R6SlhmY3dtUzcyYkNQOVlL?=
 =?utf-8?B?VHRYVWYyTEpUTDlwVERscG5pVjRPU1drUGN1aWdDWGc3VjF0Z1FKYkpDZWhx?=
 =?utf-8?B?YWpMS3lGYzZRY1RKczN6cDM3dHdMWVN2Rks2TGpGd1BFQm9CYnFjRjhzWXJx?=
 =?utf-8?B?UURIc3FwNHp6N2p6M0l5elhoT1VPNElYcWdOcUJiOVlvbDNDQWhtbitRb3U5?=
 =?utf-8?B?Vkx4SG93TWpHSityeFRPdjRDZzRWYXNzVWt3UUVJM0E2anNUZEhsUkZPYmV6?=
 =?utf-8?B?alh4Tnd4OHlRL1owMUcxMDJMcUpNbDd0blRleTFZM25XbGNNWlJ1L2M3R2Nl?=
 =?utf-8?B?ZUtKc2dnUXZSVlJmS3FIak0rNXl4UVpZYkhwcXFwakZHeEJXMXpZbHk4cUhi?=
 =?utf-8?B?Wm05ZlpUMEpQQUIzTmFwM243a1RuTHRTTUJYRUs3V25pUlFNUlFiMmVWRGdU?=
 =?utf-8?B?QlBmdnU1dVp1V25aMkdJZ0Fia0dlQU1mM05PRGVIaVgxWTgzcnJ2ZmsxSmV3?=
 =?utf-8?B?N3NrMEtEV3FCcS9ic01Pdkd6VVFXczFWOE00TCs3SWxReVhvUHFveWZVaCtq?=
 =?utf-8?B?S3ZtRjUwYXhVK0J6NzBiUWNONzhiS0ZJV2M4alErem1yN3c5cE8xT1Zkc0Zt?=
 =?utf-8?B?OTN6Y3BERkJTMm1VdFFYNnB1VHh6dkFPeTBwS3E1Y2thNXAwWTR1OUQ4NGVp?=
 =?utf-8?B?RFJNRERkWERoMVZMbUtyaWlNZUlka0t4cERyNTIwN1RhUFh5cGllMU5oa3Za?=
 =?utf-8?B?VmNSUU83QmVVN3BuNmM4UEFvNHZCTTVoSytWMGZVd3dJcENsdnNBSGFpNFAy?=
 =?utf-8?B?dFZxMld5VkJQT2F4RnhXNkRleUN0SWYwQ0Y4S0tRUzFQL0cwSDJVbnBIRHJB?=
 =?utf-8?B?S1JNOGtvbUxxTkE2MWdySWRNTHd6Z2RSOFl5RlYwN2g5Vklob2Vac2VOREsx?=
 =?utf-8?B?aFRURjNWckxMTUJJd1d2OFVCNW85bUtyZXQrMkpPOXZXZ0p3eEpadzlFbVE3?=
 =?utf-8?B?YmcvODVNcyt0dU9Ob1NEQkV1SmFnY1RhNnlHRnUvUFNYUmUvYURiYWVTdTgw?=
 =?utf-8?B?cWgxajdielZiQkw1dE5sdWI0MjVaZ2Z6RmxjSzlhaVYwcmV3dHpneE1JR3pU?=
 =?utf-8?B?c2RKY3R1d3JlUHUzRi8xeVdJekk0cmFZeXJPbm9mYUJqZkREc0JZcnBIemVY?=
 =?utf-8?B?K0xOZmNRekZ5eHJBUk9LS2ljczFuUXp6YTBVUU1GKzJyMkpCeFNTQWNVOTVt?=
 =?utf-8?B?Q0gzZFlPd2NvVThEczkvZVlpK2NVbXRWcG4rWjlTLzVVNlRXN3B3QVBpWGIx?=
 =?utf-8?B?UkFSM3o3VGErc3VObnFQSTJYbVpQdEtxU0hxWVNZVnNvWFdjR1hwNkNGTHNY?=
 =?utf-8?B?QXUxa09BRXpsRG9qQzdMNmxlckE2cHhFTnAwNWliMTJZZmFxK2kvUnRaeUpS?=
 =?utf-8?B?d2tMNHV1UFErTXYxd3NjeVRnWkFjcTdsRWlhN1hPcUJnd0dOdGZxNUVZNTZZ?=
 =?utf-8?B?VDhlbVY5ZTdyTG16RkpacU1YdWFkZ3VXNldBNWNRMVRmSy9WT2k2N3h5RlAy?=
 =?utf-8?B?dGlNTmZOTVNHQ3ZWNGc0WldhNSszMGhjTkk0SEF1Y2hzQ1Z5RjBCY3ZxZStZ?=
 =?utf-8?B?WjFQcVlCc0RqT3o2L1NONktidU1TOWhkSit2M2dBdUY1VmJtUUh1UVZ4UEtr?=
 =?utf-8?B?R3luV2Z3TDRoajROdktuQ3NpRnVWeHdqUnhiby9zdm5vbWhFd0FhbWhhUlZw?=
 =?utf-8?B?SDROTW1pcWdCakZGYk02WFI1SExlNTJTV01xeVB1RkNZT1cyR1ZhczA0aHMv?=
 =?utf-8?B?Q1ZRTS8xRG4wcldQMFREdmJBVTBrUk5iQlRFakRldWdXYTVya0FCbFM1YXFt?=
 =?utf-8?B?aDJMbDQ1MlpKZmc1MnE5YjBoNk5yYTlkRC9jdVBoeDlZcHpnMklpaXhvT25p?=
 =?utf-8?B?YnUvUUs4eEFVWHYvQVJlaW5ReVUxQlZJUGxnZ05ncTNxLzd3NGtTWUNGNWNN?=
 =?utf-8?B?WHZaMnh6YkJ6clVaVnkrZ0pzZElOTHBDZDI4MUlzQTh3cTdDMW04TExlalJ6?=
 =?utf-8?B?WElyZklHeU1HZGdqRG5GWnlqOE9OSDJOKzc1U212d0JCTTUyQ0UwZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6cce08b-c611-4447-f4e2-08de412fc90c
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 07:57:42.8688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Mm2puusO4WSSHZj+Ike6VFd3aRuVjD+nnhe5gMdo1+8acoMDoy0BWfr3DcU6/f1iZ+3onb4vO4DEv6GuQ31Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5959

On 22/12/25 13:18, Vijendar Mukunda wrote:
> Refactor clock init sequence to support different bus clock frequencies
> other than 12Mhz. Modify the bandwidth calculation logic to support 12Mhz,
> 6Mhz with different frame sizes.
>
> Vijendar Mukunda (2):
>   soundwire: amd: add clock init control function
>   soundwire: amd: refactor bandwidth calculaiton logic
>
>  drivers/soundwire/amd_manager.c   | 108 +++++++++++++++++++++++++++---
>  drivers/soundwire/amd_manager.h   |   4 --
>  include/linux/soundwire/sdw_amd.h |   4 ++
>  3 files changed, 101 insertions(+), 15 deletions(-)
>
Cover letter title is discarded. Will update the cover letter title and
resend the patch series in the next spin.
