Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC9631E849;
	Thu, 16 Jul 2026 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784208058; cv=fail; b=KGN2iusCE+GKn+lME19DL5oaUQSCNDWII1X883B/vUQ9Ry8PC1AgGVWPrENhncrsjg/bYfcw21SQqKWqLskNQZLnSzLhBZN4eN9XCQtxwIJldFSsAIyQm6QV0wRY52R+ZXPLl2K/w6U46PGbRQlwf5/qUw+/tCcdZEVyi873z0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784208058; c=relaxed/simple;
	bh=VP+cT7F3UrQyAZpQnK6sjnnvpezR3aKlaiGD0D0dgy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MhK5QsbHnjqXIgExqaWGdRkffPQQogFOASmVsnXqSzxBxTPjROuRJIkUBOhe8DxXizR2W6XAlWVN23lZUJTQx7JIKYWnV0gu/dYBCpKjRRDQGtbiYZnvyZ5LrTM5U6smjbwjDb7TVPjDR9CifcGfbh7JyYnjjdJ+o5+CV5thhSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=K1huupGs; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QeOH1KLW; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="K1huupGs";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QeOH1KLW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G2A7WZ4058977;
	Thu, 16 Jul 2026 08:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=uvGvAgefqr1DroNkd57MSgGHM1G0pxzc29mMaIE9Ado=; b=
	K1huupGstQVGZWxyXmFkn4lJm2hlYodQJVq03Y7ioSyDhbFjmldrjMIVotPWWI9R
	b/TwGjmGFQbGEg9uyQ2jEWXQfUteQCI6VX5X+DE/mlTn8EDdmRcEKlGwkTToJ8rm
	/ytWxGQ2bkH9dsCxNbbR+8Y/n/7nmRKMPf4oW7IltOPv9wQIqW6585uvtrpB7j8a
	KPTVY3kGs9FIVlatUxUZpUzSe686vZX+CYUCQCUoSojoZZRPWxXwe7TB6lsHf7ty
	93GYgpIka/I3eU+uWSS8D0/Vf+x0BgwgguHlnoZyCPfi1Mwc43As6szT/PMlTEcw
	Cami1Bu6MFR7lRZWJWYSrw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020110.outbound.protection.outlook.com [52.101.56.110])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fbj8fq6rq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 08:20:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKr43JvccPQaTXD3Z9Ica4fYKoOwEagjk1QWOrp99KDrQhyZZlIXFMHj2U9amHY/XwsIcCvl6kf3lWGDnGTrE5rBhT5fjciUVKuDg5jey4nVKu94A03Pq+V/TRbWP2yjiR+eN+ZniBGkcPbGaMAnS/jBGkzBHvD0d03kpYFeLdwcGgfQPOllYZUsWu0ZwwQ7LtgiYR/5fcXld/pPvacqayq1GkbkkX6ZfRSv4k7JBA0aN3IJ6ZT2C6keL5lZkNCiz4lxrn911qYkBGtw/Rj79WbPR6cKy6Jk7eEL+9jjqR1LkHoo0mXQZM/g/EJ+0e5luJmyR6AXJL6XMIPaBEqeAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvGvAgefqr1DroNkd57MSgGHM1G0pxzc29mMaIE9Ado=;
 b=MIgYOcwoClHGAcMwHMgP9kMUHnRN+ACzLQGNy7+qgmiIdB/MJN+4okP18DsfFLje5+ojn0x6fBYce4yqV9moWZEj/Futd0KUmgFEfYZj138RSlNx+t/cBA5/72brBvEgEboygcW2AZYU9psJbnJjmiZplsbXXbgneXkYCcgNQw9cVd/Y0zJ6kjhUv7hNttpxrlWQkelyljid8XZaA5YIBX5Gwk1BS9gs0ubpwJEfALGDmfiKpJN6Mf3f4oC9Y4rz2WJKzub/UbA2jlB1jjozwYeXNoD5QA+AR03CY1ykbce5C/TgdliNtBN2U8g+2L8adqpJ5P4MMDcO2m/+ylDMUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvGvAgefqr1DroNkd57MSgGHM1G0pxzc29mMaIE9Ado=;
 b=QeOH1KLWj+q6lLHcJjHETeT+TBfHagrvvM9hpMAgFTkc6yWILcBh36T2v25AK+9e18DSWOc4PKlNb/d1XHZOv5N88CU6Vanzk0wBIWHC+mS/PtBsUa1PbDKwMj++23sHj3Fw/12i/QryMEB9htQiICilnwF2ELZZzZK67a9uoaM=
