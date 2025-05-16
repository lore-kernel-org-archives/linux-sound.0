Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D742F242907
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401040; cv=fail; b=JIFnKsBcOQkEho7ZS9Nmat+ZMaGn9CpHwSFlxU1LdwYadBhnkGbL3Ohitssf/NnqN9yxXBSgYIDogQuPASJH6ZFLptRQMBiLrl0TUdXbrHcJ+W3Nu9DGWSM6NG3mAOQDNPo2XFYSIP6yWJT/tAUOfRMYLphR+8kNMtPpzG5433M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401040; c=relaxed/simple;
	bh=rX0QnLPpXZ68ALdTAIYW7LiB0jTu7fjPbPmV9nRKrg8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lkeYNXdHzS70CwYKMUCm7Ubup0mmyPQB0dRUsMkewcvLJR7Yf8Bw3Fm7PG3RJlDgA1wTdDNQN9VR1DPadS5LvF+xHkQQbc3fCLzhabXSeyDCXmtrAaqI6/Fl6EKkqUlvXL77mobuldjc9I88g+efV6w/aQHHyaAM668BsA9AnrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=favbFHfM; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=d16RZkxi; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="favbFHfM";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="d16RZkxi"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G5eVVw007659;
	Fri, 16 May 2025 08:10:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=BRsWmV12+we2Z1mWdG5UH0Dv9MNER0qlbsw9UENdZJQ=; b=
	favbFHfMQCmDmg1n7N0jch7DQU3Und8u8sNBKkYD+SnlQK+8QU6BH7BjPbqHPImd
	Qhp+83DqJtPGHZgjMfZHKTnSA1qvBYuykj2NL49WwvphYL80sTkye49vHP7kthvh
	GZf/kLa/RzCbNCFnjm91XVQmBQ/G29mg973+QAFz4dWq2ibwb0spPk53ImJxzSi3
	SoimQkqgdHaM467DL8Z2rKhaKe7mZXH3iEcEJfKJUgqxHnzHlqfcz3AouoaqkfnQ
	5VVe53rYJNw6qZ6E+fg3iDWjdTP4CAnE0QmaEUP3ZXFbsuHRw6GDHcxS1SNZz0bc
	mRJG/mIRvMhIxTykZbYj6g==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46mbe5cttg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:10:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Njs4fxCTJP/Y4zFx5mHQirGnErm7eFSfmRsw1c607klTD3uonm+9PvC8zZ6i26E9865gU/bytPQbrAUDXq1oQXbBUqu2RUMaVpyFj7uaK/OuPw6eMDuQFgsOZQge5Za8mYBBYJrmdu0pVhf//HmkuI6ffLcaXOexwMDILpgqRuVV12qn2FKNj93dkKEd9kmIJPoqa1ks7IrbeFouBQ/AzKfdBUFKkYfEuwLu6nNdFiGvkreKBcrHc3l5prt4jBvilZOwbMVKHPT6XaEf1WEmaFDGCvlNOTouStHgKu70qIfohflrieMfwpOITb5/egpIO3W1/ftBlcl4yeHLV609Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRsWmV12+we2Z1mWdG5UH0Dv9MNER0qlbsw9UENdZJQ=;
 b=KGVhmvpZ2DrhPlxbGfr2cMSRNKt+vD+pyvW6HIggzYPcbM7ZbXotnRCN9zhy8JCoNGD/Zffn5VYd1mjJ0NoS7wZRRgOXz4wt9knEe3/LTcUDoq9jyuKnN+ByovIPitM8pdLM/OWP1iBBZDuKydaq3cJynPtwRwpA9+eTRc31vQHCo6FGUlhFc0lMs2qUW7zJfzYH2+/ifFXbC6j6yD/5zOBPf3wCf3qnPVXo8kwpV/mZUx4QjLjjuv50SZt9+Y/ISQ0RzuMcIAfMDLkyIwThU+O4uI8BEpVnBkjrNj0S429bl/81dv13SeSRdxYg4fvzXbMTsLD1Sv9DnUNPWpW3OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRsWmV12+we2Z1mWdG5UH0Dv9MNER0qlbsw9UENdZJQ=;
 b=d16RZkxifYx6LTU6Ckoxv6ywc4ClzmwSkoMVj8oL2ALZfOY0Yfj0b3TcDA7APu7bML/czf249xOIeTlq75QHcz082KfVDvCFVd9KEqMlRLgI0WRspld+Bq+fGq/euVW3FoiFv2b3CiHGeBE9D3qgEKZHlhnOgji/0+UTZzaUBTs=
