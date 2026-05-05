Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A757A344D81;
	Tue,  5 May 2026 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978295; cv=fail; b=oLtYL/vETBGajOf5d9mtTKwcV2q/9BMo4UusrIqQLJsIitGkQXOr6XXsxaCQ/KRIqZBi99Jz4lyYhYNcApUGYKdSSVSDiN9I/MK9/syGGtaMcwwvgbRicyBeZNFtr7heLfxhi06dyqsNuujlM9SeRrff0MqNqAffNyl6tobfbAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978295; c=relaxed/simple;
	bh=68eFNLnLkblOpTjtzITWArvMBN0ge4QXp4ixhfX7Sg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FRdDlUDWZcWLQ8YVQD/nJt1Ygg2SbyflBnsvN3Q5yAD6ND07LXOoISEq4f7I4cKf4gVnpBFDVhyWb5y/0DAE6G184JSCKHr0aj1ALCfoEo/dj6ePQnAhOL1yYIfaMkh0b2ljxI0HO/bMX8BzRWjD8eTVtcT2ELSMdCZPYHQSgIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WcP+7yai; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EhwVGswU; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WcP+7yai";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EhwVGswU"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6455nRax1839970;
	Tue, 5 May 2026 05:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=QwTHsc94tmpGeXX5NHIseYzLqchaGMuIJK/QOubpDSU=; b=
	WcP+7yaiBi7fnfbjPkclovE4GN3sxTXWLOzs7tBXGHdBtEZ2dp2xIwjveGlL93cj
	+s5JqC3zB15KuMhd3Dq+04hBI4dCEBIjvVuG2dP5SvopSekXOqKMCPT4AAe5KQ5f
	gOQYiWLm/XecEeLdtxtPmZ0PEsi4XNnliqlk3FCpN78PPoALSoOPa2odxbKzZ3Xn
	9ihQnfb6fFBhk1J6/pw9OuqUJiNMnouEbmKiapu6oq71H1j8xlHez0Ypfmmo77Iv
	RW49Pu0/RB6KNfp8MlC7VJnxGLgg4WavOEqYI/9ecbQSiBEJAMgdhEZ9JJmSlNnK
	b/2fZA6zL7DkvrQfAQiCng==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022109.outbound.protection.outlook.com [40.107.200.109])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0ub45-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 05:51:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wbe28L2uaUpzjfbZmc7xNh5QT/uOqeaxv9WfBSVpOOYnoEtZMoCuAUquLURcn2058/9qVHTEGOJ8EV5WnfH4QScNpHNvk51GT3/whpYvaCfAz4BYKfvm7fmJ3FGugkqPcMnfXRH4nH364ddlpzQZDYsqzpeD7BDM6WAl09xem1lMK2xlJcgsVJ/x2J70ytcW1BVcpVedSL+tOGUV8WhTMLWA9ORunZ51LLEH2vLr3MAyb/JYTWU8wXUQR+VkYbVDvT7Aun4dFGXXWBSLuKqhYYifciQb/tovj3UM1jhiwIBCnyIVLE83g9mzEhFuKmyIMGc4SIo9WWk9AvtT4tI7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwTHsc94tmpGeXX5NHIseYzLqchaGMuIJK/QOubpDSU=;
 b=kfB4OnPVci1bTlSV0COfz7+0CcBmb72PFyHk2wU3MEj420Kbd50nrWpXKtdYzUuAjkBxwX8rPedSW0E8LDGHY84V9+NQBVcXfVNlPTjnHoLJMIGZyMbW4y1TJgFxcDEy9D2RND+kMme+u8kRlQuCrL7eELRtK5tLpNHI8mNEEM+cz9wqG4rPTRVzrXLssRHdO6zfzKNZk/dZKkmNyDh9RtjDpmTT5TVkfiF4R0gge+nBn23kHvHRVOB2lQe8TjB2GFgCxTCShKFSsVwI2ycn3+AymOP3oOCuvkMlB/b1J+Q8lsLloFnzyHzSrZiPMaI6YxPDWA/v2zfauoxrP+P2uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwTHsc94tmpGeXX5NHIseYzLqchaGMuIJK/QOubpDSU=;
 b=EhwVGswUk4MLdoUnMdpJIo2zFZws0wk+ItYVR8nhk2DYsLzALvL1RdVcGNFkXaf0OCzMrrmangWyPVWVN0Yvx5BMC7Gzczgc7MkAaWcJaW8WP7Fml5VJzRRG/86uOfk8+6dD0O0/PVxR4LkQUuqbT6A+VXqNYHYp8MQqdMj/la4=
