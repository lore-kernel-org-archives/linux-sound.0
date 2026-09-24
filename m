Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBED339A80E
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 09:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242432; cv=fail; b=fu2UcYRPCqAHyqvc95WYZPqh2Y3KJq1ivjvIjxIZpeLTUsycCy5eyzrwHI1fnJGtRnzq0jCho7IoKf4mG/I7lmw6a1bSsF6vqGXFLmcJlYpginl9nfFxBkY9rNh+8KID+8nG/Rq9A/HlBlI0L4w9tvkqjwFbtRngdXg1uKQMcD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242432; c=relaxed/simple;
	bh=1HZl2PY1GKhbMKU66H7DBlJFSRLCkHkr/bSwoFNNlMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C2IQhKTdCDwopsiQ6M8podDBNylo0YvJdC3iECvxDyxXTT3Z8SLm3hpkxw0tXVnAXyIcujq9op23dNNVDT4ie6sURMM39e8ztGDYVF5cnzD/SUE1V8N6OY/Bd3+Pi5Gzw8hlTnnVYrxYjXwlNxDE1sRfjtGVN47RmHBy4K6fx3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=t48Hjc2n; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="t48Hjc2n"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5cVMa1220867;
	Thu, 24 Sep 2026 05:33:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=7hk04
	xaLGOtmjGURxPNkIKp2BTnCBNwC5MyCA2MgmyY=; b=t48Hjc2nW0Z0nOJcYyFw8
	z3FGLBStwJBhoY1nxMxCx+T5gu0bjSKckdAq72/xlzMgFuy02ZXgqAvdOsnGN95e
	GOe7L06gWGcQYEcepNleLWmvgxuiBM8y/0mq9NKxareWC4iQqw5FkgYAZ2lyRRjb
	rueTXAYIoqjb2JQx9wL4CMutrEHnm62NOEtYC6EFIXedZW/y7G7sreu/is882/fO
	CFt9kkc2WRr+1bKP2wK2465As78K1V++sCRpxL2cXxjoTTAB3JRUXlAc9lEmbQDx
	MjpY6pSJr99BOiajBEn77flQV0q5tffBBe7HVjunqeiFwjxCvAIq9pudEIbaWCx8
	A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011030.outbound.protection.outlook.com [40.107.208.30])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gvagqxg61-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 05:33:44 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGBWsEtgEEJ6MgPYmrc76dNS2SLZysdKzTtJZztKlDk4c37igVtMxSXEn3wKwbvgQYdL+qsxY/MsNgbHVg5h86D1nqO7c5YZ9YLTRHE4k5bBfLyJ+95/RUEOOtQCWZtuulmCayA95SC7e3/GIPa/5Nba64+c51jbBjMQ+CsWx0Q/grvNaJ3+eZjVJ6LOOCwlL5oHtLN/jcAZLHk0VGABKv0dQvAe1a/IO+t+FGQ4TWVOzAy1vr7bQuXLY5r/NJy3skomjfRiQRNzQ5QTZJgKZpc0VlJx7PGq/khQwPS+FlXPelPgb/xHhnaQ53rZdS+s5xatjmS9wxpNRq/JjOr/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hk04xaLGOtmjGURxPNkIKp2BTnCBNwC5MyCA2MgmyY=;
 b=m3rdAMoXlDPQXKk5L0+qqeTJqeWS58Gm06uFUNcE6bkVpbWtFgO2IDzfUMCfFKgNMIzQ6Sz6c5MeNPjHmH5Dc0XK91298A1kBpjGhh7huQtG4b0Q7x6KS5nne4aBT083/C5VcNy+vwaw04Nk5pH0mmtkEc7N9NkiU4n92XRL9p+LsbIcanAVmUWAOoyvKj5WKH2CiFa73XP7c1E7PX9WBdrNiDuUYhvKiVsoJ00TRg3Wa5ik6ec57myl9hUQanivpRY2P8ucrHjfLHeAOERFkMN/7D1i2/WbhTtKOtgvAbkGyaYg4iXWFKnJ4s8JFMvlOSd5CFjRL05DYfF/VgC01A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by DS6PR03MB089049.namprd03.prod.outlook.com (2603:10b6:8:419::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 09:33:42 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 09:33:41 +0000
Date: Thu, 24 Sep 2026 11:33:39 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 9/9] ASoC: soc-dai: rename snd_soc_dai_action() to
 snd_soc_dai_active_update()
