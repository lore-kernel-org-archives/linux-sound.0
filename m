Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB343B0AED
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641152; cv=fail; b=R8t0cY0O7DEC+ejG7++yjspDu3pthVvREmkOH9ouWynRX7Xsa4TpfYkKhafMe8YXESkBRJqcLOf9XcQzA87t/CXZSVq98CkS23R8HAz8mFeTsMv3K7rL54KncLXeVP+doqKzHXIcRAPrqSzzntvNBoBsfadLovcBAgWdRClSD3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641152; c=relaxed/simple;
	bh=FT0uZ62LgITzEhE9lIzc76JkyVr2JUGa6vppAltxtkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R/MzJx4I+hgWHbAN0n//6xSkc8o/ouketEZpBfm+T18UterMQ45m1DcSYqguDXsi1ynMWIDsun4bMgaZuuX8AZPQPxWSZp2DY1yr5Cs7a5VV1wKJpVaV9lOV/xD1le4KKGWO3DblO1toZekY/aCbXbdSoyNGi9fJURJi1G4YTw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LxOjPN5V; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cYFhPTIT; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LxOjPN5V";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cYFhPTIT"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385rOJj904177;
	Wed, 8 Apr 2026 04:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=gXIfapO3MDwxLSDInPECIrdcMsJ0LVWHPK4wqarXFAM=; b=
	LxOjPN5VByWW41wS2FSYRwvFQZsG3RgC4vPO2jVkFey9nT+4yS4h/r3s0v0/+hji
	3ZayQU/Y3tTvcq5VG3foq5KH7OMSvq8ncO/T0hApdd9nDZeZO5IBeY9oCTd55Jeo
	5b5RPG39JknITfnS7T4GsMNwUiTibOR207bFAmVbZRtO2dF9s29qCxqH2vyqFpzg
	UjKBuB9VZOHJmq0NaNOWNmO7OuZd62uAWs/a3EScyWQSVKVeMS2Fdu9QdvTQ97hn
	mWXyXpPTGCcHztWDh6llr7IK3krdgZHt9aNcuKwToSoFWWQZ3P6W6g3QjESp7XJx
	g5s7+C6DqePFRc1iOtWJUw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021126.outbound.protection.outlook.com [40.107.208.126])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dcmr4t31v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 04:38:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vc0+d7UdRYRNrQCg70Vk7M5W8qJQLbrJMQpTjYcjs5BxWsosEm1UPCJunMPXrqzUgRlsQwh7lJyIXcCkdbIR16Z2bzn0Y/AwsLpXHPRNME+VvhDmna0yXc8Vk5zsEYZ6TfLmvX61cAGA8litC14AAYm5A+vbMWgThDjOe99Xjvu0QvKBC97SToxcsYTxgRinSAHGk+6W2G3McTZ7dKAhxBS8fBTxcGbgEu/1LpaWg04tONlUxakzrh6at3out54FbW2+4P1tQYkPbEDsuIzQLaRmRs4F9NXt7Mo1mRH9sh0M2D2jCE6E4uhjsufwHfSX7WM2N6k9uo/5VRDilRG0wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXIfapO3MDwxLSDInPECIrdcMsJ0LVWHPK4wqarXFAM=;
 b=e9WaIiQAJ4zoTbIFccQ+IWGDLgxTKmUCaCuxm5XH5FFf/C/Fii7nmeN1ezmRQKi9eJAFzFs4WOe4bX/1+73x+MHLb/WoAYxb4t96NPrENXN4haHiOnu2psWQvUTIAG6jLd5rG77U1j+O+XNtf5hlwfINvu6N68jkx8zXfawBCLckRHl1urWjqdnjxur5CkS7sH9/QTjZj7cwU9VweJjzbUSbMzyoD3mGapqNSlq1ik0ce0W8fBaNxa1ywq9QeYtOrQNGnyXZOTPFdMiGLEBtjcmqLDvhc0U6gYkPPf7gWqq4cr5ftI/Ci61gw5EOGoWz8bW0xa0qYRq3CRXfMFWGjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXIfapO3MDwxLSDInPECIrdcMsJ0LVWHPK4wqarXFAM=;
 b=cYFhPTITzzqxnqwPHH8S89eeL83cR3FzXAh23ahk6uYKQ7GPzJKdN/gyEYT09N99ePQQj/ihS+VhTPDg+dwKZ7Jjaugqi4BYRIxqQv473sQy1ACJjCK1rN21tqZx1DkZTnVIyNXquLyBKMdf9NusIvsWdjiHD5QO9EqWk5QWka0=