Received: from BL0PR05CA0008.namprd05.prod.outlook.com (2603:10b6:208:91::18)
 by DS0PR19MB7465.namprd19.prod.outlook.com (2603:10b6:8:146::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 13:10:16 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::e9) by BL0PR05CA0008.outlook.office365.com
 (2603:10b6:208:91::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.14 via Frontend Transport; Fri,
 16 May 2025 13:10:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Fri, 16 May 2025 13:10:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 26EEB40654F;
	Fri, 16 May 2025 13:10:12 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 154E0822564;
	Fri, 16 May 2025 13:10:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v6 4/7] ASoC: dapm: Add component level pin switches
Date: Fri, 16 May 2025 14:10:08 +0100
Message-Id: <20250516131011.221310-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250516131011.221310-1-ckeepax@opensource.cirrus.com>
References: <20250516131011.221310-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|DS0PR19MB7465:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 02dafbba-0140-4c13-cdf3-08dd947aff68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i2nf7QzIsj/B66rKFhmU7WDliyE5pDVFj7RHks/b1OsWSmbROV8KJaAJ0YCk?=
 =?us-ascii?Q?yTbLBbht4Dh6g1LLPZhnk05AMNU/cj528aiVnyCBg4j98hh7C6Ainj9+U8Hw?=
 =?us-ascii?Q?7LOKeXQNXYJ6nwqj3Od/imWoDk8Egl2LOpDssHRV0nXvoL4mQ9QzRNjk4S4g?=
 =?us-ascii?Q?PapxxZLa47rdJt1gKD3LaXvqBhiKi48Lt5F9YznA6bwK0km6lqWSbXG8DkVv?=
 =?us-ascii?Q?dRipKEMgZO6qJlv3QdcKiE7XAsQO869E0nZ69WfMfGQBqSXzDWLXkMkMs9BO?=
 =?us-ascii?Q?wR1e1a78ouNBpIHOJfZDOSEAf4tMpQcFGVj0aVB09jc1OEGnilnW5IZckGTb?=
 =?us-ascii?Q?KUubRFhzUexKyHAhkqHfZozsCyddP0puu8MZ6ONQUrlie+5eiLDL3urUTwvS?=
 =?us-ascii?Q?UACDuVGLtJQNeCehqpNWP0sbkRhC5i4YSX+aIIg8ie6zEMJznkln1Kkp7kG0?=
 =?us-ascii?Q?KjSDPLyUlVmi265SemFh5p/FvupnPXLIMSKDt4kkVdQAp1Dj+rY11gbozrWW?=
 =?us-ascii?Q?EPPyeNfL8i0Z6Z07JgPeSAPZvSsYPNAXmqaC7zd5hBK4jjJtlgzkYNuLPstV?=
 =?us-ascii?Q?xvFgNKaPKRIfZUD0S9eVYlHZLsfPL49dhnWwe+jCRjeaWucjcL7+DFgS0j6F?=
 =?us-ascii?Q?zaJ/lodFQ7YrMmmrwSXHNzV/uwjFBkwu6/X4TVTHExztMKXpQijQ3mkHOjaD?=
 =?us-ascii?Q?X3yCSaTKP9QwJ9fBjj5Mi0tcJh0b1Vzbmh6PpnFN31dHVsS9MQCqB1QDljZL?=
 =?us-ascii?Q?uakp4nvASYrNVOXfbibEKYVzvfEGaZEpp91J+k/K87AzPIcOtcTG2FUSn4t8?=
 =?us-ascii?Q?hkALpeeAojmpdv50kB+5ifbiJP5NlgIDfLbGsMF4ZiqV6sIxRDvBNLb3wjpi?=
 =?us-ascii?Q?A4kyXUICKFDceotBf4lmuQtD7LGrto582LhLoA4YogZ3eYM4zOAHd6sFMWtL?=
 =?us-ascii?Q?RMhuZiXDC6nuk9lsLd3x+XDNhza66MZO3cARlJ2QXbd/vzT00t3p0NPLozk2?=
 =?us-ascii?Q?8Qx2iak51MTLXL6CkritmHoh/P6Lv+N5GZYNDCh6vdkpBQB0CjxtGlXOsrsV?=
 =?us-ascii?Q?QS7irmHwkenB4zWyN8hhsBx3/5DuWDS6v296Xsx4RuIwiPhI0FhEgAVcFO90?=
 =?us-ascii?Q?AWSNJZDmrm3ye4chq6S6sr4m/nRNV9w7X0WMCnSg8exEdv/xxTHJox1bx7dD?=
 =?us-ascii?Q?s6Lm5bibdE3ED4J/n0ueRNRVWiJfdjsIXNyxP+Fjcqe+8nhJL3WAxe8fZT/g?=
 =?us-ascii?Q?VolpWSVc/81WPM1VZWvka13Edxckvo0VujiAakfBnY5UgrmQbB2vz3kZxR42?=
 =?us-ascii?Q?IzriiuuAhyuRpAeUbbrAl29w1HoQNzaSP28S8UgQo6fuQaeUjFdSgCoBvvkl?=
 =?us-ascii?Q?08SgxEUBi+A7FvLj9St3lhb3GBbT8vRxpgHJBJNhgxEzzURhtY/h9O0cBRpO?=
 =?us-ascii?Q?759lJ5qNPklaXrx76meijTkfGjzHOiWfGIqusD1DPKoYxkQZO0Xu4x3ks1L9?=
 =?us-ascii?Q?eG/Z9EDOwQOo692WWh0eVzv3dfC4Wp0w21IS?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 13:10:14.6400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02dafbba-0140-4c13-cdf3-08dd947aff68
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7465
X-Proofpoint-ORIG-GUID: ia2sRZ3LBrqIIHsXJ5MoauXybJkj2BdU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEyNyBTYWx0ZWRfXwswP8SoxYUaV dNSTXZBVwYpwK487jhu5XRsStdbZcNV7uhCr7b1MmHcIjvMl+nThZe9otfK/MDUjk0JRGjLZQ/L QXMBUBLffGQEQAfvDPQQ7E2LLU6ecgw13tx+/QhKXI6X6Ff+P+jMXWT6b+yeYmxefoWVz+3TEwX
 mSlFacTqwsvtLB4MdNvo7jH4qEbQsdYRDWWwfgCG5se5kwx/5m7XeKWcK3M9jE036bcKRkt9vc0 pIdjB+ZYOM036NsjaQYN5pOgO3LGJueMkTX6R0izfCARjQOXwsg4iUTscbYHIitDhG/Lo9Ub0Ec 3k0etP+8QOH4JNoRwzPfI5YCA6LURqLZsyvbdzNMYdPPIU4xYiXkoCRXHZ/OEmu3b8JcztjBWYu
 Tgj4iGi2JYMSqef/6QNCxGclnZjhNiRWdTAEERln8QLlkAUEQMfDLDf08deFgNEqziuMM6Kn
