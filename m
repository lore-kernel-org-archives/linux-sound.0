Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DE0314B70;
	Mon, 24 Nov 2025 16:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764001232; cv=fail; b=jvB7qR9Q8gaRP/poLPnLgs6JcgZreeYheEFXpMV72+xhHeVc12wtSM+O3LEMKEfGcwX7LEyNXqlGD2ICW5PPYjVq2uOJvYzsce0848yKIG5H9X1YiYlqReaN8/IUacBGtpwnAQiDNSYdVU0TNxaPdAWmb2yFIETq56QuLxUxNec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764001232; c=relaxed/simple;
	bh=E3hjB+U/9hoUt/k9/5MwL4Dm9X8SZbe4hm8g2FYyNWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E00Id9zmuIqgXzkfh9gRH10EoAF9fDBZAFmN+sVuSHPwLs/V+x9WS9ugZXetpBckSMTWkstt6TxQgNWi0/SxUKR5PwQomo+09+K+8Dsqa2KP5fCT87y73bM8uOM0t41MvGI/QCf+UkPe5Ngep0J+CpqltzIvYLAGExdoppuiARI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YmvkoWdQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hSENqZ2r; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YmvkoWdQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="hSENqZ2r"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO5uSx31165755;
	Mon, 24 Nov 2025 10:20:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=tt33ASGIgl2qFmkm
	tkpnQhRea+7h7LL1m9JqKWD0NG4=; b=YmvkoWdQJzCTLWVm6GybconhgvX1SaU/
	Y9dYbJk7b5zYkgS+uvk8+vDZOOXdUmn2jWw1PCxdH/0wCmQ1+kPhn07/gW7e8uND
	NKzn4rVmAYnRsobRbM3++DYkfJZfNXqqB8nbMhk+RdT6NUaf4Ml0B23FN7KSRkWv
	AtZgR9aO1JLpaiQShY1pBOsf3zMO7NDfuo4KpvmwHTvvFK/wRwfnh6BpoOOZtkKh
	AHScozKT56Xc9lC8XpB/UoR0y4S29OfaxiTg5kvrldS2gkRdWH2he++Bljh9aVpY
	Gf0RwKdkUcN0ImkQzruiu0baz7nYCiGpmI3j25ey53/slVqfHN+xJg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020122.outbound.protection.outlook.com [52.101.85.122])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4akbf19x1d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Nov 2025 10:20:25 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5vhyeIfUSoaumfcGkrIL3JgsY+D/kqEceW8SIBoUWncR97+x9d8u0d51sgF/EI0+y5TWv0GHH0kSGefFyAZnJncqagbZdDzKNz7iCSnamR2e4UoMwQhJnOtD/0qEr2iArZfucoCI1xAKhgTuce7grTDocyCc1ktM9ZwyLaW8479xj8ABoOoiDKCT2KQzKatlrls+irY7P/FdmVR2ME+nA2uoXDr00tPS1DPo/ZH1ob/FoUOPLIYpYMHYlVJSZuUVk6ULa9u6eP5B6uX/R6pmUcrJ8w6GQUAcTXU6g2B6SmFzXqLhzm4nz7i0RI6JoHq3okgGG5AZ9qxh9d1NqgEvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt33ASGIgl2qFmkmtkpnQhRea+7h7LL1m9JqKWD0NG4=;
 b=uXLQArhpO2cx5odpPf0GTs4IidDfMdvJRgYxjz5SrxLPVIrJJu44M76ayW+rgAra3PlIMQX6TGxcroy8YXEJEwnNdTz0G2Gs4mOCmIK8Pa94AT7Q5diLuoYgfaZJw2aBMfLTDJRojIEXPHGqqCKGw4BbhRIEm5iRj+nHDQON2peH0kpwbE5i9oexslMN1YNtzKBdkW8bMvrXzTsTJ8njXgnHt/5Y8yA0cBsA3HL39FSVzSlnK8gDDp3BNkVH8JeL0jkGGq7zYYVNohODVSHMwzlHaKEJnIM0E0/KxUJNQbH8lYseoi9Ydpbf/t+FUInBcsAFhei2Lg2UbT86euuZxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt33ASGIgl2qFmkmtkpnQhRea+7h7LL1m9JqKWD0NG4=;
 b=hSENqZ2r5ERsxZIKfOY9tlKGImlfdDezaunXsMyvBE8A46dZekYOJH3DuS5qzGjtyBjF1sqwxLyod79NS8Uyfad1awaNTnsIl/0sdCe9RF/Xwqf34b4fu94OBn/2viO6VDk3JuYBQmK38kMGWybjebkrRFAnSjk2BQNze/EH3/Y=
