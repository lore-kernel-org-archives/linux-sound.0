Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012040.outbound.protection.outlook.com [40.93.195.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D9D33EC;
	Thu, 12 Feb 2026 13:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770903944; cv=fail; b=rJzGL2h70Kzsh4PI8NUUjnhBLeXLgHaVEgkSAFMSgsdCQ3Ngn1b6Ly9upkZZPh2MdExwKzhQABMgggJrs470VsblL6C+IefWokrgC6AOtVxwQmDqpq0Zl6m12+b2fOkweTjsTWu8Sicm2BhIyMV+wbSSfes9qOI7vKnsGkWgh3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770903944; c=relaxed/simple;
	bh=tJrw1rBsSevmwmpqeIaXIY7hJyjWtyTUHuKeuLdfG10=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mn/OLdf8aF1vkI5fz7JDgYyc9+4wKCixtork3CbkQeiAnSr5PQ8ab1p7fqppfs8aEGoSkpIznucTOx9n/vMF4Rda/0AreO4Eph0fiirlPLdetsPp9awLVcyEjbinspa6uAnLn6h1dud3jeUvfS2fD3xYNG6BY9qzMo0VbgPKv7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G3btTHGq; arc=fail smtp.client-ip=40.93.195.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G3btTHGq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1KZz+PFPfdk/9446xhKaO9I2koC6esgqZk05wXK4HLsi4HWEbUHAswWiuFgh1jN3e+nPMN3k0ZkeUCd93sEFB0FAdeEVgT1fCH7kRAf8bMMio2EnOeC9mjRWmLsJfvxYBjLj8u/4MGL+Vnwst8V0obOk73ymRezMAQ3yfgssMzipSJguqQfHgUPzhta3re03ioZADnqEnKWd7Dus0/uWNjeCrgcLdYN6gml7D0ZI7HYCYwankeBG6Hc7uAW43ov7+tC4soVpj+FjZx/2UbTo/V0Nkimx8HWFwqG72wMo4mhVTHDTFdjlRtvGaNkS/irnDsiWkQvo5qic47lTWN/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTrCndINocH0HA7iBC40DX+3mSftEadnv3Z4JOQaMIs=;
 b=G0Yi7PHwr6xTuMLHjcmlatlo8QaTuIXlgRzt62xRQ9DJJwX0wTLcWFb8TG7GNe9oeF7Xnhy9+R+OYCezvC/78J03dDNPfffsWlSs/5TdGULvUS3VRDL9E6Ifxe6Z7deJotBKr4PA0k2DeLnEPV2xRCqpYAnYJsr59YBt4gaGuhFxKCecibHCaa3OVGlntBq8c+oVvfSFhlNM3wntiNQMKBrZ/wFEXlK49KDD7ZXHETbv/AYND5rGX+bQynm1K4pogBBvGdzKoWjE+/cX0ezj8AwJubb3Aon2wxtFXqOSxjVvCtwGshWS/cjEhzSgyw4nDbBRBGlbS+kAkDOSLm4JQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTrCndINocH0HA7iBC40DX+3mSftEadnv3Z4JOQaMIs=;
 b=G3btTHGqcRtOYxP++et/sfT8WJhEwblHHoPUjZ0jJrjF24dQFaCqemcQbTa9manPI9XXk/LPuVyn9TxXNTrIs+DQ2Y3GqABCa4w6rEu7PuYLc/enIsQ2zskTBFmnoCzWV3InsH819Z9QpTZjGK9CBNpU3ds5DAACQfRGQjz5OzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6138.namprd12.prod.outlook.com (2603:10b6:208:3ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 13:45:35 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9611.012; Thu, 12 Feb 2026
 13:45:35 +0000
Message-ID: <adf1b218-afc4-4355-b15b-0f72e937d888@amd.com>
Date: Thu, 12 Feb 2026 07:45:31 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ASoC: amd: add DMIC support for RPL platform
To: Mingyou Chen <qby140326@gmail.com>, vijendar.mukunda@amd.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 venkataprasad.potturu@amd.com, Sunil-kumar.Dommati@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <c0c5382e-eda4-48b6-9afb-aadfe873b633@amd.com>
 <20260212111518.8646-1-qby140326@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260212111518.8646-1-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0041.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: adc96552-6445-497a-caab-08de6a3cff86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzBIYWIvNElXWk5FeEpMVE5yUysva01DZ0VmMlVhN3RaTDVWWXJNSDZQQkNV?=
 =?utf-8?B?SjNEOUhaZ3hDYXFlMmhpdHM0emhNK1JkSE5nV2lQb0pKMlVyVEdSQkV3UWda?=
 =?utf-8?B?UUlBb3R3b1psbHQzdi85VWdGR1BNNWt0QUh5azVKM01uVHBqNHAwNGV6ejZC?=
 =?utf-8?B?Z3JLTWpEVTRJQ1BHU3BYOWZ2UWxUTE9pK0dadVZ3TGdjeko4eGhIVUROL1dW?=
 =?utf-8?B?OTZCbXp6SFAzSkpwNktnZ2xIWlhYU1BPUUMwRW9iN21KOGNNUzlBT21penBu?=
 =?utf-8?B?TFRvKzRObmEzZnU0SFZCaGNBT2RXRVRWdUIrQThDMkE2WS8rT3ZpcXlVcjBm?=
 =?utf-8?B?cEhwQzRmVElocG9XcWxtYzV3UU9lQ24ydjVJOHkvYU12ZHBCZ3lqNFJvNStQ?=
 =?utf-8?B?dExFNktrZUxFVGpzU1NhaHlSQ0JyQjVHcjNjdXIxclVGZVo1SkdkMllVVG9C?=
 =?utf-8?B?eC9WSEoxbGFPdGpkYWFYQzNFRU1MT05kWEtBanNua0JsQnIzMUJUc2s4bmY1?=
 =?utf-8?B?ejlyanVLVDJNQ2RLcHJ1dlJ5QmFmVWVwSEo4YURGclMzTzRscHhhRXBIT1Q5?=
 =?utf-8?B?VlNCTXlubzB0MUlFWUNzOTFzUHEvU2tZQWpwK0NPQWFUUW1ncDE3b1AxbWxs?=
 =?utf-8?B?VHJSbTlKdHpnbGFqYVFoK3Q2cjU4cEdtZTRlUDhwYndXQjZ3dFVyNTJPcWk4?=
 =?utf-8?B?Q3NITXlaY25iZnVLNUJudExUSXZndHhtK0NPejJYNDc1Z2RsTG9UUkEwcC9M?=
 =?utf-8?B?dC9VTDNMT3F2OUhHQkN1V1FwRTVaOTExYzZCQjdVMEJwN1NuS29yKzVnTTBp?=
 =?utf-8?B?MklpbXQrcnQ1MURtdmJFb0NuVUpNMEE2Wi8vZVpxS3VGUGVLSzRFNjAvVVFR?=
 =?utf-8?B?RnpWejk3Z2NpczZxWmZGUjFDQTVYQ08yS3JlTlhCaHpkQ1ZhMVVSMDdGaVRB?=
 =?utf-8?B?REpPdkhKVFVWQlVoOEw5NGpRZEU5Z0Y5STBhNG1aSHNmQzFTR2ltZzNCd09l?=
 =?utf-8?B?dStMR0RiRkYvTzRVNUFUeHA4R2tERmZJWklDWldwOG1neHNOblNoMUdjTU40?=
 =?utf-8?B?enZFeG9jdGsyQWgvT3lYZ3E1ZU96YWZPWWQvVmNEaWpQclRMa3A1VWFFQ015?=
 =?utf-8?B?K2JnU2xZb0xTNDBoUk95RVdtaU1md1hEdTBBYzBFT0YzTHdKcHhzUFBJZlM5?=
 =?utf-8?B?c2ZnRUwxWDBHTERkcEIzMUkrTzZSa1JtV1BHUllmUVJLS3lKSVFpRXpIR1pq?=
 =?utf-8?B?QWtaL1FHTmxjTFh4QzB2blh2U25XamNWaWZ4YkQ5eWpEWWhaTnZYdkJ0eWU0?=
 =?utf-8?B?cHVxa1pwYVpRM1puK0ZVWlE4azRTbFRud3Fxc0tIVEplRkZJbzJxdmVJbmJ2?=
 =?utf-8?B?Q3hncEEybi9abkZFNTVUODdScVBJV294YmlwN3VOcVY2S2hRcDN0SHpCM21W?=
 =?utf-8?B?QzJjMS9Ed0txdDJseTdqNzRoN1QxcXVKMHRXOTNvRHB3TWFaVUNPOElGUzcr?=
 =?utf-8?B?ZDlHVjFjTWZDZ3FKUHpOWFh4TUpuUG9PWDV1K0R5RjgwQWZEWXBVWUZEMS8z?=
 =?utf-8?B?b0V2MHB3TzBtZjJMUSs0OWErMXo0MllIaUxTUGx6OG5NT3VUaXAwOHZTL3B3?=
 =?utf-8?B?Qzc1T3A0TXpJM1NRKzU1WHR4YWxFbldsNDFEWllRaXF5cUE3Wnd5eExNVFhJ?=
 =?utf-8?B?SzkrSU5DdC8wNTNuSjdOckJvYjZmUk5yK1dkMkFxSjIxUk5xdXpWSmhsQTNU?=
 =?utf-8?B?Z2UzQk1va0VGTXdsZFMwUTh2QnBJQ3NISm9WU2srVjVCN3pRMHpZbWdFUWRi?=
 =?utf-8?B?QlFvbEMybEtPNzR0MFZMSW0wNk1tR2ZCWmJ2QVoyNXRiaGRqTlJJK3o1VUxn?=
 =?utf-8?B?TEVHeVZTeFFKZlFMWkhkNkZqUDU2dTdLMW0zalREVUMwSGxtekV6TEZxZlF1?=
 =?utf-8?B?SVJRWE1sbnlZcWIyRldBbGY1SmVueGNhRGdiUi9lZjlSeW1DVnVoTXFyMWY3?=
 =?utf-8?B?Tyt2c21WRXJMMFgvZjJCbld2eVZyQU9oUU5UTko3Y0diL1Rac0pnNVQ2S0Q0?=
 =?utf-8?B?aERKZGxiZTA0K0h6RkVLb2RTaDVsMmV4NFk2NTNoWVZHbnQxRUpCLzdSUERw?=
 =?utf-8?Q?K7GQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0o1clNzKzNBVDhTZG9SekVHbkpHRHl3VXVia3QyaCtEeVgvUGt5NWVMaS8w?=
 =?utf-8?B?UlM2U1BROXE1YzVleHFMb2NVeTdzSmU0aGFRNlZZd0s1cG11U0MyeDNXSXEx?=
 =?utf-8?B?MTFCMnFKWkE5eS9xWUZZa1ZuVWo3WXl0anVPd1FyRmdqdEZ6a0x4MXhCRXBl?=
 =?utf-8?B?YkkrOTNHSDFhcUVUeE1ranNGTnNZWlpYSnJqNXpoeXZ3VE5FVGFiNkUvcTRy?=
 =?utf-8?B?V3lXMGVJM1VxWHZDUDlTK3hQY1NkNXV1R3NPYlcxaVQyRDZjMXhTbWY5ODZW?=
 =?utf-8?B?ME1ldkl0bXZ6RW1OcWx1NytGR0ZGM2x4OUtvV1A1WmVLK3dSQTUzbjB6QWps?=
 =?utf-8?B?WDluWkVSejFVM3k0bjQ4UXRtZ0pyUFM1SGJDV2diKzB1bnZ3NkE1bE9aTXU0?=
 =?utf-8?B?V0RhTWl4Qkt0YlpkbmJqbExGSWJZdGxaaFVlTkFTVkgvc0x5ZFBsV1NYZ1A1?=
 =?utf-8?B?clR4b3VoQW9TOW1uMzNGOVVFUzJxZDJvS1FZSlk2Y3JvOFZJS1ZFczlnREha?=
 =?utf-8?B?Y2NJZ0RCZWUyWVF3L3YvckVWQTZRaGdFbzRPa2NyaHpZcXhPWUdpTWZBV0dM?=
 =?utf-8?B?T1cwT1B0cEo2Z25EbWFEUFNRcnNGS3lEcGdray9PdFpaSVhscGhwWkpxVlNZ?=
 =?utf-8?B?K25UbVZOWnNVTUZNeGtsODYxSVJmdXZLQTVId2pMUmplQkJTaWkycUt6NkNG?=
 =?utf-8?B?U2NuMVZUdEVVc1BLeFRBRjRNSi9TL3MzOUFkQTZ4cWk3QWRJbDZMWVQrL3lR?=
 =?utf-8?B?d1hZNVFoenowaGNwR0RhUmEyZTQ0ZnpxZ3NsbU9STFcvZWFWeHpGZjBzejN3?=
 =?utf-8?B?OGZhb01nSWw2cFpNSXZBS0RtYnViazI5T1dNVHZ2Skk4cFBlamkwQ29CTEhO?=
 =?utf-8?B?VHZJbW00b0JhdUVvS3c0ak81Sll2T2RIWGtjaFNTVi9mSzVDNGRnUjV1VGpr?=
 =?utf-8?B?NE9veVJIbC9OSVRzMG02NDRvU2VTL29VakF6dElucFh4WG5ORkRqTFZhazht?=
 =?utf-8?B?eXVhYnozczhoWjNicDFhQWFWNTlmb2hzMXgrUzdPdE5NY1dBQUl5dEE5bnZz?=
 =?utf-8?B?WjVQOTcxU0l6SUlOblk4YzV4YmVGbDh3Rk9EellveWJwZ1pTNzIxMzRVNU9F?=
 =?utf-8?B?dW54aUFwTUFSM1FNR09pSWVGaHZCNEJXZHlTQmo0WFAweUxBR3RFRXViMm5i?=
 =?utf-8?B?Tjc1bjlmUWpHcXZCQzN2UHQyMFdIRkRGbU9jWDV1Y2grR2VITEw2SHJDd0hU?=
 =?utf-8?B?R1MrVGtoakl5MWorQVVVZmtaWmZNQUNsdE5GVDd2L25CZWxvejNYL1BTM3hv?=
 =?utf-8?B?RDE5dzFCWnVCcXlKdTIwWVZJQUlJUElGQXNsREhsRmx3OUZmaHJUa0g3Tnpx?=
 =?utf-8?B?RVdzMlR1SmpQcE5USGtGS3ErTkIrbVptZVgrRVBrSXZZWHk4aFYyaEQ5bnhQ?=
 =?utf-8?B?QXdaYm01YXpRb1UwTG5BVkRMVjQvNFBWdWZVRVZlZzlzT1gxeFRpdVdnMUI4?=
 =?utf-8?B?NS9DVmlyaHdEYloyQ1dyeVI4SDRGaWQ2TDhOeStsWTgzUlpiOGxzdnpRSmNF?=
 =?utf-8?B?RmNjRXB1K3ViQ2NYckkxMjlVOVFyVXd4UnQ5V2dMdno5Mkl3VVd1RXBxYWFR?=
 =?utf-8?B?RXEwN0xVMUU1aHAxNGVFb1RMUDdhM01oZ2gwTi96MVN2dk44YVFlc1JKVllL?=
 =?utf-8?B?QXdpTERGRERhYkZwbllhL0xaWDZGaDZmbWxzZDVyeWhuZkJhaHprTGZuMktI?=
 =?utf-8?B?VmJaU0VtZ1RlMnVQL0R5S0puRFB0cGZNQ3cyS2piVUVIdmxVUnczR3laUGF2?=
 =?utf-8?B?OEQ3YXVNSXFHcnpvNkhoYzN5MHE0QklwOGRDRi9CbHlhUEJOOTA0Q2FJdGlu?=
 =?utf-8?B?cTNpYkcxeVV4aTdBbnhLVUlyZHZzbElGSEZVKzJ3N1hOQXUvOEVIZGk4QXRV?=
 =?utf-8?B?Z0xIeDhiT2UzeG9ITFU5QU1SZjN3Qjk2TUlvbWZVTlZEQ1RXMk5SNmxNYTBN?=
 =?utf-8?B?RHVZYkYySHFwMUY4MW45dEFBa1U0ZC9KYU9QODBSS2U0eCsvTTZzTE9KMjIr?=
 =?utf-8?B?UVhYQzNhYUFzWnRSclNxbkpQTWR5YWdEbHpFYUx3dzFjRGpYa2lMQXlKeGdn?=
 =?utf-8?B?Wm5INDlURGxXSzQrc1dTdkVMWVhtWmh5WEVMMjlRTnp5U1k1NmZZSmdaRkc1?=
 =?utf-8?B?Qk92TEowandGU1ZiRGE4aTVHZGZDSERJMjNablhPUFpvK2JaVXJtdGdnY0JK?=
 =?utf-8?B?NjhFcmh5N0MyZTMwMHFQcmNFeDBhMTExekhNQmFSU3VRSEtnVHc3R0hXWWla?=
 =?utf-8?B?V1lnWmFhYlJ6NXd5RFlVdzg2MXlnSWJ4WHNRMUtWR29tTHVRaFB1dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adc96552-6445-497a-caab-08de6a3cff86
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 13:45:35.3002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNHNkV7wTIu4hUFDILxalYzeL13n+7+d7qX/pykA8bxAY57nc4Nqk45Xrd/gJHzMJg8he+ppSMM9KJhONyQjvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6138

On 2/12/26 5:15 AM, Mingyou Chen wrote:
> Add DMIC support for the AMD RPL platform. The drivers are derived on
> the YC platform driver.
> 
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
> v2:
>    - Reverse ACP CONFIG PIN from 10 to 14 for rpl
>    - Remove the rpl folder
> v3:
>    - Remove rpl configuration from Kconfig and Makefile
> v4:
>    - Handle separate switch case for RPL platform (ACP Pin config)

I didn't realize there was a RPL driver upstream at this point, sorry 
about my mistake on the earlier patch.  But I do still have a concern 
with the approach you're doing considering that.  You have way too much 
stuff going on in one patch.

I feel that this should be a series with multiple patches.
1) Add support for correct pin config in YC
2) Drop RPL driver
3) Add the quirk for your system

