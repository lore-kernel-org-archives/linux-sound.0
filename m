Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557BD3C7E11;
	Wed, 25 Mar 2026 17:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774458544; cv=fail; b=NLrPrt+4rc47VrBjFngfkOlrO/gtQaz6gwDE+rYxmzH/3dq+Qv0DD3TnfpwNGHSQPd+TGN4H3o0/0H2ysPceFUndEBJsbIBLRwiud4BXV5PnN8PK34NmkhEmC5GBWwFEjoIX5Vs610xBw1nqfCAj4lRV3st1RQaiiuLahZ9S3Ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774458544; c=relaxed/simple;
	bh=t7zM+xzuqcg2/Cj4+FCr6FBzW84VGvo7qFci4PqLLdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HqRrIGIwKuVy57cqlObVHz3mXXYYeW00iD71K7/d3Kdfu4QMRXmsAA0zrOd22s4kJBw5sbcB8joim5XLYxmF3thQJMMZAUJia+op7Q/3Ks1B7Riqf/wc4hzLTleVkbZmE8qn455rJxGoA+FETDkzSTY6dG6WHBs5P62ccJA7HgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hsAUyNit; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=MtTB4Cl/; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hsAUyNit";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="MtTB4Cl/"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P6YFv6103312;
	Wed, 25 Mar 2026 12:08:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=QGoYT8ZO0Qm0NZUTl7sKFUemsL0N9Ip7SzD1NA8ZHK0=; b=
	hsAUyNitC3o682YxcxAX9lUNBWVNvu77VzqHRsZxngcVpBD65yh5PmvpwMrOBUps
	UcCr51KjJOHOl5biw/zfsaitNgkaeoti1bKWr6pu/7+ynph1gBvRzAmCStwyydiM
	tYV3LB8qxAxGlChlyp0xmS6/0DQT9MB2PQw62OAyeutuoVwWtXfQK34RNreN+oFC
	7ITW2S/FnslreOHHeN6Mu4vFxglyAmAwSf8+rdDoh+RWBqDjNP7IcIoROSvx9Ei5
	x2BeOBAMOjFTUFimu+xt2XElYUNbWEsXuNm35A5y6vsbRRjrB+Hwia+IpP8P+sQi
	e/cOjwtdjt38IVbDbBWkfw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020085.outbound.protection.outlook.com [52.101.46.85])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d1qrfd5d6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 12:08:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYSJbT+p2aF1R1/rj3x6uDVltkwd2QFdkR+bMCR4zXGbCYqov3RzyzU1w/7I1CaejUKXovpCJ1xTzy8EhwsAJElopmqyriqrhWdlfMc834zfcQLgKtml9ogk2otJW/0CenuMG5nJ5Of1Qspg/gnv20V/4GHm/POKJMlKTJTRJ/ZqRCn/Lt2HQHdpohmfrt1zd607FGzVLfO0ba7iZEMXrwoIl5/cy2Vh7LmlZS8DyZyeYpGGXzxUSH/pSbUZuM3NOOO3jkld8J0nnP+qX3NbMvoQ0J0cWFdJGE0dBemYC/mbIFAdffD6/plhTNk3SxjVTMpcCaozaKwSG0luASUAvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGoYT8ZO0Qm0NZUTl7sKFUemsL0N9Ip7SzD1NA8ZHK0=;
 b=w/8SoJEK0fvw9hYIFaJHtoYED7S9tTevFShiwctS57dZ4iZ5IcQ8wSZxU4btHpR3BGcwCScDvG4nxNUAspVojWTYoDBwR642TL9XCzqE7qlNkGQRLl8BxC9DpsHNPR8UT4aK0D3ZRStzdTWfAfg1yFZgdbg52k98LuhWcd4MJVgQIvrIJ/s28beGijC1IVQl9s0w2dgw4BglNlZ4KpglG4eEtnAsQwcZlowHNnbK4Vorzlks05Yz1UUnIAPlAF8GO7TjbupQiDzjuvJ9R3T52R7N29NumNs2BOFpm3Kcy9zFFNhTmToSFQpFHnWvXbZq5ABo9haRgoRlPD4HQQfrhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGoYT8ZO0Qm0NZUTl7sKFUemsL0N9Ip7SzD1NA8ZHK0=;
 b=MtTB4Cl/h8yjCG4f/zCzE0MXn8Y2A73fRP4fN9Nd6volHsLPif3yZDcafwm18jkJNlC1yGzfucaI/C3ccx52GQuQ0quh7a+p8NYEWtEMSkXoJJSr8rmygDqc8c5i1+zET4evfGuVF6yE+rmo3v61X22W1+oyiwVa9+LOsAYqwfw=
