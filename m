Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7EC480976
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 16:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280283; cv=pass; b=S60yGOhncsxFurWOI/4PEmIrXnIrdtkZjs6D4MOe23W2J1IfH5XXJsL5uFjSGfEF0TnsyIV3OZnGK3rHl4f5DtX+fFWYPTmExaLI6NRGVNkIXgr1+SNk1r/GBTBuSa8CVvMU+rnaicHun23v0isx/rAynDfsShxdJ9rBYj0Uj3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280283; c=relaxed/simple;
	bh=XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYDOAqguqwUYcYwOfldOKdUDYSXU68yISfZHfg9ogQBnsZpSuLhIFV1c7kp93U9t5+Edwp5B6nz18UqLjM7bdx61tJ1U8Ni5FBB4Y85YgRvjoKD7J3fF0fi6cJSrjANzhqvpt7+8RJ6WsvG5GitaLjRv5kGpjinwfHOP9CB3t4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C24xkZOB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cCeVWJqJ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C24xkZOB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cCeVWJqJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9Xid1639027
	for <linux-sound@vger.kernel.org>; Tue, 1 Sep 2026 16:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=; b=C24xkZOBMHghNCgp
	nyLxCOhToHipUH1POz509VZqjpVdRE55bwYNcA+stjyTmewceb/Ue8tJ2MHHFet4
	NSQoaOEZiufK0e0j+eUt3MG7B5U72niCsVrQdUaffrj/G2S47sSZPm+9nh4iR72C
	Kc9hhK+GvWXvpmuY+dfHffN56dLMkW67DRnMx3/wRPws4mZexqIMXD1tfh45j+G1
	kFg//DMHpAdwnr8y1RADR4UFNcfsg5T+cJibI2rrT49f1opI3DnFSkn++bMs3mhv
	8CqDT9Mmurfa/d+f2WbsjcbHXOc1VK4pA0IVSVt8BuCSs5wAiIWlRDaT2F2bVVVr
	XGWg/w==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsk2bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 16:31:21 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66f7fdefb16so107394d50.0
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 09:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788280280; cv=none;
        d=google.com; s=arc-20260327;
        b=EpYAFlADBaL9RQV2C0hvdldyR1WRUMfFTFlCGUjzpNcPWIGoWsmyUuJ2aeuzMxNzLX
         5taS400Bdp99OCxOhxp6ozaXd7OIzHOuk6bgWsnqjJU38tkT9L46hzkxfahpRCSomdKk
         8HS70hVX/TVxozYLNBemeJeV2mduAsea4tq+JtraVFXeqCiVzDS++ijnlTqZadiHZ/rW
         oK8IPDV+vnyo/5soRnmEClCHavrdTggxSqqBN8O2FmIQVZ0unxxjT47t+CILD0zgRzF6
         4MsYvAY8vP08XmPBhHknEPVAD+9cq/c8wPm8C2YeDuZHgjA/2OY+UL9KeyhGV8c/ro1V
         /u5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=;
        fh=rWqpsp52l8+tZBin8UXPG4lcwz8b6vAR4J7bld2qD3U=;
        b=USc6kFXouXlz1ziimDDV6xshBg2BU7RZAmk05ZLeZ2dXEnPZrERd4MD+s8t7rVs2kS
         3HyKfN9fM3o59DHgGRaBPFAbDB1eC98TEQBttUzPY9Ivh4EFVMlctg2VSlQR2VPcY1JT
         f9ed2Ep3clOqCS901+xbzAnV7xYLi4TT48bHAcvA7QNXWMPFjwIMXaeDs3WvOItsKiuE
         83Ed0bqDBnZP0ZMeL/k2Dt7NQvd8ozxKtPS6AeSlllXfMn9IxcxdaejUlfueAhtetMjH
         nIQnPt+fxwnuXHp7sem1lQvnMcFJP5xOOgrZ4rQlAQGXYlJrd2wY+MrGQifpJUmRsndu
         3U9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788280280; x=1788885080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=;
        b=cCeVWJqJ3TOh6BkJXvLb2exe5SI+1/q6N7yVGwukBTE9080ojXauK+VeLnMeQISI7z
         weYWuYkFMeRqMUXIjrEEYfVBeEbZg/SYs+knL2xDyRCfjmEPGQ4zgDd1jjzqUpFoIt8h
         ehTgZ2udZGIkTcDmBt2Bqu/+Z/BHl9nTXG8lvr98Rp8iTB/OOg93YoVFKFgNU6JD4KJX
         4/vOHVuPNaq3VTsF/dJRxQJf2nhSc1w+Qef1tqHjUkgO89NOY9YDCPNWdvTi/jirJZhU
         8o1pViX4kybaQYcnHzFxnY8w/Hrvfh11EZs/z7ZprRvT5xlrUPIKt5NEp+dG3EOkVLxc
         Ihow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280280; x=1788885080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=;
        b=nGdJ40g/XiUpQnsq/9W79nSyi2LMu9flnpFgnQHtHDGu5Q5ZMDjnpR7HiCX8HMlyIP
         qaJoC5k5RhHDpguSrFdArWdKx4MOo7FNNtBsgzzF2WRzXWjyf7ygdTCMbl3FZlSt4cdq
         Gfgt9kzbWPi+B1l3SZNPD8YORGk2J+LHASCaz2wxQep7wUTTsjAT687jySB/3jxXbfpA
         IBFsbbJ6noxcgf9YrdwzNvIE/osjuqYyNstpylVGJtqXoLULUzsVXm2CDPIfwj5771Ls
         JhmBBrFr1duCiAgahUzQHXWwVO4epNopM05fs5SQu71A2PxHpSJ+KFDz6sZMVbWPP3XX
         xJ0A==
