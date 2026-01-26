Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E344C241686;
	Mon, 26 Jan 2026 14:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438438; cv=fail; b=JFcbJVsw1Paj5afRoVPfED0bztI/4ZrGrkFfGa8aaYmtc+UlVJUSbfhHAQUElCkuBVfge63nT6vPii8utDHy0/+RbECa1zhNMRBhwRJ4r7SvCg6FUpaEo9s24SqHNRALBA1TfshFBlopxZdeFqibkIU2hM1rSZPApGvZHNKEYPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438438; c=relaxed/simple;
	bh=TI+548pdOhehlh5lbnl5mzK5LQdgYNItXOYXztCyYkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W9OPJwNGjeuW21tdHtJNA53eAc1GcG8y17nFOjsW7GDq6YTB7aruamToTpyEZFgU+zSmHZbJm7T5HuP9ltnhdD1Sxfc2XUiY5pUeOQXZYHVNKsv48cIWRCX4jDzMtBAHUOiQOrfGw7gumicL8hBfxqqN8ON6pRBlCYNKYe2nYOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qGgvpc84; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wve1dcn9; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qGgvpc84";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wve1dcn9"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q5IWg93348945;
	Mon, 26 Jan 2026 08:40:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=NSDIZ174P63306VnZjsXGBeEq/kisPXlC2oMl7I4AN0=; b=
	qGgvpc84mGjbnJs/U7BaGc/OKdTLjrDf05hy8qSgrjd36jUglcSbKwEbOOu94hhm
	UvQwon7g/vDN27akHN7gcWYx5lVZhp3sZs+J1bX9AGrkarDtJAbf3j4g5Sfl3pCj
	FiM2GvX0jrMDM5YppBk7lOSDL4hJemRctXQovr7KzUI3EKYd4Dvm8aBoWlpX6rI/
	Wv6s39aG9YubgPzTTSt+6XirSbrBbfseVivVIHFfAf/UZUbe2KTeacfAiEt1iEhv
	LDNM/ILjj5+DqP7YcH2+yxzlZU/4AmasIWEz1j0cCswjyitEx2dE4GI/5cYdT9HF
	5TYogN2M0R+qliQ2dX4ydQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022079.outbound.protection.outlook.com [40.107.200.79])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bvuck9kt9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 08:40:24 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eH9wW+46essXn+d5XLKM79LRyofmMABF6qP7WOFf4RegwVGptzXYjBIFH0HZgn4LSPbb3V+CP0Uu6f1vUHT+IvNnIlfxck/sujRPN63ECW8lIJ2dLs6IB7dZl5qXZUfaltxLxj+lB12cVUDeezf2k3yK2fScPM2elaHCC3s8jvikAW08Z75d9WbViUBSlznrgZJoAedCYH/aYlJLdNaB0LiTAoqSeAywjux5h8NEF5G9ObwjGtDCyrdsU3ov0uLQhC2rH603VOubkBDYZ+00gi2ktrigRf2c0LeyJn1bLkkLWlxrnMdJxATZKYbGjORbodt/S1lO508PmxSlIZnD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSDIZ174P63306VnZjsXGBeEq/kisPXlC2oMl7I4AN0=;
 b=M5qXxbTPk7wz4B359ODW9YuAQKq8oLO162SzAH60ieB6IjfjdPa0jw+QHO+P3xB9eKjX46Y6fvhePRSHjSLrt7kjyS9ZHliv/sIfQ5zbWXQ5wDmogxd6C57sZpPwX5htoU8rjU3NF57O5kjqYn2TyPr+RONBiylpwMYkCXzCZCCkNJmlmrGOsQdpv8EezUBnvL+TtXViCLmyPZo8ReBjVoT75uuLuqnhl9q/CC1panmH3x1f58Lu0AV8kyI0bFZYL2guVY+oZN0WpdGHqngR08w50t+F99QmtHA46ezXkppB6rVCi09N9qN7Hiw55AXJmtfng2j3HCRx9oWAN29dFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSDIZ174P63306VnZjsXGBeEq/kisPXlC2oMl7I4AN0=;
 b=wve1dcn9YdS+Lswr2HSSVINhpYqQryrrl2oN7yxF7YOd6uaxuxfLVN1Lu4KIMYlQ29y34iA0CiFjJqrGAWAAWiRZYt/XQjNK6oM8rY6H4lBEffxSjC+9pyl9xKaEw1+4HhrDFvCULs1z7NwYrg4QU+zptYelpqLYzghek7Qi0qU=
