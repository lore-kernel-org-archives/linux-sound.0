Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161413D0C16;
	Thu, 21 May 2026 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366324; cv=fail; b=mxJt8Gxtcf5Nh04fIgHobSvMLOFThNbSWrHDbgX+s1HzQh7nvsNiV3fpHWTNjKIsNCX9cpSkUfObkQoNXQtnjU9VLwUisyT8ZRiFp9/4H2hXDT6F97LOgDX2xUYogobFLiD1P2S/b7oJ6fdj+KuNI3llH438fdu/nSdEeJhG6jA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366324; c=relaxed/simple;
	bh=PqPrqFR46mubKR4aqOaT6rkZc95lCR1Bu7nuYgq+u0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=am4z03vk1MU1drTYaiRhOEslBPe2DA0lMPdbGAZE7xIiepJvh/Q9hfUXYAJowBPz6xNLfiQ/La3cr1BHt1wzUnBNhc5Sci4fOk2KRKkBZm2jpn0LmGPE/Vo+SFzej0WAgwNWZkEDeTTD3fHSlHfBU7EmhzpQvJNF3w3MK+99lxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QlfmkgSe; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FjONs2D2; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QlfmkgSe";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FjONs2D2"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L5BlPb2850731;
	Thu, 21 May 2026 07:25:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=4ZtlUJIqT93zKpCFSJTSHGQ6F8Ae+ej8hDswv4ztvbU=; b=
	QlfmkgSeIikjb3089Jzz8FbekM2ndVAxIKQMzm/l6nXH/o3NxcDbd4CrJ4cwCWJr
	bCvWkwFa8Oj9Z8R9GxBoOfFR4Ci2/hgmHGti2dVxkgkBEuvELV7VpZII5Lp/Jqvl
	e+PhH8qL8GxPJn+JlF3K83TpWfF56yhTHQxd3Ahtc7XSYFlb2w1imp6mE5Y7N57X
	rBTNFGwg76mAb00I4ka5D/Txgetx+ZXUcTYFWH3gAOb2OCZghUJT8/4mYpBSSjxa
	xFI7YKmU+V+qiyZijvTB9gtxaPmQnKE+mj/MlDJzlnltP86KgkrbLSOWzvj5yaAX
	cFHxSyZHos0NOZLLfdZbVg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022139.outbound.protection.outlook.com [52.101.53.139])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e93g1jbpt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 07:25:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOlz+s9qFHpa/WT2BAJE3OfZ14jRv3+OOq7Zw1xuN/DcfLfNqtupiuaJgV50thjqqXyuI0A6d8AV4dFyXFgYGTWpsSINxoJdG68EaVjnhY+GEqx5HlDt44b9nUA4cwbmVBdcIFD+YB1G6QRDALo0XIgIsp4jdPj3T91sixb1pKl1iJOGblWp84KhNRII5AC4V3x/y1jrZSgzRH5pG5tv+vOHz24UrGW65+VqYXcauQJh1lUmqRToCRcMPVC1CFmOgI9OsRrJQaAnmiJ09HWxoXJqTJcdB6fGf0PjHr+r9joa5C2dBB0qLQbNkj00/pobf1vKssjgi1M66OJwrS3trg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZtlUJIqT93zKpCFSJTSHGQ6F8Ae+ej8hDswv4ztvbU=;
 b=aMtzPAuuzXAM2IHqzWrDI5ip4p3tVvyvpEnUWIowo0kHxAb5igLTIcQV7+IkNpMlKT49XAV/5Tqf+tZTWbvi4h2GGi29UM+TMeC+wY/n2xS1JnxS3TSWPY8EvLwGSCEKYjMh+3If1uQtQUjBFvZM+yTyl49GfMXFLkh8ifXJf2aEte3S8OniY5PiJ5tCW+9zmmGa6GfSXd8p0uP7TaNl9zU0Z4bBU9jzLIOWObeU6+dM0G5kWqIUDsyNxmiqiCuRZhdYOkvJxCK3zX/3Tahpwhtx9MyaX0PstXLrY0Oy5wm1lLMBJmqMD8HKovtua3ph/EumIkkdlsKkPRBKemhSfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZtlUJIqT93zKpCFSJTSHGQ6F8Ae+ej8hDswv4ztvbU=;
 b=FjONs2D2Ur4+josxY3J2/u99AbY9EP0elpsf+hyF7UJKFq79qzIE/thaddAoP07ACaacybPfnjuZKIceo/v6N61GOWG2QhzrYK5gS163iZyvDHvYpoKCfTu90Dtmef6MI8KbHRC+AWF4TOD7ZK3L/B6suDXDSPO1AX1LnSgwy9A=
