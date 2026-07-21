Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5254337267F
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641473; cv=none; b=H00IK9Bb8JoaNLcnO54DtasVHafj8po08jSEhHkwHfRxgWw6+7ppN6YfLnxKV7hwjS7Icb19U20UW7OfhqQ24fOIWJ30fTeYj4hDwROf9SmTnzeQ/rbIDTc7a0Rck8TL2GkmBqVtCHxmNCVu8v0oJOHumWaiokh3375cdSY9xYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641473; c=relaxed/simple;
	bh=yLeDKYmUOoBlawlpWT232ipgMlY7u+sWXAVwZRfCty4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJ7Zg8luXN7CHSaIzItlVOuVFoTS+3ZuA9ajWH8+kcbX87u9+lyplCnVwpqCTbrV3CDsJ+w8VXhKi1sqvkC7v53OmBYW8VBDC9e/RMGJUP1okpkDKk1hl6NvlAP6gVcecOo8jUDtpUnXJCKFc99CyiqBMSNJd5YZwXS+i7zLqBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nqiR3p9l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6sew6nw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqiR3p9l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6sew6nw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfpkQ1590939
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 13:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Shns5tcGdxwmLdPVH81yrbqi
	fEUO4I9TByta9UuTXt4=; b=nqiR3p9lDeD82Dpl6scC0UqFkMdA4PJJCCA/awnk
	sd6TXk0iC5BBDhlRH9zUyDDKldT82zJqSF5drraZD8pXdPZYT1pcJ1IGslV7gwO4
	v9fO0LESDhWSTnDpik//k/GmnfgeNNJlFN9s2QBu6j9ds0BfZauPqmswIMlcVR4v
	Or9j4gbmn3aQO6DTEVXQEhKCxNfe7eWAnJeiRggB2o/ZO0tqvVNzCyPlszRniBYb
	+IBh59lsg+AnwpIP2UPqEq3qxkkbYxs4o3TgCM1NCqBCudJeRlHrZQa7J3/WjZw0
	322fwQMWCFbkwd18LX1BZN69QBG1DjyieEgjfskqvHNi7Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as31nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 13:44:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a87ef9713so71530841cf.1
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 06:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784641470; x=1785246270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Shns5tcGdxwmLdPVH81yrbqifEUO4I9TByta9UuTXt4=;
        b=i6sew6nw7ExkldEASR2RN/n4O91HeeMMVf0ArTXYQ96RqHfS1TlhGHY+yHMeSPopL/
         K7LkS3009n6XyomJQ5WqbfUY5s4E5FV7BKKl7jjQFvHQ09Kln45m9ugSuSMvtlKwya9i
         /442Wf/S6X8HMrVDfxvbu9rq0sKOr23vj54eLr1Y4gU+ECji1xGwkgwQyD5NAZdO1rID
         EssjJQwXX3MvrgLvZUvjxi/l2SG11Xm8wWMu3f3q0YihkkGqhIf78shZkV1iMHE7nvH4
         nI/jOuQJuJJoYPDepjUtsoMJgw/4MW2yT5NwhvX9P5wVNgOZ88PTKBAUA+M0WoAceG8h
         QMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784641470; x=1785246270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Shns5tcGdxwmLdPVH81yrbqifEUO4I9TByta9UuTXt4=;
        b=ig8CZ4ykJk6nUOup0jVP6bXWPGDg26DSUhvCZ4sjhsAN5Kg9yERyLQj9HJSQPVmIzc
         4bDcOMYjgD0ZwK3Qrmd+A7Kg6Lfscrgl6U+2I8gL3UN3wzlVhuy+yN4mIWxk2Dn35YL6
         GDUFNPwcWNPqn/JmB4JuseXrcExNXMeO8cdCiOzZVN1nVEcIF43TJwfR4igHcYb2+98b
         AiTToHgZEZ06qxce8JGU0rYQyEDNg/ejR5tFR6mH36SnABfeW/gL3iZuJro1ATz5uoAJ
         qKt3M7820Lo07CuKWzRD8zs3duJoDC4MiCY/m7YUFK7lYmgLLKSXDmvPWRwlBAGjTuks
         6TsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQ05unMhULnNltvCMGMahBBtRuBDnVdVUCK4cBAcP0wfGNnc7I/yZTJXdZVQIut74Lpy9jtqmv5RKb5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvEsvj2nT+3Tjy9FXMg1d2p3/YMtBc/7btW6cfKiHUgKChIFTL
	XR+WWKy+0HN1pYOfx8Di6L3QPCOOuIui9yoei+iV1MfBfzzuEQwX4UO+JjZSAaDi9UeHE5Lw8sG
	9phClIRtpfQ0VEsnhueAwBqAFrLq8XuEWbRU1zQ0bpURaTSEpZM54GeDY5YiTiBdrvg==
