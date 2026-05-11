Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B153FE642;
	Mon, 11 May 2026 14:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508709; cv=fail; b=HjN/I3QsPKq4f6IVradTXs3VXmvj5n0avG9eMmTsQNpnpqb4YkGcbyA39Dy58ZEuq6BvGX/bxsndXqbNHyzxdW5xFHmHCHixa4w+OthaSHswVgoKlg+t+h5GJKnvPtjrhwXOfbMKPirn6yWb3KfeYbstSVA8VOfPtz6qAPYi7Ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508709; c=relaxed/simple;
	bh=8sirakWI72WwGHuyxY+sIjzTcNtkoa4jegCe+csdnJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=owcKvcsN6FSorAp9FX8wvvzXmuyayX335KbQegKssQpeBaUA5UfxkbjJ2hrNS2c0DFWakjtrmJ3qIUkFdAeq6Fh/liAJHd6tqkaTf/oo5zDPj5bRLUCRrN7j193OMWzrltKJSbgjtOtVx/3v5zCpL7c83YjyNTib0Ven2YRAOX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RzN7rx+/; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=J4cu0pRX; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RzN7rx+/";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="J4cu0pRX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5t7Zi2679596;
	Mon, 11 May 2026 09:10:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=fEYRNNflV55iI5rID61V0N/SjXsgAEZNBUHlsSHJZ6M=; b=
	RzN7rx+/z6ERZEp3dVEoR4yGS4BLx7TmZKYTlrpPGdBhKP0tkhTglnjnYJ0sn3os
	TqtO/Q33sCT1rck/bqH9zJUhFIb6EOUkmCW8DEdRHDnTMUvd6PVN74kwBqVxqfzw
	UTgsFWZpEdXVHKDzohPRaQDfEg4WRyOOgIkDoV4rS8S528YsT55sIX3v2P76pbg1
	MvgHcOOWay1BAcq2b55DfGmYMQtIvOfzqQIjUzC1TlJHmFBdK2YUGR2+UFSILrwo
	z5CaNvVDD5iYe+N+M4epkjV+OOfEKLGlcmy5qE7S+lH+W7Ew3WzX8d10SnNdqOEG
	zKni7pWV+jOr4u4DSRgpZQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021107.outbound.protection.outlook.com [52.101.52.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e21bft8fd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWCKclxDkvGKdnsh9ta+LEBLaZxUDmtVYta7lJylyLUyCAcZ33rq9vELKbEDgzbmiiIbXFc83mYIBEHMP22kjwGApvcKReZ+riV305rfX8Mh19K81uVVM5c5TSk4WtdG/ArZKpkBx9sgf8DsUfaseC00yujGdwEGa2UckKxrCCM4quARaPA1iEC3JhAE4hLsT5dRFxk2sMo3o1mg0o+oDDi4dVH+M4U15OsxBigAw2eVEV0SVyTGyYaLxgDwadWqaKMEZLTMXhVvTzJv42SF9uSZOHHCaUFe/C1x6GEfIhHltEPnjDVbEx6YzxBEs71QueiUtOpwsYP7AHImYrEEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEYRNNflV55iI5rID61V0N/SjXsgAEZNBUHlsSHJZ6M=;
 b=bWzyd4u6V3B9M3TWtdtp1FWmmVmG4+5BxHFWAqwyaDsLR8GExPpC4fF21PjMEWFasFCrrLb+arbdzcZS+LzXUuOY5piYfFBdEu+aPO1BG13qaTCljT97kOuD6h0hJz7W5H8a4vzSQgP2/qri99rCUtqtM/MT+HGskHXsTIPEE+Aofp6hd0larAH1fSUZwZ5goLBY5peU1oKGTMGj2a4reCR9AX0PgEWsPqHBlT2Xufnya2uj2dl4osThu4Z+DEveB7w19wuKDkOE9PfseH+v7JWUQhswypIX9Fhj19TV3m11kufhuePri6sBnuefFboVdy/cZdBzj0sls/zIr/fJQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEYRNNflV55iI5rID61V0N/SjXsgAEZNBUHlsSHJZ6M=;
 b=J4cu0pRX7aMQLdEV4vPvzRgbb2C5M9PVRRnynA6Q477YpJJV5b8dsD2rlsm+auA0Bf+9xnufxKy9PUCyCRlh+h9c1CuuuoPlCvbapHoNiP36REP3B2OTxtWBEbQu3qlORwrfGouOvTVQXk0t1HcE5kWYwBDoyoShTk7sO/SQXQk=
Received: from MN0P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::34)
 by SA1PR19MB4864.namprd19.prod.outlook.com (2603:10b6:806:1a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Mon, 11 May
 2026 14:10:34 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:52a:cafe::38) by MN0P221CA0014.outlook.office365.com
 (2603:10b6:208:52a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 14:10:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Mon, 11 May 2026 14:10:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 73DBC406555;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4060882025A;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 01/18] soundwire: Add a helper function to wait for device initialisation
