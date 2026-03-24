Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61C136683B;
	Tue, 24 Mar 2026 12:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356849; cv=fail; b=LEYjOzIgNB8mGz4nY7EjMLlUoHuXTktqA1qMlsddyTIEqkeDlj5Je/7UCnOBkYqiwvd35B64ukGLrBJJJwrGcW+YUiV1OfcZ3sgRJEeA5zg45lybXn288AM+c9zcIYVwijZ9ssf4p1cUJBJUAzcYJtKXKCdTv1Cm9vLl5kUHwVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356849; c=relaxed/simple;
	bh=p+aREyyUgLepUI9/Bd73mbxJwTlqxAFJGDwc+A2AauQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WygoKkjcmdI5o5vWBU1PSBMQtbWdw8h1lSCuVnZTlaZa/jdVK7EJE7fmlUAgV0ARgZtyEKn20Rwa/V9bvj+PjN3Too+e3mlIp9SL3tPtA92YXPPEakPd1xD3Dx3U65km/gCvprmuefLEoy2jqPqJDyMel9XBuzCpPUl2nWcdmCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=EvDP9yTb; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="EvDP9yTb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srncULUB1xYKz4NA60VFx2Lm0AhWHe01Xh5jFwf9fQteHBIjFDqgS7ivjVEBizurKpsLEtXN0lOTHk1Q5oAj8S033ko9VweSSQLll4FjAwOjSGzONxZLAAozLL7aUaqsJ3bL932YSTcT4SfhflhK04LrFHYsm/HRYlllZZlLAsDZaKeNEYBdyRlM6ewAbfg1h84+Hwxp9q72DTqWCzgz0geofiSlhcFnJPImLteIgPBM945DEGONk8aCcj7G4/dKA4n872snZsLeIpXyb75HaZOpWbe+KW1dN52NQFE3sGUcHl/v7bF+HLQyuGRcAXrc7G916m67iYai0KiMaOqPqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEyWLsxUnv16fVn1qAH/eUFUs/AcVWxtq7yyiPqazFE=;
 b=GaK/8DmKZRb9Q70bxs3LBW64U6VzDZ3sAM7ogryYGbUV2bMofgYw8RCGa1tp9o2fEBxk4Mu/N03hUrx6EraL095vOS7PHmhlCFifUeJqO0eh1o/wTCbDg52v73mxIE4DcLlcpQx8BIC2mlOekeU8PuryCjGkbFurySBSf/ZFJAYXl+6oxskTK+CclpNtJsFOKaDdav0j8q6U284eAaEH0PNxvMzqbebbKwFBLTIII5s3K+U7rr5ddJV1QKZtdQ8ouzDRSAQDBB7Ke176uth9WOVZP93bSVLkiVqOSylHLUEcchRT7Y0IfNXC3phaV1saMK40OWJWFVf4MleDp7Jpwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEyWLsxUnv16fVn1qAH/eUFUs/AcVWxtq7yyiPqazFE=;
 b=EvDP9yTbnMiskuC7fb/jPAQhQlmPZ26HILwflo/rvKElR1huhEe8VGBQtkE9I4uEYOzBUGUYAiF1NB7rlIaTn5893cgTqp3TiiCe6LlNa0IR4m30ey1ZI3of8RydOME0AXC4RMMTNdsxwDwrDDCkYq7jvZKFgkS4gRLqR/egNgoM6T4Eoppdb5hhCznqEA2qTRJaebSTAFmYz3nso9pgGZKXZDY29z5TUn2oqgMAfAU6rd3cVxpQUKieCM8naOejMtqzraou6dYqpuEB6M2fSh2pM9eVipfDnQA9AIm66+ehAiEYIcWsdUG/wXtP4/3azO1bIjq0uuFfbcPvUz7Tbw==
