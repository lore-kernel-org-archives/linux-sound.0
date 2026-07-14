Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91771444717;
	Tue, 14 Jul 2026 14:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038693; cv=fail; b=fY9ZRpBTi6pXGxhVsvCaMUh+Kyf5kl0tVKAIlaGYAlvLE+9jmhw9L8ZBU9VTeIDW8HviK2pT38tR28TnLACY84or4pPtscIBGkctX1dHPLB/7sPfD9IBpav4hZhr8XRCz01zLRLpBP7M7atThvpSjaDJ7ZYMy+gv0JOcY7S1b5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038693; c=relaxed/simple;
	bh=NM1VrfEOlSyygEdw5QPI9h+/vaL4Ig0fqFXb1IS3zU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fUkBjy00UPaBr2ztqfiFCjwtdqVCBDLxdI8TaEHeN13bhtY+IHD9wvX30pQdVDOjYaxqkLTLxpG1Tn22pXYCIG9Qow+WuELoR/dMEyzwfl39Eo7T9GXTQXPJSxJJ+9fsWpWezDFXuv2BcssuTzKGZEPuSUug4/q8MaUpom9OMIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=U6aeqhNI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vxDtZFty; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="U6aeqhNI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vxDtZFty"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E4J2gm3590165;
	Tue, 14 Jul 2026 09:18:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=8fQPOgSV6zHLoMYo
	yai0KsI6KAOEe5nOq3H/nun7DL8=; b=U6aeqhNIH2wSNY6drSRFIgGEGznPksT+
	fDnXt72z9DoNnM3Hqs1TJ05Rm93pt8VkSt3UpdVe8ORn37TT1+NaxZ9ArdZ3ZU8k
	1/0tBWviR4hfwukgw472e5N+BoigJK1QikPqiF6LBwEzE02q+dRUnhAClgoZKZhL
	Xec1Em2fkM84UvqrCHeOp9wCKeyjpYFMyXkahC9rFlmxwbDNVt6QX9LoQXLn2UV+
	WGdVrYeSQGQZIGXAxCQDWIhV1XD9E4E5oeEgr9JHZplVsyD8G5F2AD8k6sxe8jZX
	j0PjbEMhousuuYBwg9B7A4ieg+zuYsoTY1snezeSMHyyb5hxVHDzhA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021099.outbound.protection.outlook.com [52.101.52.99])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fbj8fm0dc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 09:18:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FN2QYa//mthuKbT8+R+67HNYvn94bXDH7IerYSoDrKMxYoV0k5xxVbNHoPMG1lZRVYaSRR4LkrQFaMBQpMpyjdoXFg0v8y5v8J16N0hWFYcOt0j5GEZgRONe2yzDcw6LLX9XTecqDbMeIDucncm0eq6L4j9YMnZyWKfmebweDoA9ZNrm1sS2ZNdNE0dwZ6a2vkZOcBV9Vvs/r3DKIwe03TB1/Bbb0Ynh2/ac4KjoM9rN3pgADIg+0Paoe8jlyDW3yhLZ4XV+XzU3JY+CcP6aO4ogNTJr/poopZSVA4CGcPxy/zvEvHF1TDuE9Ss3uChv3YhlJpJGu1D+fFb+sKagFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fQPOgSV6zHLoMYoyai0KsI6KAOEe5nOq3H/nun7DL8=;
 b=aM3ERTAm+RAGgwyjATZ9wmLpAaTKYy3o/cWL3cjKXo/UKrUo75DphDUoieHTI0Q8984ZIxqR84mNr0RqazNZY/bGdv+rB8jTFQ/pCrIc3zUv9LlpPs1hnOj7Tauq99WAIzvbGHhTw8InJyUyq9E1i7f/HmezooE2awpklZ7aKmtPpOfqoaY2Aesci7m4qXQMTpCNUKz9bHv54pIfJ8lGSKrBtTJUfzKj2j8I9wRnn+athoVX1pBPhSQrqHsbeWrvGwMj52LKvemgRbaeTZrrbtosP42O74JiGkbhexjeJhqb+b6B1iYytwtSr+LDJY37M9vTaN7bq0wNFHxJWPg/vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fQPOgSV6zHLoMYoyai0KsI6KAOEe5nOq3H/nun7DL8=;
 b=vxDtZFtyxXHgIqBh29IHjJZi7Ke69HPDKCMYpuNEoYLNbXef/D1QAlF7CeaAvtpE5xFINtBOwkqMvXKHgOZimXYC+GC8ttp/EQHEhVXK2mNB3UppdH8FZBfZUOfbRWJM8NypPhBaHx/75aHBMGAV85ZH1ylnlt+ko7dYrdmjrHA=
