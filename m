Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BF5456285;
	Tue, 11 Aug 2026 17:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786468002; cv=fail; b=HFhiMLCquHjORp1ZxFfPMOQyLXP9+8P4ef21Sn8v5AulYvvcM68QFJO/SQ1yh+ffSJuuBViGRBTTF8RgH9nc3q5CNP+x1uvGOzki6xxVywYKgyfZ6pUGLbq8EITdH6w8fZsR+Jun7oSLAt9keaaFc/DH4Piz7ZlUChBvMVL89xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786468002; c=relaxed/simple;
	bh=Fsqt7S4eSeUhiIJQwMbc0a1spnyrtaYywciSgnOfyF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Umwx2fJt0L7hCt97AaFbOwVgT7I+6sfiM74oH2LnikSJ9ko1L32YbWZsXfF/NPCeIi260/jIIm5XAgNGcLUwa3Fa9Kzxz578y8Rjh4W3Dg5vK4qIcjp2cZnqUZPxk8Z0P0Yl4GCKX8JjDNv2eFWXdpjcN2BJRpdXfh3wWiPs2oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RLyXhaWN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Tn3+5zVU; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RLyXhaWN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Tn3+5zVU"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDHsNL1536135;
	Tue, 11 Aug 2026 12:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=o5UXDAYuhcUcKa4BY/Rz/pWAJApkgelY2XV3k6sNlWo=; b=
	RLyXhaWNPMAqlKM5ha1VPIarFop396l3Lr0s+HTxot/cRMYCD5daGIYkUaXZ80Xk
	XqtcB/YVTkX+DyAhRenzLwBhAExSjYaZBeIjc82macJrEjSJ8C06UdoFUyTMNG4F
	yJxZO9cYBLhr6gj9STrfiEeBSDUTsCkDIBvrtoITJhSEcKwrMiTZMaIyne4P2Y1Z
	ioJZPbgmdjK9Iy3mLq8NVpnvwrSMpnw3yH8YDmja8trRK/lMLh8YDL7t8jiswAMw
	L2smWBSdgBvAF+ojPAJHz4n2ZzStdebSLqbSsvd1KBZGOkVcyuRJDRxRfhZz66k6
	2v9x7L8adka8bWrVuV0HRw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020141.outbound.protection.outlook.com [52.101.61.141])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fx1v0wnsj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 12:06:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jV00+u5jr01MiXIXit2TLT2TOQSWXgPJ7VDvsm+HF1SvCQoL+pPJIZzwjg25xd9R7rKgiv6h9/xElaJvHB83UOGZOVeF9t4N/Hc2ZKnzwNmw9hJggvAQ8RgzbYyAiFIFnxVHrR57aH8zQUyVQhB/NJdPAOE1VzyoHB7SaABaqni4Iz/B0mZGRH5JIjP0UpZmNUwgrpluwfvzHg4ngB7R+/zqmwAOUQwj6sAiE3t3Syv5vkK+gn3xMn4zHmVKHTHVfVBYpIfQHKIL5u9j0CJWIzKFygsd4ZvYHjSkdynp9+imDoNY4GF5b579sn4rHyts7N+glvaTaT8UCo3rZRd8Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5UXDAYuhcUcKa4BY/Rz/pWAJApkgelY2XV3k6sNlWo=;
 b=Bfktw4a/ZYypplaE2bnujt8dHNoRjPXBtZOeTJ86YRtaj5TkUpMkoUu8D011CiX6lquewK6zkZDHduAiNt3XtuDjwdGB5m2TL2++VpmBWt/JCy1/BaMWjgrsNntOYEphJjc9l1MGB1RfGZVPBV5cfg2K1yv61eky/rQ4MW/B1rmHBFb3I6xksKpRpBf/eCqhUv/oUhWhiOk9XZnwJzGcxOtxhoy5eGU/h3N3J2qZpKyP/jMx2UtwpUqZxOf3/Snj6Zw4Afu05+nyFnPp3/yVmAqOyYEyvnJcvvHHNIzxy9ZmKN2+97MUaKjhum0cDZppisecnSupYSsqbNwWE6cPqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5UXDAYuhcUcKa4BY/Rz/pWAJApkgelY2XV3k6sNlWo=;
 b=Tn3+5zVUNA6FYENktIPRhw9DqsoRLWBQNdt9tEmZImODObIKoAPfQneH2FrYfNkCbfIhCwfMnKuLltqHec56mSuHxMg7vWHUtSdWZJyHW/Jp5sLgcBcWxhcq+Wt5lqWDWqJ51Gr4zUCuj+QOhjhy2gY4BhRt14oqcEycUaJJrAA=
