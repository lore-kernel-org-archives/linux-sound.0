Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794411913;
	b=Y5tQeXbaLxgWi5zLcGKsKwy20Ja0tU9MqVFAcIss9LvP8o4dRYjeaCbisR4r4GMcHCwp
	 nwyVyp1GGdGE4ECo4iAGM4iFtSWcqjOD+Pbvq8+5TKqwb/PLqP7+LKs2aSTn5+/0R4asz
	 5SZdsTzj+EMrKimbsKVFGtDhbyDkZxr/y/n0/tJuWRKi80kXjWWS2U14nyYV2wzQcKkHf
	 b7hyi/GoNjXnuCfUQz+wO5+anFd3CqAMfv4uCKIKVQGWACzJe7EBVJn0KQeZL4r0Oponw
	 yMMI/Xkb5LZFWvHWDfJU2pVPF4MuFX34h482GToDxmJT20n7VdtL2GRiBDpXhFCTPPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411913;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uU0ld6R2Teui8uxHUa3YXqSKCngNjIROTvncqyrByZY=;
	b=Vv0gIes2TISNZ2hCnLDqd7942GpDkNn+6Z8KIdpQWgcWdjQWIFfLvxvSZruu1oDK5Coh
	 /pp8r1IVytiHqWm5Dp4zHgBDLjDKXVphhyMDzm5amuGS26rFaWqAEi+PkYoMDwpcAt2nH
	 VEbTvIZaXEUUHZtLqhbhrMooKUzSZJ+2KRj9Bp4jcE5M1W4sqNMNx4aXDvASrRqWqg4KO
	 XFbhI9EbfFrUV2bSYeOnHxdhFP2/EiBEi2rRyQyEtiZ4XJop753NPEorfpkJSdrpqZ/6a
	 uckJJVKQtNXRxbpPHb1DqnuUgBfUsc6fwWiNT3j4LMgsqj+WqNbbDAPw64dzdyod8IQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=RkTEmOG3;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=JcVVZA4t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26DA606A336
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C26DA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=RkTEmOG3;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=JcVVZA4t
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF3UUi1310805;
	Wed, 11 Nov 2026 10:45:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=uU0ld6R2Teui8uxHUa3YXqSKCngNjIROTvncqyrByZY=; b=RkTEmOG
	3kgW8zFmoW3qeddS/SPNw5SeDhb44HR9qKsY4qZ3TW1F+jwEtfYa4ejhelcMhBZZ
	Vgqq/D96saVWCSrZzWtDB3bUgvwDwT/4O1rBJgC3CdOU+FayEYfAXFrVfnjoNmbw
	rqxa5qBeeAcaHe7N+6LpPJb2DVINk2J5dLIq/0TQnCL75+6Vnv5y7270HPuSWefS
	taC7IxezjReukKZHkXLpQ6E/FItKMEonz/7Q1YH3Gl3uD+ebeyV3iQ0OVOTY49oA
	TJ0iVy926vEQG2Ov3zhxvxalW/jBsykgXgKUqiSDC8FW5Iqo0K/4iPhy7dD6xPGw
	D25S/CxveC5OLNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=uU0ld
	6R2Teui8uxHUa3YXqSKCngNjIROTvncqyrByZY=; b=JcVVZA4txd6X7Nczb7JvK
	5IgpXNQarVQJwtee8KbbjqKjLvoIM4ZXnksRI9OwfA5+S+kPWLKSJhcCixEFqiOY
	TAOUdtPkd0LzFNqtJLFI2bT7fpr/jRnW6ggX+Doa6+gi8zuXg4eTZ7MCxF7P9Klr
	kCunNBeU9rYg37SNKN+b+liqY1kr/zOI0yFHstCAiRdBVo8t5YdHKjPPdg1e1fNQ
	tbdzx/c3u4gim1Al8lDyjiKhOZ4E3nnWMFA9YWjXiFOVGK2ODu+ufA+itA3/QqFd
	196hK3KXdWOx5nTcGeqXhUI/MWKI6V5XlpFGgNeWAh+qQJg+GiGQ8jjJJMXET1NR
	A==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010048.outbound.protection.outlook.com [52.101.46.48])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvrjx11dx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:45:07 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5syUpxaXWnecZ2OVg2A0EZ69znT3MRYPklIhL10jvmQto/S+OoR1WVSanP5mEOpPSeuDpt8q6eiu/WpwZwpBOSul9PDBbBWMxQX9kTrd68x1DejGIMbIQx4j4KPnP7ZW7ZlodaSX5UWB5NUeGuXAxziINU1xkZDHA1hYJCfuCRCUEz3n5ECG0WdtohJlj+rZv8BDgb0jiUJ4Ht+9nFMEbqjxSYbq1YLvDX0CDtYLAnbgwuBKKPz/PdO3KDy6zzFWYVZOzRJKdqeL/djBpdWCV3RwO/87hEIjMdExVYLnTZFDlLd3dXxbqC3BtPj84b7HZG7z8rE5vsuufcKIQQHZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uU0ld6R2Teui8uxHUa3YXqSKCngNjIROTvncqyrByZY=;
 b=aLJPh3LsNh/5/76L5dr60MFX4irnANMnW+uOQl7Uh6VmavDq8evIgxkjSfFAnl+Xl1Omv492G09yX5+VgwMbiLjYxm1fmUJiIr0LGmmbxLlBxpqSCOJJ9Fm+z8xTi2kNEBeWA9xCXHXp9W7BK/Bs39l1niuetZTF3waBk5mMWVX86Tz9Hzgm0kzTbkmRwnMjp2IbPhxSc06+S/ISf3DEu7PKuvIH/SAVeiSQKKBOAQ+3GaBmd/e/TLQ2BB6uSg20QDOGr8Mbi15fODPDpzIAYagTxfovyq7JJPZWb4jChKTkbanMwDRlQnuaQVw0qp1ZT+F41Gkoeoa5+EX2qELCjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by MWHPR03MB998632.namprd03.prod.outlook.com (2603:10b6:303:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 15:44:34 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:44:34 +0000
Date: Wed, 11 Nov 2026 16:44:31 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 05/20] ASoC: soc-component: move
 snd_soc_of_xlate_dai_name() to soc-component.c
