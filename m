Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DBA306756;
	Tue, 12 May 2026 12:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589111; cv=fail; b=QFl6pVXTnGvfI0A58AEdz+otAyuDVwF7sMAjF1vhabc+PWPiTsdJCrjXejixES4dMj0cBjL11RYc7a/0lYTTVWtnudy55ioXNNP/M29gUT5Xj5t5Re99wGWNh/kYrVSk7S2ANmzhIaDTjPqtK2/DJ7S4fUnfDuTtTtJ2WTDflGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589111; c=relaxed/simple;
	bh=J+Zwd6580nijYh9Oo/DoLQUPI4WcZLwHoD7NAFIK684=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l3TFooGM4OQ5dUupRybq/SB93Uc2hDVfPTOzVFhw5+rogl52JFdzBVDgbbCH27/1FDAIhNY4a2fFh3nR4X/40ihfMx+Oy5Mrh5HMLCrwOTknHP4Vx5ngKpUzAvUbC8WYSjnbY71Qhpd0ehduZADQjpwTRkKhn4o3SwXMoRLIczQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ka78LgKA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NsqZl4w6; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ka78LgKA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NsqZl4w6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C7N6Hv1750921;
	Tue, 12 May 2026 07:31:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=rEA+noP8rR6MrW42
	m3xt5XXdTsneKH+jPnKOSWlTG20=; b=ka78LgKAIKUDujf+eYo582/Y3gmy9sXF
	5ZP7RNNNiABQU4++94TouQiN61nKJldzeJQvGg81OQwTCIJX+4JtRBcBYX2ByuZ5
	2sGh3M/xA11Rze76l50JrboJb7dMft9p4NaJYb7RfGDyzo5WfX0VQsPUO1hUuFL/
	1zlvmEFQS7yYb5m0mCM5Z1RAFfHWtoDC5zt/RvdwMXa7iqtWOhlL2JJpEjB1LalA
	VqHvaULJO3zjohhMAAnkkty4OCGtkcfhjG06cc6TG34qBR+crmYYoM0MnvGg+CxG
	ezGwbokdOP8nmXsw1jlpcWjbr+mectnPQgDjvZL6crtJFyFgOitzlg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023143.outbound.protection.outlook.com [40.93.201.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58vcn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 07:31:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbJYwjvcGVWyz492Nv02xzCOj6ah6x/gSoDcWuZKyZHcBobIVPfQjM7ol7w8+BeKKtx5hyu3mX9SZ5fjovW895S/J3Jk3B2f42qVhPDJ6UbSbaUpMwBpAOEco04b9rbU3tEG1uRkvdyLAkPGcMEURYRetSVZiKCGzSN/mIZ7eV5CVHXyDX26AXfpQUg8fFFPa2rbcNG4w+w8KLSdaNTBEsdbCoNNSeYqB3AA77Z/gaGFCjzrnLDO6KFGqLn7bCNx4Jkf6AhpSOqVHt5oZ18PuhINiKQfLe1sF+ADHnc6I+U8RVqNy4xb/FRRI9VwTWtSwYYfqpAqSGcv4llvh5k7oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEA+noP8rR6MrW42m3xt5XXdTsneKH+jPnKOSWlTG20=;
 b=XgM9rWHy2mQyW3VYjPvEvBI/X8p9p5JzWJz0+oMq/CR/8VSa+/tb+aWDoyoTzZcZmV8JQlmBUwgnlou8LYzijQR9cZH/gLL/uZTPlu8HcOBnL0nbhLZf4bYTRqKrIBM1qtnd5xhQQwdFGvh92hTtBtBi7ygMpDF+vdC8reF8YQ53CL8fPV8L2wrP3IHJGTDTC2choDDpKVRj01XvoBybnDO8k81PGARrIt6mqqKCMdrLrYdN4xxPaTCAqSnH48UVF4gUa0AgsHUy3tte1rxhSmv161a7CJxNkk/bkMGIR+7hu5Ki/J0VO8Zd6xk9tt1GrciILBTuZfSoKxe2IZjYcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEA+noP8rR6MrW42m3xt5XXdTsneKH+jPnKOSWlTG20=;
 b=NsqZl4w6EPASYNs/oNS5aIxyOzuNdjrXLjjOSSmSKPhwHHC6PpZjhI2m9AkbyjJHolNjGfUk+XORnfxgZUMiwySwBBfdWZPy/tNfBupCY7osLg3c9EAXGqeuyP7OFWC21zVByZqInpSVO4qPIUlMUD1hZ6ao3MY+9YLqQwOT17I=
Received: from CYZPR10CA0002.namprd10.prod.outlook.com (2603:10b6:930:8a::6)
 by LVUPR19MB997274.namprd19.prod.outlook.com (2603:10b6:408:3a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 12:31:31 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:930:8a:cafe::e3) by CYZPR10CA0002.outlook.office365.com
 (2603:10b6:930:8a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Tue,
 12 May 2026 12:31:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 12:31:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1C75640654F;
	Tue, 12 May 2026 12:31:27 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 048D5822549;
	Tue, 12 May 2026 12:31:27 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Abort TDM mask loop at maximum channel shift
Date: Tue, 12 May 2026 13:31:26 +0100
Message-ID: <20260512123126.260148-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|LVUPR19MB997274:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ed0e20ea-4bec-4e8d-3e9b-08deb02264cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700016|56012099003|18002099003|16102099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	BRKkYmXQPrmxFuTG3/XUk6ol8tyF/eqCXA/3oJJW4Td+3GJzerSwbcvrWV9ld1LgJgzll8i85qVUx2nrJ9UXRx2xL1J5Uy7Tg5HalkITUW+gZEIzdW0s3CMDu9cE6jdtwP/Banf/BuJYFIbffHB6+wwSXnkG796NkrMP4E48PZjg+drfJ1QoY8JU54Rtu9Uq1rWYUFgEjR5LSAeofI6/5074R/zp9LZ9+n0JZAs0CHGq9p3L5tOuA0NM2kY4FJPbCTGnvSV7qErTQgjjYKpNCH6mzslf5obMMCADLwDzok9zQn2VmyJ35Z2vEvNIW4wj+2nvMlXQVx5/n+bLuDbSCrbGnWk4OvbvAHzZ3VoFdFomMtV/FdVL56Fcly8Xuvrh/7/bORj1/KHhTAwlcXcTtjzJIwOvaEYHUOpI8bDFYmi2IV+//1rfrFIgMF37HP7SpEa3mEJs5bjqrG6gmZvYyfJ+iQwB0I4fvy94YE6Gr40CI1QKKbFmNdrM0M1TqgLPrODCE7Ch02j89QDXzqCZhqkkKuu/Qe2L2u/TVGuC5lSeM4yqPWsaZIIsKVVbGbvnXDfDdox2I4ruSqJmtkBOq1ilO/CsH23F9Bn7NB4yr2q4jRlkx9hUQH9c5skZzE6cnTNYAEdjq/sWZ8o8acRc+BNvqzsUuVyvbtTotV/hyH39RtAdBQCJFd7ErbMk7VloseCySuE1QrwDJk1C84llE+jPsJG++uNJEbDuTm6ry3U=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700016)(56012099003)(18002099003)(16102099003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9+RzK5WU2vNDCBJEqR3qyW6aP2PhTjd3zCiFBjCMblMn0QxY2l6GvJFsdiOFsQiL5cYz9q6quBWNLb4MuFni22iMliXmMzFV1EEN5XqiXA1ntxxhpbUU8jPcwM3RY4r030SDdyiYwN5Jr8oIqZFcnAtuuJpQLxOxKlbHgU2eeGmFOJlD7wkvIwsVAHUN4iJEXa84/WlTw7B8yreokT0xM2n06uNUjOLExyVbRx6JBT1f1iRJgcoamoR1ZvjsL4txigZtqOPSj1u5CH+bvYIKqJhErN9I1P4qShQffqIqetIqKTq4dIIaCv4nyq5Xi+g8sXWky6IcMUG2VNQNCzIYHBqKNL2spMicKr2yEfn9wlZ2K6hbIiuqWVpI7qYSXf3QpE6lnIZDQ7fUeHdKUx8/PRbami+MQtqHWVCeVufsdI66XeBhuyMseJ1qHbSkiqMK
X-Exchange-RoutingPolicyChecked:
	PsjK4W+56kJoPXMEdo5aQeCE5flRxpb6dy+rYlR89EMnRL8ycGMCU2wCfsCM1BOMi6bKDToHjhKAheYfcEKA9fFJ77c/Lf0iq332JKT39rV0Tpv5L6KnrWqmdOV6CCbaWEbwapA2tAhsayM83g4/XJOoSh53xfo/59tyxOrnBiMfFlSCiEW3gCinixWrGDGQ5kthSbneNwr2PNYfCn1Mgn3Nl8IgsS0TJZrhqockHiyl1Bh0W1F8Nl5m0bW/01Ohp2UelhUI7p2a1bOMDBMYty/LQtbzeG5e0uszr5V2kbpYzrEnu4ySv2mnXsya1jF5gP6Xk+8qABH0ft6rHmS03g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 12:31:29.4586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0e20ea-4bec-4e8d-3e9b-08deb02264cd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR19MB997274
X-Proofpoint-GUID: lR-Q1dA74IJj9ab9Zifv-AxXLY-TAiez
X-Proofpoint-ORIG-GUID: lR-Q1dA74IJj9ab9Zifv-AxXLY-TAiez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyOCBTYWx0ZWRfX/VD0aCgTKr6D
 O9QTfxwXIsGqe91JTY2Gght3aN8/5bjnXRK+0kcsbTaV3Z5HssXuKmJHnWkfYWNJsLQiyxcgIQv
 FbkUEd/3nPjzM+UZ645JXFQ0eXJPmQshjQllqC07kygnTKaA3zv5DIk73WcFCdlpovBYyUsY24Y
 tISoNLZLOg1Ait+Z8ugfJ1Bloqt4NGTBibqx5BuaXnnAxvd3q3JTMnJW75iS6dDMzocayyp/SRH
 2vW3WEhPnp5uG1F6SPQ5B4YmC75gpXTQ2yQi0P2Dpc/0mYR/0gR4xCZqxNO/9d+IWZmqRmqqqF8
 MrwT3wN7IzepaAjI4zO5X1kpb30ln6/dWCwqLFTsfozqAhVi3Slb1to/jNapOEGNfounwUD7b0e
 tvjpoLUcIjY+HUGAHtUURc71FGifEjcPx3gk08aiR+njJzYGbVyutbrvDKUb0Ktu5kjPDg7Stqf
 LWHmdqeQSM5Gzh3FOsg==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a031da7 cx=c_pps
 a=ZOsnctmsBCw54sLOPzIoIA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=sVqKItXSCGC2FCgOlMsA:9
X-Proofpoint-Spam-Reason: safe

Exit the for_each_set_bit() loop in cs35l56_make_tdm_config_word() after
all possible channel shifts have been done. This prevents going around
the loop with out-of-range shift values, which is technically undefined
behaviour. It also shuts up code analysis tools.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 4fbbdcc87151..80158913a60e 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -426,6 +426,8 @@ static unsigned int cs35l56_make_tdm_config_word(unsigned int reg_val, unsigned
 		reg_val &= ~(0x3f << channel_shift);
 		reg_val |= bit_num << channel_shift;
 		channel_shift += 8;
+		if (channel_shift > 24)
+			break;
 	}
 
 	return reg_val;
-- 
2.47.3

