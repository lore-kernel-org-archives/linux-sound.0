Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453718;
	b=b6sb9a9c+a6mD0+Whj8oXuBvIy6YDJs5B8LmkoMwZPb1kKqI5JV+h1kTRlh9FbFq3JZ4
	 eLeUyVWZ42Kt/ZPR1c9leLtuqXjhS7/6GVeuQRExhVuZXDkkGdB63az+7HWuepX4GvTA1
	 oghuBT+rDBgEKm3Ss66oC6yhL/wTVXixm9MlBeb871+O7BTjyiQvIuRhHJU9wkqDtGM9n
	 n/N2BpevyRlqgbXYW2QVP3GAusqMI6pfQQ8cPebkM99gkPhZ4rO1+EkLPHzdMoBilkW5u
	 Rl07lFEY65iNrlGaQsN3aL8ClSNNhqcDYq6z5uZCCjQsdeRPhvASy6brHVpFzVJzOLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453718;
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
	bh=jzUbdEyrdVYpfEyao7ZWPPcfA8Bj5eg/kPPobzBueTo=;
	b=pE4Sf3SYbr6vfX9qPfeK+ozP6d4MSMT6+v6W1lIWgjbwQlxhQH8vMIqQfCZGyfgKdeJt
	 lg+sZlFj4qe9yAEuF7bT7k0uHQXt4XylmqKX/nOQgVkyn4r634peLMvolq/8IwucE+aMT
	 YmBSEC9eCCJurjvVclKBF9gsKJ1eo6HAKIdFO1uN/Jp9W/KyW67U8XYOclsZQu/Yvi9dB
	 wyc8U9+USGn1TzzNrXnUy+Skp02WP/zrs56A3gucukZHawerFJHFXV6R9ihDA0ZiaT0+F
	 xWzdrXk0rUTw+L591PPQ+gj7g38MUEjucNQWFR6kD+1ezlNj+F+BxwV5h9hkjGKpLZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="fTS/Tv1r";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.68
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011068.outbound.protection.outlook.com [40.93.194.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EFA606A333;
	Mon, 23 Nov 2026 17:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16EFA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fTS/Tv1r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXiP6DnPAkvZbdq3OfEGBdE43mfOfKjs4tAF3e+ZQwaosPnCcPFE9MUn+aYozvN7HRuHfQuDEeheTM35CKGtpkFcROrFEzRDXf2n8VQNeVmJbUBfPQfwpeLONc6xXzRnD53gDXSJNPe39QPDfv0Lkq8siCKPCAd5RKXnX8RJNE406ubKof58WfsIvQ1DtLHxpBDrO92K0Stgbok+pN/HBWEHv/300qfk6dwjeMprmTB8q7OEWXCOgNuqctgj+NnL2ZMKx/0FbE3CEJzZxf+6IZoWac8FADnYHt7LFb1Y1jVJknvca0tHd9IevCCs9jFVV7l7HXtbEghWW+e/6E85Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzUbdEyrdVYpfEyao7ZWPPcfA8Bj5eg/kPPobzBueTo=;
 b=sUIaVEDv4erw8+F3DUCqib0dqeG8VYR3BtSFHQjJmwY0NXr6ccY2UH2HfnEKAH7XkhVHo9Gh5fo8HruAx9ZSmA6j74/23q2Yuv1WT28FbeU0DhSsPEyZ58D1BAD/jo9llA8eAPNIn9IIugNHxDthazYfv/Pi9Cgz9mpufP6oCLjLzNl9ofSheQSj1KJsl9G0gjqxgTdWIWlbF9q+dz/sOYOFFLnGnudUfGZG2CH8otuuYLbTzz7hTbTTQw22xvhyqGeGxsdNxcpw04C4rP7gl7Hj1Zgj/HEpxELcib7eIdEjJyv912xMAkb6NwPnPbpfeVakKsliUaa7nWyWPNX3KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzUbdEyrdVYpfEyao7ZWPPcfA8Bj5eg/kPPobzBueTo=;
 b=fTS/Tv1rv1iMKVw11YWTBkOhAwqKBC+q5CTdSJr3b7N0uVofmXpk7ULUsHq9ubd/odnE1zqlwUqog9LmvnCmld+MX56lc6OED45iC0ZmVjE5Inq4JojxUItY4xcy9rPDX/1mmB1we/Xo61O/HVVhZdDrWdmXE/rnsR2rwUMZfFE=
Received: from CH0PR13CA0058.namprd13.prod.outlook.com (2603:10b6:610:b2::33)
 by MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 17:08:32 +0000
Received: from BL6PEPF0006C3E1.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::68) by CH0PR13CA0058.outlook.office365.com
 (2603:10b6:610:b2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Mon, 23
 Nov 2026 17:08:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0006C3E1.mail.protection.outlook.com (10.167.249.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 17:08:31 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 11:08:27 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Mon, 23 Nov 2026 11:08:23 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v8 17/24] soundwire: amd: propagate amd_init_sdw_manager() error on resume
Date: Mon, 23 Nov 2026 22:27:38 +0530
Message-ID: <20261123170520.1380924-18-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3E1:EE_|MN0PR12MB5716:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce9f5ab-7b7e-49e0-e5dc-08df498466a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|18002099003|22082099003|261026121527099003|11063799006|56012099006|10067099003|261102123227099003|261021123027099003|261022105027099003|261026140227099003|261021121427099003|261028144727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	qxym2T1aHIzDNX0QaPugFR9w8pGg8J0QA+nF6QVvP5ESKcu9wh3hTZTFdi2RwmWvpITc/0N3MnFV3RfmE4l0g8qmdnXO6RdWGji/sn4jBWvJAjgLGUKbgSBrNz6deVsmD7MpVahbVUnAtEO2vU2bzIW10H9OD1s6du1Zuo5mdF3kLj1k+lzoO8KbmqS/SqK90UGmB9g5kMKkTcucvV3XwtBRiZvYvVKmTpFI5eAcBCcwM6kY6jwQTrs/1J03JbUwUx77vFTqPKXRZ2upD7PCQeNKnBlFpe+Cl7lGlZYsWNSagoFql3pke4DvUUr40Ii9xu9HinNNt+hRvhtYnHecdQedjrXP8wULD4hls50mpoLY8gf0AiuPBuHk4evlsN4DniwCNUhAK3FxOtJqeNvBVVkFm+s3Mte5A4iLbKNNjve27PDIvHX/VFSD8KK3duw0e7Jxfz57LivDa0KJheVXldCbDyGHt9CNAJNf+STri0T6bs3Skl3d19OOoFe6RfH35EKxVti20zjpEbyd08Vik67TThuxXtIdbu67IaDghhiHsQkoj3eP+WXmoCFJZdo5CY3iD+sjZBI5LBHAnhlM7MKps1E+0h7emJg1Za4Bp2GjbJb2Ns0HNr5zXKK/nuYVzA3nq21PEHruvUkTh8mgoko12Ruv/c96WI6ssmfjWCJoks5Nwl/QL4VlYGFcOnskmhAgNv8Z8Z4RzxD2Abtplw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(261026121527099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261021123027099003)(261022105027099003)(261026140227099003)(261021121427099003)(261028144727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	esgaOtRHefjjDoLZC4quffflhaNBczLTRtOyInhEL+3GufxOCNnCHIDW4mxZeNMstR41FfS/kw5NZ7wYLxpSOBPCYg8qzfKfDtBKdT/N6XZ2t56zTu+WDPxPCmdocD0Txdxs07CqsJX7QzUT/SrTTadACUh1VuV5btIYjSt+UYASAmCvgKuvA0lvKgilOIuNL/IHcVbXzp6TNlDhZZ/ZdiVv05JnvyZXN+7bn7naqeN7JBI98egYWoQu1Ka6CyCxZJpOz80IW0yu1Q5FX3UZybcXyAJ62GgT7gn9WqahY2OYx2AD3VIwnnQnyKUyDNz0l/08xoj7KROyE7ehXBD0Y+wKKd6tWvRhypqMaG3/Bs3qcUB+gbMeGyqHUa6lwk7PPGZYxFIkXy1l1r+KcxCjn/Bgs6os4h84W52kCLEdl4urxvZW/8mcf2DLfcdni14O
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:08:31.5848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce9f5ab-7b7e-49e0-e5dc-08df498466a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3E1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5716

In amd_resume_runtime() POWER_OFF_MODE, amd_init_sdw_manager() was
called without capturing its return value. The function performs
hardware bus resets using readl_poll_timeout() and can return
-ETIMEDOUT if the hardware does not respond. When that happens,
execution fell through to amd_enable_sdw_interrupts() and
amd_enable_sdw_manager() on hardware that may still be in a broken
reset state.

Fix by capturing the return value and returning early on failure.

Fixes: 81ff58ff71ad ("soundwire: amd: add runtime pm ops for AMD SoundWire manager driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index f2b5c855bbbb..8cb661690f96 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1612,7 +1612,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		ret = amd_sdw_clk_init_ctrl(amd_manager);
 		if (ret)
 			return ret;
-		amd_init_sdw_manager(amd_manager);
+		ret = amd_init_sdw_manager(amd_manager);
+		if (ret)
+			return ret;
 		amd_enable_sdw_interrupts(amd_manager);
 		ret = amd_enable_sdw_manager(amd_manager);
 		if (ret)
-- 
2.53.0