Message-ID: <avSNWB7DppYEQ8xM@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <871p8tntsn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871p8tntsn.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPBP307CA0013.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:2::17) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|MWHPR03MB998632:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d54f32-b92a-41a6-10dc-08df400aaf53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261009223027099003|10067099003|261022105027099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2zLyNIJ789MVsEy64TuXba2RMsPJjv/srqPALxE1egsRsq8yWsrm7rVu4+lT3C14jEXIyUQo/lgNRaYm3GFKk8t9O2ksrfinO/9gGeuWPjsyvATBtZ7ZVduiKWgXw/nbkRaxhMoZzpSHgZEA77hsQQZzb7pKyUi+p5/D6qwcyHXqQZtcSmqj0CQPXGhCMoI1evVOmf4HEGkhbdkV/qblix6uQoPZzO3Xwwnwv12Rl3MPRnBRaXlexfw00F/I9UUkzcagGiHk+KURzrVUXlHfAFzU40rSIoKQz0/VP2eUew0VWpnLQPSy0HlhHuv6yKeZivb9bWCYEopqoy3eWpwUQF77T9N6hEyHrdX+DP23doZto3arTYru2F6aeaPLs1f6LjfxK8vRoERz9Xcu9hxpae6sc+VdkMtwJBcAXgwCFltgW+NItodDFuqJXP6YG26ehqNQens18TwIJkQ720pPVzZcmKSsYpnQBk9goDGiYBma3BUEwvw9zxH2FhQhXHadkH4qj7AbNM3O08vMdYhx0v5lWucEDA21hWpqVN4nUE1tKS94EpybwePXwIkKZETbYYNtH4p11YlmXfRbMvHTEwbheLSL55GSIYzi5z2dZVCRyRtYF/H7ax3Lg4gh+qol25li6ImP4EHkgdgWx1UetDHMF8SeZC1aIVDxIU4DSSc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261009223027099003)(10067099003)(261022105027099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUtxYU9GQWNiaExwUnRCL1k0RmlXRGd0UVNqZGpNZlBxUXFDTjJsK2d0eXJv?=
 =?utf-8?B?YjcwREFVZDhseGJuQ2RYVzE0YWdXZ0JjamxMSk5iRGVuM2JFVjhNUm9wOG9k?=
 =?utf-8?B?NkRIZjNVMVJlaTRWc1NZcFdzcHVCVmxoWmRqTlkxMkxQSWZVWmt4bWREc1RJ?=
 =?utf-8?B?MHBlMytiT09ya0tOLy9TOTgvdEM4Z2lNeFZacUpQSlFETGd5WFdVaTlkdkM2?=
 =?utf-8?B?Um5rM1JrbHloTldPcHBOQXZlM084a293SGp6aWRleTdtakFENkozcXBBYmlG?=
 =?utf-8?B?RDdCdU91akRtQ2FVRlFiL3l3Vy84YS8wRUw1aFFHWHN2TGIwS21DQUQ2VDlP?=
 =?utf-8?B?KzN1VndOWXF6SGRMeFFZZ1VVOC9OaTBCak1Kbnl3RFBBeTUvYXpvWGlyVWhp?=
 =?utf-8?B?V1pYeHRmUEc2blFvSjBSYm5YTDNXb0pqMHJUcEJxK2NKcEYwc2dGajFBM01U?=
 =?utf-8?B?a3RrZUh3Slltb3cvN1ovQVNQODdRbGV3Y2lsa3d3Vkx6dnF3alNUSzJVeUlr?=
 =?utf-8?B?dGNublNtSkc5WGdjSEJNV2d5YU9uQnVxSzQ2SmdkekN6RGgva2F2cmwwQ0pD?=
 =?utf-8?B?OWZKUzdrNzJPOVBzZlhRQjdFRGdOUERxY0d4MXZwUzFQUUxYUTUvZjc2bVVZ?=
 =?utf-8?B?U3dWL3g1ZkNjVE0veG9nT3BkTlFHa2QxODVNUVU0a2YzYjFQVS8zQ3M1K0Q5?=
 =?utf-8?B?Z3NRWDdWSTR0U2wwQVpaeUQydzFIUXZLUEMxWm5jVjFtcFVhSFF5SDI5MGhU?=
 =?utf-8?B?MmZ5N0tnaXg2V1k4SkdaclAxZVRiTVBWMzkxWFQzNUNqZ1R2Y0FKU2JoQ3px?=
 =?utf-8?B?ZWZFTzljellLdkNwOGdQQ3pIZFA0elhTWUJ1WitFeXk3NElFeXVkRDR5MHVq?=
 =?utf-8?B?UUFQUUtNM3VyRUE2MFUyc3pCUUpvbDFVUVA2aGFjYUpWR2dKNGpyQU9zU0N1?=
 =?utf-8?B?N0l1c0JQTVN1YkUvRFQ4aFBnNHgraEREKyt5Ry94VTZjSXFvbWxaZktITEFQ?=
 =?utf-8?B?L2xxeTl6bUdZZEJFT2piT0lmZWt2cExOOHdqaXRmWjJtTGU2OVhJYmplTDhL?=
 =?utf-8?B?aHA4Z0FjSFZmbTBNcHBpVDJSV3RRaHpLQlBaV0tVRXI5SnRjNURmNXRxS0I0?=
 =?utf-8?B?YTl1M2E4Y3JvR2g3WENOT0JHdnJlNmt6N05vNzF3OVR1cTkrKzgyaFQ0ZmxL?=
 =?utf-8?B?NVYrZHlPTFFPZGhFUGVwdjQ2QjRYY3lGbzR0WUpoRjQwbmt2T1lIUVBBSWZw?=
 =?utf-8?B?WEhpZlZwczEzWTN0MEwrd2pzMGswOENKbFhvZ2xTZFpFdlBneUF5R3dOc2JQ?=
 =?utf-8?B?OUJMclFvVXUwelF1MkVVdmR2M2lHUmJnSlIwYm0zL2hDbkFjWDQ0MWM5dWIr?=
 =?utf-8?B?RkFOaFVIVkkzVGdTUkpqQkZmcUwwYzRxVmxrdHh5U0FRdzZaaHpMRW1kQlRY?=
 =?utf-8?B?Ny9TNld6VkJTRDN0Mm5SSmE3SlJZU1RsRWRCQ29pZURMMkpTQUVST1AzQVVS?=
 =?utf-8?B?ZkFaazdPdysrNDBUc0hYemFHMmMrZms3cVhJK28yTUlaRFlkRTJrZGdDcDcr?=
 =?utf-8?B?SkNIMGhXNE9VaGlrUmxhUzVYcjNpZXliT2JuQWJvMUwray83SFZiUzNaTnY4?=
 =?utf-8?B?RzgxNE5rTTUzbGxYeVUybU53WEE4dHRPNTh3RlNEcHYxVi96TXhGNzdFemJ0?=
 =?utf-8?B?NElPeXpKY3lVRUVkSm9VNXZIS3FKOFFFVGVGOExkZkNUQjIvZXladVNxUWRk?=
 =?utf-8?B?MktNR2VXaTQ0WHBPcmJuS1NxNkFTdTk3a1E4K0NxUlp4N1dEMTh2RnlKVDds?=
 =?utf-8?B?cUMvazFpRWlXcENmU2V1blkwWFhJd0NLOFI0Zm1LWGljV2thZVloU2ZpWm9B?=
 =?utf-8?B?UHJYQ056cCtiRXgzMWlEcGNIMURPV3hSRE9OSkw2SHNzRFpCeW9qaERrZEh3?=
 =?utf-8?B?eTJQcHMzUWhFdWRzcWhFa2c1ODVPbERMWjhLTjA4c2ttbVVXS1lSYUdIazlM?=
 =?utf-8?B?ZnBydE01V1NnYUNXNWlHUnZyZmhXSVNYUjdEdVZ2UUFZV01vU1c2SXBhZXpH?=
 =?utf-8?B?c3ByWGtnRndoRTJ4eXJJcENxYWJUTUVNcEswNnJKRTBYRW42c1NTcHA4RCtB?=
 =?utf-8?B?eXpNUmhISVFTWXh2ZjJpcGxheWVuRVJMM0lsS2hEZjNSbFBpalRLZU15YTlG?=
 =?utf-8?B?aExFTlA4MGlQQzRVRWl3ZGlOQ2FScEIxTDE3K0Q3YWdVRHFabWVLVkhnWGhk?=
 =?utf-8?B?TTNNZWpVNUNsN3IxTGtQRkRGRmJaQWtCb1NRaWphMjVKUFQwV09BbXp3NzB6?=
 =?utf-8?B?b29PU0ZrUWZNc3pWS1RtbWRRMGp6b2NnUklObE0rc2EvOFR0cVdKZz09?=
X-Exchange-RoutingPolicyChecked:
	xZh/aiI1C3GiJEiejiBdqY26yOiTISM+AYGNxuUJPbuEfnq6VYxwyBCAQOSqfSSYqHQWo8H5QZwokTRq5iYFpD8v/4x20kuV3tEAwQSzmTI0+hZXrKFwLI7ictpTOnRaNnoYgKc4ZrayAriUDs2LAG/5jqV33MTaGd9+xEpYOBYYDfKDMKFPHed6dmJwA6OUYUrHGNk8sAlPFqq4FZ8TknryfJCs1h8fS64AwbZb1VaDRpHzm18YMi7Ke/Y6zMAnsJ5bbBfUqUPqvJqYbCxlJBLVqEuVkx2QdS/zum0JtyuD4G5Ztl+6hckUWXGtxEuHx00vV57T+58ckMIMGAeESw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d54f32-b92a-41a6-10dc-08df400aaf53
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:44:34.6329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZ/yRjY+6/skU5bfv5bP+oRb2DqTzxk4vOcMdtDg5MVE8t3XpKhUxnlF7Qgnrqz/FJegiT2GfiPqNXpdsqM5FI0yF1WHKEcBl0Qv+oYUE6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB998632
X-Proofpoint-GUID: rqXYpyjNxDUn8YY0ojdLNXKOOy-8hlBM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX1WGllBpEhiCa
 Bg6LwYzR2Eli9dByQiSfCiGqcMEUxZ/WaM8wWorKaqs17u6EuXf67os4hy1pARLU46dun9hiaPT
 3DVmA6Vl7rgvZLM14DvjCr1ptjm3MTLAkUyBFMr+hWI26sq+0D/is7SoBN20SH4HeO+ckIi9cG+
 So69OKLg4aKOVEdkVI11EPxG4gvepu5GaRgzqfoJvhY10/tMG6+GZqOc3XR86ngx+2Ia+i0t+Hw
 c1DsA2bNEuvir6FYnGkMyHqXLDYezFljstiRAsseiKpoca+Wh4LTsnYG/QO2iNwHJULECIYYT4G
 tbe6y+9d74DwG8d0ioCLLNdziJjISHdWTwjl7KWp/Ov6+dZR/CceLhdebsHF2m8nPt9kia4LCXK
 6yR545Wb/o/b1YWGI4SkgmusHdkyoyG2oUOBr8DpLEX0mtEB4kmpNLGw76pPqYvnFQj5LiKsFGc
 gTW8jq7jFmB8+AX5etA==
X-Authority-Analysis: v=2.4 cv=P7KvFSAu c=1 sm=1 tr=0 ts=6af48d83 cx=c_pps
 a=8KrPlQlxEYnZEdstGaGrzw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=DUI61nvga6466AwRdgIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: rqXYpyjNxDUn8YY0ojdLNXKOOy-8hlBM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX1OwqUr6T/nDw
 lvC3gsI7z/Ad9s+z+JIgTKu2pYKdPuKhPD2MzuSmBxx2ppGhijqw70VDpod+lcFWt5bAusIpuWO
 60ip+XQGezTyJWtif1+UTMvJijeen7IvEmJsIzuh4hp6EQSM2NjG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:23:52AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> move snd_soc_of_xlate_dai_name() to soc-component.c
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-component.h |  5 ++++-
>  include/sound/soc.h           |  3 ---
>  sound/soc/soc-component.c     | 33 +++++++++++++++++++++++++++++++++
>  sound/soc/soc-core.c          | 33 ---------------------------------
>  4 files changed, 37 insertions(+), 37 deletions(-)