Received: from CY5PR15CA0252.namprd15.prod.outlook.com (2603:10b6:930:66::26)
 by LV8PR19MB8716.namprd19.prod.outlook.com (2603:10b6:408:256::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 17:06:22 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:930:66:cafe::5b) by CY5PR15CA0252.outlook.office365.com
 (2603:10b6:930:66::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 17:06:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 17:06:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5EE6A40654E;
	Tue, 11 Aug 2026 17:06:19 +0000 (UTC)
Received: from ausswws06.ad.cirrus.com (ausswws06.ad.cirrus.com [141.131.145.33])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6A7C482025A;
	Tue, 11 Aug 2026 17:06:17 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: cs35l45: Adds support for SYNC bus
Date: Tue, 11 Aug 2026 17:06:03 +0000
Message-ID: <2decc44a938373375530defd9a1645770987313d.1785855013.git.rriveram@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785855013.git.rriveram@opensource.cirrus.com>
References: <cover.1785855013.git.rriveram@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|LV8PR19MB8716:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2cea15cf-fb03-4974-1ac9-08def7caddda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|61400799027|23010399003|18002099003|22082099003|16102099003|11063799006|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	n2JAvGPoLoBNCOqJp7jSly4Ze0RnAgmHGf0Y/y47v7bv8/vwv3FkneU0YFy+PK6rJFWSuIzNyXcFHcOvBVlrleHbfHTnFsQTzOPY2garnLoGposrGw6U4uDYvytyXqvCchHIlqNiAOuIxwd1ZXgcc5YI6AzOxQn8MJGQAAIy/r2vwIh/fhqQ1wNYagvnrQp90wnCo9lBPCkCGEFWq4manI4R5SioEwKBmdxN+VVd/5gUcw+83o6XMp6+LmAMqI3mkCHnoaWM5x+9w8NFbcvIM1qUyP883GFLkidRgSekTiYWlRqXtJ9rIyn5bK4xkjoKCaBnETxC2Usr+7UvJQBbL15+de1a6Rf9RoqmmeXkNK2q5DUWSBryzPvGlajBpqme2CH4ULovzc0nrQBlp8d7IWxpwp7nfMfrsliagZTyXodjz3LYjP+9RtTSU+uXsUY5RcyCeZoXh29/MKu4jtAwWlLkQZmw/l1HuQ2alzufnjtDo1GCuAqEoasfDndW+k4HHVJS2WGvFZgSYLQvCmDk8DZomDM3KXhg5t5IVXEHMLFYyljv1TE+FNicgMjwW3sTPIm0HkKIpmJQMULnM75A79u6OI3PnoUbIv8vHheGwCb1A/6C4NqbMA/jJnpiVnjKWAWZFA1V20Uw5C0JM8AhGU+NK1ottq5BLGPX6azXHRBnoodVbly1LsdOa+9UOOLYVjGh+V7jFAxsFT329MtFX3R6XrDKVbgysW55l1oi2y312g9SFJRQFBI7cNc3fzYq
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(61400799027)(23010399003)(18002099003)(22082099003)(16102099003)(11063799006)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o08n8J01MGUKuGrqhTPkEiO168vxx7uz+giGQth9Ee1Oa8sSz/e+4EqfO9X6BWo/nJpeGIEmTMpewvU2rTQxrViH5cA5l5VglQaakbpzKL8LDO2EFWMgZhZ2O0CspoC/GDRYwK/yg+BuajkU8Glhihz5Yt8snLYJGZtSQ+Ej1iPV1yFSxAouEFbjddd79Yp16/4/nl4xD1t1RP3/okDqmrgcGeG3+lmh2vRP3eqJfFaEKeklRfj+QJTsy+tZmaqudr9eWAXoyCnJN68F91GoRNnY7PXZviAHkGTFE3rRtmDh8oJ7iyR652Jg9XWaTltsCNRoi7WFfq5WVVk3x97vS3KczF8O6rhGjbzZgpf9PTf0w5ZEZ+zYiQe2h7g3GgwietlcXHcyNmRRjIP6Owj+BCopyk3GwxGjbSohK9nB9fCcpzFl7jQ1tBgN5eOmgWO5
X-Exchange-RoutingPolicyChecked:
	Ji0nUNy75Ytupr7nZ1tuetlYCwryeP9/ye1lQ3xFyoVjw8n5AYnO+iDuGiV0ScpD65MnUuMpiyWSqRGbAOvMTaDwQFGFa/upIUIJtRVjDT0U6zWvQAetywFWg+qw/AXkKq6FnzJf7jO9a6eIeVNkXAHADBjlbl4G6YNzLG4WtC9IvsDxgwaji0vLOn2yZZF5DPTDz7veSsHSGdGfUx2JAAi++B/68aLXx/jVWMEjRllP8+/1OItkwkJmmW2R3bwZb0mo3C0uEwP1BhfgZcQbSzieAoz5M0U2EIVrsa6Cw2m6ikAIHkvN0FeVem/bGupAPVX4hWIYJgqbPCsadWSWGQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 17:06:20.7790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cea15cf-fb03-4974-1ac9-08def7caddda
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8716
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE0MiBTYWx0ZWRfX0fVHFyu4dAAO
 WVw2WcglszeKp1yfffSpGegDCYBXan9H9hxVvIbrUzSYi0euhWH5EgJaBta2PQlX+kAa6aJDah3
 9oKd3FJyVxozn91G3EsHoaRf5TjP6xI=
X-Proofpoint-ORIG-GUID: foHIrI2iMWIqStCEMLtIKN2g4ZB8JFAd
X-Proofpoint-GUID: foHIrI2iMWIqStCEMLtIKN2g4ZB8JFAd
X-Authority-Analysis: v=2.4 cv=ZMrnX37b c=1 sm=1 tr=0 ts=6a7b5696 cx=c_pps
 a=ZuCHbd2xFD7xydy4Rd7b4Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=UlYzATY2vTm_wIQl3csA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE0MiBTYWx0ZWRfX10g1AxcKURRK
 auubjYfwVgK+2v3L+PSdKTNqynNZc4VAAPYMtjWJysOC8AqtX1ZPNteuGtM7VaCymlD+wdS04KT
 acqvPCXsePx0zFPPGr57pox3lmHGAfkHcOFDfViL3LvYm6k/SuRuTQvNz8gzeKE5v2d1O2GgZOL
 IMSBdituT9yw91/WGvOnXLFdOdyrO4ZnBhAWUSr4MBRSjYauyhj3sxYXu+EIDPlEgbF7rwdn8eZ
 /DpmdCDEAK6a72P8AJBmyXFzTpNrHT4ECb/HF1Me9/8RLqDrwMKEZvn3I7f5vaKVRhK9gZMIg0A
 tdM6ecr5hBKntA8CaX1549exoB+abRdXsd6d2HWitXhWK4PVz5nDQ2no0dIrjeqb6gWKdftGHjp
 fiYknMHsFzbI+1l0cq5WFXLPEXGPMftEKNCreGo96eznD6W/DFalKem9cGBhqUyI1MGRgpkDa5R
 llPx92LXWeB5q+AmqPQ==
X-Proofpoint-Spam-Reason: safe

Adds support for the multidevice synchronization (SYNC) bus.
The SYNC bus is an opaque one wire bus that is shared between
Cirrus devices. Initial support only includes software (SW)
data packets.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45-tables.c |  4 ++
 sound/soc/codecs/cs35l45.c        | 77 ++++++++++++++++++++++++++++++-
 sound/soc/codecs/cs35l45.h        | 23 +++++++++
 3 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l45-tables.c b/sound/soc/codecs/cs35l45-tables.c
index d2ecc7b3f619..af8ffe9cb542 100644
--- a/sound/soc/codecs/cs35l45-tables.c
+++ b/sound/soc/codecs/cs35l45-tables.c
@@ -51,6 +51,8 @@ static const struct reg_default cs35l45_defaults[] = {
 	{ CS35L45_WKI2C_CTL,			0x00000030 },
 	{ CS35L45_REFCLK_INPUT,			0x00000510 },
 	{ CS35L45_GLOBAL_SAMPLE_RATE,		0x00000003 },
+	{ CS35L45_SYNC_TX_RX_ENABLES,		0x00000200 },
+	{ CS35L45_SYNC_SW_TX_ID,		0x00000000 },
 	{ CS35L45_ASP_ENABLES1,			0x00000000 },
 	{ CS35L45_ASP_CONTROL1,			0x00000028 },
 	{ CS35L45_ASP_CONTROL2,			0x18180200 },
@@ -134,6 +136,8 @@ static bool cs35l45_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L45_PWRMGT_STS:
 	case CS35L45_REFCLK_INPUT:
 	case CS35L45_GLOBAL_SAMPLE_RATE:
+	case CS35L45_SYNC_TX_RX_ENABLES:
+	case CS35L45_SYNC_SW_TX_ID:
 	case CS35L45_ASP_ENABLES1:
 	case CS35L45_ASP_CONTROL1:
 	case CS35L45_ASP_CONTROL2:
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index a032bb23b4ac..a16a757ef4ad 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -6,6 +6,7 @@
 //
 // Author: James Schulman <james.schulman@cirrus.com>
 
+#include <linux/bitfield.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -195,6 +196,43 @@ static int cs35l45_activate_ctl(struct snd_soc_component *component,
 	return 0;
 }
 
+static int cs35l45_sync_en_get(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+			snd_soc_kcontrol_component(kcontrol);
+	struct cs35l45_private *cs35l45 =
+			snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = cs35l45->sync_en;
+
+	return 0;
+}
+
+static int cs35l45_sync_en_put(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+			snd_soc_kcontrol_component(kcontrol);
+	struct cs35l45_private *cs35l45 =
+			snd_soc_component_get_drvdata(component);
+
+	if (!cs35l45->sync_pin_set)
+		return -EPERM;
+
+	if (ucontrol->value.integer.value[0] == cs35l45->sync_en)
+		return 0;
+
+	if ((bool)ucontrol->value.integer.value[0])
+		regmap_set_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
+	else
+		regmap_clear_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
+
+	cs35l45->sync_en = ucontrol->value.integer.value[0];
+
+	return 0;
+}
+
 static int cs35l45_amplifier_mode_get(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
@@ -607,6 +645,15 @@ static const struct snd_kcontrol_new cs35l45_controls[] = {
 			 0, cs35l45_dig_pcm_vol_tlv),
 	WM_ADSP2_PRELOAD_SWITCH("DSP1", 1),
 	WM_ADSP_FW_CONTROL("DSP1", 0),
+	SOC_SINGLE_BOOL_EXT("SYNC Enable", 0, cs35l45_sync_en_get, cs35l45_sync_en_put),
+	SOC_SINGLE("SYNC LSW RX Enable", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_LSW_RX_EN_SHIFT, 1, 0),
+	SOC_SINGLE("SYNC LSW TX Enable", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_LSW_TX_EN_SHIFT, 1, 0),
+	SOC_SINGLE("SYNC SW RX Enable", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_SW_RX_EN_SHIFT, 1, 0),
+	SOC_SINGLE("SYNC SW TX Enable", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_SW_TX_EN_SHIFT, 1, 0),
 };
 
 static int cs35l45_set_pll(struct cs35l45_private *cs35l45, unsigned int freq)
@@ -1064,6 +1111,25 @@ static int cs35l45_sys_resume(struct device *dev)
 	return 0;
 }
 
