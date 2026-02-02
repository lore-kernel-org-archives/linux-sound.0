Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013041.outbound.protection.outlook.com [40.107.201.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D843859E4;
	Mon,  2 Feb 2026 17:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770053113; cv=fail; b=H3e6Hcq2RL5AqpdAqYPYcveW6rpNE4WZKfkm+PXNC/+MXnM+37i7b15zAClmALIrcYYORmsmnmtjfy0GStVkY/RVq9tmrEJUmr7mGffTRxxUN4I1SpgaJrzOXkSEAn7uth4y/ea3nAvj34KgLUPEiXp0fM0lRYWsqZO4nPTlnHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770053113; c=relaxed/simple;
	bh=NHpsEORcDTDWSQujV7bfoydUAxisFlntNGCe8V2kp+w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=czNuuX0y7JDU2yEDUgAv+b8/oAydzsfjW8u52cTlUUCyLxcwG3rxPzt758K66zr+UnnNxrYJ+uE1hRVWicRPKwdv0zEvG1w5z21Y8tG6ZtvueAr1Ry8ZWuZGbwA0eZJOmLIGurMGVYPRIEYVlThaaX5UYIlRIncMcwbYlWXGeXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZJv9lN7F; arc=fail smtp.client-ip=40.107.201.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZJv9lN7F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUSMxHgv2wVSx0Toz1guAlwhkVjdGZVFZtHtsTQq6ONSdUeq2Bn5bekBsCtys1qm3XW06RhbAwP8IOLBllYJgKjETh1jYUVMghM42VMh4QhVJNTATxJ0O2dil7tIxkOmVOPzmKL61CcG0P35dnB/MtynarFCeZYTxvYRWm7Jc5pNr2IXhY4nph1ZdfNKWWAVme1/dtlih305VGSbNFxwAhZ14XscNBUTx7nN/Jsdx3aIFuJJqy+xbMpjZKyRGGGoMrYmJli+ShEBkiXJ08vQUDVg5NRXsCwo/T/L7Fot8JTSQOAPXXoMPB4jdoTryF033e5z+uvPFCf/TpUTDDZ1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQpZn1NQ6IQXv4XPu90YK+/W0M/DCq6YEhDdJtm8st0=;
 b=aoSIw2ser2FQVAx/vTS9kOIX8jknYW72mvux3293lqFWJw9Okdr1gQ+kyEGZIPaFWM3x3CYv1G5gktv3Exkos+n56JQplm8xuc1lwwT81rA3F1Z2nTiuYLSP6kR1F3IHT3vAaTdiouWWpv9BXsQTLLtMZIH7Zfu1NlV/ohq29e0qXak3o/jfnGadihrFCDzgct3jM3ggY3DiUMl/qDWs/4NjFF1lQ4pxiNwDWGArbmrrTmMma5iAH5xFrgmwO30QSd/C7jFstWGvEo1YGGNK1iTsQqh68fMniavFK6je1OT2AbHyas9F+tV4GfudTT9rvD8JzMkuCxjrgh3wp0Rutg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQpZn1NQ6IQXv4XPu90YK+/W0M/DCq6YEhDdJtm8st0=;
 b=ZJv9lN7F7TDdKp9tA7IgJ8I/sQ1ICtVO2jNvsQ+k5zQDrKaGScjVLKsdjTVxfEISurH6e5OZJPaGerD604ElSBWRX4grWbfE15X5VaxZNOApnSLQbgUywctYdkli/a54fijHnHpHCGlsRAiJ+JjuUYDUulmVJdIpza+qKiTEn1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CH3PR12MB7618.namprd12.prod.outlook.com (2603:10b6:610:14c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 17:25:09 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 17:25:08 +0000
Message-ID: <5c12f4d8-e518-45fd-b4f7-12fe6f81e0ec@amd.com>
Date: Mon, 2 Feb 2026 22:55:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] soundwire: amd: refactor bandwidth calculation
 logic
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, Sunil-kumar.Dommati@amd.com,
 Mario.Limonciello@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260129061517.38985-1-Vijendar.Mukunda@amd.com>
 <20260129061517.38985-3-Vijendar.Mukunda@amd.com>
 <a3605fc2-8080-46b9-8c30-a5c38a4f70a1@linux.dev>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <a3605fc2-8080-46b9-8c30-a5c38a4f70a1@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0072.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:267::12) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CH3PR12MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: 46b511a4-e78e-40b2-e337-08de62800353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWY5YUhNbWIxNW1zUmNMdzNEWXkzWXI1d3VSc1lQU25TUmo3OFNabElrYzAv?=
 =?utf-8?B?R1hDUUVUT2FMdFhnNjFBQ05zcGYrcjhLVURndCsxOFY1SitHei9nVlRSVFNI?=
 =?utf-8?B?bFlpbCswWmxqRnlURDlRYldQamtVUDhUdDQzQnlTeEFVOUg5aU5WNk5sOCta?=
 =?utf-8?B?QW9kWnAvQUZqanE4aE05bCtmbVdSVUlTVzArSkRPdkhWL1JIcUVQRzVDQzRS?=
 =?utf-8?B?UVd3NE5EN1hCN2MrK2RiRWpMVTlGV1lCZ1hicjM2djFhUG5GdC93bnRrZm9G?=
 =?utf-8?B?UXp0dnFxdlBvUVZ5ZlQ4b29XRU8yN0kvTlRZY3hrR3ZBY1F4bjZGNk80TjUx?=
 =?utf-8?B?Z0tQUU0wb3UzMG9YL1lmSkFUSEdwdm8zWC80SU9Ca0RrM3NWQjR4RWsvUkdn?=
 =?utf-8?B?MHorTHVuUWFpc21kb3RiSVl1YnozTm1HRVF4emR3TkNjcmgzOWhndTkvanRn?=
 =?utf-8?B?L2RxUGE4dE5MZUNqK1g4RFVEWlk1MmZBZWxVRmUySlRZVnB2TTNXenhCWmRs?=
 =?utf-8?B?cWdEMy9WVGdMOHVRMDR2UURMUENuUURrUGtHN1kyT2FjdVJLQmZpVkNQMzN5?=
 =?utf-8?B?cmIweTMvK3g5K2g2QXBSZmg2M085dnk3ZEc3bUpqNkJpRmlzYWJjMTUwaWVO?=
 =?utf-8?B?N0NkQzVkcjNxQUZYNFBXSEdTUmd3UGQySUlOYXE4d0d1dEY2cnJPUVhuaTFh?=
 =?utf-8?B?aUZWR3NWK1RzeHFLekN0NDV4MTZCN3ZxMkI4ZFJLaFlqRmxrb0dJVTFic1Fr?=
 =?utf-8?B?eWN2ZHI3cFZmMlMyVXJQR1hBS0YybnFxeG52dUNmMkd0YnlVTC9IeDh1TXZh?=
 =?utf-8?B?cFR3czlOOXkvYnJQSFpDaVJlWU55aXQwSmQ4Q3hNandKenJzZTFoRy9ZUlMw?=
 =?utf-8?B?aEtESVVaNkJXaDdTOHBPaDRlbHk1d0hSM3F5ekZpOVM4aU9QeXBsRXZTTGFE?=
 =?utf-8?B?U0Z6K1VYOUN5RXhlQk9JUkFleE5YaVE5V2ZsS2Z5YjE4WVlLaWtoZmsxUzdw?=
 =?utf-8?B?NmVMaUdZL3pzR1VScXlUWHFiR2pLZWlrVVozY0haZkRmWld6SW9YbW9lYnhV?=
 =?utf-8?B?TzgxZXozOGFQN3hqR1JuNEdSdkF2eFg5VWdvbEdvNTNMVU5wQk81cUt6bFVQ?=
 =?utf-8?B?RWIvalpXbGxtSHdEVExCcEdyaFBIVUd2UmEzUTR1VUkrelgrbGhFaDQ0TmlG?=
 =?utf-8?B?NU9VMVFuM1gvN09ZUXRZZ3kwakFKcklBMmJKQ2t0MGdkeWQ4SGxmLzYzZDBC?=
 =?utf-8?B?L1BvS3hrQk5HM20zOFY4alZENXdod1ltaTYxUmdsdHBTVU1TWkZWb0VoWXI4?=
 =?utf-8?B?QktpUFMrYzB2cTNGR21OYmdCUWFjc1h2WjMyODhoUXdaU3Nsam00Z2hZUTA4?=
 =?utf-8?B?bUpMRksvaDRCblBDVVFSY2NLYmpsSFVxNnlMK3VGSjRJeDVKUHNjU05oSjIy?=
 =?utf-8?B?SzRXOXJ2aGoydGs3QVNrNXlhOVRCdGFZUTF5dFRxR2YvdXUyZzk0UXNNT2pR?=
 =?utf-8?B?QW1hcTdHTldDOUxvVm9jVXFZYVFtdlIwMzBCc2k5VnluWGNhU2RPN3RqUjdr?=
 =?utf-8?B?dFVKOHdEWGJyUmtGQ0pMS0VwMXZKSElhbTF6aWthUytFUHEzVzNkVkRVMmJa?=
 =?utf-8?B?c0tsTzZwY0Y1VmVNdlE0Um5YNXBPRDVUWFRJcVNSQzBuelJYRGQ2N1ZYWnlR?=
 =?utf-8?B?OUJsaDdJNk5hc0gxZElrZjJCT2lpUnJTVDJMTTVxbFJJTm9CR0lMTm1nTjcx?=
 =?utf-8?B?Rm1yRzJyNnNQL2NJRDk2M3NqNHN6VllvTXhXb00xU1JlRjVQd0RER214UFBh?=
 =?utf-8?B?Nzg5NGZDMXBmY0c4Z2t5OTVQWmNKaVgwcFhGeUl5QUtnZ1FZSFlZSlNBVk9J?=
 =?utf-8?B?NHFkdXJlQzRET01WSUFWYloxV1hFQ0hMZDBFeloyWmVoWnp5WWV1SnpOOWhP?=
 =?utf-8?B?cXpteitJL0tUTzJRV2RxTmFpTjMzSytHNExuT01XQTlvQzBJRFZWckFTckZF?=
 =?utf-8?B?VURDM3h1SlNDZFZrWE9NTU9ET054TVYxM2hjRjU1em80ZlhBMlZyQzNCaDBs?=
 =?utf-8?B?eElDd3dYNjNKNTRpU01jZ0JPSHFWQjdoMTJwNHFpdDRibDhTMGpkWWRnakJC?=
 =?utf-8?Q?PC88=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGV3Qy9ESldPbWlWcDdhVzNtSUxnSndEUzVEV0RNQ1hITGtZalVKcnZab3hq?=
 =?utf-8?B?Ums3U1Evcit3Wm1CbXdPYmVMMjkvR1NXZ21yWVR1TDUwNDNWTnNlQVVyMjBr?=
 =?utf-8?B?TGpiMVNzWU9LeHRBTC9ZUnpCY0w3dE9mZFlHaCtydlhVOG9FRWxUckhPUFc1?=
 =?utf-8?B?RHQrTXNnZmw2RlZmMkNzZFllWmJCam5lNElGMFRqRkdleWluZ1dyQjR2T0tr?=
 =?utf-8?B?YzZVZW1jUmtBMDZna1loMWVvVkRvQUx0SzFQYVdSKzNrQzN6dkp3UWFwSndY?=
 =?utf-8?B?KzFCNi9CVGl0NFBRRjFVbjF6eVVMR2NJSmlBcXFuOFpqRTZ6WWx3aXNYYVBV?=
 =?utf-8?B?SHgzWWdMNXhFTm9qQ1JwUDJhaHlGeGFNZGFFU1dqRTRsSXVtQkFuZlU2Ymc3?=
 =?utf-8?B?UkYwWXdpanh4Rzc1eXBSUFFPdUJJUlRRUklkNk1TT3I3RkZTOHFlZzV1RE0x?=
 =?utf-8?B?eERaamJFRDQ3eVF1bHhyc1h0a0Nha3Qza1hLVk5TY0EyUE40TUMwYklRZXdR?=
 =?utf-8?B?anFxOWRvSW9weTNyRVU0SFZHc2RCSW1NUXNuU29ILzJpWTNwck1vQ1NUSVF2?=
 =?utf-8?B?Tk5RNmZ3OWMzdmNkNVNnOUlBWW9hV2tvaks5SDY5ZlFFRDdwRTVOdjdBOFFk?=
 =?utf-8?B?Q3J6WHowTUh3dFppK0REdk5nMSswTDVmUWhzRGp0NVN4bmlWTlNjYnExREFJ?=
 =?utf-8?B?WG9iSmtRb1pRUmVCZTVGVW8waGh0dlIzSk5GRTJSK2NveTJDcHRyYVVzQndh?=
 =?utf-8?B?NEJoeVpzN1Z6S0QwSFV0d2VYYnpTQ0FNRzRXZTNsSFB6ak9RWjBqMldHWmxX?=
 =?utf-8?B?V1pFQU9vT1N5OE1YY1p4M1RrMGNCZU5tZHhVbmdKRGMzbHorSVloSVROMk5k?=
 =?utf-8?B?QjJrSWpXazVzU2g1cHRJcGZ1OGwzNk9tWU11Wll5bnFDTjdpTDF3cG9pZ3Rh?=
 =?utf-8?B?bWdVVTZ4VzdFM3hLWUFBWk1YVmRKUnZyRDlCNms1amVTS1VaVFUzaWJXdFRm?=
 =?utf-8?B?Tm96SzQ5enQydW5Sam01RGx0MUovbTNydVdBYzZDUDVrbklBbUUvbnRSbHRS?=
 =?utf-8?B?eWR5M2h3b21rTUpWYWpmbnFvR3VFYVRpdngyZ2I0TnRubFdRMm9mVlkwMk5F?=
 =?utf-8?B?UUZTSXd3WDNpQlpaS0h0cXBPWmUwY3Q1aDZsbCt6M0Q2MHdWWXZTRjZDdEJH?=
 =?utf-8?B?Uit5RWdBZ3l4akx1UWVUYnRUbkwvbnNlei9rN2dNeVQ1ZGxBK2hpNGYrNFBT?=
 =?utf-8?B?Z29id0xsb3hOMlJEeExsck14bjNhbS9JMytRcGdxd2QzV2drdjVkemVXd1B2?=
 =?utf-8?B?TWw5MjFFeUpZOGNDQ1ZQZUFhUWNIRG9lZjlZaTVFemRIRFE5SWZaWDNxN2lV?=
 =?utf-8?B?WmJnRGNRKytvNkFjODdxRGZEQVVEbkNlR1ZPMnBCZGFKc3JBOUI5a3RBMUhY?=
 =?utf-8?B?bVMxNlhXZFhwNGpmenJ3dDBsUXJmVEFBS09xeGlnemd1bGZ5QVl6UTNrTDZp?=
 =?utf-8?B?WEhqQmkzOUVWcEwzc0RNUndrTloySW1IY2grenVoL1BYZUtoYnlKRXpNVFBZ?=
 =?utf-8?B?SEwxRWpTRDJuS1hicElsQU05bG8ycWlpa2o2dkEvOGYrQWFuVHRWeStGVEJi?=
 =?utf-8?B?TDBRSUkxMkUydlZmMk9nSk5iNGdEUTk3OU1xUjZuNS9adWdiOUVnSXQyc0M2?=
 =?utf-8?B?TWp3U0ZaRHFJNHBpbk5NckhENDkrUmFzR09SWEIxN2VPRUVibjlmYXVqaTh5?=
 =?utf-8?B?TklPeHdCdnZ1OStEOVNKOWtTNHdZVEtHYXNXUFVSYkdKWmlNdFRLQWF5Tytt?=
 =?utf-8?B?eTZWa3p3dk9aU2cvelc1Ym1FZVZnNytEdkRoMlc4OVFucHI0dHAwR3lkL2Y4?=
 =?utf-8?B?UUh6T1E5Z0h4K0NpaHJxL050QkRjYlo4V3R6eStjRG91a0JxNks4Yk1oZi9y?=
 =?utf-8?B?ZTZSSFBPV2RTQWtZSEpmbmprVE02UVZ1SzZ1bTE3amQzblhNMEpNbERKZmsw?=
 =?utf-8?B?U2dxZEpBL3lEck5taXIzNzV3NDk2MW92bUsrd09BTGNRSExVTTNHZmdwYUsy?=
 =?utf-8?B?OUxpVHZSL2ZqdmdEem15NkNMMXYrYTc5cEhrc1hJUjYxU1dIb0E1Qnhwczdr?=
 =?utf-8?B?Q1VEY0xEWDBvZEpWcVZHZkJNTmw4ZDNSbkFSQmhCci9CMDBaT2FqV2FiYW91?=
 =?utf-8?B?TWk5QW9MZi80VTE5KytLcnNTamgxcU54RGZPZFAyTFQ5TFd0aERFNzBGKzFO?=
 =?utf-8?B?TWZKRm5nUC9reFA1QmFWSDNBWXJyd2ZjbDQvcHN4TnUxanZDbko3cWx1WUh0?=
 =?utf-8?B?L292Y3pZSEY3SkkvVFFDdWtiMFRwZ0w2V01RMGpyMTg5MU50TWMzQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b511a4-e78e-40b2-e337-08de62800353
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 17:25:08.8379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwQ7kj0SpEitK/9/+CqbBQpIYL1DGKq/1ed0dY7i2R8zWDO3EuJhwe9mY7BSrH6Jeo7yTBoR/bVkK4drJJ17QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7618

