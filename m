Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF973911C3;
	Tue, 12 May 2026 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591251; cv=none; b=I5uqZ6JRJOGpa92Gk5r9jyZffR/SHcm2pOEL5ltS0TCvf2QnzrX9AAyXg+meik5fPn4Tg7hoWeadjiLaNFEDHv2Pbq6xsgSoVkj1kb/ovZid/LQZth5Z1qcyOADLXQNDLVZblU3lq6CtFYMXIu6lKrJfTxAcHo+xuO1asopWAGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591251; c=relaxed/simple;
	bh=wJV7N9XcmK+hpy7gFvZh6QXw4dYmdOo3zik0+hIVWbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QPyMISXkvWyZ7bR+hL5XC5lpLDfNRop/nr1gJLneiZdDaHBOZoA3zlIcc+byf8vXb2VPMB32wFU48cenzHpH43Dy2ELKsnp2Wk4zz4Y3wHTD8enrYWjXSllx76wzFZCK5PcHTISrTGC2whtNejnySUu0JKfHKCnZOUMNprjCclo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=h6jPvYQS; arc=none smtp.client-ip=212.227.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="h6jPvYQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1778591241; x=1779196041;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=D0s/KD2IpRb95uwf73OOnkeaU0LfJKqUCJ83jNwY8QY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=h6jPvYQS2g9oratxEjUtaTYagjqowZRCQRP1JvyiQebJ4SIOGOZe3swbtr8HDowm
	 aClegaCmKsxhSH/itbA+CqWNUmWGTtdlAUg2FWd403OoI5u++4k9DvmiIEMrhxLON
	 YvD9Oaj8/ERZclHBRVI/msU7MnKUnyk4E6QoqPXKtwReHYqfzgyYp09mMz5dCXIiI
	 lLD/vFhfdyopTvbhReVFA0GHP4Vy4YBL/ulvCVjOxUaX1OqoLBQMzhZqtXDGuTnFh
	 7IYLPUcovZ3Vt2F2PVcfiAKLIHJDUcH0baK2TsVNkJyEs7IFqsdeJj1tCISxkKyWa
	 QZbdkPMFvbZTZeGZ2A==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MJm8H-1wgOB61OKP-00NDwF; Tue, 12
 May 2026 15:07:21 +0200
Message-ID: <4795570b-407d-4daa-859c-61ad0b76a091@oldschoolsolutions.biz>
Date: Tue, 12 May 2026 15:07:19 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v9 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
 mailingradian@gmail.com
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260402081118.348071-14-srinivas.kandagatla@oss.qualcomm.com>
 <7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz>
 <0c6c8db9-b54f-4df0-ae1f-306b7feb6d67@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <0c6c8db9-b54f-4df0-ae1f-306b7feb6d67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BzuHNzZYmgo1U4aSwPbqw2bB0UJPHCnSLaDxy+LP2kkUaO58kS1
 iGb1BDJ5Y7agMruGrnJyecU2cICdm82RrdXccxaWl0r/mzPE8mzkbgBNIG0xdufxAaK3Eq1
 TVUoEcyf7OzSEFbL9lvYwx8NNp/QAEngGw2SsB6QIDgxDpArMgkgRIZRv2DJoP8vviCAOrH
 lfTQ8BtDP+m/fA4eBMRHg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:05O+k9Aoqqs=;10jXEh7FlVg25lOMng/8/RXHNrc
 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
 oTsmk6s8MgkVtF4BRk2rV7vStEnGQ=

On 5/12/26 13:43, Srinivas Kandagatla wrote:
> Could you please test this change on your setup and let me know if it
> helps? If so, I=E2=80=99ll send out a proper fix.
> This is a workaround for a known issue, I will add more details in the
> patch that I will send once we know if it fixes the issue.
>
> ------------------------>cut<----------------------------
>
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c
> b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index ede19fdea6e9..8a1a3d8a3398 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -497,7 +497,7 @@ static int q6apm_dai_pcm_new(struct
> snd_soc_component *component, struct snd_soc
>   {
>          struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
>          struct snd_pcm *pcm =3D rtd->pcm;
> -       int size =3D BUFFER_BYTES_MAX;
> +       int size =3D BUFFER_BYTES_MAX + 4096;
>          int graph_id, ret;
>          struct snd_pcm_substream *substream;
> ------------------------>cut<----------------------------
>
>
> --srini

Hi Srini,

thank you for the fast patch. Tested on x13s with the original (full=20
series applied) and this patch added. Original breaks as reported, with=20
this patch it works normally.

with best regards

Jens