Date: Mon, 11 May 2026 15:10:12 +0100
Message-ID: <20260511141029.851125-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
References: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|SA1PR19MB4864:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1f07f4ef-2d71-4164-3326-08deaf67119b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|36860700016|61400799027|56012099003|11063799003|18002099003|16102099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	RpMHmQSRLfvxorGzVab6E+PxbqRLAtcnqOvmXuhQCWVKsPqr+AXWeRmf6kkTwbZj4FvY8G7PFboiM40VbIc+k1+ihaARpJTZA6DGjceVveR3R4ebqV0dFJBtiW79A/9o1y9dTTYNZHme3a+/4L0/7wIhlpiq9ZsYdRPzzFc2o/gDmNy0qd0dPLjj3W9nZSsv0rgNqs1w/ajDZNAuZqClR8tulR4W4Xex9Az+cwF+Q0dml8Id0xq/uJdptQ4u9DsM+mAP6ffUIDgitmhN40y1u1f4saqcAG9A+JYoxGGPHqUotgGEo2mk6X8dbj2uyNalqyAz2Ezxg2H2T29SXY4tAf8p39Qb12VWXA8ok/Z+q5GlfBE4YKuoKCsmGjVWu8CWQj+EM/pbtSv8w0SE5N1ClSJ+pHOYk79Hn/zOvqluBt5EcYIBhl0qTsxcbU7zqPKrRQ1nRs+x6VU6lw6IrRUBeYhpnVHE4K2ZU9T3183YvmbVKDN0KYonbsy1WWvL0a7ZFbqOj1z8zhTkoR4h8DQpOG00Dc4CeZnTVWwN8nVDs2/hk399hk1RolKvc5r91IxtfvVzKNBJJ73Ax04Ml68bqeALwVYLHcH34y3lAahJJT+fYkZYXm6CeK24ysAWNGjWJJ/bS+xzNP0b6MEvlzX/tyK8RovnWg9DpnkuB/zvJ36H0E37nGLsa7CFdQ73PVaryAI/7mVEVEo3xr8S7YjNMPQlQT4Ub7qx99LNqzOiEBA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700016)(61400799027)(56012099003)(11063799003)(18002099003)(16102099003)(22082099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QA91Ig/Yitj6q+vs30yqDnJtoBB2ZmUiPsD0gOkbZ0WJLI36nnoC1OV3kuMqGZXZVBWlvPf8a/LbMALVHil7aFfGdItPTfy/5ho02f0br/NNB/mOejZdlgS/bSJJ86VyHjkleH5PCpio6EF8RcdnoVqBM3sd/7jQ7Iip7pETEGFY2R5iireS2D7eKn2Fxj7ZHQ0jCbj26z92b4Kub6VulOGv1iBXYOe2AM6fHPKyJDI6hzCCzdyaKIN0u2ujVI+tNIRGBoeyJpTWClPEWCI8Q2TNprmOisnvTAIE5bVAJc6wlRs2yAIxMJY6ZB0K0Wk7uqM5TyTIEUW7bon1bEcUFgIZEFkN/iv3ARLpmZIqKkxT1WzQiLMhWP067AqJZTRkHkG0CVAEGKgjm1BLKgs1tbeSQc+sr9JAHlsUM/HoJgn+DumwR1w7teAiVT2GCEwq
X-Exchange-RoutingPolicyChecked:
	fWfluNL9MaayxQP9EjKf4KbKtHwlY3Ke7MTiW1Qbmr1AbAzv5cpBsMXhhwmsKsn0wxi/ELsCof9ziCP3sI7tB48X7Y4PTvD4TqzP/Fo7W4DgMVsELmyLu8ohx1CuFtz5z1Mavn6xCWKmTa/g691y7+7Mb5tAKT+rBWoUDx7Kocosc3Sq9xABcM9cnw6bin6nbyBCdapih7UqZsYGs6fVvylZrPM4vxnluvReUJ91BsHQRVpHqQErRqy6N3opaHFhNjK3QkQK6YIuCuwr6SGAsg8ezNWHy0UTYndXlwxLU0pQYcCkTyP9oKlxHROlOOGSINgl6XuCnq/9BoWQeslM6g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:34.2936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f07f4ef-2d71-4164-3326-08deaf67119b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB4864
X-Authority-Analysis: v=2.4 cv=DYsnbPtW c=1 sm=1 tr=0 ts=6a01e35f cx=c_pps
 a=xX5bFixAAzgdQQ8ihQiE1w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=G7TytVl67iZrf8OmxWAA:9
X-Proofpoint-GUID: cQWxmN5q37B4-b00vyFMaCq6FxGYryoL
X-Proofpoint-ORIG-GUID: cQWxmN5q37B4-b00vyFMaCq6FxGYryoL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfX3A8Bm0ISVKin
 IGk/7yX6sn2y1WmbjXjRb++XGptzHQ+lPAlR1jQxUL5s8/ik2jJoEg0kTKTgV8pfh5bdzvym/CJ
 ZDd6BAM3PaSg6aeEfljONIfI4rK/UQunT6qou5UnsFdpNxM7euWeqgIDIK7APRAzTpxsHCU7uAE
 b/KUHCC4Tu22HFeVefLHWGZQ5oO5rH0IgYheKjkzSES7jCICMx26sC2p60r3SUQzbfFv92f5za9
 ssvzzZLp5WKQjf5e+egVqBHiroFOsL94MjbHyuVa9inIKrhtx5hE519kXaoPifjJLJU3Ivyl/IZ
 3AEhgYSrgQ73BwChFgcFlqyPbSU/TK84knNiNm3kjqI77zP8+2vNtrHY+lEQwT7aIvOgJSdF3Mg
 QzMrDsEBpoV2/g3784RwSKpG2VkNac4O7yvk8wf6FgvNboUQZK79aed11aRAJ1I2BIyawoQVdpW
 CNVqxDq0O3o6PyBPwSQ==
X-Proofpoint-Spam-Reason: safe

Add a new helper function to wait for the device to enumerate
and be initialised by the SoundWire core. Most of the SoundWire
drivers have very similar boiler plate code in their runtime
resume, and that boiler plate tends to access various internals
of the SoundWire structs which is a mild layering violation.

Adding a new core helper function greatly eases both of these
issues.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Add stub for when soundwire not built in.
 - Add missing kerneldoc

 drivers/soundwire/bus.c       | 31 +++++++++++++++++++++++++++++++
 include/linux/soundwire/sdw.h |  8 ++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index fe5316d93fefe..037c51a3874ea 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1372,6 +1372,37 @@ int sdw_slave_get_current_bank(struct sdw_slave *slave)
 }
 EXPORT_SYMBOL_GPL(sdw_slave_get_current_bank);
 
