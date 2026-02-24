Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB093A785A;
	Tue, 24 Feb 2026 16:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949926; cv=fail; b=JUomfT+iZpnqS5fbxdHxb0gO0u56tXaUoEuTgXud95wFL9az4EjxCpgDZdxjBozpOOfyXMtZyLynrRwHbaG72bHbRaQk7Sf93k9OhC1Z3BdJdN0j1k19Rd2p8k54zkL5kQjQ1yUnR3J5MER9VVLcpuwlYlFZwclVNegj4GInP0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949926; c=relaxed/simple;
	bh=3A0hmK719KLGiqFaueLyw9tqWmy9e+Ow2br0nb3Gi30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iE9gcJV9mc1FT9PeorL7+ir93QfTUixtwHWumK5QDG+6zzwmJOFD1jItJbxBHYWMamUxNGlc9Xl+a6pF2I5TlWqK4sMq8AY9A3ztmkGDdiZeI1Lk7WLjhcR/wmIq1mZiyXf4PCZEiTgBdKJBj1B9fboMD8yZP9OdKh9PhZIkVMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XzNF4eVJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=rz7ChJfV; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XzNF4eVJ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="rz7ChJfV"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4mbvZ3507755;
	Tue, 24 Feb 2026 10:18:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=XM67fP6U/26rKwqgGjA/6W5D9T+fxUq0zGKZ5ubgqFA=; b=
	XzNF4eVJn3Afj5W/EeWRaMkfpo8gnabKtPwBW5Tx1pjZ1kXUCV8cDyArX0kq1vpH
	2HAPfAIpgMOZx9OiyhlG9Ixi8J8KvtRI5JWm/YmJJYhDeix4VM50tuNFFJnnILqs
	2fV1Fj8jISudTisORqCXHXV4uBXVeWfs2Gu6Pi+NwaHjSLS61sQ4z2fDCDSK4PbM
	YfrpLoGTPI9bXWOmALMYuKsEHfX5WemNkO8TrUvXxkEuGyNZhjuo1nOf1RWlTRtX
	eIj0mXfCcodNch7XzvZhyTrzRzLBx16NX4FWvBP5L2YWgoFOqjjAMRZ84t0gdgs+
	/Z8D6IOJEgIwglpvPq1o/g==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022132.outbound.protection.outlook.com [52.101.43.132])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j36gr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 10:18:41 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAt1nKTXsp16K4WhaxE3H8ZmSZB9h6zRev45iWBwvVBARNvd+Nw4AT7KZDRrgFvZWcOLznK41sDVYbBkRnr7/GAWWjRJ7LYiGQ5w2aY13saspkJNB2OcD33vTdJUP03A2ZZ52TcLpLm+JMpJd13yUWZ5XRnwtd+e9ak1N1Rjc7cRs8wJZJ8dkDXonQIV57NmrfhHpEdX3jXffciMGdSiYqtWBpom3vqnDilqQiRMuNMI7IP3qGyhhhPXXGTsPaD3GKmBPyHVVna+IUitmukeoBB1+qO5DrhPH1qPqzQ2dK8zt0SEwYpHFTSiSSsrOIH1U+uNqR7vYA3K97IY5qrxiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XM67fP6U/26rKwqgGjA/6W5D9T+fxUq0zGKZ5ubgqFA=;
 b=yFOxs1avEl+YRc32A9hyZtgF2s50zLs4RWY+l2q33rwEvcgbw+HvDPP4buLKIkuFdbMktWChkokVMH8p2xHKKd3d0I/2s5yli2gxogvzKqRoVMBkCKil/sVf+x26nZHRPIzVbgwgOwK86ZFKt/FwC9ue7ofKIa37msEorC+BD5sJfSGvh9pcGzeYQT+rsjO08VhnI0qHalxCvZFFGAvyYJU1lp0oX4aznPxsu3elmEt9ljSa7Uu+4vI14UTla/ZPP6d2OlEUUdnvXhiGfOwDmmNs8udsEKB2A5kix90zd2znQHIQH+bG+fB93vzqHlZRViAK50j+S+l7zBAICQ7Vog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XM67fP6U/26rKwqgGjA/6W5D9T+fxUq0zGKZ5ubgqFA=;
 b=rz7ChJfVhiZ1rCLE3oBYdEtUGGG7Rosy2Ol0ywKyfoMK61IoM/MP25IJ1cHH8+m1j4qePkkSZY6H7G6bPn8okGxur6V9kfNF53uJzjnO6FKQMTsh5nGVkdNqi9AohCm0yKcsflloBB3I8w9n3vC2abCp4L9Oa7JFDE7w9ZAjoqk=
Received: from PH8PR22CA0007.namprd22.prod.outlook.com (2603:10b6:510:2d1::12)
 by DM4PR19MB6001.namprd19.prod.outlook.com (2603:10b6:8:6c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:18:38 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::73) by PH8PR22CA0007.outlook.office365.com
 (2603:10b6:510:2d1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 16:18:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Tue, 24 Feb 2026 16:18:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 767C8406544;
	Tue, 24 Feb 2026 16:18:36 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 65E5882024B;
	Tue, 24 Feb 2026 16:18:36 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 4/4] ASoC: cs35l45: Hibernate wm_adsp on runtime suspend