Received: from SJ0PR05CA0126.namprd05.prod.outlook.com (2603:10b6:a03:33d::11)
 by CY8PR19MB6988.namprd19.prod.outlook.com (2603:10b6:930:5b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Mon, 24 Nov
 2025 16:20:20 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::5d) by SJ0PR05CA0126.outlook.office365.com
 (2603:10b6:a03:33d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.9 via Frontend Transport; Mon,
 24 Nov 2025 16:20:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Mon, 24 Nov 2025 16:20:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D1EE8406540;
	Mon, 24 Nov 2025 16:20:16 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C45E0820247;
	Mon, 24 Nov 2025 16:20:16 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs-amp-lib: Remove redundant calls to kunit_deactivate_static_stub()
Date: Mon, 24 Nov 2025 16:20:16 +0000
Message-ID: <20251124162016.30446-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|CY8PR19MB6988:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2d79a2f9-2f8f-42bc-88ca-08de2b755be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Todkwt3tZUyoRw0zKg/wV9UZtlzz51cQtShbhpGCjdlAFHwYOunpl36Ahh5h?=
 =?us-ascii?Q?1puNUhS+iahYtewWaxdHhUlkS7cVV6tScahUlWBPADLilyhUQAeC5ogalt7B?=
 =?us-ascii?Q?NXOFeM2fu5+y7Z4gvY3RjkdZAPB6TIMnmSf5GQ54NT56CYWHCwYhVA+Vjq+N?=
 =?us-ascii?Q?dXwxgSiLiuPSQiou0tHevZU2yeTBBzx96iZpgQqrieOKReQHPb1XchM+yJnz?=
 =?us-ascii?Q?xrGGRJ3o2MAmbGQ5G34k6VlRh2BSRYSyLkDv8g0RyKTquo8ZNwcoXwNcGg/G?=
 =?us-ascii?Q?sS2Z5bbaJ16SNYORvwLs9pJ1x76eQgYy6/uNg1yIFqy8nbXs77i3uthi2+ip?=
 =?us-ascii?Q?HnapKh3B2BWNvSUzzfnJX1a25EbSVbh4ZyPzzAaRCUsPX2ayIqZEXLU03m8y?=
 =?us-ascii?Q?ODNOVutYpU//ec6yB+5xomoWn8RqmfcIY1a16M+aceKNQ5+T+P6x0FCvDmXj?=
 =?us-ascii?Q?5o3/QYfqn7IvWmT5mY6guetZsaIUUWFROnQ8SIoaIsvARAyualJ6g1f309bQ?=
 =?us-ascii?Q?AQ+/f/SSqpJF3aDtZoqq43hffiZBF2k1i9KR7bzSIA6/TMRwRoOQfh0EZ9yM?=
 =?us-ascii?Q?KJ/9hA2FUsEf2/jOGIxt6YZ2FuJRh6OdD6d4RKKC7ssktePBMgrn2wrg5MzS?=
 =?us-ascii?Q?XZUZYQFOx0igdFozSmun9LdOaYoq2IegLs+Ph1ersAbrGTiCZJPbRvG4b4Pc?=
 =?us-ascii?Q?RnpTUq+f/7Ca9hX2ESwPFvrdCb8+BszlweCS+gQGCcB7DZ2Rh1lm0QrvirtG?=
 =?us-ascii?Q?8y/2NQIMQJqtG02jAr1ik8+Ap4DyH1h/O4OUOjlSQ6xoJumJ4ad0QPUTn9TV?=
 =?us-ascii?Q?waXpROFR2KznmDkGLliZzznvVTcRSHVvOZc6Wrw/V7Nyc2bBpZEWNShCwRpQ?=
 =?us-ascii?Q?aEIqkD8oHPrbLIhpaM7Gol7aH1+lHJh6MkYe1MNWp9uEyMU3OFm8WVWQVyT1?=
 =?us-ascii?Q?+ZGSTiSTpb/mh/WYUXU8C6OEjOhwIu9XHD3scaNfY1JtZCtgBwQmgDAnIp80?=
 =?us-ascii?Q?hDkMnDuh6q+hgbBDh/Otac1T2r/ssLUupfoOqxc58hgtfQF8Wx3T+P3018Vk?=
 =?us-ascii?Q?QlkQpMS0TLEmsEmeQ4/RiTpl49hVuIrBkAWO6rPqtHe/p886e+sv/KLspMWt?=
 =?us-ascii?Q?WEvdVnc+mRqn+M8ckemYwpNVJ8lj5hGSV4E4abm2v5CY2o/bwBnpw6bVMWtc?=
 =?us-ascii?Q?6tT7XcBaP26EH/JRH5m0ik6HpRoAvEDotms8rDrznZuHTVXuf7aLIQyfujOd?=
 =?us-ascii?Q?NE/E9lAn9zYnDVoet68wFmYn+tcTT6TJjh1DdyWBac9KIQK5EB3I8aQkbRRj?=
 =?us-ascii?Q?VTN66CpJ7XvJ/87yitw2rK9OENz2AmuYCdpwpWpA0WKcjsCJcPwcfolY8yUq?=
 =?us-ascii?Q?RzoGq9Acf4CCRqFhtVWp15RmxJJ27+UwpDF8dY2KiDboHYepijglcwOz1aoT?=
 =?us-ascii?Q?dkua+gsRRTJVcBEpVEno0PXEdQyh/4NbexO3HL1ABieHzKJh/+wKs4X2dQH5?=
 =?us-ascii?Q?K8qCn+SyQJzYJ8SaXxrfWd/1Tfm/jad2xasvsrWizCPBmdgxnLCiGDRdbh75?=
 =?us-ascii?Q?d774tUsEBxX+TOheOZY=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 16:20:18.2455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d79a2f9-2f8f-42bc-88ca-08de2b755be0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB6988
X-Authority-Analysis: v=2.4 cv=caHfb3DM c=1 sm=1 tr=0 ts=692485c9 cx=c_pps
 a=Qdo7Ea4lwGWRD8/XiwST5A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=qIIXkBD2pGuPoumT3-wA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDE0MyBTYWx0ZWRfX76VMwxsz6WXw
 L83eWRJxXf0YOPvSvwGFdeikQ8i0XUiQbA8FI8y981zClmied6czHosPLcWVM0afv0dWd8bx5OY
 m+bpNEZfrmpUuv8qPJ6PonFYl1p3Em//GTJ5v8PSJCWjrnYfhnzKdtd5w59S8aQQNlWxOnkxhKe
 kIN/1w+8m0JB3GR5d7ZaPyk2lmv3BSnG/JWXgq8qJQaV/3jberu53g5Kmpi0Iuq9bBqS8hySj3J
 qeVmVn2U5/MRBjO+xSfRpr9Ve/6tzFSmTgdWW3j+sz5VPpQ3koaTIDxHHb4YC0aDxS74mOa5OUS
 j6mKZY7CvhINZdWh2tK06fT0t2QRSL+07gz9fT55h3fK9HthpmBT2L16JSNfKnJ2/66sYJ7K18F
 L9HAkl0sgp43KBJGrVto+Jycph6rgA==
X-Proofpoint-GUID: 5mXKhteB7QePQ7QiWCVKCmLROmc--Uzd
X-Proofpoint-ORIG-GUID: 5mXKhteB7QePQ7QiWCVKCmLROmc--Uzd
X-Proofpoint-Spam-Reason: safe

KUnit automatically deactivates stubs when a test case exits, so there
is no need to explicitly call kunit_deactivate_static_stub() in every
test function.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs-amp-lib-test.c | 31 ------------------------------
 1 file changed, 31 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib-test.c b/sound/soc/codecs/cs-amp-lib-test.c
index 7fa6aabc746a..923f1857e45b 100644
--- a/sound/soc/codecs/cs-amp-lib-test.c
+++ b/sound/soc/codecs/cs-amp-lib-test.c
@@ -145,8 +145,6 @@ static void cs_amp_lib_test_cal_data_too_short_test(struct kunit *test)
 
 	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, 0, 0, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -EOVERFLOW);
