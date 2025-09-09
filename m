Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CB43314A4
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757419966; cv=none; b=QXoXtd9GSlVZ/+Ve4EkivvuCLzhLw0boiBf25DC7rzZLk33GmjDGNrNKdYPxLiggcScs70trjkSeRCtbt1gct0uUcDVJZ5dirTPUSYzfJP9vXEGbXiP2pxN6THs7RyovqwLG8AKyCGwNUqLTxtDCTtpxwh/pGzMyu9f7oAd7EUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757419966; c=relaxed/simple;
	bh=J5/QpCDoFJoufpcMOKJW/ktR4sR0JsuMqYsFq7c/gik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SU8emT2HNbyzU2IjxvtpmQd3vWP4HbkaENvHknQQ2S5/w8+LLsYhwkbFzV6oyAFYhYy8L+cVQEKnGEt5lYWmkl3wnF+WdzsLis3oR4a87MBkj+PdmN6NB7dh9kXfQC46UsgzR6cTJwwQrUzK9S3e7zE4sl2NSdwbq908ynDMNjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EcQg1awf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EcQg1awf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LUA6029835
	for <linux-sound@vger.kernel.org>; Tue, 9 Sep 2025 12:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F3/gI7HiWsKdqwPQvxhHv/oAU3laA8pk38dutfqDJT8=; b=EcQg1awfXKL0VuxZ
	0RjlKjTot8QqUrjeO0y1JrKA5gPbJjCPzORbwtQizjqBoGuidn6DkZDjoKS1hfhl
	uspNX/wZJedIeZHzuLJNSf5V+5tadAbhC8DUvlc9YJ5NFEnhgLXnpt3uuPGWVqr3
	MuUnNNh3xX5WiPCbOdJ12TnNLm8hhxxsNO0PfKt2+g1sRRIIL7bvQiajAOAhjfRc
	TfcG9CgpxPlmeMPr9rQK0J7/zaXfwxDnvhyO1OcfzJPfTJs53cuwqqXrAzNMvddP
	xWy2mlOGHI8n9BzOByuGpf8Sc/My+1yuv9CJvmv+Z5u9HOOSZ9kY4rLZ878ttV/M
	HdCiKg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37vmf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 12:12:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-814370a9f58so667727085a.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 05:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757419962; x=1758024762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F3/gI7HiWsKdqwPQvxhHv/oAU3laA8pk38dutfqDJT8=;
        b=bNI4gzXT/D1DB7aPMH7n58vUn4roTMzKY15IPFJg0A1+AZo7+sSQaulXHTOL04gQFz
         WfrVppecfUpaMF/BR7wk38lRh2khoan0OOrmzxoXsvPbXZ9CzHMsQus2BMXvVDlejKLe
         Fu3+kPK8b60U7i41ow1wTg7c4ivWWeHVgXdpwdoRGpuUfxdn3yQBKSp6x5WL1MNFAuGq
         RITux1gzWtfkLkPXBY50wk+bDukDlGHVa272tEUeErziMBL8dzQ3DrFPtmE3P22PU5fj
         QrfEiud8tlLE1mre2Dyhlj1KEqo9UiVn0rtH9d6JKzCe/c/l1AEBCl5Dagf2R4XhTWlO
         6t1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVD9vO1JxkMg6YiJ3yLkaodqlPBjl9koJAfIrFnUG/ZYQ/9/3Io/D7W+QJ05BntERD4DS1RWqHE+z94VA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcVTGgQQopjl028c3RcGixxe5/BXYznBSnYQfHLcwLg2XVVUEK
	Te6j7ZUiBC1hX2kSYsc+9jNtf4Z3/rvKoUZAEs4twQKI6JMBXsq1JMVs3dECIV+HEbXiUOqfIOC
	6/GBzwBK3ZyPU9ojnCQkvkbsHt5KbTVLlL5aU7Fx5qubnCwBfPNUI7uVsnpqmBa2qvA==
X-Gm-Gg: ASbGnctF0wIzahC9qKt+1kKQzNucRxSonbk0KeJer5q/t7SrUhmGjo5q9oYMSLrG6e8
	qnwQMBYzUodweNiPCAvX6MLpmmUNSvlZW/JvKW8n5FkQ0IPglIT0vTDh2bjFj7Vvs/OOsfO5elt
	nF9VsyVN6L7T0TjPkXeafpcva71DefMX9W2/wY9M9fmy6vjlE2gZ9JkQHFROuY2ahI6oWbt/wbj
	9ODPx/wMlfD30Xzp5sLi5QUFHRSevbhxuTlalnL7AJgLjGFl+BJlavEzlAWBeXvlWO2B4RGQ9vV
	qic48z+IGFlZyslNvi/Dk3r9slatezM0L7uV2QxHVBExJbyctAzTfy4xWJS9jijRHbk=
