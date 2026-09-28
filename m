Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CDE488236
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 09:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586703; cv=pass; b=kwpwvDlwvUnV6dYCK320Hh9MkdT02409AiAflkQLZiB8onUkL9fgfY+1X9593tmiNeI0CBz/PQbALkGR6yrKwdkRv9FDeERK12fMsHp5+g2v/hpQg7ttlclh22ySOzJRE+gOa16jrLe4kDd1thpqqzufj3RBNjrQAJbctqso/V0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586703; c=relaxed/simple;
	bh=KTENyYqQEJ1QJsUU6WyAiz6HgJhYCr6u0cGxg5uGf9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWN9pspsMritEY0HRlIYWdzHKDbxAxfmHRj1s8RYFhYH7qOAemshWVoqaB/nB/fUfOXsocgZc2Wz1dbodLIccco7uTH6Kmtr2qKiwNYgV265R+dOQWgZzoxJBL6keE+uhds5zJLXbRpsTGB8r+p0E2C7ik3SpiWZi3bAC60jPes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocW9bnWC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nixc8U/q; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocW9bnWC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nixc8U/q"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xTnE062699
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 09:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Klqip8pbOj3w2usVTTkZpv7Y+Lu/sulkIkYft5/eRI=; b=ocW9bnWCtyfDOLpW
	24RrfcaBN2VSok9itSj+FdB/z1HwJYlh8mkkpzn+5p7KHR4dhU/3lspZwD4ofGpd
	bS4OkzdKl8YeJClO77+s2S1jlyVlR5kAVdWG1PRTHTtl8mrX+m35hjUXuJ6lfikd
	D7h9j6hbSunh8SQhdC708muRSNWCy9HHbQGAPqvh4owe3D7BzSPzlD7DMOqoM4gW
	8lDOlS+jWYU0O2672SLTPLUUNLfFXGG7F0BxDyo2Dfd/lKAIFyqWS8iEJhYHhP6e
	P5BuJBGbMApRNMWIo2dmVhlMHr/dPQNgYMFXZ/DGSje+3M/bahkWKArFZPwfqFkQ
	roBfNw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt10mq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 09:11:40 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8848dc67d24so38106927b3.1
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 02:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790586700; cv=none;
        d=google.com; s=arc-20260327;
        b=gzMTRT34RH1YU2jj+Ky1uXiWVCkqKQq92NOCNAadk7qUglpFNPoI/8HzDFgfgwv4sU
         m+sMHNF3IsG3UGqchkF2xmayb7gzmJN3PFEhpXgV7vqlfpH/Isq1saecHKJQSnheEcY4
         0cVR/RAnfP3ykH8E6mhrCdlNL5g8sAateIQQa5P/fWsAv6aiKmkIN1Zxg9uE8FQPukkJ
         8d0WXiJepy1uNV34YpG32qFg8ls/YL7oqPxjX+cgoPXEXrABOSBH7TcSClbxlvNkuYtI
         w65xZreOL4QRc7wGn50AfKiTGWEz9EFqltMlJLrqdPPokAlHHEFm8rE8cUdCxbBysoVC
         G3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Klqip8pbOj3w2usVTTkZpv7Y+Lu/sulkIkYft5/eRI=;
        fh=+WicFj3WzAvighyZIcV9yIW/FrIDVpGJrSirdALlHxg=;
        b=S9alb0gthvTDrKV6mzPAbMpJ9VobQKXntIhAZUReyl4E0RjvT47IrBmnhmNCFhm2AH
         rBUqcBQFonJ8XvCVNX3shVgIbMs7uJmisE8WQxMgr1tR5YlvqYv5OOrW78g5JntuKyQp
         1hg89LYOGd0c4MnfnjpspSpJwcgrGsj0MmDn6Lm4Qw1wNW+sEM45LsIcW0ktaGk5K5kb
         g40JRTWr2gSySBqDilAWRetzhZLu18IXJQr3Czn/zSFA/DCIvtm/4JzNKWxd1VFz5DuE
         BwSmID6JkbvnPcIZFb+NQojpTkTTQwfnEWr/vGzan8P+MPB1Q8A4FpG5VYP5Zet/NNZ8
         1gKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790586700; x=1791191500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Klqip8pbOj3w2usVTTkZpv7Y+Lu/sulkIkYft5/eRI=;
        b=Nixc8U/qhB6n9qnty0EC6TNCzgc5b/Ls5dE82vee1i53LODYVX5+y4m0kq3p5Jr25c
         vYrJA6KLbcyLMB5RzjenpJiZNQ/p/3r3JFPmYur3U2LgicVdBTYrz+Buh9V9EUNGAb0e
         IuNGtU0DCaY+fSd48c3rWkJYQKFbZE9qSBoMEf6T/3QdUpzA2Yaptb+9XPYRJSWY2Lz6
         OWCoIaW601wzbor2krIBiRu9wy4Ipt5F9/cqtf9IUr4XeA4zeH4W8JthUXrj/mlz793x
         v5lum27xsDNCEugUmXhI+VZlvQC4CFJYhqip/4hI41LDA1ebt0bM8013r+pc8tyTvStW
         HTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586700; x=1791191500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Klqip8pbOj3w2usVTTkZpv7Y+Lu/sulkIkYft5/eRI=;
        b=NBqUdPvVJVOlxaX02+NldsHWz+Gzl9uERN+mp4E8CNThQx1fCasWXXwVmSYWoArrjW
         qxKG53sGOVoAX7QZx8ouhwZZXtMnZBRXFnqmae58vgL3T21KhE97Mj3AlxElqHEb1Xin
         BJV2ztl1gXr2e9HFl3GgTD0t8Lqh35ae3CaHcRpA/a7D5PZinXzSUpBsEe4zQhpy49/t
         k7f6AmbqvZr9PzkRqHl8ac5IFF2zdJF4V1mIsu23Ud3PBCsPp4Bk9WglV+nmLirfaNM+
         JEZul1yU1Zz3DB5rJdiF9s7j6yP/y33BSFb2e0eSdT6sYewx5aXkW8FD2EsaprvhyY4o
         KH+A==
