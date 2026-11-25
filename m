Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795585133;
	b=Bav4MTh0Fi7iwyakrnD38+NQVFSg24Fdyq4ojCq8ENb123RHdlOTYQhel29eZSoUVc0k
	 Iovl0VnvicUjxU9mwoDzt/fp4vBAjq8IhsTtAbwl066+aZ2R2NnDEgNqkKCf8skT7Wx+1
	 YPcIBTcDttDaKhpWM8Mnkvxyk6oEjV7L/3mWK9Qko5dl+MkHQtf+tQxNN2altdldoJXFR
	 1JWyCaxw3r8hN8egzpHeeeQBt5OXC0aLP/ncr8nP6ysHmMBpVbUdzVIZrYczMxHRapJ9+
	 RSf7+tj2W0mlJ9uhK26/qiJhLwADF12gvCbes2ZNH72MVq12iVcSG7D2PfpIjn41zYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585133;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=E3sEhLGHFKwGJoC15dbdNeCT6pD6Qrop/uN7rIXiUic=;
	b=bgOfbFhQuKxjV/xAqwbFaKIniG1mF6kwq4gh/ek9uZcXowVfP+CNdSkWMRircETzpWri
	 p56Vm9ztV5MtULsrdmmAaeDdzbH7uHQ4NJEKELScktZ9xWlgRJAIq04f5KBB4inxMjarg
	 we7GsvC2Tzxl2n3A6vf9PkOc1H5NRMKOGtORPW8Xe0MFn5CbmrQEZRmyH5K+6oBvX3Tcg
	 XoG9xudyomTUiq+lDJe3n+XnwhiW49Bu19e6U7WfPbMVoeBtpG2arjzRrjv7ExCL5aGqQ
	 xJ4qZvPUZawSym7hxVq+T617l7+CnTwaPeKM5RHtjtoGQ6aZHjAbhtGRPfJ8YnA1JOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=f5cPbKDe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.14
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012014.outbound.protection.outlook.com [40.107.209.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E744606A31E;
	Wed, 25 Nov 2026 05:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E744606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=f5cPbKDe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UX12KP1MErHOaSCDz8OcROXtyhmL7LeYi/UbV9O966Q6JnFy5ILsUd8CwJFcNxlzGMazTatcxAtCrzQxW8sLm6kc3GoHl/w03VLbfqLLNRASO3FUPAWlsIgrKBwv764QYuIxTgc8KI9OR2guKvvHzc7g8O1ygvwK8WpzqA+9U8drfBHv4Xwzk71tiYgAtzkx9apdlEWhfMJIY2albXC+yoQxMveZophrRGNAIlVEVxSchxxOq01qtoKiDiAfD/iI7khk5jl+gx5XmYep3ULqvVVTaEn54M6itH4/la+ralujMJ6G35JaTBfs03Ql1UjM4zZZQauMtKSzRk5SGfcP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3sEhLGHFKwGJoC15dbdNeCT6pD6Qrop/uN7rIXiUic=;
 b=Fd8ndgPqKhDqqfFGsFOAJZEjG1SVZpyzYWsNsbt4yXk58Pc8Z6THwkENadsj/b8wXjr/GI/Q3qV4I2BkehBTtDfgPK6QKUzWP/nfPV/dSLAu8aPVsuSI21wlnHan0fY5wcHYn8b+u0eE/b+pv371QlZCAfWjI86NAWq0s5ASV5quxa2iLY9HqPpdHmcUzocWNuIK9OAahfIuxnTFfFIsG0WDqZkOibGO9NfDWDHxHsUu0fF6uPYjKpVY3tV3gK2c/MmMhaulX8Ltb/qqZAWTOmmpr3IgdS+Vfrea850ZWNMdAirtYSYBwBjw+G6oKiklCNjNbnDqfQ856eZVXK527Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3sEhLGHFKwGJoC15dbdNeCT6pD6Qrop/uN7rIXiUic=;
 b=f5cPbKDeCiFjvQ7SReg9H+Qujk9cKIuRIDV+90Qy2HOqmCWDXwpci+KPdsUteZklHrLwRYdP0ayRAnyo1OxgtFjrSglLdqkcF4pOX553U4HsVeGT9ke743RPpEkq1wnVbOdhhOymKiG30FkT70zMC/SbaHnjQZTdmCQLLLo6JGg=
Received: from SJ0PR05CA0209.namprd05.prod.outlook.com (2603:10b6:a03:330::34)
 by DS7PR12MB8292.namprd12.prod.outlook.com (2603:10b6:8:e2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 05:38:49 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::85) by SJ0PR05CA0209.outlook.office365.com
 (2603:10b6:a03:330::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 25
 Nov 2026 05:38:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 05:38:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 23:38:48 -0600
Received: from sof-build.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 23:38:44 -0600
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
Subject: [PATCH 0/2] ASoC: SOF: amd: acp7x: fix S4 resume with ASP carveout firmware loading
Date: Wed, 25 Nov 2026 11:08:03 +0530
Message-ID: <20261125053843.1611378-1-sravisar@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|DS7PR12MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dcf10b0-fe17-4ac3-eaf5-08df4ab6619c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261102123227099003|11063799006|261021121427099003|261022115727099003|261009223027099003|261022105027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	WQELgKnFeky2tN9kGUbn7VnXIvB0UFl+Y8l8SBmrkw2zBokGGefzv2x+zBU9z1ybe52iTMw9ePmKUlbXIGctn93Zbr/60dCxQtN9JG6WF9OUE6wAoqzD4L+YQFt9QIKtKtfUnN7/e3tFTTY+rE5D+Mw1pImPUQLU0k8lgeTIPFt9fNa8/YmPtuiTQotb+j0pRqMLWEL8j4hdtyoSdhkJzYS9I5EXJppJm8ea27q0liOvmv9+y0LeWnj1YfDwzW/n/E90Lga5qy0QrjtvzikWzePIdeJXh0hmeKMRkYs4bKkPPgFsmoWWvKFIXKz8TNViSODFhZwJzADRJcc116UqIIL9qAyIXbwAiBDtjwRHfUaceHE5TygWrOM4Q7jO0NUMi9b/q044gphb/j2ZmUExnyM2FGfSmD5Z0VhzzQLVkjW7kKH/jun4GbyOabDuN4/ki5uewMzEcPI6Ruy1hbrqPXViP9B1SRvE9VG4yN2Cr+Ip6wwmR4wyHseeQbagAhY/lAgojbi+FMM4bpO0m8/4andU5ho3gcssIuRLHXwP42S4G6qzZOpvO9N0/KPgcyfBs2C2N443onSuwkD3QLQOJhlI0cAV5gMaLu83cKs7MALCtbniOlYOv0O6NUKyV90LjubUkgp9pKvCdg0xcAWmHiPzo+ap6aSralNAtUL71GDFyIGfaJK61PycZl4qiuBt3NRs6TyqfWVDq9gC8JuVzg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(11063799006)(261021121427099003)(261022115727099003)(261009223027099003)(261022105027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tmwciSmuDYQXL52uMipeyQDTu2bDSkfxblfL9ciTZNW2ZTsGvHb97+sE2OcyFjZ8Yn2Po3OhOuxWKll1bD4oegs7sC38sno9KMtV5csNFQmukDW25DrvEHjoNWMKHABPhWlx4EqMq2RdkCqdUMoxd+xEM5fDAVA42+v7j8fB4v82VqJESXQ4LeLaTPw9H4FrhWfagZGNUpbK824WuSohGQM6B/JbgE5+63AqtLIRDkZNEj0KMr+mjbP9AmmQ+EGDeh6QrxQOEULKxWNHbydSQu/xkdhZiRaYnZiXnbC5gVQcqoB/NxBv7LDRbox5elZKPwzesf3Uz74orENiNanC6VEwbuq5BdhAmh6BXRtg5+5HEXiEFyjIWHos0YYRp0WK2/SzauTosfLTsTZndHkvxfoPTIU1DZDW3zkouKoiyMZAF362ktIQmjTm41+RFhnL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 05:38:49.1313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dcf10b0-fe17-4ac3-eaf5-08df4ab6619c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8292

From: Siva Subramanian Ravi Saravanan <sravisar@amd.com>

On ACP7.B/7.F with signed firmware, the DSP firmware is loaded through
the ASP carveout in DDR. The carveout loses its contents across S4
(hibernate), but on resume the loader still SHA-DMAs the image from it,
so the DSP fails to boot.

Patch 1 enables ACPI target power states for ACP7.B/7.F so the driver
can tell S4 apart from S3. It does not change behaviour on its own.

Patch 2 clears the cached carveout firmware address on S4 resume,
forcing a full request_firmware() + VALIDATE_IMAGE reload. S3 resume
is unchanged, as the carveout is preserved across S3.

Siva Subramanian Ravi Saravanan (2):
  ASoC: SOF: amd: acp7x: enable ACPI target power states
  ASoC: SOF: amd: acp7x: reload firmware from disk on S4 resume

 sound/soc/sof/amd/acp.c       | 9 +++++++++
 sound/soc/sof/amd/pci-acp7x.c | 2 ++
 2 files changed, 11 insertions(+)

-- 
2.43.0