X-Received: by 2002:a05:6214:29e2:b0:70d:cabf:470d with SMTP id 6a1803df08f44-72bc4f8b897mr161480596d6.27.1757419962172;
        Tue, 09 Sep 2025 05:12:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH3Cw+Od0RoE8Fp9uL5sJELsFA0jgOTA/af0ZY80i6HBU94bkP8p/VVPDuABUvl27r4rhPnw==
X-Received: by 2002:a05:6214:29e2:b0:70d:cabf:470d with SMTP id 6a1803df08f44-72bc4f8b897mr161480206d6.27.1757419961635;
        Tue, 09 Sep 2025 05:12:41 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3e75223ea3csm2441106f8f.49.2025.09.09.05.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 05:12:41 -0700 (PDT)
Message-ID: <afba70e3-8cf8-4b77-8c7e-65e1ddc3a8ad@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 13:12:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/13] ASoC: codecs: wcd: add common helper for wcd
 codecs
To: kernel test robot <lkp@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, lgirdwood@gmail.com, tiwai@suse.com,
        vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, srini@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-sound@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
References: <20250907112201.259405-8-srinivas.kandagatla@oss.qualcomm.com>
 <202509081839.R4vv3FST-lkp@intel.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <202509081839.R4vv3FST-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Orb9z09qob-lHxplTxYjSH7JirL1gNPY
X-Proofpoint-GUID: Orb9z09qob-lHxplTxYjSH7JirL1gNPY
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c019bb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=EN0wAbmSeUWIRxCTcSEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfXyWaqbx8bzElA
 7tkrMYJL+5+fCdKMUkVEyc556b3TniCb3PIKVbpLGgy4LjzHVb6BI45FNKiBbxKQgzMRVAs+9MR
 ZhBdrQZM5qqxvWWvV2WGEjKHqbrn/4xFgBcM2F97lOgPYfqG0JblD0G4U0Wwsmd1V8w9/rMAQUY
 40gjbFMxFIWjWtubA2riReALOmScKMXi51KvLJh7Sj/D9p5td6U4YGtoYh1CFbeTcqe8hnl0Q81
 eE2/hIOjop65OKymrKWxe7i797/Qx/LDvUAWCwn/SKvBAvNg6PB3evPu6q5PJCeq8Z8O4LWKOSp
 E2q/uyPftDmYiOHEzqNhu22OCveuu3BW5Zqww9FDPU747gWs7JA9OnHxANluq2Cj5Ex2T42E5Yw
 ApvKohM2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066



On 9/8/25 11:40 AM, kernel test robot wrote:
> Hi Srinivas,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on broonie-sound/for-next]
> [also build test WARNING on linus/master v6.17-rc5 next-20250905]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-codecs-wcd937x-set-the-comp-soundwire-port-correctly/20250907-192533
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> patch link:    https://lore.kernel.org/r/20250907112201.259405-8-srinivas.kandagatla%40oss.qualcomm.com
> patch subject: [PATCH v4 07/13] ASoC: codecs: wcd: add common helper for wcd codecs
> config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250908/202509081839.R4vv3FST-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250908/202509081839.R4vv3FST-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509081839.R4vv3FST-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    sound/soc/codecs/wcd-common.c: In function 'wcd_dt_parse_micbias_info':
>>> sound/soc/codecs/wcd-common.c:34:51: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
>       34 |         sprintf(micbias, "qcom,micbias%d-microvolt", micb_num);
>          |                                                   ^
>    In function 'wcd_get_micbias_val',
>        inlined from 'wcd_dt_parse_micbias_info' at sound/soc/codecs/wcd-common.c:61:26:
>    sound/soc/codecs/wcd-common.c:34:9: note: 'sprintf' output between 24 and 33 bytes into a destination of size 32

thanks, this is really nice static analysis,
fixed in v5.

--srini
>       34 |         sprintf(micbias, "qcom,micbias%d-microvolt", micb_num);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/sprintf +34 sound/soc/codecs/wcd-common.c
> 
>     28	
>     29	static int wcd_get_micbias_val(struct device *dev, int micb_num, u32 *micb_mv)
>     30	{
>     31		char micbias[32];
>     32		int mv;
>     33	
>   > 34		sprintf(micbias, "qcom,micbias%d-microvolt", micb_num);
>     35	
>     36		if (of_property_read_u32(dev->of_node, micbias, &mv)) {
>     37			dev_err(dev, "%s value not found, using default\n", micbias);
>     38			mv = WCD_DEF_MICBIAS_MV;
>     39		} else {
>     40			/* convert it to milli volts */
>     41			mv = mv/1000;
>     42		}
>     43		if (micb_mv)
>     44			*micb_mv = mv;
>     45	
>     46		mv = wcd_get_micb_vout_ctl_val(dev, mv);
>     47		if (mv < 0) {
>     48			dev_err(dev, "Unsupported %s voltage (%d mV), falling back to default (%d mV)\n",
>     49					micbias, mv, WCD_DEF_MICBIAS_MV);
>     50			return wcd_get_micb_vout_ctl_val(dev, WCD_DEF_MICBIAS_MV);
>     51		}
>     52	
>     53		return mv;
>     54	}
>     55	
> 