+static int cs35l45_apply_sync_property_config(struct cs35l45_private *cs35l45,
+					      struct device_node *child)
+{
+	unsigned int val;
+	int ret;
+
+	ret = of_property_read_u32(child, "sync-lsw-txid", &val);
+	if (!ret)
+		regmap_update_bits(cs35l45->regmap, CS35L45_SYNC_SW_TX_ID,
+				   CS35L45_SYNC_LSW_TXID_MASK, val << CS35L45_SYNC_LSW_TXID_SHIFT);
+
+	ret = of_property_read_u32(child, "sync-sw-txid", &val);
+	if (!ret)
+		regmap_update_bits(cs35l45->regmap, CS35L45_SYNC_SW_TX_ID,
+				   CS35L45_SYNC_SW_TXID_MASK, val);
+
+	return 0;
+}
+
 static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 {
 	struct device_node *node = cs35l45->dev->of_node;
@@ -1110,10 +1176,13 @@ static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 					   val << CS35L45_GPIO_POL_SHIFT);
 
 		ret = of_property_read_u32(child, "gpio-ctrl", &val);
-		if (!ret)
+		if (!ret) {
+			if ((i == 0) && (val == CS35L45_GP1_CTRL_MDSYNC))
+				cs35l45->sync_pin_set = true;
 			regmap_update_bits(cs35l45->regmap, pad_regs[i],
 					   CS35L45_GPIO_CTRL_MASK,
 					   val << CS35L45_GPIO_CTRL_SHIFT);
+		}
 
 		ret = of_property_read_u32(child, "gpio-invert", &val);
 		if (!ret) {
@@ -1134,6 +1203,12 @@ static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 				   val << CS35L45_ASP_DOUT_HIZ_CTRL_SHIFT);
 	}
 
