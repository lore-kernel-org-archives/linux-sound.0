Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B347637F33D
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 06:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329024; cv=none; b=Y9VK5m1wL6OXEuhekuraWwAujs7S7JkwlTJE8RZ3AsDLuOEX4/v23F3ztuyDbkYzSKKlDeVgsGnCnVWvFlRsGEStYS0kkmBcZBimok/YQ9xX7Xveampe0OYWay2fZK3Aa+Tc9zrmOXELRlmhh7Fg6zXKLlGXW0Vw+14FpFmiQKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329024; c=relaxed/simple;
	bh=o97CWqIQFcEcZdUT86XmhToxk7DsnJcoxqWppEhsMBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQi7uYCULAC84yFe2Ky+DBIhj3WsISfB9WJpo28G38Fd/6M9RlmMHavA8KVa8vHrSnk5g2Q/pw9ykL05MOW2KdkBCtqxUhnjU4sNPVQaFBsLI/vRUuO63DKBLO8OF+77tsb5TXQhDGukMKBPqEK/kSwT1bf69hVSl+qdRwqGHdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3j2xj3d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TplpEiN6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3j2xj3d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TplpEiN6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6825YLEO1076332
	for <linux-sound@vger.kernel.org>; Wed, 2 Sep 2026 06:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pT9aAO/eBtnNkWcr6KE1/DU0x/sG2h0E/ZtJ//Xo5T8=; b=P3j2xj3dhal1GG8O
	ZW2h+1eZz7dqwt5vecp/mzjDW/sZpL7VbAH1Ci4mrHqF0ovJWdL6ItQQaFXLyWkB
	ko+3KmQcBFcFMNBgaqVE317y3wwGNGsE+nJP1ZYrRJHqPRxMmn49psxdELdruhFg
	j+AZIhXpstsah2ib2RowJRzBjce3numTN7spiXdqmdrvNggSUXXKGsvIK6SyE3uT
	/mWs+JG2gRMOLUCJljt2+FL2Z0/kE2z0A4TQzfT7gSIlJ6aGSEorZhX8Xh/jzECY
	dbwdayQa5/iZk5hlX2n2iBiGXUW4FYIOsSHJS1yNqO2d53YHGrsRC/glPFSG4kwJ
	FrcAgg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdynt3q7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 06:03:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso981609a91.3
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 23:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788329015; x=1788933815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pT9aAO/eBtnNkWcr6KE1/DU0x/sG2h0E/ZtJ//Xo5T8=;
        b=TplpEiN6ijx/4BaNDVyQjANqVB6AaXlBDGIQY9hu3lW079TBeajb22ErvagvbHvKGA
         RTf9q+CXTEGYf2od/0/crlSuAvKMmIQG4j0tjdayr9/0uBFEOfQZFjdSY0Ftmm2inV8f
         SjZB24T/UKf0hxyKgwe9qpNjBUKhKLwKBUoVaw7surG98lNqrdGjn0NXlnY5wgGRwtBo
         RLckSD/fh8UzlRQ7SH+UtUkWNNYjz+9plj+ts9/Qj3uJN/Roqkh/8eUrU4J0tAlxPqRZ
         RcxWm5+BORT0Plm9cb85tFZSHlsJJuYTsyoj9nAbxBrPLRFS0SxuDNURAVs138/tGd8K
         lv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329015; x=1788933815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pT9aAO/eBtnNkWcr6KE1/DU0x/sG2h0E/ZtJ//Xo5T8=;
        b=qWpU+T7E/8+UmoUIWi8ffX9htv6JxoqNFfIhHY8DOo51OqXaxtv4wj4+AjFekbxN9Z
         fAu/BHgUo3Os7/TXdtQKJhlOPAwgEz7c0TI9ZupdqXhKtDvYvUfFblfVkW5rpcMarOu8
         o9mMk8WIKIdNUGGsJPVZEtQ8e1+hmWry+EfoxLYPoHyZP8GYa3ztqjtpDwrTi/F04wKr
         oTKTObyYkY5F4X8sf7LGFJnVodyflOc0M9b3rGCUwzeunzIHylSeoUdqopJCwt4CNiIB
         bjLVrpgHyQ2s7InAVukiVLADWy1hLn+yW6+Rc5oVIhJqQomKMdB0cRPt3Dwhlik2r5AV
         JWAg==