Message-ID: <arTuaAU7VfXvZ4In@analog.com>
References: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
 <87cxubjpqu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cxubjpqu.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: FR2P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::19) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|DS6PR03MB089049:EE_
X-MS-Office365-Filtering-Correlation-Id: c134e265-5e57-464b-fe9c-08df1a1eebac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0CaFW8ftkUNp9FyD65FRx7AADRFZY1rUNTr6aaNSnjg52ED3PJggWxz4Dj3es2LDvpk5DZAxCEMBOAbBBmx4Kthin1a0yy0radU8TYx2+PSJhAW3bM2K8KQ2YOCIDW5qIX9RA6wU9AZJlZ5K4ftjY356fA+7neIkn20LhUK5jSGGk9uPTsD+xNzEBTQNZdXoQ3YllcaQ0uerkC+iOsb0m3+EgSpnp1boWWvKRwnqeHxRjjKs7XQgokmuQdQUQ6QPrjcZuM0bK7TCBty8eZWGtIiG8cOMfwioFgiGcpYLyblFu4zi4drFjroRDqFXZTI13DiJOxNmU3Rsru4U31RZM6KU//COBDeEm6vDuamQxozKYGTql3CCuI68Kfl0vaQ5d/0t+leu1dfsNNJ0Em3qrREg/hglPMNzQyKLr7DSrgWYMOaUIeHDCnZB74vNDQAMKWe3AaqF6aA6Nz11EwqZvunDQdTKpcCoE7xQcROTVGpJzqoNOe/XEGhosZtWk2RAsX/ePg3g1x5oPmRaR4vaRdcTzb/WghmipJrcHXkQv5xiRy+9n4THS9gYY6If0b61cRc66L5gyVd1XQLeZZkNmtMs5jWSC58oHHvaL3M61WCnNDuyksqrOMquvx8u6HQRuA/2FmKKzDifTKwyGQty/0DTBV+sfd/iB4FmHO4OEsA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N042SGttTCtyc2szYUJ4V1Z1RDZaUUZDOGwwMEtReGdaUXdVOTZISCtIT1NG?=
 =?utf-8?B?MjI3ZmExamlKOWZpQlNxMVdaUVFCd2xhV3VPNkNIUHRjVXdWV0oxalRXVVNL?=
 =?utf-8?B?V2k0MXIydlVoOVVlY2dVcnBhRThUQ1FKbmQ3N1VWZ2NkTUFRL0IxdUNOcjhW?=
 =?utf-8?B?c3pabEJvUFA3OWEvN2xQZVkzaitLZkowQUcyd3Z5NlRkdUYrTTZqVndIVDQ4?=
 =?utf-8?B?WUc2TW0wVlJpUHZGRmp0aFpNSDFYTGYvNzg4M2dPbnpqZi9TckdpN25ROFAz?=
 =?utf-8?B?OWRUR00rUDBodFFEcEU0VTFKU3phWHJBcWZUVGcvRkdEOWp5WW9pK0FjSlM5?=
 =?utf-8?B?Q2dYa3JROElXc2NFQTZ5OTBxRGMwaGV1amxvdUdOM2lFb003TW9PUUU4L2hs?=
 =?utf-8?B?bnRRUGNseUdIdWZ4Y3o4MDBUS2dZdDA1TWhmYU0xNHNCSkJRa2gweno1azJN?=
 =?utf-8?B?a2dMWUdDWGhNTHFFZFVXMXh4bmZaL3RDcXp1Y01xOFJpZ3NweVgrVjB6RUNP?=
 =?utf-8?B?bTkxdG9WVGFlU1o5S2VPOC9nNFpNV0VsUkk0a0xvN1hWUW9YeHdkb1N5QjND?=
 =?utf-8?B?dmxRNHJGR2RtR3ovSUxBKytGVGh6aWRpZXNYN1pwdjNFKzE4MWVUY01RbkdH?=
 =?utf-8?B?b2ZWK0t1SjJJUW1tWHF1cHZTSHQ1cEU0UkJBU3RRcXdxaEVEa2pSOWdmZlM1?=
 =?utf-8?B?cUpKZ1RHOU5zQnk1UHNaclhXajM3bnRnSCs5Q0R3N0RGV3pHaGxlbGlYSjBQ?=
 =?utf-8?B?MHdVTGloS3R6ekVLNU5wSUFIN3NjT21PaEJGNnBvdHNLZzZwQXAzQjY0MHZ4?=
 =?utf-8?B?eGRTRGlWUzR5aFNscnJoVVhRdThlMnJMQTVmcjI0MUpZUnlkU01raDdsN0xz?=
 =?utf-8?B?R1B3cGVqbjJoK3laZ1JZWkVnOFhGbytEWHNwMHZYclNpVFoyOGwxVHI1TW1a?=
 =?utf-8?B?R3pzTUIxZmVjRGwzTGl0SHhWVGlHc1hLUnY3VHRCUzRmQkFjcUtsYWpndHdO?=
 =?utf-8?B?Rnc4L3EvV2ZMTEU5MHljejcvd1VqUTFwSlhJTG1NT3h3OFI1bEoxY203RWZB?=
 =?utf-8?B?b0FRME4rSDVQS0hBZU9BSnhhVWRsZjJKbFErMmowWVZ2MEh4N0ZWTndOT04v?=
 =?utf-8?B?MEwwZUExdDZCV3FFeFN0aFA5eUNSL3NydFcvNUFRUVhXSmVtdDNlK3NHQ3Vn?=
 =?utf-8?B?YWNSZnRwNXU0eWkydDZCSXNkVU9BaWtSZlFwZTExQnNBc3l4aWVJSHFVWjRr?=
 =?utf-8?B?RHhoRzd2NzV4ZWt1ZXRxOVhYQ2p5SjVXSlJxRXpqaDI0N0R4NGxWRUNlckZD?=
 =?utf-8?B?SnIxdys3VXJ2YmMybzlJM3RCTWFDeE1oK1I2RVcwdTZ1dUpzQk1ZRytNSFJz?=
 =?utf-8?B?RmRQYTM3SmE0NloyMWRDd083S3lMQ3FTSWdJRzl5SUg5ZE9pVE5hZkhhM0dD?=
 =?utf-8?B?bi9HMkgzWCtiTlVJOUlGQVFuRi94Q0R5ZUwwUW5QYTYzSFVubTFEM0QzV0Rp?=
 =?utf-8?B?Q0lGWTJ0REJaSDlhNGFkSWc5MzVGQzVETklyQnIraGxaR0NXNU1mKzhSRHgz?=
 =?utf-8?B?VCs3bU1Fb1cwUFo4OUEvYkxsMWJpS0FrbEtsbTBmK3dQZUhqYjAxWjRHNjdr?=
 =?utf-8?B?Qzh2Z0ZLRWtlTjZ0QnRvSXJJYVNsZ1h2a2JZOXlhMHZQenJlUWZDOE1HN2Zk?=
 =?utf-8?B?c2VIaStKc2hacnBFTXAzaUM0RXlFaWpBaGsxYUdYcjd5VmY5MElBanpDMnJF?=
 =?utf-8?B?S0k2a3UrbTRtbDhuNmRVM3lnNVp4WHc1Sk1MUTcrdlJJdlhlVjJ3TFNWbHZs?=
 =?utf-8?B?VkJlOGtQMXBoZm9MODVOVTV1OE5MOVdFUFcyVi9Zc3RRZktLVHJYVkZMV2p6?=
 =?utf-8?B?bTBjR0VRcGdMMkJpbXorTnd4RTdabHN1MDBkODgvakV4aFVkemVZUXAxbDQv?=
 =?utf-8?B?Y1JuQi9uQmlZV1NieXluNHQ2NGRsKzQ2MnhWRmE5M1JyL0FOc1dwMUl5L2Fn?=
 =?utf-8?B?K3dycTJxWjgvU3JwOEpaSUFEdEtHcmZGbU1tM1RPdFlDYXR3ZXRRNlVqcmZW?=
 =?utf-8?B?VEdrQ1JOOVdLb1NNMExEczVBdDc5RENYdyt1NmZDc093SmZpSUdUc0ZTTmJD?=
 =?utf-8?B?dDFRU25pc1UzazZienp6ZUJPNGR6WGxPRGhiNHVwUzh1OVhiZHZaMXUvOWRa?=
 =?utf-8?B?QjZnempidlhIa09TdXdUSWxTYTdWTEorT0VpRDBZT3hSRSs3eWp6c0kzZ3pp?=
 =?utf-8?B?c2FqZUk1N2s1SWE0YldxbmQycW1CdEZXMUNZTGJkdHlFVVo1cnhFSWE1Ritt?=
 =?utf-8?B?Mm4zTWJLOGduZWRNTW9mcmE0R29OOUVXWDlxY3MxZnZBRXJuc2R5dz09?=
