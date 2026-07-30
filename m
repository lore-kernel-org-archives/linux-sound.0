Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F43E42317C
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412774; cv=none; b=HQQLwr5+4D3wujgOpEJWvzxL0AeqzoYM+UoiY75AEzTJB0F9KcDmKW43NbLMRqjNPn0t5orNuWrVBJCyz3eLWtuZUKixeb6JIUVWq+IWNVJf/vV/lbdX09CtpTpifEYm/4mhQc2Gle2+wyVdqcec4LY7zTglgEifoLL/4JskjCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412774; c=relaxed/simple;
	bh=NoxRCcgEgb06epQxvvw2a85CLBOzEBByEaQUWYnXeDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bd4AK7PBey27ze9r6/3uPiK2WIVHtxNHVtegrvSnA+sZFkVSO1jE5zoLRKkDzbtW3XaVuN2R8lmqiE2JH3HgJJyvQbRrBqf0WyXMYxjvdldytlpovgo7qXTUxx1JBpuekmEgsHY1TsujT822/vDsHnPTtLwXBEScZ363xoNDflo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hgf4Or5+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gwHvC/Ca; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hgf4Or5+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gwHvC/Ca"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UBc9TO846861
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 11:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FBp2w12lai0FjiEpU3v2YGIn15VLtuFjmO2fx6m51K0=; b=Hgf4Or5+CB1nNkn1
	ZfCPnnCqJ1dMySNQ/AZF38CTRN27kGa/vGd6P7EM1+zKce3eDJ7avdCXTJttIhsY
	2PjFvvmR/zlzxWCDuvoUO9WlHMV/L0AkaEQs4MwUivlrx+QgrLuxC/KutmE+E2pR
	8MRjEFh5nqFZqWTHwTAmjYJHINM5kyfJimT42icbAxsVvR+id9THGNTET3nbK1HE
	6ODWwjUJVBAnZDO/cCknpfS+r/FMF1jWTvHTL4lYXUnzwcfOT1OEbpIwwS/Qs7m6
	gmz5djwVSeDw1sSitCYxQYqPEvJFGGNRusaDdNb31a0Hl2JINsnmz9yRiYJgjCue
	OBNBmQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5wqg2j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 11:59:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so22032791cf.1
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 04:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785412771; x=1786017571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FBp2w12lai0FjiEpU3v2YGIn15VLtuFjmO2fx6m51K0=;
        b=gwHvC/CamFiyMY7tfpb4jyUD4zHTAuP2jvIvOlxV0pDBbqwn2dSRp4sbc3RSfgYErB
         j+VpiW5/cXSR7EuWWrjkqs+OxAjpN7rE7Ld5F1Ka0cePLLbJ8iectWnVoFWzHx109LWF
         gNCsyZJzAvc4FtzppLirwV8rtQKI5mKDMJcMrVjBQEdOLg7emPYuOzxb9pyf/vI5OEOy
         ghzVF7IMoDg2ASaurLinBymcoG6r1Ed2586cwzmxBdP3HkyLcoGUVtnezcqVhnpD5poi
         c5BjzFquajtYdMDcxtFJtcma98mCYJ388QA9K/WkkvAhONOzRXdbt5Sqb1Gn1AKLeBrf
         zVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785412771; x=1786017571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FBp2w12lai0FjiEpU3v2YGIn15VLtuFjmO2fx6m51K0=;
        b=ot4zHuKjk+muFzYEj5lzYCEeNDJnKfLoGBWpN3wggPpf/icYSN6gexp+/RuZXIX3Ae
         MLdx+GNbqcFxjkHE0BeXusqkNEuD9ds+LI+/c4JsCaV/mp+mZwlTzU34VlMKcxunNn0g
         1jtoqPsraTLefUgwD8JSqJTWbpQqt20ylItVl/EFkih5LNrFAE4/JPWn0qehOyG9Z4AD
         gs/pbItBzvboV/48ptFv6WeNW88nVy6kvpYKuix5XT1H0jTUt7QZo1Tu9LYpIUjpq2ec
         OyKHq951e3nyZFwSwi0BJJQGzcV5WjZByW0NF/fuVLhivxatcYxX3TLqMzBOO+gDErd1
         JVbQ==
X-Gm-Message-State: AOJu0YwYDZDwqUzkTKJ/KeUgQn2fc/rff3m7w7g9eV2C7ZJ/yr2JSZUn
	Qg4zuYEZYrcO7PbxZFMeFkPWD4J3qmg8XMYxYsmSBcMRg2EJoK/VRvS+LDjxjOWCRscP+2ZE9Sd
	3+i0uHSXYO/DyhEfgFNPMGBx+Xa8Z+KrRyP+/CQI0ST3CGFb2uVFWeAdoSSveqUZcyhJYap5NHA
	==
X-Gm-Gg: AR+sD10maFt7C3h3E0QdqAwvELIsXClV9hjWtOKU+brzZw9iguaAHrL/4WM5LgMQzgB
	0X1OVoaeHaHMZqZ/QjDAoECRVZPYaQ25nNCONQDsaKkzOb5rBHlI4yYXyUszLf2DGYFbVp3K2tX
	JoALcgRx9tbm/HNNauiVcY4AoMSN0xT6V319C0wmeR6+yihc3iILazgSKo09CVuxQ83EBZ/JGfF
	rvKPPVqXrMD3YMlaAoIfF6Yw2w74A8d9Kny7WUS6Tds1kaXcHZp5fWqQveOvKfl5w5VWjhEz94d
	U8EeVSPdcc24Dyw93NPzTFtSPYC9aDIXxbUu3hqiKUEqvwGV+YWr/AiqAG8F6gmhuBmANQE0ZZX
	TvTmHiQk7sorQ/bFGaPUSLrIfmp8=
