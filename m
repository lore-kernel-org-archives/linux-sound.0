Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0495E4399F2
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 07:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788873; cv=none; b=LBKja/Oh+7yHgSrWH0td8lLNiECFdAww6EXWZZLlMXo/9JdCnDQis/WzWmxdBWTQzlyLFH4qocg0/bRpAlAXefGwxBFrmCYg217RW/YET1plifrFzpH/GPtHo4Tb8WfHTVHGXESl0Tzxx66tuIqhkuWaVTFNIhK+Nxz5e2dgph4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788873; c=relaxed/simple;
	bh=wyIvfO3AJDS7jsg+sAaLI5vGI2NBvE/NGzSkTigIFpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=surZVVb5ixOt/ipDRCmze49hHaIGWJywxjameUsBnRZ7XqmcTiMwJxb8P/ngBknDr8xW2dNHSNzn8aloBeAShEUIoNv8kSZ200M5HKsURJ1wGvWcLbVv8KSjvjqytSBh2FPUrlFBFsfYxd4MTBqYPlQKfq04UjIS/7GqOP4nAs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJzQrsh9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fu996d+I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJzQrsh9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fu996d+I"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55jPp750977
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 07:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNKTY4aJcI20ifqIZ2FJrC3/QdSGvuOgdM7YFVDGL0w=; b=HJzQrsh9IvHeO/wR
	VoNVJTjuVOm0bmH7gX6xUrCkUYtkZ/coJTCEj1qfwcQYuCwF9fg0sCnJ9qze2Htl
	6WPZpEljhgJdj4rB3hJpSCeVFlgWjmWwSwRvZXLsKS4DApXIKd054ZkxMsj6awVw
	Jyb6QxF+pNrFLPhVggLst3h+5LJQ2apEQhduAw2yx/xBl68dEN559/YHfOJagJUK
	U7glh1OtNX6bL3hmZU2bFIGVRmH1nDXhS/yKBTT4Prm0iir6a7/p2LHdBLW9399f
	kVJ39f/rHddo19ZOgVHCFiXKDRpLDVOcXFsFGpXEaaf0gexQhWb5MFWkzRJQ2nsP
	HFLZ5w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ed5k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 07:07:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbeaf07a7f1so297573a12.3
        for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 00:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791788870; x=1792393670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNKTY4aJcI20ifqIZ2FJrC3/QdSGvuOgdM7YFVDGL0w=;
        b=fu996d+IJrdBApGSASA1yP1/mvMIvuOWQ0uHCFIHBLsn2a8jbb4iqMProSPQcS4gX2
         ZEfL4zw3YX0nrtk+TY613zKbB5+7uiLEY7EY4nN1g4rALnwJnwpz3exNI/URl0c+EgAG
         6m2OHIVI1yjsseYR671bjWKjZ44nzVk3gXA7q0bNej2ImQDPwlNQ+FpOp/13m58KmmWM
         TzcT/BLFNZbUFKc/Rc3lMfPvmhkFCRshWT3YhoMcun9z2DAWoudrEDa74SVnmwCBsx6T
         WPjOKgyS6/LY0wAPItLHFsB1kUdE8sS2spM91/g9F+9LXj7Cc+OGI0YICgbtYsxoK58C
         VMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791788870; x=1792393670;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNKTY4aJcI20ifqIZ2FJrC3/QdSGvuOgdM7YFVDGL0w=;
        b=WpGby/EsP4gRsS7jbfpKvLAidOY6DpPHh0x8CzjLtI6mtcSBw+Tkc/+LmrXSVRAdu6
         Nzfaa4qufdRaOjpAUqJhi7byAhyCWegJIw4UA8r+VjV3UoiGaBiaIcS7+5IGJt8mk6JJ
         wBAqaPFkupvC/FgXCkBxSAQpcfKSEmxKSKJN04cjTva1j1/XAqUQPf/y/FqU9GKti5jf
         7e+W+rOcxqUYbnoz2zaL9G9kADHT3M0bYGNFBwVif0VQitZOryvJvYRAAOfed0dCU6aF
         Jaroem6J2ZNEMM6us7dWLbIYX3WdPUrLqkiYeRFAKsT3GkjtUAfLmxhq3CBtIBGiheij
         PhRA==
