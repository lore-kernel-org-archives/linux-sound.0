Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD606336EE9;
	Thu, 26 Feb 2026 11:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772105723; cv=fail; b=h2qN5s3C/f3K5W1KuQFba3HkR8bNj2LXsrLwXXqM7yaEXYSLOh4cK/3TMD6OKBV1TRgsePyto2+mvCiUB1pm1c5mlKtYbMYuBIuIvIozIyArPl6LJrIBPa0FvJt39+s3pW7XotQK50Cmrftl6P77Wk+PerpdzDBYOkauz08bD4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772105723; c=relaxed/simple;
	bh=qvGQRY9azA7wmStpkm7XF6ZCLt/THkX/vmKVzO94Zic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=glVfq93R2JDnlpCPVC0DMwi65IWQqIgiVtgn97q4Nxq1+aNSn24+1+ZRqBpqUZoM05dWln87tMA4QMLnrmkTKwE1xXBi+CZRPtp7oHo7Hdx7wSArfZdfgvbRAD1aviMMoJ/PoLUYdaPfEBEkx2cbBQG+YDbmpdqy/C+jTNP7TT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hxMoNoqT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Jk/LhhBl; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hxMoNoqT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Jk/LhhBl"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q5ZCcQ558155;
	Thu, 26 Feb 2026 05:35:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=UuV/dnBFzCNLfJpO
	3WJic4OgRUu6Sv5reiIPZl1lL1E=; b=hxMoNoqTWOrELO5lc04iR55dnwLAp/aN
	dhlufHaFqs/tVGriLaV4xluUlY77I7B5dUo5lK9L+7zzbEsA8Hinwb+cc54ZMKj5
	zeeMrOXCz12f1KmzPa2JWUfJsoEyV9b8gsahCewzKgRAr8TPEz1O0Xx0PR/AB0nE
	mosd/MP3N1QI5LdS3iAkpB/Edf5sHwBvmbUy7EpPPI8gkJWBp6IYMui8YUhp+nOT
	go2/OFsElILz4c7FHc5VzrqGo1h2BTfU8z3DQ+CMWVXwMwgvsbARdDJdBBUu+i1I
	nWq0la+APfEPHYSWPiIZXODiu+MFl+H8PFee4FaofdPnSpPnmsvnoQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021078.outbound.protection.outlook.com [40.107.208.78])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j5tbx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 05:35:18 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIgnrbxbIP4ROgWnGXd+HrYDgbZlO5jE/F2CmlYqwTzGBX+s8uVjScgF0apCvFsh0XTcRvZvg2snzgB/zJQzvql8zlb+I1BbOkrBMqD4zIL576OlYkO37vaz6S9VAXhB3s791/fAtUdSIZKI0Xkkd0Yb0oxpPwMVSc3sDYAdm7FYDhQ4vRSsUn7oDDsboypHtKeojaxpFVyoDCt8+VV2fFEpWGz+N4l+5ujFzMHI6JaPW/zWZiNU3u4lO5CRMvvdZFoolUE9RDOttM9la6hAJ8S2UwgsBl9pI1754B9bYJHybO6azeBcQlU6bjqC91TQ5zi/tZQCcrP7I5pFsm38Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuV/dnBFzCNLfJpO3WJic4OgRUu6Sv5reiIPZl1lL1E=;
 b=ZrtG1mscDQMqIBBNmcrCXxuCiBLE0VGiUTR6fqJQZx5L+W5Yfu01Zg0OlnQ19H1g9XT8ivPoDD3L9r6eJqyIpCXVcj2fWWbKqH+0AZ9gGS29xI3e+T0+62oYXHSLQ/u1U5YW4MTCrSGUuaBdD71T/RVOaTJ2svAkX5cmtJlvrOi3NtkZicnyLZUC86NZrT4Thli4IpX+k5UI8QsGzBHZUqq3sIGgvtDNh14pCmC7+aJ5BrPam4X8CaV8f6Edfv/XmMRYwxTxGLgJFuCnXIVAvZz6VYziCf1uveCPR62Oau3msRM5FqCClbS6mcZNYFZRhYr+fpSrTV58/09ZkNMI7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuV/dnBFzCNLfJpO3WJic4OgRUu6Sv5reiIPZl1lL1E=;
 b=Jk/LhhBlpNa8ErjeORS9/cI3TFkjlFDanFpH/YnkFvMSOooMAWrq7Wf97UzwHWWLb14QeRdYu8BPJHF9eCorJGUDDyqNAI3idzaeoyqtM5NFM+4wZxDfqOC1gOeZQL4k6T9t9BzrB4m3eQQsCZpcXVF2cEVCX2D2mgn8075j3IE=
