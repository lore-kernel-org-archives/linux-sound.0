Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F5F3C17
	for <linux-sound@vger.kernel.org>; Sun, 22 Feb 2026 09:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771751351; cv=none; b=IQiFsw0s4UnZAgIkPCZZX+heVl4Y6RmbRZXQarb8lR/4GyzcaLc+s7W0SzcquDHsdYXsq1AmVWODJkme16mD0YOlgKyy+Dti1xuoPEpZ6PMSnJbtKt4MHxMZ7/Bs6jwqwDAkijhG5eZ9Fp3LFPgboyuqN7E4+hRhR5ng1Fl62qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771751351; c=relaxed/simple;
	bh=z7v9zbZfAvtSPyUpOo++ICh1JWY103m7kvneLVdlNdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VPqkue4ARC6ti+tGoX5U3ayyKnJZeKk/KgB67xaxHGTDoNcK+f1DEdCNMYzbNlh3ykrkdVMaK3XzywbiHpWUklZ5lmPyjcOF/vvv7SXC/DvXNOHh1jQUjy3tYd8Nyx76f7J+lDfpY2cZ5+WFxvftHkjDoY4oNeP5uTbLoWa7An8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XcHVWlbZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CAibYHXq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XcHVWlbZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CAibYHXq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61M3tXoO3911143
	for <linux-sound@vger.kernel.org>; Sun, 22 Feb 2026 09:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4KXrz/whAUdxYsVufWRSV8exud1gQ6s3p689ErTtFlQ=; b=XcHVWlbZU0K8zUxP
	2qAzTvLvlt+IZVWK4Pvgo3/S3a5QMnyjfsrX1Wh56ybQRVBr6hW2BULco4mWuGNG
	YZ4xDYOpy1To3OqxS8z3wW+z3/kAh6HNg1BaPoC4rvRKRmVJygzTWUfJjuqO6SDz
	RmVWrjXZW6GpXZFd3f+xt/NJ1IAUa9JCz7zbhlelAMssOxjDQFnzc2EHxSas5i4t
	eoY/ox8Bz56XJmePBgvFTG0koBXuzqKKxdcVtP39l7ZVcez2YzZ3N2FQVZY18SXg
	SLmJpVnywamN2qecco4rRAH/EEJcKHCj53yhHSVHxdBrbdF8cw0HYBfBKNqGd0hG
	26Dxgw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wba07w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Feb 2026 09:09:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71655aa11so4937472385a.3
        for <linux-sound@vger.kernel.org>; Sun, 22 Feb 2026 01:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771751349; x=1772356149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4KXrz/whAUdxYsVufWRSV8exud1gQ6s3p689ErTtFlQ=;
        b=CAibYHXq7rXedA4pLnZ6C54u6vzBbplhRyrCqhLu47BOtBGTGG4jSQLnxUsBSLyE7d
         t2rKuco48vxn2jUHxfvMqCgYkTBfyIJgAs7CPbpH3OZ7U1SO22XagbKpRva12Vv49eOt
         OGIu0eZ3imKRNKRuQ3fnyUvjWYuLEJ9g7dkwtgbdkW8yD/5nwWHp0k93hAZyom2rZu0Q
         dmswAbXWwscWBl+3tbYdruYn/0W7kgfjkZDorkTwmKWASl91CnYBzj/3KUDUmfKlrB/c
         uHGSEGAcoLbUYnZ+fuKZFSoAjLPDR/dR0bLXfNuJRaE1lKfERu5z1SdjhQedtwn65r1z
         Qcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771751349; x=1772356149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KXrz/whAUdxYsVufWRSV8exud1gQ6s3p689ErTtFlQ=;
        b=rmOeGfEODfOxLlGEQI4kXm3Ld9aC4XxsOwXPGQvAfy27bRX4Un80qeeClCfPryffto
         1l4iqLZ1VOGk0tdjvSK7oCAwLwV5RQCQ4KTn7aKa390p9/SRH0Z5v9LyBdGt8EtieDIK
         q7goxfQySsS5qQYDGax1bXRgf+Pp4SnNjEvoorWS8h/qrJYsIrtPCh2sYzwb5O4KXZhx
         5FX3mW+AMhQLOKN4vY/KVzwbxMJ/XIWW0AqaAn8gjWpUXGDfBu3QugPc7ESU7wurj+Y9
         ix9lL+Q6487bryNE2n0aC3s3GMrdFyjxnLWVfh/y1v/0Njw3A7VXJLc4AA2mVcc1Qc87
         CA4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5d/xw0YfjK7NfJBxn1ZkmAvgJWn4ElmUJuMc0C/SnRXyMPA9dVFjJGSTbcbPAS73jeP30+ZS4FnDtfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxywdgmaMKcZjVHZ903pni9a9ZXtXa1a7Dlcjn7DAsbqxw9vflz
	lQ4h9loFdGLRWUHPCm27gBL/56i52oSGu9cvPzE7WZ5dinvFxwQMnFfGsnfnBOARzQ0D7JitPo8
	vGzifxk2hJVdeQjTMUX2Ds71HgeMfk8RJHAHYGcIP3d888j2I0MNPWLxT+nTx6Md3YA==
