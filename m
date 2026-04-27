Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C45369970
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 12:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777291204; cv=fail; b=S1QqYoPgkdAsPf4a4I8i2OKmuXMm7jis/p7cSo1Zd8mavZ+CKXtBztI1F7egZF4J7VDCaFUMMd21dTaZH6fYlOnqXPl3UKoqzeqaXDILrHsLxtlCE+E9wYXgJH36MJesaiDbmVR7ipUnU2OLuYCrVIwG8IpfCmzqJdbmwt7DaHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777291204; c=relaxed/simple;
	bh=yEd5p3QTOoAs1zCEx+NFdUjOcZf2ioLgGHyDjUEAfzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JCNvv6ImPORVNF5sNxCnxAMpOWmB4vqurNFADP/QxcZioE2dYpBb1PP0sajHxkBgEoQyUs+qCu6NV95K/U0lWgWxmOnAwdCkSAJvpx+0nlu8XzXnb599lLFMr3X7gH9RNTHl7uVTxu1C13RF2MHMIrhoXB9HMp3Wx46jW1+syyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=bo+DSoCT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=JLBXovV/; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="bo+DSoCT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="JLBXovV/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R4U9Fj3862648;
	Mon, 27 Apr 2026 06:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=wP8ZXXdlzI67T6vXfTwkX928yfEJLow61PH+/IlqfNE=; b=
	bo+DSoCTcaHDXtmpdehHdP3QqORGImBY44IFvP4dqsJG5O8+wq0js4viZvE7xVxK
	MmW+9Kjsc99xJJHbwiBgvg9L7YUBtI0/or6cXfXOIlkOnLuCYLha4iMAieQfpIiR
	pXYqN4jkQS24K2eRv4PhYUFfqRwa2chTgBXpqgjMzQD/xBD7XpNJtWsnpKq8jX6t
	4dBVxSFpcuAiHVc9pE+62R937Mff6tNMjsWbK4C4CpMWmCsmpC9NY3FsTMWfBgvN
	7T/R23dwI1h9PJEFfpXTQ+j5BI2JBiMlzDFodVHY7x0fqLf2xG51fLv0T2iz2RGX
	EtRCBskUg1h4z52IrK0Ypg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022113.outbound.protection.outlook.com [52.101.53.113])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dru10a3cx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Apr 2026 06:59:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybmk3pn1fyiUHlTy9SNGfseDK+vdtO38AFjtas1p/WCeEqsiHnpTmMOp96ZumIwHs0I7C+HgE1vjI0bWnWPCL4MHnLFf8VHEGmeuSNnxzlQoXQrYcOX/umUjqUhX4Dk5n+KVVBzjDmcmueTgpZURaJcYecyfTQqkBoW6gtG0QOWpffomyotcmkWlwe1x5ehmCcSR4VPDVZI94weilEhXAoukJlF79nZfxPniSGwTUI+g2usXDxaWB5Hg/rk7c+NdMb2T7kz0YMl50qJpUcvDnF8/B/1j8rL8JxjAvvJNMAuZG2TUyMjxwAulVWmTPRaxpIHprJiT2S+GFFdMtA+2Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wP8ZXXdlzI67T6vXfTwkX928yfEJLow61PH+/IlqfNE=;
 b=q7tlx6Q7EfrvsTvyfKTsR2vXlQaXJd2gJVQg0rCw52fdtQp7uA5PmjGoAqURH7AjAu6a6DaqaB47AjXb7sDgMhhsuwwASiFBbHXn5Vh9spzJyPtf1uPw1kHWYhlg1hePNP8885uBJnxN8u2Vyyh7eHvDcaSfSmj9w0xX7p7B9vGvpuW82nrvrBVjxbbF0eJIjX1Qn44Q8GJoRhBPIZgMjtivi3UZJBvXeWueStd+UMcXwr938JMduqYBud0H07xjXeyVAllpGT4PUTC1WwxYnY9w3DiYiaRtT0kJ7FkwMH8RO0UuwXQX0jUI5Bp4u9VZeaJsbNfgV5nnou3JBoxc2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wP8ZXXdlzI67T6vXfTwkX928yfEJLow61PH+/IlqfNE=;
 b=JLBXovV/3oTwuNpRbT4g2/2RXMKzD00MlTaIms6YureCX7hb66/Bu/1qXIORDDIHOVrxz2L4o2ephfTAdXanXB/FNIBUB43S67geFcUyhflxQPbC106ytRrWvD8UOGGc3rmTocOWLntYle0uft8/ezwKFs2sk3GPOSHIdrfEPq4=
