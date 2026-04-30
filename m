Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E6B3FCB11;
	Thu, 30 Apr 2026 10:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777544504; cv=fail; b=k5WbN7iroI5qnm6QeRvGlb62+tda5hvzZUScVnQ9PnRXODYu04HCrZwufmZ6YxL6u2ZhOqZVlsY7j1i6ddoC3fUkKlx6rwRs9dNcsnfCP/1Xo+BDyPK69agwr8w6PxmOp5JkCvUM/Gk9hF646e5an0SVCxMKi8jocC/7yoDNfVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777544504; c=relaxed/simple;
	bh=s8VFcmXKahpbzZDgfIbndtBnyZHG0aQymL+0VyYdam8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uib+7+4j4LwZ7Z4yU93ryHtgGud+076hP94HmO0yqor7gGwNb4YQKT9266EO+o7PHgGRqBWqYoxtF6uivJNDdJyXIOHRdIhrTLENfnJ2f+XxdTp9V4FajTC0Qm5ENS/QXJUX6w5jdW+EneVUeHlGflRlp//Kk8KzQ/VCcHH6mH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NgDQLIbD; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=zI/yuLVs; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NgDQLIbD";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="zI/yuLVs"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U4ePMM2795103;
	Thu, 30 Apr 2026 05:21:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Pb99i4kflH0e1QWX
	+OZUCJpRZTjVn0nIytteozQlkPo=; b=NgDQLIbD/7ch8Mz1KkVinpimvcyLoZon
	D36EOL2PanqKsBjEI997T2LE6/D64tRcAdCB+SJRaFvO38zrVO2YNzuwIEOrGyfw
	ycW32HTrFJWpaDvdYJEe33R+U3mpw1+89tuEcWVjcB5ejR8W7ZUpnLg3pZUWPkEG
	xa9g74f3z1k/Mo68iV3idMnX7hRgEAG1fU5oS8Mdss6k3efIdVWwCKWQ9Yt9O3um
	KC2Wkwclu5vy3YV6qecoaG3ve9gMiPMpO4XnfOmtJIUMnEfp8/Jhu30YVftYcKKU
	ocQXkqoIS6pMREb/BbdGE0SXc0CFv885eY5eJOfMC1n7V9k+COOZxA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021081.outbound.protection.outlook.com [52.101.57.81])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dru10efkc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 05:21:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PD2jM2lnWYNv3j2Kp9gxqjDZ4UoYL5TthVDD0U2EyFkgNzjuOCHguxXz+7E+56VcO9o7boBRYWy8utvQ9PIV8e5fCGaK02wvJv9GqoEcigCHcyU35l+uoKZS5pqWIY1m+9LSOW2S4UsoPyr0aKoQqjOKx0W2e5DinI5HzTrTUcGBOpC41gHX/sPcuwP3/czx3l4Uh7Hn4fw/RvrFs9up9lUxPbdjlbnbB5yxfBfj/tCDWhcBVuig0htAFZuNGajsfPSLE6brLdkoUJ8IlyGjJlTIV3A7Hhr1hKQDgX1XqUwjnrlnty4ZwnTctDNcMNJlDTa0nHd5wdjvD7C6jJZKJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pb99i4kflH0e1QWX+OZUCJpRZTjVn0nIytteozQlkPo=;
 b=FDxfsZ7ozKQhyp46o+0KTb/i8BwhOpoBhHxMLFVv586g3EF62VoeEttaNkPVu49bHFUVPzVvR0TJ7THQZeJpysIpgiupXOI4xJP6k3JukKI8InPQ8prPhwXjxCe0Z+7EkxTCI/c+oQdDbx4yV1yTzCyMnlmV4Rw0i3ZScQoJVt+9GZuc159L5WcP4wYauPRlWSkgeddhIQYmOu5oU73eGqang80tSsfq/d94aLw1zOau6NXicO53BrbDt+3xACOqp8I4gW5z4jKQZl0On8QAU6FStmFwr02WfaMpjBIWZ1rVKU5Jh9txceqSDQEgA2VrZ8R/EbwJouImsmqTbGrE9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pb99i4kflH0e1QWX+OZUCJpRZTjVn0nIytteozQlkPo=;
 b=zI/yuLVsySaWjw6I3DruGOyi4GAdPZOrAIM6UFqdjMiO22AL9Zyfi8V6+ywQklt1MOyFR6HcnTgxsL9P3Q9txXk/oIJiNfwXsr9W75/xacx4w8kMUGwZ4B+FcQ159vX4cdIgHf4IFh7VAUW4GVwhhgVwBoZ14IrQ1L6ycxIf5Bo=
