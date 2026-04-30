Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFFA2C235E;
	Thu, 30 Apr 2026 15:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777561835; cv=fail; b=h+ts+IOc7QL5Oh9wRcmEECbT/yxftKyn+ZO9mqiwML5L1mSaC3LSLxMXXT4JGM0k/9Gev27+J0jEyIjokkNrMxkyybu008gzzAu944AEfoHLebai/kgG89QbZBUxsAxx4lANcwlKO/Tb8Dpbh0drYBMA5/EmdUvTJdnObsA0Q9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777561835; c=relaxed/simple;
	bh=pRr3JlNulsGZKPLGd9mYVpcwlQZsYXppKZ3ljGMlwl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VywgUZA3jwt0Mi1+1EmpKfYMijd4w9QTnwdlfq4+OmiLvPjNqNJ1w70chwpEcdqhnyoi3TXPXuQsZ8Quf4yfQafC8qf+Nw+gm3HRZQzvc5qPab+ZsMsnPVmOTgI2SqVrZJZsmLD48siLpXmDqKu/b37bAMSUHGzztTu/iJLUf34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O99sgwNW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=osDqLf9U; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O99sgwNW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="osDqLf9U"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UDXJfG1587864;
	Thu, 30 Apr 2026 10:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=4Yy0W/1o0S/p6110mJT0vDTXMo1Y9NPa8nz6AJm6LPc=; b=
	O99sgwNWmXX6vI5fTvqW6Esif+yaEp/hNsC6up+SdngLhadHZXZr+2m2125wmGl2
	Bc5nQF1/+DVpWBemBktXUHsAa7bpeQvToXlrFtdJraAtgBWQmG+djr9AuhMCiAoi
	bDHuExipXbUGIIcNv/kMxShUMiShDpS/SUUXyihlIYgH3qUqCNE4o4K3JrDJXQN4
	mWr2F29AJgqrmqfwXya7ERMvld4qafrtvA23wKzNClDaroxHKimei/2hfLZnYlOP
	vXY2KDVNkUaSwoFL/aARYJWp4U1GCYxmsls+ss16q1hG61E8mKWNmC8WH6th4HK0
	1EitbNoPx7/dY72ymctdJA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022095.outbound.protection.outlook.com [52.101.48.95])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dv82e84vf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 10:09:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dcDfJuLmvnJLedUYr9/bWE2imbXMbwBzDFojBOzyOSbZLDKG+np7vLyEquMkSE4I1PrG0hQY1RAGy1NsYKJB4Rqfc/NkwO9wZklnZDit+J1o6sreoVJMCyt+p4ZWKIaaDuK+8dLnT8Q0NJa6CjmQp8VTPDAT1wa2TXJhaRVfYKckcdvOZfhcHayQjIr95sM4rzQyw5xRLiz2/Npt8z7vETrMsfJ+kLuPIpxCGdP3UT+GI8E+llJIbAyw69MdUER4QLnZM2rsPBW9PqsgnTy0z0zPoHJ0ivtCU8vBe78GZfROh9/L7B0qA1qXxKt0wIEKEHNuBuQ04GR4VDisQuzpJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Yy0W/1o0S/p6110mJT0vDTXMo1Y9NPa8nz6AJm6LPc=;
 b=a86ICIlVx1OlU2cmMxZTCDjz494z2xvBbr1eIOQqUaO4Y/hXEIukPpaevThayVj0dqbp2VdlWrnxH4gP/qvpi0jbBOFWAXKDzb9Kl2O/BV0codoKHdaQwlKGyvEKM7VoJ7swD82yfjQBAyXeAq44i4VfLmzj6WX26A9p0CbhBIzFp6X+ltADHORfNVdUZrfDUKFCh/iFMoHNBfTgeWRy/wtblXJnSW/qyEPu51SeVmoqMsbcgJoAzhkqPWN7BAYYWO09NXp590w5VbyZTH7TR+WS8PlQh4HcUbEXyTpSPK/rZFcZk8n0KwFq0nKpk85hVoRNIXOKCOcGHJKGABdsRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Yy0W/1o0S/p6110mJT0vDTXMo1Y9NPa8nz6AJm6LPc=;
 b=osDqLf9UJjITEcByau3ymia2P3KWaU827XIiFDNb/RM8vZzVzRGMw4v9NYBFQLl+dwmbW/Ui2RDHjZrV4iWEnquGvMSUYlVYOvKe45jQTrhLvhG8aOWXq7F4mFhMbdw2a7Jx9+OIlArFTue9+YEgnop7aJOebyXrqSS9NG5zpvs=
