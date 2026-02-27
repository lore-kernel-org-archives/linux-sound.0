Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E506B3F0765;
	Fri, 27 Feb 2026 13:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772197355; cv=fail; b=Z3SAKYya3MJyEdC4UHyxpJ6q/quR1ZO/lfrhzNjE7KOjObDdtc0KHF/oOmZELVepQvvkLsQfx0fkr0vplMGv5SPD9MUh6XYCGwEWUGIDHhjU3irKphKjQsPA45lXIh483JMEUXfnPElnhmO6eP4Do0nHIq1tOK7G1n/dppavv3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772197355; c=relaxed/simple;
	bh=pkoPzOtpUNO6HUynnj1SaKZGhJN69/IrEFI0c0MyLRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fFxQKgsTMqkQYxCRiNnt4FMkVuVMCMZpdvxalUiGZU7JlPS1MxuSTIQTrTOkPbvWrYZJvMNvIc/Bkwd0QsfIR7psqF4NYnGYy/Pralsklr5U94V5QHSMHWCdUhygwY6J7pVHBlZ17tmxZUE7ZQQA6/eJ8IHwa4yCZr+jJweT2i4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=f750Wuqb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=uLUyTWQv; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="f750Wuqb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="uLUyTWQv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R86S0a2680887;
	Fri, 27 Feb 2026 07:02:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=xUoKAk4gIbr8LqD0XOXVdM/gaDTPzywNDJ0Zjw8L8d0=; b=
	f750Wuqbr58RT2j90NE6mPuJtMNKUGKk9FYJhiZ/IBA6JGf8g+lnlRYZfyoMv/MV
	QiFKDg6DWi1Pb2dcO+OMzM35900TRv0cUCdayx+P0HxBDAk1CK8VUfQib9hkEYSm
	a4I8cEyFEhZpon+rD+P7KcD/jJjF3D0EcZodQs9JTZ/ycCafsSZcJCCuJbpcdRek
	SSCB+1qoKxHu318sVw3r/zw6kstbbGUVpk3JPwYHQOnesVwzswqZKfUd6vR8VzUH
	o9FF16nVCUeNUqKXaSfYnQfNMB+2+G9x1fez6bndgXbxUEO+FK9TIyTeXql9zIO4
	654B6WcAR/PZPTmZI2/l0g==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023094.outbound.protection.outlook.com [40.107.201.94])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cjmds1fh5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 07:02:21 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWeaqo9sAEt2e6s92AxE9rwieswEnyrpKw3TcEwH2SnoICYLmXST/tK4s1xd5E2jJ8bZ1KsGdMNZs02S3pvhamjpYVXBR5zTa5lcyfPq4+G+VODq/pQ2RVtkKrXCnDNCV/sSChT8Zhh95LqorKajRM4bFrHhNNHhUHdDLIpVuy41s+5wrARPiP8Ed/MdNlkmSM9mXa0RO5V84h8cym6hfSaJoZjXkWeU3ZinZckpBLnHAfbRic9HydQrM7cKuZ6/wbi6sNZyWpa9CevUgOJ0kNuo1caOCX9Rx3JjvR7Ht9vl7JcMiyclhTHZ9jj1c2dOZtz8qjFs9mJSjvhfPQ2seQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUoKAk4gIbr8LqD0XOXVdM/gaDTPzywNDJ0Zjw8L8d0=;
 b=ANKBmRQvFhdcJ9D/0sTMKAWu+HH7+aZLDANrz0SgD/y7gE/RRirKpGoUhwNQGzD7sKxyb+kirilACenFat9f6vFSt+feNtQrR+5dsXHMLFQXCESI17duAUZBX9KXKxzChUCFElVvDC5w5nKpKiHXzJhmOgh53FdTSQ3UyI5KfDfeV/vpc5h94Yyg0EPbJwoA5Tb6Kt+0kYN5+6guOmWJafW7BrFZddwMY60AhFlRT98YXRAzKHLRmvFkXXhl4Arj7B61Pea12Zg9XDQ1XfqYCkuQUDoxnnOozsm7DrA/OS3gHQwrz07rs50C4/WZWqd/1Eemaaywqdwxv/LoCUEz8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUoKAk4gIbr8LqD0XOXVdM/gaDTPzywNDJ0Zjw8L8d0=;
 b=uLUyTWQv4XuRX8lxmSzqfS28OFRg6jSxY70qtln0hnedSE9vsW7El/NObfuVKq23RgCuWrlLI+HrRLfQQiN1uOC5Ky7ad4YW4FzEZOBuNwNp1zKNfUrThP4CNRpbDBK9WHokPt5KD6vQz1hpmRTKgX64XVyN+RGab70R83JjEAY=
