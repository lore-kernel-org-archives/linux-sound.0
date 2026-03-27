Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C55C3A0E88;
	Fri, 27 Mar 2026 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774608630; cv=fail; b=YiJdbatK2LwwsimGrd7eHVzENgV20jDqsukI5ALMWXE/zRj953xQEmsEDQ4a+chy49rkosLQvISg0UfJyhanHjQzaWQfoXhe24gNHjyqeCWbbhJP0nO2BQJMtRs7xEqhrgE4MtDlj9vmuqsVaIJMYxeUiV04eHukSOZB1L7WiRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774608630; c=relaxed/simple;
	bh=RgQEMWovj5bcEVW7u5K67tNpO+dd7M/CCIUtOVlHCfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrAiPhD02Xbc4pcTFRNNwzNAIY0B8Ws7OUmNHharvwAEqpENf3g2zpg+ZQUZgDOtLN8ah32sKMi3QewiWl2TlY2GBbYfYNN4i1fOU+0DQm6HC2yINVQRkfMs2C9nkJ4gLwyeMKmukLe18O6+h5n3T7L7JmffqpNmHgAAq632o0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RzShiyhb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=pPd+CRUj; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RzShiyhb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="pPd+CRUj"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R3UNO41441869;
	Fri, 27 Mar 2026 05:49:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=66RvLFd5yAMPY6/QDv
	vclI4tlSmjFnVAnZQn9NVChKE=; b=RzShiyhb8h33uXS+2HJRzfN7KQ6zZwSaP3
	4y5THIqqbmsYUSV6XxkA3CcH7fiSv0sciMpT2r1H/2Vcs1Q92zCUdRgyBqLzN67z
	joMB73kMLjEl5aKu9EIUmI7qaGAEhKPYafVWFjvYhuoSU9ZFE83rmfVbncwYsS8z
	T7Vgphd2WQxJrVw8lrwArX+MTvA+egRNDWflIRjIobHzWm4x8OR1gYi6BikNiHzR
	CXAHihAvK/JJETDi+h/JYJ+1PJLoZbPFYpt9yykd4+dlQDegMvKNqJWK/4OggjvX
	DCPpSCew4DLahsszsRZSeEp//UKym8LzZ1gRQ+GMknAhc/fexq3Q==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022111.outbound.protection.outlook.com [52.101.48.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d560qhgjj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 05:49:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCh9CrMkmx0fdrZicR314iUSKhuKg9cdocasnC1C+U2sl2JQZtxhTOkcyHDVsBvwW4eaqjSL+PEWqcz9dFFtiiI4kHjUvt6r60A65w41pA9/f3S3eF6T3wBoBVuE0KUBABizjKl5zbWm/anuCyWn9xX+QPY861sYSLq0AGvZhynLRnm+KmstqUu5Xk5uIDvQZqSDY6rAg9jcgJg8uC2VHhYgOD6KqP90lWijGHqcBZW1iGAHmAcb6MdKUl+Hrmf+LxxZBZu1sSEHTvKu4FPFj1MUMyn8X/iIfqOIg8jZjsfGxuROjj/x9fAev8vvVwerFw0zoth88yJUVDCOWsLb3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66RvLFd5yAMPY6/QDvvclI4tlSmjFnVAnZQn9NVChKE=;
 b=XbIsa5I++Uw7gD/vXn1hzFaB+PZU6iqrA5K40vH/BK9Se3jtvAJ8xnlaDkhaVn3SmlIIDd/Dih9LDVFnU2fzGAbNKYBzsHLyGL5vgcxx7t/DYIOuZpii2g5DwgCw40m2YeaKNxkzzBPfquU8KaDIjdz1EiLPe2R6KpR16kFLmXBOK4cGPNzNET9iZp9L77Kc0YhYUEppQHVu7FAWN8LHeUlJ6MabUJAQeFiK2qX4QZa7nlGH6y6brWM+16udbrXQ05Fd1MvxE43m7yAXzXVWgmRDlFVZNS64Fxv3/oFL2xi2ROsfdZgrVcRz3z6Emx63s9bG4gX57cjduhChux16+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66RvLFd5yAMPY6/QDvvclI4tlSmjFnVAnZQn9NVChKE=;
 b=pPd+CRUjuzMLMfQk0Rv7vJCVDkLsINno4B4zkL91Wq51I8R9Q9+C6HkjDs5/Qq1NL5SplxUVTcf4nNu2QYswszwysPJKQQ9fPszYFA9JxFiSrNXBQ6Sa0y0sNPc+WLkql1TV3urgD2XJpZEy+kdmvZGkpikg9Xf/i2mT0kPQsVc=
