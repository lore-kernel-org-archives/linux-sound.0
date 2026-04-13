Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416C73C6A4C
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776084411; cv=fail; b=RFcYOoxTU3S1UEYV8H/DQ2cniH7lXQXY/UP9AWECqFJcCzUaKKT2ZmrCfKvVMI4b77o4zgWYhZfRruubacBgq720Gdxmw9TdDolKNhSZIGsS8D7zaMLbdUQICXViT5ReVlUQ4CUAYNV87XgdGefLhRGbhYq1IflcCYRi9S7BDsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776084411; c=relaxed/simple;
	bh=bTOMQ2Xo1j9q3VBom2XvwrsQlRr6Ip7CTj0JE5xcmCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jzh/lIR3GlqOxzkH/SW8nCDmpd5o6b/seJktoxGQy9wLHJh0EV9hVgMBBycfGaIwXHBaga4LfwB6a/EqyeUoP3Xv2Z6VsFTIvgxK1OL0cKvy/ktlUPJ1u4myl8PbhJ4jEG3kuWFz8SadBXBVds2C6LXY1KuopujbUaYDh6u7dOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PueZJ8WB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hfTGjsuz; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PueZJ8WB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="hfTGjsuz"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6K2jP270311;
	Mon, 13 Apr 2026 07:46:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=qYbkItiQKb3L+45Q
	k0SWE83WIcspmtoxq05YtMWyDzg=; b=PueZJ8WBDP9bPV9oJaFa70pDVdRIFjgA
	tle8L/u7sJdGIrtKbYt8H04XG5ZCZR+XuCe7yUrxdnsrLQRFXHHXfuzRNZie7tcS
	sl2EuLoWIrL/Fwh7+h//s22v6MlJbyMqeCPexOig1rX4wCnvUovkUyB5TrnKnuis
	EScUszJT5POxRiRVP9AhW3QYIli/Qc/jAic0qmmqUtHjsniff5MHpie3euXQGgpb
	TQ8BAvcNiYB9rpE/X8GNwopy73abgPcAxhFao/iQId/yJfPCC+Qd7ZWwVO9TZYL6
	Pr+XWXkyPizB3xsoKQCZkpAc7kfH3HFdBV8TG2wgDaScxPGAkLA/RA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020076.outbound.protection.outlook.com [52.101.193.76])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dfjqfskqe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 07:46:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDQ6d8cfBJW6OAWnqAaWPSp18AkTlXmQ4UJJp/AtSeaoDZ8/YnWPG2w0W3ExAXRDfNx7QQKqSX9gLh+J7AIOco0nAH6KlY6SjcvHh+cq49FzVTNU4ZLQv/Y1OA8gAsBEGIyrNHA9mK23v5cji5go0LtaDX/rUQJTGugBnLZgAvRfPxgUUej+5R2zqARF3DCbl/A2kGLSzKrERUyKx7LSt37YMma9ajaSQd0QpiBV3sSzKpQdYMtCh7OchWfz7ScAreL2/Bn5XCCG4upjEyFIhQt33X4qIR7MAyLhw5SM4I6+1YPAvgy/etwJPjxZ1AIIGqh27v8/i7Rbh5HO5N9Ttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYbkItiQKb3L+45Qk0SWE83WIcspmtoxq05YtMWyDzg=;
 b=WpV2uHOFC0g6qqvVNuyuipExrydzS8r+8/fMfjmb+K8coLaVY0nEmzwxaV+WB8795MDFBOs/O+AQst5QId8QNOyZ967OPPgzgLOACRp+XIERRT/73f6TYcnFTtyddZmvHSYwu1zC+ZNiIag+RxowGzcUwqgAMhv5urYNqD+s/UIY7DDqROoM1kDJfc3fhV3UCMZs8i2GJM6sGrpO3G0dEDL1WpDXZYH3YaaOFBo7Xg3G7SOiCMkJ07+yWqHQvyiDHqciz0lyoPcZhkPy38/h3k64+F/XEK1t2NWsCWqp1A0dDps8WVxXNodYBr0NYPUezI2k3Y0a/D1KUtMHi/orgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYbkItiQKb3L+45Qk0SWE83WIcspmtoxq05YtMWyDzg=;
 b=hfTGjsuzLq3FU6p8tdq9bZMyAHtfbwAvQfgFe33d92BwH8Jw34Ke4Zx2YNEAJ7pYlZbbMByQrxiPWV6Qp792+wTZuGehmuocgxYq0Cxbz+M5/jGj1iTu3W4K3LiuZTvOU9O4dY6Q5S/QWaCm2ridQw5MM0AEObswcPpKhZSjvko=