Received: from BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::17)
 by BL4PR19MB8930.namprd19.prod.outlook.com (2603:10b6:208:5a9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 17:08:44 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::b5) by BY1P220CA0026.outlook.office365.com
 (2603:10b6:a03:5c3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 17:08:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Wed, 25 Mar 2026 17:08:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2605E406554;
	Wed, 25 Mar 2026 17:08:42 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 10B2F820273;
	Wed, 25 Mar 2026 17:08:42 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 2/2] ASoC: cs35l56: Allow factory calibration through ALSA controls
Date: Wed, 25 Mar 2026 17:08:41 +0000
Message-ID: <20260325170841.1405368-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325170841.1405368-1-rf@opensource.cirrus.com>
References: <20260325170841.1405368-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|BL4PR19MB8930:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3f42d948-a643-4124-a08c-08de8a912bd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|16102099003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ya1z505HjHx731VMaHmJHu10Jg8kiAGcfhQdDkfNWf7WSOeILHwEWlTDBOXq0NkdvqQwTf0qDmzEru0QEs5Go1afaIpWB3rMa7rESjt7zFynI6EtS7xXWXfUcDlKuo/Xjx91XDJtM9mJbzTvOnt2k5WFCOKud1QpOzxgwWuIEgi+Zkx66HKVaL5MsEIxLddQq6KcBSdgwva3/J5isjMRtoeWHtwoxKB8IBCPr9eeSTtzO94R7axZTJ50KYx9cR+8nYRvECbJIVOvPNKv2ry0Tzq+r0AakqyUdnkoByHFuxukLL/5+8bCWpLvGI28QYf3DNocTCyp3M/+43jMZzaDksYu5Z+OcJnF3DBubAgCZXLqiMSCHRVrP55q1AJrF30x8j0Ls/64L1oqEDIohLNqJ6GteycALL/nCHLXDgQ+8lW1bTkDNGFfUD44yAUZ3/p/ZXVFHYyM5f+/nUzrrBPnxP9Xmc+vhtw/RyqxyUB9FTSk04yqnAsEV1A53qruHYdC45cHU+fZkoq85h5UXogiOnKc0wpZyUb6Vk3BKZRKbYn3OmUtxCw1YS9UBRzTVsx2bbnoDgjC96hJWZBt4yXg/KVKyzu/qWvKYv1ZrQBBb8YjzKI+wd2dkultVdGuuW+0h/hlLh6oCnpkWl+dEKGjAm1xY8vTpi8lVRdFKP95Od+tbVzIWmNC27XU+wwh2TvbzC8VC+yA1sQIf28tP9y5x359h8P0NYlCsF0w5zIZ97r6lc6tBLbWB9R+0yxUQoojKRXny387CWiyIk4w/DOZMg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(16102099003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sFX/YtGOaN6YxoQiRj7iZ+nAFbuRA0lctv/DE0aLNJw46wsXpa16HhNo6u57stctIdG5/7uYt+gltSEpEjJkoqMWRp7NIPo90oaoASWnVsz/CeZQPCOaJUP5vdTykQ3SLNsZdDEGEV7cEYVb9ewFs8oRtYtVU4jMCECKCgDKm31vvJayEYerl42XX4EsANCIo3ilduHw/m/OO8QbLkZZ8RyxLT3HhKPm92vjeOAQqPowJBgTxX259Wa1zpH+BP3XJR+pIA1O+EqsUVAoVsVCkKdk2Ie3fA8RViUW7KdU/gzPcr5ICNoCGkVs9jcazWPM6ytiyeM3m4lFjr5wzWvP/DfnGOBwtBHk0f0Fkv39vOC8wiGz9LWxVAxSmulsO7NrTPwDJHgGYWI66k6fokedz6Uq8gfMo34/zTpdPB1j4S96TEbpW5DPgpF2bxS8jjo8
X-Exchange-RoutingPolicyChecked:
	BMNlvHXO3LDRch8bj/oGG9WgylnF9hg7SUL8jVyLgsUYe/j7Ts/HDXh1/32cikFiFvFwVnqFdNgrLuv2h6DuvBgI9/F1Qn1eIXRInG9ZDyuzUuXNQJ7X/nrCHsv9uYKVTEc9yPbLPL3Wb69KruC2vUMGmlhXRdXeKw0j8X1sYuy4WViS2woe+kwp5+kMoALG3+R5qL/9aWgJJRZm3IW9w4gOjXTFbsIer6t5AcOlPaVkPqlQxL2MIonflWU1G+FD3W1ezzo2P7tV3k4kahqjT0uOl35M2TXyPB//6eJnR/iyANqd9oJdCo1khhQvtWvibTaJzBxRvMKODRqi4+rW5g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 17:08:44.0239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f42d948-a643-4124-a08c-08de8a912bd6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR19MB8930
X-Proofpoint-GUID: jQrE7rVEFnwu-DqOIwfUD753ekVTZASl
X-Proofpoint-ORIG-GUID: jQrE7rVEFnwu-DqOIwfUD753ekVTZASl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEyMyBTYWx0ZWRfX8QxxWmjCKq9w
 yCVIuDqhvnfaQbMPCk51FIL6qNqiqj3Oa5fAd2FXZK99zxcW88VPPN+i2/D6KddyAGREQz/3j1m
 c709I51dZVecVI56hOsh7z6h4+knxmFXLUBSE8x2PgnBRX7mIicUDzDanX0xx3a+haSr1ZqLpIA
 zrovVeHyJSiXaZljFhfKFtvCtrEIuNmaz0VaVMDD5vizZOnYXHEp5pC5F/zSx9xXQDXOr9dVCyp
 2q5PhIDRSH8yAdn8U/32vg7SV5AOV2k2y3U9hQj7FYQcdOiIZT4rLKL2QKfb9wBMjES5Kwizmzf
 nhCY//39kq65tqj81dRtJC/0zwyhxFN1z6yrE7Hrd5DdcXloXJ7/PlUd6II/UDa1TUclyU3JV2Y
 yj0FbzbH7SHJ8E3OPkyhEclk6fUyN9a/TeknTNDdwtsxP/8aFVsY354n5C4xgSKhQ3einjqzHHv
 gI9hWZVknB81L7XmS/g==
X-Authority-Analysis: v=2.4 cv=FM0WBuos c=1 sm=1 tr=0 ts=69c416a3 cx=c_pps
 a=NH0nRcagBPXjbvxaFUBjlA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=9l1xXZdIrUM4gH9Rm-UA:9
X-Proofpoint-Spam-Reason: safe

Add support for using ALSA controls to trigger a factory calibration.
This is protected by a new Kconfig option so that it is only available
if explicitly enabled in the kernel. By default it is not enabled.

Factory calibration is normally done through debugfs files.
Google have requested that factory calibration can be performed by
repair shops. These repair shops only have access to the standard
"user" kernel, which does not include debugfs.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Changes in V2:
- Rename "Calibrate" control to "Calibrate Switch" to conform to naming
  convention for boolean controls.
- Mark "Calibrate Switch" control volatile.
- Cache the value written to the "CAL_AMBIENT" control so that a read will
  return the last set value.
- Return 1 from writing "CAL_AMBIENT" if the value was changed.
- Return 1 from writing the "Calibrate Switch" control to true because
  that always causes some activity in the amp.
- Replace use of the confusing in_range() with normal comparisons against
  limits and make the limits the same as the control definition.
- Simplify the code in cs35l56_calibrate_ctl_set(). It's a boolean so the
  value written to it is either false or true.

 include/sound/cs35l56.h           |  1 +
 sound/soc/codecs/Kconfig          | 13 +++++
 sound/soc/codecs/cs35l56-shared.c |  9 +++
 sound/soc/codecs/cs35l56.c        | 96 +++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.h        |  2 +
 5 files changed, 121 insertions(+)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 7ca25487030a..c3b10587cb4c 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -435,6 +435,7 @@ ssize_t cs35l56_cal_data_debugfs_read(struct cs35l56_base *cs35l56_base,
 ssize_t cs35l56_cal_data_debugfs_write(struct cs35l56_base *cs35l56_base,
 				       const char __user *from, size_t count,
 				       loff_t *ppos);
+int cs35l56_factory_calibrate(struct cs35l56_base *cs35l56_base);
 void cs35l56_create_cal_debugfs(struct cs35l56_base *cs35l56_base,
 				const struct cs35l56_cal_debugfs_fops *fops);
 void cs35l56_remove_cal_debugfs(struct cs35l56_base *cs35l56_base);
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index d6104796db4f..ca3e47db126e 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -921,6 +921,19 @@ config SND_SOC_CS35L56_CAL_SET_CTRL
 
 	  If unsure select "N".
 
+config SND_SOC_CS35L56_CAL_PERFORM_CTRL
+	bool "CS35L56 ALSA control to perform factory calibration"
+	default N
+	select SND_SOC_CS35L56_CAL_DEBUGFS_COMMON
+	help
+	  Allow performing factory calibration data through an ALSA
+	  control. It is recommended to use the debugfs method instead
+	  because debugfs has restricted access permissions.
+
+	  On most platforms this is not needed.
+
+	  If unsure select "N".
+
 config SND_SOC_CS35L56_TEST
 	tristate "KUnit test for Cirrus Logic cs35l56 driver" if !KUNIT_ALL_TESTS
 	depends on SND_SOC_CS35L56 && KUNIT
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index af87ebae98cb..e05d975ba794 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -1185,6 +1185,15 @@ ssize_t cs35l56_calibrate_debugfs_write(struct cs35l56_base *cs35l56_base,
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_calibrate_debugfs_write, "SND_SOC_CS35L56_SHARED");
 
+int cs35l56_factory_calibrate(struct cs35l56_base *cs35l56_base)
+{
+	if (!IS_ENABLED(CONFIG_SND_SOC_CS35L56_CAL_PERFORM_CTRL))
+		return -ENXIO;
+
+	return cs35l56_perform_calibration(cs35l56_base);
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_factory_calibrate, "SND_SOC_CS35L56_SHARED");
+
 ssize_t cs35l56_cal_ambient_debugfs_write(struct cs35l56_base *cs35l56_base,
 					  const char __user *from, size_t count,
 					  loff_t *ppos)
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 9d35797e000a..378017fcea10 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1109,6 +1109,88 @@ static int cs35l56_cal_data_ctl_set(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
+static int cs35l56_cal_ambient_ctl_get(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = cs35l56->ambient_ctl_value;
+
+	return 0;
+}
+
+static int cs35l56_cal_ambient_ctl_set(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm;
+	int temperature = ucontrol->value.integer.value[0];
+	int ret;
+
+	if (temperature == cs35l56->ambient_ctl_value)
+		return 0;
+
+	if ((temperature < 0) || (temperature > 40))
+		return -EINVAL;
+
+	dapm = cs35l56_power_up_for_cal(cs35l56);
+	if (IS_ERR(dapm))
+		return PTR_ERR(dapm);
+
+	ret = cs_amp_write_ambient_temp(&cs35l56->dsp.cs_dsp,
+					cs35l56->base.calibration_controls,
+					temperature);
+	cs35l56_power_down_after_cal(cs35l56);
+
+	if (ret)
+		return ret;
+
+	cs35l56->ambient_ctl_value = temperature;
+
+	return 1;
+}
+
+static int cs35l56_calibrate_ctl_get(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	/*
+	 * Allow reading because of user-side libraries that assume all
+	 * controls are readable. But always return false to prevent dumb
+	 * save-restore tools like alsactl accidentically triggering a
+	 * factory calibration when they restore.
+	 */
+	ucontrol->value.integer.value[0] = 0;
+
+	return 0;
+}
+
+static int cs35l56_calibrate_ctl_set(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm;
+	int ret;
+
+	if (ucontrol->value.integer.value[0] == 0)
+		return 0;
+
+	dapm = cs35l56_power_up_for_cal(cs35l56);
+	if (IS_ERR(dapm))
+		return PTR_ERR(dapm);
+
+	snd_soc_dapm_mutex_lock(dapm);
+	ret = cs35l56_factory_calibrate(&cs35l56->base);
+	snd_soc_dapm_mutex_unlock(dapm);
+	cs35l56_power_down_after_cal(cs35l56);
+	if (ret < 0)
+		return ret;
+
+	return 1;
+}
+
 static const struct snd_kcontrol_new cs35l56_cal_data_restore_controls[] = {
 	SND_SOC_BYTES_E("CAL_DATA", 0, sizeof(struct cirrus_amp_cal_data) / sizeof(u32),
 			cs35l56_cal_data_ctl_get, cs35l56_cal_data_ctl_set),
@@ -1117,6 +1199,14 @@ static const struct snd_kcontrol_new cs35l56_cal_data_restore_controls[] = {
 			SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE),
 };
 
+static const struct snd_kcontrol_new cs35l56_cal_perform_controls[] = {
+	SOC_SINGLE_EXT("CAL_AMBIENT", SND_SOC_NOPM, 0, 40, 0,
+		       cs35l56_cal_ambient_ctl_get, cs35l56_cal_ambient_ctl_set),
+	SOC_SINGLE_BOOL_EXT_ACC("Calibrate Switch", 0,
+				cs35l56_calibrate_ctl_get, cs35l56_calibrate_ctl_set,
+				SNDRV_CTL_ELEM_ACCESS_READWRITE | SNDRV_CTL_ELEM_ACCESS_VOLATILE),
+};
+
 VISIBLE_IF_KUNIT int cs35l56_set_fw_suffix(struct cs35l56_private *cs35l56)
 {
 	unsigned short vendor, device;
@@ -1290,6 +1380,12 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 						     ARRAY_SIZE(cs35l56_cal_data_restore_controls));
 	}
 
+	if (!ret && IS_ENABLED(CONFIG_SND_SOC_CS35L56_CAL_PERFORM_CTRL)) {
+		ret = snd_soc_add_component_controls(component,
+						     cs35l56_cal_perform_controls,
+						     ARRAY_SIZE(cs35l56_cal_perform_controls));
+	}
+
 	if (ret)
 		return dev_err_probe(cs35l56->base.dev, ret, "unable to add controls\n");
 
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index 36d239d571cd..cd71b23b2a3a 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -54,6 +54,8 @@ struct cs35l56_private {
 	bool sysclk_set;
 	u8 sdw_link_num;
 	u8 sdw_unique_id;
+
+	u8 ambient_ctl_value;
 };
 
 static inline struct cs35l56_private *cs35l56_private_from_base(struct cs35l56_base *cs35l56_base)
-- 
2.47.3