Received: from BL1P221CA0039.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::17)
 by EAYPR19MB997318.namprd19.prod.outlook.com (2603:10b6:303:2c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 12:25:14 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:5b5:cafe::2a) by BL1P221CA0039.outlook.office365.com
 (2603:10b6:208:5b5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 12:25:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.0 via
 Frontend Transport; Thu, 21 May 2026 12:25:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4A1DF406550;
	Thu, 21 May 2026 12:25:12 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3925B820244;
	Thu, 21 May 2026 12:25:12 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/3] ASoC: cs-amp-lib: Fix typo in error message: write -> read
Date: Thu, 21 May 2026 13:25:11 +0100
Message-ID: <20260521122511.987322-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521122511.987322-1-rf@opensource.cirrus.com>
References: <20260521122511.987322-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|EAYPR19MB997318:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 55543c4e-97e3-4696-ef1a-08deb7340253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|82310400026|18002099003|16102099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	9b1wRIFPiNMoeC2fAN6C98Ys2tHQBKIPa4GUm7IQGp0pLzgBUC3Xbsk1nI4uuzUd2RPnjgH1um6U+V8X34mTF0VOOQM7gwmRTFUIbziLXO5J/0XOEwJLaOvE95EJEP8qQsbfVqJ/dxjQWIxb+fUYJwBrBKJTVexDxypWa7nBlEg1UfAgpdqjTqb7GGmfMDbBs4xrzGRLqBjtibIutKeaEhqMRsNNLw4DJLR0TUTVTsvmWYHJADzcJYos4TH02bMzUXndngfTPVLECmT/3Tr+3IkBtQGu+Tk4/y9zcUsCGwV3c6+tfEr08vGcKXIf3h9yv2nm03s455hWmTOZ0PYmIal+rINWtBAiBdm0up2tMduvgWsLjEe27gnAkQoKwln7rhml1+uh4mRq0RTP5Yt1N8U4eyvl8fuoHz0wWaKUV3cHi8ZyvqPpOrOTXODfxd6EWxDZMi9Bp0/Q5tSNIFvubt3tSqYR+FN7sQruBjJhNxMtqGTg1FgSOO55iOc8G/QJWnORZshaKcEV1toTXR9VIkF+mUsL4i9LcBVzufe4SrK77K93CejCaaJZP/XAn9jCrBlKXS7gw6mD3geBmtZGUKhgqgJhFx8Cv50HJx/AaI4Om/wSD7zEiKihhJsjldVDhK2ZZO36SogNr7fbW02VkAuh3EGUIkxLb/xhUc3TERDmYR7MLWChm8F6neBfdTdYI58P17/kFsDSvOA1V8lYxviNufNzKNSUeRxT/Ti2cvc=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(82310400026)(18002099003)(16102099003)(22082099003)(56012099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xZS7lxwLVxDxOus+zI3Z+enNxTg48PP4JZ4TlXJkOYpreOmgE0b3iGnwzsl/Z8GWyKFyXyWuGfoeZtVDRy3eox0hPoIU6R22gSCIJYcIHmoVeOif48IXsnTmZtl6zznh3FAHNn9JowEnCR/ibhNGgIZy5kc4vZSs9EGKrgHHO0hkiNRvayfYmlH2emR0aY8T1G357T6JOzhc1bTHiYC6c7o+Ca3GfKj0ed+a0oJRZxcDHZfF77NuS8Sgx5CvL7H41VWNqlPxTQZle3Fo8bq+E/l0C913Qv7nsLyGZTibuL5LLbk3J0U2Vc7DFNDZD2mjvaGywxjDbkTXK9I9gI6wT9xayUoP7Q/h4LsroJdA9zg31/QV8HHUgmRqeDFaVXLE/liIxUcuvkrItdU+EoZ0d//W1I7WIWpQIB2VdyBu3+TePsM12DHPbYd9uO+HaLKC
X-Exchange-RoutingPolicyChecked:
	aB2ikTP+M6lkiIa9P1Vgns7+XUgqf7146URSfmCvhSgMTaKXiQrTMHnTO2uChSafMLnbghCMq9xHcjcY5a9G1rZ/5MFjFtpwrCmF2KWaOb23rd/nmqIuoMzXkzizM7YV4vMQuPqsGoK8UvRfX3xEJJba07F6ggBTZVrRp/ExTf3AysbedsByWEMaY0idCZjQNVvw9RCRWg6J3FZN2W/++26K3lT9HRc5H2sPrnW5G5WK+RDShrpzrx4Oc/ASdMO+CAwcejzKPp2p4HLGcloMrZY7IkiWnJzj2IaD+qvSn8vMWS9NlZh9G00essocf5oRFDpFTGHQ126lKJV64fctPg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 12:25:13.6307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55543c4e-97e3-4696-ef1a-08deb7340253
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR19MB997318
X-Proofpoint-ORIG-GUID: ZRMLG17BHFpzYE08h0vapEeAoMuRFMKJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyNCBTYWx0ZWRfXzIOlvc+whBQ8
 sztXJNOwfp+bdtkfiWI6rNIotYu3HOREDLOS/VfMMxB3YQOD1kN2UKbQIs5YWnEfkW01FwWMNsp
 BPLo3H9EsX9s/BAtsZzCd/S172oCzzSO5A2TO/A/SQ2Iema3fP/bX6d8K2rFOzv4PVk0sPY7Yjl
 Y5VIi1n0FQY4OW/RDhSRUqZCBuJaMe8unGiQOGNjYgM/kg5pyU92U3WgjcotaeyE3jCpGrIAEd8
 lXQv5Iw5ET2l9+zJ1hMuSz4tDENvQzfWjsCBAGXff9NWlnea5GWRfZyav6hpmPRqKf04c9dMNEO
 icfSgTjoZ2bLZ9d/4OiW0DSLwKXgxzOd5wjNDjNj6Klh1vxc7SrQaH69dvpJXIX6jnNjACfJjqZ
 Jk9NzZjw6dscZSWwWBGtDFQmHWv0aZBgIsZJCFA2POjA+SZYo0s/beRtTOsYqm8z1H97qmGPQ29
 17Hm+0hQXPy0jUv+aqg==
X-Authority-Analysis: v=2.4 cv=Wrcb99fv c=1 sm=1 tr=0 ts=6a0ef9ae cx=c_pps
 a=cbpO+9MDPorBMVlaIuc8EQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=K0wYxiOKNpv-6Jp2P78A:9
X-Proofpoint-GUID: ZRMLG17BHFpzYE08h0vapEeAoMuRFMKJ
X-Proofpoint-Spam-Reason: safe

Fix the error message in cs_amp_read_cal_coeff() to say "Failed to read".
It was incorrectly "Failed to write", probably a copy-paste error.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs-amp-lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index e97a125ebbb3..fb5b950e584c 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -118,7 +118,7 @@ static int cs_amp_read_cal_coeff(struct cs_dsp *dsp,
 	}
 
 	if (ret < 0) {
-		dev_err(dsp->dev, "Failed to write to '%s': %d\n", ctl_name, ret);
+		dev_err(dsp->dev, "Failed to read '%s': %d\n", ctl_name, ret);
 		return ret;
 	}
 
-- 
2.47.3

