Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795050724;
	b=cnpBWz/HYvnS0bIagR7d1HNEeeOrpt++ALHQuKlNW4N5re7jcLcm0bJcAEzF81b4g1Ny
	 4oJWtEjKkNYZKoKPPGbxXhLrd2uLa+kdbP5CM0go+ufMAaUiEeK65rsYyHDeH1a/5gzkA
	 0jkANsItCGtoUhXYrnf16p9aX68Ca1tQKGUN6035g1CBFRe7/v8Nu0G6YgApYIu6mDrfJ
	 6cu8P4zSEtaFRsa39WFpRGSzWocJ7LPUfzMBUIDqpHtMJs0DgL2sXT9QYdhVw82xLiMIX
	 nBkkpMOcpnfrY81coBKoeI/p5hmiOky3wz3urWtPjQomaWoU7IPDiunif5Kf4Lr9KNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OpipDwJaAkkChB1yH9K6travJ63BXshQ3le32ZRxTvE=;
	b=me60Gs7mbqrF9ArHfQYFJen6DrlHVFF1JnHqYW8YSNCpRK91Zs/now3Ifiu50PbwMBz9
	 ZWlhe8QiUSlpgNv5OChnfnnlJrCsZCZ7nni96HTC1A6886mOMCYUoxWgTrZWn0Zl+frIJ
	 s5Fh737D5FOr9M5kDC6Ur20JvxU9H+aXNU0nIjCFTjqqAu70ZMMP5ZPuJV+qvohR8Ev+O
	 zg0Y88l0GK6Nivo+bSoWsTRE0viPa8YKzjkLTuF2pc6smUKwvbIxZyRQCIH5xLtmGwgfV
	 glD/A/iKizgfZKAcz9mEJdDI4CH9kNoMoLyCI3O2DeF1l8gvRZ0QSraAq0M8fG5kDsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=lJtqtWCg;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=BrlufO5x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723F8606A32C
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 01:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 723F8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=lJtqtWCg;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=BrlufO5x
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1Acdk342082;
	Wed, 18 Nov 2026 19:11:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=OpipDwJaAkkCh
	B1yH9K6travJ63BXshQ3le32ZRxTvE=; b=lJtqtWCgxREJcQX1i4f2ZW1DveINE
	+w0mnasnLdg16gxUwVgv3GtK5xlZ7D+SNyTRvbpslz8ATKvbtCYzWuV8rCTgdtL8
	Ib23DV66vkvgCte9esgfyFPIYzxYJklvczxiugcGIQ2Yyo334wWQdI5zYsyJJXm7
	2O35tV8+Ku4m7wtZSEiGb2ZKXlQbNj9CcCmwAJxndononSAeVRUrH6F2X7uvSDd3
	2apWRF3yUk4G5rTtE5oYTQ56xP/3J+z5PkGMIyfnExI7VWcAi9dfB/UtMncQMPPf
	6kYZ5foc/vIFgkuEN+YtpmYISlflGIkAETS9vXVY/d0EnqYUSFFyE/0rA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012026.outbound.protection.outlook.com [52.101.43.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j19ft4ud8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 19:11:38 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ImvxzJh4O2ZUJFDflX8dC4C5IrmEHyHOFoMS4//pQLQ1TJJSvcSrXHkNffnVZx/Q6DsnVJz4L8qQ4qysUUBHgBxESGvj+5JexRPb5Zyn87jTMaFq5O4pydDgIvbhN9vu6H9Dp2ufRHJkbjzl9ia588bAKsjuPsZNzRLmCqW7b47kACgiFRB0n5CJZ2BOdTKQ0dmUFcsoFtyijYy1k0ctjVu7YP7JyONs2nPOeJNIWu0Z3qJIkDuuiQuwgrxxVhJtYJ1t8Po9gRLCgN+jx/OLsyROhIz2CDWUj2f4TVTlWoZF689MSSYKsCYbBmNTWHLoS2zsCr0rZaAknbIXAJdh/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpipDwJaAkkChB1yH9K6travJ63BXshQ3le32ZRxTvE=;
 b=vNAWMis0o6Q0BZ++zUF0CLNQYwalEPCo4C7lEceT0qGkmHIj6logbXSsK/25p2H5m/VPm1LqNkvQ7DB1NtpUC60OLLoM/zLHRfxjIMfxAc8/Tqm4NEkNOoSUZtkKrMqGME2+FOlkiTba9xrWJ7jPhe8Nd3iTgU2T0u7M+Nnzxm9o18K26naqSTbd5//QjwgtNSGeMb1cHsfArbbHN+dmlg7+bmSQCT3f9bW4E2pjQDMFlGJYBUoOvySxfgBFl1kH2bOFWj+HUv5G3Fwbop0inOwb7bYSi0brZBDzR6YvTutJ0QbNHXm3snxfcoPMYkDn2HjeYui2YzOHHcEN+2/0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpipDwJaAkkChB1yH9K6travJ63BXshQ3le32ZRxTvE=;
 b=BrlufO5xM/DNfCtBf+5H4tNtjxyOfeuuRASS98BEZ55tzXQNIAiN5AHsjAgg+e8EEYeglN0nBB5Z+pGA5exbE//8N32Da2hnnibHCs4y+XcSDjnxO0ZInySvWlv9g0ppXHstHQpbit/YpK8TaSBty0L588WRQoKXxaYvVQF9hOM=
Received: from BN9PR03CA0754.namprd03.prod.outlook.com (2603:10b6:408:13a::9)
 by AT6PR10MB901682.namprd10.prod.outlook.com (2603:10b6:170:110::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 01:11:34 +0000
Received: from BL6PEPF0006C3DF.namprd02.prod.outlook.com
 (2603:10b6:408:13a:cafe::69) by BN9PR03CA0754.outlook.office365.com
 (2603:10b6:408:13a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 19
 Nov 2026 01:11:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0006C3DF.mail.protection.outlook.com (10.167.249.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 01:11:34 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 19:11:10 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 19:11:10 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 18 Nov 2026 19:11:10 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.66.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AJ1B6HH3112795;
	Wed, 18 Nov 2026 19:11:07 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: add realtime speaker protection data control for TAS2573
Date: Thu, 19 Nov 2026 09:11:02 +0800
Message-ID: <20261119011102.1790-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DF:EE_|AT6PR10MB901682:EE_
X-MS-Office365-Filtering-Correlation-Id: a152f624-ca1d-492c-4b88-08df45da0d9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|261022075727099003|261021123027099003|10067099003|56012099006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	rI2TeCycGNQgS8GheF3TgbFxDVQXdwyYRV9TGBH/VJMQ3CwJqp7HPFASHE6Q1XAPwh59Rs3iTa1FyH/Ch575E3CpQLhebj3PkIOgJ6X8CMViXkLcae2lGYBu4gDzBBu7ThbgNfJrDd7XbXneN1/26sGoBaA1cnikjUhemMIXr5qY2xX4s9jvrXOf8eVJRgKk41LGduD0Wt9YQHFixd1+SehwBly150hhfuVSMYiRsfsxUz5s2kAC6CplhBqIuxK/qOaO3WLr/+JfRdWi3Tuk3N/EQCTKrY2oJFjcNCR47wn6cNwBL9/FLBFtvA+j3KYzErUQVzIJdIjkNfFrkiryxFoyfY3lywiYf7fhAjqPQuX/rsvp9roXPM8XsqmLjFMiGMNk5pxxrrUMG45zH0ccaFgheWpAyhtMTb/me5ccEpBf68xKeBvBjhahpfFfO9g1t3gCInRpRF3wIzL5IgGcaKpWBjztNNGzrAzIaxEDSseLrNw9vV+TP97IqxlhLk28M8lIpm75zPiCPPlHk3qKWccY17ZWasINRYNp1C8ip/nddbZlWSWyTeME8dWo9RPTtehDn8XuIj4K0NUTq3JFQWc3QSS57JNGwDHEQlLbuXvylFtPiw30CIbV9K3zIVkRX9BK1V3tbkVKnci1UZVpANJOTSv/ofWyz1bylEAyoduUR1mw52ToZMEtJu0vPLptB6i3cP/ZS86DzhyTRKc0Mw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(261022075727099003)(261021123027099003)(10067099003)(56012099006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ip7B0AzqY16ULhNgbUtDxIKCH2iup0ZVmTgLfOyp+BuqJ3GlnNS46fsytFnFEuI2y4EJA1NHLOYub02jhPbt57rKs4daAbCNBFxuV+nxvSmG7Q+C8N65J50V5Rdewj8N3kvmlZbqUmtFZNq6dODxcclWrIXdrV6o0me51iZ+gp7Aeu/nHyFyaKGa08gAvtmBPLq96rLIiOBN7EqrHpSxN6zQrysIEE1J/+FG89zFwj+R4xTfeN/XEPwtF6oUWY2v5n++orOmaNeCv3aKPrrWG03fOA3cS1Gik44RN8AxZ3TsjyRZaA/E/2xEhdsCSDkH0qZZxaa69ibDZO3hrIKQL4n+D73l8i7x9f65DrH9Fpq/RxKk7w+4zAuIl9DcGKAu6cpNUyPeLX7s5CIRVaU0BPSCTmg/Dyvf3YuE/RKAVCZIjKOJ6TaAm7tEUFjN81gP
X-Exchange-RoutingPolicyChecked:
	vihZEIz7ksaGKiYmKOlNT5QzVhQ0vP/b8OVmcIywvv9dqkNzy7mveE6QQiBcn3sDAMHnamh9Tnf+QpM2de4aVtiiN4XKVN+fNsFlj0td3yigCbUr/6MpRc+kSmKERRIBWCkNXEN19oTpNIPJLEq5q6q1ozLJk0fdbyNycoTPoIoMWqpkDdwgM3hmEnRumeBq1B8qZIiJV17FHqoBY37glw84f5K04kChnTHvJY0H6wsOx0FkHRkChMii8foEI1IKyoqHwKwxr6JhulM84Dr08CqOSBkM54hpkL02IdrZSqMOw0u846W++lh3UuNTdHKmerxTbc8XhPENlOCMgKUkMQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 01:11:34.2136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a152f624-ca1d-492c-4b88-08df45da0d9a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3DF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT6PR10MB901682
X-Authority-Analysis: v=2.4 cv=NMFAaE6g c=1 sm=1 tr=0 ts=6afe4cca cx=c_pps
 a=KbXMGX1SJVu0lhZGOc8PIA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=OOHhq48uMBZUCpEMUTkA:9
X-Proofpoint-GUID: Z08wrf_eap0kEwoe317TOwOmNkGHv_Np
X-Proofpoint-ORIG-GUID: Z08wrf_eap0kEwoe317TOwOmNkGHv_Np
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAwNCBTYWx0ZWRfX7sZFTAJlIT05
 llm5ASMauYcEc3Ur0dswpoOsIldtg6enrFl7/jd3y6r5eeIQcBaj+1gLRdvvm2nPg/5Ak/2Uk2k
 yYhRASOpV87x6SDRHcdw4Sv/1j4E4sc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAwNCBTYWx0ZWRfX223FNv7sO0NE
 NyTjNSOAwBpb3GsksiZBMPcCK5FB0jPPBJFsen8aFM9CdNLsodZosjgs1sHkTqgocwuLDRTVe0u
 fdnwBfwBu+V790eYp4ssVwwbHnC71YniKd/PvKlTU65ItSwe1RN6V+mpbKs6q3isiWq9uU6hdfn
 X6xAM529FQDaAPk9LWOL7ppQJS8fzqhLQfZioqi0/Ibm/So7GMRAewh+MqrKF8EwNoehal9xtmT
 RvAvMQh0ODErH3hptb7ZuunSGlbPSyEYButo/ioUm1xxj8kP1n83qoPi9W662wq8PinBTTXgB6Y
 k10rBjACglBhle3pDeiuc5vjSpqkykE5h7RAyHn4b0OvSkaEKGzpBnAc5oPHRmSh+3Fy1qwLRYV
 Lc9N8aa6jsINh6rmhjy/Ji+kE24rDA6zQjdEWmXMxS2P5K6OAR79smZrRuIONcPx0cLpGGIs7xg
 NWsbjllJCkm3aEwcTaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190004

The existing "Real-time Speaker Impedance" control only reports the
re output of each device. Customers need more realtime speaker
protection data, so extend the control to a group of registers
(TDM detection, coil temperature, Re/A1/A2 output, excursion gain
and thermal gain) and rename it to "Real-time Speaker Protection
Data". No functional change for the reported registers, only more data
is exposed.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
v1:
 - Introduce struct tasdev_reg_map to bind a register table with its
   length and a log tag, and refactor the register-reading logic into
   tas2573_status_get_common() so other controls can reuse it.
 - Extend the control to a group of registers (TDM detection, coil
   temperature, Re/A1/A2 output, excursion gain and thermal gain)
   and rename it to "Real-time Speaker Protection Data".
---
 include/sound/tas2573-reg.h    | 25 +++++++++++
 sound/soc/codecs/tas2781-i2c.c | 80 ++++++++++++++++++++++++----------
 2 files changed, 83 insertions(+), 22 deletions(-)

diff --git a/include/sound/tas2573-reg.h b/include/sound/tas2573-reg.h
index 02c9a2fcccfa..4fedc8a3329e 100644
--- a/include/sound/tas2573-reg.h
+++ b/include/sound/tas2573-reg.h
@@ -14,6 +14,16 @@
 #ifndef __TAS2573_REG_H__
 #define __TAS2573_REG_H__
 
+/*
+ * Register map descriptor: binds the register table, its length, and the log
+ * tag together into a single argument.
+ */
+struct tasdev_reg_map {
+	const unsigned int *regs;
+	unsigned int nregs;
+	const char *tag;
+};
+
 #define TAS2573_TDM_DET_REG		TASDEVICE_REG(0x00, 0x00, 0x14)
 #define TAS2573_FCT_INT_LATCH		TASDEVICE_REG(0x00, 0x00, 0x67)
 /* YM57 */
@@ -49,4 +59,19 @@
 /* YM955 */
 #define TAS2573_SHORTCKT		TASDEVICE_REG(0x00, 0x83, 0x6C)
 
+/* Registers for the realtime (RT) speaker protection data */
+static const __maybe_unused unsigned int tas2573_rt_data_regs[] = {
+	TAS2573_TDM_DET_REG,
+	TAS2573_SPK_COIL_TEMPERATURE,
+	TAS2573_RE_OUT,
+	TAS2573_A1_OUT,
+	TAS2573_A2_OUT,
+	TAS2573_EXCURSION_GAIN,
+	TAS2573_THERMAL_GAIN,
+};
+static const __maybe_unused struct tasdev_reg_map tas2573_rt_data_map = {
+	.regs  = tas2573_rt_data_regs,
+	.nregs = ARRAY_SIZE(tas2573_rt_data_regs),
+	.tag   = "tas2573_rt_data_regs",
+};
 #endif
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 984cb67476a5..e44a1d460c70 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1544,37 +1544,62 @@ static int create_tas2781_cali_start_ktrl(struct tasdevice_priv
 	return 0;
 }
 
-static int tas2573_re_get(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
+/*
+ * Common helper: shared by all controls that read a group of registers and
+ * pack the results into a report.
+ */
+static int tas2573_status_get_common(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol, const struct tasdev_reg_map *map)
 {
 	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
 	unsigned char *dst = ucontrol->value.bytes.data;
 	struct soc_bytes_ext *bytes_ext =
-		(struct soc_bytes_ext *) kcontrol->private_value;
+		(struct soc_bytes_ext *)kcontrol->private_value;
+	unsigned int j, k, val;
 	unsigned int i = 0;
-	unsigned int j;
 	int rc;
 
-	guard(mutex)(&priv->codec_lock);
+	/* Report header: max size and 'r' marker */
 	dst[i++] = bytes_ext->max;
 	dst[i++] = 'r';
 
-	dst[i++] = TASDEVICE_BOOK_ID(TAS2573_RE_OUT);
-	dst[i++] = TASDEVICE_PAGE_ID(TAS2573_RE_OUT);
-	dst[i++] = TASDEVICE_PAGE_REG(TAS2573_RE_OUT);
-
+	/* Emit book/page/reg triplets for every register in the map */
+	for (j = 0; j < map->nregs; j++) {
+		dst[i++] = TASDEVICE_BOOK_ID(map->regs[j]);
+		dst[i++] = TASDEVICE_PAGE_ID(map->regs[j]);
+		dst[i++] = TASDEVICE_PAGE_REG(map->regs[j]);
+	}
 	dst[i++] = 'D';
 
+	guard(mutex)(&priv->codec_lock);
+
+	/*
+	 * Read each channel: first register via single read, the rest
+	 * via bulk read (4 bytes each).
+	 */
 	for (j = 0; j < priv->ndev; j++) {
 		dst[i++] = j;
+		dst[i++] = 0;
+		dst[i++] = 0;
+		dst[i++] = 0;
 
-		rc = tasdevice_dev_bulk_read(priv, j, TAS2573_RE_OUT,
-			&dst[i], 4);
+		rc = tasdevice_dev_read(priv, j, map->regs[0], &val);
 		if (rc < 0)
-			dev_err(priv->dev, "chn %d bulk_rd err = %d\n", j, rc);
+			dev_err(priv->dev,
+				"chn %d %s[0] rd err = %d\n",
+				j, map->tag, rc);
+		else
+			dst[i++] = val;
 
-		i += 4;
+		for (k = 1; k < map->nregs; k++, i += 4) {
+			rc = tasdevice_dev_bulk_read(priv, j, map->regs[k],
+						     &dst[i], 4);
+			if (rc < 0)
+				dev_err(priv->dev,
+					"chn %d %s[%u] bulk_rd err = %d\n",
+					j, map->tag, k, rc);
+		}
 	}
 
 	return 0;
@@ -1682,37 +1707,48 @@ static int create_tas2573_cali_status_ktrl(struct tasdevice_priv
 	return 0;
 }
 
-static int create_tas2573_cali_re_ktrl(struct tasdevice_priv
+/* Realtime sp data control */
+static int tas2573_rt_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	return tas2573_status_get_common(kcontrol, ucontrol,
+					 &tas2573_rt_data_map);
+}
+
+static int create_tas2573_rt_spk_data_ktrl(struct tasdevice_priv
 	*priv, struct snd_kcontrol_new *cali_ctrl)
 {
 	struct soc_bytes_ext *ext_cali_start;
 	char *cali_start_name;
 
-	ext_cali_start = devm_kzalloc_obj(priv->dev, *ext_cali_start);
+	ext_cali_start = devm_kzalloc(priv->dev,
+		sizeof(*ext_cali_start), GFP_KERNEL);
 	if (!ext_cali_start)
 		return -ENOMEM;
 
 	cali_start_name = devm_kstrdup(priv->dev,
-		"Real-time Speaker Impedance", GFP_KERNEL);
+		"Real-time Speaker Protection Data", GFP_KERNEL);
 	if (!cali_start_name)
 		return -ENOMEM;
 	/*
-	 * package structure for tas2573 real-time spk impedance:
+	 * package structure for tas2573 real-time spk protection data:
 	 *	Pkg len (1 byte)
 	 *	Reg id (1 byte, constant 'r')
-	 *	book, page, register for fct status (total 3 bytes)
+	 *	7 groups of book, page, register for real-time spk_data
+	 *		(21 bytes)
 	 *	Data Start Flag (1 byte, constant 'D')
 	 *	for (i = 0; i < Device-Sum; i++) {
 	 *		Device #i index_info (1 byte)
-	 *		Sine gain for Device #i (4 bytes)
+	 *		real-time spk data for Device #i (28 bytes)
 	 *	}
 	 */
-	ext_cali_start->max = 6 + priv->ndev * 5;
+	ext_cali_start->max = tas2573_rt_data_map.nregs * 3 + 3 +
+		priv->ndev * (tas2573_rt_data_map.nregs * 4 + 1);
 	cali_ctrl->name = cali_start_name;
 	cali_ctrl->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	cali_ctrl->info = snd_soc_bytes_info_ext;
 	cali_ctrl->put = NULL;
-	cali_ctrl->get = tas2573_re_get;
+	cali_ctrl->get = tas2573_rt_get;
 	cali_ctrl->private_value = (unsigned long)ext_cali_start;
 
 	return 0;
@@ -1869,7 +1905,7 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 		if (rc != 0)
 			return rc;
 		i++;
-		rc = create_tas2573_cali_re_ktrl(priv, &cali_ctrls[i]);
+		rc = create_tas2573_rt_spk_data_ktrl(priv, &cali_ctrls[i]);
 		if (rc != 0)
 			return rc;
 		i++;
-- 
2.53.0

