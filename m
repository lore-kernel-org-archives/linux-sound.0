Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399BB471271;
	Wed,  5 Aug 2026 13:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935997; cv=fail; b=blbwGwf1tXRqjNmx827obyFmtSueUWsBKloY6q4nqrDXWTUPbcRjbuTj6Q7jNmBQd6giB9uk+S3EQ3l+R4wSctnDRrXJ6X99ondtjZh4g1gax0FSskdkQ1F5Yi5wwo7b7kD73h5CdPtHfrlk0FtYWFn1e+T/rOaseZ4tL/tp5t8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935997; c=relaxed/simple;
	bh=EkBU3gg0pjG1Xfu6q0Of+vfzJaic0aGs67rwdAVYubk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VHRTAThAtDsIN8i9ZJeoFNxS3xpFq6q4Odt2ysLUokKVKHJYeTibZ8GdaEfpcwWBhIcnrMM7xd34cQVfh/J7gIWXFRSYWSRoOgKhcFOC9OvzEYtxsXc1XueUUs1ijUrpGoCFEKhb4pXP50Ej457fAGmN/z9KGKsHhUk2qvqhaC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=bJs/pmfX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cn8rD2t2; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="bJs/pmfX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cn8rD2t2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6754uRkV3419307;
	Wed, 5 Aug 2026 08:19:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=fxO8ODVLncKYQaZd
	6DaQrzti+zDSh8mCEcr5D7sUp5Q=; b=bJs/pmfXXbUPfRxCakLkK1d4HclkIe59
	QOZBN3PHlCzfUn/CnmB37NZIOL+iXxmmcAGHp0OiBf6+j7adn+91dpU0ALEDnCeJ
	aB3Vyf9Ez5Vx7mb0zef0aQHqJFEZTL+RZlpJps09vOj3qYPCZ3JuViWfDzz+2IPK
	QfwqRc8khaNmfQ5yq3LB9A4LtJZpZZC2VKMKsQowHiXAvnAf0jO/hAfq+rkSjRqw
	qF3tpM13Hb5QRvigMZtyjHlPWanKSnzzlPU6ctJH0im7FvfusPjrp51LtiZAjUqr
	XofPVsEJBMdvcJbTSLYXEOWOzZEa1nj3A9uiOcHasUTxvALQUQDCTA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022077.outbound.protection.outlook.com [52.101.48.77])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fse6vnpgp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 08:19:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZGHyd8NJoe4GDjjOwVB7FS83q/2Z1E14RBosS9jPiPiRROGJjGbuEoryFCp01LpvfVb4MXs2V+1sh4dg1uatygMNqdOw/rRMN3X6CPRquhEpQgymLqHCn3KZPY7nnHukmSXZqup/+HBlI3DNNmHVNd/J+qcDw+mWa9NtHDmui2gkE62w1xaSsWikzpemf/rjFYwcc3VhjiRByRj68TA0TYhnSeGowPX3u8dlsWXV2HwO+IofxKWxJrbxjiYVWdAe5JdKZSDumJ2j6WNClFO/N4dAEFcqSIW0MpRZhuHYXCT0Qzg+beTgaJRQRFlbQPslRbb11aBchhgo2qAk4ot4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxO8ODVLncKYQaZd6DaQrzti+zDSh8mCEcr5D7sUp5Q=;
 b=KUrUX/7/I06DVn0sRufew1qbVD4OYUQ2vaZQBAfj09jAxwuxWPA9B1QTLobUaU7mJUets0HWxDkiTFeaeq/AL7UUXiVeGWXvBXUAceo26agXhPrc0nT5PJZwQuK0BX22/oZKKngbY1tquDYBXU+OgqkF0ogmxxgbD8idn53ho6E/Vf3LszAIZt8ryLhuPHJJt+CSUZqBzBLz8C/0Wxk/6MCNpJreztksRD+42KCgyNbaZ7URGl0YEgcp76xuCupxPzQrBk5IjvnhvKVoxSAcQ5sfLDNV5r+sxSLRiA9EjOCZlF4NidaYfqG8LhUN0wRgWBn3bycbbcfvlLAFMVl71g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxO8ODVLncKYQaZd6DaQrzti+zDSh8mCEcr5D7sUp5Q=;
 b=cn8rD2t23HFuD+AQI1vsRtwgKVU36IZKuUgldSI0ig1NH9fJ0GBX6L3VTI4hlk7ZO94vpJNbG5ASBkCMlfymUV9hzcW0rkm/J7ZWveS/SzNv2XSC272BekqhocH8f9mQEL216Ch2IH5OicFYCaqwafZdnVpfP1xJG0dYOuEYHYU=