X-Forwarded-Encrypted: i=1; AKwUvBy3JkjmLQoGJ0Y38w8hS4Wwct/vbeSDd8QwHdcXu1Wys3upfYfAxdGuivObmTiUwTZUqoh+X9GzuAX5pw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLwQqWcLFYdJph8cP9ZpbxbMqVEdEndLAG+v5M+Ak/Lob2eGbd+
	7nySGIjPUZWzQRUWM5+ixq87ZZnDAoxhch2wu9XyMddDKo8CtnFuU6v5i8ZllSphIzTxUhdCo48
	Cw5pKJoXQai+ZnBXS7k1AkyP7ra+YZuQBVHCMeknL65m1Z2zsefeRzYewzW7vUUoEyQ==
X-Gm-Gg: AYBFou0Ehy6ZuT0LhYXVAMDQ7gjvem3vNWwDG7LDFyvNiAHXiYJkXmXFSVLzpdVby0H
	O8qmePpj/IdpUXi/oSg2UnWazTaIhE2nYUysGHV9DGlV/zWRH6c4zvNlXNk2HP0Q7cOx7jbMDBY
	91XeH0tguYaCqUgGkc3nm5xWznYOEhhF51fW1kNjYbwNTrw0Obnd20rUmZkz113zgGPiB/IB7Lv
	sBt2KalNC2380AX7zRjDxHDV46X6h5EXn1pc4t0YYtyKa/pjHwhqks7ESEopNWI7JZuI2wxHx4D
	tori06fLGRjNvRAa0KLVkAkTYs3qgMm1BenQ4sqp6ZdhJ0n8lkZRpcfTBTAQGGWwUqH3q2h3zOq
	DCWhkBtZt0rijf940GU4KdDp+TzM5WetAEEpIk9tYij3K7WwUCkQz6mznnkcZNc7Gsg==
X-Received: by 2002:a17:903:22ce:b0:2df:8fc8:6203 with SMTP id d9443c01a7336-2e84289cdf5mr115604875ad.2.1791788870287;
        Mon, 12 Oct 2026 00:07:50 -0700 (PDT)
X-Received: by 2002:a17:903:22ce:b0:2df:8fc8:6203 with SMTP id d9443c01a7336-2e84289cdf5mr115604485ad.2.1791788869724;
        Mon, 12 Oct 2026 00:07:49 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e888808bb6sm19887445ad.58.2026.10.12.00.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:07:49 -0700 (PDT)
Message-ID: <a06c2618-a2c6-4aed-a41d-9d6f888931ea@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:07:44 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/8] ASoC: qcom: Add audio support for Hawi and Maili
 platforms
To: Mark Brown <broonie@kernel.org>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
 <arPxJqKoCXfF4TCu@sirena.co.uk>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <arPxJqKoCXfF4TCu@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOCBTYWx0ZWRfX+m7VcWJcHeqT
 KkB9pV3fjLR+KDCj0FTThdZ/mjt+LonOxKuUpL4eySqUvY8Xv27SyPuhu+GaSbHwErQBXFIsg8J
 sJOPpE3CfgkyjbkB5JrnBS8jzRZEdC+V8ZQoNBAXet7ckHVQ4oOfSzyZCzsY/prsq/R9isaXAGf
 d9GHQ6jUPtRmRx4TZAwEn8O6/9vZsCHk6CkeOvTIWS6tjADqghXbYarY8SU2ORzbahTQ41xWKUg
 j3tYIF0Bwi1XKPbxuWvcnmMPOG60mdDUxrf5y/uF3BBM7qo/V8/Y3MBrSzMDXsGlDY+HClllq48
 2w5py8GQ36yXk1Q9tXK5Ku59IFTzh/7dfssuzp7uaC3t9vyXMWUIkRxJUzcvkdoaxGL9avFik+3
 EBMqnAw69c62WTwm7xqaHGkF1PeXayd5FGx1FvCdhZRhrxr2QlFj6iyzVgcvqHXtOeTO029XPJ8
 T9dTDhdhUU8NaBlwVDg==
X-Proofpoint-ORIG-GUID: OJG6dJ-ui_PidPFrBHP9m41OdxHll0o6
X-Proofpoint-GUID: OJG6dJ-ui_PidPFrBHP9m41OdxHll0o6
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc8747 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Awcj7odc3Zx0pgQxwzEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOCBTYWx0ZWRfX61dwPBdC6fkS
 jxZrm+0eHUXWTwBrEvkoSSiVDRFUYHgXunfaoz+E2JB4XQW5KUo6aGI2V6NksRcLipk7WDSnM2e
 vrHA89+UFrn9KR3tFvhKQy2FmOAbIKk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120028

