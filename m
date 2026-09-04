Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013061.outbound.protection.outlook.com [40.107.44.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C25C3AA51E;
	Fri,  4 Sep 2026 02:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788489911; cv=fail; b=WTz0VZ+CbTN/vnJcdhwlfbpKz4ivAntLZ4mVFHWvo7gDxtMymDkv1Q3Gag92d785OKHaEWuiVU+5qh4tPJCgyRnXvOUlzdt+03I3nu59GdhoyTbNAKomhBOxx4zak96BGV1drQrcSlXxnWZaadzFGPXaKL8hnmA7lneBpRRtkBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788489911; c=relaxed/simple;
	bh=MpfU8VDXbF2hKef1etmkqBfzZEOedWda+2Peerybdtc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NNOIDEWRi6cGUPWQPsr7ob2yi3zUg7Z9uwK/S8IgFRdCVSP3HB3SZ+V85TystGkEM7DraeG+JVh+e8aEhwwy4Kja2oeIRdFRDzk6k/DlKaRQrmzLSrxohFDY/T4OxHca63ypWUkAazLZmQ/MkAeWu7Q1ymhai3FA+S8cJDoyy5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=BNtkVF7C; arc=fail smtp.client-ip=40.107.44.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="BNtkVF7C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y63o9I9QvTfETg0oeL4Euf7EhF560KYpPYhy/4bc4xiwEIwB+qdqkmxG+jDXgDjnxyGsWkjPXnJAhTx7ABgur9ZvdPegWRGufpTJ4M80uhQPWNDBfQr4mmmIxwedieqKpLOJpnA4W47ZxuH3NyRhggBMRnPH0HPJDpToW1ME3feJUFvt8pGU6XZjkfwFQVHdb9thizYCiIyzcCcQ5LttAKEIzRAROhh/L8KtfKfx4aImaSTYPdL2Spz4kWRCfiJr4CZTGRY1O7P/UDUqQqtDclJW7KlxxHushkKDyadZ5XEZiBVotiS4cj5ZvbNnJ7+uKpfxxagD/Wah321lSqjhuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/dnlV/m6Eu3uk6u3lw8NcphABP50ZU80Jca6XXOPF8=;
 b=JArgx/vNwbjBPsFNdvbRciM7iB8Qz4n9QkJoeiQAO25UxPew1tBPR1GWzHonF0/WdeOO8s/+s92B3hpMomqGo7kevzcTpqYEWjj87PDuKbDerc6ad/Kj7caFN3EcK/ChNrf/92luED1dhI/YhSf3dIOhSXqbrm96FY/IN+c7mKF4uFWcdchRZwdEF8kiRnbJvE0XT36abJxr4yOa4mEIlheND7aMkUNsEeSgYloFW8ZMs9H/Nvf4v1v4AOf25HPxrl/rZxg7safGwQgocmkGjh1bjMa+35JLqBK6IEju/b3tEDRmJqs6a8iGtMJ/t1Y36G8Z/vcHtmctVJ36cOzUyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/dnlV/m6Eu3uk6u3lw8NcphABP50ZU80Jca6XXOPF8=;
 b=BNtkVF7CRJ2NGVuUcjg0s4ukXu9rXgGrZ4jDLUdQiln83ZxybGQbw6iWkMHtIyMb00yZw5trUcOo6G2PG5swCrwVTlxTaHgdK31vCujRozuBURbb2X+R9lmQliTxXDHvfkR+LOXOuRjHMmdkXCPj6iMCJkMCxImbysvqWBEHgVr3YsGJTq86PfjbtilpXaMmYvMcsNXXYupa1rVQfo7Nrg7exjIxaxZ7nxV1R1s8OSNaxrcnfG+wPoIj+nSwmUggs8dU44HLlA1jnQWuwmP1YtTP1DvzbkmMFBgcsf3dtuX18uEOA7y1DY80IUR5PMY7mw742Sgm07ogrB4OvGR8yg==
Received: from PUVP216CA0013.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16f::14)
 by KUYPR03MB10311.apcprd03.prod.outlook.com (2603:1096:d10:97::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 02:45:01 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:301:16f:cafe::3b) by PUVP216CA0013.outlook.office365.com
 (2603:1096:301:16f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 02:45:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS02.nuvoton.com; pr=C
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 02:45:00 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Fri, 4 Sep
 2026 10:44:58 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Fri, 4 Sep 2026 10:44:58 +0800
From: Neo Chang <YLCHANG2@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<neo.chang70@gmail.com>, <kchsu0@nuvoton.com>, <sjlin0@nuvoton.com>, "Neo
 Chang" <YLCHANG2@nuvoton.com>
Subject: [PATCH 2/2] ASoC: codecs: nau8360: Add default PEQ band number for DSP init
Date: Fri, 4 Sep 2026 10:44:56 +0800
Message-ID: <20260904024456.193528-3-YLCHANG2@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260904024456.193528-1-YLCHANG2@nuvoton.com>
References: <20260904024456.193528-1-YLCHANG2@nuvoton.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|KUYPR03MB10311:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eaf495d-fa53-4ce4-da10-08df0a2e83a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|6133799003|56012099006|11063799006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lvllP9uAY9AoT0eRPrThXcT5Mjk9q8nG3KuV8E1EZ+uxJnXs2dNGoVJShosX/flPBm7hZt8zn0c0hxWq7kcgP4DyRVQTvnRq2L/cDyA/MQwg7s+dhmUXUWiXrBfgWTPSN3dOy7kyC93R5OzENMOV1CE6xCcPMCr6O/nx12WoUvAnAwRwSKbvC3V53LRfbJ9hy6zbHJ60uLbeOtXPka225i3CgNo6Ogjv0qjTG7zzo8Nhvs8m5IAhhLknlX31rkPrs/QoOpes9QduMxcv7fpI44Dydkv8oopgLIHfY/6d6/wgBWQoijWg0wSrNXWy+ckNUbq3ASABYJTR8wbajnSB8TNPv2+ZqGe3+0hDIg6fiUABF+UJoc3AAozU6XOBiWxzY/GMP7wXTxtf0hwQwyMyjXGuMH4b78eBn/vFc54Yd+t++PoXmleKraiKU1DK0Lx17+vNcD3ot/hJK0DzQ12124u6PIIsHDOP5IAzmM605prCHZFgMUIdXDM+TA9O5YW7goJspia5K2RJsoYoj5Kh6FAL9q68eAvBHtIKPzcWYokyMHsUA6Ldw0F2zLB1YYM5QJLgoLX2lU0E0vVlyMohQfG3mMVYS1YBgfXuv0VwIp1VBm+JYtxSYkYkYejSdvsyPRqa0zGmsEdXqeY2NgZ+Yj4uRRmg0tUEX9KBY1kqkRZzwg5gqaE4b6vFZ19dN7gkCvEt8cHY7yl14eGN9hNOrw==
X-Forefront-Antispam-Report:
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(6133799003)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G+ek9LsRq2ffJm6NL5qWHca/277RogM6ag1u4QDUI656T4u3hOC1B0YrfJmyS6kH0FaiN4orvFFMU3An40rci6n+bO/2iIV++87Tw9lzahEcTMuUVNdIisRKnP4wp3L9gAL9ezoNc1SleEjJqUNqC6SZRoFSH3R3X9DNKobrqEOUgkj19oGLqkRUcteJUHExsM6hj2oE0C2rQyBnvBOdgdbNIzQNgCSm7hEOL+VVacU2UHJib3MTGVC82Otbp9ht4XOTxU/i0p2l5melBLTLXlEU5zowF5gfLm3VvFNaymUbOlRBu8bdCIOjCMSpYYLeaZ5f289DnKvw+G6v5Z39Qgf9NGCx3IOFdg2YdpYYw8mtg5llfSXf8kKKPC7F+ud/HdfbLMVgBhLhU7xWXdVEF5q6g2q7sWyKN+r4J13zpIDOG//1YkfZ6bCnkKRFoeJp
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 02:45:00.2294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eaf495d-fa53-4ce4-da10-08df0a2e83a2
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR03MB10311

Set a default PEQ band number during DSP initialization to prevent
invalid state or uninitialized parameters before user configuration
is applied.

Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
---
 sound/soc/codecs/nau8360.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
index b3cf207eea86..5a94e9a3072a 100644
--- a/sound/soc/codecs/nau8360.c
+++ b/sound/soc/codecs/nau8360.c
@@ -1602,6 +1602,8 @@ static void nau8360_coeff_set_def(struct nau8360 *nau8360)
 			i * NAU8360_TOT_BAND_COE_RANGE, 0x20);
 	}
 	nau8360_peq_mem_enable(regmap, false);
+	regmap_update_bits(regmap, NAU8360_R9D_PEQ_CTL, NAU8360_PEQ_BAND_MASK,
+		NAU8360_PEQ_BAND_8);
 	mutex_unlock(&nau8360->lock);
 }
 
-- 
2.25.1

