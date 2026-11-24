Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795536708;
	b=deBvMm7P2TKg/GHtPZ2laFzHpWH3iYN3MK5IfVK3gWpOX0Y2qTQMjD2klbLRpnbgFDGW
	 3r1+irII637Vzr941fjWQzsYrhT9ie4vNbOZkn1K2VwJ6CKJzMRA8pVqKjM5iRtcMVT1D
	 b2KNpheoUKkLK9O4HJkJmafM9xpgT3V6NDUlWn12j2pO5brrEgoYqyXoPYBW+P4xKU1dH
	 zWYTCuEYSoM9SuzYW32TQnFBZ+f4T55S3LROotWFxgBS6KGJwgKRDiCxmtdORL8IWXroC
	 scdqz/0sHxquLCssejjaItwXJ4bBjsY3j2qd2k1AmbJSCyHoK79Su14G84HLPAlvVkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536708;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=annkQ/nMqlbWK8xSFbj3wl0NrlxIbMVwdqpwscCkO8I=;
	b=YofhIU37L/WKNJMfxYygSrC+cOonVkTXQ+h+7wQu4lXo7SwPtglZvqwXluVUPfXq/vSf
	 Ky/OzRNMUAXFtnC2Fa1H+MAVpeLc7twxjOfTJ6V5nWn8H3JXYpWDayT8Uk+DQZgIVI2Fe
	 V5bKCZtPuaCKQ5hp8xjzSVKESS0ZIc7jyrTwtQxUXRhwa7di4d0A9JHNE1r24xm6VhyUE
	 n1TjtLIH0FXf+Zp6C4JozU6/Q2ToTxNbBf0pOCPL4mtVWry7FjQBI4XDCSc5Hh+DpcJ2K
	 S8A0UpXfL+qiXHxfcWqdGIsMwxvIRld1e70FEUjAviWSntvXTjAxJ/hWwpwqt5vpj9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="mxah9/T2";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=kDGQ7pJc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C80606A31E;
	Tue, 24 Nov 2026 16:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32C80606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=mxah9/T2;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=kDGQ7pJc
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFhcPp3999161;
	Tue, 24 Nov 2026 10:10:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=annkQ/nMqlbWK8xS
	Fbj3wl0NrlxIbMVwdqpwscCkO8I=; b=mxah9/T2zGpIvQtVeYBK+JnNJQnZdmsg
	nSZjUxVml18jZxWn1aGOBYZn07o0mdPSkmRp4ik2myB3v6en6piWZt22VJvFgh46
	9Wa5w/zuHnCe8Rye4io7kxZbCcOaoapQ+XE/TvgXJBN+7lDfCcnk4y4HTSYZrgkI
	Nt6R2glT1SE9I3/KjDfu/Pcp4AoM73wQFz59y1AswqlUrxONb4YuT8EeM+jLl+GR
	prCss+DFqG9dL873j5uFE5bgGBDK4mYSLxpZI9DO0vkMMBkgCVQ9YXEzKHsvo3gG
	lXZJGtF5oEWneKVroeQj4iwTzSHUiCy6mfCsnHaFgM/3GSGzgXo33Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022141.outbound.protection.outlook.com [52.101.43.141])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j518811ac-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 10:10:14 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXk9NoL2jXsp0kaSb0CHPzXGGfp7dKTs0PtUTqKDUXxh5vn8WTnVp6VQxGQU+hmrVX965C0Bn6dhnJNjejMgD0f2zZ/zNp+iNlG4i0qM4UJAe4w5IHpNwwz4NwhPr+vGwowvgnL8LX00PVHxKvHfICWprvO8t1l4NER62YbWjoKhmQM/3GaUUwbDEiZSAyS2JVxw29IzQYVvGAOrUGU++B7BtINYzQv5XPDSJHGKk2JrCs52YRhC8TWRCpGMjSOZ1grU4DeRboyWyuJZrOmp+ct1Zx98AUvOmHPO1dA4v72dsFV3rqM0B4fC1G7P5VNE4JhvvIBkr869PHIHZPJ9Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=annkQ/nMqlbWK8xSFbj3wl0NrlxIbMVwdqpwscCkO8I=;
 b=QTCg84Wh0DWxoIxj4XYJBZg3+qV+D/Z3EZdGcUCp7bTO7Z/Bbp1ZXSXoXm+CeWsOmTNRUAHbGb+6ZRgM4/UCkn4Hk34yP8gO0YhtFeAYs6rBcl+8GDSTEb3/zW+voBK/XJrLzGvtmGVbc1WcBYoEWmmeo8Wfe/Am+3cAU8QaVGuDD+bcDOfeNCMQFWertP7CF45Tdx2mcUJw4/FvHB8FgLZX+Unngk3Pj/++JIMvqacBilLxdWLCPCA5BREgl8W/69+QLGVFw2HYwvgBrvDJkvNlbcEzxAAnQqKQEsZFseaHYXscrVwXMAKzBQJsRAC+TTLlrQzTlsTv7HAKl8+cyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=annkQ/nMqlbWK8xSFbj3wl0NrlxIbMVwdqpwscCkO8I=;
 b=kDGQ7pJcEsGyV75nW723TUYG7qmvQ7oYLvPC+uacqANvwoPYUzohiwbSl+LaqfNw+fB3WQ+zxwtwlv1I4cTnCLTYHRCAJwBQM/vSp2+OehO/BiERrrJcNXwZEznSrS3iyT8TR+cMwcv4aOPVnMB4nndO4Vz2JOf1nLjRhnCiheE=
