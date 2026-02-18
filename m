Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010040.outbound.protection.outlook.com [52.101.193.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C50A2F3C1D;
	Wed, 18 Feb 2026 04:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771389509; cv=fail; b=DE3PXjPCkPYqyQWqix8dWxFdqGSwc21B47hAtqRtFNaWPvK3v0Xfl3x7Krk8/YE+uiWYQcOkcavj9j3oEvHF/B7NsXQzhoQWzxLtBnS0QWEznXCaRGTGrDdhT+TaxVEhQMuqiDfn08NPlqeplYoCI2KIrBINxaHDp/cQcHNgH98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771389509; c=relaxed/simple;
	bh=SBzW+P2JO6eEuGnRLZXc5mkbZ7sq/0XpqWiEn/o46vU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A2i6dE/O5fRu8UMkGlvW8Qxo7Uu7+Z5n7azowb5TwbyG3vbJlljcaR7KiIinkOYyH40Y/3+qE0L1PBuCCAZDrsMwhLFfkstRdWkHRYX1db8fyEry6dUpNoXxfTyZM8wo1P1lCN6jVIW4HTGqW5ZLJLk6Qs1FsRpcK3Hf9QHvF3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ljyIbbgR; arc=fail smtp.client-ip=52.101.193.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ljyIbbgR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csW1OTa3rebldXagGnJAnRuQr06fByGFfNnPG1jPVSYf++e3MEK+5/0VgxRKT31snJgDQ3PDH5gTpJWQd8p6oB9KhirkMqXxqXK0IeYRE23TteCMbOUn9B28mqTH8aRy6NGpwFS0EyHr2A7D7TBhG4DzCDiItm6c65tSSE8Zj00UUqYrBh8TS2s4q50ohVwwaWKka419pjW3eTh9Bj/2ReF0ER+EoD2Hxwa7NM1+Vx69F4sfCsE11LiMa2on5YghQoOJK0gQiBlF1Wy7ZBCFr5qByksYmQgHpCH/qP0pqRB/ORF+R/LrAu4y+zmobiwmohuCIos+B9/iBTpmzd7nBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COjp2yX1J4SDEbfVEHgjDLwGsPasU6RhKse8CbLmpI4=;
 b=b7YdyDASaV/UQzxHJLtVFxiey4DYejZlU5lyOTVLCUzdaP9XyEG8LGppjdI3l35lJE/QoDcfXREpGHC0fXgudEy626IPjWG1tdynNOz3FhocEk8nX9Q20cIUS51kKTBSYL1OoYJujtnQLaUr/EtMQwGMonwjn1xIhfW4Oq0iwJX1M92HObNQqBbFOgcPZFN9sEZhoXhJzGIXcAGkVX0+3IzMjfLAe4n56z2GufUvsJZuQfa7nb/xUWO0n/9YPfBWOyT5ZyfBYWekeRbnJOF1UxVoMiOe9qJ1vQ/+eOeTYxQ2EW7uGBduhuugohu+xA7D3WHslpspcWsWwrc/yfdirg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COjp2yX1J4SDEbfVEHgjDLwGsPasU6RhKse8CbLmpI4=;
 b=ljyIbbgR31BXeJ0a6Z8sbQSNrRSa/fW7178knxtJ+QDAJsO7iTrkeos7DRvNZmyHXcM3qtZ90UJ08YKYwLGHf/pkw9mvauZshkMWmm9881NGrhdiQsWktt6GPjR8lmGibrrUwhjbtRWHGOVZZC2w08f5lwkAIIfzc+Ins1NLwjs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 SJ0PR12MB6880.namprd12.prod.outlook.com (2603:10b6:a03:485::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 04:38:23 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 04:38:21 +0000
Message-ID: <1cd8a122-f6b1-4c4f-b9e1-67bf0a27c88e@amd.com>
Date: Wed, 18 Feb 2026 10:08:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] ASoC: Add DMIC support for the AMD RPL platform
Content-Language: en-US
To: Mingyou Chen <qby140326@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 mario.limonciello@amd.com, venkataprasad.potturu@amd.com,
 Sunil-kumar.Dommati@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260213055904.110256-1-qby140326@gmail.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20260213055904.110256-1-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ae::6) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|SJ0PR12MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: f4aaccd5-9311-4489-3123-08de6ea78b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTB6SjFHWHZmYnc2UWtxZGpqUG5wUCtBOWEwVlFJMVNsUkFYTjI5eGE0S0t6?=
 =?utf-8?B?TldOR1ZzTWdOMHVLTE1zRThMczNPeW5iR1FHNjJLNThtYmloU3JVcUJzcExL?=
 =?utf-8?B?dFV5Y2ZML09ENXR2RG5LUUdlcys4MnErYmd6cG54Qk9ySllCUm9YWkNNbmxN?=
 =?utf-8?B?emJCeEhPaEhoVUxBbHBVd3FrRWFBaHNiTklIZ0dpME9pNkpDR1JKRGhsTTB2?=
 =?utf-8?B?RlUxOWk2THMrQ1JwWjhPODNtdFltTXZJYVZnMm5sV25BV3RoRGpyUVV5bmVk?=
 =?utf-8?B?dks3RUdPdFo3N1o5aTdLaGVkNzg2WG4xTEhFcnU3NHV5QnhZaGpYRzBrdnhL?=
 =?utf-8?B?SXhrMDV1bzFnTFBnRWxpMnZrZ05udTVJMkRkSE42WXJoQ1JNVDl3bW13U3JK?=
 =?utf-8?B?OUYxU3FBTVZib1gwZC84bDZMYUFSM0V2bWoybXNTaDVkdmExcTk1WWhaN0JM?=
 =?utf-8?B?clFjejh1QnRmSWFuUnZuUytkbUZ2b0YwRHRzKzEyNlBPOUhsTjZBNitVRXVR?=
 =?utf-8?B?MDlqcGpBVWljUFlBazFzVzBRcGZGT2MrdWtBajhKSmVUWERjQThURWdaN0Ny?=
 =?utf-8?B?QkQ2MmNTQ3AwNVJTSmlSKzFGQVp3eDQrdnoxbWxnOUdxZ3lDRmtIdjV1aGR6?=
 =?utf-8?B?OHFWZWU3THhzdHMyVWgzNFZqTldGbnJ5R3F2Wm9qM0lzb2cramZzcnhDRHVy?=
 =?utf-8?B?aDNka0FPMkNmRE12d1ZER1ZtUkhOVCtlMXdqMzRXNVlBNmt3K1d3bUlKSTBo?=
 =?utf-8?B?RGFJdmVOdWgyZkhOR0xVdGg1TVRNdVl0VG55b3ArSDdoL0M5TUhqaVBxNWpM?=
 =?utf-8?B?cTU5WXdnQmd6ZWpBb0s3ZS9JcDdwR2dMdnp5cTdnb1VlN0M3Y2VpZjBGcjVT?=
 =?utf-8?B?L3NWV3pPdWJlYXY0TUt1TFBJaWhaSlVJcjVjQlZDL1VDZkc0aVRDSElkZ2Yr?=
 =?utf-8?B?aUlxQ1VGMWVkZEg3S1dtbDhpSERuOU5yMUNkdkJOZ1kxTitaWnRYSC95dEc5?=
 =?utf-8?B?bk5OdktPK1NSSG1jcjRKcmJtRnB4ZEVUMUZoOGdOZkVQb09MVWFhakZBMGRz?=
 =?utf-8?B?MktXcG8wVEJDa0xjcGtPZUM5TU55cTBrLzdDMEhDeC9CK3pjWnVld0NXVlUy?=
 =?utf-8?B?RUdVT0wzVENxdzVhN2hlQnNiWUtsTkxOWkQwc3VUN1Z6VStMTW95ZGhHM0U5?=
 =?utf-8?B?MGRGb2dEam5JYk5TRGZCUkJyQ2xaQkxXNVZMYUp1WFJGSFhjbnllTS9aOVFS?=
 =?utf-8?B?cnl3a2Z5UjRabkR3Qk1PRTROazJiNHNlNUNjeWRUUlp2U3B4eFVvL1ZHYUNW?=
 =?utf-8?B?RjZkYnBwTHg4TDFVcWlyZ2ZPaUYrT05CbzhuRndrVk51QW5iYTN1cjdVUXZJ?=
 =?utf-8?B?cUdiQU55aHpFTkMxeE12ODNZOHBPM2xVam5VaTJxcDlEMkZ0bEJ3Mk54N1c1?=
 =?utf-8?B?bXk1YmllTEQ4L1AxazhHT1o1VktyWnJqaWVXelZER1c1eFZwOEk0VGJDNlR1?=
 =?utf-8?B?b2Vva2hOMmtiMEJidmI3VXpCQXFxOWxJWkxPZWRhRUhoY1BYK2lpR0JiQXBq?=
 =?utf-8?B?OHJMSjEvbUhhR1RReWlaQVNFSWJTZzE2dkRyVk51aHpTaFV6Q3NmUW80VlE0?=
 =?utf-8?B?T0NzR1c0RE92c01jaG5NakxkcklmNnFlNlVoU2JqTThSaXFKSXNsQ1lTN3pq?=
 =?utf-8?B?clB4TFA3cFEzQ2pwUVVMWkNzSVZ2N3VlU3FQS1FMREdBb1I5QXVva0NuR0xy?=
 =?utf-8?B?Q0dVU1dCNUE5OGtVdGhYdVZveTU5cTR5aitZQUR3TEQwSXVETEhubHRXSkZX?=
 =?utf-8?B?YWR1VGEzMkZVUVdFQkVBYWVOVWppUE92RTFFU3gwZzkyQ3JDdVBNa3l0ZlpR?=
 =?utf-8?B?RDdvZVYxVkZ1ekZxUDg0VlJCdFpMZ3Y3UlNnVFFkVUV4Tk1rcGVLL0FoVmJp?=
 =?utf-8?B?L0toazU2c0UrL051QzIrNldmZWR5OGVZbHAzUFBSL3UrL2RQMytpbDBsOUg1?=
 =?utf-8?B?SXkwTGxGTHJCNFRQcTVwTWp5TEtrWGRuaEFSZy9xVFZqQjFncVcydlVzM25M?=
 =?utf-8?B?VjJGQXAzc0ZXNFhhenNXRnBCOUNpNGRIQjAwcHE0VlJOL3ozQXBWT1J4aWR0?=
 =?utf-8?Q?3DBk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlgwYzc0czdGdTg5LzliRitXVDBDR21neUJJZjFIZk1idEF1THQrQlNrWlJn?=
 =?utf-8?B?MXd1M2JMaDZCV1NwRUVLNndtdWE0RDZGQTR1S3ZScGpuZENoMlVYcVNjZFNV?=
 =?utf-8?B?VFkyeHpLZVVGVEZRRWZ1UXdNNkpaZjJVMmZzeDJJSnJtVHdCUDJJcWhSWGtH?=
 =?utf-8?B?OGVMaXB1ZzhIZXNaK2xZdTRJT2Z2Q1dsOWVGV0ZIdXFweTBUd0haTXY5OG13?=
 =?utf-8?B?c3Npdk5FM3FieWI0c1RJL25rWjJXemIxR2lmQy9rbHdaZVBkcnVUbU1BVVoz?=
 =?utf-8?B?WDlmTi9DRzQ3ajYyMXFqd3lDc1pyMnFrdDhtYWp1ZWIvWTQyZVVRVk5VL2hR?=
 =?utf-8?B?Q0pnZ3M2WFl1VmpwNVE3T0VsOHVKT29takJVc1ozVWYxYlM5bGpIbVB3emg1?=
 =?utf-8?B?L2NTQUJNN3ZIYW51b1JpVHBsKzN0ak9lakJ5aitKRm9LcUNpY1pVTHpCbWRl?=
 =?utf-8?B?SWt0OVZoSEhzRGpsdThTaFJpQ201U21BZG9MRWJUNTlLcFk2VDU0VlZMWno1?=
 =?utf-8?B?b0FJc3dOYzlSMFhPRFVkT0FocTNsWThWN3FjOEJiZnJhTlp6bE0yckdmVHE4?=
 =?utf-8?B?TnhRWkZ4SUszbmxsWk96K0hVVEREL0gzcVdlK1YwOFFUb1JvRDJmUjNlRzVI?=
 =?utf-8?B?Zkc4VERBaHhzcVh6QkFHMDBmY3NscmV1cVJMRE5YMDdCSjNRV2VnR3d2VXNr?=
 =?utf-8?B?aC9pb0J6QTY5NW9MRnJMMDVVVDNpeXRPcWZwT0phNURrRXc5enBYMDF0UWlE?=
 =?utf-8?B?V1prTFlEd1JrK1RCdmh6WTJzWGZYYzVyd0tyS0N0TTJaZkZITEs0UFlGb1B1?=
 =?utf-8?B?MzJ1c1B1bHFVbk9zdTJubjhMV2ZPSW9wSHo3QXJFcU4xSDNpL0FPQ2wvU1U4?=
 =?utf-8?B?T0VBczVBRWNUbkFmMjVNNk1XRG5ZRkNFSjQzeDdkaDBmV3B4VjBUeG5XTW5j?=
 =?utf-8?B?N2ZtUDV3b3RGc1RjOW1BQy9zZjB2a3liTXg1dXBqbm81d0hvMlhnSEJJcjVB?=
 =?utf-8?B?d3FIOWYvUUZRTVBtMjJoVlFoL2NHUk1YejBIZE1weU5LaUw5R0ZpWmxjNXhO?=
 =?utf-8?B?djh5c08waUhZaEY2cGRQZGhaR3FyZ1AwZVh1aG5Dck1iWk82Zmg1T2dDdXYy?=
 =?utf-8?B?NnNDNWhrc1dJdWtxd0ExMjJaUWxFTE8zUmVjb1V2Rld6RkFVYjRNY1o3aUk4?=
 =?utf-8?B?RDh6QmxFUW45QlF3Um1iVzNaYlVHWkxPYVFaR0E2by94eTNKSk0rdzl4a0hJ?=
 =?utf-8?B?TG1OMHpQQjFDZHFUejFkV2lrTDBSSkFPRkplTVNrMk1qcnBXV0ZSeE1sRXhZ?=
 =?utf-8?B?dHJSOHAzb2JLbWI2ajkydU5HYVdRRWlZb2FOeHcrS3ZmU1RRMXkybWQ1bC9K?=
 =?utf-8?B?L2Z1Y1FrMXV3dnNxQ3FudzlWc2NGZ3IyYlh0L250K0tqWlFpWm80MStnTEVr?=
 =?utf-8?B?ZStXVGdQNmhMZlNCMXFQVlA5eWJCZkZ6TllDeGVvN01ReTlsK0xLektTVjBn?=
 =?utf-8?B?R0xHS3c5OGxxSE8vMDNtZGFFSGt1dUR6Ty95UEtlTzhvYXZRTlZQY2JtNldH?=
 =?utf-8?B?TmVNSlVqUWkrRDJ5SU5ZYWJJSHhCd3QrMTZKc0dPeE1lZHBDYWtRMWU4aWVZ?=
 =?utf-8?B?Tis2cHBHaDlpbHRPMm4raTVibWtwQ3lyTndjU0hZYUc0QkcvY1FFcHd0MHVF?=
 =?utf-8?B?TWYzcnZ1Z1QzK1lsQUpYU05jbkVZMTBkR256d2NQWmloU1pacG1SWWlkcG1t?=
 =?utf-8?B?RWQ2cU5LVU1vOUZvaVk0b3Y0MWU4UFNHNjYwaGNTbWdnSEtiV0F2NzZJTUZM?=
 =?utf-8?B?aEtaeVNveXUvM0pIS01TSDVaMzc3VGtLdHpQR25UY3N1NHRSc1ZpSElxUWRt?=
 =?utf-8?B?anZ0YUtTNERjOW1OeUpJdXpOSThpNTNBU29HNmZzZkphaGJzdjUySkdSM1VJ?=
 =?utf-8?B?SER5ODdlZGRSMTIxUW02Qno2MzQyaVpnTFR5S3B5TTQ3L0JkMVQ3TnhaWDAz?=
 =?utf-8?B?QXdqbmM4cDVtZnRGRHZVdVVWemZBMXN5ZWN3Y3ljQUxDWlg4NDFONUhpZk55?=
 =?utf-8?B?cFpUcFg2eUxSVGNka0thak1RcnFydGtyakFoYlJyQkQyRjU0c2NKSzFMY0lq?=
 =?utf-8?B?c1ZTV0piWGIzVEpQbUtrQm1Sa0g5ZDNlWUNocG1iNXlaUWVaczQxM2lFdW5F?=
 =?utf-8?B?Ly9yaTRiZHJMSHdpeWRLZUhpNFlVSEVUOEN3dGdNaUZiTkJXTkE5WFY0UlZi?=
 =?utf-8?B?VXR4ZlZrWTcvVzlRL1BncVZjZWxyZDhFYWdmNm1FZXFPQlhsenR1NkxxeVdy?=
 =?utf-8?B?Ni8vVGxmTGxXekw0U24rb0EvS1JQWU5KYXVXRC83WGRadEp2TGdXQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4aaccd5-9311-4489-3123-08de6ea78b71
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 04:38:21.2593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VGN8nTEI92iJjWEPBRiVypFeBAPMHPJgjw9AowfKALxpoiEKR68QyHNsFtrSFsZOlbbUAe5oTv40CIU5/LhylQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6880