X-Forwarded-Encrypted: i=1; AKwUvBya54/SeJO1tVGNYr6/v20q86Eu3FLuLB4ZOEo9UmrxxUR29era5kyXnkTHKCRwwp1UabzshhzWeWhOhQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJwCEzxXBuR9QY1tZgKdc+iqghRshV6BEvclcHG7Si6hk5UlhUk
	PlzxlrqhYRpQ5SxOjpPIiFVgxHBTNrLY1DZUqxpExLw88XXyoyzXzFdkMVA0t7EI2qkwDhfbApn
	6b0UTdZe5WwikVSFeix9ZzlZJFA5VRiN2mOLC6h0e77bExbvXWvQRAkSsOhF5LnVxL38TRG7vOJ
	81UcXo56QeQr89hLtptSdjd+troCLSWQgU+Ug/OjeT
X-Gm-Gg: AYBFou0lL2kOVgr0Dd5d5tzC63URHmkxxzntTzdDsEm+TMSeG+7P5fOsMjUr2XLw1EP
	VYnmQwZKX2XfwIVmgbMdNTJ2YV9tRPdO3EFG8tZaPCTYIJ76clOVl8Wr695QIyN3muxHTp89Lu3
	0tqvqH+pfsZZ7fLsPL0O7VicHkmH3rK14zE4Tn4oZ2IiHN04T+Iymh/BrVtu8=
X-Received: by 2002:a05:690c:6610:b0:884:c7df:fd25 with SMTP id 00721157ae682-8a64b527551mr64705507b3.17.1790586700378;
        Mon, 28 Sep 2026 02:11:40 -0700 (PDT)
X-Received: by 2002:a05:690c:6610:b0:884:c7df:fd25 with SMTP id
 00721157ae682-8a64b527551mr64705327b3.17.1790586699978; Mon, 28 Sep 2026
 02:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-2-d5b6f056568e@oss.qualcomm.com> <arOcDLy_ESS6Qwcs@sirena.co.uk>
In-Reply-To: <arOcDLy_ESS6Qwcs@sirena.co.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:41:28 +0530
X-Gm-Features: AclHuK9E6ayaYE_Y95ZKtkfHPWfcu5v3kwH1jhnosx1aL68qwy7Agii-WL47rOs
Message-ID: <CAC-tS8AbBcN98ceaLFJaAt_+d6T0C5dpSSkRz_9yJv64KhE3kQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] ASoC: qcom: Add QAIF shared data structures and
 variant interface
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfX2jbNw9DrZXVx
 RG4n9ArLEbf8G67XcNPBtqndw7+aV6OfrR2N2yw6cPP6tIthwHyB0iKVstz17lfgyfg8zq315Zm
 F6sbDtqvcp4QmyZX5f9gphvD+3kzbRRDx8rnPu+JnxJQjyWti9xJr4qPOtdjDDvblhOALQfaGnt
 mM9HYm2B+SrtvwF8lkpdj2kHz91SBmAcTS0xkhA0v0fLC78bcHUs0xP9tgxazIqvCxQyNRlh9yz
 qOoEPDNyHTQZIaVuSS6EiqGQVFQ13pJKDQ8rod89cQ42FMB5v1IMBWOu6dKYRFyo4NgU8K2qWn3
 pSW6maY+AXsXmFUj26bK7+InI46zyZWp5HCohD9vPB2yXMEZf7wLb1nl3kL86Wf0U6ZJMO/Uwif
 CYRZD7Xqg3ToEndue+PJa3txahdjkyGAE+HE2YeoQAtbovlq294ALJGlUyanHEhZs7I2W7yPBGN
 vjp7SRsi217vEPWRL1w==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba2f4c cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=_qd6ERi7e6bvJ_0A4_YA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: F4-jZXI-fZfDLICpk9K5prFAdDmHJlvA
X-Proofpoint-GUID: F4-jZXI-fZfDLICpk9K5prFAdDmHJlvA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNiBTYWx0ZWRfXxXQ9Gs2KBn3j
 AzYNtRC8uli6X/ut8krosvzLClAWgkYm7Ha02a/73IOVdonUyYNXQKqEOOH9RA9udY+IaKa7BGy
 V23KNJcrYET7uShaDvjzWfnKVkxwmz0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280036

On Wed, Sep 23, 2026 at 3:00=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Sep 23, 2026 at 12:18:22PM +0530, Harendra Gautam wrote:
> > Add qaif.h to hold common definitions shared by the QAIF CPU DAI and PC=
M
> > platform drivers.
>
> > +struct qaif_variant {
> > +     u32 rd_len;
> > +     u32 wr_len;
>
> Does anything use these?
Thanks for pointing it out, these dead fields were overlooked. Will
drop both in the next version.
-Harendra
