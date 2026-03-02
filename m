Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com [148.163.133.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B722D350D4F
	for <linux-sound@vger.kernel.org>; Mon,  2 Mar 2026 11:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.133.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772451564; cv=fail; b=Pyy53/lc1EeAKnQldGBr7ORIS6oU5LZwmkd7M20Q8yaGAydYh6KuSZqpsqb30/r4hqxhObEenLOa30GuM9p/dzM/I1CUObBTeAXsiGBEIK5QLlJAmLcfIUikPag7UszWbCui56rzWIfBGi6wrL72gvMiM8tLVcKiW7EUTOaBByY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772451564; c=relaxed/simple;
	bh=ymX5fZmW3Xs3zS06/jKjaz6AG/963XC3P/xf+Gmaj9o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=anyG2tN2Zo2zkJfFVNJYaoc9jrLk7TEJN/zTPHcV5rgAV/iF1WoLaKgffRwq7KB3XOLjIwmytv530Re0y0mQx4M1MMaMETHSZd1IE9wcf+Ig2PblTBerkGg2RFBzis9XmOzxMGxrjA4WaNMBjmHdcPqxgw8LJbLpPMIcbh8BR1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=Dell.com; spf=pass smtp.mailfrom=dell.com; dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b=nwMqyTKq; arc=fail smtp.client-ip=148.163.133.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=Dell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="nwMqyTKq"
Received: from pps.filterd (m0170391.ppops.net [127.0.0.1])
	by mx0a-00154904.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621JtgrH188390;
	Mon, 2 Mar 2026 05:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=smtpout1; bh=V
	oxgYgeAkvz0crktyVmH14CK/LtKBVywqtP0p1Tt1HQ=; b=nwMqyTKqsnNG7ZvML
	9LgepR3fzuE+MngdVSSd+Gz6jUf6oAfwX5M0OO5CC9daju/nwggHTbSHuRy0kRCC
	5xzTng59MHLVW4yeDw2XfDVrDFLTlf2hLuxl9Jb2Gmj/2Ys1HmN70L6EIj46goSs
	9eV5D+O+Z9QoP0QCVXhCT7+xUugI2TdcUC5TwJaW6bEAJE3LhKGlnnfp36wqCutf
	Urpi24v3TPdhiR/bTf5rAaUAN+qJZcfF0an4Om6tcdJToz4tnCkK9w2YiiSpoZaf
	tw8KL4H3quantFthHq9MYMcsmWDTtzPUFAJ4zvOI/0K8P9WqRQMzLkzqy13amrlX
	osMjQ==
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
	by mx0a-00154904.pphosted.com (PPS) with ESMTPS id 4ckvcsnqa9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Mar 2026 05:10:37 -0500 (EST)
Received: from pps.filterd (m0142699.ppops.net [127.0.0.1])
	by mx0a-00154901.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228K0U9766310;
	Mon, 2 Mar 2026 05:10:37 -0500
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010026.outbound.protection.outlook.com [52.101.61.26])
	by mx0a-00154901.pphosted.com (PPS) with ESMTPS id 4cn6a09s7y-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 02 Mar 2026 05:10:36 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1IrYFqiIZbRKnerXDvsqUsqd9JrkXZ1BCJIazf7YGo2Q7Eox0kf0bKjhroguP3EQanzwL0grmvx2LRc2lKFD0aDBabD+HEGixhSc7c3+lWcSxOvRr5NcJwJ1eKlPgc4x3Rd9V4uSLwBVSG8haExDA0evHqG5OQ0QP5sbUYhZh6i4wTGHoBNjzZW/6NV6XuWyhTt2rEOZekFHQ0OxRqxe4etIRw0/HRuTRp1Vmb52bKnHbBKwsEJCdqK58ZhmVGrpIKbIZSHz3bZJt1duSxkA74TDTFjBOvfyLKG7YE5N9vq6s3wwgAQ4YvOpuh7jIECuQIroPE6fPIm1GHMUQdtEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoxgYgeAkvz0crktyVmH14CK/LtKBVywqtP0p1Tt1HQ=;
 b=vpn6CmeNpeP7lQy065oSTWdGYu5B3W1yPIvXd6O3YVhgOmQWdsurTh4A+YRssXM8FHoBzFpq0HoaFxp5hzCVpXpnr1hF3ZUWN9yJk9s7C3ZcECpKghgEv3Xh4Ahjl2vl0IuJcvEXlugI7XfUp4UtXQB4lL1qJAJtyyE5i8HHZfbinCRN21zk+2bcarI/coVPUyM8A1vzXKTZt+GZZaX+deQ993si2cdMEmvZSUB5uEEBQsLJSzEUA4VT15FM41sQWjzzLf7ieN4PyF21/Dcl6HbIPru7ppK345VdApOv5U1LuSwfr1NZDsTSc7rY1lFqpaz45Ch2qaEW837KRYkYFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from CO1PR19MB5206.namprd19.prod.outlook.com (2603:10b6:303:f2::21)
 by IA1PR19MB6225.namprd19.prod.outlook.com (2603:10b6:208:3eb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 10:10:32 +0000
Received: from CO1PR19MB5206.namprd19.prod.outlook.com
 ([fe80::1814:bf75:7f13:8880]) by CO1PR19MB5206.namprd19.prod.outlook.com
 ([fe80::1814:bf75:7f13:8880%4]) with mapi id 15.20.9654.014; Mon, 2 Mar 2026
 10:10:32 +0000
From: "Harsora, Deep" <Deep.Harsora@Dell.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
        "broonie@kernel.org"
	<broonie@kernel.org>,
        "tiwai@suse.de" <tiwai@suse.de>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>,
        "Liao,
 Bard" <bard.liao@intel.com>,
        "peter.ujfalusi@linux.intel.com"
	<peter.ujfalusi@linux.intel.com>
Subject: RE: [PATCH 0/3] ASoC: partial match the sdca codec name
Thread-Topic: [PATCH 0/3] ASoC: partial match the sdca codec name
Thread-Index: AQHcpl2vDJahSY0wIUmkuYl7QfFmWbWbAHPQ
Date: Mon, 2 Mar 2026 10:10:32 +0000
Message-ID:
 <CO1PR19MB5206A429EA2817BCF7975999FA7EA@CO1PR19MB5206.namprd19.prod.outlook.com>
References: <20260225135004.2322987-1-yung-chuan.liao@linux.intel.com>
In-Reply-To: <20260225135004.2322987-1-yung-chuan.liao@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Enabled=True;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SetDate=2026-03-02T09:26:04.0000000Z;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Name=No
 Protection (Label Only) - Internal
 Use;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ContentBits=3;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR19MB5206:EE_|IA1PR19MB6225:EE_
x-ms-office365-filtering-correlation-id: 5c8869dc-6bea-4553-549f-08de7843f073
x-ld-processed: 945c199a-83a2-4e80-9f8c-5a91be5752dd,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|786006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 aLoj/MgGpQfQ4S302Xx9UfhMKb2i906Gv/G/IYg0WODH5q+giIDcH2AjHLa8CzjO7dOajAe+uxmYev0Ch6RTV/p4l5p3XZOSD3Z5uK6hWkFnfAto3ubWr/O+BUzDbLiHj7Rj+LQaM/U2Ck3PbSY43PFi3anRfsynHXe8QRUsu8TKQe9TtwI6HFo6Po10irOce/gZJcLhacU5bnzL4/A9tUtm6KE8AJQxWsaJR1kvulgfhrG4MlWRzvkUcfoeIqQJg8Tj+2Q1WB8CfA21sfZUzPke5ISt3dBE7x2uRDqW0oSgCkxRiYxHNlfVkTnSgr85DWC48tECtoLf0cK5gnYCNNxJuEEOTR0K4CMQSEYlgD9KfHWQi331wIvsQxBI6Jy6AQHYq9T5vA25A3YUEwuatbCKjhnIylWEu18Gym4ow2PXah8soNrslx2AK5JeUEnY4xevIbth9vgDRUeOsNOZzN6tARWMTbC+p/S/YMzAwZpqbs4RFZE0zI4BTecH+aiq+Mh84Xckqn+0wxiFimbEZmYrr8ZJhY9+ia84B6o0UUUqkyHUbIPypFHdZChDEU8O2oLNaM1yS73ikzE05nggdEBgzab73n3+GDkBTOUFTpNtvE2gihN1gyhUxpBWe1gm2NueLxc0KWZuiKJdEdl9bzvX8z2YHf+8tJCHLGd54/OmIRD6pEJDKqrlA2p2nC7luv6swy98Va5GL+Xe3U6eR1PIo2P5m45BauJe5DAA4znJ7uR2Sl90HKVdeR/8d4mwBhHywfzQOyLLq/36CAwoLW086jPBqLLjHMLKkej4gQE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR19MB5206.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(786006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-7?B?ZmczbXl3TnA0Q0ZMeWQ1SlN0QndHeDN6andpRkxjTnF1TFJDR3Q5dUV5Mzk4?=
 =?utf-7?B?WmVZQistd2t6aTRaMlFHM3pMcTFNWFVJSHg3OUk0aVVMOU9WdnN3Z2Q3Y25P?=
 =?utf-7?B?LzVsYUVqem9nejhmdVEwS1R6TEFIMmZvRmx6aU5zektkMzlmWTE1MnRJMlVw?=
 =?utf-7?B?aFduM0JFakZYb2RnL3pXUk1lYystRkVFeUZvaUZIak9NeExUQkUrLUlYU1p6?=
 =?utf-7?B?OXNLU2VKMW5PdUZaY1h0Y2txTXhQSTg4OVBvdXJuSmlRR0gyZ081Tk1Cek54?=
 =?utf-7?B?eXUwZlVOcFN6SnM4VnJvMjFPNnZhNHBiZG1yTGF5NElLN3F0aDAwVFR1dlpz?=
 =?utf-7?B?dGRWREZvSG1zRzRnY3BZOUJYSzh2Yk1RVEF1c1ZkNW5oakhSdk5XTzViampY?=
 =?utf-7?B?cTd5U2ZDOFlJNzh0TG1qcTNYZnVYelRHTEg4Sk5VU3QyNmNlMnBxbFFVVlVm?=
 =?utf-7?B?V0JXT04rLWIrLW53bmQxL3N0N0p2eistdHRkeXhpMUwvSmZmV2ZZbkNxdzhT?=
 =?utf-7?B?c1NEdGJXRTFiU09EbXMvY3ZmTlJRMUxnN0EwM2xQRTMvZDFsVWJxd1hsNU1N?=
 =?utf-7?B?T2piQUZudU8xYUZqajd0WEZFZ29rRGRpYW93OUorLXExUkJ6RnBES0E1RHFR?=
 =?utf-7?B?QXI3bjRQZ0lLRzBubS9FMVN4V3Jkek4wNG9LNFlyZzNPU3g2QjRKOWszNzAz?=
 =?utf-7?B?RjlMSE55N3NGdFJ3QkYrLXhNc0V3UDU3RU8wWVQwVTVBYkVOeDFvRkxvWVk=?=
 =?utf-7?B?Ky1WR09JYUhiUkJScVY3SDN1dTdBUVhtWTNYV0NMcTlrT0pQUmpiWk9CWFc5?=
 =?utf-7?B?VkU1M0dyNGZrWUlLSUEwcWxxd3RraWpveHRvdXh2aFRncUdsdVVQY0dLWkhH?=
 =?utf-7?B?aVZqM21VMklheVQ5cGkzTnFaTFlsMnEzS3pEd042M2djRy9mSldnRU5hZnJk?=
 =?utf-7?B?OFcvQmwzdEMxTFQ0NCsta3pnZ0xBVExPemI5ZUZYSlJCQkVKTENiUldsbzFx?=
 =?utf-7?B?MFh5MDErLTVzQXJlRTJmeW1wempaR2tEN3MrLW50QkNWRGRsbGJLcDdOdDVC?=
 =?utf-7?B?TzN6ZmY4YVhHb3VQeHI5VjhzbnhEeFloeEVkT3MyNS9xUnFCcnR5UW1IQW80?=
 =?utf-7?B?aG1tQmg1RCstSHdiME1jak90T01aTUdoRmRtQ2w0MHlhV2xtdWZRaU1rZ2Rn?=
 =?utf-7?B?RXg5dWRuMUYyQnpuTldieFpPS2JiT2xQSnlPaWlFeWdoTXRvMmxGRzhubGpj?=
 =?utf-7?B?UzBUSGtoOGlDZGNNZ0J5Z05jU3BCNkFxMXFYV29pT29hWDROc21kcjJsNzdk?=
 =?utf-7?B?ajRkVnNjdGpFL2sxTXc0a3VabS80UzREbFRwWnVqTElKUnRYSmkyVjVVRmFT?=
 =?utf-7?B?QUZlSisteGpMbmFQSEpPeUVzWVU0MSstck15dE1ZazFKNmJVZG9WalljY29Z?=
 =?utf-7?B?ZnN6QnpYeC9mb2tvbXVjUFlYQjFDdXZzVDBEa3dYdystcXpnVkRhRUppNnZi?=
 =?utf-7?B?ZTNCckRSTzUzU2dsZFFqTGFXKy1YbzhHTWJsVEhJbjNkbTZqTkFCRXU5ZVpW?=
 =?utf-7?B?VjA1emhDVFRsY202eistdDQzVXZoanArLTdaS3BZQTBpU3FGLzMzMFVZcHQ0?=
 =?utf-7?B?V200UlVxQUR6QlY3UW1wVWhmWlF0T3lQWVBYejJ2RTc0bENtay9nVm9obXFM?=
 =?utf-7?B?S3hDc0RpdEJiSFBRTkhwOVpDNXpGN0Q2SThHc3RTM0hLVUVrZS9YT3hlbm8y?=
 =?utf-7?B?cU90MTRjU054YnRRTThtd0pmT2FSQ0N6VmErLWdBeU51Ky1idThkQ25ZbnlU?=
 =?utf-7?B?eFRHQ1JlOWZYUHU0OXRUcWQvR01VcFVDNDdqdXFwOTNNdkVQa3lXN2w3Q2hO?=
 =?utf-7?B?L05OZmY2b2hwTW9kL2czcGtmc1FPY3g0VEZ3TjlNMWc2d0xtVlEyL1RMRjdy?=
 =?utf-7?B?VEF5V1V2YktKKy1ZU0lhb0lRc1V5amJXOXEvczFLMCstTystcjJCZFFXMHkw?=
 =?utf-7?B?VWlPZU9vbzhQYkl2NmszOFBTeW8vVTZ1bEdQTkVvNHorLWUzZHV2SDdZMmRh?=
 =?utf-7?B?RVpwbG9zaisteU1TZTd1dkFwYkRMUEJyZEtsU0t5RGloTzRNUGRzNXpNNHR5?=
 =?utf-7?B?SEhsZ05uWnZMMnU3eDJWenZZVkRhNWxHUUNqYmNGUmtqZXhCa1VQSjE0R0Nk?=
 =?utf-7?B?VWt0SEpWYUxNdFZIbkVWR2VtL3U3bVd0OG9oL3paeTRweUI0dVhJRTh5Wnh6?=
 =?utf-7?B?eUttUDMrLTM4S245VFF4YkJGVFlFdUcxMHh4WlZ0dEVvRGVKUG5pcjBkYkI3?=
 =?utf-7?B?NUp2ekl0ak9yNWNZa1NiWVQ4WUdrTHdMUFVCUHNPSnIvRFlqeHZRUERVVEpG?=
 =?utf-7?B?Q0FuTENpQUd0Q0ZnUnpzeU5pTWltQUErQUQwQVBRLQ==?=
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR19MB5206.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8869dc-6bea-4553-549f-08de7843f073
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 10:10:32.4791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VSUV+xR//UlwbnJWwTYaAHyTm64CovXQSkl3nN4PHnCCqt6QyfUG+6l6/wVfTEBESMjBzIdWhaa+mtO7IxwYLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6225
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020084
X-Proofpoint-ORIG-GUID: OOBz21AuA9YGN6Fi3CZEWZh7c3A6Owlx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NSBTYWx0ZWRfX5LhNth9C4EMy
 D32O6sGcqQSVkFF2tN3Wcxoh7rg5AQ4SAMum6wNtfUvlqZ805tiydZuIAl+lYOeITWL/mvxkPXw
 Bh4Zm8atyw7Vdy8DTnHIKZSyPkgrUs8ndjNay1irv34AvWmtvrqr6kLfW28X4Yq+34SPXYUExpW
 iI8/Vqb+mhoFaS5bLkbm6gmONRPlc1G7eu5teUvPc/esze6KQ4VA3I3tX9vOf3MVRrg0zmlbMx0
 OE0SlV70R1cQi8rOrReMoZyMjV02BVKMshuKddE1E9ck2qE0bLT/4/YvX3EYWcrebX9mMElwl+b
 KBrPpGnAQz7eYkkyetS1OPJ8xyZy2EJHSrK8dh7D5sj0rCq63VoLXXOqAnkaP8uwBQ2Qw58jixI
 fkReP+aVu0yT55iigoGkF5/xN1bzN1NqFK6bQW3kYherRmZBac2SoTnm/xHzRs38DOobZXLaf3i
 MtRVRY+bk5u8wVlqjZA==
X-Authority-Analysis: v=2.4 cv=cLPtc1eN c=1 sm=1 tr=0 ts=69a5621d cx=c_pps
 a=j0++y401J6f/BxNAf5EDow==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wzW8d0FwaosA:10
 a=YU3QZWNX-B8A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6gNNCFAoQcIphELLPWWu:22 a=aNt9FJNJ8fZyd9HhltU_:22 a=iLNU1ar6AAAA:8
 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=LfxEVeEBAAAA:8 a=c1PdSmG1AAAA:8
 a=XFJw1KJJAAAA:8 a=jcgz4KDuzwt1QW4R3AcA:9 a=avxi3fN6y70A:10
 a=gbU3OgOOxF9bX48Letew:22 a=7k9nRlTqVbDGZ3p5_T00:22 a=4iM0TfZbaBQr0p37pvCp:22
 a=DKZDSSD9H29Cdu8kcpdD:22
X-Proofpoint-GUID: OOBz21AuA9YGN6Fi3CZEWZh7c3A6Owlx
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020085

Hello Mark,

Backported this patch series on 6.17 kernel, which works fine.

Tested-by: Harsora, Deep +ADw-Deep.Harsora+AEA-Dell.com+AD4-

Thanks
Deep Harsora


Internal Use - Confidential
-----Original Message-----
From: Bard Liao +ADw-yung-chuan.liao+AEA-linux.intel.com+AD4-
Sent: 25 February 2026 07:20 PM
To: broonie+AEA-kernel.org+ADs- tiwai+AEA-suse.de
Cc: linux-sound+AEA-vger.kernel.org+ADs- pierre-louis.bossart+AEA-linux.dev=
+ADs- Liao, Bard +ADw-bard.liao+AEA-intel.com+AD4AOw- peter.ujfalusi+AEA-li=
nux.intel.com+ADs- Harsora, Deep +ADw-Deep.Harsora+AEA-Dell.com+AD4-
Subject: +AFs-PATCH 0/3+AF0- ASoC: partial match the sdca codec name


+AFs-EXTERNAL EMAIL+AF0-

Currently, we set a predefined codec component name in a DAI link. But the =
codec name may contain an index which is not fixed. This series suggest usi=
ng partial match the codec name to fix the issue.

Bard Liao (3):
  ASoC: add snd+AF8-soc+AF8-lookup+AF8-component+AF8-by+AF8-name helper
  ASoC: soc+AF8-sdw+AF8-utils: partial match the codec name
  ASoC: soc+AF8-sdw+AF8-utils: remove index from sdca codec name

 include/sound/soc.h                 +AHw-  1 +-
 sound/soc/sdw+AF8-utils/soc+AF8-sdw+AF8-utils.c +AHw- 32 +-+-+-+-+-+-+-+-+=
-+-+-+-+-+-+-+-+-+-+-+-+-+-+-------
 sound/soc/soc-core.c                +AHw- 13 +-+-+-+-+-+-+-+-+-+-+-+-
 3 files changed, 40 insertions(+-), 6 deletions(-)

--
2.43.0