X-Forwarded-Encrypted: i=1; AKwUvBwB+5HDoqXfVznSt+r+iiZUhREeJMvFszPMDiDWWsPZdlpsOLYArVDIEl54z1dTfixX2cKW+Ln6kVJMUw==@vger.kernel.org
X-Gm-Message-State: AFuF++lSwos1GPwmANuZrny/oN8ERqmrTHA29jTB/xhWdniuPhdu4m3z
	FCBNVaIEbzB+aQpRfzko3TTFOfoV3tfUmt90trrG/iuQXvWbF5H40HvkpK4+FDbE1X7OlIGw6A1
	E5eE52/+AbzmyGv+WHxTeMKuozF9EX/yQjWD5+B+8yN+nH06vDazU3fTAggQqcuRORw==
X-Gm-Gg: AYBFou2k076Uwwttpl8WybWDThIzcbtX9ht/SAeXcBD070eOd6kkiJ/Q2BJY5tdOf0b
	ZVco+tx6P++orbmfo62CYNJcx6yq//AUmHA865gP1KcDFgiS7K45J0sZ+4g8C0JYR3rggsYrkt/
	9piWtto24lKcnpmShwaYuCSybZfvEFig44QbPNbhsWjW6uHnNGSCRi3WR/6pQmElU8FCsmEBXEm
	m1yc6eU6tZB2OiFIzA9T1mRgGAhaESGs2hhZTlffypCDLuMszEM+x1tOOEhSlJTiJjC2qIaHeTA
	fJZ7lrXXMZp/NCwP8eGDILnLUQ7y0IA6L/laP0GSwryfgcstRczkhs3A9tAbbVslufXmIWa7cuc
	bLepoKdyQY/sO+BzTWDqVUov8CkG0
X-Received: by 2002:a17:90b:4b89:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39aee105a46mr3196160a91.18.1788329015549;
        Tue, 01 Sep 2026 23:03:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4b89:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39aee105a46mr3196102a91.18.1788329015086;
        Tue, 01 Sep 2026 23:03:35 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f077fad2dsm3447898eec.0.2026.09.01.23.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:03:34 -0700 (PDT)
Message-ID: <5dce0c9a-84b1-4041-b2d1-54cbb55c64ab@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 11:33:28 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: sound: qcom,q6apm-dai: add stage-2
 (SCM/VMID) access model
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
 <20260826-a2a-shikra-vmid-v5-v2-1-c3dc62354eee@oss.qualcomm.com>
 <c7c29560-ff28-4321-989a-e081f2870555@sirena.org.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <c7c29560-ff28-4321-989a-e081f2870555@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfXyqEESGHZSUy1
 3uX6KOn50rsSdgWX9QFPrHy4q0Ld4qgzo6D3L+APL5JxkduMkimaQ1Bl6L5ly5CdXwtEPyG1n5h
 OpkXku4JpeObaNWNr7gOoFNl2W+g0Jcf8yXHV9xspOOeP+iEMsz1UthihyUJ4HKqbsoufXkR9U0
 3ch1Q62vUvfd8vyP3IPJuCh2PomU2TjAMx425bDWmKUwpkQag2nscVmaGtrmZl2AViUhfUfKu0R
 gCXH4H5TcU69D4UK0LdoByftwMRqPIsLa9fn5VToaDHjqwBwlA0iC0iWreYHop4lbuiq7NN3WBO
 09tr1eg827uxuImjEO1tJHNGn1Izz85IjnpzclAnswE544TIP/g4xtrdKtHZrJ4vAfg3xe21hyB
 yiEnc/ovTdgPfkNSF2Vpfa5w6FROTU3OfjTKh2xWrRf7cTMfgxKl+mEbyGpMPDLC71o7o9vJe43
 gl6g9O8nR/SJrSI+cNw==
X-Proofpoint-ORIG-GUID: 1eVwPrSFvYV9w1q44C0B5v8oVFwOw4-8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX9c0F0Z1QtmBU
 XHYq75r7R2gBmiUkqN6RmjlK00TIiQzqIfdxupc9FkCXnNubkFrGggzOolSXHahiVnVfYfObqhI
 oNAIKxGklYN+Gs2pnKSlOenVA/2lBU4=
X-Authority-Analysis: v=2.4 cv=LfkMLDfi c=1 sm=1 tr=0 ts=6a97bc38 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=LkqdXz0YFAjP81C9FE8A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 1eVwPrSFvYV9w1q44C0B5v8oVFwOw4-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020051

ACK, will follow in V3

On 8/27/2026 4:14 AM, Mark Brown wrote:
> On Wed, Aug 26, 2026 at 12:10:12AM +0530, Ajay Kumar Nandam wrote:
>> The APM DAIs expose PCM buffers that the backing DSP must be able to
>> reach. On existing targets the DSP runs in a stage-1 context and the
>> buffers are described to the SMMU via the iommus property.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