X-Gm-Gg: AfdE7ckco1gTmmcjDdjrx5H3GcOpOwu5+AG0Q3SvoeEi1esyy39bFrI9aPxtj5ME/jM
	L0kka3zG5aXAfcRjRk8ZB2PniqbgxAJc99FgkotknxHj/0LMboSROWIhPUm9BB+TRF4DfWWiCMN
	I8WtG1/K3D+9bO/om5y/9+ekea87YfcSeP2vm9/saMFKhrlmjK+oOE5koNHL0D5scAz4Y7pEgJ8
	b8zJ13pCKrka7ou9aMpYcm3wqX09XGKP46M66nnUohkvY1t+c2WJux+dF1XQt+kaZs3axS59f1F
	iNeoC8zvgR6/Yx7WkoDFsUbqdIeewnmdekyUUnlT9ha6HbDpHh3zyKytyqNnPlKSPiCRDzspHTh
	nr8Z/Fc7iBZ2YkmhJ5cwZXtxjXD7F/jBTETRblritj/IT7K8JeuhznOvrJxzfvYCrKiEzx7YoIr
	0T44iDnE4gQ6O+mg==
X-Received: by 2002:ac8:5a46:0:b0:51b:fdc0:ddee with SMTP id d75a77b69052e-51fc197586emr209037681cf.30.1784641470526;
        Tue, 21 Jul 2026 06:44:30 -0700 (PDT)
X-Received: by 2002:ac8:5a46:0:b0:51b:fdc0:ddee with SMTP id d75a77b69052e-51fc197586emr209037171cf.30.1784641469841;
        Tue, 21 Jul 2026 06:44:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e0e961sm2928420e87.51.2026.07.21.06.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:44:28 -0700 (PDT)
Date: Tue, 21 Jul 2026 16:44:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: qcom: sdm845: remove unused card
Message-ID: <oi3he7t7q4ds5tdszsdqg2pwvcz6dp44ldatwrjnk2ilby7nvh@74y42eik2far>
References: <87qzkxi0j5.wl-kuninori.morimoto.gx@renesas.com>
 <87o6g1i0i6.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6g1i0i6.wl-kuninori.morimoto.gx@renesas.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NSBTYWx0ZWRfX2FGA1LylISuF
 it9I2bJx138K/spMD3nHx0FIY5ztD0ffxU44vjNKfkigLxxX4RT5UZxdN/X9Y2bjac69Vnax08j
 bBAUFNd1udRV9ihcaudOw6oyavCPu0/Lj/exd2UOb5ZEap5StgD1UXqan5Sj7xUQ/6HuKM95O5z
 x3M57QFnhRUMvupo3FjoDLxb7PoYeKEN84ND1WBGiOJFIRq5GdAEi4gESB8oRCh3U4rJNyuZT1A
 /6AeSJSYlHpXZ9JG7EcRlYeOvEqn0genQ9bk86ilfKYHIvHoGciTGDmXoQlXieYRbadHRxtOb/7
 9x+WQ+JWtvuvnGHq1MD2pxaizCW08j0kPwqNbvOe9cEvoER7v1rtAyqqmffYIa9zaopeQVE0Vzo
 7emk5PNlou8LMKf36Hqz6E3MKIRAhJ8oeWA8l+r2+mKbawUEYOtQwFeoko4ZzjiFt07EezqFpwZ
 H3pjX/TD2vpuc5OH0PQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NSBTYWx0ZWRfXwPQAl4e1suS/
 hN7O9ChIlcEvlBnsu4Kn3SEFcuRqCpeoL3FNzvQvnXyBUw6SuWPwHhxUT5txtY7ylbo9bReONx6
 t2Hw5u4pSKSLeQB0lraGb02tZShva5U=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f77bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=yC-0_ovQAAAA:8
 a=EUspDBNiAAAA:8 a=mSFW0d8dyqmXVUy6iFAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: BzWfXc6kkLVXob2wnXU0rtatAkc4h_j8
X-Proofpoint-ORIG-GUID: BzWfXc6kkLVXob2wnXU0rtatAkc4h_j8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210145

On Tue, Jul 21, 2026 at 01:40:01AM +0000, Kuninori Morimoto wrote:
> It is not used. Let's remove.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/qcom/sdm845.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