Received: from SN7PR04CA0078.namprd04.prod.outlook.com (2603:10b6:806:121::23)
 by MW4PR19MB7007.namprd19.prod.outlook.com (2603:10b6:303:22d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 15:09:36 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:121:cafe::d3) by SN7PR04CA0078.outlook.office365.com
 (2603:10b6:806:121::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.22 via Frontend Transport; Thu,
 30 Apr 2026 15:09:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.22
 via Frontend Transport; Thu, 30 Apr 2026 15:09:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 82E9D406558;
	Thu, 30 Apr 2026 15:09:34 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5DAE8822542;
	Thu, 30 Apr 2026 15:09:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        niranjan.hy@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 3/3] ASoC: SDCA: Support devices with multiple functions of identical type
Date: Thu, 30 Apr 2026 16:09:31 +0100
Message-ID: <20260430150931.2025953-4-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|MW4PR19MB7007:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ac793f1a-9f36-4f5d-cf09-08dea6ca7de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|61400799027|36860700016|82310400026|16102099003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	GwauI0BXD7l4Cdvf7cjngeBZB41dV+F+2q+PRT6zPMKDsoTjcgrc2ruFWzYOuOqzLHNGQHtpaT6kpOu8W0BHBYjgPDa2ZRSxQqR9anGVLAgaJ//BTBHvTeeb3LtYJ3I5A+L4JlI/DWYuFWZF8j6GtRjvxciJ++7zl9rgOc0dhBtgKJ5RAesLt4cmQy2QWchHIWomcMVrDqojz1i8pRs/hNQZ2G+xZWpkQDB2TIeSVtDm90KzJgBPhm66eMGy9tgyk8oAKrU419vUlw5Kkz+gZ7NsBEVdEItu+IYNEQLdQ6pe7GMLKJvdO8gk6Ln9vD/zO8rYHShpNioVgVBb9fp47/EtW6Pzs7G3IqwTl0DpeMmH3wdWBkHSTVlxyo4LmDFdeKAAlENkuYDkeAYjOppt6kgAzDiZEjeGAs5mFx/ajtBFTbijbrY68vqLNCZlxvL8+r+pauBmw0EZYiAPC4pvJPTi/qLTTIzIHBxLFNKqXF+HnLeqSv618+SJyr7JQS/w+iXcUgdv2Di3BqfZeQXRXaMm+1Bv6Crl2GeA/3dVY7xDXqK1Va/X8mDoN0vFsax7ZMV1Wrorw7p0+uY5PRgF7tgnspnIDiEESFa6MbOhYTEr9+DcXRkB8648GtTRGvYQv6Rsn1QAefho+lsG7me9FbrN8L1XktWjJvzjSnDKj2h+7lAkhTluHYdwa6scgq1yKrFWg3za290ET9/kW8apFgZ8yGROMn79Hw5/6uKaAQMAxN9UHVlS+1T6+XL3SwPoSL0uSuszER+3tV1EQMU/lg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(61400799027)(36860700016)(82310400026)(16102099003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zM0NQ3wJK0va0OvSJnDy/PEOTyfRLcF+w0RkLa9BqUFBM9qbiSEOKDBmsoC+Ec9gR0DTq7hIhSelsGmiwMX9X5XviQJL0N2ElQDUAb9jncFKwDL+06iDCGm2NMmhX1K7TARFUQrTiI86xKZdJudLgyry+9G/8L+KqKbSTUNenSl+nO9FPAr8WHenRrvV+juS8TVCFpF4ZyUPEbjVSjdsb3LPRQcFL9h9oV/gZplafY8+pDQzc/6iVvu0UNP8AwGFQfxItP95bxSY2rYHveZfnvoybFFTFrHbyvmj6edD776XQHhnS/AtwZNu8CoTkmG9qOSkCBDivvd2VGJX1Wsyy00z2dm9+v2h9vavnz7rQI+a98fZDAIFgaFUWWB5F710Va9B1BmXB5yIhcOzNwrNCXhX/ml2gtzdaxVQ4K1K/R3Avm7s0D8gC0xhZcQ9W+sE
X-Exchange-RoutingPolicyChecked:
	H9b2rFSfq+C/04lguvZTp+jES3c4nO2WqyOGIwFMeOQUV17rSIhebN2J1QZuilxNLP8zI8TMEmCjb0E/15y9aFt7mBdfczFh0gYODIUp4eikFJdIth+qiW53ODNQbq+LBUSUIo9VdS9fB+G5YpjHAQbSQf10IeF54C1y5AuTocNlP+HtnHcQnmymtq8pBuD6qr9HvIAepwP+GD6IVL1DVI7L4oIFgWHPy5apmCticdJmUv8mNEfGQQu6xFdt+RictK1hE++rXl04wJE0SOqBoecWQA024oToRueb5QZEsHKXfpVEBl4jBA+gDM493dvVR8Eb5+5vRkIIBBh2Ajs4Wg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 15:09:35.5976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac793f1a-9f36-4f5d-cf09-08dea6ca7de0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB7007
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE1NiBTYWx0ZWRfXzBB25BEtmh6R
 FgYroKfy06Sep7KxDMABhHfdmTqkSIDfGCoHUwOfeIe08racM6OhEERQCDHyDE0DwQJ/Qb/KwCD
 URfDckEk3WULes3ywP/hRdAFa8B0TOg6sWXixeL6ZUF545Cv95typLv3izEupjKMik4B0kMKXmz
 pmBmkw4VP+fmrmUVABmBj60AeOD4Ymx+jGQ/jYgaFLv/A4+9xPE17QtxNpYg5ahKklkBswekuLf
 /XuLWIAgGXLV/x3Nm7C0t4RL9UcsAbQU0r8rYh4l8q8llcfzeGAo1Z/L7tA81ovq/ykJQpetXk5
 RO/1WpzBLkNj6w2yl8UHNxP0HVSg0nrWnrQl6TuTGDtud+NoKv5l2sKAjCe9QllzPuGd1G7FR5K
 dIshsQw8bJxTnBBAuK1l+hgv7SUQ048DJ/nJxlELiE8gIuyHX10/yjv4cuvqQW9bWwyi7Z09SWP
 kiRj0LeYp718hBGVNQQ==
