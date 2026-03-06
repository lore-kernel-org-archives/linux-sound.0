Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE99381AE7
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772794479; cv=none; b=hVY23QKnP9Zw+bBHQAXg3b6+9gqBoym+hv2XXDMxXytn/fBjBuCia5a9l+g2Fbo+qhwGXf61+ZLR4jMxUbFO8e9qp4Sv+97yxX/jNWhNB2UHYvk9PoiA+9odfAtUHJL+31Cy7IDyLvg8RF4Lq6lgvppfCx8xi/exZCahTAoom9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772794479; c=relaxed/simple;
	bh=D1oR+MW5ly/+rf/6gV2gNte3878vf4od9GUDyycgZzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iuapxGXZozzHXFMxNYzJDifivcm6zCgwK2yyFOWpdfZ6Y7MGLb8FRMkY2vDzYTQylylbSj5V69y6CibYk+c2XrZDud+9xszU67TWKrqWT+5jkVA71uqtWSyudUNy2K+CLmyCtaG+GpacMU7QFQM06sjEsnVJGbPxQQMDT6wJDac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3RwZmmu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMZY7vOC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3RwZmmu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMZY7vOC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626AcD0b3297448
	for <linux-sound@vger.kernel.org>; Fri, 6 Mar 2026 10:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Plo1iJxoloBgGUTF5xs0s8C96//M6hBOe1ddtjPmAWw=; b=K3RwZmmuwKD2EH+w
	w06GAo0gLxqbYKrImFFjYXgSLqj7erT0vJm1CPs/uFcWTbC6tNjGcjOspfaWYuf3
	QXLEX7MoIoVpGpijVYEuNS6Di1x04EClQEi4adhE0zl/dN1mDKSFskSh0SWpGz+9
	wsR/hbFDH+KFvDzMonLF03tYL7ePaRHluSeUPB/6YuJlZ6ltzxgzAfqG/WDfeRM5
	s/NmhQluqwGp5jEuC57IlOGHJ4HhreaDVcgjPAk+sUpEgFJwFPf0KTtqeKRuna6y
	dJKXuLRo3mO+et0zaZ6mvdUGK9/MgVY50P96cpd4qMJAOY0ZXHuJM5/HaODKe6JJ
	BXh7Sg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdsfgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 10:54:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb42f56c4aso5296321285a.3
        for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 02:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772794476; x=1773399276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Plo1iJxoloBgGUTF5xs0s8C96//M6hBOe1ddtjPmAWw=;
        b=gMZY7vOC2zlNmgY3ZGVcpyEYOSEeahz86EL8LoKFuv5GX8DshpWI7A1+Y6UMhlFTKg
         e8M7O/FlqoArCyL22/BIQyjAVZKQ7OZ8bEiRgWkUmZX71Ryz32JmzXry0yJWkEwrVh92
         4WCch/GorsGOlGvtSia3aNMxU0vJzfKM6Au/RWs6mP5VN5WNbY7ROYZR6I8i8p6Fy3hW
         t8uWF0gqWnU5gb7W24W2e2yWdFjLii1riaYsJlCGMhC7SP/Lfw0gz3rdIetx1XU3srlG
         t13NntSjjOJjC0yTUpv6QwgLxKZ0iZZbszDG0y2FH0V1tTOB8z7BZtUYBV9/7T8vvh0A
         Ry9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772794476; x=1773399276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Plo1iJxoloBgGUTF5xs0s8C96//M6hBOe1ddtjPmAWw=;
        b=n7oWZW0V0xDx48knTOPWumoYkzLycdzXzw6IkvTPSnCUCIeV8fc2ZieUhkK1s9bXUQ
         eMst7BA2uD3Mhj38CSkaL38jlc8czzeSam3D2p8AmvY6xauhuQXUlW4EjopdIyZz2X92
         696FWcFXv3JbMhvv5asS+WeeQD7kGjt2iatJeZsul580BNJoNaOSGZLzqryODTUtPd8w
         844WZFv5udNeOAH4lhSyZYpPI0vLXWP+o7MSJhUhlUsEVlHYLw7nvNeZ8F1LIjYUd0Yw
         8nVHN8762A5YdZA/zFLW+OUgYfRCIxDNa1dCiyjl23j5xVwRnAD5EzpPacSLmP2zMJ9L
         agxg==
X-Forwarded-Encrypted: i=1; AJvYcCUVxKXGIuOuL70PCDoY2GwnMwP2JF6eFWtu5jP6qJbbPgZCD4PtAj6LZJIsRH8WV/V4vS9h8auFuXAcpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNsGeVCM+YPwkv1t5MOOTF2pRJGL8mUHIfQ6eDwMdhpQXFFY0F
	y4xCW9tsiujOD0CSx3ZOnJ2zuqXRp+yvdzJYvWui1LhKQIe/VY3dJu77zXvJ/he68e+wnBXA3aO
	cV3R6FVbAH0baBaf/M6jiTwaBnl8rL1nhpHJ8+RoeXlQewiWuGALT3abePwY4UmZDqg==
