Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850A624DCF9;
	Mon,  9 Mar 2026 11:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057436; cv=fail; b=jEZ9owV58K28NVilAv9seJdWnZ50PrPU90rL5SNvm2WTLjjPECW+qodRqT44oWhTFKHQC8/+It56ZQK+/anLngKpKR4sTN6lN3d1/AW6H76uFc7qpgd0745CZ0MPZfqHyHZMCCm04vx32Ld6YSsPRFNDlj0uwpMantS/NzsLRoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057436; c=relaxed/simple;
	bh=XoCCSmEZEFkl1M5hDD4h5au0LWv+jKu/jPZnruTf8yk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EqyTLyW0W4SEtPvIy2e1WCMJVCIulbRXC1qBiCOUKC3Nd78AXQv3oQdzLk4Ld3mAYKODlGd/7X4MEvF206wsr1G6kYmogZ0uaGEZLzFpCwyUG6BRdw7xB6Buot7/Bhrt34jQUMyuqKQ7Lw/HR0zH2w/FLS7EujsbyCqJPZNqy5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=a6sYdI+R; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ss19MliF; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="a6sYdI+R";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ss19MliF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297UJhh984806;
	Mon, 9 Mar 2026 06:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=cMQnEzNABdLkGYBO
	cTIZ0oz/QIw9Ui0Reb2NusAJ45Y=; b=a6sYdI+R2YekZbdXEOol7w49/0BvTxtm
	uTf94ShbhmWL81fU89GWgx3AH9EP13xzmaCMeqeu7K3W1iH05afyjpqkQ/t487Kk
	SLYXwCXRCUO95N6GMox5JDetLHd1TZ/ja86/TgvIU4H2edfpUW9tEDtQ8ru/huWL
	Osds283MnMdLhVpjwaURAQje0w0kUYHHGc7bUFvQQ40xkTbIOoVuiLRHJ7TuxAGF
	kfqQg3ZKrW/fdszJhj+GR+61dwtT78I14CbmjJv6eOeA1CAorHB6ZhXNKBb0eJ2T
	K2C/4309QMGO1t/oZjiE6mr2wCv37i5+pjUjZRYbZgDG34O3Z5r7ow==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020104.outbound.protection.outlook.com [52.101.46.104])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4crja49q8u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 06:56:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+eRVr/ICBMHYotVrzJnTmsPAZB7SK4tAbIRBM7GlfizGyV+hk5pFAv7+EJLqsLNnNZ20ArDK1Pfc2J4+AxcSz9jU1QbWf4qNtogkyzp3E+4q0B/74+qEIlsY80sHq0xt8fkeCka6I4+JuVDJ7PM40UatV6My75Bm/ffcE3tJPERgQQEYYHrThEZ26tscUtvfDhnPzbAfq7rmTqI58Fm+j6LX8t5K5W13ZwooA/0M9shgr6eLXzfryDdnHeu5sddB2un5TiJ0wLJuCZaM+6xeoA9lRpnhutHeAPBWmt12DwzTJphq+sv+LW4xaT/Lfn4ke+Y+eEIFbf3qyyw6rhqAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMQnEzNABdLkGYBOcTIZ0oz/QIw9Ui0Reb2NusAJ45Y=;
 b=iBdwgc693LYaCrDxeQNwUXslzEKGmMbOonUR5XJjdyfOw5KqxOzf79FOAUcokE/2FfPRYIFb02WcYE+Cu2omSJ575U2ZtVjDe0WDQxqDqeLt4a67yZ0/LGMtTJo0Tm0NuSEjNyCXI+ApzAO9EBencm00fxhzQw3urJI8cAOZakcvLSHpi6E/o31LSrretESUF9AJdkxrsjRlg+6pEKsT0QqMLpWjlSpu7uYEQ7IFMfsZtc4ehMfC5++FYLLKq9BVhiRWksVYJuSQljQhLeyQLkjS7hs2FpwFCiTOBysGry0/uj8qO0Z8kX478TkpRQ6ceT0QXKhIaxSIbp8M3mF1pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMQnEzNABdLkGYBOcTIZ0oz/QIw9Ui0Reb2NusAJ45Y=;
 b=ss19MliF+M25Z5nBG/VjtOm2EMhZzhvkuZDhH4UdCFQQaYuLmNGyPjX370ieoLl6HRDc0Ie3MjQ/bVDousxpy7nV+3+6KbiOr2JCYMUCEO1ZCHGVB2rXfpHzewwTTUCoO1UZ/9F4Wv+3FpmGDIEvQeycDEQSiBZSYTkV02YpU2g=
