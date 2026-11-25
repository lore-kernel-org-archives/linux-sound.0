Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795605915;
	b=J5tGO17Cm9dRwtH2D/YGGbETQ2magqt5/eBhbCv2LgsyLQCNPMhf6zAT5ObnDJQ5pjKr
	 NGjU9GCoDXnJilo303B6nwdwU4rtj8HIrEGoaNDZlYxRSxzyTLUp5W8VPZIWEWnBUKFz1
	 kD/XSpGM1V23oncsEs8eDudJDTmfy3/9t/M5dvWt++2Nz6xlPs81+LwwV5P30O28zl/eY
	 s/iUTUeomv+1W/zOPGmxEWAIXUjDB15xLU+J9TXDMq+l11nin36Ns1OUJtnJsd7sdg3ag
	 Ea6M03iqGTIc4TWWqxH4RZRVWC3AAbakiRUX3QcsLLi+5+jwYnf6ag7jO1KERBoc0Hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=MCb1eAONw9sEykdVPkXDzSxCGia3TR04iEc+RzBf+0w=;
	b=rXDAeu1PrrdxDp2x50zCGFfNOpvv3QVWnBL5JcXU12VVV/N+qumcyM3A6GQ9mLe+/Hs/
	 DWRYGxYFpa3zQP6uaj4P6VZlaGMqJPfbANoNLSBcT+a0ow0JOgm7E/IhZaNdXuKEjTVv6
	 4HISgyD2bKHaSwJ799SRJ/sQXi2lcATQFHX2GNH4OTAaJNRC8mIMauIKFx2x0hP5/HdzD
	 0iK3oezWNM66wwvwhPIKp9rc5eVUz3GFtyjS/utMEWiqExFXpHtzKSrgK7BdKKUXOdmB0
	 6aZA4OkULkeCdBxHaEVQxI/AB19IoWr+otj6svOpljD1VINatdvVktQ4JMZbf9/U+fQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=OyqEjgV6;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=UEtUd69D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20972606A31E;
	Wed, 25 Nov 2026 11:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20972606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=OyqEjgV6;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=UEtUd69D
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APB3nwo034946;
	Wed, 25 Nov 2026 05:25:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=MCb1eAONw9sEykdVPkXDzSxCGia3TR04iEc+RzBf+0w=; b=
	OyqEjgV6LiY5yUJf1Dr7qyrFq4wh1gQQhysJjxfqd3AzNMBuyvAI9CiOjOzR9HLt
	/6obqp8l/EBa6MEovq/bQc18eLdv6FptuEK4GMKgHtFDvYLSJy+ZXmvQqINPDBDH
	Y2AWNVA7DNbwm6Ip3J6kIb+lEF7p6XRO12Im2x+WHXo9Q84nrjoleepI94izeTZp
	hAIiNjzTT+eKqwFKDHi0uu2eooYiIRGlXhB9QiJcQyzO9BThxuSn4wtNWEZySQC5
	pb4uyM1QpxXEex0Zt+Ojx9RESurIJOkuGGRF5C6DyhWLWbzajShfnw5IeqCTkbmi
	QkHDUp2tYOOFi6wcCPdBWg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022105.outbound.protection.outlook.com [40.107.200.105])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jahv7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 05:25:00 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pb+QmxHinod+sFQXRvkJCkekSeLrw4PiVE6haQLsU3J7MLYRCoStJwQbay+byThyCOsF7CBXP7nkbUB0XT6awSgat5ChYe+VbsJPWrOTm6DvXn36mAP5z8ojWI0XkMtUGaS5a0FnGM+VN68N3SF3axvnBKurCd9xE9HwTh/8NNMeFD22ltnUT/NABNu4AjN/I1r9PhHKHux64+qAmgzccTvxgCqOTkxFEEqidgWnPo4sJORSu/bMPI7LJfOppVlcAr2u9B3Lgqii346O45EyH4Wn8GRVgrKeBLz1cmsJ8arRXHERU6UFekDt8064YSJDebQieZ8zJbtlDYwxElkTNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCb1eAONw9sEykdVPkXDzSxCGia3TR04iEc+RzBf+0w=;
 b=iriqxH2k+n/S7uljSkcg9lpIFU+fyJi4zPI1Qt+cHyPZRQvs9fMo4mx7QMmrHh21Lk/Gdl5PImwfxckgUmYb1MArAbFo7NxYNzeSrb4HCxc59TKZ0x/h+K/TKRW2ay/R7hJW3Z7UXBEq8/iBwg9YVTuPnp+muLhK/hzxUhFugu3fMOxr5FX936HVE30zN5vasLDbqOcoMzY4GVnJAb4nxvORrugAs3+37ei8Lqcr1YcimBzEV1bnPivSHNrl2MNPKBOsLUwHkR4vpLofTRiVZV7N45qspPDJExMxKyVue1fgp3nbjlBTZpu7JkkynKDBqKPtaTXr+TQz2aSSG3l6dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCb1eAONw9sEykdVPkXDzSxCGia3TR04iEc+RzBf+0w=;
 b=UEtUd69DQmZxAk0r23ybT9mlGWfij92YJmMm8ptqvL4nbkxtC/1un8EoAiOTWtYzjnlZTCIQdlKexHd7Nzp4Mhk4wZCAUTogvoxagY7jYAfqWdfdUtp6KJGKwyQ9X+cIenZLoW6enSQwXBZr/jyK6TPnUSyyJkqmeQj2/B8Uyks=
