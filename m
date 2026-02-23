Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010064.outbound.protection.outlook.com [52.101.85.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD8C346FC4;
	Mon, 23 Feb 2026 08:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771834831; cv=fail; b=WFfgICgZmYA1BJKARnLLlcbY2xNUnBpQwKMgAsIfeFArnHz6lsFeQTsQ7+42plNqQS+EI/JjYSjgH1IIoVA13DtaNJ8UubP/j31tClidoX5nPFcG4rq4GjGG+fzcCapmTLKoW7B1e4cJo+7gKqFfli4zMqp3BqtGrrm8BYoanf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771834831; c=relaxed/simple;
	bh=PYn9eHwq2i3EjtQEXTssysleJVtdK00jH3pIypYsFB8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kx43aMJMU/+eyu2bXUdZaDbapwQjOfR0GsZlO8TzaGM4SZPnSuPiA06Nm6Q2w1ptHFJGDMT8+YA6XTRFP7rIj3yhXXXyz/Ix64juU4w3vMdqwftngWv2MwLRlHfjwO6FG4314uSvsJ/xEXlouyfwbyfis7aDslDfcCrmymzdvB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=H9kQI/HQ; arc=fail smtp.client-ip=52.101.85.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="H9kQI/HQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFFIg2nuNvuZ3mJL1GCoo83rsIexbi/bNodeYLVe9MbTnhPIl6a0vYUx/r8P30MBFYcal+GxYnHBwyuRFfecBqR8iV30FdMkwCyoFE0VtY0BHLBQZVsot7mpRbl7esxPgyXUhx6GbWYOjPT4jvqaJkRvjaaWHOkdRFy/jLnei7GBL/el1CB5rZPc8CBkixHqmJDUVAaCggiIUBEclwEmOqtoG5FBnMcMHUcjprcFry68v/Bh7mI29XgqMce5e5RVF3Ovmxayh/Le5YeiR12AOX0NH6He8clFYCwYaWdffbbb2GzLcbLdWlWxDYuvbZN6T9IHzBihqpGXin4m6ZoV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqW8eeZdjnee+j5YcL+WuL9uEtWgGV4QM5NTtXGdz88=;
 b=ZjYxaE/IO8PcQnUnbzl9gJFS2k628o+j36NbR++dOyBRlEcGUPyw7eP9tp641NomwlTZiOk/5s+VEGndnXP+hzMFbbaapIudvRdL8ideYjDToY07qowo28aP5nPbH5ndQN7Yh4XLzSNHaYJkijOY48r11ON/T1uN2PO+0P9rJQQaAFvEfV2Z5JrXFCXHyS4zFiFoU/a9dFgmnqpkZgBPVkL6g4YqRSS+HsyPV4c7jgv/M2b9BDhmjSA+OPXo2YoTX0/cyy5nhaPRO4740XXbsF7DkQP6TVrLZ3k4llUsoczPdkJiPQid58QOsPJROk33QyO8I68NSiYfKHDLjzLYAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqW8eeZdjnee+j5YcL+WuL9uEtWgGV4QM5NTtXGdz88=;
 b=H9kQI/HQEAc4/U+5wmSOXkf72cM+4hB0IGHWFECp4XD3PJ38dNqO+yNtWwT0feTECGMNZB5Kv1R8+Gt9wRkyZA1IKCQUGsAPMWalTRKs4EOAPQrDFk0kDwVkv4w2N8olNeEFs6Gz7xSNSvBWi5fVPV+z9VVvyM9LayWoUDgh6Xk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 LV8PR12MB9184.namprd12.prod.outlook.com (2603:10b6:408:18f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Mon, 23 Feb 2026 08:20:27 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 08:20:26 +0000
Message-ID: <53301c1a-8a2d-4b51-8dcf-b7af45500736@amd.com>
Date: Mon, 23 Feb 2026 13:50:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 1/2] soundwire: amd: add clock init control function
To: Vinod Koul <vkoul@kernel.org>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260205164539.892403-1-Vijendar.Mukunda@amd.com>
 <20260205164539.892403-2-Vijendar.Mukunda@amd.com> <aZv_4fl7dEINAAd6@vaman>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <aZv_4fl7dEINAAd6@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0199.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::9) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|LV8PR12MB9184:EE_
