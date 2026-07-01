Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010060.outbound.protection.outlook.com [52.101.61.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A592240960A;
	Wed,  1 Jul 2026 09:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899953; cv=fail; b=iKeiOLffrv0reCk/Qx6diqIWPthEXBuRKlNDqsXF8VFG1O7UenhBb9NmQ21XXhJdgZkqmZQEWcKTVytsLyrLMdeH6cllkSFxs5Pa059Qji99RYM8xIecPCcHeDeOxsZVP60KA+NMEd7mpzlu4sdiKTp1jXVr6zojXp4QHgtSCx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899953; c=relaxed/simple;
	bh=LdmhaIY18aDqlBsDOtbkeyAKamM5qiz6T3GyUJwmKGU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fHIxDUL+CbROjZdaZ7OyiJP7ZMYpyi31ruQckhv6jYgK5zQag0c2luZuSumYpTuMwjISQObOBlendhhm49rBSLEgAjEMfewNbrO5Is/kJVm8puDRQqIdjk8A8mI4eexxlPR8Iy9KLqeizyYE0TBuenlg3SovpQcxY9kvYjDbY6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TVOAAWZG; arc=fail smtp.client-ip=52.101.61.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TVOAAWZG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJA7ZLHDRDGQ3nXJWtZO5wBzub85eRJXSQW2m8u3/RGOkyW6+CRb2ZIj+L2eqYeKErz+mNUbmt5d8npqtERlYrtLB236jX9wdGVHQMmOpVRewukEjqvs/LYxme5YVqW1HyZvAMsxe6MCsOpckWkY7uR/R0p8aSwgbjZQXxUS76cgdWD8J7kc2t7Z6zz0G/9BbgMempskgu0cyfPwH7UVMy52o8uZRQmfm6YYWA80cds2LZgTeIk9E/+o+WY/acFr6vh03yCV1DSSEXfUWTcLiBjV8cjKBBfQcpy3ffn6G6F2QCzwdOMIENhgvE0zqcNcp3LYTNK6H8T46/dIeI7b8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+yQkGenJgaOYVG8GKkK/yQe98TqdlpUWzxl50vK5qQ=;
 b=qjMDP0iHDKzMke2USrLTtE3LikagR4LQ2ilHcic+fCglm5cqcudQgRrgXAppF5uSDWwGuaq76R5y9pa1pMYuW6X1V2x0dHHHIUh3Ku1It5vUrLIuRGmt8bx1X7qmT78yJU/9D1aIGPiFEBpulp//enMhPxN2Unye3wAgfrPA/NqcpSnhyU30kDd+Lm8dupIpHUnpfeWhjNQW1j9MePaqVRmZeeu81EivP3yw1mFwF74Q52LuY4+v6eazvpWWCTcHGOMe7+IhnL+2k6ONQEyUX0/2RHVywLme+4EMHuyTCAt8XtyrL0F1G69GwnU5rJTvzIocBaWLGoooh+4gonmH+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+yQkGenJgaOYVG8GKkK/yQe98TqdlpUWzxl50vK5qQ=;
 b=TVOAAWZG65Z3RbnqzNauwHek8FrorWPmehrZtpeElDlL8PjfD7iVecIAFBGnUycuNoermMgplUtyDXrFCqmLRMXU/QUwemHp2U2aR8dUPt71PEefHbYD/iryLuSPaUHvfjLK0vc04G09MWdTK8Cqae36bQoeZEZ/mkBdljVmL6s=
Received: from PH7P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::11)
 by PH7PR12MB7456.namprd12.prod.outlook.com (2603:10b6:510:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 09:59:07 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:510:33a:cafe::4d) by PH7P222CA0028.outlook.office365.com
 (2603:10b6:510:33a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Wed, 1
 Jul 2026 09:59:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 09:59:07 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 1 Jul
 2026 04:59:03 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<mario.limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 10/16] ASoC: SOF: amd: add post-firmware-run delay for ACP7x
