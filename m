Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453746;
	b=uikO/Qge2FAGs3XlFjXMsViA9kJDZ0gQ7y1NQjLGlCw5OOReb8rXHxFfTfNUHfr01TXR
	 42hL/QIWEHgejC4GGu48URoNi9C+hT7sZPfYQCKrt/8ZUlpF/5csEIBl+IGFgQXAmZUPf
	 gyznD0pSoPg7liSBDvp4vSkSfelkoAZOPWgyVEEKQmdwTf+l8G5W89hpZR/5Amdbn5JT9
	 NjrrR7JZCPQVr8UGE+vJHi+78bilLWxBurESj5q3AMiWJUOmRBIhk97X012H0ZCAfyr6O
	 CODxPiBgk4TB+v9nGrb8pOPrWLMa9uA9RwUceCqPxydw+l6ic7CyX2lZbcrncmLXQng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453746;
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
	bh=Ho/K+3/yRKdaXRQ1ELx8VQrEngDf5FKf9MeZ20CrTZQ=;
	b=Z9S2wakTTCwJVvCkU2BeKL0iWHZm2DKyTPJDpXTRqQZcDBRmor8MYgcKF+D+mdAJ8wCl
	 VnVOIBEBzaMcWMLfybJKHwgOFuYSrSw4iBKqdXaK+K56976YioiIbyi+zld++kByjYCHE
	 MrCAMHkWVn7OdWuaC/v7pI2S4iQQdkcwH0NUO6m3hgRejv3CKx8iV9t6LQw8UJxmkYMGS
	 aSC2WnkXrSCnHwOpKlB7pHWaBWr54EsCpLbYIwZAZY8Gip/CyjrVDSX60/gMTEmL3Xqs1
	 UDSqD8QwwI0K99ARAodvlA5OFYuyWYFSQ6FyzSpV75W5jS5ONlIT8b1KcdTShjbcoPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bBPAIo11;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.66
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012066.outbound.protection.outlook.com [52.101.48.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D581C606A31F;
	Mon, 23 Nov 2026 17:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D581C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bBPAIo11
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Upze3ZPsyRDvSHWZ2OhWZYR5uNnQZGOWkthnCmyZQgNiesF6wzNFYDHEySIsiuCEWC916N4JPHYpGAMt7LcmZLg6NMroI/5cYYzKeYT8V8ub8VCOGzQTB2CnjmypMGRox9QqWBi5ckTr+hXAvHD2jJRFBvZCVeb0CKbTC7CmnyP8lqZAVRHpibjNB79LhQOTV36FD+EZ/goRzmCrfeaA3TkA/ezYCLOjmJSOPERCE40Fb7vfuNY6fu3+Fcl5c10sx/fqwAetzJDlKsnyB0laD0eGWyMMj3NpQPnEvqsdFcCwlRM70mo6U+JWZq339IX1DBRq2Fx45UeUyu8TZ9I9ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ho/K+3/yRKdaXRQ1ELx8VQrEngDf5FKf9MeZ20CrTZQ=;
 b=M/69r77lQSRFWCQIy/veIHFviw2qHW99WXlmG3TLrGAiKKfFO3cTLmnd5PoLjHwHg2LPHP+rLf+Oud3m8zWBfBlozXwZgKFv2nsKOgScSKPMDj21VGyw4BFMK+GoG7jMt758DcFQSy42OfXl47QSno786THS34CyyMjuLbky0BV1JX+pipeBT7bQyiAhSQRyq4V0hxeLPDAfF/lPV+zqkWIXpCx6abdcKixlaj8uNxuTkTn44DmU7+JYNSHJB/RhJ9aWBnk4I6d7VMEykFcT4c+2bnyGc2M2p/gfm/eotYkexlTro6rjTyJJLMAUmL2wfMiawleWA9ZpjXo15sydAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ho/K+3/yRKdaXRQ1ELx8VQrEngDf5FKf9MeZ20CrTZQ=;
 b=bBPAIo11AkVcadd+aUfekHLqc6tQopdE7qGsPcrROyHtOj1r/Xtb6enw+l2a33RlEiL+iJu/kIhRyIrBR8AkZLpc/cQIHVGRtDQB3rCnpFUF5D81zTXG7WTC0xNsTfjxZL7O8jLX5JFJs4ImufcWgqWlh6A06cC6zuqPtoHLFtY=
Received: from CH0PR13CA0031.namprd13.prod.outlook.com (2603:10b6:610:b2::6)
 by MN2PR12MB4302.namprd12.prod.outlook.com (2603:10b6:208:1de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 17:09:01 +0000
Received: from BL6PEPF0006C3E1.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::64) by CH0PR13CA0031.outlook.office365.com
 (2603:10b6:610:b2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Mon, 23
 Nov 2026 17:09:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0006C3E1.mail.protection.outlook.com (10.167.249.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:09:00 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:59 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:56 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:08:53 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 24/24] soundwire: bus: use pm_runtime_get_if_active() in sdw_handle_slave_alerts()
Date: Mon, 23 Nov 2026 22:27:45 +0530
Message-ID: <20261123170520.1380924-25-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123170520.1380924-1-Vijendar.Mukunda@amd.com>
References: <20261123170520.1380924-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3E1:EE_|MN2PR12MB4302:EE_
X-MS-Office365-Filtering-Correlation-Id: 58cba893-ecb7-4558-a683-08df49847815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|22082099003|6133799003|18002099003|260925021911599003|261028144727099003|56012099006|260925021311599003|260925022911599003|261021121427099003|261102123227099003|11063799006|261022105027099003|261026140227099003|261022075727099003|261021123027099003|261026121527099003|261009223027099003|261009221227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	tB/o2lzVX3CW6+KHcGGYSoVm1+az1sUmjZqYL8+nGJNVN+jJK5G+VupMEJZsgm6pd2Dv19t+ugvHjSdkX4+wm9gY+VQNJEcN/HdflF5p9F1Nww5JHryPzstzKZNe7+k20ljXBBDmD/te6mVb13BZpE6fKjj/J3NtXEH8hCoPf3nmfoQ8Uz6kNaobDN7p0q3xtEhlBqB/m2RLzI2XXB9HA2xBT/22cJPNmsfvwwYmXwzlwnDcV8qx6IbHuCe9ZedsICmRMV6o/q38bNnd2QIJD842L48Qfmrqjev+5UHFSLGj6D2iLnn7A7qjlGEF70vIR89IybVzDe5AW8jN/+apuDhcZDpWtAlYrRZ6hcCvGxFJ+wFctBFKWoBoOpgUVQWjCIhf2Pl/Bscjj90e8hfk4i8yt7llxq2MjN8AhLchSZOp98NyitwU9teuBeRuSrULoZ9YJt7rm+rSYpyINiv6QQ1GM0lceLeIZC1zQW0XgMTPM3PLkmGnDnUakAHzYaERDivirEmqklYY3JVmBCJH0T+UO1k76+QhlxUDjCuNBCgx2alQB9klG8uVIPZpoZZbXT7F5BLAm+jZ0XnV+ujS/x9izi3EcU4gx26MmpPMkD1alOAP9KiP6AQm0iz5w1C3M0VS7jl+BpZWu2YfvN9sj5GH0rEIwb+7MBd3IJrL0UddtSOSFYwKWuIOODrZGVlshlTxwdumy1GkOjzq0mFmVQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(22082099003)(6133799003)(18002099003)(260925021911599003)(261028144727099003)(56012099006)(260925021311599003)(260925022911599003)(261021121427099003)(261102123227099003)(11063799006)(261022105027099003)(261026140227099003)(261022075727099003)(261021123027099003)(261026121527099003)(261009223027099003)(261009221227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KXXvyrK4fbaEOzejm5Ym6OamZvlBbddHEISGbmJ/MXVpGGlnzd8UM19OdzU4fLhxj2w/tyXSRlUFBKakEA6SGRp7gjCREDVqH0oT52F5K0NYDftvxT0i1LwJxM+QKA3c9Cex57y5Wg8O1gVdpkAaOtpTuEaE95T7+lQJsDUTgk1VdHSldCyDhQGSTGhIqeRqzJ4VNLzGWmQ0QRTTHAkNchv7uxOzeCeOVCmRiup1uOo70fJX/ZQ/Cn9YQDWo7OvodcA4wzMP186I8X3/3z6O3TVMd4/UbwoQOQ8R35tq7WVYTcSd94fZqPBTiPsRNJyEgT4ae8tvmnqV0COSUPCqm1AgB6/ORpYgL+791VjPprrlOCSG0/y4VhIqAdNE4+wGDiOryDX0vkaMsRX5P/o1TVykg6Da6WkedE2zh66DvuJNd1BVxfUlpyfsxcco7Z9h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:09:00.8640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58cba893-ecb7-4558-a683-08df49847815
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3E1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302

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

Fix this by replacing pm_runtime_get_sync() with
pm_runtime_get_if_active(), which increments the usage counter and
returns 1 only if slave->dev is already in RPM_ACTIVE, and returns 0
immediately without calling rpm_resume() otherwise.

Children suspend before parents, so when the parent manager is in
RPM_SUSPENDING the slave is already RPM_SUSPENDED. The early return is
therefore conditioned on pm_runtime_status_suspended() so that only a
genuinely suspended slave triggers the deferral path:

- When the SoundWire link enters clock-stop mode, the MIPI SoundWire
  spec guarantees the peripheral re-asserts the alert after clock
  resume, so the interrupt is deferred rather than dropped.
- When the link fully powers off (e.g. D3 or equivalent), the
  peripheral loses power and its alert state does not survive; the
  early return is harmless.

When ret == 0 but the slave is not suspended (RPM_RESUMING or
RPM_SUSPENDING), the parent manager must be active so there is no
deadlock risk and the hardware is accessible. These cases fall through
to read and clear interrupt registers without a PM reference.

When ret == 0, the usage counter was not incremented, so the early
return must bypass the io_err: label (which calls
pm_runtime_put_autosuspend()) to avoid a reference count underflow.

pm_runtime_get_if_active() returns -EINVAL when PM is disabled on the
device (disable_depth > 0, e.g. during sdw_delete_slave() teardown) or
when CONFIG_PM=n. In both cases the old pm_runtime_get_sync() path
returned -EACCES, which the original guard exempted so alert handling
could proceed without a PM reference. Preserve this behaviour: when
ret < 0, fall through to read and clear hardware interrupt registers
without a reference. Introduce have_pm_ref to guard the
pm_runtime_put_autosuspend() call at io_err: so it is only reached when
a reference was actually taken.

Fixes: e9537962519e ("soundwire: bus: Fix unbalanced pm_runtime_put() causing usage count underflow")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/bus.c | 45 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index aeaae5a57c89..b53fa93a7cd5 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1667,15 +1667,44 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	u8 buf, buf2[2];
 	bool parity_check;
 	bool parity_quirk;
+	bool have_pm_ref = false;
 
 	sdw_modify_slave_status(slave, SDW_SLAVE_ALERT);
 
-	ret = pm_runtime_get_sync(&slave->dev);
-	if (ret < 0 && ret != -EACCES) {
-		dev_err(&slave->dev, "Failed to resume device: %d\n", ret);
-		pm_runtime_put_noidle(&slave->dev);
-		return ret;
+	ret = pm_runtime_get_if_active(&slave->dev);
+	if (ret == 0 && pm_runtime_status_suspended(&slave->dev)) {
+		/*
+		 * Slave device is genuinely suspended. Return early to avoid
+		 * I/O on an inaccessible device and to prevent a deadlock:
+		 * children suspend before parents, so a suspended slave
+		 * implies the parent manager may be in RPM_SUSPENDING, where
+		 * its runtime_suspend callback blocks in cancel_work_sync().
+		 * Calling pm_runtime_get_sync() here would propagate up to
+		 * the manager and deadlock.
+		 *
+		 * When the SoundWire link enters clock-stop mode, the MIPI
+		 * SoundWire spec guarantees the peripheral re-asserts the
+		 * alert after clock resume, so the interrupt is deferred
+		 * rather than dropped. When the link fully powers off
+		 * (e.g. D3 or equivalent), the peripheral loses power and
+		 * its alert state does not survive; the early return is
+		 * harmless.
+		 */
+		dev_dbg(&slave->dev, "Alert deferred: slave suspended\n");
+		return 0;
 	}
+	/*
+	 * ret == 0 but slave not suspended (RPM_RESUMING or RPM_SUSPENDING):
+	 * hardware is accessible and no deadlock risk applies since the parent
+	 * manager must be active for the slave to be resuming. Proceed
+	 * without a PM reference to read and clear interrupt registers.
+	 * ret < 0 (-EINVAL): PM is disabled (disable_depth > 0 or CONFIG_PM=n);
+	 * proceed without a reference, consistent with the previous
+	 * -EACCES exemption. Skip PM release inside io_err: since no reference
+	 * was taken.
+	 */
+	if (ret > 0)
+		have_pm_ref = true;
 
 	/* Read Intstat 1, Intstat 2 and Intstat 3 registers */
 	ret = sdw_read_no_pm(slave, SDW_SCP_INT1);
@@ -1861,8 +1890,10 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		dev_warn(&slave->dev, "Reached MAX_RETRY on alert read\n");
 
 io_err:
-	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
+	if (have_pm_ref) {
+		pm_runtime_mark_last_busy(&slave->dev);
+		pm_runtime_put_autosuspend(&slave->dev);
+	}
 
 	return ret;
 }
-- 
2.53.0

