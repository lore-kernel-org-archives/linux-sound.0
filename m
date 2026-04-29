Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3D73CA4B6;
	Wed, 29 Apr 2026 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459515; cv=fail; b=W7KFbeiJ9dv/YKPN12ffn1eQ9MCktgWuGt+t7NB/oo9X1SRG8gQwW4kgXzUUZK7/wsQ7Jn22i/aDxQDggsUkrhwqmS9C+pjRAhVUiiwUnbAE3Bq67VPiQLb4+MJC777CG13Q2rMgcY/x513v4xTRHcO4J2rHF1bdGVUnP/MIm9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459515; c=relaxed/simple;
	bh=RUBDg0L4LVJVmwP3UU7NKgNTE969KQXJ3rsCSI9Xw5o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=K32V1bxmMo82vpgg7c7F10nwID+BjNOXxr0HhJVxgWrc2mLj4x4HgvpNoPp+FnBh7bl0gTNRmfW78kU84gv98Ces8XLg5+Id1BiWT/BQPR7wFjRLU91mkDE5AVfUNhD/n7m3srkJemGn82yCKHbjVs7ZOB9GjCiZsCeBN7J7BEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=q5Qmqptg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=H5vRBaAa; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="q5Qmqptg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="H5vRBaAa"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T5QPCP2565692;
	Wed, 29 Apr 2026 05:45:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PsdpeX75Amwl8AXAao+MiO5zCP0INfF2BbpPbMEcUM8=; b=
	q5Qmqptgh5a2nQD+KJFlLRBSheMVhKF+FGs4vICbuMT+YYgbzSjqyx+EAD5SPLpf
	4w2+8y75yKcYTD1apfKrSghLqhOmNghkPGv6C2it2GSDDkvPMN9A16Wmo15Yfcgz
	8xLdNKq5/MN/gWAS7Bq3Pwz13+OSjo1eeDu208NLbH46w+Suthv5v2dicLc6QbWk
	0RkGSKpmHaljjBgrwmMFeU7Z/sdeZNaq7McIS4qa71r2s3F2xccp9/8iYrRk+lUB
	jsYhEAum3vseFsLg3kcCEzcxxCSSNYFmiVVY6o991MqIHBQVnGz6lZGttkj6zJhO
	5rVNVuRQrGbYKfDL4ZKyQA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020076.outbound.protection.outlook.com [52.101.201.76])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4drt1jne3c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 05:45:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfdCxsi27bPnWA1kQVHckIJPciL7l579BgDsD1MYhRjdia2bIJj/zqYZnspWJY9p/bX6XtcCseu+vKC7Tiop5fg2cUN4sclnwvmYPaT3rX2JZm733a+Tc6yLIJYL7BTx25dawYQwWh3SKkgrqOAsXc2Vp+6tylFr1cTlM3DZewpWa4B0i6fDlT2hXbtEHZGCK+5EnO59WIDS0wTfihtaeiYo+/oq/kFU+1aJnrJrnhroRDixORfQ3aICVxYXP7cyvN0HtzTVXBmSg0MJvkSmLNvN067F7Z0Y4PIPkg/y6jeJKe+dXuretNRo4T29s0qyaB5EaNPzmVnaGwjeDF9LaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsdpeX75Amwl8AXAao+MiO5zCP0INfF2BbpPbMEcUM8=;
 b=o9bxfC91qfKj+wZtMhGFX8wNJDeURWGtLdsDGv4HwTNvY9HpMVw5n3pBUcOo0Of9B3yqx6WNK1pDlwAUrdf7BHp16MXx27+ml+MI624HBi3l31SFlDJ1Z9QsOg0WY56w3i0oZEeYUT0J+i5TNBbE55kzjnle2uza/j+PFnJTIjx7dvZwq0waL5LLMGe+KtovI7z5WtH/YBo9Vb4hEgYRsSrCzP8fJCg16dlTW0IPnXE5H8VMh0FKqGmamsmRv7xFpCgLfRnSrTa5LYP/1NLqdI6EP8U3tkrhAliOC8ERcf/PzqYl8cuJLppe5YgFnhYIlhyRTQKIOsV5qr5u+qfuvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsdpeX75Amwl8AXAao+MiO5zCP0INfF2BbpPbMEcUM8=;
 b=H5vRBaAaOfCHAw34YMjvUvB04Hrf0RFL+Ak2ozJZZY3C694guFMpjL5lpgNpmkS85z3c9txl0wcO2Ula0Ol8B7yiIvcyhcbREqJErMdKts4PEMJqc95LIO+3OTwm0ymbkFAk8RER3G5M7q8sNHqDuMnTMWivr3wyinLfniOyvOc=
