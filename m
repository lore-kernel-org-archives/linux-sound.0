Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C51481FD4;
	Wed, 21 Jan 2026 13:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001779; cv=fail; b=Wm+Dpdd/RNT561MOw0vj5/sR+7XkqO/eNWAtAwuYa95rmtt+zDyMmMalpgnCsvLh6Ys+WAiM7LsgdIoi05nAwwtWTlTsaX/LyyfbeDbSTTli3mCp6wGnMwh3wa3Y2EWunurFoYa4paJBN890QgCAatdy9aaCspt9YfQRSoKPuMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001779; c=relaxed/simple;
	bh=f/fmvvngQnXTL1huwvsEZiSA3px+wfxdXudbmXON69k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aDoTbQBZgyG49o6KRTj6ErNLa0rwk6EtA4xN2G4lqYRScTAh3pSqzjZ2N2bgFgZ/jKyqxZSBSZyeSCZd3UQPP17T24ngzMPWdCEAYqD/7jHIWo42oYLyEEYsEOlyDjbC0K2B5Ej4HSmHAB6YCP5szXhzTidgBzGMMzNpwcP0OXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qCPrb/Ho; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=holwKwHT; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qCPrb/Ho";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="holwKwHT"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LBTHqN391249;
	Wed, 21 Jan 2026 07:22:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=5nHJf41RXT1tMCL6gQ3XhSzg2p56fwDdBHMlyWmoLfw=; b=
	qCPrb/Hok7fwSsmEU3lShucjO9uFeBdPkEwnVLZr1Q3CwWscFsxPb7qLX+vMjzXM
	RMhZrYBTgm/CN0WNs0PlK1MavXg1nZWP7keyBSkemNiKILDBNa8IIKk4q5v0Yn4N
	Uc9cMQ1HzLEE8915/ujPtLOnF2ociI0/qPoqkwZvrZLsxfFrvp4YYEPUTjahXLr7
	B50eTx5R0P2N4MXslpPJWdGntjqpLdEZ1VtgeU+h+Puh7gJfJAK9wFT6jJz0GCZF
	oR3Y2aILhKtdeG3jaGN2BMBi4J0cCVoTgx09Qnj6/5DK27P41wt2WvboDmMNb80n
	UZTU2VG5c0nsD/XFMJAYoA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022073.outbound.protection.outlook.com [40.107.209.73])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4br7qjvta9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 07:22:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUzhWXM3k/NkQbnVkN0CvN4Pnp/fL0QDgdCJH2xz7O6T9ypfhrKXzB1YfCmxdqvvwbG1WDXD2suumS7hFvFXg4jmMVDrCzNdj/felQ2vJNsQ/S63rVWQnxB48G0CJ0YB2jwDucrIDL9c+gq782Dl1pyta7VZ7c5fdDvqtFi06ZiAcQ5o7Z19IJYZAPGPXQNDoCmPmrqcKMQBUJtZIqaAQ/jfCiZ7kII4lLE1NLG0kvGGLqKSJh1OdZ1l24BGsZrqTHdQ7hpF/8cKTWrEL7bcFvdUml+4wt8AldIUq8tyD01hnon7ctWLHvlt0x5o6c/QzTE4wcFXErP0pXC2i+BdpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nHJf41RXT1tMCL6gQ3XhSzg2p56fwDdBHMlyWmoLfw=;
 b=ZRylKl1uq2O+8s8s4UUMn+QaaXTNaFE9ojz9PEvPNBqJh3ejEifK2sBokczCvkIKXPgaO8MZY+0G9FZwzNyHHcm2nPfx2FDJYLGVBsT31OfLPDBkix5Wbq+CVgJxUC09LKxInLhm8TTY4mYW9QmrSSH1b3mfEYIGcMzjdtdvj1hOM2h6mC4mj6fu1y6RsSUNvsTWqrlYIxQOGEOOMlt5BAjhH+6MAxn96Jlt+WSiNfIIfItxV+Y5IAPou53OtuPt+pfafX9bkh2NMgdQS9H9TkE8ogDEyRNLxNl8lzQiEPvDo7lNULqbfrGrLcgyctdJf38LC+9A6DUs5Uyiw0X5ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nHJf41RXT1tMCL6gQ3XhSzg2p56fwDdBHMlyWmoLfw=;
 b=holwKwHTc8DTB+Yq5wTbILRHWaoLieBivyVI8FsXaMlF8/ZHmV481rN/N+edxBFqQGIEgApC5NojXJslmuduyHyr6ynOeeyfe2gWdqA+pzrbYwi/RkZwc2KRd9Qwk71EFnbrejYnDc5qx0fOMgKfzsM7S7LLJTBxJNJH5GJra1A=
