Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607518;
	b=5lmItOQJm4QOJteSXp67FQidoAdBmTUQDLldmThanbc4ggL/MR1olLVvUioR+I0qWBlU
	 h1GvDMLU/nfS2G9gz2ahnJ7qotfohZu6r0Dtpr7u/v19cuypEorlv4ic+ijNCZIaAnMR3
	 RZLJQstaaQX42IfvzQHBNV4ECRwp53/WDpqGBA+2hLOoNoT3Jtts32MDM+RKyQjZhRdmd
	 UDUHnE0vvGKUWdCOsEsHS3f+gZoRCFq5tRMw9k1/PijI1aP7N4mFZhvtzeaScp/EzBC2R
	 Q0C0Sim+JQyoCWm201PhNFh7iwbfcK+zEbLBt9r7oLKfLP6P5MhnOcBIfMvz3+rC/1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607518;
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
	bh=VTTdcuY25eUbYi02Gkppsfw0ND+hPCMKG8DxqLp9gAw=;
	b=q3g3yQ+mXCG77lfW43RL7Sxl12mTPfFbIM/+qM2ggo+4b0X/M+DUn9Afr/7Ebe3UzpEM
	 g/kTFpjldRB0KJZlM8MkFj9L7SCSIqr2p2DMwuB6IOOpoiFNP1rRBT6TQz/09EhWZkC0T
	 7UtIOguyz27CYH3rnnW1XrzyxAhMUZ8RFyHhKgjczwNPAtTrSj/Q963rq9Rycjn8KygZ4
	 Pbx6Xc+guocrXlKDnf5OsM2ovx45m8F/TAceqiELjGOcmuC6sKUMaEtYqK/1Jol2RH2p4
	 tRw48mPwPTHt5QVjXuwrgaA6byK88DBKiGH2ZHbI0uw47cUvS2Do6Yy/SYSzAp7U9cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=B35lOqX1;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=n0zul778;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFB6606A323;
	Wed, 25 Nov 2026 11:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBFB6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=B35lOqX1;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=n0zul778
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APBhVb4102441;
	Wed, 25 Nov 2026 05:51:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=VTTdcuY25eUbYi02Gkppsfw0ND+hPCMKG8DxqLp9gAw=; b=
	B35lOqX1qwSsc84bNoTvM9WAeynLZc9BL55iRASpTQYRILvkW5gZLF58SVy+jkYc
	8219zXAzx7xTUb4ujH36q5CgWd5iqVEwmzxXDaU6MKjiNyOnEw6b5ve+naf+9ei1
	z/H7e718jq/lj8wlTGsjuj6ldNMU4+8OOsrGGAIfo0+FKkZe0qo3Vi6Cuzpzpfk6
	az/nuYHiKnQdD6pEFiAFq11EQRr75FcNxFiNSkH22Ud0FMbeogvkFhzxfl2Khk3d
	JsoBbQy8AhzKjYdVA5Wfepjoa7hSO2KySeZLCvvvremzD4RtCM2PmZw8JxjA5fci
	FaTht9PAO5MH8gEqYUjqJw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021125.outbound.protection.outlook.com [52.101.52.125])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jajst-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 05:51:42 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWNtkWZZztVtSeaxAZq1sy50YO0VBOXmJ1okIvZqyFLvteuprdr3I+u3yndyWibaqVI2Xw0b6UNRHsRivbRhwF6Lx7zKGec+EndJvi/+kbiq4AXdULvmSkSJncpvuOXqRBGD1nM4zdaduxaoRhn2QSUj6bpAOrQBJiy5/tQLntTrF0bkIH+osk2zIJK0ASD8NUTe7GJH2GPAnpVksvJlmv1gjThLESh2J/NzLVCfWStKp+yuCiZ9Q8Z9XCb/oEMcUiuHxhit0TX5oy6q6x6Qv01IN6eTtGXHxqZDKnAp725PpVRjKdhnXBy4iBkhPDsHfcfjPQqI3aAa1JeKoDr0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTTdcuY25eUbYi02Gkppsfw0ND+hPCMKG8DxqLp9gAw=;
 b=jC1BrSwDa4R3bYk9E/Bu7W2rY9/xIX/wYbENlputTF/PlPh5DeDnH9ut8v2Otpg3oPlrWu3lcJyUo+rsg+x7SG6ApTmmabLhdWlQBJxzktorGT8b1RKuVCSSc8LZQvXD91IlF0XnKfPN0jr6AKwqkonEuJVLrUIJPu3MlyEqFpPl3c+2c8aM6IIvXta8VB1dViC9lEQAPgImht5wIyBTUdBfIdws8xDxBTlMdwkaefSjMFPLHh54Tyhld2au66BCuAXyFRqWRzaSKuSkmsbPrcC/wyQ8g33POus/iHsoA0QHqpTHNLQ0d0f36enytZUEvs9wOHfqsF6MF8/fLX1AKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTTdcuY25eUbYi02Gkppsfw0ND+hPCMKG8DxqLp9gAw=;
 b=n0zul7781GwW9WthBjA780yFrj7scon3t+Z78Q0avQkmNPGr+tgHtvcIooWhguwmEwkYp2Drf6IwnJvQ2UYYc4YNm0Tooyuu8YNUEkJz+EJ4TiWG+/0JEFcwQHVFmEvb8NU9h6EsuFQT0biHGDrs+zCuNmmbqsTI/mAZwXnj6Vk=
