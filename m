Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E6F3644CF
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 16:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418161; cv=fail; b=bC6sXUIcEQWFi4TFBhWlHBPotzw+tEJ0zt8f3/txMNPW9w9zSyv3lcDegLegCSxYdCIa+SrHZ1iqWBu5lUMMs3/6xui0l3VvAgK5Kx1D4aY7QlmUNULbsGtBYSYD8vTp1HVVFCEzmeHIyOoOMix8ZMsGEX9OLT88LltO98h4fGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418161; c=relaxed/simple;
	bh=xjvUSNJG6LCwhO6J/oqZdLOsgL36cIIpR7R9I7NyQG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eOOojzpbCFeXwlCO05mMwnqPfjB+lqKE66q/HMfLKf6jvHbzPox3Tjhbxgdm7g0mgAeg1Dy2huOPkzWa7Hd6ygSrssUuQJDIxaIUZFgO4Pm2HoxYq0hSwUippENM7TrnRkI7X+th62JhCsf4Dj6rNc6wtElt7UKOTh7zh8QJbs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=h8ktWfHQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dr1+x1kQ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="h8ktWfHQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dr1+x1kQ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7RE5s4167933;
	Fri, 13 Mar 2026 11:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=nemQLGgGX4v4KsPc
	nKMAByX2l4pTBkLR8mCYcPPqoeQ=; b=h8ktWfHQ9FVaE20xTBzpOrLa6qGeNb+f
	CS+1ZPOGlIAzAH6aPeT32vQLWeL0pMe2CSl+YGMbWxfN+CjjRUBARO/xxsp+xJq9
	KsuET35zdr++zF8BCIFvBLo+1D0wQtUMLrzlA2iIOrzEpPVu6CH/K+ypMvH44vk1
	n+fJN4SXOS6x8oPJF6EK5eWSSmsJwsKpjvCqt2CvR0IpWt9K306cKSu37xWxnKRa
	LIn2ZJQOwKw/3aUXKMIJHITwsDbyBXq8LtZaaPtb/5QES0NEBakub3FQRpCRiRcm
	mJcQHsmZ83wtZ0m55aZ0HSIDUq5vT8F/XyrslyFk2xzDbRRBSq55lQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023076.outbound.protection.outlook.com [40.107.201.76])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cuh7gjj3m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 11:09:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOhe3Glf/GiMNqS5oI3aGT/OIjYYnlfzru+N5n9euXYXf3nmyyxy8XB+XjR3m2dHvuiFTeAQ/0cP5mnxVA4G2sVteZvwj9hVMBcVBEBrjSvcEwFGM2XLJmt1XUUDAkx8ZmUUsEbV7xYKD0MSot8BxVaE0mFBLJNnbpAAyznKLo0TmPxeFitHnusJbPWKYopK6wo2nq4rn+MOGRXSwIRdaZc7Hcodaf8y0MCcKDvsS+0LVgjKb7fiZAMERlrbvfRYrNLbokBdLNU6XUkq1ARx8m1pHVtv5QvIuhLc5HVE40pifW6E7iHuvcYp1gJA9Dv9LnfJLB5P1YRIX6PZ0hQjEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nemQLGgGX4v4KsPcnKMAByX2l4pTBkLR8mCYcPPqoeQ=;
 b=leNEHjO3n7phZu82CeOv8ecfJhIHQW29bEFNm4/zEzt/wyNIrYpBvZLfWfLuF1rKbezJVgHzrUG6ClXPF4McgpEvX/UH9FAE/nrRehL27xlqihoQz+/cO6qru7XZL3EQL9dxKXLrgZZD64Qm5m6DlQe4Hh4ZaS5uI8IuLY4pUYYwD+5GDdpeFbcHEKlYVBtZIk2HQOzOhOjzgdai/Iq/tWDnaCV3kQrKUU6g4OOL2K1ce3pYyZQ9T6uz7+9yzjlAxvL8xoVsIhZYL+2HMEiBSWEiU1+a/+g8sglWzVw7cdq3b+hQ2OBTEuyi6Zkm/HOFG32bA40lboPFArbyaZbmnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nemQLGgGX4v4KsPcnKMAByX2l4pTBkLR8mCYcPPqoeQ=;
 b=dr1+x1kQ7NwUxzO61gEvAcuNWzcQDoGGd94UbW5bmmEB/0xUJMwlMGc7TG/38nQ7J+4mj9JQ+2mzmCXPoT5EZMoo2X1t0FT4w6ns7GbuKKbtrpsdHRkUn7dvzVaa627RxTljAbTRO1G5f4PeVvQOT1v+I2kZnjLuX9+dwUBfiKc=