Received: from CY5PR19CA0022.namprd19.prod.outlook.com (2603:10b6:930:15::33)
 by MW3PR19MB4281.namprd19.prod.outlook.com (2603:10b6:303:51::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 10:21:26 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:930:15:cafe::a1) by CY5PR19CA0022.outlook.office365.com
 (2603:10b6:930:15::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Thu,
 30 Apr 2026 10:21:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 30 Apr 2026 10:21:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C156840654A;
	Thu, 30 Apr 2026 10:21:23 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A7B1A820244;
	Thu, 30 Apr 2026 10:21:23 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        niranjan.hy@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 0/3] Improve SDCA support for duplicated features
Date: Thu, 30 Apr 2026 11:21:17 +0100
Message-ID: <20260430102120.1283320-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|MW3PR19MB4281:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d289e226-0c09-433f-c649-08dea6a23bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|61400799027|82310400026|36860700016|18002099003|16102099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	cR/Heythx7EG4SPf8q0Q7b9JMie+751tVgCwgVUUrzkRsf20osjWab0pvlss1MHUtaTMLMjMqSPBTfqsQqrMEIgDySHXfs8J7aAOEldUOVWNwdt3FtDOXKPcs+/AU9x8V2dKFTnIXegnZO8kmBDg5QBBfvpELPs0OTg+5T9IEfDiFKY1rnLnSdUUoUhzcJJNyF+4iXk2QKWB+eYWHFwkp1twB9q2lJmen/23h9cpSn/F0+gn21I1zVWsCqFhwLUdgqWm/c7x9CNh5DzOrsGSQ7c2rIl+sdgXeF9avFp+nRzxjUpTpIx5PYwxAEo3aBfwk/Kn+ghuPQFDClLM9vWmJP5ZBaz/tBvzpsFl823SNE9vJpKj/oh1nQcxTVf7RdYsxodRTXNN8n2JI/aLgFtSz2BM2+ZcpaZ082RyRyMOvW0rjsEsEvmTIBJV+ZtF8jcX3YDWRhyEMPkKuJrSGW/L9bn6cDCnHwse7epDmUxYf9mNI9l+uREdVz/iYski7G+/O158vKe75+49avqJSkwdAGWrWNmeA//qb0yKvkbgUmkbyahrdAVEfm4ASAE0lQqOvcmRkfYZuygViz2+hH+uOVHLikYhsNFzjfIyucIqQxYJ+PTJrIos3Dqi/iN5nb/N0Na0iuGeNcaq9NgbSeyFT6TDmqfhP76vtRjbk2wK6oKIk8tVI8KB5uqQnriTtGGr9JVWFDO0M8I2RZ0nwDJrYU9X7TTUGla+Zf3q1ySHPGqnDSQmpgBrOzJXJA4oyWa+Zv820jfvvprXdneYueVAEg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(61400799027)(82310400026)(36860700016)(18002099003)(16102099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mW/4834T7i8RSLbW85zpIa9rjPtClotvF31VCzlt9zHLg2GI/4Y4leccW/5G+KniNFRcT7Qs4vj2piI8tCX7PyDqGS3Bs1Yyfces3A9/LRdofrASozUQgYzjLx/XZNmcam4dimvd58NXNl1TqOs9EpOxUwzMyF9unfF7cmvixih17LcE2t0awjlU6XBtLjKd0cGCoiaoeTTFA9Uso7SxzbOfBD9Dx07ibUrTprRa+EY8DjptCtTRPDXbe4RpjjlBV3wc8C/+HaU91ZC/n9d+8U7b1vFs7Burbp7E03Y0czwdEB9qVmJKfc2YgYR9M1uLw0HDN2ZS9yS+JaXwGpJrcruL1BC/5qXYxb3TEsFZHJiRNSRAj/9x424BW5U+tRVFJoQ+U1WOc95ny9SXo7NuvYK2mWwXWcEmgXwSYPJKsTZ0umAjX82FEOclOi4FpElZ
X-Exchange-RoutingPolicyChecked:
	hAcQkQQUEPoeJ7YWn8NaPXoUkLVr+ssj014Z6Qsw/02ao6klvxMqB/Jio2ZCypQN595w1R0v3YormG1yJkAuHvTGVtXsYJ71Ic0GHmqCbpZtnQV/YajdL4fNhDvg7vzoPJNqclVImSBDS55KN3sJLKyGiKL/y39fxBlBgLfkDnv8ZNSngtLhFkjGoRfz0NdoJNrXYFR0pd8imMFsHr28KMYvPu/L8yG2IRvmF8HloH9TYrta4FWbyNWb3INhYesQgYwVMwxcljdEWMHZVQNGzrMxy4/afJYocuHqISl32sDeVFP+dP1a112yspYPuAbBiIZc0WZWtvwJu4VkvYsfqg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 10:21:25.1643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d289e226-0c09-433f-c649-08dea6a23bf4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4281
