Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC223559D1;
	Tue, 27 Jan 2026 15:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528718; cv=fail; b=gm8HMaGL5QOl18ubBjMkbXJ0ihYsoP4+sc1g2+RIf07hUjH5yjsCoN36JCLWs7g9aq1ZTQO2EEB0tGSaBKcGXBIfONR5prdU5TqAzwqvIgGeJvFb19Y5kQZHxw5ppasbXh8HlKb61OSyI7ZE+DINAdKwowiU7fJu9z2VRWo5R4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528718; c=relaxed/simple;
	bh=hXI7qh+M5aDZRZS17k3y9tiOl/9FsPvxs8dMJopKbF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9cZfOMWiBey0+21PMgRpJVZhRiTmkdZEfmni6pL8s6V0/RuVY8MxSHFASshOWsMnVhIKiGIwY0YthzpkoTW6L/6IxocWrdigr34pcWmyfjPfd6JAUDNgNDMnCwJMF3QalzgXs68Vz5Hk55B1xAf73ij7PLgQ1Ns07H/OAupqaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XMZzIVhv; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=a4FKuKvI; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XMZzIVhv";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="a4FKuKvI"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R5mEkh1615650;
	Tue, 27 Jan 2026 09:44:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=yBPUqPTrNbMHk5a1mH8LTSmPzjNMIYLudvIjikFwLEE=; b=
	XMZzIVhv74B5dM1GeeyVSxjDj6W16flReN5TAyDqCvgof8DgSTq27rO5gUg9C940
	DvCoxOmTEV9O9lPTZfSLpo3pCKfF5/ICYTKogm8azpjbu/5X4j2wmRec4zVTpLFa
	kq24RwBYJi6ErUXWQycvryZA3w8gBoiiawjjm7rWZk3Zu4QBqUB6li33b4zA3A23
	jlWRODPshKxMwrjVewr1aqZdjgQsZMRZDtzhNfROkGHQZ/RLporwDbrzgDZ0/qRE
	0b3w0zqS4+RTiaIdcbmhcgdZ9FzG0lf+0jzgEt0Li7AgYaWd+Bw4ogXsJE+7nSpY
	fxBgXW8ZbkhUakkV4mnfWA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022122.outbound.protection.outlook.com [40.107.200.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bvuckb2fd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 09:44:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eccb9dFUdq+KyOxTiBUd+VF5CnvD4qYsseBbG1EiwpF66KE+DhJatn4iJFSu5v1y5QEJ+w/+KDrXbQtninsKYJ/BkNpB5ExQcwRC3dR+ciyoMTx5iD/gL1KpDu5xIJpr+BsSNKKBouYnNU/YihrbTVkjK55rYwHJVcwAQmIHxGKVOZdxscuk3+Kmpy8asZKtLrogpqCOWSH4vJHN7hfBWUeEYds92Mi36SvhpDTc8Ev2FTa28YOYfERVluYMuFcK22ef/Q69p3iak+FGXbDMZwFjt2+SH/n2XcnJSPx0i90MT3K2k5HfQ756n7shDOfc4jrWVJ2Q+GP4Yl2HNxb9Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBPUqPTrNbMHk5a1mH8LTSmPzjNMIYLudvIjikFwLEE=;
 b=rNa1LP+mldwKUtwWmNSqe8OLQ6KqjFrXIYH2YsmOXtP8aXxIa1E0BOLjqKlTYT1LSHPKnttiBigviP+DsomC9YINje7pmagMB9mE6gVdtIYuWojuNtlhUtUCY47vY8PEAAtRyD+smsG7ro+etabyCDelvOln6UJTduLlmSNAJlSBShC0T3t6BfXoJ4Srqk01MNRfsJ8KE65sSe/z3EOIr9TLydXKqwiz/HuBliHAOKZw50X/IViDdNb+55lxP+82e4J96lClhmDcbQrfBnle9d7DsZeT7GGBXGnoU3IAwjIHYhFVzGcy2zSwoadbbuQ9TSfNIWafS01erXMnb+Vbgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBPUqPTrNbMHk5a1mH8LTSmPzjNMIYLudvIjikFwLEE=;
 b=a4FKuKvIDnbDTj3Y6n7SzxjbSv1OuWn4/pzvndK1VUs9e4rwC3IJv2yetgvjLUjDrdPFXS2ONEruHIzSoZF27JCjoNL2nadRIqrtLGFt4w8vS2QyMbNB/gerOjZjvuyuzacDdi8VhKYG/Pryi4N5pP+AR3B1G/VBu+kPwbD9FdI=
Received: from DM6PR21CA0020.namprd21.prod.outlook.com (2603:10b6:5:174::30)
 by PH8PR19MB6951.namprd19.prod.outlook.com (2603:10b6:510:22c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 15:44:41 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:174:cafe::76) by DM6PR21CA0020.outlook.office365.com
 (2603:10b6:5:174::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.1 via Frontend Transport; Tue,
 27 Jan 2026 15:44:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Tue, 27 Jan 2026 15:44:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4B40D406542;
	Tue, 27 Jan 2026 15:44:39 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 237AB820249;
	Tue, 27 Jan 2026 15:44:39 +0000 (UTC)
Date: Tue, 27 Jan 2026 15:44:38 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
        broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        kuninori.morimoto.gx@renesas.com, sebastian.krzyszkowiak@puri.sm,
        brgl@kernel.org, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: wm8962: add .set_tdm_slot callback function
Message-ID: <aXjdZphfjCH78k1N@opensource.cirrus.com>
References: <20260127103326.1920525-1-shengjiu.wang@nxp.com>
 <aXibZNhIZI01tJyZ@opensource.cirrus.com>
 <CAA+D8APEa2+iGkONgEOWpRe-w1Ni-CmBpC90qPRYQj6mV72-YQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8APEa2+iGkONgEOWpRe-w1Ni-CmBpC90qPRYQj6mV72-YQ@mail.gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|PH8PR19MB6951:EE_
X-MS-Office365-Filtering-Correlation-Id: 7680be33-6e48-426f-308f-08de5dbafbf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVl0RXE2Nmp3UkV4bGJmREhUSEVHMUowTkZUY2NiVnplMEZjMVFtS1BpMVd0?=
 =?utf-8?B?aVlUblBJYnJxMGFKcmZyYjhsNEwxWTlTOXZnUWlKdTh6UFA1d0NPYzNNa0Ry?=
 =?utf-8?B?WVYyL20yRFZXcE1tSjVKc3hDeGxOT0tNam5MaWhlRVM5TTlsY3JLbFR2MllS?=
 =?utf-8?B?U2JKendHa3F4WE9BMjdvVVpTbTBrR1VlSjdka0VUWUF6SDZSVVhFOS9JSVUx?=
 =?utf-8?B?WmtxeXNVMm1DZ2wvN2RFOW9MYTNoaDVISnBPV3NUTjFwQ2pwS21NUGZYWmo2?=
 =?utf-8?B?TFRKbThtbnl1OXYyeTg2NnRjem1NY3FYb1F5QWVuWWIxeE5wczJwbGR4Tmkv?=
 =?utf-8?B?UUIvZUF5dUQyM25UY3laZkdONlRDNGlqL2NkV1FyczI4VGFZdUUwV29pRXJk?=
 =?utf-8?B?aVRCSGN6ckJKR2JUMlJzUEMrMzhtaENjMVg3N3IvNU5iY0pQVks5QXVPUTF3?=
 =?utf-8?B?MVFPQWx3eWwvMitLbW1YeUpaTVhCOTZTaXJLWXZRTHgweGxDWjVqZ0NRRDdE?=
 =?utf-8?B?SzhiVzZoSUsxWW43MmtGMWRvU0pHajZlbTM3Z1BIdkx0MVZCRlZPZnNiVlB1?=
 =?utf-8?B?d1EvTHJBajRCRlFiMFIwYXNyMFpsN0gvMmh6Qk0ybUxJblFMdS9yQlB4d3h6?=
 =?utf-8?B?aFFmeUhqTVB5NHp5OVExVW1PV1hYVk5JaUhOM2l6Y3dZYmp4VDZtVnk2c3Jx?=
 =?utf-8?B?R1BvS0sxVXphL2lRT2txU1hkejBRcFBuKzlRbjF1bGIyQlpsNDFpYXpMbWRP?=
 =?utf-8?B?d3piZTBQaFhWVmRPSnhaRnFFYUYzWHE4TnRXVU5CMU5aTWt4T21aeWxJMmVu?=
 =?utf-8?B?QUdzWXJONmFhcmtiQnp1d0lEOTVHRWZmR2FTRE9ReFIxNEtSZ1Y1clFteXhL?=
 =?utf-8?B?T3dRd21ybSsxSkdBQlJxYWpXdi9YUWg4TTBOc1F6d1JkLzZDNGo0djQ0Z3VB?=
 =?utf-8?B?dmVTK2RMODd1Q0VYSzZvZm1nSEUxZkhwcFhUOGM4dkZNMEMwbnYrcDRwUmpC?=
 =?utf-8?B?bXJGRjZ4Und5TUdORUVOZ0I0TEdIZGFlcStldUExYTZWOWlxZnRxSjB4aHNi?=
 =?utf-8?B?L0xXclZiK2VBMVJwTjQvRk5OdmpqOVEydkpQVjRiSDNCcS8vcm1uMldqK3lk?=
 =?utf-8?B?eityTVFteWNMQ3BtaXR5ZFg5NXp6a1JZdXBPaGlCeTR2SGIyUm5ReUxwZXBo?=
 =?utf-8?B?MHFsQVZQVkJ1THo1Zkp5Y0lOeVJZbld6djR5Z1pVdzZJNlJLc3h5YU1JMEUx?=
 =?utf-8?B?Q3hFT1BEamVIVTJ4Q0dEUU5PVDRnV1Q3ckdqd05tWlNyRENlVGQzWTgxSkM1?=
 =?utf-8?B?L1RNK0V5ZHlVcjJKcnNMNm1CL0hacFhVSU9hSk9EWnRZY3RwWDNRb2NCTGNn?=
 =?utf-8?B?OExaWmdET1JLZERlMERZRTNmS1lPNHVOb1pUTVdyQ0tMeDliNGVIU1dYZXRO?=
 =?utf-8?B?QlU3TjJiaHNPcTlEL3hMMTg3dFV2VUlkQWJxci9SMzAwR3hzQTZJVXJpai85?=
 =?utf-8?B?d21yR0I1MVJaUU4yK0xsWkFhejhDZ0IyaERqSHFtMmNxYXh6MFBUazdKNnhk?=
 =?utf-8?B?enRVQlVDQldFY2c3SFc4a2RxY3NVb2p6YzhZOWZvQ29rMDNoNVdQYjkrZmY2?=
 =?utf-8?B?aUd5T3N2a00rampMSHU5R1dGR05xcDVYS3VCc1orNzVCT2t1WGtacEthc20v?=
 =?utf-8?B?MXVnMnIxL2ZrQWFQTE5ranYzckRiMnFKaGVEdURrMHFNZ1VTTFUybUFDS3lq?=
 =?utf-8?B?MFRBZWFMMWtPU2VpZnJHdnBsU0JPemMvdHlEQWtseUo1cUMvN2hITTdML3Ji?=
 =?utf-8?B?OXVmb1ZUVC90RXlxYTdTeHBwQ2JjYncrYjFKSTV6L0FIQlFTMHM2WFpNakRq?=
 =?utf-8?B?L2lYdmhmbk5IMFJYV215VUJtd2toVmJkd05pWmZqLzZ5TFcrTE40ZmE5MzhP?=
 =?utf-8?B?YXdXNHltMlc0d3ZVT3ptMVhoSDdIbndyTEhId1Q1NzBYajdCelEvSGVYcCtl?=
 =?utf-8?B?bjJLQ0k3V0dCWDBsdldkTFZKbkp5UDhRQVhvS002UGo5T2kxVGh3dkdIZGRy?=
 =?utf-8?B?OTlaQytPWTBFVEROREg5UmpSVUgwT2FwQ0w2U0g2eWUzWjNpc05OQXBzemZw?=
 =?utf-8?B?TFlBMnFkeHhmRGJmU3dOeEcyM1JjN1dWdHZUc2JPVE1tWlhQZlR3djNBUGNq?=
 =?utf-8?B?SXQ5dGp1MmllQXBiS1gvK3Q3TWpOU3RuOGUyMTkxcmU0YmFsamgyZVM1VVNW?=
 =?utf-8?B?a2FmSXhVSUxqSzN4REtXcW1FeENBPT0=?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:44:40.3384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7680be33-6e48-426f-308f-08de5dbafbf8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6951
X-Proofpoint-ORIG-GUID: funKohkZ7kmFMzloWT0TUGpJhWIduN3T
X-Proofpoint-GUID: funKohkZ7kmFMzloWT0TUGpJhWIduN3T
X-Authority-Analysis: v=2.4 cv=Vb/6/Vp9 c=1 sm=1 tr=0 ts=6978dd6d cx=c_pps
 a=jsJx5cRpnMcsqjM19+T+dw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=8AirrxEcAAAA:8
 a=aIGANzMNRQbdGhCSwDwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyOCBTYWx0ZWRfX5T9OARcommX8
 zwn23MA0P79Zat/de7wIvHl75zORTLD0/6XXKqSm0aBlR9JPVj+GbtWX2jhvXNVBqhaEnzwDVwj
 +N9YX6mEpU7ErD3ZN0wyPNCjKwdhax/LduooeOuTfcrpzkNz7pGe2dgriCToXro/5QvI93uvmO5
 aQesQyRfqI8fFSz9g1PdQrq+aSjvvxPLycis50XTgYTcNQLSNNDMZzvn1b9+7S4SKs9lA5drCg1
 T/ZvPEtcb6hl2XHIzHEXzfI5jOMn0CrZGIr+0nWLcQazhc1OpfK4N/MnVjkWDiaZLmyFRI8JTuB
 4mIdVwVIlhS56p7E7DcfJYyJcbw7yihL/1tHz+fUlYNiRWhRIQCJdqW3+Bvw80Qs10KSOY0efg8
 FyOqzy7g33M1wh2ZZSW8PezSINXzJ1G1wATHFChDbwcrh78pFWr07mf0HeTME9wLMDfIlnmJ9t1
 KDBVwf/FMUh15XA/Jhw==
X-Proofpoint-Spam-Reason: safe

On Tue, Jan 27, 2026 at 09:01:02PM +0800, Shengjiu Wang wrote:
> On Tue, Jan 27, 2026 at 7:03 PM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> >
> > On Tue, Jan 27, 2026 at 06:33:26PM +0800, Shengjiu Wang wrote:
> > > The slot_width can be different with the params_width(), for example,
> > > DSP_A mode, slot_width = 32, but data format is S16_LE, if the word
> > > length is configured to be 16, there is no sound on the right speaker.
> > >
> > > So add .set_tdm_slot() callback function to configure the slot_width and
> > > update the word length according to slot_width in hw_params().
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > > +static int wm8962_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
> > > +                            unsigned int rx_mask, int slots, int slot_width)
> > > +{
> > > +     struct snd_soc_component *component = dai->component;
> > > +     struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
> > > +
> > > +     if (slots <= 0 || slot_width <= 0)
> > > +             return 0;
> >
> > You probably shouldn't bail out here, how does one disable TDM if
> > it is no longer required?
> 
> Should we add some checks for the slots and slot_width here?
> or just remove these two lines?
> 

I think its ok to just remove these, if you call set_tdm_slot
with weird numbers that is probably a bug in the calling code,
but not super picky either way.

Thanks,
Charles
