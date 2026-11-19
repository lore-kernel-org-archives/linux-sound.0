Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093443;
	b=eu/6eLJucYWZCUw7ghLa98er5rvv2KgwJlREXHLKWSqgClha0QyfgjNsP6yvZGTbWlwR
	 5uojS4qoMdgO4UATxjm/Lqo3LUicSsTQ6Bjk1w97gTA/lNlxgXuhG41ELrjTdKe+IdysL
	 +HlOY9ruP1QC50vIew6H1v8rYOu6L6W5SogMJDIKeLvNIv/jDWEz1HKBAkojWjQvlTP2p
	 h0gFKl+PaXzaBvybQDUNie44lGOoj8SIRVvssa98d1dDBLSxpZBWaOUCUKEZ2lUejdp7f
	 dnX1dVn9BqP+08kvWhCgLbocIngz462gh8zsPCyg5RtF+nmeyevJn8wwVSpjpbOdMZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093443;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NNLIPe6CMR9S1yJHo8H9LuDUKqcNXmWob3sAk1EUcoI=;
	b=ucZ9tP5ge6KG9FCxHjxKCMYL6eXiAoli0Ie0RlpYCZEVyZmL1yf7WO6QM/q+SwJ4aLGw
	 EQeJ0vuS/F32N49Sy+U56DqRHGMq98DJR0KHk0PBd5QS2toEtKFSeH2xtziVO2sAk/zLo
	 Dw0Dei0UpU/ko6FlhJXKJGnImNIRNcDDnpPTdPRanB0TIPNedy36ZWDmAlwMQP9Z02bj4
	 5/NR7b94FimLpnr9hyjhbC6uZCtUR9YLTwTQBCiMk/sVaIoNSQTLkbM4dl6fV2mOw8YEF
	 zScUyu/nNpk2HmkHL/nB3CsbpY+f4Qd9IU4iR95sDlFpJzUOgtBp3w2yESa9NuW1AFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JjK3oGQY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C3060A2606
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 13:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JjK3oGQY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF35F1F000C4;
	Thu, 19 Nov 2026 13:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795093443;
	bh=NNLIPe6CMR9S1yJHo8H9LuDUKqcNXmWob3sAk1EUcoI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JjK3oGQYNhtlNIPiZ+dTfpeERw8Sbs4bbUa33KrM68edcKjjiL53fCSYyuhCSmFBO
	 RBIHhvKXWshI+WvmoHKAeQS82wINfdrZRSvXvW5brdtxURkCULAoJ8+Ztx5Ra1+ebG
	 iLnSfya1AX0+HcvE3gEiM0c1irXY4DLqfrC/kcnUx1gho6UBWL4guHLs8X1bgsPWp6
	 df9lZ8fGEGADxX8v5dJ8qx0UNWymhV9gOMwMdgANFzFtYda91y/yylJdvvaavS5Dw8
	 I0q3CYuqnd0GVf4QjuGMq+SVkj7lKQCGV4f4guAU3NOHns8ltd9SAyay/+m+YawW6i
	 mTIb/5gyPgU7Q==
Message-ID: <sashiko-outbox-223133@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH -next 1/2] ASoC: SOF: ipc4-control: Fix out-of-bounds
 backup restore in bytes ext put
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ye Weihua" <yeweihua4@huawei.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261119121446.124833-1-yeweihua4@huawei.com>
References: <20261119121446.124833-1-yeweihua4@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 13:04:02 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] ASoC: SOF: restored scontrol->size overwritten in
  sof_ipc4_bytes_ext_put()
- [Medium] ASoC: SOF: scontrol->size not restored on EFAULT in
  sof_ipc4_bytes_ext_put()
- [Medium] ASoC: SOF: ipc4-control: incomplete backup restore when
  priv_size is 0
- [Medium] ASoC: SOF: ipc4-control: incomplete msg restore in
  sof_ipc4_set_get_kcontrol_data()
