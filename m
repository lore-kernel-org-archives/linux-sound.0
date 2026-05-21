Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F67E3D092E;
	Thu, 21 May 2026 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366328; cv=fail; b=OOml0WD3K5fLt3olFlQrNYnhbyQpT7sbNrR5jZQ8MW+FCbf38OpkhKhNa2X+lHJnyHRV/5s73HnT7TvPlZTtRwz7FcDX0j7Dpx2+3IIATEHx/r02N7NMaiYJh56OOyGEo8UGHbi2PvO/UipMP05KdOIrRqfbo7p0S4FuNLtmmB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366328; c=relaxed/simple;
	bh=p9xvYzFDhZdJUx28rA7o0eJhWZ/yMxKw0KNXu2O/LUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Uu0eIdTYUy+efS2BeCBmIvunyg3ZlXBYHzgC53DqUoT4gB9INhl0dmC7+U88EBN1acdmPWhH5aSwxkHMMS4EtnhlCO56fxJh4Cs8noKwNSBbEIjupw27J9fyBVCUdxwb0zLlTFUSNXdJwVMH8wNqhPNw8tgQbsggZ+6ORGdHmB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GNYhUUEx; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=K7cPdF4/; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GNYhUUEx";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="K7cPdF4/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L4RFuN2630929;
	Thu, 21 May 2026 07:25:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=WjgsqMK7G8medb5S
	UMeeQ+WO8SrWRiVSQnIwra4rMrY=; b=GNYhUUExnXjr0PmgE2jV6XfQRtDbxYQR
	SydG+xgdMR6g0Qhtc+2pt5pMzV8X6CiK+Dz4AqltxjFV2LMDfIML1c3HwECDIixX
	c0hFGizGsMzoZAz3IrfbjRVAEcIXZ80W4znbjAOu/CwO55O4F3448ORHz23DTA4a
	3JE8ynBlduBJGda9+ZSanCmpUrhHTO3tiZ1NCaGd72tynS7LbIivwuIHfFrorWPy
	zUyDpmZm9wAPMCHaPiIHBRsviT6KdTx5B66bqf0gcH4WRE+uZZWPDT5V6h3PSBqq
	UWbS9qXdy/Nil2yA7rkATsCzoa3Pyhc0/sdPmrNSNq98tFax8WHs+g==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022115.outbound.protection.outlook.com [40.107.200.115])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e93xcjern-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 07:25:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coQjpqlZdq72Uo724wZkHZvsmZeuq8GYPSnkX9wZp57Be04jpTaMui56Nx1eFPnSY3uxXC6peVHglFOkPi083ZFdo0OmkvuQhvw3bKfTyb+L2bJmcOY1Ot9XLlrVwX/nwj8/y9IXcjUlMMORuzkfzS0wy9hYd+alcYIpRP7mWzkEZGbT2ltcNifwxi878ZT0XabIRyI2PlYweoQw25lpQP+86xKhzIEb229WgmNLG229BqwyKMSeUUvb58jwziHF/qT8NoLg+T4Wbz8P1kDjAQBU/ci9aGAOovC4E6qmyQqp3oZBET4pBX8x6MBFeUGG9PYHCb5HFroFvy20+FxcVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjgsqMK7G8medb5SUMeeQ+WO8SrWRiVSQnIwra4rMrY=;
 b=Vs8ufDMEu44CVuwkoNCyZkkMgszm8+L5Gre7Ouoj1ctSvLiaOqPr9bsIFve9t2Qm54c3KY8NyKd2qL5jXQlr9tpNSt+3uqzDq4EunQ/SCXJKslcVlQuLId76ooKwXRPHFTXYqeGkenB9RsJZjPYtWnp6Z7wSEHO9RZrYDPLLpBwLV50ss8HoJZ2TSjqJ0lyboOe1icF3f/CoiwUOTBNx2J3TUz5XUvkWmzP/fTbKchpdM+TeHsb7cOuv8AtI5Q3VxZM2o3ntOMHtFl8+YInZQQNM5ZRCwIvhwPshTBh4FPstBGi2WSg74sb8OyuYtXBHSCx+RiebMzbxuwcusfedtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjgsqMK7G8medb5SUMeeQ+WO8SrWRiVSQnIwra4rMrY=;
 b=K7cPdF4/TbhedsgdzwWJpH0FoJ/6qUAo96Lg49nyKAnV5Q39UgrNFOMeLxvgf50ptRFf2OjcUvIq11D1Ko4jAXEKtUE+l5KOEnt1JjkznEnmgcI/4AymGJ0E1BwMKo7hlfs3yihurT2yOKUO9W51vdpmQ+TZ+54kpF4Yjd+XDmw=
Received: from SA1P222CA0165.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::11)
 by SA3PR19MB7566.namprd19.prod.outlook.com (2603:10b6:806:315::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 12:25:14 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:806:3c3:cafe::de) by SA1P222CA0165.outlook.office365.com
 (2603:10b6:806:3c3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 12:25:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 12:25:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 38033406540;
	Thu, 21 May 2026 12:25:12 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1C6A9820244;
	Thu, 21 May 2026 12:25:12 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/3] ASoC: cs-amp-lib: Some bug and typo fixes