Received: from CH5P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::11)
 by SN4PR19MB997482.namprd19.prod.outlook.com (2603:10b6:806:507::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 11:51:38 +0000
Received: from CH7PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:1ee:cafe::65) by CH5P222CA0023.outlook.office365.com
 (2603:10b6:610:1ee::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:51:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH7PEPF00000015.mail.protection.outlook.com (10.167.244.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.2
 via Frontend Transport; Wed, 25 Nov 2026 11:51:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 24F10406559;
	Wed, 25 Nov 2026 11:51:35 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E8B22822542;
	Wed, 25 Nov 2026 11:51:34 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 4/7] ALSA: hda/cs35l41: Split System Suspend/Resume callbacks
Date: Wed, 25 Nov 2026 11:50:46 +0000
Message-ID: <20261125115124.9130-5-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH7PEPF00000015:EE_|SN4PR19MB997482:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fa0c274f-1843-4656-b5bb-08df4aea7570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|23010399003|376014|6133799003|261009223027099003|18002099003|22082099003|16102099003|56012099006|11063799006|261028144727099003|261102123227099003|261102130727099003|261026121527099003|261021123027099003|261022075727099003|261021121427099003|261026140227099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Ef7wpIPGYiZ+QVDq5uL0Z4MWhIAek1qgbUrU9g95gRR2C8Fi3Zwq4GsZAix8rxdCr4dsH48phPMBABg3wnDCaTUVtU8VTANo+zn40YyKRbZ5JxHOi1/OaIe7YDZ2zEG6c6FIxFDonZby/SkKlGOZlPqdVs3vYz0W10LQlse/uSxqKWpESuQd2fPK1lfFvZaNn2DeMz/3mshiULeah/ARH1dnqGP1tQPNVtv/8nj90byUI2BpG4ntDRoJKXDtcAYLaG8Q+O2AC28BAB3bTpAdaQdQupOYRoQ5o3lu1tF2J9Za1kqGqW2N/KpIMwUf1Dq9yiyXM/t1FdvQlXOLeF1x32vTOn1tBqC1cvnfFXs3ezPRRAROQE+qeWlaw2aDWecd27rmZ7Y+l3z9/3KXo/ouXANZSvu9vz9w2UB+37B/vp7bTgQ4d3+99iwBrBRwqlWyi7bONqrPCsB/dGwJQQXizkTcRB96uTDgimnM4On1wyNRHD6GcRwQgTDYN5osBXtbzSxRq/qdBzF94BLJ9VQozP9A/1Z/CKihsrItJZYvD6WHwkMkSDshAB0/Rp49v3JTxrZdHnDnJbU9uvIs25vvUbjmoJIu7bLy32NceGi8xlljCYGfSsjtdTLOf6xUXUDBbwvtICoKoy5kSlicz0lJFk50g0N89pJ3inMhunv/VoPse6cAH4gJK2xmwT4PIOR18112iRvT1LuN1EK76/6Zdw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(23010399003)(376014)(6133799003)(261009223027099003)(18002099003)(22082099003)(16102099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261102130727099003)(261026121527099003)(261021123027099003)(261022075727099003)(261021121427099003)(261026140227099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/bihn75Lf2MuD4rto0jvJ0jL+vp4qSOaa0jQoPwF2tH826ZjWyP8nbRIe2aCQHQ4Mpn8MKKQoVPODJg8g7XalHrulQAxk+jQlWXuMQMdxzF3anku961XVDWM1XXCXwgQcl+Ptcn2l+c30Xr03HzEkXRti/RnvVXuk9GpxjycN+SRhlo4Ks7bTFIFlF/+SLERT/5kTeNuMp2p1dNCfTOjI8/WPSPGgRScH5bCIjkAnbzodhDWANHgY+2TRfvLbmJUyIani8lRM+cb0SJM/nl8a9JllOd4WWh5g+wS6yxbiUWsFUkGmFhAn9fX7sAkmdwJ1WCzg248Y89B4Z38LK5sSxtJuVHVoW15YGikXoZvf17fvNlq0IUDsQCW+Mh8sQMh5IqNuGtVldA1kv4idfLUfyu16tp4VyhtTom1t3PYlIeo4vIxx+ehEvZF5b/MYTOT
X-Exchange-RoutingPolicyChecked:
	Rr47yYaOPKqfO4p+JxykzydV8IAk8xX5s1Nd+jy/nv85b5DUEcpDRdMpKywdsgKvkdKLgrA+d0v9Le05p/DzXQUXedbVNtGFYvlcXgbuorx/7n79YvKyecA6pupjSCiIT40cUmY4oVy8aWFDCxt3Y7s54J5yelaMrrGPeEdCylPNR/PNU/B4NdmeQDk4WZdmRQZp+W3irxa7rtiamm0GF/OnmtTu+td1jgUD+bI0G3dXPAN9FffMo+crtx97jRFQg4Hrz3NW6TuyKfHPmBBJ1J0nSVeifCxRsWs5KHHBm52AjVuy9T68DwL0QnZJjtaKm+AXzkjrbbBipIiVEkOkUw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:51:36.0660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0c274f-1843-4656-b5bb-08df4aea7570
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH7PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR19MB997482
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX/H2KpE3iVOvi
 7kA5STDZa9AEjBSQRhc1RdzXuiYHsL12d4G25wy/4QmM2rhUoGjDdkFteBVl0Zeqx0cBWdneIyL
 HrS3d1T5CxEkCcKSHtD6lzWQk88ADOtvw7LRI1hS+zGtoa10p5lgSsXjZ678IBTeeGHqUZHXYza
 DzHbHov+eSICLyIG7DfqdpiJ8OlLp5bqjMz8pDQJBI1b2rR0z1yyk+sMRtq0v5B9AHG1/RQv6Lq
 B3p9Pmd7wzianvY8kWraxK/m51KRm8urIQffLXlZqrY2/aoYxVsCU1KUaOPRrsZ94RVQMoBuuK3
 IrXppIsHkpnOiQ/GeN2ge3uSyjna5N8wYDZbfBhBFNY/v/gWWNRAiyE/7Dsb9epkHrWdkzjvgkd
 4/TviZygkoSLYWyqgCR8elNbABepWRmaNLeFPIw6uXxuk++BYNfPRwLnSPuoohDonDBVFUHhoZ6
 L2xNueQ0O6vG0EwSD3g==
X-Proofpoint-GUID: 0axQ5thnJ6DUgeQ0LZ1UTqxoUZrnUJNF
X-Proofpoint-ORIG-GUID: 0axQ5thnJ6DUgeQ0LZ1UTqxoUZrnUJNF
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b06cbce cx=c_pps
 a=/Qmun3bZW4YbXd3UFKUczw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=VihFFcK-PB8VhYcDvmoA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX6amTc2jYn6Ap
 6LDzUXDVkloWyvbweX8/yoTAirK/4kKDWI42xfCyB7g1LqhTnJ2YtJQ8jR4UZ0TA6laANWCyn20
 Lb2oYfm5JpIcRfQY7ltcdPJLR0UBB+8=
X-Proofpoint-Spam-Reason: safe

Currently, the CS35L41 driver does most of its system suspend and
resume functions inside single suspend and resume callbacks.

Ensure IRQs are correctly disabled and enabled at the right times
during the System Suspend and Resume process, to ensure we don't get
spurious interrupts which cause issues.

Additionally, move the GPIO reset into the .resume_early() callback to
ensure both amps are reset first, before the .resume() callback is
called for each amp, in the case where there is a shared reset.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 101 ++++++++++++++++++---
 1 file changed, 88 insertions(+), 13 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index 2e2bf231d3fc..b30f000dab71 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -942,18 +942,27 @@ static int cs35l41_system_suspend(struct device *dev)
 
 	dev_dbg(cs35l41->dev, "System Suspend\n");
 
-	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH) {
-		dev_err_once(cs35l41->dev, "System Suspend not supported\n");
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH)
 		return 0; /* don't block the whole system suspend */
-	}
 
 	scoped_guard(mutex, &cs35l41->fw_mutex) {
 		if (cs35l41->playback_started)
 			cs35l41_hda_pause_done(dev);
 	}
 
