Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCBF3E3C69;
	Tue,  9 Jun 2026 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006907; cv=fail; b=I0x8z9lVNveJliq9m89XtdixKcAZHIqiw24ZW3X3eRtJjxvXY/9cK4W3LPZt4c3F4CMD12qDHxEmfoA/uomaGDIpFgwHiOARVV+M67atSbuKotz/4JgiES/vuB+yO6Dp2N5KaU1R8+zUEGAUjDW45WvCOx4I253ToyNjFwIrR4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006907; c=relaxed/simple;
	bh=q22CEDcwuWbqsby+cXpAnmWESr0nybKNSNE5BLXBXFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JKnfqXI3hF7uxJTJFShWLOp31uYk24xQrktT884hidEEAlLcJo66D7RPpKBeFEy60M2xLceyfIwDPpSQS7ogKjqWH719D+aau45RWQ61fxBbbjGAUkq3ovzalQ2ZYCMHF3rAFEZvP4udLfd7NfIPe6d69Cw0RLLuHDKSatPlL3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dF54955q; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cwu5MNFF; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dF54955q";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cwu5MNFF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6594wfC31837632;
	Tue, 9 Jun 2026 07:08:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ofWDkvXMwZy509vK6EhpqEjUpQPOhZZCXM6oNWKSQOo=; b=
	dF54955qeiH9nmv6ycvGu16UvXNSWWoKStlAUUomMkkket7ngdrr3MvWpB/gLTBO
	VojqIpO2g/CFUG7XtWe/ZJy27msHp7st2zPxp1KFP/wtDYQMvfY4E/w7tSvGE+fN
	KsBp3LPl25EWkeJ/hSswwBz19Mt/29euZBtAKKXaDnbBqP/bxv6veH455V0pyn4N
	3Q+oZxv3W6NOaAqfYVMNYW9ECWsWfkjM74Q/X0bRsWNUEqlsLpNJpsLHWqmzyRnd
	r4wu3JL+aQsZOi6m5opdGZ+gF1Cml4xSAex+2CExZ6sYGIKF97hcXjWKauu2Tlyr
	z/m9B3eBMLUbk8c+G/LE+g==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022104.outbound.protection.outlook.com [52.101.53.104])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4emgy0c2xh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 07:08:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMum7pEYPBtLF0MFzdZTAHVJB2ji16qSI8mOdk6W3+6ZA+hD3bdWgzbS1yUQnGQ7Lh/F6EPlBAZOmu65iKAg6gta6IaR3r/yAIvVRjdxLpWDUxeKbMg0ZTT6rA2GTZ5x4hHxh09w23jY0JXybVRHRYLlcMk8wKEF2RC+Lo13hKNOYfNyWXDXbrk8tIbwv4fwr3HeSzWRhrXpfIamVGcAaMKt1qwFR+LuYFd9tFbjIV9jLADNTiAew9YQye/pyPr33eBpqJOZGBflwUa9utOtK+mQRDeQW1q32XvSNoSasBQqlCpgEWZg65O38joG6cY6hYMWfjv7HG7NVxNic5iT6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofWDkvXMwZy509vK6EhpqEjUpQPOhZZCXM6oNWKSQOo=;
 b=KGxQY/4pzi/Ip1yVqE1jezyzARjYC9/CKYouJYBNFadEW9ssO5b5A8Fr+fwfX1Y55O9iy8jG2uY0AFHEwdQZwLXme0dAh9gOrszfx0ufWiHROuJmFTPnHf2JFbs3IDWJB9sQBbSXXq9EFj+JCuB1MYmD+DjUYBCTC0yzOriYt2JXvPc1EO4o6eqMFE4Qtjqqv3f5Rr0qKVXXanX1N7wImSGc6xsXsxNmDh4ig6FivPeKJZjFC1dIUqs+iaVmvZcOdnJr9jf7qQp1eeycrgkoj8lxDvOgb9vJt5WrdDAxY3Ho5eIgpxAi4LxWdriKk6qWbr6x8Q5xw4ZouCWlnc52rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofWDkvXMwZy509vK6EhpqEjUpQPOhZZCXM6oNWKSQOo=;
 b=cwu5MNFFuBIou5fKTfqVDcM5KYgg8JnUovDNHX9zK0EHwyjDgJFx4ipGPrt3xndcZVNNLqmzNH8gG5dg3F3B8VTx0pWFbrknLqmkyMLskwUoxbzhTTFhd2vDZ+EuVJu5MaAnKC+2MbsNIXhs63Eoshd7hs5U1F/ZSq+SIMeLPhc=
