Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795540036;
	b=Od374tnOo7QAk9Jh+F/MJIvwTyThsWb+Hg/OLA6mAogWxT1Fy+0np3FwNvTYstm6iRNH
	 r6zSZJi+LHbVawH6b39NBDDdl8Xu9dGNsHv8qPOHKw2HgLHXGxHa/BKHp46YcVrMXgPd5
	 nmi6zQT4xeHuEUZluZyKCfATu1Y2sUrGjhNVh0tsByw8WOQWi5g6/8CklSzCiBTm9JVuZ
	 NYG/sGgW7oOAqkYeetk9d8Y73ELDRnxa79/b71Atw/yIZq5BwaBR6NbRzZotSnsQP82qT
	 5tOQbIRuV8b2IogutPb4VuikUjj3EH+u6oprzF7rbztnAcU0Mg4fSKehEQ2EFRdMQqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=xcPHBpYi+Rzo1TyMzF8PBsQTsbWF6wRoewTRjb6fKSY=;
	b=h/aEr3z8hBhjDg83a+sUmeX6BrENvy7iMAWV4a2Cv/Ck9oxLz0+jYvTAMuaHhh8DcLXt
	 Xccai/RD0lk7JnfSof2Cri1gLrZdhzA9B62d5b+K8saC5y6jm1d65K+wxponwLq2i6XUO
	 U49B7bXnoM0OBnW71u0e2ah5P7JcCvhE0GuhdDRqOD8C3Zgz3jeEckzYaajT6BuAMH5UR
	 26XxG/hBrePxEfLSVMFWnDxC103A3xdWmQ9+/3pCrweGkXDP6vFohJLMMK+tWnuCzv6J0
	 yQ1ciim88eZLmRoEK8DIofy34aRQMhFmMUYXb2/x1ELrekk5ByR8W9YCvWiAkrICCkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=TKWQQcIH;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="Z6xIB+j/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90565606A323;
	Tue, 24 Nov 2026 17:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90565606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=TKWQQcIH;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Z6xIB+j/
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFhZbK3999144;
	Tue, 24 Nov 2026 11:06:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=xcPHBpYi+Rzo1TyMzF
	8PBsQTsbWF6wRoewTRjb6fKSY=; b=TKWQQcIHoeiByu4blTX9DYtYyC/yuidzrN
	DT5T415pZdJy7IkUCsGAGvr0nHMne+btayT3zAtrK9VVnhqW4G+dTgbcEB2+Kkxs
	pcPhaFsUeJkh8C44f1sU4WQk+pJJxuMZicfhA/fI0Rzj8edQQN1Z5GMDvzUOGC/t
	UJqnYZ7jJ+jLUb9zYvebSdCzv8DBUz0jQzHdIR3VuvSDEPlYuOhYVbXNSk1iBvAS
	NRvYz8QryBSLem8f1OOuRcgVkpnOgFhDA5zlii22bveSRoqy8X0adQQIzc5xZHCx
	5MhJxxKy89uKNua/V46CK65EQBP2gDKvyOwGLwgb0AWffZOK+ASg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021111.outbound.protection.outlook.com [40.93.194.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j5188152v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 11:06:53 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxUqpSGAa3xd6AbqZZXSulwX0JZcWS77dQhOTMSEgGS73Yu1Xe5a75x5V14sYjpWRNFq5jerH7pKMpW16C5LsJVQNeYQ+dcICr8HKNPfGKl81l6jHLf42rvf8NnTpEm+p6wp6I3op63GiqhRJe0mqFDqcW74EekdEqGEmS4/dlLIOIBRHKDj1rJ1QODmddaN4KyxCDM/lJ/jjYSdGKRr+54CI387xaaUV19Fti6y/qXzqx1hglgijH5HQkHAbnuWPxr+VJyB9QIESgPBVNBOEFxzkCootjibESzIJ0PcGmtq/etfaPe7r+9ZDNwFsRY2FMV89pmz9Kgp3LkChowlIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcPHBpYi+Rzo1TyMzF8PBsQTsbWF6wRoewTRjb6fKSY=;
 b=u/UDdagvT2PHrw2Id4QHysgsCe+8TqkKBEEq1SvRBuHllr9WLIaeJxvGIqo80i+JB2V5oIFrRnz8TYT4Ps0R94IHwzPgA5qBNfXpicnOmZ/jIx9/cUlE7SqV8ozWam5usYFNSlg5KVWi4+UfY3DJzjs1HQYz9ZXLrpCumgSrlEg+DGyF6XE7bPUJP6UHk5Uvv1SMft9CkJhUsr1H3B1zDOKPobrFGtPcFIioWq760PTRnl+m3A1Evbk4nE0JZBhGzdN9hkKZO7PuMqHcP3utULZeJ6/Ejl/YYDmRxa7fl/aJvMkaAp5HW63g4SPCXsz5AbqkNaDNkJjbTUEsQyvdDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcPHBpYi+Rzo1TyMzF8PBsQTsbWF6wRoewTRjb6fKSY=;
 b=Z6xIB+j/XoPRaEyPWmMvvcZxqtt8LdOUeXbjpvyzPDN+ofEVgEKjZ8BUXjGF5CH2V6RA+ByNiLjRV7YEAPne0qsbun3hpR13YTmextZrOHYa5Vgi6Zmp9MZ2zJV7LIpb1gD8G0dfznEogpu2Iz7AaUqtuFVUxczRR/Ob7152I5g=
Received: from BN9PR03CA0195.namprd03.prod.outlook.com (2603:10b6:408:f9::20)
 by SJ2PR19MB8124.namprd19.prod.outlook.com (2603:10b6:a03:53f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 17:06:49 +0000
Received: from BN3PEPF00022BD8.namprd03.prod.outlook.com
 (2603:10b6:408:f9:cafe::4b) by BN9PR03CA0195.outlook.office365.com
 (2603:10b6:408:f9::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 17:06:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BD8.mail.protection.outlook.com (10.167.248.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Tue, 24 Nov 2026 17:06:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F2A49406550;
	Tue, 24 Nov 2026 17:06:46 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D8DA5822542;
	Tue, 24 Nov 2026 17:06:46 +0000 (UTC)
Date: Tue, 24 Nov 2026 17:06:45 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: vkoul@kernel.org, broonie@kernel.org, yung-chuan.liao@linux.intel.com,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        kai.vehmanen@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v4 1/4] ASoC: SOF: Intel: Add IRQ chip to distribute the
 SoundWire IRQ
Message-ID: <awXEJTvuD69pszTw@opensource.cirrus.com>
References: <20261124161001.702882-1-ckeepax@opensource.cirrus.com>
 <20261124161001.702882-2-ckeepax@opensource.cirrus.com>
 <44756a36-bda7-4a3e-b3f3-67c2aa9b8883@linux.dev>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44756a36-bda7-4a3e-b3f3-67c2aa9b8883@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD8:EE_|SJ2PR19MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: fa330f3a-3580-4550-3eb3-08df4a4d5354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|23010399003|82310400026|10067099003|261022105027099003|261028144727099003|4143699003|261022115727099003|261026140227099003|261021135927099003|261026121527099003|261021121427099003|11063799006|261022075727099003|261102123227099003|56012099006|6133799003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pnlw8xk/Rm7DETJQ6Egrl2++R6xRKgK/mJRbq2vbQRAgcWcUoaAXCqM7kpO2cJ+44hlC+Irt0fXNcAQPFyD6/f2qw0I6OwEQ7YyE5ilzhOgbnyFAGh+yc65gsgei35qHUm58w6tIkhXkCBK6IyOuFNlbciufykFm9Pl8SVdQ0Ivo8VFLq5OkHSCCXcwEhzHJF3/ipUWZWTR6tmQmBybmluebEggfDVY/u5SvPVL87VTGeHjgyoO5YLuMiXMzRR0yUaZJUtg7HmfreNbAplTSVCnGyfwbFriFRlfENQm/1FRZLWwgF6SsuZwQUOgLJsQprOzb9GlTM2Kj2hRmkY4zU0P4aaZ6IbHiNgr5sVYU9inwdB8a02mj39+hUZjMGCQoXua7busM48L0y85bd9KJrq44e46VlDghjKo7CpqtSmbJVJcgwlDpCeW18kjZ94NuYK9kNkaNxnTwImK2c+9NdOgYskz/7D1fxCG+U0i13Igk7q878vttkHIHFSyXW2m23dsOSZXnKPT3a6Nm+XH7u4TcbxmYF1YoCeJQ+XNKD7V8E9P6EOAoF2kjqvQzZI4XVi8KdsOjySqylmzGKkSquR0CxNeNggKwYEjMnjDqi8l1OPSkXwBSPEj7xaDvJ0pif01htpipLN56NvpaYmDzIPZtSd5KxPZsA5+78j5njBqn3FOZtk6irszGRyeDKkzx/oj63d365iOL0LOgtAMkig==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(23010399003)(82310400026)(10067099003)(261022105027099003)(261028144727099003)(4143699003)(261022115727099003)(261026140227099003)(261021135927099003)(261026121527099003)(261021121427099003)(11063799006)(261022075727099003)(261102123227099003)(56012099006)(6133799003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9JKFGBHJ1ZA6YmmIbue63qX5FIyytHSfqUbAchTqHt3baPirnbJtPcnPwZaL+3aZiwFyz8DH2kQhKvqQhvQS+qGU1nsZUKeDwcTIBnLnImvmAZhCUzwVPal7qQO3CVktpwEla4PEV9NgszlpQQKYUB8CjzwP25Sa6xYrtDJFa5yccMuXHzEq8pa4hFxLx3yLNfh/QFk/p3eNJMJ6QXtFhnOSDpTDoUHlwqVbdoyIDftle5Tuz2Zo72/WRjhI4KIgAD6EpBg1mdClCW5UUOv/R4EtkH05SQAFquz2Q8EVnsbPoadALaLgxIwJKakP7ZU+GZpM7XcBMkZHVTqklRjVklt77EquD//oyaYS3mw18+b3VNi9jqVjDssCj8BPEIFFkZxTRpkWXOqju7pCJUL/2XdVWIGpR9nyxa/xHCfAGkQBhUD4mBCbOVJvKJFjqffw
X-Exchange-RoutingPolicyChecked:
	aHfABPCmLjb74S+u9wui9iZtF+dyOycNfWhRpuEB9IzxLbRUrwH6LaeIfh+gCYdk6CvO2gGvGuoRtpk5MkzJGV1k7LEdS+nayry0X885ovLgzeBsuoJTm/pjeFSS1kYO3mtbRHIbkpuFfFeVQ3SHB+HGCtIrlsOYHBDHaaOdXRxu58U8jqk3s1KzSN+g88HGC8KBaO7zbM6poOxhmrJJ8bjEOq7zQTMFDHtFTEyBJvrRlmqoPITUM/cF/YhuiWfzH1v6lZIOPxUNRkFDplfDwvCd2nGbbtrL07q/ajNWn/v+VI6Zra2l+PT1ikrb2W2HK/GYSx3+FrUHXCQbY9c24A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:06:47.8722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa330f3a-3580-4550-3eb3-08df4a4d5354
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BD8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB8124
X-Proofpoint-ORIG-GUID: f_2ZNG_RYW_e18r27y9wnH4AdAJhy1jY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NiBTYWx0ZWRfXwmvLHYuec1kr
 S85acOuVqkjo3btmfF9QpgQIKnXZ5TTW4P5CpCiSd7b6hvFKizZbTuAgNoZnoMXQYMNYmNdvZyW
 8X3euvPavNuJKBOvHdy44AEIjG7lLHizZmO8PYut0Aw4c5pLmB/OzCY9fZhPYejnJvom0nNjvOB
 SEAlwSWMhRmM0pRE2VOATHBBD0/jZHxQHol1focNT60Co+v38RJDgkqxW9slx9K6oyQwuQEO+NS
 FUUTuUZ6clfvrO7S19aYpI8dclBzMYbSW2HQ3WWMIpVR70x01zi3YcfJTLb1x8HwWWYIV4S6QWB
 X/Pu8uS/QoIc95Tjm8B56mcJqHX1f8iCt72a2mYbN9/Kp7JDxJctL6TGlMjdTKMkjO/7gWxJTgJ
 +2CJgPt34P64rAHI92Tpa9zoOjiLksIUVUQto8S15tajJWq/jKYy8hL5D5T7bD10WGuEKM+zxUe
 W1dN5AHqQMYCHrp2X1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NiBTYWx0ZWRfX3h7JJeiI+M2L
 QeCKUwKxqYhnhg1zAFNyAqw+6VI1g30bp64mrAM+gRCmaGCKyu5WDjxNHBoDQ3kXeAKue8PknOK
 8xggRw+3CARh8ihCtOd6tj4yX9iWpOY=
X-Proofpoint-GUID: f_2ZNG_RYW_e18r27y9wnH4AdAJhy1jY
X-Authority-Analysis: v=2.4 cv=BuEIUoX5 c=1 sm=1 tr=0 ts=6b05c42d cx=c_pps
 a=Xow/CfGS+sd61STD3JSCXQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=SIgR5_-221wWvn6oliIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 24, 2026 at 05:49:21PM +0100, Pierre-Louis Bossart wrote:
> On 11/24/26 17:09, Charles Keepax wrote:
> > Add an IRQ chip into the HDA code that can be used to trigger the
> > SoundWire IRQ for each link. Currently, only the SoundWire IRQ
> > is moved over to this IRQ chip, although in time the other IRQ
> > functions could be too.
> > 
> > This will allow refactoring such that the individual links each
> > request and free their IRQs locally, rather than having to rely
> > on looping over a list of links which is tricky to maintain while
> > destroying the devices.
> 
> Well, there's no such thing as a per-link SoundWire IRQ...
> 
> The hardware is built in such a way that once a global interrupt is
> received at the HDAudio controller level, the handler has to check if
> this was an IPC, HDA, SoundWire interrupt - in that order. And in the
> latter case there's no other way than iterating over each link.

Yeah, hence why we add the IRQ domain and claim a shared interrupt.
I will reword a bit for the next spin.

> Using an abstraction to make each interrupt source 'self-contained'
> would be fine and probably make the code cleaner, but then why stop at
> SoundWire? I'd err on the side of 'go big or go home'...

Yeah this definitely could be expanded to the other handlers, as
I note in one of the commit messages. But not really sure I want
to go that far as it no longer relates to the issues I am trying
to solve.

> At any rate this would be a significant change on both SOF/HDA and
> SoundWire sides that should be handled as a well-tested prerequisite to
> the series to allow for communication with the device during remove - it
> doesn't seem right as a patch casually added in a v4...

I can split this patch out to a separate series if you prefer?

Apologies, for the changes a few revisions in but I had generally
imagined doing this would be too much work, hence the more hacky
approach in the previous versions. But it turned out the rabbit
hole was much shallower than I thought.

Thanks,
Charles
