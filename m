Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315493CA487;
	Fri,  6 Mar 2026 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772810959; cv=fail; b=QQ5uT2h7goUKzpwOxqPPMEFXRL2jWTx0T4oqxd1LlRwwhM89KfOnDlxXuNQstgxnWdNikC1O0rfQemMyESgcIecFOio/Y9swqvGTz9HK/YIDEERreLSIZFAjSOHqa+BZ6xyZyDD0wmj1pKCimnpebqWHANrlUYzOBrWW5QPqY8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772810959; c=relaxed/simple;
	bh=fsRo4AT8D4KMQ8tsRzByFPfHz+XGcSUHUlVHoy8k4zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C9wCCu29eEQvwRiUv/HZQxJrFjI5dr8MA/J7MQfOB6sdgNprzzlAeRkQu0/FKlVlBAcPMnNQmzqu4LToCj+NXSMBLeb9upfSgKEU+W3pU6fJ2q3NlFxjQl5RZGkgE/sAsIqHt6vcu++wgQwYdlW3ujnARkPpAZzwMeciwkyG6/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=k/F7/aCf; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tqMFfMXJ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="k/F7/aCf";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tqMFfMXJ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626D5dTa087281;
	Fri, 6 Mar 2026 09:28:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Vk+LoDeAX1otTJx1KzAoB+Dtew0AWPw+dVIej2+/YdI=; b=
	k/F7/aCf9yeX1nrLKq5kr1Oh1CJE3NjvGkbiN4YaT2yLeDAUTJTUpMu1NhD3haTw
	WSlSVwPS5TtnVA/4WxB1GzI4uVWiECKw7GdlaQjG/ZroG1f/n2kqo+VVkkXH+ljK
	Q7PZ1WKXCE8dayGk5Ycl9FvNZfCjrNye8wcX4PLFguLfDd/+tqjdoetB30cC7yVC
	w8r0wm0I8raaQoDTPJf2rRq4rajrTvTF0WZxYFCJoWlvOK8l7HKc5QIOg8uSAIQl
	BqCKp2RlUqxJ48FeZ4CQxn2MwhKbvGXPu4uuqfBLQkpGmAteGGlzLgr9Bkho0omI
	hxM1dguGrCbFdjfGgM23AA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022132.outbound.protection.outlook.com [40.93.195.132])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cqyg886er-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 09:28:57 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvNKW+wCyqLenPpFKbjdv/gEnrWiERSlarzBk9joBEVqDHwCPXZrgCNfxYw/d7HV38v9LwANc1g4+FXvs5DMjRtXd2CZ7VU9rSb7vudEVJUUOmTm+tTCmvG1gXF1F8nuuzSfnYWllZkABPNhibFYXAIAhJUvG0fYnIsrn0tAOzTvhIOYT2Z68aDgJGhwfC7s517TEsDE6G0Pzepdl5QQOXoVqJ2+PW6lAYED1pqiMIFJehqkBWWamjfS3SOd+o/mlOeeysh5DHqoRCuXsO2NaeG33baCFJScvk3W8JA8lI603Wfmdj48HJ/F3XS/v3ze+TqWu2hS7o4ZoUFIiLN2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vk+LoDeAX1otTJx1KzAoB+Dtew0AWPw+dVIej2+/YdI=;
 b=ywkTgOLyKCi4XkFpjvIXsaGauI6GjWa4HOyQAgMTDpcmqjeXEPkW2WyqO77VW+0MSkB8LlnK1q9xubOnKo/gjBWy6R91M1/EM5LnP/Fi11SybJwWpdAFquArRrOjVnWVlv8f26SArgbQhEDqQ2rJw8USeu0+CQfTWwXsDdGJ9BlC0AfoUK+NIf7Lbpfj884uRg8tKLNB5jEQORdf2i7Pde8ssNlGDpRRXqLMLJMqjuHyXY9A30Q8PZhJdQ8BBJqcSziONMQvBE7GeREUc6NOZoHZGYZZQq8VAa06PvVj8b5TO7ePADlbfQ0EIeWl4MYtY2OiCVlzg5hRo8+qOpyveA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vk+LoDeAX1otTJx1KzAoB+Dtew0AWPw+dVIej2+/YdI=;
 b=tqMFfMXJmFsjDtKjN/+H37OuTqUBTvk8GVhH6bQkUapBaE5w2BTY06JjmWKreCvvzkzKeaketGVXNG5kpjtRXaW/YDSlW82inHDNzabhciCjBBdy0vcyi/1UzIJZv4woInHMt5L19eOBq4+6cMYannDryEdDjHtBTkLf4pvBDLE=
Received: from DM6PR04CA0027.namprd04.prod.outlook.com (2603:10b6:5:334::32)
 by DS3PR19MB997190.namprd19.prod.outlook.com (2603:10b6:8:348::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 15:28:51 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:5:334:cafe::18) by DM6PR04CA0027.outlook.office365.com
 (2603:10b6:5:334::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 15:28:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Fri, 6 Mar 2026 15:28:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1D62940654F;
	Fri,  6 Mar 2026 15:28:49 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 02EAF822543;
	Fri,  6 Mar 2026 15:28:49 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v5 4/4] ASoC: cs42l43: Add support for the B variant
Date: Fri,  6 Mar 2026 15:28:11 +0000
Message-ID: <20260306152829.3130530-5-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306152829.3130530-1-mstrozek@opensource.cirrus.com>
References: <20260306152829.3130530-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|DS3PR19MB997190:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5524440d-939a-444b-a6f0-08de7b95118c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|7416014|36860700016|54012099003;
X-Microsoft-Antispam-Message-Info:
	cWFWolFlfKozPPY21lLjvnirVms0Ej5V62ZAKeWkeaX40RiO7IMP8SOzZrHCOvqM5PYAqbTcI9Zf5ulgGgVb64Ppy1CgMJpJ5iQVH0R1ZcLrk4+rjggwXNv2CZzpbZapq1uCJgwxYhZxgA9pvFeVE6bF0HpJYSkPkBTtG2h9gRZ4tz+9NIEuex1PJq/8bkmdGI1wkG5mWaoI631jXwkZcOwlinenQzWjNQX70/ehXNk5ICazNXvuQ57SgcnePuHYi0fvY+9AW68iFAl+XB8iIC7Wv8OZshEJ6cSsV2QfB2Gfa+Z/uGs2bBvikyHGTLaoFGpWsVkS1otmJ8UP0NredX/wiUnwXo+ZEjWnCftcA3s3LdntL3FbXXK9anHlWanfJCURvTixmIR3hCV+13v08hWRXlgxp0FKVxQdg4Hx7vnbk5jnGrtx0jmSirUBafcGie9tB77X01uIvjKu2fXYf4bnsMpJ8h2slRR5vZqhaEi5MfIwSj6nT78WvwDzhpH9dyPj5WJyDHAta6Md5F7BulrQOvb6L0w669ZD3fxiLHrDjBWFPtS4RfDs03bqai7t+CJvWpJ375YvHcOzj3yHQCy05gTuVWTNbjEiE9akdmh1tDJBwt2Wiq/ZRyKoJQ2FIazGz4vzh2tgADj1QF+e3NHa0Fke9Hr/bDNA/X42ZEw58uxF9I3bm8K7ZXKKsBZJULUiHOaHG+egJIk4JR7DnIhdQF17piABbGG6U4wCJvvXcjyQ2lJeqVgWbdTVXDUbnXWvr9Hr3ewufYtW2CdqGA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(7416014)(36860700016)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BUkrYKcnzV0BmFPfsUTKd0qcIM0Wc9btws4ieYWJfPVZalUOpULrliSefLoK9FfSriBrBI20aP2dDvqm5DiZzqHWzfF1+Xxes7436hamIr7G984/Gwa/zzU1TZnD0v1pod2/mcXO783jYSqfVwrhbRo+sYRb0rPogT5SVHrueEHutkRRPnU3OyXSGqjS/U/EofB85zMFanxJN7jTWU8p6reb+IPANUfavG8trl21Uz9EsqfTF7qJZjr+V7qBcIgns2fDN80msSy+fj7fjLPS37hW+wiWv7e3FQyqP+2/bbaCWsoLQJu400QhqDj2Ff05wf/KAV6OI1qeSH1H7/S/y4KqEjrLYs2jF33/ZW+G5gRA7FsSuG/zrhXGq0M+Qns7DCwU7yWvh6sqlYi3jN4GXmsigdPx0MvPtR9oDmNQP3XlVJ55MN5E5ggj1PiawvPz
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 15:28:50.5186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5524440d-939a-444b-a6f0-08de7b95118c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB997190
X-Proofpoint-GUID: Ea8-ZY_saPXAzmy2RTmj2ECL6lEOB9Pv
X-Proofpoint-ORIG-GUID: Ea8-ZY_saPXAzmy2RTmj2ECL6lEOB9Pv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NyBTYWx0ZWRfX/y9eUX6mKDrK
 kpJJe71Bt0OlPG7ucHXpGN5xGFwESw4aXRt76EkbJX8bsfaDbhVxdQ9JExrdVywjzKm1k7iW4+5
 AhfNnQqyd0ZfvX5PMrVKqNuGJ0WSjcI8zEkApjull7eV8rsRN4k+YRqbkOIiRWWteRX7GHdIk3K
 +Rb1RNR3gaZeci7hZ/RExY3nW2kXw6l6gy0rPArBGbnLG5D4XucIulyX5v7+nm474NRkRIusoHz
 kkiO+85C+1hjSColwuKnr67Nh5xhZ8dwG7rxN+JTMFGxQKgaHIiAVs4EaWijvlT7s7PQwcTMGI4
 okOhZh5iSlEPhUD7MmGISjLKy7a4vOxYc3momaE5GgpbE/QP79SfUSMtvFXVOAUN6JmG0zbF7cD
 3Lsa8YCXvOaHF0so4njrCxXRME2WNp/ckfcxRWheNNyLfdIOcT1rjRouH9cwm7P2guIZBieQlKi
 1y5XUubhyemevLYeRqQ==
