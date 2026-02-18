Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012021.outbound.protection.outlook.com [40.93.195.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9884B2EB5AF
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 04:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771389551; cv=fail; b=ijxzz2c9Tg/dgvapbnJTpviDKk2rbHlf2cfNosI1UE5UPHHad2JNIXHSK2qZ+G9IzuWt3pnKfmyxHr9YK4V/yE4zysUOYZfJDjVOUncxCO5/JTPQ0kABmPglJhZTK8NPgiY3RCNKh6Z5c0jnMi7uAgTcRle1MhBtjWnND8onsTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771389551; c=relaxed/simple;
	bh=ngTfXjf7ytrXNFlgcUM2NOHBz4cWXgV+Sb7azamHiH0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gFkKnHdXLgjp64tmJIHkPXTzISabTUzBcqkrICPBU1gdEL1N1RsBQFgmWpb4zONY/MDO0+2tZW6bKabPJ0Bus7i1uQNvBFV8ZCjaxDUXSioqFuMfjZK9HTBO/58JAWp3sI+MT7dJNJbooXfcoxpMOg+7trXVnFjm1c+2EJVasHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QI9nRyv3; arc=fail smtp.client-ip=40.93.195.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QI9nRyv3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFo43HpY904VDR+9SZqKzK3n9dR/MNAbVhHBjHWNUeeoA0WMy8Rj2PMujYQcYxqKBEvKFuFUV7cKoNhpNW/cu5rNI/OlO/d31CUQLYYW5F9FqvoMa2gWmycf7z1UHJEFCSgHDBze18571GvK2YU0TQ4YVcv7ZMrE2vgroSfcKELsBu0M8CsINa+3b88znU/Ewfdbt3mTglEjc8p1eXOcmwRZP/tiBg46D6Qc+XZJ3poLb04BjSm73QyWgQ03m6uPrzSQhvXu+7vfOUjCc1Jv+YhY1M+h6vx0LdX4zuQmXSZORKOd103d1lLfCL+xPS6D1Mu8vZQAwbLHMfSmpD8LcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrHqzD14bfO033YgM33IK6aI+ngX35G+Q5Vr+v9Z7bE=;
 b=rC0LN3sAat/pTMC4rAb/lJ09nx1ns9FoN0i3ExJVmlu5ENF64lRAKv/1xYUotDbF42F2LJGMf4Tu3MbYZ5x5u4PLyaMB4n4pR02QYYdewqmJD3IzTq4g2PYmk1SBmaCDGWIvqL5kYu/nYjuOvKzKxTHQDhT8iqWu12gR5Ui90dH83D02DisqaNqqr+7p12HUkGWjhMA1wro3Qw9r3EYioc3CizYwGit90I9DMD0vnmXtatObhLShHkA5K5402PO+KQbAe+GPhsGICLHlkzOQz7ZX6Y7Al/VKWthVjOr0g4qp057TY3oS8m5Zy0Y8mmHUpAlq3DZZ10TjipAR+m97JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrHqzD14bfO033YgM33IK6aI+ngX35G+Q5Vr+v9Z7bE=;
 b=QI9nRyv3TPBkGp0BuEbDoz8DrsPRwDGWzcFqavnoHu8as4NWa1gAWlHb9jPBpHQklc9y+wXv41LjbwyjfsH1WxlUplC9ROngR+U8WajIRwkPy5ELDMyzwC6Ki6432nfkjVgQVqVlUgRdeEeMYtMoE+xMO3jkcO7lTXXa6jRt5PI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 SJ0PR12MB6880.namprd12.prod.outlook.com (2603:10b6:a03:485::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 04:39:08 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 04:39:08 +0000
Message-ID: <8efef80a-761e-4399-bd33-c7f2268caeb1@amd.com>
Date: Wed, 18 Feb 2026 10:09:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to quirk
 table
Content-Language: en-US
To: Azamat Almazbek uulu <almazbek1608@gmail.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org
References: <20260217121219.79960-1-almazbek1608@gmail.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260217121219.79960-1-almazbek1608@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ae::11) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|SJ0PR12MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ec0703-6270-488a-b72f-08de6ea7a767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkhBc1BRSjlGRGI5emhSVlVDK3o5R3M2bFhLQ3pwTTZiWVhUZ0tpdHBYV2dh?=
 =?utf-8?B?QTM4Y2p3aEhrNmhYUWlTOXVDNFVJRkxKSWZvVGZOSHlEbDBjNjRta3Q1ZXkr?=
 =?utf-8?B?cWd1L1Q1NmJsWExZZE9SR3ZKeEtMVWVvMEQranlaOUY5ZG1vQS9Db1piRVFh?=
 =?utf-8?B?RFVCSXdkZ3MzWGxMZkpBRnZPY2NSOHRDQVlFR0J3WFNMYlpHWWFsMWNVeEJ0?=
 =?utf-8?B?WEtyUUJoTDU1VHFHZ09RdURTcVN5SC9hSkI2bGV0RHBtU0c4VFF6VHp0czRm?=
 =?utf-8?B?STA2ZEhKV3pZUCtKUkVSOHNSSXplbzJyRnJudVRhMGZtY2ZzdVRLNzBhQ2l1?=
 =?utf-8?B?Y21PT0xoZjlReUlYUTlEZGorUHFzaU10SWpDQS9UZElub1BISUFiQTMrWEFn?=
 =?utf-8?B?TzY5SzFtR1hqR2VQSE1ZOGNtT0VuWEYvTGhZQkhjbG9PYUtPRHRLM29aR1pF?=
 =?utf-8?B?cEJWY1RwdHZPd2dwVUpZQzJ6c0FQL0R4SVVHTGVhNnlEUEpBNUpJa2liR29Y?=
 =?utf-8?B?aGFWQjNRRlNzNEU0UWNqc1hLdGxwMUttemJVUWJIdWRBSVlLVVNkTE9NMUk2?=
 =?utf-8?B?MitrS0ptRGJGdTRFVXlTUklxRzdlNCsxZHdxUFdxUDhFN29PUE1Sa3VtQmhh?=
 =?utf-8?B?QzU3VG9NWHpESnIwSTdiWjBBN0dKSENwVzVzNjg3cnpDYmFQODNWeGVCSkdB?=
 =?utf-8?B?YU5RVWpTVDI5Tyt5dFgwcjJ0R3NOaUJBci9qRHhDTC9QVkg5T3Fpbnhlb2li?=
 =?utf-8?B?cDhwMGtGa0VmQWxkR2U2U0JUbTk5QVpKOUxvQzNpek96YTVaQ09nMFRSTGRT?=
 =?utf-8?B?TFNhSzNKS3YwemhKWjQ3bTFRbTBlUVdEVWxldlRQcUQvbjNKRTBoeGxFaE9o?=
 =?utf-8?B?a080ZFBKclZ5T2tCVnl2V0QwOEp2NnBkL2ZvMENpdm9qODdXaWUvT3FXcW0v?=
 =?utf-8?B?QUdyTjZ1UmpIODRZWnRlaDFOQ2wwNzc3dG9WZ0tHY3RsYkU2N1JiZWI5VlY5?=
 =?utf-8?B?UXhObnV6bmF4TUFRMWYwbDM2MzRYTmJDcnNkU1R0OU1URzByamxrTzB1aGRn?=
 =?utf-8?B?UzhWVVdqL2ppZ0p2Wm0zQldRVXBGeGRyN24xa21EU2xTWHBmM2JPZy9Zdzdk?=
 =?utf-8?B?N0dWSU43R2RSV2RNOWpRbTl6enNPZDhDT0xpNWZEZUFTVG1xVGdUdDNRYVcw?=
 =?utf-8?B?RDJieEtNc0I2ZWZoaXBMVE9VUlFQZXAzNDJtTHdwRTdodU1IY0crLzV0bEVw?=
 =?utf-8?B?TXpUdm1sYXZCSG5tenpDSHFEUDd3NFB0S25qeUZOTDdpcVJoSGZkZVBOMmk3?=
 =?utf-8?B?L2tQZG1mWGMvS1R0K1FJNHdZdFBHSkdEQ2lPTVVac1JuQjRzQzJoLy8rOFVB?=
 =?utf-8?B?SkJtdHZveVVrdlI1RkJZUitwOXhneGZEQ3FTellNVGsvQ3FxdFJKZDJuV2lY?=
 =?utf-8?B?aE55RDNpVjRGbkJaTUl4bC9NQzcweGI3b24wOVZZTURhUDZKRXM5eEo5a0ha?=
 =?utf-8?B?TndWZ3hNZnB5ZnNncE1pNm9zZ2poZ0V6dnNiSUpHekNTdzBocGNEY0hWV3V6?=
 =?utf-8?B?Uzh3aksyQnVodEhEN2RhTGk4b09qNUhsQk1UQTNOcW45OFl3bytPTGI2blg4?=
 =?utf-8?B?dDduWDV5Y3VFZ3ZFMnhSUUQrMzhva2dKSVJIeDd3L2FabHA2TTJWQmRod3BE?=
 =?utf-8?B?Vjd1Z1RtbThBakU1K0VrTytDU25XMGNXY3h4WnRZNmZ5SmRndDNQNmtDNWFD?=
 =?utf-8?B?Y010VGJDSE1OZHNMUk45SkVvVjRTSW9Rb2VCTE5uazl3MXJsN09QMDE3eDZa?=
 =?utf-8?B?OHA5bzI5bFFzdjNkRkczK084ZWtoRGREOG5HUlFyNTZmZ01vc3V4ZG1QRG5M?=
 =?utf-8?B?d0J5Qmtyb0F4aWFXU0hUN01vb0luMVkzVXZQTDErenl3emZoTjVEYThVS1Z3?=
 =?utf-8?B?YTc4b0U0RFJ2THZNcC8zMXJCcU9Qa0J0WXJmdmFyeGJsYzYyZFZZNzZrMFZj?=
 =?utf-8?B?TVZSdFd5dW1VNjcrMEhjdDc3SDc5dzBJNlRUM1hrVzJrSE9PM2p6dDRwZURl?=
 =?utf-8?B?N0FmV1dzVGI2dFV1OXRNK3kzdnlkWE4rRjJoeDVacjlMM05pVkJ2d2hxQmMx?=
 =?utf-8?Q?X2lA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGRhS3hPTXM0NXgyZXErQ2RuVEdhK3lJbERGVk4vUFlxc0FpUWQ4WGpybHZz?=
 =?utf-8?B?dFlGZVhqWWNVdHBTZFZCaG5PbERPUGQ5cWRIY0lVMjVkc25qdTJBbEtxRXor?=
 =?utf-8?B?N3V6bTJsVy8wOEFVcmhFRkQ2UlBiNUt6dHVLQ293QVJBUDJ5U0wyb1ZjcVhR?=
 =?utf-8?B?S1pMOGg0L0poSTM0UGtLUkhsTkhXTUR3a25zREJOeHZ0Ym5KbFd4TlVPVUpV?=
 =?utf-8?B?NEJQTDgyZk9qanF0Q2RMVjJNcVJQZFNLcCtRYThDSW1zVFplN1JEOXVVTXFt?=
 =?utf-8?B?OUs5dG5UWHRrNDJlS3BtRUVvaXltT3pZTStDRlQ0UWJaUisvY3RJT3NnZTEz?=
 =?utf-8?B?UmZxajZGN0FDSUVNYkc2YStPSXlBbHBZeHJyYmxTNmtneWtuRyt2eTZCbDFR?=
 =?utf-8?B?YUVKY2dKLzlBNVpmWnRJY084ZVVoTXdnSDF5TlZINDArdVd1bE9HYUU2REcr?=
 =?utf-8?B?bEN0ZGFnYXEweGpwYTgya1VEbXRjbERZTkcyYVNGQThHVUkySGd5WjVjZ1Ix?=
 =?utf-8?B?c3RrTkZCdVFDZ3NHcm9welRJTVkwZ2xGbVd0cXNyeFIxWlI4RFVRRTJDSUd2?=
 =?utf-8?B?SzBCbTJ1Nml0VVFacUNMY2hhWnlRYVlDSERoWGMzRFhUYkJsQThaUEtvTEhY?=
 =?utf-8?B?N3ZkU2w4L281YVU0V2pzUW96bTRGMW0wSFBvRm90cVRlVzVHanpjNnBiUjA5?=
 =?utf-8?B?TjE0dzl3WTBDSkxmL3JGM2ZBYVNDRmdqSHVHekJiMEVwVVZET1l2cjFPVjNm?=
 =?utf-8?B?MzRMVVFUc3hpbnk4V3JheWRlYlFkckJJNXVkWlZ5b1BpbU1zOWhxR3RINzA1?=
 =?utf-8?B?a0VWQ3VWTEgyWDJia3JhcXZoWTJjYmlZOTRjZXowdGdhR2FGdVFWS3hKMXM4?=
 =?utf-8?B?QmV0Q1F5cDhrSnZlMm1Ia2NDUVZDYkRCcEhqMDVpV2lhL2Z5V2E5ejVOczFn?=
 =?utf-8?B?L2NXbnBVVDROaXMxcUVOdjdnemlwdmxnNmZscENIOGsvd2QwVmtQb0xpbzBP?=
 =?utf-8?B?WHRWd2tPeUZmSzFyMEhVMkdEVklyb1puWGZQRUZJYlFmU1V0cGd2b04yaGdH?=
 =?utf-8?B?NjFsN2pMeUhLYUZBUUdLR1dpV0o2UUUxemRqZDBtUEJqbXZWckpkeWhXWVMw?=
 =?utf-8?B?a3NhUEdRZTRaZnFUVVo3MXpaQldiekl0Nkx6d0RadzZ4YS90cEJVdVRqMjRM?=
 =?utf-8?B?clRmU3hCb3VKejZTM3dBR1Uvc2xvOFk5QXV6SXlpYXRnR3JYeDRNL2NZaDlu?=
 =?utf-8?B?U3Q1ajdBbTFjY2xMV3d1TUY3R1p0eENhMC9KYjRycWdOR0YrZm93ZWFDQ0p1?=
 =?utf-8?B?ejBKek84NHRmeXNBZnh6Y1V0clFRS2M4S3V1QjJWNGt5Sjk5YnAxUTQ1czYy?=
 =?utf-8?B?Y296ZHl2dTYzdFB0ODU5dk9Rell3MHlPSHVwdmxKU0lDUGtKODYwMkRVck5L?=
 =?utf-8?B?bE9LdVY5MnJvQ29laXZZRHF1QmMwK3lRZWdWWFByY3NSMjd6RnBOVThSMEo0?=
 =?utf-8?B?TXpmSlN4OUVkRGd2MUw5R1dIK1lhRkR3ZXZZY05PYUYrZGlGd0twZElRRDJr?=
 =?utf-8?B?VlpBdXp4Y3RhcEF6Y1VqVHVremRMdlYxMVhmeFJram1OallsQTEwWm0yeHNY?=
 =?utf-8?B?Ni9LQUFiS3FXK0loK2Fid0ZITWN0TjlyRUVWTWYrSitaQmZCQ0YzVFN1M1lk?=
 =?utf-8?B?ZFRkTVppMHJWaUJ6RkZrYmVxam1kQjBRZG5na1lOaDJYRXlSazlvMHdnejhF?=
 =?utf-8?B?bG5JOG04TVZOVU1ReTh3d1RPNGNldTFRMkxBS01Ma1JMcUYwUnhtYVFIeGw1?=
 =?utf-8?B?OWJXYzkvemhxZkRoMWpwa1RmNGdSbjNqNHhVaW9xNzFSU2FsZ1pqZHhKZHho?=
 =?utf-8?B?dXppOGVsVW5KL3YrL1dScS9lTjgydytkd0t6NmpWM0NSbHc1bjUxL2RSVVl6?=
 =?utf-8?B?alBDd2F4QjRtYnZQZCtnMWlqY0FwSmJ4ckVJNHV3cFNTbkRMOTdlV3pSMXlp?=
 =?utf-8?B?ck11NXpraloweERVa29HbStBbnhuT1dNWEQvQldsNVl1RVNlaEJaU013aXM5?=
 =?utf-8?B?TDNxUHJVMVhMcWhlN28wcWhIQUgzMnBzWVp0ckQrcHg3RkNkUU9mZForbTBZ?=
 =?utf-8?B?M2NGRUhydlhKNEN3MUgzN2JZTU1XM1g3a2NrR1lhYkRicE4rb01wWExiVW84?=
 =?utf-8?B?Qml5ZHFEUGNDQVM3WFZUMVJLREpkRnNGVFBnbkhSa056MzNjMUlHM2VjOFp5?=
 =?utf-8?B?WVhIeUFqSmVOcDZ4YzNJako1WklnSGM4N1Zucjk0cGZHQWxlZHBXRFVVMGZS?=
 =?utf-8?B?QThZU3I3STR5YkhwMk1TNlQ5MmtDZEhyQnIvOW9tV3BtblV6TzBFZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ec0703-6270-488a-b72f-08de6ea7a767
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 04:39:08.1451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1uCALSb9L9r1iAHlGRXFdCmte716c1tKx8JpLTiOSyC2VXMBMTfWiXbtQbETlcdEy5boHL5PWJFm7Zcdq7ACNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6880

On 17/02/26 17:42, Azamat Almazbek uulu wrote:
> The ASUS ExpertBook BM1503CDA (Ryzen 5 7535U, Barcelo-R) has an
> internal DMIC connected through the AMD ACP (Audio CoProcessor)
> but is missing from the DMI quirk table, so the acp6x machine
> driver probe returns -ENODEV and no DMIC capture device is created.
>
> Add the DMI entry so the internal microphone works out of the box.
>
> Signed-off-by: Azamat Almazbek uulu <almazbek1608@gmail.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/yc/acp6x-mach.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 67f2fee..9417b53 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -696,7 +696,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
>  			DMI_MATCH(DMI_BOARD_NAME, "XyloD5_RBU"),
>  		}
>  	},
> -
> +	{
> +		.driver_data = &acp6x_card,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "ASUS EXPERTBOOK BM1503CDA"),
> +		}
> +	},
>  	{}
>  };
>  