Received: from DS7PR07CA0013.namprd07.prod.outlook.com (2603:10b6:5:3af::19)
 by SAVPR19MB997258.namprd19.prod.outlook.com (2603:10b6:806:4e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 12:08:09 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:5:3af:cafe::5d) by DS7PR07CA0013.outlook.office365.com
 (2603:10b6:5:3af::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 12:08:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Tue, 9 Jun 2026 12:08:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2A75B406556;
	Tue,  9 Jun 2026 12:08:07 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1287F82254D;
	Tue,  9 Jun 2026 12:08:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: cs35l56: Fix missing calls to wm_adsp2_remove()
Date: Tue,  9 Jun 2026 13:07:37 +0100
Message-ID: <20260609120738.284770-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609120738.284770-1-rf@opensource.cirrus.com>
References: <20260609120738.284770-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|SAVPR19MB997258:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9ecde733-fb01-4e1c-9cf1-08dec61fc4f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|61400799027|11063799006|56012099006|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	6lN42j8THy0B+36E+nfkkxW7PD2FvSUFIEoSmbq0aq+FZzv8YWWtxgLYLsDTHQaoZtP1vfRZ28/wT5ms8GgBJv9+s0U/doZoFVKLflF7aNpBA/IF7StHgDW/v1s2kGL1hOfMbTzrQox/iBQOKWbHoCoiKzk+HbHrg2GoCDVREGr2pMS101eJRVPK/6x1iRUJ49POGOk/Bwxp02ojlmhU+xAYCySlvyx1p0lpF6glsYQbx8rNBHXCFPhNgMoWutDayK7kLkkdD4rrMgp9zAWlQ+cQDim6LajlctcMoPY8VrJYDTJ0pIQ4bltWEZHk332SOfgPBLHlqcqAZHGeV2uh3Y25rdB9WpqwNQgRFizwi2fqa4GFKWjKy5aen2JqVDyGpW6KGXbajqsP7unAGD01yEK7OwPH3ccpTvSYGI1p1e1mrAe/WGOM3GAp/rtaCEppOEcK02UHe4BCUChiXtc0ZxuG3sA3LlsF/pLrS0TR0iT9i2KaBr5S0zsDolJ0XrTOrGka1GksZjeZU3seYjAhF+wDCJGdTlB58oao0Iyt28TXhN7i4FqdMKfN4FrlOkpFE/C7ktr3qfXxZbpa9Q1ZBi0yKoYMbDrvleB5HyOqop2r/SftnnZVye1IH+Mf4I0zXBexRo0OoiUpZjKaneJTPV5oY9S/KVAiZeYJTZt/Sb71dUZrnBTXMxdAkbsWx/KODWewIpB4Au+vwUlu4MGcpVVZu+sqsIKD9eMBZqj+wUA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(61400799027)(11063799006)(56012099006)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I3FbMRaYgAQK2o0QqGLO04xKkmyawg+UylJ9+ot+kdRYb7EeDCX4RWQrwAMyAwb3Mz3B4FR/n8HUybDcHJhW/O2637gndIUtezbOTP28p7jL/jbDNvRi3A9+eu6OwuKJec+t6R/SFTxnGPHt3gVEk0wJJxPLlFgNva7WgOuYaIacUrPQqzIdQD2IzWPyjlIXfwJGGK0T0r7mPju56XMa0PSh7JDFe+jtaahpH/KEK5MZW19ONM8I7qEAdNaZhSesMLs4ou3Ue/lZHlM1vK9N/KCtmGmzKocSV+PmAyAy1JZfi2VO8ySw48iZ158kICSqsYlzGBfaJD2QadVUwOXj9JhvikFUfcAIY2pbzPOYuzcO5J8SgTlOcSLXlCo6WSAw6+seWo8ij0WJl8MJ8Y7CooKmQr3zGfb45BGQp6i+saghyR1WgADvQBgCdAtva/hf
X-Exchange-RoutingPolicyChecked:
	TlNpsZySMYP8L5v/l2XpLXOuNhY45P0BmvOv5mkym6JoOV+eupjMswfrpeJ2f03azJkyvcc6rq8F+87uI9xSQu5RHy13JY3n0jy0LdvG0QvEmQ5uoW94HC+gKIQrB/Z1/v7zszesAIbF9zBw17BjR9etNcwSGUD/HWXVcy3Z77LQRFxTatkzEOKG9tc6dX+7b00WL2f0YfBofp6Yy5e45p6c+2vLyQtC4lxYmSs8ECQpo2qZjo80xwznEHrWlUEZDZeTY+VabsNk9z2ZUSG1TYzy0NhN6+N2TyFvXg9pamvS+twDGub9BYA57CXsSA7LmKr8jAl6W+t0vNleftuePw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 12:08:08.1484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecde733-fb01-4e1c-9cf1-08dec61fc4f7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR19MB997258
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=6a28022c cx=c_pps
 a=2xeXp0dC9D2Ab43tHZD4EQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=AQBjrmBz-BZPdndYv68A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNSBTYWx0ZWRfXwAW0dDtsObJh
 2GOed3fNhfDBFdy0QAoi5/04+nA6NMJGiQpvyRbEBdZefnAR2hLQwKTW4GnCeRf48JAkWzWzO6H
 LOFvKB0F4JLXlv5vTGWmOanKxSMEN7ZUsdGc3dd7cGb4hVSh3L519MN8zn46KJDLll5whTxbacb
 tMUowZxLwXOC65F9QPuBHL9/7jnpIERoflpXB1RHVLJ4zoq8BKCYUXkS4WTGjTS6QuOz+M/KoR9
 YyjK2Er86iXtzB2C3n4s9014MS727JcHay9jKeHY//RbUFYNGPTtjzJzumFTHJxh5zWx8WxQzRd
 Bmr0Pbu3Y9PVPzBlIXDBOW6YWFvRMmDqTnUTbbjTuw6n7HO0DTJx/aAYDCCTGzuDks6c1+WgH0o
 1Q0g6uoeFzGiLGnEXZeD8NQV1oj+5Snt7YqOKtPjRAsCpd1h4sEM/GRerH0G54Bya3U7hppBC+x
 ChO9Wt7LdEsNedmy1zg==
X-Proofpoint-ORIG-GUID: lQrL_zQVigib-BOlNCTFjQSAhgk1tled
X-Proofpoint-GUID: lQrL_zQVigib-BOlNCTFjQSAhgk1tled
X-Proofpoint-Spam-Reason: safe

Call wm_adsp2_remove() in cs35l56_remove() and the error path of
cs35l56_common_probe().

Depends on commit 7d3fb78b5503 ("ASoC: wm_adsp: Fix NULL dereference
when removing firmware controls").

The call to wm_halo_init() during driver probe should be paired with
a call to wm_adsp2_remove() but this was missing. The consequence
would be a memory leak of the control lists in the cs_dsp driver.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
---
 sound/soc/codecs/cs35l56.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index b4b126753c10..5de9cf3d0330 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1997,11 +1997,14 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 					 cs35l56_dai, ARRAY_SIZE(cs35l56_dai));
 	if (ret < 0) {
 		dev_err_probe(cs35l56->base.dev, ret, "Register codec failed\n");
-		goto err;
+		goto err_remove_wm_adsp;
 	}
 
 	return 0;
 
+err_remove_wm_adsp:
+	wm_adsp2_remove(&cs35l56->dsp);
+
 err:
 	gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 0);
 	regulator_bulk_disable(ARRAY_SIZE(cs35l56->supplies), cs35l56->supplies);
@@ -2109,6 +2112,8 @@ void cs35l56_remove(struct cs35l56_private *cs35l56)
 
 	destroy_workqueue(cs35l56->dsp_wq);
 
+	wm_adsp2_remove(&cs35l56->dsp);
+
 	pm_runtime_dont_use_autosuspend(cs35l56->base.dev);
 	pm_runtime_suspend(cs35l56->base.dev);
 	pm_runtime_disable(cs35l56->base.dev);
-- 
2.47.3

