Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9749A2BE02C;
	Tue, 10 Mar 2026 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152317; cv=fail; b=R9Voa2TGnOnWknW7SxlAvKKooEsL53Qv2dBiV1Mc99yNFTRTKEbOXttMX2YnIm846llXUWN8tkS95qHVFzRsXgqrtGptOjhMIb7KncYpQCO4PREgYHoKUjzdl+Tcf7ngYgk0rzY0XpB/1pKx3WLqTGzGe+Jdqaq/sP3B021oers=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152317; c=relaxed/simple;
	bh=D/NRZCpCxXwslE6a3coDsrvvJd9EQgTy/AuWee48y64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fENlWEeN7hUlBn0NDJYRCgEYuGJyfLKLhunmf+DOsrJ/1PXhpUZUbhYXcDenFELj79lzlkNLzCFM4/Igy3ZnvQltOPq47846h0oGQirdYHscB6PZN9o+pKLE3v6z70o8KnEzEQ2i4zUJ+UicTU9M9lEBA46w84EM4dwIqIap6GU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kVWDgHjq; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SVHLieP0; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kVWDgHjq";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SVHLieP0"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629Kvbt52288204;
	Tue, 10 Mar 2026 09:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TMfZNQj5XoBQfbGZFOl+QeCRn8aVNbzdblkvXnIRgZI=; b=
	kVWDgHjqtxyVjQBqySwZ1tbCmLaGCuAxR5Pad17+11TLijsbOTZdaCeodUGXSAKR
	q6bSLLh/2ocMm5+ocCvpHcx0L7DB7PQJHVenrynHtsL0G4M1JB7NzrY7/ElNWEtT
	FNKHJ/ONUgWfewNVk0eApnEtrZJprT1pPnILZsRjALHz8dN3aOftCSbMz1MkkPFp
	0BZmp4zQRp02V4F/vFaPpnq9CgueVR6oyb8fLoCQ5ooee8hrFG1Y5oE3W1+pS9PD
	2fqT3lshTs3CtdN4nGs9m4ly10u8FgooOASDgtO5dL5E3ZZ1iv/7oOAt5e3nxdx1
	GBWww8hU5orC0MkOcS94ZQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023078.outbound.protection.outlook.com [40.93.201.78])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4crja4bk23-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:18:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+8aDedpZtsTFqpTtjs5J3gSaxHtBxHymz13D4Ri+OKDIN9/VWA7N1ZqqjplGBuLU1C56/K56vTdRNzjqN4gPuGTGKCVBEqAxMheThx+Av9tvYQEuVtnPWOXXFWesJzmVH2r5xK2hP05KZWjVQEfQ4bTd+pFWwPf/8l5ehG2xj+2FgYLvZtcRongA/rY22Okz4LUOCKDwt4hB5/o2qU0Mq3/lcaB1LHcmjJSwmyIRztk0aEz/yLF9BPTsX8curcyc/XU+XgCbDyXJO8PB0jQx7t0kFYqrr7u8wKRU/TCEIWHNCfv8DsyYlld6tpuyxkHELvG1ELafCiNWWLD9V0xnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMfZNQj5XoBQfbGZFOl+QeCRn8aVNbzdblkvXnIRgZI=;
 b=dUYCIVWJ/Fu1Jt59HgWEsiKzHm5ZSK4UWB6g+qzjTl6uEx4CQjBnIBDcdO9L3u5D6Ug/P12Nboth8Fbf73aPSv1KVDrIB/+wCrXGbTH4L0hZwr8xDW9Y1N2frhiu4/K/1GvtzEu4NdxQjz0On8ETjAf2pusO2P34Y6tVNNNm0PiiBl8Tzrh0i7Tf+TSl328B+nbWBlTrOT7Mzk6WS5TY1E0wemS20vCvyaig6bT3edSYT+wByMli6Mmw/oGhfgzx8LbQsqpSJ/kJZ6BRLkfMYYymSSjmiiBKiFlwDdDZWUEs5OMQpboiL+8GEclbhj0qUSRKEkrCn35BkMHWhM0fpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMfZNQj5XoBQfbGZFOl+QeCRn8aVNbzdblkvXnIRgZI=;
 b=SVHLieP0ox1xDbYwBYQHfHzcRHzqnoAitNLyGyibYHgGm6vWQcnPJVWE2Yw2Vp3jruxdqmX+GeN4M00XSaZ78AY7zsm4GnstpXrnUczvvYEGo9AXV9KiQvO4SqHjIvSDWtw8mMT0prePXqf4yJqKDMi+C3Rn/sclEMUhMwBLBp8=
