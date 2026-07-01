Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010040.outbound.protection.outlook.com [52.101.193.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BD028CF6F;
	Wed,  1 Jul 2026 09:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899926; cv=fail; b=EGyMc/hyqiZT5WcqrEr5KF7yzdbZaRdDehqsK15rgkEDL45LjjfNaTlKygYFFSfSOho+p+tsdQZ/wm1ljRbforVbEHgpJyepOUUyWJqN7rpBjXyTgmhF4H0vr6ddmPY3F5C9+/snqtR97eZiqf8tirHIAyj8WzyE7p4Q4iW291k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899926; c=relaxed/simple;
	bh=MpRKzTgwIxVqZyvyNJqBEeWZcWAM6D4K7EekPe8QtSc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TvwWRayG8+CU8UE8k2fEJFeszzoUArlGs5ZR33aHnCVakJCC2wlyAR/tvUOW2f0erisnyLsLUigSilulhQy4He5vnyJ7vW61UbCq51qWMRb8hD+xuJTCOorBRoP0dNDjKJ5ZGUffSamUrmD9BKTf9tKsL4at0c61IJMEyErlriY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dsS+SyT4; arc=fail smtp.client-ip=52.101.193.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dsS+SyT4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2JDc+iZG1O7ZnaZHHaWxEBq4UQPP8FP5nVBD83sAezCnLiYuQYAdFQOOfYSIIq5C7Cd6R6SEM1VeQ5b8Twk95rVfXhodx9AfSe+UE0+bKa9OIDfmSq/gx7BUl3p3M0BkMdBXkmavDVFFJvhGFtbGfGU58XITzBLzwWZ60ZRWyrJTLZ9saViqd7122nF93V9P0Fcu/SH8XAMf6XvHn7Rud61k9YgLJySE5F4fMaIl9R9Un1vhrbbwijwCFp+K9mbaItv+ZxYBj6H2OLEEM/wq/LHkwuVa9LqV/riiM3sTSKDccsDblI28LMyG7TydmXzm41kylfNStwt724iFO+odQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwbe0YT9DVkG4UtmZ5yLoQOfE3xn2mzre3ReoOkpgJc=;
 b=h++5PNHRnFoD13LLB7TNaRdLP0dnF57S87ckCK9ZNvZRe9Ds+45yNJv9ZhchxSmgzMFd1l3Xx7oBlxoXYRbqZbilbMYET47e9yDkosZdPHovslGpUIoIf28JwEogMNjO7cuhJBDieQCKsCGszGraAjx2hcvWcL5L+PvotlWAH5Tr/ccH0I3jbb0mF4i4NRMYjxB4KKFiUbgq3j6vPQ5D9Ynuk0vMPxvPW8E0ZB+mfXK87ILU2Tid1RDibxtNnInDtLjFhpMAYtr3S6bY5q9xiuAXA0W/E2hhKOXYgNyxrl1Y1WRIKA36K6oLse4i4x5mIKdeNy/gHXbDxuU/ak5LGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwbe0YT9DVkG4UtmZ5yLoQOfE3xn2mzre3ReoOkpgJc=;
 b=dsS+SyT4a8Y3AQZw0Ylcd9l/1L7BW/ZW9cmwHEckzp1ERcNtlnP/s0tRYsG9yoO+4mUa902XdxDPlOQEXae4dVLkv34MeA+LObfCRKBEFqIbstb6uXzOrsVqhZCLnqGnwTOteQLTbf3XtzxFUpDv0HlW2xW0rqDJKu86kiB6jdY=
Received: from PH5P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::17)
 by SA1PR12MB6920.namprd12.prod.outlook.com (2603:10b6:806:258::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 09:58:40 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:510:34b:cafe::76) by PH5P222CA0003.outlook.office365.com
 (2603:10b6:510:34b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Wed, 1
 Jul 2026 09:58:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 09:58:40 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 1 Jul
 2026 04:58:35 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<mario.limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 03/16] ASoC: SOF: amd: mask ACP7x PGFSM status poll
