Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795186297;
	b=0nbXtz7uIayaGhirjAsl0SWm/NjMECkfSoVxuQtJhYQfG59KL0aWcelAgbnhPSiNrx+7
	 yaf2a2sbWFP7RzqfBLC1Jzr8Ww/o6SZxN14mkfRzaY0066KUSNA+qBoTReoyzDfxQ86rO
	 bU2IY0hJ14tZYZe8Rx1CdWqUFp53ELDNpBH+YTVcnEKGH6l54WVR6U2E3DKPqCCbQQDrN
	 whZkVKGWTVbeTu2a8TGVHgrStw9zwYYoTL7gpqH2Ci4iWB5ttHws8iNmSSu6GtgTPJPjG
	 8G3HgZTAea2P8cFnzd7MwKEh5D6Rrx42SCN3xOcLQkJM/6A8RocUuUOLxyxuJO/MN/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186297;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Reason;
	bh=Boa13SeQIgFGIIXOOj45c+GzLDjd7vhHwkFIC/FOx/Y=;
	b=dI06ZEny4b2+kg2Yq67T1xchJtqQYrohTkJOPXkbdmiH1EhXS0hR6uF9yj7P9uDaLaX+
	 YSQ3rlDT5WH2ovD8mkCPNzm9aknjs+FXEmdl+jUuvt1hcXQz0eb7j6riLsZFOa9CEjjNo
	 Ln0NJIVvKjnUlr6mw4z2VRauLGF3Wj+KGWPi/o36j+W1D601kozmiLV3p3Brtc6AdbG4T
	 Sfj2BGs8Da3tmJV/qcedNGAl7NHsuq+wS9MXtEYmObwy1GjgAIEGRBiaGOk+l2hAyTRl/
	 QXhs7KrVBOdhQRZWvRjHQt1CUEGuJTNBRw8rwgYNgTZhOe+U+EoWmIEo6PXsoWLv46w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="RvKy3c8/";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=S7XkBEVF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB65606A333;
	Fri, 20 Nov 2026 14:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACB65606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=RvKy3c8/;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=S7XkBEVF
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKDTE6s2885874;
	Fri, 20 Nov 2026 08:51:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Boa13SeQIgFGIIXO
	Oj45c+GzLDjd7vhHwkFIC/FOx/Y=; b=RvKy3c8/YEAMxYwGPL8bmuhaEpBJW6VF
	Zj5a2GCvoEfBpdTVgerxy3qmHs9OQEJWedC7DsIZSPxlPChUJ4r+dcWLx31T8JFf
	JdaiokoAIZHuFM4gE/HHUhrO7wZv+I/W7HFxd+xAuX6SFjHgv51GvVEqfm5D4Se+
	KzZVNM2xDqvwJGkapRXPYVwvVaCHItBN9hzx4Pia37D/LhSaeQJi1PW0vtEV5dik
	NXWvs6a2ruEvuiQj+XzCWe69SaXtHSLpCR+V3dr+KVreWg095pK9X5ldksHJ0R2E
	2ABRuhsT1Pc0xDAoyrbF/OR45absOX8gKJgVLiBKdxqAHjkFK2nDNw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020083.outbound.protection.outlook.com [40.93.198.83])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j24prhpqh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 08:51:23 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RoFfk6/8NB/qhv7FmqsEZx2bzQVJOOcNWpktD2d/s3hm3m+CNBaS+thwFtx9ovjiqGpiMkN4eU5/3cDXffUSASIW5m2JrtFlPIxYhY37EHd96IaPI9tC6c6MhW9BQJjOoUnIr7u4MoqjdXr1ROyWNeR5D6oEywhBH3k9abuz63Yp2s3TEO4B04vBOmwyruH0s+AUhKgfvXYllTw8Lr5WCI6DX5FNQtTxFdZGFRgE9rko9WgV1Qaw4r0vizIc05fluLe5/IHB+cah76IQ4fhq55K9Uir3FICW6d7YHuPaz0TiTGH7BVQTF5AWD593U/97DuonIqQTdBnu6N590xpPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Boa13SeQIgFGIIXOOj45c+GzLDjd7vhHwkFIC/FOx/Y=;
 b=s0pqpKQOywhTM+J758FsZySHO2OsDxaLBG+a1UORvwPZBwzUNZp+q4R4A/OzV/ewj1qJ08sLwDOi7viw+3J199NKmJSFgeQYvkvoFZT0hgUYLWdUrvJ10qzYn6TlEgzs+744rKQQnLVf5fdvHrFCJ7ijja2jwF2T3W32YStE66HVE2fHSyLjlOXxHSaBdBulWZE5UZLqXkl1pdj/LLBpnqQqs1KAML7iQ/kfpCKufoTXCiMEfwETDTcJcmG/AJkGLiVHld1rSAZqtRukTTNg4CvIjTM3wSLKjDjVj+LzwS8msmk9k/WR4Ez+1uTLt3aS+ohWMtt+VquDob4uAILMvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Boa13SeQIgFGIIXOOj45c+GzLDjd7vhHwkFIC/FOx/Y=;
 b=S7XkBEVF4yM4a0hB1XSuIcNr4VpYir66ft0eLPtCeR67blAavEiyIR/WbjA+CD+YL8qvlzhOVpRDX2/5eONiHVOR0JowAq1xzKOFF0a4xp968DOMh11/xZUama5xz9N4e/zud/oUTlQYiPYiytT+9wKty5PQ5E0BD+twO0CQ3is=