X-Authority-Analysis: v=2.4 cv=P64KQCAu c=1 sm=1 tr=0 ts=69f370b6 cx=c_pps
 a=kd6AeByrnEODuFk93iyKgA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=uwUvDvqBefo4-HQeGWsA:9 a=O8hF6Hzn-FEA:10
X-Proofpoint-GUID: ViXm3MxcOSY3k0KScQVc7BI3U2bkJ6-B
X-Proofpoint-ORIG-GUID: ViXm3MxcOSY3k0KScQVc7BI3U2bkJ6-B
X-Proofpoint-Spam-Reason: safe

It is possible that SDCAs devices might have multiple functions of
the same type, as the entity names within a function are defined by
the specification it is very likely such a device will have duplicate
entities. This causes problems where DAIs and ALSA controls end up
with clashing names.

This can be handled by adding the function address into the names to
ensure uniqueness, although, ideally this would have been included from
the start. User-space already has UCM using the current control names,
so as a compromise the first function of a given type will use the
raw entity names, then duplicates will get an added function address.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca.h             |  4 ++++
 sound/soc/sdca/sdca_functions.c  | 26 ++++++++++++++++++++++++--
 sound/soc/sdca/sdca_interrupts.c |  3 +--
 3 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index 67ff3c88705d5..2bdf4e333e044 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -26,6 +26,8 @@ struct sdca_dev;
  * @name: Human-readable string.
  * @type: Function topology type.
  * @adr: ACPI address (used for SDCA register access).