Received: from CH2PR10CA0025.namprd10.prod.outlook.com (2603:10b6:610:4c::35)
 by PH7PR19MB8236.namprd19.prod.outlook.com (2603:10b6:510:2e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 11:24:55 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::36) by CH2PR10CA0025.outlook.office365.com
 (2603:10b6:610:4c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 25
 Nov 2026 11:24:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Wed, 25 Nov 2026 11:24:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6DF39406550;
	Wed, 25 Nov 2026 11:24:53 +0000 (UTC)
Received: from [198.90.208.12] (ediswws06.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5DEDD82024C;
	Wed, 25 Nov 2026 11:24:53 +0000 (UTC)
Message-ID: <61660f09-9402-479e-92fe-6b1b2bc48158@opensource.cirrus.com>
Date: Wed, 25 Nov 2026 11:24:53 +0000
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
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20261125110853.741337-1-rf@opensource.cirrus.com>
 <20261125110853.741337-5-rf@opensource.cirrus.com>
Content-Language: en-GB
In-Reply-To: <20261125110853.741337-5-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|PH7PR19MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: f4bc891b-8152-46e1-bbcb-08df4ae6babe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|61400799027|376014|82310400026|10067099003|261026121527099003|4143699003|56012099006|11063799006|261022075727099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	QPpGZNUN+sjtujQ98WAtgGzRlrW4JqPN0tEryPuSYp0AU4geQAMkFCYqJBGxhK2YyKimR7uHMBXEUzAQK92UkHeqig145nTge6EPkn5Xt/e02K1yNDbTxFeVObYsmSJ0XoE7burzXjlhnA2I/LFzHFlpIdnxRXrXXG90ioYhAWDr1uqJQDkr1PcDBikdh2J5MOoLzsAjgQG73mM3pA+nQPIqM7/hKgLACB9JhXEzmU0BJbeV6vdWSTQEwE4oMwteEoKkkKWFnLD3Wh4QndZ9PoPT1tlxl01Zd+kuKyNuMKF8NLM0Zzv6FIC+vt5KnUYvC+YjBRhJS2Vm2wRbOrAEyZ0IMWO4yb7QRRaRAXlwJFz264y2yW0/B9/NEKwDDJ0B0NOQFI/5GxRB+s2gCuh/wkrJKpL4lq4vW8vA0Rp+8L/MNmA2SDNPkZMqyttn4LBq/gVz6voDG5IGxcbFFmLDuH3jxNx9weeexbJYzDOCGoSlNHmTDH+0kqxNhNaLVshzxme4ab9pon32EeLo2eIupzQzhCQpa5D+djJpezeM1Zl7HHKbUMkbsQVa/S1Fd0v68XOY+x1auQJXxGNrajK+APs+C6yx/MX7dW2B4t+2tHBMTiyczLIRpNtTmB7yhlGajrxwgZFPO35FWDhZT8rpIjirKJQcyKQjbzoZmNPLCcxUT2y60KwL64RZlEAuSxRp
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(61400799027)(376014)(82310400026)(10067099003)(261026121527099003)(4143699003)(56012099006)(11063799006)(261022075727099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nml+nGikVAzK18tZMki47rhvo9gXyjCvFh3ckHwouWKhopiyvYE3+7TzW04Msaw3GGof9IOvvDYUEyxWXJobRiGPJQnEf3E6it8q1V1Ge1l3pvCc0NfkcbFLlLNg2+mYYV/y9Ejhxscq8tw9ppEsmEBk/rm9sNxZIX9/kFqdl280U8/Lj/JSAbXkuVzVEkOBigtgib2iP4LHFztLmSmJZRNN9ENs4kC4KADbgOnvGPOzyxOthRHKJswhK4cU69CpwHsEpnVv7NLxP9aKhp5ordDIkgvOVHnmyUlu2nBZSdZrsPtOL16Lxvuh5aB6g1jdTjaYnBVTJ/V9vh9tSC5p7kHceb/mS/GSwM5j7PVLiO3CtFM2qjKGPLc3TFtEZBMdCnd2Hlxae2hPbxBEQZZ6QtB916n+dBi/5fbPtllajLyghzaAzBgAvYOYJy17IHxD
X-Exchange-RoutingPolicyChecked:
	KWDw0jBWYAhSLTWk+gtWhWVnahDBkoGIdEdzJusDpHaIeQWDgzyCTuA7xaQPuVHZgIKSohDXfPi+7a79HEgm9I23EhGBrtXHcR11vyUNZg3hP6AWTsdnXexf8z4AWZKVw0bnICGvds6Xpk6/gdC3j4NRxd5ABlB2acSw1Iwq6nucumrh4mNz7ngy1Fdx0Wf0Q1Kys0iW4ysIstKCf+09AiZfg30GekNzmf8qoNn0667o5mB4fijMT/1jRG1/oioIprb5O7G2CW5DraBCjDPb5DVnq240GjqKh1D/TrZM/CWCUV+a4fdxYPIo2rk9b1hn3xW1lfZQVCxTy+8VcUDoQQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:24:54.3538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4bc891b-8152-46e1-bbcb-08df4ae6babe
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB8236
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX1G29rCbT3dnK
 31WUKVF2PrwHHDk59c3f2VDSUbb7tZeNsd7JSP7MeDX9+eA9CGLU1LI+4lBhKaFZbs41Lv/WDI7
 334v05/5y5sItXplnkqzLtWAudZUZvS7ThmV4xlqETE8ENkWexHOEdRp5NM5pWLPnM+mUEltJRj
 heXGis1L3zr/ir0rz9D93BAcMmtkvpGwEhaOpmfvGSDjxSuaVcCbyjuUt7bdV719qzr+TSczRHZ
 i/ddCIw//MgMukz3WyKWpyhYld/085PyTMYlETtQCsIiNU8x3ZQLPK7ZNUyP1a8nWs9yPeeskoS
 mG1C+WkXL5QTU5JeGsQvNKd7dqcF4o6MDUFxRaFF00BFR01JEOMLxW9LvEZjV2XhIGGF3QYTVRD
 dKaDdHPkmCZ99+7rE83jPMDIejhoqJlmdYpYPHJmdFcxVFf1w/943PfWvmTCVSBme0Ez2BvGamn
 2Sg8Qhjid2912+rmzGQ==
X-Proofpoint-GUID: ipPauNtqfR3pk70fzhLB2lM9lEgxDNd_
X-Proofpoint-ORIG-GUID: ipPauNtqfR3pk70fzhLB2lM9lEgxDNd_
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b06c58c cx=c_pps
 a=h8kfmQfytRRkrxAHbIOtow==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=9QtP2f9ZxGoXtI1lnkEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfXwCYJ0NFcKGol
 uTa0M2ozu6Tkwwvk+TpMwLp5SgZJ2GJlIU+1mWmv+2MatBHfQcLde9E159O79Kq7689sOw694nk
 ft7KW1JEj/IpDAZ7fxyEfof0t1BtDGM=
X-Proofpoint-Spam-Reason: safe

On 25/11/2026 11:08 am, Richard Fitzgerald wrote:
> The driver cannot assume that it owns control of the
> CS35L56_SWIRE_DP3_CH?_INPUT registers so it must not do anything
> during probe() or component_probe() that could result in a write
> to these registers. Add a test case for this.
Sashiko found a bug in this test. Will send a V2 series.