Received: from DM6PR08CA0064.namprd08.prod.outlook.com (2603:10b6:5:1e0::38)
 by DS0PR19MB7886.namprd19.prod.outlook.com (2603:10b6:8:163::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 14:17:58 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:1e0:cafe::5c) by DM6PR08CA0064.outlook.office365.com
 (2603:10b6:5:1e0::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.20 via Frontend Transport; Tue,
 14 Jul 2026 14:17:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Tue, 14 Jul 2026 14:17:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D19CE406541;
	Tue, 14 Jul 2026 14:17:56 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B9EE882025A;
	Tue, 14 Jul 2026 14:17:56 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 0/3] Fix races on creation of SDCA jack detection
Date: Tue, 14 Jul 2026 15:17:50 +0100
Message-ID: <20260714141753.897254-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|DS0PR19MB7886:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 79fd4c42-0b62-4393-51da-08dee1b2b47e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|23010399003|82310400026|376014|18002099003|56012099006|16102099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	vYunOUhgd2LkL2Vx6wwmSxO9is2js+RX54my5hWeWd649ytDb8gVVfT8gsGJa6wTqclyTeEDjcJtHN2Il0322j2zxzZ1T/5NrG8BBPS2PCsHxCvgB5AZOdoVTY5wZ1/VhIi94QGuhyVEjpII2QoOrgP5bl5/7F5N+GHo0+YeLEv6QajvP2bvJn/6gCdxJKNrG1zYK02ntw+/06RFgtiDoK5L/n110HSG33I/pOC92yy7UXB4XtH/dYfoXYHGpcbQYVtN92kTBS5ShpJVH1X2h7+pWZ+tfn4c22buKWOZVH+pGyFOqAX/hKoxGAejo9bqR+olDyHj/+5y10IFMO/46s5ahgX4L2+4jt3Zi/lijjG+cKU4Wcv3NR+ayW30fUk3u8Oucb9zuhV7Wcggr5DzzlswbnXbSFquK7s0T2SPOufNab459Kzxo9q3oQnkZXhjOP5TojIri69HQbOayJRYthqjQ1l9UCiJ2ypYh0F0McgbAdzjDOH+iydmtKAeh0S3jlvhzy0T14JI0tH241pUGBnNPRuzoEnbS3Y7+KWLuC9wcORwjH9eVDOjo9HwnkclzivcTDfHvy9Jv1DxQ4OwgZFmG8ditZj/ipfQWlVcCsUtwAh7qakW9bvXI68+L61sv3mFWMmEJ4fCGJBRhckamUQcWqrGk5UuL9EXYxQ3l/uz2LDObojJcP8Iai1QI2BszTVOm1fxGkFLlcKkVKF5tQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(23010399003)(82310400026)(376014)(18002099003)(56012099006)(16102099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f2czdlbJ3VaHvDdLMN9tY3mEsJ2UrDpyrmlJambe+slqXGtnSiCCXc8osJjxF9aVzoaJrvq+2TJ5qqZMI3Na04WdHcQdndlycm7dqAiv/MYHKvwH+vemJIGGqMS6rOsPNg6WHTDGqCetOj8xIx37HLSdJq+LKML5YRFohMoIDS1U4sPvzocabprivXOMgM/gQ5l0KwewYUgBychn1g958GIFsxuzDPF/PD4jkzlzUJPRhQ78E29gU1xoRsTyoYCBoea8QkG3cI54umHJENm16Z547jj9bLijWlm7VhoRZltoTTeDoYd7qsFsF4+SazF9/DequIcVRLsuPz6mch8ktkxOes2oOSpEPpn4t5QHViRVHvhOBfM2kpmz5F5Ncb8FbfHG/hqrx1ptop4mk92V6AT427qgM8CyrEktem5UPKVllkDBo6EjEmu0By3FKuA6
X-Exchange-RoutingPolicyChecked:
	eqyWP0Xp37OPgCKZHUOcWw8cesjhmd8tY1ZqSs5KKW0qKV28YVpsp9CBAoeBB6FOKpbqt5siyIfwXazGw080NfbRbzOvKUEqevemvHmLleMIB12Ii8U+KdeDPSDA7c3OIdLZTNAASEzpfXTGZKCcal3+T6qjZErZ7+GocpJrulvHUuTSqGCXnrNyIOY15XnvMjvi+sIy8u9TzK5v7cq1d40Jnf944dcc6N+/XqD8WQ2CtCK6+sCZynboNmqtmZBiyXuzWa2Q+0rCIofxpGeBET1RSGwpXWJ/bjjHR69DekG0xOyaZE4V2wmdQEdqVdPy6a+v4UPRQhud6DLcbcI1qA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 14:17:57.9007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fd4c42-0b62-4393-51da-08dee1b2b47e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7886
X-Proofpoint-GUID: _Z8oOPdNOD6g2CH7JVRKfcORcGaCCJ-H
X-Proofpoint-ORIG-GUID: _Z8oOPdNOD6g2CH7JVRKfcORcGaCCJ-H
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE0OSBTYWx0ZWRfX1Kh9aQ5RIhpB
 0osDnsJYJDmSt9+a91/XLXp2rwfsczqqvJ6WlsctgAh7Dqr+P1CT6iwozXRorCXJYEDiHgoGSKF
 9zKfz30jYmDNaLqpCPKgVy8+QUIUAy4=
X-Authority-Analysis: v=2.4 cv=M7597Sws c=1 sm=1 tr=0 ts=6a56451a cx=c_pps
 a=TH3AoTo+Q7UfKdNiR0rSsw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=T6_V3xzk-wvkP4YsIhgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE0OSBTYWx0ZWRfX+QHVEb+3SelB
 1L6LIRGHLLt+WIjriSzHnPrgrkBfW3FIWgjg/ZIQ7l5jVcCxdF13NB5csciE+9g2SqJuoV2V81m
 lCFE3+apPMntfkb67LlzHcM3xKbpxGbG8qpNm0mIbTYrsQMorUkOgqCEC3GILj8cdi4rd4+Wc0P
 hB2KUszSt0quW4u9KKkVG1POObgj38k8NTCYO+hDc6yft4P5QuyPV/yMZAOjDUfzE57ihtuGKO1
 p12x95aajg5vvJ6uUlo1D5Bgc7UxnTE1uoZisghiJKaI3Iqw956mq1rqRBFiy0aw/nmJts1EG3Z
 hC3lUswGIt9Y85k9ZCeklTvO1x3+0qXFeTuGz1O/yiaIX0EDIt0CWuBQY/bWEu36CzHchB94MsH
 xwCwiEdW6IGOt9XRE03fFoApm6sMHy54EtZ5e4tZlP2GijtMwkMieUcpN6wN+QVGgunJb6KIMkp
 1hPZf7zdi5UY+h8Dn5g==
X-Proofpoint-Spam-Reason: safe

Currently there exists a couple races that can result in the DAPM graph
coming up in a state that doesn't match the hardware with respect to
SDCA jack detection. This series fixes these up by adding a component
level fixup_controls helper into the asoc core and shuffling around the
IRQ requests from the SDCA side.

Thanks,
Charles

Charles Keepax (3):
  ASoC: Add a component fixup_controls callback
  ASoC: SDCA: Populate IRQ data earlier
  ASoC: SDCA: Switch to fixup_controls callback for IRQ registration

 include/sound/sdca_interrupts.h      |  2 +
 include/sound/soc-component.h        |  2 +
 sound/soc/sdca/sdca_class_function.c |  4 +-
 sound/soc/sdca/sdca_interrupts.c     | 94 +++++++++++-----------------
 sound/soc/sdca/sdca_jack.c           | 44 ++++++-------
 sound/soc/soc-component.c            | 10 +++
 sound/soc/soc-core.c                 |  5 ++
 7 files changed, 75 insertions(+), 86 deletions(-)

-- 
2.47.3