Received: from AS4P190CA0021.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::6)
 by AS8PR10MB7020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5a7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:54:04 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::cc) by AS4P190CA0021.outlook.office365.com
 (2603:10a6:20b:5d0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 12:54:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 12:54:03 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Mar
 2026 13:56:40 +0100
Received: from [10.252.4.165] (10.252.4.165) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Mar
 2026 13:54:02 +0100
Message-ID: <dff3148a-d4a1-4ad0-baa6-50e4a1ee5c1a@foss.st.com>
Date: Tue, 24 Mar 2026 13:54:00 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: stm32: Fix incorrect compatible string
 in stm32h7-sai match
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>, <arnaud.pouliquen@foss.st.com>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>, <krzk+dt@kernel.org>,
	<robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260321012011.125791-1-jihed.chaibi.dev@gmail.com>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20260321012011.125791-1-jihed.chaibi.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000191:EE_|AS8PR10MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: 18632f08-d888-4e7e-6e9e-08de89a46d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|7053199007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5fA1cRttAZgSo9MR4iwzxWcUTKLK/TkqNXpxX+H2yF52YaDebS8zNKSULOrU3L8OcHaljvNNfdHQsqb6cOiSMQGML1pO6VFAyNp3+MTyT78wIGQoSfPDEbz6r3yDRgqXRn2O31qT1Vb7ihVJmJ+wk7dSiDNoHjJ2Q1bfOCbMvbbIfiY9A6adrfIxJZcH3ENotmW2eteHnMLcEigvhUG5BJNsu2BDcMWH8GXw7MQrexn+hs4m9yhpseGQ3W0EYktPvlzjs3FStpXQaaUS3OweaYHBT8iGbNJJj3kaeDMrQmT9Noye8sI9+PaGTLTfD+1nWCpNiYwl3LNxBPK62A0mLtt8uXnfzW941hIN4oi1Sxg+KmdY1wYqYtYS4H2L9XhLMy3qSNAioqVjEFBivX7SG+nkiJklSBq9rhAXd0c/vnRHGGqNMY89M4aRrG7Ndpf+06eKGq285HlQ9XXzyPkMZOaCD59ZdXp+P2et6MH4kumNHpyPPoRpQmxB/1Bi7KGV21oreFepgAYH0vTW4cJBNgHNyBIKBu25GDz8G05IEd86Mkq163ReW7JU+ZNOIBpdePjVVk7nKsH76NjuZc/XuXKnNvHZFayibxL9RHBRk8QO3NeQr1/QOa+zLCYqff2WPfJVm3Tv84SATJSxiwN7PupdwuLNjMRd7bTqeMaabTs2qw4aE2PMQ77i0McOXIJmo/H09gHKHf/5ypkn/sqG+m3UHGYB61B8JAeoAlrGp6MiWeLe2fom+eED51G34oZ+v/ChqiKYftWOHehqGjD5iw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(7053199007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9UoHMs4PsInmiupmb+4jwOD2AI0e9TuLmuYrhL8Yl91RrehR1mqdRVkYF3wsew42o1PyeZwp+hQ8zB+yTpWZR09EUxmWoRVHrPGZ7VSLNgAVnWiEXyuiRi9fIx2tF7XYHfYlYr+mjySfXJ5Plo8lLTxn+3kb6ErlXPLV+6wLriYNysYpptlb6PRamoPwB9N8heTJ24aJ2vCukP2qltPF0WYzisxjZbTMrwgsyeq9Fm7ChniSEDw1BmvU1NuF5cQbzLzMvjXB5mSOc9brFh109wpXKRpuMb3AwTq0dBtfuUmK2d1oJpXvqQTkKypzqZ0x7x8b7W/0zkyVDfhYoqapVF2vLMHYcdYn8uRv8uZG4Uy1YbBVQPbikXPpt3Do5fpgy8Y9RPZVC6RBjmPMYhzwaVRfmOm5SnQIjAfiFSAOx42n7zUGRiR429gMbaPWO3D1
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:54:03.7762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18632f08-d888-4e7e-6e9e-08de89a46d8a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7020

Hi,

On 3/21/26 02:20, Jihed Chaibi wrote:
> The conditional block that defines clock constraints for the stm32h7-sai
> variant references "st,stm32mph7-sai", which does not match any compatible
> string in the enum. As a result, clock validation for the h7 variant is
> silently skipped. Correct the compatible string to "st,stm32h7-sai".
> 
> Fixes: 8509bb1f11a1f ("ASoC: dt-bindings: add stm32mp25 support for sai")
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> ---
>   Documentation/devicetree/bindings/sound/st,stm32-sai.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> index 4a7129d0b157..551edf39e766 100644
> --- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> @@ -164,7 +164,7 @@ allOf:
>         properties:
>           compatible:
>             contains:
> -            const: st,stm32mph7-sai
> +            const: st,stm32h7-sai
>       then:
>         properties:
>           clocks:

Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

Thanks
