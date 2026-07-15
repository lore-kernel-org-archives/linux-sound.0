Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB703B19D8;
	Wed, 15 Jul 2026 16:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784132989; cv=fail; b=TWmWShJsN66C+vFrB0+xZnilVw8Wg7r8DVoNSbyN4cQU8jj1cs3VXeeTHfkCygCAnspk6OYWR4/rHiaeTsnfSdoNKvrTSdScXZg3dNwatEmp3ooK/ca28ogcOqJsHOJ44zqag1u3vwVQDHT/rNtFaMxum/yEapwKVU8unUF41cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784132989; c=relaxed/simple;
	bh=fA/+bskKwadqD1hVfZZyRdOaV51v3SKJ+3tZc8zKHV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CrNbuNyY1uqWO3lUXYVnb1Z0CtFp4efl0uc1qTofRdq9VlPzZclDNDW4z3bQOeRgB0wrQEVKTC4CkY3gvTspjvMkY8FcgPi0BDBPh9crN7GRWT2FGlsx4vicSwELPQDVXLZyrKfLWGrOX0vVYWdxv30IZo9BYN7o0OEgub+F0B0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=moNz2ADD; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=zeeLcOwJ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="moNz2ADD";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="zeeLcOwJ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F4fZLi1875915;
	Wed, 15 Jul 2026 11:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=J1nxEgZ4phlsLOWTj3ssc7jqK4AgAtQiL9mOQVoRqYU=; b=
	moNz2ADD/VeIv5bixO3Lo0mjfRoZ6EsJ5U5xkdtpeyvIuQQEE5m9ZFlTaz+KXeXd
	JkgQpvVaCkxvpxJJ8TPf9+XBwqwf4gQd2ZgMMcWW7RpHAjzJtx0sAZ7fqLNC3qnS
	O0AbmBGjadvwCvICT/D6j6wTRXIlAOOUz1tI31cDsbSuxWyKbIOhczOJT04eBMwJ
	vAIJe9Th4NOlobefSacwqyHhES3T8nDz/KdB1svY4YESnxrJJNQaT9cBVpLFP+tO
	+WWMWW4TuledkYmsYCNgJKYqasfNk953N1e2N4gpcpmpxakEIIOpbEj+Ve+ytAF6
	n3Kgv0sJuu/y3Rh0Fxtv+A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023101.outbound.protection.outlook.com [40.93.201.101])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fbj8fnwqe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 11:29:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ved1RGmkabphFrwkKxpIz4diUpf+yBFOxnPzXbSI12+u0xde5d79X0iZc5IS8WFySY5pIVwg6vziz13b67+zsX/rutZVNAcKF/Ba79nN0U2QTRJUNseOOEaRB7mL3nLC9h6E+G/Z9KnEA77+7SwniQ4WyF7uDjnU2b2YkwP+40B/gNeTSoDYBRkWfWSTNTD60Qt//YcUKOwxZ8SGgDMtUKsdRgRJMJa515xOiOd3mOOCq6LJUrLaZAJZ2bJ7buHltWdrtiGe0DEflUH+qr37xhaLbBYadDAmjsvSLhR+pZ0QqHFrXZOCZ6ztG51v2G7QH4/XpDn49vUeXg/By9vM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1nxEgZ4phlsLOWTj3ssc7jqK4AgAtQiL9mOQVoRqYU=;
 b=udtC1ZAlpTFhvps6M2/silmnCuu5iScdPtYXgORSWM5Y/yx/giiQhpaUBDYLNqSMvY2YApM3q9LP9z/2fWKVX7uiV3W19YJ+vCo4Ra4D9JzDNoPnbdyKNIlaGBiMfl+0Cid4CvVHCEuGAgIrme+C4DbDprwm6vWkDAsDLUluZUtnix7ZBPlFoKlng+/bv/cTxNspmhMZEs8hH0l0wzmLqNo9wODIfJfRZUct3908EsMK/HiKAM80++yE3iV3cUicb3lC6k/0fXqhbnBQw+tBxKLu4Bxt5ds1MUun9Ip9FH48T/5+5ZSL4xWlABhK7uBJkzJpE31o0CZNViBnVO+04A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1nxEgZ4phlsLOWTj3ssc7jqK4AgAtQiL9mOQVoRqYU=;
 b=zeeLcOwJLAPV/1m3OjfRzBDPnarTZ8Ccp4kIytc4lmsnB/T4OE/vJQSNhfO0UvUXiYAWOayOMjaTiBk6haB3i6mnvRMbbJ5GYyrlZlMIGBJ64dfe00i2iDM2sHEJTs0qUHsv7faGiGwtTLmFSeh7qhdzxCIiw5+tT4CbC895KsY=