X-Authority-Analysis: v=2.4 cv=eqLfzppX c=1 sm=1 tr=0 ts=6827393c cx=c_pps a=gHjWyi4SN+6fNgZLRl0D7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=SW88HgwpE6hd0ow_NxAA:9
X-Proofpoint-GUID: ia2sRZ3LBrqIIHsXJ5MoauXybJkj2BdU
X-Proofpoint-Spam-Reason: safe

The core currently supports pin switches for source/sink widgets, but
only at the card level. SDCA components specify the fabric at the
level of the individual components, to support this add helpers to
allow component level pin switches.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v5.

 include/sound/soc-dapm.h |  4 ++
 sound/soc/soc-dapm.c     | 84 +++++++++++++++++++++++++++++++++-------
 2 files changed, 74 insertions(+), 14 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index af802ef536e73..400584474bc8b 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -445,6 +445,10 @@ int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *uncontrol);
 int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *uncontrol);
+int snd_soc_dapm_get_component_pin_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *uncontrol);
+int snd_soc_dapm_put_component_pin_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *uncontrol);
 int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
 	const struct snd_soc_dapm_widget *widget, unsigned int num);
 struct snd_soc_dapm_widget *snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b7818388984e3..f26f9e9d7ce74 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3626,11 +3626,25 @@ int snd_soc_dapm_info_pin_switch(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_info_pin_switch);
 
