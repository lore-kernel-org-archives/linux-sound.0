Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795779666;
	b=Oz0hjYRhwg+Ewo4UJGuLnggz0NcHPLpjW2P2p7+j/tOapqdrnVnYjmPjoCqiYXxsCQxt
	 lJ8h+ImXoYU5lIxryC+I1ZhpZ2yExGkF7pTlD2bGzPITOpV8wzUSteqMjEcS7S7T5DziT
	 SHjdPKx+N0IfJVjsZhbYTL9HletAzcNZMdtSQCdt5p4mXO00GDUbp2AvCv4AOByEVhXvL
	 z54Cw9/xKegQHBItTCw0Znn1Qq5tmWelL9R8PqCPOsnhqChCDdbcFBCKd/JCSz2HC5xIC
	 +KnfRqpx/3azPv0zFwY1B/KgLcd5BsWBWBlyq6Nei/Cico51163DlnZVz+aejtppSZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779666;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=uwZKOWmrxQ1RhEC8F1wlp+QZSbPD3qw/bAhwRQhriVc=;
	b=mB3lSCUbRGglvXy4mYt7wOOt2Wh1PFfUsAQhpgJzuzRQh7+cy+bJA09cnkIxk+Mw4e9B
	 5aRWocGRAA83EVxnONRnnPLSqG9dW78dVbxd7B3AsHHFAFfA5DrVMETlSx3znF+7ozLNK
	 XXXbfPSe2gU6r37dvFx8AcFKCuiND53P6zoNuIklHi3amw/d1++b4HuvRS0txF5UxDa5x
	 7tWJjH99B0eRSZA/1zllZJvRZU+5Cqe+SRPh2qmwDjCCwehPA2m3QH9zjpmtisjslw4BY
	 sl/m96OCPuy7sFEFTuEhtrR9ROtLqn6OFjG9kslM+7kLlan8pTPfijhP+5WbjU3WLxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=GzGvPyGw;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Gq0c08vp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB3A606A31E;
	Fri, 27 Nov 2026 11:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FB3A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=GzGvPyGw;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Gq0c08vp
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARBKvgP2197730;
	Fri, 27 Nov 2026 05:40:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=uwZKOWmrxQ1RhEC8F1wlp+QZSbPD3qw/bAhwRQhriVc=; b=
	GzGvPyGwbfRNCGLRqUw8Y5zRJ9TowIQMq0ddyQ+TrCuSW6lR9fTERoGAf2d7mRxw
	zTkt6yLrtX/HojK/gKjkA6UMzMoxw8HIfcKB5rV0HLRkoAo9j86WMWBvWJUx8yhE
	2XxubbAjb3QEDjp4qOocwiCje/oMF0Q3RJkNuI+S5ny7zFRMQKdiKT2eumK9J0as
	e92p3fTbSn0c9S9plyUIYfKmbY0JirzG3bxMM5+N7kPBqlnle+3vSD/dku8cHWi+
	djozlZ4T4h2bEVwMxh3Q5gnQsNRgYutIY/8S5JbAL/lEbFqDJ0jEH8nQ0sVQLNhw
	E0hjKAQ67xaxpcBOdk0dgA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022102.outbound.protection.outlook.com [52.101.48.102])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j51885bj3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 05:40:44 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iC2LiuEaxAwAEWdsinAyYDmGtzzdxZHl0DhBcNFVZ7AzhIoVoNau1AO6HUynMGJ48XXkRH4BBkPx02+8CxXC6fmOS60dTaNgTm4SMcFnGVjAqovK3bU9Lp7ssuTLFcDSdeyfzxT3fnBS79elGkArmpOHX9+DtkiRz3mOaeiQcx23nvONpTGSFZiR1CwW57lzCfn9OY4X0dZENsmjn3z4DWB9i9muvS9B8/8hX6AhvPI3OFiXlWldIkk/Sc1dIs8SfyzCBN4XS9kMsrQN6Y1va3zIf2eYtAJvy+J0Ie25GmXQitrVkWsTB+tDYYP2ckrVNec2ZviIPsqiVOp5lHWqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwZKOWmrxQ1RhEC8F1wlp+QZSbPD3qw/bAhwRQhriVc=;
 b=MAZWDJjoZCMP9RSy689zuLTcotiNUPOimzoGCA3E+sLMyssR0gnNJ7IApfrlrI8+mYzzByJWe5xe/sYh7Z91L4boVWELDniWUVPedjXMP7ev1USojCogDApDUpzkk4o+9bhVhANTmYdb2YgprJeymnSrXCKt+eZ2x/orC2FI3P1kV9JUw9khKjqDXHfC2GBrRXXNttKP+pGF+Ioq8tkjfyMYUA52ZAM5e/fS0dStue6Qxcx7ju2B/0jRlMuN0iisUWPbv8eVklOt4MoMYE58zNyE1vMZi938KQ+elY811WxfRs6uv8ZxEmC/cKj/adT3FgOpd2R7f3WHMerQANnydA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwZKOWmrxQ1RhEC8F1wlp+QZSbPD3qw/bAhwRQhriVc=;
 b=Gq0c08vpylPH3nsIZ6plCpDkN+9JxKcQQkAE8fN+5ZYwVlYiGar7mNrAkIqN6Pxt0eiNqDJkjQjTshFbmJ0cc809DSuWZadvswnCvTr5QSQOQIjZLvzrDlTv+LsNpa8B/I6u31vudSPBmEl9E+5rUX4QRpl7V8b8Itnk1bDY5x8=
