Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEAC439014;
	Thu,  5 Feb 2026 16:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770310144; cv=fail; b=IPE1U6z11+3e2waKu9jF7Sb6INCZL4H1SxCxYXx6kWwZ3YnbQkk5o67I5utWX/krx6JgSlZotkoFnWJVB3AZY1sptAYs8Qr6xReSvjujgS92yas47H7/gkvDr/uAihsDKakz8L0z4oMlc9sgosf8Iw4Yan7X0yPQIHGFkZkHox0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770310144; c=relaxed/simple;
	bh=0ouQImyezvRKQoUay1ger2WZIsdkQmDW5VY9oWbnrQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N/MuNV6cfAmt9WVmF4iT5vAyFGDub+XZjjocu+xRoQ3iT1nXg83DXVfM9Bgj3SNUSnuM0GKxvdZ9PMH4zmJ4HYz9dExMsmNq2uzHlBuj1EmU/ZAIefn6Kd0ajsQKzcnB+bW7lYt4qzzft/Tgv1+jBDh/GO8KpQJflWtM9Q6kffI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DUW9n4ha; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=0Eo5CDJE; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DUW9n4ha";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="0Eo5CDJE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6155hIa4644219;
	Thu, 5 Feb 2026 10:48:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=G/gA8wwSHth6XSjEVD+/rrDkGPLlF5GtBRpUMvO8jDA=; b=
	DUW9n4hauuJnA3nKMtEYWbbeUdOq3Y7Uvov2nWOtRQdNZgMz8HHiCcko/+KxX/Md
	9ojIGmQya1QYtrcfssWDt4n0RUf3ZldPr5jw0Z7C23JGJFE95QDbgX8hGRiueelK
	XdsekfZG0R/ag2OFywiKzM6rHeahjY2J/sNy+62Vz3f5L2FZcAF6OIavhJOsnmUv
	oUZQQn/j2uw2wa/f4g0yhpeOeM54LyKPAaqXX5qnIP2P87IU2UYQNohewI59ljIj
	KXD6FVeJACUoXsNmjx/P0bhCpUdsSsHJtLNcKbyCgd/fia5xIC6VWvNlFi9MuRDY
	nQzwVh9yIE4iL3pefYXJ0w==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023131.outbound.protection.outlook.com [40.93.196.131])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4c1g12x7vu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Feb 2026 10:48:46 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTPxVWhgRgBPMkwPTmCGgnAQ+4AyZbMrrLs62+vH/F2Qevsww4dUYt6FNzrxDELil2zlQC4lw93rfMZat9ofihACdYdzRQrfWXdu7Rsrh12Kdty7V+Avxs2ieuqxas8aYV6qS30zG8OrisMiFUSIKNWbOE8/rD7Jbc5FlcdrT+flLWRvOhD7MuJcBP0xlcXFdP0q01JvlNcQJ+tBvygEZso23maFadizk5eUTognuhfUHmLMD7OPiY+NGQBBQQEpF4jkNjzyEP05FWe+UVMo6kwwUkA4x/mYNuj/jbCzRHX7ULi3iqKvYo91ETYv4OtSJtm2n37J3TtghAeFsaLb+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/gA8wwSHth6XSjEVD+/rrDkGPLlF5GtBRpUMvO8jDA=;
 b=HeITJDYjSmbziGBjd3HWBi4bBq/XHaekgQJmboXtjVd9Fl4Ul0S3tmsSREz+X30+F0jxaVbR0wtcfwuz5HTl6sI8TnBfbBndC+khUWGTdAJAbkcyw5JEXt9Y02Tf3yhK1kMhMmk9fUd6u1jHSCgk0iYhzDBn6EUy7uk5eYh535DOJJALXq2eTu67D6rwckDXunBp+lA0R4267yp/zy8r3m8kdZmtWqYVTorrAofYwGiH5RqRtnldXvWVuy3CzQpBFftAcn0E8PaaJKKZC6R5Uk2gwMtlsL5omyJaOcRysiyboGwhqHMQac2AzgWwazBSNsxN8UtElsRNhiYim6LdlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/gA8wwSHth6XSjEVD+/rrDkGPLlF5GtBRpUMvO8jDA=;
 b=0Eo5CDJE5VcA3JQEHwxUvZitEaPaCB7F+d0nmqvvRcYFNRnOYYMtP3xcijun7WSW8EUQ2qM75wZLhGiWXP0noKMGs3fPoQqg8snZh7ZALtjmsf8leAJiF/eh5eQWsHuI3PaTrQweHu8Qitf6gBq3xuZdskq8vHx3Y7JTR9W/ALM=
Received: from SJ0PR03CA0064.namprd03.prod.outlook.com (2603:10b6:a03:331::9)
 by SJ4PPFEFEBC5103.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a5f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Thu, 5 Feb
 2026 16:48:40 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::db) by SJ0PR03CA0064.outlook.office365.com
 (2603:10b6:a03:331::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Thu,
 5 Feb 2026 16:48:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Thu, 5 Feb 2026 16:48:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B374E40654F;
	Thu,  5 Feb 2026 16:48:38 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9948582026B;
	Thu,  5 Feb 2026 16:48:38 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/3] ASoC: cs35l56-shared: KUnit tests for onchip speaker ID gpios
