Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607523;
	b=fkf04WKRu8MHCq/JuRSjjuR9CHEBbRO7uLbIgRK5SWYA3jF7gJxCjJq5+lOp1w1j5PzP
	 F4dMDgs50SBVkESrBvS+mAJeqVCTM3JHOqkBjzL50agcbOPwxKVnLQ4ETW+OdOvS1x+Go
	 4NG+84JI8OVYo8sCKHwxsfQO0aEsylkhkXuZVYI6/1q16BIb6Id3cf1aT9IAa26La5IDL
	 2jnIgcHutR+OhRD+qo2QluO/Pl0R3Mzb7wlhQW3NiHKGr8S5IDDIFJwtVCjUPe8PIDkJ5
	 24pJfFBx9wSpk1lSAXSVFKi84Nz2ApSF94Sw3GDo7bhT4AEJ0E3UGojtSGGV2dk+3/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=jeTkHhHRWUg5+/2TpUxlgiLDE1PGH7ho1IXQlvPEz6U=;
	b=gP3erGHfn6jq6PR/8EPmL0ncj+kCln5CVsGeeQRWP9N8FRsJg9WX8shic/gcwoR9Y/Ms
	 /ZC6W/yPOoYQJb9UWeAeXQnj1Pv30eb9m+bXBhDr6B5VjAzdsiE+xyjdthyTQU3StVOfh
	 RI7DtXjtvyzrsmC09RcpMMaOmiBdw04QQYng8xQvfEAlZ7uB4xOlsfI1IB8qDzCPpr20L
	 Ixp++lDWs7nDxs4feejszYoF/BWYFBgqSL25vYyidE5kWiH2/lkhQmsTTMl+eWPF4Odgi
	 moa4F4W4NCY4rVYw8DGTv53ZVp9M3Unj2g6Go1kv177RI4RwSdkZrb2QHQa3Kby/tYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=S1h5m6GR;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=WAca12IE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAAD606A333;
	Wed, 25 Nov 2026 11:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CAAD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=S1h5m6GR;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=WAca12IE
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APBhVb3102441;
	Wed, 25 Nov 2026 05:51:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=jeTkHhHRWUg5+/2TpUxlgiLDE1PGH7ho1IXQlvPEz6U=; b=
	S1h5m6GRcsz6Vhpdx7nRrEMGZZiPE2z2FLk44dd2jLJB0s9RYIZPVMt0HkruzzFS
	lyDsbnHRN1eoL+gipF0bZuO4I4L6ZwIGT+si0lUqVS73O3BWzmSDJWowmuFWejWD
	PeK/MGfMtmNPlZhikmfoXxLVIb6ZmMrT5juhWDEv05WTH8+gDci1qZuf7lZ3NjTn
	Cz9mwGqk524jpZmP9o5enrPMr1wh49cLDz9TFVvkCpn76aGNsgSPubuozvN9nnjD
	jj03zX1KaGuSJ1O3X2/xtEzc2gsE6e6oBKR9pX/QUaNvPrWse/umTbf8OTtDXay/
	4J/VikGNq2uUc7g0aG+/+A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023117.outbound.protection.outlook.com [40.93.201.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jajsn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 05:51:41 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpKjK2/gNarkNzUJqCgrNoFHvSpmVL/OZ3DCsZtEvhimlRGmiqsTwSvnj9FMumZYYWPXjpOaOlSW2cinWzAJ4n5QpV92+dYl/m+deCqSE7/VCFNmcw34sYdOgDyNY1RdLh7j5fciieaT3fwx4Vy8vWEYYwbw7SyS5MnjIH3khf1Y1pjN8zjMvHPT/WJTGVkVBH+ss0Lng7VCwxKH3fH61alvXdj97uovd9mcOo767E1mQlalPFQ+vixoCklKbBZ9NF3fVlP8YvN/V/IQrKcC82juPW5WOMSqelGfzN66JGXIGiLkxPZNzof5i2bHcwUXFnOb+bMnoArvPf/FZAUR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeTkHhHRWUg5+/2TpUxlgiLDE1PGH7ho1IXQlvPEz6U=;
 b=Q3r8NMUFRVNxo0meTSQq98GIPrqJtebDQwy0kpwa1/NfAvvrPzMqVm+vdjxyW/uDept9xX9Ys/AapmsZU6V0UgybnOiDS7/j1SAPSEayr3dFfm3fTuj+HZWpMWWoB9j7GNMThlKCquXDmez9jLrCu+rs6m47uFUEaoRbYtGq6oTa9pHOSXWO1jI3psmwGt+Mc1oMntQ7kIACtbRBPFrcO/dUA85VtQkA7/wEfYXZgKFuT4UXrwS/79dY9lG09mLs+GXDhyuV/RP5RhW+oOeFld618oYK2lR+BRz2Eu6toMBhqnkJ+EtYf6PJ6mQ5f6EDoNnp4p59Gy65BhKQSRP46g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeTkHhHRWUg5+/2TpUxlgiLDE1PGH7ho1IXQlvPEz6U=;
 b=WAca12IEnPv3CNCI6lpytHvCDAgVjzrz5UvlaQYK4Jn5MTi6p5mqAyEVxLNvH7TyUHFe01e/axEd+1oM19vte+clBhOx6NXvIwK+YP7cgUGA5FBvrw/+KjTg4ySJ3CTMoymy0UZkm4JHNITKRpZeWzYkYAQz+bL9ZhH/Km/WeGI=
Received: from DM6PR11CA0058.namprd11.prod.outlook.com (2603:10b6:5:14c::49)
 by PH7PR19MB5728.namprd19.prod.outlook.com (2603:10b6:510:1d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Wed, 25 Nov
 2026 11:51:37 +0000
Received: from CH7PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:5:14c:cafe::53) by DM6PR11CA0058.outlook.office365.com
 (2603:10b6:5:14c::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:51:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH7PEPF00000017.mail.protection.outlook.com (10.167.244.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.2
 via Frontend Transport; Wed, 25 Nov 2026 11:51:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E4094406555;
	Wed, 25 Nov 2026 11:51:34 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B08C9822542;
	Wed, 25 Nov 2026 11:51:34 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 3/7] ALSA: hda: cs35l41: Unset irq if not used or configured
Date: Wed, 25 Nov 2026 11:50:45 +0000
Message-ID: <20261125115124.9130-4-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125115124.9130-1-sbinding@opensource.cirrus.com>
References: <20261125115124.9130-1-sbinding@opensource.cirrus.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF00000017:EE_|PH7PR19MB5728:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 20ef190e-6479-4511-add5-08df4aea7553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700016|23010399003|16102099003|18002099003|261009223027099003|22082099003|261021121427099003|261026121527099003|56012099006|10067099003|261102123227099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	9snpW+34gdlYM9/62akpbR4xG6JvKpz5NtOcRdaIlYbGcbsu1llMgJpRFXQi4iFzCdOaqjOvpf7PsdNLDfKTBc6lLyy+xJoQ9zrQn+rMMGBPSm6p+503pEwPdUzuZ2C0+wCpiFY1IOVYH2AbKr1Ts8mHeov4ABTmajA+tvxgj2ycXF2UjwrIpPODBSGMGVo9NnaRKVsDhotdNQA3rGOUtAZ5xrzJFTzfORW17I4OVFc5qsjCnGbwG+JQ24Y8dKZy+B7WbKiwHcSti7eiDPl9rQVTTTDWRFuMxU7CueLz8WU5Iv614GkTpE8vFjmkq49eJ22WdjoSdRHcZ4oIctf/BugfMK3x/F6rZ0J4Ot0ACsWebSZAOooZHM4cpoKNXRc1Uw+pIUcC8TJZ6dlhT4JJQ6CsQpCdsDaQyOSbcKTsrKfT5FJ4EJR7RiPQjuLvTaCwYGTfHziV/fHtYpRqKOu9rGV36MfJRAbYnICpI1NC4DFA+dRXK0QahJvrx9cmCcdfQkQeMPArvK4BWHHzCtqmnUow27zrz8FcuZfjnvyzOde666fIZpgPY+6F1mdJGRIiPhtfuJQ1m3ZfZegdJaM3bI1ihUO2Ig+ZZZA6Cs9latXcutma7mWc1UWrjuzxV2KcPb5ClUTDcB2PNPmj04OX5ZyrZrJzLc2WRv3mfR2ewaC9z10Dtawv8xgWqSDizGnc7OnHlU90bqwCzc8dClaB0Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700016)(23010399003)(16102099003)(18002099003)(261009223027099003)(22082099003)(261021121427099003)(261026121527099003)(56012099006)(10067099003)(261102123227099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vurmAIARTp7ei6HeUmOab9F+URv4uNaB2JibNWwtZgzeqOvrduP+2+60Kg3Vsz6sNeIPFYFaUE5KyqCgYoAzUsPJKKUxt69EKsWDfU7tUftrDODNfkPe8x28tgnp2nB35QzWtiGLOITbVAtx4NpZMvVsrKLmLzIpqrApmZ8L1xl6YkLmhLOGEbJiSqgsrVNWUd1RfBadh5YXX7pXyTG+IjBER0v89Bme0DWVVEKEgVl7DlY4/RFApg35SpHo94fNxucjQ3PrMQ85ohCVBwe1lApl/LMf1yRFRzC7vYdqM6mQdvDOcODpksdMU6Lyg8kktKqKbyGKz6/7EHxT6R0uJzDtACkWvxQw+c3I3uVjiwDRpq5In+51R75t4c9cb+e+kX17DHV8ZmTZ9gAq9Ie/OuI7Ff3Rib/smCAdrV41p0Dn2e8cEABUBlcmU05xH8sd
X-Exchange-RoutingPolicyChecked:
	ixtSH/k5clKXcG9CcQDW+RgpefXrRGJAhJxpgbMpyg32gowuEhi09XtfWcaEQ2wUkM1m2sKo0mGbGGvptC5xl0ME1SvCLkZZwp9/rjEsEZUR41qBbRZLEdAA8iC2SQzdfpMXWGNRDxaJZlwBBYc2HRTdwpXLH2mGmQUw7i/dUFSHibLDWN8Uv9XSC5VWyPFaCTJ4/ejj/SOpCItsxdyz38CYJQhcMrFgIFC/Gmf5z9cHfU2UibvCdfAFPagzqrwLxCwWka8ubpooZOJvhERKNR3JRi+zhvX5O5BmOKb+Jz2P4Q1I5W2s8qJ4mZ14bEVwhhgubusMuu8gfuOGZqC9eQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:51:35.8752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ef190e-6479-4511-add5-08df4aea7553
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH7PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5728
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX6AFEPt5Dy+bq
 mzzmuildDCI0v4RqmkBVgVFsnQZMSr+q61vX+PVhE2HQXXM2qqDODG0dnAZoVTvmiVhCoMTO6f8
 DA+2lVJNuyGkUuR7gglbG4oEQWnQbVxAChktgfaVp/EzTjD63HYTmEDl62YuZ0PmV+ecmmUAPOn
 DrgLnGz4WvvLA8AsEcQzQb+Bra/iz1Amf1yVnAZvaKb9ss3BiMopu9/DXkTpcRAbPQyGm0+bJy5
 CTku99bjkDXNzWEJUm32X+d1ihvXu0qF0pPgnenYEi7FS4NOLt4Om4VU8+bpqyctHxwWnWDoQKN
 PdCGTAAQw1L9UMIlv3lD7c4LT/kjTfX9Fn5O6nzykASF2xVA8owWpfARXEnFZzVOElOANb4cPIf
 J30Jy3yFC511IFo3jfJOiqV4qbl64jh80JsgR8O9Tx5ITTOOJtfNMt8iedmMOKUsAWBA8D3Mdgx
 NW2K5OWWCubIvtFIyXQ==
X-Proofpoint-GUID: VJrRPK1Dp1YgYKN0C9GwPJ8OWbws_qTP
X-Proofpoint-ORIG-GUID: VJrRPK1Dp1YgYKN0C9GwPJ8OWbws_qTP
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b06cbcd cx=c_pps
 a=VfhbEJud1fjihyeaxwR2WQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=w1d2syhTAAAA:8
 a=MW-7GC1dHaY6nPwQOzoA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX5tfrFaxnWN5Z
 zt62KZGIKq0KVpz20V4WfxB1g3cY4bE6DjrJTDh+2DZAXwMD49bTmsgzH57Rl5I5gMwHBCuaZ6P
 3ijm4GG44hLdw33RgXT/UMpZp8+O/xY=
X-Proofpoint-Spam-Reason: safe

If the irq is not allocated, or does not exist in ACPI, clear the saved
irq value. This prevents the driver from being able to access an
unconfigured or unused irq later.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index f6910916ad47..2e2bf231d3fc 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -1633,6 +1633,8 @@ static void cs35l41_configure_interrupt(struct cs35l41_hda *cs35l41, int irq_pol
 					IRQF_ONESHOT | IRQF_SHARED | irq_pol,
 					0, &cs35l41_regmap_irq_chip, &cs35l41->irq_data);
 	if (ret) {
+		/* unset irq if unable to be used */
+		cs35l41->irq = 0;
 		dev_dbg(cs35l41->dev, "Unable to add IRQ Chip: %d.", ret);
 		goto err;
 	}
@@ -1712,6 +1714,9 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 
 	if (using_irq)
 		cs35l41_configure_interrupt(cs35l41, irq_pol);
+	else
+		/* Unset irq if not used */
+		cs35l41->irq = 0;
 
 	return cs35l41_hda_channel_map(cs35l41);
 }
-- 
2.43.0

