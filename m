Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE62630E0ED;
	Thu, 30 Apr 2026 15:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777561844; cv=fail; b=AoKUxDabhV/MZKvjVs/gCKEn1yA32oEJIAL5qgt0FYe8P1ViG5kaBFs69ZACLikHk03sQdorDCfUg66lp1TByUJWqxDhH4PaEQUYKfy8mEZaee3g+Gen/FmqtCJvBfHCpXFC1lg4lU7V/ZG9KVyAqn9jrNQ9bY/nc7UZBpPPMSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777561844; c=relaxed/simple;
	bh=7/e1GRx3MuW+xkxbrHPYenjJtRODiO7Va5xLqxAzeFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQxzJu4ov4ksqakwedKgcly+9Rla9+xJW19bFvpucvBwphFoBew81YqE31tN09Y/gQphDYvMOnoKBlOzUX90Se6eqRqyczXd+5pQnNy0cmHeZRlVgUr3VHyVIwbCu8z8p9/8UxJ4JNxxI/Zuq1epLC75dNwEY5tGUdnPZQjgAhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FdPZea43; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=b2KYGtYd; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FdPZea43";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="b2KYGtYd"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U5NwWI2865616;
	Thu, 30 Apr 2026 10:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9s+e64GgZm7A4uMkb5RLaL/E0VSTXziB2qDU8dovn14=; b=
	FdPZea43FgTr8QCMSXj5zFEfBFv7spYflLMCOhJB0aiZvU6+P7us+TeC36Y4w7Tm
	JzNXuSOSZuqjC9sYnAcF040WvRUGbr9cmwz5yhBG60KBHvrbMCIAoZVctep3PJ6f
	QptMEa5sm9GP3Maa/DGjyteR66lk2REFycp5H3MjpwgAC12a55kgS6TESsAKK21s
	q/VmC/3tlKz82oGLyDmohrxa4vySgM682gL/TdeAXvlWI2gBfR3sujaYo5u6LzQi
	wX9342Skcoes4RHw3lwXVPqebhwOj+kVNoPS5dDnpoY7r3NwUZcO7pdNGAXtLr3q
	So4T8fFtu23Fcno2pbGh+w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020117.outbound.protection.outlook.com [52.101.56.117])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dru10eu9a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 10:09:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRTtxbQXxX+rPizx+NONOBHBp7XXHBJULHqV2lXD++ZE+n3zx5WPz7hkxSOsHp3Cx6+R4hga0SASBLIAk80ynZl1NOwww6QL+zhcWaSC8fkwUl9OcTxAzni3pDj6b568B2Uq5wvmehTZYLsahYeioSK7dGpBICfR2oV8N5+f0VMNBBdFT+k4MXdrxgcHqm4yQ5mJHeIE/CbrsopKaYLb74mQeS4coPvCrWUp4fFENNCxIAM5f+PUjYvPlwZhUi0iAq8F4faQlcEp2WtKL2HhZ3QCHivkQwgSf9nmr/9UQ9SwIkS4gd5yekEZ6qVIboPW6/O8ibNZgaUvVPXI8Ro60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9s+e64GgZm7A4uMkb5RLaL/E0VSTXziB2qDU8dovn14=;
 b=POyS+AgdIW0BEe0uqoJGx2ha47FU6hHXhfO7zzHF3ruUZHeiG+MjHVN0u2BaCNLqVZiF+UfKX69cS/ek6FCJOeySY2h+4Ks62VqUes4iZVg8LfOckX4h1FTrNszM8bTkfb/UuxcVbk0aFM2eTewoAQ0Uf9+GFh2XNNsKje7BtSTs8HRl+eURsz+1B92ByQCDm8xOLRTfvMm3Aqn0VSLyy/zhSHwnjUzS172N4z9b5PWOXSJtJZAU9KsB14lEHATDKNoNBMrR3vIoeLr9Kz322twN1zDi+CpskHl6bS4ddMfuFbBnV86b2r+h5LM5EW27traJJ/n/N3+FM8xX9TS4Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9s+e64GgZm7A4uMkb5RLaL/E0VSTXziB2qDU8dovn14=;
 b=b2KYGtYdCV3VgPtVNB02Bl9smbr/gwmRWsVxacBO7SBc8oDqFXLkvDwU7GrY/8vy8GyLoadYlRzhlk2iABBH98X5kklDETFkcsiSi75YQnpjNcMACRSSZQfpPYCyTQURVIh+opcJZYwb9qMW5310ZaMi2i4xkGRKibc5SL+687w=