Date: Tue, 24 Feb 2026 16:18:08 +0000
Message-ID: <20260224161821.93365-5-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224161821.93365-1-sbinding@opensource.cirrus.com>
References: <20260224161821.93365-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|DM4PR19MB6001:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b63b7357-f746-4d96-d33b-08de73c05dfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y5e6r0ufkUz15s7iSQqG5WsQnA3Brl0ccHZeBG9uw3bvt+XMztXcRdmWVxZI?=
 =?us-ascii?Q?+63iTDHhjIh0ShV/vvAt5Lz4Mc3y4xdXqH0aBzrwi4J9Jpu7qyDvxcOpy9EW?=
 =?us-ascii?Q?BPrTvuneGoaf9scpjEIM7wNC+KWK+BiYODpOMW+yvmLvJf6iqE9+3N+7cD7M?=
 =?us-ascii?Q?MOsQ+83tsVo1R97YjXxsdUSgYP94l1BZttISlECh7AQJlJuX4JDPtvcuXvhI?=
 =?us-ascii?Q?1bo6J9Gyw5L1s9Gt/59p/tZS1IEe8xw3YEP/u28ZBDjM+9lHJNKOUidXo2Q8?=
 =?us-ascii?Q?PQv8MT7z/SMUPi9vIa9Ytt9nSYv6TBl1MMIwxC/OxBlR4v/j6mBBh7hF7HMK?=
 =?us-ascii?Q?aM367k+K3NKuwfE6zJ8eHxtjeNbvKiqRQoc996gEP+XS2TwiKt6gAxDwG4HZ?=
 =?us-ascii?Q?qEtRD1K+XFeMibOeK7oMuiVMc3xUskGzkyqNJ3C5y/bqKHW6fEexE1uUmNOl?=
 =?us-ascii?Q?JBMcYRW5tfzxnRxjVtO5SvHDYTq7fH42RHntPp9p+0z9EfZpm3L/8355ATcM?=
 =?us-ascii?Q?fpsNZXFpY75EGAPU71pOqWGa9qsMYg45FfZ4OyEF/5kuRkgxPkE8aeSaudIZ?=
 =?us-ascii?Q?kC79Ddy8syBqcow3tfuIeSpCifhQBhgg4kW03/1Y0sOBqb5JJnndqwqo30XB?=
 =?us-ascii?Q?t8Og4W8gJ2lBMBc/82DaXWiwkcgTz2UrlliIBaTqPCkahLv5fROk9vlYyE4E?=
 =?us-ascii?Q?iJMgtWg43+IFyVEc60trV7GovL+Vtb/qlW8nOMG+GxEzVPDW1ivnQfbifobs?=
 =?us-ascii?Q?NNuvD+QWS1Vy1PK+OqU3Ne8KqucB6l7rIciEVzebMWDHvoDMBVKrQIm9IUXV?=
 =?us-ascii?Q?SV5t98NwpZUcQrf7hctq37UVVjvvjJxCDUOyISZr7TT4x0iehx1k6vH7ruOX?=
 =?us-ascii?Q?uaJMIq/jQbB+OR1OaWVBkD0xnijOjQL0qbYs0zEc4au/ywJsqotMMmoh0vi+?=
 =?us-ascii?Q?dcgsx//lSjFWXEKg8M+JalFjfVzUJ1T2Ik6AYQ0RMQskp6681e5wojFphPJQ?=
 =?us-ascii?Q?z18K2xMIjduqA9dTKlqPToOZVjD7Cu3XzdXXb0tr2R9u/dHwX81vXnURB/G0?=
 =?us-ascii?Q?FgqECKC2RVWlYelX8X99UrRMiQXNa5GJiKvJ15I3E3nldi+d+6uF95OcyO7s?=
 =?us-ascii?Q?P3on9yszggwQ8klpJPmKmdprVbcdZWdKQJ6rDRt10zCoOv6VIPJ55WS55s/B?=
 =?us-ascii?Q?Oh+tFO8rwd1yxFZrGyG+tSZ2jPFUi2yw1G3auDc6u5fo8heKAV10bqPK1awW?=
 =?us-ascii?Q?/CE7Jb0ELXd2KNyuhQWv4LDtu3XDjpOrf26fVxajCGcScu9G3fFIbEsDXLh8?=
 =?us-ascii?Q?+wAMjQLMnKuZE78r6qPIb25wuETLtwG32v7FWFDiT6K2pH5CtYh4oFN+oGmv?=
 =?us-ascii?Q?f03dvkGVzfJUEUqX/Y+aOav9tQKqn0LnBQ5kIuNLZrEhjDC7xgmnSuYi4tQM?=
 =?us-ascii?Q?nprpR2KZmlaaP6Rn817WjScF96RhDR1fn2FEa4WwkC2rfzxHG+vVj+DoF6K/?=
 =?us-ascii?Q?bF9I3CNkSeK7Wh3s1/hrkJKGHrVXOadAsg3OqShTXsbF/69g3e9UR2YQvqfn?=
 =?us-ascii?Q?JMJ9I0p8FI/LdQr4AJUL0Hdi9Bo0pAaDiQR15aWklnvTr8Fp0X1RM3uI9I3G?=
 =?us-ascii?Q?oER1oeRKS0nm3wIW79MJd2xlowvJGDEL1+v3eLA3kVYHqxblw329nVTZr0Wg?=
 =?us-ascii?Q?Wb6JeQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iCLrq5COSPHkVQfBwEkc5Y6QVbbwiLpFcBIbZd0DwajpDAtpkZfp5JHWcDj57/GHHfGJbCeE2Hg6BjbGdDrGSdnfIGjqtxvYKyqzrGhsUnQp8PY+nKRtxPJ961B3Y2wBYq6j7RX5NUcatRmW9d3HO56gs0PaSNqSB9NdbDDkwHcHkz/qCm/ngOXdn1MSdCk5nhoF1+RW2KqoJgrBSAns91Tpt7XBCRAY7hc9FEvyhPWgWBYY7SSdcyzrwnbtGEPe2hqWS93omT21obStti7bnNYRzOiGTTxqKEZB98Kef2W+GpDgzfqhvvkZLGGNVm5kqST/cSn8/GvoHWILHP1rdKQwbE8naoCnLhho985ANzJlPJTvPxfXMstvoe1Dg/KdyBE0SMPdAgYw7HfxObEf2UDGqyxuUFk02ZgtuMUc8BnFxIWtEF9KEWPzt3Tkkd/D
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:18:37.7987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b63b7357-f746-4d96-d33b-08de73c05dfb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6001
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEzNSBTYWx0ZWRfX3KvMHJO49qM0
 v8lRhka+trc3Ts3DUO2RIGx34ckr7tc0AOxdNYIVaHCwZr1QYS2ArhWEnRPwqVD78y7Hbfu41DC
 +kGoR+WQCLaDD4SJi6x1H6JqAh2PqpkJML5JPfD644BrIGG3jJYWlAZ4k6AR6YdwSGp+04ucWDT
 02hwb6bGNtlAnGnA3ad6m8kiFrgiScAb7e+6zexk4RIZ8tlQkqBr15PvqjZKVdxeAIllLTnF1hD
 FLBscbIhg00mzZh7MHPdN88GozPpdaIVUY946OH9tvjA6QVcIhbkc5SlWpulSs/MXeKS29sVZ/L
 yZW3AxfYqr/Goa43XReO7esurE+x3NLY2xsYHIkVV6vkW2nTaWC6ISYhNZ0kQGAhsJdXBBoGEHh
 tVF+LWkMc4RX/HGpYAOBoYo5c+UlhbmbHswmtgbQvBdAVvaI1KcHXfTrP4qr8GQ05HULbXlKMi2
 D2+pKdN7cJAw7Haa/vg==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699dcf61 cx=c_pps
 a=T6DPE/DVwP9kL+SBve89ug==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=mmtDOMPXX2ZRX6g6iDEA:9
