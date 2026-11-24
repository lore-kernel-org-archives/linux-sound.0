Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510401;
	b=ylVm2ncG8MSqyRzaHVAP/aDi338cFVFKC59wkRc5dhmR1RvNDRHXodmq47coxGj8wxwB
	 izJqry9EX/w+oafZhC9TX4RZHZb+lKMz3c7wPFYhDOUZY0DhkdbhpTIKpUaTVrAYZ2JN5
	 EOnMWHfhNXYrKHqjDXnoCsHmATy4hVcXK2xRN6yhPQUvw51McJlRig5OoWyWZOhENF+Ab
	 Kujmy1t+t+5zc0ze2y0J7EbVG3IzcTErOipiOMFB9/DXrL1pXzwpOmF2gZx45dcuvhVIh
	 6i1xZbrQ0SuYG/VEBL7nyv3iXjs2R8bMlE1qTyOq6Zr/o5sRnPJi+CPKNMEV3dA4I1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510401;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=NkfvK5xFYaHqNwVm2tWCg9qdhcJ5t/p2p8PaGxF+KpQ=;
	b=mWaKV0wAkuV23HNMHb8SdLNakZo2IMNTD4UM66NvVdpya/DurQyweWedJLMVRa8L7xMm
	 Grr0qk1L8L3qaSWkHEbfbZEKAhpJIRbN6Joni/vm4CcMosVcY82Liykxs14zvWXj3uY//
	 0/8UBAjOTwwA6woOd1/hlb6hSiu48i5izWL4OaUmX2k9HP7i/RO9QC17bNs4Nn+nS330f
	 ySGpQNsdqQN1YwD7FMBmiN00D4gWUXI4nxyDl/NvTVmkZh8qhBf+7z83hT9xLZv2uESeN
	 sMJImdvf4ACoaIJJCPCYhKMQxHmFomIvJe3crSoE0OthxFNL3CyZziHr2pVe25UbCfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=prfXEiSw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.13
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010013.outbound.protection.outlook.com [52.101.85.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90096606A33A;
	Tue, 24 Nov 2026 08:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90096606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=prfXEiSw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlVdEksY79BYcv3Ca4IH2uvVeatk6MOxqEvXAnpBv29zh/iv6SEDudjvEahK8itGM8u09yIIr1HiG6ATQ1LzlGedHJ7WVcuGlURSjUuyRTaCEbFH6nRt46LAPkFCcjVA5mQ4aRUoKnN7b5KS0LT7KNIfm6wnRVkCt0Tr2bwCE9ZFLH5IsDwoaxEwHc4zwMSDZjjn/llRpKS9+ZIyPXJPQ5JSqmuRqfZ3UYCXm4vcrcscdn+t66KEos7DfN5QtCJy5NwxKJBt72EZBREQMHrEV1Q6aygkszqqKnsDy5G7W7DzD+fXN+A8dKZIgBEejxtqFf1NIl/U9XIkPVmjjcsMgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkfvK5xFYaHqNwVm2tWCg9qdhcJ5t/p2p8PaGxF+KpQ=;
 b=gRX5QRtmcwXaCUr5YR1cmLLw35fXbaX0G0nZd+ryqTHmWGyOXKxEyqnHbgiyv/9SWM6Je3lAh9nMFN6w5WLogYmyGBuHfVKsSkj6oDFNwzaY883Rel2pV4CvnQo1W5ri+w9SOIrNsmwYl4GQl8vCQnuXlLPdmhROIfxmF402o7qERPLUXuyjGT+W+g4YmMUMZQaBKhaJlOsY91mueAjlM3dC9ndDFPBq1IEl0k4jDbKnGxgN+/A7hts29wXkspkc6y8a5g9C4zO2hw2cFytkmotlnKmKt/IO8Yc0k1WW2YkK492KRr1UQq1lk89n4u/OzVorwGOQqz6WXHSidKfI8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkfvK5xFYaHqNwVm2tWCg9qdhcJ5t/p2p8PaGxF+KpQ=;
 b=prfXEiSwu9TrU2STHvxNt50iUDW1aGBfdGrpvygT8umMKruxDUTNJAiTb9a0WP/elZugLeYNh+buqfcZb/zL0pQAc1Z6eDDVoqU3Q1IdmcbyuGr/7VnYkBCuU5GvbRdHUKtxRk33VL7B6OWKAN5I7TEOzADP3cZKR5pBJ+SJZho=
Received: from SJ2P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:5db::19)
 by SA3PR12MB9180.namprd12.prod.outlook.com (2603:10b6:806:39b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 08:53:16 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a03:5db:cafe::9a) by SJ2P221CA0010.outlook.office365.com
 (2603:10b6:a03:5db::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 08:53:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:53:16 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:53:16 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:53:15 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 24 Nov 2026 02:53:12 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v9 24/24] soundwire: bus: use pm_runtime_get_if_active() in sdw_handle_slave_alerts()
