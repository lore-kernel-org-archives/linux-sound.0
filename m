Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206D7386C22
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 09:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242609; cv=fail; b=bhMRudED3kIqokW7vgKYg9syGn/e+r5aJD9gBrWL2+kRm9lYn3lnuT+nS30kq3h6hZEXvp+pNhIB/MrZEnuE89eWp/J414nIfDYKo/4BPDAZ0WGi50lbb1sOpf15P32I/7B+7QxP6jqOLX/Ncacks36wWiitypG5awjVuRTCVUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242609; c=relaxed/simple;
	bh=dV2TihrAyDnbjDaOY7qBmJaHZIPUtSln2t3zG3sxIwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t95EHyz/o47rjQ0INflvTXavojprcWev05w/E/F4Fif2AWVEBd3VYIRChh4SDi8qgeHQYB9bT0YxZe5Rn4emMXwrTldVSj6grdnJnymqjWJqixlW/3epj+ZXQZMtsHZGHqUKRRAZIz9uixraME17O1zvuGFU85PKcBBk46hS+uI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=e9yA9+vZ; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="e9yA9+vZ"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9DrNI154319;
	Thu, 24 Sep 2026 05:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=e7xcY
	4Jj+9+wNWpyQ4TENjHsgYmUHmWqp+AG7dwwW78=; b=e9yA9+vZTM2jXLR1aWd9D
	Z09CylvhW+cg5DEoepVS5/+4873DtDpikdIIAk/JH6yS/SW2L2bJrAzxy3e+aUut
	2Vk50vgOs8RryWb8WS1DmLp1PPynojHGYOOaa/GZPjTOeYWafWcnb40Z1PeKyZMI
	qZ0cetaQBm2uNKw07yuB6HQYI1A7ujg/L3c19qu86TLIsXZDPKnaAB2oY1xvqmtG
	QiXU3BsGDfL4UxHWffpmti5AndjgYMqjR90vc5IslzaoTVFtV74tyRuStOHoGGHC
	gbGrBG7EjC+pWCy0yGdjP8DNyEA02jj3L8WvrlMYJvwmzm6/BZYlDFhpC6p6IzsF
	Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012021.outbound.protection.outlook.com [40.93.195.21])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gv5cx8xf4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 05:36:43 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8nbdf0PJshdBjZNdxlHQ5fEFCBzoHSHIuWKJrKYi4dVJbmP1PEjy+aeWgL/789XELzzjHTK0h1pt+CIv+wVg5z6M5ZUc0eYBFivh7AFnvf7PJInz92Juk6pAdbChQP46Zw5Qn5XgdehK3g+6sQKLPbVUwx7X/4tIFlpVNwSmv+Lm883Od7uCDh4jCxOrny5+q8/MyLpPvMReXIep9KO+QWVv1sZxePZ59EEF0OjVL9UspNNA2pxEhbhJJWTc3GlD/zw7vLSxd6Xi8dkTG9dbOW+c+E9PnI1vZgZhk0HyZDmO1GgG5xQZjNmcxEftYDwL3SsnJuX9W99qY+sW040Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7xcY4Jj+9+wNWpyQ4TENjHsgYmUHmWqp+AG7dwwW78=;
 b=PrVthrA7zz1oOYDGyYHPrw+uhO6u9WLJA/1Audvz4ETU7CsxpX4aIgGEsaIIhURgPATy/D2wy3JzVSI+nb2v/dzLgoEJ7P9UhnWnDPnNlU94UWMqEkWUSS+MSCHR8iUlVn9jsGHtfmRnvuBq0neHqyIp8pTifZ8PhDJt4AjHipMZOpmBIlzdlpMKJ2cIYNWXvXL8sCOxp7fQubjZb6OiCmSc4dNiKopc58pUFaUJWj9a5Q6iBQzRDiJivnNQ1jcalMTmohPYLCGflEoz53960sqlhuMudpr0XDRwgenYCwrO/NErLwWt0taG0gdY3ILQdslTi1+joG8/HyUhFiYDVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by DS6PR03MB089049.namprd03.prod.outlook.com (2603:10b6:8:419::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 09:36:42 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 09:36:42 +0000
Date: Thu, 24 Sep 2026 11:36:39 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 8/9] ASoC: soc-dai: add snd_soc_dai_get_bclk[_ratio]()
Message-ID: <arTvISBY7VNYMvCS@analog.com>
References: <87pkybjq02.wl-kuninori.morimoto.gx@renesas.com>
 <87ecerjprk.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ecerjprk.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: AS4P190CA0041.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::15) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|DS6PR03MB089049:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ac13d7-f8d6-4db1-7455-08df1a1f5737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	g3VQ3NmpDqaExMgl3ReN/RCQQz3UyKGYR5a5J8FjzF6ad8i2/mRNjz0cUgZ5AQ9A4epez4mHfYZ7xwWJQrjP4Q3LjZAMgHBIOUPncaDrr+711iWHq0/I0rZv4lmeNP/FYcoenMWnUqczZTA71sCYn9PwjypBZRHq893DaekoaqjKXHC8qnNzg+dudXSkJfNPOo5pWFaHbUh8i1SxJvFpgJRy5Ra7snqnadkh080q5IMVoI+tTTEYIYB2pIbTTgt7rJgdDGfXjKRsz3SaIP/pEGaEiWbXwd0SOKzNSXzlfeMJb1SNhwuSRO71qYdbLA/IaCe5NIVN+wwf+dAJEud4joa7zjbfPGGeVw/RyNWAxWHvSVibnA0ok3nQma6Vf8KsChZbIciSG4x5aSwnAdzxHcDkweIRDv0JahgkjxSPJzVxXgzzgxxoxmaWZLpe7UFYGpnYmSSN1j3a9W7HiUvsCr1QCEvyqCWt/z9gaBUSfHa7aprREQGTsJMoFH6pkmAmsmG2sds6TU6Ob1SQaOOSWE+IbYvrCHAz7ZEZUSvEX6bReBgnjjicFEB84zOGg+Gye21RUlzCEFWE3rQKhDdnguQyGBbwX8tw2zJqUDJ/rLsqgRmN28n7BvgWLJWS7YoYiNBCgRXhcjqunDoht/dF2OwjDYs6tpS5DqHnBgn7+iU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZldlTjJGUGIvaG5WZ25BNlJ3eEg0UkVIVk1Wa0lLTzJ4MmZEc1c2M1o0NkZ6?=
 =?utf-8?B?QTBZa2ZwOU85Y2s3K2RZY2xFS2g0RUdzMUZmVFVHUGFqU3YrMy9IRTBHOU1n?=
 =?utf-8?B?dG9vYzQ2RGkydENpU1AzUHMwZEIxTTFxZkE2THJYVVlQK2VxNFRRc3I0MG5o?=
 =?utf-8?B?VTFUOHZEekFTMUIrNnNFRVVONnpDN3c0cEQxVUZBbVZ0VmNQZFBxaFJvTVV1?=
 =?utf-8?B?NnlFNjBHeWhHTG0wZDZYMXFUOStUbnBhY0hIV3BvRDhXODJ2My9VMGhJbERH?=
 =?utf-8?B?d1U3UzI1VGIrbU1KdTF4YnBEb0tNOHNHY3YrNHUyUzlsNlZ3M01ZRHVrd08w?=
 =?utf-8?B?U3A3Q21Jb0ZtQnhYQlBpUElWYnRwaTRrZncweUJhY1o4NXQ4SnFCTFBsWENP?=
 =?utf-8?B?T2RIMFVTeGRMWFhxTkF5c21qUmtKbExMN0lrNkFQSHhaYUVDNVRKalAxNVly?=
 =?utf-8?B?OVpHbEI1VEVjODVpZ2IvQnpOdVpLdG9EWHQ0WmJzMTJzUWcvTk9hQjF6eGVn?=
 =?utf-8?B?cU94cnhNMHlhOWNXVG5hLzFwNG1XSTRqY0RCVVVGbEV1RDI3akZjbmV0WG5O?=
 =?utf-8?B?cjc2aFZBN1BWQm1naGpUNnRqNWJOMElkdEs2TWxuc3F6OEh4c3IzQ095WUx6?=
 =?utf-8?B?WnM1SHYvTzh4cWhIQjhIUi9zUWprWmJRUzdiSzBlTTBHeC9LY3BXbGlmeHRh?=
 =?utf-8?B?cFZMUkhiR0pnZmhxVDFUc25FZ296dzlkUHFEZ3BoSkZ1Z0JHRENQWnlJMFNm?=
 =?utf-8?B?WkFxd0N3ejFnSEZXWTBtTVZHLyt2a0lJQlhOeUIycWEyZzU1ZUIrK3RwM3cr?=
 =?utf-8?B?bFgxQlBpOG1uRmFBUko2UUY5Y1RRVHRWR2hCeXc4R1N2ZUs1NGpkRHB0NXpn?=
 =?utf-8?B?aFV5aTd6OXJKOTVKU1F2TDNLSU5lNGszaXlkV3hRTFdiQWlaY2t5b1E5TDYz?=
 =?utf-8?B?R2t4TjdyMnZGVDJYd2VncWwyVFRpNndsb3E2YVByUjBVTklEdldyTitEd0hu?=
 =?utf-8?B?VEhGZTQwOEdwU2I2WlBMOGpHbE1wcUZtODdjTTE0R3h3eXhzRWxsb2xRbGlt?=
 =?utf-8?B?b1FSLy9GcHV5VUV1alB3WUNycGM0K3NwbFR4UjJ6cjJNdzhqSVhKVXJtWjhq?=
 =?utf-8?B?Sjk3UlBrNG9sS1VRTlJRS0pTYytOM1RQejB6RFJjVUd1UlNMd1pHR2lYM3hK?=
 =?utf-8?B?Qnk0aksrUjZ2UWd6RDJOdW1KcGVRYWQ0TnhKelZOZUxpejdyRVBqWkxyenEy?=
 =?utf-8?B?anBxZnJRS3lTL0hMUHlzZHR3QXQyM2NiU1Y0VnhoUGkzY29tRU5WejBvcmM4?=
 =?utf-8?B?clJ5Zmd5SDl3QTc3eTB1R0ljZjlFTGVaSGI5ZURNZk0wSGxHRGZIeElOdWtL?=
 =?utf-8?B?eGh3N2lQR1doeGZpSHR3Y0tHbndodmJTcHFvVzNTLzY2WWIvNDRoZFZyenB4?=
 =?utf-8?B?dExLeGdCQnozNG1oNmU5VDdwM2JINjhjNWtzeE54SUIvY1lJN1RLQnRtQ1Jk?=
 =?utf-8?B?V0gzNk1FWmczby8relcrYlBHMzNuZE5FS0xjNGd0czhwa2NjSmZzR2V6a202?=
 =?utf-8?B?YUpMMTlQaEVYTjJLME9ZNjU1YUlRSjNrdTZiMlVVeldDd3lLVkxVOThOMTk3?=
 =?utf-8?B?L3h0T29qQjUrNkZ2cHNQRFpKQnpFUjhwMStWV3A2RHgyR0VicmpVaUNrRmhr?=
 =?utf-8?B?TFUwZTFkTUo4dWFLSVFIckUrM0Nid2VLQmEwZTlqdEk2d3hEMDlwbFB5U0FQ?=
 =?utf-8?B?MnFFSGFBbW1ueGtQNHJaRmhJMmpTSXlYTm9yWWlaOFN5QXhOUFliSG9QZU5o?=
 =?utf-8?B?c2Z2RWhTSytXYUl4cURxdTdyZlFYSlhVaURUT2JwNjNHZjZtUnVUQ3JXbm1R?=
 =?utf-8?B?c2ZDSThoR1BMOEszOWd5Mk0wMjN6TjZFM0pYZjd0Mkd4MW9tWDFOVys4Ky9W?=
 =?utf-8?B?Z1FxclF6RHY1VHZVc3A3UnBtTG1aMXc5RnpNSDZvRitlaDNuclkzd3ZLaElB?=
 =?utf-8?B?R0h4UE8xN3Fkd0NiZEwxdWhER0ZyN0NtUENiVXpaOTNtamxYTThuRW56V2l3?=
 =?utf-8?B?dGw3UHVBNWhqaDJRWXNnMUZiT0FQaGlKOFhRY2E2MDhWTjV2ZDEwTkV1Rk5E?=
 =?utf-8?B?dzNJN2RtWWxuWjUzSElCUXk2bHo2NGFSYmpCcnliMmlBbUhsdEhDc3lOTkYv?=
 =?utf-8?B?Zyt3RkNkZUlqWi9CeXdWbXJYZVlVbmdiVUpCTFppaGMzMituRkg1TmZpVUNT?=
 =?utf-8?B?L2o5WCtpeVJCSFBST3RKb1NqQmVFZW1jT0xzQ1dsaHdlL2hOOWJjcW44Z0lM?=
 =?utf-8?B?d1lvRjRoN0VGUDRSQkF4eFNYNDdwUmJQQk9aU01FOFkyeXB3RHFBUT09?=