Received: from CY5PR15CA0156.namprd15.prod.outlook.com (2603:10b6:930:67::22)
 by DM6PR19MB4025.namprd19.prod.outlook.com (2603:10b6:5:24b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 16:10:08 +0000
Received: from CY5PEPF00000E79.namprd02.prod.outlook.com
 (2603:10b6:930:67:cafe::a2) by CY5PR15CA0156.outlook.office365.com
 (2603:10b6:930:67::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 16:10:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY5PEPF00000E79.mail.protection.outlook.com (10.167.247.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Tue, 24 Nov 2026 16:10:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 365DD406552;
	Tue, 24 Nov 2026 16:10:05 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0AB13822542;
	Tue, 24 Nov 2026 16:10:05 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        kai.vehmanen@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 0/4] Allow SoundWire devices to communicate during remove
Date: Tue, 24 Nov 2026 16:09:57 +0000
Message-ID: <20261124161001.702882-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E79:EE_|DM6PR19MB4025:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 070f6af8-fbf3-41c3-0fea-08df4a456802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|23010399003|376014|82310400026|261022105027099003|10067099003|261021135927099003|11063799006|56012099006|261028144727099003|261026121527099003|261021123027099003|261021121427099003|261009223027099003|261026140227099003|261102123227099003|261022075727099003|18002099003|16102099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	vSKDBrrPqks38CpDWFzqmSYXRlrX+EcKz7QBOFxGiz7p0bgg6WE3Bqcpq43x9pgIha6eVQ9+T/sbTk0qJtr8EUY6MMrHWYT4ZSF+t6orsEDHGUAR/u7Kh0vwLlB1gTOFrvyur4pJFYXix6HkFgPuDxx16XdRLHwWPptEZvyy6JFyknclkT20DV/4XyjM8Du79gOeDSSA54N4flWLqJuO6Llu9+yOBjri+cdnczdh3n7vGvYho9aMl03V/MZy8gmcK4dunx9hZOVGWbajfCLv1JbwktwDRX6+Jh0qPjLq+M1CJQB+tARVEbdeIcM+6R98gP+erSrHW1Jcs7CeB3QXqUGnFXLMstMuGQfIksW5Ueae2cvFzVHZjsjEEnsOcPHKAwoWLxlTZLxTJDJ1SyiIfgwce80d2IZewX3qRt7Z1ilEVU9lt1WNRw78N+GWdLimePYX4TMitbBaSaz2Fjk6rMgk9dwPVZOY8fQ5Yln4kmnZF1PTqF0l7/n467/6xA8CWcK6NZg/OpwmYpkPHGvzxM9GhOE7vtLPu1e7gZCl8XN0xbvtQWUh2XJlx+RQAPg7Mpq2UJvLGHEckZ2E46fCB3PzvlkDbZ0nJ0nj7fwx6FpDZFWX6d3NujdM9At2unU83Lf3JKIMUo1uqW0CswlyRoiIfmjnH6G1Cr4KE9I3WWYDt/3KbxiJdCeEZmSpCqASfwEraTCzg/hyxi5rKQLqiA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(23010399003)(376014)(82310400026)(261022105027099003)(10067099003)(261021135927099003)(11063799006)(56012099006)(261028144727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261009223027099003)(261026140227099003)(261102123227099003)(261022075727099003)(18002099003)(16102099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PL5HCjmFvs2ENvyNYPL1CoMO9bU1dNPW2ayEN37dGkfc1v+d5aOAM6lfQoNsJH0gnrpqP6OD/C7F/b4F2vJx0WilcNDeMmsR0AD+0dWLHh19HHygHhYuBgoq4alPdzSSg5MsBfvoo8YtfYsP6fenG+GHhmrEr+OSso4d4O9rCvq/zDAX9Ly1Au5jIE5jLuZluMn62ECWpU7dT/qhJ3ldR4xxXdFAA4cNC2y84Up3k9cyVAWwJ/O1SrTE2RTrsN8WCpaWWyv2ZsgzdUKYXnOnWr/g5kk8iNNoWK4zsPjJsC1BO+AGk01/JSsZKYpf4WjSjScZMog5HwRh7z6hKqV0PyXZwV9nIYbo5fCHbRkzqpr6ZAkaiuxRYRjZF8kn6+AJJUbJCBxtWmgDx4npw29B9OwHO4R2u7JMi8tIX1JuVEaTN4ZXlm9MdUAQBKSQgcD8
X-Exchange-RoutingPolicyChecked:
	dr+SrkOITixuO9knsIsltC0VJnlEEvf3JANfjeNMbG0jFR2HEO1Vcu5mK8Wttd3ec6TMCISNyBx2mzal5QltPx1qeblKSOjBZ84I3OwRoIOapsNDiKNATAC0JmbEhAOc0Dsd1avpWS5+9Eiq0SZqXsEdl+75hCkm4foWA3t/qKPPz/94Pi2Cz8MHWQdyDPr+Y0sK6Vd7NwkyC2yzKjtxw0ykVVGJh9iVMrRPTO1aRmM5eC5l1MFCWiJQpNjWTJ4TafMGlvlWx8uUUQLY70FY4ggdY9mm7ImDl2N+jIS57mYxkPN8FV5IzDLYC07s3I+zkfgfpCJwHVNdoaRG+dm8MQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:10:06.5148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 070f6af8-fbf3-41c3-0fea-08df4a456802
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY5PEPF00000E79.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4025
X-Proofpoint-ORIG-GUID: chfbbl1e38tG6O2w0ltOvZzVFsIi_-KR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfXwx5lI5DSxkgh
 36aLLApF+oBDlMAVNYi6SSidUlE6uHwfy+rbSXuQoKwoV6OqoZDSlDQxAEHPbt37djedTllEMse
 +0ndqmhEzW19SRqldlS07sRxmp/kWRol1+gQOfpaXG7eUs+yVcz3iC4Ca+KkzHlp7JxnUCFNDJu
 y81OGRM/VplXBAC6qvx4WiEeKubKHsbGMHoiwe2XR2pgDxFL2hx2hwpCctLKOC3TyCeDoc5z1Qw
 BJzt0WPJsFGcG46VZ1KvvraVb5YhXfZEy/dEr2cv9DtHMVq4MLzTk9WXatCaOQnMqexdI26xq5n
 qtvuHDxKZzt+g8jYLcnJ4WIpMORkXP9ubTr9PRI2RrziHv5b9FMVz1u27z/cpN9Md5zMJ/PZxQg
 1vzts8HbjyldVP+1HcGemxG2pdtRrSlHPCYP3lnzrU0VNcZpThKVcfVn2bA48d65DP5e64DGF7K
 b5puLkeFjXEsX2X9R5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfX6K2/q1CcJ5at
 02Zu6Ckehz9TSx1i3df9DksOLsH/6AqKqjiODbS7EPsBJDM0dREXBoQrleb3QyzM2ERWVX9DB3S
 36x9CHd2Ddd8F3l4xnscuN0pIOXL5UQ=
X-Proofpoint-GUID: chfbbl1e38tG6O2w0ltOvZzVFsIi_-KR
X-Authority-Analysis: v=2.4 cv=BuEIUoX5 c=1 sm=1 tr=0 ts=6b05b6e6 cx=c_pps
 a=fy38adKFcSgT6GDlyky2Fw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=AMs0GybAEfspHTM54-oA:9
X-Proofpoint-Spam-Reason: safe

Currently on Intel systems SoundWire drivers can't communicate with the
device during driver removal. This is primarily because the IRQs are
disabled before the driver remove callback is run. The result of this is
such transactions timeout causing a) a lot of errors in the log and b)
driver remove to take a very long time.

This issue affects cs42l43 and cs42l45, primarily due to both using
regmap IRQ.

 soundwire_intel soundwire_intel.link.0: IO transfer timed out, cmd 3 device 6 addr 5d len 1
 soundwire sdw-master-0-0: trf on Slave 6 failed:-110 write addr 5d count 0
 sdca_class sdw:0:0:01fa:4245:01: Failed to sync masks in 5d

As regmap IRQ is torn down it will mask the interrupts that are
removed. However, there are many valid reasons a driver might want
communicate with the device during removal, others would include
disabling jack detection, putting the device into the lowest possible
power state to save power, etc.

This patch set attempts to address this problem trying to locate the
reason interrupts are disabled, fixing that and then leaving the IRQs
enabled for the remove callback.

Thanks,
Charles

Changes since v3:
 - Add IRQ chip to the Intel HDA stuff and use that to call the link
   IRQs.

Changes since v2:
 - Added a comment in the code for the splitting of device_unregister()
 - Fixed missing i++ in error path if devm_add_action_or_reset() fails
   during loop over links.

Changes since v1:
 - Add a new helper to destroy the children on the bus separately, this
   allows the IRQs to be disabled for final cleanup.
 - Split device_unregister into device_del and put_device.

Charles Keepax (4):
  ASoC: SOF: Intel: Add IRQ chip to distribute the SoundWire IRQ
  soundwire: bus: Don't unassign dev_num before unregistering device
  soundwire: bus: Expose a helper to remove devices from the bus
  soundwire: intel_auxdevice: Don't disable IRQs before removing
    children

 drivers/soundwire/bus.c             | 55 ++++++++++++++++++++++-------
 drivers/soundwire/intel_auxdevice.c | 17 ++++++++-
 drivers/soundwire/intel_init.c      | 16 +++------
 include/linux/soundwire/sdw.h       |  1 +
 include/linux/soundwire/sdw_intel.h |  6 ++--
 sound/soc/sof/intel/hda.c           | 42 ++++++++++++++++++----
 sound/soc/sof/intel/hda.h           |  8 +++++
 7 files changed, 112 insertions(+), 33 deletions(-)

-- 
2.47.3

