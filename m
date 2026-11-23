Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453724;
	b=zZGWB4WplYTxo+qkRaOE9ZkyzTQ1d2xRqOSSF/ZE1Xnu+c1cqYb+wTnppCtPyPwPh+VJ
	 vu4168GPIuwOquHCeeh545nTe13JBjVQgOp94XXeWPKQKGAu7RnBkf1e6DoCNJ9PfKO11
	 OiEF2/nBDayuKsUiPqqF4iadThxCtWtN3pb6Y208aqa6HOFbOojaQrH7BE04lVH8L8PeO
	 Kc84wiPBGRletndgcfKwoEekHzr1LUNDbxkdj7tJTvEtxJy481cMmZILMyHPIQaH6InE9
	 ku+dvTlu1YBfxWbz8TBIgRRzRtTFxfyH9d88LYAFCTOy3ygH2VN5ZSRMz3Kw027ysCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453724;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=Tl1BrLSGv78eSSwtp1QHqqPpd+c/l5aK2ILzfpwwTg0=;
	b=V6tuH+Bh+N8TzKBngCzpxuqvPwZBChoAJxlLvaYjdSGvZMWgYMGxqbhQ2inaxfjOcy2b
	 7VwiltVXjFwrCt7Rx+agsNeAUJkULw+fng95w0K8balIxIAwYEHN7SZ0Fj9XudEz/pjMs
	 nUAjDugngjcjC8ZqFJS4CJxz6Z0lf8SR7x228Aefy35kinmJzQejHlrNdi6C5s7yAM5OH
	 qP1wPt4astobNvMbL3eVUSgnZtREPAPtgnoWpM9febF9iujNjWJSTaUsz0mzkdmchIMfL
	 f/PC1GMzDCAQgcieqg7yBnGRUN4VhrbM2FYf4496nwUSpuIjpy2ZtVAkB/YYdRuch5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Q9cGLCp0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.46
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013046.outbound.protection.outlook.com [40.107.201.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2661606A685;
	Mon, 23 Nov 2026 17:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2661606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Q9cGLCp0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqJHo2OLetoQO7Er98WOZTsBXLHqFqpm6F8NQQYVLNuebb7ORrCOpN6eJ6fugsva1x9yw0APY3lnkRq4UD59amvQNGve5h0XBSpr5U7DyswY3M5T25wx1EKqSFhORgtpbC3uI+wM3D5wxXg1v9Ka6jFKR2GfP2y/hwe9JFG9sHhcw9wP0GIoh/GlgXxGAb+pUImLnx8gyefshhTX0NQGHM1xz6cc8VmNgcuN0wBX65dQ+Jq7ppVY1Q3rQ5Hvhl99IxCpQayn8IS89VXc09HKL+uZ115oxat00Jkssg36NrmHGM2vaN8cnDIdesGvTB7l+fgfvGm1gUHXbofYXX8pdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tl1BrLSGv78eSSwtp1QHqqPpd+c/l5aK2ILzfpwwTg0=;
 b=k7CLnujYW1bg+a/r9TMXSssh8IV0S/7+++y+GSK4hMyrDbe3Aqs+UH+CF2uw0gGDq/lQY5W2DKlN4COd9nYt0Uvji46olRVMVeLHXarGsFyhBJ/S8BVpVSc5zV5m3TnzvEw1YxD92K3itkhdlGulfBVkMynEgnMirUnVMwCyL0RQI/F5u2sUUffBS0rTcbCoiWnIr+pJbUizgNDzRjDH+I8pXqFZYBECSgfbn+JIC5dkzHlApiv3tBryZ08k+Iy2xrZHdkCe7QAFWlb/khbRs+7Qm3WQhnJP4gDt00BZgIhfqyMlMkjlOgjl0rZMvNOZ4Zw7z+GAa6wYTTuF8DlIDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl1BrLSGv78eSSwtp1QHqqPpd+c/l5aK2ILzfpwwTg0=;
 b=Q9cGLCp0zmImBNo8rFMcMSftRIArOntee40AZWnavhIO096bcDQMtlLJUMPzpKUFbYik/GQC2IHeUQwpKPgTrk3SBZ/EUmq+JXJ0MZYSo8tDaEETUmUulLQ1p8DSyaxHLVnnzRHnoUFFAiBDYYkORTplAGq7FX6oOxr1xvO3Akc=
Received: from CH0PR13CA0052.namprd13.prod.outlook.com (2603:10b6:610:b2::27)
 by SN7PR12MB6863.namprd12.prod.outlook.com (2603:10b6:806:264::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 17:08:36 +0000
Received: from BL6PEPF0006C3E1.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::5f) by CH0PR13CA0052.outlook.office365.com
 (2603:10b6:610:b2::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Mon, 23
 Nov 2026 17:08:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0006C3E1.mail.protection.outlook.com (10.167.249.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:08:35 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:31 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:08:27 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 18/24] soundwire: amd: drop amd_deinit_sdw_manager() in POWER_OFF suspend
Date: Mon, 23 Nov 2026 22:27:39 +0530
Message-ID: <20261123170520.1380924-19-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3E1:EE_|SN7PR12MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: d90a5214-5003-4856-c799-08df498468ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|22082099003|18002099003|11063799006|56012099006|261009223027099003|261102123227099003|261026121527099003|261021123027099003|261021121427099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	9YYo5fA/3tD65RSZwKmALVyZdEhy8woX5+hYfN80fm5mex/j/h1E30c3ByN6b423ez8lQgl9WCKYgQCOsBvekc+GQ8rG86bvw/3f8ttxoOrpWSXpDHX7Nc0zzgdbmgMsqiqW9sdIeYPdXg/CKbVG+fT283XDHYVayX773O+ihqS56dFn8OQVQcVVNnU5PqrUnMAeOyKK25jqtwVluv35HPJRc8NcAfXCjs/cBIIePVOPyJgpaibyN36qw6plicbXKLL+UMMeyZvun2npYRRS+pEGp0Su3xjlknpmlCGfBHcNNTIRD1wqoPBlubebwv+3fsWU5OVFb8l/axElNqhSITxV6BNFB2nQlmNW/tvseB1Wl4hwbapSTExVchCUDUMfEesMUpplKSes3it2n1ctTRJitFiEwnvpAvijzFzUceGeUMeEWjJsgKzvIkOj+cYcUx7rGzR6U2PN7X/8fj8PfRmM/nczHZk5utwrzY/hq29WTHiANuOhHsVwVXQuMKAC723tUYFODdd/yzWkulbTzz6cvV3my/maT8gz1ojN8GE8lmyhbLXI9gNWmPkV45E1kOquDMOoOvGi0P3SPW0dpBioLg2KehszI0iPinDBKDIRfnB2kWh0hlEsJETY9wDgO+exyZ5+wDqgApUY8qY0NmI00boxhXAYdV/fZ+hEPUnM5jyjI05Xmx4U3nA7QGyPPAaN2RcO3pQKcZH/GI1WQA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(22082099003)(18002099003)(11063799006)(56012099006)(261009223027099003)(261102123227099003)(261026121527099003)(261021123027099003)(261021121427099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fr5g7UQV1K6THCWBIqTuFzzoFuHHluuR4RWD6t4Zgw7F2IjUCW9oc57KMS6uodR0hwdWBOP50Hm+D9ksNf/K+ybocjXtJr4TRTKE+BHH6yUuxP38Yl/853or+zxlfj0mKg96B2WC1YNBoEasadPtwzPBP1bXWWnF6KyErAgTd3URMMGhz6SOBscHowopE0NbdBkazqnbhsQOGScwRQDyHRljy07q6fblpvH1rGXI291NEG/ol7Qrdn2NcRovmIXZIbmvYou64HgS8znfovHsHBbPvAU5arPDb63eHx3YDWO6AkR4V1D3Og4xztH2x4ki+HoUKSUsq1kSZ69h9wNtKOKSPeDKuEFtEELVE2jogEpOg0iFyV2vi0Q899x6ASpnDRRiEt1tshiBa9SlI33DijB6qGnDrBbdzuhXuBqH6fAMlhIcAm8soYSFLlxi/Ja7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:08:35.4319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d90a5214-5003-4856-c799-08df498468ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3E1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6863

amd_deinit_sdw_manager() was a small helper that bundled
amd_disable_sdw_interrupts() and amd_disable_sdw_manager() together.
Expand the two POWER_OFF_MODE call sites in amd_suspend() and
amd_suspend_runtime() to call those two functions directly, then remove
the helper. No functional change.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 8cb661690f96..5786eb312e6e 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -169,12 +169,6 @@ static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 	writel(0x00, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);
 }
 
-static int amd_deinit_sdw_manager(struct amd_sdw_manager *amd_manager)
-{
-	amd_disable_sdw_interrupts(amd_manager);
-	return amd_disable_sdw_manager(amd_manager);
-}
-
 static void __amd_sdw_oe_update(struct amd_sdw_manager *amd_manager,
 				u32 mask, bool enable)
 {
@@ -1464,7 +1458,8 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_deinit_sdw_manager(amd_manager);
+		amd_disable_sdw_interrupts(amd_manager);
+		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
 		/* System suspend: tear down all pads */
@@ -1507,7 +1502,8 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_deinit_sdw_manager(amd_manager);
+		amd_disable_sdw_interrupts(amd_manager);
+		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
 		amd_sdw_wake_enable(amd_manager, true);
-- 
2.53.0

