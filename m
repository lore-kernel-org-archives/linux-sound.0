Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793303681;
	b=b+SK1hjKGkZhvwJP1RfZRDSuGNBP1TWC5xUZ46hWxzGjUo+Ikq20K/cByyMR0cgHDRoP
	 IsD+OP/gHIUi2T62j+iYMO12XwIqggAJck+c5ia1oxBm8jLdmN5X8MaRtM6Wp94Os0zSZ
	 ElgKCiwQBD2KN5hbV0hSO+CLXtR/SUlFkh1mOHUg4KounUKKrvnz4cKVlfWBaNr0M9nUL
	 4TB3sbuYw0HO8YK62i7Yq21CHCbGm7blPXh/+sxz/gkBxOyzUpurYfMFN0lTEJNLZ23S3
	 lTRJja8NKbUsnjgIhVjAh2h3Hv/zXBNF32yJYh6aevkfa7DPd1FPgzBC80k9JaG6K/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793303681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=nPaWiY7QmSkMA1hQ11ZdguM9B4PfdGgowaHcujCyVxo=;
	b=AdE2hW1LnOt/4ILCxH9HhH43PlhDQMqXPMY19LVeL3rihH5jYELumc0jynDLCK9Ab+1K
	 ZgZF8Gpy+2P0ifYauu68affFyQ0sByk2ZXctJjUBcxq1rV6ETol9TPyvOzfTtUp1u9Iho
	 vXN4fnxehD6OzTqg7jdiVA2GTCg8Dr/4SZ+E+J6j1lRPzfmn/dtTknHpuRkkFqaRaNGjC
	 v1tRvUhtLajSAM1VIDsn7pqA1yqUxxGJABDVMx7xclYdio37bcN2pNqqrhG5Hbj8fcONV
	 rTW3f+mlTrRtzuYpdUytgZOQXb7acNrdf6INCXppB3yZefMpvpvOGUjYldv16nkhYdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=JLiywKKG;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=X4xDt4D6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FD8606A31A
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 19:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04FD8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=JLiywKKG;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=X4xDt4D6
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGAHkw1744203;
	Thu, 29 Oct 2026 14:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=nPaWiY7QmSkMA1hQ11ZdguM9B4PfdGgowaHcujCyVxo=; b=
	JLiywKKGUHDR1NlLhuqQ2lBfjEBiphrJA4uIKzAQNFW876raw3N4/5NPg4PqkM+B
	z0Z6Zq8R/wEuzRREiSJaYB3mrlMKI6EReOgLU9D5R4V0qg1ZfG5zILBAYo3997Ca
	bP8vG/38GrTN01Zz2Hp+F0S0okZB6Q2Ln4T5VgGboVAwp9yZ09OnIYPweeRImfyW
	eQHp/T4k3X/gV2bi8pY/OJjKR/3auoW7mxE4KZWUmByImq8BbDETsLpEx/Ljchio
	6qDEqIIler50ZmmM5XmOs7G1/wtSynmZdwk8rM1O5yiGgEMaiiS2BPpfpI0vIS+w
	8/9A1Pyw9Wwqa71w3q6L4Q==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020090.outbound.protection.outlook.com [52.101.201.90])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hkhv828bq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 14:54:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUigGhap0SV4bvSxihbhwsroo+pLX3V8Kirdd9+Pyu2pnaoE62X4Lb1ADV9VWWeeXuVZdmIJopM766vbp6McDtGZNbYEV60Ztrf8dHcSbfKHTsOYEnaeiKE9maO3f7cg4BWJdw0e4KmngSsQ2PpJYLFP5kVVjYFNjTqec1ttjbsHqmKB0IekztUugcUHY2Wm7HCy6Xjh1F+dCN+EckS4LKYsLqKPVfbF7ughRc4Fc1S6NyFfyzypHsdak1QE1oZGkxH5t/WSTq9xztFXvIFkvraXrld9oxV92lxpS0GdNko0BYFrt7qLBhqdMgvUUmAudnc7GiPR/xyEWsCNsdkfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPaWiY7QmSkMA1hQ11ZdguM9B4PfdGgowaHcujCyVxo=;
 b=cvPdnDC1+U7HDYot8eeSfbA5ITZnawSl4HrLgiZnYiapfBa0n5SWbrNx5kPDJ6tk7rVszF0/Au9amxq+x3O9BBnSXWWiwlumdvSKgEwf4jX8IaXjC25wBkNynbGytScjOQFu+lBMPlet6pl6DzmSnsAPHrIdgahTClrH8l1XoNW0ivs8A+lKJ++ZeJesYnKG4nBMycNRaIdlrVZ4iLRHDq3Ld8GzyhWfeASCkq/NmakAVQAnhfNZo2629RN32beqVUyMPwIoaHRBP8DLGM3P0MnLNd5BdaaPIefrfr1GYZM9Z0lGy4FxE6ocB9q0yIskkxXuzuwUXGsyuFtHopVTtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPaWiY7QmSkMA1hQ11ZdguM9B4PfdGgowaHcujCyVxo=;
 b=X4xDt4D62dZSUnhaKyPp2bc7cTh6/OBLjNJla6plY2oL7kGSZpkwPtw9Mr/xfwuls3tdFVY4f5iaBCLFcrKRrm56Fy5U5FpW7lkARxMRzpzbKI8ZIejgslv26rD+adS/b6iOg7farkWiLSSkjcWNswH7n/m7hC2bcT+VMHTzR+Q=
