Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011047.outbound.protection.outlook.com [40.107.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823D33B47F9;
	Wed,  1 Jul 2026 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899917; cv=fail; b=pHoFrrcsJk9g8I8M06kkjmJWbgnuHlOPEufneyvvdPy5BjHYN5GmLQ10/0ksWFrXrSxNe8UaO1cbPd6Fna+S6e16ho1Tu3ol+xIfHZIZnZpvIpVdS+pFhrjA4gQwyspnTFxPxf7IRqFXOyM4r4aV7Ue5Zu9sYQtXIyHmz5q9oqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899917; c=relaxed/simple;
	bh=G4Ca02eqZqTAFolBGkYMOEul6NQ+AdKxr5wfldtC0G4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rs+eBLYz/PvdCRkvXE6Sw7P4ty1R5TtfqwPI6tlCY0xVTFn9m56Rur9cEBrzTMPKKpqc5oNLaOKl7LKxaf/ZoELzGoezeOF9Er5lAxU33HoNI8SIoUnep1jBfs29E+9JqN59YvTg8VX//YMUUqIJEJ79wOCifwhe7MaSoQizvbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RqZl4IVe; arc=fail smtp.client-ip=40.107.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RqZl4IVe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4NLO99FwYyQ6MueSWCN4O1vfXdyfj3QyPnPK5dZwcsKh3BmDci5m0O/kB755E1PApnoe+tDkC71RbUgUTRwy6MtcehxjW8Hcgfd1WH54NxudeaXNNrFYkvXTKa/vonBlIYXizKcx/0MUz4rbGgi45fd9ZS8mX0QXGyUlD63oLbWOcxF9OFBRz0zH8Vs6DoLcuVmwePjsz2w6kmn2K1GxxNQZuFbCqdKlGdyh+9DzzCSe0A/Pcq2Wxk46imSlNv//m3I6CWnsWsuBuQodcA5Ji0aTywrzU1mhab4zE+nVK4xeoKJvj87LxZHatfv0VaQl7XEMA3nMnv9GoeoVHswqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51hJSSJjKhjeBpgf3ZcoCnv4B5c4YZ9GT+YjfvNtOX4=;
 b=fmMUDpyjHceaiqSJHd/R/4aJWlcwVq86EIWD+tKSep/CZs0uh5iTIJ5BiF6APSDzDVBX9opNe3phq4tuW0USegCmWzO4jyqPZlQ2GMntquK4rl+bpMnfajFkdtDW1TR0Ax9YSliH/PEkp+IfTPdh1jpGTyiDHdnaKlDK3Y/zqi7vjQWK7GstT66N7O6+EeY8fxDcdrU+GDsCmcnHXQy8hRVrtd+/2RiYEFbM1V64oDGvGwNmIstKdyGr9nuOW7HSXi78i4wO1Y+LqsIuy1gcxcOQUF9YXxyD2CmwS03mezFV4fYRRabh2xWH41rVty0y/e9xVGyWS+EVk+pAJ4MjYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51hJSSJjKhjeBpgf3ZcoCnv4B5c4YZ9GT+YjfvNtOX4=;
 b=RqZl4IVenO0t0jdZpZMewMMVJLUn6COffcP6rzQkbZiSOaSXp2kG8JWzLYCsO7fUsIZxfJzIL5+YUT/uc+AX7EGGIo7kTdo+cWg1zvRH7NJzD0nQQx2+bw0R1UwXQpEOb5w26JsDCSNmOd4Cn0BK2Ge54vxTd65rsxvKc0lWyWM=
Received: from PH8PR15CA0013.namprd15.prod.outlook.com (2603:10b6:510:2d2::16)
 by DM3PR12MB9350.namprd12.prod.outlook.com (2603:10b6:8:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 09:58:32 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:510:2d2:cafe::af) by PH8PR15CA0013.outlook.office365.com
 (2603:10b6:510:2d2::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.9 via Frontend Transport; Wed, 1
 Jul 2026 09:58:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 09:58:31 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 1 Jul
 2026 04:58:27 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<mario.limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 01/16] ASoC: amd: acp: add ACPI machine table for ACP7.B/7.F SOF driver
Date: Wed, 1 Jul 2026 15:25:02 +0530
Message-ID: <20260701095759.1012929-2-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|DM3PR12MB9350:EE_
X-MS-Office365-Filtering-Correlation-Id: 913ed04d-368d-42a7-922b-08ded7574eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|376014|1800799024|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JPiMsVj/yQp/3jN7eu6WbKq9ev4PA1S54oxTkxVTV8TPkQiSTz+UQi+apiiTB3bzKyvNInjA7YouKLbqhmCKqcSl2XyOoKb7h7v7svtr0hI2lAlxcly4x5oipK5pU1BWQze269xk/5/Cnj4lk3E5Nzv/+L68umZNQdAU6mJqNv1tO+GWNwIHK2CJ7mt4F6jY8GspUMMW4qUnt6rzTcsJKG+isGzJokOoVsx7xWtwvfPo9NSJM2B8+jcrp4rsLO/9Yn8CKvmHwIl/PGcCy5eWw1sjULJ6aqcVrXVZ14EK/zXDkU0X5eimS4kXDXfe/5x2YJrLDqLThG5ZcMrgs/ET959cUPOLQaVPvFFZS+h8pxalJXQUO+taTgtOdk8Ie6yzsxM4utRg146J3z2lPt0dOkd0emBbM4+BztkGNvV6iecyOs0x5aCeSx1+PojNTvp1oikABsRDqNXwC6OOv0HbO3zYRw20KFIXDp/uC1yd4wTZb41sWSkBPFKPa1qngSXTL17j+6/TzzD9ux32DMszT0RdCRLKwy1a7yBvtvCx3oWBs+jGV0XI9S+GLtXkLNorRKJwPu2+B6fO/DZQak+c7tg6YsIi3h7XGVn4EfgPjbBHe7+oVrGaLZuPC8n9KG3kTbetBYFkz3rLNMPVJ/aDXs27/eCeoSlSGOR8/i53jHr0AV2oewWQ391On6uG81LuBP22CnXFTFE6u1w+Fi171A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(376014)(1800799024)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CCXmF8Znm2kKyU0evF+qFD6l+9jgD5osBBQgM81skObKodYZQ61Z3zTi6Bl0yoAP0l5rxKkfhflTExlMLX+rVT86XDEkY7qAMZzS8CXPf+FkbwIUu+dkt1yMDQrPGpDIpCLfUbSoLdMAxtyR3zLDJGJI7JZzWWoph4As+duHwT3ePNXksFasNNAOvv6APSnZSor2PS2NnP7/LaMYxYxRvOkjbRxJl1xNwEJMAd0kyOl58wzfhUmtuEY8nakeUdeP8FjidwAKxbyelZP2taiaL3cfMDTVHxE8pRBXHG1KPc1TWjSStxE4Pv0k67nwCvPOds7501griMwgU0kDCFp4WT7A0tieHo0T4ireoPsX8oiZqH2VW6gAv4EKtxTXt8PouL1CZSHbL0oRwZMEyHy/gjiUIbQGnxBMptz2q756MErL7tTA6i+ho1k7osHmBi00
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 09:58:31.8782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 913ed04d-368d-42a7-922b-08ded7574eec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9350

Add snd_soc_acpi_amd_acp7x_sof_machines[] ACPI machine table for ACP7.B
and ACP7.F PCI revision based platforms. Add the extern declaration to
mach-config.h so that it can be referenced from the SOF PCI driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/amd/acp-config.c  | 12 ++++++++++++
 sound/soc/amd/mach-config.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 0d977f4f758d..93a2182d4e86 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -360,5 +360,17 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sof_machines[] = {
 };
 EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sof_machines);
 
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7x_sof_machines[] = {
+	{
+		.id = "AMDI1010",
+		.drv_name = "acp7x-dsp",
+		.pdata = &acp_quirk_data,
+		.fw_filename = "sof-acp7x.ri",
+		.sof_tplg_filename = "sof-acp7x.tplg",
+	},
+	{},
+};
+EXPORT_SYMBOL(snd_soc_acpi_amd_acp7x_sof_machines);
+
 MODULE_DESCRIPTION("AMD ACP Machine Configuration Module");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
index 5b6362103ca0..b602a983feb7 100644
--- a/sound/soc/amd/mach-config.h
+++ b/sound/soc/amd/mach-config.h
@@ -28,6 +28,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sof_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sof_sdw_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7x_sof_machines[];
 
 struct config_entry {
 	u32 flags;
-- 
2.45.2