X-Proofpoint-ORIG-GUID: D1VXkZnGpkiH9RT526RYXUZo_-hDBmMe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEwMyBTYWx0ZWRfX07YZXZpc0JAy
 J3ZwV9sDtFZDcYsnwpk9NU2o+WKH7giauQsKvYvIsdaAgMXTzWudX7AemtkHYJvVh2B7uLvG0gi
 S7MwUlNkLxXG2KPyLlwFZ2UnwtWt5dd7Gjx85D3JAJ9aPCX6eiWOAObmPmr6gBxKMIHG/GJNwxQ
 3OksnZhsCFugEMulPmMVMlXBKs09PQd6zA22ISNH2HDjkAQGHkG/v8fBFcMrCNDoMsbYYta34jO
 8MXWJolNjIBMkwPDWPL6gLvSj4LiIBkkYBm8FQF7RsWqIs7bJrJReYHBzCyAv+mb0YpCeBlPghf
 0KhNuvG4NLfFNk0LUgUMXsnoPkREX4lOk7c704e+PfJXqjv8NDiauGGopH/yL5JOys1NG1+wYT0
 Q3WAM8kHH25rG0eiD7v9/0cvCMarVuAH8U71oANUfi3COAdKQ07j0llHf2DtfRuvt1gmAUZk+w/
 7VMkbS37kbvlyzzMcsA==
X-Authority-Analysis: v=2.4 cv=EuTiaycA c=1 sm=1 tr=0 ts=69f32d2c cx=c_pps
 a=oLfmZVzqrkQADya5iaUDoQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=tq3VnGD4GgujheajYW8A:9
X-Proofpoint-GUID: D1VXkZnGpkiH9RT526RYXUZo_-hDBmMe
X-Proofpoint-Spam-Reason: safe

There are some short comings of the current SDCA class driver with
respect to duplicated functions and jacks. Fix some issues in the
reporting of jacks when there are multiple jacks represented in the SDCA
topology. When a single device contains multiple instances of the same
type of SDCA function the current class driver will create duplicate
controls, update the code to fix this. Finally whilst working through
this also tidy up the handling of the sdca_function_desc pointers as it
turns out some duplication has crept into the code on that front.

Thanks,
Charles

Changes since v1:
 - Update tas2783 for API changes
 - Correct kernel doc

Charles Keepax (3):
  ASoC: SDCA: Add correct masks whilst reporting SDCA jack status
  ASoC: SDCA: Remove sdca_function_data duplication
  ASoC: SDCA: Support devices with multiple functions of identical type

 include/sound/sdca.h                 |  4 ++
 include/sound/sdca_function.h        |  1 -
 include/sound/sdca_jack.h            |  3 ++
 sound/soc/codecs/tas2783-sdw.c       |  4 +-
 sound/soc/sdca/sdca_class.c          |  7 ---
 sound/soc/sdca/sdca_class.h          |  1 -
 sound/soc/sdca/sdca_class_function.c | 23 ++-------
 sound/soc/sdca/sdca_functions.c      | 51 ++++++++++++-------
 sound/soc/sdca/sdca_interrupts.c     |  3 +-
 sound/soc/sdca/sdca_jack.c           | 75 ++++++++++++++++------------
 10 files changed, 92 insertions(+), 80 deletions(-)

-- 
2.47.3

