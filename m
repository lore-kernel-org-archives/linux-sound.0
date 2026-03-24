Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F9F3DEAC9;
	Tue, 24 Mar 2026 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774350194; cv=fail; b=K4pA5dFvylo3ShltF6uSMoK3GaIEE8b/ym7PTxm7TDmY0Go5RvRgNCdbMo28CQQUnK7bCL+znz3cGoqdf52nVJ5JK0DTM/iUh+qAA241+SC8i+sFl+lF61iYZgICuYlK/e2JQYjVPQUkw+r6gSWnWVV4H5gD6RDGLondoO8mL+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774350194; c=relaxed/simple;
	bh=HFWcWf3RfdvnIIpuS9KKnA3WedKuxVMqViaJcnukCGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RJxZC7GTLLHUWGB9CAdp7MIAr/0kMJsQrPKZbqblAfrkHd7ploBeu8hatbhhWth+qRMHZtglwFreb+IZVJLsvmHW4Ah/H26DP+OA7B5BOQczaJacLyMePUVx4l7E0Tz7QUX05mH3Ae5oH4hGuYH5/Cg98ZNY531wtVrXWRiNjb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CDF8Iyxd; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=IjplJvl0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CDF8Iyxd";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="IjplJvl0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O7XLOx1472391;
	Tue, 24 Mar 2026 06:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ipVOrYJg4rprhQOY
	RhYjnycdBL0Y0oTP8OORiJpSLgM=; b=CDF8IyxdzF9MPA5rykJE1r39DLoXCPx5
	kfgpMOTAAgWQ4GfdNvrW609guACJfu+lZEAycgPvqaaJ9/oIMocs8n+ySVbVUjJo
	OH3Ly7TYc3Lt7hlXh8niZpC+64+MfsoTaN39eChMdxzXzYxMkPcpMbSx1B6GyWB9
	NrCoW4bTlAAvIa7reEctNgeJtg/qg/wnNVZeDgln/3t6zjcu3wqa6nRBurm8giWF
	coohbvReV+DbdQOOGHdSKmEmRNq8egQPaM+6N4GB6CTjdcg0O/FdhHzQ45vXnl/m
	wMnSOjTTMGMCifTgsXCu662xbg4f6iTGhJvwfwBh/sALsvLVh82aaA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022082.outbound.protection.outlook.com [40.107.200.82])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d1qrfb1un-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 06:03:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHkLO8QiDI+7Clt+7MTfb5T7vHr41ai2bVbxteD2XujMx/tOPo1VQoP1bxx0gmBuCC+c87YuhxTW4jvjDCPwNCi04rZWxw/gwr6zyg4+Uye0g1y3CpgzzWb7FHYhBewUPUdy8xLK55lbOnl5KP8WObqSyugxjaJQ4a8443dzEvuMfL9JnvoSsbRro1CrcscWgF54R2KjsNA5Uap06EsER4HR673+Vj5wUEmKTofg9rMRrk90ZLJj0AqsihBOy948TSsvxGzNMhMGkIH3D844EOweGvxsTUAgT9LrY5MkmznI6UY0v2TMWG8N1JiBglYop9Om+YIhoiwnf0k6HJ8Fkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipVOrYJg4rprhQOYRhYjnycdBL0Y0oTP8OORiJpSLgM=;
 b=JnWinrQ9GiB8d/2Y1PLU9V+P8tVwueMwKMIgnaXCRaWhV+2DGHDnNAeH1Mf5WdtSCs0N1sdUA8GKS0X6XKccWRI+0VJM3eH3h9DrmmpFyZEQ076uI4EmPxLrgW+6snsUnwhAMaeE3qEpb9BuKrMqnJnTV94gv7mMmlIJQQEEGyIMTXZaHYSSoQrha/G91kZc7KzK983aXV/r7HTf2j30adoqgzYiVn7U3yXRVeOVCDn7UVtI8BjPrftzBF4X0G7hT2+dhek1oQ2GKQJe7HNiyfkiduCuLyF1+0LBXKNi9LGcAehaNsNdw8I3gZy0mm/jPY6TpVbXpIGBMvvsoDNiNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipVOrYJg4rprhQOYRhYjnycdBL0Y0oTP8OORiJpSLgM=;
 b=IjplJvl0ciYtUvhyooMXq/wGwpd7pBYH4E/SNmtG4GNn0V9BncstTJoKC8YECyTydjPqSfBz8PfJocj9PaeiueSRSzbf+pXfgcJisVwo++q+jA86ViLzOfE7eksbYyXZ0v8/qaAww8zIRIvDIk12OVIFq0ZgQ+4F8T6NKd4GeC4=
