Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1239229BD91
	for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 05:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759124645; cv=none; b=fxr/oNI1LhVyzZTxawYVFltEtzeTgzK2xgel/XLvpbsSdkXUDM3+87TmaqHClgLC/PGGB4suF9bcR6SdtS4xmZsARasxipR+iWC8mdCU1eb4qH7cjYl1nQ2hznU+z+PS02rVAclx/HFf5ZYsx6A9VRrPpo5bQFi+1lVogH50Gis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759124645; c=relaxed/simple;
	bh=HNiufS4QgvTOpQO6FbL535zp3vDJ1un9gKIOCDv3sjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJXTKbCAnRfNk+iF9aQOM8HcfX3DnaKNymvWrE3hguhrTuojKF2yJ6vhmQPxgPJrwSZ6zUFXaHXC7Gk/n51/2vtMT8S1P4tCT+/H/8Bb/9hzEY4S2eLzMikRrAtHWPWf5uwwUE66Pq5032Qih2ZReWrUbP+y2543Mk/N99CBkeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIHEcR5x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIHEcR5x"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNWGgv004742
	for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 05:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0shxXdl1M5m67yzuv0GXcdasQMNMQSFmS4e9Kkqn+q0=; b=TIHEcR5xYDni68va
	mvFrbiD3QDfdFSWmiApYHdvRZVAKo3xoMvn7BRgUZyj96EoyHLHafET5Jk1vWyiz
	j8Kiw9bRu4abl1Cd4hFfMrUIwujTUOOz4xgETwjcb3bYRxze4ZzcStp6VEJbBGTZ
	3w15+a4okVTN5AN1oWwH91AV193U8Q3+UIyr3yLd9mrVdcganr+AxTWfKebM/RlZ
	uwUyHsq7fNC4TJVow/cGF47G5uyHUAgt2MoTORl3TvCE+gsLXDoX3hLJ72u0jL+U
	Pvt7hjNYdqpXx/yePxgZbNcnYkES/Q9mG79E7vUFuFl21W3v/HHZD3xbVdPBYluZ
	AeNgJw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e7gxkyxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 05:44:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b554fdd710bso3010007a12.3
        for <linux-sound@vger.kernel.org>; Sun, 28 Sep 2025 22:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759124640; x=1759729440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0shxXdl1M5m67yzuv0GXcdasQMNMQSFmS4e9Kkqn+q0=;
        b=H9lzwJoQBCCMLtpxHAM+1jO7TJfGb9r3f2rNK8S/PUJFGzLJpi5Dn0rSvkxKAM0mqk
         DnKLEeOMT+ckVQ5qjC1V3oCb+1pQXJZP7rQfeKC1zFDUNNPuDX5gLvc9E/RYu1NPIE8E
         hAUxXTq2H9pDw2xo9K+dHIrdkJpaZC+WywbLxZFCs3x5TDeTi30IAcOEnYTc36y1RcKu
         IGeUVvWs5dU6o7ja/LLBxfyQ12T19G7xdcKyj3bp/0mahNs9fTu6f25a0+hP1/dMlsIN
         M2TU33HBFcdtAiE7EecyAFZFvk7KqZY/4kK3ioQpySkYn/N1jq9lvdNAXWcfBpMZrgDg
         qChA==
X-Forwarded-Encrypted: i=1; AJvYcCUFg8B9qI9jXK9A/dm5JwxD83CLJeee/mPgwGxQX+7Nc2lqnJnY5DA8prSH3nwQOGNlX7XWVk2kVpGeng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfH11cbG2lh9Zh0Quy/myV8quX1/1MB1Swu/HwJq903VdCN+bv
	7iIrPhKWYeOadsNhlrCaANXSrHmWH0xux3eh1Ad78ma57+byLRPBFyhPKSpNrkinuAEO37ABWRB
	7Pdk1atgzoVYY4cCel2U4Qfq2D0jvpZP+HBmkwHcQGKHqMmRNswhL2O1EFVWrQjGeag==