Received: from SJ0PR03CA0382.namprd03.prod.outlook.com (2603:10b6:a03:3a1::27)
 by BL1PR19MB5795.namprd19.prod.outlook.com (2603:10b6:208:396::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 19:52:17 +0000
Received: from MW2PEPF00014675.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::2a) by SJ0PR03CA0382.outlook.office365.com
 (2603:10b6:a03:3a1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Thu, 29
 Oct 2026 19:52:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW2PEPF00014675.mail.protection.outlook.com (10.167.249.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Thu, 29 Oct 2026 19:52:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 77D6B406544;
	Thu, 29 Oct 2026 19:52:14 +0000 (UTC)
Received: from [141.131.157.78] (macMW3KVPQQ2W.ad.cirrus.com [141.131.157.78])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7ED39822566;
	Thu, 29 Oct 2026 19:52:13 +0000 (UTC)
Message-ID: <4cab016c-bfec-40a5-9ed4-f80949e1dc8a@opensource.cirrus.com>
Date: Thu, 29 Oct 2026 14:52:05 -0500
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ALSA: hda: cs35l41: amp dead until reboot after one failed
 system resume (shared reset)
To: Mads <mhbn@proton.me>, David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
References: <NTfSz65gX8wGLl8ueVKxyXJfip46Ee4dbabGMaNtaILRK2MyqyTacUI4ejqeTur-CkARIxoLYIeyoKVMwaDHVuBhg6p2vfhRcUlOJDAdGTQ=@proton.me>
Content-Language: en-US
From: "Rhodes, David" <drhodes@opensource.cirrus.com>
In-Reply-To: <NTfSz65gX8wGLl8ueVKxyXJfip46Ee4dbabGMaNtaILRK2MyqyTacUI4ejqeTur-CkARIxoLYIeyoKVMwaDHVuBhg6p2vfhRcUlOJDAdGTQ=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2PEPF00014675:EE_|BL1PR19MB5795:EE_
X-MS-Office365-Filtering-Correlation-Id: d06778c2-e0fd-40fb-7a88-08df35f62289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|61400799027|22082099003|18002099003|16102099003|56012099006|11063799006|261028144727099003|261026121527099003|261026140227099003|10067099003|261021135927099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	EVuieIHb17Z+qQCrSD78dwxRuJN91yvQTOgR7aZuoHKVQopn2d4l2AFWqqID/ClYT3pXMno7IEBYhM9de+jqNFnbCAmGSeq63tGT4ai3AHA1W3kPGVH+J5SrS1JrYvlLr/evGJfNJmbrDVQUt59s7ehiZRyGcoNo6gdwyG0kQ1CBZhqnLVFmAISUoWuCLhpvBr1B8l4sjHB7F5R/o7CbsKu3VYmvxYVmjV6R/qRyRw2O5yManUg+mBW8YD00xe4QeHyTjqeT+fomHRnNejlcj+q0WKMGJaM+0u1EI4GafL/gX8v++LfOt26CPAYFMcpdNYWgDxFZjT4bCAQJDqv7+8BUu1+aG7PfavNiCEKFqLNqKVKc565swNnlMJ+v98xzavqZg+YSZ05Ag7VSaqwgqRu9y9k0DMVstpdf55TfdUfKzPYOj5VrXxy4f3BUhzd+7x5+DKuqtREuf6op6+jHq5srpude5vaV+qg2AjN0rOMlrt7CTMa3d0cvF+gs4+2cqZoMPfB/82HyLp9w4Ljeg54gUKYs2lHJDQp6LOz6G7UTpGmBBnRbj4UdRazTXkZ7TSt4cGt+uaAYb16IVQPmRB67EwlLkKJGq2iQ43ltnivUGKbkzm7GRyv/1MhMdq9Hxje/y2B4ZZ+fOC1iFqryxJ17ukeBfGGb8ChFYF+ZpjlAC9RJlkgOJqxxe6ZhT0ktncRcn4Jbj6wKHEDsbNrAAA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(61400799027)(22082099003)(18002099003)(16102099003)(56012099006)(11063799006)(261028144727099003)(261026121527099003)(261026140227099003)(10067099003)(261021135927099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vHCp9qP4RGUis3RFKRpzEmtw4/N1edJ96NbdqzSYqQwMT3sA34FEbWOZaL6Y+/djMs1psKWIxR9Qxm8KLDqjy2PNuQABEYLEfY3yhJEwZB09Vd05xsg3ZLYX+k9+ioTagb2ggiEm7xmUhPOPfQi++AJdo1KXcVclAPhDMKqQE6OeIuP0eoBW/jDw+PrGS4i9HIpZzJK82+DGb5m4xN4a9UNFT75wOPtMjkg6ffueuD6axtccRjGjaJCXlS8jD2p2PJ+DH6WxjZDeJ7mlG8NKr6xeydH0lwcLoCiKk1SyBmjetnlrdR0nXqdIYJFfaD/l5a/1LvRCJq5ngpNffpYcfvpKsE7cJJrUoHjl5nZcumiucwr+9vzuQ37XPHhO4AAgGXow5mhfdK7jOQRoRt7PJvAbsq6pMZHEA0+SgWXBAPK9GRUAtPSqUFZ/J2OywwZP
X-Exchange-RoutingPolicyChecked:
	QlxVREzkHO44rQKnnEM7WFLWJJkYO0wOJS6dmEdXdL0ERSlELWPqg4G3JM86qp/a2YjKHmdQvGJ+gu+34V6BZx6vjA8XyK41a2wh+wONk9bmUAqED1+c0BM9GmNQse/psHhUhu53U50Wsu6vlxPcJAbHSPmafvSgzKnIcE1VLi711vbrXxfvtSUiz9jAf8QnFzci6PCr/FpwLjqawr9vVS6XT4+Lwno+tyYvfSc3LaeS3jl4MR+Rqb1ldWXyrYqdujchTFQdb7ggQletQ6ifVJFNlYiGRVC6lKXG4W+CxhHx0sc3pbg/Hj1wAH+6AfU1N7eK2z/ziXqYGUF7fcWjvw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 19:52:16.4415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d06778c2-e0fd-40fb-7a88-08df35f62289
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2PEPF00014675.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB5795
X-Authority-Analysis: v=2.4 cv=DpnDa2/+ c=1 sm=1 tr=0 ts=6ae3a46f cx=c_pps
 a=onnDVuI42kX/OVeLv55qNg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=uDLWqPgFnEC2egSa7d4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OCBTYWx0ZWRfX2uLrqTeBnpH7
 v/lz14Z8I32Avq1G2OE0GePRMG0cYcmqWkLsPZ3bZNq/kLnnlzsJ0aNaG/811HEKMtGhYtOlIvp
 eNG+HGAH6EGBHSSTe/HYOPKm1KU5Waz27P+sG8hXI5F9fzMDKISSvxAQL9nq6Dsh/3XIZbblAlI
 himzAtOkS6tRSQaw1p/+AtNn3wCS3o0ZbvZLM82LCVqs4ahGW32qfu0lr5hES1ZGRuZgCNzyh0T
 hN4hUi7AODkxwL8/dNH2xUog/UWb8K9KaYmg0WW8hTKLlxwHXH+JNjk+gH1FA8D1eWZmK36sxxH
 j7QSeUd5ESeWIZzIQpjVXR+rHzdU8gSee/9BdGT43LM5MlcmU2ttOZd/oGBrPzWBEnO0O/Dfz/R
 FbBCLgJyBp0fdw6rcDujurtt9oe+VDR8JF7As68tMPwIr4lc3Yg/8GbL4rPxuL9iHIP69UZj+Nz
 nCuIoD16+FktOqgdEJw==
X-Proofpoint-GUID: ua0yzwbzcUGvk7CJ-UaklpNSuAGEsHVW
X-Proofpoint-ORIG-GUID: ua0yzwbzcUGvk7CJ-UaklpNSuAGEsHVW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OCBTYWx0ZWRfXxhIRhrTNCYpK
 cfrUZscpY2NLvjk9f0WOiaSta9QddBEuSempy+48iO81E01uRk02ziNZlKUxxXOdn82CM0ZiNLM
 +sTvj4IKm5pRyxsMYxifdQrQf/8ui/A=
X-Proofpoint-Spam-Reason: safe

On 10/29/26 3:20 AM, Mads wrote:
> Hi,
> 
> On an HP Spectre x360 2-in-1 14-eu0xxx (SSID 103C8C15, Realtek ALC245
> + 2x CS35L41 on I2C, CSC3551, BIOS F.13) the right amp
> (i2c-CSC3551:00-cs35l41-hda.1) often stops working after s2idle resume
> and stays silent until reboot. On one boot it was dead after 19 of the
> last 21 resumes. Two things combine: an occasional resume failure, and
> an error path that never recovers from it.
> 

Thank you for the detailed report! I agree with your assessment that the 
amp which does not control the reset pin is trying to initialize while 
both amps are held in reset.

> This happened 3 times in 25 resumes on one boot, always on .1, never on
> .0. It fails within ~3 ms of monotonic time after the suspend-side
> "Asserting Reset", so it is a read error (-EREMOTEIO) and not the
> 100 ms OTP_BOOT_DONE poll timeout.
> 
> As a workaround I have set /sys/power/pm_async to 0, so resume follows
> dpm_list order with .0 before .1. It is too early to say whether that
> stops it; I will follow up. A device link from the amp that shares the
> reset to the amp that owns it might be the proper ordering fix.
> 

Great point. The intent of allowing the polling loop to go up to 100ms 
is to be tolerant of things like reset sharing. However, the loop can 
break early due to a regmap_read failure, which is likely if a read is 
attempted while RESET is asserted.

In my opinion, a good fix would be to replace the 
regmap_read_poll_timeout in cs35l41_wait_boot_done with a manual loop 
that will always go until the bit value is observed or timeout. I will 
make a patch for this.

Thanks,
David