Date: Tue, 24 Nov 2026 14:18:30 +0530
Message-ID: <20261124085033.682755-25-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124085033.682755-1-Vijendar.Mukunda@amd.com>
References: <20261124085033.682755-1-Vijendar.Mukunda@amd.com>
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
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|SA3PR12MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: c43baed5-7030-43b2-838c-08df4a086185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|10067099003|56012099006|11063799006|261022105027099003|261021123027099003|261028144727099003|261022075727099003|261021121427099003|261026140227099003|261026121527099003|261102123227099003|261009221227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3RQO9XARK9z8yVO/ZEiiADh6xkATsqvSFgHKFxjrzBlOKEYgkKA+/TqGPxnvp4sL6U/LgLH4A8q5Mw6gcNtcVR3bu4GPL+Avf7cb18pFKWkx1gP8LJgb4/Ot/ZhdpW8NPEnsIYjyHbs8KmIWs8vTKCNpSvBlRGQwBAGikvGWaSVunJn4VIJv/lHjCVeK9TF22hFTiuS0xrGXeEZsvsyzGoZnmKRBiBOMGmfTER51sAqEDacGMlz3VAUeBpfhiWa8GxBMPu7pQRAJAvqo29LM5tsBYoAjY+nA9aV4QGgQLIgF38TsmjRpD9vQsagpR/IsstbuSjsetudvNb/TgxpoY5F3LovFSS6xfUxPDSBScB3WKb7Qez+YhiPa2xx7blBh+EISjzY48RYqVVgWAf++zU9BxWFE2Aw6Ixingwm3vpACKoi17SPouVxf72O8Zmx6cuuWSQK3yBOeasUgz7aArdnASQriWjbsH709UVpr8AiTNfbWywrqjXobcjAGvMyhlh5Bo8lQY0LB4TMLO0P2lGP0G5GWvT5+bj8oMexLQB95oQmgnMtbALW+ZXiW+zmke3GjmMSTX4CDN6/lEOP8vGE+hNshJHlw1Kl3j7cHSN8+r4bRTdseuvlBnMICDRWe81iCLUHNnEHDRls5QZHBMm+jf60nU7woe7rSWkHJoiXNqDOMLznXwcmcqjKMNc/GOGg8af+pKRnbq9WGTi3lyg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(261022105027099003)(261021123027099003)(261028144727099003)(261022075727099003)(261021121427099003)(261026140227099003)(261026121527099003)(261102123227099003)(261009221227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xSLg+uJPLZbjsSGP4lf5807PZ33239i9VTZyId5dTVMYHhVKHb1V9VTVxJ9AKYFyod7LfZspGtK06LhKsjCXBeHB04sl1PPyp1wl/9Tr2TvuRRBaUlXpsZeIICeihhIsHeMT8FWeKXJNoh6Q8rHflY37Mh78pYhSxTy1VBGcDSgJDePaCSUvecHiWb8EDXfq7kgfkSjZ70m5zzhZO2KVwonpQhTYImKOIcXU1sEbvirfc897xAprXaRrqt1EoCIMYPBi1P+qFUFmPU2Dc//R9xylGdQmndmWlyCwub4nxs4UMob2/z6X8ud3LVIIpkah93pcErLUUNtMCHI6dfRj9PiLiNWbAQkZDX/cboSuUCTSU2YP6t2m2Fmj9/3t+iVyZJ3OAa10n+fNnPUdVy1+MjI/91dpAvwUfils/3TdV76s2BmxUlMni2aBGmlLtY1K
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:53:16.4956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c43baed5-7030-43b2-838c-08df4a086185
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9180

sdw_handle_slave_alerts() calls pm_runtime_get_sync(&slave->dev) which,
when slave->dev is not in RPM_ACTIVE, calls rpm_resume() on the slave.
rpm_resume() propagates synchronously up the parent chain: slave->dev ->
bus->dev -> manager->dev. If manager->dev is in RPM_SUSPENDING at that
point, rpm_resume() blocks on dev->power.wait_queue waiting for the
suspend to complete.

This creates a deadlock: the manager's runtime_suspend callback
(e.g. amd_suspend_runtime() or intel_suspend_runtime()) is blocked in
cancel_work_sync() waiting for the alert work to finish, while the alert
work is blocked in pm_runtime_get_sync() waiting for the manager's
runtime_suspend to complete.

Fix this by first checking the manager device state using
pm_runtime_get_if_active() on slave->bus->dev->parent (the physical
manager device). This is an atomic check: if it returns 1 the usage
counter is incremented in the same operation and the manager cannot
transition to RPM_SUSPENDING while the reference is held.

- If the manager reference cannot be taken (ret == 0, manager is not
  RPM_ACTIVE): return early to defer the alert. By PM ordering the slave
  is already RPM_SUSPENDED and hardware is inaccessible. The MIPI
  SoundWire spec guarantees the peripheral re-asserts the alert after
  clock resume; when the link fully powers off the peripheral loses
  power and its alert state does not survive, so the early return is
  harmless in both cases. This also closes the race where the slave is
  in RPM_SUSPENDING at the check: if the slave's suspend completes
  before handle_nested_irq() runs and the manager enters RPM_SUSPENDING,
  pm_runtime_get_if_active(mgr_dev) would have returned 0 and the
  function would already have returned early.

- If the manager reference is taken (ret > 0, manager is RPM_ACTIVE):
  proceed with pm_runtime_resume_and_get(&slave->dev) to resume the
  slave. Holding the manager reference prevents the manager from
  entering RPM_SUSPENDING while the slave resumes, closing the deadlock
  window for all slave PM states.

- If ret < 0 (-EINVAL, PM disabled on manager): fall through without a
  manager reference. PM being disabled means no suspend/resume callbacks
  run, so no deadlock risk. This is consistent with the original -EACCES
  exemption for the slave.

pm_runtime_resume_and_get() is used for the slave (instead of
pm_runtime_get_sync()) because it does not increment the usage counter
on error, simplifying the error-path accounting. Introduce have_pm_ref
and have_mgr_ref booleans to guard the pm_runtime_put calls at io_err:
so they are only reached when a reference was actually taken. The
manager reference is released at the new mgr_put: label after io_err:.

Fixes: aa79293517b3 ("soundwire: bus: fix io error when processing alert event")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/bus.c | 52 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index aeaae5a57c89..0f8d63477927 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1667,15 +1667,52 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	u8 buf, buf2[2];
 	bool parity_check;
 	bool parity_quirk;
+	bool have_pm_ref = false;
+	bool have_mgr_ref = false;
+	struct device *mgr_dev = slave->bus->dev->parent;
 
 	sdw_modify_slave_status(slave, SDW_SLAVE_ALERT);
 
-	ret = pm_runtime_get_sync(&slave->dev);
+	ret = pm_runtime_get_if_active(mgr_dev);
+	if (ret == 0) {
+		/*
+		 * Manager is not RPM_ACTIVE; slave is already RPM_SUSPENDED
+		 * by PM ordering. Return early to avoid I/O on inaccessible
+		 * hardware and to prevent a deadlock: if the manager is in
+		 * RPM_SUSPENDING, its runtime_suspend callback may be blocked
+		 * in cancel_work_sync() waiting for this work, while this work
+		 * would block in pm_runtime_resume_and_get() waiting for the
+		 * manager to complete its suspend.
+		 *
+		 * When the SoundWire link enters clock-stop mode, the MIPI
+		 * SoundWire spec guarantees the peripheral re-asserts the
+		 * alert after clock resume, so the interrupt is deferred
+		 * rather than dropped. When the link fully powers off
+		 * (e.g. D3 or equivalent), the peripheral loses power and
+		 * its alert state does not survive; the early return is
+		 * harmless.
+		 */
+		dev_dbg(&slave->dev, "Alert deferred: manager not active\n");
+		return 0;
+	}
+	if (ret > 0)
+		have_mgr_ref = true;
+	/*
+	 * ret < 0 (-EINVAL): PM is disabled (CONFIG_PM=n or disable_depth > 0).
+	 * Fall through without a manager reference.
+	 */
+
+	ret = pm_runtime_resume_and_get(&slave->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err(&slave->dev, "Failed to resume device: %d\n", ret);
-		pm_runtime_put_noidle(&slave->dev);
-		return ret;
+		goto mgr_put;
 	}
+	if (ret >= 0)
+		have_pm_ref = true;
+	/*
+	 * ret == -EACCES: PM is disabled on slave; fall through without a
+	 * slave reference, consistent with the original -EACCES exemption.
+	 */
 
 	/* Read Intstat 1, Intstat 2 and Intstat 3 registers */
 	ret = sdw_read_no_pm(slave, SDW_SCP_INT1);
@@ -1861,8 +1898,13 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		dev_warn(&slave->dev, "Reached MAX_RETRY on alert read\n");
 
 io_err:
-	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
+	if (have_pm_ref) {
+		pm_runtime_mark_last_busy(&slave->dev);
+		pm_runtime_put_autosuspend(&slave->dev);
+	}
+mgr_put:
+	if (have_mgr_ref)
+		pm_runtime_put(mgr_dev);
 
 	return ret;
 }
-- 
2.53.0

