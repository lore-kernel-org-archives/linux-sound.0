Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05A5430315;
	Thu, 16 Jul 2026 14:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212030; cv=fail; b=HPL7pyXMJUBy5kKnoFxjejQo/lxwd2iq1jOdwm0Pp2dl0LzbttCCQeK9vVXAXn0BK+0I3kEsgM0VUpL1EOPXLWEpCsb3ZkXqJj1RSYkgADhn95eRILywBMyK6J9+lPE6oBfR490yPcxgNxA4mej6WXolMj2c758AqIPeWw/veZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212030; c=relaxed/simple;
	bh=Yx+J0yE6XGiLBZ1t7ALJKVC3mza22SQBSC+Cu3Db9u0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uAH+IbkwAfznZI1rHqn+7/mq7Au9VJtUInS+ar7Y/4kI9qJ2XbfoUw5xggIvNlX9ju0MC4zZ9nyIaYXyZcr/ZlXdAzm/l/YHKYIfW6o1VOw1J5ln9PQlVFp2ZXHlmVj8edIEv4IpKjCcrESeoisT2kqJtiUqUCFpWEub7Cu0yN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WdogF0uE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Nm/teU9e; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WdogF0uE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Nm/teU9e"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G5sV2b242232;
	Thu, 16 Jul 2026 09:26:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Gd76c2J+2crz1HJKcPVOI6cQCzodIzDgHN6n+8ajpHM=; b=
	WdogF0uEXu/vEC4JXNdMKtT36gyC7DszX5D+xtAoTeRHX7498GUbEqU314U2BX0g
	MM8HKCwUN01nKLO5B6GFe6D/vwCjNjgr1cp586FzqBtOZOfpmk7nLEj2OhSWwgm6
	kdvFSuQ6dl/R3OdmAFC5hFuYhotZ5lk+usztgymgF62l/tVjzKUoZsPFA02xBsuB
	Cns45BPduoZJYuyb7KizFKPBNamczh/PIoCCYkDamoIxwY4GwDidoHrRrTrBex7L
	xwQGkiEsYYT8atg+Rf26cCG9UbkmvbZ67E95wXzZOccbZIckQcUJCsGeistr/b5L
	GSAs6PIEp/3+4ldK1TQZJw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023134.outbound.protection.outlook.com [40.93.201.134])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fbj8fq9s1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 09:26:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcdcEJ5BT3K9ynEa8Fgow7arTlXmzVJ47/i8AdltzbAzGDwO2WlQSPyhwAHf7DEPaZ4dudgU4eusI+K4Tb1dcArpTw6E0PsxgY9yqn3kqxr46E5wSo0IKk9vjMAKKyfXmJ7/kVW6UAtZbVLiXhXuqHu2e+AgTqB6cfACivflkRP/RL/xmkimfXgd4ZvX2sWvVxuygrIvY/95HVDLj6u2yHCuf+ZGkThUMbOGOo4nh7jyVvTZQpr0AG4lRAWblEWzqPBn2XFIg/g2oD0e3MMnFezYky/Nerj1Vo+NLp/fxPtGnv8wr/uSEVX5LpHx9/v+/llBLaPPRNcqpTlVcE2riA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gd76c2J+2crz1HJKcPVOI6cQCzodIzDgHN6n+8ajpHM=;
 b=LrpjcM+gvCaadQ82XKXelHOiJYh8PbxaFoZ45KRidCVgcCHNTWrU8H26EtggNF7FgZihuBd4g1GpIEL3NAqYHNJoP3QPVGzJc4oSmheZ5kY/IOwby/7xrdBmnmFR8xrtvED8kPFWJGLFh3VIWRzvHjZbh+8h/oAhD5Rp5FDxufy/Bb2m5SAcqEiWy1V5Kh8sNMkuRcbuDvqTQBia+TUEIJaLNCsDM/M0NeIGWUauy6tYT3wblswHoIFZm/zOVoHkrbwz3OXZHPPGRIM6ycqihfqe9DAH7+l1lLyV5l2SeHwZv5qAgilEb5s5cTvks9aoSyboJbT0xyYuPo0fno2igQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gd76c2J+2crz1HJKcPVOI6cQCzodIzDgHN6n+8ajpHM=;
 b=Nm/teU9eXj0J6/L6Q2jBDrfUgjAJeIkww3J+VRxKeruWE8Dt3N043H9HMeBz7PYLubIdInoz6vPGfrCsAI6wJqykaPJykRaOV2CVYFhDJxVbzq8qBywCU+MPKuk3qxdhkkPSvSfokqjmq8yuuR69c0i5iPkmQ6lKRkDH0KUWwm0=
