Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCF0328617;
	Fri, 30 Jan 2026 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769783891; cv=fail; b=d/FpA5DiZLdx6irOZT+pS/+auUQlAhXpo16RDjoedRk/IC2NMkmc6nEGkjMRtzAxeczVqo71osQzTMdRqfUWe3mSzrPxdJrUpYWMW1OU7HYk5xAJHPDwD/gL41Oz+ukr9FUUgcpMbXwyGTteC2J/udouD1lkABCOn2bKKeI9new=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769783891; c=relaxed/simple;
	bh=YL7XT1cZE6Iy8Q8BTvaJz5RKKHVUbcxDNHQrATOYJfE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hZuIE1fIvLh0DZepCovdQf7nwXPmEXg3+mXljvzoT533ifBMd2wBKAd2v7H5KskJZnSBgfLVHyq9BKK6CLdn/3KbRjxjOflYW/fej7hSC0Q/TJv6Y31PQ+uKANmGFrp1rOqVxZJMl9cwDtiSQ1TSoWX0jpfIlozJE4ZS4cbGl80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aPo7hlf8; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aPo7hlf8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qe2zNOhhKaqBHrFXQdgPnnctqNWyH8Le1LbtgcxuSaPgdDYI84qpGOt5m/cRAuJZiZJGSjApQgzZ4+l4qH1J8dPv6IjUn+2qJLN+Ukucx2A/zwy/xVHcJ1amuSGtfY9Z8meTxgN7QYpQlFm2tEa2sqlHfTbS0RtFPVlkhgxe8wKCDAhgWsr+6f0GKnUOlxB+qWBGVcfhfWTXTENKfqTwSl4MpWdlJXblGG5db8p7OuE/+Ko5cds11YXH1/hpsD3mgeP8tROyYzU+bFgv7qDnxwNkx8GUPFLvXjvPtqvhpcIjNM/ut6jeGNEC6Y2mM98OFS7UNWdxN54686AnBV1MNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v23tIZHmhl4/Ek7qEGMSLLoumSCDIMyayw5RmCXrWD4=;
 b=lH2es/LPqLNAPmCmMSi7Z8AAN3GLB+vlFwNIoNqDXfXaYNEwA0mbxgoEb3wyaWiBCe6fVascIRxQo0ZVQk+Lb7uWRog6j2/5qID6hBaEoJPjnzPaC9MX7rn9UIMbYNZP+JMyLm3olOgwqq8De/xq7jrIoIzvv5n6n+jz47qpa1QrwxaanD0nH3nknDNMEAJ6esm8uxrbM6KO4w7hXZjQrtbOpjNYQR1GfctTj2xhsdVUHY6SToheLXVVKUadwhXu9UPygSTsFBATA7TwKS7400wULRY3KzDWKR3m/Y5rd6k/BrNiPDj3rTNJWcFB2JECQPBaRIs6M6uctl0bJcKLbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v23tIZHmhl4/Ek7qEGMSLLoumSCDIMyayw5RmCXrWD4=;
 b=aPo7hlf8SBBNwFBnfdlet12AMxwUuy0K1ZZD+ynK2KmLEycfom/krBNgqJFXD1DOV0OMo4ChKc+C3x9pUFM9oKK2ZPRDwdTAcQjhKaHAFQZvUZsMRt+/Mn07cVya0M/ocmfyb6xKkUVbLt+YiOAzb/DQpiUwjk4MpzsHmwUseos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN0PR12MB6317.namprd12.prod.outlook.com (2603:10b6:208:3c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 14:38:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 14:38:02 +0000
Message-ID: <f64346f6-5176-4a71-b17a-bf95a31b5103@amd.com>
Date: Fri, 30 Jan 2026 08:37:58 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Add quirk for HP 200 G2a 16
To: Dirk Su <dirk.su@canonical.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lane Odenbach <laodenbach@gmail.com>,
 Oliver Schramm <oliver.schramm97@gmail.com>, Adam Queler <queler@gmail.com>,
 Gabriel Santese <santesegabriel@gmail.com>,
 Raven Black <ravenblack@gmail.com>, Radhi Bajahaw <bajahawradhi@gmail.com>,
 Alexandru Andries <alex.andries.aa@gmail.com>,
 Talhah Peerbhai <talhah.peerbhai@gmail.com>,
 meowmeowbeanz <meowmeowbeanz@gmx.com>, Yuzuru10 <yuzuru_10@proton.me>,
 keenplify <keenplify@gmail.com>, Syed Saba kareem <syed.sabakareem@amd.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260129065038.39349-1-dirk.su@canonical.com>
 <b4b2c531-7e9c-422e-b825-e34519e0afad@amd.com>
 <CANJZD57huXXBuUiq=nJZ_WmucCkFv4vKHLUdXSmTvokjTadz6Q@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CANJZD57huXXBuUiq=nJZ_WmucCkFv4vKHLUdXSmTvokjTadz6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN0PR12MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: 47d462e7-dd52-49d3-faea-08de600d2bec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|14052099004|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3c0QnNEZ3JucjkwQVJpUnQyWnE0T0xPZ0gyWC9CSFlxM2pkNy95UnJuaTAy?=
 =?utf-8?B?aU5pZFE0SitUamROalFWUDF0WFFkOVFZSEJSNm5nV1RMcXVpazBKc0RpanVm?=
 =?utf-8?B?M25ObUdGU25qaWRnbEsrdGFEUnNjbFQwaWxlOUdCbWhTZGcwM1ZNUmt4R0dV?=
 =?utf-8?B?SjN1U0kvazB0V1hBQTIzTHpOQlduV3hocHM4SlVWa1hSb1JQMGtoakJudjVw?=
 =?utf-8?B?RlQ1SGdreW1DOHZneDlLUFpXSHBZN3ZSTFNIbGtVMW5XVXlqTHd0OFFTUE9C?=
 =?utf-8?B?SzY0SzdiQjV0MUtuZUlwekk1eWhFeWVPOWdKRTA2VkZURExKK2Rlc0l1Umdp?=
 =?utf-8?B?MVJNSHdONFdNRU9HTGp1MWNRSE1TVWNKWTJKdzRDNEZ2S3FmUFYwMHZKeTBj?=
 =?utf-8?B?SURZR3BGMXRqV09md3lXV2FFeTNKSVVzK0FuVXU1czVZRWhKV25GbEtQM3d5?=
 =?utf-8?B?ZklGT2pTa3dBVHdjS2NBSnRLd1UzRUthbUtlWHJ3ZXdKTzh1YWJjUzlDc2hy?=
 =?utf-8?B?cmZZVGVYbWxQSGNmcWJYYUIxK3ZGemtZZzI1MmU3amlTR2N1eXljK2ZDZ0dz?=
 =?utf-8?B?ZUlDS3FrTWhPNTVQL3R1LzIxVWw1SGlJUG55cjJMUjBHMnRuNlJVT0toZUJx?=
 =?utf-8?B?TFJOd2hpenIwVkhyaUZFVEkxWkZld3VacTF0d21pQi8wcE1EWUFPRjdxRGcr?=
 =?utf-8?B?bUl5Wmw2eU14a0xVYnI4Sm1rd0NFblIxOVlaZTVyZy9NYjBmaWNyYkhjMXVG?=
 =?utf-8?B?bXZGcnpMKzQ3V0I0d3dMWTZ6ZkdvTXNHSm12Ri9lTm1iaDJhLzA4ZFJiNmlY?=
 =?utf-8?B?RGxyakw3Z05FbDZRRzlPTHdSYVpJSDlwUHF0aTJzSTF3MlZ4NXdXSll6Nk9Q?=
 =?utf-8?B?ZVpkVWVaZUczS0xBQ2F6VlZleERWOWR4ZG1NVEd3NGp4YXpTSzRCR3gyU3Jz?=
 =?utf-8?B?WEV5ai9Hekh4VzhWeHVVeC9iaDNXUHdIVXJ3WFU4bkVwaENsV05CcnR6enBt?=
 =?utf-8?B?dWVpNk9zcUEvOGpCWnBYNm0xd2toTk5vdzJkTm1xb294MHA2bENpWjduVVRR?=
 =?utf-8?B?QlRmMlZQQ01YRVJHM0JIbjh1Z21Xc0JXZmQybGNXcVhvdGd0T1FwUEFiaFZZ?=
 =?utf-8?B?Lytsa0l6ay92NE9kdTY3NDY4VEZZblJ2SHBYZzJweklFS25LcmwraHN4T1A3?=
 =?utf-8?B?aXFBbGxlWlZFNzVtQlgyWFhLY0hmaVdNY1pUNC8yb1phdjZ1eXB1SUR6Qmc4?=
 =?utf-8?B?aG1lNHJjcm5XMVRwWXlKcHlxSVRlUU9BdFF4eTNUcXJPNjA5QUxadWU3T2t3?=
 =?utf-8?B?VWsrbnZVYkhaYUJDM1pnay9YVkF3bUZNRUF6MzNmRzBhaGx4VitHMVUwMzNW?=
 =?utf-8?B?M1E3K2Z2STRxZ1ZmY2JnYTFVbk9ueGYzcUYyWHNhRERUNDhMS29yVHNFcUVk?=
 =?utf-8?B?SnNXMkNmTGVOaGNTb1RFbTc2Qnh3bUdhYjQ5WXdmcHFzaVBuYmg5WW0yZEtW?=
 =?utf-8?B?SmVmQU1LaW9IVGxGb2VNZXF1cVFvdG1ZQ3duRUdxdlF1NWU0cER1M0dUY2tn?=
 =?utf-8?B?MzJ4NXdpSkMzNGJKSlRDSGJ4M0hCZHlHUWhrcktmTTVMRy9yTkJEV2JNaVJL?=
 =?utf-8?B?d1FFQWU5MlkxZWRkd2NlcXo1d2w2cmhxU0JmcjQwcVhybXJaY1U0OVZIeUQ0?=
 =?utf-8?B?VE01THY4QnlvQzQ1STNSMFFPZk1jNzJIQjVsVVNuQStEOTdTRlhXSEVhczFu?=
 =?utf-8?B?TnhPcElSREkvYi8xc3RiWCsrdC9KNFl6R2ZDaUlzTW5XdmxqYmlEK1JKRU9s?=
 =?utf-8?B?SmxFVkcyQm0zdVlZVEs5ZzNnMGVlbExkeXpINjZPNFAwMXM4WFQwbGR1VHJG?=
 =?utf-8?B?bHJ6OXNaQnpMZDdtS01IUGlRQ2VsakhkVk0rWDZPWFNBb1VOTHBIZHZiS0ZN?=
 =?utf-8?B?K2V6aWVCZkZkR3FhUHVhMjR6YldqOTF0QU8wMGdSb2tKWE9RcDFNL0c1OW55?=
 =?utf-8?B?NGtncENDc2dRUTNlRmp4YmhsVUNSTzBSWU9QbUFsU0Eya1YzLzhqV3V2RTdp?=
 =?utf-8?B?eFFJYVZZRmVZV3hEUlh6M00wRUFhNnoybWg0a2tmalRGMUlTWGpSVUNSRXAr?=
 =?utf-8?Q?Xph8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(14052099004)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE9QZkczYnF3bE1HYmRDdTF5R04rMlpIdGhNRGZZemw1T1cwMGpJR0ZacmtW?=
 =?utf-8?B?WTBkbGRaRTlBblJxdE5KakpyM2xxREpDMEpGcUpsVSswcFRvOVcwZnhWZEZ3?=
 =?utf-8?B?MGVTMG5FYXlRV28wQkdTVll3eGE5bVN1ckZsaGx0QnJic1BzcEdZRkRZSysz?=
 =?utf-8?B?WFlNZHpTTkJCR1BTbTZOcTQvQ2VHdWpIVUdPeGJtTHB3Qm5SL296SmxMNFlY?=
 =?utf-8?B?ZWJYWkdQK1JMWVBGdDF1ajM1RVRPb0pXT21ZOFZ1MTVhd0FGV1ZvU1huKzc0?=
 =?utf-8?B?dTBZS3E5Vk1JVmY5c3VUSlVYTkhJRUNCTFp2cmRHeTNGL1pMRmw4b0RPQzk0?=
 =?utf-8?B?elp4djZUaUY4R3NTT3BuK1NEZm91Wkd2K0l0ZlFKc2h2YTk2UXFNNlRoM25x?=
 =?utf-8?B?a2luL1gzNjRZbFlWYnpOOFE0czZYSDdrall0ek1RbnJVNzFtd0NINGUrRHYw?=
 =?utf-8?B?cCtCcXhhRlJtbkV2eGg5THZMYW9tUU9HdkFtSk1icnpEcjAvL01lSHV0UkUx?=
 =?utf-8?B?RlZ6SEIwUzFRRTNtZXBrcWxoalhVTHZNSG5SdmVuT01LalkvTVcvWW9YYlJG?=
 =?utf-8?B?QUNzVitMbXNwdGhpT1JjUmc2ckRQOW53djBOc3Uvc1A4N1d2aElQK3JRRjFM?=
 =?utf-8?B?TXlSZ3NaQ1pJT2JJcGYxaVcyL0JkYjhnaE5nMmdXRzRXd0V6MUJ3ckFYSWFk?=
 =?utf-8?B?U2FHejFYOUJyUE5KcDRZQUZJbXh5U3RSRGFZaXdNSEVRMGNBai9CRlRZUDBu?=
 =?utf-8?B?V1dGNXNXNkdJQy9mWWlGQ1U3NG9oSjZGSlVFMnY1alY0Y0J4akt6dlJrZlUy?=
 =?utf-8?B?MUdldjMyNTh0bXg4M1A2eGdVdmNiWjhaN2kvdWxITTRkS2ZoUVAwcWRzOXFS?=
 =?utf-8?B?OWFKQ3hxSmwwRyticVNIYnZBay91bXAxZnpRVG1KZnV1cXB0ODJxeXdLV1hG?=
 =?utf-8?B?NUc5U3hFbWttVUlkcXBKcXJ1NjQ5YnF6RjRhWkNDMW5pL1kxWCt5YndwNFVj?=
 =?utf-8?B?WS84cW9qYlREc0svMmFpRXA5eE42Y21SZnJsTFJreWlrV0ViTHdjcTk5UitV?=
 =?utf-8?B?TGJ2R0RXc2NKY00zQWg0ZkRvdjE4YlJLdTRuQXJWY3Z1WENqUzlyNzJqKzAv?=
 =?utf-8?B?eWYxeGtlNlc2WnFVUVlMWW00cFRlZUhGZWU3Zi9KZmZKRk9zemp3blNtVzU4?=
 =?utf-8?B?bHVZOVJCWWlqRHlQT0lpS0N4REo3TkhNWmJabE9NeGcwOU9yNVN6M1krVm5k?=
 =?utf-8?B?WnVBYlBlSWh6MmpuWmFrdTduZUR6c2FFRGt4TXNudE9RcnhKQ0dLbjNOU1Jt?=
 =?utf-8?B?Rm9SR1poRjEzcDdKdXVaQUN2ckN1ZHc5NzFYTTlHM2RpeCszMllQaHZncC9T?=
 =?utf-8?B?bU1RKzhja08xbkhCaEw3UjFBemlsRmVQaXMzc0p0akVNZEhXU0dYNHQzU0h4?=
 =?utf-8?B?eEhIdDRzeFhtdmxOUmkyMlZvaDUzZVRZaC9nWEFPZVlWTWk4YjRkekJtU3ZU?=
 =?utf-8?B?SlBlaEhnNGxnS05vRXNRallwV3pKdkRjV2NVcGJXcHRDV2h2NXp6UTVSYnFa?=
 =?utf-8?B?alA0R1Y4SlczRy96NGhiUUdkVGxvL0sxaTlZdUF3VWFJSmJMMTVjSXkzbi9t?=
 =?utf-8?B?cmU1NHdqaEFOQ0h3TnlLRmlBTWpvZ3k2NUxhcnF2UHpJb2lQN1dtK1FVVi9F?=
 =?utf-8?B?Q051Qmc4cDd3djQ3NGhVdDFkNjdBUGp1TDloLytiV0daZGJ6TmxiYXFwOThx?=
 =?utf-8?B?clRRaE5OMzU0R05pZFozQU9BWkljZ09QVTl6d1RRTnMwNTRlVTBrWnIrWU8r?=
 =?utf-8?B?VWxIaUNmVzlFN2xyNzc5OGYyTzdsVkRBVEdhRUFQb3hvMGE2dXFmU2NoNGtq?=
 =?utf-8?B?ck4zTG5ZUVd4YjJTTzhQSDhnaUVnZWJ1YVJCNTFXdXV4emZHMGZ6UzJ2ZXF1?=
 =?utf-8?B?VjJtUjZwczJsUE5QbDdJN1l1U3pwbFFobUVCNlpINU5GaEJZeGZtRjIzUTZQ?=
 =?utf-8?B?TGEydmZ2Wkc5MFg3NUEvcEIyL1RNMy9MWGQ1R2lMM2xCSDBHZE1MSDJIZlhp?=
 =?utf-8?B?Z1NBTFIzajU4SHQ1SEFoWGZka2g4UEs3U2RkaVcwQ3hDK0RBR3VnRTY0QXhr?=
 =?utf-8?B?VGdEN2YzeU5lbVQrOHBVOXI0bmdMMTZLUnZTZ0lzYUoybW5rMWJjNDZ5YVRO?=
 =?utf-8?B?QmsyR3BLRk03ejNPYVpKU2VGL1RMWjh1QkxaU3phdjVwOWpsSHk5WS9DUGl4?=
 =?utf-8?B?T1AySGxycGd6YVJ1ekplOS9EK2VpdjNvVVhwNy9vNmZ0TElmbnR6bnp0Vjdv?=
 =?utf-8?B?YVlFcEpuYzNNYkMvZ3QydTA1WFloK1NPWXJtemVtZjIwREVoNW5RUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d462e7-dd52-49d3-faea-08de600d2bec
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 14:38:02.2867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67NHxCWyJo1X9MgHutCFHh48YKce9EVvGTCzW9VDxGLUpWh9JfOwTXb+k7un1ngE/7csvpMDuFLdA2Rz92KiBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6317

On 1/29/26 9:26 PM, Dirk Su wrote:
> H Mario,
> 
> Thanks for the reply.
> This is a old generation CPU (AMD Athlon Gold 20, family:23, model:160).
> Anson@AMD suggest us using the quirk to fix the issue.

Old generation CPU but new platform?  Old generation CPU and old 
pre-production platform?

A quirk *may* be the right solution, but if this is there is still an 
opportunity to fix the platform firmware that is my preference.  You let 
me know based upon how far along it is.

> 
> Regards,
> Dirk
> 
> Mario Limonciello <mario.limonciello@amd.com 
> <mailto:mario.limonciello@amd.com>> 於 2026年1月30日週五 上午3:36寫道：
> 
>     On 1/29/26 12:50 AM, Dirk Su wrote:
>      > Fix the missing mic on HP 200 G2a 16 by adding quirk with the
>      > board ID 8EE4
>      >
>      > Signed-off-by: Dirk Su <dirk.su@canonical.com
>     <mailto:dirk.su@canonical.com>>
> 
>     Is this a production hardware and firmware?
> 
>     If so this patch makes sense.
> 
>     If it's not, can you please explore adding the _DSD entry
>     "AcpDmicConnected".
> 
>      > ---
>      >   sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>      >   1 file changed, 7 insertions(+)
>      >
>      > diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/
>     acp6x-mach.c
>      > index 0294177acc663..500b4fda0581f 100644
>      > --- a/sound/soc/amd/yc/acp6x-mach.c
>      > +++ b/sound/soc/amd/yc/acp6x-mach.c
>      > @@ -633,6 +633,13 @@ static const struct dmi_system_id
>     yc_acp_quirk_table[] = {
>      >                       DMI_MATCH(DMI_BOARD_NAME, "8BD6"),
>      >               }
>      >       },
>      > +     {
>      > +             .driver_data = &acp6x_card,
>      > +             .matches = {
>      > +                     DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
>      > +                     DMI_MATCH(DMI_BOARD_NAME, "8EE4"),
>      > +             }
>      > +     },
>      >       {
>      >               .driver_data = &acp6x_card,
>      >               .matches = {
> 