Received: from PH7PR10CA0001.namprd10.prod.outlook.com (2603:10b6:510:23d::23)
 by PH0PR19MB4808.namprd19.prod.outlook.com (2603:10b6:510:23::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 11:40:40 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::2) by PH7PR10CA0001.outlook.office365.com
 (2603:10b6:510:23d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.10 via Frontend Transport; Fri,
 27 Nov 2026 11:40:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5
 via Frontend Transport; Fri, 27 Nov 2026 11:40:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 027C5406552;
	Fri, 27 Nov 2026 11:40:38 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ED5D6822542;
	Fri, 27 Nov 2026 11:40:37 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] firmware: cs_dsp: Resize members of cs_dsp_coeff_ctl to save bytes
Date: Fri, 27 Nov 2026 11:40:36 +0000
Message-ID: <20261127114037.2010271-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127114037.2010271-1-rf@opensource.cirrus.com>
References: <20261127114037.2010271-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|PH0PR19MB4808:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4ae3de6c-dfa0-4cd9-bccf-08df4c7b42f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700016|23010399003|82310400026|10067099003|56012099006|11063799006|261021123027099003|261021121427099003|261022075727099003|261009223027099003|261102123227099003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cClR1B+qYKYnG7TwlzZ+IkBrXIz7HnwT1oORGyTm+oTSpbo84NXRbsHuXQzbschgib6GrJshCsotWQEmQmsoA81oOFYMvOsV/tdeKaueymS1ifbW1KeFmKV71YugLFU7+MFduKvwsOokDK53G7IqIMm55MJDEBlt2kaET8H8FdSAaNPldDCI52jAnEYG8qIceDm8ELfc9fUiD/VpwdaYJp+0t50vSExB7hWyEIFzGShWumX7Qm+j50IXeX3d0GU44Ynr6aRXws34PyPycbtnkp8PgMlcux1lBPbU5SsYag9cfdT3LeuuXGXBmchsEhE9DCimp65IOo3bZ/RaYaIDYN3z1f+yZ20doEndbXaoQoo/LJEoP548MELNIymuZdSg8GhFttpXKclj2SpIpWCO9K06bZCPjq3gK+mfWCAhClytk4K78IK0kExJQ1ENcXIyoFJaqQsthXN0okDRknqmhSldEyUpD9GJU8XEJtQ6I+xvrCOuLhJydUzS7ll/2KZaP88wT70gUV82HqlcPMmdi+/xIgUu+XRW7riVMPofXVq325qnvV14cyRtMExNbCTAsGI6h0zzWY+hdMAvKxCWEBeDoPeipdKvXLEsfV207rHOAQ94nOzlKN3h55cHzPAc9h1IRKlf7M5kQ4/uATevJckD6r960INhFiEj2MOnAM1muBY0ku30TqNz2nFseIi1qcT95QsBUX1FqODidZYYFQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261102123227099003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5qG0QzfJY/+QmkjaMMBEb08u8eRJ5KglluwewWlT5tpYHQ5IP10fPbbbUNE97z39hvRSan1aKQDm7g2EKV9hghdB+43VdK/5vspgk+ql0FkKw42ty2B7U6vJdZI2BlDTl2wA9VV8KFUj5UfxMYzTQFJ20U4O0XSCC3MbqE1qJkHHA1qIyhUKIfl++Yi0D/F5CQF7xAoNS8eunFmbkrFPVYip26jxMxgsAiNh8E/mNi8NiQtuRptRZy/BRcZ9IbBU2rOy/ze4MshFZpM8UCR6NZsWod/AJHt9/mVzTOgwFt+kaVB0BjKtl9cnI5GnnMnER5iZSMkkmhiHtLmHCYfTiT7G9ti9oSjXCAn4jNl2ATLQrze1DXq1jRx74NBh4PFWwhzISOadTw5ZgTr1FSfB07Jc/OIGhuB4amo3rTOCzq/kj1+e5Mm4LvT8s/YEskI2
X-Exchange-RoutingPolicyChecked:
	PKxh2m3O7RiCsvzbhRxAug6ZWkuLx4nfDd06R1mg8Ey/bJACfT7n3OCRgpBGMRBgO54B3dtqZpAb3HXDZhmYjyAvZe3vRIpG8VWuZUzidhr9zsEP9UinX3YtIZorPuZOTCnQu8R506I0vjR1u0yD+tz4T+y/GT85mr+p7yUrltw2+oyHwn+KAkuXUtAM19NwnMonzOwuQ8KeqTXVJcxuYxWNVL64UcVKUN8c+xy4lNAypPJRpdwG2ce/L9PdvMKVODu/GoAdoJ2vLTbOHe1JaXF/XCa7HjcuJvuVZs6qZbf7ScfUtu5ENliXL/CvH6hPLXg69Lytb+2KW2MLmgpS+g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:40:39.4484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae3de6c-dfa0-4cd9-bccf-08df4c7b42f1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB4808