X-Gm-Gg: ASbGncu7EPMlXY5ol37uFqQuIbkchgJ2XDYof+WTygddhG4LzgkSkJmI0NZ5+dyceIM
	Ui3sOK64TOj+gHWA9OAy1OApmpQBrI3x8a2YxQE0oyFw4O00ae/AXkMzs8uf/8UV/TqCnG3YS41
	v7XAifioHB8f5MZmkpGeyJ2Ykmdttji7ptejxRQOzvOFD2rdfmNk5SnuaOCWqyTINDmug/285n1
	a3lCH1IFWGTdH14ZH1lMdQirb8ZYafKRn92sQWL6YiTnkjoSd3AHlvXh0lS7rdroK5SoEktqKaF
	rDO1yB/V8js+PZMUxtAPsx86Wu/xeea3LE8LL9sJtDzzMyjvAHsVSXejzXhaMz7vIDnofYEvlFa
	lFgj7/1Ff8oLjdkRAcYIhlfuBlE/GrZYUeC0=
X-Received: by 2002:a17:90b:3852:b0:32e:24cf:e658 with SMTP id 98e67ed59e1d1-3342a22cdc9mr16537632a91.3.1759124640448;
        Sun, 28 Sep 2025 22:44:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl7IE2Pt6RQ3vYJq5zb9BDkApqE/UvUl6n0SAk0jFAYj2ocsRLqMrO3x/ZsK3UmEKV+StagQ==
X-Received: by 2002:a17:90b:3852:b0:32e:24cf:e658 with SMTP id 98e67ed59e1d1-3342a22cdc9mr16537609a91.3.1759124639982;
        Sun, 28 Sep 2025 22:43:59 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33435b4f180sm6031452a91.4.2025.09.28.22.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 22:43:59 -0700 (PDT)
Message-ID: <65338db5-d255-498f-96cf-bd037aedcc36@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 13:43:53 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ASoC: codecs: va-macro: Rework version checking
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
References: <20250924-knp-audio-v1-1-5afa926b567c@oss.qualcomm.com>
 <202509261315.O9CiiXjb-lkp@intel.com>
 <e7843f88-71d5-4f7e-9f99-df06630e02fa@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <e7843f88-71d5-4f7e-9f99-df06630e02fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: In7Yfqq99KTDXEbK3M0_2JmyPDSl3qVu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyNSBTYWx0ZWRfX8rfyzq8ODgDs
 9qXBoxlvrdEMZJhhnPprBrHdJtsLQXtLTEGN8VKmTsNMXBCE1CwbOOZXMGwVDl4UvNvm/D7k/DR
 ufNkfhmjdinIpnDjtwEltagYaHiLt8VtYMQcRcm51HuZm3ywZqZs7vB0v88peNz8uDTuGqyFY85
 bPApvqNrdg3G1cD66eGPl/ecUf7XqWOewSxkFsBXAp3cg9VngLxIJN3eLb2TQl3dwaRZnm5gI8n
 Be/innUwhysw/YOYWvI4p17BWEmMSDcm2DaJACgosihMx1H7dMksUoECpH1gaN2+0a19gnztD0s
 16GXgSkcinfezb6+1/w39j9W0j6Oj4SWEpRwum3LOaibQs65S8IpVqrCA1s2yx38+Vspn1HlfTP
 RdXL3Xq1pacMvOfoDIeOVNNqN1VPiw==
X-Proofpoint-GUID: In7Yfqq99KTDXEbK3M0_2JmyPDSl3qVu
X-Authority-Analysis: v=2.4 cv=dP6rWeZb c=1 sm=1 tr=0 ts=68da1ca1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=H6HILBvNmDOxdPU26TMA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270025



On 9/26/2025 4:50 PM, Konrad Dybcio wrote:
> On 9/26/25 7:36 AM, kernel test robot wrote:
>> Hi Jingyi,
>>
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on ae2d20002576d2893ecaff25db3d7ef9190ac0b6]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Jingyi-Wang/ASoC-codecs-va-macro-Rework-version-checking/20250925-080338
>> base:   ae2d20002576d2893ecaff25db3d7ef9190ac0b6
>> patch link:    https://lore.kernel.org/r/20250924-knp-audio-v1-1-5afa926b567c%40oss.qualcomm.com
>> patch subject: [PATCH 1/5] ASoC: codecs: va-macro: Rework version checking
>> config: i386-buildonly-randconfig-001-20250926 (https://download.01.org/0day-ci/archive/20250926/202509261315.O9CiiXjb-lkp@intel.com/config)
>> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509261315.O9CiiXjb-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202509261315.O9CiiXjb-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> sound/soc/codecs/lpass-va-macro.c:1479:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>     1479 |         maj = FIELD_GET(CORE_ID_0_REV_MAJ, val);
> 
> Jingyi, could you please add:
> 
> #include <linux/bitfield.h>
> 
> when resending?
> 
> Konrad

Will add in next version.

Thanks,
Jingyi