Received: from BL1P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::35)
 by DS0PR19MB7296.namprd19.prod.outlook.com (2603:10b6:8:11f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.20; Wed, 5 Aug
 2026 13:19:49 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:2c7:cafe::66) by BL1P222CA0030.outlook.office365.com
 (2603:10b6:208:2c7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Wed, 5
 Aug 2026 13:19:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Wed, 5 Aug 2026 13:19:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7F7B5406544;
	Wed,  5 Aug 2026 13:19:45 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 779E482025A;
	Wed,  5 Aug 2026 13:19:45 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH RESEND] ASoC: dt-bindings: cirrus,cs42l43: Add CS42L44 variant
Date: Wed,  5 Aug 2026 14:19:42 +0100
Message-ID: <20260805131942.45729-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|DS0PR19MB7296:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fb7aa8f9-5523-4889-085e-08def2f4389e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|61400799027|82310400026|10067099003|11063799006|56012099006|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oNbh0No3Y7QIXNIgx6necVnZC7Js2CRqbpJgE2BcYzeVz016CRlL138Fhr73FbEpZLhs+raY71O3QQK/+/Enys7lvhXXoCdjSxhHNjDCTrHIrPYZvoY3LZgF/5f2R+ieiRbawV6NZZEw5j05I4CXWvXqkjAZloHG0+MEdqBftiH7fwiAUi7ikeo8DtS0cBpb9+9TBBi8Pd9zDRIC6dw5VqpNUJh3jbJQdGEawzYxMgQPitKAaKeHXocZLhgJVzJ1pd3kBi8FXr/s5HaQJ3rCiVSKKDe9bc6N+J+R3yCZXDjF6RBSlFhgVpQ6wZEgPGQuPUAVs3MLZ+eK38b8f/tetZ6vPeAr0A7sjYi2tj58SJryk8KMvvKw3VSTfPrZR75zD4SFY2JsByFut9fM7o01wET5n3EsKHkZtL/uCEBnvzjGpdP3aGly3JoZR6aLaKiWoAd4KRZCI+EcWHqJBLb2BlCh8uN84jkdvF6OJ668AJWbuygUCqIueA7DeKg6WpFV/SNn2qV+LRq0uADNQWSheX+CRvx0hqMD/OHTYrIcRLr37WCH+9xm2kkDIivmPuI6Xc+LCrfj1RMgS4z1zkdJ9c1h84wFDxTH5rDZnSOiDYPtoIND+qJDfPjGN0f3ZAwXuA1s3HNLun8H5iwFNlIQK0Xk0hfbmcVKniu8qc+hBJUgJnAuLGWW5eslTGcmh5N7aY+euoD78kuZkAjbmb2HKw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(61400799027)(82310400026)(10067099003)(11063799006)(56012099006)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7cNycOHdQKlYXHLURsbxgRclbgE/DoQGWFF3WGlyHpbYJ4VXv21IeYOR6tQ7z2u9o8nkGCOm9lmPCTiOE3IWLQUnu/pZzak/guebwmWqJdakxeOwg5zuXpPIHAFP/7ce3tbL7CxIgZh9hc9qEVNr/ROH/IiYHvyJDy2IQQcZ+VkyVWdTNhNiaZKhoL99fvcHfuVHfDL/44Hm08bIK+crFzWMgqpKxF7xkpnEPimj9WzjNGdO1VcOAi24fprqNl5tgAiMcO/PAlWrl1kKkDoDxsqIdxQzM7DS9KRj5piX3BdSCJu7rtdN5KPIY8B+VTSZVtAVpoY/XFrI3w1S9064HkK9WU51W0XgsbPTFrQ8ggsYihyco/lJXkTw1FjXgad9thq0mxSZTJ7h9YA50knFJN17ufGI1NVOq1tIAVJ8F5m/dZP8CYcCBXxQUoNIG2aK
X-Exchange-RoutingPolicyChecked:
	NiY6nszPbE1dNuPx8vIpZg8QQuCkfoaJQgsIKSlZK4G1mUjKbYa08gWHW4Hpv30BpXDhHw1p7nsB973NcjGiiPBh0ICVPaLHtovo+7rgg0XQlZWj1VSU3LgX2ClENRUQMGDAZOjlkKVeR7+ameGiaTgpS/j70CUk1o67sprgJVfEczqI/fL41Xu07OYokp6GN8hhFe60OdGhlWwYBN80zSXRwS3X2FeNRymPiIaULI21QkA3UFWOBcE5M4i7VCO9Gr+ny4HqKQBXrvOpPSntVLsh2dOcBBNZZE/wRq2GobYKDADztr5RDEC2b2iiy3LkAGgdcVZ1XnAoTfU6H6iVoQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 13:19:46.6943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7aa8f9-5523-4889-085e-08def2f4389e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7296
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwNyBTYWx0ZWRfXyCngmfF4yl6t
 Am1UPCzQKYsSUaGYiaCZRePvHMfuBlCFEJY9N6LjdujQTdVH14tRyR6tO9tzu066N80AbvUs5F+
 r3e+9D6am0rjBjG3DggZ358VkVPq2UI=