X-Gm-Gg: AZuq6aJWOznc4CrGIow3A3f5+fDHnfzKLoM+BubMfbxKiYv6os/8EyFAsevmJbaEv+x
	X4Col/5zU1va6q+1SZAtU9CZtLMZNgJn5ZKVLilXuRF9OOW0QgA7UcQrWyO4fceidd0uPTZ0kK9
	GakJNVlV6fJJJmeto7KZB9ohj655Cvcmfq+JLSb7sDvjuerapxXi4VN+IGeXWTaB7KA9dVm46kD
	Xgih/JweogDfVW8cyWP+OL5uTMRF6c+S7ZtWhqzYzAk+RtFMdLXR3VRsjYFeceUgARBnOvmxGpA
	J/kdZT6W+3bD5H5vAjYV5oWlgMWYWPGLerec7dn5o3DxBwTIHq1UufRsZLG56IC/ggGKc2rKX8N
	ZpLGYNbwT/nzfa3mTshu9KvXSyzwbd7NIY40FqeVGj0rEUXRI
X-Received: by 2002:a05:620a:29d1:b0:8c7:1156:efd8 with SMTP id af79cd13be357-8cb8ca0e734mr611755085a.29.1771751349078;
        Sun, 22 Feb 2026 01:09:09 -0800 (PST)
X-Received: by 2002:a05:620a:29d1:b0:8c7:1156:efd8 with SMTP id af79cd13be357-8cb8ca0e734mr611753485a.29.1771751348587;
        Sun, 22 Feb 2026 01:09:08 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43970d54a68sm11491393f8f.39.2026.02.22.01.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 01:09:07 -0800 (PST)
Message-ID: <a814c0bf-e421-4cf2-8b9b-e5dac9b80dff@oss.qualcomm.com>
Date: Sun, 22 Feb 2026 09:09:06 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] soundwire: qcom: deprecate qcom,din/out-ports
To: Luca Weiss <luca.weiss@fairphone.com>, robh@kernel.org, krzk+dt@kernel.org,
        vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250912083225.228778-5-srinivas.kandagatla@oss.qualcomm.com>
 <DGJTU2TOFZR7.2MOU6I6J8GV4L@fairphone.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DGJTU2TOFZR7.2MOU6I6J8GV4L@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Tz7Vr4Z8tbVn-N80fTaGaqnI2Ef8yhau
X-Authority-Analysis: v=2.4 cv=UZlciaSN c=1 sm=1 tr=0 ts=699ac7b6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=WCuOT8F2V25LyjQZ8KwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Tz7Vr4Z8tbVn-N80fTaGaqnI2Ef8yhau
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDA4NiBTYWx0ZWRfX8zxnC6EnRStU
 q6pZYdZkEeZE8ktEdWGGMomI5wuOc1a6q78WDifTLp/9MM1LcQgI1t1QWXTK13rh/hYua+h2bew
 HgbjxB3UK8eGrdPW11htiB4u6pjbitAJixc0UkxnGRy8ADIbZ2vojIVjotat5WzS05HwjVp5FfA
 y/UrvwO2Iwn/LieK5iPtCXo0qPT3zf1Q/jcJysEi8VrhneeDis+Tdlawpk0b3M7KesmSRUo6gDh
 8+eFy/dI5x7fGiws0JNNoWVta+8obpW3akjzt4ainSR9H9ARL7TwphDKrMz6nVY9a91Fn4cPbrm
 b1NeOU4pWNSSsKtrPDoE9uy6OniYESkzrq7fiSSBgIns1xwEnLdN0JqizAFaXkb9CDXFQiYPGzT
 7jexw8+WL6Dhf1TGrD3+XnWoGG0SaIaSfLzYwcBK6KN3fpmUifHx44xLUTE885lVzoKu9/lNO6G
 /3fJIb6Qd7OMSHdR+qQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602220086

On 2/20/26 1:34 PM, Luca Weiss wrote:
> Hi Srinivas,
> 
> On Fri Sep 12, 2025 at 10:32 AM CEST, Srinivas Kandagatla wrote:
>> Number of input and output ports can be dynamically read from the
>> controller registers, getting this value from Device Tree is redundant
>> and potentially lead to bugs.
>>
>> Remove the code parsing this property along with marking this as
>> deprecated in device tree bindings.
> 
> Could you help suggest how to correct kodiak.dtsi?
> 

This needs fixing in kodiak.dtsi, for somereason the dtsi is trying to
add ports that does not clearly reflect the actual hardware.

--srini

> I'm seeing these warnings on QCM6490:
> 
> [   36.952517] qcom-soundwire 3210000.soundwire: din-ports (0) mismatch with controller (1)
> [   36.952524] qcom-soundwire 3210000.soundwire: dout-ports (5) mismatch with controller (6)
> [   36.954285] qcom-soundwire 3230000.soundwire: din-ports (3) mismatch with controller (4)