X-Authority-Analysis: v=2.4 cv=IIwPywvG c=1 sm=1 tr=0 ts=69aaf2b9 cx=c_pps
 a=oh9iHeRiPYGBlS8CzTurag==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=M7tb3-_zZpdRxA06ow8A:9
X-Proofpoint-Spam-Reason: safe

Introducing CS42L43B codec, a variant of CS42L43 which can be driven by
the same driver.

Changes in CS42L43 driver specific for CS42L43B:
- Decimator 1 and 2 are dedicated to ADC, can't be selected for PDM
- Decimators 3 and 4 are connected to PDM1
- Added Decimator 5 and 6 for PDM2
- Supports SoundWire Clock Gearing
- Updated ROM requiring no patching
- Reduced RAM space
- Each ISRC has 4 decimators now

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
Changes in v5:
 - use snd_soc_component_to_dapm instead of snd_soc_component_get_dapm in cs42l43_component_probe
No changes in v3, v4

Changes in v2:
 - Adjustments to variant identification following fixes from v2 mfd patch
---
 sound/soc/codecs/cs42l43.c | 756 ++++++++++++++++++++++++++++++-------
 sound/soc/codecs/cs42l43.h |   4 +-
 2 files changed, 625 insertions(+), 135 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index fd02d8a57e0f2..f0d6ff0b2976b 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -45,12 +45,25 @@ static SOC_VALUE_ENUM_SINGLE_DECL(cs42l43_##name##_enum, reg, \
 static const struct snd_kcontrol_new cs42l43_##name##_mux = \
 		SOC_DAPM_ENUM("Route", cs42l43_##name##_enum)

+#define CS42L43B_DECL_MUX(name, reg) \
+static SOC_VALUE_ENUM_SINGLE_DECL(cs42l43_##name##_enum, reg, \
+				  0, CS42L43_MIXER_SRC_MASK, \
+				  cs42l43b_mixer_texts, cs42l43b_mixer_values); \
+static const struct snd_kcontrol_new cs42l43_##name##_mux = \
+		SOC_DAPM_ENUM("Route", cs42l43_##name##_enum)
+
 #define CS42L43_DECL_MIXER(name, reg) \
 	CS42L43_DECL_MUX(name##_in1, reg); \
 	CS42L43_DECL_MUX(name##_in2, reg + 0x4); \
 	CS42L43_DECL_MUX(name##_in3, reg + 0x8); \
 	CS42L43_DECL_MUX(name##_in4, reg + 0xC)

+#define CS42L43B_DECL_MIXER(name, reg) \
+	CS42L43B_DECL_MUX(name##_in1, reg); \
+	CS42L43B_DECL_MUX(name##_in2, reg + 0x4); \
+	CS42L43B_DECL_MUX(name##_in3, reg + 0x8); \
+	CS42L43B_DECL_MUX(name##_in4, reg + 0xC)
+
 #define CS42L43_DAPM_MUX(name_str, name) \
 	SND_SOC_DAPM_MUX(name_str " Input", SND_SOC_NOPM, 0, 0, &cs42l43_##name##_mux)

@@ -99,11 +112,23 @@ static const struct snd_kcontrol_new cs42l43_##name##_mux = \
 	{ name_str,		"EQ1",			"EQ" }, \
 	{ name_str,		"EQ2",			"EQ" }

+#define CS42L43B_BASE_ROUTES(name_str) \
+	{ name_str,		"Decimator 5",		"Decimator 5" }, \
+	{ name_str,		"Decimator 6",		"Decimator 6" }, \
+	{ name_str,		"ISRC1 DEC3",		"ISRC1DEC3" }, \
+	{ name_str,		"ISRC1 DEC4",		"ISRC1DEC4" }, \
+	{ name_str,		"ISRC2 DEC3",		"ISRC2DEC3" }, \
+	{ name_str,		"ISRC2 DEC4",		"ISRC2DEC4" }
+
 #define CS42L43_MUX_ROUTES(name_str, widget) \
 	{ widget,		NULL,			name_str " Input" }, \
 	{ name_str " Input",	NULL,			"Mixer Core" }, \
 	CS42L43_BASE_ROUTES(name_str " Input")

+#define CS42L43B_MUX_ROUTES(name_str, widget) \
+	CS42L43_MUX_ROUTES(name_str, widget), \
+	CS42L43B_BASE_ROUTES(name_str " Input")
+
 #define CS42L43_MIXER_ROUTES(name_str, widget) \
 	{ name_str " Mixer",	NULL,			name_str " Input 1" }, \
 	{ name_str " Mixer",	NULL,			name_str " Input 2" }, \
@@ -116,6 +141,13 @@ static const struct snd_kcontrol_new cs42l43_##name##_mux = \
 	CS42L43_BASE_ROUTES(name_str " Input 3"), \
 	CS42L43_BASE_ROUTES(name_str " Input 4")

+#define CS42L43B_MIXER_ROUTES(name_str, widget) \
+	CS42L43_MIXER_ROUTES(name_str, widget), \
+	CS42L43B_BASE_ROUTES(name_str " Input 1"), \
+	CS42L43B_BASE_ROUTES(name_str " Input 2"), \
+	CS42L43B_BASE_ROUTES(name_str " Input 3"), \
+	CS42L43B_BASE_ROUTES(name_str " Input 4")
+
 #define CS42L43_MIXER_VOLUMES(name_str, base) \
 	SOC_SINGLE_RANGE_TLV(name_str " Input 1 Volume", base, \
 			     CS42L43_MIXER_VOL_SHIFT, 0x20, 0x50, 0, \
@@ -300,6 +332,7 @@ static int cs42l43_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	struct snd_soc_component *component = dai->component;
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	struct cs42l43 *cs42l43 = priv->core;
+	int ret;
 	int provider = !dai->id || !!regmap_test_bits(cs42l43->regmap,
 						      CS42L43_ASP_CLK_CONFIG2,
 						      CS42L43_ASP_MASTER_MODE_MASK);
@@ -309,6 +342,14 @@ static int cs42l43_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	else
 		priv->constraint.mask = CS42L43_CONSUMER_RATE_MASK;

+	if (cs42l43->variant_id == CS42L43_DEVID_VAL && (dai->id == 3 || dai->id == 4)) {
+		ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+						   SNDRV_PCM_HW_PARAM_CHANNELS,
+						   1, 2);
+		if (ret < 0)
+			return ret;
+	}
+
 	return snd_pcm_hw_constraint_list(substream->runtime, 0,
 					  SNDRV_PCM_HW_PARAM_RATE,
 					  &priv->constraint);
@@ -590,12 +631,25 @@ static int cs42l43_dai_probe(struct snd_soc_dai *dai)
 		"Decimator 2 Switch",
 		"Decimator 3 Switch",
 		"Decimator 4 Switch",
+		"Decimator 5 Switch",
+		"Decimator 6 Switch",
 	};
-	int i;
+	int control_size, i;

 	static_assert(ARRAY_SIZE(controls) == ARRAY_SIZE(priv->kctl));

-	for (i = 0; i < ARRAY_SIZE(controls); i++) {
+	switch (priv->core->variant_id) {
+	case CS42L43_DEVID_VAL:
+		control_size = ARRAY_SIZE(controls) - 2; // ignore Decimator 5 and 6
+		break;
+	case CS42L43B_DEVID_VAL:
+		control_size = ARRAY_SIZE(controls);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	for (i = 0; i < control_size; i++) {
 		if (priv->kctl[i])
 			continue;

@@ -703,7 +757,7 @@ static struct snd_soc_dai_driver cs42l43_dais[] = {
 		.capture = {
 			.stream_name	= "DP3 Capture",
 			.channels_min	= 1,
-			.channels_max	= 2,
+			.channels_max	= 4,
 			.rates		= SNDRV_PCM_RATE_KNOT,
 			.formats	= CS42L43_SDW_FORMATS,
 		},
@@ -715,7 +769,7 @@ static struct snd_soc_dai_driver cs42l43_dais[] = {
 		.capture = {
 			.stream_name	= "DP4 Capture",
 			.channels_min	= 1,
-			.channels_max	= 2,
+			.channels_max	= 4,
 			.rates		= SNDRV_PCM_RATE_KNOT,
 			.formats	= CS42L43_SDW_FORMATS,
 		},
@@ -808,6 +862,10 @@ static SOC_ENUM_SINGLE_DECL(cs42l43_dec3_wnf_corner, CS42L43_DECIM_HPF_WNF_CTRL3
 			    CS42L43_DECIM_WNF_CF_SHIFT, cs42l43_wnf_corner_text);
 static SOC_ENUM_SINGLE_DECL(cs42l43_dec4_wnf_corner, CS42L43_DECIM_HPF_WNF_CTRL4,
 			    CS42L43_DECIM_WNF_CF_SHIFT, cs42l43_wnf_corner_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec5_wnf_corner, CS42L43B_DECIM_HPF_WNF_CTRL5,
+			    CS42L43_DECIM_WNF_CF_SHIFT, cs42l43_wnf_corner_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec6_wnf_corner, CS42L43B_DECIM_HPF_WNF_CTRL6,
+			    CS42L43_DECIM_WNF_CF_SHIFT, cs42l43_wnf_corner_text);

 static const char * const cs42l43_hpf_corner_text[] = {
 	"3Hz", "12Hz", "48Hz", "96Hz",
@@ -821,6 +879,10 @@ static SOC_ENUM_SINGLE_DECL(cs42l43_dec3_hpf_corner, CS42L43_DECIM_HPF_WNF_CTRL3
 			    CS42L43_DECIM_HPF_CF_SHIFT, cs42l43_hpf_corner_text);
 static SOC_ENUM_SINGLE_DECL(cs42l43_dec4_hpf_corner, CS42L43_DECIM_HPF_WNF_CTRL4,
 			    CS42L43_DECIM_HPF_CF_SHIFT, cs42l43_hpf_corner_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec5_hpf_corner, CS42L43B_DECIM_HPF_WNF_CTRL5,
+			    CS42L43_DECIM_HPF_CF_SHIFT, cs42l43_hpf_corner_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec6_hpf_corner, CS42L43B_DECIM_HPF_WNF_CTRL6,
+			    CS42L43_DECIM_HPF_CF_SHIFT, cs42l43_hpf_corner_text);

 static SOC_ENUM_SINGLE_DECL(cs42l43_dec1_ramp_up, CS42L43_DECIM_VOL_CTRL_CH1_CH2,
 			    CS42L43_DECIM1_VI_RAMP_SHIFT, cs42l43_ramp_text);
@@ -839,6 +901,31 @@ static SOC_ENUM_SINGLE_DECL(cs42l43_dec4_ramp_up, CS42L43_DECIM_VOL_CTRL_CH3_CH4
 static SOC_ENUM_SINGLE_DECL(cs42l43_dec4_ramp_down, CS42L43_DECIM_VOL_CTRL_CH3_CH4,
 			    CS42L43_DECIM4_VD_RAMP_SHIFT, cs42l43_ramp_text);

+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec1_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+			    CS42L43_DECIM1_VI_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec1_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+			    CS42L43_DECIM1_VD_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec2_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+			    CS42L43_DECIM2_VI_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec2_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+			    CS42L43_DECIM2_VD_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec3_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+			    CS42L43_DECIM3_VI_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec3_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+			    CS42L43_DECIM3_VD_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec4_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+			    CS42L43_DECIM4_VI_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec4_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+			    CS42L43_DECIM4_VD_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec5_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+			    CS42L43B_DECIM5_PATH1_VOL_RISE_RATE_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec5_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+			    CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec6_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+			    CS42L43B_DECIM6_PATH1_VOL_RISE_RATE_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec6_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+			    CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_SHIFT, cs42l43_ramp_text);
+
 static DECLARE_TLV_DB_SCALE(cs42l43_speaker_tlv, -6400, 50, 0);

 static SOC_ENUM_SINGLE_DECL(cs42l43_speaker_ramp_up, CS42L43_AMP1_2_VOL_RAMP,
@@ -898,6 +985,37 @@ static const unsigned int cs42l43_mixer_values[] = {
 	0x58, 0x59, // EQ1, 2
 };

+static const char * const cs42l43b_mixer_texts[] = {
+	"None",
+	"Tone Generator 1", "Tone Generator 2",
+	"Decimator 1", "Decimator 2", "Decimator 3", "Decimator 4", "Decimator 5", "Decimator 6",
+	"ASPRX1", "ASPRX2", "ASPRX3", "ASPRX4", "ASPRX5", "ASPRX6",
+	"DP5RX1", "DP5RX2", "DP6RX1", "DP6RX2", "DP7RX1", "DP7RX2",
+	"ASRC INT1", "ASRC INT2", "ASRC INT3", "ASRC INT4",
+	"ASRC DEC1", "ASRC DEC2", "ASRC DEC3", "ASRC DEC4",
+	"ISRC1 INT1", "ISRC1 INT2",
+	"ISRC1 DEC1", "ISRC1 DEC2", "ISRC1 DEC3", "ISRC1 DEC4",
+	"ISRC2 INT1", "ISRC2 INT2",
+	"ISRC2 DEC1", "ISRC2 DEC2", "ISRC2 DEC3", "ISRC2 DEC4",
+	"EQ1", "EQ2",
+};
+
+static const unsigned int cs42l43b_mixer_values[] = {
+	0x00, // None
+	0x04, 0x05, // Tone Generator 1, 2
+	0x10, 0x11, 0x80, 0x81, 0x12, 0x13, // Decimator 1, 2, 3, 4, 5, 6
+	0x20, 0x21, 0x22, 0x23, 0x24, 0x25, // ASPRX1,2,3,4,5,6
+	0x28, 0x29, 0x2A, 0x2B, 0x2C, 0x2D, // DP5, 6, 7RX1, 2
+	0x40, 0x41, 0x42, 0x43, // ASRC INT1, 2, 3, 4
+	0x44, 0x45, 0x46, 0x47, // ASRC DEC1, 2, 3, 4
+	0x50, 0x51, // ISRC1 INT1, 2
+	0x52, 0x53, 0x78, 0x79, // ISRC1 DEC1, 2, 3, 4
+	0x54, 0x55, // ISRC2 INT1, 2
+	0x56, 0x57, 0x7A, 0x7B, // ISRC2 DEC1, 2, 3, 4
+	0x58, 0x59, // EQ1, 2
+};
+
+/* A variant */
 CS42L43_DECL_MUX(asptx1, CS42L43_ASPTX1_INPUT);
 CS42L43_DECL_MUX(asptx2, CS42L43_ASPTX2_INPUT);
 CS42L43_DECL_MUX(asptx3, CS42L43_ASPTX3_INPUT);
@@ -946,6 +1064,63 @@ CS42L43_DECL_MIXER(amp2, CS42L43_AMP2MIX_INPUT1);
 CS42L43_DECL_MIXER(amp3, CS42L43_AMP3MIX_INPUT1);
 CS42L43_DECL_MIXER(amp4, CS42L43_AMP4MIX_INPUT1);

+/* B variant */
+CS42L43B_DECL_MUX(b_asptx1, CS42L43_ASPTX1_INPUT);
+CS42L43B_DECL_MUX(b_asptx2, CS42L43_ASPTX2_INPUT);
+CS42L43B_DECL_MUX(b_asptx3, CS42L43_ASPTX3_INPUT);
+CS42L43B_DECL_MUX(b_asptx4, CS42L43_ASPTX4_INPUT);
+CS42L43B_DECL_MUX(b_asptx5, CS42L43_ASPTX5_INPUT);
+CS42L43B_DECL_MUX(b_asptx6, CS42L43_ASPTX6_INPUT);
+
+CS42L43B_DECL_MUX(b_dp1tx1, CS42L43_SWIRE_DP1_CH1_INPUT);
+CS42L43B_DECL_MUX(b_dp1tx2, CS42L43_SWIRE_DP1_CH2_INPUT);
+CS42L43B_DECL_MUX(b_dp1tx3, CS42L43_SWIRE_DP1_CH3_INPUT);
+CS42L43B_DECL_MUX(b_dp1tx4, CS42L43_SWIRE_DP1_CH4_INPUT);
+CS42L43B_DECL_MUX(b_dp2tx1, CS42L43_SWIRE_DP2_CH1_INPUT);
+CS42L43B_DECL_MUX(b_dp2tx2, CS42L43_SWIRE_DP2_CH2_INPUT);
+CS42L43B_DECL_MUX(b_dp3tx1, CS42L43_SWIRE_DP3_CH1_INPUT);
+CS42L43B_DECL_MUX(b_dp3tx2, CS42L43_SWIRE_DP3_CH2_INPUT);
+CS42L43B_DECL_MUX(b_dp3tx3, CS42L43B_SWIRE_DP3_CH3_INPUT);
+CS42L43B_DECL_MUX(b_dp3tx4, CS42L43B_SWIRE_DP3_CH4_INPUT);
+CS42L43B_DECL_MUX(b_dp4tx1, CS42L43_SWIRE_DP4_CH1_INPUT);
+CS42L43B_DECL_MUX(b_dp4tx2, CS42L43_SWIRE_DP4_CH2_INPUT);
+CS42L43B_DECL_MUX(b_dp4tx3, CS42L43B_SWIRE_DP4_CH3_INPUT);
+CS42L43B_DECL_MUX(b_dp4tx4, CS42L43B_SWIRE_DP4_CH4_INPUT);
+
+CS42L43B_DECL_MUX(b_asrcint1, CS42L43_ASRC_INT1_INPUT1);
+CS42L43B_DECL_MUX(b_asrcint2, CS42L43_ASRC_INT2_INPUT1);
+CS42L43B_DECL_MUX(b_asrcint3, CS42L43_ASRC_INT3_INPUT1);
+CS42L43B_DECL_MUX(b_asrcint4, CS42L43_ASRC_INT4_INPUT1);
+CS42L43B_DECL_MUX(b_asrcdec1, CS42L43_ASRC_DEC1_INPUT1);
+CS42L43B_DECL_MUX(b_asrcdec2, CS42L43_ASRC_DEC2_INPUT1);
+CS42L43B_DECL_MUX(b_asrcdec3, CS42L43_ASRC_DEC3_INPUT1);
+CS42L43B_DECL_MUX(b_asrcdec4, CS42L43_ASRC_DEC4_INPUT1);
+
+CS42L43B_DECL_MUX(b_isrc1int1, CS42L43_ISRC1INT1_INPUT1);
+CS42L43B_DECL_MUX(b_isrc1int2, CS42L43_ISRC1INT2_INPUT1);
+CS42L43B_DECL_MUX(b_isrc1dec1, CS42L43_ISRC1DEC1_INPUT1);
+CS42L43B_DECL_MUX(b_isrc1dec2, CS42L43_ISRC1DEC2_INPUT1);
+CS42L43B_DECL_MUX(b_isrc1dec3, CS42L43B_ISRC1DEC3_INPUT1);
+CS42L43B_DECL_MUX(b_isrc1dec4, CS42L43B_ISRC1DEC4_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2int1, CS42L43_ISRC2INT1_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2int2, CS42L43_ISRC2INT2_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2dec1, CS42L43_ISRC2DEC1_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2dec2, CS42L43_ISRC2DEC2_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2dec3, CS42L43B_ISRC2DEC3_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2dec4, CS42L43B_ISRC2DEC4_INPUT1);
+
+CS42L43B_DECL_MUX(b_spdif1, CS42L43_SPDIF1_INPUT1);
+CS42L43B_DECL_MUX(b_spdif2, CS42L43_SPDIF2_INPUT1);
+
+CS42L43B_DECL_MIXER(b_eq1, CS42L43_EQ1MIX_INPUT1);
+CS42L43B_DECL_MIXER(b_eq2, CS42L43_EQ2MIX_INPUT1);
+
+CS42L43B_DECL_MIXER(b_amp1, CS42L43_AMP1MIX_INPUT1);
+CS42L43B_DECL_MIXER(b_amp2, CS42L43_AMP2MIX_INPUT1);
+
+CS42L43B_DECL_MIXER(b_amp3, CS42L43_AMP3MIX_INPUT1);
+CS42L43B_DECL_MIXER(b_amp4, CS42L43_AMP4MIX_INPUT1);
+
 static int cs42l43_dapm_get_volsw(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
@@ -1174,44 +1349,6 @@ static const struct snd_kcontrol_new cs42l43_controls[] = {
 	SOC_ENUM("Decimator 3 HPF Corner Frequency", cs42l43_dec3_hpf_corner),
 	SOC_ENUM("Decimator 4 HPF Corner Frequency", cs42l43_dec4_hpf_corner),

-	SOC_SINGLE_TLV("Decimator 1 Volume", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
-		       CS42L43_DECIM1_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
-	SOC_SINGLE_EXT("Decimator 1 Switch", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
-		       CS42L43_DECIM1_MUTE_SHIFT, 1, 1,
-		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
-	SOC_SINGLE_TLV("Decimator 2 Volume", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
-		       CS42L43_DECIM2_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
-	SOC_SINGLE_EXT("Decimator 2 Switch", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
-		       CS42L43_DECIM2_MUTE_SHIFT, 1, 1,
-		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
-	SOC_SINGLE_TLV("Decimator 3 Volume", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
-		       CS42L43_DECIM3_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
-	SOC_SINGLE_EXT("Decimator 3 Switch", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
-		       CS42L43_DECIM3_MUTE_SHIFT, 1, 1,
-		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
-	SOC_SINGLE_TLV("Decimator 4 Volume", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
-		       CS42L43_DECIM4_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
-	SOC_SINGLE_EXT("Decimator 4 Switch", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
-		       CS42L43_DECIM4_MUTE_SHIFT, 1, 1,
-		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
-
-	SOC_ENUM_EXT("Decimator 1 Ramp Up", cs42l43_dec1_ramp_up,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 1 Ramp Down", cs42l43_dec1_ramp_down,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 2 Ramp Up", cs42l43_dec2_ramp_up,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 2 Ramp Down", cs42l43_dec2_ramp_down,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 3 Ramp Up", cs42l43_dec3_ramp_up,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 3 Ramp Down", cs42l43_dec3_ramp_down,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 4 Ramp Up", cs42l43_dec4_ramp_up,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 4 Ramp Down", cs42l43_dec4_ramp_down,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-
 	SOC_DOUBLE_R_EXT("Speaker Digital Switch",
 			 CS42L43_INTP_VOLUME_CTRL1, CS42L43_INTP_VOLUME_CTRL2,
 			 CS42L43_AMP_MUTE_SHIFT, 1, 1,
@@ -1601,35 +1738,81 @@ static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 	unsigned int *val;
 	int ret;

-	switch (w->shift) {
-	case CS42L43_ADC1_EN_SHIFT:
-	case CS42L43_PDM1_DIN_L_EN_SHIFT:
-		reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
-		ramp = CS42L43_DECIM1_VD_RAMP_MASK;
-		mute = CS42L43_DECIM1_MUTE_MASK;
-		val = &priv->decim_cache[0];
-		break;
-	case CS42L43_ADC2_EN_SHIFT:
-	case CS42L43_PDM1_DIN_R_EN_SHIFT:
-		reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
-		ramp = CS42L43_DECIM2_VD_RAMP_MASK;
-		mute = CS42L43_DECIM2_MUTE_MASK;
-		val = &priv->decim_cache[1];
-		break;
-	case CS42L43_PDM2_DIN_L_EN_SHIFT:
-		reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
-		ramp  = CS42L43_DECIM3_VD_RAMP_MASK;
-		mute = CS42L43_DECIM3_MUTE_MASK;
-		val = &priv->decim_cache[2];
-		break;
-	case CS42L43_PDM2_DIN_R_EN_SHIFT:
-		reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
-		ramp = CS42L43_DECIM4_VD_RAMP_MASK;
-		mute = CS42L43_DECIM4_MUTE_MASK;
-		val = &priv->decim_cache[3];
-		break;
-	default:
-		dev_err(priv->dev, "Invalid microphone shift: %d\n", w->shift);
+	if (cs42l43->variant_id == CS42L43_DEVID_VAL) {
+		switch (w->shift) {
+		case CS42L43_ADC1_EN_SHIFT:
+		case CS42L43_PDM1_DIN_L_EN_SHIFT:
+			reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
+			ramp = CS42L43_DECIM1_VD_RAMP_MASK;
+			mute = CS42L43_DECIM1_MUTE_MASK;
+			val = &priv->decim_cache[0];
+			break;
+		case CS42L43_ADC2_EN_SHIFT:
+		case CS42L43_PDM1_DIN_R_EN_SHIFT:
+			reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
+			ramp = CS42L43_DECIM2_VD_RAMP_MASK;
+			mute = CS42L43_DECIM2_MUTE_MASK;
+			val = &priv->decim_cache[1];
+			break;
+		case CS42L43_PDM2_DIN_L_EN_SHIFT:
+			reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
+			ramp  = CS42L43_DECIM3_VD_RAMP_MASK;
+			mute = CS42L43_DECIM3_MUTE_MASK;
+			val = &priv->decim_cache[2];
+			break;
+		case CS42L43_PDM2_DIN_R_EN_SHIFT:
+			reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
+			ramp = CS42L43_DECIM4_VD_RAMP_MASK;
+			mute = CS42L43_DECIM4_MUTE_MASK;
+			val = &priv->decim_cache[3];
+			break;
+		default:
+			dev_err(priv->dev, "Invalid microphone shift: %d\n", w->shift);
+			return -EINVAL;
+		}
+	} else if (cs42l43->variant_id == CS42L43B_DEVID_VAL) {
+		switch (w->shift) {
+		case CS42L43_ADC1_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2;
+			ramp = CS42L43_DECIM1_VD_RAMP_MASK;
+			mute = CS42L43_DECIM1_MUTE_MASK;
+			val = &priv->decim_cache[0];
+			break;
+		case CS42L43_ADC2_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2;
+			ramp = CS42L43_DECIM2_VD_RAMP_MASK;
+			mute = CS42L43_DECIM2_MUTE_MASK;
+			val = &priv->decim_cache[1];
+			break;
+		case CS42L43_PDM1_DIN_L_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4;
+			ramp  = CS42L43_DECIM3_VD_RAMP_MASK;
+			mute = CS42L43_DECIM3_MUTE_MASK;
+			val = &priv->decim_cache[2];
+			break;
+		case CS42L43_PDM1_DIN_R_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4;
+			ramp = CS42L43_DECIM4_VD_RAMP_MASK;
+			mute = CS42L43_DECIM4_MUTE_MASK;
+			val = &priv->decim_cache[3];
+			break;
+		case CS42L43_PDM2_DIN_L_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6;
+			ramp  = CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK;
+			mute = CS42L43B_DECIM5_MUTE_MASK;
+			val = &priv->decim_cache[4];
+			break;
+		case CS42L43_PDM2_DIN_R_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6;
+			ramp = CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK;
+			mute = CS42L43B_DECIM6_MUTE_MASK;
+			val = &priv->decim_cache[5];
+			break;
+		default:
+			dev_err(priv->dev, "Invalid microphone shift: %d\n", w->shift);
+			return -EINVAL;
+		}
+	} else {
 		return -EINVAL;
 	}

@@ -1722,11 +1905,6 @@ static const struct snd_soc_dapm_widget cs42l43_widgets[] = {
 			   0, NULL, 0, cs42l43_mic_ev,
 			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),

-	SND_SOC_DAPM_MUX("Decimator 1 Mode", SND_SOC_NOPM, 0, 0,
-			 &cs42l43_dec_mode_ctl[0]),
-	SND_SOC_DAPM_MUX("Decimator 2 Mode", SND_SOC_NOPM, 0, 0,
-			 &cs42l43_dec_mode_ctl[1]),
-
 	SND_SOC_DAPM_PGA("Decimator 1", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("Decimator 2", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("Decimator 3", SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -1871,53 +2049,6 @@ static const struct snd_soc_dapm_widget cs42l43_widgets[] = {

 	SND_SOC_DAPM_SUPPLY("Mixer Core", CS42L43_BLOCK_EN6, CS42L43_MIXER_EN_SHIFT,
 			    0, NULL, 0),
-	CS42L43_DAPM_MUX("ASPTX1", asptx1),
-	CS42L43_DAPM_MUX("ASPTX2", asptx2),
-	CS42L43_DAPM_MUX("ASPTX3", asptx3),
-	CS42L43_DAPM_MUX("ASPTX4", asptx4),
-	CS42L43_DAPM_MUX("ASPTX5", asptx5),
-	CS42L43_DAPM_MUX("ASPTX6", asptx6),
-
-	CS42L43_DAPM_MUX("DP1TX1", dp1tx1),
-	CS42L43_DAPM_MUX("DP1TX2", dp1tx2),
-	CS42L43_DAPM_MUX("DP1TX3", dp1tx3),
-	CS42L43_DAPM_MUX("DP1TX4", dp1tx4),
-	CS42L43_DAPM_MUX("DP2TX1", dp2tx1),
-	CS42L43_DAPM_MUX("DP2TX2", dp2tx2),
-	CS42L43_DAPM_MUX("DP3TX1", dp3tx1),
-	CS42L43_DAPM_MUX("DP3TX2", dp3tx2),
-	CS42L43_DAPM_MUX("DP4TX1", dp4tx1),
-	CS42L43_DAPM_MUX("DP4TX2", dp4tx2),
-
-	CS42L43_DAPM_MUX("ASRC INT1", asrcint1),
-	CS42L43_DAPM_MUX("ASRC INT2", asrcint2),
-	CS42L43_DAPM_MUX("ASRC INT3", asrcint3),
-	CS42L43_DAPM_MUX("ASRC INT4", asrcint4),
-	CS42L43_DAPM_MUX("ASRC DEC1", asrcdec1),
-	CS42L43_DAPM_MUX("ASRC DEC2", asrcdec2),
-	CS42L43_DAPM_MUX("ASRC DEC3", asrcdec3),
-	CS42L43_DAPM_MUX("ASRC DEC4", asrcdec4),
-
-	CS42L43_DAPM_MUX("ISRC1INT1", isrc1int1),
-	CS42L43_DAPM_MUX("ISRC1INT2", isrc1int2),
-	CS42L43_DAPM_MUX("ISRC1DEC1", isrc1dec1),
-	CS42L43_DAPM_MUX("ISRC1DEC2", isrc1dec2),
-	CS42L43_DAPM_MUX("ISRC2INT1", isrc2int1),
-	CS42L43_DAPM_MUX("ISRC2INT2", isrc2int2),
-	CS42L43_DAPM_MUX("ISRC2DEC1", isrc2dec1),
-	CS42L43_DAPM_MUX("ISRC2DEC2", isrc2dec2),
-
-	CS42L43_DAPM_MUX("SPDIF1", spdif1),
-	CS42L43_DAPM_MUX("SPDIF2", spdif2),
-
-	CS42L43_DAPM_MIXER("EQ1", eq1),
-	CS42L43_DAPM_MIXER("EQ2", eq2),
-
-	CS42L43_DAPM_MIXER("Speaker L", amp1),
-	CS42L43_DAPM_MIXER("Speaker R", amp2),
-
-	CS42L43_DAPM_MIXER("Headphone L", amp3),
-	CS42L43_DAPM_MIXER("Headphone R", amp4),
 };

 static const struct snd_soc_dapm_route cs42l43_routes[] = {
@@ -1963,16 +2094,6 @@ static const struct snd_soc_dapm_route cs42l43_routes[] = {
 	{ "PDM2L",		NULL,	"PDM2_DIN" },
 	{ "PDM2R",		NULL,	"PDM2_DIN" },

-	{ "Decimator 1 Mode",	"PDM",	"PDM1L" },
-	{ "Decimator 1 Mode",	"ADC",	"ADC1" },
-	{ "Decimator 2 Mode",	"PDM",	"PDM1R" },
-	{ "Decimator 2 Mode",	"ADC",	"ADC2" },
-
-	{ "Decimator 1",	NULL,	"Decimator 1 Mode" },
-	{ "Decimator 2",	NULL,	"Decimator 2 Mode" },
-	{ "Decimator 3",	NULL,	"PDM2L" },
-	{ "Decimator 4",	NULL,	"PDM2R" },
-
 	{ "ASP Capture",	NULL,	"ASPTX1" },
 	{ "ASP Capture",	NULL,	"ASPTX2" },
 	{ "ASP Capture",	NULL,	"ASPTX3" },
@@ -2060,6 +2181,261 @@ static const struct snd_soc_dapm_route cs42l43_routes[] = {
 	{ "ASRC_DEC4",		NULL,	"ASRC_DEC" },

 	{ "EQ",			NULL,	"EQ Clock" },
+};
+
+static const struct snd_kcontrol_new cs42l43_a_controls[] = {
+	SOC_ENUM_EXT("Decimator 1 Ramp Up", cs42l43_dec1_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 1 Ramp Down", cs42l43_dec1_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 2 Ramp Up", cs42l43_dec2_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 2 Ramp Down", cs42l43_dec2_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 3 Ramp Up", cs42l43_dec3_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 3 Ramp Down", cs42l43_dec3_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 4 Ramp Up", cs42l43_dec4_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 4 Ramp Down", cs42l43_dec4_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+
+	SOC_SINGLE_TLV("Decimator 1 Volume", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM1_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 1 Switch", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM1_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 2 Volume", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM2_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 2 Switch", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM2_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 3 Volume", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM3_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 3 Switch", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM3_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 4 Volume", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM4_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 4 Switch", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM4_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+};
+
+static const struct snd_kcontrol_new cs42l43_b_controls[] = {
+	SOC_SINGLE_TLV("Decimator 1 Volume", CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM1_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 1 Switch", CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM1_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 2 Volume", CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM2_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 2 Switch", CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM2_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 3 Volume", CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM3_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 3 Switch", CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM3_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 4 Volume", CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM4_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 4 Switch", CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM4_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 5 Volume", CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		       CS42L43B_DECIM5_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 5 Switch", CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		       CS42L43B_DECIM5_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 6 Volume", CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		       CS42L43B_DECIM6_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 6 Switch", CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		       CS42L43B_DECIM6_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+
+	SOC_ENUM_EXT("Decimator 1 Ramp Up", cs42l43b_dec1_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 1 Ramp Down", cs42l43b_dec1_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 2 Ramp Up", cs42l43b_dec2_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 2 Ramp Down", cs42l43b_dec2_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 3 Ramp Up", cs42l43b_dec3_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 3 Ramp Down", cs42l43b_dec3_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 4 Ramp Up", cs42l43b_dec4_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 4 Ramp Down", cs42l43b_dec4_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 5 Ramp Up", cs42l43b_dec5_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 5 Ramp Down", cs42l43b_dec5_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 6 Ramp Up", cs42l43b_dec6_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 6 Ramp Down", cs42l43b_dec6_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+
+	SOC_SINGLE("Decimator 5 WNF Switch", CS42L43B_DECIM_HPF_WNF_CTRL5,
+		   CS42L43_DECIM_WNF_EN_SHIFT, 1, 0),
+	SOC_SINGLE("Decimator 6 WNF Switch", CS42L43B_DECIM_HPF_WNF_CTRL6,
+		   CS42L43_DECIM_WNF_EN_SHIFT, 1, 0),
+
+	SOC_ENUM("Decimator 5 WNF Corner Frequency", cs42l43b_dec5_wnf_corner),
+	SOC_ENUM("Decimator 6 WNF Corner Frequency", cs42l43b_dec6_wnf_corner),
+
+	SOC_SINGLE("Decimator 5 HPF Switch", CS42L43B_DECIM_HPF_WNF_CTRL5,
+		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
+	SOC_SINGLE("Decimator 6 HPF Switch", CS42L43B_DECIM_HPF_WNF_CTRL6,
+		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
+
+	SOC_ENUM("Decimator 5 HPF Corner Frequency", cs42l43b_dec5_hpf_corner),
+	SOC_ENUM("Decimator 6 HPF Corner Frequency", cs42l43b_dec6_hpf_corner),
+};
+
+static const struct snd_soc_dapm_widget cs42l43_a_widgets[] = {
+	SND_SOC_DAPM_MUX("Decimator 1 Mode", SND_SOC_NOPM, 0, 0,
+			 &cs42l43_dec_mode_ctl[0]),
+	SND_SOC_DAPM_MUX("Decimator 2 Mode", SND_SOC_NOPM, 0, 0,
+			 &cs42l43_dec_mode_ctl[1]),
+	CS42L43_DAPM_MUX("ASPTX1", asptx1),
+	CS42L43_DAPM_MUX("ASPTX2", asptx2),
+	CS42L43_DAPM_MUX("ASPTX3", asptx3),
+	CS42L43_DAPM_MUX("ASPTX4", asptx4),
+	CS42L43_DAPM_MUX("ASPTX5", asptx5),
+	CS42L43_DAPM_MUX("ASPTX6", asptx6),
+
+	CS42L43_DAPM_MUX("DP1TX1", dp1tx1),
+	CS42L43_DAPM_MUX("DP1TX2", dp1tx2),
+	CS42L43_DAPM_MUX("DP1TX3", dp1tx3),
+	CS42L43_DAPM_MUX("DP1TX4", dp1tx4),
+	CS42L43_DAPM_MUX("DP2TX1", dp2tx1),
+	CS42L43_DAPM_MUX("DP2TX2", dp2tx2),
+	CS42L43_DAPM_MUX("DP3TX1", dp3tx1),
+	CS42L43_DAPM_MUX("DP3TX2", dp3tx2),
+	CS42L43_DAPM_MUX("DP4TX1", dp4tx1),
+	CS42L43_DAPM_MUX("DP4TX2", dp4tx2),
+
+	CS42L43_DAPM_MUX("ASRC INT1", asrcint1),
+	CS42L43_DAPM_MUX("ASRC INT2", asrcint2),
+	CS42L43_DAPM_MUX("ASRC INT3", asrcint3),
+	CS42L43_DAPM_MUX("ASRC INT4", asrcint4),
+	CS42L43_DAPM_MUX("ASRC DEC1", asrcdec1),
+	CS42L43_DAPM_MUX("ASRC DEC2", asrcdec2),
+	CS42L43_DAPM_MUX("ASRC DEC3", asrcdec3),
+	CS42L43_DAPM_MUX("ASRC DEC4", asrcdec4),
+
+	CS42L43_DAPM_MUX("ISRC1INT1", isrc1int1),
+	CS42L43_DAPM_MUX("ISRC1INT2", isrc1int2),
+	CS42L43_DAPM_MUX("ISRC1DEC1", isrc1dec1),
+	CS42L43_DAPM_MUX("ISRC1DEC2", isrc1dec2),
+	CS42L43_DAPM_MUX("ISRC2INT1", isrc2int1),
+	CS42L43_DAPM_MUX("ISRC2INT2", isrc2int2),
+	CS42L43_DAPM_MUX("ISRC2DEC1", isrc2dec1),
+	CS42L43_DAPM_MUX("ISRC2DEC2", isrc2dec2),
+
+	CS42L43_DAPM_MUX("SPDIF1", spdif1),
+	CS42L43_DAPM_MUX("SPDIF2", spdif2),
+
+	CS42L43_DAPM_MIXER("EQ1", eq1),
+	CS42L43_DAPM_MIXER("EQ2", eq2),
+
+	CS42L43_DAPM_MIXER("Speaker L", amp1),
+	CS42L43_DAPM_MIXER("Speaker R", amp2),
+
+	CS42L43_DAPM_MIXER("Headphone L", amp3),
+	CS42L43_DAPM_MIXER("Headphone R", amp4),
+};
+
+static const struct snd_soc_dapm_widget cs42l43_b_widgets[] = {
+	SND_SOC_DAPM_AIF_OUT("DP3TX3", NULL, 2, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DP3TX4", NULL, 3, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DP4TX3", NULL, 2, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DP4TX4", NULL, 3, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_PGA("Decimator 5", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("Decimator 6", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_PGA("ISRC1DEC3", CS42L43_ISRC1_CTRL,
+			 CS42L43B_ISRC_DEC3_EN_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("ISRC1DEC4", CS42L43_ISRC1_CTRL,
+			 CS42L43B_ISRC_DEC4_EN_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("ISRC2DEC3", CS42L43_ISRC2_CTRL,
+			 CS42L43B_ISRC_DEC3_EN_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("ISRC2DEC4", CS42L43_ISRC2_CTRL,
+			 CS42L43B_ISRC_DEC4_EN_SHIFT, 0, NULL, 0),
+
+	CS42L43_DAPM_MUX("ASPTX1", b_asptx1),
+	CS42L43_DAPM_MUX("ASPTX2", b_asptx2),
+	CS42L43_DAPM_MUX("ASPTX3", b_asptx3),
+	CS42L43_DAPM_MUX("ASPTX4", b_asptx4),
+	CS42L43_DAPM_MUX("ASPTX5", b_asptx5),
+	CS42L43_DAPM_MUX("ASPTX6", b_asptx6),
+
+	CS42L43_DAPM_MUX("DP1TX1", b_dp1tx1),
+	CS42L43_DAPM_MUX("DP1TX2", b_dp1tx2),
+	CS42L43_DAPM_MUX("DP1TX3", b_dp1tx3),
+	CS42L43_DAPM_MUX("DP1TX4", b_dp1tx4),
+	CS42L43_DAPM_MUX("DP2TX1", b_dp2tx1),
+	CS42L43_DAPM_MUX("DP2TX2", b_dp2tx2),
+	CS42L43_DAPM_MUX("DP3TX1", b_dp3tx1),
+	CS42L43_DAPM_MUX("DP3TX2", b_dp3tx2),
+	CS42L43_DAPM_MUX("DP3TX3", b_dp3tx3),
+	CS42L43_DAPM_MUX("DP3TX4", b_dp3tx4),
+	CS42L43_DAPM_MUX("DP4TX1", b_dp4tx1),
+	CS42L43_DAPM_MUX("DP4TX2", b_dp4tx2),
+	CS42L43_DAPM_MUX("DP4TX3", b_dp4tx3),
+	CS42L43_DAPM_MUX("DP4TX4", b_dp4tx4),
+
+	CS42L43_DAPM_MUX("ASRC INT1", b_asrcint1),
+	CS42L43_DAPM_MUX("ASRC INT2", b_asrcint2),
+	CS42L43_DAPM_MUX("ASRC INT3", b_asrcint3),
+	CS42L43_DAPM_MUX("ASRC INT4", b_asrcint4),
+	CS42L43_DAPM_MUX("ASRC DEC1", b_asrcdec1),
+	CS42L43_DAPM_MUX("ASRC DEC2", b_asrcdec2),
+	CS42L43_DAPM_MUX("ASRC DEC3", b_asrcdec3),
+	CS42L43_DAPM_MUX("ASRC DEC4", b_asrcdec4),
+
+	CS42L43_DAPM_MUX("ISRC1INT1", b_isrc1int1),
+	CS42L43_DAPM_MUX("ISRC1INT2", b_isrc1int2),
+	CS42L43_DAPM_MUX("ISRC1DEC1", b_isrc1dec1),
+	CS42L43_DAPM_MUX("ISRC1DEC2", b_isrc1dec2),
+	CS42L43_DAPM_MUX("ISRC1DEC3", b_isrc1dec3),
+	CS42L43_DAPM_MUX("ISRC1DEC4", b_isrc1dec4),
+	CS42L43_DAPM_MUX("ISRC2INT1", b_isrc2int1),
+	CS42L43_DAPM_MUX("ISRC2INT2", b_isrc2int2),
+	CS42L43_DAPM_MUX("ISRC2DEC1", b_isrc2dec1),
+	CS42L43_DAPM_MUX("ISRC2DEC2", b_isrc2dec2),
+	CS42L43_DAPM_MUX("ISRC2DEC3", b_isrc2dec3),
+	CS42L43_DAPM_MUX("ISRC2DEC4", b_isrc2dec4),
+
+	CS42L43_DAPM_MUX("SPDIF1", b_spdif1),
+	CS42L43_DAPM_MUX("SPDIF2", b_spdif2),
+
+	CS42L43_DAPM_MIXER("EQ1", b_eq1),
+	CS42L43_DAPM_MIXER("EQ2", b_eq2),
+
+	CS42L43_DAPM_MIXER("Speaker L", b_amp1),
+	CS42L43_DAPM_MIXER("Speaker R", b_amp2),
+
+	CS42L43_DAPM_MIXER("Headphone L", b_amp3),
+	CS42L43_DAPM_MIXER("Headphone R", b_amp4),
+};
+
+static const struct snd_soc_dapm_route cs42l43_a_routes[] = {
+	{ "Decimator 1 Mode",	"PDM",	"PDM1L" },
+	{ "Decimator 1 Mode",	"ADC",	"ADC1" },
+	{ "Decimator 2 Mode",	"PDM",	"PDM1R" },
+	{ "Decimator 2 Mode",	"ADC",	"ADC2" },
+
+	{ "Decimator 1",	NULL,	"Decimator 1 Mode" },
+	{ "Decimator 2",	NULL,	"Decimator 2 Mode" },
+	{ "Decimator 3",	NULL,	"PDM2L" },
+	{ "Decimator 4",	NULL,	"PDM2R" },

 	CS42L43_MUX_ROUTES("ASPTX1", "ASPTX1"),
 	CS42L43_MUX_ROUTES("ASPTX2", "ASPTX2"),
@@ -2110,6 +2486,81 @@ static const struct snd_soc_dapm_route cs42l43_routes[] = {
 	CS42L43_MIXER_ROUTES("Headphone R", "HP"),
 };

+static const struct snd_soc_dapm_route cs42l43_b_routes[] = {
+	{ "Decimator 1",	NULL,	"ADC1" },
+	{ "Decimator 2",	NULL,	"ADC2" },
+	{ "Decimator 3",	NULL,	"PDM1L" },
+	{ "Decimator 4",	NULL,	"PDM1R" },
+	{ "Decimator 5",	NULL,	"PDM2L" },
+	{ "Decimator 6",	NULL,	"PDM2R" },
+
+	{ "DP3 Capture",	NULL, "DP3TX3" },
+	{ "DP3 Capture",	NULL, "DP3TX4" },
+	{ "DP4 Capture",	NULL, "DP4TX3" },
+	{ "DP4 Capture",	NULL, "DP4TX4" },
+
+	{ "ISRC1DEC3",		NULL,	"ISRC1" },
+	{ "ISRC1DEC4",		NULL,	"ISRC1" },
+	{ "ISRC2DEC3",		NULL,	"ISRC2" },
+	{ "ISRC2DEC4",		NULL,	"ISRC2" },
+
+	CS42L43B_MUX_ROUTES("ASPTX1", "ASPTX1"),
+	CS42L43B_MUX_ROUTES("ASPTX2", "ASPTX2"),
+	CS42L43B_MUX_ROUTES("ASPTX3", "ASPTX3"),
+	CS42L43B_MUX_ROUTES("ASPTX4", "ASPTX4"),
+	CS42L43B_MUX_ROUTES("ASPTX5", "ASPTX5"),
+	CS42L43B_MUX_ROUTES("ASPTX6", "ASPTX6"),
+
+	CS42L43B_MUX_ROUTES("DP1TX1", "DP1TX1"),
+	CS42L43B_MUX_ROUTES("DP1TX2", "DP1TX2"),
+	CS42L43B_MUX_ROUTES("DP1TX3", "DP1TX3"),
+	CS42L43B_MUX_ROUTES("DP1TX4", "DP1TX4"),
+	CS42L43B_MUX_ROUTES("DP2TX1", "DP2TX1"),
+	CS42L43B_MUX_ROUTES("DP2TX2", "DP2TX2"),
+	CS42L43B_MUX_ROUTES("DP3TX1", "DP3TX1"),
+	CS42L43B_MUX_ROUTES("DP3TX2", "DP3TX2"),
+	CS42L43B_MUX_ROUTES("DP3TX3", "DP3TX3"),
+	CS42L43B_MUX_ROUTES("DP3TX4", "DP3TX4"),
+	CS42L43B_MUX_ROUTES("DP4TX1", "DP4TX1"),
+	CS42L43B_MUX_ROUTES("DP4TX2", "DP4TX2"),
+	CS42L43B_MUX_ROUTES("DP4TX3", "DP4TX3"),
+	CS42L43B_MUX_ROUTES("DP4TX4", "DP4TX4"),
+
+	CS42L43B_MUX_ROUTES("ASRC INT1", "ASRC_INT1"),
+	CS42L43B_MUX_ROUTES("ASRC INT2", "ASRC_INT2"),
+	CS42L43B_MUX_ROUTES("ASRC INT3", "ASRC_INT3"),
+	CS42L43B_MUX_ROUTES("ASRC INT4", "ASRC_INT4"),
+	CS42L43B_MUX_ROUTES("ASRC DEC1", "ASRC_DEC1"),
+	CS42L43B_MUX_ROUTES("ASRC DEC2", "ASRC_DEC2"),
+	CS42L43B_MUX_ROUTES("ASRC DEC3", "ASRC_DEC3"),
+	CS42L43B_MUX_ROUTES("ASRC DEC4", "ASRC_DEC4"),
+
+	CS42L43B_MUX_ROUTES("ISRC1INT1", "ISRC1INT1"),
+	CS42L43B_MUX_ROUTES("ISRC1INT2", "ISRC1INT2"),
+	CS42L43B_MUX_ROUTES("ISRC1DEC1", "ISRC1DEC1"),
+	CS42L43B_MUX_ROUTES("ISRC1DEC2", "ISRC1DEC2"),
+	CS42L43B_MUX_ROUTES("ISRC1DEC3", "ISRC1DEC3"),
+	CS42L43B_MUX_ROUTES("ISRC1DEC4", "ISRC1DEC4"),
+	CS42L43B_MUX_ROUTES("ISRC2INT1", "ISRC2INT1"),
+	CS42L43B_MUX_ROUTES("ISRC2INT2", "ISRC2INT2"),
+	CS42L43B_MUX_ROUTES("ISRC2DEC1", "ISRC2DEC1"),
+	CS42L43B_MUX_ROUTES("ISRC2DEC2", "ISRC2DEC2"),
+	CS42L43B_MUX_ROUTES("ISRC2DEC3", "ISRC2DEC3"),
+	CS42L43B_MUX_ROUTES("ISRC2DEC4", "ISRC2DEC4"),
+
+	CS42L43B_MUX_ROUTES("SPDIF1", "SPDIF"),
+	CS42L43B_MUX_ROUTES("SPDIF2", "SPDIF"),
+
+	CS42L43B_MIXER_ROUTES("EQ1", "EQ"),
+	CS42L43B_MIXER_ROUTES("EQ2", "EQ"),
+
+	CS42L43B_MIXER_ROUTES("Speaker L", "AMP1"),
+	CS42L43B_MIXER_ROUTES("Speaker R", "AMP2"),
+
+	CS42L43B_MIXER_ROUTES("Headphone L", "HP"),
+	CS42L43B_MIXER_ROUTES("Headphone R", "HP"),
+};
+
 static int cs42l43_set_sysclk(struct snd_soc_component *component, int clk_id,
 			      int src, unsigned int freq, int dir)
 {
@@ -2126,8 +2577,14 @@ static int cs42l43_set_sysclk(struct snd_soc_component *component, int clk_id,

 static int cs42l43_component_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
+	unsigned int num_controls, num_widgets, num_routes;
+	const struct snd_soc_dapm_widget *widgets;
+	const struct snd_kcontrol_new *controls;
+	const struct snd_soc_dapm_route *routes;
 	struct cs42l43 *cs42l43 = priv->core;
+	int ret;

 	snd_soc_component_init_regmap(component, cs42l43->regmap);

@@ -2139,6 +2596,39 @@ static int cs42l43_component_probe(struct snd_soc_component *component)
 	priv->component = component;
 	priv->constraint = cs42l43_constraint;

+	switch (cs42l43->variant_id) {
+	case CS42L43_DEVID_VAL:
+		controls = cs42l43_a_controls;
+		num_controls = ARRAY_SIZE(cs42l43_a_controls);
+		widgets = cs42l43_a_widgets;
+		num_widgets = ARRAY_SIZE(cs42l43_a_widgets);
+		routes = cs42l43_a_routes;
+		num_routes = ARRAY_SIZE(cs42l43_a_routes);
+		break;
+	case CS42L43B_DEVID_VAL:
+		controls = cs42l43_b_controls;
+		num_controls = ARRAY_SIZE(cs42l43_b_controls);
+		widgets = cs42l43_b_widgets;
+		num_widgets = ARRAY_SIZE(cs42l43_b_widgets);
+		routes = cs42l43_b_routes;
+		num_routes = ARRAY_SIZE(cs42l43_b_routes);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = snd_soc_add_component_controls(component, controls, num_controls);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_dapm_new_controls(dapm, widgets, num_widgets);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_dapm_add_routes(dapm, routes, num_routes);
+	if (ret)
+		return ret;
+
 	return 0;
 }

diff --git a/sound/soc/codecs/cs42l43.h b/sound/soc/codecs/cs42l43.h
index b2fa2cd1d99f8..fd50feb26ae99 100644
--- a/sound/soc/codecs/cs42l43.h
+++ b/sound/soc/codecs/cs42l43.h
@@ -61,7 +61,7 @@ struct cs42l43_codec {
 	unsigned int refclk_freq;
 	struct completion pll_ready;

-	unsigned int decim_cache[4];
+	unsigned int decim_cache[6];
 	unsigned int adc_ena;
 	unsigned int hp_ena;

@@ -103,7 +103,7 @@ struct cs42l43_codec {
 	bool hp_ilimited;
 	int hp_ilimit_count;

-	struct snd_kcontrol *kctl[5];
+	struct snd_kcontrol *kctl[7];
 };

 #if IS_REACHABLE(CONFIG_SND_SOC_CS42L43_SDW)
--
2.47.3