Received: from MW4P223CA0001.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::6) by
 BN0PR19MB5262.namprd19.prod.outlook.com (2603:10b6:408:151::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 11:56:54 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::54) by MW4P223CA0001.outlook.office365.com
 (2603:10b6:303:80::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Mon,
 9 Mar 2026 11:56:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Mon, 9 Mar 2026 11:56:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6D8BE406540;
	Mon,  9 Mar 2026 11:56:51 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4B500820249;
	Mon,  9 Mar 2026 11:56:51 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56-test: Remove pointless duplicate loop counters
Date: Mon,  9 Mar 2026 11:56:51 +0000
Message-ID: <20260309115651.1090368-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|BN0PR19MB5262:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 62990f83-7d09-483b-9e0e-08de7dd2f4aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	vRMzEnt/y6kjgSUX7obBtxUvotQ6D8xEN5T+bSoeYM0grwmkHPHZRa+38XezfoUTgB/VIVAZxcjiAIJFT+o61XqbVk9vbaazyfnQnPHVSGpYoG6sMagky5pQzI4g/K6dw7UO6yCtAFrVvz/i5VH5fZFeiGZVpDeBCs7l1f6p/u50Fve7zofhs0FuK5NmSxNoZgUltOPVkPOvpPRQ8fm+OjAQtqWDh6xcMimlGEvFoIxPQN81THUFmy5Ys8Lbc02pVuVYsrgMoVt/A+h52I8O5mN1gkbcFndeNaApMkfYjziue4k3fK8I2uQxaK3yl6avG3d+kTg0nSrKcsdITqGiY870AjXAF8+1PqM7ysUVuUkz5LBk22+1fztP8ch+Voa3k3GJGAXZ1Z2n7eMnncCbCwsMCjdw57t/v5vK/WZAdUy9r/0408ZSXppJFOppqBp/6BqNwiMqVxblb1jf/GCZLlP9h/B1n9T0nOavil25kIcpXizhjLi6h0XNudcJVEwIksDBolMQAO8eXK2fsrLqF3TwU90OlDvK7UzhKvAptp59wbeG6LC/66cwqdV32UEI43yor89o/PX1ITKnAlrzlcskheiflyQkYRMbAJh7kEpCQ5YYzDMXjZlra2oRwMjiFrXYfCMVADXApa5ISfD+6+ywZ4+zMI9k/mtnypGUi7mPbpeWmbd2y/uoVbEdybZ4fQ3c3YCC8jEMFVIIcN81+JNtOaA5LIpExHW3f0Eqfjc2StOqDpCAHZ9/JXd1tCkTDgd2IqooeVJYyAvyJKeizg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3WsGBHcA3pL1xx8s5G1hNktlkIYt75PF9PEMKEdJkIpRMNhojlpuPQR9IQJEQUi4ibxCDR/ELDPbnmcxpO9s4wDefkvRmuRdObNMaEyw9eOl1OnowOEUaDe2p+uM4lyjgpILiC+iuTK2RFtTY1LYFjpfXpWhyNhLDfEJX/TKY+gmtE5siaLYPCVHEerf/bE6Iuimx28fouWybjXf4W36MaWjb0iW2c3Nd1n03+8K7NepMlnhqH1y9fqYs8z6D4PKBeuiB5tYn4fRUwVkvoipTKmXWv48Opbt2fMFYefxt48FPKgatLiH7j1IcvJLlT0y+PQBuR3j31rWdOnh1YeDRTkLXRPGnNKk5ZWmdVcrHGHVIOeMLXlI4uzn6fR1Igb/HRhDQS612fvjCTkEB3R+4XDSkv0K3KSIL81EiKtKA2VhrpGr4IlonYu4xaeVBTSS
X-Exchange-RoutingPolicyChecked:
	mA6916zgfs6ee1pth3dFCKhhOr+pIvWC0U0ahkL/a+RA2hFmPQsPaonK2xc6qHLN1qodM2T0eM8W6qZTJmOQrEzCC+pbSqBG+izC5kTmA6QYMeZDH3hdUwEfc3FMOIEvrxnQSyMHZ28hCmnkfk42j/JmfoQG1xqUzf6rkxdQy1JTVnKobqY98gmHsLT+Y7Hr/VLD6mCSqqACNoYIeSGckCoVbAT130fMcUYj2Hcw2O+74gU2bjCZVItbsq2d/GWsT+bhn4+dErSKQLyAF2ReQKZgWHAO0j+v1KRiqhf211zVlXU+ZQ28ueh3iZte32GOVrOZKyVlHyPcTUDmnp29Qg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 11:56:53.1318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62990f83-7d09-483b-9e0e-08de7dd2f4aa
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR19MB5262
X-Proofpoint-ORIG-GUID: mtqE4rL5hHf0dm7apcGgM-OQkfWtJy3V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExMCBTYWx0ZWRfX8XwLiWfSCGzL
 HWqZ0EN6Zb9G8bNLXO46b3c/VZihjFkLsLijmoDiPYqLjIEySrCOwSJdWTUfMky1pFDWAaObs9x
 MLk4qnessEtYuOhacj/bt6+w0Hx9623A9/WK6ECfDL8t5cVzIb3bQyCQ8jYh2Ytsba6teGbZF76
 lkSNsOs/EUtQ5o4oAAGEFR5xBaqiV1vawkmaFbMjE7Ff3Y2RxPRGOU1cOZ/c+KgnY3IC3VBzKAr
 QunpVC34KylQh6Rott24vgc/ecIacCvxn/gfC2mpEtBEEbqy/H/bBQG1++8dy+HSs3XBnKtXgSf
 nfn5PVxFJuVHps/6qLxF6JEkntObCLgK4jnh82y5IvntIrSovd1YreFts+tWSjzQiYr96w6K5kW
 Vy2O5/N46fDIUyVOZubIxeFm7dQdBJs4kX/2vD/IhypPBbi7FC8dOHpRJ/h5iq6dVqUNYbZ3dCn
 V0gU9/jCwse1yka29IA==
X-Proofpoint-GUID: mtqE4rL5hHf0dm7apcGgM-OQkfWtJy3V
X-Authority-Analysis: v=2.4 cv=WNVyn3sR c=1 sm=1 tr=0 ts=69aeb58a cx=c_pps
 a=y/6OeRevqtbd3HODipuDjg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=ubZnbg0GfJVe05vK970A:9
X-Proofpoint-Spam-Reason: safe

In cs35l56_test_parse_xu_onchip_spkid() the first two loops used
local i to index an array and num_gpios/num_pulls to count how
many entries it had seen. But both i and num_* started at 0 and
incremented on each loop so were identical. Remove i from these
loops.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-test.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-test.c b/sound/soc/codecs/cs35l56-test.c
index ac3f34bf8adc..124fe5e75500 100644
--- a/sound/soc/codecs/cs35l56-test.c
+++ b/sound/soc/codecs/cs35l56-test.c
@@ -364,18 +364,17 @@ static void cs35l56_test_parse_xu_onchip_spkid(struct kunit *test)
 	struct cs35l56_test_priv *priv = test->priv;
 	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
 	struct software_node *ext0_node;
-	int num_gpios = 0;
-	int num_pulls = 0;
+	int num_gpios, num_pulls;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(param->spkid_gpios); i++, num_gpios++) {
-		if (param->spkid_gpios[i] < 0)
+	for (num_gpios = 0; num_gpios < ARRAY_SIZE(param->spkid_gpios); num_gpios++) {
+		if (param->spkid_gpios[num_gpios] < 0)
 			break;
 	}
 	KUNIT_ASSERT_LE(test, num_gpios, ARRAY_SIZE(cs35l56->base.onchip_spkid_gpios));
 
-	for (i = 0; i < ARRAY_SIZE(param->spkid_pulls); i++, num_pulls++) {
-		if (param->spkid_pulls[i] < 0)
+	for (num_pulls = 0; num_pulls < ARRAY_SIZE(param->spkid_pulls); num_pulls++) {
+		if (param->spkid_pulls[num_pulls] < 0)
 			break;
 	}
 	KUNIT_ASSERT_LE(test, num_pulls, ARRAY_SIZE(cs35l56->base.onchip_spkid_pulls));
-- 
2.47.3

