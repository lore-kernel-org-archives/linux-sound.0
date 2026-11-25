Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795613216;
	b=qM53sHqtEcPjkUNCyLVAf17uZluFDZ4ejNJV/46ja+64GpAgZUE9RUA6q6YHVjkB4WI6
	 P/PgSy1AjPvJzVPgdNlWhBxXDkPqCnFCl9UqfYg8AxqFIL6BDP27jLuQ8m9H+xfOMZuiM
	 39xUAF88MSKxSzDCs1V8DOVkICeHG+QzYDt4/SH5SVhWJbm64nm+KPqBoGMO14Ldk8VuL
	 2vMQKmGPZbfQ410dg98xo91r9pVjuSBOkwqBbR0I/E4cPLTGiR70zohk7fWWMZzyYPN4L
	 k2LNNQXocCmF5JW9opJ8OuA91LJwJUCKVdhDOB591+JfOGFaEKV+PUk4f3Cp39sVLfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613216;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=xULlUtYUX5Vk5RFTcJyi3oJPdG0nwachhQLhOpGvz8U=;
	b=jjg9AfKXpHRZdOXSpvPRsBfQKTAab2dJ+fz1+L6ZDeyu9BMmNwzART2tgxGVsqYDo+0v
	 BAqUOHhVrdxHxb39igsPlbCXsMmknNYDEra1CNDqwoKcmlEHWCsJhk71NpnWHTYX+iiLY
	 G9Xr5OXHZPwdy7g7iXrEffdEyPLuoMT2v4x3GnWbSqegVIhnP9QlWI2bwsjGhy40ZRwD5
	 y3Uxvblg4ggM7StnQ5kDwMePoolyO1i7vmpU3CjzhGTSPI6NyqkoNsNm35SYNfo6CfYXH
	 BFWOGfwTAZeTm4E9GS7a6cxo+arAH9HbP/2ZomX/A4r0KId5h9xWfzoHC8NzVfyV6+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=RqUtMN4Y;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="d/4p3YUM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2619606A31E;
	Wed, 25 Nov 2026 13:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2619606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=RqUtMN4Y;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=d/4p3YUM
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APDFIWx1901771;
	Wed, 25 Nov 2026 07:26:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=xULlUtYUX5Vk5RFTcJyi3oJPdG0nwachhQLhOpGvz8U=; b=
	RqUtMN4YuEhkL16UfMdvQLRPILO39p7wpN6eBpaProm6LaTE/2S20yN6g41lJ0L9
	YL9TMKVP5hP2RfFFlePWepujAb9Nj62hxfW1T2XI7Os+6lFTY2n4be4oYdL417vd
	3fdYUootkrANFwbApk10IuiwKnHKL6KZyY/q3ZdVsvFITNEVqQq7e4FSI5YDrXH6
	zog7gHLe/RjqV6eRxPI+U7Hf7o/CQhUqU1s1dyliNoyFoXp44R49CQlFEwm4UUvk
	XxjsNukQe1aKqzRWaE1aTB6bB8b3OCAsA2MHVlURRY123mfY+KgupecRZX/PcXE9
	hPWEjt3NA/2Rkk/XVNdx/A==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020134.outbound.protection.outlook.com [52.101.61.134])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j51882k30-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 07:26:43 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fkY7zmP23CIheUtcq81VC/FxmbZ5pqEpu7drs4SIJVik2VDBSKPUSJMhkRu77W/qp0IYdxu7TL5jpJAXJquRh6je5mOazF4f4oqVes3wLS/ApqDullg7NEbwsJ95hdSmqPdBxmdqc3ZKtatYYDKWbNZ6bITVtB7A3cMXp8V7VPSAAL9OlIuRB05kVMJK5wzyOCuKxQ31zGbKEmuPOsk/Jhleuz8A+WAuyG/c2042tQ9xpPmcUbk7KbijxypDOLw+M0Z2ayDUObJ5WLawpJpfxJgJ+Z4N2aDQsyIktluqojGWY83wqC9L6pNkMo7cHYpRML/vlZyOivGhuGRqhgIK8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xULlUtYUX5Vk5RFTcJyi3oJPdG0nwachhQLhOpGvz8U=;
 b=ZiDDzmYAxQTUKmkmsZdiGRE8SXrcVrDDWHZ8wfXvAgrHQ6jGX+LJPsXJKN6rSutOlUy1LZHGoUxRbPCmcN4WZLFvH18s5y/CRwKQg6E6W3gNAv0V3TqWgQ8o83P0MteJHoq0ZZ+SxfIQT59Yec9OyQHBo3/guNaP/TFROWBWwmM6mSgaot3pi6dA9rxOEmwdWE9mQvqe6xPqnLLvN7EG6AH5nLYfsIUhnpf76UCJfJIdoMqCjlZb8pUb5qMklm8uW5vKjfhYUtH6Wo2xfCe4iPkj4Xgu2GKom1pyiI3mEwwgg0kf0HaER8iJ4dlOrXVn90wHpLxYcJtv9khW7aq+Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xULlUtYUX5Vk5RFTcJyi3oJPdG0nwachhQLhOpGvz8U=;
 b=d/4p3YUMUWodX4v4mA/XCy5yWiQTwoAJIk2ZABXbomK8PNVSdh+wb3ccoYHY2qLdN0SOGtEA5zbrvigJCBlyCc0UNP2mZzlFfrn5lMEuLP9Kh9uMCPqXlxvl7V2RpwnlwYcDAeMIip4OaIeyxihqhyfgt8G++P4Mdw1f8Znb/Vs=
