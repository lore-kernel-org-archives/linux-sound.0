Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3082A3A1696;
	Thu, 30 Apr 2026 10:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777544515; cv=fail; b=Anxjv3/vY8/J5yNUIB1l/g9YwHKEA9UWyoRk9DDuWggAG4fcOky6S07XNHXBjyEBy1BbCWDys8aSlEC8/0XrgWJ5dBDfczAVM22cVjPBiOl8c6pwslaEZEkKGMEXgFB9JunVM0iLlXUZMIcDiI4Byd33s1I2PndgNJPXl9d5dIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777544515; c=relaxed/simple;
	bh=pVXKq0/LOF8zmbzhCiBDVZn7c61XAROge9XxfCZRXp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NDI41oW2oIfuFOtwMZZ795SJXVPGhL1y99YVLdZtPrch/cd11hltpq2oN87W/+uBoUEZpwPiltnevwTeNPuOYlMc1U0cSKyvkj4bEJw1dRtTn9T5ULZm2FFHd/fqJ7TGyZdG26r0ogHe1iCe6Jc1p9MGUqa9PLrovW0RpCoYnRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UoN0PHa6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vh0tRmuR; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UoN0PHa6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vh0tRmuR"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U5NwGx2865616;
	Thu, 30 Apr 2026 05:21:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=AEaz+vOsUMSC/xFJ887qslRPiEI3PZQKQqdnkIMmPP0=; b=
	UoN0PHa6LGlARnMPA7eGgHY7es5ECjHwR1nDvh5picdNEl8kmQByRFaCh2dNsn95
	Z9tnjqdRlWzONhFKlVjIpfJVeGIA4ywE4ALLG6mSen4psQ7QBQU4d+ZIjrF+Dwb4
	EJzyF/MKOAgUBmQ6L0k36yqMy8yp568PgeqFPtWzk4yBXBvqXDpkHGcTQcSecBF1
	0OESO0+j+rqBEt+/Fd6HUKri/621q8EoqziUKKnp0Gy13cBE5tBCkS+nol3vz1t3
	12KuEl7mqw5FKcIWmmrMH0JO4o8WkKyBarne0xWLbYXFDHEJXIpU3FWX1mHo5dr4
	/OQHWxX1BZC2yRYOzYnlhg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021111.outbound.protection.outlook.com [40.93.194.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dru10efkf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 05:21:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsAZ4klZIAxB4Ber5j+BI1EpR4dCRhCQBrrqHnMgFOipgiSDEirRs+6tbDYw8OpWhF5CPyVSViuk09JWLJF6103yY+gDyLCsDGj5YHV24NTv4RQ9irnqFGd9RqtzfJj25s0WKEMNVNFnuzMhAn7N/vcNsEV82b3OBIfXjd7lEearAppZAhBncyxM4dCQAvLmw12xIBP7Ylmus6FzR1LpkVCgvz26GVbNxc+arOddld6XTxurQq54cwYTQBDs6LHpSPULHQlzdFwvMp3Eq0ZYjocyroySZbC3khrR1GXdTlL71hHj1OZZnDaAgA6iVMZ6rn+yX+Ga1S7BVfsSXZ4WFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEaz+vOsUMSC/xFJ887qslRPiEI3PZQKQqdnkIMmPP0=;
 b=PFXfjgMKAOmDZ3U6eEaVoKv2S7kWIUNYrYShbxu6sWVugZeJLBg14cJ6ZV0oVlN7o3acEloDAcJibbYWNedPIOna8MNfsVvwNrLCdoLwMKoNzJqbDMwasWkBjD5v+qISCql+MWS4RdTiYoqQRGf2TlD3oRLZ/5C3znXkVzOPpebBkIi9vdJp5MoeK6e36QLMzRbhGdFQkru3iE+HSYJrc2mr8FNNo4m9kR0VNmc0lS8IMlK0afkt08axQDLRP/XyzIT64pUNoaIJ/o4ZvUdB3gCG7BXJcgCsBKNAFhGjAQVLCTBw2Dxp+l54NLdramjMVIGPFKOuBG2Mp0f9UCh5og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEaz+vOsUMSC/xFJ887qslRPiEI3PZQKQqdnkIMmPP0=;
 b=vh0tRmuRCobDqPcLIPp9mPn1nt2b0BJFnn3KzJt9mdJfU2ie2eDKCrDQjKkeV/dk80cvkMbIO+/Fub3MhI8ecizSftkgotPR+87NPw6sFWsFR+dbhR7WM7MmrlnGrndcr/KwjXZnTKXPE5WUv/vGqJ4tJPCHQ+WAbEH2O6wQCt8=
Received: from CY5PR22CA0022.namprd22.prod.outlook.com (2603:10b6:930:16::35)
 by SJ1PR19MB8288.namprd19.prod.outlook.com (2603:10b6:a03:45d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 10:21:25 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:930:16:cafe::73) by CY5PR22CA0022.outlook.office365.com
 (2603:10b6:930:16::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Thu,
 30 Apr 2026 10:21:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.22
 via Frontend Transport; Thu, 30 Apr 2026 10:21:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D216F406550;
	Thu, 30 Apr 2026 10:21:23 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ACAD782025A;
	Thu, 30 Apr 2026 10:21:23 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        niranjan.hy@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 1/3] ASoC: SDCA: Add correct masks whilst reporting SDCA jack status
Date: Thu, 30 Apr 2026 11:21:18 +0100
Message-ID: <20260430102120.1283320-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430102120.1283320-1-ckeepax@opensource.cirrus.com>
References: <20260430102120.1283320-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|SJ1PR19MB8288:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ae8b5d35-a589-440b-643c-08dea6a23bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|61400799027|56012099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	K/mWGkKs5hoepg5hi8o8HtLG/55AV5R3QzhSFRLXktmOHOUpc4zw433fSJiqOU2fPnVMFdPmzo2IrIr1Ffqh70jgmngI/0egiv1U6JNRBNIuokBZEteNLjbLKHw6QDUCMN20vwhBJTXEZ2CG8wj+MlfYtQ8w1+aYQ/ufm8MuOQBYKVrnQGyyk5KIY34H5SB6FYBLpU0JU1vTlArmdHr3EiMjPQIvzp3hx63vNPe8KalZfPYuqc3By+sZOoMM26SQ4bXdFaJMxVVo3Mjbe+rH50NiEZgGfIDDz4btQZXDs46UCaaWt+8acnYhSoTheTSahH2OF6l9tfkuRJ4CotP4/4xpjgBHVMHLTA7Xj+McQi59dhVH84Q55mCy6I/Bfj3L/PUPEWyEtvojwGGQPev6PcxAQrPGze4Yyf/6VAc/VirR0NC0CpcAz4mtCrQoW9K6U2lSdO6P7PW9MTu9gG2E+PQTZ8081sIG6qYn9Iwz5WQUrHaWcaAqjHuN8ETIuetu6GhWLlgEKgH4a2dYz9eQ6ltR54qtSrcuoRY0X37Sn4H4w/3InLSoIdhdDGK5C+O92ZKuuXizALrRr6pvCCbibXq1Jp4GBrocGrW5vW6R2t23Uncb1aUgqvClgGES+sru4KDuuoV7Y34un+BUhsaW5GolDIPwQ47eHAG4+1/MNlZntBNfLZ7ULVlBCdo91OOig1uGITlhSL39E09G0OX+/V8LpI43feQ80m3ayWFIGzOGEyE7IwQB0dDjz9Ecc9+btV2ga0oxUS4+FNKCt5AAGA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(61400799027)(56012099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fjRHiE9VPE8ZfDRn9ncu3zOCb3b23I+hLD1kEuaqNLxv2ftYJsAV+21/YkA0tcrNJo2Oq47picRHgEZectkPAa7RhlXum2SCFo7cQuIRXjZ7PosZlWov+GEF7DGsDr6bGZ/2ZrgDTMj9v2wf217+UO+A8Euwytq4Yt8MLcxZbfj8PsV6Ycerf/MbJdD24+7yHevxwgmDYkCb0m7k3FgLAj4VuntY0UT28XbVQpqy2pbcJHLJ4OlBBrZQOyiOR3YpnKbh0E79Ik3y6meEGpUWNCADZ5Jq7lY6gEy+H8xwSMvWSoQFNwe7oLZejwE4hXmgcF/l9Qv3HY4rbwho31d7xvdRcDks7GzddVauRzK2K98AZoiALrt2Gqqi6uyve1YqfrzqjRZYEP8ZwzRbwxe0EBHs5m8EgXcOA6bDnJWUTBINM6WcENT3dDrpPEDOGfXy
X-Exchange-RoutingPolicyChecked:
	iQa4NyWlgpR14+vgD3qZJhMD9wsxBYbU4X6a7yGp5YWw24bLcIAuEaV8+V/TrsGMTrLHF4z3//LkY3Z5efNM8cNk7W3d14eJDi2A9lBvqMAPNIJ7b89R98s4jrLe7XWgpvDI1x6M156QDc1M7IK0clDmoeXY60tty4gm+QlpoyoazMvf9KBmS09PkkwLI98pugvT7zOdOCkK7zm0GMIXtp5b8KcV/kqCL1SY3fQbPr06/oFa2gUHuRXC/ThqugXkdFFgF+nliU8jfUVah77fogYsdrYmrjl2ZiPi4uW2IH88gm5rrC/7NhFx9bue/0X7wCHvhGBy0/o5JX2v0LqVJg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 10:21:24.8016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8b5d35-a589-440b-643c-08dea6a23bbe
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR19MB8288
X-Proofpoint-ORIG-GUID: 9VPft-6XRZqG3ofqisR5nbNsHJbGupmw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEwMyBTYWx0ZWRfX989QRDeV0khg
 bcPzBvUyOo3IGxrjQ6A8wJHdRvv3nD7PG7BCEU+xB8sCYV4Yf0UY48jvx/qjhT9WTWH8vHQY+XN
 f5vMtCIIRZBOhnQK2wTqqpOdWxwGkt7upgDKicKr0lqpcJEnlonwM1l9blhQ02ftCyuGSfwzoiK
 c1g3VCD5nShDJFeRTMnDMhIHUp4aeMXVOpyH8AEHK/iOmkG2j4SN0mWCoz5K0A3CAO3lig1/ddA
 fR8ekQoucBZAPiPiNnXJp4pmyvCZf2qfeGR/EzD+P0cDi1g7W1ih0lrdyiX8DU7Cs/1/R43fBEL
 bo29SF/ZDcHkAfxJ0omft1fS9u1Xg+MTfas3yCtLdgEH2w3OLOCJolGjYC5bYldLTWvreRn8iPL
 04A7ZrHyALwUxrVZetMkj7j75kEWjzH646DPxuct98gIxj8lif5S20s2zjeKdCFalb8anYXw/ge
 KdJFyBZdrMKKwuSWzHQ==
X-Authority-Analysis: v=2.4 cv=EuTiaycA c=1 sm=1 tr=0 ts=69f32d2e cx=c_pps
 a=Xow/CfGS+sd61STD3JSCXQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=M2GLoMmDkqpnuoSPwl0A:9
X-Proofpoint-GUID: 9VPft-6XRZqG3ofqisR5nbNsHJbGupmw
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

No changes since v1.

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

