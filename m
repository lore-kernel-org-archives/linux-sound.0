Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010017.outbound.protection.outlook.com [52.101.56.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F50F39F17E
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 15:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778513824; cv=fail; b=ZkPsJ85Wqx2vfOqc+qGAc7VfVKQGMUnWtCSKzxiz0uMwa3LovUvifMVoKCKCaeRY/zG5msSVkczKdGTIGGEiLxye+7omMSlt5S9kf0Q1tRAe6h9wtK0sgU3lnSgBY3vfiCNEKw4+aeNkCrJWWhBmzRPS9hqyk44TsEYln+H4Tok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778513824; c=relaxed/simple;
	bh=2MyNRPTHlAU34aHpQmplQeWNGfg49QKuewfmO3UsArg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rMEg0z6JrTgTEjxTnVP700uoUtk2geD3F5zj88bMhg7AtwOwBPy0+a5qMVuzqFncwepsf+IwcfupfuaWxKoqp/o3dj8srXctgRe9pQhZcs28EszX2Au5ZjurPrxKboyxdOdkx31X7sjjJv6QgHWXGKaEHbFREG8pX0kPUNl8u4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5sg58OYE; arc=fail smtp.client-ip=52.101.56.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5sg58OYE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TU/axiZhQdmrb0kpvwAtMa1r+AaCx6MbbbTypIurlsS3fmlqdcz6PTF89uu29teZcY+VMgvzmYoNugy1tRi6DJQKVV+yPxKIjMu/7yGme5RRHhJhfL0lm4Vpq4vRSWS6Uo4aByiGeZh3OAxeoXl5ZCpR862J6e6BZzYKMsOZWB9RIJhiw0a1xV5r+JbU1Itgs1oojRXNPmSBJ6LNsJIP5DLKIytFFziYdveWjH0iWrsRg/wF0MjoC1iWF2d0rqUFkVj7yvyn6UF8SjqksxXiq0vQMCvQxpiWnFweOfZ2BvlT5SY32AnHEuumEUyAkimsLIq2P995hMH7M0l7ERRSZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5d4osKjLuHBh5EB5zalHKRSzx9Uw2ebZeGc9dhTmMU=;
 b=ow3hR0kOOPbOU/HtqhFiPUGTwgdZz4pxBNTgYyIDeGr4SLLD3Cecy9UJHrhmypQyRyuA0D6Co19e+uf8V2DB5iPgPh4HQSaUPZ8jaehNltySdzyNfaP4eE/mgYsjoaq47enLjrHwUqPf3Op4wdlbX11SpGp9mjHjf032V9TUNQKrFuuoE/4Hq8E7ESrsdNzO4ZpbUZUClp+oHSoHg6oEThIj32WijoiUbRhHDRyzxqgRsw+Yl1nJCNsk89C48BvZmkTR3Q3GHRLBin150BdGeuuyjz/2FYQ9i5PI1AasKGhHRqGv/KcVUAhWNVREjBqqClFTUFpWOmvmaccXybqnHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5d4osKjLuHBh5EB5zalHKRSzx9Uw2ebZeGc9dhTmMU=;
 b=5sg58OYE3f6690iZrlsLdMjGtfZ5HkRqf1gl3WYNXrGxA5++crdCurzpRDklvfwXJx90v1I8qaLMQhET5F+v6ojZkUJprijHVxJcloPWq/drCOyLaPqvbY9kWVinhELJaatJXuKcuMV5SOog0GtfyKkWgIgR5s8Sa3SbI3jhJJc=
Received: from CY5PR17CA0045.namprd17.prod.outlook.com (2603:10b6:930:12::17)
 by LV2PR12MB5989.namprd12.prod.outlook.com (2603:10b6:408:171::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 15:36:56 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:930:12:cafe::d) by CY5PR17CA0045.outlook.office365.com
 (2603:10b6:930:12::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 15:36:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 15:36:55 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 10:36:53 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <lgirdwood@gmail.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<daniel.baluta@nxp.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <mario.limonciello@amd.com>
CC: Dan Carpenter <error27@gmail.com>, <sound-open-firmware@alsa-project.org>,
	<linux-sound@vger.kernel.org>
Subject: [PATCH] ASoC: SOF: amd: Fix error code handling in psp_send_cmd()
Date: Mon, 11 May 2026 10:36:36 -0500
Message-ID: <20260511153638.724810-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|LV2PR12MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: 00a167c0-3219-4c0c-87db-08deaf73218d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|1800799024|18002099003|11063799003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	3O4EkPRILfbZqnziO/qW0PP4xBCIUbezVSlOdv5U7T+vSwrAycl6i20vlS6eYkOUTiFQ2dEPzjEqYupzGjI2NzqDtpnF8hFbS78kYhCxArgxq+xY0/nxVXDligx7g5yE9DfgOZnZn773eRV0aT5K2d4+x/AdTLnvb34asSRjp6w/gCGIYApoHoVYwslPGUEe5AZWyMfTdWfXY04gomvRlkRm88hENB8zMs8+yLLEXW5VoBa3FX1DH6dJ1ZsSQ/ZYV9gok0+oG5FYDA+NpCN4u/m3ZFTnUIKW2vI+uGB6uymLqFrn7ZX5hsoRqqYx8o+W1/GL7kTO2aHKZVYObwOcimbGD3PG06voP79ZYVx7AwxgZ6HKMi69stCTHJPmTBrt0hYZHQgpwl7rDY9I5ngW9fP4reWJGL2vUUyByPXpTU1DSKAmJw+FgMTAs3nEtNbb7T5/yIShu1CTfAvtP6Bcq8BUKBvRfqdLj0DN/YvsUyWODfP0PsOZ+wqq/onXKLvWwI1faLbyZksvbajfAR9bvqTugtNRp/ag9MUW+cCluKg9VKMja8k+D/LqGu4mPMzhqPpqcwnJT5vrFKQvgY8wf+nEOxCsTNvSEv1FeOgKt9dzXhPpLdqGTSNpj0IEPPHn8R6DHJl1qQvv/Cb6bugF0o+8mtkWZWmnR2tBm9nc+xQ2EQ2fuOUcCkgypTdxVkXPSAjMbLIOJY/LUdw2ZM4x3/iPOqd76IrvCjvc3S5A1GFHCUNV/mYTeE4jzLJ7DQsNbEsbeQxsXglrAOStdhKTrqBU5DDVEI2C4vOF2yfeOdo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(11063799003)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JY1G7pRtssk6NYNfw2P3pj6cSua9BH9HOkPrLMNA7vY0U7QP9ZxNR9eQKwwkEmNZvCxgFQjoqJi3lrgy+sLbg1II7clCAPwU0WdSo7aPcZ1h+RroczXAsVdoKf7J31ZOVXOLOa6lwAT3rQCsrjf5jl4oMK1YtXxSC9mIzD7vF7CSRFmtWecOgQiUwRatxZoxCffweP77Cv19OM7qTIy9Ib9umc4S7QgHPY2+zM/OLce0oT6JQdNsWiHvyN5ZRRENYdlQVEVsu+emPsiYPA0ybbY0aDWJ6DhM4pZiCuhi+BvOjKRTjYjT5B9ecrfUmbTma/iRo+VLPpa84ioCH22QH561KzZRlIYJDpfqoeSeKh9OYqdPvGCXxPWOEUGVcacEVTM3sVK/ijrIqwY+IEh57Bf8NWOzogxnH5D3mUm9HQvfr7Gcqd6ee2fWfVZ2Tep7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 15:36:55.1326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a167c0-3219-4c0c-87db-08deaf73218d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5989

The smn_read_register() helper returns negative error codes on failure
or the register value on success. When used with read_poll_timeout(),
the return value is stored in the 'data' variable.

Currently 'data' is declared as u32, which causes negative error codes
to be cast to large positive values. This makes the condition 'data > 0'
incorrectly treat errors as success.

Fix by changing 'data' from u32 to int, matching the pattern used in
psp_mbox_ready() which correctly handles the same helper function.

Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/linux-sound/agGES8vWrLOrBu28@stanley.mountain/
Fixes: f120cf33d232 ("ASoC: SOF: amd: Use AMD_NODE")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/sof/amd/acp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 71a18f156de23..f615b8d1c8020 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -223,7 +223,7 @@ static int psp_send_cmd(struct acp_dev_data *adata, int cmd)
 {
 	struct snd_sof_dev *sdev = adata->dev;
 	int ret;
-	u32 data;
+	int data;
 
 	if (!cmd)
 		return -EINVAL;
-- 
2.43.0