Received: from BL0PR01CA0035.prod.exchangelabs.com (2603:10b6:208:71::48) by
 SJ4PPFFBADB5175.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a63) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:22:46 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::40) by BL0PR01CA0035.outlook.office365.com
 (2603:10b6:208:71::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 13:20:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Wed, 21 Jan 2026 13:22:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EC416406544;
	Wed, 21 Jan 2026 13:22:43 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DBE8A820257;
	Wed, 21 Jan 2026 13:22:43 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 5/5] ASoC: cs35l56: Add KUnit testing of cs35l56_set_fw_suffix()
Date: Wed, 21 Jan 2026 13:22:43 +0000
Message-ID: <20260121132243.1256019-6-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121132243.1256019-1-rf@opensource.cirrus.com>
References: <20260121132243.1256019-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|SJ4PPFFBADB5175:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c8f773dc-2d65-4d56-6129-08de58f02a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KjYsSIRFgsj+BG/6ishIHT4uvgJL3bnv4WLF89FtaQG+eOvn0ZS3QNZjgLjB?=
 =?us-ascii?Q?wH6FwzTMP9GW03IndaDOgZ0IgYQ5SpI3iH9wY9Pz93rTmQVL/LKJFp1k6ggB?=
 =?us-ascii?Q?IscRU4lqAFIT4d8FQwMn76eVZdjrzx8ZX/H1m7qWf0f/1BeDQ8GrwmkZIaT0?=
 =?us-ascii?Q?Q0ji6ukWom7DPnV/dm3p27FXDwvlyDDf+w99okf8JAx+DwIbmqjvFrSdfi1+?=
 =?us-ascii?Q?y9MxiuDI51HuwbNMeFHII7y7x6S3GxIynzZMGujq4RzNQRpCN0CKgywkkQAM?=
 =?us-ascii?Q?oiT4xNywgCDOkPj0k53TbiZY7/rlBCsWElbsBcBUAEWVNMR7wgLOtiBLApXP?=
 =?us-ascii?Q?1gfdJLVHy/TK0Cazi7WrnG58ai5+VbJc9CAcg+ufGtkl0ZpD3s1e+z3JV6VN?=
 =?us-ascii?Q?aI1zWEbfJfTsNwUIC2oKgkQ1jLgR1fo+fGFeDyQsd3FCb+Ow+7z3YbCwqTQY?=
 =?us-ascii?Q?0h/vhP6T171zFfTuhJMqDJi6iLJVrRMKgfdrYm5MzyPJbE9Q4qKxIu3u400n?=
 =?us-ascii?Q?Urni7CrrNjK+PVYpltVqVi1tP2QLp8vr6Xw5JPt0mSlgbl4Is7hMhX0e820H?=
 =?us-ascii?Q?Kdnr68HB0r3OYLxPMoe6MH7SIIJXxksqVc7gWCgVOI1GuuNjcTlGXUCSbZ7s?=
 =?us-ascii?Q?47VDS8OCkgnw4RFbSI1HWOmNi7LsakZ7Pa2NwGlYHB5NWpQOtonP+m781mP4?=
 =?us-ascii?Q?lq/8LuygCfmQsSw8QLCeoaJ6l4qDcjlJLGUGI7f7TtH0UY/HuvsTNphR6li7?=
 =?us-ascii?Q?hXGl+Ez9J0O9nyfh8PkhphTmsJGXqC0RaTjWPi/wpusFnldkZ6iTOLvKxevB?=
 =?us-ascii?Q?Mma2p08X9wDLMf49CD9T4O0VC1oUkywNyAA9TNTcI+EcZX0cFDxNi7rpsqjb?=
 =?us-ascii?Q?NsQEyQjWpAtmzFPdQ2nJmGCWKQRBXFzqSJEYNkcCKi78DpW/qB5m+rsXWFs8?=
 =?us-ascii?Q?KBnDWaCt765R4MCUlpf8TYbRUn6zcRxMEgSJagzUsOv8l7Pajr8J17xX/0Sm?=
 =?us-ascii?Q?1gLNH1ULGRGnRgxl7xhpyePtBqRYTVzWCTpnrWjUWYIemMjzdz9wKbMsvBFJ?=
 =?us-ascii?Q?j/0uMgI9Mc2UmAUZY6qV0SW7B1V5tmseqGKHHZuchft7fFazkUU4o6eCJdVX?=
 =?us-ascii?Q?lyTKM8sPft7kw2x6iHcKsOI8ZknJLMO8+F5wJflGsmZ0xqhaBsXQHEqRjgAk?=
 =?us-ascii?Q?GLf5GtunhZd5hlGTy+V9sigcMQlof6P5SjcfZd1Jo+8xLBvcU18gYOJ8jgG9?=
 =?us-ascii?Q?unsTbevlRPfg5KRcANrcpn7RCXbNMTE3LoUeSQqaLrZMGOX6j9rlvd48rcS8?=
 =?us-ascii?Q?/A+3X5xhL6G3TumYFrILhbSBXDAQv63ye8OAa3LmM2FGzOyjgSx/UFkR6wEk?=
 =?us-ascii?Q?wK/nisGRedms3RN6VEbVp7v9dxBXWt/bysuNaVLbz3p1aL+xrk9l1Wun9pJ8?=
 =?us-ascii?Q?+I63klTJITACHY4lWG8xVPYDWD1h01feE04CjINA0VJoNZxlLFY4sOx/MI6r?=
 =?us-ascii?Q?jyW0nqKg3Kpf7E5+s2yUlLXyvmLEP//xPPzB5+iTWYIIKua9j0Cf1YmdmqD9?=
 =?us-ascii?Q?AghUKdbfM+DGIaQaz7uyIAlfpGmvzbg7Prl6AgPa5e18IMwFRoxup7tm33u1?=
 =?us-ascii?Q?3EvlsCq7cegiNLenuPduIy6mJrM9fCTTg9lTBGTlCtI3FEg1qg7oF2R/s0eI?=
 =?us-ascii?Q?DhtpPA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:22:45.2961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f773dc-2d65-4d56-6129-08de58f02a1b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPFFBADB5175
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDExMiBTYWx0ZWRfXw637ZpcRt0nK
 +OTgLRP2NEnLdqWRfV3yP202i0IFYIghnRJjG0gBg3wAvF3YeoN543hkKmJmexDwk7ZRf34VzeF
 LImLBFjd6zLqM3bpVg7tbgDSp0o1z9dyq81J1KrX0hYBX5FKCiy8H/79B5N6YbKuGWc6EQxAJTn
 r/XWGUyCBYSGoPbevT3OvgJ3i3VtFbBVsS1lXlFBq4+V/9z78rEurXHfsbfD7R0y5m6XXp6njwC
 /ILOVq5uJv8nnh4AzBm2ouzQnPe0WGlUDFIN8wRe1n8uQ8oE9SxyH5xokDmxHqJRbFBzWMMgrmc
 f1aq+Z2cCz0BLV/VNubwkfjqCemgi2vIr4RIl/3GLSf3p2kRL/zLugQxL0MirG+EqFWvrftYBfY
 S9Aeyzn84OG7mlbqzUBK18IUNELDfJa27oU40Zs6m2Ji9cOEXNYSzA97z/3d6nqQGfM3LyjTtdk
 RlI9FJ53m6pY3hzKGaA==