Received: from SJ0PR13CA0115.namprd13.prod.outlook.com (2603:10b6:a03:2c5::30)
 by SJ0PR19MB6889.namprd19.prod.outlook.com (2603:10b6:a03:448::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 14:40:19 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::7f) by SJ0PR13CA0115.outlook.office365.com
 (2603:10b6:a03:2c5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.6 via Frontend Transport; Mon,
 26 Jan 2026 14:39:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Mon, 26 Jan 2026 14:40:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 373EF406542;
	Mon, 26 Jan 2026 14:40:17 +0000 (UTC)
Received: from upx-mtl-008.ad.cirrus.com (upx-mtl-008.ad.cirrus.com [198.90.251.5])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1927C82024B;
	Mon, 26 Jan 2026 14:40:17 +0000 (UTC)
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
Subject: [PATCH v4 2/4] ASoC: dt-bindings: cirrus,cs42l43: Add CS42L43B variant
Date: Mon, 26 Jan 2026 14:39:16 +0000
Message-ID: <20260126144011.140029-3-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260126144011.140029-1-mstrozek@opensource.cirrus.com>
References: <20260126144011.140029-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|SJ0PR19MB6889:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1db0d62e-1a8a-4f65-3d70-08de5ce8d3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|61400799027|36860700013|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lHAPtCvJkuYm+y8ZGcliU3B0P/s2c4b8/vQZcDImVMZdmH8PIbf8vGmqjVfU?=
 =?us-ascii?Q?JRlDk9hlnWnzf+b+w9FidcEqNDPxaIwgroFZE3ijLHCpfOa8MtcS+wcE+lu/?=
 =?us-ascii?Q?1n3TpTe3J+q5UlN7mDlS58tn1DYGsoGiiSUANquwi3jPMb6iVglrEH4q0KNz?=
 =?us-ascii?Q?+EX5+RuCy46bleXGpLfNMrIt1IEWmjJ8bVie6I1Xkha3bcXVlNlBt2ueOPJs?=
 =?us-ascii?Q?mb9CgRmqTCqZWmQUZTM+KyP64ayCt2lEis3095/D5FAfp9OuuXrdEjW0SUy4?=
 =?us-ascii?Q?u+yKMAgfntr8UlE3l2WJiD2HmGnVLXHqCEt+15oo3QGU6wB+bB8GGCSZNKi4?=
 =?us-ascii?Q?y3ZbKSMisAAQWG1ySRO8wEOy049Pey77C53FCg7ARgRjSpRMBtitmRk/ISdr?=
 =?us-ascii?Q?VdockNQLIssVUUaRa9mH75BkVtmP0iuwO2ys6KdUYn+W/I+MljLvXg24eR0V?=
 =?us-ascii?Q?hRca34wilziI6BFs57ROrl+/njcziyPiN4dXga4bjoz+UXkLAy3bAnznKwiL?=
 =?us-ascii?Q?0/GIADBiqHFlu3V+6D7yCgktvusvnwk9TsOGORZQOtMsFzwv/dTNVMCblS/P?=
 =?us-ascii?Q?DDox5KpQKmBgSyADuAMoO2xczh5k+me68ZXRyhY8gpzcYtgOSW/5N64wbvB2?=
 =?us-ascii?Q?inE7Pf9gpoiAzsDwPVFzBGbT3iHccOsVDrqNMqase+wkp7onVRYx28munoms?=
 =?us-ascii?Q?9baLUNIWXZ7iBVXMHXKTEq6lTDn1leBJI0GW1zXPFZwZzo2+Wl8kpt/H4Z0y?=
 =?us-ascii?Q?/xMduOWo8V3LbnPmXqf9Dz6ZZ1/A4J7kyaoocST1gNfDXvueZx0baQ6B8F5y?=
 =?us-ascii?Q?I/sT3+3R/QBNTW2ZWJKAQqmurgxd8d0fgPsWUOk4nSlZijCmavFw6d0ZBrL2?=
 =?us-ascii?Q?l1iETMFauKlZYcdQG/Itq+4C7swRLUAE3iv1rAhL2Vac9La3F3dxM9U1VIqZ?=
 =?us-ascii?Q?fl5SIrioGkTc23OVs72wm5OfpMoqqZ1WQmrrI73przKUAQwaAM6mSd0FFBMI?=
 =?us-ascii?Q?duJb6h1q1Rl4AxwbrBYAZSD7V+W3M6gA+I9JXYzB59W3aWd2qkTAH34X81Hi?=
 =?us-ascii?Q?YzA9hvMS6EcsvjRCz91L+8Wj2/VH5f8+JTFDu/bdjiKaQ/PCBE6ADN+6bI0U?=
 =?us-ascii?Q?rHRSVPtX9Xjp76tg89bf8+LVaMgM89be2VZvfyiQZE7ycguQzSD5JdSuneKc?=
 =?us-ascii?Q?KHEe+MWYS/u8swFeCBsgCnxEwSCzZZ6NsxiDHtFTv9qCvfIxAq8V3Xdh7fAC?=
 =?us-ascii?Q?vzaPM16RTVWM6jM2vkcLvv7pdMAQl+hzb5CVufWg8DKZxh1kvtZnw1OCTvHM?=
 =?us-ascii?Q?LlTRs3o6bLHomAnXHMo3CM1ltH/+dMzKzuninxKY0sipqV8TxdVdKu8bdGQH?=
 =?us-ascii?Q?4uRBz2+5AaX8oNTIZs6wAKcD1X2Ahjv+vE55HZ4BxNDu8t8iFij5m1qvST2T?=
 =?us-ascii?Q?9GK3CE//tZsygMluWnhhzuhc7Qm0y8gXEmkOx7/utMez4z+0CaMqjkRbQJ/T?=
 =?us-ascii?Q?DsZvxIdWRkLJ3rtcDh9Kk2JwBJoCpF1Mif2+7Lg2R7Pg7bTueuh0hrfguc3F?=
 =?us-ascii?Q?2QedWX5A9GwH8zzMASfWmkD6I4nyr3SW/ZEPDAGviDWQ7mUGYtiOKckutry3?=
 =?us-ascii?Q?+nnzD4BU/S8ICOZc4yDGksmcs5aXO4UVINhUfEncJzkf62bOHe3QQUKgmQNY?=
 =?us-ascii?Q?Z6hLVg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(61400799027)(36860700013)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 14:40:18.8422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db0d62e-1a8a-4f65-3d70-08de5ce8d3f9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB6889
X-Proofpoint-ORIG-GUID: -GKbOUi8EzWetdm7fMWyYDCNZLfATYNi
X-Proofpoint-GUID: -GKbOUi8EzWetdm7fMWyYDCNZLfATYNi
X-Authority-Analysis: v=2.4 cv=Vb/6/Vp9 c=1 sm=1 tr=0 ts=69777cd8 cx=c_pps
 a=Dyvhhyvg6Mi4AOvI5LET7w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8
 a=aSH8VwKN-Jk11-2aqjcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEyNSBTYWx0ZWRfX7Ep5xkg3VGyA
 novxWWa+g3f2jwa38unUZbr26E9wbFdskp8WQ8KhtQTSIuhss6Zw9eJpHGAHjotiYavPWSJUTvB
 8/i6RlX1EQ2CG2MTvmDlV1aVA7f9PIg3a4t8XqjJj6/imTpi79TDLjzrsUUAgwRmdaHel/wAd5o
 /DmFtwA1sad+pDNr4Uplt5n5MM/wOh4pPMeK34ul5jC8zO6GijTfyyq3LNQJDAhTqBxEB2UHp/x
 zbVjgOTIpBsmLhz9Corf51TzSs8Ps53gLj5nQfdN7CDtWM/ad5YIP8fNK5XaPsBG0Kj9fh+Y5Rd
 2HrsTag2PET8H4oChF/G3bugDTLhnAcfWGbZnIJItBsVOPhiSV6FoLD+eHcdkFbLvDV2Mz6W63f
 eYaj5He3mRYNEnIam9fU/lsVHVE+3ezcRw/PcM5fplw9CePuEcycRU3yWt9wK6qMGGiGGs3M5w7
 5bTNbvh3elOQZ57zCPg==
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
index 99a536601cc7..376928d1f64b 100644
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
2.48.1

