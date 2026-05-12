Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4115349CEE;
	Tue, 12 May 2026 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581898; cv=fail; b=froqwX5gvxiod3BwrAyUOQfOQ/7N2HndfP2QYBN0WifR41zTGH2rMQQLTI1jODU7Po88GJ+IvzCAcUOtq8JbIatHdCoceIFQgNWxGQa39H41hhsBh/T6X/jaV93MqpgzLH88eYvmtICjEC5+IOaYYE+qn1ue3HH6Nq4X1ak/Ic8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581898; c=relaxed/simple;
	bh=2B7tIxjshOjNLJPhf1/Yu5M1O94xXvKaBG9yxvVQRq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PomeLqPcWT0bvsnObEREpNIW0Qw0PSmftnUQwmdIdvbXfUdiRKeTXm7fxTiOTbVSeK0ZecYRpNx+eFQzti+lownRigz/AUDNFIiE3USUWAaK4dTTpH3hmt8Thjs1K1/DLHvT1YxlmrJLQQk+cm5XqKSbnEo4loWTGXYFaObWnHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=o3TueHZH; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=MqkA2isC; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="o3TueHZH";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="MqkA2isC"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C7N6C51750921;
	Tue, 12 May 2026 05:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=QdXu81cKzBhLnoGqxPkPXj1Sj9PXQdhVKrUI00305IY=; b=
	o3TueHZH813VjTkYpWp34Fs5hBWmS1aPpUFcoCN7Y3ruwWjuvc55hOVkbx4po3kC
	p6L7c4D+cCN2DXnDaKsE48NgeTpXgFgraEmNwX+vqk50pDs6NYYRWMlI98NF+rAZ
	qprG72M+KD8vVya9h3yCxKsT/fdobg9q4v5qYpsnC8yjpwQjaPJdxEvkTYFlfrz2
	nc9qa1xyazBrPbtuReRwj6XIHNl4pT52MHXmw7cVA4lpvIchN+GDGwvHEti6mZ7l
	I9kZIQ7kAjKfj0oSqesxfmghH2uX49+0DCRiY7eitthztu2I4Q8f1VAGcihACtSt
	afIhPOhbb1ukS2rJWg0B0Q==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021140.outbound.protection.outlook.com [40.107.208.140])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58r7r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4PNGCwA+02YQYx5C3sTh7AxlbS3bbAgH5zJDTRb8fX7i8BHOgCUbd4UnnsvwqE+fFOQXV5SXdG7JdQy1k5fachNRuph0qMTiBA1uAofYWZJZYzMEaYQZ4SgJzfDLHJMpW2knsS7bUYEYzqwqJ/S0bSXHJMjeeWmFCcISiAU0Zg9tcBpGVEtKpg6hIbWUghPdz7LG2fYX59N1r9uftNH9g8eUoE61b2+9E1juNoQPJ1zAfEoZbzi09HiWCkUo/RlD9/HmCxo9nZH/UsQToYXD44AapQrt2hZAE6OHYV4InwwAec8UmSMdgemQSxHoLRYhPycUQokjWnj5eh/71jb2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdXu81cKzBhLnoGqxPkPXj1Sj9PXQdhVKrUI00305IY=;
 b=vWovppDMW72aMIGTVHyfnLlUcsifBR++rfRdPDrUqnjcK7UriKv4LArVbMRNFigbSttFmxgnxYQcrvKhTTBtcL2o+JPOFN576oGDUaEKi6NLxvaz9oxW3/15fu/Fru1plsKiB8BXCq6I+dYD1kcAp+URMX3xzmqS6CufqTYme02zl8x2nU6isKQH/w4Q9PhX1X3NHu3YSCDwm7vBqgeq2QafKtOnaaQT16P0OA9hxzxzEp8vXA5YZw9zcvEugAvG8yb67xnOSB4rci8acf/kbRFW6ujUhE9TuMcWx/xNtx81mRI26S5YmaeNxFizEq4PkRy/2PN7Zxolj7oRJxF4HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdXu81cKzBhLnoGqxPkPXj1Sj9PXQdhVKrUI00305IY=;
 b=MqkA2isCJdWgdvLyHf65KlvDrpQMthkrr99aescU4Vx93qKBS4RJkhW/Cw6hgaM0siSUHISmCRdtlXigQl5XMd3TNSnOc4vuIeI8IQ3a0w0Q49BMOzkkR/CWSpQwe2k3CSR1eIKCi5CxkRQGWDR4npk2aOO2UMXw06Wq87xO6+M=
Received: from BN1PR10CA0011.namprd10.prod.outlook.com (2603:10b6:408:e0::16)
 by SJ4PPF7AC9D034B.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 10:31:07 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:e0:cafe::51) by BN1PR10CA0011.outlook.office365.com
 (2603:10b6:408:e0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 10:31:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:31:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A15B9406561;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 68CA382255C;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 12/18] ASoC: rt1017: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:16 +0100
