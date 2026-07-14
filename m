Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69CE374169
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 11:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030239; cv=none; b=c0f7E8MuZzkABjSnY3R+rdYpSMiiLoCL5+1I8MGpTP1b0be0CZGdtfl3L8gytkDrK+ji03x2P+VzB1vRKoc+biaAqY07tvqRID3TF5xsnXQAl25e5CvfTj0qcNfR6sbjT6EigFEDyP976ofyB4kmO2I1Ks2c5W2eSIBoF/nEhEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030239; c=relaxed/simple;
	bh=2+AAB9ojmWH2Lt2acUSHVRK1Gw6u3D/EWC7gt2Xgakg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h2DqVXNvNqSyhyEasl82/hyLL4uJqlGy7Ns5wKApJqA0LEZGCbEBFCk4OotblBgjuxGZH+5i94w/ewmhwbC2KL2P9zIIc+6peQ8hAXvCu4+d/FPVtwtX3INxnoUSAZRhy681DZ+VcG1T2qUsZLphbjnqN7oZD8mLejkdCFJTrdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5nFkIn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9nNMVWv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5nFkIn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9nNMVWv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBNv3f231236
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 11:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXPywjyACU/KI48Qc2v9kds1qdzaQAU2wEA0rakHjIQ=; b=m5nFkIn7jw4pY86o
	XH+kZrndhUfAkBZoFK1jFEdxHs0iFR7rUlLEqq20liXEzv1qnExr3eK5d/K30GPI
	i3FW9yoDBVR7mXbLpXJOYnLQA/nFj1mj9Z99FnWIVGc5xcyYT5JHkD/sJ3UCOerx
	vRjMrV5qQ/EV3ecfT77/PY8Gas0ZoRZ6PFfXirfrTkPOW4qSMamsZk9f3woL77Zd
	v5p9yMbGeLtbmbNdAmWi7l8G+F0MI1RtlHCNlKLoApNw/gOM4GdHOZxnBE27HkqG
	08tuObOScjmEBijTnVt6PrwqTuwMRebr322rCRJbFQ94BS9S+l2HxB59jLKVXalh
	w3Zj7g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p3g2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 11:57:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3810960140eso4897385a91.2
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 04:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784030236; x=1784635036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXPywjyACU/KI48Qc2v9kds1qdzaQAU2wEA0rakHjIQ=;
        b=N9nNMVWvzkhoSvUjYH+IAiJddLm5xGVp8HLUTFZQpZMGgaq4hhzt9fu07uffRJj8Ng
         XVBffr8QiM+EmlktHWY9iP1Csleu7gZwD/DXloD7ISnb3VckdxXCcdr4wfPjWTUNNLxw
         HbSLeP3B/NDi0CMIFJKqKvhxq7vz16rivQYVd4es5fVzCsWkLGpwo2jM5yd/nKw+VC8b
         6VO7GUt3bgOHEitxow4W/Brtk1FPeCHKA6ymTfoohB2rvgNPvxYEdqcVcY6ZpnaWNs3T
         aV6xcVw9D2whM9CaI9ytdFGZphEuWBRK3AlVu36Ho93Vte7QuZW4PvOZW6qt8Jl9tWE1
         og3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030236; x=1784635036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXPywjyACU/KI48Qc2v9kds1qdzaQAU2wEA0rakHjIQ=;
        b=l2wB0IbMAo6yXNsfo6cKsss4w8grFrgQPPuQu6YqiFVLXqLfV572gkoY0Yg2U7W0XG
         8cxb4Fnlb5AOBEFI0LOEzAmOnFQXdefS29JjaCvSEj/QwBT85c5ZkMo9xUKNXz5SEmj2
         SRLhGpADf8zqvKTAGflabgFrEbiUmKhEmmztuNqnZ+Lx9RpFjwi/Wu/MNxlSgos1dT1i
         hrbysdwDENz/2as6JzvmwAbqPYaF+QN9d6K4V2hcFgizyL/p3D2Dq76WTEHwkHHNNXQ2
         ZgFlXjig2hbrkqg7lf6nyHSjbSP8JousuoKPhcnP1ZjVn+s6sB4zLs282wgZ+mV89nsC
         71cg==
X-Forwarded-Encrypted: i=1; AHgh+RpzB4GVL/qBsDDOgj7+jeTRrg+lyzmqGwCdY3Tog4jQb70k1Wf2EzcmUjcHv2uWcmjcLzObdVnp7OgJFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNLSrnjtFOMmNmEpbxutOKirvBMrLUf700wU5ZuyCbtUkZ0a0V
	1brpYCWhZyFp0fZT/7q+SzsipK1gEWw/KOZ47ue7qbWWE3bBsI/nx1Mo97e6W3hrwAHSV5nZq4K
	aEvUVbHXmKbKoQEwozcRG0Uo1nqbEZJGsPLhFhWPCyYZMg3w4X8wnvVPnMtIYzR677g==