Received: from PH7PR10CA0023.namprd10.prod.outlook.com (2603:10b6:510:23d::21)
 by CH3PR19MB8240.namprd19.prod.outlook.com (2603:10b6:610:197::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 11:59:31 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::7f) by PH7PR10CA0023.outlook.office365.com
 (2603:10b6:510:23d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 11:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Mon, 27 Apr 2026 11:59:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 928E0406541;
	Mon, 27 Apr 2026 11:59:29 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7D37182024B;
	Mon, 27 Apr 2026 11:59:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 1/3] ASoC: SDCA: Add correct masks whilst reporting SDCA jack status
Date: Mon, 27 Apr 2026 12:59:23 +0100
Message-ID: <20260427115925.3801099-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427115925.3801099-1-ckeepax@opensource.cirrus.com>
References: <20260427115925.3801099-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|CH3PR19MB8240:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6ac78cae-62d1-4759-c3d9-08dea4547108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|56012099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4nibCjWRXkW5FOBIF/dHYpMKSw2Tk7/yn1B2T5nvDAZq40l9raXF/akregmzZa7nTocGDe9P15LUjNQs9NedR2RVL/H2AscpnlZFOxLoU/qYH4oOj3tGUEqysIp+HWk7W8zq3S/wPIF0gS3rL8V3QWi2nuDvp/WNDie4CnBiUHWv9Bp2+eQe4EPH3Pfatc45NMM4Ifl/i6rQAvChoJUlIAgLLBY0W4pkTz+O4aMbtgPEzQGjufcWLoAPI5ORsO+g2plzbQu+r61ruBh6jagrG9PnjAIbu1I6yUr8eMt98c342h0s5kaDi9kX6WJby5QFZduju2wznKkGpwPfcLmMssiSdfxT39EuAKbev3ulZyopcZWWWcjDm5IUj7G2osmC24KYPXu2PRZpwHnqgETc3qaOtgAQ6EkGU2weHMvBoW9Cs9pYYSQdABhc5a+Km4Ll70J/mpSMhnw4xWI6gkSpIxuROnBlBfd0qcPARiYPl5HaDcH/4exW48GPYj/eAk8ZEkPYMdqHdxTW6BnKimU2xcBrfRSxOHKTzy9BNw8rjnhzOHjqvKbu2oCO6KOak0UjAkBkHEmmIYeMZzmk2h2981woe70Foq/DMIcSC3ubqb0ZLtc+GCJhHGZgFncNJ9WEZSWtWIT0oyoyZkEigvjlgowdKRXWBzfDd/cYf5IhY2i+z1RLAQv+WEXNQcS5ZtP0vBMdkOh9ggRR3LJsdiTtGEpzYaizdsxejozn+aI7mxvHxFegKgqmaz6xjFTYAEYgslYrqyXphBRTHSNgm59w/A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(56012099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	guC78ViqDLy0qcJjJNiL2E9xUHMB3CUKHXB5NAeVNNyYHp9+GsrqsFnBlYkCiZBP44yjaufHOV1i7rXnPTai7IjUhQ4xIE9TWH/jmtPpzwyo3uSclTT1xWBXwcMguTtNkawVMqmnv4+HzScgrWHIVoBFRZR7zaMg+ikfXSfB/Fq83Xh1F/X2cipOTDuzCuJYg+iHEmyvQqFqzbhggnfdNF5vjYiN0D9p/HDcoPXlDffk9Q+tjxwJcygVULbo66kB819dOW80bZWyNGjjLNc3GAoCF2x1bIbzrm3SCExYgjuxwsibNTuDKtwyA2X1OlEmciYG+gYgEP0dwNmc8aHzvxAdFgdDe8aU4+giuHqEjj6XX7V+zBkR43u9N8s9dFNMDX9k0U4morrMBGu2hab7QZaja8clMB6VAc1w3dRaZ+KVT9/tAkr37O17VDcL2LqV
X-Exchange-RoutingPolicyChecked:
	pXe6nMpvL6Ejgcjuz4/WraHEIsyQ11hBBsT37/5tMw5EnUv7Pi7VNdOpkBdy/aEVFqeiLyfJlyZdQxDbH4K7/Xii76z+uhvJJq31nwFIFBz37vPdjp3qNLZBQgpiv5lEFazo0/e5QFTr+d0huWgwhoLflqKGzCePDFks7p0o1qvvAwuIUuTVgVEv6OYgN0OxNUVF6O0M4NBxjmd4InjCO0Vg4NOKcifUnDMKFis41HWfKEENNMwiOpp2EJWCwWYNPsBOQjnyTH4WPSwogW/NEntvW1VotO6X0xEFSchWmXqvKee2QYcwrhUewkrjnhyIT6dbAn5IzZbZP6/T0TERwg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 11:59:31.0852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac78cae-62d1-4759-c3d9-08dea4547108
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8240
X-Proofpoint-ORIG-GUID: uhGfRqu5p4ip2WAQa9kBPhzt2dkw9S1t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEyNyBTYWx0ZWRfX2805kLm+N1KE
 mszEBPyohuYqAi20oG5xjFBh7tL5Aaom53KT+WfizR1gujs+A4bgnTDSfuds8QBBSlkovgUhTEI
 0GYsQoQNd/onPYMkSxDzD0yPgP3NwgvAQ/6M0gdN8BO+NeltFnl53m+yaDIT26cS2h7YAsEwO3W
 qtZSDi1wozv688GYPbKFYNRx7xh47KcUTc8dimcv3ATRaw621WhaqCkbK529luJTvM6gQDwmhJA
 Reyb4xZfOV3AEJ2L2JJLiNbT5+Gm4pRN4SLwshAdScPxwnQ1f9UmSz3DufJmdaixyLE4gK/ngUS
 8NTGwaOTEbNQ7Wt6yROZdlEbKhDk45ZVvHeYMjm0e2jRWYIDV+raS4CqFkn18Hjs9qmcVmydB8L
 zblicdLwv/CXVRPxT0ywlTTG12ZS785pA97rQNffw4f2AyVwUWJB4oM3M4g9mBkzHHZfG8tfmcu
 OsNavHsOxHPCj9hWzWA==
X-Authority-Analysis: v=2.4 cv=EuTiaycA c=1 sm=1 tr=0 ts=69ef4fab cx=c_pps
 a=opNks6lJvPUjoR/Ci7CsCA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=M2GLoMmDkqpnuoSPwl0A:9
X-Proofpoint-GUID: uhGfRqu5p4ip2WAQa9kBPhzt2dkw9S1t
X-Proofpoint-Spam-Reason: safe

Currently, all SDCA jacks simply report against a mask of 0xFFFF. This
works fine for system with a single SDCA jack control as the status
reflects that single control at all times. However, if two SDCA
jack controls exist in the system, such as a separate representation for
input and output, then the second control can cancel reports from the
other since it will only report its relevant bits and zero in all other
slots. This is exactly what the mask is for.

Build up a mask using all the possible states for an SCDA jack control
at registration time and use that mask when reporting a particular jack.
It is worth noting this still doesn't handle cases such as two headphone
jacks as that would require separate ALSA jacks to report to.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_jack.h  |  3 ++
 sound/soc/sdca/sdca_jack.c | 75 ++++++++++++++++++++++----------------
 2 files changed, 47 insertions(+), 31 deletions(-)

diff --git a/include/sound/sdca_jack.h b/include/sound/sdca_jack.h
index 3ec22046d3ebc..181541f0f4d8c 100644
--- a/include/sound/sdca_jack.h
+++ b/include/sound/sdca_jack.h
@@ -18,10 +18,13 @@ struct snd_soc_jack;
  * struct jack_state - Jack state structure to keep data between interrupts
  * @kctl: Pointer to the ALSA control attached to this jack
  * @jack: Pointer to the ASoC jack struct for this jack
+ * @mask: Possible reported jack status bits for this jack
  */
 struct jack_state {
 	struct snd_kcontrol *kctl;
 	struct snd_soc_jack *jack;
+
+	unsigned int mask;
 };
 
 int sdca_jack_alloc_state(struct sdca_interrupt *interrupt);
diff --git a/sound/soc/sdca/sdca_jack.c b/sound/soc/sdca/sdca_jack.c
index 49d317d3b8c85..be2506f38c711 100644
--- a/sound/soc/sdca/sdca_jack.c
+++ b/sound/soc/sdca/sdca_jack.c
@@ -145,6 +145,32 @@ int sdca_jack_alloc_state(struct sdca_interrupt *interrupt)
 }
 EXPORT_SYMBOL_NS_GPL(sdca_jack_alloc_state, "SND_SOC_SDCA");
 
