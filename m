Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793027162;
	b=yP7exKuJ0SCjJ8pDOfm6ZrDRV2vQRe08GlBbhfU9uKDAMWxq1V6hfNvSPUhZkbGgOflB
	 eJ4T1xYncbXW592dN5dCfWrJLP0zVt3dsmJ5gr9RD9u4V6DejmK2j8CQ0lxNTtbaC+1m3
	 ZwvqweSVWiYAwOnqS6CwLKMFILVNXwks8nmbnHlBOE3ddarGEZJzT/7yYUFscDxvYaBR2
	 /CrChroMs47FPNskBtozcp7TnxfboUdH0ZtIASO2o0yJYIFgojajTOiw9dSMbPa107Dq3
	 l3oM1GqfheIVTiJLtQJ1bl8iQwqGxUMK/ZHTkbeOeHWNbvdIHj/8l/OhS96233QsmdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027162;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=QLlVqixpewQ66fRwb1V1m+bfoGfRiOtC4mmP2Tq8Fi8=;
	b=cx4jf78K+jfwRlt0nQaqTlsUbrQ2YTW8e8Nc0wwBWLIPCE7aicX51xxcxpcBcW9zZgTV
	 7ia9OL59/EzLYHVNx2ojzoiReYaacd3+xWDNmLy615wyzrCsbSBS2Y8HdNyT87K7bmBag
	 fAoyHVdNSnsZFdcJRo2RkwHsLhWIvfdo6biD3oXPQYYzpD0c4mnovxTjY28VOA5Unp0OP
	 8jbkIGeMfFxnbqpK8pJQSk8gFAZRdL5sYfXRgD+6vwbMo2MWo8q4/ExifTZuqFxliX77c
	 koWTFOP29xGBygHpFNyJ5++5ZH4Z/uKve0xLLqQkHlrVzcvhnB6dLZY73OT3qwwi30Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=UfHBmZJ6;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=nQNKF8ks;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58103606A31B
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 15:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58103606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=UfHBmZJ6;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=nQNKF8ks
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QCvXb62470171;
	Mon, 26 Oct 2026 10:05:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=QLlVqixpewQ66fRwb1
	V1m+bfoGfRiOtC4mmP2Tq8Fi8=; b=UfHBmZJ6msVKARKkvdsZ6jF3XeTd2WoItA
	+m96a0ebeC12FwBI+J4Jb631/on4XIKZSjt8vUGD3x2+xyrE6DVGuH3/SE4UzSMi
	ebgZsjZTNRG9QS8EzNsoS5yPr9NgD8n4QAHQzRNcOvlnC0wqf8yD44tARU6/BlFW
	ql1kzmIt4jl2eLcf/ARjkq6TNZ83Q0ZcptONa5Lom7hTozAuGNW7ExVLLHwUHlYm
	wrSoNsF8rbO37G4Q+D6pMamTBtIYmY5S33kW96fzch0Ali061tSvVGpHEeJoqE+B
	b3q1QYtzmwoFquXwbxMkZekcvXzhb5SbNIYCpQ5n/4fIn6VYbybA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020086.outbound.protection.outlook.com [52.101.201.86])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hgs3jac3n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 10:05:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+FewUFQLbJ/rwM11eo+50fn26SRxZKkfjfdlAgPdl6YcmEF1HdLZp73Y/ChqEu+3spftOjILo5ahjIAhd0aypt85ALl+GyQUSGPMlKORI35q5pWRFfkV2uajIdsklO2Fbh4sJiTaVDb0hbzdue/wJvhC3rG716CEeC4aGD2602UPl2eKjfGZb/lZyzU1NMSjPuWbHxFqdAhcniOWaj34e9XDixLDdmoZ/bu2CGsw2UkdowZiDTTekgxBNIsH3Y3BS3j550CM5MGr/U9ZjlFAp+VPXh9Gtq6/cm0OrfWei5Xtql6wLTkJ7kOTImIOabneF0o/Hvjo+E/KJC4TB5LQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLlVqixpewQ66fRwb1V1m+bfoGfRiOtC4mmP2Tq8Fi8=;
 b=NKfwm5K09yW1T2fZvxSTAb0B/DthrJHHTMttl8G+qqhU092q8QxYGAP/3YU4Za2XQsC5dRYaq4JMN2+mn3wsPe9N8cKEj1BZneMU2mLUqxqxYaEf3pW7vECdRze1btXSWbKD/7hyfevfcnemWU03s37qoBLxbWS4Mu/Blq/FLYB6Sf1MeaJlc3RVyrRxEL96ldcoVSPdmZPcvQTqdU7pkLT6vswzaS/crW3876ZQswlM/2wBVEmAUI4ZMCoofRBUdXdiqUb1o1+6s9hcwV9uzZsEOEB8cxwlvpz+vQNV8EpaN1VslTwT6cK+bfKYk2fQLvpAoB01RRMe+zsIff1CWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLlVqixpewQ66fRwb1V1m+bfoGfRiOtC4mmP2Tq8Fi8=;
 b=nQNKF8ksiPWqc8K4GkduAgJ3PECVrcg1oIWNKJgNiBhc8WLWCpDFECQh+hnX9NIK6CudLdTLYcK2iFGZS3hQyK/fvZxhl6G10q9OShOAkHSW3XcEBp37aSL/pRzK/3P2utZBllsgzGOyzOTqDJfT/DgOpBuyrVRZ0nE5eG5dULY=