Date: Thu, 21 May 2026 13:25:08 +0100
Message-ID: <20260521122511.987322-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|SA3PR19MB7566:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b0f5c3ce-ccc5-4c33-87d2-08deb7340230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|376014|18002099003|16102099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	/BJd0i1Ku2pyUzMgvitU75g5feFwMdmVH5PIf6GXU1mybN6sEsmPc7Qxbef2r14NOTK/8FRfEZOcdXvxrFAUGKluxvNfHTKgvSgHOzHDNNhthsjP71etQREEp6nSdraCTclnZbDhWxiVZ2WgXnPdANSTbtmcA3UGS/foAcd5CqG087S7ZuKBP/mmK4kRA3ZuJI5JxhM5+m/nb/PH13awu28rPBaf6TGlGxYBphOA3nO8HIXP99imTUkj0kXO9WHFtKluCYjsXAfz2I9Rg/Nnlu8ITHfCszseync0EHqXJ+RAqVhbFTTzhl+8UuT4sUH8Owf4fXMXOC9jlnsUH6mFH+EJjwjbC6+T4TD14jOeTT50jfSBF5RW58Oye8FC3V21dPXGd53C9mEIA1lsyD9VpOviCoky84BguZoTAyP6gE0eneEWAWy9daZ2xaJ72z16vT6OE0vqiTPRMUaEcVyRMKy39D5QloCcrVCdN957H2UeXgkOHpxMJ3T3kpdZakzenLfyrEQ1BvEKIoREA6tD3AUkATYI7KPewapv4Weyo3AW1zHiq9viCMOpxyg3L10p++94dBrXwmyssMhW4KK3Qq2q6XefQK8IFLSLGdm2z9L94+OsPAYVSFqKLVDfcFCJET66lDX+Pq4L0eMZsCogvMqPIwg1RfvcDHhZgu80DfBW+FVLd7Y7/c0nmlBz0KSUT6PPtbnyWgoolo5lPYMuYCnEtguytsbz5E3JP3uWAlg=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(376014)(18002099003)(16102099003)(56012099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k9zdTbUItGSBPhxRci9sxYzSssu93cGFzksB3p9ZMfvyYB25kYHaoCWQQcSuZwFcNivjnyVmfKNV0qPblKRmvVmGQhNaSdBFn+Zlziot6vsG6oOfFHnXe2rWyWcom0Hk8+aZ0fTrL8X6tm8VBxWN4dd3Q+0wsAFNXEfBuKHbDHZ2pNe41N9+uXkdzCDfVxdVoAeLgyH0VS00uonP11PKw25Pqj+pBMxYZeQXuEncYH7fNxZWUtMAd5HNwEvlz8Op4nU/jd4wrC2/Ap/4LztUntMguPVQRj4sn5UPwUsXtPI5nuA81KdKQtuGVl4hAmKy0xyxuI1TsaPXWhTLe3yLPI3jCtE59y0fqPL8BGYsHgHbMajvJrwun44Hv46eZ52YlFB2ACoxiz8ivoDlIsNH2mmChxzpl2jWSndv/BbxcdR7yhJQY0Mml25ftyFCCxe7
X-Exchange-RoutingPolicyChecked:
	TcI/jnkI5f1os+Rmc7+GQxjKKWyCRlWbzKVeHArX1tQUygYCC1v/30GrQqh1dG2HIWK8L1Aeh5G3xC24zozFWZbeCanE6Dfhc4Y1cUmqpCoeR1cpTob+xyUo+PYZOFaw3UGAbI6f2gsHAMULVV6BhvoAPfWbUY5yPMj0rNcMjhGn1rkOgE60Wm2OnEEGoBjmnqxVdFZlz+Xq5j8QSzGfaykrrBlhFobW3n/o095C4G9WTU4CRBk89qMXJwyAt54/pi1n+7/p36XrA3e8pN9XdgUDch6sP5xfGtwa4KtjrqswpiPGy96aCHVMnExuLsm3dosYLqKBfDrjhIITbe64Dw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 12:25:13.3328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f5c3ce-ccc5-4c33-87d2-08deb7340230
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB7566
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyNCBTYWx0ZWRfX7me+UX6f5GJ8
 itDvRU7u4TVcFtlknyMuPdqcAo/C5Ak8sJ74L5ZKI93kcGspJpPOxrFdR6rzsI6kw+cv5J2dA49
 cuJiFRfNH1s0u5MoMLc149jkXXPT5o0UkHWgCuIZ60QtNzpfEilcWdUEEew0uxAtL4qbJJehfxy
 4v95buaiXD0zo6K19o1h5b8FjyWjPxRw38o5+Sxa9td9UDY7+yd2ZCtjU3DrCK048A7qcBUQkRl
 yThYbjCe70vTbwHUk7V8dvS08hZWMDj57ftiTEmWlKFWl2W7brz1BJHT+CjAlf5Gczzrd4XksiC
 8kvV8N792E1pezenruwbndfo3wnbCdg9x/Hh8UZfyLIAYvMzUgSGi3JERGPQp/oTGW/S8HEtR/P
 qCSl5F7o4CyYh3EV5l/1nWBcS7A0xypvrcGzm640YSxBmsaqOKnlYRWe0iMxT+usgHt9r8C8+Fd
 BJSFnQXNkdnJgSmcBew==
X-Proofpoint-GUID: z3cW-XFsptUvDU2nbm2z0WVbeYzVJPcR
X-Authority-Analysis: v=2.4 cv=Wrgb99fv c=1 sm=1 tr=0 ts=6a0ef9b1 cx=c_pps
 a=EqAiCf1m88PzzVX9eph31A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=e2FTfeWhYRdWFs8-4cQA:9
X-Proofpoint-ORIG-GUID: z3cW-XFsptUvDU2nbm2z0WVbeYzVJPcR
X-Proofpoint-Spam-Reason: safe

This series fixes bugs and a typo in cs-amp-lib.

Richard Fitzgerald (3):
  ASoC: cs-amp-lib: Fix wrong sizeof() in
    _cs_amp_set_efi_calibration_data()
  ASoC: cs-amp-lib: Fix missing dput() after debugfs_lookup()
  ASoC: cs-amp-lib: Fix typo in error message: write -> read

 sound/soc/codecs/cs-amp-lib.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

-- 
2.47.3

