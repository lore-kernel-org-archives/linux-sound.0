Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424422D949C;
	Tue, 10 Mar 2026 14:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152319; cv=fail; b=tYFSKfIur+4XHo6Gy6mjhCfKjnIoX67ge22a7v30blgW6VA1M21euQo7jPqOsOLdQMySDruMGDRkX78euLxE0jCrI+9DM6330xCTuOQDZp27zh9QZfq3ZEWll/1g80QY6WrnDPoFfDO3FJRQLZqDROS6zyuofZf5HzQYkgtXJ8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152319; c=relaxed/simple;
	bh=r6s+3f73pk2whHJmyAp7j164bFlbDi9Z+27u0AnqL5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f0zftJgIpnzinyJkgM3R8aLo3148cfWAuG1tal8B7uJyXIs+kGJaUNifiXpGX6YFqx0jsFL4NvCJkyyosW0ImA3/nf5FTC9QxTzf18mLqZwFHmYKEx9S7jzlwyq7U+Nv41Yjipv2DvaXWdcxEgAWCPF8UKmE1fbJdVGOu9aGjAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Mkq8+t9g; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=IAg0OTls; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Mkq8+t9g";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="IAg0OTls"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629Kvbt62288204;
	Tue, 10 Mar 2026 09:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ZLYPvZHOOTsQqeYY2rsz/SNxl9UboSqKkgDtDdA+jxk=; b=
	Mkq8+t9g6h+q9q3jMzP2e3xKibRXhrH5GmjCgiOPMhYWS6iRkUYIPicFV0M009Wn
	BgRVtHMX1Qf9OwxulWIIkyYiZnJBa4svfktFjsDCu9Wd6gaMduTqsR93dBK7YcGn
	reNqPTKz+FfNETiThYUbbFKzKCjPX0quw7kTy3AnKQPTZAvBUNxJecMG19mYQhTC
	4IZyasKwqtwg8l4G8fpgnKXlbmubTbpFpelVvo5WRxsSlxRR643btwuFMaNfRRJn
	QrptT4U9vI5QWeZ8aB1ga9XvaCzvtKOX8sx3spTVUSgwLlSTQV5bPS9FbDYDbCTB
	SZWLAJoOk3a6pxVaDy9yKQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020118.outbound.protection.outlook.com [40.93.198.118])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4crja4bk27-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:18:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yu90zYAiqhvhVBNBzoA4cZWCFrANE0z5jN7cryWe1hRk4uR84DRLRFgil0ktzaD958GzDzHbUanje3A8cWGjnvg2+b52+vtw6fcb/ZnBooIIeBhyU5XNmPcYnIOajztMPWEPEtEOx8ZcsD4PC3hFYHvr1QOU+smuKQ8pMa/3GoWKzIebtkZmv0tXakSRRcPLS942tZ24cAriW1Bv4gPbzonDYW0HaJ3wjRBW4ZPlliTr1r6e2sxzqjpwwGwV6+vI+aSNLtaTDG9adpKmY1q/+HCnaIj3Rg4aSkFglD5RO4ykHi06j00uRHwvS4KjTfvDmNeOykSKbcsERKYBJiSNWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLYPvZHOOTsQqeYY2rsz/SNxl9UboSqKkgDtDdA+jxk=;
 b=CB3+BaBU++9NuhaPtrHRb7AIbp5N7UyFPCG6nUiiZXLxqssusxrr+yLPjA4uByjig+6PTBsVmdOJeGq49MBsmsn/OlMpjcYXjipL69EWAyeeO8Kwk0gxi+P+oMshu6FUlKMMj52gzt/AYkSPo7Hn3aCQetwnYIY0Yv0ckoSXW0KK+gaL2HrIBuN7abbtVpDg11BbR/qFhM9Lu7EUkpU1yDskVs5DDvmlvK93mJP5l34But75EhKu29ZfQKhWB5qa2leyPwvW2hBtQWMS0fAJF/Vep1OO/gERvUFJaJkrF1jJ0XEisThJgGOuAnLTjPp8d6F88cOzpGUI6RSEnqsgGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLYPvZHOOTsQqeYY2rsz/SNxl9UboSqKkgDtDdA+jxk=;
 b=IAg0OTls4NWfsyTpqgrhBCW/GcY9ToUVIWE2X4palNeBJUi4Dg2amYZiNXBTXK+SXRUx6K+J6m5PjfFGjLQ/Kbug5XU8kiFDjGMhekkXumQfcMA90LyEgeBUbg7iYT1fyiiMHuKjup/T1UJTR90wpol8cZCVKpIpZD1xcf1LrSE=
