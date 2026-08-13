Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24619370AE7;
	Thu, 13 Aug 2026 16:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637529; cv=fail; b=At5F2J06gCKHw33ODREu2fBWL/I6Q0TwAj4BQQbKhL8/cz5N2YFLfBSVsPf/QOuuhSK54tN2CNSdbw4CFjNk92+lbHA7mAs/14G3tyo43M8TqkafZ9LIn7Ywgu2q+9mkL9btepS1uGgX40BImwZoRoj9Rfj4LA26BekH4I+SM5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637529; c=relaxed/simple;
	bh=+qvgRzzIqQu9JJtBpreOqbrSgqx8qdAeK81d9MOddPk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JzXB0T/KAAJezVsLVRSjFL9UbzdE5nlNANvetsuhijG5h1QK07DXg7usFzmFw4STvqJpJ812a4A2ZVdO8UyPZEBZz4/rC+gcP6mPNMNUjFwWA5IR+bgQHuCNPeXnafFf+FByVEwhYo39kUcyp42mX/py72gveIjkFe67HZasvDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=M4x2Lh05; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=PqnnaeyV; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="M4x2Lh05";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="PqnnaeyV"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DDIcnu3015252;
	Thu, 13 Aug 2026 11:12:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+qvgRzzIqQu9JJtBpreOqbrSgqx8qdAeK81d9MOddPk=; b=
	M4x2Lh056xLxVC/XOh8gJvpp4WlFqFyA7uQiH38bjgMYfJIa5Wv9sB5NE9TWVsh3
	fWLywqU4UkqiiqWMXaEkQmz2+ywSc3pXaKHF9oo5mfFQNl08XISHVDQiBC1LZKXj
	S86zSYHEteqfE0B6Eym70h7eeqvrLYPie8L/53wfjY2PYEQRuIx4AioidtGMvak2
	QB/A2v5TQ9zwni/WQFFcgeeHrfkn0xyFmHHED13xqf5Ft++lgEc8YpTgtKkEfnfb
	otoi2bfbr0ro3Q3xMJnLLwAtYp/FRGmP7owOWbOmcoGFvzh830nSNCcB1dFB/Y8G
	5FLw/qGxUOZSVLgYHcYIRw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020072.outbound.protection.outlook.com [52.101.56.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4g0msjttxb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 11:12:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2ZV+uCxbYrtfPoLbYiI0JYBi6HVDIMG/yVvVgybbUUlGCBbYU4tkwdwM/VSapHPNsZ1DX2apYYrFY6Q4pxyminvJwYeOeOCX1mnC5w+NFd4KrM26fmwEPyHiTgqRM8z/e4Y2ORG4F/EMNUq9H4YUist5LxeqCvl+lflWx9OMJL1HT8YrNgXGESb50rqhMcZNWMrtpozSKxO2Z3+81BozqRAxmXhWB92YBDgbr1qt4mNs5LZUfDi1aKYJQ50gXiHrtwc3UICre3HzXw4dLKwYXQks2xLE+QnKaDn8sQV+WrRXJlLyFgVoK1wyK47B7b0uMjQNkltmXIt3Q6PAkrJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qvgRzzIqQu9JJtBpreOqbrSgqx8qdAeK81d9MOddPk=;
 b=bgZwRYfcv3Al4xxfqrZcqf6L9Lm9l3cx7oZwgroN5d1wRNrEo74g0B+J1bBcZ9SYXQyjGn6JCJ3XTJZ6yEso6gT5BMiIldE19KYaO9ApEHQTtGzsuSp6KGQvrXGE73ugKQLbplu+szrW/94T3t/jEHdo+omAKbgMkyQyxMl1HVz5RrosE+2Izs8fehl3hQq6wYnofLF8qGauD85HM6oTp5nGTnHEdIx/oIYxnzwZBrrPcc6F3w7oDJE3OAwsjqFmNEIKYTD9alEV5M2pS8aFeVmrnL/CeKMaaJ/AHOk50x6D/Tk+k4yU+kHvqRT0Sr0b0ql3sKsgk7MVO7YoXMcivw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qvgRzzIqQu9JJtBpreOqbrSgqx8qdAeK81d9MOddPk=;
 b=PqnnaeyVsdwCoEjsCTJZcVN9E/JqHFnkJZyMQnQdf/MZz58siXhKd45h+sEUKeo9CsRfu9ivzg6UI5OLTQlsnMrmAoZTfeYjBxXIgoSbvpcPIZaS6O4KZNQDXhvjh82acmwDTqDVYkhclg94lSc66Jk1nz4JN66kT2mPbEM0oe8=
Received: from DM6PR06CA0080.namprd06.prod.outlook.com (2603:10b6:5:336::13)
 by MN6PR19MB7968.namprd19.prod.outlook.com (2603:10b6:208:478::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 16:12:01 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:336:cafe::a7) by DM6PR06CA0080.outlook.office365.com
 (2603:10b6:5:336::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Thu,
 13 Aug 2026 16:12:01 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Thu, 13 Aug 2026 16:12:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5E691406540;
	Thu, 13 Aug 2026 16:11:59 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 046BE820247;
	Thu, 13 Aug 2026 16:11:58 +0000 (UTC)
Message-ID: <4bb97547-4145-4afa-8014-71faa594bd36@opensource.cirrus.com>
Date: Thu, 13 Aug 2026 17:11:58 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l56: Fix probe deadlock waiting for SoundWire
 enumeration
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260813153351.1517556-1-rf@opensource.cirrus.com>
Content-Language: en-US
In-Reply-To: <20260813153351.1517556-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|MN6PR19MB7968:EE_
X-MS-Office365-Filtering-Correlation-Id: e92e9795-866d-4367-7992-08def9559b4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|61400799027|376014|56012099006|18002099003|22082099003|16102099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Pgnpi7GcOtq5qvs4Q4FIjwqwodeji6WzFPZuEO0uPVQzZiG+vDWNyoeBrZi2Ia3qQtHYk2Kv5unXoAUK7r7KEYypDvzE61DmMps/KYoJNNYHkJlzljzd/XG1Bpd6rsDVnfrH3D9XoW6W0raZ9nGGJxsdVyU6sA34ODOfFtn7t+bo4646+YZqDKcGiDi5QivAmg/VzJvJeqnsNn6OJ0AOB4EPQayFPqFE+8tFJzh1JH1YKNU3CxgJQk4v+KEuGhyMZZZy0A0Agws1opBf4t3cz6btvsESTus0gnov4r5gQmhk9qiPzDGP1nIYDB9cUpAniaFJMzNO32QBco21BvoPVjwnL4RIqOypUTlt2Wxo6ti4js2kRIMXxYfWY+++AjsCtYv0ZfYnyE3sZPoIh5CL0qA+EtXQyl8y9RkoL7jtd6sAHebzq/gIe6+M20gfgMsc7ZfrBiMA5wE4p5wGNegAw4RaXbAxVA8w6OVoEsAPsVRrJxDS6gOiHx/XupqYEfsy+TQdjc3/7tyYZjD1C1JIyqNHdwK+mILu80REYh7oNkux3T3vmeIxUswfelyYHEYqXyIV1fK5juB9WXrv2/ufRYkJcACwleWsdCWGUr4jjjFvOf1gf0c3zpv9nWuNO9IpICdxILmbcLUewSgTU0egT1kt26B4flsDhCpn4yGZDzIRd8dq5CNx/BVR2BYryDZ+vSPDOHayEKnNYC+xKYjZWA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(61400799027)(376014)(56012099006)(18002099003)(22082099003)(16102099003)(10067099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Jcloy7ydhs84l3Sa6hCElR8zezzvu1Gmw49RPDwSx+XeaJqpYC66Qh3v02/OcQFgP9il9OoHoa6+3Ops28NKKioOevcf63V8AmgpGNbWjX53gtN9LwKQ2ONr0MhsZtk7UGwkSWTwJo+2qgXXw12iiiCrGyDzylini/twFXA/dq3frv1kRWVP6LzXvUqWzZbzK+CdVwfMc0DuVe/XKaQgJzz++VuWZWE2AgtTGTalUNnTPmgmRNi36jiS4NpY1VYNaskXs8uRzFek+zW6Qqya2I8SNznZRBAn374Lqjo6zqJQPsxA6uPVR7G9+xXa+2d+EmpXV7SbzBMAWcnzJTzGTLP855+Kwvlqx7v2NFLLXOfka808ne2+63VOU0QuMI2MUaL5MhB3XhkWOEnuOSRbi5gQlaJYcs0QvreHF1EfiSyEK40mnCxNYd1aDbhUrvdU
X-Exchange-RoutingPolicyChecked:
	di4S7CRs9+H3GJImlk4Hpy0AhqHZkS1goxMCvMqg/051BJL27GbD7JJYdPkdjhohFu4fkrpeFaUqquhVgEinTtKT3e0v9vw0LYxaSXlBTZJyfcYzNhtBev86UG9llPCIIoMotkqLI6LYjSAIpgnrPCJsWdvh4TddEWm9ORSp/vEDlThmmZleAO61dTV+fj2oySv2BmmHDPRn9rXREyG9qnfIwxxbFskpHAKsRHV11oKbNLWyTLXMDpWvjEnJzKZ9AisqbK0KuG+XljB5aay5ncIRDgf7T2DTqpYVbDQOcZocDzP2tDjo6hnhWWYplSQrXjpKekiLTaQR8kwkA1PRVQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:12:00.3784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e92e9795-866d-4367-7992-08def9559b4e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR19MB7968
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExNiBTYWx0ZWRfX0pyLLB1EFNqi
 yRsdvkqdZJTC/Xo3k7jmgLci1fS+Y/OxZz+M3RxdfXOwhLLzi87HnDmlQk9aQYLYPG0Py/pi9lT
 RWPJYaUhfDdpMWCwzAhbikqlKcZEo1v+erbABp4zu/QyJvAaSOSFvE81f7ql6FcYEqRXeJTsMav
 TUK6sEhjpAfRFlQpnEs0QMppUs8ScKi87nR2S8xXj3bktMwUhgbnWnz48rbJ2CN59QS1y852wpM
 m8CXpJlie2d7va5tIJao5CaTP4XL83/FvlmJVV7zcgmtbMXTkxrZpydxo8ut13sRMpTfBhsEkFw
 HtjoRywfFEECcn2vBQ/KVQAEz+dX5nqP5fLpSwz1ar8rmsPSIh4uPFmy6JSNJVqKZsxpuv1FFyA
 Q+zMNp1CqM561+emNVlfnk3PozxBnt2cbMFS5LtHlnqATic1P7Tigqc/sRcngChUAE9OPcED2yb
 zK9ijmFkD6xhCccMexA==
X-Proofpoint-GUID: LLH8KpXQV6FVNIuGNnsq9VnbvFub8Wiu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExNiBTYWx0ZWRfX8GvM9EIwCdEX
 cscuhWSOptr72EKfLq3zetdlMNae8x3q7ECezfLWxN32rNiPOHxfNpFAnUrtGNB9wIR/G2kpD8z
 51MKfEP8INul6BcBsa0EcLDEUHg5/Fw=
X-Authority-Analysis: v=2.4 cv=VdTH+lp9 c=1 sm=1 tr=0 ts=6a7decd5 cx=c_pps
 a=EuzLu2ZwJ/NCzAOim5xawA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=5boE9ged1iZokXOquSAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: LLH8KpXQV6FVNIuGNnsq9VnbvFub8Wiu
X-Proofpoint-Spam-Reason: safe

On 13/8/26 16:33, Richard Fitzgerald wrote:
> Defer all the parts of cs35l56_component_probe() that require register
> access to a work item. This is to prevent a deadlock where
> cs35l56_component_probe() is waiting for init_completion to be signaled
> but is blocking the code that would signal it.
Aargh, Sashiko(gemini) has found a bug that Codex(GPT5) didn't find.
Will send a V2.