Received: from CH3P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::25)
 by IA1PR19MB7913.namprd19.prod.outlook.com (2603:10b6:208:457::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 10:49:47 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::f2) by CH3P220CA0027.outlook.office365.com
 (2603:10b6:610:1e8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.24 via Frontend Transport; Fri,
 27 Mar 2026 10:49:46 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Fri, 27 Mar 2026 10:49:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B2F9740654A;
	Fri, 27 Mar 2026 10:49:45 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9A42C820247;
	Fri, 27 Mar 2026 10:49:45 +0000 (UTC)
Date: Fri, 27 Mar 2026 10:49:44 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
        pierre-louis.bossart@linux.dev, baojun.xu@ti.com, shenghao-ding@ti.com,
        sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v2 1/4] ASoC: SDCA: make q78_get_volsw and q78_put_volsw
 extern
Message-ID: <acZgyKuKns2wAZ1R@opensource.cirrus.com>
References: <20260326181712.2274-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326181712.2274-1-niranjan.hy@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|IA1PR19MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff4e271-af3f-472e-3816-08de8bee9059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|61400799027|18002099003|22082099003|16102099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zN2m6f9r9El6xgumS5wwCOoMmaLTcU6QB3XJKTUUj6KQVKqJ1ayDWdQYOn9FVvc7qMpu3JdWnmS7Km8vcbiFE5lzJ0qRJo06r9NbtvX6O8IbiUOslT8nfTFJwZmylS61qW7e9AUV7HC+k1Zg5mMcWhjsX+o02W1stYx5ES+4YggCREcis7tFr8pP6UZp0Nt0eYNr9J1fUNq1cP6Ff22eeRMIjBqruBfGJhu/2ImEjY/W39b/6i2vYn2dHftaABr17ZHj84tV/LQbJ8yXBFRnxpJOEigDPm40ekk9B5Gww8YKGnr9+6BJ5S5tsuG5E2Naq2OA3d1T4Loz0M71WeCHGuQddAHKaEWPDa8dMBy3swH9CLzbfpHZYU9VvhS7fem2r7GANUAzKpUuSqPhVBqT11pmbYraNMr2LoQF0MYCm9VBFeSHT9QkjjarmXTMOg9iam+/dEMh54wpJ8MtEJwywSWt1nGe3doVYybSqlyrLAbBr6lOoqBBF3fo7MT0967pigdTCkOFy4LBEB430eJnyb8yoovhv0vJ0wE+DdOFzXWRUXeugpqQGR3/Fab5FC+TPZeRIR34ImB5G7kf+uQLP7gP43ZOM0GyMJqkmCJ+9eTQg0yDAIZ0JMpY012n8VJtNyAAD1QOzqDSeHu/uZ7uN7EIIjX/KbPf9eImnC6fLidr7X/a4KRKTbk4AngLvxufgirIa3OU/9skH47xp9GAT2XWvcELOEi3UpOKXN/kvpamCYEJ36yxYfP38cOTjzrWSE6m28/QCjOYosvBcoih5g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(61400799027)(18002099003)(22082099003)(16102099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+JDMjtwThpD6H+XuuQF+Yi9nLGeooskgEahRGWSdZq5vjAl373SZ7HqSIdh+7uC2rOSUFXn8nqBpU4vO7fHaGbujSGcEO6LvBxr2ldoDsi0/uqgK4SexoQC2xNbH0ylxHR8k9gb9Ow1wY0NcmsCRhzEIJTC0yPzHG90Nsk6mHi1thCu14g670MjTkxeUtbNMP43A+ae9+dXcypyFzsxFw3ij92JxN9jadrUVyOHPDYrqZ6cK+Rib1rUrURUCe87IxsTSj3KQeEeOniUNkioR1EV9ZgGeuyZQrzZxbhMhQiIrD3LmleHXj/MmHWS6cYiv3BzgC5tlvqjIFJX+chIjdcMJ3GLFyAI2pO3cIFAIH37so/Qw3hdDIe3Qa8F9CqB70UlnYmzIjJ5GFOPzVv2AehKhs8cG90/K2sm3iFHBzL8LReOt+dxvnZNIJ9Q/VZmr
X-Exchange-RoutingPolicyChecked:
	Y3xktdxho5T1w3qkfztIgyw4ZtrmVyCSA386qEo6aSRzINefRQtz6STspSivqatAiX8Ux1XZ91mTIn51UhUlX9VU6bHpH4YNna5rnmlqwvp/L6G5CKrItqQaJmAzKOnqMh92WaQ3XdTSEekGi4rynph4mii0TQAuPf/MnHCglWpCxUSZFTgyMCjsuhDH1rC+SiJoCIE8AEiWPRhwcRxbtP7WvvHsJOD5VneEiJ2uzDMSCyUzzl+vXacaG7XebA95sifDGmNCzKKIl2nmwf+J4MG8sy5WC+3qW0R2vadcjjtq6Nt8wWBM6nimWXZ3YNBi2Ynn4wm778KS0jtHmPC9AQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 10:49:47.1075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff4e271-af3f-472e-3816-08de8bee9059
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7913
X-Authority-Analysis: v=2.4 cv=VKnQXtPX c=1 sm=1 tr=0 ts=69c660cf cx=c_pps
 a=ucmUxximRHcyFXWH+Z14eQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=sozttTNsAAAA:8 a=qwjqdEmkQvvfyV1wM20A:9 a=CjuIK1q_8ugA:10 a=0lgtpPvCYYIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NyBTYWx0ZWRfX5zzzCZ7UQ9sz
 wtygGsxVnTA/Kq//oBZnu6oy4q2e5LFmz88EagmyhqgMNB/lXS3xi8ZlvuYOtmCzURNQFAOW6a4
 tbLyz/FKTqJI6lqayWbeVliuK5Wr1tS/jOnUt40NdrpSrAzSPZb/y1RxRHzflwe0p1GkfviZsUv
 FUzXqadYJU/YX0ozU0bH6GAoIWMolYjbI0HoZw8Iu5fn6Fswma9iPXbxdX75jX1IZWmb2z3MxBt
 Qn7CI/B7Jt2Z55/nNlbfgqhf3+n3WjnVIbOj8E886p4lVoeCzLAJLcFVhiDDQdaYePYfYeb+IoH
 i9hrCfjI5n0pD+NnJOlXdkO6WaZT5hpmCQxL5Gym4sjIhievJFGMsmekOTM98xeP9OgLHlB+8Vj
 vGj52Nb5ye1jhpRDU4mnlymEbf75QN+yDairjtZBnANyqa9UA7/Dy/xFPV/YccucgOJRid7oA66
 oJ4q3XbOTj2juWwM1gA==
X-Proofpoint-GUID: KRXOl0-unVxN6zS_i96r4u95h8wr33GY
X-Proofpoint-ORIG-GUID: KRXOl0-unVxN6zS_i96r4u95h8wr33GY
X-Proofpoint-Spam-Reason: safe

On Thu, Mar 26, 2026 at 11:47:09PM +0530, Niranjan H Y wrote:
>  q78_get_volsw and q78_put_volsw are get and set functions
> in sdca library to handle 16bit signed Q7.8 values for
> Volume control. Make them extern so that ASoC drivers can
> reuse them.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---
> @@ -57,5 +59,9 @@ int sdca_asoc_hw_params(struct device *dev, struct regmap *regmap,
>  			struct snd_pcm_substream *substream,
>  			struct snd_pcm_hw_params *params,
>  			struct snd_soc_dai *dai);
> +int q78_put_volsw(struct snd_kcontrol *kcontrol,
> +		  struct snd_ctl_elem_value *ucontrol);
> +int q78_get_volsw(struct snd_kcontrol *kcontrol,
> +		  struct snd_ctl_elem_value *ucontrol);

Lets rename these to sdca_asoc_q78_put_volsw and
sdca_asoc_q78_get_volsw to be more consistent with the other
exported functions. Otherwise this looks good to me.

Thanks,
Charles