On 02/02/26 22:35, Pierre-Louis Bossart wrote:
> On 1/29/26 07:14, Vijendar Mukunda wrote:
>> For current platforms(ACP6.3/ACP7.0/ACP7.1/ACP7.2), AMD SoundWire manager
>> doesn't have banked registers for data port programming on Manager's side.
>> Need to use fixed block offsets, hstart & hstop for manager ports.
>> Earlier amd manager driver has support for 12MHz as a bus clock frequency
>> with frame size as 50 x 10 with fixed block offset mapping based on port
>> number. Got a requirement to support 6MHz bus clock frequency with
>> different frame shapes 50 x 10 and 125 x 2.
> the two frame shapes don't carry the same number of bits (500 v. 250). There's probably an additional variable at play, maybe frame rate? Or is 50x10 for 12 MHz and 125x2 for 6 MHz?
We need to support 12Mhz as bus clock frequency where frame rate is 48000
and number of bits is 500, frame shape as 50 x 10.
For 6Mhz bus clock frequency we need to support two different frame shapes
i.e number of bits as 250 with frame rate as 48000 and frame shape as
125 x 2 and For second combination number of bits as 500 where frame rate
as 24000 and frame size as 50 x10.
Few SoundWire peripherals doesn't support 125 x2 frame shape for 6Mhz
bus clock frequency.   They have explicit requirement for the frame shape.
In this scenario, we will use 50 x 10 as frame shape where frame rate as 
24000. Based on the platform and SoundWire topology for 6Mhz support
frame shape will be decided which is part of SoundWire manager DisCo
tables.
>
>> For current platforms, amd manager driver supports only two bus clock
>> frequencies(12MHz & 6MHz). Refactor bandwidth logic to support different
>> bus clock frequencies.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>  drivers/soundwire/amd_manager.c   | 57 ++++++++++++++++++++++++++++---
>>  include/linux/soundwire/sdw_amd.h |  4 +++
>>  2 files changed, 57 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index b53f781e4e74..7cd95a907f67 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -476,12 +476,16 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
>>  
>>  static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
>>  {
>> +	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
>>  	struct sdw_transport_data t_data = {0};
>>  	struct sdw_master_runtime *m_rt;
>>  	struct sdw_port_runtime *p_rt;
>>  	struct sdw_bus_params *b_params = &bus->params;
>>  	int port_bo, hstart, hstop, sample_int;
>> -	unsigned int rate, bps;
>> +	unsigned int rate, bps, channels;
>> +	int stream_slot_size, max_slots;
>> +	static int next_offset[AMD_SDW_MAX_MANAGER_COUNT] = {1};
>> +	unsigned int inst_id = amd_manager->instance;
>>  
>>  	port_bo = 0;
>>  	hstart = 1;
>> @@ -492,11 +496,51 @@ static int amd_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime
>>  	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
>>  		rate = m_rt->stream->params.rate;
>>  		bps = m_rt->stream->params.bps;
>> +		channels = m_rt->stream->params.ch_count;
>>  		sample_int = (bus->params.curr_dr_freq / rate);
>> +
>> +		/* Compute slots required for this stream dynamically */
>> +		stream_slot_size = bps * channels;
>> +
>>  		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
>> -			port_bo = (p_rt->num * 64) + 1;
>> -			dev_dbg(bus->dev, "p_rt->num=%d hstart=%d hstop=%d port_bo=%d\n",
>> -				p_rt->num, hstart, hstop, port_bo);
>> +			if (p_rt->num >= amd_manager->max_ports) {
>> +				dev_err(bus->dev, "Port %d exceeds max ports %d\n",
>> +					p_rt->num, amd_manager->max_ports);
>> +				return -EINVAL;
>> +			}
>> +
>> +			if (!amd_manager->port_offset_map[p_rt->num]) {
>> +				/*
>> +				 * port block offset calculation for 6MHz bus clock frequency with
>> +				 * different frame sizes 50 x 10 and 125 x 2
>> +				 */
>> +				if (bus->params.curr_dr_freq == 12000000) {
>> +					max_slots = bus->params.row * (bus->params.col - 1);
>> +					if (next_offset[inst_id] + stream_slot_size <=
>> +					    (max_slots - 1)) {
>> +						amd_manager->port_offset_map[p_rt->num] =
>> +									next_offset[inst_id];
>> +						next_offset[inst_id] += stream_slot_size;
>> +					} else {
>> +						dev_err(bus->dev,
>> +							"No space for port %d\n", p_rt->num);
>> +						return -ENOMEM;
>> +					}
>> +				} else {
>> +					 /*
>> +					  * port block offset calculation for 12MHz bus clock
>> +					  * frequency
>> +					  */
>> +					amd_manager->port_offset_map[p_rt->num] =
>> +									(p_rt->num * 64) + 1;
>> +				}
>> +			}
>> +			port_bo = amd_manager->port_offset_map[p_rt->num];
>> +			dev_dbg(bus->dev,
>> +				"Port=%d hstart=%d hstop=%d port_bo=%d slots=%d max_ports=%d\n",
>> +				p_rt->num, hstart, hstop, port_bo, stream_slot_size,
>> +				amd_manager->max_ports);
>> +
>>  			sdw_fill_xport_params(&p_rt->transport_params, p_rt->num,
>>  					      false, SDW_BLK_GRP_CNT_1, sample_int,
>>  					      port_bo, port_bo >> 8, hstart, hstop,
>> @@ -1089,6 +1133,11 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>>  	default:
>>  		return -EINVAL;
>>  	}
>> +	amd_manager->max_ports = amd_manager->num_dout_ports + amd_manager->num_din_ports;
>> +	amd_manager->port_offset_map = devm_kcalloc(dev, amd_manager->max_ports,
>> +						    sizeof(int), GFP_KERNEL);
>> +	if (!amd_manager->port_offset_map)
>> +		return -ENOMEM;
>>  
>>  	prop = &amd_manager->bus.prop;
>>  	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
>> diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
>> index fe31773d5210..470360a2723c 100644
>> --- a/include/linux/soundwire/sdw_amd.h
>> +++ b/include/linux/soundwire/sdw_amd.h
>> @@ -66,8 +66,10 @@ struct sdw_amd_dai_runtime {
>>   * @status: peripheral devices status array
>>   * @num_din_ports: number of input ports
>>   * @num_dout_ports: number of output ports
>> + * @max_ports: total number of input ports and output ports
>>   * @cols_index: Column index in frame shape
>>   * @rows_index: Rows index in frame shape
>> + * @port_offset_map: dynamic array to map port block offset
>>   * @instance: SoundWire manager instance
>>   * @quirks: SoundWire manager quirks
>>   * @wake_en_mask: wake enable mask per SoundWire manager
>> @@ -92,10 +94,12 @@ struct amd_sdw_manager {
>>  
>>  	int num_din_ports;
>>  	int num_dout_ports;
>> +	int max_ports;
>>  
>>  	int cols_index;
>>  	int rows_index;
>>  
>> +	int *port_offset_map;
>>  	u32 instance;
>>  	u32 quirks;
>>  	u32 wake_en_mask;