Received: from SJ0PR13CA0024.namprd13.prod.outlook.com (2603:10b6:a03:2c0::29)
 by PH7PR19MB7463.namprd19.prod.outlook.com (2603:10b6:510:27a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Thu, 30 Apr
 2026 15:09:37 +0000
Received: from MW1PEPF0001615F.namprd21.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::89) by SJ0PR13CA0024.outlook.office365.com
 (2603:10b6:a03:2c0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.16 via Frontend Transport; Thu,
 30 Apr 2026 15:09:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW1PEPF0001615F.mail.protection.outlook.com (10.167.249.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.0
 via Frontend Transport; Thu, 30 Apr 2026 15:09:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 78990406550;
	Thu, 30 Apr 2026 15:09:34 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5663282025A;
	Thu, 30 Apr 2026 15:09:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        niranjan.hy@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 1/3] ASoC: SDCA: Add correct masks whilst reporting SDCA jack status
Date: Thu, 30 Apr 2026 16:09:29 +0100
Message-ID: <20260430150931.2025953-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430150931.2025953-1-ckeepax@opensource.cirrus.com>
References: <20260430150931.2025953-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615F:EE_|PH7PR19MB7463:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 49585a25-600a-4d1a-3f16-08dea6ca7e6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|7416014|376014|82310400026|16102099003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	y+ktwVq9FF/XouGK3H7Oje8bOCNeN+ieFL8wzBWRMydhYaQ97MkzvD6FfYtxFucXL2Ne5RcaPdE2CB5NlOKc7hI2ZQL76CZAdWvpZyK2bYzQEW9dbC4JIdjCOc6GjPrO1clH6wmy+LgXKqy4B+PTfN9RaZiZ0j15n8O9LhO7kUmTUTdj3aS58wi8eTq9TVNK8rBmlzejAcd2oeP4DqGI8ijPpcT3JOvM+XEQ/MOybdRJnnWTwMYGUBaZ+R8B1tbBrcPfXj/dzJNPzXEpYzGVBZzSeQ/zEVkMnsMS8WMWXrgxAvHVUa8D+yrlkDWNYDwqB77AjyrZlHsX/PWRw56vLDLdwc+i+wpTmUVJtPkIe4GcyXKGbKW3+RlhL4aaJRWAcLNORj8O/XkADABrxsSxMt9A+Hee959nywAjhlggsnVWhuPuUwG+0+5SLzCsEKKbtskWGVPQm8Sei8Z73oCBzYsVc8l13Br7lPZl0yGNdsdlfGLCsnYH6+utSD8LnXDmwLQTbIFConupohgztpSBxczfWucYiJHicgPeGvaJQItXSzA1uxLiHg7LDy7vwhm8gUxQKYlpbszyXs+paM5dnI/DKLSVbGHEEz/7qwYcILAGhjKgUSqfocJoZgART2FLsEgdcUkm1Mi4BtVq+fWLWfC/XCGei2vWRDSZTj++2WC/t2ebQUh1MO8RjL6FrXWLMJvC2oW+ZV7p+c+Ykio6seTY4lzyNzTqEh9kgSMivVZSCeaNc74DtNOx1CuI06UTNbYxpxgiP83WYIJAT43upQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(7416014)(376014)(82310400026)(16102099003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zgwPSAUxED0nWxsbv/Bc04Qp1lbd/y4DAcZbglp2d3fEXyV8PwXSYzWzHULaHE/v1yn/JMZwzefGcxF32jh0lLb9UNM8xLjebk41nBc02G3GekLHWLNo+TJAKrMisYntECuRhpABjpIxFLB4r/vIdJKg/9D0NFkQImcBSygzw39Y7hDnjJe+dP8GhJ+ml7AK2+cIwTgsKgdtt9ja7/aGmQc1XlPm4ruZwwpp8FlK7UxNYngC9XM8RPRv2LrdPKKVq9hduu3K/a6VB8nsIxszL+aJ2U7Pd8DSldSjvP98olczonbCB4zRfD776fG4bji0QF/Zsnh2uvjwX8Ykt6cR4WAeYWSSHAIIc09mKwgyY9TAnfrWuJfYVe7GcG0hOxT3awYH+LQiVvcBpGZHrvNwLkelSAAxdwxqtygHViDAwei3FdD6y9a1ELTLw8nk+r/v
X-Exchange-RoutingPolicyChecked:
	vuIXuIbEmzSWtGfxmxPD6gvm1gL9WJLyikEBccvUnODvBiHnM1hLIovqS6NvcA5iwcsjXxEE9aX3TeQuVIqFfL3L5fUY3Al8h+k0EWSSI/N+fdquqmDVr2KuqGbdBGvoX9VCt0ibzTLhzlyfYZikErLe1N3TYRy5bLmJX5XXozPjqJ9gOLQ2PEkNnFlxr1UuJb6kWO74QXNKMwQ+Pk897JKKvlnEsf7dZzdTI03QjR4IItn++QsSbsGePHws3mMaGwAkEowRRnS7ogJ8XnFas28jKk4dbp7G9Iu0VqcSmnQAibxfPDHi0sxrhxFDeVHP/J3gF9amF6nAEjItnpRhXg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 15:09:36.4554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49585a25-600a-4d1a-3f16-08dea6ca7e6c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW1PEPF0001615F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7463
X-Proofpoint-ORIG-GUID: aHroiWgkusB0s_027sBBUxfH9ATSeFki
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE1NiBTYWx0ZWRfXyryiinlBBF5P
 n1rPA0iEDI08fFFHSXe3ZQo4sCWE/YzEAc1Jcy5ycu0sVsUKF8TlOOIUc1PDVubRIPea6v08VSq
 4CKI31sKxebrawFhUMzkXUX9MHSvzUyHil0hYmpPNq4EUg3CDSlYEOc/I4r9ME4fc3fbdfGH5T/
 eyRg8JSfkh3TsblnJWt28FY+nLEq3oC+J6yegL6NSgAydy0GXhzfCLC8/xxu0TKokWZIPwftDYG
 qGVIrRUj7KUEZTxtnNZaEN83W7JL4xPGjDKijJx1ptynNTG8XCKtc48zp3kfUQO2vQs8ypOONWr
 Qia2ZDWWlk8QU9pkM6Ff34Jn3yMjyJ8r650uJIkPiYB2/bRPX6jTPBSCu42S8QGXQBb2i4j3RqZ
 60g0cHS5fRCKMK+5f7L0fqxCDSX87oMr3kjXQqKno9/rVh00CT+iab1CmVmHlx0nyzIT7KcQaib
 iS/v0Srnb8GP0aRWBUw==
X-Authority-Analysis: v=2.4 cv=EuTiaycA c=1 sm=1 tr=0 ts=69f370b7 cx=c_pps
 a=v6Z6meDQFn3ji2zknzBGMg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=M2GLoMmDkqpnuoSPwl0A:9
X-Proofpoint-GUID: aHroiWgkusB0s_027sBBUxfH9ATSeFki
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

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Slightly reorder sdca_jack_set_jack just to make things a littler
   neater.

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
index 49d317d3b8c85..a2d95b124b789 100644
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
@@ -169,6 +197,20 @@ int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *ja
 
 		switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
 		case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
+			range = sdca_selector_find_range(interrupt->dev, entity,
+							 SDCA_CTL_GE_SELECTED_MODE,
+							 SDCA_SELECTED_MODE_NCOLS, 0);
+			if (!range)
+				return -EINVAL;
+
+			for (j = 0; j < range->rows; j++) {
+				enum sdca_terminal_type type;
+
+				type = sdca_range(range, SDCA_SELECTED_MODE_TERM_TYPE, j);
+
+				jack_state->mask |= type_get_mask(type);
+			}
+
 			jack_state = interrupt->priv;
 			jack_state->jack = jack;
 
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

