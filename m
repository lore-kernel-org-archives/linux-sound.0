Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7C938550C;
	Mon, 30 Mar 2026 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774879285; cv=fail; b=uCIWa/eGhTbchICFkHQ31sfYFuejer0RX8AM6s4U08Oh0uyuZ90UGiGhKTGj2GRfOzamPtrhnM+jp5RrwKmCAbHdYXtgpN8mnIn6j+LLP4zw2MOEcrhV4GRZ2Hn4+wP7NILeOAGIOfiKK6nqaPCRhjchyfO4ZyRKt8VGEqu9MeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774879285; c=relaxed/simple;
	bh=qMgffGqzTGjp7DTTb1ijdCATx9ttUaUvM5vCL9td7Qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DqLhIGmRi43aiMnTtE8E7Vd8ZZbj4t3UIWv3JffgEEySC/PhRFC1ae1VIzar3HxF3xZWdTEyf+STE/g3C79rmd0WlwifZ4vfXxKSS9pCbJT0PRbJR2XbgvK3S0RhguWOJ8kK9pStSsHwdk4QuRE1wV5YqmL8azRO77TkKgsubBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gTqEr3jh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=eZa0U1+e; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gTqEr3jh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="eZa0U1+e"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TNfeD73741000;
	Mon, 30 Mar 2026 08:47:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=KJD7VnojHZSkqddReWxVuo3qnOFUVEN/oc2pzb7Pmag=; b=
	gTqEr3jh1YqHw9Pb1BAsEC2ZlQbiqxnil6x0/6MosAPY+PGZp1KCi9+gGAcLEz0M
	CFn0PXvj6JrNYL4rQA8jmenpPYJcpwSJDsamJoUD4jRYjRYqT+aHwC04niykQV5o
	XVVwPQqQCGLub70+UrUGs8+B+HVE+TO7j7XxvllXFNQeOKIyyR8ta8eVz3It8IHV
	nCwjnW7A7/+Nt9BKfvWhzQyv4uUzdGaOK0CgSdHbUFKAdkZaHj57zFUV2sLHh+Sf
	Z1t4hqM0/CW6IEsZWfLNJcK7OtUzObMRlmpr9j3J6B47FEUiasIVzIlgQwFXUAbS
	5R2jarzzLcDVKRSW6ksluA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023077.outbound.protection.outlook.com [40.93.196.77])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d6ccxsvgh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 08:47:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnWZogh5xoDvZZ1R5gwFHpKbgS6hMHAx4BYj/VgoVa4q51gFLiWztXr8jIjqOrfgIVGTnGHXpt8DRsR6BqgZ5K130MX/rAvoOSUgFF4UbuudBrB7bSEWqJXKr8whA5TREBQ9nMJYBTkDLD6IULWLEKu/KQhvYrCtqTa02TzpYK7bz8WVnliaJ1WPbvbcibDvJdZe1X5bsf2rWgmjE5pUnXOPr8ZLHXdjM4weXW53vcjNKEKDvdgnitxnD7QIL0IVo+0DGTf5EjKACdYYJVG0vtg3jc2+fUKMGElxZf/OP8gFO4D+ij/TUeoa0q58uxfC2bg9JRejYy6lvUDOkSrtyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJD7VnojHZSkqddReWxVuo3qnOFUVEN/oc2pzb7Pmag=;
 b=OoCmqEyw0kw8SLcJlrDMnsfxOQFent5B27xY+A7qNK2g3knyCmn9/AfFLcP0/7xulqgX/Vw4r44INiNre3KBFHLE7dISUVXqPqBTkWesnGiajX1MDgmLzcNXyaJHaEtSig2e16l39riaCRyV7PmZz5Soq9lsu3R6/FA3GXiaaDFyTJYWHSnOU1l8FvSHnf17tA87Qwa61c9GWWp5N9PEbYC53Ch61OnCvUcWlsnEkrIsuSE0IO6ljyaspcbC8kVWlB+Ff52rt6IVZ495ThHi8pB5yieZoH08Pjy8VoEF9mpBfDWgyzgk6O8zpm2v5medg7RLwLvpeaD8URww1DljCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJD7VnojHZSkqddReWxVuo3qnOFUVEN/oc2pzb7Pmag=;
 b=eZa0U1+e7mHLjtVgrAVsGup8yrf+kcqEQQMHNnz7M/hz8YIHH6G1FiaNbHMj3xMnebxTFlrRyHqcpz6QYynVnlakc3UNvP8EVmEmkXSD8SpAP/4BBNMUUgvVgFOKf0MIg3980nNMdbovQwEnVP/+xPP2HQKqcFpLfrE2DpQee1M=