Received: from DM6PR02CA0080.namprd02.prod.outlook.com (2603:10b6:5:1f4::21)
 by LV8PR19MB8669.namprd19.prod.outlook.com (2603:10b6:408:259::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 16:09:04 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:5:1f4:cafe::4f) by DM6PR02CA0080.outlook.office365.com
 (2603:10b6:5:1f4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Fri,
 13 Mar 2026 16:09:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 16:09:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 30B9E406542;
	Fri, 13 Mar 2026 16:09:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 19C4282024B;
	Fri, 13 Mar 2026 16:09:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] Add SDCA support for the cs42l49
Date: Fri, 13 Mar 2026 16:08:56 +0000
Message-ID: <20260313160858.2022849-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|LV8PR19MB8669:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 31a26872-f44d-4d94-3b51-08de811ad8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|376014|54012099003|56012099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	ZGE2cK7Edi3fUl67uV1XY9D5BaHXhlYm48El1C9aIy1Xgdd0JcUWqzwpdorYCk8HzfcMfBCVn6aFcfjL59s2Iha3U1H8whhtV2Dm3finBVxse/u8VEUl249YBe64+1e52wvW0S07qxfD9HdElyGzuArnGS1OULB9dzfuVhfo1QMdn46tR6ozH5bAAJsvW0abNaAJS9R23NcV9qS51Pk+sGUeLkP+/fTtjUMHnL9EwINAO6uh1l80WZ3GQTzwdOziyLLW5l9T7V7pSoFwdSz+1i8orgP7UNct3AuNlu4Sv5zBfINHjw1ZuJW982MTUM0diRKMFL94qyM9ZAlr9VNS/1usKUyWSNWm1z6DWeqjxpMIZjaBxhUK4hJl+mIngY8Gdq8lL89/H5xKoYbwmYHqwhKtgphlVD4gG5nZUH2n9/qRMd1co7eP39taOA5AvEHWqR7lmPjvL5Q3S5H2RXJauwVJrMoAGuASwKtWCGbdIYNQQqk/JdO/Q2NeagqK+aR3LfVP9Ggln3vPDpQ7vmRw7+8lRZTsYb/oe12fLpapzHwPdhiDbQwyYpQJLGZvl41+CAKNaAvvP1U8id+WCngAvN3Ssm6XeF5wdyCAtzDnrCBGst2ah8R+pbSuSJMb8OtxbRzX0ALBuUC8DUD52liOlE8hcSXouF+WeVdAWcUKH7C4QhSuDLrcMzWVW5bE07OowNCLaG/DcMok2fW5V2lv5BFmyYkxys9NrsO9z0aE0xS8ezGkkuGliKR1W4fYSHARfN1UanaIXyrUo8ufWwGlZQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(376014)(54012099003)(56012099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8O8y9rAdy4eqSPWzAPBhi2jSfPC5Qd/9y/HtH2YCgCE0FsbLNbSxKDTI6ZP5f7590ig+yvFspBpEUUOfA6Z91jwM+Ps1CYPULlLF7Ta7jXfVgDq4VxMmUarRKEx6wVpKWtaGcZfGgOzb39oOMiSthxGNJQKfGYCXXQQ8ZAxG14mXYl0B+PIY4qk3FeKz+fkDplSEYaQIibq12TdDl/IM0gQp9nBdgxmdK0Jtj+uA4aoAz2Y4cs90jVNx7BPwveZsXlINr/g8fELvyP7GuaexOCXx0OxNp+Igp3/OrV1BGRJn0Wur/F9m3szHpNgtxdgJFUt16twj0x6MJJhOGXO2sqpsFWExkEIYR0vWlk4JgL4VHBhq51vP46s3YSa7jEPQF5fj9n8GIWRc5JfxQKJvxxLjq9Z1Y57AobJDD6Deq8fyn+ItZA+wafUbLwLpcJAQ
X-Exchange-RoutingPolicyChecked:
	GoP6mT1q9lZE+BKB69PSxQFS0XmQdGbPeB20+zsPZlEXZ8PW12xaqQCXAJgPHsBpkMHupkoLarkydesyVph7dgYmkzCY4DCf5SYGNRfKsJIuJVBm653YAml75Ir7KD1RIyxdmlEIu6ELBax5fH7qiuGdqgB5Q2iz5t5zWjSJIG3KUewQSvTehrX5I5HZyOXNKtsN/LnJPJZYbOFgbbg7iGMR1bTPlZ3Ib1TYia7enRt+MiSemt4fP7l4zUis3s+bLI+/YAc4Ms4/Uw/BfVSQ3ogRFPHbT+vWyYaEvqPZdkKgc/vIob0N+G/aXdJQ7F5spf8LWOE6OTn4T3ZBjrZomw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:09:03.4636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a26872-f44d-4d94-3b51-08de811ad8ab
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8669
X-Proofpoint-ORIG-GUID: FPm9NlzPc0ZOmwdrrp25DrRAe6h-37Bw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyOCBTYWx0ZWRfX4ctJyb35pDYh
 AJfnsXvKU729qsqnmus6R3yVOD4Yhpxduhr1PlCM79wura6/PKoAneRBwnMoeh1nMA0QVGwMVMf
 LF663qQNzozQ6OwGcwUyWnyZkxBl2lGuxQebblVdBL5vDpEkXWes7QYi4zaNyWCrCnNLeSkbnFw
 G1yFzzqEVAeAlRmusVjKbHPTJtBaXn6KU9317+wwmQ5YFVF0fLWvBB+vedCW1o8exI171EhMMoP
 51sR1M7j1CSO+j7FirRpmKxr9VUYA/fle/pTPtMV7Rjb5b6VSJMjxe3b63rzqsOcfKKWzDac71/
 mhAqFFe8ebrUswpro3abKP3pQDB1/BAenfvL/ZfwB8J/Gk2Dlffj3a3lnD2stXmCJX8P1GtccpN
 W5cYo90KyiqLxUjgO1GNpofXU5UnljtaiPdhr3xc9vg8rsV6Hx02lPJJca8eFdKRktXg+g/9R8S
 E8gDSh79lWZ4C/fjj9g==
X-Authority-Analysis: v=2.4 cv=EP0LElZC c=1 sm=1 tr=0 ts=69b436a3 cx=c_pps
 a=QEJrKe+JhCFsWCDgFi+jqQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=V8jtXoSrvMYAX0jnPaYA:9
X-Proofpoint-GUID: FPm9NlzPc0ZOmwdrrp25DrRAe6h-37Bw
X-Proofpoint-Spam-Reason: safe

Add support to the class driver (just adding the driver match) and to
the Intel machine driver for cs42l49. This part is very similar to
cs42l45 so for now it will just be supported using the same UCM, hence
reuses the name prefix in the machine driver.

Charles Keepax (2):
  ASoC: SDCA: Add support for the Cirrus Logic cs42l49
  ASoC: sdw_utils: Add codec_info for cs42l49

 sound/soc/sdca/sdca_class.c         |  1 +
 sound/soc/sdw_utils/soc_sdw_utils.c | 36 +++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

-- 
2.47.3