Received: from MW4PR04CA0214.namprd04.prod.outlook.com (2603:10b6:303:87::9)
 by LV0PR19MB9573.namprd19.prod.outlook.com (2603:10b6:408:326::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 10:45:04 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:303:87:cafe::f7) by MW4PR04CA0214.outlook.office365.com
 (2603:10b6:303:87::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 10:45:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Wed, 29 Apr 2026 10:45:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C61AC40654A;
	Wed, 29 Apr 2026 10:45:01 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9C159820247;
	Wed, 29 Apr 2026 10:45:01 +0000 (UTC)
Message-ID: <65d84c36-67d0-4769-9ce4-7ebce10f6ba9@opensource.cirrus.com>
Date: Wed, 29 Apr 2026 11:45:01 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l56: Fix hibernate write in runtime resume
 error path
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260429104156.2436987-1-rf@opensource.cirrus.com>
Content-Language: en-GB
In-Reply-To: <20260429104156.2436987-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|LV0PR19MB9573:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fced491-0fa6-4aef-801f-08dea5dc5ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|82310400026|16102099003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4wmRnQahe9Dquvqu7a6VzgIBe+qyZUYzCTUBJfGsANSAindmHOiponH7UPTUcBcbzprmT2uNfPGp7osOBKxcOewAQb5fifRedMM0BOiRD/fubR6lCb9AZ7lIs2GFK/sCDFkpaTsPa9Fzdo2xg07NPwWqglnxUSNjd8pD6qUvJ89Z0OisZmkwQO8kIRB1WBHpfWGWm3bVmkRI2YXJ/vgqw9kEEqzJoPvjLnfHhVhyTRBQS0pjx7YcQYPVcnaF1pJi5BI+mbQf2dQjvISn/woEWRHka172SdMyY0vN6thaRpDzntVwF/3Ql6NwuC2iChVUhBvNazy+qGbBjJ/gNyi1Hiki72r3kY9Um2vLj9JjjN0UZ6WSKuX0w7TUvi7hC89E1UhapfNkXWM1BsoJG8ceQsZCtz4VjEFtu2JW54P9zOM+IEMAdUC103lTXVUIW0sdUo51uLfVNB9wocD64HVwLQd+4ojIX1A5/YFuU2M/eDhhg9Q20+wYTsaUNompaNZzvNn8YzmbcJUPmQ7y4OWEO35BrUy54mStFFIFH9A6DzFry2hxXkghQ5uEADguyMNJMVQdbikM/F7D/gYJisKg/RoBoGoaw3wglhkc7COL9UUUtgxiwLGiY3A+vP+PEcfZ8y2oI/QJuJrBke6B1gVu5nCLV7rp1QnZWqMVu76EiPKPhxXPQrZZWDq5vhPIj0sk41u0fDKpsIFhAuHJHHYYKu7Jw2x+4t//iqAI2iAj/u+ix9yYcWsG1ixtYjGc57P5fpQwHnpj8xhvj7Q64OiQkA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(82310400026)(16102099003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mBgWxpiaymRFW45WEQwwvO366I3zoeJfA78vzRWOKMHYoWfqXebc5sbExZFDDYvX1nCw+eAHsa7Pu4zOZiSpcxpRRBzqVBjTibSjldySJkVzTiyW7LklFVz+2gHkAXjXFJy0wxXTXLNFW9C8YBU4fzliiTEzK8uhmQxZ6ns1VCAxUXUJLrYQ1djnXmDu3sRXYDAEwdhSaJ9CifGY+/98JGeXXU2fWwQCjKRE+gvWTN+BqJjtBQL921EXLG0Zvc8caKZoLO4q9gGe4rELYJayh8muzg7M/CFa0w5bngWiYCgxpS3QzHMqY3ChSAvqvG8f1l97GcNLEbZe+Rzd0vAPUNfyarzZuq0hKHgG9LjtBk6G7PubKWcyo86CmY88na2ydAhLRfGwTfwtfU7brnwTc1QByvnzNEh0IB9QRU833n7l5N82LwsJIO908YpTTvyj
X-Exchange-RoutingPolicyChecked:
	kuIdsBJJu4sIAoRPly6AYfvKkgkN6PD6wG8YGJX5AcyIURaku+tG7tFs9xXIHh1NDAXTOwX1eSO99VUq28ZPEX7irY0N2zxorYlvvWX2Q5qlQLny2/xxZo1OO5ECX9CFE7VHb2/k0KxN2wzFT7VLdkbiQv2c1EW1DiBnrY6LDo6KW72uwYVnJbZSZZcmszsqN98Moed1X8O84Egs2tzVrxjybDeWdY6TgJuA/gksrSQ5nTo5TY+gL5VlI5TqbPJB5JyHD0tCJdSDBbusykoHLb/EqiwOTSAJDlmXiNp8loZ6XnsPOTy0UkLvLZQdQlz2Vuktc54Z7n35Z2GAUMW/0Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:45:03.1220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fced491-0fa6-4aef-801f-08dea5dc5ec4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9573
X-Authority-Analysis: v=2.4 cv=fbudDUQF c=1 sm=1 tr=0 ts=69f1e134 cx=c_pps
 a=wcWRxBclbL8OLrndhT266g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=DcvGxsDoJDs_h-gvjzQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 8deOHQQvGsxfvUHzvbad8BEq9K1iD35X
X-Proofpoint-ORIG-GUID: 8deOHQQvGsxfvUHzvbad8BEq9K1iD35X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwOCBTYWx0ZWRfX0yBlrT8C76b5
 vFc1wxTbMCgbMW7WeK6383d7Q3S8fz2juvuS59qSbtMxn/kZ8rUN/nOeD89pdPm3GwXVoZDFGJn
 9x+nswqDJ0eRR59kqfxZRuCedZFG2zQukE4Cmr2VBs5PVECUBiuc+//dESUNOKG1gJoHW5rReYI
 WLvn+E6nshKjidX5A1doPc7m0lbFXZoY1usMokVya/5X7KP3ojOjCxAQcePwkxgoMm3m1jA+6QN
 MWulvBLbz3m9Qci3CgYZ/BViB/ZpVRZLYq3GGRqoQNzPvjXmWnUA7TFs9g6VIk16Qo9mToBCSwy
 SYWdRs5304LUNTb3X6/OUbK/LSb8ircFdF3IlQ8OI+qNPvzeb1hMCrfAlL+iOouY/6oF7iLz/4S
 jd7m0lAMIknwG3mP4NaymUoTdKfwAmSEMN0EAbE8IbXEfX5bTY/ZXDUUuAEkZ39bWmct6tvXix8
 1j9ba5gBQC8oKVVeTtg==
X-Proofpoint-Spam-Reason: safe

On 29/04/2026 11:41 am, Richard Fitzgerald wrote:
> The error path of cs35l56_runtime_resume_common() should only write
> the hibernation sequence if can_hibernate is true.
> 
> Something has already gone badly wrong if we ever reach the error
> path. But triggering hibernate on hardware that does not support it
> is likely to make the situation unrecoverable without a full reboot
> necause there might not be any hardware signal to exit hibernate.
> 

Aargh. The typo that I didn't notice until I'd sent the email.
Will fix this in a V2.