X-Proofpoint-GUID: 0iSEJYWxAhMiIVYTbBHa1_906BfKxmgZ
X-Authority-Analysis: v=2.4 cv=GrRPO01C c=1 sm=1 tr=0 ts=6970d32b cx=c_pps
 a=nTv9GYKPVLLC6uM4GBPpxQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=wJ923TbUvRZeHHswlswA:9
X-Proofpoint-ORIG-GUID: 0iSEJYWxAhMiIVYTbBHa1_906BfKxmgZ
X-Proofpoint-Spam-Reason: safe

Add a new KUnit test for testing the creation of firmware name
qualifiers in the cs35l56 driver. The initial set of test cases
are for cs35l56_set_fw_suffix().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/Kconfig        |  13 ++
 sound/soc/codecs/Makefile       |   2 +
 sound/soc/codecs/cs-amp-lib.c   |   3 +
 sound/soc/codecs/cs35l56-test.c | 365 ++++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.c      |   5 +-
 sound/soc/codecs/cs35l56.h      |   4 +
 6 files changed, 391 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/codecs/cs35l56-test.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 21d5b79f079d..d09de0ff5f22 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -933,6 +933,19 @@ config SND_SOC_CS35L56_CAL_SET_CTRL
 	  On most platforms this is not needed.
 
 	  If unsure select "N".