Received: from SN7PR04CA0003.namprd04.prod.outlook.com (2603:10b6:806:f2::8)
 by PH3PPF1B58125D8.namprd19.prod.outlook.com (2603:10b6:518:1::c09) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Fri, 27 Feb
 2026 13:02:15 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:f2:cafe::34) by SN7PR04CA0003.outlook.office365.com
 (2603:10b6:806:f2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.27 via Frontend Transport; Fri,
 27 Feb 2026 13:02:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Fri, 27 Feb 2026 13:02:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AB615406542;
	Fri, 27 Feb 2026 13:02:12 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 755E6820258;
	Fri, 27 Feb 2026 13:02:12 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 RESEND 2/4] ASoC: dt-bindings: cirrus,cs42l43: Add CS42L43B variant
Date: Fri, 27 Feb 2026 13:00:59 +0000
Message-ID: <20260227130120.3070893-3-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227130120.3070893-1-mstrozek@opensource.cirrus.com>
References: <20260227130120.3070893-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|PH3PPF1B58125D8:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: eae3a8ae-9a53-4ee4-1343-08de76006d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|82310400026|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	gYYYPBTVZCqkYnWfVnJH+F8pWMsoyFttMgJzbVb5/ZbyDHi59sGUlx+lFSZs/gHLFPck32AhKGNNLvp81ST0aanjziZO8tnV0QnNBYGhlRXRsZOo8TUUYGvyH+ri/Zha3iqEBlIDvbVcjeAH7WrnXL3EfHgKYwGFm9hhaYrJQh0gINwMqBIG54KrNju0FHY4Rg/NEOtzO/1hWnmfYNzmyu2Q+BQTzCyutPml3Q5m3m8h0r7b4kK+YfFW1XtPYQHmIRcLHN0IAiGTug2ZYWY+ZCYkh/TnoVQbKsaY7MNsPFACX4+l+P1kf9DGl/PJVOJieZkZmly9cGBohT+egBFbCoL8PheBs6a6kBbCH/Cjof/stwx14bW5raxl4IgZDmVM5rE93rZ+wjUX4O+/XLUAHU8Fr+meiN+8q0vq78Or44yiRHGeOcSW6nv02rtrp/YldKb39t9dssaMOkLB4VkDxo/IbszO5LrlFUwLRbl1LVoiqxuUDRH0ysbwPs4sQO20thZc5swOVKi4F0qbw920NU0P0WZTGno+KNZjUmW8hwHaSx86bl711qTt504x7srHJrsQsqTq0JOLFo89KP4a2J21K3AtFqc8r8kK0+maZT7q1UVUCAxEOu3b6AFiE3jjySd7ZZ+GArlKeUNUFMXoIcDxff7LpsbwT7a6Ti6/iNkCg3k46PTiOxZBqetGpG7EsB//5l+/zCfHUXfe9c9bv5Qg3ABUw3BmX12q/rUOG+KH2XsTECRg+vS6hbdXOc4dNLHtRFtNc2wR2V0MNV+Cmvl6RjPBOJjKY6S1ATrAZdAOlbCO1bOfF21wwKjjAukOkHS/NxYD1J/JC+wQitU7nw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(82310400026)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nfaMKexaLJgsqhNUqPqKiiNlwuQqeLk6lDFqjFNmgETZuvn0qoFhhiSLkXYSHSuIe+YaC6WBaaLm5sewetfwDst/7M5oJdL5vr5gt73sA/N6etN1/qN7/3d3CgaPKj3DmSBbk4ogczAeMAJLBtV01m3iIY1DJLN9RTJRtdWtqsb2ECNT9a50RU4XpSyjxg/pcfUwNecuXX2xehcdduqGmk7YhRVPlg22j/Pj3mQ5JVBcsxpBbKBZaTr+aalPNiJ1lQDwbYo53mDeDTgygXZLDxszkeGEnHTaOq+zBbsngR2irQS8b+Tx7+b31zGN7zPOPaj0+znEJBM8FZGJ8pCWtIWJ09RRldT5RLXKLVVlws2b9p+6rRWicrHHmEbrhG6AQDNlmu2PthyqkRFoOFY61Dg7LG5GorOhAWv/qRMYj6/y1szGZjlbr3O/U+KPLH2O
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 13:02:14.0709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eae3a8ae-9a53-4ee4-1343-08de76006d91
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF1B58125D8
X-Authority-Analysis: v=2.4 cv=dO2rWeZb c=1 sm=1 tr=0 ts=69a195dd cx=c_pps
 a=8Q3VSxVeqSVE8Qz93TfAXw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=aSH8VwKN-Jk11-2aqjcA:9
