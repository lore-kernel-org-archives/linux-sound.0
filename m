Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E183B9DA2
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158894; cv=none; b=s/YRbIalH3M1dvKVzt2KI8z73SCko32RG06KFYYuYf7bR3lRr2QqTQTdkObbyuYXp1/BBG5ce6Jp0J7lduH7h5XEDNVYFNnGpXzu/uyCssw9tst9ZquYBDiNs4ZsNVHUcA7dp6Vo/UmH9eoChi2GDo3EpvDeru+aW/WpavU2XDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158894; c=relaxed/simple;
	bh=iZrJZpPtINLl1+luHqpDgYbeh+LfMD/d1VjoI+UmY1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CfiHYcpFxZsm3Ytgc3Ybw4gvukJz41VRfPOWJ3ZHkfmd+vREtpRnaYnimcaqQ9ZeBWD5XWtfkIDuA4FSV7mVzjWKP2xcBDNHh7cKNnvU8AwabYFWWHEewFYbF0+VDxEPE6FI3NjKLKPmAJSG/yr3aX3o0cem8c8qwb/v/+9oxN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaIu16jv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8kkIH0T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaIu16jv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8kkIH0T"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6m5fq3505276
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 09:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ea5I0KaA8Qymx5nhITN+82nJTFAWzwV9uv6f1CEHdBQ=; b=PaIu16jvI4eY6nNj
	gtcJ0rCxXZdrTIMciGXAddLHbSyjqOVBDSlnrJpyngGt8ieMty4j/G9uoYSU/Z9/
	vRBy3Ir7ot7z2vOFU5GYGWxZ8vAagQzlWwS9wepfMQPG3aH8KKwGsfYbKTkS2eBl
	p6hbuhwiac5HjK+vrOqwiyQLaoAtoYR382RBKUqJwrRqC1AUyJC7AOydSrOqPqe0
	1wLNmfbieNyFNAY1oAIy7/bTlXvl/4splut5XooIUHwhCKyycdwfagVR7B/wINYl
	FB6ezFKEmrZidMLMxjoW0f4ydR7MrDoyBfUNrRlloVvmx7Yi4tEt0XnRwXYxe8yE
	vgMMAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870j4c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 09:28:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso50699281cf.0
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 02:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776158891; x=1776763691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ea5I0KaA8Qymx5nhITN+82nJTFAWzwV9uv6f1CEHdBQ=;
        b=P8kkIH0T2zoWl2LUwuyeQVRkodEfKJFNuSb0TjjbfU5Dhsa9XspkuMAYRA8K0JK1Dh
         Jbd/0IRoyC3MMv9P6aoXhEADJslcQdQnBUK6eu9jQ+L6IQYyEYDgd0jFre2GAr4yB3S1
         0nH/kyfzhhyrK9JoaqhuP0D6yU3PJtl+1oiYqmKMP3QDy17x7eGh0KZwIviFamY6KS6W
         eqY/GYukEr7YubQTv9LFnvqhTXEF7SeROYc9VK13TdQfNybvo8kC/0BEfkrv0ZCzSigp
         Lg1Ku5UR8s420rGNcLRYo6xg5/fxXeoIQCdqqdE8TVVsrmW/w1jbvPUEE8so4lmjYxGY
         e/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158891; x=1776763691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ea5I0KaA8Qymx5nhITN+82nJTFAWzwV9uv6f1CEHdBQ=;
        b=HBsyrxDqTH3zUQSM4CRWU4O/jhL0FjTR9nGT3i6SaOI7jP1faCujL0b550lTGERpIT
         jfShGGDgekZNSLf/dx8Ll+CMy0kitKUCuJzquvS43HgAIWqdtpw3cxEAV0CB7waqnSTi
         STF9X/iXj+fMMChEEc1BN7TtGuyJ1hvT80DaUD7kFzvDhGLheoKGyCSL4ib3dTdMUypP
         p+zIu8yuNCShOsuP1F9XbuyOeyZ1TR1NQ9YpqjlJZzCSGrj3d/qpyeqHmpiHJbpPzaqf
         LPaGXeUeK/1nO1i5Eyz+1grIlfHc9jjrcH4n7fVh4sZpoDWKoxyaejg3j3UXgh/35w9n
         rtjA==
