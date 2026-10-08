Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB96244A3F1
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 12:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463623; cv=none; b=LMEWmQ9ow9MsMbcGA2JpsOXvReL00VCtXTlK7yi9ZQbvD+D9orHqzmCxG6KNG/NhPTgzLW8jNinRyOxCFR/ekwy6Z/03pRO3oga6C/W/FE8TfHxhSGvCwOi3280nvPzmAkeHR9e6iUn/WfJPfBZs8pef9Ed+zPwLVWawn2mGvZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463623; c=relaxed/simple;
	bh=BvLG/Sqj/xDDjCJpnlp2ylGcaCRNdXP18h9H5v3PNSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+YdmI3uVnDzbWz1e4eFJiw4pbGNd0HwJra0XKAC5/zt+R4ZdcOFWTFMUXLUYBBvtwhFf+cboPQ6aIDxE75YCsXTeDVdil9ePyHw9Ngcri0VwU+sqohhyIDy83CZB2jDHHfC0LEuecdRT07UfecDqnDJU6fyKrph7Z8PLR6I9bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eum4qv4G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWMQMLsE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eum4qv4G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWMQMLsE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKI9m3224997
	for <linux-sound@vger.kernel.org>; Thu, 8 Oct 2026 12:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/0JMiE5zxmyIy8hgrC4A+8ABRxBbiN2qZjcEtxUs8Y=; b=Eum4qv4GzCYivSWc
	moqokcmj/zMIpcetIIxc5bxQIt35youHg8jzj3JH79Qv07TgHvTbnYqoVhHVFeK0
	YmdwSESAcR9/RvjxoSm+n+LI9yKdN2vHMqeYZ9fXtO0RGDhiZOfXC1UUeLnkrMJz
	VgvxPPWv9E6+f3ZdH/jQL4nGWb0fdStzuz/g3CDgnn7UCFD6R2SFGBdmmv77M7Qh
	MkObH20DKCZ0UXzrz0hBEUUR9sO8VXNf9n5g5GokjtbzhQc7RvRK9axDsx18efkr
	3zGeuE3Emg56qAsNp+NTEj9fXJrVqw/YnOVHZsKpxrZSY1M0tNd/clMQAnCQmMID
	wzaiNg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe42xb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 12:47:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so203699485a.1
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 05:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791463620; x=1792068420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/0JMiE5zxmyIy8hgrC4A+8ABRxBbiN2qZjcEtxUs8Y=;
        b=SWMQMLsERh64cFLflKGCQEH7tbdWG5ALVBHKN0xKs4lIK6EYrvWJfXOGZOGLyBbVFR
         CNgy6RLEVhgya9GX8MAr1nAx6V97Vli5oW8m9qBuJTzMOG16hFAUH8cfUxfYQEVgcr0A
         po+xxAnPB422Ze5ENz44cUav67IuAhQJChzPFLTSzmmbp9/IY8GadAAJRggxscOGdokF
         jYcus1JoUm8ma+WDIHL7N0gUN3QZS/IljQ3W2FPTE+LNd8HFb+LPNjACPwkLMuh6ZEfv
         6qqNlllvR4gPiCuwBn9LVfGzLt2XW0lCgf1+lCQioJ61g94R3kpxKvaxWnMZ5sLaDcIv
         KfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791463620; x=1792068420;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/0JMiE5zxmyIy8hgrC4A+8ABRxBbiN2qZjcEtxUs8Y=;
        b=yKTZzDNnJXUB9zl0vQ+TAYmE+6X5nqm6pu6Vr4SGfHh9udlPeS8V5XOwPSjPSUbvry
         mmGY3QEu1PT8L1/WbiS7KgYP7z2Ct1A7XpKUAyxkl2OeIHJHBvY7KnkDOulNjqqkc2ZU
         izdtzF1hB7cpCujrzQB8H/gPf+Lkfbbkyn84lgAUQfJSeD5yuXGY5OmIzYBWCWDb7zYW
         aAfN/Fr5HwBHA2gA2P2SDz9LcnSCTpskfqjyzqHCH6RvpthcglDFU+I/PJJFiuvt8F+s
         4ndb43lCb6CCE7sJRQLXZTYeT+CTvfST4jsTiwUg4GJRX5A5GowShfmqRN4d6jY+9Zte
         K0og==
X-Forwarded-Encrypted: i=1; AKwUvBzHCu8beI2bwYOo005AR/8QoW4nCvtqG/UrmSm4TBfPe1WGsE0m1AX2wkO5svNtBcF10edFNAlJ53rGPQ==@vger.kernel.org
X-Gm-Message-State: AFuF++ngDWt+v/yJ0CgJrY6DQmHkwpWar5GPlZ4XOoQCfThLBo0fxgRD
	/CzJrpfdC5g4i6lQoyacu0F6moV5MhxV4T7nA52n5g/NhnnZI+56qk26XGQ9ZVehF6Vru6JzyYN
	c84PnqdGRw3h3I8EO31aMJyR8GrIJXbNZhT98Jk5MeY8BwhVzy2JgPD2OasUY2lVeAQ==