Received: from DS7P220CA0096.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25a::8) by
 CY8PR19MB7274.namprd19.prod.outlook.com (2603:10b6:930:9a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Mon, 26 Oct 2026 15:05:51 +0000
Received: from CH1PEPF0005BD61.namprd02.prod.outlook.com
 (2603:10b6:8:25a:cafe::96) by DS7P220CA0096.outlook.office365.com
 (2603:10b6:8:25a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 15:05:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0005BD61.mail.protection.outlook.com (10.167.244.250) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Mon, 26 Oct 2026 15:05:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D4519406540;
	Mon, 26 Oct 2026 15:05:49 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BC244822556;
	Mon, 26 Oct 2026 15:05:49 +0000 (UTC)
Date: Mon, 26 Oct 2026 15:05:48 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 1/2] ASoC: cs43130: Drop only the clock reference
 hw_params() took
Message-ID: <at9sTBZfy/mUmtAJ@opensource.cirrus.com>
References: <20261023202941.87999-1-olivier@mgcrea.io>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023202941.87999-1-olivier@mgcrea.io>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0005BD61:EE_|CY8PR19MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: dd75ff81-0793-468d-9277-08df33729fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|376014|36860700016|82310400026|261026140227099003|11063799006|56012099006|261021135927099003|261022105027099003|261021121427099003|10067099003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	A2wcAp/rHQLsUQn4N0jMU00emCwWBQ4pkrZ5D1G7sVVC3AUXkDdFVtk9vMzf2hi8HNdvSTdkPTgJ1pVTynWD/GJDLrni4gSOK5yv4uhK0q0r2TtfxcXmsGyFf9hhzP1AUtsuPNTNycca+ARQ4kbK9lGx5GvCdOij0zqJxB8NgZm4NVu3yn/KQBpYCbvCGKTxnpr+YYa8JlCuWE9/qQ/AlhcgdLn+Ksbs71CjecAhHm6lYcKY8AYHdERiqw3fbRuHg53+K/DzTiT3b+SiH7/H5vCOS16pthZ9FZYzkEP0WDIr9E14tf6pTA7CNXVp+d/0NaVlVmSDe1hJmNUJG2o4D1DsAbu18qv/Bfxgpk32PEoUVP/sXOZ3mTC9L6YWQhXw2mCTPweY6OUVxMTKLlj2Y0YE8JYH2Yva1wF65RmOEUd+QTVRZ19GtcMM+NtHshjpRYAs2owlJlvQyDDcdcHHAtCj3Lw3zLhesc0OXGqWg8YUcimR6PmKsWIt+uqX+1QRNjLqm6Blm4BZV7Xo5M1DcGCTvLW+BT3yBNw75q35kUwIBM1+ULcHm6FwrNILzaPOv7YWplir/ChEXjjJGpTr3rvHxpAmlk2Hx4psoT5X0cM5iQi/4zr8BauCS+wDU3bSghKgZw8cXEM98UhjOjH/Z4CJthbNMyL2Nxlb4+Y3Kt1foaxogikNJ7oPB1kHV5JvDoioqFf3fXN1GroX1r79tg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(376014)(36860700016)(82310400026)(261026140227099003)(11063799006)(56012099006)(261021135927099003)(261022105027099003)(261021121427099003)(10067099003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rvucibtMG9lVR2otBbvjD56Mqf9Ir1p0MuKb2Dkwmxm6tx6Nz6ThkZ0HfD2LJM69+pXpwis+ABPZsOdFp8xKw57SBRbvajLOkjubJDdnxdVfaiodWyB96JPc/2whgnmiQ326q+Hc0130U2+gj9xvuE595sQ1+rem0aVSa4ZXZ+3l+BhDkrTxkWEcG6qxyF7zaJ/PWfa3eScaUpdwJ1Fjq4NnPXR0+b46NgyeRuiuWA49fQsyChFT/cmuQlh2AUSEFUQHpW35k5forTCo5AE8KY4cdZsqFaNWwJcrNzt4ufsVms0ezyOhcCdNn/QPUMxArOAQ+Qm2nO8Et6UbxPxqn1mN1v8g4Itkw7kAZrZocVo0YaKhOj9EBW8Ux7CDRTKHC6fMmWqwSQcF1PwqnccbK6obfL5X0L7Gj3fitlIxCPZ/s7Jz3f6ZK82SaAzVFxyI
X-Exchange-RoutingPolicyChecked:
	ONN0pcZmbppDZqDmAyPFRdd9y/CC6E0DOZmAIy2/y+ixNredFsN7o4P6UezVKj0UVrU8dLrsbifr22SaP+XxG+KR6Htt01q9eS6VGQPYCQFqWD9pw9Z0XvUJZkgJy7s63E6AQE/NbWUh61y1nwxuvQmYPPhUkoxSIcYL96HIbUCDhAui1D1giNgCOjgebXK4BYzaDR/+q3QKQ5aE4lpszy/C/HN/ZhbmRXG4fk3YHrf3oBZgx4mqmegboJYGfkVTQytSB39QvYwFUiUi4EU6/qtUE41CLQI37L6WFLjUWig0373BfGlCIJjMS5pFCqadNvvM4YMOIJLsJ8CwcVsyhg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 15:05:50.7561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd75ff81-0793-468d-9277-08df33729fc7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0005BD61.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7274
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX6KUR0u8n2SV7
 Xd6DkCohsTP/4n4hXH9Mo66PsZMX8nF3bX7uzWOkGTBq+G7UUmw2gy+YqgL7WmK/tlq1tGPQfig
 hMA5JXWH0XOMtp4oZHja0QZDhBqITGA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfXykx2ZSnK23Ag
 AFPg/KfuDoCE7VSOQjTXgdz81qhrNxhazs0GWb6xs5l4v2Nhr3uqU90kSuAns5iYTuLdt3xZ8Eu
 e91+1hzRMNvt2NtzuLRYy2McjsUuXtSazvlQH76lqZUAWDnkJ1AhRrpHdXWiB8DXL1WrQC2LJms
 9X4ktdYsNmvcDeneswjCfV2L1zVVua09RvOKa3FNxHm2r4EivonnX+bD8b3VESkDEHBRBcMgQGZ
 dvblBtho1xJ2tYGTOylWJUUldEbMpy2+L/C/e/xplboaf1V0+6RwpIUTdOafI4OAUdjK2+G7KOv
 GCnKvsW1PUdqW1l07zyoHTM54hE/Hqg8sNPpRHsDu3MXBSH9d1q0l6g578nFAxJ5OjRZdwZiw17
 q0MBadZRYgWNuLYjFbnX3wXQ/eI9WDMetcgR+gf9FKjo7bzEkCC+rBuYn0ujN2vJrUrlsUBAHCy
 WCxAYkPkLbgTaF7l0nQ==
X-Authority-Analysis: v=2.4 cv=dbIVTnXe c=1 sm=1 tr=0 ts=6adf6c56 cx=c_pps
 a=BOmCsCMGzHmsfBvT2K/0Ag==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=F-3clyyJxV02DhaD85kA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 7peLZgx_IyTk8KcFzw0KrupileMJ9465
X-Proofpoint-ORIG-GUID: 7peLZgx_IyTk8KcFzw0KrupileMJ9465
X-Proofpoint-Spam-Reason: safe

On Fri, Oct 23, 2026 at 10:29:40PM +0200, Olivier Louvignes wrote:
> cs43130_hw_params() and cs43130_dsd_hw_params() take a reference on the
> internal clock (clk_req) and cs43130_hw_free() drops one, but hw_free()
> can run twice for one hw_params(). When a stream's hw_params() fails,
> soc_pcm_hw_params() rolls back the DAIs it had set up, the codec DAIs
> included since they come before the CPU DAIs, and snd_pcm_hw_params()
> then calls hw_free() once more, which reaches every DAI of the link
> whether its hw_params() ran or not. Each failed hw_params() so left
> clk_req one lower than it should be. An application that tries a format
> the CPU DAI refuses before one it accepts then gets clk_req back to 0
> after its successful hw_params(), so the next stream skips the switch
> from the RC oscillator to the external MCLK.
> 
> Seen on a HiBy R1 (CS43131 on an Ingenic X1600 I2S controller): after
> an S32_LE attempt the I2S controller refuses, then S24_LE, SYS_CLK_CTL_1
> reads 0x06 instead of 0x04 while playing and every signal plays with
> loud white noise mixed in.
> 
> Keep the DAIs holding a reference in a bitmap: a DAI takes one at most
> once in hw_params() and hw_free() drops it only if held. A second
> hw_params() without hw_free() no longer takes a second reference either.
> 
> Fixes: 8f1e5bf9b440 ("ASoC: cs43130: Add support for CS43130 codec")
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
