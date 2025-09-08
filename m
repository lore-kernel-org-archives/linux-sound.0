Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938E01F8677
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 07:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757316661; cv=none; b=mqYsp/AxUn2ylG7Jdh+FsNhQ2EdqTnJjU+sjBG+gcWIe/F14UmQ/mnqI7BQI2Sp8ldhnCnNFlClZhSm2nDQCFxM5Gz+Kb8O/qZyWi0wPMnxFj1kKh1OiUx5TcJY3l3XcpO11Wnd+W/lWz0H95r/BXg7Wh+Q/qoMH+2N6KkHlJOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757316661; c=relaxed/simple;
	bh=Tyh1zDni5S8jgRqwErLsylux7AxcdyPvaTtJMcfwc54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyCMj0rPmPgaask8v5rmalMNWwDhZWAKqam/LwCVxkMT6HJ4JjXyT4Tu+bwc9ktJgdPbp6OueFaEroPa5HgS+686dSzzhOJFTM4FKyElHUcMxT9OSW9wNGfr+1ivTveReMNU5mNr8x5qSInvyaRdnVFaAavvdyo6f6Lb1P6ZGv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFFQD70t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFFQD70t"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587IA20r018400
	for <linux-sound@vger.kernel.org>; Mon, 8 Sep 2025 07:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0epY6YU9RGxckWtia0nPq1VOjyxmvPEuFA73sxSG2qw=; b=JFFQD70tlTc8jlEg
	Sp3k5BpgkCOlNEhcmzs1rMqNUgkU7gFyRJ8Qpc+hTkcHgR/s8aPJ5ALWtAnM8I1g
	Tm+o+itQedHkFdBZwRgyzfWXkOSYVV4G0ucrKG+ef/c4VM8l6c2QDguOGLcN7vd9
	gQmrmQikeTelRsrG4kx223zNtQTuiSF23r60nrFwMyKeNLEtF3nuVdLoq+ikYZ8f
	/uGnKw8F8SFoZbHAdqfsYfG6VFU74mkYwY3pagXRbGWDiJZn6UWeGYM2U+QlEGMF
	OZzF2Uxn/5cqwnULEl3lnPOqEoKkiOure5N36MSQVvUt/g+za4UB+4v6J8IITCY+
	xTWX/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8uqu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 08 Sep 2025 07:30:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b35083d560so107686041cf.3
        for <linux-sound@vger.kernel.org>; Mon, 08 Sep 2025 00:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757316658; x=1757921458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0epY6YU9RGxckWtia0nPq1VOjyxmvPEuFA73sxSG2qw=;
        b=fjX/Ou0szRNN2rSWxqwi3UwpUbMqD5jNAcNK4aiq8kHZukz+Monk1TZ/Ma02I5Q/Ux
         x0+Pi3pG/nEeiamW+bx7BRcceQvjaHBseFWv+z+r78MdqIiu9YXKHP2zRlYt7mkHa/wG
         Y3rJqtJgLJ1x3G1A3eyFEYvsCGFI1iE+OZuQRpDbwwvztldzw1d8SehCpOOFpMXI2DZM
         IOtOcv7MGEQlS6M27KgIdd/xZqHLALjeR06IbEwccbvEa8AK0mM/UAYSgXQrbF5hFaWl
         g7uzZyDrUZdVM7CCrKzU3KH8ZQ/+kz0e6yG/Xo9MNwyPa4lsJwmlnPoZS6LuJMh7KGX7
         /rZw==
X-Forwarded-Encrypted: i=1; AJvYcCW7/8S7e8DCSc3KoEdmoYtJq9dEZ5O/9N5znawdRegEQKsm7t8GdPIOBEeSjn7WdOVZAe7q/SIZ5Pvh/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxssHB+VMyn0mRzqY0BCjXzo3qK4CMOpTUUH2QLpOjZbXYtbWrW
	CZ71o2RcW2mknHSGbrZiZvrpPJx9WPxjUrJBpO93/RanK+ex1wH2CqaK/axLKGgB7omK6cJax4W
	frGtDJ6MhtnDb3ZqqIH7UBAnU0amkPLgHNuGLOrsjs/o/uO65bv4XwThRgFBiohCKzA==
X-Gm-Gg: ASbGnctd1+QUo/0abvJ8nSg/0BzYueKeJMastNW18RHI6at+oNkX2wHVwjNx6MED/c5
	HsuYFAiGSohhyMSdj+YRc+oLHwV6lECkIn+rV72yCpAazHcWp6d7JOsxHAoWM9Q2tyU0O+TAbey
	S1Bn3OnzZgofr2mx7+PMKk4VbkvjarfEDb/urp8y7mv8ZJwEYR1B+UKsCvkz+fAn48wvOijlIn2
	yESWxiUr/G0eGLOlRxZL+qL8+MJxglvPJEnOwplmN0XABnBE9uM9OBQXVSwmY8E48hGr/zQV+a8
	f44hEiTVMeZ9h+ZygFW/o6fJe9AxL7WYVM6Zac149jzKgVFumBE2lrSZq4zPK1cXIoI=
