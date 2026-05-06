Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012011.outbound.protection.outlook.com [40.107.200.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EA84BC016;
	Wed,  6 May 2026 17:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778090305; cv=fail; b=CjzeXMDdqaheo/QPWiWH6xMchmSvy2+WbTkE0UWAH4N0LgPApuyzSjSuXFmsCimEIZZJLkRRSS22Kcs2ajD/R7O06f0EtYiKovk3BF1zuk7B1vRJLnxezcr19K8ojRFmsUQyOut1iBfhWDEZ7S3VuAqpzB6KqgT5oe76BdhTtZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778090305; c=relaxed/simple;
	bh=uzSYIuZ6YqMsgOeSRR/9nxsz6Nuax6NHzfnEw+fjFaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dD/H//vkWanBuv+Hljdt7L7v/VoNsPSNkOmyOqAsZtyb57jTf9JOhwukjMA8G8xJA2uUcfTl+tVwfmKVjIYyhGrj2K7XKniHnAwkx/AqGJx6O59e8J08ABdiswFSuc19me0ZXmzLvir4j8No6aB8gjBk1s7LV09oZ5CEa11iLOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MGEw4CWN; arc=fail smtp.client-ip=40.107.200.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MGEw4CWN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIJM/hbA4LXqme5nfT23i9DHI59Hg1DKDxzkIEe7RbW0zX6xg59ZQhyPkKjnSw/sNSJWCHk6tOayQ2wMlsNVx1iM9+lhqsQSUag0lzdO1bXx4fKseCb1ZHoiTHaNwkh2dnWUbzhNrBebXUo1Y5slO2FZJsGQI8F67TSUEZQ5wktoOkhnfe7NjydIDDsaaYZMa22d0PuEkiC3Klwg6OpF78ZjuoSzv009i12Cd1vno9i1f5HJokvTSEdEHI0Ym45oGRiNSU4aWTiejXQYtF6FbCRmzDDey9fLbVFR5N81Ov0Mr96peLOLduzkSGoRNBZx7iVr+guljAKsIFlameXAww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81kuAeDwOmFY8ABiVDA329bvUf4gLH6mI/pEP8JqfXs=;
 b=wTr4+zaZhVGrY6P8MKf25cgi2vhiEbHunPvsisC3wxf3v1jir2rTcFPYXhJxCHHcY5cv31ejS+yMEK+jDjQCu7pYPyS3Q2f2ppoeCPt2tZHQ5fqbJOmEaduAvqxSF1DrRZgD1s8QM0LT+EKvvDoE6+2cOLSDulAGmZGQq7kvIiB29M3Ta+q3wkweK4MUevUbCMHyxbNw05RfdqzOzXIAhmYarVdgSxnu+Yux9tg7nvdkcb0J6Lelf5wS+rzS3Wdzr2BsTWFKiVO+AgE3wWmCPT4imOQzI+ZbiTxpeZtl6X44XX1hvDjb8hI3m3WXTe+aAMg1KvwhiHZ4Z1M3pfkkPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81kuAeDwOmFY8ABiVDA329bvUf4gLH6mI/pEP8JqfXs=;
 b=MGEw4CWNEQ0Vox0st+P8huP0XnJOWSnpmvSfqAY4nRwwksNHrZPdnes2J225vu8s6fqMaOeCOCxDaqYwDV5jvJUcjN78ax/YKLFdW5XWfa0+/RHuBhANIgMcVIAJaM+DosfcZuzlPVBvAHQOL5lwXqecCwID3GEGv15E5eCRCQE=
Received: from MW4PR03CA0265.namprd03.prod.outlook.com (2603:10b6:303:b4::30)
 by SA3PR10MB6998.namprd10.prod.outlook.com (2603:10b6:806:31c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 17:58:06 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::dd) by MW4PR03CA0265.outlook.office365.com
 (2603:10b6:303:b4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 17:58:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 17:58:05 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 12:58:04 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 12:58:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 6 May 2026 12:58:04 -0500
Received: from [128.247.81.183] (ltpf5gwk6l.dhcp.ti.com [128.247.81.183])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646Hw45W1887165;
	Wed, 6 May 2026 12:58:04 -0500
Message-ID: <666345f4-48ba-4a03-8e18-f89e70cd1066@ti.com>
Date: Wed, 6 May 2026 12:58:04 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: ASoC/ti: Remove myself and add Sen Wang as
 maintainer
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, <broonie@kernel.org>,
	<lgirdwood@gmail.com>
CC: <perex@perex.cz>, <tiwai@suse.com>, <nm@ti.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260505164744.16134-1-peter.ujfalusi@gmail.com>
Content-Language: en-US
From: "Wang, Sen" <sen@ti.com>
In-Reply-To: <20260505164744.16134-1-peter.ujfalusi@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|SA3PR10MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3ed8fb-c79e-4a08-7850-08deab990643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TAp6OTsl7v/tuWI4+vXynICfP+gr9UXkeo9/rHq7So6gIbhhqHdpVbJnz+cPkNyBoPF0Y9ywRzA1h2FrPtKxcNTmVQ4Ptnzkw/Yc0BJZCEDFHKlyZtz0JC1HplAkOsfF35H6q+0tABSVHXI46I9KHZqWpW628IYErYPbYGCI3QJjF93St6DKfs7KXzp5ve3b4deXZcYSypu8+Dy0EZaBAN9H77ZqwmAfNpluzPPKWnfFcp5f+PUQeUZfkvolSOMNlGUJgDbK9MgaQuo71h25bTmpl2vyF2iQ+M73DlEjV/iGHj3i+DCfBkab6WaJuipbOKPEW760EE+Qvbs+dSuzspuxxFXOqaYQaa5zYS5fPs6HmXunCK9u5JrBTFUG+H4dBF8YOyhZrjgogPPC0n4CovHQJLn0lY98bjbLvsLGlIIYG5nlWk2bdQmbde3kKksWx1MvgbO3c3U7VQLqsLVwSWlxi/1+gVdEFvCteooXPfp5Qeg7P2CETaSMjyQlCC4vAHYHa7/54xfqWvrfUzvlg89Ky2QDrWnoR/n9vPwmUlN5BvkRTVZdJ/upvUKnT/ymZK7TVzfQ2ZZD/CRIM+bvps1WRJhs6mzGN7prQ2r2aH0p23+emd/3n8oqlv9PD85b/5hig2tYAAKnGf3aRSKnhFqi7jNxOHdE6l7shmFgpMXVNxqRbn8q64Gv283VOVmq8btvFsvU1loPcJPZa9WHka94iGufP4L3IrwUPFDBMdA=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jPCQr6XJ+s7Vihn09t1r4TIkTLYXsV8OfvuxXc8R68q/kfO2VV3vewszyYoUtdG51Rs9CbhIBhOAlXBBwDRF4mVds6H3CdCIdjOECOAT9d9iOXqLrUWJ7m3xBkv0WtQRuCKC7Q/uds/13Ixr9O+NMTNPqBag2oq+MwUolxemcCYifftLittac9BcJLxKwZ/op8bRj3ONCez8pAl5Ukfl/DwQXPylTg1IRKQAx2hOIlBlrkLBG2xxrojfHqgFTmAgSCCjOq/tJ6vGUmkpZphacgQNM3j/UpAv6j/V5lmCA6wwJGX57x6fByqVanCvQRMCMQr1+pHNkjC6Y/qM32s7aVCV8CZtsM3HG6ZoqKhfviNgWElr02SPk2jqowkOz1RcFTfY6E8elduDkvug8zgfRMyE0azCRWOIoqk8bV0Y9T15JNv5eH7EAtbOaWnC8WUF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 17:58:05.5004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3ed8fb-c79e-4a08-7850-08deab990643
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6998

On 5/5/2026 11:47 AM, Peter Ujfalusi wrote:
> As I cannot spend adequate time to fulfill my role as maintainer for the
> TI ASoC drivers, it is for the better if I resign and hand over the role
> to Sen Wang.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Thanks a ton for your hard work over the years, Peter! I really 
appreciated your guidance and the solid foundation you've built for 
these drivers.

I am excited to take over the maintenance for the TI ASoC drivers and 
look forward to reviewing patches and providing ongoing support for this 
subsystem.

Acked-by: Sen Wang <sen@ti.com>
