Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794488278;
	b=nII4OilxVb0pSx/m3lIsb4F+5YErPXodZJ2UCRZXlawm502qfPGBZMUbFObe+Ybw3Z4r
	 gEv7hCcnpLxS64yEw0TaR25UInTjU/hUJd9V154mtSBeKMVerblpf/cFQ5cEdnOsfUmDq
	 hi1dGP5lDSLAVkpyM2RXOZ7NjrfM4NWFI2t7GjjG1vxX2LuceAQzv+EufgDUGeTQesSN4
	 F9nZvCzVSG1fMxe2dSK7yrQg5H00CPRpEoK+wAtCWs1uJqv3CKhPr+jUuwsSLRQ99o2dN
	 83i/mYccbT31U17lLE3wmtjvMEqfpq1YsECXbYz4bDUd5HmpZNK6NNSpF1Hvo8SDlAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488278;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p5hxWjuub+fcY2CnFXNsWnIv6cyGTsBR5y3m1nwzCpg=;
	b=DMFQpm59AVQGVRsHyEvASc1xFSSgrHqcqlz6ZVqRaWkx6t0OWUBFvvDlqNRKub0wpde/
	 8HTuyYYQmlDuxUC5JLDzDepZ8N8XuA/zdFd0jKlLRoA0XemFRSnZS3JnIQdqgiizoSDeU
	 cQb+ZGaxPxhd32TXviQvWxB62hPCcc4BFAjo6Oi+sTTpq8I75On+kPEijsBqzgKF1sEt/
	 F//7daCao0IVuSRFREQXvNGr7cFmyLsGXKa7tum5aj61WtYgANFlg44txaxb3ITwlQi36
	 +0nqrvQF0+H1vo3TodTKUgU8Nr0S8LDqYsjkqUQd63GDsbJqbfz/SZNih4g0JrwZCfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=cQGxezxN;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=dNQUjZUA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC95606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 12:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFC95606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=cQGxezxN;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=dNQUjZUA
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAuxMP1449319;
	Thu, 12 Nov 2026 07:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=p5hxWjuub+fcY2CnFXNsWnIv6cyGTsBR5y3m1nwzCpg=; b=cQGxezx
	NJEbVOd1/Q5Sm2V28S95PuMwskk/+MyWQSbOgnHdI3doshtBRT3bJsBYLUN6wdau
	sdX540MuSPAv8nqZpDNNaEduakCEWmo3ibNKKWu1Yu+e7fpSxmnA9AG4/g7eQZsd
	4fxBs+iRSPxQie7U4SSC+FjvvL60bvEB2E8EX3CfJt4zXBno8U5ZSrdOUoNYb+xH
	UIULToFqYfJ7FgQOYbhHFf8xtndWM05NzM8aY4h1G2q7i8YqazXLPy+2/Go65Y2g
	bCL0IdO6K1LyvIciW+qxWtVwX2kBjwvGaEIokKLOspDyu9gLCCqoqAcNtM+UjvQC
	6Ai7/16r7Z4CoDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=p5hxW
	juub+fcY2CnFXNsWnIv6cyGTsBR5y3m1nwzCpg=; b=dNQUjZUApsDCsdK/FzOcJ
	ApTeHFIQRN6ShnkakOjBCLIKLqXB6wfj1jjPHDomPgRYUXaFKVkjC2hH+yqvqnPA
	WgP8GHrrmOdYseXaXKu7FAFsbsN1cG53j8zivryPRQoDtyTmyiyuHFW+SRxnR0m8
	PJKb8IMY2vXZwsV9jmnkVH43v0F30yvd3rYF/zgRZmd3uxFYZ2N6ePxEGcVp33wo
	17JCG1opN3TJYYOsxcgnbV9WpaS6CHMhVS41c5Zb/TE+DKnD5l/SlXf+RGho7AGW
	QvolAurms1vxtt/OYBVyWIqNERGLuRYWd0YEspTQS7nd/MVPKsfWu0ddO21r4AcI
	A==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010024.outbound.protection.outlook.com [52.101.201.24])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hw5772exg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 07:57:47 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvysLK4p/R6dVa2Lb0CaVoadpRsSQoL9ESr3hn2rOnCRORAY9267/csLIWwDo+sYEvD2u9vdAim3GdJ6sGIXY0O8FzyxDSDBWez3wJEqV1GGe9wecBN2qyaUCsrU6sn5NtJMZXJBganbquqSNxi0Ui8Ekd6FeBcSc+muV6i2ocP2A9OH5i/ECH3w5uDXIc0F+0en+h1JRrbp+RDMVV+jVIRvn/CHJ2ejcPdEiJi1lmPWNYK0P6SRg9X4EA2ZcH0zXoMqEdD8cQCeHsShym3HYXnKGIyiBxP6n8MoniS84LESQNgMRaAa91BE03XFdweUIMhGfeUj1AAz0yIqSP9Hmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5hxWjuub+fcY2CnFXNsWnIv6cyGTsBR5y3m1nwzCpg=;
 b=a/ITVIlsiUjoneC0oruVjGk0UoXam5c/OMwvzDHUYuqMeZW1OHcM90ewkJqWgOZR+0uc7Pl2OHv8mrXvJ7qYhFvdeXGEMH8FEukPiMuKpXmo/mIOoCIJqEAAJOHC9Upg+p/QZypgwu+b1gs+TrgsEKrsf9kbi6o3L7YGPn9USlOKZQQAk29MpyBChtmQKevbwDCN6F0ExcdJ6apZHD2HrUbDce0XTLmtde99ZRtuBq95xiYlprbyStkne2u3bXv22D21fqQJoKD1eysRvlN4w9dzN+ouyeMIluhPhwucPpGudMrtPkZiG9endtYiSsDdoU0vhKuwAFfooSksFHfsJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by IA3PR03MB8476.namprd03.prod.outlook.com (2603:10b6:208:546::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 12:57:45 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 12:57:44 +0000
Date: Thu, 12 Nov 2026 13:57:35 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 02/27] ASoC: soc-component: rename
 snd_soc_component_{init/exit}_regmap() to
 snd_soc_component_regmap_{init/exit}()
