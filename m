Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E4A34CFCC
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 09:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840506; cv=fail; b=eIvnweOa0Z/EqTjsDbH6nQrMRSioZfC8gtuq4jStCfMyRAeNm/8qjFjNyonpWGJONV/PpAtOPjBZFmf05aE6Z3BAlX1p53tcba7gbic2gvHC5JnsLVPWS/DLgw3KG1H9YSRx5YtcpcFAXKiY/GYlhrLA28MKvOju2juUOopjsn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840506; c=relaxed/simple;
	bh=0kmRm7eV3AlVTl0HRgtT+DIc1tXMU09kzL12LRK3Q38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TTKUCtW/Var6mNRXiBC7jqp0BwBXcCzMscCtdPu/NYyjkXTb9HJA02Wx1firQBBth+fjuRWnOvgRxo5fFA62EM9ILF98BqGpkcmPVjDA7xNJCB1W3cr1hfjr4ziYA6KdRfUwUvvCo+klmvo/+3mouZtltatsZViQd0rBAqRnEwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lZNr2ycb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dGeQeM8o; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lZNr2ycb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dGeQeM8o"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N5PCdH1162449;
	Mon, 23 Feb 2026 03:54:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=zquAdD31NjGuU7B5
	KOLEb1bKzAYcwhfO+PRGzP5aEmY=; b=lZNr2ycbm4I/v5qD13dwTp/5cg8LDRLt
	TesxijpwzUHLmGGUeMzrcOuCmvh7D1iVoCNkrG5laR8yvbSiOGrCeHm9XgCfTqqI
	+/16sgiRYDsGUhSqPORJCAQcNqwOUV6Y3ZIKNwNd0jj1Dpf+mLVvZIDPGJn0zfIx
	l2qRYay/geaaWJ4aB7ZQhduPTCoPcFKAs7S4UFaI+PyDg3uxJ0O/Xgc+VvepNuCw
	ChJvheV95/Dcyp2HVXL9EohUpzq7FcWfFfYdcKcwhlfrIoVo7tAmAXdlb8+hiUaf
	B77VSPK6pmRpQ3aOx+Dbd+S/ya/xSTrUGeIHiNH/ThsaxtYFr6AEnQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022138.outbound.protection.outlook.com [52.101.48.138])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j1cgj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 03:54:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Idd4wNBv2DgbmoOoec0Xzv9JOV3bWyhr/CWMhTef7yCJAmIraxnqZdALjoTiSYwbUaS1afJkGcFqfcfjXSVb3p0tWkQrRZBRAwl+Vsg311/msKyT6iCpy0DCqHzQ+AWiH8Q9fUU3drPcZgq9oecVZT9XFnpXidv7pJfWuCaoMLmgtfLAukLkTLX6mi34WduOyXV4ptsmvT1pKwScwn8/ME5d7erRIdtnAteREZJvaTPWVttFr7W69GBM53ffIj4TlK8axQAGa3Mr+FZzj1xw6IugUgjnDGFTgUDZOi7dyW0+y8pzAN0Nb22GaGgb9dXxY/gdFvMmS/kaouw60Fvopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zquAdD31NjGuU7B5KOLEb1bKzAYcwhfO+PRGzP5aEmY=;
 b=PEOMmp/GZ3PRsIuUcWVEwJ0A/IdYWL6wf7faT1Wi6N35KUV8AWbb/tTRsr08Z7kATYh9ebh7iBBB1++atObzap73ANQVsivTwZfhhmJwIg8lv2Lys/xB39foBXHL0yS8zaWPaeburRkBs7C+pHtfQvRMysYamUfY/g8qxDAH9ZOscmJuiloCASqpZWwn39lFgP8nWSksu8L2/J4EVmMPS3IOAaYuTzr//3ba3z6dtrUuoIcfIevbGM+nkvPsPFSrM/xoYgddeMcQ/iAhd/Mh6zR8OjqAJfaeE4Krra9Nsh63FTDlB8Adkih3WS0BqFkhVFenwMYyNuzIeGfgKw604g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zquAdD31NjGuU7B5KOLEb1bKzAYcwhfO+PRGzP5aEmY=;
 b=dGeQeM8oGSA7ppjeLA+Zsp6322pH+Xb8ubs1nEaAQrINFKNz3bzC0k2Dc6a+KcAT2RarYdo7QvkfflQ0ajYMGfYKqGPKDXIfLsy8lpF1b/wgF/KhR6l5I0bGtaAXZMK+RwI76LdAeNOxnS6enmj6CoZGV+fQE/ymjfma2EMXtyA=