X-Forwarded-Encrypted: i=1; AFNElJ+wWqf8YRiPGvB1WkfQDVz4Xnj+5J5ht0NrXou/WuNv+pcHSsh5TBsH4DKcAUxNt3Hh6TTj1+jpqOmZgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2qoRyZOLMDBa7xAbxkbOXCixZ5OPmZ1P9LVZqVHU9gmjMzdfb
	rPej9/iE0o8X1TJ3yyUKqDZy4/RAzL/AZcnSk15tBaM9+B9CMkVxeYeTuqrHyjzlK9GT3IUi2OM
	c4se6gQrTubVZ2R+8qcYIcdG6TyXXv6BCNSQi+bljCLwmC72R7WecGDrMTilUKh5hnw==
X-Gm-Gg: AeBDiev8OD/fUpVudA6hZYQWY3X21mvf4XgtY1uT0lTaPB7lKJrme3Hh9FpienFezts
	q4Gbmc35Jf2RSestlKkbAE+jlvZRiyQhanGUQ1D6mmy4hI1+CO3SYT+Du/wFK4LgXDhQM+NLscy
	EqSzFIzHS7bGji2cFKgzKADRx4WKrZSaLJ/p3p6uDUdTr4NzUM05gY4qWdoPJfYjjC5GOWBYCbb
	q+6Vgk3jXAVqUeO8dchqbK6YQpHlvDZcqF+uPrAmqqM1aY+3ce+J+qRBPQsjljx1aZNh/tqOOtY
	Vj59w1WG2NB3QEaN4Qj5VQfN/tABzGUufWKa2VBh7YZbj6av4owM4Rco/IKILSEzQ/zdjdfnhI9
	85a8WNVm+HUX09ElCRirbXBjn1qSCf3YJGCgPk/+rDU9cJSsOJ4hle1Ex5+v82t6YQP91jICSZw
	WkyZEvxNsbXcaacw==
X-Received: by 2002:a05:622a:5a96:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50dd5b76641mr185509151cf.4.1776158891248;
        Tue, 14 Apr 2026 02:28:11 -0700 (PDT)
X-Received: by 2002:a05:622a:5a96:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50dd5b76641mr185508941cf.4.1776158890861;
        Tue, 14 Apr 2026 02:28:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671a15577f9sm892094a12.17.2026.04.14.02.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:28:10 -0700 (PDT)
Message-ID: <150d2a51-9fc0-444f-8009-9b2401c5bc16@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:28:07 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: qcs6490: Enable DP audio
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-3-kumar.singh@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413091937.134469-3-kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4NyBTYWx0ZWRfXyFmp6ymErOC/
 LsRqlUduNXFFheGlU3QWJBFILHBVeyxWIcuYZ5nprPjLlnzpJMkAsgnOrsro/QQQr7U2axGAQuv
 Ejqmf0Kw/TNEvCOCtacrEm1/r9St5zDlKdu5EISYbJGIJQ+Uja3VxpPi8xduqtFJz12m2++pr9K
 hguTLkuoR2PmRCcSUvaAIJU/AMwGQNbuZMUwjl8pIU7xs2hRSJYgLajPkOGUgk6KWOac2n6YG9H
 TFGYte66+hnRBrMTHUt75kfuC5MvW0+xttigj4bAIZOUQNtm9fBHmPrAoKP3apZ9WFcCvLIo5Md
 Qqgfybc3xX0rNi+To7k+zwYqht45uXq6DRNNY/91Il4LV9HsLBKXHYUV/psdC+2BDiTUuFzL59O
 zFj3Z+EW5LngHJi+Btn52dAB2KL6gToKXmmdtB+Pk0ECFRrhhoW8VTQ/GMfwWJA1JxRXGeFisuq
 e3a5NIytsmr+GIjNuAw==
X-Proofpoint-ORIG-GUID: plTC63oEiTsJ8nD9lWHS_jcNBjhfpgI9
X-Proofpoint-GUID: plTC63oEiTsJ8nD9lWHS_jcNBjhfpgI9
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69de08ac cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=L-W2jZRBQ8sxs3TRFuwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140087

On 4/13/26 11:19 AM, Kumar Anurag wrote:
> Add new dai link to enable DP audio.
> 
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---

subject: qcs6490-rb3gen2

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
