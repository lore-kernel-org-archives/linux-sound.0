Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012011.outbound.protection.outlook.com [40.107.75.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FC527FB18;
	Tue,  8 Sep 2026 03:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836640; cv=fail; b=W55T2Vwnz4OAQLoEqBs/mzVDRdPHwTqwEPyv+e8q2XyQAUaiRjJnhkQaj0qGCWaqKHjC4Q517nkVUT1cvLdZJ1WfiWGplYBBUXoSd8J8gESHUpU5e8eXKmo8UAmHTcfLFfKLxW2Xx12MxikgjwNyt6J8ZiXgBr0TlSNNdhp0wMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836640; c=relaxed/simple;
	bh=7MFBrpbTFn0GvLKTO/t9yP/hJBIvA+VQVb8UvaJd9eM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ukS6Yv7hjNTcBgtEoKSBc6BAsrOaCOpGTLKO9LiXlptvJMYuVv/sP914d7tLJSHED77qKICSgdLyTpwM9JpstWWCE7rnI7r/+m7gWVpWzbV5e0ZbnIaY+gBzYXz1+3jfnHL+057NQzlgmEuRb/93IFWdykr0qDXKoGkD9pFjHIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=PGxPwjnE; arc=fail smtp.client-ip=40.107.75.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="PGxPwjnE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPJvzcglI0TaWkWqETg3x6FpILGUZuPJLDBmVHd6oiNn7/HddK4KI8DhsKjRUDUemIpSRgsnofNTExQE87ewqQp8Ox+Oh/StLk8+x7KefF4GEJkdiph4g06gBbnqwVHzxMZ+T19IMsAVmGrLDoQp+jVU4/ugyBV1NSJ+KMUgTh9g6U1ltkc1cpCP5WZb9/G2u+jN2bwg6VUvlyDm5gd6189Sc6NXtHnIkr5DmsU6veJdSkjQzVKmaeeecHNXp4J9+uQbEMrBw5PXYEbUMzQBQcjVTpabZ0J02LPLYTr9QVPn9l19tomJiIiwO3cJBch6Rdio5Ad4iOGIfsSnhsD9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fmf730+o/s1zanwXMFJFOCewLBWM28x7A0Xw1/jsiJg=;
 b=HuryyYc6I3P71fVm+sNagegcrHcodLxdFSR8WKiwRvpUlLrRhW3z1vH1CQPRYZK4inNpflAAztciAUeuaKZkuR0nm5G4xVunDs6MKG0gZkki3I69/feL9UW+ASWjG9+ZcaYt6AgOvnI8g6L7Hl0WE50MiXGV86ByaAN/lRl+C6OCTGejm+tSos69qB25ZkkTDcGKiMni1SmHTBwQgWoEWw1a0Oqb4ybgcC4XWXVR7nNoaTPMm1yDe7a3DVX5R9+tq4oDGRQsN9C3WE5CEhxmcyA5GOrNiFaniH6M+Pq7XpjRaTB/lypmq6VvLDDvMg95Dc9xtjnmb6uyFPTX/ot1sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fmf730+o/s1zanwXMFJFOCewLBWM28x7A0Xw1/jsiJg=;
 b=PGxPwjnEsrGQOkSgWo8kk94NabJEVWSok+MlWSiYU2kyhWaMT0lWtpLYWKbPxtVDS0UWUyaxYjEld7RbDFiKpT3QGpM+FgJjSp3emqVZN6WaeFS5syFB4X7flTfyistrxnxg1bnc7sR16TXUgCaspuBAXoG11CPmjsvfrrZyhMjDfmE/vwTjbblDaiVCwSoGW39KC/ETNYJ8l2gQ7AtjWQzLsevyabMRrGlG9RlimgSmKd9mldSg43fOljDX5DeJ4Q9OjWRjhioyN9Iarzki0NFPOce/ymOV2t6NXcrFqpnpyh9mUfsZYPmPKGGcACSp6QvPhwDwhRX7Iwh2CgFMlQ==
Received: from PS2PR02CA0079.apcprd02.prod.outlook.com (2603:1096:300:5c::19)
 by JH0PR03MB7808.apcprd03.prod.outlook.com (2603:1096:990:3f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 03:03:50 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:300:5c:cafe::2a) by PS2PR02CA0079.outlook.office365.com
 (2603:1096:300:5c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 03:03:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS02.nuvoton.com; pr=C
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 03:03:50 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Tue, 8 Sep
 2026 11:03:49 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Tue, 8 Sep
 2026 11:03:48 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Tue, 8 Sep 2026 11:03:48 +0800
From: Neo Chang <YLCHANG2@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<neo.chang70@gmail.com>, <kchsu0@nuvoton.com>, <sjlin0@nuvoton.com>, "Neo
 Chang" <YLCHANG2@nuvoton.com>
Subject: [PATCH v3] ASoC: codecs: nau8360: Block DSP path selection when firmware load fails
Date: Tue, 8 Sep 2026 11:03:42 +0800
Message-ID: <20260908030342.222655-1-YLCHANG2@nuvoton.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|JH0PR03MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf7a77d-266e-4496-65f1-08df0d55cecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|10067099003|11063799006|5023799004|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	Z0JeRAyQi52h5WCqZFayBaGdvBfJiKVaL0juYPxum5fLDJDG9mMuHnl9Cw2IFe4TjOPbGBXHJmA5dXmbqkSdFuAulWvLvhksZ+8yLuK7KTr5qlXjaaYd0fTmEKA2htXJxSe+dCmbVke0px7GF9K/8HNBvZKcEYz6A567oywMn0XkKoxjAnVOZu/r5ki0ODBOUcoXg1PX/XlbrwkUV19t1f4Egh/8kliicem+wD9lqc+LmlUa7XcdsfQzkurByAbPQmId9d4jvlTwguAk9sR/nxSbZL3rilg9ciOGfpL1fWe1Z8DAg609r2YQxpgSlN0kmBsp24QWR9Z3mgcc2ITkRzTvcOw2zGMZtiOYDVWWTrzJTFM0DdQtPBbMsB2T0xqocXuKczhoVlHJ4csZTtk6MQ0NJgEWm62yc04bN33CYI7rrlFvaWqHuPcdKoFWNt32mC8mn80mB6huqQIQ41ZgxK7FmG6rRzJEDKW3fIs462sRYoX3f6rhaHLxG4Oojr0loqWtBdTp9hCuqtdYAnMqFkZeIjD+EhiZtgNGZMtUW3yFeSaELazGVILo0OW0B4W4t7mKEPKbSgikTGfoddBxF55JnTmudAqTNAdreYIWm5ogciCLUFPxTyyvUz4yj+mMsY+h63vEIFu6nn5d+x5sqrH4YlwPS+GnoudjG3uptAfsfHSaA5usD+dPdXYMakp2UrRemFpQ/35lHN7W08n8fQ==
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(10067099003)(11063799006)(5023799004)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rxZT0enew/tSSXu+W06HLLSBLrxNAXK0LRFdzdAsGsN0VLZuQX8lA6x2fjFQsfmHI840VdggjioAdTFUbY8zhFkEuocTYyBY2Ri4CRogcY3TQbotmwLxLMp0cdU67wm1SMgpjh3We3ODUtAWSgeridCqcD6JpGXMVzlTdPfq3I+CJJFbaGxxLnC6Xc9+BCWLL0xoiWQywmabfbJ69fYkr+IGm+xB7xR5ciuIibyQ/F4qAYxlaP+Wn/yt8xaHLspPleQTeqQZxdwMDgPVpU7XkkX4iaG5iQUh7bfwsBycYDvAkpGmn4yKsbmWNqFGLqHRWUytUyWKYMOLw/UOYyIVQlAAAXF1EbcazRosIwzGUC6mkopYt8Ofs6v2CRGYOqEFvXNHRP2wYrnO+D+79Bh1bJG9QV0jXuG2k5oD39pl6BlEt21vaEpbhcG/jmlXZTEa
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 03:03:50.1877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf7a77d-266e-4496-65f1-08df0d55cecb
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7808

Block the DSP path selection if the firmware fails to load to prevent
invalid routing states.

If the firmware is not ready, nau8360_dac_mux_put_enum() will print
a warning and return 0. This rejects the invalid userspace request
and maintains the original hardware state without
causing audio wrong status.

Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
---
Changes in v3:
- Abandoned the bypass fallback in nau8360_load_fw_work().
- Added check in nau8360_dac_mux_put_enum() to explicitly block DSP path
  selection and return 0 when firmware is not ready.
 
Changes in v2:
- Replaced snd_soc_component_write() with snd_soc_component_update_bits()
  in the fallback logic to prevent overwriting other bits.

v1:
- ASoC: codecs: nau8360: Set DAC path to bypass mode when DSP firmware
  load fails

 sound/soc/codecs/nau8360.c | 5 +++++
 sound/soc/codecs/nau8360.h | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
index 89b8ee80d6c8..57a5023fe7b7 100644
--- a/sound/soc/codecs/nau8360.c
+++ b/sound/soc/codecs/nau8360.c
@@ -719,6 +719,11 @@ static int nau8360_dac_mux_put_enum(struct snd_kcontrol *kcontrol,
 		return ret;
 	}
 
+	if (item[0] == NAU8360_DAC_SRC_DSP && !nau8360->load_fw_done) {
+		dev_warn(nau8360->dev, "Cannot enable DSP: Firmware not ready or disabled\n");
+		return ret;
+	}
+
 	mutex_lock(&nau8360->lock);
 
 	ret = snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
diff --git a/sound/soc/codecs/nau8360.h b/sound/soc/codecs/nau8360.h
index cc640ba8c838..71396747c0fa 100644
--- a/sound/soc/codecs/nau8360.h
+++ b/sound/soc/codecs/nau8360.h
@@ -870,6 +870,12 @@ enum {
 	NAU8360_TDM_TXN,
 };
 
+/* DAC Source Path*/
+enum {
+	NAU8360_DAC_SRC_HW1 = 0,
+	NAU8360_DAC_SRC_DSP,
+};
+
 /* PLL Source */
 enum {
 	NAU8360_PLL_MCLK,
-- 
2.25.1

