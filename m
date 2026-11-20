Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160552;
	b=uPDj3AZrOHT/DWvkP6xtTfUMbQ5zvv0qdv7QtiG7ptMLny5d19Cf/V5M7dwF0DU8V7X0
	 SB+zQ6culBZM5smfcmVYexSdVSwyYqqJf8MBnwA5MynETx8wdfzsQkncU/C7nEbA9emN7
	 /+z1bXL+IdzXnu8oF6oREcnCMFDJLfZsQnXrCbD+BnsO6BmVqIEpumf5kw9JgirzY+xwD
	 N1u9Wxlxm8+VPJh0mf/tjzHBq5AW1or87oeiu9TioQIa0PsFCMz1WZp1NAvGI89z5Xw1x
	 B4Eyac/a2j4cXWRDcxoSlRbqSZvohrUfL+AXzJlinf673qHLOZWKI10VZS9Yt+DjDRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160552;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=beTyTTB3jrGVnb4lDXL6jTxGd9XgtEPt03vK5yGukDE=;
	b=e0PH5kA9vULGuQhkJgZAjHiOrKR5B04lfbOXbrR3vEDIeVRwTJmG+FBn1A2OrFseXRKy
	 9qCfdxVhaS566jov+FTmD8FOFb5TpG3/FNVYMZKMrOJ7jt6j2Ww/rYDe4VcVgEKjRjMIC
	 I/nEZpvSz7a7YbPn6yVJ6XS/KUWr3AxTqI9E/7p50SzLyBR0bGxdl2WIbcAxLn4Fgx7Rj
	 z+4Q9+S3Kcx+BPB5/4Iu4Ca9QkVENod+ZH6QGr8QXw4LNWgdFssnlRzHqHdaMZSNdEEkj
	 edtHHdoh3+v19yE+kCmF7Ay1T4T2Ur1ACfN4+aXDpVWyz0j2X+e2d9vnRnl/kO2f9Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ErK6YUmU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08C9606A320
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 07:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ErK6YUmU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4181F000CA;
	Fri, 20 Nov 2026 07:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795160552;
	bh=beTyTTB3jrGVnb4lDXL6jTxGd9XgtEPt03vK5yGukDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ErK6YUmU4Me91bK3iNlMx/gOZAblAfI/dmdKZm733R3DI6hRbT49qZcWiTL2URMXq
	 YI5s7x879ZaCgu44rfTxa8GHgDNsBpCRafUVq8YLoY4qzenr99qsP4WFy1K4wnApMH
	 If6h1XlT9ZiQMglfCDIrvNv82M3vGUOpT36gg2D4Qfxg+mKO+RPlngh+wrJon2nKbp
	 g6PsS07BZZfR2iTnliOUrte77CX2U9tuDKVXDGFVwQ2NgPT1u3VHpftwOArtvSzEx0
	 slpsQwLnSTp+reMCJ/Wx8NFINU5tJeocuGb3oTQnkq3WwtpsqkhIUedTLyTjr5EEJ1
	 QHX9cECxmuisA==
Message-ID: <sashiko-outbox-224651@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] ASoC: SOF: ipc4-control: Rebuild replay message
 after restoring data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ye Weihua" <yeweihua4@huawei.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261120070042.279508-4-yeweihua4@huawei.com>
References: <20261120070042.279508-1-yeweihua4@huawei.com>
 <20261120070042.279508-4-yeweihua4@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 07:42:31 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ASoC: SOF: ipc4: missing size and type check in
  sof_ipc4_set_get_bytes_data()
--

commit 5bb9387ebbc31097ff7ba75b9019b86b70c0a08a
Author: Ye Weihua <yeweihua4@huawei.com>

ASoC: SOF: ipc4-control: Rebuild replay message after restoring data

This commit moves the IPC replay after a rejected set-data request from
sof_ipc4_set_get_kcontrol_data() to its callers so that the message and
payload are rebuilt from the restored backup data.

> diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
> index ace3bf2f719d3..8ed006efe17f3 100644
> --- a/sound/soc/sof/ipc4-control.c
> +++ b/sound/soc/sof/ipc4-control.c

