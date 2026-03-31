Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE0B375ABD;
	Tue, 31 Mar 2026 10:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953702; cv=fail; b=UHb7YniYRln2D5nVWAsVFmC/dnDMBEbkrXrKcJ7Hs6z72SyDGEY1zeuMV0IjyBPf+3edsS3zgkP+5wCKPcoE00VrSxDnsv7grPdmO/XhV+LMBrBEuHtqJq+amlr9cqJToyfpAeeUHLL/pjAljNu/EWCtoZWeVet2cUnycxG0/3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953702; c=relaxed/simple;
	bh=unEtnJ2YuDyCsXNf0AkHUu6rn5SYfYOac6oFl0UHKSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hDJxJZA+MSx6q0u4MfXjiTLKD6djqbYHMT63+yuLGRZJ93YlZ+zby0RqI3Mb8357WFxVbFILD0/3PiNjETwGoT6gDzBAlb2xb4cTyoVM2y+Pkr/cefHl10c6WF4G1IMs7zTgn9C2GJq7j5uWJB48IHumE7AI3qg01D8SX9Beerw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XaSDcWD7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mjAS7mW1; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XaSDcWD7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mjAS7mW1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V4rXhr1633148;
	Tue, 31 Mar 2026 05:41:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=8tNlKIlNXdyZPksu
	7FULQCMfw5K5fdq5Mb99vXJp16Y=; b=XaSDcWD7DZBAG1NTh57LxqdGSXMJi4ug
	FgNSL9kEjwq30echsyOAdDYEqZHBCqFA+3RTTjJCYM6f8hyzmJK2pE/vr5FlneTP
	olA3Ul8/CT6kCjj/tpTV5oQgPM8E77OxP9/cukPhL3B2UmwtKU+T40VItC+nCBwk
	VMsWuxe9MsZjZRw9kAlDRDGIUhH+VnJ0i36tldtGw8OGz1v8PoM88ghyozFXERGt
	fyVwlnTO6qrxeWevGanJTzT/ryxfiKrWbLObW6r4jCFH1redbDdqFgkv+vZ0dkes
	9Ifeyozg8WANUghMLs4rQuaDooKAU2rDAUKGVAYAOE93pNnWYweB1g==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021097.outbound.protection.outlook.com [52.101.52.97])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d6bdh32x6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 31 Mar 2026 05:41:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjibQ1s6Vx0c6/u6w5eJIzAcgmIQtHNEkskteZ8f6fgBJnyDzTSsmVctT3XBTQgLc6JYq+eyj7Y187q4wPyBOWRPmZdsS5zAupongmBmhu/gWuhRKWOc/xqh3oL1LaEiCy5RnSs6/9ick+f2yT0ErZZVF2A9Lw31YusjmJ+656JAkwpZ93v2s0/86sAQNvtEihCMBpPLcU+uD7Sg8YsMyUlIXUABzFRmf6wQM4S92lb5jH27Aby1j339mtfzm9kPDvtiHErV4GXlT3tPT8fnU/utK5z5akxf9QmQHBBS1660YcYpiWdZ0BMMlVi9CmK8FFqEsfwCp6UpVPItt1fbTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tNlKIlNXdyZPksu7FULQCMfw5K5fdq5Mb99vXJp16Y=;
 b=PkhO4Tc4xNubD6LGF/pxDJ1iVjaTZd+IZqZSnVLq7sueUAke+SaO9fgwXG5AgFOZfr5x4DMsGGtVECLFEXMiVC7rMi5EmBlCK0CiLqyyFrdIFEjEGqoptA4b74CdJGpVrlIhiK5WQRdbeWpamNTAwSe0drlz3Fs3T4HMQ74v9RpZWvHwxjRFfmD6PzNH4nOM829oL+0FCY6kETzQuiUkxZ/JjtwPwFipLAfY6jvUMu8wtMY+A0xMhoynggnU7qO76qzFrLjfwEfYx/ctZaIUGZbl+OpVcSOQ8kxAHtTdUgx7jkhxDIWSivC6/BnfJqf/UUbqYK7CRhjkUBMg7JfLPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=amd.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tNlKIlNXdyZPksu7FULQCMfw5K5fdq5Mb99vXJp16Y=;
 b=mjAS7mW1YTeub547i10aeUMOzpCUnpLsyGGxfeyvE/HeI6vikgd47syawtlZtSmuomswmNh1K12CG62/uZTIMNHxM/s0HcIFhW9rOk5c7fIlj9ratbZa7d2ROe2xssro3gRSsMFP3f101CYWZQwQ31/E8XJeIUXnt/bZKJ6wMhc=