Received: from SJ0PR03CA0276.namprd03.prod.outlook.com (2603:10b6:a03:39e::11)
 by SA1PR19MB5087.namprd19.prod.outlook.com (2603:10b6:806:1a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 16:29:25 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::d) by SJ0PR03CA0276.outlook.office365.com
 (2603:10b6:a03:39e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Wed,
 15 Jul 2026 16:29:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Wed, 15 Jul 2026 16:29:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1EB3C406542;
	Wed, 15 Jul 2026 16:29:22 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F02FA82025A;
	Wed, 15 Jul 2026 16:29:21 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 1/3] ASoC: Add a component fixup_controls callback
Date: Wed, 15 Jul 2026 17:29:16 +0100
Message-ID: <20260715162918.1898396-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715162918.1898396-1-ckeepax@opensource.cirrus.com>
References: <20260715162918.1898396-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|SA1PR19MB5087:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4cc8d61a-8b5e-4e89-2240-08dee28e3b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|30052699003|23010399003|36860700016|56012099006|11063799006|10067099003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	We88KB8p7joTSo+/22L8Y1clGHYhhpEUVasrqZBLYerpKxiJJ9g9BpMkycJLasBPN3WtxyH4FsdvQuq9ZJCk7nk2aJy0+dyluFeA+Mf1GbznLJEa3T5MvjZrRYtGWMnyFjpMTFQ7T8sx8QGGASVnw4qwyba7xqHOXlhbirJv+aye4i5RxZfgzqx4jtOKqYrP2+IFL5Cn4Us61FEgMWL6lwzKjwk+O8sJmz+q6diCmJQ7/NxBz1Bv0Qk8LKAgNkQpDqr/9FBvh3eDYhATZBuC43lU5ugfJUt/7M+rY8YXqMFFJjSs6/Vqb7y2nY9o80Rbz8T2sTMOnv1NP8Nwv+msuvc/NSQPpr68CnnLHbaNW/QxWXlymUp+DJltrBE+uXy4zWazlI5lthyLzEDiOlz0/59PzLRsq3dIi3mQ2nqVw/eORqMTFb4L0g0v4F/QeGo71m7EFw474HyH6sClqK2tNy00jmKWulk1WAZ8CjlH9dMhl/VXylxrVqtCBrDU/FG4dU5Av321SNO0avlYXT/vtEbh6MyYKISfh8UhCDESNPIr/FNn2RxUq6+yOpp98tjCxdAOaFibbAZvZBFcrImDMqUKknMTYmlBWwDejF35Xtip1mEXZaWWSKlhVR5P1a86LuPqLOLzkUjGQ06WSKwznhMEjSYKf19jN823PlDr/XAzLUiFUFg0zfeuLvYXSggL8cKsNeAws8bEIunxXFbRhQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(30052699003)(23010399003)(36860700016)(56012099006)(11063799006)(10067099003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HdAzkrjkN0/Yf2J3rH6IrM9cTj/PNUlymrBOEzDMafICFK3KqAs/HBVTHkJTfqMbCKbGgXqQkUAiYXmAyjy6mRlyzjfoKNrzUNlE88RaIq71ZNMw0TthBFaKPCaPJZrtp3n+q2lcoh6NxAHkFRmO8P8LIPHd1gwegk0rMiE+lFmiYQdjrz8m0djTarNee7rJWrYq5Jxy/HOe+ID3BJzn0EVBawHwdk5+eA5A5iuXk/uflRAISTpy2njs5PYDrphWC8KIyrgkvd6TEL3x3yQBAInmTmh7BYu1DGmjYywPpIpsQczfFtwt84mOj8gc4rjoauOiX/Hin9FT8njQBHACSorejnViHGIuuM4Ygh1izug3K9FG02RhxOiabZJtW7VVwXj1Ikrxo3dzZn2goQ1H3reRhhXERk8J4HJJRVRmHQFt1ACTUJ/4YJ4ZacMW0yBI
X-Exchange-RoutingPolicyChecked:
	okXDlo/yKQMXdv5uN1GR3pL9VN+eaTYriIr0rA7Ekol1MYa5gaEDBf2fIYB43FJ7diRjiXdj9szuOi/8QlH9pxhrU4oUa18EZLnVbGbb3tHlt1COn9WKKn2IXAlih/gjZSItxor6vdu0EXoDOWDcb40zDqV0sOW1IcP9J4n5l8cjwH2lntrbw3G/zxw65qWDM0igSmyukG+64u+eI8JZ4pxWAGaDmVXSfLk28MPsrGDNrPeBd8Az9ZCXTSLqtO8oFVfS07R72HiEE73Y5/3I18qlVgWYHV1T+c9Jw0y1uY15OPN+Rf5QXoVLBTijwgyqOzrJo/2DZU/5wa5nbuyvNQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 16:29:24.2310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc8d61a-8b5e-4e89-2240-08dee28e3b8d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5087
X-Proofpoint-GUID: JAI_b5pAyk4cJpciOIJlB1qC_IsH1hzZ
X-Proofpoint-ORIG-GUID: JAI_b5pAyk4cJpciOIJlB1qC_IsH1hzZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE2NCBTYWx0ZWRfXwohVALVj0vY2
 QEvI+Uspvi/adoVfRf03peh0bWJPpNSk61jSbYiJcTkpfqOmXGF2hYrtTXF9aORCAb/auNliWPl
 v3LY47BUrx0j1n2MX6BYkljW526QpIk=
X-Authority-Analysis: v=2.4 cv=M7597Sws c=1 sm=1 tr=0 ts=6a57b569 cx=c_pps
 a=S0CpYmVZ9TPoM0rEAH/1JQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=z9ncmWt8M9pI67tEN-gA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE2NCBTYWx0ZWRfX4lhY6RR6/mgy
 aAw+l13EEprvwuqzTMOYTbWHJni4IFFgDfSuQXTxs9NsSViAaeZZ9mGPJhho+WSI7s69K9SvZMD
 5Nwjs2gAr/to7CqiD73K5vQwB0ONlLPvkLF/D7fzszKb9noAdQlh6cdsCVeRp5z2uOIzMFxjh2T
 ycsffY0kLev0vtsc1XbTAG/WQnz8CyMEmzgQuR9ZmULgwZHWgcyR6L3xJ7+RGnqTmW5aNDyg0fV
 yA/Lv+zsDi9u6cYksIWsJTacwNHhF53VaopQr7MLFB5W7yqfFaeQK2IbGd++DKTBuUyJj3rKZGt
 AJw0NfWk9bEhHIf/SMWdq8FkjZ2SFkgADMma2+oIGmH/dTHXlIKZyBzownnw9jZ5ZgosdeAhY3P
 0DzFgEQWNLMMRpB45TJcrG41vIeCx03W50XNazgPEsb7O1+l8MNOJWCzaVKPo+ErMx1Us3+nOZv
 DpVTPw5CqC2+bebiVXg==
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

No changes since v1.

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