Received: from BY3PR05CA0058.namprd05.prod.outlook.com (2603:10b6:a03:39b::33)
 by CH8PR19MB518055.namprd19.prod.outlook.com (2603:10b6:610:317::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 13:20:48 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::2b) by BY3PR05CA0058.outlook.office365.com
 (2603:10b6:a03:39b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.4 via Frontend Transport; Thu, 16
 Jul 2026 13:20:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Thu, 16 Jul 2026 13:20:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D72F3406543;
	Thu, 16 Jul 2026 13:20:45 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CA5A2820244;
	Thu, 16 Jul 2026 13:20:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: salman.abusaad@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: cs35l56: Use complete_all() to signal init_completion
Date: Thu, 16 Jul 2026 14:20:45 +0100
Message-ID: <20260716132045.1469156-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716132045.1469156-1-rf@opensource.cirrus.com>
References: <20260716132045.1469156-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|CH8PR19MB518055:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5f6ffbdf-598d-48cc-926a-08dee33d0c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|23010399003|36860700016|6133799003|16102099003|22082099003|18002099003|5023799004|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Jmedj1GLoK1YR9qi1vIfLH1wzM1SaVBBVUbJh4vsmS3FAaAaJ94tfGe6bc8c9JM+8Ua9mLBO3aJZVF2jHOMWN3H5326OkRAETrXGw/WS7ql9diMa2A/9RgIh3VgAEnVMMaGz4L+7gpwenmbp5VaE2Bu3TcXku5pt23xB6698F7PsgcFwN/C/5BnlaIN0MZaJO5CQbLIC8Z6SxXNfTCddlwck6lxoAIz5btLJV7FtfLwIgIPvJhicA1yUbmcf9RBbnwLi5MrvsHIDFC8jLSxyIcogw0dwpIYsuXSjaZJ1LojgdTtw2M+VGFTLq0UrL2lv8+k7KsTvE1hL5CYRjaeaAc+LytMRjFq0IOfFmUdCQrEmPTc0G40ekYdDS2eBUr2luMuMAlm5mKSPJrHMV743m9IhFJDgW9TtuS4fT+GweS4IEM2Jv8euFbASQLy6yPNs6OpeCxZni5UXDko6+AMQpbXZrdKHitthna2z2ZBnCSCDbq0XbCPLF86M+PljFu2YxKxyF61gODBfHMWmjqKcrvrYyIFsJWcBk8JCLkWOfi9+WPFHXjOc1BzEI1POqiP37oEh+9HtKz2Jmh4mVIjr+iavRE1n/tOlP75/IAvqLFTZKqrCPlAy8dxV2MZ1afDfFGjb4K6fL1ue/V9C+AjMSPaHdDEFjP/AnTa5Qa/RoAD4YQLFRmkWuId90OKsKkfbVAJ4CMWvNs38x5pmMS1ihQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(23010399003)(36860700016)(6133799003)(16102099003)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gTfu1qmw5HPGPh50Hym3msGgtxcEXioY+ZjjHf+jAsn87UWwhT6oXEvFJJwelNLE3WVLaANMxqU2tgtQ7xe6gWRoqDYNnnejZsXR0uaLWC+eBCCe6/atEl+nmcBMLKq4TRnqTys4hIsbzLIkf3ISk1+sSiXXMJhFpyeJGRAQs/37WJ299Hlju5rmFYdQtG133LKE0ACuBDUUZRrjJcOyvJ3y7/moakoagG4nfOWjhkBXKd/AFKSMIB8+ljl1fp/A50kaiofWj241EWSaS0KhV9vkg8jzoxUCpZPgiGP8sF04l8C0ESLkix0mN2ARE1nT8FeWmX+dEWmsn2X8cqdSl9VF62pyCDrUrfBmrjafYdpN98AEm4kKp6OJ3shdDQS9i3txzRp4iSBbAoyqgV/q9AF8jbjuLIeZ6GZdDa751TdDbHBefKH+ongM7G9Yz1Ab
X-Exchange-RoutingPolicyChecked:
	XDaghcae9pg/WzDq5f5XWpRRqr4ua37JTvGK1yzOYFdbn6Jk9ZI/2ppru2P+90Ko9BjqRT7j6OxXjf2tsQKp51q5PN1JBJgxCBnO1VTEA6yur7x3EOuGBResp7pZPSD8PLivLYOiOj0SIm14KFp/ZmaF3rw6lzAyfBHJLF8BdGUr9WQ0VDIVbp/SdupgQ3eHgLx8GpJkCW4KLZ0KADh+pbIA8bnYdEiyWDVf5+JUVsU9tHUriHbHzoUqYUSKoDxqRrYShFckvJwQqOh1/PydbL6o7cp+jzYP+9JEqLyWSAZPTLWfoywyShOppn6SXsVl/34XKAWe+kvi+QmJ+ZzP8A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:20:47.2675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6ffbdf-598d-48cc-926a-08dee33d0c87
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR19MB518055
X-Proofpoint-GUID: JnE84bg-mxVIoBga3fYjbIF1U_vzFt55
X-Proofpoint-ORIG-GUID: JnE84bg-mxVIoBga3fYjbIF1U_vzFt55
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEzNyBTYWx0ZWRfXyUJO/Cu5krLt
 YNBGllmdmxiDdQyp0OE8DRrM1mxXAldeL51YiU8qiNsj2ce4uY4LPVBu7Mas9fYBB4RhZkQrfH6
 prmmrGPamMpqpucN/vlTFE28UC3yJqw=
X-Authority-Analysis: v=2.4 cv=M7597Sws c=1 sm=1 tr=0 ts=6a58dab3 cx=c_pps
 a=HmZmHFuEDL3wSU7VNlSPig==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=Z9wtLhjHHfCeib93qngA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEzNyBTYWx0ZWRfX6epQEZp/RUcN
 kGOi217A4MVPdAFIDuewSOW6xLGDbIDEQUk92OviiTfdURU61GBPpIDoCtrP7We6FADwz8htp/Z
 S8867htbFZzkOgU9aEgTP9ZZVC2mhTqVCwjYLk+tiwjaxlMnpwbcAAfXwqMDH66a8z382//wNPo
 k1k9NpI19rUPHZB+rAyyzLJ5+hDaNsKsC0QBqve3JMjZyOMzArqUQGzG+aV3Tb4tOvrcoZw2gpm
 MTt5/QtdjYZXBu1ve3ScLbQ20bqMH7WxPjWOhWBIp8EXvqP3LoUYdzARcwwVNZbpCuEIJTLI7pJ
 fOCpK+a+J1jFAznLkBU6zTU8uI5xd8Gd1l0uN3aLvIqL77nbtlGGsP72YcJulMDH213m11qMuk1
 fnglQufta/cc4ccQhTzEJSrCU6YtzuJY3qcKZkUDk/ZCQUyyKgEfZCphSxRJhoZCgOcVXZvSeZD
 tEDhi8VGULg+U/de1yQ==
X-Proofpoint-Spam-Reason: safe

In cs35l56_init() use complete_all() to signal init_completion instead
of complete().

cs35l56_init() was signaling init_completion using the complete() function.
This only releases ONE waiter.

If cs35l56_component_probe() was called multiple times the first time
would consume that one signal, then future calls would timeout waiting for
the completion. This could happen if:

 - The component is probed, removed, then probed again without the cs35l56
   module being removed.

 - A call to component_probe() returns an error and ASoC calls it again
   later.

It should use complete_all() so that after it has been signaled it will
allow any code that waits on it to continue immediately.

The one case where the driver must wait for initialization to run again is
when waiting for a reboot after firmware download, and here the code
correctly calls reinit_completion() first.

Fixes: e496112529006 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 995e39645621e..0b7b080939a18 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -2124,7 +2124,7 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 		return dev_err_probe(cs35l56->base.dev, ret, "Failed to write ASP1_CONTROL3\n");
 
 	cs35l56->base.init_done = true;
-	complete(&cs35l56->init_completion);
+	complete_all(&cs35l56->init_completion);
 
 	return 0;
 }
-- 
2.47.3