Message-ID: <avW3s4xpty6LVG0_@analog.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
 <87wlqi28ne.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wlqi28ne.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: BE1P281CA0443.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::16) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|IA3PR03MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: ef2e166f-a1a9-4af9-e357-08df40bc8819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Eblyr/B3rubN8gbmSZRRDW46zGmc6d76owe+zYWEGTNWnfWSD4gsu5qOdha9YLUGyMt3lf//UL3mO+5l7/8Hu/CTrk3l2XvbEk6OWhfRBrz3Hka4WmLDJulS3FSYb0Igu8puSO1XDgE3xXu5qXBOsBSGKkrehEXfigW6Cex43Uan908PlqKLq9nlEch9Xu/pbYm9z/F24Ebc45KzqlmGuFqIdeaTTq1hXmA1WjDE6HIfhhx2TIOte1xgqPsstL4RN2hEo+e6xM7NUWP2IZEpwEbuJYDxZ3bsYr9zKKwGmseWdyoaebiZr2eNYAeOQKrSoEdd62ScJOnYmPrI11FNjvxqCmSykRRgDIDK0iN1G82gk+slLMpxaMxDVCHd7SCU+XfaBynQ+j9Ar7/7HGKq/Oa5fDh+6Uwpwpn6+dh71JlXC5F6cWiBhqJcUD9nUct27MNoL87jTv+G6ilaunnP9kkL9TUaZi0Pq7ENC0h9WMDbhsGNJb+yIy5FoNiRoNiMoET/G91QQx8sl+tNdyqjBV4Ood71746TTuikMz/YC/iflYTfd2FHxWUeUvgsVNVW0NLJTof+8PiqW2HfQBYSqWkpo5sWcg9AQ6ytf6ZU/4XyOAoyvJFrR/SJNZY56ZIcmFPZVrGi4jyjEppfhHplzT9gzxyR0SFRtDFObfANAdk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rjg3eFpFVHJPTXJySHR4NGp1Q3JGd0ZBdDVyVjNpb2RINnhyM2JtZk11K1JG?=
 =?utf-8?B?U3JtTnA1c1QwSTMwb0N6dEpXOFQveE5SVTRWWlRhUlQwaTFCclpHY2Z3RWZi?=
 =?utf-8?B?alNVVHhQbDdiUlRUd3BQRkdxVU1NYk9aTWJlL05PZmhsZWpLR1c0SU9tRU5i?=
 =?utf-8?B?WUFMbDBPYjhJejFtejZlaEVnRzFlTVNVZEVaMEc2eFhNWGJCNGQrVGdDWkZP?=
 =?utf-8?B?YVR4bDUydDhmbi9MTGFCNEZ4YUc0dXN2K2o2ZHFibW5hcVhHZVB1WDFOUmNR?=
 =?utf-8?B?TUhxU0pzRVk3d2Jtb3VQQk5kN1VwS3NLT0xzT1lOOHROK0FuTXBlRm8rNU9G?=
 =?utf-8?B?MFYwSlQ2eFc0aVFIT1VvSHhWamlRdVNLNkRHV3hOcWM2aXdrbUk4bFg2azkx?=
 =?utf-8?B?bTZZTWFoeXFRUkJubStwOHkvWVNMOHh2aTFNTUtRcndtaUphT3Q4eVhDQUNF?=
 =?utf-8?B?SmZLV2w2VE0vc0dxbFdKT3gzZWU5a0ROMzNJMkR6YVRqK0Ewak1uZE43aDRq?=
 =?utf-8?B?aWUwT2RWU2V3NDgzbkZoQXoxL0FGeFBhVlNUSjd3amZZNWh2blNWU0QyNGZ1?=
 =?utf-8?B?UEk5UTJCWVpZNFlUb2tzR0l2U0I3L1RpQkNRbU1TL1JBRDZxR1RZaDVsM1Qr?=
 =?utf-8?B?eGpCUFU0ZzZLYUkzVTF2WUpHOG5LKzBaV0JIZ2E4aEMrc25XMTF1Y2VFT05S?=
 =?utf-8?B?cjFHc2ZubUZSRGVOamdFejJEMFM3YjhlU0p0MlhSRk9HY1Z2TWFGMjVzL2J0?=
 =?utf-8?B?aXlwNW5BNnBkSnJnYlVJVlVGLzBpdGpoOGR5aWtwWlQ1cmpLMTkxZ0puazRm?=
 =?utf-8?B?RWZnREhTQTMvUUl3MDVwSW00QzRIcjJ1K0dlckc3TnN6M0lyY0dOR09aVzJo?=
 =?utf-8?B?OFlyRDNHTTF1WVdFWDBURDVBbnRSRzNWejNLYmZpank4MFl6N3NqRlZhYUcw?=
 =?utf-8?B?aGVjUkZmVEVBWU1qSXdNSHZ6bWdWNDA3QjhZLzVCOUxFc3dPdXpNK2VtOEsr?=
 =?utf-8?B?YTB2cDRDM0x4aVpOa1pnSC91QmdtT1FwOGhWWXlMcUszcHVCZTJoMENSUVcx?=
 =?utf-8?B?R202TTBROUdqZnQ2a3MydE1uWjhrVWd5cUkrWTZJMEdyekJYdndicXdBL0Y2?=
 =?utf-8?B?UmpBcXc1L1RhN0E5SjJ1bVVkWFdERWJpWUlPNS9KRmJ0MmJBZys1VXpYYWw5?=
 =?utf-8?B?RVUzSXorT1RWK2EydXVuZWw3V3dDUk83UWpqRUJ4U0xwYWZDUXJZaWVQWHVX?=
 =?utf-8?B?c1VHVHN3eUlGV3d0aFk4cm1QZ1Z4MEYwa3U3b1V2bzFWbmtqVWRBYy9iQkFJ?=
 =?utf-8?B?MWdocEFzdUZUdzB3cnNNMUxTRXBDbmdYZjhJbXdEcTEvaWxWYVdQeU1oeEhi?=
 =?utf-8?B?bXNHT3lTZXpyNWoveGtISzBkYTZhaUJOWmw1K0U1SytoVVhTM2Fyblcyam1M?=
 =?utf-8?B?K2V0Y05wNmdSaVNraXlMMFhHQlYzTFQ2VzRrWjA3WXJPTDZCcHMzcHVoWjAv?=
 =?utf-8?B?Z2NHQXpUTGJvak1jTndBSVlHem1LUTBxVENtQVJJd2xWNGpLNzYxeEpYcndq?=
 =?utf-8?B?QjJDQWR6a216U2FacU9GVVdqNDlGNTlNMWl2N3ZOS21YanZORG1TeG1aTitx?=
 =?utf-8?B?L3dDVDIvMDI1SkJaQU91K3BGNVdJTnNMelArNUpDeUJTTnNNL1lFMGwxNDNs?=
 =?utf-8?B?cjIxN09wL3Q2SmJNeUJyMDdhbU9ERmFDa0JwY2p2dndrL21IeGhoSmlkenhB?=
 =?utf-8?B?SWFXbytseGtVVTQ5THhJaDB4SzlVK0tockdReWNaTE9hRklUQU5lbjk1WTN1?=
 =?utf-8?B?MHR4V0Y2R3VTRmowVi9kUk5jZlFxeHViRXJ1WE9zMWgzbFJuVTNNYm1SRVQz?=
 =?utf-8?B?bUttdXB3OEZyRjF0cmQrSnZ6T29wOUpCUUJqUmw5VVpzL2txbXJNUSt6dGFv?=
 =?utf-8?B?a2tKRWE3UzJIQ1lzMjJWNkwrYW1iODRqOGRQc2k3V1FiUXBXVEZWNDBQNnE2?=
 =?utf-8?B?TnhDSEZUM2EwSjNJcTlsZ1RTTVlhNWVJd3BmbnVjVGVTdWhsVjlNd3FGRldJ?=
 =?utf-8?B?dGxWR1pDZDlIMW1aU1lUOFVudXFLMzF3UU1jQmtMNE15RzB4STVkWnlFS0tk?=
 =?utf-8?B?OFYzRXUwcUdHMUNaQ3BFbG14TFQreE9INWU1bDlyR0ZBYXFrb3lwTEo1d3BS?=
 =?utf-8?B?VzVUT1FqUklrL0V3TFZDRHgvRkx2Q0pjd0RpRExYU0NMVXNDRHY0aGZtTmVz?=
 =?utf-8?B?SEE0ekJnTjJ4cEJrSnVDSmJkZkR4dHZyMFYrSEJJZll0ajYzZXFHT2JOSGl0?=
 =?utf-8?B?QmRTNjVtWlNuU1BabDBBWEhScUZpMEw4QzVvWnFidGV3TUhjL3lsZz09?=