+
+config SND_SOC_CS35L56_TEST
+	tristate "KUnit test for Cirrus Logic cs35l56 driver" if !KUNIT_ALL_TESTS
+	depends on SND_SOC_CS35L56 && KUNIT
+	default KUNIT_ALL_TESTS
+	select SND_SOC_CS_AMP_LIB_TEST_HOOKS
+	help
+	  This builds KUnit tests for the Cirrus Logic cs35l56
+	  codec driver.
+	  For more information on KUnit and unit tests in general,
+	  please refer to the KUnit documentation in
+	  Documentation/dev-tools/kunit/.
+	  If in doubt, say "N".
 endmenu
 
 config SND_SOC_CS40L50
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index a6406bc907a9..c3568de5e0c9 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -81,6 +81,7 @@ snd-soc-cs35l56-shared-y := cs35l56-shared.o
 snd-soc-cs35l56-i2c-y := cs35l56-i2c.o
 snd-soc-cs35l56-spi-y := cs35l56-spi.o
 snd-soc-cs35l56-sdw-y := cs35l56-sdw.o
+snd-soc-cs35l56-test-y := cs35l56-test.o
 snd-soc-cs40l50-y := cs40l50-codec.o
 snd-soc-cs42l42-y := cs42l42.o
 snd-soc-cs42l42-i2c-y := cs42l42-i2c.o
@@ -516,6 +517,7 @@ obj-$(CONFIG_SND_SOC_CS35L56_SHARED)	+= snd-soc-cs35l56-shared.o
 obj-$(CONFIG_SND_SOC_CS35L56_I2C)	+= snd-soc-cs35l56-i2c.o
 obj-$(CONFIG_SND_SOC_CS35L56_SPI)	+= snd-soc-cs35l56-spi.o
 obj-$(CONFIG_SND_SOC_CS35L56_SDW)	+= snd-soc-cs35l56-sdw.o
+obj-$(CONFIG_SND_SOC_CS35L56_TEST)	+= snd-soc-cs35l56-test.o
 obj-$(CONFIG_SND_SOC_CS40L50)		+= snd-soc-cs40l50.o
 obj-$(CONFIG_SND_SOC_CS42L42_CORE)	+= snd-soc-cs42l42.o
 obj-$(CONFIG_SND_SOC_CS42L42)	+= snd-soc-cs42l42-i2c.o
diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index f8c7f594d54a..8b131975143d 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -806,6 +806,9 @@ const char *cs_amp_devm_get_vendor_specific_variant_id(struct device *dev,
 						       int ssid_vendor,
 						       int ssid_device)
 {
+	KUNIT_STATIC_STUB_REDIRECT(cs_amp_devm_get_vendor_specific_variant_id,
+				   dev, ssid_vendor, ssid_device);
+
 	if ((ssid_vendor == PCI_VENDOR_ID_DELL) || (ssid_vendor < 0))
 		return cs_amp_devm_get_dell_ssidex(dev, ssid_vendor, ssid_device);
 
diff --git a/sound/soc/codecs/cs35l56-test.c b/sound/soc/codecs/cs35l56-test.c
new file mode 100644
index 000000000000..66d772d7b982
--- /dev/null
+++ b/sound/soc/codecs/cs35l56-test.c
@@ -0,0 +1,365 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// KUnit test for the Cirrus Logic cs35l56 driver.
+//
+// Copyright (C) 2026 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+#include <kunit/resource.h>
+#include <kunit/test.h>
+#include <kunit/static_stub.h>
+#include <linux/efi.h>
+#include <linux/device/faux.h>
+#include <linux/firmware/cirrus/cs_dsp.h>
+#include <linux/firmware/cirrus/wmfw.h>
+#include <linux/module.h>
+#include <linux/overflow.h>
+#include <linux/pci_ids.h>
+#include <linux/soundwire/sdw.h>
+#include <sound/cs35l56.h>
+#include <sound/cs-amp-lib.h>
+#include "cs35l56.h"
+
+KUNIT_DEFINE_ACTION_WRAPPER(faux_device_destroy_wrapper, faux_device_destroy,
+			    struct faux_device *)
+
+struct cs35l56_test_priv {
+	struct faux_device *amp_dev;
+	struct cs35l56_private *cs35l56_priv;
+
+	const char *ssidexv2;
+};
+
+struct cs35l56_test_param {
+	u8 type;
+	u8 rev;
+};
+
+static const char *cs35l56_test_devm_get_vendor_specific_variant_id_none(struct device *dev,
+									 int ssid_vendor,
+									 int ssid_device)
+{
+	return ERR_PTR(-ENOENT);
+}
+
+static void cs35l56_test_l56_b0_suffix_sdw(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+
+	/* Set device type info */
+	cs35l56->base.type = 0x56;
+	cs35l56->base.rev = 0xb0;
+
+	/* Set the ALSA name prefix */
+	cs35l56->component->name_prefix = "AMP1";
+
+	/* Set SoundWire link and UID number */
+	cs35l56->sdw_link_num = 1;
+	cs35l56->sdw_unique_id = 5;
+
+	kunit_activate_static_stub(test,
+				   cs35l56_test_devm_get_vendor_specific_variant_id_none,
+				   cs_amp_devm_get_vendor_specific_variant_id);
+
+	KUNIT_EXPECT_EQ(test, 0, cs35l56_set_fw_suffix(cs35l56));
+
+	/* Priority suffix should be the legacy ALSA prefix */
+	KUNIT_EXPECT_STREQ(test, cs35l56->dsp.fwf_suffix, "AMP1");
+
+	/* Fallback suffix should be the new SoundWire ID */
+	KUNIT_EXPECT_STREQ(test, cs35l56->fallback_fw_suffix, "l1u5");
+}
+
+static void cs35l56_test_suffix_sdw(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+
+	/* Set the ALSA name prefix */
+	cs35l56->component->name_prefix = "AMP1";
+
+	/* Set SoundWire link and UID number */
+	cs35l56->sdw_link_num = 1;
+	cs35l56->sdw_unique_id = 5;
+
+	kunit_activate_static_stub(test,
+				   cs35l56_test_devm_get_vendor_specific_variant_id_none,
+				   cs_amp_devm_get_vendor_specific_variant_id);
+
+	KUNIT_EXPECT_EQ(test, 0, cs35l56_set_fw_suffix(cs35l56));
+
+	/* Suffix should be the SoundWire ID without a fallback */
+	KUNIT_EXPECT_STREQ(test, cs35l56->dsp.fwf_suffix, "l1u5");
+	KUNIT_EXPECT_NULL(test, cs35l56->fallback_fw_suffix);
+}
+
+static void cs35l56_test_suffix_i2cspi(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+
+	/* Set the ALSA name prefix */
+	cs35l56->component->name_prefix = "AMP1";
+
+	kunit_activate_static_stub(test,
+				   cs35l56_test_devm_get_vendor_specific_variant_id_none,
+				   cs_amp_devm_get_vendor_specific_variant_id);
+
+	KUNIT_EXPECT_EQ(test, 0, cs35l56_set_fw_suffix(cs35l56));
+
+	/* Suffix strings should not be set: use default wm_adsp suffixing */
+	KUNIT_EXPECT_NULL(test, cs35l56->dsp.fwf_suffix);
+	KUNIT_EXPECT_NULL(test, cs35l56->fallback_fw_suffix);
+}
+
+static efi_status_t cs35l56_test_get_efi_ssidexv2(efi_char16_t *name,
+						  efi_guid_t *guid,
+						  u32 *returned_attr,
+						  unsigned long *size,
+						  void *buf)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct cs35l56_test_priv *priv = test->priv;
+	unsigned int len;
+
+	KUNIT_ASSERT_NOT_NULL(test, priv->ssidexv2);
+	len = strlen(priv->ssidexv2);
+
+	if (*size < len) {
+		*size = len;
+		return EFI_BUFFER_TOO_SMALL;
+	}
+
+	KUNIT_ASSERT_NOT_NULL(test, buf);
+	memcpy(buf, priv->ssidexv2, len);
+
+	return EFI_SUCCESS;
+}
+
+static void cs35l56_test_ssidexv2_suffix_sdw(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+
+	/* Set the ALSA name prefix */
+	cs35l56->component->name_prefix = "AMP1";
+
+	/* Set SoundWire link and UID number */
+	cs35l56->sdw_link_num = 1;
+	cs35l56->sdw_unique_id = 5;
+
+	/* Set a SSID to enable lookup of SSIDExV2 */
+	snd_soc_card_set_pci_ssid(cs35l56->component->card, PCI_VENDOR_ID_DELL, 0x1234);
+
+	priv->ssidexv2 = "10281234_01_BB_CC";
+
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs35l56_test_get_efi_ssidexv2);
+
+	KUNIT_EXPECT_EQ(test, 0, cs35l56_set_fw_suffix(cs35l56));
+
+	/* Priority suffix should be the SSIDExV2 string with SoundWire ID */
+	KUNIT_EXPECT_STREQ(test, cs35l56->dsp.fwf_suffix, "01-l1u5");
+
+	/* Fallback suffix should be the SoundWireID */
+	KUNIT_EXPECT_STREQ(test, cs35l56->fallback_fw_suffix, "l1u5");
+}
+
+static void cs35l56_test_ssidexv2_suffix_i2cspi(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+
+	/* Set the ALSA name prefix */
+	cs35l56->component->name_prefix = "AMP1";
+
+	/* Set a SSID to enable lookup of SSIDExV2 */
+	snd_soc_card_set_pci_ssid(cs35l56->component->card, PCI_VENDOR_ID_DELL, 0x1234);
+
+	priv->ssidexv2 = "10281234_01_BB_CC";
+
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs35l56_test_get_efi_ssidexv2);
+
+	KUNIT_EXPECT_EQ(test, 0, cs35l56_set_fw_suffix(cs35l56));
+
+	/* Priority suffix should be the SSIDExV2 string with ALSA name prefix */
+	KUNIT_EXPECT_STREQ(test, cs35l56->dsp.fwf_suffix, "01-AMP1");
+
+	/* Fallback suffix should be the ALSA name prefix */
+	KUNIT_EXPECT_STREQ(test, cs35l56->fallback_fw_suffix, "AMP1");
+}
+
+/*
+ * CS35L56 B0 SoundWire should ignore any SSIDExV2 suffix. It isn't needed
+ * on any products with B0 silicon and would interfere with the fallback
+ * to legacy naming convention for early B0-based laptops.
+ */
+static void cs35l56_test_l56_b0_ssidexv2_ignored_suffix_sdw(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+
+	/* Set device type info */
+	cs35l56->base.type = 0x56;
+	cs35l56->base.rev = 0xb0;
+
+	/* Set the ALSA name prefix */
+	cs35l56->component->name_prefix = "AMP1";
+
+	/* Set SoundWire link and UID number */
+	cs35l56->sdw_link_num = 1;
+	cs35l56->sdw_unique_id = 5;
+
+	/* Set a SSID to enable lookup of SSIDExV2 */
+	snd_soc_card_set_pci_ssid(cs35l56->component->card, PCI_VENDOR_ID_DELL, 0x1234);
+
+	priv->ssidexv2 = "10281234_01_BB_CC";
+
+	kunit_activate_static_stub(test,
+				   cs_amp_test_hooks->get_efi_variable,
+				   cs35l56_test_get_efi_ssidexv2);
+
+	KUNIT_EXPECT_EQ(test, 0, cs35l56_set_fw_suffix(cs35l56));
+
+	/* Priority suffix should be the legacy ALSA prefix */
+	KUNIT_EXPECT_STREQ(test, cs35l56->dsp.fwf_suffix, "AMP1");
+
+	/* Fallback suffix should be the new SoundWire ID */
+	KUNIT_EXPECT_STREQ(test, cs35l56->fallback_fw_suffix, "l1u5");
+}
+
+static int cs35l56_test_case_init_common(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv;
+	const struct cs35l56_test_param *param = test->param_value;
+	struct cs35l56_private *cs35l56;
+
+	KUNIT_ASSERT_NOT_NULL(test, cs_amp_test_hooks);
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	test->priv = priv;
+
+	/* Create dummy amp driver dev */
+	priv->amp_dev = faux_device_create("cs35l56_test_drv", NULL, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, priv->amp_dev);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test,
+						  faux_device_destroy_wrapper,
+						  priv->amp_dev));
+
+	/* Construct minimal set of driver structs */
+	priv->cs35l56_priv = kunit_kzalloc(test, sizeof(*priv->cs35l56_priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, priv->cs35l56_priv);
+	cs35l56 = priv->cs35l56_priv;
+	cs35l56->base.dev = &priv->amp_dev->dev;
+
+	cs35l56->component = kunit_kzalloc(test, sizeof(*cs35l56->component), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, cs35l56->component);
+	cs35l56->component->dev = cs35l56->base.dev;
+
+	cs35l56->component->card = kunit_kzalloc(test, sizeof(*cs35l56->component->card),
+						 GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, cs35l56->component->card);
+
+	if (param) {
+		cs35l56->base.type = param->type;
+		cs35l56->base.rev = param->rev;
+	}
+
+	return 0;
+}
+
+static int cs35l56_test_case_init_soundwire(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv;
+	struct cs35l56_private *cs35l56;
+	int ret;
+
+	ret = cs35l56_test_case_init_common(test);
+	if (ret)
+		return ret;
+
+	priv = test->priv;
+	cs35l56 = priv->cs35l56_priv;
+
+	/* Dummy to indicate this is Soundwire */
+	cs35l56->sdw_peripheral = kunit_kzalloc(test, sizeof(*cs35l56->sdw_peripheral),
+						GFP_KERNEL);
+	if (!cs35l56->sdw_peripheral)
+		return -ENOMEM;
+
+
+	return 0;
+}
+
+static void cs35l56_test_type_rev_param_desc(const struct cs35l56_test_param *param,
+					     char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "type: %02x rev: %02x",
+		 param->type, param->rev);
+}
+
+static const struct cs35l56_test_param cs35l56_test_type_rev_ex_b0_param_cases[] = {
+	{ .type = 0x56, .rev = 0xb2 },
+	{ .type = 0x57, .rev = 0xb2 },
+	{ .type = 0x63, .rev = 0xa1 },
+};
+KUNIT_ARRAY_PARAM(cs35l56_test_type_rev_ex_b0, cs35l56_test_type_rev_ex_b0_param_cases,
+		  cs35l56_test_type_rev_param_desc);
+
+
+static const struct cs35l56_test_param cs35l56_test_type_rev_all_param_cases[] = {
+	{ .type = 0x56, .rev = 0xb0 },
+	{ .type = 0x56, .rev = 0xb2 },
+	{ .type = 0x57, .rev = 0xb2 },
+	{ .type = 0x63, .rev = 0xa1 },
+};
+KUNIT_ARRAY_PARAM(cs35l56_test_type_rev_all, cs35l56_test_type_rev_all_param_cases,
+		  cs35l56_test_type_rev_param_desc);
+
+static struct kunit_case cs35l56_test_cases_soundwire[] = {
+	KUNIT_CASE(cs35l56_test_l56_b0_suffix_sdw),
+	KUNIT_CASE_PARAM(cs35l56_test_suffix_sdw, cs35l56_test_type_rev_ex_b0_gen_params),
+	KUNIT_CASE_PARAM(cs35l56_test_ssidexv2_suffix_sdw,
+			 cs35l56_test_type_rev_ex_b0_gen_params),
+	KUNIT_CASE(cs35l56_test_l56_b0_ssidexv2_ignored_suffix_sdw),
+
+	{ } /* terminator */
+};
+
+static struct kunit_case cs35l56_test_cases_not_soundwire[] = {
+	KUNIT_CASE_PARAM(cs35l56_test_suffix_i2cspi, cs35l56_test_type_rev_all_gen_params),
+	KUNIT_CASE_PARAM(cs35l56_test_ssidexv2_suffix_i2cspi,
+			 cs35l56_test_type_rev_all_gen_params),
+
+	{ } /* terminator */
+};
+
+static struct kunit_suite cs35l56_test_suite_soundwire = {
+	.name = "snd-soc-cs35l56-test-soundwire",
+	.init = cs35l56_test_case_init_soundwire,
+	.test_cases = cs35l56_test_cases_soundwire,
+};
+
+static struct kunit_suite cs35l56_test_suite_not_soundwire = {
+	.name = "snd-soc-cs35l56-test-not-soundwire",
+	.init = cs35l56_test_case_init_common,
+	.test_cases = cs35l56_test_cases_not_soundwire,
+};
+
+kunit_test_suites(
+	&cs35l56_test_suite_soundwire,
+	&cs35l56_test_suite_not_soundwire,
+);
+
+MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
+MODULE_DESCRIPTION("KUnit test for Cirrus Logic cs35l56 codec driver");
+MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index abea782bcd3f..31dd2f7b2858 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -5,6 +5,8 @@
 // Copyright (C) 2023 Cirrus Logic, Inc. and
 //                    Cirrus Logic International Semiconductor Ltd.
 