+	child = of_get_child_by_name(node, "cirrus,sync");
+	if (child)
+		cs35l45_apply_sync_property_config(cs35l45, child);
+
+	of_node_put(child);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/cs35l45.h b/sound/soc/codecs/cs35l45.h
index 7a790d2acac7..f8a4713ae92f 100644
--- a/sound/soc/codecs/cs35l45.h
+++ b/sound/soc/codecs/cs35l45.h
@@ -35,6 +35,8 @@
 #define CS35L45_PWRMGT_STS			0x0000290C
 #define CS35L45_REFCLK_INPUT			0x00002C04
 #define CS35L45_GLOBAL_SAMPLE_RATE		0x00002C0C
+#define CS35L45_SYNC_TX_RX_ENABLES		0x00003400
+#define CS35L45_SYNC_SW_TX_ID			0x00003408
 #define CS35L45_BOOST_CCM_CFG			0x00003808
 #define CS35L45_BOOST_DCM_CFG			0x0000380C
 #define CS35L45_BOOST_OV_CFG			0x0000382C
@@ -183,6 +185,8 @@
 #define CS35L45_ASP_EN_SHIFT			27
 #define CS35L45_AMP_DRE_EN_SHIFT		20
 #define CS35L45_AMP_DRE_EN_MASK		BIT(20)
