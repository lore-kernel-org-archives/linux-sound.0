Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023110.outbound.protection.outlook.com [52.101.127.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5311842AB4
	for <linux-sound@vger.kernel.org>; Sat, 21 Jun 2025 06:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750485712; cv=fail; b=X9j9qrGwvLSFI7Zmh/K25TacJ/jQAhUlyPwiPv6UoUkpJ+9SO2fpI09XdspMpbTlKKYTR1rNjWgr4ohCGeWtNx5mfpJ1HpFrqIfmIFU8nVJ1uGUHJGy8QHLN5GNSekq8L4qH/uJvr7/wIzwF1LPbKYVi2Fa4MHNtTsHL0Nn4zMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750485712; c=relaxed/simple;
	bh=c6tbxa8JwyyhlusrD0TbcFzJrUGHQtcolaD2J+ty6g0=;
	h=From:Date:Subject:Message-Id:To:Cc:MIME-Version:Content-Type; b=ia2YivPq8cigcqnM3Q9Nk/XKrf8xeu2MdyxLdYeozgXmu3wyVpepYqoTcLTolSLbKTwHIlYl4K9cccUqD7kvX65Lj0+BRZd7UC0FP7eEWZ9xebdBtW3oIucmNzm+ZzTttvrmD6zDu4AhGKCKrnLYqHIC7HROZ1Y1SzexcTBaO0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9IH1/08eAVUazkjK81y+ioTw1WLRzXEudTeW6Ggx1X+ss4t+bMpPoHVexOABuFVa/zYM7cANJEfRYlE91mq6HMEKG/ktqTFq31CmrlnmuDekWxMmcwX83v8Sz6RXQFE71999D+aGK0KuFRKsfMsted1pDrQrkfgBXENyP5YcWukdRFNR9Qwi9lsc6teUPkIAKeZmvZPZ6HneG7WSNkxnUCpF3eLB9UoKe0EaOAUnzdwnltDTjdef2sB/ZPjmUEk9xXNTlFd6lF36pBqlZhuwrdfWfXPQzcgFB3ifgub+H+pdIhPdQjshGFHpa1dKDY+Wn9YCKo2t+qU9RwcDHl3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6tbxa8JwyyhlusrD0TbcFzJrUGHQtcolaD2J+ty6g0=;
 b=m1nOUepxOc4MY/6EHaVpMt57CevlAIJWf4Qz/UDUqS9V3Hdy+lHnd4/uCJyHS96dKCg93dc7+uJ3q6kODXR8tOzMLs5N0F61M2DVvnLxj88zSmQHlqadXZojpSRDrYv/GFhrpKSMfBxcnHYKj8vQGlnfu2afj2d2tXeeItK4lQJhdnOpYXSCw3SNrcS47e8TtieRjdUjoX/tYRzow87v/H9Rc5OTYVsukxQvF59oGtYH6/3BaWJioQ8BSOqXlFiveLR+9ztYzKOEpXvqbnbg2lQrNfknVd4Uy4Zu8n05B9jUF1614tu7uRV545J+r7e6SO2sIRDGNUsJtkBaUBa1ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from substrate-int.office.com (2603:1096:408::788) by
 TY2PPF1E1D12779.apcprd06.prod.outlook.com with HTTP via
 SI1PR02CA0031.APCPRD02.PROD.OUTLOOK.COM; Sat, 21 Jun 2025 06:01:45 +0000
From: Joakim  Zhang <joakim.zhang@cixtech.com>
Date: Sat, 21 Jun 2025 06:01:45 +0000
Subject: Recall: =?utf-8?b?5Zue5aSNOg==?= [PATCH V1 2/4] ALSA: hda: add
 no_pin_sense_update flag for jack detection
Message-Id: <9EFTGDF9HQU4.IBKF80C3FOWO3@se2ppf6de20c888>
To: tiwai@suse.de
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 chris.chiu@canonical.com, kailang@realtek.com, geans_chen@realsil.com.cn,
 cix-kernel-upstream@cixtech.com
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-MS-PublicTrafficType: Email
client-request-id: 3c9a91d4-ed27-2f42-e1b6-c45f58e1ad39
request-id: 3c9a91d4-ed27-2f42-e1b6-c45f58e1ad39
X-MS-TrafficTypeDiagnostic: TY2PPF1E1D12779:EE_MessageRecallEmail
X-MS-Exchange-RecallReportGenerated: true
X-MS-Exchange-RecallReportCfmGenerated: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUtTRVNPT0hkR3Jidm1kL2N5ZVBWNU9ZZFRWMmM5UGFScnVVRlpIVnp0TkUy?=
 =?utf-8?B?RDVpaDV6Z2lqVlRRRXFwVTdQSnl5cmVQd1RLL1k5cGhFRmNqaDRXbFVtdENn?=
 =?utf-8?B?d0xUZmEreHRwMGEwS3dhVFhXMEtTKzRCZ3FiMG1hWUtiNXNuVnJLbnBYYWU0?=
 =?utf-8?B?Tzd0UVpGZjE3eVorWVRmS3Q3T1lrd1BiSW4vV3c3dEs5ZkdrWTNhZ0hLK25x?=
 =?utf-8?B?Y2dyNHZ5MVFkYldDQUdOb1B3SnVIY3d5NnkxMXZJVWR0ZUx4dEYySi9UTXVp?=
 =?utf-8?B?Y2VIbFI2U3AwcFd5S2toVDJTTkxOY1cvV3V1MHhPWVQ0Rlo2aGxGZnVaakRW?=
 =?utf-8?B?RmdXK1Z6QlhDdkFqcGN1TzdvVmtHdE5XbHdNdVFxZXU1WEY5QWp1UUtpMXhN?=
 =?utf-8?B?NHBHY2U0ekJETHBqTld6dzV6bHNzdFVHK3RqaWVWM2JaZEZpUUJ5SmFyOUsv?=
 =?utf-8?B?Rm1KbU5hb1JnZVh1UGdpTzRPQ3lyWGdxcFZDMitHNzk5aVVTOGRMUmtLemhF?=
 =?utf-8?B?azBkRm9VN1Z6Ui8zTkxhbXcyRjFVSkFKVkpzM1k2ZjV0aDNHMzFnQS9DbU9P?=
 =?utf-8?B?ZjZkbEIzTlIwNnJramdIdkwwWmNGYnByWGhJalhRSXBKQXdXU1B2QjQremlS?=
 =?utf-8?B?S0czRk5LODZvZ2RZdkVqYTQ1L3l3R2NJQThaZ05zamlISk5zWDNxa3N5OTJE?=
 =?utf-8?B?dGlYeTFUWXoxWVhrMll3by9kNXFrbFgrcHZiZHlYTExrdzJUMmlrbkpPdVcx?=
 =?utf-8?B?WVF3Tlg5TjJBL0sxbVA5elk5VnAzVDU5UjViRkRvNS81UUg3OEsxZVFWUlVU?=
 =?utf-8?B?eGx6NzZxSVkzMmI0dDU4VjJpTEhDMG5nQ0lIQ01YNmkvNXpYNVpZRktGU1Qx?=
 =?utf-8?B?MjRjSE1na0RRcXZ1dTBWdkZXS0ZWeUxwUWhJUUZZQTRDL0Zjdjd4ZWR1eDIv?=
 =?utf-8?B?RW5sSjJGdWZjWm0zK1BTTGlIUDd1aHlOcnRTeG1sQlBYdFNHb2QrOVFFaXVW?=
 =?utf-8?B?VFN2ZUpyWGZIREdSL3M3RGVuUDFJVitYK1hCUHZKSFZKK3RsQ2ZjMWxDRmFl?=
 =?utf-8?B?Qm1BM0lwVFV5MFFOdFZyMjh1Mi9xRnlNbnNSOU9yRDF6MjRHU1hVWFk3YVdT?=
 =?utf-8?B?NFVSSk8wTEhtZ0loVVJlbnZib244VXQxZnE0VjFudkVhZFhRd2U2Q3hoeTFz?=
 =?utf-8?B?WW0vaUxHeFpYNWhCVC9NYmF2YlpWaHJXc1Y4UFFRdmNUVlR6aGREUnJ5eFRy?=
 =?utf-8?B?SlJQYllVdGZwbENBRTYwb3hLaTVURmM5ekhEQng1cUkvcXpPeThxdEJTdWhp?=
 =?utf-8?B?cEFzMGt2cExYeEVxWnRsbjk1Q3lMQTY5RmxkZjJPMU9GUVB2QmRJZ2FaT2tM?=
 =?utf-8?B?N2JIZTdqRjM5WnhFRFlwZnh3dzZZMU9NZ0xabnczeWxPeGFHTjFBK3FMMk5m?=
 =?utf-8?B?OHhGOXVRNHo5ZWFCcUZWdnJ1bXBPZmJPZFNxSmlGREtxS1RIOGlteFRrTjFl?=
 =?utf-8?B?eHlsakt0U0FScDhLZU5tRXRYT0NGOHNlbUJCek0wc1FNRThWdlFWaWlya2N6?=
 =?utf-8?B?Ynh6dGdZd3RmeFVLaWF4UkdvSkdKdE1tekZxRnVIUzEzcWpKRHVRNnVCZXdS?=
 =?utf-8?B?Q0FhS0ZGYjU1UHNJVUtGYm5tSkpnVzJ6czVQdHpQYWZ4VU5Nb29aUTU4RVBX?=
 =?utf-8?B?UFR0TEIxeEtENUVjcm1MMUF6U3BqOUZYMlBKOGdSWnNSK2tGV3dlbXRENzZ4?=
 =?utf-8?B?Y3Z6U2pKNEdtTU00V3JMMWVpcDdJcXRQRUUrUllWeVBvMjJIeVJOWHlIRHFp?=
 =?utf-8?B?OFBjYXFhSjJDRVByUEVKQlZtMGJJWUtJcEQzTFczeVVRYmF1SS9sb0x1SERr?=
 =?utf-8?B?TUxzWVV5S0VyUDRSNVVyUU9vUUQ2SlgxNnU1cWpmRUpQTnlFekFwa1ZCRGZJ?=
 =?utf-8?Q?d5MqO7X780I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	005DP3irBAwNTrhzF2T+cZVafcrVXCfgHmetwdjE/F6fr0P2CQVl9vIMBJsNcx0tXcjVlp+Cw9mxRb0rO+70OnQEK+mwYl63QpaM/S1sHU2st2mIBnSA91W3yYQwVqvKgFEYllscrcsBH6wyQgQC2eXnVyWzjfKgm+OFoHZJIAmPxvo4kAKEMX5PtwU/Fy0y6D63KjW1IWsHlrCuJT/NLrwodjvTuvQ4dLs/mgllAF4nC0JvshgtlwkzgYAaetStOTA6tr+nCF0/3HQzjn6v9Aqtk26RH3te665gdkaASXtgk9PiKz4qwxFIsTKMMhpJBzk62mfErN+UihQvrSkEVIwsjTzIJhR8MGp6mrB/MATpAjxMvnzY1SIJkUpexxPysXajoXptbgZkI8zahevpe3ELulkTu73jjEQhD8jmYIM=
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HttpSubmission-TY2PPF1E1D12779
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 06:01:45.6292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3214374-387e-4bec-a2b8-08ddb0891a8d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF1E1D12779

joakim.zhang@cixtech.com would like to recall the message, "回复: [PATCH V1 2/4] ALSA: hda: add no_pin_sense_update flag for jack detection".