Message-ID: <20260512103022.1154645-13-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
References: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|SJ4PPF7AC9D034B:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 840580ea-2d35-4c02-b6b4-08deb0119317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|7416014|36860700016|82310400026|22082099003|18002099003|16102099003|3023799003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3HCPwFjwKS3VU+vuby/sUgeFrYc5XPT/ZjDANCFi6N6A+aN+wMXgJUi/I+KWxDagqKHvb41mDAF6CE3vcpj6gaQOZzjPw7CKPaNOQrJ8t6WWxqTPReON327LPMxK5f3KldB7jNmcVpICx4Bek2+UqS5JbTfx0iy31kaW1GH1Yb0mkLfe0VoOVL/4RxtLvoG9HQMIUaNvaE5eSofFAzjiV68fokf8ts2Xup+IYdnJ+A3pRSdI4POzfk2BkKexnLY4Lhj+0kl2Uzlo9NLDBcwbEMkHGREa/sVmIXnglZQWyQ0LLSxaPC49oTrgwieGX4Shg98J/tzWzc2RsTdGKXG2OFWP2pH0OctsD96CuO1Cz/e01mz7vM225b7lhqkLfHLnUmPNHN0AiZEvOIX4Ev/rsBGDDsmrbJotu/AoxZt8tzKEG10UywzCZd88G1zSCVQMbRzU4Or6KVjD9Lv5e/40XsWsG0d3yRmHNx20QJOLbYzOHJjg6Hd3hqqnt540n7JCvxg4B07ctxTlDZecWTPTyQVqMOc1lT95S/uqAxfFjN/fp5uj9c5ZlkRAByS7cIDeLFb7wDg+lV1K+pPwVNpo/Tsuui3Yiur8ItdSk6MQX/IlZ+pFlYTFZ+yWhqG9wg/o8a5Ku0gxz/LZp0AgVoeNQg3b1vFb5i8QQvTYjHvHqqb1rCGTFBYBhFWhMDaAD0YOh75LX2Y78bHMn5qbPF11CaCnB5QcKbmKLHmNFwT/xl8=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(7416014)(36860700016)(82310400026)(22082099003)(18002099003)(16102099003)(3023799003)(11063799003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BiZYF/VCwVrGBKDRZ8i1m4IICJO5Mee8VsTniPs9Xx54HVNkckQp6ild9WQ2kdSdhBy24IxnUbWMgpgQSiJjAXQ+FVtgWcemko9u5CqomtNf++Oc1YMY8Gv+FNes/EP4VMdZBw5Ul1QVSe6rYLkn4n5z2wCYfkXnm6it/ZH14CPH0EX0nIJPhK3M5VvmqZX8LwO02nnEeKmPw3cfArJGj47OdCDMdS9sceE6XthsnWFCFtWCgVNoCtkgq/nbIuT29d5pI+uOho0QjgatnLTYRWucFkCfvmgKwGqHlDHGsP48grdbvp7slT/MYDmTcUMf7P2k7YKPZnjzZNyJ/AlFFP3KpdZzP5zNVt9AT4oHucMI8mo0yPYymvIF8grz4LGxD7fnTpqyPxMyJpgrNZ2tNMx1vZ9n/WPRxoRnJoxbwI0gkUuVHiYLMi+CuYAqQnF+
X-Exchange-RoutingPolicyChecked:
	hNoR6xFd/hPF3yYdrjit0mHZlFCyMSqtX+bKpiHVJbMpy7rOJy0baiGyWg31Z0fA8STJxmy9AtNq7SEaa6O7CYibLjgZTfdfpN+ZBiWOs3CSj0lP/St3CbydVdclGBFOE2mpNPGiN7RLI7Iu5fvnqNsdeq4DfugnsFa66iPC8o7oDsXTbfv7dUZVcQzqW3hjcdWranH7ABRSb+ewM5JuxJzbWfTyKQ3Elnk0BoU2LAa2zC32KfPA1evIX2omI7aYgLHCOOrclyMXEa44pCqPycPwPAOt4HadsgHgqCXywIfPMxdPrKeaIAOrzLgHNHqI72mPmtxW8BJj0TLo3MLCcA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:05.9805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 840580ea-2d35-4c02-b6b4-08deb0119317
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF7AC9D034B
X-Proofpoint-GUID: qE506baROijODLCB_ctRXNmB73Yta86i
X-Proofpoint-ORIG-GUID: qE506baROijODLCB_ctRXNmB73Yta86i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfX20MllqsrCysu
 qGs4//iweFmbWmtiKqQtZ7kmYudV/JEgc+6pWu6DiXcgq9TfFGjuDU3EvFXSyx6dQlwLKuY6FZ2
 jRkOTkgC9qbHWu3ZpoJnWtz3eUtA2t0FsJytN8+Q4aAxCLxGmf2ncR5WHzh8hRBJpG2es7XJuGY
 LbPCIZTUIjqEVvt7CMMN36kbWBEsW1fJPKnFUYuzEssP7x2yU5eOVUVZRzLmcAwTXue8/5Mimh7
 7HY6idzQb8B/DrBMUN7nZ/Ex3K7aKgM5snTg/01jtPGmslDBVr3orlQY3tTsUryAd+rLXjjl+jB
 RWN/mHLJPxVdrn99L1DTGe31DrUF56WZbX3rHpTgQ63/UNWWughdVaS9kNpGQ4dmvKHlA6ODXGF
 h5caZ9GliL4jdrIKePQYQ3pBfdOwfXMeF6wc3B23FQLXXshiIh1Zepu1ptMin3w2t09OUmbdH6M
 Hr4ih+r7PD3Z6HFaK6g==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a03016e cx=c_pps
 a=oqYjYovRwutaw0NExYmD7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=IoCDlSAkw28XYy5mOB4A:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/codecs/rt1017-sdca-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt1017-sdca-sdw.c b/sound/soc/codecs/rt1017-sdca-sdw.c
index 148b36173a257..d62e8a2536767 100644
--- a/sound/soc/codecs/rt1017-sdca-sdw.c
+++ b/sound/soc/codecs/rt1017-sdca-sdw.c
@@ -773,25 +773,15 @@ static int rt1017_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1017_sdca_priv *rt1017 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt1017->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1017_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT1017_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt1017->regmap, false);
 	regcache_sync(rt1017->regmap);
 
-- 
2.47.3