Received: from CH2PR04CA0013.namprd04.prod.outlook.com (2603:10b6:610:52::23)
 by LY0PR19MB414722.namprd19.prod.outlook.com (2603:10b6:404:227::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 14:51:20 +0000
Received: from MN1PEPF000793FC.namprd05.prod.outlook.com
 (2603:10b6:610:52:cafe::2d) by CH2PR04CA0013.outlook.office365.com
 (2603:10b6:610:52::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 14:51:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF000793FC.mail.protection.outlook.com (10.167.249.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 14:51:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 826A8406545;
	Fri, 20 Nov 2026 14:51:18 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 73FEA822549;
	Fri, 20 Nov 2026 14:51:18 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org
Cc: linux-sound@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2] mfd: cs42l43: Stop using legacy SoundWire IRQ callback
Date: Fri, 20 Nov 2026 14:51:15 +0000
Message-ID: <20261120145115.2256537-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
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
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FC:EE_|LY0PR19MB414722:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 14ec762e-3863-4c55-d548-08df4715bd06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|61400799027|36860700016|6133799003|16102099003|18002099003|11063799006|56012099006|10067099003|261022075727099003|261026121527099003|261009223027099003|261021123027099003|261102123227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	lUJX6TMxB+i7Mf8d70HrdycHoRT4mq9AgTVkQhRE+KtXn3rrcb2F60Y805lNJVGPXDq0mvIu37LyLHXhh/2ZIiciXFPgKSBrQQb7s9NjrX9lZ54oMoBktjtVH/i7Hzw0nRLgQkNhsOMECKVxg4+zvZGxB3pSzLwTCkUKzv0bwtkKg3IHJpbML5mcHARPrG+ETSpgB5tooSezK7/GF85wnehbTY9SDdcfTNhe1vUmR/jq/BH7AklyQ4ZKyg7GjuuTvgkzyeiNimqP6usaBg5Flb4dyM9BpcyHGIqEMxYFOXW0lMMPZjCXLK6ZZgXocjFLeUVIi4Wcx+yki0QTy5gz75pxqHcL2iq97YZBTbtNefWTHDY/RaE8/2WHZ9LkfsG+lTUIRIv8lGL4hnCfheLRmtMXcH2YMBDn1NmHTszaHQh2rnmLYMnPBsV0dTo85PIZbZGDVG+jdJLsWeOwY6rXpPlnt44qliiWyJkF6tAJJ6jHXUczBSywoYbjFOmivvWgADdePrEgdkukCDx4mcFWXkBUhrkNgSx6JFnh4eUwqhPTJur4mCJqElWUOWf1FNPc3tR4Ld9aYGP5slXxi0vAsQXzk/c7mBgdROv0LR2Qp2scYQcgsP0BZXckGLuGBbiMhXt645R2iUrNbe5ebyVDa2j6K4XUgvUDNAVo1HlL7lWkAmKSqsLKlT76O3RXw118hKLKGOSptfP03iXC4CbzNg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(61400799027)(36860700016)(6133799003)(16102099003)(18002099003)(11063799006)(56012099006)(10067099003)(261022075727099003)(261026121527099003)(261009223027099003)(261021123027099003)(261102123227099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eGrmpQV6mRKe4f4W1M6kGoOayEeh+HNN/noDrs2S2qOuMQFcE9bTGLH6VwFBLNQOVOUSHeRdIF5yIKC4iyC2MKLcj63LdMhjCcL272ILYUqwPFPDmSDwuQrLLhYmYpi4XMZCROARhlNsbNHwUY/ZawHb5TmQWaveRYRizaiaXcE73A6x+zPkW6CTNp/xxQWVlyujSG7NtKgZqbCaeScs5LZS+cYLyE1KQ1fkIa3f2r1NnBY4PF+GH6TRAJ6B7jrsGgC9fZ35HkTyyhG/OJHp9ous8B+niuMqUnkRsAP6M1aFYD+Pl1L948C3v8nnwMXgBAR20139AeN0d8NEvr90civiTLDisDk74K+63hQGH74M2xv3h9zvDO5vU3hG8AboWfxJAdkOkZBh8ZCU3HNK+j6u1VoHgiI/5YgAspvK8L9BNHy3XDNAAzCKf1cDh2Ms
X-Exchange-RoutingPolicyChecked:
	WOyiX8EciLdU4WlFqlKS0rOK2sh+UZjwg1LElM8x77kMKHBNrewq8oZ0sb931sX1/x+2fHvMLgy4Jaq3+kNjuEd67UB909dkzvn5UX5qQoPgVyLgWNwtQMFCWiSWUInJBlo7qEVDH6Avp3cG9OL2PqbmJn48NXaQoFFkgxQ+reeCUUmETItmdP9lYCrbE7U+zle/G6CIP7MZ4KM506um14wPFfXEc002mx5I5WZLsDRZb7J0e1wsmTj8/aZGxM5sfbyUuWMxXr3YD4oYMSfsq73WPjg+u7VM1CK65/4I+xkrkyEafMaw5zsp0GC7yQcOeXP9JUJxFyOYTPNSogs4qw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 14:51:19.9069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ec762e-3863-4c55-d548-08df4715bd06
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF000793FC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR19MB414722
X-Proofpoint-GUID: f2eWBHV51-AP57spBbXixWUs8qO8tyPz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1OCBTYWx0ZWRfX1ulSAhocjoII
 rE8zExWL5GaKPoUplwgJLXZL1VKOAl3FdwabfAC64iwQbOPlSa8GU/G78WsLWvZAocNrEWWUK/d
 HSK+0QVSJrWfAgvxN2dY720yqYh5q1A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1OCBTYWx0ZWRfX3PM06uNjvyqv
 0GCNHenS+4zGRldomfVrZuc6/mTJpm9InDnES687sL1MV2aIe2LuEDBkm5U0DoOi+FF0MY6Ncom
 so6IAssX+7x2LUztz18Uq2sEMwcR9fPjM1e4H707eqCnWPgoXwVZ+XXEh2h+i23sNvFxNbx8Yze
 YyPcl8FPgvNTAFfnE46ga3rcnXvY7TYFr+YTcKV3jYz2RhmTVNOHAdRbwZyrluKoSK450MohMt0
 2cbaEWyVIMedNRnU/j4+4MUJVJC2ApRpIn6t+BwrVNxZFMNA6xaZbt4V04Rwg8Nc/c3JnbOktwg
 J7/qB1aUTKuRdTVTlz8ict70Ot2SyGfs5oC9HQOGR9ydYsJus0lYi3znRPPabz07AemQbAxroOQ
 h/ofOSID/KWAKC9ZlgAfzhl77fVs9aiFxc1uMRcVuoZh29UrnjnWueJKhjJez3LMnw+cxz7JjYv
 9Njr+KvP4WEN49zh41Q==
X-Authority-Analysis: v=2.4 cv=afr0Dhot c=1 sm=1 tr=0 ts=6b005e6b cx=c_pps
 a=N2BSJ/IBjBq6ipLGDtrT5w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=s2vy8z4VUVnIkbW1dyYA:9
X-Proofpoint-ORIG-GUID: f2eWBHV51-AP57spBbXixWUs8qO8tyPz
X-Proofpoint-Spam-Reason: safe

When removing the cs42l43 driver on SoundWire the core will warn of
too many retries on the SoundWire alert. This is caused by the use
of the legacy SoundWire IRQ callback to clear INT_STAT_GEN1. This
implementation defined SoundWire alert bit is used to tie the cs42l43
internal interrupts into the SoundWire alert mechanism. However,
the legacy SoundWire IRQ callback is gated by the probed flag inside
the core and that is cleared before the driver's remove callback
is called. This means that any IRQs triggered during the driver
remove process will not clear INT_STAT_GEN1 leading to the device
being stuck in the alert state until it is removed from the bus.

To fix this issue handling is moved to the regmap IRQ handle_post_irq
callback which ensures that INT_STAT_GEN1 will be cleared right up
until the IRQ itself is cleaned up.

Fixes: ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Correct commas to semi-colons
 - Add fixes tag

 drivers/mfd/cs42l43-sdw.c |  9 ++++++---
 drivers/mfd/cs42l43.c     | 22 ++++++++--------------
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index cd0132e3632be..72833333b73ca 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -112,9 +112,11 @@ static int cs42l43_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_statu
 	return 0;
 }
 
-static int cs42l43_sdw_interrupt(struct sdw_slave *sdw,
-				 struct sdw_slave_intr_status *status)
+static int cs42l43_sdw_interrupt(void *data)
 {
+	struct cs42l43 *cs42l43 = data;
+	struct sdw_slave *sdw = cs42l43->sdw;
+
 	/*
 	 * The IRQ itself was handled through the regmap_irq handler, this is
 	 * just clearing up the additional Cirrus SoundWire registers that are
@@ -155,7 +157,6 @@ static int cs42l43_sdw_bus_config(struct sdw_slave *sdw,
 static const struct sdw_slave_ops cs42l43_sdw_ops = {
 	.read_prop		= cs42l43_read_prop,
 	.update_status		= cs42l43_sdw_update_status,
-	.interrupt_callback	= cs42l43_sdw_interrupt,
 	.bus_config		= cs42l43_sdw_bus_config,
 };
 
@@ -172,6 +173,8 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
 	cs42l43->sdw = sdw;
 	cs42l43->variant_id = (long)id->driver_data;
 
+	cs42l43->irq_chip.handle_post_irq = cs42l43_sdw_interrupt;
+
 	cs42l43->regmap = devm_regmap_init_sdw(sdw, &cs42l43_sdw_regmap);
 	if (IS_ERR(cs42l43->regmap))
 		return dev_err_probe(cs42l43->dev, PTR_ERR(cs42l43->regmap),
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index a83b62064dae6..e568cfceacf55 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -515,19 +515,6 @@ static const struct regmap_irq cs42l43_regmap_irqs[] = {
 	CS42L43_IRQ_REG(HP_LOADDET_DONE,			HPOUT),
 };
 
-static const struct regmap_irq_chip cs42l43_irq_chip = {
-	.name = "cs42l43",
-
-	.status_base = CS42L43_DECIM_INT,
-	.mask_base = CS42L43_DECIM_MASK,
-	.num_regs = 16,
-
-	.irqs = cs42l43_regmap_irqs,
-	.num_irqs = ARRAY_SIZE(cs42l43_regmap_irqs),
-
-	.runtime_pm = true,
-};
-
 static const char * const cs42l43_core_supplies[] = {
 	"vdd-a", "vdd-io", "vdd-cp",
 };
@@ -917,7 +904,14 @@ static int cs42l43_irq_config(struct cs42l43 *cs42l43)
 	if (cs42l43->sdw)
 		cs42l43->irq = cs42l43->sdw->irq;
 
-	cs42l43->irq_chip = cs42l43_irq_chip;
+	/* Manually fill so extra settings from bus are preserved */
+	cs42l43->irq_chip.name = "cs42l43";
+	cs42l43->irq_chip.status_base = CS42L43_DECIM_INT;
+	cs42l43->irq_chip.mask_base = CS42L43_DECIM_MASK;
+	cs42l43->irq_chip.num_regs = 16;
+	cs42l43->irq_chip.irqs = cs42l43_regmap_irqs;
+	cs42l43->irq_chip.num_irqs = ARRAY_SIZE(cs42l43_regmap_irqs);
+	cs42l43->irq_chip.runtime_pm = true;
 	cs42l43->irq_chip.irq_drv_data = cs42l43;
 
 	irq_data = irq_get_irq_data(cs42l43->irq);
-- 
2.47.3

