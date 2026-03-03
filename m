Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5E1480978
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 15:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553217; cv=fail; b=bHEM42bls8OU+FmW1+ued2iIzVB+ImbSz22nKlyoUra328EK1aPo2dOLY6TijiDj0r0Qqn6IPaAWLqoycmZQjg+3za+K8C19QUJRzaYXE0gbH3jx/j2rbQQDz/oIM7cEHbmKaKOsRMd/E+hZG8biSEV43x35KRQeQrnSo3XQM40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553217; c=relaxed/simple;
	bh=tvPIeqtzXhECgRr/RtuDOp00/VWyN1daeyevu/9isJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C2VFxHRhDlfes2oULITrgBzjeAgQrolTF3STD/i9c8WHJDB5uKkiTmDRknRjj/M0I8X06Smmw7ZEWmNlOfhFrHSVTSjvEH8V+CIa8QWu2k5WN0t41hceTbXvIXQlPz67zJ6P1UvDwoBKilZ9Cig7nEQmeUO/1VL+n/cgzD3IvBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lAZjKXl2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Gkqn4na0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lAZjKXl2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Gkqn4na0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6232tRlT3871460;
	Tue, 3 Mar 2026 09:53:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=mhkVmnaPgDmcdQqbEQKtlWeHnsRYjBDlnmdyZo96YbM=; b=
	lAZjKXl2/omQ9d78ZAleMwHGvxlCyuhczVG+YclNpdChHqT1EPh4oaXCj8ZS0EtJ
	PtKjxI0DHtFHcj1zTFa3Wxvxui6Rt4SgRpCj27ePGIR2PeYlwht/Vb+a92ZC+uhH
	wDIBJXPz+7HnfKAkrJDb2bDQz2ROB95mEya1Fl1UA/kohOk5LWUv8aBioq526OEi
	fhRLhK+LswNwsYcFKoSf+AiCKKNUdSyeWqZkS//BxZ6dPqLj6UOn/Kh1CzG83fyp
	kllIv/zs1MWr58jNyb/L1OJmARxjONr+3AlmVGg8fdKq4nbFLTTJPUJO0bpdtZIn
	mQByRqMTnYkilnvkeRic4Q==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020098.outbound.protection.outlook.com [52.101.56.98])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ckwnn3hh5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 09:53:18 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgwt/BqiDnK83QOujXnAPIsMjX5dGNexEKKOY8VBK7Hv6fMVq1I0gQwUU1Z5hBfluGPAai/ySyiIwRWEKckqDAIq09BNBifJeHAGvXo7UB/bCVK+7XVWIpH1EqAVECrEzRinUzHanaYKfnKMhk89JzEFeIqGXdRTRCMRiZZu89VjvIYJ44zacxp0ifOHSERF1sCi57uaFq8AskSqs9b2rsoMKHtLtTgDRnsrEh4qg0v2j/2pXSPibTIW/gooS52+hqvwIgRSm5zzb/FLBxgRln+V27cl5Xg4BOq8clUOExzFeJH3tTrcaIc9K1mWOPZKxl9+08gf0TckJQnzjtimZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhkVmnaPgDmcdQqbEQKtlWeHnsRYjBDlnmdyZo96YbM=;
 b=FoeeeWWTlObrsVyqLOzDcCh5iC2k4CAe5S5f203rSya6cZg+IHz+XfiRNcmRL3dukCmC/RtaKMeq2og6euJKp8QQ2MZGVkGpaykTMXMxtAv3X7rRcN8qGh7Ssn58aEmwqxd6HptmU5ltanT3Mh2Qpf+CV1j7Zeqh4i/m20WkZTfHe6oAkGCjiYK8QWJ32GWuR1AAy+8AK6pMzdWF84dt2mgi8+n0bNk1QQHQ+U79CqTbPgLfaOAsbW9JDySSExCOLhKYGfG6lZydfHRLymVRe0FODsYjRG/CvIYoBcggUEGbU49UguRIQrZWAPYKRH6Z4VjsleMc2JdkQjly0MsSuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhkVmnaPgDmcdQqbEQKtlWeHnsRYjBDlnmdyZo96YbM=;
 b=Gkqn4na0FbqqHlgbwRMj2pcI1KkuLdnEDCCnp6epQ/0dHZLDGENKV81XA76+dHFzqkZZF6CZ9gSKR4OEn9kn0mEs3ABvsGS6+3lg+flo6lMZYsGkkegqBc4X+5Bg4qffDy6ldcEYMrqoZ9O4awpygSrpc0TaadMrZKo4+9Ou8ts=
