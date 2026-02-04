Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012040.outbound.protection.outlook.com [52.101.48.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57C2337105;
	Wed,  4 Feb 2026 04:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770180758; cv=fail; b=bZZjm/nIG/MJ1YimDILaLdgFxpStkmpFA2wAU747aPk2Kn2zpcxXL9hf8vfLJKqfvV1Y/ANG9nNxsqQWbPipYc09W9eGoxCQ+T1AkQjQcJ3J2Up+4n0HFZj8YmBR5vrYZLDWeR6RSJ8qkX+p/eFXd/JUVlgVVzd8piMaSrbc2Hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770180758; c=relaxed/simple;
	bh=ztVO8sBzE2md8GiT1mMbeazczvhsFgzF+xmsVbxbYdQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cOyGOG+hfn90OQT24JZwf1mJ3s3eod2RJnhW7fCKcBj7kynh60QUrjO5T222RWW21y5YmX5xEfwNnhZwp4+BtXMkL9Svv3iaiFovyEcOsp1ERdyVeWuzMfPWyzHDHRNndTPqiNJ0743ouG2D8aLnVfl/pX8tj2Owv7ZInrkdRoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sznwxGw3; arc=fail smtp.client-ip=52.101.48.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sznwxGw3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVmB0Tz/pV14mG5U1Ep0tQ1hwu+T+XRJVTNsXU6EsewOpLILSa6vnZ/TxnbAVlvt342R7fttLUVIuLpgPw2GPkipR1Yrhc7egb8aHQNmUfumBV17LI/uodUc1PNoJJsJl888dCeNpEgoZseodiafMB7paDyvyHP4paN18+mNsbJ5+NGJn8tAtLqQjRxOVrKj3n+dNejGI+6JynxLU62qrq+6XCgRJoYvk3Oy4drIh1wL3OcUNsKjRT1I13acQViZQqmF4hAhS4E3weFy53Mkp40xtXv3oHxPeMHAzW4mO/p/E3t21apZ6QD6Ni42ab9b1usPC6D5tbU5C1o58nENTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztVO8sBzE2md8GiT1mMbeazczvhsFgzF+xmsVbxbYdQ=;
 b=moYF4n9quzzw7DqFkOr5KvbFuXvwxCO9S6HWVwFnZawHn0IVHGArUWSJptsG7RJa+WqLvz3C/e4U0Xso+yYtP344azfPwEBKl+C39lu5zFFEbYUYsQ83pHM3ZJ8eknqjf2E4RtsiA7ziWb0RwaYpY6uCD/W3rAHwzgp1/I7heGImJYAt0Ml6Nea8NStfwBp3nZHOrVU7kh7MeZLC7rA99u/jjIGDEDOySZXr8qc0DiI6Vbb6ZzPGB8hO6G8r69f3eZrXJJE2HFpEdqMmjdLDzAMucZkmwVh1HGZ/fgiTHu5yd4XgSidby0n5OqNz9uQxHUDbANz9Z1hKJTvWGOyMZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztVO8sBzE2md8GiT1mMbeazczvhsFgzF+xmsVbxbYdQ=;
 b=sznwxGw3oUiR+Uo1s104Zgt2lrzvoG2zBxJGoH41v4ChW92GUrTXPAhWM4Jh8KszWelGRZE4jFSDjujDrIr27hoXlWFaVid624fWrFnFO3qUnl/MkB8+qDA4tyOAtpC/eZbOQ/AT/FY1dWzM6F7TCpvt42k7FOzFKQL7JvCm68A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 SA1PR12MB8597.namprd12.prod.outlook.com (2603:10b6:806:251::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 04:52:29 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 04:52:29 +0000
Message-ID: <4b5be8db-a42a-40f5-86cf-a3a782cb64ea@amd.com>
Date: Wed, 4 Feb 2026 10:22:22 +0530
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
 <5c12f4d8-e518-45fd-b4f7-12fe6f81e0ec@amd.com>
 <e3b8302c-c12a-4507-b554-d996763187d7@linux.dev>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <e3b8302c-c12a-4507-b554-d996763187d7@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::22) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|SA1PR12MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: 0137b67d-f6f7-422e-b2ff-08de63a93313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0xzKzIxcUZQWlJML2JXZ0p2U3B6S3RZTDB0bUtZbUpodXZGclhVOHo1a08z?=
 =?utf-8?B?cThVbUNveSsveGhtNnJwTmZ1ZFZERUpVUm5HTlNnMC8zRDBUTnVFQTd3UWx3?=
 =?utf-8?B?czF2S1ZRMGxNWTRtTHg5UjkvWmxzUW9wQUErWjk2SVZWWHZNTG9CTEVvQUdm?=
 =?utf-8?B?VHBPYmNHZTF5ZHU1SDk3eWxEZEdNMmN3VEtvelVnVkF1QjFZSE5HbE5MN0Z6?=
 =?utf-8?B?UGphSGdyS0wvVlY0cHJRNlRKdTlhR3d1ZE1helppWUhpaGdsUDBrL3cwc0ZU?=
 =?utf-8?B?RWk1b3lIaldUTy80OG0rVWg1WVJZd0t5ZzErQUFWaHpEUHpjV09Jd2JwcE0y?=
 =?utf-8?B?QTBuck14dXhNakpaU1I5V1pYRDg0bjVwNE40dVBqbWQvUy9sbnUyYjRTWC82?=
 =?utf-8?B?cTUzMWk5NHZnY2NidVkwL1dpK085MlJnNWo2YUxaaHhSWFBFS0dEWmRuallY?=
 =?utf-8?B?aFU0Mit3ZmEyQjZMZUtWTVQ5WmI2ak9VY2k0Z1JoaE95emlWZzR3bnZnRU9W?=
 =?utf-8?B?RkR0bXNpRXhmN3ZsaHBYbUpHaUFtZmt4TGZqUG5jbUo0aUI0T080U0Z1OHhI?=
 =?utf-8?B?T1FYSXd6TUQxYXd4L0ZROERXQ3RpNnlMTkNQRGlVSUlsMkxVeFA3UEdyeWpU?=
 =?utf-8?B?WmUvUEdiL1d2eXdmOGpVYS9MMDVVai9qaEIra2JUMWxqaDh1ZjhVM3YzM0Ra?=
 =?utf-8?B?SWs1VVY5VHU0SFJ5NEZjZHcyZSs2eDhSbE9ncUtuS1pKZDBEcVg0SCt0cjNP?=
 =?utf-8?B?QjhpczJvVEpNUlRCcnVmRjA3dVpjdm0xTjVqVUd1aG9FcnJoa0czZXE4YzVW?=
 =?utf-8?B?eEhiY2tsR2xPaWJHRi8yeWNuaHd1RW95Y21yb3ZGQXFpOEY1WUxtSk1tMEZC?=
 =?utf-8?B?OGZZV1FacFk2QVVTMGRDb0hjTlF5eFd6R3RiQWxxckRwUnExRGYwVzdack93?=
 =?utf-8?B?RW5jKzYxRm1aMngxRkNYbUxGb3BVNWdrdFNuNHVzV3Q5R2ZzbVRyb0E5SGF2?=
 =?utf-8?B?N0k2ZUw1Tnk5YnRudG5UTGFTUSswT2xiejJRZ0RqRlh2bTMzWTg2TTJtRXYx?=
 =?utf-8?B?KzNqN3dzeDQzYk9TaXY4T0dIT3BHSGJlcEN3aWIrTktLcXVyVnVyT2tVKzhE?=
 =?utf-8?B?SmhORytIcFlxZVBlNFAxKzVrV2JEVWVJd0hPZkFqSmdRbUZBNlNVVE5jakcy?=
 =?utf-8?B?UmVGMVdaYlVBNGw1UEtKeEF2ZFZJUHlxazl1QTcvbFpxU1pYQTRYTThPRklO?=
 =?utf-8?B?U1lqYlpkTG9WS29JUWJEQmpEbnQxdisvdXROeStzV3BtSWpRQklobnVFdWc1?=
 =?utf-8?B?R3lnb0RicWRxdWE0Y0JoTmVxWHB5SzgrOU41RXVaNWdqU2tIVzJaUXRiYjh2?=
 =?utf-8?B?QytjdnBvQnhDdmJGZTN6Sk5qMDNjaDdkQVVLS2V2ejdZcnNDWFM5VGw5N3hM?=
 =?utf-8?B?aTFBVUg5Rkk2VG1pRzlqWEtKbzFaVXpCeU45RXFoeDE5TlNJL3ZyYmh6aXJT?=
 =?utf-8?B?aXA4aERKUTg0THZsNEhXdE50V2JSUXIzSm1USytOdU9kN0Z1RWY0OVhhMWlQ?=
 =?utf-8?B?MEVENHB2N3prNUpibU5iQnhjSXUwQ0JVTDl1NTJSK1M2V1BpNi82SEw3dmJK?=
 =?utf-8?B?aEJwQjVmZEhha1VUdXN2bklSNVdrRGd3eXk1dWg0dG5TOFFCQkJ3ajI0Wk5Z?=
 =?utf-8?B?TkZKeUw3bjEzUmJRQVl6RjFTWXkwdTNwYzRMaU1xVnZ3NGNvREhOZXlSZTdv?=
 =?utf-8?B?WXMyQVA0TmNZMTFkb3UvQ0NpMWZVK1ZsSkJTODhKN2ZPL0NiVDRuTTJER2RI?=
 =?utf-8?B?RGNoZTJSdHYvMDY4VloxeVQyWTk2UG9Uc1ErbVNxZzcwMjY4dXd6YUwyQzhn?=
 =?utf-8?B?M0h2azg4NHhRaWtJSnBZeEZFK1d6eTEvWG1LY0ZlM3RwaHRxcis2Z0tVUE5V?=
 =?utf-8?B?Zzd3M3FpcmYrL1NQVmlVR3RvUG5HYVRLWEdJR25rRFJ5eHhjUTI3UDRTbmRj?=
 =?utf-8?B?S1JsempoZlp3L2s4UU5xVm02bFZRMENuQ3M2Vlloa0hpVklTakZPRkdmb0lL?=
 =?utf-8?B?ZDFRMDNDSGdielk3T0lxajNLQktaRDdqSFJSRndsczVFYlkzQjltQy9GRGNn?=
 =?utf-8?Q?Mpd0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHlFOFBtc0ZtaDk3aXl5UWlqTTc5TTVqeFNHeURTYXYrbjB6bjdBNmpheW9N?=
 =?utf-8?B?b0Q2SUNrT3IvUjBXTzNlalk0bGh6bFVwNnlubTBYbFQ1QUNzMlBGdk0yVzdD?=
 =?utf-8?B?TkhxaFBJS0Q1enJHakc1QlFsR202Yll3Uk5SaWJYU1dPVno3ZENZN1E2MWt2?=
 =?utf-8?B?SDd5MWZGMXZHZ1NKQWJUMnBKN2tyWXNQOTlDVjNmUVRkTkg0b1FrMmZUcTF5?=
 =?utf-8?B?NE91NmNMQTgxWDYvalNrNzV6NXgzc1FjWFZyZktsSlhBRWVhM2g5VkFvUll6?=
 =?utf-8?B?OThkUmxJeG5QWFRCNTkxY1c5YWNiSEJ6UENxTE81QjdFZ0llRTlzWVJzRWE1?=
 =?utf-8?B?Q0JPYTF6MitXMzhRZHZQQmpXWmVGRWVtWFd1c1hXcTZQb1YwcEs5WDlHT29I?=
 =?utf-8?B?TnJBSy90L25hOEJucjFuZEdQYWJibEE2TWh6ZjlwUU1LeUhERlpDdE9xVW5T?=
 =?utf-8?B?SEV0cG5iRzJoYmdNMC9FWWtQZm90b25RbnFWcXZvRGhha1pmRkJCWklPc0dv?=
 =?utf-8?B?SUxqODlyUFdvblBTcS8vNEk5WllrOG1reHZsMVNlTWJKakUwMjJzZnNvbUdW?=
 =?utf-8?B?RUtaWVExRDVhUi8rNnRFMEIzSUVCTzNTK0Z4K1pGWHZFVElUL0IvVWJuSktx?=
 =?utf-8?B?bGMreFcwRFRLZmVYaU9mUkxRYjJWNHEyS3VicXRMaWpoZ09GTTNXbjl0eUZw?=
 =?utf-8?B?WjFNclpZem1RWVdNWURQNDRhbUtKNEFvR09aNURMMU5QRWVTTTRRQWZ3OURT?=
 =?utf-8?B?ZDBReE5PclhTUXhURmVzdnRQSFlFRHduRDYvM0VzaFF5aXNZeldaaEVzaGpR?=
 =?utf-8?B?d1JIcFRpUThEOURDQllmeU9KTi96Smk2TWovOFJZWjgrZFFSTlEwQXRkSCt6?=
 =?utf-8?B?QlZzWG9YakdRVkR6VUVtU1hGWUZka3kyRXdQNE9yOFRHMFlUalpJelViclRy?=
 =?utf-8?B?bUJCZGpqMkV5ajRaL2I1TVNwN0xqVXZGS2lVK05JZDBZTHRMTXRQWDFQdERz?=
 =?utf-8?B?OHAvZEVpSUZIV3RtZmdQZFpkYndCYTVUUnUxTHhuY1FJK2s4dGZyNnphQkRM?=
 =?utf-8?B?dnZGQ1JIODNMUTFRSXlzUmpGakZkaUIwSlBFYkF1aFkyZ2lhY3VxQUVmUTFw?=
 =?utf-8?B?bmVvbTJybFVBd3VQTFplbkdDK3puSDUrUXZKR1Z2RVY2dENZSWc3NmFwSVdI?=
 =?utf-8?B?QStGbENHYXFoNUo5TG0ycjgrZDd0K2lsdnFhNmo3alh3S296emtNWUJEOXF5?=
 =?utf-8?B?NE04YzA2aUxwQmprUTFNWVFaVC91TFBIa3pKTG9LbHRKczlNRFptWUxVaVRa?=
 =?utf-8?B?UGpMbUNCYVZNNnl0NTBsNlg5MXlIZUg5ODFtNVVDM0VDZWFuZXpRbkQyQ0xz?=
 =?utf-8?B?dHBnVGdhWngyTmNxc1c2K3NrWnYvMkNDQW5RRUFOOVpWd3ZSOWtOYUtJRytG?=
 =?utf-8?B?TU4vRFpESVRVZE1GVFV5ODQxbEdJcHVGSXRqSUpkV3UxTmQvNjZVWGFOdVBC?=
 =?utf-8?B?YTk0am93bWpzRi9QQ0UrRUQrcHFoOUIxNjBtSTRNbjVUNjIrN2pIUUZsL3pk?=
 =?utf-8?B?b2lkRFhPZzhtK2ZhSS9BVGpJQUFjbFplUTZWcWdBQlhrSm9GTE51S0wvdmk0?=
 =?utf-8?B?SXNMTUMyYTVvcTdENUR6aEFPYmJQSU1tNGZmcklwWWs2c0VXdldHOU1xeklC?=
 =?utf-8?B?YXZWVFJVZExyZFJYbnpXYlhlTXM0RW10T1ZuSGx0Zm01VnovKzh2Z1paVGhO?=
 =?utf-8?B?M1RSeVFrWS9ReFBTTk9NcGlQTW1PU3cyZlRTWWM4MWRxRzBpdE5xQXo1Mk5B?=
 =?utf-8?B?cy8yNmJCeENtMTU0eGk3M0JNZnZDRjIvMy9GSVZEcVRRNFFIdWlNMzNaMzQ4?=
 =?utf-8?B?ZzRtYk5hS3BFVjkrUUxvUlZCUGxEcGVESkY0eDlGanZndjY2OUxYSERHZmFJ?=
 =?utf-8?B?YW1XelNjMFI0L3lManQyUlM5OWlwSi9WVXJxSVZCVnlSaVQzUExXUTFXc2lY?=
 =?utf-8?B?c3RLZml3YTVMc1E5NFFMdXhRT1hCVmJVQmtGUy9yT05tMVFMMmVWZkRJYWFN?=
 =?utf-8?B?bEtBZm5Qck5NbzErM0FIemc3N3docWFYelBsS01BRmlWRmxDYzdhV0ZCOGhC?=
 =?utf-8?B?UGFFZGhBRmozcEFzN2lIbnpnZ05KYk16M3h5alQ1KzNwRUNXRXZNay9kRDZz?=
 =?utf-8?B?STdHMFV1eUFFWVRGOUZMZDNDWGo2SnNPcmhsYlF1RFB3U1lIU1NSK2ovY1ZG?=
 =?utf-8?B?OEJ1YmpxUS9tbFg0YlZOampoWkZ5RHIvR1RoMjNhZ3N3NENqWlIwNDcrUlBl?=
 =?utf-8?B?Y1UxNDNMTStKVHlFWHFwT3h5UkY1RHRzaUhIQWJhQ3hBN0FUa016QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0137b67d-f6f7-422e-b2ff-08de63a93313
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 04:52:29.2391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yyXuJAqjgxdk50yKuZ5sxOzXi+WDx5akZdC56PGNEQ+Cyuh8D527mZLTNMtELgFxG8GdQcwuhbRQVSNtJaFqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8597

On 03/02/26 18:51, Pierre-Louis Bossart wrote:
> On 2/2/26 18:25, Mukunda,Vijendar wrote:
>> On 02/02/26 22:35, Pierre-Louis Bossart wrote:
>>> On 1/29/26 07:14, Vijendar Mukunda wrote:
>>>> For current platforms(ACP6.3/ACP7.0/ACP7.1/ACP7.2), AMD SoundWire manager
>>>> doesn't have banked registers for data port programming on Manager's side.
>>>> Need to use fixed block offsets, hstart & hstop for manager ports.
>>>> Earlier amd manager driver has support for 12MHz as a bus clock frequency
>>>> with frame size as 50 x 10 with fixed block offset mapping based on port
>>>> number. Got a requirement to support 6MHz bus clock frequency with
>>>> different frame shapes 50 x 10 and 125 x 2.
>>> the two frame shapes don't carry the same number of bits (500 v. 250). There's probably an additional variable at play, maybe frame rate? Or is 50x10 for 12 MHz and 125x2 for 6 MHz?
>> We need to support 12Mhz as bus clock frequency where frame rate is 48000
>> and number of bits is 500, frame shape as 50 x 10.
>> For 6Mhz bus clock frequency we need to support two different frame shapes
>> i.e number of bits as 250 with frame rate as 48000 and frame shape as
>> 125 x 2 and For second combination number of bits as 500 where frame rate
>> as 24000 and frame size as 50 x10.
>> Few SoundWire peripherals doesn't support 125 x2 frame shape for 6Mhz
>> bus clock frequency.   They have explicit requirement for the frame shape.
>> In this scenario, we will use 50 x 10 as frame shape where frame rate as 
>> 24000. Based on the platform and SoundWire topology for 6Mhz support
>> frame shape will be decided which is part of SoundWire manager DisCo
>> tables.
> Makes sense, all of the above should be added to the commit message or the code comment, specifically the 125x2 issue with non-conformant devices.
Will update the commit message and re-spin the patch series.