X-Exchange-RoutingPolicyChecked:
	GsGpcizv3oWSyB+SbKSzHHS2xw6BoHvz88Ydy87qGgOOxiM+4Wb47aPNDW5AK5/laJYcLYN1vHgOq1pNbCYtv1+2YfhJA5WuDLLQ6HDYIDlhFsgHiyYDBj+INObPkWH/iWDUXOgYbNkt07Y+2SeAtjez7WvWm/OZrKX/NTYD7oRhd5ui8NVsBF51yQE+Tp8RHh+z02Y/KQ79j9sD5a+jKTqgLzZAwdZ2Vx6d2CL7w0Lf1K7jTQK7SA81YSKxbvJWBK8iS9+tZJvudPJQKj5L271hbsVPzV8SWbXaN6sSRjyjf0QfbzRFoaRZRN3RtoYyJ8rpDxO+MYrz/z5J9OmErg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c134e265-5e57-464b-fe9c-08df1a1eebac
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 09:33:41.6408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B10r+ahRR8HapysvpOOfoDUsQA60sKmX1Gd7X642+LakpuJ+XchqKX0LrstRqWrfUZU8IwOGdObRMYx6W729dSlT+mPsXN0IGgkrPuVWDlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR03MB089049
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzOSBTYWx0ZWRfXzq2jz8R4JhxE
 b1vWrBObfSl7bTYlhnMxedtq7jvubMADb9/XFE3MVOVmPXD70te5Xa81W/732xrnkUQ3BNCrHAG
 HFoGGsYS64KHYaMihEiCT26hKJIrYET6BPAypV7plckSWjkohJUQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzOSBTYWx0ZWRfX7rjgFoKI+Ixm
 7AxWbwVCuWMNzoILOd7ndbVxwGbBbcSuURIs1sAE/UJa9EMxONN8VFtxm46xvPVZslYO1+v27cB
 focSCeLJWvjwPv01BK6G2RtmyQk/P593mZzTxRdAcuLLCMytdZkA8hmKX3FLvyJ7JOvl09KToC7
 /a0VA94s+ZeFBHmKGLRcTPC/wPSjb22EcTQX8PulX5cfRvNKPAfTvNfNnnt35Y/yB/R0Qxj3gED
 xWqTNNiIXvbkcZMYhczTgRa6sZc2aRiPk75S1V4ALXm8j+0R1KzKU1h+9xSxK/QfrViqG+8h5Fy
 uh02jYhVkUzpaOcgN2oRHMaU9rWPbH9CgTP8y3huWmErMRa+wlJDncQ9aUFCaq78NLwaaoMYa00
 0GvqApgOJmQYGoOKsLeOkOVosa//GVj4zWTybsJokHjFpEbb69zjQqrNZixKS9Z2KyTuYx/liLz
 FLC3uUBsYY1cGKYWRLw==
X-Proofpoint-GUID: pUCKPnrX-71nyvcNmQ_IbvWxf-Q6caHn
X-Authority-Analysis: v=2.4 cv=TJDQ2Fla c=1 sm=1 tr=0 ts=6ab4ee78 cx=c_pps
 a=ysgzExocFkmHQmNOaQPFvQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=bJdpwySw-KCvjmv87LAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: pUCKPnrX-71nyvcNmQ_IbvWxf-Q6caHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240039

On Fri, Sep 18, 2026 at 01:46:17AM +0000, Kuninori Morimoto wrote:
> We have snd_soc_dai_action() to update .active. and in the same time,
> we have snd_soc_dai_active() to get    .active.
> They are confusing name. Let's rename _action() to _active_update().
> 
> And in the same time, we have snd_soc_dai_action() and has its wrapper
> macro _activate/deactivate(). But callers are using both original/wrapper.
> Let's remove wrapper to remove confusion.
> 
> It is used only from ASoC framework, let's move it to soc-internal.h
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
