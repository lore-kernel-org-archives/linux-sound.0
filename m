Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607523;
	b=HmnWpWFSfuEqYI4+cjTEzG7pdhiOcm942xkfpMhdGOfxq7USooR5QAqMRGiEzMmcAulJ
	 LGhMI9ECil2dD3lWM5w2fxV/5w1U042CTDH8cYpRziVzx3fXLro4I7gTuc0dajiondLhs
	 B7lK7UaU8+n64FdFIBk3H3LwDETDGjCSUxKl+OUbdlEwUxlqJTWlPgd0+0su+mF8FElo5
	 3go7OZYKab+9Xe7eQkk78UtFulRrvAPKinKu+wI/pZcRiz4qKlDfszmu38o6oUbdInRTU
	 Xun/pYJIp3P0W6HR/JgitJK3O7wE8PB5fkL5IfQhL9cOKjCg5MNQs7sEOYi4N1p10+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=A4DjWNnebpmWQmhq10gXtwIFMYo6PYqr0mpH9As15UQ=;
	b=bCfcjm3ZL057AIqdK1PRTeu9Rxjhlnjly5W9FODJIPykd34NqwqoONc7Rj3vlNIUb4bO
	 cl9/wAROx2FRwAAaZgjVuXv9A+elqQQRUnc4gM8tP14K3TMzUk3uakwjmQEN7vTfGDHiU
	 /82ZRoT6tQgGMbtVA83OVuJQqnJnx6qYYPJ0hiP3F7iwIKPqd1BcHpJyK4cI71S7w5X0P
	 vlph95LXcvD7Jur9zba865C2H8lXIDMzFD5y07qLQO012NFDZSQimnAtCLj9vIbSuXgLO
	 o4FXd+i2cKjve/0vVQC2rn3bnpnA8uCcQyHw5ANR8Uyd0PuHef1QBtwdPHrWw53se0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="bi/3GlY8";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=rv7LWqZO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130DF606A332;
	Wed, 25 Nov 2026 11:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 130DF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=bi/3GlY8;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=rv7LWqZO
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APBhVLB102388;
	Wed, 25 Nov 2026 05:51:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=A4DjWNnebpmWQmhq10gXtwIFMYo6PYqr0mpH9As15UQ=; b=
	bi/3GlY8qg9PVD0skjhwEMd6miu7icbseeF/3BR2Q+7lgCWEJ+TPTcU2u0d0UJRq
	6HPudq8yxOYmzIEsB1xBnHCqVdMDEnE6IMMcdpQ46Vi1glYww1eDXW71qW8zbbdo
	rH5ROcpNZy3Czg7g6umL0bHXIU+q4/aLkc+Ko5mPRTTagWZVdszi4UdcQI218VGZ
	gXwEy/2Vm1VYdVWFx0PYsEbe7kqDotoTUFl2PRyPwbthrpWfDCo5+21sqXO9q2BA
	22bgiuoB0AJKvQ6Utmbr6LGc/8XSG1GXUc0YymrtVepMIouPy9Ey5gvrbZKbbvhx
	x6WemnOP2UwaaEPVy79DCg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022107.outbound.protection.outlook.com [52.101.53.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jajsp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 05:51:41 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRoTq3rvKUmlB4qwYBHHvgF2DFFa4RGuxc03Vy1MdXgbqqT/EhZ5M7hAN0qIbY4yiH8373khRpA91AIQs9jH5kdXE3Gz8R2CL4MhjNVMKVt+04WXCLKSZUG5+xKhmO7UTpFiswIZ1Q4FU8OPeHCDkwyCsSfTNDPBbJIAKF+oi4Z58OnsUEM6uMqmPGx38zTii5/2g3e+9G8KVlworsDJe05uUmY0ilRNGrmW/0RmzZ14sO8G/q9gPEBr/l6lffz7TTtRjlPaRGgFSreeZrVhslFJpWpWnHCruoAI114OCsVHk099XqlWZ2dHJaxZ4DhkI1x3oUa0kwvmu0rR02tJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4DjWNnebpmWQmhq10gXtwIFMYo6PYqr0mpH9As15UQ=;
 b=gl31Bdxg8RtBUVkWC/elsyZLPAO2t2KxPUxRueBgRaYtTgnSK+6jAxpYvptdN6VZASkXIUf7p5GNVENf/L5N4y/MiZUarw35q4Dg5HfNmz4jDo5/UxrF/NQqWKE3I2bZtBGG72U8iogAsWivQYlY0rfdGYdB1PgB/87LfdY1SJJiTpjMkUepAl53Rt+n57JlA7EMd6/JGR1EwhqJOc6RGNV9Wg0c0Xt5JCCdn/UuTewtAvQX1TUnGh2rQuwXKCJaQ5ewK3PFUgy8fJ+B+xK/gd4PSQwCgMEtjwxmVJBQxlEFJH+TXceCsn3nviO+0X48zioAeeScspqRFe/p5qVv0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4DjWNnebpmWQmhq10gXtwIFMYo6PYqr0mpH9As15UQ=;
 b=rv7LWqZOJmCiplVvieexpdyBM+pTBNIdLGm42pQjGKrFYZyEqHyEmBPymzlBRf3xbDJJxr9H71BQcuAGKJSCA7uxLpCcLp0UmwUuJDYCUBm+GTKgMMboqMcmabQQ12ADBn3b+4sbHS9+xGOIciGMZjoQ4fIr1xA/wZvwWtOINiE=
Received: from DM6PR02CA0199.namprd02.prod.outlook.com (2603:10b6:5:177::33)
 by CO1PR19MB4918.namprd19.prod.outlook.com (2603:10b6:303:db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 11:51:36 +0000
Received: from DS2PEPF0000710B.namprd05.prod.outlook.com
 (2603:10b6:5:177:cafe::2f) by DM6PR02CA0199.outlook.office365.com
 (2603:10b6:5:177::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:51:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF0000710B.mail.protection.outlook.com (10.167.23.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Wed, 25 Nov 2026 11:51:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AAFD7406553;
	Wed, 25 Nov 2026 11:51:34 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7865582024C;
	Wed, 25 Nov 2026 11:51:34 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 2/7] ASoC: cs35l41: Prevent software reset when using SPI
Date: Wed, 25 Nov 2026 11:50:44 +0000
Message-ID: <20261125115124.9130-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125115124.9130-1-sbinding@opensource.cirrus.com>
References: <20261125115124.9130-1-sbinding@opensource.cirrus.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000710B:EE_|CO1PR19MB4918:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5430ba9b-3bbc-44f5-e9c1-08df4aea7548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|61400799027|22082099003|16102099003|18002099003|13003099007|11063799006|56012099006|261022075727099003|261028144727099003|261026121527099003|261102123227099003|261021121427099003|261009223027099003|261022105027099003|261026140227099003|261021123027099003|261102130727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ckpNEpHu+XDhv7ZFk228UAXTjK0zL3YetltZSsJi9hBdAQbvfIokxrPOu5y2eKxr95RHTvoFCd/N6EpsATdyzR9biIpxly6e3KvfCEGwAo6+isEFWuT5s/ZV6pbQz5gdyjDHw886rQo3sGRmMd16EYXCkA7eRTIYqBmMApnBZj+vaWSBYeSp30X2xIkPrkFjeOn6WiCeuCpYeVa5eUeejUpsbd7ERJK/xJa837+cR/AacVG3VaB2qY1rbtdstNTmRa8mkcSpojps/Y+kOQiB/9CTRG3a6nu7r36ZO5Ae47utPj3mI0HVk47Wofmu2A3LZTVZlHXlrswHf+jr8fPG9ufxGyNk/VAf9BLhZlmgwYB1KyABDq3OPL730/4l5lKeJfDX1NE4U4vhdELqPXG3171zFGYj16yGG0iPgE37Dnch1xww3m4Cl18Fu+MqzT5M8wbufvQWavqHYwxgbRN32AvZBMj7MCeYT0ktjBuaerHnu5sbXEzhheF+lBK0W8GvsnV1bX7PWBMFUKzRpiuIgmdwShVHeUd5sQnAohfGnxEdzl46zs602Aym9/i9OzbOI6XCI+avyaFb4oXQwTcmXsQwKMc/KOQbQcaHXn3uxpcT3lAU7rMnYFDrErLLyhASppdNsPkTO+17NUiIm9Q8PA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(61400799027)(22082099003)(16102099003)(18002099003)(13003099007)(11063799006)(56012099006)(261022075727099003)(261028144727099003)(261026121527099003)(261102123227099003)(261021121427099003)(261009223027099003)(261022105027099003)(261026140227099003)(261021123027099003)(261102130727099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l0GIoI+y4o290+t5LbUVfZVTvoJEXsdocHuxA/kiVFsWzRvFhEJz/7vNCjZkIAqJooBpikQYsySnWX8ksYBD4mi2gAuX70XE2mF5at0ql0Rptqyr8kkT/B87m4ta8A3GD8INdjRuUunr1OSisxNBk2YcA9uZSrwQZKkSDJbcL7/hmeeLr5VrlaP3/wD9tkHpqzxnydsKGFM7KZ/dMi1ngTwSxlsOomgD6PLYPa0LwSQ88AFQ1VHRwQu6BpZEr7jbI7TQp4raadQOZRY/NGejlaKQ49H0U9ugZ4RjmS0Lx71rU7kqEHtWr7qxyO0LmslSXwrirJuqjDAPDYJwqkZ/fHGLmijaocCV7IfvkZoiyHDJfOQ4m4X0eQGDXMzvCkLQY7ShHxyk+QBwIAq+qqtvH4N9TvfZkwL+M/z86g8oWdLD5N6s2qSClsAzIG1yI8QW
X-Exchange-RoutingPolicyChecked:
	Svx37mqaXpGsWPZs4mGMTVdxvybTK+4sMKHrqHwHi7mI2vOnK4cyQ9ojlsbLWW7ejuhdHvJi2j/HLZ6svTskabQmEl5iT26cpD/teNgT85bhNIdkqzpwF99BmBqLVlWeXAi6SwCpkMWbfVDtrxAZ5IJAUnnM+OVNQlp+H1u3IJF7Hrju55kFNp5f/OIkJ5UgFAs9pxb1Hl9LtiHlAirXOYiVAis0louUXmFP5nA2riSxN9fLnnMIQPsjXRGTaN3l/XZkZkcyNnx7Jt7aRJsdie14hqgOa140ahU4e3e/G1J/mYVCSObPsBSukijcP5faFGTf3qpIrAV4BGAeJEtwqA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:51:35.7652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5430ba9b-3bbc-44f5-e9c1-08df4aea7548
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF0000710B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4918
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX+4lV1NWYFNj5
 rk60/E9UO52Cz4/gIIsFwzeVeD7Ooyr84YDcrBJ2fO8QAkie8jCenvu/n6RVe7JrN1otWviBoOi
 ZfA4uyrfRK0BFJEpVk+hL2autUxgkGeGsnfsDpszi/gCuZm9ODC0rBTFZb5Jt4RH901wRUD1ls0
 ZRCrBLXwOlZ1mvP84DvcUdDtMqiurkbYBef/qRp6/zmm6eQgMt6gEqJXrfQ8370135l0Rj4ZC4l
 kpU7lOy1c5d3S3IvImlY4R2Yiya+E8DyGAxuXpIbufa3gcr/X+kaisXh2fdzH9ZgI4oStcFbVlS
 GZ0XxkPKnMwwKekyUINkY+lvpQvA0q0aflVxEogBfNK+QWrSOx98Qc3PwurYq52X63GuQb7+evG
 7RfmxTh2nmuOdxDfkJ4omGGqjQXWIKTtPT5lqtBO5AmjvHp8YQb5N6QejSEhTEZXrLMrYSEZIbz
 NfiysfT4pRshRuGN2Dg==
X-Proofpoint-GUID: Ry-jjNKCgi6gRjL861k7KpljvtbsdE2Y
X-Proofpoint-ORIG-GUID: Ry-jjNKCgi6gRjL861k7KpljvtbsdE2Y
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b06cbce cx=c_pps
 a=DIqcA6Wvos/1kaZ0X8IXZw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=VCxekSB35Xx1IrWNsrAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX0kk6KnKhzM9e
 RdFHVyjoxiPGHXXbwQyKHvK7+TN87YrXj2cHDWxbo3DN7TONVGtRhwdaWhtcsi3mWVyuI5BJFEV
 b/SXmRVrr9/oVGRNfJU5bFc2QVYP2pA=
X-Proofpoint-Spam-Reason: safe

If there is any SPI Bus activity during a software reset, even if the
chip select is not set for that Amp, the amp may not boot.

This affects both CS35L41 ASoC and HDA drivers. For HDA this also
affects system resume.

Whilst the driver needs the amp to be reset when coming out of system
suspend, the driver will always toggle the reset GPIO off and on to
ensure this occurs. If a reset GPIO is not defined for the amplifier,
the amplifier will not probe - unless the amp is using a shared reset.
In the case of a shared reset, the GPIO will control resets for both
amps anyway.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221161
Fixes: 9bfbc1af0713 ("ALSA: hda: cs35l41: Add common wait_for_boot api and reset_and_boot api")

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41-lib.c | 51 ++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 9e6bed22fbdb..0ea6e9c87da1 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -13,6 +13,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/firmware/cirrus/wmfw.h>
+#include <linux/spi/spi.h>
 
 #include <sound/cs35l41.h>
 
@@ -1588,6 +1589,18 @@ int cs35l41_exit_hibernate(struct device *dev, struct regmap *regmap)
 }
 EXPORT_SYMBOL_GPL(cs35l41_exit_hibernate);
 
+static bool cs35l41_is_spi_regmap(struct regmap *regmap)
+{
+	struct device *dev = regmap_get_device(regmap);
+
+	if (!dev) {
+		dev_err(dev, "Failed to get device from regmap\n");
+		return false;
+	}
+
+	return (IS_ENABLED(CONFIG_SPI) && dev->bus == &spi_bus_type);
+}
+
 int cs35l41_wait_boot_done(struct device *dev, struct regmap *regmap)
 {
 	ktime_t timeout;
@@ -1627,27 +1640,35 @@ int cs35l41_reset_and_boot(struct device *dev, struct regmap *regmap)
 {
 	int ret;
 
-	ret = regmap_write(regmap, CS35L41_SFT_RESET, CS35L41_SOFTWARE_RESET);
-	if (ret) {
-		dev_warn(dev, "Failed to write software reset: %d\n", ret);
-
+	if (cs35l41_is_spi_regmap(regmap)) {
 		/*
-		 * If the write failed, it is likely because the chip is still booting after a
-		 * reset. Wait for boot, then retry the software reset. If the initial write failed
-		 * for another reason, then either waiting for boot, or the second write will fail,
-		 * So we can return the error then.
+		 * If there is any SPI Bus activity during a software reset, even if the
+		 * chip select is not set for that Amp, the amp may not boot.
 		 */
-		ret = cs35l41_wait_boot_done(dev, regmap);
-		if (ret)
-			return ret;
-
+		dev_dbg(dev, "Preventing Software Reset on SPI\n");
+	} else {
 		ret = regmap_write(regmap, CS35L41_SFT_RESET, CS35L41_SOFTWARE_RESET);
 		if (ret) {
-			dev_err(dev, "Failed to write software reset on retry: %d\n", ret);
-			return ret;
+			dev_warn(dev, "Failed to write software reset: %d\n", ret);
+
+			/*
+			 * If the write failed, it is likely because the chip is still booting after
+			 * a reset. Wait for boot, then retry the software reset. If the initial
+			 * write failed for another reason, then either waiting for boot, or the
+			 * second write will fail, so we can return the error then.
+			 */
+			ret = cs35l41_wait_boot_done(dev, regmap);
+			if (ret)
+				return ret;
+
+			ret = regmap_write(regmap, CS35L41_SFT_RESET, CS35L41_SOFTWARE_RESET);
+			if (ret) {
+				dev_err(dev, "Failed to write software reset on retry: %d\n", ret);
+				return ret;
+			}
 		}
+		usleep_range(2000, 2100);
 	}
-	usleep_range(2000, 2100);
 
 	return cs35l41_wait_boot_done(dev, regmap);
 }
-- 
2.43.0