On 13/02/26 11:29, Mingyou Chen wrote:
> v2:
>   - Reverse ACP CONFIG PIN from 10 to 14 for rpl
>   - Remove the rpl folder
> v3:
>   - Remove rpl configuration from Kconfig and Makefile
> v4:
>   - Handle separate switch case for RPL platform (ACP Pin config)
> v5:
>   - Remove clangd generated compiler_attributes.h include statement
> v6:
>   - Fix typo issue ("reverse" -> "reserve")
>
> Mingyou Chen (3):
>   ASoC: Add DMIC support for the AMD RPL platform
>   ASoC: Drop RPL driver
>   ASoC: Add quirk for Lecoo Bellator N176
>
>  sound/soc/amd/Kconfig                         |  10 -
>  sound/soc/amd/Makefile                        |   1 -
>  sound/soc/amd/rpl/Makefile                    |   5 -
>  sound/soc/amd/rpl/rpl-pci-acp6x.c             | 227 ------------------
>  sound/soc/amd/rpl/rpl_acp6x.h                 |  36 ---
>  .../soc/amd/rpl/rpl_acp6x_chip_offset_byte.h  |  30 ---
>  sound/soc/amd/yc/acp6x-mach.c                 |   7 +
>  sound/soc/amd/yc/pci-acp6x.c                  |  12 +
>  8 files changed, 19 insertions(+), 309 deletions(-)
>  delete mode 100644 sound/soc/amd/rpl/Makefile
>  delete mode 100644 sound/soc/amd/rpl/rpl-pci-acp6x.c
>  delete mode 100644 sound/soc/amd/rpl/rpl_acp6x.h
>  delete mode 100644 sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h
>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