Think it through like this - when I look over your diff for each patch 
your changelog should mention exactly what it is going in that 
individual patch.  If it's covering more than one thing it needs to be
an atomic action and justifiable to happen at once.  Otherwise split 
each thing to it's own patch.

This is important for a variety of reasons.

1) It makes the work of a reviewer a lot easier.
2) It makes bisection possible to figure out the smallest change that 
caused an issue.

> 
>   sound/soc/amd/Kconfig                         |  10 -
>   sound/soc/amd/Makefile                        |   1 -
>   sound/soc/amd/rpl/Makefile                    |   5 -
>   sound/soc/amd/rpl/rpl-pci-acp6x.c             | 227 ------------------
>   sound/soc/amd/rpl/rpl_acp6x.h                 |  36 ---
>   .../soc/amd/rpl/rpl_acp6x_chip_offset_byte.h  |  30 ---
>   sound/soc/amd/yc/acp6x-mach.c                 |   7 +
>   sound/soc/amd/yc/pci-acp6x.c                  |  13 +
>   8 files changed, 20 insertions(+), 309 deletions(-)
>   delete mode 100644 sound/soc/amd/rpl/Makefile
>   delete mode 100644 sound/soc/amd/rpl/rpl-pci-acp6x.c
>   delete mode 100644 sound/soc/amd/rpl/rpl_acp6x.h
>   delete mode 100644 sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h
> 
> diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
> index fd35a03aadcb..a6eecbe12e84 100644
> --- a/sound/soc/amd/Kconfig
> +++ b/sound/soc/amd/Kconfig
> @@ -124,16 +124,6 @@ config SND_AMD_ACP_CONFIG
>   
>   source "sound/soc/amd/acp/Kconfig"
>   
> -config SND_SOC_AMD_RPL_ACP6x
> -        tristate "AMD Audio Coprocessor-v6.2 RPL support"
> -        depends on X86 && PCI
> -        help
> -          This option enables Audio Coprocessor i.e. ACP v6.2 support on
> -          AMD RPL platform. By enabling this flag build will be
> -          triggered for ACP PCI driver.
> -          Say m if you have such a device.
> -          If unsure select "N".
> -
>   config SND_SOC_AMD_ACP63_TOPLEVEL
>   	tristate "support for AMD platforms with ACP version >= 6.3"
>   	default SND_AMD_ACP_CONFIG
> diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
> index 4f89d962cce2..23b25ff0d800 100644
> --- a/sound/soc/amd/Makefile
> +++ b/sound/soc/amd/Makefile
> @@ -17,5 +17,4 @@ obj-$(CONFIG_SND_SOC_AMD_ACP5x) += vangogh/
>   obj-$(CONFIG_SND_SOC_AMD_ACP6x) += yc/
>   obj-$(CONFIG_SND_AMD_ACP_CONFIG) += acp/
>   obj-$(CONFIG_SND_AMD_ACP_CONFIG) += snd-acp-config.o
> -obj-$(CONFIG_SND_SOC_AMD_RPL_ACP6x) += rpl/
>   obj-$(CONFIG_SND_SOC_AMD_PS) += ps/
> diff --git a/sound/soc/amd/rpl/Makefile b/sound/soc/amd/rpl/Makefile
> deleted file mode 100644
> index a3825c5be4e7..000000000000
> --- a/sound/soc/amd/rpl/Makefile
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0+
> -# RPL platform Support
> -snd-rpl-pci-acp6x-y	:= rpl-pci-acp6x.o
> -
> -obj-$(CONFIG_SND_SOC_AMD_RPL_ACP6x) += snd-rpl-pci-acp6x.o
> diff --git a/sound/soc/amd/rpl/rpl-pci-acp6x.c b/sound/soc/amd/rpl/rpl-pci-acp6x.c
> deleted file mode 100644
> index e3afe9172bdf..000000000000
> --- a/sound/soc/amd/rpl/rpl-pci-acp6x.c
> +++ /dev/null
> @@ -1,227 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/*
> - * AMD RPL ACP PCI Driver
> - *
> - * Copyright 2022 Advanced Micro Devices, Inc.
> - */
> -
> -#include <linux/pci.h>
> -#include <linux/module.h>
> -#include <linux/io.h>
> -#include <linux/delay.h>
> -#include <linux/platform_device.h>
> -#include <linux/pm_runtime.h>
> -
> -#include "rpl_acp6x.h"
> -
> -struct rpl_dev_data {
> -	void __iomem *acp6x_base;
> -};
> -
> -static int rpl_power_on(void __iomem *acp_base)
> -{
> -	u32 val;
> -	int timeout;
> -
> -	val = rpl_acp_readl(acp_base + ACP_PGFSM_STATUS);
> -
> -	if (!val)
> -		return val;
> -
> -	if ((val & ACP_PGFSM_STATUS_MASK) != ACP_POWER_ON_IN_PROGRESS)
> -		rpl_acp_writel(ACP_PGFSM_CNTL_POWER_ON_MASK, acp_base + ACP_PGFSM_CONTROL);
> -	timeout = 0;
> -	while (++timeout < 500) {
> -		val = rpl_acp_readl(acp_base + ACP_PGFSM_STATUS);
> -		if (!val)
> -			return 0;
> -		udelay(1);
> -	}
> -	return -ETIMEDOUT;
> -}
> -
> -static int rpl_reset(void __iomem *acp_base)
> -{
> -	u32 val;
> -	int timeout;
> -
> -	rpl_acp_writel(1, acp_base + ACP_SOFT_RESET);
> -	timeout = 0;
> -	while (++timeout < 500) {
> -		val = rpl_acp_readl(acp_base + ACP_SOFT_RESET);
> -		if (val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK)
> -			break;
> -		cpu_relax();
> -	}
> -	rpl_acp_writel(0, acp_base + ACP_SOFT_RESET);
> -	timeout = 0;
> -	while (++timeout < 500) {
> -		val = rpl_acp_readl(acp_base + ACP_SOFT_RESET);
> -		if (!val)
> -			return 0;
> -		cpu_relax();
> -	}
> -	return -ETIMEDOUT;
> -}
> -
> -static int rpl_init(void __iomem *acp_base)
> -{
> -	int ret;
> -
> -	/* power on */
> -	ret = rpl_power_on(acp_base);
> -	if (ret) {
> -		pr_err("ACP power on failed\n");
> -		return ret;
> -	}
> -	rpl_acp_writel(0x01, acp_base + ACP_CONTROL);
> -	/* Reset */
> -	ret = rpl_reset(acp_base);
> -	if (ret) {
> -		pr_err("ACP reset failed\n");
> -		return ret;
> -	}
> -	rpl_acp_writel(0x03, acp_base + ACP_CLKMUX_SEL);
> -	return 0;
> -}
> -
> -static int rpl_deinit(void __iomem *acp_base)
> -{
> -	int ret;
> -
> -	/* Reset */
> -	ret = rpl_reset(acp_base);
> -	if (ret) {
> -		pr_err("ACP reset failed\n");
> -		return ret;
> -	}
> -	rpl_acp_writel(0x00, acp_base + ACP_CLKMUX_SEL);
> -	rpl_acp_writel(0x00, acp_base + ACP_CONTROL);
> -	return 0;
> -}
> -
> -static int snd_rpl_probe(struct pci_dev *pci,
> -			 const struct pci_device_id *pci_id)
> -{
> -	struct rpl_dev_data *adata;
> -	u32 addr;
> -	int ret;
> -
> -	/* RPL device check */
> -	switch (pci->revision) {
> -	case 0x62:
> -		break;
> -	default:
> -		dev_dbg(&pci->dev, "acp6x pci device not found\n");
> -		return -ENODEV;
> -	}
> -	if (pci_enable_device(pci)) {
> -		dev_err(&pci->dev, "pci_enable_device failed\n");
> -		return -ENODEV;
> -	}
> -
> -	ret = pci_request_regions(pci, "AMD ACP6x audio");
> -	if (ret < 0) {
> -		dev_err(&pci->dev, "pci_request_regions failed\n");
> -		goto disable_pci;
> -	}
> -
> -	adata = devm_kzalloc(&pci->dev, sizeof(struct rpl_dev_data),
> -			     GFP_KERNEL);
> -	if (!adata) {
> -		ret = -ENOMEM;
> -		goto release_regions;
> -	}
> -
> -	addr = pci_resource_start(pci, 0);
> -	adata->acp6x_base = devm_ioremap(&pci->dev, addr,
> -					 pci_resource_len(pci, 0));
> -	if (!adata->acp6x_base) {
> -		ret = -ENOMEM;
> -		goto release_regions;
> -	}
> -	pci_set_master(pci);
> -	pci_set_drvdata(pci, adata);
> -	ret = rpl_init(adata->acp6x_base);
> -	if (ret)
> -		goto release_regions;
> -	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
> -	pm_runtime_use_autosuspend(&pci->dev);
> -	pm_runtime_put_noidle(&pci->dev);
> -	pm_runtime_allow(&pci->dev);
> -
> -	return 0;
> -release_regions:
> -	pci_release_regions(pci);
> -disable_pci:
> -	pci_disable_device(pci);
> -
> -	return ret;
> -}
> -
> -static int snd_rpl_suspend(struct device *dev)
> -{
> -	struct rpl_dev_data *adata;
> -	int ret;
> -
> -	adata = dev_get_drvdata(dev);
> -	ret = rpl_deinit(adata->acp6x_base);
> -	if (ret)
> -		dev_err(dev, "ACP de-init failed\n");
> -	return ret;
> -}
> -
> -static int snd_rpl_resume(struct device *dev)
> -{
> -	struct rpl_dev_data *adata;
> -	int ret;
> -
> -	adata = dev_get_drvdata(dev);
> -	ret = rpl_init(adata->acp6x_base);
> -	if (ret)
> -		dev_err(dev, "ACP init failed\n");
> -	return ret;
> -}
> -
> -static const struct dev_pm_ops rpl_pm = {
> -	RUNTIME_PM_OPS(snd_rpl_suspend, snd_rpl_resume, NULL)
> -	SYSTEM_SLEEP_PM_OPS(snd_rpl_suspend, snd_rpl_resume)
> -};
> -
> -static void snd_rpl_remove(struct pci_dev *pci)
> -{
> -	struct rpl_dev_data *adata;
> -	int ret;
> -
> -	adata = pci_get_drvdata(pci);
> -	ret = rpl_deinit(adata->acp6x_base);
> -	if (ret)
> -		dev_err(&pci->dev, "ACP de-init failed\n");
> -	pm_runtime_forbid(&pci->dev);
> -	pm_runtime_get_noresume(&pci->dev);
> -	pci_release_regions(pci);
> -	pci_disable_device(pci);
> -}
> -
> -static const struct pci_device_id snd_rpl_ids[] = {
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_DEVICE_ID),
> -	.class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
> -	.class_mask = 0xffffff },
> -	{ 0, },
> -};
> -MODULE_DEVICE_TABLE(pci, snd_rpl_ids);
> -
> -static struct pci_driver rpl_acp6x_driver  = {
> -	.name = KBUILD_MODNAME,
> -	.id_table = snd_rpl_ids,
> -	.probe = snd_rpl_probe,
> -	.remove = snd_rpl_remove,
> -	.driver = {
> -		.pm = pm_ptr(&rpl_pm),
> -	}
> -};
> -
> -module_pci_driver(rpl_acp6x_driver);
> -
> -MODULE_DESCRIPTION("AMD ACP RPL PCI driver");
> -MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/amd/rpl/rpl_acp6x.h b/sound/soc/amd/rpl/rpl_acp6x.h
> deleted file mode 100644
> index f5816a33632e..000000000000
> --- a/sound/soc/amd/rpl/rpl_acp6x.h
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0+ */
> -/*
> - * AMD ACP Driver
> - *
> - * Copyright (C) 2021 Advanced Micro Devices, Inc. All rights reserved.
> - */
> -
> -#include "rpl_acp6x_chip_offset_byte.h"
> -
> -#define ACP_DEVICE_ID 0x15E2
> -#define ACP6x_PHY_BASE_ADDRESS 0x1240000
> -
> -#define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK   0x00010001
> -#define ACP_PGFSM_CNTL_POWER_ON_MASK    1
> -#define ACP_PGFSM_CNTL_POWER_OFF_MASK   0
> -#define ACP_PGFSM_STATUS_MASK           3
> -#define ACP_POWERED_ON                  0
> -#define ACP_POWER_ON_IN_PROGRESS        1
> -#define ACP_POWERED_OFF                 2
> -#define ACP_POWER_OFF_IN_PROGRESS       3
> -
> -#define DELAY_US        5
> -#define ACP_COUNTER     20000
> -
> -/* time in ms for runtime suspend delay */
> -#define ACP_SUSPEND_DELAY_MS    2000
> -
> -static inline u32 rpl_acp_readl(void __iomem *base_addr)
> -{
> -	return readl(base_addr - ACP6x_PHY_BASE_ADDRESS);
> -}
> -
> -static inline void rpl_acp_writel(u32 val, void __iomem *base_addr)
> -{
> -	writel(val, base_addr - ACP6x_PHY_BASE_ADDRESS);
> -}
> diff --git a/sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h b/sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h
> deleted file mode 100644
> index 456498f5396d..000000000000
> --- a/sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0+ */
> -/*
> - * AMD ACP 6.2 Register Documentation
> - *
> - * Copyright 2022 Advanced Micro Devices, Inc.
> - */
> -
> -#ifndef _rpl_acp6x_OFFSET_HEADER
> -#define _rpl_acp6x_OFFSET_HEADER
> -
> -/* Registers from ACP_CLKRST block */
> -#define ACP_SOFT_RESET                                0x1241000
> -#define ACP_CONTROL                                   0x1241004
> -#define ACP_STATUS                                    0x1241008
> -#define ACP_DYNAMIC_CG_MASTER_CONTROL                 0x1241010
> -#define ACP_PGFSM_CONTROL                             0x124101C
> -#define ACP_PGFSM_STATUS                              0x1241020
> -#define ACP_CLKMUX_SEL                                0x1241024
> -
> -/* Registers from ACP_AON block */
> -#define ACP_PME_EN                                    0x1241400
> -#define ACP_DEVICE_STATE                              0x1241404
> -#define AZ_DEVICE_STATE                               0x1241408
> -#define ACP_PIN_CONFIG                                0x1241440
> -#define ACP_PAD_PULLUP_CTRL                           0x1241444
> -#define ACP_PAD_PULLDOWN_CTRL                         0x1241448
> -#define ACP_PAD_DRIVE_STRENGTH_CTRL                   0x124144C
> -#define ACP_PAD_SCHMEN_CTRL                           0x1241450
> -
> -#endif
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 0294177acc66..de49c812124a 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -45,6 +45,13 @@ static struct snd_soc_card acp6x_card = {
>   };
>   
>   static const struct dmi_system_id yc_acp_quirk_table[] = {
> +	{
> +		.driver_data = &acp6x_card,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "Lecoo"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Bellator N176"),
> +		}
> +	},
>   	{
>   		.driver_data = &acp6x_card,
>   		.matches = {
> diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
> index 1140ed1cbb3d..5883c1836f02 100644
> --- a/sound/soc/amd/yc/pci-acp6x.c
> +++ b/sound/soc/amd/yc/pci-acp6x.c
> @@ -5,6 +5,7 @@
>    * Copyright 2021 Advanced Micro Devices, Inc.
>    */
>   
> +#include "linux/compiler_attributes.h"

This is really weird - did you mean to include this?

>   #include <linux/pci.h>
>   #include <linux/module.h>
>   #include <linux/io.h>
> @@ -163,6 +164,7 @@ static int snd_acp6x_probe(struct pci_dev *pci,
>   	switch (pci->revision) {
>   	case 0x60:
>   	case 0x6f:
> +	case 0x62: /* RPL */
>   		break;
>   	default:
>   		dev_dbg(&pci->dev, "acp6x pci device not found\n");
> @@ -208,6 +210,17 @@ static int snd_acp6x_probe(struct pci_dev *pci,
>   	case ACP_CONFIG_15:
>   		dev_info(&pci->dev, "Audio Mode %d\n", val);
>   		break;
> +	/* PIN 10 to 14 is reversed for RPL */
> +	case ACP_CONFIG_10:
> +	case ACP_CONFIG_11:
> +	case ACP_CONFIG_12:
> +	case ACP_CONFIG_13:
> +	case ACP_CONFIG_14:
> +		if (pci->revision == 0x62) {
> +			dev_info(&pci->dev, "RPL Audio Mode %d\n", val);
> +			break;
> +		}
> +		fallthrough;
>   	default:
>   		adata->res = devm_kzalloc(&pci->dev,
>   					  sizeof(struct resource),

