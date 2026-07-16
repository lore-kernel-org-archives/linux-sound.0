Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592584302E1;
	Thu, 16 Jul 2026 14:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212028; cv=fail; b=Z/2Yrg6A1FT4FwLRFgsb7cyltwl+hpsLtnMPxEQ4hl8wrdjRnmW71lcMp3SiB1YXYsgCSrk6mbCjIXNCzoF3aD1bq+nl3+Quh1jwdrqaSuQYFCW2VpEednlevc2tzKceOUqKVGrZ/NcgwOuacETzmW+3PZxmnHxI3rm0bhX7KJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212028; c=relaxed/simple;
	bh=zYi41jIcYpo6SoKSQ1uTUyT6ESvzF1dlnl71CaqwuJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eOy0Ky3rj7pPp97rDaaZRqzaXcrXLvYfNm9PrpiZJ4e9W980DUWc4JF+jCkZqXmm3fzvfGwWR+tr7agfhDye5S9jHmhvGosdYBIk8Anm3h6GV/bHxMJmL9tAcwYtg/fCMIbjAWLlF9xECb6svVW01cMVr/Ubuw2YhjY975Ba048=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JikKat/n; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vqno7BYm; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JikKat/n";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vqno7BYm"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G5sV2a242232;
	Thu, 16 Jul 2026 09:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=S0JCv2MdJqsLJbuNWod6Rp9DXkexzLs+Q6eWqqwilwY=; b=
	JikKat/nSYHl2rKhZwrdMbAl906IiMpy+A/5JAoX8IAgMZ/yBVvD/X6M+1JqocuN
	lhnaKAz+8Az2QnWf7vITAAR6LANcMpAIzk1lLYeukJ7lbZLIDtLrwXrIuO1F42qv
	+EC9UW3QdCgQH4e8G2aP/dGLPktnATIOc/6A3N0RiQWoXIxsq0sXfM07RPnXkJeJ
	S12TYwr+VZbsxpkNFvmS9Jc8iUA4TZKaUdXQTqIPXXkHuFjwtA4psIW5hVaSVTFN
	m8CZNPvO0oreaSgPXRCLCFkgriqxVjw0sOLY1h+XvqD4QuEkZ2xXQ4ihvZdlWRPa
	e2cZpDN21sd5rkt7L4JxgQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022110.outbound.protection.outlook.com [52.101.43.110])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fbj8fq9rt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 09:26:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hejyG56G1zcA/wmQubKKlBdrTAPdPN+r7ptzENgaOHYmqZ1dWzONXYb4pyMxhEgguz+E3rUPPBnyuyZHs99ZJMdGutgFmgzcaB6x5rBEocqzPxiKTp6IDf4gNOulKA+3XbMtTADYZM/UZZHzQiV7nLsPzoD68JY8QIyhU2+Qia+bw6rZDnmIW+gR5x2h4iOEWcu/JmJftupeEybvtiX7uyrJz2JG5/Xp1J/o04yvx+HsYkqsru1QwPUAwcpkzvK8eLPhf4JPVG+c/DVvrv6ppIlf5ZD62TVYFZH2gBeiNGY8Ea0KKlc1O6utZeHUGpStDz1/oIZfr6Sxrcsr8CpwHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0JCv2MdJqsLJbuNWod6Rp9DXkexzLs+Q6eWqqwilwY=;
 b=FtfLWrFL8v+QY/JqSWtJYUi0eDcb9xOchbJO0HmVekAJ9tY6JFfiRqgxI3d3+uoG+6rV78alhT4Vc5QEzgHq3G6OphJNtyJXYGBn5gL4E7/q82agXzkAKbEqckk7Xe1odbpe3AtkeySVqzeVK7ZAHkUAEalsqGFfgmYdvZ99bbr5wxnxIb89O46wsFbWjwQHXdmGjWaKWP6MVaw7soZvu6+g0LMYLx2/QChGRvSxV6l6djzHHCcBSQP9DNmshiAXG3Gly0v2i74xgL404hLtLx94Dld5vXE0dcbeuAnITkqz8Bizqx1ApTIxvcXVi3FSfA0MdCy2ytCyw7aarcHvjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0JCv2MdJqsLJbuNWod6Rp9DXkexzLs+Q6eWqqwilwY=;
 b=vqno7BYmRug2dt5sKgTsCTATa9NNQwNx5iSPnhXnJmf/Mqt158z+xiHmUT2KLx2fbM+QQ6/LKgZk29PJy7gytUqJqJ720ApgO6Jj9fOYUu94OKAw1puSZkHfN6XQE9ZgWwG1q1A2PaeHegTzr1D+1qvulfHryLM4aBxjwe8armk=
