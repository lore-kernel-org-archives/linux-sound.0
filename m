Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE8737A83D;
	Thu,  2 Jul 2026 17:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015161; cv=fail; b=DCX3FtfK1VzDA8Lv5SIgT4tySJ8cuyn+Pgi4Uwcbc0uHTyNuzWPr2jjBufdYTjXqpC2QW2yHLLUvW6FEFrkjiMiq1ZfEMafmGBGBvzwp2VgHglLoMESUuVAsBoKTgV5Edyml7v/AJqaao6azD6lSxPTGe2va3m2IXc/EJBNmZpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015161; c=relaxed/simple;
	bh=qF7qoU5PAkSU4U+et5MmBXbiQIOEBI6AmnARfacsUE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eNK8aqadpU45Nu48m3zginYd6Nd8/hdDULo2k1MttHItKsb52z0LiIJVuSu3LPj8OlTeOF3ieb8YdPdOArhtUSxT1aqcbEJrOz1b397j8EPLAirBz3BR5ZETGZ2+sZrTVK5t1to1AWv4kJeZiDkxXCK+kwh4sed4IN7owlLfjTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=O89WN8vO; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PcV1m+mZ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="O89WN8vO";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PcV1m+mZ"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E1Wnl2616467;
	Thu, 2 Jul 2026 12:59:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=zYy3sT0q5xTMXtA3I36lmQc4vq8oL36V1c2Yktnt9
	zA=; b=O89WN8vOfoMr/kEzoxLMjdSh/A8yhDNR1z7Q2Y0KBLFwTvTyqqw0izZq+
	4TkyEVGeqmdKvm6ZMLGhWZht6kFYSK/L3qMQGUWe9xwBmxwOVF/zkDuD/0tMqkTC
	bktvhqs8cLFFknGRlTMDfH2MqSl3ccD3Vpkt0GqTKqKzpPth39Wvn1/H76/oYmqb
	eTBm70Q2a0J8ZhBxOlkyImrPtHfMYmVtij15zVX2jI2uSBz3+ugJY9i8semp3UTj
	t3tOgNzNHS51HutEO0JXDkXsnU21txzJRLu1eDNmhPHWR+tZKggHi5gppmopOTBd
	jbQ/ozmD/It0SYLMbhK1hGaH6kcjQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010048.outbound.protection.outlook.com [52.101.85.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f5n23jxb1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 12:59:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHJlEM+xFWpvKbRncvQehQmDBsLviSrDfwMYuDiat/9GKRNBrcBxEbU3zHkEli4HnBPtjYgFwTGXeU5j1yQ7CEYo56mxdqjFlq0xI6XBLlmMPw2StOnZI7I0w7GxsPdd3ZBZbfQ0eYf1DFi3O+QRrgAdr2hprpsWiSG8tSMQpArPXdTfIQrol50pnc0E+pAW3BJ9UZ4LR+t+H5yhnGYPrWaZWkaHPw5YO4rGZLxJhsX55QfWjscvGagLsUetBUs1jr+t2wsxkfoYeaq6sK4RjS1DIQ6NH43jlBJriGygqTkLlP+9uHAObScoDJ5ExYPcw8HAV5jO9dN413yw26I/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYy3sT0q5xTMXtA3I36lmQc4vq8oL36V1c2Yktnt9zA=;
 b=ovqaOIiYSCejjJ48yHyvBe6rzSZOVNWx/Ma+mhuVhZWkR7SdgThzX8KGTRomMv5HPhl2y0r+MZfSmWK6bVlvGKz4hO3hYbp/R3dTyhLO4gaa8CiKtREdxELBTDloCjD6eFfjhmPPgCne3d4mLzfcXlSJEbT/BwdXFNjyoQNqbtHsxDgSijNDy2SiR4ubpl9t68nD6k4hMMT0wByeQU6SmJbEwh5ah2ixecUjcD9DnUZ8vFPejqU32Axt6RhuVZGfO3jSvTniQyOBqU9hoeBXMb9U9G45+Uh3JWf3YEvJHndCxvx145PGgMZVeSHCllQ+03aMB6raOqdhoAn4sNmLaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYy3sT0q5xTMXtA3I36lmQc4vq8oL36V1c2Yktnt9zA=;
 b=PcV1m+mZCRD86iuP/XudSZeop7qrwTbX0rz+W41NlPn6f3eI6k3X6MfTrZss2diC5Td8yEZECPEWiBuFV3C30VAbjPPlValQmHKcjVGLPITbZw5iQyOVyGZticWxKacZx9xZtCa7O/5xHe4N24eZKqxyOkyfemKCIC1po3ENh/k=
Received: from SA9PR10CA0029.namprd10.prod.outlook.com (2603:10b6:806:a7::34)
 by SJ0PR10MB4605.namprd10.prod.outlook.com (2603:10b6:a03:2d9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 17:59:05 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:a7:cafe::5f) by SA9PR10CA0029.outlook.office365.com
 (2603:10b6:806:a7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Thu, 2
 Jul 2026 17:59:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 17:59:04 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 12:59:04 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 2 Jul
 2026 12:59:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 2 Jul 2026 12:59:04 -0500
Received: from [10.60.39.92] (ltpf5gwk6l.dhcp.ti.com [10.60.39.92])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 662Hx3a94020225;
	Thu, 2 Jul 2026 12:59:04 -0500
Message-ID: <c52dfaad-ad3c-41a0-bfb4-7a9c33beba13@ti.com>
Date: Thu, 2 Jul 2026 12:59:03 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: codecs: tas675x: use READ_ONCE for params to be
 used concurrently
To: Mark Brown <broonie@kernel.org>
CC: <shenghao-ding@ti.com>, <kevin-lu@ti.com>, <baojun.xu@ti.com>,
        <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260630183126.2588322-1-sen@ti.com>
 <20260630183126.2588322-2-sen@ti.com>
 <53fe396b-12c6-46d0-9cb6-d492e8cc7d96@sirena.org.uk>
Content-Language: en-US
From: "Wang, Sen" <sen@ti.com>
In-Reply-To: <53fe396b-12c6-46d0-9cb6-d492e8cc7d96@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|SJ0PR10MB4605:EE_
X-MS-Office365-Filtering-Correlation-Id: 742f50c5-2c1b-4556-c94a-08ded8639af6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Wk6wGvpmhQ6wgtu1ICODmnb9o6JUOv4e4Q/JHVbSRTjDRzXCjmBZlAyVQKJnklEHrXqpaU+uzOo9d/kks17liBpL++y/5Cm9ebVPMgIbVZNRKXZg3PJoG5PiZa63gjQul5gFHKF97oOpPbdyFpD5pJqp8me3GAUB6KDBn6WkZpkRwx4aW5O0lZ4D3b2BNFg9eDYQqaqkTHhqhFYsk9O2yc/g9YJ1RmsPNXs82oIaeJOwiTrcnkrPCEUu+cNpT3iGa5JZwRNqifzpXv998Ra/rs5mRGMyHWyJ4vxNyVzEOhQfRS4UDRDBXX1VTD9+4ssmp36ppXelr88mrGT5CrQTMQlIvEbTbkfELqy52/SJPqMiutTUr/znz8WI1kkN6N6iRDW5lEZDo4P5uMETrutNMEoxZnZj61PJp8QPtT6mrmgHS8/pMsClZr39mICdvLtbJ5hsvDHlIMJ5+W0BJeYipo6g0j04p+/WaVjEG8RWihsy/B5+hnXc0McnEKiyd4lmZ6lnSMmS6aPcAOOwuIJkZBEjLn3N5OoxgHqc1wPR6ARuncUkGIms/QwhyAMpbtUZ/LKCeEWf1qtaXc8CO4ErbQuiDaJb1uv+cWG0iAUbPrv9xyLZJGeStO/Z+DmoLGDPxfsiLzVY88vTdlRoo226Ouwgv19PbAVI4gogvgF/s4Najk4OUx9Js5SmvFC7nsjMx7sSiOR/0lm/qXAO3bhZZQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p9JgX9EOMcqwJm46dEqKNH3nxvGgxNIOsQCRzk2Qogf2whuP/Xqfzc40WpGQVZPW2AohcDl1bCdyfJMQ01FRsSi7RBqJzMWS0mKHFDsWf+sfmDZXuniOkUJQjob/JzEZj9km71SOtV5XDBpd/E8hqSjmNGwOAIWoQ+rhL3WWYhVJooAvPUzSNEpNEGoiEw3cHgIkd6OAm9LokBbth17XkWa8X7Y7AKurigblN6MlDSZOduEUTfNe5CHC2iOHi+xinYGmJzWIO9rOiTzdvSu36IvIFEvsOs7y5a+AFdtQ67h2gZSqB48kwCw6oNRydzb7wFl2a6k4Rp2O78aQx2bnfIEP+xojfM4xtkUFjKQiQJ6gI6UIEjJkkVcWFmyQ1Ur0ZUjKdts21F9fZsATrsSgrXl+z3vbucROy7cdYlWNNsXuoY2YLdeKktMN3fEz2byq
X-Exchange-RoutingPolicyChecked:
	f7eDRGPgavnlucTjkaRpko0aJzeRvXXee/YXluxP6atWiqymbL8pQGwF288fxpzW27Bf4s1UDgyQL1bu7MAqrlwNb0zUJ1UiadSKzBiLHbS4pu8VT2WGsXJsjP/TBW71zjbrZL3boIf+B0iH+502aLhC34oBBC5g+m1/xO3/2W4kp/vKVIBu1Tx/k59q1fjA2SSiRV8cFq05iQXWVUSC+k+9Vp9FQW1F5ZJx5k69ySX9ac8vsTbQ8eCyQDMzFOuDSJSAJKyGpfpL3/su6izHkA63YaoPga6Og8K6BwLIgMQvOpib8vrj0cdCuQOYIPBYGb20pLVKqJOwtif+M0HdpQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 17:59:04.5627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 742f50c5-2c1b-4556-c94a-08ded8639af6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4605
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4OCBTYWx0ZWRfXyci/+v6cEdpq
 KNIZoemIPmp+EKMEgq6uEHjIc5dxz2FNYz/aPDGmRIB89dha5ACZ4DFPJIw1n0MQTZ4xc7vkf1T
 nn9acoZrBcRcON0IGVtD5hCYCQ9fhko=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4OCBTYWx0ZWRfX10BVjIW6ECEM
 /NWVcwTyq7yIl65BaNWvqcf3slMamlP6oLOOf7gj/pMnmOTyKSHzpzLzLMZlMe8t7WInGdCj3Uc
 OjthpzkVeRB3cWG+6VM6XLBgW5Qf01rMEt5Q9gGC8ouLizOqVlt9XZ/iunUpXNidx2oX+Xbs+md
 YZpdwJfCaZSe3Noe4EbRWjGtj2qg+zKaTHnnp/Yo1hB8pRgXlQ02M1LoQQj09svsjN0auM/I2h9
 M75MNofoZO0rSaEBNZ8dynFS9jMTJbUXN3JD5SNql339mdPRVsRTMfJALLOnd692EEDq8Dcg3sU
 YWxqCzK18Q6RLnG87g1v2wDaW8eO496MYLT5iciTw3g6unAokpwEqQfThNIuxfigKfebSGTbBPS
 x4aWImNX4FJwaoNN2L7tpSDpDuoFwf5GjPlhXbexruo01pxJCZck3eodTgWxY+YcN6S3mroUovq
 R8qn0HRcUmON1XMWS7Q==
X-Authority-Analysis: v=2.4 cv=DN+/JSNb c=1 sm=1 tr=0 ts=6a46a6ec cx=c_pps
 a=INYzEgT09ABq+JfORImVWw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=1j9htcRMC34D0xNDXH0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 9RsFIvW_v2ZeEZbmOY2AYC1dx2QIfNYn
X-Proofpoint-ORIG-GUID: 9RsFIvW_v2ZeEZbmOY2AYC1dx2QIfNYn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020188

On 7/1/2026 1:55 PM, Mark Brown wrote:
> On Tue, Jun 30, 2026 at 01:31:20PM -0500, Sen Wang wrote:
>> active_playback_dais and active_capture_dais are written atomically via
>> set_bit()/clear_bit() and can be read concurrently from the
>> fault_check_work delayed work handler.
>>
>> fault_check_work already uses READ_ONCE; extend the same guard to all other
>> reads in tas675x_hw_params() and tas675x_mute_stream().
> 
> I'm not convinced that any of this READ_ONCE stuff is safe, that's a
> very unusual pattern for an I2C device like these, but given that I
> missed it earlier I'll take the patch for now.

You're right mark, READ_ONCE only makes the variable volatile. I had a 
false assumption that it also adds memory barrier as well. This patch 
should be dropped as it provides no inherent benefit.

Tracing back, the reasons for needing to keeping a separate record of 
active DAIs was the unreliable active count when calling 
snd_soc_component_active in mute_stream when I first developed the 
driver, I should look deeper into that instead...