Received: from BLAPR05CA0014.namprd05.prod.outlook.com (2603:10b6:208:36e::18)
 by CH2PR19MB3830.namprd19.prod.outlook.com (2603:10b6:610:99::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 11:03:04 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:36e:cafe::c1) by BLAPR05CA0014.outlook.office365.com
 (2603:10b6:208:36e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 11:03:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Tue, 24 Mar 2026 11:03:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 228A840654A;
	Tue, 24 Mar 2026 11:03:03 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 069B7820247;
	Tue, 24 Mar 2026 11:03:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Allow factory calibration through ALSA controls
Date: Tue, 24 Mar 2026 11:03:02 +0000
Message-ID: <20260324110302.273983-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|CH2PR19MB3830:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a1978b93-6d84-47da-3cb2-08de8994ec0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|61400799027|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8jC74SAxdAKyvJHf/w6ymvuWe7n9K12YdvPRNjbrFkgluB1jHIMRt+qAOdeEzI/BgehcAi195nT8zzm9i9eycNZqoMewXU9TKKACrZ+MBA/ejzZZ5XR+gs0eneVn3t55o9qNVoISLsZMsnWokQqSEGBL3Q8qpE2Q7+8dchTZiwBHTWsvWTpjvhpNsEqJeEeZkA05hYltl7hE5Z83EPOidWzDD3B5/VA70NPSK0lQfDtlFmk0jCfD81aQAs3+XjHCaAmH1+F3S6d20OoAScINv1/LdvkimeeCRmS4y1iPwGcuqyifIBrwXxFYH0k8z//fyiEbweDnYrqU6C4bqe6VxoJlyI93opgr5VqF8PvxS1zLUSunZLNEsD3SWWQqG7Qb2wR129wW4mnXchFHEeWVpvIqhtc/7iTOjU9z488ahP2UpqWFFMAI7OTEnk9X/6iTphTGS8VoluqRF8tkJiPzuhb7j7ulk2lPAprx34v+6dtE4KKbhSqjxiOY5lwLZPtTSx4sqXzkPtFjxKCYpgN6guFzvJo233e50e4d7KOzzzGVQ4wpf9x0cWmSROx43mpaKYUlB7XtGKm3G1Lk1JPRNhGL/veN/sg25izKrb09/ZI5FJzO/8DlKI6C7R/nhBwLZTH9n1pAj8vv6Vf7Wzdvf41EBcJKws9/R3oE4083ZyWaCgw8Wn1iehGuFxFYcwqquwphmn9m/tGRsBLkQrssAkSqmbC22wPhpmZmioYo9H+y5KSGzlcruGo6Qh40n2rUHQzAqqBNkZX1NyG9VEQafw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(61400799027)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n4DQESlUBzxKI+FHxpq90p9E7j92HJox+rzM7JXjlvumODmuUEDWV6lNBh5JWZ20vT0A2IbxaxQ6a/fGUD65CqOENhR0QK3b3Ham8qXwiryIJac558aXug3vrWz6dDz+MCxqpERpNpkimlaNvNeDWYj+btj1VbTmgPAuHkWQ4f7Nl7Mnqrih6RzWJgxFmTFsakIk38gcKL0cN7xLLwNyFAiL4QbrlJPynNwhbhpidnywsYdHcPlcLB2g1+qY6fdLp/vU7LSKrbX/yrxCzUDfTve+T90XelMAjpDxWdK6wl22bdwl3JA4gvbnHloIXDO6KdajV4YjuGkUADF52IQVnq31NsYlTSRhrVdq2CCha/pUbEJYBoWQct8cmv36HfkEMiRY95gUfbwmc2qnxyrwmd0bHlZCcRaazbYDBW+E/TabAnmzynEdjNChqMEzhuZ6
X-Exchange-RoutingPolicyChecked:
	YiJ2Xg2/1Ake1aKBTsraNNNLg6WyFiQKJBVPfPoIz1v4dj/p7d7oUm3xZH0AOjCARO0EXfrfuDMZr7KVUOBhD5DJas+C/8XlgE6sb1kjV21SQmilRP71KbXQ1hYaJpeFUZh3eC3EYnGJaoKHiWTa+yrl3fZG52ptAF/LsyQ4d2H/gyyarQyyMzLFRvAs0+yNUlt1votsUkUzbFTt04R/wSi3PG5CxKU0xmejsUp8Xc7ITOp8GA61sT3YQiQ49GR2SNaMKVc3DYeP+/zuFzYGpyy0tizRwMLu4mA3BZDKRSwWOAiNigGzjHciF7kOsXFH7jrOKO4W4/YazjJ+2BZlPA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 11:03:03.9454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1978b93-6d84-47da-3cb2-08de8994ec0b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3830
X-Proofpoint-GUID: PO5OFG-S5gvT60YFS_qipIK5baKpO1pW
X-Proofpoint-ORIG-GUID: PO5OFG-S5gvT60YFS_qipIK5baKpO1pW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4OCBTYWx0ZWRfX//ePmD10mLYv
 R3OtzqR2EBPvQgSaKWJ34nltrjO7ir5qx/2ARX8fIZ5kEaxJPV58+NLk0Bfs/F6fXzIH4SiyLbp
 GcB2Dt++poHAkllWxAPHI+nh6teuxvmSSPHXxV4NkRQuRpRL6ZGWptoH8JWAtPlxCqUVlZFmvXR
 lMPuSMiyqMIv6spFzgOPU/FDV/aPTMlMH7e6M4bCleMqeLyXtnVfaFMNgHnHWhPv3efWKe7cYTb
 H0l3+K9aw7hkq8QGBsc2LAYtE249TlulgzcEd12dsCuV0jo5qI9FCcikZ1cZ3sT2BzvGEDlnDGE
 hxvMfWp4lZetZglvamKizJieW9fNCCCB8PQ8dyzDwdDy5u7G7hDZ9jgLqobw+K1eOr/m/nITOwW
 cHCM72f94GBD/jWkzpxoxBnaz6bC4R/ANPS3PngaLZEBltOpF0Bj6bKVwSe4EDAvNPKuoC2ZAyt
 j54rjCo1LfDjRsJSBQA==
X-Authority-Analysis: v=2.4 cv=FM0WBuos c=1 sm=1 tr=0 ts=69c26f6d cx=c_pps
 a=g/fcdA0ru3Q2I7SmDoHu6A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=Z9QOiua9fbM-N9QegMQA:9
X-Proofpoint-Spam-Reason: safe

Add support for using ALSA controls to trigger a factory calibration.
This is protected by a new Kconfig option so that it is only available
if explicitly enabled in the kernel. By default it is not enabled.

Factory calibration is normally done through debugfs files.
Google have requested that factory calibration can be performed by
repair shops. These repair shops only have access to the standard
"user" kernel, which does not include debugfs.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  1 +
 sound/soc/codecs/Kconfig          | 13 +++++
 sound/soc/codecs/cs35l56-shared.c |  9 ++++
 sound/soc/codecs/cs35l56.c        | 89 +++++++++++++++++++++++++++++++
 4 files changed, 112 insertions(+)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 7ca25487030a..c3b10587cb4c 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -435,6 +435,7 @@ ssize_t cs35l56_cal_data_debugfs_read(struct cs35l56_base *cs35l56_base,
 ssize_t cs35l56_cal_data_debugfs_write(struct cs35l56_base *cs35l56_base,
 				       const char __user *from, size_t count,
 				       loff_t *ppos);
+int cs35l56_factory_calibrate(struct cs35l56_base *cs35l56_base);
 void cs35l56_create_cal_debugfs(struct cs35l56_base *cs35l56_base,
 				const struct cs35l56_cal_debugfs_fops *fops);
 void cs35l56_remove_cal_debugfs(struct cs35l56_base *cs35l56_base);
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index d6104796db4f..ca3e47db126e 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -921,6 +921,19 @@ config SND_SOC_CS35L56_CAL_SET_CTRL
 
 	  If unsure select "N".
 
+config SND_SOC_CS35L56_CAL_PERFORM_CTRL
+	bool "CS35L56 ALSA control to perform factory calibration"
+	default N
+	select SND_SOC_CS35L56_CAL_DEBUGFS_COMMON
+	help
+	  Allow performing factory calibration data through an ALSA
+	  control. It is recommended to use the debugfs method instead
+	  because debugfs has restricted access permissions.
+
+	  On most platforms this is not needed.
+
+	  If unsure select "N".
+
 config SND_SOC_CS35L56_TEST
 	tristate "KUnit test for Cirrus Logic cs35l56 driver" if !KUNIT_ALL_TESTS
 	depends on SND_SOC_CS35L56 && KUNIT
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index af87ebae98cb..e05d975ba794 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -1185,6 +1185,15 @@ ssize_t cs35l56_calibrate_debugfs_write(struct cs35l56_base *cs35l56_base,
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_calibrate_debugfs_write, "SND_SOC_CS35L56_SHARED");
 
+int cs35l56_factory_calibrate(struct cs35l56_base *cs35l56_base)
+{
+	if (!IS_ENABLED(CONFIG_SND_SOC_CS35L56_CAL_PERFORM_CTRL))
+		return -ENXIO;
+
+	return cs35l56_perform_calibration(cs35l56_base);
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_factory_calibrate, "SND_SOC_CS35L56_SHARED");
+
 ssize_t cs35l56_cal_ambient_debugfs_write(struct cs35l56_base *cs35l56_base,
 					  const char __user *from, size_t count,
 					  loff_t *ppos)
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 9d35797e000a..d9b6a9d2453d 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1109,6 +1109,82 @@ static int cs35l56_cal_data_ctl_set(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
+static int cs35l56_cal_ambient_ctl_get(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	/*
+	 * This is write-only but we need to return a value for user libraries
+	 * that assume all controls are readable.
+	 */
+	ucontrol->value.integer.value[0] = 0;
+
+	return 0;
+}
+
+static int cs35l56_cal_ambient_ctl_set(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm;
+	int ret;
+
+	if (!in_range(ucontrol->value.integer.value[0], 5, 35))
+		return -EINVAL;
+
+	dapm = cs35l56_power_up_for_cal(cs35l56);
+	if (IS_ERR(dapm))
+		return PTR_ERR(dapm);
+
+	ret = cs_amp_write_ambient_temp(&cs35l56->dsp.cs_dsp,
+					cs35l56->base.calibration_controls,
+					ucontrol->value.integer.value[0]);
+	cs35l56_power_down_after_cal(cs35l56);
+
+	return ret;
+}
+
+static int cs35l56_calibrate_ctl_get(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	/*
+	 * We must return a value because of user-side libraries that assume
+	 * all controls are readable. But always return false to prevent
+	 * dumb save-restore tools like alsactl accidentically triggering a
+	 * factory calibration when they restore.
+	 */
+	ucontrol->value.enumerated.item[0] = 0;
+
+	return 0;
+}
+
+static int cs35l56_calibrate_ctl_set(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm;
+	int ret;
+
+	switch (ucontrol->value.enumerated.item[0]) {
+	case 0:
+		return 0;
+	case 1:
+		dapm = cs35l56_power_up_for_cal(cs35l56);
+		if (IS_ERR(dapm))
+			return PTR_ERR(dapm);
+
+		snd_soc_dapm_mutex_lock(dapm);
+		ret = cs35l56_factory_calibrate(&cs35l56->base);
+		snd_soc_dapm_mutex_unlock(dapm);
+		cs35l56_power_down_after_cal(cs35l56);
+
+		return ret;
+	default:
+		return -EINVAL;
+	}
+}
+
 static const struct snd_kcontrol_new cs35l56_cal_data_restore_controls[] = {
 	SND_SOC_BYTES_E("CAL_DATA", 0, sizeof(struct cirrus_amp_cal_data) / sizeof(u32),
 			cs35l56_cal_data_ctl_get, cs35l56_cal_data_ctl_set),
@@ -1117,6 +1193,13 @@ static const struct snd_kcontrol_new cs35l56_cal_data_restore_controls[] = {
 			SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE),
 };
 
+static const struct snd_kcontrol_new cs35l56_cal_perform_controls[] = {
+	SOC_SINGLE_EXT("CAL_AMBIENT", SND_SOC_NOPM, 0, 40, 0,
+		       cs35l56_cal_ambient_ctl_get, cs35l56_cal_ambient_ctl_set),
+	SOC_SINGLE_BOOL_EXT("Calibrate", 0,
+			    cs35l56_calibrate_ctl_get, cs35l56_calibrate_ctl_set),
+};
+
 VISIBLE_IF_KUNIT int cs35l56_set_fw_suffix(struct cs35l56_private *cs35l56)
 {
 	unsigned short vendor, device;
@@ -1290,6 +1373,12 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 						     ARRAY_SIZE(cs35l56_cal_data_restore_controls));
 	}
 
+	if (!ret && IS_ENABLED(CONFIG_SND_SOC_CS35L56_CAL_PERFORM_CTRL)) {
+		ret = snd_soc_add_component_controls(component,
+						     cs35l56_cal_perform_controls,
+						     ARRAY_SIZE(cs35l56_cal_perform_controls));
+	}
+
 	if (ret)
 		return dev_err_probe(cs35l56->base.dev, ret, "unable to add controls\n");
 
-- 
2.47.3