Received: from BYAPR21CA0021.namprd21.prod.outlook.com (2603:10b6:a03:114::31)
 by SA0PR19MB4174.namprd19.prod.outlook.com (2603:10b6:806:82::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 10:51:26 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::8d) by BYAPR21CA0021.outlook.office365.com
 (2603:10b6:a03:114::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.11 via Frontend Transport; Tue,
 5 May 2026 10:51:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 10:51:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 56B8C406554;
	Tue,  5 May 2026 10:51:24 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3DD5382024A;
	Tue,  5 May 2026 10:51:24 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: wm_adsp_fw_find_test: Clear searched_fw_files in find-by-index test
Date: Tue,  5 May 2026 11:51:23 +0100
Message-ID: <20260505105123.3539778-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505105123.3539778-1-rf@opensource.cirrus.com>
References: <20260505105123.3539778-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|SA0PR19MB4174:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0d4b7034-1036-447f-7df0-08deaa94414e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|56012099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	s9d134xjvYLExT4QPUSRHbEdVfQ/B8GoqFBMyefbs1MhxgJW2r0iR9sp0SeclOeaC7iPGTZIAxlUT4CMGLo+nv0La/zSxw6i4oZjgLoFdenYvejgPzxbeWlLNljINNVfdKBWfK1n0ppQblDJPoZ9Fz87RXQ1O0r7ksoje45axXQAgm88bGUZ6A6cyTdjqrTXI3c/kBQ8deVh/O/Lzm9RB5vaEkkYtlCVyteqS0YtIL8GLvGMO/DnklmKQNpztPgdzvQlCg1lhSTaYV5UxP0KNsJu1hVrWfLHF1o7UrwyVkb9xvC/8g1p9JT/p3S+DogU7YDz1g1Z8+npbHLWpaCAyXJLnPmUeFB5bHu9MM4f69P8rLTnM9Z9NqIufHDawkw/YAZxnFCFm2w5/IjDP6iBPvfAXbM/rGVB12lLsBasimWrTSdZ0Yox+xvPJBlwCo6BnUcNRKg/1kprRw/5nXwBVsZrBFDxyl05kp6tmWwgffBm6cTDYt98hl2OQjrB4xqjHQSW+ZcrMCx01fg0ot7g0lL+LrXSNVftIMGLsxssqpaC8ktUpcrsgE9QNi1iqT7cREn1+BP1ZA0SBVAmM5RcEsZAjfEbXK8DC/y7QuqVrnQsPf+1+YdTmeoGn9uaVqQGehefwddBssd7KgS6nkfWGEQO/jWggXUPPKN9JKFDLbpg74OH18NrZ2t7FfNTmSXaG5puNQf8Yn05G3Uqz8wjnRVacdCTDahRIGT+eY9UZyg=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LLIKKAGEW74gyd/zOKbLEsdkQWm+izLEgg+PdHw7aIWqskzCQpFntGBt+OuteWnNjormR8ZwQgPkXWfa3y4HyXrkJCMfIyHlkqbjclO2RMy2aBc1AdjoYY4kKvjjPNG1DilBBzDXQvVdsGO6UKC3IVofT07leYFtT6ljjuljgt3S4r5KDRya9RZdSfd5uB8SyZOlNg4ocuJ9D3CbVwlQkI3nPUTakAAhTmAMGOw1f2erv/nJAjKL4p+own67WmG1ORdsktVf5EH/+UgRmFFEQYlIP/xdsNUriDCFMdHvWja590WDvMEjPPElu4VgvYFaKAYc1Yf64MphWxpCzZby0RJ2hkInuezIskGLOwq/JMprxlnq8aayvnefDYawH9MjxqGL3CeuYEI+UAGVbQvi08eAqxTmEY+XtUvEiHhPB8lUt3vDWB2LWTN8h6DJD7hc
X-Exchange-RoutingPolicyChecked:
	ZbWXiGu4J4BD45AtJkHIPNWrdpMDwdX7fahbtmIDJRdeMORnejaDvlrmTPeGXn9C8/j/TGlatXqKJ6rYnZvcHynZiONY7bIJF5uhRi28Rw6YOcfYhx+/ZBMGCETLOskmOFYMiyr7zFIgYDCpAuGrC4Gx/RAvYfVxP5zUZqelH6Ucjsf6LqtloVl8Ys2grHr29qMCCWRSCiabxtzsDd4CJUP/6KhmtEniEWk86b/iqEmaXFTDls41kCUZUmk9bxo01E6ZBDp2BDTFY1Ov88T0tQvHuWWtlQ8Ax/2PFnXwG/UX4kfRe/xWSqfZttaXoS4TnyOORXh/va46o2dBvpRbSg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:51:25.7389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4b7034-1036-447f-7df0-08deaa94414e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4174
X-Proofpoint-ORIG-GUID: 7oljIYP9w61pGWbBivVO9Ijj-epmlY5d
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69f9cbb3 cx=c_pps
 a=17coPk5t6rY28jlQAnJROQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=RxVDU4udmJ9Drxp6T2cA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEwMSBTYWx0ZWRfX32dmLV0FVnSs
 vjCWIW0IonhNsawCiztzSC89g48N76E6zDtc7AFTiFA1JuF30b1Lnnck0fUOChM+ci3iKOcI5aP
 lP6+2XTk2ET1hhN15Nxmjs+ZEH6vtPewXElGnSMTK4bBVSP3gEWhM4z0snA/9w/ibdHPJUDmb2v
 M9ny67nUitT2etFT3WsfS4e8mOCX3Qs++4jOniphmbbCOO3gEPZlcOTammzoqV4MW5tOfKqiqgi
 h6A27dev1219+qON8RjN0cE0HFdYubqewfYLE7bonMd3ouUoheqkL2O7xWyjb3LmQZhECcFYJAO
 wbcEZ/9gaFIFTpAIz+TDtgA2bqJZaTBvOLOuc4L6IpOhfxYUkLVLU1LzvElKersmHiv9br3Slt+
 9LkHH0dvAdM+n/tM4Q3+j9AyMb8HFXdHS7zePEPr/f8ULxFhbNXGUcIvflYDj8J1paZdwsMZc3q
 /IFXh+chSxleFi7Elew==
X-Proofpoint-GUID: 7oljIYP9w61pGWbBivVO9Ijj-epmlY5d
X-Proofpoint-Spam-Reason: safe

In wm_adsp_fw_find_test_find_firmware_byindex() the content of
priv->searched_fw_files must be cleared before starting the next iteration.

The files searched for are appended to priv->searched_fw_files, so if it is
not cleared on each iteration it will still contain the searches from the
previous iteration.

Fixes: bf2d44d07de7 ("ASoC: wm_adsp: Add kunit test for firmware file search")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp_fw_find_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wm_adsp_fw_find_test.c b/sound/soc/codecs/wm_adsp_fw_find_test.c
index 516ba08eb5ba..ae686dc4fa94 100644
--- a/sound/soc/codecs/wm_adsp_fw_find_test.c
+++ b/sound/soc/codecs/wm_adsp_fw_find_test.c
@@ -261,6 +261,7 @@ static void wm_adsp_fw_find_test_find_firmware_byindex(struct kunit *test)
 					  dsp->fw, fw_name, priv->searched_fw_files);
 
 		wm_adsp_free_found_fw(test);
+		memset(priv->searched_fw_files, 0, sizeof(priv->searched_fw_files));
 	}
 }
 
-- 
2.47.3