On 9/23/2026 11:32 PM, Mark Brown wrote:
> On Wed, Sep 23, 2026 at 02:16:19PM +0530, Prasad Kumpatla wrote:
> 
>> base-commit: 6c58e38b255a3e0c11e513e3b8de85eb26fb02b5
>> prerequisite-patch-id: e6735f29343dd80d0e7ad48b6874eab4a5d7efc6
>> prerequisite-patch-id: ac7bc5ad958bb392a57871dde1f79c2fc520d482
>> prerequisite-patch-id: 332b888996b9d6c58e8c90eada37dc14137755ea
>> prerequisite-patch-id: 21e9dfd02f282ea4239f12d91ac8a2be76aaad29
>> prerequisite-patch-id: 52f17e16e09853e366ecc3da2676654df79daf06
>> prerequisite-patch-id: f0b1cd1f1f8daf0e1814a338446d493d64c9469f
>> prerequisite-patch-id: 29a1620a2ea61c0b7b052220e5ea522b1fbf2ad8
>> prerequisite-patch-id: 0872295385e6712bf342d84f095ec3710abde8d8
>> prerequisite-patch-id: 69807d41bbbd6177da4374639ae280501f3f60df
>> prerequisite-patch-id: d9f8613cac873926d6d2fd77e45002d34954b434
>> prerequisite-patch-id: 446fe28b27dbf5ce4240704d89296a5af69e8b21
>> prerequisite-patch-id: dc5ac9645789f25b3742dc4fca08dab4c1e4826d
>> prerequisite-patch-id: 0521512205679cad2462ecda959239aadc48cce6
> 
> As I have repeatedly told Qualcomm people please stop sending me patches
> that don't apply, please collaborate with your colleagues to get
> whatever it is you depend on merged and once that has happened send your
> new stuff.  Qualcomm is sending a very high volume of patches, they seem

Thanks to Mark for discussing this with us offline during LPC as well.

We now have additional context to share. Since the SoC was officially
announced on the same day, we are able to upstream the device tree and
audio support together, rather than upstreaming only the driver support
ahead of the device tree series.

Therefore, we don't see a need to hold back the device tree series and
would like to include full device tree support as part of this submission.

> to get limited review from other Qualcomm people and progress very
> slowly.  I'm getting a lot of Qualcomm code sent to me, in hard to
> manage forms.  Please also consider helping out with review of other
> code, not just submitting your own.  This is not directed to you

I also discussed this offline with Prasad, and he agreed to provide more
public review feedback going forward.

For this specific case, we learned some lessons from the previous
series. We intentionally based the Hawi binding and driver support
(LPASS codec v4.0) on the earlier series [1] for LPASS codec v4.1.
Although there is no hard dependency between v4.0 and v4.1, we felt this
approach would make the changes easier to review and provide better
context for reviewers.

[1]https://lore.kernel.org/all/20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com/
> specifically, this is more Qualcomm as a whole.
> 
> I've dropped this for now, please resend once it can at least be
> applied.

Well noted.

Those dependencies are actively being worked on. Three out of the five
patch series have already been applied. We will monitor the remaining
dependencies and post an updated version once they are ready to be applied.

More details of those dependencies:
  [1] ASoC: qcom: Add QAIF AIF MI2S and TDM DAI support (applied)

https://lore.kernel.org/all/20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com/

  [2] Add LPASS VA CSR HeartBeat pulse clock support (Reviewed-by)

https://lore.kernel.org/all/20260917-master-v8-0-823d2c5d090a@oss.qualcomm.com/

  [3] ASoC: qcom: Add shikra and Hawi LPASS macro support (under review)

https://lore.kernel.org/all/20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com/

  [4] arm64: dts: qcom: Introduce the Device Tree for the Hawi SoC (applied)

https://lore.kernel.org/all/20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com/

  [5] arm64: dts: qcom: Introduce the Device Tree for the Maili SoC
(under review)

https://lore.kernel.org/all/20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com/

-- 
Thx and BRs,
Aiqun(Maria) Yu