X-Gm-Gg: ATEYQzxM9c+BlKxKFUjdiuT9fen1/Q+Ant8YG0U9Wmc2tJ+YmLpceTirZcOGC0mHS1S
	12Cz9SDw710BNaDmpfjWB9LP1SaMqDDnW4ji8Y5al9R//9UK6gadvVLuDdGlRdQS0JZ9YtG5Z6l
	1OH3qo7GMkXPNVUeli1JmaDnfWmawgeEZL6R0anbn0gLN9KFgELiwHW+bRRvR8/olyQz65olgOe
	QUy2WScFYTi1AbjbeywvLbZ/15elldT0wrwExaNfz9ixWXh4i6zYuRHdVsk3ZqUfRItDk8ubnMV
	/9AjyGwKWkL5dF4Upe6/fJyGdwllAv06uPaLQ73wNzD+cmN4Dr4hhjWEno3nSw0ltiJHb03USjr
	0/p6tQTXiXLHWtNmQ1HOlFjNTk8rWPjIS6hmD7XrvEAMEaXNF
X-Received: by 2002:a05:620a:29c5:b0:8ca:4392:c20d with SMTP id af79cd13be357-8cd6d505f23mr197925185a.80.1772794476451;
        Fri, 06 Mar 2026 02:54:36 -0800 (PST)
X-Received: by 2002:a05:620a:29c5:b0:8ca:4392:c20d with SMTP id af79cd13be357-8cd6d505f23mr197923185a.80.1772794476004;
        Fri, 06 Mar 2026 02:54:36 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-439dadac2a7sm3137054f8f.15.2026.03.06.02.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:54:34 -0800 (PST)
Message-ID: <23434dcf-5f45-4d16-95fb-a13021331de6@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 10:54:33 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/14] ASoC: qcom: q6dsp: few fixes and enhancements
To: Richard Acayan <mailingradian@gmail.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
 <aamJwMvex4aF6eah@rdacayan>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aamJwMvex4aF6eah@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _-FbTOFI-8k2oAHKv8myyNbUkhsSl0C-
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69aab26d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Ta5eXiB5pPAQ62dtjbQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEwNCBTYWx0ZWRfXyxJLCsZa956o
 pwiOVpgQ3R5VPQ70n1+6MiIryOoBrvHoCYOMT4vPqarx2m2mpx6YCu41uLY92mzVPGeh80whBA9
 LZZZoJWh7dn9QBdxZ3+pL0PTpqrkeLIR7yfyYGH0qTlDQuY9yEFBMYcy3punD5rpmGUQxI1ObIq
 Q2y4LQeUhx2M1YcSaTO64URZ5Xbr/Fv4Gjho9IMa3gCvpu/TLyOHvuT6rXY530farOgEe98qBk7
 GVVCd8Wqiw405hA4RXzzcoiDHgrkdIozPSObNjw6Yen+kjEC82WQLVzC9rwVAO98fm7zujnEvIl
 N3U3yXdeNtdmBfMzRZW8QHbI8Kd6jdw0kMvzij8GKljRzT95lgnj8c0nj6a7epRe+YGRoSp//42
 La9h8kXp1klHeQrHWz97Z/PTLKYvfihB21TWXcFKXN6XA9KozhTjc0gIW6t9HX8quF3sBv9jFQ9
 T4QeDKluepmsntiviug==
X-Proofpoint-GUID: _-FbTOFI-8k2oAHKv8myyNbUkhsSl0C-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060104

On 3/5/26 1:48 PM, Richard Acayan wrote:
> On Wed, Mar 04, 2026 at 01:06:58PM +0000, Srinivas Kandagatla wrote:
>> This patchset contains few fixes for the bugs hit during testing with
>> Monza EVK platform
>> - around array out of bounds access on dai ids which keep extending but
>>   the drivers seems to have hardcoded some numbers, fix this and clean
>> the mess up
>> - fix few issues discovered while trying to shut down dsp.
>> - flooding rpmsg with write requests due to not resetting queue pointer,
>>   fix this resetting the pointer in trigger stop.
>> - possible multiple graph opens which can result in open failures.
>>
>> Apart from this few new enhancements to the dsp side
>> - add new LPI MI2S and senary dai entries
> 
> Is the LPI MI2S on Q6AFE? I don't see the AFE port ID.
I think the older SOCs did not have this I guess,

> 
> It sounds different from INT_MI2S so I can rebase my patches to depend
> on this series.
That would be wonderful
Sending out v4 soon!

--srini