Received: from DS7PR03CA0151.namprd03.prod.outlook.com (2603:10b6:5:3b2::6) by
 CO6PR19MB5387.namprd19.prod.outlook.com (2603:10b6:303:14a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 10:41:26 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:5:3b2:cafe::c1) by DS7PR03CA0151.outlook.office365.com
 (2603:10b6:5:3b2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.29 via Frontend Transport; Tue,
 31 Mar 2026 10:41:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Tue, 31 Mar 2026 10:41:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6DB4240654A;
	Tue, 31 Mar 2026 10:41:23 +0000 (UTC)
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3B64D82024A;
	Tue, 31 Mar 2026 10:41:23 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, Vijendar.Mukunda@amd.com,
        Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH] ASoC: amd: ps: Fix missing leading zeros in subsystem_device SSID log
Date: Tue, 31 Mar 2026 10:41:16 +0000
Message-ID: <20260331104116.16417-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|CO6PR19MB5387:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3b11e799-9a9e-4143-d2dc-08de8f120ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|18002099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	Wr4c8Pj9Q92+hYIx/uIxZ2t6WfXqhSlArXXfA6m5xZdlNJYIOtMRjk7DjqP21TbIxcgX/TvK3cBB54MzvIiGE5PsllZ4ZNObhkO0kJDI5dzQzfej7t2rDfKFfI6yrgwQ/4KmXE+VsRHEcK6pXOMZrYodSh9CzPuJVLPTn/YRe/mlmrS/Qr5fXkAz1g+prLTqKQchyzuZ8BK8fdFbKsSweNmRvLjdC/LXpJ4KpRryT4oFCJxMoXo9R7d4hxXxTp7/zehMIFxsE6dGiKtGOXYX6qWLVIw188adZl0+gfE1DESIJXD2kIWPuWArO/q376F/aCz/j5KGa2oas884v9d1wCTLVC79gJx4yIccvPstOiUy4MVPa2VKyBHWZe+TomXiuEoCIlaxfldQUPZ9RGfC8NX9jhrN5M/xy6naZH4Wdy+DyDIfnr7jtYjxX/jmzK0rSBTGzUUwDdaQbVJ5AC47nnTCnvJILOrehJbvSBwEMDmOE2m2r+GXM2dzd5vFzgejPj6KsOHRCmzlupP/VW5e6yeY4jw7ye75vONVZ9jWblC8OgGSDn23VRMqhQPllDilXyFuX8Saas6yWGrw/kdZQ2lNL+X5sS3v/GcTOdpZOa+kpP3GVBCNNKGGyy/uNc9D4uwGTDMW3DbueepeNJNozUvjy5JCr+qdYmyxdVoUFcL0ZBhGOLZ1YuBJoyOVly/blXSkuoLRlENoJbBw7aSdwt1AyrBPUCAjmEVv9VB9yODG0OTS5n2V+DtsRDOvPJ+9JGivGyK4NnC+G+cP2EgB+A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(18002099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TcubQOofz3pO0/tB2iN8Hfk0UPRltZib0dM8duDVAXW8T0NvFJXGP/oNYRAmpz56Q17IdkZi83IebT/ZSWbXcYxp+Iy8xMBErQF5Ofuhy0JMgDVX4+FmUjlrXZ6+qaO9GQw/L0kSeYMKTfWhcG1z60vAg4LMROztkvCAGf1qKEmR8LcXv+9PD9paT3ZE15QuJ5punwdAtdwiTS6bpzB8htRxEJDA7C19ahw3MS71FNQAhegaGSaDObTXYB+MqXFcMNcR9duvWOsUBqHTsfwPBf8IiMY13RolLl+hIW63Ha8E/NjVvtqVsoOuQERNoOtpwPj+wNRN8h61jr2iwvKQQuHAoJzL53hn96rwdnUOH4DZdQwXe9YuhNu20n2RxIa7hJOCGW4R21DyUxV+9Z6OVYTf8KZWdEA61MzPSaWq0TBBK5PhhOlFGOQPyEOg9rct
X-Exchange-RoutingPolicyChecked:
	iCZ2DcgsNoD1s3wpMTtXCU4z0olJqS5Lt7A3a5mfFYxeK26Zx7xD2sWciyvsUqbeL7s7wKsCZ9tkM8umV9ml1d13PYabNVEk46D5qRwv1r8974hNt2PO+OMWfP515Vcd9a2mqhfqvlmmqNHhlrAXr2LDlrDdS3ENnlq5uT+gFBT7yAR+cjJqauC4bgRpIkfft88cOXu/J65Wqi/sLyilhVMOOuexvkE5bWqDZMX0GTByAWp09UhKruhOHxker7AkT5YdUbCkueLTUj7z13fhWvcLmzLHAbAH6yIiUY5hRTdmPqSHwRnoCJDLFs5hwnRukFCbE03C1Ah1RzM5ri+eWA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 10:41:25.0329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b11e799-9a9e-4143-d2dc-08de8f120ec6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB5387
X-Proofpoint-GUID: uz2BqNTBAWQQ6XQIjyMhH2QGoKRe_0a6
X-Proofpoint-ORIG-GUID: uz2BqNTBAWQQ6XQIjyMhH2QGoKRe_0a6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwMyBTYWx0ZWRfX/DhuXbm+dJkQ
 wkrmPMFOcuasd2uvrUEygxyQRQe2rOmdJz0kgCcuCp6LKQ9bla2VOHSR2efZ+Dl4ScLt8PwkqU3
 NAkpgvH4AQUKcvHy1AKi+heYweHYX0ntRZZF2sQG+sHC7RZwVCaS3Kc/7KRFiVddnLSwxLeOfIa
 /LmhAEgQpwuVVdqeNsV7yAoHqnQUkRLUfFeAoagGVr4/u6lyWZcEYCBVweoujwF5w/qcHeQX27d
 5NyqT8dOV+Q6gMbWixo9gTRlv+qOqZoqzcN2H5yW+0tMJV+Ysktg58ZchgrroFrL9qoIV3nnO2E
 FKwsM9o0W6spRB/6iBp8md2KgJrwDRnYImp8dLix3JuYWkweK5WhaVBmOcmLKJAhICPCxxBT6li
 bO7ptuW2L3kaQupK3/FiXiiLx004CxanPwmY5E9CZqcqoXa5IKPW0O8YFkiVkkDJ1abiQUD3K/z
 fg/XbrPZmOzL/aia2kw==
X-Authority-Analysis: v=2.4 cv=GK0F0+NK c=1 sm=1 tr=0 ts=69cba4d9 cx=c_pps
 a=is7RXpa33aREoC4jGqxG7A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=w1d2syhTAAAA:8
 a=uuR_QIuzpPcrqb6vyKIA:9
X-Proofpoint-Spam-Reason: safe

Ensure that subsystem_device is printed with leading zeros when combined
with subsystem_vendor to form the SSID. Without this, devices with upper
bits unset may appear to have an incorrect SSID in the debug output.

Fixes: aab1301cfde344 ("ASoC: amd: ps: Propagate the PCI subsystem Vendor and Device IDs")
Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/amd/ps/pci-ps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 3a20cc10d61f5..fafadc36e4830 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -339,7 +339,7 @@ static struct snd_soc_acpi_mach *acp63_sdw_machine_select(struct device *dev)
 			mach->mach_params.subsystem_device = acp_data->subsystem_device;
 			mach->mach_params.subsystem_id_set = true;
 
-			dev_dbg(dev, "SSID %x%x\n", mach->mach_params.subsystem_vendor,
+			dev_dbg(dev, "SSID %x%0x\n", mach->mach_params.subsystem_vendor,
 				mach->mach_params.subsystem_device);
 			return mach;
 		}
-- 
2.43.0