Received: from BN0PR08CA0020.namprd08.prod.outlook.com (2603:10b6:408:142::8)
 by SJ4PPFF15D02525.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a60) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 14:18:19 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:142:cafe::3c) by BN0PR08CA0020.outlook.office365.com
 (2603:10b6:408:142::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 14:18:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Tue, 10 Mar 2026 14:18:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AB225406542;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 794D9820257;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 01/10] ASoC: wm_adsp: Remove unused argument to wm_adsp_release_firmware_files()
Date: Tue, 10 Mar 2026 14:18:08 +0000
Message-ID: <20260310141817.1871794-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310141817.1871794-1-rf@opensource.cirrus.com>
References: <20260310141817.1871794-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|SJ4PPFF15D02525:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c9788e57-6473-41e5-e279-08de7eafe0b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|376014|54012099003|18002099003|22082099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	1mVdSTYxTZ/fmFsRjCOeIiJ//pxOO5FjgiooEadi6tiFW+2y1Lwxm3vLrIz8d5UdNAyENWZ601xA6IU4+OK+WvMJj19rvez5xAcvc6h6WhTnh2oVphAIsBQmrcdQmqnaNuLRv6n6b3Cp+HAfgMbGMlkwp5lZ5d9zMQSiSvbHpFUhJZ3Cih1L5NpApEGP4A47aMrVYDNxGAvPhgwwnIXHeoFNbKq285mYA4JumtXR3J9/OpA4lnJZU1h2h/Cc+vAsrAY+e59z1rgA20LE+shxgAUvcaR6vbUbX0BsmgH8TWqRTDPL8NZfwn81fnalITDfjtDyM+rvqGYm7KnkMNHYrFBA/HxU8gieZjgP1/8m2rY4TH2v/EC6k4LOsdZv9ioUp7Q/Ir1FtWA0gzmnAxCZZwr0C16RBxMM//yczDifFWveeQnLxK/qxbF/QhcKXOqEtIoP/uw2NbDWATyTWIRmYwQojtrUgyxxEkhqHcJRiSgVgcYo4LxAie6sVrfaQw9M8gDGMbgHgyyOz/9el+1xTO70AfnspBvHszTDBToOSXaHLC6QHJFBXYgFInbxZ9ix6WU0sh5BTyQcWdQqh5y0AlEmdoMmk19a/JQVBgKyWyGoUFvFMeerm3O/sqUgBkuNOcmRax9fCdBdQXtDac3eALEGi3JAMSo0BRabVEaPgmh1nUZg8imjkuTj3I2lWO7uwpF38Ykz9jteNXsfJtv5/juDba3oua4CdEw/4tfs4/9jyINLGkWPtMi7TbFbnK8vA+4CPeoEiuwWkXOv1w+kjg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(376014)(54012099003)(18002099003)(22082099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c5C+omhhDyxwFWxIbeOanHg/zctFLlevqP38pKE8YBwJ1n+3FUrXDC2BJ5LqOxKL164/4zEfSctP9MZvms9KXMNavfAYpkdTgWW61x/i4IIkvy04Lw8khqottLRV3bG4csAKuzjKW2PQADq/oY9Nr/JyOwPmHL+H8mC8w8pOdEURWkE36wZh1li6VYeKt0Z9fL4Lnanc29ZFSRfqZA+gVaQuSUsj/J1LmF8eEoomEOOzOLfuQ8qBGg3BM40fuEYjL88xCtioLLrRQG1P2l+h1YO1H4aJ4LT57FNr6pTIUKJbH/fPoWgJfViPpQp2EaN1YDTMQALQSxiCwt8HBOhGYx4q/V7gbQdyUIWj3O1XrjP9WNG3CLuxcffD0MtxbqhMFU5qCv6Rc1tjhO7eesvoDBFKtaogXf5JGHVEmIfldZkcgs8ZhFPa7D3fXJvpFfSS
X-Exchange-RoutingPolicyChecked:
	F0qdtJ3pAX9vXrvOQe8IFDYGyh7BWY8TE/pDAiG3LyZJFledhhjVff3zlMcbK+d0pkCgoQWqIG3ye3YrzTSj9GUZFNK2M3Bft9v9P28fuFRUphgAVNrNhXHCulMn6CwW+OAmMthMO7mLE+Hp7XaKwrYSDqUEyGeY9IN1vzcOXcQwy9geg2923DuIKoC8sc8YBzE3ULVJHA6+9e6tKMUnXi3Vjnxh134aEQypJkgLwNfBNvEM1LAgxAWlekE5ofg5U6htArj/JFASXIZqLtUb0Mn4zRdBzQNmpyy0+mPoMx/Flnchh2cgvwMOiSWIqnShOBgCngmvOPobAPtqU3GpmA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 14:18:18.5646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9788e57-6473-41e5-e279-08de7eafe0b8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPFF15D02525