Received: from MN0P223CA0004.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::14)
 by DS4PPF614522EB5.namprd19.prod.outlook.com (2603:10b6:f:fc00::a22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 23 Feb
 2026 09:54:33 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:52b:cafe::44) by MN0P223CA0004.outlook.office365.com
 (2603:10b6:208:52b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 09:54:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 09:54:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A5E3D406541;
	Mon, 23 Feb 2026 09:54:29 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8C2A482024B;
	Mon, 23 Feb 2026 09:54:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/4] SDCA Improvements
Date: Mon, 23 Feb 2026 09:54:21 +0000
Message-ID: <20260223095425.3905703-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|DS4PPF614522EB5:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2f0804a3-27bb-4749-9e82-08de72c18a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7l9B6Jl3dpn/Z/y94KOyH+f8qXhF1mSVNNzTb/Uyi4tbsmiCWbOybKk0yAjM?=
 =?us-ascii?Q?INOcYcPG/Aq2PU3topa5VnZtwDxHCyrZUy2zhhZMmCsvU4PKI6I1aBTTWEPG?=
 =?us-ascii?Q?XR82AQj5V+qXL/1OSskA7OLifXiOWwA2FO+7A9x7kGHXtlHq6I/dHyVxPEwp?=
 =?us-ascii?Q?7OaGOM8Fo10hlFNVTEEJQfaOqZkJ75OEJ56EQw4usXeJNg4Pmk5GDkZkKoxH?=
 =?us-ascii?Q?aukyo6MuCG6WHE8rDYGLGeNYz5nzx9i2QF8qAiE64cMnIcQ92ElW+R/2+suK?=
 =?us-ascii?Q?LujFLxA5bRr7pFhInBCuWUDAqanbFTG4aeVFugA7LipmryzhwNxRZJnsV1zc?=
 =?us-ascii?Q?N5ixAeAvbfG6CPofhvkxWPxrItmiL3vLrn2URYlSuyau1IjKZatZApE9MP2U?=
 =?us-ascii?Q?/nvqqfI+AG85QDo/qK/HE0aIFxLJDvfG/W9yMVkayGFDcgIlz1nfBOo13mYd?=
 =?us-ascii?Q?99O8rS9sBXPYAx75EmydTOigPqCugkVYIEF3TEd4FFCMGgaUXSk9mXKJYFZ9?=
 =?us-ascii?Q?fhh1emWH9jqAuYJbf1zup4eBsKSwGCRL/4RJTuzdp/UEV1XQR6KcuSG+gY4l?=
 =?us-ascii?Q?2KRPmmYi5kel+uqXmS8ZyFrOoHCVcJx+CVECnINcn6hjVh1zBoJ9AW1LlSz6?=
 =?us-ascii?Q?MVkwIIcD2sEATrdci2DnMjRenfE+jboU9uLhHFIycGidn8WjfPuYKBb9qY4R?=
 =?us-ascii?Q?I4RzgpP1jeFYWt3qh3YBLmO6bZE3ZX9sOR52PJM95rdCKIUIx30YJNDLIBI0?=
 =?us-ascii?Q?VkmEkK5B3aHhvE3d/Bt6mJK4lIU73dac7l89+oIFiwvpPP95YjVhSk3Q36j8?=
 =?us-ascii?Q?/NAJ3CxkervtlAXErrELfiSnJTinj7hOoWxhFyLFrYJRwuUVMqNe2ubwNL+5?=
 =?us-ascii?Q?v5fHw7K69ptvkIKtlCJqQJZKrwHkutIHOdVZSX/7NM6QPhw9AI88qjFnqQlY?=
 =?us-ascii?Q?TGnqNLbNw2K0qTLJ6E2LnPZjIZ11LU+zEAgTb54/WZoeCx06+kzoYaWFhkKB?=
 =?us-ascii?Q?PGSnHuYWui+FwIrG73UlPLFvdcSgLlXPGG+iXMByHqgLftSdtvE+X1z3wUjo?=
 =?us-ascii?Q?Y2fLsXZadpkGFEdH658jGYGlr1u86URabfn/5BWlmHuCHA6PM7Qz0E/VOsZn?=
 =?us-ascii?Q?Mx0sDMFdRLUyVr00aWuAMRQgEnQHiFOa+NbDjChQL4uIH0EJwUzPU/Smb1f+?=
 =?us-ascii?Q?GEnMrN4PgtNTdFCV6FgvBKYkhMc0VD4Vs263Asn/q1/U2roWClmFMOdZ3B7W?=
 =?us-ascii?Q?RaHbLrphbKW56JXd6VQPw1tLHKWg+CIDuq5tdJF7la+EphVns9Vf9D/zJYj0?=
 =?us-ascii?Q?gE42JQDqnZH/ZjUOtI8qv8Azv7DQmczP2W29H7mzCyvtpQLSSpYEsWFll9DB?=
 =?us-ascii?Q?kGtdV9PSNqxwfCpd3usjhfWGiAOiN/27rXOsCjCwiG4wkfunSbHi/Lvp7isp?=
 =?us-ascii?Q?ZgJWUYZbqwPoi2tiAKjMy20UVbelfGsO8WpHmxdR8BO3KnNchFb7KX1dpa6S?=
 =?us-ascii?Q?EPIPU1aQR2S0tezLQgw1G0SUlKy4ZsAyChInzP+z/PsDWP+TeOvoCcaV5lFT?=
 =?us-ascii?Q?9swZDYncOdgoedFeG3beXFIFLRDsXh8UsMUqU6WqZAe/LCZVWd36xsto7DGn?=
 =?us-ascii?Q?um9kr26AB2LGt4sZiFf2Op7lEamiwx68D0YhZv+8y4K6rKO3OmqVPfpVkbxQ?=
 =?us-ascii?Q?/+04VQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EHeAkE50PkHFyijQUdlUOUsDSd+o/hsbkHSOSIc32EoZKYAYkgTVkvid5cQZb7eMURJ1NVVOSrtpuV55sZemLro8vtEnTh8sefv2OAanyVCJUIWbRYDTDAK5C6/nEB1L3Zbm9+29BxD9PRlE4p/EuJMTUjhl3pFpXbQ6z6SSSpF1rpS4m3nfUP77QujeW85399qbVtaW3/SJSVXQWc3aDyZMVOAbTaeuvQwfaebO+Dg4/B1uLCbxOpbPQ5kqnEvmGRSmKbLtOZdmMXGLpejMsIwn75BRqqNO2MnePNGCtCkgh6kFrMBUyN/xLZR+Zin32W3JbZzXrNNdgCVvgY0pOgPxe4cGfgMRhbX5IHOT71t4DkWRQ6aXyMhnGXrjjxwdGEDYXYQmv7aF+JWopQ3/oz/ppmABVRyNdbHdbRmpKL4QadOLSpJt1+GmaC/wU5Q3
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 09:54:30.5403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0804a3-27bb-4749-9e82-08de72c18a48
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF614522EB5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NSBTYWx0ZWRfX4orvu1Q50f0c
 vnaSAWR2Gp8NAIYPI8dcTbqckf+1PFyziiLyLUYFfbCH+C0u2lrumdifo9h09wSmmPP3iXwNa5x
 pKRxfuJyqQwaTpq6w/UkUXUjTT6IwdKcm08sZaUjsexGn0iwVb+urZXxP1CvaT3dIIr3fYbwgQZ
 3uOaE9+V36Y+wW6aLtbmNGaYltHWgk5Vr+KHirpjAGaobxcu5XFXp833XayiOSGa5ZX0+Yr7jx8
 loPWA/uw6CxIGkPaTPfdYLvvvGOkDvOaN10E+9iIInnk7gwpk7t5owzPhzMZWNakSlp7W9MCkg8
 g99CF6KwvFqn42+V2M4iTBn9nRdTHARjxcnB15Xb0T5ndfEl+v9dTZ4D+nY28Q7YiMow8ycc/dV
 pi45nUgtLRE3rR2XjC5rQePVC/KQmomHV9/UaR8K5IWPJh7B+pnmBHathEQOkgKP2eFHTvFpoH/
 ZmYIZRqU/A11s6jAKNw==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699c23dc cx=c_pps
 a=9zj7lKEKmmm8jlyvJfKehg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=asi6uZS2-wUlXNMIIgIA:9
X-Proofpoint-GUID: za-S0a3-6gTiNvO_Ep2eFDu9RZxwsUgk
X-Proofpoint-ORIG-GUID: za-S0a3-6gTiNvO_Ep2eFDu9RZxwsUgk
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

Charles Keepax (4):
  ASoC: SDCA: Add default value for mipi-sdca-function-reset-max-delay
  ASoC: SDCA: Update counting of SU/GE DAPM routes
  ASoC: SDCA: Improve mapping of Q7.8 SDCA volumes
  ASoC: SDCA: Pull the Q7.8 volume helpers out of soc-ops

 include/sound/soc.h             |   1 -
 sound/soc/sdca/sdca_asoc.c      | 114 ++++++++++++++++++++++++++++----
 sound/soc/sdca/sdca_fdl.c       |   5 --
 sound/soc/sdca/sdca_functions.c |   6 +-
 sound/soc/soc-ops.c             |  63 +++---------------
 5 files changed, 117 insertions(+), 72 deletions(-)

-- 
2.47.3

