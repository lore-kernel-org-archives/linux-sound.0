Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EBE35B64D;
	Tue,  3 Mar 2026 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544286; cv=fail; b=L5Aj2f8X6wVQa2t8KgJxbiMGukMaInnVgJpvIyxQhOrlyNnps7gvsA/Wdi2f2J6oqk84kthF62/jgBR+LcFESU5axj07DDT0dX9YYlIy6VhsLzqcLIa4e4T4Wf/5V0q5trAFVKIK06YL2IqhGP6eR+t79mYiw9N6IDcDbTEmUuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544286; c=relaxed/simple;
	bh=xKhYqn2Olf4bNEXLaC29BdWmUg1UPNeJ456n2deqyg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MBqIoCFdZVNiDcUgtKVUTPDaccf48LSKAl0K4c1elEkLQdaipIq7cOtJyVCNRtHKhDeAq/Bpna74HDt67JOqkmBxa8l71vpRRv9IU8nSG+CX7DUjQtsTZm4f3UJsoBoicu2zMPhY6IR0oZ7fYdgKVJUSWrlgklHOgbmDW57+9/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Z8Xh/IpY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=J19h/jBs; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Z8Xh/IpY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="J19h/jBs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234i3Oa4050486;
	Tue, 3 Mar 2026 07:14:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=5kJvh8bYOjV5dVjX
	G0TiZR59GBWlEObHRRfS4xhyLD0=; b=Z8Xh/IpYI77qSGL2qWLIqBPhXJx2ZG9G
	tCZPxZ9gsueAl/Prbr2n/SS2dOJJ8FRRluvcPDpJIbYm8lDd1vFCYcigQRwKBIgN
	dpmO67kyhtfn9rObTTAPpUjJKHDNlH/eG3Zws/masWnXd+Nj+bpQ2XyN7FYnR+zO
	oV6F0ioqFCpr96UYb0sbzFDXKCRu4lbv/+zpk8ISsVurO6tplVVQ40R1Klugeio7
	ZpO0VuGICha6iyhyTHR/y71nKu1bPmkuf8fdE7EtCMbgBGv2owlo4e968/VZpAt3
	7aD7KRk0Pu0/eM/8WtMaOmKU5TNdXgw//KX91f+3ladVKX+5ylwe2g==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020072.outbound.protection.outlook.com [52.101.193.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ckwnn3at4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 07:14:47 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aj0YHj/orCj6DiSzMZY2J0H4lvkLuMI4bL1f6HCOWdXS8v9PCvfRMHJIfMex7KoYLPa9hD/08CyOA9zTnUwn9EZmfwlHHcOBwECzVvnaTmKdGE+OkwxXcPKq0UCAgGkfXNvjlpBm7p9RAFpafrFtTTtSu49iPEa49gPNQwzm8rAtsxLq9pkfFf9Fi9Y1AUKQl6SmYpMVgvlI7BuF0SacGDmOKz77zJ6IN3lVXQzo/I4JBhFdy57xcSeXQyOhJ/0nTGKdiu81tmVJyGnYYBxdB91JO/Y/PpjUXK+dfm26KpiBgRy7lNV/DOEQtyb8AGgy+22lt9S+FmtIMJEOcLqFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kJvh8bYOjV5dVjXG0TiZR59GBWlEObHRRfS4xhyLD0=;
 b=GpJQsUl9qW1X1llPjWayqbpw393CEbPwVxljpBcygQM42WANcjC18liqDYy3BIyPLk4zEXeuLgvhkMrn2HYlwJXfW2Z6x3dc6BEbgTBNtr5j2FEpLsew3+rPCXae7CARQNyCVFXOTkjdic1B898ZKaTnvcHzxF91WmNahkC+aOYIwQ1hIoTHPKtNjvgS7m2S3+eeGg0MMoKVFmMvxc+ruBcSoJ0+K1tKef0R0opGxgB73OOHcRaj2bQuA12TqtghrhjrMSyXnWlPzzKs389y1lrXxvGLTgpxQgewpN6a0mLI0gVaJQWx/sNF/QWA8keAe5phFgRjURSijSs8sx5jbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kJvh8bYOjV5dVjXG0TiZR59GBWlEObHRRfS4xhyLD0=;
 b=J19h/jBsxlFoSd3Co9MCgW6maANexe6wa49xB1gBXa92e/bAiprpGQguZNVzcHGlq7S5wEagcOsXfTLcS/Jnq8rj86IlY2M7QJbDIISZxV6KGQ2VFShPGHf1buGSi5w6yH+HLxt1dTzAvd6jTb+zUg4+1/7XV4TvCCVtV95t1U0=
