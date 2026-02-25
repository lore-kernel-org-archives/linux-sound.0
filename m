Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161A83D331D
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 14:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772028137; cv=fail; b=AEfQVrtvgHzQDo4k5nGDxkguHHUbQdHFItJJz+YN8DBRWN+uK7nkKufuFnpLHhlbnkCsUxC9DSdW2v+T9mznHomKh8nNCwMnPKDDXjguXrfOtWqaVTcBYNNy+fX1xZvpbnmYYfYNjhLigtWqfHkTXLo+AjxiojSlq4UTQ+ILOp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772028137; c=relaxed/simple;
	bh=Ji8PkusCB0wedwyxiI5YgsTvvuxKN/tIdh5d778O+PE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ueHQzWX005xN9saOcHCdCzZAPKecDM7Ks+jZjTg1tBcCtTZiHOU/ed4cKJ0lZb9kUpeR3kd7Ysjo2cLsEexxWNuOqV3NEguzLIpaiAsJCQle8F3rB2ZS1xoh5f9ZSCn2+zDVpaGO/C3KBCMgxm3MzzRbkOWQOIDgKULfpc9ypyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Y1cPsWEV; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=E4Ef6m8D; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Y1cPsWEV";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="E4Ef6m8D"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P4kK3r1886709;
	Wed, 25 Feb 2026 08:01:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=OvKhZTUME13jhCvo
	Qpv4xHN5WZUb/HU85chtAjl63R0=; b=Y1cPsWEVidmQ+w/MFtZMCJay3arUlQuv
	xaAc8nhs4K7WxM/Z4svBsbjGB+AhgZ5vhSVS10Cksm+WJkmXq52UX3NBcgNuSPQ+
	OsmaArsBGo9vAOtnYNMgyd0NHyCUk3CMfFqWi46eZggifpuUj6nJcKv8wAgn/KxT
	CtX/3o9Q4iy2o63RgLoHyKbXcf7soeCM/ufweER0Gt6uSOHs3jOQi7MvvvkIjrAk
	4eTLB67ID04nzY7khPHFkh+eIfSj8I81V/fiwQTWog2td0IwHcYmC2SfiC364DDl
	efrBxQPLATwyFrZBqLNjgHwXDMDeKmDvwCG4k1c3fMXNRTaLYaBqVg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022136.outbound.protection.outlook.com [40.93.195.136])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4chdku9f0w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 08:01:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2EBA8OTVKIFwS0OEOQ20wrgL0Ujmzy09zUWfNhQs1rruDSdZQ+/3I2jJtuWDHQAzQY78Tk9onRjduBoXlYZrQsL/+lRpO5EscYnvOLVeFq733tDrLPyom32lZV2cXACP24zplxDV/p3fBqzbzIbnLxQ2DAcnzJD34S9qN1r41PPTbDthK7u4Loi9estjlfWwPZcJciV2neKIX0ST/HUTxhDL1er+9vyLym2K7bSpxATatatlj5sMvkv12Sdcrze/enehWuLXpIfenlmPu/lFWt9VeVrdLm4cP2uuhznVD9gb4wRnfCHNwiJbqfb/8S0f52lPAE7DfI5xSV/V/sF2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvKhZTUME13jhCvoQpv4xHN5WZUb/HU85chtAjl63R0=;
 b=MJJmv7nddel6jMQhtu/UhXbymzMzw2SIqxPa5VlN4vEuhyB2tHRWH+xHdhHsbn6LOL6Dcfm4gLTegTB0Xcay1vhHQIXK+vWbyy+FF0ytz8CJJ9BtMPtH2Wz6y0dBYPpW+HtuciH+fKY948uckN+36BwVrT5zgw8rixbvCv9jEyzh736SY0qU2GcRV9mwYcJ/w9QVDZ/kItD5ZY734Hg5BOTxDQ6cQzh917/Ihm7VO+sh+dsNMPPdOayrOtqo5tR95LgKTETzTVGSKj2Bud9O4CrvnFl9+VhRLlb552O/5ast4efkuXibtpLiBEYzAmrfCZPKOr+W8gEbkuqJvrYD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvKhZTUME13jhCvoQpv4xHN5WZUb/HU85chtAjl63R0=;
 b=E4Ef6m8DoXZpA3/35byPEr75IJbyNB+SqEpP6XWB9pX1VCdfrOzlToaqMK8iccn6XHElkxTCCllz/F3478J6kAES1csLt5FMBR5Uur3cZFQXH/Sdo4PgIut6ALM6IVyPI4NomhTCmnKziQAyKgel2WHhzZqhnr6/ULxPzRD2GLU=