+	/*
+	 * The interrupt line is normally shared, but after we start suspending
+	 * we can't check if our device is the source of an interrupt, and can't
+	 * clear it. Prevent this race by temporarily disabling the parent irq
+	 * until we reach _noirq.
+	 */
+	if (cs35l41->irq)
+		disable_irq(cs35l41->irq);
+
 	ret = pm_runtime_force_suspend(dev);
 	if (ret) {
+		if (cs35l41->irq)
+			enable_irq(cs35l41->irq);
 		dev_err(dev, "System Suspend Failed, unable to runtime suspend: %d\n", ret);
 		return ret;
 	}
@@ -963,46 +972,110 @@ static int cs35l41_system_suspend(struct device *dev)
 	if (ret)
 		dev_err(dev, "System Suspend Failed, not ready for Reset: %d\n", ret);
 
+	dev_dbg(cs35l41->dev, "System Suspended\n");
+
+	return ret;
+}
+
+static int cs35l41_system_suspend_late(struct device *dev)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH)
+		return 0; /* don't block the whole system suspend */
+
+	/*
+	 * RESET is usually shared by all amps so it must not be asserted until
+	 * all driver instances have done their suspend() stage.
+	 */
 	if (cs35l41->reset_gpio) {
 		dev_info(cs35l41->dev, "Asserting Reset\n");
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 		usleep_range(2000, 2100);
 	}
 
