Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D456936F417
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 22:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779315074; cv=none; b=mUI4eYByGF8IBRtWKJUGIEmJYsk3q67FCCaQ6K3u5vGScUk9HOuBOCMOlFFZrtYm/W+EPCX7je2U6Hso+qdkCjWYB3iIKDkwIeXHHj/zxTLEB5tfGLqhJ1GXEDH47i8KsyFqxxcX236BqjVqkq/fLoLNBb5R0mGh2qS/E8joxUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779315074; c=relaxed/simple;
	bh=37M9PUOfQy2p5QSRWIOQGsVGmX9OOYtVM7BVMxAeCXI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=JmK4dFzGyixi73m4C5ZoYgK9sWvdsZiVSHDwy3v2UI10e46kmC2oKxfPoURbRED7QJL1+ax298zCn6LyjSHmTndtF7/LRrzzgBh1TdLJG3OC8CJwBsgS4abaGeIX0u5BKxgz7cwumDSV0mjyNdvcOXC5gi6M0Yv+pw5QjtnDLJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WomUS9xZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WomUS9xZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so42345535e9.2
        for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 15:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779315071; x=1779919871; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XztvXw0EM5mypFKKLP+bYDI+RT7mLsUytHlSi+Ua1b0=;
        b=WomUS9xZcBabBoucqci2fo+RdWAZF7GBLCOzGByDrdGtnYgNI3Z2QEO4AyVX316eku
         1MYsmIGNyKe7rfbax36szSYq260l0FNRzD88vXhqapUEaaaZV0EVJTVo5+dc9uv5vEBu
         jo2/Q7tYJMRTHbNPgUh+DVbVTo8FFJxdXIryMnONLeiZnlUUmOJXAUMLcekblogx3wJQ
         92F/O0QC9Wvp35EXyFThjSzc9p/6fvoRwjcuZ80kNrtWjT1Xtn+Lu2JXKhogpTVQ8feG
         EmncWb238VB5RDVJyWjKxup4l3d7gqoslY+NPJ9vRGUiWMSQYaPfiR632zXA48MTmUzg
         ij0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779315071; x=1779919871;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XztvXw0EM5mypFKKLP+bYDI+RT7mLsUytHlSi+Ua1b0=;
        b=smxlU11EpiOu2xkjv4Bt9IBYHKVk/3COwUZfVvJhv1qNMpCiLYeNMB4zJs/dXbbaFL
         Ixx3rOrRK0VAcqEm4JbvTzNHos8V0aXaYSK+DNY7EChk0WWgH5HpThumWHam31BstiTh
         v7jhiZYRY3yZ5E8gL1CSBIe4JEAz8nrfkVIJX7lOr222+wX4PxhAiRN5kMYu9kFwfKBR
         11rEArSX6trgrk5LPdYzjMjQpg//G3+52giBe2HsZyTaE1D+Ov7E+6qMJs8VnghVmL1y
         xvaC06CE9UlJbstSZx3DFoSfE7skozkId4rmXnaR6IyAFWnj5XsJCECbQDQJqhgbz3r2
         4Neg==
X-Forwarded-Encrypted: i=1; AFNElJ8Vvtn0d68oP8UJD0SOUO+sYWk1s6F4RjLsPEfcb3vG17HchcBqQIT7dSN2ec3YpFWKaxJYk1jo05mJeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK/h14cIzrepHF2aXoFmXXLVA69W6dM/yRIRV3S2+4Ea+3fISU
	kjcaoRegn8C5cdYp30p55Jl7QRP4enrUj5vs/bq6Bl3HxIx9FXy4YVUlkE3xdF7cjAc=
X-Gm-Gg: Acq92OHXS9QX69WYDvxY+rQa12zWLH1SoXm1PD8OhoJ7Wi2vGn0xpPqUv8XxbOGLDb1
	MZKXfmfX3JY6qPtZjA7/1Po+YTx2FbErqt7oW8FhqA61AqQc9YVrothJiMVSeTDwW+MEij/CSRd
	nARkQquRyI/QCpA7kUqxAIfP3eSkheOlwgvn4llDknQ0Ia/R+m1Q2bqhPJmiOieXiYZpJDDTWJa
	gPNES+OjkayJBoXHlxULOtRHqtXZpPieI5x9ksktlc0KOnQ/lwaczdqpmqawZSQYsIyLVp7WQNm
	bM9ZWtUkZpl+DP9DTsOxch8T6MbEfg13AI7qVrf0O5tPxWEubW92YW9vcKsK4Yli9TlRHcLADYq
	LgyrUx9U+hwwDDe36fIa4w4FUk4avlML1VShcA4BZmWSnj0UANk73iOUovpP3tJiA+bBGPD7vLC
	KdEH3Zqh9vSDvMG0Q3pzh0U8tcR63KNYk7bdruSDXFZ9Lmv4pC9sYhFO9+Yflk8qody3R1bNPvT
	09kgUuspwYtaA==