Received: from SN7PR04CA0203.namprd04.prod.outlook.com (2603:10b6:806:126::28)
 by CY5PR19MB6266.namprd19.prod.outlook.com (2603:10b6:930:26::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 14:01:25 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:126:cafe::ab) by SN7PR04CA0203.outlook.office365.com
 (2603:10b6:806:126::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.24 via Frontend Transport; Wed,
 25 Feb 2026 14:00:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 14:01:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 46513406540;
	Wed, 25 Feb 2026 14:01:22 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 22B1982024B;
	Wed, 25 Feb 2026 14:01:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/4] SDCA Improvements
Date: Wed, 25 Feb 2026 14:01:14 +0000
Message-ID: <20260225140118.402695-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|CY5PR19MB6266:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6d6f62ba-0b66-42e8-3e3f-08de74765c69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	8wyOFfW5RcL2c9IlvsfCuh/Ic3i6+Fa4uIbdSTKFvXhBGkt8msSjLBGJqK0kplcE4HIgyHJ0xslgzo8rO62l6Jm7yFqKMBK/khUXPFg8cuOWLaYj4PexxBWjVBAKT0D5e6TUqOfO4yWChH7hddTyfx/mVJl6Gw2KyZ/s5Jhz98yxpAevGwW2IcwvVxbkrPLTnl+qrtgnZ15TRV9yHQQ+/QZY5Jr3TTu+cFGZqzVmlnk/ebQ0nMhsQsXTj8FjRbSOTEOHE52fq+CK95XEOBQM14wHz+BDFe4wBxUdlizNVzsHdhNtDpV71Y7KeinRWkLeF/YjcI0h8VrCkqxpgcLPkViKfwBQm2epTrOXsUNzkdwc9N15c7V0Fh2/1YmZtNWxK1A+Nc69Ey151hJQTUlrrthU1UcsU5fVVTOpqB15dvuYVUV2UkRMzIbzqP3Y7ujWCaqLbMy42BKd0lV71GM+ba5A1gtBOJ8M+bzUkWt2tx9xtxhP/R9NV7thEgPFi86M1UNmhTGt8vadoLcdW+FN1r90KLCnXo75j0skyJYhQEWktngkM/wljHhNP/A/SSZqethvMBlgrFPXyf9fbUPZ8OK8hBK/INr3X8lzLPoPOPTAG1Y4igarolge69QWvAPE9lQeR+dXFc1VTj9GHWIBbIsHj3hcuZUwnYUkn37k6EkDq5cstrbT2Bsz//Z0JIqV+H48YWn5zrHELf5dYT4bpf4WPV8hTLyfAb9ZkmQvRBLFjig4CF93OqV+8hqOAm9ovcVmlcHYf+Bn7ocAdkCw5NFO/69x7dzDTcTDEyvHjMfokH6KdIrVPkfxq08f73LIGQ/9y1EMzWQxCcoUh0H/2A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/ETYE68FaEfUOIuARzy6UQ2o37xiNjgHzRALKgAP/EILVu/4Nn0nizHOqmoetTBsD9AofxaWMgDmE9P0VJ2ZcoWJkXRbXZFHp1DZaJFYy6oe173dT6liH/xmbiUU9ColSgLQdB7YroO6VVipDRis9db9vQmbKtqxdoZrnUlFO5iU6uqksOxcEsKK9GVHNqwoZRdsMuClWCSHD9YTJVAoVAso/pg1PN+k1CKhyG7CGBDBet5Ag3b3NjabxQGcsoFa3ugHfKWSzO1O22XHnOs7W9Tv1ZXKkQeTfCgXzb5zxqunoXMRG9QEaO2PiWy5SXV44TlkBHWMxxNSXRRBtZrq4lTtb6Y+IU0jsdBjYixQqz0bVOKNgjS34i74s+ghe9xgIvvfdIFBwuqwlzosqATgxDGgZdHl/M2dHCBZ1GesVqtZ2myS4y6zj1KGM+bXIq4E
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 14:01:23.5701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6f62ba-0b66-42e8-3e3f-08de74765c69
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR19MB6266
X-Authority-Analysis: v=2.4 cv=OZiVzxTY c=1 sm=1 tr=0 ts=699f00be cx=c_pps
 a=2hJN3FG5vRdYsizhUtvj5Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=asi6uZS2-wUlXNMIIgIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzNCBTYWx0ZWRfX+yaSfvZInxCK
 BnRijMIb5VRLj9gPJqZGO1QJNwhOQFDlnwF6N8IjqsBWdYsc8H9iiqKarjOP3l52mV8V2T8DClI
 O08bsbKNjiKkzyukQfK+g5CipoWKNG2/6qd/Izh1nP8qmp+FmtmmFDBLCmFAzuOap0fxZAYJ/+R
 5/QNBV6aSvaBIStwzogsYmQtKbIwJZdO8/vMjYBPAKBTXokOmmsrqq7EYs9g8yqTuWlcbRlHGXU
 YimYpCzJnagJYtDT6IWV8hYSNGH5oeH+8WtnnQEzOaIFA5DiPwuetzXqmiIJJOtKsi+mDojzsfP
 NYr2htspImz9L8cibj+jzUFuVuUdKPqJSAdYIBS78T45Hj/y8tQojhJaSw31kQ96I2SEcJnXTCO
 FWzj4RpwVplsupbDV3Xo8EKdlnrpRdHc7QbxczZk2zPtoX4y9C3Ehvnla+omJaZki3n2UcsTPpX
 c4piqOyoaEs9cAUybSA==