[ ... ]

> @@ -315,12 +314,35 @@ sof_ipc4_set_bytes_control_data(struct snd_sof_cont=
rol *scontrol, bool lock)
>  	msg.data_size =3D data_size;
> =20
>  	ret =3D sof_ipc4_set_get_kcontrol_data(scontrol, &msg, true, lock);
> +
> +	kfree(msg_data);
> +
> +	return ret;
> +}
> +
> +static int
> +sof_ipc4_set_bytes_control_data(struct snd_sof_control *scontrol, bool l=
ock)
> +{
> +	struct snd_soc_component *scomp =3D scontrol->scomp;
> +	void *old_ipc_control_data;
> +	int ret;
> +
> +	old_ipc_control_data =3D scontrol->old_ipc_control_data;
> +	ret =3D sof_ipc4_send_bytes_control_data(scontrol, lock);
> +	if (ret < 0 && old_ipc_control_data &&
> +	    !scontrol->old_ipc_control_data) {
> +		/*
> +		 * The new data was rejected and the last known good
> +		 * configuration was restored. Rebuild the message from the
> +		 * restored control data and replay it.
> +		 */
> +		ret =3D sof_ipc4_send_bytes_control_data(scontrol, lock);
> +	}
> +
>  	if (ret < 0)
>  		dev_err(scomp->dev, "%s: Failed to set control update for %s\n",
>  			__func__, scontrol->name);
> =20
> -	kfree(msg_data);
> -
>  	return ret;
>  }
> =20
> @@ -510,6 +532,7 @@ static int sof_ipc4_set_get_bytes_data(struct snd_sof=
_dev *sdev,
>  	struct sof_ipc4_control_data *cdata =3D scontrol->ipc_control_data;
>  	struct sof_abi_hdr *data =3D cdata->data;
>  	struct sof_ipc4_msg msg;
> +	void *old_ipc_control_data;
>  	int ret =3D 0;
> =20
>  	/* Send the new data to the firmware only if it is powered up */
> @@ -540,7 +563,21 @@ static int sof_ipc4_set_get_bytes_data(struct snd_so=
f_dev *sdev,
>  	else
>  		msg.data_size =3D scontrol->max_size - sizeof(*data);
> =20
> +	old_ipc_control_data =3D scontrol->old_ipc_control_data;
>  	ret =3D sof_ipc4_set_get_kcontrol_data(scontrol, &msg, set, lock);
> +	if (ret < 0 && set && old_ipc_control_data &&
> +	    !scontrol->old_ipc_control_data) {
> +		/*
> +		 * The new data was rejected and the last known good
> +		 * configuration was restored. Rebuild the message from the
> +		 * restored control data and replay it.
> +		 */
> +		msg.extension =3D SOF_IPC4_MOD_EXT_MSG_PARAM_ID(data->type);
> +		msg.data_ptr =3D data->data;
> +		msg.data_size =3D data->size;
> +		ret =3D sof_ipc4_set_get_kcontrol_data(scontrol, &msg, set, lock);
> +	}

[Severity: Medium]
Does replaying inside sof_ipc4_set_bytes_control_data() and
sof_ipc4_set_get_bytes_data() skip the !data->size and data->type checks
that sof_ipc4_set_get_bytes_data() only performs before the first send?

When a bytes control is loaded from topology without initial data
(scontrol->priv_size =3D=3D 0), sof_ipc4_bytes_ext_put() backs up the
zero-initialized cdata->data (data->size =3D=3D 0, data->type =3D=3D 0) into
scontrol->old_ipc_control_data.  If the firmware rejects an update and
sof_ipc4_set_get_kcontrol_data() restores that empty backup, both replay
paths unconditionally send a 0-byte MOD_LARGE_CONFIG_SET IPC with
param_id 0 instead of returning early as the initial !data->size check
does.  Likewise, if the rejected user payload and the restored backup
differ on whether data->type is SOF_IPC4_BYTES_CONTROL_PARAM_ID, the
replay stays in the branch chosen by the rejected data->type and sends
the restored payload in the wrong format.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120070042.2795=
08-1-yeweihua4@huawei.com?part=3D3