Received: from SN6PR2101CA0004.namprd21.prod.outlook.com
 (2603:10b6:805:106::14) by MW6PR19MB8133.namprd19.prod.outlook.com
 (2603:10b6:303:24a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 13:47:19 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:805:106:cafe::b6) by SN6PR2101CA0004.outlook.office365.com
 (2603:10b6:805:106::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.15 via Frontend Transport; Mon,
 30 Mar 2026 13:47:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Mon, 30 Mar 2026 13:47:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8A50D406550;
	Mon, 30 Mar 2026 13:47:16 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5C81C820247;
	Mon, 30 Mar 2026 13:47:16 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 1/2] ALSA: hda/realtek: Add support for HP Laptops
Date: Mon, 30 Mar 2026 14:46:17 +0100
Message-ID: <20260330134651.443439-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330134651.443439-1-sbinding@opensource.cirrus.com>
References: <20260330134651.443439-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|MW6PR19MB8133:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1e0909dd-37ae-452b-9e0a-08de8e62dc0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|82310400026|376014|22082099003|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lrcWWYt+4GEGB6QlEBhYyOehGHChFEvIS5Q0c4ZazHDeXe5DvhOk8rH9kO0wIq+uQJ8T8yLaWVDTj/D4PgfvN5aNlVrTDR78oI8mbSw0Tm8C2UyHvfCl+RqysuQ8uDBkiD8YLMieaIX8tHEu9hcnqkACm4imNTnCARpKwskUQXd9UAokcJlZ7DXSLLKaQDisL9nYPzSkbejO5wuXLBaxSvJQ/ynEPoL+LnF91OHNIREfYrILHYOi9686DveYxc+KR4DIev50iz96euYYsyUMjcF/E1Jp4xdxDL7xCYy2SD8a3J8DG/2UyC8Fbntl63mH4Qk0HZWa288OriNJjAwEd3wkwOXCJcg8XYNgaHsYMb2qAEdzHt6yjOmFqAeWbcwcN9j7jMe3Q2jduXVrLwHQKV5YJFcbxcslTrOTzT4YfG9u7P6q+uy2FFOZ5mb08yF7gmH1w1r66E0PHCRacAFTET4GLceJBc7N9gs9liyc04e0AKj1sEZLdhtp+vAcNGNyTcJinQa6TrvSgDDz1jzMCFdnqpNIYYq9ipNIWLvKjRGKp1DJ+5u1vmVuz2hliAgdjMYgFLZfNK4U9jw8o2q1HJdtY6TNW5QsQQbdceiG2CUpc0L+vyDCKhw7ChWXqUqXrXCouQPL9pUEGz4al9U4lsMGESO+J75YjaYmIQkOkgqMXUbF6+lKaLE8mHhU4pW53MCLh8KYdv3cfQ81sFGrLpPYjZBfHW6IT4IiUY5Ws5ElAyiCqUSWlNcdyfWCNz1keTIUDx21nGl5H2G7ByRvxA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(82310400026)(376014)(22082099003)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cBmoVrSBQlO3ech8Ec6Lk9f5NhHbCEM0WqzmMDFzDSHn9gm5KOm0toHpiIYjKPhptf42oJCn2Diw1HsjGyAMTrR638Zd+2J/e7bh+a2ngCiXW7YlmxbuKgT8AZKm6yCjfWOgPGqpgyvejZkl+X7FuMxXnXPKMnbCGzW3ayaov3xDNVhFizj0JzbYkjal75ub5klvQi1u0GSMV8zEMxBBuwAK6xhPKABmKn/MmpF8QmYXaK8F4N1TGPen/lg9igfTebDXiNGb3Ym3iUKTsqq32VGilkAf0GGTH7bDsqV5Lv2kahFys0kPVsM1FdD1QKqRPwmgHk8U4ivQaqL0OfhI++5oxJw/7Khl7+qkANYrTgUWqTuoDFVFqH+XqKLYOw0FgZi6W5fn4gkNw9acg7ZJpE65DXUCIl6MSZHX4RAo0lIaJ24qCb8qA2jpV+AofZx5
X-Exchange-RoutingPolicyChecked:
	sbDviyzkJN/vMeE1mXn8tfYQeEeGKMCl8XcmJ4xkp5HObyC3LQgU8xo9PoYy9CqVC9mjsAtd0+7PQ/QzKTZzaqV6kkSrmJW4Xavr4BWSqBZv/1Px2f98lEoTnXnpvn5DIQH3ZI1Tmjk2nnkckRjzYZLuh0stI27coLsrv935k702V0HeoaHuiS69k0eRv6HDSq5KgzaQeNyfKEsKMaIWPTwm5ZSTPSDa+fteym2nmQ9J5TAmAWsbl2ZE9UEFYYIPDmENh70dRL5X4yzzxVQsEAPQBHvTxIJOwlBPvfg3KswveAAJcKhFBBVCpjLb46xo8qSOszmZlgXSbah1I8VERw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 13:47:18.0250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0909dd-37ae-452b-9e0a-08de8e62dc0f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR19MB8133
