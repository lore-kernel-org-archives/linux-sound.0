Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012016.outbound.protection.outlook.com [40.93.195.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E91400DE8;
	Wed,  1 Jul 2026 09:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899929; cv=fail; b=iaDky2TiZUQ2FMZXMJKOmxeI6JWvuxCyS9Yp0O48ZzqFWdgPfPBgCVQXfDA/E3ZrtwJV4BJF1QyUjcrU0PAbdJwsuhdQKG4rjXO3PE+lIA5hLaokGmvhaC5siAC+sir5y0tbcnOock9aU7Jlg7hTvwH8aWJDF192SZMvwzeB1UA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899929; c=relaxed/simple;
	bh=RujFb/0l3NVtWFyRVvWDo9MnhjZgO4pTnpGmahCfin4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vAhSkoFn4h86EWrwPJIOKSw2kYWoI0mXYjPIVw8dRfemObe0LGG1HufurCh8VRHunG5gFsHv5peK8UKkkb3jbmLIHKVLKMXnW35KPHCCnBQ41xAPofyvHKevqUO0Yja1XFXuo8OMFfxQ9NjlbmDD0/wDK7f/6a49vPwoCHswnOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RQx6P1zG; arc=fail smtp.client-ip=40.93.195.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RQx6P1zG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IL4LmudmFthja5vR8h6x2kjm5XE6NLNLYhNi+Kggg5AFIPDdcPJ3Mw9XgcIpk/AmiXTH1dSXudHcd7iR8EA2JwLFA5x7x5lz45mAFONQF7pYDoFYFT99OnSOcTyUoln9evAnUzO94cBoJDXdUWPXyC7RUjBURGS0QPSGJuRWiz1+ptiNZqW2nHKkWv3CqR/0Ltc7uKX4o3m2ea3AzIEe5cHmrUJG9mTtoN60yVTpi4CJyoXr0Jdeuz2AyfK1SnpHmezXexf8/GeDwvqDzXl9vsl0MePI8vf0cu8Ei78Tqxe0U7VXS2bJTATuHaxA6hSGYNblqrUswqIE5xA75OqOvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5/T7AEWVsegpqhZsxLAcjv9+iAUYH002vjIe+bKNhU=;
 b=VxLfVdsjTGIW8qKhPgiTJhY31zTKK2MP/tdZkYywqcHnBPwDsE1GO9q2+GrDOWU6fjxYDszYIXb9YLUZceStwYE8GW4Aoxxf85SY+o4Xxh3rUsBfvCueCaqxu+axci+V0yFKPj1z7JnpsVwh73zTXeguU5AzyE1yAZyiGbnf1qQ4fyQ2ht9B4qeTUQ7r1qTy/FCs5WAybYt18VJcTeH2KH/oNxomx8rjmvFUR8ivvx34csKOjJfgyUhZIB21g7AL3sCz/hBpY/mvi5scnoHz0hKUHnFfzH65XHt4lZMzNO32HaFxb/nNajGQ7oMkbo7xx18mlwIsoKdGjgBgeajxNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5/T7AEWVsegpqhZsxLAcjv9+iAUYH002vjIe+bKNhU=;
 b=RQx6P1zG9d/mS0N0+8Jw21we5xXlGREpP3IFWj/YSxgrcez5wPTC4F1hGmth+C4peKYJKiSYqHinoVPFDuWwd+bNg9O0yysvnRV8n0b+TEDELGWPPjO5ti88xNRgJsgXbqdZy9BNOLTq6q/zjZhwtwDNfxBISNjakbGbl3BVoHI=
Received: from SA9PR13CA0002.namprd13.prod.outlook.com (2603:10b6:806:21::7)
 by SN7PR12MB7323.namprd12.prod.outlook.com (2603:10b6:806:29a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 09:58:44 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:806:21:cafe::10) by SA9PR13CA0002.outlook.office365.com
 (2603:10b6:806:21::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 09:58:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 09:58:43 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 1 Jul
 2026 04:58:39 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<mario.limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 04/16] ASoC: SOF: amd: refactor SW1 I2S error reason clear in acp_irq_handler
Date: Wed, 1 Jul 2026 15:25:05 +0530
Message-ID: <20260701095759.1012929-5-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|SN7PR12MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 58c8fd10-c0f9-4479-9eee-08ded7575620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|82310400026|36860700016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	CBNnonIbl8jD4vqERnzFJixrNpYt9Qb/CXN1haZ1E2wREAnQNMKQW0niyZCWgYlDjgSY+mZLXxh71KKcDeM4lmAFviho1aiTfLpSrhzGYJ9c4353rfudBS8CQTCQzwEEVUuX+oG9MFD4R1HmWOETQZYkdT5nuBhKEUF91uLHG6hVHJS2NtZtsif//ospW1bAMjCrZz2ZMg7xZ6PSRXC6zLnNru/zZ1eK8BZruYKWG2Hd5bTYTMMZc0pdjs5EHFjs85bmmCb22aBC8gb/AQdpK7L6aOYt0BaplUIJomNCdFfHaXgqLw/eq3b9lFjnpJVtkW/gfd/yKqplOXWn9cpTDGesZzaJRY4NaC8Y10d+m61SwdW+lRZUoHmqkzNjKeP5sUEB7evHjFp7jtZl5ZsVUrH0irHfTTHPYrwgWrSgWFWFWMHEGeF6LPJDujDThaBW56i7Vz8oh8VN+qdSBO7foGN/OMznKVYawBVVDSSHSYN1PQhz2gy+YtnXmVWdOtFklrrMJVjqKw2X2rO2iImfKNCzmdUIpJLBcG0E/IRSq6WGexsJtabU3WMvci4ofyHsit4Hds2ahIdnmlSqTgntDPZ1KhW+l52ooUOzqml9036WyLV70DQnZ2SIShfP0afYwMUZcJiWk01p6Ct9LkNEInWhGYDpfMSicDrRCdgBBKioQ7+wS3Ka0Pb0T5sJj2WDT4KfrDPey8AASjAdCOcZfQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(82310400026)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QEoI1EsMmZxnBygkhAQCOgLFDgx9X1Gn7fwx31sMLQfy1kbA6EbrxT1U2Ity7iyifJW+Q2NY/7+urxhdXIgKKba6KHXXdMMWMrz+o86M7HAXFs6fFvQL6rgmwjTyanlRQf5wthMfbza1TKIoRjsLQiAwjCXDNw5G3KQ0QOaolvJIcMLM8+64c9jKMOvIjYFubl20p8CZbFFvCur38zdrbMrkmFYskMVzjZyYTlfj9wbY/qeTAqPfQ/AWvfA3kZlB8uZgLyGbzzfE7IPpEaW8NmsbkwU4ceBGgS04DmiwM/bGzQ83CHrohNuZrdCOiIbE7iKqZXJihhm0QrtSWTLHPQb1dqoY5jfJuwxP1gOzkPd3Rn7OCuX+aIwRE9Tp1RuO0KNimhpjkmEW/fiXQTJ7M/wcAtWZR1HqqC2N26kD6v3ji0tyNxFTrDrDPUSe4nkQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 09:58:43.9670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c8fd10-c0f9-4479-9eee-08ded7575620
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7323

Replace the open-coded pci_rev comparison with a switch statement for
clearing ACP_SW1_I2S_ERROR_REASON. This makes the per-platform control
explicit and easier to extend.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/amd/acp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index f7b22f9979f6..1f0fc052ea1a 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -540,8 +540,17 @@ static irqreturn_t acp_irq_handler(int irq, void *dev_id)
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_ERROR_IRQ_MASK);
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_sw0_i2s_err_reason, 0);
 		/* ACP_SW1_I2S_ERROR_REASON is newly added register from rmb platform onwards */
-		if (adata->pci_rev >= ACP_RMB_PCI_ID)
+		switch (adata->pci_rev) {
+		case ACP_RMB_PCI_ID:
+		case ACP63_PCI_ID:
+		case ACP70_PCI_ID:
+		case ACP71_PCI_ID:
+		case ACP72_PCI_ID:
 			snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SW1_I2S_ERROR_REASON, 0);
+			break;
+		default:
+			break;
+		}
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_error_stat, 0);
 		irq_flag = 1;
 	}
-- 
2.45.2