Received: from DS1PR06CA0023.namprd06.prod.outlook.com (2603:10b6:8:23e::16)
 by SJ1PR19MB6283.namprd19.prod.outlook.com (2603:10b6:a03:45a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 14:26:45 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:8:23e:cafe::9) by DS1PR06CA0023.outlook.office365.com
 (2603:10b6:8:23e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 14:26:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5 via
 Frontend Transport; Thu, 16 Jul 2026 14:26:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 06868406542;
	Thu, 16 Jul 2026 14:26:43 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DD8B782026C;
	Thu, 16 Jul 2026 14:26:42 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 1/4] ASoC: Add a component fixup_controls callback
Date: Thu, 16 Jul 2026 15:26:36 +0100
Message-ID: <20260716142639.2306757-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716142639.2306757-1-ckeepax@opensource.cirrus.com>
References: <20260716142639.2306757-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|SJ1PR19MB6283:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4f20fc7d-ee97-44f7-2e70-08dee3464311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|30052699003|61400799027|36860700016|18002099003|22082099003|16102099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	3uqpD+40XSvUjuUQryaT7hGIB/S2LH5JRq0YxTLW5wgm6hsz/DnLoOnMTut/JrYLwXVXn1sO+Tj+BYLuJ58330UORt2j03HEPhI3lTALDulo5PzJP3jZs31zxEZzYu+I3oMyRfM6C7E6a3rdx+lecC/DR270S2ICj8+NmuHt6oVYjRWYFeGSTLmRVn9ssaAOp2Trd2ewjhzAtJI7S0YQO+mGCigBRVlLUJWz3/FKEzXveCY2REynZL5nwQeUAPAjvEIn1VdOtYhDuP39f188sUcGA5b0tDCWw5HYPU8TNqzaP1qzVS7R/wcMgEYCQrYjKkJyTuPwZPJg0GCWOCO9DV3VjStTarxomBnSZLf50gUHLJdBCL8LEdLtZyJ8cSXnYYJfhE2zdJs6vbDEJMlS0XRRc6Y2ioijIZykbyaSJVJaIFiTSpE6Vs/ek0vv5/95eoKmpm1i290TDfPTr8dcQh1L89znkU2S8UAmd19RkfUqTvdrk1PDDOXxAftjnRmBcsiNjCaZvIO2RQ5mzVOKZDadJTfxWnOLhtifkjldLsELXu7+t56qmm10oJClijsN0qzfi158jNsf+CZfYB2Sc0yAmVz9KOs6/3BTgoqZy/IlaRfRfbWaZbppQdJAwShyEmxGXeNzgXWV5P/Wag49oAdhSJlob9rrCl3t7WyYs1pB6LWmtcxY0L9KgHBoMpqNELwZvh9lozGLU1B87GUijA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(30052699003)(61400799027)(36860700016)(18002099003)(22082099003)(16102099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DnY73cweiXipMr95RloUoicvqCIsUj3Wj6m4Q6UUAFPht089NsVWxailHk0fHI5bOLW6CYT9uG4t1OzCRiSikhzdo0aLVJrzjdw46hDiqHvyJw+jMnntuWkSETRRs1N87OXrPD+KKq5pj17Oz4vrDwzFtMpSGlXYoJjvGCz+Oed7l21v15R+PZnVg4/klIpAaqCzVwR/j6ku7Yxa+u8+OnDEzCqCT5dBV6yE6KdN07K78SRhdepLjL0jpVj0Oa8KGvENZ5Nv5VuGRDI6yqDhZm0UQa2i4Fg9hAD/j65//EvjeiIVrK9ClOyQuI6ZKGxXeJHzPs/dK3QQRgqczVihmX0yV//+RQnX9ctR/YHxVAOts1CGlb/tJAnIzYr/nvHNVNXVWbSRxx+fpaxMHGipx+gjlSyznUmgLFu4f/iwNFpGpjuEY+uVYX8Dis9LiEl+
X-Exchange-RoutingPolicyChecked:
	V/J3SNfiWIUzoefLO8he8ygrTJzgOWDDEi7dENpWydTtlgY4evaDD0ZY8mEs6rAMPfNPIWmh8Mp/kc7Mo/mFl0GdQXhibB3ecc6iMW8Fx2uBohMWOTBxjpmvuev/yrKchtm62XpHmdZSiM8MWKUB9fe+iAGbtwaMHUGb6vkdmBsMKbd14ui73l0iSJU0CfB0/a/53L172Frr81BO541TifIJiyK0Kdghihe1O5peAM/EoxwLck2mqV4elmSYh47tZKsILMv1+vBQhBf5HP8EU7iZp3w4al+ujgvAO9aa8gZsVWGUpVwoY86UE/E75GrQskcE3lH/fkmgJ7D+TcQwnw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 14:26:44.2841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f20fc7d-ee97-44f7-2e70-08dee3464311
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR19MB6283
X-Proofpoint-GUID: oww3FdfG0SdnmgTC68Qj-4ozpRxIQwDA
X-Proofpoint-ORIG-GUID: oww3FdfG0SdnmgTC68Qj-4ozpRxIQwDA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfXyLujS2f5QfxU
 WwFgnidZS1SFzf0qZr3UiftmrZL2W6NXJITzLQrF5e7MBt3fGhUWLuxb9+2jQ0iKEkd/FZbuUNL
 iNa2BocKdXFvS08Tr5SFBUQF/7azSRU=
X-Authority-Analysis: v=2.4 cv=M7597Sws c=1 sm=1 tr=0 ts=6a58ea2d cx=c_pps
 a=kguG1nR2ma0GTtLk2h9wKQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=z9ncmWt8M9pI67tEN-gA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfX4snBDgb6Ml0k
 9SnP+BWj+Wzqe6j004TAI6ju93wgkgu+dL7JrxdChZTonz3o507S4KePIz07XmXGGrGF5nDlgdd
 iB9zyptBY6TL2ovSfB0JbshxAhTcA4laZYgBqwoQNzGMENChC/EXC+kidTHylDzRcHssBrxmAoh
 FdGI7Stmi9ZeowiH2VoqGRX35UldBk4GbdakZDbOILn8vq1uAtv9W15XJHbMkV/wcrdZc0tu+tK
 PakqmkWAJiUZYnMNWWQe7RsNiJTxdLIY9jO10UrotFV/9slry9dxLBl+TCeY7a55kb1s3ZhKo74
 ros0cnKW8aHBztfxqw5n3Pz36iRz5cE2Xmxq7EvdZVN1LMWkBsy3oksnVcSfET+TIBPP1X+FEad
 ebJl1pFLzhiCdNdbYZlb4xFIFpea/JUhSc4PCW8hY5RzfuW+cyJt53a3JZ8T8jlkd8MSr7c7hMw
 4yqdwHZ+84/iRfUOYhg==
X-Proofpoint-Spam-Reason: safe

A card level fixup_controls callback was added in:

commit df4d27b19b89 ("ASoC: Introduce 'fixup_controls' card method")

This allowed the machine driver to take actions after all the
card controls have been added. However, there are times when a
codec driver would also want to do things like obtain references
to controls for later use, which require all the controls to be
present. Add a component level fixup_controls callback, echoing
the card level option.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/soc-component.h |  2 ++
 sound/soc/soc-component.c     | 10 ++++++++++
 sound/soc/soc-core.c          |  5 +++++
 3 files changed, 17 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index aa423865dbe7c..4b7d7954953db 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -78,6 +78,7 @@ struct snd_soc_component_driver {
 	unsigned int num_dapm_routes;
 
 	int (*probe)(struct snd_soc_component *component);
+	int (*fixup_controls)(struct snd_soc_component *component);
 	void (*remove)(struct snd_soc_component *component);
 	int (*suspend)(struct snd_soc_component *component);
 	int (*resume)(struct snd_soc_component *component);
@@ -380,6 +381,7 @@ void snd_soc_component_suspend(struct snd_soc_component *component);
 void snd_soc_component_resume(struct snd_soc_component *component);
 int snd_soc_component_is_suspended(struct snd_soc_component *component);
 int snd_soc_component_probe(struct snd_soc_component *component);
+int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 void snd_soc_component_remove(struct snd_soc_component *component);
 int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
 				      struct device_node *ep);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 21492d15833f7..2ce24513fac5d 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -310,6 +310,16 @@ int snd_soc_component_probe(struct snd_soc_component *component)
 	return soc_component_ret(component, ret);
 }
 
+int snd_soc_component_fixup_controls(struct snd_soc_component *component)
+{
+	int ret = 0;
+
+	if (component->driver->fixup_controls)
+		ret = component->driver->fixup_controls(component);
+
+	return soc_component_ret(component, ret);
+}
+
 void snd_soc_component_remove(struct snd_soc_component *component)
 {
 	if (component->driver->remove)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7817beea5b3bc..44f9bb4473f55 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2162,6 +2162,11 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		goto probe_end;
 
 	snd_soc_dapm_new_widgets(card);
+	for_each_card_components(card, component) {
+		ret = snd_soc_component_fixup_controls(component);
+		if (ret < 0)
+			goto probe_end;
+	}
 	snd_soc_card_fixup_controls(card);
 
 	ret = snd_card_register(card->snd_card);
-- 
2.47.3

