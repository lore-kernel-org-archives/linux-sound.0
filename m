Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011030.outbound.protection.outlook.com [40.107.208.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130EA2741DF;
	Thu, 29 Jan 2026 19:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769715398; cv=fail; b=D6C6EVzeaJmZDf7SuO5TUAyn80Ck5ngEPEsNAxEVUltVfWzO/7yRujnIPFCaZz4ATEFvZyWCcEEaZ/CeHyQ2QVP051K7TI+X17J0Q45mEvpgdD8zEGF+IZWdXs8u83TA3VNLQEFdWACT8iq98GVZFw05wXuE5cR5Atqhkml3Dpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769715398; c=relaxed/simple;
	bh=V0wp/ofPQisWkObfDqjuTviEMwB64/e42hhQzWRueLs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Vshrw+zrhe/v4UQqWckjN0x+yxo2CE+LPjAjG++vnYzpyUQ9krxF5jspFNxqqSSnKPvsp/MmO3iskYc6EKunbSfUhitVoHvJCk99YscT+liOrdkrzZLXYu7kjbeQXDu4c2KVjxT9pWzDdp4tC08HvydTgk75JDGoQ8h76mkH+LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ypHbMHkF; arc=fail smtp.client-ip=40.107.208.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ypHbMHkF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izLdJE9XAfEvWSUBwKviecPG+16mE6EdrLoqXWH9v+TMKVcdh0pDiDWP3Ojbc+5LGJyTs3k0wBtN+OodItSRx+8y+N10ZJL2oyqwwXDUp11t0DjLqCHyZIZNXp418D0hvkjBkcMTFxRNhNVNifEvaSv+/wXZZuO1c9vjpyC6gs5+Bn76qlc6MNPGIy1jvkx7IhVIt1yrmKFAwM7tLrjI3PxVKsKQGImc+J00N7FmgWsJeVZKvxBov9EehMXNSL2I9s2YavEuYC891UcYr+zv8XDZ29dMf608KKR3+rlqJ6KVwmXlX+OwNoxsv+VLLwJw85pieKgqXx2Pkqh4IbiDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pscQWg579GoTEGj8FHKDczsZ0V2EztDX+id2cseKzo=;
 b=doNuZN7YoM4cvCx5/yOGvWifUrQHSMu/MymyoQQ7h6a6FLv0QXpb16jAwbcrG2wQZUk5vwl4BvrgpmJBRLdpiGngqOuBQCVjxykntW2/Q1DwCo2DH8JLxmVrp7W8QJV41FyUJ89zI6M3yYtSeBuinqFGvKX373He1pdpVgjJ7umWyFOnqgBKRkrU3YhmLeXBuP6bXFBpFLIgFXdHmB8pfOeBuW1axDaAGH4noc7UXyiLhdjdu/CD4IlHkIeAPFqft/x7S4VNi6roNlATxD8adx2h9DTiewf+SBus2VZczfl6qERgUp4/F6aCtARaYgA5dDbgPbMBDL49a3np+FaCUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pscQWg579GoTEGj8FHKDczsZ0V2EztDX+id2cseKzo=;
 b=ypHbMHkFUzL/NuMjgs9B4P8t9oYA0eMkAH0Yt1EVlrCsC2hhg/bUcwqHKEj+IKHIUQ8bMfJNl5VV08nPdNhuJ8cl+G/5iJh/H+JYZKWLyMx+IgNxRm5uvRMVlH6SzfmWykXuxkOOpIg3lOcsFEAkARPFfcMSrxMKkrmxszjZZcU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB8576.namprd12.prod.outlook.com (2603:10b6:8:165::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 19:36:34 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 19:36:34 +0000
Message-ID: <b4b2c531-7e9c-422e-b825-e34519e0afad@amd.com>
Date: Thu, 29 Jan 2026 13:36:27 -0600
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
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260129065038.39349-1-dirk.su@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0029.namprd18.prod.outlook.com
 (2603:10b6:806:f3::28) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: 22bb48dd-c63d-4048-394a-08de5f6db5ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U09iS0dEbnRoZHlmUjBmempRM0xocmRldVMyMmJNdWtvRE00dTNTNTRvcEdq?=
 =?utf-8?B?b0dyQ3oxRWJwZ2ZvSjJQNEwyNkJiV0RnckdDWUVVK3ZoZmVtZ0ZUc2k0NUdo?=
 =?utf-8?B?Z0ptS0YrR2hVS291NUFzSjUwNXJ2VTlUWkRuMEtmcmNYRUYrbUF6Zjd1dHZ0?=
 =?utf-8?B?c3A2ZGxnNlJZemJBcDZITFBmSXFjMDViMmgxRG9JNjJyZjJneE96SzJHa2tw?=
 =?utf-8?B?b3JiVkRXV0J5MFl2aTh4czVaVitCQnBlQU93Rm9HZjdUQUZlZ2pvR2kzUXps?=
 =?utf-8?B?akNKNHlnZTdsTFZWbVkzcVNrU0RBRVRSMjMxNU1BMHFnbUFuNWYxcG9uQjc1?=
 =?utf-8?B?OGM2TitJTUNpWDlHZDNQQk9JdU5YaENLaWYyckNNTEF3bWJHNVYrSC94UFo4?=
 =?utf-8?B?MmZxU29GanloOHJIRVZ4RW94ekI1THd2ek1ZVGVyczZIRklwZTlJcXdIU2I3?=
 =?utf-8?B?dkJzSlB0N2c1d1Nxdm5qWTlMSkNiWjd1ekQ0VExBYkdqK3ovWFlQQytYT3Np?=
 =?utf-8?B?NWFmaS9xNjhiS2ZkZWxDNlByK2JWZjNwdUdtem9QKzFOVk9vRXc4c3lrL3Rk?=
 =?utf-8?B?SlNCZzcySWNCMlhFLzBhbVVwdjF2ekkzOE56cnVQKy9jRWp3ZXVGbVlxWmt5?=
 =?utf-8?B?STRYYUZWM0VkRFlIY1lFMTR1NTRXNGF1T08rODE0amNIa0J1MFRNUmhMZk1h?=
 =?utf-8?B?a2o2MlRCdkxHcnU3c3k3RGo2TjRBVnlXYjZKVUowY3ZKckM1RUdoYWt5QWh0?=
 =?utf-8?B?RG9OYzVVRHVjanV2VS96SUtqYk5ETm8rVHQ5M0NQODdzdUdzNlFqTlB1Vmwr?=
 =?utf-8?B?NFJrbjBBSzRtVFF3SktmdkpuSmJQNkxBTlAvWmluS2NIUStLUk5CVC9IVWJB?=
 =?utf-8?B?NEo2YnhlZnJlOHo5TW9XUHI0TTBkUDhZL1V1bXNlZ2ZsM1VEUmtIaUMya1py?=
 =?utf-8?B?d29lWU9Va2tVZC80NENqMnduaXl4S3A5T3pRUmFMeEloWXVTUFJ1TzBuN01M?=
 =?utf-8?B?UkFlaitONndWOEM1RFozRHE1Rm1WMzc2a2dlVEcrQld5TjBVb3NrTHVGemZn?=
 =?utf-8?B?VXFZajc5N0lmYUNIRnRBRFRmRFBQRW5GNVhBcityUldjOEljdlhTRzZpVE9a?=
 =?utf-8?B?a0ZYcm83Tkg3c2FWQmJlR01QVkUyMmhDNjk0WWFjdE8zMjAxREZmaUwvM3VT?=
 =?utf-8?B?dFJSbks4QTZhU1JjZi80MnZzUzBlUERFSTV0U1JyblNpakRtTmVPc0doVjMx?=
 =?utf-8?B?QlBlK21FSklwUjVVN3MwNk1qQitTYkFlM0Q2MjBSMC9XY0dCcTVEaXhyTW9h?=
 =?utf-8?B?Q0kranZlU0ZXSVJLdGw5TW5mUlliS2FFWWVWMXVLTHBQeUFzZSs3NGd2T3dN?=
 =?utf-8?B?Ymp1M2xFKzVUbmVZRjEwdTZTem1WaG85L1pGWEFMSUc2NXQ5NHZpbFVCT3Bj?=
 =?utf-8?B?dlZ4SUlPdnJETTJRT0ZSZ0s2TWE1a21SejkxRUlnOVR0VE1mWnF2aDMxb2R6?=
 =?utf-8?B?eCtMZnpITHFVbC9yU0x4czdCaG5tVzBjSkFyWHZVOVgxQUt0QzgzUVhlVkIx?=
 =?utf-8?B?QkxHNUZMUmJBK3dOcTlYMVcybGRkYzgvd2w1aUNiTC9jbHU4MVJ2cWlrUDZu?=
 =?utf-8?B?QUdaY3dvNkpuM0xyVS9rWTVrQ0wycDY5d3YxRTVEUVZuUlRzR2l2NXcxSGFr?=
 =?utf-8?B?QzdTVmZqa2VDZHBMek5SRktCMU0rRXYvYkZXWDlWUEhYQXFzMnZvL2NJL1hN?=
 =?utf-8?B?VEVhU3RRZ1d6RWJjMlBxdmxWSERFWHIrUXlDdGhLcjF0dTEraTJuZUtLRkla?=
 =?utf-8?B?MVFEcmFVTEg3bEkwVFZOeCtzNHh0cHVIRDh6bkp6MzFGMHhiUnNZVTY4c3VT?=
 =?utf-8?B?Tkx4VGxGcTFZMmQ4YWpwdGRlSDNFTFNTRkFZLzBBTFFPbGsxQkJoOGllZWk1?=
 =?utf-8?B?VEtXNEp4WFI2SnFzenYvU3lWODJMenk3R1BKWWt1bHdybEtTaU04SzdPSmlT?=
 =?utf-8?B?WnpvRHdOOHg5WWdubzAwZTZmbU1sWnBoNnh5UjQ3WENidFJiVzB4MFg5Y0Js?=
 =?utf-8?B?Ujg0QU9POHFnaUtuREhPSFU4cWVSek4rZ2lJRjRKTU5nNUZGbHlxZVAydTRo?=
 =?utf-8?Q?H54k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDhCeUxLdEJKSEZhVS9BWTVYVFF6UVRiREg4cG84d0w3NzJZOTJvTVlXM3Bu?=
 =?utf-8?B?ejJaMndKblBOUTRVNTRWUEY3dHNwRkd4UjJEUFZ6VEN0VmZJYVN1QTRGZWtC?=
 =?utf-8?B?RzFEZUVXTDJNQ3VMdVF6VExTMFdwN3QzUHpuT3lGMkIrWG5uOWlpNnpmVnNX?=
 =?utf-8?B?VkFmdnRnaFZaZ1V2a0xaSGhqT0gxK1JHMG9lN3J6Z21TOC9uakhQWkRtckVD?=
 =?utf-8?B?d1d6K2g3NkN3TzdtUjFVRmdqSFZmZ3dSVTA2ZVVhb3dib1U5SmZVRE5rdFhn?=
 =?utf-8?B?S0pMUEViZ0xmaHlsZ3JtTStBK284OWVza0hKTVRyRDUydmF1elg5d2xQRVdo?=
 =?utf-8?B?a2FEM0NkNVJsN3ArVzdxR1FERHJVUVVsaGRGV1hrSWtMM0kzS2VuVFl5MFBO?=
 =?utf-8?B?SUkwS0U1VGY3WXkwcHU2Q1dXMEZIem0yQlo0ZExKOUtPU0xDWjVFcjd3cGU3?=
 =?utf-8?B?VXpvdWgzeW9ZYThPeGpyajBuVE1uSUJtb0liQ3lEY0NzbTMvMkI5Y2xvRXJp?=
 =?utf-8?B?S0xvLzBhdkhxam9xNlluVjdOYndIemFmRnNkdWJ2dVI5aTFRNVVqUlFMZDk0?=
 =?utf-8?B?b2NoTEF1UDB1K09lNEZlaGg2cVdTa0lyM2tibkZiR2dIRE9RQUUwb2xveTd4?=
 =?utf-8?B?dlVyL1djWlBWdHBKTlhNbkMwUEp3SHdEbWpEa2I2KzczQ21NZWtSOW41WU9V?=
 =?utf-8?B?QjZOdzZjQ1ExZEJyeVBDMVdhM3hJUng0N3hOTTNMVGVsdVhwWVZQcGdwR2Vx?=
 =?utf-8?B?ajBPaTZpT1dPQzRDVkMxekdQSGpOUVh5VWRabk5KcXA0eVU3aWxzV2dac1cy?=
 =?utf-8?B?VWhONUhNZi8rNXVXY0RXSzZmR3p0Y0pYYXlpc0FpcHYvV3V5bTdvaUhsZUI4?=
 =?utf-8?B?b3VrVlpxZDBXaklhQ3BhbTJJWUZXdEhKUDdsNXBINGtGY3NhcUZoR3pBOVFn?=
 =?utf-8?B?QVJTcjljQlcxa2dpSGQ1TWp1VjdRTUpITWU1cWx6OWNNOUZSTVo4MWU5T0RO?=
 =?utf-8?B?eE85U1RCbHB0WUJ6TDBpTUxzT2JaRlk2VkplWjFxdnJsYVYza0puWko1U1h2?=
 =?utf-8?B?UFp3ODZrOFBteE5OWE9mbWNUODlDTW13SlBkNlZ5L3RCckRiQkNlYk5jODNO?=
 =?utf-8?B?bnlHa2pFSFhrQXBvaW5pd2E0b05xMFFEWjM5L2tXd2dDNzAwcTBGMEFrdDRZ?=
 =?utf-8?B?N1VFT3ZwdGZUSmdDSXVvK3hhMGVEd1lYM0FqZTlPTVZQZDBYcG5HOWloVkJ6?=
 =?utf-8?B?bGVNTUxuZmRMTVNucHJCQVpQeXNtOWdhQTdaVTNrbVdYbkNiVGhiT1NEQWFj?=
 =?utf-8?B?Q2d4cjBXOUhtYVVMSUpIejNEbmpEUldydlFjQU9JUFUvS3ltQk1MaWtDRG5J?=
 =?utf-8?B?cDI4SW5aUks3bCs5S2J3SXhuTFo2TGo3Ym5sMk1mS3BYMlA1SGh1clptanBX?=
 =?utf-8?B?NnhMYVNWOWF4dWV5U3JOSEZLSW1FZmUzLzk4R3hhMGRYYzlyMnVMaE9mNStC?=
 =?utf-8?B?UUhIUUgvUWpmakxBaFJQQnlLMzdFQnNpeG9WbkFXRHBXb1h6MDFDSG9xY0Fr?=
 =?utf-8?B?WGtocXlHUzZqMks1NmdqWmQ5ZUpPczRoaGRNT2o5U1NITElQN0lEei9HRldX?=
 =?utf-8?B?N0V0TFFzMCtXN1Z3YU8xRUhISFJmK2hzOXNlSXJMcGxDKzMzQkx0Uit2Sk9U?=
 =?utf-8?B?VHRnTHFZdE5QZ3M3VjNLbTdEQ2RyUzJMNG9QaUdwa1pEREpQdG9uRCtHQjkw?=
 =?utf-8?B?NFcxb2lTWlhCaUlBeEtZcmF4MUZrcmJMNDY5Z2RrNUdzaUVEdE9PMmxXTjlT?=
 =?utf-8?B?dHdlb1VEU1BoTmorNWZnb1cyVzlhekc0N01FKzJ5T2lja2dBZzd2Zlo1V0Yv?=
 =?utf-8?B?RTNUejhrY09JenUrcE1MdXdrMWgyYTV0c1JLMXJZT3dmanVCT1F5RmxGUEU1?=
 =?utf-8?B?dkhrY2YyUHR6Z0ptSDdsSXNPMWJRckMrRUw2dk8xSlhvZEFxNHhJK09FdGJP?=
 =?utf-8?B?S3hydGU4enYrNVV3azBHaWwxV0paOWFrUFlYYlREVTR4cG9ObVc4NS82OFR5?=
 =?utf-8?B?cEtjUS9GYWoxUFR1OVJqZmxZQzdieUEyY08zV1hMdm5NVWlsZG5OYWtMUnBv?=
 =?utf-8?B?TTdsSUVKdHBiZmsxZEUxZ0M5UU9LNElhQm8wQ3pFTzZOSGd1UWtyenN6WFRm?=
 =?utf-8?B?UW5aM1lyZy9FaVIrSlFKVXdlTnpOYzV5clBtZEhNMXZ2Y2FMSklvKy9WVHU2?=
 =?utf-8?B?eHl0YzZ3WjZhTURpUWhJb2trMmlqeDh3TzFydVk0NldoUnZOOXA1YXpNZndr?=
 =?utf-8?Q?5rVZHaUnZt6HsUQeh0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bb48dd-c63d-4048-394a-08de5f6db5ac
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 19:36:33.9909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qCHhM9QMa17BvWUDLCjGvruK5KBD1HYWfhgP9rj9isxQ5fZRM/hOlnKjZaQaWa3H/hkYSj7g5119bohFmIVBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8576

On 1/29/26 12:50 AM, Dirk Su wrote:
> Fix the missing mic on HP 200 G2a 16 by adding quirk with the
> board ID 8EE4
> 
> Signed-off-by: Dirk Su <dirk.su@canonical.com>

Is this a production hardware and firmware?

If so this patch makes sense.

If it's not, can you please explore adding the _DSD entry 
"AcpDmicConnected".

> ---
>   sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 0294177acc663..500b4fda0581f 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -633,6 +633,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
>   			DMI_MATCH(DMI_BOARD_NAME, "8BD6"),
>   		}
>   	},
> +	{
> +		.driver_data = &acp6x_card,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
> +			DMI_MATCH(DMI_BOARD_NAME, "8EE4"),
> +		}
> +	},
>   	{
>   		.driver_data = &acp6x_card,
>   		.matches = {