X-Exchange-RoutingPolicyChecked:
	Pl7W0tdsYy3ci0t+JLA18U4NZg/xco6e7EIya3Ag3Xc9knP/ddyTh39KCHLVlGaxvyenvCWjN1iHjhFdkdpm+bC5NJBRTqkJtX5KmJyQXW2g1yHTe6kezFtqQdBp/iEDXwBfMisdsP7myBS57MyDbOIWeWa3sFfN2LR5qQT5mBDHv3SDEUPOE2D3HmXvRrukEhOIihvQfilF+ljAehNXEcONHYffUiG9tMCeiPI9aT9DFF3vdgFBA994kygPXAjKeNueFqCnLnXmb4ypgUgFXTAkOiDbg8VMnVXD3c8NV8oipqbe8vVPMuJmltCY8IGedOS4qet5nLeOGU5ibHuUMA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2e166f-a1a9-4af9-e357-08df40bc8819
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 12:57:44.0702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FI2lzJDn1CeQGu/35w16cgYvj2iNmAMggabDYTWiWlYK74qc3w1LmIcImuTVWOVrXrhxrQ9OO7zXm3S2oH60Zjf/gZ8OiLb3MLyAWoIuOV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8476
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfXznIqqJQhiZkO
 dcbrfBU2x1ZgRwKk6eJrx+evz/vDbTsOX9ldG+MC0l73b9brNP43YaawjoTtsShDT7ZeTczFDmH
 nuI/bBFF6tm3zMHwCQKfVTvor4pwWYfnPPI+7H7wud2AJ86NO27X8fzNE1/dvpSqFFej3DXYc21
 Jdgi3R58veSFuG4Mw/CHyWGA62oYfZlWM/guq9+py/S2sadAZwQcns6w26sso5AoDK9GBAMEsti
 VDL5nIP5uTkBAgqc9mzVhtd7tloTT9etxWRrWJgot+OqLQTZVbPQPa9h+1/hn0OPG+20Y1qaTyD
 M6jXpxQ6gyuvspVbnGXgaNKarSSbwpJ+v0tAmaI2acl5V9YxKSIXdDTUJUv5uXFcgRXzDut+7VV
 bwWdy2JyJlnvGDCVRrTb1msZYQHZDzwHSzRzRvDtILZkM4bireXO+yDSxUYjhm35Qoe4k+KS8cu
 hRHR+ndv4AQ5unxm1ZQ==
X-Proofpoint-ORIG-GUID: 10M6FhrwTq8fxwrp-tUJwtGxDBDJgOaL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfXxC2TupOrHRDQ
 LOckBzqeOBZOOIOgPYtQZkoKLkCPv2KT2Ma26Wq6EdBnJWT4OC/mZ4ghnsyxUcknHXA8irWAJQn
 N+wAIhBaLEbZFpAH2OQK1gxWMjzjrUzNxkuJz1+4F5E+0kFaPuiL
X-Authority-Analysis: v=2.4 cv=Ta0DJhQh c=1 sm=1 tr=0 ts=6af5b7cb cx=c_pps
 a=65kS/IK/0KNveI1QfQMUCw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=slah_SWr4k_U2i-YH0UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: 10M6FhrwTq8fxwrp-tUJwtGxDBDJgOaL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120051

On Thu, Nov 12, 2026 at 12:30:46AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> We already have snd_soc_component_regmap_xxx() functions.
> Let's standardize the function names.
> 	- snd_soc_component_{init/exit}_regmap()
> 	+ snd_soc_component_regmap_{init/exit}()
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h |  6 ++++--
>  sound/soc/soc-component.c     | 14 +++++++-------
>  2 files changed, 11 insertions(+), 9 deletions(-)