X-MS-Office365-Filtering-Correlation-Id: f2355c11-9799-4178-f871-08de72b465e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bElkNnBrOEVLbGQwWDlqMkRvaFFIRnNlZzVrYndncDhKRTFQWmkrOWoxd2o4?=
 =?utf-8?B?YnZ2ZUZkV3BnMVFYR0M1a1ptOFJoaDBZblBZQlV1VE9weUh4ZUVrSDZrVVB0?=
 =?utf-8?B?alhIanZVc0F1WEp0ZDVJemRNUHh2UG03Vy9CZUdIY2dVWGFVTkJReENpWFBD?=
 =?utf-8?B?NC9SYWg5Zlpza2x3V0grMmxnZmhpTmQzNFh0OUxucElsdnJiWEV1VHltYWRD?=
 =?utf-8?B?T3c0S0xHT0hZSlZmL3pLQTY4c210dm8xaWpwdDBQaXZManZ0RVo4TUk2TlJU?=
 =?utf-8?B?RzdlZUZSUEhmUHdaaTFkK2JuRHo3WlpEZmdNQXk0K2MyYjk0NGVBSjJWbVg3?=
 =?utf-8?B?S3ZyRlVKOWxUWE9nY2Urd0xpa1ozOC9mdnNxMTFWK2kwS2gxRTA1elJVMk5C?=
 =?utf-8?B?dm5vWnhibEltUXRCSytPTHdXUnRZZUpRS3ZsSG5ieVRkbnFXL3h5dXA5SVpJ?=
 =?utf-8?B?L3dnUEhmUno2ZWt1eWJrRFVEREVBQi9NWXhWcm9rUDR0NHJMRVRsTDBuVnA1?=
 =?utf-8?B?OENEL1U0TWZEaTNoMlQrb3BxSDQrYkVtRHdKQkt3TWRYZFJrOFM2QWR5QTAw?=
 =?utf-8?B?RGFnS1pIaHZIQnNRdXZmTlRLQzZTbVJ6enB2V09YaDdIa3RjRXNOWC9USi9q?=
 =?utf-8?B?d2NXVXg3NE9WYUU5eEl5eWJsVS9BRzJqRDBuZ20zWTgwWjA3TzBtOVpNSlc3?=
 =?utf-8?B?Z29JUERna1BKUzk3TzVqWUJKb0wxYmtxOFlPU2VJMUJBM2tRU1htQWFTZHM0?=
 =?utf-8?B?SFR3cFI4WmxLa3F0S3hKRjV2NFhsdWRPUHBzajlQcUxnbWV5Q25oOTE0MVl6?=
 =?utf-8?B?LzhwMHpEWnczMUp1WlUwMlFBSTdaVEQzUndzWjBXNnZUd3RSbWF6bWtBeEU0?=
 =?utf-8?B?cCtWR1poOUhJNU1QRkV0MCs5Rkc2Mmp5c2VNSW1WSE91b1pMclpaNFRtQUVJ?=
 =?utf-8?B?MjRLckgzSEtaRFg4c0orREZYRU9zWklnMlBzdWF4aWdwR2YvN29BYnFxd3pv?=
 =?utf-8?B?cjF4OVNoeG9JUXk4Sk5Ockw5NjhVZ0l4VzFYMWJpTEtrSmhQZW4wUDY4K3RT?=
 =?utf-8?B?ZlE3Tm5FQXlxcXIrVnNhc1VFY210S1N3NEs2RmZNNGEzcngwVGhoa3RDOEQr?=
 =?utf-8?B?MVdtc1JmUWRra2tGYzdOdGxOY1pKZ1R6SDRiMUhLZVZVa0Yzd0F1Z1l1ZHUy?=
 =?utf-8?B?cFFYUUxKOUlDdHRJWWdSd1FzZ05JS3ZnZTlnU095YWVqZzAzblZtZG16RXBS?=
 =?utf-8?B?eEJRcFMzUmw1N1hXSzZIWWFkSElaNWFGc2hXYmQ1dW92U25NdkxjMGFnS0RT?=
 =?utf-8?B?QWZUU1huWTNhZVVsSDhOUE5ZTm5iR3g4cnhXSmRkSUdGR1NUK3lydlVwUmhQ?=
 =?utf-8?B?cnMra0F2UUNwNUpSZ295dlhscEVORUZxR0FZcDhRWnJnQlU4cVZZN2hPN3kx?=
 =?utf-8?B?ZjRMdmI5UE1ueFZEejZ6aXFramliUG9RQjFVZk0xTWVsRHQ4Vko2dU51eXNj?=
 =?utf-8?B?ai9OS2RGVXUyRTMyTmQwdklub1hWSmpJTVg4NGQxMk1ZV09IdDJ6SG9zVk5B?=
 =?utf-8?B?dVRjR3hVL2t5NVR2SmRybldYTjJEczg2THNuYWpFZjlGK2w4MXJkWElVNXJr?=
 =?utf-8?B?SUZ6LzNaa2diNXUrem5jVzQ0Yi9MNXJsZjZFb2UvWUM2RmFuNUdXQjVuMHJM?=
 =?utf-8?B?L2IzMlB2MVhmNHU0TXJaMGdKUVloYkNpRW94aGVSdnluZElnWHNhNFJ6RkZ3?=
 =?utf-8?B?R0tQQnovdjFpQyt4akFYMzQ4Q3VxaTVYRE5RNTlEQ2pTQVVObmNNMDlpbGE0?=
 =?utf-8?B?UHBlUEMwSmZ4YVdiUlU4VUFHam53U1JXME5MR1JxVUZ6OEpsTEhnZW40OXUz?=
 =?utf-8?B?MXJFTTkwaForOUh1ZGF2cDNNTnZaYU43aEIvZkV6WnZTeFlLSUtmcDZGV2p2?=
 =?utf-8?B?L0puVmppeHlUblovVjZEcEFEQkFtVDBLclBTVEdyQVUrV1dGTjNNTklhbDdS?=
 =?utf-8?B?akFlMVZodWY5QXlaQW0xTGpYTjFyc0VMa2EyZUVCaS9OZVllNGhjeHVyMmpv?=
 =?utf-8?B?NmZQbWpmOFB6K0hkN05tY2RYNWR1ZVVMdUN2b2dmL0l2S1B3eEdOME1TMDhE?=
 =?utf-8?Q?a5+A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bThBdFZjMU0vSVJYTlBBT3FsTUNLYXJGSUZJS2kzM2o0d1JoOWxmenJ4U2J6?=
 =?utf-8?B?YnFrSDh5OFMvb3V0cmxLUVc5aTlKRHdQS3kyUDV3WGNwcVBMdWQ2a05ySndh?=
 =?utf-8?B?VVN5cmZqWkYyQW5VN21pYXNkZHNvRVE3V2ZjNno4UXZoSERKM3AwamNGcWZy?=
 =?utf-8?B?TTJGcWhNR2VlMlE4Qk1kakoxNUxPYktqVGpXYjB0NEhSeDZtYnlNOWhEK215?=
 =?utf-8?B?aE8yY29CWFpvWjg1dlg2UUg1Z1V4RHFiM1ZZd29wUVFYQTJVUjdtYzdlc0Nx?=
 =?utf-8?B?SFdRZWZtWVczelBjRDJLZlpxcVJWTk1KeFluaUFJakxEYlMyTCs1L0ppTTVH?=
 =?utf-8?B?YnV2VWloU0ZiVXc3dnJhT21uTjBkMEtxd2N4VHpWUkVMVXloWk9NdEhpSjds?=
 =?utf-8?B?Nmp4TDRoZHNPVzlrQWFaZ05EL0xkR09nUDZLYStWNXM0QW5QQ2N3MU92WHhS?=
 =?utf-8?B?RW52SWxPK2l2QTFxYUpuZk1nMndPRmd4YW1IRVUxcXdBYjAyMWVwQ09meThl?=
 =?utf-8?B?a0dwbEVNdEkyOHJjY3FZMzltelV4U0UveUx3N3orVTU5KzNyakUrZGt2dUs0?=
 =?utf-8?B?VXVrR3dwd2w5ZEtKU3U1UXFLMHhvN1N5dW9jNUttc1hrY1EwdFFTTTdBMGtj?=
 =?utf-8?B?OVIwVllRblFXYStjRzE1eGpkampMeml6VlRoKy8vb1V1dVVFVVh4UXF6ZE4x?=
 =?utf-8?B?KzFibkU3bU9IV0haUVlPUTdMWG9UV05mWUc4M29NUC92dXFoMklmNS9PNUFS?=
 =?utf-8?B?RnNhc2hNQXBvR2I2b1hNaWJUTmgyVE84N01qWUVsTEF4RGc4T0F4WEREcVBz?=
 =?utf-8?B?Q3V4Z0ZaUDJtQlVUOVVmaDhKSGkzcC92ZHphVzBrUWRiR20vOVlOQkZ0ZmhT?=
 =?utf-8?B?c1N6TnJVQ3BwcW9CRHF2b1pIazhZQjVNejk1SnFzbW5Jb3lEWHk0WGFvM3d1?=
 =?utf-8?B?ZFhOZTc0Unl2ZHgrZ0ttdDJmYVVWaWtacDViTlVqMTZTcS9zQm9kS3U5cGRa?=
 =?utf-8?B?YWpmeXZTUmNUTDdUd3BwcTE4REo1Wktkd2VhNTZJazA0eExLcVFhK3dHRktn?=
 =?utf-8?B?cUZFVnd5bTdFalRxRG9TSnR4WWp0U3VlQ2JqV3RpSmZxa3FXTEVvU2VGdzhK?=
 =?utf-8?B?d2lOUDdwRzhlekdlZnZwNFFvMHB6UEZ4QmJFYkR3WXFMbkl0ZGtVa2c0N0ZS?=
 =?utf-8?B?WlUxMUpudFRkTEF6SGZzOVBXYWdJaVhlTHRWWVVQdnNlM0EyVTlBN3N5Q0pz?=
 =?utf-8?B?dUxqdUNINE5tVnhTT2VuMGZyUkpweWNMMEpZL3ZXbDBUZzY2TEhJOE9xNkFG?=
 =?utf-8?B?UFYvVFlZdzZHNzNFWXVWQ2ZvVUNjTlYrWnVuT2hnOG1zY3ZjSmU1T2t5UVdp?=
 =?utf-8?B?bCtBQnZrUHhnN2xvWFpjUVdUNUI4OXpGTklrZnUvZzM5a095dE84Q0NER3lu?=
 =?utf-8?B?eVlzRlFvK0VnMDNaMU1CeTBuNWUrMXNyZnJtMERwSTRVSmJnMkttcm9WYzhG?=
 =?utf-8?B?cXJ3UTUwL0Q1aGQzUWtxUmY0Q0tnaXFoUFZKOC9kNTVUcTVUcnFrT3c2TmhS?=
 =?utf-8?B?bm5VWWV6MVl3QjVmc3NMbkVFN3EzdTRXckhCSTMvMitqYVhyUVdmdk5valRu?=
 =?utf-8?B?SXlXMHhrOEVoS1M0NXRnVytESGVWTXN5NWtuanp0SStibUErbDIxamN2RXZo?=
 =?utf-8?B?Ukl0QWQ2TjZQcW8wd1AvVUlWV2dINlRzb1NMZVpFZUl4dUVFcW9rRFVjS3JS?=
 =?utf-8?B?eGZCY1ZWenBVak5udHRwY3RCcE9Td1hXMzR5OHdZeEMyelZqMUh5WkRJRXhW?=
 =?utf-8?B?Qllub0JKSUVmdm42K09veXNOa0VmWlBFc2xTNFdjV3VtOXJaeVhGdFdjelZu?=
 =?utf-8?B?VFY1cllLeHRRQlpneTFyUEozOHRsVkk5c0E3S04wRTA1cE9wenMySmloc0h6?=
 =?utf-8?B?Y0MwYWZhQ1poek9zQWM4b2dBOStSeGdqd3VobE9LRCtvRmFpS2pYMzhjbCtP?=
 =?utf-8?B?enZPYjhTZU5qTXFyTmszY1FLb2RVeFV2alpHTDRHd2h0bm9XNnVTMnN5bW5t?=
 =?utf-8?B?Y0ZTaG1BaWFDNGNEVERmdmZUbEVBTkRkdFBEZksvUkdwM0IxS0FnMy9ZNXZI?=
 =?utf-8?B?YmQ1ZGFDOHU1WktQTFZTL2VpK1cyendKRWpucGZveEFWQXJ1TTdQdzZRWUNF?=
 =?utf-8?B?Ti9JaEcwSW1yWDRoTXV3M1dKRUYrSnFWWXgvRks5dTV6Z0ljZHFHbVI1Y2Fz?=
 =?utf-8?B?UVhvY2dwZ0ZxYXF2enh4NXdQSkFHMzYrY2N2dDI3VFFZK1JERmhWeGFiZzJ3?=
 =?utf-8?B?Ymk0c1N1TkszT3pWbDFRemU3UnlBaWhBWGJ2K1lUamVCakN3MmRIQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2355c11-9799-4178-f871-08de72b465e4
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 08:20:26.6739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWN3mCfpvi2sVqHIcxZontxSINyF69dKZ+oGLDTwzWvk/GxPoMRrwn8TpsL/BjmEqRUxV1JWUEe6t9ZIW5ROEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9184