X-Exchange-RoutingPolicyChecked:
	LhiKJBevga2U2di1UT0g/abKNFEEseNzZpbSqf2YIix1ZPOs+lAYdOd/VqtZAmUmhw3xiEADNHaAP/xfmwM14ixhGf1isA4zQnxbrzFatavmyIIK9ByetDA5r3dcVuFmLLqzVhaQA9sUQr9NG3WY4vw2nhASSU61l4XLsXaGxVEk7ALTIjNzkaEr/Zkzfx3BBg/K46JMjxiIrfwxQGTtBglffqPNhAtz950Uw2ZmdfFClgUVJncaah+O/HQLRaUPODDWYrmZIVAEsRFUkjkEnC5BeNy5AIKTkutRarfTsAvCC3K3zgbFlGZ8dRnzqdxz2WfA5XeMOaiqHt9cumibTQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ac13d7-f8d6-4db1-7455-08df1a1f5737
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 09:36:42.0430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oP3qaF32G0IjJx0Ln3rN0snSJOk8dD6zEaoayRUmwxcJsvXgGG3WP87zP2vI4S+/LQOKHeFK3OnQ+d4U5TALjQR8WtusUfvBPSIZRSXtEmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR03MB089049
X-Proofpoint-ORIG-GUID: hImvSVVA0UdI1REg5vhhHlJv0xuI7JgV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzOSBTYWx0ZWRfXx4a8Akmc3Bv3
 9FJcO1+0Ty4DUe9u8FQSiWw4wHnlPky290zj0jGFrDZ71URSR767My9F094ZQ5sM0lt4P7lcxKw
 Lu0+P072yM2lTeE+3WwGUQ+z5NAN+za1+V4zFIn/FuCGbX7YXpzwYAR0BwXIWJUUZosM/2tMM6E
 uaiLucvGAhmTjb+/wN7ur/zvr1kQlCGs+PJ7uP1+vSOVGWaH5VipQz1Xh0NRX8IeL+UKFfdCfkC
 gFqYnMM8BWXIVvCkkKdJJLTmB9cOIsJmOr3YkkgbaGsoRsojudT+Tz5t94VhEXHjo7AdihrxekN
 Rp2nAUOUeOfALvAHFiXKEUa0fGfFasbe00VFhBneW5kd3As9Ows45gxnVTLBmNeMcZPXaeO3FXR
 XxnABsv5rp1j0EmhtHdI3qXLt6EHXOOhUdvSsd1OwmvxeNOR/1j2HBoLEHVnm4OsKkKklRjYhh5
 OHOr9Qaq8kB18WWyU8A==
X-Proofpoint-GUID: hImvSVVA0UdI1REg5vhhHlJv0xuI7JgV
X-Authority-Analysis: v=2.4 cv=I8rw19gg c=1 sm=1 tr=0 ts=6ab4ef2b cx=c_pps
 a=Okhg0g0iqq/spNumFXwzOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=j-XdB-5aet4ZIrn0tSIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzOSBTYWx0ZWRfX9+ko6kBeswVR
 aIU8UWNPFiIRtqW8vZDL6FgMb8c4bTVflPBEmXNc/GUFQa/B2ViQHzDji3THrxySKuzbDqLgsyC
 TtQ1zmqIV4wm2l7mvD7QHgwzDWQrluD0dhmHh0uTvo6kmg3XCuzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240039

On Fri, Sep 18, 2026 at 01:45:51AM +0000, Kuninori Morimoto wrote:
> DAI parameter will be capsuled soon, will be not enable to access from
> each drivers. Add snd_soc_dai_get_bclk[_ratio]() for internal use.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