+static int __snd_soc_dapm_get_pin_switch(struct snd_soc_dapm_context *dapm,
+					 const char *pin,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	snd_soc_dapm_mutex_lock(dapm);
+	ucontrol->value.integer.value[0] = snd_soc_dapm_get_pin_status(dapm, pin);
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	return 0;
+}
+
 /**
  * snd_soc_dapm_get_pin_switch - Get information for a pin switch
  *
  * @kcontrol: mixer control
  * @ucontrol: Value
+ *
+ * Callback to provide information for a pin switch added at the card
+ * level.
  */
 int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
@@ -3638,40 +3652,82 @@ int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
 	const char *pin = (const char *)kcontrol->private_value;
 
-	snd_soc_dapm_mutex_lock(card);
+	return __snd_soc_dapm_get_pin_switch(&card->dapm, pin, ucontrol);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_get_pin_switch);
 
-	ucontrol->value.integer.value[0] =
-		snd_soc_dapm_get_pin_status(&card->dapm, pin);
+/**
+ * snd_soc_dapm_get_component_pin_switch - Get information for a pin switch
+ *
+ * @kcontrol: mixer control
+ * @ucontrol: Value
+ *
+ * Callback to provide information for a pin switch added at the component
+ * level.
+ */
+int snd_soc_dapm_get_component_pin_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	const char *pin = (const char *)kcontrol->private_value;
 
-	snd_soc_dapm_mutex_unlock(card);
+	return __snd_soc_dapm_get_pin_switch(&component->dapm, pin, ucontrol);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_get_component_pin_switch);
 
-	return 0;
+static int __snd_soc_dapm_put_pin_switch(struct snd_soc_dapm_context *dapm,
+					 const char *pin,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	int ret;
+
+	snd_soc_dapm_mutex_lock(dapm);
+	ret = __snd_soc_dapm_set_pin(dapm, pin, !!ucontrol->value.integer.value[0]);
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	snd_soc_dapm_sync(dapm);
+
+	return ret;
 }
-EXPORT_SYMBOL_GPL(snd_soc_dapm_get_pin_switch);
 
 /**
  * snd_soc_dapm_put_pin_switch - Set information for a pin switch
  *
  * @kcontrol: mixer control
  * @ucontrol: Value
+ *
+ * Callback to provide information for a pin switch added at the card
+ * level.
  */
 int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
 	const char *pin = (const char *)kcontrol->private_value;
-	int ret;
-
-	snd_soc_dapm_mutex_lock(card);
-	ret = __snd_soc_dapm_set_pin(&card->dapm, pin,
-				     !!ucontrol->value.integer.value[0]);
-	snd_soc_dapm_mutex_unlock(card);
 
-	snd_soc_dapm_sync(&card->dapm);
-	return ret;
+	return __snd_soc_dapm_put_pin_switch(&card->dapm, pin, ucontrol);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_put_pin_switch);
 
+/**
+ * snd_soc_dapm_put_component_pin_switch - Set information for a pin switch
+ *
+ * @kcontrol: mixer control
+ * @ucontrol: Value
+ *
+ * Callback to provide information for a pin switch added at the component
+ * level.
+ */
+int snd_soc_dapm_put_component_pin_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	const char *pin = (const char *)kcontrol->private_value;
+
+	return __snd_soc_dapm_put_pin_switch(&component->dapm, pin, ucontrol);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_put_component_pin_switch);
+
 struct snd_soc_dapm_widget *
 snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 			 const struct snd_soc_dapm_widget *widget)
-- 
2.39.5