X-Received: by 2002:ac8:6f17:0:b0:51c:7b13:62f9 with SMTP id d75a77b69052e-52b38742986mr24485441cf.79.1785412770630;
        Thu, 30 Jul 2026 04:59:30 -0700 (PDT)
X-Received: by 2002:ac8:6f17:0:b0:51c:7b13:62f9 with SMTP id d75a77b69052e-52b38742986mr24485201cf.79.1785412770205;
        Thu, 30 Jul 2026 04:59:30 -0700 (PDT)
Received: from [192.168.68.105] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c1fa8577e6dsm59312266b.22.2026.07.30.04.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 04:59:29 -0700 (PDT)
Message-ID: <ee25f647-33dc-4a55-8959-e658c53141d4@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 12:59:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] ASoC: codecs: lpass-{tx,wsa}-macro: fix enum
 kcontrol accesses
To: me@dawidwrobel.com, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260730-worktree-lpass-tx-macro-enum-fix-v2-0-6d091c736116@dawidwrobel.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260730-worktree-lpass-tx-macro-enum-fix-v2-0-6d091c736116@dawidwrobel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5MCBTYWx0ZWRfX2ik7cU79Muxy
 EfeUM8mNcHDMZcMFG43kSfxn8NSsohddDSEgfkmsy2uPtPEfs3fZSP03eq65fXAKr8X8kPTnF0T
 sZ6VyI/9dNoMpTuS7QHxqxFX2kd0+3w=
X-Proofpoint-GUID: CQNYxSOzTQ_McXOcJ1ee978zEPYRQbZL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5MCBTYWx0ZWRfX9bbXc6zzfGMd
 ZM0A3mOEg2X/1/oHHYQx1oR1SsBaP+lRU6ymfZZFAqEdaaZPTmfttD3R15r0WCrDmNDCHs9v5WU
 9Y5Eqy7Bo/JauCB8mPlv+torcfiTdZKZBIygMbPsJaU+nMD1yFZ+cGXawE+AKTW9PMBgcVTBIrv
 sgENhONP6snYHxX5d5/BmSDQp1iJOal49FyXlCgqNbR41JDXEtrAqtLOJVck+IQcDJQsexds8dq
 0X3DQz7UQ0LcuzhDfZUhqY6myWTULlhyaBQv83bLzZi6jRI4+giPcE87p1L10AI6isuQOK1fJ3n
 uWrBGGLvCcHBAwXtFh0cl5H6caRip3wc9xW/DiDLTXiObW0RJpHXZbpR0Le3fVCHYokXm35lSFV
 +EhFjOQ0/T2N62P1wpaFN92nkQ+3OKR3pRH3Sveg3yp4ai9GKFqZvAmLwPrPVMkid9/DF2EWG5g
 lHcpDXk8txTelnPdU4w==
X-Proofpoint-ORIG-GUID: CQNYxSOzTQ_McXOcJ1ee978zEPYRQbZL
X-Authority-Analysis: v=2.4 cv=B92JFutM c=1 sm=1 tr=0 ts=6a6b3ca3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=br21HGidAAAA:8 a=EUspDBNiAAAA:8 a=pIAsNjLqZIIOTrGnJRYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=rq5_1Q1BYlbxkLLkNd_B:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300090

On 7/30/26 11:58 AM, Dawid Wróbel via B4 Relay wrote:
> Both drivers access enumerated controls through value.integer.value[0]
> instead of value.enumerated.item[0]. The same bug was fixed in rx-macro
> and va-macro in 2022 (bcfe5f76cc40, 0ea5eff7c606); tx-macro and
> wsa-macro were missed.
> 
> On 64-bit kernels with CONFIG_SND_CTL_DEBUG this trips the elem value
> sanity check, and every read of the affected controls fails with
> -EINVAL.
> 
> Reproduced and fixed on a Xiaomi Mi Pad 5 Pro (SM8250) for tx-macro.
> wsa-macro is compile-tested only — that codec is not instantiated on
> this hardware.
> 
> Signed-off-by: Dawid Wróbel <me@dawidwrobel.com>
> ---

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> Changes in v2:
> - wsa-macro: also fix wsa_macro_rx_mux_get() and wsa_macro_rx_mux_put(),
>   which have the same bug (Srinivas Kandagatla)
> - Cc stable on both patches (Srinivas Kandagatla)
> - Link to v1: https://lore.kernel.org/r/20260729-worktree-lpass-tx-macro-enum-fix-v1-0-0cf02c681332@dawidwrobel.com
> 
> ---
> Dawid Wróbel (2):
>       ASoC: codecs: lpass-tx-macro: Fix enum kcontrol accesses
>       ASoC: codecs: lpass-wsa-macro: Fix enum kcontrol accesses
> 
>  sound/soc/codecs/lpass-tx-macro.c  | 4 ++--
>  sound/soc/codecs/lpass-wsa-macro.c | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> ---
> base-commit: 57b8e2d666a31fa201432d58f5fe3469a0dd83ba
> change-id: 20260729-worktree-lpass-tx-macro-enum-fix-c5fbafef75b6
> 
> Best regards,

