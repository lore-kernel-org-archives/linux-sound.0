Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794412100;
	b=yBiR3dRFjzMnyo1uJFiW46P503115Si6p4ZyVApwjJCPDcDR8BDJc/PeeYJGfQnbz1J/
	 hTUuGvMnWV+kvSHD78qHG39uibVAPvWZXxv/oJL0X9c11GOb/+pleUffkiyorT5T+lyG2
	 LAgu4XuhuFbCL1KMbnZPnCFcbC7ASZtE2qluLqBUTAOxpO+l36grD8QT7WhAe+9+ldf/l
	 YfESxXchsoBOHKzWeloVQ4skj0VHe73o3H+ibg17pv8CvD8bYxOnlMZ2sQVotYA9gSRpG
	 baZ9iYran6AV5xcGw/oa61cq5ZlISUpvR0KEmCaCKE0BwtaqWQDBsGLA4I2fuHzrljQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412100;
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fFqqAbTW/m7bnGVP+dAWZ1P0w35QqkPU5XvvTeL551o=;
	b=XBKFCRTXu6Mh5+ZO7a0DuZxlfQ/1nVkx42lYSP6e1O+cuxDvbldcGU6NRqBRLXGIOtri
	 Nv/zG10nzgQ6TDuP1pvWzurKksVhEooKO2ynXISgC5MUDczc7L4yrKvo4n8rO8TeXFKSe
	 asSJsffUlZ1qG7pg8i1gQiqpVX6owqFcbV3PqLXYA4YJT0nAFr03VZF+5ILDnl8WCww+b
	 BWvERCyxIpkmujtB0jzzOCVk9hPS6r8ow1G2nrMNWtgndI/M3msuHYjn+NF9c+9vyNKGb
	 yPAf5v6QU3ZlrjBz8ZyHjFjJoTPEdI69oSYPK57FKrFA5cO93deVqNMKYyHLt+IBPMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=o+tltdW2;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=aRKsk9H6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972B0606A32D
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 972B0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=o+tltdW2;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=aRKsk9H6
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF1aoF535149;
	Wed, 11 Nov 2026 10:48:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=fFqqAbTW/m7bnGVP+dAWZ1P0w35QqkPU5XvvTeL551o=; b=o+tltdW
	2wLhJwI/Fs2RBPUtGRT5EpeSO6SCkg8SSZnziyeNu6XWdJCMX9p1p3eXF1aPf/mY
	CghFXhj8qrgnnbucTXFfpUsSp8jMHFibYhH9oV9ac6XzvVnb67pPjSABOW0q5oXd
	Mndhe8rj6/d5dviGbsszKNDOD0H0q9WA7WZ9B0TcXW3yuHpsAi2cYD+ee2Hp8g3B
	esebPjC8L2UxykYuGX3l1ox0/5cI2fyEcEemKt12zZACnBHlt+KsqNlJEAr7EypH
	dO46J9ilmO/QVaFlbzV1/7gO0BZHfawpDsEEbjYIQj4IPt/CeBoZNOaA7Pu34T0Y
	e5UoQfPGVsZz+Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=fFqqA
	bTW/m7bnGVP+dAWZ1P0w35QqkPU5XvvTeL551o=; b=aRKsk9H6Qe3eKo5XvghTI
	j1jMLFhNY9KDv3YGR6XBUKkwSJhrXIkPS1dUeY0TVGNWyep6ZBOqRUmICekr6ejW
	EeHb/66mtVwUo9jANS+QZXCv2KPEfFUsrhv4s/YvMZtbLk1KUdCKmZe4zjR0HjFV
	YCI6S5b6nFtykyasdrDvQryDGGpBznjlwuLcdO9rtjdbft5DPhoC5uyizRubRwdU
	fUvtmI2nxUkbMWeNkW4GTYOrUOl+Mmtmt3Q8O7yBfe7HFoyqDmORj/qW1H2pROQy
	DZYB0W1Ic1AeQzz0ESsDH2ohlLRwsbS+koDAnDU7ko3LfdLeCtO6MHxcgRMVfauP
	w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvhw3b3dr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:48:14 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fg+5EZ8IT99Kl5AWBVnHTQFuSwbvVIMkd7IlVkU5enLYU6J5RlpmUpoOuqwwwu7FkTBEwZ/BUW/MwKI6O9qZgm8cW6ZNzDksSD1E2G6Nz+ptaXExzfMUpnNkDH3VhIui/fYaNLl4eGDbMkqvFFWOHuy+SaTQRjp9eRPAhgZMoVM1vsRKjxVtoGGTdPntWCWJq4ubwAXogwN8xeSFFjy+SEfTHFD7xLxLzdzsOnR70dCdU4u6mgjJ4oOef1WMftx/Oj+QvKsWzwkrxh1zhR3v78th4HlrSWpq6aHoPz1F5eXUEzLdFH+XG+tG1lPkuoMbkc6CTYMYBu0AixeRiFONXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFqqAbTW/m7bnGVP+dAWZ1P0w35QqkPU5XvvTeL551o=;
 b=pqQP+dvOkXnCJgdfosAz5nSc3Wybz8b2H5U1Amz0mRnOYdiF5AQwtN+olslYqSrEJGWKp1gguKFo7mhR//yzvi5U2Cl3uZa8HAkpTYvnT9EMsBwOhhWp4P5bC+qlQsOOYZ9TKLA9beifNCFuG75Jgv56hXnERFfAJ6wEggHXF1HNVLvt7vzXKilGhYWk3teifA5k2pIAwLtdH5YmkrsCAchvdgnqoUp2xm5cf6AW4lEaYTHXPDMxMX8zO++3lHNlI48CVqNumchSwoyqFK8sGQbm3NwMq3EDTkTaKnfjB7FwcJ1w7bszfl0esr8a8nZxs7V0XkG1ovYmz0fKKt6ItQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by LV3PR03MB7480.namprd03.prod.outlook.com (2603:10b6:408:19b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 15:48:12 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:48:12 +0000