X-Received: by 2002:ac8:5a8b:0:b0:4b5:d739:6077 with SMTP id d75a77b69052e-4b5f8445b09mr83194021cf.41.1757316657516;
        Mon, 08 Sep 2025 00:30:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1JPR4PfJ/rf6grklM9vccNdBWfJgn6bV4FHqQByIM1t9B/i99IyFfm4pPOqnq+ZTAa+vitg==
X-Received: by 2002:ac8:5a8b:0:b0:4b5:d739:6077 with SMTP id d75a77b69052e-4b5f8445b09mr83193511cf.41.1757316656824;
        Mon, 08 Sep 2025 00:30:56 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3e748b38be9sm3039508f8f.47.2025.09.08.00.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 00:30:56 -0700 (PDT)
Message-ID: <deebd6d5-0c59-45e7-a2da-4c2c1ff6ab48@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 08:30:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ALSA: compress_offload: Add 64-bit safe timestamp
 infrastructure
To: Joris Verhaegen <verhaegen@google.com>, Vinod Koul <vkoul@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Daniel Baluta
 <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc: kernel-team@android.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-msm@vger.kernel.org, sound-open-firmware@alsa-project.org,
        linux-arm-kernel@lists.infradead.org,
        Miller Liang <millerliang@google.com>
References: <20250905091301.2711705-1-verhaegen@google.com>
 <20250905091301.2711705-2-verhaegen@google.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250905091301.2711705-2-verhaegen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68be8632 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8
 a=4O46WkZMOCDH73qdsaoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: l6HKQvPOEl-s2rh3gSAiX7iiWNIezrAZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXxH7pF95t6K02
 FHc1FrfRB5syx2aHvjoy+fC7uQoM60JjR/q38VGdWubEd5hnDdfFXlPMth2yZIk14gLXHaHx+Uu
 zjWaGvTEdZeQzJ7FL7L/0BYw7TFhlGApaMNzr1hOioVP9DDrFXJ2yOevRM07r2b5A2XKLy8SJYe
 +Tqh/YcDxQNs/XiykB77NkUNiHw4ewVahCKtoFzZzaQv+5JxK8AMUKjk8yzwS3Wrn7VMgLfKDrG
 L1E0h+h/udYm8FrwZS/Sv+vjHLsZRj4N1Au13CgG9g202t8nNh2h+GuSYQ6yLt4FIbhBkW3Jupf
 EBPb620tqXPT/u6shES2oXfsA+/pFRFcwaaGNal7ZfmBeR/1/Qgn1pd9D+HhZVgcG+b8bOg23Fo
 GYUHPFfj
X-Proofpoint-ORIG-GUID: l6HKQvPOEl-s2rh3gSAiX7iiWNIezrAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018



On 9/5/25 10:12 AM, Joris Verhaegen wrote:
> The copied_total field in struct snd_compr_tstamp is a 32-bit
> value that can overflow on long-running high-bitrate streams,
> leading to incorrect calculations for buffer availablility.
> 
> This patch adds a 64-bit safe timestamping mechanism.
> A new UAPI struct, snd_compr_tstamp64, is added which uses 64-bit
> types for byte counters. The relevant ops structures across the
> ASoC and core compress code are updated to use this new struct.
> ASoC drivers are updated to use u64 counters.
> 
> Internal timestamps being u64 now, a compatibility function is added
> to convert the 64-bit timestamp back to the 32-bit format for legacy
> ioctl callers.
> 
> Reviewed-by: Miller Liang <millerliang@google.com>
> Tested-by: Joris Verhaegen <verhaegen@google.com>
> Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> ---
>  include/sound/compress_driver.h               |  2 +-
>  include/sound/soc-component.h                 |  4 +-
>  include/sound/soc-dai.h                       |  7 +--
>  include/uapi/sound/compress_offload.h         | 19 +++++++
>  sound/core/compress_offload.c                 | 52 +++++++++++++------
>  sound/soc/codecs/wm_adsp.c                    |  4 +-
>  sound/soc/codecs/wm_adsp.h                    |  2 +-
>  .../intel/atom/sst-mfld-platform-compress.c   | 12 +++--
>  sound/soc/intel/atom/sst-mfld-platform.h      |  2 +-
>  sound/soc/intel/atom/sst/sst_drv_interface.c  |  9 ++--
>  sound/soc/intel/avs/probes.c                  |  2 +-
>  sound/soc/qcom/qdsp6/q6apm-dai.c              | 26 ++++++----
>  sound/soc/qcom/qdsp6/q6asm-dai.c              | 26 ++++++----for qcom parts

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