Received: from BL1P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::15)
 by CH4PR19MB8729.namprd19.prod.outlook.com (2603:10b6:610:223::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 13:14:43 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:2c4:cafe::21) by BL1P223CA0010.outlook.office365.com
 (2603:10b6:208:2c4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 13:14:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Tue, 3 Mar 2026 13:14:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2D595406540;
	Tue,  3 Mar 2026 13:14:41 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0C99E82024B;
	Tue,  3 Mar 2026 13:14:41 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56-test: Add test cases without onchip pulls defined
Date: Tue,  3 Mar 2026 13:14:40 +0000
Message-ID: <20260303131440.574690-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|CH4PR19MB8729:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: baa24ecb-c8b5-43e2-b1cb-08de7926d544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	LEcAv16blTtRKjI6Zd6LYWY7F3uUlpKzCMmky7kz9XOzBguf91wJiMftrXtbGL7dSx8ss8PEcQ5guGTE8Gt1QaLyoTsbYmGjFZ4TXYNxSWX5ZX+p/TdZmhORSmDZJDHJoEDKiu8dSA8jK/4mueiZzl3TxrxE1pLG0N4E1ebEZIu+PdFoY2DZtNze3seZc6fiqPG1/PuZNsNQ3MKA4c2cp31FTP7tDvGPyLhbgX3kXNjk01QEQzHdepu1PDOnZwPFLNL+8hDGVYHDrLlU4HY4QjRx2pSpOcJAFlRL1+MvsglMLDil+FzYlBd5aepSAL0o7axGlHvSJG3pL6N7qLL71HdA16gRGKX5J0r8l5jX8o1rTbnTnmVWAhbnLurHxvWsihfKvj6DxxgMLSY72W+PxU0WuM2cwKnyVm7MRwK/+ckX1lAMHA1S2fWQCSwtOYTdV4crSa+TXuwz9WAXScMZ1NpOiRj4GhoLAjCEIIvvRC1l/buYN7HYE/Asft8GAsf4ghtQxGtQ/7Y/n3lSAP+7PM1Z9Y9rGzQwp5kpHKYW9Jsn/9yGEkKBPZe0aVgupOBajwbD89T/WYUruSF6V4o/lTjZWgsABG2Kkc6NjM7do9ZLSeKLyxl/q52XoTr+Q6gJ1XoG//vykTTZPRMLbiJt+FXrkvqwxc0gTBFBSdRl/MKDZIFUkiqp2euHAdMeVziFTtpZVrAouQRhLbki1e3QM+8mYujYA98jD8AXGSlpUpU/vWyH0CVqAVPijiSol59tCUssvS7Zbe4ZrFa6JuhfUNNEcK+Py4uim0utCeHAjzMHi7ib/4mZx/XF5sCLCh84UCUgwxvxMRlhfiaamge31g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UHpYApLaSw3Pyb10ijtwfI/KPZ6FNMDYAo1IwhoLjwvTtCHs21+Msp6g2xU4Awd2aWb4X8ESqw5n8AgtnGBk2Q4WcP1HVRuN/4Mbb/hDJzxhfTUURlITS2SHtMas1gZ5TcIV6HnpbFcZ9R0SxqbMsgfOumCFnuVjMygVUSVI4p6oMLiAsEQEIVFhNcCZlbuaha8U4rAzGCc8N2teNJ0mnljTHiWiY4E+/IBDijRfqoYvijHiSVWU5JtGa3/69fZlbsnASSNFmvs/ypsOOywXcvH2cAGaI/dcMKip69WX0XZ8qQ7lxInYeVBgVyvV1VlAT8ZGOTqV9STGzHp9rkums9xcpT6tw9r1+l7agXJQNoqNTu1LMFWXGaBs7k1zU6LCf6VPlAjIISK8rm713X82gYPmt6aVjkHDCMOMi9Z6qtKD6OTFPAYPOQuIr9rtP2Ix
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 13:14:42.4896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baa24ecb-c8b5-43e2-b1cb-08de7926d544
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR19MB8729
X-Proofpoint-GUID: 4TLPnqP8leha9ZJKLJN9dSbexm7vohKI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwNCBTYWx0ZWRfX7xTmYVKiv6Gv
 hs7yhW6yYil4QLST9lYwp15l5FcVo1F5oPaIiGj7VCM8KhZ63GErIwvpCdjv3sMTmyjCyt3lzY4
 Pn6LNWC5dbT7YsL3gFQMaFbOe2K/WY+jv23xNhDgf6fD8vouDarEn7i9Lw4A9TGUvBroIeff43t
 c5L0p2JPD15HLeipNC9s6o44oFUIOMrKe1t4iZRsJYUozG/v/4x+8VYB6YAbkRf0iyraVBE3GHN
 +0MvvChe83dByUqUaOIJrsYHg6U6PQTvF+0gTa465GggNvouKf3b0jDnjXimwuZVqADLGeBSCiO
 JCMZs+KFid8oPf4nvM4n15A3dIDjWAnN4/pOKvjfUjYRASDYJD3Io3+yWSddEd+XM6vqmTMfur9
 KAQJeLFxlQxYCjhcjRIZFShSc84h2rh6stlDN9irZ5ujvhYl3M+MGUMUMB/Gj/RhzqQN3E5EX+G
 p/le2FPhpU2dFlcGWeQ==
X-Authority-Analysis: v=2.4 cv=ZaIQ98VA c=1 sm=1 tr=0 ts=69a6dec7 cx=c_pps
 a=Zdr5CJPvojCt9J1NFubJrA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=9FuS7pJO6TG15dDn8OMA:9
X-Proofpoint-ORIG-GUID: 4TLPnqP8leha9ZJKLJN9dSbexm7vohKI
X-Proofpoint-Spam-Reason: safe

Add parameters to cs35l56_test_onchip_spkid_cases[] for the ACPI
defining onchip GPIOs but not defining any pull settings.

Pull settings are optional because the pull should normally be
provided by an external resistor.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-test.c b/sound/soc/codecs/cs35l56-test.c
index b6c8c08e3ade..decedf76847d 100644
--- a/sound/soc/codecs/cs35l56-test.c
+++ b/sound/soc/codecs/cs35l56-test.c
@@ -541,18 +541,28 @@ static void cs35l56_test_gpio_param_desc(const struct cs35l56_test_param *param,
 }
 
 static const struct cs35l56_test_param cs35l56_test_onchip_spkid_cases[] = {
+	{ .spkid_gpios = { 1, -1 },		.spkid_pulls = { -1, -1 }, },
+	{ .spkid_gpios = { 1, -1 },		.spkid_pulls = { -1, -1 }, },
 	{ .spkid_gpios = { 1, -1 },		.spkid_pulls = { 1, -1 }, },
 	{ .spkid_gpios = { 1, -1 },		.spkid_pulls = { 2, -1 }, },
 
+	{ .spkid_gpios = { 7, -1 },		.spkid_pulls = { -1, -1 }, },
+	{ .spkid_gpios = { 7, -1 },		.spkid_pulls = { -1, -1 }, },
 	{ .spkid_gpios = { 7, -1 },		.spkid_pulls = { 1, -1 }, },
 	{ .spkid_gpios = { 7, -1 },		.spkid_pulls = { 2, -1 }, },
 
+	{ .spkid_gpios = { 1, 7, -1 },		.spkid_pulls = { -1, -1, -1 }, },
+	{ .spkid_gpios = { 1, 7, -1 },		.spkid_pulls = { -1, -1, -1 }, },
 	{ .spkid_gpios = { 1, 7, -1 },		.spkid_pulls = { 1, 1, -1 }, },
 	{ .spkid_gpios = { 1, 7, -1 },		.spkid_pulls = { 2, 2, -1 }, },
 
+	{ .spkid_gpios = { 7, 1, -1 },		.spkid_pulls = { -1, -1, -1 }, },
+	{ .spkid_gpios = { 7, 1, -1 },		.spkid_pulls = { -1, -1, -1 }, },
 	{ .spkid_gpios = { 7, 1, -1 },		.spkid_pulls = { 1, 1, -1 }, },
 	{ .spkid_gpios = { 7, 1, -1 },		.spkid_pulls = { 2, 2, -1 }, },
 
+	{ .spkid_gpios = { 3, 7, 1, -1 },	.spkid_pulls = { -1, -1, -1, -1 }, },
+	{ .spkid_gpios = { 3, 7, 1, -1 },	.spkid_pulls = { -1, -1, -1, -1 }, },
 	{ .spkid_gpios = { 3, 7, 1, -1 },	.spkid_pulls = { 1, 1, 1, -1 }, },
 	{ .spkid_gpios = { 3, 7, 1, -1 },	.spkid_pulls = { 2, 2, 2, -1 }, },
 };
-- 
2.47.3