Date: Wed, 1 Jul 2026 15:25:11 +0530
Message-ID: <20260701095759.1012929-11-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|PH7PR12MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 67bbb226-b0ab-4551-41bf-08ded757644c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|22082099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	ndbKoHt4oXjToL7VOBJiJLX1/pZQG+ppfuLjcOMvKDFhRPbFV6xyuXnBB9iMZlxOk0XICx/F/BXdLe+msH7wWB8jnxKNTGotDnx6I4FhaZmVjOar2/lvLPoKRN9d5qL9E+5lfKqnIh76yFeTc7COtb06JhNJLuL8Wt9LlLiLFPpmOZl4lA9/skLoNV0xiv1gfJNQi8YgHBb2rX1TbpcfU2lVt1mNGfmp9XBCaQtKs/sc2S4wHxSYUEinnTyuZkktiubswdhGMXR0fJ6di4Bp9fzkyqTUsXNOW3QdL2v0o+0Sitp8rA4J+qG8J6MM+zkiA6gP7OwDkzuEM4URam+7SDK0O+RpAl1OpBPQVc/2nT2KeJhHPRZqOUuWwksLsSlfBeh3mN5VVkUad314++SgrltSL68YH6yhzOQvOHoMA+15WU9Si27jJH1UjFw8lc7VMS4dZn4eFwsr0qm27xauvVZkv2zyJ8At7TFR+prfWE8v0iESPvkcDLzixpTGhjltpHhBOugPHVvaOU9xrXNVKqydNukaFWdcTlAoxKd5TuS86u7w3LlSRUIzPf27nHjzahOSIrDL8LWElkRE4kA8dBfaCuhIE0myV6wdIeiQSb/RNV4ZqvJhdRlViVKDwLEH+yNzeVRShDAK+2ZBhVG03puRZbsZ6bfSQGFIAQ623WiSpcJqjiJtWFpSxTwLjFfNH3jBAPbqrK18nXEJAvFjDg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CnI3avt2AY6y1tuy+iyaNPLgkA5mX3H6Woz6jWeVf8X+wOwgrPaLv+jJTUQksQAZxXwCQm+LsiRu1t/NT4va22FbVRETFzftVgjmsnvLXqrot9yQizx3Nd+JU6oTfVhlVZykl+PObaa6fO/n9nI3FFnSle0kyW2NtnDuruAdZobITqope4amJ1nOPolqGfaAuyzziLg6UTEIccQhB5CSAifTXxlbz89C2CtMD6rnmvgjYWjq/5pJ/W2yXnQTRJwbkKBJt6I/eDtG4Xd8YQ2fXtlpwM5ev6M3zN+jLhC8/tnPderBfHYCW2q/osru2iVoMdoBuu7Mw3YKCTQ2zjvodL/st0lq0A+iaWrn4KCQcRi27s50wG4SLFSTg5OPmxDdwv2yIlpUjFJ82yoc7VrBc+uxMHaS7D1cPiSjruTRxCLxc3GVmBOeHwGT5eCKyjuB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 09:59:07.7705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bbb226-b0ab-4551-41bf-08ded757644c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7456

Add sof_acp7x_post_fw_run_delay() to introduce a small delay after
firmware boot completion on resume to avoid DSP entering an
unrecoverable state.

Register it as post_fw_run callback only when the ACPI property
acp-sof-post_fw_run_delay is set, following the same pattern used
by the Vangogh platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/amd/acp7x.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/soc/sof/amd/acp7x.c b/sound/soc/sof/amd/acp7x.c
index 3366e1b638af..c1b9c623bc39 100644
--- a/sound/soc/sof/amd/acp7x.c
+++ b/sound/soc/sof/amd/acp7x.c
@@ -11,6 +11,7 @@
  * Hardware interface for Audio DSP on ACP7.B/7.F platforms
  */
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pci.h>
@@ -127,11 +128,29 @@ static struct snd_soc_dai_driver acp7x_sof_dai[] = {
 	},
 };
 
+static int sof_acp7x_post_fw_run_delay(struct snd_sof_dev *sdev)
+{
+	/*
+	 * Resuming from suspend in some cases may cause the DSP firmware
+	 * to enter an unrecoverable faulty state. Delaying a bit any host
+	 * to DSP transmission right after firmware boot completion seems
+	 * to resolve the issue.
+	 */
+	if (!sdev->first_boot)
+		usleep_range(100, 150);
+
+	return 0;
+}
+
 struct snd_sof_dsp_ops sof_acp7x_ops;
 EXPORT_SYMBOL_NS(sof_acp7x_ops, "SND_SOC_SOF_AMD_COMMON");
 
 int sof_acp7x_ops_init(struct snd_sof_dev *sdev)
 {
+	struct acpi_device *adev = ACPI_COMPANION(&to_pci_dev(sdev->dev)->dev);
+	const union acpi_object *obj;
+	int acp_sof_post_fw_run_delay = 0;
+
 	/* common defaults */
 	memcpy(&sof_acp7x_ops, &sof_acp_common_ops, sizeof(struct snd_sof_dsp_ops));
 
@@ -140,5 +159,14 @@ int sof_acp7x_ops_init(struct snd_sof_dev *sdev)
 	sof_acp7x_ops.probe = amd_sof_acp7x_probe;
 	sof_acp7x_ops.remove = amd_sof_acp7x_remove;
 
+	if (adev) {
+		if (!acpi_dev_get_property(adev, "acp-sof-post_fw_run_delay",
+					   ACPI_TYPE_INTEGER, &obj))
+			acp_sof_post_fw_run_delay = obj->integer.value;
+	}
+
+	if (acp_sof_post_fw_run_delay)
+		sof_acp7x_ops.post_fw_run = sof_acp7x_post_fw_run_delay;
+
 	return 0;
 }
-- 
2.45.2

