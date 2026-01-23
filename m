Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013014.outbound.protection.outlook.com [40.107.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA6537D12C;
	Fri, 23 Jan 2026 09:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162149; cv=fail; b=jxwibxMYqxkHFwes2mKsAW+vgyzLOo39EzxLQBclYQkxWpdGRbud8GVZYtw6cWwKSqBooGLYK1jFuxryAbkuzx7VqM5aAkH58oItVy5B68Ufz1HqPSsvx3/lzPPUIaR/Aaplrr1EsWbKnZsTIGnEaXhn59sfaKryBz7ILhE4j+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162149; c=relaxed/simple;
	bh=UvCJYg33MDFZO0kVi+PiQ3RwBz8HRep47aTtJtdrYqQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L7vL9fVSJjN3pNr1IApS02hi43Ds4LvqS1a1zLA4WvsvyNOgY0So4wq7uZHUMU3312No/YpO6QNTii5sOZPy5XIJOCkTqx3cFz63zuvBdhGGXxYe484SUwDUfOoZyl5KoDeHe/dTKJAff9zreA/QzpM01wZg0UPSPVtey/895l0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gfizgj3d; arc=fail smtp.client-ip=40.107.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gfizgj3d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llLeYOm8mMpONF250CSyzCLUa5QFIv1CeImQa5c/QfYJVHzX51nxZO8RF6/AYmTZ+qWABNc9dccSE+zkLkgRkh+9CLjglG7THsxpAVQDQ2G5RGZpSqFzbHc7NBFctPOhIBtrIq/KjXMi4HoNL4zcubs53peZn3ADEfD9ghuRt5SyM98ccDlERuQg6Cp+DUmDwegs9561TxfTv6wIA3rnzmFQAYDp901G7/3HVqAWw1+sdA7F8DRRDeSoOiZQlZJS/ogL/sAYnpoqhup09v/C3vDG86jna7QmhArsvqsASQFWVVa2osjVGaFDByGdQsYqlmpIRCTo2/M18vuIK0965A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5HSa/rzVtsx5z2l85aoWr0K4mmMZTUiv6yGSIdHMB8=;
 b=oPuuUJCq9TbL39UMRMKIPHh3VJjeHVCBmHcNl+lEs6m3LFptzrQsB6+1dcyONFU3RVWNBYf/dnKywoYLts1cYzvKXBkof+NHaiBUNs7OGaqM3fqi0MEmHOhRYM7zn2IFmw0sLUJZMrlpq265mUdPzy7BfR3oAYlhx662xm2moFp3TuLY3wyOO934aoosbXrnDnAPIzdJdJtVFni4OajkvwqRDFO3g2pF+ezVnwuAyZDcYLre60EU0gT4HDgPoLqxgl89GZ1L5Tk/4aOTw7vLC+6lv61UUpZlW0m5n9zQv2uEussAmygNKAJFYKt4Ayj3NXpZ2z72ihtTbfRt0lRlLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5HSa/rzVtsx5z2l85aoWr0K4mmMZTUiv6yGSIdHMB8=;
 b=gfizgj3drBBDiz7bZGT3602JkbjG695VSbT5hvF2vv2vjQb0ioSpFdlU3pwjB6zoJ3Ct4dhezEj5NWfU1zLkblOH/o9wG8S8w3xK5KRdt+UczQQvjRmNrbuGhim1YliTQ8jS8+QOYVF9MgdNx/Jn+lZPIbGMgsV2AHcdouSuOjE=
Received: from DM6PR11CA0005.namprd11.prod.outlook.com (2603:10b6:5:190::18)
 by DS7PR12MB8370.namprd12.prod.outlook.com (2603:10b6:8:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Fri, 23 Jan
 2026 09:55:30 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:5:190:cafe::bf) by DM6PR11CA0005.outlook.office365.com
 (2603:10b6:5:190::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 09:55:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 09:55:29 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 23 Jan
 2026 03:55:29 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 23 Jan
 2026 03:55:29 -0600
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 23 Jan 2026 01:55:25 -0800
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>,
	<mario.limonciello@amd.com>, kernel test robot <lkp@intel.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Randy Dunlap <rdunlap@infradead.org>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Simon Trimmer
	<simont@opensource.cirrus.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: amd: acp: Fix Kconfig dependencies for SND_SOC_ACPI_AMD_SDCA_QUIRKS
Date: Fri, 23 Jan 2026 15:25:04 +0530
Message-ID: <20260123095524.490655-1-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|DS7PR12MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: ad7c063c-8805-472f-ff90-08de5a658acd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IrERiQ2+n1vFKc9RCyyuGN/Woc1VO8ybzVSlu7/nKIkIUqgkDiz8YRZhrjRu?=
 =?us-ascii?Q?JCgNaPkUvKKUAyGzBgQ3MF+lgfosOcRFyZ373i/vIzzeL42FeFTWoQprul8N?=
 =?us-ascii?Q?9PQI5hFhdbgcdenwZ8Ek7OquMeB11XYNrjtepgxbOxoUVGEgnMpkGUZYKBGE?=
 =?us-ascii?Q?5jXPGsRHOo+LuXNFQOhKkImixJOyx9xH5B0ht5dCR+M52ft6CeToDEmMLzB3?=
 =?us-ascii?Q?gEE6TtX9bvS0c9mzj/Ohnul98epaTS3oKIkWPluqikQteqURTlV+d0v80+IK?=
 =?us-ascii?Q?A+4qBpUALuIMXa7lzFvIrbjBzV6wRs9dHYyc4OiMGmfEBPqQs8+EFDwxl/si?=
 =?us-ascii?Q?p30qgFrD0AxvZahfS7JpnxP58BFWs8tfwDuXbv/vOuB9MRq+4i5KU0nE1so5?=
 =?us-ascii?Q?PzPI30dVTwFNOnSSu0o2aDsnYKmPPZsSeUIbLdIi+VoznJrza8J8CW2B/4+O?=
 =?us-ascii?Q?YwIlAAs//cJ0gxzrmzRLH6TuvQ2ESNpHkhkeKQVkfiW/5GVndE/ZFoUeQ2hl?=
 =?us-ascii?Q?EYP2jCnrUWDVbSckYjSBElyI+A7pLI836G7CH/2Fi8FndF/Skx15mrzBQ6Mz?=
 =?us-ascii?Q?MTYOFAmmhgynTO7VZfjyGm3mAcrIHZtBFUMEaFAbVh8jbOkB2Aocl98aTy1y?=
 =?us-ascii?Q?XnjcygVyJYAEI9Lawkop54GpITtR+cki8SoyrApsva5f+10bL53D7eouxUxl?=
 =?us-ascii?Q?63xEsdD3qPGBT77EDK7ZnP+lsMes/00FTtHlRlmN6jstWH8rtrCR9THfG9Ou?=
 =?us-ascii?Q?IyL5DO1U/wTicZQb9eN6JJSzf5Q47JyoDq1i/ixYETqWkjU5nf62aDseCvq8?=
 =?us-ascii?Q?gqD+qtxokpsEAZmNzlLHue5K9H7KwF0BTI1yFdC8s86rq/QnaTvKEU7Gmymq?=
 =?us-ascii?Q?XfvW4zsA5xUpYe5qyR7WH/Ue4BJGy0LPI8F1r5gnn/AbB5NA2ONADpsXxGAs?=
 =?us-ascii?Q?NNXgqcVSV7s1wBpdYABkxwZnEgRnshaC2LmgRNpCv/VM5dJVjKujymf5PoFi?=
 =?us-ascii?Q?9QnVFVsUvZ5qUkhF1ZITGqIAwpW7lMFvuTcW0bQOEFOg4E4fTAol9FP6bK+q?=
 =?us-ascii?Q?fE4akW8Zb5MUsQkW2nllV/8iTxA6j4XvOvP+dw4d0ccAMDTNWF5i1Vh6/l1G?=
 =?us-ascii?Q?+FgKrJA/mQ1b4voMfipoJ4FttfAR69GTt+TeLg31cuBrSC1lklmknN7wJ1L4?=
 =?us-ascii?Q?rzh6nUi/zmXa4X/TZ1jsVlFjjX70w1LVw48jZtEpP7RfEy41o3p8ix6fG3bM?=
 =?us-ascii?Q?J0DdZwkKad7VpzEUEcXPIkmvFGJkSlmH5PZvx8AnTBKTcR+wd/Ba9effm/rN?=
 =?us-ascii?Q?u9Zyt1B35cXNAQhmDDBrXgzw8W5ErihfJutJXAJ6sw3844OUoY6Z+uKrYZJz?=
 =?us-ascii?Q?37bLZ0dkEIKlem1aXvXkDg6PKrhCk6MUeUSDMXhwFuGDMqO3e+01xRmkzlbN?=
 =?us-ascii?Q?8OCj/46N61HXZ9gHHceRaBGpFZno22R+wYR/YSmt7BgTpAEH7uDyYqxMlEfo?=
 =?us-ascii?Q?GCrxAZ88e/KUIt3ub13fY4n4eOLq2LEUc/Wuf3Wo91eQaO3J9gSNnx4e2clV?=
 =?us-ascii?Q?EU4fQAT5YFHeJWunPTT0wiS6Df/VTfZRGt++jnCHYd4gOmlWEP4b6b8E6zs4?=
 =?us-ascii?Q?0Yst9nGOJtRf7i9MyXQwiUlit5AFiklMjI7i7/5a3IOdMrZ4pSobWdj1JUAD?=
 =?us-ascii?Q?xDz8Ng=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:55:29.9700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7c063c-8805-472f-ff90-08de5a658acd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8370

Fix the following kconfig warning reported by the kernel test robot:

  kismet: WARNING: unmet direct dependencies detected for
  SND_SOC_ACPI_AMD_SDCA_QUIRKS when selected by SND_SOC_ACPI_AMD_MATCH
    Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] &&
                     ACPI [=y] && SND_SOC_SDCA [=n]
    Selected by [y]:
    - SND_SOC_ACPI_AMD_MATCH [=y] && SOUND [=y] && SND [=y] &&
      SND_SOC [=y]

The issue occurs because SND_SOC_ACPI_AMD_SDCA_QUIRKS depends on
SND_SOC_SDCA, which may be disabled, causing unmet dependency warnings.
Fix this by adjusting the Kconfig dependency logic accordingly.

Fixes: e7c30ac379b4 ("ASoC: amd: acp: soc-acpi: add is_device_rt712_vb() helper")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601131155.RXGj4KHv-lkp@intel.com
Signed-off-by: Syed Saba Kareem <syed.sabakareem@amd.com>
---
 sound/soc/amd/acp/Kconfig                    |  4 ++--
 sound/soc/amd/acp/amd-acp70-acpi-match.c     |  2 ++
 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h | 11 +++++++++++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index b17aaf2c6ccb..977e4f2a7a70 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -15,8 +15,8 @@ config SND_SOC_AMD_ACP_COMMON
 
 config SND_SOC_ACPI_AMD_MATCH
 	tristate
-	select SND_SOC_ACPI_AMD_SDCA_QUIRKS
-	select SND_SOC_ACPI if ACPI
+        select SND_SOC_ACPI_AMD_SDCA_QUIRKS if SND_SOC_SDCA
+        select SND_SOC_ACPI if ACPI
 
 config SND_SOC_ACPI_AMD_SDCA_QUIRKS
 	tristate
diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index fa39f18578ca..c5f42bd79548 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -376,4 +376,6 @@ EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sof_sdw_machines);
 MODULE_DESCRIPTION("AMD ACP7.0 & ACP7.1 tables and support for ACPI enumeration");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+#if IS_ENABLED(CONFIG_SND_SOC_ACPI_AMD_SDCA_QUIRKS)
 MODULE_IMPORT_NS("SND_SOC_ACPI_AMD_SDCA_QUIRKS");
+#endif
diff --git a/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h
index 7e345a236da1..0e644e71e76f 100644
--- a/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h
+++ b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h
@@ -9,6 +9,17 @@
 #ifndef _SND_SOC_ACPI_AMD_SDCA_QUIRKS
 #define _SND_SOC_ACPI_AMD_SDCA_QUIRKS
 
+#if IS_ENABLED(CONFIG_SND_SOC_ACPI_AMD_SDCA_QUIRKS)
+
 bool snd_soc_acpi_amd_sdca_is_device_rt712_vb(void *arg);
 
+#else
+
+static inline bool snd_soc_acpi_amd_sdca_is_device_rt712_vb(void *arg)
+{
+	return false;
+}
+
+#endif
+
 #endif
-- 
2.43.0