Date: Wed, 11 Nov 2026 16:48:09 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 18/20] ASoC: soc-component: add
 snd_soc_component_connect_dai()
Message-ID: <avSOMluDxTU7JZBA@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <87ik25mf6b.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ik25mf6b.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPBP307CA0024.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:2::10) To BN9PR03MB5977.namprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|LV3PR03MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e636cc-33b2-4256-202f-08df400b30e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4143699003|261102123227099003|261028144727099003|56012099006|11063799006|261021121427099003|261022105027099003|261026140227099003|261009223027099003|261021123027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	8clV/8E4c2JUu2SRHkx+nKNmmFRpaLK94gu5r6XfRTycN756gHWG/Aec0bVRKe7m/8u3DAvocmBki15AUglz0JtMDoFMD/SDD1NlCUrrsDcLF0ep6AloN+KBCGfqO8kr3rZX+bILLFLfR8axIaHsGLNCXBmwZn5WQtmXw99f+vwHBpmLNmAhwMoxVhVn3f/y4WeTfXP2nRspOMhcFnWfpVCiuQIIifvfUf715b5ouMpYXoGB104hSi76O+2VOQjwsHsgt4zTSJjW3WsAAI0eJ559SoUkJj7OUDXIPRqwzV8qn7oj+joR6leBO24QGc6i9EN54UhnXsa7/iErYjTSEz4lvKCsbzOhT4WdiI4A0mzgpxwjI97mkobyUpdSI5DbSq19Ky9s+tX387/HpAPlKKSEKLgrPZFWgiFJFheE3t7D9VQ+pXMFSdjnNurvzHYZFrzUryWOFp5XIZ8BQvk/1t517VlkBETcvQ6sDOsflh5Y2G/bq0v38PcWXbimWgS5AJZmMm3i5aCIcqzORd/f7mVGbcjv90XfVnh0RAbMjjtoXfusyzAwjRelDkRVcXTEZ188/8Kwmw2aObYCcIwEj9PhSChAtnqXpcEdwyCg6OH/Lmhwl42or7QahLBWaALuROnPXD20DEXwhZxONmzzfkXJnVS8a+BR+5H9sFQBluU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(261102123227099003)(261028144727099003)(56012099006)(11063799006)(261021121427099003)(261022105027099003)(261026140227099003)(261009223027099003)(261021123027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHlRUUlKWGdsNWZ3REhsZ2x4eUYrdTNZOE9QMlhWM2lUVU9MNFcvUFZZOGpG?=
 =?utf-8?B?SDhOUjVCUmNlbnZmWVBDSmpHWmNaUzE2bU1jZnZkN3NoK1V4bngvNXBqWXRE?=
 =?utf-8?B?WUVvaWlya0x2QlJFTy8rWVFVNTU4WFJDY0J6TVZPVjYwUFVLdS9vLytHZnZW?=
 =?utf-8?B?clIvaXZBd0Jibks5YlAvZFFvTEYxSlNQK3NsODNNWEJQdGo5MHBVYkI2TXFp?=
 =?utf-8?B?bVlHTW5QWlMzQmFzaEFFOVFtSERSTndyeE11MFQ2akJraXUrYWdpd3VEWTc3?=
 =?utf-8?B?Q1EyUllIWWpYaVRBZmlZRFVKeGUwWUNLUDZRK2RqUElzNENKWWRFMzBOZmNM?=
 =?utf-8?B?YkxjdmI0U3JPekFoM2VXbHhKT1JhczlRMTlHeXl6a3A4NWsyaHYybWdhNnZI?=
 =?utf-8?B?cElYbGMweWY4R0NrVkY3QythR0VPSHJrU3FCNis5cDR4RmUvLzJFbi9Ba1JD?=
 =?utf-8?B?VzF4VFlTWk1MU24rTmRsbHl0czVPdWM4NS8rUUZIc25aYlRIUG1YUHBqSGVy?=
 =?utf-8?B?a0V3eW1ROHEwdmVKODUvOE9SL2YxMDhTd1FRdGFkeDF6YmhQU1RmeGdJNTRL?=
 =?utf-8?B?U2hROXNwQ0JrZ1pCeUpDNk52RlpFS3BEMVRUWXk2L21MUlhzd1UrREZtRXp1?=
 =?utf-8?B?dWtJc0kyYTYvNFZKU2MwTm5Vb2s3RVduZXFQWUYvNE51cngzNWYySkJ0TUdG?=
 =?utf-8?B?NXFBcTJPNHFIWXZFMFBPNGg5aTFzdU5UUUhuWjdUOUYrRkhreGVYZERzQmhy?=
 =?utf-8?B?cnNkaDNUS0hsZ2tKdERJYUVvdkZkZkVlWU9aMFJkWkZsejZZVGpjc3E3Vk8r?=
 =?utf-8?B?OGdKWmZlMG1LSTNjOUR5VytLYnd0SE1rR2ZuRnhTRk0vNW1VaFM0UEd1SWhU?=
 =?utf-8?B?NXZNT09oRFJPR2h0bWJiSHlCNGNsTStQcEFYNnNobXhRcU95c2lleWZMTUVr?=
 =?utf-8?B?SkNoVWlZK204eFpvRUQrSkFPUGptOGtBZ1NmaWg3YnNHallRZlRlQXNKd2V3?=
 =?utf-8?B?UmlvYlNvN1lwQUlWN09BSGhhUFVTUVRtT2hGUWN4UzVkbXpTRUp2OUY2dU9Z?=
 =?utf-8?B?Vml6RHlpMWhzL3hCa1BuQlN6djllakdPNW5Vd29rbTYwLzk2cXpsOWRReWMv?=
 =?utf-8?B?ZmZQZmlyRzY4dDFXc2lxYXptVzlBdFJSUXkvSnpoY1Jxd1lmWW5FWHhGT0NI?=
 =?utf-8?B?MXQwV250SmRpWVZFM3VKbUF5dHBaL3hrMFFQd2l1Z1ZPUS9HdDFqaUxzakpB?=
 =?utf-8?B?Y1NZa1Z3NHNlajl1ejNRM1VnVWZlYUZVYWtFY2VCVCtES1BTenB2R3JZNUdB?=
 =?utf-8?B?K1pKclBnV1ZiK0g0SmRaQ2R6dmVHSUpSZDhGZGFiblJ4ZERabE44WG82ZTNi?=
 =?utf-8?B?Q01wNlhSWmU5Z2ZqUU41d3AxMFNLK29ZUjVqeWxZOHQ4Y21HUnV3MjNESnE0?=
 =?utf-8?B?UzlYUUY1WnBvZ1pDVUxyZngveDQ4Y1IwUW45ay9oTDFVU2pvWHZrTVNGZUdo?=
 =?utf-8?B?VzRucUxFUjUrL0JPaEYvbVNlbGNNNHpQY2VQblRzYitxRXZTZ2VxZmVWWjIx?=
 =?utf-8?B?SU9hckQ2b1FuRTdaeXEvTDhORkppNndONUJHVEtzdXJlaytnS1ZIRXRsT2sy?=
 =?utf-8?B?R1lqU005M3JSRlM2ZDlCQ2JCZmsrTHdtU0oyaEQ4bXVCZWhzTk1ZOHBBbGc2?=
 =?utf-8?B?K01xc0tVUVhlUktDb2RSTW1RcG9TWGdwQWhWL3B5K0dKdlVkaWY1cW9hK0ZF?=
 =?utf-8?B?ejdzaCtLaWZtbHgwU2ltODdPZ2Z3aEpIc3hNUGZBRlhrMjFjOXVsd2kva29W?=
 =?utf-8?B?OGcybHE5cWR1YndNNzAyd0d0T3dyVkxjU3Q1UjlqblJJTUk0dE1UdUg0U005?=
 =?utf-8?B?SisyUm4vemdwR2hGeHhJQ1JoZ1VzZ3JRNnp5N1p0SGhmQitQdWVHYkE5bEhI?=
 =?utf-8?B?OUhKNHpjbVU1eWFqeU5oc2Z6cVd2dWNtUFBvMTBUR1BVeHE4Q2hwczBBQ05m?=
 =?utf-8?B?VjIwTTdVNjNCTmgreEt5NlpicUFFV1pkRVVYZ05QYS9uT21LTy9JRXNtQm82?=
 =?utf-8?B?WHdURllaNzdNYk9qY2dlMzZyVGFORi9FKzVubEVncHhabmZNRUxyUkJoSDJr?=
 =?utf-8?B?R3JWakExY0d3WWxSM3JEMnMyUTdMVHMvdUNaQ2cyNGFTT1VSakJ2V3VnYXcv?=
 =?utf-8?B?eDhQakE2cVRNT1FrQWxnckFBQTBrM3VWc3dDa1lWR25XSVo0TzhtZXYxTHhp?=
 =?utf-8?B?NjVCblFjVGV1aG5sc2JTa0M4dVNIRE5SZDk3bExxb216d3VEV2ZlTlVWTGsz?=
 =?utf-8?B?ZWZja2hDdkhna2dhNVEydGp5TGVFVU9lMUMrMVJqSENqdDF5U3FNQT09?=
X-Exchange-RoutingPolicyChecked:
	F0LOiVFicdhUMU6aIaH18q0Ttd3TBPzeuR0PO3I2MBFqSlXP5y0NN8aL5Fuxf/pVxych4TsOeOYw4BlWxkaXRpNxzYXT13Qr4Qo58fBlZmehTHBG9Ko7x1U03z6Ul6p7qpbSLm7B+Q6whLDoFVkYfGyUKu0NQXAgdAnvIoEFHsRNsH42SfWtswz3KnpXWjbeAaxeXu9PBLQTeEkaiGCswelQ82EtHEEBTN1VdGbKIyO8HtNaUhzrI4ktaitUwxs9nSu9mfsTI1h8ORVDXdrZzke9sjEdxqZvM9Cwq3WWKXC1nZZgrHhwKtVqV1FAd8slUEX5Jg2uamq3GcWJ/vnuOw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e636cc-33b2-4256-202f-08df400b30e7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:48:11.9944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aJSiBiHZrALIBwdqCrlXqqLjzC73FP5uBQDkUwHtdSfybyPtGh8Y0g5SbrkxG6xr/lLP876NhWNq6AvI1ZyRhlJqKULo9+vJpf2aEAK/w4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7480
X-Authority-Analysis: v=2.4 cv=VJhIDNPX c=1 sm=1 tr=0 ts=6af48e3e cx=c_pps
 a=lJB3plHzOIAfJWf+6KWQLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ugNRTJOwpmtT476g4l8T:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=wphIyU6RVVbXF1jqInwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: 4qqF2SeL85s9g-W88K9txVfv25KOYg0N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXwMpiKac60fcm
 zSASsf2cpsUSm+7nlWzrcOq9c6D1DZ2GWP1T5grtuI+c/TwDYzw/FhA4FlggcXLBGpGKfC6ArjY
 3MCHD9V/xFtU87GnX7MzhZzm/9A4nMau/HH+CD5cKddddysBYG5Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX4BLU+ZxaZNr1
 XgqG75qIG0FGG6CfvwC2vNAeL0aVFmXv7SkiTmfae205ONwZWI0B8d6EV5krlEXnbObxtgexAU5
 K4Pj9hlYDfS2GJ/9NGIzuNLpBnl9xhs/EXgMqPzMCQHbOm8gllDPn5VO0aedafXmNyjHQlcTRNs
 6gyjg0y9sloaolbrvJavQ70klJ3eFyXvVWgNhmauljiRo5r3KgXsVglLb/DMTm3wwsEij4+1lcQ
 6CTk7B0PhydFdHmd8I97vFeKCztskrxesRPiI09t/vnPA7xUNJgRemB3Gkm6shBpK8rDDufy5ui
 VKIYbSM9dupxvy08fq5TINM7wqopABkP4SOhPMdP+Bid3xzRCzqc/yxn3kUNLON7rI67CkDZ7ND
 Ogbv35+5G12EnDnMQLfk9lLlh7t9WMUJiqHpN7X4TmIjT2Tt7vJONwJvMskHjtyltcKswsbmb8Q
 4cLjmsraSsUJVZeav3Q==
X-Proofpoint-ORIG-GUID: 4qqF2SeL85s9g-W88K9txVfv25KOYg0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:25:00AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> This patch adds snd_soc_component_connect_dai() to connect DAI to
> Component.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  sound/soc/soc-component.c | 7 +++++++
>  sound/soc/soc-dai.c       | 3 +--
>  sound/soc/soc-internal.h  | 1 +
>  3 files changed, 9 insertions(+), 2 deletions(-)