+ * @duplicate: Internal flag to indicate if other functions of the same type
+ * exist.
  */
 struct sdca_function_desc {
 	struct fwnode_handle *node;
@@ -33,6 +35,8 @@ struct sdca_function_desc {
 	const char *name;
 	u32 type;
 	u8 adr;
+
+	bool duplicate;
 };
 
 /**
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 02abb7315b727..77940bd6b33c9 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -98,7 +98,7 @@ static int find_sdca_function(struct acpi_device *adev, void *data)
 	u32 function_type;
 	int function_index;
 	u64 addr;
-	int ret;
+	int i, ret;
 
 	if (sdca_data->num_functions >= SDCA_MAX_FUNCTION_COUNT) {
 		dev_err(dev, "maximum number of functions exceeded\n");
@@ -159,6 +159,14 @@ static int find_sdca_function(struct acpi_device *adev, void *data)
 
 	/* store results */
 	function_index = sdca_data->num_functions;
+
+	for (i = 0; i < function_index; i++) {
+		if (sdca_data->function[i].type == function_type) {
+			sdca_data->function[function_index].duplicate = true;
+			break;
+		}
+	}
+
 	sdca_data->function[function_index].adr = addr;
 	sdca_data->function[function_index].type = function_type;
 	sdca_data->function[function_index].name = function_name;
@@ -1466,6 +1474,7 @@ static int find_sdca_entity_xu(struct device *dev,
 }
 
 static int find_sdca_entity(struct device *dev, struct sdw_slave *sdw,
+			    struct sdca_function_data *function,
 			    struct fwnode_handle *function_node,
 			    struct fwnode_handle *entity_node,
 			    struct sdca_entity *entity)
@@ -1481,6 +1490,13 @@ static int find_sdca_entity(struct device *dev, struct sdw_slave *sdw,
 		return ret;
 	}
 
+	if (function->desc->duplicate) {
+		entity->label = devm_kasprintf(dev, GFP_KERNEL, "%d %s",
+					       function->desc->adr, entity->label);
+		if (!entity->label)
+			return -ENOMEM;
+	}
+
 	ret = fwnode_property_read_u32(entity_node, "mipi-sdca-entity-type", &tmp);
 	if (ret) {
 		dev_err(dev, "%s: type missing: %d\n", entity->label, ret);
@@ -1578,7 +1594,7 @@ static int find_sdca_entities(struct device *dev, struct sdw_slave *sdw,
 			return -EINVAL;
 		}
 
-		ret = find_sdca_entity(dev, sdw, function_node,
+		ret = find_sdca_entity(dev, sdw, function, function_node,
 				       entity_node, &entities[i]);
 		fwnode_handle_put(entity_node);
 		if (ret)
@@ -1605,8 +1621,14 @@ static struct sdca_entity *find_sdca_entity_by_label(struct sdca_function_data *
 						     const char *entity_label)
 {
 	struct sdca_entity *entity = NULL;
+	char tmp[64];
 	int i;
 
+	if (function->desc->duplicate) {
+		snprintf(tmp, sizeof(tmp), "%d %s", function->desc->adr, entity_label);
+		entity_label = tmp;
+	}
+
 	for (i = 0; i < function->num_entities; i++) {
 		entity = &function->entities[i];
 
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 6e10b4e660d96..4539a52a8e32b 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -375,8 +375,7 @@ int sdca_irq_data_populate(struct device *dev, struct regmap *regmap,
 	if (!dev)
 		return -ENODEV;
 
-	name = kasprintf(GFP_KERNEL, "%s %s %s", function->desc->name,
-			 entity->label, control->label);
+	name = kasprintf(GFP_KERNEL, "%s %s", entity->label, control->label);
 	if (!name)
 		return -ENOMEM;
 
-- 
2.47.3

