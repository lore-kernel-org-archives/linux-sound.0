Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D0044B67F;
	Wed,  8 Jul 2026 14:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519261; cv=fail; b=V5SRaW6WeO9pHBYxREp7IYaJRHRmwtRe/iqcqPFMKRwmc3LRvMaOBhG5HfAJ6Ebl2hUI1vczcE96/q44/M9navq+dDxxnZkaOBAykdNVSMlivmwBBZ3BwWucI/uDLPPYKuLcwi6+AeUm8cF+M7PmJT9coim9S7qpa4kCeSvuUsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519261; c=relaxed/simple;
	bh=MQ5DKJdm4XEpafuRD+YtUC7Gyyn/1Y0SGKvSkWOOz0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q4rGh+r+2IwK7Z7ER4LliSFUMsDJAjvqnVzR6l3381VywxCQPFoiVf6WxzPMYXZIlaFDSPcY4JMyAXJdSD935/NfUpa0iWOJSbF6TpB6VZgJoSdm4k0MYnijZLBqm0irMihTZKr/Q0/H5/wblsNL311ES/zZEiOIGCPUepo9KVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=U2pEZsGu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=U7LL1RSK; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="U2pEZsGu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="U7LL1RSK"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668CnL3v1464492;
	Wed, 8 Jul 2026 09:00:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=7YMbie5ybP/XnTR0gfHSDYoUJk7pfVzQ8bfjgWtOvhI=; b=
	U2pEZsGu/I1aNSrLe+0HKhhaqMzlSPECTfLqXlcoUQuoBCHM5Ots+29gVxxKIcii
	1+kLHla5+KimiuwNEBGq2QsCnPTSL70g3qntyZid3/VLajp79mzNZSO1AECAr/S1
	Noj50pJ8TG9ODaoiiIwhRFSqyRHKUdCYEkJdZPlKtmrUaTTwI8cQFYsh9UrjpjjV
	SiuqQZw7evuGzoic8AbPVOJ4HtCVkXZ1EVJCBwvBK/84TT7Qbt/0Jn7lpmGBRNPf
	zSPW8JOQNT/fcij2gy0JyM1E07QR5QMc8m60eyLXki8eVIPgmbjG4cwdYURYvrKQ
	TBUZewliyuMGOdguVyWlhw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021090.outbound.protection.outlook.com [40.107.208.90])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f6yjxpaeg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 09:00:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sp1+whGwv62nkNoRPEczZZcd94RLYpxSu8zPxEA53XhyViQX6bhjnrxPY5u2CFJkGIpTleeynAbmPAhaAq7sqJ7/xRVrWB7HLWxcAwBLb5HUweOYDchEop5XnYCJx4nIUQPdhh3muwP6Xsyn0AD4bgdWwiqMKNt4N6b+8Cz9m0z/wHXPhbRjvrwsM/73rnrSgDd7S5mEt4AnPBMlbtGbFOHlzE5HSuisbJTDWm3O/IWJNNwdeQKSXw2Exe9Sxfte/NNLKlhDSxulODdHTuRUgqoXanAqfHwlGX555Sz1vaZPg20CTx+iZ3vHtO6Uf9FHZHrLK2wQ3z1Alk3c7P0FfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YMbie5ybP/XnTR0gfHSDYoUJk7pfVzQ8bfjgWtOvhI=;
 b=pkCf17J1b83QKCr0oCOQnaRybE5sRNdeFNiorGbNL1j/6ZO1MM9sgiCf1/MG5y0RL6Qs3AIRrY5QkdAsr1zcNg7IljZBYvlbcbOqfJq0EHMwsAtG9aTYtYrI/RaqpJEDRy9Q5ifkeEXha/p828xP+u9JWY9Ui+XbT4R568ZpVF9J0KL0XA0Rh3bXaqJ45cU2vd9Rzg3TjJetxmbeaVU1d0qkq8iVb3ioD4UeRz7Kva3htil6PjYXHwSeYQSPj1virteu/gxlynRf+Uln34tkHTbQlEY3MkZPzBCqEWtW72dNzpDTq94+0cvFgMDHs/QwLFWWLE0OqWcRnaHEyWxtFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YMbie5ybP/XnTR0gfHSDYoUJk7pfVzQ8bfjgWtOvhI=;
 b=U7LL1RSKUWbL5GPA5zxdbjvxohSvQzevbCpkh+TLtNKmRW1kKwLskKmy7UNhhMMjN+b/dmPpcrZJ2/D8mVSA8pDi9aelQ8voYg8ZqCoFzvna5XzsX60JqpjyXxkbp5dfFkk9JnwHbGSkO6L9uTnu9cHU8sj4Un7ZNf19Kuyqki0=
