Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D192531B830;
	Thu, 30 Apr 2026 10:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543910; cv=fail; b=M0V+l0GRpIT+is1P+a3J6dC7xZDniTBxbpc3dDx2eKT8wWf+uUjR7L/6GPltbE0D6pgBzvz+JCC1HPAgm+7lDUyimHGyfZd6RMycfaUsPSL3LXA5lUtmywDrOAmt+UNydmU2hebnmW2bs+fNRBfaGbNsHiG4MspyBukV6KBZgjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543910; c=relaxed/simple;
	bh=n9ltCyqVBMoZSFgCFbPkcdCRsT5rt1zVaFy3ISf9fUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iJvb3YaG8Nm9tMkV2gTzC2WOijLlbTU+nyswN8abrK+msxKn9JF88GyXuU69M3hjVkq15jeUQChEvh/fPNU72IGRlWAytFqT+OQlaWlhGUx645R2uqRhA+F4fPojDtIB9vspuWuiy5ZzrcrcWkD6hmxJ8iHr2A3Erc8blKtNXbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GlTNTv4w; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RnX5FSIO; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GlTNTv4w";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RnX5FSIO"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U4Yrcp687636;
	Thu, 30 Apr 2026 05:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=wSWxYv0ObJNyiyjv
	tEp03+auN8uZBh3APiUXTrDDoiY=; b=GlTNTv4w2JJ12jSaWlkSikw9JHT+74gK
	MA+ZEyFLNQLAznpU4YxrzlEFq+kA0gv8WvfDaxxnSOYi2vrXbUt7w3oDtjalx0Rl
	BKesTR57ao2DY+jDI7wmv0ZTlneBXqUlDNsk4WVhkw6Ngy8Wkqgwi90FXfDwlGFL
	VY3oTX9gf3fjuL3cRAHP0PAFeXIE5jruIxoiYID6ozC0mlOueqU315HbgT13X8CH
	7RUocro4j/Ul8RmTqkuKTFaMEmffyaxTBhBxRIBDESQRgzOn3K5LJFVL/sZCgWHq
	XCqIoEJql4D2o9S+uhG5FDuRoAqOwxqkgYkPFDkf2/9uZlRZ7E24GA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021140.outbound.protection.outlook.com [40.107.208.140])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4drt1jq008-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 05:11:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXUKpun9mH5WeaEeoLMxfZu3Dgq6KJsg1JDRmG4fMFJY7Qp/pgFro2n3cY8LQul1B4eiric25VbmhEh5jjSTdAjIateKZySWtZe7OrcHiENXqRn/QHbo5xccEiCcWLlu/DESwT0hZUjD+AsmL6f/bUFuvHcnDWYARFLS0ZP4CDJlRzdO3WJmFmNrIGJhBjOjAx9WwG/fyjfcCFrH7vq14vJaoIEXE3XMXLUxVfklvKBopVwyJ/N3+VLwoXJ5X6O6V3fI2BLBL/U3DcLuVHRGE5AxoqziAJJrKIHGaqVxyIcXEi+qVYD6MQlkPIzbPDpuHEQG3jJJDO286rrJ+1Tbrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSWxYv0ObJNyiyjvtEp03+auN8uZBh3APiUXTrDDoiY=;
 b=XrwB2NskOLpbFBZvgBwdyQcYAnH4Ghmysi+NhX3KcjpF1YXeobjzt28PKaTLyyveAkWk8PJ4vuZ4RptXwKX+l1bTIHTvxShbcQaXryZOEIkpOZ0RoZ3tdlknIfG0JuCKRw2vaJUbo49Owf7xKoQ3nC1qZqqdVnV9gwmDTTcFdSvfpWHhGzITtwFVXL2ZVDprAkn/VKn0LQjK6eoli9PIGGRMVFUA0rEFtMci5RgYpUN0opUUYmnOSV06VhLSPYuRHflbxozb6AP6t6jrD6PwSeRvPqz1Wi43L9FVzO54t88fcvgAeIE6qSWJNRCbeJIWDz0HXln4RR6ApB4ZEDjJYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSWxYv0ObJNyiyjvtEp03+auN8uZBh3APiUXTrDDoiY=;
 b=RnX5FSIONXkTgJTHKhXdF3X5zbfaS+vj8X25finW2hPqKWPZ7kV3DQDc5cVb/jB+D68LqM7+6LeLXZTafKtTRH1rb4y+lomX/oMbyAqVC8HQuzJHr9r3iZSuM0CbuVOJrhdbuAXH5R02IzFLcfXsV20vOvdf88bzyIhbgYh0ing=