X-Gm-Gg: AYBFou0ZWD7ut3uOx4zj79Q9oLQdcHuWnMGtgIACNTGOKfKk/8hhIYIQW4zUj5eAsFB
	ba3icrDaVMG4kt1xLGVZtSpJ5gWQiXdemAqyt6wIMQfjZvEXys3gQ+Qw0FU2yWuRCCZkpRVf90q
	QhNyuNDaCqRsUSlu4gCpXh5HUoUs+HwzoKNtQc3zof4wOi8787i0q6yI0pk8RZoWCPGJcjbEpjf
	61AnTJr0HkoHTnMHrbCgFaVTkEknKsJYyc9BiPWCeqnehMmsWEXMiWhX8rnkyrApEQSbX6aXcEJ
	glu0DULKBfEQ1cBCTj+d9a0a8OGT2WfticW3/Mdq+vNDOlON5HQiU4E18NN4EL6p/Z1J+wco9a7
	Rlq6QpSmQUAlcAeEk2ieGTP3t33BwuqbT2ZHYGel4+igEMkbC
X-Received: by 2002:a05:620a:4413:b0:93e:64ac:5dfd with SMTP id af79cd13be357-93eaacd6540mr407615785a.3.1791463619773;
        Thu, 08 Oct 2026 05:46:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4413:b0:93e:64ac:5dfd with SMTP id af79cd13be357-93eaacd6540mr407610185a.3.1791463619033;
        Thu, 08 Oct 2026 05:46:59 -0700 (PDT)
Received: from [192.168.137.143] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c317c32af4fsm214517966b.63.2026.10.08.05.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 05:46:58 -0700 (PDT)
Message-ID: <7678c37d-9f42-4e3e-b054-762688cd8077@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 13:46:57 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux-audio BoF at Linux Plumbers Conference?
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org
References: <871pbsnce8.wl-tiwai@suse.de>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <871pbsnce8.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nni0E1asVFik2Uk4_V4pg-gZcATs_B0F
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac790c4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=lxOuNqB-r1SHsHFSKiAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MCBTYWx0ZWRfX/sSwgctQarJB
 8HtWi0D/Pz3/chAdm4VIDNkqZg8M0kjhTq0DwEhpQ9ZaF/d6xnSml44nyadv2BBcUxjnqRFE3eW
 4WLLHIEmOlRYpjKcY9WdNMlQuB6opb0=
X-Proofpoint-ORIG-GUID: nni0E1asVFik2Uk4_V4pg-gZcATs_B0F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MCBTYWx0ZWRfX4qdaos/E/Wup
 69BcB+Rzh2v2fX8NKdUYS8JzMYCGgMOFDEP8KoRdHhiY8a44fvxmCfwCyiOZ5A07pgPOCk1PTVO
 f0JNbDNyZz0dSomEJeShaIC+4JpsJDUHBA08Kf2QKfrmf2dE4uL5MRQWc5cjvAglXE9Q4BdQTdC
 dKLqVqdHtbACq7iU6LueX7KKnEDUCFOFFKPf8JNuktOmrMU+vBmx2SvDcd8yCD/MKhfRMzB12ZB
 vL4KNS6kT0eeqFcsDoLCaKRV7NsS8KTUtvqGpjL/zfHqv7zOaFae0bMD4eKXNyhkgeT+pSWZnUe
 FFXRnW5mSHk2S90jWWMPzhA9u1EKFFveGVZRtuTBxMQgkGz4Z2eyur23bkvh4JDh4QTv1ujOuif
 syhbt33Uv5NBDrsV/LcC6qsEd9ZVOinSNkXX5AwJ+wHDYSL6Ek1FXDU0ehF07IJr8QuK250OSHq
 Lei5qAcTmPSVodI/ggg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080050

On 8/20/26 2:34 PM, Takashi Iwai wrote:
> Hi,
> 
> a few people including Mark and me have talked about holding a small
> meeting for the Linux audio stuff (finally again!) during the next
> Linux Plumbers Conference (on Oct 5-7 at Prague).
> 
> Has anyone already planned to attend there and is interested to join?
> If we have enough people, we can try an official BoF session.
> Otherwise, we can just have an unofficial session at lunch time or
> such, too.  Just let us know.
> 

Thankyou Takashi and Mark for setting up this meeting,

Here is some Meeting Notes, please add if I missed anything.

-SDCA
Discussed gaps in the MIPI SDCA specification for platforms that don't
use ACPI.
Action item: @Srini to engage more actively with MIPI to help shape
future versions of the spec.

-Compressed Offload and End-to-End Testing
Concern raised that compressed audio support gets little or no testing,
since it can currently only be exercised from the command line.
Proposals:
Integrate tinycompress into alsa-lib.
Explore options for supporting compress offload in UCM.
Action item: @vinod or @Jaroslav for merge
	@Jaroslav to look at offload UCM.
	@Srini to look into player support for e2e testing

-Speaker Protection
Brief discussion on whether a standard framework or user-space utilities
exist for performing speaker calibration or applying calibration data.
Action Item:

-ASoC Componentization
Discussed the current status of ASoC componentization.
The work could move faster with extra help; volunteers for development
and testing are welcome.

-Sashiko Reviews
Takashi proposed enabling Sashiko reviews on the sound mailing list.
Everyone agreed, with some changes to the default configuration (e.g.,
cool-off period for responses).

-Quarterly Meetings
Takashi proposed holding a virtual meeting every quarter.
Action item: @Takashi to send invite.

-Next LPC
Agreed that a dedicated Audio BoF at LPC would be beneficial.
Action item: @Srini and @Vinod to set this up.


Thanks,
Srini


> 
> Thanks!
> 
> Takashi
> 