Received: from PH7P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::21)
 by DS0PR19MB6527.namprd19.prod.outlook.com (2603:10b6:8:c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 13:26:39 +0000
Received: from PH1PEPF00062F28.namprd02.prod.outlook.com
 (2603:10b6:510:326:cafe::1) by PH7P220CA0029.outlook.office365.com
 (2603:10b6:510:326::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Wed, 25
 Nov 2026 13:26:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 PH1PEPF00062F28.mail.protection.outlook.com (10.167.243.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Wed, 25 Nov 2026 13:26:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E2D73406550;
	Wed, 25 Nov 2026 13:26:36 +0000 (UTC)
Received: from [198.90.208.12] (ediswws06.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D2B32822540;
	Wed, 25 Nov 2026 13:26:36 +0000 (UTC)
Message-ID: <2e698fb5-6041-4ffb-99d6-d95644749f41@opensource.cirrus.com>
Date: Wed, 25 Nov 2026 13:26:36 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 4/4] ASoC: cs35l56: Add test that probe() doesn't
 write SDW mux registers
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20261125110853.741337-1-rf@opensource.cirrus.com>
 <20261125110853.741337-5-rf@opensource.cirrus.com>
 <61660f09-9402-479e-92fe-6b1b2bc48158@opensource.cirrus.com>
 <44ae0233-b475-42f0-a1e8-2c3299a4df50@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <44ae0233-b475-42f0-a1e8-2c3299a4df50@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F28:EE_|DS0PR19MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: 469ad52b-34c9-4a8a-2d92-08df4af7bc80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|23010399003|82310400026|10067099003|56012099006|11063799006|261022075727099003|261026121527099003|16102099003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	fr4Voqf3WcUd0tqfJ6EbEIAmQWG2wAKicbg0m1TAQvTniSYADiBj340vAahbedyHoryqlhEDUsyFiCSdI+xwKQI8ykWRM8p/8A6En/QUt/8sjrDscRXNF1QCaD9AZfCW3L6QihcoCdJb3zrXKxHKY2+xDJlwObY+gxXMoG1a0HOJcJD4eqZyZ7JYtBcjmpvkVu3QjBX4D2NCocfaU6lwhGBzaXygPs4SuKhXsrtzgEne5dHoBY0EYep+pkO3Fq8YrGRWZnZ0iBcefAhgNNE8t0us4BpB0xyPsZS7JaI2dN9iieZa2xDVU/pzSMwN1YpWGKpVfPbXfDmQIAV8cm+MapO0AmnqahIX4LIYZYWjuOLEhiuxpFcnHXPO9b9ykuVlvuRf2FmzUjwFlUvvFLTBtjYPdWfCyJSCj24R7mgkMmhUSrgGHgaJkL6naipU1gmJciMTxnvnusmDFF35UsWLhUlKgu05/gXxSfcnMyA3X/ZNVSrIyV40H8z8t0zQzwfbbdZgaAg5X1MV+lqEC5gBezi0tDIojXcexHRznPurcM1tRrNj2Albz/r03SE4bFv2W2D1j2YecUvMptNp80Evza9w0fZVQ7iWdNrSTwjwlmSKWwRCCogKQh30a3i3oMjtZ9I9v0v2lmV8Iyezej8Rmha7M4HX7RZBQawiL566z4YVvOCsgvbUVGlqPUXwSmg1KtDjgdp7JVswb0Gg8aynbw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(261022075727099003)(261026121527099003)(16102099003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c8ZxREjitMAoqSUPrc7Ka4+uCKdu9YA8Qbbim5MExJnhkGzomoKgaIAjeVZyMVouZIAny3WjcJFvUH/7c+D2dG4cgDN+xK/tLVjtIsIJdOk94R8IFLcSRlBjyacCqbN6wgd9rYcd+GFAm99UVD//3Uo3LjsO1G2EkVt86O68TPlOHhtk4I57hOvoId0lSMEZmqJgyvB0lQxigAvwxDe9yAkxUeDa6JvWh1axpfYzX6j1DJsBrcyOkrROxjijP4FLIVUJFCm9maEN3qDkhTOl5quS5cs3zVaeUScuUMKW3XX3oKpHlqvCo3RcmTFj2koJ/Yi1aDHwNW/wkwN+Q4PvCzOCMgsRdW4kPM6gyNrcSc1wtoYKhUO2SYN/TAN9eIeMK2PHeUtyvNNm51mR6O7mmOE74L7EQ1MKib32tR11Ml4Tg28kd7zk0dE4SiI9536g
X-Exchange-RoutingPolicyChecked:
	Qt0RpiGnfZ8t26RoxQt/UMx0AfD+ji+smppZmm19A+IvrrIn4A0PaTs41QQDqwJDmWiwebkiptj0AiX/xHFt/WBzXvk09yfHQvTgAq33oVdab4yrAO+K/Tkh7UaP0YHj0cO+/D4UwjSzcZA7MWrLG3zlUtscVeOboOVernKNlL+jGxSIdTSLdTnieDFzbpAo8OY3ddAXiUkKuyyfvCJfXlLn9bntE9b+bRecUmIy90aughyfLRgqX4plknwSONC6ee0jSjVRFOpM3bZlM1u7Deook8GGNscTZS9i8PJj7UDJdRF1NM/Ph6xCoz9JMtVlgzEreBUELSH6KZh1VNy16Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 13:26:38.6627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 469ad52b-34c9-4a8a-2d92-08df4af7bc80
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-PH1PEPF00062F28.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB6527
X-Proofpoint-ORIG-GUID: SLJRi7zqVea85ZYh8v1d-RfrJbyqbz_z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX6JuEHOtTbpjt
 dBPnPkuZV+BjE1A2wBaGv2/9iTj0iSRDapPRQuX3H4osgmUBN5b3ZpUi4xHemGG5DkQfS29FMr0
 M8PViq0fB4cFbCSbUnLfW+he1dLz86wghDTU6NeOg80q0/3LE8HUWOEpeuPPohM70oC4IeGxJ6f
 GJW9qGd+bDfE87kYkO46ZirOvlbPBCRj9YhmVEVUM4W35oSBCDVxvl9fjZ7M/PyJwDulEyNB5id
 UCIyDKbP5ORnM/7GOLMuJLWfHdfIhrhTH2yq+RrOv5QVQfmDwxV12u2lwqkaOL3URmC5qoVq8u0
 TvDxlqjjT+395B/LpYr2GwEZoz2SZxwlDYJ063/N3e070iRRAk4KLoZXSkUe6UsDiGhZycN3/gt
 DcGltLJrg6lOL/hYDItrP4MxAzqVmOryg4GAJvcpY2Z49QUOooFJTa6mNRK574pmhimD4CJYyQq
 RY6VoEEo0XDJIvTYc0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX9bEdU9e3CvcN
 X4WgUU8xlm6s22pKTSqaryYx22YpVw6nON+vqUrxZQYBnX/MgIzek5Rnn4GlPMTdiA7ymJg36S1
 ChnRtSN9ty7ifFombd0mnTQ/1pXfJrQ=
X-Proofpoint-GUID: SLJRi7zqVea85ZYh8v1d-RfrJbyqbz_z
X-Authority-Analysis: v=2.4 cv=BuEIUoX5 c=1 sm=1 tr=0 ts=6b06e213 cx=c_pps
 a=TszpKlPPvK6rXl4+XYbYdQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=Q5VH1a7_qaBjK8gzJ5QA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 25/11/2026 12:39 pm, Mark Brown wrote:
> On Wed, Nov 25, 2026 at 11:24:53AM +0000, Richard Fitzgerald wrote:
>> On 25/11/2026 11:08 am, Richard Fitzgerald wrote:
>>> The driver cannot assume that it owns control of the
>>> CS35L56_SWIRE_DP3_CH?_INPUT registers so it must not do anything
>>> during probe() or component_probe() that could result in a write
>>> to these registers. Add a test case for this.
> 
>> Sashiko found a bug in this test. Will send a V2 series.
> 
> Send something incremental, this was already applied even before your
> resend.
I don't see them in your for-7.4/for-7.5/for-next branches.
Are you thinking of the previous series that did something similar
for the ASP registers?
