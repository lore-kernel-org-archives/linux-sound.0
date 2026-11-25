Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795585144;
	b=qNNR67HJ21+Uyo5hck4RoFsEy73bUO+jJFOUpRnY33MTxxZ59WVf7DaAJRQ1ffSSqdC0
	 NpcoMxAjzasIN43/yXZaGeJy36GNkSKvRrZ0smgdbLDtXA24HJXQpLTy2uM1sBz1MBGzO
	 9yC1A9/aGeqJRnzCSiXBsBVKQRFgloksGFqWzVlSqVCHzdMrWHn9JfO/JshqxsqhDnUeJ
	 hf6pRrvHek24oIA/pBs72GVuD1JyDL86zqB9RN7cG0R7xbbWBjeKmM+M9SDI5K/oceVZ1
	 pkG62lcD62YnpmYyQqG6TQbec8vaRf8jsa1xfvsKovgEes/Hud+JiBVNAWonlfnXQmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585144;
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
	bh=9/hWNJYkTxApRXq39MsO3J+TvLjX6FeLIwBvkSFMtoM=;
	b=KykzQf9alWCo8MBB/vmKU2oS3ep5IycfmnNHX6aD2P33aBEVp+jTUUcsyU0G3Z3L5foe
	 myl5h9+0FM3FScz/NzT81Ydp40wkk7ise+Q/J3CydWcRl6tKLjbvE1TIoGAQEnQlK0kpU
	 sz7oZJ0vR9WYRJYsmJjMGCwuwWgH3JpngLbbRPwHmGpJZTcq9IAgqOjOOJbRu5gJowvWD
	 wwGwccpkDIb+3xf0jHWiOG5KXm9Ga+DlL9I1XdbLPnpXpawcvhby9cGlguh/abwSNGc3z
	 YRWE2W1fu4ryuzSzPjUfRIifW0F7OghgvnhnYUpQ4zSCEIpyikTbtEzmOj7/6RDmrnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NbQw+iL0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.56
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013056.outbound.protection.outlook.com [40.107.201.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69392606A323;
	Wed, 25 Nov 2026 05:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69392606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NbQw+iL0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UaZAhIUSqvl+DeiR3jmbuUz6rlAgRE8wMCCITVuVi1dLqiApkGtkVGOJBs4y8w4EWklPJYCaRPBXpHMmuYT7u1FNF1YAdb9hUFtcIoFfcTtPPSQX7jHwxUc5RWq6YbmIppg1tnDEEvVa0qEiLWk7l6XvP0fjr6/u71GOS6vRhzRdxx1CAZnz7sycK8wKqmufLDncGATGW8StIEagIj0PgSw2gd3S/7AnRdhf7jnhNnpKzs/SpUhcVut2pZvlkqOPzZDfvqRKTfjoCSwS0dRnaySJsKXyEJ9QuIYdgZDvhD3YHJiPvUWLzG3CO5J05gRv8YjTyHyGV8puVQfbY+jf5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/hWNJYkTxApRXq39MsO3J+TvLjX6FeLIwBvkSFMtoM=;
 b=uK9Bxe2WHjJGxJ94H5gCOguqUqO5YF2uH+UQeLTOJRum9x/uJw9XhOziR+G8c8Pbo6V0+ix7/sNbmdFF7k+wHRFtSRK0mYXVLF6YJdxMVOEnjuryEpW9ZqJJfkek1LFw3c46ZCjXWzL8pgzyyWOgOGDSWBo4q8SSAjAtsXRzBOBzToSJBPSVZWnHkMf2b6Uu5GHK+H/UhNvaAuoQyOtYcuN35eF+1HG9ZPezzGTPSlemlIc1B6ppr7eryhdCpK2XZl4dQvLkBQ+Vab6mHApaAWvu9go+Ge3LVNnMDLLcm9KuxUCF5x62+Gfe5JSPrB/Hnbzst4qD97/pZLmrCvlhmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/hWNJYkTxApRXq39MsO3J+TvLjX6FeLIwBvkSFMtoM=;
 b=NbQw+iL0c4YWF5hmvjyOfD8egrMAToPkSW/pc94MUD1WAhKiKHe+8TuiCIwYbLHPMKVpzuDG3ZNii3L6gh4sMMceD28jCS7DadC4FQPJExaAuY6qVlEMJnDhOpyB6DuAp4pxqHhCd8ScA5rX1dJV+wuATXRX12m4cT0eItAMQCw=
Received: from SJ0PR05CA0202.namprd05.prod.outlook.com (2603:10b6:a03:330::27)
 by MW6PR12MB7069.namprd12.prod.outlook.com (2603:10b6:303:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Wed, 25 Nov
 2026 05:38:59 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::4f) by SJ0PR05CA0202.outlook.office365.com
 (2603:10b6:a03:330::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 25
 Nov 2026 05:38:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 05:38:58 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 23:38:57 -0600
Received: from sof-build.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 23:38:53 -0600
From: <sravisar@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<Vijendar.Mukunda@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>, "Siva
 Subramanian Ravi Saravanan" <sravisar@amd.com>
Subject: [PATCH 2/2] ASoC: SOF: amd: acp7x: reload firmware from disk on S4 resume
Date: Wed, 25 Nov 2026 11:08:05 +0530
Message-ID: <20261125053843.1611378-3-sravisar@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125053843.1611378-1-sravisar@amd.com>
References: <20261125053843.1611378-1-sravisar@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|MW6PR12MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 211e4b4e-db55-40e5-59b5-08df4ab6676a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|18002099003|22082099003|11063799006|261026121527099003|261022115727099003|261102123227099003|261022075727099003|261009223027099003|56012099006|10067099003|261026140227099003|261022105027099003|261102130727099003|261021121427099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	0GhauTMYdIfi4GD098iMRwZpI6nsx6Pz3GEs8DIE07Eix4YIoWyvkbSxaklEc6vfGOoFrT6aCg59WmfxLo9F0oUbg28vVBpEnbA7XFgbUsyl8HAxktjFAIYNgcE+1RRi+s6yeCs05NKjaHoDbRHkYwLX8QVSub1xmIvFQw9ySIjjbCpila34cjVhKO4iV+bQRnWe9PD0dDmOz2AC9S9Mvj2Yx9hs6aLp4aKqNZN/p4J0BlgAd+xhVNxehrP/u/Dw2pYV2C+XsI8aLDs9UdpS4fqUf0yI5Ik4fJan0XqIgpzuWZ+noSl1j+TyALOixHZCk9WRrQ/rzO7vp6vfQE3lqFFt/zRGkIC43cFPJyBO+4txHLQcjNV+I5wYWCA0tV1KbqPGAdwl6g0Eu240xBcQwoSp0UL6eVyAnHnHZ6ta/5j6f6Gnzo9j+SB4dwxB/ACUkJ0ZnZK1j9newuZzhKfebB7OJTpb/oHYTyeVUHbJQgkuQ+Nhdl4qqADRMgRCgWfuHJ6OV9C1cDJoF4W/hFM356swnvq160HqWfnJZGb6H8OONpjN/Q8v8Zj1eO+9DHQgBLF2/7WDaEkPy0DD/YNKybmJhDT4j2sRGXDlI5DbGwK2smn19VEfBBa9bLwdpmzIl4vCLZJVthVTtOVgcY9Hbv57pkI8SltsKHah9R4Njl82L6Yj0Hxyz+al8gbCXlFcuY9M4H3F+N4raeblHlt8tg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(11063799006)(261026121527099003)(261022115727099003)(261102123227099003)(261022075727099003)(261009223027099003)(56012099006)(10067099003)(261026140227099003)(261022105027099003)(261102130727099003)(261021121427099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yYKNycH7zlFORSEp6Yj0sTMby0KS5Rckn/0eqez2wUbPgqC0ZH96zcDOkkUu7Bjm5rp14BR1es83WH+Ws1oGx58qnVY1ILCMwAD4FChzDXqKG0VDw1SO69KRRMbk638kWCwu37cbnICpL1lNyIf6ibERtl2NuFNYaOsxSD2rvs/StEsF1mCKNNaNS9S0LHpEuTU7jsannSur0lcXhxoYBzcvbVS25d+/2fs6gzEosmsXG43OlS1/z9P79DKsCtABnvXuKilcQ2xYakvPRC9M7cvPXXekE7Lbuk1WKqv1dAMeMRviij/xijLxlK3NxWXtrYAQ/uSd2yYnixDE0UCWQhCjBY5qhqKBnulgF3sr4e7UZ0kU8j5l3ultLMWlDpGYE7Alz0FfmcTTXOp/o6DPYpCZxp9mqpXxQqiFq7xGfhnYIiYe9dSyIEW9vBslnSdS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 05:38:58.8742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 211e4b4e-db55-40e5-59b5-08df4ab6676a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7069

From: Siva Subramanian Ravi Saravanan <sravisar@amd.com>

On S4 (hibernate) the ASP carveout in DDR loses power, so the raw
firmware image previously deposited there by VALIDATE_IMAGE is gone.
acp7x_load_firmware_carveout() skips VALIDATE_IMAGE whenever
fw_code_carveout_addr is already set and SHA-DMAs directly from the
carveout, which on S4 resume would read an empty carveout and fail to
boot the DSP.

Clear fw_code_carveout_addr on S4 resume so the loader takes the full
request_firmware() + VALIDATE_IMAGE path and re-deposits the image into
the carveout. S3 resume is unaffected, as the carveout contents are
preserved across S3.

Fixes: cec3598305a6 ("ASoC: SOF: amd: add ASP carveout firmware loading for ACP7.B/7.F")
Signed-off-by: Siva Subramanian Ravi Saravanan <sravisar@amd.com>
---
 sound/soc/sof/amd/acp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 8039b2450cf3e..b6befa9712567 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -1673,6 +1673,15 @@ int amd_sof_acp7x_resume(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
+	/*
+	 * S4 powers down the carveout, invalidating its cached firmware. Clear
+	 * fw_code_carveout_addr to force a full reload via VALIDATE_IMAGE on
+	 * resume instead of a SHA-DMA from the stale carveout.
+	 */
+	if (acp_data->asp_carveout_base &&
+	    sdev->system_suspend_target == SOF_SUSPEND_S4)
+		acp_data->fw_code_carveout_addr = 0;
+
 	return 0;
 }
 EXPORT_SYMBOL_NS(amd_sof_acp7x_resume, "SND_SOC_SOF_AMD_COMMON");
-- 
2.43.0

