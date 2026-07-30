Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C694307A2;
	Thu, 30 Jul 2026 13:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785416783; cv=fail; b=ZHbsYLWDO3ymdkQnriK1SIIft/ZJBFFksreL1Wc0RUkdZvMkl8UVKp3d/32LynFMInE/KE9lfY4oj34bLOrO7G/z0XAL0Eb58gh171XB4/P1aJLk0/se4EQEfa+yXUkSPN/sYimbi/6sdYvlR2go+nhq4iQ5ot2L6yprADemBI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785416783; c=relaxed/simple;
	bh=DlMHwNdSm7SgWG7W7S4J9LBdO3I2rWVyPrLKiahI2Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qwUTpN3CviOPxPZ/4sNf5k/vJquiEmnnmKqGH3lJ0ZprN8BQV/nI2WS1bJNRbjX1QfxOMMBMbrX8d5uffmucJehB03amUWskpVMVYIhG4hPGWuRptvVddge9m4872UJOEm0rtSCA7wXjoqFkGAfT+d5bTx6YU2iZtSKacGNAN+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jkbZ8LWO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wdHFSooF; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jkbZ8LWO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wdHFSooF"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UCnWVS1392844;
	Thu, 30 Jul 2026 08:06:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=6rNkukZXinQ/HUpO
	QSAEmGS1SD/TJmF/9Jbn+ivozS8=; b=jkbZ8LWOeSoMbWaFehXBmffU8/QNH2J3
	Bp7Ylst+MQgrt83VQ1vctNoKzs5MD1wR+zyRlSggK8+/q9E/4+rQcnsXOlPDOc6P
	M0bj+cWIFfFKurEPb1zjmRLzBvJiz4DKdJtufnHGnquCIsusYmUYKE+DzsaTnt/e
	hc/owwhvrl/hrPsp0cViq/62xuBFE4rSHoz6RLeLgY3/2BDiJXIeBaWWZh6BOkl8
	hQ42kd/i55hQjMrKnHjWRuHTtm5qEnqdbfID10/6bdOI+n8HYn7ckgp6/Ln8oZ26
	AWTAbMr0UY5CorgzG8gDKXzRpNg94hGa/cM5g2JwpElBY7cPJ8uSkg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021137.outbound.protection.outlook.com [40.107.208.137])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fr6y580t1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 08:06:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwH0z5zCMvPxrsAgI56st5L/nQJZ0WKEmkT/oZO6VKUMlTeGJE/UTrr0au/h/5eRaNRUg/KC5l4BOadcwzy1gwTXBq1XA38evMeQYg6AXdJRkfJoZgQIPg1EPi3esr3+BOCb4VVxIhmBkxNqfJBVjMC2DvM0wCBTGtA0Abz4xCgT20NpLn7QhquPuZ/GpLLE5vAozq5sjKWB18OpE12MiRCLNqm1seLG6xhkoDQA8aAoEwJT3s+ADcx2g6zn4rGS+S4hH8VwtPw7ami573o/UtFHss7ja0JZlttGryzpwUZUqwv49h07fG85Xtkdiv/iGXdQj4oIiwGT2WlxKj0M4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rNkukZXinQ/HUpOQSAEmGS1SD/TJmF/9Jbn+ivozS8=;
 b=Ox8pSMPJx+MCh8Y2XqvjIFzrRKfkzBr+Edvnml5cavs1QyGvb0cR8/tkYWOEqlmX91qcomsI1ynMB2G+idtOxkbvKFDQneVdERAUZinxB8XWCLkUiJQVTrhMQCXoYsEVDhGvouz2Ti0UTs96oCgbWVvsVr43eYweOEYRsg4DNs+1hdGyD32uNnJcjV5TNM1CEnlKztVXDy0MFrGdI7QFrBY0nndczYBtNLxUwEKu971m4+JqmC70iMo24rBAJ/VNT/RXnWgAr1XZfP4qE86Xiyq3yIKCaXypR25Ts4ag9VhOroGtabxedAiYASt6LecB2J+C9uObQoje5VFO/taUIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rNkukZXinQ/HUpOQSAEmGS1SD/TJmF/9Jbn+ivozS8=;
 b=wdHFSooFM6mdynFFPOLa3N1rXZrutHVK8aat2ekvuBvSMHH7GHgrGxOFCFfka2JXimE+CSq+5GH5filICDxX3pc0QWfai+bKHlae4Imru3ryVcwJHoEot4x1KgyspOa1jECX+TI+NgQAQ4yiNU4S+Vkwi0cNK5afXv8kcTtvBGk=