Received: from DM6PR03CA0096.namprd03.prod.outlook.com (2603:10b6:5:333::29)
 by DM6PR19MB4232.namprd19.prod.outlook.com (2603:10b6:5:2b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 09:38:41 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:333:cafe::5d) by DM6PR03CA0096.outlook.office365.com
 (2603:10b6:5:333::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Wed,
 8 Apr 2026 09:38:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 8 Apr 2026 09:38:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C5D1E40654F;
	Wed,  8 Apr 2026 09:38:39 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ADF2F822543;
	Wed,  8 Apr 2026 09:38:39 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 5/5] ASoC: SDCA: Tidy up irq_enable_flags()/sdca_irq_disable()
Date: Wed,  8 Apr 2026 10:38:35 +0100
Message-ID: <20260408093835.2881486-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408093835.2881486-1-ckeepax@opensource.cirrus.com>
References: <20260408093835.2881486-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|DM6PR19MB4232:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 19c18643-67cb-4581-f8ca-08de95529e7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|22082099003|18002099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	PfI5GVj8g30il5MuK0+6NaTGbxJIypkQvwr1Dc0tknTq17Ek/J3zM+KKtfARIjGUfDpp//oKLgNt6LnZGw+g2xsdJaZE5HLE7UXdDLTw+J3UxBLqVvF4vQ+I0O3SKaqEB0bDO1ULsCG6YTWYL0TjGZm7zdIAGNMg4BOk+96ZAeM/Hr4BELO+kWY4+RxKxEYRVHS8jHq9PXpKtmgoloJj303Xk5O/t87jgVK7j7dwkC+VtfGt81KxukNx6CZQAQkEqWnd5nFXmCjlG5NJ4ImQt54AvGJdpBS7s5aGtrybSZhChouI7QB/Ykkq3ohLdQlHtyOWm4abx5L22DrJG6F8sk19eg0OgXrJXlgtz86q1y5Hlc8kOgjnu1a3Z0leUw9m3L/xTdlc6UbbayIMecHMy/RbJEpdyYBC6ABycgJ8cHFctyyliARC0TDdMeaCB9eoghiXjvRLdJqzlOD3bjD/kb14JZKu2wjtm5MukEesqrQt5s00BTAquW6A+FhVAYHL1SgkeFVtz/dkC+K/zBpoD5kYg0xt51rVi6cPvhl1SWu3D6cnZfmmhTsp3acs8b2no+H4pRxG60rC1dORfTAtjtrg2vvTnvPu1ogGEvlGUTfqtaZ+3d1qHdk+C0lpZaSY9E2IWDJ+sqdsaYIatM0FsvH+mVTkqkFRrZXU33SHTei/IrqkC6V/z8O80AVyFrmc1xTMkFiVSLSTWnZ7fXy6sdolB05ptcqjqXJuJYQ0lKcOpdmhtKIURAvQMkmjujsP9Tz/ODLmV+OQlL4cW8Z7sA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(22082099003)(18002099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DUY6vpo5ih3BoIQGWWguS8Vvz9T2LL/UTyWfeDEzdHg0kGFzC3ewolFMQ63rEMl7Hkwqgih27ut+Mo0ZR0pFvcjW0vfijs7JjER2hiTQmiWgdRD707xVArdD4dIDr45VFvyFDx+NtgWP90kaFh3kjrOnB+2Fb0u+MwEbNgE66aqy0ro30YrkIfSOlZsNavQtI6UEQbxTkmt0kcXu/i439W4Huei0CgvYFe/Zf9C8tLVOPY3dG1GhDtVCIwHbxTHlyZlip1LM5OjuhywrnBkiwUSIW0wWW+ir5lxeaGNQC1fDu2G0zQjN2jQAJb3n5EkjOGfQQvEV3SpynpJKHoSoitvlp+CqBYpMjey+I9Iioi0su3pXAwmBlWO3kiA6oVzY1GXfStMsOYCFqwrUfXT+u/rgcUpzdmbzw/yk+CNPxLaUBW38UvuLRlKOMBjFnA1Y
X-Exchange-RoutingPolicyChecked:
	k6JLw6/U4F8tt2yll3tbUZmmC+w6m8n58IXc/HVmwMM4xm+QjF20ktu86uAXP2HsSF4sw6JUwMbTnRjgf1xoBHkpFrQApTQ6iAb43/wMd1+8n9iGDt1aiGngcHJa0GW3kuu+/68odp2IYcBANIomJyEhKntOcSRAAeW+S/GXCPZVVITm857n3LiTwB4nBOPaOJmaLJ+ppwDdqmXyrV2peq42kXius5mGnJS7NV8JsWDvtYbkG3obdeVScdS2eP93v4LCIG/y20TzC5JHiNu1hxmA2sV+ls47JSN47GBJnJnP7MrYQ6xz/EDssIu82twMmvf2WrmA588J9gUq0Ajetg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 09:38:40.9453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c18643-67cb-4581-f8ca-08de95529e7f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4232
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=69d62225 cx=c_pps
 a=cnhvvNhNoe9VuZBm3HgdeA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=yF3iOZm52z5FeNqd6rMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NyBTYWx0ZWRfX6gu1giVJKaNk
 mUFY8h66B+EPBtK2LPu8xcwSOnjxpUqdk+FZu7qtDphDTstz8fL6jepr98dGxRj5BtAb8TMdOCL
 k2Ld8jfNN79U3E7kO+5SC6j2f/2A1ho1/5JxW/nrFlmGWgkFctlYM6btpskr4VMOOgUK5FvPuwV
 7R9sCnczbd9kFAFWiRCar1PtyG3sL/0uUFzTaj6U3mutz+N6IBXG421LIkBTAp3EXdu9/75z7oo
 jhPCY1bCcZDbKqBwcv0KCqSndTOtz+nmNgRKkOA5CcjZht2C2IxFtWkELUeCFlUq2Otdi0de+Xf
 ELXjP+2VuWhvn/rZxS5aFcNxgGFRd2zN57jZOhme1XCejjnaYt9U7zDBSks+IfMNxWTnLDqwODy
 L+T8U/QP1dd0R5YXtaTkfgEgkTAUMGkswRY8BVn2axPktVyWf/i3zkly98Tv1TVTYEdb3XNnYEE
 5JzWzQXDESo/8TXHscA==
