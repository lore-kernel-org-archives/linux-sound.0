Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023082.outbound.protection.outlook.com [40.107.44.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41803B3C10;
	Wed, 22 Jul 2026 04:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784696040; cv=fail; b=EWAGgh9ZmhAb+YhfHnbJoh3rWw9sYh9AqfEqrVa11tkwfM9WjHlz93rFTVQeWN/vBCr0OvBFjFdjD40r0NIg5p8vvAZXcv/9rd4Q6O5fDEaa9X3kdOqPOyRJgVwQ6AymNb2CmLJR01WrW0eI+wnWPlPkg9VlrVKTMENtlKTCeq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784696040; c=relaxed/simple;
	bh=grF/UWhOJgU7sarhHVosB/N5CnX2PfyIbsSWviH/L4s=;
	h=From:Date:Subject:Message-Id:To:Cc:MIME-Version:Content-Type; b=qHdZDGKp8NHE1k/HV1ZNcpVx0tr+oTv1QReVZQbw9QWucHhbvXWB7mtbQ381VpiBfKtG2M2TnFzK2pVWBV4aZY9viTCPtCJT2wmMbo1RSd3k1MLXA31ny8ec1JByI5fU0FAZf2utMKYJMf8mbeYQ6EB4/lbSRgKSityZfk/tCN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Au/JA7o5; arc=fail smtp.client-ip=40.107.44.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Au/JA7o5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWY7udPgUvcoHUiKqSTsLm/wU62Dt8ybvLRpyeUiNkpHXVbfA2d7EkUy7GeNIkENe+rqaNBgv3d3U6E43OaQSK6kWy8ytp1jexAx6ijwbAJeH9Fl1/uxTJ3Q294vPsTpPA8colDQATETC7ay0F0T7cJG/In3sOKOR6bHd0fyRvkzC6HKgk4UH9ax+SZf4nULDAcOMul+XcPll4l7XnsXQGji0RBpnNUeuKvf3SsDTASMq/amUukBs9xIVC55kGpJ1giYS/Wc1nb5T1EbgTssIlSiJ1AKJTRGiakL03BDnErdWN3iVDw5AZLqZbheuX0wwY98zsRtnZxIewuUZbjyLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grF/UWhOJgU7sarhHVosB/N5CnX2PfyIbsSWviH/L4s=;
 b=ahHj6TDcc4P6zbaV/O3/9gYjS6LNfBoJgiLhBw75aFB+JoXnjTU1kNb5FsoKuSclRennehYyzdwQxYIjvYKJ3bLjAEKQru71x4cdtPp3TDde7R0HN4Yc2lDRaawGmkgHJz6EQzubx/hR2d6+MHeCDuNdDZVa/fe6BwqkjVKY7UACdJzcjOG9Jjwf9ybZfBlWmD1Y+AUUWfzo6vbEXm1G1VeAAQ1s19Gzjv7QgvXD8xbVuqHpRU9kXOFm2FsukgVloYb+3j5QUwsJWGGYTkx2H5k9AEwdZhGYnIcSO8TZgfLoq3dwjxPS1bmHsAzBRETqZDtF6l0kBHkK3kitbw664g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grF/UWhOJgU7sarhHVosB/N5CnX2PfyIbsSWviH/L4s=;
 b=Au/JA7o54dMXB/sC60W3dzJM9TRHBC6AZeSwNRikluGUVwXttmhWbMpvbB43ARIgcQ0JoAqmhdpS96eF1lX/kPrENRs4GRY16IjV6z/+cwYf1/mqimeCorzjZ1jvp+2fNtJFM0q+R5kmx24SCgkwDFUIPkz6djJaEkVfUg4AW0iHsdeJVXmE+LP6EQb1Gwm6OBx9vteSz2Wj0mzIhOo6XvcHzUlJ77Kx3Q/kcFEeX70SCwl/coUKZUhqJULUSH59dsK619H0TfFZExei31oM3ls2L6jDmS3ReOV5PuYSX9rSho7Q30iLMVBI5T0VCc1v7rp2B8+TKrryC34lQoTE5w==
Received: from substrate-int.office.com (2603:1096:4:29b::23) by
 SI4PR06MB8376.apcprd06.prod.outlook.com with HTTP via
 SI3PR03CA0001.APCPRD03.PROD.OUTLOOK.COM; Wed, 22 Jul 2026 04:53:54 +0000
From: =?utf-8?b?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
Date: Wed, 22 Jul 2026 04:53:54 +0000
Subject: Recall: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for
 Generic USB Headphone
Message-Id: <9CY0GGZIUTU4.PFGT1Z0AUWCK3@tyspr06mb7136>
To: perex@perex.cz, tiwai@suse.com, cryolitia@uniontech.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-MS-PublicTrafficType: Email
client-request-id: 04503e0d-090f-7c9e-c61c-862bf37ccddb
request-id: 04503e0d-090f-7c9e-c61c-862bf37ccddb
X-MS-TrafficTypeDiagnostic: SI4PR06MB8376:EE_MessageRecallEmail
X-MS-Exchange-RecallReportGenerated: true
X-MS-Exchange-RecallReportCfmGenerated: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|42112799006|19003699004|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hnIfZhDvXgMGm9KQAx6wI6bThOPjCJ2Gp/pbUXIggcrWoCLmmK/CNwwOafihJ4bRcxXOUztb4q80RH4bElThf1djFbkW2msZsT0t1LsKN4iVKjHDNMq/6yI1JSBCN6Z+q6on/aLBcEvpVVQRi2ebwAq/Ic81jpojEVbrdXSavaZbSidf7zj+Z7NaV1rsUAFxn6G8srkmzf8pN9EtjDIBgmKqY9jEe/PFsccdPBeNjCnYt3+iXotreGNouG6t0yPeN+K/oEJToNeihC1o0nRionrWQSxOkoN3/x1cRL94VBqAgS55aU0mz+nv+oC3gKGpgsLQhj4S7Eu8jZExhjK0PdX+NuJR7ufCMal8O58uOt97C6FbaRTmqh3KMJfK14CUqzmDDsQJleXtK8yhz0aOEVMz6aBbd4B+y6Wl+u9wiEa1mK5J45mnwHemy3H+Ge323pSHVk/uVmh9ml2hxxiBFtiUPhwoqTQMid5hBU3zEqyiOamw4l2o2NoqJMngnaEQlbsCqnOrsanHVa2bts8oKjCfii0Bz6LY76iE/QHMW6Zhtuk+r6YFpzID8feqFa/d15yVYusF0H3DbOHW9hgkup19T5sCIFpZWkdFmhWEJ3L6WIkXqZXXxNJ12nNTMvW7Foq0Jv1Xe1uq3eq6cdxnCxHdbF0Q1p90uQv5Lr2mYm8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(42112799006)(19003699004)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lD8W+s18ORek0bzcEYKZHAiH7qL5O8G+4DN/NW+Trg4YFDQnrgFyUe0FDrknQxQ2U0+XRHkeOO7oyQ87yGlToX9MQTROI4Y12itMFDcBS/uMAnYobPPukLFDRfvVFTMbfConElOIH5i3sOhnJw56jiJUJF1IRJPHQ4TVRx9dLMR6OI0I0qmIhtorDhR+nEJYP4Srx6OeTt5eycS69KDnVJ6qyr/igRWNoUZO0cqRB0cTedPjvMHf1X21l/MdYdbim4I8+K2Yk2JQscsvhxUr77t3TOJYPneYE9kTV+xsBGTpRTrV2Ddmfexn4HIQrEBTod7+wwTFT+3KzinRGUyW/TX7ATmwha/zkDnOmt3Q0DC4bZrJuarrCOA/UQ9qWbxuOkEbc0vUNyxNa4VfHsCqMIpfCZvaMrecxRT6C7X2KPsgoQ0QHAsqrfZmn6itsuI4yHxekVwL3P6727HoZJhiWIGWefMZbsnp/pOecOS+/8KNyI4iHdDFVrMws3V4qPWa5NyGvvDbVg3KY7CE0D4wvd1xBu9S3pyJf3AhoS66Z9Q5yDx46SP3icWvbuFhmxLd
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HttpSubmission-SI4PR06MB8376
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 04:53:54.8285 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id:
	c55c1136-9fb4-4446-e607-08dee7ad3ba1
X-MS-Exchange-CrossTenant-TrustedPartner-TransportRecall-OriginalMessageId: =?utf-8?q?=3CTYUPR06MB6217CBB68C8F868C076A4353D2C12=40TYUPR06MB6217=2Eapcprd0?=
 =?utf-8?q?6=2Eprod=2Eoutlook=2Ecom=3E?=
X-MS-Exchange-CrossTenant-TrustedPartner-TransportRecall-Client: OWA
X-MS-Exchange-CrossTenant-MessageRecallSenderObjectId:
	ede174fd-418d-4564-9ebd-846112922d55
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR06MB8376

hulianqin@vivo.com would like to recall the message, "[PATCH] ALSA: usb-audio: Add iface reset and delay quirk for Generic USB Headphone".