-
-	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
 }
 
 /* Redirected get_efi_variable to simulate that the count is larger than the file */
@@ -189,8 +187,6 @@ static void cs_amp_lib_test_cal_count_too_big_test(struct kunit *test)
 
 	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, 0, 0, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -EOVERFLOW);
-
-	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
 }
 
 /* Redirected get_efi_variable to simulate that the variable not found */
@@ -217,8 +213,6 @@ static void cs_amp_lib_test_no_cal_data_test(struct kunit *test)
 
 	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, 0, 0, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
-
-	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
 }
 
 /* Redirected get_efi_variable to simulate reading a cal data blob */
@@ -383,8 +377,6 @@ static void cs_amp_lib_test_get_efi_cal_by_uid_test(struct kunit *test)
 	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, target_uid, -1, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
-	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
-
 	KUNIT_EXPECT_EQ(test, result_data.calTarget[0], target_uid & 0xFFFFFFFFULL);
 	KUNIT_EXPECT_EQ(test, result_data.calTarget[1], target_uid >> 32);
 	KUNIT_EXPECT_EQ(test, result_data.calTime[0],
@@ -418,8 +410,6 @@ static void cs_amp_lib_test_get_efi_cal_by_index_unchecked_test(struct kunit *te
 					      param->amp_index, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
-	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
-
 	KUNIT_EXPECT_EQ(test, result_data.calTime[0],
 			      priv->cal_blob->data[param->amp_index].calTime[0]);
 	KUNIT_EXPECT_EQ(test, result_data.calTime[1],
@@ -453,8 +443,6 @@ static void cs_amp_lib_test_get_efi_cal_by_index_checked_test(struct kunit *test
 					      param->amp_index, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
-	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
-
 	KUNIT_EXPECT_EQ(test, result_data.calTime[0],
 			      priv->cal_blob->data[param->amp_index].calTime[0]);
 	KUNIT_EXPECT_EQ(test, result_data.calTime[1],
@@ -491,8 +479,6 @@ static void cs_amp_lib_test_get_efi_cal_by_index_uid_mismatch_test(struct kunit
 	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, target_uid,
 					      param->amp_index, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
-
-	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
 }
 
 /*
@@ -524,8 +510,6 @@ static void cs_amp_lib_test_get_efi_cal_by_index_fallback_test(struct kunit *tes
 					      param->amp_index, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
-	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
-
 	KUNIT_EXPECT_EQ(test, result_data.calTime[0],
 			      priv->cal_blob->data[param->amp_index].calTime[0]);
 	KUNIT_EXPECT_EQ(test, result_data.calTime[1],
@@ -565,8 +549,6 @@ static void cs_amp_lib_test_get_efi_cal_uid_not_found_noindex_test(struct kunit
 	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, bad_target_uid, -1,
 					      &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
-
-	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
 }
 
 /*
@@ -596,8 +578,6 @@ static void cs_amp_lib_test_get_efi_cal_uid_not_found_index_not_found_test(struc
 	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, bad_target_uid, 99,
 					      &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
-
-	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
 }
 
 /*
@@ -619,8 +599,6 @@ static void cs_amp_lib_test_get_efi_cal_no_uid_index_not_found_test(struct kunit
 
 	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, 0, 99, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
-
-	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
 }
 
 /* If neither the target UID or the index is given the result should be -ENOENT. */
@@ -639,8 +617,6 @@ static void cs_amp_lib_test_get_efi_cal_no_uid_no_index_test(struct kunit *test)
 
 	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, 0, -1, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
-
-	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
 }
 
 /*
@@ -668,8 +644,6 @@ static void cs_amp_lib_test_get_efi_cal_zero_not_matched_test(struct kunit *test
 
 	ret = cs_amp_get_efi_calibration_data(&priv->amp_dev->dev, 0, -1, &result_data);
 	KUNIT_EXPECT_EQ(test, ret, -ENOENT);
-
-	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
 }
 
 /*
@@ -711,8 +685,6 @@ static void cs_amp_lib_test_get_efi_cal_empty_entry_test(struct kunit *test)
 							0, 2,
 							&result_data),
 			-ENOENT);
-
-	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
 }
 
 static const struct cirrus_amp_cal_controls cs_amp_lib_test_calibration_controls = {
@@ -768,9 +740,6 @@ static void cs_amp_lib_test_write_cal_data_test(struct kunit *test)
 
 	ret = cs_amp_write_cal_coeffs(dsp, &cs_amp_lib_test_calibration_controls, &data);
 	KUNIT_EXPECT_EQ(test, ret, 0);
-
-	kunit_deactivate_static_stub(test, cs_amp_test_hooks->write_cal_coeff);
-
 	KUNIT_EXPECT_EQ(test, list_count_nodes(&priv->ctl_write_list), 4);
 
 	/* Checksum control must be written last */
-- 
2.47.3