X-Forwarded-Encrypted: i=1; AKwUvBx02g7578RF8zpprZ22B0bYWWFu4jOpibd2kbQoc4Nd6+0Ew3t9n6GUcviZHezYkAgVo1NCebVXGvbxZg==@vger.kernel.org
X-Gm-Message-State: AFuF++kF5poORCwFfHcXLYUHsCM8X4JIZFj/mhr6uuZXMjGXjX8qtUwm
	haVCj4kKknnq8Hhg2uZQIwoIij8zhYsMlpyndlRKhCmJBnOnRMO69T1b1bAPvodyMGVnaEuSGvx
	ZUbquSWM/9ujhKRdzwTxLdibwWlOI9vLKrsEXG8xTaGnSQVJTsSEcKos+pqemdySS0BgRI68oKh
	4K7j3+7dNHmFpUd6POtCVjm97gyRGW6Mv8F6mDfC+V
X-Gm-Gg: AYBFou0oYRwVDMQT04gc5IMBBIDSQOy+lddiA1TTSjxbYW1ANByfhkRA2h4pwneOpJ+
	o+JI99VYrMC/0VldNzVGVM8FKu0rBZ+Ed70fFQFPv47pUdtAV4AxUvBV4wYdBOWh7146snTrMZY
	HIwp7XmIbaC4I7rGFSOXLlAGW3tL2FErT6IkuQHLoQrfgrQQVHgp0kF9kNxg==
X-Received: by 2002:a53:b111:0:b0:66c:ba49:1316 with SMTP id 956f58d0204a3-66f87458761mr2635196d50.10.1788280280159;
        Tue, 01 Sep 2026 09:31:20 -0700 (PDT)
X-Received: by 2002:a53:b111:0:b0:66c:ba49:1316 with SMTP id
 956f58d0204a3-66f87458761mr2635174d50.10.1788280279650; Tue, 01 Sep 2026
 09:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com> <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
 <2dcc0fc1-6e71-41cd-815b-bca5d3517a65@oss.qualcomm.com> <CAC-tS8DcSuhefOMwEzKdcAHrkjh450pG7bFjKkhbdRi0zHgdFQ@mail.gmail.com>
 <b7fd71fa-703d-4508-824d-a9816a1e7494@oss.qualcomm.com>