X-Proofpoint-ORIG-GUID: 9qDv6hbI0qR0Uw9KxXLWoPgFdhMleuMJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfXxdZV4BlUod8Y
 LzjnQXyW5eknDy7qjILlniGjPUuQnmaYbeCMWMPncFxYMG3J3GlsFlNc1d1jTHfwamNhCMorN7D
 SudPCl5Bg0//QEeuuPZ1dTBShUUYro0QIkJQWbAOn5C8IBf1vPbE/1gGaoL22rfeRcl+b6o2INP
 /aezr/nwoinVLIyb1AoqNw/VkBmX0ABY8Z29NNxyPPRHo25nkuxELmlvjondIlJFeN4OOyLCyVO
 utGgVzubOLD0OOaoqodan97HtMKUhmwSGKSxL1Zz1gXEo31a6znZEHBRd03VOI56/7qs59VepDT
 yO2t6ThItP5FTDKGh027ynUGKq4ai/geUde/gNNCn1YOC//f1KtP556eddbevgr31mbixKy46iE
 xlzjnc8kRuit/B9mexaABLaSBgFBjg5+YBR8Lz+BL6jzTIZIDCkoTXtGQ8sSz+cReIZN1HyOOs2
 w3Np0ZL3F679AHFs/zQ==
X-Proofpoint-GUID: 9qDv6hbI0qR0Uw9KxXLWoPgFdhMleuMJ
X-Authority-Analysis: v=2.4 cv=WNVyn3sR c=1 sm=1 tr=0 ts=69b0282f cx=c_pps
 a=9iZSLGE8K+bgI2IRaGFjSQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=qKDmiOiLRtuvbdj9iSYA:9
X-Proofpoint-Spam-Reason: safe

The dsp argument to wm_adsp_release_firmware_files() isn't used so
remove it.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index f0aa6e3a1cfa..4b0c53d4f524 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -704,8 +704,7 @@ int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name, int type,
 }
 EXPORT_SYMBOL_GPL(wm_adsp_read_ctl);
 
-static void wm_adsp_release_firmware_files(struct wm_adsp *dsp,
-					   const struct firmware *wmfw_firmware,
+static void wm_adsp_release_firmware_files(const struct firmware *wmfw_firmware,
 					   char *wmfw_filename,
 					   const struct firmware *coeff_firmware,
 					   char *coeff_filename)
@@ -908,8 +907,7 @@ int wm_adsp1_event(struct snd_soc_dapm_widget *w,
 					    coeff_firmware, coeff_filename,
 					    wm_adsp_fw_text[dsp->fw]);
 
-		wm_adsp_release_firmware_files(dsp,
-					       wmfw_firmware, wmfw_filename,
+		wm_adsp_release_firmware_files(wmfw_firmware, wmfw_filename,
 					       coeff_firmware, coeff_filename);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
@@ -1011,8 +1009,7 @@ int wm_adsp_power_up(struct wm_adsp *dsp, bool load_firmware)
 			      wm_adsp_fw_text[dsp->fw]);
 
 err:
-	wm_adsp_release_firmware_files(dsp,
-				       wmfw_firmware, wmfw_filename,
+	wm_adsp_release_firmware_files(wmfw_firmware, wmfw_filename,
 				       coeff_firmware, coeff_filename);
 
 	return ret;
-- 
2.47.3

