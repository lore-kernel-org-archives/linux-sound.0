Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010042.outbound.protection.outlook.com [40.93.198.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27ED217F27;
	Tue,  7 Jul 2026 06:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404603; cv=fail; b=b/sjd1A4jEEkxjr4Ynfdzyd0si652t6qagF0lph/awIgcOl1psYle81B3CjpuIhU5D1VJDoditPi3/O1iW5C6mdHIonlHkYPLad3DdJp91Ic5DoObguo5XJARXt5Ypa8VO3hStFXjhhY59HQAXsiv5btrSoNrabF7Wcek/raIZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404603; c=relaxed/simple;
	bh=r/O/eyo+CRpqQYdaglRNbRp3P5oQXL+CsZLzdM4dWog=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gR+ZSCiEIEdCTSl/14cD9KJSVBuSIpqcHJtOwIehUNToezlyGpwFdbwBsQkG3kwkcU5/IfxgF86F5vVXK2odDCSPgkPTuBU5L5Nd8WIJHHmLYC8iJNvxWnEmnNF8iGENymVnEXqTpabpPmz0Zr6fuGgwkGYv2gLnLfZGcT/CCQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Vd/vCqED; arc=fail smtp.client-ip=40.93.198.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Vd/vCqED"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6bxplnz/3IhZyJwPbheZMdxvE6pgTSh2fn3qJ33ydeEMjHAXc4R8FLy7OxaDMYVEylbxVh5ga/V7Z5tjrvV+i/ErSVgZzXYWctOeDDmmTtbqpum0TJNGuJ8ZTRA9arCexH0DuvFxQYa/tX6WbRfw+wPUeOmwaFsvSsLxemwy0esluVrBfToay23Sra6XAT7QAMmx1PA0NeNm6Ix6HJL7mfP8gIYMEMhx2a4H3RCFzz65ZICHHDqQCzAhvrq9o31pEe+eCnJNLUmW3L4KD4qy1QsmgR0mDHeGJe1xpPk+Mu3MlIvOF+td68KO2JiQy3dPKlNpTjM7m9xHerV2jP8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m61ZwO5kJBiphg+Xbi+xCRgaU85NSl20O90d1jlteEo=;
 b=p2tUN+VzDdq0B1KRt/v84ZofzoqcSJiQSq4hW0JRhH2N4Ejm3NJ8tRLzK770V2Lhh1KpGRhSy/C9jjEPpUnXFTrVGJp47bl1h5hkQeO9Cc4FFvqXB0ejX+1A7lynRuVCoMTcJ46U4mnJpHUGBVertSPw+nyU3X1HXaXCZfisqGu0ASGEpltjcjC10d7ddQztw4eBMdm1mTuAMgldu/wkiW4a0E/Q1DEcrKFrVXi8da5VVsItfiAyNVmqoEDTHSR63GjGrcWZyMRVlQxS/190aMzbHPjV7QfGLwQKfmUi6XMhk3nZdRcTIoTjsMCgkrdUgulLxl+zp8NM4gI/lMx0Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m61ZwO5kJBiphg+Xbi+xCRgaU85NSl20O90d1jlteEo=;
 b=Vd/vCqED8I/w+OyoBzQ0jJCKpg0AuwunHrC4K9uVFIXFvfBWccGlj9C6A0XnVJNxEN5gS3OW8vr5NCzOGoGMXvsdkLNTaA8EqHsmjA1umRS+P3Uv6Ox8XqfjM0Utc1V1tJqvjGtrFt2s/48ytzoPW+68VY2/HY/wmCAsj43XmjU=
Received: from BL1P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::31)
 by LV2PR12MB5824.namprd12.prod.outlook.com (2603:10b6:408:176::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 06:09:58 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::59) by BL1P221CA0024.outlook.office365.com
 (2603:10b6:208:2c5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 7
 Jul 2026 06:09:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 06:09:58 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 01:09:57 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41
 via Frontend Transport; Tue, 7 Jul 2026 01:09:54 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<mario.limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <julianbraha@gmail.com>,
	<sound-open-firmware@alsa-project.org>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>
Subject: [PATCH] ASoC: SOF: amd: add missing blank line between Kconfig entries
Date: Tue, 7 Jul 2026 11:39:00 +0530
Message-ID: <20260707060918.2535962-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|LV2PR12MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf45bc6-53e8-4113-5e37-08dedbee5f79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|82310400026|1800799024|36860700016|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	my16j1NSpwOg5bLeA1/bHvBu/r+QP8yVX9I1E0Qf12+q0Iu6RwosGB0HwtwRBAigW8J9AdHHBCYDp6vxUNGvX+735XR3sKFVn8bo56rs8R5pPl+VbewfBU+EynzVWs9VwfS6/vtUfEn1Cr8/hVn66gIH0OqIJ3d9+0AgdVvufYM9hzmHyZJZtlghPcDbXxac2B0mF8mosVPHVGrSasCosMmJndBc7De8hjzsOV4QZrblThx+YJIK+bxynDMWjRFN1CmS9Vaw/nZKEnMKAA9Ywd0daQA88/YWD7fKn6zw4YGmoN08EnY7kdecYhdw4HhAqqRiYufsDJXrp1LudqNEDVY4Cwb5/U1FkC3LUgxQs6wP+jcYK4u29aoAwJAondF5PxOXDK4jCKzGI21wS2s9PrJ1CFWB1ptyFrdRdkgbTA/xAg2diKCVnX4czBjjltBDPbrhJHB7miH/Dmct7aJhoixTxbx9/8cr+b3Dl1cATFqsUgogvN8mEpmZhkd/oEcFN2LwgzJPao1WCuifGLYMBZtx3sZG6kxDCBM+F/rRw50XdJMD+uvrl8ysvLiJ7AQn5AM9iIglanEGScqn/XVYf5oyirZYWgYFjV+WWpyr1kyjW8ufnz73fafHTR1VVzfpovb83f6JGVGyv1iOt5q2GANQaokBZc7BAwXfhohS2vxso+Eie4IXW15ezAE01Ng3B5btv8z9j2r3EtzIcaVoBw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(1800799024)(36860700016)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jSLnvlLLodCbxPYoCjJh4NGaZjn6SLJPtdJJl8mVOvfg/Yb9qP9m2W+Mj51S1o8Gd2Tv4kC9NYl9EJlEDLlIxlnCBMiAsGpCbyqHnhuJaUWo62ANwQOtQUZJ6TalmUlns/Ve3+yLYX9vUR7S8cIrLQ1KadZFCr+EenqdX5aOmUT8XdTcAD8NpHREoxlfQJUitkmz5U4RJ19YjG6+RVDVh7Rwz7ToHGoPFxC8laJ/wb9LUh+jcbS5+erhY2fQivjOo1N2BI9dDt2niiz2yCVBg5UwmN6VHD4uMixXYGE/z6jjegGGmg0ueuY1bNe4DD5zzfmX57JWZOkf6v83Wf5UOAgAIyNzbjXe1ZQW0TvL00VgIiOs4WSG/cckfms0rB8+vwZtN1LbgigFQoMrXEHbhwZ3MGBA2kMOZvMOVCNhp2GQmXQVh6rRdOX4jvjsgpyj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 06:09:58.3264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf45bc6-53e8-4113-5e37-08dedbee5f79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5824

Add a missing blank line between SND_SOC_SOF_AMD_ACP70 and
SND_SOC_SOF_AMD_ACP7X config entries to conform to Kconfig formatting
convention.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/amd/Kconfig b/sound/soc/sof/amd/Kconfig
index 7413bfdb0943..903e7ec3b3ba 100644
--- a/sound/soc/sof/amd/Kconfig
+++ b/sound/soc/sof/amd/Kconfig
@@ -103,6 +103,7 @@ config SND_SOC_SOF_AMD_ACP70
 	  Select this option for SOF support on
 	  AMD ACP7.0/ACP7.1 version based platforms.
 	  Say Y if you want to enable SOF on ACP7.0/ACP7.1 based platforms.
+
 config SND_SOC_SOF_AMD_ACP7X
 	tristate "SOF support for ACP7.B/7.F platforms"
 	depends on SND_SOC_SOF_PCI
-- 
2.48.1