X-Proofpoint-GUID: c75uYhOxCeTJuEwQoHZCbzYzmRAcTu-X
X-Proofpoint-ORIG-GUID: c75uYhOxCeTJuEwQoHZCbzYzmRAcTu-X
X-Proofpoint-Spam-Reason: safe

Another fairly mixed bag of small SDCA fixes/improvements. Fix one DisCo
property that was treated as mandatory but is actually not present in
the first version of the specification. Fix the counting of routes for
SU/GE DAPM widgets, this currently makes assumptions that are not
guaranteed to be true which can result in too many/few DAPM routes.

Then finally a couple improvements to the volume controls, simplify the
mapping between ALSA and SDCA volumes and pull the volume stuff back
into the SDCA code. It just wasn't sitting right with me that it was
being handled in the ASoC core given it is unlikely to ever see any
reuse outside of SDCA.

Thanks,
Charles

Changes since v1:
 - Fixed a typo in the moving of the Q7.8 helpers that meant the mask
   was uninitialised resulting in much doom. This is now updated to
   match the code before the Q7.8 helpers were added.

Charles Keepax (4):
  ASoC: SDCA: Add default value for mipi-sdca-function-reset-max-delay
  ASoC: SDCA: Update counting of SU/GE DAPM routes
  ASoC: SDCA: Improve mapping of Q7.8 SDCA volumes
  ASoC: SDCA: Pull the Q7.8 volume helpers out of soc-ops

 include/sound/soc.h             |   1 -
 sound/soc/sdca/sdca_asoc.c      | 114 ++++++++++++++++++++++++++++----
 sound/soc/sdca/sdca_fdl.c       |   5 --
 sound/soc/sdca/sdca_functions.c |   6 +-
 sound/soc/soc-ops.c             |  64 +++---------------
 5 files changed, 118 insertions(+), 72 deletions(-)

-- 
2.47.3