Date: Wed, 1 Jul 2026 15:25:04 +0530
Message-ID: <20260701095759.1012929-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260701095759.1012929-1-Vijendar.Mukunda@amd.com>
References: <20260701095759.1012929-1-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|SA1PR12MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: afe289ce-2c01-47ae-5d09-08ded75753d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|376014|1800799024|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eS2fWF2gxAcVxutWtXOdEX6HMzl+cMKu7mInwbBdzz9a8ojX96UTZtHnWJwdOOgaIWk+JP0HIonptUBA+hDl5pvWAsEPhaJDtA5qaqQzH6vqrICk77LAcsQ/w3b1T8j1L7MdhKc+L19gNZpS6jrGzjFHGhnlA5iWzaAb4TJxieZsPG10KGbj1+Q/57SHkGyTobLpYHnhOc4YBFaS9qKxVO8zmH+TYnRwD4VhfwlVL+vthIsI8h2N23a7e6Tswhex8PJr7Ncgds/VxKrAQ0gIZGyg9Zh2V+n02T+YD/30mvr4kaUNYnCSPX0VNM5LpT0ty3PYjGxK1Le3kjtdvKhXYrGGPaBeDIhLxHJao2Uu86AYWSYwEOrU4ejdnSY46R9WJb3UhS8lUCz6J0aRgd6HjmbGrgIwEN6MGoDfOFmKbv/BKv3rgyB+hUWHoEmmSy+yZyPHM9JGF8+MCu9q3fIrJ0Hn0LCR8xU76+Cvpm0DzzudeA/M0Bm0sydvrJJThAhMYjj2REVvIwiruJJEfEF/Kjp2TeBexLYhUqFs2aRTV7B/RrkRXu4ywHLfcDUgAiKa8B8KnhkU1F6fDpsysgeYxZRK27UCILGF7b9T48LiRDOwEbOqx355P1ad4x8a5MY4vZ7RkA/WmebFq2HdQ7AH9091B47To/69i2aghIy9YtFpi1gzRfuJEGm3m/5MkYux
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(376014)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gnU+NwxVTJPDHE6R2TJ6Zfmfi03/fl5ImBvA6pGKr19cBYwJkyQVgpKas1uqr9zemATVL/PuA+rmzVVG0Y11uO5qbriNzs4xu+HmR3kKPQ+zWi+IjC0mMH6XE1aLNQOVttzI6/ocx+YZr1EI5vTXqqD1A6/vinEUlyAybZVXzAdeJTw62t/Rb6jpmN8ziyHjlH3Jp5ODh0qioY8vMcPCjw2HxPW8mt/f/G6mTkdC+OmHVbJGYClenIzqcI5ilnhgpgAPaJ5lxqVZwGwbTihAqeWrsOrucMS9NtJZzuD2T2BA82wia0ZEYXWZGJ3e7MrFF04Eb+u9+UfVS8N55vfL1sAGZ0hHSDM/OyyNClqmFEm/o+4gVc0xjEISdru/892auch4oZGfcXqEK178WgWHMByJdaE1XixjjoeqVm/z6myaAt6luW7O2AMpcHifsGmT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 09:58:40.1129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afe289ce-2c01-47ae-5d09-08ded75753d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6920

For ACP7.B/7.F, poll only the PGFSM tile status bits (P0-P4) and
consider the tiles powered on when the masked status becomes 0.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/amd/acp.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index bb3766aacf0e..f7b22f9979f6 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -577,6 +577,7 @@ static int acp_power_on(struct snd_sof_dev *sdev)
 	unsigned int base = desc->pgfsm_base;
 	unsigned int val;
 	unsigned int acp_pgfsm_status_mask, acp_pgfsm_cntl_mask;
+	bool use_masked_status = false;
 	int ret;
 
 	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, base + PGFSM_STATUS_OFFSET);
@@ -605,6 +606,7 @@ static int acp_power_on(struct snd_sof_dev *sdev)
 	case ACP7F_PCI_ID:
 		acp_pgfsm_status_mask = ACP7X_PGFSM_STATUS_MASK;
 		acp_pgfsm_cntl_mask = ACP7X_PGFSM_CNTL_POWER_ON_MASK;
+		use_masked_status = true;
 		break;
 	default:
 		return -EINVAL;
@@ -614,9 +616,17 @@ static int acp_power_on(struct snd_sof_dev *sdev)
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + PGFSM_CONTROL_OFFSET,
 				  acp_pgfsm_cntl_mask);
 
-	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, base + PGFSM_STATUS_OFFSET, val,
-					    !val, ACP_REG_POLL_INTERVAL,
-					    ACP_REG_POLL_TIMEOUT_US);
+	if (use_masked_status)
+		ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR,
+						    base + PGFSM_STATUS_OFFSET, val,
+						    !(val & acp_pgfsm_status_mask),
+						    ACP_REG_POLL_INTERVAL,
+						    ACP_REG_POLL_TIMEOUT_US);
+	else
+		ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR,
+						    base + PGFSM_STATUS_OFFSET, val,
+						    !val, ACP_REG_POLL_INTERVAL,
+						    ACP_REG_POLL_TIMEOUT_US);
 	if (ret < 0)
 		dev_err(sdev->dev, "timeout in ACP_PGFSM_STATUS read\n");
 
-- 
2.45.2

