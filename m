Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4736B3D8915;
	Mon, 11 May 2026 10:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496124; cv=fail; b=ieuBxnTkwo9hubdt34rmOGp4UmOzv9WGazh9dghM/kSQubbN4OvsVGHD2kN6XmMy1CJzLBQDv+u8wlpfI8M2qpwvNuF5HKXEk43fnPu+ovjiN7tz6Yn6DS/WAcDCyg/xRqLGLi81pJMG+Gw7ie6/RbJojYNYYcMDqJNDyIeOWQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496124; c=relaxed/simple;
	bh=Cg3SKbEbML9xn2WsCqCTVkzxYR83k+uBnxCWg+qY89o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NMe/U6ePz1sl6h9MWrCeIhBQPfXfVMaQsvI6IC0y+Pu03/h94NDLeMkuGYYIiYoIwe2iIQoCGCdgnCSJHWuWzyrhFnIqlJkEhpDnrlJFj0NmKTEeNfzRHwkqHz9u0qy+6GfdkQUr7p/UlpuE8+ep35QzRKpbj+ZXkC0wRMkFyB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=eUET6Abo; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ED7sMayx; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="eUET6Abo";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ED7sMayx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5q0G32674250;
	Mon, 11 May 2026 05:41:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=X/UImDxgjqKtYYPO
	jILDTlqX06QE0XgLcrddKcddqoQ=; b=eUET6AbozitV/jfB1jrWMrcTnGm7z+mP
	U2usmYTrHVL5JviHveIyeV+SVFReStFEOuGVpaCELKlO+8396wBqmITP3TInXTHL
	QfYFQ0F04wo/FRtyGHFUE9vWYw9hqHp4Ftl1GnrFtCE0XxfOPI3QN8ZZLRBX7u5E
	tGlNdsembRjUwop4+3JxpV9b/NclJ24a2jlG1+GF23/LDP1KYMy2STa/qLvNtm70
	BJDYHXk2P/Fstrahu5nNF5LnuZEZyK9VeHKpQKvc45pi/ekEAVhzUYMvRYheuw7q
	7Lc5TswB4jZA5x/LgMRG87bdJPVbvwb9i8GAWcxCJvTVAch59T7DIg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022118.outbound.protection.outlook.com [40.107.209.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e21bfsrkv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 05:41:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nnajgp+5ml473MJtfTtdG9yxk/w5MyE94CzHu8VsFyYOVOCZwfRiW9z/HVI0PfIKRXNCxM9PbdVfloGxTYXCfG0HxrAtq8HMZuc7/QVu1Y3KJISJuPO5IFHRbOu7ZKn5eHMibYAN/HMmoLqviNkzWE9cqxuRxmqiUbp1/G7k31Y21bEBdEAUqOyCeIj7FMMrHhaXRbnaAB5j0uYyaa1ndOVS8yFDn7qu/kPreStXzMtCdiDz8wE2bF0aT92ooNR62UGF3enX+JPt9+/bLBIfHAmKpLkSpcZm1dr94QARNmoyTkHZM0y0PY6Itx9i/+8AJy5J3+a1wTEYfwoYeDB1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/UImDxgjqKtYYPOjILDTlqX06QE0XgLcrddKcddqoQ=;
 b=K921zkZWbvmprEtVveMdsCFDnmknRIne7Zf27pVbLQPpauhTcm+LPQvSkMCkaI3wKPfZp8SZwx1X6MVzPbk+U/QUqR9svGrv2c5itzcvjg+qQrv7CgzWBuU0dDe9NMnxz++78PH1cB9jSNpRGrl53QhpyeDYp1l5CWyow4dcdWprwBdsMRY9ArYJhSlnN9NW8sWT3QB29EgodLek+7wr5Kjl7Utsq8lEVB823jBvmZcyrozE4o3Ya1ItOdcvWcaF7RCRBmkFmlHewEYOpGYbGeASIzdlxuE1RlFydPLHXrr8RsUIJ2sFXClOW+Aps65eEjC0OpJ6VqZo/5h5IAJ30g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/UImDxgjqKtYYPOjILDTlqX06QE0XgLcrddKcddqoQ=;
 b=ED7sMayxVToEK2diCLjLHGPKlH1sd64p+YgnlfIrlA7IK8Gi0K1bCM+8zyeAvW8dJ0mMdPutxZb5u8N7aKR6KxSK66pYBGcpKs6gFFgVjqKmyfXrNXw3uWWwPZfgYrESHFL7Dvkqv8rKxyB5zBYAomcHfRzQ4XbwjS8teDh1FlU=
Received: from MN2PR01CA0045.prod.exchangelabs.com (2603:10b6:208:23f::14) by
 CH2PR19MB4732.namprd19.prod.outlook.com (2603:10b6:610:65::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.23; Mon, 11 May 2026 10:41:50 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::d) by MN2PR01CA0045.outlook.office365.com
 (2603:10b6:208:23f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 10:41:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 10:41:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9EC7A40654F;
	Mon, 11 May 2026 10:41:48 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7D73F820244;
	Mon, 11 May 2026 10:41:48 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ALSA: doc: cs35l56: Update path to HDA driver source
Date: Mon, 11 May 2026 11:41:48 +0100
Message-ID: <20260511104148.36382-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|CH2PR19MB4732:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b4c00a5a-b053-4f2e-3009-08deaf49e836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|376014|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cXGGlWs6075WMGwuaLa0tL+Bt/59zGZ0jUO1Kb/0j8IhiCcUCNJEI012L4TKyzHNK+5K+MZZOT7lDK7yO2+A7EpIj7tEZKiZ6/z+PEDIEITlt7ZXbZIZThoEWu/nMz1pq4Ex+AnxTMDGXFrX0IKhGHX0fgugc4BWrfH9RwZ7F2QghDbf9Zd9HVpGN9j1SCqpGgCp6H0vb6S8evhHtOzSLrTA3z+q5y3oIQtP31m6utNpbvHP23OyQ1K1Nbj5hQkgdU7nhAkMh4DXy9pLJWZ+owh25Bt746qpvC3QYw3i3GcsOYSUyZ3xq+QuyV4WFzr3OC8etIr3I+QhNmzFtf/Y5dpRgV5/4ISAFzhX39+oLZCf71UXwQPGpHRo3AC9fqoz9QpMhLfSXFygZC3gzHSoR+qH6UbDJd+OeeOoyM8JO5a48l9FRDW0LYzAVSeCQIKm1EPIO3psyoP2q0A9dVGCHmmClMUTVcsWPDERpyDv9OK16WeDZzW12RXPiAwigjHmMglZVViulFHugijo4pig5sdN30h5AOs5UNzMokMm48an0jFxq6wkYfFKGaA6Gtl+Y09KmUm3wRFrnqULND4OMQVlRT9RWrAVvvwA2tNox5PgHu23qG1job511zAUclvyeBP4hkN7ZgYUc0iBXuHLXqNOwqj+x0d3+5ICIPo62ZPDh4oxBCL8uohw13hjhfz8LBgMqYoncwsoet1HzxRkDZ21FzrWU+ftqZWfAqXhGWQ=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(376014)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7Nf6uBcsexCeE04Fb+AmZpfc3TNAQEewXyUofD+oao45B7JJIqCSNLUm90rR3uvl4bGYKHNQ9NhciolV3MpyMdI+ELJUvUJoLAgLMDHv7no7+vCppvE2HKm3puvK06OV3fu1wlP+uNg6isAgDvBA8Owo9IiZEU/CTYS2disNOm/ddFl9tq1Eux4aJC/NzfmqsTjGh1RAPbHfyYuI169MFLsfRURRRuLKkVCkPCbOuNztFTj5zHwauuWp0Vcl7rMcXWhgfUHi5ZNTUB9ChsM9tFXsXZLJb328lNugyjNHF9h3q5jmdUXiSWBjmUEp2GGxYNSUQe/8H4nSBQUj+R9/I16hkBYoQSM4pS950MmQEKbclWxl7Yq8qQHxhr/3dJ95vsU79sDqJ2BRM/Njv7z5azyHXdohQeXtR8opEIKEFwQMIZOl9uWugp7oeT3aKUBE
X-Exchange-RoutingPolicyChecked:
	qYjeu+5BGgVfqMejVv+ksZqOLb2Wp9LOxN2CRp9ZPRper5Gy1yynPOm7VhYhdSaiBpwQ95YYNFHReSyuXe82r+Brz7YOGly1oRjDA1f4S57xM+/roqK0bToXE4L5ZLCrjg9mj8MwDH4JDKR4gWTMR8u/NYhfQ/MFZ4s6+eaS7rlxXzo6YfsYHyuoi3ld+SWQMexK3JzbkDvzDnuWjNPYUYaIrlFUnnbD2Sv/WNz9xw5cHxsvGnSuQUFZCwWXwUGT4SiFicxGPG3aG/V3lRa2rVx8T8k5w1RVp9zjzHHHEvsW7XMtFU1/GAdecv4ydMrOsw1kWano4DdMTIQs6yedeQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:41:49.4483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c00a5a-b053-4f2e-3009-08deaf49e836
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB4732
X-Authority-Analysis: v=2.4 cv=DYsnbPtW c=1 sm=1 tr=0 ts=6a01b273 cx=c_pps
 a=X0DbKXi7RYM5x2NUiypu8g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=sUh1nREonIsy9h2HkfYA:9
X-Proofpoint-GUID: UTXA5zQE04h9tLS0UBA1CYRqbGQKdDEk
X-Proofpoint-ORIG-GUID: UTXA5zQE04h9tLS0UBA1CYRqbGQKdDEk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDExNyBTYWx0ZWRfXyg5NQeATNXMz
 sBcm3B+Koa5JJBJtDBhFFl2r2mGSTA1Cu5WiTIA3dXDSn+fwZU2DMsb+rvv4MZE1EkPlm81gdUz
 Ew63XPe/ho/jG5FeHlWROvXvjALxSNGs84LLvRI/1LSh6Zf6MUl5a11hlzuj3LgRmaanmmf+doq
 3Gb+fAKAvvme0ftVdK0AO5v5Mg2r+ZdSoKpgwdw0M3toG3UOnT4cAAq5ObXm0+KGA3TgnGDif7h
 wu6ZqP09akjPpBz8trngUCNHFQp9fMsDoSVtLveZ9Ldmh9Qt+Wus3kdHM8CBFpi60nTHeEfcP5M
 cecT53L8ODJosQU8QuZnlOHhrmXKZLT2r9mxArkxv3cSjDG4VeMwmxchCSmtaXwtlYVShkvEKZl
 quGe0zDDUFroTZaJoCaUU+WUxSb2ZB9C/gbGA/ivVOcM1+vTYVaTHk6jAh30qGcR+5W/VOPzsxG
 aEBuMHChNMIC9ZQIznA==
X-Proofpoint-Spam-Reason: safe

The HDA drivers were moved to sound/hda/... so update a Documentation
reference that still pointed to the old location.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 Documentation/sound/codecs/cs35l56.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/codecs/cs35l56.rst b/Documentation/sound/codecs/cs35l56.rst
index d5363b08f515..b3f8c1c23851 100644
--- a/Documentation/sound/codecs/cs35l56.rst
+++ b/Documentation/sound/codecs/cs35l56.rst
@@ -40,7 +40,7 @@ There are two drivers in the kernel
 
 *For systems using SoundWire*: sound/soc/codecs/cs35l56.c and associated files
 
-*For systems using HDA*: sound/pci/hda/cs35l56_hda.c
+*For systems using HDA*: sound/hda/codecs/side-codecs/cs35l56_hda.c
 
 Firmware
 ========
-- 
2.47.3