X-Proofpoint-GUID: PZMjqcYLdBhFjBNpaRFc0Nk3VK6FYyzw
X-Proofpoint-ORIG-GUID: PZMjqcYLdBhFjBNpaRFc0Nk3VK6FYyzw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDExNCBTYWx0ZWRfX2QHip7aUaSNM
 OWPnSc/W9boDd1M0QiEwBlUcA2CXBWCrjcii2NwjQ6B8V5TbEAK9ZXtSDSN09buuSh4gN3xFvLQ
 lRCLDE83ZAGZqQN8df89uubK7Pp7irsna/jCC1ljhye+CATcUw1jBJ9tX+urwtj8zDDDXNUUd0V
 1O1S7pRalZhvPUiEoepOo5U/TGgM08xQ9WJB+lLMDgsI2AaJj/0B6NVJQfQ0CAzvQ1RTmCb8O9p
 UTsXcDCMuxGU7QlE0aQTbqVbez2mW6r91Yj8/GvwpNqoqHeWSb+2Ic86fZEiBzJE6+yrnyEJi4B
 jyywsJ21Efk0FhpWs0yHVPWgZbFSyKq9yq2TnTPJ9pxbiikBXN7XiGyrW9B0fbQqEiVxtBN5uUL
 +t+s2JqcJowxKjVx42wLAUPZChjEtNEBvneVlENinGPkrfEv9DZCkFnkjcMyMNEwnzmG2JhI3Xl
 VHuzisZRsa3hVBegsXw==
X-Proofpoint-Spam-Reason: safe

CS42L43B variant adds dedicated PDM interface, SoundWire Clock Gearing
support and more decimators to ISRCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
No changes in v4
v3: added Acked-by from Krzysztof
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
index 99a536601cc7e..376928d1f64bf 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
@@ -16,6 +16,8 @@ description: |
   DAC for headphone output, two integrated Class D amplifiers for
   loudspeakers, and two ADCs for wired headset microphone input or
   stereo line input. PDM inputs are provided for digital microphones.
+  CS42L43B variant adds dedicated PDM interface, SoundWire Clock Gearing
+  support and more decimators to ISRCs.

 allOf:
   - $ref: dai-common.yaml#
@@ -24,6 +26,7 @@ properties:
   compatible:
     enum:
       - cirrus,cs42l43
+      - cirrus,cs42l43b

   reg:
     maxItems: 1
--
2.47.3