X-Proofpoint-ORIG-GUID: hE19Qn8nDnWKbO2HpvYp9MJcG04nFtUe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX7y95YGFn109J
 vTL3mRv0Ng8jMp6cy5+BMxR1viD4mw8wH9dCeXn/rQxjS0onNWkjQEqQCUz27EqVvviTWg30xzT
 vRukcCVvSYu/jlsRwDEimvuu8UvsdgF9KaTrQ1hgEZjGvAud3Jz1sF7y9HG/CI2BcF1LTwzAv4f
 Lpn0PIMmgVpjywsuLYU6TsgtBqsn/6+8SZawhVP28CR4+vaO+aoukLYT2cLQ3l25kx00UtfPbGx
 NjJTfAw+cGWIGm5PMeOiuwUAlFUle4CK8e6zbyK+q2Wh/EvYoIq//2se1ll4vS58NpQJfQ5KjNu
 aLFE3UXe04qBz4ClvFfM8QunEw3xZi2BSIGidGL2g6PTIhowzyUOGTYwKT/oxH/Zyw7S2Npwycf
 A0wt/AVNowUrGkTeDzwmCnEVvy2ZJHFh48p1A+meiDRkQGYtxBBvu79c0VNTfv5eIKCbKIbXKqm
 hzfcgkL+NYH+A2j0OYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX8gumgoIEtXDj
 BXwJcRAwnvS3rVm9ACxSszYErDi/rE1ZS6EJHEYw+nn6K7kDSEmnNaksSeFus2/sJo8mvDbtG+8
 0ZO51eaWnSHaz0t+IaSEujPIpTYmE98=
X-Proofpoint-GUID: hE19Qn8nDnWKbO2HpvYp9MJcG04nFtUe
X-Authority-Analysis: v=2.4 cv=BuEIUoX5 c=1 sm=1 tr=0 ts=6b096c3c cx=c_pps
 a=V3pMW8GKM1ePhxMQJcf1Tg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=Xfgjl66bu2JEPtsuBdoA:9
X-Proofpoint-Spam-Reason: safe