+#define CS35L45_SYNC_EN_SHIFT			8
+#define CS35L45_SYNC_EN_MASK			BIT(8)
 #define CS35L45_MEM_RDY_SHIFT			1
 #define CS35L45_MEM_RDY_MASK			BIT(1)
 
@@ -220,6 +224,22 @@
 #define CS35L45_44P100_KHZ			0x0B
 #define CS35L45_88P200_KHZ			0x0C
 
+/* SYNC_TX_RX_ENABLES */
+#define CS35L45_SYNC_LSW_RX_EN_SHIFT		19
+#define CS35L45_SYNC_LSW_RX_EN_MASK		BIT(19)
+#define CS35L45_SYNC_LSW_TX_EN_SHIFT		18
+#define CS35L45_SYNC_LSW_TX_EN_MASK		BIT(18)
+#define CS35L45_SYNC_SW_RX_EN_SHIFT		17
+#define CS35L45_SYNC_SW_RX_EN_MASK		BIT(17)
+#define CS35L45_SYNC_SW_TX_EN_SHIFT		16
+#define CS35L45_SYNC_SW_TX_EN_MASK		BIT(16)
+
+/* SYNC_SW_TX_ID */
+#define CS35L45_SYNC_LSW_TXID_SHIFT		8
+#define CS35L45_SYNC_LSW_TXID_MASK		GENMASK(10, 8)
+#define CS35L45_SYNC_SW_TXID_SHIFT		0
+#define CS35L45_SYNC_SW_TXID_MASK		GENMASK(2, 0)
+
 /* ASP_ENABLES_1 */
 #define CS35L45_ASP_RX2_EN_SHIFT		17
 #define CS35L45_ASP_RX1_EN_SHIFT		16
@@ -320,6 +340,7 @@
 #define CS35L45_GPIO_CTRL_MASK			GENMASK(22, 20)
 #define CS35L45_GPIO_INVERT_SHIFT		19
 #define CS35L45_GPIO_INVERT_MASK		BIT(19)
+#define CS35L45_GP1_CTRL_MDSYNC		0x2
 
 /* CS35L45_IRQ1_EINT_1 */
 #define CS35L45_BST_UVP_ERR_SHIFT		7
@@ -493,6 +514,8 @@ struct cs35l45_private {
 	struct regulator *vdd_a;
 	bool initialized;
 	bool sysclk_set;
+	bool sync_en;
+	bool sync_pin_set;
 	u8 slot_width;
 	u8 slot_count;
 	int amplifier_mode;
-- 
2.43.0