On 2/23/26 12:51, Vinod Koul wrote:
> On 05-02-26, 22:14, Vijendar Mukunda wrote:
>> Add generic SoundWire clock initialization sequence to support
>> different SoundWire bus clock frequencies for ACP6.3/7.0/7.1/7.2
>> platforms and remove hard coding initializations for 12Mhz bus
>> clock frequency.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>   drivers/soundwire/amd_manager.c | 52 ++++++++++++++++++++++++++++-----
>>   drivers/soundwire/amd_manager.h |  4 ---
>>   2 files changed, 45 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index 5fd311ee4107..b53f781e4e74 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -27,6 +27,45 @@
>>   
>>   #define to_amd_sdw(b)	container_of(b, struct amd_sdw_manager, bus)
>>   
>> +static int amd_sdw_clk_init_ctrl(struct amd_sdw_manager *amd_manager)
>> +{
>> +	struct sdw_bus *bus = &amd_manager->bus;
>> +	struct sdw_master_prop *prop = &bus->prop;
>> +	u32 val;
>> +	int divider;
> In which case can divider be negative?
divider won't be negative. will change it to unsigned variable.
>
>> +
>> +	dev_dbg(amd_manager->dev, "mclk %d max %d row %d col %d frame_rate:%d\n",
>> +		prop->mclk_freq, prop->max_clk_freq, prop->default_row,
>> +		prop->default_col, prop->default_frame_rate);
> Okay dumping properties
Will keep only this debug statement and will drop rest of the debug
statements.
>
>> +
>> +	if (!prop->default_frame_rate || !prop->default_row) {
>> +		dev_err(amd_manager->dev, "Default frame_rate %d or row %d is invalid\n",
>> +			prop->default_frame_rate, prop->default_row);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Set clock divider */
>> +	dev_dbg(amd_manager->dev, "bus params curr_dr_freq: %d\n",
>> +		bus->params.curr_dr_freq);
> Now freq
Will drop the debug statement.
>
>> +	divider = (prop->mclk_freq / bus->params.curr_dr_freq);
>> +
>> +	writel(divider, amd_manager->mmio + ACP_SW_CLK_FREQUENCY_CTRL);
>> +	val = readl(amd_manager->mmio + ACP_SW_CLK_FREQUENCY_CTRL);
>> +	dev_dbg(amd_manager->dev, "ACP_SW_CLK_FREQUENCY_CTRL:0x%x\n", val);
> register
Will drop the debug statement.
>> +
>> +	/* Set frame shape base on the actual bus frequency. */
>> +	prop->default_col = bus->params.curr_dr_freq /
>> +			    prop->default_frame_rate / prop->default_row;
>> +
>> +	dev_dbg(amd_manager->dev, "default_frame_rate:%d default_row: %d default_col: %d\n",
>> +		prop->default_frame_rate, prop->default_row, prop->default_col);
> again properties
>
> I think that is bit too much debug spew. Good for bringup but a lot of
> noise during production. Properties can be looked from debugfs. I would
> retain the one with clock rates applied and get rid of rest...
Will drop the debug statement and re-spin the patch set.
>
>> +	amd_manager->cols_index = sdw_find_col_index(prop->default_col);
>> +	amd_manager->rows_index = sdw_find_row_index(prop->default_row);
>> +	bus->params.col = prop->default_col;
>> +	bus->params.row = prop->default_row;
>> +	return 0;
>> +}
>> +
>>   static int amd_init_sdw_manager(struct amd_sdw_manager *amd_manager)
>>   {
>>   	u32 val;
>> @@ -961,6 +1000,9 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
>>   
>>   	prop = &amd_manager->bus.prop;
>>   	if (!prop->hw_disabled) {
>> +		ret = amd_sdw_clk_init_ctrl(amd_manager);
>> +		if (ret)
>> +			return ret;
>>   		ret = amd_init_sdw_manager(amd_manager);
>>   		if (ret)
>>   			return ret;
>> @@ -985,7 +1027,6 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>>   	struct resource *res;
>>   	struct device *dev = &pdev->dev;
>>   	struct sdw_master_prop *prop;
>> -	struct sdw_bus_params *params;
>>   	struct amd_sdw_manager *amd_manager;
>>   	int ret;
>>   
>> @@ -1049,14 +1090,8 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>>   		return -EINVAL;
>>   	}
>>   
>> -	params = &amd_manager->bus.params;
>> -
>> -	params->col = AMD_SDW_DEFAULT_COLUMNS;
>> -	params->row = AMD_SDW_DEFAULT_ROWS;
>>   	prop = &amd_manager->bus.prop;
>> -	prop->clk_freq = &amd_sdw_freq_tbl[0];
>>   	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
>> -	prop->max_clk_freq = AMD_SDW_DEFAULT_CLK_FREQ;
>>   
>>   	ret = sdw_bus_master_add(&amd_manager->bus, dev, dev->fwnode);
>>   	if (ret) {
>> @@ -1348,6 +1383,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
>>   			}
>>   		}
>>   		sdw_clear_slave_status(bus, SDW_UNATTACH_REQUEST_MASTER_RESET);
>> +		ret = amd_sdw_clk_init_ctrl(amd_manager);
>> +		if (ret)
>> +			return ret;
>>   		amd_init_sdw_manager(amd_manager);
>>   		amd_enable_sdw_interrupts(amd_manager);
>>   		ret = amd_enable_sdw_manager(amd_manager);
>> diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
>> index 6cc916b0c820..88cf8a426a0c 100644
>> --- a/drivers/soundwire/amd_manager.h
>> +++ b/drivers/soundwire/amd_manager.h
>> @@ -203,10 +203,6 @@
>>   #define AMD_SDW_DEVICE_STATE_D3				3
>>   #define ACP_PME_EN					0x0001400
>>   
>> -static u32 amd_sdw_freq_tbl[AMD_SDW_MAX_FREQ_NUM] = {
>> -	AMD_SDW_DEFAULT_CLK_FREQ,
>> -};
>> -
>>   struct sdw_manager_dp_reg {
>>   	u32 frame_fmt_reg;
>>   	u32 sample_int_reg;
>> -- 
>> 2.45.2