+/**
+ * sdw_slave_wait_for_init - Wait for device initialisation
+ * @slave: Pointer to the SoundWire peripheral.
+ * @timeout_us: Timeout in microseconds.
+ *
+ * Wait for a peripheral device to enumerate and be initialised by the
+ * SoundWire core.
+ *
+ * Return: Zero on success, and a negative error code on failure.
+ */
+int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout_us)
+{
+	unsigned long time;
+
+	if (!slave->unattach_request)
+		return 0;
+
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+					   msecs_to_jiffies(timeout_us));
+	if (!time) {
+		dev_err(&slave->dev, "Initialization not complete\n");
+		sdw_show_ping_status(slave->bus, true);
+		return -ETIMEDOUT;
+	}
+
+	slave->unattach_request = 0;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(sdw_slave_wait_for_init);
+
 static int sdw_slave_set_frequency(struct sdw_slave *slave)
 {
 	int scale_index;
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 6147eb1fb210d..7e5818d989294 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1093,6 +1093,8 @@ int sdw_slave_get_current_bank(struct sdw_slave *sdev);
 
 int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base);
 
+int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout);
+
 /* messaging and data APIs */
 int sdw_read(struct sdw_slave *slave, u32 addr);
 int sdw_write(struct sdw_slave *slave, u32 addr, u8 value);
@@ -1136,6 +1138,12 @@ static inline int sdw_slave_get_current_bank(struct sdw_slave *sdev)
 	return -EINVAL;
 }
 
+static inline int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout)
+{
+	WARN_ONCE(1, "SoundWire API is disabled");
+	return -EINVAL;
+}
+
 /* messaging and data APIs */
 static inline int sdw_read(struct sdw_slave *slave, u32 addr)
 {
-- 
2.47.3