Received: from BL1PR13CA0426.namprd13.prod.outlook.com (2603:10b6:208:2c3::11)
 by CY8PR19MB7274.namprd19.prod.outlook.com (2603:10b6:930:9a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 12:46:28 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::db) by BL1PR13CA0426.outlook.office365.com
 (2603:10b6:208:2c3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 12:46:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Mon, 13 Apr 2026 12:46:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A3DF5406542;
	Mon, 13 Apr 2026 12:46:25 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8EDF882024A;
	Mon, 13 Apr 2026 12:46:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 0/2] Correct bug parsing DisCo booleans
Date: Mon, 13 Apr 2026 13:46:19 +0100
Message-ID: <20260413124621.1345315-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|CY8PR19MB7274:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9468eb1b-ad87-47b7-4706-08de995aadbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700016|82310400026|56012099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	tu+BRIl7zqZVLDmpXSe+GptsAPK94IXaUJ3Fs1QCy71g+GhAxdhpneu6j5HjPqpOahmI8fSCWMj1bTE3lxRHuMWv3yivei2HBLg2XBFbMUz3iSHVAyeyf/gpOhL5Yr4q7c4FZ5aZ4aZQ4JFt+JCvg/8kCCrnRj/Pa8cgY1QxfmWIz+94vb5LXyeECiQVTIRecdwYI03gYhvzxomJa0JY9y07RdjtsKBBfAzBR5qUXhtz2UromE87Cv5UxF/YquOgZrdTWZ2PKRqfytHqmHTic1VB5veIC71fTsCt234lb+qy4If0F4BlGuMRvw5xlAiMeFYzOTA1WhJSUshFBdrZYO4YTAZPHkeeSEmQYtC60g0Hoj4EjmN5HNmkr1zTmJsycsGXSg/fYecPcWFaMpv5PtyFTEZ8rfOerqLZdbBNNUZNbLtTbyfHpBNpcG7CSHSGT5jmwgv+9KmqZ9yD0DziGF5CWn7sMDDAvwvADGfivLiDvL9hfiJksGgIGVuppHfqkkTd/px3/JMOpxucy1o1GoKrI2a9DYvkf582dwRyRxBcWffxEPQhWCJaqY2kz0T42kKYflTPenUiyI/lakLUUfDAbea/CbY1Xra4xrrw2FCRknhDDNmPfN1+gShwUE51TqWdd1rcqPsJ+hpPHfbVoJ1KlQHDRGyugJ57eLPVNSTOVZLQMaT/aR8VkA551ttW+0YPp9AailHQMduI8fmKbXeVaug6f/vpwJUFuCORCDp7fTng3bX6E1WmuphhdRpnmW/ZLlMHhAwBBVeDlXxq/w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700016)(82310400026)(56012099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IjSz4HjV4To2hB/4vdFofuejykI7sX0eqBodD17CZiZqbwA/HxJmaVAPZiZeANi2JPeyAtc0szTHTKWqHaddjWZPby+Xg6fOiLf0PMn6//RgIGqv3rv3IrbW1ox4TE/+Xcv6Nqg2WHA2IlM+TixFmFyhiVMAyMzaShizbNpu8LTo9Hm2qgA6toDYS3lzz1bEFlN+Su4RIIG+1RgtQNQYaMloR+0fzxImbHxkhHtxKp53Z/ksfEEnu8sjXTABLNk9m1vngqM0KrZbmi4ecmF33T7lfCz4GZpmRB8N3G8huUuu6lww61lWithkU8fXIbA1lSYQ7x8VHFimwBz5LnhGWNMRFwjSgs/Y3TZ9ic25uDnxoMm7V8r1+fICvU0HHxAPd2tgzXMQSGd72sciGHhKAUJdPjeScoak+c8QPJdsqPqad3eYfiw/FjHnhCJiCwpA
X-Exchange-RoutingPolicyChecked:
	GV+Y7LRYKAk3t/pkqz1AqgyJk0MT0iXQ+ef3f+XBjmozqe89IuUmF8DTx1dSGHmauMJuenEu4zOGPfnuc8395vaEEwTgaRfIleTJRH07no5k5JHanvBp+c1Viyy6TU1khbdDresopP9zHiFDSuY83IFN/BokxKbXHumaPZuec5a+mE0WKO+FVlQnFt1Q43fQcxR6mqkdPUuxhUwHWUI6JDqVCSynPmBC+o+y1VfDf1iUh8S5iu+B2CogYc5ouEc2IEc5Pe/MYeBNSxaNsTRdc3vNLTC+Fx4YV6im+0vT1VxTHPHiBSHjrdUBUuYP8prl4FELAizspiMnZzfzfJTYGQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 12:46:27.2228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9468eb1b-ad87-47b7-4706-08de995aadbf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7274
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyNiBTYWx0ZWRfXz/0jTJqk9Njr
 IVeUHvtPZ0Zr/XMBU5cWw1vcVWzbZxqxhg3B/sNkbor3FFZF5HIRb77nUlzYIjjRwd8p5V8I3y6
 Qs7imTGfxAGIDEKyNVoxErIKf50HoMPO7oX0JCK7gsfk/SYUeV/13mxtZpcOMRlYRfd1KcHAb3a
 cskrWzglZ1Y0eSCv1NEgc1VL+YgLWKLOiYX0JFDqBfZOpEUCkxpmKlbNy7Iac0eG7XCLiTi49Or
 JlxQpFb6UNUbcRxZoKhVQbrbwAYIpP5oKT2zJf5oHPprEFyi+GTlEGr++ekHK5A1YA0u24xHZo3
 lk6JUR/q6msmzn4ZNJMX9pmkJ5YPzBx0DkE/CnFzw48k99nJbzUH9Bdn6xyyJQYOVeovVsK8wRo
 tmBJ4wPIGtyo5V4ex8seZiKcjmniGiEapjAmKFGbliD1v1cVt1to20BQxZFsRaZTvTGkHKSy+d0
 kK3iGEOnfEH/6BvqFCA==
X-Authority-Analysis: v=2.4 cv=TdumcxQh c=1 sm=1 tr=0 ts=69dce5ad cx=c_pps
 a=q8FgcN0TNSgK2FUdUHKLLA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=RETz2xxlGhLxmESLKsMA:9 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: OrYIi5MTtQS_ukEWtr_zJaBI080m-Led
X-Proofpoint-ORIG-GUID: OrYIi5MTtQS_ukEWtr_zJaBI080m-Led
X-Proofpoint-Spam-Reason: safe

MIPI DisCo uses the unfortunate convention of allowing boolean
properties to be present but having a zero value. Opposed to the
normal convention of simply not specifying the property. Fix an
issue in the SDCA code where mipi-sdca-control-deferrable is not
parsed correctly.

However, we also have some shipping ACPIs where these properties
are not specified correctly. Update the MBQ regmap to attempt defers
albeit with a warning in the case where a control attempts to defer
but is not marked at such. There is little down side to this as if
defer is genuinely not supported then the control will just return
the same error again.

Thanks,
Charles

Charles Keepax (2):
  regmap: sdw-mbq: Allow defers on undeferrable controls
  ASoC: SDCA: Fix reading of mipi-sdca-control-deferrable

 drivers/base/regmap/regmap-sdw-mbq.c | 36 ++++++++++++++--------------
 sound/soc/sdca/sdca_functions.c      |  7 ++++--
 2 files changed, 23 insertions(+), 20 deletions(-)

-- 
2.47.3