-	dev_dbg(cs35l41->dev, "System Suspended\n");
-
-	return ret;
+	return 0;
 }
 
-static int cs35l41_system_resume(struct device *dev)
+static int cs35l41_system_suspend_noirq(struct device *dev)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
-	int ret;
 
-	dev_dbg(cs35l41->dev, "System Resume\n");
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH)
+		return 0; /* don't block the whole system suspend */
+
+	/* Handlers are now disabled so the parent IRQ can safely be re-enabled. */
+	if (cs35l41->irq)
+		enable_irq(cs35l41->irq);
+
+	return 0;
+}
+
+static int cs35l41_system_resume_noirq(struct device *dev)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 
 	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH) {
 		dev_err_once(cs35l41->dev, "System Resume not supported\n");
 		return 0; /* don't block the whole system resume */
 	}
 
+	/*
+	 * WAKE interrupts unmask if the CS35L41 resets, which can cause
+	 * spurious interrupts, and the interrupt line is normally shared.
+	 * We can't check if our device is the source of an interrupt, and can't
+	 * clear it, until it has fully resumed. Prevent this race by temporarily
+	 * disabling the parent irq until we complete resume().
+	 */
+	if (cs35l41->irq)
+		disable_irq(cs35l41->irq);
+
+	return 0;
+}
+
+static int cs35l41_system_resume_early(struct device *dev)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH)
+		return 0; /* don't block the whole system resume */
+
 	if (cs35l41->reset_gpio) {
+		dev_info(cs35l41->dev, "Deasserting Reset\n");
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 		usleep_range(2000, 2100);
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 1);
+		usleep_range(2000, 2100);
 	}
 
-	usleep_range(2000, 2100);
+	return 0;
+}
+
+static int cs35l41_system_resume(struct device *dev)
+{
+	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
+	int ret;
+
+	dev_dbg(cs35l41->dev, "System Resume\n");
+
+	if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST_NO_VSPK_SWITCH)
+		return 0; /* don't block the whole system resume */
 
 	regcache_cache_only(cs35l41->regmap, false);
 
 	ret = cs35l41_reset_and_boot(cs35l41->dev, cs35l41->regmap);
-	if (ret)
-		return ret;
 
 	regcache_cache_only(cs35l41->regmap, true);
+	if (ret) {
+		dev_err(cs35l41->dev, "System Resume Failed: Boot Failed: %d\n", ret);
+		if (cs35l41->irq)
+			enable_irq(cs35l41->irq);
+		return ret;
+	}
 
 	ret = pm_runtime_force_resume(dev);
+	if (cs35l41->irq)
+		enable_irq(cs35l41->irq);
 	if (ret) {
 		dev_err(dev, "System Resume Failed: Unable to runtime resume: %d\n", ret);
 		return ret;
@@ -1015,7 +1088,7 @@ static int cs35l41_system_resume(struct device *dev)
 		schedule_work(&cs35l41->fw_load_work);
 	}
 
-	return ret;
+	return 0;
 }
 
 static int cs35l41_runtime_idle(struct device *dev)
@@ -2083,6 +2156,8 @@ const struct dev_pm_ops cs35l41_hda_pm_ops = {
 		       cs35l41_runtime_idle)
 	.prepare = cs35l41_system_suspend_prep,
 	SYSTEM_SLEEP_PM_OPS(cs35l41_system_suspend, cs35l41_system_resume)
+	LATE_SYSTEM_SLEEP_PM_OPS(cs35l41_system_suspend_late, cs35l41_system_resume_early)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs35l41_system_suspend_noirq, cs35l41_system_resume_noirq)
 };
 EXPORT_SYMBOL_NS_GPL(cs35l41_hda_pm_ops, "SND_HDA_SCODEC_CS35L41");
 
-- 
2.43.0