Received: from DS7PR06CA0007.namprd06.prod.outlook.com (2603:10b6:8:2a::25) by
 LV0PR19MB9646.namprd19.prod.outlook.com (2603:10b6:408:31f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 14:26:45 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::8d) by DS7PR06CA0007.outlook.office365.com
 (2603:10b6:8:2a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 14:26:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Thu, 16 Jul 2026 14:26:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 06911406543;
	Thu, 16 Jul 2026 14:26:43 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E02B0822542;
	Thu, 16 Jul 2026 14:26:42 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 2/4] ASoC: SDCA: Populate IRQ data earlier
Date: Thu, 16 Jul 2026 15:26:37 +0100
Message-ID: <20260716142639.2306757-3-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|LV0PR19MB9646:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 51f4de72-1e41-412c-ec44-08dee34642fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|376014|82310400026|36860700016|10067099003|16102099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DfC5eZvpQ0NqN7QpGANLmefh+at1Nto7LsBbEkfU4TiqFPF8ZQBVOQaQxlFL44SZJYU2k023+eo5zPi0HlXidtVmD0oV7xugmOYsYLPrVmjqimNMmf6j6DABZDx1kBBwkfpAdCBBOlUxNwPIyWOD8UprOPWU6mnP9SjK+CH7AIgJmZPfXflJt4+I4xYfOfTBnl0NNprmgs0hWq2PO3VqOnfRvFh41Ru44exZ0iI2bgPLKW7YA3Gd5dXjVeXJrRsX5R8c735nYR0vNBc/B7LnBxMX/oqYFN4pkEKOupjem0UG6JBad/t8HksDgXxFbC65yWTdUeF8apwUvkf9Zu03J4r33KOucUFt7v3RWp3gxMtmFDpeyt54xKVbaeMeTCO278C3aL6HZDeNbDcrBUGKM378pZi4I9RDYpdgTG9BgJak8GK0xFAGSLkuQWEIJkv5T654V4zQBlB/psDPTFbc/MYn7NxMEV7IPKxOkBeph5sb+U1dbKnGyJNZ2HptkOqEFVuVBDu+QBSPTxaHRMNSDEvvFBX8Z8h3c1STSzPhtbP9MRtOAadutPFRUN/NJ67WNezK5Xt0ebPXHKFwMp5fj9Ja6ir38dVK80Np3antLXxmDBvDJViE0vjeWT8BZtCUVQ2cNqPFe+/Oi5aGOahJvsrl7by+28FxCrBHTtMdh4d+b0ncjKJWhqnQyksb5GHBy92MKQ3cb7T/SvdzWGiJqA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(376014)(82310400026)(36860700016)(10067099003)(16102099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	227k1rSM6jrWKMYj39sMKISlHjYlH52RS6DjdcT2iOLuE0RpK4NdQXzKGk/RBqK+PKrOu1Oyb+skkKs3eIDSpZYmMIT7huHBFvr4wSKk/EZszc1s8Y3mRAdD7saNX2aBvfDYAFZQ/aH0kl29hqVLNftxKc827qYxCnUpXpb0is3XFP4M8KRGNfMloHp8m46DPaaBzHNGKi6ZvANa8XH7lm3TmD+yNrau9yYFkndFsJCgmr9o7a5PiHYNYhv2ZkYbvFmbfluWd8a0Ly0qX0kfQOegxM7+as96QIuF1O/j7nlAccpFCTKN6CFR2wb13u8BSeNqjLdjDEyIz9ES3mtGKg7tuY3K7n1rD9hAChQUg6CLJwHw2vb+EGWtw0/PVJ4sxvbFhwMEDGJ5Nvs/7KolVv+k7ThovjsPXBGeLtUWHF5DWRiAgOMAgAvZ08K7ar2h
X-Exchange-RoutingPolicyChecked:
	MtlMAJBJJgxKRoraXBeWnqNi/omGFWo7VLuOomu4Qz3uzQXyldji9kb/nHcoSYxNT+siQMH+1j7Hz94a2hKD40gVrmoF7OABzBALVZmpWPgQJBJCsg1PaGU0of7Z5V3j8WixzW22DWSsOHGBZlvotfCbPq7Sx2Q0uTuPlKZLR7sYcZ0GWUD2gJjK8f48diwhJLr/mRRkALek+ZhUgw5Cd/aKQIF+wD7M4W8UKYEA+c9tVtPUlVuCKQSlriU/LEGuqvurLlhC5SK2cHYCZVA0r9unF+3OyvLRRIqH9TlBx+w4ZzvCuguAJLVT4T+wdrTyY+xspRwwp/6o6hfR/DGfDw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 14:26:44.1385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f4de72-1e41-412c-ec44-08dee34642fa
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9646
X-Proofpoint-GUID: kXhZlbdQuwHAJJuuKQTuZbT2kDifSyYc
X-Proofpoint-ORIG-GUID: kXhZlbdQuwHAJJuuKQTuZbT2kDifSyYc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfX76uEeBeMtpmx
 Q3QBjHq/zxUjUXB0saU+azFKAjMtf8bThrqWXc9THEcQX6t9670NodQz9IaJrp0z98hjAXhCnJ4
 kR0Tj8OR6l1BWOr2/5yVayygWSU/eeg=
X-Authority-Analysis: v=2.4 cv=M7597Sws c=1 sm=1 tr=0 ts=6a58ea29 cx=c_pps
 a=R5lJJwLUw69E8voCr07FQA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=5JuS2gtCSTrAXiciZ00A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfX83F+xD24P3yH
 Yvnv8OO+pbf1QgVlbVHpUlZagsH27wKfuSq2Ec7WWXciYemufzQY7VKH/FMAS6keO8JMYIeFMpg
 UUE0x+UV27uqoeWcHKOVcTyM00J3w1WAB7YzB7mHcSeMmDvbCsG0JBO9PWLBiasn+qAxmXzNjCz
 JTTzgfW8KmCCGa5vsrQaQZg6gC5L8LoNPXlbS6HqXbDIX8dQqTAKFfcSPWVYbt9FMomP0YL/Bk/
 JR75xkLLRcpAkYCb+N7yXvGBQETpYS47mzDaP5S/3FoFiiv6cLOpjaWvZE5fncS/d0lKAqwilAO
 aY6uM8ORpwrPMbkMzL60vJpU6NuZKe2bXHDPbDCVralokx7gmsn6jJnyrd8BG7fCzBYEcXVMDIt
 o1MCcv5ote1M35/gUlELYum6etTJA8isTmQZ1pOIk10/txbf8Vq+zp9CeUug/Cg4FrQZBUdPYg4
 lkrZdcveCuWVDJI//Ng==
X-Proofpoint-Spam-Reason: safe

Currently, the IRQ data (attached Entity/Control/etc) is populated
as the IRQ is requested. However, this can cause issues as
occasionally the setup process wants to access specifics of
an IRQ before the IRQ is actually enabled. To facilitate this
cache all the IRQ data during sdca_irq_populate_early() and make
sdca_irq_populate() simply request the outstanding IRQs. This
also has the advantage that sdca_irq_populate() can now just
iterate through the IRQ array which is much smaller/faster than
going through every Entity in the Function for Controls.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca_interrupts.h  |  2 +
 sound/soc/sdca/sdca_interrupts.c | 98 ++++++++++++--------------------
 2 files changed, 38 insertions(+), 62 deletions(-)

diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index a515cc3df0971..20ff5eac34eaa 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -30,6 +30,7 @@ struct sdca_function_data;
  * @function: Pointer to the Function that the interrupt is associated with.
  * @entity: Pointer to the Entity that the interrupt is associated with.
  * @control: Pointer to the Control that the interrupt is associated with.
+ * @handler: Handler function to be called for the IRQ.
  * @priv: Pointer to private data for use by the handler.
  * @irq: IRQ number allocated to this interrupt, also used internally to track
  * the IRQ being assigned.
@@ -44,6 +45,7 @@ struct sdca_interrupt {
 	struct sdca_function_data *function;
 	struct sdca_entity *entity;
 	struct sdca_control *control;
+	irq_handler_t handler;
 
 	void *priv;
 
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 4539a52a8e32b..6bbe65ac3d2f0 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -375,7 +375,7 @@ int sdca_irq_data_populate(struct device *dev, struct regmap *regmap,
 	if (!dev)
 		return -ENODEV;
 
-	name = kasprintf(GFP_KERNEL, "%s %s", entity->label, control->label);
+	name = devm_kasprintf(dev, GFP_KERNEL, "%s %s", entity->label, control->label);
 	if (!name)
 		return -ENOMEM;
 
@@ -448,21 +448,34 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
 			else if (!interrupt)
 				continue;
 
+			ret = sdca_irq_data_populate(dev, regmap, NULL, function,
+						     entity, control, interrupt);
+			if (ret)
+				return ret;
+
+			interrupt->handler = base_handler;
+
 			switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
-			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
-				ret = sdca_irq_data_populate(dev, regmap, NULL,
-							     function, entity,
-							     control, interrupt);
+			case SDCA_CTL_TYPE_S(ENTITY_0, FUNCTION_STATUS):
+				interrupt->handler = function_status_handler;
+				break;
+			case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
+				ret = sdca_jack_alloc_state(interrupt);
 				if (ret)
 					return ret;
 
+				interrupt->handler = detected_mode_handler;
+				break;
+			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
 				ret = sdca_fdl_alloc_state(interrupt);
 				if (ret)
 					return ret;
 
+				interrupt->handler = fdl_owner_handler;
+
 				ret = sdca_irq_request_locked(dev, info, irq,
 							      interrupt->name,
-							      fdl_owner_handler,
+							      interrupt->handler,
 							      interrupt);
 				if (ret) {
 					dev_err(dev, "failed to request irq %s: %d\n",
@@ -470,6 +483,9 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
 					return ret;
 				}
 				break;
+			case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
+				interrupt->handler = hid_handler;
+				break;
 			default:
 				break;
 			}
@@ -495,66 +511,26 @@ int sdca_irq_populate(struct sdca_function_data *function,
 		      struct sdca_interrupt_info *info)
 {
 	struct device *dev = component->dev;
-	int i, j;
+	int i, ret;
 
 	guard(mutex)(&info->irq_lock);
 
-	for (i = 0; i < function->num_entities; i++) {
-		struct sdca_entity *entity = &function->entities[i];
-
-		for (j = 0; j < entity->num_controls; j++) {
-			struct sdca_control *control = &entity->controls[j];
-			int irq = control->interrupt_position;
-			struct sdca_interrupt *interrupt;
-			irq_handler_t handler;
-			int ret;
-
-			interrupt = get_interrupt_data(dev, irq, info);
-			if (IS_ERR(interrupt))
-				return PTR_ERR(interrupt);
-			else if (!interrupt)
-				continue;
-
-			ret = sdca_irq_data_populate(dev, NULL, component,
-						     function, entity, control,
-						     interrupt);
-			if (ret)
-				return ret;
-
-			handler = base_handler;
-
-			switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
-			case SDCA_CTL_TYPE_S(ENTITY_0, FUNCTION_STATUS):
-				handler = function_status_handler;
-				break;
-			case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
-				ret = sdca_jack_alloc_state(interrupt);
-				if (ret)
-					return ret;
+	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
+		struct sdca_interrupt *interrupt = &info->irqs[i];
+		int irq;
 
-				handler = detected_mode_handler;
-				break;
-			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
-				ret = sdca_fdl_alloc_state(interrupt);
-				if (ret)
-					return ret;
+		if (interrupt->function != function || interrupt->irq)
+			continue;
 
-				handler = fdl_owner_handler;
-				break;
-			case SDCA_CTL_TYPE_S(HIDE, HIDTX_CURRENTOWNER):
-				handler = hid_handler;
-				break;
-			default:
-				break;
-			}
+		interrupt->component = component;
 
-			ret = sdca_irq_request_locked(dev, info, irq, interrupt->name,
-						      handler, interrupt);
-			if (ret) {
-				dev_err(dev, "failed to request irq %s: %d\n",
-					interrupt->name, ret);
-				return ret;
-			}
+		irq = interrupt->control->interrupt_position;
+		ret = sdca_irq_request_locked(dev, info, irq, interrupt->name,
+					      interrupt->handler, interrupt);
+		if (ret) {
+			dev_err(dev, "failed to request irq %s: %d\n",
+				interrupt->name, ret);
+			return ret;
 		}
 	}
 
@@ -585,8 +561,6 @@ void sdca_irq_cleanup(struct device *dev,
 			continue;
 
 		sdca_irq_free_locked(dev, info, i, interrupt->name, interrupt);
-
-		kfree(interrupt->name);
 	}
 }
 EXPORT_SYMBOL_NS_GPL(sdca_irq_cleanup, "SND_SOC_SDCA");
-- 
2.47.3