--

commit 3d54ef5fbf4ff729417838f0907d7062db9c4154
Author: Ye Weihua <yeweihua4@huawei.com>

ASoC: SOF: ipc4-control: Fix out-of-bounds backup restore in bytes ext put

This commit records the backup size in old_ipc_control_data_size to avoid an
out-of-bounds read when restoring bytes control data, restores msg->data_si=
ze
when replaying the backup, and moves the scontrol->size update in
sof_ipc4_bytes_ext_put() until after sof_ipc4_set_get_bytes_data() returns.

> diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
> index e29c8d89284af..f8b4842f39365 100644
> --- a/sound/soc/sof/ipc4-control.c
> +++ b/sound/soc/sof/ipc4-control.c
> @@ -58,6 +58,8 @@ static int sof_ipc4_set_get_kcontrol_data(struct snd_so=
f_control *scontrol,
> =20
>  	/* It is a set-data operation, and we have a valid backup that we can r=
estore */
>  	if (ret < 0) {
> +		struct sof_ipc4_control_data *cdata =3D scontrol->ipc_control_data;
> +
>  		if (!scontrol->old_ipc_control_data)
>  			goto unlock;
>  		/*
> @@ -65,9 +67,18 @@ static int sof_ipc4_set_get_kcontrol_data(struct snd_s=
of_control *scontrol,
>  		 * configuration
>  		 */
>  		memcpy(scontrol->ipc_control_data, scontrol->old_ipc_control_data,
> -		       scontrol->size);
> +		       scontrol->old_ipc_control_data_size);
> +		scontrol->size =3D scontrol->old_ipc_control_data_size;
>  		kfree(scontrol->old_ipc_control_data);
>  		scontrol->old_ipc_control_data =3D NULL;
> +		scontrol->old_ipc_control_data_size =3D 0;
> +		/*
> +		 * If the message payload points into the restored buffer, its size
> +		 * must be restored as well, otherwise the last known good
> +		 * configuration would be sent with the size of the rejected data.
> +		 */
> +		if (msg->data_ptr =3D=3D cdata->data->data)
> +			msg->data_size =3D cdata->data->size;
>  		/* Send the last known good configuration to firmware */
>  		ret =3D iops->set_get_data(sdev, msg, msg->data_size, set);
>  		if (ret < 0)

[Severity: Medium]
Does checking msg->data_ptr =3D=3D cdata->data->data miss generic bytes con=
trols
(SOF_IPC4_BYTES_CONTROL_PARAM_ID) and leave msg->extension un-restored?

When data->type =3D=3D SOF_IPC4_BYTES_CONTROL_PARAM_ID,
sof_ipc4_set_get_bytes_data() calls sof_ipc4_set_bytes_control_data(), which
copies the new payload into a separate msg_data buffer and sets
msg.data_ptr =3D msg_data:

sound/soc/sof/ipc4-control.c:sof_ipc4_set_bytes_control_data() {
	...
	msg_data->id =3D cdata->index;
	msg_data->num_elems =3D data->size;
	memcpy(msg_data->data, data->data, data->size);

	memcpy(&msg, &cdata->msg, sizeof(msg));
	msg.extension =3D SOF_IPC4_MOD_EXT_MSG_PARAM_ID(data->type);

	msg.data_ptr =3D msg_data;
	msg.data_size =3D data_size;

	ret =3D sof_ipc4_set_get_kcontrol_data(scontrol, &msg, true, lock);
	...
}

Because msg->data_ptr points to msg_data rather than cdata->data->data, the
replay call re-sends the rejected msg_data buffer and size instead of the
restored backup.  Even when msg->data_ptr =3D=3D cdata->data->data,
sof_ipc4_bytes_ext_put() overwrites data->type from user space before
sof_ipc4_set_get_bytes_data() sets msg.extension, so msg->extension is not
restored from the backed-up cdata->data->type either.

> @@ -630,6 +641,7 @@ static int sof_ipc4_bytes_ext_put(struct snd_sof_cont=
rol *scontrol,
>  	struct sof_abi_hdr *data =3D cdata->data;
>  	struct sof_abi_hdr abi_hdr;
>  	struct snd_ctl_tlv header;
> +	int ret;
> =20
>  	/*
>  	 * The beginning of bytes data contains a header from where
> @@ -686,21 +698,25 @@ static int sof_ipc4_bytes_ext_put(struct snd_sof_co=
ntrol *scontrol,
>  							 scontrol->size, GFP_KERNEL);
>  		if (!scontrol->old_ipc_control_data)
>  			return -ENOMEM;
> +		scontrol->old_ipc_control_data_size =3D scontrol->size;
>  	}

[Severity: Medium]
Can backing up and restoring scontrol->size bytes leave cdata->data
un-restored when a bytes control has no initial topology payload?

In sof_ipc4_control_load_bytes(), scontrol->size is initialized to
sizeof(*control_data) + scontrol->priv_size.  When scontrol->priv_size is 0,
scontrol->size is only sizeof(*cdata), which stops before the flexible array
member cdata->data (struct sof_abi_hdr).  kmemdup() then backs up 0 bytes of
cdata->data, and on failure of copy_from_user() or iops->set_get_data(),
memcpy(..., scontrol->old_ipc_control_data_size) restores only sizeof(*cdat=
a)
bytes, leaving the rejected ABI header and payload in cdata->data and
replaying the rejected cdata->data->size and payload to the firmware.

>  	/* Copy the whole binary data which includes the ABI header and the pay=
load */
>  	if (copy_from_user(data, tlvd->tlv, header.length)) {
>  		memcpy(scontrol->ipc_control_data, scontrol->old_ipc_control_data,
> -		       scontrol->size);
> +		       scontrol->old_ipc_control_data_size);
>  		kfree(scontrol->old_ipc_control_data);
>  		scontrol->old_ipc_control_data =3D NULL;
> +		scontrol->old_ipc_control_data_size =3D 0;
>  		return -EFAULT;
>  	}

[Severity: Medium]
Should this error path also restore
scontrol->size =3D scontrol->old_ipc_control_data_size, like
sof_ipc4_set_get_kcontrol_data() does?

Because scontrol->old_ipc_control_data is kept across successful updates
while later updates change scontrol->size, a copy_from_user() failure on a
subsequent call restores the older backup into scontrol->ipc_control_data
without resetting scontrol->size, causing the next sof_ipc4_bytes_ext_put()
to kmemdup() the wrong size.

> -	/* Update the cdata size */
> -	scontrol->size =3D sizeof(*cdata) + header.length;
> +	ret =3D sof_ipc4_set_get_bytes_data(sdev, scontrol, true, true);
> +	if (!ret)
> +		/* Update the cdata size */
> +		scontrol->size =3D sizeof(*cdata) + header.length;
> =20
> -	return sof_ipc4_set_get_bytes_data(sdev, scontrol, true, true);
> +	return ret;
>  }

[Severity: Medium]
Does this overwrite the restored scontrol->size with the rejected payload
size whenever the backup replay succeeds?

When the firmware rejects the new payload in
sof_ipc4_set_get_kcontrol_data(), the recovery path restores
scontrol->size =3D scontrol->old_ipc_control_data_size, frees
scontrol->old_ipc_control_data, and calls:

	ret =3D iops->set_get_data(sdev, msg, msg->data_size, set);

When replaying the backup configuration succeeds, ret becomes 0 and
sof_ipc4_set_get_bytes_data() returns 0.  Then if (!ret) here overwrites the
restored scontrol->size with sizeof(*cdata) + header.length from the reject=
ed
request, so the next sof_ipc4_bytes_ext_put() backs up the wrong size.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119121446.1248=
33-1-yeweihua4@huawei.com?part=3D1