Received: from CH5P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::14)
 by MW5PR19MB5650.namprd19.prod.outlook.com (2603:10b6:303:1a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 11:35:13 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::7) by CH5P221CA0009.outlook.office365.com
 (2603:10b6:610:1f2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend
 Transport; Thu, 26 Feb 2026 11:35:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 11:35:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EA8CF406541;
	Thu, 26 Feb 2026 11:35:11 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DCD3682024B;
	Thu, 26 Feb 2026 11:35:11 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Suppress pointless warning about number of GPIO pulls
Date: Thu, 26 Feb 2026 11:35:11 +0000
Message-ID: <20260226113511.1768838-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|MW5PR19MB5650:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dd78842e-e85d-4207-b455-08de752b1b2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	RFtF5CO8xOclWu5aPGjHvXt+wGAdC4MQx2BnlFB2Xqqqulpk8e1z7EcncBgBiPvww3ZL2qGNKy7rp+xlw0hTmnm9P/9ifepreyTFIKQCbQmCeNNT4+aX1Kh9ZKB+n9ac1Ss4X1/CbzkVuxTsegTswDOGvOONnAaTY4WcdhM7FP0iW/0lVt9ISyOLYg10VtKLKMjKUYuh71bMOrpkBmKacYBGUd96XBmrzCpde+7pFzemcpMOr5rJ+HutS56ulJymXhncO1V/Pap/qSuB0Soqg+4rs3TiB/hl/rGxlJiB3JsFfqZmb+CcpLNLv3oIw1PJjGxGzn1NHgAoL0marLb5bfMDetuo81EnuQFoIX7hdBBPsxXXD8q+dtE3CJVGrzJKJLllyfF+xY2USmUQLOx8tqQypuV4IMV7ZrBimRcSeoTBBMTOcc5bIplykCLa2ge9lJ+WIXM8SmRAUovK1qyoAwaFmTqZQy34wqurTNMCY1WLQqX7pz9AmYeR80a+8Alwd3AK3AHQj1Slg7vUAd5OflYCm72qVnv0m92/t6OM9WrfXHo42ab8dDV7ARhrj/qXJFGZcoBdeorBonSnQ3qiHBkahkpHlYCiVLcZAWTbHsS0Ixe68QNU2Tdqo6shIdJCGGKTityAH6bBWPZbPLgjBSLgJm8PqNmzhOsV8b8yfks/b1UyZcPvC6ELTmNjQxxr+1XEZU2SunxC8E+lVivY2tq08d8s9ikcOdEHr6fSQjK9EEXQFTnva1Ff0bwxTe98sBhFvhc744xIHC2/CRacxH+yrO8gAy59cxB+MB8igPkVRC+E29RUm0g3zD8oH5ZRmN4wSpVbWeq8c1idd57gnQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MhiqKRCL+TbxzV7z4Hvx8boGEr3a7LtE3uriVWmdU/wBNuw3eFoBVbrHfnWEz635oks4jteHhaTzAzP49W8VVkXp5a/7NqMFRw+zl2cGO2oykMDaLSmkX6jylZjKNvWcyHvG2pRLAT8GldVrkTP3BhscNqsCYTxZLKeWYycFL2/3hZF7F99tfCVpXhzUewyjPt2T/jYWbGseOX+Bas6RAdNlpg9mQu1NMAaqhcCTwT6Ojz3iK0OtWjLtrMo42jn5XADxsv7Dzl/hlKMtBPa4z1vYIWVq64CFHjBM+EIiO8WpWdVyPj4RQm5XyJS67CwG7pvoNlihZEksu7mlgDy4VWrECyJe/3yHA9SBRddlZGHk0iOtkIVo0R3qfkMiHYrEqvAkFrbcdZ0QFvV39dr7O9FTfnAVr6XlPpVZkPccMOJELDDhEe6MR679ehGDSvxo
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:35:13.0471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd78842e-e85d-4207-b455-08de752b1b2b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR19MB5650
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEwNSBTYWx0ZWRfX+OunGWSx622e
 Rfn1ybTKaajQbST0WiNmHbRRxtFSPpJh6aIqMACDzGCieDfz0wUfXvPBax/OyCoNhNFKmkk7ZXX
 wVicrI0sefmwFuZW1tgTKWBepOwXiZKyMSCWksf0O0kyw0ghGuXKjJhZnAIFpmXgJt6v35VId4+
 WYIQTTDweGrd1Gz/ueYncmgY4tks+D/N+GGcraKo5+xzXF5RlbosYg2KFxPJlz+nKEx9R7QyZLD
 qKpLLoAzEbvUpYo6CRgBkmYddTAU0UpWPmyCMA0LFiFoIPjG6Pje1RAfj61718pMHOs5GaZloU+
 B7JfLpQWvGkgrv6OKhh5sONgCoQYfJ7GVvhFbME7tFlcqcMyeqMf48rllFHXHpXkHXsQCOKpIyf
 qPA9lCFrhRaqhYoQHs8dyGPq55wmioqkbgFGCmxcW7XPEZ+NVc98hzB/meiVmvqc2/MHOJomgje
 feFyxrGoqYBdaO1u9DA==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=69a02ff6 cx=c_pps
 a=EX0Xkmt19mXnrP5bPG/VDQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=J-zdRGgeE18yq1pSkyEA:9
X-Proofpoint-GUID: SqKJNoYbYV6jlMixtp8jidzTJr3yWHfU
X-Proofpoint-ORIG-GUID: SqKJNoYbYV6jlMixtp8jidzTJr3yWHfU
X-Proofpoint-Spam-Reason: safe

In cs35l56_process_xu_onchip_speaker_id() the warning that the number
of pulls != number of GPIOs should only be printed if pulls are defined.

Pull settings are optional because there would normally be an external
resistor providing the pull. The warning would still be true if pulls
are not defined, but in that case is just log noise.

While we're changing that block of code, also fix the indenting of the
arguments to the dev_warn().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 3bf9e8fc34a2..37909a319f88 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1625,9 +1625,9 @@ static int cs35l56_process_xu_onchip_speaker_id(struct cs35l56_private *cs35l56,
 	if (num_pulls < 0)
 		return num_pulls;
 
-	if (num_pulls != num_gpios) {
+	if (num_pulls && (num_pulls != num_gpios)) {
 		dev_warn(cs35l56->base.dev, "%s count(%d) != %s count(%d)\n",
-			pull_name, num_pulls, gpio_name, num_gpios);
+			 pull_name, num_pulls, gpio_name, num_gpios);
 	}
 
 	ret = cs35l56_check_and_save_onchip_spkid_gpios(&cs35l56->base,
-- 
2.47.3