Reduce the size of some members in struct cs_dsp_coeff_ctl to the size of
the data they are storing. On an x86_64 build this saves 8 bytes per
control.

- The subname_len string can never be more than 16-bits. In V0 and V1
  firmwares it is a 256-character array, and in later firmwares it is an
  8-bit field. (In any case it is impractical to have a control name
  >65535 characters long.)

- Control type and flags are 16-bit values in the firmware.

- Type is relocated adjacent to subname_len to avoid introducing
  alignment padding bytes after subname_len

The ctl_type and flags fields in struct cs_dsp_coeff_parsed_coeff have
been changed to match these widths.

The arguments to cs_dsp_create_control() have been changed to the same
types so that consistent widths are used.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 15 +++++++++------
 include/linux/firmware/cirrus/cs_dsp.h |  8 ++++----
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index abf9196db883..b9e4b9283df1 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -1044,8 +1044,8 @@ static void cs_dsp_free_ctl_blk(struct cs_dsp_coeff_ctl *ctl)
 static int cs_dsp_create_control(struct cs_dsp *dsp,
 				 const struct cs_dsp_alg_region *alg_region,
 				 unsigned int offset, unsigned int len,
-				 const char *subname, unsigned int subname_len,
-				 unsigned int flags, unsigned int type)
+				 const char *subname, u16 subname_len,
+				 u16 flags, u16 type)
 {
 	struct cs_dsp_coeff_ctl *ctl;
 	int ret;
@@ -1162,9 +1162,9 @@ struct cs_dsp_coeff_parsed_coeff {
 	int offset;
 	int mem_type;
 	const u8 *name;
-	int name_len;
-	unsigned int ctl_type;
-	int flags;
+	u16 name_len;
+	u16 ctl_type;
+	u16 flags;
 	int len;
 };
 
@@ -1312,6 +1312,9 @@ static int cs_dsp_coeff_parse_coeff(struct cs_dsp *dsp,
 	blk->offset = le16_to_cpu(raw->hdr.offset);
 	blk->mem_type = le16_to_cpu(raw->hdr.type);
 
+	static_assert(sizeof(blk->ctl_type) >= sizeof(raw->ctl_type));
+	static_assert(sizeof(blk->flags) >= sizeof(raw->flags));
+
 	switch (dsp->wmfw_ver) {
 	case 0:
 	case 1:
@@ -1319,7 +1322,7 @@ static int cs_dsp_coeff_parse_coeff(struct cs_dsp *dsp,
 			return -EOVERFLOW;
 
 		blk->name = raw->name;
-		blk->name_len = strnlen(raw->name, ARRAY_SIZE(raw->name));
+		blk->name_len = (u16)strnlen(raw->name, ARRAY_SIZE(raw->name));
 		blk->ctl_type = le16_to_cpu(raw->ctl_type);
 		blk->flags = le16_to_cpu(raw->flags);
 		blk->len = le32_to_cpu(raw->len);
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 6aa1e1b2b4a5..16542bdce5c4 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -84,9 +84,9 @@ struct cs_dsp_alg_region {
  * @fw_name:		Name of the firmware
  * @subname:		Name of the control parsed from the WMFW
  * @subname_len:	Length of subname
+ * @type:		One of the WMFW_CTL_TYPE_ control types defined in wmfw.h
  * @offset:		Offset of control within alg_region in words
  * @len:		Length of the cached value in bytes
- * @type:		One of the WMFW_CTL_TYPE_ control types defined in wmfw.h
  * @flags:		Bitfield of WMFW_CTL_FLAG_ control flags defined in wmfw.h
  * @set:		Flag indicating the value has been written by the user
  * @enabled:		Flag indicating whether control is enabled
@@ -100,11 +100,11 @@ struct cs_dsp_coeff_ctl {
 	const char *fw_name;
 	/* Subname is needed to match with firmware */
 	const char *subname;
-	unsigned int subname_len;
+	u16 subname_len;
+	u16 type;
 	unsigned int offset;
 	unsigned int len;
-	unsigned int type;
-	unsigned int flags;
+	u16 flags;
 	unsigned int set:1;
 	unsigned int enabled:1;
 	struct cs_dsp_alg_region alg_region;
-- 
2.47.3