Received: from BL1PR13CA0230.namprd13.prod.outlook.com (2603:10b6:208:2bf::25)
 by SJ4PPF60DD8B772.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Thu, 30 Jul
 2026 13:06:09 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:2bf:cafe::97) by BL1PR13CA0230.outlook.office365.com
 (2603:10b6:208:2bf::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8 via Frontend Transport; Thu, 30
 Jul 2026 13:06:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 13:06:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 37A6D406542;
	Thu, 30 Jul 2026 13:06:06 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 28A1782024C;
	Thu, 30 Jul 2026 13:06:06 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH] ASoC: SDCA: Add missing stub for sdca_fdl_free_state()
Date: Thu, 30 Jul 2026 14:06:02 +0100
Message-ID: <20260730130602.3747053-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|SJ4PPF60DD8B772:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bfe23f36-27f8-4062-3998-08deee3b51e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|61400799027|18002099003|16102099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	b6dxB3rVdSJJjH5HmF7BVsgY4WzBHYyFPYgbFbrZsxBs3CLzxJULH/efhvRDs1+Sa722tk3eRxwE7/2+tPCYDVlOawF8dMDmbgrE4PNvc1tv4HvASwwwK9Dovnr1VDY0hrdG7D+U4sYRZJoVBi1SUUQrJ2obvHy90bKsg/nK3XjS1J9bFwgf8JZBhC6sIV0c3LVhXhVIgzEZTMRfwaxK8YeCKxvh29CTTqrL1OtSupT2Ox0ZduFTy2UDO72u2EeNiYb7ieJN+Wduo0t33n1FH5G6xsXr2caV0Xmqe8UJgrY1VbkjlqVvS1aHKQ21P3Hf21j7Kd/hGANgIB6byj/ZDUf09NTUMw3taWI91llKlM3Vi4haZQaeeppeSiaEc3AyP54CFkHY2U0r+LO7gnxLpRrBZBR7jCd2U2qYx+BsfptIKc14PRZUPj4edr/+FxhRrDTlON5Z4QX9eQVz6K8Za3C5EZPqzMQLZxNU3xzIl9eVzCgx+1cjOc5+g/LJiq5qJg1ly0iaM1poF4KX4Xc20bpsErStHFzYGQNTD7yR6R21J55Qa8sOyfvZJhAkb6hSLalkQwOuwLQM4neuW986ULdpGkCIgg/Dfq17Mxv/9vBsRzJx3cQTIlvxoYR1LHjpm+E62Gtd5NtylKcmNkNv8EHL/gJzw6dgNVLHdsf+abjgTmhKI7P8PSrgXLrmcJ+j/VSezF5oBBzJP6S/yyKbcQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(61400799027)(18002099003)(16102099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OvK1bQ/TxKNRr+dcNFtohH94+9dnfRozdzhXcitVgdv2ISfRyWFPWhFD6eUaOVZr+pGlEzEN+2S3rcYI8yTn3z2LaEif33pFOpoJIFPrN3GyfiXieQTYrhfjSwFV0ulqDdP1Wigoi/yD+6iEh826+A8cVcZjXDnd154OdRd53d18wNaux4V9fStDYHBCezoko8VQKnQLjZQYBV+8rNTA/7H5otR3bSErfNERv5nigQMNp8AQJqC7tHhDHMAk3QSer6niBZGPDhxwD1Hm/Cg4dBAEa1v68r+BHow6zOIJq8X+1mfZz2dpEJdcx6o9YoT+2bacm/yko3KAP0v4b44eP6zBQ04mWkwyk0RtN70115Xw/E7n6wogE7zwrlGPTr1thQoUex0o35UxhGGI/3e8bnjlu9XEVi28ag5sK/ysOhSk/SxcXYcrpzXUL4qEkH5b
X-Exchange-RoutingPolicyChecked:
	KncqooGCEDGimV/WQoJ97c4qkS0exkXuvVAfISWsAwuWjykzPCp0Pr7DeCmk/PH/RxnC+TQHX2NwPRTNPkb5wfKZPFzWAz+sYRWwRzcxa5N2gPtWXk0R59qKflfFJMcIAyBv02xrvUc342fNTgHP8Z/yZFw+KuaJM6LbAnuorM8lXzhQxBn3/HuzLehAq90JhsFXmOdchBx8xwPNSRst8KhxSGmsREOPo0UCNjB//S2UTjeZIsyQRBFsIqkuJHurtd8WcpcophzHYRrgFaMoRmac/HINAbsN9ilHV7CrMQZDWNqzPYxYW3/oVFXnPyaeFkZkJM72ZiKtIui+h8dHuQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 13:06:07.5846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe23f36-27f8-4062-3998-08deee3b51e9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF60DD8B772
X-Proofpoint-GUID: GL5enzdY-eeN4e7jYWDJRAAMb72nBo1o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5OSBTYWx0ZWRfXxceFJxhDSBUh
 p8fBwQGqe1ZmFBtrMi4uWi4dEvGC0x9ifzsC46N9k63YGJu26jWL01LHgLx2fs/i0KXQhBVNjn+
 02ATpGmNSHiGUKiXhXxZ9UdR4J/IvbrutwHaZr+Pi8Givezx5xW1wO4dhHOXZhoZvqg2KpPcy8C
 Qegb/Ibvm0cs4cj37MxwIws593/oUEsLD3MxPhjJIxPdbrnbXdiETW4R2XWrTpgwt/viNY2k/Ha
 H8mWKamCfoUb2KnzHP9wU/7LWlVXv9MFB3edxzEQdfNlZZPglIwW8ylI8xVa/RLzIVMGF68yDZb
 rwkCJWkVHq2IP/QWDQH+/1kfbi8HYPZZYpgLiEH9foeP54NZV9Snz2mb0WeFw9GOelYjCAiRWsF
 OEIn8Fkk/Z0c/zsVvL6HQLi8zq+OhefjuvbJhQ8UJk7vI/vuslfpj+Y5d88306YzN7aS+jHJX0M
 yFV3uzOrOjNAFmziDoQ==
X-Authority-Analysis: v=2.4 cv=Zact8MVA c=1 sm=1 tr=0 ts=6a6b4c45 cx=c_pps
 a=hxVrj3tyWKw8/06b28h1JA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=XQIjbqt0cXQhyFH8yRMA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5OSBTYWx0ZWRfX4DnjLSszWWEs
 OUKa+JDNGKDR+tejyz/riVQ/84Eq3l0YegFlF1lZbgLjq1aljQB9rS8EcgMLv8LesDyftk1xwOn
 ABovd8HVcOJgTURZ7En2gaGx4W0tPlI=
X-Proofpoint-ORIG-GUID: GL5enzdY-eeN4e7jYWDJRAAMb72nBo1o
X-Proofpoint-Spam-Reason: safe

There should be a stub for sdca_fdl_free_state() for the case FDL
support isn't built into the kernel. Add the missing stub.

Fixes: 0880082c27b6 ("ASoC: SDCA: Remove devm from primary IRQ cleanup")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607291304.FE3mOcJF-lkp@intel.com/
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_fdl.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/sound/sdca_fdl.h b/include/sound/sdca_fdl.h
index dc33927b82bde..bc3600cdd2ec8 100644
--- a/include/sound/sdca_fdl.h
+++ b/include/sound/sdca_fdl.h
@@ -83,6 +83,10 @@ static inline int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt)
 	return 0;
 }
 
+static inline void sdca_fdl_free_state(struct sdca_interrupt *interrupt)
+{
+}
+
 static inline int sdca_fdl_process(struct sdca_interrupt *interrupt)
 {
 	return 0;
-- 
2.47.3