Received: from BY3PR05CA0044.namprd05.prod.outlook.com (2603:10b6:a03:39b::19)
 by CO1PR19MB4982.namprd19.prod.outlook.com (2603:10b6:303:d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 14:18:21 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:39b:cafe::f0) by BY3PR05CA0044.outlook.office365.com
 (2603:10b6:a03:39b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.8 via Frontend Transport; Tue,
 10 Mar 2026 14:18:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Tue, 10 Mar 2026 14:18:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C6099406578;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 99D8B822545;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 07/10] ASoC: wm_adsp: Convert '/' to '-' when normalizing firmware filenames
Date: Tue, 10 Mar 2026 14:18:14 +0000
Message-ID: <20260310141817.1871794-8-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310141817.1871794-1-rf@opensource.cirrus.com>
References: <20260310141817.1871794-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|CO1PR19MB4982:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cec8ef88-d684-44a5-8b19-08de7eafe243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|82310400026|376014|18002099003|22082099003|56012099003|54012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	KGkzYIqNk+zo85AGC8ZZJ7o981NYVNfOpUyQOwh2EBU6pGRXgGBb5j+2WGTloolL9WeLwFdH509+qi7WBKYahnHxJK90AiPGnsxO/owSHu4KR98RWV7Inr7rrcLsyoGYwZTXooAcw88RJpz7we8DfzoE8yR5rkddYDiV9P5bF5FSifREY2tusmDbBh58EZFoXM0Lj+s6JrxrDqrG3srIK5fbCAhNdS3GB1q4JrwWdcHYTAlgFQe2AFpF7XGylz+4QKfs1Eu7mFDz+13OtSVUk8jby59lVwzlFJoMKfFkmEZxtnxayAiUaL7Qc2BsZGUyrr7Pwfscrw/FiO7HlB1srMnWcTmiOo2fggLY4G8TRC3y3GKYUPnxRMVM6J7eiqcXuQjlTBHJ5EgTyrFESvcml+Y+t4KfoMxpwNJXe8XutnEIFM4jNofFQF6j6dZuAbAOoQq9BP1AjylodUvOIk1Ym8o3XFUr6nBqU8GUoaxW5n4jXZ3dLDLof2EH1PFopspu7qHLBX0qSHnsSbxkcFpm/f8SKfWRUTFCEJrPFtvk5qDWEP+5u6HR8TjuNElOHrCdR2Y6Co4BETCnF7/niwUaQAaX+5UleM99XUtuCZvelQ7hWQL5uStUQIqqkr6+Cx5HzgYz0xFVedKM5X+Q/ILG0xfcqQ6Lb+9lP3KmrPmRTQI3o8w+5qwhE3B2PdB7YN3kBhs23+CW27m98SuTOm1CvuMvHauRNXwXED76t82KCtgsRFsX5xiPbnKDZBPRmd+cn3JpE2XMtH44Cy7xa4zG1Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(82310400026)(376014)(18002099003)(22082099003)(56012099003)(54012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	To+TY79OcsmYFCB+h4jVLVhxYqjxE+gsQQG8eoKv1a6uXJWQqbPQgWJUFC91UvlkJHQdXvMllkhYeNUogs6i9+EmENEDXkX21LA2Q6+khiRC3SL8KMtilAh7F8R8kilbX60bnRxE+YvuiaLqycWsRUiDpwa+KsY5dniIyZn5PoBHCkjKybTfEUsQOu7oCoddIUIhxCHask5uguznDmjW8Kd7XpdVFrAAbV4wbsUKluSVcmogfTzxYe6Ao+3fkzChRy9mW/6Ayr1Mc7P9zaZ/TkFk6jdwnzxW9ex4KzjgN+XhBsX2UkwC5oso0Bl7SvpxxMZm88MgDQU0JhPeBvcdwXil5yy5c/BC1AYGF7ZRZXJQhhiop/FkiLamAYKtNst6RHawpv6OsklqHyhBDpKjB8wsSUmr9+un4FnoeWG451pxuy9g+mv302X2REFV3xDf
X-Exchange-RoutingPolicyChecked:
	OzA4rf9LMeeC4b01LJUGy+W3NowQs2aorDVaURyhs+xojpap4ixV1T4IKN/2FUGH6fI2r3oXooydN/iRGeSLOYn9KfN9kuoDpT5fT6LKyx+YXNxSq2rqNhao/PhKdYtQK3+V+R+MU0ytCETRHTDI2VUbOyd5spadCyDlZvyeWPYgmwWMv0soBIzu1CnviXnTMDL0LmAbXhRUzGcD8aYRcKG9SjUHel7DEiDmoP4hnhgJsQM7OpD9Nh/vdlyT2hMgUo2VfDAruY1kOFJCeVn2Z1g7sWMuyUS83dp08JdX6KMpSE/3Y7HffZMVR0ZAJe3n+rpoNhwIdRZL851t8MiQRg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 14:18:21.0394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cec8ef88-d684-44a5-8b19-08de7eafe243
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4982
X-Proofpoint-ORIG-GUID: F2UvbBtSurJdprNr72YSaHpjNW0W4LSm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfX8f9sTudCGlHA
 6ZyQXC6RaV/VpHSFyHD6MWTk2DnfEmtj2lo6gZ2kawRwQlm++K+L5kgJwFHzs9H6z8VSzJnRuz9
 bNdKEL0L5MsDg48+itiDz5K4/t2EieoE/k3MvkpnMla/sWS5Uo3MnCo/hQzA7kuwWCU5Bbt7N/W
 7r6BYF1V1bvC8pleF8FVwC68cvHndxaM4A9OeZQnUMeVKjkjXyESQr0W5rh2H8OjktgcHIj9WRM
 64HD5/w9tj39TKrUQPTwQ3DikE6raTPa7Iy8hL6ld1QFnIuKd1qACJya485vTaV+XEWv2DWfjr/
 OLrost+A/W/bFofGoMEDYC/4/bbop+4fyifFa0bR/UnNkqGNxsqiSmu6FpmMXoPjR8t1FZWnceq
 vlovtNhgsHLtU+3DqKVRbUi851vUItbHz/IWKk/CYFMK/1l5XqHB2YcXKTrMJLG88cFK+kSIdsh
 3V6sgaPpv/qIK8tG6kg==
X-Proofpoint-GUID: F2UvbBtSurJdprNr72YSaHpjNW0W4LSm
X-Authority-Analysis: v=2.4 cv=WNVyn3sR c=1 sm=1 tr=0 ts=69b02830 cx=c_pps
 a=LryC7IEqKcSdoWktnkYnkA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=cAk_rfhBCTFALOCBzuUA:9
X-Proofpoint-Spam-Reason: safe

Don't preserve '/' in firmware filename fields - convert it to '-' like
other punctuation characters.

The code originally normalized the entire string, including the
directory prefix. To prevent breaking the directory it had to preserve
'/' characters in the name, but this meant that the system name and ALSA
prefix must not contain those characters.

It's trivial to skip the directory name prefix and start the
normalization after it, and that means the normalization does not need
to make a special case for '/'.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 69e573507df3..034766760c86 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -776,16 +776,15 @@ static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
 		return -ENOMEM;
 
 	/*
-	 * Make sure that filename is lower-case and any non alpha-numeric
-	 * characters except full stop and forward slash are replaced with
-	 * hyphens.
+	 * Make sure that filename after dir is lower-case and any non-alpha-numeric
+	 * characters except full-stop are replaced with hyphens.
 	 */
-	s = *filename;
+	s = *filename + strlen(dir);
 	while (*s) {
 		c = *s;
 		if (isalnum(c))
 			*s = tolower(c);
-		else if ((c != '.') && (c != '/'))
+		else if (c != '.')
 			*s = '-';
 		s++;
 	}
-- 
2.47.3

