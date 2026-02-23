Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334FD3451D9;
	Mon, 23 Feb 2026 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858986; cv=fail; b=HLxoIhgXqC534dzn/R/x+P/gMjInDeWrnSESZpYon6kmJXN1gSd9BhrL2TAc338TwRVqm9EQASmmi9XFjb9aEp+c5f4IAMyPaj8pf8WMdfJzULjRQTyTFhq7jWK1WZpgl4UwVWFpjE/VCpoAw/Uocvdvfo0hqbvTkVfmSl93Xqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858986; c=relaxed/simple;
	bh=IUqK/pxVAF0eWX5Uq2JY+mkVG+ThOwVhN5YHbE8YIaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HpURiRxi2d7jAYMB+XnFq1MDWJaXLGxNBjpduws7f40tOsRUCA0xC1DA9NpQPo3w5zMHgqJC23tqoqduU78oDbIvKjwnDvZlVYiJRBXzrPxewpd2t6EEmuwJSiZgeBoroG9onxROJOpOG+krzLdFbEbE+nC3whHRVeWbcdJpbRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PCZemROI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Y+tZAFUP; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PCZemROI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Y+tZAFUP"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NCa5K41878262;
	Mon, 23 Feb 2026 09:03:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=dYpgKCyBeeN3UFpJ
	zaXN4AIpBn2Ya2G0MkR98TTSkjs=; b=PCZemROIVGe3a6LZqGxHb5zKalQ8HIST
	KDNzX55PonEnbrNwBqSnGf84f6cyIgTG7+nP7XExNZ3tqStrwMRmO6StRqeb5rZA
	rxTTitaMJ5m8ur3zyYJsCOJ44ImZyIngwNrSyd634bklZbJ38ZWD0qBYBWgYrkZA
	zhCcaYiz15q+U/ktAE37ckfU5lX5rEJ3Ec5LCqKMLYxNin42s8qcXarEWdGbI5IA
	ydbkQ4sYwuPre24I9AbkPCnzKGzAtP1cf813UfDOEwiq3C/k8CyEVBtvG/hgKAoT
	5RZgiEhTJv1jTJxNhhxvJRfht1iICqhvdaM1VIhhBXwrDSYRFKWWCg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022107.outbound.protection.outlook.com [52.101.43.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j1nxm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 09:03:02 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkvwuIRF7dvYNjWQJbQwRXEZ7ApW8F2YNmlTHrYr52r07wbvZrMojRS0VtLB9PM/ERTkYNvpiW0kOFgTfaKEVdrDsaLF4lLa05XpBrwSAAbY7FMQD5FJWVdobG9NhRWASJcyxOX8x3Uh4ogtZxmT38vTD9sr4NWrv0P+Aas+BptSz9xzsOPrEei9gWgV0Pp24XN8gUES3xXEsryCdw4fy6mJfBmTKPeNYOIQY+j3J+QobyVYWVRD6one0TPkqIXx5vgz7Nw1mkoDozz+Lio7KNcxEcq3isDLZtlRsU6WyuZpQLY56N5rWhjbL9NRYps+5jK93R/QqdVS1P2atMxHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYpgKCyBeeN3UFpJzaXN4AIpBn2Ya2G0MkR98TTSkjs=;
 b=MCpMWNf7uN5BhuXuVAQ+hv99nfWl2mVyUAGSDLzaXB6FB8XZkd1Dqj7B/oJuwVMm73l3ubWc/J9V59lTTYEZiWY+Pz8Wr6CHhUtkdREGjtrZ18ED9h1YGJPogtSn5LzYSkaVFZbZsh2kjybCVft3ZIhcYowkI4HWi1LhUimaFDceBIoM/fZdS7zss+L0/gzjHkRaYrvl+ACV+/f5IyqGGCY52jMcAnDzgrj9oS7G86EtjQPwLafg8s2eDJQzg8mS5cOqzMa4ASXHd4lLWB65vSu4w0CW2Mb63d40vqfN5e/Gfc7cFed/+y4BIBF6jPydMrrPmNldVZT91pqhqI1pcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYpgKCyBeeN3UFpJzaXN4AIpBn2Ya2G0MkR98TTSkjs=;
 b=Y+tZAFUPOe54K62ZkEftcsxHEWk+yqfQ5X6mfQ7EfcP4ttVskx9bjGChlwWK2NbCRsjLG2jappzg6qpbf2IQBlcR7Patdca4+CJhPs3I5hKYdZPEzdOwcSLOJmdGO0KnhEK/Jjs7SrViDJAEixafBf9NaPrrINlQRSph75bNgII=
Received: from DS7PR03CA0012.namprd03.prod.outlook.com (2603:10b6:5:3b8::17)
 by LV8PR19MB8495.namprd19.prod.outlook.com (2603:10b6:408:206::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 15:02:58 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::a2) by DS7PR03CA0012.outlook.office365.com
 (2603:10b6:5:3b8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 15:02:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 15:02:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 96276406541;
	Mon, 23 Feb 2026 15:02:56 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7C55382024B;
	Mon, 23 Feb 2026 15:02:56 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/3] ASoC: SDCA: Initial support for Cirrus Logic CS47L47
Date: Mon, 23 Feb 2026 15:02:53 +0000
Message-ID: <20260223150256.326143-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|LV8PR19MB8495:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9393b416-5650-4a33-04d9-08de72eca17d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MBDgOf4862bOzmjHlIPHwPSbsmf05WrA+albPZfFKC5Zcrq9oQUKPhDwto8p?=
 =?us-ascii?Q?MLiDcmIWyICiNkMYI/30RuwVholFCMOz+QVs/dWdOI052zxvmW33PUgcXvbt?=
 =?us-ascii?Q?fRAze2e0v8wTcEDG3FRisuM+cpJHeD+z+EbJF4nvXbftkR3eA5XnhDDDYZIk?=
 =?us-ascii?Q?nj9LRBeB+UZom+xvMKADEK4isGHfhZYFTWUVVArPIGY8QK4yjGPsbHGZiYzh?=
 =?us-ascii?Q?N3Kri2zTLCA9gysssje/wJa9IVHvA31Yh0UyxHDeCTpnwxDzwgAhPWpjxXae?=
 =?us-ascii?Q?ChyIoELXPhhe2r+CkRT0zOMA+0QpZFDU/S1bmHINZntjMAelO4uuNdE71E86?=
 =?us-ascii?Q?OoSwVR3DE6HwztzUS0eso3wEjENxQgvHwzCb9c2diMPL4yK/iJfW6aLsTlXQ?=
 =?us-ascii?Q?xqM2oGa/9NC6r41fNuCPcyJZslWXD+Io6IVlh6HEdRF0btui+DfscytLMMrv?=
 =?us-ascii?Q?dG0pacCvHuWY+IPyLiC0z9IJ6pzLUSWy1jd4MguXqYQwFqN6a1EHqJYwK3jz?=
 =?us-ascii?Q?AJyOeYvCRZrildiOpchw7J5RE0HIg2gfd13e3Qebg+W7eX1UvR7lgMyBmImT?=
 =?us-ascii?Q?6E0P8/YKrOkw9/AtzaN21G5TON8tyd9ltnp13EOaRppFRTtvvTvT7/O1iIyt?=
 =?us-ascii?Q?/7AHY/2gtpkrxJkKZWgoOiCC1BW5RX+tMQtMm+uHAs5sXlZ0mixAKoIWJejc?=
 =?us-ascii?Q?0TAQQTOUnJiYO21KmjVn1rtfOUybhqggndzKHfi7Ln8KqMFp3s/Rvk88siAn?=
 =?us-ascii?Q?BV2N8JDDlqZpb2jL0HGYYHG6P2itLPl5STNgbGVol4sz+3cm1m0SDVP30Z82?=
 =?us-ascii?Q?0Vbmb20og+TZ+VzrGoTDHWbQwPKoPfyDzHfolLElDHOYtoj8pwUi1lz/txOj?=
 =?us-ascii?Q?CKE1jCeYAxPc3AeNjqfy2k3hdWfnJT52rkYSnygBIMyCl0JQt6HQOq7sSWgS?=
 =?us-ascii?Q?5filO08rBuuhDCC6kwZuhlygv75jyAI+g+CCnKRDwvn3RsC2zqZ1lCaz0P44?=
 =?us-ascii?Q?YJ5UUnnmPLjCY+GILh1ZmjJDe8RcaEmKFjuCOdBhnNAshbWl3/wWNOUuJhh2?=
 =?us-ascii?Q?BR8kXdELsNNncbkkxL8uUF4cZKww4e+oXsdKl05KA3ug7qLDv2gI+vMgBYcs?=
 =?us-ascii?Q?pm44ZdaPF3w/a1A+fL8Salb/LOld+1nk4di3SJ00NMz5FKhoNwyIgWIH6UMo?=
 =?us-ascii?Q?eerk2dgtoY2n29E5Xi1AP4/XZNYrpYJaSoJKZgONcH13cb5z4CtI/W+s01SV?=
 =?us-ascii?Q?0trKLQYtzMqF8eBkHmN0m4JQqf6UqvyMAhQT0oWh3o1dQt6PaofS08HmL0Yr?=
 =?us-ascii?Q?UIP7Reju7Kcin7FzTK44mChwJO8LjJ4pIfff47SqqWEHbFqDISHALTJ56jAQ?=
 =?us-ascii?Q?dL+fVvxzM7hTLVLNBsu15fO6YS7NnPA5czeROeQwTZJJt1OCel+eRrfDBOVn?=
 =?us-ascii?Q?5Xnf5V0e3c3YfPXJbJjpw6vNlMLbtV/FqgGyH4lVo9IVRYDZzG4uMNyGLZwp?=
 =?us-ascii?Q?NkFeETjU3/qpBcSi3Jf7lxhg7V02miyH+e6T1snEzQP+EfWOosziKGVChOaC?=
 =?us-ascii?Q?b7vEPyOgU3YfiitVOBAcZkjNB34Y6B55M2wt8dWnsBuZ91LMffYbYe/y3xre?=
 =?us-ascii?Q?R3iomz1WjtSINt9wyjLenAkH/d5wrkk1YgnxWhvQqs0C?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JFRsadTq+FIOSCnF6f2SPY4RwtDm1fngK6DJriqZUMCzphcSX0F3DwVzhXuzJOU8ohnPhqYK1mSoyYKuxyyMIYpj/JZEa2S7eRJPJk9JFSw+A6Iswva5KsK0YptRQs/NcpRTndVtBcSyvzCvwB8ldRx7Buk+K8ji0FeFFo+b7UIIk/zGKgKvK3N61DVwFBayLn+B5Wjaz1wVdA+gMYxaKP9fueFvlnOgVsw1JUFA1+JNFNWVyo86euADoSkbd5ChL/kgD2lwhXAo6+3W7Hrh2Ecd+s0HgizpDPc4crDtarwTpbma8j3zfxTO90/IE6mtFlSLSB5jsG5r6pIGdKBeg5Vs+QrHH7NHmA3OXttNln0daMiy5ARa0tlynMka+bdKWoMGogYPR4JZPDCzWJXpSm2L6925ZgFDJyxaMWuSNk6XIUjRskjmQbXWICW241vi
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 15:02:57.7590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9393b416-5650-4a33-04d9-08de72eca17d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8495
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEyOCBTYWx0ZWRfXwBxnw/HLCRzA
 WLsOv3xM8kDHws2atsswIRk1dts+qEzjihqNgFG/vkAhf9KdPxW/33xoEhoAWMt08N1lZqFVs7y
 mflrXaEY5P9VIvNdfQ25gXXNYH9CGKycugV30PMgLvl6EdvW5+bHdVzd1RgqvPopf5UN676MLqb
 u28wKok7559KZyEXqG11PyW8/SpNdfj9aHBwa6lSOe58PMCYLpzBU5lMLxvmDp2992Cpzw7pXwk
 QR0RCN1xUSGg/PdeRV3nSgTSlmow0lv7oOCquKlbEivcDvsZsTn0vQB77lrtYo1Zpm1HQ3VMB6b
 Uw69thi7JBLx7f3YRxWrvNJVoajlSBtRhmUsCNMoxy42HDXb/lxklvrYRvflWU9mM4eGsJe0kTn
 jr4Oj7y9l48wQhkIJQWVvVnE6vshSLTNo7xYaJI+wiIbeUW04KwcVx6hbaktAqdtf9WcLPfUYx2
 nxtILqg3Yri+s1+8qIA==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699c6c26 cx=c_pps
 a=sUbwXUxkMQNSWKNRO95rnw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=Vqhfld5Bkrqe7ZcPCFcA:9
X-Proofpoint-GUID: aVka6Tk3QmVizspjrsmOJKrjv5nh0lLn
X-Proofpoint-ORIG-GUID: aVka6Tk3QmVizspjrsmOJKrjv5nh0lLn
X-Proofpoint-Spam-Reason: safe

The CS47L47 is a SDCA smart codec with UAJ (headset, jack detect) and DMIC.
This series adds the initial support for the Cirrus Logic CS47L47 codec.

The soundwire patch can be taken separately from the two ASoC patches;
there aren't any build dependencies.

Richard Fitzgerald (3):
  soundwire: intel_auxdevice: Add CS47L47 to wake_capable_list
  ASoC: soc_sdw_utils: Add device info for CS47L47
  ASoC: SDCA: Add CS47L47 to class driver

 drivers/soundwire/intel_auxdevice.c   |  1 +
 include/sound/soc_sdw_utils.h         |  2 +
 sound/soc/sdca/sdca_class.c           |  1 +
 sound/soc/sdw_utils/Makefile          |  1 +
 sound/soc/sdw_utils/soc_sdw_cs47l47.c | 80 +++++++++++++++++++++++++++
 sound/soc/sdw_utils/soc_sdw_utils.c   | 36 ++++++++++++
 6 files changed, 121 insertions(+)
 create mode 100644 sound/soc/sdw_utils/soc_sdw_cs47l47.c

-- 
2.47.3

