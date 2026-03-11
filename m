Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011028.outbound.protection.outlook.com [52.101.52.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2339B2DECA8;
	Wed, 11 Mar 2026 17:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773250382; cv=fail; b=tx0bKqFpuKl+nG84OistrUKqmw4TI97fGO3KGx8vXGagJTdZMHv7Hseld7ctrENpODFGKAl8NXA9WImhyvf4zptvBUjS+MP8Oq9Lu8zf/m9Lm47/6Eezevdgr6OdY+7tVL7uJ8hMU7Oy06rBoRgBvXs2o8sEpsbFHkbuI5aelp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773250382; c=relaxed/simple;
	bh=3Qzf14jEKse/Eym6JMuvV8v1xITmGV1s+S7nr6BrRHY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lEiMYw9s73xLkRPZzo9A6xNfSA1rh33NV711IpQD4vIl0F4f+olMH96aORNCEd3wbRFvW7h/hS+wMtIR2mm8vSr/NdzBT/+4/OgcD+jMwYzt1JBka/4aL52di9v+9RmQKwqsGozaeBXmGP3ZmZ9S1ZhwZydoLDDypNvbAfkDEe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XwuoVLG6; arc=fail smtp.client-ip=52.101.52.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XwuoVLG6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIMTRLzTaNIkCMGZHf4YD0QMtYB4QfmgyHgWyxrTwVYMjqxrshwJIYdy90L7TaB/NQX4jwGycCA1hc32nWV4XFefvk5+ZHb+lq189zjF3Hg4cp/cgh6QaVz68PMqJvzwAX8ENqyCyYjRjFyk6OhAJ4kKMeGYt3Zm11YS78UziM2kVIBjXaimfCiTl7yLSv+TVHytA07LPB90ftffrzegLInmWMB7qPMEhFhzOGb1h0jVPe+x5LotlF93Atw32Pf1i+lKISY6/e8IaeZJI9Isao0vmlME5JIKxeSQ1a5LQRjAgzPCwtYI+v73PNrWlolklUFdrZZPXNc63SGAtB7CLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUYAQwH9B8La5wQeIcW61yVgvV71O/g9GYy3MmHV96U=;
 b=t8JkJiz1uBkPw8KUfMOgc8LVnpAfjHnMlGlCMOLn+6FJNl5e3aN9wbtBRDCOd49CLmAm68N7UE3qY1j9kQfhkjh1CUw61KveTNavqrItlGYcwWN7uIQAZhkwQbVY2y1V6OCWzYZpfoToOVKY5J2wuO2WYVGzWQLuxWSjOXCTPBxopmRcXwOSQVVrIhY4ilCrK6WUWzHp7ZGOzESkTsvFJwQqF7CAE1X/hrM5MheKr1f/Elrtd3yBteI504Dfqz4JFajjap4V7t71MRTHhgssNX+/ehfPv7/MAy7KO6C055tsWSxhvxv8vllbNv/OjO8nYtriPoMC9R6GYCwb2MOVKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUYAQwH9B8La5wQeIcW61yVgvV71O/g9GYy3MmHV96U=;
 b=XwuoVLG6x13jzEvBX7SzMtselmwjebBGABcuycIwusd7Vs7s3R3gZWScSs6uJ2ZhFr0iVLfmRev2lcDvAvNNcKtrj3CjNKtWEYLJF96gDCdLXgetmYjqitoDeMxZeGJhbPNahGbl3Z6rEZAVAVtqmgTbZwebJms8sZPDQLCo4qc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 DM4PR12MB7624.namprd12.prod.outlook.com (2603:10b6:8:107::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Wed, 11 Mar 2026 17:32:53 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 17:32:53 +0000
Message-ID: <26a37f81-9c09-4691-9765-66da29dec3b5@amd.com>
Date: Wed, 11 Mar 2026 23:02:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy
 SDW machine
To: Mark Brown <broonie@kernel.org>
Cc: hasunpark@gmail.com, linux-sound@vger.kernel.org,
 venkataprasad.potturu@amd.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-kernel@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 "Gong, Richard" <Richard.Gong@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20260308151654.29059-1-hasunpark@gmail.com>
 <20260308151654.29059-4-hasunpark@gmail.com>
 <53a03615-7a5c-4f1d-88f7-1e6554092946@amd.com>
 <b7c72feb-189f-47d9-aa1d-88e2a223b4af@sirena.org.uk>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <b7c72feb-189f-47d9-aa1d-88e2a223b4af@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::15) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|DM4PR12MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: cbfd6462-b13a-47c6-c539-08de7f943981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	n2ipQb8IVek536XWrvIddsDQqs3kN91IOKfzLISW1OX6F0RPqTLkcW79y/t9F5wY4UQb9VqeE45aLJgHy4TCQIo1n63EpObry8mQ9/k9Jqe7lONQaD6Oz/2RV2Bmc2W8LOxyab1ZHNTZFALxoS2KAU3zU8vhJX/WdakGhRglaD3F7E5+O0OoJ+cQuU6C+Gf9/ap+crzbOWCvbzGR8rZWdGAzcqr/WYAsHM6kwbTZsP3/S/ZvaBzirEWXGmW7TKsIFz7FZiN884YhTd5XTk2/C59vSej2gmO4Xw9udjmWJvmuoUAbGMd6tTZ5lGdKTcP8LwtqwExDsdiaoXtrhRITAAQbhDAqHbPicpMWmsIQ7qJ4eihnqTNePBSmJ7bDq7RUAvuLrtPVj3Xer3ZaqFr1koTV6wWJdz/qc1K94kjU8J7ApULEXpyMgxE/jeem1XgcLZt5UjJAd/FW3pAAgIMO16TlBQ1QBBXzbrAv8hRf1CqH/0UALXvqpyGoD3haKj7SZfMYndYVtAdDbzHF/RXFYSC6dkhNXXgIQpizZU3wtueIgTgGitpX+aYPrqafYM3Xec5n1UTjbETkWlwOTR1APasbr1qu6FWNEcNW9BTh1vtNoHnBZhw1WJjdyBX3XA+1GN+1UDFxlGFI+rREFockszMB87taXXSdS2cYZKXv2JBBQi7mEiemNsv9K3hNK0KctwGThD++V4lezbkVwJOFn7Ka3RfU6c39sH2yxPsOioI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REhoV2txUXpWanhxZGFJNVNBKy9zbDNkU0ZxNFJnamUvUnlRek9IUmRHSFRB?=
 =?utf-8?B?WDNPZHUwUUZDdnNoRjduUkxvMVJuQzR0ZEErSFFDcUgzVDBKZS82UXN1c0V3?=
 =?utf-8?B?NlFYZVN3VWwycWlmMHRrdGZPZXNacFNZb1l5d252dC94VlhDZEM5d083Q2tO?=
 =?utf-8?B?b3BrOEYwaDlDR2RjQlNzUHJxSTVXbjRWUVVtUmFEdllDRUJLaWpIR20xSDJa?=
 =?utf-8?B?cUZnNTlTbUwyTkFXaEpXVW1LU0o5Z0RiSEZIVW5OemRjT1M2YTVZdFhhd1hu?=
 =?utf-8?B?dGFpQlh6SG1wU0FCTjY1enpna0duTWkrMWRtR2R5L1NKV1kwTEJINTBaTzVr?=
 =?utf-8?B?V3Z3bkRLWGdEeTNrL0hvcElEK21tR1Q0YlV4S3BsZWw5a1pwRGYyTEN5NjFr?=
 =?utf-8?B?RHdXWTh6UzJEM0J5dmZTQUVnQmMxbDVDK0p0WTltc21wekxJNmxzZVJQU1FX?=
 =?utf-8?B?ZkZadGxHVEkyVTZGd08xVjB2UGRzNUMvY1o0enB0NXZMQkkwTHZ5azV2QS9u?=
 =?utf-8?B?ZEwzRUFBWDExbjVXTXBhUXJRMVIxTDErZzdlRnJmTEMwSkZiSnc5VCsvVlFW?=
 =?utf-8?B?SEI1eEg2V2xTLzIxRmpPRG56TEJaR1NDcklSTE1uMHlpU0VvcjdCTFNKQUs1?=
 =?utf-8?B?VVJpRHdYQUVzKzc4c1RlTlU0RVQ1MkxjbmFkaVRFT2dUYzRKZUQwNDdic0RS?=
 =?utf-8?B?aldrdjhoeFhIVzVqeXVZM1YrZ1JYbHgyU0xVN2pUbXpjcDQ3V1VhVlMrUGFi?=
 =?utf-8?B?SSswcUJsZVJoRXg0clVoa0F6SjhuT1p1SEUyRFJ3c01JKzZabWtDRGJsMER0?=
 =?utf-8?B?akxHNEdhYnQ1TExLM014RG9zWlpWM05XcGYzTlhjbHA0Y2VZcnZnWWdFeHBt?=
 =?utf-8?B?RXBFekU1enN1UXhWZGY5TjhaZ0pUaU5iOFpIckJtWW1rRHljc2FOamhZOFc5?=
 =?utf-8?B?aENMeEMvbzJ5a2ZrNE8vR1A2OUZMeUhXc3Y5ODNWU2FTMTQ4cWJjVytNK3Jj?=
 =?utf-8?B?MFhVQmFxS1EycDN2clA3UlpQUDB5QUR0VXdrWWZBcGxUWm9LNHNQN09USll0?=
 =?utf-8?B?WUJVL1BNK3hNeHFFUmlabnoybEJxQjlQOG5kTko4SW5QcURWNjhLSDBUTDBj?=
 =?utf-8?B?bmttaVl4NThjTFBIY0ttYW45YlQzUHk2Y1V6am91blNCeEhwOFlZR21aSHQ3?=
 =?utf-8?B?UEF0Y2IzOXN6aDk0THhXUFFIRjdDdUhzWEp5eEw0Tzh2aURjV0FRQTNkdmlx?=
 =?utf-8?B?akN4c0dPSUJVTHN3TEw5dHM1QmtOeXNCUjRKS1FFei9hMWFlZWQ5RFdxT2Zt?=
 =?utf-8?B?c2RydWk0LzdRbDJ3ZG1NYUpidVpWNEVwQWNvUHV3R2tkWjdaUXp3UStEUm4x?=
 =?utf-8?B?eW9wTEZnWEk4ZlVnVCtkK2UwY21yS0kySkpWc2NPazZxYlI3VllyTjF6c2tY?=
 =?utf-8?B?ZDQ0RGl5N0cva1oyYjUrckxSNC9vV0t2L2pnbHYrTFBDbDJYR1o3dGpDaVlH?=
 =?utf-8?B?Sk50WGRyeGoxd0ZNWlQzeWZ0MlQyT2RrZDJrZ2VSSENSdkF4S21ZcEVZZ1Zr?=
 =?utf-8?B?RGF3a0J4d0xLNWVsSnRWMzJuWUlLSEEvOGExTk8vZTNVYUhwcENFelZiMnda?=
 =?utf-8?B?QzJ2MnVrQ2ZmSjNjRndrSlFIQjJNaTNzeUR1NFRQeFdub2g1QmxSVTVoYnY5?=
 =?utf-8?B?MW1CS3Q2Q09IS2d5M25kYTU5c0dScXZTOXRNN3BabjNCdllLbE1LY1NwQ25o?=
 =?utf-8?B?WGdOOER4djAxc2ZTWk5taG9ZZWwzUlBmcEpqODJBYkliVk14aDNwM1VsblY0?=
 =?utf-8?B?UXAyUjUxTmJzaXk4TW9iYVhCVWFxNmdhUVlhVkM5VjRIL3JFUWlrNThqNmxk?=
 =?utf-8?B?OHMrM0EreGlUVTNJR0RSVStIOUFrc0wxQnZUMFl4dWNQUjVKWnFvOTI3eTIy?=
 =?utf-8?B?czhiMjA1MXNFb2pmdGYrSjRoY0t6enFVRDUwa1JIOTEyK2ZmYmM1Q3NGb3RX?=
 =?utf-8?B?V0pBc0h5bmtiYjdZalZBZ091ek1GRWZuQVJPRWFpbC9HUVJ3SDlXbXNtYmhx?=
 =?utf-8?B?VDQ0dytHWDl2bVJvempnTWlzRkN0MnFsY3paYWNxSHZsQlRtVGhZa0kxK1Vn?=
 =?utf-8?B?MjdkNjBuQWk0dEtXUHdmMHFqdDExdVlOdVpBZjhCN0w2YTU2RThMM2x1dDJz?=
 =?utf-8?B?TEdjUXoxK1pyaUZ5T01kYXVXSzdkYjBwR0s2SU01dkZoa0U4NVRCQ2o4Ymhs?=
 =?utf-8?B?ZDR2L3dEaGc3YUFlSk5MTTJrMTdJbDFnUWc1S2phK3lRSXVycVdXays0RUNT?=
 =?utf-8?B?dDMwMng0Njhtb0hqV1NrS3d1clhyZlI5NFEvZU1hV1IyYUVpSktwUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbfd6462-b13a-47c6-c539-08de7f943981
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 17:32:53.1584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ReEiEyVYlqexQ7ha2tttIpEimZIrmRPYbPKUUFxyPK27ORgknlrneVr2Ifg6imdqFSwpyI64RSUj7MArUMID6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7624

On 11/03/26 22:51, Mark Brown wrote:
> On Mon, Mar 09, 2026 at 11:07:30AM +0530, Mukunda,Vijendar wrote:
>> On 08/03/26 20:46, hasunpark@gmail.com wrote:
>>> From: Hasun Park <hasunpark@gmail.com>
>>> Add a DMI quirk entry for ASUS HN7306EA in the ACP SoundWire legacy
>>> machine driver.
>>> Set driver_data to RT711_JD1 | ASOC_SDW_ACP_DMIC for this board so the
>>> platform-specific jack/DMIC quirk path is selected.
>> As RT721 comes up with UAJ + DMIC, then why we need ACP PDM DMIC in this case?
>> If you are using RT721 (UAJ + DMIC combination) below quirk is not required.
> Presumably nothing stops the system integrator wiring a DMIC directly to
> the SoC even if the CODEC can also use it?  It doesn't seem an obviously
> silly configuration.

On this platform Soundwire Codec RT721 already comes up with DMIC
endpoint. As per our understanding current soundwire topology points to
use RT721 + TI codecs. ACP DMIC is not being used.
If we want to use ACP PDM DMIC where DMIC's are connected to SOC and 
routed to ACP PDM controller instead of Soundwire Codec (Which supports
DMIC path), then ACP_PDM_DMIC quirk should be enabled.