In-Reply-To: <b7fd71fa-703d-4508-824d-a9816a1e7494@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 22:01:06 +0530
X-Gm-Features: AcwNN1Uh9bB4S11ithQu0Q4MNVjip4sbUP9vJMJ7eTGO8R3TYdzVDu8Xors9K5s
Message-ID: <CAC-tS8DO4Eph+obOU5jxwfX99gZ5Jat0PpD+CcpobJip9rGW2Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0NSBTYWx0ZWRfX27hATtwNDdwl
 S3dffK9BHc6ExgEtRmIwfEWHGbCwmHdDlRAOfo1PZtR9wsLZttz2qTetwZUa6oofetxfGiTDBMn
 vayPj8tlrTOEUXcNATGNggPeleQ8LjU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0NSBTYWx0ZWRfX9b8fWErhYgEq
 fkcZIrqUTXDG0cPT1j9Oc4U2mNUrxXrO6JEfbRtFcFDd1gG1He5autHMquX21qnvus/X6g8ao32
 K3bTCE0hNoGFf96fPN+vjFRx+XnHrxsmikorDtzzYSlE+w0n+qraDg9MXXr9SpnZrHdBV5Cwe+8
 v0Md70+TQ/+7AljGQh2Cj4spLM4bSh/zfuPH617vCUXNQjuWlsqdqO43CZMNkOX9GA7N4WqEXDr
 AfJ5KGYaVGYKf4eIEmuyx53r+XKOB45mt3M9yZfGNUhdn6YCQKBBkochgJn8UnGDXJZt+zJpwo+
 YnaupE2vo7uyVe5g4Ach8Ke2aGp7V7TTk1IL298rra669heJnwPdnUC63xYh8U1cpaKOuh77GA2
 RgIDeUGrD4Lz/gArKCJAdY61HVAta7u0DmdzkxJs5G0aNHn7jtb79SjC+vTCz1gWrHPRT6aagOA
 8NFIydcNEla8HjMnc+A==
X-Proofpoint-GUID: 6aJKLJqZZd5bCs_Zwl09ZA9G_BLh5dn8
X-Proofpoint-ORIG-GUID: 6aJKLJqZZd5bCs_Zwl09ZA9G_BLh5dn8
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96fdd9 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=oDxv99porRbPmQQDQpgA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010145

On Tue, Sep 1, 2026 at 8:26=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> On 01/09/2026 16:46, Harendra Gautam wrote:
> >>>> The DT binding filename and compatible string do not match (qcom,qai=
f-cpu.yaml vs qcom,shikra-qaif-cpu).
> >>>> Usually DT binding filenames are aligned with the compatible string =
for clarity.
> >>>> Is there a reason for the naming mismatch?
> >>> The filename reflects the controller; the compatible is
> >>> variant-specific. This follows the same convention as
> >>> qcom,lpass-cpu.yaml.
> >>>>
> >>
> >> There is no compatible for controller and the only top-level compatibl=
e
> >> listed there is "qcom,shikra-qaif-cpu", so that is your filename.
> >>
> >> And I already asked about this in v1. Why does this have to be repeate=
d
> >> at v3?
> > The QAIF hardware IP is the same across platforms, only the board
> > integration details differ. The binding is meant to describe the IP
> > generically, with board-specific compatibles like qcom,shikra-qaif-cpu
>
> The binding does not describe the IP generically, because bindings are
> not generic.
>
> > used to distinguish variants. I had qcom,qaif-cpu as the generic
> > compatible in v2 but removed it in v3 as I was not clear about the
> > guideline. Could you please suggest the right approach for the
> > compatible and filename in this case?
>
> Same comment, literally as v1.
>
> Filename should match compatible, as in this case since it is single
> compatible, filename should be equal to the compatible. So first you
> determine what is your compatible and then you copy paste that string
> into the filename and $id path.
Understood. Thanks for feedback, The filename should be
qcom,shikra-qaif-cpu.yaml and the $id path should be updated to match.
I will fix this in the next version.
-Harendra
>
> Best regards,
> Krzysztof