X-Received: by 2002:a05:600c:42d1:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-49036089466mr1297995e9.21.1779315071295;
        Wed, 20 May 2026 15:11:11 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033cdcc01sm23507635e9.0.2026.05.20.15.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 15:11:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 23:11:09 +0100
Message-Id: <DINUJUCEDNXP.2BDISX62IPSQ2@linaro.org>
Cc: <srini@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>, <krzysztof.kozlowski@oss.qualcomm.com>,
 <mohammad.rafi.shaik@oss.qualcomm.com>, <alexey.klimov@linaro.org>,
 <ravi.hothi@oss.qualcomm.com>, <mathieu.poirier@linaro.org>,
 <verhaegen@google.com>, <andersson@kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/6] ASoC: qcom: q6apm: add watermark event support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <broonie@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260519131527.4002526-6-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260519131527.4002526-6-srinivas.kandagatla@oss.qualcomm.com>

On Tue May 19, 2026 at 2:15 PM BST, Srinivas Kandagatla wrote:
> Push-pull shared memory modules can report watermark events when the DSP
> read/write index reaches configured circular buffer levels.
>
> Add support for registering watermark levels with the shared memory modul=
e
> and route the resulting module event to q6apm clients using a new
> APM_CLIENT_EVENT_WATERMARK_EVENT event.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 36 ++++++++++++++++++++++
>  sound/soc/qcom/qdsp6/audioreach.h | 50 +++++++++++++++++++++++++++++++
>  sound/soc/qcom/qdsp6/q6apm.c      | 19 ++++++++++++
>  sound/soc/qcom/qdsp6/q6apm.h      |  2 ++
>  4 files changed, 107 insertions(+)
>
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/aud=
ioreach.c
> index c984b12409dd..e6e9eb2e85aa 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -1118,6 +1118,42 @@ static int audioreach_pcm_set_media_format(struct =
q6apm_graph *graph,
>  	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>  }
> =20
> +int audioreach_shmem_register_event(struct q6apm_graph *graph, int bytes=
, int num_levels)
> +{
> +	struct apm_module_register_events *event;
> +	struct event_cfg_sh_mem_pull_push_mode_watermark_t *level;
> +	int i, payload_size;
> +	struct gpr_pkt *pkt __free(kfree) =3D NULL;
> +	void *p;
> +
> +	if (num_levels <=3D 0 || bytes <=3D 0)
> +		return -EINVAL;
> +
> +	payload_size =3D sizeof(*event) + sizeof(*level) + num_levels * sizeof(=
uint32_t);
> +
> +	pkt =3D audioreach_alloc_cmd_pkt(payload_size, APM_CMD_REGISTER_MODULE_=
EVENTS, 0,
> +				     graph->port->id, graph->shm_iid);
> +	if (IS_ERR(pkt))
> +		return PTR_ERR(pkt);
> +
> +	p =3D (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
> +
> +	event =3D p;
> +	event->module_instance_id =3D graph->shm_iid;
> +	event->event_id =3D EVENT_ID_SH_MEM_PULL_PUSH_MODE_WATERMARK;
> +	event->is_register =3D 1;
> +	event->event_config_payload_size =3D sizeof(*level) + num_levels * size=
of(uint32_t);
> +	p +=3D sizeof(*event);
> +	level =3D p;
> +	level->num_water_mark_levels =3D num_levels;
> +
> +	for (i =3D 0; i < num_levels; i++)
> +		level->level[i] =3D (i + 1) * bytes;

Let's hope that compilers optimize this to avoid multiplication, anyway
it shouln't be a hot path, although I don't really know.

- don't you need a check like num_levels<=3DARRAY_SIZE(level->level) before
this loop? Looking at the code it seems that it relies on pkt which is
allocated using audioreach_alloc_cmd_pkt() taking payload_size into
account. Looks okay but I wanted to double check.

- level->level[] is of u32 types. Can level->level[i] =3D (i + 1) * bytes
overflow?

[..]
> +struct event_cfg_sh_mem_pull_push_mode_watermark_t {
> +	uint32_t num_water_mark_levels;
> +	uint32_t level[];
> +} __packed;
[..]

Best regards,
Alexey