X-Proofpoint-GUID: Uh744n2xsqPMUxE0vVLaXkRAQSGq6MV4
X-Proofpoint-ORIG-GUID: Uh744n2xsqPMUxE0vVLaXkRAQSGq6MV4
X-Authority-Analysis: v=2.4 cv=N+MZ0W9B c=1 sm=1 tr=0 ts=6a733879 cx=c_pps
 a=PNgX5FSHJLFuI9i88Gvv6w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=QZfuP0Nyq7hm_8PVBEYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwNyBTYWx0ZWRfX03A5jFc07Gbq
 VumZK3YYFf60qZaeQj/bU9sKBNoZDSPJ5XxTssaXFJyb85hDK8aF2ZaiOB0S3dKxbzhAEsxMs2N
 CZqs8a4IZgJUiIJa2hfOJ0m/pqvXP8n193gBftLCxk3TMj3/Olx5ijq0RpfwH1V076qfY329eLq
 iwpB8j7faIBh4L/zb2i+GLoBDruW8ImH++2Z+uaexYubrqqKcEhKseVZFltwy4+nWd1aRKgfais
 BMjDwY/3VArVA07+109D8gCu/X4nt+xqI/coSzKWSd8NMhcub2XdZLiSqcm8ClzzGXAvczlqJuz
 EcQDhuO6kjWzFUT5twxooykLBGS33L8v5X9S800sqLSrJWduYs1hc9d7zztPtD0Y7u12TeXqWJn
 HAQ9s5ylOgKZNH3ahVebwHA5NYmhlzIjZDTb9gTGJ9NRS5Sc8I8U0OX9RAaZaD1vEvlMhZpYJ0F
 tVjjXweVWFHryK8GtvA==
X-Proofpoint-Spam-Reason: safe

The cs42l44 is a cost optimised variant of cs42l43b.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Resending this separate from the MFD patch, the MFD patch is tied up due
to some conflicting rework going on of the device tables which is taking
a while to get merged. However, there is no need to delay merging the
binding change.

Thanks,
Charles

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