Received: from BN9PR03CA0121.namprd03.prod.outlook.com (2603:10b6:408:fe::6)
 by PH0PR19MB5099.namprd19.prod.outlook.com (2603:10b6:510:75::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Tue, 3 Mar
 2026 15:53:14 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::48) by BN9PR03CA0121.outlook.office365.com
 (2603:10b6:408:fe::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 15:52:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.0
 via Frontend Transport; Tue, 3 Mar 2026 15:53:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E62FF406542;
	Tue,  3 Mar 2026 15:53:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D2608820257;
	Tue,  3 Mar 2026 15:53:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: dapm: Add a named controls variant of a mux widget
Date: Tue,  3 Mar 2026 15:53:07 +0000
Message-ID: <20260303155308.138989-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303155308.138989-1-ckeepax@opensource.cirrus.com>
References: <20260303155308.138989-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|PH0PR19MB5099:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5f28baa8-c34c-49e4-92ec-08de793cf9d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	y2B7mzoaTeS9KXZ8FvUsiQmwIx56rHubbSpFjrIzFLiH3xWxr1sZ49ZxEosrTDN4ApiC9XxcpK/3s795XsV+3G0YT0SueQt0KLGZPuGhWAzW3Bd5+Xt0VkYIOGMx1ydSZFOSA3OIVbnzf9PpHQ8+kM+c0tuiIL1K/kNgEavg4z52NNJgINFyH2tpT1uPrOAwKgc6yPhiCg6BDAk07/BsU01RPSzQFPoUu9Se8Jo7zoxpUCzARwGLYnkwGXEBWPrX3b9Tl0tqbpCNSckJoXcjarTEtjf8ckkGm5GMuapxt406DkkLZyzsQ1SI1kdjKlpyrC99sskLgQtasaaHefC4uHxM0Ahb+i2ZqJ5hNDCDmR9ztnHhItjtbIcxTjm8utMN43mMshh7NTwm/6u79o7KejDzLcQFjHDFDReM+/n+0HnfBQi1j5KZBBehLt1hapoTFBd5g27EEsyhHxtQZPThBHSdgofBhZWzhNAsY+YUnWZgS16d5dDFvvtv6/R4EqOB7hq31RS9Lq3/cwQ1cXr9UV+BVB+N9g2yieLpUa0N3CPglrhM5Vfh9HZevoySDqDQiCKUjF5g5vXLsAXPif7kRsz0RBNC/QzLf5wFF6+AN0b+vvR73xnjOjLfrp64i64Z8WW97Q2FNDbwZHkifSKX5ULciLsOMsXiRCsraM1/yWjkbV1NkfhxDesXm4hIYKYyIOpmWITEYvp8Wo3a+ev033Bxsns37cMvfedLioeb/ttkLd+gcKoaNJO/gqU4mjK/4BNboLlU7eBz09IBuKY5/yhz09yWpn+TVtr1uiwkVaCNvEA5Ak+TYb+E8sC+TJOPfCC3nFh1465i6JIr3a7+ag==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XePDd97+TKiM+rWvUzTmL/emSKULBADD72320RrKHPoIYF+4wvCOdHImXHhQ9ruJXBSlsaFjKWk7gyQzBbpDzs4nyFdRgpSvkhIW1+ZC31eYEGKb/h04kzriem2JyKUk5MIq13IOnV33tmIoY2azL5P9DYS8wZSKDPdQTxx79aDZQIdU4APEQD6li3dNMPUhw3iv/DcpHJvsqlBAKbsvC4tYYvMbUv/LkqKGu52QNRVuAKOyv1JChhgtG5Ommlp05pCgzBQewPJ/16ioZFwrXakxh76yOTgoGwhe/xkKVgFtnVmCdaYBC+kZYX2Civ3qV4/axW0u9kJevCNreB6WSj5+7zCE/oAJX7QBw6X/uvzyxOzFNbj+IXj4OGwPom1vGzEi7tNH08J9ol1v/fG65SNtkBx7hE60iDz6sVrIHNxTquGqysICj5yfGTYN9nb0
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:53:12.7514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f28baa8-c34c-49e4-92ec-08de793cf9d4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5099
X-Proofpoint-GUID: oTt3nFqP50J9u5SYtwYpcy7vOEHc8Ws1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEyNyBTYWx0ZWRfX/bbk+vVQnYjL
 Mbah4uARW2E9lSBKqbrtz2IrVxSqcCz3pkihVJEAbf2FAQTlBtM8k6GAbU9kMtLe7L5hm4wRX4T
 V+GZqEu4UrdnYdGa44E6Eg64obHfYT3GHMBqOqwRr6UUbqsY5TrLqsC1XG2yYpIecs0+u5CQAZp
 xYVSTyLPqILn6WerYVIjgGjtktJxh48Vj6rwbeO+LTFtQiXRVN2nhviE80EjcilA2uC/XG/t1CL
 AF0sua1tv1ttXYud5542YDyh8n73t/97D8vl7gckPDOXaVREZEqzkEWBUpj0ZFF2ApFTiUziCcf
 x3Q4IRVviyMXrDVhnbz1FVQZabhFzXdYT2DIbXYxAS4gVPDTaf7FPKXUuIuVOgFerB8ejEjh/id
 jtlNkLdGqISfabBRH06bYB3vK2neGcUfCC/xqyKy/IhqPjl0PcEdldy5FKWl0LoCEpcO0YwxQVd
 fUAjUEhYBmL69vbFWxg==
X-Authority-Analysis: v=2.4 cv=ZaIQ98VA c=1 sm=1 tr=0 ts=69a703ee cx=c_pps
 a=+sLJoloK99bVPEAi26XZpw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=F_BrzX5C8IJabdWpslAA:9
X-Proofpoint-ORIG-GUID: oTt3nFqP50J9u5SYtwYpcy7vOEHc8Ws1
X-Proofpoint-Spam-Reason: safe

There is already a version of the mixer widget that forces use of the
specified control name, rather than factoring in the widget name. Add
the same feature for mux widgets.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-dapm.h |  1 +
 sound/soc/soc-dapm.c     | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 49f0fe05db01f..4f8fb7622a139 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -424,6 +424,7 @@ enum snd_soc_dapm_type {
 	snd_soc_dapm_input = 0,		/* input pin */
 	snd_soc_dapm_output,		/* output pin */
 	snd_soc_dapm_mux,		/* selects 1 analog signal from many inputs */
+	snd_soc_dapm_mux_named_ctl,	/* mux with named controls */
 	snd_soc_dapm_demux,		/* connects the input to one of multiple outputs */
 	snd_soc_dapm_mixer,		/* mixes several analog signals together */
 	snd_soc_dapm_mixer_named_ctl,	/* mixer with named controls */
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 2768ba5bfc9f8..d6192204e613d 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -89,6 +89,7 @@ static int dapm_up_seq[] = {
 	[snd_soc_dapm_input] = 6,
 	[snd_soc_dapm_output] = 6,
 	[snd_soc_dapm_mux] = 7,
+	[snd_soc_dapm_mux_named_ctl] = 7,
 	[snd_soc_dapm_demux] = 7,
 	[snd_soc_dapm_dac] = 8,
 	[snd_soc_dapm_switch] = 9,
@@ -140,6 +141,7 @@ static int dapm_down_seq[] = {
 	[snd_soc_dapm_micbias] = 10,
 	[snd_soc_dapm_vmid] = 10,
 	[snd_soc_dapm_mux] = 11,
+	[snd_soc_dapm_mux_named_ctl] = 11,
 	[snd_soc_dapm_demux] = 11,
 	[snd_soc_dapm_aif_in] = 12,
 	[snd_soc_dapm_aif_out] = 12,
@@ -577,6 +579,7 @@ static int dapm_check_dynamic_path(
 
 	switch (sink->id) {
 	case snd_soc_dapm_mux:
+	case snd_soc_dapm_mux_named_ctl:
 	case snd_soc_dapm_switch:
 	case snd_soc_dapm_mixer:
 	case snd_soc_dapm_mixer_named_ctl:
@@ -668,6 +671,7 @@ static int dapm_add_path(
 
 		switch (wsink->id) {
 		case snd_soc_dapm_mux:
+		case snd_soc_dapm_mux_named_ctl:
 			ret = dapm_connect_mux(dapm, path, control, wsink);
 			if (ret != 0)
 				goto err;
@@ -766,6 +770,7 @@ static int dapm_kcontrol_data_alloc(struct snd_soc_dapm_widget *widget,
 		break;
 	case snd_soc_dapm_demux:
 	case snd_soc_dapm_mux:
+	case snd_soc_dapm_mux_named_ctl:
 		e = (struct soc_enum *)kcontrol->private_value;
 
 		if (e->autodisable) {
@@ -915,6 +920,7 @@ static bool dapm_kcontrol_set_value(const struct snd_kcontrol *kcontrol,
 			break;
 		case snd_soc_dapm_demux:
 		case snd_soc_dapm_mux:
+		case snd_soc_dapm_mux_named_ctl:
 			data->widget->on_val = value >> data->widget->shift;
 			break;
 		default:
@@ -1198,6 +1204,7 @@ static int dapm_create_or_share_kcontrol(struct snd_soc_dapm_widget *w,
 				wname_in_long_name = true;
 				kcname_in_long_name = true;
 				break;
+			case snd_soc_dapm_mux_named_ctl:
 			case snd_soc_dapm_mixer_named_ctl:
 				wname_in_long_name = false;
 				kcname_in_long_name = true;
@@ -1317,6 +1324,7 @@ static int dapm_new_mux(struct snd_soc_dapm_widget *w)
 
 	switch (w->id) {
 	case snd_soc_dapm_mux:
+	case snd_soc_dapm_mux_named_ctl:
 		dir = SND_SOC_DAPM_DIR_OUT;
 		type = "mux";
 		break;
@@ -2399,6 +2407,7 @@ static const char * const dapm_type_name[] = {
 	[snd_soc_dapm_input]            = "input",
 	[snd_soc_dapm_output]           = "output",
 	[snd_soc_dapm_mux]              = "mux",
+	[snd_soc_dapm_mux_named_ctl]    = "mux_named_ctl",
 	[snd_soc_dapm_demux]            = "demux",
 	[snd_soc_dapm_mixer]            = "mixer",
 	[snd_soc_dapm_mixer_named_ctl]  = "mixer_named_ctl",
@@ -3347,6 +3356,7 @@ int snd_soc_dapm_new_widgets(struct snd_soc_card *card)
 			dapm_new_mixer(w);
 			break;
 		case snd_soc_dapm_mux:
+		case snd_soc_dapm_mux_named_ctl:
 		case snd_soc_dapm_demux:
 			dapm_new_mux(w);
 			break;
@@ -3834,6 +3844,7 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 		break;
 
 	case snd_soc_dapm_mux:
+	case snd_soc_dapm_mux_named_ctl:
 	case snd_soc_dapm_demux:
 	case snd_soc_dapm_switch:
 	case snd_soc_dapm_mixer:
-- 
2.47.3