X-Proofpoint-GUID: pf-5RAOnlnj54o4Pw9xgJL-pEue2NM2m
X-Proofpoint-ORIG-GUID: pf-5RAOnlnj54o4Pw9xgJL-pEue2NM2m
X-Proofpoint-Spam-Reason: safe

In irq_enable_flags() and sdca_irq_disable() there is a NULL
check on the interrupt data pointer, however this is just pulled
from an array so can never be NULL. This was likely left over
from an earlier version that looked up the data in a different
way. Replace the check with checking for the IRQ itself being
non-zero.

Whilst here also drop the sdca_interrupt structure down into
the loop within the function to better match the style of the
rest of the code in this file.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_interrupts.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 5cdabf8ae9da3..279926e1d4c1c 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -630,13 +630,12 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_allocate, "SND_SOC_SDCA");
 static void irq_enable_flags(struct sdca_function_data *function,
 			     struct sdca_interrupt_info *info, bool early)
 {
-	struct sdca_interrupt *interrupt;
 	int i;
 
 	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
-		interrupt = &info->irqs[i];
+		struct sdca_interrupt *interrupt = &info->irqs[i];
 
-		if (!interrupt || interrupt->function != function)
+		if (!interrupt->irq || interrupt->function != function)
 			continue;
 
 		switch (SDCA_CTL_TYPE(interrupt->entity->type,
@@ -689,13 +688,12 @@ EXPORT_SYMBOL_NS_GPL(sdca_irq_enable, "SND_SOC_SDCA");
 void sdca_irq_disable(struct sdca_function_data *function,
 		      struct sdca_interrupt_info *info)
 {
-	struct sdca_interrupt *interrupt;
 	int i;
 
 	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
-		interrupt = &info->irqs[i];
+		struct sdca_interrupt *interrupt = &info->irqs[i];
 
-		if (!interrupt || interrupt->function != function)
+		if (!interrupt->irq || interrupt->function != function)
 			continue;
 
 		disable_irq(interrupt->irq);
-- 
2.47.3