Date: Thu,  5 Feb 2026 16:48:37 +0000
Message-ID: <20260205164838.1611295-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205164838.1611295-1-rf@opensource.cirrus.com>
References: <20260205164838.1611295-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|SJ4PPFEFEBC5103:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8d9aa4fd-83af-4002-53a1-08de64d66a82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aLu+UDa8Lnc1vUascwG/e9ahvzgfm/mTPErtHgVLMQnylbMqyh0SFLMPz8U9?=
 =?us-ascii?Q?MRdpJJCKtV9RQZDIb0ag3IdmJWI/9XXOWugnjnUqR7vy6010pzIOD7R3mhvu?=
 =?us-ascii?Q?9/ohybZxD50+ggudk/Erke6cHBipo1PufnfIAS8yzzqbIKPeif4oj/8VwNzr?=
 =?us-ascii?Q?Agr5ZEvWda55nOCeCCGjVd3KiKyY2f4iU6zsdlFbjv3AaXxXyhhezwVSpcvs?=
 =?us-ascii?Q?JnXcWRdgTBIwHEQBm1O3UtzdXbs24jWRjqWrLSunOgw0BogNTSKENRvqsLN+?=
 =?us-ascii?Q?RNM2JhhebIKx5bXQ4AOEeOfs5apRCJMoqvFwAD5zc5Y5UuU1X7h5ppMEsnCS?=
 =?us-ascii?Q?CpXnfDeJ0M9gj5UUnX7gUCct/9rezqmHbD7IVW5C4vnYhX8IWbc75hVx/EeN?=
 =?us-ascii?Q?KVJriWCeLSIZl20FhBm/XAdBWb2eDpcyqKI852iIbmWpmh7MBGt/fRfhmCCN?=
 =?us-ascii?Q?mV1kTYuvImUGBpHt9p1OkObLPAtL/+Rp0iZOrj/OitIUhd1JOAy5awYidpTF?=
 =?us-ascii?Q?UtuWabHKG+2A8U5dalHp3yyHsqKJQ/zvOGq/kDw0d1RhzohZGNyIj3YLYG76?=
 =?us-ascii?Q?YFynIgVQGqJpv1kj0/0YKJZlXfGLC42G/zwjGDlQHs19k5ozJaMqMpxEl9t+?=
 =?us-ascii?Q?cVU1ui2IFspa0z5iBEPcWI0d+m3rUy3Sk2UrAZSrRL30bcqUCPtSmtJOLQT/?=
 =?us-ascii?Q?a+pcXULYxVxEKCFD0S1IS/k9YivaTzjfywoQIGk8bJxzNNjl+LKtUFr3irTp?=
 =?us-ascii?Q?rCzaSM7Qv0iUFz3H6ctXKI8yzxKww4oR7//qfLJUjN9v8ZpzeYzO3CAWklCK?=
 =?us-ascii?Q?LZlF6tFnZol8ahxjY8TmZc8Zij+aXe7b98pg/7YC4qeTy2FXsEmdt3zCgTs2?=
 =?us-ascii?Q?KsaOs2Mp3KfZYQSYTsL8m3KgAkQ+zmC4hf9nZ0R4KtbLr2bT4sDcjFlruAAk?=
 =?us-ascii?Q?2BmnLPfupn2B9k8aWPhVRumLRwjOj+EqSyLqbpfeqxHz6j/E2bU41pJpiYdW?=
 =?us-ascii?Q?vQTgTDzvG2q33OwO90SH7W3j0SrlyVvazpOe1SZvBDCgo+SFsmATokTOgKYE?=
 =?us-ascii?Q?5s/oubx5qrITU/hNVTW7G9H9xdqGP8cNtAy2E/KLc5VzpGHRZZ/zz6C5CgzQ?=
 =?us-ascii?Q?k/4oQnnE0cr3u38Tc55WYogqawbpj6SCe9KfNU/ySSqB2Qv70QduklJZlHf4?=
 =?us-ascii?Q?vYtm0uKTvMGxYZxVIcmVS6yJVXwwiosM+x3+O1esbOLCCbydrfuhd522cL4p?=
 =?us-ascii?Q?xKm0HHaq8xTEzEFbotNGpOoYKuBOHw0ajJNddsDf/9CzjYUF2rGy106Ar/26?=
 =?us-ascii?Q?R977bwvsPngQQxfBCn4LL2fZbI4FFBi9FLevS/ZUX7KVOlX3NkFPDk9KKFUw?=
 =?us-ascii?Q?1lV9rCKyudQNwMDtEcMPkyis07d5CNCU8g6sVZLDH1uZ9gFjN9R/fTRIXSas?=
 =?us-ascii?Q?ha9DvsOZcrQda76CnJTQdrsQDvdzenhzY7Y2iMND4JaHo1YNFqp4pK/Mridb?=
 =?us-ascii?Q?znAKMjttgKg4vaOK8m4g3q+oBYtbvFGA8h11azR+WapDskXVkVZ9Tj6pBCuO?=
 =?us-ascii?Q?Ih+s4YL780TprA63Alu1jRWb0mwFQN51fiwkuTPXDvFcytn+65IhTavXq5Jo?=
 =?us-ascii?Q?AZwZZuXb5gyPCLN5/+Ww4eisfzhRan+X2d8dm0WzkJHyn9y1gab0B94TrtPN?=
 =?us-ascii?Q?U6PXyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AmG5626VAzMnvyd6Gcrq1wjbJRbPsoP5EkFYRV9dq9v5HEZ6Ek0f7P2PILq7csERULzjeVK8v+Yk4nhO6qg4cQRwEPwfz4dNtEhVp77ZcQNHFWE8aLX7qkQH01n+HFvJI5dyUlPrPjFkvPl5ETggSrMOGqolwbEcSUhDFHeS8v/I9tI19MHBuo8GKCwL/W9/m5oldXVa9sBIuI5AmK/sVIQumDPd/LtRf6N+ezlCoHzAW8OhTM8xH04Ea2olAICyYLkSJiA7xd12oyc7s5IGcodOYmawn9HdkwVTZRI84GdZ2iH47fx7aoDw/T0uQY8eZ5/q/CklWfw0aiDagR2/oxMGn8kdCyhofEUonRVk2iMPNVA2FLl9sKckVBRFVcjSkfsKx5TLkTtaJb4bj74UDJkfS/dbjL2woIqJY7gCEF4e8tH6FBr+t7oVEzA65+u6
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:48:40.1080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9aa4fd-83af-4002-53a1-08de64d66a82
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPFEFEBC5103
X-Proofpoint-GUID: 8nCORmipqMiuvPG7M5RqSSqbWLpH9ghZ
X-Authority-Analysis: v=2.4 cv=Mdthep/f c=1 sm=1 tr=0 ts=6984c9ee cx=c_pps
 a=BJVTd8GDi1tipuH6XGV+IA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=hg5lxr8L_Hq_N_W_to4A:9
X-Proofpoint-ORIG-GUID: 8nCORmipqMiuvPG7M5RqSSqbWLpH9ghZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEyNyBTYWx0ZWRfX7TpvZtVbl4ks
 JisvR4D2d2wWFzg+h4745dIBITKHLt+aFRwnwgsMmJ2Yq3xgkReX6vf/UGra5yttPknsgej5o6m
 MYSvQIHhBcAdhR7eWV5LHEcbeiOSe4O3IBcErSQIe7vHHmDgBCz74maYckkVDghLWNeW5jX4hfl
 AG4tm72LpgXs7Puhn83cAVnoCB/alay4bJ/VVygejDG6DRIlXRAqa/1ralfFKOdfTYxDeSoFoFZ
 RmScaMkO2/+Or2VRXXSkg+KGgrRAdV9fxSijKTYiN7sNuZ4EcB7cyAgwscCidaPbxLml4FegUBJ
 JFefI28dKyE9xHxSAhW7aiga/O+FFDjLdBT5XZOEisvnDcdU+GnyO8I0daZVipx05/JTZtsN6NN
 eW2RNTNAtjuhcadWecjaGNQvuaW4pPmXQy70sOQ6AMjCWsEiHeIWstQQok7Sjz4oKeYzkQLfHOf
 27K6X0OfJdBGLyKey5Q==
X-Proofpoint-Spam-Reason: safe

Add KUnit testing of:
 cs35l56_check_and_save_onchip_spkid_gpios()
 cs35l56_configure_onchip_spkid_pads()
 cs35l56_read_onchip_spkid()