X-Gm-Gg: AfdE7clFeA5CiQ0jc1xa2nY/Os6TSDtsD3xD/lv5KEFR4T8nDUCDdloaePpU/V+TIAd
	wd5Fti9mR9qn/D56/kW6f6dJV2qfrEgn1U9bhBbi+n1RNoeZMTOGHADLj1iBDsIn2m1XMw4d43+
	phCMKBGkOqeC0I+xqs5AC1uThbYFK5Q3idBcGuwpfJS4M57TKkVgX38vqvha6PeHtDDBozD8X+R
	1xuOPutYZ89hBLX7dMrvuFi+gfrwQpYaAGwsV4WwmXoVIv3xTMVrrPxVdqAaBA+zRJKqbuOIZZg
	lZbozjVzMkQYqygerrTzuPylxmic843/x0oJcloFOnPOuFrn014Ikf7J2B9SDMDs0Api5bxKg9l
	AMfYzToDfV5Uz62z+VzJGL3+rjGeuCp4C1b8Omc+70Uql
X-Received: by 2002:a17:90b:54c4:b0:37e:2053:348f with SMTP id 98e67ed59e1d1-38e17e4442cmr2697097a91.25.1784030236472;
        Tue, 14 Jul 2026 04:57:16 -0700 (PDT)
X-Received: by 2002:a17:90b:54c4:b0:37e:2053:348f with SMTP id 98e67ed59e1d1-38e17e4442cmr2697064a91.25.1784030236041;
        Tue, 14 Jul 2026 04:57:16 -0700 (PDT)
Received: from [10.219.49.235] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4b97661sm48263936eec.7.2026.07.14.04.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 04:57:15 -0700 (PDT)
Message-ID: <6ce00e9f-66fb-4c45-9a3d-f442aa230951@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 17:27:10 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] ASoC: dt-bindings: qcom,sm8250: Add Hawi sound
 card
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713180907.874954-1-prasad.kumpatla@oss.qualcomm.com>
 <d67a4f47-82b4-49d5-b851-d3388651e660@sirena.org.uk>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <d67a4f47-82b4-49d5-b851-d3388651e660@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyNCBTYWx0ZWRfX10h7GekoxoCZ
 R//GfcN6l8l774cBFwWHaeZK8/SZto341QTBaY6ndLpsxHmxu61Jw3aK/ik+4UEKPTNGkgpb5ok
 EJsyJVQSilsJS74oLU1MYVMe5RMdlUE=
X-Proofpoint-GUID: UZzJoaU3MMofgPPy9L9QUIFVjcgH7xV6
X-Proofpoint-ORIG-GUID: UZzJoaU3MMofgPPy9L9QUIFVjcgH7xV6
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a56241d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KJAHXRm5T7kSH1rCH1oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyNCBTYWx0ZWRfX0qKXlN96LUJf
 iHtyk0y7WMfGwwXw29ocWnrKFcfu7AqRKrOs/LLnK1OOeY1AlBNNSvoVX0s35x+XAxEdJmUn/Z+
 yO3e+m4SHZK5n830kAIR/DZYOx6LwcEeGOuEZF8zePojuCMtZISntcaaGopQxxqP1wN0Wa1zoKk
 QCiEYp3QfcprnmxNBUpLzCGwTljDJ/0TBH5wBn8l1ZrAasbm8AV6PcSejjE8z0p6yx+AaIBf77t
 96HAehSSz7MW9Qp923wBGZYMf3bLBSez1hMrm6dDRn08paRWTCdbgZXu5ulhhtT6O9y7fbG3BtT
 B2yAedxekEXpjPbz+C0wL8B4NVX08P6xQ05kpE8zSBjET0dVzoRdmK/mIFAcw1V6cX/GNHmjJlw
 tH/dAsnQ3quoUwmGx9Vz8etnonEzJ1abryM9E/bjcL5C5b2KhEZRsJOsSuwE/8KEgOnEZL0veVk
 VRtgmGdPR5Lm7LjWnLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140124


On 7/14/2026 12:52 AM, Mark Brown wrote:
> On Mon, Jul 13, 2026 at 11:39:05PM +0530, Prasad Kumpatla wrote:
>> This series add support for sound card on Qualcomm Hawi boards.
>>
>> This series depends on:
>> 	- https://lore.kernel.org/all/20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com/
> Which is a not directly legible link to "ASoC: qcom: add AudioReach TDM
> backend support" which itself has a dependency on some further in flight
> stuff also specified as a link to some random message ID with whatever
> pile of problems that has.
>
> This isn't directed at you specifically, this is a general problem which
> seems to be getting worse and worse with the Qualcomm patches.  There's
> multi-level stacks of dependencies, the dependencies are hard to follow
> and nothing seems to be moving at any great pace so I'm ending up with
> my review queue clogged with things which don't even apply due to the in
> flight stuff and it's hard to figure out what's going on.  Can you all
> please coordinate with each other and try to get whatever is at the
> bottom of these stacks of dependencies in?  If you have to send changes
> based on some in flight things specify those dependencies in so they're
> readable from the email.  Right now it just seems like there's a
> constant stream of stuff being thrown over the wall without any review
> going on.
>
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.

Hi Mark,

Thank you for the feedback and for highlighting this broader issue.

That's a fair point. I'll update the cover letter to include concise,
human-readable descriptions of the dependency chain and the purpose of
each prerequisite series, rather than relying solely on lore links.

I appreciate the guidance and will incorporate this in the next revision.

Thanks,
Prasad