X-Proofpoint-GUID: qSMsq49Vi-zwEh096DgPGrUPyj9YpApm
X-Proofpoint-ORIG-GUID: qSMsq49Vi-zwEh096DgPGrUPyj9YpApm
X-Proofpoint-Spam-Reason: safe

From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>

When the CS35L45 driver suspends, it is put into hibernation, and
the regmap goes into cache_only, but the firmware is still running, and
wm_adsp is not stopped. If userspace attempts to read a firmware
control, it will perform a regmap_raw_read() and this will produce an
error in the kernel log. To prevent spurious errors, put the DSP into
hibernation which prevents access to the hardware for the ALSA
controls.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 7aa558d6362f..a032bb23b4ac 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -984,6 +984,7 @@ static int cs35l45_runtime_suspend(struct device *dev)
 	if (!cs35l45->dsp.preloaded || !cs35l45->dsp.cs_dsp.running)
 		return 0;
 
+	wm_adsp_hibernate(&cs35l45->dsp, true);
 	cs35l45_enter_hibernate(cs35l45);
 
 	regcache_cache_only(cs35l45->regmap, true);
@@ -1014,6 +1015,8 @@ static int cs35l45_runtime_resume(struct device *dev)
 	if (ret != 0)
 		dev_warn(cs35l45->dev, "regcache_sync failed: %d\n", ret);
 
+	wm_adsp_hibernate(&cs35l45->dsp, false);
+
 	/* Clear global error status */
 	regmap_clear_bits(cs35l45->regmap, CS35L45_ERROR_RELEASE, CS35L45_GLOBAL_ERR_RLS_MASK);
 	regmap_set_bits(cs35l45->regmap, CS35L45_ERROR_RELEASE, CS35L45_GLOBAL_ERR_RLS_MASK);
-- 
2.43.0