Received: from SJ0PR03CA0344.namprd03.prod.outlook.com (2603:10b6:a03:39c::19)
 by DM6PR19MB4310.namprd19.prod.outlook.com (2603:10b6:5:294::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 8 Jul
 2026 14:00:47 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::8d) by SJ0PR03CA0344.outlook.office365.com
 (2603:10b6:a03:39c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 14:00:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 8 Jul 2026 14:00:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6364B406542;
	Wed,  8 Jul 2026 14:00:43 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4F4CF82026C;
	Wed,  8 Jul 2026 14:00:43 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 1/3] ASoC: dt-bindings: cirrus,cs42l43: Add CS42L44 variant
Date: Wed,  8 Jul 2026 15:00:37 +0100
Message-ID: <20260708140039.1993489-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708140039.1993489-1-ckeepax@opensource.cirrus.com>
References: <20260708140039.1993489-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|DM6PR19MB4310:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e3354d2e-c072-49a4-4fea-08dedcf94e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|61400799027|23010399003|36860700016|16102099003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	GOKgzoVAu9pVyOOlgSZ9Qt9F7J5h+fk3UnsQZw0kHE+9/siK19rgmtVaUJgJclgPScVG/BNrGx9cv9W1L9v9y4OQJHWlV0IxG9I1a2JGG2DjRJVjuWwBWpqCcLCk/A/3rU2CsKgRPRXAIjY7T2j/nFFGQ8U0F1VfJaLnsLX+GZdTpmYzCAPRlAhhfZLt2Olhf8YfZd4prd5hphtL3gF4GOWtpOOZ0pFoiAQuoCQ5cscODCnC8r+moy0XSZUVDZ9zm7Qjum5Kn/1UqwUCC0AVRh2PNq94QmztK88BQ/EDykLw8Y360cZFwAnX0UR5ZT1RjUh+qswU2kQVBDhaO18F0XPTUUxYN0yB/0FDR2Wqmzo4Z5XmhYS6nLM+650nAlaacwa0vDkWCWttFlEr0oYyeCDB1HMGWSdwbVWYPi3ouDUaaLjz6lHas1Wb07vr2YheCSaz/k9kpR849EulNdKUd4zj2/tH42EkjYhYf6C3cpanP7yVByVvIh3/o9mDzhuJfwcnv3xYdy8ES605T0Lhjxi1FdkGmOCmFzoNHhz2XgdeI+CUwiWo2pSKjUqqVrttKA52V2Hin8wCdhffsFIyfRP0wAXqQYwZEV0Pjntkv3Z26ewNr0GqniwQguLQ03w/uqBZZrnxV4GS7UPzJBKD91yhjr/mSv3nZfHOaJYzYW3m+1+8+xJCFH4EcI4PlPy5Q3rbkDWauXVzjb3sdTpLrg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(61400799027)(23010399003)(36860700016)(16102099003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QAWUm5/LVeQPcaZOTzhGuybqmW8VZaJ0Heom+/C70Zd2ywioh/Mn4Erd7hAXO8WV8sZ088JZroi1fsIPXf5Jsx89CrrFck5IAINZQa1g7wmxg823YwkB9nteGoJuXkOP3e7CQdIW6uf7Z6mbzUIBCzZ4sn1Czd0I6VkYKlpshEbP2m8OAIJSb3rzzijz7xzXQJCbfUT/7bt2lnl5MMxUFpFexw3c12Pelvn/2DLUwRClpYUxFtKtgwwy8uSF8RspFMsS1s1GVFwy+zaJjpsC14FJYiaFp2ptueQYlpzaYbu4z7F0+WdaS6L2XzwpsgbSSw/gHm6PHlccLY484TMgT4VnrGa9AGP9dICaA8LKSNe+xJHKwzFpOBU7JmHqioBtLmD6ZYFKVW4+PfiXurHo+U7j4JpQnggLQFMUVi+Zo1RTdR4CGV2znkmcnuWQotee
X-Exchange-RoutingPolicyChecked:
	XbsTWuIuVYnXQkyDWKZd+ZX8EPRpHp76K2qFnUBhB7RuOvQs5UW9YBAz+ei8LgmK5L+hbJN6bEBeVmZgerrVWbEmETs6Rrj+2/UcM1iveY5gBJOm0LsVTrQETm848K5R7siLi+8bfU33n2Meks5hbjKtHYaIvgtlBJt78BGbp1nL4ipYGqeogm+6E8GCQS6lDzCjZIlmlRaiM8J5lk9kI1cDjeLP6QhHh3Wrr6vWeDE9ZNQmkIj1BkjmGj1VJZ9GdXh3XIx3CGgwZiFkbbmOKvmdwBOXfhu6B7cHk0tPYUR50cbGHhCEXGgCTQsr+LsFnRNtYldu7d5g9v0o/VMeRw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 14:00:44.9397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3354d2e-c072-49a4-4fea-08dedcf94e5a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4310
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=6a4e5814 cx=c_pps
 a=AOb1yOGEV8Ho27kyBPrkwg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=G9XpSyhw2w38GRvjO_IA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzNyBTYWx0ZWRfX+muxq3cIOlgb
 WSQaj8TyM43TGPDQSc/ODQisWm7u+qNA+mn4tpmoc6XU+a7s1vosJZQsfHX4+PbY29mMrxvoiVd
 Cu6LlHHLS7cCKuW8SwuPoummYCFTv8c=
X-Proofpoint-GUID: EE4E-_EG59X84FsaUEubmyqGutb9XEcZ
X-Proofpoint-ORIG-GUID: EE4E-_EG59X84FsaUEubmyqGutb9XEcZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzNyBTYWx0ZWRfX+bsnjj5mHbmm
 Dvu8n2CX6vrlgln/PLhIR8r3VhPzcUM3kUijL6WuNOoA+z1v1zbrmf/t9ZfDa0vBQUZi8qIvWxB
 PPicMFIEySZ1vlyj00PAtQVCHy3etuYgE8j4+lGln2M0CIywdbQIVCfhdPYd+n842ch/+xkrs1t
 oL2NASMyN34JS33vLISNceUTMxCMCZ+A1ddxHHJEDURfc0ito867HgmybEwhR/2GKV0GEmmettf
 RDvgygsMca66v9llyaZww6BjlpDhv3tK06WAt0TG/5tTqPdPVilKmAUo5JS3hTXRMiqVH0gby+e
 MGoqelPCIby9o7kPwNF/CHWqT8lNAtpUZprqAieqxTmwbTbp+KOwkCdnPANA8AkDCNLv5M5wyfk
 fr94xm0vqOp9rVt4qYfSd7I8tocHtADNmpRe25yK5iR3/RPmD2Cp4NMz6c4Uxz7f00TONCfft71
 6IHXCkO4RGlYRlrYDAg==
X-Proofpoint-Spam-Reason: safe

The cs42l44 is a cost optimised variant of cs42l43b.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
index 376928d1f64bf..c1ef9f3083962 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
@@ -27,6 +27,7 @@ properties:
     enum:
       - cirrus,cs42l43
       - cirrus,cs42l43b
+      - cirrus,cs42l44
 
   reg:
     maxItems: 1
-- 
2.47.3