+#include <kunit/static_stub.h>
+#include <kunit/visibility.h>
 #include <linux/acpi.h>
 #include <linux/array_size.h>
 #include <linux/completion.h>
@@ -1107,7 +1109,7 @@ static const struct snd_kcontrol_new cs35l56_cal_data_restore_controls[] = {
 			SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE),
 };
 
-static int cs35l56_set_fw_suffix(struct cs35l56_private *cs35l56)
+VISIBLE_IF_KUNIT int cs35l56_set_fw_suffix(struct cs35l56_private *cs35l56)
 {
 	unsigned short vendor, device;
 	const char *vendor_id;
@@ -1175,6 +1177,7 @@ static int cs35l56_set_fw_suffix(struct cs35l56_private *cs35l56)
 
 	return 0;
 }
+EXPORT_SYMBOL_IF_KUNIT(cs35l56_set_fw_suffix);
 
 static int cs35l56_component_probe(struct snd_soc_component *component)
 {
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index 4c59f92f3206..7187885a13c1 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -74,4 +74,8 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56);
 int cs35l56_init(struct cs35l56_private *cs35l56);
 void cs35l56_remove(struct cs35l56_private *cs35l56);
 
+#if IS_ENABLED(CONFIG_KUNIT)
+int cs35l56_set_fw_suffix(struct cs35l56_private *cs35l56);
+#endif
+
 #endif /* ifndef CS35L56_H */
-- 
2.47.3