Received: from BYAPR21CA0009.namprd21.prod.outlook.com (2603:10b6:a03:114::19)
 by SA6PR19MB8573.namprd19.prod.outlook.com (2603:10b6:806:40e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 10:11:36 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::88) by BYAPR21CA0009.outlook.office365.com
 (2603:10b6:a03:114::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.5 via Frontend Transport; Thu,
 30 Apr 2026 10:11:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 30 Apr 2026 10:11:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 72741406550;
	Thu, 30 Apr 2026 10:11:34 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 51C13820244;
	Thu, 30 Apr 2026 10:11:34 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Fix out-of-bounds in dev_err() in cs35l56_read_onchip_spkid()
Date: Thu, 30 Apr 2026 11:11:34 +0100
Message-ID: <20260430101134.2655938-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|SA6PR19MB8573:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dd809f5a-3672-4e90-e173-08dea6a0dcbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|376014|16102099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qk8PwJ5JCITOXaxnf6IQpvoNuH1Aw2S7QkkowSsid5SucDc+x8oKBRBBwES7UvHGazhxi21x/zzyXDd2+zYMiUwr1xj4VtVxLA/khMG9tFtRg4/JWnlD4oMmeiWgNhq+hr0A3glLKWr9eMU27QN2I49mBHsiA4f3nm1hM00Ih7ACSkqmFBPQnjrV46IDTXP5kxCSMcS7OMibMG7gu6yvPjF/K7k/7apT35ard1JNn9vRH4Ly4S8uHzO/mbxjo3nO0ZwCdMS9UNO4YPLjf6d2hy8xneFiyDKtvVM2s8NWpWtpIDpcpGpwes67n7Zgrj2vC/19g7YbvGVik2lJG+MF97nhNd/VvMZx185kTJh0UJdxkNXh4VRdVYQ1lodVYiI0hf7xDljg5qGZL9JvNbrQPCAKRLYabnyAx0nLHzyVeeVoAtaMeS+TcxZy+Ah1AEWwClnHqhtqGKk5d0XjOj73B5MFttuMstqmvXcGtGhJD+01izJSSu+7iyk/YdFJ/azgh/D3QGASYh5OnLjp2v3GQbeSzR0RWanSoL+HHW38NVO4+u2T1sjjX5qeRnDEIE+JqIuOEnmtV+JZaRJEKgl/YuXDtQVFurGCCMAw5MkHgoCmfttnAYN8pwqYOJDKC2eQDGJLmaOoZq6cJhsn45fwpqNLeZwW3/JqWXd2IwT5nbha+q7GkUJS4gxMpEZLKuVXwTb8pZ6mAP28MeVUUh7EQEkKtRHCKNJ3PeJVuuHb4QHruG7rlu8t2UaCCKruLnWiVw/HM760sPoD27AeWUNUBw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(376014)(16102099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZC9buXy7THEE0TJAEdoOruklTj87YHBOHFb5aOKjm2ebbik5WdwPpViA7m/VuI9RU14jBMNnhNCurSuNVKoFpQmTs8HTNpjPYhQVbKdvL3QsP0eISkapw57bArklrDXy9XlwucKhY8LaFSrWYtkjc/4lmZlid3e77jzLRk7NqxUmj2qLyLTSXK4oWdM7NRvyvxHPCf6ug1r7pMQYQ5STdfz/23tqK+87RUIADzb9pwW8TKXyphWrO8aPyGdih21Rzu4O4uNTkjNcJh2I1h5V1Bq31MZjphSodaL+5/SwPov/iLnBk2x/WxfSBbbJUCIoWEAWv1dKDSJhZdKcVr3BjhVKph2iYElxV8u3dOz8pPRNR9gaqEDFevXoMg3IYkHAOZxHhx26k6uOArNivYUfVnRaCflK4Pj5yj1xKoJMGXKbVj/ERU//esCd9RD5sc6U
X-Exchange-RoutingPolicyChecked:
	aOtJQCH2BwztnzHfPDn4dgzSGEh69pASkcRJrCZI6yczA75s2jwdpoLBrt4sNXHtzDDqXZchpq1nP2yWFbI1hKcwQw6nNKYBLWFJ5RFck5BkJvzLNjoVWOwrHKAOPYqk+8zR3YnWwIm7DtOWx9GADyq0wrrUokVdeAgdN49SYNMrBxMdaj7RJ/bquSsd0dVGc8Hdc09+iZstEswY5jz96Ehk9LdxgGBbOeDJ6j52xPpRTp3lstZXux/UxxSv0ik/EOTlZb6UbHb77cEXfDOvh0qQ7y0ON9QAkJg7QSlzGdTUFiCPFJUHH7FG2ERAUQPIIFCYcBcLj5qKqVyCbeTQig==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 10:11:35.8169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd809f5a-3672-4e90-e173-08dea6a0dcbb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8573
X-Authority-Analysis: v=2.4 cv=fbudDUQF c=1 sm=1 tr=0 ts=69f32adc cx=c_pps
 a=oqYjYovRwutaw0NExYmD7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=bQ_HQasWlRWHEXYxjnUA:9
X-Proofpoint-GUID: L7BbLBHQ0YZApq06wtUkR5fIy9uCMQdH
X-Proofpoint-ORIG-GUID: L7BbLBHQ0YZApq06wtUkR5fIy9uCMQdH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEwMiBTYWx0ZWRfXxis6jDhbMlcf
 6VLv0neI2P26H9bqFeh7SKhqIWaRiVkP4MF+fpJG2kET2+9Ao4rKkm/swJZKud+uiQmLtbIFOHB
 kjD39NaposXcL5rRoddou4Xrka1qjOJoXjiU3Y4BEAVWtVBNkmlOlF0lBXVYmSJTjCUU//yugtz
 4UHrdJ0LTRzjkCIAnxEO3U0I/28rkIgF5elqvWbTU05sd/YhGt4xpnIvGHDyOxEQlbBDwnhto5j
 TVrx4KAeKRS/aOP9F+wSr9cc3VrCV9cTdYJm/kn715NWPZUzO4z/QTqPGLPHc06PRi2rw+K45gx
 OhpGeiXsXEBoYxlcVl+uzzw01YDMnb6cHNI/ZyDCZytj9wRusvK68ZAYuhhyQ6q7z1wV54FScmF
 HdQ9jce71lqH64i6DyeNPD9ZdFeRS7lKevC0kG5hu+A+WC1OCiax+jOkfhA+nb5fmxhlWkTIyic
 9+Fcnkxhj/ikPXYV0fw==
X-Proofpoint-Spam-Reason: safe

Remove the incorrect use of onchip_spkid_gpios[i] in the dev_err() after
regmap_read() of CS35L56_GPIO_STATUS1 returns an error.

This dev_err() was incorrectly copy-pasted from one inside the for-loop,
where i was valid. The read of CS35L56_GPIO_STATUS1 isn't for a specific
GPIO register, so the use of onchip_spkid_gpios[i] in the error message is
both irrelevant and out-of-bounds here.

Fixes: 4d1e3e2c404d ("ASoC: cs35l56: Support for reading speaker ID from on-chip GPIOs")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index ea724101cdd1..795e2764d67e 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -1730,8 +1730,7 @@ int cs35l56_read_onchip_spkid(struct cs35l56_base *cs35l56_base)
 
 	ret = regmap_read(regmap, CS35L56_GPIO_STATUS1, &val);
 	if (ret) {
-		dev_err(cs35l56_base->dev, "GPIO%d status read failed: %d\n",
-			cs35l56_base->onchip_spkid_gpios[i] + 1, ret);
+		dev_err(cs35l56_base->dev, "GPIO status read failed: %d\n", ret);
 		return ret;
 	}
 
-- 
2.47.3