X-Proofpoint-ORIG-GUID: 9t38YinDNrxVQrAZZl3IJDgJHeQiC_Lc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwNyBTYWx0ZWRfX9iG61nRSFJfH
 PyCPVS8nww5iDWID+P+37MEVYOsjChfwpJbfaMy4gPw+woDEGOolhOombXHXEk0ucpXAGJDLflV
 CLtoEreFiFXIPCEU1iqHksxyc4DiAb7OOa7uezzAGqiDlT30pm5n7f/6laBghLN9sW8OAXGaIEA
 Ow1ixkgrgUCkljntA4EA25C3EjHRaWSfvvkrn61MuCYd9kJeqB8Qs2GfhqPQpSWWLSYYm/U4BT5
 Pt2+FhfVezmfRkxWMgZo7SBk9pkR+cXbRiZBLSvUISBYxOWbXk27YLtkRKqTuqXTOUzBsuRfMwu
 Jn4XVOCiRU2KZxRaFPKQ/CqzYmdCE5BjY2tvaHzRMMkrbqjKtVH5Jo5sWoMOfm+dQ2Q+yy2YJzy
 I0m2niuQEu7tV1G/nPWmGa3oJhQDyslRhGM5DziRLUT3vTZZ+Cz96IR2n9JbGgKDf5pe6NrdIZd
 apyRfy0f1q66JzXsX9A==
X-Proofpoint-GUID: 9t38YinDNrxVQrAZZl3IJDgJHeQiC_Lc
X-Authority-Analysis: v=2.4 cv=Xvb3+FF9 c=1 sm=1 tr=0 ts=69ca7ef2 cx=c_pps
 a=I1rsLqJrwb5vkj+WUQplAA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=qARPBvQ02u2UzIi-xlcA:9
X-Proofpoint-Spam-Reason: safe

Add support for HP Auster, Trekker and Agusta G7KX.
Laptops use 2 CS35L41 Amps with HDA, using Internal boost, with I2C

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/realtek/alc269.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index b6a58852752a..eb664d57527f 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7180,6 +7180,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e60, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e62, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8e75, "HP Trekker G7JC", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e8a, "HP NexusX", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e9c, "HP 16 Clipper OmniBook X X360", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e9d, "HP 17 Turbine OmniBook X UMA", ALC287_FIXUP_CS35L41_I2C_2),
@@ -7201,8 +7202,11 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8ee4, "HP Bantie A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8ee5, "HP Bantie A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8ee7, "HP Abe A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
+	SND_PCI_QUIRK(0x103c, 0x8f07, "HP Agusta G7KX", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8f0c, "HP ZBook X G2i 16W", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f0e, "HP ZBook X G2i 16W", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8f2d, "HP Auster 14", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8f2e, "HP Auster 14", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8f40, "HP ZBook 8 G2a 14", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f41, "HP ZBook 8 G2a 16", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f42, "HP ZBook 8 G2a 14W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
-- 
2.43.0