The test consists of:

- A mock regmap that simulates the pad and pin config registers.

- Parameterization of the pin list, pulls list, a simulated value for
  each pin and the speaker ID value that this should produce.

- A self-test of the simulated pin and GPIO registers.

- A test that the value returned by cs35l56_read_onchip_spkid() is
  correct.

- A test that the pin pull-up/down are set correctly by
  cs35l56_configure_onchip_spkid_pads()

- A test that cs35l56_configure_onchip_spkid_pads() and
  cs35l56_read_onchip_spkid(0 return the expected values if
  cs35l56_base->num_onchip_spkid_gpios == 0.

- A test that cs35l56_check_and_save_onchip_spkid_gpios() saves
  the configuration.

- A test that cs35l56_check_and_save_onchip_spkid_gpios() rejects
  illegal GPIO numbers.

- A test that cs35l56_check_and_save_onchip_spkid_gpios() rejects
  illegal pull types.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/Kconfig               |  14 +
 sound/soc/codecs/Makefile              |   2 +
 sound/soc/codecs/cs35l56-shared-test.c | 680 +++++++++++++++++++++++++
 sound/soc/codecs/cs35l56-shared.c      |   5 +
 4 files changed, 701 insertions(+)
 create mode 100644 sound/soc/codecs/cs35l56-shared-test.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index e78ac302da15..adb3fb923be3 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -936,6 +936,20 @@ config SND_SOC_CS35L56_TEST
 	help
 	  This builds KUnit tests for the Cirrus Logic cs35l56
 	  codec driver.
+
+	  For more information on KUnit and unit tests in general,
+	  please refer to the KUnit documentation in
+	  Documentation/dev-tools/kunit/.
+	  If in doubt, say "N".
+
+config SND_SOC_CS35L56_SHARED_TEST
+	tristate "KUnit test for Cirrus Logic cs35l56-shared" if !KUNIT_ALL_TESTS
+	depends on SND_SOC_CS35L56_SHARED && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds KUnit tests for the Cirrus Logic cs35l56-shared
+	  module.
+
 	  For more information on KUnit and unit tests in general,
 	  please refer to the KUnit documentation in
 	  Documentation/dev-tools/kunit/.
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index c9e3b813653d..3ddee5298721 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -77,6 +77,7 @@ snd-soc-cs35l45-spi-y := cs35l45-spi.o
 snd-soc-cs35l45-i2c-y := cs35l45-i2c.o
 snd-soc-cs35l56-y := cs35l56.o
 snd-soc-cs35l56-shared-y := cs35l56-shared.o
+snd-soc-cs35l56-shared-test-y := cs35l56-shared-test.o
 snd-soc-cs35l56-i2c-y := cs35l56-i2c.o
 snd-soc-cs35l56-spi-y := cs35l56-spi.o
 snd-soc-cs35l56-sdw-y := cs35l56-sdw.o
@@ -512,6 +513,7 @@ obj-$(CONFIG_SND_SOC_CS35L45_SPI)	+= snd-soc-cs35l45-spi.o
 obj-$(CONFIG_SND_SOC_CS35L45_I2C)	+= snd-soc-cs35l45-i2c.o
 obj-$(CONFIG_SND_SOC_CS35L56)	+= snd-soc-cs35l56.o
 obj-$(CONFIG_SND_SOC_CS35L56_SHARED)	+= snd-soc-cs35l56-shared.o
+obj-$(CONFIG_SND_SOC_CS35L56_SHARED_TEST) += snd-soc-cs35l56-shared-test.o
 obj-$(CONFIG_SND_SOC_CS35L56_I2C)	+= snd-soc-cs35l56-i2c.o
 obj-$(CONFIG_SND_SOC_CS35L56_SPI)	+= snd-soc-cs35l56-spi.o
 obj-$(CONFIG_SND_SOC_CS35L56_SDW)	+= snd-soc-cs35l56-sdw.o
diff --git a/sound/soc/codecs/cs35l56-shared-test.c b/sound/soc/codecs/cs35l56-shared-test.c
new file mode 100644
index 000000000000..94db02aef7dc
--- /dev/null
+++ b/sound/soc/codecs/cs35l56-shared-test.c
@@ -0,0 +1,680 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// KUnit test for the Cirrus Logic cs35l56-shared module.
+//
+// Copyright (C) 2026 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+#include <kunit/resource.h>
+#include <kunit/test.h>
+#include <kunit/static_stub.h>
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/device/faux.h>
+#include <linux/module.h>
+#include <linux/random.h>
+#include <linux/regmap.h>
+#include <linux/seq_buf.h>
+#include <sound/cs35l56.h>
+
+struct cs35l56_shared_test_priv {
+	struct kunit *test;
+	struct faux_device *amp_dev;
+	struct regmap *registers;
+	struct cs35l56_base *cs35l56_base;
+	u8 applied_pad_pull_state[CS35L56_MAX_GPIO];
+};
+
+struct cs35l56_shared_test_param {
+	int spkid_gpios[4];
+	int spkid_pulls[4];
+	unsigned long gpio_status;
+	int spkid;
+};
+
+KUNIT_DEFINE_ACTION_WRAPPER(faux_device_destroy_wrapper, faux_device_destroy,
+			    struct faux_device *)
+
+KUNIT_DEFINE_ACTION_WRAPPER(regmap_exit_wrapper, regmap_exit, struct regmap *)
+
+static const struct regmap_config cs35l56_shared_test_mock_registers_regmap = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = CS35L56_DSP1_PMEM_5114,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+static const struct regmap_bus cs35l56_shared_test_mock_registers_regmap_bus = {
+	/* No handlers because it is always in cache-only */
+};
+
+static unsigned int cs35l56_shared_test_read_gpio_status(struct cs35l56_shared_test_priv *priv)
+{
+	const struct cs35l56_shared_test_param *param = priv->test->param_value;
+	unsigned int reg_offs, pad_cfg, val;
+	unsigned int status = 0;
+	unsigned int mask = 1;
+
+	for (reg_offs = 0; reg_offs < CS35L56_MAX_GPIO * sizeof(u32); reg_offs += sizeof(u32)) {
+		regmap_read(priv->registers, CS35L56_SYNC_GPIO1_CFG + reg_offs, &pad_cfg);
+		regmap_read(priv->registers, CS35L56_GPIO1_CTRL1 + reg_offs, &val);
+
+		/* Only read a value if set as an input pin and as a GPIO */
+		val &= (CS35L56_GPIO_DIR_MASK | CS35L56_GPIO_FN_MASK);
+		if ((pad_cfg & CS35L56_PAD_GPIO_IE) &&
+		    (val == (CS35L56_GPIO_DIR_MASK | CS35L56_GPIO_FN_GPIO)))
+			status |= (param->gpio_status & mask);
+
+		mask <<= 1;
+	}
+
+	return status;
+}
+
+static int cs35l56_shared_test_updt_gpio_pres(struct cs35l56_shared_test_priv *priv,
+					      unsigned int reg, unsigned int val)
+{
+	int i, ret;
+
+	ret = regmap_write(priv->registers, reg, val);
+	if (ret)
+		return ret;
+
+	if (val & CS35L56_UPDT_GPIO_PRES) {
+		/* Simulate transferring register state to internal latches */
+		for (i = 0; i < ARRAY_SIZE(priv->applied_pad_pull_state); i++) {
+			reg = CS35L56_SYNC_GPIO1_CFG + (i * sizeof(u32));
+			regmap_read(priv->registers, reg, &val);
+			val = FIELD_GET(CS35L56_PAD_GPIO_PULL_MASK, val);
+			priv->applied_pad_pull_state[i] = val;
+		}
+	}
+
+	return 0;
+}
+
+static int cs35l56_shared_test_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct cs35l56_shared_test_priv *priv = context;
+
+	switch (reg) {
+	case CS35L56_SYNC_GPIO1_CFG ... CS35L56_ASP2_DIO_GPIO13_CFG:
+	case CS35L56_GPIO1_CTRL1 ... CS35L56_GPIO13_CTRL1:
+		return regmap_read(priv->registers, reg, val);
+	case CS35L56_UPDATE_REGS:
+		*val = 0;
+		return 0;
+	case CS35L56_GPIO_STATUS1:
+		*val = cs35l56_shared_test_read_gpio_status(priv);
+		return 0;
+	default:
+		kunit_fail_current_test("Bad regmap read address %#x\n", reg);
+		return -EINVAL;
+	}
+}
+
+static int cs35l56_shared_test_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct cs35l56_shared_test_priv *priv = context;
+
+	switch (reg) {
+	case CS35L56_UPDATE_REGS:
+		return cs35l56_shared_test_updt_gpio_pres(priv, reg, val);
+	case CS35L56_SYNC_GPIO1_CFG ... CS35L56_ASP2_DIO_GPIO13_CFG:
+	case CS35L56_GPIO1_CTRL1 ... CS35L56_GPIO13_CTRL1:
+		return regmap_write(priv->registers, reg, val);
+	default:
+		kunit_fail_current_test("Bad regmap write address %#x\n", reg);
+		return -EINVAL;
+	}
+}
+
+static const struct regmap_bus cs35l56_shared_test_regmap_bus = {
+	.reg_read = cs35l56_shared_test_reg_read,
+	.reg_write = cs35l56_shared_test_reg_write,
+	.reg_format_endian_default = REGMAP_ENDIAN_LITTLE,
+	.val_format_endian_default = REGMAP_ENDIAN_LITTLE,
+};
+
+/*
+ * Self-test that the mock GPIO registers obey the configuration bits.
+ * Other tests rely on the mocked registers only returning a GPIO state
+ * if the pin is correctly set as a GPIO input.
+ */
+static void cs35l56_shared_test_mock_gpio_status_selftest(struct kunit *test)
+{
+	const struct cs35l56_shared_test_param *param = test->param_value;
+	struct cs35l56_shared_test_priv *priv = test->priv;
+	struct cs35l56_base *cs35l56_base = priv->cs35l56_base;
+	unsigned int reg, val;
+
+	KUNIT_ASSERT_NOT_NULL(test, param);
+
+	/* Set all pins non-GPIO and output. Mock GPIO_STATUS should read 0 */
+	for (reg = CS35L56_GPIO1_CTRL1; reg <= CS35L56_GPIO13_CTRL1; reg += sizeof(u32))
+		KUNIT_ASSERT_EQ(test, 0, regmap_write(priv->registers, reg, 0));
+
+	/* Set all pads as inputs */
+	for (reg = CS35L56_SYNC_GPIO1_CFG; reg <= CS35L56_ASP2_DIO_GPIO13_CFG; reg += sizeof(u32))
+		KUNIT_ASSERT_EQ(test, 0, regmap_write(priv->registers, reg, CS35L56_PAD_GPIO_IE));
+
+	KUNIT_ASSERT_EQ(test, 0, regmap_read(cs35l56_base->regmap, CS35L56_GPIO_STATUS1, &val));
+	KUNIT_EXPECT_EQ(test, val, 0);
+
+	/* Set all pins as GPIO outputs. Mock GPIO_STATUS should read 0 */
+	for (reg = CS35L56_GPIO1_CTRL1; reg <= CS35L56_GPIO13_CTRL1; reg += sizeof(u32))
+		KUNIT_ASSERT_EQ(test, 0, regmap_write(priv->registers, reg, CS35L56_GPIO_FN_GPIO));
+
+	KUNIT_ASSERT_EQ(test, 0, regmap_read(cs35l56_base->regmap, CS35L56_GPIO_STATUS1, &val));
+	KUNIT_EXPECT_EQ(test, val, 0);
+
+	/* Set all pins as non-GPIO inputs. Mock GPIO_STATUS should read 0 */
+	for (reg = CS35L56_GPIO1_CTRL1; reg <= CS35L56_GPIO13_CTRL1; reg += sizeof(u32))
+		KUNIT_ASSERT_EQ(test, 0, regmap_write(priv->registers, reg, CS35L56_GPIO_DIR_MASK));
+
+	KUNIT_ASSERT_EQ(test, 0, regmap_read(cs35l56_base->regmap, CS35L56_GPIO_STATUS1, &val));
+	KUNIT_EXPECT_EQ(test, val, 0);
+
+	/* Set all pins as GPIO inputs. Mock GPIO_STATUS should match param->gpio_status */
+	for (reg = CS35L56_GPIO1_CTRL1; reg <= CS35L56_GPIO13_CTRL1; reg += sizeof(u32))
+		KUNIT_ASSERT_EQ(test, 0,
+				regmap_write(priv->registers, reg,
+					     CS35L56_GPIO_DIR_MASK | CS35L56_GPIO_FN_GPIO));
+
+	KUNIT_ASSERT_EQ(test, 0, regmap_read(cs35l56_base->regmap, CS35L56_GPIO_STATUS1, &val));
+	KUNIT_EXPECT_EQ(test, val, param->gpio_status);
+
+	/* Set all pads as outputs. Mock GPIO_STATUS should read 0 */
+	for (reg = CS35L56_SYNC_GPIO1_CFG; reg <= CS35L56_ASP2_DIO_GPIO13_CFG; reg += sizeof(u32))
+		KUNIT_ASSERT_EQ(test, 0, regmap_write(priv->registers, reg, 0));
+
+	KUNIT_ASSERT_EQ(test, 0, regmap_read(cs35l56_base->regmap, CS35L56_GPIO_STATUS1, &val));
+	KUNIT_EXPECT_EQ(test, val, 0);
+}
+
+/* Test that the listed chip pins are assembled into a speaker ID integer. */
+static void cs35l56_shared_test_get_onchip_speaker_id(struct kunit *test)
+{
+	const struct cs35l56_shared_test_param *param = test->param_value;
+	struct cs35l56_shared_test_priv *priv = test->priv;
+	struct cs35l56_base *cs35l56_base = priv->cs35l56_base;
+	unsigned int i, reg;
+
+	/* Set all pins non-GPIO and output */
+	for (reg = CS35L56_GPIO1_CTRL1; reg <= CS35L56_GPIO13_CTRL1; reg += sizeof(u32))
+		KUNIT_ASSERT_EQ(test, 0, regmap_write(priv->registers, reg, 0));
+
+	for (reg = CS35L56_SYNC_GPIO1_CFG; reg <= CS35L56_ASP2_DIO_GPIO13_CFG; reg += sizeof(u32))
+		KUNIT_ASSERT_EQ(test, 0, regmap_write(priv->registers, reg, 0));
+
+	/* Init GPIO array */
+	for (i = 0; i < ARRAY_SIZE(param->spkid_gpios); i++) {
+		if (param->spkid_gpios[i] < 0)
+			break;
+
+		cs35l56_base->onchip_spkid_gpios[i] = param->spkid_gpios[i] - 1;
+		cs35l56_base->num_onchip_spkid_gpios++;
+	}
+
+	cs35l56_base->num_onchip_spkid_pulls = 0;
+
+	KUNIT_EXPECT_EQ(test, cs35l56_configure_onchip_spkid_pads(cs35l56_base), 0);
+	KUNIT_EXPECT_EQ(test, cs35l56_read_onchip_spkid(cs35l56_base), param->spkid);
+}
+
+/* Test that the listed chip pins and the corresponding pads are configured correctly. */
+static void cs35l56_shared_test_onchip_speaker_id_pad_config(struct kunit *test)
+{
+	const struct cs35l56_shared_test_param *param = test->param_value;
+	struct cs35l56_shared_test_priv *priv = test->priv;
+	struct cs35l56_base *cs35l56_base = priv->cs35l56_base;
+	unsigned int i, reg, val;
+
+	/* Init values in all pin registers */
+	for (reg = CS35L56_GPIO1_CTRL1; reg <= CS35L56_GPIO13_CTRL1; reg += sizeof(u32))
+		KUNIT_ASSERT_EQ(test, 0, regmap_write(priv->registers, reg, 0));
+
+	for (reg = CS35L56_SYNC_GPIO1_CFG; reg <= CS35L56_ASP2_DIO_GPIO13_CFG; reg += sizeof(u32))
+		KUNIT_ASSERT_EQ(test, 0, regmap_write(priv->registers, reg, 0));
+
+	/* Init GPIO array */
+	for (i = 0; i < ARRAY_SIZE(param->spkid_gpios); i++) {
+		if (param->spkid_gpios[i] < 0)
+			break;
+
+		cs35l56_base->onchip_spkid_gpios[i] = param->spkid_gpios[i] - 1;
+		cs35l56_base->num_onchip_spkid_gpios++;
+	}
+
+	/* Init pulls array */
+	for (i = 0; i < ARRAY_SIZE(param->spkid_pulls); i++) {
+		if (param->spkid_pulls[i] < 0)
+			break;
+
+		cs35l56_base->onchip_spkid_pulls[i] = param->spkid_pulls[i];
+		cs35l56_base->num_onchip_spkid_pulls++;
+	}
+
+	KUNIT_EXPECT_EQ(test, cs35l56_configure_onchip_spkid_pads(cs35l56_base), 0);
+
+	for (i = 0; i < ARRAY_SIZE(param->spkid_gpios); i++) {
+		if (param->spkid_gpios[i] < 0)
+			break;
+
+		/* Pad should be an input */
+		reg = CS35L56_SYNC_GPIO1_CFG + ((param->spkid_gpios[i] - 1) * sizeof(u32));
+		KUNIT_EXPECT_EQ(test, regmap_read(priv->registers, reg, &val), 0);
+		KUNIT_EXPECT_EQ(test, val & CS35L56_PAD_GPIO_IE, CS35L56_PAD_GPIO_IE);
+
+		/* Specified pulls should be set, others should be none */
+		if (i < cs35l56_base->num_onchip_spkid_pulls) {
+			KUNIT_EXPECT_EQ(test, val & CS35L56_PAD_GPIO_PULL_MASK,
+					FIELD_PREP(CS35L56_PAD_GPIO_PULL_MASK,
+						   param->spkid_pulls[i]));
+		} else {
+			KUNIT_EXPECT_EQ(test, val & CS35L56_PAD_GPIO_PULL_MASK,
+					CS35L56_PAD_PULL_NONE);
+		}
+
+		/* Pulls for all specfied GPIOs should have been transferred to AO latch */
+		if (i < cs35l56_base->num_onchip_spkid_pulls) {
+			KUNIT_EXPECT_EQ(test,
+					priv->applied_pad_pull_state[param->spkid_gpios[i] - 1],
+					param->spkid_pulls[i]);
+		} else {
+			KUNIT_EXPECT_EQ(test,
+					priv->applied_pad_pull_state[param->spkid_gpios[i] - 1],
+					CS35L56_PAD_PULL_NONE);
+		}
+	}
+}
+
+/* Test that the listed chip pins are stashed correctly. */
+static void cs35l56_shared_test_stash_onchip_spkid_pins(struct kunit *test)
+{
+	const struct cs35l56_shared_test_param *param = test->param_value;
+	struct cs35l56_shared_test_priv *priv = test->priv;
+	struct cs35l56_base *cs35l56_base = priv->cs35l56_base;
+	u32 gpios[5], pulls[5];
+	int i, num_gpios, num_pulls;
+
+	static_assert(ARRAY_SIZE(gpios) >= ARRAY_SIZE(param->spkid_gpios));
+	static_assert(ARRAY_SIZE(pulls) >= ARRAY_SIZE(param->spkid_pulls));
+
+	num_gpios = 0;
+	for (i = 0; i < ARRAY_SIZE(param->spkid_gpios); i++) {
+		if (param->spkid_gpios[i] < 0)
+			break;
+
+		gpios[i] = (u32)param->spkid_gpios[i];
+		num_gpios++;
+	}
+
+	num_pulls = 0;
+	for (i = 0; i < ARRAY_SIZE(param->spkid_pulls); i++) {
+		if (param->spkid_pulls[i] < 0)
+			break;
+
+		pulls[i] = (u32)param->spkid_pulls[i];
+		num_pulls++;
+	}
+
+	cs35l56_base->num_onchip_spkid_gpios = 0;
+	cs35l56_base->num_onchip_spkid_pulls = 0;
+
+	KUNIT_ASSERT_LE(test, num_gpios, ARRAY_SIZE(cs35l56_base->onchip_spkid_gpios));
+	KUNIT_ASSERT_LE(test, num_pulls, ARRAY_SIZE(cs35l56_base->onchip_spkid_pulls));
+
+	KUNIT_EXPECT_EQ(test,
+			cs35l56_check_and_save_onchip_spkid_gpios(cs35l56_base,
+								  gpios, num_gpios,
+								  pulls, num_pulls),
+			0);
+
+	KUNIT_EXPECT_EQ(test, cs35l56_base->num_onchip_spkid_gpios, num_gpios);
+	KUNIT_EXPECT_EQ(test, cs35l56_base->num_onchip_spkid_pulls, num_pulls);
+
+	/* GPIO numbers are adjusted from 1-based to 0-based */
+	for (i = 0; i < num_gpios; i++)
+		KUNIT_EXPECT_EQ(test, cs35l56_base->onchip_spkid_gpios[i], gpios[i] - 1);
+
+	for (i = 0; i < num_pulls; i++)
+		KUNIT_EXPECT_EQ(test, cs35l56_base->onchip_spkid_pulls[i], pulls[i]);
+}
+
+/* Test that illegal GPIO numbers are rejected. */
+static void cs35l56_shared_test_stash_onchip_spkid_pins_reject_invalid(struct kunit *test)
+{
+	struct cs35l56_shared_test_priv *priv = test->priv;
+	struct cs35l56_base *cs35l56_base = priv->cs35l56_base;
+	u32 gpios[8] = { }, pulls[8] = { };
+
+	KUNIT_EXPECT_LE(test,
+			cs35l56_check_and_save_onchip_spkid_gpios(cs35l56_base,
+								  gpios, 1,
+								  pulls, 0),
+			0);
+
+	switch (cs35l56_base->type) {
+	case 0x54:
+	case 0x56:
+	case 0x57:
+		gpios[0] = CS35L56_MAX_GPIO + 1;
+		break;
+	case 0x63:
+		gpios[0] = CS35L63_MAX_GPIO + 1;
+		break;
+	default:
+		kunit_fail_current_test("Unsupported type:%#x\n", cs35l56_base->type);
+		return;
+	}
+	KUNIT_EXPECT_LE(test,
+			cs35l56_check_and_save_onchip_spkid_gpios(cs35l56_base,
+								  gpios, 1,
+								  pulls, 0),
+			0);
+
+	gpios[0] = 1;
+	pulls[0] = 3;
+	KUNIT_EXPECT_LE(test,
+			cs35l56_check_and_save_onchip_spkid_gpios(cs35l56_base,
+								  gpios, 1,
+								  pulls, 1),
+			0);
+
+	static_assert(ARRAY_SIZE(gpios) > ARRAY_SIZE(cs35l56_base->onchip_spkid_gpios));
+	static_assert(ARRAY_SIZE(pulls) > ARRAY_SIZE(cs35l56_base->onchip_spkid_pulls));
+	KUNIT_EXPECT_EQ(test,
+			cs35l56_check_and_save_onchip_spkid_gpios(cs35l56_base,
+								  gpios, ARRAY_SIZE(gpios),
+								  pulls, 0),
+			-EOVERFLOW);
+	KUNIT_EXPECT_EQ(test,
+			cs35l56_check_and_save_onchip_spkid_gpios(cs35l56_base,
+								  gpios, 1,
+								  pulls, ARRAY_SIZE(pulls)),
+			-EOVERFLOW);
+}
+
+static void cs35l56_shared_test_onchip_speaker_id_not_defined(struct kunit *test)
+{
+	struct cs35l56_shared_test_priv *priv = test->priv;
+	struct cs35l56_base *cs35l56_base = priv->cs35l56_base;
+
+	memset(cs35l56_base->onchip_spkid_gpios, 0, sizeof(cs35l56_base->onchip_spkid_gpios));
+	memset(cs35l56_base->onchip_spkid_pulls, 0, sizeof(cs35l56_base->onchip_spkid_pulls));
+	cs35l56_base->num_onchip_spkid_gpios = 0;
+	cs35l56_base->num_onchip_spkid_pulls = 0;
+	KUNIT_EXPECT_EQ(test, cs35l56_configure_onchip_spkid_pads(cs35l56_base), 0);
+	KUNIT_EXPECT_EQ(test, cs35l56_read_onchip_spkid(cs35l56_base), -ENOENT);
+}
+
+static int cs35l56_shared_test_case_regmap_init(struct kunit *test,
+						const struct regmap_config *regmap_config)
+{
+	struct cs35l56_shared_test_priv *priv = test->priv;
+	struct cs35l56_base *cs35l56_base;
+
+	/*
+	 * Create a dummy regmap to simulate a register map by holding the
+	 * values of all simulated registers in the regmap cache.
+	 */
+	priv->registers = regmap_init(&priv->amp_dev->dev,
+				      &cs35l56_shared_test_mock_registers_regmap_bus,
+				      priv,
+				      &cs35l56_shared_test_mock_registers_regmap);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->registers);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, regmap_exit_wrapper,
+						  priv->registers));
+	regcache_cache_only(priv->registers, true);
+
+	/* Create dummy regmap for cs35l56 driver */
+	cs35l56_base = priv->cs35l56_base;
+	cs35l56_base->regmap = regmap_init(cs35l56_base->dev,
+					   &cs35l56_shared_test_regmap_bus,
+					   priv,
+					   regmap_config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cs35l56_base->regmap);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, regmap_exit_wrapper,
+						  cs35l56_base->regmap));
+
+	return 0;
+}
+
+static int cs35l56_shared_test_case_base_init(struct kunit *test, u8 type, u8 rev,
+					      const struct regmap_config *regmap_config)
+{
+	struct cs35l56_shared_test_priv *priv;
+	int ret;
+
+	KUNIT_ASSERT_NOT_NULL(test, cs_amp_test_hooks);
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	test->priv = priv;
+	priv->test = test;
+
+	/* Create dummy amp driver dev */
+	priv->amp_dev = faux_device_create("cs35l56_shared_test_drv", NULL, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, priv->amp_dev);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test,
+						  faux_device_destroy_wrapper,
+						  priv->amp_dev));
+
+	priv->cs35l56_base = kunit_kzalloc(test, sizeof(*priv->cs35l56_base), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, priv->cs35l56_base);
+	priv->cs35l56_base->dev = &priv->amp_dev->dev;
+	priv->cs35l56_base->type = type;
+	priv->cs35l56_base->rev = rev;
+
+	if (regmap_config) {
+		ret = cs35l56_shared_test_case_regmap_init(test, regmap_config);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int cs35l56_shared_test_case_regmap_init_L56_B0_sdw(struct kunit *test)
+{
+	return cs35l56_shared_test_case_base_init(test, 0x56, 0xb0, &cs35l56_regmap_sdw);
+}
+
+static int cs35l56_shared_test_case_regmap_init_L56_B0_spi(struct kunit *test)
+{
+	return cs35l56_shared_test_case_base_init(test, 0x56, 0xb0, &cs35l56_regmap_spi);
+}
+
+static int cs35l56_shared_test_case_regmap_init_L56_B0_i2c(struct kunit *test)
+{
+	return cs35l56_shared_test_case_base_init(test, 0x56, 0xb0, &cs35l56_regmap_i2c);
+}
+
+static int cs35l56_shared_test_case_regmap_init_L56_B2_sdw(struct kunit *test)
+{
+	return cs35l56_shared_test_case_base_init(test, 0x56, 0xb2, &cs35l56_regmap_sdw);
+}
+
+static int cs35l56_shared_test_case_regmap_init_L56_B2_spi(struct kunit *test)
+{
+	return cs35l56_shared_test_case_base_init(test, 0x56, 0xb2, &cs35l56_regmap_spi);
+}
+
+static int cs35l56_shared_test_case_regmap_init_L56_B2_i2c(struct kunit *test)
+{
+	return cs35l56_shared_test_case_base_init(test, 0x56, 0xb2, &cs35l56_regmap_i2c);
+}
+
+static int cs35l56_shared_test_case_regmap_init_L63_A1_sdw(struct kunit *test)
+{
+	return cs35l56_shared_test_case_base_init(test, 0x63, 0xa1, &cs35l63_regmap_sdw);
+}
+
+static void cs35l56_shared_test_gpio_param_desc(const struct cs35l56_shared_test_param *param,
+						char *desc)
+{
+	DECLARE_SEQ_BUF(gpios, 1 + (2 * ARRAY_SIZE(param->spkid_gpios)));
+	DECLARE_SEQ_BUF(pulls, 1 + (2 * ARRAY_SIZE(param->spkid_pulls)));
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(param->spkid_gpios); i++) {
+		if (param->spkid_gpios[i] < 0)
+			break;
+
+		seq_buf_printf(&gpios, "%s%d", (i == 0) ? "" : ",", param->spkid_gpios[i]);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(param->spkid_pulls); i++) {
+		if (param->spkid_pulls[i] < 0)
+			break;
+
+		seq_buf_printf(&pulls, "%s%d", (i == 0) ? "" : ",", param->spkid_pulls[i]);
+	}
+
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "gpios:{%s} pulls:{%s} status:%#lx spkid:%d",
+		 seq_buf_str(&gpios), seq_buf_str(&pulls), param->gpio_status, param->spkid);
+}
+
+static const struct cs35l56_shared_test_param cs35l56_shared_test_gpios_selftest_cases[] = {
+	{ .spkid_gpios = { -1 }, .gpio_status = GENMASK(12, 0) },
+};
+KUNIT_ARRAY_PARAM(cs35l56_shared_test_gpios_selftest,
+		  cs35l56_shared_test_gpios_selftest_cases,
+		  cs35l56_shared_test_gpio_param_desc);
+
+static const struct cs35l56_shared_test_param cs35l56_shared_test_onchip_spkid_cases[] = {
+	{ .spkid_gpios = { 1, -1 },	  .gpio_status = 0,			.spkid = 0 },
+	{ .spkid_gpios = { 1, -1 },	  .gpio_status = ~BIT(0),		.spkid = 0 },
+	{ .spkid_gpios = { 1, -1 },	  .gpio_status = BIT(0),		.spkid = 1 },
+
+	{ .spkid_gpios = { 7, -1 },	  .gpio_status = 0,			.spkid = 0 },
+	{ .spkid_gpios = { 7, -1 },	  .gpio_status = ~BIT(6),		.spkid = 0 },
+	{ .spkid_gpios = { 7, -1 },	  .gpio_status = BIT(6),		.spkid = 1 },
+
+	{ .spkid_gpios = { 1, 7, -1 },	  .gpio_status = 0,			.spkid = 0 },
+	{ .spkid_gpios = { 1, 7, -1 },	  .gpio_status = ~(BIT(0) | BIT(6)),	.spkid = 0 },
+	{ .spkid_gpios = { 1, 7, -1 },	  .gpio_status = BIT(6),		.spkid = 1 },
+	{ .spkid_gpios = { 1, 7, -1 },	  .gpio_status = BIT(0),		.spkid = 2 },
+	{ .spkid_gpios = { 1, 7, -1 },	  .gpio_status = BIT(6) | BIT(0),	.spkid = 3 },
+
+	{ .spkid_gpios = { 7, 1, -1 },	  .gpio_status = 0,			.spkid = 0 },
+	{ .spkid_gpios = { 7, 1, -1 },	  .gpio_status = ~(BIT(6) | BIT(0)),	.spkid = 0 },
+	{ .spkid_gpios = { 7, 1, -1 },	  .gpio_status = BIT(0),		.spkid = 1 },
+	{ .spkid_gpios = { 7, 1, -1 },	  .gpio_status = BIT(6),		.spkid = 2 },
+	{ .spkid_gpios = { 7, 1, -1 },	  .gpio_status = BIT(6) | BIT(0),	.spkid = 3 },
+
+	{ .spkid_gpios = { 3, 7, 1, -1 }, .gpio_status = 0,			   .spkid = 0 },
+	{ .spkid_gpios = { 3, 7, 1, -1 }, .gpio_status = BIT(0),		   .spkid = 1 },
+	{ .spkid_gpios = { 3, 7, 1, -1 }, .gpio_status = BIT(6),		   .spkid = 2 },
+	{ .spkid_gpios = { 3, 7, 1, -1 }, .gpio_status = BIT(6) | BIT(0),	   .spkid = 3 },
+	{ .spkid_gpios = { 3, 7, 1, -1 }, .gpio_status = BIT(2),		   .spkid = 4 },
+	{ .spkid_gpios = { 3, 7, 1, -1 }, .gpio_status = BIT(2) | BIT(0),	   .spkid = 5 },
+	{ .spkid_gpios = { 3, 7, 1, -1 }, .gpio_status = BIT(2) | BIT(6),	   .spkid = 6 },
+	{ .spkid_gpios = { 3, 7, 1, -1 }, .gpio_status = BIT(2) | BIT(6) | BIT(0), .spkid = 7 },
+};
+KUNIT_ARRAY_PARAM(cs35l56_shared_test_onchip_spkid, cs35l56_shared_test_onchip_spkid_cases,
+		  cs35l56_shared_test_gpio_param_desc);
+
+static const struct cs35l56_shared_test_param cs35l56_shared_test_onchip_spkid_pull_cases[] = {
+	{ .spkid_gpios = { 1, -1 },		.spkid_pulls = { 1, -1 }, },
+	{ .spkid_gpios = { 1, -1 },		.spkid_pulls = { 2, -1 }, },
+
+	{ .spkid_gpios = { 7, -1 },		.spkid_pulls = { 1, -1 }, },
+	{ .spkid_gpios = { 7, -1 },		.spkid_pulls = { 2, -1 }, },
+
+	{ .spkid_gpios = { 1, 7, -1 },		.spkid_pulls = { 1, 1, -1 }, },
+	{ .spkid_gpios = { 1, 7, -1 },		.spkid_pulls = { 2, 2, -1 }, },
+
+	{ .spkid_gpios = { 7, 1, -1 },		.spkid_pulls = { 1, 1, -1 }, },
+	{ .spkid_gpios = { 7, 1, -1 },		.spkid_pulls = { 2, 2, -1 }, },
+
+	{ .spkid_gpios = { 3, 7, 1, -1 },	.spkid_pulls = { 1, 1, 1, -1 }, },
+	{ .spkid_gpios = { 3, 7, 1, -1 },	.spkid_pulls = { 2, 2, 2, -1 }, },
+};
+KUNIT_ARRAY_PARAM(cs35l56_shared_test_onchip_spkid_pull,
+		  cs35l56_shared_test_onchip_spkid_pull_cases,
+		  cs35l56_shared_test_gpio_param_desc);
+
+static struct kunit_case cs35l56_shared_test_cases[] = {
+	/* Tests for speaker id */
+	KUNIT_CASE_PARAM(cs35l56_shared_test_mock_gpio_status_selftest,
+			 cs35l56_shared_test_gpios_selftest_gen_params),
+	KUNIT_CASE_PARAM(cs35l56_shared_test_get_onchip_speaker_id,
+			 cs35l56_shared_test_onchip_spkid_gen_params),
+	KUNIT_CASE_PARAM(cs35l56_shared_test_onchip_speaker_id_pad_config,
+			 cs35l56_shared_test_onchip_spkid_gen_params),
+	KUNIT_CASE_PARAM(cs35l56_shared_test_onchip_speaker_id_pad_config,
+			 cs35l56_shared_test_onchip_spkid_pull_gen_params),
+	KUNIT_CASE_PARAM(cs35l56_shared_test_stash_onchip_spkid_pins,
+			 cs35l56_shared_test_onchip_spkid_pull_gen_params),
+	KUNIT_CASE(cs35l56_shared_test_stash_onchip_spkid_pins_reject_invalid),
+	KUNIT_CASE(cs35l56_shared_test_onchip_speaker_id_not_defined),
+	{ }
+};
+
+static struct kunit_suite cs35l56_shared_test_suite_L56_B0_sdw = {
+	.name = "snd-soc-cs35l56-shared-test_L56_B0_sdw",
+	.init = cs35l56_shared_test_case_regmap_init_L56_B0_sdw,
+	.test_cases = cs35l56_shared_test_cases,
+};
+
+static struct kunit_suite cs35l56_shared_test_suite_L56_B2_sdw = {
+	.name = "snd-soc-cs35l56-shared-test_L56_B2_sdw",
+	.init = cs35l56_shared_test_case_regmap_init_L56_B2_sdw,
+	.test_cases = cs35l56_shared_test_cases,
+};
+
+static struct kunit_suite cs35l56_shared_test_suite_L63_A1_sdw = {
+	.name = "snd-soc-cs35l56-shared-test_L63_A1_sdw",
+	.init = cs35l56_shared_test_case_regmap_init_L63_A1_sdw,
+	.test_cases = cs35l56_shared_test_cases,
+};
+
+static struct kunit_suite cs35l56_shared_test_suite_L56_B0_spi = {
+	.name = "snd-soc-cs35l56-shared-test_L56_B0_spi",
+	.init = cs35l56_shared_test_case_regmap_init_L56_B0_spi,
+	.test_cases = cs35l56_shared_test_cases,
+};
+
+static struct kunit_suite cs35l56_shared_test_suite_L56_B2_spi = {
+	.name = "snd-soc-cs35l56-shared-test_L56_B2_spi",
+	.init = cs35l56_shared_test_case_regmap_init_L56_B2_spi,
+	.test_cases = cs35l56_shared_test_cases,
+};
+
+static struct kunit_suite cs35l56_shared_test_suite_L56_B0_i2c = {
+	.name = "snd-soc-cs35l56-shared-test_L56_B0_i2c",
+	.init = cs35l56_shared_test_case_regmap_init_L56_B0_i2c,
+	.test_cases = cs35l56_shared_test_cases,
+};
+
+static struct kunit_suite cs35l56_shared_test_suite_L56_B2_i2c = {
+	.name = "snd-soc-cs35l56-shared-test_L56_B2_i2c",
+	.init = cs35l56_shared_test_case_regmap_init_L56_B2_i2c,
+	.test_cases = cs35l56_shared_test_cases,
+};
+
+kunit_test_suites(
+	&cs35l56_shared_test_suite_L56_B0_sdw,
+	&cs35l56_shared_test_suite_L56_B2_sdw,
+	&cs35l56_shared_test_suite_L63_A1_sdw,
+
+	&cs35l56_shared_test_suite_L56_B0_spi,
+	&cs35l56_shared_test_suite_L56_B2_spi,
+
+	&cs35l56_shared_test_suite_L56_B0_i2c,
+	&cs35l56_shared_test_suite_L56_B2_i2c,
+);
+
+MODULE_IMPORT_NS("SND_SOC_CS35L56_SHARED");
+MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
+MODULE_DESCRIPTION("KUnit test for cs35l56-shared module");
+MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 55c75b9e4172..4707f28bfca2 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -5,6 +5,7 @@
 // Copyright (C) 2023 Cirrus Logic, Inc. and
 //                    Cirrus Logic International Semiconductor Ltd.
 
+#include <kunit/static_stub.h>
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
@@ -1630,6 +1631,8 @@ int cs35l56_configure_onchip_spkid_pads(struct cs35l56_base *cs35l56_base)
 	int num_gpios, num_pulls;
 	int i, ret;
 
+	KUNIT_STATIC_STUB_REDIRECT(cs35l56_configure_onchip_spkid_pads, cs35l56_base);
+
 	if (cs35l56_base->num_onchip_spkid_gpios == 0)
 		return 0;
 
@@ -1680,6 +1683,8 @@ int cs35l56_read_onchip_spkid(struct cs35l56_base *cs35l56_base)
 	int speaker_id = 0;
 	int i, ret;
 
+	KUNIT_STATIC_STUB_REDIRECT(cs35l56_read_onchip_spkid, cs35l56_base);
+
 	if (cs35l56_base->num_onchip_spkid_gpios == 0)
 		return -ENOENT;
 
-- 
2.47.3