+static int type_get_mask(enum sdca_terminal_type type)
+{
+	switch (type) {
+	case SDCA_TERM_TYPE_LINEIN_STEREO:
+	case SDCA_TERM_TYPE_LINEIN_FRONT_LR:
+	case SDCA_TERM_TYPE_LINEIN_CENTER_LFE:
+	case SDCA_TERM_TYPE_LINEIN_SURROUND_LR:
+	case SDCA_TERM_TYPE_LINEIN_REAR_LR:
+		return SND_JACK_LINEIN;
+	case SDCA_TERM_TYPE_LINEOUT_STEREO:
+	case SDCA_TERM_TYPE_LINEOUT_FRONT_LR:
+	case SDCA_TERM_TYPE_LINEOUT_CENTER_LFE:
+	case SDCA_TERM_TYPE_LINEOUT_SURROUND_LR:
+	case SDCA_TERM_TYPE_LINEOUT_REAR_LR:
+		return SND_JACK_LINEOUT;
+	case SDCA_TERM_TYPE_MIC_JACK:
+		return SND_JACK_MICROPHONE;
+	case SDCA_TERM_TYPE_HEADPHONE_JACK:
+		return SND_JACK_HEADPHONE;
+	case SDCA_TERM_TYPE_HEADSET_JACK:
+		return SND_JACK_HEADSET;
+	default:
+		return 0;
+	}
+}
+
 /**
  * sdca_jack_set_jack - attach an ASoC jack to SDCA
  * @info: SDCA interrupt information.
@@ -154,7 +180,8 @@ EXPORT_SYMBOL_NS_GPL(sdca_jack_alloc_state, "SND_SOC_SDCA");
  */
 int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *jack)
 {
-	int i, ret;
+	int i, j;
+	int ret;
 
 	guard(mutex)(&info->irq_lock);
 
@@ -162,6 +189,7 @@ int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *ja
 		struct sdca_interrupt *interrupt = &info->irqs[i];
 		struct sdca_control *control = interrupt->control;
 		struct sdca_entity *entity = interrupt->entity;
+		struct sdca_control_range *range;
 		struct jack_state *jack_state;
 
 		if (!interrupt->irq)
@@ -169,9 +197,23 @@ int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *ja
 
 		switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
 		case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
+			range = sdca_selector_find_range(interrupt->dev, entity,
+							 SDCA_CTL_GE_SELECTED_MODE,
+							 SDCA_SELECTED_MODE_NCOLS, 0);
+			if (!range)
+				return -EINVAL;
+
 			jack_state = interrupt->priv;
 			jack_state->jack = jack;
 
+			for (j = 0; j < range->rows; j++) {
+				enum sdca_terminal_type type;
+
+				type = sdca_range(range, SDCA_SELECTED_MODE_TERM_TYPE, j);
+
+				jack_state->mask |= type_get_mask(type);
+			}
+
 			/* Report initial state in case IRQ was already handled */
 			ret = sdca_jack_report(interrupt);
 			if (ret)
@@ -191,7 +233,6 @@ int sdca_jack_report(struct sdca_interrupt *interrupt)
 	struct jack_state *jack_state = interrupt->priv;
 	struct sdca_control_range *range;
 	enum sdca_terminal_type type;
-	unsigned int report = 0;
 	unsigned int reg, val;
 	int ret;
 
@@ -213,35 +254,7 @@ int sdca_jack_report(struct sdca_interrupt *interrupt)
 	type = sdca_range_search(range, SDCA_SELECTED_MODE_INDEX,
 				 val, SDCA_SELECTED_MODE_TERM_TYPE);
 
-	switch (type) {
-	case SDCA_TERM_TYPE_LINEIN_STEREO:
-	case SDCA_TERM_TYPE_LINEIN_FRONT_LR:
-	case SDCA_TERM_TYPE_LINEIN_CENTER_LFE:
-	case SDCA_TERM_TYPE_LINEIN_SURROUND_LR:
-	case SDCA_TERM_TYPE_LINEIN_REAR_LR:
-		report = SND_JACK_LINEIN;
-		break;
-	case SDCA_TERM_TYPE_LINEOUT_STEREO:
-	case SDCA_TERM_TYPE_LINEOUT_FRONT_LR:
-	case SDCA_TERM_TYPE_LINEOUT_CENTER_LFE:
-	case SDCA_TERM_TYPE_LINEOUT_SURROUND_LR:
-	case SDCA_TERM_TYPE_LINEOUT_REAR_LR:
-		report = SND_JACK_LINEOUT;
-		break;
-	case SDCA_TERM_TYPE_MIC_JACK:
-		report = SND_JACK_MICROPHONE;
-		break;
-	case SDCA_TERM_TYPE_HEADPHONE_JACK:
-		report = SND_JACK_HEADPHONE;
-		break;
-	case SDCA_TERM_TYPE_HEADSET_JACK:
-		report = SND_JACK_HEADSET;
-		break;
-	default:
-		break;
-	}
-
-	snd_soc_jack_report(jack_state->jack, report, 0xFFFF);
+	snd_soc_jack_report(jack_state->jack, type_get_mask(type), jack_state->mask);
 
 	return 0;
 }
-- 
2.47.3

